Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A701B360B49
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 16:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895726E523;
	Thu, 15 Apr 2021 14:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7306E520;
 Thu, 15 Apr 2021 14:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id C8E273F571;
 Thu, 15 Apr 2021 16:02:23 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="Knhbgjpd";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXiI_44iC45Z; Thu, 15 Apr 2021 16:02:18 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id E3ABF3F39B;
 Thu, 15 Apr 2021 16:02:16 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 28185360678;
 Thu, 15 Apr 2021 16:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1618495336; bh=HUvGvtJZTKI9pCxITJ8GmcmOPPy+R6/yE1vuMJh7f+Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KnhbgjpduCkeHgcf2wI2i9cyMxKik9GXp52B8z0erNQbtKVOwIMJOVtng1uvKli/o
 yeyFe57pyrJqACgOmH9xGPg59Mztvb4m5BOenFhDMiKpM09TqbERjzWVJy0Ium2hjc
 jRS376+CriV46SbfEkwyW3Uxev8aDfaTbFyKgx/M=
Subject: Re: [Linaro-mm-sig] [RFC] Cross-driver ww transaction lock lists
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <62e5b25ce7e22633c09fb0242a69d268b3b45595.camel@linux.intel.com>
 <d5ad41b9-0248-285b-8873-b8010e7c8c27@amd.com>
 <YHhBqNKukDlZ2Cld@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <d3960d8e-c9c6-11b4-f7e1-d2340b57ec87@shipmail.org>
Date: Thu, 15 Apr 2021 16:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHhBqNKukDlZ2Cld@phenom.ffwll.local>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDQvMTUvMjEgMzozNyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUsIEFwciAx
MywgMjAyMSBhdCAwOTo1NzowNkFNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pgo+
PiBBbSAxMy4wNC4yMSB1bSAwOTo1MCBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtOgo+Pj4gSGkh
Cj4+Pgo+Pj4gRHVyaW5nIHRoZSBkbWFfcmVzdiBjb252ZXJzaW9uIG9mIHRoZSBpOTE1IGRyaXZl
ciwgd2UndmUgYmVlbiB1c2luZyB3dwo+Pj4gdHJhbnNhY3Rpb24gbG9jayBsaXN0cyB0byBrZWVw
IHRyYWNrIG9mIHd3X211dGV4ZXMgdGhhdCBhcmUgbG9ja2VkCj4+PiBkdXJpbmcgdGhlIHRyYW5z
YWN0aW9uIHNvIHRoYXQgdGhleSBjYW4gYmUgYmF0Y2ggdW5sb2NrZWQgYXQgc3VpdGFibGUKPj4+
IGxvY2F0aW9ucy4gSW5jbHVkaW5nIGFsc28gdGhlIExNRU0vVlJBTSBldmljdGlvbiB3ZSd2ZSBl
bmRlZCB1cCB3aXRoCj4+PiB0d28gc3RhdGljIGxpc3RzIHBlciB0cmFuc2FjdGlvbiBjb250ZXh0
OyBvbmUgdHlwaWNhbGx5IHVubG9ja2VkIGF0IHRoZQo+Pj4gZW5kIG9mIHRyYW5zYWN0aW9uIGFu
ZCBvbmUgaW5pdGlhbGl6ZWQgYmVmb3JlIGFuZCB1bmxvY2tlZCBhZnRlciBlYWNoCj4+PiBidWZm
ZXIgb2JqZWN0IHZhbGlkYXRlLiBUaGlzIGVuYWJsZXMgdXMgdG8gZG8gc2xlZXBpbmcgbG9ja2lu
ZyBhdAo+Pj4gZXZpY3Rpb24gYW5kIGtlZXAgb2JqZWN0cyBsb2NrZWQgb24gdGhlIGV2aWN0aW9u
IGxpc3QgdW50aWwgd2UKPj4+IGV2ZW50dWFsbHkgc3VjY2VlZCBhbGxvY2F0aW5nIG1lbW9yeSAo
bW9kdWxvIG1pbm9yIGZsYXdzIG9mIGNvdXJzZSkuCj4+Pgo+Pj4gSXQgd291bGQgYmUgYmVuZWZp
Y2lhbCB3aXRoIHRoZSBpOTE1IFRUTSBjb252ZXJzaW9uIHRvIGJlIGFibGUgdG8KPj4+IGludHJv
ZHVjZSBhIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSB0aGF0IHdvdWxkIHdvcmsgaW4gdHRtIGJ1dCBh
bHNvCj4+PiBjcm9zcy1kcml2ZXIgaW4sIGZvciBleGFtcGxlIG1vdmVfbm90aWZ5LiBJdCB3b3Vs
ZCBhbHNvIGJlIGJlbmVmaWNpYWwKPj4+IHRvIGJlIGFibGUgdG8gcHV0IGFueSBkbWFfcmVzdiB3
dyBtdXRleCBvbiB0aGUgbGlzdHMsIGFuZCBub3QgcmVxdWlyZQo+Pj4gaXQgdG8gYmUgZW1iZWRk
ZWQgaW4gYSBwYXJ0aWN1bGFyIG9iamVjdCB0eXBlLgo+Pj4KPj4+IEkgc3RhcnRlZCBzY2V0Y2hp
bmcgb24gc29tZSB1dGlsaXRpZXMgZm9yIHRoaXMuIEZvciBUVE0sIGZvciBleGFtcGxlLAo+Pj4g
dGhlIGlkZWEgd291bGQgYmUgdG8gcGFzcyBhIGxpc3QgaGVhZCBmb3IgdGhlIHd3IHRyYW5zYWN0
aW9uIGxvY2sgbGlzdAo+Pj4gaW4gdGhlIHR0bV9vcGVyYXRpb25fY3R4LiBBIGZ1bmN0aW9uIHRh
a2luZyBhIHd3X211dGV4IGNvdWxkIHRoZW4KPj4+IGVpdGhlciBhdHRhY2ggYSBncmFiYmVkIGxv
Y2sgdG8gdGhlIGxpc3QgZm9yIGJhdGNoIHVubG9ja2luZywgb3IgYmUKPj4+IHJlc3BvbnNpYmxl
IGZvciB1bmxvY2tpbmcgd2hlbiB0aGUgbG9jaydzIHNjb3BlIGlzIGV4aXRlZC4gSXQncyBhbHNv
Cj4+PiBwb3NzaWJsZSB0byBjcmVhdGUgc3VibGlzdHMgaWYgc28gZGVzaXJlZC4gSSBiZWxpZXZl
IHRoZSBiZWxvdyB3b3VsZCBiZQo+Pj4gc3VmZmljaWVudCB0byBjb3ZlciB0aGUgaTkxNSBmdW5j
dGlvbmFsaXR5Lgo+Pj4KPj4+IEFueSBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMgYXBwcmVjaWF0
ZWQhCj4+IGFoIHllcyBEYW5pZWwgYW5kIEkgaGF2ZW4gYmVlbiBkaXNjdXNzaW5nIHNvbWV0aGlu
ZyBsaWtlIHRoaXMgZm9yIHllYXJzLgo+Pgo+PiBJIGFsc28gY2FtZSB1cCB3aXRoIHJvdWdoIGlt
cGxlbWVudGF0aW9uLCBidXQgd2UgYWx3YXlzIHJhbiBpbnRvIGxpZmV0aW1lCj4+IGlzc3Vlcy4K
Pj4KPj4gSW4gb3RoZXIgd29yZHMgdGhlIHd3X211dGV4ZXMgd2hpY2ggYXJlIG9uIHRoZSBsaXN0
IHdvdWxkIG5lZWQgdG8gYmUga2VwdAo+PiBhbGl2ZSB1bnRpbCB1bmxvY2tlZC4KPj4KPj4gQmVj
YXVzZSBvZiB0aGlzIHdlIGtpbmQgb2YgYmFja2VkIHVwIGFuZCBzYWlkIHdlIHdvdWxkIG5lZWQg
dGhpcyBvbiB0aGUgR0VNCj4+IGxldmVsIGluc3RlYWQgb2Ygd29ya2luZyB3aXRoIGRtYV9yZXN2
IG9iamVjdHMuCj4gWWVhaCB0aGVyZSdzIGEgZmV3IGZ1bm55IGNvbmNlcm5zIGhlcmUgdGhhdCBt
YWtlIHRoaXMgYXdrd2FyZDoKPiAtIEZvciBzaW1wbGljaXR5IGRvaW5nIHRoZXNlIGhlbHBlcnMg
YXQgdGhlIGdlbSBsZXZlbCBzaG91bGQgbWFrZSB0aGluZ3MgYQo+ICAgIGJpdCBlYXNpZXIsIGJl
Y2F1c2UgdGhlbiB3ZSBoYXZlIGEgc3RhbmRhcmQgd2F5IHRvIGRyb3AgdGhlIHJlZmVyZW5jZS4K
PiAgICBJdCBkb2VzIG1lYW4gdGhhdCB0aGUgb25seSB0aGluZyB5b3UgY2FuIGxvY2sgbGlrZSB0
aGlzIGFyZSBnZW0gb2JqZWN0cywKPiAgICBidXQgSSB0aGluayB0aGF0J3MgZmluZS4gQXQgbGVh
c3QgZm9yIGEgZmlyc3QgY3V0Lgo+Cj4gLSBUaGlzIGlzIGEgYml0IGF3a3dhcmQgZm9yIHZtd2dm
eCwgYnV0IGEpIFphY2sgaGFzIG1lbnRpb25lZCBoZSdzIGxvb2tpbmcKPiAgICBpbnRvIGFkb3B0
aW5nIGdlbSBibyBpbnRlcm5hbGx5IHRvIGJlIGFibGUgdG8gZHJvcCBhIHBpbGUgb2YgY29kZSBh
bmQKPiAgICBzdG9wIG1ha2luZyB2bXdnZnggdGhlIG9ubHkgc3BlY2lhbC1jYXNlIHdlIGhhdmUg
YikgZHJpdmVycyB3aGljaCBkb24ndAo+ICAgIG5lZWQgdGhpcyB3b24ndCBuZWVkIHRoaXMsIHNv
IHNob3VsZCBiZSBmaW5lLgo+Cj4gICAgVGhlIG90aGVyIGF3a3dhcmQgdGhpbmcgSSBndWVzcyBp
cyB0aGF0IHR0bSB3b3VsZCBuZWVkIHRvIHVzZSB0aGUKPiAgICBlbWJlZGRlZCBrcmVmIGZyb20g
dGhlIGdlbSBibywgYnV0IHRoYXQgc2hvdWxkIGJlIHRyYW5zcGFyZW50IEkgdGhpbmsuCj4KPiAt
IE5leHQgdXAgaXMgZG1hLWJ1ZjogRm9yIGk5MTUgd2UnZCBsaWtlIHRvIGRvIHRoZSBzYW1lIGV2
aWN0aW9uIHRyaWNrCj4gICAgYWxzbyB0aHJvdWdoIHAycCBkbWEtYnVmIGNhbGxiYWNrcywgc28g
dGhhdCB0aGlzIHdvcmtzIHRoZSBzYW1lIGFzCj4gICAgZXZpY3Rpb24vcmVzZXJ2YXRpb24gd2l0
aGluIGEgZ3B1LiBCdXQgZm9yIHRoZXNlIGludGVybmFsIGJvIHlvdSBtaWdodAo+ICAgIG5vdCBo
YXZlIGEgZG1hLWJ1Ziwgc28gd2UgY2FuJ3QganVzdCBsaWZ0IHRoZSB0cmljayB0byB0aGUgZG1h
LWJ1Zgo+ICAgIGxldmVsLiBCdXQgSSB0aGluayBpZiB3ZSBwYXNzIGUuZy4gYSBzdHJ1Y3QgbGlz
dF9oZWFkIGFuZCBhIGNhbGxiYWNrIHRvCj4gICAgdW5yZWZlcmVuY2UvdW5sb2NrIGFsbCB0aGUg
YnVmZmVycyBpbiB0aGVyZSB0byB0aGUgZXhwb3J0ZXIsIHBsdXMKPiAgICBzaW1pbGFyIGZvciB0
aGUgc2xvd3BhdGggbG9jaywgdGhlbiB0aGF0IHNob3VsZCBiZSBkb2FibGUgd2l0aG91dAo+ICAg
IGdsb3Jpb3VzIGxheWVyaW5nIGludmVyc2lvbnMgYmV0d2VlbiBkbWEtYnVmIGFuZCBnZW0uCj4K
PiAgICBJIHRoaW5rIGZvciBkbWEtYnVmIGl0IHNob3VsZCBldmVuIGJlIG9rIGlmIHRoaXMgcmVx
dWlyZXMgdGhhdCB3ZQo+ICAgIGFsbG9jYXRlIGFuIGVudGlyZSBzdHJ1Y3R1cmUgd2l0aCBrbWFs
bG9jIG9yIHNvbWV0aGluZywgYWxsb2NhdGluZwo+ICAgIG1lbW9yeSB3aGlsZSBob2xkaW5nIGRt
YV9yZXN2IGlzIG9rLgoKWWVzLCB0aGUgdGhpbmcgaGVyZSB3aXRoIHRoZSBzdWdnZXN0ZWQgaGVs
cGVycyBpcyB0aGF0IHlvdSB3b3VsZCBqdXN0IAplbWJlZCBhIHRyYW5zX2xvY2tpdGVtIHN0cnVj
dCBpbiB0aGUgZ2VtIG9iamVjdCAoYW5kIGRlZmluZXMgdGhlIGdlbSAKb2JqZWN0IG9wcykuIE90
aGVyd2lzZSBhbmQgZm9yIHBhc3NpbmcgdG8gZG1hLWJ1ZiB0aGlzIGlzIHByZXR0eSBtdWNoIApl
eGFjdGx5IHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nLCBidXQgdGhlIGh1Z2UgYmVuZWZpdCBvZiBl
bmNhcHN1bGF0aW5nIAp0aGUgbmVlZGVkIG1lbWJlcnMgbGlrZSB0aGlzIGlzIHRoYXQgd2hlbiB3
ZSBuZWVkIHRvIGNoYW5nZSBzb21ldGhpbmcgd2UgCmNoYW5nZSBpdCBpbiBqdXN0IG9uZSBwbGFj
ZS4KCkZvciBhbnl0aGluZyB0aGF0IGRvZXNuJ3QgaGF2ZSBhIGdlbSBvYmplY3QgKGRtYS1idWYs
IHZtd2dmeCBvciAKd2hhdGV2ZXIpIHlvdSBoYXZlIHRoZSBjaG9pY2Ugb2YgZWl0aGVyIGFsbG9j
YXRpbmcgYSBzdHJ1Y3QgCnRyYW5zX2xvY2tpdGVtIG9yIGVtYmVkIGl0IHdoZXJldmVyIHlvdSBw
cmVmZXIuIEluIHBhcnRpY3VsYXIsIHRoaXMgaXMgCmJlbmVmaWNpYWwgd2hlcmUgeW91IGhhdmUg
YSBzaW5nbGUgZG1hLXJlc3YgY2xhc3Mgd3ctbXV0ZXggc2l0dGluZyAKc29tZXdoZXJlIGluIHRo
ZSB3YXkgYW5kIHlvdSBkb24ndCB3YW50IHRvIG5lZWRsZXNzbHkgaGF2ZSBhIGdlbSBvYmplY3Qg
CnRoYXQgZW1iZWRzIGl0LgoKL1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FBB99694
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 16:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903B16E4F0;
	Thu, 22 Aug 2019 14:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAFC6E4F0;
 Thu, 22 Aug 2019 14:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CCB433F40A;
 Thu, 22 Aug 2019 16:30:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ca38IU7LgGr4; Thu, 22 Aug 2019 16:30:23 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 14B9D3F382;
 Thu, 22 Aug 2019 16:30:20 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C655E3601BA;
 Thu, 22 Aug 2019 16:30:19 +0200 (CEST)
Subject: Re: [PATCH] drm/ttm: remove ttm_bo_wait_unreserved
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190821215030.31660-1-daniel.vetter@ffwll.ch>
 <20190822064921.1189-1-daniel.vetter@ffwll.ch>
 <f7275d4a-da84-3992-069c-9d2326c0b39f@amd.com>
 <20190822130600.GU11147@phenom.ffwll.local>
 <a0737741-b11a-055a-2780-da8d3db6b857@amd.com>
 <dbf459df-e22a-7b20-6413-37cfa70c22cf@shipmail.org>
Organization: VMware Inc.
Message-ID: <13618321-f250-f46d-1ad8-c638f9c0f9e7@shipmail.org>
Date: Thu, 22 Aug 2019 16:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dbf459df-e22a-7b20-6413-37cfa70c22cf@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566484220; bh=SdpHJnmeOfyf/C/c4eX2f41+3XzuxT7/DXIFpZTlaLk=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Hxw+ZCa8KDZYUN2FPmUjTjG6p3NQF0UyshBSq9gbatwPTxhowYtc9DwD1PW48slo6
 Fy27toQBoSYo47o+HkzyMsnuENEwSQ5plpPQ7vFlUGrY2ENA0g5rj+dIV0/aJeviJN
 LASHUpkFq+yPl9TmPqe0NZpTZ2jaK0Q9mewYlS4Q=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Hxw+ZCa8; 
 dkim-atps=neutral
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMi8xOSA0OjI0IFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPiBP
biA4LzIyLzE5IDQ6MDIgUE0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+PiBBbSAyMi4wOC4x
OSB1bSAxNTowNiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBUaHUsIEF1ZyAyMiwgMjAx
OSBhdCAwNzo1Njo1NkFNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPj4+PiBBbSAy
Mi4wOC4xOSB1bSAwODo0OSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4+IFdpdGggbm91dmVh
dSBmaXhlZCBhbGwgdHRtLXVzaW5nIGRyaXZlcyBoYXZlIHRoZSBjb3JyZWN0IG5lc3Rpbmcgb2YK
Pj4+Pj4gbW1hcF9zZW0gdnMgZG1hX3Jlc3YsIGFuZCB3ZSBjYW4ganVzdCBsb2NrIHRoZSBidWZm
ZXIuCj4+Pj4+Cj4+Pj4+IEFzc3VtaW5nIEkgZGlkbid0IHNjcmV3IHVwIGFueXRoaW5nIHdpdGgg
bXkgYXVkaXQgb2YgY291cnNlLgo+Pj4+Pgo+Pj4+PiB2MjoKPj4+Pj4gLSBEb250IGZvcmdldCB3
dV9tdXRleCAoQ2hyaXN0aWFuIEvDtm5pZykKPj4+Pj4gLSBLZWVwIHRoZSBtbWFwX3NlbS1sZXNz
IHdhaXQgb3B0aW1pemF0aW9uIChUaG9tYXMpCj4+Pj4+IC0gVXNlIF9sb2NrX2ludGVycnVwdGli
bGUgdG8gYmUgZ29vZCBjaXRpemVucyAoVGhvbWFzKQo+Pj4+Pgo+Pj4+PiBSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4gYnR3IEkgcmVh
bGl6ZWQgSSBkaWRuJ3QgcmVtb3ZlIHlvdXIgci1iLCBzaW5jZSB2MSB3YXMgYnJva2VuLgo+Pj4K
Pj4+IEZvciBmb3JtYWxpdHksIGNhbiB5b3UgcGxzIHJlYWZmaXJtLCBvciBzdGlsbCBzb21ldGhp
bmcgYnJva2VuPwo+PiBNeSByLWIgaXMgc3RpbGwgdmFsaWQuCj4+Cj4+IE9ubHkgcHJvYmxlbSBJ
IHNlZSBpcyB0aGF0IG5laXRoZXIgb2YgdXMgc2VlbXMgdG8gaGF2ZSBhIGdvb2QgaWRlYSBhYm91
dAo+PiB0aGUgZGlmZmVyZW50IFZNX0ZBVUxUXyogcmVwbGllcy4KPgo+IEkgdG9vayBhIGxvb2sg
aW4gbW0vZ3VwLmMuIEl0IHNlZW1zIGxpa2Ugd2hlbiB1c2luZyBnZXRfdXNlcl9wYWdlcywgCj4g
Vk1fRkFVTFRfUkVUUlkgd2lsbCByZXRyeSAKCnMvcmV0cnkvcmV0dXJuLwoKCj4gdG8gYSByZXF1
ZXN0aW5nIGNhbGxlciB0ZWxsaW5nIGl0IHRoYXQgYSBsb25nIHdhaXQgd2FzIGV4cGVjdGVkIGFu
ZCAKPiBub3QgcGVyZm9ybWVkLCB3aGVyZWFzIFZNX0ZBVUxUX05PUEFHRSB3aWxsIGp1c3Qga2Vl
cCBnZXRfdXNlcl9wYWdlcyAKPiB0byBzcGluLiBTbyB0aGUgcHJvcG9zZWQgcGF0Y2ggc2hvdWxk
IGJlIGNvcnJlY3QgZnJvbSBteSB1bmRlcnN0YW5kaW5nLgo+Cj4gSWYgdGhlIGZhdWx0IG9yaWdp
bmF0ZXMgZnJvbSB1c2VyLXNwYWNlLCBJIGd1ZXNzIGVpdGhlciBpcyBmaW5lLgo+Cj4gL1Rob21h
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

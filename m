Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC85A7CD3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF7C8989A;
	Wed,  4 Sep 2019 07:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500E78989A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 07:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id A493C3F364;
 Wed,  4 Sep 2019 09:32:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lLkUit6PVre; Wed,  4 Sep 2019 09:32:33 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 276693F2FD;
 Wed,  4 Sep 2019 09:32:31 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 99CB036117F;
 Wed,  4 Sep 2019 09:32:31 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] x86/mm: Export force_dma_unencrypted
To: Christoph Hellwig <hch@infradead.org>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-2-thomas_os@shipmail.org>
 <20190903134627.GA2951@infradead.org>
 <f85e7fa6-54e1-7ac5-ce6c-96349c7af322@shipmail.org>
 <20190903162204.GB23281@infradead.org>
 <558f1224-d157-5848-1752-1430a5b3947e@shipmail.org>
 <20190904065823.GA31794@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <8698dc21-8679-b4a7-3179-71589fa33ab7@shipmail.org>
Date: Wed, 4 Sep 2019 09:32:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190904065823.GA31794@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567582351; bh=+HPJwYMkUXNNDiZsZ1mMLmsIhLPoZN+GWDYqMvcXGy0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OsihSA8XiQNtpZi4LHiOjmVKAjfHxhpSkrnaLq3orK8hVpSl/Py8OtmiHGj20Wmwb
 y9LUQeVfzilM5iuRCPUMl3v1Y/pn92u88ghe02GGFXLUsf0p0rPeQctvZZIm6MHp0a
 MdKNeE2NyMS/CI5DYx5qu4/Phd1HiNMQMy7dvJFQ=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=OsihSA8X; 
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS80LzE5IDg6NTggQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIFR1ZSwgU2Vw
IDAzLCAyMDE5IGF0IDEwOjQ2OjE4UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
IHdyb3RlOgo+PiBXaGF0IEkgbWVhbiB3aXRoICJmcm9tIGFuIGVuZ2luZWVyaW5nIHBlcnNwZWN0
aXZlIiBpcyB0aGF0IGRyaXZlcnMgd291bGQgZW5kCj4+IHVwIHdpdGggYSBub24tdHJpdmlhbCBh
bW91bnQgb2YgY29kZSBzdXBwb3J0aW5nIHB1cmVseSBhY2FkZW1pYyBjYXNlczoKPj4gU2V0dXBz
IHdoZXJlIHNvZnR3YXJlIHJlbmRlcmluZyB3b3VsZCBiZSBmYXN0ZXIgdGhhbiBncHUgYWNjZWxl
cmF0ZWQsIGFuZAo+PiBzZXR1cHMgb24gcGxhdGZvcm1zIHdoZXJlIHRoZSBkcml2ZXIgd291bGQg
bmV2ZXIgcnVuIGFueXdheSBiZWNhdXNlIHRoZQo+PiBkZXZpY2Ugd291bGQgbmV2ZXIgYmUgc3Vw
cG9ydGVkIG9uIHRoYXQgcGxhdGZvcm0uLi4KPiBBbmQgYWN0dWFsbHkgd29yayBvbiBjYXNlcyB5
b3UgcHJldmlvdXNseSBjYWxsZWQgYWNhZGVtaWMgYW5kIHdoaWNoIG5vdwo+IG1hdHRlciB0byB5
b3UgYmVjYXVzZSB5b3VyIGVtcGxveWVyIGhhcyBhIHN1ZGRlbnQgaW50ZXJlc3QgaW4gU0VWLgo+
IEFjYWRlbWljIHJlYWxseSBpcyBpbiB0aGUgZXllIG9mIHRoZSBiZWhvbGRlciAoYW5kIG9mIHRo
b3NlIHdobyBwYXkKPiB0aGUgYmlsbHMpLgoKQnV0IGluIHRoaXMgcGFydGljdWxhciBjYXNlIHdl
ICpkbyogYWRoZXJlIHRvIHRoZSBkbWEgYXBpLCBhdCBsZWFzdCBhcyAKZmFyIGFzIHdlIGNhbi4g
QnV0IHdlJ3JlIG1pc3NpbmcgZnVuY3Rpb25hbGl0eS4KCj4KPj4gVGhhdCBpcyBub3QgcmVhbGx5
IHRydWUuIFRoZSBkbWEgQVBJIGNhbid0IGhhbmRsZSBmYXVsdGluZyBvZiBjb2hlcmVudCBwYWdl
cwo+PiB3aGljaCBpcyB3aGF0IHRoaXMgc2VyaWVzIGlzIHJlYWxseSBhbGwgYWJvdXQgc3VwcG9y
dGluZyBhbHNvIHdpdGggU0VWCj4+IGFjdGl2ZS4gVG8gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIHdl
IG1vdmUgZ3JhcGhpY3MgYnVmZmVycyBvciBzZW5kIHRoZW0gdG8KPj4gc3dhcCBzcGFjZSB3aGls
ZSB1c2VyLXNwYWNlIGhhdmUgdGhlbSBtYXBwZWQuCj4gQW5kIHRoZSBvbmx5IHRoaW5nIHdlIG5l
ZWQgdG8gc3VwcG9ydCB0aGUgZmF1bHQgaGFuZGxlciBpcyB0byBhZGQgYW4KPiBvZmZzZXQgdG8g
dGhlIGRtYV9tbWFwXyogQVBJcy4gIFdoaWNoIEkgaGFkIHBsYW5uZWQgdG8gZG8gZm9yIENocmlz
dGlhbgo+IChvbmUgb2YgdGhlIGZldyBncmFwaWNzIGRldmVsb3BlcnMgd2hvIGFjdHVhbGx5IHRy
aWVzIHRvIHBsYXkgd2VsbAo+IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGtlcm5lbCBpbnN0ZWFkIG9m
IHBpbGluZyBoYWNrcyBvdmVyIGhhY2tzIGxpa2UKPiBtYW55IG90aGVycykgYW55d2F5LCBidXQg
d2hpY2ggaGFzbid0IGhhcHBlbmVkIHlldC4KClRoYXQgc291bmRzIGdyZWF0LiBJcyB0aGVyZSBh
bnl0aGluZyBJIGNhbiBkbyB0byBoZWxwIG91dD8gSSB0aG91Z2h0IAp0aGlzIHdhcyBtb3JlIG9y
IGxlc3MgYSBkZWFkIGVuZCBzaW5jZSB0aGUgY3VycmVudCBkbWFfbW1hcF8gQVBJIApyZXF1aXJl
cyB0aGUgbW1hcF9zZW0gdG8gYmUgaGVsZCBpbiB3cml0ZSBtb2RlIChtb2RpZnlpbmcgdGhlIAp2
bWEtPnZtX2ZsYWdzKSB3aGVyZWFzIGZhdWx0KCkgb25seSBvZmZlcnMgcmVhZCBtb2RlLiBCdXQg
dGhhdCB3b3VsZCAKZGVmaW5pdGVseSB3b3JrLgoKPgo+PiBTdGlsbCwgSSBuZWVkIGEgd2F5IGZv
cndhcmQgYW5kIG15IHF1ZXN0aW9ucyB3ZXJlbid0IHJlYWxseSBhbnN3ZXJlZCBieQo+PiB0aGlz
Lgo+IFRoaXMgaXMgcHJldHR5IGRlbWFuZGluZy4gIElmIHlvdSAibmVlZCIgYSB3YXkgZm9yd2Fy
ZCBqdXN0IHdvcmsgd2l0aAo+IGFsbCB0aGUgcmVsZXZhbnQgcGVvcGxlIGluc3RlYWQgb2YgcGls
aW5nIG9iIGxvY2FsIGhhY2tzLgoKQnV0IEkgdGhpbmsgdGhhdCB3YXMgd2hhdCBJIHdhcyB0cnlp
bmcgdG8gaW5pdGlhdGUuIFRoZSBxdWVzdGlvbiB3YXMKCiJJZiBpdCdzIHRoZSBsYXR0ZXIsIHRo
ZW4gSSB3b3VsZCBsaWtlIHRvIHJlaXRlcmF0ZSB0aGF0IGl0IHdvdWxkIGJlIApiZXR0ZXIgdGhh
dCB3ZSB3b3JrIHRvIGNvbWUgdXAgd2l0aCBhIGxvbmcgdGVybSBwbGFuIHRvIGFkZCB3aGF0J3Mg
Cm1pc3NpbmcgdG8gdGhlIERNQSBhcGkgdG8gaGVscCBncmFwaGljcyBkcml2ZXJzIHVzZSBjb2hl
cmVudCBtZW1vcnk/IgoKQW5kIHNpbmNlIHlvdSBOQUsnZCB0aGUgb3JpZ2luYWwgcGF0Y2hlcywg
SSB3YXMgc29ydCBvZiBob3BpbmcgZm9yIGEgCnBvaW50IGluIHRoZSByaWdodCBkaXJlY3Rpb24u
CgpUaGFua3MsCgpUaG9tYXMKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

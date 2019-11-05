Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC461EFE99
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8926EA5E;
	Tue,  5 Nov 2019 13:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB156EA5E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 13:30:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5DUeZa029559;
 Tue, 5 Nov 2019 07:30:40 -0600
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5DUeIA012898
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Nov 2019 07:30:40 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 07:30:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 07:30:25 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5DUdiv055261;
 Tue, 5 Nov 2019 07:30:39 -0600
Subject: Re: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, 
 Sandeep Patil <sspatil@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Pratik Patel
 <pratikp@codeaurora.org>
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191104095823.GD10326@phenom.ffwll.local>
 <CALAqxLW_CoAn-KXki0dGKK+vo-R4CTnjt1Azrw=mRdL8BUFGWw@mail.gmail.com>
 <20191105094259.GX10326@phenom.ffwll.local>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <5b591240-43c8-495a-e9c9-881a2997c492@ti.com>
Date: Tue, 5 Nov 2019 08:30:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105094259.GX10326@phenom.ffwll.local>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1572960640;
 bh=X2r1E+5verQirY3pPc+pLDG8R8Z0eAEU6/97FnwaeJE=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=i2X9SNHIaWyxje87ekrjovkH7KcKd8+Uv4zRDPgQqCS2KklVMgqThvsNrhGdccnO0
 toL/VNiqQXNlum/mc5Loj8mvMERyzATixCxGkR+dpj1HHw40/9OFdIeuLBmrsQM+Y8
 CPPptuc4zxsiS7Id6yM3FAGqjXt0hMah4inpCgxI=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvNS8xOSA0OjQyIEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIE1vbiwgTm92IDA0
LCAyMDE5IGF0IDEwOjU3OjQ0QU0gLTA4MDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+PiBPbiBNb24s
IE5vdiA0LCAyMDE5IGF0IDE6NTggQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3
cm90ZToKPj4+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDExOjQ4OjMyUE0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+Pj4+IE5vdyB0aGF0IHRoZSBETUEgQlVGIGhlYXBzIGNvcmUgY29kZSBo
YXMgYmVlbiBxdWV1ZWQsIEkgd2FudGVkCj4+Pj4gdG8gc2VuZCBvdXQgc29tZSBvZiB0aGUgcGVu
ZGluZyBjaGFuZ2VzIHRoYXQgSSd2ZSBiZWVuIHdvcmtpbmcKPj4+PiBvbi4KPj4+Pgo+Pj4+IEZv
ciB1c2Ugd2l0aCBBbmRyb2lkIGFuZCB0aGVpciBHS0kgZWZmb3J0LCBpdCBpcyBkZXNpcmVkIHRo
YXQKPj4+PiBETUEgQlVGIGhlYXBzIGFyZSBhYmxlIHRvIGJlIGxvYWRlZCBhcyBtb2R1bGVzLiBU
aGlzIGlzIHJlcXVpcmVkCj4+Pj4gZm9yIG1pZ3JhdGluZyB2ZW5kb3JzIG9mZiBvZiBJT04gd2hp
Y2ggd2FzIGFsc28gcmVjZW50bHkgY2hhbmdlZAo+Pj4+IHRvIHN1cHBvcnQgbW9kdWxlcy4KPj4+
Pgo+Pj4+IFNvIHRoaXMgcGF0Y2ggc2VyaWVzIHNpbXBseSBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5
IGV4cG9ydGVkCj4+Pj4gc3ltYm9scyBhbmQgYWxsb3dzIHRoZSBzeXN0ZW0gYW5kIENNQSBkcml2
ZXJzIHRvIGJlIGJ1aWx0Cj4+Pj4gYXMgbW9kdWxlcy4KPj4+Pgo+Pj4+IER1ZSB0byB0aGUgZmFj
dCB0aGF0IGRtYWJ1ZidzIGFsbG9jYXRlZCBmcm9tIGEgaGVhcCBtYXkKPj4+PiBiZSBpbiB1c2Ug
Zm9yIHF1aXRlIHNvbWUgdGltZSwgdGhlcmUgaXNuJ3QgYSB3YXkgdG8gc2FmZWx5Cj4+Pj4gdW5s
b2FkIHRoZSBkcml2ZXIgb25jZSBpdCBoYXMgYmVlbiBsb2FkZWQuIFRodXMgdGhlc2UKPj4+PiBk
cml2ZXJzIGRvIG5vIGltcGxlbWVudCBtb2R1bGVfZXhpdCgpIGZ1bmN0aW9ucyBhbmQgd2lsbAo+
Pj4+IHNob3cgdXAgaW4gbHNtb2QgYXMgIltwZXJtYW5lbnRdIgo+Pj4+Cj4+Pj4gRmVlZGJhY2sg
YW5kIHRob3VnaHRzIG9uIHRoaXMgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKPj4+Cj4+
PiBEbyB3ZSBhY3R1YWxseSB3YW50IHRoaXM/Cj4+Cj4+IEkgZ3Vlc3MgdGhhdCBhbHdheXMgZGVw
ZW5kcyBvbiB0aGUgZGVmaW5pdGlvbiBvZiAid2UiIDopCj4+Cj4+PiBJIGZpZ3VyZWQgaWYgd2Ug
anVzdCBzdGF0ZSB0aGF0IHZlbmRvcnMgc2hvdWxkIHNldCB1cCBhbGwgdGhlIHJpZ2h0Cj4+PiBk
bWEtYnVmIGhlYXBzIGluIGR0LCBpcyB0aGF0IG5vdCBlbm91Z2g/Cj4+Cj4+IFNvIGV2ZW4gaWYg
dGhlIGhlYXBzIGFyZSBjb25maWd1cmVkIHZpYSBEVCAod2hpY2ggYXQgdGhlIG1vbWVudCB0aGVy
ZQo+PiBpcyBubyBzdWNoIGJpbmRpbmcsIHNvIHRoYXQncyBub3QgcmVhbGx5IGEgdmFsaWQgbWV0
aG9kIHlldCksIHRoZXJlJ3MKPj4gc3RpbGwgdGhlIHF1ZXN0aW9uIG9mIGlmIHRoZSBoZWFwIGlz
IG5lY2Vzc2FyeS9tYWtlcyBzZW5zZSBvbiB0aGUKPj4gZGV2aWNlLiBBbmQgdGhlIERUIHdvdWxk
IG9ubHkgY29udHJvbCB0aGUgYXZhaWxhYmlsaXR5IG9mIHRoZSBoZWFwCj4+IGludGVyZmFjZSwg
bm90IGlmIHRoZSBoZWFwIGRyaXZlciBpcyBsb2FkZWQgb3Igbm90Lgo+IAo+IEhtIEkgdGhvdWdo
dCB0aGUgY21hIHJlZ2lvbnMgYXJlIGNvbmZpZ3VyZWQgaW4gRFQ/IEhvdyBkb2VzIHRoYXQgd29y
ayBpZgo+IGl0J3Mgbm90IHVzaW5nIERUPwo+IAo+PiBPbiB0aGUgSGlLZXkvSGlLZXk5NjAgYm9h
cmRzLCB3ZSBoYXZlIHRvIGFsbG9jYXRlIGNvbnRpZ3VvdXMgYnVmZmVycwo+PiBmb3IgdGhlIGRp
c3BsYXkgZnJhbWVidWZmZXIuIFNvIGdyYWxsb2MgdXNlcyBJT04gdG8gYWxsb2NhdGUgZnJvbSB0
aGUKPj4gQ01BIGhlYXAuIEhvd2V2ZXIgb24gdGhlIGRiODQ1YywgaXQgaGFzIG5vIHN1Y2ggcmVz
dHJpY3Rpb25zLCBzbyB0aGUKPj4gQ01BIGhlYXAgaXNuJ3QgbmVjZXNzYXJ5Lgo+IAo+IFdoeSBk
byB5b3UgaGF2ZSBhIENNQSByZWdpb24gZm9yIHRoZSAybmQgYm9hcmQgaWYgeW91IGRvbid0IG5l
ZWQgaXQ/Cj4gX1RoYXRfIHNvdW5kcyBsaWtlIHNvbWUgc2VyaW91cyBtZW1vcnkgd2FzdGVyLCBu
b3QgYSBmZXcgbGluZXMgb2YgY29kZQo+IGxvYWRlZCBmb3Igbm90aGluZyA6LSkKPiAKPj4gV2l0
aCBBbmRyb2lkJ3MgR0tJIGVmZm9ydCwgdGhlcmUgbmVlZHMgdG8gYmUgb25lIGtlcm5lbCB0aGF0
IHdvcmtzIG9uCj4+IGFsbCB0aGUgZGV2aWNlcywgYW5kIHRoZXkgYXJlIHVzaW5nIG1vZHVsZXMg
dG8gdHJ5IHRvIG1pbmltaXplIHRoZQo+PiBhbW91bnQgb2YgbWVtb3J5IHNwZW50IG9uIGZ1bmN0
aW9uYWxpdHkgdGhhdCBpc24ndCB1bml2ZXJzYWxseSBuZWVkZWQuCj4+IFNvIG9uIGRldmljZXMg
dGhhdCBkb24ndCBuZWVkIHRoZSBDTUEgaGVhcCwgdGhleSdkIHByb2JhYmx5IHByZWZlciBub3QK
Pj4gdG8gbG9hZCB0aGUgQ01BIGRtYWJ1ZiBoZWFwIGRyaXZlciwgc28gaXQgd291bGQgYmUgYmVz
dCBpZiBpdCBjb3VsZCBiZQo+PiBidWlsdCBhcyBhIG1vZHVsZS4gIElmIHdlIHdhbnQgdG8gYnVp
bGQgdGhlIENNQSBoZWFwIGFzIGEgbW9kdWxlLCB0aGUKPj4gc3ltYm9scyBpdCB1c2VzIG5lZWQg
dG8gYmUgZXhwb3J0ZWQuCj4gCj4gWWVhaCwgSSBndWVzcyBJJ20gZGlzYWdyZWVpbmcgb24gd2hl
dGhlciBkbWEtYnVmIGhlYXBzIGFyZSBjb3JlIG9yIG5vdC4KPiAKPj4+IEV4cG9ydGluZyBzeW1i
b2xzIGZvciBubyByZWFsIGluLXRyZWUgdXNlcnMgZmVlbHMgZmlzaHkuCj4+Cj4+IEknbSBzdWJt
aXR0aW5nIGFuIGluLXRyZWUgdXNlciBoZXJlLiBTbyBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVh
bj8gIEkKPj4gc3VzcGVjdCB5b3UncmUgdGhpbmtpbmcgdGhlcmUgaXMgc29tZSBoaWRkZW4vbmVm
YXJpb3VzIHBsYW4gaGVyZSwgYnV0Cj4+IHJlYWxseSB0aGVyZSBpc24ndC4KPiAKPiBJIHdhcyB3
b3JraW5nIHVuZGVyIHRoZSBhc3N1bXB0aW9uIHRoYXQgeW91J3JlIG9ubHkgZXhwb3J0aW5nIHRo
ZSBzeW1ib2xzCj4gZm9yIG90aGVyIGhlYXBzLCBhbmQga2VlcCB0aGUgY3VycmVudCBvbmVzIGlu
LXRyZWUuIEFyZSB0aGVyZSBldmVuIGFueQo+IG91dC1vZi10cmVlIGRtYS1idWYgaGVhcHMgc3Rp
bGw/IG91dC1vZi10cmVlIGFuZCBsZWdpdCBkaWZmZXJlbnQgdXNlLWNhc2UKPiBJIG1lYW4gb2Zj
LCBub3QganVzdCBvdXQtb2YtdHJlZSBiZWNhdXNlIGluZXJ0aWEgOi0pCgpOb3Qgc3VyZSB3aGF0
IHlvdSBtZWFuIGhlcmUsIGhvcGVmdWxseSBhbGwgdGhlIGhlYXBzIGNhbiBiZSAiaW4tdHJlZSIK
c29tZSBkYXkuCgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODYzOTU3LwoK
UGx1cyBzb21lIG5vbi1jYWNoaW5nIGhlYXBzIGFuZCBvbmUgdGhhdCBmb3JjZXMgZWFybHkgYWxs
b2NhdGlvbiBvZiBvdXIKUEFUIChnYXJ0IGxpa2UpIElQLgoKQWxsIHRoaXMgc3R1ZmYgaXMgZ29p
bmcgaW50byBvdXIgZXZpbCB2ZW5kb3IgdHJlZSBuZXh0IGN5Y2xlIChpZiBub3QKdXBzdHJlYW0g
YnkgdGhlbiA6KSksIGlmIHdlIHdhbnQgc29tZSBvZiB0aGVzZSAic3BlY2lhbHR5IiBoZWFwcyB0
byBnbwppbnRvIGdlbmVyaWMga2VybmVsIGJ1aWxkcyBhdCBzb21lIHBvaW50IHRoZXkgd2lsbCBu
ZWVkIHRvIGJlIG1vZHVsZXMgaWYKdGhlIGNvcmUgaXMuCgpBbHRob3VnaCBJIGFtIHN0aWxsIHRo
aW5raW5nIEhlYXBzIHNob3VsZCBiZSBhbHdheXMgYnVpbHQgaW4gKyBzeXN0ZW0gKwpDTUEgaGVh
cHMsIHRoZW4gdGhlIHJhbmRvIGhlYXBzIGNvdWxkIGJlIG1vZHVsZXMgaWYgbmVlZGVkLgoKQW5k
cmV3Cgo+IC1EYW5pZWwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

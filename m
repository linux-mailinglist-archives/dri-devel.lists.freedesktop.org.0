Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234CCD07C7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0C66E8EE;
	Wed,  9 Oct 2019 07:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D9B6E8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 07:05:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9975auv119915;
 Wed, 9 Oct 2019 02:05:36 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9975a4i128483
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2019 02:05:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 02:05:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 02:05:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9975Wdc051835;
 Wed, 9 Oct 2019 02:05:32 -0500
Subject: Re: [PATCH v3 0/8] drm/omap: OMAP_BO flags
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
References: <20191007112555.25278-1-jjhiblot@ti.com>
 <7c84382e-8104-231d-1b30-cee1e546cc3c@ti.com>
 <2a17a6e8-b8f7-f909-a44f-aa23aa1dbdd7@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <04e0cb1e-3e69-89e9-49c8-506f3b466730@ti.com>
Date: Wed, 9 Oct 2019 10:05:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2a17a6e8-b8f7-f909-a44f-aa23aa1dbdd7@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570604736;
 bh=b7Zh9RAiyUvIttiYyYmszZ6yn4TGOzxN09PqeZW62i4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NGWzYPhLEpiMA2HdFVorlifsnMNEm1h54q8SzjfpDd2/wRjFencImJ2do6JjkT/Pw
 cXyarnmdQy/QMyOA1MMz04DoiWh+RvbWEAXwkbnepbouhyJcs2UTuh33Xmx4kizDUf
 FVXS4qc5hcW7vOWD9KBqNyYCfN0aV+4aexHCotWc=
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
Cc: airlied@linux.ie, jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMTAvMjAxOSAxOTowOCwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPiAKPiBPbiAw
Ny8xMC8yMDE5IDE0OjE2LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPj4gT24gMDcvMTAvMjAxOSAx
NDoyNSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4+IEEgZmlyc3QgdmVyc2lvbiBvZiB0
aGlzIHdvcmsgaGFkIGJlZW4gc2VudCBieSBUb21pIFZhbGtlaW5lbiBpbiBtYXkgMjAxNwo+Pj4g
KGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2RyaS1kZXZlbC9tc2cxNDA2NjMuaHRtbCku
Cj4+Pgo+Pj4gVGhpcyBzZXJpZXMgYWRkcyBhIGZldyBuZXcgT01BUF9CTyBmbGFncyB0byBoZWxw
IHRoZSB1c2Vyc3BhY2UgbWFuYWdlCj4+PiBzaXR1YXRpb25zIHdoZXJlIGl0IG5lZWRzIHRvIHVz
ZSBsb3RzIG9mIGJ1ZmZlcnMsIGFuZCB3b3VsZCBjdXJyZW50bHkgCj4+PiBydW4KPj4+IG91dCBv
ZiBUSUxFUiBzcGFjZS4gVGhlIFRJTEVSIHNwYWNlIGlzIGxpbWl0ZWQgdG8gbWFwcGluZyAxMjhN
QiBhdCAKPj4+IGFueSBnaXZlbgo+Pj4gdGltZSBhbmQgc29tZSBhcHBsaWNhdGlvbnMgbWlnaHQg
bmVlZCBtb3JlLgo+Pj4KPj4+IFRoaXMgc2VyZXMgaXMgYWxzbyB0aGUgb3Bwb3J0dW5pdHkgdG8g
ZG8gc29tZSBjbGVhbnVwIGluIHRoZSBmbGFncyBhbmQKPj4+IGltcHJvdmUgdGhlIGNvbW1lbnRz
IGRlc2NyaWJpbmcgdGhlbS4KPj4+Cj4+PiBUaGUgdXNlci1zcGFjZSBwYXRjaGVzIGZvciBsaWJk
cm0sIGFsdGhvdWdoIHJlYWR5LCBoYXZlbid0IGJlZW4gCj4+PiBwb3N0ZWQgeWV0Lgo+Pj4gSXQg
d2lsbCBiZSBiZSBkb25lIHdoZW4gdGhpcyBzZXJpZXMgaGF2ZSBiZWVuIGRpc2N1c3NlZCBhbmQg
aG9wZWZ1bGx5IGluCj4+PiB0aGUgcHJvY2VzcyBvZiBnZXR0aW5nIG1lcmdlZC4KPj4+Cj4+PiBK
Sgo+Pj4KPj4+IGNoYW5nZXMgaW4gdjM6Cj4+PiAtIHJlYmFzZSBvbiB0b3Agb2YgdjUuNC1yYzIK
Pj4+IC0gRG9jdW1lbnQgb21hcF9nZW1fbmV3KCkgYW5kIHRoZSBuZXcgZmxhZ3MgdXNpbmcgdGhl
IGtlcm5lbC1kb2MgZm9ybWF0Cj4+Pgo+Pj4gY2hhbmdlcyBpbiB2MjoKPj4+IC0gZml4ZWQgYnVp
bGQgZXJyb3IgdGhhdCBjcmVwdCBpbiBkdXJpbmcgcmViYXNlIGJlZm9yZSBzZW5kaW5nIChzb3Jy
eQo+Pj4gwqDCoCBhYm91dCB0aGF0KQo+Pj4gLSByZXdvcmsgdGhlIHJlZmNvdW50IHBhcnQgYSBi
aXQuCj4+Pgo+Pj4gSmVhbi1KYWNxdWVzIEhpYmxvdCAoMSk6Cj4+PiDCoMKgIGRybS9vbWFwOiB1
c2UgcmVmY291bnQgQVBJIHRvIHRyYWNrIHRoZSBudW1iZXIgb2YgdXNlcnMgb2YgZG1hX2FkZHIK
Pj4+Cj4+PiBUb21pIFZhbGtlaW5lbiAoNyk6Cj4+PiDCoMKgIGRybS9vbWFwOiBhZGQgb21hcF9n
ZW1fdW5waW5fbG9ja2VkKCkKPj4+IMKgwqAgZHJtL29tYXA6IGFjY2VwdCBOVUxMIGZvciBkbWFf
YWRkciBpbiBvbWFwX2dlbV9waW4KPj4+IMKgwqAgZHJtL29tYXA6IGNsZWFudXAgT01BUF9CTyBm
bGFncwo+Pj4gwqDCoCBkcm0vb21hcDogcmVtb3ZlIE9NQVBfQk9fVElMRUQgZGVmaW5lCj4+PiDC
oMKgIGRybS9vbWFwOiBjbGVhbnVwIE9NQVBfQk9fU0NBTk9VVCB1c2UKPj4+IMKgwqAgZHJtL29t
YXA6IGFkZCBvbWFwX2dlbV92YWxpZGF0ZV9mbGFncygpCj4+PiDCoMKgIGRybS9vbWFwOiBhZGQg
T01BUF9CTyBmbGFncyB0byBhZmZlY3QgYnVmZmVyIGFsbG9jYXRpb24KPj4+Cj4+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5owqAgfMKgwqAgMiArLQo+Pj4gwqAg
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2
ICstCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jwqDCoMKgwqDCoMKg
wqAgfCAxOTEgKysrKysrKysrKysrKysrKy0tLS0tLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9nZW1fZG1hYnVmLmMgfMKgwqAgMiArLQo+Pj4gwqAgaW5jbHVkZS91YXBpL2Ry
bS9vbWFwX2RybS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjcgKystCj4+PiDC
oCA1IGZpbGVzIGNoYW5nZWQsIDE2NCBpbnNlcnRpb25zKCspLCA2NCBkZWxldGlvbnMoLSkKPj4K
Pj4gVGhhbmtzISBUaGlzIGxvb2tzIGdvb2QgdG8gbWUuIE9uZSBjb21tZW50LCB0aG91Z2g6Cj4+
Cj4+IFNvbWUgcGVvcGxlIG1heSBoYXZlIGRpZmZlcmVudCBvcGluaW9ucyBvbiBob3cgdG8gbWFu
YWdlIG90aGVyIAo+PiBwZW9wbGUncyBwYXRjaGVzLCBidXQgaGVyZSdzIG1pbmU6Cj4+Cj4+IElm
IHlvdSBoYXZlIG1hZGUgY2hhbmdlcyB0byBhIHBhdGNoIGZyb20gc29tZW9uZSBlbHNlIChtZSwg
aW4gdGhpcyAKPj4gY2FzZSksIG90aGVyIHRoYW4gcmVhbGx5IHRyaXZpYWwgdHlwbyBmaXhlcyBv
ciBzdWNoLCB5b3Ugc2hvdWxkIGFkZCAKPj4geW91ciBzaWduZWQtb2ZmLWJ5Lgo+Pgo+PiBBbHNv
LCBpZiB5b3UgY2hhbmdlIHRoZSBwYXRjaCBpbiBhIHdheSB0aGF0IG1pZ2h0IG1ha2UgaXQgYmVo
YXZlIAo+PiBkaWZmZXJlbnRseSB0aGFuIHRoZSBvcmlnaW5hbCwgeW91IHNob3VsZCBjaGFuZ2Ug
dGhlIG93bmVyc2hpcCB0byAKPj4geW91cnNlbGYsIGRyb3AgdGhlIG9yaWdpbmFsIHNpZ25lZC1v
ZmYtYnksIGFuZCBwZXJoYXBzIHNheSBpbiB0aGUgZGVzYyAKPj4gdGhhdCB0aGUgb3JpZ2luYWwg
d2FzIHdyaXR0ZW4gYnkgeHl6LiBJIGRvbid0IHdhbnQgIm15IiBwYXRjaCB0byBjYXVzZSAKPj4g
a2VybmVsIGNyYXNoZXMsIGlmIGl0J3MgcmVhbGx5IG5vdCBteSBjb2RlID0pLgo+IEFjdHVhbGx5
IEkgZGlkbid0IHRvdWNoIHRob3NlIHBhdGNoZXMgYSBsb3QuIEFwYXJ0IGZyb20gdGhlIGZpcnN0
IG9uZSAKPiAodGhlIGF0b21pYyBzdHVmZikgYW5kIHRoZSBrZXJuZWwtZG9jIHN0eWxlIGNvbW1l
bnQgaW4gdGhlIGxhc3QgcGF0Y2gsIAo+IGl0IGlzIHByZXR0eSBtdWNoIHRoZSBzdHVmZiB0aGF0
IHlvdSBhdXRob3JlZCBhbmQgaXMgbm93IHBhcnQgb2YgVEkncyB0cmVlLgo+Pgo+PiBBY3R1YWxs
eSwgSSBzZWUgd2Ugbm93IGhhdmUgIkNvLWRldmVsb3BlZC1ieSIgZG9jdW1lbnRlZCBpbiAKPj4g
RG9jdW1lbnRhdGlvbi9wcm9jZXNzLzUuUG9zdGluZy5yc3QuIFRoYXQgbWF5IGJlIHN1aXRhYmxl
IGhlcmUuCj4+Cj4+IEFuZCBmb3IgdGhlIHBhdGNoZXMgdGhhdCB5b3UgZGlkbid0IHRvdWNoLCBJ
J20gc3VyZSB5b3UndmUgc3RpbGwgZ29uZSAKPj4gdGhyb3VnaCB0aG9zZSwgc28geW91IGNvdWxk
IGFkZCB5b3VyIHJldmlld2VkLWJ5Lgo+IAo+IERvbmUuCgpUaGFua3MhIEknbGwgcHVzaCB0aGVz
ZSB0byBkcm0tbWlzYy1uZXh0LgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

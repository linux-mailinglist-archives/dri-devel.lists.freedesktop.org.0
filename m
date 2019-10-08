Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E0CFE8A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 18:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560E36E848;
	Tue,  8 Oct 2019 16:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BC56E848
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 16:08:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98G8JFL021484;
 Tue, 8 Oct 2019 11:08:19 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98G8JQF120445;
 Tue, 8 Oct 2019 11:08:19 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 11:08:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 11:08:19 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98G8Hox129924;
 Tue, 8 Oct 2019 11:08:17 -0500
Subject: Re: [PATCH v3 0/8] drm/omap: OMAP_BO flags
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
References: <20191007112555.25278-1-jjhiblot@ti.com>
 <7c84382e-8104-231d-1b30-cee1e546cc3c@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <2a17a6e8-b8f7-f909-a44f-aa23aa1dbdd7@ti.com>
Date: Tue, 8 Oct 2019 18:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7c84382e-8104-231d-1b30-cee1e546cc3c@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570550899;
 bh=iVcS/ULgVoHnFNOCLsnJqInlg+TpugGMG8FZPJ5CfhE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qFda1SbA0O8Lhypppmb6qWW0SaAZElRMP0+l77Wqeidzjf+JzcH6aXcbMiDg9wLMA
 vD+TR9bQIyr7MWLb7i4ho3UYcmc4PejOFP3/Q4z9z6adO/MTm4BD6gL2w0Mn3+oSPn
 SZMFVq6VWZWP7SJoXdOCM+h085NT5p+rFHZkwdaM=
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

Ck9uIDA3LzEwLzIwMTkgMTQ6MTYsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+IE9uIDA3LzEwLzIw
MTkgMTQ6MjUsIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4+IEEgZmlyc3QgdmVyc2lvbiBv
ZiB0aGlzIHdvcmsgaGFkIGJlZW4gc2VudCBieSBUb21pIFZhbGtlaW5lbiBpbiBtYXkgMjAxNwo+
PiAoaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzE0MDY2My5odG1s
KS4KPj4KPj4gVGhpcyBzZXJpZXMgYWRkcyBhIGZldyBuZXcgT01BUF9CTyBmbGFncyB0byBoZWxw
IHRoZSB1c2Vyc3BhY2UgbWFuYWdlCj4+IHNpdHVhdGlvbnMgd2hlcmUgaXQgbmVlZHMgdG8gdXNl
IGxvdHMgb2YgYnVmZmVycywgYW5kIHdvdWxkIGN1cnJlbnRseSAKPj4gcnVuCj4+IG91dCBvZiBU
SUxFUiBzcGFjZS4gVGhlIFRJTEVSIHNwYWNlIGlzIGxpbWl0ZWQgdG8gbWFwcGluZyAxMjhNQiBh
dCAKPj4gYW55IGdpdmVuCj4+IHRpbWUgYW5kIHNvbWUgYXBwbGljYXRpb25zIG1pZ2h0IG5lZWQg
bW9yZS4KPj4KPj4gVGhpcyBzZXJlcyBpcyBhbHNvIHRoZSBvcHBvcnR1bml0eSB0byBkbyBzb21l
IGNsZWFudXAgaW4gdGhlIGZsYWdzIGFuZAo+PiBpbXByb3ZlIHRoZSBjb21tZW50cyBkZXNjcmli
aW5nIHRoZW0uCj4+Cj4+IFRoZSB1c2VyLXNwYWNlIHBhdGNoZXMgZm9yIGxpYmRybSwgYWx0aG91
Z2ggcmVhZHksIGhhdmVuJ3QgYmVlbiAKPj4gcG9zdGVkIHlldC4KPj4gSXQgd2lsbCBiZSBiZSBk
b25lIHdoZW4gdGhpcyBzZXJpZXMgaGF2ZSBiZWVuIGRpc2N1c3NlZCBhbmQgaG9wZWZ1bGx5IGlu
Cj4+IHRoZSBwcm9jZXNzIG9mIGdldHRpbmcgbWVyZ2VkLgo+Pgo+PiBKSgo+Pgo+PiBjaGFuZ2Vz
IGluIHYzOgo+PiAtIHJlYmFzZSBvbiB0b3Agb2YgdjUuNC1yYzIKPj4gLSBEb2N1bWVudCBvbWFw
X2dlbV9uZXcoKSBhbmQgdGhlIG5ldyBmbGFncyB1c2luZyB0aGUga2VybmVsLWRvYyBmb3JtYXQK
Pj4KPj4gY2hhbmdlcyBpbiB2MjoKPj4gLSBmaXhlZCBidWlsZCBlcnJvciB0aGF0IGNyZXB0IGlu
IGR1cmluZyByZWJhc2UgYmVmb3JlIHNlbmRpbmcgKHNvcnJ5Cj4+IMKgwqAgYWJvdXQgdGhhdCkK
Pj4gLSByZXdvcmsgdGhlIHJlZmNvdW50IHBhcnQgYSBiaXQuCj4+Cj4+IEplYW4tSmFjcXVlcyBI
aWJsb3QgKDEpOgo+PiDCoMKgIGRybS9vbWFwOiB1c2UgcmVmY291bnQgQVBJIHRvIHRyYWNrIHRo
ZSBudW1iZXIgb2YgdXNlcnMgb2YgZG1hX2FkZHIKPj4KPj4gVG9taSBWYWxrZWluZW4gKDcpOgo+
PiDCoMKgIGRybS9vbWFwOiBhZGQgb21hcF9nZW1fdW5waW5fbG9ja2VkKCkKPj4gwqDCoCBkcm0v
b21hcDogYWNjZXB0IE5VTEwgZm9yIGRtYV9hZGRyIGluIG9tYXBfZ2VtX3Bpbgo+PiDCoMKgIGRy
bS9vbWFwOiBjbGVhbnVwIE9NQVBfQk8gZmxhZ3MKPj4gwqDCoCBkcm0vb21hcDogcmVtb3ZlIE9N
QVBfQk9fVElMRUQgZGVmaW5lCj4+IMKgwqAgZHJtL29tYXA6IGNsZWFudXAgT01BUF9CT19TQ0FO
T1VUIHVzZQo+PiDCoMKgIGRybS9vbWFwOiBhZGQgb21hcF9nZW1fdmFsaWRhdGVfZmxhZ3MoKQo+
PiDCoMKgIGRybS9vbWFwOiBhZGQgT01BUF9CTyBmbGFncyB0byBhZmZlY3QgYnVmZmVyIGFsbG9j
YXRpb24KPj4KPj4gwqAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuaMKg
IHzCoMKgIDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCA2ICstCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBf
Z2VtLmPCoMKgwqDCoMKgwqDCoCB8IDE5MSArKysrKysrKysrKysrKysrLS0tLS0tCj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtX2RtYWJ1Zi5jIHzCoMKgIDIgKy0KPj4gwqAg
aW5jbHVkZS91YXBpL2RybS9vbWFwX2RybS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMjcgKystCj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKyksIDY0IGRl
bGV0aW9ucygtKQo+Cj4gVGhhbmtzISBUaGlzIGxvb2tzIGdvb2QgdG8gbWUuIE9uZSBjb21tZW50
LCB0aG91Z2g6Cj4KPiBTb21lIHBlb3BsZSBtYXkgaGF2ZSBkaWZmZXJlbnQgb3BpbmlvbnMgb24g
aG93IHRvIG1hbmFnZSBvdGhlciAKPiBwZW9wbGUncyBwYXRjaGVzLCBidXQgaGVyZSdzIG1pbmU6
Cj4KPiBJZiB5b3UgaGF2ZSBtYWRlIGNoYW5nZXMgdG8gYSBwYXRjaCBmcm9tIHNvbWVvbmUgZWxz
ZSAobWUsIGluIHRoaXMgCj4gY2FzZSksIG90aGVyIHRoYW4gcmVhbGx5IHRyaXZpYWwgdHlwbyBm
aXhlcyBvciBzdWNoLCB5b3Ugc2hvdWxkIGFkZCAKPiB5b3VyIHNpZ25lZC1vZmYtYnkuCj4KPiBB
bHNvLCBpZiB5b3UgY2hhbmdlIHRoZSBwYXRjaCBpbiBhIHdheSB0aGF0IG1pZ2h0IG1ha2UgaXQg
YmVoYXZlIAo+IGRpZmZlcmVudGx5IHRoYW4gdGhlIG9yaWdpbmFsLCB5b3Ugc2hvdWxkIGNoYW5n
ZSB0aGUgb3duZXJzaGlwIHRvIAo+IHlvdXJzZWxmLCBkcm9wIHRoZSBvcmlnaW5hbCBzaWduZWQt
b2ZmLWJ5LCBhbmQgcGVyaGFwcyBzYXkgaW4gdGhlIGRlc2MgCj4gdGhhdCB0aGUgb3JpZ2luYWwg
d2FzIHdyaXR0ZW4gYnkgeHl6LiBJIGRvbid0IHdhbnQgIm15IiBwYXRjaCB0byBjYXVzZSAKPiBr
ZXJuZWwgY3Jhc2hlcywgaWYgaXQncyByZWFsbHkgbm90IG15IGNvZGUgPSkuCkFjdHVhbGx5IEkg
ZGlkbid0IHRvdWNoIHRob3NlIHBhdGNoZXMgYSBsb3QuIEFwYXJ0IGZyb20gdGhlIGZpcnN0IG9u
ZSAKKHRoZSBhdG9taWMgc3R1ZmYpIGFuZCB0aGUga2VybmVsLWRvYyBzdHlsZSBjb21tZW50IGlu
IHRoZSBsYXN0IHBhdGNoLCAKaXQgaXMgcHJldHR5IG11Y2ggdGhlIHN0dWZmIHRoYXQgeW91IGF1
dGhvcmVkIGFuZCBpcyBub3cgcGFydCBvZiBUSSdzIHRyZWUuCj4KPiBBY3R1YWxseSwgSSBzZWUg
d2Ugbm93IGhhdmUgIkNvLWRldmVsb3BlZC1ieSIgZG9jdW1lbnRlZCBpbiAKPiBEb2N1bWVudGF0
aW9uL3Byb2Nlc3MvNS5Qb3N0aW5nLnJzdC4gVGhhdCBtYXkgYmUgc3VpdGFibGUgaGVyZS4KPgo+
IEFuZCBmb3IgdGhlIHBhdGNoZXMgdGhhdCB5b3UgZGlkbid0IHRvdWNoLCBJJ20gc3VyZSB5b3Un
dmUgc3RpbGwgZ29uZSAKPiB0aHJvdWdoIHRob3NlLCBzbyB5b3UgY291bGQgYWRkIHlvdXIgcmV2
aWV3ZWQtYnkuCgpEb25lLgoKVGhhbmtzCgpKSgoKPgo+IMKgVG9taQo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

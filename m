Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C6CE15A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 14:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108489E50;
	Mon,  7 Oct 2019 12:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E2289E50
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 12:16:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CGFAb089125;
 Mon, 7 Oct 2019 07:16:15 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CGFUH095852;
 Mon, 7 Oct 2019 07:16:15 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:16:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:16:14 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CGCAq049192;
 Mon, 7 Oct 2019 07:16:13 -0500
Subject: Re: [PATCH v3 0/8] drm/omap: OMAP_BO flags
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
References: <20191007112555.25278-1-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7c84382e-8104-231d-1b30-cee1e546cc3c@ti.com>
Date: Mon, 7 Oct 2019 15:16:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007112555.25278-1-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570450575;
 bh=KhZ7juEdWiRq7p3oJvb5SOuAyVcsb7my2J6Rw0IU2Sg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KNabWMVwKcnb1sPrdyHYx+RDnFViPW+HL9yNqtjZ5NU0mZYvjYQLa6n+t7kD01t6G
 3FicQzuajD/nXXdElip2MMOs1Xu2y/9AalvtqvuNoz603mONUdagDvWBO4arrlC0Zk
 qDARW/XCHQ4sJ5pwBPn5uxjhaPSKXgMiMBjWzppU=
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

T24gMDcvMTAvMjAxOSAxNDoyNSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPiBBIGZpcnN0
IHZlcnNpb24gb2YgdGhpcyB3b3JrIGhhZCBiZWVuIHNlbnQgYnkgVG9taSBWYWxrZWluZW4gaW4g
bWF5IDIwMTcKPiAoaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzE0
MDY2My5odG1sKS4KPiAKPiBUaGlzIHNlcmllcyBhZGRzIGEgZmV3IG5ldyBPTUFQX0JPIGZsYWdz
IHRvIGhlbHAgdGhlIHVzZXJzcGFjZSBtYW5hZ2UKPiBzaXR1YXRpb25zIHdoZXJlIGl0IG5lZWRz
IHRvIHVzZSBsb3RzIG9mIGJ1ZmZlcnMsIGFuZCB3b3VsZCBjdXJyZW50bHkgcnVuCj4gb3V0IG9m
IFRJTEVSIHNwYWNlLiBUaGUgVElMRVIgc3BhY2UgaXMgbGltaXRlZCB0byBtYXBwaW5nIDEyOE1C
IGF0IGFueSBnaXZlbgo+IHRpbWUgYW5kIHNvbWUgYXBwbGljYXRpb25zIG1pZ2h0IG5lZWQgbW9y
ZS4KPiAKPiBUaGlzIHNlcmVzIGlzIGFsc28gdGhlIG9wcG9ydHVuaXR5IHRvIGRvIHNvbWUgY2xl
YW51cCBpbiB0aGUgZmxhZ3MgYW5kCj4gaW1wcm92ZSB0aGUgY29tbWVudHMgZGVzY3JpYmluZyB0
aGVtLgo+IAo+IFRoZSB1c2VyLXNwYWNlIHBhdGNoZXMgZm9yIGxpYmRybSwgYWx0aG91Z2ggcmVh
ZHksIGhhdmVuJ3QgYmVlbiBwb3N0ZWQgeWV0Lgo+IEl0IHdpbGwgYmUgYmUgZG9uZSB3aGVuIHRo
aXMgc2VyaWVzIGhhdmUgYmVlbiBkaXNjdXNzZWQgYW5kIGhvcGVmdWxseSBpbgo+IHRoZSBwcm9j
ZXNzIG9mIGdldHRpbmcgbWVyZ2VkLgo+IAo+IEpKCj4gCj4gY2hhbmdlcyBpbiB2MzoKPiAtIHJl
YmFzZSBvbiB0b3Agb2YgdjUuNC1yYzIKPiAtIERvY3VtZW50IG9tYXBfZ2VtX25ldygpIGFuZCB0
aGUgbmV3IGZsYWdzIHVzaW5nIHRoZSBrZXJuZWwtZG9jIGZvcm1hdAo+IAo+IGNoYW5nZXMgaW4g
djI6Cj4gLSBmaXhlZCBidWlsZCBlcnJvciB0aGF0IGNyZXB0IGluIGR1cmluZyByZWJhc2UgYmVm
b3JlIHNlbmRpbmcgKHNvcnJ5Cj4gICAgYWJvdXQgdGhhdCkKPiAtIHJld29yayB0aGUgcmVmY291
bnQgcGFydCBhIGJpdC4KPiAKPiBKZWFuLUphY3F1ZXMgSGlibG90ICgxKToKPiAgICBkcm0vb21h
cDogdXNlIHJlZmNvdW50IEFQSSB0byB0cmFjayB0aGUgbnVtYmVyIG9mIHVzZXJzIG9mIGRtYV9h
ZGRyCj4gCj4gVG9taSBWYWxrZWluZW4gKDcpOgo+ICAgIGRybS9vbWFwOiBhZGQgb21hcF9nZW1f
dW5waW5fbG9ja2VkKCkKPiAgICBkcm0vb21hcDogYWNjZXB0IE5VTEwgZm9yIGRtYV9hZGRyIGlu
IG9tYXBfZ2VtX3Bpbgo+ICAgIGRybS9vbWFwOiBjbGVhbnVwIE9NQVBfQk8gZmxhZ3MKPiAgICBk
cm0vb21hcDogcmVtb3ZlIE9NQVBfQk9fVElMRUQgZGVmaW5lCj4gICAgZHJtL29tYXA6IGNsZWFu
dXAgT01BUF9CT19TQ0FOT1VUIHVzZQo+ICAgIGRybS9vbWFwOiBhZGQgb21hcF9nZW1fdmFsaWRh
dGVfZmxhZ3MoKQo+ICAgIGRybS9vbWFwOiBhZGQgT01BUF9CTyBmbGFncyB0byBhZmZlY3QgYnVm
ZmVyIGFsbG9jYXRpb24KPiAKPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3Rp
bGVyLmggIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiLmMgICAg
ICAgICB8ICAgNiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyAgICAg
ICAgfCAxOTEgKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9nZW1fZG1hYnVmLmMgfCAgIDIgKy0KPiAgIGluY2x1ZGUvdWFwaS9kcm0vb21hcF9k
cm0uaCAgICAgICAgICAgICAgIHwgIDI3ICsrLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxNjQgaW5z
ZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCgpUaGFua3MhIFRoaXMgbG9va3MgZ29vZCB0byBt
ZS4gT25lIGNvbW1lbnQsIHRob3VnaDoKClNvbWUgcGVvcGxlIG1heSBoYXZlIGRpZmZlcmVudCBv
cGluaW9ucyBvbiBob3cgdG8gbWFuYWdlIG90aGVyIHBlb3BsZSdzIApwYXRjaGVzLCBidXQgaGVy
ZSdzIG1pbmU6CgpJZiB5b3UgaGF2ZSBtYWRlIGNoYW5nZXMgdG8gYSBwYXRjaCBmcm9tIHNvbWVv
bmUgZWxzZSAobWUsIGluIHRoaXMgCmNhc2UpLCBvdGhlciB0aGFuIHJlYWxseSB0cml2aWFsIHR5
cG8gZml4ZXMgb3Igc3VjaCwgeW91IHNob3VsZCBhZGQgeW91ciAKc2lnbmVkLW9mZi1ieS4KCkFs
c28sIGlmIHlvdSBjaGFuZ2UgdGhlIHBhdGNoIGluIGEgd2F5IHRoYXQgbWlnaHQgbWFrZSBpdCBi
ZWhhdmUgCmRpZmZlcmVudGx5IHRoYW4gdGhlIG9yaWdpbmFsLCB5b3Ugc2hvdWxkIGNoYW5nZSB0
aGUgb3duZXJzaGlwIHRvIAp5b3Vyc2VsZiwgZHJvcCB0aGUgb3JpZ2luYWwgc2lnbmVkLW9mZi1i
eSwgYW5kIHBlcmhhcHMgc2F5IGluIHRoZSBkZXNjIAp0aGF0IHRoZSBvcmlnaW5hbCB3YXMgd3Jp
dHRlbiBieSB4eXouIEkgZG9uJ3Qgd2FudCAibXkiIHBhdGNoIHRvIGNhdXNlIAprZXJuZWwgY3Jh
c2hlcywgaWYgaXQncyByZWFsbHkgbm90IG15IGNvZGUgPSkuCgpBY3R1YWxseSwgSSBzZWUgd2Ug
bm93IGhhdmUgIkNvLWRldmVsb3BlZC1ieSIgZG9jdW1lbnRlZCBpbiAKRG9jdW1lbnRhdGlvbi9w
cm9jZXNzLzUuUG9zdGluZy5yc3QuIFRoYXQgbWF5IGJlIHN1aXRhYmxlIGhlcmUuCgpBbmQgZm9y
IHRoZSBwYXRjaGVzIHRoYXQgeW91IGRpZG4ndCB0b3VjaCwgSSdtIHN1cmUgeW91J3ZlIHN0aWxs
IGdvbmUgCnRocm91Z2ggdGhvc2UsIHNvIHlvdSBjb3VsZCBhZGQgeW91ciByZXZpZXdlZC1ieS4K
CiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUg
MjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3Rp
cGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD17F84E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBAC6EE23;
	Fri,  2 Aug 2019 13:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED576EE21
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:17:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72DHDDm115851;
 Fri, 2 Aug 2019 08:17:13 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72DHD7a003685
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 Aug 2019 08:17:13 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 2 Aug
 2019 08:17:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 2 Aug 2019 08:17:12 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72DHBTh025005;
 Fri, 2 Aug 2019 08:17:11 -0500
Subject: Re: [PATCH v2 0/8] drm/omap: OMAP_BO flags
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <20190708104520.24217-1-jjhiblot@ti.com>
 <911cb7a8-aec5-0e8a-d82f-aeec2777d2df@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <e75aa6aa-47ea-0a80-4df2-a75150918049@ti.com>
Date: Fri, 2 Aug 2019 15:17:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <911cb7a8-aec5-0e8a-d82f-aeec2777d2df@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564751833;
 bh=KfjNdNN6woo59tiJfigVylguMV3bxVxdRQ2x6ZyvlqQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cC06ZcN9pc1RoHw+XTBoH+2qJlD7oHdHOQ1N7Tv7M4ivlZT9ilvU+K9eAvAlFvpzj
 ku+UnsPCX7LlcQw2IIdoU1ssMsT3j8mmKPmW+HDtx0+t0tsWAARjn8ZCgN1Ia78G8K
 mk5yL9CUD6y+YdM9Ppyt7yALdTg4DgChOAh95ihQ=
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
Cc: jsarha@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDAxLzA4LzIwMTkgMTE6MDIsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+IEhpIEpKLAo+Cj4g
T24gMDgvMDcvMjAxOSAxMzo0NSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4gQSBmaXJz
dCB2ZXJzaW9uIG9mIHRoaXMgd29yayBoYWQgYmVlbiBzZW50IGJ5IFRvbWkgVmFsa2VpbmVuIGlu
IG1heSAyMDE3Cj4+IChodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2ZWwvbXNn
MTQwNjYzLmh0bWwpLgo+Pgo+PiBUaGlzIHNlcmllcyBhZGRzIGEgZmV3IG5ldyBPTUFQX0JPIGZs
YWdzIHRvIGhlbHAgdGhlIHVzZXJzcGFjZSBtYW5hZ2UKPj4gc2l0dWF0aW9ucyB3aGVyZSBpdCBu
ZWVkcyB0byB1c2UgbG90cyBvZiBidWZmZXJzLCBhbmQgd291bGQgY3VycmVudGx5IAo+PiBydW4K
Pj4gb3V0IG9mIFRJTEVSIHNwYWNlLiBUaGUgVElMRVIgc3BhY2UgaXMgbGltaXRlZCB0byBtYXBw
aW5nIDEyOE1CIGF0IAo+PiBhbnkgZ2l2ZW4KPj4gdGltZSBhbmQgc29tZSBhcHBsaWNhdGlvbnMg
bWlnaHQgbmVlZCBtb3JlLgo+Pgo+PiBUaGlzIHNlcmVzIGlzIGFsc28gdGhlIG9wcG9ydHVuaXR5
IHRvIGRvIHNvbWUgY2xlYW51cCBpbiB0aGUgZmxhZ3MgYW5kCj4+IGltcHJvdmUgdGhlIGNvbW1l
bnRzIGRlc2NyaWJpbmcgdGhlbS4KPj4KPj4gVGhlIHVzZXItc3BhY2UgcGF0Y2hlcyBmb3IgbGli
ZHJtLCBhbHRob3VnaCByZWFkeSwgaGF2ZW4ndCBiZWVuIAo+PiBwb3N0ZWQgeWV0Lgo+PiBJdCB3
aWxsIGJlIGJlIGRvbmUgd2hlbiB0aGlzIHNlcmllcyBoYXZlIGJlZW4gZGlzY3Vzc2VkIGFuZCBo
b3BlZnVsbHkgaW4KPj4gdGhlIHByb2Nlc3Mgb2YgZ2V0dGluZyBtZXJnZWQuCj4+Cj4+IEpKCj4+
Cj4+IGNoYW5nZXMgaW4gdjI6Cj4+IC0gZml4ZWQgYnVpbGQgZXJyb3IgdGhhdCBjcmVwdCBpbiBk
dXJpbmcgcmViYXNlIGJlZm9yZSBzZW5kaW5nIChzb3JyeQo+PiDCoMKgIGFib3V0IHRoYXQpCj4+
IC0gcmV3b3JrIHRoZSByZWZjb3VudCBwYXJ0IGEgYml0Lgo+Pgo+PiBKZWFuLUphY3F1ZXMgSGli
bG90ICgxKToKPj4gwqDCoCBkcm0vb21hcDogdXNlIHJlZmNvdW50IEFQSSB0byB0cmFjayB0aGUg
bnVtYmVyIG9mIHVzZXJzIG9mIGRtYV9hZGRyCj4+Cj4+IFRvbWkgVmFsa2VpbmVuICg3KToKPj4g
wqDCoCBkcm0vb21hcDogYWRkIG9tYXBfZ2VtX3VucGluX2xvY2tlZCgpCj4+IMKgwqAgZHJtL29t
YXA6IGFjY2VwdCBOVUxMIGZvciBkbWFfYWRkciBpbiBvbWFwX2dlbV9waW4KPj4gwqDCoCBkcm0v
b21hcDogY2xlYW51cCBPTUFQX0JPIGZsYWdzCj4+IMKgwqAgZHJtL29tYXA6IHJlbW92ZSBPTUFQ
X0JPX1RJTEVEIGRlZmluZQo+PiDCoMKgIGRybS9vbWFwOiBjbGVhbnVwIE9NQVBfQk9fU0NBTk9V
VCB1c2UKPj4gwqDCoCBkcm0vb21hcDogYWRkIG9tYXBfZ2VtX3ZhbGlkYXRlX2ZsYWdzKCkKPj4g
wqDCoCBkcm0vb21hcDogYWRkIE9NQVBfQk8gZmxhZ3MgdG8gYWZmZWN0IGJ1ZmZlciBhbGxvY2F0
aW9uCj4KPiBXZXJlIHRoZXJlIGFueSBjaGFuZ2VzIHRvIHRoZXNlIHBhdGNoZXMgY29tcGFyZWQg
dG8gdGhlIG9uZXMgSSBzZW50IGEgCj4gZmV3IHllYXJzIGJhY2s/CgpZZXMgdGhleSBhcmUgYSBi
aXQgZGlmZmVyZW50LiBJIHRvb2sgdGhlIHBhdGNoZXMgZnJvbSB0aGUgVEkgdHJlZSBubyAKZnJv
bSBNTC4gSW4gdGhvc2VzIHBhdGNoZXMgeW91IGhhZCBhbHJlYWR5IHRha2VuIGluIGFjY291bnQg
bW9zdCAoYWxsID8pIApvZiB0aGUgY29tbWVudHMsIGluY2x1ZGluZyBhIGJldHRlciBkZXNjcmlw
dGlvbiBvZiB0aGUgZGlmZmVyZW50IGZsYWdzIAphbmQgc29tZSBjaGFuZ2VzIGluIG5hbWVzLiBJ
IG9ubHkgbW9kaWZpZWQgYW5kIHJlb3JkZXJlZCB0aGVtIHRvIGZpeCBhIApidWlsZCBicmVha2Fn
ZS4gKHRoaXMgaXMgcmVsYXRlZCB0byBPTUFQX0JPX1RJTEVEIGJlaW5nIHJlbW92ZWQpCgpBbHNv
IEkgYWRkZWQgYSBwYXRjaCB0byBhZGRyZXNzIExhdXJlbnQncyBjb21tZW50IGFib3V0IHRoZSB1
c2Ugb2YgYXRvbWljCgoKPgo+IElmIEkgcmVjYWxsIHJpZ2h0LCBvbmUgdmFsaWQgY29tbWVudCBm
cm9tIExhdXJlbnQgd2FzIGFsc28gYWJvdXQgCj4gYWRkaW5nIGtlcm5lbC1kb2MgZm9yIGluY2x1
ZGUvdWFwaS9kcm0vb21hcF9kcm0uaC4gVGhlIE9NQVBfQk9fKiBmbGFncyAKPiBjb3VsZCBoYXZl
IGEgYml0IG1vcmUgZXhwbGFuYXRpb25zIGluIHRoZSBmb3JtIG9mIGtlcm5lbCBkb2MuCgpPSyBJ
IGRpZG4ndCBhZGRyZXNzIHRoaXMgb25lLiBJJ2xsIHVwZGF0ZSB0aGUgY29tbWVudHMgaW4gYSB2
My4KCgo+IMKgVG9taQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

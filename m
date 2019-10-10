Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69786D274E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 12:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E806EAF2;
	Thu, 10 Oct 2019 10:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AE76EAF2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 10:39:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AAdq7s004297;
 Thu, 10 Oct 2019 05:39:52 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AAdqIg052598
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 05:39:52 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 05:39:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 05:39:48 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AAdoxB108033;
 Thu, 10 Oct 2019 05:39:50 -0500
Subject: Re: [PATCH v4 0/8] drm/omap: OMAP_BO flags
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20191010093445.11069-1-jjhiblot@ti.com>
 <fc2c9bec-c3b8-bac2-1ec5-92a2f3b31694@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <831cd8a9-5f50-ae3b-7ec9-7c8b579ba315@ti.com>
Date: Thu, 10 Oct 2019 12:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc2c9bec-c3b8-bac2-1ec5-92a2f3b31694@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570703992;
 bh=UzDqO8fCb86mfGdxZvmdH/F0/4Eq3BbP0vWkAAK5sQw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wqsbz9XU0ypGfLpVsYOmd2/UJeVYRXl1+S/eSaH+q3eIgLguxKMw1fE+LGmF01yNP
 1zr7KyFPS4ZI0PBG6eKvKNt+0DbmEkXP5PySYis50OgHXLX8kUVTAN29/xkS/ovlqW
 PrUy3CZSJumMfRedjcpBiKNTJLAdfo/VBL1SjogM=
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
Cc: jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEwLzEwLzIwMTkgMTE6NDUsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+IEhpIEpKLAo+Cj4g
T24gMTAvMTAvMjAxOSAxMjozNCwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4gQSBmaXJz
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
Cj4+IGNoYW5nZXMgaW4gdjQ6Cj4+IC0gZml4ZWQgaW5jcmVtZW50YWwgYnVpbGQgaXNzdWUgaW50
cm9kdWNlZCBieSBwYXRjaCAjMSBhbmQgbGF0ZXIgCj4+IGZpeGVkIGJ5Cj4+IMKgwqAgcGF0Y2gg
IzIuCj4+IC0gQWRkZWQgbXkgcmV2aWV3ZWQtYnkgdG8gVG9taXMncyBwYXRjaAo+Cj4gVGhpcyBk
b2Vzbid0IGNvbXBpbGUgb24gdG9wIG9mIDUuNCBhcyB0aGUgbGFzdCBwYXRjaCBpcyB1c2luZyAK
PiBkbWFfZnJlZV93cml0ZWNvbWJpbmUgaW5zdGVhZCBvZiBkbWFfZnJlZV93Yy4gSW4gdjMsIGl0
IHdhcyBjb3JyZWN0LCAKPiBidXQgdGhlIGNoYW5nZW5vdGVzIGRvbid0IG1lbnRpb24gdGhlIGNo
YW5nZS4KPgo+IFdhcyB0aGVyZSBzb21lIG1peCB1cD8gV2hhdCBrZXJuZWwgYXJlIHlvdXIgcGF0
Y2hlcyBiYXNlZCBvbj8KClllcyBJIHJ1c2hlZCBhbiB0aGVuIGdvdCB0aGluZ3MgbWl4ZWQgdXAs
IGRvaW5nIG90aGVyIHN0dWZmIGluIHBhcmFsbGVsLiAKU29ycnkgYWJvdXQgdGhhdC4KCkV4cGVj
dCBhIGZpeGVkIHZlcnNpb24gYmFzZWQgb24gdjUuNC1yYzIgc29vbi4KCkpKCgoKPgo+IMKgVG9t
aQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

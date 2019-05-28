Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E652C4D9
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B012089C05;
	Tue, 28 May 2019 10:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA9C89C05
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:54:17 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SAsGjb029297;
 Tue, 28 May 2019 05:54:16 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SAsGap077783
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 05:54:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 05:54:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 05:54:16 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SAsF8G107996;
 Tue, 28 May 2019 05:54:15 -0500
Subject: Re: [PATCH 1/2] drm/omap: remove open-coded drm_invalid_op()
To: Emil Velikov <emil.l.velikov@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7f87a082-8b38-e46a-50bb-51a26efc4ab2@ti.com>
Date: Tue, 28 May 2019 13:54:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522150219.13913-1-emil.l.velikov@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559040856;
 bh=TdTscRxtFLLeqDsCZ8rbS7o6/PhOUA1Hp7F52v54r00=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=mHl3lpkGDXxf1TFSmxDW1VqVn8nrQs+joOZYjtTv/XNX1s/qUYeGnohpLpwhM51ho
 yDqf8wmBXHbvy11S44CPvmDTZQfKnMQBx0+1bc/gTUdDFxQcCebLCMnjRpJ66kpJlK
 wBuxcGlvg0hJYlDSCsU2NjWwAbGcKMILBS5nvhmQ=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMDUvMjAxOSAxODowMiwgRW1pbCBWZWxpa292IHdyb3RlOgo+IEZyb206IEVtaWwgVmVs
aWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gCj4gQ2M6IFRvbWkgVmFsa2VpbmVu
IDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZHJ2LmMgfCAxNiArLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9kcnYuYwo+IGluZGV4IDFiOWI2ZjVlNDhlMS4uNjcyZTBmOGFkMTFjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2Rydi5jCj4gQEAgLTQzOSwyMCArNDM5LDYgQEAgc3RhdGljIGludCBp
b2N0bF9nZXRfcGFyYW0oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgIAly
ZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGlvY3RsX3NldF9wYXJhbShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+IC0JCXN0cnVjdCBkcm1fZmlsZSAqZmlsZV9w
cml2KQo+IC17Cj4gLQlzdHJ1Y3QgZHJtX29tYXBfcGFyYW0gKmFyZ3MgPSBkYXRhOwo+IC0KPiAt
CXN3aXRjaCAoYXJncy0+cGFyYW0pIHsKPiAtCWRlZmF1bHQ6Cj4gLQkJREJHKCJ1bmtub3duIHBh
cmFtZXRlciAlbGxkIiwgYXJncy0+cGFyYW0pOwo+IC0JCXJldHVybiAtRUlOVkFMOwo+IC0JfQo+
IC0KPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+ICAgI2RlZmluZSBPTUFQX0JPX1VTRVJfTUFTSwkw
eDAwZmZmZmZmCS8qIGZsYWdzIHNldHRhYmxlIGJ5IHVzZXJzcGFjZSAqLwo+ICAgCj4gICBzdGF0
aWMgaW50IGlvY3RsX2dlbV9uZXcoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
PiBAQCAtNDkyLDcgKzQ3OCw3IEBAIHN0YXRpYyBpbnQgaW9jdGxfZ2VtX2luZm8oc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lv
Y3RsX2Rlc2MgaW9jdGxzW0RSTV9DT01NQU5EX0VORCAtIERSTV9DT01NQU5EX0JBU0VdID0gewo+
ICAgCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfR0VUX1BBUkFNLCBpb2N0bF9nZXRfcGFyYW0sCj4g
ICAJCQkgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCj4gLQlEUk1fSU9DVExfREVGX0RS
VihPTUFQX1NFVF9QQVJBTSwgaW9jdGxfc2V0X3BhcmFtLAo+ICsJRFJNX0lPQ1RMX0RFRl9EUlYo
T01BUF9TRVRfUEFSQU0sIGRybV9pbnZhbGlkX29wLAo+ICAgCQkJICBEUk1fQVVUSCB8IERSTV9N
QVNURVIgfCBEUk1fUk9PVF9PTkxZKSwKPiAgIAlEUk1fSU9DVExfREVGX0RSVihPTUFQX0dFTV9O
RVcsIGlvY3RsX2dlbV9uZXcsCj4gICAJCQkgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyks
Cj4gCgpUaGFua3MhIERvIHlvdSB3YW50IHRvIHRha2UgdGhpcyB2aWEgZHJtLW1pc2MgdG9vLCBv
ciBjYW4gSSBwaWNrIGl0IHVwPwoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

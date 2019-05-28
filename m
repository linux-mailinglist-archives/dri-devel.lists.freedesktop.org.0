Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA852CC8D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD116E263;
	Tue, 28 May 2019 16:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4716E263
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:49:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SGnFEw029250;
 Tue, 28 May 2019 11:49:15 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SGnFpG123229
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 11:49:15 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 11:49:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 11:49:15 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SGnEfw026121;
 Tue, 28 May 2019 11:49:14 -0500
Subject: Re: [PATCH 1/2] drm/omap: remove open-coded drm_invalid_op()
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <7f87a082-8b38-e46a-50bb-51a26efc4ab2@ti.com>
 <20190528154123.GA2768@arch-x1c3>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c344b84b-c7fd-8de7-d227-60b2988fb11b@ti.com>
Date: Tue, 28 May 2019 19:49:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528154123.GA2768@arch-x1c3>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559062155;
 bh=5wMuv3DBKlDy4dGN6LJ1v/C0u6P9Hd8UW1TOwwZKhyI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=bDngzhGvzyj0fkmqzj8vqSa0Avlqdh265gp/dsHQe/2KKtI7HTnvmrJHQxxw3GF8e
 SEGk5GtDEIrbdb9whrdIdpILJWzXTVUZ51r9MtrtsLkGpc047dIn9UCWZNFlAHAXqW
 OgybxUI8MoHK+IKF5cBuK7btIptPlkhT/TYOHWrM=
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDUvMjAxOSAxODo0MSwgRW1pbCBWZWxpa292IHdyb3RlOgo+IE9uIDIwMTkvMDUvMjgs
IFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBPbiAyMi8wNS8yMDE5IDE4OjAyLCBFbWlsIFZlbGlr
b3Ygd3JvdGU6Cj4+PiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgo+Pj4KPj4+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+
Pj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyB8IDE2
ICstLS0tLS0tLS0tLS0tLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MTUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jCj4+PiBp
bmRleCAxYjliNmY1ZTQ4ZTEuLjY3MmUwZjhhZDExYyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZHJ2LmMKPj4+IEBAIC00MzksMjAgKzQzOSw2IEBAIHN0YXRpYyBpbnQgaW9jdGxf
Z2V0X3BhcmFtKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4+PiAgICAJcmV0
dXJuIDA7Cj4+PiAgICB9Cj4+PiAtc3RhdGljIGludCBpb2N0bF9zZXRfcGFyYW0oc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPj4+IC0JCXN0cnVjdCBkcm1fZmlsZSAqZmlsZV9w
cml2KQo+Pj4gLXsKPj4+IC0Jc3RydWN0IGRybV9vbWFwX3BhcmFtICphcmdzID0gZGF0YTsKPj4+
IC0KPj4+IC0Jc3dpdGNoIChhcmdzLT5wYXJhbSkgewo+Pj4gLQlkZWZhdWx0Ogo+Pj4gLQkJREJH
KCJ1bmtub3duIHBhcmFtZXRlciAlbGxkIiwgYXJncy0+cGFyYW0pOwo+Pj4gLQkJcmV0dXJuIC1F
SU5WQUw7Cj4+PiAtCX0KPj4+IC0KPj4+IC0JcmV0dXJuIDA7Cj4+PiAtfQo+Pj4gLQo+Pj4gICAg
I2RlZmluZSBPTUFQX0JPX1VTRVJfTUFTSwkweDAwZmZmZmZmCS8qIGZsYWdzIHNldHRhYmxlIGJ5
IHVzZXJzcGFjZSAqLwo+Pj4gICAgc3RhdGljIGludCBpb2N0bF9nZW1fbmV3KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4+PiBAQCAtNDkyLDcgKzQ3OCw3IEBAIHN0YXRpYyBp
bnQgaW9jdGxfZ2VtX2luZm8oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPj4+
ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgaW9jdGxzW0RSTV9DT01NQU5E
X0VORCAtIERSTV9DT01NQU5EX0JBU0VdID0gewo+Pj4gICAgCURSTV9JT0NUTF9ERUZfRFJWKE9N
QVBfR0VUX1BBUkFNLCBpb2N0bF9nZXRfcGFyYW0sCj4+PiAgICAJCQkgIERSTV9BVVRIIHwgRFJN
X1JFTkRFUl9BTExPVyksCj4+PiAtCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfU0VUX1BBUkFNLCBp
b2N0bF9zZXRfcGFyYW0sCj4+PiArCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfU0VUX1BBUkFNLCBk
cm1faW52YWxpZF9vcCwKPj4+ICAgIAkJCSAgRFJNX0FVVEggfCBEUk1fTUFTVEVSIHwgRFJNX1JP
T1RfT05MWSksCj4+PiAgICAJRFJNX0lPQ1RMX0RFRl9EUlYoT01BUF9HRU1fTkVXLCBpb2N0bF9n
ZW1fbmV3LAo+Pj4gICAgCQkJICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+Pj4KPj4K
Pj4gVGhhbmtzISBEbyB5b3Ugd2FudCB0byB0YWtlIHRoaXMgdmlhIGRybS1taXNjIHRvbywgb3Ig
Y2FuIEkgcGljayBpdCB1cD8KPj4KPiBIb3BpbmcgdG8gcGljayB0aGlzIHZpYSBkcm0tbWlzYywg
YWxiZWl0IEkgZm9yZ290IHRvIG1lbnRpb24gZWFybGllci4KClNvdW5kcyBmaW5lIHRvIG1lLgoK
QWNrZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CgogIFRvbWkK
Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4
MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9E
b21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

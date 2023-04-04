Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B16D59D8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 09:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CD810E144;
	Tue,  4 Apr 2023 07:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CD310E144
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 07:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680594132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOZ8v52pVL5DD+Gn0MGYLxezIgSQkcNGsAlQQVJ5uHQ=;
 b=rczpZOCJplcg3kGUzumWu10j9pyrmtEYX0tOTEJGulUwch5PZbja4Y7k1nGSFPmkOAuUec
 LmPGA1KUU98IXrRquU315uAcPDBJOcbEcGh3JgYfgm30xhfTgME9c6io7kooRf0O44FfJ7
 axFFQyms00TieZjobmvfgM8I9oqO6yw=
Message-ID: <c9c9fa881aeda36862d0ad8c5a46472e0e363531.camel@crapouillou.net>
Subject: Re: [PATCH v3 01/11] dmaengine: Add API function
 dmaengine_prep_slave_dma_array()
From: Paul Cercueil <paul@crapouillou.net>
To: Hillf Danton <hdanton@sina.com>
Date: Tue, 04 Apr 2023 09:42:11 +0200
In-Reply-To: <20230404015944.502-1-hdanton@sina.com>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230404015944.502-1-hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGlsbGYsCgpMZSBtYXJkaSAwNCBhdnJpbCAyMDIzIMOgIDA5OjU5ICswODAwLCBIaWxsZiBE
YW50b24gYSDDqWNyaXTCoDoKPiBPbiAzIEFwciAyMDIzIDE3OjQ3OjUwICswMjAwIFBhdWwgQ2Vy
Y3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4gVGhpcyBmdW5jdGlvbiBjYW4gYmUgdXNl
ZCB0byBpbml0aWF0ZSBhIHNjYXR0ZXItZ2F0aGVyIERNQSB0cmFuc2Zlcgo+ID4gd2hlcmUgdGhl
IERNQSBhZGRyZXNzZXMgYW5kIGxlbmd0aHMgYXJlIGxvY2F0ZWQgaW5zaWRlIGFycmF5cy4KPiA+
IAo+ID4gVGhlIG1ham9yIGRpZmZlcmVuY2Ugd2l0aCBkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zZygp
IGlzIHRoYXQgaXQKPiA+IHN1cHBvcnRzCj4gPiBzcGVjaWZ5aW5nIHRoZSBsZW5ndGhzIG9mIGVh
Y2ggRE1BIHRyYW5zZmVyOyBhcyB0cnlpbmcgdG8gb3ZlcnJpZGUKPiA+IHRoZQo+ID4gbGVuZ3Ro
IG9mIHRoZSB0cmFuc2ZlciB3aXRoIGRtYWVuZ2luZV9wcmVwX3NsYXZlX3NnKCkgaXMgYSB2ZXJ5
Cj4gPiB0ZWRpb3VzCj4gPiBwcm9jZXNzLiBUaGUgaW50cm9kdWN0aW9uIG9mIGEgbmV3IEFQSSBm
dW5jdGlvbiBpcyBhbHNvIGp1c3RpZmllZAo+ID4gYnkgdGhlCj4gPiBmYWN0IHRoYXQgc2NhdHRl
cmxpc3RzIGFyZSBvbiB0aGVpciB3YXkgb3V0Lgo+IAo+IEdpdmVuIHNnJ3Mgd2F5b3V0IGFuZCBj
b25jZXB0dWFsbHkgaW92ZWMgYW5kIGt2ZWMgKGluCj4gaW5jbHVkZS9saW51eC91aW8uaCksCj4g
d2hhdCB5b3UgYWRkIHNob3VsZCBoYXZlIGJlZW4gZG1hX3ZlYyB0byBlYXNlIHBlb3BsZSBtYWtp
bmcgdXNlIG9mCj4gaXQuCj4gCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfdmVjIHsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV9hZGRyX3TCoMKgwqDCoMKgwqBhZGRy
Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2l6ZV90wqDCoMKgwqDCoMKgwqDC
oMKgwqBsZW47Cj4gwqDCoMKgwqDCoMKgwqDCoH07CgpXZWxsIGl0J3Mgbm90IHRvbyBsYXRlIDsp
CgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KCkNoZWVycywKLVBhdWwKCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4gCj4gPiAt
LS0KPiA+IHYzOiBOZXcgcGF0Y2gKPiA+IC0tLQo+ID4gwqBpbmNsdWRlL2xpbnV4L2RtYWVuZ2lu
ZS5oIHwgMTYgKysrKysrKysrKysrKysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWFlbmdpbmUuaCBi
L2luY2x1ZGUvbGludXgvZG1hZW5naW5lLmgKPiA+IGluZGV4IGMzNjU2ZTU5MDIxMy4uNjJlZmEy
OGMwMDlhIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWFlbmdpbmUuaAo+ID4gKysr
IGIvaW5jbHVkZS9saW51eC9kbWFlbmdpbmUuaAo+ID4gQEAgLTkxMiw2ICs5MTIsMTEgQEAgc3Ry
dWN0IGRtYV9kZXZpY2Ugewo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfYXN5bmNfdHhf
ZGVzY3JpcHRvcgo+ID4gKigqZGV2aWNlX3ByZXBfZG1hX2ludGVycnVwdCkoCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfY2hhbiAqY2hhbiwgdW5zaWduZWQg
bG9uZyBmbGFncyk7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRtYV9hc3luY190
eF9kZXNjcmlwdG9yCj4gPiAqKCpkZXZpY2VfcHJlcF9zbGF2ZV9kbWFfYXJyYXkpKAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfY2hhbiAqY2hhbiwgZG1hX2Fk
ZHJfdCAqYWRkcnMsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2l6ZV90ICps
ZW5ndGhzLCBzaXplX3QgbmIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZW51
bSBkbWFfdHJhbnNmZXJfZGlyZWN0aW9uIGRpcmVjdGlvbiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nIGZsYWdzKTsKPiAKPiBUaGVuIHRoZSBjYWxsYmFj
ayBsb29rcyBsaWtlCj4gCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfYXN5bmNfdHhfZGVz
Y3JpcHRvciAqKCpkZXZpY2VfcHJlcF9zbGF2ZV92ZWMpKAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgc3RydWN0IGRtYV9jaGFuICpjaGFuLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgc3RydWN0IGRtYV92ZWMgKnZlYywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGludCBudmVjLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZW51
bSBkbWFfdHJhbnNmZXJfZGlyZWN0aW9uIGRpcmVjdGlvbiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwoK


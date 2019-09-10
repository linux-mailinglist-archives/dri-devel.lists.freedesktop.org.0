Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71ECAE7A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 12:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F056E02B;
	Tue, 10 Sep 2019 10:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05F26E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 10:10:05 +0000 (UTC)
Date: Tue, 10 Sep 2019 10:09:55 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: two planes with the same zpos have undefined ordering
Message-ID: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1568110203;
 bh=pLcs3TZTeMmGkKU5PLXsaMqGRuSBRvvwKGFmGE8qCzI=;
 h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
 b=hC4keIgezkPUPCMmV6BRSEtF1CNCdz0pbQSbuUc08bB2yxniPcFVXezsZtL4OJUuR
 TSHC1Bz9KvxDzjo0/ZIAYN0mCTuH6WswsHdXOkUtmDDWBv3HZVJxSF1OjGrOWVEbpT
 BaMOfif87+J+ZGvd1CXQvPs/+11plhD7n3gXKgDQ=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: daniel.vetter@ffwll.ch, pekka.paalanen@collabora.com, daniels@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHRoZSBwcm9wZXJ0eSBkb2NzIGRvbid0IHNwZWNpZnkgd2hldGhlciBpdCdzIG9r
YXkgZm9yIHR3byBwbGFuZXMgdG8KaGF2ZSB0aGUgc2FtZSB6cG9zIHZhbHVlIGFuZCB3aGF0IHVz
ZXItc3BhY2Ugc2hvdWxkIGV4cGVjdCBpbiB0aGlzIGNhc2UuCgpUaGUgcnVsZSBtZW50aW9ubmVk
IGluIHRoZSBwYXN0IHdhcyB0byBkaXNhbWJpZ3VhdGUgd2l0aCBvYmplY3QgSURzLiBIb3dldmVy
CnNvbWUgZHJpdmVycyBicmVhayB0aGlzIHJ1bGUgKHRoYXQncyB3aHkgdGhlIG9yZGVyaW5nIGlz
IGRvY3VtZW50ZWQgYXMKdW5zcGVjaWZpZWQgaW4gY2FzZSB0aGUgenBvcyBwcm9wZXJ0eSBpcyBt
aXNzaW5nKS4gQWRkaXRpb25hbGx5IGl0IGRvZXNuJ3QKcmVhbGx5IG1ha2Ugc2Vuc2UgZm9yIGEg
ZHJpdmVyIHRvIHVzZXIgaWRlbnRpY2FsIHpwb3MgdmFsdWVzIGlmIGl0IGtub3dzIHRoZWlyCnJl
bGF0aXZlIHBvc2l0aW9uOiB0aGUgZHJpdmVyIGNhbiBqdXN0IHBpY2sgZGlmZmVyZW50IHZhbHVl
cyBpbnN0ZWFkLgoKU28gdHdvIHNvbHV0aW9ucyB3b3VsZCBtYWtlIHNlbnNlOiBlaXRoZXIgZGlz
YWxsb3cgY29tcGxldGVseSBpZGVudGljYWwgenBvcwp2YWx1ZXMgZm9yIHR3byBkaWZmZXJlbnQg
cGxhbmVzLCBlaXRoZXIgbWFrZSB0aGUgb3JkZXJpbmcgdW5zcGVjaWZpZWQuIFRvIGFsbG93CmRy
aXZlcnMgdGhhdCBkb24ndCBrbm93IHRoZSByZWxhdGl2ZSBvcmRlcmluZyBiZXR3ZWVuIHR3byBw
bGFuZXMgdG8gc3RpbGwKZXhwb3NlIHRoZSB6cG9zIHByb3BlcnR5LCBjaG9vc2UgdGhlIGxhdHRl
ciBzb2x1dGlvbi4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5m
cj4KLS0tCgpFcnIsIEknbSBzb3JyeSBhYm91dCB0aGUgZG91YmxlLXBvc3QuIEkgc2VudCB0aGlz
IHRvIGludGVsLWdmeCBieSBtaXN0YWtlLgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fYmxlbmQuYyB8
IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9ibGVuZC5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9ibGVuZC5jCmluZGV4IGQwMjcwOWRkMmQ0YS4uNTFiZDU0NTRlNTBhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9ibGVuZC5jCkBAIC0xMzIsMTAgKzEzMiwxMCBAQAogICoJcGxhbmVzLiBXaXRob3V0IHRo
aXMgcHJvcGVydHkgdGhlIHByaW1hcnkgcGxhbmUgaXMgYWx3YXlzIGJlbG93IHRoZSBjdXJzb3IK
ICAqCXBsYW5lLCBhbmQgb3JkZXJpbmcgYmV0d2VlbiBhbGwgb3RoZXIgcGxhbmVzIGlzIHVuZGVm
aW5lZC4gVGhlIHBvc2l0aXZlCiAgKglaIGF4aXMgcG9pbnRzIHRvd2FyZHMgdGhlIHVzZXIsIGku
ZS4gcGxhbmVzIHdpdGggbG93ZXIgWiBwb3NpdGlvbiB2YWx1ZXMKLSAqCWFyZSB1bmRlcm5lYXRo
IHBsYW5lcyB3aXRoIGhpZ2hlciBaIHBvc2l0aW9uIHZhbHVlcy4gTm90ZSB0aGF0IHRoZSBaCi0g
Kglwb3NpdGlvbiB2YWx1ZSBjYW4gYWxzbyBiZSBpbW11dGFibGUsIHRvIGluZm9ybSB1c2Vyc3Bh
Y2UgYWJvdXQgdGhlCi0gKgloYXJkLWNvZGVkIHN0YWNraW5nIG9mIG92ZXJsYXkgcGxhbmVzLCBz
ZWUKLSAqCWRybV9wbGFuZV9jcmVhdGVfenBvc19pbW11dGFibGVfcHJvcGVydHkoKS4KKyAqCWFy
ZSB1bmRlcm5lYXRoIHBsYW5lcyB3aXRoIGhpZ2hlciBaIHBvc2l0aW9uIHZhbHVlcy4gVHdvIHBs
YW5lcyB3aXRoIHRoZQorICoJc2FtZSBaIHBvc2l0aW9uIHZhbHVlIGhhdmUgdW5kZWZpbmVkIG9y
ZGVyaW5nLiBOb3RlIHRoYXQgdGhlIFogcG9zaXRpb24KKyAqCXZhbHVlIGNhbiBhbHNvIGJlIGlt
bXV0YWJsZSwgdG8gaW5mb3JtIHVzZXJzcGFjZSBhYm91dCB0aGUgaGFyZC1jb2RlZAorICoJc3Rh
Y2tpbmcgb2Ygb3ZlcmxheSBwbGFuZXMsIHNlZSBkcm1fcGxhbmVfY3JlYXRlX3pwb3NfaW1tdXRh
YmxlX3Byb3BlcnR5KCkuCiAgKgogICogcGl4ZWwgYmxlbmQgbW9kZToKICAqCVBpeGVsIGJsZW5k
IG1vZGUgaXMgc2V0IHVwIHdpdGggZHJtX3BsYW5lX2NyZWF0ZV9ibGVuZF9tb2RlX3Byb3BlcnR5
KCkuCi0tCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

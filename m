Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ACD5AF65
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 10:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5F3899BB;
	Sun, 30 Jun 2019 08:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26814899BB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 08:18:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8F5C220065;
 Sun, 30 Jun 2019 10:18:34 +0200 (CEST)
Date: Sun, 30 Jun 2019 10:18:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] DRM: ingenic: Use devm_platform_ioremap_resource
Message-ID: <20190630081833.GC5081@ravnborg.org>
References: <20190627182114.27299-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627182114.27299-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=7gkXJVJtAAAA:8 a=aVMsacSFOT9BCqWdKMAA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCk9uIFRodSwgSnVuIDI3LCAyMDE5IGF0IDA4OjIxOjEyUE0gKzAyMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gU2ltcGxpZnkgYSBiaXQgdGhlIHByb2JlIGZ1bmN0aW9uIGJ5IHVz
aW5nIHRoZSBuZXdseSBpbnRyb2R1Y2VkCj4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNl
KCksIGluc3RlYWQgb2YgaGF2aW5nIHRvIGNhbGwKPiBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSBm
b2xsb3dlZCBieSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdl
bmljLWRybS5jCj4gaW5kZXggYTA2OTU3OWNhNzQ5Li4wMmM0Nzg4ZWYxYzcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPiBAQCAtNTgwLDcgKzU4MCw2IEBAIHN0YXRp
YyBpbnQgaW5nZW5pY19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
CXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7Cj4gIAlzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsK
PiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07Cj4gLQlzdHJ1Y3QgcmVzb3VyY2UgKm1lbTsKPiAg
CXZvaWQgX19pb21lbSAqYmFzZTsKPiAgCWxvbmcgcGFyZW50X3JhdGU7Cj4gIAlpbnQgcmV0LCBp
cnE7Cj4gQEAgLTYxNCw4ICs2MTMsNyBAQCBzdGF0aWMgaW50IGluZ2VuaWNfZHJtX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlkcm0tPm1vZGVfY29uZmlnLm1heF9oZWln
aHQgPSA2MDA7Cj4gIAlkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0gJmluZ2VuaWNfZHJtX21vZGVf
Y29uZmlnX2Z1bmNzOwo+ICAKPiAtCW1lbSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJ
T1JFU09VUkNFX01FTSwgMCk7Cj4gLQliYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwg
bWVtKTsKPiArCWJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7
Cj4gIAlpZiAoSVNfRVJSKGJhc2UpKSB7Cj4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0
IG1lbW9yeSByZXNvdXJjZSIpOwpDb25zaWRlciB0byBpbmNsdWRlIHRoZSBlcnJvciBjb2RlIGlu
IHRoZSBlcnJvciBtZXNzYWdlIGhlcmUuCj4gIAkJcmV0dXJuIFBUUl9FUlIoYmFzZSk7CgpXaXRo
IHRoZSBhYm92ZSBmaXhlZC9jb25zaWRlcmVkOgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

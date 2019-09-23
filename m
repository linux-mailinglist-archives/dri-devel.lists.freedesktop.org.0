Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931DBB5C1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682EC89EB7;
	Mon, 23 Sep 2019 13:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8569D89EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:50:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 385461000;
 Mon, 23 Sep 2019 06:50:01 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18CEF3F694;
 Mon, 23 Sep 2019 06:50:01 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id CE9F4682855; Mon, 23 Sep 2019 14:49:59 +0100 (BST)
Date: Mon, 23 Sep 2019 14:49:59 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH 10/36] drm/arm: use bpp instead of cpp for drm_format_info
Message-ID: <20190923134959.fm3fukhnzvazvsq5@e110455-lin.cambridge.arm.com>
References: <1569242784-182780-1-git-send-email-hjc@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569242784-182780-1-git-send-email-hjc@rock-chips.com>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ayan Halder <ayan.halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDg6NDY6MjNQTSArMDgwMCwgU2FuZHkgSHVhbmcgd3Jv
dGU6Cj4gY3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9y
bWF0IGNvcnJlY3RseSwKPiBTbyB3ZSB1c2UgYnBwW0JpdFBlclBsYW5lXSB0byBpbnN0ZWFkIGNw
cC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgoK
QWRkaW5nIEF5YW4gYXMgd2VsbC4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMgfCAyICst
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwo+IGluZGV4IDNiMGE3MGUuLmQwMmRmYzYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZnJhbWVidWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ZyYW1lYnVmZmVyLmMKPiBAQCAtODksNyArODksNyBAQCBrb21lZGFfZmJfYWZiY19z
aXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAo+
ICAJCQkJICAgIGFsaWdubWVudF9oZWFkZXIpOwo+ICAKPiAgCWtmYi0+YWZiY19zaXplID0ga2Zi
LT5vZmZzZXRfcGF5bG9hZCArIG5fYmxvY2tzICoKPiAtCQkJIEFMSUdOKGluZm8tPmNwcFswXSAq
IEFGQkNfU1VQRVJCTEtfUElYRUxTLAo+ICsJCQkgQUxJR04oaW5mby0+YnBwWzBdIC8gOCAqIEFG
QkNfU1VQRVJCTEtfUElYRUxTLAo+ICAJCQkgICAgICAgQUZCQ19TVVBFUkJMS19BTElHTk1FTlQp
Owo+ICAJbWluX3NpemUgPSBrZmItPmFmYmNfc2l6ZSArIGZiLT5vZmZzZXRzWzBdOwo+ICAJaWYg
KG1pbl9zaXplID4gb2JqLT5zaXplKSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2h3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5jCj4gaW5kZXgg
YmQ4MjY1Zi4uNTRiZThkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlk
cF9ody5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYwo+IEBAIC0zODQs
NyArMzg0LDcgQEAgc3RhdGljIHZvaWQgbWFsaWRwNTAwX21vZGVzZXQoc3RydWN0IG1hbGlkcF9o
d19kZXZpY2UgKmh3ZGV2LCBzdHJ1Y3QgdmlkZW9tb2RlICoKPiAgaW50IG1hbGlkcF9mb3JtYXRf
Z2V0X2JwcCh1MzIgZm10KQo+ICB7Cj4gIAljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpp
bmZvID0gZHJtX2Zvcm1hdF9pbmZvKGZtdCk7Cj4gLQlpbnQgYnBwID0gaW5mby0+Y3BwWzBdICog
ODsKPiArCWludCBicHAgPSBpbmZvLT5icHBbMF07Cj4gIAo+ICAJaWYgKGJwcCA9PSAwKSB7Cj4g
IAkJc3dpdGNoIChmbXQpIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxp
ZHBfcGxhbmVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwo+IGluZGV4
IDNjNzBhNTMuLjYyOGYzMjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxp
ZHBfcGxhbmVzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwo+
IEBAIC0yMjUsNyArMjI1LDcgQEAgYm9vbCBtYWxpZHBfZm9ybWF0X21vZF9zdXBwb3J0ZWQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRybSwKPiAgCj4gIAlpZiAobW9kaWZpZXIgJiBBRkJDX1NQTElUKSB7
Cj4gIAkJaWYgKCFpbmZvLT5pc195dXYpIHsKPiAtCQkJaWYgKGluZm8tPmNwcFswXSA8PSAyKSB7
Cj4gKwkJCWlmIChpbmZvLT5icHBbMF0gPD0gMTYpIHsKPiAgCQkJCURSTV9ERUJVR19LTVMoIlJH
QiBmb3JtYXRzIDw9IDE2YnBwIGFyZSBub3Qgc3VwcG9ydGVkIHdpdGggU1BMSVRcbiIpOwo+ICAJ
CQkJcmV0dXJuIGZhbHNlOwo+ICAJCQl9Cj4gLS0gCj4gMi43LjQKPiAKPiAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIAo9PT09PT09
PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBi
dXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwog
IC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

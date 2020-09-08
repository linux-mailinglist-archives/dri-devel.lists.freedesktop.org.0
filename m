Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A575C26234E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 01:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFBA6E0A5;
	Tue,  8 Sep 2020 23:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654F66E0A5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 23:00:38 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF4B8205F4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 23:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599606038;
 bh=kitxeKqTb1SkttblH1PFR/F1RSZAOgchGlw4pmXLPR4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tVBq29fRvmgkUXqxtVlm1rv0uHT4MUPp1xMvHuV1D1PBfL8JsX2z9h9MaOwikARcG
 TMy632/+ui+jSUSg2LS8DlwAfVWVl2KI4fIdyXZZVaXr9dCE1TzkXbDxRvfm8ARw5b
 TjUN3NvzpAV3wyNEiXREwDiQR0y8E8RA0WI7cxSQ=
Received: by mail-ed1-f46.google.com with SMTP id n22so730352edt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 16:00:37 -0700 (PDT)
X-Gm-Message-State: AOAM533xw914yYaB1VK6fH1mI7i7AXlbSP59frdjP2ylIt2I5jiTbxdW
 +KB53IrtiBiQe2nUewrubjcJPL6u1KCGHuLCAw==
X-Google-Smtp-Source: ABdhPJyPiIdQrdq1PbYXe0iA9zr48itBPN3RHIQwoJr3R0CaiWDz9cHj2oGQBCui9qdbPA6GuRLYiCuHQpDGngRMWok=
X-Received: by 2002:aa7:c158:: with SMTP id r24mr1265632edp.61.1599606036304; 
 Tue, 08 Sep 2020 16:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200902220542.60-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200902220542.60-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 9 Sep 2020 07:00:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__aLb+mm1v5bCRVTaOGM7Q=pyc0t995kmMY23ktqs3OkA@mail.gmail.com>
Message-ID: <CAAOTY__aLb+mm1v5bCRVTaOGM7Q=pyc0t995kmMY23ktqs3OkA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Use CPU when fail to get cmdq event
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0OeaciDPm
l6Ug6YCx5ZubIOS4iuWNiDY6MDblr6vpgZPvvJoKPgo+IEV2ZW4gdGhvdWdoIGNtZHEgY2xpZW50
IGlzIGNyZWF0ZWQgc3VjY2Vzc2Z1bGx5LCB3aXRob3V0IHRoZSBjbWRxIGV2ZW50LAo+IGNtZHEg
Y291bGQgbm90IHdvcmsgY29ycmVjdGx5LCBzbyB1c2UgQ1BVIHdoZW4gZmFpbCB0byBnZXQgY21k
cSBldmVudC4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsxXS4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tZml4ZXMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gRml4ZXM6IDYwZmE4YzEzYWIxYSAoImRybS9tZWRpYXRlazogTW92ZSBnY2UgZXZlbnQgcHJv
cGVydHkgdG8gbXV0ZXggZGV2aWNlIG5vZGUiKQo+IFNpZ25lZC1vZmYtYnk6IENodW4tS3Vhbmcg
SHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCAzZmM1NTExMzMwYjkuLjRkMjk1Njhi
ZTNmNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAt
ODMxLDEzICs4MzEsMTkgQEAgaW50IG10a19kcm1fY3J0Y19jcmVhdGUoc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10
a19jcnRjLT5iYXNlKSk7Cj4gICAgICAgICAgICAgICAgIG10a19jcnRjLT5jbWRxX2NsaWVudCA9
IE5VTEw7Cj4gICAgICAgICB9Cj4gLSAgICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9p
bmRleChwcml2LT5tdXRleF9ub2RlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIm1lZGlhdGVrLGdjZS1ldmVudHMiLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtdGtfY3J0Yy0+Y21kcV9ldmVu
dCk7Cj4gLSAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgIm10
a19jcnRjICVkIGZhaWxlZCB0byBnZXQgbWVkaWF0ZWssZ2NlLWV2ZW50cyBwcm9wZXJ0eVxuIiwK
PiAtICAgICAgICAgICAgICAgICAgICAgICBkcm1fY3J0Y19pbmRleCgmbXRrX2NydGMtPmJhc2Up
KTsKPiArCj4gKyAgICAgICBpZiAobXRrX2NydGMtPmNtZHFfY2xpZW50KSB7Cj4gKyAgICAgICAg
ICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KHByaXYtPm11dGV4X25vZGUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtZWRp
YXRlayxnY2UtZXZlbnRzIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm10a19jcnRjLT5jbWRxX2V2
ZW50KTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9kYmcoZGV2LCAibXRrX2NydGMgJWQgZmFpbGVkIHRvIGdldCBtZWRpYXRlayxnY2Ut
ZXZlbnRzIHByb3BlcnR5XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJt
X2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y21kcV9tYm94X2Rlc3Ryb3kobXRrX2NydGMtPmNtZHFfY2xpZW50KTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBtdGtfY3J0Yy0+Y21kcV9jbGllbnQgPSBOVUxMOwo+ICsgICAgICAgICAgICAg
ICB9Cj4gKyAgICAgICB9Cj4gICNlbmRpZgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAtLQo+
IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71791102DB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456926E84E;
	Tue,  3 Dec 2019 16:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04976E84E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:49:49 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id d17so1809423qvs.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=104Kfz5fD0oiM2Sm+DE5Ex5aiOvtQWaAUuITWsQPfe0=;
 b=NPoKCzVqsDlN1wEDIqkXoQ4xUGiSg54NG6dbaWTYgsmGnW4Ez4B+xRq2q9OjXEDgkr
 xa1VsI0yvUzx76XlzdmzncOhnF2GZO/CG6ODUo6H9dsJudI0jbxDqttqh2fy5HnhIndL
 hR/Q6pCIaOorv85Kf+lHJwlJ0PK+9P9GgCmIpd2G7Pb+2GEdjm9twq71bnmH7eQfzbqs
 8pSlYeMwedEX5C+uF9u6gYhU70xvxA9R2MF4AjdcYc01NSgOCdGP3GSyDNeTB1RDJofK
 yK2VyWCzzATIHhjXmN7pPPPFiurXEt8Qu8d17vQEAnJDWlhVdtTZkZARePbo+j7X+8fp
 VJTw==
X-Gm-Message-State: APjAAAUYMA2NM1PAeM8dye9Ybl1aBLV/D8aJkf042iJ7g74gQwER8pFo
 mJAss155GqI7+RXCAMvsmdYSimM0fdsiwo8O03UUAg==
X-Google-Smtp-Source: APXvYqw789kzB7L+yI5BNbFst52LP0TMv05Fld0WPEiCmHmmiS5hGECTrBK2NxcJ75kkVtV98yHGdkULS4yGDX4RoI4=
X-Received: by 2002:a0c:e806:: with SMTP id y6mr5989614qvn.148.1575391788850; 
 Tue, 03 Dec 2019 08:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20191119105753.32363-1-benjamin.gaignard@st.com>
In-Reply-To: <20191119105753.32363-1-benjamin.gaignard@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 3 Dec 2019 17:49:37 +0100
Message-ID: <CA+M3ks7C+_B+4Jxy+55bFoWct7j=WseoPKxxh7KLOZ0LhEUL7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-cma-helpers: Fix include issue
To: Benjamin Gaignard <benjamin.gaignard@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=104Kfz5fD0oiM2Sm+DE5Ex5aiOvtQWaAUuITWsQPfe0=;
 b=BoozgF3oMa3hbp8E3+PrWRBCAnTGV/9mclA8n9N2uQ6CCpndb6XChQolCXQc8qX9Zc
 d7kh/uiilaB/ec8fZ6SEQ7ImGTwmOZLues3YqcycSa7EUZp4SyByXa0/66/rojimla1o
 Kli0p7F7i0ijhOLiDUmbPJvuFZYqYVTHAALrt/VCqF3FC/HRqctY7Jhkh8bcQkcWWhAW
 ExAaXaeqPsY1a+ngxtVgxlHNQjclaI/7+jCpTWJI2hYm35jUZLYjPyPUvHrwndsNc5F1
 53p5CXBVVoiIoNq5pIbXZasotRnIoVZcoXA3Pwvewi1Q4uGiPWwHaB6Vom72ZfvJuK7A
 5NWA==
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAyMCBub3YuIDIwMTkgw6AgMDA6MjgsIEJlbmphbWluIEdhaWduYXJkCjxiZW5qYW1p
bi5nYWlnbmFyZEBzdC5jb20+IGEgw6ljcml0IDoKPgo+IEV4cG9ydGVkIGZ1bmN0aW9ucyBwcm90
b3R5cGVzIGFyZSBtaXNzaW5nIGluIGRybV9mYl9jbWFfaGVscGVyLmMKPiBJbmNsdWRlIGRybV9m
Yl9jbWFfaGVscGVyIHRvIGZpeCB0aGF0IGlzc3VlLgo+CgpHZW50bGUgcGluZyB0byByZXZpZXdl
cnMuClRoYW5rcywKQmVuamFtaW4KCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQg
PGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9m
Yl9jbWFfaGVscGVyLmMgfCAxICsKPiAgaW5jbHVkZS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaCAg
ICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2NtYV9oZWxwZXIuYwo+IGluZGV4IGMwYjBmNjAzYWY2My4uOTgwMWMwMzMzZWNh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMKPiBAQCAtOSw2ICs5LDcgQEAK
PiAgICogIENvcHlyaWdodCAoQykgMjAxMiBSZWQgSGF0Cj4gICAqLwo+Cj4gKyNpbmNsdWRlIDxk
cm0vZHJtX2ZiX2NtYV9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+Cj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2ZyYW1lYnVmZmVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2dl
bV9jbWFfaGVscGVyLmg+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mYl9jbWFfaGVs
cGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZmJfY21hX2hlbHBlci5oCj4gaW5kZXggNGJlY2IwOTk3
NWE0Li43OTVhZWExZDBhMjUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZiX2NtYV9o
ZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmgKPiBAQCAtMiw2
ICsyLDggQEAKPiAgI2lmbmRlZiBfX0RSTV9GQl9DTUFfSEVMUEVSX0hfXwo+ICAjZGVmaW5lIF9f
RFJNX0ZCX0NNQV9IRUxQRVJfSF9fCj4KPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gKwo+
ICBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyOwo+ICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlOwo+Cj4g
LS0KPiAyLjE1LjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

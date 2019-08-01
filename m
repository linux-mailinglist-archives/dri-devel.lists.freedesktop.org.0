Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F81C7D3D7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083C26E347;
	Thu,  1 Aug 2019 03:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057E6E347
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:05 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q10so33140442pff.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I6qZv0NvjQC+of1GCo/KYasdnS8lE77yp0QRLPQskL4=;
 b=WkhJBdLbEDcvM5Fi3hYzuYjsES+/7Os9sS2fzHXnbBMM215Px+zJmV6/JOqgoMb1pA
 y81w+VnvXAZ1e1edN0S3Mm4WmUhs0tQZNuVXOVXGd1V6RCjSl+8GGv2d3R2xL7+N2d3R
 fyyFXwG7FgXp+SHYQ2qZ6bpo6HthEAfKDC+GX8za/GnKN444JmYPiXF2CWRETwZKrmvH
 cRGiWVfyn+zeM3+1GsO54JVhgvkMnq/hwXVZ8Pb9d135bGuZm3Nwyta6G5cMAqEY5XaG
 lEHHtyclHNE+k/QvN0APbWpRRnzUR1nxOUXxtQ26cUUpbg1cVIjuu+zQgpoYe0SG4jxn
 FLKg==
X-Gm-Message-State: APjAAAX6/afnA3pJFbZhzzaoEXvhvZVg3xih7WB9j2APnovLl0RAAnAi
 IaYEHombx/4a/a4U4JAuu7/Opw==
X-Google-Smtp-Source: APXvYqxUEZw4Ikiw5sPRlsiT0HMzQNoep47eydFV0J+SZ+HRTQlJnXdxw75yrCSKiMMwJ0sb6ZaAkQ==
X-Received: by 2002:aa7:858b:: with SMTP id w11mr48729384pfn.68.1564631103854; 
 Wed, 31 Jul 2019 20:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.45.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:03 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/26] drm: kirin: Move kirin_crtc, kirin_plane,
 kirin_format to kirin_drm_drv.h
Date: Thu,  1 Aug 2019 03:44:25 +0000
Message-Id: <20190801034439.98227-13-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I6qZv0NvjQC+of1GCo/KYasdnS8lE77yp0QRLPQskL4=;
 b=LBUfraRwXQ6hIm+t+I/z/szQ5a8tgSCA4WdSllvNls0e5Nmk1uCQ2OME2rTVKCxaFd
 fngthY7x8jwqxMzhlDSSAPuf7WZ/nRF64rC4vBNmFt1GkBc12ggTPnQ09OsaW5LTRiWr
 x82tyGYfkY6Y0pm6An9Iy3boW/JM1v+63ieHcOcRDe9sTqNCyHocXaIithN1zPNnjO6F
 LSxl8VHiwJTxo1qKuN9yWyqIgv27CRxkW4enkqZuYxbfrLwwl6AD744a7bnYyMT22jJN
 Vpv8LCFdZCA8Max387n4rr8xtsDps7DxU9Jw5g1CzEMtVoAxbfuGn4h0tSUa40Vf7FYP
 QA9g==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggbW92ZXMgc29tZSBzaGFyZWQKc3RydWN0dXJlcyBh
bmQgaGVscGVycyB0byB0aGUgY29tbW9uIGtpcmluX2RybV9kcnYuaAoKVGhlc2Ugc3RydWN0dXJl
cyB3aWxsIGxhdGVyIHVzZWQgYnkgYm90aCBraXJpbjYyMCBhbmQKZnV0dXJlIGtpcmluOTYwIGRy
aXZlcgoKQ2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5nQGhp
c2lsaWNvbi5jb20+Cltqc3R1bHR6OiByZXdvcmRlZCBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9m
Zi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogLi4uL2dwdS9k
cm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyAgIHwgMjcgKystLS0tLS0tLS0tLS0t
LS0tLQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaCAgIHwgMjQg
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJp
bi9raXJpbl9kcm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9hZGUuYwppbmRleCBlYzQ4NTdlNDViNmUuLjNhZDFlMjkwYmY1OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKQEAgLTM4LDEyICsz
OCw2IEBACiAjZGVmaW5lIE9VVF9PVkxZCUFERV9PVkxZMiAvKiBvdXRwdXQgb3ZlcmxheSBjb21w
b3NpdG9yICovCiAjZGVmaW5lIEFERV9ERUJVRwkxCiAKLSNkZWZpbmUgdG9fa2lyaW5fY3J0Yyhj
cnRjKSBcCi0JY29udGFpbmVyX29mKGNydGMsIHN0cnVjdCBraXJpbl9jcnRjLCBiYXNlKQotCi0j
ZGVmaW5lIHRvX2tpcmluX3BsYW5lKHBsYW5lKSBcCi0JY29udGFpbmVyX29mKHBsYW5lLCBzdHJ1
Y3Qga2lyaW5fcGxhbmUsIGJhc2UpCi0KIAogc3RydWN0IGFkZV9od19jdHggewogCXZvaWQgX19p
b21lbSAgKmJhc2U7CkBAIC01OSwxOCArNTMsNiBAQCBzdHJ1Y3QgYWRlX2h3X2N0eCB7CiAJc3Ry
dWN0IGRybV9jcnRjICpjcnRjOwogfTsKIAotc3RydWN0IGtpcmluX2NydGMgewotCXN0cnVjdCBk
cm1fY3J0YyBiYXNlOwotCXZvaWQgKmh3X2N0eDsKLQlib29sIGVuYWJsZTsKLX07Ci0KLXN0cnVj
dCBraXJpbl9wbGFuZSB7Ci0Jc3RydWN0IGRybV9wbGFuZSBiYXNlOwotCXZvaWQgKmh3X2N0eDsK
LQl1MzIgY2g7Ci19OwotCiBzdHJ1Y3QgYWRlX2RhdGEgewogCXN0cnVjdCBraXJpbl9jcnRjIGNy
dGM7CiAJc3RydWN0IGtpcmluX3BsYW5lIHBsYW5lc1tBREVfQ0hfTlVNXTsKQEAgLTc4LDEyICs2
MCw3IEBAIHN0cnVjdCBhZGVfZGF0YSB7CiB9OwogCiAvKiBhZGUtZm9ybWF0IGluZm86ICovCi1z
dHJ1Y3QgYWRlX2Zvcm1hdCB7Ci0JdTMyIHBpeGVsX2Zvcm1hdDsKLQllbnVtIGFkZV9mYl9mb3Jt
YXQgYWRlX2Zvcm1hdDsKLX07Ci0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgYWRlX2Zvcm1hdCBhZGVf
Zm9ybWF0c1tdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBraXJpbl9mb3JtYXQgYWRlX2Zvcm1h
dHNbXSA9IHsKIAkvKiAxNmJwcCBSR0I6ICovCiAJeyBEUk1fRk9STUFUX1JHQjU2NSwgQURFX1JH
Ql81NjUgfSwKIAl7IERSTV9GT1JNQVRfQkdSNTY1LCBBREVfQkdSXzU2NSB9LApAQCAtMTI3LDcg
KzEwNCw3IEBAIHN0YXRpYyB1MzIgYWRlX2dldF9mb3JtYXQodTMyIHBpeGVsX2Zvcm1hdCkKIAog
CWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGFkZV9mb3JtYXRzKTsgaSsrKQogCQlpZiAoYWRl
X2Zvcm1hdHNbaV0ucGl4ZWxfZm9ybWF0ID09IHBpeGVsX2Zvcm1hdCkKLQkJCXJldHVybiBhZGVf
Zm9ybWF0c1tpXS5hZGVfZm9ybWF0OworCQkJcmV0dXJuIGFkZV9mb3JtYXRzW2ldLmh3X2Zvcm1h
dDsKIAogCS8qIG5vdCBmb3VuZCAqLwogCURSTV9FUlJPUigiTm90IGZvdW5kIHBpeGVsIGZvcm1h
dCEhZm91cmNjX2Zvcm1hdD0gJWRcbiIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24v
a2lyaW4va2lyaW5fZHJtX2Rydi5oCmluZGV4IDIyZDEyOTE2NjhjZC4uZDQ3Y2JiNDI3OTc5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaApA
QCAtOSw2ICs5LDMwIEBACiAKICNkZWZpbmUgTUFYX0NSVEMJMgogCisjZGVmaW5lIHRvX2tpcmlu
X2NydGMoY3J0YykgXAorCWNvbnRhaW5lcl9vZihjcnRjLCBzdHJ1Y3Qga2lyaW5fY3J0YywgYmFz
ZSkKKworI2RlZmluZSB0b19raXJpbl9wbGFuZShwbGFuZSkgXAorCWNvbnRhaW5lcl9vZihwbGFu
ZSwgc3RydWN0IGtpcmluX3BsYW5lLCBiYXNlKQorCisvKiBraXJpbi1mb3JtYXQgdHJhbnNsYXRl
IHRhYmxlICovCitzdHJ1Y3Qga2lyaW5fZm9ybWF0IHsKKwl1MzIgcGl4ZWxfZm9ybWF0OworCXUz
MiBod19mb3JtYXQ7Cit9OworCitzdHJ1Y3Qga2lyaW5fY3J0YyB7CisJc3RydWN0IGRybV9jcnRj
IGJhc2U7CisJdm9pZCAqaHdfY3R4OworCWJvb2wgZW5hYmxlOworfTsKKworc3RydWN0IGtpcmlu
X3BsYW5lIHsKKwlzdHJ1Y3QgZHJtX3BsYW5lIGJhc2U7CisJdm9pZCAqaHdfY3R4OworCXUzMiBj
aDsKK307CisKIC8qIGRpc3BsYXkgY29udHJvbGxlciBpbml0L2NsZWFudXAgb3BzICovCiBzdHJ1
Y3Qga2lyaW5fZGNfb3BzIHsKIAlpbnQgKCppbml0KShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

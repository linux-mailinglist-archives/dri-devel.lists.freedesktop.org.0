Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30083D0C1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 17:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D289202;
	Tue, 11 Jun 2019 15:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA7189202
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:26:46 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so12883283qtl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ebBQKUiLjLTg5JtZg1nMjXLJeHd6Dm6q1qCP/4lzeCk=;
 b=Ns3xDpfkq4DXdqVC5Der2y50PvUddICAx1eD6EGWmbZzIk4aw2lL76H2rlh4K4GRy8
 PmwVsDVePPNolk9qaWTN5e6zSr1RH6Z7MPnJtbv1+IJZegonvnupPfwwjj6A8uWSTFTR
 cPeZVI5wokGLRKIHIcVwjaN0+1NyrXhft45m6FzZ4KDJKgS0gS9daop/bVeZjnFgIs3i
 X2RU6Ik2tVgQNZsDYJvHqCW+NKKHCaQYLSbgd+f3lbVSicqh90XRT8D2chOs/K+iS825
 1wwVJQyNOT+WrpKBPGuiiVpoL7xy+kguevjuLtnbPOy+FQ2tv01sSaTRZj1CHgV8g1BU
 32oQ==
X-Gm-Message-State: APjAAAVMzJ+sBDjXIIcC/WLxBtD9hRKqEe1JdESrna/XHyNDPCkKfJ/C
 kzzKiI8j6qbTfmsCz42MTZY=
X-Google-Smtp-Source: APXvYqy22So2pcyMg5uDGe2PaUQ1x4Begi/YCVbe2mQwuMcFLQLT2QGjDZaDTqybqKOqYlKQGoE1zQ==
X-Received: by 2002:ac8:2b10:: with SMTP id 16mr46075481qtu.351.1560266805496; 
 Tue, 11 Jun 2019 08:26:45 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id d17sm6255966qtp.84.2019.06.11.08.26.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 08:26:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: l.stach@pengutronix.de
Subject: [PATCH v2] drm/etnaviv: Use dev_info() instead of pr_info()
Date: Tue, 11 Jun 2019 12:26:39 -0300
Message-Id: <20190611152639.18859-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ebBQKUiLjLTg5JtZg1nMjXLJeHd6Dm6q1qCP/4lzeCk=;
 b=PnHRsl8PZrsae2YEIq9PDCvxCeI5U7jUr341aKcexGT7YZESalBJ82jpnhFmXAtnLx
 4WJC9ukjzrZHFZpMj9910fTQGdgk6jY6+wkN0peVJHGO/7LB4gLpo+zYXbzlCRd5onZg
 V06dvkCdBYwamsfFZsw7X/OzC6DOXysZRWeJXzns2A1X3l8O91HggO1C7p87jP7Nv3Fm
 nuxgHkuyaTFlgjdyZ1FID1b1J8HIKKOB0+CwiUwQe/OUY5FWzZNQ/5joNonsViz4X17d
 T0IkW2N8hegCz0cWKw5gdGJC1D0k8V85JOzgaso5G5rrs+2yEnOIFmkbTn143Ze+mTLB
 pRYA==
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2X2luZm8oKSBpcyBtb3JlIGFwcHJvcHJpYXRlIGZvciBwcmludGluZyBfaW5mbyBsZXZlbCBt
ZXNzYWdlcwppbnNpZGUgZHJpdmVycywgc28gc3dpdGNoIHRvIGRldl9pbmZvKCkuCgpTaWduZWQt
b2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHNp
bmNlIHYxOgotIEFkanVzdCBjb21taXQgbG9nIHRvIHNheSAiX2luZm8gbGV2ZWwiIGluc3RlYWQg
b2YgImVycm9yIgoKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMgfCAx
NCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1
ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9idWZmZXIuYwppbmRleCAx
NjBjZTNjMDYwYTUuLjgyN2I1ZTQyZGJlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9idWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2J1ZmZlci5jCkBAIC00MTQsMTggKzQxNCwxOCBAQCB2b2lkIGV0bmF2aXZfYnVmZmVyX3F1
ZXVlKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LCB1MzIgZXhlY19zdGF0ZSwKIAkJCSAgICBidWZm
ZXItPnVzZXJfc2l6ZSAtIDQpOwogCiAJaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpCi0J
CXByX2luZm8oInN0cmVhbSBsaW5rIHRvIDB4JTA4eCBAIDB4JTA4eCAlcFxuIiwKLQkJCXJldHVy
bl90YXJnZXQsIGV0bmF2aXZfY21kYnVmX2dldF92YShjbWRidWYpLAotCQkJY21kYnVmLT52YWRk
cik7CisJCWRldl9pbmZvKGdwdS0+ZGV2LCAic3RyZWFtIGxpbmsgdG8gMHglMDh4IEAgMHglMDh4
ICVwXG4iLAorCQkJIHJldHVybl90YXJnZXQsIGV0bmF2aXZfY21kYnVmX2dldF92YShjbWRidWYp
LAorCQkJIGNtZGJ1Zi0+dmFkZHIpOwogCiAJaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIp
IHsKIAkJcHJpbnRfaGV4X2R1bXAoS0VSTl9JTkZPLCAiY21kICIsIERVTVBfUFJFRklYX09GRlNF
VCwgMTYsIDQsCiAJCQkgICAgICAgY21kYnVmLT52YWRkciwgY21kYnVmLT5zaXplLCAwKTsKIAot
CQlwcl9pbmZvKCJsaW5rIG9wOiAlcFxuIiwgYnVmZmVyLT52YWRkciArIHdhaXRsaW5rX29mZnNl
dCk7Ci0JCXByX2luZm8oImFkZHI6IDB4JTA4eFxuIiwgbGlua190YXJnZXQpOwotCQlwcl9pbmZv
KCJiYWNrOiAweCUwOHhcbiIsIHJldHVybl90YXJnZXQpOwotCQlwcl9pbmZvKCJldmVudDogJWRc
biIsIGV2ZW50KTsKKwkJZGV2X2luZm8oZ3B1LT5kZXYsICJsaW5rIG9wOiAlcFxuIiwgYnVmZmVy
LT52YWRkciArIHdhaXRsaW5rX29mZnNldCk7CisJCWRldl9pbmZvKGdwdS0+ZGV2LCAiYWRkcjog
MHglMDh4XG4iLCBsaW5rX3RhcmdldCk7CisJCWRldl9pbmZvKGdwdS0+ZGV2LCAiYmFjazogMHgl
MDh4XG4iLCByZXR1cm5fdGFyZ2V0KTsKKwkJZGV2X2luZm8oZ3B1LT5kZXYsICJldmVudDogJWRc
biIsIGV2ZW50KTsKIAl9CiAKIAkvKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

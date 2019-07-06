Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEA961B09
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4645489A14;
	Mon,  8 Jul 2019 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370A89CCE;
 Sat,  6 Jul 2019 11:11:52 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 34FC93EE72;
 Sat,  6 Jul 2019 11:11:50 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH] drm/msm/phy/dsi_phy: silence -EPROBE_DEFER warnings
Date: Sat,  6 Jul 2019 07:11:38 -0400
Message-Id: <20190706111138.2238-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1562411510;
 bh=9cS2ydOA+KgzUTCiP9CODFmbS9Ga+mbp4SRgk17zSTQ=;
 h=From:To:Cc:Subject:Date:From;
 b=XtRF2BQeKmlC7mlP1jE2b+HH2EKT8V8epfArAt0Xr+rEx2WTrCMk6HDBxy6ITdgXE
 8REsIhod/4UHChJjWb1I3fGfUjQmrWi2ebroo0hNR0Ib9p67bwaxmilIw14Nf+o54p
 YPJYX/LbQIsnt+mMpR+6DV6pmvevRKcxmzBzmdzs=
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBlcnJvcnMgc2hvdyB1cCB3aGVuIGJvb3RpbmcgdGhlIE5leHVzIDU6Cgpt
c21fZHNpX3BoeSBmZDkyMmEwMC5kc2ktcGh5OiBbZHJtOmRzaV9waHlfZHJpdmVyX3Byb2JlXSAq
RVJST1IqCiBkc2lfcGh5X3JlZ3VsYXRvcl9pbml0OiBmYWlsZWQgdG8gaW5pdCByZWd1bGF0b3Is
IHJldD0tNTE3Cm1zbV9kc2lfcGh5IGZkOTIyYTAwLmRzaS1waHk6IFtkcm06ZHNpX3BoeV9kcml2
ZXJfcHJvYmVdICpFUlJPUioKIGRzaV9waHlfZHJpdmVyX3Byb2JlOiBmYWlsZWQgdG8gaW5pdCBy
ZWd1bGF0b3IKCmRzaV9waHlfcmVndWxhdG9yX2luaXQoKSBhbHJlYWR5IGxvZ3MgdGhlIGVycm9y
LCBzbyBubyBuZWVkIHRvIGxvZwp0aGUgc2FtZSBlcnJvciBhIHNlY29uZCB0aW1lIGluIGRzaV9w
aHlfZHJpdmVyX3Byb2JlKCkuIFRoaXMgcGF0Y2gKYWxzbyBjaGFuZ2VzIGRzaV9waHlfcmVndWxh
dG9yX2luaXQoKSB0byBub3QgbG9nIHRoZSBlcnJvciBpZiB0aGUKZXJyb3IgY29kZSBpcyAtRVBS
T0JFX0RFRkVSIHRvIHJlZHVjZSBub2lzZSBpbiBkbWVzZy4KClNpZ25lZC1vZmYtYnk6IEJyaWFu
IE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL3BoeS9kc2lfcGh5LmMgfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9waHkvZHNpX3BoeS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9w
aHkuYwppbmRleCA0MDk3ZWNhMWIzZWYuLmQwZTFjYzY3MjhkYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9waHkvZHNpX3BoeS5jCkBAIC0zOTYsOCArMzk2LDExIEBAIHN0YXRpYyBpbnQgZHNpX3Bo
eV9yZWd1bGF0b3JfaW5pdChzdHJ1Y3QgbXNtX2RzaV9waHkgKnBoeSkKIAogCXJldCA9IGRldm1f
cmVndWxhdG9yX2J1bGtfZ2V0KGRldiwgbnVtLCBzKTsKIAlpZiAocmV0IDwgMCkgewotCQlEUk1f
REVWX0VSUk9SKGRldiwgIiVzOiBmYWlsZWQgdG8gaW5pdCByZWd1bGF0b3IsIHJldD0lZFxuIiwK
LQkJCQkJCV9fZnVuY19fLCByZXQpOworCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCisJCQlE
Uk1fREVWX0VSUk9SKGRldiwKKwkJCQkgICAgICAiJXM6IGZhaWxlZCB0byBpbml0IHJlZ3VsYXRv
ciwgcmV0PSVkXG4iLAorCQkJCSAgICAgIF9fZnVuY19fLCByZXQpOworCiAJCXJldHVybiByZXQ7
CiAJfQogCkBAIC01ODQsMTAgKzU4Nyw4IEBAIHN0YXRpYyBpbnQgZHNpX3BoeV9kcml2ZXJfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl9CiAKIAlyZXQgPSBkc2lfcGh5X3Jl
Z3VsYXRvcl9pbml0KHBoeSk7Ci0JaWYgKHJldCkgewotCQlEUk1fREVWX0VSUk9SKGRldiwgIiVz
OiBmYWlsZWQgdG8gaW5pdCByZWd1bGF0b3JcbiIsIF9fZnVuY19fKTsKKwlpZiAocmV0KQogCQln
b3RvIGZhaWw7Ci0JfQogCiAJcGh5LT5haGJfY2xrID0gbXNtX2Nsa19nZXQocGRldiwgImlmYWNl
Iik7CiAJaWYgKElTX0VSUihwaHktPmFoYl9jbGspKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814629987E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 17:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B126E527;
	Thu, 22 Aug 2019 15:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107346E51C;
 Thu, 22 Aug 2019 15:48:57 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l21so3902491pgm.3;
 Thu, 22 Aug 2019 08:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2gibvD/PE/0k2/MgxLtnC9v6hycHeC3vvECK4dop/Xo=;
 b=qDEaRMxUoSQbZunHEpKwu2lI9VsMea+GjgcZnp5nqXQ+4n0+VvZlneb8bHwvTig70X
 uDfp0tO2Vflx2sdHkUfjvohJT6M0nw17Y5sioXG/i7s/4S4ILsWU1Kmp2Qd39kazx8Ta
 FBeVAVya3Cr8Q8TVPM0ja0oV2xXcYsljCJgvLqEqpthheVGOnZ1j+uhHWHGLJqZJ0xwp
 aLOP9k4RKGtY+ItP5hJS7Ep0epgCd88+efWvGbD1yDKQqpMR9R3ABe0Uji57I9ein40w
 fuk4rnpV4ZP8wxOp+61CRhyDZRLSLVqKBCxc9FS6v3/8Cj/XgKpCapK/bcdcU19OVLZP
 NFGg==
X-Gm-Message-State: APjAAAXnOyfRYPmnHK5Ttzc+uSZWzS53eltnnDoDLUfDH+/HzVHEnVd0
 E+pgTsgqEEJ6CLL6s0u5M4jrRjgFxEg=
X-Google-Smtp-Source: APXvYqxoI/708laf6gtdOu/5W9IHi68WsTOyfXTApi1AbF+GqRB6Sp57tyWIM4vuUW9q1QIysQIBrg==
X-Received: by 2002:a63:e148:: with SMTP id h8mr3032468pgk.275.1566488936083; 
 Thu, 22 Aug 2019 08:48:56 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id ay7sm3717pjb.4.2019.08.22.08.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 08:48:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dpu: add rotation property
Date: Thu, 22 Aug 2019 08:46:21 -0700
Message-Id: <20190822154644.11723-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2gibvD/PE/0k2/MgxLtnC9v6hycHeC3vvECK4dop/Xo=;
 b=sF3NPfIhqt3Hzc9KufbzNsaUbbCQVjOI0o8UDhRvQtYR6/vH4PpZ/wkdh5TWxLkeKj
 mYde/YuazOc7nnSd8AxHozSoOH7LNUG36AuVSRCxuqqR4vLq89D4Nx3G4d9wbbqMCKyv
 sNqskZoKRu0j6XgfoLa/t2g9/VruzpdsSCZdPFcMUMdYtbVL5xgYtz5X1SrxIeajHRWC
 kLnexInTNp9iOEi9RBQoksUAmmznkbgNBXhYWHm1bttktZ0CHdI2PQW/PQESCCDkniES
 m8iyUQRftUUQF4+y63MkpSC4J65mZgfABsePvyUm0wMae9ctxYXnF8FEgm1kfGX4Dqp/
 1UfA==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Fritz Koenig <frkoenig@google.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bruce Wang <bzwang@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9wbGFuZS5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfcGxhbmUuYwppbmRleCA0NWJmYWM5ZTNhZjcuLjk3MDE5NDk1ODI1NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMKQEAgLTEwNDAsOCArMTA0MCwyMSBA
QCBzdGF0aWMgdm9pZCBkcHVfcGxhbmVfc3NwcF9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lKQogCQkJCXBzdGF0ZS0+bXVsdGlyZWN0X21vZGUpOwogCiAJaWYgKHBkcHUtPnBp
cGVfaHctPm9wcy5zZXR1cF9mb3JtYXQpIHsKKwkJdW5zaWduZWQgaW50IHJvdGF0aW9uOworCiAJ
CXNyY19mbGFncyA9IDB4MDsKIAorCQlyb3RhdGlvbiA9IGRybV9yb3RhdGlvbl9zaW1wbGlmeShz
dGF0ZS0+cm90YXRpb24sCisJCQkJCQkgRFJNX01PREVfUk9UQVRFXzAgfAorCQkJCQkJIERSTV9N
T0RFX1JFRkxFQ1RfWCB8CisJCQkJCQkgRFJNX01PREVfUkVGTEVDVF9ZKTsKKworCQlpZiAocm90
YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1gpCisJCQlzcmNfZmxhZ3MgfD0gRFBVX1NTUFBfRkxJ
UF9MUjsKKworCQlpZiAocm90YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1kpCisJCQlzcmNfZmxh
Z3MgfD0gRFBVX1NTUFBfRkxJUF9VRDsKKwogCQkvKiB1cGRhdGUgZm9ybWF0ICovCiAJCXBkcHUt
PnBpcGVfaHctPm9wcy5zZXR1cF9mb3JtYXQocGRwdS0+cGlwZV9odywgZm10LCBzcmNfZmxhZ3Ms
CiAJCQkJcHN0YXRlLT5tdWx0aXJlY3RfaW5kZXgpOwpAQCAtMTUyMiw2ICsxNTM1LDEzIEBAIHN0
cnVjdCBkcm1fcGxhbmUgKmRwdV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJ
aWYgKHJldCkKIAkJRFBVX0VSUk9SKCJmYWlsZWQgdG8gaW5zdGFsbCB6cG9zIHByb3BlcnR5LCBy
YyA9ICVkXG4iLCByZXQpOwogCisJZHJtX3BsYW5lX2NyZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0eShw
bGFuZSwKKwkJCURSTV9NT0RFX1JPVEFURV8wLAorCQkJRFJNX01PREVfUk9UQVRFXzAgfAorCQkJ
RFJNX01PREVfUk9UQVRFXzE4MCB8CisJCQlEUk1fTU9ERV9SRUZMRUNUX1ggfAorCQkJRFJNX01P
REVfUkVGTEVDVF9ZKTsKKwogCWRybV9wbGFuZV9lbmFibGVfZmJfZGFtYWdlX2NsaXBzKHBsYW5l
KTsKIAogCS8qIHN1Y2Nlc3MhIGZpbmFsaXplIGluaXRpYWxpemF0aW9uICovCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

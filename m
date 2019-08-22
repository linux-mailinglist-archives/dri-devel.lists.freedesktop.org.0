Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8696D98929
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 03:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D296EA47;
	Thu, 22 Aug 2019 01:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA1E6E9C2;
 Thu, 22 Aug 2019 01:58:03 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e11so2490526pga.5;
 Wed, 21 Aug 2019 18:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iJBfS7HIIw1t/KK9zKQwHG83jtFIbrBblcy5i1M3+M4=;
 b=Iv+ZDY3cYPxNQWo7RXycQAii7mo1kaUtOE1vGpkHf76l2Wc8+lDDvypfc/bsdJRvu9
 4dT6dEnaICTX5wTqY3MROcvoEJKQyuQkXTbuYxvJM6hoKpb5s2sNiFJkbe4vfKmXfTEN
 m1SVjmsjmA/vaeox6eiW5+6UNHyv8hxf65d2PtPj0369leIzpb2jtnFhuqRPvteoSevC
 pwISdQh1Dz1Nt9uQa7FcoBQZFcevJWQA/TQYDHQ+c1E3137MKsF8WP+JNCCaI0a0nPpS
 VjUadyracG9WwqN6asN5NI33IBui1ahPwTjgCrqapYmBgWiOqVwi3V/bPUsjgiu4s885
 fRmQ==
X-Gm-Message-State: APjAAAUI6oFyd2wcn8d6gVYZg1VdkXJUljIQKq2qHEtcQhe/tZ+WH+HG
 am+x8czrgrAfvWUHyjBtYoDOObhvY18=
X-Google-Smtp-Source: APXvYqyvoZ7A9MJNRQaT97XhZXrPGJpTdMj8MJfIJaj36BJLJB03HwNxOQd5CVSOwVr34QPNZTjg1w==
X-Received: by 2002:a63:5648:: with SMTP id g8mr31039969pgm.81.1566439083040; 
 Wed, 21 Aug 2019 18:58:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:e554::6bd7])
 by smtp.gmail.com with ESMTPSA id 203sm36739709pfz.107.2019.08.21.18.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 18:58:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: add rotation property
Date: Wed, 21 Aug 2019 18:57:24 -0700
Message-Id: <20190822015756.30807-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iJBfS7HIIw1t/KK9zKQwHG83jtFIbrBblcy5i1M3+M4=;
 b=V2DOhDxms/aCzjwvp+EYpdBZevSpf1y6RnvYOLQRPf/KEzBZd/2pHH44khpmdfZ3gh
 mf30Vu05Jiw9tDj/EOOQX0MXXdOnfcZdpxaYuFPhB49/nNpB4s/3DbOeIRyZSMQBhjFn
 MhQdCKtpsBT47+OrFBonrWDUJL/hl2C6UE61527E1kblHicXCdu000jV6KRKbfetQKD9
 gyunEfAcRXsp17MoYkRLk9pOfzwS+p8arB2extymDS1OZSj5h0nkXW3ytbXtwpJhrmtJ
 tvPjd6Bsv0AN/ooYJfYdnfXaPvo+igEOE5EOu6gFTymST2Ry6VrEYVLXD0JZwf/kp1L0
 nXXQ==
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
MS9kcHVfcGxhbmUuYwppbmRleCA0NWJmYWM5ZTNhZjcuLmM1NjUzNzcxZThmYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMKQEAgLTEwNDAsOCArMTA0MCwyMSBA
QCBzdGF0aWMgdm9pZCBkcHVfcGxhbmVfc3NwcF9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lKQogCQkJCXBzdGF0ZS0+bXVsdGlyZWN0X21vZGUpOwogCiAJaWYgKHBkcHUtPnBp
cGVfaHctPm9wcy5zZXR1cF9mb3JtYXQpIHsKKwkJdW5zaWduZWQgaW50IHJvdGF0aW9uOworCiAJ
CXNyY19mbGFncyA9IDB4MDsKIAorCQlyb3RhdGlvbiA9IGRybV9yb3RhdGlvbl9zaW1wbGlmeShz
dGF0ZS0+cm90YXRpb24sCisJCQkJCQkgRFJNX01PREVfUk9UQVRFXzAgfAorCQkJCQkJIERSTV9N
T0RFX1JFRkxFQ1RfWCB8CisJCQkJCQkgRFJNX01PREVfUkVGTEVDVF9ZKTsKKworCQlpZiAocm90
YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1gpCisJCQlzcmNfZmxhZ3MgfD0gRFBVX1NTUFBfRkxJ
UF9VRDsKKworCQlpZiAocm90YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1kpCisJCQlzcmNfZmxh
Z3MgfD0gRFBVX1NTUFBfRkxJUF9MUjsKKwogCQkvKiB1cGRhdGUgZm9ybWF0ICovCiAJCXBkcHUt
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

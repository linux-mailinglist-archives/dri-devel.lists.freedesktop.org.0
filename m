Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A633F49111
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2766E098;
	Mon, 17 Jun 2019 20:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A46B6E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:34 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so12435681qtu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jxs1S2d2hEiLW82WrQt+RxzLo4SztRkqjbe0RaFo6/s=;
 b=ituFSLuOBSfE+f7/vOxNkGxx0L07bUA7cLlpgUWN5qY1RSHL+lM+q1MUvyaGioqlQc
 qK7Td3DQ7TSKtkQaTvAkZNZoi/uJGUoPEsIxjrKnmQEq7QPBH4/0PmldIaMmKJ8X3n5b
 dCetYXBL9YX86r7eXwP70gD6YAUGALjPCyF7AL/oyPteyYTrRJS09X3tTw9LYpE8u2LO
 9qj+PZKhpW+ob9xLbBMuNjOX/KtAJF96IdmVcpNBWIqEGr75+TX/RbGDgu0rRVGWhrNk
 eu6xw9NQGlAakORHYa7O637Ek9UceOT8z8e/UNDMThk2eb7EhrWH4k8cVONlYsnh12dz
 /Aaw==
X-Gm-Message-State: APjAAAWKCinLir8qlQSqGpKjviBrnOhZE8fIqTaAIcjSiZG2zsokRweY
 2DmBlFV5iX0+qNkVh8AHnOZutlDFOQU=
X-Google-Smtp-Source: APXvYqxrCCqUNZYscrPplWQuYI6u4SH9DgjdX5HyNqBtvGiURcPXRZ1zswf+fS5gy+aDHRDdNa7TWg==
X-Received: by 2002:aed:3ac5:: with SMTP id o63mr24476334qte.309.1560802413064; 
 Mon, 17 Jun 2019 13:13:33 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:32 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 08/13] drm/msm/dsi: Don't store dsi host mode_flags in msm_dsi
Date: Mon, 17 Jun 2019 16:12:53 -0400
Message-Id: <20190617201301.133275-5-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jxs1S2d2hEiLW82WrQt+RxzLo4SztRkqjbe0RaFo6/s=;
 b=O0ax73sp/+EuyzNDsfHkAAsUf01j89TC19eFeVjyMhAJUyZBseS7i+o3vyhXU4+kQb
 Qfp+/WmglUwkpelFJfRmAmrKs+mLPd0yY2NpFF1175iGrouehTBzW2E0zwTMmR0vdxv5
 3vTg6NSaVTshR+GKQNLU3mdAxrED5JF0wTxmWt7EZm7woMaTRlvMuotfkUbDP3h3Yypb
 hkfr3DYmJ6DKxz22HEGkVaj0eZCKfebHZZY+ftqSS3KKgHKn6HndcpnROlgPdin5BJMf
 JNeFXLKkZDYcmUTBtlzoODykuOYO/yzwv7HBowQwUnsTqZpMOLazwxmBR+B3dZkqN1oG
 k03g==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJdCdzIGEgYml0IGRhbmdl
cm91cyB0byBzdG9yZSB0aGUgZmxhZ3MgaW4gbXNtX2RzaSBzaW5jZSB0aGVyZSdzIG5vIHdheSB0
bwp0ZWxsIHdoZW4gdGhleSdyZSBwb3B1bGF0ZWQuIEZvcnR1bmF0ZWx5IHRoZSBvbmx5IHBsYWNl
IHRoYXQgdXNlcyB0aGVtCmlzIHRoZSBzYW1lIHBsYWNlIHRoYXQgZmlsbHMgdGhlbS4gU28ganVz
dCB1c2UgYSBsb2NhbCB2YXJpYWJsZSBhbmQKZGVsZXRlIHRoZSBzdHJ1Y3QgbWVtYmVyLgoKU2ln
bmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvZHNpLmggICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZHNpL2RzaV9tYW5hZ2VyLmMgfCAxNyArKysrKysrKystLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvZHNpLmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2kuaApp
bmRleCA4YmRjNDhjYTBiNjcuLmUwYmJlODEyOGFlZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvZHNpLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpLmgKQEAg
LTc5LDcgKzc5LDYgQEAgc3RydWN0IG1zbV9kc2kgewogCSAqLwogCXN0cnVjdCBkcm1fcGFuZWwg
KnBhbmVsOwogCXN0cnVjdCBkcm1fYnJpZGdlICpleHRlcm5hbF9icmlkZ2U7Ci0JdW5zaWduZWQg
bG9uZyBkZXZpY2VfZmxhZ3M7CiAKIAlzdHJ1Y3QgZGV2aWNlICpwaHlfZGV2OwogCWJvb2wgcGh5
X2VuYWJsZWQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX21hbmFnZXIuYwppbmRleCA1NmI4MDkx
Yjc1ZTcuLjczNWZmZjc5YWU2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX21hbmFnZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5j
CkBAIC0yMzMsNiArMjMzLDEyIEBAIHN0YXRpYyBpbnQgZHNpX21ncl9icmlkZ2VfZ2V0X2lkKHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJcmV0dXJuIGRzaV9icmlkZ2UtPmlkOwogfQogCitz
dGF0aWMgYm9vbCBkc2lfbWdyX2lzX2NtZF9tb2RlKHN0cnVjdCBtc21fZHNpICptc21fZHNpKQor
eworCXVuc2lnbmVkIGxvbmcgaG9zdF9mbGFncyA9IG1zbV9kc2lfaG9zdF9nZXRfbW9kZV9mbGFn
cyhtc21fZHNpLT5ob3N0KTsKKwlyZXR1cm4gIShob3N0X2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9W
SURFTyk7Cit9CisKIHN0YXRpYyBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIGRzaV9tZ3JfY29u
bmVjdG9yX2RldGVjdCgKIAkJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBm
b3JjZSkKIHsKQEAgLTI0MSwxNyArMjQ3LDE1IEBAIHN0YXRpYyBlbnVtIGRybV9jb25uZWN0b3Jf
c3RhdHVzIGRzaV9tZ3JfY29ubmVjdG9yX2RldGVjdCgKIAlzdHJ1Y3QgbXNtX2RzaSAqb3RoZXJf
ZHNpID0gZHNpX21ncl9nZXRfb3RoZXJfZHNpKGlkKTsKIAlzdHJ1Y3QgbXNtX2RybV9wcml2YXRl
ICpwcml2ID0gY29ubmVjdG9yLT5kZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBtc21fa21zICpr
bXMgPSBwcml2LT5rbXM7CisJYm9vbCBjbWRfbW9kZTsKIAogCURCRygiaWQ9JWQiLCBpZCk7CiAJ
aWYgKCFtc21fZHNpLT5wYW5lbCkgewogCQltc21fZHNpLT5wYW5lbCA9IG1zbV9kc2lfaG9zdF9n
ZXRfcGFuZWwobXNtX2RzaS0+aG9zdCk7Ci0JCW1zbV9kc2ktPmRldmljZV9mbGFncyA9IG1zbV9k
c2lfaG9zdF9nZXRfbW9kZV9mbGFncygKLQkJCQkJCW1zbV9kc2ktPmhvc3QpOwogCiAJCS8qIFRo
ZXJlIGlzIG9ubHkgMSBwYW5lbCBpbiB0aGUgZ2xvYmFsIHBhbmVsIGxpc3QKIAkJICogZm9yIGR1
YWwgRFNJIG1vZGUuIFRoZXJlZm9yZSBzbGF2ZSBkc2kgc2hvdWxkIGdldAotCQkgKiB0aGUgZHJt
X3BhbmVsIGluc3RhbmNlIGZyb20gbWFzdGVyIGRzaSwgYW5kCi0JCSAqIGtlZXAgdXNpbmcgdGhl
IHBhbmVsIGZsYWdzIGdvdCBmcm9tIHRoZSBjdXJyZW50IERTSSBsaW5rLgorCQkgKiB0aGUgZHJt
X3BhbmVsIGluc3RhbmNlIGZyb20gbWFzdGVyIGRzaS4KIAkJICovCiAJCWlmICghbXNtX2RzaS0+
cGFuZWwgJiYgSVNfRFVBTF9EU0koKSAmJgogCQkJIUlTX01BU1RFUl9EU0lfTElOSyhpZCkgJiYg
b3RoZXJfZHNpKQpAQCAtMjU5LDkgKzI2Myw4IEBAIHN0YXRpYyBlbnVtIGRybV9jb25uZWN0b3Jf
c3RhdHVzIGRzaV9tZ3JfY29ubmVjdG9yX2RldGVjdCgKIAkJCQkJCW90aGVyX2RzaS0+aG9zdCk7
CiAKIAorCQljbWRfbW9kZSA9IGRzaV9tZ3JfaXNfY21kX21vZGUobXNtX2RzaSk7CiAJCWlmICht
c21fZHNpLT5wYW5lbCAmJiBrbXMtPmZ1bmNzLT5zZXRfZW5jb2Rlcl9tb2RlKSB7Ci0JCQlib29s
IGNtZF9tb2RlID0gIShtc21fZHNpLT5kZXZpY2VfZmxhZ3MgJgotCQkJCQkgIE1JUElfRFNJX01P
REVfVklERU8pOwogCQkJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyID0KIAkJCQkJbXNtX2Rz
aV9nZXRfZW5jb2Rlcihtc21fZHNpKTsKIApAQCAtMjc3LDggKzI4MCw2IEBAIHN0YXRpYyBlbnVt
IGRybV9jb25uZWN0b3Jfc3RhdHVzIGRzaV9tZ3JfY29ubmVjdG9yX2RldGVjdCgKIAkJICovCiAJ
CWlmIChtc21fZHNpLT5wYW5lbCAmJiBJU19EVUFMX0RTSSgpICYmCiAJCQlvdGhlcl9kc2kgJiYg
b3RoZXJfZHNpLT5wYW5lbCkgewotCQkJYm9vbCBjbWRfbW9kZSA9ICEobXNtX2RzaS0+ZGV2aWNl
X2ZsYWdzICYKLQkJCQkJCU1JUElfRFNJX01PREVfVklERU8pOwogCQkJc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyID0gbXNtX2RzaV9nZXRfZW5jb2RlcigKIAkJCQkJZHNpX21ncl9nZXRfZHNp
KERTSV9FTkNPREVSX01BU1RFUikpOwogCQkJc3RydWN0IGRybV9lbmNvZGVyICpzbGF2ZV9lbmMg
PSBtc21fZHNpX2dldF9lbmNvZGVyKAotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwg
R29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

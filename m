Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32F21E8CC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0830A6E8E6;
	Tue, 14 Jul 2020 07:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88FC6EBBD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so5471302wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WimOihJEoGFrQflh5MG/QpMyDue9zSaiyBZVUVInhdA=;
 b=apjndRlzBADzjx/tKuL/n6DCF1QhTME/JWIr6K5Qr5g2IRZGeLMo/t/MyBZdlS4Wv7
 k5bf8mqevDciEgy3gqH2+aIkTYToN0Zy1EZxDhoBehAtKeI+1tgSgDLhN7+/ne4RbQMk
 nxMUmPsxsj19A86Y1Jx+mlVe3Gs5ZYfyYGWBMdubz+qz+moVhkUKvftySUIQHimrukhE
 +aVrPiZYuvS5yHfxTERpS4FDfJUCshHX1JhRkOxz5K9hfiAbzgZpu6uNa3rSJHVUC9jU
 js5CnMsPWyGmIwH7i7TB16ow/aTQ6jsyl6DplG+JVru9fzexAymN2Hv0CciWGaQx/q70
 UooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WimOihJEoGFrQflh5MG/QpMyDue9zSaiyBZVUVInhdA=;
 b=YKxSEn1wF5F5b/odPICmhG0dLfnYY71iO1jt8oeBPhkqWHEsFuzGOxHCdyHApN3cJL
 15ubDWNirWk+hfPZQso5kh9RxXx36ho6QsfiKCIG/dDZbflk328yzfKev679Mqvl+IXU
 XaOb5gEY5XE6hYsze/3Q/Jd2SeOMx/6pMHsbBSi7wiXad9viFC+2WPcFHxgrpAODQRgM
 mdWatDQ2JW1N7c8epmjM+6lslM8m2a9+OHc30Y4jn1jYls5YovdF8pXFJ/nmSkGhH8g0
 zY92aGdDrO+DG5KaHt7YqVcGBEZMLsnbnVeAXocOJm/IWBTPz63+OPqbJTlEEEvxwFUu
 nVFw==
X-Gm-Message-State: AOAM530uQFV5ZubMEBBr7AGVvjBJ9KNTmU/5uYUyPFJnl7QIWugZs/Ho
 U+hM/Ic7B8UOAJO5DcPP6us=
X-Google-Smtp-Source: ABdhPJxxIn8oYAxTV1peSwC8T66wTnW21RfMcb22cRnGtDFyLhEPQ7Ua941ytDhox3rI2N/NIlkm0A==
X-Received: by 2002:a1c:48:: with SMTP id 69mr4576752wma.32.1594374853553;
 Fri, 10 Jul 2020 02:54:13 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 01/14] drm/panfrost: avoid static declaration
Date: Fri, 10 Jul 2020 11:53:56 +0200
Message-Id: <20200710095409.407087-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710095409.407087-1-peron.clem@gmail.com>
References: <20200710095409.407087-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkZWNsYXJhdGlvbiBjYW4gYmUgYXZvaWRlZCBzbyBjaGFuZ2UgaXQuCgpSZXZpZXdlZC1i
eTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEFseXNz
YSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAzOCArKysrKysrKysrLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5j
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCA0MTM5
ODcwMzhmYmYuLjFiNTYwYjkwM2VhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2ZnJlcS5jCkBAIC0xNCw3ICsxNCwyNCBAQAogI2luY2x1ZGUgInBhbmZyb3N0X2dw
dS5oIgogI2luY2x1ZGUgInBhbmZyb3N0X3JlZ3MuaCIKIAotc3RhdGljIHZvaWQgcGFuZnJvc3Rf
ZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYp
Oworc3RhdGljIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCit7CisJa3RpbWVfdCBub3c7CisJa3RpbWVfdCBsYXN0
OworCisJaWYgKCFwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQorCQlyZXR1cm47CisKKwlub3cgPSBr
dGltZV9nZXQoKTsKKwlsYXN0ID0gcGZkZXYtPmRldmZyZXEudGltZV9sYXN0X3VwZGF0ZTsKKwor
CWlmIChhdG9taWNfcmVhZCgmcGZkZXYtPmRldmZyZXEuYnVzeV9jb3VudCkgPiAwKQorCQlwZmRl
di0+ZGV2ZnJlcS5idXN5X3RpbWUgKz0ga3RpbWVfc3ViKG5vdywgbGFzdCk7CisJZWxzZQorCQlw
ZmRldi0+ZGV2ZnJlcS5pZGxlX3RpbWUgKz0ga3RpbWVfc3ViKG5vdywgbGFzdCk7CisKKwlwZmRl
di0+ZGV2ZnJlcS50aW1lX2xhc3RfdXBkYXRlID0gbm93OworfQogCiBzdGF0aWMgaW50IHBhbmZy
b3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAqZnJl
cSwKIAkJCQkgICB1MzIgZmxhZ3MpCkBAIC0xMzksMjUgKzE1Niw2IEBAIHZvaWQgcGFuZnJvc3Rf
ZGV2ZnJlcV9zdXNwZW5kKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCWRldmZyZXFf
c3VzcGVuZF9kZXZpY2UocGZkZXYtPmRldmZyZXEuZGV2ZnJlcSk7CiB9CiAKLXN0YXRpYyB2b2lk
IHBhbmZyb3N0X2RldmZyZXFfdXBkYXRlX3V0aWxpemF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2UgKnBmZGV2KQotewotCWt0aW1lX3Qgbm93OwotCWt0aW1lX3QgbGFzdDsKLQotCWlmICghcGZk
ZXYtPmRldmZyZXEuZGV2ZnJlcSkKLQkJcmV0dXJuOwotCi0Jbm93ID0ga3RpbWVfZ2V0KCk7Ci0J
bGFzdCA9IHBmZGV2LT5kZXZmcmVxLnRpbWVfbGFzdF91cGRhdGU7Ci0KLQlpZiAoYXRvbWljX3Jl
YWQoJnBmZGV2LT5kZXZmcmVxLmJ1c3lfY291bnQpID4gMCkKLQkJcGZkZXYtPmRldmZyZXEuYnVz
eV90aW1lICs9IGt0aW1lX3N1Yihub3csIGxhc3QpOwotCWVsc2UKLQkJcGZkZXYtPmRldmZyZXEu
aWRsZV90aW1lICs9IGt0aW1lX3N1Yihub3csIGxhc3QpOwotCi0JcGZkZXYtPmRldmZyZXEudGlt
ZV9sYXN0X3VwZGF0ZSA9IG5vdzsKLX0KLQogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3JlY29yZF9i
dXN5KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewogCXBhbmZyb3N0X2RldmZyZXFf
dXBkYXRlX3V0aWxpemF0aW9uKHBmZGV2KTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

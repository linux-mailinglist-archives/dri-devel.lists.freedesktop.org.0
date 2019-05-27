Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 055152BA45
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 20:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F73489A32;
	Mon, 27 May 2019 18:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416C989A32
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 18:39:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id b18so13129903qkc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BhWSdyDmHv800irYkTEDuB6wa84qo7615anmM4o1Ixg=;
 b=HzrxajaVVOfuqFs/sE/gRrUa69SgpxkcXALSQO1S1Xf7zWJlp7Tn2plF1x75i80S7/
 qy4OwyW2whfSw3cvy2LlD2ppvnsAryXOSb8HDix3ZUza4i7JM+NRMstGhGnXKhcRiTjk
 u+bPM3MCZO2MWfehooHFzbF2CovQSCfHfJJUZRR3puC0WajWdJoWVmowIb0sepVAyEo2
 WJTy2SrWtRS0mYvZFy57YvukWfbF7fYxe2ygOeKBeydByH7CtYVXsgGBtUDA5UE4YPxL
 qbtjRcXKs2x46wEbh/G8BkdzFgeO4KXyQ4f3XycCW3r5lP4d29POgK+WdlJm8Q73cqDi
 aG0Q==
X-Gm-Message-State: APjAAAXYhhhMgqlka3/6axI+7oLwUutgx3ex2nDIVf7/zifjNSrc1Eib
 dM8u773ZcMRaanaY9UoNiGE=
X-Google-Smtp-Source: APXvYqwk6ykCGegz4uIgU2jny045Kv42dmJBnH2DkAdXrq10oQwjhT3Q6UT4rFxV4uVWZ1U15XLqZw==
X-Received: by 2002:a37:9107:: with SMTP id t7mr28734132qkd.135.1558982366406; 
 Mon, 27 May 2019 11:39:26 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id 22sm5265929qto.92.2019.05.27.11.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 11:39:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/syncobj: Include the <drm/drm_utils.h> header
Date: Mon, 27 May 2019 15:39:31 -0300
Message-Id: <20190527183931.11367-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BhWSdyDmHv800irYkTEDuB6wa84qo7615anmM4o1Ixg=;
 b=n0K8Z8FQ3SE4y0EhBlh7IvqRVuAD5fIcplXpW7Kgq0j5HBU6Y47t0/JCiD1mHbVUN5
 dil7kFMIUzyaRIvmG2Hzz3xekN8RseI0GQOTg4JbWpx0dbyUcJvnC8vSS88K2NQx6+k1
 ogxnbbKkif7za+3hMxIMhF/awFT3TJ7AEj0nIRvmvVDP+++IqQxL5d33vISe9yKEO5ff
 bevDP9l9VqtAQzL3S/0J9y2fhy0lRKaIhZ70T51c66XfZHJWsuoSGUjsEDUqjV7qqVyz
 cQoc5M0zEe2xFTkM/H/BZnWTjpDtG4e5djMVo5BMNJDvPO9rAjmkEAOacXClRVZsgmCD
 g09A==
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
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHByb3RvdHlwZSBmb3IgJ2RybV90aW1lb3V0X2Fic190b19qaWZmaWVzJyBpcyBwcm92aWRl
ZCBieQp0aGUgPGRybS9kcm1fdXRpbHMuaD4gaGVhZGVyLgoKSW5jbHVkZSB0aGlzIGhlYWRlciB0
byBmaXggdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZzoKCmRyaXZlcnMvZ3B1L2RybS9kcm1f
c3luY29iai5jOjkzNzoxMzogd2FybmluZzogc3ltYm9sICdkcm1fdGltZW91dF9hYnNfdG9famlm
Zmllcycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KClNpZ25lZC1vZmYt
Ynk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX3N5bmNvYmouYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3N5bmNvYmouYwppbmRleCAzZDQwMDkwNTEwMGIuLmIwNmZhNDI0YmQ0NCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9zeW5jb2JqLmMKQEAgLTQ2LDYgKzQ2LDcgQEAKICAqIFRoZSBmaWxlIHRha2VzIGEgcmVm
ZXJlbmNlIG9uIHRoZSBrcmVmLgogICovCiAKKyNpbmNsdWRlIDxkcm0vZHJtX3V0aWxzLmg+CiAj
aW5jbHVkZSA8ZHJtL2RybVAuaD4KICNpbmNsdWRlIDxsaW51eC9maWxlLmg+CiAjaW5jbHVkZSA8
bGludXgvZnMuaD4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

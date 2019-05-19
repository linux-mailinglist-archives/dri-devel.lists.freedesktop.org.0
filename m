Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645C2226F9
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E080689132;
	Sun, 19 May 2019 14:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0127B89132
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:20:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l26so8388782lfh.13
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 07:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ad7Fwl6LjARc2prGK5xxcJbytviWSkpw/Dg0XX8mBEc=;
 b=Wf7zcykleTcnpv9WZzixoLBSTLASaCfS8Nm6C7Xwgs4mvMM78wkhC3tbD8TPWzmH8N
 mI64Vf23cxt1WOWwzJClsetpdbROpdUy87JZTgFVz4824VrgLweyqHLSWQuooLHP0QrX
 AmuiuIokmEyNwnJ6I4BiQc9WP2YMZs5gK0Wor2bpK9geVH1tUhajEmk9cvh/qd9f1fXU
 jVz3ArluxTcSynQ4DpbH1pem24I5NCGV2/8EC7Osz0jpPC4QYviTifCJ8CUsVWL4UZhG
 LYvR5Fy8CmRtUR8oWIgDXGeYUkqUakzjJLmShOqJdkAkUKc/BXhOKeuejwkAk+eGVtJQ
 lUOA==
X-Gm-Message-State: APjAAAX2ckIobNPiT/bAjNiSjDa09MgBJ5e9Cr6lJSEDtMDVM26hKrY9
 ocxZ1dkArBXC7zHEx47CEYnT8vFd
X-Google-Smtp-Source: APXvYqzC2y/EIEF5vYDnf2VZINTN9mrZl8LBRKkoI5RbcX1WIOWAgKsYAqMcN73l6QgsjpaaRQmtLw==
X-Received: by 2002:ac2:55a9:: with SMTP id y9mr5104814lfg.58.1558275650247;
 Sun, 19 May 2019 07:20:50 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d5sm3231786lji.85.2019.05.19.07.20.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:20:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 01/06] drm: make drm_auth.h self contained
Date: Sun, 19 May 2019 16:20:31 +0200
Message-Id: <20190519142036.22861-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519142036.22861-1-sam@ravnborg.org>
References: <20190519142036.22861-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ad7Fwl6LjARc2prGK5xxcJbytviWSkpw/Dg0XX8mBEc=;
 b=GQ3cfHHqw0Q1Zm9r4OLaJSaykYuEkY5vH4jkISJRfXGkENU0RNBQ9oHbEBSmhOpLPz
 ZdcRX6n7FjB/PlpBnyF7jSglTQBwkmKj+dbMEdPmDkkQHZIoJqPJHmq9CZY/E+9vLx72
 aV1ByTKKz7B1YAU4/Olhvxp2Ofu/HbTFf/31CikOf/Gpahlr5EToIKJmJMly9TPi/2GY
 GxMsTXXjtNX1yR8IHZVIbAnRSgBJDNOxQ7HS7KSOXUGn/amkHsa6t2VNvaRW1ei/3NWv
 YQG+8gXbUZ5iI4yB2Oy6/xfLUjjfFnp/o0+UInT75Fo2i4wKDxPc3GaIRkNVUNbyu+Hk
 2Xjg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX2F1dGguaCB0byBpbmNsdWRlIG90aGVyIGZpbGVz
IGp1c3QgdG8KbGV0IGl0IGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBp
bmNsdWRlL2RybS9kcm1fYXV0aC5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2F1dGguaCBiL2luY2x1ZGUv
ZHJtL2RybV9hdXRoLmgKaW5kZXggODcxMDA4MTE4YmFiLi5mMzRiN2I4NDI5NzYgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvZHJtL2RybV9hdXRoLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2F1dGguaApA
QCAtMjgsNiArMjgsMTMgQEAKICNpZm5kZWYgX0RSTV9BVVRIX0hfCiAjZGVmaW5lIF9EUk1fQVVU
SF9IXwogCisjaW5jbHVkZSA8bGludXgvaWRyLmg+CisjaW5jbHVkZSA8bGludXgva3JlZi5oPgor
I2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KKworc3RydWN0IGRybV9maWxlOworc3RydWN0IGRybV9o
d19sb2NrOworCiAvKgogICogTGVnYWN5IERSSTEgbG9ja2luZyBkYXRhIHN0cnVjdHVyZS4gT25s
eSBoZXJlIGluc3RlYWQgb2YgaW4gZHJtX2xlZ2FjeS5oIGZvcgogICogaW5jbHVkZSBvcmRlcmlu
ZyByZWFzb25zLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

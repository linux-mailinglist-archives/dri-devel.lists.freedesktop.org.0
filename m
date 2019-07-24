Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FED07303A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 15:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85BE6E4F5;
	Wed, 24 Jul 2019 13:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A516E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:50:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m23so44508094lje.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HfPoVJsXGaQ7CrPxMNDhvPdtz+hWWRNJKhx9Zt29Rpw=;
 b=KRvaB9UYUCwjirrhHQGuCNYPHzhOim1AF/CM42AUmhk/i+t09qtBL5EErUnj2ljc4A
 PnR/lBnWiDx7Zi4Ze0UqQAk/D5Sa4g+UfRoP0rFzQ9PuT23Bj+Ylow/f92+HINc+U62q
 +qfAdhq6+qfQtspUfO0BTDaiVSHyPwbRuSQWEQE/Zd0GRzrexiupXbRmCJiSqP+T3JaE
 19QWjthaFTGT5sEXEv2LISWkA1mvL1dVc3yVEDQBSgw71KhmY9f/cqq+IVKow5bsnL8Y
 Wkm86PZJ3B5X/QtsOrlxn2lm0vlkPAmFEKMF36MVxOyYpo5NcdmV6xTY+gt0OAvosv6z
 8I6A==
X-Gm-Message-State: APjAAAVkiejeKtiPH7R6Qt75XbzhrIKC63y43pg93NYP2Tg338mH4edM
 ySp8vmb51//7DwjMSGBWylQZUDDW3Yg=
X-Google-Smtp-Source: APXvYqyjk/0IsjFe1aAfxByZ5nzwaHZIWvF4GQjqOS05zabNCqCg+h3+FahVUnfnxWqiOJs3cm8nWw==
X-Received: by 2002:a2e:7315:: with SMTP id o21mr35196730ljc.3.1563976209824; 
 Wed, 24 Jul 2019 06:50:09 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id v4sm8586483lji.103.2019.07.24.06.50.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 06:50:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/2] drm/pl111: Drop special pads config check
Date: Wed, 24 Jul 2019 15:49:59 +0200
Message-Id: <20190724134959.2365-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724134959.2365-1-linus.walleij@linaro.org>
References: <20190724134959.2365-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HfPoVJsXGaQ7CrPxMNDhvPdtz+hWWRNJKhx9Zt29Rpw=;
 b=xqkD4l6pQ59S18/2N97O4kkMzx8lUYEVdwU8E6DDQAjlTZbekJZ45iJxLjCYV8wPkB
 oFJQsyDhyr6TG++7ko7t24C9YqC3QX9lKck0pa/+JScHKTtpj4LcIL3PETrNI5ddzNlk
 u1mQnmHFwPDUlRYXj7KdrfopRx9UxPCntJoAvVDv/uh6ypWag6UdbPiImhI7sobYGym+
 U+MKkK4amr4J6NZVmbdtsGZAhLutz6UmI8Fb4AzAGWARs9BtHpFUi7e9x+79OlJXVXix
 s3MQIcG3uGvEFJHlOky9cSIJlp8+gcYiUnfJ1PuqP/4unyq6tTLNLy9e74hqCfGz8ivH
 RquA==
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Pawel Moll <pawel.moll@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkcm9wcyB0aGUgY2hlY2sgb2YgdGhlIHN1cnBsdXMgInBhZHMiIGNvbmZpZ3VyYXRpb24K
ZnJvbSB0aGUgZGV2aWNlIHRyZWUgdGhhdCBpcyBjb21wbGV0ZWx5IHVudXNlZCBpbiB0aGUgRFJN
CmRyaXZlci4KClRoaXMgd2FzIG9ubHkgdXNlZCB0byB3b3JrIGFyb3VuZCBsaW1pdGF0aW9ucyBp
biB0aGUgZWFybGllcgpmYmRldiBkcml2ZXIuCgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgpDYzogUGF3ZWwgTW9sbCA8cGF3ZWwubW9sbEBhcm0uY29tPgpDYzogTGl2aXUgRHVk
YXUgPExpdml1LkR1ZGF1QGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFf
ZGlzcGxheS5jIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jCmluZGV4IGU0MmZiNjM1
MzYyMy4uODU5NWE2NzZiMDg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwx
MTFfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMK
QEAgLTU3MiwyNCArNTcyLDggQEAgaW50IHBsMTExX2Rpc3BsYXlfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtKQogewogCXN0cnVjdCBwbDExMV9kcm1fZGV2X3ByaXZhdGUgKnByaXYgPSBkcm0t
PmRldl9wcml2YXRlOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9IGRybS0+ZGV2OwotCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqZW5kcG9pbnQ7Ci0JdTMyIHRmdF9yMGIwZzBbM107CiAJaW50IHJldDsKIAot
CWVuZHBvaW50ID0gb2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQoZGV2LT5vZl9ub2RlLCBOVUxM
KTsKLQlpZiAoIWVuZHBvaW50KQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCWlmIChvZl9wcm9wZXJ0
eV9yZWFkX3UzMl9hcnJheShlbmRwb2ludCwKLQkJCQkgICAgICAgImFybSxwbDExeCx0ZnQtcjBn
MGIwLXBhZHMiLAotCQkJCSAgICAgICB0ZnRfcjBiMGcwLAotCQkJCSAgICAgICBBUlJBWV9TSVpF
KHRmdF9yMGIwZzApKSAhPSAwKSB7Ci0JCWRldl9lcnIoZGV2LCAiYXJtLHBsMTF4LHRmdC1yMGcw
YjAtcGFkcyBzaG91bGQgYmUgMyBpbnRzXG4iKTsKLQkJb2Zfbm9kZV9wdXQoZW5kcG9pbnQpOwot
CQlyZXR1cm4gLUVOT0VOVDsKLQl9Ci0Jb2Zfbm9kZV9wdXQoZW5kcG9pbnQpOwotCiAJcmV0ID0g
cGwxMTFfaW5pdF9jbG9ja19kaXZpZGVyKGRybSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

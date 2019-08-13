Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E28E68C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE846E8DE;
	Thu, 15 Aug 2019 08:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FF96E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 08:59:07 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id w26so5949899pfq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 01:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+aISf5UNe4Kt3/nCkOEsWQhdhcDoFXX/1+XapNBII4=;
 b=tcA6UwtUGMC1StUujWTIxzvKsE1Z7vKpzqyuQ0xf5KUFHeR7Fv88qArTYawws47n54
 eqw4NDj1lJgF1gZi66PN0iGByzOikM0LZCW9IE0HLtNVLYH6FmxfEcAv69t0iU9WkGeR
 uYowjGMzgp8jz203K8afrnCoPMEqyQ0Bauo5TvQ9y7yLY6rTqZZbAlWoSzkkpz7C5xK/
 o9F7FWq0lAbBD9skBqgTNsg9CG9aPkmfVOTTTG+ylfnc/ffsrmHaM9iFgmRfK9LzQEba
 TL322r4tX0cLj5nPIFykYIhrSp05BfPyy2+aranix+QG0tfSPAwxkEp66kPa2Rssh27M
 q8Bg==
X-Gm-Message-State: APjAAAXDfD1riL+vYMnOBAanGNpNG8jrZ+6rZ7fQnIZ5wIY9HnQBmYlX
 GD8Do5HkSHeFmQ3cHHbx/ZM=
X-Google-Smtp-Source: APXvYqz5W9D4BBbD2zUwmwQoMa657L6LiCScytPhydugkZIYB+k23t6gV4wprBoxwWZy1QZpaB+fhg==
X-Received: by 2002:a17:90a:86c2:: with SMTP id y2mr330886pjv.46.1565686747080; 
 Tue, 13 Aug 2019 01:59:07 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id 3sm115526195pfg.186.2019.08.13.01.59.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 01:59:06 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props constant
Date: Tue, 13 Aug 2019 14:28:55 +0530
Message-Id: <20190813085855.8302-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+aISf5UNe4Kt3/nCkOEsWQhdhcDoFXX/1+XapNBII4=;
 b=kyPgWMFDEIhKeNzWByGr1bYKKWNXxiB7U4zI0YX0RE+mbhAFCguKTbvMiTM8jVwua8
 YX/QgqAXDXSQxfi/Vo8qE1hC05+Svn8qx1MWz/kq3h+SIa6aj//peTLp0cHWqGkpedjE
 TBHEN9hFvvuIPp0yOAIat9F+wqm9bTQ9D39Iwoou0WKEwtCHFmTeobTk0DTbVB0kDbYp
 UWMfF0EmsdOGxskyFeM/cOwlYLnKpKsMfjvAXUgEjiWh3lB9MVLzgUGl5Z9kT+xGMNiy
 Nj/f/7+YrLEuMsiw7buRti8zJUCKgNk8h93nc66ByXH6wDDZZt+f1QzVEswdsOOTBB63
 fIAA==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RhdGljIHN0cnVjdHVyZSBtaWNyb19ibF9wcm9wcywgaGF2aW5nIHR5cGUgYmFja2xpZ2h0X3By
b3BlcnRpZXMsIGlzCnVzZWQgb25seSBvbmNlLCB3aGVuIGl0IGlzIHBhc3NlZCBhcyB0aGUgbGFz
dCBhcmd1bWVudCB0byBmdW5jdGlvbgpkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoKS4g
ZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyKCkgaXMKZGVmaW5lZCB3aXRoIGl0cyBsYXN0
IHBhcmFtZXRlciBiZWluZyBkZWNsYXJlZCBjb25zdGFudC4gSGVuY2UgbWFrZQptaWNyb19ibF9w
cm9wcyBpdHNlbGYgY29uc3RhbnQgYXMgd2VsbC4KSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxl
LgoKU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jIGIvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jCmluZGV4IDExMjNmNjdjMTJiMy4uODViMTZjYzgy
ODc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pcGFxX21pY3JvX2JsLmMK
KysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jCkBAIC00NCw3ICs0
NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBtaWNyb19ibF9vcHMgPSB7
CiAJLnVwZGF0ZV9zdGF0dXMgID0gbWljcm9fYmxfdXBkYXRlX3N0YXR1cywKIH07CiAKLXN0YXRp
YyBzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMgbWljcm9fYmxfcHJvcHMgPSB7CitzdGF0aWMg
Y29uc3Qgc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIG1pY3JvX2JsX3Byb3BzID0gewogCS50
eXBlID0gQkFDS0xJR0hUX1JBVywKIAkubWF4X2JyaWdodG5lc3MgPSAyNTUsCiAJLnBvd2VyID0g
RkJfQkxBTktfVU5CTEFOSywKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

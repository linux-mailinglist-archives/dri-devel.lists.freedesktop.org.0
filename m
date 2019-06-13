Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AC44C75
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 21:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6546E88FE1;
	Thu, 13 Jun 2019 19:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720C788F9A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:43:33 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id p10so111137pgn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYPkZ1kHlegoet40jMp9lNjbYY87zm41fO5/bnIRtVY=;
 b=rF8U3EEAMm1ZpRBvy6XtODUf4WsVBlQ1GZJzsEcgSbXXDIYTFE0HbMg/3da7Ej+sTh
 xLlb7mgC5d3LvuzLYc+1JEwT153gPk1IYVSvOXbRMrrNhxahXeRnmLHwFS0XPi31oIGb
 i0STYO3ck2gUWNcscnIPOjSlJftL0fQmL/L/mLZSltFCBZL62ZLoU8AQ6w1NUCTRAcJ+
 8B8jcomZtkzXcaZnoR3JY2+aaYOJLCEF+rLOBuV4bivvlzjJAR7T8a+pG64qcg3qU4a5
 X8WBmM5S0lX/sIIpz4C5XhW2HduxuouNvteHkZe5gmgKaXN1OHSRx+Vtr6jZ1LBmojzF
 r4Ow==
X-Gm-Message-State: APjAAAXVHBtWgTxvkrLpqSsPyF9JEmocoI5oJAM6H4pgbMR4wEGv4yY5
 Jk+mvkFRD8p6iVuCzzcgLW/EOQ==
X-Google-Smtp-Source: APXvYqycbVZXlvuqRzFiBln7zYVKC7ylbynb1qlibWK1KEuqMaOj0glQOfDd2xEXmxZcdeBGNd5Pvw==
X-Received: by 2002:a63:4c:: with SMTP id 73mr30610167pga.134.1560455012940;
 Thu, 13 Jun 2019 12:43:32 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id v23sm7853735pju.3.2019.06.13.12.43.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 12:43:32 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/4] MAINTAINERS: Add entry for stable backlight sysfs ABI
 documentation
Date: Thu, 13 Jun 2019 12:43:23 -0700
Message-Id: <20190613194326.180889-2-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190613194326.180889-1-mka@chromium.org>
References: <20190613194326.180889-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYPkZ1kHlegoet40jMp9lNjbYY87zm41fO5/bnIRtVY=;
 b=FE4dJnLkWT/wzZIKxQnGm9hn3MWtcyqW/MT2wtn2Lwp9cOyu42ILOuYP/pEZisNPzJ
 arWgE8Ibze4Nb38GlZev9QW5KIPYAqK71cPwZGLO95/fclJ3exbgai9UrDk+z1owjH5m
 oEzN4hVjAhOfbGDr0fVqTnrlE/qoPBYiECaho=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIGVudHJ5IGZvciB0aGUgc3RhYmxlIGJhY2tsaWdodCBzeXNmcyBBQkkgdG8gdGhlIE1B
SU5UQUlORVJTCmZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNo
cm9taXVtLm9yZz4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA1
N2Y0OTZjZmY5OTkuLmQ1MWU3NDM0MDg3MCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIv
TUFJTlRBSU5FUlMKQEAgLTI4NTcsNiArMjg1Nyw3IEBAIEY6CWRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0LwogRjoJaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaAogRjoJaW5jbHVkZS9saW51eC9wd21f
YmFja2xpZ2h0LmgKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2Jh
Y2tsaWdodAorRjoJRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWNsYXNzLWJhY2tsaWdo
dAogCiBCQVRNQU4gQURWQU5DRUQKIE06CU1hcmVrIExpbmRuZXIgPG1hcmVrbGluZG5lckBuZW9t
YWlsYm94LmNoPgotLSAKMi4yMi4wLnJjMi4zODMuZ2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

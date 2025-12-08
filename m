Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92031CAF40D
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4F510E4B3;
	Tue,  9 Dec 2025 08:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HaH1jgnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA8510E096
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:17:02 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5957753e0efso4532587e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210621; x=1765815421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jgXbDdbaYcIdSL05O2l2ABCcbHA9QI44cOSbmtT2PEQ=;
 b=HaH1jgnDc2ZIOfeV/sqHpO7HvAgdnPBjkFK/QLijHhMmL8bqvS0AtqUUtulrspnVsR
 gGHBlS7SBV9ytk2xH7dih2xFrBSyK8KLJorLYxYXZdgVo9QsiiJgGzF6jj0qjMtc/0ce
 XrBeSJHcldveqfpz1xLM/lJtjTA29vshxQ+E7zBrQD1YBjCKiZijKq4TFT9gspPW6928
 ZnhZBQtL02RYxxETin7WQZR0vpoMF3Enafd0OHHEjUgOAXWaGmVBjLkNdL8oat51Ad6L
 Nd8pf2a3ZMPs4ITlwaEd8pfLtGWeGbYHcCTz4XOEyzwUNxl9VbIK84sjG9hPkG9/tp6A
 BEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210621; x=1765815421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgXbDdbaYcIdSL05O2l2ABCcbHA9QI44cOSbmtT2PEQ=;
 b=TE4DO7m9omjW5Zhx3v9072xcHvbuAO1Xwvvn3UHjral2QhAuILJ+NcHqKbyo0UrlmM
 K7smKtgDRl+J9sZqzxS7kAPqMcLqsLGGlliqD0m0z3q0tnob5OsCDPvLhhCMu1ybZ54s
 EbJ+Yz4HQ6fsqaQr4bOeWzA7TXu/9np+R72uRxiUbY+UJhK+gyGCFvK++Ne/jJO0BqoI
 1y17NfWMZiO9Sfa2s5s2DFMovWfFxcsfQLc2paaMphuD9iNA39lGLwV5ymMohksgJv6g
 0o+cmV6PW3DOtC7GX0prbi8f6uYMa9EDoRQZUXxpOSRCnLaOCHuGSOy8XWMJL5DUEdZr
 fNvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXpv9GDXuqoGwrYYXHHSFrHxPbLxc87m0xkyViPsbDK0U5DY8QbY/oPbZZIWfaNAhQ6DhSy8wWOL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP6JAuJdteoE546a+AQBDI5mpcrWK0HAbQfC09H7HOyV7ieXh4
 Hg8oSzigP0tUZAncKhBXHH42hLyo8K8IpnyZsG0YIxu0YK9t654QEaHR
X-Gm-Gg: ASbGncvb2lvPGDS3pTaSwejS8PJ3neNKoqnsNUvKEifBx+7EDrQrm9eIksfdedSf3ux
 2Mclt5ilSnQnztbzIoyCwbmILE5LVlpSBIN8hF9R8TIxXMFgdffG8DyakDforGxNDFCvuTzVAgU
 rN1UeSt5wpSMYOdxhb3GNAenfxIFmJj/PzHv1OAcTFSCX0//l9QJMevNbLBvPDgkBSTrSPMCBr9
 cazTPAycuGz73kjquEwF7rLwm6aMMNcAgBk47/uV98uaCfjEu1zSkjcunMy3iu5zosco07BBNdC
 ScMVyXEoe1aUahLP7Q5RI14QKetmfsvn3MJZKOLW72/jozJ9q3wjevJF4HrMCtTwqmaUG+K0q6e
 LxjqEDaRkoQVihHVLM7SUVqPoNo8E+XnFuyJeh9T6U64obcjdNLgymvfvbpmnvUJdQaJqqYhWXL
 ptOe/Vv7ebGZFZ+NAqv+S6rNCfj+CI6w==
X-Google-Smtp-Source: AGHT+IFPhDFj0Ru9YJ9UFofOd0skJZa5p0LqMbwZHDi+CAck3YbQ6GktG1xoZ00cJ859sBlgh72aLQ==
X-Received: by 2002:a05:6512:ba8:b0:595:81e5:7570 with SMTP id
 2adb3069b0e04-5987e8be164mr2556094e87.23.1765210620484; 
 Mon, 08 Dec 2025 08:17:00 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-598e902b43esm4148e87.92.2025.12.08.08.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:16:59 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: use reset_gpio as optional
 parameter
Date: Mon,  8 Dec 2025 19:16:57 +0300
Message-Id: <20251208161657.3763370-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some systems the reset pin may not be used.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index d3ce5dd30420..3868ad05e011 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -179,6 +179,9 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 
 static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
 {
+	if (!lt9611uxc->reset_gpio)
+		return;
+
 	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
 	msleep(20);
 
@@ -455,7 +458,7 @@ static int lt9611uxc_gpio_init(struct lt9611uxc *lt9611uxc)
 {
 	struct device *dev = lt9611uxc->dev;
 
-	lt9611uxc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	lt9611uxc->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(lt9611uxc->reset_gpio)) {
 		dev_err(dev, "failed to acquire reset gpio\n");
 		return PTR_ERR(lt9611uxc->reset_gpio);
-- 
2.34.1


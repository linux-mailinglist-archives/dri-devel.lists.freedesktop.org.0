Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB0904C56
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91BF10E7A4;
	Wed, 12 Jun 2024 07:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MxwYCXS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB4F10E671
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:44:29 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2c3274d5cc7so1289704a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718117069; x=1718721869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sooOhbPYvM2Jm19Dsk69908Uka75AAjKxEhPAG0uCwE=;
 b=MxwYCXS/iCvN+Mw4xoB2Mwu9PnuQdXol3mOK3P09cn/kA6MJu80JJIWKv7r2gL+KTk
 S3yoXtYETBH//sRdz6B1NEjcPk1ZjJzcmjjAL1uQgws7Lk/oeXFT2MKxHkGmCgoH9CnT
 IM8s2fPiUWRNH8bjB5vd7jOf/2hia9N/6YVId3c6+KDYBjdCH48xjOdfE9Q98TVW8Umd
 khPkMH8jTtbE4LNkaQjF/IXPqLXJS3cS6m1rvQ5CCPrTtPglvyqBeQyG+1mIDCPaoA6N
 gYRWmUN0pTKlOjunMoNG/Tf78z8aJkjr4lcmM2dCPoXemVYbcfrcuARHRjNSp1ZdABYE
 nJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718117069; x=1718721869;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sooOhbPYvM2Jm19Dsk69908Uka75AAjKxEhPAG0uCwE=;
 b=AgTlgakNwT85JOCKNqLUxhb1NObn908Ra1L4RqKTscziw/nWX6W8mUXb/RiTA2qNF7
 RurXyp2U7aDQLcspF5CNIEdKd8ZNqze9Xl8Ej5pAYFsiUBZEv5FPsurOMOisQwzkhAqf
 JDp99Emu5qefAYB7ZzKIfQ16njm1H5+jgHskGL2H4H37pJAPMi2qh7k98l0Wtv21WriP
 PLQuyaKei6rhSXgk+dC002dauNexG7nBG8/2h9OAoe6PtUXpaJnr6qK0Gpww5VgRL08G
 QYC4jHqi8Rh7/uApm2SzUW1UFwzILQ44FAz49Hn5bMKoWzBFcMYKogDrLhpOuFiwwIEK
 xLQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYtntJDtZIRHDzyh4yN30IKLgs6tce+iUzo/gyvJCR71ee1gKuOJxSwp4Ekwdg4MHLUq4s3DUH/1hIOyelgJDiYNHhyZ7Vwm+HqkF7GH3l
X-Gm-Message-State: AOJu0YyDfFGq/5FR+HrvYC+yWQ1jZTEzDWxOA34g1dkJVpnLFmH0vH+I
 yFOW78NaJ7N1ZCzhmIMTrik8kBvByXfjqVirwnV/twP+zCAmI2nt
X-Google-Smtp-Source: AGHT+IFHxTkdorpqdn2uGgVg/VO/FD7B5Vr6QXa3zpYjXquvcfZ9ef9ZyG7rA/OrmjHgvMaSTfc/sA==
X-Received: by 2002:a17:90b:4389:b0:2c3:2377:73f2 with SMTP id
 98e67ed59e1d1-2c323777453mr3468912a91.39.1718117069079; 
 Tue, 11 Jun 2024 07:44:29 -0700 (PDT)
Received: from [192.168.0.105] ([103.246.195.195])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f71b9dec2bsm32192875ad.186.2024.06.11.07.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:44:28 -0700 (PDT)
Message-ID: <3288287d-8344-4b37-a333-722cf12fef13@gmail.com>
Date: Tue, 11 Jun 2024 20:14:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel : truly-nt35521: transition to mipi_dsi wrapped
 functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 12 Jun 2024 07:07:59 +0000
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

Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce 
mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
("drm/mipi-dsi: wrap more functions for streamline handling") for the
sony tulip truly nt35521 panel.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---

Changes in v2:
    - Fix patch format
    - Fix code style

v1: https://lore.kernel.org/all/485eef24-ddad-466a-a89f-f9f226801bb7@gmail.com/

---
 .../panel/panel-sony-tulip-truly-nt35521.c    | 435 +++++++++---------
 1 file changed, 209 insertions(+), 226 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
index 6d44970dccd9..5a050352c207 100644
--- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
+++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
@@ -44,248 +44,231 @@ static void truly_nt35521_reset(struct truly_nt35521 *ctx)
 static int truly_nt35521_on(struct truly_nt35521 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xff, 0xaa, 0x55, 0xa5, 0x80);
-	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x11, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xf7, 0x20, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x21);
-	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x01, 0xa0, 0x10, 0x08, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xb8, 0x01, 0x02, 0x0c, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x11, 0x11);
-	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb6, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x09, 0x09);
-	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x09, 0x09);
-	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x8c, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x8c, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xca, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x04);
-	mipi_dsi_generic_write_seq(dsi, 0xbe, 0xb5);
-	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x35, 0x35);
-	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x25, 0x25);
-	mipi_dsi_generic_write_seq(dsi, 0xb9, 0x43, 0x43);
-	mipi_dsi_generic_write_seq(dsi, 0xba, 0x24, 0x24);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xee, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0xb0,
-				   0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb6, 0x00, 0xc3,
-				   0x00, 0xce, 0x00, 0xe1, 0x00, 0xf3, 0x01, 0x11);
-	mipi_dsi_generic_write_seq(dsi, 0xb1,
-				   0x01, 0x2e, 0x01, 0x5c, 0x01, 0x82, 0x01, 0xc3,
-				   0x01, 0xfe, 0x02, 0x00, 0x02, 0x37, 0x02, 0x77);
-	mipi_dsi_generic_write_seq(dsi, 0xb2,
-				   0x02, 0xa1, 0x02, 0xd7, 0x02, 0xfe, 0x03, 0x2c,
-				   0x03, 0x4b, 0x03, 0x63, 0x03, 0x8f, 0x03, 0x90);
-	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x03, 0x96, 0x03, 0x98);
-	mipi_dsi_generic_write_seq(dsi, 0xb4,
-				   0x00, 0x81, 0x00, 0x8b, 0x00, 0x9c, 0x00, 0xa9,
-				   0x00, 0xb5, 0x00, 0xcb, 0x00, 0xdf, 0x01, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xb5,
-				   0x01, 0x1f, 0x01, 0x51, 0x01, 0x7a, 0x01, 0xbf,
-				   0x01, 0xfa, 0x01, 0xfc, 0x02, 0x34, 0x02, 0x76);
-	mipi_dsi_generic_write_seq(dsi, 0xb6,
-				   0x02, 0x9f, 0x02, 0xd7, 0x02, 0xfc, 0x03, 0x2c,
-				   0x03, 0x4a, 0x03, 0x63, 0x03, 0x8f, 0x03, 0xa2);
-	mipi_dsi_generic_write_seq(dsi, 0xb7, 0x03, 0xb8, 0x03, 0xba);
-	mipi_dsi_generic_write_seq(dsi, 0xb8,
-				   0x00, 0x01, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x2a,
-				   0x00, 0x41, 0x00, 0x67, 0x00, 0x87, 0x00, 0xb9);
-	mipi_dsi_generic_write_seq(dsi, 0xb9,
-				   0x00, 0xe2, 0x01, 0x22, 0x01, 0x54, 0x01, 0xa3,
-				   0x01, 0xe6, 0x01, 0xe7, 0x02, 0x24, 0x02, 0x67);
-	mipi_dsi_generic_write_seq(dsi, 0xba,
-				   0x02, 0x93, 0x02, 0xcd, 0x02, 0xf6, 0x03, 0x31,
-				   0x03, 0x6c, 0x03, 0xe9, 0x03, 0xef, 0x03, 0xf4);
-	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x03, 0xf6, 0x03, 0xf7);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x22, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x22, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb2, 0x05, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x05, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x05, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb5, 0x05, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xba, 0x53, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x53, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x53, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x53, 0x00, 0x60, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x00, 0x34, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc1, 0x00, 0x00, 0x34, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x00, 0x00, 0x34, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc3, 0x00, 0x00, 0x34, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc4, 0x60);
-	mipi_dsi_generic_write_seq(dsi, 0xc5, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x05);
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb2, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb5, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb6, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb7, 0x17, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb8, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb9, 0x00, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0xba, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x02, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x02, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x03, 0x03, 0x00, 0x03, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x0b);
-	mipi_dsi_generic_write_seq(dsi, 0xc1, 0x09);
-	mipi_dsi_generic_write_seq(dsi, 0xc2, 0xa6);
-	mipi_dsi_generic_write_seq(dsi, 0xc3, 0x05);
-	mipi_dsi_generic_write_seq(dsi, 0xc4, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x22);
-	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x07, 0x20);
-	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x03, 0x20);
-	mipi_dsi_generic_write_seq(dsi, 0xca, 0x01, 0x60);
-	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x01, 0x60);
-	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x00, 0x00, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xcd, 0x00, 0x00, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xce, 0x00, 0x00, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xcf, 0x00, 0x00, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xd1, 0x00, 0x05, 0x01, 0x07, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x10, 0x05, 0x05, 0x03, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x20, 0x00, 0x43, 0x07, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x30, 0x00, 0x43, 0x07, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0xd0,
-				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd5,
-				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-				   0x00, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd6,
-				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-				   0x00, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd7,
-				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-				   0x00, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xe5, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xe6, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xe7, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xe8, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xe9, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xea, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xeb, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xec, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xed, 0x30);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xb2, 0x2d, 0x2e);
-	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x31, 0x34);
-	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x29, 0x2a);
-	mipi_dsi_generic_write_seq(dsi, 0xb5, 0x12, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0xb6, 0x18, 0x16);
-	mipi_dsi_generic_write_seq(dsi, 0xb7, 0x00, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xb8, 0x08, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xb9, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xba, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x31, 0x08);
-	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x03, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x17, 0x19);
-	mipi_dsi_generic_write_seq(dsi, 0xbe, 0x11, 0x13);
-	mipi_dsi_generic_write_seq(dsi, 0xbf, 0x2a, 0x29);
-	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x34, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xc1, 0x2e, 0x2d);
-	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xc3, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xc4, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x2e, 0x2d);
-	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x31, 0x34);
-	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x29, 0x2a);
-	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x17, 0x19);
-	mipi_dsi_generic_write_seq(dsi, 0xca, 0x11, 0x13);
-	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x03, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x08, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xcd, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xce, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xcf, 0x31, 0x08);
-	mipi_dsi_generic_write_seq(dsi, 0xd0, 0x00, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xd1, 0x12, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x18, 0x16);
-	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x2a, 0x29);
-	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x34, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xd5, 0x2d, 0x2e);
-	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xd7, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xe5, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xe6, 0x31, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd9, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xe7, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xf7, 0x47);
-	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x0a);
-	mipi_dsi_generic_write_seq(dsi, 0xf7, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x17);
-	mipi_dsi_generic_write_seq(dsi, 0xf4, 0x60);
-	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xf9, 0x46);
-	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x11);
-	mipi_dsi_generic_write_seq(dsi, 0xf3, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd9, 0x02, 0x03, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x6c, 0x21);
-	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x11, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf7, 0x20, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x21);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x01, 0xa0, 0x10, 0x08, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb8, 0x01, 0x02, 0x0c, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x11, 0x11);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb6, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x09, 0x09);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x09, 0x09);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x8c, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x8c, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xca, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc0, 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbe, 0xb5);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb3, 0x35, 0x35);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4, 0x25, 0x25);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x43, 0x43);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba, 0x24, 0x24);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xee, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0,
+					 0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb6, 0x00, 0xc3,
+					 0x00, 0xce, 0x00, 0xe1, 0x00, 0xf3, 0x01, 0x11);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1,
+					 0x01, 0x2e, 0x01, 0x5c, 0x01, 0x82, 0x01, 0xc3,
+					 0x01, 0xfe, 0x02, 0x00, 0x02, 0x37, 0x02, 0x77);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb2,
+					 0x02, 0xa1, 0x02, 0xd7, 0x02, 0xfe, 0x03, 0x2c,
+					 0x03, 0x4b, 0x03, 0x63, 0x03, 0x8f, 0x03, 0x90);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb3, 0x03, 0x96, 0x03, 0x98);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4,
+					 0x00, 0x81, 0x00, 0x8b, 0x00, 0x9c, 0x00, 0xa9,
+					 0x00, 0xb5, 0x00, 0xcb, 0x00, 0xdf, 0x01, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb5,
+					 0x01, 0x1f, 0x01, 0x51, 0x01, 0x7a, 0x01, 0xbf,
+					 0x01, 0xfa, 0x01, 0xfc, 0x02, 0x34, 0x02, 0x76);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb6,
+					 0x02, 0x9f, 0x02, 0xd7, 0x02, 0xfc, 0x03, 0x2c,
+					 0x03, 0x4a, 0x03, 0x63, 0x03, 0x8f, 0x03, 0xa2);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb7, 0x03, 0xb8, 0x03, 0xba);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb8,
+					 0x00, 0x01, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x2a,
+					 0x00, 0x41, 0x00, 0x67, 0x00, 0x87, 0x00, 0xb9);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9,
+					 0x00, 0xe2, 0x01, 0x22, 0x01, 0x54, 0x01, 0xa3,
+					 0x01, 0xe6, 0x01, 0xe7, 0x02, 0x24, 0x02, 0x67);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba,
+					 0x02, 0x93, 0x02, 0xcd, 0x02, 0xf6, 0x03, 0x31,
+					 0x03, 0x6c, 0x03, 0xe9, 0x03, 0xef, 0x03, 0xf4);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0xf6, 0x03, 0xf7);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x22, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x22, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb2, 0x05, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb3, 0x05, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4, 0x05, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb5, 0x05, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba, 0x53, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x53, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x53, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x53, 0x00, 0x60, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc0, 0x00, 0x34, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x34, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc2, 0x00, 0x00, 0x34, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc3, 0x00, 0x00, 0x34, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc4, 0x60);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc5, 0xc0);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc6, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc7, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x05);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb2, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb3, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb5, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb6, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb7, 0x17, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb8, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x02, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x02, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x03, 0x03, 0x00, 0x03, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc0, 0x0b);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc1, 0x09);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc2, 0xa6);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc3, 0x05);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc4, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc5, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc6, 0x22);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc7, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc8, 0x07, 0x20);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc9, 0x03, 0x20);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xca, 0x01, 0x60);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcb, 0x01, 0x60);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcc, 0x00, 0x00, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcd, 0x00, 0x00, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xce, 0x00, 0x00, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcf, 0x00, 0x00, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd1, 0x00, 0x05, 0x01, 0x07, 0x10);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd2, 0x10, 0x05, 0x05, 0x03, 0x10);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd3, 0x20, 0x00, 0x43, 0x07, 0x10);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd4, 0x30, 0x00, 0x43, 0x07, 0x10);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd0,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd5,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd7,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe5, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe6, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe7, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe8, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe9, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xea, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xeb, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xec, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xed, 0x30);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x06);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb2, 0x2d, 0x2e);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb3, 0x31, 0x34);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4, 0x29, 0x2a);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb5, 0x12, 0x10);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb6, 0x18, 0x16);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb7, 0x00, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb8, 0x08, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x31, 0x08);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x03, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x17, 0x19);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbe, 0x11, 0x13);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbf, 0x2a, 0x29);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc0, 0x34, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc1, 0x2e, 0x2d);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc2, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc3, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc4, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc5, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc6, 0x2e, 0x2d);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc7, 0x31, 0x34);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc8, 0x29, 0x2a);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc9, 0x17, 0x19);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xca, 0x11, 0x13);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcb, 0x03, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcc, 0x08, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcd, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xce, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcf, 0x31, 0x08);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd0, 0x00, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd1, 0x12, 0x10);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd2, 0x18, 0x16);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd3, 0x2a, 0x29);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd4, 0x34, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd5, 0x2d, 0x2e);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd7, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe5, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe6, 0x31, 0x31);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd9, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xe7, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf7, 0x47);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x0a);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf7, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x17);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf4, 0x60);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf9, 0x46);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x11);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf3, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd9, 0x02, 0x03, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x6c, 0x21);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
 	usleep_range(1000, 2000);
 
-	mipi_dsi_generic_write_seq(dsi, 0x53, 0x24);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x53, 0x24);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int truly_nt35521_off(struct truly_nt35521 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 150);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(150);
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int truly_nt35521_prepare(struct drm_panel *panel)
-- 
2.45.2


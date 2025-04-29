Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8865AA06EB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 11:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B2C10E3FE;
	Tue, 29 Apr 2025 09:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="1844ANB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3681B10E3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:20:40 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-736c8cee603so581682b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745918440; x=1746523240; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uXN+jhLGdXGQPrM46EPqrwhrceeRXpjRt30SBte/Qog=;
 b=1844ANB2b1VDmD81KIUnEqO3SZaEA/V1LdNvguJhjFD7Qgx7oLbudPtRtKk6EgtuxO
 Avj0o10tazdF8cFykuplr4emkIjvBldRI61Pb9IDD8N5BtKT557h62uoRdIxF+KbRI8L
 Kd0QXZiomFMkgd0cIZr2xgNuA2S0+ZvV7FiwlHcPPiO1fTlJNA9DG22ymGDSHhEuZW5c
 CBRFUyYzLV4323fHKcCnGx73C9dnM9uMIDNyl2hFjR3YzIOqS8T8KYfuRQy4diINuqGv
 FknHW0s3CJNNG/IeSDD2ckCj50jrhKm0+ooSFI+aLsR8GBJgKOJLc4V1xsOK7omZaDcp
 QE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745918440; x=1746523240;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uXN+jhLGdXGQPrM46EPqrwhrceeRXpjRt30SBte/Qog=;
 b=tjvLx/ZjaHrj4qk7tANEj0RnV7XRKYhpkhelcKXTwtuNu43qm4IXBPruPKdJi1fvMl
 gdHQLcyzpF4TDP+x1YWv47M8V3PLNQU3tCLZJxIb3rxFGu+4RWcTP0XutasuPMpjBPQj
 Bw/IN7ZDVYkBl0i+EOWi0zPZxoV4XGz8tvXlmfg56O2z/hV/FHLiMe/dkVwS9z1bB4iO
 0CofRnP/ikd0fWKYDd18d5yxFEpL7MQdWbi6aeTlTpAF1SlI6m0eowh6Q9SQRtQS8GBg
 SKhtkKWTXwFcmkoJKb9PuLL6V5U01uSd3bxgoKEd6J0vsOIbc8LRKttzX000yHOLpew9
 y1hw==
X-Gm-Message-State: AOJu0Yy4mc1qkcN3KfEcACxIpH1jkzCXUFvrJZ44p/q/+/gjQvqEG5w1
 PRQVlLlh6u1MkdLp5Xs3OimZMedlijBRCJdShBihLZ3jWJMck3qAPN5wUF69nT6tGMX1bOxg3an
 kjZSYKQ==
X-Gm-Gg: ASbGncs166xb9IsgYDmrM/s6IKVWvZBFc70N1y+K+xC/Rs7o8HbLfRCDASdHTCUt6qn
 CqtCaeGNChRstcgMv16u8P6nt/iIwd6kj/qTsk61wuceG1oqwdwXcuj/Uw98sqpg6fmWhbQD46n
 CrxTFOLP2CWMJJ6FENVYrWojuwssn3ERo8XeFEFLuV8ulYew/jJ/Ux/9/f75lss/yOCr0cBfaOb
 an5Cv7EAs9AKZP1RY6fgSSKvB8Z+UTRbNTRZE8ZBSC0CsUWVnW3URzAavg0M9jXKyAK4xhM2w/8
 RQ+1gUXkT7USISwKOfIsT5SPVs50eO8NfFhw9W/lqdjSzxsxZiumeLvTzGaUO65Mp86zC2fgmFU
 3ot5s
X-Google-Smtp-Source: AGHT+IG+15drw1HE4LF6BgEWXs2qRjNpr1HvzCSKPm7xtb+B+MDf+JIRvdQU8yNQIKy6C5t5pg6VQQ==
X-Received: by 2002:aa7:9a89:0:b0:730:8c9d:5842 with SMTP id
 d2e1a72fcca58-7402914f1c0mr915425b3a.5.1745918439780; 
 Tue, 29 Apr 2025 02:20:39 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 02:20:39 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
Date: Tue, 29 Apr 2025 17:20:28 +0800
Message-Id: <20250429092030.8025-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
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

AUO B140QAN08.H EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 06 af b9 fe 00 00 00 00
00 23 01 04 a5 1e 13 78 03 c1 45 a8 55 48 9d 24
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 18 86 40 a0 b0 08 52 70 30 20
65 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fd 00 28
3c 71 71 22 01 0a 20 20 20 20 20 20 00 00 00 fc
00 42 31 34 30 51 41 4e 30 38 2e 48 20 0a 01 79

70 20 79 02 00 21 01 1d c2 0b 58 07 40 0b 08 07
88 8b fa 54 7e 24 9d 45 12 0f 02 35 54 40 5e 40
5e 00 44 12 78 22 00 14 ef 3c 05 85 3f 0b 9f 00
2f 80 1f 00 07 07 51 00 05 00 04 00 25 01 09 ef
3c 05 ef 3c 05 28 3c 80 2e 00 06 00 44 40 5e 40
5e 81 00 15 74 1a 00 00 03 00 28 3c 00 00 60 ff
60 ff 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..a7ada5382c82 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1878,6 +1878,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
-- 
2.17.1


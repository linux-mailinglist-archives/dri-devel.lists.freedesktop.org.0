Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E925EB46F55
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4367310E389;
	Sat,  6 Sep 2025 13:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ahuvq29W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A8C10E38C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-55f68d7a98aso3414192e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166869; x=1757771669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71pLyutaBp87cS0Y4+A/ArGFNnaGoasujHt7io2bQsc=;
 b=ahuvq29W4mpjTeFEKTeNmCTWGywtZzZ3GPJ3BRxuSf/gSCRmX+np5dMLmtnRt92NF6
 NV7pfac66jTgi4KoFH+YKxbtPPqEvf29QtdwoX05Gkg5ecCYQYh9yds2ENnMHLAN5JZR
 fw7vX/FQXHH30Mulya9hGuOtLc7g4p1lmY0COJgZTpsFSSKtgRAUPd25g6acQz3H3ZCJ
 K0SvPLLv9oEe9EvWlpgkET3LmRqwefh6mrSeNZl/L2V1sFJy/WgnOrVzfxep9ARV7R39
 TTxyuF0cJ1wJ5hCnrK86ZT7FKxifUouao1nqQJYAbast+s4a3JtaBWaXDHDBKP2BDSs3
 UsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166869; x=1757771669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71pLyutaBp87cS0Y4+A/ArGFNnaGoasujHt7io2bQsc=;
 b=AK05GcXZR5l3VRQ03Wkrf44pYJrXZQEP/Jsc+P43zwYq6WO3H/sY0gwrhyjxXoJrM+
 o8MfmxfidD/TbP23dKeyia87781TwYQEw/4wqvbyjdBBMpimUdwWUGf7+zgISq8RiNTa
 AfJtmJqB0U/KScuYIcRCNn4I4lY68KRmuMJbR9dqzF7oc3ejOsAkx6DXpi+O00MMWUev
 oaOnvKkXgfwyaPIQqOAJyEv2EGQKkjfD8XMq57NZKVEQ/epffj7RX4Swrs1c8eNbaQo6
 tdr6FoW9t/t84BUvyRDbLFQPHGpBAh3LRuhEXoq8VrDZltZPgifweFthVRTTys7TEeHz
 QXsg==
X-Gm-Message-State: AOJu0YxoerOxrEsnlQaevmE+Y2KehWHncZixrjoBMtztKK4XMDZnNNl3
 kGRyIGm0aejgcrchDIfT+NCMfT6IK5E/YHGtK65b1Mfez5GyC+sxzvbc
X-Gm-Gg: ASbGnctohpGA71uRGR7Zn7JgfwmrVlrTqZ1qhAmoIogpJUmxtNpwNcsVKwLb9jhNkVF
 oNCq8E+Za8biY7TDMIt+DJDkjftkRFUiOg7Lzl5hdrk7nEerNyZ0X1tRgigXH1ftgcFtxEYROyV
 j1h3aTCNHwon6IT23hiX5CXQD/7FSnizzH2YkQQu3cm2LEIlHGOwYxNUtVcLLcRDojDCaevVFvC
 +f/lZJ4d9Spzg5Rv0qBMP0cpZmogHavVtyT6E1vYKxw/P7bqM0c5ZgbRt2z0BF3YdCjpYb96KFc
 OF21In0PEI8H+3HBjQPKkwOKLksG8BMZ3gFt5fhU6mGqwwXXYBNRXiY5KHVgk+MSKVkTj3pLaFK
 ZbToLoULb9h/8eA==
X-Google-Smtp-Source: AGHT+IEg1qsnc3gm9kCOfmMvOVRWziPs9tZ0bG+/2BX69CnDioWbbs9wqbu/YMJp9IAdkiymwh1eFA==
X-Received: by 2002:a05:6512:689:b0:55f:4cbc:8522 with SMTP id
 2adb3069b0e04-56260e42ad4mr696185e87.30.1757166869186; 
 Sat, 06 Sep 2025 06:54:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 17/23] staging: media: tegra-video: tegra20: set VI HW
 revision
Date: Sat,  6 Sep 2025 16:53:38 +0300
Message-ID: <20250906135345.241229-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Tegra20, Tegra30 and Tegra114 have VI revision 1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 781c4e8ec856..e0da496bb50f 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -588,6 +588,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


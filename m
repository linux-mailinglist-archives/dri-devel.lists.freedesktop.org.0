Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D4B46F36
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB6710E380;
	Sat,  6 Sep 2025 13:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CVbKr4xF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C76E10E37F
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:15 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55f753ec672so3404520e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166853; x=1757771653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=srN5K9aEte+IHJ7do+e8te0vwtoLo2YE64UbrpcA8GY=;
 b=CVbKr4xFa9MfookHhSuRTN9v6g5rxiVcjGUrZGuOC3gI/B4MIQw+Pi5N4TIVKGlX9n
 YcJxbc9Oh2Izod7mDLBhho2cCjPD94IL7elOTDEhPWAqfLtCbY1VppOokt9HZ35SkDzg
 OLtsPZaq5P1YdTarI72AOHCdEuHdtUbdMERcHi2OECsudZKT0SWa6b/ZDIfAW6owskDi
 NUkqgPiCpxWfizR+FFD1XTGJWpP5RP3KmkWp98lMzVwAubY01q2/x1vF2/LSIwsK7lfP
 ycCWzBSyy+oFsff02Kf5IuSeZ0bj2oFprQYp4SR0zUnZ14KM7RrG3A9xnIkSnHUe5+uF
 ZHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166853; x=1757771653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=srN5K9aEte+IHJ7do+e8te0vwtoLo2YE64UbrpcA8GY=;
 b=kg25HUjGJHfWH7emkVVd8TI92JqaNyXnP9F1v5ljv2YfiUc6sIzBhh6DQYjsCq0BEI
 xiSARknBJjWkj6eOFO7bLBrGMXUOWtMrtofOPdcOPdzQACS44+XOBvgkTyHMLYUoqc2W
 5ACti+fB2hXa8NJybW2lucKE5mMAL9cri/pJjbZa9kIj4eVKDICETat2E2mH7nvzQRqP
 aBBUkoS9MjPuibouttDlfjplAUcUk14Ukfq70hrJf0dH1HF+yLh+Lk+yoyiimFBQH6ul
 dKRKcZRi4I03x34ZQtbj3NSbWiYf5asuU9OxgcFY4o9i/Hiv7c9XTnuA3m2EDBibbV1d
 xRZA==
X-Gm-Message-State: AOJu0Yz6OD58CT5mY9YNis1S0jk8XizMa/YWmEika5SbPIef6EFIWv4f
 oAmZih0F0SR2RJiYJ+q+XXZepTlwaXq5FIuVr7HfqhjW2t+CXob3cvBR
X-Gm-Gg: ASbGncv8gepf/LjPzmw24t8FrvPciA/YhU9hBBDtDEJPza3ocr/X25N72GoHIVlq8Sw
 o6jYYm4CiaiYzRHtcqf2ZsJo3EituL9HrJPC1Je3ryRNIx6ufnA18yATWrleV3fb7ZZFwHP3vUq
 khqFUCh7Uk4r/JEk5TP5uxouO+jr7q0WiS+mIuLK9tyT5zrScAOZ9N5e9MfGeeJ2ueV1Toy3X9b
 k/8yjG90VKobw/LkPD3SeTvfco/p2gU+2p+SlgKvPR6lI7lgLymqPP81NZoGYUBmlPLkeNbQGrB
 GPrsSoUi4GrazVLs8y/swqZ6DSc9AS9t6I9vm1QKno8P1EoVA3cum9OxxcSewJkdeP3ASlPezMc
 7z+RojBiU2jJumfsdrFmknSfR
X-Google-Smtp-Source: AGHT+IGCt2eHiwI1aZznp5qV4unVuJPYb6+RIXeJ7Ssqv7sSVpNp64yWTQMgPLJorRM1xtlStCmyhw==
X-Received: by 2002:a05:6512:39d6:b0:55f:391b:54df with SMTP id
 2adb3069b0e04-562618e1854mr654591e87.47.1757166853171; 
 Sat, 06 Sep 2025 06:54:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:12 -0700 (PDT)
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
Subject: [PATCH v2 07/23] staging: media: tegra-video: vi: add flip controls
 only if no source controls are provided
Date: Sat,  6 Sep 2025 16:53:28 +0300
Message-ID: <20250906135345.241229-8-clamor95@gmail.com>
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

Add HFLIP and VFLIP from SoC only if camera sensor does not provide those
controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1


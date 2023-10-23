Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678177D3FE3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 21:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503410E22C;
	Mon, 23 Oct 2023 19:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E4910E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 19:11:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so2809370e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698088278; x=1698693078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GO9pyv976h/9S8gorIMhEgb5zOHhcco+YLW7BrIty0s=;
 b=OVvXtUSCrzbkXa8fBMxUPZb69v2Mb+inVux0Z9D6HGnB8Q9hNjEqkneT0o9IOa3BGf
 9YjSve4lLCPPQeUQDyDxt04Ah8ITQ4ogKV2NyHT1eLfrqVBTVXdxLqAw0motR1/Mth6O
 DAdRtVn5XG/bY1rNue6QGIBhoCyVofNP9xO9BkgnGmLbz0VwplaGtkAhRI4cQ5IIrIQ9
 5Xoar+6IL//5cAZTWWwMqZ26W4hl/HNxP7I7t6I62d+v85rHUQonqLsAYTr9EAD2iwo8
 mIewHryuJ7rHPYuIhMiTWTdj6mNiYKbkV6MaOvWff391M8VV1IYL4/zcSu+ZnruDiv04
 wptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698088278; x=1698693078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GO9pyv976h/9S8gorIMhEgb5zOHhcco+YLW7BrIty0s=;
 b=qAi51XLR3rtKTpFPDWVVYeJm/Vjqym6pCGqxDibn8tAdEYsuKZzmdP2VdppTp1t2Mk
 /FrdhgZedf7qLOsEMMBD1Mg+ZNvSp/KznAFqCmuHAR9D81ykVBuguO9m9d2k9l4tlT4n
 q2zPR/DJduzCDoexv6bGOZFmrYAQAKahrNl4ao0pI8gD9XpAflV0iqKdtqgiXgUBbzVp
 h+44/k6gcND3TLqEdLcXbTiKyBnDhWip/3FsZ9ubxwTx8eMwYEUXKh3hjhHhVufafNkI
 NSK2joeRVBi01/rtQPgoIfJpVgQJpcJby8GE2KhRBEZFkFgUuqn2wJOsyz516X/KYYFd
 ifHQ==
X-Gm-Message-State: AOJu0YwM4dUFxtmbgd/gwf+7ELNmrX3Ja/j1tU09jb5jhp8qQ2IfJpay
 pzDFm2WUkjZ+ADTxph+H+7M=
X-Google-Smtp-Source: AGHT+IFoG73WsHG9mQHz3C0QTTAsRZPJgjLfM1mDXnB4R4zv6xRHasqvRkUQLuIrH7X3daCy21jPWA==
X-Received: by 2002:a05:6512:2255:b0:506:8d2a:e31f with SMTP id
 i21-20020a056512225500b005068d2ae31fmr9336989lfu.46.1698088278334; 
 Mon, 23 Oct 2023 12:11:18 -0700 (PDT)
Received: from Slimbook.. (181-251-201-31.ftth.glasoperator.nl.
 [31.201.251.181]) by smtp.gmail.com with ESMTPSA id
 vg18-20020a170907d31200b009adc77fe164sm7062459ejc.66.2023.10.23.12.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 12:11:17 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH RESEND 1/2] drm: panel-orientation-quirks: Add quirk for Ayn
 Loki Zero
Date: Mon, 23 Oct 2023 21:10:58 +0200
Message-ID: <20231023191059.19915-2-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023191059.19915-1-boukehaarsma23@gmail.com>
References: <20231023191059.19915-1-boukehaarsma23@gmail.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, boukehaarsma23@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add quirk orientation for the Ayn Loki Zero.

This also has been tested/used by the JELOS team.

Signed-off-by: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d5c15292ae93..7466354c7e5b 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYN Loki Zero */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Zero"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.41.0


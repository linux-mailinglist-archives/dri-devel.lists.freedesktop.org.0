Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA07D3FE5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 21:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E2010E230;
	Mon, 23 Oct 2023 19:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627B910E230
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 19:11:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so5089059e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 12:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698088281; x=1698693081; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IdB/BGfiU50tq91OXEW4jEb/ithHfUpM77EyD2syuso=;
 b=JU9eWeCnMW+jxLE5CGl1hDXnwRx2jFgeSgIpFWYn9eBIEBrTf+8v/XteW37lUr/9+P
 lJEquxNTrtPGYZrgi/q4HKijLPO9X5F6Yw2dvFEwK1cHjc/gHjeEga507aP0DMLjqicN
 MmCD8vybO7pkp0B51vbubqnKz0bcuwAPqMcblpddEE6FhIOGqc7apLZXteEZKmqZ/G2l
 94jYh2UMzDIKOlHOWLnATLIM7gu7YfcDYsj8Aed18Rab/x5exQbv2vd3x67huWKKvEp9
 L7bsmAAT96Yy4aOG5q0OOZDrqac6+Ep1W/V2wjZ1VclxGbxHZfNkBXBBcT+Zup0Z9Rsa
 G5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698088281; x=1698693081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdB/BGfiU50tq91OXEW4jEb/ithHfUpM77EyD2syuso=;
 b=WISR44vIZE8zag+YCIWTI8tEXL3FBXRnCjT+aTpnAh1OKJmOiWcG7aHlhxntKNF8Tp
 NbpU7ZrYIi/Ed9EezxnKzpv3rcaz0p3bB7St9AcDZCs9aNP53f6E6ovgJWSfM9sju1Q3
 sXAhQsPgniwOoeZNOdcuWKnAGBHkWKjC7VuG3B7iC866kJ6gx+PihP18SDe9TA3OGHY3
 HUv4P1Y7Jirx1jG+ynOEAFlZmK46HjtDUX40+K27dcTavEPVoueV4j5y1+6B/WsO+1ni
 vNksTrsA1Xo2WE9m5qtnxzNdJvGkTMuXtFrLwXaPufFnqzgCk1uKOM9dpZ3YGdZ7uOYu
 gUyg==
X-Gm-Message-State: AOJu0YzWpOVfgf9bn8mumYB5sI7a2oueu0so46MO6v4NXQsP1ST5Fb0P
 MIKMoB1+JdP6Spjbr4VKRfs=
X-Google-Smtp-Source: AGHT+IH56wKrPVXYBFmpJ2Rc5ew0HtICHX6pQamTxBjFaB06LNEkOjvvgCoHVyCC782dakNLnMYRtQ==
X-Received: by 2002:a19:f807:0:b0:507:96c7:eb1a with SMTP id
 a7-20020a19f807000000b0050796c7eb1amr6357924lff.54.1698088281341; 
 Mon, 23 Oct 2023 12:11:21 -0700 (PDT)
Received: from Slimbook.. (181-251-201-31.ftth.glasoperator.nl.
 [31.201.251.181]) by smtp.gmail.com with ESMTPSA id
 vg18-20020a170907d31200b009adc77fe164sm7062459ejc.66.2023.10.23.12.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 12:11:21 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH RESEND 2/2] drm: panel-orientation-quirks: Add quirk for Ayn
 Loki Max
Date: Mon, 23 Oct 2023 21:10:59 +0200
Message-ID: <20231023191059.19915-3-boukehaarsma23@gmail.com>
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

Add quirk orientation for Ayn Loki Max model.

This has been tested by JELOS team that uses their
own patched kernel for a while now and confirmed by
users in the ChimeraOS discord servers.

Signed-off-by: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 7466354c7e5b..5adf9ff07c3e 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {    /* AYN Loki Max */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYN Loki Zero */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
-- 
2.41.0


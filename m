Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D8A95044
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 13:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B4410E37E;
	Mon, 21 Apr 2025 11:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="BMkvScCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D6410E37E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 11:36:52 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-301a8b7398cso639479a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745235412; x=1745840212; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FhFIJlsJNcjxF9uhU7iVu8lHjUkQFZCXgWTbQ9gvUIo=;
 b=BMkvScCNiJcBwh1Xd3JKWwK4PoeluL2ZzesILYWqkWf9KMNEgGN3bDowzCMC2/GaVc
 lrDRJfC+wKxO9++mUr6Sabbw3E4pSLnURF26NQAZGY3OwdbYPBdAjPsQVPx6fd4h4zFu
 bVkeTm05pA8M6QxrCejaPVpjySjU1m2k3outMpDWpcbHLgWG0T3WteZMsVygjzbVtPlu
 eLe5LyD45SKFOoVQsjNVhxzeWgr4QMdV+46XZwkb5Jz6yMHvLDu2hTMaAjq0wn8NWSUB
 wXcf1ClwEvsgfL1yhkghcxvJLv4VWLEP3QZ5wQphDhMosSmwWA/nRQR+2/r06vqDEFBh
 wj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745235412; x=1745840212;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhFIJlsJNcjxF9uhU7iVu8lHjUkQFZCXgWTbQ9gvUIo=;
 b=hcorSI4VWXrgWTv/+9LtI0eTSk2NAeRxVS9Du+xYf06O+1J9hyWH7bWf8JDBdqRRWS
 g7IeISAdbvOwTWqdUKdVHQPqSVEQThnKiNDPNjXD5hMECgqNRDHbsVt9icIP08XjIc4k
 clr8D3qRkzYR4C2lcpFxcgbT5hHCV3plgO99nvdYXSKTGXQAxWMi0z+FepAKuMuJkEnT
 xfFdAoCFdehBHQky4zTGM8T+9qGO7uzEEGIOKyFbMX7bvSbaP3EfZbS+AGXprbCb3Yb5
 bgllOzwpl6cZKuerpiHydklzHZTyRrx6lRdSns0+Gouu4N4qnC3EDbh02aUxr34PrwMo
 u99A==
X-Gm-Message-State: AOJu0Yz5/jvmdSHpa0OXun6Gzus0KJvKc55nz/F/1bimSHLoCBlZxcGx
 3nWyzg21CHP8+s7qUNxayCiITuINefelO9M1CY2n6E6d0iqOKM8jMY75fYc65Ww=
X-Gm-Gg: ASbGncuZV+nMQLZpL6upXVloAbrLOK1lBUaA/50JtDACPkLqEzrd9z0pigL2ZhOo5DF
 JZzXIph073IGgkrIGONv8EioXlMMLIKVS1LlkxS//V7yMSKpRSLZs0CeoPm6nGm7NyOdlhCaZdJ
 28EgM7ptH6MKGA3XAG6y76+n5kSSH9KJ87AZo3lH9GcGLJ2s9gNq9dO3hpmJ/oflYUxIPHX1REr
 zXZLz0wcazvhuKWH0BOfWcvYWQfjBTMGTGux/J/bL5dHOYYoOK1n+Y4ZGruEX0FvpLA8bbc0XMK
 KXc8xLK3adXKHeemdBu0m5xZZd6DnLhvT1IkYNP2YqaZpivoIZM72hfU8vpEe4a3D941foHEYId
 8fkMg
X-Google-Smtp-Source: AGHT+IEQibR5xQidIYUwJo3e02nfg8SuAc91PkHN6vP3VoUqrxvmz0rkxCDtnt4Dp/uczZukPl6SmQ==
X-Received: by 2002:a17:90b:3b8d:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-3087bbad9edmr6449614a91.3.1745235412328; 
 Mon, 21 Apr 2025 04:36:52 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 04:36:52 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
Date: Mon, 21 Apr 2025 19:36:35 +0800
Message-Id: <20250421113637.27886-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
index 52028c8f8988..958d260cda8a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1880,6 +1880,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
-- 
2.17.1


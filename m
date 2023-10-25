Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0C7D6E5D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C9210E661;
	Wed, 25 Oct 2023 14:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1691D10E661;
 Wed, 25 Oct 2023 14:05:09 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6b9af7d41d2so4971156b3a.0; 
 Wed, 25 Oct 2023 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698242708; x=1698847508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=QodZ+zOhRS9ysFD14TPJp+ufF/L2P9im5K7i5cATYBY=;
 b=KDGWnrlwEKkWGiUrZn/cEij6dqyLVuuFJXeOkZwmnAw7ApegytL/FYJScH3a2tOwPP
 /uWdmVfM5Z8Ypg2qwpbidXUrjseD/Msp24/fW9FQ1Z/nho48Txstv7egS0a4xzNF/7Lc
 prBQcvPmHWPre0RKnVx4X3oflrxwjFnw8gobIJzQjSICbD1Bw2S949znI/LEo+JEyYx5
 i5PVKL1AOZPxz7KajDrGwXQjL85pfJiYVIxf9z/rUDDqchsJMq2N35r1u5FOgk9VpXWy
 Khb8ylnhu6/mFjXucGj3H5sl9UaZRGqa54ErImG+9ZaplryNHxhe53xIj9MqPEPM7T2E
 yHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698242708; x=1698847508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QodZ+zOhRS9ysFD14TPJp+ufF/L2P9im5K7i5cATYBY=;
 b=rJBeuHbtjsSmnaZWKSrImFLvAjvAYzPIW9WheZ12y7RRGtwy3wqnYkZ0CcloFkMiRU
 TGqNNFbzARsx2WfmBisasu1plBZH3Bp8MeqfxhWBFKkECebdg/ZbauoazzwtWhR98wOA
 PcYmp+C8VPwQASYdNQjfMGLuCM4+A0U2lZGopwhXJg2T09UR499i1+4ATfje/FiIOuZz
 Y3VXEG6z4th5bSTzzTiuTAgplwfF/PGh4SST8L8mSsI96q9bgkC1P6KhrN93Xm9orxxZ
 XuS5UGEDg/PqlGBtAErpNyIZtpRgajuzLAWEvVHoMjyk9nWdhxG+O5zF/Z4+X1PBbjDU
 FKxA==
X-Gm-Message-State: AOJu0YyCMkPVMMmdBKsjIHB849+z9AfyvKemww73263cEZ/CBDuqIqda
 Rn2gu70GzkufxL0FcUh3w6vlF79heCnaP/tm
X-Google-Smtp-Source: AGHT+IHGIX91kg9M698jtU9/okbgfeX+hEAvgOPmIzyzhvaiddrf/3vGC6KhyzP5/E1RDET9W87TAQ==
X-Received: by 2002:a05:6a00:14ce:b0:691:2d4:23a2 with SMTP id
 w14-20020a056a0014ce00b0069102d423a2mr15058971pfu.31.1698242708473; 
 Wed, 25 Oct 2023 07:05:08 -0700 (PDT)
Received: from sagar-virtual-machine.localdomain ([103.70.144.216])
 by smtp.gmail.com with ESMTPSA id
 v124-20020a626182000000b0064fd4a6b306sm9838330pfb.76.2023.10.25.07.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 07:05:08 -0700 (PDT)
From: Sagar Vashnav <sagarvashnav72427@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sagar Vashnav <sagarvashnav72427@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: add kernel docs for
 dc_stream_forward_crc_window
Date: Wed, 25 Oct 2023 10:04:16 -0400
Message-Id: <20231025140419.21180-1-sagarvashnav72427@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Add kernel documentation for the dc_stream_forward_crc_window

Signed-off-by: Sagar Vashnav <sagarvashnav72427@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 1729fb727..5ab35e482 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -528,6 +528,19 @@ dc_stream_forward_dmcu_crc_window(struct dmcu *dmcu,
 		dmcu->funcs->forward_crc_window(dmcu, rect, mux_mapping);
 }
 
+/**
+ * dc_stream_forward_crc_window() - Forward CRC window configuration to DMUB or DMCU.
+ * @stream: The stream state to forward CRC window configuration for.
+ * @rect: Pointer to the rectangle defining the CRC window coordinates.
+ * @is_stop: Flag indicating whether the CRC capture should be stopped.
+
+ * This function is responsible for forwarding the CRC window configuration
+ * for a given stream to either the DMUB or DMCU, depending on their availability.
+
+ * Return:
+ * %true if the CRC window configuration was successfully forwarded;
+ * %false if the stream was not found or CRC forwarding is not supported.
+ */
 bool
 dc_stream_forward_crc_window(struct dc_stream_state *stream,
 		struct rect *rect, bool is_stop)
-- 
2.34.1


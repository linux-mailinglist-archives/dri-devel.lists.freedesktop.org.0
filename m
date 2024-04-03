Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246F896A1C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5DF11290E;
	Wed,  3 Apr 2024 09:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lI49oz/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB4211290C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:11:36 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1e220e40998so35468765ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712135496; x=1712740296; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9hWxdEOmU4e6legIFUkyIF7zkRnOsSH8ACzlOjPdkh8=;
 b=lI49oz/2eK9oMYbQjhgyJ1bndEv/1kkRy9u8fs6a+ezK5GB0522faz9jkuXo3PNt03
 SVlZZgUVsZalGEFE6C/va1MSTRU7T02W7cSucRYrdBmDgWJqb9//dBpNAjUI4+VABojO
 DIFTgUmkJ3lHbWXG7++Ux15x8hLzh5KQwoOzib2JRWZdN8Eu/TygzXaec0hHzGUpK1iE
 G8i9nrPk2UWn7WeLtlh/5NqJpSwFICkAcSyW9GUDtGHqR2Nxk/KTN2Fj7SNsvL8FkUE+
 np/8wC+G1a1oWiSHubcsBO+AEF18BfUVMd+iRhqT+aQ98RueXH8OIiV4czUb0xMMdIGN
 /dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135496; x=1712740296;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9hWxdEOmU4e6legIFUkyIF7zkRnOsSH8ACzlOjPdkh8=;
 b=hL69ids2LdM7oMGdm0KxGcxVQcBV2sQy9FLhvrBvDJRB+2Lie5dGH+N6kETxAhIyr3
 N8gpoJG6q+PQ+/UPxWZXwV5aharj6YFC4jmiv0n+LqvhFf7kBEm8jVm6SbEzMMUNvjN9
 Z/BND21epTMA7qlBOOirnvs2VzDKpXznTy376uxmzFLKe+mP5ToDOS4ZLShWnSXNAgaZ
 9+1um+L5k7L/EIafazDsleWiLSM7kni9qrjawue1TpjwAmnwbaJuxLg+kCUkIGeQFvyE
 Oi1oq7D2xfzTpTtH5sK2yjufCC0aFkg0kJMmBaO8lHHnP5aUv1ItmWRrQSoHfxy7nxgB
 iYHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfYJpU+ddHaouLIM/pc1IEQE+090VTioWbT7rb78sua50vP22eVNzfQR+iYk7xXQXYJctsd/PI/71rYtcw4D47yUMp/lqsWgcjN4Atpc9R
X-Gm-Message-State: AOJu0YyKvdut5aPJQKwBoH0in67Eb1JqUlbIBAzVEmVdqLL0b2z4W61a
 d3Q5YBfFge03C7IiWKk3jIfmAJq9unxFZ/yQ0Ov98XEo04FS4SEM2C6yFxVM1Gk=
X-Google-Smtp-Source: AGHT+IEyWqFwLOjN3DoRlpo+4Cc/2ygcGvENqA9aW1FSgOsYovoVqqyZlsMxzOzAo8DY7Gr1mb6hXA==
X-Received: by 2002:a17:902:ba89:b0:1e0:1bb2:b38f with SMTP id
 k9-20020a170902ba8900b001e01bb2b38fmr1861834pls.59.1712135496335; 
 Wed, 03 Apr 2024 02:11:36 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66]) by smtp.gmail.com with ESMTPSA id
 lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:11:35 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:11:00 +0800
Subject: [PATCH v3 4/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-4-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=1185;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Px8G3VT/pPMatEDJd8W5yLoDD+nxWLUBSZSRl+j+Bac=;
 b=GouXgYabwVWTVj3bHeksyAclYhr+CiBGfhejkhmQ72YqrJmdWZDRL9rczqXKkqVvK6U3n59oc
 Jop7S7F3ONhAPe9XAtU0TkJ5J1p3pJJ6BIpzfOAN3HGhKpSG0lzgNdq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

From: Jonathan Marek <jonathan@marek.ca>

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 80ea4f1d8274..b0507a42ee6a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -886,7 +886,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
+	if (pkt_per_line > 4)
+		drm_warn(msm_host->dev, "pkt_per_line too big");
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;

-- 
2.34.1


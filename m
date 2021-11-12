Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A978C44E1CD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 07:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DF96E990;
	Fri, 12 Nov 2021 06:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAE86E990;
 Fri, 12 Nov 2021 06:17:00 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id h63so351543pgc.12;
 Thu, 11 Nov 2021 22:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTlvF4aJyyBVvpF5MzM91QUQSnsEWekyAttC+hNhxt0=;
 b=EL5+LlxnlvReaYBhiejsr1zFND5Oab45kcPyAjDopD22f7pDXXPd087rMz6BKug2ao
 2h25n6bt0a24gD2a9B0kEbbIDfNp4gNSKx8//L6ONNyicFNpvHbIl5Pv+zgQjm7e+m1i
 rE0OtT0ipEOW5s4IZsayNvkpb3aebdtbeHHWcr/iQcAL5Bu72OazuevJWGGzkWkDZtN3
 1HO/03I5/i/YKp1uu0l2asR+0bexVG4PIcCWc4zR3/Ga9ixF+Dp2Jmo7iZqQxBnM7O8P
 jGkwx5Fi1Dqp4biuQnmBpJXmHh5tsA+SVGPyfIvjUfnr+su/VUfV3wVAib6VpN8bbKWW
 sjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTlvF4aJyyBVvpF5MzM91QUQSnsEWekyAttC+hNhxt0=;
 b=drV9aimd0Go9M7N6NWNtHL4ne3fQWbEdWqlC2KsVs3tiOu0ej7Rb4Cknt2NTbaxY9p
 gqTLdfK5Sj5DvI/+ykE+nA3VDSKv+XFpdvYVnGxClj3oFWvGTuWOSlHuPL1J2yDj6O2Y
 hMf7vPStNu6lkEZXC6syLfJOb46e2fdftXbK1k6jezaYOMZJACqvwKvA4FhUP5gIiVFT
 wy4a+MaFfNVWnWBIuRQiHYG+U3xUtzx7rZHCmltrIz64VyShLqJ5T6AUcyOcm6+ijcul
 nI2ISk8Cy6Enyc/yhLWYAl74aSBTYguHl6o6hVOn09MW1YtXoKLv+xgRHKn/puAN+8i2
 yRLQ==
X-Gm-Message-State: AOAM530bgyjw3HqGM5eRp5vwZw4ajLqo1oVpYdKTRmim1hY4Zhbq+lH+
 VwX/jNuzXTeTVAF348Au4Iw=
X-Google-Smtp-Source: ABdhPJxkOxAft+m9QreNLLuSoiEnM7+2OnxWlWqcVG4wSOaUHimcvgfO1FMGP0U4nwVSfUeIFaVOfw==
X-Received: by 2002:a63:5009:: with SMTP id e9mr2651164pgb.346.1636697820324; 
 Thu, 11 Nov 2021 22:17:00 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id mg12sm9939611pjb.10.2021.11.11.22.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 22:16:59 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To: harry.wentland@amd.com
Subject: [PATCH] drm/amd/display: fix cond_no_effect.cocci warnings
Date: Fri, 12 Nov 2021 06:16:51 +0000
Message-Id: <20211112061651.6509-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Dmytro.Laktyushkin@amd.com, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, airlied@linux.ie, Jerry.Zuo@amd.com,
 vladimir.stempen@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Ye Guojin <ye.guojin@zte.com.cn>, Jun.Lei@amd.com,
 christian.koenig@amd.com, Jimmy.Kizito@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./drivers/gpu/drm/amd/display/dc/core/dc_resource.c, 2516, 7-9, WARNING
possible condition with no effect (if == else)

hdmi_info.bits.YQ0_YQ1 is always YYC_QUANTIZATION_LIMITED_RANGE.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index fabe1b83bd4f..564163a85d2c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -2509,17 +2509,7 @@ static void set_avi_info_frame(
 
 	/* TODO : We should handle YCC quantization */
 	/* but we do not have matrix calculation */
-	if (stream->qy_bit == 1) {
-		if (color_space == COLOR_SPACE_SRGB ||
-			color_space == COLOR_SPACE_2020_RGB_FULLRANGE)
-			hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
-		else if (color_space == COLOR_SPACE_SRGB_LIMITED ||
-					color_space == COLOR_SPACE_2020_RGB_LIMITEDRANGE)
-			hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
-		else
-			hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
-	} else
-		hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
+	hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
 
 	///VIC
 	format = stream->timing.timing_3d_format;
-- 
2.25.1


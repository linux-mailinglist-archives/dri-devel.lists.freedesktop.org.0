Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B88268551
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300AD6E1BD;
	Mon, 14 Sep 2020 07:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FFC6EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 15:11:24 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id g3so8078393qtq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBjsv3xCSYkRCQ+2tezVOSNTy9uWd+LLZWMg/UVRDak=;
 b=rQg0y29QtV3mSmib7w19eLw48nVkkAX9PLuOloEbZY7ZDaNagYLZA+vF2vvqaRk6ru
 likOP/r8d4V9YRT796rlxL5QKHAxpRngBZ5RWoCVzjAf68AE4QIweZL06JHsCj6BuGmj
 DYDcpG4aC1AStU2CeZUDOgjLz9SwAO2vj909DVcIy3LQ97/TYRHP8orLxmiHJZ5DRKBK
 tXbxlhMEFlECVWwKyo3LGK267lO1D8QQO8kFQg4FTTLs+kOhvjiaaz6n9h+3RiFPRH0D
 HCWIyC/gd5X6HUiZyLWPNGlcfXiiDWWO4kpUMFuqkhuORbCfv4ZNXVOiQYe+7iazze9b
 YZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBjsv3xCSYkRCQ+2tezVOSNTy9uWd+LLZWMg/UVRDak=;
 b=nCzrjFSFhZT1zWvpYfyseMf5urtOAszy435LQwMcSiF2WEB4jVYBaN/bGPsAm2gcCs
 jef86xqWUnZF4gKGBLDYJv2UGQma/mt+qNEb2oeRRegtiN1p4YY9ZxYtb/lQx3FHzS74
 W+TEX15F0OBXQedCCbxdXqyTkm8j/VX5gIFXpyLn1if2qMTCXDHTgOaZyOs864HsHIyR
 lurKU8D4Bengz/TuBgzo5KB+2EO9d5fHNkllq3vMcdxs2WF8IujJdi7H99PMv1uya9x6
 VXNjQCXo4guW9K7hkteGFeo0/MfX0vwK/U7Fs3YOggjcMNfMpW7igs7lSeXzy+/BMQuU
 iP4A==
X-Gm-Message-State: AOAM530aRYbJiXGH+/RxysYjXuSOQA3W2RP5/nA1o75jr0oEm2ZpHrNr
 zqRR/JsTNItYuupYB1fctl8HaA==
X-Google-Smtp-Source: ABdhPJx5llxFEeEL0XCkUvdKq1BQKgIPUOoUMkmtSPcsqKUyP1ToDqwIXZ/ZYbtoA2Ey6/hK0GtYcQ==
X-Received: by 2002:ac8:4d05:: with SMTP id w5mr2275918qtv.339.1599837083503; 
 Fri, 11 Sep 2020 08:11:23 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 201sm3216429qkf.103.2020.09.11.08.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 08:11:23 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/3] drm/msm/dsi: remove unused clk_pre/clk_post in
 msm_dsi_dphy_timing
Date: Fri, 11 Sep 2020 11:09:37 -0400
Message-Id: <20200911151001.13156-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911151001.13156-1-jonathan@marek.ca>
References: <20200911151001.13156-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Konrad Dybcio <konradybcio@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clk_pre/clk_post values in shared_timings are used instead, and these
are unused.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index ef8672d7b123..886a9e3b44b5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -50,8 +50,6 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 
 struct msm_dsi_dphy_timing {
-	u32 clk_pre;
-	u32 clk_post;
 	u32 clk_zero;
 	u32 clk_trail;
 	u32 clk_prepare;
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC7C96B48D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E991610E6C9;
	Wed,  4 Sep 2024 08:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="ILQx7ecp";
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="b731fm+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5873B10E190
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
 s=gw2_bookworm; t=1725438678;
 bh=12N3q46XQiecPb2oufmrGICQCBcT5ecdudDGcuTf44E=;
 h=From:To:Cc:Subject:Date:From;
 b=ILQx7ecpTvUCHqc5lj3wAK15OxOUbxTVwjQsW5/97Pl44LokJI8jXjsj80z25OuDF
 iM7OkDO/nDW5vWYHvLDHeKlBrqqRpfxrbKKFel16AoF4nFao+eJTH/td1xUs18+Vg7
 f7UyGD576y/ZkJheLuYv7be4lGBReQQunP6mAdl+v9EqiZnCDRMIwQKLyG3VrZd+W6
 g+eJVyPOCdeVYwqoOsD4MMddFZDpjc3p6Sr54v2ITJ0Xs0lJuODf7hEZkjoB7sTxgn
 awA6LvefK9wo3KQK8arMeelgkhNohKGrb4V7FPBBsA7XnBbXQ0m6bVtSYHizEbLKPd
 NpsY9T02GdHag==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id 005A16BB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 17:31:17 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com; dkim=pass (2048-bit key;
 unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com
 header.a=rsa-sha256 header.s=google header.b=b731fm+4; 
 dkim-atps=neutral
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 7EA7C684
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 17:31:15 +0900 (JST)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-6c8f99fef10so6968395a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atmark-techno.com; s=google; t=1725438674; x=1726043474;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wl5lFlZZmqmzzNDLDZabcElQI0pBWjUywY0vrZnCNgA=;
 b=b731fm+4JCe0OON+QX2RqrV2/21R58eMh+GqX51SxnC5yJQbP+Depdp9u2GAWSgo0M
 dijWYOw/Um9hRlxy64ufWr2E+RkOyYMXT8A3FgToPvXc6v5vTa7g0rKvpPQtZ6zl15l5
 fgB0/AWX3Od4g+2u59TNLt9xWUeO6MPMIytQxouvdUo2wTRhQXku0a4RB76JJER10Yly
 WWaIkqGB+tZkWMXEBxbEzCVWq+WhPn8ub8HynWJXX4OUup8Vq76nZeL9GjgjMxL14Wab
 /awDDaslM1NJ5/f2G7eiVm2rPxrjboAWyZi+vlyyecsExRP0BNpm6c5M9eQotBULqpuI
 TKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725438674; x=1726043474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl5lFlZZmqmzzNDLDZabcElQI0pBWjUywY0vrZnCNgA=;
 b=oM6V7Nyi6g9xEPkjrVaB/BMLH9ib2hmKE6d9d0qKaeSYXA2TltnYaEwDG8oreC0bF9
 4ZoARrn74HQ+rmIIGbAKa1/jbe3Ac9a+NyuypD2faeQq59djaTwMk1T3uS6ie/eg0eMX
 zH8Mstszr5eQeqtCCAXHPNKHlzg0H0Psb5GHaLaD/X0hShIfNAVnccuBDzrx3FdVKKdP
 E5fUw/fSbSrcaR19Rv11oSqnLofRef7/FScewljEvQD5FJXHMcrkvr4NZnDfSuT6pKao
 LiduO8g7dFnewTVrWqWs4FiqTAGJBAWlUhQfNdMqXbuXaxlpKUGYL5vO0N4YxQHIUh6O
 +i8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9BfQl8KlN5gCdAvby7gKmsU7zVbkP9CuWADNNOA6xa8IkZnRYQLDjYJNndQBc5N8KS2A4vmnXoZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQCfq9vU3pcLFVW+x9xTQZ0MsQFInX8srJ5S/6oWQo8NQTllUz
 cAfLWSzxI2B1afDutjcu/Hirvgvgz68qTLh2mYLNGtOAz5qJyTm18aH4ntqVPUVdbwBJlWM1ETh
 sHrbFiEBSfOQrGoG8NBXDJG4gzwH+eOUtPeICZI43TA3i1L6nZY6xBQNW5dj/oTCffeY=
X-Received: by 2002:a17:902:d2d0:b0:205:5544:bad6 with SMTP id
 d9443c01a7336-20584230d75mr94740595ad.55.1725438674419; 
 Wed, 04 Sep 2024 01:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgJbK93rPoTGn7e+5VtWYSo3ES6TsSkat4XXudfYHMjSL/FnAwD5lW7dBeTsvIE7zMeiGN1A==
X-Received: by 2002:a17:902:d2d0:b0:205:5544:bad6 with SMTP id
 d9443c01a7336-20584230d75mr94740425ad.55.1725438674064; 
 Wed, 04 Sep 2024 01:31:14 -0700 (PDT)
Received: from pc-0182.atmarktech (117.209.187.35.bc.googleusercontent.com.
 [35.187.209.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae968f78sm9198335ad.119.2024.09.04.01.31.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2024 01:31:13 -0700 (PDT)
Received: from [::1] (helo=pc-0182.atmark.tech)
 by pc-0182.atmarktech with esmtp (Exim 4.96)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1sllPz-005H8O-2o; Wed, 04 Sep 2024 17:31:11 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Dominique Martinet <dominique.martinet@atmark-techno.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with selected
 clock
Date: Wed,  4 Sep 2024 17:31:01 +0900
Message-Id: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.39.2
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

This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
cannot output the exact frequency, enabling the imx8mp HDMI output to
support more modes

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
This completes the patch series sent by Adam Ford here:
https://lkml.kernel.org/r/20240904023310.163371-1-aford173@gmail.com

and makes the cheap screens we recommend work with our imx8mp board
without further kludging.


 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 13bc570c5473..9431cd5e06c3 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -23,6 +23,7 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 		       const struct drm_display_mode *mode)
 {
 	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
+	long round_rate;
 
 	if (mode->clock < 13500)
 		return MODE_CLOCK_LOW;
@@ -30,8 +31,9 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 	if (mode->clock > 297000)
 		return MODE_CLOCK_HIGH;
 
-	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
-	    mode->clock * 1000)
+	round_rate = clk_round_rate(hdmi->pixclk, mode->clock * 1000);
+	/* accept 0.5% = 1/200 = 5/1000 tolerance */
+	if (abs(round_rate - mode->clock * 1000) > mode->clock * 5)
 		return MODE_CLOCK_RANGE;
 
 	/* We don't support double-clocked and Interlaced modes */
-- 
2.39.2



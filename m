Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679A605456
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 02:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DF810E0A8;
	Thu, 20 Oct 2022 00:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3FF10E058
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 00:04:24 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id g28so18721685pfk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFEAuRVxYze/rS1o+HmtzgS2VnFodVUCCckeeNQBPJo=;
 b=Qaz4H1KwKV2rEH1XylJDVh+Jyd+kjjCT40sHv0yltr24IPXS3A7bCxHahuIbL/aKxK
 HQymcu6lvjyUm4M3opQtknDcwkb3CpXipIAuZsVPTT02+205ImH7Ygnwl0k1o1zk3Lfe
 PIFtNfZeI46Af+097eiyWVE6XVf79YgCLePDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFEAuRVxYze/rS1o+HmtzgS2VnFodVUCCckeeNQBPJo=;
 b=TLx/NyNRqCOZKD0+X0zNcCqtcVEL5fHrCiv9U4WRdn0FNU9nnDMrDrpK3GEYVNjev6
 0SVMi32ziLzFH3f5So2XoISgoAejZ8dV56Vpt3v5nQn1gG8sGgZmZOojXN+uvRCIuyvE
 Vp1NdlaWIRQjPiwCIXCxs0oFjNt3m4HXkILj6yXh0mLQy1jCB92hMM317LvXDfs4HgHt
 1xajrjMAgF6rfzPQ4kBpNIzhkEDSLrheslDCO9xf8BZWduE+XxJhQdlz4Bl4I3L2DZzR
 hxWet+Hbln1LwFfWEcM9RpLBxuPfR+OPnEbGUAqeOOaCfXwJQ92ppQWzbVfPoHau7OHM
 53kA==
X-Gm-Message-State: ACrzQf2lDU8SCW5LU/zc2qQq7E9zv2LULiTYc8sw012/yzoGU//1NOyc
 ugMqo3/VTZmwmWxw9AhNJScCwA==
X-Google-Smtp-Source: AMsMyM4/WuzkNI/KO9rd2JcSdJmmamHNIYsZ7bctseAbBQ/6EBWhOKRYCFsmPMPJl382wA/rvveujQ==
X-Received: by 2002:a63:4426:0:b0:464:4e1d:80e3 with SMTP id
 r38-20020a634426000000b004644e1d80e3mr9460506pga.106.1666224263585; 
 Wed, 19 Oct 2022 17:04:23 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:57b7:1f0e:44d1:f252])
 by smtp.gmail.com with UTF8SMTPSA id
 b11-20020a17090a6acb00b00200a85fa777sm541885pjm.1.2022.10.19.17.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 17:04:23 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 2/2] drm/rockchip: dsi: Force synchronous probe
Date: Wed, 19 Oct 2022 17:03:49 -0700
Message-Id: <20221019170255.2.I6b985b0ca372b7e35c6d9ea970b24bcb262d4fc1@changeid>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221019170255.1.Ia68dfb27b835d31d22bfe23812baf366ee1c6eac@changeid>
References: <20221019170255.1.Ia68dfb27b835d31d22bfe23812baf366ee1c6eac@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Helen Koike <helen.koike@collabora.com>,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can't safely probe a dual-DSI display asynchronously
(driver_async_probe='*' or driver_async_probe='dw-mipi-dsi-rockchip'
cmdline), because dw_mipi_dsi_rockchip_find_second() pokes one DSI
device's drvdata from the other device without any locking.

Request synchronous probe, at least until this driver learns some
appropriate locking for dual-DSI initialization.

Cc: <stable@vger.kernel.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index d222c6811207..528ddce144e5 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1689,5 +1689,11 @@ struct platform_driver dw_mipi_dsi_rockchip_driver = {
 		.of_match_table = dw_mipi_dsi_rockchip_dt_ids,
 		.pm	= &dw_mipi_dsi_rockchip_pm_ops,
 		.name	= "dw-mipi-dsi-rockchip",
+		/*
+		 * For dual-DSI display, one DSI pokes at the other DSI's
+		 * drvdata in dw_mipi_dsi_rockchip_find_second(). This is not
+		 * safe for asynchronous probe.
+		 */
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 };
-- 
2.38.0.413.g74048e4d9e-goog


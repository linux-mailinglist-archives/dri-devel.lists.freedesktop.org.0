Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CEB1C8311
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70886E92A;
	Thu,  7 May 2020 07:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71E96E040
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 03:10:18 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id CE1361A2E1E;
 Thu,  7 May 2020 11:09:43 +0800 (CST)
Message-ID: <ABMAdgC5CDjCyrCBmyLV44rX.3.1588820983821.Hmail.bernard@vivo.com>
To: Bernard Zhao <bernard@vivo.com>
Subject: =?UTF-8?B?UmU6W1BBVENIXSBkcm0vZXh5bm9zOiBtYWtlIHBvaW50ZXIgdG8gY29uc3QgZGF0YSBjb25zdCB0eXBl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.122
In-Reply-To: <20200426090142.21251-1-bernard@vivo.com>
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.122) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 7 May 2020 11:09:43 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Thu, 7 May 2020 11:09:43 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VNSUNCQkJMSktLQ0hLSllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhMT09DSE9LSE1ON1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6OTY6Hxw4Tjg*ETgCCTg5FgI3LU9PCSNVSFVKTkNDQ0lLQkNOQkpMVTMWGhIXVRkeCRUaCR87
 DRINFFUYFBZFWVdZEgtZQVlKTkxVS1VISlVKSUlZV1kIAVlBTklLSDcG
X-HM-Tid: 0a71ed1c403493b4kuwsce1361a2e1e
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: opensource.kernel@vivo.com, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


From: Bernard Zhao <bernard@vivo.com>
Date: 2020-04-26 17:01:42
To:  Inki Dae <inki.dae@samsung.com>,Joonyoung Shim <jy0922.shim@samsung.com>,Seung-Woo Kim <sw0312.kim@samsung.com>,Kyungmin Park <kyungmin.park@samsung.com>,David Airlie <airlied@linux.ie>,Daniel Vetter <daniel@ffwll.ch>,Kukjin Kim <kgene@kernel.org>,Krzysztof Kozlowski <krzk@kernel.org>,dri-devel@lists.freedesktop.org,linux-arm-kernel@lists.infradead.org,linux-samsung-soc@vger.kernel.org,linux-kernel@vger.kernel.org
Cc:  opensource.kernel@vivo.com,Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] drm/exynos: make pointer to const data const type>Maybe keep pointer which points to global const string data
>in const type is better, make sure not change const data.
>
>Signed-off-by: Bernard Zhao <bernard@vivo.com>
>---
> drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
> drivers/gpu/drm/exynos/exynos_drm_mic.c | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>index e080aa92338c..f60d99c85ac9 100644
>--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>@@ -211,7 +211,7 @@
> 
> #define OLD_SCLK_MIPI_CLK_NAME "pll_clk"
> 
>-static char *clk_names[5] = { "bus_clk", "sclk_mipi",
>+static const char *const clk_names[5] = { "bus_clk", "sclk_mipi",
> 	"phyclk_mipidphy0_bitclkdiv8", "phyclk_mipidphy0_rxclkesc0",
> 	"sclk_rgb_vclk_to_dsim0" };
> 
>diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>index f41d75923557..a86abc173605 100644
>--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
>+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>@@ -88,7 +88,7 @@
> 
> #define MIC_BS_SIZE_2D(x)	((x) & 0x3fff)
> 
>-static char *clk_names[] = { "pclk_mic0", "sclk_rgb_vclk_to_mic0" };
>+static const char *const clk_names[] = { "pclk_mic0", "sclk_rgb_vclk_to_mic0" };
> #define NUM_CLKS		ARRAY_SIZE(clk_names)
> static DEFINE_MUTEX(mic_mutex);
> 
>-- 
>2.26.2
>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

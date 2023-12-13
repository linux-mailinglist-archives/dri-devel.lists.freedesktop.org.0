Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6EE811B7B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 18:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69AF10E7C8;
	Wed, 13 Dec 2023 17:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BF710E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 17:44:26 +0000 (UTC)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rDTH9-0001l6-L8; Wed, 13 Dec 2023 18:44:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mripard@kernel.org, airlied@gmail.com,
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 maarten.lankhorst@linux.intel.com, neil.armstrong@linaro.org,
 sam@ravnborg.org, quentin.schulz@theobroma-systems.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w
Date: Wed, 13 Dec 2023 18:44:01 +0100
Message-Id: <170248942758.833086.13775590933211922845.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213145045.41020-1-farouk.bouabid@theobroma-systems.com>
References: <20231213145045.41020-1-farouk.bouabid@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 15:50:45 +0100, Farouk Bouabid wrote:
> The ltk050h3148w variant expects the horizontal component lane byte clock
> cycle(lbcc) to be calculated using lane_mbps (burst mode) instead of the
> pixel clock.
> Using the pixel clock rate by default for this calculation was introduced
> in commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
> rate to calculate lbcc") and starting from commit 93e82bb4de01
> ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode")
> only panels that support burst mode can keep using the lane_mbps. So add
> MIPI_DSI_MODE_VIDEO_BURST as part of the mode_flags for the dsi host.
> 
> [...]

Applied, thanks!

[1/1] drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w
      commit: 6c9dbee84cd005bed5f9d07b3a2797ae6414b435

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

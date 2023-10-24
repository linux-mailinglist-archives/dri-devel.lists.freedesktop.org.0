Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DE7D5BC8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E735410E4A9;
	Tue, 24 Oct 2023 19:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1714410E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:48:34 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qvNO9-0007MI-NB; Tue, 24 Oct 2023 21:48:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc
 for burst mode
Date: Tue, 24 Oct 2023 21:48:27 +0200
Message-Id: <169817682318.1800793.9582898755540377967.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018035212.1778767-1-victor.liu@nxp.com>
References: <20231018035212.1778767-1-victor.liu@nxp.com>
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 raphael.gallais-pou@foss.st.com, yannick.fertre@foss.st.com, jonas@kwiboo.se,
 hjc@rock-chips.com, jernej.skrabec@gmail.com, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, zyw@rock-chips.com,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023 11:52:12 +0800, Liu Ying wrote:
> In order to support burst mode, vendor drivers set lane_mbps higher than
> bandwidth through DPI interface.  So, calculate horizontal component lane
> byte clock cycle(lbcc) based on lane_mbps instead of pixel clock rate for
> burst mode.
> 
> 

Applied, thanks!

[1/1] drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode
      commit: 93e82bb4de0196c4caeca1d8a6eef67863981d8f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

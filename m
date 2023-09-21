Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805997A9537
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0EE10E5CA;
	Thu, 21 Sep 2023 14:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73B910E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:29:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7EC6609E9;
 Thu, 21 Sep 2023 14:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2B1C4E766;
 Thu, 21 Sep 2023 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695306555;
 bh=VLihWTTWDyRcN1oKbSXsMzwTgw3e5f2Nt4JgNqgjmHc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SuLiY+Tf7wIE6HHdVRCxC/G1lDF/gX0c75BgE/AgAsn5nX2ZKPM3+Z++XNKC0svQJ
 HfQbsEaMJh+rA+a0YH4xaqhnT4kOef4nrv9ecIYbjV+CSIDgJFM8q32cIE3Mbhtiev
 f7dSWqUSt5OMbhSWI5Qae26S0NKOij9BSt1wBncwhEOVT3aA8hiWtoi7PrI/fVPcBF
 cJowBwpV6q+fia1qTvE+4vML1ae0iosmzIw0YzMB9KxyO/z2rNAaZGBKQMMkRKEX14
 bbqPeBFnkK0n8n3GPrVtOYfDpo3kEioTgoddzPejSuiASIRvVansYwxQXue70uQcOr
 QbqdeBZ2sIQOw==
From: Vinod Koul <vkoul@kernel.org>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Robert Foss <rfoss@kernel.org>, Sandor Yu <Sandor.yu@nxp.com>
In-Reply-To: <cover.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
Subject: Re: [PATCH v6 0/8] Initial support for Cadence MHDP8501(HDMI/DP)
 for i.MX8MQ
Message-Id: <169530654998.106263.143064512083801166.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 16:29:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: oliver.brown@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 15 Jun 2023 09:38:10 +0800, Sandor Yu wrote:
> The patch set initial support for Cadence MHDP8501(HDMI/DP) DRM bridge
> drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.
> 
> The patch set compose of DRM bridge drivers and PHY drivers.
> 
> Both of them need the followed two patches to pass build.
>   drm: bridge: Cadence: convert mailbox functions to macro functions
>   phy: Add HDMI configuration options
> 
> [...]

Applied, thanks!

[1/8] drm: bridge: Cadence: convert mailbox functions to macro functions
      (no commit info)
[2/8] dt-bindings: display: bridge: Add Cadence MHDP8501 HDMI and DP
      (no commit info)
[3/8] drm: bridge: Cadence: Add MHDP8501 DP driver
      (no commit info)
[4/8] phy: Add HDMI configuration options
      commit: 7f90516edb5cbfa4108b92bb83cbc8ef35a4cccd
[5/8] drm: bridge: Cadence: Add MHDP8501 HDMI driver
      (no commit info)
[6/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
      (no commit info)
[7/8] phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
      commit: a2717f1d7c64660679441c407b96103abb7c4a8c
[8/8] phy: freescale: Add HDMI PHY driver for i.MX8MQ
      commit: 8e36091a94d2d28e8dccb9bfda081b2e42e951ae

Best regards,
-- 
~Vinod



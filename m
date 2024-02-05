Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC784A391
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 20:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB1610FC0C;
	Mon,  5 Feb 2024 19:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gO2BZ96L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DD910FC09
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 19:23:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4032E6126B;
 Mon,  5 Feb 2024 19:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402F7C433C7;
 Mon,  5 Feb 2024 19:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707160984;
 bh=631bnoI95/4RxTtmJPA8muY0K1qwK11eTM0Wq4Qeiqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gO2BZ96L12Ko4SirbE6I+iube4OZRYzWisRTKnxXc4PMSk7O3zZe7IXUiIF1IsTLv
 7Z1dKJffUXWX2Vy4QzfB6mnlry1P2TO/W0wpjluAPpf5Y01JhVRiW8Gd2BC94wD4Ol
 dTARJ+2AOtehctbstCm3ujDaljymGGc/sIKFQ4GyrN0nWPxXuf4+LmOKtmMHubfw1h
 cnr2b67n44ONH1ChKtUuLEeD2iwDoWLF9Qb/zy/kCqk7jff4M9tRAEpIaXkLpnJjTF
 caftyFybrPV4vFLKiy9KgKXDkMTqB7QX1jyzrQ52bjnHt1NrYTDMN2jkdVgSbnSMrQ
 Qs4CLr2BXwz5A==
Date: Mon, 5 Feb 2024 19:23:01 +0000
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Robert Foss <rfoss@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 alexander.stein@ew.tq-group.com, dri-devel@lists.freedesktop.org,
 Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Will Deacon <will@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 marex@denx.de, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-phy@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, frieder.schrempf@kontron.de
Subject: Re: [PATCH V8 09/12] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
Message-ID: <170716098090.168745.4661359468123158581.robh@kernel.org>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-10-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240203165307.7806-10-aford173@gmail.com>
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


On Sat, 03 Feb 2024 10:52:49 -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> ---
> V3:  Change name and location to better idenfity as a bridge and
>      HDMI 2.0a transmitter
> 
>      Fix typos and feedback from Rob and added ports.
> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


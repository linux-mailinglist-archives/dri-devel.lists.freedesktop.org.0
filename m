Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D5A42DDD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868CF10E3E5;
	Mon, 24 Feb 2025 20:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L2UKt4dp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0ED10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:32:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EB96961207;
 Mon, 24 Feb 2025 20:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E19CC4CEE7;
 Mon, 24 Feb 2025 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740429151;
 bh=7Eyqt9Yi27fAwHev0xOEgY0/gsh0CaOyA02i4c7f+q4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L2UKt4dp2RNeu+KYdq+fQJdJTheZkYadYmOtIHueFj0GXVQuUlJv4EHvzrmv1Wf10
 ehwrZ9x3s5b+7d6WxmzWMMg4j7Mgx9B9gfB/rtJEyp3vt7HH7+VU9jA2JVRSrwaJhf
 xxzyDLlq5YZuzNCMthRET42kiJ6+hBHE0RvI+8YbDuoPz9OMTV0Is8E7fEyivjAp1v
 U3itUCvauiJdIBnxgRQdJ5NycxTs/JKlte2vxWxIRwy9wZNevC7mrgPrf/9rc6xNPu
 R22YZEkaXTAxNvTAEwTXVP2cAiV1pS/dHyR/D4yexI9v7LbZExCZvRQW3haj68/BsV
 h8AB6Gc0w+vDA==
Date: Mon, 24 Feb 2025 14:32:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Fabio Estevam <festevam@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] dt-bindings: display: simple: Add BOE AV123Z7M-N17
 panel
Message-ID: <174042914940.4047956.6244302350129117835.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-2-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-2-5ccbbf613543@gocontroll.com>
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


On Mon, 24 Feb 2025 14:50:52 +0100, Maud Spierings wrote:
> Add support for the BOE AV123Z7M-N17 12.3" LVDS panel.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


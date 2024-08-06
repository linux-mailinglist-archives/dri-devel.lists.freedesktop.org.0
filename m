Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBB949414
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 17:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1CC10E39D;
	Tue,  6 Aug 2024 15:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OZ7nkTR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCB410E39D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 15:03:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D861460FC8;
 Tue,  6 Aug 2024 15:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FF1C32786;
 Tue,  6 Aug 2024 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722956594;
 bh=ENTNJkyPlX89nL5MNOvYxxCBQ8yDP7ZF+BIfObGAZJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OZ7nkTR/4S5vElHLQ4hagaQV5113Lj3/gxJf2sgfoCRIhDuvpx2sW4XfwocCTU028
 3pS3UkXr2phokFRO6KYCDzqkbG8qUxNNTNnbKtvNOEmEVG5F6WIariMFCqd1WLgrll
 6yCTmndIVGf7YK29VqmU9DmfEpTGJmVO8vpjIxqKFoLtPNM4UV/kLOpuv8xChNrPcV
 poYnq9PVgo5GOhCc/UyglRYlVtps1SHEdEadmfVcmXDWyeCgVH4zyyyNgcb06U/Iiu
 YVaN1EOhJDQMTIjYTGibWNU31fLvkX5SrYmf+2YIZS/N48+yhm1d3u6QQJcxplti2r
 l5uaqrKXrnqbw==
Date: Tue, 6 Aug 2024 09:03:13 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <20240806150313.GA1516901-robh@kernel.org>
References: <20240730-tdp158-v4-0-da69001bdea2@freebox.fr>
 <20240730-tdp158-v4-1-da69001bdea2@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-tdp158-v4-1-da69001bdea2@freebox.fr>
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

On Tue, Jul 30, 2024 at 05:01:31PM +0200, Marc Gonzalez wrote:
> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> It supports 4 TMDS channels, HPD, and a DDC interface.
> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> for power reduction. Several methods of power management are
> implemented to reduce overall power consumption.
> It supports fixed receiver EQ gain using I2C or pin strap to
> compensate for different lengths input cable or board traces.
> 
> Features
> 
> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> data rate, compatible with HDMI 2.0b electrical parameters
> - DisplayPort dual-mode standard version 1.1
> - Programmable fixed receiver equalizer up to 15.5dB
> - Global or independent high speed lane control, pre-emphasis
> and transmit swing, and slew rate control
> - I2C or pin strap programmable
> - Configurable as a DisplayPort redriver through I2C
> - Full lane swap on main lanes
> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> 
> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> 
> Like the TFP410, the TDP158 can be set up in 2 different ways:
> 1) hard-coding its configuration settings using pin-strapping resistors
> 2) placing it on an I2C bus, and defer set-up until run-time
> 
> The mode is selected via pin 8 = I2C_EN
> I2C_EN high = I2C Control Mode
> I2C_EN low  = Pin Strap Mode
> 
> On our board, I2C_EN is pulled high.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  .../bindings/display/bridge/ti,tdp158.yaml         | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> new file mode 100644
> index 0000000000000..fe3de1534efc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0-only

For new bindings: GPL-2.0-only OR BSD-2-Clause

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

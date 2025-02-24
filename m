Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B381A42E31
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8081B10E35D;
	Mon, 24 Feb 2025 20:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mwWbpNhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2463510E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:44:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 29099611F7;
 Mon, 24 Feb 2025 20:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165DC4CED6;
 Mon, 24 Feb 2025 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740429870;
 bh=6ZQ2uzFiFhD7gkzk+n7hLxToXvw9f/qLjNwvw3IN058=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mwWbpNhCqwW2+IaFJM8s1EadrnggVS8HGVSkSAatxVKhTW1CDmZCPuIV58P2ejefE
 9fFCKKpdviw7OhuqtW474AqL9TJoMz+idxN5Dg1PXNJ2HAJs/aJP2T2Com9JjsU/WN
 ccOvcuOl8SzV1MhWguZaOXc2gHGBy2MZfmB8pjl0yWZLUKRgLpAgoxCgkJBeAPKcV/
 6Mkkpf0jw2ofTdTGrB+rw6+cpM20zOg8/7qHNCeg+WOYOaTA1nymb9+I6nhpR0oc/f
 UM9JJvk16LHop1JdTSdslzTFJrIcugsdLECkKsvah8C1ZpSmpEWHx+fpN/InM+TFRx
 2YaKffluH7H3w==
Date: Mon, 24 Feb 2025 14:44:28 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Message-ID: <20250224204428.GA4050751-robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
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

On Mon, Feb 24, 2025 at 02:50:55PM +0100, Maud Spierings wrote:
> The main point of the Moduline series of embedded controllers is its
> ecosystem of IO modules, these currently are operated through the spidev
> interface. Ideally there will be a full dedicated driver in the future.
> 
> Add the gocontroll moduline-module-slot device to enable the required
> spidev interface.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc615c7fb46f771a300926f05 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -107,6 +107,8 @@ properties:
>            - fsl,mpl3115
>              # MPR121: Proximity Capacitive Touch Sensor Controller
>            - fsl,mpr121
> +            # GOcontroll Moduline module slot for spi based IO modules

I couldn't find anything about SPI for GOcontroll Moduline. Can you 
point me to what this hardware looks like. Based on what I did find, 
this seems incomplete and not likely a trivial device.

> +          - gocontroll,moduline-module-slot
>              # Honeywell Humidicon HIH-6130 humidity/temperature sensor
>            - honeywell,hi6130
>              # IBM Common Form Factor Power Supply Versions (all versions)
> 
> -- 
> 2.48.1
> 

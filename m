Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0571A85C32
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 13:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE62B10E0A8;
	Fri, 11 Apr 2025 11:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="igkt2VE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B110E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 11:49:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 264894A4E8;
 Fri, 11 Apr 2025 11:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E00C4CEE2;
 Fri, 11 Apr 2025 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744372186;
 bh=Y1jBqB8SPrhS4Y4w/rmv4NVxsWmmjHCT1zX7FJlSn8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=igkt2VE8p0udba4TvCkKsv0xiU0tUm3e5M/XGbSLrV7UD28g8nyd/6e7DKEwO3uVf
 1W9Z/VWJtH7C0QwvrphmcMBlMMUBzzsI8McD/PqLgPl0bytGjyx42SbTr6UaIJFVQt
 GZba/dgqwKgfGTKYKPBPgVmcs7TylcG9zE8Z07tDC061yVazw8szAHVGUaEnD82hMl
 WTJ/jmNJ/TsuHp1lvKcryh6e2YVBaQXjLrRxmL0aCG7A282RDNYQCc22L66GOI+7i3
 hn/dLsMYdhbolbmFC/lJpD+f6mzn1+LbXHIKehBxRXjrByQ0JQzRhfk7Hcr13ZMJ7K
 zh7nKFoWiPZ6g==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1u3CtK-000000000on-156V;
 Fri, 11 Apr 2025 13:49:51 +0200
Date: Fri, 11 Apr 2025 13:49:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
Message-ID: <Z_kB3jOH04-zFnym@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
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

On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
> Add edp_hpd_active pinctrl to the X1E80100 device tree.

Please squash this one with the patch adding the user.
 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -6389,6 +6389,11 @@ data-pins {
>  					bias-pull-up;
>  				};
>  			};
> +
> +			edp_hpd_active: edp-hpd-active-state {

Please keep the nodes sorted by name.

> +				pins = "gpio119";
> +				function = "edp_hot";

There is no "edp_hot" function on x1e so I wonder how this has been
tested.

As I mentioned in a comment to an earlier revision this pin has been
configured by the firmware as "edp0_hot".

Since there is also an "edp1_hot" pin, this needs to be reflected in the
node name and label.

Pin configurations really do belong in board files, but unfortunately
this was not followed for x1e. You should still include the bias
configuration (somewhere).

> +			};
>  		};
>  
>  		stm@10002000 {

Johan

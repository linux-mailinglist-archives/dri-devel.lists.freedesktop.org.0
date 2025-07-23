Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38EB0EBF1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D859C10E766;
	Wed, 23 Jul 2025 07:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nvSDty53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0974610E766
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:32:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49AB3A55D0D;
 Wed, 23 Jul 2025 07:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C844CC4CEFB;
 Wed, 23 Jul 2025 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753255918;
 bh=/QBxlH5zQrdTKHeyh1iGe7dLjZTdGC5Aeaobly9L2QU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nvSDty53hPukhZjxVudDihFZMxMriSEyT4HyGfP2MoxKHuFW9YUCOTXBbIdAo87oD
 w8dBRgA/gkGnu6MUyvmStlhdQB2wmAwBVFq188hHHRtvQFg5AYEcNcKy0H6xGDgDbY
 f8VbuwXvIIKhdcUKa9rKAFYIccGUzt/CS2c1CDUhYtpKBzmaVLE5xycAmDDBBXTm+9
 NyOQacP57fboxfeXojJVdZUKbL8I9KwK+ohJl/0Tz3eAGrUbcOTipniK076iiNHcAU
 5AeLFubD7Rop0sHqdOf7kxhSYACixY5ijEk6Yizy18IgyPija/aWeQkBD38C05CLJb
 U1MVZ8SlH3AWw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1ueTx8-000000002OG-1g36;
 Wed, 23 Jul 2025 09:31:50 +0200
Date: Wed, 23 Jul 2025 09:31:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
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
Message-ID: <aICP5pE6oXFIxHVk@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
 <Z_kB3jOH04-zFnym@hovoldconsulting.com>
 <bc65cf3e-22ca-4383-bf7a-24a3d343eb26@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc65cf3e-22ca-4383-bf7a-24a3d343eb26@linaro.org>
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

On Wed, Jul 23, 2025 at 09:03:40AM +0200, Neil Armstrong wrote:
> On 11/04/2025 13:49, Johan Hovold wrote:
> > On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
> >> Add edp_hpd_active pinctrl to the X1E80100 device tree.
> > 
> > Please squash this one with the patch adding the user.
> >   
> >> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
> >> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> @@ -6389,6 +6389,11 @@ data-pins {
> >>   					bias-pull-up;
> >>   				};
> >>   			};
> >> +
> >> +			edp_hpd_active: edp-hpd-active-state {
> > 
> > Please keep the nodes sorted by name.
> > 
> >> +				pins = "gpio119";
> >> +				function = "edp_hot";
> > 
> > There is no "edp_hot" function on x1e so I wonder how this has been
> > tested.
> > 
> > As I mentioned in a comment to an earlier revision this pin has been
> > configured by the firmware as "edp0_hot".
> 
> With edp_hot, screen stays black with UI comes up, with edp0_hot it works again.

Right.

> > Since there is also an "edp1_hot" pin, this needs to be reflected in the
> > node name and label.
> > 
> > Pin configurations really do belong in board files, but unfortunately
> > this was not followed for x1e. You should still include the bias
> > configuration (somewhere).
> 
> Which bias ? do this pin config needs an additional bias config ?

The boot firmware has disabled the bias, but we should not rely on the
firmware to have configured the pin for us.

Johan

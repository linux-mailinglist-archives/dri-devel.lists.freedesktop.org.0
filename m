Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507E9B1A2EE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 15:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5783510E206;
	Mon,  4 Aug 2025 13:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ALoa95xa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E06310E206
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 13:13:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D39FA43A02;
 Mon,  4 Aug 2025 13:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D07C4CEE7;
 Mon,  4 Aug 2025 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754313222;
 bh=7Itrb6NEFY8xjNQ5bH8OXupD/fdEaQZR/qQ3r+WdZfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ALoa95xauUk/mee8ff2RmYMAVYexzy6G8PZnfqDpANL/9DlaCdUiCmP0gBdySDRjX
 mvT8TnxES3p+C0TokDGLGw3E3SF3ZqntFjv3JpmeBw5Vy51FqMBq12MGqBl2bH9Ezs
 PPNeVnJ4JVLEEyVGged5Y/3nzG/6MAnnUTGuWpXniW6cjfNhuFFj3Ets1z3zt6m6Dk
 GfKAbOBw9NhCxk6yS8edxjrZZH8cDr7zH8i6LhIEKL9gUlRXD+e7av0P7rRrvPkPij
 cM/fUPQPElSSz5zmt7JHzC29QdDbVdoH3Ts6badRb+4l8xn+BMSzmcXDXIikeeohiR
 P7Kc9hZU0P43w==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1uiv0X-000000000nL-1h82;
 Mon, 04 Aug 2025 15:13:42 +0200
Date: Mon, 4 Aug 2025 15:13:41 +0200
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
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
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

On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
> The eDP controller has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO is used in both the
> OLED and LCD models which inherit this device tree.

> @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges = <&tlmm 0 0 239>;
>  			wakeup-parent = <&pdc>;
>  
> +			edp_hpd_active: edp-hpd-active-state {

The node name and label needs an index as this SoC has two edp hpd pins
as I already pointed out.

> +				pins = "gpio119";
> +				function = "edp0_hot";

And you also need to configure the bias somewhere as you should not rely
on the firmware having configured things for you (as I also pointed out
before).

On my T14s the internal pull-up has been disabled.

> +			};

Johan

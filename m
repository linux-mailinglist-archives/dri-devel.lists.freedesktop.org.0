Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14EF65AE14
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 09:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC98310E18A;
	Mon,  2 Jan 2023 08:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28FE10E18A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 08:27:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76046B80C80;
 Mon,  2 Jan 2023 08:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3885FC433D2;
 Mon,  2 Jan 2023 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672648027;
 bh=xdXxYKAZd6QpjVcR1FSXry2pfitKPL1S0xMqTVjvgYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J9rZjoqEY/mWaZlK+30DxUhWhMtOstiVyX0Tt8wR9hx0C5EO+MULPikbUf7JSdTLG
 H6uTjLaxtJvyzXKpteYoK/F64XQgP+w98BFmm6ubbbXjGr2hit3tNmw+17pB0uF6Ru
 q8BwtYTAeDy4Vo90x+eHJhctCxRHZ00ghXbBxUDTyuFwhGCxM9PBhXVeyryzxDUmlA
 c7yVwp59BoYgqGimQp26Iiig/ABaYN8DOxhflbTmjW4PYG6Fxjnwskg1Q0vG2C7sgw
 PpqyG70aLK/DeGrkHC/Bbj2xfjYZ33tjt2R8+cUanxHwbkghms+kRyF/Q7g2vw/W9v
 9pkBH1onRaXXw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pCGAE-0003LC-SU; Mon, 02 Jan 2023 09:27:23 +0100
Date: Mon, 2 Jan 2023 09:27:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel-edp: add IVO M133NW4J panel entry
Message-ID: <Y7KVamauvz44UB/o@hovoldconsulting.com>
References: <20221231142721.338643-1-abel.vesa@linaro.org>
 <20221231142721.338643-2-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231142721.338643-2-abel.vesa@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 31, 2022 at 04:27:21PM +0200, Abel Vesa wrote:
> Add an eDP panel entry for IVO M133NW4J.
> 
> Due to lack of documentation, use the delay_200_500_p2e100 timings like
> some other IVO entries for now.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 
> Assuming the information from here is correct:
> https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md
 
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index ef70928c3ccb..bef5cdf6a582 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1891,6 +1891,7 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
>  
>  	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
> +	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "M133NW4J"),
>  	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
>  
>  	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),

Can you also check the edid data for the string in case there's been
some mixup? For example,

	# strings /sys/class/drm/card0-eDP-1/edid
	...
	B133UAN02.1

Johan

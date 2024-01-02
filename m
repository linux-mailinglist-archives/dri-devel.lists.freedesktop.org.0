Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2948B822239
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 20:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AED10E008;
	Tue,  2 Jan 2024 19:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jan 2024 19:09:31 UTC
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [IPv6:2001:41d0:203:375::aa])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208810E13C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 19:09:31 +0000 (UTC)
Date: Tue, 2 Jan 2024 20:00:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1704222035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mwds48W+uJe8Gd27h04WTqGUpgnvUXE+fjmem6lYAIc=;
 b=ZJazA1ZUjzhiIVOoE+8pTI06pd63mmujMW2bwuVQG7tbVARXW34rYlgc74XIvED+6dJXH3
 ViNQIr1Kdt5T2zfYPYOiCb95Q9dnaQjQ68GSQFWvwr527nfSDmo/a8Lqt+Kjsz0AuuFh3r
 OwJFKpqlwjZndyeH2fbol0Y0Upa/7c8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: samsung-s6d7aa0: drop
 DRM_BUS_FLAG_DE_HIGH for lsl080al02
Message-ID: <20240102190029.GA89325@grimlerstat.localdomain>
References: <20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com>
 <20240101-tab3-display-fixes-v1-2-887ba4dbd16b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240101-tab3-display-fixes-v1-2-887ba4dbd16b@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 02 Jan 2024 19:44:01 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artur,

On Mon, Jan 01, 2024 at 10:00:16PM +0100, Artur Weber wrote:
> It turns out that I had misconfigured the device I was using the panel
> with; the bus data polarity is not high for this panel, I had to change
> the config on the display controller's side.
> 
> Fix the panel config to properly reflect its accurate settings.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

I guess it deserves a Fixes tag:
Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")

Best regards,
Henrik Grimler

> ---
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index ea5a85779382..f23d8832a1ad 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
>  	.off_func = s6d7aa0_lsl080al02_off,
>  	.drm_mode = &s6d7aa0_lsl080al02_mode,
>  	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.bus_flags = 0,
>  
>  	.has_backlight = false,
>  	.use_passwd3 = false,
> 
> -- 
> 2.43.0
> 
> 

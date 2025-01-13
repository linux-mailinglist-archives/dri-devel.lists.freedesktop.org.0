Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44422A0C38F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 22:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5510E7D0;
	Mon, 13 Jan 2025 21:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I/bSd0/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F0710E7D0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 21:21:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5401c52000fso4060862e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736803210; x=1737408010; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ex/N+A8TE0rVtTf4oLEMfavqRK5XwiOtT6Gdk+tgQgc=;
 b=I/bSd0/bHpnJ6+xgupDBPh8AtVNP7INACTfk4JBSVq2a+ywveUGnuYY4zPWPqr1hV1
 Raqj1I+rnZ64Q6VfZlVK5C4fRvhtqvuYFC4zS4ewaq7Vcl4e8E5qEjsrF8IXJj9JYAPA
 4EZXCs7nI8OJ7PUM7g3HjQEKzeR2zY+ROrlGvfa618pPbkGmc884Q4gjH6rwbzeQJ2vG
 08UTF8Z/FbJ3OtjW8gmMVSqM+Z/ZkPapXVf3Bu2j/1YpuR94fPavCp3tVsqzXTu28Lwk
 c7ur3SPtGvInEPUUzJsfJxGAZVGo+DZRrrHocMF/PO5GKvf0Jm/I3Ipx4gRAqh7h7iBO
 h1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736803210; x=1737408010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ex/N+A8TE0rVtTf4oLEMfavqRK5XwiOtT6Gdk+tgQgc=;
 b=DvY7yFiy+MtvO3gEkisvDUILKtdmWk+Dge472EpkwgZRFD4ufv8BzqVkOfG3ltEjJW
 8JwczJ72vXr++CKcH5LBRPsUrRw/7tK2uTYyLXkNG5Tn1RYQcaQsbVaOAHHQ66GgZvxR
 NkafpDoaUPErYU3iikprzVn0yb1yEAPoDZLBn07MWZSuX5PpwSvJ8fYu9GU/MpUwgPC7
 RP2azuG3jUCuE971YPvlS5ZNgxpUG0ws3l3w0XJyETTA18cM+zgh9JTkIjbrJtt6a6Jv
 LW4C1iTjphj5VAELHEom1ThGqxIQz+OOAV/U8zXiUtyoHCywk0duB98UCVyj2HP7qDnx
 IOEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrgyMMg+/3gR14rUvyQmhVpwTKk4R6BmaPQndSHboFTYAgprwmXwfHNp1B6mIz8MPt3IlE+aQv7+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl0zQnfQdOA90bwXM3sdM118kaOfyqQGGLqb75FVQur8G0J4Ja
 qwjGIB14gat8vfy/iAmhJeFWea0q/fAllM8tXzWcvFWUGNNP9flHDkA6z+DRmn8=
X-Gm-Gg: ASbGncuG1steTzD/FdxG9yO/MCUfksDan0+lPs/P1dHrTfAR09FyXUa1maohp8wF4N6
 Md3Es5HDuXq3bjIEDykImI5fKj4GM3zMcdmmto34FTG/gDRUr+gT5jw0EIMkdcG5sm0uMH8YzQ7
 lzOvDWiYOpQQFdRnFWZ/P2tnEspeM5wh1zacfTGiOzyUsiWPlvTf2SV3nfCCl6KPU7UAFVxx4Po
 OCf6BsjJzz2jUm0SYCe1Js8+taPiRmQsX68lqSJDwhYpSSyZs9VRv+xjOpB8wMBgkpuliMFq7Oy
 1Elov9zYTllLOGJ3SSOcrnnhT5SvDE9lN/aJ
X-Google-Smtp-Source: AGHT+IFM0q5YT+lkYOXNZ8RCxceT74oC4eO/zNqvfxZeawUDOMC24AW4RgxFVCzMsA7HFvJbHE994w==
X-Received: by 2002:a05:6512:10c9:b0:540:2257:22ab with SMTP id
 2adb3069b0e04-542845d7fd0mr6626790e87.27.1736803209434; 
 Mon, 13 Jan 2025 13:20:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec2157sm1444012e87.213.2025.01.13.13.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 13:20:08 -0800 (PST)
Date: Mon, 13 Jan 2025 23:20:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/12] drm/bridge: cdns-dsi: Fix the clock variable
 for mode_valid()
Message-ID: <haqi67z7i6lleb3i7b2ksqkq2gyag26fev4gj3sqtds6qtqrzd@k25h6jive5f5>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-6-aradhya.bhatia@linux.dev>
 <urkosp5w2ush3br6xvxx3vpxvkea4tmaeas3vvlcb54ofknjat@tnievb37sfx4>
 <c552b800-b3d5-477c-b7f8-53761e40ea36@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c552b800-b3d5-477c-b7f8-53761e40ea36@linux.dev>
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

On Mon, Jan 13, 2025 at 09:12:02PM +0530, Aradhya Bhatia wrote:
> 
> On 1/13/25 15:10, Dmitry Baryshkov wrote:
> > On Sun, Jan 12, 2025 at 12:57:31AM +0530, Aradhya Bhatia wrote:
> >> From: Aradhya Bhatia <a-bhatia1@ti.com>
> >>
> >> Allow the D-Phy config checks to use mode->clock instead of
> >> mode->crtc_clock during mode_valid checks, like everywhere else in the
> >> driver.
> > 
> > Please describe why, not what.
> 
> It is unclear why the rest of the code uses mode->crtc_* parameters at
> all during the non mode validation phase.
> 
> But during that phase, the crtc_* parameters are not generated
> (duplicated in this case) from the regular ones, and so the validation
> fails. The patch prevents that from happening by streamlining with
> other instances.
> 
> I will update the commit text with this.

SGTM

> 
> Regards
> Aradhya
> 
> > 
> >>
> >> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> >> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> >> ---
> >>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> >> index 3b3c45df1399..9c743fde2861 100644
> >> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> >> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> >> @@ -568,13 +568,14 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
> >>  	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
> >>  	unsigned long dsi_hss_hsa_hse_hbp;
> >>  	unsigned int nlanes = output->dev->lanes;
> >> +	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
> >>  	int ret;
> >>  
> >>  	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg, mode_valid_check);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	phy_mipi_dphy_get_default_config(mode->crtc_clock * 1000,
> >> +	phy_mipi_dphy_get_default_config(mode_clock * 1000,
> >>  					 mipi_dsi_pixel_format_to_bpp(output->dev->format),
> >>  					 nlanes, phy_cfg);
> >>  
> >> -- 
> >> 2.34.1
> >>
> > 

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A437A0B274
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0038C10E287;
	Mon, 13 Jan 2025 09:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YBwkJ/mN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E254010E287
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:15:03 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53e384e3481so3683812e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736759642; x=1737364442; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G7zevUVnqlC8W5c2GXcUG82lpkwBeaGm4InCCD835UA=;
 b=YBwkJ/mNb7ten6CXCBX6dBkm/uxCwfkeTMzaFxAuOMq9WQuwKemypVaevL0q71NRUh
 s70AVTeX7zEStR+k5ch8LBYUtloD9L95JYwl4JnMuZIgbkIWPgOU1CQsFEUFchknaKWJ
 /iYWHNe6iG5grraJaaBqO2y2VY5/QblN6dJE00Trh7mktaXZoRs4Wk0ctKgxZF2SycvT
 LlEnSNFVsJuluqecIBNaC7gbZot7xZgjhg5Zip/Rv13slb8nJOQhaiuS7cUbE2FsutyC
 pE9e5D5e4WcKW+svtIzYa7G0ro7MkIK/f3ofxJTG6oVWbOHV015knlKnidk7CrBECB23
 Vz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736759642; x=1737364442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7zevUVnqlC8W5c2GXcUG82lpkwBeaGm4InCCD835UA=;
 b=lHgPyoVPjEcCqY0VUBm/iMXnM/gjeL1yqCIoiVfuAtscCdBWlOkWWww76aul/LPcXh
 Rjjwnvnb7VKqkvVqeVff486Deu7mUhyuR9nwmu3eLLTbzLCNHm8eciaCGxtCOrtEP4HG
 U6Mi6JYPEZOidt6/yES8hnlNdkCcqBGLVB4yE+BK/tDu2unub9HTwBZlmx+YEQU3DrjJ
 +WdCUPhy+0TmtHcbHLveuIoInCSIowaytKDCoWsokCh0kZgR8mAo0rzHhklr6u2RD605
 Y31M4Qkkf3HVQdcFpEKkB0aqwwaYSGi3eVYXzb+pHX0pu5TT915fIH3+USSShTue493u
 69Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURBr8sP0ZRTz1MO9yPX2zuuLyhZtoD1BjX2aSlnsl3gUDMc3M5lhei6kA7YbG7m1Kx6yy9nx5IVb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz02JH0JOt4VX+CmMbmvEAehbGmFtdXGHD9KbuXDsSE8m7lvpwT
 RDCBdjjplYYqmfaxA3rNcpf12OlPbYmMY9Dsz6x7RqaEh76EiU0to7yiXQeoz8A=
X-Gm-Gg: ASbGncvha/i7kooO1ES/CuaN6KdqnNOHc6oxkYRs5q9fkjmeJY6D21hXr2LgEx4y8Fl
 qNL83FSyvHtqv7ewzLAjFjhdg8DRs+/mHGzHTSCi+RkKyqbLd4B0piyAcTvGwf9e3hVQXvni58g
 1WIh5TsBupE+qTd58XgVfVxCxK5Mdy0R23ph32xWQdV7pJm9+bjbtPKdx5FNfuuMZx1T5kDYXnX
 3VmKRqciaomZjqp9OGMT8Aa+LYkulTnBVdfAtGOBnrXB98GicDh00/E4h+aMOfBXLlINaYA4esa
 cGEagQAdNan2rwniBgzMfk977nA5PfLyJjCK
X-Google-Smtp-Source: AGHT+IFeSolc9gamahGRHJFufvovi869gL5qzcLOE0t0Mu5l18gRKubMbm8rCogmbF8aatQGtXrFLw==
X-Received: by 2002:a05:6512:3c9c:b0:542:28e3:2156 with SMTP id
 2adb3069b0e04-542845d2081mr5628933e87.25.1736759642276; 
 Mon, 13 Jan 2025 01:14:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6bddsm1277171e87.120.2025.01.13.01.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:14:01 -0800 (PST)
Date: Mon, 13 Jan 2025 11:13:59 +0200
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
Subject: Re: [PATCH v6 10/12] drm/bridge: cdns-dsi: Move DSI mode check to
 _atomic_check()
Message-ID: <nlrgtmnbkfupr5h7rawogrzw3lqi7hqmyq2d3u2wew7ojx7phn@6kw7vcz2yjny>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-11-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111192738.308889-11-aradhya.bhatia@linux.dev>
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

On Sun, Jan 12, 2025 at 12:57:36AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> At present, the DSI mode configuration check happens during the
> _atomic_enable() phase, which is not really the best place for this.
> Moreover, if the mode is not valid, the driver gives a warning and
> continues the hardware configuration.
> 
> Move the DSI mode configuration check to _atomic_check() instead, which
> can properly report back any invalid mode, before the _enable phase even
> begins.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 87 +++++++++++++++++--
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  1 +
>  2 files changed, 83 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> index 5db5dbbbcaad..b785df45bc59 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> @@ -77,6 +77,7 @@ struct cdns_dsi {
>  	bool link_initialized;
>  	bool phy_initialized;
>  	struct phy *dphy;
> +	struct cdns_dsi_cfg dsi_cfg;

Is this still something necessary / useful? I think the point was to
move dsi_cfg to the state, while this is a non-state struct.

>  };
>  
>  #endif /* !__CDNS_DSI_H__ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

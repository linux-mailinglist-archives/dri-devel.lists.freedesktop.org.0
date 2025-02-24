Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB637A42153
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CBC10E48D;
	Mon, 24 Feb 2025 13:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BDuN2p3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AFC10E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 02:10:13 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-309311e7b39so35554191fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740363012; x=1740967812; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=70SIM7ve3ohVCr23pGlRASua+1uwWRT9srkX+niW28E=;
 b=BDuN2p3qaRnQVb6KP2GYICKOYYUQGObe8m/H9fcPcVP3qQtyX0KFdpErxdylYS9ssu
 V204LJjJOJNN1htJrYcXkG75cBaZ4syw0QSAK47uHua7tsn8Isr3OhkR6kY9usOmRzEf
 Sf2/rNj0fd9m7YqHOOfGVQMaeThhYUnsGBy3B14OI661euLmTKoKPPvSNG1XYfvcF31N
 0Fck3h8IDAY6ZKtoB3JvGi/WV3T+NfipKLr5llYGUQMPHPCpfL57fJZf9Wc15XSCDOJF
 71ALA4wj/PLzc2oQmY/WjzqUZwPozIVrrAXAiOSwnDdG+GFFetwcUSNKDcP0ua7U2gaC
 HssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740363012; x=1740967812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70SIM7ve3ohVCr23pGlRASua+1uwWRT9srkX+niW28E=;
 b=JW5p9Ht2AY8lFC5BR/Nv5klGeP23Kc6muBZzVY3/DblGqeK1fK/GJDFTAypZIa5js0
 6VoxQX6QkewNLIymiedm1ToBK3NIkZTPeCH6m+Plttr34kwfogb0U8+KVoaztX3R1iDD
 CAq49XJrXqU6nqhQmi5jMkfRFrO3keI74Ni3WOCeglX9YAZDFa9cGJufiapv3kiSMORQ
 +IHRbLGr8SIbV94g0iqzypectlu8czdHjYXBYVsZqBJ0F6JbtOatWLvM9YYOevc4ZWIU
 HqjwdFIttRM+lp5y2pT441NyGPOR5OIeQ26rT4M4No1bgoijs3eB5s+REktFQFfTnYEk
 U3Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpPnfpVmXziH4F4qYq6LJxXp9ifPmRUypcejRj+hjzRFNY5pbCrvmUPs68w5z7E7Arady2JNPFXs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvFJtO3TRecN9jzaQ6QGkue3J3kiCRBLYEQ1pAb/jjFBdTydyc
 59fGqRmlRlkFAmeCvzya2Zh7LdLwJLM1IEJZYIK4/0zRDdd4OAf+bjHf14dqtSE=
X-Gm-Gg: ASbGncvX7paJyXf2xmIEhfFPOwme8R5xlftZww1dJGUqkrb8fvSTuHdK1SCULYHhkdE
 KXx1UGNnEAXFdGU/coBkaUPhWE1Mew2k5RZwyUZbVTloQ5zBCprxtQhIBUE6rtaSYAK8f5EpklW
 DorKZw7Xgc7c9vn/wm5GWqsu4q7Hxe3oICfsFQ1o8po2x5pfqp9hBYcgg2ckZux0eFyrFPCuVBt
 4iTid7fzt3gCSRA+Cz5N5issB+0rPweJZHBAQsKzzKgjxrttHsK2a4YXs7y0ELoh0wli+NTluFG
 JAwzZXVdj7tSZ93oqUy0IP8lc6rE8mx3/iKhAP78ibDTyDI/Rc1y8seu2DRursjNOBLvLMA9EfM
 FggzJug==
X-Google-Smtp-Source: AGHT+IEWdqjReqmo0CabaDV+wigcDC1IzI30i9hnje8CtWWpRhAfh0Nh8SpUaaNV8YO6QJ4AwRMK8Q==
X-Received: by 2002:a05:6512:3f19:b0:545:646:7519 with SMTP id
 2adb3069b0e04-54838d3d9d5mr4448013e87.0.1740363011574; 
 Sun, 23 Feb 2025 18:10:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54618f0a36bsm2533548e87.195.2025.02.23.18.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 18:10:11 -0800 (PST)
Date: Mon, 24 Feb 2025 04:10:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
Message-ID: <hz6amgqdmvr6tow5k3gj6n2bnaayejrdv6yhj6sjzs7v3dbjbv@3dcm45ydkkd3>
References: <20250223153244.149102-1-clamor95@gmail.com>
 <20250223153244.149102-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223153244.149102-3-clamor95@gmail.com>
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

On Sun, Feb 23, 2025 at 05:32:44PM +0200, Svyatoslav Ryhel wrote:
> SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> interface to drive display modules of up to 800 x 1366, while supporting
> AMOLED, a-si LCD or LTPS panel technologies for smartphone applications.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  13 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c | 821 +++++++++++++++++++++++++++++++
>  3 files changed, 835 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> 

> +
> +	if (buf == MIPI_DCS_SET_DISPLAY_ON) {
> +		/*
> +		 * NOTE! This is here since it cannot be called in bridge enable because
> +		 * bridge pre enable and bridge enable have no gap in between.
> +		 *
> +		 * Existing framework bridge-panel seq is:
> +		 *	panel_prepare > bridge_pre_enable > bridge_enable > panel_enable
> +		 *
> +		 * Using prepare_prev_first was tested, but it switches seq like this:
> +		 *	bridge_pre_enable > panel_prepare > bridge_enable > panel_enable
> +		 *
> +		 * This will not work since panel hw MUST be prepared before bridge is
> +		 * configured. Correct seq should be:
> +		 *	panel_prepare > bridge_pre_enable > panel_enable > bridge_enable
> +		 *
> +		 * Last two functions are swapped related to existing framework. I am not
> +		 * aware about method which allows that.
> +		 *
> +		 * Once there will be such method/flag, code below should be moved into
> +		 * bridge_enable since it is basically a bridge configuration completing
> +		 * after initial panel DSI sequence is completed.

Will bridge_pre_enable -> panel_prepare (including
MIPI_DCS_SET_DISPLAY_ON) -> bridge_enable work?

The rest looks good to me.

> +		 */
> +		config = SSD2825_CONF_REG_HS | SSD2825_CONF_REG_DCS |
> +			 SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> +
> +		if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> +			config |= SSD2825_CONF_REG_VEN;
> +
> +		if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> +			config &= ~SSD2825_CONF_REG_EOT;
> +
> +		/* Complete configuration after DSI commands were sent */
> +		ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> +		ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0001);
> +		ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> +	}
> +
> +	return 0;
> +}
> +
> 

-- 
With best wishes
Dmitry

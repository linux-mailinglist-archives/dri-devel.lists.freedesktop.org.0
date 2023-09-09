Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CC799C1C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 01:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF53B10E2BF;
	Sat,  9 Sep 2023 23:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4001910E2A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 16:26:46 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52a3ff5f0abso3984334a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1694276804; x=1694881604; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gErk2fmDPN9zspW0gxfBB3yKqfpmHz9a2nWUFiDbRqE=;
 b=dXoFzt3uwS1MYa0pMw94dQFvqSIXJNXByduYozwNM2KdGWmnQ5wbsIYIm7XbSQbZjS
 kbi5I2KtUd9eEmv+KA2PZkI9ERa8olrBaMRcqjhpAedwJdFuKIaYEuy7+A+9GBaeyJtD
 oMzbD/Nv9y4rAdwStX4a7kbBJoY7I/c28Ao2z5WyQXiuGeRrR/DgqNejxxBBFmX9eLKn
 Xl1/5g/Fe9xvMhsCtWqqR+gaM9QlpF7VpEN2NQ5dJOrNcDEkgkBx4PwKI2VemCs25atV
 /JslLuIdlw+otl3PAPE0ki8YzSsZCJ/R/sxPIrusSb3Y5KhRxaKa6LhCQIpT3nonEyOD
 29eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694276804; x=1694881604;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gErk2fmDPN9zspW0gxfBB3yKqfpmHz9a2nWUFiDbRqE=;
 b=WBPbVmZAyIP1duq6jiyG7UJXiKvhRBiiG6r/H8uQOc/UGpPxL1B+eVeoEkfzwj+lrQ
 Fj/1Ej3QBn6OBJNfP3yI+IO0L7BImOrgBGFFGsHosykBhXKm6AChqU2dAPH4Tl2HtvjD
 Xck6tu1oEKNRqVfH7BfF9aCD8WMsRBe2LXwg32oovkjV7ylfoB17tAZPJ1bPu3Uk0h/6
 XHsW1OvxWxkP7VxmjRHPdRLg52WdS9rrbUm3tELCb+YiYYmVBylV18js3vc7XsHX+B/T
 kOLKGrszRBpMBOFdLBpIdooIcmmnaqFv23GWth1egELpFtCXfAWfuQ+Wjg2V043S0wrt
 yKcg==
X-Gm-Message-State: AOJu0YxixtgQ0S7bc0CvmdnhFe4b8ml0tGkcy+PockuhACpYqeQRAzMd
 0eXpC9zsuau/BUSPo4IqfRthbA==
X-Google-Smtp-Source: AGHT+IFgt36OdnvJBSVSriNawPcCIHp40ArBHJDt/BFPQWS2kGOmdHyNu//mVtsP3fu82deHfqRT7g==
X-Received: by 2002:a50:ed03:0:b0:52a:1d9c:83ff with SMTP id
 j3-20020a50ed03000000b0052a1d9c83ffmr4307642eds.1.1694276804644; 
 Sat, 09 Sep 2023 09:26:44 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
 by smtp.gmail.com with ESMTPSA id
 l15-20020aa7d94f000000b0052338f5b2a4sm2327139eds.86.2023.09.09.09.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 09:26:44 -0700 (PDT)
Message-ID: <d0652f8f-deb1-0fa7-54ab-c2df1a333e9f@tuxon.dev>
Date: Sat, 9 Sep 2023 19:26:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 7/8] drm: atmel-hlcdc: add vertical and horizontal
 scaling support for XLCDC
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230825125444.93222-1-manikandan.m@microchip.com>
 <20230825125444.93222-8-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230825125444.93222-8-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 09 Sep 2023 23:39:17 +0000
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/25/23 15:54, Manikandan Muralidharan wrote:
> update the LCDC_HEOCFG30 and LCDC_HEOCFG31 registers of XLCDC IP which

s/update/Update

> supports vertical and horizontal scaling with Bilinear and Bicubic
> co-efficients taps for Chroma and Luma componenets of the Pixel.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 ++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  4 ++++
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 20 +++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index d30aec174aa2..ae3e1a813482 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -536,6 +536,8 @@ static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sam9x75_layers[] = {
>  			.general_config = 12,
>  			.csc = 16,
>  			.scaler_config = 23,
> +			.vxs_config = 30,
> +			.hxs_config = 31,
>  		},
>  		.clut_offset = 0x1300,
>  	},
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> index 8b05a54b5fd0..27074a4c5aec 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> @@ -198,6 +198,8 @@
>   * @disc_pos: discard area position register
>   * @disc_size: discard area size register
>   * @csc: color space conversion register
> + * @vxs_config: vertical scalar filter taps control register
> + * @hxs_config: horizontal scalar filter taps control register
>   */
>  struct atmel_hlcdc_layer_cfg_layout {
>  	int xstride[ATMEL_HLCDC_LAYER_MAX_PLANES];
> @@ -217,6 +219,8 @@ struct atmel_hlcdc_layer_cfg_layout {
>  	int disc_pos;
>  	int disc_size;
>  	int csc;
> +	int vxs_config;
> +	int hxs_config;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index 26caf4cddfa4..a06ae2dc5909 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -972,6 +972,26 @@ static void xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
>  		atmel_hlcdc_layer_write_cfg(&plane->layer,
>  					    desc->layout.csc + i,
>  					    xlcdc_csc_coeffs[i]);
> +
> +	if (desc->layout.vxs_config && desc->layout.hxs_config) {
> +		/*
> +		 * Updating vxs.config and hxs.config fixes the
> +		 * Green Color Issue in SAM9X7 EGT Video Player App
> +		 */
> +		atmel_hlcdc_layer_write_cfg(&plane->layer,
> +					    desc->layout.vxs_config,
> +					    ATMEL_XLCDC_LAYER_VXSYCFG_ONE |
> +					    ATMEL_XLCDC_LAYER_VXSYTAP2_ENABLE |
> +					    ATMEL_XLCDC_LAYER_VXSCCFG_ONE |
> +					    ATMEL_XLCDC_LAYER_VXSCTAP2_ENABLE);
> +
> +		atmel_hlcdc_layer_write_cfg(&plane->layer,
> +					    desc->layout.hxs_config,
> +					    ATMEL_XLCDC_LAYER_HXSYCFG_ONE |
> +					    ATMEL_XLCDC_LAYER_HXSYTAP2_ENABLE |
> +					    ATMEL_XLCDC_LAYER_HXSCCFG_ONE |
> +					    ATMEL_XLCDC_LAYER_HXSCTAP2_ENABLE);
> +	}
>  }
>  
>  static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)

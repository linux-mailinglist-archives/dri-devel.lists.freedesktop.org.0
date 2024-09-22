Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65997E20F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 16:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7538010E172;
	Sun, 22 Sep 2024 14:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YzYuyatw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B77310E172
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 14:47:11 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f7502f09fdso28805541fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727016429; x=1727621229; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G5ql09vu5IdbjFoj156mQK1XSS7GGTqYANa3dkeWGfY=;
 b=YzYuyatwue0MUHQ1zDy655l+9/ZCi2uxjRrbP0w8Ck6cuvrM9jdjsPe23pNgmwEj8G
 NbC1LG3ZB5lk8IzLfh+CyVsIhp8uvp5qL3DjDmt9yfbm+3mDpXAcOXX6saFKKYpdWz/f
 0ougg14qR2Sk7zktdu1Kah7XPtNn9QZCREm8xjxblVZIQxTiI03GPb944VxYYI4sFen+
 rdcG1Mj9KzOCOzRe98pvxHm9/zBhWn+4B5M6YWDNxN8iUGSGo44QKScjVgNWHL5o/eq0
 CgZApiuErmrjhFOnonwGsNuj8e4yqvLmrkXT6YA8bE8gnal1uoldS/N0M84xFcM7u6wa
 /kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727016429; x=1727621229;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5ql09vu5IdbjFoj156mQK1XSS7GGTqYANa3dkeWGfY=;
 b=c6LybhiAqtzqR9hphXDgXibfDKhJ2rPvtENpYLyBxoVajJRA45IRWS3bzcjvIkWEsG
 aaBR32BF5KXXUFWWbWMLjcxa8SWUlTxccEduMH9+KizBxY/yUQ8qqy3b1V/cAzgcyDMq
 3+jksMBK1u1SPQxfcfGt9E3qb04HYonQmYQg3XIbo6KEkuwCP+9p1n8PaefApFZXsu5Q
 FktXLqom8x56h0kCJ5dYIWM/2vooPzuJNQeR3izQ1i6MetZAOVodsQlSJc4a/1Q2BQL6
 oLEVaTRSus6oj0dlAREjIK+Tkl48JWGau17AZaOBEhEfOJ/kGDWBGfdF5GHC/4W6Op6C
 CuTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/0rjmv/WkDAu8CGXi3fDPw/4rxoC/AtGwGF0vdxsBf+AagY+qEYmLmkXI2kCMc7WjiS5asncqD+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys3THAsDET8B5zx5uK2fTD1S8uOcFOW931Z6czx0qNhCo+3WpV
 zpqn2S9rhhDJOG4Lw0WWaBYeZEGsUYxxsgmbfYZYGR9afT4ugVAivnfAbv5EG/k=
X-Google-Smtp-Source: AGHT+IEUU72oA8PQ4wB93uKBQMxrZ6y1O8Vf6vWkeVD0ShpcWcMaJvNZm3t/AHMNF/AyDYp1Dy09kg==
X-Received: by 2002:a2e:a553:0:b0:2f3:be9e:4585 with SMTP id
 38308e7fff4ca-2f7c3d65faemr36771521fa.11.1727016428664; 
 Sun, 22 Sep 2024 07:47:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d4862eesm25709251fa.116.2024.09.22.07.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 07:47:07 -0700 (PDT)
Date: Sun, 22 Sep 2024 17:47:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel: nt35510: Make new commands optional
Message-ID: <5wpydjxkjfyojh5ybc5brxyqfkxt54mfrduxdpcoisytzdu76u@axgydzhle25h>
References: <20240908-fix-nt35510-v2-1-d4834b9cdb9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240908-fix-nt35510-v2-1-d4834b9cdb9b@linaro.org>
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

On Sun, Sep 08, 2024 at 11:50:30PM GMT, Linus Walleij wrote:
> The commit introducing the Frida display started to write the
> SETVCMOFF registers unconditionally, and some (not all!) Hydis
> display seem to be affected by ghosting after the commit.
> 
> Make SETVCMOFF optional and only send these commands on the
> Frida display for now.
> 
> Reported-by: Stefan Hansson <newbyte@postmarketos.org>
> Fixes: 219a1f49094f ("drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK")
> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v2:
> - After Stefan's testing conclude that we only need to make
>   SETVCMOFF optional.
> - Link to v1: https://lore.kernel.org/r/20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index d3bfdfc9cff6..a3460ed38cc4 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -38,6 +38,7 @@
>  
>  #define NT35510_CMD_CORRECT_GAMMA BIT(0)
>  #define NT35510_CMD_CONTROL_DISPLAY BIT(1)
> +#define NT35510_CMD_SETVCMOFF BIT(2)
>  
>  #define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
>  #define MCS_CMD_READ_ID1	0xDA
> @@ -675,16 +676,19 @@ static int nt35510_setup_power(struct nt35510 *nt)
>  				nt->conf->bt2ctr);
>  	if (ret)
>  		return ret;
> +
>  	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
>  				NT35510_P1_VCL_LEN,
>  				nt->conf->vcl);
>  	if (ret)
>  		return ret;
> +
>  	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
>  				NT35510_P1_BT3CTR_LEN,
>  				nt->conf->bt3ctr);
>  	if (ret)
>  		return ret;
> +
>  	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
>  				NT35510_P1_VGH_LEN,
>  				nt->conf->vgh);

I think this part is unrelted and should go in as a separate commit.
Other than that LGTM.

> @@ -721,11 +725,13 @@ static int nt35510_setup_power(struct nt35510 *nt)
>  	if (ret)
>  		return ret;
>  
> -	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
> -				NT35510_P1_VCMOFF_LEN,
> -				nt->conf->vcmoff);
> -	if (ret)
> -		return ret;
> +	if (nt->conf->cmds & NT35510_CMD_SETVCMOFF) {
> +		ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
> +					NT35510_P1_VCMOFF_LEN,
> +					nt->conf->vcmoff);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	/* Typically 10 ms */
>  	usleep_range(10000, 20000);
> @@ -1319,7 +1325,7 @@ static const struct nt35510_config nt35510_frida_frd400b25025 = {
>  	},
>  	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>  			MIPI_DSI_MODE_LPM,
> -	.cmds = NT35510_CMD_CONTROL_DISPLAY,
> +	.cmds = NT35510_CMD_CONTROL_DISPLAY | NT35510_CMD_SETVCMOFF,
>  	/* 0x03: AVDD = 6.2V */
>  	.avdd = { 0x03, 0x03, 0x03 },
>  	/* 0x46: PCK = 2 x Hsync, BTP = 2.5 x VDDB */
> 
> ---
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> change-id: 20240906-fix-nt35510-a8ec6e47e036
> 
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>
> 

-- 
With best wishes
Dmitry

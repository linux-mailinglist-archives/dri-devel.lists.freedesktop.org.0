Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD750D4F3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 21:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF0610E2DD;
	Sun, 24 Apr 2022 19:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10D210E2DD
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 19:59:47 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dk23so2605133ejb.8
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bV7abALvJSLkm1kXyFRmPXQZ2gIon9h1Q/8YJtaLQt4=;
 b=lcAdQ6A+UaHD3xIrVIAm0/cpdlS52ljmY/RnUwRNx33hyNO15ij8+ZKeJ2lQ7pWkiy
 WDv1tK/A+g45C0CQaHsQvsYH8wBVOJ1k3Y7H/TSR/QyGyRXxKUPM5Tz0XuWUkHWunE5Y
 lBrOLHdwkS+hWXMRCmbZtV0woML4a7TscSAY0bS53ftl6TNrHE5qQvITz+a6uc7o5xnf
 C6O/kY1mU1P1UzIf9ev5uMDpE7GV2hUhpqiwpc+vovpuQ8ALgvweJRrF9W9/D7QzM33w
 nKILE+YGn8kTLiu8t+VdRp/35f9xuzkIdZ7evu4/5yJ0rs99yigb2Q4SzMy2bdTxwOj8
 sraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bV7abALvJSLkm1kXyFRmPXQZ2gIon9h1Q/8YJtaLQt4=;
 b=SADB+G6at7PNC7rf/BD+0zhDPphN2bIser0OiIuByzeRFkx1n9FDGvDt2dZV/Fx5PA
 PbdWpimIu8T6MioNkt0DShZRUSsbMpGCqBb0cOq2mTjoHzveC2Y+YGYGN+J5HBuGHaRf
 BW3O9fDKfSz6pmZbIeltctD2pjiLMs00hZxc0tipPJ6SYPnJnBwI5p88eG/rgQjXDmy6
 mXaAuIajPD2BylQnDF8iFC8C5KqNIGvl011zSBF83Hl4NOP9h9SuF2c7U0HHAG7eI+/h
 zx9T3jMy9JAvJjouxBdRWeiKkRDjdNf4+3gy7g2vY/Y9U0QbTI8Z3Mn7JoVHYAKSppL6
 jo6Q==
X-Gm-Message-State: AOAM531L2BzyzmzTYTDpoBh5Fvk8NtWMbrUFJgC9OHSuFbXfKWggY6Px
 E4ISBpJH0/TYMfR0PPktDrM=
X-Google-Smtp-Source: ABdhPJy+WUlHCxfjVulhRV24z4zq5PYWrKRNgfG26I/7xRNckO6yB1RPxAIu2B7iY6TbPQGLZ9u00A==
X-Received: by 2002:a17:907:7f28:b0:6f0:29eb:85ba with SMTP id
 qf40-20020a1709077f2800b006f029eb85bamr13971555ejc.15.1650830386246; 
 Sun, 24 Apr 2022 12:59:46 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 m5-20020a17090607c500b006f1bf5f545asm2837299ejc.26.2022.04.24.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 12:59:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 04/14] drm/sun4i: hdmi: Use more portable I/O helpers
Date: Sun, 24 Apr 2022 21:59:44 +0200
Message-ID: <4732416.31r3eYUQgx@kista>
In-Reply-To: <20220424162633.12369-5-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne nedelja, 24. april 2022 ob 18:26:22 CEST je Samuel Holland napisal(a):
> readsb/writesb are unavailable on some architectures. In preparation for
> removing the Kconfig architecture dependency, switch to the equivalent
> but more portable ioread/write8_rep helpers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>  - New patch: I/O helper portability
> 
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/
sun4i_hdmi_i2c.c
> index b66fa27fe6ea..c7d7e9fff91c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> @@ -56,9 +56,9 @@ static int fifo_transfer(struct sun4i_hdmi *hdmi, u8 *buf, 
int len, bool read)
>  		return -EIO;
>  
>  	if (read)
> -		readsb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, 
len);
> +		ioread8_rep(hdmi->base + hdmi->variant->ddc_fifo_reg, 
buf, len);
>  	else
> -		writesb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, 
len);
> +		iowrite8_rep(hdmi->base + hdmi->variant->ddc_fifo_reg, 
buf, len);
>  
>  	/* Clear FIFO request bit by forcing a write to that bit */
>  	regmap_field_force_write(hdmi->field_ddc_int_status,
> -- 
> 2.35.1
> 
> 



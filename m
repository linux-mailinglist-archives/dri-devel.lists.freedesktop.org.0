Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE78799C1B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 01:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236B410E2C0;
	Sat,  9 Sep 2023 23:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFB910E2A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 16:25:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5007c8308c3so5099799e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1694276724; x=1694881524; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eQE6ckc0oZWZqJvmZPgbajkRP4Z8CAIaomWfQSYs+5o=;
 b=U988QEv1RbaMfjwYC1dZf09904+1Pkj2DjCoYr9UaUblHKCmYR+fuJjVNrewBaLsB/
 PSVDBqeEOZA0ltqbuyvBxPp+4pngEPVIoAc5pngFBSnj86ZE6TEX0VYHSMNwpVVGCcgs
 swb1DIBteFaqTz/C4s7QrJI8Y5IongaYOF9Uve6mOKA+Q03bfRl6K1HsRBwGQ9D+TjIh
 FqqNjhUI1rR4N7Z99mFzf686NK3ENgu8gifp8SfOcb+IqYFT0RvIWjK3kWB6EAVM1wD/
 S64G5jbcUGjrR7Rvnh4iAtyfCgkApG7uvMJZ0g9VN26nuQmc6bz97bINFskiWIkCBOB/
 kWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694276724; x=1694881524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eQE6ckc0oZWZqJvmZPgbajkRP4Z8CAIaomWfQSYs+5o=;
 b=jhVg01k+zXorUc1NTl82x1b9jxRk+rYiQn9qcGL5e9cqWnh113o5yhmTIopGykgniU
 9uy3rLZEM4wobZ8H4f2RuAVY0Y+x4hfpFMo+MiIsvmrycnb6R/x32ewPSmfIq2klyw/P
 pPM6f6zQSaiu6CM8iYOkOrC55dD7+i8dOryFZ4dVhDDdt75+fZUAkDlFJhBLMn4KKG71
 ouwwCybGBJhMCRrdJxeYZ8R0FmP2OA+rytXJGhV+qQfYM7g6FhOuWuaNtQ/j6IiJ7Pdq
 vJyK+RFN2D/YoGtltAFGo3KgRxH+oCyZixr7KqPRXGEEr1mrVOIuXJ4qqYxDSRF9tsB+
 AoWw==
X-Gm-Message-State: AOJu0Yzv49rjusdTbHRmBVwuHZnNBo2MARvqV+1zDAGht8HXgyYk2uCl
 yPNcMivAtKWVmHj1KjppCg5MtA==
X-Google-Smtp-Source: AGHT+IEfVZuS1Jpmntu4yEY561Ek36RST0fB8NMR+natsnsDl43t7oQj2yqxoe5fUi+Dr4a/NGrLQQ==
X-Received: by 2002:a05:6512:6c9:b0:500:86cf:124b with SMTP id
 u9-20020a05651206c900b0050086cf124bmr5353066lff.62.1694276723592; 
 Sat, 09 Sep 2023 09:25:23 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a056402069600b0052a626daf4csm2346689edy.47.2023.09.09.09.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 09:25:23 -0700 (PDT)
Message-ID: <a86388dd-4130-a3b1-cad0-a59dbf0a7eef@tuxon.dev>
Date: Sat, 9 Sep 2023 19:25:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 6/8] drm: atmel-hlcdc: add DPI mode support for XLCDC
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230825125444.93222-1-manikandan.m@microchip.com>
 <20230825125444.93222-7-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230825125444.93222-7-manikandan.m@microchip.com>
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
> Add support for Display Pixel Interface (DPI) Compatible Mode
> support in atmel-hlcdc driver for XLCDC IP along with legacy
> pixel mapping.DPI mode BIT is configured in LCDC_CFG5 register.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> [durai.manickamkr@microchip.com: update DPI mode bit using is_xlcdc flag]
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 4b11a1de8af4..c3d0c60ba419 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -30,10 +30,12 @@
>   *
>   * @base: base CRTC state
>   * @output_mode: RGBXXX output mode
> + * @dpi: output DPI mode
>   */
>  struct atmel_hlcdc_crtc_state {
>  	struct drm_crtc_state base;
>  	unsigned int output_mode;
> +	bool dpi;

To avoid confusion, better use u8 to avoid shifting a boolean value in
configuration phase.

>  };
>  
>  static inline struct atmel_hlcdc_crtc_state *
> @@ -164,6 +166,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  
>  	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
>  	cfg = state->output_mode << 8;
> +	if (is_xlcdc)
> +		cfg |= state->dpi << 11;
>  
>  	if (!is_xlcdc && (adj->flags & DRM_MODE_FLAG_NVSYNC))
>  		cfg |= ATMEL_HLCDC_VSPOL;
> @@ -176,7 +180,9 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  			   ATMEL_HLCDC_VSPDLYS | ATMEL_HLCDC_VSPDLYE |
>  			   ATMEL_HLCDC_DISPPOL | ATMEL_HLCDC_DISPDLY |
>  			   ATMEL_HLCDC_VSPSU | ATMEL_HLCDC_VSPHO |
> -			   ATMEL_HLCDC_GUARDTIME_MASK | ATMEL_HLCDC_MODE_MASK,
> +			   ATMEL_HLCDC_GUARDTIME_MASK |
> +			   (is_xlcdc ? ATMEL_XLCDC_MODE_MASK |
> +			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
>  			   cfg);
>  
>  	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
> @@ -366,7 +372,15 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  
>  	hstate = drm_crtc_state_to_atmel_hlcdc_crtc_state(state);
>  	hstate->output_mode = fls(output_fmts) - 1;
> -
> +	if (crtc->dc->desc->is_xlcdc) {
> +		/* check if MIPI DPI bit needs to be set */
> +		if (fls(output_fmts) > 3) {
> +			hstate->output_mode -= 4;
> +			hstate->dpi = true;
> +		} else {
> +			hstate->dpi = false;
> +		}
> +	}
>  	return 0;
>  }
>  
> @@ -470,7 +484,7 @@ static struct drm_crtc_state *
>  atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
>  	struct atmel_hlcdc_crtc_state *state, *cur;
> -
> +	struct atmel_hlcdc_crtc *c = drm_crtc_to_atmel_hlcdc_crtc(crtc);
>  	if (WARN_ON(!crtc->state))
>  		return NULL;
>  
> @@ -481,6 +495,8 @@ atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
>  
>  	cur = drm_crtc_state_to_atmel_hlcdc_crtc_state(crtc->state);
>  	state->output_mode = cur->output_mode;
> +	if (c->dc->desc->is_xlcdc)
> +		state->dpi = cur->dpi;
>  
>  	return &state->base;
>  }

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81036AFB962
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655FC10E4F3;
	Mon,  7 Jul 2025 17:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XkCAIwL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38EC10E4F3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 17:02:33 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-23636167b30so33633405ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751907753; x=1752512553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sf7fXWM8cJOpPopwpN8BZiyBh+hJ95cXslAdvwdcSo4=;
 b=XkCAIwL7tREngf/fC6NyOvtGlkHI6HzovAO69skNwnUgLmPxRcft01HjFxhRtFcnUH
 cGLjraaiwwdkWwLJLV2eqldOPGQnzIPlEgkwiT4G52CYyA8JzqqXnvuxGmSXgV/CzMao
 hYKQVtc89MrylQchOn8RY+Lqo3B4DL7MHKDFLB4rdfE8WD91+uDJ1EM1lQ+mg1fN5m8E
 q5h9L8JIcClEU8mTljWx41M5jFIf5wr4g0VPKllk5B8wM54BKNMNeSOArBL4na7SJooP
 dQatfBdHNW0bxcEsswHwiz5eM14DzVXo/ciayStGWSfr+WE55n9LZWmzLIeRj7locpAS
 jixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751907753; x=1752512553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sf7fXWM8cJOpPopwpN8BZiyBh+hJ95cXslAdvwdcSo4=;
 b=pu72kbrKVwhYaMUOQQqyTp95wWZwfLym/Z7cgGbhgTHQCihHI9GttPsVMDrchRBshu
 hM1ffnTxNaFNespZ0HAq5S6hNjVjNqVnpEOzLsvl+QXeqaAnfqepw036qx3AuCawu8/y
 g+8IsSgUiksYo77SuSB/AmF0I3HCjbZAFE/EyhaYdl9lLNXTscIYQeCh1HE93NJikk4a
 eYAF4y1rTW2CWpB65XdB02vtuku33SvImQ0lwjKvR61di87lucC44DvC/qpwoU7u46oD
 dvnWI9YWaGw4DWPl3Au7l68Hnud7PRQcd+NpgKv7UpiDIBuByE0W+WAcM/iMDmlZk6dF
 1YfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxmFK6nzuUR4Zww5EnZno41bT0le5+r8/YRA02ZEaFp/rWi/n1ZVLXRYvd1niMfABlEjdQgaW1AH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDJXze2rgoyecixNl07W5Kqvnssszf2n1/2zt0lAfDPMqLPfat
 96fMmgkHcRzgOgRUFQcMZmGTmmLtSkQd2bXNDHsEgO0z/dKwOaflTf2X
X-Gm-Gg: ASbGncsPwyrvUzogF//rDZTEw0Rzbylb41TQDmFlnoqWtD2qB9HnlQNLgl4edM+m4BU
 +8y7+TJ1qorXFjyVoYc/VM8GT/GKyHThhSMxB3saN3Dk/GI+R4aCpJigqrAdm+9lTrNs/fljv7V
 8w2menVQjNcRYgVSOHqFgr85dWlz5FTUYNwdhVHQqhB4w16KNpt27GhfQ1nNZFt64PFfLFhFwhY
 RbWNR7EGcahiyfGIQ0c/SSlUJJYwcb3vG557ud4f5Hck0AI6uSI8XjKmNCeVgaclwTjltKz0UrM
 6U7Xuo7CvL6m/deRMCzes5QbtUK1SnPOPScN3gEtbPSBXKu0iV/dfYw7Ei0jRymd
X-Google-Smtp-Source: AGHT+IG8yMUXenYEn60fkq7ok6nf8gr6qJOoaMZCKEBtHTYasFnNHGVKtr5hAhaAnpN5pj44sUjrvg==
X-Received: by 2002:a17:902:d512:b0:235:ed02:288b with SMTP id
 d9443c01a7336-23c85e745c2mr174825445ad.30.1751907753129; 
 Mon, 07 Jul 2025 10:02:33 -0700 (PDT)
Received: from [10.0.0.86] ([122.172.85.55]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459c6e5sm94885855ad.227.2025.07.07.10.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 10:02:32 -0700 (PDT)
Message-ID: <2529b1e4-390f-4459-b7f4-82a9cd005da3@gmail.com>
Date: Mon, 7 Jul 2025 22:32:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: panel: Replace usage of deprecated MIPI macro
To: Brigham Campbell <me@brighamcampbell.com>, dianders@chromium.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250707075659.75810-1-me@brighamcampbell.com>
 <20250707075659.75810-2-me@brighamcampbell.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <20250707075659.75810-2-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 7/7/25 1:26 PM, Brigham Campbell wrote:
> Replace all usages of the deprecated mipi_dsi_generic_write_seq() with
> mipi_dsi_generic_write_seq_multi().
> 
> This patch's usage of the mipi_dsi_multi_context struct is not
> idiomatic. Rightfully, the struct wasn't designed to cater to the needs
> of panels with multiple MIPI DSI interfaces. This panel is an oddity
> which requires swapping the dsi pointer between calls to
> mipi_dsi_generic_write_seq_multi() in order to preserve the exact
> behavior implemented using the non-multi variant of the macro.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> index 5b5082efb282..777a8ab3a397 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -161,29 +161,35 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>  
>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>  {
> +	struct mipi_dsi_multi_context dsi_ctx;
> +
>  	/* Clear the manufacturer command access protection */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> +	dsi_ctx.dsi = jdi->link1;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>  				   MCS_CMD_ACS_PROT_OFF);
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> +	dsi_ctx.dsi = jdi->link2;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>  				   MCS_CMD_ACS_PROT_OFF);
>  	/*
> -	 * Change the VGH/VGL divide rations to move the noise generated by the
> +	 * Change the VGH/VGL divide ratios to move the noise generated by the
>  	 * TCONN. This should hopefully avoid interaction with the backlight
>  	 * controller.
>  	 */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
> +	dsi_ctx.dsi = jdi->link1;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
>  				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>  				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>  				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>  				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>  
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
> +	dsi_ctx.dsi = jdi->link2;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
>  				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>  				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>  				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>  				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>  
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static int jdi_panel_prepare(struct drm_panel *panel)

There's a lot more functions that should be replaced in this panel. You
can get a good idea of which ones by looking for the keyword
"deprecated" in drm_mipi_dsi.c . Here's a good reference for what a
conversion patch usually looks like:
https://lore.kernel.org/all/20250319183106.12613-1-tejasvipin76@gmail.com/

-- 
Tejas Vipin

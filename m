Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80D91523E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AFD10E49E;
	Mon, 24 Jun 2024 15:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fCUpNLUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B07A10E49E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:27:46 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so50854601fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719242864; x=1719847664; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zknmga5PBkgGw8TgH0HGAYjZwH1IzFooajhy3i9qJ1I=;
 b=fCUpNLUHqXXAnchZs9Et2el41j71yoVpdeNX/34L0AKc5Ydx9iajYu6RztkqSXyjMz
 ayde3p4ZYLI4eA610O5H18F/kJP3fyC/hBT6dNLl7PgaiYlkOxoVgtx0i6XlcTHn8V5T
 Qp5Zxesz3HACKV0uSCfVrTHW+EknuGoM/3g30pvncRn/KuG8apzbfVIXfKv55yvQawBV
 0Q7zvC451xQcXb5vC5Jk+0HW4nC7jbUP84Ivw/1r/8C4+Ktx7kA63MIaadiq/P03/I+H
 KKtV5rEczxLEO6Ro2fteHMpUwO0hUrQNud9r0+5kYfEq38d3VIt/c2FC77B11jzstgfT
 qCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719242864; x=1719847664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zknmga5PBkgGw8TgH0HGAYjZwH1IzFooajhy3i9qJ1I=;
 b=XWvTWzouS4VQTv9BDK8GQHPG4P2bKaulbyIw0eogDCr8Vu/2WUZ0XYpSE+Rg8smNZh
 riStOsdcOZ/dL4x/XbCKlU7q6gJoACPkfurUfYEBESidsBR5l3kgsVaqbkKp1+EcM7wP
 wJ80K6Vutw6AVTrbS3aMNfgohCLPUEIWlMVyJpMyk42h9C85sFbN5UxBvCyzHo7NkZLF
 trtZk8WM8uc77Wk05EEyO2QP9eepI5oianDJFLdZDnYE2E0Hr0vxZzkR7sMihb+XP1cQ
 4RzowX2xREB0HhUVTEQP49gmZQyikADtmGm2P4CkbaDx5dHv2i+w1AUgk2NqSB+M5Po6
 4wzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT8nj1eLLHioJK7LRiqNGEYPzBbB6KOJpjb7Nh2vdRg3WhRagGBOP8ABHc6pWgZuMO2/c6lcF38mnOPc4bSHa30qcCuABYu3YhKhbxZCvw
X-Gm-Message-State: AOJu0Yw7UG6+X5dAslwpGYlFG+okaQPnPfO/nW/vSrXpbAxQ34pkIPwA
 qWdnjfYV5ThIwqV5FP3EYlRqXOd5DrE6+ADcbEqLR+ZAkY9WzkCHwbEUWiD/owo=
X-Google-Smtp-Source: AGHT+IHDKHZF641+eAwV/7qMCMAd3xlHkRDY+QbpVU6UAqq4KN7gdHrHBVq0n1HMXETpl9kIvQ0KeA==
X-Received: by 2002:ac2:4882:0:b0:52c:e05f:f70c with SMTP id
 2adb3069b0e04-52ce1835310mr2739405e87.26.1719242864274; 
 Mon, 24 Jun 2024 08:27:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdd9800a7sm710361e87.126.2024.06.24.08.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:27:43 -0700 (PDT)
Date: Mon, 24 Jun 2024 18:27:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped
 MIPI DCS functions
Message-ID: <zvkl2wyqp3iem4ln4qkbhgvxafsfn5wkkmqwhufabm2gqs3eqw@vmqs3lx72ekk>
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-4-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624141926.5250-4-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Mon, Jun 24, 2024 at 10:19:24PM GMT, Zhaoxiong Lv wrote:
> Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
> simplify driver's init/enable/exit code.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 793 +++++++++---------
>  1 file changed, 390 insertions(+), 403 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index a9c483a7b3fa..e836260338bf 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -19,17 +19,13 @@
>  #include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
> -#define JD9365DA_INIT_CMD_LEN		2
> -
> -struct jadard_init_cmd {
> -	u8 data[JD9365DA_INIT_CMD_LEN];
> -};
> +struct jadard;
>  
>  struct jadard_panel_desc {
>  	const struct drm_display_mode mode;
>  	unsigned int lanes;
>  	enum mipi_dsi_pixel_format format;
> -	const struct jadard_init_cmd *init_cmds;
> +	int (*init)(struct jadard *jadard);
>  	u32 num_init_cmds;
>  };
>  
> @@ -50,46 +46,33 @@ static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
>  
>  static int jadard_enable(struct drm_panel *panel)
>  {
> -	struct device *dev = panel->dev;
>  	struct jadard *jadard = panel_to_jadard(panel);
> -	struct mipi_dsi_device *dsi = jadard->dsi;
> -	int err;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
>  
>  	msleep(120);
>  
> -	err = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (err < 0)
> -		DRM_DEV_ERROR(dev, "failed to exit sleep mode ret = %d\n", err);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>  
> -	err =  mipi_dsi_dcs_set_display_on(dsi);
> -	if (err < 0)
> -		DRM_DEV_ERROR(dev, "failed to set display on ret = %d\n", err);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>  
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static int jadard_disable(struct drm_panel *panel)
>  {
> -	struct device *dev = panel->dev;
>  	struct jadard *jadard = panel_to_jadard(panel);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
>  
> -	ret = mipi_dsi_dcs_set_display_off(jadard->dsi);
> -	if (ret < 0)
> -		DRM_DEV_ERROR(dev, "failed to set display off: %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>  
> -	ret = mipi_dsi_dcs_enter_sleep_mode(jadard->dsi);
> -	if (ret < 0)
> -		DRM_DEV_ERROR(dev, "failed to enter sleep mode: %d\n", ret);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>  
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static int jadard_prepare(struct drm_panel *panel)
>  {
>  	struct jadard *jadard = panel_to_jadard(panel);
> -	const struct jadard_panel_desc *desc = jadard->desc;
> -	unsigned int i;
>  	int ret;
>  
>  	ret = regulator_enable(jadard->vccio);
> @@ -109,13 +92,9 @@ static int jadard_prepare(struct drm_panel *panel)
>  	gpiod_set_value(jadard->reset, 1);
>  	msleep(130);
>  
> -	for (i = 0; i < desc->num_init_cmds; i++) {
> -		const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
> -
> -		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365DA_INIT_CMD_LEN);

This function usesd mipi_dsi_dcs_write_buffer()...

> -		if (ret < 0)
> -			return ret;
> -	}
> +	ret = jadard->desc->init(jadard);
> +	if (ret)
> +		return ret;
>  
>  	return 0;

[...]

> +static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);

... while your code uses mipi_dsi_dcs_write_seq_multi(), which
internally calls mipi_dsi_generic_write_multi(). These two function use
different packet types to send the payload. To be conservatite, please
use mipi_dsi_dcs_write_buffer_multi().

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE1, 0x93);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE2, 0x65);

-- 
With best wishes
Dmitry

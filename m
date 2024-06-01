Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD348D7117
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 18:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3838B10E159;
	Sat,  1 Jun 2024 16:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tDzZexys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465AD10E159
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 16:26:16 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e73359b900so35412211fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717259174; x=1717863974; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dz7eDnR6aldQYl6qT9Nozc6yfZ+G7n/nWlooLnLDrf8=;
 b=tDzZexysIevAIQ0EitD8BCY+c31cS/tMmXixiLbxVmHWZX33iIoQvx0JhulZLKblI/
 HwbuiIZ0vCSWMSelB8rVuuGUCFmZ5D56+dJ/2b5519twZZxW++WPuC4uV6HLzQLUx8am
 T618Cox6BHHSqyNO+MoDF6bN+G71W4u4uZw48Ueuc+IdC6k7YngvqubO5rUs/eHW+mPQ
 KfHiP/WxAq+vqbvdgjoYMCFKFFBVYFqOVua1hd5ptNcFBaCtG2aYUTR/aSR12mjzpU5W
 NpGiPj8qcBosjDLzcpZnz98FR1BVXCm6c9GX+OsJ6vfVluZNmg8STIBYmM2Zjaahb/dj
 hlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717259174; x=1717863974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dz7eDnR6aldQYl6qT9Nozc6yfZ+G7n/nWlooLnLDrf8=;
 b=YAa+D7rD+sPvzpzhdLhs/abaYAvQhzzCLPJ1qzn/MM9SjzhW4/1wa3WQqCKZ1M46zm
 GQHMZ26GblR7l4S/+znMFW+S1YbE1eLvnoGPZmFCJ6Nu/MIZjkZgZyoQPbJ1XHygyRqE
 hshABJhE92bbaB224jQjaw7NGgIUpfwljl4fXbcXfjN54oTlYPfWOYw2humCdBrfathz
 cgE+MYs/55BhM842EyjoT8FTkcrQoXDuuQWVk2vo1hXypcPi46GOLHV1fAiKYcXibYla
 5Sckewab4lRSNPPxcODNfkrMIUrMLlD0bHy66OTVg8wZqsLfgoCV8hFTf5v7D+5tjC5O
 70aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9sIrY6xOfRixLSjf3fVX0qkHvM9St9raQnXhouHxQ28rBHFSR7OCiuFKPv2D6MVSxEUo9CG0c8fohgzAmtcQ2wAU9rYOHYcyGTDEb8B+F
X-Gm-Message-State: AOJu0Yyu/wxXoE+Eyq7b6pH6wsICPcBtxYymVX470kCHO/o1Bz+olSFk
 s7z5c2zGhGQUrbUlRtPHEa6PvwveXg/FXqdRqGJoiQHu6zfuGRyhJdT2cSSPuTc=
X-Google-Smtp-Source: AGHT+IF5cj9uWJfRvJeWylt+ilarefZeL35V3vMlaznKpn/yi2CrH6ZWiIhwMFRDmQECSh/o+AAVwg==
X-Received: by 2002:a2e:9d12:0:b0:2ea:7cca:31aa with SMTP id
 38308e7fff4ca-2ea950e64ebmr33071271fa.16.1717259173685; 
 Sat, 01 Jun 2024 09:26:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0bdasm6476021fa.121.2024.06.01.09.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 09:26:13 -0700 (PDT)
Date: Sat, 1 Jun 2024 19:26:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panel: starry: add new panel driver
Message-ID: <5yz4uct3dnxqflij34zasu6fhr42gyl6kjfjobftrwpsl6j4y6@3kzp4s3dxktw>
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240601084528.22502-5-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601084528.22502-5-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Sat, Jun 01, 2024 at 04:45:28PM +0800, Zhaoxiong Lv wrote:
> This Starry panel has the same timing as the Kingdisplay panel,
> so add starry configuration in the Kingdisplay driver.

Do these two panels share the same driver IC? Programming sequences do
not seem common, so it might be better to have a separate driver for
this panel.

> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> 
> Chage since V2:
> 
> -  Add compatible for Starry er88577 in panel-kingdisplay-kd101ne3 drivers.
> 
> ---
>  .../drm/panel/panel-kingdisplay-kd101ne3.c    | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> index 8994a1c9afb5..b614d28475a6 100644
> --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> @@ -267,6 +267,67 @@ static int kingdisplay_kd101ne3_init(struct kingdisplay_panel *kingdisplay)
>  	return 0;
>  };
>  
> +static int starry_er88577_init(struct kingdisplay_panel *kingdisplay)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->dsi };
> +
> +	/* T5:HWreset to init_code >= 120ms */
> +	msleep(120);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x50, 0x50, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x49, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x61, 0x4f, 0x42, 0x3e, 0x2d, 0x31,
> +				     0x1a, 0x33, 0x33, 0x33, 0x52, 0x40, 0x47, 0x38, 0x34, 0x26,
> +				     0x0e, 0x06, 0x7c, 0x61, 0x4f, 0x42, 0x3e, 0x2d, 0x31, 0x1a,
> +				     0x33, 0x33, 0x33, 0x52, 0x40, 0x47, 0x38, 0x34, 0x26, 0x0e,
> +				     0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xcc, 0x76, 0x12, 0x34, 0x44, 0x44, 0x44,
> +				     0x44, 0x98, 0x04, 0x98, 0x04, 0x0f, 0x00, 0x00, 0xc1);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x85, 0x9f, 0x00, 0x6f,
> +				     0x00, 0x54, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11, 0x22,
> +				     0x20, 0x44, 0xff, 0x18, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x87, 0x47, 0x05, 0x05, 0x1c, 0x1c, 0x1d,
> +				     0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f, 0x0f, 0x0f, 0x0d, 0x0d,
> +				     0x13, 0x13, 0x11, 0x11, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x06, 0x06, 0x04, 0x04, 0x1c, 0x1c, 0x1d,
> +				     0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f, 0x0e, 0x0e, 0x0c, 0x0c,
> +				     0x12, 0x12, 0x10, 0x10, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x20, 0x19, 0x6b, 0x06,
> +				     0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x0e, 0x04, 0x44, 0x08,
> +				     0x10, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x09, 0xff, 0xff, 0xff, 0xff, 0xff,
> +				     0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x00, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
> +
> +	msleep(120);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_ON);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
> +
> +	msleep(20);

Most of the comments from the patch 2 apply:
- drop conditions
- use mipi_dsi_dcs_set_display_on_multi(),
  mipi_dsi_dcs_exit_sleep_mode_multi() and mipi_dsi_msleep().

> +
> +	return 0;
> +};
> +
>  static inline struct kingdisplay_panel *to_kingdisplay_panel(struct drm_panel *panel)
>  {
>  	return container_of(panel, struct kingdisplay_panel, base);
> @@ -391,6 +452,34 @@ static const struct panel_desc kingdisplay_kd101ne3_40ti_desc = {
>  	.lp11_before_reset = true,
>  };
>  
> +static const struct drm_display_mode starry_er88577_default_mode = {
> +	.clock = 77380,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 80,
> +	.hsync_end = 800 + 80 + 20,
> +	.htotal = 800 + 80 + 20 + 80,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 20,
> +	.vsync_end = 1280 + 20 + 4,
> +	.vtotal = 1280 + 20 + 4 + 12,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc starry_er88577_desc = {
> +	.modes = &starry_er88577_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 135,
> +		.height_mm = 216,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init = starry_er88577_init,
> +	.lp11_before_reset = true,
> +};
> +
>  static int kingdisplay_panel_get_modes(struct drm_panel *panel,
>  			       struct drm_connector *connector)
>  {
> @@ -514,6 +603,9 @@ static const struct of_device_id kingdisplay_of_match[] = {
>  	{ .compatible = "kingdisplay,kd101ne3-40ti",
>  	  .data = &kingdisplay_kd101ne3_40ti_desc
>  	},
> +	{ .compatible = "starry,er88577",
> +	  .data = &starry_er88577_desc
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, kingdisplay_of_match);
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

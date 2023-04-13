Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6E36E0404
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 04:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6771810EA01;
	Thu, 13 Apr 2023 02:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585EE10EA01
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:17:44 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p8so13565229plk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 19:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681352264; x=1683944264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XzcH2FGOl08HFZvLq7fg5qxkoIepaHQ4FukgMx688Jk=;
 b=gOWuvAiw/ZvvfqD+R8MDOwyGYWTn3B5qj39QZ8QoHVss5kzm89guBxBCR0uqR4ogKJ
 XQ8zZ+gW4/8bPp407bVQIw7aiWyi/N1bcvg6ooZmrQyCzIINsQqE6hopNKujckzVxWHU
 NhpZjIjKhjFg5MwRBHFjhOGqEMeGvBNhHVHwdg0pWn8O+YAuZRnTWkLhzfD0Lgv0w1FN
 tEcnEEht3cEB7aRrrDUdfyWf30L67WBNsQPzm+oZKREc252vG0DmFXJWp3eBVVa9GhvW
 E0seWLo+LphZR8vL1gG6VgcsPYpkkg/RInVQJWlxiAl41xPRkUh+acdTBHvR1If6rU5A
 ZDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681352264; x=1683944264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XzcH2FGOl08HFZvLq7fg5qxkoIepaHQ4FukgMx688Jk=;
 b=AG5LhgH0VoURIgZcVxRyQdNBqgCh94ZXn77vbo1kFo6fXewb5m2F0xbw03EwmQkfQ0
 CWFxLqUnxuAqwU9B0mjLlzlq1PHNlefHJAh14JkorrJZuqxD/S3KVMzW0c35GiohPB19
 LBJdZUSba7ubwfMJDdCconIuFSdew73OVyy69weilIKCr+grpQcrEMruc8t9s6kC3HcH
 +MCn9tjuU1JZIB/PMtm/x75EDlW6m2zuvWOsqkPEZDEugdBaV69I9Y3Jm6BeJTztjyuT
 X6lZtTOUvvn9iHNWxyPtm+O162hJ+uT8+2CJd1vYGHZBaMFUrHg/kXs+r+pijl0NgG/8
 S2uQ==
X-Gm-Message-State: AAQBX9eeZ+iQoDezPbbNv+cYJrzelF2r+xxW9XrDkGwZgiH2le/X4wV7
 XP1dN9DbiAN8+PXsQaZrkV4=
X-Google-Smtp-Source: AKy350ZHPpvDc7QsJM94lFPJrADqw+6R9qxFkznRZmfyqpJieEhL/+HXBqbmS8QzvaLxKVY54G2fqA==
X-Received: by 2002:a17:903:28f:b0:1a6:370c:ce79 with SMTP id
 j15-20020a170903028f00b001a6370cce79mr462529plr.22.1681352263687; 
 Wed, 12 Apr 2023 19:17:43 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a17090282c500b001a4edbabad3sm234301plz.230.2023.04.12.19.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 19:17:43 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:17:37 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 5/5] drm/panel: nt36523: Add Lenovo J606F panel
Message-ID: <ZDdmQS/9diY7PJ4A@Gentoo>
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
 <20230412-topic-lenovopanel-v1-5-00b25df46824@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412-topic-lenovopanel-v1-5-00b25df46824@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 09:46:02PM +0200, Konrad Dybcio wrote:
> Some Lenovo J606F tablets come with a 2K (2000x1200) 60Hz 11" 5:3
> video mode display. Add support for these panels.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 491 ++++++++++++++++++++++++++
>  1 file changed, 491 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index db4b4af13ec1..4bf9f8db26ba 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -13,6 +13,8 @@
>  #include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  
[..] 
> +static const struct panel_desc j606f_boe_desc = {
> +	.modes = j606f_boe_modes,
> +	.num_modes = ARRAY_SIZE(j606f_boe_modes),
> +	.dsi_info = {
> +		.type = "J606F BOE",
> +		.channel = 0,
> +		.node = NULL,
> +	},
The dsi_info just be used to register slave dsi, for single dsi case, can drop
it.

Otherwise looks great, thanks!

Reviewed-by: Jianhua Lu <lujianhua000@gmail.com>
> +	.width_mm = 143,
> +	.height_mm = 235,
> +	.bpc = 8,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.init_sequence = j606f_boe_init_sequence,
> +	.has_dcs_backlight = true,
> +};
> +
>  static void nt36523_reset(struct panel_info *pinfo)
>  {
>  	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> @@ -826,6 +1313,10 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
>  }
>  
>  static const struct of_device_id nt36523_of_match[] = {
> +	{
> +		.compatible = "lenovo,j606f-boe-nt36523w",
> +		.data = &j606f_boe_desc,
> +	},
>  	{
>  		.compatible = "xiaomi,elish-boe-nt36523",
>  		.data = &elish_boe_desc,
> 
> -- 
> 2.40.0
> 

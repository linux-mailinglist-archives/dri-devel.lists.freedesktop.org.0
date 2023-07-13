Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA717518EC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 08:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CCB10E602;
	Thu, 13 Jul 2023 06:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9FE10E602
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689230429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmGT2ryYA5Il9NaZMEsTOIKHMW98c2+QwM/vkVWciFo=;
 b=LeqXQjZqGK+NdYO+yZTh7T6DI74KyoUT3VO4WF+2eEwqQfwyhO+SNNzcimSaQ1W6QIc3ns
 VlmEMo77VyiomeCtVhMnn1MDYswipj/4lpsLc4I8rmz1xWnn6bUs3W09JWGajYmItFFaIZ
 XXPW5kdhUrHa/gx6o63aFoZamzyF3kk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-jE6q3usQNHq7WdCdA9ccqQ-1; Thu, 13 Jul 2023 02:40:28 -0400
X-MC-Unique: jE6q3usQNHq7WdCdA9ccqQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so1881285e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 23:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689230427; x=1691822427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmGT2ryYA5Il9NaZMEsTOIKHMW98c2+QwM/vkVWciFo=;
 b=HLvk7SnqJgdfa+6MU7cgD5JHNJZQX7CjYwdTEs2lvNiURALwc6Eg/LJIRAQYjHLO7M
 d2ebbIBgKpf6IGjv0GnzWot/ONLGi7VnpVQ22nIXOH7aDt98aaTh+nxiXiRAplNQOc+E
 9jTyd7P+ZEI4tMAG4sEZPOpcUxmnYkFe7e5gWfW2zDAasgzZtInG7aWTgLMhnVVQyOTc
 Sfj5g3q7WzwpT9psqEnSHf7CHHmeYgGHvuw0KqutoLzbktWrG9ds05yFM6uDvdziqFgU
 pejM0iEtbW2JbDXiuTE7jcSF/nKLI5T+NA+yErreMG6GdLSZANQV8e9XLT8JFEQ2H5GB
 yRWA==
X-Gm-Message-State: ABy/qLZWDzJZm7G49dd07QvBsNZh0YvoGzCVks8B4IV2aG0q7w+d9W77
 BwUMPrEkdvmvmq2t3lrOzWlnEkCdMMgxyvfBiJz3lrAvZZIqH58hRXX8XF0CMoOJwONpiFnTrPV
 gNnOvSnJiDi24z/itVYzR1bNcZ25H
X-Received: by 2002:a05:600c:280b:b0:3fc:855:db42 with SMTP id
 m11-20020a05600c280b00b003fc0855db42mr639511wmb.34.1689230427010; 
 Wed, 12 Jul 2023 23:40:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG01gXpef4kzQWnpCMUsQFWYNyXU+qfBDt6cPE92pl9mo91XUYrrE98hVWS6F/k1QW02Ew1wg==
X-Received: by 2002:a05:600c:280b:b0:3fc:855:db42 with SMTP id
 m11-20020a05600c280b00b003fc0855db42mr639498wmb.34.1689230426698; 
 Wed, 12 Jul 2023 23:40:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc012000000b003fbd2a9e94asm6918544wmb.31.2023.07.12.23.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 23:40:26 -0700 (PDT)
Message-ID: <bf35a184-62df-ece8-6a08-a22c28481f9d@redhat.com>
Date: Thu, 13 Jul 2023 08:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/2] drm/ast: Add BMC virtual connector
To: tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com,
 dianders@chromium.org
References: <20230712151731.295804-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230712151731.295804-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like my SMTP server has lost the second patch, so I'm 
re-sending the series.

-- 

Jocelyn



On 12/07/2023 17:17, Jocelyn Falempe wrote:
> Most aspeed devices have a BMC, which allows to remotely see the screen.
> Also in the common use case, those servers don't have a display connected.
> So add a Virtual connector, to reflect that even if no display is
> connected, the framebuffer can still be seen remotely.
> This prepares the work to implement a detect_ctx() for the Display port
> connector.
> 
> v4: call drm_add_modes_noedid() with 4096x4096 (Thomas Zimmermann)
>      remove useless struct field init to 0 (Thomas Zimmermann)
>      don't use drm_simple_encoder_init() (Thomas Zimmermann)
>      inline ast_bmc_connector_init() (Thomas Zimmermann)
> 
> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  4 +++
>   drivers/gpu/drm/ast/ast_mode.c | 58 ++++++++++++++++++++++++++++++++++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 3f6e0c984523..c9659e72002f 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -214,6 +214,10 @@ struct ast_device {
>   			struct drm_encoder encoder;
>   			struct drm_connector connector;
>   		} astdp;
> +		struct {
> +			struct drm_encoder encoder;
> +			struct drm_connector connector;
> +		} bmc;
>   	} output;
>   
>   	bool support_wide_screen;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index f711d592da52..1a8293162fec 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1735,6 +1735,61 @@ static int ast_astdp_output_init(struct ast_device *ast)
>   	return 0;
>   }
>   
> +/*
> + * BMC virtual Connector
> + */
> +
> +static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	return drm_add_modes_noedid(connector, 4096, 4096);
> +}
> +
> +static const struct drm_connector_helper_funcs ast_bmc_connector_helper_funcs = {
> +	.get_modes = ast_bmc_connector_helper_get_modes,
> +};
> +
> +static const struct drm_connector_funcs ast_bmc_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static int ast_bmc_output_init(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	struct drm_crtc *crtc = &ast->crtc;
> +	struct drm_encoder *encoder = &ast->output.bmc.encoder;
> +	struct drm_connector *connector = &ast->output.bmc.connector;
> +	int ret;
> +
> +
> +	ret = drm_encoder_init(dev, encoder,
> +				&ast_bmc_encoder_funcs,
> +				DRM_MODE_ENCODER_VIRTUAL, "ast_bmc");
> +	if (ret)
> +		return ret;
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
> +				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   /*
>    * Mode config
>    */
> @@ -1842,6 +1897,9 @@ int ast_mode_config_init(struct ast_device *ast)
>   		if (ret)
>   			return ret;
>   	}
> +	ret = ast_bmc_output_init(ast);
> +	if (ret)
> +		return ret;
>   
>   	drm_mode_config_reset(dev);
>   
> 
> base-commit: b32d5a51f3c21843011d68a58e6ac0b897bce9f2


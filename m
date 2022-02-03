Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA244A8B09
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D210E4FC;
	Thu,  3 Feb 2022 17:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C65710E4FC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643911027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8SVfrF32cFzgZ//D2+hETr6SU460LzNw2xoI6GM/oY=;
 b=GWgqjsGGtqrnGgNU2H1yN5blN5SYVGXwHEvzeBsTwA03PDHmHgZQoQh9CRP0ucdSeyPHFP
 4V8TRNXk0s+6uVp+miAfPqDTF4duRWbocu45GK9WGvnZh52VeggtoUBSx7zdegfjrwAZNF
 LBxZSV3EhLyTPiT5y7efCXDgxikiluM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-WdKFXtq2OrmOb1FTQQ3JyQ-1; Thu, 03 Feb 2022 12:57:04 -0500
X-MC-Unique: WdKFXtq2OrmOb1FTQQ3JyQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a1c4d03000000b003539520b248so1629990wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 09:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w8SVfrF32cFzgZ//D2+hETr6SU460LzNw2xoI6GM/oY=;
 b=2M7H/PAy/RMcYoNX4h09oJd3Wg1/VuJyJDGww7/Y/98dfLPrqv12BPTOux8K9lyYk1
 eze/XL15bd+Vw0MsRkRxx0MjPJ1EXpROgG5ELLwl+/RC3zC2CPOIVv6GlL8ARaDA5C3+
 czJTCJCur9uBUrLiG1P2v+//tHzcFo4oKtc2xQwTxSPQ6matMHo3Q5mls6sujTEs0cqg
 HP460JSRTDNlqetuAW+kD928P7ueSIcauDeJT7laduAXx1mpEmILyuurU8lb/qYobv9K
 OG0Ed4OD2zpA5iBQNLzPIfPFTKxa824rrBNEI+4rxk9OfUCin9BEv9JCwfH19iqWfiTw
 Y1BQ==
X-Gm-Message-State: AOAM530QQExQ8hXkoA9DyN9c0Tg9+PSYbdi4VFEH1W2VSGP6ZWaKtGC3
 KfcPryODCUjF79FBYUt0G+eaALrMaR0Kz4DGMJ9oY9ymbtOeW+ZXfLmdtsOP9KVk8s/IRO6uJVd
 jF3qt8/yftMtLCuHcg9MBTlYr7/kD
X-Received: by 2002:a05:600c:3b92:: with SMTP id
 n18mr11253464wms.86.1643911022939; 
 Thu, 03 Feb 2022 09:57:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz7KzrCudjOhWqTiT64ilUOsKRa/ubF/CjrRsNf4G0RvygVh6cxIfkvnphIxSmv1DVnrYLaw==
X-Received: by 2002:a05:600c:3b92:: with SMTP id
 n18mr11253452wms.86.1643911022743; 
 Thu, 03 Feb 2022 09:57:02 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id j15sm9850232wmq.19.2022.02.03.09.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 09:57:02 -0800 (PST)
Message-ID: <8bf294da-f2fa-2679-b179-3a742dba8280@redhat.com>
Date: Thu, 3 Feb 2022 18:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/8] drm/ast: Move SIL164-based connector code into
 separate helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220111120058.10510-9-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/22 13:00, Thomas Zimmermann wrote:
> Add helpers for initializing SIL164-based connectors. These used to be
> handled by the VGA connector code. But SIL164 provides output via DVI-I,
> so set the encoder and connector types accordingly.
> 
> If a SIL164 chip has been detected, ast will now create a DVI-I
> connector instead of a VGA connector.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_drv.h  | 15 ++++++
>  drivers/gpu/drm/ast/ast_mode.c | 99 +++++++++++++++++++++++++++++++++-
>  2 files changed, 112 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 420d19d8459e..c3a582372649 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -140,6 +140,17 @@ to_ast_vga_connector(struct drm_connector *connector)
>  	return container_of(connector, struct ast_vga_connector, base);
>  }
>  

[snip]

> +static int ast_sil164_connector_init(struct drm_device *dev,
> +				     struct ast_sil164_connector *ast_sil164_connector)
> +{
> +	struct drm_connector *connector = &ast_sil164_connector->base;
> +	int ret;
> +
> +	ast_sil164_connector->i2c = ast_i2c_create(dev);
> +	if (!ast_sil164_connector->i2c)
> +		drm_err(dev, "failed to add ddc bus for connector\n");
> +
> +	if (ast_sil164_connector->i2c)
> +		ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> +						  DRM_MODE_CONNECTOR_DVII,
> +						  &ast_sil164_connector->i2c->adapter);
> +	else
> +		ret = drm_connector_init(dev, connector, &ast_sil164_connector_funcs,
> +					 DRM_MODE_CONNECTOR_DVII);
> +	if (ret)

I think you want a kfree(i2c) here before returning.

And where is the struct ast_i2c_chan freed if the function succeeds ?

With that,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


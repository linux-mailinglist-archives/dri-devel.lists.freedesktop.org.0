Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92DA727C61
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 12:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FEB10E59F;
	Thu,  8 Jun 2023 10:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6B710E59F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 10:10:43 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-977ed383b8aso80557566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686219042; x=1688811042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JJHTuCsEoea12NU1L8aVFWLw5Li+6FBeT87B7EVpk0U=;
 b=hshqQqKhS2lrmEIPaTGyfZ0xo1tLzW5OuF36pfweYlvn/pcwF7jYRNq04H9+23ssfm
 RHApcs/x6bZKx+JK7r1hNNiJiWudXij6IcS2L07dzs7mIp0A9mVK5un82ZKJc2mIR/5z
 LgRV2/FPPkb1hD8S9rzv52rP2t8mM/xxJRIGehiuzgJUM8qZTzKDuN8i97wzJyAThMq7
 e4vzsbtH4sJDQOn8bSMYf2+p1iO5ZwjG6w3X6jGkGZv/DpUd+CN6v9WGIpJPCNmmnWOL
 Ot6ITR0eDAOJsmV2YJtHjmXk4jidDYlPiThY4LyRWb3eAWj5EZAa8s3Et8u3J8YihxRS
 csaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686219042; x=1688811042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JJHTuCsEoea12NU1L8aVFWLw5Li+6FBeT87B7EVpk0U=;
 b=M0+UNEQzIrxaZBREc4eT5pZ4U0aBE6iGSD2vaiOSv3P8BeRyh7m46jYbvAOClePe0/
 PXsZ8gRB13fNTAgq9vKElqkRVEAk24eUjVphYqcmibQT+YKPdIFHJeC3rdztDjfBUkSM
 WuJQ/2B2Lax2djssxqesY47O2YQVfqrDmWxMpBO3o2Yvszdc6kSuxICrUyiMQ0NRR2Im
 eGsnuCYy/JLT+QJD3KIuhT1gxKf97YQ08YmnG/6yTvh16w5rLJ5o3EvveZ70a+Jt427K
 otnFai4MkbhljZwxDYZEACTu9KXvSi1OrxEoR014pm/3Sqs1S/gfNrJfOo4ToEBY8kKD
 MwmA==
X-Gm-Message-State: AC+VfDwr83LOdCdmME2QedNf54qNX2BnNOHVZGsRuouyJ4oSmjvdJJdj
 w9QFO6H8jVmU2NWQRJA6lZ8=
X-Google-Smtp-Source: ACHHUZ5coC8s5m6rUE7HiOKz4pn6a1g+ifnOsD3nW3M/0KYXh9LRR4CX9KrILx/+g+W2KioYH5DzpA==
X-Received: by 2002:a17:907:60cc:b0:96f:136e:eadd with SMTP id
 hv12-20020a17090760cc00b0096f136eeaddmr9129019ejc.66.1686219041847; 
 Thu, 08 Jun 2023 03:10:41 -0700 (PDT)
Received: from [192.168.50.244] (83.8.122.24.ipv4.supernova.orange.pl.
 [83.8.122.24]) by smtp.gmail.com with ESMTPSA id
 n26-20020a1709065e1a00b00978897577c6sm488863eju.44.2023.06.08.03.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 03:10:41 -0700 (PDT)
Message-ID: <5d96d7a6-3f91-0464-17c4-29125ef76bd5@gmail.com>
Date: Thu, 8 Jun 2023 12:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/panel: s6d7aa0: remove the unneeded variable in
 s6d7aa0_lock
Content-Language: en-US
To: Wang Jianzheng <wangjianzheng@vivo.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230608033446.18412-1-wangjianzheng@vivo.com>
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230608033446.18412-1-wangjianzheng@vivo.com>
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 05:34, Wang Jianzheng wrote:
> Remove unneeded variable and directly return 0.
> 
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 102e1fc7ee38..fec0d014fd0e 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -66,7 +66,6 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
>  static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>  {
>  	struct mipi_dsi_device *dsi = ctx->dsi;
> -	int ret = 0;
>  
>  	if (lock) {
>  		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> @@ -80,7 +79,7 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>  			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int s6d7aa0_on(struct s6d7aa0 *ctx)

Reviewed-by: Artur Weber <aweber.kernel@gmail.com>

Best regards
Artur

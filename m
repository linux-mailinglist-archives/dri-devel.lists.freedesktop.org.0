Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9FB25A9B2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 12:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61C16E311;
	Wed,  2 Sep 2020 10:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2900E6E311
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 10:50:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w5so4724257wrp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4YEGJ4xeP54X8AfIblKmCsR+Qg+GVxYfWENSIC9MbPI=;
 b=dAjf8eop/m4swCN+ufD1YIiAasHPcWfVDYZSWcL7+5tjFOzupyXi1dW0VBAcBHx7Ip
 I67rebSw79JnPjZzV5Vgg6mn0tzlO3r8BPBVjQ2Y+3KJ38BHWCINbTCz9bRz/BzDRVUt
 7gtfRHjbb8Hs0fqwvKrojpGU9QOVrvsUOWmZkW9QgacCvxfZwZnzLmq43046cRr1JuSj
 UJf+WxfNizzdv5BW/9TCFwAPAoG5kiYcjc8GuhGa99hN0PfKFwf2o/DeOtr9vD/0fTTR
 MS1aA97L/sNSNJHNtEWTObErikLrXrm+QK6tjqTKVWfzGq7VdooYIIvhqiVFiit4OPqJ
 xnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4YEGJ4xeP54X8AfIblKmCsR+Qg+GVxYfWENSIC9MbPI=;
 b=s1BXpFuWBkDvXdsGBX+wigPfeugYB5Hlq6wJWP8YylVt7c10b7AsC/XQxTXjA8GkSG
 FDJdGVjNaKbXDQpYZqL32RVup2djG4J8B5+TVZ1aD/UMBwpPbwyw+TEupTMKBrKht708
 2V4MOeQqFT8NBtaeMa8XEWFHMTm94WGYOaV/Z3bYw8lDEbE+pxvxXHDYituXO+YU+DgT
 +tTa76s+9w8nDif6Ud6mVlhNG5Dc903oqF2/OZJ85Nx92TcM3guYA/unWx3S7rzWvmu2
 a/nfiBSt9wJv2JCaJ9cTTeaI5/M5OMpnw4F/+jMcUOKw+VEvcjd95EBQ0O1KdFgKdsA6
 XPHA==
X-Gm-Message-State: AOAM5319unY2F4OMswAJLfVNfpU5qGye21xafgN2XOuKldks9tJ0vkvG
 lBpXXSHyxJstOEr2XFnmnd9FYg==
X-Google-Smtp-Source: ABdhPJwEkvMZ7YL54y6LhPrTmHdH9AeQwbYlC31crYopU8VP4ovNadmJ0/wQH/zZZ07ml+NquHvRCA==
X-Received: by 2002:adf:d845:: with SMTP id k5mr6058650wrl.285.1599043813588; 
 Wed, 02 Sep 2020 03:50:13 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v9sm6354615wru.37.2020.09.02.03.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 03:50:12 -0700 (PDT)
Date: Wed, 2 Sep 2020 11:50:11 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 01/24] backlight: Silently fail
 backlight_update_status() if no device
Message-ID: <20200902105011.llxm3zicydqc4xbu@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823104532.1024798-2-sam@ravnborg.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 12:45:09PM +0200, Sam Ravnborg wrote:
> backlight_update_status() may be called from code that does not have
> any valid backlight device. To avoid ifdeffery and too much conditionals
> silently fail if the backlight_device is NULL.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  include/linux/backlight.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 614653e07e3a..190963ffb7fc 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -348,6 +348,9 @@ static inline int backlight_update_status(struct backlight_device *bd)
>  {
>  	int ret = -ENOENT;
>  
> +	if (!bd)
> +		return 0;
> +
>  	mutex_lock(&bd->update_lock);
>  	if (bd->ops && bd->ops->update_status)
>  		ret = bd->ops->update_status(bd);
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

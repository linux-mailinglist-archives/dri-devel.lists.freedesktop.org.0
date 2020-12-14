Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D42D9A12
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 15:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05806E226;
	Mon, 14 Dec 2020 14:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BA26E226
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:36:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x22so13919869wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8/m/yG9nmWATf2pwpEbnHeaYaYLTTFSZowBrAhqsvOw=;
 b=NDcqoZd96wzFTaRwe+9H+XLXhCCJcYOv5EVsUhYk8m1j/nS/oVvP7qz4XCpnp4qD41
 i7DlLOUDaoOzBc6o96g2UfD9MjlfuJJUHNAKzjO2xhe/Odg/q7Aj41nKXQmISvvUKny5
 FWc/R+K1Jx/91m6Uxadrnjg6pitrNqb3/rwH+o7d7YST26CoJRSjiTS128/ZCGfl5ri2
 a+YbW0NOvF9bvKzw/d+gBhaOrCX+VwjogxOc+VHEhSvRY6M4yiPIaXrJfAK384VNSuA+
 CTB38q3FNFLC47BbxhAJCQHXre9jd65GZHKhv+DwMJ4tOaJRsbdd+u3umwxmgZQrhOqM
 p5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8/m/yG9nmWATf2pwpEbnHeaYaYLTTFSZowBrAhqsvOw=;
 b=HIQ+93GX317Z/PGEoDYqj2UmAB0M7qYmVaRcgRcfejJvOHx4wxA4mZEokmHZFsRnCp
 AFZpM03r9NuVHjhrvzOehFGIpUnPgI6oRuFI/Cel3gERN007mKtbr4b8dZWOu2KPCJVF
 Vast/8EVhkTjlCamK8ZxRxsMI5eKgSQbLs6xilFhWRG31gOa+zirgWdI8mkIqY86u+VQ
 lHGSEOHuAcyDDXCLPjNyCOsTxNzfks3ryDKFD19EBjJ372U8b5WD26XJgaNFDyHX+FsY
 ZpFh8GoMgSBr4KqQ5/PqtN+1Yt9JHnNOnDR1eLnnAr68mBLERhr6ofsmuu85x2wnYTK8
 vB4A==
X-Gm-Message-State: AOAM532JT0eF+bqw6GjU7AuqIHQEsW+sflw38IzET0PGScyoRYQ76iA8
 HrppIiwasEpn7TFupACM7htbbg==
X-Google-Smtp-Source: ABdhPJwu+cElapZXFY4A8uSyJOR+TrTmuMMBMIKgd17hiIKGGfvZB23aZNn8UqcZ7iK9v1o9eV2+wA==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr28276897wma.186.1607956595296; 
 Mon, 14 Dec 2020 06:36:35 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w189sm19701366wmg.31.2020.12.14.06.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:36:34 -0800 (PST)
Date: Mon, 14 Dec 2020 14:36:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] backlight: sky81452-backlight: convert comma to
 semicolon
Message-ID: <20201214143632.oiqmvpkai7kurc2d@holly.lan>
References: <20201214133458.3729-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214133458.3729-1-zhengyongjun3@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 09:34:58PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Weird! I guess it was harmless but still seriously weird ;-)

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks!


> ---
>  drivers/video/backlight/sky81452-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> index 8268ac43d54f..c95e0de7f4e7 100644
> --- a/drivers/video/backlight/sky81452-backlight.c
> +++ b/drivers/video/backlight/sky81452-backlight.c
> @@ -291,7 +291,7 @@ static int sky81452_bl_probe(struct platform_device *pdev)
>  	}
>  
>  	memset(&props, 0, sizeof(props));
> -	props.max_brightness = SKY81452_MAX_BRIGHTNESS,
> +	props.max_brightness = SKY81452_MAX_BRIGHTNESS;
>  	name = pdata->name ? pdata->name : SKY81452_DEFAULT_NAME;
>  	bd = devm_backlight_device_register(dev, name, dev, regmap,
>  						&sky81452_bl_ops, &props);
> -- 
> 2.22.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

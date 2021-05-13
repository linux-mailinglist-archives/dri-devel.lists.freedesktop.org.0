Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2423637F5BC
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 12:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CB56ECDB;
	Thu, 13 May 2021 10:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081996ECDE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 10:37:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1112288wmy.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8MRW+RUNJca4AXa5eHgAo8GAC0ZpSS8t7RdPzv49j74=;
 b=B0gbejrpLRfJnc7OaHsvMS1QG7k7XLm1B6NA5cayaUI06UjWco1rLnhAee8TPlEsR9
 79AZv5M633+8rl0sKu5uH7Al0KyzlWejVWvOm2eTc4HRIOhDOynreJ9KATnRnd1BsOCt
 eSp/VhInDLsmakAqEHgBYSDOckMIGwrLNo3ufADJrB+ElQsMpTLL6zUbSXuhm62XSyII
 Eqc1UT+YS71HYtLU977IyIbFDY+y1ZNvApNRrXJcbYCMjrZYxdGyclZaSu6KaqY2zrK5
 nt2hAujitIAuD47AfiArnounyddMEmb3fMh8MndjQMENjuL9G4ilVYa13saRTEgJN0Qy
 j1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8MRW+RUNJca4AXa5eHgAo8GAC0ZpSS8t7RdPzv49j74=;
 b=E396hqsCm8a/8CRSX0cakddEyvwmKbStPz5tjiwnSuUVoWB+YAZgOQy/LdjoeggzFa
 fO38wxbuzR5aDPzIK8HilXUhKAK1lN++no8q9LrbOHiCc+5BnUM5Fd4BU1nSlKejUYOm
 jhsxVofkyy1g69BMKuViakeWYmmQtzfDITCMFsYnXPrd/9y6AZI/pXURj4AZJOmJJSHJ
 PUnKz08Dw9xhlMMKfDUenj29JKUlB7gMarREYjd/mjsa18jKYwcHiIMAAGo6LuCSXiHz
 +0zJk1L7Xg2EwZPMmV+4YdKaeEHFuCyqPKbIzKlz6uP64VKnAGx/8gvd84wjulVYHQSR
 D41Q==
X-Gm-Message-State: AOAM531QeyE2QWn+oJ78KKUMT/qF4CVS9T6aglJE7IX7WTfBCVjllGjn
 AkyS8irBcoSrYVj8NhveQ8R4hQ==
X-Google-Smtp-Source: ABdhPJxkdOua6E6ia1U9hG/mRkJmaLRXHDGr+I8c7GOqimHlksaxK1gjHzcXbYjFWt/DNACfe855qw==
X-Received: by 2002:a7b:c252:: with SMTP id b18mr43936215wmj.32.1620902267606; 
 Thu, 13 May 2021 03:37:47 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id m6sm2417459wrp.29.2021.05.13.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:37:47 -0700 (PDT)
Date: Thu, 13 May 2021 11:37:45 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] backlight: lm3630a_bl: Put fwnode in error case
 during ->probe()
Message-ID: <20210513103745.2dzawk7c63ku2vz6@maple.lan>
References: <20210510095716.3302910-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510095716.3302910-1-andy.shevchenko@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dan Murphy <dmurphy@ti.com>, Lee Jones <lee.jones@linaro.org>,
 Brian Masney <masneyb@onstation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 12:57:16PM +0300, Andy Shevchenko wrote:
> device_for_each_child_node() bumps a reference counting of a returned variable.
> We have to balance it whenever we return to the caller.
> 
> Fixes: 8fbce8efe15cd ("backlight: lm3630a: Add firmware node support")
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/lm3630a_bl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index e88a2b0e5904..662029d6a3dc 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -482,8 +482,10 @@ static int lm3630a_parse_node(struct lm3630a_chip *pchip,
>  
>  	device_for_each_child_node(pchip->dev, node) {
>  		ret = lm3630a_parse_bank(pdata, node, &seen_led_sources);
> -		if (ret)
> +		if (ret) {
> +			fwnode_handle_put(node);
>  			return ret;
> +		}
>  	}
>  
>  	return ret;
> -- 
> 2.31.1
> 

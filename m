Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C82E9392
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 11:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586C589C8F;
	Mon,  4 Jan 2021 10:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE0889C46
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 10:46:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w5so31646725wrm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 02:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5cnKwGKMAW2uD7Mf320R7/SnXF3WX1LG6Qh3O1drZ/Q=;
 b=hmCCGppBxS67+7BXqQG7Lw+tVho3R1OcBqp3hz5toxuy0QJeDKHzxhOHn/OPB9LuaB
 TyRcrHvXbhdEl/+7VTeQDe1BX1fDZqTBfmYqeTSRNKfY8Iel4EnMnLHyDDkN8fNQTZtv
 qoS7n7uPI/VlCfls/vUHdmk8+niCQIE8MyIRw9AQTPN4XlxsFdX3SEVmmoWUZ6B2JsXX
 oPUpO1OI7PdcZphmKDlODxsyJmOXS6kmQx8Un4U4NBdwvlb7DtInP/gWNfpmZ3GTCCyu
 yR1UNiR2nUC8UDLCULzVX+XQX/zN9uGPjEAuBM07HcHQbZ/gd9AtQbYGnTUXxCHq7nqR
 zvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5cnKwGKMAW2uD7Mf320R7/SnXF3WX1LG6Qh3O1drZ/Q=;
 b=ArAjr6MO7tC6pXVaAy8YUdzkLsalqkZc82IJwR3+jKd5t6FsIjX9sSqvKiaycMy08J
 ExlrNPfBIW83FEna/l6Oal1/UTH86OVXLLeGVRyfbNzoQwoywVZkw+N7NFUOZDf6Yyjn
 2FNMziKmHz2mWnubN1TDIMGGX5Gb+AilHL5ORG8PnkJZz5QqJ9c+gvm57Q4q55335OhV
 /npG4NAlw94Vnsxonk1QvP1O0Qanl1S25p3P4bFgPkiMTgSYpX6AQ8ioX0nmjhcpH9vM
 MGJrDFf97KuFM5ImxlhAMHyog6bRDHrT0mh6dhVEc9r90m0V/7kpd5q6s/VEjTi3jtLC
 2H1Q==
X-Gm-Message-State: AOAM530cZIybuf5Px/HOxnQXNuvr3HdETPf5fhbIGuctb0wP50RaL0Mg
 gMpWZMA1Wt+a7PQAgCz7Sn94lw==
X-Google-Smtp-Source: ABdhPJxLg9y2ii+HtYdwO5mHHkoRyLpzpRo5RBXbyYGGjZWmmsW9YQQWIhm9fV2y95zhm1wlI5iR0Q==
X-Received: by 2002:adf:e452:: with SMTP id t18mr76358986wrm.177.1609757203325; 
 Mon, 04 Jan 2021 02:46:43 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o23sm95805633wro.57.2021.01.04.02.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 02:46:42 -0800 (PST)
Date: Mon, 4 Jan 2021 10:46:40 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH v2 -next] video: backlight: use DEFINE_MUTEX() for mutex
 lock
Message-ID: <20210104104640.2fe5lmi6hljb6rgr@holly.lan>
References: <20201224132601.31791-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201224132601.31791-1-zhengyongjun3@huawei.com>
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

On Thu, Dec 24, 2020 at 09:26:01PM +0800, Zheng Yongjun wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/video/backlight/backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 537fe1b376ad..d7a09c422547 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -64,7 +64,7 @@
>   */
>  
>  static struct list_head backlight_dev_list;
> -static struct mutex backlight_dev_list_mutex;
> +static DEFINE_MUTEX(backlight_dev_list_mutex);
>  static struct blocking_notifier_head backlight_notifier;

Why do we want to convert one of these variables to use a
static initializers but leave the other two unchanged? Surely they
should all be changed.


Daniel.


>  
>  static const char *const backlight_types[] = {
> @@ -757,7 +757,6 @@ static int __init backlight_class_init(void)
>  	backlight_class->dev_groups = bl_device_groups;
>  	backlight_class->pm = &backlight_class_dev_pm_ops;
>  	INIT_LIST_HEAD(&backlight_dev_list);
> -	mutex_init(&backlight_dev_list_mutex);
>  	BLOCKING_INIT_NOTIFIER_HEAD(&backlight_notifier);
>  
>  	return 0;
> -- 
> 2.22.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

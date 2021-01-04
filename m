Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD92E9319
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 11:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BDA89496;
	Mon,  4 Jan 2021 10:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2464F89496
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 10:08:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v14so17911786wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 02:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=miG7CO4g5j20n9mrQMJx+RS21ZtCLqOgtOcLQw9KSDs=;
 b=Lg7fUwr3AMMbu21IW1G8pugaRA5SNCJaW71dzVrsNi0eLfCFI6DLso9TPduv3Fwl+d
 F8LBc9rpDsiZlgcDymsDqFXHeGQ9r79AQg0D8eJtYMk+fRn4gqtUSNEW4zSUb4/s4UjB
 orcsSCCOenu3XQzjy1ErOHJIZAOdGEJ0t7uSFKz65w56ete2sthEifuLASHttKbuRRma
 paMnaDaig0mM0Qmd536zabVBAHcl9UN2JmSKpMU5UGtvh/aQGTcL7X24uRO6mYjwJdwW
 LQwH9V1M3c7Ky/qU9v0QCX1PAOJPuRZolAzh7zseO9iVcUu0SIVFcSPqQsWkkpbxubSu
 Rzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=miG7CO4g5j20n9mrQMJx+RS21ZtCLqOgtOcLQw9KSDs=;
 b=npUKrkLQhsSbuRHnWZFonBuTE4hfiKgkH4NlQFjPtuqNqodbgSOptd/Fz5yqrrkqhk
 7W31cDjQ9OiBGcTVjV2q/0hJUcEuOwIZy8/d5AMQU1x/yHuWD7rgA64GeXtnm3dYEP/q
 Y1Q+hwaT4nxZ4iRyZ3jBw0g/41K9makmvFXQsLeN05ioMLYv/SVIEjuetB8G/YPj8Tc/
 dkfzMRX9oFxyjtwvuaKSLOvuKiPO4MZgYdJtqc8a97wlJsn2zOsel7b5dGWW+V7h1Bq4
 /2wior77xrt+eynMquNySkRxzaxOUVI1Ld6xOb4MtI+GD3QAuzjIu6ORL9MUNVJkETjn
 ItTg==
X-Gm-Message-State: AOAM531iQpHvCwAzJ5g9fWq5ZAUnLazg1fYxwmkeXBBYQY6+v1Xrv9ho
 fb1F/jzuDTTjb2m0PKpXOot1xQ==
X-Google-Smtp-Source: ABdhPJzf1aX815VmR6wjjt7zvuM5RGyRKlwUh6d84TKCy6s8zu4m42oY9tKbexlZo9VISvD5GidvuQ==
X-Received: by 2002:a1c:7d58:: with SMTP id y85mr26041528wmc.50.1609754878758; 
 Mon, 04 Jan 2021 02:07:58 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o23sm95611006wro.57.2021.01.04.02.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 02:07:58 -0800 (PST)
Date: Mon, 4 Jan 2021 10:07:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] video: backlight: use DEFINE_MUTEX (and
 mutex_init() had been too late)
Message-ID: <20210104100756.sjpzzchy4tklt2rd@holly.lan>
References: <20201223141035.32178-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223141035.32178-1-zhengyongjun3@huawei.com>
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

On Wed, Dec 23, 2020 at 10:10:35PM +0800, Zheng Yongjun wrote:
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Can you explain the Subject for this patch in more detail?

If this patch is required to correct a bug then it looks to me like it
is incomplete.


Daniel.


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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDBC354F0F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 10:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488466E0A0;
	Tue,  6 Apr 2021 08:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1259E6E0A0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 08:51:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id o19so15577176edc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+76LEhmQVtVbwUuq2qvswXIMQNELjwa8jYT8LCkNp0c=;
 b=WvVa+ovd5StppJREwAr3JiPc2mlSsQbd5suTkS1Au/QZZj3L38tBsrNfhD138VVWk9
 jC2x2lMbs5yA7DAzlNHjS5LyubDXQcDfarR/VwksA6QvIVnh2akqy6TJxhPMDZFkbRl2
 Re6bhZZfyeudUfXg/bOMkINySRPr70RRgG5bjuYRRFS5T68bysvRpkKb2pspN/Db9VWg
 AcSyRVWwn3P+fiNH60tEVJRHygrwm1BJRmYFk1xZ478DzjPs8u3MTR0YIj2cxVB1JPzm
 tE5cWIH7CNzvnRyRY2g1d4HTBil2JdXSRopDKOlpHxBTR/TFciko8e6mZ04z9fGzF9et
 dwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+76LEhmQVtVbwUuq2qvswXIMQNELjwa8jYT8LCkNp0c=;
 b=ujF5/gm8J5YRqA1qHVj1kfiTv/5PpZnZmwvcTKxoNDj/Rvfx7ovx7DUkjJYdXwyNmH
 8nAsUrIVmZsraer/or+9/WbV6Q7nBe+PgxqgmM+oAA863koVumceM6QVdTo0ZAl3yN2N
 /BdfRhXtCK9Pwexes3HRV/1qaSwqo1Y3gg5ki1yQ/+0MTMjT2n+/3qzrE2zagzKMJXuU
 UR153GmdVZkDyN3vm4X7W5jypbUEsOLrqYh0GqhLMSu8wIfqignRfFTSTxL43+pfaCXm
 57c1eMklWziLbK/UecEg7qaV0OLdPdynwtzaeM52NQWf51tlcs82X5PgcZpZ8eWp1Iwd
 tyzA==
X-Gm-Message-State: AOAM530i/dsiXkdZ2GT/7E5UP63dnkK8FUfRSKy9vc5ke/IPgOwyXvUC
 3OF+ZBWvRiOp0Dkkk1prZehXFw==
X-Google-Smtp-Source: ABdhPJynT1SrcWhMhtjcMzeeIqE/f6+E7hQFk+hzymJ7Sy/E1j8F1S3HLkRGIbRau4xfLmAp5pZewA==
X-Received: by 2002:aa7:d687:: with SMTP id d7mr35827939edr.118.1617699102678; 
 Tue, 06 Apr 2021 01:51:42 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w1sm5393531edt.89.2021.04.06.01.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:51:42 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:51:40 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] backlight: backlight: Use DEFINE_MUTEX() for mutex
 lock
Message-ID: <20210406085140.b7zffcrkdquxxsxs@holly.lan>
References: <20210405101440.14937-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210405101440.14937-1-zhengyongjun3@huawei.com>
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
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 05, 2021 at 06:14:40PM +0800, Zheng Yongjun wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

This patch looks like a resend of this one (but with a different revision
number):
https://lkml.org/lkml/2020/12/24/229

A resend should always maintain the version number and be clearly marked
as a resend.  In this case, there is also a pending review comment that
you have ignored.  Given I also clarified when you asked (off-list) for
additional details I'm very surprised to see this patch circulated again
without modification.

I have repeated the feedback below.


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

On Mon, 4 Jan 2021 at 14:19, Daniel Thompson wrote:
: the purpose of backlight_dev_list_mutex is (as the name suggests) to
: protect backlight_dev_list. It makes no sense to initialize these
: variables from different places within the code. It just makes it
: harder to reason about the lifetimes of the variables.
:
: To be clear, switching over to static initializers is a good change,
: but please change all three in one patch.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

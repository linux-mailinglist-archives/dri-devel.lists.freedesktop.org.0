Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619594A7BD5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E853010E128;
	Wed,  2 Feb 2022 23:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8E510E128
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:45:31 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id y23so1321656oia.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 15:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gmc7on1XdfmDVEczUvMEGVY41ykXlSf/a2fAN6R0muI=;
 b=brWQKsEDHGv7zN10fDqDD/i4dQdznMFXRz1wJgyWtfisav3Iu+2BaKC6k9hBlu7hpE
 KHiwQezaZeXjPEoXWAB9nBme7DPzx+O0TB7xtAepZzUdauBvv2sQFuJIWNW7Ieu9fdoN
 zTvMBYLkUQB1T8piBEpMpZ8VFc+X7tQf6fRN0imAoirf21LwsJ70QwZ5R3SNtdHfBaEm
 DHgXgrYXTccMIHPF0w56qGYVZFCK157tLyRmk9F0y1xUX3Hv+b42HMIW6lMNqHPFxUUq
 RRJcMxPHYu5MBMU067G2QFszcmv0bUKh3IV48hQhy2XtsYW66vEcv/SMqzFrmzgzgWZg
 o/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gmc7on1XdfmDVEczUvMEGVY41ykXlSf/a2fAN6R0muI=;
 b=42sBYj0uuSh7aUPOBVqUFld0Rl3QL2+JEpU+3dHF8wjDx+125ITrdlTRR0ipXj4gAL
 +P1LR3nI7dJn627iRZiZjHArqTYhCqtphSkOMiCbjyXN7NzoIi8AjB+EJaR8TgD3z9v+
 kNE4dsxqJRzNUgVRq9ifzWRMpw9L3oROCx5O2qy5+2yQCaoavzbS4AOIOwynnRqnXTb7
 SdjjWIQBjDzj+M5hHm4NEvuA1P4XSDBNG8wlVfgW3qTnWq5VXofJyMI3R/l9+P3NuvBj
 M30LLM06Vish0eF/e/HhkDz5Yir6WoIRowrUjTByQs3JFoYUlk9eyYTOcOXSfdy2IMTE
 T6mA==
X-Gm-Message-State: AOAM530UaHp3Kw3cwZRcYD6/5WPJHTZlTQxDqEWTbI13nQ9Lu/ftFfJt
 ZZagOmZEMP8npPEd1ZV41/8=
X-Google-Smtp-Source: ABdhPJxa3hIoIva8oqb851CRPaOreRHKX0Nl2x/0mw/4Lm6YleBnvUwwVDU3jmz6lCVYeSGCV3b43Q==
X-Received: by 2002:a05:6808:1406:: with SMTP id
 w6mr6110634oiv.330.1643845530789; 
 Wed, 02 Feb 2022 15:45:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k19sm17579735oot.41.2022.02.02.15.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 15:45:30 -0800 (PST)
Message-ID: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
Date: Wed, 2 Feb 2022 15:45:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5] fbdev: fbmem: Fix the implicit type casting
Content-Language: en-US
To: Yizhuo Zhai <yzhai003@ucr.edu>
References: <83e46d8d-ec7a-6cbd-010e-7f50f88dcf96@I-love.SAKURA.ne.jp>
 <20220202233402.1477864-1-yzhai003@ucr.edu>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220202233402.1477864-1-yzhai003@ucr.edu>
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 15:33, Yizhuo Zhai wrote:
> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
> and in "case FBIOBLANK:" this argument is casted into an int before
> passig to fb_blank(). In fb_blank(), the comparision
> if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
> "arg" is a large number, which is possible because it comes from
> the user input. Fix this by adding the check before the function
> call.
> 
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>   drivers/video/fbdev/core/fbmem.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 0fa7ede94fa6..d5dec24c4d16 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1162,6 +1162,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>   	case FBIOBLANK:
>   		console_lock();
>   		lock_fb_info(info);
> +		if (arg > FB_BLANK_POWERDOWN) {
> +			unlock_fb_info(info);
> +			console_unlock();
> +			return -EINVAL;
> +		}

Is it really necessary to perform this check within the lock ?
arg is a passed in value, and FB_BLANK_POWERDOWN.
It seems to me that

	case FBIOBLANK:
		if (arg > FB_BLANK_POWERDOWN)
			return -EINVAL;
		console_lock();
		...

should be sufficient.

Sorry if I missed some previous discussion; this is the first time
I looked at this patch.

Guenter

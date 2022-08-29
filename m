Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6305A44E6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E6810F0EA;
	Mon, 29 Aug 2022 08:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B69B10F0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 08:22:00 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id se27so6438706ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 01:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=dAu938+Oc5mmzjcZqeDNo0n6Ic/OC5Iebo5+bvbeIlQ=;
 b=S05WLIaYvLEStJ3gGMMKH52lOiWEJgFv0Dd+lh4rPi32bLBExEI1pWbMaWpoumXNRm
 5W9dwUGD8Wdlj2Jo9Wc3KGi/xMitspg0eiOtIcENPT5syIqaKdTtBbkcFtfg9yOIEMRk
 m1LepqzD1QgP3GnulESmegs1N0PqBEetmKHoxM8Z6yMDrlQGVW5KPfJ5J8dQKSUQ87+v
 NpZFktqx+d4D5WpkiQGrPB1HU1SmbOcM3Xl8wJBp5CvMjVhLvfa+DjryG+k2gylmFyeU
 yBBo5NebURxq1eu70bi2pRj9hRO1v+OG7XbecTfIQPIrADFLcAOxJFtXi8zq4/1ERAJL
 77AQ==
X-Gm-Message-State: ACgBeo3UjXZTzbrmxP+8fESRxHwG0wH4mpAJnHX+mtN4kPqPEj8ZRMjJ
 FllJsxd0bE4z+ZJ8Rdwna8k=
X-Google-Smtp-Source: AA6agR4Ybr2UgIEU+qrHAzGwv5MpAVbR6OPx5lPWEIs541g91T5ruAA8qLZAUON8aPyJBiz2vvRqlQ==
X-Received: by 2002:a17:906:ee86:b0:741:89bc:27a1 with SMTP id
 wt6-20020a170906ee8600b0074189bc27a1mr2951197ejb.725.1661761318644; 
 Mon, 29 Aug 2022 01:21:58 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 fh10-20020a1709073a8a00b007307d099ed7sm4130572ejc.121.2022.08.29.01.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 01:21:58 -0700 (PDT)
Message-ID: <3746264c-adb1-80b4-02d2-13f0790fe322@kernel.org>
Date: Mon, 29 Aug 2022 10:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] tty/vt: Remove printable variable
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20220826202419.198535-1-daniel.vetter@ffwll.ch>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220826202419.198535-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Yangxi Xiang <xyangxi5@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, nick black <dankamongmen@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26. 08. 22, 22:24, Daniel Vetter wrote:
> Every since the 0.99.7A release when console_register() was introduced
> it's become impossible to call vt_console_print (called
> console_print() back then still) directly. Which means the
> initialization issue this variable protected against is no more.
> 
> Give it a send off with style and let it rest in peace.

FWIW:
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

In hopes, nothing breaks.

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: nick black <dankamongmen@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Yangxi Xiang <xyangxi5@gmail.com>
> Cc: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
> ---
>   drivers/tty/vt/vt.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index ae9c926acd6f..4d29e4a17db7 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -157,7 +157,6 @@ static void set_palette(struct vc_data *vc);
>   
>   #define vt_get_kmsg_redirect() vt_kmsg_redirect(-1)
>   
> -static int printable;		/* Is console ready for printing? */
>   int default_utf8 = true;
>   module_param(default_utf8, int, S_IRUGO | S_IWUSR);
>   int global_cursor_default = -1;
> @@ -3085,8 +3084,6 @@ static void vt_console_print(struct console *co, const char *b, unsigned count)
>   	int kmsg_console;
>   
>   	/* console busy or not yet initialized */
> -	if (!printable)
> -		return;
>   	if (!spin_trylock(&printing_lock))
>   		return;
>   
> @@ -3537,7 +3534,6 @@ static int __init con_init(void)
>   	pr_info("Console: %s %s %dx%d\n",
>   		vc->vc_can_do_color ? "colour" : "mono",
>   		display_desc, vc->vc_cols, vc->vc_rows);
> -	printable = 1;
>   
>   	console_unlock();
>   

thanks,
-- 
js
suse labs


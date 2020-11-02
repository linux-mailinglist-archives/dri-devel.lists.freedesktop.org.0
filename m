Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8FB2A2755
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F72E6E456;
	Mon,  2 Nov 2020 09:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5927F6E456
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:47:59 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id i19so6996110ejx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 01:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aBL58c34rn6nb4fMXeoXHFwH4EN0oABK7+YoRvnww4A=;
 b=i0PlaWO6nsL7hQ3BezmY0c3yF31xLO6WLjp2AskC095LwrTgU5GjOnUPq6Z9SkKufQ
 q1G4NTnaHOECGycKSllzVm6LOEf0BPrlkhsiL0lZd93PTiXsoZA+e0PnsGuVuJWqMkvl
 MOvCo68/HSYkTdVczrnhdLTGNANtNyGN1poz0Ru2aYCAQ5/EJ+GE76e9duGNwjKSDgj4
 M9jjgbVbp2PcaK/x2xFEZB/8pZ2mAy5LzuUafyioza7R2RyFTaaXEJ6rf7mCeWOjQ2hu
 P55CS9YrAVs8pPycfXGkAQ1i+RtHs2cmG0zgmSjYvpe+ZyZHqCfb1eThaGxUxRdrgJGF
 wmiw==
X-Gm-Message-State: AOAM532Yn2T4haGTznZ62hqyDgvrFaLLQljN8XxyF18yII2VjAFcXvlK
 NPMKgxeZZrCOhPaDmMkIr14=
X-Google-Smtp-Source: ABdhPJyT6Zvze4YHMIYPFL++Xloau/cxO3dOk0KGmbVTqK3nh34aV7jQ6EYhRNwau95TEnaQlTZSvQ==
X-Received: by 2002:a17:906:580e:: with SMTP id
 m14mr14018843ejq.237.1604310477608; 
 Mon, 02 Nov 2020 01:47:57 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id e13sm8525101ejh.65.2020.11.02.01.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 01:47:56 -0800 (PST)
Subject: Re: [PATCH v2 1/2] console: Remove dummy con_font_op() callback
 implementations
To: Peilin Ye <yepeilin.cs@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <a8157089-bc72-c409-c7cc-2fd7eb087ebc@kernel.org>
Date: Mon, 2 Nov 2020 10:47:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02. 11. 20, 10:36, Peilin Ye wrote:
> `struct console_font` is a UAPI structure, thus ideally should not be
> used for kernel internal abstraction. Remove some dummy .con_font_set,
> .con_font_default and .con_font_copy `struct consw` callback
> implementations, to make it cleaner.

ESEMANTIC_ERROR.

1) What do you refer to with the last "it"?

2) What's the purpose of mentioning struct console_font at all?

3) Could you clarify whether you checked it is safe to remove the hooks?

4) All the hooks now return ENOSYS for both consoles (and not 0). Is 
this intentional?

I know answers to the first 3 questions, but you need to elaborate a bit 
in the commit log to connect those sentences. Esp. for people not 
dealing with the code on a daily basis. Ad 4) I am not sure.

> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>    - [v2 2/2] no longer Cc: stable, so do not Cc: stable
> 
> Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/
> 
>   drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
>   drivers/video/console/dummycon.c        | 20 --------------------
>   2 files changed, 41 deletions(-)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
> index c63e545fb105..dfa0d5ce6012 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb_con.c
> +++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
> @@ -1345,24 +1345,6 @@ static int sisusbdummycon_blank(struct vc_data *vc, int blank, int mode_switch)
>   	return 0;
>   }
>   
> -static int sisusbdummycon_font_set(struct vc_data *vc,
> -				   struct console_font *font,
> -				   unsigned int flags)
> -{
> -	return 0;
> -}
> -
> -static int sisusbdummycon_font_default(struct vc_data *vc,
> -				       struct console_font *font, char *name)
> -{
> -	return 0;
> -}
> -
> -static int sisusbdummycon_font_copy(struct vc_data *vc, int con)
> -{
> -	return 0;
> -}
> -
>   static const struct consw sisusb_dummy_con = {
>   	.owner =		THIS_MODULE,
>   	.con_startup =		sisusbdummycon_startup,
> @@ -1375,9 +1357,6 @@ static const struct consw sisusb_dummy_con = {
>   	.con_scroll =		sisusbdummycon_scroll,
>   	.con_switch =		sisusbdummycon_switch,
>   	.con_blank =		sisusbdummycon_blank,
> -	.con_font_set =		sisusbdummycon_font_set,
> -	.con_font_default =	sisusbdummycon_font_default,
> -	.con_font_copy =	sisusbdummycon_font_copy,
>   };
>   
>   int
> diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
> index 2a0d0bda7faa..f1711b2f9ff0 100644
> --- a/drivers/video/console/dummycon.c
> +++ b/drivers/video/console/dummycon.c
> @@ -124,23 +124,6 @@ static int dummycon_switch(struct vc_data *vc)
>   	return 0;
>   }
>   
> -static int dummycon_font_set(struct vc_data *vc, struct console_font *font,
> -			     unsigned int flags)
> -{
> -	return 0;
> -}
> -
> -static int dummycon_font_default(struct vc_data *vc,
> -				 struct console_font *font, char *name)
> -{
> -	return 0;
> -}
> -
> -static int dummycon_font_copy(struct vc_data *vc, int con)
> -{
> -	return 0;
> -}
> -
>   /*
>    *  The console `switch' structure for the dummy console
>    *
> @@ -159,8 +142,5 @@ const struct consw dummy_con = {
>   	.con_scroll =	dummycon_scroll,
>   	.con_switch =	dummycon_switch,
>   	.con_blank =	dummycon_blank,
> -	.con_font_set =	dummycon_font_set,
> -	.con_font_default =	dummycon_font_default,
> -	.con_font_copy =	dummycon_font_copy,
>   };
>   EXPORT_SYMBOL_GPL(dummy_con);
> 


-- 
js
suse labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

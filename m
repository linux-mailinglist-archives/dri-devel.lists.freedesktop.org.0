Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF04A7D3F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 02:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0186989B62;
	Thu,  3 Feb 2022 01:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E8310E1FE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:07:40 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q186so1643395oih.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 17:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3/2gr7P7TIioSsDPZqtUEHSC/S0NWVJIhuBQUzqg5s8=;
 b=n9WlvJIYgvnX5s9E2Jwr/ZPDLPuRFfX3txro5PAcZTzBjBh0xUsP8cPSVLQ/pQ6ESt
 uQ5JMbpx7srsQ1m3zPmv2LdQVFGhqAVMbluoK2+Lu9BjrEg3KnwXdxCDtTCinJQUUg2e
 OvJg7W9ExztLW0R4M0wsdRENlZTxqVkoGf3qvQXozC4WdGO1hRToBOoOkJrnlhlPbfiZ
 3NoXmk3WVZvrMV0794ZbVKexYgfoESZPoe5t80LEHEuqShhI//Bltoo8HSBTAFYzlLFM
 91dn4kzlMX/UrbOyZ9CeVAlpyDonFUmTD2lDGihP31yZM4u9lHywW0Slsk4bu1j+7Lw1
 SxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3/2gr7P7TIioSsDPZqtUEHSC/S0NWVJIhuBQUzqg5s8=;
 b=Cj8ChXszO3A0EqKLo7PPbnO5g9p8COq8KnAJI82Md8iwSuAgV7SLFVwzysRw7lUNK3
 GfhneDnulLXSmjp4b+6Jw7CNDrEnM0ieuco3cIwAeYiVBQW5O5sMszMEGjqN/yo4Te9D
 FOGFSHCdlu9zOePogFXgo04pd9OGahr166T5wRDqy/pygqBPIt7s1NNvor1F5zhor2ep
 lns83Jai9df38OgCKaL2w9XWGtiK4j88asLwocT6HjK6oL985h6+/ExkAF17wJPZERR0
 iFnNs3vqY7/+eyTgxNbIUWnRbpmVklI+a+CBU/045uPMxEr1ENM4XRaaOh/uK/OroZNK
 2n7Q==
X-Gm-Message-State: AOAM5315fYMPd6Za74w5YnXoPLQbTlMYqzm9neaY1LZYtFMeOSomrsJr
 b5HRn3HXub7x4RooMmDWVKY=
X-Google-Smtp-Source: ABdhPJxv07d1xSlLJoA8oCdawgQbico73dhVB2TOBe+Cu76BVRLpQ2jagVv5QaP8K81yyFA+0SLWsw==
X-Received: by 2002:a05:6808:d4f:: with SMTP id
 w15mr6402342oik.42.1643850459390; 
 Wed, 02 Feb 2022 17:07:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m26sm15033837ooa.36.2022.02.02.17.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 17:07:38 -0800 (PST)
Date: Wed, 2 Feb 2022 17:07:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Subject: Re: [PATCH v6] fbdev: fbmem: Fix the implicit type casting
Message-ID: <20220203010737.GB2544812@roeck-us.net>
References: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
 <20220202235811.1621017-1-yzhai003@ucr.edu>
 <20220202235811.1621017-2-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202235811.1621017-2-yzhai003@ucr.edu>
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

On Wed, Feb 02, 2022 at 03:58:09PM -0800, Yizhuo Zhai wrote:
> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
> and in "case FBIOBLANK:" this argument is casted into an int before
> passig to fb_blank(). In fb_blank(), the comparision
> if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
> "arg" is a large number, which is possible because it comes from
> the user input. Fix this by adding the check before the function
> call.
> 
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

On a side note, change logs would be useful.

Guenter

> ---
>  drivers/video/fbdev/core/fbmem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 0fa7ede94fa6..13083ad8d751 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1160,6 +1160,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  		ret = fbcon_set_con2fb_map_ioctl(argp);
>  		break;
>  	case FBIOBLANK:
> +		if (arg > FB_BLANK_POWERDOWN)
> +			return -EINVAL;
>  		console_lock();
>  		lock_fb_info(info);
>  		ret = fb_blank(info, arg);
> -- 
> 2.25.1
> 

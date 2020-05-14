Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D571D36E6
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 18:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A29C6EB8B;
	Thu, 14 May 2020 16:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA986EB8B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 16:46:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g12so33631709wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HUlduk20pJ/YFrIISsBIBK2of0+byvpGgbvvctRJeGk=;
 b=PQceKUU/1haqRj40OIFIjnM5sSf2/ZevJjBcPrhqlKpdnvlCVRHUZjFasyT6s2gbKt
 ei8hSv7nDTicLFZGy8b+nafcNk5H915KBYgpIELwoFjcHL4SXtx98ObxXqa3BRUQS27y
 L7JUB2Y/YBrd0IfJMGk8GxTcRYHAyeffTBE2F4JxJdg6Pqguhkwoc98KjVAEz9cK+mws
 llyOP59Yr1UXKB3Njg75VgkXgzU5m6ocojxK1kosFG8+XOCcrUeHXEUgqMTjnMwA+lxz
 uBoWWFsGOHRX/9IJnJRds+JkyP7MVmqGmxDDS9UKZbeBfl6GOtqq1PQvHkZG1no0nHbB
 KFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HUlduk20pJ/YFrIISsBIBK2of0+byvpGgbvvctRJeGk=;
 b=TI3ohMMzDtmpYgctYcgos7hzd0k4qmR07tb9K7uaOmZ9T0ZCC64RrTXrC5EXNEPPE3
 MUyW7JYl/uiQGCjizXCHTfbOtNTUc+mNRhkd1MoteEFbh84//88rLM02/M2MVQUPapqF
 LqXkfoSDNR7GjR492kBknEK8WQ8jdac6FsUBBCKg46aPeJ8ekZ5j0xQIYmqdl2dhM2QH
 T0QbrbLmsZyEKiEP1XzEQETo/k8lwZXz9yHllPn9u8O2OTqNA0XgCqOYs3D/9TGeswD8
 ubAToxs+4ZX7OfCcSVgC+CnQycPELeJr2p7syzqYI+HPd263DAS+Tm6EPTYP1uTUs1Qk
 Jf8w==
X-Gm-Message-State: AGi0PubD9caws1dooDLwmehRlMM3jtaQ/TzHIRfdRyqXHavqo7vFaBgT
 8ocolrg8OnYTyG3DKaMK1jHhwA==
X-Google-Smtp-Source: APiQypI/LDHjZUzeL5oJx26MJ3l61l+D6DdDQwwkICEHNhEVW9aLlvjJ2lBXTRu3pzLbj36mXJzdSQ==
X-Received: by 2002:a1c:6884:: with SMTP id
 d126mr30492018wmc.179.1589474791525; 
 Thu, 14 May 2020 09:46:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n128sm14603108wmb.47.2020.05.14.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 09:46:30 -0700 (PDT)
Date: Thu, 14 May 2020 17:46:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 09/11] kdb: constify sysrq_key_op
Message-ID: <20200514164629.6jxixnmi3tal5yfx@holly.lan>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-9-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-9-emil.l.velikov@gmail.com>
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:43:49PM +0100, Emil Velikov wrote:
> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better if this gets merged this via the tty tree.
> ---
>  kernel/debug/debug_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 2b7c9b67931d..355bea54ca0e 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -920,7 +920,7 @@ static void sysrq_handle_dbg(int key)
>  	kgdb_breakpoint();
>  }
>  
> -static struct sysrq_key_op sysrq_dbg_op = {
> +static const struct sysrq_key_op sysrq_dbg_op = {
>  	.handler	= sysrq_handle_dbg,
>  	.help_msg	= "debug(g)",
>  	.action_msg	= "DEBUG",
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

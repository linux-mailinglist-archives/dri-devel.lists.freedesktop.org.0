Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6340372E05
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 18:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29E26E28B;
	Tue,  4 May 2021 16:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC93E6E28B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 16:27:44 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id i11so9302298oig.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYF7uUe0NSSJCsH19h2K0ONCXMFGfdoSakxploOCV0I=;
 b=FfAikBWHjfuKkAeTPxwjl/w800FhqUT9u9QL2i2sOIzQ2uPv2fE9oUb/mDJSo6Ty+S
 oFL9pETzB/3ytHSJhV8ZcLDnRe5IUwtpTzOvPryHm4NzwxuebeQsBxxnvquIfA53MHqb
 9WeSY8YoyNqwsOZ6mpywqQOzm5RnM4Q704264=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYF7uUe0NSSJCsH19h2K0ONCXMFGfdoSakxploOCV0I=;
 b=DFMybAfereJch+8wlKvLV+DsnXbdXYvmDsCkVMoWwU4OqCLStccjSbl9WppBRq19PU
 c6yiGaSrylSe35EPkvGf5DSyLLsLCVj3LUTVsgB10QVXDGAdh8qEJmPXdVd7Vy7Nlpxy
 8m3bDsWBiGj5hx4c0pd0mhdBkpq7xEBs6axAp3WLBOBOVKR5dRW66LAsvUCRxn0Ezjsb
 zKAO0al7kDMOe9KTKcRePRZFxrgi29YLK1L+EhQdCPVDmpl8txC0ecxm3vK98cOZa52i
 mjW8oZrJZseympiTPw+A9px0pirwCGDePgyXbXK7eM3B22zRLlKxXEm4VgbC1u2oSR6Q
 Gbbg==
X-Gm-Message-State: AOAM532fzJCHTlMZ0H7BoxIwrPnHKZ5bV+b8/omJ3BKtuQMrPlpSk0rX
 QtirOX2jLiRqQZaA7KEwYAgxQOMaT8A/SPr3eawpFw==
X-Google-Smtp-Source: ABdhPJzeyuzhzEF4gjzViZ7VOW+e0CqP6lg5U4itQk1v3xCNoIGcrH1flchbU+farzPUB+KtPOd05UmsfzRZLFXH+RI=
X-Received: by 2002:aca:2219:: with SMTP id b25mr3525216oic.14.1620145663881; 
 Tue, 04 May 2021 09:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210504142910.2084722-1-linux@roeck-us.net>
In-Reply-To: <20210504142910.2084722-1-linux@roeck-us.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 May 2021 18:27:32 +0200
Message-ID: <CAKMK7uFNtE=hW75kn8tnSHpZveaUtavMwk6Libb9uUeonz853g@mail.gmail.com>
Subject: Re: [PATCH] fbmem: Mark proc_fb_seq_ops as __maybe_unused
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 4, 2021 at 4:29 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> With CONFIG_PROC_FS=n and -Werror, 0-day reports:
>
> drivers/video/fbdev/core/fbmem.c:736:36: error:
>         'proc_fb_seq_ops' defined but not used
>
> Mark it as __maybe_unused.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Queued up for -rc1 in drm-misc-next-fixes, thanks for the patch.
-Daniel

> ---
>  drivers/video/fbdev/core/fbmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 372b52a2befa..52c606c0f8a2 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -733,7 +733,7 @@ static int fb_seq_show(struct seq_file *m, void *v)
>         return 0;
>  }
>
> -static const struct seq_operations proc_fb_seq_ops = {
> +static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
>         .start  = fb_seq_start,
>         .next   = fb_seq_next,
>         .stop   = fb_seq_stop,
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

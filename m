Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212739D580
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 08:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3086E25B;
	Mon,  7 Jun 2021 06:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D396E23D;
 Mon,  7 Jun 2021 06:59:31 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id c10so9124017uan.6;
 Sun, 06 Jun 2021 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8go6xRc0aBiej5IJzY7Bxzao9xX1kdd2uVB1Pbd1SXM=;
 b=N7zNnuWp7VyoRUAqAcO7Ei/BilDAEcsV4rQxHdVqm/Aw2lAQCN+fVjcP0TzxN5QYlD
 /mNSccs7mIgXxjkUjG145KToYQk+2UaH17TNcDWl/D5pUdU9fBu8Zr+Oliqz+W1HaOVT
 8SUvRROEiXLOh9X0Zgfa/5M0TEu/rrLBaLxmA91LUQ9oetMyGD+0aZ9TNYad+F4EUv18
 UT3o/IIj4x7Vd/dqCKjXp/5I/twXikVVSIOtscACaROzTGszgnBZM/L5WFpgnd+GDlJ3
 98XgsQc3F54ENtZo/YsrOUqsI8JbrE4pl2wkafZLDfEyi8HMXi8C7yvNruSVFnzDwegl
 XfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8go6xRc0aBiej5IJzY7Bxzao9xX1kdd2uVB1Pbd1SXM=;
 b=kjNcXzSHQ+tRBNks5IEs2qLsbUwV2XEe7WFHQfrmgxmG1qtwTqcPdc6OQTpLYs9XZv
 DQwuZAdL4FRVQtX9RGZDNERCqsDS7Zaozrxtxk1Hr6uJK1Rft5kwaBpClmqNxQqnautp
 7f8MMHo+3JrQtUzMVFdkdf4Or0M2gCudcWRNfuu49hhFnJTVSJ9IpFs3ZOfVVs2I1NVR
 xYwE8oi0HIy0T0iilAbtAF64of6dXJ0i+piLvvYjMTZV9AWvH4lRpMyKoXRRDSJlej1h
 jJlMSWu5vwwzy0qbngDFXI9+1q2xbD6GuU0EJb/cE7ipjFQYaYC2Ua8wEVqmMfPsObOP
 pVcw==
X-Gm-Message-State: AOAM530J1rwS+Rq79fQ8LF3UgeLP24TrEqw8e8SWM70Oe+RYTM8Q5kVD
 ppcJzT40+DyzvTZIPsHzDxYBHJqvGcQ+sHWz1Yc=
X-Google-Smtp-Source: ABdhPJyn0G40vkF00f9FMmTSW2dXYgPINXqDM6wh1HjEyCrjt75uPki5UekC7UymRHTOGBv5plEYJABxhWmGeylXfCQ=
X-Received: by 2002:ab0:1464:: with SMTP id c33mr8016762uae.118.1623049170722; 
 Sun, 06 Jun 2021 23:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210605121838.8357-1-bernard@vivo.com>
In-Reply-To: <20210605121838.8357-1-bernard@vivo.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 7 Jun 2021 08:59:25 +0200
Message-ID: <CAH9NwWdKvX3SN=StUMRcmavvOwoMotjkiVzrWxrJutGEe+Ha2w@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: remove NULL check which is not needed
To: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sa., 5. Juni 2021 um 14:18 Uhr schrieb Bernard Zhao <bernard@vivo.com>:
>
> NULL check before kvfree functions is not needed.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index b390dd4d60b7..d741b1d735f7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -80,8 +80,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
>         /* Don't drop the pages for imported dmabuf, as they are not
>          * ours, just free the array we allocated:
>          */
> -       if (etnaviv_obj->pages)
> -               kvfree(etnaviv_obj->pages);
> +       kvfree(etnaviv_obj->pages);
>
>         drm_prime_gem_destroy(&etnaviv_obj->base, etnaviv_obj->sgt);
>  }
> --
> 2.31.0
>

Thanks for the patch, but there is an other one queued up in
etnaviv/next that fixes the same issue:
https://git.pengutronix.de/cgit/lst/linux/commit/?h=etnaviv/next&id=7d614ab2f20503ed8766363d41f8607337571adf

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

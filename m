Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B6C38CF8B
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 23:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A9D6F919;
	Fri, 21 May 2021 21:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582486F919;
 Fri, 21 May 2021 21:00:36 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id s19so20878577oic.7;
 Fri, 21 May 2021 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RKJQFlbNOnxfAGQolBfqaP4S93vmXU/qq5oY6hR9n1Q=;
 b=RjfImzc3yEqSNWVSTW+M+5GM8IRvR8LGvYvFTIDYohws6M4npb6g0yObp24DV8bAsx
 6IZ7BCPUPy/6p8wVkXGMWQH6Y4Y0s+g8ygnucYQ5zuX1+ar8nWKxVsWFEC2ooPQqQly6
 nYX20pdXcizipg+pGJv84uAjE4k5e/Dsizk9Jr81Cz8dpMBZbtDNJF0UrAhvF9LpW+cG
 BXXFlYcz5k2ghZYde2AdUMJbG7QuRuM7Ym16jGaD6IqSDR8ZWQT3/vMgkDSGpeuDR8wp
 zj03M1p+Zjuz95c4YT+Y6XrxmG3BN45Givi17zY+fRitQ4q9ptlyAD+V7PWhQ/HBDmEl
 1QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RKJQFlbNOnxfAGQolBfqaP4S93vmXU/qq5oY6hR9n1Q=;
 b=safdaPNed+TR1dpsl7n/lFyXqv629foQSoR4Mdcq1pq7y08e2xfy/iDHgJcPDlVzAA
 lJFCyGQH3CHK80Zu3+TiMe3YbZnQoGEGYiYKiry85lWjX0BQxX6CustKw2n8BoicOlBr
 I6IIpo2NcXgtoVNtyacqZOgUTZfbjkN3YRUxRRCRubZXaEVwigxExILH4B+2YpzAd09O
 DRK8tDKQL96AkcG5Eo3EawM6Bqq9x4R0bKCE/ZSsYXRNdgo2/xLgdtuwbaBKbV/gO8n3
 G2wlxXmxuI8FRQK0jl7wZLf1VNCuOvglWADe0zqrlj/ugiqHiJYlASXWIiXAK0r+yT6n
 DJmA==
X-Gm-Message-State: AOAM533c4AGVKYo6BciWnKJcMXR0YQXK6f/dAPVPKB3s1+ycgNRpQkaW
 CabTGbS86J9BnKyA+eQOwbmzwY1T7a8l0nq7ytg=
X-Google-Smtp-Source: ABdhPJxuNzb1jvwtxFKbIpIcb34axGi0g9DbxLQSom5QwpOqZt6As4f1VD4LfCN8dJD2J8t9FfrXA30UJziLGvl2PFE=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr3525887oiw.123.1621630835378; 
 Fri, 21 May 2021 14:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210521150212.2076151-1-linux@roeck-us.net>
In-Reply-To: <20210521150212.2076151-1-linux@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 May 2021 17:00:24 -0400
Message-ID: <CADnq5_P9C71cc0Ua7cSYwkTPgY_YDXBOw-==XtXQCH+rxgW9Fw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdkfd: Drop unnecessary NULL check after
 container_of
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, May 21, 2021 at 11:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The first parameter passed to container_of() is the pointer to the work
> structure passed to the worker and never NULL. The NULL check on the
> result of container_of() is therefore unnecessary and misleading.
> Remove it.
>
> This change was made automatically with the following Coccinelle script.
>
> @@
> type t;
> identifier v;
> statement s;
> @@
>
> <+...
> (
>   t v = container_of(...);
> |
>   v = container_of(...);
> )
>   ...
>   when != v
> - if (\( !v \| v == NULL \) ) s
> ...+>
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 5b6c5669c03d..2f8d352e0069 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -110,8 +110,6 @@ static void kfd_sdma_activity_worker(struct work_struct *work)
>
>         workarea = container_of(work, struct kfd_sdma_activity_handler_workarea,
>                                 sdma_activity_work);
> -       if (!workarea)
> -               return;
>
>         pdd = workarea->pdd;
>         if (!pdd)
> --
> 2.25.1
>

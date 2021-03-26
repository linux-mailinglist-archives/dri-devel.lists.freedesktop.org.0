Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361E34AFEE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 21:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BCF6F483;
	Fri, 26 Mar 2021 20:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF1D6F484;
 Fri, 26 Mar 2021 20:12:55 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 125-20020a4a1a830000b02901b6a144a417so1564493oof.13; 
 Fri, 26 Mar 2021 13:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfvOzhMJ4JuuqkveDL13k3GrFGonS/KFxaEnz/Ocjxo=;
 b=hNjquuds1T0vvBWeFAVXX2r2B5S3fDS7t/uByhsWEaV7DH/26KJ8TdZv3CWLZJ64ah
 8tTS0GQXnvpHrOAA4Y8Yoy/miF7C4g7TZahIYUao3W/6i/4T+dgTOq98a0t4VnpgzEwA
 BVjAB96Dhi+b44Leeoxr+6ngpkJ6tCH1eMn9CR3KxwluJonxo7HMoEThPWVWhNse1MyW
 QtiMPFVYLVb+eLPO09fOA11wGirC0gm7rdMMTSe49206tswrkqqwY3hma6jHWmpOwBA/
 UQf9BmqILZJ6asd66Rth1wfKBeJqISvXhdb0fihUTxchglQMuc3PUwc+6Eda3NBkC7QH
 TwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfvOzhMJ4JuuqkveDL13k3GrFGonS/KFxaEnz/Ocjxo=;
 b=TAMrInkBBo1QlzauKVt+GUHJ4o88UX6ZhTVmDp46nLWLIu3vwoayn3+31S5W8AB6LD
 usnuuO9yWcsIWgKnrDyHAGpsusfGUUlj9BPcuzO0400vdHdlaRIf3ElRSmOYCXXOg7U/
 7ORYgyd6uJGZC39Ehj4uyKVK6IjVSNITckJJtQPB3qiJnybLDhrR1Ha0oGX3NjAESA9z
 h9bRsylJ1cC31tnKJ2XUwYjT1YmjY/W3HDFS0hRNbyYOhmDTp8CQFPH1wmUQxenTkJTn
 aZEcWyccFN871NccSpi3faWRANEryNW2CtCx6rKuamr6WwF3Lc9tnfticTpVkgl/ZF3T
 B0QA==
X-Gm-Message-State: AOAM5330v/xkntYuJtlhAtnHcS06OYOLSoOXqF3pNf9FC0C59i8IkibI
 9o9ndLeqZQaHnekvpVr8yezlrAv4vpCKF+XVhgdx03Su
X-Google-Smtp-Source: ABdhPJydurmrqdLJbvEL0gLAxwzS9yGgy84jbtc8g1CEIHuYYcqAjT/Y/X8rYgp2WZcnYVB0amfNm40OEDsrDf1rAS4=
X-Received: by 2002:a4a:7615:: with SMTP id t21mr12449102ooc.72.1616789574828; 
 Fri, 26 Mar 2021 13:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210326200719.1256182-1-alexander.deucher@amd.com>
In-Reply-To: <20210326200719.1256182-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Mar 2021 16:12:43 -0400
Message-ID: <CADnq5_Odp08yJVvHGvwYG4+9p72SUKpWMtyLpq2=eeEn=ZAp6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: fix merge breakage
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nevermind, I think I screwed this up locally.

Alex

On Fri, Mar 26, 2021 at 4:07 PM Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Looks like this got accidently dropped.
>
> Fixes: 2cbcb78c9ee5 ("Merge tag 'amd-drm-next-5.13-2021-03-23' of https://gitlab.freedesktop.org/agd5f/linux into drm-next")
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: daniel.vetter@ffwll.ch
> ---
>  drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> index c44bb68fe2e6..1a5be2792055 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> @@ -187,6 +187,10 @@ static const struct irq_source_info_funcs vupdate_no_lock_irq_info_funcs = {
>         .ack = NULL
>  };
>
> +static const struct irq_source_info_funcs dmub_trace_irq_info_funcs = {
> +       .set = NULL,
> +       .ack = NULL
> +};
>
>  static const struct irq_source_info_funcs vline0_irq_info_funcs = {
>         .set = NULL,
> --
> 2.30.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

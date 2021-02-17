Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F431D43E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 04:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35906E0C1;
	Wed, 17 Feb 2021 03:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDB56E0C1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 03:30:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z11so19270651lfb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 19:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3O1SlRD9mHyYcgKEptGwWMdlwwiEOHkySooRbJcp0FA=;
 b=rKjhnV/rKjMzs4NVFzvqTIn1IvEel/XKRv2CRTelQ9l6AmdnlXFx3Bq7V2QK0TB6IH
 RP8YriO8Bu7FI1tvhK16Tveb1BhGHb7ONYkrxHbl0SByByvd9l7PQh2gnxvthWGBVRtj
 bXB1nyzKQYJ7EN8BVX8fOCVK6GzHAasVhWRO5JgvYeVBLiEbZaRBldLJA1VhY2bSm6Il
 MX4tL+wwAQuNwnBxJCLPbiWVtLIORNNel+aUMW2Z5Yr5JCcDzYKWX2bmaO4684IyiCdT
 C0hTEGyOCmdNNeWPC75RJr3anp+S1ucatzlY4N9Wfy8WUbwCe+Rs2eR+9LRyHzF/eJ2c
 daaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3O1SlRD9mHyYcgKEptGwWMdlwwiEOHkySooRbJcp0FA=;
 b=XfPufWgYH8SqcP/sV9kqZ6fwvYCfuDT8UmfxPAqxaTI8zt7tVnr5w5MGqIy6UHbkKN
 TvcdEgOw0HxKyZN6Q7U+pghSAv/DEHfAl0pacID1op0zaXj+yD4FMcRSNwJAVwUildRo
 cnlZdOhLOqna+6RDQOpve5/lrlU3KFLwv1T9KgGDh7NPxngv1EW8Cy38FITErNtCtSBj
 0iT1FpD50D/OrLTqjEc5LNMf13xbIj4G2ft6mxhCW3TX+nVeTtsag3iiDQ0P2B0D5xi7
 E8kJCr5KImPea/cyMyKvfZhPa//KtMC2nBN1+LKPa/8Ky8cv4T7Q0D0+Za3SkSWblDHb
 5tCQ==
X-Gm-Message-State: AOAM533WfbPulN57e47/V4cwzES12vBMigkJGP1GcoU3uZAm5cXB8A3a
 Wx4PRJ5ZJKT+6YIvRaKn2e1e3ZFq9TmdvONkCNY=
X-Google-Smtp-Source: ABdhPJw5LFP81VELsUJIh9KxmEzjlv1swQbIZPYaaa7C6xhkNziyUEhOnBsHYExdN6qSsBLznPBBWbSnzjIIeBUMxDo=
X-Received: by 2002:a05:6512:a90:: with SMTP id
 m16mr12812355lfu.577.1613532641983; 
 Tue, 16 Feb 2021 19:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20210216161924.1687-1-diego.viola@gmail.com>
In-Reply-To: <20210216161924.1687-1-diego.viola@gmail.com>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Wed, 17 Feb 2021 12:30:30 +0900
Message-ID: <CAAVeFuLLw+pb-vvxPbbgDGGLo4Vi-ReJAh_YH-3xUZEDyhDb-Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/pmu: fix timeout on GP108
To: Diego Viola <diego.viola@gmail.com>
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
Cc: nouveau@spliet.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 17, 2021 at 1:20 AM Diego Viola <diego.viola@gmail.com> wrote:
>
> This code times out on GP108, probably because the BIOS puts it into a
> bad state.
>
> Since we reset the PMU on driver load anyway, we are at no risk from
> missing a response from it since we are not waiting for one to begin
> with.

This looks safe to me, provided indeed that the PMU's reset is not
called outside of initialization (which for GP108 is shouldn't be
IIRC?).

>
> Signed-off-by: Diego Viola <diego.viola@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> index a0fe607c9c07..5c802f2d00cb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> @@ -102,12 +102,8 @@ nvkm_pmu_reset(struct nvkm_pmu *pmu)
>         if (!pmu->func->enabled(pmu))
>                 return 0;
>
> -       /* Inhibit interrupts, and wait for idle. */
> +       /* Inhibit interrupts. */
>         nvkm_wr32(device, 0x10a014, 0x0000ffff);
> -       nvkm_msec(device, 2000,
> -               if (!nvkm_rd32(device, 0x10a04c))
> -                       break;
> -       );
>
>         /* Reset. */
>         if (pmu->func->reset)
> --
> 2.30.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

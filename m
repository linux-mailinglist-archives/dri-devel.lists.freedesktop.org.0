Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71624230E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 02:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE636E87B;
	Wed, 12 Aug 2020 00:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BDA6E876;
 Wed, 12 Aug 2020 00:14:20 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id x10so381934ybj.13;
 Tue, 11 Aug 2020 17:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EECTvhpW/4wcpyDgeePO+k8+09CeEjLorKKfjs56l98=;
 b=Q7mm1elliLh/UHacUbs4AY6GzuGqv/sobvXgMmVVIShQYXgCmqnAGdxtfzkOMnC+U/
 bhK/Rrt2OcBrfZTy4gWrnEhDbvLF3xeXFlxU9b7UYSEQhMjrrdMaDipYZ22OcBarKkPL
 4xh+Ewx5xqfkO2AsIqAtBWeB1ddRjT64B5XOHmXlJRwzFCb6QSW58qMInr8KAKvj3rC1
 RV1Z/2FdmkaULwxSy1edCGimjZcn4ylBhuKORFgccLca3NIpsg6q2p6AMhV+NdGOkPx6
 n/Mb9EGoFCSOtrzG4rOpqtK7RDNmyYwSDJF49Soxc7v9kt1xLOuOhz1Bs6WpoQgnFKgX
 fTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EECTvhpW/4wcpyDgeePO+k8+09CeEjLorKKfjs56l98=;
 b=R3lyqFSiZ9yqIoK/UurKv6wXWwDVEE/mbtMxbqJngtzq5jiJkFmHVTE2VEBX0pJfui
 Yk1Ho4MTPs4661Ni2Jt1tKyE+RVqslsOXNQG0g2JoLN7Z05AnxyY5q/CMVGM7NZWAv8O
 ShNcCM7ONb2qG4YaEuFDz46Yjl4ND8Ou2DIw4mGonuNuqMiloswgtYGGFnBO0s7y3rAy
 EueO5SAOHnAohwkj4N+r8QNmg4ab/k23m1XyY5pbPrdNh4E8kH70nIkSXAi/s/jgsHKf
 wdj7s778ciK/g8TFBplI6V0eXmpI0N/RNx1DOlzcHU9AWKILZXdSA59Gbqn3/ECPBs+c
 tHGA==
X-Gm-Message-State: AOAM533Tu+gvhXME/gXsqH1QZRQxmzGwonDP37tTWBChsZ/4gRIIbjAh
 bmCIWBtLTaziPvM7OPciyl+Zd7fX0yJFShT0a/9uZhTr
X-Google-Smtp-Source: ABdhPJz8vAYmgWrlaT2Xtt9QXJflCYBZrH/2sTBupWHilMsBAP29/w6/2o4L00xaJt4ODsqFKmzqgguw39l/xleeVQE=
X-Received: by 2002:a25:9c01:: with SMTP id c1mr26232297ybo.83.1597191259687; 
 Tue, 11 Aug 2020 17:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-21-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-21-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 12 Aug 2020 10:14:08 +1000
Message-ID: <CACAvsv7cqKLa+wSz3JQhZ7sr8dDXeqZt1VjkpGY8E=E2xFaCCQ@mail.gmail.com>
Subject: Re: [Nouveau] [RFC 20/20] drm/nouveau/kms: Start using
 drm_dp_read_dpcd_caps()
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Aug 2020 at 06:07, Lyude Paul <lyude@redhat.com> wrote:
>
> Now that we've extracted i915's code for reading both the normal DPCD
> caps and extended DPCD caps into a shared helper, let's start using this
> in nouveau to enable us to start checking extended DPCD caps for free.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index f41fa513023fd..a4e07d116972f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -55,15 +55,13 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>         int ret;
>         u8 *dpcd = outp->dp.dpcd;
>
> -       ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
> -       if (ret == DP_RECEIVER_CAP_SIZE && dpcd[DP_DPCD_REV]) {
> -               ret = drm_dp_read_desc(aux, &outp->dp.desc,
> -                                      drm_dp_is_branch(dpcd));
> -               if (ret < 0)
> -                       goto out;
> -       } else {
> +       ret = drm_dp_read_dpcd_caps(aux, dpcd);
> +       if (ret < 0)
> +               goto out;
> +
> +       ret = drm_dp_read_desc(aux, &outp->dp.desc, drm_dp_is_branch(dpcd));
> +       if (ret < 0)
>                 goto out;
> -       }
>
>         if (nouveau_mst) {
>                 mstm = outp->dp.mstm;
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

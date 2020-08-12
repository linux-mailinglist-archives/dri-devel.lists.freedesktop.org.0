Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB82422FF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 02:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0436E86D;
	Wed, 12 Aug 2020 00:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28016E86D;
 Wed, 12 Aug 2020 00:10:24 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id i10so383984ybt.11;
 Tue, 11 Aug 2020 17:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8uOzj1voyuCKHRpxgq/4pDKuyjBgBLo5ZiC1tPpLll8=;
 b=PfUxsu28J+k0tt2T60XuyfbMtFAitx9KdbRdPbiTevfHT9OuvszkOVp6HdNs4S0oHc
 p6R5vS0fipF5cik14YFkQatdJ1zII7ViQJiLPTdNtuo80Ih5Oxj+nSWE7sn54rW9HK/x
 H4oaP9zlZcL4EHAtrwmBJi6nrIqDYFWLD2Lez2KE9v4SgN/T0FWwAslu/rEqoaO1A97F
 qRxcJfRsR14jofd7sYxL1YPYdlkYmYnyJD36utn+DAb5JYRb5jumHg9FEWV0Ov+00n9a
 u/m6wYzHQp36O9NWnduDy7Y9apuqjWNkQ0iYWnts9RdUdvShjYPt7qOnRkdPfxdaUHIV
 Cmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8uOzj1voyuCKHRpxgq/4pDKuyjBgBLo5ZiC1tPpLll8=;
 b=dM7HoQrP9L51+Ngpc1/2n+a3mc1E9j9Gd+ldFPnub74hTYJBJ2zduIytcCPMDOo6Mw
 +U7e3KtjKbwRQXNcJyG3S2NtRftgi159ExaNmhIy2lRnteglKiaSpUwlLqViJZdtaKOc
 pg8y/YgIpQCT7niU2l3hWgxmw+q1i2HLMcRgrHNV237BaeU6NhaawVD5+8BtnK43EQkF
 7LpXhI84JRLdsBXwZWNoxlR9rtBc204h+bh5fOC503vKn7nqO2fLyngBFjJf/1WAzuNZ
 jcrJKQCJLMo70VEB3MF7zxE2nHjTIZfPX5tmrERoBl6F6cfcgaKdMtkKfkGxuRQgfOVt
 kguw==
X-Gm-Message-State: AOAM530eqYmjXzeBxtQzG9VlQ3qGsQsiZkmPPgWfnFsEpHuW0xQbxaAY
 fraALJdTEt8ArY6N6VLQwLy7mWOFlOa2rdsdr2o=
X-Google-Smtp-Source: ABdhPJywz5Q/451nmNo3nqmKYvaDye1yBXeQ45F23UMljvWfQL6O7dMrT8GiEhMPtmxrhdR1cSHpFuq3PI9yzuM0z1Q=
X-Received: by 2002:a25:2e12:: with SMTP id u18mr48009916ybu.200.1597191023984; 
 Tue, 11 Aug 2020 17:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-2-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-2-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 12 Aug 2020 10:10:13 +1000
Message-ID: <CACAvsv5FnVom3Od=EfZO3Y1WhCXDhBvCSNwFx8bc_BNg75iL4g@mail.gmail.com>
Subject: Re: [RFC 01/20] drm/nouveau/kms: Fix some indenting in
 nouveau_dp_detect()
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

On Wed, 12 Aug 2020 at 06:05, Lyude Paul <lyude@redhat.com> wrote:
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index 8a0f7994e1aeb..ee778ddc95fae 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -76,10 +76,10 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
>         nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
>
>         NV_DEBUG(drm, "display: %dx%d dpcd 0x%02x\n",
> -                    nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
> +                nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
>         NV_DEBUG(drm, "encoder: %dx%d\n",
> -                    nv_encoder->dcb->dpconf.link_nr,
> -                    nv_encoder->dcb->dpconf.link_bw);
> +                nv_encoder->dcb->dpconf.link_nr,
> +                nv_encoder->dcb->dpconf.link_bw);
>
>         if (nv_encoder->dcb->dpconf.link_nr < nv_encoder->dp.link_nr)
>                 nv_encoder->dp.link_nr = nv_encoder->dcb->dpconf.link_nr;
> @@ -87,7 +87,7 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
>                 nv_encoder->dp.link_bw = nv_encoder->dcb->dpconf.link_bw;
>
>         NV_DEBUG(drm, "maximum: %dx%d\n",
> -                    nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
> +                nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
>
>         nouveau_dp_probe_oui(dev, aux, dpcd);
>
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A41B3486
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 03:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2DE6E1A3;
	Wed, 22 Apr 2020 01:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE856E19B;
 Wed, 22 Apr 2020 01:29:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k13so422834wrw.7;
 Tue, 21 Apr 2020 18:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8CkD6UpiKEUIOwMb/cbIk+rOdxqBZqZq34MFFN5U4/8=;
 b=L2+EwezBJjAsMIE6jn6tH++me0lyzLeznfWa1HqjZXeljy2iJJXf3nQ3gFttGbNHeT
 FI8wVdIY/HWVcpGKqFmmRrkD54/suzs0gN6MePHNhkG3fHSXeMUNAM43XEwe/6Bbf+dk
 cDgPKEgNPuZPpuadNfBdEh6COg1KFh7gt2Vt2YMn6sqeXdj5fCV3UHD3yp4+HXY3Hkan
 OGNjrgJ/Gi4p4JbJuNvqJUGyQngAY0DcWf00HgzI+DdVTC/XugxbP5pIbcuf8/TFE9tR
 4ZK9JQWphC4ZWEbjZy2wdxwlfKNz3GXfG729AGFT7x5AblOt1w3+2A+Z1Z1+2MS0PLGR
 daCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8CkD6UpiKEUIOwMb/cbIk+rOdxqBZqZq34MFFN5U4/8=;
 b=QlbzhBl/tbwuN9qutVtPyfzgT93d9Z9qtDvLbxiSveTVVmnifOyy4kDS6TRHu64KjN
 H+y1TITCoq24jENg8j9Wdz0GsWARAb1RYV5FFTxEThXy30OCjFNJMCWDgEXVJT9rgg/b
 ra1lXGudhd+RT7nacx7lbY71GKmS6Na2aHfHi/jr0yVmin+82G+CqY3Ho7Cf852ttMd8
 ilOKdVWHcLzeBo2mmFhv7RMiAqr4JyjSGtsxu1zwiLqRAxLe9n8Ev82C7YfyLO7lUhaC
 +fOI0Bh1xdrqr+82P0DjP0kE7B9uEGd9WnOUg+kC6JHbo6uGr3S64ahp+gslEmLp+Iu9
 EyRw==
X-Gm-Message-State: AGi0PubX0wMlG+Mbp5bGBC5Ws7+n6L19jUPTepGzOwUks71fLZDUveRx
 vg6rSv51YWpnjER5ORhCr7roQS3lOz7zw7PifF8=
X-Google-Smtp-Source: APiQypJNmmpderRAKO7b0CF9BhgeJzgXymS598hOdaHn8ZqjgfypjCrlt0SHq5Q2D4eHlKFa9dm8Dm4fu+pdYMCf9X0=
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr27942537wrc.416.1587518975982; 
 Tue, 21 Apr 2020 18:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <de475904091400ef6c123285f221094654d96d35.1587509150.git.robin.murphy@arm.com>
In-Reply-To: <de475904091400ef6c123285f221094654d96d35.1587509150.git.robin.murphy@arm.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 22 Apr 2020 09:29:24 +0800
Message-ID: <CAKGbVbtGxzpnSu2Hyb9LmN40mN=EQS=N2A1B8=Ac0SX+9z2w9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/lima: Clean up IRQ warnings
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: lima@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch 1&2 are:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Wed, Apr 22, 2020 at 6:51 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Use the optional form of platform_get_irq() for blocks that legitimately
> may not be present, to avoid getting an annoying barrage of spurious
> warnings for non-existent PPs on configurations like Mali-450 MP2.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/lima/lima_device.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
> index 247f51fd40a2..c334d297796a 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -171,8 +171,10 @@ static void lima_regulator_fini(struct lima_device *dev)
>
>  static int lima_init_ip(struct lima_device *dev, int index)
>  {
> +       struct platform_device *pdev = to_platform_device(dev->dev);
>         struct lima_ip_desc *desc = lima_ip_desc + index;
>         struct lima_ip *ip = dev->ip + index;
> +       const char *irq_name = desc->irq_name;
>         int offset = desc->offset[dev->id];
>         bool must = desc->must_have[dev->id];
>         int err;
> @@ -183,8 +185,9 @@ static int lima_init_ip(struct lima_device *dev, int index)
>         ip->dev = dev;
>         ip->id = index;
>         ip->iomem = dev->iomem + offset;
> -       if (desc->irq_name) {
> -               err = platform_get_irq_byname(dev->pdev, desc->irq_name);
> +       if (irq_name) {
> +               err = must ? platform_get_irq_byname(pdev, irq_name) :
> +                            platform_get_irq_byname_optional(pdev, irq_name);
>                 if (err < 0)
>                         goto out;
>                 ip->irq = err;
> --
> 2.23.0.dirty
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

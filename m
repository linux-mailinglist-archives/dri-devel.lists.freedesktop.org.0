Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24966243DED
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 19:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24586EA70;
	Thu, 13 Aug 2020 17:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F036E105;
 Thu, 13 Aug 2020 17:03:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so5972196wrw.1;
 Thu, 13 Aug 2020 10:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f2OcjbUQiolvvjtdbVSQNs7Tp8xSogd0JfYY2T8Mi5A=;
 b=ZK6Xnm68XM2Weqtgt+oy3WcBDmBJh4lWuF7ScdBCNMZtV8MrK+cZ+1LJEGHPT2ytSK
 tp/+w+gZYNpoViq7ImvjHNu8E7fY6uYz3Akw85Q3r0hc/J+QsRASf9v/kyU8jzmG5j2B
 9nsKgs+z0spe3DYv+WKNqKQ7PfS15szCOW+9fYB5VdGm7W0WitS+HSAyudQvZVOOWFm+
 /SWJGA27fdofLe5npVil/Q17mLoctp20Yq6pwOyU8qH91l8DLctei8TLNk3yrkPtfGvt
 qq7SlDif8CyQDYsl5hNTWGFbzQDt3HFxHqMv6/x0PB6fuxphRpvHlnk9LPaAYLEfD9oY
 Q1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f2OcjbUQiolvvjtdbVSQNs7Tp8xSogd0JfYY2T8Mi5A=;
 b=Za+rAZJU30ytYQ+5Ed6O9NvmbEQWkCiBG8rEoPblx1TeLOKpjg6qfvDez7soI2WOjx
 lQ1Sp77O3GGODAtIZ2KjWXM1cJulEHqJsIW1MP1TGjZRaoZECvZJejrUoNPKskWungcX
 CuQCwp/BRiFUgfu2l+k7nbClao5ZHfsXyVmzGMBqHlyNG3Z8djfj7fF6PlUBiNSJ1ww9
 N9e6kZ77YDgIEZFrzf4Snmks/SRsEsiWqisaANarB940Y8RX8BFhf/PaxWUkh6125aT9
 3cRH12ObBYYI8kEVnE1qLAwvua9tBAs6TUdHp8RBOhx3PFuE/CRw06dNe5mtpDZOZ9b6
 1kVg==
X-Gm-Message-State: AOAM531HAef7EQaDycLuifAXnyYC/lnhkcvOBUCEIIwbHEUstngzjcPv
 XOCR7EhcfPpkoxdbwNOnb9pU+GPUEfHTSA3hzAQ=
X-Google-Smtp-Source: ABdhPJwPNi4Dk4hbn8MvomzE5XprOKkd1JdsgDq0RR0BsrBUKWcJC//EUB0I4UQXhY2gfAX3taxczNZaZKNnP7WG/N8=
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr5227777wrs.132.1597338199356; 
 Thu, 13 Aug 2020 10:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-8-jcrouse@codeaurora.org>
In-Reply-To: <20200810222657.1841322-8-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Aug 2020 10:04:05 -0700
Message-ID: <CAF6AEGv+X88Jrha7zhQ+78RbGqK78Ghi49a_V6zE-fmRDvcGFw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 07/13] drm/msm: Add a context pointer to
 the submitqueue
To: Jordan Crouse <jcrouse@codeaurora.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Brian Masney <masneyb@onstation.org>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 3:27 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Each submitqueue is attached to a context. Add a pointer to the
> context to the submitqueue at create time and refcount it so
> that it stays around through the life of the queue.
>
> GPU submissions can access the active context via the submitqueue
> instead of requiring it to be passed around from function to
> function.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++++----
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           |  7 +++----
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
>  11 files changed, 39 insertions(+), 30 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index a1d94be7883a..10f557225a3e 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
>          * No lock needed in close and there won't
>          * be any more user ioctls coming our way
>          */
> -       list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> +       list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> +               kref_put(&ctx->ref, msm_file_private_destroy);
>                 msm_submitqueue_put(entry);
> +       }

oh, this is the problem I mentioned in the last email.. we are
dropping the queue's reference to the ctx, when the device file is
closed, not on the last unref of the queue.  So the queue stays live
until all associated submits are retired, but the ctx ref (and
therefore the aspace) get destroyed earlier

BR,
-R

>  }
>
>  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

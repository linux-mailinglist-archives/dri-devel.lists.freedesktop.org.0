Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF831674C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 09:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C026E25A;
	Fri, 21 Feb 2020 08:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2876E25A;
 Fri, 21 Feb 2020 08:28:18 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id g13so367333uab.7;
 Fri, 21 Feb 2020 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpZqkjJzq7maU5wRD/SzaYqTKkPoc6vJaalUsryW+8I=;
 b=RWVYOsnefJ75cq6QAR9uBhrSY2wGv/IxxoO4tFK384goCjUffuRjVzizn58R9YvaW7
 X31yruFrt6MSw7clKgt3OEMjdI5ShxL4K0YTbH5Ev0+WURhB/7lqvARcxgGxLiwCez/A
 a034X2eq+189Iip0KOY7CbfjU8yQ10KCa/N8afzgU4F0HtIdeQh+Cz7oOWbg9n2YkfvT
 IrZoeMlGPqk3uSUW1wdg/roL8/1BRqxR+UpPfbWMu7IVJAgT3ghT1TRxn59CgD53xBIQ
 EJZ4o2oteTWqO68IOwZc6gMq2B2gIadDTXUEXU+G/TnheC3jxEeatzIbdYddSgIJQxoB
 3DMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpZqkjJzq7maU5wRD/SzaYqTKkPoc6vJaalUsryW+8I=;
 b=cN2SpsSfq+3Bz71MtIiviwd+q4m9A1FxYCpOwQWQ3Q30eXFfR1fY3/5Upyq3xqLWQv
 RtWZ2OQyTxAtEuwOzqTuFG27miO5ASlRS684qZeFTaOa8t5tBbcPYhGW/Lobse5rssLg
 1Jix2LwOzKhjLdiOd6E+VwcWvPjdrU0UoH4mfFcs4guxletxZcnaLKAse+6T7kz/UWOj
 u7IQOrK9QG8SqE7kCxnmuVeJARiBy6xKHg6HzlM8E1UXZKL+7cF0pbF7+TWk9JUKbreT
 Ma38vXmJteQKzqizuFctfeyRH+ROc/KLGHqHV8chsg7oHkQogLYDWGT7/K3AxSQ4eaej
 YW9w==
X-Gm-Message-State: APjAAAW+1qCJhmluB7m3PY48zENsyB7sMaSm8xbrAF0Qaj7j1wymPt51
 kukDaBTAYYv6BaPbtSB3M6oYD47ynAKnWYnHbfg=
X-Google-Smtp-Source: APXvYqxmLNkqW8mBwz0Iwb261cEY9aqyNNS8+/2m7CnN8EFRUA4/6WuhWMOyAGVA8CFlptNzcQE7DsGzQPkFHHDQR/k=
X-Received: by 2002:ab0:3395:: with SMTP id y21mr9862260uap.124.1582273697648; 
 Fri, 21 Feb 2020 00:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20200106104339.215511-1-christian.gmeiner@gmail.com>
In-Reply-To: <20200106104339.215511-1-christian.gmeiner@gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 21 Feb 2020 09:28:06 +0100
Message-ID: <CAH9NwWcW-kq_GzhsfZboLKfGZj6=40Qi6Pf8-WoO4J6VOqzgoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: rework perfmon query infrastructure
To: LKML <linux-kernel@vger.kernel.org>
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
 The etnaviv authors <etnaviv@lists.freedesktop.org>, stable@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mo., 6. Jan. 2020 um 11:43 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> Report the correct perfmon domains and signals depending
> on the supported feature flags.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 57 ++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index 8adbf2861bff..7ae8f347ca06 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -32,6 +32,7 @@ struct etnaviv_pm_domain {
>  };
>
>  struct etnaviv_pm_domain_meta {
> +       unsigned int feature;
>         const struct etnaviv_pm_domain *domains;
>         u32 nr_domains;
>  };
> @@ -410,36 +411,78 @@ static const struct etnaviv_pm_domain doms_vg[] = {
>
>  static const struct etnaviv_pm_domain_meta doms_meta[] = {
>         {
> +               .feature = chipFeatures_PIPE_3D,
>                 .nr_domains = ARRAY_SIZE(doms_3d),
>                 .domains = &doms_3d[0]
>         },
>         {
> +               .feature = chipFeatures_PIPE_2D,
>                 .nr_domains = ARRAY_SIZE(doms_2d),
>                 .domains = &doms_2d[0]
>         },
>         {
> +               .feature = chipFeatures_PIPE_VG,
>                 .nr_domains = ARRAY_SIZE(doms_vg),
>                 .domains = &doms_vg[0]
>         }
>  };
>
> +static unsigned int num_pm_domains(const struct etnaviv_gpu *gpu)
> +{
> +       unsigned int num = 0, i;
> +
> +       for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
> +               const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
> +
> +               if (gpu->identity.features & meta->feature)
> +                       num += meta->nr_domains;
> +       }
> +
> +       return num;
> +}
> +
> +static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
> +       unsigned int index)
> +{
> +       const struct etnaviv_pm_domain *domain = NULL;
> +       unsigned int offset = 0, i;
> +
> +       for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
> +               const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
> +
> +               if (!(gpu->identity.features & meta->feature))
> +                       continue;
> +
> +               if (meta->nr_domains < (index - offset)) {
> +                       offset += meta->nr_domains;
> +                       continue;
> +               }
> +
> +               domain = meta->domains + (index - offset);
> +       }
> +
> +       BUG_ON(!domain);
> +
> +       return domain;
> +}
> +
>  int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>         struct drm_etnaviv_pm_domain *domain)
>  {
> -       const struct etnaviv_pm_domain_meta *meta = &doms_meta[domain->pipe];
> +       const unsigned int nr_domains = num_pm_domains(gpu);
>         const struct etnaviv_pm_domain *dom;
>
> -       if (domain->iter >= meta->nr_domains)
> +       if (domain->iter >= nr_domains)
>                 return -EINVAL;
>
> -       dom = meta->domains + domain->iter;
> +       dom = pm_domain(gpu, domain->iter);
>
>         domain->id = domain->iter;
>         domain->nr_signals = dom->nr_signals;
>         strncpy(domain->name, dom->name, sizeof(domain->name));
>
>         domain->iter++;
> -       if (domain->iter == meta->nr_domains)
> +       if (domain->iter == nr_domains)
>                 domain->iter = 0xff;
>
>         return 0;
> @@ -448,14 +491,14 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>  int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>         struct drm_etnaviv_pm_signal *signal)
>  {
> -       const struct etnaviv_pm_domain_meta *meta = &doms_meta[signal->pipe];
> +       const unsigned int nr_domains = num_pm_domains(gpu);
>         const struct etnaviv_pm_domain *dom;
>         const struct etnaviv_pm_signal *sig;
>
> -       if (signal->domain >= meta->nr_domains)
> +       if (signal->domain >= nr_domains)
>                 return -EINVAL;
>
> -       dom = meta->domains + signal->domain;
> +       dom = pm_domain(gpu, signal->domain);
>
>         if (signal->iter >= dom->nr_signals)
>                 return -EINVAL;
> --
> 2.24.1
>

ping

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

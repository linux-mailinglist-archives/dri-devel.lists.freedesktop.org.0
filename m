Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD05A3B27
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 05:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FC210E61C;
	Sun, 28 Aug 2022 03:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7540E10E61C;
 Sun, 28 Aug 2022 03:13:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z8so6453104edb.0;
 Sat, 27 Aug 2022 20:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=rd3ksxY2r2d4umC7P+x9tPhn/YbT/og5qf8COlgSwG0=;
 b=BkktuXham3bJAawJw+z2gIbpYARDRz2nalG4WoAeiASprxgXBsy7gd9fSxQKTHHyUq
 O/2/9F+zvKboRn+asgYSwVlVLUIKuHxJDg8CfKL75lEOzRwbhrJocCIlb0jx9/HGdosK
 XIWlJLikk6uNMkwEkZJmJ9MPaVFZXSZ38Mx3XxWs+ukRd7CKt7wa/py8Fn28mPobi3Ih
 44x4Q4YbVJFvyXUAwndvwFsfwh6p2rxo8G4woK/XGco0wD0I6FU8ECCGWqtoa11FSGvr
 tubF6UaXOH9o3U87Dn9jUsvBPO3BkfndKnZfSxAtzbA2Ne9Ngp3rqHu1H3TZqKiNDxPo
 8cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=rd3ksxY2r2d4umC7P+x9tPhn/YbT/og5qf8COlgSwG0=;
 b=dhP8VA/p+xXWayIQVXfShJR/NpKt5Kk83mBg6IeWpkDc+2si+wGjGRbAIei52hUVJD
 BoIJOtlF+O9YcOK+Jq5gqEPlgthGmzRff6db2ybSxOnbYltkQFStrp/8xmJXAejMVSIF
 eZlmKFDAZ9epv9XaFIWdwZQAzk8Vg6yhy2xDR4fxadqoQo/pTkIDUeYBYMi26JyMncMO
 7mv9R5NeFg+z7Xvl65PmPQCUe4NgxGdpcllJtECwIjh0IHtU0eAYE8zQMsSKFtJ0LOd7
 wGhLUtsRjZ0qpFYn9UvP5Iwl6fxG1BQYWefKSn+xo+mzziNh71DGo5NpdEtYtPIqf/PF
 BCEQ==
X-Gm-Message-State: ACgBeo1z2sn0nvVmDCy6qtzsrJksPdA2WebNwGMa6WKfqcNjVpyMt5bP
 sneeJUt/QPQFDQp262W1C+hVNKi9laGbEwGIgTM=
X-Google-Smtp-Source: AA6agR6SKEc3oY9vr+RdnKqhSKTYL+rBz3dfvzjG5t2vZKf/PX9ywLMV+mH+1+42EZ47oABia27bR++eFdETAIOUJes=
X-Received: by 2002:a05:6402:27ca:b0:43e:ce64:ca07 with SMTP id
 c10-20020a05640227ca00b0043ece64ca07mr12329904ede.66.1661656401660; Sat, 27
 Aug 2022 20:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220826190728.3213793-1-l.stach@pengutronix.de>
In-Reply-To: <20220826190728.3213793-1-l.stach@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 27 Aug 2022 22:13:10 -0500
Message-ID: <CAHCN7xLb4Hqx3CS+zooNbh10Dm7dz3oq-NZ1tVNc_fg-Sg_MMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6203
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patchwork-lst@pengutronix.de,
 Sascha Hauer <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 2:07 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> The GPU is found on the NXP i.MX8MN SoC. The feature bits are taken from
> the NXP downstream kernel driver 6.4.3.p2.
>

This series fixes an issue where I saw:
etnaviv-gpu 38000000.gpu: recover hung GPU!

With mesa-22.2.0-rc3, I am able to run 3D demos.

Tested-by: Adam Ford <aford173@gmail.com> #imx8mn-beacon-kit

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> index f2fc645c7956..eaed08a3d281 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -68,6 +68,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .minor_features10 = 0x00004040,
>                 .minor_features11 = 0x00000024,
>         },
> +       {
> +               .model = 0x7000,
> +               .revision = 0x6203,
> +               .product_id = ~0U,
> +               .customer_id = ~0U,
> +               .eco_id = ~0U,
> +               .stream_count = 16,
> +               .register_max = 64,
> +               .thread_count = 512,
> +               .shader_core_count = 2,
> +               .vertex_cache_size = 16,
> +               .vertex_output_buffer_size = 1024,
> +               .pixel_pipes = 1,
> +               .instruction_count = 512,
> +               .num_constants = 320,
> +               .buffer_size = 0,
> +               .varyings_count = 16,
> +               .features = 0xe0287c8d,
> +               .minor_features0 = 0xc1589eff,
> +               .minor_features1 = 0xfefbfad9,
> +               .minor_features2 = 0xeb9d4fbf,
> +               .minor_features3 = 0xedfffced,
> +               .minor_features4 = 0xdb0dafc7,
> +               .minor_features5 = 0x3b5ac333,
> +               .minor_features6 = 0xfcce6000,
> +               .minor_features7 = 0xfffbfa6f,
> +               .minor_features8 = 0x00e10ef3,
> +               .minor_features9 = 0x00c8003c,
> +               .minor_features10 = 0x00004040,
> +               .minor_features11 = 0x00000024,
> +       },
>         {
>                 .model = 0x7000,
>                 .revision = 0x6204,
> --
> 2.30.2
>

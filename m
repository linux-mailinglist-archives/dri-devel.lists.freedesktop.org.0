Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C258454B74D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 19:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04BC10F2E3;
	Tue, 14 Jun 2022 17:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C41610F798
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 17:05:23 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id cn20so127485edb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=11dNLzt3SUmGnO4jGyGyu0zfTo5dEEb7eTkmHbSzfms=;
 b=FpnxDLy6JQb1GrwjUPQD7wbLSSrJP2kpJOjbaVn/kumsGr1V5AcMjJnTY4hjKehhfu
 Va/ipzGwfk/29tuNSS0fTRU3tZNF7gXseIUVdOcyCuDG9ZZNhW1jqHm2UQ1ChZ6WJDiT
 VA93Cg5Ju79795rE8HMC1JbSlatbaVJ0hujymP7QezyoXbPNeSrVWYfPCuxkmsmcNZh7
 sJEADoXlfEm1w2LKHot81tVg0kP+/nY3ujCYxpnWmTlBoQZM+KQyqISJgeKm/4pEqBTA
 0Mf6W02JdU7+2dnxu8P9ZAqh6DEHTahQyJi9jsgYUAa8e1TeGwb62Wa5pqgeXiPIt5ok
 O8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=11dNLzt3SUmGnO4jGyGyu0zfTo5dEEb7eTkmHbSzfms=;
 b=clQEJyvn28DpXbWRsv47G1kOb0h79vMGeiZXifHMq4GB9+c6hjG9+p+KTxehBifHwM
 xY+hyQf/gZP9RSwkkRXSPGoKvi8iNtABt/q9/PHvtS2xaNoC3KWrHiaSC+cOKKYq1o/4
 g9zND3/nFF3wYjfKnHDJlgDFbQqVgh/ky0fjNoj2jwe8u2iMcajdFq4+ok4F0IRLhFaX
 oLF+4PCkR283pJhINWovD94tlne7YUu4/5Bn1i1rOMpChi1Bwl5K6JsLQ4wYCPTMch/U
 exQfUQrxQ4BeBfUW5DFfV2UTHlwOdTHedlQVv6m/bXj4A/LW4z/uYH6L8TsLnnU8WFoa
 GX9w==
X-Gm-Message-State: AOAM532ePwJG7fvNDxoQsIqaMh9dnq27kpWH7E8Dveom1w3lLWQprhcv
 KJvl2emmYLml53DPqM/NWW10pGLCvKj9mK3vv6CEaA==
X-Google-Smtp-Source: AGRyM1sqtfnCcCgh8Khfb46b+/ABYB4avOhXw6CqGZKt1bAmFTvfmQOze1FUWbJP57+fQrUg7BuRhKudoLO/Awqv05M=
X-Received: by 2002:a05:6402:90d:b0:428:c1ad:1e74 with SMTP id
 g13-20020a056402090d00b00428c1ad1e74mr7348195edz.345.1655226321797; Tue, 14
 Jun 2022 10:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-32-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-32-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 18:05:06 +0100
Message-ID: <CAPY8ntDnTH9vzr0Nxu=P5cLh7MTc2MhBM4j21T_ZY_k3PiNNkw@mail.gmail.com>
Subject: Re: [PATCH 31/64] drm/vc4: dsi: Switch to drmm_of_get_bridge
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The current code uses a device-managed function to retrieve the next bridge
> downstream.
>
> However, that means that it will be removed at unbind time, where the DRM
> device is still very much live and might still have some applications that
> still have it open.
>
> Switch to a DRM-managed variant to clean everything up once the DRM device
> has been last closed.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index bcaf87b43cbd..10533a2a41b3 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1584,7 +1584,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>                 return ret;
>         }
>
> -       dsi->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +       dsi->bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
>         if (IS_ERR(dsi->bridge))
>                 return PTR_ERR(dsi->bridge);
>
> --
> 2.36.1
>

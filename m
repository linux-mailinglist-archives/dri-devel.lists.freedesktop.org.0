Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4638F462
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 22:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECA76E94D;
	Mon, 24 May 2021 20:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524776E94D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621888169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aM5BlbcF5ShA/EMmaqQOt8kM02ccUq9Nt6SsMiIbryc=;
 b=aIPFfiVSt4RDUb0bCea094V67v93RkOi5nFZX6tTayv1NuDj3l/kC3hnj7UXPXN7Yk9rXf
 FaJmne9dnF21AbkpPAdEkNg3ZMJY3HyhcEitGtHaSyWkb21ZNs0/zlDKubpdocVdy3wJQu
 MHQXpAVoF1Ml8oz0isuXdMaoiF3Whjw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-ka-0EmEePDaeCYbsCOvzAw-1; Mon, 24 May 2021 16:29:25 -0400
X-MC-Unique: ka-0EmEePDaeCYbsCOvzAw-1
Received: by mail-qv1-f71.google.com with SMTP id
 i14-20020a0cf10e0000b02901eeced6480dso27050817qvl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aM5BlbcF5ShA/EMmaqQOt8kM02ccUq9Nt6SsMiIbryc=;
 b=cG/CMgp/pHPM6nUYcjIRIqigQtZiGVnxQkO8VCUUqfN9v+h8hbPgeKoUcErCzt74XH
 /m8iENcQvBXOSScNqLQML6jU+K23PDmGGPgmJUgXhxwDT1Hsw+9ELlxPx4hhC1CHXjXF
 h5W9tiWMvIgJwyjFtGOtOLp6w4sii9FfQU4XJpBOFAeragpF48Xjo1z3tal+iONvb6uQ
 oac7tOOjeSMy4ziR+acu5drvysOEcRpeQJzajwRnTK7SOWKkJ1GKR4E8PyqadV+zxIAr
 /CDM1uKE13TmNSswabDp4bpcml7tmY/DwD/o6hDVW4ju/fXm0L11Bl19+N3QoP+8ggpz
 dtVA==
X-Gm-Message-State: AOAM533P38zGDt233x81GEZCu8+T7oKGacAxy/BRj9/w5GS1+o22buY+
 ttLnXH/gF42U98jUokfuqtWgc7H2Y3TxwTj2yyT7DZiMhv6wWDcrNvQdBCojC4X0cgeerioZPjo
 ms/57ISUz5NW7pjnts3ci6pR5Z4lD
X-Received: by 2002:ac8:594a:: with SMTP id 10mr27755390qtz.293.1621888165118; 
 Mon, 24 May 2021 13:29:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydFmC/nU4sjsnnU0eNnpKjJNtYwE0t39aBuiF0Lqkl7LWb5yxJqiBw5WLqUzup4nSZcLwzPQ==
X-Received: by 2002:ac8:594a:: with SMTP id 10mr27755365qtz.293.1621888164914; 
 Mon, 24 May 2021 13:29:24 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p10sm11665950qkg.74.2021.05.24.13.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:29:24 -0700 (PDT)
Message-ID: <b0e6b0957716c9bc65e22ed989a73f050522e375.camel@redhat.com>
Subject: Re: [PATCH v7 08/10] drm/bridge: ti-sn65dsi86: Add support for the
 DP AUX bus
From: Lyude Paul <lyude@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg
 <sam@ravnborg.org>
Date: Mon, 24 May 2021 16:29:22 -0400
In-Reply-To: <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Steev Klimaszewski <steev@kali.org>, Thierry Reding <treding@nvidia.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For 7 and 8:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2021-05-17 at 13:09 -0700, Douglas Anderson wrote:
> We want to provide our panel with access to the DP AUX channel. The
> way to do this is to let our panel be a child of ours using the fancy
> new DP AUX bus support.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v7:
> - Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
> 
>  drivers/gpu/drm/bridge/Kconfig        |  1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index d25e900f07ef..294d0bdd4cbe 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -280,6 +280,7 @@ config DRM_TI_SN65DSI86
>         select DRM_PANEL
>         select DRM_MIPI_DSI
>         select AUXILIARY_BUS
> +       select DRM_DP_AUX_BUS
>         help
>           Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>  
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 42a55d13864b..a59497f7e504 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -23,6 +23,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_dp_aux_bus.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
> @@ -1446,19 +1447,27 @@ static int ti_sn_aux_probe(struct auxiliary_device
> *adev,
>         pdata->aux.transfer = ti_sn_aux_transfer;
>         drm_dp_aux_init(&pdata->aux);
>  
> +       ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
> +       if (ret)
> +               goto err;
> +
>         /*
>          * The eDP to MIPI bridge parts don't work until the AUX channel is
>          * setup so we don't add it in the main driver probe, we add it now.
>          */
>         ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux,
> "bridge");
>  
> +       if (ret)
> +               goto err;
> +
> +       return 0;
> +err:
>         /*
>          * Clear of_node on any errors. Really this only matters if the
> error
>          * is -EPROBE_DEFER to avoid (again) keep pinctrl from claiming when
>          * it tries the probe again, but it shouldn't hurt on any error.
>          */
> -       if (ret)
> -               adev->dev.of_node = NULL;
> +       adev->dev.of_node = NULL;
>  
>         return ret;
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


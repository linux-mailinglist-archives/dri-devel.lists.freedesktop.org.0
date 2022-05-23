Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90B530C65
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 11:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2CD10E604;
	Mon, 23 May 2022 09:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A0010E8F5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:48:08 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id ev18so13524682pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKUDQ3F4xhcfDscU9aeu1UWQ3MFRozvXU7TP/Rwx8HE=;
 b=VFvV54sVbS+407YieQo3Kjfhv4vhzlJfL1esZd3OLMUeGdF11m025CZ+7s/iwiQ8nY
 QD27rEF16230QG3ko/xISZvAjNB0XqQOfT/kH++B/TXmPpJe4gZBTrJzTsw2El8fcOH0
 zD0WJvdf4Fn0OMuyNq7aQb7Tv5hrBM/Vv7VixWoT07VwXbJQzlNou4TIRAaoHFrMRkMx
 W5Czvxy72iQ0YWFwnFnZSXtZvshkZpG0cSNAorpuf9aYOtlRUlfRNZZQtfb+qouEmteA
 vAJtPhj7CtLiTxPvzT3vi/EOTbveRdtnasO3rjuVJnfIAZTpS1ECSXrDMTx3tC40CTKt
 4Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKUDQ3F4xhcfDscU9aeu1UWQ3MFRozvXU7TP/Rwx8HE=;
 b=TFdUPbdFr5n5XjO2p7AsfPZvpf0+GP8f8t+jD8dXtTtJCeWDe91Ruvx/Zu0rKbANb5
 niPSLD9YdVlk1iRLr4ySON2ZesM4KM+IXmwa74fI+5XL2l7sSgyUkekkCGL3bQ8k07iH
 2xC2iHj2Spq6LCiVwzFCyQU/hRrAvRA/aziotptdyua9EX3WlVX5WEiREpGPu9bhKFq/
 4MxjwXdkXISs0m5QhXAqaBf0KkzBFA5DTCJj8irYNrv3h65pAj954qDfJyfUsb3t8M7p
 7k6UPjXs+DMermjbAo3Espp7ld8PoFlU6ci4OlAb0O8AvkOMSxsTLUoOiWxXpbAliZE6
 XhNA==
X-Gm-Message-State: AOAM530jvaPhSad1XYuhJOCmVliNgDQ/JmlYf3YZ2TAJWWFs8Nz7uZeo
 yMnKtKzRxO8jK08w+1wW9opJftviFcq82hCOqaNP3a4EsVw=
X-Google-Smtp-Source: ABdhPJzzMm9fRMvsfn+22FSz6UYVyYmK56z5cgr6g/KPhKfNIExBTLmQFqyl+dx+aXsWQZzyE3KDIzXYypkvFYSfbXQ=
X-Received: by 2002:a17:90b:380f:b0:1e0:aa6:9e24 with SMTP id
 mq15-20020a17090b380f00b001e00aa69e24mr14405999pjb.232.1653299288384; Mon, 23
 May 2022 02:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220519112337.62198-1-marex@denx.de>
In-Reply-To: <20220519112337.62198-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 11:47:57 +0200
Message-ID: <CAG3jFytK-RF_yS7zvr6LL4QqVzzVV=Os4Sv1Ht3eUZgreeHD=A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Add missing of_node_put for endpoint
To: Marek Vasut <marex@denx.de>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 at 13:23, Marek Vasut <marex@denx.de> wrote:
>
> Add of_node_put call on the endpoint node after it is not needed.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 53a5da6c49dd3..e92eb4a407452 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1638,6 +1638,7 @@ static int anx7625_parse_dt(struct device *dev,
>                         bus_type = 0;
>
>                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> +               of_node_put(ep0);
>         }
>
>         if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187E5A4E93
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961E910F2D2;
	Mon, 29 Aug 2022 13:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444B110F2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:51:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id kk26so15788903ejc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=C2AjxMNWtzIecaqFsK7iRg4ch6dPyQx/KkfOOxiXtYg=;
 b=j6qW4o3z3baEDyFDKHuHqekQwtXbltPLi5duAgmuHm6bFSRWytH3Cvnp3br51bwDZ4
 iVeXMqGEjF3Arg4umGGmkAMgblbqyT1rPNHDTd/JtXOmZQY+oh+D+vQfQ96oJjXfabMf
 Up0NNnhMjRuILZTQlIw+zD4iRQdRSr85aTK2z06BHQxdOkV4p+oYwQzyHDVDHJw/SPyW
 gY5r/Vt54KS8CkPBfrnbtkEOXPKenXrmWJRNBpWvfo8FfVVj+tEppY6T0djYnhnbMfdV
 yWkbnXT1O7sCPmgsWAL3MfAiuqwE76UIs3Uu+BBvWdr/zrA4srpuWhnss1pf4EZHhLEe
 uGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=C2AjxMNWtzIecaqFsK7iRg4ch6dPyQx/KkfOOxiXtYg=;
 b=Zx5KHHUu971He4yUcM0SUl8Zzn4MhoGE+1NYRMp+ie9VS6U5pmc5dvOrr+72NwYvB9
 j5lu5TPIU0LT9tWm/VDnqGb0ev31f96xx5kDUWjJDeeoaJNuWWSThBucPUxP1ZS9gBWe
 gzOiegSc0lzaio+kNWsViTugz8LBk7x5VoIpH90/2XBESB0SxQD5r3aPZipIzFEqwKD/
 l5mCuKhk/Pt5+YNK40R1DxswoNl0UUOOf/NxkrqkylwhnKAJTuTptNV8btE0wfQ3/TBg
 WG9+RTJcGrDrl/8pToFCYPuXa/KYwJR+fXzG8pTyAl88lAo7QMf9Xv8SbRWpwgpwXfzl
 p2GQ==
X-Gm-Message-State: ACgBeo2xbQ+OkfMPtn2/fJ3xu15ljnSRJl/G5f1tJnCCu3W9/q3NOSMl
 7zYpaPeOtVgcY5rWNKlZ8FGI4bILXmRjmf3gMz4zUg==
X-Google-Smtp-Source: AA6agR5N6OvgYRnL1gCQiIwUvNMBbnV9YYUPJqU898krDerbnUiyVa4rqTO2acXLCLQG7084iwFQay5QIxtE8nAp1tY=
X-Received: by 2002:a17:906:cc5d:b0:73d:c534:1aaa with SMTP id
 mm29-20020a170906cc5d00b0073dc5341aaamr13534876ejb.626.1661781091816; Mon, 29
 Aug 2022 06:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220812205746.609107-1-mairacanal@riseup.net>
 <20220812205746.609107-2-mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-2-mairacanal@riseup.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 15:51:20 +0200
Message-ID: <CAG3jFyuMF4+Zfu2eDrE96nO7EWfhhQE8a+VQ=HhJ+iLYaX8HZg@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/bridge: anx7625: Drop of_gpio header
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maira,

On Fri, 12 Aug 2022 at 22:58, Ma=C3=ADra Canal <mairacanal@riseup.net> wrot=
e:
>
> This driver includes the deprecated OF GPIO header <linux/of_gpio.h>
> yet fail to use symbols from it, so drop the include.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 79fc7a50b497..d7d4ca1c8b30 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -17,7 +17,6 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>
> -#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_platform.h>
>
> --
> 2.37.1
>

This cleanup looks good to me.

Reviewed-by: Robert Foss <robert.foss@linar.org>

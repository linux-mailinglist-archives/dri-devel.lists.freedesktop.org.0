Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C779634E4B2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 11:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5D889DA7;
	Tue, 30 Mar 2021 09:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9989E89DA7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 09:47:34 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id h25so11346894pgm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGCwqtBh5e8u3epq9hm9uWTKU/mvxMc5LzboEqjR5ac=;
 b=yoVqqgGgj7ynFu+acwLsEEeSTxp3/IH318UbzA+RDe0R5OFjOJBmvLP626r5S2TJxB
 Y0tpOxk8cFsRqmwupoic69xUn/pcuaa8i4u6wd+vlwRXau3v2JduEeZTSEzuMjQ+nqbx
 WoJxiIq+Hh83TdT429V+fLJnpJlR7LjP1omYMRXCiW7P80dIwSsWZ7PTGEKL7ZxDId6O
 mGicXwrLXh0ZWUdFbsAqUjTBmjFbTsYcFSINy0ZV9Kahqlm1qpkYM3cLFSw0mmcvLZ4J
 YcJm3fWf6mFstXdjw1BgC/LnR/UWa6lw6SnahGYRa7zzMBefu+ETf+wpW1xMaEyEMsGS
 8/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGCwqtBh5e8u3epq9hm9uWTKU/mvxMc5LzboEqjR5ac=;
 b=A22W931OOXqu12+hb8Nhs9corEmCiG+cgjmQuFfIt6CFVcYQyBmq8kFn4cO5rObq1I
 x2+BkDlIUKK2d+8Rb3Y9AbOoqA1y8q+qrcnFZYss3H9cdCsCwRoo1lhQektuWnmRa5Ih
 pYj8rSDAAn+h9jFqeINvZ/nidpmC4iDElx/SkQ7xcHv3gp9WgR87xYP3N3CIHPwe2NKK
 fUqqISspirwO2RACR24wQCDkRWj0aO7Q9ogg9GWNkn7L0Mk5bQIyA3nj9cxtSnLKu1qY
 DurZdSCDl2rlE/1bEgVlNAjggCzyX0Mm8NqXlSYJNu4CQFQfDAp78hOf+3k7ev/MkbSx
 M7Kw==
X-Gm-Message-State: AOAM533OlJBJsLgeAYp901IOuB8/yFZ3kJj276lqxMjtoQkTtaIq/TQn
 /Ejr3/+4yILwYMXcw9dGyqL24lrKYxgCtvmmJ95PCQ==
X-Google-Smtp-Source: ABdhPJxKR+SUTvxcY30ps7I6bqWV/0GIM4bydaCDZ5OATZ4vJbib2heJudE4XVfjMcSHYfSbjImq0lOEfhuZJiOgvA0=
X-Received: by 2002:a63:7708:: with SMTP id s8mr21456979pgc.265.1617097654308; 
 Tue, 30 Mar 2021 02:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-15-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-15-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Mar 2021 11:47:23 +0200
Message-ID: <CAG3jFys3sgrL_q-gifNrLhbGzKRbjkvVTHckYNTTBET5oWJtKw@mail.gmail.com>
Subject: Re: [PATCH v6 14/14] MAINTAINERS: add maintainer for DRM bridge
 drivers for i.MX SoCs
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, lee.jones@linaro.org,
 kishon@ti.com, linux-imx@nxp.com, linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 s.hauer@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liu,

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 17 Mar 2021 at 04:57, Liu Ying <victor.liu@nxp.com> wrote:
>
> Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5->v6:
> * No change.
>
> v4->v5:
> * No change.
>
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * No change.
>
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b705ba..488e0ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5939,6 +5939,16 @@ F:       Documentation/devicetree/bindings/display/imx/
>  F:     drivers/gpu/drm/imx/
>  F:     drivers/gpu/ipu-v3/
>
> +DRM DRIVERS FOR FREESCALE IMX BRIDGE
> +M:     Liu Ying <victor.liu@nxp.com>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> +F:     Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> +F:     Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> +F:     Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> +F:     drivers/gpu/drm/bridge/imx/
> +
>  DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
>  M:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>  L:     dri-devel@lists.freedesktop.org
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

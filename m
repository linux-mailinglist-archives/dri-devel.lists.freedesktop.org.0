Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE232623A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 13:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BC36EDCE;
	Fri, 26 Feb 2021 12:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19CF6EDF6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 12:00:07 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id i14so4241501pjz.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OTt+hzwUzbEnNK6etaUVSe6BNGtkKbiycN/jXlNteq0=;
 b=asNZJiY/ZN5/+Dh0isecfCCWU4RODpQNusNjrlECjqzWIL/uwWIBOBPJCh5a8J+icW
 58k9I4EH5I4J8AuSpTqnnQcatHcS4FICl89ylMgE79cPJMPQlwoD4Z/p7k5XYUTnrJ9i
 DBGfYfLLHS7jSrrdepRYAYw2f2QJMR6adyYDSKAMy3Mx/V2f7O3VJO1n4oyhEBPiNSeX
 L3u7OGk5NKdOPy6L05PUQtw8Fz6ksdNKiN25JGwnR/7D9ujyhoiPYkrB63j8RRydcs/W
 LnXCfsNq7zfQLv/doZ4JHMDtMK2LOK9POnSS9qDubVbq2SgAs0KoG9BWMjrMktcCJ+gf
 PUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OTt+hzwUzbEnNK6etaUVSe6BNGtkKbiycN/jXlNteq0=;
 b=sWvaNvXdB9J0c1K96MB4UNQ67rgLPg2jviwp4itbUupLs7cMw3I/FZ/D18Ve5GiFx5
 VL0Dn8Z92e384bz/nSkynD01/2wsjHQ/6WFYbKMsrUrN5cXk9sGKxN1eg7EptKTsoThs
 csxd2X4EB6cdgqx9YXyn/TKofGfd0hkpT0Ot3HY6wc/wu+jD7C5wKHhUjhIf5eO26U+a
 D3TK+Rja7b1xDuPiX/n0xAKSD/cBf05LGJ6O1Mq0BGx+Yj8AxsSCvKNwa2+epMPWbetL
 iGgMPkeDo8zSXIBkX0MUtzFoB7/flxKY/UfrwCQ2pDrRxqUo1HsnDtkDVtnRICmMyK/2
 Kqrw==
X-Gm-Message-State: AOAM530wVxr2GqerCiELaHC4PVJgzMYNaaYRfrcS1V3Ko11DkhyXJnZ6
 /bfV9lRXjiAHnbTmvmJMziDNwOCb2T7T6DcuBVD86A==
X-Google-Smtp-Source: ABdhPJyfnocGVGubk0og9fBr+6c+QqVcyum8wyer3OWW0BX2xL+xddU+EDj2PYGrP8++GK2VEYgewJ7knmtQVGv/4t0=
X-Received: by 2002:a17:90a:8b83:: with SMTP id
 z3mr3182942pjn.75.1614340807377; 
 Fri, 26 Feb 2021 04:00:07 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-3-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-3-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 26 Feb 2021 12:59:56 +0100
Message-ID: <CAG3jFysoPCDW5RQeDLa3b97UrH0yKi=K=tJLFuXK6YZHZm+T+g@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 s.hauer@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kishon@ti.com,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, shawnguo@kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liu,

This patch looks good to me
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 18 Feb 2021 at 04:56, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
> and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
> The RGB pixels with padding low per component are transmitted on a 30-bit
> input bus(10-bit per component) from a display controller or a 36-bit
> output bus(12-bit per component) to a pixel link.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * No change.
>
>  include/uapi/linux/media-bus-format.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 0dfc11e..ec3323d 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>
>  #define MEDIA_BUS_FMT_FIXED                    0x0001
>
> -/* RGB - next is       0x101e */
> +/* RGB - next is       0x1022 */
>  #define MEDIA_BUS_FMT_RGB444_1X12              0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE      0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE      0x1002
> @@ -59,9 +59,13 @@
>  #define MEDIA_BUS_FMT_RGB888_3X8_DELTA         0x101d
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG                0x1011
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA       0x1012
> +#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO       0x101e
> +#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO       0x101f
>  #define MEDIA_BUS_FMT_ARGB8888_1X32            0x100d
>  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI                0x100f
>  #define MEDIA_BUS_FMT_RGB101010_1X30           0x1018
> +#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO       0x1020
> +#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO       0x1021
>  #define MEDIA_BUS_FMT_RGB121212_1X36           0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48           0x101a
>
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

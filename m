Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790973262D8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 13:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE166E3FE;
	Fri, 26 Feb 2021 12:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A782F6E3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 12:44:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id j12so6156612pfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 04:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3RToDDj9t1WukrTixwLWcxGkVwEEocSrMyQzXbk3sVE=;
 b=k0clAFjouDL7G4Qzgcy4jMb5iykmG0xTitLDNh4eq3muVbP87c91yNC8s/uzrm5X45
 Zxc2eP2GueAiL0CawdsSg3BfN2tpFqiHDz+KmFDXwIO+uFI1VRiZRmia+m4V8NvPFdHj
 gRc2j1nXbiJhqCJjAl5r2gFc4lCeDLu7PD4ZISNS1K3xeumxA+ZJ1E/9VLAXeyIZGGIJ
 +p3zRkOJrYpHEfSPjqTnay3X0wo2D2DJ9VCid0lk3hZwqpb+18SCK0UeHvU6NPESNRHl
 XKOLHAgY4+/sECTIg82bmVMgQX6tn+M9zNTpRjdeiQN+T/PzvJaaxNRZ6EM2BT7rHfqa
 IWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RToDDj9t1WukrTixwLWcxGkVwEEocSrMyQzXbk3sVE=;
 b=hyqFp/qLrh8L+8+PB0TA2W76qsGos21YRABzDsfebulXtMvf5AO/ICnV54+CPzeu51
 lLl1izVThPANjWreNnwQbPGpy93NfHXMW4HlBTR97XFxxYBz15Q+nnnNjxkOMg+ZgMBk
 uqpJHzyDpXqFEvoFyWTWiSDe+XRBKc9WBUpT/Ssjk5taHT2ZX/nV1euToJ3eqAWbnwQb
 kzMWS6yLZyYKFsBvZtO/8ALRLYx5+jVFsjC7RJmVMHv5JJ7tXh2P8/szQQmxMTuj8FoU
 JXpCoi3S3EfQsCVYj76l2J0JfCT0gI3myfvZ0vdqXtUCMgz54oVyCwuBuJrf59UHPn11
 qwNA==
X-Gm-Message-State: AOAM530dO5fCNOtSY37xM/L1A+eNrmkEEY3O4UY59jHSTrflQi56TFG8
 3HNrlnVsiR6h3+ZcQVu5tNHcQIa8ofm/kEZuuQ0UoA==
X-Google-Smtp-Source: ABdhPJy0t34lL7z1JpPxSn8yDzGP/55kmin97Q6FmWKl22jUKv+hYUQu90YkYuAA1aUsOu9GHrOkX8fU5azwppFjaHk=
X-Received: by 2002:a62:7888:0:b029:1ed:cc30:923e with SMTP id
 t130-20020a6278880000b02901edcc30923emr3251233pfc.12.1614343468239; Fri, 26
 Feb 2021 04:44:28 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-4-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-4-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 26 Feb 2021 13:44:17 +0100
Message-ID: <CAG3jFyvZfUoN7KXoodLrem5OFWERuoc4Avh8No4UdYk3c-GszQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] media: docs: Add some RGB bus formats for
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

This patch looks good to me.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 18 Feb 2021 at 04:56, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
> RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
> pixel combiner.  The RGB pixels with padding low per component are
> transmitted on a 30-bit input bus(10-bit per component) from a display
> controller or a 36-bit output bus(12-bit per component) to a pixel link.
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
>  .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++++++++++++++++++
>  1 file changed, 156 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 7f16cbe..201c16d 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -1488,6 +1488,80 @@ The following tables list existing packed RGB formats.
>        - b\ :sub:`2`
>        - b\ :sub:`1`
>        - b\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-RGB666-1X30-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB666_1X30-CPADLO
> +      - 0x101e
> +      -
> +      - 0
> +      - 0
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB888-1X30-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB888_1X30-CPADLO
> +      - 0x101f
> +      -
> +      - 0
> +      - 0
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
>      * .. _MEDIA-BUS-FMT-ARGB888-1X32:
>
>        - MEDIA_BUS_FMT_ARGB888_1X32
> @@ -1665,6 +1739,88 @@ The following table list existing packed 36bit wide RGB formats.
>        - 2
>        - 1
>        - 0
> +    * .. _MEDIA-BUS-FMT-RGB666-1X36-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB666_1X36_CPADLO
> +      - 0x1020
> +      -
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB888-1X36-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB888_1X36_CPADLO
> +      - 0x1021
> +      -
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
>      * .. _MEDIA-BUS-FMT-RGB121212-1X36:
>
>        - MEDIA_BUS_FMT_RGB121212_1X36
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4B3F7F4C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 02:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616A06E442;
	Thu, 26 Aug 2021 00:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6BD6E44B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 00:31:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C20E760FDC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629937880;
 bh=XFk+aK01AY+R2dj58lCttstlbncJMKuBtfKozV0XaIk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QkYeFlxOalO8NtPJPM5RhBh8j7Vk2Zi/9UTqamt6lR1JmceRcWO1Uxcmj9AJYi2WL
 BfXUFl6Lh4/+LO6SPiNnWNR0T08/oUuWRQccKiGhq40Bw0pX5zYDYYmZHRVgUZQju1
 RYaIUmqxl1R6iWeI8/kYNwgVsw3GogsX9cX86tdiy7WCQI62kbTW6M10B9JTOTYmRE
 ZXLUVEbFSyEmiP2/JTA8qRcwzE7PlzW5Vuhf3imFCMVDFjcGuD9nNy/6erFSpI0OWv
 Z0YZmFtloHBVkgv7jaPurnVS4Tg6m5skjE085rnzXbw4M2kyZft8/o1Dwm55121Q2s
 3WhmWQENq/tzA==
Received: by mail-ed1-f44.google.com with SMTP id q3so1810579edt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 17:31:20 -0700 (PDT)
X-Gm-Message-State: AOAM530pCbIWSD71Itm9RINcZIMwuyYDg23VfnEAdZ5Iz5raRtU6SKcC
 R9bmNypZesXUO8xn3KqnYrp+do8mcW9cYq0C1A==
X-Google-Smtp-Source: ABdhPJxHrEFAQXvMGytASwC6d51UlxpmRysieIO6RqrSrlKKQl0Fvx1UuUCVLhd0YlH7mrdO+2L/kgf90DT6ck//90g=
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr1341608eds.162.1629937879396; 
 Wed, 25 Aug 2021 17:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
 <20210825122613.v3.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
In-Reply-To: <20210825122613.v3.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 26 Aug 2021 08:31:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9anqUZ-um4bP8Gzf4HZT5+j+yVpTq6pQzESpamrGLM8Q@mail.gmail.com>
Message-ID: <CAAOTY_9anqUZ-um4bP8Gzf4HZT5+j+yVpTq6pQzESpamrGLM8Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: display: mediatek: add dsi reset
 optional property
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Eizan Miyamoto <eizan@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2021=E5=B9=
=B48=E6=9C=8825=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:26=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Update device tree binding documentation for the dsi to add the optional
> property to reset the dsi controller.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Added a new patch to describe the dsi reset optional property.
>
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt   | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t=
xt
> index 8238a86686be..3209b700ded6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -19,6 +19,11 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be conne=
cted
>    to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
>
> +Optional properties:
> +- resets: list of phandle + reset specifier pair, as described in [1].
> +
> +[1] Documentation/devicetree/bindings/reset/reset.txt
> +
>  MIPI TX Configuration Module
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> @@ -45,6 +50,7 @@ dsi0: dsi@1401b000 {
>         clocks =3D <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
>                  <&mipi_tx0>;
>         clock-names =3D "engine", "digital", "hs";
> +       resets =3D <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
>         phys =3D <&mipi_tx0>;
>         phy-names =3D "dphy";
>
> --
> 2.30.2
>

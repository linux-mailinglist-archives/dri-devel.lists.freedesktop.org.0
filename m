Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB1A3D393C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 13:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899C86FAD9;
	Fri, 23 Jul 2021 11:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B83F6FAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 11:13:59 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 o17-20020a4a64110000b0290263e1ba7ff9so285610ooc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Nwk9qPAQEz7a/8yg7VWdxwdIwFtkYHBh+612HjXFR8=;
 b=ed8KUGsfCqWAQcQfBhF88Y9OVbMf4kku9i0iSmPQyK4UKJA8IW5SwF4EiYlGu5gvXZ
 9zOtQB+o4iAK73tSfN3TlCHiB0dOF9wOXyxpoQ3Hk3aw/Iwif3d9xeq0OWQ06Mo0P9Vk
 5d//f/EJQcO/kNZCkh/zg9Z6DEE9RnSunxT6W/jy9Fa9XF/EaGVTWFs1uda5bTvuHhhm
 pCjHFdJfBbdSyBt2DY/Cv5PKRLsF6cHoKCJe7/sxvC7sZlEHwS016uiJb36x3RQoTKc5
 lL1D5HjuBEmQXMoBhVXoTfAg09+M0tKn2jLDax6QxhSO7OiFYp7fSUwUFTJAKhCi3dc2
 R8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Nwk9qPAQEz7a/8yg7VWdxwdIwFtkYHBh+612HjXFR8=;
 b=acV09dyIZs78flH3S/C8luhJFyTktOLv0nutTnx68e5mDy/qiYH0m5dWACaWXoHd3l
 rO9DabfHRKK08l8zOjjaQkG90nuU5gTIcqksj2fXk3RT9oaoNCrPVpNAyq6v0NZTqcrr
 YVMOoniVlYZwQfa1xaCvnqZ5Zt7eJIQn4aNIfH8fM6iNMI+xEpItXdLDPwWattwSThnt
 kOt2lzXoKq9fC6gRiyQby2unwzUYvkp/FRBrItnqRHelMlcD7opSk3LxD1wS8zb2PniP
 qDyj4/ZP8D+2bEvipgbTnSKq1AvJr0xLFrEp7vryo9KXgye3fS2WgnOAUqW6SLTgfHUi
 jfYA==
X-Gm-Message-State: AOAM532/UeASSTdVGJguDHk9N6mlh6UAABn6ARdKiAhf1n6jjzZhlguu
 kZl1KyXx8Ii6BT3J8w8p+pkPRtmLQB0uqIRyZsc=
X-Google-Smtp-Source: ABdhPJzNCCp8fTtO0kzSFLOUM+lawDoT2CfKUL3Rr/JKyIfNM4DwmUjfKyJ5eSEbSZzASHckgWxaWjAwJmhGfdvT0m0=
X-Received: by 2002:a05:6820:444:: with SMTP id
 p4mr2336576oou.75.1627038838422; 
 Fri, 23 Jul 2021 04:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210722092624.14401-2-jason-jh.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 13:13:46 +0200
Message-ID: <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Thank you for your patch.

Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 22
de jul. 2021 a les 11:26:
>
> There are 2 display hardware path in mt8195, namely vdosys0 and
> vdosys1, so add their definition in mtk-mmsys documentation.
>

Just having 2 display hardware paths is not a reason to have two
compatibles, isn't the IP block the same? Why do you need to introduce
the two compatibles?

Thanks,
  Enric

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> this patch is base on [1][2]
>
> [1] dt-bindings: arm: mediatek: mmsys: convert to YAML format
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/
> [2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 2d4ff0ce387b..0789a9614f12 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -30,6 +30,8 @@ properties:
>                - mediatek,mt8173-mmsys
>                - mediatek,mt8183-mmsys
>                - mediatek,mt8365-mmsys
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
>            - const: syscon
>        - items:
>            - const: mediatek,mt7623-mmsys
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071046EDD47
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3572010E6BC;
	Tue, 25 Apr 2023 07:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686CA10E6BC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:55:39 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-b99e0ffbabbso1463744276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 00:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682409338; x=1685001338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=32lcqM6Fq0qcXElBsoyKk2B7Vu57XT2++1XOz45oKjQ=;
 b=XYEVtbDmR62hFZ7ek/SRPv7LAvEv1dXG/Jx9HcihEAwcMoPgALdHN+8mQLZijM1xCg
 cFiklSxZP1ebsN/eHhiLlBi/dlFNRvZp77OqO7kLSJYs/MrikK5LMHoP3dbE1LJr50NP
 fDcKz5noVqN5xNQbLe2ykJ4zXTpT3dGASDP8mFQs0TTPWRDzJ7+p0SPF3Jd8JTHbfHVw
 Ibx7odSxlmwOw3hE1+N9Shmt5F5B43uy0adkKGFWchGY7Gy4knxY20gslCDEeNdfCiim
 bPMVW7gwUT9Nbckb6Frqrd0YafjzVLz42mUJGZ7aL8aery/+HFg4f2qRtSWWglhmyn6B
 sEFQ==
X-Gm-Message-State: AAQBX9etEVsOFh5SIGJaXUg4T1SIqAu3z9O4vmwZa0Wc7H/a4I5gEv/J
 ckmsq4y+k5+C2Vt2Ztsy5MdwqH0Fafvj2Q==
X-Google-Smtp-Source: AKy350a/ZLVKFt/9uFoNjLCkqVZlBWDQsWGU5KvVT58ENHvgx0XpZqmi2I3kNZiUoz7Kt9Ob+Y9OkA==
X-Received: by 2002:a25:4243:0:b0:b75:9a44:5342 with SMTP id
 p64-20020a254243000000b00b759a445342mr11590983yba.4.1682409338050; 
 Tue, 25 Apr 2023 00:55:38 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 y2-20020a056902052200b00b923c50bd3fsm3363358ybs.15.2023.04.25.00.55.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:55:37 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-555c8a12b26so61716037b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 00:55:37 -0700 (PDT)
X-Received: by 2002:a0d:ccc9:0:b0:546:4626:bfc5 with SMTP id
 o192-20020a0dccc9000000b005464626bfc5mr10570998ywd.31.1682409337504; Tue, 25
 Apr 2023 00:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 09:55:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
Message-ID: <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Mon, Apr 24, 2023 at 6:10=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add my self as maintainer for RZ DU drivers.
> While at it, update the entries for rcar-du and shmobile.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6948,7 +6948,7 @@ F:        drivers/gpu/host1x/
>  F:     include/linux/host1x.h
>  F:     include/uapi/drm/tegra_drm.h
>
> -DRM DRIVERS FOR RENESAS
> +DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE
>  M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:     dri-devel@lists.freedesktop.org
> @@ -6959,9 +6959,18 @@ F:       Documentation/devicetree/bindings/display=
/bridge/renesas,dsi-csi2-tx.yaml
>  F:     Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.=
yaml
>  F:     Documentation/devicetree/bindings/display/bridge/renesas,lvds.yam=
l
>  F:     Documentation/devicetree/bindings/display/renesas,du.yaml
> -F:     drivers/gpu/drm/renesas/
> +F:     drivers/gpu/drm/renesas/rcar-du/
> +F:     drivers/gpu/drm/renesas/shmobile/
>  F:     include/linux/platform_data/shmob_drm.h
>
> +DRM DRIVERS FOR RENESAS RZ
> +M:     Biju Das <biju.das.jz@bp.renesas.com>
> +L:     dri-devel@lists.freedesktop.org
> +L:     linux-renesas-soc@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +F:     drivers/gpu/drm/renesas/rz-du/
> +
>  DRM DRIVERS FOR ROCKCHIP
>  M:     Sandy Huang <hjc@rock-chips.com>
>  M:     Heiko St=C3=BCbner <heiko@sntech.de>

Who's gonna maintain the common parts under drivers/gpu/drm/renesas/?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

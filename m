Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F696D2FD5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5544610E136;
	Sat,  1 Apr 2023 11:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2932310E136
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:12:05 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id p203so29980885ybb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680347524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puWBrOAa75bVzNbkWYedWZA8RYAVUknhCQ2nSA06Dl8=;
 b=kHRkPjzla4CIH0kv0NXEiWaCIZYqPCHiYYVJoMD+/r6bNXffRIKJnkZiyngQIeDLkm
 PwZbG/PYAM3uJ8KltCHC0FevGZadQpYv0amSAc9Bk0nu1VlQ4gNo0hSEs8uEylihO8t0
 lrSmEcCBEwQUuqx6EunigTXLaFfAYKdVQwnug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680347524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puWBrOAa75bVzNbkWYedWZA8RYAVUknhCQ2nSA06Dl8=;
 b=kUyZDwTUXzSB7x7ymanoqbSf/QD96409JQ+er1U/CGpyIS6o8/ZjSA00yQiuHLVVtf
 ekSMWuDL5/uAyoojHLiRhuyveniPEH9k9icneP2K4naGnx2XuxqvzFvAitDi9gJ1QuUt
 KkAGSXPuoLwhWbs3IU8xcbeZ0Y5UYYEE8zpxs3FMk5tzl+XX6i3I9ZAlY4c09LwQKKbK
 2ovIZepz4RjyBP5SD6+17mAuBecrLVLwrignEO0wb6nJnZaUocdtXJkVqd+VwHuxQkZH
 S54iLuma6WzFB7MQEYejs0Liu7GW2QUHaSCIPnfIyehLvuyiCkFPA1+SFKO2G1Ikp3lW
 Rq2w==
X-Gm-Message-State: AAQBX9eSu15EXnSq+hlbaRRnO6O+8s22aJy3j33MRRfdIAEpoBznNiIb
 GHSO/ZYto/3MURz4EOvsk4zI9zzXVsx41QXTvvoNfg==
X-Google-Smtp-Source: AKy350bWxH1itHV15Sfs1g5EC6sZCHgG4SvMBURRoCBE+ZpjFzd2ZWIzgcTLo9d5JYm3DG6v722PvfBZ+iaf/Tsspfs=
X-Received: by 2002:a05:6902:1141:b0:b73:caa7:f06f with SMTP id
 p1-20020a056902114100b00b73caa7f06fmr19613568ybu.5.1680347523808; Sat, 01 Apr
 2023 04:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230331195746.114840-1-festevam@gmail.com>
In-Reply-To: <20230331195746.114840-1-festevam@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 1 Apr 2023 16:41:52 +0530
Message-ID: <CAMty3ZDsx_Z2MYxwPKVork0mKBoG-8wzwFu8WhBhOjUm2yq-Hg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to
 yaml
To: Fabio Estevam <festevam@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 asOn Sat, Apr 1, 2023 at 1:27=E2=80=AFAM Fabio Estevam <festevam@gmail.com=
> wrote:
>
> From: Jagan Teki <jagan@amarulasolutions.com>
>
> Samsung MIPI DSIM bridge can be found on Exynos and NXP's
> i.MX8M Mini and Nano SoC's.
>
> Convert exynos_dsim.txt to yaml.

Thanks for rebasing this.

>
> Used the example node from latest Exynos SoC instead of
> the one used in legacy exynos_dsim.txt.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 275 ++++++++++++++++++
>  .../bindings/display/exynos/exynos_dsim.txt   |  92 ------
>  2 files changed, 275 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sams=
ung,mipi-dsim.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exyn=
os_dsim.txt
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mip=
i-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi=
-dsim.yaml

Can you add this to the MAINTAINERS file.

> new file mode 100644
> index 000000000000..c131bd879caf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> @@ -0,0 +1,275 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung MIPI DSIM bridge controller
> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +  - Jagan Teki <jagan@amarulasolutions.com>

Please add Marek Szyprowski <m.szyprowski@samsung.com> well as he
included in the MAINTAINERS file.

Thanks,
Jagan.

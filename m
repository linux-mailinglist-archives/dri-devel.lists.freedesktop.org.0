Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43438149A6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C4210EA04;
	Fri, 15 Dec 2023 13:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858710EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:51:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3829A6261D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD300C433C9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702648286;
 bh=y/iEJzm4X2aoj3v6VMq6OOkn9aweR99iDcGhRGNFHww=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l8UocrCWzBFejIKKNaYHAsiEGFvvDJFDmfAl0BKDXi3v+JMUJBrfh01RAjEa3JuB6
 b3HuIhcPcTx/GSJ4Rz3pvhPWsrJjSwnTZiH/mrNlOD69X6NEDNtCH7WifAZIVy0PZy
 yK1OOe0aaOF7lf9KUVRwSOzCcItOr9qqDCKWedgDhCvRw8Qz8QxK5W7qSYxrJJwi0j
 mN3fReBMjeLwdvKaWeFuEqfK5fJ8i0/0Po4g4Fu8ASoM/UHXxzn5IVDddXIjwlFDHI
 8rwP5ayZqXK0VGLX1RZgav5KJH3WbyuhpuV93N5BZ6ADi8DfjLMYmZqiGK1LHqJqb/
 bOhEZpFVTuRHg==
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-28aea039fb4so1382687a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:51:26 -0800 (PST)
X-Gm-Message-State: AOJu0YwiTjkpJsrxbQviGSL65aIFCT1QjWaG6wPdO4lvBa/bEzB/YiOZ
 qC454nT+35AC4WSEWX5ohmW0plFXCSI4gK3OlCcmNg==
X-Google-Smtp-Source: AGHT+IETyf1mowVd36QjvJ2d/qRRtuk63qtIfp3XhLIonxNHR3SdnnmFZi4g/U8MZtcC43CtHBUrpL/m+3hm4gj5YCg=
X-Received: by 2002:a17:90a:65c9:b0:286:7c79:8dc7 with SMTP id
 i9-20020a17090a65c900b002867c798dc7mr14443376pjs.11.1702648286505; Fri, 15
 Dec 2023 05:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
 <20231212075257.75084-5-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231212075257.75084-5-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 15 Dec 2023 14:51:14 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4XiBhj2ME88XEgxUEeFvzO9y-1mytdg9HFseuH_JhzMw@mail.gmail.com>
Message-ID: <CAN6tsi4XiBhj2ME88XEgxUEeFvzO9y-1mytdg9HFseuH_JhzMw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm/bridge: tc358767: Sort volatile registers
 according to address
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 8:53=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Sort the list by the starting address to ease adding new entries.
> No functional change intended.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 5c0292b71e9fa..61d8710f46293 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2049,13 +2049,13 @@ static bool tc_readable_reg(struct device *dev, u=
nsigned int reg)
>  }
>
>  static const struct regmap_range tc_volatile_ranges[] =3D {
> +       regmap_reg_range(VFUEN0, VFUEN0),
> +       regmap_reg_range(GPIOI, GPIOI),
> +       regmap_reg_range(INTSTS_G, INTSTS_G),
>         regmap_reg_range(DP0_AUXWDATA(0), DP0_AUXSTATUS),
>         regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
>         regmap_reg_range(DP_PHY_CTRL, DP_PHY_CTRL),
>         regmap_reg_range(DP0_PLLCTRL, PXL_PLLCTRL),
> -       regmap_reg_range(VFUEN0, VFUEN0),
> -       regmap_reg_range(INTSTS_G, INTSTS_G),
> -       regmap_reg_range(GPIOI, GPIOI),
>  };
>
>  static const struct regmap_access_table tc_volatile_table =3D {
> --
> 2.34.1
>


Reviewed-by: Robert Foss <rfoss@kernel.org>

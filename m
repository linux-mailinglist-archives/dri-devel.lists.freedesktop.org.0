Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1AB8149A7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0BB10EA16;
	Fri, 15 Dec 2023 13:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A7D10EA16
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:51:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 18A74CE2F04
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B3CC433CC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702648315;
 bh=73cEBtW9UsDu4O//mVBqd0mdthw/P2/m9c5bPDUwqnA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GEOrcjkRItVZtLtqlzAR21mRcINvyI+V6P4AjrMToWv/meD38KUSE5h7xmQr5p5Is
 1R2ACeKTkaeQ23bm8uoZ4PT/J7TbnuV3CtSduxfVkYpMwsObDfAvwOlH44qpEEcgnr
 491PBXCSypgfNydkEJwi+wdPoK56MhCKuUqidiwoKwyxFphGyGe9pMaUbkQIKOYhVt
 FGUZqrzKZBzZbZEjvGHJvR0PlnxA4+uQAuZRlm8F31hfwRW0hmLaXo6vHvfMWTZJSS
 J40CeLORGw6psx0e4Aer8t1YsjMnBeLb7lk6DGISFKQXu7xfTZ3vkpmhKpxJURM+nR
 UE9tEs8sObQZA==
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6ce6d926f76so1363799b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:51:55 -0800 (PST)
X-Gm-Message-State: AOJu0YycBoJROQSfxtyI89Gsg6R48wcvIKDQMkorV4xKdSAZgmT7aVCg
 xUjfI1N9L4G8XcHCcvpaeWDn6/STBMWsbYI8ztsPPw==
X-Google-Smtp-Source: AGHT+IHgl+e58xs+t8lpzf5mxr7aBE2s5LCf385GMB9GBP/beSKytT0TF7lOMMng7ZeVcG783pqiJJd3b2ds+44qpkM=
X-Received: by 2002:a05:6a20:3d0d:b0:18c:26cc:c054 with SMTP id
 y13-20020a056a203d0d00b0018c26ccc054mr14910421pzi.7.1702648314597; Fri, 15
 Dec 2023 05:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
 <20231212075257.75084-6-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231212075257.75084-6-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 15 Dec 2023 14:51:40 +0100
X-Gmail-Original-Message-ID: <CAN6tsi7dKL7hfByBmxKC5xsUOpUAAQx-HQVGErFS6Lut=20pyg@mail.gmail.com>
Message-ID: <CAN6tsi7dKL7hfByBmxKC5xsUOpUAAQx-HQVGErFS6Lut=20pyg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/bridge: tc358767: Add more volatile registers
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
> These registers might change their value without any host write operation=
.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 61d8710f46293..152a6dc916079 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2049,9 +2049,16 @@ static bool tc_readable_reg(struct device *dev, un=
signed int reg)
>  }
>
>  static const struct regmap_range tc_volatile_ranges[] =3D {
> +       regmap_reg_range(PPI_BUSYPPI, PPI_BUSYPPI),
> +       regmap_reg_range(DSI_BUSYDSI, DSI_BUSYDSI),
> +       regmap_reg_range(DSI_LANESTATUS0, DSI_INTSTATUS),
> +       regmap_reg_range(DSIERRCNT, DSIERRCNT),
>         regmap_reg_range(VFUEN0, VFUEN0),
> +       regmap_reg_range(SYSSTAT, SYSSTAT),
>         regmap_reg_range(GPIOI, GPIOI),
>         regmap_reg_range(INTSTS_G, INTSTS_G),
> +       regmap_reg_range(DP0_VMNGENSTATUS, DP0_VMNGENSTATUS),
> +       regmap_reg_range(DP0_AMNGENSTATUS, DP0_AMNGENSTATUS),
>         regmap_reg_range(DP0_AUXWDATA(0), DP0_AUXSTATUS),
>         regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
>         regmap_reg_range(DP_PHY_CTRL, DP_PHY_CTRL),
> --
> 2.34.1
>


Reviewed-by: Robert Foss <rfoss@kernel.org>

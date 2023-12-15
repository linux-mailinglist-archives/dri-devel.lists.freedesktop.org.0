Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97B8149AA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836BE10EA1F;
	Fri, 15 Dec 2023 13:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7A10EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:52:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F05D2B82916
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3F3C43395
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702648348;
 bh=xhW+gQDydfgtnk1x2kzo1KDSgmPEztAN1KVLoTOnDWE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vHQN/BO+33hNp/7wE6OOeGnUJfa/HbrUvcEqfV4XG+K6uHNkLncvA9/MbTyYpnfK5
 Ib+7NSXPoAEmQuPZn6I8SSvaXl8t+/2K1FUhjGvOcwtd4FLisYbVOAQbcoWTjbT7s4
 AvhEwNea7+8dRNglPFEcw1+K7mrL+PBsj6NUlUQenb+9M54y821gqt35z2uxLSwccm
 cdJf696doHzkUlCy7W0onRENdchnGquS6eX21iKvx2FBsNqOjKks/0xNJ4CcFJ1pyW
 MEIf052z/wrfzMGSeXVApuaOo1D2bhrAhj6nN6BRr9OUWIMBwRnkzhepSfqL56daI/
 WCMPkFdL3wp+A==
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6ceb27ec331so401619b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:52:28 -0800 (PST)
X-Gm-Message-State: AOJu0YzfcRf/ohCKsin4K/vBke85c6adKiTGpl36NrXlrRXVQ4lx0eyO
 vtCpXGbgQfSoh3EBqEJtxQEjdGBAk5V9tXHcHCaLFg==
X-Google-Smtp-Source: AGHT+IEE3m2y9YErKcKyovhZLrvHNx3eYoCNBbS65TlFzbRxgFIX02yExfvzWvnIcffStOPfA5ZwbsyYmbsEZjymPEM=
X-Received: by 2002:a62:e819:0:b0:6d2:6eee:f0 with SMTP id
 c25-20020a62e819000000b006d26eee00f0mr1242078pfi.69.1702648347622; 
 Fri, 15 Dec 2023 05:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
 <20231212075257.75084-7-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231212075257.75084-7-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 15 Dec 2023 14:52:15 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4X7pFHjNhfh2Q5AJB4uSc6isYuvaW2e8wiMtqZ67LfVA@mail.gmail.com>
Message-ID: <CAN6tsi4X7pFHjNhfh2Q5AJB4uSc6isYuvaW2e8wiMtqZ67LfVA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/bridge: tc358767: Add precious register SYSSTAT
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
> This is the single register which clears its value upon read operation.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 152a6dc916079..93fa057eca8dc 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2070,6 +2070,15 @@ static const struct regmap_access_table tc_volatil=
e_table =3D {
>         .n_yes_ranges =3D ARRAY_SIZE(tc_volatile_ranges),
>  };
>
> +static const struct regmap_range tc_precious_ranges[] =3D {
> +       regmap_reg_range(SYSSTAT, SYSSTAT),
> +};
> +
> +static const struct regmap_access_table tc_precious_table =3D {
> +       .yes_ranges =3D tc_precious_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(tc_precious_ranges),
> +};
> +
>  static const struct regmap_range tc_non_writeable_ranges[] =3D {
>         regmap_reg_range(PPI_BUSYPPI, PPI_BUSYPPI),
>         regmap_reg_range(DSI_BUSYDSI, DSI_BUSYDSI),
> @@ -2093,6 +2102,7 @@ static const struct regmap_config tc_regmap_config =
=3D {
>         .cache_type =3D REGCACHE_MAPLE,
>         .readable_reg =3D tc_readable_reg,
>         .volatile_table =3D &tc_volatile_table,
> +       .precious_table =3D &tc_precious_table,
>         .wr_table =3D &tc_writeable_table,
>         .reg_format_endian =3D REGMAP_ENDIAN_BIG,
>         .val_format_endian =3D REGMAP_ENDIAN_LITTLE,
> --
> 2.34.1
>


Reviewed-by: Robert Foss <rfoss@kernel.org>

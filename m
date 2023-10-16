Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B541A7CA433
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4C890B2;
	Mon, 16 Oct 2023 09:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F60890B2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:33:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EF300B811D7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563ADC433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697448792;
 bh=DBt7lyUHYvCXUBZt2LPp0v0GAfbjDSBNVaR8OunA9u4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c3lOy9a5RzKGRI3GfbIwr08KNxULZgsy2PR7jpXI/v0e68ixDu7CidLzypTTmn3m6
 WKgoWpiiUTvG8CvOnt6lgXwHOXV3ymxLiSxYb81rgOcwFKKBDVa7SSsrnGOurmx+d5
 I7jxEvHIi+Z5vxYxU4o2VjPx52DVlE8llNBsqx3d6G0kOlbXgGfT5lu9SLZjT+12Ts
 VX2xiZ9QsHbjfJ0Spter1z6hhblto4eYF861Dtc1h25q94t8DQkJ+paNZFdvzv7hg8
 a2LY15OhJmTix1l4hGFJUzfiUZE2qIOnP7ZzZT2sQ+PLzjEvjzVA6gv9PUmZo/ntGe
 MWWSCs6Mvcvyw==
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5859a7d6556so3178533a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 02:33:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YysA45DKLHWwbavNlri+PbekDxW/jkiAv5ZS7zE+YsVZYTBb7+1
 z0Mqv0O2QfZQ3rKYwRKiDH+4RQedRzqjZaELxM83YA==
X-Google-Smtp-Source: AGHT+IH6bsBjg9dmPxALknay8+6CXpFs3GzPg+s6/BIuFJVsOhNDLzp58nBxP57YuNnjGBgTvodNycBsBNWhnkLeTC8=
X-Received: by 2002:a05:6a20:1586:b0:173:e36c:6d03 with SMTP id
 h6-20020a056a20158600b00173e36c6d03mr16851842pzj.22.1697448791926; Mon, 16
 Oct 2023 02:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230821034008.3876938-1-victor.liu@nxp.com>
 <20230821034008.3876938-4-victor.liu@nxp.com>
In-Reply-To: <20230821034008.3876938-4-victor.liu@nxp.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 16 Oct 2023 11:33:01 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7hafwVmJDpDXTw14Qq28ZyjZYq9LeM6tq-REhrpD7pZQ@mail.gmail.com>
Message-ID: <CAN6tsi7hafwVmJDpDXTw14Qq28ZyjZYq9LeM6tq-REhrpD7pZQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 3/9] drm/bridge: synopsys: dw-mipi-dsi: Force
 input bus flags
To: Liu Ying <victor.liu@nxp.com>
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, zyw@rock-chips.com, sam@ravnborg.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 jagan@amarulasolutions.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 raphael.gallais-pou@foss.st.com, s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 yannick.fertre@foss.st.com, hjc@rock-chips.com, philippe.cornu@foss.st.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 5:37=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> The DATAEN_ACTIVE_LOW bit in DSI_DPI_CFG_POL register is set to zero,
> so set the DRM_BUS_FLAG_DE_HIGH flag in input_bus_cfg.flags.  It appears
> that the DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE flag also makes sense, so
> set it in input_bus_cfg.flags too.  With this patch, the flags set by
> drm_atomic_bridge_propagate_bus_flags() are overridden (see comment in
> that function) in case any downstream bridges propagates invalid flags
> to this bridge.  A real problematic case is to connect a RM67191 MIPI
> DSI panel whose driver sets DRM_BUS_FLAG_DE_LOW and
> DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE bus flags.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v3:
> * No change.
>
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index 945d46a76995..ed9288a9c444 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -23,6 +23,7 @@
>  #include <drm/bridge/dw_mipi_dsi.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modes.h>
> @@ -567,6 +568,17 @@ dw_mipi_dsi_bridge_atomic_get_input_bus_fmts(struct =
drm_bridge *bridge,
>         return input_fmts;
>  }
>
> +static int dw_mipi_dsi_bridge_atomic_check(struct drm_bridge *bridge,
> +                                          struct drm_bridge_state *bridg=
e_state,
> +                                          struct drm_crtc_state *crtc_st=
ate,
> +                                          struct drm_connector_state *co=
nn_state)
> +{
> +       bridge_state->input_bus_cfg.flags =3D
> +               DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDG=
E;
> +
> +       return 0;
> +}
> +
>  static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>  {
>         u32 val;
> @@ -1036,6 +1048,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_br=
idge_funcs =3D {
>         .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
>         .atomic_destroy_state   =3D drm_atomic_helper_bridge_destroy_stat=
e,
>         .atomic_get_input_bus_fmts =3D dw_mipi_dsi_bridge_atomic_get_inpu=
t_bus_fmts,
> +       .atomic_check           =3D dw_mipi_dsi_bridge_atomic_check,
>         .atomic_reset           =3D drm_atomic_helper_bridge_reset,
>         .atomic_pre_enable      =3D dw_mipi_dsi_bridge_atomic_pre_enable,
>         .atomic_enable          =3D dw_mipi_dsi_bridge_atomic_enable,
> --
> 2.37.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>

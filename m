Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C22E768728
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 20:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC9E10E101;
	Sun, 30 Jul 2023 18:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA610E101
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 18:44:02 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-583b019f1cbso40380667b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1690742641; x=1691347441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mV4wFSEyjoEY9pYdwsrYWeY+hPWaapNTWL+un8R4OrA=;
 b=jG4aTcAoSTtL0EJHFxlyogO9Q4sljHMv1PMWAp/NnG7+dBnvUNI/rRJi1bL56pkLbe
 VD0wqhGdjcK84qcFFLfzpF+ZhyBVM+FjirfISTqJboWspkM/naqp+3UO1Kock92Epjbm
 S0W1aGipCh44lhM6wDSRvJLnQjTtZRnHoY4TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690742641; x=1691347441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mV4wFSEyjoEY9pYdwsrYWeY+hPWaapNTWL+un8R4OrA=;
 b=IaGeugicifnhVm/UXDP8KiHYEthlA3mZJLc89eJ3gAwkGBLCx8Rh0iMkwVPCxct/0p
 tvatvNR4kUZDZL6lnSJYn9DfEoBB8soCv/sn/GkPVcFkRFTY+pJtMfvVvr00x+SQNX80
 YCPhsgrL/4C0NhZ5alIlLiQQjXSdgJNBXIy1JjCCYNUuHnMweWtkMSOvyFR5mRwETaad
 PzCxxYTfvPZWc1JXiscBLnDNtHnNfX85ZnmEBx1nMu+ZDhRh1dNBUCDCOy9hbWeKaUgV
 Kte3TDqfVdpLlAQJFWBpXpfIcdJkAMEqWwmOUT9vql0VDfPqmovd04kE09jDjM1uA5Cq
 SSXA==
X-Gm-Message-State: ABy/qLYte6NHwflmMo6k3gAHPhClb89FEsK22cFLRETozX/nMjlU1Jdu
 GAy7lHbZ6ZqVILEbA59s045LRafB6xXHoyYWQL5UCA==
X-Google-Smtp-Source: APBJJlGuUwZcoYHVfSP7Pg9L7UJYwZqgSYNijNwHqZ3gvdLFBu+pcGziBVKxeLz2wlFEX1rjZg3cbxGNRI+AzUjmWyU=
X-Received: by 2002:a0d:d9c9:0:b0:586:9ab:5cc with SMTP id
 b192-20020a0dd9c9000000b0058609ab05ccmr4114704ywe.42.1690742641568; 
 Sun, 30 Jul 2023 11:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230720071430.259892-1-victor.liu@nxp.com>
 <20230720071430.259892-3-victor.liu@nxp.com>
In-Reply-To: <20230720071430.259892-3-victor.liu@nxp.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 31 Jul 2023 00:13:49 +0530
Message-ID: <CAMty3ZABMfRPiXM-N0d=AK8+CJZgBqd4zUeFz5-R8GY3fQQRrA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus
 format negotiation support
To: Ying Liu <victor.liu@nxp.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 12:40=E2=80=AFPM Ying Liu <victor.liu@nxp.com> wrot=
e:
>
> Introduce ->get_input_bus_fmts() callback to struct dw_mipi_dsi_plat_data
> so that vendor drivers can implement specific methods to get input bus
> formats for Synopsys DW MIPI DSI.
>
> While at it, implement a generic callback for ->atomic_get_input_bus_fmts=
(),
> where we try to get the input bus formats through pdata->get_input_bus_fm=
ts()
> first.  If it's unavailable, fall back to the only format - MEDIA_BUS_FMT=
_FIXED,
> which matches the default behavior if ->atomic_get_input_bus_fmts() is no=
t
> implemented as ->atomic_get_input_bus_fmts()'s kerneldoc indicates.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * No change.
>
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 30 +++++++++++++++++++
>  include/drm/bridge/dw_mipi_dsi.h              | 11 +++++++
>  2 files changed, 41 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index 57eae0fdd970..8580b8a97fb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -12,6 +12,7 @@
>  #include <linux/component.h>
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
> @@ -536,6 +537,34 @@ static const struct mipi_dsi_host_ops dw_mipi_dsi_ho=
st_ops =3D {
>         .transfer =3D dw_mipi_dsi_host_transfer,
>  };
>
> +static u32 *
> +dw_mipi_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +                                            struct drm_bridge_state *bri=
dge_state,
> +                                            struct drm_crtc_state *crtc_=
state,
> +                                            struct drm_connector_state *=
conn_state,
> +                                            u32 output_fmt,
> +                                            unsigned int *num_input_fmts=
)
> +{
> +       struct dw_mipi_dsi *dsi =3D bridge_to_dsi(bridge);
> +       const struct dw_mipi_dsi_plat_data *pdata =3D dsi->plat_data;
> +       u32 *input_fmts;
> +
> +       if (pdata->get_input_bus_fmts)
> +               return pdata->get_input_bus_fmts(pdata->priv_data,
> +                                                bridge, bridge_state,
> +                                                crtc_state, conn_state,
> +                                                output_fmt, num_input_fm=
ts);

Why do we need platform-controlled bus formats? The supported bridge
formats are common across all platforms and it is specific to the list
of formats supported by DW-MIPI DSI. isn't it?

Thanks,
Jagan.

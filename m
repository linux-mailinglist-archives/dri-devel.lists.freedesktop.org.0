Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603BA6AB1B8
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 19:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4640B10E068;
	Sun,  5 Mar 2023 18:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB2D10E068
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 18:35:15 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id y144so6088458yby.12
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Mar 2023 10:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yD1PEpFzqMRiKAoWE7vg7NQud9990LavHiXEJjISFdk=;
 b=YLK9r2gts4WNQOU/nw31rLIJ11cuw+9erDRKmQu1Y0ykxkPo+byIC7keb6cltqBm74
 mpyXLb8pYksqdkkW5UEgliigwzkS/fhX3U44HJ1rDAg0wi/oPYxrhpiROHAdPjqFIzFI
 u29WDjarT1JOIh+08BAC8RVtpvkGPw3gSnzUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yD1PEpFzqMRiKAoWE7vg7NQud9990LavHiXEJjISFdk=;
 b=TFtyB9Yf9mZX9+4zjQkAcjAvbwkihvxDg4M9a2yVPLAFOP91aBEJL+7NIncj3B7mpk
 7pdPR+v+hxekAei4vHlsLaE2MVzcG9BcYdoyMqCt0lKWZvqMQmKHUTshi5UV1CCy40bD
 GDCIIqMVaRF/pWo2dSrr9Vy/EF6qsESKdrcG7+543thF7PcLhkZhFw1lQWtRIESrljeN
 LvCk5qFUaoiP7oWG0PHp3c7DSQsMea/qXaATSQ+I1dHJgd2m7q04xx7PDaDB5hrPs3Tl
 AAOniySO9e3nG6/iUQ+/BiCqeY/3d+2kRIF5Vlt00k6KaIOqWErLVuj8yIKsL+7xfw/z
 zyjw==
X-Gm-Message-State: AO0yUKVuVSEiZ5q2lOxeY8e9Pgb7tMv4HskeUBMTHWPI+HDj+qPTadAn
 XurOoKrJNgAVfqxlg7F7TL3HU8uYIny066Re8SFgtVSmWsRH11MAoA087w==
X-Google-Smtp-Source: AK7set+LNQm8h0iOszm1eZLNgka3HFVIDfWgD64yDdP0sv5L+6COVRyxGuoeI4VUzL64fupNuCX94na1cmXYz0jKkfY=
X-Received: by 2002:a05:6902:10e:b0:98e:6280:74ca with SMTP id
 o14-20020a056902010e00b0098e628074camr2879123ybh.1.1678041314395; Sun, 05 Mar
 2023 10:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20230305162248.06ba45ab@yaise-pc1>
In-Reply-To: <20230305162248.06ba45ab@yaise-pc1>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 6 Mar 2023 00:05:03 +0530
Message-ID: <CAMty3ZA0m-CVdFsk5D55jEAkTCRPMbKo4YwzfKyrymM-98PO5A@mail.gmail.com>
Subject: Re: IMX8MM: assign panel to mipi_dsi in a device tree
To: Patrick Boettcher <patrick.boettcher@posteo.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 5, 2023 at 11:39=E2=80=AFPM Patrick Boettcher
<patrick.boettcher@posteo.de> wrote:
>
> Hi list,
>
> After several days of trying I realize my too small/old brain is unable
> to map around how to assign/connect a panel to the mipi_dsi-node in a
> device.
>
> We are using a 'tdo,tl070wsh30' panel connected to the
> mipi-dsi-interface of a imx8mm.
>
> Of all the references I found on the in public repositories none of
> them is using this exact panel. Well.
>
> Looking at other device trees I came up with the following dts-node add
> to the mipi_dsi-node:
>
> &mipi_dsi {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>         status =3D "okay";
>
>         port@0 {
>                 reg =3D <0>;
>                 mipi_dsi_panel0_out: endpoint {
>                         remote-endpoint =3D <&panel0_in>;
>                         attach-bridge;
>                 };
>         };
>
>         panel@0 {
>                 compatible =3D "tdo,tl070wsh30";
>                 reg =3D <0>;
>
>                 pinctrl-0 =3D <&pinctrl_mipi_dsi>;
>                 pinctrl-names =3D "default";
>                 reset-gpios =3D <&gpio4 4 GPIO_ACTIVE_LOW>;
>                 enable-gpios =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
>
>                 backlight =3D <&panel_gpio_backlight>;
>                 power-supply =3D <&panel_gpio_regulator>;
>
>                 dsi-lanes =3D <4>;
>
>                 video-mode =3D <0>;
>
>                 panel-width-mm =3D <157>;
>                 panel-height-mm =3D <86>;
>
>                 status =3D "okay";
>
>                 port {
>                         panel0_in: endpoint {
>                                 remote-endpoint =3D<&mipi_dsi_panel0_out>=
;
>                         };
>                 };
>         };
> };
>
>
> You'll see that I used the attach-bridge-option, which is maybe not
> necessary. I found this during a debug-print-session in the
> drm-bridge-driver, it wasn't attaching a bridge. But maybe I don't need
> a bridge as the panel-driver contains everything to control the
> controllers of the panel. I don't really know.
>
> However, with this I have the following messages:
>
> [    0.393985] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /s=
oc@0/bus@32c00000/mipi_dsi@32e10000 to encoder DSI-34: -19
> [    0.405626] imx_sec_dsim_drv 32e10000.mipi_dsi: Failed to attach bridg=
e: 32e10000.mipi_dsi
> [    0.413974] imx_sec_dsim_drv 32e10000.mipi_dsi: failed to bind sec dsi=
m bridge: -517
>
> The panel driver is never instantiated.
>
> I'm using 5.15.51 (-imx). mipi_dsi and the panel-driver are built into
> the kernel.

Please share the source repo link? B/W if you may try the mainline
code base of imx8mm dsi please check here.
https://github.com/openedev/kernel/commits/imx8mm-dsi-v16

Jagan.

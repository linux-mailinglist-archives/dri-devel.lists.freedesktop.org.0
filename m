Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3C4758C46
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 06:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B710E0E9;
	Wed, 19 Jul 2023 04:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78FA10E013
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 04:00:38 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-460eb67244eso2254134e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 21:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689739237; x=1690344037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7EJ5zB5DOPvJ7pK4sEWpXxfhIszgBiKWP88tK+1U1M=;
 b=H9cVKb4xASnM0ZBO8Q2P2hPb6slM+GucaAOC9zWZVjD1XCoEoicK+BN2Fn5hrejFvj
 JPPjsduw+5sAYOg14bbZTzdjxaTa9hgTFzCP8g+gDt6DGG+9jqZYiNXwOzt8YltQ4QOP
 ikZP47dJLFdjANN4H84g27D2K/iIJEqK1+X1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689739237; x=1690344037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7EJ5zB5DOPvJ7pK4sEWpXxfhIszgBiKWP88tK+1U1M=;
 b=dmOWgxI25d3uYNEtZV/DGl7iORXWsNSnlaWyKrhdd+OTWE/dawM/gRHlkv6AF9cUER
 Ys7TFmbWAHpsD5PaHN/2I3vos4F/067eoHQfJQck5ayQGu/wU8Io4vHbTVipdnIRMiLc
 7Ug97gKS1839CTJ9g7RPHuuVH2k0de22mSnmUvAoCMzHzyEikBNdIJWxNDiLBUud3GMD
 lLfojRvl4cxVf3Qgg5f1bqHgsJ3q1yZMjCsxG7PXBe0m5EPhygqhJ2zVIhwaihXdJAMX
 DXmW2XINwiisB3jEKdaEOe31B57cya0YJaXOKYQk+uJN2nbKU2L5kOph5Pr+xwLKGNQX
 QnCA==
X-Gm-Message-State: ABy/qLasuIHRyu9Puetva2zRlgp9kTd1NYaRbT9JYgxtvrdc5OO3Teel
 Htz1tfh1mWqXbd4UJ034PcZTBgaQiSYllTJfdLGQcA==
X-Google-Smtp-Source: APBJJlGmgLbuE5tXVlJwO1VEp9w9K8+5jjuSCaRiBo1+1Bjo4mDvAyE8GnkC+Q0tNXncMQoiIW9BBSCNnkUSAyxqC5w=
X-Received: by 2002:a1f:3d44:0:b0:465:fa30:d633 with SMTP id
 k65-20020a1f3d44000000b00465fa30d633mr1058808vka.0.1689739237275; Tue, 18 Jul
 2023 21:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Jul 2023 12:00:25 +0800
Message-ID: <CAGXv+5E89K9UcSsF1p5Ni=J4CBsqF-p+dXJJ6xjgFCWWAm2OVg@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] MediaTek DisplayPort: support eDP and aux-bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, nfraprado@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 10:14=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v6:
>  - Added some previously missing error checking (patch [01/11])
>  - Added error checks for devm_drm_bridge_add()
>  - Made sure that cable_plugged_in is set to false if HPD assertion
>    polling fails (timeout)
>  - Support panel as module (tested with panel-edp on MT8195 Tomato)
>  - Rebased over next-20230717

Whole series is

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

With panel-edp builtin & as a module, and tested external display,
all on MT8195 Tomato.

Thanks!

> Changes in v5:
>  - Added .wait_hpd_asserted() callback for aux-bus
>  - Avoid enabling and registering HPD interrupt + handlers for
>    eDP case only (keeps HPD interrupts enabled for full DP case)
>  - Support not always-on eDP panels (boot with regulator off,
>    suspend with regulator off) for power saving in PM suspend.
>
> Changes in v4:
>  - Set data lanes to idle to prevent stalls if bootloader didn't
>    properly close the eDP port
>  - Now using the .done_probing() callback for AUX bus to prevent
>    probe deferral loops in case the panel-edp driver is a module
>    as previously seen with another bridge driver (ANX7625) on
>    some other SoCs (MT8192 and others)
>  - Rebased over next-20230706
>  - Dropped Chen-Yu's T-b tag on last patch as some logic changed
>    (before, I wasn't using the .done_probing() callback).
>
> Changes in v3:
>  - Added DPTX AUX block initialization before trying to communicate
>    to stop relying on the bootloader keeping it initialized before
>    booting Linux.
>  - Fixed commit description for patch [09/09] and removed commented
>    out code (that slipped from dev phase.. sorry!).
>
> This series adds "real" support for eDP in the mtk-dp DisplayPort driver.
>
> Explaining the "real":
> Before this change, the DisplayPort driver did support eDP to some
> extent, but it was treating it entirely like a regular DP interface
> which is partially fine, after all, embedded DisplayPort *is* actually
> DisplayPort, but there might be some differences to account for... and
> this is for both small performance improvements and, more importantly,
> for correct functionality in some systems.
>
> Functionality first:
>
> One of the common differences found in various boards implementing eDP
> and machines using an eDP panel is that many times the HPD line is not
> connected. This *must* be accounted for: at startup, this specific IP
> will raise a HPD interrupt (which should maybe be ignored... as it does
> not appear to be a "real" event...) that will make the eDP panel to be
> detected and to actually work but, after a suspend-resume cycle, there
> will be no HPD interrupt (as there's no HPD line in my case!) producing
> a functionality issue - specifically, the DP Link Training fails because
> the panel doesn't get powered up, then it stays black and won't work
> until rebooting the machine (or removing and reinserting the module I
> think, but I haven't tried that).
>
> Now for.. both:
> eDP panels are *e*DP because they are *not* removable (in the sense that
> you can't unplug the cable without disassembling the machine, in which
> case, the machine shall be powered down..!): this (correct) assumption
> makes us able to solve some issues and to also gain a little performance
> during PM operations.
>
> What was done here is:
>  - Caching the EDID if the panel is eDP: we're always going to read the
>    same data everytime, so we can just cache that (as it's small enough)
>    shortening PM resume times for the eDP driver instance;
>  - Always return connector_status_connected if it's eDP: non-removable
>    means connector_status_disconnected can't happen during runtime...
>    this also saves us some time and even power, as we won't have to
>    perform yet another power cycle of the HW;
>  - Added aux-bus support!
>    This makes us able to rely on panel autodetection from the EDID,
>    avoiding to add more and more panel timings to panel-edp and, even
>    better, allowing to use one panel node in devicetrees for multiple
>    variants of the same machine since, at that point, it's not important
>    to "preventively know" what panel we have (eh, it's autodetected...!).
>
> This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux-bu=
s)
>
>
> P.S.: For your own testing commodity, here's a reference devicetree:
>
> pp3300_disp_x: regulator-pp3300-disp-x {
>         compatible =3D "regulator-fixed";
>         regulator-name =3D "pp3300_disp_x";
>         regulator-min-microvolt =3D <3300000>;
>         regulator-max-microvolt =3D <3300000>;
>         enable-active-high;
>         gpio =3D <&pio 55 GPIO_ACTIVE_HIGH>;
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&panel_fixed_pins>;
> };
>
> &edp_tx {
>         status =3D "okay";
>
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&edptx_pins_default>;
>
>         ports {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>
>                 port@0 {
>                         reg =3D <0>;
>                         edp_in: endpoint {
>                                 remote-endpoint =3D <&dp_intf0_out>;
>                         };
>                 };
>
>                 port@1 {
>                         reg =3D <1>;
>                         edp_out: endpoint {
>                                 data-lanes =3D <0 1 2 3>;
>                                 remote-endpoint =3D <&panel_in>;
>                         };
>                 };
>         };
>
>         aux-bus {
>                 panel: panel {
>                         compatible =3D "edp-panel";
>                         power-supply =3D <&pp3300_disp_x>;
>                         backlight =3D <&backlight_lcd0>;
>                         port {
>                                 panel_in: endpoint {
>                                         remote-endpoint =3D <&edp_out>;
>                                 };
>                         };
>                 };
>         };
> };
>
> AngeloGioacchino Del Regno (11):
>   drm/mediatek: dp: Add missing error checks in
>     mtk_dp_parse_capabilities
>   drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
>   drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
>   drm/mediatek: dp: Use devm variant of drm_bridge_add()
>   drm/mediatek: dp: Move AUX_P0 setting to
>     mtk_dp_initialize_aux_settings()
>   drm/mediatek: dp: Enable event interrupt only when bridge attached
>   drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
>   drm/mediatek: dp: Move PHY registration to new function
>   drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
>   drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
>   drm/mediatek: dp: Don't register HPD interrupt handler for eDP case
>
>  drivers/gpu/drm/mediatek/Kconfig  |   1 +
>  drivers/gpu/drm/mediatek/mtk_dp.c | 360 ++++++++++++++++++++----------
>  2 files changed, 242 insertions(+), 119 deletions(-)
>
> --
> 2.40.1
>

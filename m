Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2510874ACD0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2961F10E1A1;
	Fri,  7 Jul 2023 08:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7568610E1A1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:23:28 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-47e36c35285so573764e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688718207; x=1691310207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UICQMdLCdvd6RrW7LjkYioIbHWT7wIioRRBI6u6YoTQ=;
 b=hz3k4VuEy6wOXt0lpPW/xMVBDzyZvDuKbgWkY4EGFNjYwXz8DCR8+LcYru9Byh2iMT
 SDaNg56+FHWdEK4jTB1lH6ryhTs8aNRFH17wBz/E2P+TyLbJm3RmEpaf++GYdKuilvo/
 xQUM55FuqVn8TNmVKwPczVS0HW9/lr3B0W1Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688718207; x=1691310207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UICQMdLCdvd6RrW7LjkYioIbHWT7wIioRRBI6u6YoTQ=;
 b=A/dirbxoYqD1wB1mNFZHBa1hkgetSRjnDo7pIar6oBFvLTuS5F98PYQNoGVaKahQhz
 xs+Cnlg1RDP/7j/EpAx6241/uEFE4vI5c8X+RX86xaPz4kY85K35AlNHEjW0xMYRWjCM
 kbM/1tirap6hJ3XWNy5Sn0ghYx7F38otghbiUIhxKkcd1L202tkEWaP+h7p97bqN/VoK
 9Ts1xPM9U37Xtgjp6mF8skjvYLvKviSxGFYCcqLLh0r6Z5S/GdY0AMx23PZ2J56G5o7w
 r+URYm5AB4zG07aH0WR5opMtRXVz4ERAOyyD1NVvFB0wn7h6vKCq/U7CjHbcN8OyIvf7
 QCIQ==
X-Gm-Message-State: ABy/qLbGzaFkfTCtTXtsHVZYV9V31B9phIuhKBzl5isN9jTNzlUfqJ6N
 Ey91TRBF+bywmp+TFfQuTsJiPi7s+0KlWPZd1jfDFQ==
X-Google-Smtp-Source: APBJJlGvUYzs6kqfoBR7guDmWvUdTBV4+dxg/LGaHxj/ZWQDKLYy/+hENdwRNzqMUFiPa0wdy0CneTJF76dXm8qQU2U=
X-Received: by 2002:a1f:4144:0:b0:47e:9bbb:103b with SMTP id
 o65-20020a1f4144000000b0047e9bbb103bmr1455691vka.6.1688718206907; Fri, 07 Jul
 2023 01:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Jul 2023 16:23:15 +0800
Message-ID: <CAGXv+5HzQhoz0OUhifQC0vr44O5VwvuYnsHSA2jK0FjwJT3OBA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] MediaTek DisplayPort: support eDP and aux-bus
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

On Thu, Jul 6, 2023 at 8:30=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
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

Do you have panel-edp built as a module? If I have it built in, the panel
can correctly display stuff. If I have it built as a module, the panel is
correctly detected, but the panel stays black even if DRM thinks it is
displaying stuff.

And it looks like EDID reading and panel power sequencing is still not
working correctly, i.e. needs regulator-always-on?

ChenYu

> P.S.: For your own testing commodity, here's a reference devicetree:
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
>
> AngeloGioacchino Del Regno (9):
>   drm/mediatek: dp: Cache EDID for eDP panel
>   drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
>   drm/mediatek: dp: Always return connected status for eDP in .detect()
>   drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
>   drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
>   drm/mediatek: dp: Enable event interrupt only when bridge attached
>   drm/mediatek: dp: Use devm variant of drm_bridge_add()
>   drm/mediatek: dp: Move AUX_P0 setting to
>     mtk_dp_initialize_aux_settings()
>   drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 197 +++++++++++++++++++-----------
>  1 file changed, 127 insertions(+), 70 deletions(-)
>
> --
> 2.40.1
>

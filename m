Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150E6D91E3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250BD10EB35;
	Thu,  6 Apr 2023 08:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914F410EB35
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:44:09 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id cz11so33780864vsb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680770648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9qHCmLykS8ziwfzdBHiOw5DQ1ViD+uRbDJHxmIchmw=;
 b=iNg2KuR9jalZ+h4/VyzMgwrkhyxO32DPxG8d84t4LIfQAyff7IOxa6TnbegwlJqXOz
 6jkF2CsM+uUEzhln9YCIFXgmu2XE//qG5SnsKQRKB8o1F7Gp1lhFz9GAMJcg099XbrYD
 Rc+g8NsHZG6GITq3N8XQOu1OQGDUQmtQMrH5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680770648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9qHCmLykS8ziwfzdBHiOw5DQ1ViD+uRbDJHxmIchmw=;
 b=0gZMxszFfigHiTY0IhjujtSN8QarH4BYRY0Aj34fZDxwIHS4MaqX+YqmRU8gRbi7pf
 SVihzSQF4gcS/Ch0BX9bpiG5Pk4fz4HI/RU8zQH57RaEjaPlR45GBPSqo5rw0KBGVGX5
 5hWW8JUrHLtn+lPxakyBSXEgMa66VaXQmNgXggII91RiY+C7zJ8PgJukOc8MvD3hutrk
 x/6MELhYNstWVg92BDZb/59lq1by5ZSaYePNUNj1RKCed2mX15NSefukgS+xz2NyJpx7
 OJ5ADHSMATgbqLo6NaWE7VyGh7TYfzdmQMvKv46UTcG/G8U3BVfzIa/Mq8rtaAbYrXgp
 55BQ==
X-Gm-Message-State: AAQBX9c3O/2z4saSTj0IjA537yFYAKoRc8fewA42PP3LCFBOYSfsprQA
 Apm2X26Qjbyz/gvHGXRWc1i5WTbkypA6VenVCSYWNA==
X-Google-Smtp-Source: AKy350auiw3Jet0bNm+lP+O0VQZojvLuU9MVfhLLUcEo9lSIXD5q4R+Oxt5HdpQyv/g95Fjz7JjeNxiTLcPhwMDj5yY=
X-Received: by 2002:a67:d81d:0:b0:429:d443:96a with SMTP id
 e29-20020a67d81d000000b00429d443096amr6931579vsj.7.1680770648142; Thu, 06 Apr
 2023 01:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FEEkMg+SY7ZkSHN2G9jtT6TBiN9MadZmYGMX_uVi5=gQ@mail.gmail.com>
 <46a65c4b-4407-d19a-0e4b-6ceab97d8e64@collabora.com>
In-Reply-To: <46a65c4b-4407-d19a-0e4b-6ceab97d8e64@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Apr 2023 16:43:56 +0800
Message-ID: <CAGXv+5E1aSw_ut-kSCPK4=+dabRkmBS7EG4yHX9Zr+YVj5u9ww@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] MediaTek DisplayPort: support eDP and aux-bus
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 6, 2023 at 4:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/04/23 09:20, Chen-Yu Tsai ha scritto:
> > On Tue, Apr 4, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Changes in v3:
> >>   - Added DPTX AUX block initialization before trying to communicate
> >>     to stop relying on the bootloader keeping it initialized before
> >>     booting Linux.
> >>   - Fixed commit description for patch [09/09] and removed commented
> >>     out code (that slipped from dev phase.. sorry!).
> >>
> >> This series adds "real" support for eDP in the mtk-dp DisplayPort driv=
er.
> >>
> >> Explaining the "real":
> >> Before this change, the DisplayPort driver did support eDP to some
> >> extent, but it was treating it entirely like a regular DP interface
> >> which is partially fine, after all, embedded DisplayPort *is* actually
> >> DisplayPort, but there might be some differences to account for... and
> >> this is for both small performance improvements and, more importantly,
> >> for correct functionality in some systems.
> >>
> >> Functionality first:
> >>
> >> One of the common differences found in various boards implementing eDP
> >> and machines using an eDP panel is that many times the HPD line is not
> >> connected. This *must* be accounted for: at startup, this specific IP
> >> will raise a HPD interrupt (which should maybe be ignored... as it doe=
s
> >> not appear to be a "real" event...) that will make the eDP panel to be
> >> detected and to actually work but, after a suspend-resume cycle, there
> >> will be no HPD interrupt (as there's no HPD line in my case!) producin=
g
> >> a functionality issue - specifically, the DP Link Training fails becau=
se
> >> the panel doesn't get powered up, then it stays black and won't work
> >> until rebooting the machine (or removing and reinserting the module I
> >> think, but I haven't tried that).
> >>
> >> Now for.. both:
> >> eDP panels are *e*DP because they are *not* removable (in the sense th=
at
> >> you can't unplug the cable without disassembling the machine, in which
> >> case, the machine shall be powered down..!): this (correct) assumption
> >> makes us able to solve some issues and to also gain a little performan=
ce
> >> during PM operations.
> >>
> >> What was done here is:
> >>   - Caching the EDID if the panel is eDP: we're always going to read t=
he
> >>     same data everytime, so we can just cache that (as it's small enou=
gh)
> >>     shortening PM resume times for the eDP driver instance;
> >>   - Always return connector_status_connected if it's eDP: non-removabl=
e
> >>     means connector_status_disconnected can't happen during runtime...
> >>     this also saves us some time and even power, as we won't have to
> >>     perform yet another power cycle of the HW;
> >>   - Added aux-bus support!
> >>     This makes us able to rely on panel autodetection from the EDID,
> >>     avoiding to add more and more panel timings to panel-edp and, even
> >>     better, allowing to use one panel node in devicetrees for multiple
> >>     variants of the same machine since, at that point, it's not import=
ant
> >>     to "preventively know" what panel we have (eh, it's autodetected..=
.!).
> >>
> >> This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux=
-bus)
> >>
> >>
> >> P.S.: For your own testing commodity, here's a reference devicetree:
> >> &edp_tx {
> >>          status =3D "okay";
> >>
> >>          pinctrl-names =3D "default";
> >>          pinctrl-0 =3D <&edptx_pins_default>;
> >>
> >>          ports {
> >>                  #address-cells =3D <1>;
> >>                  #size-cells =3D <0>;
> >>
> >>                  port@0 {
> >>                          reg =3D <0>;
> >>                          edp_in: endpoint {
> >>                                  remote-endpoint =3D <&dp_intf0_out>;
> >>                          };
> >>                  };
> >>
> >>                  port@1 {
> >>                          reg =3D <1>;
> >>                          edp_out: endpoint {
> >>                                  data-lanes =3D <0 1 2 3>;
> >>                                  remote-endpoint =3D <&panel_in>;
> >>                          };
> >>                  };
> >>          };
> >>
> >>          aux-bus {
> >>                  panel: panel {
> >>                          compatible =3D "edp-panel";
> >>                          power-supply =3D <&pp3300_disp_x>;
> >>                          backlight =3D <&backlight_lcd0>;
> >>                          port {
> >>                                  panel_in: endpoint {
> >>                                          remote-endpoint =3D <&edp_out=
>;
> >>                                  };
> >>                          };
> >>                  };
> >>          };
> >> };
> >>
> >> AngeloGioacchino Del Regno (9):
> >>    drm/mediatek: dp: Cache EDID for eDP panel
> >>    drm/mediatek: dp: Move AUX and panel poweron/off sequence to functi=
on
> >>    drm/mediatek: dp: Always return connected status for eDP in .detect=
()
> >>    drm/mediatek: dp: Always set cable_plugged_in at resume for eDP pan=
el
> >>    drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
> >>    drm/mediatek: dp: Enable event interrupt only when bridge attached
> >>    drm/mediatek: dp: Use devm variant of drm_bridge_add()
> >>    drm/mediatek: dp: Move AUX_P0 setting to
> >>      mtk_dp_initialize_aux_settings()
> >>    drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
> >
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > on MT8195 Tomato: eDP panel works if the display panel regulator is alw=
ays
> > on. External DP works.
> >
> > Maybe it has something to do with the driver not supporting .wait_hpd_a=
sserted
> > and not using a GPIO for HPD?
>
> Even before this change I couldn't get the panel to reliably work without=
 keeping
> the regulator always on (just to point out that I'm not introducing regre=
ssions).
>
> I am already trying to understand why this happens... and I'm still resea=
rching...
> but there's what I've seen for now:
>   * Set the panel regulator as regulator-boot-on;

This simply means when the regulator driver grabs the GPIO, it will grab it
with output high. It will make no attempt to keep it on.

>   * Boot: edp-panel will correctly read the EDID, then will run the PM su=
spend
>     handler
>   * mtk-dp's .get_edid() callback gets called but, at that time, edp-pane=
l will
>     still be suspended (PM resume handler didn't get called)
>     * Regulator is still down
>   * Failure.
> That's not right and probably the .get_edid() callback in mtk-dp has an a=
buse:
> there, mtk_dp_parse_capabilities() gets called, which performs initializa=
tion
> of some variables for DP link training (essential to get the DP going!).

I think that's wrong.

> The question that I am making to myself is whether I should move that els=
ewhere,
> if so, what's the right place (making me able to remove the DRM_BRIDGE_OP=
_EDID
> bridge flag when eDP + aux-bus), or if I should leave that and make sure =
that the
> panel-edp's resume callback is called before .get_edid() from mtk-dp gets=
 called.

I think that's a proper change. Some of the callbacks in the DP driver are
doing suspicious things, as if the driver came from an era without bridge
drivers, and was not properly split up to fit the new bridge semantics.

Same probably goes for the HPD detection.

> That can get done in a separated series (or single patch?)... so that if =
we get
> this one picked sooner than later, we can start upstreaming the panel nod=
es in
> the Cherry devicetrees and only remove the regulator-always-on later.

I guess that works? Except for battery life lol. It's really up to CK.
And it's probably too late to upstream the panel nodes for the upcoming
cycle.

ChenYu

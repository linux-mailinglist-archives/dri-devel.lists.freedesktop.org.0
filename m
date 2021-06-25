Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA93B4788
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C706EDF4;
	Fri, 25 Jun 2021 16:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3980B6EDF4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 16:42:17 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id f5so5485961qvu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fsozG1UsXB2tqec6xjxXbUbC1wkoz0cK0Wz9twWzXrE=;
 b=F1Px+J58uFH8y7P+rEv+X4VWjH7cFC1cbLejg11LMon62y5NIkwpKcPlpLqI8QX2+B
 UEyvysbgADqkiWRTwZq4c2vt0WL2SXKMRQW+qP6CgPXDpdJUjypEriQI8hGuolCnZTHX
 Br0mCzH4qazhAne4TFOTtmFpJERhGa5R8ydOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fsozG1UsXB2tqec6xjxXbUbC1wkoz0cK0Wz9twWzXrE=;
 b=W14/xeqPa1eWnyBJQ3K1pntqBrl5W6EyV2rPMZr/YG5yoE+qdaSYnfuxIA9GfxOxan
 2nH6mHC6+Kuy7M49jYRPwnihg5ba7pJcktFE0jRsSJOgW6+MQLtUUihBPeX1G4UFOcUP
 BUvswi6UFEVWcsUgjGklt8GifxZV9Euc89/uEnAS346u0uALC78w+zcz7glvxXWU1Uko
 OQCn3Lvmf3gDq0bY9G24YgonXdbVWHPwRKM5FM/0x/5kyosBYfuoq40c71gupFtgSqqU
 NfkjLaenrKGeJ2oBA4DEBNRBNj6SOoOzjBDNephZQ7uoXp4mhKLq4gadymN/6a2EXKtT
 gpsw==
X-Gm-Message-State: AOAM532sDbael7+S1dfJ5FoR5z72OvETdtdbezjW0oa/61yoraIqvJwi
 zBrl3f5vFpn2BacPbxqTTsY7dBEpNm940A==
X-Google-Smtp-Source: ABdhPJw75QAQfwjw91P4bWITLi96mIetKSfi4DFyRL4EqrXY42YuZELVeCcCXeLiz5Zm45+JwZu5pg==
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr12010630qvb.15.1624639336082; 
 Fri, 25 Jun 2021 09:42:16 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id g19sm4109970qtg.36.2021.06.25.09.42.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 09:42:15 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id t8so5530003ybt.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 09:42:15 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id
 u184mr13311344ybb.343.1624639334895; 
 Fri, 25 Jun 2021 09:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224458.2486701-1-linus.walleij@linaro.org>
In-Reply-To: <20210624224458.2486701-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jun 2021 09:42:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
Message-ID: <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 24, 2021 at 3:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> @@ -5946,6 +5946,13 @@ S:       Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/vboxvideo/
>
> +DRM DRIVER FOR WIDECHIPS WS2401 PANELS
> +M:     Linus Walleij <linus.walleij@linaro.org>
> +S:     Maintained
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> +F:     drivers/gpu/drm/panel/panel-widechips-ws2401.c
> +
>  DRM DRIVER FOR VMWARE VIRTUAL GPU

nit: I assume this is supposed to be alphabetized? If so, [W]IDECHIPS
comes after [V]MWARE


> @@ -0,0 +1,404 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panel driver for the WideChips WS2401 480x800 DPI RGB panel, used in
> + * the Samsung Mobile Display (SMD) LMS380KF01.
> + * Found in the Samsung Galaxy Ace 2 GT-I8160 mobile phone.
> + * Linus Walleij <linus.walleij@linaro.org>
> + * Inspired by code and know-how in the vendor driver by Gareth Phillips.
> + */
> +#include <drm/drm_modes.h>
> +#include <drm/drm_mipi_dbi.h>

nit: m[o]des sorts after m[i]pi


> +#define ws2401_command(ws, cmd, seq...) \
> +({ \
> +       struct mipi_dbi *dbi = &ws->dbi; \
> +       int ret; \
> +       ret = mipi_dbi_command(dbi, cmd, seq);  \
> +       if (ret) { \
> +               dev_err(ws->dev, "failure in writing command %02x\n", cmd); \
> +       } \

nit: don't need braces for the "if", right?

optional nit: use %#02x instead of %02x


> +})
> +
> +static void ws2401_read_mtp_id(struct ws2401 *ws)
> +{
> +       struct mipi_dbi *dbi = &ws->dbi;
> +       u8 id1, id2, id3;
> +       int ret;
> +
> +       ret = mipi_dbi_command_read(dbi, WS2401_READ_ID1, &id1);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 1\n");
> +               return;
> +       }
> +       ret = mipi_dbi_command_read(dbi, WS2401_READ_ID2, &id1);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 2\n");
> +               return;
> +       }
> +       ret = mipi_dbi_command_read(dbi, WS2401_READ_ID3, &id1);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 3\n");
> +               return;
> +       }
> +       dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);

Does this need to be printed every time you power on the panel? Seems
like it's going to spam up the logs... I'm not sure what it's used
for.


> +static int ws2401_power_off(struct ws2401 *ws)
> +{
> +       /* Disable backlight */
> +       if (ws->bl)
> +               ws2401_command(ws, WS2401_WRCTRLD, 0x00);

I don't have any real knowledge here, but the location of this seems a
little odd. Just based on inspection of the rest of the driver, I
almost would have thought it would need to be sent _before_ entering
sleep mode, but I certainly could be wrong.


> +static int ws2401_disable(struct drm_panel *panel)
> +{
> +       struct ws2401 *ws = to_ws2401(panel);
> +
> +       ws2401_command(ws, MIPI_DCS_SET_DISPLAY_OFF);
> +       msleep(25);

It feels weird / arbitrary the split between "disable" and "unprepare"
on this panel driver compared to the "db7430.c" one. In the other
driver you put the sleep mode here and in this driver you put the
sleep mode un "unpreapre". Is that for a reason, or just arbitrary?
Can it be consistent between the two drivers?

I guess maybe this is because in "db7430" the power up order was
slightly different?


> +static const struct backlight_ops ws2401_bl_ops = {
> +       .update_status = ws2401_set_brightness,
> +};
> +
> +const struct backlight_properties ws2401_bl_props = {

"static const" instead of "const"?


> +       ret = drm_panel_of_backlight(&ws->panel);
> +       if (ret) {
> +               dev_info(dev, "no external backlight, using internal backlight\n");
> +               ws->bl = devm_backlight_device_register(dev, "ws2401", dev, ws,
> +                                                       &ws2401_bl_ops, &ws2401_bl_props);
> +               if (IS_ERR(ws->bl)) {
> +                       ret = PTR_ERR(ws->bl);
> +                       return dev_err_probe(dev, ret,
> +                                            "failed to register backlight device\n");

nit: probably didn't need the separate assignment to "ret". Just pass
"PTR_ERR(ws->bl)" to the function. Then no need for braces for your
"if" too.

> +               }
> +               ws->panel.backlight = ws->bl;
> +       } else {
> +               dev_info(dev, "using external backlight\n");

This (and the other "no extenal backlight") feels a bit chatty to me.
If you really want them and want them at "info" level then I won't
object, but I guess I like short logs even with "info" enabled.

-Doug

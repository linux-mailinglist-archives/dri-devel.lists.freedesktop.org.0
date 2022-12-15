Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E964E1B3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 20:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB62A10E51C;
	Thu, 15 Dec 2022 19:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E96C10E51C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 19:22:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so104789wml.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w7QvriN0Yzz4DpWiidJ+JgStbl//Q1uu1xv/fE8FAr0=;
 b=Oq57Rg3BEfZvf16gRaNH5uzbmwjJ9NKAWo5xcOK5bwbzMhiWUG2ibj1I/13GmpDAIZ
 ng0U8gRHreO2ypWKyOl6q/db4orE0I38UXmtmzzHQItV8BlcqmRyWcFOxUS2Ho6bgfmw
 VjWpF7r+eFuAotZyEXcqUkqmIA84cTVCbZ/kxCsCfU0g1u/QaStgdqcBdB2Hcli+NbPd
 BwOFOvVzHQn68r1yROXuTZ4zjCUYZpJifNT1MhWplxhb6dSVS6/9VO4yDJ6XKsyQkpha
 Z7qSFHbl28BCjoQWOYME7/DAtLODcnhbhLAyb3sWUYB1Ne1ihDniBzGuOdGzDfXrQOhq
 JIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w7QvriN0Yzz4DpWiidJ+JgStbl//Q1uu1xv/fE8FAr0=;
 b=ufgNX1Z5oVTxP+FjpRRV/V8k7BXSl3Iz7j15Ot05Hm+yoBDYwTKo2ocIXMhmtcvluS
 MU4osz44bBJJ7o1gDrLo+GmxWzT5hs2F3/igESW+PF/HQzorePRVcxI25VQbgyE9HJXe
 hGUyHBihOoQw77lE3fLUwMKjWIwD0+R20jraCjPJzHeOJnJT77LiX+K5GLstq58ushQ8
 k/cNS8/C3mevIRPOdi5ngWWMTspLzn6N5XyH9bcI3JuksZ1nt+ikI106diXe5TRaiG+I
 wqPLPJu3JsGtMdxhQmZU/EPIzhbYe5q3yq5wSa+E7DyntvMZ+6djI46JcOxOftHn0PRu
 m37A==
X-Gm-Message-State: AFqh2kpA8Ac+pqIv//pT9qCR1GPSS/qjQlzBf2Z8fjWa7cc5dLtkqkPb
 pOZ9gLySo7f6dSrM721qvvNKUZ8xfKKuUa7gRlw=
X-Google-Smtp-Source: AMrXdXt5YBVPcaJuONok0izThgg5AbeLGxcDE8DEPjhmTV00Q/PT6PDhFYpoG3yC54VbOGL+Jhio36vToT0Y4BYkAYs=
X-Received: by 2002:a05:600c:35ca:b0:3d3:4012:8d9d with SMTP id
 r10-20020a05600c35ca00b003d340128d9dmr60012wmq.205.1671132132714; Thu, 15 Dec
 2022 11:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20221214110037.149387-1-cbranchereau@gmail.com>
 <20221214110037.149387-2-cbranchereau@gmail.com>
 <CACRpkdag1ZDyHRu5FqLWrsiqbmVuX2Wj5z67yhkg_=ooFqsboQ@mail.gmail.com>
In-Reply-To: <CACRpkdag1ZDyHRu5FqLWrsiqbmVuX2Wj5z67yhkg_=ooFqsboQ@mail.gmail.com>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Thu, 15 Dec 2022 20:22:01 +0100
Message-ID: <CAFsFa86mQt5hMAftcpqj77nraF82CjfXv=m_Zt5quTv7O8Jf9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: add the orisetech ota5601a
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus

On Thu, Dec 15, 2022 at 9:42 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Christophe,
>
> thanks for your patch!
>
> On Wed, Dec 14, 2022 at 12:01 PM Christophe Branchereau
> <cbranchereau@gmail.com> wrote:
>
> > Add the orisetech ota5601a ic driver
> >
> > For now it only supports the focaltech gpt3 3" 640x480 ips panel
> > found in the ylm rg300x handheld.
> >
> > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> (...)
> > +config DRM_PANEL_ORISETECH_OTA5601A
> > +       tristate "Orise Technology ota5601a RGB/SPI panel"
> > +       depends on OF && SPI
> > +       depends on BACKLIGHT_CLASS_DEVICE
> > +       select REGMAP_SPI
>
> Nice use of regmap in this driver.
>
> > +static const struct reg_sequence ota5601a_panel_regs[] = {
> > +       { 0xfd, 0x00 },
> > +       { 0x02, 0x00 },
> > +
> > +       { 0x18, 0x00 },
> > +       { 0x34, 0x20 },
> > +
> > +       { 0x0c, 0x01 },
> > +       { 0x0d, 0x48 },
> > +       { 0x0e, 0x48 },
> > +       { 0x0f, 0x48 },
> > +       { 0x07, 0x40 },
> > +       { 0x08, 0x33 },
> > +       { 0x09, 0x3a },
> > +
> > +       { 0x16, 0x01 },
> > +       { 0x19, 0x8d },
> > +       { 0x1a, 0x28 },
> > +       { 0x1c, 0x00 },
> > +
> > +       { 0xfd, 0xc5 },
> > +       { 0x82, 0x0c },
> > +       { 0xa2, 0xb4 },
> > +
> > +       { 0xfd, 0xc4 },
> > +       { 0x82, 0x45 },
> > +
> > +       { 0xfd, 0xc1 },
> > +       { 0x91, 0x02 },
> > +
> > +       { 0xfd, 0xc0 },
> > +       { 0xa1, 0x01 },
> > +       { 0xa2, 0x1f },
> > +       { 0xa3, 0x0b },
> > +       { 0xa4, 0x38 },
> > +       { 0xa5, 0x00 },
> > +       { 0xa6, 0x0a },
> > +       { 0xa7, 0x38 },
> > +       { 0xa8, 0x00 },
> > +       { 0xa9, 0x0a },
> > +       { 0xaa, 0x37 },
> > +
> > +       { 0xfd, 0xce },
> > +       { 0x81, 0x18 },
> > +       { 0x82, 0x43 },
> > +       { 0x83, 0x43 },
> > +       { 0x91, 0x06 },
> > +       { 0x93, 0x38 },
> > +       { 0x94, 0x02 },
> > +       { 0x95, 0x06 },
> > +       { 0x97, 0x38 },
> > +       { 0x98, 0x02 },
> > +       { 0x99, 0x06 },
> > +       { 0x9b, 0x38 },
> > +       { 0x9c, 0x02 },
> > +
> > +       { 0xfd, 0x00 },
> > +};
>
> If these are registers, why is register 0xfd written 7 times with different
> values?

It initiates a page shift

> This is rather a jam table or intializations sequence, so it should be
> names something like that and a comment about undocumented
> registers added probably as well.

Honestly I don't remember how I got the panel specsheet, thought it
was widely available but I can't find it anymore online,
so yes I guess at least documenting what each page does could be good
for future reference

> > +static int ota5601a_enable(struct drm_panel *drm_panel)
> > +{
> > +       struct ota5601a *panel = to_ota5601a(drm_panel);
> > +       int err;
> > +
> > +       err = regmap_write(panel->map, 0x01, 0x01);
>
> Since you know what this register does, what about:
>
> #include <linux/bits.h>
>
> #define OTA5601A_CTL 0x01
> #define OTA5601A_CTL_OFF 0x00
> #define OTA5601A_CTL_ON BIT(0)

I can definitely do that if it improves clarity

> > +static int ota5601a_get_modes(struct drm_panel *drm_panel,
> > +                            struct drm_connector *connector)
> > +{
> > +       struct ota5601a *panel = to_ota5601a(drm_panel);
> > +       const struct ota5601a_panel_info *panel_info = panel->panel_info;
> > +       struct drm_display_mode *mode;
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < panel_info->num_modes; i++) {
> > +               mode = drm_mode_duplicate(connector->dev,
> > +                                         &panel_info->display_modes[i]);
> > +               if (!mode)
> > +                       return -ENOMEM;
> > +
> > +               drm_mode_set_name(mode);
> > +
> > +               mode->type = DRM_MODE_TYPE_DRIVER;
> > +               if (panel_info->num_modes == 1)
>
> But ... you have just added an array that contains 2 elements, you
> KNOW it will not be 1.

I know that for the specific panel supported by this driver there are 2 modes,
however in the future someone could want to add a panel using the same IC,
which could have any number of modes

>
> > +                       mode->type |= DRM_MODE_TYPE_PREFERRED;
>
> I think you should probably set this on the preferred resolution
> anyways, take the one you actually use.
>
> > +static const struct of_device_id ota5601a_of_match[] = {
> > +       { .compatible = "focaltech,gpt3", .data = &gpt3_info },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ota5601a_of_match);
>
> Does this mean the display controller is ota5601a and the display
> manufacturer and product is focaltech gpt3? Then it's fine.

Yes

> Overall the driver looks very good, just the above little details.

Ok, will do the v3 next week, holidays etc :)

> Yours,
> Linus Walleij

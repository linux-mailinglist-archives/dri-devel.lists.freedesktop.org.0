Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F74C9C6B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 05:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C7810E7A5;
	Wed,  2 Mar 2022 04:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C81410E7A5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 04:23:53 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x5so546942edd.11
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 20:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqEKIETZm2YSWxOmTa05rYaKT/DoDHJRdY0jrBY+wQs=;
 b=fmfV2qY4oVdBSl2vWMLjKrhsRz6O9ivo3hCD3GQCfgGtmvQYnPOAn8Zf61WrGSD+ln
 8nb1/B8fQ9tJDjMW3MXiOXiaUlkQQqSaIkSdW4r7DGO990gdY9DI1wuuTxfUqMt843vd
 h9AAXWWzw0JA6L0n/5B/nQ+NI3u+XNxou0/EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqEKIETZm2YSWxOmTa05rYaKT/DoDHJRdY0jrBY+wQs=;
 b=nuFFl5BBctAGGOHQ/7oPK3ku5RsoaHpbPfL12N65GeEb90DqqnQYZVi8jjj4HoI+oZ
 2XufCGK4VqQ9l9S9b/3za4wCdjXp8Jo5ynF1fxlv124fbnghRqTNe74HXc1PwxhDclwp
 WfeZKKPEGGaDmdNROsEQw1/TU+ITa7lLhJrA+OgWx8ZebVLdN7+HUKZVhgbIfQvZslMp
 T86EtH2pHWMqErgmu13GztYXdEIOE7gqDhh5EB9il80jWaS3jnJhkec3nyQamDb1LU3l
 I+PVVcPX43ohHLd+LXn/s1X5Vc9G7uwjRQ9AwjZlV/HhAzs1hXqMs0P/0S7DMn71a4Y0
 k24A==
X-Gm-Message-State: AOAM531yTrtDPnCVDjF8zdG7CL4LkUwqYIdysVgcHhBO23J9qZ6LJ45z
 kGAMeYwc/6lQpMiT8jPjqhGaIObrFqE/wNRFgGyo4g==
X-Google-Smtp-Source: ABdhPJwHVnICy4E0tYbs1KtHyfoffEUC3OY9kOLZcahV/ZmnMUgy0THEEU/rc4XgQ3J1Scqxr/jPwlQ39u8/+XiEO5s=
X-Received: by 2002:a05:6402:2298:b0:410:a419:997 with SMTP id
 cw24-20020a056402229800b00410a4190997mr27494076edb.271.1646195031728; Tue, 01
 Mar 2022 20:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
 <20220301141247.126911-8-jagan@amarulasolutions.com>
 <CACRpkdZAPbe=_RMjnHkmAVBUir=HobMPWtp-4TQgETSsmEd8ww@mail.gmail.com>
In-Reply-To: <CACRpkdZAPbe=_RMjnHkmAVBUir=HobMPWtp-4TQgETSsmEd8ww@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 2 Mar 2022 09:53:40 +0530
Message-ID: <CAMty3ZAAiM4uV4bHCAYrx70Qd8+PJubDvZakowD_LPjouPG-Gg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm: bridge: anx7625: Switch to
 devm_drm_of_get_bridge
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 2, 2022 at 4:43 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Mar 1, 2022 at 3:13 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > devm_drm_of_get_bridge is capable of looking up the downstream
> > bridge and panel and trying to add a panel bridge if the panel
> > is found.
> >
> > Replace explicit finding calls with devm_drm_of_get_bridge.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - split the patch
>
> This will be nice code reduction when it works!
>
> > -       struct drm_panel *panel = NULL;
> > -       struct drm_bridge *bridge = NULL;
> > +       struct drm_bridge *bridge;
>
> OK... and then you delete the code that uses panel. But:
>
> static void mcde_dsi_unbind(struct device *dev, struct device *master,
>                             void *data)
> {
>         struct mcde_dsi *d = dev_get_drvdata(dev);
>
>         if (d->panel)
>                 drm_panel_bridge_remove(d->bridge_out);

I think using drm_bridge_remove(d->bridge_out); will directly remove
the bridge whether it is the next bridge or panel bridge as bridge_out
is already found the relevant downstream.

Jagan.

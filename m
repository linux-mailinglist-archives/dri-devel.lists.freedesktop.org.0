Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B563E571555
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710411AFBF;
	Tue, 12 Jul 2022 09:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E776914A429
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:08:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r10so4084725wrv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=64H1Kxgm8ncmGDcNtttCQA5XuXOfCcJqu3peaSGQwt0=;
 b=LNz3i4o2jAUEcKiMvsU1dfaggfgUlmGi8O0gCZsYDtksi3Ay6mT+0QO1Ws/AQ0xRf7
 OxiV1c5uRao+KCfHGIwCbH8P2LGz5roJlvYguREHYMFQXtL5jgUTD55IOkgc/jvTEcPO
 GSgZA5VVRaX3K9fFfaktQ2ZRV1FCXoL/jQxSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=64H1Kxgm8ncmGDcNtttCQA5XuXOfCcJqu3peaSGQwt0=;
 b=qxsxFiR4mGURYmZIt+LkjzvMB908ngSVlJkoz9lQCm9755GOXazqir2B4+DEc85i5a
 jFBL1tkHENqxo3dG7bN8w6FsX3B8H/ijeJIxVIlpcNtvjOMhIDRQOeF0SFWKkO/Bz5PC
 efZb2T1mHrhlidOESToiXgsBHuwfN2C0SF3iG+oKaSOVaFNiWVfUOp3qfHoabqUn3+Hq
 pYhTYbauQhvvA5Cw3ha794qqahK7XVRFR16Qw/phjNMClKJIccs0tLrZmK6gT37UuwvH
 AZEpXoOkZIBEjihuaVRjY286zt/ZZmfiV515ik12hxsPTAQ5IY3ry9xZOxxN103Dw+yR
 aogQ==
X-Gm-Message-State: AJIora+TwQ5MI8NIXrzhMnGhT0SzLFPHY7l/afMI4vXrAagNteA9me1u
 L14trR7xFZ3YpBfqImhNY0ktem8ZsnJY7XMGnT0eCA==
X-Google-Smtp-Source: AGRyM1veFTFmz28R79lM12n/O8GNXkrvz8w+ExQZWk8HwJqmd7Y+ArzgKwSYKQFbeBymgAOO/6GwPX3fMphTlpVQQzU=
X-Received: by 2002:a5d:64cc:0:b0:21d:a4bd:fdbe with SMTP id
 f12-20020a5d64cc000000b0021da4bdfdbemr9984122wri.580.1657616894391; Tue, 12
 Jul 2022 02:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
 <20220707080600.49041-2-allen.chen@ite.com.tw>
 <CAG3jFystTA3sD2nWJHPYq39WxRwjVt4qj2DMDk2Khh1kR=8ntg@mail.gmail.com>
In-Reply-To: <CAG3jFystTA3sD2nWJHPYq39WxRwjVt4qj2DMDk2Khh1kR=8ntg@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 12 Jul 2022 17:08:03 +0800
Message-ID: <CAEXTbpc4PpvoOdu0OSsgvZFsc9AeJwvz7AmnabYO8-wGS56N5w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: it6505: Modified power sequence
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 allen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

On Tue, Jul 12, 2022 at 4:07 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hi Allen,
>
> On Thu, 7 Jul 2022 at 10:06, allen <allen.chen@ite.com.tw> wrote:
> >
> > From: allen chen <allen.chen@ite.com.tw>
> >
> > Change power sequence to meet it6505 data sheet requirement when boot on.
> >
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> >
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> > index 2d119e3016b3..aa5e0aa1af85 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -3029,7 +3029,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
> >                 return PTR_ERR(pdata->ovdd);
> >         }
> >
> > -       pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +       pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>
> Making this change is problematic since it requires a corresponding
> change in all of the device trees that use this device. It's against
> policy to change this interface after it has been introduced.
>
> Unless anyone thinks otherwise, I would like to see this patch dropped.

I don't really understand why this would require corresponding change
in device trees.

Currently there's no real it6505 user on upstream. Also, the GPIO
value will be changed
in it6505_poweron, so this change only affects the power on sequence of it6505.

>
> >         if (IS_ERR(pdata->gpiod_reset)) {
> >                 dev_err(dev, "gpiod_reset gpio not found");
> >                 return PTR_ERR(pdata->gpiod_reset);
> > --
> > 2.25.1
> >

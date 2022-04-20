Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E750871B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3657310F24F;
	Wed, 20 Apr 2022 11:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A6E10F24F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:32:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E2BA5CE1D7E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5904FC385BB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650454351;
 bh=SVJ1k2v3tWdUGg+iydyQsi4Bq8zjjEYtWiKbWgwFaLw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sQ6L9Sz7HsTeFplAqNVVqZ6QvDLXO7taCfdy4bCI083iKPBu4Tu1W3tAjRXjBMJP+
 vEnLCGH51YORxEsFGOcZi/zoMsoYQoogO656Bx3dJCN3iokeUHMcZ/sRdJXG/FEfPy
 OVbCsNPPUvMBA4ygYO3ABwIPljbcDkM69w6wy8bq4hi0dZRIAMv8YMoKSdGB49RoPV
 7T06gmGwLx2hqcDTbF36X1GFj0Gux2+ukzAt7yv7JaGdNy5Qv43jNDhgQacW6a+5lC
 7ziU5CwWVIqq9dL54xJaRWmMjZZOJMF8J98DaHAPKZKsUB+PqhqrA4wPmQhlfKvBIW
 qSWfkWYIEhJww==
Received: by mail-wr1-f50.google.com with SMTP id g18so1820147wrb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 04:32:31 -0700 (PDT)
X-Gm-Message-State: AOAM531AO7sh5PMX0VyLXfFe/5qYPJ8I3YxI+s42FFkxHgP0gOms8Hqp
 HMnnYegOUK8XDUgY8r49E4bfV/FSYXO4XsU/6AA=
X-Google-Smtp-Source: ABdhPJyiDPtmjdTUE7gVl98mXVlPUP43tSlAHIUMCCxTRsYmEILlWV1BOcaVw3t9k0Uq80bvmC166gAUNNWM192dlCo=
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr15873027wrp.407.1650454349319; Wed, 20
 Apr 2022 04:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-2-arnd@kernel.org>
 <ddaf112d-f997-84b7-2c57-bab3d0cca382@gmail.com>
In-Reply-To: <ddaf112d-f997-84b7-2c57-bab3d0cca382@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 13:32:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+5p5i2Nxy6AxH5qDsVqqxwSR_5ufjoYCALProSLNspg@mail.gmail.com>
Message-ID: <CAK8P3a3+5p5i2Nxy6AxH5qDsVqqxwSR_5ufjoYCALProSLNspg@mail.gmail.com>
Subject: Re: [PATCH 01/41] video: fbdev: omapfb: lcd_ams_delta: fix unused
 variable warning
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 11:24 AM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 4/19/22 4:36 PM, Arnd Bergmann wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > A recent cleanup patch removed the only reference to a local variable
> > in some configurations.
> >
> > Move the variable into the one block it is still used in, inside
> > of an #ifdef, to avoid this warning.
> >
> > Fixes: 9d773f103b89 ("video: fbdev: omapfb: lcd_ams_delta: Make use of the helper function dev_err_probe()")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/video/fbdev/omap/lcd_ams_delta.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
> > index bbf871f9d862..01944ce46aa1 100644
> > --- a/drivers/video/fbdev/omap/lcd_ams_delta.c
> > +++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
> [...]
> > @@ -145,7 +144,7 @@ static int ams_delta_panel_probe(struct platform_device *pdev)
> >                                               &ams_delta_lcd_ops);
> >
> >       if (IS_ERR(lcd_device)) {
> > -             ret = PTR_ERR(lcd_device);
> > +             int ret = PTR_ERR(lcd_device);
>
>    How about inserting an empty line after declaration?

Ok, done.

        Arnd

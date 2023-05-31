Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680D7173B5
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 04:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB5910E45D;
	Wed, 31 May 2023 02:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0834F10E45D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:30:02 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b0314f057cso24522225ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685500200; x=1688092200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZbvEmEPbsI8LQ6J1wC1vs2xLNb4jhIMPg6wJX0MCwlk=;
 b=l1iDoBBQGC2vSvMRPjoYHLi9iutFcghATp7wZTCI0jdzWftvty2QmTUWlpgqUq0QTh
 YvlLGO6kKdf5fMvZDRqBrzZ/DVoeN0KWJgaNUzGrTzQe0WFwCfihmwMGaBMjXqsQ8zzl
 JYUZpcieKRM0XtssiBPvGnEPxF+6Ud0Chn8Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685500200; x=1688092200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZbvEmEPbsI8LQ6J1wC1vs2xLNb4jhIMPg6wJX0MCwlk=;
 b=b1rSua2coN5BHIKHCuS4abLrs8x94+Q/E2Nb0qS91SpIi+47adCus2hyTBG6Mk7m0q
 bZvNGxzokXKCOyvludhXfWYV31H3cvnfVtpli7CL50y4Cw6XLYDTZqMZYdf6os1rHHsg
 Y0XBo5iPdA0/BTCFGXpi7e8twh2XkLS0MpA8Li3tgmPY7ghcWxVl4/PRKUWdko9cfeOJ
 kNqdQpwLBuK+jAyHH6U1laaCJk/gBlUWF5r4PZlIA7oGwOQKNpGLGw0BPoZLzLrIrw6w
 drV2KaaedoJgTXj5CUn0Ff1Or1Q/UAG2WIQGqqjG1bQDJ7Gbnis6NRk7rbWEUaL2pUBo
 nrTQ==
X-Gm-Message-State: AC+VfDzGPTGV8Zr4JFe2JPXa8pLdBkdrdSw0ztd18cWIUHBkZ2ojdSFV
 IVCbu/pq+xU417wuMScMYh8ZrjlEwaN8vIvYTV0=
X-Google-Smtp-Source: ACHHUZ5BlDrBLx1zzkojLIamPA0QaNHwhOw1Ui2mk5dO3HVDD0A+oBG7kfVIoLMnFbY4DjvhGE8l/Q==
X-Received: by 2002:a05:6a00:98f:b0:645:c730:f826 with SMTP id
 u15-20020a056a00098f00b00645c730f826mr5109783pfg.24.1685500200086; 
 Tue, 30 May 2023 19:30:00 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179]) by smtp.gmail.com with ESMTPSA id
 h22-20020a62b416000000b0064d1349dc31sm2239704pfn.199.2023.05.30.19.29.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 19:29:59 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1ae64580e9fso55945ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:29:59 -0700 (PDT)
X-Received: by 2002:a92:c243:0:b0:338:9f6a:d54e with SMTP id
 k3-20020a92c243000000b003389f6ad54emr79412ilo.28.1685500178040; Tue, 30 May
 2023 19:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
 <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
In-Reply-To: <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 May 2023 19:29:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSWES7BK03dBFnxR8eDxRTRFACBRHnhNK94gf-0ed2pg@mail.gmail.com>
Message-ID: <CAD=FV=XSWES7BK03dBFnxR8eDxRTRFACBRHnhNK94gf-0ed2pg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Crt Mori <cmo@melexis.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Sam Ravnborg <sam@ravnborg.org>,
 kernel@pengutronix.de, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Stefan Mavrodiev <stefan@olimex.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Liang He <windhl@126.com>,
 Phong LE <ple@baylibre.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 26, 2023 at 7:43=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, May 26, 2023 at 2:08=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> > call-back type"), all drivers being converted to .probe_new() and then
> > 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") conve=
rt
> > back to (the new) .probe() to be able to eventually drop .probe_new() f=
rom
> > struct i2c_driver.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >
> > I didn't get feedback for (implicit) v1 that was sent with Message-Id:
> > <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>. This is a
> > rebase on v6.4-rc1 as the former patch doesn't apply cleanly any more.
> >
> > I also added more people to Cc, maybe that helps to get feedback.
> >
> > This patch is based on v6.4-rc1, and applies fine on today's next.
> > (There are also no new drivers that need adaption in next.)
> >
> > Thanks for considering,
> > Uwe
> >
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             | 2 +-
> >  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
> >  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 2 +-
> >  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
> >  drivers/gpu/drm/bridge/chipone-icn6211.c                 | 2 +-
> >  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
> >  drivers/gpu/drm/bridge/cros-ec-anx7688.c                 | 2 +-
> >  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
> >  drivers/gpu/drm/bridge/ite-it66121.c                     | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt9211.c                  | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
> >  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
> >  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 2 +-
> >  drivers/gpu/drm/bridge/parade-ps8622.c                   | 2 +-
> >  drivers/gpu/drm/bridge/parade-ps8640.c                   | 2 +-
> >  drivers/gpu/drm/bridge/sii902x.c                         | 2 +-
> >  drivers/gpu/drm/bridge/sii9234.c                         | 2 +-
> >  drivers/gpu/drm/bridge/sil-sii8620.c                     | 2 +-
> >  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
> >  drivers/gpu/drm/bridge/tc358768.c                        | 2 +-
> >  drivers/gpu/drm/bridge/tc358775.c                        | 2 +-
> >  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c                    | 2 +-
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 2 +-
> >  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
> >  drivers/gpu/drm/i2c/tda9950.c                            | 2 +-
> >  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
> >  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c       | 2 +-
> >  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c    | 2 +-
> >  drivers/gpu/drm/solomon/ssd130x-i2c.c                    | 2 +-
> >  32 files changed, 33 insertions(+), 33 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> This does apply to drm-misc-next and I'm happy to apply it there, but
> I'm a bit iffy doing it on the Friday before a 3-day weekend (Monday
> is a holiday in the US). If this is still pending next Tuesday and I'm
> not swamped then, I'll plan to apply it. I'm more than happy if a
> different drm commtter wants to apply it sooner. Thanks!

As promised, pushed to drm-misc-next:

332af828ce78 drm: Switch i2c drivers back to use .probe()

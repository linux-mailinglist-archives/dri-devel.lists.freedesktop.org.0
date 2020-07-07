Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E121676D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7816E6E5C8;
	Tue,  7 Jul 2020 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE30189E57
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 04:14:45 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id e18so19386730pgn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 21:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qEprmOlTY6puSyCIWCfUXtLm8xXvjpiYlwOcozAIUio=;
 b=JFx744KkwGkk5wwXPaVDr5ZU7Bn4Ub8uJ+sZzrgPDW8cUa/LPJUjgyYTdCAobx4Yyi
 Ne5k7D5yBQ7+33dJ37Bw+Wjbp2u+woknlkfXziwyldKDluEk6w9jtbS4Ns/yQJDgTtKO
 KfJMbz1oxLHsOxgSe+0vKeD/FZlV1V0UE0Y1zR2qc2HRvXKleTu39hx+ML5IGsFW6oXb
 BnxAMfn0ZsIxcUtTHGsvlefYLDu6VCfd2begQ0+CzFvQsuimvMamn7jfkqtN2u6g1vKO
 s3P3FXTdkQP44SkmuDyrLCK03x2W8wq8GLXAHmO04vJLI4I7NrK7TFzDI08iluVGlzJ1
 KeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qEprmOlTY6puSyCIWCfUXtLm8xXvjpiYlwOcozAIUio=;
 b=IfpRdkvu9/n7HRnK4PRmvwafwssM3xkiZIYJjoe0ApuEwcV2f0X1Ejid/O5IfjSRkU
 W76jSLeKDITy2EgHi46TVfoQrbBwyE+E+5YBu2MT/Pphf/7jNYJJPYxf0ZSTj81YHGf6
 S2eYqs5KTIFM8LcP4B3NpFjkEismljnLZNgzDplPlkieZz9Qf423xEsFdudXjVx1pv1M
 DzcrSHzQ75GUa5HWCtkclVFgAH/jI7vtL+gKec1jsO3WWpoUVDWb+rdUcw5ITzkuc4zN
 kivU+NcZJP6qT2nh5MaESl9tpFmR4EsMxBRV5VbMFOfrN0zFbSO7rK6VPInfYu+S5gcr
 wiMQ==
X-Gm-Message-State: AOAM532v0L7RHy5JUbLXZaH4ZzHItmY7sx9qVDSCUrwlrcpHR2ipNvhD
 6JScMy57p1FPSjaTpx4EBbE=
X-Google-Smtp-Source: ABdhPJwJV1fYmtkHPRdr0loU/ctwB/AbXfQRm/jbU4vXCvCYppXxNN7/AvhjbSvunGHm4gJcJCW29Q==
X-Received: by 2002:a05:6a00:5c:: with SMTP id
 i28mr30727237pfk.274.1594095285301; 
 Mon, 06 Jul 2020 21:14:45 -0700 (PDT)
Received: from dtor-ws ([100.99.132.186])
 by smtp.gmail.com with ESMTPSA id b21sm11277073pfb.45.2020.07.06.21.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 21:14:44 -0700 (PDT)
Date: Mon, 6 Jul 2020 21:14:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
Message-ID: <20200707041442.GE3273837@dtor-ws>
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
 <5f159e00-44fd-515b-dd8c-4db9845dc9e6@ti.com>
 <7e3c924b-c025-a829-6868-78e2935c70eb@samsung.com>
 <66faa188-5ef6-d449-07fe-28c8be5e559c@ti.com>
 <21f5ec9c-2d1d-5f28-5aeb-ac0db144a55e@samsung.com>
 <CAKdAkRRLBLCLGH2qhEjaVnt8wNjoyGAfQimNWHZUvzx2m6Mwng@mail.gmail.com>
 <e6057292-39de-831c-0b8d-b3f0b66937dc@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6057292-39de-831c-0b8d-b3f0b66937dc@samsung.com>
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 08:57:55AM +0200, Andrzej Hajda wrote:
> =

> On 30.06.2020 20:00, Dmitry Torokhov wrote:
> > On Tue, Jun 30, 2020 at 8:42 AM Andrzej Hajda <a.hajda@samsung.com> wro=
te:
> >>
> >> On 30.06.2020 10:59, Grygorii Strashko wrote:
> >>> Hi
> >>>
> >>> On 29/06/2020 14:28, Andrzej Hajda wrote:
> >>>> Hi Grygorii,
> >>>>
> >>>> (...)
> >>>>
> >>>>>>     /*
> >>>>>>      * deferred_devs_show() - Show the devices in the deferred pro=
be
> >>>>>> pending list.
> >>>>>>      */
> >>>>>> @@ -221,7 +241,8 @@ static int deferred_devs_show(struct seq_file =
*s,
> >>>>>> void *data)
> >>>>>>         mutex_lock(&deferred_probe_mutex);
> >>>>>>           list_for_each_entry(curr, &deferred_probe_pending_list,
> >>>>>> deferred_probe)
> >>>>>> -        seq_printf(s, "%s\n", dev_name(curr->device));
> >>>>>> +        seq_printf(s, "%s\t%s", dev_name(curr->device),
> >>>>>> + curr->device->p->deferred_probe_reason ?: "\n");
> >>>>>>           mutex_unlock(&deferred_probe_mutex);
> >>>>>>
> >>>>> Sry, may be i missing smth, but shouldn't it be optional
> >>>>> (CONFIG_DEBUG_FS is probably too generic).
> >>>>>
> >>>> I am not sure what exactly are you referring to, but this patch does=
 not
> >>>> add new property, it just extends functionality of existing one.
> >>> Sry, needed to be more specific.
> >>>
> >>> You've added  device_set_deferred_probe_reson(dev, &vaf);
> >>> which expected to be used on every EPROBE_DEFER in dev_err_probe() in
> >>> combination with
> >>>
> >>> +       } else {
> >>> +               device_set_deferred_probe_reson(dev, &vaf);
> >>>                  dev_dbg(dev, "error %d: %pV", err, &vaf);
> >>>
> >>> ^^ dev_dbg() does not add any runtime overhead during boot unless ena=
bled
> >>> +       }
> >>>
> >>> But:
> >>>
> >>> +void device_set_deferred_probe_reson(const struct device *dev, struct
> >>> va_format *vaf)
> >>> +{
> >>> +       const char *drv =3D dev_driver_string(dev);
> >>> +
> >>> +       mutex_lock(&deferred_probe_mutex);
> >>> +
> >>> +       kfree(dev->p->deferred_probe_reason);
> >>> +       dev->p->deferred_probe_reason =3D kasprintf(GFP_KERNEL, "%s:
> >>> %pV", drv, vaf);
> >>> +
> >>> +       mutex_unlock(&deferred_probe_mutex);
> >>> +}
> >>>
> >>> ^^ Adds locking, kfree() and kasprintf() for every deferred probe
> >>> during boot and can't be disabled.
> >>>
> >>> Right?
> >>
> >> Right, but usually the burden should be insignificant in comparison to
> >> probe time, so I do not think it is worth optimizing.
> > I do not think this is going to take. You are suggesting that we
> > modify pretty much every driver to supply this deferral reason, and I
> > doubt it will happen. Can we put this burden on providers that raise
> > the deferral?
> =

> =

> I wouldn't say they raise the deferral, they just inform resource is not =

> yet available. Only device driver, and only in its probe function can =

> "raise the deferral".

Well, this is a matter of perspective. If devm_gpiod_get() returns
-EBUSY and this is returned to driver core, is it GPIO line signals that
line is busy, or is it the driver applies its knowledge. I say that in
majority of cases driver does not really get a say in this and simply
has to pass whatever error condition that is signalled by providers up
the stack.

I would consider whenever a driver does not propagate -EPROBE_DEFER to
the driver code a bug that needs fixing, because it should not degrade
functionality and/or performance just because we have not figured out
how to order probing properly and have to rely on deferrals.

> =

> =

> >   I.e. majority of code are using devm API now, so we most
> > likely know the device for which deferral is being raised. We can have
> > a list of deferral reasons and their devices and when in device code
> > once probe is done we could try reconciling it with the deferred
> > devicelist, and this would mean you only need to implement this in
> > gpiolib, regulator core, clocks core, etc.
> =

> =

> This patchset tries to solve simple issue - replace multiple lines of =

> code present in multiple probe functions (additionally fixing lot of =

> them) with single call and then enhance it little bit, nothing more.
> =

> What you are proposing is blurry at the moment for me, provider does not =

> know if consumer want to defer,

This is my point - the consumer does not get to decide. If deferral is
raised, it must be honored.

> or will continue working without missing resource,

Deferral does not mean resource does not exist and the driver has to get
by if it can. It means the resource is not ready, and even if the system
can work without it, it will not be working optimally.

> moreover some consumers can acquire resources after probe - again no
> probe deferral.

In this case we should not signal deferral either.

> Even if it will be done (it can be, for =

> example by creating probe version of all resource get functions), it =

> will require much more changes but finally it will look like:
> =

> res =3D devm_get_resource_from_probe(....)
> =

> if (IS_ERR(res))
> =

>  =A0=A0=A0 return PTR_ERR(res);
> =

> vs:
> =

> res =3D devm_get_resource(...)
> =

> if (IS_ERR(res))
> =

>  =A0=A0=A0 return dev_err_probe(dev, PTR_ERR(res), ...);

And we will need to adjust how many hundreds of drivers?

Consider that most drivers use devm_clk_get(), devm_gpiod_get() and
devm_regulator_get() and their friends. All these APIs already have
device for which resource is being allocated, and moreover their use
outside of probe() path is highly suspicious (because devm outside of
probe() typically result in unwinding in really surprising order). So if
you could stash device and deferral reason in a list and then scan this
list in driver core when handling the raised deferral you would not need
to change anything in individual drivers.

Hope this clears what I had in mind.

Thanks.

-- =

Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

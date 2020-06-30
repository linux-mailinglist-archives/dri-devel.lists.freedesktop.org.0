Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D421F210496
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3A06E7EA;
	Wed,  1 Jul 2020 07:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8851C6E042
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:00:33 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id o3so1171462ilo.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7oL8VGd8A63dQhiVKi3PUjT96u+CwH07OR1iL+5qx4=;
 b=LXxLlaqy8X7luV1H2JLKSLljqApL0A04Nf577TG6L7GJB83ghE594x1YcLOVh8FDVH
 nSuQC0sjMcndgu5UByNZAeT4oyKGQoHtNjxOhZ+WmCKcVdyUbye3RqazYnnCyLmfwP/Q
 s+ksI2t5EMUOleIESpSn3+jyUTmwolmprisrKI0rniHWFpDHrL7bWtz6NR8QXz3cLOI1
 xtrkNIxMgc18pplFyCBd81sFvXGYk6f1mT3EiQgfUOotg2u+lC981oiFyWRvqNIE9sne
 2JXvfhtTQzheVn+GanB5HwVzngV7NjrR1J3tuOH95UPWfNrkyFYPJWteALL2gdG8tncY
 ziGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7oL8VGd8A63dQhiVKi3PUjT96u+CwH07OR1iL+5qx4=;
 b=HGY7oz0DasD8ZMf8d/Rt3DfAunzLyM78mDl8IQuosAIoqzQclzV5DKu7+jutuIENCX
 zpEGdwlelZLc/9mhLLv3Mq7v7ZHlpYYolqWrEAVlIGvYwAgN4QS2rehQp6C56JCEW8Ur
 dD5S0LEP6+Y48sJLHWeAGR/8RDmhPKcOlFlWjQQrd7wbQbTQU3oHOgDJEOq0wyZt4z2E
 ji/LD3BSHBV8SS27eP2F9HzJN6VjfJVfQWFFE6mNXfV/MDMA09qRktWduDyIFh+AxLoU
 oEDYoq7ctVNEYf4il+PGKIooeKuRYVkVwJn6E1pwVXeBTR1kFojJnsjqZa3Jqc0nzsik
 YkLA==
X-Gm-Message-State: AOAM53025OZKNGLZiJG/vz1xVtw8gjFCEam96uJ+nqcpwaWHT3MN/yMd
 vyAwTV9hHvTAWfArJmAQ+PzK1CNF/L6eKncIpwQ=
X-Google-Smtp-Source: ABdhPJx6lNSWEJoftbLz5gNw9hGNEAozoi4443nPKEgIfccHPGmzI05rQic143M7ShtfqDQkwHVgsssevtWA1CT4g78=
X-Received: by 2002:a92:9f96:: with SMTP id z22mr719638ilk.266.1593540032392; 
 Tue, 30 Jun 2020 11:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
 <5f159e00-44fd-515b-dd8c-4db9845dc9e6@ti.com>
 <7e3c924b-c025-a829-6868-78e2935c70eb@samsung.com>
 <66faa188-5ef6-d449-07fe-28c8be5e559c@ti.com>
 <21f5ec9c-2d1d-5f28-5aeb-ac0db144a55e@samsung.com>
In-Reply-To: <21f5ec9c-2d1d-5f28-5aeb-ac0db144a55e@samsung.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 30 Jun 2020 11:00:21 -0700
Message-ID: <CAKdAkRRLBLCLGH2qhEjaVnt8wNjoyGAfQimNWHZUvzx2m6Mwng@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 8:42 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> On 30.06.2020 10:59, Grygorii Strashko wrote:
> > Hi
> >
> > On 29/06/2020 14:28, Andrzej Hajda wrote:
> >> Hi Grygorii,
> >>
> >> (...)
> >>
> >>>>    /*
> >>>>     * deferred_devs_show() - Show the devices in the deferred probe
> >>>> pending list.
> >>>>     */
> >>>> @@ -221,7 +241,8 @@ static int deferred_devs_show(struct seq_file *s,
> >>>> void *data)
> >>>>        mutex_lock(&deferred_probe_mutex);
> >>>>          list_for_each_entry(curr, &deferred_probe_pending_list,
> >>>> deferred_probe)
> >>>> -        seq_printf(s, "%s\n", dev_name(curr->device));
> >>>> +        seq_printf(s, "%s\t%s", dev_name(curr->device),
> >>>> + curr->device->p->deferred_probe_reason ?: "\n");
> >>>>          mutex_unlock(&deferred_probe_mutex);
> >>>>
> >>>
> >>> Sry, may be i missing smth, but shouldn't it be optional
> >>> (CONFIG_DEBUG_FS is probably too generic).
> >>>
> >>
> >> I am not sure what exactly are you referring to, but this patch does not
> >> add new property, it just extends functionality of existing one.
> >
> > Sry, needed to be more specific.
> >
> > You've added  device_set_deferred_probe_reson(dev, &vaf);
> > which expected to be used on every EPROBE_DEFER in dev_err_probe() in
> > combination with
> >
> > +       } else {
> > +               device_set_deferred_probe_reson(dev, &vaf);
> >                 dev_dbg(dev, "error %d: %pV", err, &vaf);
> >
> > ^^ dev_dbg() does not add any runtime overhead during boot unless enabled
> > +       }
> >
> > But:
> >
> > +void device_set_deferred_probe_reson(const struct device *dev, struct
> > va_format *vaf)
> > +{
> > +       const char *drv = dev_driver_string(dev);
> > +
> > +       mutex_lock(&deferred_probe_mutex);
> > +
> > +       kfree(dev->p->deferred_probe_reason);
> > +       dev->p->deferred_probe_reason = kasprintf(GFP_KERNEL, "%s:
> > %pV", drv, vaf);
> > +
> > +       mutex_unlock(&deferred_probe_mutex);
> > +}
> >
> > ^^ Adds locking, kfree() and kasprintf() for every deferred probe
> > during boot and can't be disabled.
> >
> > Right?
>
>
> Right, but usually the burden should be insignificant in comparison to
> probe time, so I do not think it is worth optimizing.

I do not think this is going to take. You are suggesting that we
modify pretty much every driver to supply this deferral reason, and I
doubt it will happen. Can we put this burden on providers that raise
the deferral? I.e. majority of code are using devm API now, so we most
likely know the device for which deferral is being raised. We can have
a list of deferral reasons and their devices and when in device code
once probe is done we could try reconciling it with the deferred
devicelist, and this would mean you only need to implement this in
gpiolib, regulator core, clocks core, etc.

Thanks.

-- 
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

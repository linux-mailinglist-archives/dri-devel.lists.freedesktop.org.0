Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9030896D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AEA6EB26;
	Fri, 29 Jan 2021 14:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236C66EB26
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:01:55 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 11so6288705pfu.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CGKCVe1NqLUtuXRObbYbXGJnP4ybcUgmDDnBwwNgIM=;
 b=blGmnnDezyOzpsWm0ThENsJBDCqkVQH4JRiWS7gRqztEiEuHqGyHTAa4qFox6yiT50
 OLUXznPgAYum2JXERWL51NTxqKj2L95Hk/fUzZBWVc0mLcoo5ncLwtOOkC4Hhd3+pM8I
 hdI8sZuGmuoAUq/JpKZysAJX4oMk9SnhX7e1PMBXMeOzzGI6KeSUVsT6r5D7oHC1BxHH
 CzqVCW+6rrl4xjq2tmfBLoZWr192nUaS+dtdul0pAG7Bu/XDjNseNilpwKJhqQs9f77X
 8YsG+7mpzO289v9euCK3kDcRSXwwBVmhboOYsh9Tp/dMxm4QoiEhNxsVp3edFygTIiUl
 fvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CGKCVe1NqLUtuXRObbYbXGJnP4ybcUgmDDnBwwNgIM=;
 b=cFiSTtTfq1QPw96x5xWoqC2P8bLizZ5MsQAphPNfSeQiQn25NRfhSgcYdzQ9up7Yn/
 JavTdgYjNhHWtD6DSCMBO35mNmRBlcY8eZTIr8E6g8iSJzMhIVIYcaas2w8xdpJA+RiT
 Upz2rWe5XkrnZAPjbzfF9qIPL7ecH/9OqJ5fS1Flct3LBwTjX4eTd6S5mMOWmETCTgK9
 Js/lLnkXDBjgPRwwYRQfyGywK/clL7U/bKqE4DqHpDT9VpeDPp1GvEFyrUrK9cbyeHTU
 5rX/1NHrquJLCvWzvrtQpP/nayfy6GjT8tIQQmwIE018lqe6kBj5Af+9s4+fyAYoQ3VF
 pSjA==
X-Gm-Message-State: AOAM530pTuehsBoLBGOk2OTeTBjNGOLXJtw/8vJtrRDzEVPndv2eGj/t
 rsxFjG10Ei7h70tltU27WKNrZAtteNQ6DZw/Ja8=
X-Google-Smtp-Source: ABdhPJxS0C7ztH8NhIE2909dnQDnGaHlzTxdJSqSHb+jsgnnWDci5TPa7sLCnSfGoprUlgIGdrP5ltzJ/Lo3Tj2eeJ8=
X-Received: by 2002:a63:e50:: with SMTP id 16mr4885373pgo.74.1611928914673;
 Fri, 29 Jan 2021 06:01:54 -0800 (PST)
MIME-Version: 1.0
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
 <20210129204733.00003954@gmail.com>
In-Reply-To: <20210129204733.00003954@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jan 2021 16:01:38 +0200
Message-ID: <CAHp75VdOKH4QU6_HMeUrbhbpsBx0wRxjbxFZh=+1W+7hnxchkQ@mail.gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
To: carlis <zhangxuezhi3@gmail.com>
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 2:47 PM carlis <zhangxuezhi3@gmail.com> wrote:
> On Fri, 29 Jan 2021 12:23:08 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jan 29, 2021 at 7:01 AM carlis <zhangxuezhi3@gmail.com> wrote:
> > > On Thu, 28 Jan 2021 16:33:02 +0200
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Jan 28, 2021 at 2:58 PM Carlis <zhangxuezhi3@gmail.com>
> > > > wrote:

...

> > Please, go again thru my comments and comments from others and
> > carefully address all of them everywhere in your contribution. If you
> > have questions, ask them in reply in the corresponding context.

...

> > > /**
> > >  * init_tearing_effect_line() - init tearing effect line
> >
> > >  *
> >
> > For example, above was commented on and hasn't been addressed here.
> >
> hi,here i can not get you.....

The above is a blank line which is redundant. It also applied to the
other function in the code.

> > >  * @par: FBTFT parameter object
> > >  *
> > >  * Return: 0 on success, < 0 if error occurred.
> > >  */
> > > static int init_tearing_effect_line(struct fbtft_par *par)
> > > {
> > >         struct device *dev = par->info->device;
> > >         struct gpio_desc *te;
> > >         int rc;
> > >
> > >         te = gpiod_get_optional(dev, "te", GPIOD_IN);
> > >         if (IS_ERR(te))
> > >                 return dev_err_probe(dev, PTR_ERR(te), "Failed to
> > >         request te GPIO\n");
> > >
> >
> > >         if (te) {
> >
> > This one is not like I suggested.
> Why? My thinking is that if the TE is not configured and NULL is
> returned, the initialization can still proceed.....

I have suggested to bail out immediately. It will reduce an
indentation level on the below code.

> > >                 par->irq_te = gpiod_to_irq(te);
> > >                 gpiod_put(te);
> > >
> >
> > >                 if (par->irq_te) {
> >
> > This is wrong.
>
> Why? i have read gpiod_to_irq code, if an error occurs, a negative
> value is returned, and zero is not possible,so I need this value to
> determine if TE IRQ is configured

It returns two possible cases:
 - error code (when negative)
 - Linux IRQ number otherwise

You check makes a no-op since in either variant it will proceed to the
request of IRQ, which is wrong in an error case.

> > >                         rc = devm_request_irq(dev,
> > >                                               par->irq_te,
> > >                 panel_te_handler,
> > >                                               IRQF_TRIGGER_RISING,
> > >                 "TE_GPIO", par);
> >
> > Try to use less LOCs.
> >
> > >                         if (rc)
> > >                                 return dev_err_probe(dev, rc, "TE
> > > IRQ request failed.\n");
> > >
> > >                         disable_irq_nosync(par->irq_te);
> > >                         init_completion(&par->panel_te);
> >
> > >                 } else {
> > >                         return dev_err_probe(dev, par->irq_te,
> > > "gpiod to TE IRQ failed.\n");
> > >                 }
> >
> > Again, it is not what had been suggested.
> >
> > >         }

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

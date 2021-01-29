Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B043087C4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 11:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8B46EAC1;
	Fri, 29 Jan 2021 10:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EF96EAC1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 10:23:25 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id q131so5945942pfq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 02:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1yJOa9cCZqrpekGVxy3im++BvB26IIFrQ7p67xz4bWU=;
 b=JItl3w9RUXsrlQMdTdeSeE9VBrTpEoACcm6QZPtalecMUES/uswc8XnfoqLQ7CZRaw
 Bxvntx2atyAtdGs616fHZGRboBerITSzM0/rDnrNylVyFMZfdhgSuCWLrroO+9FZbUhT
 +kBqrJPQJZ3mFuLkbW5pfVMIiKCMg9jsLSPOCOAQSEire7oJ2LrZJuXhFSm6fHNTksgB
 IpP7spHvaFEXfCRLPq5hr6lEeWAU2LXCeoI3yRx54c9FMckVtTcfwqqN2Js75ZKUWLW7
 qcLFTQ1RrGKhNxqjZpxMcvsag7S2B81bvf0cykSxYjExfWhHHdSVhn7m/TvLGK5S3xmM
 Gg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1yJOa9cCZqrpekGVxy3im++BvB26IIFrQ7p67xz4bWU=;
 b=qBNkOn1d1NfWPF8YKF+AFJ1QWpKxpZ8e5MCG4169JJ22PkL2dj6xK8kJuN8SbHpKIo
 TGKUokcDuCskNiYerhkWH8tTFqxUhTO/fYvnc3kRMxQ9IidpUcSRwC1oLXosUO4RY4zA
 WAF2dZGKximYapm0QtR8Tr+WUULfP/ivYo1OCA/ooyzJ78AfST50hqTcM/c8qHZsISH/
 hij1qkygztH2mS2OU0i1lXY25mo+xQMK61wtDBUZH9is8nIJxgfuSNme6CIwmCYksnid
 a2Cw0C3uS5Wi8c7MWPaFNv2ZcQqmp838v/V/uGNjxo+ecTdQp5+sNqoSpGKfo95Pj9yG
 rTsA==
X-Gm-Message-State: AOAM5316ZKvSFz+kjilQ7ceGDWsnVtZaf/XjQAVotXE7+hXP5AiyJ+ij
 fRjJJiIerrArmohKNtrIn9opVMnNXRNGm9HSUnY=
X-Google-Smtp-Source: ABdhPJzZPmiIy1i6+oWh62iX8kptMK1v3q70xltdxURXcNI2yQymGXHBS4//dugEb39m/ZKQUFoE+w0P3eCtMBpXBGA=
X-Received: by 2002:a65:644b:: with SMTP id s11mr4173241pgv.4.1611915805200;
 Fri, 29 Jan 2021 02:23:25 -0800 (PST)
MIME-Version: 1.0
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
In-Reply-To: <20210129130110.00003bb1@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jan 2021 12:23:08 +0200
Message-ID: <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
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

On Fri, Jan 29, 2021 at 7:01 AM carlis <zhangxuezhi3@gmail.com> wrote:
> On Thu, 28 Jan 2021 16:33:02 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jan 28, 2021 at 2:58 PM Carlis <zhangxuezhi3@gmail.com> wrote:
> >
> > Thanks for your contribution, my comments below.
> >
> > > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> >
> > You probably have to configure your Git to use the same account for
> > author and committer.
>
> hi,you mean like below:
>         Carlis <zhangxuezhi1@yulong.com>
> ?

I meant that you shouldn't probably have a From: line in the commit message.

...

> hi, i have modified it according to your suggestion like below:

Please, go again thru my comments and comments from others and
carefully address all of them everywhere in your contribution. If you
have questions, ask them in reply in the corresponding context.

...

> /**
>  * init_tearing_effect_line() - init tearing effect line

>  *

For example, above was commented on and hasn't been addressed here.

>  * @par: FBTFT parameter object
>  *
>  * Return: 0 on success, < 0 if error occurred.
>  */
> static int init_tearing_effect_line(struct fbtft_par *par)
> {
>         struct device *dev = par->info->device;
>         struct gpio_desc *te;
>         int rc;
>
>         te = gpiod_get_optional(dev, "te", GPIOD_IN);
>         if (IS_ERR(te))
>                 return dev_err_probe(dev, PTR_ERR(te), "Failed to
>         request te GPIO\n");
>

>         if (te) {

This one is not like I suggested.

>                 par->irq_te = gpiod_to_irq(te);
>                 gpiod_put(te);
>

>                 if (par->irq_te) {

This is wrong.

>                         rc = devm_request_irq(dev,
>                                               par->irq_te,
>                 panel_te_handler,
>                                               IRQF_TRIGGER_RISING,
>                 "TE_GPIO", par);

Try to use less LOCs.

>                         if (rc)
>                                 return dev_err_probe(dev, rc, "TE IRQ
>                 request failed.\n");
>
>                         disable_irq_nosync(par->irq_te);
>                         init_completion(&par->panel_te);

>                 } else {
>                         return dev_err_probe(dev, par->irq_te, "gpiod
>                         to TE IRQ failed.\n");
>                 }

Again, it is not what had been suggested.

>         }
>
>         return 0;
> }

The rest is better, but we will see later on when you submit a new
version (And I feel it won't be last).

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56C585A1B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 12:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB67110E2B7;
	Sat, 30 Jul 2022 10:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8860310E2B7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 10:26:13 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p5so8361775edi.12
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 03:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=l0Q/7yx9FyNBDJt9oRASfJ20HzyIqt7jep5RdGQdu90=;
 b=kdqdPdfXhJMF2w1UJLc87Kqy9nPsRpmxfI7UKx53cigvdJ8cyHSe54qVTNrI6YQ0Tn
 40e+x/LcCMjU1pxuJWC+nZ8aRHGqVld5kwZ1Kf0w2Wgur79tXLwBh8rSq7YTbVMzMqbk
 1DVwsy130N3THSReljll0MNEFs1HbZd5Yc7XZhC6J8NFJyPr9KtVAq/ofE+uV3mQFAqm
 YcSjWpwVAZ6pSrKIGOB2GVK7ucXlONSqQZGGXgFnYb6gbJ2qbeujZjYkqMyYIUmYZt9l
 pXeFF3PVa+MNUjpPgdY/w8jcldeydqpOp1/z9Z+4B9V1O/PWa0bQ/CIPZBtROnIJTDNo
 EzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=l0Q/7yx9FyNBDJt9oRASfJ20HzyIqt7jep5RdGQdu90=;
 b=Tekh9VYd+AlVOeP+6m1jSzn+HvMdx2GNYjkAsdxEEp5A4GH1vunBLO4VTlWhwhxxux
 sL3ytSLG6mZf7YehX0+YNt9meNCikZYtuvRBER5GUs0Ts8QxTsi9EYf1tXpIU60k2Grz
 HXGyLs3g4DAsd9E3UksABYe9MIkgF6g9Y/HqPmx6flWJgjaRygsGpxJqZz8gISC0ezaA
 NT73zGmb4DXElkMbJYSajoTC09NIusenuWuq+xjjkWpcPXXaYJWncJDry/0ddVnAn1jA
 6Pe6mVYmxKYd84OcbS45Q46jPCPttnyjLObj/yJQsQuGhZ0AK6BLSqlAz/yaDWkhhjwx
 0oKg==
X-Gm-Message-State: AJIora8iPKnt3fmlFvYp9D5QLlmGyOf8C2px9MpgoSyGtyRds/y/lVMB
 TcJ/sVJMSu0wqpxhg2pXlIRLZ9fF5NGVPEUTUj8=
X-Google-Smtp-Source: AGRyM1uzdkY14o0hN5mVxeuk86vh5sIURGkQFnGzfLTCYvW7dVNz/f6Do420hxAyaoLNy5TcoYGS9EXPlPGIYYkEMTM=
X-Received: by 2002:a05:6402:2714:b0:43c:1c1:717e with SMTP id
 y20-20020a056402271400b0043c01c1717emr7419196edd.67.1659176771666; Sat, 30
 Jul 2022 03:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
 <CAHp75VdaDyyqRw9fAkUOhNjsyifeozVx6JuYXSU1HpoO+VHDNA@mail.gmail.com>
 <3c55e119-5b6f-25ab-99c9-2c99b1dfd9e9@gmail.com>
In-Reply-To: <3c55e119-5b6f-25ab-99c9-2c99b1dfd9e9@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Jul 2022 12:25:34 +0200
Message-ID: <CAHp75Vcu2C-+XyVtLrX8Awxb18uNx6_n3CCCVUyekL4yP755Xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
To: Markuss Broks <markuss.broks@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 30, 2022 at 10:55 AM Markuss Broks <markuss.broks@gmail.com> wrote:
> On 7/29/22 00:19, Andy Shevchenko wrote:
> > On Thu, Jul 28, 2022 at 4:32 PM Markuss Broks <markuss.broks@gmail.com> wrote:

...

> I suppose we could use something like:
>
> if (region_intersects() == REGION_INTERSECTS)

Yes.

...

> >> +       ret = sscanf(device->options, "%u,%u,%u", &info.x, &info.y, &info.depth);
> >> +       if (ret != 3)
> >> +               return -ENODEV;
> >
> > Don't we have some standard template of this, something like XxYxD,
> > where X, Y, and D are respective decimal numbers?
>
> I'm not aware of this.

I believe we won't introduce more chaos in already existing formats of
one or another thing, so I prefer to be stuck with in practice use
(e.g. "1024x768x16" without quotes for x=1024, y=768, depth=16).

-- 
With Best Regards,
Andy Shevchenko

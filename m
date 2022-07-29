Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077A584F3A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 12:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7A810F264;
	Fri, 29 Jul 2022 10:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947F10FA13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 10:48:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v17so5360045edc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3n/U/FQWga428NP8njwRwJq8YQtOFS7dE4r1PAnkS1w=;
 b=NUwJ6Ia5ztlFAPJRSi//yXxSQSxStivnbYzEDrxWCEUcunK9mPPbSDW9UDDz5jYYTf
 5/3Tv/X7zyoHU/COku0GH9BU+wnuhqnwNFhGBh/oBwLrmzhgi2WmL6r/pQigVKDP+2wN
 r2nnp+tCjUus1cege2Vm5IiCUqgIiTt4/grj8tzAwe+OtUD4H+EwBDhK/GPRq3Lq3Riq
 OU7YrReBurHOIdx3AJ1A2MhkIWr3n3xTalz66sqsFBkMks+QVyqGj8zIaTAQPSbuEfQf
 8cevW1Q80DurxbNMHDhAvDW9cs5zdQWNQyPeZtlVDDib66Jn5ZADWJkEZ//9TVlc5tq5
 Kiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3n/U/FQWga428NP8njwRwJq8YQtOFS7dE4r1PAnkS1w=;
 b=j5lKiOAbeUjgDEuaCy2GckRQJ/CbDFAzwoOOHYc3W39pq/cqLaG1fLQ9SQZj+KiQ/t
 SdDQKsAGZDhQINCFwFVpdJrUo1CZ+77MNGlv96AKB0OIQTyHUYzlxkXFxCO6zo8BvvlI
 mPzZ1Lg061WoSkm4nc6e3mgSu++ri/hmSEl6LfGefocPjsP4m9igI+8fQJJxCMsLt1gm
 5dkr/oqkhIuI1DwQ9hbl1o+XsapOr1vfBITcOwePBC/0qqD8HB/TQKelD8MTuH6mReDR
 VKruNzltCaRSSLjAPom8CSlnzCC4joDtQDhBfxNSI0wL0UaRlpGLKX6yYWCjPCHNdkI+
 ofuw==
X-Gm-Message-State: AJIora/4A3L2CbbM9vVo3TqLcaTRNs5JUBPh3ZZeZZ5t4gx3GJXnzukR
 KUDIZGZSTyWAX6K2zysgII/msyKl/tNMO55Dd6Q=
X-Google-Smtp-Source: AGRyM1swfkCmQwapy/e5MLB35AJLdgSMfrw8dhx1rZSpZi2iRMETLlJ8/O9gf/GWaYLbPNQzerUI5dsp0GToPimD/Xw=
X-Received: by 2002:a05:6402:2714:b0:43c:1c1:717e with SMTP id
 y20-20020a056402271400b0043c01c1717emr2983928edd.67.1659091692189; Fri, 29
 Jul 2022 03:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-2-markuss.broks@gmail.com> <YuKfaVG/ZbYtFjS/@kroah.com>
 <CAHp75Vfz8e1j4qZ6XY6WqMR4E9fKFxrTxj7P6KraXzSLk_NhxQ@mail.gmail.com>
 <YuOS5yUfNlTOtI6U@kroah.com>
In-Reply-To: <YuOS5yUfNlTOtI6U@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jul 2022 12:47:35 +0200
Message-ID: <CAHp75VcqtO5E91e5HxM6qN3gcMH5-_h=508chyDiWzvmLiFn6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: serial: earlycon: Pass device-tree node
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 linux-efi <linux-efi@vger.kernel.org>, Markuss Broks <markuss.broks@gmail.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 29, 2022 at 9:57 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Jul 28, 2022 at 11:04:24PM +0200, Andy Shevchenko wrote:
> > On Thu, Jul 28, 2022 at 4:41 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Thu, Jul 28, 2022 at 05:28:18PM +0300, Markuss Broks wrote:

...

> > > > +     unsigned long node;
> > >
> > > That should not be an unsigned long, but rather an 'int'.  Something got
> > > messed up, of_setup_earlycon() should be changed to reflect this before
> > > propagating the error to other places in the kernel.
> >
> > It's a pointer, but what puzzles me, why it can't be declared as a such:
> >
> >  struct device_node *node;
> >
> > ?
>
> It should not be a pointer, trace things backwards, it comes from a call
> to of_setup_earlycon() from early_init_dt_scan_chosen_stdout() which has
> offset declared as an int, and then does:
>         if (of_setup_earlycon(match, offset, options) == 0)
>
> So why would it be a node?

This is a very good question.

> > > And it's not really a "node" but an "offset", right?
> >
> > Seems no.
>
> Really?  What am I missing here?

It's me who is missing something here, thanks for your elaboration!
After it it becomes clear that your first question should be
addressed.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699AC307ED6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E986EA24;
	Thu, 28 Jan 2021 19:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC8D6E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 09:59:12 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id c18so5574598ljd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 01:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7pfzxki9lheHgOLLzQUHgmk1QHH49lwL5Xi6bGveKqI=;
 b=C5iQTW3T8+J3IZWK6A5QNut7MFv+TbeI1f0Zb7Qjo0SxH2FThG4KpFizCyByRiNb7s
 viTeDmowChDcQ8aNRy0KxaHpOKiDumWRod4N7OszB2XwnahAhLDBiP1p4Eh34nW9ck4X
 c6iMTE2SUHtlRzSq+GVvJrsQ8z4Nq40YZxt+Kp2UpvrTqwnXiR166LxKfl+FW9AUTrt+
 JInyKlot+NlBlvaaK5w6QO1+VeOP2O9MDEz8rYLSbCf8hQH4g+z4p9ZJxPMG0wj+EB+V
 AeR5Qn+WmIUDJ0NS/fYzIauFxJ0PXLlubrIEPMNzFhJiJlCugY/kiim2oHuYgpnnxZAv
 V2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7pfzxki9lheHgOLLzQUHgmk1QHH49lwL5Xi6bGveKqI=;
 b=gjdtABwBNNvfd9QYjzTzmp/gIIiEgiIY5scM1wq6HrlIs5uKsBph3w3EVzhPBc8rNk
 znA09S9t8I0w0xa7XJ0wAvyVlGUA0ImY+Krk9wnt7mu1ndYb8PtSl9I8Zbi2ez7Ep07E
 m3R5ZZNe3Kc7SztTBTY3jzeB2ikHV8YeoSmQwxJepu0QqjB+Z5XjGJivGL8M3B+BnTSb
 ICqNAzS18n8thwmU6n43xF1FIHV7qZlumnR3qLpRNy5GnAZ5AEyZc8+rEd8WLA0OSvzH
 6r7Et8j2F+oQrWYNKhlOdyzpuWgUyfWNz2+0Hesam7vEbKX9v7sj1v4/teo7DVAqbdQg
 B+qg==
X-Gm-Message-State: AOAM531J3Iv8HF98RNVrrZGFF+F4Fx/KPpDU1WHEEyoX9tlB4JgHiVI3
 d9Ts3Wb6OD+Kb3zMdXTwk0c=
X-Google-Smtp-Source: ABdhPJyQahjeVdQ9RR/Pj8A7PCSfRelscgLOEjJP1Tv1tX+t766D1pvJb3mrXoIpOblsSeRBhdN7Rg==
X-Received: by 2002:a2e:b8c7:: with SMTP id s7mr7574137ljp.397.1611827951312; 
 Thu, 28 Jan 2021 01:59:11 -0800 (PST)
Received: from kari-VirtualBox ([31.132.12.44])
 by smtp.gmail.com with ESMTPSA id k20sm1814663ljb.73.2021.01.28.01.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 01:59:10 -0800 (PST)
Date: Thu, 28 Jan 2021 11:59:08 +0200
From: Kari Argillander <kari.argillander@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <20210128095908.nm5kh4yspza2v27q@kari-VirtualBox>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127223222.3lavtl3roc4cabso@kari-VirtualBox>
 <20210128094258.000012c3@gmail.com>
 <20210128065233.ji4b7ea54ihyu2l5@kari-VirtualBox>
 <CAMuHMdWK0wbMVJNwSW=pafsyjDVg14h2AX=haJeAkyivehP=JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWK0wbMVJNwSW=pafsyjDVg14h2AX=haJeAkyivehP=JQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 mh12gx2825@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, carlis <zhangxuezhi3@gmail.com>,
 Colin King <colin.king@canonical.com>, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 10:42:54AM +0100, Geert Uytterhoeven wrote:
> Hi Kari,
> 
> On Thu, Jan 28, 2021 at 7:53 AM Kari Argillander
> <kari.argillander@gmail.com> wrote:
> > On Thu, Jan 28, 2021 at 09:42:58AM +0800, carlis wrote:
> > > On Thu, 28 Jan 2021 00:32:22 +0200
> > > Kari Argillander <kari.argillander@gmail.com> wrote:
> > > > > @@ -82,6 +111,33 @@ enum st7789v_command {
> > > > >   */
> > > > >  static int init_display(struct fbtft_par *par)
> > > > >  {
> > > > > + int rc;
> > > > > + struct device *dev = par->info->device;
> > > > > +
> > > > > + par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> > > > > GPIOD_IN);
> > > > > + if (IS_ERR(par->gpio.te)) {
> > > > > +         rc = PTR_ERR(par->gpio.te);
> > > > > +         dev_err(par->info->device, "Failed to request te
> > > > > gpio: %d\n", rc);
> > > > > +         return rc;
> > > > > + }
> > > >
> > > > You request with optinal and you still want to error out? We could
> > > > just continue and not care about that error. User will be happier if
> > > > device still works somehow.
> 
> devm_gpiod_get_index_optional() returns NULL, not an error, if the
> GPIO is not found.  So if IS_ERR() is the right check.
> 
> And checks for -EPROBE_DEFER can be handled automatically
> by using dev_err_probe() instead of dev_err().

Yeah. Thanks for pointing that clearly.

> > > You mean i just delete this dev_err print ?!
> > > like this:
> > >       par->gpio.te = devm_gpiod_get_index_optional(dev, "te",
> > > 0,GPIOD_IN);
> > >         if (IS_ERR(par->gpio.te))
> > >               return PTR_ERR(par->gpio.te);
> >
> > Not exactly. I'm suggesting something like this.
> >
> > if (IS_ERR(par->gpio.te) == -EPROBE_DEFER) {
> >         return -EPROBE_DEFER;
> >
> > if (IS_ERR(par->gpio.te))
> >         par-gpio.te = NULL;
> >
> > This like beginning of your patch series but the difference is that if
> > EPROBE_DEFER then we will try again later. Any other error and we will
> > just ignore TE gpio. But this is up to you what you want to do. To me
> > this just seems place where this kind of logic can work.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

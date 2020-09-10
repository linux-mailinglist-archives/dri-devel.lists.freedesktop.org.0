Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A82263BD9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 06:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010FA89CA8;
	Thu, 10 Sep 2020 04:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BB589CA8;
 Thu, 10 Sep 2020 04:23:42 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id 195so3220678ybl.9;
 Wed, 09 Sep 2020 21:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/eMi6Tr0LlsDBlM6QiOu6xP2+hAoSjCKsAUIpkGtlPA=;
 b=XFEKLFgxSjtgby5dZNg9BUlFoRVUhE+9I9O2rx/YpQivcHJ8V+rXoPjVL4RBnXHBiX
 Pn0sJZjHH1QU7avB24ZbL4K8+ZiEpyWvFs6+niw1f1mg1EVF/CtRtMS/2N2XPskz5ZMt
 6hA08B2Lmvi1eV/sBGcBQF8nvB+rVC9zYUaarzaqqT0XUIzE/pao4IS0AsdGySOWndS+
 C1cV0IbAJEQha+ggd5oifWIOTHjLuNFzvKRIJHobi8Ck9jPSXK5L4OXZSHXo70Nw27gR
 IC7Xt+O6SbrgwtfKt5FJEFIp4I4p8SF1UG0E02x+iSt+6plzvCaBfvfbJerHUI/anc8b
 LuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/eMi6Tr0LlsDBlM6QiOu6xP2+hAoSjCKsAUIpkGtlPA=;
 b=kCE82mT3b1uHvGtTccEkVevZe53CVLpi1gzPpZoqK+t6ijPcIzTM1chtQzdXeRvPfk
 3ByckGZlfd6DIICgBMBBBmQkJkotdZhBqhe26s/8lD2d71Pfpj5qqDKWRCsidyoXSnsL
 EI2c0sQTfqJd63VHKqEMg4Ym31jZ8O6Da5yKUmGznSTguc55dVcrmPsMHoYCKZxaIx7Y
 MuO+xnrUk2JUfH0EPSq+uFExdkOSfmlRwNT/dVysKOmeP7BaeK/3ofRjQBOQa3WkI9s6
 nUi2hIIagu78G5pCr62qI5p8KlygxRFKzsWZ3aGKf9mvIQKWTyCrOJirtw2LYxyRcIAK
 6q2Q==
X-Gm-Message-State: AOAM532g7402ex+BhQS0VPcf4zKKxFLYKkS3mbEc3k3yT4IgQUY8Rck2
 DZD977I/zguYly0ZCH4/dLQ0/odJxrcHi+N5K/U=
X-Google-Smtp-Source: ABdhPJx2TXiTER+LYCqBPMv17tIEsx6ZuvO/+P6A+Nn9JA+Vm/7lsXf2boUmHrOKzudz1ZjRrBaAFWjASSSY2IuUUq0=
X-Received: by 2002:a25:c07:: with SMTP id 7mr9862909ybm.200.1599711821234;
 Wed, 09 Sep 2020 21:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200812204952.1921587-1-jcline@redhat.com>
 <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
 <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
 <20200909140706.GA27322@dev.jcline.org>
In-Reply-To: <20200909140706.GA27322@dev.jcline.org>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 10 Sep 2020 14:23:30 +1000
Message-ID: <CACAvsv5Pr_=ns89XqY2JbLNo8vPHdv6CJW3LJpFb4c+HAjiK8Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
To: Jeremy Cline <jcline@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Sep 2020 at 00:07, Jeremy Cline <jcline@redhat.com> wrote:
>
> On Wed, Sep 09, 2020 at 10:22:14AM +0200, Karol Herbst wrote:
> > On Wed, Sep 9, 2020 at 6:06 AM Ben Skeggs <skeggsb@gmail.com> wrote:
> > >
> > > On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline@redhat.com> wrote:
> > > >
> > > > Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> > > > new gp1xx temperature sensor") added support for reading finer-grain
> > > > temperatures, but continued to report temperatures in 1 degree Celsius
> > > > increments via nvkm_therm_temp_get().
> > > >
> > > > Rather than altering nvkm_therm_temp_get() to report finer-grain
> > > > temperatures, which would be inconvenient for other users of the
> > > > function, a second interface has been added to line up with hwmon's
> > > > native unit of temperature.
> > > Hey Jeremy,
> > >
> > > Sorry this slipped past me until now.  I'm OK with adding support for
> > > millidegree temperature reporting, but don't think we need to keep
> > > both interfaces around and would rather see the existing code
> > > converted to return millidegrees (even on GPUs that don't support it)
> > > instead of degrees.
> > >
> > > Thanks!
> > > Ben.
> > >
> >
> > just a note as I was trying something like that in the past: we have a
> > lot of code which fetches the temperature and there are a lot of
> > places where we would then do a divide by 1000, so having a wrapper
> > function at least makes sense. If we want to keep the func pointers?
> > well.. I guess the increased CPU overhead wouldn't be as bad if all
> > sub classes do this static * 1000 as well either. I just think we
> > should have both interfaces in subdev/therm.h so we can just keep most
> > of the current code as is.
> >
>
> Indeed. My initial plan was to change the meaning of temp_get() and
> adjust all the users, but there's around a dozen of them and based on my
> understanding of the users none of them cared much about such accuracy.
>
> However, I do find having one way to do things appealing, so if there's
> a strong preference for it, I'm happy to produce a somewhat more
> invasive patch where all users expect millidegrees.
Yeah, I do have a strong preference for not having to keep multiple
interfaces around unnecessarily.  It'd be somewhat different if we had
external interactions, but this is all stuff within the module and we
should be able to make these kinds of changes without too much pain.

Ben.

>
> - Jeremy
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

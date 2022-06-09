Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2984544AF3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 13:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC56111B61E;
	Thu,  9 Jun 2022 11:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1402C11B61C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 11:49:20 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id c62so22346052vsc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 04:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdU0zAS+FTF3/ZBem3uzvLLvOiA3QTmzxE3JNi8zcLE=;
 b=S/MKk04ok5tYhEUtpzd6mCuc/uGSA6jgHjecOvv7igu+vGNuwj7FbkmMuAiCYPRizz
 kkpXfYaJbVGGd0VBssgCe7vyo6tXsANlVfkHC+6YCB+ua2gSZ0qS5nXdTr0qFRzRCLKt
 6OrbpKm3zvUj9dqKhbhToZNCMB/5XYtOb8H4EOXG66CIVUvl3z5JH+9yEj8Zw4hEdbsQ
 L3ziilgi4HxvPB0mOEmjrlpsh3cC+T8yyLVaA8QWEpke6TsziJNYqr4i1nOWyafW+Gg/
 Prm2f4cDU233LtC6loVr/vLaRcPrFC8iSRBPLWRW9NG6T40E9tDIwDZWX82ViDnFAKVQ
 HX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdU0zAS+FTF3/ZBem3uzvLLvOiA3QTmzxE3JNi8zcLE=;
 b=Yfg2f37TJAdwGGrAnXUb3esr1r/oc80yM5iwEvN/Anl9guprIx6S6501XgH10e5vTA
 jbuBjsTvCWc+Q5f6UcBTU4nbU3IDup7purl1u6swX2M9mS1AgRWp1na1dWSCZ+r+Joxo
 2+BanI8ejbQMA1r8wtlc5BCLvkEvJZwD2/EXKyGjuvSbEjc80j99835XKvxWo+7QjGzj
 kbpf0VzwsB7Mq8eoh2UjCWp1qU2JaZNzqSED+a18ATLj+V0FFsekzgvnbvzbs3SngBLw
 v0PppMva9ONqgaQbiT2JtTQtAiMs+N1SVl/2IQfDIsBTy4YRWRiBpsOPaYqhA1fSHuj6
 M46g==
X-Gm-Message-State: AOAM530HJ0RzWuZ3WbFMPTA9NyHld5gq7JyjKweNJOgm8ONsDIzZguVK
 1046pvw+3HUqw0jF1MpjNf1TLhsPjgoH4CvKQgk=
X-Google-Smtp-Source: ABdhPJxyERkl68EmBtmzdS9gMk693da7X47QOEQDoMwowc561rqQfpX2tFyaGxT2lKWS8ceqLtVOI1ld0ZBGej1GVTE=
X-Received: by 2002:a05:6102:3f0a:b0:337:cc82:83cf with SMTP id
 k10-20020a0561023f0a00b00337cc8283cfmr17429418vsv.86.1654775359153; Thu, 09
 Jun 2022 04:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <CALeDE9OyJtvRGnN80JNW3AwwgAa_h_bs8GTLJzo06WK-o+_7Ng@mail.gmail.com>
 <20220608153608.ntgyokt67f3m7pn6@houat>
 <20220609092351.t2muybqjnqaqzemz@houat>
In-Reply-To: <20220609092351.t2muybqjnqaqzemz@houat>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 9 Jun 2022 12:49:08 +0100
Message-ID: <CALeDE9NTySQ+OCBYzHGfm023=F12fzUxt+DjLK0cYwf+iRui3A@mail.gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: stefan.wahren@i2se.com, Peter Mattern <pmattern@arcor.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > > > > As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
> > > > > > 3B any more.
> > > > > >
> > > > > > If a monitor is attached to the device, the boot messages show up as
> > > > > > usual, but right when KMS starts, the screen turns black. Similarly, the
> > > > > > screen also turns black when the module is blacklisted at boot time and
> > > > > > loaded from the running system.
> > > > > > The problem looks quite similar to the one posted some months ago in [1].
> > > >
> > > > If I understand you properly, it results in a blank screen if the
> > > > monitor is connected, but the system is still responsive?
> > >
> > > Yes, it boots fine, I see all serial console output and the module
> > > loads etc, without a screen I didn't notice the issue
> > >
> > > > If so, it's a very different problem than the link you provided, since
> > > > it was occurring when no monitor was connected and resulted in a total
> > > > system hang.
> > > >
> > > > > > Unfortunately, looking through systemd's journal didn't seem to yield
> > > > > > any real hint. Nevertheless, the results from grepping vc4 are
> > > > >
> > > > > I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
> > > > > can confirm the regression. Maxime would know what might be up here?
> > > >
> > > > I tested on 5.18 on my 3B and it works well. Could you paste your kernel
> > > > configuration and config.txt somewhere?
> > >
> > > It boots with output on 5.17.13, and not on 5.18.
> >
> > Interestingly, it works for 5.18 in my case but doesn't for the current
> > drm-misc-next branch with similar symptoms.
> >
> > I'll look into that one and see if the two might be related.
>
> Actually, it was because drm-misc-next was missing 88110a9f6209, and
> thus the DRM driver wouldn't load.
>
> Once that patch is applied, 5.18 and all -rc work fine on my side.

So that patch looks like it's already in 5.18.x:
$ git tag --contains 88110a9f6209
v5.18
v5.18.1
v5.18.2
v5.18.3
v5.19-rc1


> Could you start a bisection maybe?
>
> Maxime

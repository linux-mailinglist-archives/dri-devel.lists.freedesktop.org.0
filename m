Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E22941D2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 20:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDECD6ECF4;
	Tue, 20 Oct 2020 18:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DB56ECF4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 18:03:18 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id r24so1637794vsp.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 11:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PVMR6/2W2M93nyrvG0Punquw4h+yM4TJJj8Y5Jdeb4Y=;
 b=a37diehwpmo8fHh9VS2sHg3iovnvSpFO01qbeeTjvPAK/pzn4xhplQ0fYDrCJoQvL5
 jwxj0LcELcq7Ta0+yOHuJBZONlnG88Y4MxXhMAygDGRhWtNLH10cEAQ5nA7bqa+Q7tOf
 EGMfKBEiHtpzLZyLu99RqajdDbyy0NjR7zgIuTGbFm5Ve44i/hfBCA4Zl1e/LI5Kgsvj
 stUDTWe0T+hJnqldXt0Ot/PY+9FsrJsyKs0caYPrNDlI2TyhOHdbocGi0cvoAB0EerWk
 Tar7HxY7EjtE+89UB02KHyVVy5CcmzomBSnmuv+ZwuNIr+Qtq/gBUABN9YdMfvutNaTc
 /r6g==
X-Gm-Message-State: AOAM531n/rxJcvq6jHPU15aSdCR4KYT75/1oX3f8mB/GVot8xKwO3Pot
 sqkkifF4gubP6A4vdCOI0XpSsRosB+uEsOl83qnVDO3t
X-Google-Smtp-Source: ABdhPJxiASiVCVp5bpo4MgS7yN5n7bCC4Ilhg+NpKpEX7LH5fIEpJhx6PIpPb8f5uhHYxUQx2cVg95pZNPEV9NUmo7M=
X-Received: by 2002:a67:e9d4:: with SMTP id q20mr2963278vso.46.1603216998083; 
 Tue, 20 Oct 2020 11:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
 <20201018210412.GA515543@ravnborg.org>
 <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
 <CADnq5_P8K16nf7WSOVZQZ3nMOmACz=tpsW-Ep+CEh+t0JLEtNA@mail.gmail.com>
In-Reply-To: <CADnq5_P8K16nf7WSOVZQZ3nMOmACz=tpsW-Ep+CEh+t0JLEtNA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 20 Oct 2020 14:03:06 -0400
Message-ID: <CAKb7Uvj+HAk1OnVwTOe4VEJXPDt4vBPRodwzPYE4BBZqe4MHjg@mail.gmail.com>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Kevin Brace <kevinbrace@gmx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 1:17 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Oct 19, 2020 at 3:43 PM Kevin Brace <kevinbrace@gmx.com> wrote:
> >
> > Hi Sam,
> >
> > Thanks for asking the question.
> > The current OpenChrome DRM code has these two major issues.
> >
> > 1) It does not support atomic modesetting
> >
> > I do internally have working code to support atomic modesetting, but it is not ready for committing into the upstream OpenChrome DRM repository.
> > In particular, it suffers from a freeze relating to a cursor plane.
> > The freeze is a bad kind that kern.log does not really tell me what is wrong.
> > If I disable hardware cursor, the atomic modesetting based OpenChrome DRM appears to work okay.
> > In other words, I am getting close to getting atomic modesetting working, but I am stuck.
> >
> >
> > 2) Double allocation of visible portion of frame buffer
> >
> > This is a big problem left behind from the previous developer who developed OpenChrome prior to me.
> > For some reason, the developer wanted to allocate visible portion of the frame buffer to be the maximum possible size supported by the detected monitor when initializing the frame buffer inside OpenChrome DRM code.
> > I believe Radeon DRM does something similar to that.
> > The problem is, OpenChrome DDX allocates an equal sized frame buffer visible portion during the DDX's initialization.
> > This means that we got two same sized visible portions allocated, but OpenChrome DDX and OpenChrome DRM combined should really be allocating only one.
> > At this point, OpenChrome is not supporting double buffering.
> > This double allocation of a visible portion of the frame buffer contributes to a X Server crash when the screen is resized and 16 MB or less (i.e., 8 MB) shared frame buffer is reserved by the system via BIOS setup.
> > I personally think letting OpenChrome DRM allocate the visible portion of the frame buffer is the way to go, but if so, how do I get the DDX or shadow FB to access the frame buffer visible portion allocated by OpenChrome DRM?
> > Any suggestions on what to do about this issue will be greatly appreciated.
>
> All drivers do this.  You have one buffer for the fbdev console and
> then userspace allocates buffers it needs in addition, otherwise,
> you'd overwrite your console.  You can disable it by not enabling the
> fbdev emulation if you don't want a console.

I don't think disabling fbdev emulation is a practical thing to do for
standard PCs.

Not sure what the capabilities of the underlying hardware are, but on
nouveau, we use 16bpp/8bpp framebuffers by default (for fbdev) on
boards with limited VRAM (64/32/16 MB, I don't remember precisely).
You'd have to add C8 drm format support for this, but assuming you
have that, the core supports it OK.

Ideally you'd have logic which is able to manage buffers and move them
between GPU-accessible and GPU-inaccessible memory (e.g. TTM, or
perhaps some evolution of it, I'm not up on all the latest).

Cheers,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

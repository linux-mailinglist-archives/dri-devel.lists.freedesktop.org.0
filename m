Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4D417DEF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 00:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABBD6EE91;
	Fri, 24 Sep 2021 22:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE776EE91
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 22:50:29 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s24so13980285oij.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 15:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFDW7lncbxlfdS6O3az8pUVpsIvToFPs2S/93aYbsYE=;
 b=DCHhPp3O1tvVWh5nQ86u4yOWXvOhsgEuz0xHF/9ViKXs553UsDP90Ve/x006NTFn1S
 HD4C3h9oDySg896+tpvl3c3i9tnCoG3h5N/PMUJK7HpwroAMguPmrA9Y2+tYq3qJgip9
 thb4YclQrm1Cdq+NVM8Zr2lX+oCfYKj9W7Srs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFDW7lncbxlfdS6O3az8pUVpsIvToFPs2S/93aYbsYE=;
 b=St+HFF7a99fpOCYkhbTQo4CB0ztWputita2isgKgvKrlAxcmiRLc7s25HcFIJ1KLwJ
 WBlosFwlQZYanEzN7h3W5mJZSJANpB1rw+dNgwxu9fIFDlT7Fj0hRA5FBaF0QPGTVBPA
 7h9CF3qicQjvgHm6mfisqpd0Rx3UL3cRaYOQZZc+jrmQoVuUc6EFFgVm+5VZGL6elJdi
 H4TmMN9D9/iUsgcO8/LAgrFjkus+8ZKrANZsdSueHo6YbrehrNAmkTT28ivAGoSKkBR5
 OyHsoGpaHt96+4VdklJGayebrKlYut25XVfEs4CmSPh45A5l9/DO6mJiPdZbdx1Esc69
 0NMw==
X-Gm-Message-State: AOAM531YtZkA3zG6i4/99DBrDMdJQigKiqsC+Y+EoAUOzARS2XYAyyFt
 R8ThGers/SGFHZgbeC5+LQmhJLdpGLGCJKR7Wya0pA==
X-Google-Smtp-Source: ABdhPJwhNF96FPqLktf2AeTdHBfKB4aoz398F+kZSpY/G9t8bSrit9cTUBqsQk6btKhlTkjxJumwvEhMKpCgNF3WI5Y=
X-Received: by 2002:aca:ebd5:: with SMTP id j204mr3429389oih.14.1632523829045; 
 Fri, 24 Sep 2021 15:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
 <20210920171042.oq3ndp3ox4xv5odh@gilmour>
 <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
 <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
 <20210924133022.waqgtr5xjjxigong@gilmour>
In-Reply-To: <20210924133022.waqgtr5xjjxigong@gilmour>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 25 Sep 2021 00:50:17 +0200
Message-ID: <CAKMK7uFxO-ss86k483VJQJiHwcAYxNwD06xSEZStn+fWiRJ6iw@mail.gmail.com>
Subject: Re: Regression with mainline kernel on rpi4
To: Maxime Ripard <maxime@cerno.tech>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 24, 2021 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Wed, Sep 22, 2021 at 01:25:21PM -0700, Linus Torvalds wrote:
> > On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
> > <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > I added some debugs to print the addresses, and I am getting:
> > > [   38.813809] sudip crtc 0000000000000000
> > >
> > > This is from struct drm_crtc *crtc = connector->state->crtc;
> >
> > Yeah, that was my personal suspicion, because while the line number
> > implied "crtc->state" being NULL, the drm data structure documentation
> > and other drivers both imply that "crtc" was the more likely one.
> >
> > I suspect a simple
> >
> >         if (!crtc)
> >                 return;
> >
> > in vc4_hdmi_set_n_cts() is at least part of the fix for this all, but
> > I didn't check if there is possibly something else that needs to be
> > done too.
>
> Thanks for the decode_stacktrace.sh and the follow-up
>
> Yeah, it looks like we have several things wrong here:
>
>   * we only check that connector->state is set, and not
>     connector->state->crtc indeed.
>
>   * We also check only in startup(), so at open() and not later on when
>     the sound streaming actually start. This has been there for a while,
>     so I guess it's never really been causing a practical issue before.

You also have no locking, plus looking at ->state objects outside of
atomic commit machinery makes no sense because you're not actually in
sync with the hw state. Relevant bits need to be copied over at commit
time, protected by some spinlock (and that spinlock also needs to be
held over whatever other stuff you're setting to make sure we don't
get a funny out-of-sync state anywhere).

Liberally sprinkling a few NULL checks here doesn't fix much at all,
it only papers over design bugs in the code.
-Daniel


> I'm still not entirely sure how we can end up in that situation though.
> The only case I could think of is that:
>
>   * The firmware enables the HDMI controller, then boots Linux
>
>   * The driver starts, registers its audio card. connector->state is
>     NULL then, and if the HDMI monitor is actually an HDMI monitor (vs a
>     DVI monitor), the VC4_HDMI_RAM_PACKET_ENABLE bit that we test in
>     startup will be set.
>
>   * The driver will create the connector->state (through a call to
>     drm_mode_config_reset in vc4_kms_load), connector->state isn't NULL
>     anymore, VC4_HDMI_RAM_PACKET_ENABLE is still set.
>
>   * The driver then disables the HDMI controller (in
>     vc4_crtc_disable_at_boot) but never clears the
>     VC4_HDMI_RAM_PACKET_ENABLE bit.
>
>   * Pulseaudio opens the audio device, startup succeeds because both
>     conditions we test succeed.
>
>   * However, since we either never enabled the HDMI connector (or if it
>     was disabled at some point), connector->state->crtc is NULL and we
>     get our NULL pointer dereference.
>
>     The Ubuntu configuration has the framebuffer emulation and the
>     framebuffer console enabled, so it's likely to be enabled and
>     something (X.org?) comes along and disables the connector right when
>     pulseaudio calls prepare().
>
> Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

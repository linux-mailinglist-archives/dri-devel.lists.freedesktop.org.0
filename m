Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F44E1A17DE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 00:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C876E91D;
	Tue,  7 Apr 2020 22:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9326E91D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 22:17:28 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id k18so2985188oib.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=moZY/2qyr7xxvtSD5SUOTfeHKg4xLY4AZMPUAG2JeQw=;
 b=ncZ6CcDC6ptEOUXh1UI6VvUTv6om3OM2S6aWW8wJWDFpF7GaHxLQ6GIr9MMKG1La6b
 BBPD25v/T1gfEfxpIlAeVVFel0RoXSanbs7fod/lTdYqYh4HyWoFJeuhzyXZsf1+R4ay
 dfXpvqlc6DAfKNQ8TkGzuk+Dqu46xgxpEGuqlsg4nhDsD/VPakC+4C0fFGEZx2EebXyp
 qffnatuXROeMjHrm+OK9y5+p91KHKo/D7aAdWHHxGUCrLz0ej0ducKCO3u2saVYJLEVn
 5CGnwZgTucQa8tkgaj0whygO0N27e4NwLvWH0/8YF9rWBf4q2EDjfK/2BQXNTd1fI9Jo
 IbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=moZY/2qyr7xxvtSD5SUOTfeHKg4xLY4AZMPUAG2JeQw=;
 b=JRKnTeZUuVAW+zyin42YW0VhbMLdZEz+/MrSGPnvz26E9+fpPZG9cNKn4EiyhimrIB
 wvDr1XQMmJ5RP3s51saEyxlu4GRivhGTnRh3xLGNZXsKRff4ktVSygmRQDOShOFFbG/U
 sJuyi5sFyD2rreWeac7H/QUS+EPc+cjLeYFzOaG48sPymEQ1DfpXOteYDN/itxAsCjLN
 P1uZ8C+ecccz6CDWS6qbrJFzu5hS6ZZre52pfg5gYwNjs40Bcy3YqBzUW+UbQELAnlMb
 dwK4mhSZYZPC7xWNDOjRQOwtVWAA3svpwBjrA4/wDPRQYgI1eaB2qVQlBrpWWXkGAsLq
 oh7g==
X-Gm-Message-State: AGi0PuZMHEtuqrTVZWPAQSiLIW3l5OMGdPTYTLebiy+z0sOhYjhZK85P
 oOecftjrD6ZFYXT/ZcsK8lz4xzj04+B9EhX4K7ay3w==
X-Google-Smtp-Source: APiQypKp8Cfic2CNc5ZUXg++4rXgGcd98JS8koBd95GhNrQuaWSh4KkqFSgZHGaQmv5CUkGjDQg7sT/ah5hIh2Zviyc=
X-Received: by 2002:aca:5c44:: with SMTP id q65mr266770oib.139.1586297847755; 
 Tue, 07 Apr 2020 15:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
 <20200405112131.1b2c5fc0@ferris.localdomain>
 <CAN=K5G9kfQyDWJ1A+UXFtkNnZs3rryTRj2m-JaVAemJRD4CK+Q@mail.gmail.com>
 <20200407112317.0d531278@eldfell.localdomain>
 <CAPj87rPEGkrjRfWpjpU+6ttov2JtPMBROZS5so1CcGrbMHwYJg@mail.gmail.com>
In-Reply-To: <CAPj87rPEGkrjRfWpjpU+6ttov2JtPMBROZS5so1CcGrbMHwYJg@mail.gmail.com>
From: Erik Jensen <rkjnsn@google.com>
Date: Tue, 7 Apr 2020 15:17:16 -0700
Message-ID: <CAN=K5G91Fo5b+GMSGgYCC5-n1eFqabLXc74r1PFwBCF=3dAomw@mail.gmail.com>
Subject: Re: Curtaining API / Force blanking displays
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, all for the thorough answers, even if they weren't necessarily
the answers I was hoping for. It sounds like a "system compositor"
would definitely be the right place for a remote desktop solution,
with the unfortunate caveat of not currently existing. :) (At least,
the most recent mention I can find of folks working on the concept is
from 2013.)

I'll probably make a post to wayland-devel to gather thoughts about
how to best proceed. With the current trend toward assuming at most
one graphical session for each user, the current approach of spinning
up a separate Xvfb instance is becoming more broken more often, so
hopefully there's a solution to be found somewhere in the stack.

On Tue, Apr 7, 2020 at 1:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > With uinput, you will be having fun issues trying to guess what
> > > keymaps the display server and apps might be using, since you need
> > > to know that to be able to manufacture the right evdev keycodes
> > > that will be translated into the keysyms you actually wanted.
> > > Keymaps can change dynamically, too.
> >
> > This isn't a concern to us, as we plan to transmit keycodes and leave
> > the keyboard mapping to the remote machine.
>
> Why would that not have exactly the problem I mentioned?
>
> Do you expect your users to figure out what keymap is in effect in the
> server, and manually configure the same in your remote client, then hope
> it doesn't change?
>
> Keymaps can be user customised as well, so maybe your client does not
> even have a matching one.
>
> Or maybe you require users to reconfigure their desktop keymap to match
> the remote viewer?

The model used by Chrome Remote Desktop is to operate as if the local
keyboard were connected to the remote machine directly. I.e., the user
manages the keyboard layout on the remote machine while connected, and
the local layout is ignored. Our most common use case on Linux is a
user connecting remotely to their own workstation, and this seems to
work fairly well, and runs into fewer cross-platform issues than
trying to guess what the user means.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

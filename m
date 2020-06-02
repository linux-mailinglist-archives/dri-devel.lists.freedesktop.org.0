Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F531EC2C4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 21:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D23D89970;
	Tue,  2 Jun 2020 19:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB4D89970
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 19:31:50 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s1so14059827ljo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQbEYa0oW0Il8mjfCzR4SoEfB7EUDs8d+32KPqK0uG4=;
 b=VG2CJ5t+FQePnvjuONDwr6Dql0NvazBNVRqadOsYgGBHsWUl15Ct8FtXwYihJnDz4P
 roesHC2nlZ1W+rf0yu/PrUqwzwy9amDLGR8maWs7F7LOLxt51R6tgnYvEXzcAPzEY5/C
 A3syAi0TEP9TFKGEiO5g+0hlkjSzNyG6QQG+3cF+LfRsQdyWyzrXblFKTUdRm84VvTRM
 90fejGTEfsQCFOcBHCCd2S/eQs0TKYCv7mMunvHHl4cPh9vJDYMGI2Qj6UNQZhNYyl4A
 6YKeBUUuielCOD2+N2SFexpH6ft4bMjwWpo58iuHfwApd6/fnY69lPErh6E1cNhXyw4o
 9R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQbEYa0oW0Il8mjfCzR4SoEfB7EUDs8d+32KPqK0uG4=;
 b=KpAc0u70pxNhvrK48KRkYcOrsyJDl9sJ1czhWTUBmyE3uKxuWDLXOxg8ZYCcS8wCHL
 zubjaWe+kyVVMaIKxzdB3zy/15HQxNJO2oEOAaWeVoYfSryWDxCMRfqqr7YnRHO6D99X
 LWLsfC6QeXBZB50uff1XwJYdMlEO6gP8nIfWJaGKyVkBvXoIyaBC2dPLCk5kO+C8tqBb
 tu64EkQMVFmw5DOA4zTaqXyktbvKbcCg206mXmLJzJ68dP+/cJiR/SpkzDp6CQnOjeVd
 zMx9oBlLJ3MopDrBsWWtTjcf/AbYOayDIvobpUyVe8OYJ5xUoqNiQ3ADbd1Ffx21QOWG
 Jq6A==
X-Gm-Message-State: AOAM532LRZQ52ktQjeCzFHDBl9bhJSZwIErpAJLoDRXqAeMJyzrgPP06
 xL+Rwa1/g22OzSHvwnLF9a5uM9OLTkm9jrHmHQI1fQ==
X-Google-Smtp-Source: ABdhPJxA2pW7yh8mSs3AzE0QrgE8KUJRrdHsiJaMgBJ2xDsVXK8ITtIHOEPS1WjP3x7YzPtQAVEFE55uqBSjObbn8hU=
X-Received: by 2002:a2e:9147:: with SMTP id q7mr326807ljg.430.1591126308681;
 Tue, 02 Jun 2020 12:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <d2c1850e38e14f3def4c0307240e6826e296c14b.1590594512.git-series.maxime@cerno.tech>
 <CADaigPU7c=1u47R9GzvGCH_Z2fywY1foGYEy=KbBikjUQpwUFg@mail.gmail.com>
 <20200602141228.7zbkob7bw3owajsq@gilmour>
 <CAPY8ntDZWJeu14mL5a0jqUWHFOEWm2OOBBkh4yjjP0oLU83UCQ@mail.gmail.com>
In-Reply-To: <CAPY8ntDZWJeu14mL5a0jqUWHFOEWm2OOBBkh4yjjP0oLU83UCQ@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 2 Jun 2020 12:31:37 -0700
Message-ID: <CADaigPUHPhdrt9JkTfaw0iT7Z8z3Si-v2VJ-s+dhnFQaDNkAaA@mail.gmail.com>
Subject: Re: [PATCH v3 032/105] drm/vc4: crtc: Enable and disable the PV in
 atomic_enable / disable
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 8:02 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Maxime and Eric
>
> On Tue, 2 Jun 2020 at 15:12, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Eric
> >
> > On Wed, May 27, 2020 at 09:54:44AM -0700, Eric Anholt wrote:
> > > On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > The VIDEN bit in the pixelvalve currently being used to enable or disable
> > > > the pixelvalve seems to not be enough in some situations, which whill end
> > > > up with the pixelvalve stalling.
> > > >
> > > > In such a case, even re-enabling VIDEN doesn't bring it back and we need to
> > > > clear the FIFO. This can only be done if the pixelvalve is disabled though.
> > > >
> > > > In order to overcome this, we can configure the pixelvalve during
> > > > mode_set_no_fb, but only enable it in atomic_enable and flush the FIFO
> > > > there, and in atomic_disable disable the pixelvalve again.
> > >
> > > What displays has this been tested with?  Getting this sequencing
> > > right is so painful, and things like DSI are tricky to get to light
> > > up.
> >
> > That FIFO is between the HVS and the HDMI PVs, so this was obviously
> > tested against that. Dave also tested the DSI output IIRC, so we should
> > be covered here.
>
> DSI wasn't working on the first patch set that Maxime sent - I haven't
> tested this one as yet but will do so.
> DPI was working early on to both an Adafruit 800x480 DPI panel, and
> via a VGA666 as VGA.
> HDMI is obviously working.
> VEC is being ignored now. The clock structure is more restricted than
> earlier chips, so to get the required clocks for the VEC without using
> fractional divides it compromises the clock that other parts of the
> system can run at (IIRC including the ARM). That's why the VEC has to
> be explicitly enabled for the firmware to enable it as the only
> output. It's annoying, but that's just a restriction of the chip.

I'm more concerned with "make sure we don't regress pre-pi4 with this
series" than "pi4 displays all work from the beginning"
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

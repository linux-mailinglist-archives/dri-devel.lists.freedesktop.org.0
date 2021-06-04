Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1A39B965
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2FE6E575;
	Fri,  4 Jun 2021 13:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB8C6EA71
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 13:03:22 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id p20so11435844ljj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZBoXHXlgUsuLAEckHBS0L48gubREP9VZ3onJ5kB1vB4=;
 b=gM7CTqo8OaGtZE1nYdHLb7e2i3N7jW52LV8SVoowu/2uSz7/U5PUrUq9XyWpUY5htZ
 z4MG4fEO4/cZY2UOLCRMFh/doNOdULsHW6lV3oz3HYUYPq1zOmkiI2Nb40//P6myypWB
 vNoTYWsgb4pGV2Q/AdPcyQdftglZaILNSdpFFxbdFBZRPVwym3S0sdOulUhAbNPBlIVM
 m8HfTBtTACDT+BHTRzvzhf1z/uxMHWP5hHpqJWPKhV1WdzNomrv1qgq8P76jw8iILWDQ
 T7SFkzIGCtk3NES9Yn3+m/gL1BowrX9gd3xbNE47TPKDF3NQ7Ai169F0jMnB67lZ5MO7
 gdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZBoXHXlgUsuLAEckHBS0L48gubREP9VZ3onJ5kB1vB4=;
 b=rxmeUTUS2YkG646EV/ta7rmqod8GPrLGAMU4QCgJQ2OxsqmQxB8R0Or9xRE3YjEjhd
 sn33wXZU5BSCrQkfhqjx0YjLJyu+TXSxwIsLNtxStJS760AN2MO0YvIn7hOeY4t8w4lC
 V6CjBC9V2RZEmW8vGxxJ3+6crS80x971WIMPMMZNm3oEB3xppBbNVtRTZFsInRPi+yRs
 0bNkGl2WxFtqGw735OUZsvjdHLIwy7ynAwg4iZFPivt4em8PRyTtPEBc9B9EYDYUrwYn
 S6ywe4PJl5LQ66HWm4Gf6C596N9KIklB0npitv3WcHF3UAgq42kH192c5kdcS7TznfQD
 jbLw==
X-Gm-Message-State: AOAM531kNyF23ioP9+XLKQU/txJXWCIa4RvFiz30g5j7ATMDiuV/Q2fN
 hobhWAM4huQUT3ZnLsi+uCIsWmlApaEQ7EiwlZE0Iw==
X-Google-Smtp-Source: ABdhPJydDrZaxizEYRElh40CcGeQ+zo5lpzn5pUrB4oNjTon44D3Dbs99hirdh/8q/w+xhKKUM5pguaI39rwH/DFhEY=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr3404073lji.326.1622811801312; 
 Fri, 04 Jun 2021 06:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210604014055.4060521-1-keescook@chromium.org>
 <CACRpkdZEQ+C7tSppcJ83Go70CaBLe4XYKBqYqJfZWAYq-H2+wA@mail.gmail.com>
 <YLnvIYKduzv56YAA@phenom.ffwll.local>
In-Reply-To: <YLnvIYKduzv56YAA@phenom.ffwll.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 15:03:09 +0200
Message-ID: <CACRpkda=5h+NE1xus-ZgT_F2KgUEDPNbhZ4yQd4MyuZ1p+=PDw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
To: Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
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

On Fri, Jun 4, 2021 at 11:15 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Jun 04, 2021 at 09:44:59AM +0200, Linus Walleij wrote:
> > On Fri, Jun 4, 2021 at 3:41 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > > VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
> > > pl111 is modular. Update the Kconfig to reflect the need.
> > >
> > > Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
> >
> > Yeah that doesn't work, thanks for fixing this!
> >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > > -       depends on VEXPRESS_CONFIG
> > > +       depends on ARM || ARM64 || COMPILE_TEST
> > > +       depends on VEXPRESS_CONFIG || VEXPRESS_CONFIG=n
> >
> > That's the right solution,
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Since I screwed up already, care to also push this to drm-misc-next?

OK I applied and pushed it!

Yours,
Linus Walleij

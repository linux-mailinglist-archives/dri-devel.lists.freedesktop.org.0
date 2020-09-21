Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D52734F7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 23:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2725D6E58A;
	Mon, 21 Sep 2020 21:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799056E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 21:32:49 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a15so12374674ljk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jRK4tuNzYA5hcUw94Or8kYumY1XoSF+p8lqpANhekM=;
 b=Z2nOSsj2DF+QS/WHCozMqdmmb1C+xEpDzfWndQKj//cmuQpPmeL/uGInLRuXMppepu
 l4GHFMIMqlt9f8wY00Eb0HNWm0Vo5+sK/Ds2moe9cTR2qkmgy+a11MfHpvvlgYWA9xWq
 RzmrQSB5boiejmba/EGAlw7KAGFER9ee6LzsT60twysiXhogLSYC1Litwj6A+i3YWqhM
 p/oos46zwDX8zSytTI4Z3bYaN4UJ2dqSEVjbGmU+YoyyXmT0a4zaQCbg50hEzm1GWLgL
 8GmUTNN+g6Z1ANw0MMrIKuRfIzTPmvZzGhKKdeHS2MjmvkTxI1XzwHQk1fwXhU3Llxw7
 If1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jRK4tuNzYA5hcUw94Or8kYumY1XoSF+p8lqpANhekM=;
 b=LN4k5q0FzDENICcRhtcCSv6M79UQ9dad8sexJy4BqvuckFRGXN71sh4KFP+kOJOcNX
 8EjJuNZ9BaTKyD/rMmSpLlJRWF+LxoBp5hnIyuVb0v90Q0sY5jF6iXtse0KpwJQynv1x
 +lo6r4BGX2vNXJmgiJ9DHSRkXIV7gra0sU5IDwfUUlz7Yo1t76JYB+xCvipBEhRR+dve
 IstdZV1DVdqssbVyCkzWH9JslqRPbLO4Wk1+Vg4q7XFvRcSA4G4g6unELtrKmmWFqixd
 n2ZoagbF/E9ZgGIaT/9kqiFIqegg2DyvWz2M/2EZV8ch42vjnQBeE1cinAUKtKBnhwqf
 D1lA==
X-Gm-Message-State: AOAM531ce1yK5Oxi/cede1AdgbS1A8XRBn/7GgpfcWQihmrwIfChjov9
 QPzxOR5CLPBPyq31aIzhnBL5/68M8xbR3HtUaFuokA==
X-Google-Smtp-Source: ABdhPJxB3B4hyZR/y2w/N52XJDWHxrwFdIahb8iXrtEXFNcO6zX2Bk2djtwTH/XRL0woLcscoArIxGvroBdCbmMk3sE=
X-Received: by 2002:a05:651c:107b:: with SMTP id
 y27mr444903ljm.338.1600723967901; 
 Mon, 21 Sep 2020 14:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-1-linus.walleij@linaro.org>
 <20200609200446.153209-2-linus.walleij@linaro.org>
 <CAMn1gO52PQ-dFbCU49FCnJZz=gyLEE3F2vZ5rtbF_C-H+ur7qw@mail.gmail.com>
In-Reply-To: <CAMn1gO52PQ-dFbCU49FCnJZz=gyLEE3F2vZ5rtbF_C-H+ur7qw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Sep 2020 23:32:37 +0200
Message-ID: <CACRpkdYnXXvPAbCMdG8OOPYqWqDHFh_=z9mR5vKZ+ri8sDyAgA@mail.gmail.com>
Subject: Re: [PATCH 2/4] video: fbdev: amba-clcd: Retire elder CLCD driver
To: Peter Collingbourne <pcc@google.com>, John Stultz <john.stultz@linaro.org>
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
Cc: Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 3:10 AM Peter Collingbourne <pcc@google.com> wrote:
> On Tue, Jun 9, 2020 at 1:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > All the functionality in this driver has been reimplemented
> > in the new DRM driver in drivers/gpu/drm/pl111/* and all
> > the boards using it have been migrated to use the DRM driver
> > with all configuration coming from the device tree.
>
> Android's FVP configuration still uses FBDEV.

But all DRM drivers support frame buffer emulation so I don't
see how this can be a problem? The new DRM driver provides
a framebuffer.

I'm also confused about how this can be in use.
fvp-base-revc.dts includes rtsm_ve-motherboard.dtsi
where the PL111 is defined.

commit f1fe12c8bf33241e04c57a0fc5b25b16ba77ba2d
"ARM: dts: Modernize the Vexpress PL111 integration"
changes the DTS for the FVP such that only the new DRM
driver really works with it: it removes the panel-dpi encoded
panel and defines the panel
"arm,rtsm-display" for FVP and that is *only* supported
by drivers/gpu/drm/panel/panel-simple.c from DRM.

The upstream FVP has been using the new DRM driver
by default since
commit 37ad688497785c9ad1471236e28efda1e2f39741
"arm64: defconfig: Switch to PL11x DRM driver"
in january 2019.

Are you using old or outoftree devicetrees with a newer
kernel?

> While it would be great
> to see it migrated to DRM, this first requires resolving a design
> incompatibility between Android's composer and DRM devices that only
> support software rendering. I proposed a patch that would help resolve
> this [1], but there was disagreement about the approach and I haven't
> had time to get back to this.
>
> Can this please be reverted until FVP on Android can be migrated to DRM?

We need a clear technical reason, I understand that using DRM
directly might be a problem, but DRM supports full framebuffer
emulation and from a userspace point of view, what the new
driver provides should be equivalent.

I can think of problems like Android seeing the new fancy
DRM userspace ABI but surely it can be instructed to
ignore that and just use the framebuffer emulation instead?

If there is anything else making DRMs framebuffer emulation
substandard I am sure the DRM developers would like to know,
especially if it makes Android unhappy.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E327D83D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 22:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32516E1CE;
	Tue, 29 Sep 2020 20:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087DE6E147
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 20:33:05 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b22so7068900lfs.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 13:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jDoIp1LCX6039Gfw/Q72GY3wUgK7L1jK76pMk0KVQtY=;
 b=TVgPW+dFjrUoUsURmRC+SYoaafcsRCSr+z99BtZ4QUJMd9R19RV9GD90qKkJg8IyII
 +R/xnlTeiHdHzlWqx/yeqTHSkvpYvUq1PiYrCC5hMw39p57T3Ngj9vRJIjD0d6wnFkZu
 +2AcIxNjgjbSilj3Bmku1QQANALDYTKPsdmuph5b0+JxOF/0DbINR/8Sv4IVGhTbeAW9
 JphhyuDb9wCVSMWdHmJm49w+Q81sbXoaOjLwIKmUNiWXGEXJ0SNw67Hj6mbRoJ1xxrI7
 6l2e26UmOF/6BUxSt28HcU6q3+hGzMn0OjqYEJCVq1GIbw9vDAOryK9clL9qYsJj1ecZ
 SgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jDoIp1LCX6039Gfw/Q72GY3wUgK7L1jK76pMk0KVQtY=;
 b=jXNZ1Kgi3vdRLtQ2SwdxgF7n27Kh702Dgc0OeXPerfmYlQITauVcif3rCgqjBCuPBs
 XcN8v9XjhOHNzHNVfOmzbLr6VtgBfIhARmh3b/mrrL51sFBzcCFAakX80jCPgf7wIARi
 itSJ49Exs8F/xDxAtqr/RBpDLlmbUOgrCHMCgyeS76OLBKSXVjNGkPp6zwABuIKgC/9e
 z6fM6mu3JxnN6hAHKDX2dLaOIqsBV7OSCUYDkWchMx/DRvbpymGHu0hRLuqzwTLBcuyh
 iG0Bke4YWs6PZwv9UH7LGb8z+X+txblxuPQSHWH1c0D1rCOjtjr6SyPLSzQTrUu749Hv
 dTEA==
X-Gm-Message-State: AOAM5306iWseygScWSW7IccSeYmxAWmYaDXgN6JKTB1ohRehmi0bXKs1
 34R5oqucOkHQvZhIVyM2K9RQpgmaCcZ7byUELqzZfQ==
X-Google-Smtp-Source: ABdhPJzVUBwlklRyvfYFWw+eacoH2F2fbxuahL790ceNny9geme6IyN1KWnr+GCKPwlF6DzpEbprX2Tl5LJPILlbWAE=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr1718280lfg.441.1601411583315; 
 Tue, 29 Sep 2020 13:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200929195344.2219796-1-pcc@google.com>
In-Reply-To: <20200929195344.2219796-1-pcc@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 22:32:52 +0200
Message-ID: <CACRpkdYqCJumZesRVcWq74aNmoi2HgDnYoKOYLjWo5tT1soogQ@mail.gmail.com>
Subject: Re: [PATCH v2] Partially revert "video: fbdev: amba-clcd: Retire
 elder CLCD driver"
To: Peter Collingbourne <pcc@google.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 9:53 PM Peter Collingbourne <pcc@google.com> wrote:

> The fbdev driver is used by Android's FVP configuration. Using the
> DRM driver together with DRM's fbdev emulation results in a failure
> to boot Android. The root cause is that Android's generic fbdev
> userspace driver relies on the ability to set the pixel format via
> FBIOPUT_VSCREENINFO, which is not supported by fbdev emulation.
>
> There have been other less critical behavioral differences identified
> between the fbdev driver and the DRM driver with fbdev emulation. The
> DRM driver exposes different values for the panel's width, height and
> refresh rate, and the DRM driver fails a FBIOPUT_VSCREENINFO syscall
> with yres_virtual greater than the maximum supported value instead
> of letting the syscall succeed and setting yres_virtual based on yres.

Is there a way to reproduce this? A simple binary image where
we can start Android on FVP and just replace the kernel image
would be great. That way we can look at the incompatibilities
in the FBDEV emulation and try to fix them.

Is it working with a stock kernel or do you need any out-of-tree
Android patches to run this?

Can you also share the kernel config used for this build so it is
easy to rebuild a similar kernel?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D3527E302
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A956E56A;
	Wed, 30 Sep 2020 07:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6801F6E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 21:16:33 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id y194so3836643vsc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TWKJBZ1PMKXw3r1cyt/TCZgT36NFPl0AFTn4gc7LPNA=;
 b=fAw5h9isAgjkNBo8+ItKPHyb8d7W0eYS1qs0SDtBhlNr+PRvMEfbuNceS2qAy54Geu
 sS7TktPJMjqU4i8O6pwTkozCHf2bPikoGkxvyWXrRvWGM6HG8lMNhUtCp79S+Dg2KH39
 +xuFYaD9j1nc/JFinFCEQi+tZ8qNbvH0F3WOeMPbACRVN7WPpwqMEbW0B2512TtP18YU
 O27pPO+e5h9YCpsGbaVF+DY3v+r00xUk6TumcAkXVfTZAlgsP3DIkMaa0oVNVQrYIcFE
 51BBvTkhi1IBM0Klr3HPGIkjntpm363WS5ypnj2Tbm9kKN2PKXyRDQt1wCOm+EMZuq0h
 wtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TWKJBZ1PMKXw3r1cyt/TCZgT36NFPl0AFTn4gc7LPNA=;
 b=Fpm7TkG4vzbd/q+W826bcrXQ3rX4Y8ZGhvuVSzO+9ubtJsC9cW2UhrM4urt6TY4I8+
 89wbvKUZTdLmf9PLrqyiFAKGyuYJjkZhfJzaUbBI9L9ME8Rza0csrQwbJvv6uWXnTIOO
 VAW3nmg/K+uMXNAHqfn1bqm+NBbtNfxCtOLk2MVlK/RE5s2H+LHzu0Mk0Q0uJrzkdy3f
 mP4u3U7MT8Y+SYfyUuYl2+oG7IuS3mjoG5QSfSEGON78j511YdAINVDnV7uuDHvwgXjE
 MQ9SZBxvxGY6+YLTNYx2Pj4PAXY7Tz4ZDjSxhFojFU1aIFehrTPyg8d9qRd+UzDmHmaL
 mbsQ==
X-Gm-Message-State: AOAM530hNM5m0XL00oFOWH0KWn5qe2aPDtSmPCqLIlxaCe+DwetyU2Pc
 vuAHkdCvODh/xYcs4j0mhF971xKAkYzvPFpPiPZfRJdebUUUXKQq
X-Google-Smtp-Source: ABdhPJwBGBGSovQrUi+YA4DjuvA0noZqXhY9bXpZZdqcXv/gETm0F1DQHwb1Ci/oZN3Hz7LTdNt6cSqlUMsF3L8kqqM=
X-Received: by 2002:a67:d84:: with SMTP id 126mr4266221vsn.51.1601414192297;
 Tue, 29 Sep 2020 14:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200929195344.2219796-1-pcc@google.com>
 <CACRpkdYqCJumZesRVcWq74aNmoi2HgDnYoKOYLjWo5tT1soogQ@mail.gmail.com>
In-Reply-To: <CACRpkdYqCJumZesRVcWq74aNmoi2HgDnYoKOYLjWo5tT1soogQ@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 29 Sep 2020 14:16:21 -0700
Message-ID: <CAMn1gO45D9nwuJT_iHyzrHpYCx8uEN_pmCOuQLUn_vwh4VQQcw@mail.gmail.com>
Subject: Re: [PATCH v2] Partially revert "video: fbdev: amba-clcd: Retire
 elder CLCD driver"
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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

On Tue, Sep 29, 2020 at 1:33 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 29, 2020 at 9:53 PM Peter Collingbourne <pcc@google.com> wrote:
>
> > The fbdev driver is used by Android's FVP configuration. Using the
> > DRM driver together with DRM's fbdev emulation results in a failure
> > to boot Android. The root cause is that Android's generic fbdev
> > userspace driver relies on the ability to set the pixel format via
> > FBIOPUT_VSCREENINFO, which is not supported by fbdev emulation.
> >
> > There have been other less critical behavioral differences identified
> > between the fbdev driver and the DRM driver with fbdev emulation. The
> > DRM driver exposes different values for the panel's width, height and
> > refresh rate, and the DRM driver fails a FBIOPUT_VSCREENINFO syscall
> > with yres_virtual greater than the maximum supported value instead
> > of letting the syscall succeed and setting yres_virtual based on yres.
>
> Is there a way to reproduce this? A simple binary image where
> we can start Android on FVP and just replace the kernel image
> would be great. That way we can look at the incompatibilities
> in the FBDEV emulation and try to fix them.
>
> Is it working with a stock kernel or do you need any out-of-tree
> Android patches to run this?
>
> Can you also share the kernel config used for this build so it is
> easy to rebuild a similar kernel?

There are instructions here for how to build Android targeting FVP:
https://cs.android.com/android/platform/superproject/+/master:device/generic/goldfish/fvpbase/README.md

It also includes instructions for building the kernel (which is the
Android common kernel so it does have some patches on top, but it does
closely track mainline) so you should be able to make your changes on
top of the common kernel, rebuild and test them that way.

Because of how Android boot images work I don't think it would be easy
to provide binaries where you can replace the kernel image. Let me
know if you have any trouble following the instructions.

The configuration is basically a combination of these two configs:
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/arch/arm64/configs/gki_defconfig
https://android-review.googlesource.com/c/kernel/common/+/1145352/11/fvp.fragment

Those configs enable the fbdev driver. You can apply the patch I
posted earlier to fvp.fragment to switch to the DRM driver.

Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

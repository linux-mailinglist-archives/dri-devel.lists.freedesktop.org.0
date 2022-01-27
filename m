Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7853C49E7A3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 17:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E3410E196;
	Thu, 27 Jan 2022 16:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7851210E196
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 16:34:50 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso3067593ott.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TkE5ArX6BFaW8oAI30DS2hxpGdwoTPUB8Ux3SxWDgeI=;
 b=QGT2t+qW5UWjMj0Gkd3nJ/86yRunTkPO8G0V17um9k6ChCDDLQZc4L8/dri6J65r1K
 zjWteQNbI8BjQ5JYcg0sdOgNyZNd/hhTLmf8gOoQMb+xgLsPasILyl1fXa+7xSlJoumE
 u2aSkxfbqBFM5zH5mxnupZiY7mHP95nE4+lFJKMEv0YJmBEdOtfp7FFv+3xHz604r4GX
 NGY02uTyRxkHd7LLIoux6O1uUqoOJrOoSmF1bNJBEwlK2je1RI/1XlQJeOzMyXvUz17F
 iCRkiKUyl/E4M44vPvIcgsuxgaELjwL6mo/TXod1iGksHqdlRLfdxFwP7Z6rTr/aAThY
 MSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TkE5ArX6BFaW8oAI30DS2hxpGdwoTPUB8Ux3SxWDgeI=;
 b=AR2voQBesCMXE7UXy6hUiTNS82x/iHS9RlofwcuTdb6iN77Xf+eTIO2wwBIpSQs4xh
 IqotD/GBJBk5VL+3dtyYXsLuG10rl5r6g9Y8bxZYAeuVJeJm7g6UIqT5RLFnit50wDH/
 TmjlkTZ8mbezFVWaQ7KHs9IcRdrLz7P76pEp5SUp3bFuMYrZHRxTSdSDEuuFATJ3seA0
 AVjr+ku7ZtXTd7CS53mYg8arbHyETAoAesH2DsbRky105x2lySjWtFmZjScgOWZiJEdx
 JK9tT47AXL2neDQhTGA05cefyx5gfiyf/MM1kBAzkGYxY0/ncfnvLAGDlPBc3pkTJ0VY
 saFQ==
X-Gm-Message-State: AOAM533zOZ74gP0UuZt1DtDTRLd3x7+OaX/FzxU9VwmLUddu1qXJzHs3
 EV/CFpn1za0NBobJ7GdF9DQ0oF/SbvRu8VipuM7Rzw==
X-Google-Smtp-Source: ABdhPJzRAjo7eeV9hQx+B3TQzFGClLOL93ZZzsIXExu8vJz6C0QvfT5nzsCASkGZRmSn08vl5584Wr7ZwMlSAxC+ee4=
X-Received: by 2002:a05:6830:25d2:: with SMTP id
 d18mr1165208otu.319.1643301289432; 
 Thu, 27 Jan 2022 08:34:49 -0800 (PST)
MIME-Version: 1.0
References: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
 <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
 <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
 <20220127062945.GC1951@kadam>
 <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
 <YfJ9yWW+MH8N4r4A@phenom.ffwll.local>
In-Reply-To: <YfJ9yWW+MH8N4r4A@phenom.ffwll.local>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 27 Jan 2022 17:34:37 +0100
Message-ID: <CACT4Y+bLWWkZFd7iU6P1hWoF0Yp+9hDEo=puH4BfyETEmR7OMw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Dmitry Vyukov <dvyukov@google.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, 
 linux-fbdev@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, 
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>, 
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, syzkaller <syzkaller@googlegroups.com>
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

On Thu, 27 Jan 2022 at 12:11, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 27, 2022 at 11:32:58AM +0100, Dmitry Vyukov wrote:
> > On Thu, 27 Jan 2022 at 07:30, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Wed, Jan 26, 2022 at 11:31:02PM +0100, Daniel Vetter wrote:
> > > > dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > The other advantage of staging is the I don't think syzbot enables it.
> > > > > I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> > > > > get him to disable FBDEV.  :P
> > > > >
> > > > > The memory corruption in fbdev was a real headache for everyone because
> > > > > the stack traces ended up all over the kernel.
> > > >
> > > > Uh Dmitry disabled all of FBDEV?
> > >
> > > No that's the opposite of what I meant.  STAGING is disabled in syzbot
> > > and FBDEV is enabled.
> >
> > Is there still any problem with syzbot config?
> > syzbot configs are stored here:
> > https://github.com/google/syzkaller/tree/master/dashboard/config/linux
>
> CONFIG_FB and CONFIG_FRAMEBUFFER_CONSOLE are set, which are the things I
> care about. The one exception is upstream-kcsan.config, which doesn't have
> fbcon enabled.
>
> Also looking through your fbdev drivers, really the only ones you want to
> ever enable are:
> CONFIG_FB_VGA16=y
> CONFIG_FB_VESA=y
> CONFIG_FB_VIRTUAL=y
>
> The following isn't enabled, but I guess if you don't have EFI doesn't
> make sense, otherwise you really want it:
> CONFIG_FB_EFI=y
>
> The below are enabled in some configs and should be ditched
> CONFIG_FB_SIMPLE=y (use CONFIG_DRM_SIMPLEDRM instead, at least on kernels that have it)
> CONFIG_FB_I740=y (you don't have this hw or I'm blown away, this last shipped 20 years ago)
> CONFIG_FB_UDL=y (use CONFIG_DRM_UDL instead)
> CONFIG_FB_UVESA=y (does modesets by calling into a userspace helper to run x86 vbios code, just don't)
> CONFIG_FB_SMSCUFX=y (if you really have these then someone should port this to drm asap)
> CONFIG_FB_CIRRUS=y (use CONFIG_DRM_CIRRUS_QEMU instead since I'm pretty sure you don't have a real cirrus pci card)
>
> Also note that the simpledrm driver will eat all the firmware fbdev
> drivers and unload them. So you need to run two configs to really cover
> both sets of drivers in all cases.

Thanks!

I've sent PR to update these configs as you suggest:
https://github.com/google/syzkaller/pull/2993

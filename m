Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D391292AB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EAD6E1B1;
	Mon, 23 Dec 2019 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F256E3F3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 22:17:43 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id v12so4796635vsv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 14:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ndP5DyVVYEx6LRATNvjA+FE11IESSegAdsPFSy9GGY=;
 b=G1GwUWUhsOH3IDfiGCCMJWCsbGjKBHYP0GhB5lUqC3nzx7I8CVsq2W1E21MVyw7Rq7
 hRMpW1sRXg6rPja3OzFs0QWlHgTSaK/jknSo/JIKqYRP2/2vqDwZ06hPgeiejrbNsyoZ
 uzhPwu8m9mxmNLIVbmr1v4NK9q2IygRQerIOWhbHW0JsZRPtGX1MOSxdtjAagoKxWmH8
 zuhT2yWwAjsNQfN9+8CW81oC0ZU3eDb9QlBcQk3dexMsx3n0QcJIETUJjPP6Tr+DyuuN
 kyC/Hwkcf+Nd2O3zrMSV2bXUThO/KCyEAqfgr/P0vYasz46DBiLD8PW9L2Wk5KANH90Q
 hATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ndP5DyVVYEx6LRATNvjA+FE11IESSegAdsPFSy9GGY=;
 b=Qql+i7UnoKhqK6TINZ4uOIsPld9UxHX5aR6tiytPdtwoldByisM9LFDmyFvaUHEnjq
 mcZKUZ778OSxwp0AKYewHElzxNKnzQQfQNvhtfibJJNS83sufT0tt41t2nL8FpHvkwH9
 AjnDbaVG6Ln1blcnFo9KgPwVa8l2FiKRrNJerSCj39paRoNx8+E+ZgTRDMSQrwPGYIOk
 /7hpwB+fReLcq3wXs9YaMXDfy2hXkBfi3ZKFvzJ4AVbXDPvaIAZgVyfrfWlKhtijh1J0
 +/Ydfb2xjSblXTztnj7FweX4j/m6P0beKQqYgjWBrP4UYehHz7Va68OTflMkkOQce6hv
 HElQ==
X-Gm-Message-State: APjAAAWuGT4+shjwWboPGYZJoVUJpre09jal+yzUcNOZapx8TmCTV4hD
 kd54RC996u71T1KG1FRh6pAum+X+qrOr5+N5r1Wgfw==
X-Google-Smtp-Source: APXvYqzO+W0sfWNewfxmNxOrPZXXjTTCyI0TAromWHrFAFH63oVQKKIN0oh+NYU0rTqViLL6AbT7Atqk/2eRmdjMODU=
X-Received: by 2002:a67:b649:: with SMTP id e9mr6733198vsm.34.1576793863004;
 Thu, 19 Dec 2019 14:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20191209130336.2257506-1-thierry.reding@gmail.com>
 <20191209130336.2257506-2-thierry.reding@gmail.com>
 <CAPDyKFp6cnpn4yFaEBDPBdHc1siQvJbmwedbhRNCdDBVAc2qUA@mail.gmail.com>
 <20191212123352.GA3322354@ulmo>
 <CAPDyKFodOjta0JnEEMrC0j5=XeB-wLjTNvPFtmDtUBZBMTJvQg@mail.gmail.com>
 <CAJZ5v0hA6mz7r93_HVpfP-=72wARf9=NN1jNG3KHtzM_+oT9LA@mail.gmail.com>
In-Reply-To: <CAJZ5v0hA6mz7r93_HVpfP-=72wARf9=NN1jNG3KHtzM_+oT9LA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Dec 2019 23:17:07 +0100
Message-ID: <CAPDyKFoJhn=v92qz=z6X9j4AfLwGCt350i1ntoNCRYqoemr9aw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/tegra: Do not implement runtime PM
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Dec 2019 at 17:48, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Dec 12, 2019 at 2:32 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Thu, 12 Dec 2019 at 13:33, Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Thu, Dec 12, 2019 at 09:52:22AM +0100, Ulf Hansson wrote:
> > > > On Mon, 9 Dec 2019 at 14:03, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > >
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >
> > > > > The Tegra DRM driver heavily relies on the implementations for runtime
> > > > > suspend/resume to be called at specific times. Unfortunately, there are
> > > > > some cases where that doesn't work. One example is if the user disables
> > > > > runtime PM for a given subdevice. Another example is that the PM core
> > > > > acquires a reference to runtime PM during system sleep, effectively
> > > > > preventing devices from going into low power modes. This is intentional
> > > > > to avoid nasty race conditions, but it also causes system sleep to not
> > > > > function properly on all Tegra systems.
> > > >
> > > > Are the problems you refer to above, solely for system suspend/resume?
> > >
> > > No, this patch also fixes potential issues with regular operation of the
> > > display driver. The problem is that parts of the driver rely on being
> > > able to shut down the hardware during runtime operations, such as
> > > disabling an output. Under some circumstances part of this shutdown will
> > > imply a reset and, at least on some platforms, we rely on that reset to
> > > put the device into a known good state.
> > >
> > > So if a user decides to prevent the device from runtime suspending, we
> > > can potentially run into a situation where we can't properly set a
> > > display mode at runtime since we weren't allowed to reset the device.
> >
> > Thanks for clarifying!
> >
> > We have very similar issues for SDIO functional drivers (WiFi
> > drivers). Typically, at some point there needs to be a guarantee that
> > the power has been cut in between a "put" and "get", as to be able to
> > re-program a FW.
> >
> > My worry in regards to this, is that we may reinvent the wheel over
> > and over again, just because runtime PM today isn't a good fit.
> >
> > In principle, if you could, somehow forbid user-space from preventing
> > the device from being runtime suspended, that would do the trick,
> > wouldn't it?
>
> Treating pm_runtime_suspend() and pm_runtime_resume() as the low-level
> device power off and power on routines for the given platform is a
> mistake.  It has always been a mistake and I'm not going to accept
> changes trying to make it look like it isn't a mistake.

Of course you are right that it's a mistake. I am just pondering if
over how bad the mistake(s) really are and what we can do about them.

For example, on x86, the ACPI PM domain is used to power the SDIO card
and the SDIO func device (the SDIO card is the parent to the SDIO func
device) via runtime PM.

Honestly, I don't know how to fix this, unless we allow the drivers to
call the ACPI power on/off functions directly, but that doesn't sound
very nice either and kind of defeats the purpose of using the PM
domain.

>
> If any generic power off and power on helpers for DT-based platforms
> are needed, add them and make PM-runtime use them.  That should be
> straightforward enough.

That wouldn't help in the SDIO case as the power on/off thingy is
still relying on those runtime PM calls.

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

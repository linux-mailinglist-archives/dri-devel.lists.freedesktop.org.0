Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE711D2A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 17:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8DB6E0D2;
	Thu, 12 Dec 2019 16:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE4E6E0D2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 16:48:27 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id d62so928528oia.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjt4lItRqFacWsQt7v1P7M8uY8SdNlW1FI4JcWAB9cg=;
 b=iyoLV0AZZ7A6VV3YwHQyAl4hb1teoh6NDJD8yu6lxOsrXbXm7HHrOhvh3lLLnsRw8K
 OHU3ZYIfJaFxMEqfEqB24O+b5pG2C7PsQMuC0hR73vXnByR4b8V0gUra0bCPx8QzGkFx
 woyubf6jTV4+82PWdCqg0M9dowHyu6+et60FYdNo3jkMElsPz1dThZhFqhrESZwqGDa9
 2rlT5KY0wFS+q/Kb0YepQRCJoP9X1mm7nJfBdE8oqpEZaX8gXcXV6ejlGghCtZcuQTsJ
 dqOe1hDUSUtG93KpKGPyBIBfHVOTNeW31QUW1Lwms0RXSpLUHpnUXqt/Ikviw4/StJoy
 NxBA==
X-Gm-Message-State: APjAAAWyd7rKnCAv0S98YY6OrMxIPTcrRvhqGfNBo02t4XlhkGFAUBEW
 1f8AoBy2GDraC4odDwBQU6B/QDM/F+WoTZUvlvI=
X-Google-Smtp-Source: APXvYqzhLuqtxFrHpTXnVzGWfbF0p1GWuNhl8OxvrrmXH4N5/NFgSppxHw5/WLukxvz2bdzYziU7WSw55RG2N9rHWPQ=
X-Received: by 2002:a05:6808:b38:: with SMTP id
 t24mr5721539oij.110.1576169306476; 
 Thu, 12 Dec 2019 08:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20191209130336.2257506-1-thierry.reding@gmail.com>
 <20191209130336.2257506-2-thierry.reding@gmail.com>
 <CAPDyKFp6cnpn4yFaEBDPBdHc1siQvJbmwedbhRNCdDBVAc2qUA@mail.gmail.com>
 <20191212123352.GA3322354@ulmo>
 <CAPDyKFodOjta0JnEEMrC0j5=XeB-wLjTNvPFtmDtUBZBMTJvQg@mail.gmail.com>
In-Reply-To: <CAPDyKFodOjta0JnEEMrC0j5=XeB-wLjTNvPFtmDtUBZBMTJvQg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 12 Dec 2019 17:48:15 +0100
Message-ID: <CAJZ5v0hA6mz7r93_HVpfP-=72wARf9=NN1jNG3KHtzM_+oT9LA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/tegra: Do not implement runtime PM
To: Ulf Hansson <ulf.hansson@linaro.org>
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

On Thu, Dec 12, 2019 at 2:32 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 12 Dec 2019 at 13:33, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Thu, Dec 12, 2019 at 09:52:22AM +0100, Ulf Hansson wrote:
> > > On Mon, 9 Dec 2019 at 14:03, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > The Tegra DRM driver heavily relies on the implementations for runtime
> > > > suspend/resume to be called at specific times. Unfortunately, there are
> > > > some cases where that doesn't work. One example is if the user disables
> > > > runtime PM for a given subdevice. Another example is that the PM core
> > > > acquires a reference to runtime PM during system sleep, effectively
> > > > preventing devices from going into low power modes. This is intentional
> > > > to avoid nasty race conditions, but it also causes system sleep to not
> > > > function properly on all Tegra systems.
> > >
> > > Are the problems you refer to above, solely for system suspend/resume?
> >
> > No, this patch also fixes potential issues with regular operation of the
> > display driver. The problem is that parts of the driver rely on being
> > able to shut down the hardware during runtime operations, such as
> > disabling an output. Under some circumstances part of this shutdown will
> > imply a reset and, at least on some platforms, we rely on that reset to
> > put the device into a known good state.
> >
> > So if a user decides to prevent the device from runtime suspending, we
> > can potentially run into a situation where we can't properly set a
> > display mode at runtime since we weren't allowed to reset the device.
>
> Thanks for clarifying!
>
> We have very similar issues for SDIO functional drivers (WiFi
> drivers). Typically, at some point there needs to be a guarantee that
> the power has been cut in between a "put" and "get", as to be able to
> re-program a FW.
>
> My worry in regards to this, is that we may reinvent the wheel over
> and over again, just because runtime PM today isn't a good fit.
>
> In principle, if you could, somehow forbid user-space from preventing
> the device from being runtime suspended, that would do the trick,
> wouldn't it?

Treating pm_runtime_suspend() and pm_runtime_resume() as the low-level
device power off and power on routines for the given platform is a
mistake.  It has always been a mistake and I'm not going to accept
changes trying to make it look like it isn't a mistake.

If any generic power off and power on helpers for DT-based platforms
are needed, add them and make PM-runtime use them.  That should be
straightforward enough.

Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

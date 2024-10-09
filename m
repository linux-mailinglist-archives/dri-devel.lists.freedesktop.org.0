Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E549966E9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC3510E6D1;
	Wed,  9 Oct 2024 10:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sypaa8E4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D4210E6C1;
 Wed,  9 Oct 2024 10:20:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 750765C5EE6;
 Wed,  9 Oct 2024 10:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2E2C4CED1;
 Wed,  9 Oct 2024 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728469229;
 bh=ImAK0CpUwm+JPbTzbW7azTUBVNfLGbvl7aS7sfbdp0E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sypaa8E4XTR2h+6vO973S9djHACjIXek0KLq783ADF8tNtOe1bMZrJFf0zlt8+zSs
 OLRAtppFEIb5Ic0mWDNDYNRaI6e9/Z7vBQGyOQ8guZklNp3J6lYVvOJPY0Nte+XhtF
 xT1b91GGI33rYAt7gxwLcB1d3y1SBKs6bb4MxTTF1y6tGBweQi8zO12oDVI1/KpONI
 bOJQtQv0XV690wHla57wDR2aHvoM6Up16kaIYdw6AVyfMWDvtpnERh2dLqJ6WBvkYw
 EhkKXnH7yqObLqkMathJ5jYncRSwZXMHxI2dTYJuZPN1g66Yyks/L1YgZFWJ7ipDTo
 JPDgtbBAM36Bg==
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5e988c5813eso242632eaf.2; 
 Wed, 09 Oct 2024 03:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqsbkMgxiUD3S7eBfjc1IQdIamQqpNkRP/arGMsC42m/qxAEWBw+GrO/JUyVu4b4zJjy+5DeEG@lists.freedesktop.org,
 AJvYcCXECG942m2Fo8EwC0AOsCmgrvZmJuko9YuOtewxYxwcnFlhrbJf/+OFR5PgRwKa2m/VN6io2IURUg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycEtLBHJJuPs1nTC47OfF0+HoA1lkgp19HowO+/KOIfqxN5zgD
 A5jEHeCZlx1JH6cdlHjP4cPG95dA2eenHurO72kCgC/XlnlyThZR1U2JyHvA4wBGLXdGTx2OA3s
 iRX7o2wG/nWz0YK6DGXKdlMwRGmU=
X-Google-Smtp-Source: AGHT+IF28e1A9mtOEy4wCWwLUrfMAFq/4+DT8Vi41Eljnp8AjlauSlJofg4NJprxAH2sFsPScvE36aWo6OHCPjXQ49c=
X-Received: by 2002:a05:6820:270f:b0:5e7:c925:b05 with SMTP id
 006d021491bc7-5e987aadf58mr1212364eaf.2.1728469228716; Wed, 09 Oct 2024
 03:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
 <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 12:20:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, 
 linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
 iommu@lists.linux.dev, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, 
 asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 8, 2024 at 8:24=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Ulf,
> > >
> > > On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> > > > On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > > > > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > > > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > > > > >
> > > > > > > Hello everyone,
> > > > > > >
> > > > > > > This set will switch the users of pm_runtime_put_autosuspend(=
) to
> > > > > > > __pm_runtime_put_autosuspend() while the former will soon be =
re-purposed
> > > > > > > to include a call to pm_runtime_mark_last_busy(). The two are=
 almost
> > > > > > > always used together, apart from bugs which are likely common=
. Going
> > > > > > > forward, most new users should be using pm_runtime_put_autosu=
spend().
> > > > > > >
> > > > > > > Once this conversion is done and pm_runtime_put_autosuspend()=
 re-purposed,
> > > > > > > I'll post another set to merge the calls to __pm_runtime_put_=
autosuspend()
> > > > > > > and pm_runtime_mark_last_busy().
> > > > > >
> > > > > > That sounds like it could cause a lot of churns.
> > > > > >
> > > > > > Why not add a new helper function that does the
> > > > > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy(=
)
> > > > > > things? Then we can start moving users over to this new interfa=
ce,
> > > > > > rather than having this intermediate step?
> > > > >
> > > > > I think the API would be nicer if we used the shortest and simple=
st
> > > > > function names for the most common use cases. Following
> > > > > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is =
that
> > > > > most common use case. That's why I like Sakari's approach of repu=
rposing
> > > > > pm_runtime_put_autosuspend(), and introducing
> > > > > __pm_runtime_put_autosuspend() for the odd cases where
> > > > > pm_runtime_mark_last_busy() shouldn't be called.
> > > >
> > > > Okay, so the reason for this approach is because we couldn't find a
> > > > short and descriptive name that could be used in favor of
> > > > pm_runtime_put_autosuspend(). Let me throw some ideas at it and may=
be
> > > > you like it - or not. :-)
> > >
> > > I like the idea at least :-)
> > >
> > > > I don't know what options you guys discussed, but to me the entire
> > > > "autosuspend"-suffix isn't really that necessary in my opinion. The=
re
> > > > are more ways than calling pm_runtime_put_autosuspend() that trigge=
rs
> > > > us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> > > > calling pm_runtime_put() has the similar effect.
> > >
> > > To be honest, I'm lost there. pm_runtime_put() calls
> > > __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
> > > pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
> > > RPM_ASYNC | RPM_AUTO).
> >
> > __pm_runtime_idle() ends up calling rpm_idle(), which may call
> > rpm_suspend() - if it succeeds to idle the device. In that case, it
> > tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
> > to what is happening when calling pm_runtime_put_autosuspend().
>
> Right.
>
> For almost everybody, except for a small bunch of drivers that
> actually have a .runtime_idle() callback, pm_runtime_put() is
> literally equivalent to pm_runtime_put_autosuspend().
>
> So really the question is why anyone who doesn't provide a
> .runtime_idle() callback bothers with using this special
> pm_runtime_put_autosuspend() thing, which really means "do a
> runtime_put(), but skip my .runtime_idle() callback".
>
> > >
> > > >
> > > > Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> > > > during rpm_resume() too, for example. So why bother about having
> > > > "mark_last_busy" in the new name too.
> > > >
> > > > That said, my suggestion is simply "pm_runtime_put_suspend".
> > >
> > > Can we do even better, and make pm_runtime_put() to handle autosuspen=
d
> > > automatically when autosuspend is enabled ?
> >
> > As stated above, this is already the case.
>
> What really is needed appears to be a combination of
> pm_runtime_mark_last_busy() with pm_runtime_put().
>
> Granted, pm_runtime_put() could do the pm_runtime_mark_last_busy()
> thing automatically if autosuspend is enabled and the only consequence
> of it might be delaying a suspend of the device until its autosuspend
> timer expires, which should not be a problem in the vast majority of
> cases.

That said, it is likely better to avoid surprising the current users
of pm_runtime_put() and define something like

static inline void pm_runtime_touch_and_put(struct device *dev)
{
        pm_runtime_mark_last_busy(dev);
        pm_runtime_put(dev);
}

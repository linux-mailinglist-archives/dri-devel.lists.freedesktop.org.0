Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51FC5BBF5A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 20:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0A310E050;
	Sun, 18 Sep 2022 18:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC9210E050
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 18:45:56 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id k21so15507107pls.11
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=CNHwlAtzFK3+lZTDDkPGz4WynJ6HJUfp6Y4yCAx6AG0=;
 b=e7yH8HYDPG8qRQ/6JUnv2VtOA9NpjzNHhn9HRybXyKcYnxIjCB9oNNxlJYGPIFsCPv
 LrtrZQPVgMT5g6VIKs1ZmC3+CeYHE2xLbLa5TDgSMZrQfadr9Xco7p+5HNKSP/hsv41u
 AbFQ/hH4ekZZ/9XZGQu/ZfuBGrImCvZSs/DJ2dIxTf5vcNRyNF3QN8lCi9n9EzDkQEut
 xipu2XzNuWMXBvFafd456g4gnrz7SAAJZppgn+yq9cQMz3xa1e5WBqNJsYvekogo8sL+
 +zXxz8INyaUwHIuGjgLwOxK2GIr5Gc0n2uYD2kVuXNKEreJhAZkLGrMUPaHLAatR3oln
 ivCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=CNHwlAtzFK3+lZTDDkPGz4WynJ6HJUfp6Y4yCAx6AG0=;
 b=UHvARvUKLrLrTVEnQ5+2dLUvUpeq7c0W+jWGF9LtaYt1DpDo5R0DZSyJqIJyls4TmB
 6+cHGsFAwvQMMbS7aKiyuvMTKszlzPCTR4I62kmE0W2ITuFDwnTZqfjZZluLzA4MoeDB
 Gdn5mSB+yZ0MWIGbyrGbXT1Tpp3h3pY9a/TWTPW+3gDDvV7lWqeXrlasoYjez0+K7F9H
 Go2Qxfw2a7GssnobZORCiFODwOjV07KIlOWy0P16OyEanrRclZ/0WFPmB5JUjb3nDWAn
 Frp/wyukQI69YpERtKL5nndqyMsRrWThXJSRhYOdgU83Eq23OW8jkwi/w5vZid86/byy
 OhsA==
X-Gm-Message-State: ACrzQf0BRgR6fRzA444/l1G7Pz7pZl5vMtE2u0fHU8lX2GYw7mYg12ZL
 ItbV208uw4nAxTD54GWohLitn2omI1yKFzf1PcIBA+xi
X-Google-Smtp-Source: AMsMyM6VoC6LXQnFa3mAEI7OaO1EFvu8Qb0w8QSCj3cxLuukmiCMCrzue+sMGaJl8tYMqKScP65no1MzTt8c8feo5es=
X-Received: by 2002:a17:903:204d:b0:176:ca4e:37d4 with SMTP id
 q13-20020a170903204d00b00176ca4e37d4mr10024740pla.106.1663526756400; Sun, 18
 Sep 2022 11:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220909115646.99920-1-hdegoede@redhat.com>
 <CAMeQTsaAoz2XHrOy9-s1nUh4Pa27E8=Ted+8vQ+HRzA=1O2ojg@mail.gmail.com>
 <edbea55f-8ad0-e733-619f-aba81846cfb8@redhat.com>
In-Reply-To: <edbea55f-8ad0-e733-619f-aba81846cfb8@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 18 Sep 2022 20:45:45 +0200
Message-ID: <CAMeQTsY7xZngbSaDOGMYJ8i0Yogwvv6hDi69hw6QBTCORfdUmQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/gma500: 1 fix + further cleanups
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 17, 2022 at 2:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Patrik,
>
> On 9/14/22 09:50, Patrik Jakobsson wrote:
> > On Fri, Sep 9, 2022 at 1:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi Patrik,
> >>
> >> Here is another gma500 patch-series with one more bugfix and a bunch
> >> of other cleanups of stuff which I noticed while doing the previous
> >> set of bugfixes.
> >>
> >
> > Hi Hans, nice cleanups!
> >
> > I'm rather busy at the moment so you can commit these yourself to
> > drm-misc-next if you like.
> >
> > "drm/gma500: Wait longer for the GPU to power-down" can go through
> > drm-misc-fixes if you prefer. It fixed the timeout message on two of
> > my CDV machines but I never saw an actual problem from the timeouts.
> >
> > For the entire series:
> > Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>
> Thanks.
>
> I'm pushing these out to drm-misc-next now, but with some small
> changes:
>
> 1. I have dropped the "drm/gma500: Wait longer for the GPU to power-down"
> patch I'm still seeing timeouts even if I increase the wait time to
> a full seconds. I believe that the actual issue is this line:
>
>         dev_priv->apm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT, PSB_APMBA);
>
> sometimes failing. When the timeout happens I see apm_base is set to 0 and
> reading apm_base + cmd / sts offset returns bogus values.

Ugh, that is nasty. Debugging the punit is probably not easy. But the
increased delay did remove the error on two of my 64-bit CDV systems.
The 32-bit system never had an issue to begin with. I can also take a
closer look at this.

>
> I have yet to have a successful boot where the timeout does not happen
> since I have been poking at this (it seems success/fail wrt the timeout
> is random). But I suspect that with a successful boot apm_base will not
> be 0 and that the problem is there. To be continued...

Do you still get working outputs when this happens? Perhaps we can
work around it by simply not touching APM if apm_base is 0.

>
>
> 2. For the "drm/gma500: Rewrite power management code" I noticed the
> following error during further testing (for the actual backlight changes):
>
> [   12.292509] gma500 0000:00:02.0: Unbalanced pm_runtime_enable!
>
> The problem is that pci_pm_init() which the PCI core runs for each
> device already does:
>
>         pm_runtime_forbid(&dev->dev);
>         pm_runtime_set_active(&dev->dev);
>         pm_runtime_enable(&dev->dev);
>
> So the pm_runtime_enable() call in "drm/gma500: Rewrite power management code"
> was a second enable call and as such was not necessary. So I'm going to
> squash in the following small fix while pushing this out:
>
> diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
> index 62d2cc1923f1..0080b692dc3e 100644
> --- a/drivers/gpu/drm/gma500/power.c
> +++ b/drivers/gpu/drm/gma500/power.c
> @@ -61,10 +61,11 @@ void gma_power_init(struct drm_device *dev)
>          * To fix this we need to call pm_runtime_get() once for each active
>          * pipe at boot and then put() / get() for each pipe disable / enable
>          * so that the device gets runtime suspended when no pipes are active.
> +        * Once this is in place the pm_runtime_get() below should be replaced
> +        * by a pm_runtime_allow() call to undo the pm_runtime_forbid() from
> +        * pci_pm_init().
>          */
>         pm_runtime_get(dev->dev);
> -       pm_runtime_set_active(dev->dev); /* Must be done before pm_runtime_enable()! */
> -       pm_runtime_enable(dev->dev);
>
>         dev_priv->pm_initialized = true;
>  }
> @@ -83,7 +83,6 @@ void gma_power_uninit(struct drm_device *dev)
>         if (!dev_priv->pm_initialized)
>                 return;
>
> -       pm_runtime_disable(dev->dev);
>         pm_runtime_put_noidle(dev->dev);
>  }
>
>
> As you can see all the removed lines are already taken care of by the
> PCI core, so this squashed in change really is a no-op (other then
> that it silences the "Unbalanced pm_runtime_enable!" message).
>
> Regards,
>
> Hans
>
>
>
>
> >
> >
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >> Hans de Goede (6):
> >>   drm/gma500: Wait longer for the GPU to power-down
> >>   drm/gma500: Remove runtime_allowed dead code in psb_unlocked_ioctl()
> >>   drm/gma500: Remove never set dev_priv->rpm_enabled flag
> >>   drm/gma500: Remove a couple of not useful function wrappers
> >>   drm/gma500: Rewrite power management code
> >>   drm/gma500: Remove unnecessary suspend/resume wrappers
> >>
> >>  drivers/gpu/drm/gma500/cdv_device.c    |   2 +-
> >>  drivers/gpu/drm/gma500/gma_display.c   |  19 +--
> >>  drivers/gpu/drm/gma500/gma_display.h   |   2 -
> >>  drivers/gpu/drm/gma500/oaktrail_lvds.c |   1 -
> >>  drivers/gpu/drm/gma500/power.c         | 156 +++++--------------------
> >>  drivers/gpu/drm/gma500/power.h         |  18 ---
> >>  drivers/gpu/drm/gma500/psb_drv.c       |  35 +-----
> >>  drivers/gpu/drm/gma500/psb_drv.h       |   7 +-
> >>  drivers/gpu/drm/gma500/psb_irq.c       |  15 ++-
> >>  9 files changed, 41 insertions(+), 214 deletions(-)
> >>
> >> --
> >> 2.37.2
> >>
> >
>

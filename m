Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BC542E49
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 12:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9476110E57F;
	Wed,  8 Jun 2022 10:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB30410E57F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 10:50:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y19so40643236ejq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gBlW53JmroPlYG+WaEYcbu8UHG4zMYV5OZ/65EgLEUs=;
 b=gXDjhXCasAyzTcR9mfzoF08hwBYgb8oWNDDif0VoN/WMx5VCNdxSBmk8vKmmdR1KYx
 Zovi4NtArEGde9Ou8D6qoWx/j0o3cGwhJ50E5End4pKftpq56rDOOgmtclMfLFRjCPsM
 K+jLuGkM4Pbct89QAg24mmKGMbTgbn00E2plkfBQtxUaPU5Vx3gpD1ppXub7YfclKhpu
 0iNkeEej99mC1YDi5X0xL3QCywarYZ4IPlvxdxIkJzubUh9lD9+oR3quPdoDFUWS2kbb
 PlzswA3qKG7TLKzvR8kgybqeeLTKML5W/U2IxNpt5twiH+HHPwZCcWn5Vkm9jhdROn8J
 DIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBlW53JmroPlYG+WaEYcbu8UHG4zMYV5OZ/65EgLEUs=;
 b=s//rG/BjAuOZH0PetrM1QO+27EiPTEF1qKITDCh6SxgGqQYzFE4EhSDKzKQC7FKiUJ
 Xrc3siAcm46hWH2w5EGB87eiESsUxKxdF+RtcQ9w/NBygvXP4vECQ+W6Wj6cCpdBSidq
 aZYq2HGne6KEsRa5wb1aHfeyKHk2dZs8ilrlLqAQHq+fQxQF+a3EWz+mWB6811FEJm5A
 mBU3wU2KWS/VP2KZj1QnkyUXAHGyLTLkt/1S6JVtNSFUZ2RjAM/f6jTu+CedoMwMqD8V
 btZ9bimm0YNG0X/3PIQkTM4gXAUdrqit5kOb8SbH+djNt5DWFYpitOR2fcr5fCWLQCxJ
 Sqog==
X-Gm-Message-State: AOAM533FhK3z0OqyA+lYnv0TsNx23bLTHMmBCqJDvYIBoyufYRWrPfST
 DfUQSRBUMrwF9wo0Vo80HpXQYVrtj/Lt11TgJ6gfeGJT31UTN+Pl
X-Google-Smtp-Source: ABdhPJxfXYf7pRI8kiupyRGyGlPYsEwH7XjGZlnB+Lnf7miLKTy95Bw259injmC1Ifha7+/jQjcHR1cHWHSsvUB0ZXs=
X-Received: by 2002:a17:907:1ca8:b0:70c:68ce:dade with SMTP id
 nb40-20020a1709071ca800b0070c68cedademr28144615ejc.723.1654685399212; Wed, 08
 Jun 2022 03:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <CAPY8ntDR54vaBuwQN2F_j4_rxYgkFmsxc+mKYBn0YLe8=CtxtQ@mail.gmail.com>
 <b4eb6670-79a9-eec0-bbd1-6c5a0e31ff08@samsung.com>
 <e7750409-d09e-e182-c400-75dae2343169@intel.com>
 <CAPY8ntDnvFh1oomKOq2k6i8PhePDAtS5AExK5wCD7B+vFu8d+g@mail.gmail.com>
In-Reply-To: <CAPY8ntDnvFh1oomKOq2k6i8PhePDAtS5AExK5wCD7B+vFu8d+g@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 8 Jun 2022 11:49:42 +0100
Message-ID: <CAPY8ntCBv1G7QdC5BPyS9R7n14td2knOHzigBieoshXJyoNofw@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All.

This series has been kicking around since March now. Any chance of a
review by any of the bridge maintainers or other DSI maintainers?

Converting Exynos DSI to the bridge framework seems to have issues,
but that is a separate thing to this patch set.
(It looks to be nearly there, but the check of stop state at init is
not required by the DSI spec, and is likely to be tripping things up
as it then doesn't set some registers. Contention only needs to be
checked for before sending data).

Thanks
  Dave

On Thu, 19 May 2022 at 13:56, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Marek and Andrzej
>
> On Wed, 18 May 2022 at 23:53, Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> >
> >
> >
> > On 18.05.2022 16:05, Marek Szyprowski wrote:
> > > Hi Dave,
> > >
> > > On 11.05.2022 17:47, Dave Stevenson wrote:
> > >> On Wed, 11 May 2022 at 15:58, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >>> On 05.04.2022 13:43, Dave Stevenson wrote:
> > >>>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> > >>>> <dave.stevenson@raspberrypi.com>  wrote:
> > >>>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> > >>>>> <dave.stevenson@raspberrypi.com>  wrote:
> > >>>>>> Hi All
> > >>>>> A gentle ping on this series. Any comments on the approach?
> > >>>>> Thanks.
> > >>>> I realise the merge window has just closed and therefore folks have
> > >>>> been busy, but no responses on this after a month?
> > >>>>
> > >>>> Do I give up and submit a patch to document that DSI is broken and no one cares?
> > >>> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> > >>> DSIM bridge' thread, otherwise I would miss it since I'm not involved
> > >>> much in the DRM development.
> > >>>
> > >>> This resolves most of the issues in the Exynos DSI and its recent
> > >>> conversion to the drm bridge framework. I've added the needed
> > >>> prepare_upstream_first flags to the panels and everything works fine
> > >>> without the bridge chain order hacks.
> > >>>
> > >>> Feel free to add:
> > >>>
> > >>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >> Thanks for testing it. I was almost at the stage of abandoning the patch set.
> > >>
> > >>> The only remaining thing to resolve is the moment of enabling DSI host.
> > >>> The proper sequence is:
> > >>>
> > >>> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> > >>> video enable.
> > >>>
> > >>> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> > >>> far done in the first host transfer call, which usually happens in
> > >>> panel's prepare, then the #4 happens. Then video enable is done in the
> > >>> enable callbacks.
> > >> What's your definition of host power on and host init here? What state
> > >> are you defining the DSI interface to be in after each operation?
> > > Well, lets start from the point that I'm not a DSI specialist nor I'm
> > > not the exynos-dsi author. I just played a bit with the code trying to
> > > restore proper driver operation on the various Exynos based boards I have.
>
> Is there any such thing as a DSI specialist? It seems to have many
> nasty corners that very few can really claim to fully understand (I
> don't claim to be an expert in it!).
>
> > > By the host/device power on I mean enabling their power regulators. By
> > > host init I mean executing the samsung_dsim_init() function, which
> > > basically sets the lp-11 state if I understand it right.
> > >
> > >
> > >>> Jagan wants to move it to the dsi host pre_enable() to let it work with
> > >>> DSI bridges controlled over different interfaces
> > >>> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> > >>> ).
> > >> I think I'm in agreement with Jagan.
> > >> As documented in patch 4/4:
> > >> + * A DSI host should keep the PHY powered down until the pre_enable
> > >> operation is
> > >> + * called. All lanes are in an undefined idle state up to this point, and it
> > >> + * must not be assumed that it is LP-11.
> > >> + * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
> > >> + * clock lane to either LP-11 or HS depending on the mode_flag
> > >> + * %MIPI_DSI_CLOCK_NON_CONTINUOUS.
> > > Right, this theory makes sense.
> > >
> > > However Exynos DSI for some reasons did the host initialization in the
> > > first call of the samsung_dsim_host_transfer().
> >
> > It was a way to fit exynos DSI order of initialization to the frameworks
> > present at the time it was written:
> > exynos_dsi was an drm_encoder, and it was connected to drm_panel (DSI
> > controlled panel).
> > 1. In exynos_dsi_enable host was powered on then drm_panel_prepare was
> > called.
> > 2. drm_panel_prepare called .prepare callback of the panel, which
> > powered on the panel and then requested dsi transfers to initialize panel.
> > 3. 1st dsi transfer performed dsi host init (LP-11), after that all
> > transfers started by panel performed panel initialization.
> > 4. after that control goes back to exynos_dsi_enable.
> > 5. exynos_dsi_enable starts video transfer and notify panel about it via
> > drm_panel_enable.
> > 6. .enable callback of the panel starts displaying frames (after some
> > delay).
> >
> > This construction allowed to keep proper order of hw initialization:
> > host power on, panel power on, host init, panel init, start video
> > transmission, start display frames.
> > Almost all elements of this sequence are enforced by DSI specification
> > (at least for devices controlled via dsi).
> > The only thing which I am not sure is placement of "panel power on". It
> > does not seem to be a part of DSI spec, but I am not 100% sure.
> > It could be specific to platform (mis)configuration (regulators, level
> > shifters, ...), or just dsi host init sequence tries to do too much.
> > I wonder if dropping checking stop state in exynos_dsi wouldn't solve
> > the mystery [1], or moving it to 1st transfer, maybe with(or w/o)
> > subsequent code.
>
> I was thinking along similar lines when I read Marek's email.
>
> If the panel is powered off then it may well be pulling the lanes
> down, and so the host can not achieve LP-11. However at the pre_enable
> stage there is no requirement to achieve LP-11 as there is no data
> being passed such that bus contention needs to be detected.
> Moving that test to host_transfer, where we are potentially reading
> data and there is a definite need to check for contention, would
> certainly be a useful test. I see that registers DSIM_ESCMODE_REG and
> DSIM_TIMEOUT_REG that are only set after the lanes are viewed as being
> in the "right" state, so presumably those are not being written with
> things reordered. (The return value of exynos_dsi_init_link is not
> checked, so that won't make any difference).
> Potentially test the lane state at enable too, although one could
> argue that detecting contention when sending video is of limited
> benefit as the display may be able to receive the data even if the
> host sees issues.
>
> I've had a conversation with my hardware colleagues and they see no
> reason for concern for having LP-11 driven from the host with the
> slave powered down.
>
> Checking the MIPI D-PHY spec v1.1 section 6.11 Initialization. State
> "Slave off", Line Levels "Any", so the slave is meant to handle
> anything when powered down.
> Section 4.2 Mandatory Functionality, "All functionality that is
> specified in this document and which is not explicitly stated in
> Section 5.5 shall be implemented for all D-PHY configurations." So
> that is not optional, but does rely on implementers having followed
> the spec.
>
>   Dave
>
> > Does IMX have some 'vendor code' of DSI host to compare with?
> >
> > [1]:
> > https://elixir.bootlin.com/linux/v5.15.1/source/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L860
> >
> > Regards
> > Andrzej
> >
> > > If I moved the host
> > > initialization to pre_enable (before powering the panel on), executing
> > > DSI commands failed (timeout). This issue happens on all boards I have
> > > access (Trats, Trats2, Arndale, TM2e), so this must be an issue with
> > > Exynos DSI host itself not related to particular panel/bridge.
> > >
> > > If I call samsung_dsim_init() once again, before issuing the first DSI
> > > command, then everything works fine. I've tried to check which part of
> > > that function is needed to be executed before transferring the commands,
> > > but it turned out that the complete host reset and (re)configuration is
> > > necessary. It looks that the initialization will need to be done twice,
> > > first time in the pre_enable to satisfy Jagan case, then on the first
> > > dsi transfer to make it work with real DSI panels.
> > >
> > > Here is a git repo with such change:
> > > https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework-v2
> > >
> > >
> > >>> This however fails on Exynos with DSI panels, because when dsi's
> > >>> pre_enable is called, the dsi device is not yet powered.
> > >> Sorry, I'm not following what the issue is here? DSI lanes being at
> > >> LP-11 when the sink isn't powered, so potential for leakage through
> > >> the device?
> > > I also have no idea why sending DSI commands fails if host is
> > > initialized without device being powered up first. Maybe powering it
> > > later causes some glitches on the lines? However it looks doing the
> > > initialization again on the first transfer is enough to fix it.
> > >
> > >> In which case the device should NOT set pre_enable_upstream first, and
> > >> the host gets powered up and down with each host_transfer call the
> > >> device makes in pre_enable.
> > > Doing the initialization on each host_transfer also is not an option,
> > > because in such case the panel is not initialized properly. I get no
> > > errors, but also there is no valid display on the panel in such case.
> > >
> > >> (Whilst I can't claim that I know of every single DSI device, most
> > >> datasheets I've encountered have required LP-11 on the lanes before
> > >> powering up the device).
> > >
> > >>> I've discussed
> > >>> this with Andrzej Hajda and we came to the conclusion that this can be
> > >>> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
> > >>> Then DSI client (next bridge or panel) would call it after powering self
> > >>> on, but before sending any DSI commands in its pre_enable/prepare functions.
> > >> You may as well have a mipi_dsi_host_ops call to fully control the DSI
> > >> host state, and forget about changing the pre_enable/post_disable
> > >> order. However it involves even more changes to all the panel and
> > >> bridge drivers.
> > > True. Although setting prepare_upstream_first/pre_enable_upstream_first
> > > flags also requires to revisit all the dsi panels and bridges.
> > >
> > >
> > > It looks that I've focused too much on finding a single place of the dsi
> > > initialization, what resulted in that host_init callback. I can live
> > > without it, doing the initialization twice.
> > >
> > >> If you've added an init hook, don't you also need a deinint hook to
> > >> ensure that the host is restored to the "power on but not inited"
> > >> state before device power off? Currently it feels unbalanced, but
> > >> largely as I don't know exactly what you're defining that power on
> > >> state to be.
> > > So far I had no use case for that deinit hook.
> > >
> > >
> > > Best regards
> >

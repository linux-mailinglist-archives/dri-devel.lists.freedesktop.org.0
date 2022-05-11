Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1C5237A9
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF3610EB30;
	Wed, 11 May 2022 15:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B7010EB30
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:48:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y32so4297479lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bbpCfhYDmY7kZ/jnwpuhKs42QrWTkGYXscMRJ8CibHw=;
 b=tK5Xcgqub6zvN3MF/E8twv73Qrk2U1dHY2VTzkqCSVZHO7rBoX6f5LlPFxRYP9BbKj
 2wFrJKIJEB/wX7q+cj8AtoAEPmtX07XGhnr+X9sNxo5zZs/N04rQ3P3BxVuY1AUFT0qE
 DfuC5d+ZDTk3aUj3hiHTJ7BBaHvGcSSC912EAuTNDh1UxYU2YITHeAf6KLvoZ73U80Mz
 ABn1EtzuBmb/OfXjHq1zncvapYSPVvGCr39I0G4+Qxp6g1EDZKE2g3VnJErUYqK5zHc8
 NMhoTy5TlInnOM9UTQkkfyam50mrzPVVYt1x07rxora6y2oRgx6RICzxh6mDZHj0fjlF
 D7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbpCfhYDmY7kZ/jnwpuhKs42QrWTkGYXscMRJ8CibHw=;
 b=BSPANnrIBQIqc7MvIrHMm1dZnHR3OvB/+rZa08mKgY9z9yu+UujmzE4wM8F2US8c3s
 xElGVpWZtDoOU9GQvs7ahnhTrfG7c+Vxef8TIk8lIuUiTihygWjR5z+2vrMIvz2j5CKt
 kVNMpvQsFCGN0nYEOjNwxw6mgQ93QmekWLjSkCUjsLxzjgDn87rnfNAN/AGUKy/AK6yc
 EJ00vf4/G7Q/nYu/8TZcDbcOZ472tKXzenA2v/TZJk71hWlLogP8IIc9gz8kE8B4xDCf
 01gc/la7q7ydM8qkAHaj3X5P4tTxOsY3qljAEG5AcxHYFxdXjTkAs/dDBBXo6hPW9LzO
 oiAg==
X-Gm-Message-State: AOAM531Yt9EilGXvtDvC4cyveKox4+nnWRrYWAh3pxaXOZBw+2JLQD8d
 fZgJ0/M6WFM8GZitsdsRQe/sL8MPMno2tuAQ14EXdw==
X-Google-Smtp-Source: ABdhPJzXVoNgs+lVYmLEB1lM/HeHrDu+PRrwrTWMPjjcwVwlFltq15BwQLHEQa/sKubMlzsFMgktWPCKvwPvZif87xU=
X-Received: by 2002:a19:4f02:0:b0:471:fcc4:b403 with SMTP id
 d2-20020a194f02000000b00471fcc4b403mr20422148lfb.401.1652284094758; Wed, 11
 May 2022 08:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
In-Reply-To: <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 May 2022 16:47:57 +0100
Message-ID: <CAPY8ntDR54vaBuwQN2F_j4_rxYgkFmsxc+mKYBn0YLe8=CtxtQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Wed, 11 May 2022 at 15:58, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Dave,
>
> On 05.04.2022 13:43, Dave Stevenson wrote:
> > On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> > <dave.stevenson@raspberrypi.com>  wrote:
> >> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> >> <dave.stevenson@raspberrypi.com>  wrote:
> >>> Hi All
> >> A gentle ping on this series. Any comments on the approach?
> >> Thanks.
> > I realise the merge window has just closed and therefore folks have
> > been busy, but no responses on this after a month?
> >
> > Do I give up and submit a patch to document that DSI is broken and no one cares?
>
> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> DSIM bridge' thread, otherwise I would miss it since I'm not involved
> much in the DRM development.
>
> This resolves most of the issues in the Exynos DSI and its recent
> conversion to the drm bridge framework. I've added the needed
> prepare_upstream_first flags to the panels and everything works fine
> without the bridge chain order hacks.
>
> Feel free to add:
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for testing it. I was almost at the stage of abandoning the patch set.

> The only remaining thing to resolve is the moment of enabling DSI host.
> The proper sequence is:
>
> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> video enable.
>
> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> far done in the first host transfer call, which usually happens in
> panel's prepare, then the #4 happens. Then video enable is done in the
> enable callbacks.

What's your definition of host power on and host init here? What state
are you defining the DSI interface to be in after each operation?

> Jagan wants to move it to the dsi host pre_enable() to let it work with
> DSI bridges controlled over different interfaces
> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> ).

I think I'm in agreement with Jagan.
As documented in patch 4/4:
+ * A DSI host should keep the PHY powered down until the pre_enable
operation is
+ * called. All lanes are in an undefined idle state up to this point, and it
+ * must not be assumed that it is LP-11.
+ * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
+ * clock lane to either LP-11 or HS depending on the mode_flag
+ * %MIPI_DSI_CLOCK_NON_CONTINUOUS.

> This however fails on Exynos with DSI panels, because when dsi's
> pre_enable is called, the dsi device is not yet powered.

Sorry, I'm not following what the issue is here? DSI lanes being at
LP-11 when the sink isn't powered, so potential for leakage through
the device?
In which case the device should NOT set pre_enable_upstream first, and
the host gets powered up and down with each host_transfer call the
device makes in pre_enable.

(Whilst I can't claim that I know of every single DSI device, most
datasheets I've encountered have required LP-11 on the lanes before
powering up the device).

> I've discussed
> this with Andrzej Hajda and we came to the conclusion that this can be
> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
> Then DSI client (next bridge or panel) would call it after powering self
> on, but before sending any DSI commands in its pre_enable/prepare functions.

You may as well have a mipi_dsi_host_ops call to fully control the DSI
host state, and forget about changing the pre_enable/post_disable
order. However it involves even more changes to all the panel and
bridge drivers.

If you've added an init hook, don't you also need a deinint hook to
ensure that the host is restored to the "power on but not inited"
state before device power off? Currently it feels unbalanced, but
largely as I don't know exactly what you're defining that power on
state to be.

  Dave

> I've prepared a prototype of such solution. This approach finally
> resolved all the initialization issues! The bridge chain finally matches
> the hardware, no hack are needed, and everything is controlled by the
> DRM core. This prototype also includes the Jagan's patches, which add
> IMX support to Samsung DSIM. If one is interested, here is my git repo
> with all the PoC patches:
>
> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework

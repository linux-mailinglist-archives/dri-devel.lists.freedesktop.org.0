Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912A541258
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C885810F441;
	Tue,  7 Jun 2022 19:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6D110F441
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:47:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m20so37218606ejj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 12:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4XySnnRFpt2mLi3WF6kBX9bcNdR38hrM+Wc0sglR8Cg=;
 b=infoXu0A0+jYrRow2N8uPEOn5aR6FTxU4AnpbRKgCkNQEPHJ7EpA5bIY3IDYXRcC96
 8w67nSswWKbazPfQJ3xA/EWanVl1jWTr3BjSSZCZbfl0LlSjEbdBpvJRdsD0nkJUqhos
 AZ7ffHDgLKlzqmZdnkV+L5TDPz7x0A7Bkokxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4XySnnRFpt2mLi3WF6kBX9bcNdR38hrM+Wc0sglR8Cg=;
 b=vFMCcW4UY4S2KmfqHwJPCXf13/WXoGCWfAzVhFROnAcc0ntvo5uawnW0FKAKFVYqyb
 MqD1zUSS3HF/BYpgRZfNzQ1hu58GSx4lC5UUPhM9e2vnoVNeRMeTYmgm/ZiIAYpiX4A6
 G7XXr82xhajxdx2LpF88CzcEUvlAfx56X2KIo+P328/k95mgvKo2wiZmi/8gBd5NnXqA
 6t/EkwYzv1kv6dwQOFu9JeiRsbjbjJexZYmXtAlAkvReIh3wL0If8fkUz0s3/FeNCiVs
 2KpXG0/j9OnwX8nPWdJlnZqt6qUTzLph5N5ZlAQk8XxYhp2fA3ddEPE9RabLpJlbFkXi
 2/KA==
X-Gm-Message-State: AOAM531ar5lgt5eiDkYtQpYkPthN+CtIAN/YZ6M58pu+ImFnB0U0txgo
 TBQio/d40aag7oK4eh/IzZfh+F8i4etWzoKLbWo/OA==
X-Google-Smtp-Source: ABdhPJx7A8xs8aleBgdvSi5xWCpOETJPfeuNL4Qg5b+N2o3BQoa8KBAu3aZvU9VDnXSMS0dLbWRNiE+30sBBJoViVDI=
X-Received: by 2002:a17:906:b898:b0:711:ca46:24ec with SMTP id
 hb24-20020a170906b89800b00711ca4624ecmr12821641ejb.111.1654631230795; Tue, 07
 Jun 2022 12:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <CAPY8ntDR54vaBuwQN2F_j4_rxYgkFmsxc+mKYBn0YLe8=CtxtQ@mail.gmail.com>
 <b4eb6670-79a9-eec0-bbd1-6c5a0e31ff08@samsung.com>
In-Reply-To: <b4eb6670-79a9-eec0-bbd1-6c5a0e31ff08@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 8 Jun 2022 01:16:59 +0530
Message-ID: <CAMty3ZDyy61iHufOD7rtnB0HseyxtvZJQX2qodyWcOiZXpNG_A@mail.gmail.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, May 18, 2022 at 7:35 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Dave,
>
> On 11.05.2022 17:47, Dave Stevenson wrote:
> > On Wed, 11 May 2022 at 15:58, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> On 05.04.2022 13:43, Dave Stevenson wrote:
> >>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> >>> <dave.stevenson@raspberrypi.com>  wrote:
> >>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> >>>> <dave.stevenson@raspberrypi.com>  wrote:
> >>>>> Hi All
> >>>> A gentle ping on this series. Any comments on the approach?
> >>>> Thanks.
> >>> I realise the merge window has just closed and therefore folks have
> >>> been busy, but no responses on this after a month?
> >>>
> >>> Do I give up and submit a patch to document that DSI is broken and no one cares?
> >> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> >> DSIM bridge' thread, otherwise I would miss it since I'm not involved
> >> much in the DRM development.
> >>
> >> This resolves most of the issues in the Exynos DSI and its recent
> >> conversion to the drm bridge framework. I've added the needed
> >> prepare_upstream_first flags to the panels and everything works fine
> >> without the bridge chain order hacks.
> >>
> >> Feel free to add:
> >>
> >> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Thanks for testing it. I was almost at the stage of abandoning the patch set.
> >
> >> The only remaining thing to resolve is the moment of enabling DSI host.
> >> The proper sequence is:
> >>
> >> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> >> video enable.
> >>
> >> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> >> far done in the first host transfer call, which usually happens in
> >> panel's prepare, then the #4 happens. Then video enable is done in the
> >> enable callbacks.
> > What's your definition of host power on and host init here? What state
> > are you defining the DSI interface to be in after each operation?
>
> Well, lets start from the point that I'm not a DSI specialist nor I'm
> not the exynos-dsi author. I just played a bit with the code trying to
> restore proper driver operation on the various Exynos based boards I have.
>
> By the host/device power on I mean enabling their power regulators. By
> host init I mean executing the samsung_dsim_init() function, which
> basically sets the lp-11 state if I understand it right.
>
>
> >> Jagan wants to move it to the dsi host pre_enable() to let it work with
> >> DSI bridges controlled over different interfaces
> >> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> >> ).
> > I think I'm in agreement with Jagan.
> > As documented in patch 4/4:
> > + * A DSI host should keep the PHY powered down until the pre_enable
> > operation is
> > + * called. All lanes are in an undefined idle state up to this point, and it
> > + * must not be assumed that it is LP-11.
> > + * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
> > + * clock lane to either LP-11 or HS depending on the mode_flag
> > + * %MIPI_DSI_CLOCK_NON_CONTINUOUS.
>
> Right, this theory makes sense.
>
> However Exynos DSI for some reasons did the host initialization in the
> first call of the samsung_dsim_host_transfer(). If I moved the host
> initialization to pre_enable (before powering the panel on), executing
> DSI commands failed (timeout). This issue happens on all boards I have
> access (Trats, Trats2, Arndale, TM2e), so this must be an issue with
> Exynos DSI host itself not related to particular panel/bridge.
>
> If I call samsung_dsim_init() once again, before issuing the first DSI
> command, then everything works fine. I've tried to check which part of
> that function is needed to be executed before transferring the commands,
> but it turned out that the complete host reset and (re)configuration is
> necessary. It looks that the initialization will need to be done twice,
> first time in the pre_enable to satisfy Jagan case, then on the first
> dsi transfer to make it work with real DSI panels.
>
> Here is a git repo with such change:
> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework-v2

This is worthy check, I will test it on imx8mm and integrate it into
the next version - hope this is fine for you?

Jagan.

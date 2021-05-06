Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F137560F
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 16:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E866ECBD;
	Thu,  6 May 2021 14:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842016E5A4;
 Thu,  6 May 2021 14:59:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l2so5949679wrm.9;
 Thu, 06 May 2021 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wSaLk+32rg3CosnVXZ3OFxSENaLJTNngSz/pQjentm0=;
 b=TDr/SK3adts8KqCRdXrOAuWhBFL2R0DRjqvyA1UXn2afPwkKFKbIoOjE9wllfdJtKG
 NE9qIFoX/VmsIh4QfVXO1MjaaEdSUPjxI4lqpbFnOVMqI6+1JU12rn/HS4ZyeNLWc1xD
 8NoM4r42X0rc9PuDo119m9NzVTe06CH+LvAhOpKYtiNoF5GNuqR7AosrsWBdSBqFaHp1
 yTE9hO8Ph2lVMYV9Wzu7MajexgTWz1/uQO3nb2EnK/u75Ng+VmYtT5aUDnvaTIvCoXi1
 ycrr2DMY+vyS7LwopS8itYc+kMwDeKNDkXXiIdda1Ku3QwjCnpNmxHHzzGpua/GIHaZN
 yOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wSaLk+32rg3CosnVXZ3OFxSENaLJTNngSz/pQjentm0=;
 b=qUpBnydc7YI8Nporn7pOjPy41xcmV2ODOKBT+kn4SGrWvGttRlcSIbavX4k1P9INv3
 VKmNcGQkpMopQRySM4qr8kQ04Kus1ZuoFdGXVEa9GgMUD9cSN+BB8XqOI1jVH6U2fN/e
 1fkRe2eX7sAidglZjFUadzbPDshe+UZOcbd3jyebkDmsklRl6NYuS7uAdwZg3UhEQjBg
 1/uBDEBDfkEbeVYqEnkFZQvixm5rNkiaqb/Qf7wUAocBJzmtCSp3TCx7tEJLgsYGjuqD
 xba8sdH/+MzxVZCr54fAXVmRm5Ot2gxFPuYDBGHdraoSEd6X2nrMXjKA47uz1lEKtPJC
 /DOw==
X-Gm-Message-State: AOAM5337fTqc3PW6TZl5shgAXWcufzeP5KOkFykpcWb09U4+PcGyRVFT
 14aap/Kgg7bNPZtnN8t614YZrW578oLM6DkQVW4=
X-Google-Smtp-Source: ABdhPJwQrt+vT+wa/yTsTjUhpz9zeklgME/58JJrvDTVgBW4lARE/MStRnDfNwwlO1tLx3fEFuiv8qZqLUW1xIY42pk=
X-Received: by 2002:adf:f74d:: with SMTP id z13mr5762382wrp.147.1620313140138; 
 Thu, 06 May 2021 07:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
 <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
 <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
In-Reply-To: <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 6 May 2021 08:02:40 -0700
Message-ID: <CAF6AEGuPpihBj9GQbuPKXuZvY=+Bid-pSB9XPP2ZXNQvHEm-Ag@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
To: sbillaka@codeaurora.org
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 5, 2021 at 11:47 PM <sbillaka@codeaurora.org> wrote:
>
> On 2021-05-05 15:31, Dmitry Baryshkov wrote:
> > Hi,
> >
> > On Wed, 5 May 2021 at 11:17, Sankeerth Billakanti
> > <sbillaka@codeaurora.org> wrote:
> >>
> >> These patches add support for the next generation eDP driver on
> >> SnapDragon
> >> with dpu support. The existing eDP driver cannot support the new eDP
> >> hardware. So, to maintain backward compatibility, the older eDP driver
> >> is
> >> moved to v200 folder and the new generation eDP driver is added in
> >> the v510 folder.
> >
> > What exactly does this version correspond to?
> > I assume that v510 corresponds to sdmshrike/sc8180x. Is it right?
> [Sankeerth] This is for sc7280.
>
> > Is it really so specific, or just v2/v5 would be enough? Not to
> > mention that this is the MDP/ version, while other blocks tend to use
> > block-specific versions/ids.
> [Sankeerth] I can rename it as edp-v1 and edp-v2. Edp v1 is very old
> chip and there is considerable HW delta between v1 and v2. So, we want
> to separate the driver. We followed similar model for DPU driver where,
> MDP4, MDP5 and DPU have separate folders. EDP v1 belongs to MDP4
> generation.

Bjorn brought up the idea of just dropping the existing drm/msm/edp..
since the efforts to upstream the platform it worked on (8084?)
fizzled out, I don't think there is any device which uses it.

But it does sound like edp is a subset of the the newer dp driver, so
seems sort of like the better approach would be to add edp support to
dp.  I believe Bjorn has something based on this approach which is
working for sc8280 (although not sure if it is in shape to post
patches yet)

BR,
-R

> >
> > Also, how much does it differ from the current DP core supported via
> > drivers/gpu/drm/msm/dp ?
> [Sankeerth] eDP is a native controller like DP but does not have audio,
> content protection and interoperability requirement. Upstream already
> supports eDP as a new interface driver found here:
> drivers/gpu/drm/msm/edp.
> I wanted to add the new controller driver as part of that folder.
>
> >
> > First two patches did not make it to the linux-msm, so I can not
> > comment on each of the lines.
> [Sankeerth] I am also not sure why they did not make it to patchwork. I
> will repost them.
>
> > However just my few cents (other reviewers might disagree though):
> >
> > - I see little benefit in renaming the folders just for the sake of
> > renaming. You can put your code in drivers/gpu/drm/msm/edp-v510, if
> > you really insist on that. Note that for all other (even incompatible)
> > hardware types we still use single level of folders.
> >
> > - Also I see that significant parts of code (e.g. AUX, bridge,
> > connector, maybe more) are just c&p of old edp code pieces. Please
> > share the code instead of duplicating it.
> [Sankeerth] It is a baseline driver. As we add more features, it will
> considerably deviate a lot. The effort seems to be very high to maintain
> the common portion of code as I expect a lot of deviation.
> >
> > - Please consider updating register definitions in xml form and then
> > providing both changed xml files (to mesa project (?)) and generated
> > headers into the kernel.
> [Sankeerth] I followed what was done in the DP driver at
> /drivers/gpu/drm/msm/dp. I need to explore the xml approach to generate
> the register definitions.
> >
> > - Please consider using clk_bulk_* functions instead of using
> > dss_module_power. I'm going to send a patchset reworking current users
> > to use the generic clk_bulk_* function family.
> [Sankeerth] I will explore and rebase after your patch is available.
> >
> > - In generic, this eDP clock handling seems to match closely DP clocks
> > handling (with all the name comparison, etc). Consider moving this to
> > a generic piece of code
> >
> > - PHY seems to be a version of QMP PHY. Please use it, like it was
> > done for the DP itself. There is support for combined USB+DP PHYs
> > (both v3 and v4), so it should be possible to extend that for eDP.
> [Sankeerth] The DP phy is a combophy which supports both usb and dp phy
> concurrently, unlike eDP phy which is specific to only the eDP
> controller in sc7280. So, I implemented the edp phy sequences in the
> same folder.
> >
> >
> >> These are baseline changes with which we can enable display. The new
> >> eDP
> >> controller can also support additional features such as backlight
> >> control,
> >> PSR etc. which will be enabled in subsequent patch series.
> >>
> >> Summary of changes:
> >> DPU driver interface to the new eDP v510 display driver.
> >> New generation eDP controller and phy driver implementation.
> >> A common interface to choose enable the required eDP driver.
> >>
> >> Sankeerth Billakanti (3):
> >>   drm/msm/edp: support multiple generations of edp hardware
> >>   drm/msm/edp: add support for next gen edp
> >>   drm/msm/disp/dpu1: add support for edp encoder
> >>
> >>  drivers/gpu/drm/msm/Makefile                      |   19 +-
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |    7 +-
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   33 +
> >>  drivers/gpu/drm/msm/edp/edp.c                     |  198 ---
> >>  drivers/gpu/drm/msm/edp/edp.h                     |   78 -
> >>  drivers/gpu/drm/msm/edp/edp.xml.h                 |  380 -----
> >>  drivers/gpu/drm/msm/edp/edp_aux.c                 |  264 ----
> >>  drivers/gpu/drm/msm/edp/edp_bridge.c              |  111 --
> >>  drivers/gpu/drm/msm/edp/edp_common.c              |   38 +
> >>  drivers/gpu/drm/msm/edp/edp_common.h              |   47 +
> >>  drivers/gpu/drm/msm/edp/edp_connector.c           |  132 --
> >>  drivers/gpu/drm/msm/edp/edp_ctrl.c                | 1375
> >> ------------------
> >>  drivers/gpu/drm/msm/edp/edp_phy.c                 |   98 --
> >>  drivers/gpu/drm/msm/edp/v200/edp.xml.h            |  380 +++++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200.c           |  210 +++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200.h           |   70 +
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c       |  264 ++++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c    |  111 ++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c |  132 ++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c      | 1375
> >> ++++++++++++++++++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c       |   98 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583
> >> +++++++++++++++++++++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
> >>  29 files changed, 6207 insertions(+), 2643 deletions(-)
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.h
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp.xml.h
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.h
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h
> >>
> >> --
> >> The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora
> >> Forum, a Linux Foundation Collaborative Project
> >>
> >
> >
> > --
> > With best wishes
> > Dmitry

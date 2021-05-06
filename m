Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DD375396
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 14:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933EE6EB17;
	Thu,  6 May 2021 12:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3DC6EAAE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 12:15:05 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id j17so3764200qtx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUBNP/diVecNRarR8rXDAXXdwLBzzCz+wT6lGIZyhBQ=;
 b=p1wmcAirf8twjh7j4y7n7/sNMOvDFv4zxvvOAWgwJShsPTDyyXeMARuPmDbEY9XNIM
 H10rT0OYPeoV/WjCySiW7Etdr+fC7J4j+6FHE9OmB9e0xSj/bbk8rM8c/7DOs2oTEJha
 EX4gyEFW9VqvvxxGJkalzJeo473Sd/b5cbmoaVqCPgQAD3aBNc2eK998BD78Ilyl/mpp
 EMCprNWl3yaQOomGQ71I1HZvhb4vDGMtczu46gXwhI63qnE+IMB2zWg8z2lEf3/xOLK0
 D4w6BgXXlYtkXG3HmPO8cfSpf6JprtlI0SRFna2WFHqVQCdDPG15VKiliGetWq6LAsxx
 x1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUBNP/diVecNRarR8rXDAXXdwLBzzCz+wT6lGIZyhBQ=;
 b=VQdiWyRpSocAXsHq2Yc8TwXJfXV/qw17cnGRitZsaBm47gscM03WtvxEXoIRKBiFUA
 YooJePCKlITztz/8nGVuUOTWVxYh1TMLfUfo0NTBBCr2EdVQLAIda3f6CzRFQ9tPhWQV
 kdWR1ehuUiSTfVQIKzWLeYz9ZhMf58iG8SF345ca5CXmZ26plQRN9tIjb6qhbN25FCbB
 AcHmHxdQxsiagD+SJcxzgc4JH2cPWg/wihb1TOq0m/5tGltqBpWqb28Fw3ebyhwAi019
 a6OWMG+LUGLyR6Y1/D0fjTt7bqE79NpUAXJ+5r1+uStWFwZb6GgZCj3tnVgcTcX53XB5
 zb4w==
X-Gm-Message-State: AOAM531UUSHxmlFhpoiCZeZMqdNDvzFWQu02tguOElzupyGEnrglH8jC
 z6cuS/Y+lmdDduKliMKVl/D12lL6RT+MMZUEwAAozA==
X-Google-Smtp-Source: ABdhPJyCvZQdhDSj+wJuU6w9mImpPUuOhpP4irakqX87z+tfX/6pvqyAn0DJxf5+abGHLFWRCSX4Zsgc1lfgktd5Ki8=
X-Received: by 2002:a05:622a:1716:: with SMTP id
 h22mr3764154qtk.273.1620303304595; 
 Thu, 06 May 2021 05:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
 <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
 <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
In-Reply-To: <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 May 2021 15:14:13 +0300
Message-ID: <CAA8EJpq7c34JD1q-iqe8eLujfXCdHeLXyUSMnGtaABHs5LSi8g@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
To: Sankeerth Billakanti <sbillaka@codeaurora.org>
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
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 May 2021 at 09:47, <sbillaka@codeaurora.org> wrote:
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

I'd say, just leave old eDP as is, add eDPv2 in a separate folder.

> > Also, how much does it differ from the current DP core supported via
> > drivers/gpu/drm/msm/dp ?
> [Sankeerth] eDP is a native controller like DP but does not have audio,
> content protection and interoperability requirement. Upstream already
> supports eDP as a new interface driver found here:
> drivers/gpu/drm/msm/edp.
> I wanted to add the new controller driver as part of that folder.

This does not answer if there is significant difference from the
supported DP core.
Does it differ significantly or not?

> > First two patches did not make it to the linux-msm, so I can not
> > comment on each of the lines.
> [Sankeerth] I am also not sure why they did not make it to patchwork. I
> will repost them.

Because your patches are huge and thus they do not pass size limits
for linux-arm-msm ML.
Reposting didn't help of course. In future, if you plan to do mass
renaming, please pass -M -C to git-format-patch (or git send-email if
you use it directly).

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

Can we find support for this eDP core in the display drivers pack somewhere?

> >
> > - Please consider updating register definitions in xml form and then
> > providing both changed xml files (to mesa project (?)) and generated
> > headers into the kernel.
> [Sankeerth] I followed what was done in the DP driver at
> /drivers/gpu/drm/msm/dp. I need to explore the xml approach to generate
> the register definitions.

We'd need to convert them to xml too.

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

Please use the tthe qmp driver for qmp phys. Judging from the register
definitions, your hardware is definitely the QMP v4. Initial support
for DP on this generation has been merged during this merge window.
Feel free to correct/extend it.

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



-- 
With best wishes
Dmitry

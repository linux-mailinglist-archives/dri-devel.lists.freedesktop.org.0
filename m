Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D34373842
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603276E47B;
	Wed,  5 May 2021 10:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9AF6E47B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 10:01:37 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id o27so903852qkj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m5HtWmAnig6lw4RtHlzbQQmHRo3yOMqpgy7bbvUw2Fc=;
 b=JniwsF2H3MzPZR21KHPne2QKpqm3PVEUXKzmCmnkH7RlYzmTZq/6/RHJBZNbOtMn/9
 vMN47dV1ItkRww5AhS3qakC0YRKHj3jMfAeGsM3MmGU7lM/CPbHpR2qkV9OlGAS48eIq
 z+B/zbykJn3on8cqFqO54/okzAmUQgW/4UlM1FCJThqgZ303ftdEUZZPLpfs2Yfc33ua
 Kf/BVZz51zGRZU8MqvpIAc+KopwOpm8DzLi55iCBaEsCz1xAo5nv+KGkynbWMIXPmrww
 tg14uieIucJf7Rj2PNw7qgJKtR7OIDYr8cAllmA5f5H2hyvIhvPWxXhQ/CDplX2oyPnh
 SWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m5HtWmAnig6lw4RtHlzbQQmHRo3yOMqpgy7bbvUw2Fc=;
 b=Dej+k/fxDU3OW2hoOjQFur7ux7qY9NQ+c5n80KExv8TN2oi4deIntRrzIKYBknRy8R
 pDBo7YT+cAS+NZdPxGDygcHXAxXrbORAis61tkJA/MGl04+1sICtYWbZQk3C5j976QVc
 CnXMBoUfLn2I+DSvWGlgps7qzFsAfvJTqx6HvehtMf4GO1iX2s1y4dV6ZxmaoHrX5RB/
 LoYSKpNdCoW67IEEucOJvCCjos6P+U1J62zrIkhDCcSSg5NQzzrigzns3Gk2tu6gm/wz
 1RF8+oK3VmKmJlsvw/z6sCQ/KOaVbIj3VFyXRb0djgLS2+nIgcSda7Jf7aAo6bL5bxlv
 HOOg==
X-Gm-Message-State: AOAM533Izoox112ep5nMKmHanpEREcjKlYXIfRcmT/svv5a2BZ7G1bt4
 0jtkUanT/c8nKMgrFUOqauqpoAQ3tZx63ld+SwS0JQ==
X-Google-Smtp-Source: ABdhPJzvlSeiw16CrlySSngkvytIk52sMnf7quC/lBLqjW87Oju0lcBCJeZcUbsFMc/Zx3Q5B4XRt+ZghNjIBeYr9g4=
X-Received: by 2002:a37:5945:: with SMTP id n66mr29120690qkb.138.1620208896828; 
 Wed, 05 May 2021 03:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
In-Reply-To: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 May 2021 13:01:25 +0300
Message-ID: <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
To: Sankeerth Billakanti <sbillaka@codeaurora.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 5 May 2021 at 11:17, Sankeerth Billakanti
<sbillaka@codeaurora.org> wrote:
>
> These patches add support for the next generation eDP driver on SnapDragon
> with dpu support. The existing eDP driver cannot support the new eDP
> hardware. So, to maintain backward compatibility, the older eDP driver is
> moved to v200 folder and the new generation eDP driver is added in
> the v510 folder.

What exactly does this version correspond to?
I assume that v510 corresponds to sdmshrike/sc8180x. Is it right?
Is it really so specific, or just v2/v5 would be enough? Not to
mention that this is the MDP/ version, while other blocks tend to use
block-specific versions/ids.

Also, how much does it differ from the current DP core supported via
drivers/gpu/drm/msm/dp ?

First two patches did not make it to the linux-msm, so I can not
comment on each of the lines.
However just my few cents (other reviewers might disagree though):

- I see little benefit in renaming the folders just for the sake of
renaming. You can put your code in drivers/gpu/drm/msm/edp-v510, if
you really insist on that. Note that for all other (even incompatible)
hardware types we still use single level of folders.

- Also I see that significant parts of code (e.g. AUX, bridge,
connector, maybe more) are just c&p of old edp code pieces. Please
share the code instead of duplicating it.

- Please consider updating register definitions in xml form and then
providing both changed xml files (to mesa project (?)) and generated
headers into the kernel.

- Please consider using clk_bulk_* functions instead of using
dss_module_power. I'm going to send a patchset reworking current users
to use the generic clk_bulk_* function family.

- In generic, this eDP clock handling seems to match closely DP clocks
handling (with all the name comparison, etc). Consider moving this to
a generic piece of code

- PHY seems to be a version of QMP PHY. Please use it, like it was
done for the DP itself. There is support for combined USB+DP PHYs
(both v3 and v4), so it should be possible to extend that for eDP.


> These are baseline changes with which we can enable display. The new eDP
> controller can also support additional features such as backlight control,
> PSR etc. which will be enabled in subsequent patch series.
>
> Summary of changes:
> DPU driver interface to the new eDP v510 display driver.
> New generation eDP controller and phy driver implementation.
> A common interface to choose enable the required eDP driver.
>
> Sankeerth Billakanti (3):
>   drm/msm/edp: support multiple generations of edp hardware
>   drm/msm/edp: add support for next gen edp
>   drm/msm/disp/dpu1: add support for edp encoder
>
>  drivers/gpu/drm/msm/Makefile                      |   19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |    7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   33 +
>  drivers/gpu/drm/msm/edp/edp.c                     |  198 ---
>  drivers/gpu/drm/msm/edp/edp.h                     |   78 -
>  drivers/gpu/drm/msm/edp/edp.xml.h                 |  380 -----
>  drivers/gpu/drm/msm/edp/edp_aux.c                 |  264 ----
>  drivers/gpu/drm/msm/edp/edp_bridge.c              |  111 --
>  drivers/gpu/drm/msm/edp/edp_common.c              |   38 +
>  drivers/gpu/drm/msm/edp/edp_common.h              |   47 +
>  drivers/gpu/drm/msm/edp/edp_connector.c           |  132 --
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                | 1375 ------------------
>  drivers/gpu/drm/msm/edp/edp_phy.c                 |   98 --
>  drivers/gpu/drm/msm/edp/v200/edp.xml.h            |  380 +++++
>  drivers/gpu/drm/msm/edp/v200/edp_v200.c           |  210 +++
>  drivers/gpu/drm/msm/edp/v200/edp_v200.h           |   70 +
>  drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c       |  264 ++++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c    |  111 ++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c |  132 ++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c      | 1375 ++++++++++++++++++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c       |   98 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
>  drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583 +++++++++++++++++++++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
>  29 files changed, 6207 insertions(+), 2643 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.c
>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp.xml.h
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.h
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h
>
> --
> The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
>


--
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

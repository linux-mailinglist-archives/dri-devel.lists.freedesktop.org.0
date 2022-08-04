Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD858A013
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 19:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39214BAD1;
	Thu,  4 Aug 2022 17:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6108E14B2A7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 17:54:53 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t15so290468ilm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Q94Q2VDlGnfmsIVyKku4OjRypxckGbu+KvrwMMNdhgs=;
 b=lvlLlE7olQ5iMWyiRKxfNMtkZzWDdxp8/mVxNcRkMZH6idmzmJ+atn9c5BDlpGUrKu
 FVhK6HEEUsRFAHOdZY+MRmjSYBywMpoNw2sneaMMNrqkdn8AZoP1vdPmR1Ls7aHDiEyc
 l5HOCLI+BuYNahdSsPJrSNvwqhvEx7O6pe8qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Q94Q2VDlGnfmsIVyKku4OjRypxckGbu+KvrwMMNdhgs=;
 b=8H3EO55jPkf6DKqnVfWbuCmXgGvGSEyXLbKORIH55DBh92S81APTekPP1Pzy925EJ2
 Gc3YFWqy/1w4emaefTY3JhwlFQ3aqLBbqk+DWejnWIEySZaJPj5tssNjkPlAkrEwWGEA
 pI1lkcLWJhawKGqhik8nIOOkMQovXOHgXIfCLMP8x+hPfl/XT0jg7dWCQMJlZRvuuxxv
 REGcf6EDvII7XvyVS2rrHjEVtKAyst0rNsDCl+hQF418px76HZG1VyjbSIH/QZRfERgY
 Tnz6A5Hup8hUMW2KyhtmjUybM5aFf4wg3fqQpi5rR1VaoWu+djs1108xpfzKg8PIMY8K
 MJAg==
X-Gm-Message-State: ACgBeo26xGB4aN6OZ954iv1uHPkAWlKMOjZZeV2QNfX8m4eGphjgZpge
 kR5T+qbxTASO61lUTQu+/EtTsghb6/xA68Z4
X-Google-Smtp-Source: AA6agR4JEPxqX+sIK9KdwAWDVwmIXWKyD91yLKh67COo7ieyjynflc8r4btZ5n8Sn8SHKHPcnbWVLQ==
X-Received: by 2002:a05:6e02:1a49:b0:2dc:7230:29fd with SMTP id
 u9-20020a056e021a4900b002dc723029fdmr1391058ilv.82.1659635692431; 
 Thu, 04 Aug 2022 10:54:52 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54]) by smtp.gmail.com with ESMTPSA id
 k18-20020a023352000000b0032b3a7817acsm681412jak.112.2022.08.04.10.54.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 10:54:52 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id p82so273415iod.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:54:51 -0700 (PDT)
X-Received: by 2002:a05:6638:2614:b0:33f:5bc2:b385 with SMTP id
 m20-20020a056638261400b0033f5bc2b385mr1356611jat.246.1659635690978; Thu, 04
 Aug 2022 10:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=U_GStziLOCVLs_FC_2Vr=ykGfbb4ZtUp79iV8V=B0cEA@mail.gmail.com>
 <CAG3jFyv3up0o4S+UYMKaAjanKL6hxCNtEa5zQTQEeNREab-NRA@mail.gmail.com>
In-Reply-To: <CAG3jFyv3up0o4S+UYMKaAjanKL6hxCNtEa5zQTQEeNREab-NRA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Aug 2022 10:54:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VL2ATy=Ap5fAVxMYZZ5G6_8pdFGw=gdOc=PuqiOPHMow@mail.gmail.com>
Message-ID: <CAD=FV=VL2ATy=Ap5fAVxMYZZ5G6_8pdFGw=gdOc=PuqiOPHMow@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add PSR support for eDP
To: Robert Foss <robert.foss@linaro.org>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 4, 2022 at 9:21 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Fri, 29 Jul 2022 at 02:22, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
> > <quic_vpolimer@quicinc.com> wrote:
> > >
> > > Changes in v2:
> > >   - Use dp bridge to set psr entry/exit instead of dpu_enocder.
> > >   - Don't modify whitespaces.
> > >   - Set self refresh aware from atomic_check.
> > >   - Set self refresh aware only if psr is supported.
> > >   - Provide a stub for msm_dp_display_set_psr.
> > >   - Move dp functions to bridge code.
> > >
> > > Changes in v3:
> > >   - Change callback names to reflect atomic interfaces.
> > >   - Move bridge callback change to separate patch as suggested by Dmitry.
> > >   - Remove psr function declaration from msm_drv.h.
> > >   - Set self_refresh_aware flag only if psr is supported.
> > >   - Modify the variable names to simpler form.
> > >   - Define bit fields for PSR settings.
> > >   - Add comments explaining the steps to enter/exit psr.
> > >   - Change DRM_INFO to drm_dbg_db.
> > >
> > > Changes in v4:
> > >   - Move the get crtc functions to drm_atomic.
> > >   - Add atomic functions for DP bridge too.
> > >   - Add ternary operator to choose eDP or DP ops.
> > >   - Return true/false instead of 1/0.
> > >   - mode_valid missing in the eDP bridge ops.
> > >   - Move the functions to get crtc into drm_atomic.c.
> > >   - Fix compilation issues.
> > >   - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
> > >   - Check for crtc state enable while reserving resources.
> > >
> > > Changes in v5:
> > >   - Move the mode_valid changes into a different patch.
> > >   - Complete psr_op_comp only when isr is set.
> > >   - Move the DP atomic callback changes to a different patch.
> > >   - Get crtc from drm connector state crtc.
> > >   - Move to separate patch for check for crtc state enable while
> > > reserving resources.
> > >
> > > Changes in v6:
> > >   - Remove crtc from dpu_encoder_virt struct.
> > >   - fix crtc check during vblank toggle crtc.
> > >   - Misc changes.
> > >
> > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> > > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > >
> > > Vinod Polimera (10):
> > >   drm/msm/disp/dpu: clear dpu_assign_crtc and get crtc from connector
> > >     state instead of dpu_enc
> > >   drm: add helper functions to retrieve old and new crtc
> > >   drm/msm/dp: use atomic callbacks for DP bridge ops
> > >   drm/msm/dp: Add basic PSR support for eDP
> > >   drm/msm/dp: use the eDP bridge ops to validate eDP modes
> > >   drm/bridge: use atomic enable/disable callbacks for panel bridge
> > >   drm/bridge: add psr support for panel bridge callbacks
> > >   drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
> > >     functions
> > >   drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
> > >   drm/msm/disp/dpu: check for crtc enable rather than crtc active to
> > >     release shared resources
> > >
> > >  drivers/gpu/drm/bridge/panel.c              |  68 ++++++++--
> > >  drivers/gpu/drm/drm_atomic.c                |  60 +++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  17 ++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  56 +++++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 --
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   2 +-
> > >  drivers/gpu/drm/msm/dp/dp_catalog.c         |  81 ++++++++++++
> > >  drivers/gpu/drm/msm/dp/dp_catalog.h         |   4 +
> > >  drivers/gpu/drm/msm/dp/dp_ctrl.c            |  73 +++++++++++
> > >  drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +
> > >  drivers/gpu/drm/msm/dp/dp_display.c         |  31 +++--
> > >  drivers/gpu/drm/msm/dp/dp_display.h         |   2 +
> > >  drivers/gpu/drm/msm/dp/dp_drm.c             | 184 ++++++++++++++++++++++++++--
> > >  drivers/gpu/drm/msm/dp/dp_drm.h             |   9 +-
> > >  drivers/gpu/drm/msm/dp/dp_link.c            |  36 ++++++
> > >  drivers/gpu/drm/msm/dp/dp_panel.c           |  22 ++++
> > >  drivers/gpu/drm/msm/dp/dp_panel.h           |   6 +
> > >  drivers/gpu/drm/msm/dp/dp_reg.h             |  27 ++++
> > >  include/drm/drm_atomic.h                    |   7 ++
> > >  19 files changed, 631 insertions(+), 65 deletions(-)
> >
>
> Which tree does this series apply to?

It ought to apply to msm-next, but as I mentioned in my reply to patch
#1 it doesn't apply to the top of msm-next. I think I also had to
manually apply a few of the later patches with "patch -p1".

-Doug

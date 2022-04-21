Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE1A50A6B8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 19:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E9010E3E9;
	Thu, 21 Apr 2022 17:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68FA10E3E9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 17:12:23 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f17so7359027edt.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2MPNpuQIn58xclaII7JLtz3726FMV8Uc3tMH6h6B8NI=;
 b=bBNfsfaX5+t397nY8krJ6rOY+BwUEqeZAxmKxALGPGTEvqP18XUnW+RBq+8533S2Cx
 4EV8TOqeVZ6InzOy+Clk6PoZZcP733fPrCreUdVWX5hsQ86zskl7VuVo459prXNFybb1
 Cgr3GdH/n45QIxV4RqjZzyZdx/NuBOURr5Vwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2MPNpuQIn58xclaII7JLtz3726FMV8Uc3tMH6h6B8NI=;
 b=aeC2h3x1SvPAsez2Y6b94jy4O8ZFwv6Owhji9eJIn0t1NAMkPkQunyIDSz6xH8DYin
 VqO4uUr9hdl9jAFOhy67NCvMFCfm38Ky4P6TIWGWXq5FFQYTVtBKmNWchwDfCBEvkaNk
 blCuHyHThNoXDCk9pTfdLDjgz94TivsR4Rn9n5UP7NhiA9pJLzTQoHcbYdgWO7Q1bTX2
 lN0pPLX9O9q4ZuAQQHtNpOh9DYQeMg1IkahlLM8WYJEZGRnPZKTSU/x9NNtq3qhLpVgp
 Vzooo4rdoo5l3TUiqu0JVF2UXqORAvNI//JVqn6IREv3OtX77J1AXSEcCz0CXMg1rCJj
 luRg==
X-Gm-Message-State: AOAM531nH2u/FYkEpdMvXUz/WOT+fqwpnp4mOayaB7J/6GoVFLnOK7eO
 rD+IUxCLrHBlotkznAq/57pGNFZ21qObD1W2Auk=
X-Google-Smtp-Source: ABdhPJyk23b+k9R3/0bYU8/ZGOIxM4fAUXXtBtEm56g7cKsOIVHQHZ2JKQVmY+ZouKXdMO7ha6fl9g==
X-Received: by 2002:a05:6402:274b:b0:423:fe73:95a0 with SMTP id
 z11-20020a056402274b00b00423fe7395a0mr609040edd.224.1650561142522; 
 Thu, 21 Apr 2022 10:12:22 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 vr7-20020a170906bfe700b006e8325fe130sm7878331ejb.31.2022.04.21.10.12.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:12:22 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 r4-20020a05600c35c400b0039295dc1fc3so3854806wmq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:12:22 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr9600453wmq.34.1650561141633; Thu, 21 Apr
 2022 10:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UVmUG0t-8wFXT-NT1-naojeJ_gcd8eEVr96AnMos0m4A@mail.gmail.com>
 <MW4PR02MB71869CCA50E1706926C4B6FAE1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71869CCA50E1706926C4B6FAE1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Apr 2022 10:12:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcqaESoZTU1_FBzZ3XGFmoKwmdm_zaAw7QEtc51wcewQ@mail.gmail.com>
Message-ID: <CAD=FV=WcqaESoZTU1_FBzZ3XGFmoKwmdm_zaAw7QEtc51wcewQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
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
 <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 21, 2022 at 9:39 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Doug,
>
> >On Thu, Apr 21, 2022 at 7:37 AM Sankeerth Billakanti
> ><quic_sbillaka@quicinc.com> wrote:
> >>
> >> The panel-edp enables the eDP panel power during probe, get_modes and
> >> pre-enable. The eDP connect and disconnect interrupts for the eDP/DP
> >> controller are directly dependent on panel power. As eDP display can
> >> be assumed as always connected, the controller driver can skip the eDP
> >> connect and disconnect interrupts. Any disruption in the link status
> >> will be indicated via the IRQ_HPD interrupts.
> >>
> >> So, the eDP controller driver can just enable the IRQ_HPD and replug
> >> interrupts. The DP controller driver still needs to enable all the
> >> interrupts.
> >>
> >> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> >> ---
> >> Changes in v8:
> >>   - add comment explaining the interrupt status return
> >>
> >> Changes in v7:
> >>   - reordered the patch in the series
> >>   - modified the return statement for isr
> >>   - connector check modified to just check for eDP
> >>
> >>  drivers/gpu/drm/msm/dp/dp_catalog.c | 18 ++++++++++++------
> >> drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
> >>  2 files changed, 33 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index fac815f..3a298e9 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -569,10 +569,6 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog
> >> *dp_catalog)
> >>
> >>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
> >>
> >> -       /* enable HPD plug and unplug interrupts */
> >> -       dp_catalog_hpd_config_intr(dp_catalog,
> >> -               DP_DP_HPD_PLUG_INT_MASK |
> >DP_DP_HPD_UNPLUG_INT_MASK, true);
> >> -
> >>         /* Configure REFTIMER and enable it */
> >>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
> >>         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer); @@
> >> -599,13 +595,23 @@ u32 dp_catalog_hpd_get_intr_status(struct
> >> dp_catalog *dp_catalog)  {
> >>         struct dp_catalog_private *catalog = container_of(dp_catalog,
> >>                                 struct dp_catalog_private, dp_catalog);
> >> -       int isr = 0;
> >> +       int isr, mask;
> >>
> >>         isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
> >>         dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
> >>                                  (isr & DP_DP_HPD_INT_MASK));
> >> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
> >>
> >> -       return isr;
> >> +       /*
> >> +        * REG_DP_DP_HPD_INT_STATUS reports the status of all interrupts
> >> +        * irrespective of their masked status. The HW interrupt will not be
> >> +        * generated if an interrupt is masked. However, the interrupt status
> >> +        * bit in the register will still be set. The eDP controller driver
> >> +        * masks the plug and unplug interrupts unlike DP controller which
> >> +        * unmasks all the interrupts. So, do not report the status of the
> >> +        * masked interrupts.
> >> +        */
> >> +       return isr & (mask | ~DP_DP_HPD_INT_MASK);
> >
> >What's still missing in your comments is why you aren't just doing "return isr &
> >mask;". In other words, why is the API for HPD bits different from the API for
> >non-HPD bits? What code out there wants to know about non-HPD interrupts
> >even if they are masked?
>
> The mask register bitfields are different from the INT_STATUS register.
> The INT_STATUS register has additional bits [31:28] which indicates the HPD state machine
> status and [3:0] indicates the actual generated/set interrupt. The fields [3:0] are similar to
> the mask and ack interrupts.
>
> #define DP_DP_HPD_STATE_STATUS_CONNECTED        (0x40000000)
> #define DP_DP_HPD_STATE_STATUS_PENDING          (0x20000000)
> #define DP_DP_HPD_STATE_STATUS_DISCONNECTED     (0x00000000)
> #define DP_DP_HPD_STATE_STATUS_MASK             (0xE0000000)
>
> So, earlier I returned isr & (mask | DP_DP_HPD_STATE_STATUS_MASK);
>
> Actually, there is no reason to do this. We can just do the below:
> return isr & mask;
>
> >
> >Actually, thinking about this more, my preference would be this:
> >
> >a) Rename the existing function to dp_catalog_hpd_get_intr_status_raw()
> >
> >b) Create a new function called dp_catalog_hpd_get_intr_status() whose
> >implementation is:
> >
> >  return dp_catalog_hpd_get_intr_status_raw() & mask;
> >
> >Then any callers who care about the raw status can be changed to call
> >dp_catalog_hpd_get_intr_status_raw(). If no callers need
> >dp_catalog_hpd_get_intr_status_raw() then you don't actually need to
> >create this function.
> >
>
> There is no caller for raw status. All interrupts are unmasked for DP.
> While handling the aux interrupts generated during the transfer call from panel probe,
> we read that the HPD interrupt status [3:0] bit0 is set and proceed to handle connect like DP.
> We experimented to find out that the connect interrupt is not generated but just the status
> bit is set.
>
> As the interrupts are generated over a single MDSS line, the controller driver has to read all the
> interrupt status registers and handle all the set interrupt bits. So, while handling aux transfer
> interrupts, we were proceeding to handle connect interrupt also as a consequence.

Ah, I see. There aren't other _interrupts_ in this register. There's
just other status info that someone jammed into this register. Got it.

So with this comment I'm happy with my Reviewed-by:

/*
 * We only want to return interrupts that are unmasked to the caller.
 * However, the interrupt status field also contains other
 * informational bits about the HPD state status, so we only mask
 * out the part of the register that tells us about which interrupts
 * are pending.
 */

-Doug

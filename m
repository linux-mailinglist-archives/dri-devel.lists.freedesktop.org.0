Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F5955A4C4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036D110EA10;
	Fri, 24 Jun 2022 23:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313110E403
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 23:25:16 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id p21so2978267qki.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FpOasnc+MpC6k8YV2n5CgA0BI1oTbTynNjCcV+ZfHRs=;
 b=NHb6sx16M7MktkZ3Jo61dJAtykBLRQ7L90BYWPv2UYfd7gTYH2Imv7sGo8sVPuwlCd
 3MzSMUw6RsrSdaH9kaWcFR/nhX3HUHTrofuDUv3N9XBWRtkmXMs74x9X1h6D7hUvEloQ
 xZqSxQLB41Sd3P5nsLa3wY60AtTBzwR9xksRX1rO+ijLlptnUAkOt4a4dbPrFdO6ZUOI
 eJf7OJQp9wYcRSj39MRpVP+exzOBiqETNrSMynq1cLm60ZfW39poLkgFd/c4XlEzX92Z
 urgI7E+FNaezix5BisyfzLdTRLV6DWggT8YDLErAQ+32QXk6815I9uprKrMtEBtLDi3/
 v7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FpOasnc+MpC6k8YV2n5CgA0BI1oTbTynNjCcV+ZfHRs=;
 b=qKOtCkuTVeGRvoMadvpcf31etsPOHwQJkz57AgbD6HRaCHXN1SOC7Yxi/l4z7Ne43Q
 9Ah5fN7sJP9iSmHQMzyprEhQZPDOUOTLBPD3BHZ14yqd+ESvubrk1O7UiLF0PcjR9esl
 TYrlquhgNOg0RdNg9Vg1IaWTuOPxxV9HzNEhOqnI6ovQIKHvnVwhMAMOZrRCE95m5rV0
 nVEt7b9R2IMUqbqLHgiJMTgYLphkwRjt3tckFCtGDSqposotUdNoWLikzwQh08S82nqh
 qNy7PKx8+EP2MN7qO2PiYLzzgr9kGNyApyuS0GfzShD3LgB62bVPFzr1sACmUZ/5z4oM
 xozQ==
X-Gm-Message-State: AJIora+uKeNZFyAkClz9rly23tn9rAoWtBNOGHxYXtSQKYEkTvirdXSB
 9CQ5WYPVct2gDPJykSgnESHOIN/UAuV9LVkOLMImVg==
X-Google-Smtp-Source: AGRyM1uO6ak+ggMtjMmbHyuZ535rKKAdH4kKHL57dRRG0x0TBx5SohM1ORVa07kNl56sasfydWaRzHmOt05i/wBTFkY=
X-Received: by 2002:a05:620a:31a0:b0:6a7:549f:a788 with SMTP id
 bi32-20020a05620a31a000b006a7549fa788mr1285171qkb.203.1656113115648; Fri, 24
 Jun 2022 16:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
In-Reply-To: <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 02:25:04 +0300
Message-ID: <CAA8EJprd_kkqU4GZ_p2cZbALCBDE-uFHsnPHXRnra0jZsY_bnA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 airlied@linux.ie, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 00:17, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 6/24/2022 1:00 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-06-24 10:15:11)
> >> Current the index (dp->id) of DP descriptor table (scxxxx_dp_cfg[]) are tightly
> >> coupled with DP controller_id. This means DP use controller id 0 must be placed
> >> at first entry of DP descriptor table (scxxxx_dp_cfg[]). Otherwise the internal
> >> INTF will mismatch controller_id. This will cause controller kickoff wrong
> >> interface timing engine and cause dpu_encoder_phys_vid_wait_for_commit_done
> >> vblank timeout error.
> >>
> >> This patch add controller_id field into struct msm_dp_desc to break the tightly
> >> coupled relationship between index (dp->id) of DP descriptor table with DP
> >> controller_id.
> > Please no. This reverts the intention of commit bb3de286d992
> > ("drm/msm/dp: Support up to 3 DP controllers")
> >
> >      A new enum is introduced to document the connection between the
> >      instances referenced in the dpu_intf_cfg array and the controllers in
> >      the DP driver and sc7180 is updated.
> >
> > It sounds like the intent of that commit failed to make a strong enough
> > connection. Now it needs to match the INTF number as well? I can't
> > really figure out what is actually wrong, because this patch undoes that
> > intentional tight coupling. Is the next patch the important part that
> > flips the order of the two interfaces?
>
> The commit bb3de286d992have two problems,
>
> 1)  The below sc7280_dp_cfg will not work, if eDP use
> MSM_DP_CONTROLLER_2 instead of  MSM_DP_CONTROLLER_1
>
> since it have num_descs =2 but eDP is at index 2 (CONTROLLER_2) which
> never be reached.
>
> static const struct msm_dp_config sc7280_dp_cfg = {
>          .descs = (const struct msm_dp_desc[]) {
>                  [MSM_DP_CONTROLLER_2] = { .io_start = 0x0aea0000,
> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>                  [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
>          },
>          .num_descs = 2,

Please change num_descs to 3. Or better eliminate it completely and
iterate up to MSM_DP_CONTROLLER_MAX, checking whether the entry
contains real values or is just a zero sentinel entry.

> };
>
> 2)  DP always has index of 0 (dp->id = 0) and the first one to call
> msm_dp_modeset_init(). This make DP always place at head of bridge chain.
>
> At next patch eDP must be placed at head of bridge chain to fix eDP
> corruption issue. This is the purpose of this patch. I will revise the
> commit text.

This text doesn't make sense to me. The dp->id has nothing to do with
the bridge chains. Each dp entry is a head of the corresponding bridge
chain. DP with dp->id = 0 and eDP with dp->id = whatever will be parts
of different encoder -> bridges -> connector chains.

-- 
With best wishes
Dmitry

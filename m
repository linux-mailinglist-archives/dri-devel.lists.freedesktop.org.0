Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A2455A51A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9C310F5D7;
	Fri, 24 Jun 2022 23:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E450610F5D7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 23:53:47 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id b125so2964541qkg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWbRuL2HNJOazJRDZ8Yz9uaYitC4uPW931tvugnImWs=;
 b=OMISmZTnPSyJ2Zmlprhg32lCJnHsse7hunOaQZu+IvIUb1JqifQ8/cVFphlQf6U1I5
 s4lLnkgPy6GCPqoTsRc38Ek7n/CZs0um1eNVdC12bLEMEahmryIhhQjecpXv/H1miJib
 2oeTjESwobonRtBvptbyFmqVPMEA+eE7tDV8CMWIKfpiR8bNm0NAc+oIkppKCXQpWKOE
 BXJPPjElweEe+KUkC174tN+rPS54PuS+mBCih3c1hS2xH5LS5v4GPJjcNjMlCiHPCNNd
 Hd8vHuPbA0/Ws6k943RaB75NmTs799P4g3AseYGngL8KMbPsS/VnqKJhRcfyR37ZYKbx
 1j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWbRuL2HNJOazJRDZ8Yz9uaYitC4uPW931tvugnImWs=;
 b=2Rm4RK6NrrL2ziJwe8vs+5PdlZvOCKjxVYce/daPfB14gNKUwKF00xnKaNBMVaahoh
 ebJGJxI3hbFTE+ozwjQAMKWguKVkERR16NVxH4UiLtZgR8TuFj4UBEh1QSaLGlIeHW2u
 mNCC12TBBWGKBUjMFtmVAmH9UAAHFgMZ97yuMKtTEzgLB0JDWkD3GCSiVMlKOLjRVcX/
 Dl1Cg2JIwV7RvSlAuRnIGsZLedmd4JBLrQ9ODxYkR2NwKnNZGkdl2jDmjN/dk2NzaPeR
 XcpNvPoRQmub1ZniO6L9odiLGhdCexV8Z586red2Fmn0gk8rILrZmEw9sCspxhT7LaPe
 RZPg==
X-Gm-Message-State: AJIora9BBPzlx4xJ6wHE/GlhOOAmJOVOZOTPWwerJ3+em8klCpIBO5d3
 Y8IG6gg1qKpsPku0CeeFsYzB1QXisXl2WrxaVkSYMQ==
X-Google-Smtp-Source: AGRyM1sssDPYLQQkqtjhG0C1nm2ma0r4GcjmmJkpT053S48MTsShoxEygLh6xlx3b4oYiFps99tJYYPjpkLME85zmwY=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr1333795qkp.593.1656114827059; Fri, 24
 Jun 2022 16:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
In-Reply-To: <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 02:53:36 +0300
Message-ID: <CAA8EJpoD-CJ1mgzef0tA4R=BJUdbSPErXG1fvugAd+5UhWiobA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Stephen Boyd <swboyd@chromium.org>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 02:45, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Kuogee Hsieh (2022-06-24 16:30:59)
> >
> > On 6/24/2022 4:12 PM, Stephen Boyd wrote:
> > > Quoting Kuogee Hsieh (2022-06-24 15:53:45)
> > >> MSM_DP_CONTROLLER_1 need to match to the index = 1 of sc7280_dp_cfg[] <== This is correct
> > >>
> > >> The problem is sc7280_dp_cfg[] have two entries since eDP place at index
> > >> of MSM_DP_CONTROLLER_1.
> > >>
> > >> but .num_desc = 1  <== this said only have one entry at sc7280_dp_cfg[]
> > >> table. Therefore eDP will never be found at for loop  at
> > >> _dpu_kms_initialize_displayport().
> > >>
> > > Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
> > > the intention of the previous commit was to make it so the order of
> > > sc7280_dp_cfg couldn't be messed up and not match the
> > > MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].
> >
> >
> > at  _dpu_kms_initialize_displayport()
> >
> > > -             info.h_tile_instance[0] = i; <== assign i to become dp controller id, "i" is index of scxxxx_dp_cfg[]
> >
> > This what I mean MSM_DP_CONTROLLER_1 need to match to index = 1 of
> > scxxxx_dp_cfg[].
> >
> > it it is not match, then MSM_DP_CONTROLLER_1 with match to different INTF.
>
> I thought we matched the INTF instance by searching through
> sc7280_intf[] for a matching MSM_DP_CONTROLLER_1 and then returning that
> INTF number. See dpu_encoder_get_intf() and the caller.

You both are correct here. We are searching through the _intf[] array
for the corresponding controller_id. And yes, the controller_ids are
being passed through the h_tile_instance[] array.

-- 
With best wishes
Dmitry

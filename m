Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122AC7B0EC5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 00:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBBA10E5C8;
	Wed, 27 Sep 2023 22:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF3B10E5C7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 22:05:41 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a200028437so25512157b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 15:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695852340; x=1696457140; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CNs9Uy0sZIcXogJDKuzAoviMSMHPVfDjWIe9eamVRQE=;
 b=T2Jra29zhKUqXGddUeI9haiC3O5ewhVcaleNE5ixsJ+zllLTTvSz2txR3sVLhAEgkw
 maVdptCj1H6bKdGeDOJVdBv07qrs1L0uLILsX+8YCTG+XbRjx/otTKWbbrqz6lLZgDUn
 NIXFZScrCqJpa3vTG5MQakCplw62jFKwsv4r/AEBGjicZDMOgyXKdOVryJKzCHQXTFuo
 QeavfdCCZoeg1lEWBXWUpfwTiy+8daakhmcr0IxiW5ZhmKCePob+eWcVhGT7ncsv3RuH
 4IVKDK4I3j38cO32svMaEnOsnWHYR8fiuNR1BxN8mxh0Ug7D45/1D0dIbBmR0BujvdG/
 F8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695852340; x=1696457140;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNs9Uy0sZIcXogJDKuzAoviMSMHPVfDjWIe9eamVRQE=;
 b=R2o0uk3ajZxTLBCjr6q37fvPGUGi+vna8cHZwhgtyoKpyrMmORjuVSBDA8VA3fq9VJ
 qEMV88XAvztZfFZuO5mw+OsorW40lfb1HCXjAUzDIS5/wiKdNT5easDOHF/IBxHDYpst
 P7nfAUnXec1nXqMHvYerNm44DEp/NQDgi4aF8dEMp5D84h3bxbxBmAVde6lgRDXIN3o5
 BeNDwoAJ3U/bQHFDv1H1WXgV/Wir5i8HLEQvVTLX4uCLpDuY/Jyp2DOc2otit/L3H1j1
 uZZi5Z3KF8h7/Wphdi8JUm3Rx9N3KKjh7rkJSRTdPEr+wn9qnW60kf1tXXRrVjaRXgZL
 q7UQ==
X-Gm-Message-State: AOJu0YwU4f+4+xuI3pfnxsGBdI3Fj3v//7FWTe+y6ZE/mSDN53mMYVbV
 BwoB80ss6N/4thN6YjeblH3piA9KfnFaDZLmPkRxjw==
X-Google-Smtp-Source: AGHT+IHR+moAslgN5T2iYRiOJljTYTXI9au6Nrv8poHtrZJxnq88ULiQGkND2FasIyvPuzQVl0Il+NK5ZQcIELMzmQs=
X-Received: by 2002:a81:9186:0:b0:59f:4c52:2f51 with SMTP id
 i128-20020a819186000000b0059f4c522f51mr3574047ywg.17.1695852340711; Wed, 27
 Sep 2023 15:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
 <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
 <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
 <1d9bf80d-0267-937b-4dd9-c57db7a89cb4@quicinc.com>
 <CAE-0n51Hrs66oG4NF5rDETkVO-ocG_6_=Aqc5cE-qPDViSgKyA@mail.gmail.com>
In-Reply-To: <CAE-0n51Hrs66oG4NF5rDETkVO-ocG_6_=Aqc5cE-qPDViSgKyA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Sep 2023 01:04:31 +0300
Message-ID: <CAA8EJppNSS-ZUoJRbLaO7XHr+69Th6ANU5KGrnbj8eWGyGFQDw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, linux-kernel@vger.kernel.org,
 andersson@kernel.org, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Sept 2023 at 01:01, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Kuogee Hsieh (2023-09-25 09:07:18)
> >
> > On 9/22/2023 6:35 PM, Abhinav Kumar wrote:
> > >
> > > Doing link training when we get hpd instead of atomic_enable() is a
> > > design choice we have been following for a while because for the case
> > > when link training fails in atomic_enable() and setting the link
> > > status property as you mentioned, the compositor needs to be able to
> > > handle that and also needs to try with a different resolution or take
> > > some other corrective action. We have seen many compositors not able
> > > to handle this complexity. So the design sends the hotplug to usermode
> > > only after link training succeeds.
> > >
> > > I do not think we should change this design unless prototyped with an
> > > existing compositor such as chrome or android at this point.
> > >
> > > Thanks
> > >
> > > Abhinav
> >
> >
> > We did perform link training at atomic_enable() at eDP case since we can
> > assume link training will always success without link rate or link lane
> > being reduced.
> >
> > However for external DP case, link training can not be guarantee always
> > success without link rate or lane being reduced as Abhinav mentioned.
> >
> > In addition,  CTS (compliance test) it required to complete link
> > training within 10ms after hpd asserted.
>
> Is it possible to change that timeout? I have to look around for the CTS
> parameters because I'm pretty confused how it can work. What do we do if
> DP wakes the system from suspend and asserts HPD? We need resume time to
> be < 10ms?  That's not realistic.
>
> >
> > I am not sure do link training at atomic_enable() can meet this timing
> > requirement.
> >
>
> At least in the DP spec itself it doesn't require the link to be trained
> within 10ms of HPD being asserted. Instead it simply recommends that the
> OS start configuring the display promptly after HPD is asserted, e.g.
> within 100ms. There's some strict timing on IRQ_HPD, so the driver must
> read DPCD registers within 100ms of IRQ_HPD rising edge; maybe that is
> what CTS is checking for?
>
> TL;DR: I don't see why CTS should stop us from link training in
> atomic_enable(). It would be beneficial to do so to make eDP and DP the
> same. It would also help to report a drm connector being connected
> _before_ link training so that userspace knows the link itself is the
> bad part of the equation (and not that the DP connector looks
> disconnected to userspace when in fact it really is connected and the
> monitor is asserting HPD, just the link training failed).

Also this will move us closer to i915 user experience: failing link
training in the display enablement part. So that a part of xrandr
calls can retry link training.

-- 
With best wishes
Dmitry

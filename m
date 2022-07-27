Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600C758281C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 15:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B4210E0EB;
	Wed, 27 Jul 2022 13:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5211A2FF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 13:59:06 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id e16so13290743qka.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VL9RxAlrlCWPRlbOT8q7ce/Z6YeW18HbrwcrpBQP3qw=;
 b=Pla9aOWUf7VME7IpoDRTTvu1DhvIABgH4b2rNbAEqnNyPiTAg66fOXhrPMMHoWxUq9
 j+OXy77yp0dFb5ts+mD6P4lfG4iNWTJOtTWZkl/kZHqivrcDjxSwVv/IdMsoe8TdMlwZ
 Te1VrsyBUjmT3BrOE1p12zdzUJa5TADZy+MqmvFqjWDxsCWMRlakO4upe4kw4V1Sx/G1
 CALzIDXwocuP8F4nXFEApXBb2BtGAkphdkNp5GVdAL96jrvx+R28GhnOqhTBP9QaPeau
 JR23ro+cVg60tEa53cnJE+WxUKkczKwA7vHx3+aEUV41UewN09MSWAHvZaJlQ/pE/Ix4
 qqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VL9RxAlrlCWPRlbOT8q7ce/Z6YeW18HbrwcrpBQP3qw=;
 b=O4x7EO+V5yn+u85Wg9APbo7urNHg00BgXF8IWmKMy0IQekcOdQic2GpvLHV+1Kdf3T
 bkQ0EvkCDFcIWyoFgi7J81Pn3XmAyp71AeJiuzn66fpQvDi9+Cgf6CZhcs2RwFEbwVOv
 MZS2bCT6woC0qsP1t3dH9JY66coO2IEeEIwf+2FWUiB0H7wd2JGOrDZJT6q4U2SH4Rl+
 0n2JXeH/JOrBZ8w4r7/vl6yTtWV/0+WwaNnfhX3VE29Q9FbsQ5ddyUwnC7IURYKiaFos
 lG7aiJkLjzm7VajN0OyJGD6UmcQA+jrS3qRu7dRpV4JQ8gdRZIx6Gk0iQlJffgJES7eH
 6p6A==
X-Gm-Message-State: AJIora+5ktEjE0kygcvTx5FDMRW4MQYxPvMXEHDuscxvkxB2QVbY8Aqw
 0rgjWHYyIPRCyYWZmL+kqnsQE5CvpjJflyxXE8MXYg==
X-Google-Smtp-Source: AGRyM1tzZoro6GxmvJC6SIRF21uAIipGsfUkIUIInp4yja7tz6w/4VkQMK/Pw1QkZTbZIpbA1+WkpSQc+eqAzbr8zZI=
X-Received: by 2002:a05:620a:2408:b0:6b6:2df3:d18b with SMTP id
 d8-20020a05620a240800b006b62df3d18bmr15960355qkn.203.1658930345047; Wed, 27
 Jul 2022 06:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220725174810.1.If1f94fbbdb7c1d0fb3961de61483a851ad1971a7@changeid>
 <661fa514-cd37-e062-3294-c844b7f0b894@quicinc.com>
 <CAD=FV=UHhfLn+S8F60EPoC0ip6YzmrihfTz=KmmauXHCxof2QQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UHhfLn+S8F60EPoC0ip6YzmrihfTz=KmmauXHCxof2QQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Jul 2022 16:58:54 +0300
Message-ID: <CAA8EJppHr7GjcvqRqXAgjw9mf+ObzCi58-VYSdO_JMfk1-4ifA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Don't set a load before
 disabling a regulator
To: Doug Anderson <dianders@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022 at 16:57, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 26, 2022 at 4:53 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > On 7/25/2022 5:49 PM, Douglas Anderson wrote:
> > > As of commit 5451781dadf8 ("regulator: core: Only count load for
> > > enabled consumers"), a load isn't counted for a disabled
> > > regulator. That means all the code in the DSI driver to specify and
> > > set loads before disabling a regulator is not actually doing anything
> > > useful. Let's remove it.
> > >
> > > It should be noted that all of the loads set that were being specified
> > > were pointless noise anyway. The only use for this number is to pick
> > > between low power and high power modes of regulators. Regulators
> > > appear to do this changeover at loads on the order of 10000 uA. You
> > > would a lot of clients of the same rail for that 100 uA number to
> >
> > I guess you meant "you would need a lot of clients"
>
> Yeah, sorry. :( I'll fix it up if I need a v3.
>
>
> > > @@ -259,15 +259,7 @@ static inline struct msm_dsi_host *to_msm_dsi_host(struct mipi_dsi_host *host)
> > >   static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
> > >   {
> > It seems like now we can drop this function dsi_host_regulator_disable()
> > entirely and just call regulator_bulk_disable() ?
>
> Sure, if you want. One could still argue that it provides a tiny bit
> of abstraction and avoids the caller from having to know where to find
> the number of regulators and all that, but I can go either way. Is
> this worth a v3, do you think? If so, I might tack it on at the end of
> the series.

I'd say, drop it. Having extra single-call wrappers doesn't seem to add a lot.

>
> Note that I say "v3" because I actually included this patch in a
> larger series and called that series "v2" [1].
>
>
> [1] https://lore.kernel.org/r/20220726173824.1166873-1-dianders@chromium.org



-- 
With best wishes
Dmitry

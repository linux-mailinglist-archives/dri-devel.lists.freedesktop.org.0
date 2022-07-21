Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30EA57D016
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 17:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1176F10E260;
	Thu, 21 Jul 2022 15:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182D810E21D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 15:44:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ss3so3788132ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SxxITHDTb1HH7twfNVc7G9AAeqX8EqngAkO5R6iw9Js=;
 b=nR88LRJ9k88qnqomsQbC4z8uoRy9fr9i9anwrJpCsWfLVtmxOhvAcI824wYLC8zXE8
 RjsTDc1tVbPt92E7Ye/VEY0Y/MbN+CHAQCQXQk7Yt50W/Vf3C7QBWWD+vy10BkIU2CA5
 ydR0CWMAHPOsDGdAmI3Rrm77mVcFoDqSxdL1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SxxITHDTb1HH7twfNVc7G9AAeqX8EqngAkO5R6iw9Js=;
 b=nwhVDNUR1dI3L63rk7kGVELMK4ATPSzsifphbTpwcmjdiBbP6OdpwS4q66K0n2VMYT
 AHPpjZ/UJ/6NNpJ9c3cHzAA+2yPSTFDhXM6m90HbtgRahIwyaHTf66tNt32CswIQ5OA1
 4BHV8t+WaXiUNgY6CwFxu5Qs1+Q12fwEYxauYKixu8y4zpLlnm20UslUh6pRNS82El35
 lWLP1ZGEDt7Sg3wRcrB92XP/hm2CmalNhwdKQeYWCydlPy8wscliB504hPsyZSEEcS8v
 ZZ750U9qiHY06t1+QPpK0dt0TbaSou02xboeT88VOIQ8u/Rx/+jABL9EMEow/2tsg74u
 b0yQ==
X-Gm-Message-State: AJIora/7GUxek2yow7HlMIUQ6jVIesmCQhVplhAf4Unwsf+jGwau/vlm
 D6CwRDuonudYGsSAFDDh4i3BehpQznunXRhNENE=
X-Google-Smtp-Source: AGRyM1uEdyHCbILE3ezLjqRpwOku1jsGrrBvtW/7AvzDo0jP/sJn0d0uUp8iYUN1QThI1Vuqec3S7A==
X-Received: by 2002:a17:906:cc5d:b0:72b:1313:cd09 with SMTP id
 mm29-20020a170906cc5d00b0072b1313cd09mr41277844ejb.482.1658418243424; 
 Thu, 21 Jul 2022 08:44:03 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 ay21-20020a056402203500b0043a422801f8sm1168708edb.87.2022.07.21.08.44.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:44:02 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id m17so2557640wrw.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 08:44:02 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35607698wrr.617.1658418241950; Thu, 21
 Jul 2022 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
 <YtlrV5R+JMxb7Dlu@sirena.org.uk>
In-Reply-To: <YtlrV5R+JMxb7Dlu@sirena.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 08:43:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
Message-ID: <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
To: Mark Brown <broonie@kernel.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 8:06 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 07:49:55AM -0700, Doug Anderson wrote:
>
> > Every single LDO on Qualcomm's PMICs seems to be able to be set in
> > "high power mode" and "low power mode", but I think the majority of
> > clients only really care about two things: on and in high power mode
> > vs. off. I think the amount of stuff peripherals can do in low power
> > mode is super limited, so you have to be _really_ sure that the
> > peripheral won't draw too much current without you having a chance to
> > reconfigure the regulator.
>
> *Generally* a low power mode would be mainly useful for low power
> retention type states, not active use.

Right. Certainly the case I've seen where it is most useful is in S3
where we need to keep a device powered just enough to detect a wakeup,
but it can definitely also be useful for mostly idle devices that we
need to keep powered to retain memory so they can start up again
quickly.

I guess I'd put it this way, though: how many drivers in Linux today
have _two_ calls to regulator_set_load(): one for the "active" state
and one for the retention state. Looks like UFS maybe. Any others? For
most devices the pattern is:

* get all of our regulators.
* for each regulator, set the load to something that will trigger HPM
when we're using the regulator.
* turn regulators on when we need power and off when we don't.

All the extra scaffolding and tables to pass something to
regulator_set_load() is just a lot of noise to add for drivers that
don't have any concept of "retention" mode and don't need it.

-Doug

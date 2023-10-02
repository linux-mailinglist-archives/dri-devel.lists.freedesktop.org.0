Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9487B5D73
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 00:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E2410E08D;
	Mon,  2 Oct 2023 22:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5332310E08D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 22:58:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5033918c09eso272876e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696287487; x=1696892287;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLskpeXIHd9AQB0pmS0kpklk4pQMX38Kb28MEbiPPRc=;
 b=jlGq35V820LhliD0xtui8aaBvcHYBM7wL+6VkFMo3fsH7/epobbVp/3UCnXUbQ0Wqa
 IsjAdugTWJ1Ejsh5lGiV3h9puBguA4+QTg7p5NpOsi/oSUPcs9aTnXuE7DO0dna434/F
 2BgBTvpFFIMfmN+nYtgTDDT+JS0+RwWpox1Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696287487; x=1696892287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZLskpeXIHd9AQB0pmS0kpklk4pQMX38Kb28MEbiPPRc=;
 b=vafaWVin8nBctnOLEmVzcC/MTiQjhaEFSSNHOi81IO+hXLw4A/KykmP8d2Uo3WrrvI
 b+sncn8+x47tVfJzsRAQd2hTaHClcz2v/jS5yRH1C/rtsqvEBnl9TsL+pu1NTOURDqHQ
 wGP5Td5RlXRSwW7aGHBU38GYgkJDpDcLdmXoHTbTvDx3ujekZJmn1I4NV7aTZ3le3HkB
 ixOz7pbRx1mO6WaAajQQIa/hETSXuR511iyN5iI5ZmqiEbai6/+z9MUpz6z0xCPDb6aB
 LED22kUCIAH+IKRbQNOVKpMJRSW+0aef2qy/sSXI3nAAYkj8Y89Wfxxe4FSs5B20InXd
 RQnw==
X-Gm-Message-State: AOJu0Yx5oDUNHxx2kacWXOs3b7p22Jige45bR68MW8CTF//oYnSaxnRb
 fJJjr9ydEWJKYsoCZZSDcCqfeSd/pobgSM71MvdekQ==
X-Google-Smtp-Source: AGHT+IG+XhRlziyXPAe6ffwhzMLbjXiah5u75GSqQh8c9zq4Zet1s6oInEMhAykPawNg7FfVh+RZo7+rNd/AUX798AU=
X-Received: by 2002:a05:6512:3b28:b0:500:7de4:300e with SMTP id
 f40-20020a0565123b2800b005007de4300emr13351747lfv.58.1696287487183; Mon, 02
 Oct 2023 15:58:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Oct 2023 17:58:06 -0500
MIME-Version: 1.0
In-Reply-To: <58701008-bb93-e5c6-9ca0-5bc43f9a46f0@quicinc.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
 <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
 <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
 <1d9bf80d-0267-937b-4dd9-c57db7a89cb4@quicinc.com>
 <CAE-0n51Hrs66oG4NF5rDETkVO-ocG_6_=Aqc5cE-qPDViSgKyA@mail.gmail.com>
 <58701008-bb93-e5c6-9ca0-5bc43f9a46f0@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 Oct 2023 17:58:06 -0500
Message-ID: <CAE-0n50N6hXM7qQZzccKy2X-kcru9n7Nvgn_V4tOHTnLn64qjw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2023-09-28 17:46:11)
> On 9/27/2023 3:01 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2023-09-25 09:07:18)
> >>
> >> However for external DP case, link training can not be guarantee alway=
s
> >> success without link rate or lane being reduced as Abhinav mentioned.
> >>
> >> In addition,=C2=A0 CTS (compliance test) it required to complete link
> >> training within 10ms after hpd asserted.
> >
> > Is it possible to change that timeout? I have to look around for the CT=
S
> > parameters because I'm pretty confused how it can work. What do we do i=
f
> > DP wakes the system from suspend and asserts HPD? We need resume time t=
o
> > be < 10ms?  That's not realistic.
> >
>
> No, the CTS doesnt say we need to finish link training within 10ms after
> HPD is asserted. It says it must be completed in 10ms after
> TRAINING_PATTERN_SET dpcd write.
>
> "Wait until the Source DUT writes 00h to the TRAINING_PATTERN_SET byte
> of Reference Sink DPCD Link Configuration Field to indicate the end of
> the link training. Stop the link training timer. Verify that link
> training completed in 10ms or less"
>
> That needs to be done independent of HPD so we can ignore the CTS point.

Great!

>
> >>
> >> I am not sure do link training at atomic_enable() can meet this timing
> >> requirement.

Why? It's putting some time bound on link training in general to only
take 10ms, right?

> >>
> >
> > At least in the DP spec itself it doesn't require the link to be traine=
d
> > within 10ms of HPD being asserted. Instead it simply recommends that th=
e
> > OS start configuring the display promptly after HPD is asserted, e.g.
> > within 100ms. There's some strict timing on IRQ_HPD, so the driver must
> > read DPCD registers within 100ms of IRQ_HPD rising edge; maybe that is
> > what CTS is checking for?
> >
> > TL;DR: I don't see why CTS should stop us from link training in
> > atomic_enable(). It would be beneficial to do so to make eDP and DP the
> > same. It would also help to report a drm connector being connected
> > _before_ link training so that userspace knows the link itself is the
> > bad part of the equation (and not that the DP connector looks
> > disconnected to userspace when in fact it really is connected and the
> > monitor is asserting HPD, just the link training failed).
>
> Its the corrective action of the userspace when it finds link is bad is
> the concern as I highlighted in the other response. Just reading and
> resetting link_status is not enough to recover.

What needs to be done to recover? Userspace will try to set a mode on
the connector again if the link status is bad and there were some modes
available. If there are zero modes and the link is bad, then it ignores
the connector. I'm not sure what else could be done to recover besides
try again and stop trying if no modes exist.

Acting like the connector isn't connected makes the situation worse for
ChromeOS because userspace thinks there's nothing there so it can't try
to retrain the link again. Instead, userspace has to rely on the kernel
driver to train the link again. The kernel should just tell userspace
the link is bad so userspace can implement the policy to either ignore
the connector entirely or to consider it a display that is having link
training problems.

So again, I see no reason why the kernel driver thinks it can implement
a policy to train the link before indicating the drm connector is
connected. It should stop doing that. Instead it should tell userspace
that the connector is connected and then train the link when there's a
modeset. If the modeset fails then userspace can take action to either
figure out that the link is bad, or notify the user that the cable is
bad, or to try replugging or power cycle the monitor, etc. None of that
can be done if the kernel lies about the state of the connector because
the link training failed.

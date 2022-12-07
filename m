Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CA9645E4B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B251210E3E0;
	Wed,  7 Dec 2022 16:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AEB10E3DB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:01:28 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 140so17828788pfz.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d1kIptz7lKS34gKJ86GNyP5WqgoufGO1GV/3C71h5+Y=;
 b=Zv+M3sdOTc2OaYw1U1lD9VTedffjOCXGlzUX5YnRjqpDj/9mhaAVkhtuzC+ogifVNu
 p1S/8EKd2QORb28ZpoA3LQnVibjwCkCNAAb9dr9XCl2C4l+Lt3Z6K4ir7sm+3mW4x/85
 6pBJiFAc5UE0fruWDoMsAuJxxN5FRe4wKarL0lpXgBiZNMb0+WQ3q6mYx9fH+BVE9sXN
 gbcBsoVcq0qongaEmXQHvGOHZ7fI+IIGnay3mc2RIntIRbvuzxhNHt+9sR/XJZeaoNbC
 fkZqCAqy2kkWqJJLUpz0hIpe2AeBemrvPLy50G6cklmneX0nbRZt8TDVpi+8T7V/GUDd
 oNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d1kIptz7lKS34gKJ86GNyP5WqgoufGO1GV/3C71h5+Y=;
 b=cwpjN4UaKfQ42GT24X6dK+qmbE2IZBFI/FhUFeS9eEcWe3L6lxDO288FcfqYJ6YcC8
 POvTtzmbBQg1lTJ1Gd8rnkQ40PBFLiCmJVj7JWFf+d3jY12j/+pyIc27ZsIDQcdtJjvR
 APijH0oaxJOHfLPUz9KLOxuCQzbu+UVnYghOhU2bnFhPsypDzaHcl0jiSg/Yvn751MoE
 oIbUCLvZvfRparSzMzPKDUXw/zh5intXy+ypB73uLOh9rBPn0yFejm+MUsoxpe37Kn8X
 oeMtPEeBdQRcjrLfMmRw2NQlfcNnrXqBQh9Tbj27/0QKqYbNrqsnuS6J7afAONLrE5Si
 O7kg==
X-Gm-Message-State: ANoB5pnLIc6h+KYUbYkjlfWQPYIap8eMelzS84adl7+vM4q17Fyo6IAk
 EJzrE58iv5ZtpAhawCGdOhbHKPzEHB3hVPz7MlXr+Q==
X-Google-Smtp-Source: AA0mqf6sjup+AAww0D1CxABtpTEw5G9veD+P+n64BdJc1XGnX7DToNoJVds9RCkhIAyxzhqjXASkgW/44ET/nN1v+Fo=
X-Received: by 2002:aa7:951d:0:b0:577:3e5e:7a4 with SMTP id
 b29-20020aa7951d000000b005773e5e07a4mr8456102pfp.57.1670428887514; Wed, 07
 Dec 2022 08:01:27 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
In-Reply-To: <20221201225705.46r2m35ketvzipox@builder.lan>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 7 Dec 2022 17:00:51 +0100
Message-ID: <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
To: Bjorn Andersson <andersson@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 krzysztof.kozlowski@linaro.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> >
>
> @Ulf, Akhil has a power-domain for a piece of hardware which may be
> voted active by multiple different subsystems (co-processors/execution
> contexts) in the system.
>
> As such, during the powering down sequence we don't wait for the
> power-domain to turn off. But in the event of an error, the recovery
> mechanism relies on waiting for the hardware to settle in a powered off
> state.
>
> The proposal here is to use the reset framework to wait for this state
> to be reached, before continuing with the recovery mechanism in the
> client driver.

I tried to review the series (see my other replies), but I am not sure
I fully understand the consumer part.

More exactly, when and who is going to pull the reset and at what point?

>
> Given our other discussions on quirky behavior, do you have any
> input/suggestions on this?
>
> > Some clients like adreno gpu driver would like to ensure that its gdsc
> > is collapsed at hardware during a gpu reset sequence. This is because it
> > has a votable gdsc which could be ON due to a vote from another subsystem
> > like tz, hyp etc or due to an internal hardware signal. To allow
> > this, gpucc driver can expose an interface to the client driver using
> > reset framework. Using this the client driver can trigger a polling within
> > the gdsc driver.
>
> @Akhil, this description is fairly generic. As we've reached the state
> where the hardware has settled and we return to the client, what
> prevents it from being powered up again?
>
> Or is it simply a question of it hitting the powered-off state, not
> necessarily staying there?

Okay, so it's indeed the GPU driver that is going to assert/de-assert
the reset at some point. Right?

That seems like a reasonable approach to me, even if it's a bit
unclear under what conditions that could happen.

[...]

Kind regards
Uffe

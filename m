Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2996470F4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 14:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C595610E4A1;
	Thu,  8 Dec 2022 13:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047CE10E4A2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 13:41:32 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id cm20so1647280pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 05:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nsVDMGdrrcenDbAQ2t+1J/nqCclkhOqEn3pqIwRUG2w=;
 b=uQy/0f7YV2jnlbCc1jSFqVrE4lbQvl+RRAJkhOLwNKMTRwuan4cjvWkayuWGs0R8oL
 vnygiP558bf0VxQTsmO1gMaSyfuPFtroV61zbBi/whfupcirDxi2CZL1YSNKEfXqDE+T
 5piNZUnqR67+TNZqTfGGTQsSVyDTmdMKrUSaB/GcKRURw0DdMy1ZRW3zLz+Mm9NTRcz4
 dXo/Fy6vLBQU6ntaMD3EpYjq2lVYXCLz0x7AANz9QfcsPOPKY33HoqaaBT3zcY9lcMkH
 yXHm35VDMvBDL6KcyGNoNfTrflmO5iPsaeb9inrWk2puhSN2S/QjoIr7Dnn/InlZbwtU
 f9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nsVDMGdrrcenDbAQ2t+1J/nqCclkhOqEn3pqIwRUG2w=;
 b=mvvwmbXnfYYLQgBUwoXiujPTkcKRRVgChl2EMm+OIJgX4M9Pyxg/nw2oteZvzCV86A
 xEVVjk008YN0FrkaVt5+trka9/TLrnFB+L0BfW9ugnrinrNWOk0RVxvPy5Hgksk+IFOk
 wigBYaUQTzGNgN/kzOJ2biUDzhbOZxdOF2oab0K4nK9ua2mHzWdQ5eKIvWvbBr+mh4Ad
 qXd/9HbN5vf/pl3cPzQUIMfQXiLKmUP9TdsaAz/RmEUGJYW88pdclLNRAM5hpjgcP4me
 euFo10lmzgXARYzwpgU1evTrREp48CdE5tc9/2XMYnb9RpzOIIISGo4bfS6qAt5O0pIB
 pBeg==
X-Gm-Message-State: ANoB5pnUO4kwfN1FtuxRtFZV7NITWXwfyx3JNT5HH92LnlA7vlT/TfRH
 B07QbG8IRhHRsGUvwVXKnLRzeR2ky6QjBvGuymKPiQ==
X-Google-Smtp-Source: AA0mqf7MdR24OCVzRBWFHBA1Ih0rv9hUVtp5dojJr48004Fk2Ur1P7IRRT950dIzOhONwDL/P4n1lllvwgn2ibEO+gk=
X-Received: by 2002:a17:903:40c6:b0:189:f799:676e with SMTP id
 t6-20020a17090340c600b00189f799676emr6120063pld.148.1670506892322; Thu, 08
 Dec 2022 05:41:32 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
 <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
 <20221207165457.kwdwwiycbwjpogxl@builder.lan>
In-Reply-To: <20221207165457.kwdwwiycbwjpogxl@builder.lan>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 Dec 2022 14:40:55 +0100
Message-ID: <CAPDyKFpYgYkDdJ79xxkwr-Mqnj5CoBrV+ZZe6Xz4hGLNR4zUVw@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
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

On Wed, 7 Dec 2022 at 17:55, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Dec 07, 2022 at 05:00:51PM +0100, Ulf Hansson wrote:
> > On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
> > >
> > > On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> > > >
> > >
> > > @Ulf, Akhil has a power-domain for a piece of hardware which may be
> > > voted active by multiple different subsystems (co-processors/execution
> > > contexts) in the system.
> > >
> > > As such, during the powering down sequence we don't wait for the
> > > power-domain to turn off. But in the event of an error, the recovery
> > > mechanism relies on waiting for the hardware to settle in a powered off
> > > state.
> > >
> > > The proposal here is to use the reset framework to wait for this state
> > > to be reached, before continuing with the recovery mechanism in the
> > > client driver.
> >
> > I tried to review the series (see my other replies), but I am not sure
> > I fully understand the consumer part.
> >
> > More exactly, when and who is going to pull the reset and at what point?
> >
> > >
> > > Given our other discussions on quirky behavior, do you have any
> > > input/suggestions on this?
> > >
> > > > Some clients like adreno gpu driver would like to ensure that its gdsc
> > > > is collapsed at hardware during a gpu reset sequence. This is because it
> > > > has a votable gdsc which could be ON due to a vote from another subsystem
> > > > like tz, hyp etc or due to an internal hardware signal. To allow
> > > > this, gpucc driver can expose an interface to the client driver using
> > > > reset framework. Using this the client driver can trigger a polling within
> > > > the gdsc driver.
> > >
> > > @Akhil, this description is fairly generic. As we've reached the state
> > > where the hardware has settled and we return to the client, what
> > > prevents it from being powered up again?
> > >
> > > Or is it simply a question of it hitting the powered-off state, not
> > > necessarily staying there?
> >
> > Okay, so it's indeed the GPU driver that is going to assert/de-assert
> > the reset at some point. Right?
> >
> > That seems like a reasonable approach to me, even if it's a bit
> > unclear under what conditions that could happen.
> >
>
> Generally the disable-path of the power-domain does not check that the
> power-domain is actually turned off, because the status might indicate
> that the hardware is voting for the power-domain to be on.

Is there a good reason why the HW needs to vote too, when the GPU
driver is already in control?

Or perhaps that depends on the running use case?

>
> As part of the recovery of the GPU after some fatal fault, the GPU
> driver does something which will cause the hardware votes for the
> power-domain to be let go, and then the driver does pm_runtime_put().

Okay. That "something", sounds like a device specific setting for the
corresponding gdsc, right?

So somehow the GPU driver needs to manage that setting, right?

>
> But in this case the GPU driver wants to ensure that the power-domain is
> actually powered down, before it does pm_runtime_get() again. To ensure
> that the hardware lost its state...

I see.

>
> The proposal here is to use a reset to reach into the power-domain
> provider and wait for the hardware to be turned off, before the GPU
> driver attempts turning the power-domain on again.
>
>
> In other words, there is no reset. This is a hack to make a normally
> asynchronous pd.power_off() to be synchronous in this particular case.

Alright, assuming I understood your clarifications above correctly
(thanks!), I think I have got a much better picture now.

Rather than abusing the reset interface, I think we should manage this
through the genpd's power on/off notifiers (GENPD_NOTIFY_OFF). The GPU
driver should register its corresponding device for them
(dev_pm_genpd_add_notifier()).

The trick however, is to make the behaviour of the power-domain for
the gdsc (the genpd->power_off() callback) conditional on whether the
HW is configured to vote or not. If the HW can vote, it should not
poll for the state - and vice versa when the HW can't vote.

Would this work?

Kind regards
Uffe

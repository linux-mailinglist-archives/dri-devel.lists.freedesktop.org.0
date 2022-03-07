Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD94D03F7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B8910E077;
	Mon,  7 Mar 2022 16:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15E110E077
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:22:21 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id iv12so10950663qvb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 08:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5S46HqKw5WhnAEBV/cYGBkiY8K6uLIFtiOgeL4GLg/g=;
 b=Q0rJy5Mj2RVlnL23r8fEmZo8WvHaqHVGmelCOha7ZHeXH8sskb82ShLHV4AqlLPGSm
 z+JyE58pO5XXnG/2aC8gWCpZPID9BQoxY8gwRBl/Dqz9L9+8kViLFXj+OlMQCxu/qEHt
 heacvfYtjmzMR5cSY4eLKem1LWjz49OsaeOLeJ7otZH1HxtnhMKsngHv0QX25bOodOtc
 8RKIpZnRZfUVIER7TfZjpgF3MIv8yofb+3QI98YvcVuPv4yneFzBO2Co2OkvTJPJKIkd
 ml5Xrn8wRMwTRsjstytR10dPDzQ38uDjqM/xwF9oJmepOXBlum8epWb2oB3I4PzivJhl
 4zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5S46HqKw5WhnAEBV/cYGBkiY8K6uLIFtiOgeL4GLg/g=;
 b=U9L32U+OC/C1CtbIDJcdV7ySYfq7DMCjC89QUD0T9aiNXCj26qZ5JAYts1ALTW1rRf
 JrviHuyrOjRTr3gOiE+Ypb5a1SsPPjmHmCtsnErOA5Zd2JItmW4PKz2uMz0oAax6Rwz5
 +AUpY38FTQzVvTmHU9KrLZhMaEmdYODM8BLAB1dpnKWthjZ+mPv8upnR0F74Za82jfWC
 HeFgWC8ki1Hjow1DOQjoRHbzcZEQT3awk0KzN3D5aDdq5PWpiVS7LLFiwevnXZcWihDW
 EvdJAVRKn22c2Wvun6ohxdWNxyVHdPARC5M1xzzo98QmozNL3imZMr4a3nYdcQgQhiCD
 Nhyw==
X-Gm-Message-State: AOAM530I4lHFj1tyCYN7gqs7xKqFrBdtvyMHed7T5+B5wCXwCx5FRUxT
 u63BVr3hWTjYp9mYrtBJGlSYIJIo212m0pxMphWmlw==
X-Google-Smtp-Source: ABdhPJx6kIUhwhEql65vZu2NICoS5p8BG9MQHF5BmQWUo8RO2rBRBXMEAJ00Li9+SP9U7kzkqmGrtHTHKeKaH1yf6gc=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr8762462qvv.115.1646670140889; Mon, 07
 Mar 2022 08:22:20 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
 <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
 <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
 <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
 <CAA8EJpq7XEy2C5=80HMHcy3wvB2CJetyQhcjQRcTtEafauy91g@mail.gmail.com>
 <BN0PR02MB81739261DB51A8BD9629ADA8E4089@BN0PR02MB8173.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB81739261DB51A8BD9629ADA8E4089@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 7 Mar 2022 19:22:09 +0300
Message-ID: <CAA8EJposq4JzQ7-G4DDoAphUOnCRT=-dzCo91BMsyUPQz21Apw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To: Vinod Polimera <vpolimer@qti.qualcomm.com>
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
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 quic_vpolimer <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Mar 2022 at 19:05, Vinod Polimera <vpolimer@qti.qualcomm.com> wrote:
>
> > WARNING: This email originated from outside of Qualcomm. Please be wary
> > of any links or attachments, and do not enable macros.
> >
> > On Sat, 5 Mar 2022 at 00:49, Doug Anderson <dianders@chromium.org>
> > wrote:
> > > On Thu, Mar 3, 2022 at 4:16 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Fri, 4 Mar 2022 at 02:56, Stephen Boyd <swboyd@chromium.org>
> > wrote:
> > > > >
> > > > > Quoting Dmitry Baryshkov (2022-03-03 15:50:50)
> > > > > > On Thu, 3 Mar 2022 at 12:40, Vinod Polimera
> > <quic_vpolimer@quicinc.com> wrote:
> > > > > > >
> > > > > > > Kernel clock driver assumes that initial rate is the
> > > > > > > max rate for that clock and was not allowing it to scale
> > > > > > > beyond the assigned clock value.
> > > > > > >
> > > > > > > Drop the assigned clock rate property and vote on the mdp clock as
> > per
> > > > > > > calculated value during the usecase.
> > > > > > >
> > > > > > > Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display
> > system nodes")
> > > > > >
> > > > > > Please remove the Fixes tags from all commits. Otherwise the
> > patches
> > > > > > might be picked up into earlier kernels, which do not have a patch
> > > > > > adding a vote on the MDP clock.
> > > > >
> > > > > What patch is that? The Fixes tag could point to that commit.
> > > >
> > > > Please correct me if I'm wrong.
> > > > Currently the dtsi enforces bumping the MDP clock when the mdss
> > device
> > > > is being probed and when the dpu device is being probed.
> > > > Later during the DPU lifetime the core_perf would change the clock's
> > > > rate as it sees fit according to the CRTC requirements.
> > >
> > > "Currently" means _before_ ${SUBJECT} patch lands, right? Since
> > > ${SUBJECT} patch is removing the bump to max.
> >
> > Yes. 'Before this patch'.
> >
> > >
> > >
> > > > However it would happen only when the during the
> > > > dpu_crtc_atomic_flush(), before we call this function, the MDP clock
> > > > is left in the undetermined state. The power rails controlled by the
> > > > opp table are left in the undetermined state.
> > > >
> > > > I suppose that during the dpu_bind we should bump the clock to the max
> > > > possible freq and let dpu_core_perf handle it afterwards.
> > >
> > > Definitely feels like seeing the clock to something predictable during
> > > the initial probe makes sense. If it's just for the initial probe then
> > > setting it to max (based on the opp table) seems fine.
> >
> > Vinod, could you please implement it?
> >
> > > I think an
> > > earlier version of this series set it to max every time we did runtime
> > > resume. We'd have to have a good reason to do that.
> >
> > Yes, this is correct. Based on the comments I had the impression that
> > there was a suggestion that the place for the calls was wrong. Most
> > probably I was instead projecting my own thoughts.
> >
> I had discussed internally with the team. Traditionally, mdp clk vote during
> probe/bind is required when display is turned on in bootloader and persists
> till first update in kernel.

Not each and every board has a display setup in the bootloader. For
example the RB5 I have here doesn't support setting up the display.
Not to mention that we should tell Linux, which vote is cast,
otherwise the .sync_state can turn respective votes off.

> As in chromebook, timing engine will be turned
> off during depthcharge exit and as there is no display transition from
> bootloader to kernel, mdp clk can be voted based on the calculated value
> during framework update and does not required vote during probe/bind.

Generally Linux should not depend on the bootloader setup. You can not
be sure. What if we kexec next kernel?

-- 
With best wishes
Dmitry

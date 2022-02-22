Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA24C041B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CF810E7B6;
	Tue, 22 Feb 2022 21:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0E710E7AF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:50:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c6so37338538edk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MDe1/XbZZwpMzP4Bd4iYW6ooJa1SuvyIIVKBTpf5jUo=;
 b=JIbNmgkRgP4fmF8fqKDxZPoO3hitMDXsTDRzZdAS3R1lGW5Qw/2Pfw8K2nfHxZpCxZ
 CMraYxwZL0nqKfhrIzAlWOz+jA4Q6lyHsTp9H2qhakiBhCRJmo2r7cSThBodJyHwFBhC
 9sy0CGhOAlttN6NzFmMpVWtPN3xc3gm7AOi00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MDe1/XbZZwpMzP4Bd4iYW6ooJa1SuvyIIVKBTpf5jUo=;
 b=nkCTYqq2RUJIa+pd4CtgTrA0QhhS5M1+Es2gJRkWzmIt7OcvWsS2WhZfozFOmW9S+8
 xe2sAD0M0/3DuRHo0ORwZjAVow0p1O0yCiz0poYRO8PSd01trkmEIvgpnQZnzNeYyKqn
 smke4cIw2K5VOweOzCgQEp2tWNI1pumdga+flIcxNjri3154xSpM5SraxS5dO7mbPYxk
 0ywxkKZokzJYG2wDVDDo1cfSZaEYvi44pDBaTd63inmsQbhXyPUO6FDcc8Xe+lmNi9b4
 tsdPzRBmP8phnQSaZn8kBrbk5Yj2/fK/OnwxXjwCMjoTYfgNJMqiTXepPN72h827lVYS
 O4OQ==
X-Gm-Message-State: AOAM530CV7gkOhV6HZVwxS/eEei45t3z4xS7gcHbZqDWeU36OtxSY3PP
 uE5yXEyydohyccc/kKXopQ3yUA0uYMahaHj4F9w=
X-Google-Smtp-Source: ABdhPJwGS65ZZCjM7qwUtkSjrPfGqGdP5Pk0KD0d44Xik+UFEaMlSF5kYHvnL07/TuD8hTim26jnBw==
X-Received: by 2002:a05:6402:17d4:b0:413:2f6b:23c1 with SMTP id
 s20-20020a05640217d400b004132f6b23c1mr910842edy.377.1645566606407; 
 Tue, 22 Feb 2022 13:50:06 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id kq17sm6684660ejb.205.2022.02.22.13.50.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:50:04 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id j17so9294583wrc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:50:04 -0800 (PST)
X-Received: by 2002:a5d:64ea:0:b0:1ea:8148:6b97 with SMTP id
 g10-20020a5d64ea000000b001ea81486b97mr4692080wri.679.1645566604132; Tue, 22
 Feb 2022 13:50:04 -0800 (PST)
MIME-Version: 1.0
References: <1645449126-17718-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n507XcYRz4=Uw-K37kPsLRqi_gN2L9y1wcu_X-UJP+6ySg@mail.gmail.com>
 <CAD=FV=WvstZkDJcHJPAT0aez3X=uSKzDX0paQRHYD4DEktkMEQ@mail.gmail.com>
 <CAE-0n51V+bfDUb_heV_DVkS+KOzDcjYzxpU=E8cCGFESrUwpeg@mail.gmail.com>
In-Reply-To: <CAE-0n51V+bfDUb_heV_DVkS+KOzDcjYzxpU=E8cCGFESrUwpeg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 13:49:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAvq5LuhZua3FU39RRsicC2dzGAZkG4NHYx8QaP7ov4A@mail.gmail.com>
Message-ID: <CAD=FV=XAvq5LuhZua3FU39RRsicC2dzGAZkG4NHYx8QaP7ov4A@mail.gmail.com>
Subject: Re: [v1] arm64/dts/qcom/sc7280: update mdp clk to max supported value
 to support higher refresh rates
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 22, 2022 at 1:46 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2022-02-22 13:25:05)
> > Hi,
> >
> > On Tue, Feb 22, 2022 at 12:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Vinod Polimera (2022-02-21 05:12:06)
> > > > Panels with higher refresh rate will need mdp clk above 300Mhz.
> > > > Select max frequency for mdp clock during bootup, dpu driver will
> > > > scale down the clock as per usecase when first update from the framework is received.
> > > >
> > > > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > >
> > > Please add a Fixes tag.
> > >
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > index baf1653..7af96fc 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > @@ -2895,7 +2895,7 @@
> > > >                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > > >                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> > > >                                                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
> > > > -                               assigned-clock-rates = <300000000>,
> > > > +                               assigned-clock-rates = <506666667>,
> > >
> > > Why not simply remove the clock assignment and set the rate based on the
> > > OPP when the driver probes?
> >
> > I was curious so I dug. It turns out that it _is_ using the OPP. It's
> > just that the kernel driver currently assumes that the initial rate is
> > the max rate. :-P You can actually see in msm_dss_parse_clock() that
> > it walks through each of its clocks at boot and records the boot rate
> > and stashes it as the "max_rate". That's not a scheme I've seen done
> > commonly, so if nothing else it deserves a comment in the commit
> > message.
>
> That sounds like a scheme to detect the max frequency of the clk before
> an OPP table is written. It would be better to convert that code to use
> OPP tables if available and then drop this assigned clock property from
> the DT (in both places).

Ah, good point! You could just check what the max OPP table rate is.
Then you don't need to worry about specifying the same clock rate
twice.


> > One other note is that I think there are _two_ places in the dtsi that
> > are setting this same clock rate, right? The parent node `mdss`, which
> > you're not touching, and the child `mdss_mdp`, which you are touching.
> > Seems like you should just do it in one place. If it needs to be done
> > by the parent then the child could just assume that the clock has
> > already been set by the parent.
> >
>
> I see that it's this way on sc7180 too, which is sad but it seems nobody
> noticed.

Never too late to fix it! :-)

-Doug

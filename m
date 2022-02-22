Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397294C03BD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02EF10E25D;
	Tue, 22 Feb 2022 21:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF5D10E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:25:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id r13so23785420ejd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ncH9c7SiYmN6itdECS9f8vr7OT3dx9aRl+ruQf7+yUg=;
 b=bie/EqstQq7cMH+SvIyYScs9hMbdl5FmT1j31NstckurYsN72clBvZSAs4si7yh9wD
 r/miD7WgoTgKOsFCyHBeU2c8gQTdgqSJy1y26X892UgDwNWsMNYp9/ub7c2lCI6GZ3co
 KlMSphSYJYjvpWZcfeXWn0GgJ+1a1Y3QNMTE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ncH9c7SiYmN6itdECS9f8vr7OT3dx9aRl+ruQf7+yUg=;
 b=tpQZ0G5e0/ykSuSdss0pgMjJ3W10Wsp/3TT+2ryLqszsagIf19ZhCWLNL0ri7dKRb9
 IiNc4YR9GPVkTVzpw34pAYpruQVCKOPcM5AQgnLbnJOJQVgR3AfFqg3baD51KwHe7Hwd
 L7FOpGMiir+xSN8BfwPCKSfH07dEhe5XZFlWtTJA36/rrAp0LTW5lJtpB5IFV9cohTod
 nJmH0/SkP94olyZOAbUNebh7VcRUfBJkL9U4kD4eJCZpfRTaTOCgSea95zpoln6wQ5Ve
 WgDMNHsnMldGIy1cXpqAffwkqJyFex5ba0yGTESpJr27vBIFefUVzh2ZOvyLZz2tbnPi
 AzDw==
X-Gm-Message-State: AOAM5313TcUFwe/iC9r/dENjPx0c+mDNdm/NB5KSJjEKrucQz6SMQT8k
 rLh2xwF+rhOWZfjNPx64jJVgZLeEAzO9Lv0uRDI=
X-Google-Smtp-Source: ABdhPJwW/0/PZ/lYaQg6V0QAR4qtbeS6gEiKSl1xoYTJtFJU3AqUDBKSDlb/ZGmvgu0s3OwoAomf/w==
X-Received: by 2002:a17:907:9086:b0:6b3:fce8:50ee with SMTP id
 ge6-20020a170907908600b006b3fce850eemr20571608ejb.390.1645565120284; 
 Tue, 22 Feb 2022 13:25:20 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id b7sm6825605ejl.145.2022.02.22.13.25.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:25:19 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso2842171wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:25:19 -0800 (PST)
X-Received: by 2002:a05:600c:228e:b0:37c:2eef:7bf with SMTP id
 14-20020a05600c228e00b0037c2eef07bfmr4792688wmf.73.1645565118969; Tue, 22 Feb
 2022 13:25:18 -0800 (PST)
MIME-Version: 1.0
References: <1645449126-17718-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n507XcYRz4=Uw-K37kPsLRqi_gN2L9y1wcu_X-UJP+6ySg@mail.gmail.com>
In-Reply-To: <CAE-0n507XcYRz4=Uw-K37kPsLRqi_gN2L9y1wcu_X-UJP+6ySg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 13:25:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WvstZkDJcHJPAT0aez3X=uSKzDX0paQRHYD4DEktkMEQ@mail.gmail.com>
Message-ID: <CAD=FV=WvstZkDJcHJPAT0aez3X=uSKzDX0paQRHYD4DEktkMEQ@mail.gmail.com>
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

On Tue, Feb 22, 2022 at 12:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Vinod Polimera (2022-02-21 05:12:06)
> > Panels with higher refresh rate will need mdp clk above 300Mhz.
> > Select max frequency for mdp clock during bootup, dpu driver will
> > scale down the clock as per usecase when first update from the framework is received.
> >
> > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>
> Please add a Fixes tag.
>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index baf1653..7af96fc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -2895,7 +2895,7 @@
> >                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> >                                                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
> > -                               assigned-clock-rates = <300000000>,
> > +                               assigned-clock-rates = <506666667>,
>
> Why not simply remove the clock assignment and set the rate based on the
> OPP when the driver probes?

I was curious so I dug. It turns out that it _is_ using the OPP. It's
just that the kernel driver currently assumes that the initial rate is
the max rate. :-P You can actually see in msm_dss_parse_clock() that
it walks through each of its clocks at boot and records the boot rate
and stashes it as the "max_rate". That's not a scheme I've seen done
commonly, so if nothing else it deserves a comment in the commit
message.

One other note is that I think there are _two_ places in the dtsi that
are setting this same clock rate, right? The parent node `mdss`, which
you're not touching, and the child `mdss_mdp`, which you are touching.
Seems like you should just do it in one place. If it needs to be done
by the parent then the child could just assume that the clock has
already been set by the parent.

-Doug

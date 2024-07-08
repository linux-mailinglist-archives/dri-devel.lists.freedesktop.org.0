Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D864292A32D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5E810E349;
	Mon,  8 Jul 2024 12:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GmMHlpeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E6210E349
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:49:36 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-754d2b05db5so1944561a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720442976; x=1721047776; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gwJfqVEIoVdfoTsztHNlaZf6K08VAN240cdWOXUU17s=;
 b=GmMHlpeT1sC25l7xSTiukpUwvfjzpTtOoJTdpSrNUuGMWl1yPC/vSkbYU6qBOZI67O
 Q/eqqITLNf8OXu+IozuQMX9+Maqufsq2rTIDVfqCjjlr2pwU8BclQONoHuL+5g0pcPWH
 VKtE1/AtR7G7ABBgMixl80pVbvTQEmgOidGPPynNSmjXVv1LPWgurfUGf4j8+mJwITT5
 KedE5732/1/VnkrnYDDT3acd0ajSdNE8nR+WTavTc4ORGVse3rKZBoGADNl5rei3Iu3f
 zV760QjX3KOjrzl9aQXYV+LWhMOz57mCHvyhJkblLjGtxh6Y9NjFiv89WSDN06VtsiuU
 88+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442976; x=1721047776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwJfqVEIoVdfoTsztHNlaZf6K08VAN240cdWOXUU17s=;
 b=PSClq4FqtK9lFyJ3Az8mcIwF3w6vEV2Mk4RAvLaVYv7Fx5LJPCU7U3AaihZjVhsPyN
 2ujXosXupxdDWhwbaH/HH2DhQXcQGbL7suvti4fjwKadS461CF3xoFR4zYtCjYZU/+Df
 meQJ8KPri+XAKcHyFJpeCrYqBBO4r7Mdvr/aMG7DnpCmN0lpW5V6kRLqiL8PK63Rj/BW
 s66kXsgva9mCK1Z4I8o9Q3bmt+4lEpbbgAT7Y9KiaWy6s/v73VyDNNmg3df7qfoE0uVe
 M0tqGyyKPBxFt68Y2MxSMDJ5Qcj9RvbIRBEiaa8nDspKOa7jo8fY+V/ErSuwwonK+30p
 J7kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjDYB7I4R3cQ/LjtgMm94dhhaPsVUk23O2IZMNO7fg0VpbqppZo7X42nppARB2JJuMOvi3gE7+K53gO0DIQkqZVatgos28QVD4DK9jsW9f
X-Gm-Message-State: AOJu0YyosaxQIippcy0UCL7AagNJEq8IxknMB4z6sTrTl1q59ZSy1Szh
 7cOGlgd1uGspWUBNkB9bvP9IPtaUT5WUdAG3ctz6iOGMHbq4XXgChmCHGykF7TSsrnyVWCbplU6
 XEnxRJrG0vgTU8UUq70vWmbFuArjPVRZd8Xs89MYx90E1PVt9q5Dqjg==
X-Google-Smtp-Source: AGHT+IFh+8rVNSdILFoJSTAPdcM4HawcWPM/1UUqpARio3DoOIhOeIUZ96MzfeyAZxWq+ws/d6HRKhGtmB30W5rYgpQ=
X-Received: by 2002:a17:90b:a4a:b0:2c9:6751:7539 with SMTP id
 98e67ed59e1d1-2c99c6ba8cemr6298715a91.44.1720442975629; Mon, 08 Jul 2024
 05:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
 <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
In-Reply-To: <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Jul 2024 15:49:23 +0300
Message-ID: <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Jul 2024 at 14:07, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 05/07/2024 16:34, Dmitry Baryshkov wrote:
>
> > On Thu, Jul 04, 2024 at 06:45:36PM GMT, Marc Gonzalez wrote:
> >
> >> From: Arnaud Vrac <avrac@freebox.fr>
> >>
> >> Ported from the downstream driver.
> >
> > Please write some sensible commit message.
>
> Here's an attempt at expanding the commit message:
>
> """
> This code adds support for the HDMI PHY block in the MSM8998.
> It is a copy & paste of the vendor driver downstream:
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/clk/msm/mdss/mdss-hdmi-pll-8998.c
> """

Add support for the HDMI PHY as present on the Qualcomm MSM8998
platform. The code is mostly c&p of the vendor code from msm-4.4,
kernel.lnx.4.4.r38-rel.

>
>
> >>  drivers/gpu/drm/msm/Makefile                   |   1 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
> >>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 789 +++++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
> >>  6 files changed, 893 insertions(+)
> >
> > - Missing changelog
>
> - Rebase onto v6.10
> - Move drivers/gpu/drm/msm/hdmi/hdmi.xml.h to drivers/gpu/drm/msm/registers/display/hdmi.xml
> - Add copyright attribution
> - Remove all dead/debug/temporary code
>
> > - Missing a pointer to bindings. Ideally bindings should come together with the driver.
>
> "qcom,hdmi-phy-8998" is defined in "HDMI TX support in msm8998" series (Acked by Rob Herring & Vinod Koul)

This (and the link to lore) ideally should be a part of the cover
letter or the comment below '---' in the patch.

>
> > I'm not going to check the math, but it looks pretty close to what we
> > have for msm8996.
>
> What is the consequence of this?

That I won't check the math :-D

>
>
> >> +static const char * const hdmi_phy_8998_reg_names[] = {
> >> +    "vdda-pll",
> >> +    "vdda-phy",
> >
> > Unless you have a strong reason to, please use vcca and vddio here, so
> > that we don't have unnecessary conditionals in schema.
>
> The vendor code uses vddio & vcca for msm8996;
> vdda-pll & vdda-phy for msm8998.
>
> Which is vcca? Which is vddio?

vddio = vdda-phy (1.8V)
vcca = vdda-pll (lower voltage)

> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-mdss-pll.dtsi
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-mdss-pll.dtsi#L121-172

-- 
With best wishes
Dmitry

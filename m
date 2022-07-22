Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B3957D802
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 03:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CC9113042;
	Fri, 22 Jul 2022 01:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED5E14BD7B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 01:28:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id z23so6028679eju.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 18:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SVPqfwH/07HlNOv2TRkPmLswn/QUPlQGAJ5mgKuBLO4=;
 b=MFIlp/LiIilyP6VUEC691FGgrKDYwLe0ZTn31yUfuKe208ESUqpgsUsgzvHrgZXuho
 CpRTNoUgxieKQSsv3drg4QbWVAb4S1/EUdYV3IRzwlqztu3dG35B1B1M3F/imiT3P5Am
 7L80f1thRVsnKNVab/YwGzlYyexpswU1yBHkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVPqfwH/07HlNOv2TRkPmLswn/QUPlQGAJ5mgKuBLO4=;
 b=lz8Aav9LLbBfQJk4lTpgg6u2Z+dQjTjvEqwNGJ5fyM3Jn3A78/jh7RkrNqQ5DN41l9
 SxKPkoyOgg646bKNH+1weEd1RArX8UkMB3qlC5EJhn1RKMNFGjB6dqizb1D+GTeCt+02
 WXDAYd/WdwUAgOXDjY20K56wFgkfveU+4+NpWkGd9ovtUUgGjg3fPvNSuyGB4JwpG5IH
 1ruZt5uqZRDREYwJ198LMX1TjN9KWBMAtm8F2/IWyM79HAV0q1X2P0fewH8NTJd9zu8p
 CrL2AUrPwM942swyBlS70LWn+Ec3+BwwzmxiW5hIOVU98MXNCIUixN1/evoqHZ0ApzPk
 w/4g==
X-Gm-Message-State: AJIora8yaGExJO0ohKM6OpcBd6XHN9agOFKATdMHUqZGb99t+L5UKIyH
 WivW+4XdQx6lSbNE1js2pIRYNW26ClTEGddLvco=
X-Google-Smtp-Source: AGRyM1vRAJKtEoP/gA2KT4v5jA5yHOOxppAayU8fkIpv9iL4ALoKJze8DjBCTkm5yaiQLJKARZ0xnw==
X-Received: by 2002:a17:907:3d89:b0:72b:4d89:9c7a with SMTP id
 he9-20020a1709073d8900b0072b4d899c7amr1115568ejc.50.1658453337319; 
 Thu, 21 Jul 2022 18:28:57 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 f21-20020a17090631d500b0072ee7b51d9asm1431688ejf.39.2022.07.21.18.28.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 18:28:55 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so4428944wmq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 18:28:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr5596548wmq.85.1658453335156; Thu, 21 Jul
 2022 18:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <Ytk2dxEC2n/ffNpD@sirena.org.uk>
 <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
 <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
In-Reply-To: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 18:28:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVxhZwJFmOAg2v1UmfOt9_HWz0LG8M3wac+RkMPGOwYg@mail.gmail.com>
Message-ID: <CAD=FV=XVxhZwJFmOAg2v1UmfOt9_HWz0LG8M3wac+RkMPGOwYg@mail.gmail.com>
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
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 7:52 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jul 21, 2022 at 7:39 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > > You could add a way to specify constant base loads in DT on either a per
> > > regulator or per consumer basis.
> >
> > Yes, this please! ...on a per consumer basis. :-) It's been on my
> > wishlist for a while and would eliminate a massive amount of code /
> > tables in the drivers.
> >
> > We could debate syntax, but I guess you'd either do it w/ two cells
> >
> > vdda-phy-supply = <&vdda_mipi_dsi0_1p2 21800>;
> >
> > ...or with matching properties:
> >
> > vdda-phy-supply = <&vdda_mipi_dsi0_1p2>;
> > vdda-phy-supply-base-load = <21800>;
>
> Ah, sorry to respond to my own thread so quickly, but I just thought
> of a reason for the "matching properties" solution instead of the two
> cells. It would allow the SoC "dtsi" file to specify a base load while
> the board "dts" file can then specify the supply. That feels like it
> could be a nice solution.

This seemed easy, so I whipped up a quick prototype. Forewarned that I
did very little detailed testing. I didn't CC everyone on this thread,
but hopefully folks can find it if they are interested...

https://lore.kernel.org/r/20220721182622.RFC.1.I8a64b707169cfd73d9309c5eaf5d43b8bc4db988@changeid

-Doug

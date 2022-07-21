Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A694157CE08
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 16:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1DE8FC95;
	Thu, 21 Jul 2022 14:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304FB8FC95
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 14:45:37 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bp15so3575803ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8gd/m3LxS60yVx7Ft64S3I2geJNhfthrTCnHWEHH0w=;
 b=PxLxMfnPHw7C70/BqUyBmctzuSLEjBn8t9+6JFbmwTV1PD+DxOc2aU5qW7Mv9pOvTL
 g41dPI7CL0SpwaPG1W9qn4AuZyxlGo0ZAhZuhm1Rg4BRvIOdSJZ27GhSGKT6BURo+9nE
 srGoMQ7BP/A7n2MGZvMwViiTYMpGYf3A5xR8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8gd/m3LxS60yVx7Ft64S3I2geJNhfthrTCnHWEHH0w=;
 b=KMjRv2pLrYcqsL/3l38oY791Y3aLZxmPom9u11jqu/cAwQneSaWHuQbL9CPsB9omsy
 GghSub14kYUvAHEB/IB6ZFgGcKY4lygP1NQNHlrJNRaGz+vG+vp7GiFqrN9zDeqPLy3b
 wmLsoyi0JKCtkCJ5iY7V+Au2f1i2l1NBnV3J1ryl3QeazuqFwCD54kbf5UcUzyFn3/wT
 itxqK74OeuHqUMKOQ4u9m0cjjpWu+zmRzh/5peC3MiThJmZnL/GEf9jP3DcrHlLgytRF
 YlgaINn29yMdN2n6f0YgjdktsDwH8xeQC6/7YWEODBWVzywNt6OEtRzbawfmPO5cP6Ts
 Tehg==
X-Gm-Message-State: AJIora82Bc0xHs5fRmQTZ7JR6rjo+Q+7tM3Td3JZGq7G6xPreVzmYO56
 J8yx4M/KWRVAiqBAgIncDRpVfPS8IVcYdjFkZHc=
X-Google-Smtp-Source: AGRyM1sFpQcGTNFSSn2njJZV3fGv0c/mBxn3w9mS0EwdWIFhmJq9jptz+LKrXd20JTjBL7Pu8Bo7hQ==
X-Received: by 2002:a17:906:4fd3:b0:72f:2306:32a6 with SMTP id
 i19-20020a1709064fd300b0072f230632a6mr21376808ejw.83.1658414735337; 
 Thu, 21 Jul 2022 07:45:35 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 gn36-20020a1709070d2400b00721d8e5bf0bsm940273ejc.6.2022.07.21.07.45.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:45:34 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id z22so2449601edd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:45:34 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35372536wrr.617.1658414400165; Thu, 21
 Jul 2022 07:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <Ytk2dxEC2n/ffNpD@sirena.org.uk>
In-Reply-To: <Ytk2dxEC2n/ffNpD@sirena.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 07:39:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
Message-ID: <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
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

On Thu, Jul 21, 2022 at 4:20 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 12:31:41PM +0200, Johan Hovold wrote:
>
> If you're copying someone into a thread that's not obviously relevant
> for them it's good practice to put a note about it at the top of the
> mail to reduce the chances that it just gets deleted unread - people get
> copies of all sorts of random stuff for not great reasons (like getting
> pulled in by checkpatch due to once having done a cleanup) and are often
> quicky to delete things.
>
> > This series breaks USB and PCIe for some SC8280XP and SA540P machines
> > where the DP PHY regulators are shared with other PHYs whose drivers do
> > not request a load.
>
> > Specifically, the hard-coded vdda-phy load of 21.8 mA added by this
> > series, causes several RPMh regulators to now be put in low-power mode.
>
> > I found Doug's suggestion to handle situations like this in regulator
> > core:
> >
> >       https://lore.kernel.org/all/20180814170617.100087-1-dianders@chromium.org/
>
> > but since that was rejected, how do we deal with this generally?
>
> > In the above thread Doug mentioned adding support for load requests to
> > further drivers and Bjorn mentioned working around it by adding
> > regulator-system-load properties to DT.
>
> > It seems quite likely that changes like this one affects other systems
> > too, and the effects may be hard to debug. So a more general solution
> > than playing whack-a-mole using DT would be good to have.
>
> You could add a way to specify constant base loads in DT on either a per
> regulator or per consumer basis.

Yes, this please! ...on a per consumer basis. :-) It's been on my
wishlist for a while and would eliminate a massive amount of code /
tables in the drivers.

We could debate syntax, but I guess you'd either do it w/ two cells

vdda-phy-supply = <&vdda_mipi_dsi0_1p2 21800>;

...or with matching properties:

vdda-phy-supply = <&vdda_mipi_dsi0_1p2>;
vdda-phy-supply-base-load = <21800>;

-Doug

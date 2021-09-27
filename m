Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B141A087
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 22:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A60A89CF2;
	Mon, 27 Sep 2021 20:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7677989CF2;
 Mon, 27 Sep 2021 20:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A25D611CE;
 Mon, 27 Sep 2021 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632775685;
 bh=GHCCCNNGDh7j8AzsSAwR+7WjFwTTkZQkWzBp4yf5Anw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EtTYXuV99xHvDuCezChTC1fYR0ncVq3Rk1GokwMu8SQwpY+EmUiFM+RJIajTO8jW3
 VrmnSOnx8ztK/horbiFLR4Q1ZWDBNyvy7tKy9OeuG4ddMCv7tR6NZWpZqi+5myOFRZ
 fUlC6Cg5AZEODAOrfOLYA3DADysDTM/85vB/lrkAnFddU4ZJYrY9Qs93uwL2IgXWp2
 ShOzsV013bF2pbhJUOsUOYV7NBfbitxpmzxjeFzmgMdmeTIB3GqmWBkk202+UoozT6
 QbwxnW2Yp/G+PD6grSc1VyWUP3kS05HQi/kIejRv/Gb69g5//VZRJWFOBSMsttdGMH
 imsrWEit+NvGQ==
Received: by mail-wr1-f46.google.com with SMTP id t8so54216953wrq.4;
 Mon, 27 Sep 2021 13:48:05 -0700 (PDT)
X-Gm-Message-State: AOAM530n7Q20BcqgnS7NRosOT4d+0EQpscUKMs6syIdasiZYsA5wpdEn
 7E6phgP55NOe6u64X0Kq5PgsGCesB6B/TDwWD2o=
X-Google-Smtp-Source: ABdhPJyr//9nG+qcYuFmIIHo02EBLzzoRAIp7o7Kc5vnLIs/c/42qbXfOQSeIjG8WR8ZxK+L1GxrgnNIqE5zvhpeDJ8=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr2207127wru.336.1632775683762; 
 Mon, 27 Sep 2021 13:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152412.2900928-1-arnd@kernel.org>
 <YVIg9CxJGaJr1vpp@ripper>
 <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
 <YVIsrgKiOG/gFVdT@ripper>
In-Reply-To: <YVIsrgKiOG/gFVdT@ripper>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 22:47:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1WRBA4mP691fO82ZhYdPhHLGjLH=VhcUxGNeGRMX8knw@mail.gmail.com>
Message-ID: <CAK8P3a1WRBA4mP691fO82ZhYdPhHLGjLH=VhcUxGNeGRMX8knw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, 
 Kalle Valo <kvalo@codeaurora.org>, Andy Gross <agross@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Networking <netdev@vger.kernel.org>, ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
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

On Mon, Sep 27, 2021 at 10:42 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 27 Sep 13:15 PDT 2021, Arnd Bergmann wrote:
> > On Mon, Sep 27, 2021 at 9:52 PM Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > An easier option might be to find a way to build QCOM_SCM without
> > RESET_CONTROLLER for compile testing purposes. I don't know
> > what would break from that.
> >
>
> Afaict the reset API is properly stubbed and RESET_CONTROLLER is a bool,
> so I think we can simply drop the "select" and the kernel will still
> compile fine in all combinations.
>
> When it comes to runtime, we currently select RESET_CONTROLLER from the
> Qualcomm common clocks. If that is dropped (why would it...) it seems
> possible to build a custom kernel for msm8916 that we can boot and miss
> the stubbed out "mss restart" reset line from the SCM.
>
>
> So, let's just drop the select RESET_CONTROLLER from SCM for now.

Ok, I've made that change locally, giving it more time on the randconfig
build box now.

       Arnd

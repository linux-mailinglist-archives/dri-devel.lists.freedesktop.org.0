Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1528433496D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 22:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3DA6EA5B;
	Wed, 10 Mar 2021 21:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135196E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 11:43:42 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id n14so17558815iog.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 03:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7MDculd5PWLFOFwl290sy7CTqICAtBb0zJmC/83JNiY=;
 b=jyhuw1uUViTVh9mqzgoJ/J29crJCPM2TJeyX7WB/RlRW8RVVbQjnWXpzdkbCZfVK7y
 RRrsVERxnfxdAdkz2Wf6fgMQwHQl2It5TUvgjZbP1buY9VW1KR7M/9aF3D/QnUKV/wEi
 0eV7hG5BSbChAnQSi7vhkbAdfpTyn3eiIwZbKdRdU1FMzRH0XrE0EyxjNo5CgF+fzKAm
 i08ouwrBHH3ksVRAE7HJ7qX2f2p4KcP8AQz2XuiChoZ72uOpj1oWu0rCxwH1MzwczzzS
 lDyySAebm6U41iADqPqpRAQMBt1vPFmbIYT316NfnAOljlhkKJhuins3NibQAaRdQNd0
 0cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7MDculd5PWLFOFwl290sy7CTqICAtBb0zJmC/83JNiY=;
 b=FRW9JL8riU5G2SjABHgrulDPXHcf11N5QKftj0ckcmQpYRiBiraX/ZSfx+iN/CpkG6
 Qe1dv6wupaMOrS9T9ZMbO+7wq2xtijVC4OJ0dJtFMRLfaENtfdUe7W5t6Gm5XI0BIXm+
 REqCUR4rJwhK9p23BsY8244MFLI1OGiFKtCy/WxDUEZcCqVt5YC3mv8ruFqipnItVswQ
 Bgz8LUYO5cMo9FhN+K9gTpT4akhoHOg6lx1hLY7cLlHaCTS9hComqu4BOHA8Zk7i4sXn
 uo8OnTNstu67T5o7alOyZCheVrKrn+CH0iBxMTVQFzjj9PNpPrOf1ifj5TwdoyWXoxwk
 8g3A==
X-Gm-Message-State: AOAM532PW7K3AnwCE4vcElsCTFCMN4q1CbPPrRXtAAbhh1+Ox/EqvTcj
 lwLH2NwQZtLFmuKUNT/mPa+EKtRoxvnFe+P8RZI=
X-Google-Smtp-Source: ABdhPJymqoFFgZdz05brxOTgEYkI3NFm4i5o0rEnCSDmm6k2DAHa0k4EB+ukDihO1Mqa2o6zn3/4hb1NiTISMd094i4=
X-Received: by 2002:a6b:4f09:: with SMTP id d9mr2013952iob.60.1615376621486;
 Wed, 10 Mar 2021 03:43:41 -0800 (PST)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-6-git-send-email-dillon.minfei@gmail.com>
 <159056850384.88029.10852284922297394339@swboyd.mtv.corp.google.com>
In-Reply-To: <159056850384.88029.10852284922297394339@swboyd.mtv.corp.google.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 10 Mar 2021 19:43:05 +0800
Message-ID: <CAL9mu0+Uh84UGQ-1EW4+eVE1cFxuxJxLTLAa0rgJ_5C2pchUgA@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] clk: stm32: Fix stm32f429's ltdc driver hang in
 set clock rate
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Approved-At: Wed, 10 Mar 2021 21:07:59 +0000
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hua Dillon <dillonhua@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 thierry.reding@gmail.com,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

still need more expert to review, so just a gentle ping for this patch

On Wed, May 27, 2020 at 4:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting dillon.minfei@gmail.com (2020-05-27 00:27:29)
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This is due to misuse \u2018PLL_VCO_SAI' and'PLL_SAI' in clk-stm32f4.c
> > 'PLL_SAI' is 2, 'PLL_VCO_SAI' is 7(defined in
> > include/dt-bindings/clock/stm32fx-clock.h).
> >
> > 'post_div' point to 'post_div_data[]', 'post_div->pll_num'
> > is PLL_I2S or PLL_SAI.
> >
> > 'clks[PLL_VCO_SAI]' has valid 'struct clk_hw* ' return
> > from stm32f4_rcc_register_pll() but, at line 1777 of
> > driver/clk/clk-stm32f4.c, use the 'clks[post_div->pll_num]',
> > equal to 'clks[PLL_SAI]', this is invalid array member at that time.
> >
> > Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

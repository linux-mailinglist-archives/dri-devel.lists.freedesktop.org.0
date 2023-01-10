Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937E66647AC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 18:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE5410E036;
	Tue, 10 Jan 2023 17:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D986410E036
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 17:50:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so7715396wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nt9ArI+JjVqSRJaIaSBcPk+r+kr6d2qBthz/f2axQJM=;
 b=HGipDWE5HW9bTEU2/qD84yGEWOVC12wVGDqy8fSs90yMMlpL3OSPTghTLyEfPJNz9E
 tJSjOvJtFJHhefemW1op/zFo0gubT/EK1hzowZRk2D6do/CDdvLUmfCcgft2DLQPy6Ur
 z5Wc6VFxe74vZrOQyQYR8Wfq+xZwl/vxgUKOaCyr7OdGmfmeZDArNQwvBBeS8jpjV30x
 Gf2T6OrR016HWzkQ2AIl1vG3gs7DZ067kSvfzRz1cwgwrYpbYUNy9Ibnht2JqZneci8B
 i/bS5foJFhvjTR3VEFKeGRZKZ4uJSYneV5Xun5UB6dH1tnalmTSNF51GVGS+JpXIrzSy
 qRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nt9ArI+JjVqSRJaIaSBcPk+r+kr6d2qBthz/f2axQJM=;
 b=bx3nYjZJRIwCaaXcry7FjsSTvn7Od3Yq3eB4urxLohDYP75TQLUvPLDx22AJgS1PY+
 vhxL1Ggp/bZt1c9MoNqZVvyG4oE6nxGBHGCo01B3hBpPSimD+3Iy0p1yMxCmQDpIUIwz
 pQLYrHZ8+rODIYXJyi8S/XDobpSMFsgRrtfLqpUsXT2K/aFLjFIFfuQJdhnfe3FIU/Hm
 /aTlAkk6sngmE5kkm8IfYn34uuH70GGFhUtQKk/AysrD8X6jHPBOVNfTMV5r0Zq2xnft
 wtMiizMYRKNbNCVVBKsDOs7Tp5AvLFpQmpM019x9eJVIqHd6rZYAHmorepu22UkLagG/
 hM/A==
X-Gm-Message-State: AFqh2krVq24bcQk04W/Bxi2DM7L6eDH2+VlnkPrBmTjP7a0pSshbqD9F
 O39zQPl3xIJewSwWuBjh+W0CaQ==
X-Google-Smtp-Source: AMrXdXuCJL4uQ+PBinA6P/b9RggIwyThMBDurC6C+ptBksadjtbuhYRNXWKJCyEah587HtAqAuvABA==
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id
 n18-20020a05600c501200b003d35a4a9103mr49094369wmr.31.1673373032253; 
 Tue, 10 Jan 2023 09:50:32 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003c6f3f6675bsm21934771wmq.26.2023.01.10.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:50:31 -0800 (PST)
Date: Tue, 10 Jan 2023 17:50:30 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] backlight: pwm_bl: Don't disable the PWM to disable
 the backlight
Message-ID: <Y72lZi+Ghtjm/r8i@aspen.lan>
References: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
 <20230109204758.610400-2-u.kleine-koenig@pengutronix.de>
 <Y72RpjK4T2VEoIVI@aspen.lan>
 <20230110173500.7w55deshspedexh6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110173500.7w55deshspedexh6@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 06:35:00PM +0100, Uwe Kleine-König wrote:
> Hello Daniel,
>
> On Tue, Jan 10, 2023 at 04:26:14PM +0000, Daniel Thompson wrote:
> > On Mon, Jan 09, 2023 at 09:47:58PM +0100, Uwe Kleine-König wrote:
> > > Most but not all PWMs drive the PWM pin to its inactive state when
> > > disabled. Rely on the lowlevel PWM implementation to implement
> > > duty_cycle = 0 in an energy efficient way and don't disable the PWM.
> >
> > I'm a little worried about this one.
> >
> > I thought the PWM APIs allow the duty cycle to be rounded up or down
> > slightly during the apply.
>
> In my book only rounding down is correct, but in practise there is some
> deviation.
>
> Nearly all PWMs can implement a zero duty cycle. Those that cannot but
> emit a constant inactive signal when disabled are expected to disable
> when .duty_cycle = 0 is requested. (And for those that can neither
> implement a zero duty_cycle nor emit the inactive level (not sure there
> is any) all bets are lost with and without my patch.)
> So if this case will be hit (and noticed) this is fixable.
>
> However there are hardware PWMs that just freeze in their current state
> when disabled (e.g. mxs). That's why .duty_cycle=0 + .enabled=true is
> the safer bet. Only disable a PWM if you don't rely on the output state.
> See also commit 80a22fde803af6f390be49ee5ced6ee75595ba05.

Reading this, it does strike me that if pwm_bl has a regulator or an
enable GPIO then it does not rely on the output state. We could use
the presence of either of these to choose to disable the PWM
(which could potentially undrive the pin to save power).


> > So when you say "rely on the lowlevel to implement duty_cycle = 0 to..."
> > is it confirmed that this is true (and that all PWMs *can* implement
> > a duty_cycle of 0 without rounding up)?
>
> The scenario I had in mind that can realistically go wrong here is that
> a lowlevel driver that has the property that the inactive level is
> emitted for a disabled HW doesn't actually disable when .duty_cycle=0 is
> requested and so might consume slightly more energy. But I'm confident
> my patch is an improvement and I don't expect regressions. (Famous last
> words :-)
>
> I suggest to amend the commit log and add something like:
>
>    If this change results in a regression, the bug is in the lowlevel
>    pwm driver.

I guess I can live with that :-) .

If the reasoning about regulator or enable GPIO makes sense then let's
implement that. If not, a terse comment in the code reminding some
future version of me that disabled PWM has undefined state (making
clear that the absense of enable = false is deliberate) would be useful!


Daniel.

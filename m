Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF01E396B
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 08:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BAD89B99;
	Wed, 27 May 2020 06:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2DD89B99
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 06:40:14 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFFB32075A;
 Wed, 27 May 2020 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590561613;
 bh=geQPN2cB7sxO9U2Sau5QlOGksrlZFmA5S78FxZUADUM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CnmHpunOPyTq3p5AkW+fF2hEnKTTjCaUJEHXzWbZJNrRTIW0EhJuXpZUWTQhfOfsA
 78AZGWXjn2/fM6+vKQFsDRMqHYUk3y/lWdTQ6ESUvaiQxRvN8udsd4GLl8zidYy1Z6
 RRI9+cYYrMQZhQLEk7oi1XwbszKyBE07hvreYo2o=
MIME-Version: 1.0
In-Reply-To: <CAL9mu0L1OxDMHwNjfh+11br+z3vt+wyq45Q7-KNVSLTENAxH+Q@mail.gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-6-git-send-email-dillon.minfei@gmail.com>
 <159054389592.88029.12389551390229328953@swboyd.mtv.corp.google.com>
 <CAL9mu0L1OxDMHwNjfh+11br+z3vt+wyq45Q7-KNVSLTENAxH+Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] clk: stm32: Fix stm32f429's ltdc driver hang in
 set clock rate,
 fix duplicated ltdc clock register to 'clk_core' case ltdc's clock turn off by
 clk_disable_unused()
From: Stephen Boyd <sboyd@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Date: Tue, 26 May 2020 23:40:13 -0700
Message-ID: <159056161305.88029.13112387855463478530@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRM PANEL DRIVERS <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting dillon min (2020-05-26 20:30:47)
> On Wed, May 27, 2020 at 9:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting dillon.minfei@gmail.com (2020-05-24 20:45:45)
> > > From: dillon min <dillon.minfei@gmail.com>
> 
> >
> > >
> > > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> >
> > Any Fixes tag?
> ok, will add --fixup in git commit next time, this patch fix two bugs,
> i should make two commit, each one has a
> fixes tag, right?
> first point to '517633e clk: stm32f4: Add post divisor for I2S & SAI PLLs'
> second point to 'daf2d11 clk: stm32f4: Add lcd-tft clock'

Sounds good. Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42824183E2B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 02:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5C6E26F;
	Fri, 13 Mar 2020 01:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8418C6E26F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 01:01:50 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54B3220637;
 Fri, 13 Mar 2020 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584061310;
 bh=x5AeLJyWyoIGFX+5Aa87kt9hQBBmnyGXbQ3/T3AqMkQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=W9pRQZvOYY6JUPfum0Gaehu89VEbg3YArAi7o1G9YMddG1IH8VX4dSmBjuQz0WpDi
 MFHtvxjrx/LmGY9yOgvy2Nc+JfNT48HMz2UEZ725Ql2oWw2oOeGqGCekvIqILo+O/J
 07nTyLQzg7Tx/jiayemVhFKQGpPmXxGjUYbdH6aA=
MIME-Version: 1.0
In-Reply-To: <6a1fc860262ecec585cbe8ff268318a0783f3296.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6a1fc860262ecec585cbe8ff268318a0783f3296.1582533919.git-series.maxime@cerno.tech>
Subject: Re: [PATCH 20/89] clk: bcm: rpi: Make the PLLB registration function
 return a clk_hw
From: Stephen Boyd <sboyd@kernel.org>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Thu, 12 Mar 2020 18:01:49 -0700
Message-ID: <158406130956.149997.16470857788374770112@swboyd.mtv.corp.google.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2020-02-24 01:06:22)
> The raspberrypi_register_pllb has been returning an integer so far to
> notify whether the functions has exited successfully or not.
> 
> However, the OF provider functions in the clock framework require access to
> the clk_hw structure so that we can expose those clocks to device tree
> consumers.
> 
> Since we'll want that for the future clocks, let's return a clk_hw pointer
> instead of the return code.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8C1E399B
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 08:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5586E22B;
	Wed, 27 May 2020 06:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BF16E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 06:49:00 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 049D920787;
 Wed, 27 May 2020 06:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590562140;
 bh=e/7In+HgkoO1mXBVUF9g204ShooYF92hAISZ5kUXuns=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=vCo++hyiXNJhkarIrlSfMjKSxASpGZXV/u51UMb1EXwusISY2T2QMCN9SusJ/FHU3
 GKsY/m7x3d6bPg6A9CwotXMkQFipUFxJZouiHp8EHZMGMJDsdWWPowiEjM0DE9HMJg
 0W33vB6Y9xKf0jbcDuzQ5AJ6+TPNc0vzT54m4qp0=
MIME-Version: 1.0
In-Reply-To: <3eda4a838ba441b5cd8daf59a7e5115172d82c97.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <3eda4a838ba441b5cd8daf59a7e5115172d82c97.1587742492.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v2 09/91] clk: bcm: rpi: Make sure pllb_arm is removed
From: Stephen Boyd <sboyd@kernel.org>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Tue, 26 May 2020 23:48:59 -0700
Message-ID: <159056213937.88029.2975519351515271642@swboyd.mtv.corp.google.com>
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

Quoting Maxime Ripard (2020-04-24 08:33:50)
> The pllb_arm clock was created at probe time, but was never removed if
> something went wrong later in probe, or if the driver was ever removed from
> the system.
> 
> Now that we are using clk_hw_register, we can just use its managed variant

clk_hw_register()

> to take care of that for us.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

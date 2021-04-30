Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562137028A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 22:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94D96F5BF;
	Fri, 30 Apr 2021 20:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFC06F5BF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 20:59:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1E4B6145B;
 Fri, 30 Apr 2021 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619816380;
 bh=sTjsy5WOTgX1u10dfsQUQso5+PDbD5rVnV7Ng/jVLM8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ME0A2FUs/7EEXR/1WE1FVH20j5QwRXH6s5oOgVgmA3+1TjSlUolDTVZwf06KP0KUp
 ccEJLBYxYSkacxlf7II9BhkeyFw+La9xa1hqId3OBHRe8Qj3Dg7ieL0u+yzQC0re8+
 rVr7e9lfHNMhd5pkBnof+krnJtPW2psJWFRH63Ngdd+0rdSwpsbbp3ZXiRikiapMN0
 WfMF65ECWeocstXBAiC4SYpy9uNnyf6gJPBxzVCb+ds/CJAu25+oVqjIowRxRaocl5
 DPuygzxixHJzObbq6Sf7dV8xcN42YjaKqJ2OwaeGu+c/6MssC5Oq7lWn6IDGbmOfor
 OTDMGKIm6AhMw==
MIME-Version: 1.0
In-Reply-To: <20210413101320.321584-1-maxime@cerno.tech>
References: <20210413101320.321584-1-maxime@cerno.tech>
Subject: Re: [PATCH 0/2] clk: Implement a clock request API
From: Stephen Boyd <sboyd@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Date: Fri, 30 Apr 2021 13:59:39 -0700
Message-ID: <161981637939.1363782.4943687720432536625@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2021-04-13 03:13:18)
> Hi,
> 
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
> 
> This implements a mechanism to raise and lower clock rates based on consumer
> workloads, with an example of such an implementation for the RaspberryPi4 HDMI
> controller.
> 
> There's a couple of things worth discussing:
> 
>   - The name is in conflict with clk_request_rate, and even though it feels
>     like the right name to me, we should probably avoid any confusion
> 
>   - The code so far implements a policy of always going for the lowest rate
>     possible. While we don't have an use-case for something else, this should
>     maybe be made more flexible?

I'm definitely confused how it is different from the
clk_set_rate_exclusive() API and associated
clk_rate_exclusive_get()/clk_rate_exclusive_put(). Can you explain
further the differences in the cover letter here?

> 
> Let me know what you think
> Maxime
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

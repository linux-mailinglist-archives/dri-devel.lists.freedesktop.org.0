Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417C4BD8C3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79094112CED;
	Mon, 21 Feb 2022 09:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C807112CEB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:56:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E31B4482;
 Mon, 21 Feb 2022 10:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645437416;
 bh=9ol1LLJ0MK3halGFf3UsVhNTQFeGLZcCdCTR4+oJaRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6d8bpTdVXU0fnX6/vuLI/9SX75NiehSbTTC2X/rBtPaxBvfKQLDGbhV3Qlgvs5qB
 mRo58D87bPnKCyFE0JoED6qE3JSHbHRNQsA0jcHu3YqQNeSNLy//eMMho71mutpqQz
 igIe0ofqXZwKOLRUNIi2mQOKaD0bkcqS3usye8j4=
Date: Mon, 21 Feb 2022 11:56:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 0/10] clk: Improve clock range handling
Message-ID: <YhNh36zJVRXuiEwd@pendragon.ideasonboard.com>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <Ygok1IPElQ8Zn4Ii@pendragon.ideasonboard.com>
 <20220219022410.6557FC340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220219022410.6557FC340E9@smtp.kernel.org>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

(CC'ing Jean-Michel)

On Fri, Feb 18, 2022 at 06:24:08PM -0800, Stephen Boyd wrote:
> Quoting Laurent Pinchart (2022-02-14 01:45:56)
> > Hi Maxime and Stephen,
> > 
> > We have recently posted a driver for the BCM2711 Unicam CSI-2 receiver
> > (see [1]) which is a perfect candidate for this API, as it needs a
> > minimum rate for the VPU clock. Any chance we can get this series merged
> > ? :-)
> 
> The rate range API already exists, but it's busted. I can see you like
> the patch series, can you provide any Reviewed-by or Tested-by tags?

Jean-Michel, as you're working on upstreaming the RPi Unicam driver
which is our use case for this API, could you test this patch series ?

-- 
Regards,

Laurent Pinchart

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6231838C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 03:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCE56EDBE;
	Thu, 11 Feb 2021 02:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBAE6EDBE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 02:28:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2916464E30;
 Thu, 11 Feb 2021 02:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613010482;
 bh=cEVcWPt97Wr0bZy0eBDwrn3QC7JXXN8/X6TxRjqIjXI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=dUyAPvKQwvu5ZpSHZQF9oi1vVselOwj8N8gpDkRJH7AmecXuUKgz966VnXazG8j3T
 CLxlRRONFsk3Abx3fHBbnnFatbmZZjlX9xiOLElKy4T0kRFc91vjsS3VjJ5IpkhJV3
 WVazt1eTx7enpR1xyCvSfmziW143xCJRaq2p7vb+EBpwwNiOAVekvIrX4S2sGTDp25
 k0jEqGOlimqaHTG+KwdTHdzWv/UOI7twDrySJTI6E7dJLR9QFgwitVUlfwjcwlmhPW
 ZHH02SPvCWdE4TFLipl9t7PbL2cOlWh+DA5J70pdXyZbjf1l3JuEO4ug67sAK+lD3U
 ulskgMw/tTOnQ==
MIME-Version: 1.0
In-Reply-To: <20210210102904.xyr6bftn4ueuu74z@gilmour>
References: <20210209175900.7092-1-jernej.skrabec@siol.net>
 <20210209175900.7092-2-jernej.skrabec@siol.net>
 <20210210102904.xyr6bftn4ueuu74z@gilmour>
Subject: Re: [PATCH v3 1/5] clk: sunxi-ng: mp: fix parent rate change flag
 check
From: Stephen Boyd <sboyd@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>, Maxime Ripard <maxime@cerno.tech>,
 mturquette@baylibre.com
Date: Wed, 10 Feb 2021 18:28:00 -0800
Message-ID: <161301048085.1254594.6786751472945742937@swboyd.mtv.corp.google.com>
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2021-02-10 02:29:04)
> Hi Mike, Stephen,
> 
> On Tue, Feb 09, 2021 at 06:58:56PM +0100, Jernej Skrabec wrote:
> > CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
> > one. Fix that.
> > 
> > Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when allowed")
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Tested-by: Andre Heider <a.heider@gmail.com>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> This is a last minute fix for us, can you merge it into clk-fixes directly?
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 

It's also fixing a problem that's been around since v5.0. Is something
broken that needs fixing this late? The motivation could be added to the
commit text because right now it looks like a typo fix spotted visually.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

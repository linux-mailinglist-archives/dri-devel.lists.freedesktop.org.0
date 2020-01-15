Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C02313C108
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D926E960;
	Wed, 15 Jan 2020 12:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBBB6E960
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:31:51 +0000 (UTC)
Received: from localhost (unknown [223.226.122.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B68A0214AF;
 Wed, 15 Jan 2020 12:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579091511;
 bh=mj/hReSoRHp5ydIC4cRcSvA+mXisS9dp2mIrgDLg1zg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yB1CEdipMT24qNy8hy+KhE7gUIehT6Af306QNSUVUtQWok+N54kT9/FshiIHE1jwD
 G/fq4ukzF+hoQFC22Pz5JKTdrfyMPxhHvni+G11vjQHuDaPFV97A5DsVfaGRikPSx/
 RkTYR3KBIQMu66Vo0pvTYyAKL3aCUNh8F4SPyCVE=
Date: Wed, 15 Jan 2020 18:01:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH 1/2] dmaengine: sun4i: Add support for cyclic requests
 with dedicated DMA
Message-ID: <20200115123137.GJ2818@vkoul-mobl>
References: <20200110141140.28527-1-stefan@olimex.com>
 <20200110141140.28527-2-stefan@olimex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110141140.28527-2-stefan@olimex.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10-01-20, 16:11, Stefan Mavrodiev wrote:
> Currently the cyclic transfers can be used only with normal DMAs. They
> can be used by pcm_dmaengine module, which is required for implementing
> sound with sun4i-hdmi encoder. This is so because the controller can
> accept audio only from a dedicated DMA.
> 
> This patch enables them, following the existing style for the
> scatter/gather type transfers.

I presume you want this to go with drm tree (if not let me know) so:

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

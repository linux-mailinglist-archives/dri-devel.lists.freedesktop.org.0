Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A643143C97
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 13:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A546A6ECA0;
	Tue, 21 Jan 2020 12:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42D16ECA0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 12:14:07 +0000 (UTC)
Received: from localhost (unknown [171.76.119.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B222A2073A;
 Tue, 21 Jan 2020 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579608847;
 bh=Qq3v/FQs81Z4u3h/BT7zP7lIhmAukfuHUqvLomvAe2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3SfLdxAoH9lXTgviaGdxEEl8nstuFNd2zRY3BHNhdqp7YUCg7QXEXKixsKmRxHX3
 9F0Fa3pogu6a6IKs20YUE+vsokLsny+vHu5lpHCodkcVtQ6ZtO+ZwVolZpTq89HxKb
 C+IU7xZmZtRhEW3HAO68Aly8DcgIt2c0aG6kJffQ=
Date: Tue, 21 Jan 2020 17:44:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH 1/2] dmaengine: sun4i: Add support for cyclic requests
 with dedicated DMA
Message-ID: <20200121121402.GP2841@vkoul-mobl>
References: <20200110141140.28527-1-stefan@olimex.com>
 <20200110141140.28527-2-stefan@olimex.com>
 <20200115123137.GJ2818@vkoul-mobl>
 <20200115170731.vt6twfhvuwjrbbup@gilmour.lan>
 <20200121083514.GE2841@vkoul-mobl>
 <54b1a38f-3903-49b7-d20b-f97824a528ba@olimex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54b1a38f-3903-49b7-d20b-f97824a528ba@olimex.com>
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

On 21-01-20, 13:37, Stefan Mavrodiev wrote:
> 
> On 1/21/20 10:35 AM, Vinod Koul wrote:
> > On 15-01-20, 18:07, Maxime Ripard wrote:
> > > On Wed, Jan 15, 2020 at 06:01:37PM +0530, Vinod Koul wrote:
> > > > On 10-01-20, 16:11, Stefan Mavrodiev wrote:
> > > > > Currently the cyclic transfers can be used only with normal DMAs. They
> > > > > can be used by pcm_dmaengine module, which is required for implementing
> > > > > sound with sun4i-hdmi encoder. This is so because the controller can
> > > > > accept audio only from a dedicated DMA.
> > > > > 
> > > > > This patch enables them, following the existing style for the
> > > > > scatter/gather type transfers.
> > > > I presume you want this to go with drm tree (if not let me know) so:
> > > > 
> > > > Acked-by: Vinod Koul <vkoul@kernel.org>
> > > There's no need for it to go through DRM, it can go through your tree :)
> > okay in that case I have applied now :), thanks
> > 
> Hi,
> 
> Should I keep this patch in the future series or drop it?

Drop it :) It would be in linux-next tomorrow!

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

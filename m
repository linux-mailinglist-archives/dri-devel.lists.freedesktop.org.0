Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDD648CBC2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 20:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C32210E70A;
	Wed, 12 Jan 2022 19:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0D410E9EA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 19:21:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 9798E1F45401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642015262;
 bh=lVHuJTVCQf5aCg943yBiAayu7pXkQ77QSMPJdhYfbC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PBDxUUFsJpdNyl14wheLSRX1rijOtRWsEHWy8+cwOq/vwIcnuQ4ARBRlPnp8GrZJP
 aUSNZrx7bFzOgK07ZCIB75he9IyAKiPZNMXOj2DaXQSKL6nCBEbCZILQkPgF5VxcCx
 eMmugtJLiofXyXPERPP39vS61ytniy1VY1b+nTgmlNAhof7guJm8KADHARMFz6n5lI
 lCUqbaqpn0K2L+7cv2DgekyYTP+ips7cSflfDUnQWTqLB5zf3x4IUJf5tQ1O4yzYv+
 pBq9yG1UU4wHePivoVEdbBMvF67EycY/gbr43pEbPbP0Rt2dEL6EbRVeebEwXewsmd
 8hvRW7GLet/Fg==
Date: Wed, 12 Jan 2022 14:20:54 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/2] drm/panfrost: Merge some feature lists
Message-ID: <Yd8qFqkTqzdUzOxc@maud>
References: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
 <20220109170920.2921-3-alyssa.rosenzweig@collabora.com>
 <c34845c7-481b-91c1-d2ae-e239324f8364@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34845c7-481b-91c1-d2ae-e239324f8364@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Now that we only list features of interest to kernel space, lots of GPUs
> > have the same feature bits. To cut down on the repetition in the file,
> > merge feature lists that are identical between similar GPUs.
> > 
> > Note that this leaves some unmerged identical Bifrost feature lists, as
> > there are more features affecting Bifrost kernel space that we do not
> > yet hanlde.
> 
> NIT: s/hanlde/handle/ ;)
> 
> Do you have any features in mind that we're missing? The list looks very
> similar to the kbase one. And anyway it is simple enough to split again
> if we need to.

Just IDVS group size. For some reason I thought there were more when I
wrote that commit message. It's split to avoid churn in that patch.

Logically, this series should contain three patches, with the IDVS group
size enablement patch at the end. That was the series I wrote and
committed to disk. For review I split it out, since the feature clean-up
can land now, while the (RFC) IDVS group size patch needs
testing/benchmarking.

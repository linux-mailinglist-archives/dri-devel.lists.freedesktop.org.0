Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B033522C35
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6F410E4B4;
	Wed, 11 May 2022 06:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AD510E398;
 Wed, 11 May 2022 06:23:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96CA3B82143;
 Wed, 11 May 2022 06:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CF1C385D1;
 Wed, 11 May 2022 06:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652250179;
 bh=dr1sS53G4Pm1TyL5NsyZonMQdvda/MUhmA20m7oW+z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tCHRDyaGR/wgK9C5TITSFPPM9YlIjPDgY0oE8C8NjR7J+qG1gD8mlS/Cvn8MihHwq
 0ZuQFmf6VbMmJB/OtN3emjcuijgLE2JhdCaL24vp8q30p98Uv+lr0x960Y6+uT/Vmd
 ERIluI0KmC+Px3sf0zdAJ+X0HzEpMgPydBrZ1Hjs=
Date: Wed, 11 May 2022 08:22:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
Message-ID: <YntWQIXSqMCd6TYV@kroah.com>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Paul <sean@poorly.run>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 03:06:47PM +1000, Dave Airlie wrote:
> > And use it to store expectations about what the drm/msm driver is
> > supposed to pass in the IGT test suite.
> 
> I wanted to loop in Linus/Greg to see if there are any issues raised
> by adding CI results file to the tree in their minds, or if any other
> subsystem has done this already, and it's all fine.

Why does the results need to be added to the tree?  Shouldn't they be
either "all is good" or "constantly changing and a constant churn"?

> I think this is a good thing after our Mesa experience, but Mesa has a
> lot tighter integration here, so I want to get some more opinions
> outside the group.

For systems that have "tight integration" this might make sense as proof
that all is working for a specific commit, but I can't see how this will
help the kernel out much.

What are you going to do with these results being checked in all the
time?

thanks,

greg k-h

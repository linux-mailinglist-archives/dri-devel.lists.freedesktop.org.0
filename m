Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F709ADD13
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 09:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AB910E8BD;
	Thu, 24 Oct 2024 07:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EXDsSjLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E40C10E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 07:08:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE0AB5C5570;
 Thu, 24 Oct 2024 07:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659C3C4CEC7;
 Thu, 24 Oct 2024 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1729753696;
 bh=PKc1Ezq4d15KDwftSYsYrCXzavd/TwVvK03GAg5yH8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EXDsSjLYy/i5gU8PDLYZ96TpQdUoX/l3LzwwOhNGiQ1i+55LFSBuh0KUoAjION0q1
 3/eyAr6Zj4/7bU9Gcyj+8Ai+3vS1gTwNeUYvxBUXoUwnGvVSURyPzfUtq7S8GHfSBw
 CQqZiDGcF6YDPG6noOQlLhky4XPIh7s+ddxatdR4=
Date: Thu, 24 Oct 2024 09:08:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Saravana Kannan <saravanak@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] A few minor fw_devlink fixes
Message-ID: <2024102457-manager-counting-ff68@gregkh>
References: <20241024061347.1771063-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 23, 2024 at 11:13:41PM -0700, Saravana Kannan wrote:
> Probably easiest for Greg to pull in these changes?
> 
> PSA: Do not pull any of these patches into stable kernels. fw_devlink
> had a lot of changes that landed in the last year. It's hard to ensure
> cherry-picks have picked up all the dependencies correctly. If any of
> these really need to get cherry-picked into stable kernels, cc me and
> wait for my explicit Ack.

You can do that with the correct tag in the commit as per the stable
documentation if you really want to :)

But why would these not be able to go backwards?  What changed to
require them now and not be ok for older kernels?

thanks,

greg k-h

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A381D9ADD0F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 09:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD2E10E8BB;
	Thu, 24 Oct 2024 07:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vcR+ON1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0147B10E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 07:07:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C978A450D4;
 Thu, 24 Oct 2024 07:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AE1C4CEC7;
 Thu, 24 Oct 2024 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1729753624;
 bh=C569kiRrg8EBzvrVBxsDovVURiA3bvbD+xQMy8MTaO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vcR+ON1zIdm5O0maAVHBiW/e9Z+mDFWtdnlURA7545m/v7ld0MzrrHrbftr60A8UM
 cjD/QBovrRyxNdG8dH117G4LKWY5cxmnP2FbDJKxlXLsajOk3QcxaeixwRbG3SlP5N
 Cj8fmrhLFnefYYpBpd1lf0IK3VV6qe4wobNUPqdU=
Date: Thu, 24 Oct 2024 09:06:53 +0200
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
Subject: Re: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a
 bit more useful
Message-ID: <2024102446-robin-outcast-841b@gregkh>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-4-saravanak@google.com>
 <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
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

On Wed, Oct 23, 2024 at 11:16:26PM -0700, Saravana Kannan wrote:
> Greg,
> 
> Can you fix up the commit subject prefix to "driver core: fw_devlink:"
> please? Don't want to send v2 just for that.

Will do, thanks!

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA29786EC1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBCA10E516;
	Thu, 24 Aug 2023 12:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44C110E516;
 Thu, 24 Aug 2023 12:10:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BDB860DF2;
 Thu, 24 Aug 2023 12:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05851C433C8;
 Thu, 24 Aug 2023 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692879029;
 bh=CSd7vG2+yNbJmLSmxOK+LsxZvdAIs3DMqKIQeuztz18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tFJbBINOq8JmJtKGPhs0L1Tw3WTJBWJTDl4a4w7RTYJGEaNX/Q783RjyHyKeT9Asc
 SNprwNp4Fpq2UruIWGxPe0BToLjLbqOgVy3nUrd6pshQHuQGwNomGKQN6Qu0+m7bSd
 v52CdmPFULl8ZaGEzVr3yG9n3NlzcB6wczuvtrkjCwsrDU7X7c6z9wRDOec3Cszd6X
 oKOefxOE8+zH9Fb1Q9h1QxXi+fC+5vGtWf5cMqBOPqO8RWh8ROkPp1QbJ77LnY6IVd
 qbCr4GM1ioU36JXHCbYmzQ3lR5Vxodq55YFiMpZJLRCX4xbL2rW4H0a27iAroMsm7k
 yyv6rvjRhvkZw==
Date: Thu, 24 Aug 2023 13:10:19 +0100
From: Lee Jones <lee@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
Message-ID: <20230824121019.GU1380343@google.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <169286759481.453038.12943953579128536191.b4-ty@kernel.org>
 <pkjgu5hfazblvlnolvsbzo6zt7yq4zldjmmuoufgv5txvzdiyc@2vplkaitfypc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pkjgu5hfazblvlnolvsbzo6zt7yq4zldjmmuoufgv5txvzdiyc@2vplkaitfypc>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, NXP Linux Team <linux-imx@nxp.com>,
 amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-media@vger.kernel.org,
 Stanley Yang <Stanley.Yang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linaro-mm-sig@lists.linaro.org,
 linux-tegra@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Maxime Ripard wrote:

> Hi,
> 
> On Thu, Aug 24, 2023 at 10:59:54AM +0200, Maxime Ripard wrote:
> > On Thu, 24 Aug 2023 08:36:45 +0100, Lee Jones wrote:
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > > 
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> > > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Cc: Jerome Glisse <glisse@freedesktop.org>
> > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linux-tegra@vger.kernel.org
> > > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: "Maíra Canal" <mairacanal@riseup.net>
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Michal Simek <michal.simek@xilinx.com>
> > > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > > Cc: nouveau@lists.freedesktop.org
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shashank Sharma <shashank.sharma@amd.com>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Stanley Yang <Stanley.Yang@amd.com>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > 
> > > [...]
> > 
> > Applied to drm/drm-misc (drm-misc-fixes).
> 
> I got confused with b4 usage, but that wasn't actually applied. Only the
> three patches I explicitly mentioned were, sorry for the confusion.

:)

Thanks Maxime.

-- 
Lee Jones [李琼斯]

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E72786EF4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5953810E542;
	Thu, 24 Aug 2023 12:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B7410E541;
 Thu, 24 Aug 2023 12:24:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DFEA60C4F;
 Thu, 24 Aug 2023 12:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2CBC433C7;
 Thu, 24 Aug 2023 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692879851;
 bh=rXHeHAFXjN/zA3rYC/1HhA1l11PWkd2Qvj22VCRsCGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CqOlaS/QfUs5XXJTiSG68eVAETcwld0Oyyw2XmGw3vbPcDbOEpspeApsyEBSY0lzY
 BJl4NEsEvECi0Fn66tjoluhCVVSbj/3Fe3eaBPUimBzycU6Ew02hPKbed/8je8CkRf
 1+WsWnIyZzbwSlIn/6j5RP45+CkV50Bn18C+mlY07Wd9kkPeHC9Xv+VQYWAGMT8iqG
 LXQzMPYXHDBPiYetArnubErS0XhVoCULd5vNPc0T7OZ+5eZRVXxQpCJkyh5R3oVYEa
 qX2bk7/9/M9K5EutOOlmwBQ30zkp0qc/t1PRSgiuL+KJDx47ih8QPQIzlYGQ4Wflwi
 HyIl1AsJiWaIg==
Date: Thu, 24 Aug 2023 13:24:01 +0100
From: Lee Jones <lee@kernel.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
Message-ID: <20230824122401.GY1380343@google.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <87wmxk4xt3.fsf@intel.com> <20230824120735.GS1380343@google.com>
 <a3c4c781-2f74-4b09-9db4-7b947897ef5a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3c4c781-2f74-4b09-9db4-7b947897ef5a@amd.com>
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
 Shashank Sharma <shashank.sharma@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Stanley Yang <Stanley.Yang@amd.com>, linux-media@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Hyun Kwon <hyun.kwon@xilinx.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Hamza Mahfooz wrote:

> 
> On 8/24/23 08:07, Lee Jones wrote:
> > On Thu, 24 Aug 2023, Jani Nikula wrote:
> > 
> > > On Thu, 24 Aug 2023, Lee Jones <lee@kernel.org> wrote:
> > > > This set is part of a larger effort attempting to clean-up W=1
> > > > kernel builds, which are currently overwhelmingly riddled with
> > > > niggly little warnings.
> > > 
> > > The next question is, how do we keep it W=1 clean going forward?
> > 
> > My plan was to fix them all, then move each warning to W=0.
> > 
> > Arnd recently submitted a set doing just that for a bunch of them.
> > 
> > https://lore.kernel.org/all/20230811140327.3754597-1-arnd@kernel.org/
> > 
> > I like to think a bunch of this is built on top of my previous efforts.
> > 
> > GPU is a particularly tricky though - the warnings seem to come in faster
> > than I can squash them.  Maybe the maintainers can find a way to test
> > new patches on merge?
> 
> I guess on that note, do you know if there is a way to run
> `scripts/kernel-doc` on patches instead of whole files? That would make
> much easier to block new kernel-doc issues from appearing.

Not off hand.

When I run builds on patches I author, I run them twice concurrently.
Once on the commit I'm basing on and once on the HEAD of my patchset.  I
then diff the two.  So as long as the number of errors and warnings stay
the same or reduce, we're golden.

Perhaps the same method could be used with `kernel-doc`?

-- 
Lee Jones [李琼斯]

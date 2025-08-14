Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E578B26C4D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FFA10E8B0;
	Thu, 14 Aug 2025 16:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pio9G6wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9EB10E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:17:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CC345A56E9F;
 Thu, 14 Aug 2025 16:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537E7C4CEED;
 Thu, 14 Aug 2025 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755188239;
 bh=t1D6JoRLNosJcvcAajcvRlnrHWGxzsuS/lzNJzOW0hI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pio9G6wbquRvNu83KBNo2X4ztLrxi/r01Yra2kDpuajo7CBkUHYYdvK4faGGh0HAb
 rjx5Jgv7eKKlNVHsDBdwh6KVPR/H86dc/0jE4Ulqbyw2S9fQgN/GnAbwPsbeyMyOwh
 Chfx2v5gw69odeDgxyQhKNpeonaJFTYVzkOrmTP0ZtQraFQBTrcxusI+woyhb3Mu2X
 KOQEiRaxdyE0Vkl5ywCpafmAZVj8+ZlCmDK2W9tI8bja1kwi6xsM2NdYTCv+aZ8bva
 3+GYCvPHocaHi8HN9R6QSONg6DmD7PBKMBCGQ+nBxRsAEyuM6T6HEnlxupBmmEUjU1
 sRjtoDvFgxQow==
Date: Thu, 14 Aug 2025 11:17:18 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <20250814161718.GA3117411-robh@kernel.org>
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
 <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
 <CAPj87rNDPQqTqj1LAdFYmd4Y12UHXWi5+65i0RepkcOX3wvEyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rNDPQqTqj1LAdFYmd4Y12UHXWi5+65i0RepkcOX3wvEyA@mail.gmail.com>
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

On Thu, Aug 14, 2025 at 11:51:44AM +0100, Daniel Stone wrote:
> Hi Rob,

Thanks for the review.

> 
> On Tue, 12 Aug 2025 at 13:53, Daniel Stone <daniel@fooishbar.org> wrote:
> > On Mon, 11 Aug 2025 at 22:05, Rob Herring (Arm) <robh@kernel.org> wrote:
> > > +static int ethos_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
> > > +                                  struct drm_ethos_job *job)
> > > +{
> > > +       [...]
> > > +       ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
> > > +       cmd_info = to_ethos_bo(ejob->cmd_bo)->info;
> > > +       if (!ejob->cmd_bo)
> > > +               goto out_cleanup_job;
> >
> > NULL deref here if this points to a non-command BO. Which is better
> > than wild DMA, but hey.
> 
> Sorry this wasn't more clear. There are two NULL derefs here. If you
> pass an invalid BO, ejob->cmd_bo is dereferenced before the NULL
> check, effectively neutering it and winning you a mail from the other
> Dan when he runs sparse on it. Secondly you pass a BO which is valid
> but not a command BO, cmd_info gets unconditionally dereferenced so it
> will fall apart there too.

Yep. And there's a 3rd issue that I'm not setting 'ret' to an error 
value.

> 
> > > +       for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
> > > +               struct drm_gem_object *gem;
> > > +
> > > +               if (job->region_bo_handles[i] == 0)
> > > +                       continue;
> > > +
> > > +               /* Don't allow a region to point to the cmd BO */
> > > +               if (job->region_bo_handles[i] == job->cmd_bo) {
> > > +                       ret = -EINVAL;
> > > +                       goto out_cleanup_job;
> > > +               }
> >
> > And here I suppose you want to check if the BO's info pointer is
> > non-NULL, i.e. disallow use of _any_ command BO instead of only
> > disallowing this job's own command BO.
> 
> This is the main security issue, since it would allow writes a
> cmdstream BO which has been created but is not _the_ cmdstream BO for
> this job. Fixing that is pretty straightforward, but given that
> someone will almost certainly try to add dmabuf support to this
> driver, it's also probably worth a comment in the driver flags telling
> anyone who tries to add DRIVER_PRIME that they need to disallow export
> of cmdbuf BOs.

What would be the usecase for exporting BOs here?

I suppose if one wants to feed in camera data and we need to do the 
allocation in the ethos driver since it likely has more constraints 
(i.e. must be contiguous). (Whatever happened on the universal allocator 
or constraint solver? I haven't been paying attention for a while...)

> Relatedly, I think there's missing validity checks around the regions.
> AFAICT it would be possible to do wild memory access:
> * create a cmdstream BO which accesses one region
> * submit a job using that cmdstream with one data BO correctly
> attached to the region, execute the job and wait for completion
> * free the data BO
> * resubmit that job but declare zero BO handles
> 
> The first issue is that the job will be accepted by the processing
> ioctl, because it doesn't check that all the regions specified by the
> cmdstream are properly filled in by the job, which is definitely one
> to fix for validation. The second issue is that region registers are
> not cleared in any way, so in the above example, the second job will
> reuse the region configuration from the first. I'm not sure if
> clearing out unused job fields would be helpful defence in depth or
> not; your call.

I had considered clearing unused the region registers. That really has 
little effect. There's not any way to disable regions. And region 
offsets are a full 64-bits, so even if one set base address to 0 or some 
faulting region, a cmdstream can still get to any address.

The other issue is just whether there's leftover cmdstream state from 
prior jobs. That's why the cmd_info is initialized to all 1s so that the 
cmdstream has to setup all the state.

> > (There's also a NULL deref if an invalid GEM handle is specified.)
> 
> This one is similar to the first; drm_gem_object_lookup() return isn't
> checked so it gets dereferenced unconditionally.

Here's the reworked (but not yet tested) code which I think should solve 
all of the above issues. There was also an issue with the cleanup path 
that we wouldn't do a put on the last BO if there was a size error. We 
just need to set ejob->region_bo[ejob->region_cnt] and increment 
region_cnt before any checks.

	ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
	if (!ejob->cmd_bo) {
		ret = -ENOENT;
		goto out_cleanup_job;
	}
	cmd_info = to_ethos_bo(ejob->cmd_bo)->info;
	if (!cmd_info) {
		ret = -EINVAL;
		goto out_cleanup_job;
	}

	for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
		struct drm_gem_object *gem;

		/* Can only omit a BO handle if the region is not used or used for SRAM */
		if (!job->region_bo_handles[i] &&
		    (!cmd_info->region_size[i] || (i == ETHOS_SRAM_REGION && job->sram_size)))
			continue;

		gem = drm_gem_object_lookup(file, job->region_bo_handles[i]);
		if (!gem) {
			dev_err(dev->dev,
				"Invalid BO handle %d for region %d\n",
				job->region_bo_handles[i], i);
			ret = -ENOENT;
			goto out_cleanup_job;
		}

		ejob->region_bo[ejob->region_cnt] = gem;
		ejob->region_bo_num[ejob->region_cnt] = i;
		ejob->region_cnt++;

		if (to_ethos_bo(gem)->info) {
			dev_err(dev->dev,
				"Cmdstream BO handle %d used for region %d\n",
				job->region_bo_handles[i], i);
			ret = -EINVAL;
			goto out_cleanup_job;
		}

		/* Verify the command stream doesn't have accesses outside the BO */
		if (cmd_info->region_size[i] > gem->size) {
			dev_err(dev->dev,
				"cmd stream region %d size greater than BO size (%llu > %zu)\n",
				i, cmd_info->region_size[i], gem->size);
			ret = -EOVERFLOW;
			goto out_cleanup_job;
		}
	}

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C93B38CA5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 00:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA4510E8F8;
	Wed, 27 Aug 2025 22:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bRX+tNGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99EF10E8EF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 22:08:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AAB516027F;
 Wed, 27 Aug 2025 22:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECAEC4CEEB;
 Wed, 27 Aug 2025 22:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756332483;
 bh=zzgfsYDCFmRhdoMZwZ++3Els9HxkLOsb+5Uew5Yhl6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRX+tNGWVTUIuuRWXCG5ONBpUuQUHP/wyei8Yn+SJQPZSdxqbskV+o+bN48kMj2LB
 4LR1hBAGzxuKLAJWZNXy2LqiiK4grBJTMBnIjHo0RwE4YUqcPtybj6NCyu5EeXcjNd
 n0UcO9BkDLs6IzjiMW2jrqIMMVulxJo5Do3KhN4j9Hvj+V51zj+8jFAFccSUx9DHvR
 /2IKuBbcutfJoszc+0hXc++CluMVTe/YUadwI9Jqk2eOGsxfQeX5CdH02aoJyE9ygy
 k3Zy+tyzneCTzQN6/F9NY9/LcqCQjrY9f2UV7/xR2BsYufOXpBoDEbFPfmTFIJ7lsY
 9CC5fg9wyhsdg==
Date: Wed, 27 Aug 2025 15:08:01 -0700
From: Drew Fustini <fustini@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aK-BwY8c-OR_WqNk@thelio>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222023eucas1p1805feda41e485de76c2981beb8b9102d@eucas1p1.samsung.com>
 <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
 <aKjWiU4fQw3k77GR@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKjWiU4fQw3k77GR@x1>
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

On Fri, Aug 22, 2025 at 01:43:53PM -0700, Drew Fustini wrote:
> On Fri, Aug 22, 2025 at 12:20:17AM +0200, Michal Wilczynski wrote:
> > Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> > TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> > the GPU using the drm/imagination driver.
> > 
> > By adding this node, the kernel can recognize and initialize the GPU,
> > providing graphics acceleration capabilities on the Lichee Pi 4A and
> > other boards based on the TH1520 SoC.
> > 
> > Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> > controlled programatically.
> > 
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Drew Fustini <drew@pdp7.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Acked-by: Matt Coster <matt.coster@imgtec.com>
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> 
> I've applied this to thead-dt-for-next [1]:
> 
> 0f78e44fb857 ("riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node")
> 
> Thanks,
> Drew
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next

Hi Matt,

Do you know when the dt binding patch will be applied to
the drm-misc/for-linux-next tree?

I applied the dts patch but it is creating a warning in next right now.
If the binding won't show up soon in drm-misc, then I'll remove this dts
patch from next as dtbs_check is now failing in next. I can add it back
once the binding makes it to next.

Thanks,
Drew

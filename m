Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB858C0F2BB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C9010E4F3;
	Mon, 27 Oct 2025 16:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bg1mmsGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B87010E4E5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:08:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C966D44964;
 Mon, 27 Oct 2025 16:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73763C4CEF1;
 Mon, 27 Oct 2025 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761581319;
 bh=0qurQEcCeZYwnzmNk0lbdUhOqCeujh+OZZ7pr7d4vWA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=bg1mmsGyeYPsovM1F0Tq4nEw20gfWYynK3MHZ7jxJuJY17d7vtN6CIx7db4Q3pvu5
 puDkrsmy7UcPEk9/YB9PY1gbwXT9eHUKLt4fqTnuARzUokgMvBXp2IvGAA4vzj5Sjn
 ggpK0qqihbpjmlAHkS/EKn6i9xM7FjMcUh8ZH9w6ID6+7zhXwRu/w4riSqFJIp5FRJ
 4c7MNB+jl1JZX2epbGuIhYgMCi/XcJC60t7eXSh355R7OW0zbj/JHyr8tZ8eEKvTfn
 XI+W5Dl/UOIJ8BCWaWyuRpmuNy65UCSNiIDMfZNNOkm3rPwdCSkAxCcrGp9djd/z++
 66WZ+4huDCMXw==
Message-ID: <7c5a1a6e-cad2-46c3-b5cd-3e92ca6d99a7@kernel.org>
Date: Mon, 27 Oct 2025 17:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and
 Tegra30
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling
 <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20251022142051.70400-1-clamor95@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Svyatoslav,

On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.

Other than patch 06/23 that looked iffy (although the original code was iffy as
already), for which I posted a review, this series looks almost ready.

Should the clk patches be merged together with the media patches? Or can those
go in via the clk subsystem? If it is the latter, then I'll need an Acked-by from the
clk subsystem maintainer.

Regarding the bindings: all except 21/23 are Acked.

I have one question regarding testing: in the past I tested this driver with a
Jetson TX1 devkit and a camera sensor. One of the main reasons this driver is still
in staging is that I never got that to work reliably: after 10-30 minutes it would
lose sync and streaming would stop.

Unfortunately I never had the time to dig deeper into that.

So have you tested this with a camera sensor? And if so, does it stream reliably?
I.e. just let it stream for 24 hours and see if that works.

If it is reliable for you, then I think this driver should be moved to drivers/media.

Regards,

	Hans

> 
> ---
> Changes in v2:
> - vi_sensor gated through csus
> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> - adjusted commit titles and messages
> - clk_register_clkdev dropped from pad clock registration
> - removed tegra30-vi/vip and used tegra20 fallback
> - added separate csi schema for tegra20-csi and tegra30-csi
> - fixet number of VI channels
> - adjusted tegra_vi_out naming
> - fixed yuv_input_format to main_input_format
> - MIPI calibration refsctored for Tegra114+ and added support for
>   pre-Tegra114 to use CSI as a MIPI calibration device
> - switched ENOMEM to EBUSY
> - added check into tegra_channel_get_remote_csi_subdev
> - moved avdd-dsi-csi-supply into CSI
> - next_fs_sp_idx > next_fs_sp_value
> - removed host1x_syncpt_incr from framecounted syncpoint
> - csi subdev request moved before frame cycle
> 
> Changes in v3:
> - tegra20 and tegra30 csi schema merged
> - removed unneeded properties and requirements from schema
> - improved vendor specific properties description
> - added tegra20 csus parent mux
> - improved commit descriptions
> - redesigned MIPI-calibration to expose less SoC related data into header
> - commit "staging: media: tegra-video: csi: add support for SoCs with integrated
>   MIPI calibration" dropped as unneeded
> - improved tegra_channel_get_remote_device_subdev logic
> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> - software syncpoint counters switched to direct reading
> - adjusted planar formats offset calculation
> 
> Changes in v4:
> - removed ifdefs from tegra_mipi_driver
> - document Tegra132 MIPI calibration device
> - switched to use BIT macro in tegra114-mipi
> - pinctrl changes moved to a separate patch
> - ERESTARTSYS workaround preserved for now
> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> - reworked bytesperline and sizeimage calculaion
> 
> Changes in v5:
> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> - added reasoning for tegra132 comaptible into commit desctiption
> - moved clocks into common section in tegra20-csi schema
> - added note regarding ERESTARTSYS
> ---
> 
> Svyatoslav Ryhel (23):
>   clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
>     Tegra114
>   dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
>   clk: tegra30: add CSI pad clock gates
>   dt-bindings: display: tegra: document Tegra30 VI and VIP
>   staging: media: tegra-video: expand VI and VIP support to Tegra30
>   staging: media: tegra-video: vi: adjust get_selection op check
>   staging: media: tegra-video: vi: add flip controls only if no source
>     controls are provided
>   staging: media: tegra-video: csi: move CSI helpers to header
>   gpu: host1x: convert MIPI to use operation function pointers
>   dt-bindings: display: tegra: document Tegra132 MIPI calibration device
>   staging: media: tegra-video: vi: improve logic of source requesting
>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
>     CSI
>   arm64: tegra: move avdd-dsi-csi-supply into CSI node
>   staging: media: tegra-video: tegra20: set correct maximum width and
>     height
>   staging: media: tegra-video: tegra20: add support for second output of
>     VI
>   staging: media: tegra-video: tegra20: adjust format align calculations
>   staging: media: tegra-video: tegra20: set VI HW revision
>   staging: media: tegra-video: tegra20: increase maximum VI clock
>     frequency
>   staging: media: tegra-video: tegra20: expand format support with
>     RAW8/10 and YUV422/YUV420p 1X16
>   staging: media: tegra-video: tegra20: adjust luma buffer stride
>   dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
>   ARM: tegra: add CSI nodes for Tegra20 and Tegra30
>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
> 
>  .../display/tegra/nvidia,tegra114-mipi.yaml   |   1 +
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 +++
>  .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
>  .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
>  arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
>  arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
>  drivers/clk/tegra/clk-tegra114.c              |   7 +-
>  drivers/clk/tegra/clk-tegra20.c               |  20 +-
>  drivers/clk/tegra/clk-tegra30.c               |  21 +-
>  drivers/gpu/drm/tegra/dsi.c                   |   1 +
>  drivers/gpu/host1x/Makefile                   |   1 +
>  drivers/gpu/host1x/mipi.c                     | 525 ++---------
>  drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
>  drivers/staging/media/tegra-video/Makefile    |   1 +
>  drivers/staging/media/tegra-video/csi.c       |  70 +-
>  drivers/staging/media/tegra-video/csi.h       |  16 +
>  drivers/staging/media/tegra-video/tegra20.c   | 820 +++++++++++++++---
>  drivers/staging/media/tegra-video/vi.c        |  56 +-
>  drivers/staging/media/tegra-video/vi.h        |   6 +-
>  drivers/staging/media/tegra-video/video.c     |   8 +-
>  drivers/staging/media/tegra-video/vip.c       |   4 +-
>  include/dt-bindings/clock/tegra30-car.h       |   3 +-
>  include/linux/host1x.h                        |  10 -
>  include/linux/tegra-mipi-cal.h                |  57 ++
>  26 files changed, 1657 insertions(+), 670 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
> 


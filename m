Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B23D1A16D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D68610E35D;
	Tue, 13 Jan 2026 16:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AXenmkWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D4710E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768320489;
 bh=XrcoqIdL7mqLMAZSLEUBjwk3677mywTfFnps1LIr2qA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AXenmkWO0eq5YWShnSaSv3RU3e/vIfy2AYsdeNYFaYb63vC1Wfxa4deyTH9bKjZdA
 zkIfbiY4MFlNVaAbEHedzyfCo5epss/7f9Fe41KSANOp3W7SJ6jqA3jj5IhjA5cHfp
 jXMlLjN45Ix9TjPtsQyew8bp+hTWRzToGrBW5tPz9k3W8mUlOtHczuEQWkOnA7tK8E
 iY9NUTgtz4t5KziPuiYtjkxoj+jZ53hT/w1WayTNHan+buwycMpWWBUpp5tYW2wFgK
 8AtxVdb+UXSRg183npbS02u28cojtXfs1ns0AwIVQsmKKaVZDsyNpBbd/6qiSZ6l89
 DWmoRged+oF+w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9819B17E026C;
 Tue, 13 Jan 2026 17:08:08 +0100 (CET)
Date: Tue, 13 Jan 2026 17:08:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Make MT8196 get its Mali GPU shader_present from
 nvmem
Message-ID: <20260113170803.6e5ebedb@fedora>
In-Reply-To: <CAPDyKFqkPg5rWYk7cwDywRn_pexQhd2V3R63atjruJnSpYxfZQ@mail.gmail.com>
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
 <CAPDyKFqkPg5rWYk7cwDywRn_pexQhd2V3R63atjruJnSpYxfZQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 29 Dec 2025 12:52:13 +0100
Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On Sat, 20 Dec 2025 at 19:50, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > The MediaTek MT8196 SoC's Mali SHADER_PRESENT register does not list
> > only functional shader cores, but also those that are fused off to
> > improve yield.
> >
> > The SHADER_PRESENT bitmask with the one fused off core omitted is to be
> > found in an efuse. However, the efuse address is considered
> > confidential, and is not public knowledge.
> >
> > The MT8196 GPUEB MCU, which does the power management for the Mali GPU
> > on this SoC, knows and reads the efuse however, and exposes it in the
> > shared memory intended to communicate state to the application
> > processor. Reading the bitmask from this shared memory area is the
> > vendor's intended solution.
> >
> > This series models this in the binding and implements it in the
> > corresponding Linux drivers:
> > - the mali-valhall-csf binding gets an nvmem-cells/nvmem-cell-names
> >   property to declare that shader-present is in a different castle
> > - the mt8196-gpufreq binding requires nodes to expose the shader-present
> >   cell
> > - panthor checks for the presence of the shader-present cell and uses it
> >   as the shader-present value if it's found, instead of the Mali GPU
> >   register contents
> > - mtk-mfg-pmdomain becomes an nvmem provider and will happily serve
> >   queries for the shader-present cell
> >
> > While it would be preferable if we could read the efuse directly, it's
> > not possible as things stand, and insisting on it will just keep this
> > hardware from working in mainline. Running a GPU workload with a
> > SHADER_PRESENT bitmask that includes a faulty core results in corrupt
> > GPU rendering output.
> >
> > Modelling the mt8196-gpufreq device as a nvmem-cell provider however is
> > not lying about the hardware's capabilities, as it truly does provide
> > access to the nvmem-cell, even if it acts as a proxy.
> >
> > From a bindings and panthor perspective, this is also generic enough to
> > where hypothetical other vendors doing the same thing (even with direct
> > efuse access) can rely on the same cell name and implementation.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>  
> 
> I have applied the pmdomain changes in patch2 and patch 4 for next, thanks!
> 
> I assume the gpu changes will be funneled via another tree, but let me
> know if there is a reason to keep these changes together.

Yep, I just queued the remaining two patches to drm-misc-next.

Thanks,

Boris

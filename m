Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF087E7DB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 11:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FA510F57F;
	Mon, 18 Mar 2024 10:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIQ/A7ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CBE10F57F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710759579; x=1742295579;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jH4juVmYO3OW2+xith3TnuAfUTev9LatWmEpCveIGgY=;
 b=eIQ/A7qlu9ot27Jzjs3yvwC4othLVD7XJlC46JJC9Vjt8pihgYlIJXuh
 CAYkhtfCx3Cqv7Wm4WbFr+6cNDKZgEna+OXajc+NprbATjImDYJ67xDIw
 hMcZDFdVfiM+Q8hBRB5JZp0WpSuLNTSgZvMKY7BE+qoGAPlTF7urZtC++
 VFtdKIQdtzTodLWQUGwZoPMkuNPdNodMK8C83Bi4x69CNwStoCTawWE3E
 4blfJTpoD60DPsNoKi7bSDkDnFSzVzXf9PeWTOT8cU+7QVEMnRuY6gvnY
 r4+5b+BZlWvPItl0oEhehyNgD+h5udXnifllrsAV503BZLMyYtIS1Pzhs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16201560"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16201560"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 03:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18120768"
Received: from ahmedess-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 03:59:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Luca Weiss
 <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
In-Reply-To: <87wmpzq0bp.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
 <87wmpzq0bp.fsf@intel.com>
Date: Mon, 18 Mar 2024 12:59:29 +0200
Message-ID: <87ttl3pzzi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 18 Mar 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 18 Mar 2024, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> Hi,
>>
>> On Thu, 11 Jan 2024 13:38:04 +0100, Luca Weiss wrote:
>>> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
>>> bridge/panel.o to drm_kms_helper object, we need to select
>>> DRM_KMS_HELPER to make sure the file is actually getting built.
>>> 
>>> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
>>> be properly available:
>>> 
>>> [...]
>>
>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
>>
>> [1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3f18b0dd1db242791afbc3bd173026163ce0ccc
>
> With my kernel config, e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER
> for DRM_PANEL_BRIDGE") leads to:
>
> WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
>   Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
>   Selected by [y]:
>   - DRM_PANEL_BRIDGE [=y] && HAS_IOMEM [=y] && DRM_BRIDGE [=y]
>   Selected by [m]:
>   - DRM [=m] && HAS_IOMEM [=y] && (AGP [=y] || AGP [=y]=n) && !EMULATED_CMPXCHG && HAS_DMA [=y] && DRM_FBDEV_EMULATION [=y]
>   - DRM_MIPI_DBI [=m] && HAS_IOMEM [=y] && DRM [=m]
>   - DRM_KUNIT_TEST [=m] && HAS_IOMEM [=y] && DRM [=m] && KUNIT [=y] && MMU [=y]
>   - DRM_RADEON [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (AGP [=y] || !AGP [=y])
>   - DRM_AMDGPU [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && !UML
>   - DRM_NOUVEAU [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
>   - DRM_I915 [=m] && HAS_IOMEM [=y] && DRM [=m] && X86 [=y] && PCI [=y] && !PREEMPT_RT [=n]
>   - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (m && MODULES [=y] || y && KUNIT [=y]=y) && 64BIT [=y]
>   - DRM_VKMS [=m] && HAS_IOMEM [=y] && DRM [=m] && MMU [=y]
>   - DRM_VMWGFX [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (X86 [=y] || ARM64)
>   - DRM_GMA500 [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && X86 [=y] && MMU [=y]
>   - DRM_UDL [=m] && HAS_IOMEM [=y] && DRM [=m] && USB [=m] && USB_ARCH_HAS_HCD [=y] && MMU [=y]
>   - DRM_AST [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
>   - DRM_MGAG200 [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
>   - DRM_QXL [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
>   - DRM_VIRTIO_GPU [=m] && HAS_IOMEM [=y] && DRM [=m] && VIRTIO_MENU [=y] && MMU [=y]
>   - DRM_BOCHS [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
>   - DRM_CIRRUS_QEMU [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
>   - DRM_GM12U320 [=m] && HAS_IOMEM [=y] && DRM [=m] && USB [=m] && MMU [=y]
>   - DRM_PANEL_MIPI_DBI [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - DRM_SIMPLEDRM [=m] && HAS_IOMEM [=y] && DRM [=m] && MMU [=y]
>   - TINYDRM_HX8357D [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_ILI9163 [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_ILI9225 [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_ILI9341 [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_ILI9486 [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_MI0283QT [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_REPAPER [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_ST7586 [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - TINYDRM_ST7735R [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]
>   - DRM_XEN_FRONTEND [=m] && HAS_IOMEM [=y] && XEN [=y] && DRM [=m]
>   - DRM_VBOXVIDEO [=m] && HAS_IOMEM [=y] && DRM [=m] && X86 [=y] && PCI [=y]
>   - DRM_GUD [=m] && HAS_IOMEM [=y] && DRM [=m] && USB [=m] && MMU [=y]
>   - DRM_SSD130X [=m] && HAS_IOMEM [=y] && DRM [=m] && MMU [=y]
>   - DRM_ANALOGIX_ANX78XX [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y]

Please read Documentation/kbuild/kconfig-language.rst.

Basically boolean DRM_PANEL_BRIDGE selecting tristate DRM_KMS_HELPER
forces it to y while it should remain m.

Please revert.

BR,
Jani.


-- 
Jani Nikula, Intel

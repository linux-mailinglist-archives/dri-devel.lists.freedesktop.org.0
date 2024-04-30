Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EEF8B8200
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 23:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EC310E691;
	Tue, 30 Apr 2024 21:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="dsoh69Pe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8184310E662;
 Tue, 30 Apr 2024 21:40:22 +0000 (UTC)
Received: from [100.65.32.120] (unknown [20.236.11.185])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2953021112E1;
 Tue, 30 Apr 2024 14:40:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2953021112E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714513221;
 bh=N5FvQ/TypNHdjNMqYFIqXh66AahkR8SgB9HzMwk5dOg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dsoh69PeBK5TTLU3vn54yAjgk6HEgw6uX5/96K1j6MEq+uhUAt3mt7u2D+71GOFNI
 WvGANH7w+I/8RenBbMN5ykkWz3Uk5CrLxIasJ2xUAitAkekfx5YEX9aKxDjas/zyYs
 t0b5kEvCuz8TxGtWmnMzMga/jwInlSVIoFyEUWbA=
Message-ID: <92189a8c-00dc-4b79-8fd0-3670b80d0db2@linux.microsoft.com>
Date: Tue, 30 Apr 2024 14:40:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/12] drm/i915: Make I2C terminology more inclusive
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-4-eahariha@linux.microsoft.com>
 <ZjFUwjMFMcvJr5KI@intel.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <ZjFUwjMFMcvJr5KI@intel.com>
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

On 4/30/2024 1:29 PM, Rodrigo Vivi wrote:
> On Tue, Apr 30, 2024 at 05:38:02PM +0000, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
>>
>> Compile tested, no functionality changes intended
>>
>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> I'm glad to see this change!
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>> ---
>>  drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
>>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
>>  drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
>>  drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
>>  .../gpu/drm/i915/display/intel_display_core.h |  2 +-
>>  drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
>>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 20 ++++++-------
>>  drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
>>  drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
>>  drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
>>  drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
>>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
>>  drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
>>  drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
>>  drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
>>  19 files changed, 119 insertions(+), 119 deletions(-)
> 
> The chances of conflicts are high with this many changes,
> but should be easy enough to deal with later, so feel free
> to move with this i915 patch on any other tree and we catch-up
> later.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 

Thanks for the review and ack! I actually thought that this might end up going in as individual
patches via the various respective trees since it's now completely independent of Wolfram's enabling
series with the drop of the final patch that was treewide.

What do you think?

Thanks,
Easwar


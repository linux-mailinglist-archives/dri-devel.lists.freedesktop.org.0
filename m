Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D188BCA59
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 11:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9580010EC28;
	Mon,  6 May 2024 09:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jz9VJjCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8F610E9DA;
 Mon,  6 May 2024 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714987056; x=1746523056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cl18l/TXvz4Zvo1045jScsKEtjhBFIXuANQZjuBD3wQ=;
 b=Jz9VJjCq4pW1BSyFf7c1HH49Aah5cltvu3ypy+RX2KG6o+LuXLreovkn
 WXHQFqjPeGHoOOytQPfWK2ckWi7BL5feCDzHnazFrprCQVXz7rr3kO761
 c9EdpIvwiYmEJ4VRZpSnK9ou2RuekMQ9aQ4YbfrcFPcCGeJOF193aCh7U
 s6rpnuSCWyt5XxRxJ0ESEH9Wgngj3xoDkQkDX3UKSy7BdGk5BhP+BYXVL
 EFoAN7tfOEqxwTjUgU+iIHB3zolrGT/pd8aa+Ro8QWyYHhI1oICYjqInm
 wm9s+m3WdmIXNkJOr9kQeEq12+mbgFPXOFi47fx2VPSi0M4jwYgVsn2xy g==;
X-CSE-ConnectionGUID: KCH4/JQVSWOsqFXYdp7anw==
X-CSE-MsgGUID: RANmDG2tRPyHnprb18Dxtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="11257825"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="11257825"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:17:35 -0700
X-CSE-ConnectionGUID: 4+Jvg8cMTyaYXdytTnxAvQ==
X-CSE-MsgGUID: JlvUVT2gRSG1ghf7Ms253g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28504342"
Received: from unknown (HELO intel.com) ([10.247.119.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:17:18 -0700
Date: Mon, 6 May 2024 11:17:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
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
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v2 03/12] drm/i915: Make I2C terminology more inclusive
Message-ID: <ZjigFRyMhgcS6Zju@ashyti-mobl2.lan>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-4-eahariha@linux.microsoft.com>
 <ZjU8NB-71xWI2X73@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjU8NB-71xWI2X73@intel.com>
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

Hi,

On Fri, May 03, 2024 at 03:34:12PM -0400, Rodrigo Vivi wrote:
> On Fri, May 03, 2024 at 06:13:24PM +0000, Easwar Hariharan wrote:
> > I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> > with more appropriate terms. Inspired by and following on to Wolfram's
> > series to fix drivers/i2c/[1], fix the terminology for users of
> > I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> > in the specification.
> > 
> > Compile tested, no functionality changes intended
> > 
> > [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> It looks like the ack is not needed since we are merging this through
> drm-intel-next. But I'm planing to merge this only after seeing the
> main drivers/i2c accepting the new terminology. So we don't have a
> risk of that getting push back and new names there and we having
> to rename it once again.

I basically agree with this patch (without the eDP part).

But the documentation is still not update and I think we need to
hold until Wolfram has done that.

In any case, it's good to anticipate the reviews.

Thanks Easwar,
Andi

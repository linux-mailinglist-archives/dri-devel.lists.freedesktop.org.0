Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A1D4FC1F4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565D10E317;
	Mon, 11 Apr 2022 16:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477E810E317;
 Mon, 11 Apr 2022 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649693471; x=1681229471;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W1z6zKLM2c2LCFtJFuhaiwB43NVpO3XwYlP7KVT17K0=;
 b=UteNAfiXR+hTqj8bkfQpmN58g7hNZ0iQ2AmOGNFC8V7GmG0rHvvp+Tcq
 ndkb2PiY+bY/dCRmFCxCpRgIoGfaj8U4VcaV7Q+HFSL0NtaX83Vt+mOe4
 D00RbgVopHQVDxR9aPWvScklm35txS06HU8FGdElBuveIP0j7R7L0njdM
 4xU5IPB1ZF2mhKGAHxA64U5ljlZIpDwXnb6CQtv13OpYcmVw5BC3gyZJB
 GHG41MAFUNH84lsqX+HJzJgYrwA2hLhr2hsldlutfH5ysa5daYoNxswHN
 WV6CiWN2vdc5mZncJkJt9/QZKi0PIaRXoH8wuq2LJtuxy/mmUgqVHiq8o Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249435311"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="249435311"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:11:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551212099"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:11:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
In-Reply-To: <20220411152508.GH2120790@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-6-hch@lst.de> <20220411152508.GH2120790@nvidia.com>
Date: Mon, 11 Apr 2022 19:11:03 +0300
Message-ID: <87zgkrha7c.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Mon, Apr 11, 2022 at 04:13:34PM +0200, Christoph Hellwig wrote:
>> Match the style of the main i915 Makefile in the gvt-specfic one and
>> remove the GVT_DIR and GVT_SOURCE variables.
>> 
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>  drivers/gpu/drm/i915/gvt/Makefile | 29 +++++++++++++++++++++++------
>>  1 file changed, 23 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
>> index 4d70f4689479c..f2f6ea02714ec 100644
>> +++ b/drivers/gpu/drm/i915/gvt/Makefile
>> @@ -1,8 +1,25 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> -GVT_DIR := gvt
>> -GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
>> -	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
>> -	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
>> -	fb_decoder.o dmabuf.o page_track.o
>>  
>> -i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
>> +i915-y += \
>> +	gvt/gvt.o \
>> +	gvt/aperture_gm.o \
>> +	gvt/handlers.o \
>> +	gvt/vgpu.o \
>> +	gvt/trace_points.o \
>> +	gvt/firmware.o \
>> +	gvt/interrupt.o \
>> +	gvt/gtt.o \
>> +	gvt/cfg_space.o \
>> +	gvt/opregion.o \
>> +	gvt/mmio.o \
>> +	gvt/display.o \
>> +	gvt/edid.o \
>> +	gvt/execlist.o \
>> +	gvt/scheduler.o \
>> +	gvt/sched_policy.o \
>> +	gvt/mmio_context.o \
>> +	gvt/cmd_parser.o \
>> +	gvt/debugfs.o \
>> +	gvt/fb_decoder.o \
>> +	gvt/dmabuf.o \
>> +	gvt/page_track.o
>
> Up to you but I usually sort these lists

Yeah, please do. Otherwise matches what I sent, so ack.

BR,
Jani.

>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Jason

-- 
Jani Nikula, Intel Open Source Graphics Center

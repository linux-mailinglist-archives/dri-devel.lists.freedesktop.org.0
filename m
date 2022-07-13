Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578C572FA3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 09:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8897B92D11;
	Wed, 13 Jul 2022 07:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BDB8EB26
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657698692; x=1689234692;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=F2+hI7sSOiCTm0w874bm98kqvTV3acUx54q+q6yregc=;
 b=ErQc94yd3vIUHfjrJuLivwp18Vor6dXtRXUp05Ij4Ixxi/ihRZYbzEB6
 2VeNLAMreyRz4ReXdGfo1SrR7DNUwynkiK1e244ibTegzFeoAWX6MT3Bd
 KhuAJSA8SjqZmxX6nifjrI1VbffrzmbstFf1Los+5/LG8bFTBStRwvvXI
 Cgh028t9S5hypVazzUyfNV3mzh7iW3M26rQaa4RWAQ/055dF1pr1bIVO3
 m28MC7yPcuGvTmzqc22p+OaTBIazSbM20fguS4fdViyYqSt5ZQvLV5k9h
 StXCGsesnqCYPd/bn0y6kwcHV/KfdpeQhzfFVm3VRwhDTtexZRFogehwj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="282693987"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="282693987"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 00:51:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="595601719"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO linux.intel.com)
 ([10.251.209.173])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 00:51:24 -0700
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oBX9V-0016l4-Qz
 for dri-devel@lists.freedesktop.org; Wed, 13 Jul 2022 09:51:21 +0200
Message-ID: <0d1078a2-084e-1170-fc50-580192ca54b2@linux.intel.com>
Date: Wed, 13 Jul 2022 09:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/32] drm/i915: gvt: fix kernel-doc trivial warnings
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <cover.1657565224.git.mchehab@kernel.org>
 <15fc6317ef5eb4ad7123d627c58c4aa04a4eae87.1657565224.git.mchehab@kernel.org>
 <20220712050051.GW1089@zhen-hp.sh.intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20220712050051.GW1089@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/12/22 07:00, Zhenyu Wang wrote:
> On 2022.07.11 21:24:49 +0100, Mauro Carvalho Chehab wrote:
>> Some functions seem to have been renamed without updating the kernel-doc
>> markup causing warnings. Also, struct intel_vgpu_dmabuf_obj is not
>> properly documented, but has a kerneld-doc markup.
>>
>> Fix those warnings:
>> 	drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype for inte_gvt_free_vgpu_resource(). Prototype was for intel_vgpu_free_resource() instead
>> 	drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype for intel_alloc_vgpu_resource(). Prototype was for intel_vgpu_alloc_resource() instead
>> 	drivers/gpu/drm/i915/gvt/cfg_space.c:257: warning: expecting prototype for intel_vgpu_emulate_cfg_read(). Prototype was for intel_vgpu_emulate_cfg_write() instead
>> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'vgpu' not described in 'intel_vgpu_dmabuf_obj'
>> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'info' not described in 'intel_vgpu_dmabuf_obj'
>> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'dmabuf_id' not described in 'intel_vgpu_dmabuf_obj'
>> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'kref' not described in 'intel_vgpu_dmabuf_obj'
>> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'initref' not described in 'intel_vgpu_dmabuf_obj'
>> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'list' not described in 'intel_vgpu_dmabuf_obj'
>> 	drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype for intel_t_default_mmio_write(). Prototype was for intel_vgpu_default_mmio_write() instead
>> 	drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting prototype for intel_gvt_switch_render_mmio(). Prototype was for intel_gvt_switch_mmio() instead
>> 	drivers/gpu/drm/i915/gvt/page_track.c:131: warning: expecting prototype for intel_vgpu_enable_page_track(). Prototype was for intel_vgpu_disable_page_track() instead
>> 	drivers/gpu/drm/i915/gvt/vgpu.c:215: warning: expecting prototype for intel_gvt_active_vgpu(). Prototype was for intel_gvt_activate_vgpu() instead
>> 	drivers/gpu/drm/i915/gvt/vgpu.c:230: warning: expecting prototype for intel_gvt_deactive_vgpu(). Prototype was for intel_gvt_deactivate_vgpu() instead
>> 	drivers/gpu/drm/i915/gvt/vgpu.c:358: warning: expecting prototype for intel_gvt_destroy_vgpu(). Prototype was for intel_gvt_destroy_idle_vgpu() instead
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>> ---
> Hi, thanks for this, but there're already several fixes in queue right now, e.g
> https://patchwork.freedesktop.org/series/104302/ and
> https://patchwork.freedesktop.org/series/104640/, but looks there're other uncaught issues.
> I'd like to submit current in queue first, then maybe you could update for others?

Yeah, either that or I can simply apply those 3 patches before my series,
renaming the subject (as they all have the same one), and re-submit with
them inside.

Regards,
Mauro


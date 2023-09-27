Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC97B0A78
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 18:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F5910E572;
	Wed, 27 Sep 2023 16:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B1810E56F;
 Wed, 27 Sep 2023 16:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695832571; x=1727368571;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JeZas35W9eZEEJmMoAKdZZ61yghrBIWT0F6YNF70lMQ=;
 b=iaJAtUt5+GTH++g7jFo8tO9WvDlTUGwDTnb3Pb/QKlFqWhbARyZnt+hJ
 1cESeUTJY9L3ibFjgPS5GZr5AkgNifieM/hh4u5AFMnKpfPWDV6GmB4W4
 tqStbmG4WBUWnqleGJa3WaIS0za5AOu09mcYBLSp1cmCAZ7XIxYu0PBUh
 AX+3ZPequnTOxPunL70V8Y5AgRSu90oBUVLQQxOdxn/TGwJIVzfozxytx
 89LbkeX++kuPyZci6rahCr9STLHH968f7QEjnFLvZEJXTogZYKfZko7aZ
 fw5Kmt3vxKLFb4q84/4jnKXo3tpAvDh8T8NJObiwKcv7t1TeNk7rao436 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381772038"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="381772038"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 09:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="749270304"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="749270304"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.91.122])
 ([10.213.91.122])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 09:36:07 -0700
Message-ID: <ae1ea056-540b-c2ec-9989-3a9e01a5f9b7@intel.com>
Date: Wed, 27 Sep 2023 22:06:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 0/8] Add DSC fractional bpp support
Content-Language: en-US
To: imre.deak@intel.com, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Ankit K Nautiyal <ankit.k.nautiyal@intel.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>, jani.nikula@intel.com
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
 <ZQ2MeUOrx9bRtswt@ideak-desk.fi.intel.com>
 <ZRRIyKEsTRkbycq3@ideak-desk.fi.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <ZRRIyKEsTRkbycq3@ideak-desk.fi.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27-Sep-23 8:52 PM, Imre Deak wrote:
> On Fri, Sep 22, 2023 at 03:45:45PM +0300, Imre Deak wrote:
> Hi Mitul, Ankit, Swati, Vandita,
> 
>> On Wed, Sep 13, 2023 at 11:35:58AM +0530, Mitul Golani wrote:
>>> his patch series adds support for DSC fractional compressed bpp
>>> for MTL+. The series starts with some fixes, followed by patches that
>>> lay groundwork to iterate over valid compressed bpps to select the
>>> 'best' compressed bpp with optimal link configuration (taken from
>>> upstream series: https://patchwork.freedesktop.org/series/105200/).
>>>
>>> The later patches, add changes to accommodate compressed bpp with
>>> fractional part, including changes to QP calculations.
>>> To get the 'best' compressed bpp, we iterate over the valid compressed
>>> bpp values, but with fractional step size 1/16, 1/8, 1/4 or 1/2 as per
>>> sink support.
>>>
>>> The last 2 patches add support to depict DSC sink's fractional support,
>>> and debugfs to enforce use of fractional bpp, while choosing an
>>> appropriate compressed bpp.
>>
>> MST/DSC is at the moment broken, so I'd prefer merging this patchset
>> only after it's fixed. This would mean merging
>>
>> https://lore.kernel.org/all/20230921195159.2646027-1-imre.deak@intel.com
>>
>> first, followed by the DSC parts from
>>
>> https://lore.kernel.org/all/20230914192659.757475-1-imre.deak@intel.com
>>
>> which would also need a rebase for this patchset.
> 
> Are you ok with the above?

Yes, Imre..we are all okay.
You can proceed.

> 
> Thanks,
> Imre
> 
>>
>>> Ankit Nautiyal (5):
>>>    drm/display/dp: Add helper function to get DSC bpp prescision
>>>    drm/i915/display: Store compressed bpp in U6.4 format
>>>    drm/i915/display: Consider fractional vdsc bpp while computing m_n
>>>      values
>>>    drm/i915/audio : Consider fractional vdsc bpp while computing tu_data
>>>    drm/i915/dp: Iterate over output bpp with fractional step size
>>>
>>> Swati Sharma (2):
>>>    drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
>>>    drm/i915/dsc: Allow DSC only with fractional bpp when forced from
>>>      debugfs
>>>
>>> Vandita Kulkarni (1):
>>>    drm/i915/dsc/mtl: Add support for fractional bpp
>>>
>>>   drivers/gpu/drm/display/drm_dp_helper.c       | 27 ++++++
>>>   drivers/gpu/drm/i915/display/icl_dsi.c        | 11 +--
>>>   drivers/gpu/drm/i915/display/intel_audio.c    | 17 ++--
>>>   drivers/gpu/drm/i915/display/intel_bios.c     |  6 +-
>>>   drivers/gpu/drm/i915/display/intel_cdclk.c    |  6 +-
>>>   drivers/gpu/drm/i915/display/intel_display.c  |  8 +-
>>>   drivers/gpu/drm/i915/display/intel_display.h  |  2 +-
>>>   .../drm/i915/display/intel_display_debugfs.c  | 83 +++++++++++++++++++
>>>   .../drm/i915/display/intel_display_types.h    |  4 +-
>>>   drivers/gpu/drm/i915/display/intel_dp.c       | 81 +++++++++++-------
>>>   drivers/gpu/drm/i915/display/intel_dp_mst.c   | 32 ++++---
>>>   drivers/gpu/drm/i915/display/intel_fdi.c      |  2 +-
>>>   .../i915/display/intel_fractional_helper.h    | 36 ++++++++
>>>   .../gpu/drm/i915/display/intel_qp_tables.c    |  3 -
>>>   drivers/gpu/drm/i915/display/intel_vdsc.c     | 30 +++++--
>>>   include/drm/display/drm_dp_helper.h           |  1 +
>>>   16 files changed, 275 insertions(+), 74 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/i915/display/intel_fractional_helper.h
>>>
>>> -- 
>>> 2.25.1
>>>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CA875EE1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 08:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B9A10E566;
	Fri,  8 Mar 2024 07:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfk9iVLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD7B10E566
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709884486; x=1741420486;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6aetVt5pJf5SLmzLY38Fa4qD7/eAZvCvftnw107cvXc=;
 b=bfk9iVLJUxozWD8VwtIfv+HdW26O9vpTBeJyhkExzzgfW4gaH/MgFX/d
 ELJuzHD4tlBk2CYHAPt3xsxIw17u8chQrSED8U0M+URu5r23rQSsguyb8
 ixeWB/t0Q8EsEW3dzQISRYReIW54WPmCvu18G3jsm/Fu5bm+2EYhJR4B3
 i3x291GSfqTOTjHxaDBpBjlU5h8P+y0tGFLaQctNjQPuw78ae481y1VoO
 bHp5lfRsNwuNafw7YR3Wkr4eEWC+kCg4biHgw6oiXMIR5r56u6ebC9i2J
 BBn5gb5tttGqIYWnfBd2n2yAJTTOGNZoIF89kSBOKq4V692eorxKYB5Ok Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15315636"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="15315636"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 23:54:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="15062933"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 23:54:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, R SUNDAR
 <prosunofficial@gmail.com>, airlied@gmail.com, daniel@ffwll.ch,
 lyude@redhat.com, imre.deak@intel.com, mripard@kernel.org,
 ville.syrjala@linux.intel.com, Wayne.Lin@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Removed vcpi field description to fix kernel doc warning
In-Reply-To: <9199ed28-ba15-4d50-b8a6-7f6a32aeb3bb@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240308025152.17297-1-prosunofficial@gmail.com>
 <9199ed28-ba15-4d50-b8a6-7f6a32aeb3bb@infradead.org>
Date: Fri, 08 Mar 2024 09:54:38 +0200
Message-ID: <87msr9upj5.fsf@intel.com>
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

On Thu, 07 Mar 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 3/7/24 18:51, R SUNDAR wrote:
>> For linux-next repo
>> 
>> /include/drm/display/drm_dp_mst_helper.h:156: warning: Excess struct member 'vcpi' description in 'drm_dp_mst_port'
>> 
>> Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
>
> or
> https://lore.kernel.org/lkml/20240106032321.28596-1-rdunlap@infradead.org/
>
> but I would be happy to see either of them merged.

That has fallen through the cracks, apologies, but I merged this
yesterday to drm-misc-next:

ca892057e03e ("drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc")

BR,
Jani.

>
> Thanks.
>
>> ---
>>  include/drm/display/drm_dp_mst_helper.h | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
>> index 9b19d8bd520a..3ae88a383a41 100644
>> --- a/include/drm/display/drm_dp_mst_helper.h
>> +++ b/include/drm/display/drm_dp_mst_helper.h
>> @@ -83,7 +83,6 @@ struct drm_dp_mst_branch;
>>   * @passthrough_aux: parent aux to which DSC pass-through requests should be
>>   * sent, only set if DSC pass-through is possible.
>>   * @parent: branch device parent of this port
>> - * @vcpi: Virtual Channel Payload info for this port.
>>   * @connector: DRM connector this port is connected to. Protected by
>>   * &drm_dp_mst_topology_mgr.base.lock.
>>   * @mgr: topology manager this port lives under.

-- 
Jani Nikula, Intel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714978EB1D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 12:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBAD10E602;
	Thu, 31 Aug 2023 10:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1C210E602;
 Thu, 31 Aug 2023 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693479152; x=1725015152;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IKJ9fvESNpOgrVXSrWsbLPo/JZkMzvWxB+Z5zCbjbYw=;
 b=hLA80fp2WG54MitGp9YMJS4h2vzcIUXTvJQ43vRy3tWEGvtp8jQWIk8v
 CbOXUzQ5n1a4dVS0ICniTd/0/1Wa33dOUCl1NNPk/zhyMZ0nVwlM1/8pC
 jaH5VbuUQLxNrkSN95Y+j078SJaaGaEpC9duXfBVhOEj/OdiVjksq8gSe
 5hGbJWDKNLKEzzsxHQcMR7JG4ZXbF7jseYJgAx4XwxNhJ3DEBOHHkYdNv
 7+0sXBTyYp2+D6zZWt3LxwlioYpcoFyxrfcJoAdXZr2v3nmWrsQrjBEx9
 /dfM39C4i0ZhJrk/Zy3vQVP5nx/rN2mJYB16AtSEdIaa5xRUEWDBV1jqK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442262365"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="442262365"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809548043"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="809548043"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:52:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] media: cec: core: add note about *_from_edid()
 function usage in drm
In-Reply-To: <343ed7f5-194a-805c-5608-b9000a868d5f@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692884619.git.jani.nikula@intel.com>
 <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
 <343ed7f5-194a-805c-5608-b9000a868d5f@xs4all.nl>
Date: Thu, 31 Aug 2023 13:52:26 +0300
Message-ID: <87edjjjxg5.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Aug 2023, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 24/08/2023 15:46, Jani Nikula wrote:
>> In the drm subsystem, the source physical address is, in most cases,
>> available without having to parse the EDID again. Add notes about
>> preferring to use the pre-parsed address instead.
>> 
>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/media/cec/core/cec-adap.c     | 4 ++++
>>  drivers/media/cec/core/cec-notifier.c | 4 ++++
>>  2 files changed, 8 insertions(+)
>> 
>> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
>> index 241b1621b197..2c627ed611ed 100644
>> --- a/drivers/media/cec/core/cec-adap.c
>> +++ b/drivers/media/cec/core/cec-adap.c
>> @@ -1688,6 +1688,10 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
>>  }
>>  EXPORT_SYMBOL_GPL(cec_s_phys_addr);
>>  
>> +/*
>> + * Note: In the drm subsystem, prefer calling cec_s_phys_addr() with
>> + * connector->display_info.source_physical_address if possible.
>> + */
>
> I would rephrase this:
>
> /*
>  * Note: in the drm subsystem, prefer calling (if possible):
>  *
>  * cec_s_phys_addr(adap, connector->display_info.source_physical_address, false);
>  */
>
> I think it is important to indicate that the last argument should be 'false'.

Agreed.

>
>>  void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
>>  			       const struct edid *edid)
>>  {
>> diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
>> index 389dc664b211..13f043b3025b 100644
>> --- a/drivers/media/cec/core/cec-notifier.c
>> +++ b/drivers/media/cec/core/cec-notifier.c
>> @@ -195,6 +195,10 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
>>  }
>>  EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
>>  
>> +/*
>> + * Note: In the drm subsystem, prefer calling cec_notifier_set_phys_addr() with
>> + * connector->display_info.source_physical_address if possible.
>> + */
>
> This comment is fine, there is no similar last argument here. But perhaps
> it is good to use a similar format as above. Up to you.

Thanks, rephrased both in v2.

BR,
Jani.


>
>>  void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>>  					  const struct edid *edid)
>>  {
>
> Regards,
>
> 	Hans

-- 
Jani Nikula, Intel Open Source Graphics Center

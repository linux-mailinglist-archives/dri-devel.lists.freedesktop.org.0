Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B298A3EC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE6210E0B6;
	Mon, 30 Sep 2024 13:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0KWsf2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0409C10E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727701502; x=1759237502;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=waO74JnyKQLEdAzXvkltfsnd+bXvksgXm2mYdRhaNsU=;
 b=d0KWsf2dI4XTax71tcKAXi0d+RDaoI3oSw6R3bOnqn0TJVbwrpRyFxux
 rALBRMlNcdiVe/B7vyWj470etvYnt795+KWwhULCmMWYcHqNVHQMKO5qb
 F/0PjYZwJOzaVK2j2mVUO9n8pSbi3oqG3WeIrB/E5zbp1ELVbl0H3C+9A
 leKtmdQ02WeRnrq3K2nWzm4exQTuvgDotCodERKkb6nhdEryn+aBiTYvC
 /kaWDZ/xtEQtm99TZ4PAN27qFGIjODz50Vqgt1Ai2LcjBiFW/XCjitGu+
 dinZgigkqaiC/FMo3x+3dZ3Y5AR9FzqsCvMfbkNDiOfvpwwDmuSYBw1VI w==;
X-CSE-ConnectionGUID: JKgh5fNSQNSXOu2wrzfJ4Q==
X-CSE-MsgGUID: Uv2ut+02R0KU186aTGdznw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37930929"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37930929"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:04:11 -0700
X-CSE-ConnectionGUID: MUIiZBjwTief2Ss1Q0GE6w==
X-CSE-MsgGUID: 4IeHLipWRDCpZfxNQ5hulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73603548"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:04:09 -0700
Message-ID: <c28811c9-8243-4143-9a5f-cae86db3c46d@linux.intel.com>
Date: Mon, 30 Sep 2024 15:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/29] accel/ivpu: Add FW version debugfs entry
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-10-jacek.lawrynowicz@linux.intel.com>
 <e276a13f-8add-26f9-9fc4-960a10664e98@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e276a13f-8add-26f9-9fc4-960a10664e98@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 9/27/2024 10:55 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Add debugfs that prints current firmware version string on read.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_debugfs.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
>> index cd3ac08f0409a..65245f45cc701 100644
>> --- a/drivers/accel/ivpu/ivpu_debugfs.c
>> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
>> @@ -4,6 +4,7 @@
>>    */
>>     #include <linux/debugfs.h>
>> +#include <linux/firmware.h>
>>     #include <drm/drm_debugfs.h>
>>   #include <drm/drm_file.h>
>> @@ -20,6 +21,8 @@
>>   #include "ivpu_jsm_msg.h"
>>   #include "ivpu_pm.h"
>>   +#include "vpu_boot_api.h"
>> +
>>   static inline struct ivpu_device *seq_to_ivpu(struct seq_file *s)
>>   {
>>       struct drm_debugfs_entry *entry = s->private;
>> @@ -45,6 +48,14 @@ static int fw_name_show(struct seq_file *s, void *v)
>>       return 0;
>>   }
>>   +static int fw_version_show(struct seq_file *s, void *v)
>> +{
>> +    struct ivpu_device *vdev = seq_to_ivpu(s);
>> +
>> +    seq_printf(s, "%s\n", (const char *)vdev->fw->file->data + VPU_FW_HEADER_SIZE);
> 
> This FW file comes from userspace. Is there a check somewhere else that this string is properly NULL terminated as expected?
> 

Sadly there is no check. I will add limited and properly terminated string with version info.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7CB831D9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 08:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38BD10E0E3;
	Thu, 18 Sep 2025 06:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idxqzQjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E591610E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758176452; x=1789712452;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o/GQv1/gMRh+jToUpX/10OyuKH2VOVuV362ok4h0Ntk=;
 b=idxqzQjmaS/jQepl64aXxW3XZQFy6CjDuNT9KbJoJXKKGRrfyjL2kn7O
 NpN04w/LFo9fBwMKqLpn2bXhlOk65itgF0W7UgafJKk0zu665Apv+uBPz
 xUDIqZ3HtuuOM17zb0Ou+HRGLIsuX7eMln4YkLJJ63i4BIoDNCbuX6Dd1
 7C7zWmGUa/4ly2Mi3NcVMUU3f8R6pp1txykxApr/WjLJTQ8aqk9OrIHrm
 sbd3hyDzh7mJOIDYC50Mbuo9nvyBtXZY+wtXRjIA2Kg5tf9tfIF/uxwl3
 aPZ5K/4EqWilkGJ3BtTQx2x/VNaMyj/yrC14bXt/HLhO8xbY47H1cUIXa w==;
X-CSE-ConnectionGUID: 2v3ZCovzQOCIdlJijwqMVQ==
X-CSE-MsgGUID: rpcNXYjeQvKguyb07SFDUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59537305"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="59537305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:20:51 -0700
X-CSE-ConnectionGUID: R/GYjm7XS0+5uqVo2zl+Jw==
X-CSE-MsgGUID: DtrD+xDsR8Syw0A/KcxzRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175848474"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.255.10])
 ([10.245.255.10])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:20:50 -0700
Message-ID: <ca4c2a8c-4e1f-4a67-824b-58539bbda0c1@linux.intel.com>
Date: Thu, 18 Sep 2025 08:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Refactor priority_bands_show for readability
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20250915103401.830045-1-karol.wachowski@linux.intel.com>
 <4d8257fb-ea52-3d92-d240-7f072bdddd26@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4d8257fb-ea52-3d92-d240-7f072bdddd26@amd.com>
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

Applied to drm-misc-next

On 9/15/2025 10:38 PM, Lizhi Hou wrote:
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> On 9/15/25 03:34, Karol Wachowski wrote:
>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Reduce code duplication and improve the overall readability of the
>> debugfs
>> output for job scheduling priority bands.
>>
>> Additionally fix clang-tidy warning about missing default case in the
>> switch statement.
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_debugfs.c | 38 ++++++++++++-------------------
>>   1 file changed, 14 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c
>> b/drivers/accel/ivpu/ivpu_debugfs.c
>> index cd24ccd20ba6..3bd85ee6c26b 100644
>> --- a/drivers/accel/ivpu/ivpu_debugfs.c
>> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
>> @@ -398,35 +398,25 @@ static int dct_active_set(void *data, u64
>> active_percent)
>>     DEFINE_DEBUGFS_ATTRIBUTE(ivpu_dct_fops, dct_active_get,
>> dct_active_set, "%llu\n");
>>   +static void print_priority_band(struct seq_file *s, struct
>> ivpu_hw_info *hw,
>> +                int band, const char *name)
>> +{
>> +    seq_printf(s, "%-9s: grace_period %9u process_grace_period %9u
>> process_quantum %9u\n",
>> +           name,
>> +           hw->hws.grace_period[band],
>> +           hw->hws.process_grace_period[band],
>> +           hw->hws.process_quantum[band]);
>> +}
>> +
>>   static int priority_bands_show(struct seq_file *s, void *v)
>>   {
>>       struct ivpu_device *vdev = s->private;
>>       struct ivpu_hw_info *hw = vdev->hw;
>>   -    for (int band = VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE;
>> -         band < VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT; band++) {
>> -        switch (band) {
>> -        case VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE:
>> -            seq_puts(s, "Idle:     ");
>> -            break;
>> -
>> -        case VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL:
>> -            seq_puts(s, "Normal:   ");
>> -            break;
>> -
>> -        case VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS:
>> -            seq_puts(s, "Focus:    ");
>> -            break;
>> -
>> -        case VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME:
>> -            seq_puts(s, "Realtime: ");
>> -            break;
>> -        }
>> -
>> -        seq_printf(s, "grace_period %9u process_grace_period %9u
>> process_quantum %9u\n",
>> -               hw->hws.grace_period[band],
>> hw->hws.process_grace_period[band],
>> -               hw->hws.process_quantum[band]);
>> -    }
>> +    print_priority_band(s, hw,
>> VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE, "Idle");
>> +    print_priority_band(s, hw,
>> VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL, "Normal");
>> +    print_priority_band(s, hw,
>> VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS, "Focus");
>> +    print_priority_band(s, hw,
>> VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME, "Realtime");
>>         return 0;
>>   }

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D9B831A5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 08:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C2010E0D5;
	Thu, 18 Sep 2025 06:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvQB0RFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A488610E0D5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758175869; x=1789711869;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EG9ZFhl+5uDziktVtFvyH3w/WDJiOpKBIgvL9u+loTE=;
 b=mvQB0RFqQG4pf0WiMMCf6lLF28A8O2PwAREUXWtQipMyQAquAI+ePX+X
 bIrnY9Qtt6af7GA5nfUSuZEUsgG+RAFL3PLS7tv7jtbPYExpQgpSWcrzs
 rrmTMLQb7X56AaGavi344E74/hUA2aW/7PUXp9Od4vlSdD9CeTDWls2YO
 A0SzbYzyt21CDFBuYf+Uk279Snc+/JH0QlneQ7624GVzYteuC7ZV4dyU0
 aLfBGJvf+YGZWyyyJPADp01xK84OBbtUt2DZtcIWWIe2rhTXWGCzVWyni
 s7Phz6ge54wJVy7oHNnrZ41WPBjW0jakWESqj3/8PsH0O81FRzhzu0ALT A==;
X-CSE-ConnectionGUID: LN4mUtJuTj+fOag/Wy8JDw==
X-CSE-MsgGUID: NbFzsM8XT0CJ34Qy9J4uYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60607429"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60607429"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:11:08 -0700
X-CSE-ConnectionGUID: xWMOFLqRQRKNmXYuQlM/zA==
X-CSE-MsgGUID: U7IqdSjsR8CbDoy3sBKddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206388571"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.255.10])
 ([10.245.255.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:11:06 -0700
Message-ID: <4d3845ce-7cb1-4ddd-92c7-be65ffa187ef@linux.intel.com>
Date: Thu, 18 Sep 2025 08:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reset cmdq->db_id on register failure
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com
References: <20250915103421.830065-1-karol.wachowski@linux.intel.com>
 <4480b307-ea4a-edec-f2c6-e271c23cc05b@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4480b307-ea4a-edec-f2c6-e271c23cc05b@amd.com>
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

On 9/15/2025 10:36 PM, Lizhi Hou wrote:
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> On 9/15/25 03:34, Karol Wachowski wrote:
>> Ensure that cmdq->db_id is reset to 0 if ivpu_jsm_register_db fails,
>> preventing potential reuse of invalid command queue with
>> unregistered doorbell.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_job.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_job.c
>> b/drivers/accel/ivpu/ivpu_job.c
>> index 060f1fc031d3..fa1720fa06a4 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -219,11 +219,13 @@ static int ivpu_register_db(struct
>> ivpu_file_priv *file_priv, struct ivpu_cmdq *
>>           ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id,
>> cmdq->db_id,
>>                          cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
>>   -    if (!ret)
>> +    if (!ret) {
>>           ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d
>> priority %d\n",
>>                cmdq->db_id, cmdq->id, file_priv->ctx.id,
>> cmdq->priority);
>> -    else
>> +    } else {
>>           xa_erase(&vdev->db_xa, cmdq->db_id);
>> +        cmdq->db_id = 0;
>> +    }
>>         return ret;
>>   }

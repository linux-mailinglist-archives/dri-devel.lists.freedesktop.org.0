Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B5AA1CC3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 23:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2AA10E10C;
	Tue, 29 Apr 2025 21:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CC810E490;
 Tue, 29 Apr 2025 13:17:43 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4Zn17x63KWzW7q;
 Tue, 29 Apr 2025 21:17:33 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4Zn17t3Lvvz5TCGC;
 Tue, 29 Apr 2025 21:17:30 +0800 (CST)
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Zn17j42NMz5B1Jt;
 Tue, 29 Apr 2025 21:17:21 +0800 (CST)
Received: (from root@localhost) by mse-db.zte.com.cn id 53TDHHjY085301;
 Tue, 29 Apr 2025 21:17:17 +0800 (+08)
 (envelope-from liu.song13@zte.com.cn)
Message-Id: <202504291317.53TDHHjY085301@mse-db.zte.com.cn>
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 53T9T3aU063440;
 Tue, 29 Apr 2025 17:29:03 +0800 (+08)
 (envelope-from liu.song13@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Tue, 29 Apr 2025 17:29:05 +0800 (CST)
Date: Tue, 29 Apr 2025 17:29:05 +0800 (CST)
X-Zmail-TransId: 2af968109be16a9-43a08
X-Mailer: Zmail v1.0
In-Reply-To: <0b1e1a00-2cb9-4793-a439-06fcec3e71ec@amd.com>
References: 202504270413.53R4DUco001600@mse-db.zte.com.cn,
 0b1e1a00-2cb9-4793-a439-06fcec3e71ec@amd.com
Mime-Version: 1.0
From: <liu.song13@zte.com.cn>
To: <felix.kuehling@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <liu.xuemei1@zte.com.cn>,
 <jiang.xuexin@zte.com.cn>, <xue.zhihong@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZHJtL2FtZGtmZDogZW5hYmxlIGtmZCBvbiBSSVNDViBzeXN0ZW1z?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-db.zte.com.cn 53TDHHjY085301
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6810D16C.000/4Zn17x63KWzW7q
X-Mailman-Approved-At: Tue, 29 Apr 2025 21:18:39 +0000
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

>> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
>>
>> KFD has been confirmed that can run on RISCV systems. It's necessary to
>> support CONFIG_HSA_AMD on RISCV.
> 
> Is there a public user mode branch with any changes needed to make ROCm 
> user mode work with RISCV?
> 
> One more question inline.
> 
> 
>> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
>> index d3c3d3ab7225..9d4a5f8ef43f 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
>> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
>> @@ -5,7 +5,7 @@
>>
>>   config HSA_AMD
>>    bool "HSA kernel driver for AMD GPU devices"
>> - depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
>> + depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || RISCV)
> 
> The KFD memory model only works on 64-bit architectures. Is there a way 
> to express that in the RISCV dependency?
> 
> Regards,
>   Felix

Dear Felix:

  Thanks for your feedback.
  Regarding the issues you've pointed out:
  1. The adaptation work of ROCm user mode work on RISCV was done by my collegue. He replied that he made no changes in ROCm code.
  2. I will send patch-v2 to satisfy KFD only work on 64-bit architectures.

Best regards,
  Xuemei

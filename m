Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD613D00DAD
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DD910E143;
	Thu,  8 Jan 2026 03:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VIcQPYzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A8110E143
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 03:26:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 387F260007;
 Thu,  8 Jan 2026 03:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D8DC116C6;
 Thu,  8 Jan 2026 03:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767842772;
 bh=gxpyCPqbkyU/sx/BW6/nQ3HzTCFjev800yihIuE+YMc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VIcQPYzhXcohhG36VA6mczNK/JyH0+h5KaaXAX6J0PE8ZJRkVzEnwOcGIZSBBUC5Z
 gDHk/cGpem1BmOHL+GRdcgDFlE4B9jtn3Y5W28izg3y1nE+372/D+KmPqF+oN2vEHW
 NgquwWoR4c4WrUyAhxgH0LaezaPiUEjvMtDUK1q3W+/Vof/h/tOt5Y3ap/kpu+TQg8
 qcBgr241ODVvjGU3q04zFdtsfeFVKx22/B7ka9CPFFa1/ysj9czaJ0Wz/C0PNU80n/
 1Cn+5FidfRQ86s1SEJREaM4bco6gQ4l8E6r0WRUe+ldkCfQrjDtETVOYKhBinJtNll
 +P303Bmxqfm3A==
Message-ID: <dc741e29-19bd-4de1-86bb-6bbf5799a9a4@kernel.org>
Date: Wed, 7 Jan 2026 21:26:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] accel/amdxdna: Update firmware version check for
 latest firmware
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <20251219014356.2234241-2-lizhi.hou@amd.com>
 <0eb1b06c-72be-409b-b49a-e340bf49453d@amd.com>
 <2cb7bd75-79b8-1a45-8945-0e86f86ede08@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <2cb7bd75-79b8-1a45-8945-0e86f86ede08@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 1/7/2026 4:12 PM, Lizhi Hou wrote:
> 
> On 1/7/26 13:20, Mario Limonciello wrote:
>> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>>> The latest firmware increases the major version number. Update
>>> aie2_check_protocol() to accept and support the new firmware version.
>>>
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>
>> I know it's painful and tech debt; but I suggest you add new paths to 
>> handle both versions of firmware at least until the next LTS kernel.
> 
> With the patch 1, the driver works fine for both current firmware and 
> upcoming firmware.
> 
> Lizhi
> 

Thank for confirming, no other concerns with this patch.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

>>
>>> ---
>>>   drivers/accel/amdxdna/aie2_pci.c  | 36 ++++++++-----------------------
>>>   drivers/accel/amdxdna/aie2_pci.h  |  5 ++---
>>>   drivers/accel/amdxdna/npu1_regs.c |  6 +++---
>>>   drivers/accel/amdxdna/npu4_regs.c | 11 +++++-----
>>>   drivers/accel/amdxdna/npu5_regs.c |  2 --
>>>   drivers/accel/amdxdna/npu6_regs.c |  2 --
>>>   6 files changed, 20 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>> amdxdna/aie2_pci.c
>>> index 81a8e4137bfd..181fdbc10dae 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>> @@ -56,41 +56,23 @@ struct mgmt_mbox_chann_info {
>>>   static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 
>>> fw_major, u32 fw_minor)
>>>   {
>>>       const struct aie2_fw_feature_tbl *feature;
>>> -    struct amdxdna_dev *xdna = ndev->xdna;
>>> -
>>> -    /*
>>> -     * The driver supported mailbox behavior is defined by
>>> -     * ndev->priv->protocol_major and protocol_minor.
>>> -     *
>>> -     * When protocol_major and fw_major are different, it means driver
>>> -     * and firmware are incompatible.
>>> -     */
>>> -    if (ndev->priv->protocol_major != fw_major) {
>>> -        XDNA_ERR(xdna, "Incompatible firmware protocol major %d 
>>> minor %d",
>>> -             fw_major, fw_minor);
>>> -        return -EINVAL;
>>> -    }
>>> +    bool found = false;
>>>   -    /*
>>> -     * When protocol_minor is greater then fw_minor, that means driver
>>> -     * relies on operation the installed firmware does not support.
>>> -     */
>>> -    if (ndev->priv->protocol_minor > fw_minor) {
>>> -        XDNA_ERR(xdna, "Firmware minor version smaller than 
>>> supported");
>>> -        return -EINVAL;
>>> -    }
>>> -
>>> -    for (feature = ndev->priv->fw_feature_tbl; feature && feature- 
>>> >min_minor;
>>> -         feature++) {
>>> +    for (feature = ndev->priv->fw_feature_tbl; feature->major; 
>>> feature++) {
>>> +        if (feature->major != fw_major)
>>> +            continue;
>>>           if (fw_minor < feature->min_minor)
>>>               continue;
>>>           if (feature->max_minor > 0 && fw_minor > feature->max_minor)
>>>               continue;
>>>   -        set_bit(feature->feature, &ndev->feature_mask);
>>> +        ndev->feature_mask |= feature->features;
>>> +
>>> +        /* firmware version matches one of the driver support entry */
>>> +        found = true;
>>>       }
>>>   -    return 0;
>>> +    return found ? 0 : -EOPNOTSUPP;
>>>   }
>>>     static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>> amdxdna/aie2_pci.h
>>> index e1745f07b268..b20a3661078c 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>> @@ -237,7 +237,8 @@ enum aie2_fw_feature {
>>>   };
>>>     struct aie2_fw_feature_tbl {
>>> -    enum aie2_fw_feature feature;
>>> +    u64 features;
>>> +    u32 major;
>>>       u32 max_minor;
>>>       u32 min_minor;
>>>   };
>>> @@ -246,8 +247,6 @@ struct aie2_fw_feature_tbl {
>>>     struct amdxdna_dev_priv {
>>>       const char            *fw_path;
>>> -    u64                protocol_major;
>>> -    u64                protocol_minor;
>>>       const struct rt_config        *rt_config;
>>>       const struct dpm_clk_freq    *dpm_clk_tbl;
>>>       const struct aie2_fw_feature_tbl *fw_feature_tbl;
>>> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/ 
>>> amdxdna/npu1_regs.c
>>> index ebc6e2802297..6f36a27b5a02 100644
>>> --- a/drivers/accel/amdxdna/npu1_regs.c
>>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>>> @@ -6,6 +6,7 @@
>>>   #include <drm/amdxdna_accel.h>
>>>   #include <drm/drm_device.h>
>>>   #include <drm/gpu_scheduler.h>
>>> +#include <linux/bits.h>
>>>   #include <linux/sizes.h>
>>>     #include "aie2_pci.h"
>>> @@ -65,14 +66,13 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>>>   };
>>>     static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>>> -    { .feature = AIE2_NPU_COMMAND, .min_minor = 8 },
>>> +    { .major = 5, .min_minor = 7 },
>>> +    { .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
>>>       { 0 }
>>>   };
>>>     static const struct amdxdna_dev_priv npu1_dev_priv = {
>>>       .fw_path        = "amdnpu/1502_00/npu.sbin",
>>> -    .protocol_major = 0x5,
>>> -    .protocol_minor = 0x7,
>>>       .rt_config    = npu1_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu1_dpm_clk_table,
>>>       .fw_feature_tbl = npu1_fw_feature_table,
>>> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/ 
>>> amdxdna/npu4_regs.c
>>> index a62234fd266d..a8d6f76dde5f 100644
>>> --- a/drivers/accel/amdxdna/npu4_regs.c
>>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>>> @@ -6,6 +6,7 @@
>>>   #include <drm/amdxdna_accel.h>
>>>   #include <drm/drm_device.h>
>>>   #include <drm/gpu_scheduler.h>
>>> +#include <linux/bits.h>
>>>   #include <linux/sizes.h>
>>>     #include "aie2_pci.h"
>>> @@ -88,16 +89,16 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>>   };
>>>     const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>>> -    { .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>>> -    { .feature = AIE2_PREEMPT, .min_minor = 12 },
>>> -    { .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
>>> +    { .major = 6, .min_minor = 12 },
>>> +    { .features = BIT_U64(AIE2_NPU_COMMAND), .major = 6, .min_minor 
>>> = 15 },
>>> +    { .features = BIT_U64(AIE2_PREEMPT), .major = 6, .min_minor = 12 },
>>> +    { .features = BIT_U64(AIE2_TEMPORAL_ONLY), .major = 
>>> 6, .min_minor = 12 },
>>> +    { .features = GENMASK_ULL(AIE2_TEMPORAL_ONLY, 
>>> AIE2_NPU_COMMAND), .major = 7 },
>>>       { 0 }
>>>   };
>>>     static const struct amdxdna_dev_priv npu4_dev_priv = {
>>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>>> -    .protocol_major = 0x6,
>>> -    .protocol_minor = 12,
>>>       .rt_config    = npu4_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>>       .fw_feature_tbl = npu4_fw_feature_table,
>>> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/ 
>>> amdxdna/npu5_regs.c
>>> index 131080652ef0..c0a35cfd886c 100644
>>> --- a/drivers/accel/amdxdna/npu5_regs.c
>>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>>> @@ -64,8 +64,6 @@
>>>     static const struct amdxdna_dev_priv npu5_dev_priv = {
>>>       .fw_path        = "amdnpu/17f0_11/npu.sbin",
>>> -    .protocol_major = 0x6,
>>> -    .protocol_minor = 12,
>>>       .rt_config    = npu4_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>>       .fw_feature_tbl = npu4_fw_feature_table,
>>> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/ 
>>> amdxdna/npu6_regs.c
>>> index 1f71285655b2..1fb07df99186 100644
>>> --- a/drivers/accel/amdxdna/npu6_regs.c
>>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>>> @@ -64,8 +64,6 @@
>>>     static const struct amdxdna_dev_priv npu6_dev_priv = {
>>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>>> -    .protocol_major = 0x6,
>>> -    .protocol_minor = 12,
>>>       .rt_config    = npu4_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>>       .fw_feature_tbl = npu4_fw_feature_table,
>>


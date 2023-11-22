Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440637F48F6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 15:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BCB10E651;
	Wed, 22 Nov 2023 14:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DD010E651;
 Wed, 22 Nov 2023 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663462; x=1732199462;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mDhRRmQ98laG3XWvA38u4IEmny9rkykRokP8cPl8Kss=;
 b=LCohgWuriBCKIdPvJk8bhuHBw832VEu98ka/w6PMY9uUmrbLYa/7c2eu
 oROiCqxFqLHBZOVxrRRcAIAllPSyY2y2mjKeHvURFu1H76vJOgaaWjjym
 tLtIDgu06S3Z+3JukdBnQHOs4fiRJPnKrRVtJjNvH5NZ7SIVOO3lJnYBC
 lJAg8yMaEjgdO3V3cwA2RwJTP1fuJLsueaOZblq/JkpGEEOQbZ3RnX/cs
 J8AOKs+h+df/BREkhQCeHWc78TCY5ZF3616kYn/BrZEPOcB3dCsZBBk0S
 PfxQbk7Qa7oSa7ypNjrDNCC++JS3tGdrNPmqX2O81COpQ++WXq5DISwL2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382459805"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="382459805"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="15278343"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:30:58 -0800
Message-ID: <17bb3d8e-f675-4fb7-9533-f8c247c3506d@linux.intel.com>
Date: Wed, 22 Nov 2023 20:03:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 3/5] drm/xe/RAS: Expose the error counters
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Luben.Tuikov@amd.com" <Luben.Tuikov@amd.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-4-aravind.iddamsetty@linux.intel.com>
 <f728d516-ef87-4569-b4a2-131b62de29a2@habana.ai>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <f728d516-ef87-4569-b4a2-131b62de29a2@habana.ai>
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


On 11/10/23 17:57, Tomer Tayar wrote:
> On 20/10/2023 18:58, Aravind Iddamsetty wrote:
>> We expose the various error counters supported on a hardware via genl
>> subsytem through the registered commands to userspace. The
>> DRM_RAS_CMD_QUERY lists the error names with config id,
>> DRM_RAD_CMD_READ_ONE returns the counter value for the requested config
>> id and the DRM_RAS_CMD_READ_ALL lists the counters for all errors along
>> with their names and config ids.
>>
>> v2: Rebase
>>
>> v3:
>> 1. presently xe_list_errors fills blank data for IGFX, prevent it by
>> having an early check of IS_DGFX (Michael J. Ruhl)
>> 2. update errors from all sources
>>
>> Cc: Ruhl, Michael J<michael.j.ruhl@intel.com>
>> Signed-off-by: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_netlink.c | 499 +++++++++++++++++++++++++++++++-
>>   include/uapi/drm/xe_drm.h       |  81 ++++++
>>   2 files changed, 578 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
>> index 81d785455632..3e4cdb5e4920 100644
>> --- a/drivers/gpu/drm/xe/xe_netlink.c
>> +++ b/drivers/gpu/drm/xe/xe_netlink.c
>> @@ -2,16 +2,511 @@
>>   /*
>>    * Copyright © 2023 Intel Corporation
>>    */
>> +#include <drm/xe_drm.h>
>> +
>>   #include "xe_device.h"
>>   
>> -static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
>> +#define MAX_ERROR_NAME	100
>> +
>> +static const char * const xe_hw_error_events[] = {
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG] = "correctable-l3-sng",
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_GUC] = "correctable-guc",
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER] = "correctable-sampler",
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_SLM] = "correctable-slm",
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_EU_IC] = "correctable-eu-ic",
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF] = "correctable-eu-grf",
>> +		[XE_GENL_GT_ERROR_FATAL_ARR_BIST] = "fatal-array-bist",
>> +		[XE_GENL_GT_ERROR_FATAL_L3_DOUB] = "fatal-l3-double",
>> +		[XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK] = "fatal-l3-ecc-checker",
>> +		[XE_GENL_GT_ERROR_FATAL_GUC] = "fatal-guc",
>> +		[XE_GENL_GT_ERROR_FATAL_IDI_PAR] = "fatal-idi-parity",
>> +		[XE_GENL_GT_ERROR_FATAL_SQIDI] = "fatal-sqidi",
>> +		[XE_GENL_GT_ERROR_FATAL_SAMPLER] = "fatal-sampler",
>> +		[XE_GENL_GT_ERROR_FATAL_SLM] = "fatal-slm",
>> +		[XE_GENL_GT_ERROR_FATAL_EU_IC] = "fatal-eu-ic",
>> +		[XE_GENL_GT_ERROR_FATAL_EU_GRF] = "fatal-eu-grf",
>> +		[XE_GENL_GT_ERROR_FATAL_FPU] = "fatal-fpu",
>> +		[XE_GENL_GT_ERROR_FATAL_TLB] = "fatal-tlb",
>> +		[XE_GENL_GT_ERROR_FATAL_L3_FABRIC] = "fatal-l3-fabric",
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE] = "correctable-subslice",
>> +		[XE_GENL_GT_ERROR_CORRECTABLE_L3BANK] = "correctable-l3bank",
>> +		[XE_GENL_GT_ERROR_FATAL_SUBSLICE] = "fatal-subslice",
>> +		[XE_GENL_GT_ERROR_FATAL_L3BANK] = "fatal-l3bank",
>> +		[XE_GENL_SGUNIT_ERROR_CORRECTABLE] = "sgunit-correctable",
>> +		[XE_GENL_SGUNIT_ERROR_NONFATAL] = "sgunit-nonfatal",
>> +		[XE_GENL_SGUNIT_ERROR_FATAL] = "sgunit-fatal",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD] = "soc-nonfatal-csc-psf-cmd-parity",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMP] = "soc-nonfatal-csc-psf-unexpected-completion",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_REQ] = "soc-nonfatal-csc-psf-unsupported-request",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_ANR_MDFI] = "soc-nonfatal-anr-mdfi",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2T] = "soc-nonfatal-mdfi-t2t",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2C] = "soc-nonfatal-mdfi-t2c",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 0)] = "soc-nonfatal-hbm-ss0-0",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 1)] = "soc-nonfatal-hbm-ss0-1",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 2)] = "soc-nonfatal-hbm-ss0-2",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 3)] = "soc-nonfatal-hbm-ss0-3",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 4)] = "soc-nonfatal-hbm-ss0-4",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 5)] = "soc-nonfatal-hbm-ss0-5",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 6)] = "soc-nonfatal-hbm-ss0-6",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 7)] = "soc-nonfatal-hbm-ss0-7",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 8)] = "soc-nonfatal-hbm-ss1-0",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 9)] = "soc-nonfatal-hbm-ss1-1",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 10)] = "soc-nonfatal-hbm-ss1-2",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 11)] = "soc-nonfatal-hbm-ss1-3",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 12)] = "soc-nonfatal-hbm-ss1-4",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 13)] = "soc-nonfatal-hbm-ss1-5",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 14)] = "soc-nonfatal-hbm-ss1-6",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 15)] = "soc-nonfatal-hbm-ss1-7",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 0)] = "soc-nonfatal-hbm-ss2-0",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 1)] = "soc-nonfatal-hbm-ss2-1",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 2)] = "soc-nonfatal-hbm-ss2-2",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 3)] = "soc-nonfatal-hbm-ss2-3",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 4)] = "soc-nonfatal-hbm-ss2-4",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 5)] = "soc-nonfatal-hbm-ss2-5",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 6)] = "soc-nonfatal-hbm-ss2-6",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 7)] = "soc-nonfatal-hbm-ss2-7",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 8)] = "soc-nonfatal-hbm-ss3-0",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 9)] = "soc-nonfatal-hbm-ss3-1",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 10)] = "soc-nonfatal-hbm-ss3-2",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 11)] = "soc-nonfatal-hbm-ss3-3",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 12)] = "soc-nonfatal-hbm-ss3-4",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 13)] = "soc-nonfatal-hbm-ss3-5",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 14)] = "soc-nonfatal-hbm-ss3-6",
>> +		[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 15)] = "soc-nonfatal-hbm-ss3-7",
>> +		[XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMD] = "soc-fatal-csc-psf-cmd-parity",
>> +		[XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMP] = "soc-fatal-csc-psf-unexpected-completion",
>> +		[XE_GENL_SOC_ERROR_FATAL_CSC_PSF_REQ] = "soc-fatal-csc-psf-unsupported-request",
>> +		[XE_GENL_SOC_ERROR_FATAL_PUNIT] = "soc-fatal-punit",
>> +		[XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMD] = "soc-fatal-pcie-psf-command-parity",
>> +		[XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMP] = "soc-fatal-pcie-psf-unexpected-completion",
>> +		[XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_REQ] = "soc-fatal-pcie-psf-unsupported-request",
>> +		[XE_GENL_SOC_ERROR_FATAL_ANR_MDFI] = "soc-fatal-anr-mdfi",
>> +		[XE_GENL_SOC_ERROR_FATAL_MDFI_T2T] = "soc-fatal-mdfi-t2t",
>> +		[XE_GENL_SOC_ERROR_FATAL_MDFI_T2C] = "soc-fatal-mdfi-t2c",
>> +		[XE_GENL_SOC_ERROR_FATAL_PCIE_AER] = "soc-fatal-malformed-pcie-aer",
>> +		[XE_GENL_SOC_ERROR_FATAL_PCIE_ERR] = "soc-fatal-malformed-pcie-err",
>> +		[XE_GENL_SOC_ERROR_FATAL_UR_COND] = "soc-fatal-ur-condition-ieh",
>> +		[XE_GENL_SOC_ERROR_FATAL_SERR_SRCS] = "soc-fatal-from-serr-sources",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 0)] = "soc-fatal-hbm-ss0-0",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 1)] = "soc-fatal-hbm-ss0-1",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 2)] = "soc-fatal-hbm-ss0-2",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 3)] = "soc-fatal-hbm-ss0-3",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 4)] = "soc-fatal-hbm-ss0-4",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 5)] = "soc-fatal-hbm-ss0-5",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 6)] = "soc-fatal-hbm-ss0-6",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 7)] = "soc-fatal-hbm-ss0-7",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 8)] = "soc-fatal-hbm-ss1-0",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 9)] = "soc-fatal-hbm-ss1-1",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 10)] = "soc-fatal-hbm-ss1-2",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 11)] = "soc-fatal-hbm-ss1-3",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 12)] = "soc-fatal-hbm-ss1-4",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 13)] = "soc-fatal-hbm-ss1-5",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 14)] = "soc-fatal-hbm-ss1-6",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(0, 15)] = "soc-fatal-hbm-ss1-7",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 0)] = "soc-fatal-hbm-ss2-0",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 1)] = "soc-fatal-hbm-ss2-1",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 2)] = "soc-fatal-hbm-ss2-2",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 3)] = "soc-fatal-hbm-ss2-3",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 4)] = "soc-fatal-hbm-ss2-4",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 5)] = "soc-fatal-hbm-ss2-5",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 6)] = "soc-fatal-hbm-ss2-6",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 7)] = "soc-fatal-hbm-ss2-7",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 8)] = "soc-fatal-hbm-ss3-0",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 9)] = "soc-fatal-hbm-ss3-1",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 10)] = "soc-fatal-hbm-ss3-2",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 11)] = "soc-fatal-hbm-ss3-3",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 12)] = "soc-fatal-hbm-ss3-4",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 13)] = "soc-fatal-hbm-ss3-5",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 14)] = "soc-fatal-hbm-ss3-6",
>> +		[XE_GENL_SOC_ERROR_FATAL_HBM(1, 15)] = "soc-fatal-hbm-ss3-7",
>> +		[XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC] = "gsc-correctable-sram-ecc",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = "gsc-nonfatal-mia-shutdown",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_MIA_INTERNAL] = "gsc-nonfatal-mia-internal",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC] = "gsc-nonfatal-sram-ecc",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = "gsc-nonfatal-wdg-timeout",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY] = "gsc-nonfatal-rom-parity",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY] = "gsc-nonfatal-ucode-parity",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_VLT_GLITCH] = "gsc-nonfatal-vlt-glitch",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL] = "gsc-nonfatal-fuse-pull",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = "gsc-nonfatal-fuse-crc-check",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_SELF_MBIST] = "gsc-nonfatal-self-mbist",
>> +		[XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY] = "gsc-nonfatal-aon-parity",
>> +		[XE_GENL_SGGI_ERROR_NONFATAL] = "sggi-nonfatal-data-parity",
>> +		[XE_GENL_SGLI_ERROR_NONFATAL] = "sgli-nonfatal-data-parity",
>> +		[XE_GENL_SGCI_ERROR_NONFATAL] = "sgci-nonfatal-data-parity",
>> +		[XE_GENL_MERT_ERROR_NONFATAL] = "mert-nonfatal-data-parity",
>> +		[XE_GENL_SGGI_ERROR_FATAL] = "sggi-fatal-data-parity",
>> +		[XE_GENL_SGLI_ERROR_FATAL] = "sgli-fatal-data-parity",
>> +		[XE_GENL_SGCI_ERROR_FATAL] = "sgci-fatal-data-parity",
>> +		[XE_GENL_MERT_ERROR_FATAL] = "mert-nonfatal-data-parity",
>> +};
>> +
>> +static const unsigned long xe_hw_error_map[] = {
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG] = XE_HW_ERR_GT_CORR_L3_SNG,
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_GUC] = XE_HW_ERR_GT_CORR_GUC,
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER] = XE_HW_ERR_GT_CORR_SAMPLER,
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_SLM] = XE_HW_ERR_GT_CORR_SLM,
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_EU_IC] = XE_HW_ERR_GT_CORR_EU_IC,
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF] = XE_HW_ERR_GT_CORR_EU_GRF,
>> +	[XE_GENL_GT_ERROR_FATAL_ARR_BIST] = XE_HW_ERR_GT_FATAL_ARR_BIST,
>> +	[XE_GENL_GT_ERROR_FATAL_L3_DOUB] = XE_HW_ERR_GT_FATAL_L3_DOUB,
>> +	[XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK] = XE_HW_ERR_GT_FATAL_L3_ECC_CHK,
>> +	[XE_GENL_GT_ERROR_FATAL_GUC] = XE_HW_ERR_GT_FATAL_GUC,
>> +	[XE_GENL_GT_ERROR_FATAL_IDI_PAR] = XE_HW_ERR_GT_FATAL_IDI_PAR,
>> +	[XE_GENL_GT_ERROR_FATAL_SQIDI] = XE_HW_ERR_GT_FATAL_SQIDI,
>> +	[XE_GENL_GT_ERROR_FATAL_SAMPLER] = XE_HW_ERR_GT_FATAL_SAMPLER,
>> +	[XE_GENL_GT_ERROR_FATAL_SLM] = XE_HW_ERR_GT_FATAL_SLM,
>> +	[XE_GENL_GT_ERROR_FATAL_EU_IC] = XE_HW_ERR_GT_FATAL_EU_IC,
>> +	[XE_GENL_GT_ERROR_FATAL_EU_GRF] = XE_HW_ERR_GT_FATAL_EU_GRF,
>> +	[XE_GENL_GT_ERROR_FATAL_FPU] = XE_HW_ERR_GT_FATAL_FPU,
>> +	[XE_GENL_GT_ERROR_FATAL_TLB] = XE_HW_ERR_GT_FATAL_TLB,
>> +	[XE_GENL_GT_ERROR_FATAL_L3_FABRIC] = XE_HW_ERR_GT_FATAL_L3_FABRIC,
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE] = XE_HW_ERR_GT_CORR_SUBSLICE,
>> +	[XE_GENL_GT_ERROR_CORRECTABLE_L3BANK] = XE_HW_ERR_GT_CORR_L3BANK,
>> +	[XE_GENL_GT_ERROR_FATAL_SUBSLICE] = XE_HW_ERR_GT_FATAL_SUBSLICE,
>> +	[XE_GENL_GT_ERROR_FATAL_L3BANK] = XE_HW_ERR_GT_FATAL_L3BANK,
>> +	[XE_GENL_SGUNIT_ERROR_CORRECTABLE] = XE_HW_ERR_TILE_CORR_SGUNIT,
>> +	[XE_GENL_SGUNIT_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGUNIT,
>> +	[XE_GENL_SGUNIT_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGUNIT,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD] = XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMD,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMP] = XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMP,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_REQ] = XE_HW_ERR_SOC_NONFATAL_CSC_PSF_REQ,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_ANR_MDFI] = XE_HW_ERR_SOC_NONFATAL_ANR_MDFI,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2T] = XE_HW_ERR_SOC_NONFATAL_MDFI_T2T,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2C] = XE_HW_ERR_SOC_NONFATAL_MDFI_T2C,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 0)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL0,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 1)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL1,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 2)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL2,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 3)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL3,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 4)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL4,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 5)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL5,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 6)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL6,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 7)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL7,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 8)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL0,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 9)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL1,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 10)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL2,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 11)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL3,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 12)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL4,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 13)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL5,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 14)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL6,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 15)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL7,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 0)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL0,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 1)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL1,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 2)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL2,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 3)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL3,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 4)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL4,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 5)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL5,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 6)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL6,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 7)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL7,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 8)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL0,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 9)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL1,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 10)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL2,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 11)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL3,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 12)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL4,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 13)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL5,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 14)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL6,
>> +	[XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 15)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL7,
>> +	[XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMD] = XE_HW_ERR_SOC_FATAL_CSC_PSF_CMD,
>> +	[XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMP] = XE_HW_ERR_SOC_FATAL_CSC_PSF_CMP,
>> +	[XE_GENL_SOC_ERROR_FATAL_CSC_PSF_REQ] = XE_HW_ERR_SOC_FATAL_CSC_PSF_REQ,
>> +	[XE_GENL_SOC_ERROR_FATAL_PUNIT] = XE_HW_ERR_SOC_FATAL_PUNIT,
>> +	[XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMD] = XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMD,
>> +	[XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMP] = XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMP,
>> +	[XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_REQ] = XE_HW_ERR_SOC_FATAL_PCIE_PSF_REQ,
>> +	[XE_GENL_SOC_ERROR_FATAL_ANR_MDFI] = XE_HW_ERR_SOC_FATAL_ANR_MDFI,
>> +	[XE_GENL_SOC_ERROR_FATAL_MDFI_T2T] = XE_HW_ERR_SOC_FATAL_MDFI_T2T,
>> +	[XE_GENL_SOC_ERROR_FATAL_MDFI_T2C] = XE_HW_ERR_SOC_FATAL_MDFI_T2C,
>> +	[XE_GENL_SOC_ERROR_FATAL_PCIE_AER] = XE_HW_ERR_SOC_FATAL_PCIE_AER,
>> +	[XE_GENL_SOC_ERROR_FATAL_PCIE_ERR] = XE_HW_ERR_SOC_FATAL_PCIE_ERR,
>> +	[XE_GENL_SOC_ERROR_FATAL_UR_COND] = XE_HW_ERR_SOC_FATAL_UR_COND,
>> +	[XE_GENL_SOC_ERROR_FATAL_SERR_SRCS] = XE_HW_ERR_SOC_FATAL_SERR_SRCS,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 0)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL0,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 1)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL1,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 2)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL2,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 3)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL3,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 4)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL4,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 5)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL5,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 6)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL6,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 7)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL7,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 8)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL0,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 9)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL1,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 10)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL2,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 11)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL3,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 12)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL4,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 13)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL5,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 14)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL6,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(0, 15)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL7,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 0)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL0,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 1)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL1,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 2)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL2,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 3)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL3,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 4)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL4,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 5)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL5,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 6)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL6,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 7)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL7,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 8)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL0,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 9)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL1,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 10)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL2,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 11)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL3,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 12)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL4,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 13)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL5,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 14)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL6,
>> +	[XE_GENL_SOC_ERROR_FATAL_HBM(1, 15)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL7,
>> +	[XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC] = XE_HW_ERR_GSC_CORR_SRAM,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = XE_HW_ERR_GSC_NONFATAL_MIA_SHUTDOWN,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_MIA_INTERNAL] = XE_HW_ERR_GSC_NONFATAL_MIA_INTERNAL,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC] = XE_HW_ERR_GSC_NONFATAL_SRAM,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = XE_HW_ERR_GSC_NONFATAL_WDG,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY] = XE_HW_ERR_GSC_NONFATAL_ROM_PARITY,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY] = XE_HW_ERR_GSC_NONFATAL_UCODE_PARITY,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_VLT_GLITCH] = XE_HW_ERR_GSC_NONFATAL_VLT_GLITCH,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL] = XE_HW_ERR_GSC_NONFATAL_FUSE_PULL,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = XE_HW_ERR_GSC_NONFATAL_FUSE_CRC,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_SELF_MBIST] = XE_HW_ERR_GSC_NONFATAL_SELF_MBIST,
>> +	[XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY] = XE_HW_ERR_GSC_NONFATAL_AON_RF_PARITY,
>> +	[XE_GENL_SGGI_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGGI,
>> +	[XE_GENL_SGLI_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGLI,
>> +	[XE_GENL_SGCI_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGCI,
>> +	[XE_GENL_MERT_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_MERT,
>> +	[XE_GENL_SGGI_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGGI,
>> +	[XE_GENL_SGLI_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGLI,
>> +	[XE_GENL_SGCI_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGCI,
>> +	[XE_GENL_MERT_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_MERT,
>> +};
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>>   {
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static bool is_gt_error(const u64 config)
>> +{
>> +	unsigned int error;
>> +
>> +	error = config_counter(config);
>> +	if (error <= XE_GENL_GT_ERROR_FATAL_FPU)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static bool is_gt_vector_error(const u64 config)
>> +{
>> +	unsigned int error;
>> +
>> +	error = config_counter(config);
>> +	if (error >= XE_GENL_GT_ERROR_FATAL_TLB &&
>> +	    error <= XE_GENL_GT_ERROR_FATAL_L3BANK)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static bool is_pvc_invalid_gt_errors(const u64 config)
>> +{
>> +	switch (config_counter(config)) {
>> +	case XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG:
>> +	case XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER:
>> +	case XE_GENL_GT_ERROR_FATAL_ARR_BIST:
>> +	case XE_GENL_GT_ERROR_FATAL_L3_DOUB:
>> +	case XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK:
>> +	case XE_GENL_GT_ERROR_FATAL_IDI_PAR:
>> +	case XE_GENL_GT_ERROR_FATAL_SQIDI:
>> +	case XE_GENL_GT_ERROR_FATAL_SAMPLER:
>> +	case XE_GENL_GT_ERROR_FATAL_EU_IC:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool is_gsc_hw_error(const u64 config)
>> +{
>> +	if (config_counter(config) >= XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC &&
>> +	    config_counter(config) <= XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static bool is_soc_error(const u64 config)
>> +{
>> +	if (config_counter(config) >= XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD &&
>> +	    config_counter(config) <= XE_GENL_SOC_ERROR_FATAL_HBM(1, 15))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +	unsigned int gt_id = config_gt_id(config);
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +
>> +	if (!IS_DGFX(xe))
>> +		return -ENODEV;
>> +
>> +	if (gt->info.type == XE_GT_TYPE_UNINITIALIZED)
>> +		return -ENOENT;
>> +
>> +	/* GSC HW ERRORS are present on root tile of
>> +	 * platform supporting MEMORY SPARING only
>> +	 */
>> +	if (is_gsc_hw_error(config) && !(xe->info.platform == XE_PVC && !gt_id))
>> +		return -ENODEV;
>> +
>> +	/* GT vectors error  are valid on Platforms supporting error vectors only */
>> +	if (is_gt_vector_error(config) && xe->info.platform != XE_PVC)
>> +		return -ENODEV;
>> +
>> +	/* Skip gt errors not supported on pvc */
>> +	if (is_pvc_invalid_gt_errors(config) && xe->info.platform == XE_PVC)
>> +		return  -ENODEV;
>> +
>> +	/* FATAL FPU error is valid on PVC only */
>> +	if (config_counter(config) == XE_GENL_GT_ERROR_FATAL_FPU &&
>> +	    !(xe->info.platform == XE_PVC))
>> +		return -ENODEV;
>> +
>> +	if (is_soc_error(config) && !(xe->info.platform == XE_PVC))
>> +		return -ENODEV;
>> +
>> +	return (config_counter(config) >=
>> +			ARRAY_SIZE(xe_hw_error_map)) ? -ENOENT : 0;
>> +}
>> +
>> +static u64 get_counter_value(struct xe_device *xe, u64 config)
>> +{
>> +	const unsigned int gt_id = config_gt_id(config);
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	unsigned int id = config_counter(config);
>> +
>> +	if (is_gt_error(config) || is_gt_vector_error(config))
>> +		return xa_to_value(xa_load(&gt->errors.hw_error, xe_hw_error_map[id]));
>> +
>> +	return xa_to_value(xa_load(&gt->tile->errors.hw_error, xe_hw_error_map[id]));
>> +}
>> +
>> +int fill_error_details(struct xe_device *xe, struct genl_info *info, struct sk_buff *new_msg)
> Should it be static?
yes can be static. will change it.
>
>> +{
>> +	struct nlattr *entry_attr;
>> +	bool counter = false;
>> +	struct xe_gt *gt;
>> +	int i, j;
>> +
>> +	BUILD_BUG_ON(ARRAY_SIZE(xe_hw_error_events) !=
>> +		     ARRAY_SIZE(xe_hw_error_map));
>> +
>> +	if (info->genlhdr->cmd == DRM_RAS_CMD_READ_ALL)
>> +		counter = true;
>> +
>> +	entry_attr = nla_nest_start(new_msg, DRM_RAS_ATTR_QUERY_REPLY);
>> +	if (!entry_attr)
>> +		return -EMSGSIZE;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		char str[MAX_ERROR_NAME];
>> +		u64 val;
>> +
>> +		for (i = 0; i < ARRAY_SIZE(xe_hw_error_events); i++) {
>> +			u64 config = XE_HW_ERROR(j, i);
>> +
>> +			if (config_status(xe, config))
>> +				continue;
>> +
>> +			/* should this be cleared everytime */
>> +			snprintf(str, sizeof(str), "error-gt%d-%s", j, xe_hw_error_events[i]);
>> +
>> +			if (nla_put_string(new_msg, DRM_RAS_ATTR_ERROR_NAME, str))
>> +				goto err;
>> +			if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_ID, config, DRM_ATTR_PAD))
>> +				goto err;
>> +			if (counter) {
>> +				val = get_counter_value(xe, config);
>> +				if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_VALUE, val, DRM_ATTR_PAD))
>> +					goto err;
>> +			}
>> +		}
>> +	}
>> +
>> +	nla_nest_end(new_msg, entry_attr);
>> +
>>   	return 0;
>> +err:
>> +	drm_dbg_driver(&xe->drm, "msg buff is small\n");
>> +	nla_nest_cancel(new_msg, entry_attr);
>> +	nlmsg_free(new_msg);
>> +
>> +	return -EMSGSIZE;
>> +}
>> +
>> +static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
>> +{
>> +	struct xe_device *xe = to_xe_device(drm);
>> +	size_t msg_size = NLMSG_DEFAULT_SIZE;
>> +	struct sk_buff *new_msg;
>> +	int retries = 2;
>> +	void *usrhdr;
>> +	int ret = 0;
>> +
>> +	if (!IS_DGFX(xe))
>> +		return -ENODEV;
>> +
>> +	do {
>> +		new_msg = drm_genl_alloc_msg(drm, info, msg_size, &usrhdr);
>> +		if (!new_msg)
>> +			return -ENOMEM;
>> +
>> +		ret = fill_error_details(xe, info, new_msg);
>> +		if (!ret)
>> +			break;
>> +
>> +		msg_size += NLMSG_DEFAULT_SIZE;
>> +	} while (retries--);
>> +
>> +	if (!ret)
>> +		ret = drm_genl_reply(new_msg, info, usrhdr);
>> +
>> +	return ret;
>>   }
>>   
>>   static int xe_genl_read_error(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
>>   {
>> -	return 0;
>> +	struct xe_device *xe = to_xe_device(drm);
>> +	size_t msg_size = NLMSG_DEFAULT_SIZE;
>> +	struct sk_buff *new_msg;
>> +	void *usrhdr;
>> +	int ret = 0;
>> +	int retries = 2;
>> +	u64 config, val;
>> +
>> +	config = nla_get_u64(info->attrs[DRM_RAS_ATTR_ERROR_ID]);
>> +	ret = config_status(xe, config);
>> +	if (ret)
>> +		return ret;
>> +	do {
>> +		new_msg = drm_genl_alloc_msg(drm, info, msg_size, &usrhdr);
>> +		if (!new_msg)
>> +			return -ENOMEM;
>> +
>> +		val = get_counter_value(xe, config);
>> +		if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_VALUE, val, DRM_ATTR_PAD)) {
>> +			msg_size += NLMSG_DEFAULT_SIZE;
>> +			continue;
>> +		}
> Here ERROR_ID is provided and ERROR_VALUE is returned, but maybe we can 
> return also ERROR_NAME for the "full picture"?
> Or do you think that a regular flow would be first listing all errors, 
> grep the name of the required error, and use its id to get the value, so 
> userspace already has the name?
yes that was the flow i imagine userspace to use, to get the error ID one would have to query first and would
get name and id in response to it and this would be the flow with the new design suggested by Lijo as well.
>
>> +
>> +		break;
>> +	} while (retries--);
> It is really possible that NLMSG_DEFAULT_SIZE won't be enough for a 
> single counter read?

it should be, but i had the fallback just in case it fails but i do not think it is a possibility.

Thanks,
Aravind.
>
> Thanks,
> Tomer
>
>> +
>> +	ret = drm_genl_reply(new_msg, info, usrhdr);
>> +
>> +	return ret;
>>   }
>>   
>>   /* driver callbacks to DRM netlink commands*/
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 60cc6418d9a7..dbb3f1afba5f 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1087,6 +1087,87 @@ struct drm_xe_vm_madvise {
>>   #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
>>   #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
>>   
>> +/**
>> + * DOC: XE GENL netlink event IDs
>> + * TODO: Add more details
>> + */
>> +#define XE_HW_ERROR(gt, id) \
>> +	((id) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG		(0)
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_GUC		(1)
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER		(2)
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_SLM		(3)
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_EU_IC		(4)
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF		(5)
>> +#define XE_GENL_GT_ERROR_FATAL_ARR_BIST			(6)
>> +#define XE_GENL_GT_ERROR_FATAL_L3_DOUB			(7)
>> +#define XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK		(8)
>> +#define XE_GENL_GT_ERROR_FATAL_GUC			(9)
>> +#define XE_GENL_GT_ERROR_FATAL_IDI_PAR			(10)
>> +#define XE_GENL_GT_ERROR_FATAL_SQIDI			(11)
>> +#define XE_GENL_GT_ERROR_FATAL_SAMPLER			(12)
>> +#define XE_GENL_GT_ERROR_FATAL_SLM			(13)
>> +#define XE_GENL_GT_ERROR_FATAL_EU_IC			(14)
>> +#define XE_GENL_GT_ERROR_FATAL_EU_GRF			(15)
>> +#define XE_GENL_GT_ERROR_FATAL_FPU			(16)
>> +#define XE_GENL_GT_ERROR_FATAL_TLB			(17)
>> +#define XE_GENL_GT_ERROR_FATAL_L3_FABRIC		(18)
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE		(19)
>> +#define XE_GENL_GT_ERROR_CORRECTABLE_L3BANK		(20)
>> +#define XE_GENL_GT_ERROR_FATAL_SUBSLICE			(21)
>> +#define XE_GENL_GT_ERROR_FATAL_L3BANK			(22)
>> +#define XE_GENL_SGUNIT_ERROR_CORRECTABLE		(23)
>> +#define XE_GENL_SGUNIT_ERROR_NONFATAL			(24)
>> +#define XE_GENL_SGUNIT_ERROR_FATAL			(25)
>> +#define XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD		(26)
>> +#define XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMP		(27)
>> +#define XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_REQ		(28)
>> +#define XE_GENL_SOC_ERROR_NONFATAL_ANR_MDFI		(29)
>> +#define XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2T		(30)
>> +#define XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2C		(31)
>> +#define XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMD		(32)
>> +#define XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMP		(33)
>> +#define XE_GENL_SOC_ERROR_FATAL_CSC_PSF_REQ		(34)
>> +#define XE_GENL_SOC_ERROR_FATAL_PUNIT			(35)
>> +#define XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMD			(36)
>> +#define XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMP			(37)
>> +#define XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_REQ			(38)
>> +#define XE_GENL_SOC_ERROR_FATAL_ANR_MDFI		(39)
>> +#define XE_GENL_SOC_ERROR_FATAL_MDFI_T2T		(40)
>> +#define XE_GENL_SOC_ERROR_FATAL_MDFI_T2C		(41)
>> +#define XE_GENL_SOC_ERROR_FATAL_PCIE_AER		(42)
>> +#define XE_GENL_SOC_ERROR_FATAL_PCIE_ERR		(43)
>> +#define XE_GENL_SOC_ERROR_FATAL_UR_COND			(44)
>> +#define XE_GENL_SOC_ERROR_FATAL_SERR_SRCS		(45)
>> +
>> +#define XE_GENL_SOC_ERROR_NONFATAL_HBM(ss, n)\
>> +		(XE_GENL_SOC_ERROR_FATAL_SERR_SRCS + 0x1 + (ss) * 0x10 + (n))
>> +#define XE_GENL_SOC_ERROR_FATAL_HBM(ss, n)\
>> +		(XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 15) + 0x1 + (ss) * 0x10 + (n))
>> +
>> +/* 109 is the last ID used by SOC errors */
>> +#define XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC		(110)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN		(111)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_MIA_INTERNAL		(112)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC		(113)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT		(114)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY		(115)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY		(116)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_VLT_GLITCH		(117)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL		(118)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK	(119)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_SELF_MBIST		(120)
>> +#define XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY	(121)
>> +#define XE_GENL_SGGI_ERROR_NONFATAL			(122)
>> +#define XE_GENL_SGLI_ERROR_NONFATAL			(123)
>> +#define XE_GENL_SGCI_ERROR_NONFATAL			(124)
>> +#define XE_GENL_MERT_ERROR_NONFATAL			(125)
>> +#define XE_GENL_SGGI_ERROR_FATAL			(126)
>> +#define XE_GENL_SGLI_ERROR_FATAL			(127)
>> +#define XE_GENL_SGCI_ERROR_FATAL			(128)
>> +#define XE_GENL_MERT_ERROR_FATAL			(129)
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>

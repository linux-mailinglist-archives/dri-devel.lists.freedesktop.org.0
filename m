Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kInmLNdxoGk7jwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:16:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086051A9E58
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE78910E0A0;
	Thu, 26 Feb 2026 16:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMfC3AOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A252110E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772122579; x=1803658579;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vtAZDtZfA60Ns4TVs6HyTjnQhcXrs43+QeIRLRmMOM4=;
 b=nMfC3AOzt8MzpKjpXtHdcRkEOIP9fNZFSmvifd5xiJCSYMB+465khUFF
 uazwYDC/M68zCbbSPabPkMrmTuxDvky9pq33B6o+DFW3pc3rm5yDjvT0t
 DU5u1faaLrsabl5zNGSZon7mx5qgBg/r76wet6lVRcDLYEyOMiVWpbsac
 sRD8H0H3jaf6nTfm337UAMYU/iCs+Hfi/sqhMQh2y/DLhMBN4hzKFZIil
 KDF5ue78MCMltuREnnq/Xt3Oyfa+RuLFiPFtgIUP9gJqfU6OiiZinLDro
 vqtlcwTrK1AmT2j9ZNscjUBRwQr8HM9W/RgXLMQ7FZXgxtvH9gxjUU79f w==;
X-CSE-ConnectionGUID: KZYdgwtVTP2W+kBkdXCnkg==
X-CSE-MsgGUID: /B72a1brSyyIUWxe3l/qmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77058982"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77058982"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:16:18 -0800
X-CSE-ConnectionGUID: buAKBinjTHGHd/w265WhDA==
X-CSE-MsgGUID: ni7KP3wzQiqRRO11O3rRhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="247142751"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.75])
 ([10.246.17.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:16:15 -0800
Message-ID: <c27e3736-8fc4-4fa8-a5df-7b18d6aea102@linux.intel.com>
Date: Thu, 26 Feb 2026 17:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Update FW Boot API to version 3.29.4
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com
References: <20260220160116.220367-1-maciej.falkowski@linux.intel.com>
 <226a61d5-bee8-f055-2fb1-871332aec307@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <226a61d5-bee8-f055-2fb1-871332aec307@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:karol.wachowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.971];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,amd.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 086051A9E58
X-Rspamd-Action: no action

On 2/23/2026 11:24 PM, Lizhi Hou wrote:

>
> On 2/20/26 08:01, Maciej Falkowski wrote:
>> Update firmware boot API to the version 3.29.4.
>> Remove unused boot parameters from
>> the vpu_firmware_header structure.
>>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/vpu_boot_api.h | 211 +++++++++++++-----------------
>>   1 file changed, 93 insertions(+), 118 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/vpu_boot_api.h 
>> b/drivers/accel/ivpu/vpu_boot_api.h
>> index 218468bbbcad..a41170bbc6b7 100644
>> --- a/drivers/accel/ivpu/vpu_boot_api.h
>> +++ b/drivers/accel/ivpu/vpu_boot_api.h
>> @@ -1,12 +1,22 @@
>>   /* SPDX-License-Identifier: MIT */
>>   /*
>> - * Copyright (c) 2020-2024, Intel Corporation.
>> + * Copyright (c) 2020-2025, Intel Corporation.
>> + */
>> +
>> +/**
>> + * @addtogroup Boot
>> + * @{
>> + */
>> +
>> +/**
>> + * @file
>> + * @brief Boot API public header file.
>>    */
>>     #ifndef VPU_BOOT_API_H
>>   #define VPU_BOOT_API_H
>>   -/*
>> +/**
>>    *  The below values will be used to construct the version info 
>> this way:
>>    *  fw_bin_header->api_version[VPU_BOOT_API_VER_ID] = 
>> (VPU_BOOT_API_VER_MAJOR << 16) |
>>    *  VPU_BOOT_API_VER_MINOR;
>> @@ -16,24 +26,24 @@
>>    *  partial info a build error will be generated.
>>    */
>>   -/*
>> +/**
>>    * Major version changes that break backward compatibility.
>>    * Major version must start from 1 and can only be incremented.
>>    */
>>   #define VPU_BOOT_API_VER_MAJOR 3
>>   -/*
>> +/**
>>    * Minor version changes when API backward compatibility is preserved.
>>    * Resets to 0 if Major version is incremented.
>>    */
>> -#define VPU_BOOT_API_VER_MINOR 28
>> +#define VPU_BOOT_API_VER_MINOR 29
>>   -/*
>> +/**
>>    * API header changed (field names, documentation, formatting) but 
>> API itself has not been changed
>>    */
>> -#define VPU_BOOT_API_VER_PATCH 3
>> +#define VPU_BOOT_API_VER_PATCH 4
>>   -/*
>> +/**
>>    * Index in the API version table
>>    * Must be unique for each API
>>    */
>> @@ -41,7 +51,7 @@
>>     #pragma pack(push, 4)
>>   -/*
>> +/**
>>    * Firmware image header format
>>    */
>>   #define VPU_FW_HEADER_SIZE    4096
>> @@ -61,44 +71,41 @@ struct vpu_firmware_header {
>>       u32 firmware_version_size;
>>       u64 boot_params_load_address;
>>       u32 api_version[VPU_FW_API_VER_NUM];
>> -    /* Size of memory require for firmware execution */
>> +    /** Size of memory require for firmware execution */
>>       u32 runtime_size;
>>       u32 shave_nn_fw_size;
>> -    /*
>> +    /**
>>        * Size of primary preemption buffer, assuming a 2-job 
>> submission queue.
>>        * NOTE: host driver is expected to adapt size accordingly to 
>> actual
>>        * submission queue size and device capabilities.
>>        */
>>       u32 preemption_buffer_1_size;
>> -    /*
>> +    /**
>>        * Size of secondary preemption buffer, assuming a 2-job 
>> submission queue.
>>        * NOTE: host driver is expected to adapt size accordingly to 
>> actual
>>        * submission queue size and device capabilities.
>>        */
>>       u32 preemption_buffer_2_size;
>> -    /*
>> +    /**
>>        * Maximum preemption buffer size that the FW can use: no need 
>> for the host
>>        * driver to allocate more space than that specified by these 
>> fields.
>>        * A value of 0 means no declared limit.
>>        */
>>       u32 preemption_buffer_1_max_size;
>>       u32 preemption_buffer_2_max_size;
>> -    /* Space reserved for future preemption-related fields. */
>> +    /** Space reserved for future preemption-related fields. */
>>       u32 preemption_reserved[4];
>> -    /* FW image read only section start address, 4KB aligned */
>> +    /** FW image read only section start address, 4KB aligned */
>>       u64 ro_section_start_address;
>> -    /* FW image read only section size, 4KB aligned */
>> +    /** FW image read only section size, 4KB aligned */
>>       u32 ro_section_size;
>>       u32 reserved;
>>   };
>>   -/*
>> +/**
>>    * Firmware boot parameters format
>>    */
>>   -#define VPU_BOOT_PLL_COUNT     3
>> -#define VPU_BOOT_PLL_OUT_COUNT 4
>> -
>>   /** Values for boot_type field */
>>   #define VPU_BOOT_TYPE_COLDBOOT 0
>>   #define VPU_BOOT_TYPE_WARMBOOT 1
>> @@ -166,7 +173,7 @@ enum vpu_trace_destination {
>>   #define VPU_TRACE_PROC_BIT_ACT_SHV_3 22
>>   #define VPU_TRACE_PROC_NO_OF_HW_DEVS 23
>>   -/* VPU 30xx HW component IDs are sequential, so define first and 
>> last IDs. */
>> +/** VPU 30xx HW component IDs are sequential, so define first and 
>> last IDs. */
>>   #define VPU_TRACE_PROC_BIT_30XX_FIRST VPU_TRACE_PROC_BIT_LRT
>>   #define VPU_TRACE_PROC_BIT_30XX_LAST VPU_TRACE_PROC_BIT_SHV_15
>>   @@ -175,15 +182,7 @@ struct vpu_boot_l2_cache_config {
>>       u8 cfg;
>>   };
>>   -struct vpu_warm_boot_section {
>> -    u32 src;
>> -    u32 dst;
>> -    u32 size;
>> -    u32 core_id;
>> -    u32 is_clear_op;
>> -};
>> -
>> -/*
>> +/**
>>    * When HW scheduling mode is enabled, a present period is defined.
>>    * It will be used by VPU to swap between normal and focus priorities
>>    * to prevent starving of normal priority band (when implemented).
>> @@ -206,24 +205,24 @@ struct vpu_warm_boot_section {
>>    * Enum for dvfs_mode boot param.
>>    */
>>   enum vpu_governor {
>> -    VPU_GOV_DEFAULT = 0, /* Default Governor for the system */
>> -    VPU_GOV_MAX_PERFORMANCE = 1, /* Maximum performance governor */
>> -    VPU_GOV_ON_DEMAND = 2, /* On Demand frequency control governor */
>> -    VPU_GOV_POWER_SAVE = 3, /* Power save governor */
>> -    VPU_GOV_ON_DEMAND_PRIORITY_AWARE = 4 /* On Demand priority based 
>> governor */
>> +    VPU_GOV_DEFAULT = 0, /** Default Governor for the system */
>> +    VPU_GOV_MAX_PERFORMANCE = 1, /** Maximum performance governor */
>> +    VPU_GOV_ON_DEMAND = 2, /** On Demand frequency control governor */
>> +    VPU_GOV_POWER_SAVE = 3, /** Power save governor */
>> +    VPU_GOV_ON_DEMAND_PRIORITY_AWARE = 4 /** On Demand priority 
>> based governor */
>>   };
>>     struct vpu_boot_params {
>>       u32 magic;
>>       u32 vpu_id;
>>       u32 vpu_count;
>> -    u32 pad0[5];
>> -    /* Clock frequencies: 0x20 - 0xFF */
>> +    u32 reserved_0[5];
>> +    /** Clock frequencies: 0x20 - 0xFF */
>>       u32 frequency;
>> -    u32 pll[VPU_BOOT_PLL_COUNT][VPU_BOOT_PLL_OUT_COUNT];
>> +    u32 reserved_1[12];
>>       u32 perf_clk_frequency;
>> -    u32 pad1[42];
>> -    /* Memory regions: 0x100 - 0x1FF */
>> +    u32 reserved_2[42];
>> +    /** Memory regions: 0x100 - 0x1FF */
>>       u64 ipc_header_area_start;
>>       u32 ipc_header_area_size;
>>       u64 shared_region_base;
>> @@ -234,41 +233,24 @@ struct vpu_boot_params {
>>       u32 global_aliased_pio_size;
>>       u32 autoconfig;
>>       struct vpu_boot_l2_cache_config 
>> cache_defaults[VPU_BOOT_L2_CACHE_CFG_NUM];
>> -    u64 global_memory_allocator_base;
>> -    u32 global_memory_allocator_size;
>> +    u32 reserved_3[3];
>>       /**
>>        * ShaveNN FW section VPU base address
>>        * On VPU2.7 HW this address must be within 2GB range starting 
>> from L2C_PAGE_TABLE base
>>        */
>>       u64 shave_nn_fw_base;
>> -    u64 save_restore_ret_address; /* stores the address of FW's 
>> restore entry point */
>> -    u32 pad2[43];
>> -    /* IRQ re-direct numbers: 0x200 - 0x2FF */
>> +    u64 save_restore_ret_address; /** stores the address of FW's 
>> restore entry point */
>> +    u32 reserved_4[43];
>> +    /** IRQ re-direct numbers: 0x200 - 0x2FF */
>>       s32 watchdog_irq_mss;
>>       s32 watchdog_irq_nce;
>> -    /* ARM -> VPU doorbell interrupt. ARM is notifying VPU of async 
>> command or compute job. */
>> +    /** ARM -> VPU doorbell interrupt. ARM is notifying VPU of async 
>> command or compute job. */
>>       u32 host_to_vpu_irq;
>> -    /* VPU -> ARM job done interrupt. VPU is notifying ARM of 
>> compute job completion. */
>> +    /** VPU -> ARM job done interrupt. VPU is notifying ARM of 
>> compute job completion. */
>>       u32 job_done_irq;
>> -    /* VPU -> ARM IRQ line to use to request MMU update. */
>> -    u32 mmu_update_request_irq;
>> -    /* ARM -> VPU IRQ line to use to notify of MMU update 
>> completion. */
>> -    u32 mmu_update_done_irq;
>> -    /* ARM -> VPU IRQ line to use to request power level change. */
>> -    u32 set_power_level_irq;
>> -    /* VPU -> ARM IRQ line to use to notify of power level change 
>> completion. */
>> -    u32 set_power_level_done_irq;
>> -    /* VPU -> ARM IRQ line to use to notify of VPU idle state change */
>> -    u32 set_vpu_idle_update_irq;
>> -    /* VPU -> ARM IRQ line to use to request counter reset. */
>> -    u32 metric_query_event_irq;
>> -    /* ARM -> VPU IRQ line to use to notify of counter reset 
>> completion. */
>> -    u32 metric_query_event_done_irq;
>> -    /* VPU -> ARM IRQ line to use to notify of preemption 
>> completion. */
>> -    u32 preemption_done_irq;
>> -    /* Padding. */
>> -    u32 pad3[52];
>> -    /* Silicon information: 0x300 - 0x3FF */
>> +    /** Padding. */
>> +    u32 reserved_5[60];
>> +    /** Silicon information: 0x300 - 0x3FF */
>>       u32 host_version_id;
>>       u32 si_stepping;
>>       u64 device_id;
>> @@ -294,7 +276,7 @@ struct vpu_boot_params {
>>       u32 crit_tracing_buff_size;
>>       u64 verbose_tracing_buff_addr;
>>       u32 verbose_tracing_buff_size;
>> -    u64 verbose_tracing_sw_component_mask; /* TO BE REMOVED */
>> +    u64 verbose_tracing_sw_component_mask; /** TO BE REMOVED */
>>       /**
>>        * Mask of destinations to which logging messages are 
>> delivered; bitwise OR
>>        * of values defined in vpu_trace_destination enum.
>> @@ -308,11 +290,7 @@ struct vpu_boot_params {
>>       /** Mask of trace message formats supported by the driver */
>>       u64 tracing_buff_message_format_mask;
>>       u64 trace_reserved_1[2];
>> -    /**
>> -     * Period at which the VPU reads the temp sensor values into 
>> MMIO, on
>> -     * platforms where that is necessary (in ms). 0 to disable reads.
>> -     */
>> -    u32 temp_sensor_period_ms;
>> +    u32 reserved_6;
>>       /** PLL ratio for efficient clock frequency */
>>       u32 pn_freq_pll_ratio;
>>       /**
>> @@ -347,11 +325,11 @@ struct vpu_boot_params {
>>        *       1: IPC message required to save state on D0i3 entry flow.
>>        */
>>       u32 d0i3_delayed_entry;
>> -    /* Time spent by VPU in D0i3 state */
>> +    /** Time spent by VPU in D0i3 state */
>>       u64 d0i3_residency_time_us;
>> -    /* Value of VPU perf counter at the time of entering D0i3 state 
>> . */
>> +    /** Value of VPU perf counter at the time of entering D0i3 state 
>> . */
>>       u64 d0i3_entry_vpu_ts;
>> -    /*
>> +    /**
>>        * The system time of the host operating system in microseconds.
>>        * E.g the number of microseconds since 1st of January 1970, or 
>> whatever
>>        * date the host operating system uses to maintain system time.
>> @@ -359,57 +337,52 @@ struct vpu_boot_params {
>>        * The KMD is required to update this value on every VPU reset.
>>        */
>>       u64 system_time_us;
>> -    u32 pad4[2];
>> -    /*
>> +    u32 reserved_7[2];
>> +    /**
>>        * The delta between device monotonic time and the current 
>> value of the
>>        * HW timestamp register, in ticks. Written by the firmware 
>> during boot.
>>        * Can be used by the KMD to calculate device time.
>>        */
>>       u64 device_time_delta_ticks;
>> -    u32 pad7[14];
>> -    /* Warm boot information: 0x400 - 0x43F */
>> -    u32 warm_boot_sections_count;
>> -    u32 warm_boot_start_address_reference;
>> -    u32 warm_boot_section_info_address_offset;
>> -    u32 pad5[13];
>> -    /* Power States transitions timestamps: 0x440 - 0x46F*/
>> -    struct {
>> -        /* VPU_IDLE -> VPU_ACTIVE transition initiated timestamp */
>> +    u32 reserved_8[30];
>> +    /** Power States transitions timestamps: 0x440 - 0x46F*/
>> +    struct power_states_timestamps {
>> +        /** VPU_IDLE -> VPU_ACTIVE transition initiated timestamp */
>>           u64 vpu_active_state_requested;
>> -        /* VPU_IDLE -> VPU_ACTIVE transition completed timestamp */
>> +        /** VPU_IDLE -> VPU_ACTIVE transition completed timestamp */
>>           u64 vpu_active_state_achieved;
>> -        /* VPU_ACTIVE -> VPU_IDLE transition initiated timestamp */
>> +        /** VPU_ACTIVE -> VPU_IDLE transition initiated timestamp */
>>           u64 vpu_idle_state_requested;
>> -        /* VPU_ACTIVE -> VPU_IDLE transition completed timestamp */
>> +        /** VPU_ACTIVE -> VPU_IDLE transition completed timestamp */
>>           u64 vpu_idle_state_achieved;
>> -        /* VPU_IDLE -> VPU_STANDBY transition initiated timestamp */
>> +        /** VPU_IDLE -> VPU_STANDBY transition initiated timestamp */
>>           u64 vpu_standby_state_requested;
>> -        /* VPU_IDLE -> VPU_STANDBY transition completed timestamp */
>> +        /** VPU_IDLE -> VPU_STANDBY transition completed timestamp */
>>           u64 vpu_standby_state_achieved;
>>       } power_states_timestamps;
>> -    /* VPU scheduling mode. Values defined by VPU_SCHEDULING_MODE_* 
>> macros. */
>> +    /** VPU scheduling mode. Values defined by VPU_SCHEDULING_MODE_* 
>> macros. */
>>       u32 vpu_scheduling_mode;
>> -    /* Present call period in milliseconds. */
>> +    /** Present call period in milliseconds. */
>>       u32 vpu_focus_present_timer_ms;
>> -    /* VPU ECC Signaling */
>> +    /** VPU ECC Signaling */
>>       u32 vpu_uses_ecc_mca_signal;
>> -    /* Values defined by POWER_PROFILE* macros */
>> +    /** Values defined by POWER_PROFILE* macros */
>>       u32 power_profile;
>> -    /* Microsecond value for DCT active cycle */
>> +    /** Microsecond value for DCT active cycle */
>>       u32 dct_active_us;
>> -    /* Microsecond value for DCT inactive cycle */
>> +    /** Microsecond value for DCT inactive cycle */
>>       u32 dct_inactive_us;
>> -    /* Unused/reserved: 0x488 - 0xFFF */
>> -    u32 pad6[734];
>> +    /** Unused/reserved: 0x488 - 0xFFF */
>> +    u32 reserved_9[734];
>>   };
>>   -/* Magic numbers set between host and vpu to detect corruption of 
>> tracing init */
>> +/** Magic numbers set between host and vpu to detect corruption of 
>> tracing init */
>>   #define VPU_TRACING_BUFFER_CANARY (0xCAFECAFE)
>>   -/* Tracing buffer message format definitions */
>> +/** Tracing buffer message format definitions */
>>   #define VPU_TRACING_FORMAT_STRING 0
>>   #define VPU_TRACING_FORMAT_MIPI      2
>> -/*
>> +/**
>>    * Header of the tracing buffer.
>>    * The below defined header will be stored at the beginning of
>>    * each allocated tracing buffer, followed by a series of 256b
>> @@ -421,53 +394,55 @@ struct vpu_tracing_buffer_header {
>>        * @see VPU_TRACING_BUFFER_CANARY
>>        */
>>       u32 host_canary_start;
>> -    /* offset from start of buffer for trace entries */
>> +    /** offset from start of buffer for trace entries */
>>       u32 read_index;
>> -    /* keeps track of wrapping on the reader side */
>> +    /** keeps track of wrapping on the reader side */
>>       u32 read_wrap_count;
>>       u32 pad_to_cache_line_size_0[13];
>> -    /* End of first cache line */
>> +    /** End of first cache line */
>>         /**
>>        * Magic number set by host to detect corruption
>>        * @see VPU_TRACING_BUFFER_CANARY
>>        */
>>       u32 vpu_canary_start;
>> -    /* offset from start of buffer from write start */
>> +    /** offset from start of buffer from write start */
>>       u32 write_index;
>> -    /* counter for buffer wrapping */
>> +    /** counter for buffer wrapping */
>>       u32 wrap_count;
>> -    /* legacy field - do not use */
>> +    /** legacy field - do not use */
>>       u32 reserved_0;
>>       /**
>> -     * Size of the log buffer include this header (@header_size) and 
>> space
>> -     * reserved for all messages. If @alignment` is greater that 0 
>> the @Size
>> -     * must be multiple of @Alignment.
>> +     * Size of the log buffer including this header (`header_size`) 
>> and space
>> +     * reserved for all messages. If `alignment` is greater than 0, 
>> the `size`
>> +     * must be a multiple of `alignment`.
>>        */
>>       u32 size;
>> -    /* Header version */
>> +    /** Header version */
>>       u16 header_version;
>> -    /* Header size */
>> +    /** Header size */
>>       u16 header_size;
>> -    /*
>> +    /**
>>        * Format of the messages in the trace buffer
>>        * 0 - null terminated string
>>        * 1 - size + null terminated string
>>        * 2 - MIPI-SysT encoding
>>        */
>>       u32 format;
>> -    /*
>> +    /**
>>        * Message alignment
>>        * 0 - messages are place 1 after another
>>        * n - every message starts and multiple on offset
>>        */
>> -    u32 alignment; /* 64, 128, 256 */
>> -    /* Name of the logging entity, i.e "LRT", "LNN", "SHV0", etc */
>> +    u32 alignment; /** 64, 128, 256 */
>> +    /** Name of the logging entity, i.e "LRT", "LNN", "SHV0", etc */
>>       char name[16];
>>       u32 pad_to_cache_line_size_1[4];
>> -    /* End of second cache line */
>> +    /** End of second cache line */
>>   };
>>     #pragma pack(pop)
>>     #endif
>> +
>> +///@}
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Pushed to drm-misc-next.

Best regards,
Maciej

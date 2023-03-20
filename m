Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599EA6C231F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340C510E66E;
	Mon, 20 Mar 2023 20:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B9710E34D;
 Mon, 20 Mar 2023 20:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3nyO5Vbw3FQWpqCfWVzBooNOAoq0HzMtPYbwO4DZFCuH2zCTLL5YLn3dn8+9zi/ymRYYotznhJsbbVy+BB389412vfk2R/kHQvl4INlvEZc9M0wfumdZD5heyg/GvwQgyhiGdq1F6aP/I9auCkCc9mzJWadPZltl62bVOcDHamMORuBENFAciDEGo6XGwUDfbOB9LqQZg666mz7aVU4jfAx8a+qrEf8HgI5Qqis2kgOH87HeIo/4ijelijQlOh72tq/huHCGqW1fxcOzrVchcT2PtGAVNQK2ym7+B3h2jAnJRVuz90ZGccoL7WPtnx72md5kF8S6EpuQyz24eAw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+AUF/ScGzmDBhpJZdN7u7tJlvWjoXfKIorqAdGN8Z0=;
 b=V6pA6a5fLK3L6RLmxp8pMO/QxzkMW0OGk6u5wmP4t58W5GkPvFb83Gg3Rz2d/4OGZBacN5W2JgL/mEUedWzeTGFlBCtCzebcqIXNtQ0U76V2d606d5ShLNObODOZxwpZo15fYa3de5X8G+xdrOabeIKh+6d6Kj0/8SMHsWjlVgkrwraUWFy6RFuL9Z4AeXfegIkMGLGU8ciBCemY9Y0s4TmuWe7sjC02/Yb3CQhdUO8i3RslRssdP5+3kx4oUAVWV1pUGTT05PHbUql+wkjma4WeZFJknI9B62cnmLlbxeafVODtUoOvJWaBxniiOlXMG6YcmeCjTP4r6IvolB6iFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+AUF/ScGzmDBhpJZdN7u7tJlvWjoXfKIorqAdGN8Z0=;
 b=tccbNoAS408uYXCQm2Z7rgReFtWkfkBc3lsg86an0R9ZV8nX76ieBusls/waBc8h4NHufTkDgeB8TqFcx2vsZKqZxgLDlZjaFUAUMOLw2liuawdVHyPvOQGZ01cU9YrFso0feimU2kipbIyHWIJwpmM5K9Uurh1QlPyISajllMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Mon, 20 Mar
 2023 20:47:25 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 20:47:21 +0000
Message-ID: <9c9b0d15-24c7-5c6d-c6c7-40347bcde7ee@amd.com>
Date: Mon, 20 Mar 2023 16:47:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 14/32] drm/amdgpu: expose debug api for mes
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-15-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-15-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0189.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::32) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: 379d752b-d5eb-465d-6587-08db29844d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ekswr2j+xIHL3x6ZFCtvEQRL3+ec+mG4L4jWNYXorET/9g5pYEL8wT8+HIUNN3GW3PihO3vfWV5NGWsfLE5MvdDY6EUg984QkxpvOTE/5S72fhyOfCADG9A2znBqhcZrd7nD+BdnmLfhMKr7tDkjKsHVLd19O3AwIUaBWsXVEb9jx0zwz60bVd5vTkNCtkOqpcxkNME7jUOg6tgeMrwTMxCPUIGQrcbLlDiTY7ciZdHJ9AQXfhREaVVvtTN1FYmx97pVcvEbIz74lOfFjmK1HTCFNA8/XTi+8yu3HrDp9T0og4om2NwptywuuCldQyxpVGhu+zAzURZ50OT7RKFaI1OdFLeWKrlrpx6+JlQ2DFiqEzTjm2jF+GchIQr6PcmqCmrUGU54tySRiG9S4i2lbYPpWPjPsWrNsomRZ4i3kZ52jca1CehRmyfQxHSwFofiQVuKTiFEw8rDYP1KWgjYSR/R3Iu+UpNVlYk485zH8WPpU1LRUnzC6c4JdubK9tojtTeIyKcBFy6nMAACp1FJhdfs6Pmh6k5EelofA1w60qmW8V5g7Q/NCWpZ7lcdN2Oitd8nrIls3eJVQXwPhA19gFwMWB2RCjlh5nWVTltXu3S8KLiDB76PQCaBUXgDm28+WjGFm71+7PB2rtm4X8sE4eLYv6icW3FT+Hb6+6f7/hkJTQ7zmmUeooqFaP8eQp2Inve8SxQwAQH3/OGeRugfK6gyzgGga4j5SQf+Os2bLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199018)(31686004)(31696002)(86362001)(8676002)(66556008)(66476007)(450100002)(41300700001)(44832011)(38100700002)(5660300002)(8936002)(66946007)(36916002)(26005)(6506007)(2906002)(6512007)(36756003)(316002)(6486002)(2616005)(186003)(53546011)(83380400001)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG5iNUgyaGFjS29ZYUI3czNCMUxWdDhTL0lwMW5JYVNYcUl5N3JrWnl5djU5?=
 =?utf-8?B?RVRyRlROb2J0dm9TNm90ZXR2QnhSMjhveGpjenREc3ZaY0d3S0Q0REdhd3Q2?=
 =?utf-8?B?Z1czYU5iclI4Y085SEZhRy9Kd1ZWOUZJZ1JpdmE1bXNOS01BcDhjY3hpYnJv?=
 =?utf-8?B?TTd2NWRKeS9KU3M1dkQ1YVpvVStsSG4rNk1NMHdMWEx4eHFHeHJGdHhYUjB5?=
 =?utf-8?B?WU96OEkxVFU3N3NYTFRKN3cweDEyODhRa3JmMzNwZkNRTnlqd1BhRXF1M09l?=
 =?utf-8?B?bmJEcVI2N1FQZEoxN29ldlkrYmdYbmxOKzhCRVovZTBBUzRSM0xzSjJ2Z2M4?=
 =?utf-8?B?K2dQMFdXYzd2K25OUTMwT3BCQysxUlZwOXZBdGtBNWxneEVYNkIxSU0wcno3?=
 =?utf-8?B?N3ZmNCt6Y2d3L2trbnFCVTQzRGd4NW5Ma0ZsOGo4Mi8xTUsveW5ocTRxQ1lB?=
 =?utf-8?B?Y0VmRFlmenZaaENnYzhLVTF5SG9xelA2WVNZOTV3Ty9Fdzk5OWdhU2VYY1B4?=
 =?utf-8?B?YmFONnNkTU9xdVhHcFBsY2ZLYXRyeVluK0xLZ2tvWWsxbktLQmFHM3FPWEMw?=
 =?utf-8?B?c01lNzFwRTMxbmEyK2UyN05OMXdKUnA2cWdseTZncHNIUjdxdjJ4bm56N3Bh?=
 =?utf-8?B?dGxQS1RCTDdEU0d2MVV3UE9Fejloamo5VENLY0tudVF6cVV6RDVVRXk5aG5s?=
 =?utf-8?B?ZFVlbGw2OHdZOFc2OGROMjV0bzR0RExYdVdWbkdIakpxRVFNLzVnd2t3dk9Q?=
 =?utf-8?B?dUJyWU9FcXd0Vk9Ic3FSdGNOMFVQVmlmbC8zK2kwREp3Nk1BNlZVRnVsVzNi?=
 =?utf-8?B?L2ZSblQzTXpsTHBZTVhZekhqUU40VWg4MG5TcGlSaSt5WEk1WkZacXNtYjJU?=
 =?utf-8?B?QWpES0dDSHlTUGhSc1lXbUZISUR4UDJ1ZFlvVXhrZzVKU1dLRmlXWVo2Qjdq?=
 =?utf-8?B?RngyMkUwVmhhT29JTStXcUV2Zk5RakZ2ZVNiTk9BQVBxc2xaU0psRG9peXNl?=
 =?utf-8?B?aUxYMkcvZDQ1NzhtTWtMRXl5QWQzeVhZN0l0NEhZZWdVc1VFZWc0aEJNRDRo?=
 =?utf-8?B?NXdZVXhBZllEZEkxaWxqK2pQM2JuQy9sSGlDYy9ubjdVRXRhT2xlc24wSkRX?=
 =?utf-8?B?QU16QVBGUnpUT2tVNlgzcTVEVXBLNTdDc3c2RW1aZU1FZEkyZjgxSyswM1A4?=
 =?utf-8?B?VWxNMXdDbjZkajlMRE1xS1BwMDhrWkw3NVZ6RGVWT3hsY2taK0RLOWkvMUhX?=
 =?utf-8?B?VWRydXpyb0x5cmliNzQ3SXJGWlJVSnE3UFRQam5TTTEzUTBleW1OWXJDQktS?=
 =?utf-8?B?R0Nia0NmeEN1S281QjB6UFNhSW1nSWI5Y1Ftbm5WNWZETmorSk9haS9RdGhY?=
 =?utf-8?B?SEMwd2JoWVlrZk9BLzEwWDZBQ0Z2djZ3a0k3QnV6RWFMNGxOS05CMHRNcm1r?=
 =?utf-8?B?SmtXWDdUN0g2cE5lQUI2Y2c4VFhPZHEwZU1jUkluWnMxdGUybkxsejlNbmR2?=
 =?utf-8?B?TDdQbnZtR1ZZQjBDTExpSENNUzk1TWxsVXRPWXhXQXlxYVh4bkdvNGNTYVRi?=
 =?utf-8?B?a2RHdUlXUS90SzVHMWdhUUMxSEZ5UzhZbXFDVDllWUJVaEQ0TS9FS2VVS09W?=
 =?utf-8?B?TUVRaTIrVmJ3TlZ4QTlISmhoa0tJSUl0NHNKaTBQeXRUQlozZEZXVDRBYm9G?=
 =?utf-8?B?cE5MY1V5UllMak0vaVlwR1gzLzRGSDI4Tk9qbDEvQ3NQZGc3ZVhCSWU0QURi?=
 =?utf-8?B?V041aXFPNHBORXZTZFhNS0xvV3pYQml0UXF3L3RiWWQ1UmwyVzFIL2FNTzhn?=
 =?utf-8?B?WFVSa0ducnJVaWlLb3A3UWN3dVcrTDh3YjkwY1JOdEh5OUc3TGNsT3Ivb29Z?=
 =?utf-8?B?Y3ZPYmxjNkRqT0psSU9VVjgxTG5mTGhXdXdFdTlGRVZEOC9zM2dRYkJLYk1D?=
 =?utf-8?B?RFB1UHd0OEVvVXF0ZFZMa0MvTUY4ZnUxaDM2STc2dWlWc0JXZFJldWgyYmFZ?=
 =?utf-8?B?aW95RXdMWHd6OGh4YmttTFdiVW8rTDRHaXRKVTRpQ2VXeDQzcExqbC9OeWJq?=
 =?utf-8?B?UUJETHpRRFlqNXVBUi9CaW5ISG9uSUdPUjZUK1lBLzc5VGlkaUs2Y1RhTTVJ?=
 =?utf-8?Q?5xj2qTGmNuPXpzibmfI2PgBiD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379d752b-d5eb-465d-6587-08db29844d0d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 20:47:21.0558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTpEzTfiFEBA9/iE/q26PLpcFl6B5/psmlJ8v3G+SAES0amdG4rwi4Kl3GoXRqXTjIwuA0OFo2PYez9gyfY+tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753
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

On 2023-01-25 14:53, Jonathan Kim wrote:
> Similar to the F32 HWS, the RS64 HWS for GFX11 now supports a multi-process
> debug API.
>
> The skip_process_ctx_clear ADD_QUEUE requirement is to prevent the MES
> from clearing the process context when the first queue is added to the
> scheduler in order to maintain debug mode settings during queue preemption
> and restore.  The MES clears the process context in this case due to an
> unresolved FW caching bug during normal mode operations.
> During debug mode, the KFD will hold a reference to the target process
> so the process context should never go stale and MES can afford to skip
> this requirement.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       | 32 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       | 20 ++++++++++++
>   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        | 12 +++++++
>   drivers/gpu/drm/amd/include/mes_v11_api_def.h | 21 +++++++++++-
>   4 files changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> index 82e27bd4f038..4916e0b0156f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -924,6 +924,38 @@ int amdgpu_mes_reg_wait(struct amdgpu_device *adev, uint32_t reg,
>   	return r;
>   }
>   
> +int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
> +				uint64_t process_context_addr,
> +				uint32_t spi_gdbg_per_vmid_cntl,
> +				const uint32_t *tcp_watch_cntl,
> +				uint32_t flags)
> +{
> +	struct mes_misc_op_input op_input = {0};
> +	int r;
> +
> +	if (!adev->mes.funcs->misc_op) {
> +		DRM_ERROR("mes set shader debugger is not supported!\n");
> +		return -EINVAL;
> +	}
> +
> +	op_input.op = MES_MISC_OP_SET_SHADER_DEBUGGER;
> +	op_input.set_shader_debugger.process_context_addr = process_context_addr;
> +	op_input.set_shader_debugger.flags.u32all = flags;
> +	op_input.set_shader_debugger.spi_gdbg_per_vmid_cntl = spi_gdbg_per_vmid_cntl;
> +	memcpy(op_input.set_shader_debugger.tcp_watch_cntl, tcp_watch_cntl,
> +			sizeof(op_input.set_shader_debugger.tcp_watch_cntl));
> +
> +	amdgpu_mes_lock(&adev->mes);
> +
> +	r = adev->mes.funcs->misc_op(&adev->mes, &op_input);
> +	if (r)
> +		DRM_ERROR("failed to set_shader_debugger\n");
> +
> +	amdgpu_mes_unlock(&adev->mes);
> +
> +	return r;
> +}
> +
>   static void
>   amdgpu_mes_ring_to_queue_props(struct amdgpu_device *adev,
>   			       struct amdgpu_ring *ring,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> index 547ec35691fa..d20df0cf0d88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> @@ -256,6 +256,7 @@ enum mes_misc_opcode {
>   	MES_MISC_OP_READ_REG,
>   	MES_MISC_OP_WRM_REG_WAIT,
>   	MES_MISC_OP_WRM_REG_WR_WAIT,
> +	MES_MISC_OP_SET_SHADER_DEBUGGER,
>   };
>   
>   struct mes_misc_op_input {
> @@ -278,6 +279,20 @@ struct mes_misc_op_input {
>   			uint32_t                   reg0;
>   			uint32_t                   reg1;
>   		} wrm_reg;
> +
> +		struct {
> +			uint64_t process_context_addr;
> +			union {
> +				struct {
> +					uint64_t single_memop : 1;
> +					uint64_t single_alu_op : 1;
> +					uint64_t reserved: 30;
> +				};
> +				uint32_t u32all;
> +			} flags;
> +			uint32_t spi_gdbg_per_vmid_cntl;
> +			uint32_t tcp_watch_cntl[4];
> +		} set_shader_debugger;
>   	};
>   };
>   
> @@ -340,6 +355,11 @@ int amdgpu_mes_reg_wait(struct amdgpu_device *adev, uint32_t reg,
>   int amdgpu_mes_reg_write_reg_wait(struct amdgpu_device *adev,
>   				  uint32_t reg0, uint32_t reg1,
>   				  uint32_t ref, uint32_t mask);
> +int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
> +				uint64_t process_context_addr,
> +				uint32_t spi_gdbg_per_vmid_cntl,
> +				const uint32_t *tcp_watch_cntl,
> +				uint32_t flags);
>   
>   int amdgpu_mes_add_ring(struct amdgpu_device *adev, int gang_id,
>   			int queue_type, int idx,
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> index 62cdd2113135..fbacdc42efac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> @@ -334,6 +334,18 @@ static int mes_v11_0_misc_op(struct amdgpu_mes *mes,
>   		misc_pkt.wait_reg_mem.reg_offset1 = input->wrm_reg.reg0;
>   		misc_pkt.wait_reg_mem.reg_offset2 = input->wrm_reg.reg1;
>   		break;
> +	case MES_MISC_OP_SET_SHADER_DEBUGGER:
> +		misc_pkt.opcode = MESAPI_MISC__SET_SHADER_DEBUGGER;
> +		misc_pkt.set_shader_debugger.process_context_addr =
> +				input->set_shader_debugger.process_context_addr;
> +		misc_pkt.set_shader_debugger.flags.u32all =
> +				input->set_shader_debugger.flags.u32all;
> +		misc_pkt.set_shader_debugger.spi_gdbg_per_vmid_cntl =
> +				input->set_shader_debugger.spi_gdbg_per_vmid_cntl;
> +		memcpy(misc_pkt.set_shader_debugger.tcp_watch_cntl,
> +				input->set_shader_debugger.tcp_watch_cntl,
> +				sizeof(misc_pkt.set_shader_debugger.tcp_watch_cntl));
> +		break;
>   	default:
>   		DRM_ERROR("unsupported misc op (%d) \n", input->op);
>   		return -EINVAL;
> diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
> index dc694cb246d9..f3c15f18ddb5 100644
> --- a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
> +++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
> @@ -274,7 +274,8 @@ union MESAPI__ADD_QUEUE {
>   			uint32_t is_kfd_process		: 1;
>   			uint32_t trap_en		: 1;
>   			uint32_t is_aql_queue		: 1;
> -			uint32_t reserved		: 20;
> +			uint32_t skip_process_ctx_clear : 1;
> +			uint32_t reserved		: 19;
>   		};
>   		struct MES_API_STATUS		api_status;
>   		uint64_t                        tma_addr;
> @@ -523,6 +524,7 @@ enum MESAPI_MISC_OPCODE {
>   	MESAPI_MISC__QUERY_STATUS,
>   	MESAPI_MISC__READ_REG,
>   	MESAPI_MISC__WAIT_REG_MEM,
> +	MESAPI_MISC__SET_SHADER_DEBUGGER,
>   	MESAPI_MISC__MAX,
>   };
>   
> @@ -561,6 +563,20 @@ struct QUERY_STATUS {
>   	uint32_t context_id;
>   };
>   
> +struct SET_SHADER_DEBUGGER {
> +	uint64_t process_context_addr;
> +	union {
> +		struct {
> +			uint32_t single_memop : 1;  /* SQ_DEBUG.single_memop */
> +			uint32_t single_alu_op : 1; /* SQ_DEBUG.single_alu_op */
> +			uint32_t reserved : 30;
> +		};
> +		uint32_t u32all;
> +	} flags;
> +	uint32_t spi_gdbg_per_vmid_cntl;
> +	uint32_t tcp_watch_cntl[4]; /* TCP_WATCHx_CNTL */
> +};
> +
>   union MESAPI__MISC {
>   	struct {
>   		union MES_API_HEADER	header;
> @@ -573,6 +589,9 @@ union MESAPI__MISC {
>   			struct		QUERY_STATUS query_status;
>   			struct		READ_REG read_reg;
>   			struct          WAIT_REG_MEM wait_reg_mem;
> +			struct		SET_SHADER_DEBUGGER set_shader_debugger;
> +			enum MES_AMD_PRIORITY_LEVEL queue_sch_level;
> +
>   			uint32_t	data[MISC_DATA_MAX_SIZE_IN_DWORDS];
>   		};
>   	};

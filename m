Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4F716EB8
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEE210E42B;
	Tue, 30 May 2023 20:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657E910E429;
 Tue, 30 May 2023 20:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gu2aIbXJkinmHtthg4zQ3tx86XjJ5lp9/KzYwY5dgiP6Ca4kUKyUTx+u5C6TMOL6iKZJJbRwnqymwx06xsZ5yYcyMjtGwpZdqCq6ebf+ewwYA/xL0V2sy5UeT/eJYsXArwaWwZyLTvjV/ifBXqQngjAxFnhm6WH9YFW49JmnIwJFQroAVmRIkHxJ6w3J6X0lqytJKCIOASHj0a/0kAJBcrZPBzvU7xPnnVfKKLwubnvwBRAn7CKdC9onLOX8NIBK+tJbdQNP/aY0M36M+s9LNDeIiucxV0StL2QU/ifIIHGz69uX+zEc/gYJVxuahxL6Z93ZjtF9OfXZfnsNb0dosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJSzSTaISehVkq1X7bi0p+52m5Nsnu0v/ARDnf5FV3o=;
 b=B0DuKWDOSN+SP7Ac/snAwN39G56PsMA6VBIb1jcQTHb4wWTwpZy1WdIJlDmh/q/c5gDDaEZihhwWQa6zOZa2P3QW6rcgJJAAgJqsSfq9D0BdSW3+FMpQFpLApuHSmeZTkACLfFEwAzQ83H1aFQV9+09vm6L+3R2vHX/fGCv2ipIIMTXUq9kX/Acpr1QtuXccDTXlM05FckjIEDe2AN9nS3rQOjW45fsvplH83tetBuz0cEpprQiAywX+tHyYsOEsG2PuWQnYAcUk1GCJHwCDE22EcXvIVKGjYUwGHNJIIm8XA7yeIilPwGB0J9YViqUobzBzWy+duxQVrsZtQptajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJSzSTaISehVkq1X7bi0p+52m5Nsnu0v/ARDnf5FV3o=;
 b=qzUXAlHhjMVC20b+oyLAk7wDHGt/m97TlbulTFw235gdo4J8U/s411KnsziI3jwbUXDOuB9Bcz/CoPPlShWlqLlzZ9fV57hxvepyar5/5PYagkqfax0RA6K2lhFpQL7z2cZuRlWAgYP8+SNa+TcNq1gVdHGCglIEVIDFnjvcPb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 20:31:57 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:31:57 +0000
Message-ID: <f1df4543-db1e-1460-1ae6-cf383cacd329@amd.com>
Date: Tue, 30 May 2023 16:31:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 32/33] drm/amdkfd: add debug device snapshot operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-32-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-32-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f991cc-30f4-413f-96dc-08db614ce9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZgghLnuwOAhHbMraDZepPIqAaozMXC/9SoUyl89bby0dCZ+B8an176aqnzQMufEw86T8VJ2rawqwEYuEJqSvZZ7bEV7BF4vTqcsKmrSanfQOcD2U5Boln1Jreunj58rydVtyTBE+qu2OPrizKbOxoquwZFh7ROU/MC15sppTkG0oGzYBburN0KhQ8iFmve8/YhD3bRFMjn7DsSiu7Dus6s1jIn/da62iW8DFJVYqC5nm0YrhMdxOd/IdeaX7Z8hUnWsfbZSAyJqgO3phbGgAaHbYfqFo0DvOS6z0QN741fVMQ4zCeMpoTG/PKuIRFfk1dcT0rpm5eNlApl/Hf7n6Nto+i5RO87l9SAd0CG/DgrQPJZAepWJD19IDEOTt1CeQfwa0eSNx2NVitrsWAD6Nb9C3zh7OFZZ4IZitmns00+QlQYE2Rv6Ozlw0QFuORu06zHW6zkAJPimAFru0O4TpnyVK8M+s7uCtpCtbw1COIRzEjGjGLBnqSRqvuxY40urGS0wSHxgOZT5lzas35YVbXjOeZlivjWkN5K0uOMoXQTq65OS5cgyakojrciXJxdPWca0bL0amDBDU6fNJK6vKei2WFzUm5KVIp7OoG+8ewxXMOSX/MAglYpfcBhmqqdDqSQFi5sunAk1KPIEyxou04Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(36756003)(478600001)(2906002)(8936002)(44832011)(5660300002)(8676002)(86362001)(31696002)(66556008)(66946007)(66476007)(4326008)(316002)(450100002)(38100700002)(41300700001)(2616005)(6506007)(6512007)(26005)(6486002)(186003)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUt5anl0SENDby9FYlRwY0VWZFBzVW5qMHU0KzdYRTVzMlBFS3FqeDlJZitk?=
 =?utf-8?B?ekFXRFM0SVBnNWZjazg4ZVJhV0UzVkdRanNPOEVrcUdxSDVVakFPMmlEQldY?=
 =?utf-8?B?SDBGS1ZFVGNyQjFQUU5QbVJhOWVkcUwyZHZCR3pXUnpHb0xIeWJ1eHFJZGNY?=
 =?utf-8?B?bUZjS2ZIN24yWEdoY1JYb3dhWU51Z0x4UlMyT2x2USt4MGRJbUtNUVpKdkpw?=
 =?utf-8?B?Z2lZZjYzZkk2NkRPSzFtK3dNYjlCbzlnRUZ6dE5LRFYxSnFWdTk0M3phTUxp?=
 =?utf-8?B?OENzSzUrckJDb2VWMWpmZnNnenZvTUo1dElqUTQ3RCt0cndrc3BvWTJvM0tU?=
 =?utf-8?B?bXBTTHpPRDlJamYvbFZjOWhrbzBRNzFLZ0taMDBDcmRucmowTEt3bTkzR1JU?=
 =?utf-8?B?WlFvSkl1UEh0a3VTTS8xTTBUMUJvWkVKcU15MkZzZlppWGcrbUZBSWZkRkgr?=
 =?utf-8?B?Zkc3Z3phcjNiajFhQVJiVHJYVllOY01ZcEFDUW9oNVVDL3NyVmNFalJhdU5N?=
 =?utf-8?B?L2JoeVEvSzR3eHBJREdZbEpNcHV2bm42TFpUWTdjTG5uZkhOa0cwMndiVzZG?=
 =?utf-8?B?Y052ZXFjZUIybnZGQ2krbDdrWVNpcGx6Y0RTY2I0TEF6ZWE4cWNHdExnNlRL?=
 =?utf-8?B?cFFXQUpqNVVHSjJ5MjRlWi92VGFXWWRoV2RLTTJibXNrcG9nNERRMW1obTFV?=
 =?utf-8?B?VFQ1cS81cnlQYk5yd1FrZmxuK0ljMkN5TGdhQjl3dG1HTHNKOE13NjdqUThI?=
 =?utf-8?B?VUtRZG5VdlZEcGVMdkl5Zi9LTDJGUDRpcGZGbzRtQWJJYTB6MWpzQkRsS3Yy?=
 =?utf-8?B?SzJRblZieTZYUVZobEJFWldRWWtQd0F6c0lDL1BpSjFyYTdhVzRFQUV5ZTR2?=
 =?utf-8?B?RHRPUlNqa1dTU2JVREJZb1hXbWh0dHhhK2dmUW15TkRhSi9GZGdaWGxTV2RY?=
 =?utf-8?B?WUpqazQxWGVrbWJmckNuN1Q4VVJpbFhDTTFKU3J4b3pnaTN3VHNKcGVDamxD?=
 =?utf-8?B?TW9hc0g2L2lHREZWV1djWU1RV3ZVczU4N3FZYzRTWkdHRm9talNFREtnYWlJ?=
 =?utf-8?B?aHhLZmY4NEFTT1JTM2wycnM4c2R1WmtYaVBFZ3JnTzg2aTNXQXU3QjFEcXc0?=
 =?utf-8?B?b0p4RWhqL0FkS2pGVEpWcEx5Vm5XTjNmR1JsakZ4RDB0NXpGUUtLNVBWWXV5?=
 =?utf-8?B?RldHd09EM0N4NlpKUTFXWmR2UktDRkN5QXYzQzdjYmIxa29DblBuRXFwWjdG?=
 =?utf-8?B?NWl1S05HNlVVdTdEakE1cHZ1ZnhVOSsrejlEYUNHVWpNTitiOVpCSkFGMDM3?=
 =?utf-8?B?UFR4UXowT3V0QkxuNzNGTW5RRitBZGE3OUdSbWtkMGNiM1h0MVhic3hDSitU?=
 =?utf-8?B?VmdNdmNSZVBkc28zSUhwbXVXVHlNbWpwZllWcHVJY3QzbStGM0RpaHMzS3RT?=
 =?utf-8?B?QkFodnpBN2lQTlRoLzZwdVMxTVozTUhlZHI4dGttbnRxRlNuaXZxNS8yTHBs?=
 =?utf-8?B?cjQ5R3R3YjRsK1VoQUFKVTFDaTZnUkJ1N3VZWDBZM2FQZ05PMlFndlNJdHEy?=
 =?utf-8?B?SG1vQUZJdWhlL05qT2FyeE16WUg5enoySWNDTDRBQlVZOUovTGpjMG9rN0tK?=
 =?utf-8?B?eG9ZK2hIcHBSRjAvY3dZaFQwMHNsTjlpRldKOGVMdzV0d3NLQWc2czBLRyts?=
 =?utf-8?B?Rzg5NlFVS1ZCVllHNWpkbVZ4MVFtSTlFaC9jYXpsSmRkVXNsbU5Ba1NHKzkz?=
 =?utf-8?B?QjNjOWFaRVcwQTdkcHhiRDdBdEQrdE50QXpoL2hjai9nQVlOWFVNb1lJVVRK?=
 =?utf-8?B?ai9kMlVpdGxTVERCTDJXb3N4YllzOEpvbVAxU296aHdmUGdvN1hrc3ljNnAz?=
 =?utf-8?B?SE42N3ljQlBwZDV4bitBMDJVQ05rNFltYkF5eHAveDRnUUova2QxWk9mazBI?=
 =?utf-8?B?MWV2TjhhRjVTM2VSR3RKQnlyYnB5QmM3WnBVOGVnbk1CckxIeGh0ZmdDMTNL?=
 =?utf-8?B?dDJxR2NJdDV0dXBIK3hONGl2V1gzd1o5RVNhM0NvT05TOE5QZXNtR1ZXeitj?=
 =?utf-8?B?aFpYYWNHaVNRbTd6U1F1TlJsTWZMVGppVnoyWnIvUkloQUVtL3lxWm9WRUky?=
 =?utf-8?Q?dSqPv5vOIaYg/Ot8jk/4X2Qha?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f991cc-30f4-413f-96dc-08db614ce9b0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:31:57.0679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sc01/L9ieN0CSIqWQ4VqLt7LiqiyzIjfcqmXL327AV1/LA6ijUfosfE3wTQ3Yd55EGSAGdIRI4AYt/U150ZVAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Similar to queue snapshot, return an array of device information using
> an entry_size check and return.
> Unlike queue snapshots, the debugger needs to pass to correct number of
> devices that exist.  If it fails to do so, the KFD will return the
> number of actual devices so that the debugger can make a subsequent
> successful call.
>
> v2: add num_xcc to device snapshot and fixup new kfd_node reference
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 73 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  5 ++
>   3 files changed, 83 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index b24a73fd53af..f522325b409b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3060,8 +3060,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				&args->queue_snapshot.entry_size);
>   		break;
>   	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
> -		pr_warn("Debug op %i not supported yet\n", args->op);
> -		r = -EACCES;
> +		r = kfd_dbg_trap_device_snapshot(target,
> +				args->device_snapshot.exception_mask,
> +				(void __user *)args->device_snapshot.snapshot_buf_ptr,
> +				&args->device_snapshot.num_devices,
> +				&args->device_snapshot.entry_size);
>   		break;
>   	default:
>   		pr_err("Invalid option: %i\n", args->op);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 24e2b285448a..125274445f43 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -22,6 +22,7 @@
>   
>   #include "kfd_debug.h"
>   #include "kfd_device_queue_manager.h"
> +#include "kfd_topology.h"
>   #include <linux/file.h>
>   #include <uapi/linux/kfd_ioctl.h>
>   
> @@ -1010,6 +1011,78 @@ int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
>   	return r;
>   }
>   
> +int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
> +		uint64_t exception_clear_mask,
> +		void __user *user_info,
> +		uint32_t *number_of_device_infos,
> +		uint32_t *entry_size)
> +{
> +	struct kfd_dbg_device_info_entry device_info;
> +	uint32_t tmp_entry_size = *entry_size, tmp_num_devices;
> +	int i, r = 0;
> +
> +	if (!(target && user_info && number_of_device_infos && entry_size))
> +		return -EINVAL;
> +
> +	tmp_num_devices = min_t(size_t, *number_of_device_infos, target->n_pdds);
> +	*number_of_device_infos = target->n_pdds;
> +	*entry_size = min_t(size_t, *entry_size, sizeof(device_info));
> +
> +	if (!tmp_num_devices)
> +		return 0;
> +
> +	memset(&device_info, 0, sizeof(device_info));
> +
> +	mutex_lock(&target->event_mutex);
> +
> +	/* Run over all pdd of the process */
> +	for (i = 0; i < tmp_num_devices; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +		struct kfd_topology_device *topo_dev = kfd_topology_device_by_id(pdd->dev->id);
> +
> +		device_info.gpu_id = pdd->dev->id;
> +		device_info.exception_status = pdd->exception_status;
> +		device_info.lds_base = pdd->lds_base;
> +		device_info.lds_limit = pdd->lds_limit;
> +		device_info.scratch_base = pdd->scratch_base;
> +		device_info.scratch_limit = pdd->scratch_limit;
> +		device_info.gpuvm_base = pdd->gpuvm_base;
> +		device_info.gpuvm_limit = pdd->gpuvm_limit;
> +		device_info.location_id = topo_dev->node_props.location_id;
> +		device_info.vendor_id = topo_dev->node_props.vendor_id;
> +		device_info.device_id = topo_dev->node_props.device_id;
> +		device_info.revision_id = pdd->dev->adev->pdev->revision;
> +		device_info.subsystem_vendor_id = pdd->dev->adev->pdev->subsystem_vendor;
> +		device_info.subsystem_device_id = pdd->dev->adev->pdev->subsystem_device;
> +		device_info.fw_version = pdd->dev->kfd->mec_fw_version;
> +		device_info.gfx_target_version =
> +			topo_dev->node_props.gfx_target_version;
> +		device_info.simd_count = topo_dev->node_props.simd_count;
> +		device_info.max_waves_per_simd =
> +			topo_dev->node_props.max_waves_per_simd;
> +		device_info.array_count = topo_dev->node_props.array_count;
> +		device_info.simd_arrays_per_engine =
> +			topo_dev->node_props.simd_arrays_per_engine;
> +		device_info.num_xcc = NUM_XCC(pdd->dev->xcc_mask);
> +		device_info.capability = topo_dev->node_props.capability;
> +		device_info.debug_prop = topo_dev->node_props.debug_prop;
> +
> +		if (exception_clear_mask)
> +			pdd->exception_status &= ~exception_clear_mask;
> +
> +		if (copy_to_user(user_info, &device_info, *entry_size)) {
> +			r = -EFAULT;
> +			break;
> +		}
> +
> +		user_info += tmp_entry_size;
> +	}
> +
> +	mutex_unlock(&target->event_mutex);
> +
> +	return r;
> +}
> +
>   void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   					uint64_t exception_set_mask)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 234e2ccafa87..a289e59ceb79 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -81,6 +81,11 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
>   }
>   
>   void debug_event_write_work_handler(struct work_struct *work);
> +int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
> +		uint64_t exception_clear_mask,
> +		void __user *user_info,
> +		uint32_t *number_of_device_infos,
> +		uint32_t *entry_size);
>   
>   void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   					uint64_t exception_set_mask);

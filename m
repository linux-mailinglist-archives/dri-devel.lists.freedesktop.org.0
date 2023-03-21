Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB76C2656
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 01:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035AC10E094;
	Tue, 21 Mar 2023 00:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6647510E094;
 Tue, 21 Mar 2023 00:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG7GrvppE2YYayugdUv7V7/zT4h95sGau+ByubhhC8IBeyAPXGjezp2OUmpXVsQdwX0lT5OgBXkWhyN1M9nYS/z/LmeAh71k70XDSO1QJ9/KKti0osnpMzgJAyGjPKs1dYZT341Bt7fQInSUopMMFuadQCUC20OEgkQ8Q5jgjSKIBnSlN41mvoYs+0vrctjmzAH2HjKYKKRhrTVnYMID4UXGdD4zRvIocJfF3sTuPUA09gsZHIzCq9IkIscYuxjrD1IxKkOqFqrRDnBqEMxSmSn3zrk7JHPtO6mk+psi7u+IlsvENUEJvuziDFvGoPHnH2RBvLss0KvW7E1vQ/91lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cwdBrlVE8hgEaZETGElKL2AJaaEIBjccjjaNlx64IY=;
 b=gQ2arX7ES2GdtehC5na7ikPr09A4KVNDIi4pJHnwpzEpThokOvaMT4u3TZI5n85qjBJkaM0E53FRAGoJJRNSTlvgqpj2it/bfu7fkARZsZW7MVGAgqxjXVwA06e8bhuXQp4Nx6pR1qt2dBKHnaYIhRMbHdPXnZESbWVvf4EBcv3cogvkP+i4N8bhI9kSJ/EhdTbLE4GxIy2L65Ur5VLW3Z2jQ0rGyd6vHcU7qb26N7+14tJ7Sz67TFB623i6zOC1uKturufnnJwhQ0AJcnToPNvyIz6Xp6YzLymq201caZZOCHp5VFuRbARArDnX8Ns9VLiTx2aFzwbWhcSNgpk+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cwdBrlVE8hgEaZETGElKL2AJaaEIBjccjjaNlx64IY=;
 b=HaQg3y59wnmtdfuPxOqtyw+NBzn6t5mR6VQmUGsMSLAOt6c31AmOmoxx4K7ykGLQimqqitAK0sQQMWPRWSXtGn9pc6zZInS/jKg/TLr1eO99UdOoIxPY8Fguxs+sJGzsgPH6kDiyLjX8b6qTQR7aGocg45LBeNDJ1+4EvFfhfPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 00:31:17 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 00:31:17 +0000
Message-ID: <8335d0d7-2945-979b-70b2-b5e800ce8fe0@amd.com>
Date: Mon, 20 Mar 2023 20:31:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 19/32] drm/amdkfd: add runtime enable operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-20-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-20-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: c82cf02a-b53e-4ec5-8160-08db29a3958f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiiI4kMacZAUxtZfCY6+dE1D30r75eX0xpXNjtyuEdBoG1sSU9oCDHgvT4kjE+B5/wp2dlMBsrab8K1mK0fyqA5RQr2Q7Bax8/y1nRdfRMAJPHQGOuJBRvBEuksfCe6RgUXWEq9WqByNuGzXPSt0wCkcXUZzO3yvqk6e8Aac/FSeTlLa68wKZTDDEEao1W+OYd4Df+BkxrBi481yB8yTYfQBY/25medwzo9YK15DJkxV/aqrMLn9A2QTTlOoHHF4LFk1PV74x1IIUYc7DxWMLLqOPWw1M9cRC5qf0zVseto83PYW8jbXvruERT8bz5Zc+uyHLKU3VYl2gJuHaYwR/yj/V8FIJO4NpFjHqaDFiIPEyAcrRIy9yOhYfxbeiKG2Zlbnj78KKrFw07kn44GCQg26DG6yHrClb3i8GjIfAigDn5Udwdim0sxW7t+lwau1Sq3sYzmv+Vto5BMVYA6QKqG0UTOdaIZ7PAq+GtHRDQNWk/Ggp5cy48ZtHE6GZfevwXJaF4StQBij+W6/y4IqOff5ewvQHctSxS8V8paBwk1xu56jvUC6+FkEHvnv7oCG44tYb/z9qeZrcZvspbZBd2M5lYmL4yyzA7FyQzl6IuWKdWI2W9qQ9Oy41rEY2bHy8q+NPy1P/WJ7SqWuhy5L2o/qrgkXO9drgTPb7MyzCvHzHbNjjblfa6IkcEpXj2aDtArO+8ZALni+1G5Uj7KrhrUy0KrEuavMnWZCxOsJ9Ef4cCdQtQKymC4AFtD5mxukB3Tx6Ywue54w/lMhik6kOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199018)(8936002)(44832011)(30864003)(5660300002)(41300700001)(86362001)(36756003)(31696002)(38100700002)(2906002)(6486002)(83380400001)(478600001)(36916002)(186003)(2616005)(316002)(6666004)(26005)(31686004)(6506007)(6512007)(53546011)(8676002)(66946007)(66476007)(66556008)(450100002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym5wRVVKQjNYUi92LzBzMFNPTUQ2UDdsM2dqSWY0dDhqMFlZYWw5MnJzaDdW?=
 =?utf-8?B?NHJVTnVOUW4xc3FrcmNVdGVHRHI1bHV0SkNTbnNTMHFMUzJxNm02aEdzRVZa?=
 =?utf-8?B?ek43Z25RZnVZNGJocGE2TmNPUVFKYVdheSszbUhHWXZVZGExcC9NcldrU1pV?=
 =?utf-8?B?aGdUUVpzL1dGclhvM0RmU2FHc3g1UUtWOXJHQmRaOExkWmUzcVBFQjB2WkV5?=
 =?utf-8?B?TDJyRTJLVFZnSXMxSThwWkpwZ2lZL01McTBQcmFQNkxjTm1XRUFFdm5PQ3Vn?=
 =?utf-8?B?MmhqZ3c5YW5mdC9pdDR5NWhoS1lCTHRWeTVzczhhNUlpWmJhbGJianVmalpK?=
 =?utf-8?B?SjRDM0YzUWxzUXNtaFlKVzZVUnFkeXFoOFkycG51cVpnTUtmT3Irb1R3TlBu?=
 =?utf-8?B?UjluczdCbGpTMTFsSFlLc00raFlQNnBjSnpENllsRWJreGF5alM0NGNDMDY3?=
 =?utf-8?B?UG1BREhhUFJJcU5TVFZTWC9TSmVwOXB6TWdYbkpLUWI4dmdQRmgwUXd6Nktn?=
 =?utf-8?B?bDJUSWRTMEVycmljUVFoMDBUakxEUnNKOGxjOEpjZDJwSDdKWitJcDNLZ09W?=
 =?utf-8?B?OGVIckR2RmNqVG9kMUhqZk5MdjQ0VGdNeWIyeVRidG5VVDVoY3NlWk5NYXpM?=
 =?utf-8?B?cWRvNVJFRzBJQU0xaUxxL2oraXZqMDBQeXR3MEszSGtJbkE2NE1XWGppNDA2?=
 =?utf-8?B?aWpQczV5N1pRQjJMOUZQdUJNL3dXb3h5MUxSS0tPdzdmOEt5SnBlVDZUTU1y?=
 =?utf-8?B?TDBPalZwRVVlUDVLV3ZFbHNEc292ZXJjY202aEEzMTVYbzVIdHVOVFRNSlZ2?=
 =?utf-8?B?Z0pKVVZPdjN3NU1hUnBHME1ud1ROMXIwSjhGK1Z4RWFmUExFVFFyVTFQZEth?=
 =?utf-8?B?VjV1K2xlQzNNMkdyTFpZWlcxc3ZGWHNVTVJuRElSOEJjYmsyVFZ1SG91T2l3?=
 =?utf-8?B?cUNRcFh4L0lIS2lhQnEvSXBONFlnOEVHTnVXRG9aRE5XazVLOFgvTEN6ME5B?=
 =?utf-8?B?UWhNNUo2UGVjMXlvdzhGK0FOVjZjU2xZYmpibTJFbzBFN2tBV0U3dFNQbUFV?=
 =?utf-8?B?eWJWdWNmOEhFR2tFSXZHSFZhRHRVZVZPZVpQUjFWWDBzZEhiOWJpQi80aDdN?=
 =?utf-8?B?L0ZpMlpEMU00NDF0SkpTdGVLeFdpeWdEWGE5VzcwY01OdXZvQklJNGFPblZK?=
 =?utf-8?B?SzZMaVBMS2RUSzg2cXZwS1AwVFZDL1ZuaFVyWkJQb3B5bmFGRi9jZExFTWdS?=
 =?utf-8?B?cnNDYTRtbWVQSUJWaC85eUhTQ1E1a3VXcDRwb2RLU0pycCtZUnBkcGJ3QnhC?=
 =?utf-8?B?N2V1QVEvMlU4OHJHN3JTZGpLWjZCelNQajBWN0JUNHQrRmlXSkluVG1XZC80?=
 =?utf-8?B?WWwyWi9EVnd2NU5OODlvZlhmQXkyd215UU91VzBFdmdHM2lZbjlxeEZ0UXpz?=
 =?utf-8?B?ZEtGcXFtL05BZHVzaTR3cjVHVFRjM1IwU1pWQ3R6dGlCbjd0aGJFQTdEcWFS?=
 =?utf-8?B?ZnhUcEN0K2N6V3lBeUZoT2JhcUVtU0dKcVN1UGZSRm5ZeW5zYWYwd2g4aTIy?=
 =?utf-8?B?Nm40TW1iWU1oMzVKZmVIbTQ4MzVab3hXKzRIcnY2c0c2WXVlMXFtRVd1K0tH?=
 =?utf-8?B?bjR4NFJNZjJtV0dINWZ3ODhTYks2WVIzWE9JQ21wWlZwMlB3WHcybThKZldP?=
 =?utf-8?B?SXpPRVF0SVlTM2JoY3AwODM4em9DbVFmUzdjbHJkV1hqaXdHb2piaDd2cWQx?=
 =?utf-8?B?RDZhSUJoVytVdGVhV2hhYVhodURuMVB3MTZxaWNvOVArVytZbFd0ZVQ2WlBU?=
 =?utf-8?B?MGxyUmpWVE9qTkd6T3pSOXdhTlBtZzREYnJxQ0ZWN1ZvNlVWQ0NXeUo0T3Bq?=
 =?utf-8?B?NWIzUEp6c0hJU1EzOTQ1WXRGOEhnQzh4Z1A5Nmt5Y2dLdUVKWUN3RmFvdW5K?=
 =?utf-8?B?ekVtc0pncDNlMlNxa2I0TVFhQXcxdlhiZ1hTMGFXV3lGcWQ3WVhLWlRYeHFk?=
 =?utf-8?B?blUvbkNMTHkvVW1zZklXaElFZVpPWVY2NlhYRnZQZlZ6Sk9xOE9QLzc5aEpq?=
 =?utf-8?B?a0lxY0I2STl6S01FdjR0RzU5SVJNL1Bvd2xPNUpydnRVS044UGYwWDNmUUdV?=
 =?utf-8?Q?EG4s8DoKu05ya7bmfj3a1L8xO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82cf02a-b53e-4ec5-8160-08db29a3958f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 00:31:17.0393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xTivvkKiCKGspsnDsGOIUuAlv5iPPHwSDZ2UuvQAI+PufebX+NLhgrJuLvpt4wDpMHpd93yozQrrOefkFB4LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801
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
> The debugger can attach to a process prior to HSA enablement (i.e.
> inferior is spawned by the debugger and attached to immediately before
> target process has been enabled for HSA dispatches) or it
> can attach to a running target that is already HSA enabled.  Either
> way, the debugger needs to know the enablement status to know when
> it can inspect queues.
>
> For the scenario where the debugger spawns the target process,
> it will have to wait for ROCr's runtime enable request from the target.
> The runtime enable request will be able to see that its process has been
> debug attached.  ROCr raises an EC_PROCESS_RUNTIME signal to the
> debugger then blocks the target process while waiting the debugger's
> response. Once the debugger has received the runtime signal, it will
> unblock the target process.
>
> For the scenario where the debugger attaches to a running target
> process, ROCr will set the target process' runtime status as enabled so
> that on an attach request, the debugger will be able to see this
> status and will continue with debug enablement as normal.
>
> A secondary requirement is to conditionally enable the trap tempories only
> if the user requests it (env var HSA_ENABLE_DEBUG=1) or if the debugger
> attaches with HSA runtime enabled.  This is because setting up the trap
> temporaries incurs a performance overhead that is unacceptable for
> microbench performance in normal mode for certain customers.
>
> In the scenario where the debugger spawns the target process, when ROCr
> detects that the debugger has attached during the runtime enable
> request, it will enable the trap temporaries before it blocks the target
> process while waiting for the debugger to respond.
>
> In the scenario where the debugger attaches to a running target process,
> it will enable to trap temporaries itself.
>
> Finally, there is an additional restriction that is required to be
> enforced with runtime enable and HW debug mode setting. The debugger must
> first ensure that HW debug mode has been enabled before permitting HW debug
> mode operations.
>
> With single process debug devices, allowing the debugger to set debug
> HW modes prior to trap activation means that debug HW mode setting can
> occur before the KFD has reserved the debug VMID (0xf) from the hardware
> scheduler's VMID allocation resource pool.  This can result in the
> hardware scheduler assigning VMID 0xf to a non-debugged process and
> having that process inherit debug HW mode settings intended for the
> debugged target process instead, which is both incorrect and potentially
> fatal for normal mode operation.
>
> With multi process debug devices, allowing the debugger to set debug
> HW modes prior to trap activation means that non-debugged processes
> migrating to a new VMID could inherit unintended debug settings.
>
> All debug operations that touch HW settings must require trap activation
> where trap activation is triggered by both debug attach and runtime
> enablement (target has KFD opened and is ready to dispatch work).
>
> v2: fix up hierarchy of semantics in description.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 150 ++++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   |   6 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   4 +
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   1 +
>   4 files changed, 157 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 09fe8576dc8c..46f9d453dc5e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2654,11 +2654,147 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
>   	return ret;
>   }
>   
> -static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
> +static int runtime_enable(struct kfd_process *p, uint64_t r_debug,
> +			bool enable_ttmp_setup)
>   {
> +	int i = 0, ret = 0;
> +
> +	if (p->is_runtime_retry)
> +		goto retry;
> +
> +	if (p->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_DISABLED)
> +		return -EBUSY;
> +
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +
> +		if (pdd->qpd.queue_count)
> +			return -EEXIST;
> +	}
> +
> +	p->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_ENABLED;
> +	p->runtime_info.r_debug = r_debug;
> +	p->runtime_info.ttmp_setup = enable_ttmp_setup;
> +
> +	if (p->runtime_info.ttmp_setup) {
> +		for (i = 0; i < p->n_pdds; i++) {
> +			struct kfd_process_device *pdd = p->pdds[i];
> +
> +			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev)) {
> +				amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +				pdd->dev->kfd2kgd->enable_debug_trap(
> +						pdd->dev->adev,
> +						true,
> +						pdd->dev->vm_info.last_vmid_kfd);
> +			}
> +
> +			if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {

Should this be else-if? It seems weird that enable_debug_trap could be 
called twice in a row. If RLC restore is only applicable on 
single-process debug devices, then maybe put the per-VMID case first.


> +				pdd->spi_dbg_override = pdd->dev->kfd2kgd->enable_debug_trap(
> +						pdd->dev->adev,
> +						false,
> +						pdd->dev->vm_info.last_vmid_kfd);
> +
> +				if (!pdd->dev->shared_resources.enable_mes)
> +					debug_refresh_runlist(pdd->dev->dqm);
> +				else
> +					kfd_dbg_set_mes_debug_mode(pdd);

Do we really need to update the runlist here? When the runtime gets 
enabled, there are no queues yet for the process. So there should be no 
change to the runlist until the process creates its first queue.


> +			}
> +		}
> +	}
> +
> +retry:
> +	if (p->debug_trap_enabled) {
> +		if (!p->is_runtime_retry) {
> +			kfd_dbg_trap_activate(p);
> +			kfd_dbg_ev_raise(KFD_EC_MASK(EC_PROCESS_RUNTIME),
> +					p, NULL, 0, false, NULL, 0);
> +		}
> +
> +		mutex_unlock(&p->mutex);
> +		ret = down_interruptible(&p->runtime_enable_sema);
> +		mutex_lock(&p->mutex);
> +
> +		p->is_runtime_retry = !!ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int runtime_disable(struct kfd_process *p)
> +{
> +	int i = 0, ret;
> +	bool was_enabled = p->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED;
> +
> +	p->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_DISABLED;
> +	p->runtime_info.r_debug = 0;
> +
> +	if (p->debug_trap_enabled) {
> +		if (was_enabled)
> +			kfd_dbg_trap_deactivate(p, false, 0);

Does this call kfd_dbg_trap_deactivate multiple times on retry? Is that 
a problem?

Regards,
   Felix


> +
> +		if (!p->is_runtime_retry)
> +			kfd_dbg_ev_raise(KFD_EC_MASK(EC_PROCESS_RUNTIME),
> +					p, NULL, 0, false, NULL, 0);
> +
> +		mutex_unlock(&p->mutex);
> +		ret = down_interruptible(&p->runtime_enable_sema);
> +		mutex_lock(&p->mutex);
> +
> +		p->is_runtime_retry = !!ret;
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (was_enabled && p->runtime_info.ttmp_setup) {
> +		for (i = 0; i < p->n_pdds; i++) {
> +			struct kfd_process_device *pdd = p->pdds[i];
> +
> +			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev))
> +				amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +		}
> +	}
> +
> +	p->runtime_info.ttmp_setup = false;
> +
> +	/* disable DISPATCH_PTR save */
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +
> +		if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
> +			pdd->spi_dbg_override =
> +					pdd->dev->kfd2kgd->disable_debug_trap(
> +					pdd->dev->adev,
> +					false,
> +					pdd->dev->vm_info.last_vmid_kfd);
> +
> +			if (!pdd->dev->shared_resources.enable_mes)
> +				debug_refresh_runlist(pdd->dev->dqm);
> +			else
> +				kfd_dbg_set_mes_debug_mode(pdd);
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> +static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
> +{
> +	struct kfd_ioctl_runtime_enable_args *args = data;
> +	int r;
> +
> +	mutex_lock(&p->mutex);
> +
> +	if (args->mode_mask & KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK)
> +		r = runtime_enable(p, args->r_debug,
> +				!!(args->mode_mask & KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK));
> +	else
> +		r = runtime_disable(p);
> +
> +	mutex_unlock(&p->mutex);
> +
> +	return r;
> +}
> +
>   static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
>   {
>   	struct kfd_ioctl_dbg_trap_args *args = data;
> @@ -2720,6 +2856,18 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		goto unlock_out;
>   	}
>   
> +	if (target->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_ENABLED &&
> +			(args->op == KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE ||
> +			 args->op == KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE ||
> +			 args->op == KFD_IOC_DBG_TRAP_SUSPEND_QUEUES ||
> +			 args->op == KFD_IOC_DBG_TRAP_RESUME_QUEUES ||
> +			 args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ||
> +			 args->op == KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH ||
> +			 args->op == KFD_IOC_DBG_TRAP_SET_FLAGS)) {
> +		r = -EPERM;
> +		goto unlock_out;
> +	}
> +
>   	switch (args->op) {
>   	case KFD_IOC_DBG_TRAP_ENABLE:
>   		if (target != p)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 4174b479ea6f..47f8425a0db3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -220,7 +220,7 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
>   	return r;
>   }
>   
> -static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
> +int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>   {
>   	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
>   	uint32_t flags = pdd->process->dbg_flags;
> @@ -240,7 +240,7 @@ static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>    *				to unwind
>    *		else: ignored
>    */
> -static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
> +void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
>   {
>   	int i, count = 0;
>   
> @@ -311,7 +311,7 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
>   	return 0;
>   }
>   
> -static int kfd_dbg_trap_activate(struct kfd_process *target)
> +int kfd_dbg_trap_activate(struct kfd_process *target)
>   {
>   	int i, r = 0, unwind_count = 0;
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index fefb9dc5cf69..22707f7a2368 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -28,6 +28,8 @@
>   void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
>   					uint32_t vmid,
>   					bool stall);
> +void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
> +int kfd_dbg_trap_activate(struct kfd_process *target);
>   bool kfd_dbg_ev_raise(uint64_t event_mask,
>   			struct kfd_process *process, struct kfd_dev *dev,
>   			unsigned int source_id, bool use_worker,
> @@ -80,4 +82,6 @@ static inline bool kfd_dbg_has_gws_support(struct kfd_dev *dev)
>   	/* Assume debugging and cooperative launch supported otherwise. */
>   	return true;
>   }
> +
> +int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd);
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 4cb433a21e3d..63c59ad2a4ca 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -946,6 +946,7 @@ struct kfd_process {
>   
>   	/* Tracks runtime enable status */
>   	struct semaphore runtime_enable_sema;
> +	bool is_runtime_retry;
>   	struct kfd_runtime_info runtime_info;
>   
>   };

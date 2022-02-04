Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7538A4A92BE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 04:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5765610E9A7;
	Fri,  4 Feb 2022 03:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE0310E9A7;
 Fri,  4 Feb 2022 03:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLADyBlDcovzWluJ5pYz9vgjNN9rpVPlQZ5U3IlSTUs/B+vEFrN0ACsuXCq6NYYMQwUttg4L2jD5gpRrwvL33/bXc9Zrcsb2AhJ5p50dgHsDleHOSEbifdGDMOw918R80d9tT7dQjE70faQbYe5ocWlDN3fLVDYw7ioWOM1sk25meqFVvJkxEltiKXOWzXdFersXGkL3J03MbEAsMaKHNaImAtPJp1DQQQd8vkpWkr3yD/xbDoDKBfTgsKCzhh0oZulCPoyKx4tZUekzaMpYeN6U4dQE+V5d56hBjh6UaiNYeCAmoJcUTMlZe4IrtZsmMKH8ant3DGB5aPBtQczZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACXGZznfAaX2R5Mhsj9Jt3xgUkx94geDANpr2iqvTKY=;
 b=LdhpgHOXKqKKdHR0gS0f0QggZqZQ1zjztF8elYGBvvbF9lBuIRdinQbEw0vTIeGd5Txc73hbcCq9gDZqBoLzpxYLIcsCzo8W2xovMohcJt/sB5Zs13ae1gP159RgRi95LhxdayOW6wr/3Kbp+gHEbWeSUnoIMaPuqSC4VJqLrDzJnJnF7n0u8Z/UfidSPXpI98MpDdZ3UpR0Pnudnu7JQM6FnYT/H7IrsyvcZD0XuB5SY84coDDSpzApZYm+z6NpOnW0aG/NCaDHa1dtnd9RhuGGx1t23Iq/veTZJQKimDD1vuvST4yPwGkZ6LY2pqDjn+4Vt77KDD0zes/d81Q60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACXGZznfAaX2R5Mhsj9Jt3xgUkx94geDANpr2iqvTKY=;
 b=AafUrKG+xAdiwBNmUYPANZouDMoaBZcY5649eoZS6iFC3pMskSLXArN4R7U3VfCl29B+QxiKtIWCyqAX/ATawCaSoEQjQ2rdKKqkAvqaGTDXerF97pBeRHtxWSIlABnIIrtYGshf/tYXTy8Z9bRXxmQMzVC9on6D/waCCdNKYvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY4PR1201MB0200.namprd12.prod.outlook.com (2603:10b6:910:1d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 03:22:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%8]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 03:22:13 +0000
Message-ID: <03ef2993-5972-c71c-c63f-51bea16cf90e@amd.com>
Date: Thu, 3 Feb 2022 22:22:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Patch v5 00/24] CHECKPOINT RESTORE WITH ROCm
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b20e947a-5afe-4a2b-6808-08d9e78d8924
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0200:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0200520AC14F0C1F1A7A086F92299@CY4PR1201MB0200.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G/kF032LXyWZbZPTnXESAlcqgzZHHcJDGTmApFAP6OfiO2VMSJY9gZ/AkCJbMgLjezOsCiFRDD9mtZ68is7TC64kFWKgMC1r01vF1jtLV/CHV3i+OOEd5gsVuPVAiH9SscmHS5VjmYwDFdqYQZlyI0ATZMZXMoBVy1Jun6H664mwgQxVi4cQ7gsiOLInWadTz9uVdEAd0qNCD7hRDx8PTGw7b+di+H+3sQ9ZoukQymI7vlCyhG407GzqGHeS0qjIq0FAOdfRE92erilaESKwgYL04kQomWH/yO35WJfSP88cq3qk2bwgVPQtsM/l+rqo/S8tslqWK/dbvcD60WRBQmxH8LkH7IJEmEWJQegQXz2O1UYDd9TNM7Ry+t64m10frPiR29cHQuI+gXOmZ+gixXCmKbhv2v5E6rjiiLXY71RT9A9calnJAmcFCj7R1PF96wZTPAZ3QvBsGbplxt6poPdAUuIPVoL2EczfPfTNtgxlRiqrpsjQsT768Azn9FIpTUntOxWGOHZ4hqR36/EnQZMIM9pN4GBY2735jCxIZcUl09IxOnUqpn0VGdv5lHc1hH7QXiQSxC5gKM2ZJcXUSDWh5FPRayQ0jfR5XF+tSZIsKj5t+sOjj918Q2s2VifGj8qF6e+zbWeQH8EU4XFVUooe3EcUTymyxgmOseclnzGtPy8+A7c/7/9C+6mbUTBJvQBfvI9H8YYYD4RnEitACfohUNbhResaYIOZSsSiOaiwj7qaUgTjLgKQdvV4Ql+BeCEOqZ1YxrB8PazQpb5fjFe7PMQAnJeNcTcg8eNLxgF6tVRoKNL1VNlO7N3M0LQNa1CixJ89aRC9xJ4jtBoexA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(6512007)(316002)(66476007)(44832011)(36756003)(8936002)(6506007)(2906002)(450100002)(2616005)(66946007)(4326008)(8676002)(66556008)(83380400001)(508600001)(31696002)(186003)(966005)(38100700002)(26005)(6486002)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGVUZ2h3T3hVQXFQNGd1KzM4TWQvQ2R4NVFaeU80aU5GZGR5RnFQWHJUWEIx?=
 =?utf-8?B?ZCsvK2F5c25JeERUZWUzQmNhZVM0eTJHOXpyM2tRVzhla3pKRE13TmNpMU4z?=
 =?utf-8?B?WVdHOGFOVm5lMFNVVStzbTBmQ241Znh2TlFraGVvWjVrT3NKd0JZZWhFc1VK?=
 =?utf-8?B?cWM1MmxDdGkzZzVWVWxIM0d6bkNFTWEyYWVJbEdIZnpHanh0VkZ0cC9vR1dG?=
 =?utf-8?B?YkVVTktzQ0pEc0hzSmhPNUh6RTZkVnVkQlhYbU9LT3RFMk52WFZkUlBQL0Na?=
 =?utf-8?B?VEE3VmE2MjdMZVV2QlF3NGZleEdmemVIRUQwdkZEQWxxY3dpdmVJakg0SzVj?=
 =?utf-8?B?UTZjb2FSL3ZKTTlJNkhXSVh5dkNqYTk0TisxM0JFZEZlc2lZQzg2T1lwSm5m?=
 =?utf-8?B?OTRxeXB3UlJ5TU1EQXNoS0lpamhrS2F3cTJGWENXNHlCQjFBeExlazhPbFo0?=
 =?utf-8?B?ejdtRXpDU3FlMWlXcmxiejQrOUZ6dkxBNGY3aWlNNjN4SmFmN21RTW5ZWUd1?=
 =?utf-8?B?U290dENCaXgzcWJVd2pUQU0ySWlLWWdwK3NsYXlHZW5oM0ZsZGtxMDkyZk5C?=
 =?utf-8?B?OUJWQU1zYnZCTURNWnVTWlkzcU05Yzl6cG8wMDVCbXlod1NRV05ndTRQdWM0?=
 =?utf-8?B?a2JZak1NVHNodGZrbm5FMEkza1FJbDhiZEl3bXRqblB6RnQvaXpPVmI0QW81?=
 =?utf-8?B?NDlCZ2doV1VmWG1Uc2NwOFFVOTVyM1kyUDAwa1BNa1FZYVFRK3d1U1Fpb2dO?=
 =?utf-8?B?WlBUWHdzQ3RpdmVKYXhKYmNESlFQemJLS3JVTWxJeTZKeklRWUJxMFo0MHFJ?=
 =?utf-8?B?c3pQU2E4NEJVV0huNWJRaVNKWTNqcnZjRlJaNTYwdzZxalRYcE5qeGt0SjBu?=
 =?utf-8?B?eHZkV0d5SldLcmpNRVBiY25ndG5qQkNOWTczUUlvZ284Y3hGclF0SmNtZUMx?=
 =?utf-8?B?ODArVERpelpVZEFxMnNkbXFYSzk5Zkk0UGcrczFkN2ZQNTUrKzFxc0drSjYr?=
 =?utf-8?B?bjBKR0VPM0g5NWwwbmwvR0R5SHltczJjcXJOTWI3NDNUU1FzUDdRYlV5ek1Q?=
 =?utf-8?B?UWhBUjhmazVJRGszbkZ4N29reWZrS1EzYm5lcVh5ZHhuc3c1cFl5OFMveWxK?=
 =?utf-8?B?QzZaMWdoUS94cHlLbHR5WHhTMjRnZHRnQnZzenNUUlFHTTdhQUdBRkhoRGNn?=
 =?utf-8?B?NmlLWVA3NjJUdElhNnY2WDhvYVk4Ris4Sys4U0NFVFdWNkd3N2IwaG9ueklC?=
 =?utf-8?B?NGJXYXdhdktVdlV3bkU4UngxdWpWRFVSa0FCdXh3QzF3eWN2b2I5blMwd0ZR?=
 =?utf-8?B?ZHV1WWdQMG1Idk04UTRaZnY2Z044Um5aVHRRb3Q3Nkl4Z3owNnZTTzM1RTE5?=
 =?utf-8?B?RGZzYzdsclBmUm80QzlCanRkeDhtcWtoeUUzSi9HNndXUmUyMXdOS0YwdU1U?=
 =?utf-8?B?RkE5UXZ5clo1MTRUVDZrcVR1ZmI1K2VpeW5FR1VsTmtPckNiRUdNQW5kZUJL?=
 =?utf-8?B?NGR0cldYSUdkMVArRk04OE9sOE1aYUZXNS9ibFBIVi9tYUpUUk01anFQOXZr?=
 =?utf-8?B?U2R4bm5CU2I5N2R0M0pPcDJBWitVUkxsYzFML1ZtdmpCOWxoTTlaTHA3c3dy?=
 =?utf-8?B?czZOd0FCY09oSnRza0w3UjVIMXdnR2FKWFQ3VlNiWWM1alpJeXVtUzFZQlR0?=
 =?utf-8?B?WFlMOWt0REVadDdidjA3ZGNrSlNJQTRheVBlM2F4Wm9tL0QxczhJeHJuQUs0?=
 =?utf-8?B?eFdWbXNYN0hBOFZPOC9uZVMzUTU1azRCZ1lKdFZGb1Bxa1hCbHdvU3BGNkEz?=
 =?utf-8?B?VTkrb2RxZUFSVVFEQ0tvYk14R3RqUUhVa3BKd1F2VEF0QXRGRkhyQUpsSjRr?=
 =?utf-8?B?dWJ3c0lUY1ErRW5DZjVRZE9yUndNTnFPL0lPcHNFdGd6eGxnQWc0L001Wk9R?=
 =?utf-8?B?MytBSExBOWZ4WlhYT0FVdzNoMjg2QWd1MHhXc0tGU0RxQ25iVkxwYitDMWdY?=
 =?utf-8?B?Mjk0d2QyL0FHNk5wZXpkMkxVUS9pcEV4VVdLTFlLRzdCUXo3emZaOUNQTVo4?=
 =?utf-8?B?cmdNY2dIUEtZdUpyNGZhb1ZtOEtHclFVcGtEWUREb3g2US9aUGtORyswdTNm?=
 =?utf-8?B?ekRWRUk0dHhJYUpsWUQwOUU0KzUzL2EyU1J1K280cGRWTTFPcjh2elNDZWdE?=
 =?utf-8?Q?WLGdLKe/R1PDGQM9F/0aEKg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20e947a-5afe-4a2b-6808-08d9e78d8924
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 03:22:13.0029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KRBihg+dq1mtp8Hhf+NO1JWi539g2T5Z7YU8XIv5UdlFFNpZAOKe6BMVFxs2nxUSJyYzo1CupA+/T+/LJOonQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0200
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
Cc: alexander.deucher@amd.com, david.yatsin@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


Am 2022-02-03 um 04:08 schrieb Rajneesh Bhardwaj:
> V5: Proposed IOCTL APIs for CRIU with consolidated feedback
>
> CRIU is a user space tool which is very popular for container live
> migration in datacentres. It can checkpoint a running application, save
> its complete state, memory contents and all system resources to images
> on disk which can be migrated to another m achine and restored later.
> More information on CRIU can be found at https://criu.org/Main_Page
>
> CRIU currently does not support Checkpoint / Restore with applications
> that have devices files open so it cannot perform checkpoint and restore
> on GPU devices which are very complex and have their own VRAM managed
> privately. CRIU, however can support external devices by using a plugin
> architecture. We feel that we are getting close to finalizing our IOCTL
> APIs which were again changed since V3 for an improved modular design.
>
> Our changes to CRIU user space  are can be obtained from here:
> https://github.com/RadeonOpenCompute/criu/tree/amdgpu_rfc-211222
>
> We have tested the following scenarios:
>   - Checkpoint / Restore of a Pytorch (BERT) workload
>   - kfdtests with queues and events
>   - Gfx9 and Gfx10 based multi GPU test systems
>   - On baremetal and inside a docker container
>   - Restoring on a different system
>
> V1: Initial
> V2: Addressed review comments
> V3: Rebased on latest amd-staging-drm-next (5.15 based)
> v4: New API design and basic support for SVM, however there is an
> outstanding issue with SVM restore which is currently under debug and
> hopefully that won't impact the ioctl APIs as SVMs are treated as
> private data hidden from user space like queues and events with the new
> approch.
> V5: Fix the SVM related issues and finalize the APIs.
>
> David Yat Sin (9):
>    drm/amdkfd: CRIU Implement KFD unpause operation
>    drm/amdkfd: CRIU add queues support
>    drm/amdkfd: CRIU restore queue ids
>    drm/amdkfd: CRIU restore sdma id for queues
>    drm/amdkfd: CRIU restore queue doorbell id
>    drm/amdkfd: CRIU checkpoint and restore queue mqds
>    drm/amdkfd: CRIU checkpoint and restore queue control stack
>    drm/amdkfd: CRIU checkpoint and restore events
>    drm/amdkfd: CRIU implement gpu_id remapping
>
> Rajneesh Bhardwaj (15):
>    x86/configs: CRIU update debug rock defconfig
>    drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
>    drm/amdkfd: CRIU Implement KFD process_info ioctl
>    drm/amdkfd: CRIU Implement KFD checkpoint ioctl
>    drm/amdkfd: CRIU Implement KFD restore ioctl
>    drm/amdkfd: CRIU Implement KFD resume ioctl
>    drm/amdkfd: CRIU export BOs as prime dmabuf objects
>    drm/amdkfd: CRIU checkpoint and restore xnack mode
>    drm/amdkfd: CRIU allow external mm for svm ranges
>    drm/amdkfd: use user_gpu_id for svm ranges
>    drm/amdkfd: CRIU Discover svm ranges
>    drm/amdkfd: CRIU Save Shared Virtual Memory ranges
>    drm/amdkfd: CRIU prepare for svm resume
>    drm/amdkfd: CRIU resume shared virtual memory ranges
>    drm/amdkfd: Bump up KFD API version for CRIU
>
>   arch/x86/configs/rock-dbg_defconfig           |   53 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    7 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   64 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   20 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |    2 +
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 1471 ++++++++++++++---
>   drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |    2 +-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c |  185 ++-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |   16 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  313 +++-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   14 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |   75 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |   77 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |   92 ++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |   84 +
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  160 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   72 +-
>   .../amd/amdkfd/kfd_process_queue_manager.c    |  372 ++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  331 +++-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |   39 +
>   include/uapi/linux/kfd_ioctl.h                |   84 +-
>   21 files changed, 3193 insertions(+), 340 deletions(-)
>

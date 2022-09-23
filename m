Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1187E5E7D2D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C77F10E762;
	Fri, 23 Sep 2022 14:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2075.outbound.protection.outlook.com [40.107.96.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323E910E74C;
 Fri, 23 Sep 2022 14:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDHKSEXsrJF9+Ym5vgvklGkYgZCtEnXmKUBUSaWsKtaK5gwgMBpNT9eXHKvTf6spdcwHDHVcqrNh0zRfBids8ZSitHfFAktgmrAWSH6prvcz/svtldScSdJoFnwomQc0ZQbEgBXzJboqIF2v8oJW/ez9D73eiopIXJ3XnZ7BMnygPOninTAMDb4u3SBr5suf4NteoXJucyZm+07UTBkF3jWHHNB/3Ujep0RIPw0AH6O/X0XCIQCksVldXdK8zEwPHChnUB1sD6JZjQAbd1GoXajQMCJjufdq2HrNUH0kzHOXY/ukZ1X75TlWmKWRTwr7ldqakSa0vxzs7u2cIGAfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m7hCElYBBbJsmqMujHhWAeo5EUqghvoUamSXiXE1m8=;
 b=U9v5plzjWeL7G68GW0iJF1QWuxs3egtJrY7lgQr1BmAeLGQtPsHdIZ1yujQg9WR/w9NVk2InQ59JDA30BYwujUx03WzVmTxlgMfynO/ErBogww7zX5xvaE8z28QIp9EbtTuHR9yChH93JMvM0dFuyEp5IARz91tAsld6dQXcCD6u/qt/GH20hYiqaBqlwhRrN3+2yynin3JPRCLCyzJKbClSJdcYMLTK/Qj0ooL+RHxmwV9qYxGwh+P1nhDz9YOCT3m23on5CQFu04C/SDcFCqzhfoyO6Tdja6OGLGGxmquPesvjWZmwVGtmMJLWANgJQWG61h1qa9OhvdWX6vqFsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m7hCElYBBbJsmqMujHhWAeo5EUqghvoUamSXiXE1m8=;
 b=KDHJo64StvUTT9ytQFVOmwHTvGGf5X8xCWmkRPtI6PsnhgxG5g2oXRfoaw0JoKWeHq0a9+qCVu73QjOuvkWLZ31J7/OPk4GHdNjHCxg3mpgzF/z70neqMFIrRf09IBcv4PbzTqGehuJ/770+CsfNPfaLBtUoUTaKFk5Sj8oHBFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7237.namprd12.prod.outlook.com (2603:10b6:303:22a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 14:33:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 14:33:56 +0000
Message-ID: <b21aa2e6-1b47-cdc1-307c-21fb331d4afb@amd.com>
Date: Fri, 23 Sep 2022 16:33:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC][PATCH] drm/amd/display: Restore DC_FP_* wrapper in dml/calcs
Content-Language: en-US
To: Daniel Gomez <daniel@qtec.com>
References: <20220923141725.436141-1-daniel@qtec.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220923141725.436141-1-daniel@qtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e740be8-fe0b-486c-4621-08da9d70a50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OeAl++aPWBp2M6/RAHs3JwANk7tM9Soy1OHPRB6MboimK3QZ8/4VxPvpHbZmXKUtzWZzP8mNSsbpYpG3naQHtwusbrwhrUt+juKPLE3dhrP2ZEpsSNjJZjCasV6WBOiMuNbmu10EoD/KGrQrQVQjEYn0B7XKRKjE70c5W1gh01yn8rDDhGydMBsM2MLnhhUCsVXufaVjPENTt7I4CR8tmcu5OtiGwLcIUiC1Jek4fCli9MX1cEabaWVwLtxq/x80eIkzjYVxdaADo6kZt/XKd0kvdfeMyzw2S1pjHRCNKbNd89O79reuU8Z5rCbQscUb+h2DsEkTH3Id3RBoegquzMSCssYmpza9oqW+yruwHAypM+layZPZGimYDxz+aJX0EffRwbM6+ZfYwDLqDeZ7EXKOqON1HKnf8/Hak7p7b3KZou0q30p11CiuX6loy3OVFVvcBDXltFjsWaC+HNjxcyT1n29869e2ShJdBOWUHvuWDU6Hl0e0mGce/KsqGVJ2amSeTIktzNpllix7Ev2X8mn16rFQ4dVL/vCejDWsNcqAhTOur5YuwU205+jKuyqrz82UIDizvzOburJNqoSFiPkpb022+T1PZVve/WMWFN+i0f5ORoVqoP+ynfZ/eZmcLvfFilqALb5Y1SJDEixiRsal4lCM/dKZ+xzHJUOD2Nz8d8PTFU4gl9j+5nKn8sURKk6X1YblYxaO1yVXkeIM90KQvYPL2cXraP4YUIHK46olQQmwgJdewEj7iYpRqUeZE9uy4nrlblT3MdApiDHgIfZao7L0DgazNVx7E5noyZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199015)(6506007)(66476007)(6666004)(66556008)(66946007)(86362001)(8676002)(4326008)(41300700001)(31696002)(8936002)(6512007)(6486002)(316002)(36756003)(6916009)(478600001)(186003)(2906002)(2616005)(83380400001)(38100700002)(7416002)(5660300002)(54906003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmV4MWVISlB0cUNxTTJqa05YMDBOOUJ5MmNLK1IzejExOHl3WmZ5TTNrVnM3?=
 =?utf-8?B?VXBiaFVybnF0L2VhMXBZMTdHcmpzSGxGc3hmR3JyQ3dHeUJURno1V01nVnU2?=
 =?utf-8?B?Nlc4cGdpdE9MSFhMS1FrZ0k0NXovZ1FtcDJpcTVtcWxINy9wQ0JqRjMwR25n?=
 =?utf-8?B?Vk1OSkxrbmZ6TDRnQ2JkZ0tIRnN4c0xFTjRWL0NIM1VXaGFOTFJLeUVIRE50?=
 =?utf-8?B?SU1uK21yRGZnOS9vUEtuRSs3Uk1HWktLck8ySE5NWFZ6VGRSRXErT3hBT3Nt?=
 =?utf-8?B?T2pwdVpsQkRoK2M1QkM3TW1aM3RXaEo3VnQ0SStOd2NtWXJQSURuZy9Td1Jy?=
 =?utf-8?B?MCtOdjlGNFpoVGhqY1pGYmVvcTB4Q2hiYU5SeHg1ZXBZNld3Y2kwc0RwMk5i?=
 =?utf-8?B?UE94WVZKS2o2MjJJbGwzdnVDMkU2c3drcVJNOGR2NERuK2xEUDJWdUdYbkZn?=
 =?utf-8?B?Y1BoMEtpaFlZSVQ1OEczdDdra01aZFNGc0h6cVZ6dkRoRVRBbi96bjVJYVZm?=
 =?utf-8?B?U2xvelBuMjZyamhiZWZ0Mk9hZmg2ak9KNXZiWjRxSWtudFhVQVI1eUU4SFI1?=
 =?utf-8?B?MUxqVU4zS3N3MFVhSEIrbnRveUU3N0VZZVFHOFkzbGplUDRsSFdGVHJiZnRy?=
 =?utf-8?B?UUtsZ0Z1NGljdHUyOThBRzNzeWp6V1E0Sy9LRlhDSHY1KzNIcTFZMWZRRExv?=
 =?utf-8?B?dDRObFIvWTN5Sm1kUHdvbk1GYXJSVnd5bWcreHVKdEJUd2N3d1lENWxJM3lM?=
 =?utf-8?B?QStKTlVpYmkwc1dvYjcrZzR3QzM5T1Y0SzVhM2ZWaXFZQjQ2NVJqTnY1Y2xh?=
 =?utf-8?B?UENHTTRRM2FpdzdyNmlLZkN5aVJRY2o3SDUzckRmNnUwODB4a3duczcxSnhz?=
 =?utf-8?B?cTJnZi9lcXVTTzk5UTNLS3diNDVLTHR3WXF0VEtZOS9IWExkVjYrUG4zRFdh?=
 =?utf-8?B?bXoyMDFrV0FNSER4NmNoYzdWd0pBMTVKTHBuTmttWW9KZDcrRFJKWWRSZ0hz?=
 =?utf-8?B?aTlkUkowQ1NxODR1cXIyYXFJQmZac2Uyc09KbFp1MXFkYWZPRTF0VmlqRjdN?=
 =?utf-8?B?aS9qdERZQ1V4Znlod2VGTURydlRsNXo3UndhRERqeHFiK2hvUkg0UVU4TE1m?=
 =?utf-8?B?NmFqeU5aUmxTR0hEdU1rdEM1c0pwQjY2enQ4Nm8zalNxTXV4T05NV2xwSGJF?=
 =?utf-8?B?ZzlrRHNWenBIVzVyenY3WXNWZzlWTlRQbHp5bk93RmFPTjVqY0R3ZGwwdTlP?=
 =?utf-8?B?NVZ5empsWGdWa25XUlFBSGRZcnZsSXRFcnlDTURRblhXNUROQlZYYVRnbERX?=
 =?utf-8?B?WFo3N1dCMlQ5REZleGNWb1FtbWM2MEdQTmdUQzdGUGpXRmJ6T1dXQmNXN2dV?=
 =?utf-8?B?THZtMlRrUWk1cGx4QlhKOWFuT1BiTWNwL3FRLytZOUU0UUMzNUgzL3NmY2xK?=
 =?utf-8?B?NzRVRkJrdXdndy8yNlFxY2hpdG9vdGVYRzI1YkF2WmdEYkQzcHM3aGUxV2hl?=
 =?utf-8?B?a2dmdHJOaGZTOEFaTWZ4U1ljZVk4OWdsajV0OHlqTldac3Rab3pVRVNDTG5N?=
 =?utf-8?B?RmI5ZzEzYzEzOG5CT3RLR1RlckJoQU5qZmgzWnBlOHlwTng0WTlISXFnMkNn?=
 =?utf-8?B?WVBwRXdzWXZZa2RVQldOZ3VPNlhGeDFVZmNFb0hEN3kxMktXa3Z3NGZZR2xN?=
 =?utf-8?B?d25INkptbkwrSy9EV1MxWjF0Mkc0cnFwM3pWNmN4Zmk3ZUs2M0tpSm1TVTA3?=
 =?utf-8?B?aTdlS2JRKzNEa1pBa1FNYTh4N0VObnNHajFUTUlEVXdEWUNpb3NCSTFmZVg3?=
 =?utf-8?B?TVVvcmZveUFGYk4yWVB3NGxJTWh3R0lDSDIydW5ZUzRlS2l2N0U3dURrY2l6?=
 =?utf-8?B?MU93bCs0cDM0ajYvR0J6S3ZGZ2xwU1Q3NS80UnJFTEh3cDRVQUZlTzM4NmFS?=
 =?utf-8?B?MlRkNUFVSUFVV3pXbDBDYVd6NmlaOVJxWGlnU2grbG5KZjZsbjlNUDRIVE9T?=
 =?utf-8?B?ZDYzaVhITVZzdFdLQVBaWHRTL2NpWFZnak1FSTlJNVJTV3VLY3Bwa0NtQzNq?=
 =?utf-8?B?bmtjbUNHQkVVVS9YRmNCNWJydmh6S25VVWRaa09zWThyQXVSdzZrQVRkWmNo?=
 =?utf-8?B?MEM4STZCMGV2SUk0Nk1UZlBYeEsrbUw4UmpURjlLZjJwV09nZ1dnZGxSaVJM?=
 =?utf-8?Q?BF/R5Q/bmxNE8J2uCgJ1ehHqtUF2F0uM09E78zgnuL92?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e740be8-fe0b-486c-4621-08da9d70a50f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 14:33:55.9517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIQSC+OcKJ5Ym86sBYKcOqZBXdkVV/pJowv4pfOyqEox5e1uCrJV/pIbudJe2JTd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7237
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Becle Lee <becle.lee@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dagmcr@gmail.com, Alex Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.09.22 um 16:17 schrieb Daniel Gomez:
> Commit [1] removes DC_FP_* wrappers from dml. However, this generates
> the BUG [2] on the amdgpu driver. Restore DC_FP_* wrappers in dml/calcs
> but only for the functions dcn_bw_update_from_pplib and
> dcn_bw_notify_pplib_of_wm_ranges.

That's a really bad idea. The wrappers must be *outside* of the code 
file which uses floating point code.

The code should probably just be re-aranged to not try to lock the mutex 
inside the critical section.

Regards,
Christian.

>
> [1] 9696679bf7ac40a8fb6a488a75bd66d4414cd3c3 drm/amd/display: remove
> DC_FP_* wrapper from dml folder
>
> [2] BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:283
>
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>
> Hi,
>
> The patch [1] introduces BUG [2] since linux 5.18. The reason seems to be
> wrapping entirely the functions dcn_bw_update_from_pplib and
> dcn_bw_notify_pplib_of_wm_ranges in the dcn10.
>
> On dcn_bw_update_from_pplib function the problem seems to be the
> dm_pp_get_clock_levels_by_type_with_voltage call.
>
> Any suggestions on what should we do here?
>
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 227, name: systemd-udevd
> preempt_count: 1, expected: 0
> CPU: 4 PID: 227 Comm: systemd-udevd Not tainted 6.0.0-rc6-qtec-standard #2
> Hardware name: Qtechnology A/S QT5222/QT5221, BIOS v1.0.1 06/07/2021
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x33/0x42
>   __might_resched.cold.172+0xa5/0xb3
>   mutex_lock+0x1a/0x40
>   amdgpu_dpm_get_clock_by_type_with_voltage+0x38/0x70 [amdgpu]
>   dm_pp_get_clock_levels_by_type_with_voltage+0x64/0xa0 [amdgpu]
>   dcn_bw_update_from_pplib+0x70/0x340 [amdgpu]
>   dcn10_create_resource_pool+0x8c8/0xd20 [amdgpu]
>   ? __kmalloc+0x1c7/0x4a0
>   dc_create_resource_pool+0xe7/0x190 [amdgpu]
>   dc_create+0x212/0x5d0 [amdgpu]
>   amdgpu_dm_init+0x246/0x370 [amdgpu]
>   ? schedule_hrtimeout_range_clock+0x93/0x120
>   ? phm_wait_for_register_unequal.part.1+0x4a/0x80 [amdgpu]
>   dm_hw_init+0xe/0x20 [amdgpu]
>   amdgpu_device_init.cold.56+0x1324/0x1653 [amdgpu]
>   ? pci_bus_read_config_word+0x43/0x80
>   amdgpu_driver_load_kms+0x15/0x120 [amdgpu]
>   amdgpu_pci_probe+0x116/0x320 [amdgpu]
>   pci_device_probe+0x97/0x110
>   really_probe+0xdd/0x340
>   __driver_probe_device+0x80/0x170
>   driver_probe_device+0x1f/0x90
>   __driver_attach+0xdc/0x180
>   ? __device_attach_driver+0x100/0x100
>   ? __device_attach_driver+0x100/0x100
>   bus_for_each_dev+0x74/0xc0
>   bus_add_driver+0x19e/0x210
>   ? kset_find_obj+0x30/0xa0
>   ? 0xffffffffa0a5b000
>   driver_register+0x6b/0xc0
>   ? 0xffffffffa0a5b000
>   do_one_initcall+0x4a/0x1f0
>   ? __vunmap+0x28e/0x2f0
>   ? __cond_resched+0x15/0x30
>   ? kmem_cache_alloc_trace+0x3d/0x440
>   do_init_module+0x4a/0x1e0
>   load_module+0x1cba/0x1e10
>   ? __do_sys_finit_module+0xb7/0x120
>   __do_sys_finit_module+0xb7/0x120
>   do_syscall_64+0x3c/0x80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7ff2b5f5422d
> Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 ab 0e 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffc44ab28e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 0000555c566a9240 RCX: 00007ff2b5f5422d
> RDX: 0000000000000000 RSI: 00007ff2b60bb353 RDI: 0000000000000019
> RBP: 00007ff2b60bb353 R08: 0000000000000000 R09: 0000555c566a9240
> R10: 0000000000000019 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000020000 R14: 0000000000000000 R15: 0000000000000000
>   </TASK>
>
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c |  2 --
>   drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 10 ++++++++++
>   2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index 174eebbe8b4f..a6ef20b43f3a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -1505,7 +1505,6 @@ static bool dcn10_resource_construct(
>   			&& pool->base.pp_smu->rv_funcs.set_pme_wa_enable != NULL)
>   		dc->debug.az_endpoint_mute_only = false;
>
> -	DC_FP_START();
>   	if (!dc->debug.disable_pplib_clock_request)
>   		dcn_bw_update_from_pplib(dc);
>   	dcn_bw_sync_calcs_and_dml(dc);
> @@ -1513,7 +1512,6 @@ static bool dcn10_resource_construct(
>   		dc->res_pool = &pool->base;
>   		dcn_bw_notify_pplib_of_wm_ranges(dc);
>   	}
> -	DC_FP_END();
>
>   	{
>   		struct irq_service_init_data init_data;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> index db3b16b77034..a3c71d875adb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> @@ -1490,6 +1490,8 @@ void dcn_bw_update_from_pplib(struct dc *dc)
>   	res = dm_pp_get_clock_levels_by_type_with_voltage(
>   			ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);
>
> +	DC_FP_START();
> +
>   	if (res)
>   		res = verify_clock_values(&fclks);
>
> @@ -1519,9 +1521,13 @@ void dcn_bw_update_from_pplib(struct dc *dc)
>   	} else
>   		BREAK_TO_DEBUGGER();
>
> +	DC_FP_END();
> +
>   	res = dm_pp_get_clock_levels_by_type_with_voltage(
>   			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);
>
> +	DC_FP_START();
> +
>   	if (res)
>   		res = verify_clock_values(&dcfclks);
>
> @@ -1532,6 +1538,8 @@ void dcn_bw_update_from_pplib(struct dc *dc)
>   		dc->dcn_soc->dcfclkv_max0p9 = dcfclks.data[dcfclks.num_levels - 1].clocks_in_khz / 1000.0;
>   	} else
>   		BREAK_TO_DEBUGGER();
> +
> +	DC_FP_END();
>   }
>
>   void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
> @@ -1546,9 +1554,11 @@ void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
>   	if (!pp || !pp->set_wm_ranges)
>   		return;
>
> +	DC_FP_START();
>   	min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
>   	min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
>   	socclk_khz = dc->dcn_soc->socclk * 1000;
> +	DC_FP_END();
>
>   	/* Now notify PPLib/SMU about which Watermarks sets they should select
>   	 * depending on DPM state they are in. And update BW MGR GFX Engine and
> --
> 2.35.1
>


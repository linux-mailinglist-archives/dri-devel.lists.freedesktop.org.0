Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAADD4C6934
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F8210E39A;
	Mon, 28 Feb 2022 10:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A45710E39A;
 Mon, 28 Feb 2022 10:59:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNWPULWW/hb07qF9zLtTbvPWutqkjyEtDVRMjEBCn+grJpY30aPDc55rg0/Y7V+3oGgLJRq/f2ICb8KcUM35UF045kw7a0PFwjtQ2WvKJilYpNmtfIEuqIr3HCdddlVRI/GvVoM1eW30JlkoSMzTM83uYXm+bZogj+jZ55AISoS4RwSCsNjT1iQCVRLOgzFglPFIiC5oeiWcWlqNEkucCAT6AvMN10H/ZN5H08ILlCbR+SEr+cInAmGrpfBfSxN3clpc+4eH7nJxF7yS/QshlrpSP1VgcPMrEC9CLo2cjAqri9NIv7+9x7z0jv5P6K2AJBlncwPQpmTOJ6+kx+jT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVM1eibO2uIdJPjNKDfek0LAcwEuvYV+Qt/29NkdGgA=;
 b=id0P8iP19UGQSfi4RFcEMMYl4WGat+A/pyWBAHSB4caBBhw+7ZIMSUF1c2YKjHLbG8bhz+mU4WkrFk2gix1iY6uzz5MkzoPHTqIWXzW2HGfVPEtCR8eHJtY4BdSFkocehO+Wr907SVtANF3rDzeRJKDCPwcOd+dDneljsurbSFivwK3VCkF+l5ufIez6msjNvltky4DchlHbYFopksNbXoX+UxkrhUbK9dS4IvONRWromGNgCNc4cU5oftSKhNl1KIvpncakv/kGQs0RPOlCsRShi/+saOiXc7rP04rdZPBCIdtnTC74iPV++UGZ+qiH+haJnzaZY5Peg440cgy2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVM1eibO2uIdJPjNKDfek0LAcwEuvYV+Qt/29NkdGgA=;
 b=ezBE74qFtgp2IJevVcqII49UkHv/dM27THDIYreNv5lm8RjFdu7T++nk/kCT4HkxdlJEgiuKckgZ+4yS+j3ScEvGXSQRKYcwhDLy6+COemednNYG1byjqLIwbRp6IGMzz3t4S4jpVIc8sgpN6bknAqpK66va7RNNP57EyV3rbVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2508.namprd12.prod.outlook.com (2603:10b6:907:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 10:59:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 10:59:03 +0000
Message-ID: <1879517d-f98f-6e96-7157-dccb0c872df0@amd.com>
Date: Mon, 28 Feb 2022 11:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [drm/selftests] 39ec47bbfd:
 kernel_BUG_at_drivers/gpu/drm/drm_buddy.c
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
References: <20220227151857.GA20405@xsang-OptiPlex-9020>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220227151857.GA20405@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99132f31-b8e4-489d-501e-08d9faa954cd
X-MS-TrafficTypeDiagnostic: MW2PR12MB2508:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2508C09E39C54BB64DCEE22F83019@MW2PR12MB2508.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnGXbY2L1B8buqA+AB2w1NdWnaHESyrYhkPFMX4MAWlh130u0Y2kysLsGnDOg82YPvnbOblVxUGacnKvMywHrJfYj09k5nb/tTjkYGrG2GecjQqtsxFCnwg8b5aj4iObHFKiOblmrDfnp4AmCu3oIpdKIiz2h+vivcvcySuwXn4EXL5KDdgROq/7yX5aZP8VjoutI+2bj9ss64/yu0uy69pBfRFnn4RSdWZnTTFkzq+Apd+al0u+5f/4JAZF1vWouulkqBUzTixfNmyFdf/yEgc4LmLZ/RB60gOanAShLKxm4jOfFr2lwaSQbTqdXTpy1xCgmN+OfVv8Vh9x3ICpWDSNWw5ATUxAcVjRV9zOnYPFVj4H3bIIUZWyBaBGenKE9xstaTkjwvha+gxv0XsRJUSCLd4ciHKfzS/cCxV2MItbVZtCIZatk4V8meNw11T1uIa2JlHuZ2m9PXYZGM+i2EhTkktrFRXnza5LS0osrKO6KOq+HEaIPa6U45YGa1pRhQ59NyWJXmaTlxcojOC92VJGCRYtQklj6sz6ZZ827M7J53lRyzby1C7RjTvIlOPAvIIaGx1yNd5lluVXxp0Jy4vLpucLhuYLPuVdHbRHdQEgKj9+5g0F73mXrLleRI2NbjiSluocSNXSM6oGkvRiPiTg7vbjAhm+YxqwuET3OvnOXSH8pLUMA8/9VL+qrpDsMwN7YQ1UEEcRcZe44oOOSTQIF5YHQuJ5Htbu8BHGFg8JsRMS4H4FKWuiZ1hu9izd6+Jm5lXXV67vVZwP44OZTTDeIeGoITqc917IeRpuS87H6AnVCPOVXS8WtZ7ouXLUXAKOb465tI8uMMN9HXEBBZ2NUvfRTWvyApoVxPqHRek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(45080400002)(6486002)(6666004)(966005)(38100700002)(6506007)(36756003)(6512007)(6636002)(31686004)(508600001)(83380400001)(110136005)(54906003)(4326008)(31696002)(8936002)(316002)(86362001)(2616005)(5660300002)(30864003)(2906002)(186003)(66476007)(66946007)(66556008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW5NU3Zobk9KOHZzN1p0dzh6UjBZUldiQ2dWNDJQUGVFbWNvYStTV3ZqMEFq?=
 =?utf-8?B?Y2xvQkJHQ0ZSaHdLOFNnakRBeERVQjJneXFzc2Y4aEtWTlRGRFQ5dy9aSHpw?=
 =?utf-8?B?M1EyMWdHYXlGbWthZExvTVdTd28vdVd6aU5pVElpbFdxSVRaaENjVFNmMkUz?=
 =?utf-8?B?TFF4Zm9HMnN6eTlqdXVzTUZWRTF6L3kwOHplVmRvVVpuS3U1eGJSWTZvTlVv?=
 =?utf-8?B?RlpnRStyNThvTkM0QjEzbFFuOERWMDJDQjJiWDRxT2ZyNjVhcEVvNnVWZ2k4?=
 =?utf-8?B?OWVCUkxmbGZidGpwWXdza0ptbjlGb3NLRk9yUEdVYVloSlhMYUpsbXNkeGdH?=
 =?utf-8?B?T3o5bU1GMFN4OWhFaEpWNXRKTW95WDRsb0VSOEZXbG4yWVZRMFdzaU5va0RG?=
 =?utf-8?B?c2ZGemtqbXZDQ0JDeUFEb2hmUDdpVEc1VnV6Tk0rQ0VHSUZzUzA4VVFSOUdm?=
 =?utf-8?B?M1loSEN2U2k0QXFjaERwTjhnbUgzczE2OGNUYnQrZ1JOZVMzNjNWRDJNWmMy?=
 =?utf-8?B?WCtmeU1WREpMMEh3bUhGOVBwU2NMN2tFNTUvRC9WNFFTWHA3dEJndnpNMG03?=
 =?utf-8?B?bHo1Q2hWL0sxTGRxSXpBQTdXMVFuUjd3WldESG5Ga0FKZ01JRWlzb3VQQ1V5?=
 =?utf-8?B?T3JaVFBiZnlORzB1NHM3djVjYUlRQlo0RC90a0VOaXF3Sk1Lcm9uYWJOWXdk?=
 =?utf-8?B?WUxwYUZwZ3VaWEJIMkd1QmRtZXVGbkNwZUNiUkxjbGo2cy9nREZqNExXMEhZ?=
 =?utf-8?B?cElGVE8wVkpodzB0Y3Zad2kzMDR5ZFQ0U3ZOVjQ4Y2IvdkV1RzVTVFVhZUJl?=
 =?utf-8?B?SlZXQ2duY1lFL3AvR3J4cExhNWpJRzhwT094RW4xckF4NjhiTmg5WlRNckdt?=
 =?utf-8?B?VXM2Y3dOektWYUVpUHg0VWNQMDR1YW9rUTVMOEtlTFB2U0dCODRJNk5sMmY3?=
 =?utf-8?B?TWxIN1hxeW9QeFpYRHhrT3kwcXRUU2lHQURQNzhLTWhrLzNvOGtKTTIxVnJG?=
 =?utf-8?B?dTRSN2pPQ1lBMTlJem5hT0hoTmdpeUQzQ21zQ21BKytCNHd0ZXRXOCtmRWZC?=
 =?utf-8?B?UThlc0l5Q1ZDSU5UOTRFQkcyYkxhT3pXK2dWaWV5QlJMN05RSk11RUNSeWtC?=
 =?utf-8?B?MEZGWVZLa3V0amhIT3cvRXFBYkZ0UnFoWUpmL0c2ZUx1QTJkQ3pHWHZsT3hM?=
 =?utf-8?B?MjJJUVl2bXdxRE9oMTZ4d2RJcUFWQitNYS91WUNiMUZPMXFBeGhWMGtOVnQz?=
 =?utf-8?B?TnBWV3hWOUFFc2twUSt4Z0VUS1d1VEZ5ZGhYQWIzY2xhdTZ2eXJ3YXRSUGpu?=
 =?utf-8?B?b3E1NEdxOVlCNElCTzVqTFVVNldmR20rY2F3ejBMYlFIdzlrOUR1T3lmT2ts?=
 =?utf-8?B?RURsQkIvUXY5SkY2a00vUEY4NTVMcmVoUjFlWGNxak1hOHZmdEVhVWFGcTJB?=
 =?utf-8?B?L2tzWWpLQ3FhczgrTStabVVnVnRUa1QxTnBtWUJVVjNVMDdGNmtrNlMxZ3E0?=
 =?utf-8?B?Ynpmamc0ZjFhVjVjMnBqYzJkNHlxY09GcWF6OFF3Nkp1am80RktqTm5rVXJJ?=
 =?utf-8?B?bmFtNVVybUYvUnZSazVGS3BUNFNUOUNQNzRjaDFnZjUvTWFIaUlDUk1Mb3F1?=
 =?utf-8?B?SGNJQmVpUWZhL2h3QnNsY09yejk2dTRlQ3hGbnpzNmVXdTBLM2t2NVBPZG1m?=
 =?utf-8?B?Ukg1RmxsZTVRZkRpcnJwdmsvRTBHeWVZVUd4R1VsRDkwd3RqeVIva01zZmw1?=
 =?utf-8?B?UnFQS2dYNzJFcXU4U3k3RitrVmFUZmFDN0NMdmJwYlpPdnRvcENzdktEanVZ?=
 =?utf-8?B?UlA5dWI0bmVIU3VyNVUzY21ta1NMZGNublo0MmtjT0dmU3lrZWhqaE4rVW1w?=
 =?utf-8?B?cFRpMi9MR0pRODB1ZG8zcVJGS0NHeVM0YzhKZlVGMmRxbHhJQ3B6UGFxVGFJ?=
 =?utf-8?B?ZDdXSFdSTHB3NXczRWdEb2lSb2p3VzhqSFArR3BqOWxMNTY2M3VHNGdjbWl3?=
 =?utf-8?B?T2IycUQwMzE1b2VIS25NVGpYZ0RsaFd6a1R6QXgrZkZPVGFrdjROVVZzZDRO?=
 =?utf-8?B?cGJaS2pNSnJVdHQwMXFLbDFKeFFUR3dNdVIvRnA5RDg5ai95NVd3bS8ySDRy?=
 =?utf-8?B?Nyt4dFpVL3paalVDK01rMFFoaTZ2VGZiTCtLOG1WU0k3a3Y4d0JJd0ZQNGcx?=
 =?utf-8?Q?R5S/lv53y3uWHzpaAat6ATw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99132f31-b8e4-489d-501e-08d9faa954cd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:59:03.0981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDcFhwuTjU0mPumxWqlwJdCxTDjiNPKFZPbxbtve0EZuDcWi6a7EBVGvFPeiml1F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2508
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
Cc: amd-gfx@lists.freedesktop.org, 0day robot <lkp@intel.com>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, lkp@lists.01.org,
 Matthew Auld <matthew.auld@intel.com>, tzimmermann@suse.de,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arun can you take a look at that one here?

It looks like a real problem to me and not just a potential false 
negative like the other issue.

Thanks,
Christian.

Am 27.02.22 um 16:18 schrieb kernel test robot:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 39ec47bbfd5dd3cea0b711ee9f1acdca37399c86 ("[PATCH v2 2/7] drm/selftests: add drm buddy alloc limit testcase")
> url: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FArunpravin%2Fdrm-selftests-Move-i915-buddy-selftests-into-drm%2F20220223-015043&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C3101ff318a994e6eaf5f08d9fa0481ea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637815719552700496%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=sKvsDtHufRMfSO14HdmHxvNsJiPyDZVDXCFUpWTDwFI%3D&amp;reserved=0
> patch link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20220222174845.2175-2-Arunpravin.PaneerSelvam%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C3101ff318a994e6eaf5f08d9fa0481ea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637815719552700496%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=aWG4x27aMLcOySOUkHbLQ1NL9L8t8AF4dgXux65IIP8%3D&amp;reserved=0
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu Icelake-Server -smp 4 -m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>
>
> +---------------------------------------------------+------------+------------+
> |                                                   | be9e8c6c00 | 39ec47bbfd |
> +---------------------------------------------------+------------+------------+
> | boot_successes                                    | 14         | 0          |
> | boot_failures                                     | 0          | 16         |
> | UBSAN:shift-out-of-bounds_in_include/linux/log2.h | 0          | 16         |
> | kernel_BUG_at_drivers/gpu/drm/drm_buddy.c         | 0          | 16         |
> | invalid_opcode:#[##]                              | 0          | 16         |
> | EIP:drm_buddy_init                                | 0          | 16         |
> | Kernel_panic-not_syncing:Fatal_exception          | 0          | 16         |
> +---------------------------------------------------+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   68.124177][    T1] UBSAN: shift-out-of-bounds in include/linux/log2.h:67:13
> [   68.125333][    T1] shift exponent 4294967295 is too large for 32-bit type 'long unsigned int'
> [   68.126563][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.17.0-rc2-00311-g39ec47bbfd5d #2
> [   68.127758][    T1] Call Trace:
> [ 68.128187][ T1] dump_stack_lvl (lib/dump_stack.c:108)
> [ 68.128793][ T1] dump_stack (lib/dump_stack.c:114)
> [ 68.129331][ T1] ubsan_epilogue (lib/ubsan.c:152)
> [ 68.129958][ T1] __ubsan_handle_shift_out_of_bounds.cold (arch/x86/include/asm/smap.h:85)
> [ 68.130791][ T1] ? drm_block_alloc+0x28/0x80
> [ 68.131582][ T1] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125)
> [ 68.132215][ T1] ? kmem_cache_alloc (include/trace/events/kmem.h:54 mm/slab.c:3501)
> [ 68.132878][ T1] ? mark_free+0x2e/0x80
> [ 68.133524][ T1] drm_buddy_init.cold (include/linux/log2.h:67 drivers/gpu/drm/drm_buddy.c:131)
> [ 68.134145][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.134770][ T1] igt_buddy_alloc_limit (drivers/gpu/drm/selftests/test-drm_buddy.c:30)
> [ 68.135472][ T1] ? vprintk_default (kernel/printk/printk.c:2257)
> [ 68.136057][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.136812][ T1] test_drm_buddy_init (drivers/gpu/drm/selftests/drm_selftest.c:77 drivers/gpu/drm/selftests/test-drm_buddy.c:95)
> [ 68.137475][ T1] do_one_initcall (init/main.c:1300)
> [ 68.138111][ T1] ? parse_args (kernel/params.c:609 kernel/params.c:146 kernel/params.c:188)
> [ 68.138717][ T1] do_basic_setup (init/main.c:1372 init/main.c:1389 init/main.c:1408)
> [ 68.139366][ T1] kernel_init_freeable (init/main.c:1617)
> [ 68.140040][ T1] ? rest_init (init/main.c:1494)
> [ 68.140634][ T1] kernel_init (init/main.c:1504)
> [ 68.141155][ T1] ret_from_fork (arch/x86/entry/entry_32.S:772)
> [   68.141607][    T1] ================================================================================
> [   68.146730][    T1] ------------[ cut here ]------------
> [   68.147460][    T1] kernel BUG at drivers/gpu/drm/drm_buddy.c:140!
> [   68.148280][    T1] invalid opcode: 0000 [#1]
> [   68.148895][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.17.0-rc2-00311-g39ec47bbfd5d #2
> [ 68.149896][ T1] EIP: drm_buddy_init (drivers/gpu/drm/drm_buddy.c:140 (discriminator 1))
> [ 68.149896][ T1] Code: 76 00 b8 ea ff ff ff 8d 65 f4 5b 5e 5f 5d c3 8d 76 00 0f bd 45 d8 75 05 b8 ff ff ff ff 83 c0 21 e9 5e ff ff ff 8d 74 26 00 90 <0f> 0b 8d b6 00 00 00 00 0f 0b 8d b6 00 00 00 00 8b 5d 0c 0f bd 45
> All code
> ========
>     0:	76 00                	jbe    0x2
>     2:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
>     7:	8d 65 f4             	lea    -0xc(%rbp),%esp
>     a:	5b                   	pop    %rbx
>     b:	5e                   	pop    %rsi
>     c:	5f                   	pop    %rdi
>     d:	5d                   	pop    %rbp
>     e:	c3                   	retq
>     f:	8d 76 00             	lea    0x0(%rsi),%esi
>    12:	0f bd 45 d8          	bsr    -0x28(%rbp),%eax
>    16:	75 05                	jne    0x1d
>    18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
>    1d:	83 c0 21             	add    $0x21,%eax
>    20:	e9 5e ff ff ff       	jmpq   0xffffffffffffff83
>    25:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>    29:	90                   	nop
>    2a:*	0f 0b                	ud2    		<-- trapping instruction
>    2c:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    32:	0f 0b                	ud2
>    34:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    3a:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    3d:	0f                   	.byte 0xf
>    3e:	bd                   	.byte 0xbd
>    3f:	45                   	rex.RB
>
> Code starting with the faulting instruction
> ===========================================
>     0:	0f 0b                	ud2
>     2:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>     8:	0f 0b                	ud2
>     a:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    10:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    13:	0f                   	.byte 0xf
>    14:	bd                   	.byte 0xbd
>    15:	45                   	rex.RB
> [   68.149896][    T1] EAX: 8578e658 EBX: 8578e618 ECX: 8578e658 EDX: 83717c98
> [   68.149896][    T1] ESI: 83675ee0 EDI: 00000034 EBP: 83675ec0 ESP: 83675e94
> [   68.149896][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010297
> [   68.149896][    T1] CR0: 80050033 CR2: 77f35844 CR3: 02a10000 CR4: 00150ed0
> [   68.149896][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [   68.149896][    T1] DR6: fffe0ff0 DR7: 00000400
> [   68.149896][    T1] Call Trace:
> [ 68.149896][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.149896][ T1] igt_buddy_alloc_limit (drivers/gpu/drm/selftests/test-drm_buddy.c:30)
> [ 68.149896][ T1] ? vprintk_default (kernel/printk/printk.c:2257)
> [ 68.149896][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
> [ 68.149896][ T1] test_drm_buddy_init (drivers/gpu/drm/selftests/drm_selftest.c:77 drivers/gpu/drm/selftests/test-drm_buddy.c:95)
> [ 68.149896][ T1] do_one_initcall (init/main.c:1300)
> [ 68.149896][ T1] ? parse_args (kernel/params.c:609 kernel/params.c:146 kernel/params.c:188)
> [ 68.149896][ T1] do_basic_setup (init/main.c:1372 init/main.c:1389 init/main.c:1408)
> [ 68.149896][ T1] kernel_init_freeable (init/main.c:1617)
> [ 68.149896][ T1] ? rest_init (init/main.c:1494)
> [ 68.149896][ T1] kernel_init (init/main.c:1504)
> [ 68.149896][ T1] ret_from_fork (arch/x86/entry/entry_32.S:772)
> [   68.149896][    T1] Modules linked in:
> [   68.167316][    T1] ---[ end trace 0000000000000000 ]---
> [ 68.168062][ T1] EIP: drm_buddy_init (drivers/gpu/drm/drm_buddy.c:140 (discriminator 1))
> [ 68.168739][ T1] Code: 76 00 b8 ea ff ff ff 8d 65 f4 5b 5e 5f 5d c3 8d 76 00 0f bd 45 d8 75 05 b8 ff ff ff ff 83 c0 21 e9 5e ff ff ff 8d 74 26 00 90 <0f> 0b 8d b6 00 00 00 00 0f 0b 8d b6 00 00 00 00 8b 5d 0c 0f bd 45
> All code
> ========
>     0:	76 00                	jbe    0x2
>     2:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
>     7:	8d 65 f4             	lea    -0xc(%rbp),%esp
>     a:	5b                   	pop    %rbx
>     b:	5e                   	pop    %rsi
>     c:	5f                   	pop    %rdi
>     d:	5d                   	pop    %rbp
>     e:	c3                   	retq
>     f:	8d 76 00             	lea    0x0(%rsi),%esi
>    12:	0f bd 45 d8          	bsr    -0x28(%rbp),%eax
>    16:	75 05                	jne    0x1d
>    18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
>    1d:	83 c0 21             	add    $0x21,%eax
>    20:	e9 5e ff ff ff       	jmpq   0xffffffffffffff83
>    25:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>    29:	90                   	nop
>    2a:*	0f 0b                	ud2    		<-- trapping instruction
>    2c:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    32:	0f 0b                	ud2
>    34:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    3a:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    3d:	0f                   	.byte 0xf
>    3e:	bd                   	.byte 0xbd
>    3f:	45                   	rex.RB
>
> Code starting with the faulting instruction
> ===========================================
>     0:	0f 0b                	ud2
>     2:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>     8:	0f 0b                	ud2
>     a:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>    10:	8b 5d 0c             	mov    0xc(%rbp),%ebx
>    13:	0f                   	.byte 0xf
>    14:	bd                   	.byte 0xbd
>    15:	45                   	rex.RB
>
>
> To reproduce:
>
>          # build kernel
> 	cd linux
> 	cp config-5.17.0-rc2-00311-g39ec47bbfd5d .config
> 	make HOSTCC=gcc-9 CC=gcc-9 ARCH=i386 olddefconfig prepare modules_prepare bzImage modules
> 	make HOSTCC=gcc-9 CC=gcc-9 ARCH=i386 INSTALL_MOD_PATH=<mod-install-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>          git clone https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests.git&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C3101ff318a994e6eaf5f08d9fa0481ea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637815719552700496%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=NjykC%2F60KxU7%2FmTnzNMNzJReXV06mjFzQPvDM1Pyj%2F4%3D&amp;reserved=0
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email
>
>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Center
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Flkp%40lists.01.org&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C3101ff318a994e6eaf5f08d9fa0481ea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637815719552700496%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=v8BQLwbrizBXoDoHb77IgXjPnvrF%2BomFQpmhNYXa8i0%3D&amp;reserved=0       Intel Corporation
>
> Thanks,
> Oliver Sang
>


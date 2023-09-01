Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2878FE9B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 15:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280F210E7D5;
	Fri,  1 Sep 2023 13:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4D10E7D9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 13:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3W+hQUwSRRJNg9oEEIRLKzeSgs6qpOBqyp1hRmgnZfwqWBciA57UX3qCKFXkNjS+qJk3Y3CI9iuToy33Qy+o7S1quK7NqBsUDfi4AGK2/pg4TTfhD5z9+lPmzA0eRlvoJwHPxFrRGOjYow3L0cq9mPoe/iuSXPObPw3vTaElXKwCEFgCLqpfD4r820ECjeyakziSz05X1WC5gE8aK6guKX1knnzOd0eO7UclrqxF88y5KK+fOVOrFjyl6Nw9yXoST5exVg67ZfqX3v5Vbla6D5VyvEOXb+V34t76bU1MwUJVX2RPhgMffMgMjCBVZya0Y6Qwha6WfFccNDXrOWRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItsFMUCIF2TYFlHU7H/+7oF0sgEjdDig3L1rQqsaeMA=;
 b=Pawk3runCUTLmPbVzuCBXSTURwh7ZAHCoq8cP5J0fDb1zbV4dJlZdty26ZXbGB0d0pJ9MuWY9oMJWKeE/eH8u/OCIQXu77EIs/uT6TsY6Fw6Ftv5hYbS9egb0kJKr6/VhYLY/0YcVxFS9/B5IWT1FvxgKcDyYBWdWWgxzHCxTnqE3ub6JfF/5hRdjfp+OzerlX8jwRE2VIGU2QPZ7gDoiK2jMQsm/CMPx2h5fQvrFAj8sYXZ4QEIpHcdNczB2kepd61WtIvknnC6Dkbn5WxS9PIDlEVT+CR9gngW0qTRhsuVe9b0xsxuHmCZJri7t2CF37KV/647oRAivF7ykoXwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItsFMUCIF2TYFlHU7H/+7oF0sgEjdDig3L1rQqsaeMA=;
 b=1ERta+qcEW0OIGkwmd5mQzjQ02U81QuCZOp0jgGfJA4mqGlHpxPdV5U54AYIjqw+2tUMhoCBWlpKnhKj9IKZ0oQeOFaYUcFDQuTIP3+OxsZ+5ADDm0lpa+r+5XJic9SftdONsjLWFbhzx6z3HYam4t1px7dTXUOyyGfahRpvO5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5424.namprd12.prod.outlook.com (2603:10b6:a03:300::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.27; Fri, 1 Sep
 2023 13:50:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 13:50:37 +0000
Message-ID: <97b1ab0f-9080-b009-be10-b098506fae28@amd.com>
Date: Fri, 1 Sep 2023 15:50:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
References: <d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek@intel.com>
 <202309011935.bBpezbUQ-lkp@intel.com>
 <41345404-3440-00cc-745a-d2977b406c64@intel.com>
 <e1061b33-65ba-4049-871c-4e2b4d23177c@amd.com>
 <443e34f4-3554-e981-f11f-fc4bc459b046@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <443e34f4-3554-e981-f11f-fc4bc459b046@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1619bddd-020f-4edb-32a3-08dbaaf26ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KtB+oZgW7ZrKNwSiSiwnQgxAgUMIn4Jx8KPRmjEpZymIBJp5M78FxS8Taerc2P24yC2PQoXfsVZ9Qko7k98Hm4lYGyJEijbwF7bjuGjUs6AyGQMCECDbZ2LU7IQHmB7o9IDNdVHeha7BNkVshNbDJocjKWYXYWXZn3QOOtxOvSdeYhUJ/xHQxvjsCV1Y16ezCdI9qH8hOXiB5v3jRl9TYLJbSIz0cZpd0vrVduMUq4hJdfaw+OuCmgwxyeY5dBBy29r/pkbFmAERw4Ez18bclMFpEdeYVKBOYPmWXfsptK43VR4rUZp3eGFWl2ct43fnRDw1OfJ5FyQ7gL06YORpnOk+XJ80tXEtfzaa499xPPoT4AAMUHpYoy+8VlMqI4ArFXVllIwQg+/VJ/+NouswHs2wh0jigs7RAP0dYhfnaj31yBbJToK44TXkxFOIds20OJMtspvEfU5Mb9u1kuymB5OgEBBHSEXouX+YcI47TnmZb0X30W6rgvlEaE9tnO3rp9mu8QFV+a8eqllderf0MWEEuiH2oHfaHR/MK7rtw8G5wtPdP3cA2s9SyH7+QzZfFMt70DjornM/EqvQbnbPJE+Yia4K4dtQwuM4iv1DDdMl+ycXtVjOpb8Pg6rbLhgM7TErQvLlwXFYsrN4TMPoKciU7kF+kdHDrsLhUjrUvr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199024)(186009)(1800799009)(31686004)(6506007)(6512007)(6666004)(6486002)(36756003)(31696002)(86362001)(38100700002)(2616005)(66574015)(30864003)(2906002)(26005)(966005)(53546011)(83380400001)(478600001)(110136005)(66946007)(4326008)(8676002)(8936002)(5660300002)(66556008)(41300700001)(316002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2dBM1o3ZXpaTVR5VEYzeDBOT20vT3AyOHVGSmJoYlQvTjNoSENMVTRQZ1Zl?=
 =?utf-8?B?YnJ6azI3T1VVbzhmSnNxbXVITGp6bWNjMmpGelYvZjdzblFPMkxCV0Q5dXpu?=
 =?utf-8?B?STVGbTZoaTVkUHExRTZZMHMzcVV0cEsybEtxeWJubEZJMVJOYzJLWDNKdnFu?=
 =?utf-8?B?S2ZmbERqdHJCUGdmZ0RUK1EvNE5MUE9Za01xRzEvZUJybzJOUC92UUxab2hk?=
 =?utf-8?B?WnpOallsWXhEM2g3RmVqbUEwL0I0cEpCZDhUUm9UYnQzOVYvWk9BMmlLVjVU?=
 =?utf-8?B?T3c3bFROdlo0bENvNFp4emd2UThJNGRwbUFzdmVoSmh5ckZOV2d0TURPQTc1?=
 =?utf-8?B?ajE1WXRSMmg0NWtITDJscVhpTjBqbmRidlRXaHJFUE1yM0xzQnNRWWlxRHhu?=
 =?utf-8?B?L213TFFUM3dzU0lwcHEwODlWWGg1QVR4aU83ZklpQWFWSVNIbGJRZThJRFJS?=
 =?utf-8?B?MmFPNWRzcDJsSCszZlRwb1R2MHBTdGxadDhjOS9MQ2FuTXVxazU2QzBxTi9I?=
 =?utf-8?B?aVRYaDNRb0lNSm1uOHEyQ3I2by9Xa3JHS0MrUit4QzN1NjdkejFXRjVtTzl1?=
 =?utf-8?B?WWhvMDkxeXc2Ukh0ZGRrUS91N0tKUVUwNXlsUVRUSDk0TTlaVS90NFVZMWFk?=
 =?utf-8?B?bEh2RmZYS3RqV1pHMzgwaEN2ZEV2bnhGOUJ3T0p6M3NPUGRiSDlkRGFjSU9O?=
 =?utf-8?B?ekN2NmNoVGR1bmZudjNOazQ1OEtsSDVZaXZ2Z291TS9IenVVRE53OW1YRWdn?=
 =?utf-8?B?ekpVRVdLZWhVZ2ZZRVRrcy8zclVBZ0QwVVI4Q0U0ZVVDUG1hS1FGbkJud05k?=
 =?utf-8?B?ZEd6VCsrenFmeFBDWm4zYnltSVc3czNrdzduVlVjTnNISHY5bnJoVTYxRG5o?=
 =?utf-8?B?aG1ETDgyVE1PWXZNVExFUDFZMUpWSi84NEVvQmlXeHVWTVViMWN3RTlhZnJw?=
 =?utf-8?B?cmM4RU90dFl3K1doS1cwZllHTmZyUS9uNjBsU0pRM1hEOVdPNWh6cEpMM3kv?=
 =?utf-8?B?dDNiejhhOEdDVDczVXpqRDFDanR5SmFTUXhKc1Bubm9FTlF0UU9oSUN1djRG?=
 =?utf-8?B?ZjVWL0phYkU3S01TZjlTWEtMN2o1WGFZTVVOSXJEeGdjekcyTmxvYkFZK2dB?=
 =?utf-8?B?L3FBbE5iUWVxS1N1d3htY3VlOEQ4ODUvTTVOVmhsbHJRSDBnWnAyUHdudzNQ?=
 =?utf-8?B?REJ6aWFOOFRvelFrd3d0cGQvK2RuaDFqejVDVU5EQ1dqSmRkenNOdjR1M1dL?=
 =?utf-8?B?TGFlR0liK2tlclB1cHJoNDc0ZURBdEk4TldqSjJCRDBTWmlnVnplTzk3RUll?=
 =?utf-8?B?T1VPaGVVMkdycy8zSGo0Si9WZnk3VlNPcjFhWnkyWjBBaXhVV1RHQ2c4NURY?=
 =?utf-8?B?QnlOaGc0cHo4WWJZejZVd28vYVVXSWl6TkFpamFBSnp3d1BkdWJvb3pRTW1v?=
 =?utf-8?B?N1N1TGdBbnR1dlUyVXNnMmdKV1Z4eFlXWElDbk4xd2hYWVIzbzNycklNaVFh?=
 =?utf-8?B?Rmg1WDhQaGlmZWh1UDdLQjBkWXNTcHgzd0VYVUJMR0ZxVGVxWk4rSEFaTXFS?=
 =?utf-8?B?ckZQcGpNWTlJdTZVeXh0TVg5UUd3aFdNcTh1RzQzR2dza3ZSMXN4T3pDNXZs?=
 =?utf-8?B?TlNDOGV5ZUpXTU45bTQ1VS81SkJra2NVSHlteTkra1lwWjRwZjFPbG5xVlU0?=
 =?utf-8?B?STNTU3dtcG9WZ1RMVzNVTlMzYmV4YXdxbHNIYmxCK3pkR2x1TndxZm91M3M4?=
 =?utf-8?B?dE1XSkV0cVJUVjVDZU51eTRGa3BkcGp1N3ZNbzA5L09kTGgyeHh5L2Z3dURO?=
 =?utf-8?B?NTk5UTRiM1huQy9BUU1rbmVlemRLOEg5cEliV0NKL0tkUnpGWVZaN0s1Y0JS?=
 =?utf-8?B?b0luRHNOMmFwTW1qM0FiTldNOEZrMTRYRlFXeEVCaW5iYmg1ak1kSzMzbEwx?=
 =?utf-8?B?cVIrMkVRV1RSNU8ycGV1YVhjVXFraktERExCRWZsS0lRblh2eEFsR3NraGhq?=
 =?utf-8?B?QlJWaEZkbW95dHhwTzBpT0xFbE1OQXNhMWk4VDZlM0FaNlFIU0FYd2JQSTlz?=
 =?utf-8?B?RHhoS29pUVFzQjlqc0UrZm1PVkJBd0k3dWl0bkpDTVFNT0w0TEMzdjYvdk9P?=
 =?utf-8?Q?Ieg7gFOOaZ67g8AwLYhZo1hCG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1619bddd-020f-4edb-32a3-08dbaaf26ba5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 13:50:37.1024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkI5E+4M6V3At8OG0Fzzj7kPnVlEoMB+K/7S4FB8FMiszuNgNFYQLh60/1serCMi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5424
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.09.23 um 15:30 schrieb Karolina Stolarek:
> On 1.09.2023 15:19, Christian König wrote:
>> Am 01.09.23 um 14:37 schrieb Karolina Stolarek:
>>> On 1.09.2023 14:04, kernel test robot wrote:
>>>> Hi Karolina,
>>>>
>>>> kernel test robot noticed the following build errors:
>>>
>>> It's a problem of building TTM KUnit tests as a module, the issue is 
>>> not tied to a specific arch -- the subtests use unexported 
>>> definitions. While it would be possible to add EXPORT_SYMBOL to the 
>>> TTM functions, we don't want to do it with do_send_sig_info.
>>>
>>> Christian, two questions here:
>>>
>>> 1) Shall we export ttm_resource_alloc, ttm_tt_create and 
>>> ttm_tt_destroy? Or is there a reason why they are "hidden"?
>>
>> Yeah, those are not supposed to be touched by drivers directly.
>
> Right, makes sense

If you can't find a cleaner way exporting them conditionally on 
CONFIG_DRM_TTM_KUNIT_TEST might be a way to go.

>
>>
>>>
>>> 2) If we decide to keep ttm_bo_reserve_interrupted subtest as it is, 
>>> should I make CONFIG_DRM_TTM_KUNIT_TEST a boolean, instead of a 
>>> tristate? DRM KUnit tests are tristate, but I think they don't use 
>>> non-exported functions.
>>
>> Another option would be to build them together with TTM into one 
>> module, but I'm not sure if the KUNIT tests can do this.
>
> While I can imagine doing it with TTM, I'm not so sure about coupling 
> it with signal.o. Still, I'll take a look.

I have a high level understanding what you are trying to to, but that is 
absolutely not my field of expertise :)

Regards,
Christian.

>
> All the best,
> Karolina
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Many thanks,
>>> Karolina
>>>
>>>>
>>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>>> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next 
>>>> drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20230831]
>>>> [cannot apply to drm-intel/for-linux-next-fixes v6.5]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a 
>>>> note.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url: 
>>>> https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20230831-185954
>>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>>> patch link: 
>>>> https://lore.kernel.org/r/d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek%40intel.com
>>>> patch subject: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo 
>>>> functions
>>>> config: openrisc-allmodconfig 
>>>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/config)
>>>> compiler: or1k-linux-gcc (GCC) 13.2.0
>>>> reproduce (this is a W=1 build): 
>>>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a 
>>>> new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: 
>>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_wlc.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_fo.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_ovf.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_lblc.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_lblcr.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_dh.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_sh.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_sed.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_nq.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_twos.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_ftp.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/netfilter/ipvs/ip_vs_pe_sip.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv4/netfilter/nf_defrag_ipv4.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv4/netfilter/nf_reject_ipv4.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv4/netfilter/iptable_nat.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv4/netfilter/iptable_raw.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv4/udp_tunnel.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv4/xfrm4_tunnel.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv6/netfilter/ip6table_raw.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv6/netfilter/ip6table_nat.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv6/netfilter/nf_defrag_ipv6.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv6/netfilter/nf_reject_ipv6.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv6/xfrm6_tunnel.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ipv6/ip6_udp_tunnel.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/dsa/tag_hellcreek.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/dsa/tag_lan9303.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/dsa/tag_ocelot_8021q.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/dsa/tag_rzn1_a5psw.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/dsa/tag_sja1105.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/dsa/tag_trailer.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/dsa/tag_xrs700x.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/mptcp/mptcp_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/mptcp/mptcp_crypto_test.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/mptcp/mptcp_token_test.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/packet/af_packet.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/packet/af_packet_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/bridge/netfilter/nf_conntrack_bridge.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/bridge/netfilter/ebtables.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/bridge/netfilter/ebtable_broute.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/bridge/netfilter/ebtable_filter.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/bridge/netfilter/ebtable_nat.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/sunrpc/auth_gss/auth_rpcgss.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/sunrpc/auth_gss/rpcsec_gss_krb5.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/caif/caif_socket.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/6lowpan/6lowpan.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ieee802154/6lowpan/ieee802154_6lowpan.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/ieee802154/ieee802154_socket.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/nfc/nci/nci_spi.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/nfc/nfc_digital.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>> net/vmw_vsock/vsock_diag.o
>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
>>>> ERROR: modpost: "ttm_resource_alloc" 
>>>> [drivers/gpu/drm/ttm/tests/ttm_resource_test.ko] undefined!
>>>> ERROR: modpost: "ttm_tt_create" 
>>>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>>> ERROR: modpost: "ttm_tt_destroy" 
>>>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>>>>> ERROR: modpost: "ttm_resource_alloc" 
>>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>>> ERROR: modpost: "ttm_tt_create" 
>>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>>> ERROR: modpost: "do_send_sig_info" 
>>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>
>>


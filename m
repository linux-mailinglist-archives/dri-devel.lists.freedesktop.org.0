Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC278FE37
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 15:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5892410E7C0;
	Fri,  1 Sep 2023 13:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B210E7C0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 13:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gobJQEJ6taTe4n9nb9gcEaRaeF0maXGUdPIQHpV8DIcFn4BcTK2+dtzS9+sl3W9Te4kso/3qeB9mA5VZ/hnUeR8HBZfNdyTrzuWggUTJ4CkFnAVCTAW8VDn0ac60Kniv84nJw4mmtKKd2IBDFH251nVC64gNnpbbbiAJwiVXuTQcAffbUzi8HVCx+amHcLxLz+ZYHxtcI+hElhTM4OQbA9i9D86m6/Wr/VTG0skDjC5UnupsxOTqedPHcE2a80HIlMHa7YrELrPLc1wkShk3Si63xAYBjdIlC/ceUm5CS7oe2Hhez6Jumh5mzOJNbF4Wub0iKh1UHCmc89CECVX/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty/lF+IXrRplrwK0raZj9O76LH2OBcoHlcptfWk1DBI=;
 b=nu/XLvH8eOLQpEau26awW7UIQCs7CCYH7IskqZAie5tqrWBG+rpTtf64VxrU2hSUZaLxrchNmuV+8kpiP+SSYwgLPXn4K9A+l4JdI51ATKDrQ4XRLQKH8H9tk2jEE4FPxPuqcSEWytOwMCTKaiW4ZRqfqEeJqr6g1II1IJpNJwXKhXS9Ak2uDWBSks/2qVbBx4cvTWrpBxtSPuvTua51a+h9OkPtiRZtrdGGMtByfiEjLPnmpC1EwUrOutsMknkmAqj9cLiuQHAG9g807HSkzWRhD8rhdjc88m6w4xufgTGy9s9IAdDl6HrBqBUd0A7KCiHT9qF8M0VNiw+DR3ebLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty/lF+IXrRplrwK0raZj9O76LH2OBcoHlcptfWk1DBI=;
 b=hIgxFSo4EurTk9H4G3BtZwU8CmtH+GokP0OlSJF1tqqIYKrwxCE79AL+R+qvl+TZBcy4oMdtiqV+rvgenZPf0kFw+y5NTz+l+nUWoYvXMufyYTGb303N+vOOBQDOp3SJTSRg2GFm9BLIkAvSwrT7D7udpPBUd6F2MDlTJX4kr94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 13:19:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 13:19:55 +0000
Message-ID: <e1061b33-65ba-4049-871c-4e2b4d23177c@amd.com>
Date: Fri, 1 Sep 2023 15:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
References: <d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek@intel.com>
 <202309011935.bBpezbUQ-lkp@intel.com>
 <41345404-3440-00cc-745a-d2977b406c64@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <41345404-3440-00cc-745a-d2977b406c64@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 666cb549-6d5b-4617-ed73-08dbaaee21e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FH/Fj9UVzqyUpkQVvp8dTZcgB4kwr8utueUzDIszvbJwDd+rmFF4jhyIrEdYXcxK+R3vhq6VsrS4DqI3rYESZhe5wfqccwseohNACMZARdnNfcMEdZ7yRBUTO8fMU1PZg7hcb8YxMGs4Qo5a9Nwof6O3+/jT1735UczI6SiTb3Qlux/sa+3hbj6b3hpaIwAhGU4QGwfcscqiJGcRe6LuPAsIasSKW3m64gwPgEKeOF607BGPDeO1khdHpcKi2THylbY/JEA2Tok81y3rmij/c+Ed1HOnsFjgULMUIJI6PMHIjODZGLe4BXQbjcMNpGjb+wi86xelSz6lQn5wUqPtD+RfxkYAW33zkFpSWEXwHooftGMxDAT4MPmOubX+6NYuniHpi2aMsfNiSx7XIj1pVOcLpa2Wk93HxOsx713YgkJJA+RP/BxYDsvun5PcTO+47j7BF60TdZnRrtTEy6zTQSDhWK6gZ/l4EBvelwMXyTrbhGtPNlk7OZN6LEHyOFeEwWuVvWqVlfxGvHZvm49HyiaWPsXk0BOKw8Yk1N45A6ndDvTHVy57NZg6nSV4zdT8Gs8lcU4xkSE16ezLXFds4K1mZ5u6S315SPjhjqnNiQU6z9gS667paEjZEkkIu0CZJd67sWI7QYhZxp9LzmIRjWY7XCIFn7lVSWD0uzlCzfo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199024)(186009)(1800799009)(6512007)(38100700002)(41300700001)(316002)(4326008)(2616005)(2906002)(30864003)(86362001)(5660300002)(83380400001)(36756003)(26005)(8676002)(31696002)(8936002)(6666004)(66476007)(966005)(6486002)(66946007)(66556008)(6506007)(53546011)(110136005)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy9KbEFUVkgvdHFXbGNIS2RPWTl1bzFrOHZBejRHQmZhRGVKMW1oaTgzNWp5?=
 =?utf-8?B?Rk5ISmxYOHcwL0liL0c2ZVZQNzU1elpCeFpaejJsRjVIMC84Q0Eva2pJdEFD?=
 =?utf-8?B?OUVta096VlNoMzhQQ2h5elQ2dHlYbE1mckRHdWpBZHFMNzJuR3JOdDZ6YXRo?=
 =?utf-8?B?ZjM3MEJScWZTQkxJdHR5a0kzRTNtcVdmYng0Z0dpUUlhY3p1T0VWeW1VSHEy?=
 =?utf-8?B?WjNpdi9pTTJFd2NnSUpUbzRjNXFtclk5bmdBRk9Db0FDb1ZqMkZRaVRlU1VM?=
 =?utf-8?B?NEJOaVFwb29lcVEvcEMvTVlleWM5MTVwQTEyc0FrazR3Q1ZhUWhkVzlPRkFs?=
 =?utf-8?B?ZXdKcWlnOXVRaVF2eDNXY1BCM3VNVm83aGVVT2o2MEdodm85OEpDU1JmMzJE?=
 =?utf-8?B?eGs3SDUrQ3NuSEVjeHo1bm5keU1xWUY4cGxHQjNOdzg5OURYbFdFdjRFbkFD?=
 =?utf-8?B?UXY3OVZsQkI0bFhpYkFEY1JKMWtDUm5DOUVtOFEwNGFNVkJ4K2VwZUpPaCt4?=
 =?utf-8?B?VmNUZ2Z4T0M4U1BCQ0JJalBwTEZ4bEluVHZpSUIyZTRqcWtOS2txNWNuWHUr?=
 =?utf-8?B?MjlLbjRnVnhKSjhhYUZVOEpjWStKNytVSlRsRkozeWhCZVp0cVJTZGZlZEg1?=
 =?utf-8?B?cGd0ZDlYS0VjdzZvUTF6dWJlai96a1ZicEprMzRGN3pEdXlka0FrempabG9o?=
 =?utf-8?B?ZnNxYTNMYkNMblFzQ1htM0JrUEV5WUl1N29mejExT1laN1FqcDlpZHlhMXZS?=
 =?utf-8?B?VHZ3TnlmbzhhMThuWFk1Y1FObjlmSGRTZTVmMGczWWp6NU5teFVleEtXZm8y?=
 =?utf-8?B?Y1paNFF1RGxmV2c4ajBHS1RkOHQ1MTRsYTluc1ljQThTbG15RU13RmplR0xr?=
 =?utf-8?B?c1I4U2NEclA0ZnZoK3FoVHNyNkxrc2szOGVrTFZ6anBlVWU1MmowOGdGZG15?=
 =?utf-8?B?SkVXNTA5NEdadWhBS2NOQ3V3cnM1MTNKTGd5QWg4QVBMSi9UQ0I1cVRSRVhq?=
 =?utf-8?B?RmxuQzUvNWJRRzJ2QVY0akIvQVNKUXZOa3EzNmM2Y2c0UkhFKy9oWnBZVXpF?=
 =?utf-8?B?WXZNZG9oWGxPYzdROVBuL0VmSGw2c1hrNVNXQ1FGeDEvZms5Q1dNM1BhcHVD?=
 =?utf-8?B?UTA1dG9sYlZQUVl6T1JWcFNkMkQ5YzRDcUlwVHYrQThFUmx5YVNXMERNUU5q?=
 =?utf-8?B?NklRaTlJKzF0TVJoWVcrRlhDSE15czNZRXhHRnZDc3lla3g4TVcvSzNWdVJU?=
 =?utf-8?B?R1hSU3lWZkJMYUtyMnhSYnFVTEkyTmlJT3I1U0t4TTNZMWNLZHFZVTJQKzZt?=
 =?utf-8?B?UFZjQU9wY3gzeTBzalJuK253bjNlZkZxUERBTEJrdm9YdmdhN2RFUHZFaWVl?=
 =?utf-8?B?d2FTN1FlRTdIVEhuMDJwTmtiWFVzQm9aZU1TWmt1NjVFc094NEpYVEhvRExq?=
 =?utf-8?B?S3Q1ZUdQVGJNOEN6UW45TFdXejBjQW5qNFB5cU9qVDB0WEQxK1NBeVpNemJh?=
 =?utf-8?B?V1pOZGJIajcwMXlHdEh6OTh0bHM4dkFEaFVCVWhHSS9MbzRqY01YQmJGUFZX?=
 =?utf-8?B?QlRRSksvS1NNRUlGQVNVcUtYczA5ZWZRdFNlSFNzbmNPQXFaUlMzQ08yR1dI?=
 =?utf-8?B?cDdUcW1IaUxDMElBNCs5MWF6Ri9lUXY3TW9WbmpUazc2Z1NFOG1NQklseWUx?=
 =?utf-8?B?bGF3L2lzSWFudmpXTThNTWs1NE1lZzJ1QWFtdkFnQ0RsV0Fkc05nS3JDWUVq?=
 =?utf-8?B?OU5ySDU0K1luSExaTFZhTTdmQ1JabEtmVnZIMlplMWJNZUhwVXRGamJVRjRm?=
 =?utf-8?B?aVFYeGZmeXhUWUVlanMyN0o1QzcvT3BkLzIvL1RSdXEreFg0dm9ncmVpZ0ZP?=
 =?utf-8?B?SFBRWkVnazNWUkkzWlBqaW1DWTRlZEJnaXZKVTlIdkkvTWNQUEJiWE9RaVlj?=
 =?utf-8?B?aC8xM2toRks1MzdpRDVyQXdrMG0vNmhvYnFMQ1dxOW1IMmt1OGNkV1lyZkdY?=
 =?utf-8?B?L0VDYlJoY3pxK1JycjhoeU5Iak4zWVcwNnlxeVE1SE1FM3NjTzNTYXR3TmY1?=
 =?utf-8?B?STZXV0gwc1M4S3VmSGUxYmRsK2dOdG5hNlpOMVZYalFRcjB2V1hhZ3lSM1lh?=
 =?utf-8?Q?rClc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666cb549-6d5b-4617-ed73-08dbaaee21e9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 13:19:55.4169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9TQqjFpUnA9EOpFpbKgky26WUlyKyhI2pl+pEG0M8n0t8zDt5FbMn28++7pSSRY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
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

Am 01.09.23 um 14:37 schrieb Karolina Stolarek:
> On 1.09.2023 14:04, kernel test robot wrote:
>> Hi Karolina,
>>
>> kernel test robot noticed the following build errors:
>
> It's a problem of building TTM KUnit tests as a module, the issue is 
> not tied to a specific arch -- the subtests use unexported 
> definitions. While it would be possible to add EXPORT_SYMBOL to the 
> TTM functions, we don't want to do it with do_send_sig_info.
>
> Christian, two questions here:
>
> 1) Shall we export ttm_resource_alloc, ttm_tt_create and 
> ttm_tt_destroy? Or is there a reason why they are "hidden"?

Yeah, those are not supposed to be touched by drivers directly.

>
> 2) If we decide to keep ttm_bo_reserve_interrupted subtest as it is, 
> should I make CONFIG_DRM_TTM_KUNIT_TEST a boolean, instead of a 
> tristate? DRM KUnit tests are tristate, but I think they don't use 
> non-exported functions.

Another option would be to build them together with TTM into one module, 
but I'm not sure if the KUNIT tests can do this.

Regards,
Christian.

>
> Many thanks,
> Karolina
>
>>
>> [auto build test ERROR on drm-misc/drm-misc-next]
>> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next 
>> drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20230831]
>> [cannot apply to drm-intel/for-linux-next-fixes v6.5]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url: 
>> https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20230831-185954
>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>> patch link: 
>> https://lore.kernel.org/r/d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek%40intel.com
>> patch subject: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
>> config: openrisc-allmodconfig 
>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/config)
>> compiler: or1k-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): 
>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_wlc.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_fo.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_ovf.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_lblc.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_lblcr.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_dh.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_sh.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_sed.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_nq.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_twos.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_ftp.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/netfilter/ipvs/ip_vs_pe_sip.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv4/netfilter/nf_defrag_ipv4.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv4/netfilter/nf_reject_ipv4.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv4/netfilter/iptable_nat.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv4/netfilter/iptable_raw.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv4/xfrm4_tunnel.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv6/netfilter/ip6table_raw.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv6/netfilter/ip6table_nat.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv6/netfilter/nf_defrag_ipv6.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv6/netfilter/nf_reject_ipv6.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv6/xfrm6_tunnel.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ipv6/ip6_udp_tunnel.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/dsa/tag_hellcreek.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_lan9303.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/dsa/tag_ocelot_8021q.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/dsa/tag_rzn1_a5psw.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_sja1105.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_trailer.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_xrs700x.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/mptcp/mptcp_crypto_test.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/mptcp/mptcp_token_test.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/packet/af_packet_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/bridge/netfilter/nf_conntrack_bridge.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/bridge/netfilter/ebtables.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/bridge/netfilter/ebtable_broute.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/bridge/netfilter/ebtable_filter.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/bridge/netfilter/ebtable_nat.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/sunrpc/auth_gss/auth_rpcgss.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/sunrpc/auth_gss/rpcsec_gss_krb5.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ieee802154/6lowpan/ieee802154_6lowpan.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/ieee802154/ieee802154_socket.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci_spi.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> net/vmw_vsock/vsock_diag.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
>> ERROR: modpost: "ttm_resource_alloc" 
>> [drivers/gpu/drm/ttm/tests/ttm_resource_test.ko] undefined!
>> ERROR: modpost: "ttm_tt_create" 
>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>> ERROR: modpost: "ttm_tt_destroy" 
>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>>> ERROR: modpost: "ttm_resource_alloc" 
>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>> ERROR: modpost: "ttm_tt_create" 
>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>> ERROR: modpost: "do_send_sig_info" 
>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F083D668AFF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 05:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D310D10E98A;
	Fri, 13 Jan 2023 04:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A657710E987;
 Fri, 13 Jan 2023 04:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673585297; x=1705121297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oWL+DZdF/in9YL3Uuipw1K+JEGS9X8QIGuQ1Fdc9VrA=;
 b=Mr0q5kecwnAHptDDOcEAhnuwX3979pyE1kB1D/U0prmVwL6Liu3fhOR2
 FptCxbiCF7/Pajopjb5yfh5+Hc0339Dk/9wscDm/MSIGvWnKAizcyfnTi
 v32+riWPQveAnA7hTg9neQY9/iunxE4/LC4CcaQcPaE5FPp8TI9mtu3+z
 +zzjqpvd+oZryk2s5S817OYszWzEpE9ZrEVHezyK639S6k6+/It1yxGyO
 I7i7MB895u2WIT/VrFXl1O3o03c8+UWyqkpmucia+uMCBZeLEZ5ICPsZ6
 h4CmNRtTzLogWbkK+9camWwp/uXXHJt+zx/MPPjWOA4FBXo7W07UIW2SF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325174321"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="325174321"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 20:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="986858206"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="986858206"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 12 Jan 2023 20:48:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 20:48:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 20:48:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 20:48:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXRkYMcM/RWJU2Yfqz/J7H+izMxh7C0Y/dttESkSlrUShMi8RCIQtBcTzlNuJdxclTezowJ4AII+vwXltcoqdK8NI2KThNeWVeLuLMLkE01vMtrSfe7JqNjiodi+QhTf/EqD2HRFae9ehyrIyj/JVMF4faW+XuNEOkoQYxVKco1DfcZOb5zWvyakZFZwfvyp+MYFebYUrEyupM3Uh2BWkJczXDEnJ2s8dgOvIYa/HR0lpGBlJOJ4+pTyMm9wxF/FFdPp7LwAucLGbKT+ZnRNgShDUZuENeDTljEClRzNHgojqJ5tOIeORYPVZ5ukMQ9qtHxiym2+j9YRVN/FNkJCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TV8dSoLMUfE7wKnNte9fJBtFGj6YldU9Mdn7c5Bt7k=;
 b=AV01PS0/LNP9mGk1/HVrx8heN5rKlrfw3CnEHkt3VO/CgUmPHfCPOm3A9aqhp9CK1X6mIpOuGoABo7+geuND6ItXMVHLFYZM+3S6ZrQpfnDCUAroYuwNRwW/BNvt0SbkhwGvnHqk71ttYU5mkVT5jLF2Gw3jjtOgRwq29mJjwf/MK8xGAavKur5d0ZSgDKZQJJMtjkeBYPo1uw6D/XSKJg9YYTuNHdAEXfcODZTDSPE/hcicgrLxj0UNVi0WMRcDDhXCYs1/aqmwAu+7ZOpka+o1ZF4IRPBE/C/Z3caLUSh66v/SXrj/UpMdv9oGFbyRknUS7K1HwrdsE77VcD2mjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 04:48:14 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e%6]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 04:48:14 +0000
Message-ID: <82e45200-8a95-ec9a-6dba-766f6c23c7fd@intel.com>
Date: Thu, 12 Jan 2023 20:48:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Connect root sysfs entries to
 GT0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230113022752.3151066-1-vinay.belgaumkar@intel.com>
 <874jsvazvi.wl-ashutosh.dixit@intel.com>
 <db1160e1-cfc1-08d0-08b7-84909608b465@intel.com>
 <87358faw34.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87358faw34.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::20) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9ed6fb-3a34-4939-1bc7-08daf5216112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sOdnqeVbRZhfRABSxHtPW6fSyNROHXTbxMxItiXnIIttKxJIvnlj1/T0bNEicLRCthedQ/0aRp9ksRdCBcrleABYBvFi75wSfymA/9Zxf4QcF3SpUULXzQ1fxEY6LYDaSeCdIXiK5l1eNRaJ0ZbWf8Pyzgtr0jiRGk/a9/ksjtFoud1FbbE8X7gUHoIwSVX69h5D49fs/egsSJVyvCrI77lkWCW0XVU/IBvmC63iv8ZRNfu/FgJ8oyAifM42KlwW8svtX2bV7WiLCbq7Jc0e1+BdqmvhYjH8x+gW1Lu0noneeg2XhGcSwmYrDU5VUzVAeikvqeAtJRy94eSqAaCHb1veib2Hlx8w+sD8DLTe0xEMdrW422HIcJoEUSNqhneFzfvygYThIXMxQS3XDTHOPl+ncd4PbTmgfzgLlE+zOa/x8j195ljpYklBDVJ2l8SRQ65WrN1kRDDRYdPt+xBo04Eng05mbPHR/aWOgaDxQayWz3+wGYeitK8KO0qgy/uZp3sOrK0Vqv7tk1IFYC7GoQ1IfP5G9qnZEm0jnmw78Al59HSpIHj1Tqfhmdw4/s03v58GGzS3qwYTGokHa0nul8xnvB79fLZCC2H96GYUkiR8smfSM2abswS2NGd5+OBsOR8JSbyONZHgX8oCwb4PzCf0rlAKBwnK71xLR79mKTAQyDovRxe2KpEubXXFbMNPfyqGzc9ruI/QfOv/imkhWDhOu/LI9haf/gJ3R+1ZDO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(6506007)(36756003)(6666004)(186003)(53546011)(6512007)(26005)(6486002)(478600001)(38100700002)(82960400001)(31696002)(86362001)(83380400001)(2616005)(4744005)(6862004)(8936002)(5660300002)(31686004)(2906002)(66556008)(66946007)(316002)(4326008)(66476007)(8676002)(54906003)(37006003)(41300700001)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJ6RFhFd2tUVE1ESnQ3UjZrclhiMHFKOE8zR3V1eXVSSjdQSi9RZmxKOEpx?=
 =?utf-8?B?UUc0MGtsTS8va2Nid05Ha0Z2bjltL25MejdSdTczdk11TFB3VWswcDgxUXZI?=
 =?utf-8?B?Ny9KaVpQZmNuS0dwYWQ2MW5QUzV0eml4NThPWDhxanhDcTZIVVBOTnVkRmUw?=
 =?utf-8?B?aS9Jb2d1eFc3TDVoenNBcktPQXA5NWJuTkRML0g5RDkrTU1kYVZTcmtuSmpz?=
 =?utf-8?B?YWVwV0VjVm5XdzFTajhZUDNzVXljVmJ2L3M5aFRBK0xDV2ViNTEvbnZQU0RR?=
 =?utf-8?B?ZmhZUlJJMFhYSy9FblBEMDhadUU5cG04R01KUlBLRW5oMytaalNnL3lGMzVB?=
 =?utf-8?B?cE8wSExIeGZFUXVLR3Z6SzVtRnlRSSt3dUhhcjNaR05ucEJhTXdYREx4ZU53?=
 =?utf-8?B?SkNYaWxHaHJZa2ZWS2JvWHdsak9sNUlCMnZGa0Y2OEsrejNoRUs5ZmR3UTlL?=
 =?utf-8?B?clJpMEVwR0N0VEYyb3A0bmdYcGhvdllrUDBmdFU2R1VHMFV4YVo4eXVxUlZq?=
 =?utf-8?B?aE8yUHFyWUxZcysyN3hUSWo5SVJRczRLRWlHSXBhajJSekQxM2hRWk9UbGxI?=
 =?utf-8?B?bVlKZFRoOTZYUmdmcVBLUWxJcExNa0xZOG9WRXBLeXVzSm5SU1VKUzAzdGhT?=
 =?utf-8?B?YS95V0k5eWEvTXFSRk9YZk1OQ2Y0aVFTVXFUb0ErSjlhQ0U3MVVrV2lzM0pN?=
 =?utf-8?B?RmQ0UE83endBN2pHL3ZyUmRFTUNkbWg3cklTc0phV0ZMYjVwM2ZYQkR3NDFE?=
 =?utf-8?B?eVZldU95ZmE0U0RENVcwSS9FRlNqR0wyTWRoOTdCQnJvYzhKU1l4MkpUanE5?=
 =?utf-8?B?RGErVDg1Y2FIaldkamlCNmNzbEhjbDNweU1RMjZpNTVhaUZHRERPalpQZWpV?=
 =?utf-8?B?eU1SV0Y1QVpyTHUvcDRVNlVkekdQUjd4cjF1NFl0ck5YRG1GME5vUlYrTWlk?=
 =?utf-8?B?Y1VPTVhEQ2NDNm01M3JUUU91b0VRQStrYnlwakpGVGl2am9EUEVkSkl0aGxE?=
 =?utf-8?B?b2crcnhLUGdtTUVvOUFRTXpSaXVmc3pld1lkdlJqRFpzRkMrOHhhcGR2QWVh?=
 =?utf-8?B?Ykl3TnZJQkU4cVpZZWgyaWhsMm9maXRhWTFUak5BZGExMVIrMldEVHZlNzJ1?=
 =?utf-8?B?U2s3UlMrOFA2WUxwbWt0VXRzdXZrS3p3bEcwekk2UVRNRnM5MXdtRzZQeEtn?=
 =?utf-8?B?VjZZbEkzL1p6NklJVHIvUk90dHdGanhJZElidW5VdjQwUExMRGxkaHNHUk9u?=
 =?utf-8?B?VERMR0xkaXdITGIwTXRMNjY2V1o4czVyZGZrSk9RbkgyWFZDQkptWUpsdmp3?=
 =?utf-8?B?bUtVa29XcE9lNm1qMVFqTW40a2ZSYW8rRnJUekhPN1pxZzJhTGpiWkIwQzM5?=
 =?utf-8?B?NUtHZ0NvdFJrTGdCa0txeE5IRmdvbW91SWxsMEFueEhDaDZHRHpjTGV3WGgx?=
 =?utf-8?B?cUlaQjEwYVkrSW9DNEIzamVRWVF0SXBxT2Q0S01ZRWF1WTlNTkd0K1FxRjdr?=
 =?utf-8?B?V29NTkRqTHQ4SGZPcnJLbHJnU1ptdE5Gb004MUZvMVBmd2IyQWlsTFBKcS9D?=
 =?utf-8?B?ZDFNQkc2OUtRaVNlWkc3Y0toZUoxam5sMXR6NnJyMytPRG9UUk10R0lPSTlD?=
 =?utf-8?B?RWV2THpEdnVwa1paWWcrR05NOWZWbXBlQjh6YlVuRnZ0ODNyZ2dDSmROUEdC?=
 =?utf-8?B?SStHQW1QbjNSRTRtL3k5clF2UHd2RlFTS29ZZEFNeVpXeTh2WWVLK281eVZP?=
 =?utf-8?B?U0cxcVhDNmxVYno5Wm96aHVIUUZyZnU2c2MxY2RJbFU5ckJtWnFDa0Y0dmo5?=
 =?utf-8?B?YmpReGJQdndYV3ppTmtSeGp2aXZiMHNyUzJvK0dLT1kxdXVNZ1hrTC83RVR5?=
 =?utf-8?B?OVhld0NJM0hRTFRDT09HMFBVcmtHVG82b0Zqc1JZL1I0Q29UVzlhNU41OE9m?=
 =?utf-8?B?eHRmOEFGYnVVRlVwOTQza0FVb2pPc1lhTkMzUjhpKy9SQ1pUdHdpQ0d3emlx?=
 =?utf-8?B?bVpKOXVBSTBJYzlnY1k2WnRkREU5ei9Jamo5TDVOUzZVMU15czh2Q0RON0xw?=
 =?utf-8?B?YWdZWGxZQzRsVEVMZ0M3SWhGalRCVzF5S1g2OGxBNHVISlVJenRKZ0p3SDNx?=
 =?utf-8?B?V0pjVTU2RTYvUVV3RWkzTXVha2RNNHdRYWd6VGVWTFRMSG9ieklYTWI4Smdk?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9ed6fb-3a34-4939-1bc7-08daf5216112
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 04:48:13.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGSJlg0Kn8gWqsRY11MUVxqD5lq+k6anapaLE0OI92HzLibO9xclQ4al/xtnAzZ4SRdkkPjE7LuRjnatKf6p2/46U8Q2G42d0Q5vgGplhjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
X-OriginatorOrg: intel.com
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/12/2023 8:37 PM, Dixit, Ashutosh wrote:
> On Thu, 12 Jan 2023 20:26:34 -0800, Belgaumkar, Vinay wrote:
>> I think the ABI was changed by the patch mentioned in the commit
>> (a8a4f0467d70).
> The ABI was originally changed in 80cf8af17af04 and 56a709cf77468.

Yes, you are right. @Andi, did we have a plan to update the IGT tests 
that use these interfaces to properly refer to the per GT entries as 
well? They now receive average values instead of absolute, hence will 
fail on a multi-GT device.

Thanks,

Vinay.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29826EF9BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA7110E267;
	Wed, 26 Apr 2023 18:01:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029B310E260;
 Wed, 26 Apr 2023 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682532105; x=1714068105;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O4hQRVMVgSis15GsSFNHRH8/MEYO6grPERvL3HIikC0=;
 b=bVNx+tDSfC8EHpibu/7OP1ef+ftyS8PhsOyE3cPfeKB1RNEfPj0PUENw
 sP4Kq4hKflpfJ/WYKKTDT8aZhz5Zi7mVdBlN21k9qz8NXNz+GZ0Q3b486
 gpAs/P54kgzsnnV2sW1tdv5AqooRyTchO5BVttG4a1a136zOSjhQ6GHm9
 xxiFZhJxic4eoR4iMKAqr2DGtoKLUI2dwBGiUmvpONPUVP11BOTTmmWyQ
 yb1cufzLKdPPwOjwaEblef9j5hBxLhNXWlWlkaNOrCJSzK9PPHG/TZdgU
 QInzN+4D+KiIgNRFUhlddwNPkLw4WhGs7Tb7TgIgMemJSxfTHcns2Mq6L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410208689"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="410208689"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 11:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="671424653"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="671424653"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 26 Apr 2023 11:01:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 11:01:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 11:01:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 11:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWUsRXuqe3BohZyrMRs2bgbTpEfgPDKk/IXWURLvRl+RkRb00GD3Uwn7k2OEzAGOmut0Nc6f/UY9jjcLwN1GzjSTLvfdRRYswIU16ERKikfTSu1IIuiFcEp4lbU5WFzeRCVZaASavGSquYk5xVSxTC1EHb+jNEnIsn7x1EnpV+xsBrrFWzY8ts485x+UyJR5XTrfK5TilL+VNAUzP2KSflJShsrIfplKrxfWMgbnmqdxOngrsxnfR/Jz64GlIw6Cd5/joKXXereCPPLZflh0MauJK7Z4xZ9sbJSzfVb7GbAIp0xpr0imGYcdHqCvsHLWhOZPAKjuFf/peXoKsKEa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZhXuqd7CwhaoB0/+VwvZOoiEDZfeu1E9HFAMCwc5mI=;
 b=k/3uutlMFh/gn7nhVL6hHuWYvWARYYWupnVO9Tr47Y/ysa13h5xqcQ2VmxFTsLkYK1r2UvV+fagIbxvceo84wED4PaCGU+YR/aB5R0sQbvjgGFIyKQQwQIGBc1CjpfvnQ6icBkQS0R171B6noucGJpQ2HDWl9BbNpzu0KOl1mhwozUEr9WZfqQq8FL1emsDthpAN4oxqZUUV9IsJihpEM4KRlwCWZxHgt2ZuLk+DJXvA3MArSfwjvRQ/AzGhjuoNvXpB3qY7fFoCalQIq/XcuG+by4RhEmNHIv78Hnsp7y7zbJynT9V3wVIMZLNlfgd40ESaWHpuP+/tFA1+/P8lLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL3PR11MB5683.namprd11.prod.outlook.com (2603:10b6:208:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 18:01:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3%5]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 18:01:40 +0000
Message-ID: <e9276481-0365-3c8f-6c35-5f9165be3fa5@intel.com>
Date: Wed, 26 Apr 2023 11:01:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/guc: Capture list clean up - 2
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-4-John.C.Harrison@Intel.com>
 <f5e1467bf61cafebd14a1b89cd7a1fc6d715f55e.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f5e1467bf61cafebd14a1b89cd7a1fc6d715f55e.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL3PR11MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: f624071b-3d4b-4d3c-2233-08db46804947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6RRVe9DXlKYlQUnmtG8ToePMOKpWwx9LYAdHc5HboW6LWxvVrxk/T3axgvtT1O/I/aFlFd4bFbvtig2c0luvYvqZJcm1+xGouMWpghx10TNJu1NAf4/XlYMs3cfmW/jZBOwY8Ea7Ko87ydGMjM8/GD0BUJlmnlM9BZiCqppu0HTQCSKg0lLsPeEy35/mVqCxyuJSofZk1B8hsIysMw1bggMs2YJ2nQXZgPIPvCt/3a5C2e2CQv6Aju9IJpjRzPWMxZGs2ZUSFCzyw7rTSxZRW/bbMZZrjNb05YgeNNZ9kphLvO2rMMfdsY8MVcjoM5/CBtmm0Ep3nTMVIvupIgi3/uQe+UI+Y+rRHXRnEVaZ6BXTi5SnB02bVxFlvk45LRIN2B+t9GxzmIdmxr+k6tWPyP2HCFcyqQ0Dgunam4sXjbBZbAGZRt54Tdy0VxAt/PIUDQi2SFJ+GmcN/jzKhBLnX3TMdVKNG87jTGvcNVEVCHzmvBo9RxsXlryp99+MEA8Kjn0BkuJcfhPEJjf6xtvPI4V4sOnTUq6UofvFffaLYcXnGpwFuoxjeS74CAPHBuQ/+XIk+YAQq1uqGFhIEe0+ieEsMIh7PzDwFPvrfqMWk8uWgdq/XjylJ5xSwNVICpsAgXC/toOjZfrK5+yqHc2yuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(66946007)(66556008)(66476007)(316002)(110136005)(4326008)(450100002)(5660300002)(82960400001)(41300700001)(8936002)(8676002)(2906002)(4744005)(38100700002)(186003)(53546011)(31696002)(6512007)(6506007)(26005)(83380400001)(36756003)(31686004)(86362001)(2616005)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm13TDJNT3RVMkZmLzNGbkcwMWZIZ09vcWF5czFpYlZ3WmNXTUYwbXdQY1FK?=
 =?utf-8?B?VkJIUGViYVVVQzc2aUNZOFRqL1M1UVd3eUtwaERmb1BNYnFReVdHSW82d013?=
 =?utf-8?B?VTVLN2lNaUxVOXFPUU00Mm5STVNpTVZwNEgvYUV0V0hHaUtuWDN3QS9LMEZx?=
 =?utf-8?B?UzdvU0J2UlQyNDE1dGlqaTdDRUR4SkN0bkM5ZTJITG04THFCSXV1OHFGZFBM?=
 =?utf-8?B?MmU0Zmd4b3RtRElYclVjVityelZjN0NvclJiL28rNkQvY1phMEVCSUszTHpN?=
 =?utf-8?B?bjB6alFycmNpYmxXazVuWVd2M2tOcmJaQjdXei9VZ1BLTUl0cFJ0Ykd3WWMx?=
 =?utf-8?B?WjR2V0VlczhCeCtHakpFelU1K0ZYbEl2WkE4ZzcyT0FtaHQxc1BjWVo0eWF0?=
 =?utf-8?B?c1ZWam1ORVAwOXpxMC90enhCL1lYZzNjQWJLT0tmVkNMVXN3UkNjTmtnQnNQ?=
 =?utf-8?B?Y2tGTndFQXpUTm9IQWJZd0VJa2ZkU3dHeU5GNjFYaVRhQ2xPVFFJM1BkcWJn?=
 =?utf-8?B?bVkxVE03RXdXc1A5dmVCNTBMUmpUNWg0WVlFTzA5cWlyRUpPeTdmSG1wUTA3?=
 =?utf-8?B?U2NFNUJpSGNTODN6YkUzeFVVRyt3b3Nqd3lOSW15eHhYZzd5ODhmQnV0QVM5?=
 =?utf-8?B?RjU3UzFTa2FiRi9iQWFKVGtDWEE4MkdWN2VuN1pTR0VTNHNUSzZ6TmNHN0Mv?=
 =?utf-8?B?Qnc4bDJyU2YwOGpDeEdzS3c0dHNOYng2QStyRVRYcVZoN0VYWWFRQ1VNMkhJ?=
 =?utf-8?B?VEp6RTJnSWM2bEtwVGZ4TnZ5cGlpZHhpSTBNdEtQRzd3RndmZ2RjVithOG9r?=
 =?utf-8?B?V1ZZK1czYlF2UFdoY2FJbzA2YWNReDNRb2EvWTljMURnNnZvU2E4V1NuWXAx?=
 =?utf-8?B?NDk1RFVCalkzYVR1VlhVRmhUWXh4bmNmcm53WE5MK29vNlY5VjFmaE9iUVBZ?=
 =?utf-8?B?c3B6eGtiOWhrUHFpV2YwaFpGb1pDTUlJdTZneUljZmdTdUlrRko0UDVVUXZZ?=
 =?utf-8?B?M1dCMlFNVlpHS1dMdlJ5U1UvSW5GRWtVUWwycSt4ZzlESDM4SytORDc3cEpC?=
 =?utf-8?B?QU5MekxJdmJXY0g2ZnhEYlpLK2hubFZ0VTI5aGJ5dTVYQjNBS0ZGa082TG5u?=
 =?utf-8?B?a3pWR1RIckd2RnFjWXZYZWNObVduTjl5QUdQYXlUYnB3eXB5RFdkQjFiM1Y2?=
 =?utf-8?B?OWR0MXZOVFhCS3dMMGJVS2M5RXRwQzVDVW9CSEVNN0dQalBoMnhta1JUN0Ro?=
 =?utf-8?B?emZOQ1RkeHkxZDQ5UXNTcGY3Nk5oVTM1bVJuNm0zanNqY2lEL0VhSC9LV3pa?=
 =?utf-8?B?djhlVjg5ODVEbGxKTUJkdytibTEya2xEa1ZBQWZMTUY3b0J6Qnk4VUFEeEVk?=
 =?utf-8?B?b0p5UWFRczM3Vzl0bzJYMkRhdTh0M3RsVFdHZzNURG90OU92UUhmM2hzMHQx?=
 =?utf-8?B?RURCN0NYeGs0MG5qb3JVU3RORHdwNWgyWjBVSnFYQ3kxcE9JdWdqTFBDM3ow?=
 =?utf-8?B?YkZUVTNlMHFFTmNvVmt2eEo2V3Rxb3gybXYwZW1BaytuWTZBazNuemRoY3pz?=
 =?utf-8?B?TUE2UDdkeTJsVmZROVRIWUpkQVI1YUVZcmd5M29rTS9IeWhaTDhlZWtUMmYr?=
 =?utf-8?B?M0RDTCtFNEgvKzVjcFFmc2c1TVZza3BPN3liTWt2WnRGRWw4djJab2IrNFFS?=
 =?utf-8?B?WlZEc2V3V3AwMmx0T3F0Q1JqbCtTMVNpNlI3d3RwSWRIM2l2WjRrQnRDTnVB?=
 =?utf-8?B?VE9hVnJIVXBPVXpoQmp5L00vRFAyNjZCOUtSTFkxeHFGUDAyMXNKU0pNMk8w?=
 =?utf-8?B?UzhYNVRQeHJYeFlJeDBWYXlsaUFlUFNQVldpUHpzM09JckxRVmhkcEc4aUta?=
 =?utf-8?B?WmZ4WDlrcjk3dE16SWRPdzByL1p5VmYvQVJYUDkyRDBVT1Z0dEtYSDI1akxY?=
 =?utf-8?B?WkZHenVKR0txcXVPR0kwS1NPY1BQTTZscmUwVUZpZW9IeUdFOFdXZHVQZ2Fi?=
 =?utf-8?B?MWx1ZFpvMW95c3dZOGVxTmhXcm4vVDNwcXQzMURXWkp5N0thTG9Pa25sTUoz?=
 =?utf-8?B?Z1FzZ2krdEc1Zm1vSU1jaEgrYytpMDR0N3YwVnNJUTRCdmFTMXdhcGdOalFT?=
 =?utf-8?B?em9UQkVNK1JFbUFsRlhKRzU0NDV1QWRLdDhwenJpMGNGY2RlYnZ2Q0FvaTUv?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f624071b-3d4b-4d3c-2233-08db46804947
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 18:01:40.7409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnELbtioimTwgVK5XL3paej0gyvRFtzAuTQws8tmT/zOn42iMIju+nxAYUN8or9jGqnYCyG3o1PmhrlKIlqDXZdb5FlIM2xz5MVTQR8y+k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5683
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/2023 11:54, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-04-06 at 15:26 -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Don't use 'xe_lp*' prefixes for register lists that are common with
>> Gen8.
> alan:snip
>
>
>> @@ -177,32 +177,32 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
>>   static const struct __guc_mmio_reg_descr_group default_lists[] = {
> alan:snip
>> -	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
> alan: i missed from the review of Daniele's GSC enabling patch - thanks for catching this.
Hmm. That should have been a separate patch. Or at least called out 
separately in the commit message. Will add a comment about it.

John.

>>   	{}
>>   };
>>
>>
> simple patch - all looks good:
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>


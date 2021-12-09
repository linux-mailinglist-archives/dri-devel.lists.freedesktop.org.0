Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C512546F3E8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 20:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9988210E275;
	Thu,  9 Dec 2021 19:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AEB10E270;
 Thu,  9 Dec 2021 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639077976; x=1670613976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RFtOBT/xryMDRsmVwFlHvQzluZ3JFqYoU5ERiDHtqgA=;
 b=UE3Y0/8zwlFGG5cjB0oMWlHiuJ3EsGFf17gJt5ze7CKTztf2QC5dnRGM
 S5pkCnk9gaFNqzT3ZKDy0E5q/JOepczcyc7OtmL3bEKa5U2BHXIXaaqSi
 jsvv5Jybncfy+e9Dbho+DA+ejK/P+tAglhflnaTQLCH4Eqz7iCOZN1J5f
 EgxR7IdaTa0u+OvYqR7c+GfvP//Tc8OxX2rAmYG3JsuGTibzD8lFj0xLh
 +3070FqEG1D+NY0RlVFJOV7fAV8Dp72uoB8mZeMOuEO01oNTgOzx5KUMR
 QJyjBlpwUhEoEb/qFDYt9nHn4J0ieZgLOBn4kYaGDmd3CJWCSAERwpvSw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="324451900"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="324451900"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 11:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="601673658"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2021 11:26:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 11:26:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 11:26:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 9 Dec 2021 11:26:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 9 Dec 2021 11:26:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWrm7KYmXJnNJj+xhmt2AOMex4Z4zE4gBpKcMLEHEkmG5T9KHj/kBEij4Zf7RmDT4JKmOGEqIF2uyd7lkkeFSFckk35RLOuAzxlmJCKW8YqmGYeiBvdi+C2EbBVuYlcBlyPgAKa2CiNoXvY2W9B2srmZC5Jm0KeqyXPzohzCzG9LvmJb0vXOWAhlPDP7+YXpiM4lc08HqKfSl7bE4pYHey/KIBBbfUaW1V2lNk/1xuLU9BrT/HRfNkTz+dv1bXupC7riQoSymoFAR5klCl0e34u098D2W7+DxoyoQ4veiM9bxoyu5YbGqU8NUx2sINwQ3h2lmnHHQlC/ZGdqORNClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtOl8gm0zbiM9/eWwKArSxbpfu6e1H4NPr/qd5unkjo=;
 b=Aqrbya5H+biJagr3ER4SWcqwX5JO3nIelnZhWKFrUlYJUk4zgMk6bvDnoGa9hSgogVTawbTGNRaju4rHgJg+CeF5wkncF/CUYH+GICP9qN5mXzMEzgWIRYs9VOqwmbXOIVLz6CWr2XwGUnLPI8RYI0nocHtQZnaGEE3KYK8J72LxjiCcHgmUgbz6B/d8y52kONZGn/Qe+zre1GzMzhtJNF+RX+MC9Ie3hMVknmfb/gR2OSqej5eV/ONC0Ok3eoijwbzY7ZvkMGlKI+BuZt27x2hqrH63sfYBGw4nu16qshWoRDRt2iIqNstONSZMDaWEJG2LK4+k/qBJXf2f6gkB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtOl8gm0zbiM9/eWwKArSxbpfu6e1H4NPr/qd5unkjo=;
 b=sMu4aRCt0rzggY73R0hXf++ZTDmbW8mi43Rsnl6ZD0/8bJwimEqzCu9jxh92TbrIew7Rm3ahsDQTEQp3BBTEqBwftuuaLMlWjDAbcqxmkWjHcdLq3x3p68mU73PpKafmeV5fvj3n3RmN4suWJBsH/4mjYvSzen+D7/xakZHHT68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Thu, 9 Dec 2021 19:26:12 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24%4]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 19:26:12 +0000
Message-ID: <a6b95ad6-4c50-ff97-99ac-dc2a75625de9@intel.com>
Date: Thu, 9 Dec 2021 11:26:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/i915/guc: Remove racey GEM_BUG_ON
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211209185141.21292-1-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211209185141.21292-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR13CA0055.namprd13.prod.outlook.com (2603:10b6:a03:2c2::30) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 19:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df3b250e-c0be-4272-526d-08d9bb49c296
X-MS-TrafficTypeDiagnostic: DM6PR11MB4691:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB4691020420A1955B3E8BA2A6F4709@DM6PR11MB4691.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rI6TmrVHviJX7D5ZGh5PdPGIDh5yVb72cL8CXgtSzctzKK8YaIOwb6K3XDzWAzxUPu3ifHwrzBhXD6PTQDmSk0ezz2AI7gDKmgwclocmzzk9+lHjj3SuzdCiuuIcsgfJeTENDN6DyopIDle2JdXzUXCliS1tUntADHwQLhr5iTfhfVz4Qck8ro1KNHZ3oH7anAXYb6Grtp4n39lljsKWkBuntHDDO4Kh1wxsovwc2joyZSkQy19EGvRsIZXYocnxlbQ2gOChEiB5jWizsoukSs6PtdYVGjQUZDLjYS7EABB0IKBGKQhhx92olb0Jorh+sOmBbxpRrkhSCn1gDdstlepVzr+pd/vl9zbrfxfWRFHZGhKhHZ6Dfbxz90Wnevuvqz+8au2fLG4OU+YZqfbJajaIzk3l7hdoi62V1+mLOxukniyJQDS1EAt3IatmuJs/qC5UatFBUA+ahPB0JVhkuE+kojMTGxWXKYTQYeprcdkzeJdJBzpjifRE6g/6Lv7wJCWXWvbcuGe9EIi9SbFJ06FEY+jQSKRKerTPbnpxOjxuuHbvz+45nOU83Q7cMOrzOMH8ceKMQVyxWFQX/1KC54Ag4zF072MXpkZNTau9rsKs4bFZitmiaWs5DsGScvjOYrA5Vg3LIlc1pj/Q6qYE4kvb+wwWu8j5WDj0nNfS7jtToiIAl3X7d/S3DHlmDg3HFVJ6zkMiXi+CVKkAYydHmYOUhuGQi63RFa8vXmkKehzzW88aVotSxXYhEXISFdj3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(450100002)(66946007)(956004)(38100700002)(508600001)(8676002)(53546011)(2616005)(6486002)(86362001)(82960400001)(31686004)(83380400001)(316002)(36756003)(26005)(5660300002)(8936002)(66556008)(2906002)(66476007)(4326008)(16576012)(31696002)(107886003)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azllRGtFMDRoRGRkaWh6cktYNXRHakZRU29meXhVYTRGdWx6QUlOODFzS0wx?=
 =?utf-8?B?V1JqNWIrZEErVVVoV0FsdjArRU1uSXhXTTBFTG91ZjgzMW1IVEIzU1RWTlda?=
 =?utf-8?B?dlFaVXlQQ0JlL094WENsNE9KWjlpZ0pOMGhidDc3Z0JKYU5TM1AyTnRyWHZQ?=
 =?utf-8?B?eDE5YkNDTitKY2VzK2JHVExNS3B6NGlmV0RXVDk1bjV2ekhvT1gvZHdlS3Fv?=
 =?utf-8?B?UUVwNGFkUjNYeDFoRTBFRmlOZ1FUbEZPT1YvNnU4elBNekNjUE82ZGpiRGhT?=
 =?utf-8?B?ZW5zV2lsTU9lVldZZjY5TUgwbTFVVTBFWmJWc3dkckZaRll2TlAydjZ4blJG?=
 =?utf-8?B?Wk03dTR4cXNSTnhYUm4rQjkrcC9GNnZ0ZXo1d3RsbFpoS0oyK3liczQzVFRl?=
 =?utf-8?B?WXBGVVc1Mk1PWTUzMDF1ZDlpVXpIT3pHb1p3Nm9QekJtV1FyaENVTmpyQ25x?=
 =?utf-8?B?cXorM003aHZ2ZDI0S1U0S1lqdzBnR1BXNDVXNUF6YkQ5ekRGdVRKWG9EcWdZ?=
 =?utf-8?B?WHlXR1ZoTk9qNkxZcVpmQ05QYUh3WlNRUnRtWDMyUk45VVJMc3hKdlVtQVNI?=
 =?utf-8?B?RXhWRjBieTZRUjRuMHp2MVFqWUE1eTlvK1ZlWVlEMGduMWttZnVLYzg0MllP?=
 =?utf-8?B?WWMvVytWNDdxRTRGUHM3ODYxTVEzd2g2RlZUMTR4WTBiaWtneENjc2VWV2V1?=
 =?utf-8?B?R05aY1hiOEJqakxpY0ZIejhmcWVIQiswb0FadVNSSFJEQXpqSmdTb1ZGM001?=
 =?utf-8?B?dE0wdWhRTlk5cnN1NGptMGFkckVKbTUyYVl1a1hPUFV4ckI5TEIxeHB1QVdC?=
 =?utf-8?B?ZG5JV3hINGRxWkJMeXRsaTVYLzMxS0NTVzQvd2dwMm1NQjNmbGNldGQwS3Vn?=
 =?utf-8?B?cUhzUDlqYWsrS0ltditVMU85V2JqNmN0SmJaTm9HS28wV1dQR2RvaG1RbWxo?=
 =?utf-8?B?WXFOVU1DczQvQ0NuRER3QTc4eG50dWVGWVExSXIvVkRhWFh2SnEyek1vT2g3?=
 =?utf-8?B?UC9VZnd2QkhoRHU4emR6aVpnc1V2STJFRVdYRVFwRWlBeHYvbFhBM1Z3Z0tO?=
 =?utf-8?B?Q1c5OXFxdFNkZktRaGJsR2F4eU9NS3p2bGk0blhCU0VUeDE5LzFIYTM1SUtC?=
 =?utf-8?B?OFNEYmk0aUxkM2RXeS9TTmFmVXpzVWxRZUVnc3paNTkrRlVQQU1uc3J1dERO?=
 =?utf-8?B?U0JwVG0zWWM4UFFqZFl0N3hjUjJQaXFaWFJib0I0Rk5mdncxbEkwc0k5Vllq?=
 =?utf-8?B?Y2ZRS0N1YXlaQ1hLd21haDBnR0VrNnpzdVV0SVIrTzhiamZHcFhXNjBEekRB?=
 =?utf-8?B?RVQ0OCtPNzY0RkM3K0FnZnF0THlKeHVVQWVramNOcjk2NUZ0bEtaRzJ6Witq?=
 =?utf-8?B?ajZuU1orN3dZOVIzWWZ6OTNvbXRRY2xOcGJXN0pjSUJ6MlE5WGdtd1JxdFc5?=
 =?utf-8?B?Rm42L2ZBaVlGcFRXNno5ZHNKeWlsdUNuNmlTWXQ1c3VELzBRWUVpRnB1eVJH?=
 =?utf-8?B?UEtVMzVVOThyVXZqN0orZGJaMnpHU0gvYUE1cUwvb0FLQUlIR0dQaXA4clVq?=
 =?utf-8?B?ZENoK1lmcFRUdmdSZXVKbUpXamlGWWZLdktvSGxITXc5dk92WHRUNVlTS2Vl?=
 =?utf-8?B?cC85YUJlMG5veHMyb2YvK1ZzRVRqQXFCTS9iN256UFhDdHFkR3VJcis3VnhG?=
 =?utf-8?B?TndrN1RGa2dUS3lKcDhSTG4xNTMycWl1b0NCZE9Da09ROG05amwxazBObWhO?=
 =?utf-8?B?bFN3aGEvYlcvdDE0YXBkL29tb05wM1F6dHd1ZGtXMlNmMjdJRHJnZ1M1Mk1n?=
 =?utf-8?B?OW8rQkVZWGVEWFgrcTgwRC94L3graHhmNkJ0Ujh1YStkbDJ3VlhpakxUaUVD?=
 =?utf-8?B?WjN5TGlNRHFpbHFBVWlsNnU5RUtxc1Z6dHVJVTNBRUcxbE9ySldOWm9oYml0?=
 =?utf-8?B?Ti9KL0JHWTVFNVNUbkwwN21qWEpoM2Z1b1NtcHNDeFM2SHhTWmFaMWJja2JQ?=
 =?utf-8?B?b1VHaC95MldvOU1tVExPZXdZOTA4T2Nwbkd2VGRPMHFXSkxQdmhCMU9HOWU2?=
 =?utf-8?B?Y20zbGVwOTZHOWNEeVN5b2FFZGg0S1VMS0FCUVNOdXE5YkFUNG1rTFZIdklS?=
 =?utf-8?B?U0prQnQ2akFZOXY2VXdwaS85d2JaQkZKcFNza2htN3hFSEJhaVN1MUxDdmxv?=
 =?utf-8?B?WTF1Zno5K1VleFdHbkZTODdBOFRoSnQ2ZHNlTEdtSnZhRmxyTGttazFuMS9i?=
 =?utf-8?B?NFFvZkRNODVQUDhzWVNYYUFvUTNRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df3b250e-c0be-4272-526d-08d9bb49c296
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 19:26:12.2679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRuF46d4ChoDOg+rOtLT3CDXqj15RNHzthcYySJh2bcWC/V/ON0OWgXFuHNRskk20VXG47E1UtQAgiOz0gn2iKWJ/3Gla4WRas/LDvppkPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/9/2021 10:51 AM, Matthew Brost wrote:
> A full GT can race with the last context put resulting in the context
> ref count being zero but the destroyed bit not yet being set. Remove
> GEM_BUG_ON in scrub_guc_desc_for_outstanding_g2h that asserts the
> destroyed bit must be set in ref count is zero.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9b7b4f4e0d91..0f99bb83293a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1040,8 +1040,6 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   
>   		spin_unlock(&ce->guc_state.lock);
>   
> -		GEM_BUG_ON(!do_put && !destroyed);
> -

Do we need to re-queue/flush the destroyer work to make sure it runs 
before we reset, or is it ok for that to run in parallel?

Daniele

>   		if (pending_enable || destroyed || deregister) {
>   			decr_outstanding_submission_g2h(guc);
>   			if (deregister)


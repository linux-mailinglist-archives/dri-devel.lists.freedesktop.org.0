Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9927E7287
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 21:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0D310E900;
	Thu,  9 Nov 2023 20:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49AE10E8FD;
 Thu,  9 Nov 2023 20:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699560138; x=1731096138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hTRoSgSfArQnKvNgBo+DkHhLRo3/CwYYBoEVgHTNiew=;
 b=Zz2sgpZZYNbFIujHUAU81mImaO+h6aA6j+NHPMeyM8lE7LtQY353cUDd
 rZNGwpcSsotlia2ryBgXSVeBnG7bwJNO3RBiuN4yH9B1B19sjIWmKCgXh
 e0a6hHhb1uQpM9P7r9uXLXHaI3LAl+Ezv6LtDx16lxevDejMfQrBtag0Y
 qwEtmA/ZT7TQd6mYaIAWf+pcVREYOULpDw5yGbTSNR5J2rbUCnNiKmxcd
 7WDbFObHKa4wCmVGOVs+/PawUAZjjOfFjrNGMz2IOGWWvfuKUt4KTmtrE
 wMduOTxU3edXbLIcgK8YZGJKFMrnjG7p5tZtJ0m4NXmU9p9UL8OzfSowL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393974125"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="393974125"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 12:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="880713288"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="880713288"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 12:02:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 12:01:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 12:01:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 12:01:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=di55xt8l8e4zkJ3lkC1r6bpsTPT5O7Rv/q7Ea6DhVCGCou6H8XLZw856bDet54/Yqc0Pwgdc8F6Y+e40RpdlNRs4+XL6j1tdJGe0E1K8u+94Qf0s4D8YjybsToww16MRJE/HdxOtl0zQvRy8c7x7+t0jkWj2FLhXRteO+bFiQhWVTaPxm4P9tsO4FlMGDpjIf+4AiuqKe/T7lD6ZqfGv5GSI9lQeTlIzfJQNMGyqW8fLnZ7VSJvmd2/KIhJctn0Pe/6RKrIqaAOX96QOAwEUWituNm9Vk0V649gW8VR4aVlhy7IP1Av+hG3ejdrhn+weIPEWB+6Hk/TdaSMDSckCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7+pPSOSToidOKxR7gC9NOm1RR7msvR5XcuvSXtdUuo=;
 b=ir9RTgTusvgLrp6B/r/KGtZAh7FgX3hUrKWrPx1hD62FbXNqW7szFG6A3j6S9EMnqkSJAV84OW2RwS010xrzbS5SejemWvDT3fZ4iVnWxPIP38y2jQ3VuPdDSls7eW92lZk/0SfpWblnXRJS5Cv4XpEyKWbn2gCtEE2QX8YzvyfpCt4YIj2oTxypQTM3ntoh6K9KlaCNiRTFxJu3kVWuM6H/FupVqTIXniYCDQ7gQCFIUmdAnarxEfAPkfziKyLlZ70n3kGt/hncuANlt/voXnoWVFS61ZKZNhFk9j0pD4jK9rhGA/7Nxbm+qw/hvAbPUvgDO4ClZgV1Wkm9dXR4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Thu, 9 Nov
 2023 20:01:29 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%6]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 20:01:29 +0000
Message-ID: <72f09667-24d5-403a-ba9a-3465c681fec3@intel.com>
Date: Thu, 9 Nov 2023 12:01:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Read a shadowed mmio register for
 ggtt flush
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231109192148.475156-1-vinay.belgaumkar@intel.com>
 <ZU0zYaFkpZJoUcZE@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZU0zYaFkpZJoUcZE@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR15CA0160.namprd15.prod.outlook.com
 (2603:10b6:930:67::28) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 50870430-7c48-4832-6602-08dbe15ea98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b/+8mZDwta9u9wZy84hINQma7Rq8G7ClqafIb9RzPDO64H43fWf/1eKQKVRQw2cuCMusvV1VXc7/w5cy4qhGAos86GNmtR/kJYPuHCubMZGzvJSAgfiOfqsVoAOcdMC59DmqoKZBTXuc8cQkQnmQWgapkNz+df+4ilzjHJBZg2vwmPQGDS3Uh2h8jai5uZ8daL0fuwX/1kr4wirHLNLeteJZQe6x8tEFfFxkSlz8tm9mRURz7s3/d+y62Gcw71lhPeFEgfuLFe350Hy8/zVYHMUw93ZdRy5tzSc6x1vFVKqEygYv5GBoDs96xUOcyN81PCP3+znC4lSfnQUxRUSM/BLfLDa2JOqt7g9BKIpw3WXeHfMBWeXQDa7EKkb4iiUPzzEmR1vKyAgihK6YBxB/jReHHaMmF8RAYhGoHbyl009kkEN/W2njWiqIJ2GXUE6tCLutdm5Wxe/LAl2RMoWP0Ji4eE/wAe+P8GMTIIZ4S+CN8I7eMC5ENBAMqETwo07uhkDWINJNbklUlSpJvM3lqOdUv0aJL/hBCr1UgJZ08Q8T3bnNuVxGiL2Mu2mSDXdspkfQch2QnOaxmZAQRnPuesnGvsTmenvi7K2HJTSyfUXvgrWf5XF+BeJlZZ4qZ5KY2+VMJfTo+y3qY94ZCeGNjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(6512007)(53546011)(6506007)(4326008)(8676002)(8936002)(478600001)(6666004)(31686004)(83380400001)(66574015)(26005)(6486002)(316002)(66556008)(66946007)(6916009)(66476007)(86362001)(36756003)(5660300002)(31696002)(38100700002)(2906002)(41300700001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNpQWxQdDV2cFlZbGZYcFpoYWpNNFIxZDJjMCtXVHZ2WG5iRWtWNk5lY3FN?=
 =?utf-8?B?UmN3cUJBQTZrbHJES1lCSEt2NXdIZUlzY2NFY3FRUEtsSTZGSXhIelZrL3Q4?=
 =?utf-8?B?ZUxaQXE4QlpQQ1J6VmQ0TmRrWm1NN1Y4YTNDTEp6VDZRTFE5bndLME14Rkho?=
 =?utf-8?B?OVFRUVRiWENXTjhlSHF5Mjg2L1hLd0YwZXhLQ3d2QllRSkx3bzExaU56WjB2?=
 =?utf-8?B?OVM2bzQyR3M1enMvQlFyNGFCRVNmZXlpWWxsRmo1WUNtTUhoUDBob05CY2M2?=
 =?utf-8?B?Tm1MYncxYm1Cbk8welBoNlRVSkw1RkRZSi8rT213RGhKSkZpWnVRdG0wMWpQ?=
 =?utf-8?B?V0pINVQrQUtLWk5jOVpJRXBRbFJzd1p1NXNpdlRUTUFOemx4M3dhV0JZK3pE?=
 =?utf-8?B?S1VJWkVvdmtwei93b0d4ejdLTlNyYWNVdmZyUzhFMi85RmcvaFYzWXRDQnFr?=
 =?utf-8?B?dE1GdlhHaEsxY09hVklEUitXaHlURENidS93UDB5ZHBCUkVuZHFZNkgzY3hh?=
 =?utf-8?B?Y0FqV1ErL01YdGJ5RUNCQ1k1bFROam9uYlhGelJnQVFrZUpBaFN1Rmo0Y2RH?=
 =?utf-8?B?WkdINm5xdXNISmNldUp5UDFXeE9wb0lITWlOOE1kckxROFFwNUlIKzFqVWNo?=
 =?utf-8?B?cGQ4ZExlQUxnSFhuS2lWdUVoTFQzVHdrejV1b3h2OW0wRjJlandUREVtd3lh?=
 =?utf-8?B?dE1qNWRIMGJCOEgwSFZxWkQ5RU14YkUyRWIxZWRWb04xREx6S0swNzZNbm5C?=
 =?utf-8?B?VGlieWkxZnJJVTFuemJhMEN0akdsMXZMcXI2bWl0NDh3NXFOdWlTQVhhU0tO?=
 =?utf-8?B?T3lJWkV4YWtqSnczeWJrV01ORSszSXZ1eGZLQUtRL1NQMVJTSXJ4cUZtalBC?=
 =?utf-8?B?MDd3TVphK3lTaWFVeDNQY0R4aG9ZM0RLYmVTVHF1YlRYeEtoZjN0K00wWm1a?=
 =?utf-8?B?OEtJUEhLTTNsRjB4clNOaWNYNDMwK1JrZmNkRk5XUmxtZDhRT2p5cjJwS3lM?=
 =?utf-8?B?RnEzTzBVZTVlMjdLdGlIdmlYc3NVbTRwQ2xBLzBHWjZVZGNBVzdvRzBlS0hT?=
 =?utf-8?B?Y0txc2VmSW1YSTJxdUJlSm9WR2VqWXdzcXIwZm1yRTdSZkFSUlRReTEyZDNh?=
 =?utf-8?B?dVpDUTRjZTFpL2RjQ2VFeWRhdFJmU3ZqakpSMFJrc01hdlNka20zODU1dVdl?=
 =?utf-8?B?Wm9TaEt5cDZ0Rm5jbDhlTTg0alNoS0I0VUY1a2c2WDNxVGlrK2NWaEwxTjJJ?=
 =?utf-8?B?Q1FDTDdaQWlkVEtwd1VNRDhhRUh3WmhBS3VxSWU5Tng0VXhDUFJSUTFuWDJI?=
 =?utf-8?B?a25oSnBSOVIrNmhaeXovZkNZdDlIUWVpYXczQU5KSkUxU2orL0pQQ053bXlz?=
 =?utf-8?B?QXFINjZENkxDRGVXOVBUTDUxWWxuOVRxV2lUeS9wMVR4UUN0eDdKbG9PSnl2?=
 =?utf-8?B?Y0JES3BHZFZycER6WmcvQ2oyc0NXTDR1Qms1ZUVqWGFUVytRYzdmbkNIcjB1?=
 =?utf-8?B?OE9QTHYzVDBIZEtCM0dEMTJ2cThteHZCbmJSWnJBNjlWV1lXQlJmVjd2cXFw?=
 =?utf-8?B?Y3A3SU93KzJJWjhuTEpZSGE0OUg5ejlURk15WE5tRWcrUSt5dThsalhwZ1lJ?=
 =?utf-8?B?QVYvZlZCK0hXZ3FJSDEvc1pQaitXNVRITmh1M1dmbkk2WnpyWGEwTFBybG5N?=
 =?utf-8?B?RkkvN0tndkU5V1BZcE5sc1lvdDNlMDFhb28rblNiaG9ZUnBUMkRmdkE4cGg2?=
 =?utf-8?B?OERNUnZtenNGa3ZCVHExMTF6WmRQTVNRdyt0b2J2QlRhUm44TkFtb3IvVVUx?=
 =?utf-8?B?cXZPRGxqclYxancvemoydUNIL2pIajhnVDB5dEQxdDQyR05xUzI2c2xWVlZy?=
 =?utf-8?B?UTdweDlLM3ljNVFnM0dXeERzYm5iNU1XQ2xiQUUrOVdGU1RGYk1hcTNLTHJo?=
 =?utf-8?B?Tm4rWkJhbjNQQnBRV3B2REZ0WUNRUXhJQlRNZHVpZy9TTHRiNktOQisrKzVv?=
 =?utf-8?B?U1M3endSQW51TUtLVE4vZmRCQ2E0djcxQTE2MjE5OEMwK041eXpMUi9ZVG9n?=
 =?utf-8?B?bnNocEsxdkF6WngzSGp1R1BPYXd2Qi9NaU1tTTVOTUN2amE3TU52NjhRT2s3?=
 =?utf-8?B?UkpqeklQdkxZUkh2bjJ3SnU5Qzc1STdGeTBZTjdSVExIRTJadUxFYnRFMDBL?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50870430-7c48-4832-6602-08dbe15ea98b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 20:01:29.1810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOIn7INUrNlCGQE9OEBpSsxrkN8X0k2b9UfXb4D/rFHeoySu4S+R/acgukAdnm+nbDBAt/6vmvM61Nyx2ZvbUL9YFzoGdamll8zQ1RCTr70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/9/2023 11:30 AM, Ville Syrjälä wrote:
> On Thu, Nov 09, 2023 at 11:21:48AM -0800, Vinay Belgaumkar wrote:
>> We read RENDER_HEAD as a part of the flush. If GT is in
>> deeper sleep states, this could lead to read errors since we are
>> not using a forcewake. Safer to read a shadowed register instead.
> IIRC shadowing is only thing for writes, not reads.

Sure, but reading from a shadowed register does return the cached value 
(even though we don't care about the vakue here). When GT is in deeper 
sleep states, it is better to read a shadowed (cached) value instead of 
trying to attempt an mmio register read without a force wake anyways.

Thanks,

Vinay.

>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index ed32bf5b1546..ea814ea5f700 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -451,7 +451,7 @@ void intel_gt_flush_ggtt_writes(struct intel_gt *gt)
>>   
>>   		spin_lock_irqsave(&uncore->lock, flags);
>>   		intel_uncore_posting_read_fw(uncore,
>> -					     RING_HEAD(RENDER_RING_BASE));
>> +					     RING_TAIL(RENDER_RING_BASE));
>>   		spin_unlock_irqrestore(&uncore->lock, flags);
>>   	}
>>   }
>> -- 
>> 2.38.1

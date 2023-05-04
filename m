Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F86F7752
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 22:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB6010E1C0;
	Thu,  4 May 2023 20:45:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C168410E1C0;
 Thu,  4 May 2023 20:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683233132; x=1714769132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5w0TGsi3JE32uuydD/dnnkcBqRjHsmkA8IdF430J8gQ=;
 b=CDsvmThSd8FSl12ZV/DE5zquX+YWw+ajQEy1bpTslfBlBGDlSyxawy0v
 0mqIhoCFTd+687crEjdJil4judYlZbljVTKkRxMOKsEzzEbDLuT1Fh4xe
 71jUJd6PvHKDs8tfN9izgS387RlCVuTCt31Jm6Kv2gxEmveb5Ycc39/Rc
 UFkmEuZp4qqdyEzWsFPkCC0xKi1wULP/L/Ydc08225KmGcSlwU1a2YBr0
 Hh14lznUCShZ6mKFcjQavTcecY4USgIHNszXQ77IEBA1AYuLUjPqmudvB
 fREsmr/AzFFhzJ5SKi9Ve30G5XSO6uu7NfAwF7iNIp0D3UOrn7665eWIO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="329414812"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="329414812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="647506756"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="647506756"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 04 May 2023 13:45:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 13:45:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 13:45:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 13:45:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 13:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJWyaXOCHB6vOwjudLoAMHrkMYTnictPl5gkyJafU4pNPIVc41fsB7/VGjK0zVvULB3EyFhAzP2Zjv4lbO0ggwtO/7Z3IjBpJFzZaD+5kNt8NCQpCCkQ6mFQBz0DKAgvtxfKQCfRXxrg1GF65XaxeiugPe4HyVga7ox/N3PsyoSA8/SqlT717aukG/kKoKPL85hx+u/2o67UX4PuX0I3lCj4JoXsvLfX2T3gkCltHynuZ5H3zqTP9RD4GZOKxFC9BYFxYkxl//k18i+7s2kbQ7sSDOsZjZx4UcGZE2slN1NiNYb3TocpN6bMnh3tN+uV118JFRB0JRkOkijQ79R36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s49nRFSaQ+83Wgzn4JPPeMdrBAm6T+BsxRd0N0+tsBI=;
 b=b8+WPzUI7sV/FQv3pj1XmkjoFBbwH8eCqlNa/dwNc7w8IMb/Bts/d4MrHBC6IJjaFakz44qrmv3R2JcYgZqIlWjbHdMsDyI/LGhoNtM0hLpHlbK/HOEEzGQWpcdQ/U3Yi26TmD4Q9FvqOQe8AQm5d0Yj833uup9N6/zWEYcSMx+YOKUrGqIAQfZTtfllEpVxG83KOLnJ5l+d+cekSHNbtdiUyJDkYBVWFZhZy3pQOBbUWrSHpj/00nZ5U9BqIWTyppJHDUxQEONE0MRN3lYLaSSQXYzg5IblkjA5XkkhpAmVRlKHgkzXoRRUh3zDGRZxK9ttnknyE0Zt+XBAox6Obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 20:45:28 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::3f27:644b:a0bd:a9b]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::3f27:644b:a0bd:a9b%5]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 20:45:27 +0000
Message-ID: <0ef47947-d52e-18aa-5642-874ee2ca14c8@intel.com>
Date: Thu, 4 May 2023 13:45:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/mtl: Update GuC firmware version
 for MTL to 70.6.6
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
 <20230504202252.1104212-3-John.C.Harrison@Intel.com>
 <jo3pp2ew2qsckcrn4lvrkmhfilve6gjr6vb2iiof465dhj3uus@fppfx7jwt3q3>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <jo3pp2ew2qsckcrn4lvrkmhfilve6gjr6vb2iiof465dhj3uus@fppfx7jwt3q3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 98af182c-7ed9-429f-a731-08db4ce07e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pwu7lvppp30JOcQD5q+4gb6YWOmLof6AMDCnYat9pb0iNo13uuUqHACqBVc0NZLLM3IRgHjlzf1IrAOkEpmqFCV9Lyzqwt3QSuK9H3NqJIhAIIBBCmQvIq6CHcmihjT1AfoYx5oX/LQd8Kw+i+GsqOorNH1dUa0SoPFWtLqfd0Jeti0snJ6m5kXnlLe2bvEgEzVE48opjNAvDnvjez9lV9jux9Yl2rqO/d+B1pVp4euIw/MUpA/Ur4Jsjr2L5FCdM4OkSzdib15O9uBRGB7lK7uJAzOwiuft2j0XApXUZYXeeVDdREes4NNSFUOSCdhXnrWnyh8XbfL55+rxaDaIqLmaNeRRdGO2DUgxABm8kUbhGAfO34EfXeNJDQ5gSJlU/JLD6GxVl0v62/pnnVrRmLjb1A+2JbCZ39dS0vdOGhtyzO7uA7DPJLFR8bSexWzT7Je1wAg+8NL9VvmS651xfPMErwU5XXBSF9U0ZSDZMZH7jSq8qSO5TC2fnMIsBdmJRVjqIJxsH2vyyYzCitKLrKu7GDwamY4PWyT/SxCS5BuL8fIDWsJZYvG2xfjg+CQHuHs457XqBDQSXZY6wMj52Mo0IXo/C6Sv0awLtO7NV8l6VQpTPr28oE/qf/pZi+e/5g2XzYc3ujraOozfQrpD4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(2906002)(53546011)(15650500001)(6512007)(6506007)(26005)(37006003)(2616005)(31686004)(186003)(83380400001)(5660300002)(66556008)(66476007)(66946007)(82960400001)(450100002)(38100700002)(478600001)(8676002)(8936002)(6862004)(41300700001)(31696002)(86362001)(36756003)(6666004)(316002)(4326008)(6486002)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czY3OVMvNGhLZUpocjQzQTdEUlVJYmVab1hWOCtha01sbzJuS2RUbkZRdzY5?=
 =?utf-8?B?S3pibnNoTTRmOWNwQk9SUFhwRExqektCazhsOCtDc0FOQ29TOStQbUlTVzYz?=
 =?utf-8?B?em43S09JeXdBanVkeTUvOGdiclVPNGs3ellGQjhuUUJ2Q1JaWmxQY2diU3FK?=
 =?utf-8?B?NEpwQTVZMUUzUU5ZZk9TZTl2bWwyODdHaGJVTDAzUUppemJSVUhvM25URTF6?=
 =?utf-8?B?aWRsV3Uwbm02eFgzbkVqZXFLaEo5ZGg1czNUTWZaQTR4U3B2NXdVazVnUGR1?=
 =?utf-8?B?M0V1S3pyLzNwbzA1aU1zNWtqVi9WYmNRY2JsejJCVUFLd3RFck9POUw1Vkpp?=
 =?utf-8?B?YTV4VU0wTXRkb3JuWFFRMkJ1YUxVbjBkbXFTa0dSVzkxOVRIalZ3R1JGUnR6?=
 =?utf-8?B?KzRNWEp4MDk3M0M2UmVlcTU4S3hjL2dobFNVd05aVUErb3hWWndINTZUeDRz?=
 =?utf-8?B?cVZtcU82RUpWc3dHMjBTTXRWWmxJVGtPemVlZ3NCOG8yVDdwTkFqTnFwL0Ry?=
 =?utf-8?B?UUxESGZYZ1BiNTllMWJXTkd5cEdpb251WmNLanU0dE9QSVZzaUhjcjFNbHYr?=
 =?utf-8?B?b1hKZm40Ykg3Z2krcDY5d3A4ZzNNTDJvUnZWZjBDZjd1OFo3R0pSeXQ5aWVE?=
 =?utf-8?B?WXdSN0lyRm50dlJBb2swNVV6bHpJVDgvN1Vxb0s3eTNtcjNYSGI3ZUk2K0kx?=
 =?utf-8?B?MjIrN2JUWHVjelFKZnlPa3RFUjNXVG9qUFhkdjRSbzZhczd2YjQvKzduVGtu?=
 =?utf-8?B?c2w2OEdCNVRBZGxRRDNtM1RFeUJLb2JPRlBsY2pXTThpWHNQbHo3R09BWXBH?=
 =?utf-8?B?VHJBTTM1MDhRdTNNZWZhV3c4V216dWFndEJmc0ovY09EWXZOTWdsMUdERjhO?=
 =?utf-8?B?akpRZmEyRThQcm9ockRrUWdzZmpSbkZodUM5VXdJRWpFTVlXTUhtVSsxVnc2?=
 =?utf-8?B?U2xRcklua3dkQXU2LzdxMHN4RlFZTldGQW45NnQrWC93Zk43R1VSeHBnLy95?=
 =?utf-8?B?VmhpOGlYWVhqbk9XR3ZoVlNqTjBaZ1Q2aFhIbzlaSTV0SnFlUUdsWDJjcVlh?=
 =?utf-8?B?UVUrNERVRjBLWjg4cThsYVZ6MHJVdGdPLzFTUCtaMnJpZE4vMGNDbFNMVnJ5?=
 =?utf-8?B?ZU8xc2p1d2tlQVpPVUZiV0w2RTZsSVFnS0pGdFNlQnl4bm16Um83YjBLdmp3?=
 =?utf-8?B?bzBlVjJKNGUwcFFQdXRLQW9oTXFwZXErdHljUFdJakxnTzF3TWxIWEFtM05C?=
 =?utf-8?B?Tjl3TkVBd0JISWd5eWtvY0IySm5sQlVxb0x5djZNQk5MOEcxbitmcEwxSkJM?=
 =?utf-8?B?M1pVcVZzZURjak02aENKdElhWFRLaW1ESVUwTEF4c2M1cXpUTyt2akpqaU54?=
 =?utf-8?B?dFV2WFBHUnhxMmlGQ3NNZW9vbTQ0Uk9BVktyWnUyN2NNUFlaK0puTzZsQkJC?=
 =?utf-8?B?eEx6SDk4cFAydk1TbHExK0RlU2RLVlMzS0lNVnZ1NE1RL0JDeXJXSDlGWjNS?=
 =?utf-8?B?dDdQTVY1czlLUVFMWmR4VXJ2TU5pYVNlcDRSQnhYazJVV0JGb01pallLQTIy?=
 =?utf-8?B?R0tjOWFxbzhuUWI4eFhrem9MOFViZThucE45dmhRajc2Yjd6Zk5LSnhtU3dE?=
 =?utf-8?B?cHlhZHlCV0ZRc05qOGlOdWl2WGFsVXdJMjJTK3lNckNLMHpUOS8yK1hOYlZp?=
 =?utf-8?B?Z1NiL253My9IYXJFZEFEVUhBR3hTTGEwV2VnTklwWGxMZUEzK1lDK2xDNmdQ?=
 =?utf-8?B?U2xWRDY3SjRiMi9veWhIaE5CUG9nRStjay9zM1l5OU5qbWlpcGxNZmRwMVZu?=
 =?utf-8?B?czVxZnZoVVhnNHVueFRkMENZMHhFL0FhaEhLMHFZMXlZSTlOQlBBUWlIZFRC?=
 =?utf-8?B?S1N1b1ZweENCeWRxOThDZnc0TWZLeUpjQ0JISWVYRkwzV0MyYXB5em96MHhZ?=
 =?utf-8?B?SSt6ZytWMVhnK1ZxN1dGdVNqRWJYTDVPbzM1d3R6a0FrUUFzM3BwQUxvcC9T?=
 =?utf-8?B?Q1lsZVIzN210YmcweXovbURRQ21PM2lXOEZBU2NkU1ZhNkZ2VVF6TGI0ZlNE?=
 =?utf-8?B?U3N5TmZ5N1VsZDVTUXVHMjdPekk5ZGk2ejZ5MEc1NVg2UWZyeHNrZk1ma3hr?=
 =?utf-8?B?R1FyQS9USExGYURySURTZE40REdPS1RMMGw2OEgwcXJKRWVPdTAzUG52SkxH?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98af182c-7ed9-429f-a731-08db4ce07e41
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 20:45:27.8885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vhLaHntooKtibdI0Uy4FfqF1DmHP4K/DheXqbQGyu/Kf7/LFozHTV2XvsjCR/RdIPMFdceSj7JIdfDLgDefXoNDBOOO8IXgdSwyHNy6mH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/2023 13:29, Lucas De Marchi wrote:
> On Thu, May 04, 2023 at 01:22:52PM -0700, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Also switch to using reduced version file naming as it is no longer
>> such a work-in-progress and likely to change.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
> commit message here will be bogus as it will be the first time MTL will
> actually have the define.
Oh. Because the current line is coming from the for-CI branch and is not 
actually upstream already. Yeah, forgot that!

>
> Better to do it like this:
>
>     git revert 5c71b8b8ac87
>     then this patch, with a better commit message
>
> or I can change the commit message of this commit while applying to:
>
>     drm/i915/mtl: Define GuC firmware version for MTL
>
>     First release of GuC for Meteorlake.
>
>     Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Lucas De Marchi
That works for me :).

>
>> ---
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 55e50bd08d7ff..10e48cbcf494a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -79,7 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>  * security fixes, etc. to be enabled.
>>  */
>> #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>> -    fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
>> +    fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 6, 6)) \
>>     fw_def(DG2,          0, guc_maj(dg2,  70, 5, 1)) \
>>     fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 1)) \
>>     fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>> -- 
>> 2.39.1
>>


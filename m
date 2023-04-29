Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2E6F217E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F99010E246;
	Sat, 29 Apr 2023 00:09:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F3410E161;
 Sat, 29 Apr 2023 00:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682726938; x=1714262938;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Si5QxmNPr97kBxuQI+XE8luFbenC3LseW7eAQ2l64X8=;
 b=DcGByZo/rmBI0D6DizceURGM/eROawGcr+WRB1O8gRtrIssv6D/5A2/S
 lov6uuPV97SA65oT5aIy/gvOEhDTfBZ5J5AdUCLNeh33DsB9hisFa3JeX
 Bf24x9duYjCnE9RQxFKdoNaRIF1pvh4ZWLX9lQIJakUPTBXyt9Q69Xjo0
 MawQIpkJ6HnkG65OW0brAZB+k6WwuwzHGskeOJU7rUz++YgMXUqxdTOWQ
 ET4Guw8gf+LhXnJo0VnRLKAg/4kvXL6FLmHDHmxDMJGO2s5YSZ/vdTMf8
 TbOs8hi3CSqtNt4x5j8em4gOUMmvul8UR1GkYI0kX7c0pK9P/mi22GQHR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="347911932"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="347911932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="725531584"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="725531584"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2023 17:08:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:08:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:08:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:08:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNtXRon0triDF843QFB+A4p8Y+mWhiS67M5tISb9z2S7tAvSfjisKrIIcTiDxRkBdDGfIkN/FS2w4FFqsrBfPkpfJtRLpTTBU5Lw7KYCofeQHFRZuUpqtFxjKFwy9Cl/CGXH0I3eDBP1WDIRWnDnxM46THITnUCrjyIEIOrfJ0G76j6NzWFkPgml41YqIvursahDy3Qzr56sE5sM6HBtrOv64Ag5VmkxYylfWxgz3fGGRTcExIuUBmgbzxZNmqSKUVJNMB2YHkwD5Z+0dCehxBQFKhH0K5pGo1RMSdSWGn9ZTdhoO83MbjTRpeS0Gvnpm6UCMT8RGZ7gDbdsBB0RyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4sxyKwQw4gP5NtxSQksklSysVrgKj+mRXT11aOTZOs=;
 b=XiinE9n0YpgK9X2nZ2wc28P8OBsCDZxHUjy/Zulgm4zXvGMFYKkKx+5PbTKhpAR4o79Haw4IWn9hevnb4NPagPkWAtF8Ndv4CebCXD+OwjB5RuBHynl/gJgNuCkXI/r0kRuBt8EEtLK1k9ztnClrGSRUIUlvDlRZtOMDdHjrchoMkk28Xi1wzoQleJPGgxXOXPQ6tfj9tSEasvfiyPJ4KnmedAICH4KLRlYqI2OQZjloTmjIx0nNfyrssP1gKGxVcYFui6UC7ipS/DHdA5LZZlYkWInBfKcwrjriPsRNwHOM0k37HGnlKcP12OnHp6euHyVqfUFyYxQZngRNAQHZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Sat, 29 Apr
 2023 00:08:46 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.023; Sat, 29 Apr 2023
 00:08:45 +0000
Message-ID: <f818e364-010c-99c5-3a08-fafff09422d2@intel.com>
Date: Fri, 28 Apr 2023 17:08:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] drm/i915/uc: Reject duplicate entries in firmware
 table
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-6-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230421011525.3282664-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d75f70-f0ea-499d-865e-08db4845e621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCavXFWMeszBDIi1ZE8EXV60nb8IO286vy2PI3EpUBAiNA8ribA8Q+2RYTzEhoWgL5oks8xGcUoh8tXZaz5Lc8vPZH+oAMCe3JuNNvGANMhAobkcYyBa0QSp4xS8SqLiqr6gP6XNiboUdNhdZyMgBepUGQH4D+K/1Ei+gkSwS8TtNXmLf1AX0nIL2VHK7VcxabYkrJAQjHuscmzxSA7XSxTbifaAEi6lEtpJtvdEi1CrUlSwI0YcTo6acyCih5DXluAk1sDilr8dFm8tGIKSdreTt+L1bLFzIBT1Ze8UjNq7OumrWHoPy3TcCfrA5rnwogb7N8Vo7Chk3ukjb5k9yIYWwm2usutCbnpwBoJl/7rUPE6kJBJP7H/PlthP2HWFfuVi5oipTRPffro8x//7ZcZelk5ZUlO+ce+5zPYhyarjYGdmcJQ2XrQkrmFsa+lafDJcEJh/hcL45b8BxJ47AXmNCKtAN0VCJSRyZFWBZV/yvbuJu5i5czLv0bTwmGEVXQwaLucZzdtWR6hqpzdINfULdseRCAuQsMbSHhQuLlK3ZrCtBnjUl18Q70ZN1zmJ+4o6X7rL5zldoWUJK37/s/ZndWZTyD7PvTbWqBaCffTlHpeAzJGaxIFK30qV7vTiqA5DuBmcaAwMEs1KdzTi2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(36756003)(186003)(2616005)(83380400001)(86362001)(38100700002)(31696002)(6512007)(82960400001)(6506007)(6486002)(26005)(53546011)(66946007)(2906002)(316002)(4326008)(450100002)(66556008)(66476007)(8936002)(8676002)(5660300002)(41300700001)(31686004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlByeEhqTjY3dGg1dHlDcXBvcG5xdlExMDdKNFZoRFRVUEQwZFhwbUZLeGlj?=
 =?utf-8?B?UWt6WkJ3djByeWVvTXFzWERWa0ZwREd3Kzk2bUIzYTgyZVpMZkgrZ2NKclpT?=
 =?utf-8?B?QzZtZGFOdkNIc1RjMEJqMVpFeWtkRFpKc2Mrc1Nkc0NDZUllRE84c2NmQ05n?=
 =?utf-8?B?aTVBQXlnMXlYb3c5RHZwVWUrVEdJWWI1Wk5OMEcyemR0Wk1ReHprU0VIanZX?=
 =?utf-8?B?ZDdrd09jaitIelJiWEdyOUo3NGhZc083VGwvbUlPb1dFaGowTm1QZ1lGMVNS?=
 =?utf-8?B?QUhreG8rcEpGeG9PNlRObER1aHUzZXVQcUc0VWJMaXRWZTc2UzJkS1hXTU1s?=
 =?utf-8?B?aTBYVnpFN2IyNE1nUVRzRzB1M2FscTR5ODVYaTAvSE9EK2hmWGJ2QnBCWU5O?=
 =?utf-8?B?Y1ZSMTEyMXFWU0RPbHpjMXRreEcxSkMvaFFuRFRjdEZuMkt2aWFwaldESU1v?=
 =?utf-8?B?MnVrS3pHOHllMlc5N0U4OEhpQ3gxNmdocTJnWFZVem0rdTJaTmp0cWNMMDlK?=
 =?utf-8?B?bUJuTVA5NmRsK2NVcjNoUnhEdlNQcjB3WElSdklnSWg4RTN3dzdFOFJ4TW9n?=
 =?utf-8?B?d0tqZDgyL2oyaUtIN2cxK1RybEpnK2x1RGdxVUpEVE9URDN3VkZxR0NVa2dt?=
 =?utf-8?B?UDRZVmNwWXcwZmlvbkZ0RGVKWmlTRktGeVpwQjI0WVkycVVJK0JjRUhRdW85?=
 =?utf-8?B?YkwycnRDcjl1bjFXUW05RFl6bVV1Y1BzMGR5QldkSytBdVQ4T0JHcHBXT3Ny?=
 =?utf-8?B?YjN4amRBYmlVemt6SllDb2Jpd2x4SnpEWk1xU1dTcGtLMkRoenhVbzZUY3Va?=
 =?utf-8?B?Tlg3VmxMeXVaaWN5MU45OGxKd0laYUhSRW1YdzhzU1lWUFZZZEE0TERiOXFu?=
 =?utf-8?B?UkJuVmlmdEptK3VTVG9lNlFheUhtbXhRNU1zdW9TcjEyUnpiRWFyVDhCQmp1?=
 =?utf-8?B?MmljSE5sYnNHNUdQSllwVW1sVHlHUEFUSVB4d1B6KzNCUGM5ZXhrL0EvWVJT?=
 =?utf-8?B?NmZ6cDdnU1d3cERuRUR5Z2EzQzVOeUdLaXd0QWZJYmxsRDNIcktNNkVKV3Bs?=
 =?utf-8?B?OGtaRks5OGNyZ1cyYUgwSXhLK3ZGNllKWXdqeEZEMUNrMFUzdG5GNFF5MGhQ?=
 =?utf-8?B?Wno3ajNvclZTdVpHOWxFZXBRZHhnOFJCREFoY3R5RnR0SU1EMDdWSGpjTzhm?=
 =?utf-8?B?aFFMajdPZGFadnZOVzJ2TElWdll4bEZqSUNqTWVaNEFkRTY2M2ZWOXVhRzBp?=
 =?utf-8?B?S1ZpVm9lYzQxMjdrZVdZZ1ptYkdjZTN6QUtTTlNvZ1NUQUlKUXBHbWVVbkg4?=
 =?utf-8?B?WklUUWxmN2ZFSGxCSUQvWTRKengyNzFJTzZ6dkxkSFR5Ri9OL21JRUdnWWVN?=
 =?utf-8?B?eTdROUxGVmFTYzZRcVpiZ1I0WDgrTE0xVFZleklOZGpPbGVBRnJIcFhKbHdF?=
 =?utf-8?B?L2RyM3BBVTU2UnJ2cXBVVlFSMWNoZHluN2FtalFjZGI2UG8yTEN0d1BKZUZp?=
 =?utf-8?B?VzBvb1lqeFlmL1MwSmRVM1hqMkhrRG1ZbUlyU2pvcGZpTUxsK3pwVnBsLzNm?=
 =?utf-8?B?bHRhZnlyaVRNemVMbk1qVnk4VDFhak1BOGF3MjBDd1U3dzB2MFFKOFgyV1Nh?=
 =?utf-8?B?Zkpob1RGV0RnKys0NlBhQlN1cWdsWml6bFNVZXNPa1d5ZktxbFhZQTh2Q1VX?=
 =?utf-8?B?VlBHelNUWkFzVjVDQVowYUtuRnRPY1lUZExpVFBKcDhuZ2ttdmk4Q250R1lY?=
 =?utf-8?B?WFluL1FSN1laV1N3MEkreTVuWW9mK090eUs0cytuR3lVdW1yUnFWcEljNGsr?=
 =?utf-8?B?eVlFUlkwSFVsd0RYbGF0eFdmVUY5c0k2S3hnVXFxYjF5UW02ODdUTU5KdXdr?=
 =?utf-8?B?VjhqaGZnVnI4Sk1iaW1aa1h3VmVjcnhORGxvUzh2QmxJUmkvSDY5dHlmb3pW?=
 =?utf-8?B?V2hlRzZFQ3hXeCtvOXNtaG5QWHNiaUQ4VUY3ME5aMmtQWU4vdjF0b0ZGUjRX?=
 =?utf-8?B?ZWNkQ0VOa2ZKdXNYWlpwQSt5Uk8rYUVYS1ZaY1hwVFpwWHVBcjhlcTN2TDlS?=
 =?utf-8?B?QUdqNXpuK1poU2pqaldMSlZsTmVZeW1WZnE3SDdZQ2wyNFBzWGdQbW4xNzgv?=
 =?utf-8?B?YkxJMStnOW0vcEg4ekljUzh6STY1Z2loNnNMY1Q0U0tUTHQyQnExQTVOODVC?=
 =?utf-8?Q?E+uqZ6+vG5SOWt2lHiywijQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d75f70-f0ea-499d-865e-08db4845e621
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:08:45.8090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYj4y0+3IXtmRBzwPH6V3Rg419qPbZDVGB6uZuybzaNPiybSWcey/hN1SfRFcPNtRv36wLn71PEWiv/o7ChIkL28amTYY7EHFpNF+kPMzn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> It was noticed that duplicate entries in the firmware table could cause
> an infinite loop in the firmware loading code if that entry failed to
> load. Duplicate entries are a bug anyway and so should never happen.
> Ensure they don't by tweaking the table validation code to reject
> duplicates.
>
> For full m/m/p files, that can be done by simply tweaking the patch
> level check to reject matching values. For reduced version entries,
> the filename itself must be compared.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 27 +++++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index eb52e8db9ae0b..bc4011d55667c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -319,7 +319,7 @@ static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
>   {
>   	const struct uc_fw_platform_requirement *fw_blobs;
>   	u32 fw_count;
> -	int i;
> +	int i, j;
>   
>   	if (type >= ARRAY_SIZE(blobs_all)) {
>   		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
> @@ -334,6 +334,27 @@ static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
>   
>   	/* make sure the list is ordered as expected */
>   	for (i = 1; i < fw_count; i++) {
> +		/* Versionless file names must be unique per platform: */
> +		for (j = i + 1; j < fw_count; j++) {
> +			/* Same platform? */
> +			if (fw_blobs[i].p != fw_blobs[j].p)
> +				continue;
> +
> +			if (fw_blobs[i].blob.path != fw_blobs[j].blob.path)
> +				continue;
> +
> +			drm_err(&i915->drm, "Diplicaate %s blobs: %s r%u %s%d.%d.%d [%s] matches %s r%u %s%d.%d.%d [%s]\n",

typo Diplicaate

> +				intel_uc_fw_type_repr(type),
> +				intel_platform_name(fw_blobs[j].p), fw_blobs[j].rev,
> +				fw_blobs[j].blob.legacy ? "L" : "v",
> +				fw_blobs[j].blob.major, fw_blobs[j].blob.minor,
> +				fw_blobs[j].blob.patch, fw_blobs[j].blob.path,
> +				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,

nit: we could avoid printing the platform twice because you're 
explicitly checking that it is the same earlier on. Not a blocked.
With the typo fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +				fw_blobs[i].blob.legacy ? "L" : "v",
> +				fw_blobs[i].blob.major, fw_blobs[i].blob.minor,
> +				fw_blobs[i].blob.patch, fw_blobs[i].blob.path);
> +		}
> +
>   		/* Next platform is good: */
>   		if (fw_blobs[i].p < fw_blobs[i - 1].p)
>   			continue;
> @@ -377,8 +398,8 @@ static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
>   		if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>   			goto bad;
>   
> -		/* Patch versions must be in order: */
> -		if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +		/* Patch versions must be in order and unique: */
> +		if (fw_blobs[i].blob.patch < fw_blobs[i - 1].blob.patch)
>   			continue;
>   
>   bad:


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBE5E5C91
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF2610EA64;
	Thu, 22 Sep 2022 07:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EEF10E0D4;
 Thu, 22 Sep 2022 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663832341; x=1695368341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZLamvXC4UM/OUhiwigEhbKsRrz/Sj/FuXVlI91YnUR4=;
 b=FWYragKZOFF5JvXslL0k0Z3KbvlXGy+ka6SkjBmBnKIE6JI7AAFz9NEs
 4Wpmb/+LC86Dm3lgp77/G870L0McjdYkuc/0FxwgAgskAFny/Kw+c3rF4
 vNbnyEiXgF/CcvPH5nmUxNHhQna3v1BFok4AeOqQMPTvnbNCwMRL+rrnE
 ER32MM3GSCnWFSB9mUWRcDt71Fv7UzJqpT7bcC9LsJb3vxIBbgOS1vEVL
 lfUzYfNXEs+Tf2T3FX0OSYLqtMbtwUFvIa2Vz5Q7LV0Hj+7YUcS91yd7E
 RujtrDqWg32mW1EN4CgJRlgjB4mi0wtfROFnGDSbwljlGvbLclDOos86r A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="287305289"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="287305289"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 00:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="948489613"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2022 00:39:00 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 00:38:59 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 00:38:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 00:38:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 00:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa7IeP6k8PFnxa9Y0s2qHvD5GLpc+65rPfS2juwZjVQRdE+3U/z5P8e++eZNItIpbP58Q+G5Cd3Wwh5LewzuhQb4Rjm5t+hhBq8snS8ikEou2EtWDfJw9WpqPBp54wAm4209sLZx5p7vWmBTTae5B9ikhfcltU3Kvw2Armu8Yk5YiVt0yogPTI80kX8T46q3FDVbFNQZqHkLzepGZiOEAjAJDAjSh3/i9o7oXnZUBIM/5n3AzY5LFAuOfUDEWV+xGk6uFYi6E7qvgLel4oECTyzUmZTvwgAOY4o3njC6oUyMHI8bipAncn6L+d14BZgmadfbpQxg2ItwVGQmgvj5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjVSO5brcapEoB+Yjc/S19yvaeOWpdsCRa+8RU1fYzk=;
 b=TWAZEbHvZCy4XpAkF12sbira0wGFFyQ/aok3vtbquK4t25jsPrraxm+TMmsn9TDGP8o0EPvp+bMMzfDb5fqvdRb6UFTykYm3YObuUVBYwxujjSphUSlvWwcsK/zIiD18XEr+CuOeHtl1BZWBwmFGPAkRibnN0JO8OQN/igoBcG+gOMenFE7Q1OHIGFw6E7vEIRiAAZYpE7QyJROXRKgp2maLXoAPYwNtxjVr7Bjq5nafm553kO4k2b2qXBpn3q7u6vAupH0MyvFCmiI/+METv7zqGcsJjzMeikieSwE8OWe0LKRWOCpC0UsPDML4ZZtLi1G6r4n45VEn3cgDod8Eow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 07:37:56 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 07:37:56 +0000
Message-ID: <0f1b118d-e072-8e8b-9819-b88b7a14e255@intel.com>
Date: Thu, 22 Sep 2022 13:07:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 7/7] drm/i915/hwmon: Extend power/energy for XEHPSDV
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-8-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220916150054.807590-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::15) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: cb90f389-d7cf-430a-b572-08da9c6d5d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gwha+0W+3MnuBOgBF81qMa9keZZdEq30JDThejmAbk42tAq7RnSxuwwVICDwHZBTxCFq1SlsLbGynge6SBKDmUrfL5cqpXYXF9k/i5JLqpi1lk1Sei+Pku762hK7CsCdE+xnlkLLnANe3VNZVfvlWqsyIED/nVND3crTyNiK0LoMZnABj0QDhCjsSxwDE/CaGEPBtzztHXBCPK/gtiJBb7m3EaWCRvo4AlcxJrA78uZNnzcCoDt6vPLmdgHIMJXV+Dgn92vtP/4+4LZJgMl/V8ShksLURbP+WxSlRKHwC1mnKAQAA24BNclMCn6FX+GvK20zBMvtu68ULK6yZ+EqEaGkqpk5cMh91IEjrFcDWmcnFqO5monSGn4lXteFZ10nnQDjNEOoCwi2D9ZpB+bEGY7toRQoas8/w+QO7m5mX8x0qY4DLUotjqvjhjjOYAXDCzQAtUTMCj2MogUcojDItLJhUj3J3sp4q8POiWJujXa3fcBY4vl//Njcnlp9HI3D/2q2jeFClUlpFY26DuQAqfRWgtutyiYULd0gQ/m6NIdDx0gKCM/JXM3++i3iBCH5DR1W9qdGmNSfeCu9u5zxbP+gQU73MjRUoQE/wkBX7F4LGHFwgO7Fo3BajDdUoeNWLkor/4JHQA8MkKpRSaR9rRDx8sSw96Hht9TfExHPJMoXa3eqvSMagCVwkfIxVCtkK8RMYdiLWlg90Z3xA05jXmamXZTrZR+YwkkltbPtW8OaWm6QtSfovAwBIMgjtyP1Aoda0TdFLODoj8IUhcb+FQfsuiz7RpyGeSNZoUZHMgQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199015)(6486002)(478600001)(31696002)(41300700001)(5660300002)(4326008)(8936002)(8676002)(66556008)(66946007)(36756003)(66476007)(316002)(26005)(82960400001)(6512007)(38100700002)(55236004)(6666004)(6506007)(53546011)(186003)(2616005)(83380400001)(2906002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBxcTk3M3A0bWNSMGR2OVlKTEhZTHB1Ly9VNjVNSmEyYXpNQ0RyVVl3QUpp?=
 =?utf-8?B?WWl6UjVsd25wQU1kdk1QR3BMa1Y3RGEyVFowbUsxTThyeXVYV0Z0dDB2VTZk?=
 =?utf-8?B?bmpiMzlOT3FJNzhjRGMrRTlZbVdFcE1LTjlRRDdIekIvcDZsOGNlMkx6aTNh?=
 =?utf-8?B?bXNQd25yYTFTQzZYaVJpNDFydFYrSys4QlkrZ1lhdEZ2TThFSmtiRFNtUFgr?=
 =?utf-8?B?bjNqcXJSVVF4OW1oZUYzaEZJVHZiTjBXMldVMmdzR1psUnBJc0pxNUpPUS9O?=
 =?utf-8?B?SS9VbXZCOWtGV0wzNWVRaGZUNTNyNmJlQ3gyMkJFSWZNbm9VS2xVVWoxQkgr?=
 =?utf-8?B?dHdZUzRNcGZBZS9OTWdMaXpkNjNpcUhmak9zdGp5UlJJQWhDcnN6TzZvbEdI?=
 =?utf-8?B?U0MyVUUxTWtpbktyVUZ5RjhXVU9oNFhMSjc5U3lWbkcydDZYeFp0Ny92R2JW?=
 =?utf-8?B?Y0gvZFZINkhaUzFING5Feis1c3Z4Mm1TZFhDYURmaEVOUXRDM2QvUU9Cc3RZ?=
 =?utf-8?B?NVdvNm9qQUNKaStXZDg2TVIzd2lKLzBKUFp0d3I3MkRqT3A3Sm10QWpwUXhO?=
 =?utf-8?B?d3QwcHZWc2hqK1ZhYk90UHpQS3RaOVduQlNEa3lsTEZjZlRHR1BtVjA2RWxF?=
 =?utf-8?B?UTFSU29ZL2x4c3FTem5ZVzBsMERtRlp5V1hQbzA3NzRpMElTYXBsNFFSaVlU?=
 =?utf-8?B?R1hvZ0Z4a3JoWUFSa1ZHSjFkcnZXU0w3YXRwaDQvZi9mVkkzSjJ4YzJXWGJG?=
 =?utf-8?B?Tml3VlhsN0J4ZjZTNS91VUJGbWdGc0I0ZiticHJtT1BCSjhDQVp3bU4yV0Rj?=
 =?utf-8?B?Y2ZmWXQ3Snpva1lOek9lTXJycXNyRXZNNTFWZ21QWTIxQXZCN1VZL2ZSVHc0?=
 =?utf-8?B?Zmd4LzFBRHcrN3hyYTRIU2NIS2Z4dFQ0N2RzTkNVQmszbUhrTnN1eVY0UVJU?=
 =?utf-8?B?RkpnSHVqOWhzbDdOVTFDVmlrdnFrUDg1SjdPK1g4OSswbitJZGpjU0dUekNS?=
 =?utf-8?B?L1dVSWNoZDEweXdMK3p0a0xQTWt2OWpNUitXZTY5bWJQaTJKd1J2UjhKS2Nw?=
 =?utf-8?B?L1liTGFxcVZ3WndxZkRBMTJtRFExd3lGbng1akR1UE0xandrdWkwTVprQ2Ni?=
 =?utf-8?B?Z04yaHFzWm1SUFBZaFQ2QXlXWlBLUmVOSzlXcjc4eEJBZlN6elBtcEViZThj?=
 =?utf-8?B?c2gyWldMQWRLVzNUNndNUlQxcEdIQlBSVVI0dnZNeS9GSGVZWnFoSHZiTWZB?=
 =?utf-8?B?TndIMHMxQU0yNkhQZld0WHlYWm01c25Db2RwdTExc2Y2SVgrM25BWUJnWEF4?=
 =?utf-8?B?cnI1ZUlwRTI4b0FLRTNBMk5xY3FBNktkQ2hjUDNKdGswczRzVlVyVFdLQ1J4?=
 =?utf-8?B?alZEUTN2UXFxWndzaGU3bU9WWG5vbE1QcDh6Z25GZ0s3NitqaTVpeE9SOWJG?=
 =?utf-8?B?d1ZxT1cyL0wzS0pTeXQ1ejVEaFBLRXZUV2E4QUFTazFkUnZIVUhLNk5DU3FQ?=
 =?utf-8?B?QWlaSlB6emtzYjVRY0kxQk8vSDhKOHUyTWk2NC9mR2NybWhRa3BjSDlaL2NX?=
 =?utf-8?B?ajVrc1NKeVZob0E5VWtTM1NNQjY2QW04NkhsY0NzUDJrdEg3clN5MXo4NzUx?=
 =?utf-8?B?Ym0xSUM2SUdaaUt2bkdiYy93R2JITHBobFJnN2VUanNSbExIQWw5SWpkVzly?=
 =?utf-8?B?MnRkNUJxTVRhK0FWT2NtSGc4UE43K3l1YjFrYnAza3JVN3FRaHF5Sm9adWp1?=
 =?utf-8?B?SENxRUo4dXFoeHNySDNiYnR3T3RnTVU1c3Jpa2JPMHdjRDNlVnFFSUhzdmFP?=
 =?utf-8?B?clRkeW85ajdOQVdSOHZsSzQ5RGMxNXFaWTF6ZXJVZEdpdWdYOVBUSVhJbjFs?=
 =?utf-8?B?M3NqYXN2dndoQVJtK0UvWFNicHoycnhFUTFVY0RKMktYZlJBV1FGczREdU5X?=
 =?utf-8?B?YTlmYmFBSDloK3VYb3VLMmtTWWdDNSt2MEk5aHVKOEhmY2NuZ1liS0lQU2c4?=
 =?utf-8?B?T0tVSjlmKzAvZzFZY0RuelpTSFkvMFQzN3hCNU9BNjkrdjM4U0JVNEFTcHZR?=
 =?utf-8?B?NjZkdEpackxkTXU1M1FhNCtMR3BRQmxwck1MKzExbW5VdzhLMFdzMHpmS2Ur?=
 =?utf-8?B?MnJDYmRNRzQrZEZ4bGNpdW1BckdRZWY3N1lTcm02anpFOURFNTBEUDlqaFdH?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb90f389-d7cf-430a-b572-08da9c6d5d43
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 07:37:56.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIW0arnclPt5gKlQLzS+EaUPPD77hA4hHmbvLEB7Jd1PMlKy8q2KgxJXzdNVTqd0CTsS8tJ8S3TSjnxjCO6MYJTG1H+6DsMKuhglRtrGjg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
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
Cc: ashutosh.dixit@intel.com, jon.ewins@intel.com, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/16/2022 8:30 PM, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Extend hwmon power/energy for XEHPSDV especially per gt level energy
> usage.
> 
> v2: Update to latest HWMON spec (Ashutosh)
> v3: Fixed review comments (Ashutosh)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |   7 +-
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   5 +
>   drivers/gpu/drm/i915/i915_hwmon.c             | 114 +++++++++++++++++-
>   3 files changed, 123 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 7995a885c9d6..851525d2117d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -65,6 +65,11 @@ What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
>   Date:		September 2022
>   KernelVersion:	6
>   Contact:	dri-devel@lists.freedesktop.org
> -Description:	RO. Energy input of device in microjoules.
> +Description:	RO. Energy input of device or gt in microjoules.
> +
> +		For i915 device level hwmon devices (name "i915") this
> +		reflects energy input for the entire device. For gt level
> +		hwmon devices (name "i915_gtN") this reflects energy input
> +		for the gt.
>   
>   		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 65336514554d..3c385395aaef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1591,4 +1591,9 @@
>    */
>   #define MTL_MEDIA_GSI_BASE			0x380000
>   
> +#define GT0_PACKAGE_ENERGY_STATUS		_MMIO(0x250004)
> +#define GT0_PACKAGE_RAPL_LIMIT			_MMIO(0x250008)
> +#define GT0_PACKAGE_POWER_SKU_UNIT		_MMIO(0x250068)
> +#define GT0_PLATFORM_ENERGY_STATUS		_MMIO(0x25006c)
Keep these before MTL_MEDIA_GSI_BASE to mainitain proper numeric order?
other then that patch looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Br,
Anshuman.
> +
>   #endif /* __INTEL_GT_REGS__ */
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 7d85a81bc39b..4a4aec1c67ab 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -12,6 +12,7 @@
>   #include "i915_reg.h"
>   #include "intel_mchbar_regs.h"
>   #include "intel_pcode.h"
> +#include "gt/intel_gt.h"
>   #include "gt/intel_gt_regs.h"
>   
>   /*
> @@ -34,6 +35,7 @@ struct hwm_reg {
>   	i915_reg_t pkg_power_sku;
>   	i915_reg_t pkg_rapl_limit;
>   	i915_reg_t energy_status_all;
> +	i915_reg_t energy_status_tile;
>   };
>   
>   struct hwm_energy_info {
> @@ -47,10 +49,12 @@ struct hwm_drvdata {
>   	struct device *hwmon_dev;
>   	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
>   	char name[12];
> +	int gt_n;
>   };
>   
>   struct i915_hwmon {
>   	struct hwm_drvdata ddat;
> +	struct hwm_drvdata ddat_gt[I915_MAX_GT];
>   	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>   	struct hwm_reg rg;
>   	int scl_shift_power;
> @@ -144,7 +148,10 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
>   	i915_reg_t rgaddr;
>   	u32 reg_val;
>   
> -	rgaddr = hwmon->rg.energy_status_all;
> +	if (ddat->gt_n >= 0)
> +		rgaddr = hwmon->rg.energy_status_tile;
> +	else
> +		rgaddr = hwmon->rg.energy_status_all;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> @@ -280,6 +287,11 @@ static const struct hwmon_channel_info *hwm_info[] = {
>   	NULL
>   };
>   
> +static const struct hwmon_channel_info *hwm_gt_info[] = {
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> +	NULL
> +};
> +
>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>   static int hwm_pcode_read_i1(struct drm_i915_private *i915, u32 *uval)
>   {
> @@ -409,7 +421,10 @@ hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>   
>   	switch (attr) {
>   	case hwmon_energy_input:
> -		rgaddr = hwmon->rg.energy_status_all;
> +		if (ddat->gt_n >= 0)
> +			rgaddr = hwmon->rg.energy_status_tile;
> +		else
> +			rgaddr = hwmon->rg.energy_status_all;
>   		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
>   	default:
>   		return 0;
> @@ -544,6 +559,44 @@ static const struct hwmon_chip_info hwm_chip_info = {
>   	.info = hwm_info,
>   };
>   
> +static umode_t
> +hwm_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		  u32 attr, int channel)
> +{
> +	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
> +
> +	switch (type) {
> +	case hwmon_energy:
> +		return hwm_energy_is_visible(ddat, attr);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	    int channel, long *val)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_energy:
> +		return hwm_energy_read(ddat, attr, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops hwm_gt_ops = {
> +	.is_visible = hwm_gt_is_visible,
> +	.read = hwm_gt_read,
> +};
> +
> +static const struct hwmon_chip_info hwm_gt_chip_info = {
> +	.ops = &hwm_gt_ops,
> +	.info = hwm_gt_info,
> +};
> +
>   static void
>   hwm_get_preregistration_info(struct drm_i915_private *i915)
>   {
> @@ -552,7 +605,9 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   	struct hwm_drvdata *ddat = &hwmon->ddat;
>   	intel_wakeref_t wakeref;
>   	u32 val_sku_unit;
> +	struct intel_gt *gt;
>   	long energy;
> +	int i;
>   
>   	if (IS_DG1(i915) || IS_DG2(i915)) {
>   		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> @@ -560,12 +615,21 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
>   		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
> +		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +	} else if (IS_XEHPSDV(i915)) {
> +		hwmon->rg.pkg_power_sku_unit = GT0_PACKAGE_POWER_SKU_UNIT;
> +		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_rapl_limit = GT0_PACKAGE_RAPL_LIMIT;
> +		hwmon->rg.energy_status_all = GT0_PLATFORM_ENERGY_STATUS;
> +		hwmon->rg.energy_status_tile = GT0_PACKAGE_ENERGY_STATUS;
> +		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>   	} else {
>   		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
> +		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
>   	}
>   
>   	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -591,6 +655,10 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   	 */
>   	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
>   		hwm_energy(ddat, &energy);
> +	if (i915_mmio_reg_valid(hwmon->rg.energy_status_tile)) {
> +		for_each_gt(gt, i915, i)
> +			hwm_energy(&hwmon->ddat_gt[i], &energy);
> +	}
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
> @@ -599,6 +667,9 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>   	struct i915_hwmon *hwmon;
>   	struct device *hwmon_dev;
>   	struct hwm_drvdata *ddat;
> +	struct hwm_drvdata *ddat_gt;
> +	struct intel_gt *gt;
> +	int i;
>   
>   	/* hwmon is available only for dGfx */
>   	if (!IS_DGFX(i915))
> @@ -615,6 +686,16 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>   	ddat->hwmon = hwmon;
>   	ddat->uncore = &i915->uncore;
>   	snprintf(ddat->name, sizeof(ddat->name), "i915");
> +	ddat->gt_n = -1;
> +
> +	for_each_gt(gt, i915, i) {
> +		ddat_gt = hwmon->ddat_gt + i;
> +
> +		ddat_gt->hwmon = hwmon;
> +		ddat_gt->uncore = gt->uncore;
> +		snprintf(ddat_gt->name, sizeof(ddat_gt->name), "i915_gt%u", i);
> +		ddat_gt->gt_n = i;
> +	}
>   
>   	hwm_get_preregistration_info(i915);
>   
> @@ -631,18 +712,47 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>   	}
>   
>   	ddat->hwmon_dev = hwmon_dev;
> +
> +	for_each_gt(gt, i915, i) {
> +		ddat_gt = hwmon->ddat_gt + i;
> +		/*
> +		 * Create per-gt directories only if a per-gt attribute is
> +		 * visible. Currently this is only energy
> +		 */
> +		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
> +			continue;
> +
> +		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
> +							    ddat_gt,
> +							    &hwm_gt_chip_info,
> +							    NULL);
> +		if (!IS_ERR(hwmon_dev))
> +			ddat_gt->hwmon_dev = hwmon_dev;
> +	}
>   }
>   
>   void i915_hwmon_unregister(struct drm_i915_private *i915)
>   {
>   	struct i915_hwmon *hwmon;
>   	struct hwm_drvdata *ddat;
> +	struct intel_gt *gt;
> +	int i;
>   
>   	hwmon = fetch_and_zero(&i915->hwmon);
>   	if (!hwmon)
>   		return;
>   
>   	ddat = &hwmon->ddat;
> +
> +	for_each_gt(gt, i915, i) {
> +		struct hwm_drvdata *ddat_gt;
> +
> +		ddat_gt = hwmon->ddat_gt + i;
> +
> +		if (ddat_gt->hwmon_dev)
> +			hwmon_device_unregister(ddat_gt->hwmon_dev);
> +	}
> +
>   	if (ddat->hwmon_dev)
>   		hwmon_device_unregister(ddat->hwmon_dev);
>   

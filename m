Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F4D66E19A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 16:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9709910E554;
	Tue, 17 Jan 2023 15:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0B710E551;
 Tue, 17 Jan 2023 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673967888; x=1705503888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6sJfd1nCruH9eQMckQXSBxn0yYv9mS12wTs0kJO0pY0=;
 b=m3gyHhn5HoPAb20SfrPBDaPmv9xm9UKY+o06ww5BKz2g8U13kBzekPMi
 YWrK005ImZ5z2sJBr7Q1F0JyFwN8YYmN/jkhlWXm/ZiBRZEDG74Afti6I
 oxsLCU7GxtHPHzdPFlDSafPi7rH0ruzFKBByPwUbi2l11+1YpOzG9lGni
 VcjBZSABQRxmK+8p3C5u7x9TNvA+SHvLrkY+MRZz0uiUj48+I1//wxlp/
 18DmO4GAdsoKuTxnVdYNhzUf2sXeKEM9mW39I0iGA4QTB77uReWfGM+UK
 LfeIGEop+qEAM/vwBLOc+TvLpZ1Ua8qCz5fSWWG/wLbsh8Rc4ShddtZUL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304399877"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="304399877"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 07:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="691613738"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="691613738"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 17 Jan 2023 07:03:38 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 07:03:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 07:03:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 07:03:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 07:03:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjV1SIKzVupumGiF8oUszB8tDaIPKFZ/arzeMWBpS4wTGNnB6uOPWZ/uLsUmJyfFHClyJnrHXSzLn2GN31AA4IFEpfLMg+xe5TCmooRDKiTGwos+mXfJJI4Y6iVPB2UQpuMAoE+8+lql84/4rhCZeW6RrLWbsBfinrKDdePDDphxX+4IM5kgK99VW+ytNiTH+bVOSQ5VEbk5PU8HXWpiw3+fBsn7ArgPhLppH902fcTFSmpGej1MrtBA8AkodwfezEge95/FO9q6DuILG9edErli+G9C3KWqv5f4sVfHqoIGS7HdvG6O13Up5j6WPq4QW/MzbfykyT+DT4VN2xKMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0kpVRLS6HjfC+s2t10v0kmkik/9O0ilZjUsgyFCFX8=;
 b=j8oaSyJVzPZOpvX89BlKGrC7uv78VFuqmiIby+kCINgi7A6xqn63D7rYlzUrW2cOz+1c4lKUx0yBDSa/JDdDsmWaxptNVGAsJhJ1NgaOxZ3wb/YG78lGSv4/Ebnort8aSQhqR8FY2PJWHJWeMnB7hdC/v+DXXFF3unXbePdew94mwEhoKjmXXDEZVmpsJwKSlrb1gUw2gXJCDVrCVOnXgMCfoKYzUmxeAD2fMOg+NJUTqfYwI19jQ+leDcOw/ysiB+4K6abGGE70f5FxAbJIN9F7zyvLsfO3dPxy6ZsPbPC8LOEfrbDdySDDnKtR8bLCFjS5R+tin/ysI27C7qhaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SA0PR11MB4542.namprd11.prod.outlook.com (2603:10b6:806:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 15:03:36 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f%6]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 15:03:36 +0000
Message-ID: <e145e3f4-38a7-9ffb-31bf-48f6e003b31a@intel.com>
Date: Tue, 17 Jan 2023 16:03:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230117115350.1071-1-nirmoy.das@intel.com>
 <Y8a1ciLKt9uLZDh6@ravnborg.org>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <Y8a1ciLKt9uLZDh6@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SA0PR11MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6d8ec3-c89d-4049-65d3-08daf89c0215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nX5r5vQPD8XhO8p6qyuQ20LCjqJxIqUaS+pxf0iUPYMsGH1qxmENGRvUf14D4R+yQ5xC0w/vZ10lE9B3eWsQUq9oJKWoL4doIExUqlryZFaQ6D8vZyvuBYH2LlVNdujNUqzIqusN/rHnb1VnL3o5Logy/YxekvB33iymNkiu/0Ols/3BAIBItoLzkhSTJglJ+q0PI89P7Sx8P8h3be8m8aIZnQfc7V8xZnj2nqXA05DbcNd/JuLUHcFtjVIeFzefkGJlT0wJ66VoHMS9sUzWcT7nsucDyFQQGVu3LReLNswn0MkOCyaN2NnmOtd0NDpIQI7/bmMxxOMMTdp0GuwdWuzKnGnTYlPXbt4nraA0QKJdnVcQbSx2fD4T4+EsonSzp0HwimBrWg7eI9iJM3G96GHnviurJkEkHHhmvqy4SQ89fpRcw641KUZ/OHuvw6KTR45tW8IwkoHpQT2ZrYAv4QVFUtqe/I8BPjmb0znsyJCRum2UYYYXFrWzjCP362dV2dth8d+slZrzHizab62aAdxnhvZ8MSpylZoQ3tfux4KNEEnlCoD0cAScwZ0uw5f66jvvqzt6RDp9l4NyQEp/BToNQlLA76kWEyDGDb1fhGRKJQCDXrSuC9SV9x8sGLg8ShwcKOVUDoFpHFhUjCA5YCpHrSbgzc/BSAG7fgMyOWEVXTJa0fxombBRUB8TB6rufjjUbuoi6gC+YWR26iSt46aNtz5PnWoOvxowmBYsnOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(83380400001)(38100700002)(31696002)(8936002)(82960400001)(66556008)(6916009)(4326008)(86362001)(2906002)(66946007)(66476007)(8676002)(5660300002)(6512007)(41300700001)(186003)(6506007)(53546011)(2616005)(6666004)(26005)(6486002)(316002)(478600001)(54906003)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3I5UEZQK3QrdUwyWFpiSzZwbHRidy9xM2RBT1pwUzdudzBnL3psSFVadTlB?=
 =?utf-8?B?dGkyS0lSK3BlMlk0M0w4UmNyUnZZSnV2alR0bXpzNEtRLzQxT2FYQlcxbjd6?=
 =?utf-8?B?N05RaDlDa2E3RXFZV3lwT09BZXp6eXZmOHV6NTJhVEdVdm1hVm5adkxHQlE0?=
 =?utf-8?B?andvemtOUTdRWjZCUU9yZE5pK2ZnWVpsVFBlN093VnZHQzN1QU16ZVhOYWQx?=
 =?utf-8?B?eXl2WGxQcGtwTlpaVlNsMzVTMHNNZGlkQ2ZtOUpFUENwQ00ySklQVWhRcWlT?=
 =?utf-8?B?bkFyUENjYmRHNE5ndHFJNmlDZW42SS94SGJ5c002S2tCYkdUMWVQVGFmNHR5?=
 =?utf-8?B?ZWVGV1IwUEg5eXYxOFRoMTJGeTgwQjFpbzNpMzRNY1IrbDU0bjhucUVIdmp3?=
 =?utf-8?B?Y0gzSXYvaW1HdjlldGk1M09Za0RTU2ZObW92MjByM2hhSlN2TmVjMUhUbjdu?=
 =?utf-8?B?U3pCcG50NUpXM08rbWpDcGd1QW9Wd3hta1FLMlNGdkptei9tb2x0dm1CREVl?=
 =?utf-8?B?S3ZQQlRqOHFONXFFZTBWU05qMTBFN2tYYnFtRyszZDk4aTh0cU1IQktkSHg4?=
 =?utf-8?B?eGZ0enNuSTcxK3VlaGlxanlaM0VIM1Z3ZWhYbjE3a0RJSVFSUVNSOXhQNjh3?=
 =?utf-8?B?REowRHJTa1R5YWxFbHNJRHNuQU9wRVdUZ1c5Z0VCa2psZjcxMzRvNU1weGxx?=
 =?utf-8?B?SkRnZDVOZ0RlaEtPRFdjV3pMSEMwOWIxVFVic1haa1JpZHhUaWwvcVYweDZu?=
 =?utf-8?B?UjQ2TklFY21LSzFUMjVHZzFHMEtwZlB5WTgwU1VZekFOZERtOTY5aVhtQTRq?=
 =?utf-8?B?RDBkZWRvRXFUVWYxbkUxNjZMVUhSOURqaCtwSWplMGI0akRwUU05blVmaFZ5?=
 =?utf-8?B?clgyNTVMcE96UDM0K3VUTVYyeFJlOStsbU1ITzhUclRaaFMyeEk5YXJxL2Vh?=
 =?utf-8?B?SkVOTTBXSDh5YVNSK21PbXNiSFhqM1RSa3FwZTEvS3YvbEE0cUZQRTBBWnd3?=
 =?utf-8?B?emxMazdKRzl5WXlBRzdlelR4SDdPSEIxZUh3d1BTV3Fra1RxeWo1TWpQNGQy?=
 =?utf-8?B?bkNLS21ZOWswVmRFanZJSnVQdWxuK3p3YUJ1eFMxTWoxcFlCQ1FyM05oV25x?=
 =?utf-8?B?Um1GaEJrbnB1RHprM01zQTBDbUxxb1pDS01HVVI5dXV4Uk9sSnZxL3A5M3Bn?=
 =?utf-8?B?SDFKVWhjV2J3RFVlRFVXZCtkN2xHRHZ4bWVwVHhzR0RmUy95cS9pK1Vja082?=
 =?utf-8?B?d2Ruakx3aVd6ejJMdXVzdGhid0FVMnM0Ui9QNFBTRFhoNEk1c2owbnJnREsx?=
 =?utf-8?B?T2RJQlA5Z2JNWUtybHNRT3BTWUpZbTFtb2xWUW5RclJMODZtc1dUdlN0Ukxz?=
 =?utf-8?B?cUtRc3NZcTMxU0tiVlVpdUVxZzY2MnNibkdLdlhFZFkzRjlSSWVWMURjWU94?=
 =?utf-8?B?Nk1QWGRFUjRJWE1YUmFSTlB6bXBWMGlYcTNxUHYwK2VmNDV4c1dCSjNwMXFK?=
 =?utf-8?B?VGpBaVZMSzZYSkdJSE12MHJRYXpGL0ZMbmRTWWRMZTFqVDNMMVE3M1F6N05X?=
 =?utf-8?B?SnFTdEk3R1ZNVDBJcTlmSWNuNDdZMzZnSnZ5VU1EUUtlK1NrY2ZvU0lYS294?=
 =?utf-8?B?amEvYkwyVXEyOHNObHBTbmZsQ1ZBZnpNcXA1aUk4ei9SemF6TE1vZnIrS2px?=
 =?utf-8?B?NkVwOEhldEJESFBYNE8zcmxOa05CVVpxSk5QcU9MeWtSTVdYQ0hrdkd6Mmdl?=
 =?utf-8?B?UjhlZXhqSW5hTkVYdUxlRFB0bVp0V0hUakswYWU3dXZwbDBjbnBBc1BGSTJQ?=
 =?utf-8?B?QU5ycWdwZ0xPalRoWlN4bVV5MlJmalVURFNpRlhRYmNFaEl0WG9vSzNEWnFa?=
 =?utf-8?B?L2pFcHFWMWJkaW94eEdRdTVxdjBmUGtHSWtiejVLT0FLZjROZHN5ZTlBbHVV?=
 =?utf-8?B?c2RtQktUa1lNbFBJOE9FWnR1N0xycGppMURtYWE5cU1ZUnlnWkdWcnY4MTFF?=
 =?utf-8?B?M1RDWFI3alZXME1VVDRudjJEclN6aDNENzhudU1QQUdkNDZUdXQ2OFYvRG1n?=
 =?utf-8?B?ZUV5TlVEc0dBTm44b3Q3UXVGU3lXc3BTZnRIQUYzN1ZHa0xpTE5uM29vS1c1?=
 =?utf-8?Q?+Ft6akfWSF/Kocr6ua170pZPy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6d8ec3-c89d-4049-65d3-08daf89c0215
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 15:03:36.2702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsncnfAoqbBCLlv4mEU0nR2xISFcDeIQ5i2lJTwP7uSa2DymQn4aLZA/znUyEyY6VrL7zaLr0cWFTvvIJTOejw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4542
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 1/17/2023 3:49 PM, Sam Ravnborg wrote:
> Hi Nirmoy
>
> On Tue, Jan 17, 2023 at 12:53:49PM +0100, Nirmoy Das wrote:
>> Add a function for ratelimitted debug print.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Thanks for adding this.
> The patch as-is is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> It would have been nice to start adding kernel-doc to the
> non-deprecated logging functions. But as everyone else is missing this,
> it is OK that we miss it here.
>
> A couple of nice follow-up patches would be to introduce a KMS variant
> and replace the only user of DRM_DEBUG_KMS_RATELIMITED with the new
> variant and remove the old one.
>
> And maybe even update the remaining *ERROR_RATELIMITED users to a new
> variant - and drop the deprecated ones.


Thanks for reviewing this. I can definitely work on your suggested 
follow-up patches.

Nirmoy

>
> 	Sam
>
>> ---
>>   include/drm/drm_print.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index a44fb7ef257f..1d839f507319 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
>>   		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
>>   })
>>   
>> +#define drm_dbg_ratelimited(drm, fmt, ...) \
>> +	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
>> +
>>   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>>   	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>>   
>> -- 
>> 2.39.0

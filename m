Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C454FF31
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 23:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9113E10E19F;
	Fri, 17 Jun 2022 21:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96FC10E23D;
 Fri, 17 Jun 2022 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655500283; x=1687036283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wFtMgcZ1R8mAoUEYTvn1MvlwL6JcejTR5CY1dnuRQZM=;
 b=fZ/A3gIbfbkhjxVHnFT2zCrfnbIb1yvFf9UCeqB0GpVxHUzkKXC732R2
 mTTYX7HnG2Prph4UvelaY3HtfWytYJil0UBIG0HonQ40YKljmh0AMUikT
 buPTNBEY32NjP4tve0Ftz/dhHe0svxCEf9DIe6wTuNnz/8VwVOFSOGMjq
 ygfBu4RosUOMpm+JtnosRNwnwVrl7+8KXt75l7RUr8fa/QtVurGANx4Ja
 qtWD7zwQA64v86IS99YezRPFwVm9l7NcWUpZcEYYgQMaD+iEQaGgfSPd1
 QNG8LkhoEMJhp/o85IB2+dfg2rA6rIOX+SFD3UIzzyIrRIZ31CRxN9mJV A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280647543"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280647543"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 14:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="619386014"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 17 Jun 2022 14:11:22 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 14:11:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 14:11:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 17 Jun 2022 14:11:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 17 Jun 2022 14:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cchmzJFS2+lgafdo6d/Is1u4UO/hPOjixBcdNrSRn+DdF/4icYeVsdYNVqDRYJZUUJZr+k5+VZ5v3kbf2VthPHhAn50zq7VIErXSz3oeQSIL6105FkVG82oNGdyh5wdo1hUY5rfjaDGhpFjMzvmDl9raQwFDFn0fzd9rYdXDRStFOoHGuvlb+DLJacKH5RXBYKwMxuARERZR9wJ/vzHJ1ESjZa1s9ciBcZzUmvrrlMGUJ0Ojhpotq3OwVX08aIcwFLJ/LQO68I72+1oUTLKHWBkapEEDCv9+HLU+/O3JB1ZRZ/JspTwygWeRUD3D4JLXBFVFjFe7Ev9uhkfTvyN6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYZ6K0k1F91fqx9oBp8JpuvYyUtywO0SxqHfh4cji4k=;
 b=IWR+SpYi/41X/4xJdbDLi6xx3W/xLmo1hKqktDz31eJEXg0SBYSTy5OXL15m7J+wbSDWeFFPSixtXItB096G2j2YFWkSaarRYreDVm40m7NjQQRxhRxO9+ICcQEM+OHnkpamgHTHT3lxlbZa1b97+pNnnKFzA5twPPU8LfWDZDM4431IetiPR6IG5IhMtR1ElbP2tEmaX2kvukiq1zeERLlBsTrkg/7Qm1VCHh97sE2qVOU1ZBgu/6TGENI9/uvO1RGGr4jOtQyr5TTDt+mVwm4Mh176EnaDoM5AIyj6kz8G9Z96dEl0Zklw0IUVmRT+7UpPuoas+sfcTulaVbI/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by MWHPR11MB0047.namprd11.prod.outlook.com (2603:10b6:301:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 17 Jun
 2022 21:11:20 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::587d:a946:3907:11c8]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::587d:a946:3907:11c8%6]) with mapi id 15.20.5332.024; Fri, 17 Jun 2022
 21:11:20 +0000
Message-ID: <b9d761b7-b6f5-d0af-e803-4479acef739c@intel.com>
Date: Fri, 17 Jun 2022 14:11:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915: Add global forcewake status to drpc
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220617202534.30609-1-vinay.belgaumkar@intel.com>
 <87h74jvwns.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87h74jvwns.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 534f5786-34ff-4092-610f-08da50a5ed20
X-MS-TrafficTypeDiagnostic: MWHPR11MB0047:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB0047A17AF5B6F62EEF5D211985AF9@MWHPR11MB0047.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pt1fiU923OuwPok7S+5n5VfvJkZKJd933HQj/eGu+syoPXN35jkVttkdnq9bM/dhI75E6SGs0FY/5WoSKCXyPrUhycUDMKZ7f0rrkfpG3vIZHMvYAeN5Kw8v5OKvShbVj1N4wsSf1uhZaCmYxcGzBnDtp2u9i8MLUftcGq45+ZWFrnv+yDfZgBkhqpY2crNyiy300wNjjaTBfYJ/RT2sOjctWtxcOFCYTKlBPqmCg+n2Dd0+EHDu6iq7cEiClDcYSb7I2VlG13YhoNxxzcW3fhC+idaLcIH6ECD+sTL/iMbL+pP0k4UfFRES0B2l/ODdwvCSkOfyRBUpDZHbFZZeNuM5J5CGbPyMiXvzmV5t7fBYUe7zFqvn0rHY2S+gdcDutmyAil7HQWR7AC1bO2wqGGil1i8wMxEyVh7RVw3IrDtE3QFxkvRZKJAndrWE+1OcJ5gZrq/7MXbEpUxX/Gba/hRgJchZ/9RbZUpliEJ9f5vylKFFKtOi9MA/hFs4L2XkPfwNqcNHAsYlDrVZYNLyZI2BGipRyYql2AB8OKTo8+1xB5acdW5KzQDyrw/XyBVJgagCFgeR5PbHcsoaUxNhrQnPX5vgi4x9vR4pL/fV58pUwuOrdIMs53mZFfCO+N5lfdxTplX80U8ISVwGLAfl7uFADtQBmqmubmz17nU8QSGAGxilOoMFoAGj2Q2xO8+S8awdijPKO9wWTnW6EfOINzWRAN/F9Y/W//pNw7d4MbtLuYTRBEHnSRzG2lZd400n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(2616005)(186003)(31686004)(6512007)(4326008)(498600001)(6486002)(66556008)(66946007)(5660300002)(36756003)(2906002)(450100002)(6862004)(8676002)(8936002)(66476007)(6636002)(83380400001)(82960400001)(31696002)(26005)(37006003)(38100700002)(86362001)(6506007)(316002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDE2M1daSnZJOFV1Q3dSRlNrY0tPTHZ4bjFueWxKdmFxalVzTWVUQXBXM001?=
 =?utf-8?B?VDh3ZXpHVUtvQTkzcVpZd2wyL0t0L1BTU2VYTkdUVVRIaHVEYnUvODFPR0dU?=
 =?utf-8?B?UDk5SHlENlo3Mi9QVmdsQnVUMzlDKytQU216Q0RlSWtyRzVPWXlOcVVmSVMw?=
 =?utf-8?B?VGphT04xQlZNTmhmeDlHNFhuVlgzMVkvNGg4ODhxY2FRQVdBRCs4RU9vRFNZ?=
 =?utf-8?B?N3J2b1FwdzRoVWFEQnJkK3AvQ1dLU1BQVlVBTVpPQWpqemJxOHhKejJ3UG8z?=
 =?utf-8?B?SDRCblNXWTdRMkdHVzJIWXRiTXRCWmpkVlBkdUNURFNhWVMxSkM0Z0t0WnFP?=
 =?utf-8?B?aDNrSEF0ZWZTNWpCQlVTOEphbk1nQUFlSVVhMDg3eGgzWHF2T2lHcWYvNThK?=
 =?utf-8?B?b2hmUzU3TFZFUGRSWk1ldlN0VUlHMStTNVFPRFdxbVMyQXJEVmxKZGhSTnVv?=
 =?utf-8?B?dFUvbW55RW1Rd0c0REtsZU5OWDJncllPd0tCRCtEZlJSNWRqbGJTUHlGK0xT?=
 =?utf-8?B?ZDBOdkdHSFFTV3h0NnRwZlRWZ29JQkE4TVhhV2VoOVJoSkJSYmw4bDZwN1hY?=
 =?utf-8?B?Tkl2eTJoREFnMDB2UmFGNC9sVGg1a1ZRdUpBU1pveUtvaU9sTk9OQTF4dzdn?=
 =?utf-8?B?VkNHRmRNbHVRei9rYmlFMk8xTjV5VHFsbERCaDVmYnlCd0w4NUtQRGdUdDBZ?=
 =?utf-8?B?UitCV3kyUFo4ckdOU1RNLy9xZkJRbjg2VkFGWVRQWFhJbmZGaW5vWmVYMjV5?=
 =?utf-8?B?OHFPWUl3cXdMaytCSitJWnlWc0tBUGU4QjZlMWx3bzV6dUgvOGVjOUNyNEVu?=
 =?utf-8?B?bzBRTXlwdnNWcDRZc00zaXhjektScklyWWtFb1FaM2RIVG0zeW9oTVMra3Nq?=
 =?utf-8?B?M2tKQitubHhXT1FVVG5IdWR3NjErUXVSdm1XTU52NThwc2EweFdBOGFQSHp0?=
 =?utf-8?B?QVZ2UjJFSDRaQ0FkbHVQTUZ1N1ltVnp3cC9XU05Fc3RySnFzTDFpTmZXL0p3?=
 =?utf-8?B?a21xbDh1QVpHSFRuR0hJWTVpZ3Z0UG9qZU41dzhGNk9Wa3IzQ2pGNUFUbTk5?=
 =?utf-8?B?SFpFTk9qc2l3WExCNXJydEVHem4xNEIySDcyR0FMSGpKWjJlOUhmcC9kd1pE?=
 =?utf-8?B?em5sc1B5bDI5d0RoQ0RaTkx0WXpKVW9SbnB6WFBqcTE3c2lqR0Z0ZHhQOVQ5?=
 =?utf-8?B?c3kxQVA3WW5ERjRIMEdTaEY5OTNWWFptUDRQTGRkazFuRjREY3lNZUhoYmNI?=
 =?utf-8?B?c0FtTTgrTnNsaGtLbjNMMDZhZGloVEp4ZWN1a1NqQmp5NlJmWXRIbzNyUWRa?=
 =?utf-8?B?YklsWlVCaHI5NExkWEpCbS8yTDI3VXlZYzJaVFNSelhOV09STnpUWENwVG1T?=
 =?utf-8?B?YVdVOUNLRWJQZUZuM3c1dFpjVnV1MUtKN2NoRE5XSGlqNW8vTGhuUTdqTFAr?=
 =?utf-8?B?c1JCMWV6U0pXcmpMZXVKcWNmVExIcTRpS0tmeitEZ1BxaDR1Qk5oSllyMVVU?=
 =?utf-8?B?NHpySGx6V1VaSXVyZHJaK3dYMUR5SnQyLzVhUHY5MlJWTXQ4Y0w3K2FMMnlq?=
 =?utf-8?B?NnQxRTR5blBFakZXMElVaHc5TERhMXd0K1FlZ2RMZEJpaGNYOGg2TGpqczBF?=
 =?utf-8?B?OTdOQWtoZGJnMlhyejJpK0N4OG02bk11UjIyR3EyR2Y0QW1STXpNWHVyOWJM?=
 =?utf-8?B?eThTQWZyeGN4ZGJNYTd4dGJ4NmFFNE1ETElaNFc4a1FiU0RrcTVGWTk3c2sr?=
 =?utf-8?B?czg1MHovTUo3Y2lsWU9VVzVjUk1MNm1kcXV3ZDZnRGF1S3V4RkFCQy9DdytP?=
 =?utf-8?B?aGFIMmhld01TcEVPbC9vdm9UMEFJK1prNWc3YTJnVFpFWDM1M0NUc0tpSTBW?=
 =?utf-8?B?a281ZENXL1JzY0gzczhDZnNrVE9pOTBKNmRHTloxZ2tvWDJpL3hwYWFObVNT?=
 =?utf-8?B?TnJkQUJrQ3RRNDYraGhib2kzZWpKanVOU0lrMWN0anNnYms4Z0RpdmV5am1S?=
 =?utf-8?B?SFJJdU1DNUY5QjllTlE5REdmUlhnTGszUnRBSERJV1pWTVBnMGkvbXJ3Tkcr?=
 =?utf-8?B?MnN2NkhCeGFVclVtU1BTUXczaElCRlVyN284d1F0d25kNkYzZTJxdXhJSlo5?=
 =?utf-8?B?ZFNNR3liLzl3WmtsVzVEbGF4bE5ZaWt6OE9xSHhVOTBmaWprbXN6MVRvLzls?=
 =?utf-8?B?d2wya1pxbENVT0JvU2dTWEI3VzhNdWFBSkMvaTI4WkM4eGFuaCsvYVpqNi9o?=
 =?utf-8?B?ekF6Q3I4SFptMjVnMzZaRlFSb2s5bEM3eDhNaTdDTjQzVmFxeDVFL1JSU3RT?=
 =?utf-8?B?OWU4cEVUQ3V4T2ZxckVDTG0zeFJyQWxFMFY4UDRoczNZTm84WUI3M1d4TUZp?=
 =?utf-8?Q?qUUnf6HMEwsAXouk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 534f5786-34ff-4092-610f-08da50a5ed20
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 21:11:20.5588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6i/oi6CMz6EyWfGAE4G6Ci4YfGK3z+4vAA9/lALOBUCqGD6GP+9oGQjce/5ZI6hoi47+FXDSRHrKeiVXfnW+eoDP2FJWtOr2YTKPsClRzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0047
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


On 6/17/2022 1:53 PM, Dixit, Ashutosh wrote:
> On Fri, 17 Jun 2022 13:25:34 -0700, Vinay Belgaumkar wrote:
>> We have seen multiple RC6 issues where it is useful to know
>> which global forcewake bits are set. Add this to the 'drpc'
>> debugfs output.
> A couple of optional nits below to look at but otherwise this is:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>> +static u32 mt_fwake_status(struct intel_uncore *uncore)
>> +{
>> +	return intel_uncore_read_fw(uncore, FORCEWAKE_MT);
>> +}
>> +
>>   static int vlv_drpc(struct seq_file *m)
>>   {
>> 	struct intel_gt *gt = m->private;
>> 	struct intel_uncore *uncore = gt->uncore;
>> -	u32 rcctl1, pw_status;
>> +	u32 rcctl1, pw_status, mt_fwake;
>>
>> +	mt_fwake = mt_fwake_status(uncore);
> I would get rid of the function and just duplicate the intel_uncore_read_fw().
Made it a function in case we can find the equivalent register for ILK. 
Though, I am not sure if ILK even had the concept of MT fwake.
>
>> 	pw_status = intel_uncore_read(uncore, VLV_GTLC_PW_STATUS);
>> 	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
>>
>> 	seq_printf(m, "RC6 Enabled: %s\n",
>> 		   str_yes_no(rcctl1 & (GEN7_RC_CTL_TO_MODE |
>> 					GEN6_RC_CTL_EI_MODE(1))));
>> +	seq_printf(m, "Multi-threaded Forcewake: 0x%x\n", mt_fwake);
> Is "Multi-threaded Forcewake Request" (the Bspec register name) a more
> descriptive print?
>
> Same for gen6_drpc() below. Thanks!

Sure.

Thanks,

Vinay.


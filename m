Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853144BA6A2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340B10E29C;
	Thu, 17 Feb 2022 17:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D45E10E29C;
 Thu, 17 Feb 2022 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645117469; x=1676653469;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oKG3PYJThxJD55E5y+brOwW6g4YKDHHEN1Fs4F3gKdE=;
 b=QW8FuXwuz5G4nE0LJvA/FYrndqJOpHVOWY3tktI0fAwlCPid4CA4rGOk
 UIQn5CDw4sfcoQHo2dk3k5akK/eDCNbKyomic4Iv18d5movaK3jxP+zct
 Lce+OFojLhvc2dRFHaNSPk1wItD6YvlKiC5yqItaVwEbuJqGy4bJdN8WW
 pQRvOxvH/ombJalv4+VMbIJM4aOEYamTN5ZzGr6vmQs+xKnfXurMgPxOs
 uNG142h9knnBYm/U9tfrE46xQG4YzFEoRGZ9YRHMn1Ct4I5zKXZi86nEE
 xfPFRyqpzwnwMndWtH++Sm+bIx7xjA1CllftZPDcDaFL/te47IgayucGm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238324902"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="238324902"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="541242003"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 17 Feb 2022 09:04:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 09:04:17 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 09:04:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 09:04:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 09:04:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhjHi+pVSfpVM8LJaPlbB408F5eVGdkz/ta7mXmvxUIiQ4nuziuf8sfXUsnJlTgsTt39UF5WCFI35Mj7nye7E0ORPYM3+2Ak3H6jNvDh3sSmOKOcB+RDJ8w1crd3+/hbD19j3osO36b8f6Z0SgFq0LTNFVp19IDMDygxjH05LPoTVaX99ZKq9EDCDSvd6/Juji/BYR6br/I7I1GgXKnVBBCxqzmEKP4DjbJTh2emXXNU9b3UoEvVMtYQtAPEkhfZSEgSv+/nbEqZZLkRNpj2mc8QJnRUqGy5rFeUDF4Qn5H1EaHPpds191cr4C7Uxag0RodKe/7/WZSSAeHRHchLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Wz6A1GAAZ/XfNyIi9++kuqX+oqXnldDGbQyKWfhiO0=;
 b=NyhxctctbUD8KOitjiwOXU+a33U/fIsx9K6gLH1MFUoUuBSp8LsnF9PjIlj79KRPa/Dp9g9LYF7BRg796JQArG7Aus9RbID5fEx9XQn49Yh/Q7Vc7+LzOb1G8st/A7xxwtlpTy690j6LgCvCGr6IYMa1pomiRBopqaWYQtB3T1CH0WEeCJ466ZDaODTC5AezbbK/w2QcD7Hpz90LtLnZgKzeaQXL3AtbG/MCmUP02jkHuHg6811lXTyMlCKEztyH6oXDpTbbePq0I+5dQAXTFCRMeajQ85qDX6Bajo2Yx6fBtp0nvCknxNodTPtfQeoh33WPOQxUlNnqIfsi5NuP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BY5PR11MB4136.namprd11.prod.outlook.com (2603:10b6:a03:192::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 17:04:15 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::396c:391f:397f:8906]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::396c:391f:397f:8906%5]) with mapi id 15.20.4995.017; Thu, 17 Feb 2022
 17:04:15 +0000
Message-ID: <8e9b9f61-d0ad-9278-4ba8-08a934cfacb6@intel.com>
Date: Thu, 17 Feb 2022 09:04:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Correct the param count
 for unset param
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220216181504.7155-1-vinay.belgaumkar@intel.com>
 <9c817a6f-ba41-1b68-5a7a-30032881057b@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <9c817a6f-ba41-1b68-5a7a-30032881057b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c243cf06-0db8-45db-8535-08d9f2378719
X-MS-TrafficTypeDiagnostic: BY5PR11MB4136:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB41367FDE02D7CAA9DA30458985369@BY5PR11MB4136.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJEuj07iDZq9m5Wv5v9BoLhTu+DdNQt6f0UI49FmLKdrMF8onxoe4QjTYKox6lzepYWRicL4sz+OcRG0s9I/cSuqskEUMBAG+0KmhOGf1q66NjWAygBw1xsImarEPj8adPJWSUmwoSaBzZeXcBXnnwrF+gFVcrPpQnRJPyf8k6N8ph6hHnaQJVtl8Fu/ATsvS9wN48OuZ8SWHPHCxnU+OYze8W1O9dINPsfJY3ZIQnZ4r/fxD8tCG9trFXHxOyUX4nOJ9tWPw7HFUVfonJYCEd6pAKJaCdA4VK05s+DQLp4MCoxzMUxx8/aCPY0ykTrQL99w5WZqAWYsvlE0NZFGXYpH/NkmM8d2ahlFk0xsT86i3es2NavSf/9qmJ64mGDOvbVY/7LmYOVlSTgv4QJ197HPf15WG3wUnyvxtsdz+YrV6VsuDbfOw8jXdzrg75rDNvZghK7pMZbqqoIDSa2XliJNSNT7VnxJeDOWuKYcwUsONwLZ2OP07jsVLungEzKQLW9FOrnWI79bRhlHxEo9q3VsvTXAH9HHs/euuAzWFfmUN9aVOk9B72VvQFOvX9Y7o5Hr8GPDkm+p7nqMpxUTLt00GaKtK6c//vD/Hh6/5L0aqA9Lt3CuPlagSmRtKSlHP/mePHZA0MF4+2F24tyAdX35U4+uoxRqHxCOosDxX0cnbMZzAQTEBffX4llxU6D0BQJRR7bHgsUJpVflG9JSRp+d+xUzlwz6BVyEIajIF1tqO496ixExQFPjD/LBjzvd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(36756003)(66476007)(66946007)(66556008)(8676002)(2616005)(31686004)(86362001)(6512007)(316002)(8936002)(31696002)(82960400001)(186003)(26005)(6506007)(53546011)(6486002)(83380400001)(508600001)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkMydFNWNzJhaWZNUTBEMVlTUHlvL3lySmZMYmJ0YWtWbjZ5MWZ0QzZnbDEr?=
 =?utf-8?B?VHM1WktuMW5XdFNUd2szMlNJL0UycWVhVHoxbkZFYWhOT1hZNE5aenR6cHlr?=
 =?utf-8?B?NXYzSFpOVWJaU1J1U2M3dWxIbGpWMHAvSTJSNnVvK3FKMU5EcGhIT0RwK0Yx?=
 =?utf-8?B?ZGl1ZmZheVNmYXdFdFZFNVlUdm1VTjFad1NxZDBqbllWelNodWlwdWtVMk5n?=
 =?utf-8?B?YWlJbjZhMzJZUWY3VDY0OVZXNk5DQzhyUmdBUlNlVVh6SUtJcGFPWnowZUVY?=
 =?utf-8?B?WEp0RmltdTdLWlBmQy9oRm8vZGw5UnNNdzZLeDQvUFdHTklTSFhzUnpPMTlE?=
 =?utf-8?B?YlB1cXdHSmJ3VTk5ek0wMDNCbERSbXpsZ1hiYlNOakQ5NzNOejFER1g2a3p5?=
 =?utf-8?B?NmVqVm5jZ3lwUyt6OTg2cjJyUXVkMFU5YnhyUEpiUTV5R1VNSGJsNTJrZDVy?=
 =?utf-8?B?aDNGVTFjWUEvWWhISW5FN0NpaWZmc2pPVDVZZ2xEMFBGT1EybGhzUEJKUDN5?=
 =?utf-8?B?SEZsS29XNkJ3bHArL1JkaG1yM0xOT2pCUHVDRzhLZTRrdHlrMEpYMENYc08w?=
 =?utf-8?B?TFN2MzREL1FWdGRYbVUxc3VmNUFuaDVsZUY3MUdsOE8vcGVsZXozQ2xDR1kx?=
 =?utf-8?B?NG53YjRKak9hTXFjT1RmbUhtZUtaV2FZUVNyM0JOamtnbEl0TGJmTnJVMmkv?=
 =?utf-8?B?Njh2Z3NyZTEyK3E4NXpKZ2thZ1VkNDRMVTNNMW5TVmdYRHVTOGs3WFIrMTRI?=
 =?utf-8?B?Qi9WM2lLeklCS2dHTDFYSmlCM09yUTB3RFJVWjhtdkg0OW9ObGZyQ0RaSmsx?=
 =?utf-8?B?UkhLamdnN2VTeFkxR0Q4dWEzcmZ0Qk1GZzkxaXltNVREeVZtL2hMOFlUSEJi?=
 =?utf-8?B?UnlCbW5uRlpKU0hHL2dhVC8wNHZKRWxVcUlNbXhrRy9rRW9TYmpteEFMeis2?=
 =?utf-8?B?WmRndWRQOGswSEdVdkpyT1A2WHNzWFlGNmNKbXNnb3NTWC9henlnejNUOWxS?=
 =?utf-8?B?N2R6MjVlMUEvNy9uMkZ4akx1QnduNGZSdnRzTzZMVzZhRHRTSzJQc1JyUitI?=
 =?utf-8?B?dkRYRzBkTDJvVDAwdUw1c0tmcVprdUhKZUc5WnQzSkxDT3l1LzJPdDlKUndW?=
 =?utf-8?B?QnJUdEVtKzlORVRPUXlPTWE1Yit0MHc1ZTVzeHNuRUZ1ZzIza1l2TVR0eXhl?=
 =?utf-8?B?bUZFenVuMkY2anJSbHgyQ0JkdVJQd0J3S0c2amlER0RFL0p4bm0xamIxOXhH?=
 =?utf-8?B?WDcwN3N5V3pjREdiWUwwTVBLcDUybFkxQm9WbkhXc3ZiK0gzT0R6WnlZbjVI?=
 =?utf-8?B?QmhYYlpkMWg1b2FmMXZGYmhPZTlFR0dSZlZ2MkIvWXFNTUFWL3VsY3luUEpH?=
 =?utf-8?B?dTR0NEJHUVZFVC9EZ1o5a0NBUXllb3ljZHN6TmdSTGRBZTQ2YlkzVS9WWU0y?=
 =?utf-8?B?SlhnMVg4MmFDQjY0dFFUVGduZVhhdTQwK1c0eUtJYWZvNmsxQTEzNlQrZzVq?=
 =?utf-8?B?dHpOczErV3lDZC9hc0Z0RnRvN2pUbjdpU0NDSmtldEZpZWp3bmorTUFjUXFR?=
 =?utf-8?B?Z0o3YndIbWhPQUNybUUxTnFxc3FsSmdpZjB1VDd3QTN1eThFZjVlRkNhWGlu?=
 =?utf-8?B?Rkp5R05JRVNGdlZKdTNMZjI0eXloL05RMENlRXpzTTZBb2JNMDRMdWRDQk4z?=
 =?utf-8?B?Ymc2eFl5NkNoNzl4a0dJTEN0c2NhbHhjUDlhUktTUU5iRk93b2E1aytHdjFa?=
 =?utf-8?B?WVNycktRYmcvWGtqN21kem5BMkN4VU9HdW1WYzRQUUJFZzBrOGtKQlNDcVNB?=
 =?utf-8?B?Z1dIbTgzZ2xSTUJnN1V1eUFOb1R1aU5iVis2MVIrOXBRT2JSSnBmcUI1VSt2?=
 =?utf-8?B?NnpGeVV1aDFLNE1lU3lFTmJPNlBLR0VPL2YyNi9zV2tBZXk4VWpYakh1LzJV?=
 =?utf-8?B?MGt5RUtCNjNEZlVaSTdxeC9hVmRXbVNYQzhrQ0tHZ0V3MTRlbnVYYVdvaTJs?=
 =?utf-8?B?Q0FuQXg1ZTNMSkhzWWpLdDZSck1pTStLNGh0cU5qOGh4TTRKTGlHY2dVdDha?=
 =?utf-8?B?bytpZFNsakVFL2swNHVzc09xT2dyZ3EyTUZSQmFsMlhyaTZHKzhGTWdpMjRH?=
 =?utf-8?B?dXlYS2VoYmZ0d1hkQ3pHcGtGVHNNWDd3RUhZRnVTSUsyQ0Vvc09ib1phLzE0?=
 =?utf-8?B?WE1HVGU1THUzWjFxcHVMM3dsYVJSbmZRVWM3U2l0VXJlVnhoSFk2bzhySWFq?=
 =?utf-8?Q?F1f1vtCiP4GTmLYNRiVDIxglMdEUlb9oawPQkWngJQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c243cf06-0db8-45db-8535-08d9f2378719
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 17:04:15.5386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWPDLgPa3VBu/I3P0ebtenx29yMxUSejSxfZpoxUkudABrZ16MZpk9vye8FVG68XIrY7ITda2JicCFftGfwnsjMncIrlXE5OpDwBwy+XSC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4136
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/17/2022 1:41 AM, Tvrtko Ursulin wrote:
>
> On 16/02/2022 18:15, Vinay Belgaumkar wrote:
>> SLPC unset param H2G only needs one parameter - the id of the
>> param.
>>
>> Fixes: 025cb07bebfa ("drm/i915/guc/slpc: Cache platform frequency 
>> limits")
>
> How serious is this? Does it need backporting? If so:
>
> Cc: <stable@vger.kernel.org> # v5.15+
>
> ?

This path (unset_param) is not being exercised currently, so not very 
serious.

Thanks,

Vinay.

>
> Regards,
>
> Tvrtko
>
>> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 13b27b8ff74e..ba21ace973da 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -110,7 +110,7 @@ static int guc_action_slpc_unset_param(struct 
>> intel_guc *guc, u8 id)
>>   {
>>       u32 request[] = {
>>           GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>> -        SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
>>           id,
>>       };

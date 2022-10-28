Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B363E611899
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 19:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9A110E875;
	Fri, 28 Oct 2022 17:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD1510E873;
 Fri, 28 Oct 2022 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666976423; x=1698512423;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gsxwnf/RmxXikQSREtfLs/m/RGlz1ljW1bAxSs3tnDA=;
 b=QB8pkroMVWd0ygLj7AudBxG08jEOkNn8qIy1aLxZc2ggBz5rhMnfaoMb
 QOjkTVSKtkiXDSBdSZ1RK4pPS3iB68fP92Yc8E2MGxDtsRcn1U61rx4kO
 nZCJhVuh0as4yfh6gEPN2+ClxXDlBrojtUDezDWC01PcrCWzHxijTz5FP
 /oBk3BU7uWE5PPF14dnSBKtpko5Z7dLipsNfW+snQYR9mrYxfvnvwj13g
 2z1SQFDEIE71iy4y1fQ6NCOwO5L09y8mSANvPSqP5vB2uWzegQTbUHehq
 Jqr3OblfSZE/yON/kQCslU+pd+9NnU9PRfVYpB+W6GP0vIfos35OhTzSt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="310236164"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="310236164"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 10:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="610807207"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="610807207"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 28 Oct 2022 10:00:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 10:00:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 10:00:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 10:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iE6/zX9mScGwQF61rwl/dfvSr2wr85q3iF8ica6ooR5ArQ/jxvuKX0+j1bd2Yu61Y+KYxro+o0E2f1djCrqTtxehoK01gHZOQ555iUthkrmb2DtQKKybaFVzgGFH8PeMWaW1/U1esD/is41GPb5K1a8Z7UUeYqsJSUD9iYjdg5UJ2+cOBRiCGoeRg5Ubp6N3mnNMvdai0TJcYAfjspOf/zt4gfJRju+iCqebeAQmJofCKdzA2RSWOyLn5Q1JuAZBDsTHYJaOOBMLTESyInBDpf/cvZ9FVe+tUP12J7J/ih6W8oW6Yof5wrn+XnY9yVveFdHd1gWC2GD/8h7uWXbySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEw/vJDqsA1l4G7WneggDySgfhpO/XMVfeus1eeNGH0=;
 b=m2BT5OSEKtSikmyYQUnPrhMGnFNiBrPWczhL/hk1CmO0bEo+Jq153tJ9PE8q1tSwCOla00OUmL0nmEHvs2uDGujNFIQAGvxUkgRACjIDjv4AMLiLpyrlRcfYXU9UJI0nwUjdP17ViTlP1SFhq/AnY4iv15iKkZx4n0SokUh7Osb5nzKOoOe8BI0b2h4jW3SRrmJPmKXNqLcpbFfRPCS8F1xjmVbeuMY20MGTS52zTZHmy6mTpRFOw80cLrDVqO42WwWphl6eOoBjD8vCDWY4sZeQzfIU4wReiEHTBFSEonysBjF7FOBr4LDzwS9mgninJaK0ZEy0u6c7PNqB+vSkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.33; Fri, 28 Oct 2022 17:00:15 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%5]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 17:00:15 +0000
Message-ID: <4bffd427-be49-0e67-b7e1-a5dd565786c6@intel.com>
Date: Fri, 28 Oct 2022 10:00:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/mtl: add GSC CS interrupt support
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
 <2125e5fd-e8d1-f4c1-7af1-58fb61f38049@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <2125e5fd-e8d1-f4c1-7af1-58fb61f38049@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CY5PR11MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f02666b-9e06-4471-ccdc-08dab905e2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwC5sheo4xbsC2+9JCepucDE207N4EJKljIDQlR6Ru0jUCd9RqcUKvs2ksD04TRyRzHjS/rpBUzimnpY+NMCvjJaLsw7xyFKRmjpZxDRcJAXahio0NBXLz5zS76SikbBu1E3k420jQk8cERQjbxuwax5TOEz2VoRqtMCowXOL/unInJ3biy5Sac/4y6NsM4kX0BHjkNqKEgIl79TZR0xVm93C+CBVoJRR3sKWakkNFLyrNOAtRIardkKtNA4oLi2BYJhl6D1+n1hMfYPeNAzS7VZhunVwjPeac7kem+E1gbDwT4jYS69KjyHZS15A3hd8uJp1jMJosOhvn1nHnA3KqRjwF+g7qMogGnYvS2LQ7kuJPTvqMs9WFXXzNKl4IWO9f1ybZla43TMhivgsMtev02lpFwMKfFH6nw/XP0ocsu0gCb6LB+EF9vWPKs+pjjcSqdwXJgprK0DT38U+ed/SmYqZgg1/dw+zIu9fvEJWFTyjrsa6oXY8XsW0ceOtDOOlTar+AT3fYIFpFA3hyjbLfuz9/HW4A9WYW4GgkUx+KP2fRnaeqy4V1sTLXiECRUN0ATRkyWwmBOERC3StEw58WKaV117ErsMc0aMo3IhQowAgdOBLLr/czt8NHeEWBYGnbXPEPH8Sc5/g7fHggq86ufXaU5eOvFtQxLUxFzThq4inAc78++hcZFtcW4llSmEaZbhM8EVDlkWp6viLIM2AGZZ0xtiLUW+skGNhbFWWyfaqdwu9zBqWAp9d5Sxlk8KrTsQHDz7jDEl+2NVzQQ9tHCN4EA+c/XuvLEKY9BLBL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199015)(478600001)(31696002)(86362001)(82960400001)(8676002)(2906002)(36756003)(38100700002)(53546011)(6506007)(66476007)(8936002)(66556008)(41300700001)(26005)(316002)(6512007)(4326008)(66946007)(5660300002)(2616005)(186003)(6486002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXp3UG04TWdsaks3K09UM2xoZDcvb3RmT040VkNqZ01SMS9jQjZKbkRBWWxX?=
 =?utf-8?B?aitXNzBHZm0yYm1ya0p2eGpnek5kOEJvMjRnV0JvVnZNeGtBK2VndFpZYkxE?=
 =?utf-8?B?L2l6anhlMzhaa29Dek1CN1JIWUpMY1RlS1kyTEx6ampTeXAyQTJpNk1ncnlt?=
 =?utf-8?B?QStaZDlPM1I0dGw5VmtadzZMTUxWN0dkRlNPcGJ0STh3VERNT0xneFg2REpE?=
 =?utf-8?B?TURRd3NmenAwRUhlYjU2c0RGanlsSjVNQmJHUXhyWkc3ak5MaThMc3BlRDV5?=
 =?utf-8?B?S3Y2OUlFZExXRE11aUhyeVNJY0FpenorT1J0K0plVi9DOE1WQldYdTZJdVNP?=
 =?utf-8?B?TE9tWThxVnhONjgyTU9jQm9PMEY0T1hlYno3OFlDZHZRNzBlaXhBdzBBT1Q3?=
 =?utf-8?B?VWd5dVVzZHRPaDZZb1Y1K3BTR3k4aVN2NWZTS0tnUlpLQmh5c3k4ZXVlZ0k0?=
 =?utf-8?B?TjJOWmdNZmQrLzJhamY4cWcwZ2hEUHZpVlVvNHhQckVuY1ZqWjZyaCtOQVg1?=
 =?utf-8?B?WTBoZTZUTGQ1TXQ4bEc5ajFSMk1GNkNhU1JLYjNqSEUrMjQ4U0Rzc1JPWUJZ?=
 =?utf-8?B?UUVyWkRpcnFCT0RLRTJZKytJQTA5c0lOR01KaG9qSkhXOTh4Y0FaRXJ3Vmhm?=
 =?utf-8?B?dWRLV1RvQ25jUE4xR2xUYW42eHVYZ1pRNHdSa0plSUxybjBlK0JCK1BneVlq?=
 =?utf-8?B?ZjFuUHdnWmx2U0t4V3VnSTRRU251TmM2VXhCdHR6SU9hblNTdGxSSDdqWHpa?=
 =?utf-8?B?M0tXMGpsOGNOanhMT1BSN0hIYStwbzQ5ZXQ4Y2QzdUxVRmRkays2SW1MOFQv?=
 =?utf-8?B?QlFoNEtzczB3bms1TndxMlBscG9NcStvU1ZSUHl2NitKakQyMEZXajJKV0V4?=
 =?utf-8?B?algzTTRrcDlrMlZhVGhSKzc1SVVpVnYzK05weGszbkF0U0Q5c3p3Wm8rTDZV?=
 =?utf-8?B?TTV5RWJuU0lXSGpHYWk0NFhUUFNwTkwzTkVIT0UyTWxtWWhZMjVUTHpNRnZL?=
 =?utf-8?B?MitjRzNWeTdHSE5IbkVUZjFscmY2MGg3aWVtRWw2TENJY3FpcDdqUExqTHcr?=
 =?utf-8?B?STZmTmJzWVlpUktuWjExQ0J5NmFLNEpqN3BabzZsZHJPV1BZKzlDSHhuN25R?=
 =?utf-8?B?aWV3MitCV1k2NjBSbEluUHozcFJMRzdlWFdkVDdzdlMwY2s2TkQzVUNQWVZT?=
 =?utf-8?B?Ti9sSXlUaWl0WVE4eHZzc3RuRWoyUVloOEFIZVl5SVJac3dHQUJGSlFOUXdr?=
 =?utf-8?B?OWhBRnVHQVA1SmwwTU02T2hjQjFla1JXTE1LZi80ZGoxaG1xWEdGc29mT091?=
 =?utf-8?B?NC9OK1IzenFlSzByV0wyRnJEMkRRU09ocEdwZzlqckk4cTU3dXltY1I4OU9X?=
 =?utf-8?B?VncxRldEMVBlZHBRV3FSK2Qvc3JEcW9aMUdsN2lYVjZiZzVCdlpteWpHQ1Nk?=
 =?utf-8?B?bC8ybUhPRzU2alhqR2xEa3BUcDgzckxKTDY2dWdEZjRHK2h4dC85a1JuZ3VF?=
 =?utf-8?B?aXVqOHhYVTU1ZTU0MHVaZDVGdnlTQThxN2RIUWdSSjljNytOZm5UT2dBYVpn?=
 =?utf-8?B?UTZkUFUwWjZGNFN4anhJb2RWQmJJQjM0MDFPWWJybzN3MHo2dkZBZkdNditQ?=
 =?utf-8?B?NmlOSWNkRU8zVlhvTGk1RVdBUkdZdGN1aVpqTGx3TFo5UHhrN1o5MFprV01F?=
 =?utf-8?B?QnJnS1A4aHRtMXRNVWhJdXpmOWR3S3J4NVRuL0JQSEl2bzFyNEZuNWYrNFpu?=
 =?utf-8?B?ajdNaFVYVS9TSEhpeU5qSzduWGJVNTQvdUwwWXJmbk02a3FTZHVMVTM2TGUz?=
 =?utf-8?B?MFFJN1cxR0tPMTJldkY4TFRNVTUrK0hicXhGTVZnSmwyQUVGUVZYNjZjbWRR?=
 =?utf-8?B?TGVaQ3g0TUc1Y055Tm01L2dsdmFPVGZLRjQ2YndSTzFlRmRjelF2VkNSTG9q?=
 =?utf-8?B?Rll1UlkremlsV2tYMXliNzFWNUpkV0tTQm9FUHI0aTNiSTZLc1lLSG9zTkdH?=
 =?utf-8?B?YjVzdW1oRDVDbjZjMTd3SThubitXTXplOG9WUGxqNzUzR3hjQ0E0M3gzKzNa?=
 =?utf-8?B?TEx5U3Q0eUd3a2duT2pZd1llTFVENld1N09SZUdaV1FmSEl6Nml5OC9BL0Rv?=
 =?utf-8?B?ajR0Vy9zYU8ySlBraGRGRUpJT3JBRlBnRkdRUmRkUXBUbWtmYjErcmJyQi9U?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f02666b-9e06-4471-ccdc-08dab905e2bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 17:00:15.7947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gECpt0OSkivxQ61jp5EO7oGL3c20sbqlDkAPIM5lJSnPVfnaC6lVAvhr2Nd2bOOln906B495PJbHSlEEwi3QgYT2OwL6namaWgW4BiFrbwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/28/2022 1:38 AM, Tvrtko Ursulin wrote:
>
> On 27/10/2022 23:15, Daniele Ceraolo Spurio wrote:
>> The GSC CS re-uses the same interrupt bits that the GSC used in older
>> platforms. This means that we can now have an engine interrupt coming
>> out of OTHER_CLASS, so we need to handle that appropriately.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c | 78 ++++++++++++++------------
>>   1 file changed, 43 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> index f26882fdc24c..34ff1ee7e931 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> @@ -81,35 +81,27 @@ gen11_other_irq_handler(struct intel_gt *gt, 
>> const u8 instance,
>>             instance, iir);
>>   }
>>   -static void
>> -gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
>> -             const u8 instance, const u16 iir)
>> +static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 
>> instance)
>>   {
>> -    struct intel_engine_cs *engine;
>> -
>> -    /*
>> -     * Platforms with standalone media have their media engines in 
>> another
>> -     * GT.
>> -     */
>> -    if (MEDIA_VER(gt->i915) >= 13 &&
>> -        (class == VIDEO_DECODE_CLASS || class == 
>> VIDEO_ENHANCEMENT_CLASS)) {
>> -        if (!gt->i915->media_gt)
>> -            goto err;
>> +    struct intel_gt *media_gt = gt->i915->media_gt;
>>   -        gt = gt->i915->media_gt;
>> +    /* we expect the non-media gt to be passed in */
>> +    GEM_BUG_ON(gt == media_gt);
>> +
>> +    if (!media_gt)
>> +        return gt;
>> +
>> +    switch (class) {
>> +    case VIDEO_DECODE_CLASS:
>> +    case VIDEO_ENHANCEMENT_CLASS:
>> +        return media_gt;
>> +    case OTHER_CLASS:
>> +        if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, 
>> GSC0))
>> +            return media_gt;
>> +        fallthrough;
>> +    default:
>> +        return gt;
>>       }
>> -
>> -    if (instance <= MAX_ENGINE_INSTANCE)
>> -        engine = gt->engine_class[class][instance];
>> -    else
>> -        engine = NULL;
>> -
>> -    if (likely(engine))
>> -        return intel_engine_cs_irq(engine, iir);
>> -
>> -err:
>> -    WARN_ONCE(1, "unhandled engine interrupt class=0x%x, 
>> instance=0x%x\n",
>> -          class, instance);
>>   }
>>     static void
>> @@ -118,12 +110,24 @@ gen11_gt_identity_handler(struct intel_gt *gt, 
>> const u32 identity)
>>       const u8 class = GEN11_INTR_ENGINE_CLASS(identity);
>>       const u8 instance = GEN11_INTR_ENGINE_INSTANCE(identity);
>>       const u16 intr = GEN11_INTR_ENGINE_INTR(identity);
>> +    struct intel_engine_cs *engine;
>>         if (unlikely(!intr))
>>           return;
>>   -    if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
>> -        return gen11_engine_irq_handler(gt, class, instance, intr);
>> +    /*
>> +     * Platforms with standalone media have the media and GSC 
>> engines in
>> +     * another GT.
>> +     */
>> +    gt = pick_gt(gt, class, instance);
>> +
>> +    if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE)
>> +        engine = gt->engine_class[class][instance];
>> +    else
>> +        engine = NULL;
>> +
>> +    if (engine)
>> +        return intel_engine_cs_irq(engine, intr);
>
> Drive by observation - you could fold the above two ifs into one since 
> engine appears unused afterwards.

engine can be NULL in both branches of the if statement, so to get a 
unified if we'd have to do something like:

if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE) {
         struct intel_engine_cs *engine = gt->engine_class[class][instance];
         if (engine)
                 return intel_engine_cs_irq(engine, intr);
}

Is this what you are suggesting?

Daniele

>
> Regards,
>
> Tvrtko
>
>>         if (class == OTHER_CLASS)
>>           return gen11_other_irq_handler(gt, instance, intr);
>> @@ -206,7 +210,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>>       intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,      0);
>>       if (CCS_MASK(gt))
>>           intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
>> -    if (HAS_HECI_GSC(gt->i915))
>> +    if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>>           intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, 0);
>>         /* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
>> @@ -233,7 +237,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>>           intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
>>       if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>>           intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
>> -    if (HAS_HECI_GSC(gt->i915))
>> +    if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>>           intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~0);
>>         intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>> @@ -249,7 +253,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>   {
>>       struct intel_uncore *uncore = gt->uncore;
>>       u32 irqs = GT_RENDER_USER_INTERRUPT;
>> -    const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
>> +    u32 gsc_mask = 0;
>>       u32 dmask;
>>       u32 smask;
>>   @@ -261,6 +265,11 @@ void gen11_gt_irq_postinstall(struct intel_gt 
>> *gt)
>>       dmask = irqs << 16 | irqs;
>>       smask = irqs << 16;
>>   +    if (HAS_ENGINE(gt, GSC0))
>> +        gsc_mask = irqs;
>> +    else if (HAS_HECI_GSC(gt->i915))
>> +        gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
>> +
>>       BUILD_BUG_ON(irqs & 0xffff0000);
>>         /* Enable RCS, BCS, VCS and VECS class interrupts. */
>> @@ -268,9 +277,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>       intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask);
>>       if (CCS_MASK(gt))
>>           intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
>> -    if (HAS_HECI_GSC(gt->i915))
>> -        intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE,
>> -                   gsc_mask);
>> +    if (gsc_mask)
>> +        intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, 
>> gsc_mask);
>>         /* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>>       intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
>> @@ -296,7 +304,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>           intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
>>       if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>>           intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
>> -    if (HAS_HECI_GSC(gt->i915))
>> +    if (gsc_mask)
>>           intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, 
>> ~gsc_mask);
>>         /*


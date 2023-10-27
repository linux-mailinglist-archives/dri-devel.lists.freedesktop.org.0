Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0767DA22B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 23:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3426E10EA4C;
	Fri, 27 Oct 2023 21:08:48 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C9010EA4A;
 Fri, 27 Oct 2023 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698440925; x=1729976925;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=myCkrFKx26q6etXUI4PfhmoPQzhkpTLZDztepgHp4LI=;
 b=bSVLbhPa4n/VpCBBkh3Sg0TinjyoCDMGMc8CVytpgMB65U6rfw61nZQg
 +EKCc1p7nS94ipSF/18DpSTwlXZ007KYCY3n3vwtEOXfJ4zMN88QtvOJQ
 u/zw8pnPLkUxmvauVZ19nU17wBGa2gKXxD7L5iJXDXRGGW8arj3xZoJRz
 kPW3A63jXxbFSRyGLapfIdtNWW4eLHyJ8itOts21VAiD+nGBmAieNonAw
 92E68pAOR95aFMj+Q/SGVAz2ao86rgmJm2kuukajHyZk0LRPbp4PzFyww
 VTqMRNNl55hFsOJvosyDFA09zGIdiPyMsNfbKqhm8F2DgeRKbXsGkN4su Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474089172"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="474089172"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 14:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="933199874"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="933199874"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Oct 2023 14:08:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 14:08:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 14:08:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 27 Oct 2023 14:08:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 27 Oct 2023 14:08:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXLIWO50wxR25ybZX+qYkFPWGJNT5d3bSSSlAZW8jwiRAdKwzoubIe75K4NvQtnYJxRBPC91MlztmvA4/Nz4ZVqcgPHcitProlex05SnjufZsH+d2AxwtJc+sXhubDxmzqRawAngkj7BEQcSa0lmbbTa5FPp+ppyrc0iOXlLwE70kwhJslixXh5nhKRZ+6Fo1asF+80XIUaiQGSfeJBiSvzZioE9rhbURvpvXo6MJWGnSdIcSvD1pDKNZqYRVq7BUeLatLx6y3MC7ko//01cUKAp0moUGekY12I/u8ixCI2QrIxFujUYVvpouDVUzGIbiGtBFwBWE9ezwijemzvW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAkpyhiYGavgu95pvPujG63fgEJFfklkiZJ417oSY8U=;
 b=R/QnnfaOY9MzTkRNF9IfTAnyA2za2DPKi2TRzrnSOPLLDV7cwlvceLydzUz9u1pjf2UrBXAK9LrLef7baXGuTp3ZaetfAb377LG+lREep5F65YDaG/l+0xGtdN5Vy+FS82PUf7ywGV5cFlJIz9mtGrVIts4041k6vnK20SBszMNH6LkOoLVhilX62fN0HM/layrE9XkzvdXW/Q8dTo9Urf2iOtL6quMuqWMbe6JwT+tyMTq/no9D1MEt2NLO3r7vWR4d/E0+IH0X5T/TEE9vEnF5J52dNdLWMLpezTKOc0j8948XH0WemMaCgCIzX5a+GJnRjxO1fXRtqV8gGQx5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 21:08:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::28f3:390e:28da:a67f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::28f3:390e:28da:a67f%4]) with mapi id 15.20.6933.022; Fri, 27 Oct 2023
 21:08:41 +0000
Message-ID: <8aa4bd71-ad72-4494-bd5e-109b7eb09db3@intel.com>
Date: Fri, 27 Oct 2023 14:08:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Enable Wa_16019325821
Content-Language: en-GB
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230915215537.220331-1-John.C.Harrison@Intel.com>
 <20230915215537.220331-3-John.C.Harrison@Intel.com>
 <f705d300-6f76-14fe-8321-167a2c572ec9@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f705d300-6f76-14fe-8321-167a2c572ec9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: fea152fa-34cf-45b6-3396-08dbd730e583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9H/7+Q8zs/FKAU7XXZQbRldK/w9ST9L1s47yIAMH88UpnlFU/BFRbu13psHBroQ7r1akBC/WTYspndjOmdveBSAGfZwarvb5qC/SB8p3X3IIoXe7a0N6tI2c/fAsRxBgBxc4la9o3UuuaQMt71R4U8Mj52rEab/V9aSRFj8ShfRHUtziIWF3UPigE/6oCFjNt0x/v/YHL2BqII6gIIvm6u/zog8RphGc3z+Q0dP2o6zM/AWTLFlNYB5TG0U8Wx3QEnl9HeCUE6REg1EN+lrDuF8RkSFuxSR3eUSSd4oIJgt3Qo9uRZmfoqIYz2gGS1im4s/0ooMJf+E+rECJsZ2TLsZvlr07untk1g7dVDcx6tIJ7cyNVLU8mg+2wQ5kcSROwlcEVH5iIKTnof9xJxKb4+pAqivaea0qiFhgFy9td4qcYL+GfdcMOZSnfwv787bYld7QATQqRLaV4e0IoQTxLEn80VgeOucaUkvZRxYKJq1LGBMo1pXHtSHy/Gy4W/oOZC0R3hho1qK9WcoQk3SdNbgu5zsUeJ0p3dl6KIUmIaW40mIu/aO89mUYBLeChMle5mnKuhD5ec+RWqw0aG7Xi3e9CZkLEJHarEJSjw1IAi0j8wFnsEs/I0CcMkugTi2OF+YS3FDOmW28e9OOfA40/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(31686004)(86362001)(36756003)(31696002)(83380400001)(38100700002)(5660300002)(41300700001)(6512007)(26005)(82960400001)(2906002)(2616005)(53546011)(6506007)(316002)(478600001)(6486002)(66476007)(66556008)(8676002)(450100002)(8936002)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndEY3I2U215dTU1MjF3MUVCRFRIdnBjOFJOeW1NV3NmM0c3WGcyNmZONjFk?=
 =?utf-8?B?YWhHTkFIT0RlOUN5dmtteklwa2JvWWZYU0lRZHZJeGFmcW5OcVd2RjRpdXc3?=
 =?utf-8?B?eURNWnVZUHk5bTdaU1ZIc1FuWDdtSEFCVU5zem96VlhNS081eEtESXJBUVNu?=
 =?utf-8?B?M2N5ME5hSmxOWWhNaWNPdisrWmZIM0M3VXlVZkVNbDJpQTZwSlNuS3dTaExJ?=
 =?utf-8?B?OUlHRGlzYml1dGhQMlBad2djZnJDMGxNcHpRUHNPN090U2RZNVV3Uk1UUyti?=
 =?utf-8?B?dk1UdlpXa2puZ1pXOWVuMysvSjBrZWhQclZNRUh6RDFWYkpEZnNCRlNmYy92?=
 =?utf-8?B?NVA1ckIyUFhCYUZpaVJlTXJYOGJOcVdRcUd1UklleC95YjVsZXlodUZ1OGEx?=
 =?utf-8?B?T3JPdm1MUzcycmJsWXU0UnJ6dlgzd0VvTzVRMVNISlpMVXU0OXI3SHVYcFVI?=
 =?utf-8?B?L1RCcFMyNlVXMHNLdFFHcStvSXhOeUpiVXpTMVdMcXZNMlNVWEZkY1JHQnlB?=
 =?utf-8?B?V0taQml2VlNneEo0TG9vaXh0NzR1djBmSDJuc054K3YxenpMQk5NQk9CeTlC?=
 =?utf-8?B?Q1ZvMWZRNnkzNzhaSno5dWpoZk90SnhKMkh1aENmSWNPWldpMUFzWHNFTFlT?=
 =?utf-8?B?cG1YRXNpN1g2UWhzd1ppWHVIVlFLMGxlemY2R1pQaUJiRzkrL1lITG1GV2RU?=
 =?utf-8?B?VUdmQTdNWUliV3NsNHVEN1RGb0NWUDBHem4yMDV5aDJYSTkwbW8zeXRIaTF2?=
 =?utf-8?B?N0ExUGp0UTkvMGw4eFUrY0kxWEkxTEtpeE5NbkZjY2ZXdXE2ckRqZ0dhV0R2?=
 =?utf-8?B?NFVMWGQwcFpQVjgyQnVPakZmMmFoY2Vsbk4xdXYrMjN6Nkw5RjE4QzE4clFG?=
 =?utf-8?B?SGZpcmFZZk5VakZZN1Z4RzBYKzlzWG5sKy95SXVqT1RjZEl1WWRaQVVIM2NK?=
 =?utf-8?B?Y0lQWEFIV2NlMDRLSW04Qm9PYjhPc0RTYm02RGtERVhLOUlXRzhDUEFEZHFk?=
 =?utf-8?B?UTlTN1o2ZEtpWVNHaGFReFZIUjZ5QU1UdmxnaE0yazMrMFhWQlAwSXJJTFdu?=
 =?utf-8?B?MG41YWR3dlJNWjZiYjlDUjNUbitXSmhsN1M2NGlCUjFjWlpyK04yY3BwRjAv?=
 =?utf-8?B?ZS84dWZQZ2UzSElPMTc5L3pvMTM0eVFaSFRvb1k4RHNpY00yZzlYZE1YQmJF?=
 =?utf-8?B?WlFCU1M4Zm91cy9BelVkSXJXM3pIT01lZW9NYzFpNGxaNndkR1VwUzVoU1RD?=
 =?utf-8?B?aDJEU1FneVNyTFdXczVXMjFxK01lT0FlU3VXY2FPNGxBRkd6eXB5UmlZSmxa?=
 =?utf-8?B?SmZYUjBOVm9MVDFYOU9pSzFNcDNWcDBCL3JUak5pZERtdDg0eHRIK2M0aUdO?=
 =?utf-8?B?YjVNUGVaMkxwOVdBT251OVhTMjFqUnZiWllDV1JNUngxT0d2V3F6cFB4bmZs?=
 =?utf-8?B?bTFMUGxIZEV0Q2liY0hZZU51RXhOakdhOS9Rdko4VTI4QkM0RlQyUjNFcFZT?=
 =?utf-8?B?b3ZlK0ZoZlg4YmdNOGkyZVdLeEV0ZVpQVFMyOUdjaW00R1Y2QnBJSmN0OVdj?=
 =?utf-8?B?SVJMYVVSWkJtNEVuSWVuZzF3K1BzVWx0eXFHYVQ1TkloYzFNU2JLYmhCYjRo?=
 =?utf-8?B?RHBkT09BQ2tPMEg5NHR1cEpQUHNmUitlTEJNWXFZdW5PZnRQVFM4RFd4LzU1?=
 =?utf-8?B?VUY0UWZGSlpxM0t0RktXa1FQZGV5RURqakV0L0RwOS91VWFYdTFoeDlDWWFr?=
 =?utf-8?B?cW1McTVSdGFzNlJWL1dzZXYxTjVqY0VCY05vNFM5bllSU2dWeXRVeFhPa1pN?=
 =?utf-8?B?MTIzQnUrcE03aG5QSDlack5SSEk3ZWN1bW5Db1JEc09rREVDNzBqK2J4RHJi?=
 =?utf-8?B?K08vZFVEV3FZaUVLeE1lcVdSSlFtQnBkZEZoQy80dFVkelRaeXpTS0pINTJr?=
 =?utf-8?B?MkZYNzg4alQxYnhxajBIK3dQalZOUTdzNFN5UkxhNHMwa2U5UlhJa2srcHJ2?=
 =?utf-8?B?UlBtcFZWVndzRkJsMEltWHJraUdDUWpuOXZoSWxkaXhJSTBQWVFoVW02SEMv?=
 =?utf-8?B?a0w2UWV6TGJKTXJNdWVYTDdYQ1l4MUZBZ2xNNUY1TGJ1TjI5Y0xybUNlSkJw?=
 =?utf-8?B?SFB1WWF1WlV0YmlITVZzYXVzaGpGVUJvdm5SQWEzYkxXc0tKNFc0Y3NzcnEy?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fea152fa-34cf-45b6-3396-08dbd730e583
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 21:08:41.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIOmX+vhoFyVqGs1I1oFfIgAX/Yu1d/cIR1pmFk00RZ+h3v/xiNVOv6D3ikNjbcdwXBWlAPDXfzmfygssdO1WRGK4t373XuVF+cPkgCe6Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
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

On 10/6/2023 17:10, Belgaumkar, Vinay wrote:
> On 9/15/2023 2:55 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Some platforms require holding RCS context switches until CCS is idle
>> (the reverse w/a of Wa_14014475959). Some platforms require both
>> versions.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 19 +++++++++++--------
>>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 ++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 ++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 ++-
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 +++++++-
>>   5 files changed, 28 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> index 0143445dba830..8b494825c55f2 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> @@ -733,21 +733,23 @@ static u32 *gen12_emit_preempt_busywait(struct 
>> i915_request *rq, u32 *cs)
>>   }
>>     /* Wa_14014475959:dg2 */
>> -#define CCS_SEMAPHORE_PPHWSP_OFFSET    0x540
>> -static u32 ccs_semaphore_offset(struct i915_request *rq)
>> +/* Wa_16019325821 */
>> +#define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET    0x540
>> +static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>>   {
>>       return i915_ggtt_offset(rq->context->state) +
>> -        (LRC_PPHWSP_PN * PAGE_SIZE) + CCS_SEMAPHORE_PPHWSP_OFFSET;
>> +        (LRC_PPHWSP_PN * PAGE_SIZE) + 
>> HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET;
>>   }
>>     /* Wa_14014475959:dg2 */
>> -static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>> +/* Wa_16019325821 */
>> +static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, 
>> u32 *cs)
>>   {
>>       int i;
>>         *cs++ = MI_ATOMIC_INLINE | MI_ATOMIC_GLOBAL_GTT | 
>> MI_ATOMIC_CS_STALL |
>>           MI_ATOMIC_MOVE;
>> -    *cs++ = ccs_semaphore_offset(rq);
>> +    *cs++ = hold_switchout_semaphore_offset(rq);
>>       *cs++ = 0;
>>       *cs++ = 1;
>>   @@ -763,7 +765,7 @@ static u32 *ccs_emit_wa_busywait(struct 
>> i915_request *rq, u32 *cs)
>>           MI_SEMAPHORE_POLL |
>>           MI_SEMAPHORE_SAD_EQ_SDD;
>>       *cs++ = 0;
>> -    *cs++ = ccs_semaphore_offset(rq);
>> +    *cs++ = hold_switchout_semaphore_offset(rq);
>>       *cs++ = 0;
>>         return cs;
>> @@ -780,8 +782,9 @@ gen12_emit_fini_breadcrumb_tail(struct 
>> i915_request *rq, u32 *cs)
>>           cs = gen12_emit_preempt_busywait(rq, cs);
>>         /* Wa_14014475959:dg2 */
>> -    if (intel_engine_uses_wa_hold_ccs_switchout(rq->engine))
>> -        cs = ccs_emit_wa_busywait(rq, cs);
>> +    /* Wa_16019325821 */
>> +    if (intel_engine_uses_wa_hold_switchout(rq->engine))
>> +        cs = hold_switchout_emit_wa_busywait(rq, cs);
>>         rq->tail = intel_ring_offset(rq, cs);
>>       assert_ring_tail_valid(rq->ring, rq->tail);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> index a7e6775980043..68fe1cef9cd94 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> @@ -573,7 +573,7 @@ struct intel_engine_cs {
>>   #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
>>   #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
>>   #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
>> -#define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
>> +#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
>>       unsigned int flags;
>>         /*
>> @@ -683,10 +683,11 @@ intel_engine_has_relative_mmio(const struct 
>> intel_engine_cs * const engine)
>>   }
>>     /* Wa_14014475959:dg2 */
>> +/* Wa_16019325821 */
>>   static inline bool
>> -intel_engine_uses_wa_hold_ccs_switchout(struct intel_engine_cs *engine)
>> +intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
>>   {
>> -    return engine->flags & I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
>> +    return engine->flags & I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>>   }
>>     #endif /* __INTEL_ENGINE_TYPES_H__ */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 27df41c53b890..4001679ba0793 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -294,6 +294,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>>           IS_DG2(gt->i915))
>>           flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>>   +    /* Wa_16019325821 */
>> +    if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>> +        flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>> +
>>       /*
>>        * Wa_14012197797
>>        * Wa_22011391025
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index b4d56eccfb1f0..f97af0168a66b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -95,8 +95,9 @@
>>   #define   GUC_WA_GAM_CREDITS        BIT(10)
>>   #define   GUC_WA_DUAL_QUEUE        BIT(11)
>>   #define   GUC_WA_RCS_RESET_BEFORE_RC6    BIT(13)
>> -#define   GUC_WA_CONTEXT_ISOLATION    BIT(15)
>>   #define   GUC_WA_PRE_PARSER        BIT(14)
>> +#define   GUC_WA_CONTEXT_ISOLATION    BIT(15)
>> +#define   GUC_WA_RCS_CCS_SWITCHOUT    BIT(16)
>>   #define   GUC_WA_HOLD_CCS_SWITCHOUT    BIT(17)
>>   #define   GUC_WA_POLLCS            BIT(18)
>>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST    BIT(21)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index cabdc645fcddb..ff38a815701ce 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4267,7 +4267,13 @@ static void guc_default_vfuncs(struct 
>> intel_engine_cs *engine)
>>       if (engine->class == COMPUTE_CLASS)
>>           if (IS_GFX_GT_IP_STEP(engine->gt, IP_VER(12, 70), STEP_A0, 
>> STEP_B0) ||
>>               IS_DG2(engine->i915))
>> -            engine->flags |= I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
>> +            engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>> +
>> +    /* Wa_16019325821 */
>> +    if (engine->class == COMPUTE_CLASS || engine->class == 
>> RENDER_CLASS)
>
> do we need to set the flag for compute class again here? It has been 
> done above. Other than that, this is
This is not setting a flag, it is checking a flag. The w/a only applies 
to RCS and CCS engines. The above check is for a different w/a. We 
generally try to keep each w/a separate and discrete. If they start 
sharing condition terms then things can get broken when the conditions 
for one w/a need to be changed and the code has to be untangled.

John.

>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>> +        if (IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), 
>> IP_VER(12, 71)))
>> +            engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>> +
>>         /*
>>        * TODO: GuC supports timeslicing and semaphores as well, but 
>> they're


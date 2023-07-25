Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49B7609ED
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 08:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A3F10E390;
	Tue, 25 Jul 2023 06:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC89910E041;
 Tue, 25 Jul 2023 06:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690264893; x=1721800893;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o7fR6wHhOXlZ0+5tyvAPWY1i8JqJz86+h+n8KTRS3ec=;
 b=LNr1qbX4Jc+a9iOV/idRXgxFgWlhnRNOI+iV8Pp6A2KD3bBspy0NnW8Q
 zTKovBOcCGa1BoTS2veawh0CijYr2cycZp9nnOpS9cYr5xQBgaA8D2fZT
 OfuA7Mb/nXpDttEWYwC4PUiCeB/f8eUeHsNmOoptgRX0Ww9rB59jdwJMi
 QihPzsOYxXlI8nHXmoNuhb40ll/LSopi8DemxdQEALFto1OXDaq9+b2tv
 gZtG3coErFwrtEVhrR+HW2N3E2NiMpMd+imh2yieNV7f/0j8YcrnaaMkQ
 GuEXnbgTqM2YvcMjm1gFwrec/0iFf5+nQ+JaJemQjNt00nbuiGuQ102ZH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347232895"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="347232895"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 23:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703167863"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="703167863"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 23:01:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 23:01:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 23:01:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 23:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy+ZjK2jJgTZiW9ozGE9wx26VJObh9uvUM6quUI/5ucvZqayMuP4H7tIc+MbKfpzJtDXI+OPGQa1I1GyGKSw5+4fM0I3fotabFKXRQ523naGIaJIlGaGg0biS4Il9l4NTh0NmBZaFwvZ7rVQF8LiZ0YYKkhgE6qcXdpepI7aZeKxTgcBDvgboFQgdqOZhEAP2SfxXxI+ZuVE/dqZ6BYrMa5mKXnIDseZUWfop5eO4IGFQGLE/Tj7pc4Q7KIKyYBugVoV3TrQ2BHAYK3fHH7pPtBx7HUg+AXbQO7w39WGFZTqsIU+3ucYXcq/L7XCg7KkVXMp9ooDX+Bib5eO9FFkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VMhz4kRXBHphhJvZNLXaD+MzfLqHBWU1VT/nK9ljOs=;
 b=X+G18GEBknuF3DlRXBB8CHU5ASsvYZZN3pXehY64VJOJJNB+qsUWQGxNhcIxgXbRE08JhzdZaUfbne+KARoqMtngm/OeavosFo4aL8Z1ZPxKPviUDx/ZKpH6l39KV+FdT10+q6Ihf15A2YXhVl2vKvKsplctlFv3D/SiGlZF8uDk0RN4iNrekan5gLc3gCaKKmKLKxTCcaI/qdGThDAXNeRQmTxcOSw8vp26MQS67+AJ2iBrZngh9BOwCcg5i0OBofwOmL99vbfUZgoQmMhmnfRwMVjuDjukAIKtbGz33NEopQWU43y1aVmRo3++y0F+7mcZugvKmwrcFe0q0Hsz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 06:01:27 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::857:5e95:ed36:4066]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::857:5e95:ed36:4066%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 06:01:27 +0000
Message-ID: <8f2be7c3-ff34-9134-9d82-c88ab80c1480@intel.com>
Date: Tue, 25 Jul 2023 11:31:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/19] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-8-ankit.k.nautiyal@intel.com>
 <ZLj9NArcFWXo3G5J@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZLj9NArcFWXo3G5J@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::17) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 01925ffa-b45a-4545-c0ab-08db8cd49562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flyjsa1uzRrHs1zl3c1nSF5ZofRydGMYywPOeUbBj48eODq1PES8CYsTAVU342qhEnUaIN2zCPTmoZkcC0b7pnecwnAICVA1egP5HH2WnJkzXLH2jgbdUR8DHZmLgT5eo1AKSzIoVv7F0PwwPfXoOdlO7aWu5cAwuN24ivfMs40xfV6PK+yAPo7ALFsZzzcUpLSMFGTjuuMSzJPQtQ9vBk9F2mkm8DSh3moynLToqTojr+U4V6AdOm5zsCw/L87XZAW2Jzpg9YI7WLP7NVXAyf4gH3VmPHRU7vbFKYbVqLARE3TdVKGM1mtrlveWi0CMrzP2yzU31mq620hxMcC5VGflp48K7T+z3ToKlwPsz2cx0rmh25zAijXRHpU/HQrt61B/ltfWrJ6eMMaoH1E6LOrFGMXI3afstIw+dwNAtzcY6vAIpe9TN1yhGu6Zet7evsRSo39YjUiIWrPP0GKxKdZOtZ93rx+mn0yLIAprYSTvy2lfSxuNR67DBcq9KvhO79ZoeZZXTeMCauoqJDK4kCL/TUdpII0dV84C3xwdWR79ofGAtamyBmlrH6AasWNnFpoBTGC8wwpt8k/nSxYHDsFyYY+UdLDLfE3juvbp2fEsWx4ElWlJp4DiZ/aIZTGlkSPS6eI47lAP4+6ZWi6ZTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5332.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199021)(31686004)(86362001)(82960400001)(31696002)(38100700002)(6636002)(37006003)(66556008)(316002)(4326008)(66946007)(478600001)(6862004)(41300700001)(6486002)(5660300002)(8936002)(8676002)(6666004)(66476007)(6512007)(2906002)(186003)(26005)(6506007)(83380400001)(36756003)(53546011)(2616005)(55236004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clE2TUdxV2xudWNITms4MFdpc2U4MDlCdjlERUp0a2VSNGtuL3FUaUlSUnA0?=
 =?utf-8?B?UDRwQ0NIWCt5b25JNVc3eG1KQWlNVmRsUmlLQmpDM0RLMFhtYy9ZWWJyaXZo?=
 =?utf-8?B?bUFYcDVSMlltTmFpRitYVE1QdHc0N2I1ZDZjZy94Wk5PVVE0TmdLYStRcFR0?=
 =?utf-8?B?RlRxQUh5dGFLV2xDaUx3Qmd4K0JWWnYvc0I0WGZjbmpQcndSbzNudEp6dnEz?=
 =?utf-8?B?SnhSM2w5b3pIcytla3VHeHpJSTZoL082eTRqL3dKSE10WXVNb295d0FvQWNi?=
 =?utf-8?B?Y0pFWG85SVl3MzlreU13R1ZYRlpJRVhLNEJGRWR2YUVud2RPR3M1UmdrQlhE?=
 =?utf-8?B?TWJNSEpTRUl3bzJvZGNVc2J5dllISS92ZUdxVWkyOFR5eWxGRnIxRU10TGZO?=
 =?utf-8?B?OUp0QWxYMkdUSUVCU0JLeFhHRzJDZ0Z4SGhoYnlSN3hGL3FtT0RIMDNVRkNJ?=
 =?utf-8?B?aG0zL21QRDRkUWNxcW9OSk42SXlMQU1od0Irb3RvbUN2bDRONzVnNWdlYU9k?=
 =?utf-8?B?UFRDUVdsM1c5MkR6TWZxU2VLOVhZdXFDblUwVEdGcXBRMmRZcEtUZ3hYMGpr?=
 =?utf-8?B?d1BGTC8yWWlRVjh4L1dmZ3pXMittYStXSWFkOVFySlNiMi9RNndsN3Q5K0pT?=
 =?utf-8?B?UjVqa1hKRjZ5SjdiemhHL3IyVjFHb0FadUZocmpwa3RNemZ5aTJEbWU4bTE1?=
 =?utf-8?B?eHdHLytZQnpYWnlOWDJ4dmU1MmxHUDNhWGFzQWd6YWU1TjA2UTVFYkRERU8z?=
 =?utf-8?B?bUJqSWFlTlFIdU80bStTMWlNdlNsNzdHSWpjcndVaGFpOE5KSlp2UVZqUFBp?=
 =?utf-8?B?Z2lGMnlxd2FVWmxxcVJnYWpHZ1BUOWFUbUYxbTRMamw0SEtFNklqUW9Jd0NT?=
 =?utf-8?B?Z2M5S3ZpZWVtS1g3T0FZMDVDSWpwYXJheWxWSGpQZ05xcWx0Zk5XUVpSUFZX?=
 =?utf-8?B?SEc0L0NTQ3NUMTVoYW5DK0xPa2NOdElxem5ZODJUNEJXQSthS3JXckhIcWtY?=
 =?utf-8?B?QzA4VDFtcy9rbkJJVXYvZ0hDeG5PbXlteDhlVjVQdlFwZGZNUFNDc0s4Z3hR?=
 =?utf-8?B?cTZIUldLVW1GUmtJcUkxdnVwSlZFVUZFbnlKMHYrSTZROHpZbEFHbERBYU1H?=
 =?utf-8?B?eHg2eWsxTzJYUDFqUzZ3N3ppY1B0bUpYbGFia3Y2Q05DbklDQi9wOGpQWktT?=
 =?utf-8?B?Y1NuQjltMmdiZWlpQ2tuT2c1dHhOTnJoUXdNZ3hiaTBFNTVCODB1bzNOdHRt?=
 =?utf-8?B?QTN5VFE5WFUrQXJhTkNBSFBXNHYySWRUanhDZ3NSVE5ZeXpYVmZHY3pRQWdh?=
 =?utf-8?B?ZHZDUWhOZlphbjlUaU1hT3NnNCtaNy9VZjNCZHZjbEpKVEZkZmJDYndEQWlC?=
 =?utf-8?B?RlVWT2VGd3crRWFLQzc5SW9GOC9ya0h0dHhpTmtEaGlHUVE2ZWs2U2R3a0My?=
 =?utf-8?B?dUlDM1BTZzRLNDk5OTBTUlJYc3JqU3F1ZEtGSWV6ZUpKdXMyRFA1cHY2QzRu?=
 =?utf-8?B?RUxGZXlIc2d5c2t0V2wzVk5qSEFxQ3krUkpJVzNvcXNhQ3YwS0RwbVZMMGVB?=
 =?utf-8?B?RldCS0FOY2N6OXJMVEU3RFdYZXlSek5Idnd3SnJIZzFoejQwWjg4U0V5azlR?=
 =?utf-8?B?V1lvZnMxRTJ6VStjWStPcHVBVGZ3cVNUMndla3R4VkwxYXZubXk1NlpXMFVY?=
 =?utf-8?B?bHgzMXVtY0NFbVZiei9nU0RwMmxPd0piZFo5NkRFWlA4Ti9POEoyb29RNUdU?=
 =?utf-8?B?WW5TVkRhOGoxOUpjckttbXF5VWY1OEswTzU1TkhpM3ZGTE1DYm9tVkkvWW1S?=
 =?utf-8?B?MlczdGZTQ3ZKWUJhdTVhT3JMWXhNTFZ0RlNUUzAvelVCNXBqRldOSHVxc01G?=
 =?utf-8?B?Y0d1RmQxSjJpdmo0ODFBUzRuS3Q3SHNPU09HWG9QN3pwVmE0NzBHeTRKbnlz?=
 =?utf-8?B?YzhTREw2T2VMTnplVUZ2VCtaaXNtdkp0blVFZXBtYjN3TlcrdGJjb1pDUEN1?=
 =?utf-8?B?aFgzUmJBQ1dJclIrM2M5SjVVVHBqMXZhNFhXbVZ5Tkd1eU9uOGUyWS9ncjU0?=
 =?utf-8?B?VVhic0tiMEplcWFhSUYwN09YNVZlYUJKbVRwWWlyNXQ4YnI0UkY1MG92Vk9L?=
 =?utf-8?B?TnJYT01jKzhVa2ZhRFZaVkRZL01Kc25WSGZmZU0zZ2VhMDNqQUdiWG9pQUZC?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01925ffa-b45a-4545-c0ab-08db8cd49562
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 06:01:27.1962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prWB0Hw6OkEtUObikdThrDdb0PUuNMKf/ahOk7q/mNT2MJ/PznLJrjLjEui3c9HOhQtt1fCIirxoDlIxx7uF55oIZkvXSOzHqBDursV9iUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/20/2023 2:54 PM, Lisovskiy, Stanislav wrote:
> On Thu, Jul 13, 2023 at 04:03:34PM +0530, Ankit Nautiyal wrote:
>> As per Bsepc:49259, Bigjoiner BW check puts restriction on the
>> compressed bpp for a given CDCLK, pixelclock in cases where
>> Bigjoiner + DSC are used.
>>
>> Currently compressed bpp is computed first, and it is ensured that
>> the bpp will work at least with the max CDCLK freq.
>>
>> Since the CDCLK is computed later, lets account for Bigjoiner BW
>> check while calculating Min CDCLK.
>>
>> v2: Use pixel clock in the bw calculations. (Ville)
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_cdclk.c | 61 +++++++++++++++++-----
>>   1 file changed, 47 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
>> index 701909966545..788dba576294 100644
>> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
>> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
>> @@ -2533,6 +2533,51 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
>>   	return min_cdclk;
>>   }
>>   
>> +static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
>> +{
>> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
>> +	int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
>> +	int min_cdclk = 0;
>> +
>> +	/*
>> +	 * When we decide to use only one VDSC engine, since
>> +	 * each VDSC operates with 1 ppc throughput, pixel clock
>> +	 * cannot be higher than the VDSC clock (cdclk)
>> +	 * If there 2 VDSC engines, then pixel clock can't be higher than
>> +	 * VDSC clock(cdclk) * 2 and so on.
>> +	 */
>> +	min_cdclk = max_t(int, min_cdclk,
>> +			  DIV_ROUND_UP(crtc_state->pixel_rate, num_vdsc_instances));
>> +
>> +	if (crtc_state->bigjoiner_pipes) {
>> +		int pixel_clock = crtc_state->hw.adjusted_mode.clock;
>> +
>> +		/*
>> +		 * According to Bigjoiner bw check:
>> +		 * compressed_bpp <= PPC * CDCLK * Big joiner Interface bits / Pixel clock
>> +		 *
>> +		 * We have already computed compressed_bpp, so now compute the min CDCLK that
>> +		 * is required to support this compressed_bpp.
>> +		 *
>> +		 * => CDCLK >= compressed_bpp * Pixel clock / (PPC * Bigjoiner Interface bits)
>> +		 *
>> +		 * Since PPC = 2 with bigjoiner
>> +		 * => CDCLK >= compressed_bpp * Pixel clock  / 2 * Bigjoiner Interface bits
>> +		 *
>> +		 * #TODO Bspec mentions to account for FEC overhead while using pixel clock.
>> +		 * Check if we need to use FEC overhead in the above calculations.
> There is already some function used in intel_dp.c:
>
> intel_dp_mode_to_fec_clock(mode_clock) => Should you may be just use that one, to account FEC
> overhead?

Hmm right I agree, I can use that here, thanks!


>
>> +		 */
>> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
>> +		int min_cdclk_bj = (crtc_state->dsc.compressed_bpp * pixel_clock) /
>> +				   (2 * bigjoiner_interface_bits);
> I would use "num_vdsc_instances" instead of 2, since we even get those explicitly.

Currently for the bigjoiner case, the num_vdsc_instances returns 4 for 
the pipes. Should we have a function to have num_vdsc_instances_per_pipe?

Or perhaps one function for just getting the PPC which will be 2 for 
Display>=10 and when dsc_split is used, and 1 otherwise?


Thanks & Regards,

Ankit


>
>> +
>> +		min_cdclk = max(min_cdclk, min_cdclk_bj);
>> +	}
>> +
>> +	return min_cdclk;
>> +}
>> +
>>   int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>>   {
>>   	struct drm_i915_private *dev_priv =
>> @@ -2604,20 +2649,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>>   	/* Account for additional needs from the planes */
>>   	min_cdclk = max(intel_planes_min_cdclk(crtc_state), min_cdclk);
>>   
>> -	/*
>> -	 * When we decide to use only one VDSC engine, since
>> -	 * each VDSC operates with 1 ppc throughput, pixel clock
>> -	 * cannot be higher than the VDSC clock (cdclk)
>> -	 * If there 2 VDSC engines, then pixel clock can't be higher than
>> -	 * VDSC clock(cdclk) * 2 and so on.
>> -	 */
>> -	if (crtc_state->dsc.compression_enable) {
>> -		int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
>> -
>> -		min_cdclk = max_t(int, min_cdclk,
>> -				  DIV_ROUND_UP(crtc_state->pixel_rate,
>> -					       num_vdsc_instances));
>> -	}
>> +	if (crtc_state->dsc.compression_enable)
>> +		min_cdclk = max(min_cdclk, intel_vdsc_min_cdclk(crtc_state));
>
> With notes above taken care of:
>
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>
>>   
>>   	/*
>>   	 * HACK. Currently for TGL/DG2 platforms we calculate
>> -- 
>> 2.40.1
>>

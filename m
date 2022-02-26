Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2042A4C5269
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 01:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4A410E26B;
	Sat, 26 Feb 2022 00:10:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A987510E26B;
 Sat, 26 Feb 2022 00:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645834252; x=1677370252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R45cYbPWRMotCwk43lJ7aoZxhCwACVELbyweOB+nJ2c=;
 b=dZSv2HaBBXqDxGzsrTXTlMKmGBDhhXPclH8kQ/ZdTw599HE2c9Jx3Pdz
 7jQ7U6yOThlpvqC2OItWnqjiDG66QQyTbrSCuVVbOg9Kb4D4jAJ8zulb1
 e5uznTltN+bjy0UDwSNz3PBpWdjcuivRYu1gmh86orBTBYyxtaKJxaTvO
 NUDK5LtoPmM7VOp/iY88MLYFr8oPEmMCy+dUHzsRe4Bpiadj3GlaESewT
 j+JvdrxvZk9cKKdBFeLOT+R6TK6aI5tLYNM0Kk6t8tMLr8hy35T4PNDos
 gpxb48DFAhnoplxTfV0lTbcZREKJpjUw2xSUxSCH4euYIRzdR2RbS2e/Z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="240011908"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="240011908"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 16:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="506860044"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 25 Feb 2022 16:10:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 16:10:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 16:10:51 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 16:10:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNAez21jWuWOTiF19JTE8YA5nDuskY7dimlHpLPhbUIR+vqV0rgqk+KemtqbW/WXfI5Xxuqo/34SB2JeBb+VPu9R4V0LnrYzlw1JjqpKGvOvMq9S9o7aLZspbNOeC9xkHYDYVf+M4JsikZL/en4CTyp+hbGaSx7cMjjORzwWEA9kXmyzyfng2S05NRspusoIBEcvAfRg4HI8wl65R4V+nC+uyiqaeEVrv7H7HowNmfhsWzdIRHIGugexcXqlQOKzD6ejT9hGJYP2caQcRcJSuBTP8tWK2MmWlZve2sMPIb37TV2lP63XJD11YPh3723t1KZBocetfz8YBOLsokn53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzt0KCzJe3w7yTDsD4rQZ0D5UmjD+MgyHaSRSJjx+i4=;
 b=IRV6BP7NDVYNkCLgp/o+rjeAhcCklzN+T//rstJXeWSl2b7ByRRkJs+TzObRZ92w2KUhIRszbO+h3qT24Qpq/wKpm70/IAhQPSzOkrj9snOuQU0GspHA5RiEU+Vnyp7/A2xz1KCLerIkRni//qnMNEilE3lFCBrn1k40mv18Vevon1RwT9pWH/zJI9dBSxuyADXeSO5M8VhUYqFV8EQEO9VVq/mcFI2YKZsswPCaBSuuDaPvSHI+PpKPnHza3wjwPIxy4RhTB6OY/pMxkHzD1qFdkBqFVFvMh05FtnlNgOdaMLEyVyVU7WLXokp+FJs2ThNn6LLUBIqtHQCO5DVF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BYAPR11MB3701.namprd11.prod.outlook.com (2603:10b6:a03:fc::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Sat, 26 Feb 2022 00:10:46 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.026; Sat, 26 Feb 2022
 00:10:46 +0000
Message-ID: <b8a034ee-714d-2590-5528-98a5b9228ee4@intel.com>
Date: Fri, 25 Feb 2022 16:10:44 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 4/8] drm/i915/guc: Split guc_lrc_desc_pin apart
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
 <20220225000623.1934438-5-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220225000623.1934438-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8319c178-a1af-4bcc-ba62-08d9f8bc6f93
X-MS-TrafficTypeDiagnostic: BYAPR11MB3701:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB37010F77DECE6A653C7BE116F43F9@BYAPR11MB3701.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8oTkv08eTphMmZL8blCK6xk+aI6WkRdZpWN//piXt6b6aA0i9cBXNI1fdEcZ8Mpv77bd7mbpasiNBzcQzrs7K7abc2daqR78rRTBXSljDEBIhEihTWQko35X0zNJMet2i+bPEfU+Q/WHsbItWaTBR/V4Y5MSSU/1Ms6Lthxc29zECK9XWEagHWVkpn7803/w5aZN3oZASt40uZBBn89JhGdLNqbhP5Kg/7UeDGED71sminsW91MkcryekFxqFPhsedmG6j/JcFzZNz6hBrCYlXcac40J0C6mEMvpc4vmHvRwEi6L45PcXEgoN9UnMdKL9mWNz5mHRiTeNoENTvLozy82kMnqOXJiCIA/jFOhKePFWVGOPx6st7MSj5aXJb7vxfILC5OZbzZGWJApHwXMRjRFoBuIjG5kqVkK5niQ+60moDNEJJSTzDVbDtNFH4HuXkLVk4ZvfNipCdQsIyMx0Wcbkw6U1a7aMgFozMJk0wRDAW/idRuQrLZpH37ubtu9XGqfdAs1GUJ6Hbf675twBDIYh4PAK+bIqjyqoSzI4b+YlSPDHJ1HE9jO839SnYrP7sE1/+giff/bomapAS5TCPKCakZAqrA7vtkWiDUxgTqhDs/tbyD7vcKTKDUiGq2xngDiy4p0xXn/fLX143bukIqwYTyoaoce7Fpkb278jXPnYnBanvlvBV2D4+dnYi4yCmMQmVWl1HcSPZY7oWjuwUa2vLD7Q0mB7skE2nHlZ3hsxtgS+Ou0ARu70vjG7Y0gBHWSipamFSEe2jysE3KlKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(82960400001)(5660300002)(2616005)(6512007)(31696002)(31686004)(36756003)(38100700002)(66556008)(66476007)(8936002)(186003)(6486002)(508600001)(66946007)(450100002)(8676002)(316002)(4326008)(86362001)(53546011)(26005)(2906002)(6506007)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dElsT3llOWF4bEdSUWY2SEQveDVzbHp2OWhoTXBWYzRYaStJTk1qNkJrNGZs?=
 =?utf-8?B?WXZHS21wUDM4NDU1bVdydWRUWHJ3TjN5VmRwYmF6Rm9wc3BERmcvTldFbEFJ?=
 =?utf-8?B?K0dNM0VqYTFtRGlmdkwwQXNhbGZXS0pIT3dOVzhTaVR3YW1OQmQrZGlpdU5H?=
 =?utf-8?B?eU1FbkNLSWszRUVaMks4V3hNRnRiRlNheDVCamNBZzdhMDlpZjRsaTAxdGIr?=
 =?utf-8?B?Qk1aeWFSdW0vQ0tDVUh3ZEtWQUdMVVgvc0pJY2duOTR5bVF0UStBTEJZUXNs?=
 =?utf-8?B?TW1nT2k2c0VZaGNTT2QyaDE1WXphRTBkNU45M2huS2hhU0p1cEI0ejl0QzZ3?=
 =?utf-8?B?dkFYMHlvQXdzSVBGanFTRm1TZ3VuVFQ2cUx2Y2FSTjh4SkVoZ25QZitGK2Vx?=
 =?utf-8?B?SHNyemRZMnBieGhLQ3ZPOU9Xb2tpSkZkUzBkaVZKd2E1WXI3MEppOGszbitO?=
 =?utf-8?B?b3kxV0cyTzE5dHRCSElpcXZnUFBJd0dva0xVSWIwWmpXblJ4YWlJYWs0dWNT?=
 =?utf-8?B?N2o0Y2pBWUdVakRFMUVub0ZGUGVTalZvbjNFNjBIMWYvWktka1VZT0wxdUxF?=
 =?utf-8?B?RW8rWmFRWnBwQnhzV2xZSEhpYnFtM1M1c25mNGNBUjZNcXNmbGNxY2E3T0dF?=
 =?utf-8?B?dGd5R3hDcWlEd1lpV0cvaHp0N280NUZCUU1JbmZtMTR5eVBxeHk0UCtCZFQw?=
 =?utf-8?B?U2cwNDZxdGNkQnRubEJILzZJN3lzb2ZHWERrVGZYd0JTZTJMOWRaTGp4ZU1x?=
 =?utf-8?B?TWJaWlRBaVVJcjRBZjNESld3blB0YXhXQXo1eldVYjlYM0VrVUF1NW5TL3dC?=
 =?utf-8?B?M0ZVR0xadmR2Q3VOSnQvdHlQOTNWL21jMGE1VWZVd3JpWThZNDlFMHg1UVdw?=
 =?utf-8?B?Z29rZno4bkxwSEhheVlod2M2Z3JIbDVUaWtVZHg4MlZXRlZaTFZJOThkMkt0?=
 =?utf-8?B?UTdXRjI4azBnbHozR3dldEVodGJGbzZITkJwRWdtUHFhRVUvYlNQSjNva3cz?=
 =?utf-8?B?MklwVlhONHZTaFJyQ21SeTFlSWRMaDVhUmo3c05DRDZkNG1ocW5tVUdXSkFR?=
 =?utf-8?B?K1NPUitqUi9NaGtYQko4bjNndXBNcnVRZUtxdE02bkNVU0Nqc3cyMlZQamxL?=
 =?utf-8?B?bHRibU9PRmJiSEJpcCs5amU0cXlrTTF0NDY0ZzhkOG0zQzkyRlBDdmtmUHlR?=
 =?utf-8?B?ZC9iU1lIajRYSDA1M0hJZWE1NzNvVWQyWEs4QXQrd2dHU1J3TU50UWFxbGVF?=
 =?utf-8?B?aWdpL1BtVXpybUlzZmRIUUNEU0xsN1poM3VNbnZLWkptL3g2MnlYY1g2U2kw?=
 =?utf-8?B?RTAyQjBEZ2VxUGJpcGZOSDNiWS9GcWxGMXZPQXZvUXR2d3hWZ1lvalIxWitZ?=
 =?utf-8?B?SmowZHhxVkJMUTd5NHRjeTdrVTUvN1pwbVhsQzNUTDlpVTBGR3E2Zkpqa0ts?=
 =?utf-8?B?a1NtTnFieFdwZ2ZoYkpNcnY0Z0hrcFRScmtSRjM2c3lTcXNiZFphYzdac2dI?=
 =?utf-8?B?a2FqRjNieHlSaityRG9mWGdxcS83UVdSREpPYzl6czl4N2wzTG5XajBBczZz?=
 =?utf-8?B?eVBMS1RPTVdmMEdSOVk2QVlnSjNFVTIwcGlrMVFTL29oMzBWdkFJSFUrdStG?=
 =?utf-8?B?Q3oxdzFwcjZjWE1WSzdnWGM0MjI3aWVsRnpndm1OaHIza2xsK3BMaUlmbEhz?=
 =?utf-8?B?Y2w5Y2IxNm95Uk9iOEdTK0hIWDhML3pjaFlwR05YelhmT09ZV3lGcFN5TUha?=
 =?utf-8?B?NjZVbkM2ZEhRT01YRHoyMXJRZ3VKWmlDSnpERzFuQXlERW1mUFU2WGtYTEJT?=
 =?utf-8?B?V1g1TTF4aHhvdHdKd0c5VE9wNHBlRlpSZW1UcFdxMmNOS2E2TE9Kb1ViRThJ?=
 =?utf-8?B?QlpqZlMrZWxRUmNUZHl2K0dPUXNGTncwQ2pTejJ1NHFIeGZLc0Rlc2w1aTFl?=
 =?utf-8?B?blRLNXlmS0hhclFiNENrTjNZZER1Qk1VUXlMN0VlNC9TaHZXVWkrZ3ZOU1Nh?=
 =?utf-8?B?Um9uTG03MTlYcU94OEZHd2dFMmczTVFRVEcwOERqcms4TVBJZStrZWJhcW1T?=
 =?utf-8?B?azI1MzhHdHdRNVppSnhlQ1JidUppREtGR1lZdlZmNjdrTTRrTCtuYk5KbXFu?=
 =?utf-8?B?NFREeHFCZ2tlWFAxNGUwU0V6V2djREJyV0lwbE5HaTZKRFVEeHlmSFRBVzZa?=
 =?utf-8?B?bTZMK0N4UlpZZVpNRmxuMDlKcUVGajZCL3BnUDVJT1RTNndqRFpsZ1dGK3Zu?=
 =?utf-8?B?ZUtSOUxrUFNFM1BZN3dkUkNxOUpBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8319c178-a1af-4bcc-ba62-08d9f8bc6f93
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 00:10:46.1627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqFL7Om18F8RDDypFt6GlpXe7cMbej1jqNN7uwS+i5xbNRmBWjQWO6FESZi9YCGiVBQK+VlFXpC3Pk6do+PmuOYtm3M+QRZUvj7Szklk2Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3701
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



On 2/24/2022 4:06 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor pool is going away. Further, the function that was
> populating it was also doing a bunch of logic about the context
> registration sequence. So, split that code apart into separate state
> setup and try to register functions. Note that some of those 'try to
> register' code paths actually undo the state setup and leave it to be
> redone again later (with potentially different values). This is
> inefficient. The next patch will correct this.
>
> Also, move a comment about ignoring return values to the place where
> the return values are actually ignored.
>
> v2: Move some more splitting from a later patch (and do it correctly).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 54 +++++++++++--------
>   1 file changed, 33 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ad784e8068c7..e41e309b9e7e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -634,7 +634,7 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   					      true, timeout);
>   }
>   
> -static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
> +static int try_context_registration(struct intel_context *ce, bool loop);
>   
>   static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
> @@ -932,7 +932,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   
>   		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
>   			     !intel_context_is_banned(ce))) {
> -			ret = guc_lrc_desc_pin(ce, false);
> +			ret = try_context_registration(ce, false);
>   			if (unlikely(ret == -EPIPE)) {
>   				goto deadlk;
>   			} else if (ret == -EBUSY) {
> @@ -2237,20 +2237,15 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   }
>   
> -static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> +static void prepare_context_registration_info(struct intel_context *ce)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> -	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	u32 desc_idx = ce->guc_id.id;
>   	struct guc_lrc_desc *desc;
> -	bool context_registered;
> -	intel_wakeref_t wakeref;
>   	struct intel_context *child;
> -	int ret = 0;
>   
>   	GEM_BUG_ON(!engine->mask);
> -	GEM_BUG_ON(!sched_state_is_init(ce));
>   
>   	/*
>   	 * Ensure LRC + CT vmas are is same region as write barrier is done
> @@ -2259,11 +2254,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>   
> -	context_registered = ctx_id_mapped(guc, desc_idx);
> -
> -	clr_ctx_id_mapping(guc, desc_idx);
> -	set_ctx_id_mapping(guc, desc_idx, ce);
> -
>   	desc = __get_lrc_desc(guc, desc_idx);
>   	desc->engine_class = engine_class_to_guc_class(engine->class);
>   	desc->engine_submit_mask = engine->logical_mask;
> @@ -2308,6 +2298,26 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   
>   		clear_children_join_go_memory(ce);
>   	}
> +}
> +
> +static int try_context_registration(struct intel_context *ce, bool loop)
> +{
> +	struct intel_engine_cs *engine = ce->engine;
> +	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	intel_wakeref_t wakeref;
> +	u32 desc_idx = ce->guc_id.id;
> +	bool context_registered;
> +	int ret = 0;
> +
> +	GEM_BUG_ON(!sched_state_is_init(ce));
> +
> +	context_registered = ctx_id_mapped(guc, desc_idx);
> +
> +	clr_ctx_id_mapping(guc, desc_idx);
> +	set_ctx_id_mapping(guc, desc_idx, ce);
> +
> +	prepare_context_registration_info(ce);
>   
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
> @@ -3145,7 +3155,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   	if (unlikely(ret < 0))
>   		return ret;
>   	if (context_needs_register(ce, !!ret)) {
> -		ret = guc_lrc_desc_pin(ce, true);
> +		ret = try_context_registration(ce, true);
>   		if (unlikely(ret)) {	/* unwind */
>   			if (ret == -EPIPE) {
>   				disable_submission(guc);
> @@ -3633,9 +3643,17 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
>   static inline void guc_kernel_context_pin(struct intel_guc *guc,
>   					  struct intel_context *ce)
>   {
> +	/*
> +	 * Note: we purposefully do not check the returns below because
> +	 * the registration can only fail if a reset is just starting.
> +	 * This is called at the end of reset so presumably another reset
> +	 * isn't happening and even it did this code would be run again.
> +	 */
> +
>   	if (context_guc_id_invalid(ce))
>   		pin_guc_id(guc, ce);
> -	guc_lrc_desc_pin(ce, true);
> +
> +	try_context_registration(ce, true);
>   }
>   
>   static inline void guc_init_lrc_mapping(struct intel_guc *guc)
> @@ -3653,13 +3671,7 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>   	 * Also, after a reset the of the GuC we want to make sure that the
>   	 * information shared with GuC is properly reset. The kernel LRCs are
>   	 * not attached to the gem_context, so they need to be added separately.
> -	 *
> -	 * Note: we purposefully do not check the return of guc_lrc_desc_pin,
> -	 * because that function can only fail if a reset is just starting. This
> -	 * is at the end of reset so presumably another reset isn't happening
> -	 * and even it did this code would be run again.
>   	 */
> -
>   	for_each_engine(engine, gt, id) {
>   		struct intel_context *ce;
>   


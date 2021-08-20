Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCFE3F33DD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 20:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C0D6EAE1;
	Fri, 20 Aug 2021 18:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2626EAE1;
 Fri, 20 Aug 2021 18:32:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216826163"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216826163"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 11:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="424512109"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 20 Aug 2021 11:32:02 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 20 Aug 2021 11:32:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 11:32:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 20 Aug 2021 11:32:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 20 Aug 2021 11:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KO5AMDRW9NQJfkxv2HAVUauIEhxY3IacVXpcSMsHprfKLvKQsVrURK1UR1VrJ+etAqAXBfbCudeZhMRaI1AXWM3txFZK1e5uLaOwU65ODth2epulY7s0jxEcpI0epYRNCWcnj7tf7p7Nusj5NtUWRg0A4G99019w/2vpNxc4qPxxo4RPWzrwnAeYnvip8+ort67io24Y/yBLrCulNjlG6tzy3jcSV8b7U/uKwf+c4bFiS64GPI3lPmaV0iRqzv3YSldB6qJ1MAjT61TNXM1MyqMv5YVHU3m3SZiJrArDgTfB4kJcuV5Gjxf3glm7oqp8M7lLhFgdGL51hcka/w9jaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFYpZ0Jj7cItC/AdwkmjoVHT2G6omvgYraXAk9uf/So=;
 b=avB/q69BS4hHMN1e35jrYDN4UYZkShWtCWmStzzNbC9w1L7kk1kmy2kHlz4fZaAz4e0p2uI3RWATGYfnrMcVQZZBgPK2ciKTA9vxe+erxpggouM+cM9daC7zMvM7HqkRNfW54A6GnFLUgjqMx+N5d5MJCP4cE+DR1E0PYj5+kpEVGHPUsixnW5vBC6hdC7+ejURlf4FIFfwHXucZN7Us6xIGtOaR9HftHwBInsJD7lO5y7LteRBUMhjkaYaVMRtx3Uzz8BAEx/H4Nho/9h0XdFR71Lm8gKJeEn24Kw27XhdrZg6RQOdr4tlZXTIPiKtv50Y6X9CH9LGmTWn0Zp0mtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFYpZ0Jj7cItC/AdwkmjoVHT2G6omvgYraXAk9uf/So=;
 b=xKOHGnsE1xMOPYUN9uRhEborMkxAm/Ga/r3B/fIHBAWANVTGLobL/srsRf/lp0V6jH0fiTwD547zAqbllwYktgAQhF3RRxLMnYu13HUEKiuCjBqsa09MnDVuNOa0PQtSPOEtvQZtmhTfQmWHbJW4DsI27qF1VJ5S5RIfSvvZ7sI=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH2PR11MB4469.namprd11.prod.outlook.com (2603:10b6:610:43::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 18:31:59 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::202c:3305:3dc6:3b3d]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::202c:3305:3dc6:3b3d%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 18:31:59 +0000
Subject: Re: [Intel-gfx] [PATCH 09/27] drm/i915/guc: Kick tasklet after
 queuing a request
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-10-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <668d3590-04d6-277e-97b9-93784e6f7878@intel.com>
Date: Fri, 20 Aug 2021 11:31:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0107.namprd03.prod.outlook.com (2603:10b6:a03:333::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 18:31:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ab6e7c5-8911-472f-9807-08d96408cbeb
X-MS-TrafficTypeDiagnostic: CH2PR11MB4469:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR11MB4469E44DF4E05C8FA235698FF4C19@CH2PR11MB4469.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HuKkTkw1vLbRlYw+L1X33BRljhffXuatgS8Kn4PkAGyC49B2VjVTvzLMgujW8jAfQVVYEtDtx9bpGDFQMib8CmcqIMd7VjVbDH6bonDewZXknpsUZ0Fksx0uNaS/5cbS7ucC5P0jUx7U0jf5QATx2+eUjDmGxWL35jB7xF73vbtLpcjQ4xS6r5WvOZl8vH2gk3rEJrPyS2Gx8NUiR/yoe5jj5dUUPAJYMLxchWiha1TVNicnezBa9RYioXWOV+N0nNGEHC1Rj6IYH5YziCyx6qyCFAGUGv2uRMnJ0I7pOCANCSCu5XXGxSjseOfus91g3Mlzcu2M1YJhzancs9APxzaDoC9/TKdMvxVkH12TbNgem3JEc3ywPq/WX3UzMRyDB8MPdExroERb+xSt2DXGDZGPMedeYaCfybgdp3u0tr5yiw8vN5xa/iSBPAQDl68VXMlKAVDKl7SCy+qVoM8JHCaaEoc9kEYyCStOteHc1Try2DW+TiUXpavegoo4D7Hhy3MIKOdhpvIVpph5itus0+zPVf5FrAxWC9Uf68f86NLS2RRdkj4uHNhAnpTa9H+BdWEC1BGFOh9AUfy1SwsZXLmBQU1N8kKjBAOgLvKLCY4v84gYJNgIr/YfvA+n9P0qQXE/j5azgDXJl2ojxqI2ALwUstPdZQKQcEff95uleTJc5s4jDZAp+LDLoTzDYvDvSQEjOHodEQPcF1DpJIlvnzEG0MTWqbFnZg1VK09iuA4qyEjcNuVaCO/RHShPwy0X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(38100700002)(478600001)(36756003)(26005)(5660300002)(4326008)(2906002)(53546011)(8936002)(86362001)(2616005)(31696002)(16576012)(66476007)(316002)(66556008)(956004)(31686004)(6486002)(186003)(66946007)(83380400001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTUzbkxMQm54SVJSdkdEeU9iOUlHaldzN2Jabm9peHZiTzFNckdpWVBKaG51?=
 =?utf-8?B?akh2VGYxbDJKZUVGTE9ubHNWTHgxdm1Vbk5icEl2eStoektlYkRNL2hONmc2?=
 =?utf-8?B?OG44dHpzcndlMnAvM05rZWh1MUF0NGJCWS9rb1dhdWgxd09mallZY25INEJj?=
 =?utf-8?B?dFdXeng3VUtIL1JKSnptVFFBandZLzg3ZzJXR3dJUU1HelNTMUFQRXVRMFA3?=
 =?utf-8?B?WUxFdjhQMFo0RVU2TFJ3bTJPNW9qUThtSG9HUTRBaENwMExaekZWcmdGck85?=
 =?utf-8?B?ZEFaOGNBOHAzZ3haSEF5V3IxNHlOK3Bub3dRQThhK2szRGR2ZjhUeUZNTnlw?=
 =?utf-8?B?OEpCcjU0bkpvKzl4RUhoTnZGaFZaNExTNExIWDVvbXBVZmg3d3BqSFo5MWtu?=
 =?utf-8?B?VDlZSE9RSGhnSGJyM0czRkhHbFpUMHNMOU5PYjErb01lZCtYRWN2RFBrOEZz?=
 =?utf-8?B?Q2JlVnVyc1hkT1ZMSTBFNVQ3azd6bnVPV2YxQW9zaVF6Z01yUHJZbVkxMUU2?=
 =?utf-8?B?cFdReHFSb2N2OGNzbkk0YVNwQ3FQalhPUEkwK3N2bHVkaW15ZkRaaTVjNFpU?=
 =?utf-8?B?bXBaNzJtcURlY3FiYWN1YmJ3dzlJZXVCbUFiTmxxQ2I5dkVYMm9NTmNHWjBp?=
 =?utf-8?B?T3FiSURPVTBWU3lGY1ZRK3EvMFRTZTFmZmFoWGJ2dWY5djNZM2hyRnlra1B4?=
 =?utf-8?B?cExlbklkRGkvZGlBZVIrdjUyZi93Mk1IbXFpUmlKUjhMemxTTWs1eGdCY01h?=
 =?utf-8?B?dzEvaERtQldqYTJMUGJQYS9BSGJpaWNiWS96L2l3WlBGalMwVDRPQmxEeXJj?=
 =?utf-8?B?TUFtQ0ZMUG1QNlliWlQ0K01iWmMyMHgrSm1xcnl4dEsvQTVINFpUcE12bzk2?=
 =?utf-8?B?ZzVoTXgrZ1Nja2hHckp5RlVRWmVaN2lvYmFzMjBHbkVRVWl5MnVidE1UdjR1?=
 =?utf-8?B?OVd0bWZMZkYzdFJaYVBvN1hnRHI1MlJDdjgrTjAreFJsYnU4bmZ6SEllR0xr?=
 =?utf-8?B?d3JJeC9QVEVuUjVVY0dpVFlzbitOSFR0KzFPMnNOQ3JpeE1OeFhGOGhuK1o5?=
 =?utf-8?B?TGFic2g1dTZDdWRZeEJVV05ENVIyMTFCYUdhVkNONkRhdnpYd0M5eEROMG9i?=
 =?utf-8?B?ZXNRUG04NDVTQjJ1MFhCdVowaUhPV1VhLzYra3g1Q3QyRENrcUFZYlkxQmxT?=
 =?utf-8?B?UHZ0THR4WFhkWFZQQURwdjlQQVcxYlNHTGl6ekwwYTZPN01FVmZST2xPZEMy?=
 =?utf-8?B?dXFsbnMzeFhhNE9yd1NCejhZRHVObWtybzA5dGZlUHByVy8vZFZ4N0NVOVdn?=
 =?utf-8?B?emVxanJON2l0NXZRUUtUVXIrL2tzS2VMZkMwSE5NRmVxbGtZTEZ5K09IcUJV?=
 =?utf-8?B?d1RkWDJxN2xnL0VYVFVaMXJWdk01MHNjaStkemhrdms2UnUxMCtUQk82ekE5?=
 =?utf-8?B?QXBZT2VNdnVVZnQ0Mk1pUDU5NmpWQ015RXRwV0IxcHR3R2xmbXY2ZEM1dGNY?=
 =?utf-8?B?MjU5Yndva3ZpZzFaUWNOaUxHc2UxNmJPazNKK282VlowN09TOWdUeERVemgv?=
 =?utf-8?B?NURzaXlQV0xoa3g4c3ZNVUgxb2xwZzZhVFNuTDluT1VVaXpwMjhFZkM3YmJi?=
 =?utf-8?B?U0t4ODcxZVZNM1d2WFExZmZpQTVBL3JTMFlDcnFsTWIrbTB4UEhQTHZ1Q1VB?=
 =?utf-8?B?Njd3eW5ORFhWa0cvcmhMeVEyMDRjdXhqdG9zWU9LcVBDNElSQ0JZdnJMWTFJ?=
 =?utf-8?Q?Y7qeuP8lFB/HI+owxvfQFYBn6qVL8W5AJmRHC7j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab6e7c5-8911-472f-9807-08d96408cbeb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 18:31:59.5616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hN2HUCGEK+kiGf0eRK+15ZsItSxTr/EriN1SpOKFF1ISa0Pptcxu4muVB1gyoWNevTblnknrShEgGUdBcHcE95t6Yknug+RXKXTUhJbnZZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4469
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Kick tasklet after queuing a request so it submitted in a timely manner.
>
> Fixes: 3a4cdf1982f0 ("drm/i915/guc: Implement GuC context operations for new inteface")

Is this actually a bug or just a performance issue? in the latter case I 
don't think we need a fixes tag.

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 8f7a11e65ef5..d61f906105ef 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1050,6 +1050,7 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
>   	list_add_tail(&rq->sched.link,
>   		      i915_sched_lookup_priolist(sched_engine, prio));
>   	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> +	tasklet_hi_schedule(&sched_engine->tasklet);

the caller of queue_request() already has a tasklet_hi_schedule in 
another branch of the if/else statement. Maybe we can have the caller 
own the kick to keep it in one place? Not a blocker.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   }
>   
>   static int guc_bypass_tasklet_submit(struct intel_guc *guc,


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBCF3C95C4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 03:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C88898AF;
	Thu, 15 Jul 2021 01:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71F789704;
 Thu, 15 Jul 2021 01:58:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="197725147"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="197725147"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 18:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="630581448"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 14 Jul 2021 18:58:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 14 Jul 2021 18:58:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 18:58:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 18:58:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 18:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN9aToQjbQsMuTXHrxos4cZqp+f9h0nDlsD8iqsI9FyCyWx/bd1Era4Gpd7XiJvCTdik5Z6VsAtcEh6YfRfV9YTdhahE6MFjKt+R/akYu+ulzEdfOEhpTkJvOCuezl5Y5Cgek4z3jUFW4BVTXwOcM0qgQWBrCfZ9VOx+c6M44t2t0Efjl7HgsXJfGYxCegX7skzRigRLii3PNb7jDgIvyyv7lzCScxcLoDfLELUDKMdgOlEKGDNqLHFyjrpTnUgeMXKQTZ/R2LB/D6X0IpaJObzDPTXDkQYVhDk2Z8/2HjviYOrVN6Imb2qJ0pZJ3fMmLXvaCqn+C8Vwg4rWMJ4yCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qod8uhynfN1+YjJlNSI76G0V73iKTs08vC7eXxts4K4=;
 b=GYrlk3FYcqHERc8cwQ7SHYWeW7nEfQDvIqLHz24bacZwBZt7PeZLfOd9/aRHj256hCxRXNO8cc9mF/GVTMgzub2tJwm+RqIBsasgbFOcmVVrTELysNZ2cIVHsrpNJt1DRoOyjlr27JptR0Sq744OtH+5tyBCfU+hH/rrcjKthTKJbzHTcfN5N8JVBSG2TDBjJ4F8Wsa5YejpqKF2HjzyGrqMNmINjDryK8mxjGvbDXAEaOdt5dUWP0f+phjTTt/llRMfBblsr+S6YRrqjNrVXgyZ8yX4TfzMMma5vQmYTg4VxKRwOXQSwfWq9lUIu72P5R0ZSRclgZCU2iNES5Gp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qod8uhynfN1+YjJlNSI76G0V73iKTs08vC7eXxts4K4=;
 b=sMIAI6vD9CiOlocTTbDlzSxL4o+iXKWTC7SyXTc2A0EcCH5Qx0W71Myi21gErYEPLMuI0POmHEJceA93EePvoIPKPQMRq2/Q73ttNM6+59yf2Yy0AE0tQv61a9GZji8IrmayZytksc6vhaUHVxQmHlE7mhFoI91JsMKD/xvhSrA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5667.namprd11.prod.outlook.com (2603:10b6:5:35b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 01:58:38 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 01:58:38 +0000
Subject: Re: [Intel-gfx] [PATCH 07/16] drm/i915/guc/slpc: Enable slpc and add
 related H2G events
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-8-vinay.belgaumkar@intel.com>
 <24627794-12b3-1d4a-2ee0-d6ef45be0b05@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <46aa5a21-c32e-9626-830a-43ff3fade57f@intel.com>
Date: Wed, 14 Jul 2021 18:58:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <24627794-12b3-1d4a-2ee0-d6ef45be0b05@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR03CA0388.namprd03.prod.outlook.com (2603:10b6:a03:3a1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 01:58:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af3b0274-9469-44f2-8c32-08d94734101e
X-MS-TrafficTypeDiagnostic: CO6PR11MB5667:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5667BE1CF2C7AF118DF7068485129@CO6PR11MB5667.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLlwjmV6+n2zGoohPw38SdoHl6nOjZGD7K2vf204LxadTx7OeGBL7ZfW4qFjCA/uxKETWDqgbrDt3mo9UvBuK4IrJczmBjEkhSMgIdAKbSWUkycP6LmTt/HRMNf90Or5FxQk8n3+rKbxDfYF4EHJCdgNJDVHm1MGhcYfnfusQd7xVIlHw5sG8zFm/cFy4qp7ahLo3nD/T4ArEW2rY4PELSkUoBmX//brxuRYXf92SZ9ROf6bzdk5fXrbgjFxP3z31laJ+NvPYW1wXXpGP8yO0OIzuPiC8FhY9ek4oBGGo7YemCMd1lXk4gQJ4d9wzqbOBGX8+yFzR7SEJ0ESfjhVNlJlm/n+njDm09+r+yBcAB2575pAdCC8dQ7V+zpZl+R+NQS8qYCPiohM8r9SMx1KBHY1w5FTQE5AvD1/h+6hYYHX22WXtq/xjVd+TX6ARo6JgRo6wDbUK88tR2Bt8pi9xALjr/yCy0gI3+wlDSpxd9WTiOTM5DtbHEMvArf9kR2/0VF59Fu/VI7+6mrjZsrEoIANiMtlPuheazm2lip7YCTKER4Lfe4tzu7qfsa7KcSoa5AnFJrilCI8p2Hizf9dAeadzjthiIRSiGwGjQpzmCdy9uQRslNncfqPv48KV8vAEsVSBKy4A7u1YHuNQ1K4VGbW/3zQvZ+u7aKQfwRgzCG4+/zeGea6dlYPdJoo20g+6JAZiB3IBr9f1cE2e/pBWGqp5/VQiBonCSlGmV89OhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(66556008)(6486002)(8676002)(2616005)(6666004)(30864003)(66946007)(66476007)(86362001)(478600001)(26005)(31696002)(450100002)(956004)(31686004)(186003)(83380400001)(8936002)(5660300002)(316002)(16576012)(36756003)(2906002)(38100700002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RPcUlYSTZ3a2c5MDVTaHV6VmZZbmM0V1g1MHJNV2plYnQzWDdCdjAyNHNx?=
 =?utf-8?B?d1YxMEkxaGZnTGlhVzAzdDZ4ZFBqd2lBTXNRQXNJRFRZaEhBNnJWc2tNZGQ3?=
 =?utf-8?B?Nmp5b1pSaVpGcGdxMWNOVUNXaHB3eGx2ajQ1VFk1SVFObGszSEd3WU1MRWt5?=
 =?utf-8?B?cGFud1pRbmJwZWw1b3JyNnZUZDA3ckc4dVZVS01XSTVENTM5VlZpd3BxOVdV?=
 =?utf-8?B?UWhlZVlzODdYOHhuMGlrN1ZJenRuTmV1RjlvVXpQeTdHTzlvSVBaOHYyZ01V?=
 =?utf-8?B?Z2tUS3R6K2QreFloVFpYaTdmSWV3eHIxN3FRdjlaS1FvcXVaQWlhSnlDeUk4?=
 =?utf-8?B?UnlWYWZsaVNTaVVtSHBFMndab1FibHAwV01iUlIwZlJNTGlKZUJKTXp3ZnRm?=
 =?utf-8?B?TjhMeVNqTGRaYzl3UDRCZ2l4aEJjSG9iMm0vMCtGNVE1ZnlxMGVCaW9nLytt?=
 =?utf-8?B?NXlORkZXU0xzTXgwSzA0QlFjTmh4alNncDY3VHR6RVRweVk0Z21WUUNxRlQ2?=
 =?utf-8?B?VVY4eVhkWG5idm9PMG9FU1NkQzdEekt3bTc2dEpwTjRVZUNoMUJ0L2crbGU0?=
 =?utf-8?B?dXNlQ2VwZzlMZDEvcllEb21wSXNacTFzN0srNUl4VGNkeUttbllrQ0VIb3Zx?=
 =?utf-8?B?enArMlVQM1dCTjJDT1hRWk5tVHcwb1ZsODBheHBtUHo3cjhZY3NpVUVhMDFC?=
 =?utf-8?B?RWI3cVpmVnlUUFpQVDdXY1FXZEJnQ29xQmFPU0tIRHA4bWw2aEVxUmxqOXd0?=
 =?utf-8?B?TWtqVUlhUlk1dC8zOXQvQW1jZ1FmbUhnV1IxcGxxMHA2NjNHcWZteElKUXht?=
 =?utf-8?B?VmU3WlE0N0tLZmV1MkFYblZVdVh0aC80TVVSYlZVTlpoeFp6TE9ScHZzaVhq?=
 =?utf-8?B?NGZSTGN3N2M3S2JxNDkybEd1a0VhOXJmWVZRRkpxNldocmpTQjdjOU9KR2Vi?=
 =?utf-8?B?NUNadkszR05CUU9PV0ZkOFoxdXRDSmpQQUhPaXZ4S0h4b2FvN0lwV241TmxZ?=
 =?utf-8?B?RFhhTmNLdElid3VzWXBwdnNYcVhXQmpNM3RhckduRTk0QjFxOTFkYnVCb3pN?=
 =?utf-8?B?STJIMFAwNEdrb3l3TFFrUmFid0FKc3htUENDZEJLM0NINDMzY1ZxVk1nQ0dw?=
 =?utf-8?B?V0M1eXpHaGNjaUJLdmZhendJQ21KU1JuWHhkcGhiMUs4SW5Zd3VQQmVlZlBn?=
 =?utf-8?B?WWxVM2dITWdmb05wY1dMbDlDb2hITEVIWG8xZHhJRCt6M3VaZUVWWFIvZVVX?=
 =?utf-8?B?OWRTREFOTzJXYU40OVp1aW9MZkJlazlDclNCK1JJTCtwMmtzSTlBUjl1cVV6?=
 =?utf-8?B?dlhURDk5dUI3RWl0T0JRVTBKNTJUS2hrbGlON2tUMlZvdU1sbUxpUEdQb0h4?=
 =?utf-8?B?UndEQ2VZQk96U0tqemtjZGIyZHZKcllseEphbXNIVnEzaWs2UlRaUU8wN0Fs?=
 =?utf-8?B?bng2a2pDKy9zZHVNaWtmZTR2aEZ4Zk0rQ085Qk1sdGtFWTY2OGNMeSszaGha?=
 =?utf-8?B?MlZOTDJOTFFHOVhTTjR0TXhXdHhVbHVhYzFGZFpJVGpDMWFibjdsbVpTeUVO?=
 =?utf-8?B?ck5lUjdOayt4SDgxT1REbURtaWFCdXJOYWY1Wi9mZVRjL0F6SWlEMUtYODdw?=
 =?utf-8?B?bS9vTFVDOEVFbDBsN1ZHYWNXdGx3WStya3pxUFJ4MzR4UmdNcHYrOVIvSGtN?=
 =?utf-8?B?S0pIenByRlJBVTlqTVBKMkQzWjJMQklUQzl2Y1pwa2phL2s2Q2NPMmpWNk51?=
 =?utf-8?Q?Hos3/2aZq76yjyMnB7vMurFwf0AF+aAc3555oOL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af3b0274-9469-44f2-8c32-08d94734101e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 01:58:38.5229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5p5/+SPcaEcbP5frdpcESM7ov+KXVxf6qB78xpIcwDfZGJPYiWZblH4GVhqbAx04nrIv4bNVy3+MRQuqIFkibbHMnRBFZp051Ghx+a3FrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5667
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



On 7/10/2021 10:37 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Add methods for interacting with guc for enabling SLPC. Enable
>> SLPC after guc submission has been established. GuC load will
> 
> s/guc/GuC
> 
>> fail if SLPC cannot be successfully initialized. Add various
>> helper methods to set/unset the parameters for SLPC. They can
>> be set using h2g calls or directly setting bits in the shared
> 
> /h2g/H2G

done.
> 
>> data structure.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 221 ++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 -
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +
>>   3 files changed, 231 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 94e2f19951aa..e579408d1c19 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -18,6 +18,61 @@ static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>>   	return container_of(slpc, struct intel_guc, slpc);
>>   }
>>   
>> +static inline struct intel_gt *slpc_to_gt(struct intel_guc_slpc *slpc)
>> +{
>> +	return guc_to_gt(slpc_to_guc(slpc));
>> +}
>> +
>> +static inline struct drm_i915_private *slpc_to_i915(struct intel_guc_slpc *slpc)
>> +{
>> +	return (slpc_to_gt(slpc))->i915;
>> +}
>> +
>> +static void slpc_mem_set_param(struct slpc_shared_data *data,
>> +				u32 id, u32 value)
>> +{
>> +	GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
>> +	/* When the flag bit is set, corresponding value will be read
>> +	 * and applied by slpc.
> 
> fix format of multi-line comment
> s/slpc/SLPC

Done.

> 
>> +	 */
>> +	data->override_params_set_bits[id >> 5] |= (1 << (id % 32));
> 
> use __set_bit instead
> 
>> +	data->override_params_values[id] = value;
>> +}
>> +
>> +static void slpc_mem_unset_param(struct slpc_shared_data *data,
>> +				 u32 id)
>> +{
>> +	GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
>> +	/* When the flag bit is unset, corresponding value will not be
>> +	 * read by slpc.
>> +	 */
>> +	data->override_params_set_bits[id >> 5] &= (~(1 << (id % 32)));
> 
> same here

Done.

> 
>> +	data->override_params_values[id] = 0;
>> +}
>> +
>> +static void slpc_mem_task_control(struct slpc_shared_data *data,
>> +				 u64 val, u32 enable_id, u32 disable_id)
> 
> hmm, u64 to pass simple tri-state flag ?
> 
>> +{
>> +	/* Enabling a param involves setting the enable_id
>> +	 * to 1 and disable_id to 0. Setting it to default
>> +	 * will unset both enable and disable ids and let
>> +	 * slpc choose it's default values.
> 
> fix format + s/slpc/SLPC
> 
>> +	 */
>> +	if (val == SLPC_PARAM_TASK_DEFAULT) {
>> +		/* set default */
>> +		slpc_mem_unset_param(data, enable_id);
>> +		slpc_mem_unset_param(data, disable_id);
>> +	} else if (val == SLPC_PARAM_TASK_ENABLED) {
>> +		/* set enable */
>> +		slpc_mem_set_param(data, enable_id, 1);
>> +		slpc_mem_set_param(data, disable_id, 0);
>> +	} else if (val == SLPC_PARAM_TASK_DISABLED) {
>> +		/* set disable */
>> +		slpc_mem_set_param(data, disable_id, 1);
>> +		slpc_mem_set_param(data, enable_id, 0);
>> +	}
> 
> maybe instead of SLPC_PARAM_TASK_* flags (that btw were confusing me
> earlier) you can define 3x small helpers:
> 
> static void slpc_mem_set_default(data, enable_id, disable_id);
> static void slpc_mem_set_enabled(data, enable_id, disable_id);
> static void slpc_mem_set_disabled(data, enable_id, disable_id);
>

Agree, done.

> 
>> +}
>> +
>>   static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   {
>>   	struct intel_guc *guc = slpc_to_guc(slpc);
>> @@ -34,6 +89,128 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   	return err;
>>   }
>>   
>> +/*
>> + * Send SLPC event to guc
>> + *
>> + */
>> +static int slpc_send(struct intel_guc_slpc *slpc,
>> +			struct slpc_event_input *input,
>> +			u32 in_len)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	u32 *action;
>> +
>> +	action = (u32 *)input;
>> +	action[0] = INTEL_GUC_ACTION_SLPC_REQUEST;
> 
> why not just updating input->h2g_action_id ?

Removed this, using your suggestion below instead.

> 
>> +
>> +	return intel_guc_send(guc, action, in_len);
>> +}
>> +
>> +static bool slpc_running(struct intel_guc_slpc *slpc)
>> +{
>> +	struct slpc_shared_data *data;
>> +	u32 slpc_global_state;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
> 
> do you really need to flush all 8K of shared data?
> it looks that you only need single u32

sure.

> 
>> +	data = slpc->vaddr;
>> +
>> +	slpc_global_state = data->global_state;
>> +
>> +	return (data->global_state == SLPC_GLOBAL_STATE_RUNNING);
>> +}
>> +
>> +static int host2guc_slpc_query_task_state(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
>> +	struct slpc_event_input data = {0};
>> +
>> +	data.header.value = SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2);
> 
> you defined header.num_args and header.event_id, don't want to use them?
> 
>> +	data.args[0] = shared_data_gtt_offset;
>> +	data.args[1] = 0;
>> +
>> +	return slpc_send(slpc, &data, 4);
> 
> magic 4
> 
>> +}
>> +
>> +static int slpc_read_task_state(struct intel_guc_slpc *slpc)
>> +{
>> +	return host2guc_slpc_query_task_state(slpc);
>> +}
> 
> hmm, all this looks complicated more than needed, why not just:
> 
> static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
> {
> 	u32 request[] = {
> 		INTEL_GUC_ACTION_SLPC_REQUEST,
> 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
> 		offset,
> 		0,
> 	};
> 	int err;
> 
> 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
> }
> 
> static int slpc_query_task_state(struct intel_guc_slpc *slpc)
> {
> 	struct intel_guc *guc = slpc_to_guc(slpc);
> 	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
> 
> 	return guc_action_slpc_query(guc, offset);
> }

Using this now, definitely simpler.

> 
> btw, there is little magic in H2G data, as only event enums were defined
> in slpc_fwif.h (or slpc_abi.h) but it looks that len and format of args
> depends on the actual event used

yes, it also expects the action and num_args in the same word.

> 
>> +
>> +static const char *slpc_state_stringify(enum slpc_global_state state)
>> +{
>> +	const char *str = NULL;
>> +
>> +	switch (state) {
>> +	case SLPC_GLOBAL_STATE_NOT_RUNNING:
>> +		str = "not running";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_INITIALIZING:
>> +		str = "initializing";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_RESETTING:
>> +		str = "resetting";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_RUNNING:
>> +		str = "running";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
>> +		str = "shutting down";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_ERROR:
>> +		str = "error";
>> +		break;
>> +	default:
>> +		str = "unknown";
>> +		break;
>> +	}
>> +
>> +	return str;
>> +}
>> +
>> +static const char *get_slpc_state(struct intel_guc_slpc *slpc)
> 
> lot of duplicated code with slpc_running()
> 
> maybe there should be:
> 	u32 slpc_get_state(slpc);
> 	bool slpc_is_running(slpc);
> 	const char *slpc_state_string(slpc);

Ok, makes sense.

> 
> 
>> +{
>> +	struct slpc_shared_data *data;
>> +	u32 slpc_global_state;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
>> +	data = slpc->vaddr;
>> +
>> +	slpc_global_state = data->global_state;
>> +
>> +	return slpc_state_stringify(slpc_global_state);
>> +}
>> +
>> +static int host2guc_slpc_reset(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
>> +	struct slpc_event_input data = {0};
>> +	int ret;
>> +
>> +	data.header.value = SLPC_EVENT(SLPC_EVENT_RESET, 2);
>> +	data.args[0] = shared_data_gtt_offset;
>> +	data.args[1] = 0;
>> +
>> +	/* TODO: Hardcoded 4 needs define */
>> +	ret = slpc_send(slpc, &data, 4);
>> +
>> +	if (!ret) {
>> +		/* TODO: How long to Wait until SLPC is running */
> 
> do we know state transitions ?
> maybe there is no point in waiting for RUNNING if it is in ERROR or
> SHUTTING_DOWN ?

It goes from "resetting" to "running" apparently, but the transitions 
are too quick to bother trapping. Apparently it should transition within 
1ms or so, so 5ms polling (at 10us interval) wait does not seem that bad.

> 
>> +		if (wait_for(slpc_running(slpc), 5)) {
> 
> magic 5
ok.

> 
>> +			DRM_ERROR("SLPC not enabled! State = %s\n",
> 
> use drm_err
ok.

> 
>> +				  get_slpc_state(slpc));
>> +			return -EIO;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   {
>>   	GEM_BUG_ON(slpc->vma);
>> @@ -56,6 +233,50 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>    */
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   {
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	struct slpc_shared_data *data;
>> +	int ret;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	memset(slpc->vaddr, 0, sizeof(struct slpc_shared_data));
>> +
>> +	data = slpc->vaddr;
>> +	data->shared_data_size = sizeof(struct slpc_shared_data);
>> +
>> +	/* Enable only GTPERF task, Disable others */
>> +	slpc_mem_task_control(data, SLPC_PARAM_TASK_ENABLED,
>> +				SLPC_PARAM_TASK_ENABLE_GTPERF,
>> +				SLPC_PARAM_TASK_DISABLE_GTPERF);
>> +
>> +	slpc_mem_task_control(data, SLPC_PARAM_TASK_DISABLED,
>> +				SLPC_PARAM_TASK_ENABLE_BALANCER,
>> +				SLPC_PARAM_TASK_DISABLE_BALANCER);
>> +
>> +	slpc_mem_task_control(data, SLPC_PARAM_TASK_DISABLED,
>> +				SLPC_PARAM_TASK_ENABLE_DCC,
>> +				SLPC_PARAM_TASK_DISABLE_DCC);
>> +
>> +	ret = host2guc_slpc_reset(slpc);
>> +	if (ret) {
>> +		drm_err(&i915->drm, "SLPC Reset event returned %d", ret);
> 
> you may want to print error as %pe

Not sure I understand why? I thought %pe was only for pointer errors?


> missing \n

> 
>> +		return -EIO;
>> +	}
>> +
>> +	DRM_INFO("SLPC state: %s\n", get_slpc_state(slpc));
> 
> use drm_info
> 
>> +
>> +	if (slpc_read_task_state(slpc))
>> +		drm_err(&i915->drm, "Unable to read task state data");
> 
> missing \n
> 
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
>> +
>> +	/* min and max frequency limits being used by SLPC */
>> +	drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz",
> 
> missing \n
> 
>> +			DIV_ROUND_CLOSEST(data->task_state_data.min_unslice_freq *
>> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER),
>> +			DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
>> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));
> 
> this info/code seems to be duplicated in patch 10/16
> maybe just call intel_guc_slpc_info() here once available ?

intel_guc_slpc_info() prints a lot of other info, just need to print the 
frequencies here.

> 
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index e2644a05f298..3e76d4d5f7bb 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2321,10 +2321,6 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>>   
>>   void intel_guc_submission_disable(struct intel_guc *guc)
>>   {
>> -	struct intel_gt *gt = guc_to_gt(guc);
>> -
>> -	GEM_BUG_ON(gt->awake); /* GT should be parked first */
> 
> if not mistake, can you explain why it was removed ?

This was part of a different commit. The BUG_ON in 
disable_guc_submission was added with an assumption that it will be 
called only during driver unload and not expected to hold any GT PM 
references. Since this needs to be called from an error scenario during 
slpc enable, remove the BUG_ON. Do we need this as a separate commit?

> 
>> -
>>   	/* Note: By the time we're here, GuC may have already been reset */
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index dca5f6d0641b..7b6c767d3eb0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -501,6 +501,14 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   	if (intel_uc_uses_guc_submission(uc))
>>   		intel_guc_submission_enable(guc);
>>   
>> +	if (intel_uc_uses_guc_slpc(uc)) {
>> +		ret = intel_guc_slpc_enable(&guc->slpc);
>> +		if (ret)
>> +			goto err_submission;
>> +		drm_info(&i915->drm, "GuC SLPC %s\n",
>> +			 enableddisabled(intel_uc_uses_guc_slpc(uc)));
> 
> move this drm_info after below GuC report and/or modify to have:

yup, incorrect merge. Moved.

Thanks,
Vinay.

> 
> "GuC firmware path.bin version 1.0 loaded:yes"
> "GuC submission:enabled"
> "GuC SLPC:enabled"
> "HuC firmware path.bin version 1.0 authenticated:yes"
> 
> Michal
> 
>> +	}
>> +
>>   	drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>>   		 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_GUC), guc->fw.path,
>>   		 guc->fw.major_ver_found, guc->fw.minor_ver_found,
>> @@ -521,6 +529,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   	/*
>>   	 * We've failed to load the firmware :(
>>   	 */
>> +err_submission:
>> +	intel_guc_submission_disable(guc);
>>   err_log_capture:
>>   	__uc_capture_load_err_log(uc);
>>   err_out:
>>

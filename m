Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2413D411B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39076E8B1;
	Fri, 23 Jul 2021 19:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7006E8B1;
 Fri, 23 Jul 2021 19:49:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="273049984"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="273049984"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 12:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="565599889"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 23 Jul 2021 12:49:09 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:49:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 12:49:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 12:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg2KRvUO2UWfsu8hKhm/0TFJucHtmHcYCztjLiWbg7o67pnZtGCu6LmCuwPE9NX10SrwFpRjIHhB/R89MEnS1ba3nqp6twc2jf9I2SZHih0VFnboJRB/oW2dHUCwhzBEJMjUfXapLKKRdwifWOblD/wElDO0QR3/sOCbD1z1dV9+fgWaPbRrl5lk+O6GIm4Jcm13DXpE83PqBtVHd/KX5DvJVk4n4LqVONQ1x4+U3/FXn+PgvvVlJNoDAh8pVcxqs44268THAL12kjEHt4QRrV6XqMTPdJMoaaEcBwr2lB/Leej0E1iWtF9L/IpedFYmyVS+oHur1Dc0yxpYABuWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AgrBcvmE9sTX1Z7qkH/34+vwpVq6OHsgFuOVoSJoKQ=;
 b=Rn+kjrJFd5r7grn2w7ZJ1l/EqU6J6QhgDX+M5lNxUuqw+VXVZJjfUj1uTxeeKJcssvppu/fy+jSvN3sauKYesjnym/sJQaPYrR6Xo2VD5689e9S7rO74oIDQmjTNxtc8pFV1wLJ5UDcpiuRNV+utrldvvoGfljnlbfVecuM7c9NLtSROKS7U+FmSd2/wSIXpwbDdAcSG+ihtfMeEhQY7psBNoVYAjluseMprvx411DbwlU2RA0tEf4r5xSSdAY4RwES2hoQxhJfYTWAxlyX5NPzNqw5lPaZ7ZXgccEoGvQVoZaPXq9Bmaw1O3kJ+UhExR2HLjyPU014ff6Msn+RGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AgrBcvmE9sTX1Z7qkH/34+vwpVq6OHsgFuOVoSJoKQ=;
 b=KDXaafpTtEsHJ/Sr8EpmG4IUNK/D4EFfMsLJxdu+di382+xZpfsZPk3YajIDNWTib6HTynLCEWspCZ2x0uTrhx21Ljzje4yy4wzHViNW0FBsEiyJ+pwyiaJSquN+U4JfccF/UXUtjM+rJid3wnczRO/ctcOk65T8lL7sUOLilkQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5650.namprd11.prod.outlook.com (2603:10b6:5:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 19:49:06 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:49:06 +0000
Subject: Re: [PATCH 09/14] drm/i915/guc/slpc: Add debugfs for SLPC info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-10-vinay.belgaumkar@intel.com>
 <91447d98-cf2d-cf60-e1c8-1bb13b4ae12d@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <dd58cb25-e526-4658-8bea-9df1ff0efdd3@intel.com>
Date: Fri, 23 Jul 2021 12:49:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <91447d98-cf2d-cf60-e1c8-1bb13b4ae12d@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR03CA0273.namprd03.prod.outlook.com (2603:10b6:a03:39e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Fri, 23 Jul 2021 19:49:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ad02dda-68e0-4a2c-394b-08d94e12ee69
X-MS-TrafficTypeDiagnostic: CO6PR11MB5650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB565019BE0010AF58FF587F6E85E59@CO6PR11MB5650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfWOPe06ky0SDG+YG77o0s08XB2JO5fazwKdMD3dQN9oNiCXAa2/VpWOtFmxJL8HaIi7Pu+zXiwPWvCoS9rjwAhai80CrAojEQqDSenmlsDEpBRQtPsmCHRgewYD4nFgQY84TTTfaj2xqOEfZt7IdGc8piOYCp99eL9JtHNRugU5zSosx+GZDfzGTl7qbdkkL4hQ/gULJrNCtSmlDiZa0MwBm2UieD71KajnzwnkEQeuzjJwo/Vee30uyNOdcHJ7ZsLDHygn6T+p4zmCkgDgSbuYgWLBRBJ0zMkBsTC2x+7MckHXZ1GapfPDuXLb5982BPGwaPEaiKlz5A8m8qlghD53ui7WjrBTrxsH+p1PHW4l8aMXgPVh4zUiTEp8C5QQF14igT8oJpJ6eg0F/m72Kn7BOMp5UqKxTwhg9wassfmLkkqe4Rn11E9bNf9newYhs01pUmonEqyf1VeYK3wA4iXdSbQbORUqVsLifFm/Ebg2v4JeUuILTSwiJi/wpg33U1sWV3wYbjmEQpz6ww6+GU2t8y6+xYpHAznrUqI79rpRyUcMgNwx6dv6YR6nMzd+E/UXW1ITKlEZIhk1JjWY7oeCVqAdlOhv2X0hp/FpInP79neCcgyh1YXPvrGAdK91besqwacLIcPZEX3NCckAx/SvSdKbua4LMCBHyh5MopTcHQ45LsrqctB/9iC8h99Ny4sirMDknFbO85ATladlvbgssK5/CXO+PZmiQqxnGJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(86362001)(478600001)(5660300002)(26005)(8676002)(956004)(2616005)(8936002)(186003)(107886003)(83380400001)(4326008)(6486002)(450100002)(38100700002)(36756003)(31696002)(316002)(53546011)(2906002)(66946007)(16576012)(66556008)(31686004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWYydnZsc0tNYUlzaDBCQm81VEIwMTFXdWp4bWlHbm9TUGdqcFBCZmZWQzdX?=
 =?utf-8?B?QVFKZDlzZE9XV1NpL0JoTFJSNVQwS2kwVnhUWjQyOXEvdmI4bEdNN0hId3gr?=
 =?utf-8?B?T0hSSlpONThaclBHVG0vSys4WElTSGVTK1FsdmZwV1dCWFpYY0JHdmE2T0tx?=
 =?utf-8?B?OVdtWmkySmhGdG1pVHlheWNKelRyY1pRZTVhUVBMVG9qTTgxdEMyeitETXN6?=
 =?utf-8?B?ZWdZNVUwNFpUNnVqQUhNcWdsbnprVUZrVGplWVFhcmpnNnRXcWFPejVsdUtR?=
 =?utf-8?B?SlRYVk9DRWV4YmIvY2duOURkZC8yZGRJemZzandMc0F2SEhEQ3NpaW4rSC9u?=
 =?utf-8?B?WU1wN2x6RDFmOGk0WkZzc0liaFhZUk4wdVNHSDBlQTY4cVJ0WkFNRU5EZTUz?=
 =?utf-8?B?MEQyOHphUmRXWURLa2dTR0NsVUNZUWU5NGh3Vk9hMlhha284OElteS9rQ3J0?=
 =?utf-8?B?dGk0d3lNbzQ1ejFiZGRFendYMkJZT0JBODB5dE55VTJYeCtlMkJpclhxdExp?=
 =?utf-8?B?THJaYkgyZXk0bElGdnZEanZ4dmRnUXRUZDQwbXNLQjJqQnoySlYxMC9xKy8y?=
 =?utf-8?B?MVVuZmRWOHRuUXVQSnFIbkxHSko0eG5xbndKanZGbmhncEpydnlhSFh2Zkxy?=
 =?utf-8?B?K3FaMDFFSVlDeGl2b2tLMDYvZTlFdHEraGtwU0grbDU1MFlLMEhmNDZ2cEg4?=
 =?utf-8?B?bUpYeXFYYTdPc2c0OU0rM1VRUmNnaEpGWlcvSUtxcWFrT1JWZlFSN0xDclVE?=
 =?utf-8?B?cWM4aUplUlpxcmZwckg4WkwzN3E4Zy83YWtVYWpGbERkMFZKb3daNFBYdHZN?=
 =?utf-8?B?WG02NkdBV1hTMHRCK0Y2QzRhaEFlQXpGYklJSDBXcTlvaTBzWjFlU1ZQWlkv?=
 =?utf-8?B?U0pyQTJjMXUxY2lIbjBPNnZ4T2lFeFhqT1VDMHRDNGsranUxRzhBdjVFYzgz?=
 =?utf-8?B?K2d5cmMrS2IwZUR6TUFBUkZPSWdHd2RRSDg3L1RTeS8xY2NaUk11WVRPWis2?=
 =?utf-8?B?aytOVklkaFR1d3NQSXdSR013Q0YvRU1yYks1VDVGdk5qTEg3Y2tUQUVNb0ha?=
 =?utf-8?B?S0JyMTBpWGU1UGtsbUI4L0R4VWVML0JRcjNGdXh5YStFTWRYdklmeVpKMU9l?=
 =?utf-8?B?OXFvdit6M1FJOUFCSDZlSy9MVEg2clJWV0hyNEFNcXp5UFRlWHIwWlVmLzZk?=
 =?utf-8?B?L01Mc1h3c2xIUkRnUHE3ZGMyN2ZONzhEdGhBTFY3Qmcvb0E2YVM3bHBucmdL?=
 =?utf-8?B?S29oaHRKRTVSTytPaVZmVU55VEVGeWxzN0hLU2FwWnJzU29ERjQyVElGZDhC?=
 =?utf-8?B?ZlRZOVdsQ1JhS2FwUGFFN3pwTGdPTVJ3R0JzNGNVcWNzVjlVSlMvOTlraHE5?=
 =?utf-8?B?aWQvSHFkSUFOeTVOVHE2OWNDTXVXSTJZd0FEbldydzlxMit6ODhUazF3dXN5?=
 =?utf-8?B?QzdEajE1LzBEcTNKakRsMXNnSndDUGJIakR3ZWRaUThpcVQ5Wis5VnpXT00w?=
 =?utf-8?B?NVlmVHVDRmg2VVV3MzlpbEZJUEowUlU4T0Q4cjFiYjdLMlVReHAraWJEZzcx?=
 =?utf-8?B?Qk94cHBzMXQxeWVWNGdiSEdHZEpkL0swbHdiTjJ4eFZMeTdpU2JxajVOYld3?=
 =?utf-8?B?QzRTRHNOTjJkd2VxMkxCc1FYMkhZdGFXNE8vd3ZWcWhNd01VL2N1Qllhc2dR?=
 =?utf-8?B?amFkUy9jVjdsdUF4Ris3Y3dTcUFkdG9XZnJFZmhrcjRNVTBFZDFmUXIyZ1ow?=
 =?utf-8?Q?N2lzRwkqwbySR6weIg22UjPHkEeC5pnrw5jQ2NI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad02dda-68e0-4a2c-394b-08d94e12ee69
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:49:06.6583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7R7+isBTBjYykmjwoJLOkKwbIfyPcdfzdhr2tK1iAWNd3GZqIb4hKV12SBpXIsMcslVbZaQGpZ5t0lOWRtxOzwCETVzcnW72B4W6e3rCwnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5650
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/21/2021 11:05 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> This prints out relevant SLPC info from the SLPC shared structure.
>>
>> We will send a h2g message which forces SLPC to update the
>> shared data structure with latest information before reading it.
>>
>> v2: Address review comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 23 +++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 40 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  4 +-
>>   3 files changed, 66 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
>> index 72ddfff42f7d..46b22187927b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
>> @@ -12,6 +12,7 @@
>>   #include "gt/uc/intel_guc_ct.h"
>>   #include "gt/uc/intel_guc_ads.h"
>>   #include "gt/uc/intel_guc_submission.h"
>> +#include "gt/uc/intel_guc_slpc.h"
>>   
>>   static int guc_info_show(struct seq_file *m, void *data)
>>   {
>> @@ -50,11 +51,33 @@ static int guc_registered_contexts_show(struct seq_file *m, void *data)
>>   }
>>   DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
>>   
>> +static int guc_slpc_info_show(struct seq_file *m, void *unused)
>> +{
>> +	struct intel_guc *guc = m->private;
>> +	struct intel_guc_slpc *slpc = &guc->slpc;
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	if (!intel_guc_slpc_is_used(guc))
>> +		return -ENODEV;
>> +
>> +	return intel_guc_slpc_info(slpc, &p);
>> +}
>> +DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
>> +
>> +bool intel_eval_slpc_support(void *data)
>> +{
>> +	struct intel_guc *guc;
>> +
>> +	guc = (struct intel_guc *)data;
> 
> 	struct intel_guc *guc = (struct intel_guc *)data;
> 
>> +	return intel_guc_slpc_is_used(guc);
>> +}
>> +
>>   void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
>>   {
>>   	static const struct debugfs_gt_file files[] = {
>>   		{ "guc_info", &guc_info_fops, NULL },
>>   		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
>> +		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
>>   	};
>>   
>>   	if (!intel_guc_is_supported(guc))
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index c1cf8d46e360..73379985c105 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -430,6 +430,46 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	return 0;
>>   }
>>   
>> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
>> +{
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
>> +	struct slpc_shared_data *data;
>> +	struct slpc_task_state_data *slpc_tasks;
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		if (slpc_query_task_state(slpc))
>> +			return -EIO;
> 
> not sure if you can return directly from "with_rpm"

Good point, checking err instead.

> 
>> +
>> +		slpc_tasks = &data->task_state_data;
>> +
>> +		drm_printf(p, "SLPC state: %s\n", slpc_state_string(slpc));
>> +		drm_printf(p, "\tgtperf task active: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_GTPERF_TASK_ACTIVE));
>> +		drm_printf(p, "\tdcc task active: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_DCC_TASK_ACTIVE));
>> +		drm_printf(p, "\tin dcc: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_IN_DCC));
>> +		drm_printf(p, "\tfreq switch active: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_FREQ_SWITCH_ACTIVE));
>> +		drm_printf(p, "\tibc enabled: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_IBC_ENABLED));
>> +		drm_printf(p, "\tibc active: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_IBC_ACTIVE));
>> +		drm_printf(p, "\tpg1 enabled: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_PG1_ENABLED));
>> +		drm_printf(p, "\tpg1 active: %s\n",
>> +			yesno(slpc_tasks->status & SLPC_PG1_ACTIVE));
>> +		drm_printf(p, "\tmax freq: %dMHz\n",
>> +				slpc_decode_max_freq(slpc));
>> +		drm_printf(p, "\tmin freq: %dMHz\n",
>> +				slpc_decode_min_freq(slpc));
> 
> not sure what they are:
> 
> DCC ?
> IBC ?
> PG1 ?

Removed these for now, since we don't use/enable them yet anyways.

> 
> and make sure to use %u for unsigned

Ok.
Thanks,
Vinay.

> 
> Michal
> 
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>   {
>>   	if (!slpc->vma)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 627c71a95777..852c6316aa47 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -10,6 +10,8 @@
>>   #include "intel_guc_slpc_types.h"
>>   #include "abi/guc_actions_slpc_abi.h"
>>   
>> +struct drm_printer;
>> +
>>   static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>>   {
>>   	return guc->slpc_supported;
>> @@ -26,7 +28,6 @@ static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
>>   }
>>   
>>   void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>> -
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> @@ -34,5 +35,6 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
>>   
>>   #endif
>>

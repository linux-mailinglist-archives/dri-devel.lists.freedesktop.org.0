Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86C6E555C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 01:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD1610E649;
	Mon, 17 Apr 2023 23:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B18410E64C;
 Mon, 17 Apr 2023 23:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681775026; x=1713311026;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g4IfG4RzuwHa+p0/L0imsPhzuvAR4+fBUTAvagu08/k=;
 b=YPeihBusX6iWdSHz4xm0Fa4bUqBhNVSRoI/7ooKXp8wcME2+A99KDLmf
 jlKCy2zaufQPfU/N997VeZyyq5tgG/+40GD2QMueR4DQPDGae+jwJR3CV
 UwIIyLlMK9FWuD/Eiij9kljK99XSMgkwWk5NNL4ZdKRZM4oSliDV7aKSG
 5+6863GgE2mdsOfDRy1eDT28oA8EGZhllSsfgIrSgcpNdBN360txVQBtW
 L2mHu3/ACRr6IHJ8Qgm2WnEKc68YUXIotHXKV2LnJa/muu0op3m9D9NFx
 z4JVjsFgeaYL/txReEFaTc4AjSPqtJRIJRNRMj/nHFeM2P4577+KDiKzn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="329207566"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="329207566"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 16:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="814991643"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="814991643"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 17 Apr 2023 16:43:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 16:43:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 16:43:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 16:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+oYQHqmHthTSUHBLiRaPdoYmIgZCgn5lz/qs1OTt5Bl1191fjivk9Am637MX8gZVasZG4JiLDbLMl8YS6n46CX6tnGDoxmCahz2C524wSygmuUabi7p6tHDV2MS1h20QI3T7zHaqMAgmO3xrMjLidk4iEZkv+KtL6K1VvIZtQCa1B4VWfmgubL79piuop4OSME454miPe/7yE9+azQqUpwKYhSwmlGgb5pWN/EGySlhYb9ykSCE6NyU94AL2fvTx3kdtwaImULGCwf/omhw3hmiHthiH77VOWVoaaFLen/cOc65Ag+dVFAxblDkCK+vuoso9Cf3ksqv8Bn4RhC2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnzu/pInOUoTI0KRZH37NWML/prBCZzCYwyV9D7eCEU=;
 b=od9ezJ0isLTcMmfPFH1zfmVFFeiWQHCftRX4OmzntLRB65xOZENYN7rWmCp0gDW7buVULNaqGOZSCQwpvlEw6mR4fqiAsjH3JGHq9GE1CMQfJGXHiBGMzFA3WcbMi0epx0xlL4pITO8PJ3I/DVK0aqCXf/biBAXwWnVJ4h7fdNsAyPpwuC4RA96heTGLTO1BOH8yJxUnwJP2nDRtoBTQu4kx20MDG3ekDkbVLLkVrxBjiLP4UOqDuveyrLYvbcE1Dis53nB4P4B6XnTSUEYbO6LQtmDR7t9xfzB4ZHBOMOHBoaaeeqe+kiOHugDSHgFYyyzLpA38uTks1z9Z33eZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 23:43:41 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2988:48c2:4dd7:decd]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2988:48c2:4dd7:decd%7]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 23:43:40 +0000
Message-ID: <d9d8e6e0-331b-785a-a573-eb02dd3881ac@intel.com>
Date: Mon, 17 Apr 2023 16:43:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/guc/slpc: Provide sysfs for
 efficient freq
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230414223415.3077055-1-vinay.belgaumkar@intel.com>
 <875y9yxbvr.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <875y9yxbvr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f0fdf9-0701-4de9-2a67-08db3f9d9200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GH73vzZb29MDtSXcK4x0po20147krAtaG4I4GMyUizjaAv5FNJjntzKPvBaBLpxSAIL3xQ2+FIqWoAYdR49przB3dmHE+yLfM+tgdCLbR6MOiOOa77I2LP9cYPhrDUvazdqgK0e8YthMlsKIiYQvwoklWp4Gfzy4KjfA4tPCZVm4jMN8oX09m/weVilKq0XW2t3Me26O1WWmqFg4pHx0gPJ/p0tIM4M4sDt3TVIZqChToypNqbe0qJjL7La/7VTXMlygVYwjFAbDp+8DudJk4NiZ9DZRg0/l94N+xfwdZgbSKOABuATpJq5t5+a00pMYQpaL8Hti7LxasrtD2qssDCiM61j8y9gLwaj8F0LHlfk2ytEVBIa8tp8hIciWyzeyz+qSCg31iFbDx5BsM7bQw5P8TbdknRzF8FJTpFd5jqym2x/12EekD7FviY54JIm6oYQ+9Lx5p0VtkfxA8qJi/gGkEOZyjyzYWKkXfiUA+IWCoR1IUAzeRPGhZBU4vDhOlQXi2oiQVeP3xMb2Cp0BJ0+JLxbjHsmQUsFreRsTlKoefhIRPKysbLUCSNOGEzhIKT/QSOGCu7n1ctVVTzNe9SJ4cSlF5xjxuO0mmwNG5YcCGrE/XnqDuafa2K57Wu4S69ejxeK3Knam8XH2oChmeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(31686004)(53546011)(26005)(6506007)(6512007)(6636002)(186003)(83380400001)(2616005)(6486002)(5660300002)(37006003)(478600001)(38100700002)(41300700001)(6862004)(6666004)(316002)(8676002)(82960400001)(8936002)(86362001)(31696002)(450100002)(66946007)(4326008)(36756003)(66556008)(2906002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFEzZlhsdHR1bnNOUzRnWlZ5OXo2NGx0VklBSWV6UXlmS01yUW1PTXN0U0Zu?=
 =?utf-8?B?UjlkeTFDOUF3UXUrZ2ozcm8zcGRxSWIvRjRMSHYxNEpjL0x1cmpBNVNicEhv?=
 =?utf-8?B?L3p5MUtwVVh3Z2ppVXVweHdnQmtrZTQ3VGphOXdYSXRnbVZ3MVhYNkhDY1ZE?=
 =?utf-8?B?NFpJZ1NGVkFpVzJjajhXQlNNT3ZLQTVGd3I1TEcvWS9KNXhYc0Y0d2MxL3FC?=
 =?utf-8?B?ZXFEV29Celh6aXZUWU8yanVnQXdlbzJCN0Jpc01wV2FJT2RBQ2ZWMG9yNzFt?=
 =?utf-8?B?NXZMZWJJc1lCZnFvSVFoQjd2RHI0TFJhS3F1M3Jxck4zVzFMd0F0YnM2OTZU?=
 =?utf-8?B?UGdqS3hvQ1pQK3hDOW93TG9td3NuR1FjNmtRRjFxWUVwZzdrZ0d2dy9ka2Iz?=
 =?utf-8?B?MGhIMmMwS2l0Zkw5am9vNHFuTFIxZytGYVZhUEpVZFNBS1p1bGNReXpmdzUv?=
 =?utf-8?B?RC8yd0gwbytoVjR2RTFjSExiTFhZWHdXMnJpVitwLzBQeTYvNklucldnVDBV?=
 =?utf-8?B?MEQyNlVzY0R6d2JMR0NZaXNteUdWUUVSN2JLUFAxbjNibmFmcHV3OEJESXY0?=
 =?utf-8?B?WW1ZbDJMaUZsK2lQdWc3bUgvK2FWc0YzMStEYUl2UW9GL2h4SGd6L2JGVWRj?=
 =?utf-8?B?VzNaYTdLVWNCVGJyL2tBL3JUWVBBSlM4NUwzd3F0Y3BqakcwR3lCRlYzb09D?=
 =?utf-8?B?Wk8zK3BCS1gxRGw5WlhkUWVmWVgvaTczSVI2WVF1WjNGeE0xZkJHdWZ5cThX?=
 =?utf-8?B?b3dDSGQyNFpaSjVnMVVKSzR4Vk4rc1dsNUh0SjliWW5MMDBHS3pYWnRHdUNw?=
 =?utf-8?B?UmFqazFWVDlSR1cxZEtXMmlRVmcweEt3enRmTTJkRXI5ZTlGRnBFbExvbm83?=
 =?utf-8?B?TzREOWhrM1BHVEY5eTYyeHZtWUVVZ0pFcElnd1NjaXhkZU9tSG9jcGxaSWZp?=
 =?utf-8?B?TmNWa2JNYzI4NlNOL0xMV1YxMUoweWFxT3FFUUxWMFk5UUMwVG9pRDV1TVY1?=
 =?utf-8?B?WHNOWEU0OTdVeFNrU1NHdnVBS1A3Yit5UXNpWGFYMWc4ZFh6QlM5M0d5Z3Rm?=
 =?utf-8?B?N0VHR0lhSSszN3I4anlYQmNMK1d2bi9NZW1iQlJMcndNdDBJVHB6VzN5dmMx?=
 =?utf-8?B?aUlWbldxRFVHR0RaRFR0MnRpaWxjZkZXaU9iNE9xbXk5ZFB4cTRJd3BFcVZL?=
 =?utf-8?B?QUtzOEhRL3lvajJmYXNwdzVhb0FwOUxzdUplb0lDSE9ua0owQjM1aHNlTWds?=
 =?utf-8?B?aEdIK0ZucURLc1d4ZkZqTjIzT1hxbEZSV2NRUzZ6Y2xNUVBwb01GdFNsdWZo?=
 =?utf-8?B?OE9qdEx2R25UbjdTN3QyY1pEc2JUSzlpMW5ZM25VelNwODF4SEwxd1JkUmRX?=
 =?utf-8?B?RjV3MEdWUDdqb2kzUi9pNE1NMWIwbFlRUG4yQnZnR2pvZGFJa00yRTJmaHor?=
 =?utf-8?B?TVJXeGp3aTRxQVlRaDViWnpuazVjT0ZRSG1rK3ZxVFJ2NkdLbkJQNERTTlpX?=
 =?utf-8?B?UUlGNzMrK05kTmZzZ3kxdi9iWnRCUEU4Q3lpSGIrYXRmTmZEeXl1MFk2NUxK?=
 =?utf-8?B?ZXhlUm5Sc2JJSGdsOWZ3RDNSTnlKd2Ztb250dVN5cXU1QW41UFVTL0RhcFNh?=
 =?utf-8?B?YTBpNXhWQTVCTFBTY01YSDQ4d2s2endFdnp3VmpvOVQxcFFwNExwdmJzb3BK?=
 =?utf-8?B?eWFHNFFYREdFV2RKM1creVZmWXRQMHI1eGU3bjQ3ck9lakxkQU1jamdQRm1H?=
 =?utf-8?B?d0dkQmJiRUhidmp5UGRITm0xY2xQS2t3WVU0RWJPUlc0OVJjdks5SmRvdlNW?=
 =?utf-8?B?NzB0cGZNbVEwOEpQM0hwbjY2dSs2TVpjSW9aTGZUZ0M1R3pzc251L0FKY25R?=
 =?utf-8?B?TE9FejI1OXVkbFJVcWNHZWRaMnpCY1MrUys2UkVjTzZJZWJQWkNnc1hGdE9K?=
 =?utf-8?B?VTZzTUltYnRzV3prUkdSUUMyNjhXWVE5cmZrZ0x4bHBjOGUzWnp5TkZFZDV1?=
 =?utf-8?B?VXRqMVptZGlnSHFCS3NvY1JNamUvdEtmZFZreHhKNlFqYlJYdFRFcWpuNU1N?=
 =?utf-8?B?dVlMa2M5blNtQXVpdGRDNmVQWEFUTWp3UXJMaEV6L3U3MHFlWjNqeTY2b3J2?=
 =?utf-8?B?NnZyQzM5TWxBRURQQmp4c3JxYVNqK29JZ3llV3VkeXpneVFuWjFtVmtWc2FX?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f0fdf9-0701-4de9-2a67-08db3f9d9200
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 23:43:40.0499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOzLkQt3BbmtN2my+Y870VYqszHTcDp/tdNiLYvX7xHBDPVt6AXXPH+txWTaD0mqK4/x1Pc7ati4m85KRjCMndI0eTBRika8Z26+rIlePTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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


On 4/14/2023 4:49 PM, Dixit, Ashutosh wrote:
> On Fri, 14 Apr 2023 15:34:15 -0700, Vinay Belgaumkar wrote:
>> @@ -457,6 +458,34 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>> 	return ret;
>>   }
>>
>> +int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
>> +
>> +	/* Need a lock now since waitboost can be modifying min as well */
> Delete comment.
ok.
>> +	mutex_lock(&slpc->lock);
> Actually, don't need the lock itself now so delete the lock.
>
> Or, maybe the lock prevents the race if userspace writes to the sysfs when
> GuC reset is going on so let's retain the lock. But the comment is wrong.
yup, ok.
>
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>> +
>> +	/* Ignore efficient freq if lower min freq is requested */
> Delete comment, it's wrong.
ok.
>
>> +	ret = slpc_set_param(slpc,
>> +			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> +			     val);
>> +	if (ret) {
>> +		guc_probe_error(slpc_to_guc(slpc), "Failed to set efficient freq(%d): %pe\n",
>> +				val, ERR_PTR(ret));
>> +		goto out;
>> +	}
>> +
>> +	slpc->ignore_eff_freq = val;
>> +
> This extra line can also be deleted.
ok.
>
>> +out:
>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>> +	mutex_unlock(&slpc->lock);
>> +	return ret;
>> +}
>> +
>>   /**
>>    * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -482,16 +511,6 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>> 	mutex_lock(&slpc->lock);
>> 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>>
>> -	/* Ignore efficient freq if lower min freq is requested */
>> -	ret = slpc_set_param(slpc,
>> -			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			     val < slpc->rp1_freq);
>> -	if (ret) {
>> -		guc_probe_error(slpc_to_guc(slpc), "Failed to toggle efficient freq: %pe\n",
>> -				ERR_PTR(ret));
>> -		goto out;
>> -	}
>> -
> Great, thanks!
>
> After taking care of the above, and seems there are also a couple of
> checkpatch errors, this is:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,

Vinay.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3485C3D0443
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 00:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1018990D;
	Tue, 20 Jul 2021 22:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413D888894;
 Tue, 20 Jul 2021 22:08:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190919966"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="190919966"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 15:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="454241062"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 20 Jul 2021 15:08:36 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 15:08:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 15:08:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 15:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQiOiZE2afVzKKADCVg7gC8srfVU9dPvqRlUnXKlB3DRGQLO33modsUpD2ThFAxnCrtk8xpzZdCaU774cLlTpCHdL+9p09NHKFhenTMitA5aWDdbL+G+4B+T6mIC8qEMPSugl3KJfRS7elFEoZjef14I80PVrkgRy2WNg8PW3Hd4O7qGe1YCoVVDXrjwePc7EqYkjMvRUEOINZMpM0UoklSZjBzDr9LAwnFuruc0zeSmifglEKN52HwLsFlgXJhXaU+uX1QIWmI0eo4LY6g4r3bjorEMvDdtR4wl8KlhMQPbbadf85CEirSDfTdjPr99dHYtD+YtBjfsWFnDDAYeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjagaXHVzB1HHT8omQCz7gq9u2FV1Fh4fSDfyy0VxDY=;
 b=QGu3q9BDwvXxVN2OZPf0YddB2E3B5E1PiWwvYaclVMphuNM+ov9iw3OZB6c2A58GiFs8oGHi5WR3gqcSHskyh1ZM+506YJL0xRFuzvDtEPPvSzwsFnvRFWACn6AVkw5f+0V30a+FU6/eIgKgogpM9UOxm+QM+m4JAhuDUNux0+MzMrwCxf79UEq2xqVQamIllzbX0pVI15tq9ps2lbqnsVIocTNkEbDANP4Dw3cuY9kMdf8A2tchBtVJnvIefNCLqoU2hJzmfDs2LsaHg0RxN8Q7qFB1y8myqK16PxNwy9/5LNW+5OIWJh0S2EFSZSyB8/Lka4rj4W/OHPgC1NfDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjagaXHVzB1HHT8omQCz7gq9u2FV1Fh4fSDfyy0VxDY=;
 b=zF2NXGkIRr7TWJr3knUKnEBbLxEYPWj9wPQgk5Uu58lw8spDktR6C3D9R4+9ri2+ANx56glSMOo/Bro6e/LWYdjuWBce43v57R38DJXrVgOucEXn22lghX8sGwzN8sJveQMQipKAeAl1h1F61Cf1cngDkmIW/DUWCkagRTINRLQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 22:08:35 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 22:08:35 +0000
Subject: Re: [PATCH 09/16] drm/i915/guc/slpc: Add get max/min freq hooks
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-10-vinay.belgaumkar@intel.com>
 <ac11aea5-b4ea-a3bd-9a72-94bb8cef4057@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <241107ff-4606-91a7-0ae4-2887fb71793b@intel.com>
Date: Tue, 20 Jul 2021 15:08:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <ac11aea5-b4ea-a3bd-9a72-94bb8cef4057@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:303:2a::31) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MW3PR06CA0026.namprd06.prod.outlook.com (2603:10b6:303:2a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 22:08:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318bfe87-8159-4d9c-25b1-08d94bcaeb09
X-MS-TrafficTypeDiagnostic: CO6PR11MB5569:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5569687120F0DF2541EF9FCC85E29@CO6PR11MB5569.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+bSeHXxmScDhWQ+/51skbMNvEpAyugXVaLSHJ0M+HKfkK8UNbzAneDEZkjz02hGlpEHP9WC2oaDyKxAThMeRlgVQ4OXS1J9hbz1h+RNm4Oh6QWlYG/HQK0wcAFsuOpr0O7Edi0DUdCFIRwAkZjAsT/lbHHhCpzFpC1hxdk0fxcxR4s6ng9ktGTLp97NujYO/jtqGacmxrLBoRnwd0Ftew5FPpR4ET2iCGa9UDOy3DxUmqi1GHkyv8Rs5dyiOFc7Tlb4p8OuiXbuqQrzf0PCge0OvI2daGOsRTVsC99dY4o+2VzW2UL20EqmQ17Fe9rIlIIyAB9Ijqq0LBziSN2rfqHDwU4nHVPN7KhNTIvn165Wg/jKf00xAXbIKiYFPHvVr5q4H8POx8EOXS8s3ytL6uQSmIdJygoy5hJKeyZOS+PNu7aOw4J9zJZY2Yc+DDdA2qfzycsNnYrLptdOwppf692ZvHSQpGKCE+EqHyUwvLaZXNQS8wXR9mNCpCm/qDdAdBZDQVPvdzEx3OsF6pqwd6y+ycdD5H854nbqNeqp4uGXfbM7rMvhpvJWRp0IeXQqwFVexB/BPhPhCN7i0CHSEThSVxCE9AnlYz4zmuq9xLuQ0gtgW7SiIzb5GMqKgALJG1r1DX0TMEqGwpe00ZVMVGz/MSU6EggpYK0p/mfDCAOBHuN45+ICrKj5jPvLFIU5CSX5XfB3d57l66nFXN8E834yBWdMFdo+A/5Pp4A9S5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(8936002)(450100002)(186003)(478600001)(5660300002)(6486002)(107886003)(2906002)(4326008)(31686004)(31696002)(36756003)(8676002)(2616005)(86362001)(16576012)(316002)(66946007)(38100700002)(26005)(53546011)(956004)(66556008)(66476007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anlFZUg3UkdCUVZoMDVqQWxFOVFnR0JsWHNnVEJaVk43VzA5VUc4Mk8rbTN4?=
 =?utf-8?B?bjE0a1Z3eWdZaXZBZWx2N05pbm9Nb0RBNjBkYkRKVFFiREljZDJNY2o4S0NL?=
 =?utf-8?B?blV1MUlMVlVvanRFWUgyd3VVbmhRM2t6ajUwVG1EUy9ZTUtvNmhPcmxnSlF5?=
 =?utf-8?B?Q1U2YUdiS1dld3ZBMDcra296VjBHSzFBMk1xVnlITFpIZXlRTnA5TnJkU1k0?=
 =?utf-8?B?ejFqQnAxVjJsQ015T2ZaTEF2Y3A3cE9OZjZDckR6c0FBWTNvQlA1Z1ZMS3ZC?=
 =?utf-8?B?cDRxZEJjcHJGcWdJMDl4M0VYK3hYNFdCdVp1OFBrL1poNTNSY3h2d0pvNWlC?=
 =?utf-8?B?R29YKzNLcmVQUXhvUktEeFVpRzVBc0twQlhzSzhjamJrUzRpdVVrMUpVbDAr?=
 =?utf-8?B?OVdaVThFdlNkNG1KaXNwejBVTXpNS09oNHdtVVp1RTcwbUlpL2NCNUlmSjJx?=
 =?utf-8?B?NDRNQjAxV3F2Ti9DT3hRYnFVZFJwQ3ZGc25kc0tpdTlJMmk3U2x5VWtUYjk5?=
 =?utf-8?B?bjJuU1ppbXdZWTM4SFZiSHY0NjZsRTNYa3dEWmRiZWJKd2ZBNnZwSXh0R00v?=
 =?utf-8?B?c28yQ1dXRGppU1c0amh4RXFCME9UZnFGMWtSV0R0dUlud2doUHI1Y2hGaE03?=
 =?utf-8?B?aGJaMTNMbDE2eU9rNDE2eFo3dUhIVXhzZEVNRnlaTkdJSUVCRnBzNXgvRStS?=
 =?utf-8?B?dmJra2JRdHNqNWhmaUZ4ZTUxWTlMK3lmSk5EMHJ1R3BwZkRsQVR6dHErZkQy?=
 =?utf-8?B?dHdPa3lpV1JPQ21qTlZ4OXNFdFExOXd5SS9BQjNuU1VsMkdNTkZRZDhib2ti?=
 =?utf-8?B?cXg1UHExb29MYU1ic09aL2cya2JzVTBVUitnbHZZUUlNd2NWR3Z0eVlBdEU2?=
 =?utf-8?B?OTRWL2ZCcjdqMmhKRFdnWUx2M2dab21obnkvT2VJTEd1T1hQTEZaS1lpQUJB?=
 =?utf-8?B?UDZzYjFkWE9jL2k1QXU3Ujlyc1hpY00xZE9kK2RWMUFaREtPM1RLRWtoNEwy?=
 =?utf-8?B?VHhIL2Z0WFBTWUFhSmk4UDJUSEZMSWVKc2dTRUREOHF3ZEhxSWlTSW00OVZQ?=
 =?utf-8?B?T1RudTBqWXZwWnhpd3dvVmcxY0RjeDNQaTJaVmVJZ0kxbFVUYlBmVGpuS2px?=
 =?utf-8?B?S3pyZlRRa1hwVVUxcDVKeU01eHdmdzRFZXJDQ2VPUmlsYWtXZXJHNXpKVUNh?=
 =?utf-8?B?WFJORDNMREluVmlTTzRZWlVjWDZsWk5Bc0NXaGZ3K0pHOWxvbFgxaHp6dmdw?=
 =?utf-8?B?RUtmck9veEJtMDZwWXU2ZEtPMnNTeURhbXZEa1NVQThPdmJtNDhPNjhveEtW?=
 =?utf-8?B?bkVLQWZIL3lqRGxxRVA1d2l3akVjdFZJb2paQmdGTzFWM2lGMW5yVXc0aVVU?=
 =?utf-8?B?MUZTK1g2SjJzS2s4SmlZcVRFMzlFeU5HZWRvY2dpOWZKeUhoWGJkUS9NU2NR?=
 =?utf-8?B?aDI2MHRjcEdMOFpHVDR1ODNYRHNMaUw1Wlh4ZWlMeDhIRzZqekF3dVhtd3M2?=
 =?utf-8?B?cmZwZEdaYWtnSGc5TXNLeDl4ejJmWlpzRHFESFZnLzdDaHRIdXJaSlpiWmZl?=
 =?utf-8?B?YzdtWEtTV1JuR2h4WjVJUm9lSXJwclNPdE03b2IwbWswT2hFMVlzZ2U3ZWpL?=
 =?utf-8?B?WnRON01LRzcvdnFHR0k3QUx4UWV2Z29yTncwbDhkT0hlYmROV2EwdkdjTnpW?=
 =?utf-8?B?VXQ1VnVnd1EzUHQ5OEt2WDRhcjI1R0NiWVozT2I4VzFFS2JheWN1SHpvcXI2?=
 =?utf-8?Q?PzgXdcqudY7Ms6J1b+QX+Gdm72nKVPvdAig6Ds5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 318bfe87-8159-4d9c-25b1-08d94bcaeb09
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 22:08:34.9443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeYZ/CKte+x/Acke1N4P7QQAlC7T2xpKHLyfxHbucG+qLxL4FaENlEd+o11E50PycxgZrHVOtarbi55e5GN7I2xC0nPiQfKL40fzL6ZcQgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5569
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



On 7/10/2021 10:52 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Add helpers to read the min/max frequency being used
>> by SLPC. This is done by send a h2g command which forces
> 
> s/h2g/H2G

done.

> 
>> SLPC to update the shared data struct which can then be
>> read.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 58 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>>   2 files changed, 60 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 19cb26479942..98a283d31734 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -278,6 +278,35 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	return ret;
>>   }
>>   
>> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>> +{
>> +	struct slpc_shared_data *data;
>> +	intel_wakeref_t wakeref;
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
>> +	int ret = 0;
>> +
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>> +
>> +	/* Force GuC to update task data */
>> +	if (slpc_read_task_state(slpc)) {
>> +		DRM_ERROR("Unable to update task data");
> 
> use drm_err
> missing \n
> maybe this message could be moved to slpc_read_task_state ?

Done.

> 
>> +		ret = -EIO;
>> +		goto done;
>> +	}
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
> 
> maybe this can also be part of slpc_read_task_state ?

Yup.

> 
>> +	data = slpc->vaddr;
>> +
>> +	*val = DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
>> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>> +
>> +done:
>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>> +	return ret;
>> +}
>> +
>>   /**
>>    * intel_guc_slpc_min_freq_set() - Set min frequency limit for SLPC.
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -312,6 +341,35 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	return ret;
>>   }
>>   
>> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
> 
> missing kernel-doc (above intel_guc_slpc_min_freq_set has one)

done.
> 
>> +{
>> +	struct slpc_shared_data *data;
>> +	intel_wakeref_t wakeref;
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
>> +	int ret = 0;
>> +
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>> +
>> +	/* Force GuC to update task data */
>> +	if (slpc_read_task_state(slpc)) {
>> +		DRM_ERROR("Unable to update task data");
> 
> see above
> 
>> +		ret = -EIO;
>> +		goto done;
>> +	}
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
> 
> see above
Done.

Thanks,
Vinay.

> 
> Michal
> 
>> +	data = slpc->vaddr;
>> +
>> +	*val = DIV_ROUND_CLOSEST(data->task_state_data.min_unslice_freq *
>> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>> +
>> +done:
>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>> +	return ret;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index a473e1ea7c10..2cb830cdacb5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -36,5 +36,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   
>>   #endif
>>

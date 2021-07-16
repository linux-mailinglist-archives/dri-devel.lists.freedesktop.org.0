Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9803CBB8B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 20:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BFA6E837;
	Fri, 16 Jul 2021 18:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225A66E21C;
 Fri, 16 Jul 2021 18:00:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="232613659"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="232613659"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 11:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="460833358"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 16 Jul 2021 11:00:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 11:00:48 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 11:00:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 16 Jul 2021 11:00:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 16 Jul 2021 11:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjAydZFDZ1SAe4RiCufHCAUHYVA66qP0Iuw6kMilptlSVoWUVtQA++h9oTL2PiHzvERCvcGNXISitPk+GCyL1AiK2T/mk8eR9yoi6LvbUHOl18+aGXO06JxzhLv3AiK4vCEDFgKg52yln5a6EtEjoE1mzNk40WIewMQKMaZF1ehpMmzLD1v8PTjNjHAH7xxwSHJIKF2E+riDJ0knzGRhkkWGqZa6DOmDcGCP+WkfBftbl1X+8gf9tzUg6N0f+YgqzmT7N4SSsBs+6EjRUQlaAokQSW9CCzTcFMkvHtF26JyZSrMOru90ZohIClBmZVYeMl/FAW8Wzyg2n/6KY6KxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRGaJTwnJikglvg/Yr5s/JT+wygAq/y0f5gk70C8dP8=;
 b=Ip+PjGJzfcqF1r+wAUCiOyX3wmRTYoJtRIQ5BMeVgwtaDIzEeozBT0mTeJZQsbEqfNa537YPdiXss/2i4HYwUWtVNTpigu4cAkLFXn1hDqKbAsFBnmZX9Rrmpy/FFgbW192of42Wlt0LzTeSosDqXQRuBTtIv456jjp7ju8Ba1hPO/OkpJ6F+nI/8hvUV+kesbZtZr/VzyjY0+5GOOWlo/72h5a0Szzf9cpGRtvOWoSspcXGtkfxUfozrYIJT9hpbFpUg5nBi4geuZWWI3GBq4cx6fox8YWpU7998Ca/wDhOjOj/Cs0aNLk1tL8lyKU5WrR6i39+lpb4t5Z5xXlyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRGaJTwnJikglvg/Yr5s/JT+wygAq/y0f5gk70C8dP8=;
 b=brHe3qwr5g35tA5ITj9Vx67jrsxhtxi5gXvWuyxF1tMZC2ITyozz1vv/96l47KGFBwEogstP5WcVK+2QtX2Ss+8pB50y/5tuVpkCvO8qfOWkh9yAQsgDG+QutIf5fqUD6k1t/Y+++g09Y3rhkCs4Yd3GjSl3KaPTJvuzKr+dmoY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 18:00:46 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.027; Fri, 16 Jul 2021
 18:00:46 +0000
Subject: Re: [PATCH 08/16] drm/i915/guc/slpc: Add methods to set min/max
 frequency
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-9-vinay.belgaumkar@intel.com>
 <9afe2754-72d9-c3ab-f5b6-c261c28e3bbc@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <422c7548-bfea-dedc-099b-6e279c71d227@intel.com>
Date: Fri, 16 Jul 2021 11:00:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <9afe2754-72d9-c3ab-f5b6-c261c28e3bbc@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BY5PR17CA0032.namprd17.prod.outlook.com (2603:10b6:a03:1b8::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 18:00:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39316056-88e0-45b0-12af-08d94883a30a
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5588BD14F512E3576BB395EF85119@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MevEjGDcazdqchuMZpLdNH+E9V5uWBgqwh+vd5F2PzrAcSDzIjB9woOu/qwZFpceA+X7Vtb8q+2f11N8su8BleL4Lxc10jfxjb9yWRml6XjQVbW5CKukcyKmIsnvpcNoa18YI/sLRfD+A6D4SeCmcga8HVYEMfBl5M0MnPeGmOESa19yucgCYfsxY5xs4NMpYp+lmW9fmdE1Yz1FAP9vVpz7F+icMczun3cITcU+i5LJPadnkFVQtEuZrwb0ap2xiubLtHP/RdzOJqrSkrb0nKrH9byHjf1eCeaelduuYGhMQ4K0LPFqDPESA1WbiP2Rx87LXbNnVBLm5QpLY7JRUZQyqsukRMLOXWCOwjmZmrQi/neTjiSW/YzAU3YwcbMYZ7WGXwA65gOdq7Dd4mGag+QtRGCq4G9HwkaA3gPzjV+1NnGGMUKW6Wu23uJj05FwVD68af3B2hdQDwwmCpZWmoPSk9vFD/hIvDKlHwxiujfiBJ8vSskBWaq+I/zZDBC2QNOOKEi9sw2Ok0i8/ddMXcltoVX5sHsidYBXgHHSHZDcndZl0dWrzBapW6Lz6CKmOqEiie57CZ1HaB7uUPc7Z4lF/czcxrBNU6DqTb/EUkaL/dJgTehNOkKi+Xn5sdknHmDSF0gS/v6jtRC0jmb+k+EWFkpwl9dbexKV2i1JsZKGwZfz3Rxvli6umEQWVIwxdmeI/lItSHPi5GMpJxZbXujZLdBpL1G+XKiq1qUq418nWLWD4iqgql1O1MAFqFxa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(450100002)(8936002)(8676002)(6486002)(16576012)(31696002)(956004)(4326008)(2906002)(38100700002)(53546011)(66556008)(186003)(83380400001)(66946007)(2616005)(107886003)(5660300002)(86362001)(31686004)(66476007)(316002)(26005)(478600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3dDV3I5b1cvQlJaR000QmhCOFVVbjN3S214dkNXNytaQXArNCtRMXU1dks3?=
 =?utf-8?B?T2VyK1VPekYwL2dyM2lmQm80UXkzN2pHaktmOVZyVTRnYyszMVcvMHZUY3ZK?=
 =?utf-8?B?TU1uS2pIN28xN1Z4Wml2bnNEcXdRUjk1WlpPS0R1RXB6WVVVMmszQ1EwVVdW?=
 =?utf-8?B?dzIwNGl2TGcwMXQ2RC92NFY3STh4cmZ2UXJxMmtnNnV1NTVWSTNRdzB3U05x?=
 =?utf-8?B?ZFB4YXNOUHE2K0JMOWpUT1pIZlZrVGRCUW9aZHNGV3hJTGNCZ255S2pVeHNH?=
 =?utf-8?B?M1FRYm1Zd2h5MUNhRnhyS09wQ3FtQ1pzWHVOYVZLSTNxSU5oOEdJc2pyK3F2?=
 =?utf-8?B?M2JMZEFwY29UT0xlUzFiV013WDRUZVpMbWpOSnhHcFRlSE5NTnRvS1p1dUNO?=
 =?utf-8?B?NjBUWjZMOVVMSG4xc2tsSVF5ZEN0R1Y3S3lLK2VJbjkxMTFNNkZTaXpsUHBC?=
 =?utf-8?B?T0JieWcwTDk5YkFqOEQ4dzEycFFrWHczblpWbXdjNEppd3pFRnRXbmdFb0lz?=
 =?utf-8?B?Z1hEY2hyT3VTMHdnZmxaU3FFZzBrb1pVT0ZweUlGcFRFR2UxdUplUVZxN3Zv?=
 =?utf-8?B?K2lIQWNEUERVZGZKUkF5K0czK05UQUVQVVoyU3Qwc3YxVTV6YkhER3dKUFN6?=
 =?utf-8?B?U2RqUDRnMXQreklPb2dUN0RuMk1iYnlOUDZ4MHg4QUdWSmw5N0NnelJYWFBO?=
 =?utf-8?B?SE5ZQ0VSOWpJSkZNWXFUWWNsazlWOWtEdzNnMmtZSU9hVGNQbU9BTTk1WTUv?=
 =?utf-8?B?U3VneGJzVkNYWWVzWVZlMk93MXAyWUp4K0hYUkl6N3NRcDZNOENsYUVkM1dW?=
 =?utf-8?B?NTlvV00xa2VPN0NwL2ZEWlRSL1NRRkwxTldIN2J4ZXlCRXJCSHBwS2dwN2ZP?=
 =?utf-8?B?WkNkeWE5VFRGc1UvMkxUR3pSNUJjWVBFblJqL3VuNk5vdi8yYzFiamFNelpn?=
 =?utf-8?B?akNlNUF5c1doeW1tVEdNZW5PbGxzT25vYkw1QlRCcmZydEo0ZS9zVHlkb0s0?=
 =?utf-8?B?QmNRWCtiUmoxWUxUdU81eHhvZktqWUdnd2dGSitnbjV3SUNVcEU0ZjJQL0hZ?=
 =?utf-8?B?ZHB6RXNiUUdwbzBjREQ2SjI3cmhEbnBFNjFQdmpOS3pGa0laNXJNZTZEOGww?=
 =?utf-8?B?L3hRZ0IvT3RMcnJXQ2Z2OWpnbURwa0JJcFZVdnI4T2h5L21JVXJ0Ylo0N3dn?=
 =?utf-8?B?VWI2R1AwTllYMmN0QjZQOXpaMzFXcktHeEdjc2dmazR0aW5XbnNwYy9rTUVS?=
 =?utf-8?B?N2tqcXliZEtxQi9LeFQ2dnAvaWNoNFUzSU85QVV4UTErY3RwMHlNSVJMcVpl?=
 =?utf-8?B?YTExZFpqdGVCNW85UHdKQ3dzMFZwN3M3dEVXaGRBZmJLa2JnREFpZlRhd0JR?=
 =?utf-8?B?Z2hMVVcxbkRHOVlpVHFhcVQ4bEZEc2tJbE5ZZVRDQm9OU1NrOVFoc0N6ektF?=
 =?utf-8?B?U2crOTZ6QXNZTjE4Z0lGVkVaNkNoYlkyRlJGeUcrd3hyK2RBL0ZzV3NPdnNv?=
 =?utf-8?B?YzkvVWQxS05SWVBHNWUwdk1xOXF1VnhqcUhaOG11cDBKN1YyQlFvY3g3aXpl?=
 =?utf-8?B?MmFwcVZGSDFzZ2hVVUxPVllqSGFNS1VqTWZuQnNiS1VTWUZCVVkra2FsNHFo?=
 =?utf-8?B?S0NlYXFZc2VCdmZVb0VINDZCTWVZRElCQnpaWU85RXBFSmE2SkZOMlBBY2J5?=
 =?utf-8?B?OFB2MjhYYmFTZGk4c1lYTGxqVjlUNWk4YUZIZmtwZ2wzZ1E2N1l1dkpMdjY5?=
 =?utf-8?Q?vi6CgUEv8hYctd46vT+5MmTyqp7j2ij5exv5gGI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39316056-88e0-45b0-12af-08d94883a30a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 18:00:46.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36tRFErzk7Ue7u4OVoQkyqYms8eNiIW53/cKAthmn6AaWrSTdxrOElOZF7fKrIf1X61+l8MbQgqeQusYddbJ/ykK5FSBGa7YfOBp0BqVyFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
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



On 7/10/2021 10:47 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Add param set h2g helpers to set the min and max frequencies
>> for use by SLPC.
>>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 94 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>>   2 files changed, 96 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index e579408d1c19..19cb26479942 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -106,6 +106,19 @@ static int slpc_send(struct intel_guc_slpc *slpc,
>>   	return intel_guc_send(guc, action, in_len);
>>   }
>>   
>> +static int host2guc_slpc_set_param(struct intel_guc_slpc *slpc,
>> +				   u32 id, u32 value)
>> +{
>> +	struct slpc_event_input data = {0};
>> +
>> +	data.header.value = SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2);
>> +	data.args[0] = id;
>> +	data.args[1] = value;
>> +
>> +	return slpc_send(slpc, &data, 4);
> 
> as suggested before, use of explicit function like:
> 
> static int guc_action_slpc_param(guc, u32 id, u32 value)
> {
> 	u32 request[] = {
> 		INTEL_GUC_ACTION_SLPC_REQUEST,
> 		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
> 		id,
> 		value,
> 	};
> 
> 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
> }
> 
> will be simpler/cleaner

done.

> 
>> +}
>> +
>> +
>>   static bool slpc_running(struct intel_guc_slpc *slpc)
>>   {
>>   	struct slpc_shared_data *data;
>> @@ -134,6 +147,19 @@ static int host2guc_slpc_query_task_state(struct intel_guc_slpc *slpc)
>>   	return slpc_send(slpc, &data, 4);
>>   }
>>   
>> +static int slpc_set_param(struct intel_guc_slpc *slpc, u32 id, u32 value)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	if (host2guc_slpc_set_param(slpc, id, value)) {
>> +		drm_err(&i915->drm, "Unable to set param %x", id);
> 
> missing \n
> what about printing value to be set ?
> what about printing send error %pe ?

done.

> 
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int slpc_read_task_state(struct intel_guc_slpc *slpc)
>>   {
>>   	return host2guc_slpc_query_task_state(slpc);
>> @@ -218,6 +244,74 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   	return slpc_shared_data_init(slpc);
>>   }
>>   
>> +/**
>> + * intel_guc_slpc_max_freq_set() - Set max frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: encoded frequency
> 
> what's the encoding ?

It should just be frequency (MHz).

> 
>> + *
>> + * This function will invoke GuC SLPC action to update the max frequency
>> + * limit for slice and unslice.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +	int ret;
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> 
> use can use with_intel_runtime_pm(rpm, wakeref)

Ok.
> 
>> +
>> +	ret = slpc_set_param(slpc,
>> +		       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> +		       val);
>> +
>> +	if (ret) {
>> +		drm_err(&i915->drm,
>> +			"Set max frequency unslice returned %d", ret);
> 
> missing \n
> print error with %pe
> but slpc_set_param returns only -EIO ;(

I was done that way so the sysfs method that calls it gets a standard 
value. Will change that.

> 
>> +		ret = -EIO;
>> +		goto done;
>> +	}
>> +
>> +done:
>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * intel_guc_slpc_min_freq_set() - Set min frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: encoded frequency
>> + *
>> + * This function will invoke GuC SLPC action to update the min frequency
>> + * limit.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +	int ret;
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>> +	intel_wakeref_t wakeref;
>> +
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>> +
>> +	ret = slpc_set_param(slpc,
>> +		       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +		       val);
>> +	if (ret) {
>> +		drm_err(&i915->drm,
>> +			"Set min frequency for unslice returned %d", ret);
> 
> as above

done.
Thanks,

Vinay.
> 
> Michal
> 
>> +		ret = -EIO;
>> +		goto done;
>> +	}
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
>> index a2643b904165..a473e1ea7c10 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -34,5 +34,7 @@ struct intel_guc_slpc {
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   
>>   #endif
>>

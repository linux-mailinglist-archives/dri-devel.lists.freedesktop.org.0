Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4558608EE0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 19:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103C10E04D;
	Sat, 22 Oct 2022 17:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A9910E049;
 Sat, 22 Oct 2022 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666461370; x=1697997370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9xafyY3yBXGsnDvawT0TL9SFggNn4stK3QoYT8PkZ6s=;
 b=Y/kKVzlg70l/7Kf9akUn0fKd2g/RiutFN4a/XMXv2VsuD2Nm6d09GJJ0
 2lp5xWfzOK0XXww4xYnDnP+Gv7X33l8iIrxkv+nAguf5Gr2+8RSnxZrkd
 x5jOAltR7HMYJ3ckik42Pk09dbfk9jCK5lVW3efNFgnm+LB1lmaMKg8Ep
 5vScXkUNieozc4h5JPOwYhdrCYudyzGpQf8ZnsN8qi4daEoB3/4Am0nTx
 rpg9qPMvs+JRKaEkBNOvEvt4G7aQFUazZAEHHAxRRXLc3kbT4z6h605Dc
 fklyiUEz/KUSgRm9OST+tIBQfYHzevhy97N8O0gmlVHgapjz7RbmMpDXQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="290507405"
X-IronPort-AV: E=Sophos;i="5.95,205,1661842800"; d="scan'208";a="290507405"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2022 10:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="581938966"
X-IronPort-AV: E=Sophos;i="5.95,205,1661842800"; d="scan'208";a="581938966"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 22 Oct 2022 10:56:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 22 Oct 2022 10:56:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sat, 22 Oct 2022 10:56:08 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sat, 22 Oct 2022 10:56:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9Jw4oOoolGHR3VbVDManaVjQDFjPuZxTcTpYd+AwlsDNJ4m64CtTYS5y5r/5VxBay0v4gzWPX7vY58EdV8253zZdcpOPgAN7SoGGBX/CsU0OJIhuVXTdz5XJca603pUHmzJ3qsp38AhyYBZVTPRxoiXOEsYQhYjaUh2CAtf70WIdSSf3Cebf2jlkKIfh4MTg5a1+8SUjuPxtVkzquFzaGr/hqbp0Q4pWOIBeyPcUvB+EqWksqCAFXiYPKlBzOGOwhpE0I/0TaMM54QfFLgdCnCkSk/9BXnOlR9HYym/cJ3rA1RLJaaR+QK9ToBnTPivxfSJHVjOOlpY1HrFLiDbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLdTJ/LOzhk2Szv5wPr04AtFvHYvLF6uLCynHsv7rCw=;
 b=ljCI6KaPHHG8dzEyswMiiVHRUVXh66hy2iLbX/imYvj+nEt1IzlJMb44o6cdpU2xGltvKqioHf5sek3gUpmaneR3haL/mXZV0drQUeuYY5Xv+UibLe9Qku5+y2WYMhhq8dzQ24t+r332e+HVrS9oX5cma2ZXgi7wJZ07wUyylKUFeI5Qb1BQijdVaTEXZURbdpw+xRhrwuhbObXUBXahT3TbNK6uWOY+6BHcEKrVCvG7pI1InVSDIsaWdZaLEEHdohhaBIAm78z514FeWUESP3wWcIu7mfHLM/y/cJAid+0M3Jjda743Glv7Z7aj4iesDJJU1AmXrON6F1xYdUTapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sat, 22 Oct
 2022 17:56:05 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Sat, 22 Oct 2022
 17:56:05 +0000
Message-ID: <102c7cfd-c7b0-48b4-8fa6-7719f5529783@intel.com>
Date: Sat, 22 Oct 2022 10:56:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221022002452.36716-1-vinay.belgaumkar@intel.com>
 <87wn8sppyp.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87wn8sppyp.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: dd42dc6e-4806-41f6-8a8e-08dab456b0a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+ORvVOlQpyLNb9xCKh1o3+I169SjHpTwb3+q9TemJYZ68xoUMolmNjpcslJgazwUWfH8D8Et9SvvCS3CZKMm61P8SDT5UZ+mb0JGnbUi6hVsuAQR4BTc2tIJNOSQI4ZdGTvnyVZO5uaSgdN0S2PVWU+SvkXcsK5UhzpoDDL/lHiy3ElUHvTFl/QWcz0AmnAH965TfliffTEn/5oiuuJhaRaRXJd/7OsPd0No9NPLFCwH4kWuP8V/GijATk6NUO2mP9an+ppgSJ7xTEpbJ+C+u/cqdkKJxCBqT1ZM7P12t/2gd1ae+O4uGbIsA8UY3/ly39pL3e/BtXD0iFUqeZ8sFL5AcqF/F4oaslREXQfdjdyKPPaj8+tBmmN94vN0OYJfzrbbtaYmD4nan1rREzo035YIdntSs50P6XbCyT9i7Gcpsx+FMXzHm/NOejOsZTTr++iLeq7SUz81u3pKyXBSchgrnJOpSL/GN2PRucX+7RDpKqNYfjW9B/zyF3FUKXpNav/sibeQPLk0Zz7b/Q1aZkUYbVx2LVosd5gZmp/dXIXKdFTcD9qjz5kts2kfNHo3QV1X2T9MYFQONLuK0rsmNUrh4hLeeIVipzP/YpiEPcdpFQr6GFijLntuzkgnXRv8v7/v6NFnk1RcfrfCedBtjMca9JD1thp3LXcnD48rkoFwnSO6EnAQMiqLVv+R2E6ND8KnQgnozs9sTjBpYnVuj+BGwwJRA7Xj02OIgdWvSVuiSOwmTf3AA3i0sq24vTrWvcJceyHiKRxgduiJlaXuu+rPgbNqTY5MfT1+m1P7So=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199015)(2616005)(31686004)(186003)(38100700002)(82960400001)(6506007)(53546011)(26005)(6512007)(41300700001)(86362001)(31696002)(8936002)(6862004)(5660300002)(2906002)(6636002)(36756003)(316002)(4326008)(6486002)(37006003)(478600001)(66946007)(66556008)(66476007)(8676002)(83380400001)(450100002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xMSzBFV0hLYzdlSnlpQnArbGNoRUl0dlFSclNVZVVNWUJiUC84Z3NsTjI2?=
 =?utf-8?B?MnlaSit4NDFOSWF6M0xpMFZIZnV1WWttSUFhQ0FPU25BWTdTSG91MThCN2xw?=
 =?utf-8?B?Zm5iK2pqSVJFYkJkcEtOK29hajA0UDNibHJRWjkwcnMwb2dyMThjdVBPMW9k?=
 =?utf-8?B?SHZieTNJYVYxb1hTZFRPaDFIeUlmWHFZTFYxM0RIcFRjVWtBYmI2aTJzVGpQ?=
 =?utf-8?B?SkhwNXloSHpmQU5VdUs1cm0zZEZXMnE5cXgrL2YwYjlXNW40THgxRC9zTk8x?=
 =?utf-8?B?U2N5MUoreEtLNWE1bkZiZ2w5ajhSSUlwcXJNTnJSbXhIeGxiRHVTTkFFRkNV?=
 =?utf-8?B?by8xYmRvL2dlcmJVdUFWdUFEU1BjdFhocFg3c1A3ZmpkSUlOV2FVTXA4QTBO?=
 =?utf-8?B?VVRYSFJFSkdZTklzT1Y4UkkxUHNGTldvZkw2MERUbjM1ci9sTDRxVVhrQlY4?=
 =?utf-8?B?WXVGYThrSWVuUkJYeVd5ckwxYXBTcmVHQmxJS2t6c0l0czg4VDR5VFZrZjds?=
 =?utf-8?B?VzdtbkZjT2lpYWRrdDBlWGFWN2xJQlBZb0RXUXhoOEl0UG5COWgzZXh3em1B?=
 =?utf-8?B?R0xkL0lXdi9OQm5XNUpxYzJQQ09hVzlCUHNtdXJ3bklrbWN6ejlqU29oc3hL?=
 =?utf-8?B?QmlnMUdnNDMySEEvMmJXSmU0eDg3VWVjUEc1MVRXY2tKWDNKRzZ5aGRxaFo5?=
 =?utf-8?B?VTZNOWpleVlYVkFJcE1oUllnLzhqajVCRGdLYmNWNEFReTFDZno2OEpUc0hU?=
 =?utf-8?B?VElqUUtsOEVyVEpnYi9OS2w5NFNVMzR1TytIMndJWStVMHI0aW5icGNydjZB?=
 =?utf-8?B?N1lhbHpCTnBWUStKczArMnJodzRQTU5jQWZjSkpocThKaEFKMy8yZGFNZVAw?=
 =?utf-8?B?a2c5ZUtpUmFQT285Y24xbTFkWU5EWG5ENk5rZ2RJOXk2K0NvYThzUmFVOFdR?=
 =?utf-8?B?bzk3YS9mamhaS3NBMzdwQktXWFpKT2hBUWY2WXpEb0lFdjlmVkQvcFBEaFBh?=
 =?utf-8?B?dXJiL3Q0ZU9nYnBaQ3lBMngzVWpsRjdoSStoM21UWURSbnhMemhHcTFsWjZw?=
 =?utf-8?B?V2xPWHozYWFRekVLcUluY243WUc5VlM2ZVI5RlYyVzlJcmNsL2F5WFZWSTd0?=
 =?utf-8?B?YnA1S2ovZDJuMW5xRnVqeGJiN1J5NW9DUlFrckc2bjkreWcrZUgwL2NnWE5v?=
 =?utf-8?B?MGIyUHZBZ2I1RVpKVzJ2RFMvTWdMTEJGV3prMXRUektOcW4zQmdXWFVFS1pL?=
 =?utf-8?B?MjFxelpxUUdjbG9vNWlOd3BHeDBodTBHcnl3ZVR3bU1XaTFWc25CMis0NFZB?=
 =?utf-8?B?TlAxNjJmNmRyUVNWcmR0ci9BRFVVb0VGVExvZitrT3JxVDI5VHRUbjFlYUJR?=
 =?utf-8?B?b08vQlJVdlNyRm1yZEpNR3lFM2w1bFVWYldWdmdjK2prV3pPRDUwUXVxMENk?=
 =?utf-8?B?MktJTXVpVTV5VXUxa1diaFROOFJieW43Y2hpU2dmT3ZkMGsxRDU3MGVDY2VI?=
 =?utf-8?B?QjhQVnd1Y2VXWjZPU0twa2JzVXRpUHRhR0szdjJDODFIcnIxMGxTamJxNmlw?=
 =?utf-8?B?bjZtNGdsYVhIM2F5cTZnblRMODN1aFNkK1MwQ1lwUms0YzNIMzFLamp3NE0x?=
 =?utf-8?B?Qk1RRGd4c3NnWGVOWXNiK3dnc2RsNXZXNHNuVjZLQUhKWTE1dDZ0ekEzMVpC?=
 =?utf-8?B?OFZVenJ4MzRlclZxMkd0ZFoyZS9HcGk3MTNnbzZvOEhhSDQ2K2pWWStPSVhm?=
 =?utf-8?B?Q2ZRY0tNUXd6Q25taFlqTnQxU3VsUzl3aVVHbGl6dTUzWmM3R1A1OWhVcFk3?=
 =?utf-8?B?bXZuVTVnbDVEazZQL2FOaXIrV0pJZE9UZTVpbDBZaXhDQk55aDlWcUl2NUhp?=
 =?utf-8?B?VmdRRVJxUkNWOEZzL0YzWVdjS3JGTzNvRHpzeE5BbDhqWjBUMWx2VGlLNFJt?=
 =?utf-8?B?V25pbnFBZU5peS9qMnUrYkJTc204aFRKaU9WV1ZveHMxayt6a1RVY3htWUQ5?=
 =?utf-8?B?TEdzSSsrdHVZQ1dwZXNpS0ZxeG5xdFFISzYwa1F5UW00UVNNWGlIYzlOaUNE?=
 =?utf-8?B?MDFtMjh1eGVUK2o4K2NwN0NoTHV5dndaa2h0anYrUXo2ZXUzcEgvTWtHbXhI?=
 =?utf-8?B?RjBYMFVaTkp3M2tFTzJ0UHBGYjFyeVZ3ZG1OZkc4aGF1YWFBVi9aSnlxSXYr?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd42dc6e-4806-41f6-8a8e-08dab456b0a2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 17:56:05.1694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeHArFLyPFe+PLKF18o1x+mClgpdMftwwcM5kuMAvE3iltGtPiTLFKXcIpYACvUQBn5BhaUS/TfYXFTU7EvskLTtWplWPjqAqdTJU/eoSAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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


On 10/21/2022 7:11 PM, Dixit, Ashutosh wrote:
> On Fri, 21 Oct 2022 17:24:52 -0700, Vinay Belgaumkar wrote:
> Hi Vinay,
>
>> Waitboost (when SLPC is enabled) results in a H2G message. This can result
>> in thousands of messages during a stress test and fill up an already full
>> CTB. There is no need to request for RP0 if boost_freq and the min softlimit
>> are the same.
>>
>> v2: Add the tracing back, and check requested freq
>> in the worker thread (Tvrtko)
>> v3: Check requested freq in dec_waiters as well
>> v4: Only check min_softlimit against boost_freq. Limit this
>> optimization for server parts for now.
> Sorry I didn't follow. Why are we saying limit this only to server? This:
>
> 		if (slpc->min_freq_softlimit == slpc->boost_freq)
> 			return;
>
> The condition above should work for client too if it is true? But yes it is
> typically true automatically for server but not for client. Is that what
> you mean?
yes. For client, min_freq_softlimit would typically be RPn.
>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index fc23c562d9b2..32e1f5dde5bb 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -1016,9 +1016,15 @@ void intel_rps_boost(struct i915_request *rq)
>> 		if (rps_uses_slpc(rps)) {
>> 			slpc = rps_to_slpc(rps);
>>
>> +			if (slpc->min_freq_softlimit == slpc->boost_freq)
>> +				return;
> nit but is it possible that 'slpc->min_freq_softlimit > slpc->boost_freq'
> (looks possible to me from the code though we might not have intended it)?
> Then we can change this to:
>
> 			if (slpc->min_freq_softlimit >= slpc->boost_freq)
> 				return;
>
>
>> +
>> 			/* Return if old value is non zero */
>> -			if (!atomic_fetch_inc(&slpc->num_waiters))
>> +			if (!atomic_fetch_inc(&slpc->num_waiters)) {
>> +				GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
>> +					 rq->fence.context, rq->fence.seqno);
> Another possibility would have been to add the trace to slpc_boost_work but
> this is matches host turbo so I think it is fine here.
>
>> 				schedule_work(&slpc->boost_work);
>> +			}
>>
>> 			return;
>> 		}
> Thanks.
> --
> Ashutosh

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0C42C9FF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 21:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA04D6EABC;
	Wed, 13 Oct 2021 19:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0DC6EABB;
 Wed, 13 Oct 2021 19:26:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226285054"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="226285054"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 12:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="563220303"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2021 12:26:02 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 12:26:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 12:26:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 12:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfeUla21gJAw7OuCKBMHk6tzOcGSM7so9uMtCZKOoAoGzdMiRN1nUHQ7msC+VHd2sZhd5yAebznX1USvPXmpAVIZpPytCAO3QdgubNCgpe3f4JGivqnS2IGUBJ4V6OGgOGFLs3we6YwnrJ1JqLE0rOJVp1HFfnkqShkYuvPKWs6Vc9J6MP7JG7pmtmNt4hJiKviuvRzno2x3w7n6ySaomqTqqn3dRuzoTRXH4U2X9J5WEKC/WRFglnZkLMJoml7AiedFDN+JjnZp7RbLBhqM1xXgcc/Rss5WoOf3PZaW0P5w4UslA/lkGySji7mrq01jNveh4CN3/u631O66nLpQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r0NG89OtRrTvFrpQB9mwzebsIfkJhyJ6S1U6acg6gw=;
 b=mQBSypFWddYDQTA0PRS8FD7Vj5DXwUmUExzf3/UIb2bHPVPzNlEbD/c0dLBbVEkf+ELUavPeFon8DWkL2ezt5EuR171Or0xgEEsAS0hrRUQYy0IILwhavcaMlZk5LARfGmenR/fWYGXN00rjnl11RBBh8gUqr9fy+pDUrDVbvJFIR2zrj2QY3edXRymDsq1y8IcEA0z9LO9jRWWmMD7RHooq95osfUHLcfUr5dB0Y02VQCf1wGseL0InupLJ2WD8Z1c6khdqZzZhrC5egvbcq11Ji6aplhocAKV8dgQQzoFPHmVbvqkAakmwU+SUsTPIjuhl3jhscQ6/whDXLYqEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r0NG89OtRrTvFrpQB9mwzebsIfkJhyJ6S1U6acg6gw=;
 b=Ga4GFJKUqsecQDIBwg8pa9fmCtANToriyfHYn1ah3GEX2mSWdrY+XGtsiCKi1lhow21TPXfNWkH0ygukhBzHb+YHiNAlWUPhhcJ0sf+7fg95CbVFpIeQyC8xDbUS+jyGoIdnF56BZfsigLsSMFzIp9gl5rCWCuUi+uss0vepmIc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Wed, 13 Oct
 2021 19:26:00 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 19:26:00 +0000
Subject: Re: [PATCH 23/26] drm/i915: Make request conflict tracking understand
 parallel submits
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-24-matthew.brost@intel.com>
 <03661707-0416-93cd-94b5-1624f1a5e073@intel.com>
 <20211013175133.GA34759@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <b6a090f7-3304-9357-4bce-e948d6574996@intel.com>
Date: Wed, 13 Oct 2021 12:25:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013175133.GA34759@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0272.namprd03.prod.outlook.com (2603:10b6:303:b5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Wed, 13 Oct 2021 19:26:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4570563d-9c33-47ea-c03c-08d98e7f4a21
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5644D3DC478B1101FEF065B8BDB79@PH0PR11MB5644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMzgDH4NzXcU+b+KbwRmsQw44LL6yLYAv+5P0BnkYcWSiGBl6OFUX2rlaqWL9keC2m4rNpRpOfYE8ykhtDWolvRLq8CjGkENo7ETfSeFtwF1M3bd/cTe9ScBlpfm6EjtogQhQTOXtMaECZ3fK0ILebFeso6KNXXalZCQnj4lGSrL5Xb3vuvjsQJj7HOswbgBgost/VxUbJ42MoMaGRNcRtESpM7LJBs7feQutL0r768drO5GHKia2HGH8kgUW5hhAgYBz3HQr13dZIHtmbec0cdJMZP+r3txHu+Dx3xNE9FLiT60WuPO4N1ZZ/zkHKbeZoCAShYlkgUJV8aFsjDt3rcNZQ97VS2az9mFqzeQyPdyiZbIX53jzFCdG4UsGrvjOn1Y3X0Rpg4Ixq9ayDW6zvCtGqFyQJOBCBEk9WtdfG/aJMheqlW3u7mVqiJfnc1YqdicblML8nzhUU+cUota+djV5lh/gUX5kzJ5+FOzLo2yRcgqZt0vLSC8c/pcbv0vjEHZjE/nourrRWGbfPBMwKLVg100LP1vY6Tm1MQ79Rz+HN83ZRqLHHj+IhXhZUTZQnqXMSC4zr2PMPedXt2SR82DvHvpoPskPLrlRt9cTuobO/SVUPhxTxdTB8JAm2nUOTa0v7DWS9TpIbvV5ihdRNihvMGyzp042GNg3TLz1CKrGyupt7nWLhKpF5vPDg4ls1ay0gfg1qqEd3Y3s6LrAngvSyIpNWjz6D5Oh9oE4dv+rnfcqoUV5KGz6Z7ahUWo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(316002)(2616005)(2906002)(31686004)(26005)(36756003)(450100002)(82960400001)(5660300002)(66476007)(508600001)(66556008)(37006003)(66946007)(8676002)(186003)(53546011)(83380400001)(6636002)(4326008)(16576012)(86362001)(8936002)(107886003)(38100700002)(31696002)(956004)(6862004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGxoYkJ3UHhiZk5ycDJSOXJCSmRSU1MzOUFIVkUzbzJIM2U4Z2xCcWRFSzJx?=
 =?utf-8?B?K1NhT01JSEFheGFNb20rYVBxRDRrVTJsdVhSalRTMXF4UTA1d2MrcmFGOFZ4?=
 =?utf-8?B?Q3dOU0E3THJLTzNJU2ZEa0thRjYyYitCRFJKTjYxRGJ5cFRDQndZc3FZMHE4?=
 =?utf-8?B?SUdBa21VbW9kTWdpKzNrbE54cG5RczNxQ3V5ZjNyMlBBQnlZcXNPUjZoUkll?=
 =?utf-8?B?NkliOXdPT1dlMnAxSHBhcjBLanZzWTJJdHlacUJnM0ZSTllBZXpjVjRDc09y?=
 =?utf-8?B?eVVWVGZXdXd4Q3hJNWJkVkxZVzI3UWRmQlZyUWd2dFhEZGlPVFRlNFhBaCt2?=
 =?utf-8?B?aGttR1pmemdyRWdxLytlUURzbllHalpJVjdQSUdDWFhSMmp2RUZRTklOd2wz?=
 =?utf-8?B?bFVRSk9Sb1BDNmR1Y0lWZDRvNkJJd2paVDlmUlIwUlhxQ0VEUmdaczN6bHhq?=
 =?utf-8?B?WlFaOWpweWdtbGQ3UFJMMkNLVWNueTNGWEw1d0wxNTFDOFJTUXFpYVZGVkpS?=
 =?utf-8?B?YTF0TU0rRngxamltY0tSaVRyUzB4MkJVUUxDYzgyengyaFU5akFxN2ZDUVRj?=
 =?utf-8?B?RDRzWDhtellkamtxMDNGVFZMQzlCTEtaMW5XVVZXVndyajBIbGF3bzN3cnNN?=
 =?utf-8?B?WFk0YnFVdy9QOWxQN1RyQjFqNDN0MGFHUUE2MEd0cThLWTVkeU01RFlvME1r?=
 =?utf-8?B?Vk9KRHNBYUdQYWFxUDZneHk0VDF6NEV4SWlSYVEyajhabFhVREZWeVRvNFh0?=
 =?utf-8?B?clFycFRPT0todFpiclBlWmZVSjFCMVRPSm5yWW1EWFBBSEk0ajRGd0VjUVBy?=
 =?utf-8?B?YXNnd3E3ZzRJTWVoalRwMUVoazk2VkkxOVAvQ3JRbHBidVJUSlZxSGtqUVln?=
 =?utf-8?B?MmI0aXpOVi9YWnYzWldNNVRwaDF1d0pIL2ZGZHlNcHNHQkhBcmhGUE1ocENw?=
 =?utf-8?B?ZTN5TlRYaFJqWDhHRnFPekY0SWZUNWtwTExwUG8xaWVNSkhVb0taZ3J5WWV6?=
 =?utf-8?B?ZEJDdmdjWVJJdk1tWmxvTkdqcXlpdlpBa2g0K25NOVRyZFZMQW5udExmTHJE?=
 =?utf-8?B?NFExeGRYRS9SYTJlUFEvTmR6MjBHYzFNaXRPR3B0bkt5RjdMVlJFckUyT08z?=
 =?utf-8?B?S3FxTWF4WXNYMnFtdGd1emlud1ZuUHBxc3pxTVRrV1gxU3JDTVVPcGorNE95?=
 =?utf-8?B?UXJiL2UwT3pLSVdvUEVNMlg1T3BEMlY2d3d3OEo0YW10Qm9wTWtBeXZWWDJx?=
 =?utf-8?B?TTR2akxMV3ErN0tlN1JDT1VCRU5XckRPWUVTemtKSDZtakxqM1NIR2k4bFFk?=
 =?utf-8?B?QnZUMFZUVFNtbTNIcE1wOVlORVpGWGhwUDhlM0dqT1hqRi9rSjlhS00wckQ4?=
 =?utf-8?B?cTJYRHdZeWVHNUd5MXRnWXYvaUNYZHdLYStZTCs0WDdTTkZBZzREbVVZaWhB?=
 =?utf-8?B?QzdTZGJPZUFLcW5OcFdtZ3MwL2gwQldOQllvampjYm12RlJtK0Mybm1UZ3FQ?=
 =?utf-8?B?RHZGYmF5ZGdiSHpnN0o1TXM4eHdHazdid1drNTlueTZiSjBkdGxZSm5lMmZH?=
 =?utf-8?B?bC8xSWxLZ1JOWUFaSDR0dTlSaCt1OGVHMUcxUTJSM294NnJ2OTdYdUlveFBF?=
 =?utf-8?B?eitvZXNxSm9PYmhxRi9qbDROcE40NkVndmlYUjV1eXNPc2N1c2VBUkxsejBq?=
 =?utf-8?B?bVUydEVoQmxqQ09tMlEzVjVUMDhYcEZTbjBBS2poWFNhdEw5dnZhRWdBRTFj?=
 =?utf-8?Q?JsaMPlFdYDgjPhdnwOEoyHd9Q2KzsdA3ecxv+DN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4570563d-9c33-47ea-c03c-08d98e7f4a21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 19:26:00.6577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gHdzW6dBXa0kqRnFl+Qn+FDA592HjHInEolSax+QkoBuQZX43l/y2xrPb9jyGdTVmNplCp1iU6o9qiACYmAwT+rtrYQcumAZBAeg3sRg/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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

On 10/13/2021 10:51, Matthew Brost wrote:
> On Tue, Oct 12, 2021 at 03:08:05PM -0700, John Harrison wrote:
>> On 10/4/2021 15:06, Matthew Brost wrote:
>>> If an object in the excl or shared slot is a composite fence from a
>>> parallel submit and the current request in the conflict tracking is from
>>> the same parallel context there is no need to enforce ordering as the
>>> ordering already implicit. Make the request conflict tracking understand
>> ordering already -> ordering is already
>>
>>> this by comparing the parents parallel fence values and skipping the
>> parents -> parent's
>>
>>> conflict insertion if the values match.
>> Presumably, this is to cope with the fact that the parallel submit fences do
>> not look like regular submission fences. And hence the existing code that
>> says 'new fence belongs to same context as old fence, so safe to ignore'
>> does not work with parallel submission. However, this change does not appear
>> to be adding parallel submit support to an existing 'same context' check. It
>> seems to be a brand new check that does not exist for single submission.
>> What makes parallel submit different? If we aren't skipping same context
>> fences for single submits, why do we need it for parallel? Conversely, if we
>> need it for parallel then why don't we need it for single?
>>
>> And if the single submission version is simply somewhere else in the code,
>> why do the parallel version here instead of at the same place?
>>
>> John.
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
>>>    1 file changed, 29 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
>>> index e9bfa32f9270..cf89624020ad 100644
>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>> @@ -1325,6 +1325,25 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>>>    	return err;
>>>    }
>>> +static inline bool is_parallel_rq(struct i915_request *rq)
>>> +{
>>> +	return intel_context_is_parallel(rq->context);
>>> +}
>>> +
>>> +static inline struct intel_context *request_to_parent(struct i915_request *rq)
>>> +{
>>> +	return intel_context_to_parent(rq->context);
>>> +}
>>> +
>>> +static bool is_same_parallel_context(struct i915_request *to,
>>> +				     struct i915_request *from)
>>> +{
>>> +	if (is_parallel_rq(to))
>> Should this not say '&& is_parallel_rq(from)'?
>>
> Missed this one. That isn't necessary as if from is not a parallel
> submit the following compare of parents will always return false. I
> could add if you insist as either way works.
>
> Matt
It was more a question of whether req_to_parent() works fine 
irrespective of whether the rq is a parent, child or single?

John.

>
>>> +		return request_to_parent(to) == request_to_parent(from);
>>> +
>>> +	return false;
>>> +}
>>> +
>>>    int
>>>    i915_request_await_execution(struct i915_request *rq,
>>>    			     struct dma_fence *fence)
>>> @@ -1356,11 +1375,14 @@ i915_request_await_execution(struct i915_request *rq,
>>>    		 * want to run our callback in all cases.
>>>    		 */
>>> -		if (dma_fence_is_i915(fence))
>>> +		if (dma_fence_is_i915(fence)) {
>>> +			if (is_same_parallel_context(rq, to_request(fence)))
>>> +				continue;
>>>    			ret = __i915_request_await_execution(rq,
>>>    							     to_request(fence));
>>> -		else
>>> +		} else {
>>>    			ret = i915_request_await_external(rq, fence);
>>> +		}
>>>    		if (ret < 0)
>>>    			return ret;
>>>    	} while (--nchild);
>>> @@ -1461,10 +1483,13 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
>>>    						 fence))
>>>    			continue;
>>> -		if (dma_fence_is_i915(fence))
>>> +		if (dma_fence_is_i915(fence)) {
>>> +			if (is_same_parallel_context(rq, to_request(fence)))
>>> +				continue;
>>>    			ret = i915_request_await_request(rq, to_request(fence));
>>> -		else
>>> +		} else {
>>>    			ret = i915_request_await_external(rq, fence);
>>> +		}
>>>    		if (ret < 0)
>>>    			return ret;
>>> @@ -1539,16 +1564,6 @@ i915_request_await_object(struct i915_request *to,
>>>    	return ret;
>>>    }
>>> -static inline bool is_parallel_rq(struct i915_request *rq)
>>> -{
>>> -	return intel_context_is_parallel(rq->context);
>>> -}
>>> -
>>> -static inline struct intel_context *request_to_parent(struct i915_request *rq)
>>> -{
>>> -	return intel_context_to_parent(rq->context);
>>> -}
>>> -
>>>    static struct i915_request *
>>>    __i915_request_ensure_parallel_ordering(struct i915_request *rq,
>>>    					struct intel_timeline *timeline)


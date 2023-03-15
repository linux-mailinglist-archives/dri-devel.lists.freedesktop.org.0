Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9056BBF1A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 22:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5630F10E334;
	Wed, 15 Mar 2023 21:30:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184D910E334;
 Wed, 15 Mar 2023 21:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678915842; x=1710451842;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dwzq9uQCfv//YRkfUn2AMdTWSL0PiY+zRRXSoGB/67Y=;
 b=J7GgBstyKzn5o2LDbGxNwZ++ASmXFEZ37+9ARcH2I+n56JBlE1GvALRp
 hfNe9n0/5oAt/TQggnejZ0dKwIFMdv12///JXNgpIWKrUoo0FVFM5KI9O
 ki/vZ4tkT1wNfHYpBFtaevD+hUIgXAZr1i8MIhtbwxOARxKCOItDIEjK7
 2qGvMDp4U19TgyiShFfHaTFuLigYZ3dNfRDnvINllUUoPeUQST81ecOFr
 LUeHd6+zlQKHc241s+qFklHqzMaGYGiqKJP1WXh+RUD3FQjNpGGT5y5vH
 faJuwCmsE2l41/hWZMViEGpYy/zA+8EQK4CPUc4Y/0Z7wNCBr7fpei1FN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="326181582"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="326181582"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 14:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="789990358"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="789990358"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 14:30:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 14:30:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 14:30:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 14:30:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 14:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EE5tKrTnQnFoBs8U2uSd6M4iSYCVIb2LH2nxl+/QTemGCaYeiP1Q7dBfLsZjjOtaMABiY3wnUfq+INClsxstuawg4iIIGWuOP2q9We2zBKSWarO+ptd1fLkQPXymHKw5jizzFuJHFfvmeiC54TFhxzt9OaqBM2qHJD3Y3+8niMuk8YHqV/0pkzOWz2D6dWexKEhlVDIP/XEK2/NY7r65X1E6nyKlaXNo3F90hynN5dkoRSVlM+vGkYgdvcwxvtF1xQZBAZAoi+CbERTAwhxlL0TI/mcjU9t4cwrvJES16NtM+p4YDEZIOSE5jymv2ACFeadzYJxeCunEYv59ukWNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM7c4JInp5vo1+8b/Mtt5hufDOKT4uhzLJbaBtNMVqs=;
 b=XTzw/ijjcsPalQyyiFGJaq1hwAOcx1UiaJqdvO5QGX2To1gC49taXTDKov1TuTGdP2bpjVTA1O+hfbe71bUuh8wt55jtbpBGCF4GWGbV/v6a4oPnP7lF3HG/sfNn3Wj1LhZrsD6LuRZJoGkfZ6SC4bL7rwbuwzNC0sSjrGsK0pGHRk2flsT9Pm0fhXEzpo4uxQgg0OabuVDwApqg2pegt38uHlJSKAHTW93Im1gcwWH0TOaB/bJ/dCt7og/lUMkIZ6ervR8PaOCZ6qdgU1CZLEqPglAH43cVdwzLBAksE9G16u/gk1tj0h/cszqQk5qyrNkK5ZtHIaFkZawOZCGYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Wed, 15 Mar 2023 21:30:36 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 21:30:36 +0000
Message-ID: <3bc58a34-6e6b-75f8-e4e9-e0730d82a63f@intel.com>
Date: Wed, 15 Mar 2023 14:30:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Allow for very slow GuC
 loading
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
 <20230217234715.3609670-3-John.C.Harrison@Intel.com>
 <3baf596b-cd5e-87c0-bbd4-54a0e39f9e8c@intel.com>
 <eeb90b3c-dbfe-a045-468d-9bf5456096dd@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <eeb90b3c-dbfe-a045-468d-9bf5456096dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 94cfd875-9cad-47ed-1ecb-08db259c8412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apb8rPv8quwr0CD7Uogmo91bPs/aj6yJHRdIVR7hjtI8V3AmzAxU8szXusQNe3JkaGx23Mqx3fOcWWZuVLJ3WcMv5bmEh8BxDivE8A4VS6r7TUyX2Kf4r4YQnot445pv8VVxkQs7yE9Q7XhgbHfkHKL/lgEWkECLApyTOUmO9cZ5vOpgzud5CxRC3sLFC3rLPZVrwdXmvi5F+W7Zl2X/k3wLbuEp+hHjNDBpOny/S78/8jcvYhOhAsxEZ/iLeIA1+CpxVEc/nbioQVQVHvRDEQ8OyM/cvKhinE0ifYwiql1GDv3Q7n+J2zbhT60ltsw4J12gUteABAJJmAWkl+4Alccf5EttQTLJtfJUJnR3ebaaxqhY5jMHOwL90KjqoRY3kzW55ky8TC/rsE1QqwhXknO0mU8LmwGIvd/gQ7OPwGmgYJJqj89cfyCl3le2A1RSZ0ObLh/1KHhJIlHZnj3vU+AaRJjscqbn8DnznwZnBKQjlO3lHUCnnGcYkFHjtzTpUjvJRPrCAe5BHdsw8pN2FN2p++nCerIRuLtAVziHFJpKRWlZqLNvBEvsx054LoqrNqWuOhAEtZzoVAbZVNKq7fL9DlTLX0wLmdR+6gdLRg3iT/ODWb3G9bkjsc22FT31Uc9hAfvV8Eaj9XrkcGfVnWjFySTdkGBMNFWM3Tjfbu9889FlJgSPgj54dTMDSn+j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199018)(31696002)(36756003)(86362001)(82960400001)(41300700001)(38100700002)(2906002)(5660300002)(8936002)(2616005)(478600001)(6512007)(4326008)(8676002)(53546011)(26005)(83380400001)(6506007)(316002)(186003)(66476007)(450100002)(966005)(6486002)(66946007)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RS9NRlZobVY1M2pEdEptcTZoUUlSUTlnQ2lDbHltQURSM0JBd2tWNVJ4Vnhi?=
 =?utf-8?B?SW83aGloc0h3L1ZYNUphSitMYitkSjF6OEZxUHVJVEFaWlo1QU5hT0JKK2Jn?=
 =?utf-8?B?Sy95am5xa3piZjQ2QWhzWER6NytwZVdoQ0N3QWFOZnBsS0lKVW5QdjZZQi9F?=
 =?utf-8?B?b1VhT2l1SGd3cEYzWXJRRWR1OFUzOGpOcGJ2Qkp2OTdQVnZYZnBnVjIxS0JF?=
 =?utf-8?B?Qng4d2xsMHZmVlFVellnelBvb1dpRmdjd1NhdEV3MFdUZWhCTmJUVVh6bDhS?=
 =?utf-8?B?UkM5bWhFeU1RNUk1LzZyWElMaVUySHVkRnU1ZEMrK05VUkhvV1BYV0p5ZjhR?=
 =?utf-8?B?UTRMOVJFV3ZtbzArcWgvM3QrMEJaeFVIMXVTYnYrbE1qV2RQNmUwT3g3dy9u?=
 =?utf-8?B?ZkwxT25nMnVwNjR1Ris3T0gwdm1UVHJiZUs0Q3ZVWml3THRaakFkeUhCb0lX?=
 =?utf-8?B?ZDZOZGhWSkpha05TZWQ4VDZ0aW1jV3hsVlV6M2lrUmlyVmpJN2ZiVUViV2Rx?=
 =?utf-8?B?TitxOXpjcjJkOGpYZmhLKzlyeXgxeHk5RlB0WXpUNGF6ZG1HWVZRY2lFMjFp?=
 =?utf-8?B?MzR1T2ZHbXZyVEtMazUrUVpiZWw4L1Fmb3Z1Q2ZmMDh3RWtBUW9BWFpiL1pu?=
 =?utf-8?B?REVJczQ2c1F1RlRrYjZLbUFhcUQzSk5yTGcvdzcybkdkaUk0MllBSWlLcFpm?=
 =?utf-8?B?UVVlWmV2OEc1SHRrclMyejFqNW9od3ZFVlJEcXVLOUtrcFJXQ3F4dFJBeUNK?=
 =?utf-8?B?dTVsRmJmbk1xTnl4Y3lGRjAvSGNYR3JxeDZOakRsS2lNa1d5VTlVK1doSVIx?=
 =?utf-8?B?anliUENLRGxpc0U5cXEyNUVudkxVaUk2d2tvd2tYMFA3ZjQxeEsxd3Rzb1Jw?=
 =?utf-8?B?WmRYNWFGcXJycHkzSzVmK0hIZkkySitkTFJkRlk2Q3NpWkU5MzVDVkVOSlN3?=
 =?utf-8?B?OGptS25wS3NZQTFGTjVERkZZb1Vod2ZRaTJtb0VNbzVpSEdDZUZYMzZia2oy?=
 =?utf-8?B?RU51eGNHR09yRjg0MjAxNTJTTGVXUlduQk1sM0FYcDJiYlpYUk1OaXpuNjZn?=
 =?utf-8?B?T2VwSS9CRTU4cDUrVFdwWG13Ums1MG9WTXZ2REd2amhLWTh0bFMyVThkaVNt?=
 =?utf-8?B?eDlmNm0wV0FiZ0MyYW1vSHcrcmJ5YWxHZ2V3cCtya013eCt2OXRiWmh6b0Nn?=
 =?utf-8?B?bEt6ZHEyOG9Fb2x0SFhDTUlqdklQUkkrK3puUE5EakY1OGtQdzc2NmttM2hL?=
 =?utf-8?B?VkdQSis3WTVEeUNJWlRyOWpYMEVsK0hyMWduSEZBTnhmUWRuLzdua3Y4TTc2?=
 =?utf-8?B?NmVkUUx3YWsvVEN6QS9UR3N3OExLbmNGN1d2dlI2QkVWRnNzOW1iYVNzYzll?=
 =?utf-8?B?RyswMWpLMDRBN3k4VnJHUE85Vkg1aHN6RGd2OStWU3ljR0RrRk9UWm9sK0Rq?=
 =?utf-8?B?R09URGxQeVJBaGFDc3UrbXZ3a2YyekVPT1pwOHQ1aDN6aGp5SUxBWVZGSFlU?=
 =?utf-8?B?bUdYQXkwQkNYbWY4NWl5eE9Wb0hXeHY2NUdGYU1LeGU3TkVIZWFEdk1Ta3d2?=
 =?utf-8?B?QW1wLzFUbitnZHl6V3E1VENQN3ZrU3NNTjNKZWZVaVh2MXlJTkZCV21nMXJu?=
 =?utf-8?B?cXdLTzdFZkRsMVlLYnAxWmJlNkhYWHplMkRYZUNBL1d2eCtyYnlsTCtscm9G?=
 =?utf-8?B?dU5aNkEraVhqaXJHT2tjbDlCanRLZHpDYUkvRVRNbkJic0RhOEVwdmpwdUQw?=
 =?utf-8?B?WE96My9UcTc1QVhPczJjeUl0cjY3ZDVrYWtjeGRzQWxPbXA2Y0VTbUc3ZGN1?=
 =?utf-8?B?LytoVzNoZk5WOGwrQVlxV044N3BhMGFiL2NHb1hyaW55bU10dzVMamFyWXlt?=
 =?utf-8?B?elNiL1U5eldSOUF2a05LaEg5SzNhcFFBQW9zMm5MQWRLYXNMZW0ydThDbStB?=
 =?utf-8?B?Qk5vazFEeXBUUkpsaU0ybWtoWElGc2NJYkZNV0FoOXMxRWFuU0hMaUdyWjJN?=
 =?utf-8?B?T1VXWHYvaVpiSVZUMEo4ejgxRkZnMEw4OUwrMVB6YndaYlJ4VkNMQm1iVVB5?=
 =?utf-8?B?enloYytoOFQ1NDRzcS9TVENnRzJmTlQ3NW02dzB4Qm5tcHIrY2RDUFdlaUYw?=
 =?utf-8?B?WldLaFlURVFqVWxmdmduVzZWK0F6VHcvUmNBNmRaZTJ1aE81OHNHZTdIdDNB?=
 =?utf-8?Q?E/hEQTPSm1/gqGJDN9ZewAc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cfd875-9cad-47ed-1ecb-08db259c8412
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 21:30:36.5994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIVnHhOqzr5383O1ACHysC8Bw6L6/sFwOamTNgz2iVGHsWsn74YzdQZ720GFILvzS/cVvI14uW9b+Vrd6zBM5n0pHjvGsHKVpoGpRk4KgvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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



On 3/10/2023 5:01 PM, John Harrison wrote:
> On 3/3/2023 11:20, Ceraolo Spurio, Daniele wrote:
>> On 2/17/2023 3:47 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> A failure to load the GuC is occasionally observed where the GuC log
>>> actually showed that the GuC had loaded just fine. The implication
>>> being that the load just took ever so slightly longer than the 200ms
>>> timeout. Given that the actual time should be tens of milliseconds at
>>> the slowest, this should never happen. So far the issue has generally
>>> been caused by a bad IFWI resulting in low frequencies during boot
>>> (depsite the KMD requesting max frequency). However, the issue seems
>>> to happen more often than one would like.
>>>
>>> So a) increase the timeout so that the user still gets a working
>>> system even in the case of slow load. And b) report the frequency
>>> during the load to see if that is the case of the slow down.
>>
>> Some refs would be good here. From a quick search, these seems to match:
>>
>> https://gitlab.freedesktop.org/drm/intel/-/issues/7931
>> https://gitlab.freedesktop.org/drm/intel/-/issues/8060
>> https://gitlab.freedesktop.org/drm/intel/-/issues/8083
>> https://gitlab.freedesktop.org/drm/intel/-/issues/8136
>> https://gitlab.freedesktop.org/drm/intel/-/issues/8137
> Should these have a prefix tag? If so, what? 'closes' is not entirely 
> accurate. This patch is just to help with debug of the underlying 
> issue. And if the timeout is reduced then it won't necessarily allow a 
> slow system to work. See below.
>

For bugs we usually use either "References:" or "Closes:". I think the 
former fits more for this case.

>
>>
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 37 
>>> +++++++++++++++++++++--
>>>   1 file changed, 34 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>>> index 2f5942606913d..72e003f50617d 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>>> @@ -12,6 +12,7 @@
>>>   #include "gt/intel_gt.h"
>>>   #include "gt/intel_gt_mcr.h"
>>>   #include "gt/intel_gt_regs.h"
>>> +#include "gt/intel_rps.h"
>>>   #include "intel_guc_fw.h"
>>>   #include "intel_guc_print.h"
>>>   #include "i915_drv.h"
>>> @@ -139,9 +140,12 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>>   {
>>>       struct intel_gt *gt = guc_to_gt(guc);
>>>       struct intel_uncore *uncore = gt->uncore;
>>> +    ktime_t before, after, delta;
>>>       bool success;
>>>       u32 status;
>>> -    int ret;
>>> +    int ret, count;
>>> +    u64 delta_ms;
>>> +    u32 before_freq;
>>>         /*
>>>        * Wait for the GuC to start up.
>>> @@ -159,13 +163,32 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>>        * issues to be resolved. In the meantime bump the timeout to
>>>        * 200ms. Even at slowest clock, this should be sufficient. And
>>>        * in the working case, a larger timeout makes no difference.
>>> +     *
>>> +     * IFWI updates have also been seen to cause sporadic failures 
>>> due to
>>> +     * the requested frequency not being granted and thus the firmware
>>> +     * load is attempted at minimum frequency. That can lead to 
>>> load times
>>> +     * in the seconds range. However, there is a limit on how long an
>>> +     * individual wait_for() can wait. So wrap it in a loop.
>>>        */
>>> -    ret = wait_for(guc_load_done(uncore, &status, &success), 200);
>>> +    before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
>>> +    before = ktime_get();
>>> +    for (count = 0; count < 20; count++) {
>>> +        ret = wait_for(guc_load_done(uncore, &status, &success), 
>>> 1000);
>>
>> Isn't 20 secs a bit too long for an in-place wait? I get that if the 
>> GuC doesn't load (or fail to) within a few secs the HW is likely 
>> toast, but still that seems a bit too long to me. What's the worst 
>> case load time ever observed? I suggest reducing the wait to 3 secs 
>> as a compromise, if that's bigger than the worst case.
> I can drop it to 3 for normal builds and keep 20 for 
> CONFIG_DRM_I915_DEBUG_GEM builds. However, that won't actually be long 
> enough for all slow situations. We have seen times of at least 11s 
> when the GPU is running at minimum frequency. So, for CI runs we 
> definitely want to keep the 20s limit. For end users? Is it better to 
> wait for up to 20s or to boot in display only fallback mode? And note 
> that this is a timeout only. A functional system will still complete 
> in tens of milliseconds.

I'd argue that the only way for us to go to multiple seconds is if the 
frequency goes below the efficient levels, which normally should only 
happen if the card cooling fails and the temperature goes out of 
control, in which case there are more pressing issues than a GuC load 
failure. I agree that having 3 secs normal and 20 for CI is a good 
compromise and if we ever see a very long timeout in CI we can 
investigate more.

Daniele

>
> John.
>
>>
>> The patch LGTM apart from this point.
>>
>> Daniele
>>
>>> +        if (!ret || !success)
>>> +            break;
>>> +
>>> +        guc_dbg(guc, "load still in progress, count = %d, freq = 
>>> %dMHz\n",
>>> +            count, intel_rps_read_actual_frequency(&uncore->gt->rps));
>>> +    }
>>> +    after = ktime_get();
>>> +    delta = ktime_sub(after, before);
>>> +    delta_ms = ktime_to_ms(delta);
>>>       if (ret || !success) {
>>>           u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>>           u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>>   -        guc_info(guc, "load failed: status = 0x%08X, ret = %d\n", 
>>> status, ret);
>>> +        guc_info(guc, "load failed: status = 0x%08X, time = %lldms, 
>>> freq = %dMHz, ret = %d\n",
>>> +             status, delta_ms, 
>>> intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
>>>           guc_info(guc, "load failed: status: Reset = %d, BootROM = 
>>> 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>>                REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>                bootrom, ukernel,
>>> @@ -206,6 +229,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>>           /* Uncommon/unexpected error, see earlier status code 
>>> print for details */
>>>           if (ret == 0)
>>>               ret = -ENXIO;
>>> +    } else if (delta_ms > 200) {
>>> +        guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, 
>>> before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
>>> +             delta_ms, 
>>> intel_rps_read_actual_frequency(&uncore->gt->rps),
>>> +             before_freq, status, count, ret);
>>> +    } else {
>>> +        guc_dbg(guc, "init took %lldms, freq = %dMHz, before = 
>>> %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>>> +            delta_ms, 
>>> intel_rps_read_actual_frequency(&uncore->gt->rps),
>>> +            before_freq, status, count, ret);
>>>       }
>>>         return ret;
>>
>


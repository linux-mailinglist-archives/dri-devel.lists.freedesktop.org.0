Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54866A51E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B6F10EAFC;
	Fri, 13 Jan 2023 21:29:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C32910E206;
 Fri, 13 Jan 2023 21:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673645381; x=1705181381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X5VYvRHSdWxe1pUfnsyRbRZ1iWnGaDRZUS/hf2Nquo4=;
 b=bFK9mKtD0z8OowbUZ2g6q3WgF3gvT+Xpt/CgTXtgwfPbGcfH3FoMf8Wz
 MwG0qKkcBv5BSmnD+VUN+MpXNGwDiQzwmPIYtDNX5ZsPJMgflnxadGlPM
 1tPPugMdp1FpuWz3gacKCwI0wzROkX5eRjZtVT8pOQyT8jCmL2PDdVTmX
 ocpBqeXaduped6tk49TyPYQcegRHTK4Vdd5mkNBikA1OY8LUzOWayeqUY
 qXgnscTpvIbkYaloPZHcWrU+xsmYHgblcd7qZKJnw1Xes8PivPzGGx3l8
 5WmW/Osw0cndto3edDolhJcvtj+SY/hXwoDLp9rsbhbNgiD2i4W8PHhfl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="325362429"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="325362429"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 13:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="903703868"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="903703868"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2023 13:29:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 13:29:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 13 Jan 2023 13:29:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 13 Jan 2023 13:29:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2ulbH+besSOCIuNBEAq5gEIkgvMzD24vNcYdGl+tTu1bjraqF9BI4h7e9Yy9J6PFOjl3Cw/qwGOLeIQuhtu69RiQhnNOgPKEMt1Uz59CImigje8vTAZM37E3LUJdK0DkntBEgZMhZgCIpt7Lz9OduzEHgtToeF4boZUsIql9JoLjdVRv4bgXcqVHEr6cwyreoClxlwq9pKkPzBGGJQfzoJ28LXbXK6T/1F0HZdv+7jbC2yX9+W09gLWqJ1aFbi6WqhoaqFAalC5U3/awkq0M/fUOxXsnzVMUklGLYRt1Xl5G18bpk8TRtFaglPcX56yHXpBZpwI7jtaSCcRZK9Ktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szeeoLXJ6kFOTl+vm4lnyzS3ILaK7psDwDicYGgWd4I=;
 b=FeKdUKz6dhXRHfMF5p0zJXeR7YV2WnEK290yTWXOEBaXhqmFkVzrVPmWzb8atkoXwjBJVoNMMYYVp5l5n1LWZzhXBky59NCCvWofWfhZ6mYcsRINCf2Pwp1XRKWryvFMig1L0WGTPlaShqDAp8UMlR9cumlpeCFIfmklbx1VZDn5SAYjc7WFV3FGeg0/7cSPTc6QLgsVnMpuPmiwQt1AQecRvC9BgQ/GzsdAQmRYMuLPEZcmvaRbdzrBLbqZIkzw8hRsImeM9Z9vWR30SpdTWogZHPL7lM1oWXgZv2itoYC7p/MY6ucEo7BKB4ucgRkMeoEsr87YnK2H1tiluy6KlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 21:29:37 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::2ab4:2e6e:8d24:4d2e]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::2ab4:2e6e:8d24:4d2e%4]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 21:29:37 +0000
Message-ID: <0b0f59dc-d50f-f491-ad0c-9030b799830e@intel.com>
Date: Fri, 13 Jan 2023 13:29:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Allow error capture without a
 request
Content-Language: en-GB
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-2-John.C.Harrison@Intel.com>
 <f5edb1fa-6aba-1e02-f238-518518337f11@linux.intel.com>
 <79cd935a-5a7f-b709-ec05-c9cf5801f2dc@intel.com>
 <4acf4db5-97e9-34dc-2b89-517296ce4c3c@linux.intel.com>
 <7316954666eecb39aef79067bc590e58bee48389.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7316954666eecb39aef79067bc590e58bee48389.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|DM4PR11MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee0718d-f50f-4cd9-8828-08daf5ad4584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9GUUwRUJZAnz60zt8GMSHZIhf/0fuiiD2mMMwU2hm43+0Gm3ZJsypoRcYcBtv+wVv6icN55iEn4S632S0OXt3aIIenpQULMgWZQKEPtPHZ7EN08iIv8NWeY2VercHGkDXCHkEDWFgTZFfaRBKu1z7ZoKKFqdsNwEsUBSORfQzLV2udpCVPqDA69i3gAbD/DfSuT95rFrDhrThtucTz10Vr0wPne0Jf4NjvBH2V5IyRjIFOI7p2of8TvQeJUZXF01QKUb7MKbcLldKbzfCGX42xMMdl2Vo2FaVUcJjHahhxSjmF/9OCJXV4T2kHimjMz45wy6Rn1RmpobClIM14AkK2leWW37eGBOQPLkt16ARypy7ZAgViZxOhFPEkh2rC3FZ4UnxgGGILL6b0H4i8D521NH7JnUnwCcI7ScG5UK37MzrqI+ZAa9orc1/aERiBIkN1FfcI40WwrqCcpUEJRFDg6PZiFsp4LETrNIKxT0XtZ/fn/uQZB6eo/JqrrUYPX0wMqHnP+k+qTsqnW+DRzy5N+JajMz9XMvX15VHMSxeHc3i/LfcP9wMTYfwZJKn6OChBtbTvAZ0n9+7eR9VgaMBNg3YbYfQV7PqGPEDyzK3zNhzdO8mLfA3VPZurn9R5b7oehM1anzUuFxtAUlDLxrXnEcPEcLUxpiBhEo8JqqxtuswreG60igHBBEnUkrGNogO/abuO0C0xyBwyNp7tKjlgvdYY7C12SQuf1bq/3GUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(82960400001)(6666004)(31686004)(53546011)(2906002)(6486002)(478600001)(5660300002)(2616005)(30864003)(86362001)(6512007)(186003)(316002)(26005)(8936002)(36756003)(83380400001)(8676002)(31696002)(41300700001)(66556008)(66946007)(110136005)(54906003)(4326008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFo2OVM1dUM1QUVtTUNKYlZWdUdQeVhRbEZ2VUVLVGJkVkNXUCtCeml6aXYy?=
 =?utf-8?B?V1kxMEVJcm92ZmNDNVNqN2MyN0F1ditzdGhVQ1pmMXBKMzN6bnoyenkwVzVG?=
 =?utf-8?B?WUoyMllpdTVjbXNiM0F3eHhtZUdwZFA0T0RVZ05QUjNHWk5DdW00NEJPZENo?=
 =?utf-8?B?QW9zSG1yWi8rOWhhWC9ONmZOUWhZZExqOXZ5YlBnbUhlV3dIZVFybFZGenFG?=
 =?utf-8?B?NWpuaXRGeHpmK29aUVFWd09DRXZoZkpUamtWQXJFbzhMN3hLSGMwZVJxMHhB?=
 =?utf-8?B?TVB6R2ZibGJ3MzBNQjhHVG9QUkJKZUEwUHdGZDZWN0o2UUtFazRGTFcwaVNN?=
 =?utf-8?B?TFRqNm5Ob1pUb25zVkp2SHRjWjRLRzdpUnRhL3JhZFNYUkU1b3JyZmVkQ1Yz?=
 =?utf-8?B?T2ZTNkJTN2E4REtVQmJ6SWdYU3ZlNkt2WGM1ZU1Vc2xNWkVFWTBNejFkb2ZO?=
 =?utf-8?B?Z0d3YXlqWmcyZS9RVmxEL3h0RDRqYjltVVdBbmdzMU4yQWVoSzVmOWs3dXd3?=
 =?utf-8?B?UCszZGs2ZHY1WlBqQzI2eDg0ZGM0Q3JmWnBGVEFnYWUzUkdJSlhYWDZNNzNx?=
 =?utf-8?B?SzFSTnFJOVhQZ2doU01la0JaRnhLSURESFBQSVBhRkphUWQvRFlhSWhSTTlS?=
 =?utf-8?B?cHNYaTVjR0NzLzBHWkxVOU5IdGpieHpiaXRydlJWZVVRbk9pQWx4M1dlZDRl?=
 =?utf-8?B?SFJoczdPR3JHakF4M2V1UkI4R1ZNTFpKb0I5M2tvU2xha3Z6U29vMG5rcjhs?=
 =?utf-8?B?UmVoa3M1ZWhwMG5acWx2Q2p0bDJ4TktaOCtscjZ0R1FzeVZvM2tWR211TTVS?=
 =?utf-8?B?dzhKbC9yOEQ1VXVvSk5rUkU2MDBZdi9WT0ZQUFhJY1VFWFpzZjlCQmFld1lD?=
 =?utf-8?B?dW0yeUgrZlNycC9HNERiYzRYMXNIV1JGQ0FMa0o1bmFpZDduUDNwNmR0V0t6?=
 =?utf-8?B?SXh3aW42UFB2NytNcURHYkxROWtUK0xqcTIydXdkUmU2R2ZFbFRpcjNpNDNm?=
 =?utf-8?B?cFZqL3ZHTlJyWTZzZUpwL08xRW9VNjN1d1RFL1h0Q0ZZNmtFUm5UWjhUR1pn?=
 =?utf-8?B?UVdMTUFJR2pZM3RLc0JvbktkMWNWSkwzc3VIdGxZb1dVOEVnYVlHMzUzUldz?=
 =?utf-8?B?QUE3a3MweEswcCs2a1VEYXpsQVpxMUV5YWl1UHlZaVJ1clY2ZjBXeklSQ2xj?=
 =?utf-8?B?aHZ3UlBJT2JEMVhsTmJ4Z215V2JyUENYQWt0R0gwZnNJUnVtVDY2OFVBT0Zk?=
 =?utf-8?B?QXp1WjZpMldoVE9QZU9VRm4vNFlaUE54TUJRUEdlQ00xOGt1TyswNDgxSkFZ?=
 =?utf-8?B?Q2lNUm1oRXprcDVLeWhtbDQ3Y25GTW9BaFY4Zk9FR05GcDZ5WHZqN1hSbmY1?=
 =?utf-8?B?bVpzWTkvMmpIZTRjUllKd1NqSm9mdGNKUytuVSswaWxRVnJlUUlEa2FJN3pp?=
 =?utf-8?B?M0ZUbmI3Z2NaZTJSUFV1ZEorWWpvZzFySks1VkVPWVl4dDZNbm16d0RNemtE?=
 =?utf-8?B?WkxTMlVkUG1WZzFOcnZWeklhZ2xUbkRtVDZUL3FEbWNJNVF6ZVk3MFltNXFQ?=
 =?utf-8?B?NFp6WGphQjl4dytPWEJkbWhUbnVkbWpkNlFpUlZsYzBEenZxZE54L0ozN3FO?=
 =?utf-8?B?V3BBRjJHVjNVdVFsZ3VqTjFqd2UzTGEvamNEOS85bmlaOWprOFZvelRiRG82?=
 =?utf-8?B?MzdSR1htK3hzTUJ5Q1I0TEhwK1hqNjliVnBIdmJhZ0RtV1FNZ3BwODRZT0ow?=
 =?utf-8?B?SzhWMDh2Q01nV1YrR0o4SE10eVJZR2Ewd1dZb0llTmw5ZXFaTEpRc2ROSHYw?=
 =?utf-8?B?b3g4NTJsMHBtUGFPbmRVbW5SNjNVV0pGTXFvV01RUUE3S2IxVnRnOE9mbUJ2?=
 =?utf-8?B?QWEramVZNHFDZU1UN1pnbm5JMmtCbmVTV3JnaWdrZmQ1cjB5ZEZ6N014Zlhr?=
 =?utf-8?B?RjZCdGRlaGt1SmFLSGhvVURtQmptdjBmR040ZGJveVlFK2pFK1IzOWhsanQy?=
 =?utf-8?B?blE2ZkFYNmhuTGxwcGFMYkJac2Z3aUpEelpucUowQ0dqMkVBck00NWxoQW9K?=
 =?utf-8?B?Q1lKN3pBRGFONlRMWUlHNHpPdmpNUmJ0UGxtYzd3UGs0Z1dBOTlhb1RNVVlo?=
 =?utf-8?B?ZnBpRjdJamkxYnFBbUk0NSs3ejlZWEtXV2tIUTQ2eUhqM3AyZVRmbVFPMEdx?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee0718d-f50f-4cd9-8828-08daf5ad4584
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 21:29:37.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U3NOBV3y/GVB7M4ZD6RWwTySiTMbdgIXzEB1uZeTi5wsxatJi/BQAwnGjj+mKkomRw/w9q8YCAFWnmqPXA9L2hAbUuCglSA9yMbbg8ueSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/2023 09:46, Hellstrom, Thomas wrote:
> On Fri, 2023-01-13 at 09:51 +0000, Tvrtko Ursulin wrote:
>> On 12/01/2023 20:40, John Harrison wrote:
>>> On 1/12/2023 02:01, Tvrtko Ursulin wrote:
>>>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> There was a report of error captures occurring without any hung
>>>>> context being indicated despite the capture being initiated by
>>>>> a 'hung
>>>>> context notification' from GuC. The problem was not
>>>>> reproducible.
>>>>> However, it is possible to happen if the context in question
>>>>> has no
>>>>> active requests. For example, if the hang was in the context
>>>>> switch
>>>>> itself then the breadcrumb write would have occurred and the
>>>>> KMD would
>>>>> see an idle context.
>>>>>
>>>>> In the interests of attempting to provide as much information
>>>>> as
>>>>> possible about a hang, it seems wise to include the engine info
>>>>> regardless of whether a request was found or not. As opposed to
>>>>> just
>>>>> prentending there was no hang at all.
>>>>>
>>>>> So update the error capture code to always record engine
>>>>> information
>>>>> if an engine is given. Which means updating record_context() to
>>>>> take a
>>>>> context instead of a request (which it only ever used to find
>>>>> the
>>>>> context anyway). And split the request agnostic parts of
>>>>> intel_engine_coredump_add_request() out into a seaprate
>>>>> function.
>>>>>
>>>>> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of
>>>>> a null
>>>>> pointer.
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> Reviewed-by: Umesh Nerlige Ramappa
>>>>> <umesh.nerlige.ramappa@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/i915_gpu_error.c | 61
>>>>> +++++++++++++++++++--------
>>>>>    1 file changed, 43 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> index 9d5d5a397b64e..bd2cf7d235df0 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>> @@ -1370,14 +1370,14 @@ static void
>>>>> engine_record_execlists(struct
>>>>> intel_engine_coredump *ee)
>>>>>    }
>>>>>      static bool record_context(struct i915_gem_context_coredump
>>>>> *e,
>>>>> -               const struct i915_request *rq)
>>>>> +               struct intel_context *ce)
>>>>>    {
>>>>>        struct i915_gem_context *ctx;
>>>>>        struct task_struct *task;
>>>>>        bool simulated;
>>>>>          rcu_read_lock();
>>>>> -    ctx = rcu_dereference(rq->context->gem_context);
>>>>> +    ctx = rcu_dereference(ce->gem_context);
>>>>>        if (ctx && !kref_get_unless_zero(&ctx->ref))
>>>>>            ctx = NULL;
>>>>>        rcu_read_unlock();
>>>>> @@ -1396,8 +1396,8 @@ static bool record_context(struct
>>>>> i915_gem_context_coredump *e,
>>>>>        e->guilty = atomic_read(&ctx->guilty_count);
>>>>>        e->active = atomic_read(&ctx->active_count);
>>>>>    -    e->total_runtime =
>>>>> intel_context_get_total_runtime_ns(rq->context);
>>>>> -    e->avg_runtime = intel_context_get_avg_runtime_ns(rq-
>>>>>> context);
>>>>> +    e->total_runtime = intel_context_get_total_runtime_ns(ce);
>>>>> +    e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>>>>>          simulated = i915_gem_context_no_error_capture(ctx);
>>>>>    @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct
>>>>> intel_engine_cs *engine, gfp_t gfp, u32 dump_
>>>>>        return ee;
>>>>>    }
>>>>>    +static struct intel_engine_capture_vma *
>>>>> +engine_coredump_add_context(struct intel_engine_coredump *ee,
>>>>> +                struct intel_context *ce,
>>>>> +                gfp_t gfp)
>>>>> +{
>>>>> +    struct intel_engine_capture_vma *vma = NULL;
>>>>> +
>>>>> +    ee->simulated |= record_context(&ee->context, ce);
>>>>> +    if (ee->simulated)
>>>>> +        return NULL;
>>>>> +
>>>>> +    /*
>>>>> +     * We need to copy these to an anonymous buffer
>>>>> +     * as the simplest method to avoid being overwritten
>>>>> +     * by userspace.
>>>>> +     */
>>>>> +    vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>>>>> +    vma = capture_vma(vma, ce->state, "HW context", gfp);
>>>>> +
>>>>> +    return vma;
>>>>> +}
>>>>> +
>>>>>    struct intel_engine_capture_vma *
>>>>>    intel_engine_coredump_add_request(struct
>>>>> intel_engine_coredump *ee,
>>>>>                      struct i915_request *rq,
>>>>>                      gfp_t gfp)
>>>>>    {
>>>>> -    struct intel_engine_capture_vma *vma = NULL;
>>>>> +    struct intel_engine_capture_vma *vma;
>>>>>    -    ee->simulated |= record_context(&ee->context, rq);
>>>>> -    if (ee->simulated)
>>>>> +    vma = engine_coredump_add_context(ee, rq->context, gfp);
>>>>> +    if (!vma)
>>>>>            return NULL;
>>>>>          /*
>>>>> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct
>>>>> intel_engine_coredump *ee,
>>>>>         */
>>>>>        vma = capture_vma_snapshot(vma, rq->batch_res, gfp,
>>>>> "batch");
>>>>>        vma = capture_user(vma, rq, gfp);
>>>>> -    vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>>>>> -    vma = capture_vma(vma, rq->context->state, "HW context",
>>>>> gfp);
>>>>>          ee->rq_head = rq->head;
>>>>>        ee->rq_post = rq->postfix;
>>>>> @@ -1608,8 +1628,11 @@ capture_engine(struct intel_engine_cs
>>>>> *engine,
>>>>>        if (ce) {
>>>>>            intel_engine_clear_hung_context(engine);
>>>>>            rq = intel_context_find_active_request(ce);
>>>>> -        if (!rq || !i915_request_started(rq))
>>>>> -            goto no_request_capture;
>>>>> +        if (rq && !i915_request_started(rq)) {
>>>>> +            drm_info(&engine->gt->i915->drm, "Got hung context
>>>>> on %s
>>>>> with no active request!\n",
>>>> Suggest s/active/started/ since we have both i915_request_active
>>>> and
>>>> i915_request_started, so to align the terminology.
>>> The message text was based on the intent of the activity not the
>>> naming
>>> of some internal helper function. Can change it if you really want
>>> but
>>> "with no started request" just reads like bad English to me. Plus
>>> it
>>> gets removed in the next patch anyway...
>>>
>>>
>>>>> +                 engine->name);
>>>>> +            rq = NULL;
>>>>> +        }
>>>>>        } else {
>>>>>            /*
>>>>>             * Getting here with GuC enabled means it is a forced
>>>>> error
>>>>> capture
>>>>> @@ -1622,22 +1645,24 @@ capture_engine(struct intel_engine_cs
>>>>> *engine,
>>>>>                               flags);
>>>>>            }
>>>>>        }
>>>>> -    if (rq)
>>>>> +    if (rq) {
>>>>>            rq = i915_request_get_rcu(rq);
>>>>> +        capture = intel_engine_coredump_add_request(ee, rq,
>>>>> ATOMIC_MAYFAIL);
>>>>> +    } else if (ce) {
>>>>> +        capture = engine_coredump_add_context(ee, ce,
>>>>> ATOMIC_MAYFAIL);
>>>>> +    }
>>>>>    -    if (!rq)
>>>>> -        goto no_request_capture;
>>>>> -
>>>>> -    capture = intel_engine_coredump_add_request(ee, rq,
>>>>> ATOMIC_MAYFAIL);
>>>>>        if (!capture) {
>>>>> -        i915_request_put(rq);
>>>>> +        if (rq)
>>>>> +            i915_request_put(rq);
>>>>>            goto no_request_capture;
>>>>>        }
>>>>>        if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>>>>            intel_guc_capture_get_matching_node(engine->gt, ee,
>>>>> ce);
>>>> This step requires non-NULL ce, so if you move it under the "else
>>>> if
>>>> (ce)" above then I *think* exit from the function can be
>>>> consolidated
>>>> to just:
>>>>
>>>> if (capture) {
>>>>      intel_engine_coredump_add_vma(ee, capture, compress);
>>>>      if (rq)
>>>>          i915_request_put(rq);
>>> Is there any reason the rq ref needs to be held during the add_vma
>>> call?
>>> Can it now just be moved earlier to be:
>>>       if (rq) {
>>>           rq = i915_request_get_rcu(rq);
>>>           capture = intel_engine_coredump_add_request(ee, rq,
>>> ATOMIC_MAYFAIL);
>>>           i915_request_put(rq);
>>>       }
>>>
>>> The internals of the request object are only touched in the above
>>> _add_request() code. The later _add_vma() call fiddles around with
>>> vmas
>>> that pulled from the request but the capture_vma code inside
>>> _add_request() has already copied everything, hasn't it? Or rather,
>>> it
>>> has grabbed its own private vma resource locks. So there is no
>>> requirement to keep the request itself around still?
> That sounds correct. It was some time ago since I worked with this code
> but when i started IIRC KASAN told me the request along with the whole
> capture list could disappear under us due to a parallel capture.
>
> So the request reference added then might cover a bit too much now that
> we also hold references on vma resources, which it looks like we do in
> intel_engine_coredump_add_vma().
So that means we end up with:
     rq = intel_context_find_active_request(ce);
     ...
     [test stuff like i915_request_started(rq)]
     ...
      if (rq) {
         rq = i915_request_get_rcu(rq);
         capture = intel_engine_coredump_add_request(ee, rq, 
ATOMIC_MAYFAIL);
         i915_request_put(rq);
     }

What is special about coredump_add_request() that it needs the request 
to be extra locked for that call and only that call? If the request can 
magically vanish after being found then what protects the _started() 
query? For that matter, what stops the request_get_rcu() itself being 
called on a pointer that is no longer valid? And if we do actually have 
sufficient locking in place to prevent that, why doesn't that cover the 
coredump_add_request() usage?

John.

>
> Another thing which is crappy with the current error capture code is
> that the request capture list needs to be freed with the request and
> not when the request signals (We can't block request signalling in the
> capture code to keep the capture list around). There might be many
> signaled requests hanging around in non-pruned dma_resv objects and
> thus many unused capture lists with many unused vma resources. :/
>
> /Thomas
>
>
>> Don't know.. it is a question if changes from 60dc43d1190d
>> ("drm/i915:
>> Use struct vma_resource instead of struct vma_snapshot") removed the
>> need for holding the rq reference that "long" I guess? Adding Thomas
>> and
>> Matt to perhaps comment.
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>> John.
>>>
>>>
>>>> } else {
>>>>      kfree(ee);
>>>>      ee = NULL;
>>>> }
>>>>
>>>> return ee;
>>>>
>>>> No "if (rq) i915_request_put()" twice, and goto label can be
>>>> completely removed.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>          intel_engine_coredump_add_vma(ee, capture, compress);
>>>>> -    i915_request_put(rq);
>>>>> +    if (rq)
>>>>> +        i915_request_put(rq);
>>>>>          return ee;


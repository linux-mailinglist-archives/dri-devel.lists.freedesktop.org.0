Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A593467E93
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 21:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C867BF6D;
	Fri,  3 Dec 2021 20:01:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F6C7BF6B;
 Fri,  3 Dec 2021 20:01:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="323302210"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="323302210"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 12:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="610532455"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga004.jf.intel.com with ESMTP; 03 Dec 2021 12:01:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 3 Dec 2021 12:01:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 3 Dec 2021 12:01:33 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 3 Dec 2021 12:01:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m70k/Wi6Il2+jXUytCekEdwKehju6Qgd+i5bHQPgRocp2zSvoWJ8PD1oWc4mo2CC8OeuPfOYq/Ke07K+6xnCBOoTkT+ADlpNZWex+unBoQPAp9YpXgrTaUl9U+cWEODF9Zk3Y21UMpx5/PHnOH7g2awfMYyXFV47aqIACEvbTAtdSV5tiyDH0oUVfvuFiQsb2DwgToqDOe39wT08LLNgFjV740E5Ukr/e3ifgCjdtoYXuKsmEQIHjT0x4trVD+VHRT0e7fAOagFQG7M+jGn08pIyntWE/uk6pQla/5Rp+jrYeg12zYmp5TE21M+lTponiQrBBXoFlyVKTRd8lOiFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HauGc2+NCfgrDI9a+jLHimYEEv05xcR5bCDOxVxhM/I=;
 b=F3atfcFUYDw77ZETgbuqdW5a1tDcjWetJw651cET4SbJQd3iaZ3mXoBeNZO9Txw0ymimjawgyV3wnlDF9qqLUyHJpINQYQBo3qNa4oY2eFSpBOZewQRT20BwsXK9MBfgqeBIYQAC7EfEiQNUJ3A7OE4bmvZoVi7ytWg87Io6K+A4+GCYyjIWdFcyTMI2AFqYhCCSzGq+38aonX/lO6mDpfmFHYa9H9E6iCY2Qk7z3TJHfrhgeK7MnrmAi/pPFpb9rLydZb5pWRvamjIpmINIRGJMGS89tjUE7gGJCcS1tJsBC1rZYQY5bqqj77x0Vbm9/UbH1I5mLgLmwmJtVN+zIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HauGc2+NCfgrDI9a+jLHimYEEv05xcR5bCDOxVxhM/I=;
 b=y8D3gCuLBfw+IdW2k8bjN1DUjznTHrM+pt+7TtrFc0hC9WIDkADMoQh5hbPqXF7KUNOh0070Fl+8PY3bbQX1z1CA2kZSxrj+3R3eLWNZYIQZp04TQlYV37kWLjkoSndWJbOXLIHSC2SNu/QRElL/I4hzT6dhXnYe/TmdhpZgl8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH2PR11MB4262.namprd11.prod.outlook.com (2603:10b6:610:42::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 20:01:02 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::5cf1:dc2c:8ea6:ba97]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::5cf1:dc2c:8ea6:ba97%5]) with mapi id 15.20.4755.015; Fri, 3 Dec 2021
 20:01:02 +0000
Message-ID: <d2ea5d3b-2b53-8aa8-8a6e-dec024f573ac@intel.com>
Date: Fri, 3 Dec 2021 12:00:59 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Don't go bang in GuC log if
 no GuC
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, <John.C.Harrison@intel.com>
References: <20211203000623.3086309-1-John.C.Harrison@Intel.com>
 <20211203000623.3086309-5-John.C.Harrison@Intel.com>
 <20211203003307.ju75hmimn6sfhfmk@ldmartin-desk2>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211203003307.ju75hmimn6sfhfmk@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
Received: from [192.168.1.65] (99.72.232.53) by
 BY5PR03CA0011.namprd03.prod.outlook.com (2603:10b6:a03:1e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Fri, 3 Dec 2021 20:01:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4419a2ba-469d-4f3d-d7bc-08d9b697a1f2
X-MS-TrafficTypeDiagnostic: CH2PR11MB4262:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB42623D81683BA2A73A855FC5F46A9@CH2PR11MB4262.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbRcrUwyRQNjzkXR5JOXjV15hq8zbmHQhAHTEqgC5LBRKuUKYihNIYHtquqb64lDAOwTT8/dBlPThwRMu/UYdpUNtuzSsuTOOFEA6F24oUpehhBA1xbOriZdq4A4nMYW6KoRHtsdbQqcD4Rv1Y6AZkP73fgUoAQpyh6kCsyk1dByD2XISXrrhh+4F+et4ZhwZ0Eh17zjEt/qjtcXT/S7PIXQ2dix00/WzuDC438wSeIUx1vCn3sOFjJfNL02TEDvkZBoBu1jP8WdcR13u3tV2+n98xzOQoYZFNih2HEBm2SuB7Xji+5ybOX8r683dxAakBWFoPKEnAh4Tqbqbvpxbky5oSjtz59z6MK2p39GTGhZrR5ID2W6cTvyskhybL2c2rN0KXAWCqlAs8KLG4AjsQ7YXRpvY7YCLbOkgYysUCsnuqoUnzh1r59rE9tOrlZ2khf7URFRp9fTn2E3Kd+S7ir0Q1lpEeJqApOCqpfaC51L9G4Q9k1wQUJ/KrIEqJos4lCQgD4UXOQlqTj/DuOj3JSVlPusjyRVfzp+7MVgaD5OmZLljmxzC973iKt4A8fUIsog5QxsBaRZRBTEC3k1mS+K+TiLmQIOB6+1s2RBrO3riLpCVW8jbDLaYQ+PVGkAC1/aEGqXxMWIZv/SuZSkWul4AD+OoWJvK6HW4Mxt5U9VX7zIPr2mw0ym829/6/Zk+aDh7xzhwGDeAEaW4XVxXJ/zZrj+iTTl7PVyPi1PVNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(4326008)(82960400001)(450100002)(66476007)(66556008)(508600001)(86362001)(6486002)(66946007)(8936002)(16576012)(5660300002)(31686004)(186003)(6636002)(53546011)(8676002)(956004)(38100700002)(36756003)(31696002)(83380400001)(26005)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ry9SRHo5QTcxcndXZFFwSzdjdGxpbGE2OVFDTGdrcy8zQ3VTeWo3ZllRMThR?=
 =?utf-8?B?ZDZZVGw3WTZjb1RIOXIvSHBMaFQyVnB0TkFKVlhlL2FUbW8xYWQ1N3B5b2Fq?=
 =?utf-8?B?NHhNeEhyODE0MUhrWnY1eVJwYVJEUi9zYm0xN1lRRFNjSXRndmJnK2ZaUWhP?=
 =?utf-8?B?bHBJc0ZET2ZIZ0VCUTZtNmVsUXdLMnlGUjR3USs3QVRxL0NOTVBVZG9RVkJ0?=
 =?utf-8?B?ai9KZkM0ZmMwYlBBMzBLTk9XN2ZSTlI1S05oYUQ5V2doT3hzTmJWTEY4aUo2?=
 =?utf-8?B?cUdWNkZXZk1RYkdlZVFIQWsrNE0wR1Mxa3FiTHlYeUxPbDJOYktZczlDSlRu?=
 =?utf-8?B?Sm1oZ2hpdE54ckZUeXdYQ2x4S2JqZzNnSWRwbDdyYk03U3pZOWgrc3dVNk12?=
 =?utf-8?B?Qm8zZk9jWjZ6bWdoMTRrODVQZHQ5Sm15R2U3SHVLeHlTeElyb1lWTXY2MXY2?=
 =?utf-8?B?ZXJTMTlJR3R2bEhFLzFzQ2pTTG9aOFlmK05laytxUnpqaU9VNDVuNVZ2Yjdm?=
 =?utf-8?B?dVJyY1hGelN4OTMwcHRmY2w2NUV0RGtmWmoxeXFpWXV1VzFJMkJEb3ZmSzdO?=
 =?utf-8?B?RHpWaXJrL0pjZUptU0RIOXNuMFljaS94TWJRYkMvanh1USs4enVjUDNsV2Vr?=
 =?utf-8?B?RFh3elJUMk5aSFkyWE1JVkZmRjVBSGUzcHBiVWgyelNJNk9NZUhkc2c1WkpF?=
 =?utf-8?B?T0NGaGVvZHpjOXBYUW91S2xTSS9KWE5jQy9QdHRMeWpuQUsrKzA0THd5OFpP?=
 =?utf-8?B?RXNHNjJYejJqRzVZUHRVYUpVVmdpRjhKUngvZjZ1Q01PdXQrQUdodnp3TWgw?=
 =?utf-8?B?RlgwdVJqN0NmN3pQdEc5Wm0vSy81ZXpLY2MyQVI1bzhQTEdDb2U4R21FVWs2?=
 =?utf-8?B?SmRUa2N1Y0JaL3NMNnVuUkhCMFJ3QUt1QmhzdEdZMkF5SnN6bE4reFNwMzQy?=
 =?utf-8?B?WlNrb3pxS09ZYWxnUDZRNE95eHpMYzdPMXlMNXUxbnJUUzRsN210dHY4M25J?=
 =?utf-8?B?QUI4MGJTTmszWVNMVXhRbUJtWmVOMU04MW1KbHNIMlEzVGx1amcvL1d4bmUv?=
 =?utf-8?B?cmQzakdaUWtlN0RPSmFYVTY4U211YWVmMW1Rc2FpQzBwZEdJUmRTc2hsU1FG?=
 =?utf-8?B?bkRodTJlbUR2QVRSVlBNVHhZeEZ5eEJnNTM1eVB5ZlhDSnEwWUhJM0ErOWVG?=
 =?utf-8?B?UXlzWEp4MGYrNkRsUmZGR1BWVG10T3hHL3F0UVVBQjFveUJKYWg5aUpKd1hP?=
 =?utf-8?B?U1h5TVNOVFlmWUtBN0wxUk9YWjkyNTVxMUdYcDhUZS94dHlLVVozUFQwWW1s?=
 =?utf-8?B?c1Z2VWRURVM2SjB1cUFWenFyN05IcG4yVWlENzEwSGQwM2NGR3AwZjZLR0tm?=
 =?utf-8?B?ZDNVQm5udTJEUW5GVzFuR0lFZjJRWmxyYXVTSHVKRUw0bllPSUlwT1RoTlVv?=
 =?utf-8?B?a2ZVNnFXdnl0QjJEYWNmU3FQU3A3QksvNnFlNmt3NnQ1NDNML000UEs5d1c4?=
 =?utf-8?B?cUpONEJsaGhsRFZiZDNta0diR25CczBlaEdkZ2ZOWkk5K1pJY0xaeGR0NlV1?=
 =?utf-8?B?anZRY1Noa0R0a254SzNJbitTbnpER3lZRWRUUkk5U1VwV3VDVlMvd0sxajB1?=
 =?utf-8?B?QTZKeW1BWU4yUlhXOXNwRGZ6aG9oOVVIVytSWDdXVkJPeGswR0JZMVFCOGFX?=
 =?utf-8?B?Y0xNQzZUS0lSenRRUTlSMm84ekxoRytmckgrU3BVM2RiWXNWanRIWmlhcmNS?=
 =?utf-8?B?bHpWVmpHZDNDdmVZTEQwWmNNSG9kY0t0enBTajNnYVlDejByUXF5ME1YYVVK?=
 =?utf-8?B?b3RBRGtEOG90NE5jT3c4R2pDZ0F3K3dsSW84enk5VzlmcTJjWUl4Z2paRWcz?=
 =?utf-8?B?b2JJUVRpRTlNeGdONUZxV28wb2NxeEkyZ2tzcThsUmE4NndTQlRLelkzeExv?=
 =?utf-8?B?MDZ3M1Q1WE4yeEpMMGZKT2hXck4yZG1CRWhuVXVlYUthUXN0bEhaMFpidktp?=
 =?utf-8?B?eVFrU2s4aklURW0xdDFDZGxPZ3hHR3gwNzNHbjdLVzVoSzZPNHhyc3F5L2FE?=
 =?utf-8?B?MklkUDZXN3FWejF4ZWdMWmJTc1hPUjVxcjZPSWpvY2lGa0RIYkNPWkphc1Yy?=
 =?utf-8?B?bjVuNFNReWJka1V2VUR2K3IvcVpzNE80MWlhSGRndEY5SkU4MmhGanJUMW4x?=
 =?utf-8?B?YkIrV1E3bElPaFA1OXhyWU9mTVZFV24xcU9pZWxMNENqcHBwRVpjQ0JkR2tt?=
 =?utf-8?B?L2RXNzJwekdMWk9sS2ZKWUtkdnJRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4419a2ba-469d-4f3d-d7bc-08d9b697a1f2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:01:02.5186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r672BpaE6rh12bd36Ly6U6u9EVxPqHpv5ppfKjHbnBXOFXaQ3kwVlqs7gFqgtvDONOol5CoG9hOhy/vEfEiEmnxjf8RcP51GHaFSZu+vovA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4262
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/2/2021 4:33 PM, Lucas De Marchi wrote:
> On Thu, Dec 02, 2021 at 04:06:23PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> If the GuC has failed to load for any reason and then the user pokes
>> the debugfs GuC log interface, a BUG and/or null pointer deref can
>> occur. Don't let that happen.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Lucas De Marchi
>

Do we need a fixes tag? or is it ok to not have it for debugfs bugs?

Daniele

>> ---
>> drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>> index 46026c2c1722..8fd068049376 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
>> @@ -31,7 +31,7 @@ static int guc_log_level_get(void *data, u64 *val)
>> {
>>     struct intel_guc_log *log = data;
>>
>> -    if (!intel_guc_is_used(log_to_guc(log)))
>> +    if (!log->vma)
>>         return -ENODEV;
>>
>>     *val = intel_guc_log_get_level(log);
>> @@ -43,7 +43,7 @@ static int guc_log_level_set(void *data, u64 val)
>> {
>>     struct intel_guc_log *log = data;
>>
>> -    if (!intel_guc_is_used(log_to_guc(log)))
>> +    if (!log->vma)
>>         return -ENODEV;
>>
>>     return intel_guc_log_set_level(log, val);
>> -- 
>> 2.25.1
>>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF76188DB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 20:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A6310E22A;
	Thu,  3 Nov 2022 19:39:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F2C10E255;
 Thu,  3 Nov 2022 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667504369; x=1699040369;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cFBI8Fqw8J+rJjSe5vvpJN7WhhXUmJ0UfXZV6uzvDAo=;
 b=AFd0cLTu36HT9nlG9tflBCz23U0k5tBeG9gJndkIpqrue/TXIiyaQm/D
 7+fQw6ZXBp+cT7XqzUjdWD9yVCvjvaKzY0IhC2U2MRRLNbw+4a8dUvZqN
 qkeMkVil2nS93BYe6pDvSCKmJzHCYBVURV2nHfLD3MOhnptcDI1ODrzXv
 JitmCuRrnOaZGq2NNlzBjYpWztMoOkOsYRhfyJSAhe1YuPGhHkC0PsWJl
 jy4jsDzSjPU8nDdY9xh+3ktG1W64+jQ1cxTs20mbCwhuz/6pcKfdFInB/
 Gf2bRyt45FZONCJrgjXScRqEIQ00ku0xU9IlYdtgkupzkJwGm55uOUciz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="293109897"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="293109897"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 12:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="703803707"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="703803707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2022 12:39:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 12:39:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 12:39:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 12:39:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 12:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKONaRThHh+E2KHvJ0tiLugisTszpkxQtuCo0IJ7D592I+IXfi9URqkTvnvQ9jtk5SPy7A6g5fDYa1jhjsH09DVMsT+FFhx0hiQgmu8djk0f+5/w3fINZMiDB27Fe4x0JKVVybso4NQsr0W4E509C4aguBlw4vvJc/Uz6qABCDZ6DgzFWf5rKcJ3Y03QS+NG7YcD6Ub12Yn5tWFsrk4wx+ZmQ9qmEfV30O1B76X/v8fwxVnUaP04tZYI/TeSu3IjSBCowHreckZZp83fcilziHxfdv45IwF2abjP+PrqIdSff7rmDGdD0E6HQz/gIKTE2QxjLEXhTuMkPFETcg7zKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tSrIrH4tQARK44ft7OtTVhAP8rOyvocXUFSPAx+DyY=;
 b=jRIkvVzRscr2D3paEtkqSJCYZpiOnlT1dToMnKnksaONJkn9w3tZwPv2/mO3eJj1e6DdxkxrfmiR+XkxRdjW6SIbq5d1Q1qfaod66icTftvfWlxNFw+fEU52jA2UP4QEKD/rdyDG1+8uAJb9BJNE/WxKAFtlel8DI4V2ABF3HrDjFTS8HJExXPGSJXZmE4S3fAsgNa2eU88dew4mTURsXv1rZpw2xbphYv2NVoUcbGqJNv8+nl0tW9A/TzT96nsfDzRKGGP61vCOfnBMVoSD/iwa3ilQp7dqY+c6JPrrUyBkZVYTdW00c9a1bs1jNilZ8fwNUEK9Q5GFiXBfYWHbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5361.namprd11.prod.outlook.com (2603:10b6:610:b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Thu, 3 Nov
 2022 19:39:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 19:39:25 +0000
Message-ID: <5faed616-db78-7fbd-0a97-eaee155cd9c1@intel.com>
Date: Thu, 3 Nov 2022 12:39:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
 <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com> <87y1ssb9ks.fsf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87y1ssb9ks.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: c9eddb29-5803-459b-2ac7-08dabdd31d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PAXD+IcdyR7ZrUYatqKRi92M9h2FlatuNa8YNuIcP59cRGhtJwQCAgccBQBqef2CBl/czeeGCsp6WHRa4tG9PWH7xVSsp+5b1kYtp7TCMkvL/C4LE7T3drHh/BasiclE/xJ0ADGm9fuG6+dRO2U7hqjj7n7XXZiTRvQrz1OT+Id3bzrk2Ck+iqrmEYw/FFtxfZxoavcXQHeqPsTMl1GX+OJcFF+cbmAAzdTjhE2+GaNv1UrvcWU2Dse8LRotZRnyidaKmREUT7AVEaFzZ4QoeVWh6CHaeLT56XQ9A7KcAyE4xsjEqxKdHab02oj/eX86jeoD8ejdIrNFIU+56zsxv8aXFn0td8wo/vtUMfm3tvU6vvw+3fRDNjhTH2ixXGHQyXmorfpwTHKLG84A9egIeZMvswVHxAGeHrHGrhPwG/Z++p7w+eyFn+URmUEP38cr6GoZZZIPtobrIrR8zoeny9JBA7/jrh9O+zvD7knG6dquZQDMS46SyQymVRuLEoC4u1uv+UsUs88Tf7BXMTAyfV8gRs9z5hoJVhRi3518u58B3W7RC2OrhPkXVN7M0JpFugn39xHluD5nxbzbn95EHZQKcI4IZIFts/5xWUgzId4IhVGc9HxnhuTGBqQRCtS3C+PrJOKnSKcyvXv6u25hcHd0ooLpPSrdYJ1dSg73C6P+hsfXrcJy4C1Y+jr2Gf/JIKWXLRZvQh+e0jEWOq+5r1hGPUlNCzO4qr9wdUjQ4gh7H/cdOZkLHCQXQfdnIgCDihIVmYPsAidWWgSAsL3dRUvzA/3XE7+tYbvAhvj3CC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199015)(6486002)(82960400001)(186003)(6512007)(66476007)(26005)(5660300002)(110136005)(31686004)(86362001)(8676002)(36756003)(478600001)(83380400001)(6506007)(31696002)(316002)(2616005)(8936002)(66556008)(53546011)(4326008)(38100700002)(41300700001)(66946007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RCtmN2h1T2c5VG51a1pCSzVXMERpeXo0NUw2RGtyYzNWVGcvc3E2Y1E4eXp5?=
 =?utf-8?B?Qi85QWUxcFNYNzZWNHFaMkJvS1BzK0pZaEFoUnh2YWR4TzFXSEM1UVZ0OGdu?=
 =?utf-8?B?UVZQdnMyQnp6ZytnNmx2RGkyNmttaXMzZ1IxYVk0UzRqUU03OHFxRnY1aFpZ?=
 =?utf-8?B?V0RITlNlT2lvT1FtZ3FTU2laQ3ppcnNsSkR0ZlNRSDVEMERjODcxY0xySzZ0?=
 =?utf-8?B?Rm1saCtRWXc3NWUwNTBNYVFGWGJsL3lkUkEwZ0JkcXB5UlY3dEJSK2piWERJ?=
 =?utf-8?B?VURWVU1PQnZCVWhpb3ZpTGJyUkdTVVY0M1l6QnhKQzNBWXNLblpyU25VbGFl?=
 =?utf-8?B?NzRwM1p4NTg2b2lSRWtOYmpOM2dtdldjeVBraXFwZ0RtU3c4MkVVWStYTFI3?=
 =?utf-8?B?eC8xWm9DcTV3V0VvL0FXVjZUcTJvUGVqckk2eEZmZWljU3NrQzdWRGJ0SVhQ?=
 =?utf-8?B?dGFoRkZJY0NsZTl5ZUIyMDFOSVhpU05SRFF6OXpSQnY3REhFRXZYTVJiS09l?=
 =?utf-8?B?N0I4dUZKK3VGd0s2bGFlN0EzL09EZXV5VTBnY3p3QytYWmJQSElsTk9CYkk1?=
 =?utf-8?B?MjJTVmVsUWcrU0R2dkdSaXg0RVMwSmRlMWtJTWpJNVdsZDRzc0RiVnlrQ045?=
 =?utf-8?B?Q2tDVjZFR3hqVmoyQjFWSkdRc1gydTNWTm1xWThBS1ZjS0xkVGdjZmhxalhC?=
 =?utf-8?B?Q2tXS2JLbmFXZm5rNzFCUisyWEMrWldsbUVkTW5FaCsvRmt5c0t2ZGc2YlZD?=
 =?utf-8?B?ajFHczYvak92Qy9NZ3JNVGNLb3dRK090Y1dDcXF1Q2wzd1l2RFZMRngrYjRi?=
 =?utf-8?B?dmZ3ci9VcjFzN1p5b3FYUU43WERQUDhuT3I4c0Nwa0U4SkU5dXkxTlpZWHJZ?=
 =?utf-8?B?Zkl6WmE0SDc4RXBtN09BOWJtTmNwcjA0elpKclM2cFFwL3lQUGhvLzYxUDhh?=
 =?utf-8?B?emdoc2lIVTdCenpkNDhaS3pKS2MxdjFRYWVkaVg1ZkZvRmlZVlFzc045ZWY4?=
 =?utf-8?B?MXRkWlRiNzdqRGQxWStMaEg2bWFSaVAzZ0UwdTZFOG1ZRmdXTXBZakZNZy9W?=
 =?utf-8?B?RjNGTlNka21pYXIvMjNzMndvNlh3MUVHMkxscXhmRkwvWEtjT002ZHF5YlBr?=
 =?utf-8?B?VDFkRUppRTliNllBK3A0K3k3MlZjdit3VGNkVC9waTJsYlZ3cXdWdTBCOVZQ?=
 =?utf-8?B?b29ZVXpua0QxOWNBeUdhejRndVVuR2d0T0hGaWRMUE5iWGkxdjlhbS9oUWFJ?=
 =?utf-8?B?N2IyS0srZmU3ak5NaTE2Q3phN2E0dzZ4SWQ5T0dpVE1FeUtDeXVWQkZHUE5D?=
 =?utf-8?B?ak1yN3ArZmJtcXBlL1dubDNxTWV2MmxwdnB5Uk11eDN2ejRHaldoYm5yRDlN?=
 =?utf-8?B?N2hCQnlkTnRxU2tlbFltbVF5OUQ1OU15aTF5NVpKNExvMHRqOGhZRU9YbTM4?=
 =?utf-8?B?WS9GUHU4K2h0M1B0Ymk0cVNXdHltbHFJc1NlSk1DTUJKM1NLV3NxN2VLeWpK?=
 =?utf-8?B?VHpRRlk1dENBZllGZlBFK2pUUERRTCtQYkNVbDJITFhDZ2FPcFcvTmExNEwy?=
 =?utf-8?B?eG9mTmEvSzcxZEIvcUJNRXozL1FHN1JWZ3g4T3FrT0gwSlZCSlE5ZDFZRVhZ?=
 =?utf-8?B?b1VpbmV1V1BsMlRTZEpjYUhKM05TVkoyeDVVV05YMkMzd21NZzA1aWZmZzBa?=
 =?utf-8?B?cmNVV3R4dUpseXR3ZGFZZXZWREpPSnFLc2VXaFJ5L1BlSHUxelYwR1ZMK3py?=
 =?utf-8?B?dloyT1kzSCtRRmtUeXBvU1laaGlRQ29ha3hEZittU3ZWbXhrNEMxbjV5Y24y?=
 =?utf-8?B?T0NpaGFZTzN6L2lXcEo0eWNKSUNxakd3OEl6ZW51MEFTelJRNVlMY21pbzNN?=
 =?utf-8?B?aXJESUw4bndNQkk3eW04dnpzNDRUM2NucDNjd3ZNZXlYdXBmcmpKYmFWejND?=
 =?utf-8?B?N2hPVndGNkgwNUlZUk43eW5aNjh6aVVSbEhXOEx6LzZUSlNlUnNBZWVEZDhp?=
 =?utf-8?B?dUh4RTJHZXVpRVhDd0NTSzJwaWNyUk9KMzZKbGVNMGZ0Q1FGZlFBcHBoTHVF?=
 =?utf-8?B?MWJWd25WQ0NDQlNLaUthTHhuRis0TlcyZThUeTMwUm1BenFFbDBBaFF0SWFI?=
 =?utf-8?B?cWVDQ3NMYTZLNHk3Ly83aVJuT0owd1FRTm9aOGQ4Rm9pdHRzaXlZOVJYejhP?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eddb29-5803-459b-2ac7-08dabdd31d1f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 19:39:25.1614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIfaPSWZTLVm+qgjm6MIIkdljNm0Ddde1+UemDi1lJMfuNsFJZb91deXB49XbobTcqNSpD/rqWz+q5e/EKEpdu5gP8G5m6xUcvfgORMDk28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5361
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



On 11/3/2022 03:45, Jani Nikula wrote:
> On Wed, 02 Nov 2022, John Harrison <john.c.harrison@intel.com> wrote:
>> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>>> On 02/11/2022 12:12, Jani Nikula wrote:
>>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> At the end of each test, IGT does a drop caches call via sysfs with
>>>> sysfs?
>> Sorry, that was meant to say debugfs. I've also been working on some
>> sysfs IGT issues and evidently got my wires crossed!
>>
>>>>> special flags set. One of the possible paths waits for idle with an
>>>>> infinite timeout. That causes problems for debugging issues when CI
>>>>> catches a "can't go idle" test failure. Best case, the CI system times
>>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>>> reboots the system to recover it. Worst case, the CI system can't do
>>>>> anything at all and then times out (after 1000s) and simply reboots.
>>>>> Sometimes a serial port log of dmesg might be available, sometimes not.
>>>>>
>>>>> So rather than making life hard for ourselves, change the timeout to
>>>>> be 10s rather than infinite. Also, trigger the standard
>>>>> wedge/reset/recover sequence so that testing can continue with a
>>>>> working system (if possible).
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> @@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>>>              DROP_RESET_ACTIVE | \
>>>>>              DROP_RESET_SEQNO | \
>>>>>              DROP_RCU)
>>>>> +
>>>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only used
>>>> here.
>>> So move here, dropping i915 prefix, next to the newly proposed one?
>> Sure, can do that.
>>
>>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>>> gt/intel_gt.c.
>>> Move there and rename to GT_IDLE_TIMEOUT?
>>>
>>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in intel_gt_pm.c.
>>> No action needed, maybe drop i915 prefix if wanted.
>>>
>> These two are totally unrelated and in code not being touched by this
>> change. I would rather not conflate changing random other things with
>> fixing this specific issue.
>>
>>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>> Add _MS suffix if wanted.
>>>
>>>> My head spins.
>>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT applies
>>> to DROP_ACTIVE and not only DROP_IDLE.
>> My original intention for the name was that is the 'drop caches timeout
>> for intel_gt_wait_for_idle'. Which is quite the mouthful and hence
>> abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised later that name
>> can be conflated with the DROP_IDLE flag. Will rename.
>>
>>
>>> Things get refactored, code moves around, bits get left behind, who
>>> knows. No reason to get too worked up. :) As long as people are taking
>>> a wider view when touching the code base, and are not afraid to send
>>> cleanups, things should be good.
>> On the other hand, if every patch gets blocked in code review because
>> someone points out some completely unrelated piece of code could be a
>> bit better then nothing ever gets fixed. If you spot something that you
>> think should be improved, isn't the general idea that you should post a
>> patch yourself to improve it?
> The general idea is that every change should improve the driver. If you
> need to modify something that's a mess, you fix the mess instead of
> adding to the mess. You can't put the onus on cleaning up after you on
> someone else.
Please point out in what way this patch is 'adding to the mess' or 
requiring some else to do additional 'cleaning up after'. As stated 
above, I have fixed up the issues pointed out which are related to the 
drop caches code. I don't agree that shoe-horning completely unrelated 
changes into random patches is a good thing. That makes it hard to work 
out what the patch is actually trying to do, it makes bisection more 
confusing, etc. Sure, maybe the unrelated change is trivial. But this 
change was supposed to be trivial too and already it has exploded into 
many hours of time spent not working on the things I am actually 
supposed to be working on.

> Sure, the patch at hand is neglible, but hey, so are the fixes.
So feel free to post a trivial patch to fix them. And if 'the patch at 
hand is negligible' then why is it generating so much discussion and 
argument over how it the problem should be fixed irrespective of adding 
in yet more unrelated changes?

John.

> BR,
> Jani.
>
>
>>
>>> For the actual functional change at hand - it would be nice if code
>>> paths in question could handle SIGINT and then we could punt the
>>> decision on how long someone wants to wait purely to userspace. But
>>> it's probably hard and it's only debugfs so whatever.
>>>
>> The code paths in question will already abort on a signal won't they?
>> Both intel_gt_wait_for_idle() and intel_guc_wait_for_pending_msg(),
>> which is where the uc_wait_for_idle eventually ends up, have an
>> 'if(signal_pending) return -EINTR;' check. Beyond that, it sounds like
>> what you are asking for is a change in the IGT libraries and/or CI
>> framework to start sending signals after some specific timeout. That
>> seems like a significantly more complex change (in terms of the number
>> of entities affected and number of groups involved) and unnecessary.
>>
>>> Whether or not 10s is enough CI will hopefully tell us. I'd probably
>>> err on the side of safety and make it longer, but at most half from
>>> the test runner timeout.
>> This is supposed to be test clean up. This is not about how long a
>> particular test takes to complete but about how long it takes to declare
>> the system broken after the test has already finished. I would argue
>> that even 10s is massively longer than required.
>>
>>> I am not convinced that wedging is correct though. Conceptually could
>>> be just that the timeout is too short. What does wedging really give
>>> us, on top of limiting the wait, when latter AFAIU is the key factor
>>> which would prevent the need to reboot the machine?
>>>
>> It gives us a system that knows what state it is in. If we can't idle
>> the GT then something is very badly wrong. Wedging indicates that. It
>> also ensure that a full GT reset will be attempted before the next test
>> is run. Helping to prevent a failure on test X from propagating into
>> failures of unrelated tests X+1, X+2, ... And if the GT reset does not
>> work because the system is really that badly broken then future tests
>> will not run rather than report erroneous failures.
>>
>> This is not about getting a more stable system for end users by sweeping
>> issues under the carpet and pretending all is well. End users don't run
>> IGTs or explicitly call dodgy debugfs entry points. The sole motivation
>> here is to get more accurate results from CI. That is, correctly
>> identifying which test has hit a problem, getting valid debug analysis
>> for that test (logs and such) and allowing further testing to complete
>> correctly in the case where the system can be recovered.
>>
>> John.
>>
>>> Regards,
>>>
>>> Tvrtko


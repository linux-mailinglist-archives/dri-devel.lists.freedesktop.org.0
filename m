Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E129667A7BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7AB10E096;
	Wed, 25 Jan 2023 00:31:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BEF10E096;
 Wed, 25 Jan 2023 00:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674606689; x=1706142689;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5QT7KJ4nXdBhqKYAcKe7QJc5qdXy+Hbek8dzFBHFi1Y=;
 b=kscusHm8DwDkzfx5EwP7KNoXtgQmzo9lOFzNhbH+r+22mJ6uEA/Ku+KK
 AynIZrrQqF/Qfg27fu3n02j0pzIDQJZYtgQINLj1BAVF16rzGoPPqEZt4
 DDr/mf96OiOaX4sJJ8zd3gbYEjO+Je7juh3qVtPpvCOnNt/ci+jSS2K2J
 QGc1oVhIfK2RFEEFEDnO+fQ+5gnxiQk5MCSibPawTFfwshC+GX87p7Lbm
 +qwS6tYO8hnjo3teDalIB1enOisMZYl20rYnugB7v6+yzU+TlrItLTQ/F
 Jzc5A6r4q2eLdbMO2QYs01MW3s4orTlaIMzirhRfyvZI8kXzbze0JS1Fo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306803610"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="306803610"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 16:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="692773760"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="692773760"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 16:31:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:31:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 16:31:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 16:31:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOBysO1PNzPn63TsnLtNW1L3PA7NIECPG/UsxLZgt1QJRD/+/eMJTHdT5+f+8La81XbvbLshAbAx+2FQ8rGVLQ8WNd0y0k+35/tqYVPXPE213Gvx4SOEvQkDPH60dIka+KWCF/TslTUd4p6y2Z4otnkyYWn9r1rrMzGFbcXvbBg6Hfv6OE6kvcXKtGTCyJ7jH7QP9nMyP+uXoHWhMnPZMwho+Cge5yv77h/raGgPuVusD/2KJCFDxgryS4Hyn79kFi5A99/NligMsSKGfLffaWnjQBkCaahzuANXIueyS4MV8mdgTLHjW8PzXloNjmk8B48ZEiWfQXWlKDdnHYzuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQAFauHW66FJp1z0wOpgWKTcxYpoXd0kl2ertD1mqLg=;
 b=Zm8kgOXjPffkNnh9UY/3hkA5c1/5Oc3uUjwt2TcDy9UM64jrfeJTrivjzlAFItorvt0YLgOv0yBFaoDANDdirUeBmpRpAEvZLvBy/rAhsDOaKllzLLyR2WsQ/yhVaB7aCrumbCCuh0GvM488n5HVMMfvnl6qrN/RAV3vKfIDWG6nXxCwFXrbTf2uIJIbthiJwAyZwIfSRTrQEfWQ3K4ygyK9XjI6LOryugIF70/iCSOulIqcRpjc0VAH3U/NJUkr9yxsrKGBCsN9/URy7XWQxvS9k7x1n/cBY1y9rKCsQP4ZqbgJr4MD+UwUN78+lwUKVH8Zl/GgqdNgNHDkeZe6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 00:31:24 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28%8]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 00:31:24 +0000
Message-ID: <edd0d977-fe21-0004-0a1b-61ed97d42147@intel.com>
Date: Tue, 24 Jan 2023 16:31:21 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v4 2/7] drm/i915: Fix up locking around
 dumping requests lists
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230120232831.28177-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::26) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d780f0-fd18-4205-6bde-08dafe6b7d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnR+/8mGqnmkFYIM0kyrisTXyI2flQlMWNBsJOhwXVF+Cr+GmHOjDzuR3X7unWmVghz2nsxD3cC04caHisodMFCT8cmWb/D6I4mpVadz/f3zY9B8COeS4kmBx38VPl26pvFXfjvAbTe92wUaUvsYwNf+6uCfc6KxPoiZC0yNksm8lb5zxzTsOfjeh4Ds9cZ74UQp8QNON46211bWyiEVVypaW+vwuoLCQFzeOQ8mVfHL2/vkvjkjyHZv94hCLHJuvZaxArrCqwkfgx4tLLDDqolu9nLOkq/sAbXLfpWQY7x/b3rb4JRmyno/H96AHnI1cFAg5cOv50SRgJNtYLGkkEG3u6jPM/DiesvCKLeckndsNvN9KRuNx26oe7ujIEKWE1Y4mIj204Drmd9G7jLHOTwxStq1zA+h/0/zam7IylHCg1vAirs4QVTPprN/0xL6UmuS0IqY6fBzdRle5mtRqN59cnRInyrLTjz4i5KRLPQF0LPfkMiDspWZ9YtFAtO1llkzo6cp31SUU7oQuW61pXkNzgJjXkmqxUvHBeEdkRN4oQF9qBvZVIq7l6O9zELxO/0UN/hI3uEumazIWe+1suZo/rHm/x/f8xc6g6h9ZCxAlVERq6neqAdayXnr2LCnwtwgVMc+AThlxQc+LMvJwGBafWzEDZZCgb5Jb1r2LKVDlvZKkXus5KjMF4rFJtrHql5+HILTpcUyY6Toon+KjfGQfdyh9HgmKRDDilQyvk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199018)(8676002)(8936002)(66556008)(66476007)(4326008)(36756003)(450100002)(66946007)(83380400001)(2616005)(6486002)(478600001)(6666004)(6512007)(53546011)(186003)(26005)(316002)(86362001)(5660300002)(30864003)(31696002)(2906002)(82960400001)(38100700002)(31686004)(41300700001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RThIWFlWMGQ0cFYvYytoWk5Mdkc1UVNSVSsra010N2pNUE93T0dVOThnRGpN?=
 =?utf-8?B?OW5pdHlPako3TlpZaXlqNUNoNERMc2RnRlk3RmNwTHJ3WXMwUlpZdmZXYWFZ?=
 =?utf-8?B?UDhGZ25ZY2hYbWlOb05LWnU3WEZhOVpLMWp2WEFGdVlXN3IrUk9IN3FnM2lE?=
 =?utf-8?B?RjFaaCsxc1VSK3J6eVVXZ3VsY2hxMmV2MzJoMmRLcC8wYUxTalBGb2VCL3B2?=
 =?utf-8?B?UlNYWTV0eVgxWGlvU1F0dlJMK0tvV1lsTnQxQVhzc1hOQkIrZHlacE9zRFow?=
 =?utf-8?B?ZzQrdkErbDg2bHdSbE5mbXFGTnh6enF1a1FiOFNYNElCZnBod29VcVVCci9m?=
 =?utf-8?B?SGhma1FpeVNmTVVYTWJRTzNibUFnL0x0UjR6QTJhL0lRZmRIRXhTVmgwbkYr?=
 =?utf-8?B?aXVudEFRRmpzQ1pJOUhJYlhrNmxxdnV3OFoxTnNSZTY1YWxEZGYzY2lHL2ds?=
 =?utf-8?B?dFJsSHpiR0dWcVp4dDN4NERjaThGcmh5WHJyQ3p6aXpvU2x2T2loZW9GY0VP?=
 =?utf-8?B?Q1BPSVpUTVJKRGh1WGN3RU1UaFlMMXVwKzM1NVNXQWtsRkFsVWMxUFhRV3hs?=
 =?utf-8?B?ZWNqUkF5VGFSVFAwTHZabW1JQ2JWSGFQNE4rcHRiZ2lMVlNoekltYlp2UHht?=
 =?utf-8?B?elNoYWV4NmZzdHJ1UnUrYWdVSUU4RERwSzBwOW5IQk54WW9ONjZrZzdDMGJ1?=
 =?utf-8?B?K0J2OWZhWjBBTEFQNlhQbUk4WUVpM3JJamFxdzMvVGVEaDloS3ZLVWwxZlJT?=
 =?utf-8?B?QVN3RmFZUHZnT2lzZkNlYUhMWnZ1WTkzcGUvWW8xcXhybWpoV2FWRnU1WS9p?=
 =?utf-8?B?aHFkdDR3ZkVsYzZnbTRqaU42aEtKUlltREJjSmQyVUR3VHhpWUk4bUVGQ1hy?=
 =?utf-8?B?bnhTVlJMVUNrZ3kzRXhDK0V3UkIwNk5DaG4zaFErZnRDM2Y1MnZyU3NUN29o?=
 =?utf-8?B?RGZaTHNQUzFTc05JYzVVb2ZYaXJtNytiZkZ1ck8yNThtYVdWWk8yTFcyVUM1?=
 =?utf-8?B?UGk4RDRzOW9vdWYxcEs1WitCajhTS0hrbzVvVUtlcGg0blhVSy9seFlYOEhF?=
 =?utf-8?B?MkJHZk1lSUhicWx4UG9XZ2ZjMHhvRnd0emxnMmdFak04SS8vN25LNkVaRWtG?=
 =?utf-8?B?cDFNSDRzNklXWjNNTmp4ejA1dDkxNWNQbzIyNTJJL2dJR3NuYVoxM29wYmpi?=
 =?utf-8?B?L2JybDBxajJXbk5jczZmOFRvdjllUmlwTEx5V21sODZaOThsT2w4MVllWFJL?=
 =?utf-8?B?WkQ3NWhMTG0yN1lGL09qWWR6cTBSS2VzM1RLaXhMZjdaU3lzalRZMHFoRGVq?=
 =?utf-8?B?WWlNUzBDY21YVTgyR3dpMHZKNEV5MUo1dk1VSGkxeEc4MVgrc3ZXKy9qL2VD?=
 =?utf-8?B?TDZtTDE2b2lhOFNMcU1SU1BSRVhzSE1OVm45N21tSTNBYkg2dTJUWUQzN3dH?=
 =?utf-8?B?QmFXc2R2UE8yL1UzQ2JSMkMxMzdiS1RqVktoZVRIVzN3WEJ6cndsMmgyKzRp?=
 =?utf-8?B?S0dmSDZxRHRCYnYwOWp1N3UrYlV5THhzRHRyMEVSeldJUlI4bTQzbFc0cTMv?=
 =?utf-8?B?QVNiR3E0M0xwRDZZRHUyaDF0YUU0TXd5RGFoM0JpeFpQOU1TMHRMMEdiWUdX?=
 =?utf-8?B?V3gyNDdkQTdrY2E5NnZkYXJVbnZXa2FodDhWQS9veEg3MERnU3ZsQlUzbWMx?=
 =?utf-8?B?bm5RMWgyWE9TS2pNSjJqRnBySTZpaGpXMC9DbHRVa2IxWGc3YlduYXhuaTdv?=
 =?utf-8?B?c3pCaXVXcGpyeE5LRXVuQzc3eDZsQWF6TmdMZkwrME1vb1NrNDFUUzdKenZ3?=
 =?utf-8?B?a2tSaG9icU5PektWYWxVZHBpd2VzdGVzZkNqd0FNOHVoTnNnQUVMdDd2eDE2?=
 =?utf-8?B?cnJhOThrY1lUa3lidmFsZHFyZXdtcmhwZUhJemorV0Z6UDk3VE45MFFzYzZY?=
 =?utf-8?B?YnJKMiszdER2czVIc2lqcElKcXYxQzgySUNUaTBUbmFDbTdhc2Nob2swdTZB?=
 =?utf-8?B?VHl6TG9Sa1g0SlhFSHNyelZBZjRrSHcwaXdwc0xZb2hhdmpFUDhxT3ZoYm1u?=
 =?utf-8?B?Z01yS2tYcC8rVVBNakdJRUpENkxlUDhyU2Nmd1E0Unk5T2c1cWNhc1N0ZDBz?=
 =?utf-8?B?dFJaZXlVOE1qZGUvZFQ5bHFUYmM1QmhwOTBQMW9qY1ZjRDlMWFRLOTBEQUlC?=
 =?utf-8?Q?FIgeH0vvVgkHxn3BHzkIalM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d780f0-fd18-4205-6bde-08dafe6b7d05
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 00:31:24.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPP5Xb5yxs82NEYHHWV4BROrpUSZqFej/VC6AAkl8f1J2tAc4fk1kzlCo8yfuwGPbCJsJDAPMhBWyc/CvPUob0DC7GWat7j6AljG6l1XbRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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



On 1/20/2023 3:28 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The debugfs dump of requests was confused about what state requires
> the execlist lock versus the GuC lock. There was also a bunch of
> duplicated messy code between it and the error capture code.
>
> So refactor the hung request search into a re-usable function. And
> reduce the span of the execlist state lock to only the execlist
> specific code paths. In order to do that, also move the report of hold
> count (which is an execlist only concept) from the top level dump
> function to the lower level execlist specific function. Also, move the
> execlist specific code into the execlist source file.
>
> v2: Rename some functions and move to more appropriate files (Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  4 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 74 +++++++++----------
>   .../drm/i915/gt/intel_execlists_submission.c  | 27 +++++++
>   .../drm/i915/gt/intel_execlists_submission.h  |  4 +
>   drivers/gpu/drm/i915/i915_gpu_error.c         | 26 +------
>   5 files changed, 73 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 0e24af5efee9c..b58c30ac8ef02 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -250,8 +250,8 @@ void intel_engine_dump_active_requests(struct list_head *requests,
>   ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>   				   ktime_t *now);
>   
> -struct i915_request *
> -intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
> +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
> +				  struct intel_context **ce, struct i915_request **rq);
>   
>   u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>   struct intel_context *
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index fbc0a81617e89..1d77e27801bce 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -2114,17 +2114,6 @@ static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
>   	}
>   }
>   
> -static unsigned long list_count(struct list_head *list)
> -{
> -	struct list_head *pos;
> -	unsigned long count = 0;
> -
> -	list_for_each(pos, list)
> -		count++;
> -
> -	return count;
> -}
> -
>   static unsigned long read_ul(void *p, size_t x)
>   {
>   	return *(unsigned long *)(p + x);
> @@ -2216,11 +2205,11 @@ void intel_engine_dump_active_requests(struct list_head *requests,
>   	}
>   }
>   
> -static void engine_dump_active_requests(struct intel_engine_cs *engine, struct drm_printer *m)
> +static void engine_dump_active_requests(struct intel_engine_cs *engine,
> +					struct drm_printer *m)
>   {
> +	struct intel_context *hung_ce = NULL;
>   	struct i915_request *hung_rq = NULL;
> -	struct intel_context *ce;
> -	bool guc;
>   
>   	/*
>   	 * No need for an engine->irq_seqno_barrier() before the seqno reads.
> @@ -2229,29 +2218,20 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	 * But the intention here is just to report an instantaneous snapshot
>   	 * so that's fine.
>   	 */
> -	lockdep_assert_held(&engine->sched_engine->lock);
> +	intel_engine_get_hung_entity(engine, &hung_ce, &hung_rq);
>   
>   	drm_printf(m, "\tRequests:\n");
>   
> -	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
> -	if (guc) {
> -		ce = intel_engine_get_hung_context(engine);
> -		if (ce)
> -			hung_rq = intel_context_find_active_request_get(ce);
> -	} else {
> -		hung_rq = intel_engine_execlist_find_hung_request(engine);
> -		if (hung_rq)
> -			hung_rq = i915_request_get_rcu(hung_rq);
> -	}
> -
>   	if (hung_rq)
>   		engine_dump_request(hung_rq, m, "\t\thung");
> +	else if (hung_ce)
> +		drm_printf(m, "\t\tGot hung ce but no hung rq!\n");
>   
> -	if (guc)
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc))
>   		intel_guc_dump_active_requests(engine, hung_rq, m);
>   	else
> -		intel_engine_dump_active_requests(&engine->sched_engine->requests,
> -						  hung_rq, m);
> +		intel_execlist_dump_active_requests(engine, hung_rq, m);
> +
>   	if (hung_rq)
>   		i915_request_put(hung_rq);
>   }
> @@ -2263,7 +2243,6 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   	struct i915_gpu_error * const error = &engine->i915->gpu_error;
>   	struct i915_request *rq;
>   	intel_wakeref_t wakeref;
> -	unsigned long flags;
>   	ktime_t dummy;
>   
>   	if (header) {
> @@ -2300,13 +2279,8 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   		   i915_reset_count(error));
>   	print_properties(engine, m);
>   
> -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
>   	engine_dump_active_requests(engine, m);
>   
> -	drm_printf(m, "\tOn hold?: %lu\n",
> -		   list_count(&engine->sched_engine->hold));
> -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> -
>   	drm_printf(m, "\tMMIO base:  0x%08x\n", engine->mmio_base);
>   	wakeref = intel_runtime_pm_get_if_in_use(engine->uncore->rpm);
>   	if (wakeref) {
> @@ -2352,8 +2326,7 @@ intel_engine_create_virtual(struct intel_engine_cs **siblings,
>   	return siblings[0]->cops->create_virtual(siblings, count, flags);
>   }
>   
> -struct i915_request *
> -intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
> +static struct i915_request *engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>   {
>   	struct i915_request *request, *active = NULL;
>   
> @@ -2405,6 +2378,33 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>   	return active;
>   }
>   
> +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
> +				  struct intel_context **ce, struct i915_request **rq)
> +{
> +	unsigned long flags;
> +
> +	*ce = intel_engine_get_hung_context(engine);
> +	if (*ce) {
> +		intel_engine_clear_hung_context(engine);
> +
> +		*rq = intel_context_find_active_request_get(*ce);
> +		return;
> +	}
> +
> +	/*
> +	 * Getting here with GuC enabled means it is a forced error capture
> +	 * with no actual hang. So, no need to attempt the execlist search.
> +	 */
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc))
> +		return;
> +
> +	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +	*rq = engine_execlist_find_hung_request(engine);
> +	if (*rq)
> +		*rq = i915_request_get_rcu(*rq);
> +	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +}
> +
>   void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
>   {
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 18ffe55282e59..05995c8577bef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -4150,6 +4150,33 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> +static unsigned long list_count(struct list_head *list)
> +{
> +	struct list_head *pos;
> +	unsigned long count = 0;
> +
> +	list_for_each(pos, list)
> +		count++;
> +
> +	return count;
> +}
> +
> +void intel_execlist_dump_active_requests(struct intel_engine_cs *engine,

nit: we usually use "execlists" and not "execlist".
Apart from this the patch LGTM.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +					 struct i915_request *hung_rq,
> +					 struct drm_printer *m)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +
> +	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
> +
> +	drm_printf(m, "\tOn hold?: %lu\n",
> +		   list_count(&engine->sched_engine->hold));
> +
> +	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_execlists.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index a1aa92c983a51..cb07488a03764 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -32,6 +32,10 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   							int indent),
>   				   unsigned int max);
>   
> +void intel_execlist_dump_active_requests(struct intel_engine_cs *engine,
> +					 struct i915_request *hung_rq,
> +					 struct drm_printer *m);
> +
>   bool
>   intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
>   
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 5c73dfa2fb3f6..b20bd6365615b 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1596,35 +1596,15 @@ capture_engine(struct intel_engine_cs *engine,
>   {
>   	struct intel_engine_capture_vma *capture = NULL;
>   	struct intel_engine_coredump *ee;
> -	struct intel_context *ce;
> +	struct intel_context *ce = NULL;
>   	struct i915_request *rq = NULL;
> -	unsigned long flags;
>   
>   	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL, dump_flags);
>   	if (!ee)
>   		return NULL;
>   
> -	ce = intel_engine_get_hung_context(engine);
> -	if (ce) {
> -		intel_engine_clear_hung_context(engine);
> -		rq = intel_context_find_active_request_get(ce);
> -		if (!rq || !i915_request_started(rq))
> -			goto no_request_capture;
> -	} else {
> -		/*
> -		 * Getting here with GuC enabled means it is a forced error capture
> -		 * with no actual hang. So, no need to attempt the execlist search.
> -		 */
> -		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
> -			spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -			rq = intel_engine_execlist_find_hung_request(engine);
> -			if (rq)
> -				rq = i915_request_get_rcu(rq);
> -			spin_unlock_irqrestore(&engine->sched_engine->lock,
> -					       flags);
> -		}
> -	}
> -	if (!rq)
> +	intel_engine_get_hung_entity(engine, &ce, &rq);
> +	if (!rq || !i915_request_started(rq))
>   		goto no_request_capture;
>   
>   	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);


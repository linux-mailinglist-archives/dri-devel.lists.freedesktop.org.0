Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C833373F323
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 06:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ECE10E288;
	Tue, 27 Jun 2023 04:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7B610E284;
 Tue, 27 Jun 2023 04:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687838547; x=1719374547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nJ+vEgH26N2kiF5kJOxvVGz/4gCUKuBfuR6nfiUUmCE=;
 b=jg9VP6u2DFQW9/EYL3xDrd434w6Ha4Zltd3ftJNR/On4ROfgoFc/NqGr
 ZuaEDzG2gGfe3Rn3GtlqgZ3ciW462YGT1mD6lDoSSzc+/M2QQrXhbx1CL
 ukEjMgdhhra3uEJWCFEsVHLkupjmD79V9h7sfrXTyY26+cSonTuilivsc
 u+bhy6pEUPr+fhnJm9SgQrlsQihXy3joSCwy6MvPRP+H0s4sjvfI9wmb6
 O4thTj+OtCyizZfgKxWRYpx2AeIs+TQNrZSJGJYH2pEQNERduKlOccs3C
 MLutBKOxpf1PfV3BCKfXzAeXEp1/jfm2rWv5294EUDgIvUh8wS4NQAeiF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341052971"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="341052971"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 21:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890525041"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="890525041"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 26 Jun 2023 21:02:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 21:02:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 21:02:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 21:02:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 21:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1bQqnyir53JzFxJN+42pxwEJzBv5gfDESq6cbdrUXnBp4lNyGENlaMyyjGlwndDWps4Xs9uA3Tr4tkSPo0Of6Lnl8xhjGnZBxYGgShqd6pasGy/B+56fu46h2nYyS4aNwAXrZi/x5vEQ7KK6BTCZaXWB8YXMfeXfoHj81+5cKWCyXBVB3jz1fWBeWGP3Py+xnoqc52oxsmaso8tnZR5AXUKBr0S4JefwWHFhOb0jC2Ej9nhBUboiIQCouby9253oXJBsP/UaQ2IrtBINSVj8YOs8IPNcPAzx1qRaM9gQT/5b4z16/fxHkpmdhVs2/bqEGV5l7Hi3pR+CqTxULLFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9n6Axx+lInnEJsB8Xsc0Gqp67IiCgqmAe+poSlGy0M=;
 b=IhjIR3tIlKJmHl6XELfoo1CJtikAp5iE8wqPyzIpMJL3bLz416+0xp6Qvh83gkUPlmQFOUTIhZ3CPq6tfme8lFzISRRc9Kj8leepwfeRQdT0h/KiIR/IUGrj0T7Oox3JhByhubRYZKuVpOb0bZ5RP+NpgL/XT1QTzJMNbGKBh8p8kMg8LaxwR8zOJkvESEQkZDOron5pwl5IFOtSnG2grUxXIkYMsy5Yz+7OToLAf1lLC/RL+C9GVnGwJV6nPo1LJ2MYVHBfF4ZNFmsiuP2Jz9EofY66H7wEDQRD0/LshYcjIqubnnxAwS+1nigajLyzSvWTFVRv6Nbh3NYSAQhAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by PH8PR11MB6803.namprd11.prod.outlook.com (2603:10b6:510:1cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 27 Jun
 2023 04:02:17 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%5]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 04:02:17 +0000
Message-ID: <8c1b95aa-29c3-35dd-d0cc-609449a6730c@intel.com>
Date: Mon, 26 Jun 2023 21:02:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Dump perf_limit_reasons for
 debug
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627021218.123999-1-vinay.belgaumkar@intel.com>
 <871qhxd25r.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <871qhxd25r.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|PH8PR11MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 76949922-d922-492c-9b90-08db76c34be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAVvoEnjGvSV5rnhhy99L1ROqrZULdMlL9E1XOeBnqZdz9gqGL4V17HUqPcw7tu/w5fwtTWzCFXyyXFlD5bHllPAXBJ3Lcfp58GL4OWnMFTXyhRIGmsR2KcMA30T8G4QXoKm9XZDlhAzBOhh0vrjfBSs73QnfGvTwgbZDrqBPW+G6dGZMtzEarCzxlhZFJ/OozMdQNTwT+71sbWR1amJ11Xbyd4CSh5ymoBNglzpaJG//SSRebXKvtrb8DJP7tD8NWWE3U5eUwucxNYx9Eh8IpnDOz99Zg5BPysrFuh/zNQ7InEj4e04MStA6GCn2JbE82SQCne34qBzaU79chxkWkWSF8vxagvLvpbIlS2HySMYtn4CtHFgdFo9jO7ErOE59PyFT64h/Eijkt8x8oUkk2B2Mfzc2lXUftE0teDQkIw4cgOuF9w8ydYO0DDDFWrsCR10dGZ0Ee8dhTUHhMTovFiicdvsLhGR+g8Ol9LuRGKXjo4Vbso8Pd2iq175c7qTVea9j5Ft+zU2Vldf6fJrF1yMbI+FfB7dYXSQVN2KXC0diwwACH+dO2OPwwlNq4PEB3XheQACONFY5TwV03spXG0N2iTThTkutHD123MLbhi17gfFtAQeSeJ1ddLpsUgTBNZ9IHeO5xSFK/uT4tDG8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(450100002)(8676002)(8936002)(66946007)(66556008)(66476007)(316002)(4326008)(6636002)(6512007)(6506007)(186003)(26005)(53546011)(6486002)(2616005)(37006003)(6666004)(41300700001)(2906002)(6862004)(5660300002)(478600001)(82960400001)(38100700002)(36756003)(31696002)(86362001)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVhGVFdzcWRBSDZPbmkzdzQ0OVgwQzFGK1YrSy81ZVVOVXM3TytOTktLMVls?=
 =?utf-8?B?UWlTcjI3Snp5U0JyV3ptd3JHSmRFbzhCb1gxcVpjZjVuNytnT0Nqb3hwV2Z0?=
 =?utf-8?B?ekVBQ0hFY2JEclhVSWlGMWFYUjNWSmpEaEZyWXNpZ1F5VS9oRVl4ak53cXht?=
 =?utf-8?B?T0VzdmdCa0NXSWZGRWlMYmVSMlF0OFlNL2puT0hoai93VUtoUUtuNTlYVTdu?=
 =?utf-8?B?UFZidWdxYXkvejJOZmNWODdKcWo5dndKMGhiaFJWdDF2TGpNRVcrOHZtbjhX?=
 =?utf-8?B?ZzhQZ1d1WjlPR24xUWNxTEp2eVZEVXZNNk5VRW5kL0VoWkR0VXhacmtISEZx?=
 =?utf-8?B?MjFHRWluV2h6UGhOMHUyVm5MZVZBS1RvdWlSelpxMmhycUIrRkdhWmYxOHhr?=
 =?utf-8?B?SFk5U2NzV2xlR3Q5L2lIc2VOWkt3V3ExZVFSVFdsTHI2cHp5OUlKN1IwYVNM?=
 =?utf-8?B?RVlpcENDdnJDRWhMQy8vT2hmSk9Da2xLSnY1RjlMOVNDUk9GUnpnNytTWVdU?=
 =?utf-8?B?dXo5SStoVWZIbFdoWnVGNGg2OStqQW1JaDl0TVN6T3Zhb2lyc0x5S0k0QkFL?=
 =?utf-8?B?R29YWGlnYnFLYzlnYTl6YU1qK1pUL1pYcHpvUEU0SnViajNyR3hDeFZ5T1B1?=
 =?utf-8?B?ajZGNGF1THg2YXlUWUkrZ0hjRC9lcXdyOGg1RzI3dEpuRWF6RTRWMTFaSGhz?=
 =?utf-8?B?cURZUWszaXZ6OTJrTlBqUmtRNFFqb1dUOWYxS3hWQzZ4SWZUN0tOZlJ6cndM?=
 =?utf-8?B?eG54ZEFzTUpldGRXbkFmSmtRSWNubmYxWlVZaHVlQktNV2VUOVBhYUd1TlBv?=
 =?utf-8?B?Nmc5a2VXaFcwejFjdjlWc1lzOUJ0Zi8reWl0K1EyT1p1ZjNYSWFIWDgrRFpj?=
 =?utf-8?B?b1BGeHdHMUNEM1h0VDJkM3liMXlGWjRXRWpkamQrNUNlOW56ZFhpVCtPdjQ3?=
 =?utf-8?B?OXdZenZqQ0JCOUFsdzdENml3MnFnMnJGTDVTNUd2cGozOWQ5aEc2TThvZmls?=
 =?utf-8?B?VE9LczFKd1RhNlFJSm90ZVdBeVlSRUR6eForK05BakUwdktlVDhWdk03ZUZ2?=
 =?utf-8?B?emN5d1lFVEpFbUNyVW5ONjB2d3NjU3NxM1BpOUlZOHR5LzZuVCtoS0k1eUZu?=
 =?utf-8?B?bHJmSHUvbEFENDcrSnFzY0wwdXZ3RFVzOWROWTh1d004aS9qRG5aYi8rNzVD?=
 =?utf-8?B?bHprTVlWWkNJWE5VM2tQb0FZR1dEck5nMU1pQklkeGFVR2l4b21nODdxL1Zm?=
 =?utf-8?B?YUdyQ3pNWGREK0VET0J4V1NwRGJNUTBxM1FmaDFGRDlLQWlvQXNXblNNcTYz?=
 =?utf-8?B?U3pDTGNvY3JYUGNKNW9FL1hrQXZjaktHVW1DZEtDbW01bEorNXRuMU5XUTlU?=
 =?utf-8?B?TWVsTVVJcVVpNlh0UXJZeUdoODBiUUU3TUM0eEdNUlpSSE9BUFVRN3NYc3dz?=
 =?utf-8?B?TGE0dVJ6VmtLYzhKczN4L2ppY1RaeUo3eGJOMDcxeE5mRVo3L09mdFlBUEVs?=
 =?utf-8?B?K2FnSlZtTkp3b3FEVS93OTRGakdkQ0F2NkVhYW9NbVluRVd1Y1pkSmlvOUVt?=
 =?utf-8?B?Z1h5ZWhwUW1CMm83Q0hQSDM0a0ZnbnI4R09EZkM0S1FjSU0zaUE2YkQxUUZ4?=
 =?utf-8?B?cStqRUowQlhBVVh2MGZITVlhNWtqeWRISW1hdmlaYnlwNXE2MC9MTmhQNGc2?=
 =?utf-8?B?WDB4NFJoNDRJQlRraWJPeUNhWmxVTmdYWElyaTAzeFF4MDZ1S2pxLzdKbHcz?=
 =?utf-8?B?dGlzUDF1Wm4renZFd05CRHF5cHo0d2VLSG1iN0h1ZUxTL3Q0RXRwQVJYcUVh?=
 =?utf-8?B?YU8yMER6MjJyck1RZVlVVmJPcmFWa2ExMWdFUVQ3cHZ2bjdPazViUjhBNTl2?=
 =?utf-8?B?d1R5QTEwQUJGVVllVzZCM1A3cUV5aklOOFpIVS9MVW4zRzVNRHpvK3BlL0tN?=
 =?utf-8?B?U041UUR2ZGUyS2VUK2lsL2FIcmRCNmphSXM0aDFTdkpzekVoK0luUDNGWVJa?=
 =?utf-8?B?U1NTelI0VVRNRDEwR3BhNFd6WXNGVUMyUnZmQVM0ZXlYMjllRW5WWnBPOWRp?=
 =?utf-8?B?bTlvejFLRUxydm1xNUZhK0xUZE9RaG8yTjhkbW45NlNqakZpR1VGQ0ppVEZR?=
 =?utf-8?B?Tnh4bHRmTzk3Vy94Y0ROc2k1ci9KSzFYT1VqZU1kcm5xbEE5S2Z5dloweDVZ?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76949922-d922-492c-9b90-08db76c34be4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 04:02:16.9222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXmK/A62EV/fcqmI4D4YQKAR0ZW2u1ENhLZnvOspAnctw1nWiXhIwM0hrmaEbv5BQosIGg4UK4s+8H59UT3nLig20s4q91e1q7wJLFEmCPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6803
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


On 6/26/2023 8:17 PM, Dixit, Ashutosh wrote:
> On Mon, 26 Jun 2023 19:12:18 -0700, Vinay Belgaumkar wrote:
>> GuC load takes longer sometimes due to GT frequency not ramping up.
>> Add perf_limit_reasons to the existing warn print to see if frequency
>> is being throttled.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> index 364d0d546ec8..73911536a8e7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> @@ -254,6 +254,8 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>   		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
>>   			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
>>   			 before_freq, status, count, ret);
>> +		guc_warn(guc, "perf limit reasons = 0x%08X\n",
>> +			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
> Maybe just add at the end of the previous guc_warn?

Its already too long a line. If I try adding on the next line checkpatch 
complains about splitting double quotes.

Thanks,

Vinay.

>
>>   	} else {
>>   		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>>   			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
>> -- 
>> 2.38.1
>>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D871C4C4E3F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 20:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1FF10E939;
	Fri, 25 Feb 2022 19:03:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B622D10E929;
 Fri, 25 Feb 2022 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645815790; x=1677351790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M+8w2z/zMoLnRalIleLHrU84MsFOBSeKePHbatxaFqo=;
 b=eAitNAB8/vrVqivFcRpexXhTkHEUPCZb3NYOvj1zCm5u/K8WmJNzHhrp
 ec7s/u6figUSi8w/g3Yg5OrPq2ui9uX0fIi7IaffKA/8Z40bumwX3NuNF
 Y/hO7n/VX+OYv/3pkCTGk9Lm3krFEx4Yqb0gX+PlCIIr8pBxFLcu0AMMc
 OYajRq5ksyVk14rylzscSY7Kh4ez5OzEAndZq1e+8P4MSFngybAcy4GCp
 oadJP7N62XfcNSQjCNu5q+aUUp41f2h5tFc5eK4qJ9gdFkL5fOXfXnbhg
 CSAsu/sJZt9oOn5HeUPbZAV1B8T7WwR3iLHBfNJXiwkNZwFESC1PfwZSD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252482882"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="252482882"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="628938868"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2022 11:03:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:03:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:03:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:03:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:03:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PN1ogK6kn0PoJzEDYwTppChX0D7EeDX1R42koUAu4txIqTvbERmtaq2s0C9yN9m9ye9G/udnBZRkSOS++9jjodY07QD1dNXVLEE69lKgIMNIjX4xxjh30u8vZ+Iql+ef0WjlizS8psYKVgqE7vJhd3X064I91QejULIX9CzWi+vvIGW/siSX1c6/q3N2O3ZggbwNw7FibxzbL9dBnP5pyeY7Jqjg0lGeJycBh4Z1WIHAEhL6x/9qsADJcxaBXqfDTWV4t6UD+cvpLFmTsbc6QSgIPrxrLAlXo8weESIXYCWbFsiqZA+42IUwlfLtkL8pWaa0VP8awVYBC1BEYpS+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3xx2XOSAUV/vAtRT3i16qqXrpL75xnYsp0ilV2nnRg=;
 b=C5QMUkr6sU9YxVtP7SQDegzuxiWRv22lU+bWQR4bluzzCsGGdezW4j4StfEqbqvJyK9bd3lQ3qOE6/dw7m7h1I6pPj+1GB4Hv3156yXHHkRLpRNC/HQKWFoPab3v+s9uqvvYgrPVyKZjU98huUm9z+a0SRhQSQuWn8/aeKsiXgwJ/bypgpc3lEv31bCpYOgzu8YpUMf/u3NMNXhrP0+QUKC1grxTNDVsIUyr0b8opFuK9kxl2q5qkqoPXlOC4PbEyszjwKxIAevu/Tk4jDfStC1MEJZL9T/YoL47ZiuqNlSWrRpyXg31YemYGbBzh9C7j+k/O48re0l8x9voI2aVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL3PR11MB5698.namprd11.prod.outlook.com (2603:10b6:208:33d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 19:03:06 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 19:03:06 +0000
Message-ID: <09969620-129e-f032-2f12-0d1adf537e6e@intel.com>
Date: Fri, 25 Feb 2022 11:03:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
 <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
 <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
 <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
 <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
 <bb8d25fa-4b6f-0c53-302a-623787760bcd@intel.com>
 <720fe7f8-a712-c755-9fbe-70ac2fa008f6@linux.intel.com>
 <72ebab5f-1023-b590-f5a7-f5db2333e925@intel.com>
 <34273e9e-8473-d95e-fdc0-47ca9e7ac8cb@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <34273e9e-8473-d95e-fdc0-47ca9e7ac8cb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR18CA0055.namprd18.prod.outlook.com
 (2603:10b6:104:2::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 722c7935-e050-461c-0fdc-08d9f89174be
X-MS-TrafficTypeDiagnostic: BL3PR11MB5698:EE_
X-Microsoft-Antispam-PRVS: <BL3PR11MB5698365E00FB4BD1D0B1C791BD3E9@BL3PR11MB5698.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QoCa2FBEo9yWN0BqSpaceHUpbF3V66dXGLCEt9zwHtlsRRhe79xUlAO4wqSlvFo8/6rtpH9LWCHs/nnAYyWgxyuJPY+kJ2UAw0u/IpWw6BT/SZ+FJfSjxZyWv50wOJWW+/Nuyytjs6GgM3qPWhfdRUyUITDDHWb+IMHb4AEMhqUk+GqzHP/XNYND8F4GQIrRBHAl1nLkg2t055KbX6cUGjxxbZsiVc72MmKe0Rzx8qqAt5uQZpHCnBKG6i2xQxh0CmLYg3G9SDhVCQ3ilitnlYp5mEFjErCQVyM1BgDQ7ZYcoum26LFIqRBBUkCHRcg+Jw2HWRSmj7A5ZzgtgSXBKe4yTz4BTY2qlvZVih/zi88l7QMf4KyJr0lVZi04MGFS48BB1SzwAnnjKBmGEkIMc7pp/o0IhcYilUVecT6Wx48MyDbMpwR4MmDSKqIN+zLLs0zXByg5iQ1IBQLJeiV/5Yoh534TDzkM4g4cfjnc6CMzKPrgF6wUGNajp2yhaapV53sA9fUGk/rfZyVgtYNjsYeB64hsq9rqNvCvApr8zYejlBSYdFYR5iO4dCc/S9s4aLneqxUkmfB+tR6lClggEM5vOrxqn2cDmt+iP/GV7FShUUYVBywpadQ59coa8ZeoX88oOc2idFUkEgCD/l7x8PCH0f8KKbI1TASzBbC1vYSeNFPe6pon9dWOdJmAWocQsp+8L9aJzeX8UQkHoRB+GYWFRt1rUpOhq8OOFe+nTuEySStE0rVX7y/7j9vP5jx8U1k+ptHr2mV5mP8Nz2BvRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(8936002)(38100700002)(5660300002)(508600001)(6486002)(66476007)(86362001)(8676002)(66556008)(66946007)(82960400001)(31696002)(6512007)(2616005)(316002)(6506007)(186003)(53546011)(26005)(2906002)(83380400001)(4326008)(31686004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUprbFU0TW44cmwvZlVYWElGdmxLeWszQU5SMzZyeG9ZckswbXVTMVl4MEY2?=
 =?utf-8?B?bDJSLzVlN01ibENIMzdiMmFrUDBmd1VzNmlYb2RnQWl0M2xTVFhFaVI2Um00?=
 =?utf-8?B?V1NCNU5kV0N2TWE4QUp1ekxFQkhBL0ptREpEbHh0QURoV3lRdmtQV2kzZU5Z?=
 =?utf-8?B?OUFHb3lyZHg0NWxEYzJTR1JwWkJOSEhZTVAvd0dRK0t6RkZLdnBVdm9FY1NV?=
 =?utf-8?B?TFNqNU14M3pTWXNzYVRGYzFYVHVMMmRWQ3RyNVJvejJUaDVwQWlWL1NPRjZz?=
 =?utf-8?B?QlpTNU1DazVGMFVDKzc2WmxJSmhhcm05Y1RhYkFUdnpOWktML0ZOMlA2Nm5w?=
 =?utf-8?B?Q1lvbW1GMklwbUNvTUE4ZDB5d2IxblNSUzBCRjNWNnY4MC93VlhDOUdDYnJK?=
 =?utf-8?B?blZoeW91Zll0a2U4UlJtZTBPWERoM3V5em14eWxqM1pwQXlSRmJ3UkNpanZH?=
 =?utf-8?B?cWZpWDRNQWdDcmhLK3BjdlJpTEIrSEF5NlpsVVRNNXdHc0p2ZzlPVEpKYjYw?=
 =?utf-8?B?TTRtOHZRTFoyRm02aVdQbG9DRDBCV3VlNytKMllIVTA5Qnl0UUFKeDBPc2lE?=
 =?utf-8?B?ckZMdjJkM0EzTVhpcFlkOHBQWVVjY2xsbnBDK0d1SWJWcThiRDdiSXdCOGJY?=
 =?utf-8?B?dENxMUQvVm9sQVlrYTdzU3RUTHc3U2hXT2NOQlNsN000ZUkrQWoxakRycTcy?=
 =?utf-8?B?L01EYXd1Wkc0VkpuNHY0V2pKcGdFV3pFTURZVEhoa2hOb0V5VFVKVHpjeVQx?=
 =?utf-8?B?M2loNzZ6QUk2aVJLekRvWWZhd01TamxJY2lhUXNtTU5pWTRydHB0cHcrR1l1?=
 =?utf-8?B?aHlkVjJnT0ZuT1MzVEdYQVVValRydCtVZExyUGc2cjBycVBubGZlcFRVUnVv?=
 =?utf-8?B?MFl2YjN0cnVVemRiZ2kveVJVR1BSQU9SdGZ1cnk1eks1K3U4WklRSVlOa1pv?=
 =?utf-8?B?OXVYdnVqRmtQVlpnL2NCZlJLUEgrcnFVSFFHUm12akZMOHhGNjR5VllpUnJa?=
 =?utf-8?B?bjErQVJScGdzSDMwVFNmNW0rS1IxUDRFZ2Vqc3Y5SW9OUE9lbHNWc2hwb25N?=
 =?utf-8?B?ZmlHd2t6ckZFU1Q0TzMzZEVKQ2kxU0k0UmQrTXBwZWsvT1J4cGFVbDdrV0Ey?=
 =?utf-8?B?dHJlQXBhNEpIVzBaVm9NU2ljNVZUUm12UkRnbk0wTHJodVJzSXNMeTlRakYy?=
 =?utf-8?B?Q2RCUTBiTHdBVnNiRE0vellEVGhHcFNUcG1tV3lzQ1ZNTkZaUjRtL3Bpa0Uy?=
 =?utf-8?B?RWszUWFzZVBPdWcrcUxCVFVLMHpHSnpLOHpEbHFtdDhLUHl1dkhnbTFHaDBB?=
 =?utf-8?B?L0ZZV0J5SkE4eGRQMVI2eDdKWUNwUWd3TTlIZzZKeWJGZ3NqVUNZYU0rd2Vr?=
 =?utf-8?B?N2E0NDVBNlMrRS9QaFNhTmxWaEsyY3pEY2J0TUpBVjhCK3pjZCtONS9RUzFa?=
 =?utf-8?B?SldwTlF4OGhzdi9ZbCtqaGhxaFEyaVh0Z3M1MzZieXJaeDh0S2JMOElwMUd6?=
 =?utf-8?B?WWZEZU1aakdVMnNETllMdTU0Z1NFbTlOSzRrSGI0aTRVbnRnc2sreVAyNGt3?=
 =?utf-8?B?L0FNNExucGhtb01HY0g0WTR3SlRCQlRmSUxlVHVvUGVIZzhidzBaU21EZWpz?=
 =?utf-8?B?aWFVaEg5VE94TmtKTkpMWW1KbGlFbkkxWEtSc1ozWkNjYkRzQU1UV3hsdFZS?=
 =?utf-8?B?eS9iOEI5L1d2bCtiRmtTREpqakVTdXRLSTV4aGdzc3k5WjZtTVFyS2o0dW8x?=
 =?utf-8?B?TTkrTUZkeFVrSm9tM1RZRENJVUZHcm5uK0FDUElQRWJZby9FbXM0Z1JSdm8z?=
 =?utf-8?B?blhLZGVNRDZoUGQvMERsRFk2R2dRNk9xRUxZQ1BrR3EyMTVPSlhEclZpNGhM?=
 =?utf-8?B?WDFrVDBUNTR6d0pkbVAwbmdVZU5RbjVrbDhMTzJtYlFoOEtYbi9jWDFHcTl5?=
 =?utf-8?B?S0V4WmZPMGFmUnN6MnJncGJJU0FNb3hOcUVaUzdENnBnTlYzdnhkVW9DUXVW?=
 =?utf-8?B?bVpuaFJEWm5mV21jdFptVVlsdVpaRi93NmJ1K1BnV000bGppOGxXRWp6Tml0?=
 =?utf-8?B?RVBic2ZWL2I1Z0RVbGIvZGtiRTdRbXhjRGJxamViOERMLzN0Mkl2Y1Y0NkpS?=
 =?utf-8?B?c2FFN3czcU1LU2pucEZRZG1pc2pXN2lHRGRQejIrcXVaUFdzc2QvdVFnVkp0?=
 =?utf-8?B?SnNBZ1dVWnhRSlpRLzVGMlFkMW4xOHV0Uy9QalMzSlJHT1AwdmY5TlFqUmRJ?=
 =?utf-8?Q?JGpE2iX8UMFti5Qp1IQ/dvdwFRl4NTeczXvknuhtnQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 722c7935-e050-461c-0fdc-08d9f89174be
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:03:06.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7H3xEj+iwvz9+Wfu58f/KsEUukRsaBdUseMiHiqPmUae1qsKzMCuoWFhprlZJenlaT9uUATd89/GmdvdvwyB8hsUdKWAglTLTQwi65lAGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5698
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

On 2/25/2022 10:29, Tvrtko Ursulin wrote:
> On 25/02/2022 18:01, John Harrison wrote:
>> On 2/25/2022 09:39, Tvrtko Ursulin wrote:
>>> On 25/02/2022 17:11, John Harrison wrote:
>>>> On 2/25/2022 08:36, Tvrtko Ursulin wrote:
>>>>> On 24/02/2022 20:02, John Harrison wrote:
>>>>>> On 2/23/2022 04:00, Tvrtko Ursulin wrote:
>>>>>>> On 23/02/2022 02:22, John Harrison wrote:
>>>>>>>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>>>>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>
>>>>>>>>>> Compute workloads are inherently not pre-emptible on current 
>>>>>>>>>> hardware.
>>>>>>>>>> Thus the pre-emption timeout was disabled as a workaround to 
>>>>>>>>>> prevent
>>>>>>>>>> unwanted resets. Instead, the hang detection was left to the 
>>>>>>>>>> heartbeat
>>>>>>>>>> and its (longer) timeout. This is undesirable with GuC 
>>>>>>>>>> submission as
>>>>>>>>>> the heartbeat is a full GT reset rather than a per engine 
>>>>>>>>>> reset and so
>>>>>>>>>> is much more destructive. Instead, just bump the pre-emption 
>>>>>>>>>> timeout
>>>>>>>>>
>>>>>>>>> Can we have a feature request to allow asking GuC for an 
>>>>>>>>> engine reset?
>>>>>>>> For what purpose?
>>>>>>>
>>>>>>> To allow "stopped heartbeat" to reset the engine, however..
>>>>>>>
>>>>>>>> GuC manages the scheduling of contexts across engines. With 
>>>>>>>> virtual engines, the KMD has no knowledge of which engine a 
>>>>>>>> context might be executing on. Even without virtual engines, 
>>>>>>>> the KMD still has no knowledge of which context is currently 
>>>>>>>> executing on any given engine at any given time.
>>>>>>>>
>>>>>>>> There is a reason why hang detection should be left to the 
>>>>>>>> entity that is doing the scheduling. Any other entity is second 
>>>>>>>> guessing at best.
>>>>>>>>
>>>>>>>> The reason for keeping the heartbeat around even when GuC 
>>>>>>>> submission is enabled is for the case where the KMD/GuC have 
>>>>>>>> got out of sync with either other somehow or GuC itself has 
>>>>>>>> just crashed. I.e. when no submission at all is working and we 
>>>>>>>> need to reset the GuC itself and start over.
>>>>>>>
>>>>>>> .. I wasn't really up to speed to know/remember heartbeats are 
>>>>>>> nerfed already in GuC mode.
>>>>>> Not sure what you mean by that claim. Engine resets are handled 
>>>>>> by GuC because GuC handles the scheduling. You can't do the 
>>>>>> former if you aren't doing the latter. However, the heartbeat is 
>>>>>> still present and is still the watchdog by which engine resets 
>>>>>> are triggered. As per the rest of the submission process, the 
>>>>>> hang detection and recovery is split between i915 and GuC.
>>>>>
>>>>> I meant that "stopped heartbeat on engine XXX" can only do a full 
>>>>> GPU reset on GuC.
>>>> I mean that there is no 'stopped heartbeat on engine XXX' when i915 
>>>> is not handling the recovery part of the process.
>>>
>>> Hmmmm?
>>>
>>> static void
>>> reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
>>> {
>>>     if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
>>>         show_heartbeat(rq, engine);
>>>
>>>     if (intel_engine_uses_guc(engine))
>>>         /*
>>>          * GuC itself is toast or GuC's hang detection
>>>          * is disabled. Either way, need to find the
>>>          * hang culprit manually.
>>>          */
>>>         intel_guc_find_hung_context(engine);
>>>
>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>                   I915_ERROR_CAPTURE,
>>>                   "stopped heartbeat on %s",
>>>                   engine->name);
>>> }
>>>
>>> How there is no "stopped hearbeat" in guc mode? From this code it 
>>> certainly looks there is.
>> Only when the GuC is toast and it is no longer an engine reset but a 
>> full GT reset that is required. So technically, it is not a 'stopped 
>> heartbeat on engine XXX' it is 'stopped heartbeat on GT#'.
>>
>>>
>>> You say below heartbeats are going in GuC mode. Now I totally don't 
>>> understand how they are going but there is allegedly no "stopped 
>>> hearbeat".
>> Because if GuC is handling the detection and recovery then i915 will 
>> not reach that point. GuC will do the engine reset and start 
>> scheduling the next context before the heartbeat period expires. So 
>> the notification will be a G2H about a specific context being reset 
>> rather than the i915 notification about a stopped heartbeat.
>>
>>>
>>>>>
>>>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>>>                   I915_ERROR_CAPTURE,
>>>>>                   "stopped heartbeat on %s",
>>>>>                   engine->name);
>>>>>
>>>>> intel_gt_handle_error:
>>>>>
>>>>>     /*
>>>>>      * Try engine reset when available. We fall back to full reset if
>>>>>      * single reset fails.
>>>>>      */
>>>>>     if (!intel_uc_uses_guc_submission(&gt->uc) &&
>>>>>         intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
>>>>>         local_bh_disable();
>>>>>         for_each_engine_masked(engine, gt, engine_mask, tmp) {
>>>>>
>>>>> You said "However, the heartbeat is still present and is still the 
>>>>> watchdog by which engine resets are triggered", now I don't know 
>>>>> what you meant by this. It actually triggers a single engine reset 
>>>>> in GuC mode? Where in code does that happen if this block above 
>>>>> shows it not taking the engine reset path?
>>>> i915 sends down the per engine pulse.
>>>> GuC schedules the pulse
>>>> GuC attempts to pre-empt the currently active context
>>>> GuC detects the pre-emption timeout
>>>> GuC resets the engine
>>>>
>>>> The fundamental process is exactly the same as in execlist mode. 
>>>> It's just that the above blocks of code (calls to 
>>>> intel_gt_handle_error and such) are now inside the GuC not i915.
>>>>
>>>> Without the heartbeat going ping, there would be no context 
>>>> switching and thus no pre-emption, no pre-emption timeout and so no 
>>>> hang and reset recovery. And GuC cannot sent pulses by itself - it 
>>>> has no ability to generate context workloads. So we need i915 to 
>>>> send the pings and to gradually raise their priority. But the back 
>>>> half of the heartbeat code is now inside the GuC. It will simply 
>>>> never reach the i915 side timeout if GuC is doing the recovery 
>>>> (unless the heartbeat's final period is too short). We should only 
>>>> reach the i915 side timeout if GuC itself is toast. At which point 
>>>> we need the full GT reset to recover the GuC.
>>>
>>> If workload is not preempting and reset does not work, like engine 
>>> is truly stuck, does the current code hit "stopped heartbeat" or not 
>>> in GuC mode?
>> Hang on, where did 'reset does not work' come into this?
>>
>> If GuC is alive and the hardware is not broken then no, it won't. 
>> That's the whole point. GuC does the detection and recovery. The KMD 
>> will never reach 'stopped heartbeat'.
>>
>> If the hardware is broken and the reset does not work then GuC will 
>> send a 'failed reset' notification to the KMD. The KMD treats that as 
>> a major error and immediately does a full GT reset. So there is still 
>> no 'stopped heartbeat'.
>>
>> If GuC has died (or a KMD bug has caused sufficient confusion to make 
>> it think the GuC has died) then yes, you will reach that code. But in 
>> that case it is not an engine reset that is required, it is a full GT 
>> reset including a reset of the GuC.
>
> Got it, so what is actually wrong is calling intel_gt_handle_error 
> with an engine->mask in GuC mode. intel_engine_hearbeat.c/reset_engine 
> should fork into two (in some way), depending on backend, so in the 
> case of GuC it can call a variant of intel_gt_handle_error which would 
> be explicitly about a full GPU reset only, instead of a sprinkle of 
> intel_uc_uses_guc_submission in that function. Possibly even off load 
> the reset to a single per gt worker, so that if multiple active 
> engines trigger the reset roughly simultaneously, there is only one 
> full GPU reset. And it gets correctly labeled as "dead GuC" or something.
>
Sure. Feel free to re-write the reset code yet again. That's another 
exceedingly fragile area of the driver.

However, that is unrelated to this patch set.

John.

> Regards,
>
> Tvrtko


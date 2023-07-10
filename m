Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D817274CAF7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 06:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9BC10E18F;
	Mon, 10 Jul 2023 04:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBD110E18D;
 Mon, 10 Jul 2023 04:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688961810; x=1720497810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4YPK78wgxdG78h5Rn3kxFJoQri+q96PWZm15s/BiJLA=;
 b=KiAH0wxYFEuJAlFcETe7L0HMsjEaawPCznBXjJu1r5+8/K4kIKkEfgPq
 +LAvN6oB2+oK6vpXUlvCDcqn/eQABF/2hdi7FnmwdLMBVj7nc+ldG1GB0
 PsXdIfptFgMGAkDWDiG2+DWM/pdEiOHC6TxSnPhSKz5RPmkJNLTT5KdeZ
 fGX5dmLhbMW4HA4PbUxA5ECCMyam/BNXOCV9NCkRz19lw9TxdVoUuCL2G
 GaDNM3BE0NthJNafBAoEN7rt/qREXQa5ZtkbeLoVqFVhTAdwtCfANvwZZ
 KkBSV1gkCk8LHm7N7S+1JzsReUhatPU414eSqGLkorrJaAtoAx3xWypqJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="354109211"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="354109211"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2023 21:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865192534"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="865192534"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2023 21:03:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 9 Jul 2023 21:03:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 9 Jul 2023 21:03:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 9 Jul 2023 21:03:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 9 Jul 2023 21:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEaIK4NqAuJr3Hd5KzHnFtkGbxyKiJ0lV/zTj4Q8eEKQf6B+kJbtXzssKuowS7GM1pZqRETD2i/23Jy+ZZgK5i/NedtS92ITa4Q9kRKvTZ0bT8JXyFEaTIDun3RxkKx06dsQWd0KC+5MOdnL7LQKnmkyDe508gdOj++Q2KgXgDFTmY0zmqnqqpKZWg/i75FBOR/AiE0VyVjxNzLj0xlybpHa4kHOy84zTfTzGLKiRg3hgwD/3+I0BpK1oxJTe1w+2aHQgkyzjU0io9AxVWRw7+aUNuVJJKHBBbl+lUrVhQMNzff046h28vzz7lTbVRNUPnsxPTIGSg7uokDOrXfktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2kNJ6uHNT2wqDnfbzoBAo4U3xTKmV3r2+xDotzJzME=;
 b=GoMnPPEkG8e2x0Y8gPRmBVkEztl1EVQSSl4ws99jn/2N4AQpEzua2E+QoNaJynXLGMS+0U2lSyA6L4XgtJWxMK4z1k5gVvIurPCYpJ1z40MlDjPk0rtEQNoRH+Ll7N3jTaxDz+rmizwL8wxB7YWt8iKrFUqh7V5B/lvlFxnppfyf0YAxniYRsYjj1WPbObi1s7bOL9M7LJx95UJTIl7kLMRTFleA7wv9C40C+63l111DOz9KD61ZN0b7oNMXWj9wc8MwvEVM7+cUZ9W13m+jM3F/+EH1qYg6fsJLtjmtE0T/HBKu+/hBkiDPudwBL5YrWsZvM4tZf7nMdR32+PE/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 10 Jul
 2023 04:03:10 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::60a7:9e5c:928:90c]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::60a7:9e5c:928:90c%3]) with mapi id 15.20.6565.026; Mon, 10 Jul 2023
 04:03:10 +0000
Message-ID: <a2b08289-e7d0-3003-5fd3-fe3a437cb967@intel.com>
Date: Mon, 10 Jul 2023 09:32:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/display/lspcon: Increase LSPCON
 mode settle timeout
To: Pablo Ceballos <pceballos@google.com>
References: <20230614235452.3765265-1-pceballos@google.com>
 <6b49563d-e9e7-ae8e-582e-f4aead06de0a@intel.com>
 <CAO9JgFx2i=S5P6_ndO85k3GFnggyJW1pXavc1emmSC3yjO8M7A@mail.gmail.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <CAO9JgFx2i=S5P6_ndO85k3GFnggyJW1pXavc1emmSC3yjO8M7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ecb730-0386-4475-0db1-08db80fa930a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pow+N70DDlj89HNNeGxtD8AG9VkIJqZUSXcRj662oqr2saZWkPulMZmzV8jBiTglT26DrDaKcy2Q4GpxsDfYFvv0Vbyi8awAe2EU7Vb/WxBjdttBLYEBi1mbmlCW1j/DPgwus4rf9d9RCFbkZqQ99D2cJxTL/Ei1i0nCqVBcqS3GlEs4GST8qJsBO02bW0cX1iIijcbJxyLQFeR12OujMIIMZSmodCkIeZL+gVmqvhqXs6GH2XXMSWegxGo4KC3HtIhGgjgu40r7/2tHQMuTKttrOvFDf80HchxNVM/CHxsFQZak5/SPoX0noeyyjEgWB2lSPE9AGBym4E/ggvXrBNtDy63xGURtJZseL/ppN+58Ce+++CvcVAKV60HpH8vfFKNnKv6i/WRQ7NXajrD2Q/BSHHAn7boqOnzi1pApRLZFTA5cFO4c987cwhr2mlK2QH1fdh+np+6RdyAgfe2JB4afi2DzVFtWGja+1Au+MJMT0sCFuwGJm6ddQhtz43HXKRxbHoyC5CyjZhraCcFQNZEys96HAfhiMpj+sHEFmXrgQVhBVlRtK6E9uBzM0gPddXlFJNnIWcZmw2+uKbAlWFB00mOAshIuA2s5uQUGD7/Uu9t+r63wNtS49XCFnWBqnZH/ZB1D7pLyleYM1LaSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(53546011)(6666004)(6486002)(478600001)(54906003)(26005)(2616005)(6512007)(4326008)(186003)(316002)(5660300002)(6916009)(66946007)(66556008)(8676002)(8936002)(66476007)(2906002)(82960400001)(38100700002)(41300700001)(31696002)(86362001)(55236004)(36756003)(83380400001)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHpFcHFwejJWK1p1bytDbXpVRDYvZXMrdG03bGNETEUwbyt1UlR6Tm43MnlI?=
 =?utf-8?B?WlcxOXR6NS9iQUNneFdLc252T0UrMXhuTWJIaHdZczNoeU1JVVcxTTJabjFD?=
 =?utf-8?B?UEprWnd4WHFyN1VUL2dLUWdWcHk4SkFmbW9SM3JzUUNibVQyTk4vTy9DMk9I?=
 =?utf-8?B?c2x4Sm9hdG82elB4cjExRzZMYlpJTTdSSExSQ2ZidW1ncVlrQTBSTkRiTnpl?=
 =?utf-8?B?c0ovT1F2MXZvTlQvZ2dzTW15dndtaFR1VEtSd3MrNU9ScUcyaCtkNThoM0lC?=
 =?utf-8?B?cS9QWmE5ck5tMFBvRlRoeHc3dVhWS0ZkR2ljRm1PaUJJNE43RHBJMzZzM0lT?=
 =?utf-8?B?Slc0M3VMdklXYlB4eFd2OVcvNWpwU0NRRXludTI1NVhoeWFaNmhTNDVaUjVu?=
 =?utf-8?B?WHVGSzJ0N2lXQ1U2MEFMMVFRTFE0eDM5SnF5eFp0V1VBY0xqYXFCUlRwWmRQ?=
 =?utf-8?B?aXNrbHFFdmdOeHkxVU0zK21hTjhQTnVHTmJMWlB0NWd2cmNTNEVLR2F3MWcx?=
 =?utf-8?B?LzVLOElmMDBkbTR1RWtTeXA3aTM5eHlCWHA1RzdiY0dhTHE2Z2RobHFSNmwv?=
 =?utf-8?B?Wm04Q1FWdmV0cUV2QmdvSEd0cWhPcVdKM0V2Wm5WS3d3aGordWNjN20vKzlw?=
 =?utf-8?B?MVhDak13RmVuODdpTmJ1c2xndzB5MUg4ZGFjZjdrY3dHWW9aTVZnMkxYd3Y2?=
 =?utf-8?B?Mm8vbERFN1lRUS81bVl5M25LUnpFRGF1WjdJQWxFaVgra2Z4VXVlLy9XQ1lM?=
 =?utf-8?B?RmxsWFlXMG1EK0lVSGcxdTlaTGU5NkhiRnRxbDg2Sld2M2U3NGhuU25LMGlx?=
 =?utf-8?B?MXJFWlM2TENoR3ZrMUNMNWlSenNOTVJJQ2s3blBVMHdkZEhsWllLMkVCMFVI?=
 =?utf-8?B?TzFvY2xVbmtRdVo4TE5mMFUxTVR5WWtEMTd2M0o4R0FMSE5LTktYeExlb21I?=
 =?utf-8?B?emQ3RmNWNWZrSkpTMHZ0NWwzR09NbTlrYkZxbXdTYnNoOWNERDUrc2FnZmVp?=
 =?utf-8?B?YmNSYi9Bbldwcm1vMUtFanpmNVpibFFPTm5PQWdTN3g0d2VlSVRVb2hpNXd5?=
 =?utf-8?B?cWp2Z1pndzRuZEl1VmcrQ2tBc0VodzJPdUZSZ08xYU85VUt3V0RiT1VCYnAw?=
 =?utf-8?B?YlQyUHM0WnVPZG03UXlYaWJzdDQ4cnowaUpkV1RJQkVxM0Z6WXhUMC9POCtV?=
 =?utf-8?B?MjdXUzQ0aUNqd3lUMFBGNVhRNDdzRS9ybjZMWVFLR3Z2Y0JtYnRsSzNMSnND?=
 =?utf-8?B?WmxoR0dNSXZRbm5Lek1rZG0zdUxDajJnR2hQNlZFc2dLU0h1RlhWTDhRSmgw?=
 =?utf-8?B?dWlCOFNUWmVoSUdmTGNEWjFGMDVzUHdRczRtTHF1Wi8xZlNTZXNNWTdVdkI1?=
 =?utf-8?B?Q21xb1lwN3V0NC9nSG5MRW1oM0JkV1A5K3E3K2drM01YL25QTEZxWHVEQ2pj?=
 =?utf-8?B?NHpUZnJGdVNiZlBCaHYrNDAyUzJQVGxkS3dSMmZzMFl6MlFzaTg4Wlk3M0tJ?=
 =?utf-8?B?Vk1CbDhRdTBjSFFOTnNaRnMxbStjY0Y3cFR2UlJuaDh6Q25YN0pKNEtZUkxT?=
 =?utf-8?B?TVRWN1BmZGZLQTdlOVdnSFMvRzU4dUNQeEVGMFhzbjJ1eVAwcjRtUGRqWjhC?=
 =?utf-8?B?U3ZQOHZNdGxQWklNTDdURUNuU3RHWkNUdm94TTVjUjJLSkgxbWN5b0I4OThh?=
 =?utf-8?B?dW5OanJCWk9rT2QxZDA3LzVIeU9zVEpQQ3lOSFg3dkMxTnNaM3p5MHN3bHBs?=
 =?utf-8?B?ZU5DS2RhR09UQ0pnSFA3bDc0dHdjcTNIb0hXam5kY0phR042T21QNmNqRnFw?=
 =?utf-8?B?a1NKVk8xeDRkMVEzQWlrbHVtbkIraXpoNGI4MXVlV2x1aVg5QVlSODEwRDY0?=
 =?utf-8?B?OVRUWm5mUWlOZVJ3aTRmV0FOMDRvei9RRHpzaE40ZHNtNmNJaUgxNUlWZENK?=
 =?utf-8?B?NDVVTEs1azQwckZNQjBJdDBFRGxteFltMjBjeHRDdHgwMmFkeFgxUXNsQkFz?=
 =?utf-8?B?TmEvd3JYLzM0Y21ONHhLZWl4SlN2bjdYS25mSXZ0Z3RNQlFhbVg1YVVkTzlV?=
 =?utf-8?B?cFZzS3RiR01NOHlvRWhwMHBaakRUVzYrWTk0WTZJNHJqbWovYjJrUW9SbSsv?=
 =?utf-8?B?QXRQbmxLS3JxdzIxS1VIb1pjT1ZmQUhycXhDblFMVXorQ2N0OG9uMmsvdXkr?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ecb730-0386-4475-0db1-08db80fa930a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 04:03:10.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hQMB0vUUX4PWXH6Q/7tqU49d6UDcjJwnBa/K2Nw8c1Xm4+Fss7D7ahTKk/+Dac6Msn4Q2tSa7r40+GwgsmNp7fIjLoT/RwbGHzb8Psj++Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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
Cc: Sam Ravnborg <sam@ravnborg.org>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/8/2023 1:04 AM, Pablo Ceballos wrote:
> On Wed, Jun 14, 2023 at 9:35 PM Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com> wrote:
>> I was wondering if trying to set LS/PCON mode multiple time will have
>> any effect.
>>
>> Unfortunately I do not have access to machine with Parade LSPCON chip,
>> had suggested in yet another git lab issue [2].
>>
>> I have a patch for this, sent to try-bot, though not sent to intel-gfx
>> yet [3].
> I tested this patch and it did not resolve the problem. The error log
> was repeated multiple times and there were still link training issues
> afterwards.

Really appreciate to try this thing out, thanks. Too bad it didn't 
workout :(

I have seen increasing timeout does improves situation, but didn't have 
enough data points to come to a timeout value.

I agree with the change based on the experiments and data you have shared.

Lets just change the timeout to 800 ms when the lspcon->vendor is 
LSPCON_VENDOR_PARADE, so that it doesn't have any effect on platforms 
that don't have this.

IMHO a function to get timeout value based on lspcon vendor will be 
better (returns 800 ms for Parade, 400 otherwise.)

In the function itself, we can have the explanation of arriving at 800 
ms for the Parade chip (as given in the commit message) as a comment.


Thanks again for trying different solutions.

Regards,

Ankit


>> The timeout value was already increased from 100 ms to 400 ms earlier too.
>>
>> If there is indeed no other way, perhaps need to have this solution.
> Yes, can this please be merged?
>
> Regards,
> Pablo

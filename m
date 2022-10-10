Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B95FA7E5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 00:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4AE10E73C;
	Mon, 10 Oct 2022 22:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D77010E73A;
 Mon, 10 Oct 2022 22:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665442681; x=1696978681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ZFv8MXgXo/ezLrtYcL7XP1x04uPajynOw3Y0RH5tZQ=;
 b=WXVIPlCTd90YwWQYu69yMW7OxcMd8mqmlhqmE6hS1mwjH2XZBh08vUBV
 RJUYsUMysjs8o1V9Wxb4flNDhvlQ3aPOcVgPx6pibdAx74x1U1KNB2THA
 e1Rv7sn+TDTsItL4kqn92o4RpNO5WlDfu9yM6HaYDlmYRf97rgoAVxGXY
 ynYf5mmxSvko+vZTBAnhcFni6MUSQypS3okgSBkCinB3Q3h3ax31e1Hu9
 PGQYr+lZt6Q9zfTuZIzGykXAtnFbHacMbcUHOek30PmFg2TYdEwiQLZYO
 2jBIWoP68EIC3OIZtdaBT6/+ElnUtswVqHc65KaIJbyba80fdh07mRcfN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="305409024"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="305409024"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="694829045"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="694829045"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2022 15:57:31 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 15:57:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 15:57:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 15:57:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQYUegGhhhJ1TK+YgiC8pj7Gu6Q8iVcm8n60qw6E08BsfDDTjKrD0e/LTuxjELUmTgbVXSYTyO1R3eZ22ZZW+TpOx4crvLyQkcUBgUKEOtvwQ0FrZ5ornVSysE9tUKL/wVajZHV0REHFYDnGWWNwGSo34hI7/SFwsTi73LoN/9VJft9mMmwWrDO3yCFptfYHFlvNtYEjQVY+CSA+Px+lBufFKQSDunOseGoO+lfau/jpyBggVk0IX7Myl0nnqzFf8InXX/sEfx619bA1jG8TDWQE0gPf0DHHRmtXbG5rWsTuhzqC5a6xQVhOCHdW3TLwbCqRXa7Icns0huNxOGiM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBnuAjyM7vycV+4NPTKq7G3MhtNuJQ+OU/S6R9AoJnw=;
 b=d8txGrGmLoWxZ8MRr0q7y4RbXQga0nv0JkMGTd4uZBHV4jppduqa31faDoApLo0VTGLqP6uJi++X+T6sKZEcDmkwJQlJd+NwEXuZgqsNLELP1qAFJwkQLXiAgqUO8k2fZpLE9xYHU+w5qLvY/FlajAuzx4WZPCLdNc2BRPz5Y5WYtitERPfy8Ln1RuN4n8oJpdj23LR+ujbAl4VDuYSfPXZftKdr9vCc1UFsQm7AYZgacC3WfMJGTqnlCTgFD81G1kxdZErujSnU0GOGNyuAi7nor7Cjk2QG4sDC4OyGf7A4QdeqpUkqixg+61ujXBazgiW/nGaIZBjwRFJ8OZsOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Mon, 10 Oct
 2022 22:57:24 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8e8:7e00:919e:7a44]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8e8:7e00:919e:7a44%5]) with mapi id 15.20.5676.040; Mon, 10 Oct 2022
 22:57:23 +0000
Message-ID: <02f637e7-2751-995b-6039-715ebc2d3758@intel.com>
Date: Mon, 10 Oct 2022 15:57:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2] drm/i915/huc: bump timeout for delayed load and reduce
 print verbosity
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221010184812.1576601-1-daniele.ceraolospurio@intel.com>
 <0a63f729-f2b8-4782-f21b-00f536145ab2@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <0a63f729-f2b8-4782-f21b-00f536145ab2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df1cd9f-f24f-4de2-afb7-08daab12cb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhPPCyyIrnB3RpVvMf/9baaKHJa/Zp4oxP8HyqxRceFq0OVIR/9O/rh3W2BOP9JG5QdV6UvINzX4qwg5O68oDHbn5Cx3j9nTUnc8PdH1Fkg/g1UbFV/n5AHAg97zyRSwiph0fTYTcIZcky5xjh0aMdEfW3A7D+8A33Pu60WVUPazz0Hc1Fasz80nXQIwPTYLriGgjVtE1e4DPyEJRriQccrxOzfzK60QwEEUUgpXgU7PJyAsjttQ3Qdx1lM9Rzxdl3DnNyyZjpRbcgsViTQbsPgs/+TqP/1EP269RCyNbiHbixPRyBEu63nI4eq/zH885Hp77POpcj8naffsX1RLdDQEsfr/FxLm/aw5XHaOId3G0fy7+ZH3mHs7zFDHpPitdxTOyuJhrn+CYlaPxiEVUHcAwO06kCI8TAQtdmlwOD5ITuIRJPiVgpyEavMG9BQzuczZL5UPsXewXvJJ8+Q2IhYtBj2Q2gSp3Ww9Lx/XL27D0RHDW/IGoZPtzzCTemFD/j0dP0f5uGRCd6rxn9G/0sRqDCcGBtqSqOrw+TIgnWKhdxqcmBaCVCyAWJr37r17hkha3iIq0IqH+RFjDTHFgAFiY+SGNb/0Z8LH15EtJNEvNDPy431RJQXDXTsXgOpkf/haie16dGl23tDCU7HOv3BumsE/04EG8UPDK5m8zr4fytsKth6q1xxCtbq0VxjS+XsGAehFuOMCST6v7O62LTuCDL+AE3Vom1EmqQbNClg2hvlHOHsNrk8MKtet3a7O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199015)(41300700001)(5660300002)(66946007)(8676002)(450100002)(66476007)(2906002)(8936002)(53546011)(478600001)(6506007)(6486002)(316002)(26005)(4326008)(966005)(6512007)(186003)(107886003)(66556008)(36756003)(86362001)(31696002)(2616005)(83380400001)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU9DVThxQjF2TXprTysyOU5SY2ZZR0FjVGpxbFpLamJsQlNmaHRFMzJ1Z3Fa?=
 =?utf-8?B?K3hDbkMxRVdRQ3BNTW5Qa2FZeXM3ZkQ3UVY3ZURacXdxaHBRUTdLdlFOUllC?=
 =?utf-8?B?Q2pCN2paRWFWWXpDSjBOSjJpZS9RNVhhVlk3SS9uekVPdGRndVNIZmVVRExK?=
 =?utf-8?B?NldsOWpYODRWenRsd28yQ0ROSC9BVnBjMGtlUkpiQU52ZWxZcFJrVFRJbERM?=
 =?utf-8?B?c01GKzRJNGVjMFBWUFdHVFl3WG9lSitrL2ZuY2JGaGJqYW9HVW1NYkZKb01M?=
 =?utf-8?B?LzN6WTBKeUJkMjRHUHlMbnBUZDdjWHNkRDBnVnZUc3hRUzNPYzRlZFFaMjd0?=
 =?utf-8?B?Tlpma0k1OG9ySk1PYlR2MDNVNkxlMU53cWxaU0h6WUMxY0l4NGJlYUljQTFE?=
 =?utf-8?B?N3hyaDUrZExqVC9wYkJsT0xLTEdiSW45bDBxaVpSc2lGazc4RmVCc2tqWDY1?=
 =?utf-8?B?NFFNOTBGYUFKd3FmejFLRlUzTVJBaW9kbW9GcHRaTVNzVTRkaGE4eVZWQU5n?=
 =?utf-8?B?ajZ4UTEyNXhWeE9WY2pqdWFacVFHajhPYnBsRCtDeWR4NE85L1grU25USW1l?=
 =?utf-8?B?UVI3aUZocjdaMlV2YnN3YmtYdnhKVWY3WGFRTFQvRHM3VXlEWU44SVMydU9t?=
 =?utf-8?B?OGNETUNlMzF3clQ4c2ZsRDIvcTFWQjlXUEdPVlRWT2NoQUpkaXBuaGdrcVF4?=
 =?utf-8?B?MDZMTXFMSFRwaE5Hb25XS254YzVKb09nTnNiM0VocHUrMGNmVStYSU85dklC?=
 =?utf-8?B?dEZFd1hnczlvaUVsdWlSUzZsQTlRLy83clJxdml5SFdxSTJFaWJYWXV0TmNv?=
 =?utf-8?B?c0hhYmFhYWVXZEFTSldtc0VtRTBGRHBsR1BJdlNYMzJJTFNSQ0l1N2dnUFJP?=
 =?utf-8?B?Q3J3RVh2YlprM2hLdTgzd3RjaEdicU1MbmVFUlp5K29EQ3h0a0RITy92MS9S?=
 =?utf-8?B?bWd4R1R4Y0hYWWk3RjlEeENFcXpjRFJtN0hHeEUwSmtaMGlwSGR0bUJ4dW5K?=
 =?utf-8?B?NG1uQmU2RE1CUHI2TlFJU1dSbkVoRWFmVnVLU2YrN0VGVlM5T2pRdnlCc3Ev?=
 =?utf-8?B?MFhsam5Ld2IxSHpGOTVuTTdYTVFHYkpGYlNleXhGRlRFQWpJWENyZHd1L3g2?=
 =?utf-8?B?TjlsSGtWS0hHa01OeVgwalhOWVJOanR1QmhiSEI4OERCOHZyNjdPclhMOVJU?=
 =?utf-8?B?T3BqZWNvV3RNR09qUzJwTjFNR21VMndyREYzeVdieXVFd0xMVmhPb3R4TW41?=
 =?utf-8?B?MUFBRUJQeTQ4Y0k5U2R4UXhpaEVlOEZKUnRveWN0d1FHcXBDUFg0dlNYQ3Ns?=
 =?utf-8?B?OXo1dTJVTmNaZHpHUk1lb1lLVkF0WG95ckNOUFkxT01manBCT0RjcmJ0VXho?=
 =?utf-8?B?RjZTTmtMdWRKeGIvOEdWazc1T2M1NlRCc2YwZzB4OXJGMnplcy9GTWxoWG9q?=
 =?utf-8?B?YXRRY1FKSWpFNVcvZWRoZU9mZytQU1pkbSttc0VEMHFnTnNIdGdYYW41NlBu?=
 =?utf-8?B?a0JvbzF6bWd2NkdmaS82ZFpiaEFxcHJyb2lESGF2M04xNlR1WGpEKzNGMHA1?=
 =?utf-8?B?ME1ERDY4TTRBSnlSQmZnVEVuMWJ6UTNrcWFycU1hSmdpd0QzOFFTNStZVnN4?=
 =?utf-8?B?KzZ1VEFKaFdPUU0yUkdBZHdTTXdzYWpXNzBPbFo2RUpvTGpQSE9PMkx5a1M1?=
 =?utf-8?B?QlNEYk5KRWx4UGNlaVcvWEJZWW5OVDJrL0d4THNjOEt3SDJVYkVDNEROMnhM?=
 =?utf-8?B?TWhRWmtveHZiY3B0ZlhMRzdieXJvazBNWXJTc2xvVDA1SE9EcDJTSXJHMWlx?=
 =?utf-8?B?OGd6SjQ3aHplZlVUNEtObDFKQVdVYVl6c25VSGhUTm9abk5ZWEovdVl3cDFz?=
 =?utf-8?B?OExmb2dpM2lDSFZpUzJGWGQzZWR4NjhHdkxzS2l5c29DeU52OUFWNHVaQ09a?=
 =?utf-8?B?blVWN1RNb2lXcmRxRWhjMjJkWVZiYjM1YnpFdEFkT2FGUnhYdmgvTXpXbThT?=
 =?utf-8?B?K0RCeGx2WkViMWVXZk9lck1RSWZFbVhJR1ZhNUdldkd4akJHcHVoc1lHOWR5?=
 =?utf-8?B?MGxyM21iT3dTalYyZjdYVFlBTkg2d3UyU2xkdWVJS3BzbEFVYVhZRy9OZjRN?=
 =?utf-8?B?OGFvNUhSUzFSWDFuL1JGRDFMUlYvSWNPNnJvWTF5WHdHY1dXT2hFbG5DNk5S?=
 =?utf-8?Q?bZg2I/kW66JhO7FqeLqrvE4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df1cd9f-f24f-4de2-afb7-08daab12cb3a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 22:57:23.7321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEZJwc8EdmCYHqEFgixhMbYqvUNm6eQkm9rkFg5wz59MSumNKkVAszty+y+dGiAjs5S1m3suMvOgsgMz/C+VvcdNTC7CUHnmaxZsA/SBPyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
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
Cc: Tony Ye <tony.ye@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/10/2022 3:50 PM, John Harrison wrote:
> On 10/10/2022 11:48, Daniele Ceraolo Spurio wrote:
>> We're observing sporadic HuC delayed load timeouts in CI, due to mei_pxp
>> binding completing later than we expected. HuC is still loaded when the
>> bind occurs, but in the meantime i915 has started allowing submission to
>> the VCS engines even if HuC is not there.
>> In most of the cases I've observed, the timeout was due to the
>> init/resume of another driver between i915 and mei hitting errors and
>> thus adding an extra delay, but HuC was still loaded before userspace
>> could submit, because the whole resume process time was increased by the
>> delays.
>>
>> Given that there is no upper bound to the delay that can be introduced
>> by other drivers, I've reached the following compromise with the media
>> team:
>>
>> 1) i915 is going to bump the timeout to 5s, to reduce the probability
>> of reaching it. We still expect HuC to be loaded before userspace
>> starts submitting, so increasing the timeout should have no impact on
>> normal operations, but in case something weird happens we don't want to
>> stall video submissions for too long.
>>
>> 2) The media driver will cope with the failing submissions that manage
>> to go through between i915 init/resume complete and HuC loading, if any
>> ever happen. This could cause a small corruption of video playback
>> immediately after a resume (we should be safe on boot because the media
>> driver polls the HUC_STATUS ioctl before starting submissions).
>>
>> Since we're accepting the timeout as a valid outcome, I'm also reducing
>> the print verbosity from error to notice.
>>
>> v2: use separate prints for MEI GSC and MEI PXP init timeouts (John)
>>
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
>> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a 
>> fence")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tony Ye <tony.ye@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 4d1cc383b681..41c032ab34b3 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -52,10 +52,12 @@
>>    * guaranteed for this to happen during boot, so the big timeout is 
>> a safety net
>>    * that we never expect to need.
>>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to 
>> be resumed
>> - * and/or reset, this can take longer.
>> + * and/or reset, this can take longer. Note that the kernel might 
>> schedule
>> + * other work between the i915 init/resume and the MEI one, which 
>> can add to
>> + * the delay.
>>    */
>>   #define GSC_INIT_TIMEOUT_MS 10000
>> -#define PXP_INIT_TIMEOUT_MS 2000
>> +#define PXP_INIT_TIMEOUT_MS 5000
>>     static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>>                    enum i915_sw_fence_notify state)
>> @@ -104,8 +106,12 @@ static enum hrtimer_restart 
>> huc_delayed_load_timer_callback(struct hrtimer *hrti
>>       struct intel_huc *huc = container_of(hrtimer, struct intel_huc, 
>> delayed_load.timer);
>>         if (!intel_huc_is_authenticated(huc)) {
>> -        drm_err(&huc_to_gt(huc)->i915->drm,
>> -            "timed out waiting for GSC init to load HuC\n");
>> +        if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>> +            drm_notice(&huc_to_gt(huc)->i915->drm,
>> +                   "timed out waiting for MEI GSC init to load HuC\n");
>> +        else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
>> +            drm_notice(&huc_to_gt(huc)->i915->drm,
>> +                   "timed out waiting for MEI PXP init to load HuC\n");
> Hmm. It feels wrong to assume that the status can only be GSC or PXP. 
> Granted, it certainly should be one of those two values if we get 
> here. But it just seems like bad practice to have a partial if/elsif 
> ladder for an enum value instead of a switch with a default path. What 
> I meant originally was just have a single print that says 'timed out 
> waiting for MEI GSC/PXP to load...', maybe with the status value being 
> printed. I don't think it is critically important to differentiate 
> between the two, I just meant that it was wrong to explicitly state 
> GSC when it might not be.

It is guaranteed that the state is one of those 2 in this callback. The 
only other option is an error state, which we set from the 
__gsc_init_error() below. I can make it an unconditional else, or add an 
else MISSING_CASE(status) if you think that works better, but given the 
errors we've seen I'd prefer to keep the prints separate for extra clarity.

Daniele

>
> John.
>
>>             __gsc_init_error(huc);
>>       }
>


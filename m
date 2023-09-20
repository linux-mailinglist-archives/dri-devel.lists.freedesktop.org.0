Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECF7A8066
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D1A10E4A2;
	Wed, 20 Sep 2023 12:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB2610E49F;
 Wed, 20 Sep 2023 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695213411; x=1726749411;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+LZ5bNBk3XBl0lhpiVgELZqu+xpxpvj4pBLjSxtgLXs=;
 b=f3nng3CHGft/guIwCVsj1scj7B1lWZqWzf4PBRyQF4MPPkHkoTjSLKa3
 bMmlZiNKz4s7u7OSQgICJoDO6BrJ1bxZcr7OgcM17ywV6MyHl0QW6bbKa
 WwjOsFeYGLGB5aEn0+iHvF47Uw51qR3dFieznYYle9NbuyoPr/3QFYCiZ
 r1tdPPK7xo/NQj9vAHorkIURDoXP/M4+s/4mrIbW+nTIZTg8ubv7kNS6V
 nnKc8QN8eJog8eMh1NuZhTEDElyJ1M3uEbBAIHPBZ6qQ6JfqsJlpQHojZ
 5Jyv8yWdBRA9wQ/boYg/uWdcq02VA8+Hyy2quDtc76K/4Xs3Ppre0PC9x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377513344"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377513344"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 05:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="775986724"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="775986724"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 05:36:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 05:36:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 05:36:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 05:36:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 05:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYFJwYO8mzNKZ8+3fLJPZkwDIuok4Lgtv9hZR5gWBzewso94xknwLy1f680LNLyhT++yTRcAHKbK98FO0CFrkp6tiu7qNiJ9Aihgcj6GDLzWaV2Kdw3ZprrcakDHmbmY3sqm0BxzW4iE2XikIbfTSXv+X0CBCz3OdcDnVWWlDIURovALtZ+N2Em85avsVGn7dRyj4DIgYBB+v0bXdLojbxrlAcYeOG3dhDI8OY7PuLcfGqglOpF1MTFomQlKtM0HnzX3uJHqUaOqKzl/vZQkCI88THL4poCxl7fGM8MXy+86w8v+LBpIIMNoPPjhry0W66wzwjm2eNZawTBN25D+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukWo0dJPbetW9XLrcA+WWyC3uaQUtcakmhvYGTjhLD4=;
 b=czV+F/lBxyASfdF954Q0VZuQwgrpzZNsclvxByLN99rDqouOk18EMV1eeVdl7mi9rICx/mwjgYnSjckYSy3C7IHGtYIA9WYJ1Exid4bTZaFVDbBa5ULfCtsG1vkHrbtOnL5B3NBhrw5eSnRKar4aVjPG6l79RzChIHEOqdBctzHoiX7H4cvP0pn8ghJGkdw7q8rubDG451dkNV+o4HBsWGuikdkVpvFzBYY7XP9Mmw7JwWOSCTKbNN7XiGQUxWJBWLiBH9HGrnm0WkKQfacRmWrUU6fZVrf/OFM4ojZAiv15xu06bqTBEwiYUO0OwuaQfd81FSltT28r5fI/YtV24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 12:36:45 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::5fb6:7200:97a4:b7e9]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::5fb6:7200:97a4:b7e9%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 12:36:45 +0000
Message-ID: <c9f1ffe9-1e96-ec36-3e0c-c972f726b65c@intel.com>
Date: Wed, 20 Sep 2023 15:36:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915: Remove unnecessary memory quiescing for aux
 inval
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20230920111131.2696-1-nirmoy.das@intel.com>
From: =?UTF-8?Q?Tapani_P=c3=a4lli?= <tapani.palli@intel.com>
In-Reply-To: <20230920111131.2696-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::30) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|BN9PR11MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8910ba-b047-41ed-7bd8-08dbb9d64035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8gTvDEBnXAtF1NATU6uyuqSMhZCrsGwjJKr7cwxQUqZ1C2geQ6d6VVYTfmZLcqEwYDNfeMBdXlno4QTK8JcgKQ41brNlfwKWNqZ104z+Lfl4RFeu7rYDO1maTm/idYf/R7AMt7jBmiK8suRVz6R387TTuVTbk0+INht6rVphIBTqFIEF7CQHb3bmJmJaLb63PXrusjGWbiXorPn63wZmxIY1p4HrSn6bZGimJzhAKwuvbkhSIby6VQ0y+WU1VQIraR2MIWK7Yj+f5qM9gxrQtLYGwfHMihdREP4IjHIIQyTRtBK6AIsZ89SV9oVmCNEwKHlI5sMH2MHQCX1hwZHu3GmTTThT+iIL3Z4v7I7+gWbtKfTkVSKgJ2x9z1c0M5egCz3QS6/E4cfTODeAsgIQrg602FGmFT4TNTHSbiznfnIcMisASIoG83SJdnU3V0LCTfhVnSAkcBhvbORlwUWVF2P1RA9mISvmTC2C4soN2muiBU166KKbJ6F1WjMZDeuwWRE9Co5FA+Am0SvdjdJrEqPhDUV/6vBeEx60+ECH1egLDocxnqXAXoe5h3pBgPfSQWI7kfyebiA3Km1edzfmj5/diK80Y5PzKLkSKFnYCtCNGL7vyCp8ju7u7ox+M99BQg90fYTBKgGeM+TJU1zMO3hH2tEhJcY+YAKGUothD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(1800799009)(186009)(451199024)(66574015)(83380400001)(5660300002)(54906003)(66946007)(36756003)(6512007)(6666004)(82960400001)(6506007)(6486002)(4326008)(41300700001)(8676002)(2906002)(66476007)(66556008)(31696002)(316002)(8936002)(38100700002)(478600001)(86362001)(2616005)(26005)(31686004)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFkaERsaWJGOWZOZFlWeEFMeHlqTEZjbVdqUThXakhndjhIaUxkSDBHYnVz?=
 =?utf-8?B?V0V6WkxEWk5NZ1VMNnVrQWxqZ1NacDdCYzFNUVd3R0d3MzJKK0VVYlJJSzJs?=
 =?utf-8?B?RnhTdXdmdGNyVWRqRkRtaHZGczJCVlRiQnNEc3VPQW5EcXFVZlE2TE8yaUJv?=
 =?utf-8?B?MThiNkNGb3hFcWg4YnpMWGZXN1FUV0RkRWU1NE93YkdSS0FOblJEQThTc0RG?=
 =?utf-8?B?MmY2aitBcUdwYy90MTlaTWZJOVVjYkYxZ1liSzdReXAwK3lOaFNSVDVBRXpY?=
 =?utf-8?B?OTI0TlovcHZSQ0JkdzJsVkFZd1Jsc3JuM1FVZk9uNkM2SSsvckNDQVh4ZU50?=
 =?utf-8?B?c2ZnWFdNTU55U2xxaFN0NkVrbTdPNFdPWVBmNmt2ZzBsNG9CbDZxNzl1VHls?=
 =?utf-8?B?cndsTWduZ3R5UUFRcGxCNXErMndGSzlmdkxDTnFvWVlpTStFeUlySnpIY2lp?=
 =?utf-8?B?VnJPMUJTejN3Zk9WUEFURXA4WXc5aWFrUUZBZEw3VHdjVVI0QTFmRVhFWkJM?=
 =?utf-8?B?d3NoSkN5bXRTSkIyeEQ2U0dQbUo2dGs2SGRRZXVzRXd2dzZxUnZkbW9CeXhT?=
 =?utf-8?B?ZkdPTk1TTHFCWUF5bkljRjIrRFMrQXJ1Tk55bHJPQVVWcjI4b1IvZU15SEpj?=
 =?utf-8?B?N1NHOGlZVEhlTlFOL1o0R2RBZ2RQTHZYc1Z0ZTdsa3gyTEF5ZEk3aU5HSEJQ?=
 =?utf-8?B?bWdxWTRvd2h5K2ZCVWt1S29YWDkrWFY4Zkgxa0pjQzNPWnBhN0ovWnp6WU10?=
 =?utf-8?B?REZSOFZLNFl2ZGtKZTFNZ3gwb01UdktlMHZaN2hvcGpyVUdiK095VFNNQlNO?=
 =?utf-8?B?bjRyNGVPTGhjUjc0Y1dZNkdsdER6M1grZmV6VGphUWloRytoSVVoODJ2M0ZD?=
 =?utf-8?B?clovZFJ4dE5oRTU2TTkvSkhlV0ovTktLbFBoZFhLTCsxeGxDR09FeUhMNDd6?=
 =?utf-8?B?UjFpV1dHREVlckgvWkhIZm5INjhXNzBLeGNaZjFZa29LeFRtZk9Rcjc3UjFu?=
 =?utf-8?B?WWhtYlRmWFlsaithU0M4K1UyUzlWSnJQSHRkV0lMcGhzREI3V0NlQUZxaVI5?=
 =?utf-8?B?cFFjanJadzBiWm9SbmVIbVFJUnVucVZYTm1wWFFZZkRWVEJGbzNKVEJBQjV3?=
 =?utf-8?B?NVVJdk0zNlNTWEwrYnc0QzBCVnhEenU4RzhwdEttOVlvOHM5L1dGc2dBekJV?=
 =?utf-8?B?SlhlempYYTMrcTJ0emg5QmVaakliVkVSNElFQ043WkM5UDFwMWxHRHYrZy9I?=
 =?utf-8?B?ejRTVzlyN3FWdGp0V09DTTJvMTJqaUg3ZEpYTjhIVVE2WTZvdzJyaDF0VWdp?=
 =?utf-8?B?SWNmc3dydjRDNDJNbEJPbmpFK3lQZTdFNGZ1SUYyYjFVUXFiWDM5cE5yR0g1?=
 =?utf-8?B?OWx2a1BFY1JtbDQ2QlpVMUlqV2tNaGpyVkFVeVV5Z2VDSWFHWUU4K3JKTzNY?=
 =?utf-8?B?YTZDd3hIc2lIMVVxbmpIL0ZCSDU2MnArdG01L1Y1U2lXWkc5T0RvRXNmOGIz?=
 =?utf-8?B?MFpGVHNIZUpHTEg3ek5ZQ0NKdkFuVTQ4L1FJbC9mWFJJOWVURjNCRUlNcExn?=
 =?utf-8?B?SlMvUC9pZFNwUUZzM3pOVnROSnZiVUhLb1hkdVFZWFdSWk15OEo3SkY0RXhw?=
 =?utf-8?B?RFlxTDlvTTRsVGtVTXZwV0g5eWdRRkw5QVVLQ055Z1hwUlRLNTFZUEx3ZmI5?=
 =?utf-8?B?SW95N2xoY3hPdnV5Z3pUQXljMTFoV1dkdCt5L0djVTF5Y2lIMVFaZmxXZC9C?=
 =?utf-8?B?KzV2OWRxbjQ5cGVQOWZETjZ6UEYxUnlvNEhzQmpyMU10NmpCazg2TmdzVXNH?=
 =?utf-8?B?NFRFVnlHWCtUYyt6THgrUXA3TGk5eTVoWlJ1RTRoYTlXQ0s3dC9ZK3FZSDNa?=
 =?utf-8?B?RFVRYWFXUUxZcTJCQ3dBbjc0ajZMYnAza1M0R2xadXhCT1JtT2swd0VZdll5?=
 =?utf-8?B?NFlVZGR2OGtIcGFkbi9mdTdua3lYM3pyT080eExjRTZ1Q2xnQis5SDRRK2dz?=
 =?utf-8?B?MlVrOTV1OGNOZ09TSHJnMjRVM0IwczhDZ1ZxMWlOTCtyM3h5NGNZSmxUSXRO?=
 =?utf-8?B?bXFDeHhlNERKbFhHZ2l6R3Y4Umk5T3RtZ0ZSRFpWYnQyOWpENk9PMWx4VkJZ?=
 =?utf-8?B?ZitpMlJTTyt5eXZLbUNSeTl0VzcvTEc4MTZVN0JMbkxrV3lzNkhWZnpudVJG?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8910ba-b047-41ed-7bd8-08dbb9d64035
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 12:36:45.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wioe3BxJ60wH0i0wmLXNiFJAdcFFAxWFIuYrh74+jy6oIIXc0SfhwEHZPt9TdsJKDw7mMiqHL/VmxeMFGhhv1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5275
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I tested this first against tests that were failing for Mesa and it 
fixes all of the regressed cases (TGL LP). Also did a full run of all 
KHR-GLES31* and KHR-GLES32* test groups in the Khronos CTS suite, no 
regressions observed.

Tested-by: Tapani Pälli <tapani.palli@intel.com>


On 20.9.2023 14.11, Nirmoy Das wrote:
> i915 already does memory quiesce before signaling
> breadcrumb so remove extra memory quiescing for aux
> invalidation which can cause unnecessary side effects.
>
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Tapani Pälli <tapani.palli@intel.com>
> Cc: Mark Janes <mark.janes@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 50 ++++++++++++------------
>   1 file changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0143445dba83..5001670046a0 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -248,11 +248,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   {
>   	struct intel_engine_cs *engine = rq->engine;
>   
> -	/*
> -	 * On Aux CCS platforms the invalidation of the Aux
> -	 * table requires quiescing memory traffic beforehand
> -	 */
> -	if (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
> +	if (mode & EMIT_FLUSH) {
>   		u32 bit_group_0 = 0;
>   		u32 bit_group_1 = 0;
>   		int err;
> @@ -264,13 +260,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>   
> -		/*
> -		 * When required, in MTL and beyond platforms we
> -		 * need to set the CCS_FLUSH bit in the pipe control
> -		 */
> -		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> -			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> -
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> @@ -800,14 +789,15 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>   {
>   	struct drm_i915_private *i915 = rq->i915;
>   	struct intel_gt *gt = rq->engine->gt;
> -	u32 flags = (PIPE_CONTROL_CS_STALL |
> -		     PIPE_CONTROL_TLB_INVALIDATE |
> -		     PIPE_CONTROL_TILE_CACHE_FLUSH |
> -		     PIPE_CONTROL_FLUSH_L3 |
> -		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> -		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
> -		     PIPE_CONTROL_DC_FLUSH_ENABLE |
> -		     PIPE_CONTROL_FLUSH_ENABLE);
> +	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +	u32 bit_group_1 = (PIPE_CONTROL_CS_STALL |
> +			   PIPE_CONTROL_TLB_INVALIDATE |
> +			   PIPE_CONTROL_TILE_CACHE_FLUSH |
> +			   PIPE_CONTROL_FLUSH_L3 |
> +			   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> +			   PIPE_CONTROL_DEPTH_CACHE_FLUSH |
> +			   PIPE_CONTROL_DC_FLUSH_ENABLE |
> +			   PIPE_CONTROL_FLUSH_ENABLE);
>   
>   	/* Wa_14016712196 */
>   	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(i915))
> @@ -817,14 +807,26 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>   
>   	if (GRAPHICS_VER(i915) == 12 && GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
>   		/* Wa_1409600907 */
> -		flags |= PIPE_CONTROL_DEPTH_STALL;
> +		bit_group_1 |= PIPE_CONTROL_DEPTH_STALL;
>   
>   	if (!HAS_3D_PIPELINE(rq->i915))
> -		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +		bit_group_1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>   	else if (rq->engine->class == COMPUTE_CLASS)
> -		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +		bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +
> +	/*
> +	 * On Aux CCS platforms the invalidation of the Aux
> +	 * table requires quiescing memory traffic beforehand.
> +	 * gen12_emit_fini_breadcrumb_rcs() does this for us as
> +	 * all memory traffic has to be completed before we signal
> +	 * the breadcrumb. In MTL and beyond platforms, we need to also
> +	 * add CCS_FLUSH bit in the pipe control for that purpose.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +		bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
>   
> -	cs = gen12_emit_pipe_control(cs, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0);
> +	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1, 0);
>   
>   	/*XXX: Look at gen8_emit_fini_breadcrumb_rcs */
>   	cs = gen12_emit_ggtt_write_rcs(cs,

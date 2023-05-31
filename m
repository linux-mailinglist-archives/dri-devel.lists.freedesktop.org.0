Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5471725B
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD4D10E457;
	Wed, 31 May 2023 00:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C011210E454;
 Wed, 31 May 2023 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685492413; x=1717028413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PN7UQK92PomJN4nv2TW/OABgCpccB2I+qngaNXXGrUE=;
 b=WjiGkvkSFhGlB8jh9dkY7ynNfpL2vrt19oaKAbw2hY6+XcBE21IZ8POO
 JU6Lq9XdkwTHBkOfUf7+L2z72R2QANA9E8iSXTBcxkgGz0X2BX5lvENT4
 czkgqo3u+A+bMYwSR6HfegqRBmc6qgGOKo5V6wefLfHhbCBUyhhQxUICm
 GwOUkW1J61CLCUPWywXhcGbI0RN5dO4K0w1HWeUKFrkgCjzidYs2xmI/M
 kb8SXKeKwRt3+Z+VfW0njABPcMVaGRrXum2mTiLMgLeTrTQ4gsHuGnsLi
 0h3HvP+Q8Dc/2cLT5781GdRTMaNlasIUQkPI0fr+qQZVyongYrcZY1/Dx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353930736"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="353930736"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657074372"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="657074372"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 30 May 2023 17:20:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:20:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:20:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:20:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fILmbBeZ9Q0e4gF0EbyDee6zN1miM41zxDRnBPtpoxMtEkommeKWVCHPY7/m3DTBpLwcteWpVwarjqZKxIYaTzpOIhHIKo07r+pUoh4KqguTPf8B5/TBPfQCUPx0RXpYXt/pa3/N7Cut2BIYBHSUyeqDcv5BjDp98/Y+nVa7kE25+UWA/QcPBkv5LkPMv0bGirUQl5Ij6U7ge7DnJOSC9Jm8p0fF3snJcYndzl6RtVgOm10N6APgN5Pnq3eoBM7WckoJj+Tvav3yTJ7WVxuVO1MJclw1e+3WVBJf8FzT0YVGBZ7l9f5E92yZOPjiNqivsomhMI4bqibN2jMs29DLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEuYjUc42xvMx1lAYcEBPxGE6+4UM2688EuUudughLw=;
 b=GXFxCk8+bNbnH5fphES3rT/vywcht/I22wZNErKOceKr3rrW8wBgGOqDZO7388ivmDTLz+QZuyjJsGRdSywS50ejz6553f6PorzMsey6FkYv4SUDC742bym1IxoffgqWBKrJlMdgtgdWnRbKM8Vy6oE/bRzJbGG6stE+RHFkSYjUYQUoez+Z5VvJLgPxneG+X/qaerNh6M5j3PhY4Vco/VsvVybBbzOrfOAYDarSfkJbT6AcYDxpKjE313cs9lEWM4q6EdumlZ9TEdVdU14gmeKTbc6KsdWYYoEZo53NGmtEUGuFVL1xdh3dBndXMqMnPEIYIFnrCGqNyEj4vkqYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 31 May
 2023 00:20:07 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:20:07 +0000
Message-ID: <25098541-912d-a699-5c73-b3c9bb621214@intel.com>
Date: Tue, 30 May 2023 17:20:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if
 the fuse says so
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-4-daniele.ceraolospurio@intel.com>
 <2dffc6ef-5981-8b6d-c580-44671d396c98@intel.com>
 <37ba47dc-b796-5ae0-b098-43b30ed5e4dd@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <37ba47dc-b796-5ae0-b098-43b30ed5e4dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d55c9d5-c370-497e-3efa-08db616cc980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uaD8uTSLZdRttpWZfSB1S8Vi4czfeF0tnZ1DSJGFKEEXvqBivghLdwC04K7BhnzMnEmvK8EwEGotKh2TKZ8mZ3joSkPQdUXcDCcJdaoNwGHsMewjPRzDzAup/bAfgZ/vf02oFwsueJ2+F4iPh6FxVA2rjx2G803sKBak3D6NIf93w7lMrV0xHWs+PxD7BFcso59AbGSzd+TGmVrkGUjg97yjXM6YZNBkB8g+8asZXjYoSMxnqKCbEqwy9vtmh4FsjMAV5/8v9d6RV5lqgoCXSZQrQ7BtNTAdaw+pVPhwxczJpjuPopQ16hVN6zzdX+uS4mWxVtZFGAzpgHc5esXRPhRuxnhCbomA+cBdfk9NMm/WO82tewIPPhlOfKuQvuEMf/CJ5WNFUyjZuxG2RxyofG1uFM5mK8G0bx4Fv8sWdAOdSs5TSINFWMX6Vbau0Cr9tZhP4hpxle56oOQesmJQbX9udquW3cFuo0XPLRgHv//ywHviMFVGZYGiUSNykEpAy7eQO35GGhyEQb4LaHuNZsSE4sohXJa7a0DHKcTgACZRb9DxKldkG599WkUTUGTJ41JmZDfvhNi1ERfC/IbUxXoblWNFRfOUc1Cpo0l1EBzUp0RcxqO15erk6lK/ERDotiVWvTotYwLaUnTN3+BNRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(31696002)(6486002)(86362001)(41300700001)(4326008)(6666004)(316002)(450100002)(66476007)(66556008)(36756003)(66946007)(2616005)(5660300002)(186003)(2906002)(31686004)(53546011)(6506007)(6512007)(26005)(83380400001)(38100700002)(107886003)(8936002)(478600001)(8676002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blF3b2IwYmpGM2x6cFZBd0d5dmdqUlFTSWp1VXkvNWFnbVhBOVd0NGlRM1Vw?=
 =?utf-8?B?NDk1bmk4ZTU0WW9yWVY0RDdVVkl0Z09wV2JZbWFIelZwTUVEOHhSb1dwNjQy?=
 =?utf-8?B?SFlmUWpBVnloNGZtWGxTTGpMRndiS3Vyd1U4VVU3NWx3V25IL3h3a05BUExq?=
 =?utf-8?B?SStqNHJZK3BJaUdJbmxja0xwVXF2VWEwbHIrOWoxZUdWU1B3QzNEbjBBNm8v?=
 =?utf-8?B?a2FZdGsvdVQ4Zlk5WlovVFZNaXVTZ1FnelU0dGpUV1VVbGtZandiZDhFSFQ2?=
 =?utf-8?B?Z1JGWFFPZmJ5TEhHNXhPZG9CWHQwcS95WjNtc05QT3FxQVVXOXhFbEdyVEFu?=
 =?utf-8?B?a0loaUpCRm9FR0oxM2pUQkZKNWJSdUM5T2V1ZFhWelZib21YTWJmTUxFbHIx?=
 =?utf-8?B?SzdLUzJwTThqMHU0cjdpbWpFc3M0NjFSUGNJYzd1VXczZko1aCtsdHV3bVJh?=
 =?utf-8?B?elY3dFl3aGNwQUUrbzh5eVI4b3VWaEcwYi9hQTdUeXlDRDNNRHlkYTA0OURn?=
 =?utf-8?B?SnJaWTRvUnhEWVRvMi9Dc1VpT3hBY1N1K3laWHo4TXlXRUxQWGVLaGt4Nm1t?=
 =?utf-8?B?cjFHVTFHUVZhTENsRWM4TlZaSzU3d3ZCdWNTRzVmaXJhYjFkWUhHYTlXQ1hh?=
 =?utf-8?B?K0tVd2V2ZU9vTnRvTythWXFFNmw4bmdYMDdFZnJZQUlVWXdVclR3aFNvQjBH?=
 =?utf-8?B?TU9mRTR6TzR4TjBBTVlGVlFBc3NENnViUUIxK21BR3FvaURDd2RFWGxqU2JI?=
 =?utf-8?B?TzZqL0pDMmxnbkxwNjA3YnhyRzV0enFBM2N4bHRwbWQrZlJQK0FBVERxQ2p4?=
 =?utf-8?B?dXlGSHVyTGxiK0t3dUUwODdzYzZmdVRpc01XTnFuUGtkdzFDeWw2NGJNenpC?=
 =?utf-8?B?alhEU0w2Y3NtS2lqSngycDNQeTk3U1RyQld5SXJsTW05L0taTTVRV014eDdN?=
 =?utf-8?B?OWZlazZmenBwMUtva0FsbFAwNWZUZmxRVTQwZ3luNFNEWFp2cVRqY3NITHBh?=
 =?utf-8?B?STl6dDcwOThoUTF1Q2xzVmRQM1BOWUR4YjBTU3dPUGRSbzYrMEQ2WU1sdWlL?=
 =?utf-8?B?SktqK2ltY2Ywb0xDZnBzU0N3QlhBaEo0Nkg5Q1Z4aU5pNnNqYnkzekVnYytO?=
 =?utf-8?B?d3R1TThMaFZMS3p3ODZTMDRhck9HUEtLeVFYQkFSQk9DSmhUeDErRHVoRWU1?=
 =?utf-8?B?dURtYUc2OVppcVJCNUtyNnB4SVNVQ2hZaVJuR3E0cytka3E4N0Rmb1grR29X?=
 =?utf-8?B?ZWQzUUZRalNndU4xczFaNkFJcGVIRTliUGN3TW5OeHNTQUNIWWtLekxDRWNv?=
 =?utf-8?B?ZWVORUk4bDdjdkpVdGRkRHpEOG9wczI1dGh2dkJyOGZsRVhaNHpDRlQyMmpW?=
 =?utf-8?B?QnFNaGowRFdVOHlLaDZYZjNlazVuWll3ZWN6N2hzeGxkS25zRng2aU5iM0JR?=
 =?utf-8?B?QXAwb0djdVdKbEdSd3JzYWJhcy9SY3UvYjlwZnIwdUJkMVo1SFhYZFAvcEhw?=
 =?utf-8?B?d2ZnTVlmRVRETkNMdmNMT3lPTDB3akkrWjNheXQxNUhLSnRnd0l6bTRHbjdN?=
 =?utf-8?B?TndlK21GMndwVk15SThJamJESG54bGNJc2oyMkRXZmxNRkFmeVE4eHpCbTdP?=
 =?utf-8?B?bEFmclFPT3k4SmdzaitTQ1VoejVCaWg5TTJTU204eVh6TFJTcXh4K0ZtYjRD?=
 =?utf-8?B?UGhpQ1FHM1lIcE1IUXJYTENleVhNN2NXeE11WnFPSUFSNFJyeGtERmFaVHJW?=
 =?utf-8?B?Mzg3UmVKQ1JBb1orNTZralltVjMzR3Fkem9ubjVvUjJZNEFMN1BUTGpuVEdF?=
 =?utf-8?B?amxLWVRob1AyaEtlMEsreXlGN3c2T3p5TTNHRDNMeEJFQUxzUmJWbytIMCsw?=
 =?utf-8?B?RG1DRTlYR25waHZ4QTdwdXdLMTQ0cHo1VStzTXFYSXl3TTZZMFQ5bWtxSEhT?=
 =?utf-8?B?THVHYnIyK01jeEVHL3FIMnk2eVZhS29kRHZYNTlyVFNXa1lORUpQeUg2Y2tZ?=
 =?utf-8?B?TVpRcmZkRDN0ckN3WVdpWVFMcW96bjFBdWl5VndYQUdYZitQaDNyeE8wc1o1?=
 =?utf-8?B?QmJFMzR1M3BnbnRvUGxGbnpnaTdTZTZ6dEZNS0IzTC9XWkpUMU5IMVBHL0E3?=
 =?utf-8?B?NEI3OHNCU05QZmVwY0o4Wi92RHpSSDVMNDg0NzhDQXBKdHZWY29YTnpnci9n?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d55c9d5-c370-497e-3efa-08db616cc980
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:20:06.9686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiSM1Zrnsnwzm4UKClIWDMhDcIio9/iJEV/zO8EcLVoaidLcvIrBJG2yhzvgpJMdHyU6B5W/xN1GW29xs2IDo5G46bkZPX5LuahTCpEZ04Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/2023 17:11, Ceraolo Spurio, Daniele wrote:
> On 5/30/2023 4:51 PM, John Harrison wrote:
>> On 5/26/2023 17:52, Daniele Ceraolo Spurio wrote:
>>> In the previous patch we extracted the offset of the legacy-style HuC
>>> binary located within the GSC-enabled blob, so now we can use that to
>>> load the HuC via DMA if the fuse is set that way.
>>> Note that we now need to differentiate between "GSC-enabled binary" and
>>> "loaded by GSC", so the former case has been renamed to "has GSC 
>>> headers"
>>> for clarity, while the latter is now based on the fuse instead of the
>>> binary format. This way, all the legacy load paths are automatically
>>> taken (including the auth by GuC) without having to implement further
>>> code changes.
>>>
>>> v2: s/is_meu_binary/has_gsc_headers/, clearer logs (John)
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 29 
>>> ++++++++++++++---------
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +++-
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++++-----
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>>>   5 files changed, 29 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index 6d795438b3e4..37c6a8ca5c71 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -298,31 +298,38 @@ void intel_huc_init_early(struct intel_huc *huc)
>>>   static int check_huc_loading_mode(struct intel_huc *huc)
>>>   {
>>>       struct intel_gt *gt = huc_to_gt(huc);
>>> -    bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
>>> -    bool hw_uses_gsc = false;
>>> +    bool gsc_enabled = huc->fw.has_gsc_headers;
>>>         /*
>>>        * The fuse for HuC load via GSC is only valid on platforms 
>>> that have
>>>        * GuC deprivilege.
>>>        */
>>>       if (HAS_GUC_DEPRIVILEGE(gt->i915))
>>> -        hw_uses_gsc = intel_uncore_read(gt->uncore, 
>>> GUC_SHIM_CONTROL2) &
>>> -                  GSC_LOADS_HUC;
>>> +        huc->loaded_via_gsc = intel_uncore_read(gt->uncore, 
>>> GUC_SHIM_CONTROL2) &
>>> +                      GSC_LOADS_HUC;
>>>   -    if (fw_needs_gsc != hw_uses_gsc) {
>>> -        huc_err(huc, "mismatch between FW (%s) and HW (%s) load 
>>> modes\n",
>>> -            HUC_LOAD_MODE_STRING(fw_needs_gsc), 
>>> HUC_LOAD_MODE_STRING(hw_uses_gsc));
>>> +    if (huc->loaded_via_gsc && !gsc_enabled) {
>>> +        huc_err(huc, "HW requires a GSC-enabled blob, but we found 
>>> a legacy one\n");
>>>           return -ENOEXEC;
>>>       }
>>>   -    /* make sure we can access the GSC via the mei driver if we 
>>> need it */
>>> +    /*
>>> +     * Newer GSC_enabled blobs contain the old FW structure inside. 
>>> If we
>>> +     * found that, we can use it to load the legacy way.
>>> +     */
>>> +    if (!huc->loaded_via_gsc && gsc_enabled && 
>>> !huc->fw.dma_start_offset) {
>>> +        huc_err(huc,"HW in DMA mode, but we have an incompatible 
>>> GSC-enabled blob\n");
>>> +        return -ENOEXEC;
>>> +    }
>> The comment above doesn't seem to match the check. The comment says 
>> 'we can load the old way if possible' whereas the check is more 'can 
>> we load the old way if we need to'.
>
> I'll reword it.
>
>>
>>> +
>>> +    /* make sure we can access the GSC if we need it */
>>>       if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && 
>>> IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
>>> -        fw_needs_gsc) {
>>> -        huc_info(huc, "can't load due to missing MEI modules\n");
>>> +        !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
>> This test still looks wrong when you read it. I think it needs a more 
>> detailed comment. Some kind of explanation that the modules only 
>> apply to one platform and the engine to a different platform. Or even 
>> breaking into two separate tests with an 'if(DG2)' between them? It 
>> certainly confuses me every time I look at it.
>
> Is it clearer if I split it like this?
>
> /*
>  * if the FW is loaded via GSC and we're not on a platform that
>  * has the GSC CS, we need the mei modules to access the GSC.
>  */
> if (huc->loaded_via_gsc && !HAS_ENGINE(gt, GSC0)) {
>         if (!IS_ENABLED(MEI_PXP) || !IS_ENABLED(MEI_GSC)
>                 // error
> }
>
It is guaranteed that if the GSC engine is present then no modules are 
required? And that if the GSC engine is not present, then the modules 
are all that is required?

What happens if the GSC engine has been fused off? Or disabled by some 
future module override, workaround, etc.?

I thinking it would be both clearer and safer to say 'if (DG2) {check 
DG2 specific stuff} else {check other stuff}'.

John.


> Daniele
>
>>
>> John.
>>
>>> +        huc_info(huc, "can't load due to missing mei modules or 
>>> GSCCS\n");
>>>           return -EIO;
>>>       }
>>>   -    huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
>>> +    huc_dbg(huc, "loaded by GSC = %s\n", 
>>> str_yes_no(huc->loaded_via_gsc));
>>>         return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> index 0789184d81a2..112f0dce4702 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> @@ -39,6 +39,8 @@ struct intel_huc {
>>>           struct notifier_block nb;
>>>           enum intel_huc_delayed_load_status status;
>>>       } delayed_load;
>>> +
>>> +    bool loaded_via_gsc;
>>>   };
>>>     int intel_huc_sanitize(struct intel_huc *huc);
>>> @@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct 
>>> intel_huc *huc)
>>>     static inline bool intel_huc_is_loaded_by_gsc(const struct 
>>> intel_huc *huc)
>>>   {
>>> -    return huc->fw.loaded_via_gsc;
>>> +    return huc->loaded_via_gsc;
>>>   }
>>>     static inline bool intel_huc_wait_required(struct intel_huc *huc)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> index 037d2ad4879d..3355dc1e2bc6 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> @@ -50,7 +50,7 @@ int intel_huc_fw_get_binary_info(struct 
>>> intel_uc_fw *huc_fw, const void *data, s
>>>       size_t min_size = sizeof(*header);
>>>       int i;
>>>   -    if (!huc_fw->loaded_via_gsc) {
>>> +    if (!huc_fw->has_gsc_headers) {
>>>           huc_err(huc, "Invalid FW type GSC header parsing!\n");
>>>           return -EINVAL;
>>>       }
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index 9ced8dbf1253..b752a7f1ed99 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -186,7 +186,7 @@ struct __packed uc_fw_blob {
>>>       u8 major;
>>>       u8 minor;
>>>       u8 patch;
>>> -    bool loaded_via_gsc;
>>> +    bool has_gsc_headers;
>>>   };
>>>     #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>> @@ -197,7 +197,7 @@ struct __packed uc_fw_blob {
>>>     #define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
>>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>> -      .legacy = false, .loaded_via_gsc = gsc_ }
>>> +      .legacy = false, .has_gsc_headers = gsc_ }
>>>     #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>> @@ -310,7 +310,7 @@ __uc_fw_auto_select(struct drm_i915_private 
>>> *i915, struct intel_uc_fw *uc_fw)
>>>           uc_fw->file_wanted.ver.major = blob->major;
>>>           uc_fw->file_wanted.ver.minor = blob->minor;
>>>           uc_fw->file_wanted.ver.patch = blob->patch;
>>> -        uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>>> +        uc_fw->has_gsc_headers = blob->has_gsc_headers;
>>>           found = true;
>>>           break;
>>>       }
>>> @@ -736,7 +736,7 @@ static int check_fw_header(struct intel_gt *gt,
>>>       if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>>>           return 0;
>>>   -    if (uc_fw->loaded_via_gsc)
>>> +    if (uc_fw->has_gsc_headers)
>>>           err = check_gsc_manifest(gt, fw, uc_fw);
>>>       else
>>>           err = check_ccs_header(gt, fw, uc_fw);
>>> @@ -998,7 +998,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, 
>>> u32 dst_offset, u32 dma_flags)
>>>       intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>>         /* Set the source address for the uCode */
>>> -    offset = uc_fw->vma_res.start;
>>> +    offset = uc_fw->vma_res.start + uc_fw->dma_start_offset;
>>>       GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, 
>>> lower_32_bits(offset));
>>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, 
>>> upper_32_bits(offset));
>>> @@ -1237,7 +1237,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw 
>>> *uc_fw, void *dst, u32 max_len)
>>>   {
>>>       struct intel_memory_region *mr = uc_fw->obj->mm.region;
>>>       u32 size = min_t(u32, uc_fw->rsa_size, max_len);
>>> -    u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
>>> +    u32 offset = uc_fw->dma_start_offset + sizeof(struct 
>>> uc_css_header) + uc_fw->ucode_size;
>>>       struct sgt_iter iter;
>>>       size_t count = 0;
>>>       int idx;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> index b3daba9526eb..054f02811971 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> @@ -120,7 +120,7 @@ struct intel_uc_fw {
>>>         u32 dma_start_offset;
>>>   -    bool loaded_via_gsc;
>>> +    bool has_gsc_headers;
>>>   };
>>>     /*
>>
>


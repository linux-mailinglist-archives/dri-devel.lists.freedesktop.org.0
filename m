Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D533F6C71
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 02:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1083D6E0EF;
	Wed, 25 Aug 2021 00:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767306E0EE;
 Wed, 25 Aug 2021 00:07:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="215577823"
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="215577823"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 17:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="526920813"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2021 17:07:19 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 17:07:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 17:07:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 17:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K65SmvRvNhm7S8ZuQsbGvchh00e9FVZmzlmNkKP7FewMRRyMM7FnywU7TdqL61+FTcwSfb69BBioiZ1Fv6l0AR9fxlLcIveFO1rZHj4UhgDa/X26mVKDiDa/DB0MOa/2pcABLT5Te8k7uY0b5uAZ7CNB3q7ul1bZzPp2mD7++n8DvIXGSkSW+ylB04L5HVQBwc3zY4lgPe2ELiJAtzXGS5akA57jFwVo3aPiqgyMr7BbQiKtqQvzBOlYOSeZaQCDqcZiH3OF+tEWvS+2pvLEcUKvE0ACa6aClUspY/QlqqQa52OOhqxc44bjLGON5PLG2rWSX4NO7eHw0+FuVcWWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaHn37S19x1c65ZQW3lJ/TetzdEmTjRwMMtIfte6OCY=;
 b=F7v7nHDhECHyWtAebDt8s1PPy1EZgwo5LwRZeOnsUY94mAodghlRdpl3DcBNUrwPQv2lQKZs1IMMNXBAndZU9NOfMFIF18oOaRXXazKjId+ocdOoJzIMlNz6pJEwvhBthU0vojqKJmIzDggPgi/8a0jKnNG+XhxpWd2i6744Bj5TmLBJeEdLbiyl9HH3RokG5+E16y5FF9PDvn/yn+3sBaYfIk1gS2TwNOUMua+0XLSLJDIjZeupUcWGfTde66uSBzu/tXGLm4ItAsdnHgKWkItcDV8tHWFTiyCACKB+m3uq6wKUO7LJ3GhkuI5tbSyybtQ1vgfOx4vrJs5I6nE8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaHn37S19x1c65ZQW3lJ/TetzdEmTjRwMMtIfte6OCY=;
 b=fSphDcRCKEzxqZEBLDsxVbjDmqFldVAPQV2CEx3xAv9jTbZQKq2j3jm4YdgKKkeebDQX7p2ejCuDaqAemRbHtKP1E8xyXeaiLSLt93um8M6N4WNsi6Egwz0PjG4g7Y9892F6rAYtIwlDhONng4h8J9UfW3odpy3mLgHZHz22lOE=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH0PR11MB5380.namprd11.prod.outlook.com (2603:10b6:610:bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 00:07:16 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 00:07:16 +0000
Subject: Re: [Intel-gfx] [PATCH 11/27] drm/i915/selftests: Fix memory
 corruption in live_lrc_isolation
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-12-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <1b23ca1d-7fc1-b812-8e1b-144ee2bc8b8a@intel.com>
Date: Tue, 24 Aug 2021 17:07:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-12-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0347.namprd03.prod.outlook.com (2603:10b6:a03:39c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 00:07:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b6ce86d-b149-488c-9b61-08d9675c4c62
X-MS-TrafficTypeDiagnostic: CH0PR11MB5380:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR11MB5380880A5C6919F11E3346CAF4C69@CH0PR11MB5380.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+w0coTtTqjYEJ32h/6+o4SET6cxVEkRqBmpDejrLLw6NaM+eR0LaEKHl3mRQyHzEjC1gCrsFbrqdX1y6KAHJvrtZuGXJsou/wkMxbJa0uPZP5wNM8lVHf2FdRVSq4C/EVCJwwOZ0JZMQWPAdnBj2mEbm2EuEtWxj/X7Bbz4Nsfoia93f5CS3mDZ6890W6cGl3RmlLh59HR1ICJHoTtPz1EIM6akNZrHHduFOzFuvD5qpgKZAcjOy4jBTrWxYFSWCcQbvhPQytGQevybo2rMUz1LyNMfJLER9OwTImMhqBaWESFHiVbmZLOlNA+33oA4CHmja9OlU0y7LujgPTHzubYjX2DQsG+Fw500OKId4M4J2whxiSfQX0yNpTQelllUlCln0rczyVQVewWERdsGmYGrJ0I6nGAV9Jil0e8Fo7nrnN4no5Oq9152GLAEeliay5mDWV+o7ypdna2LSSZJ37jlWByudsiH2HkY4GUWkRiHjla98ju5SyYxHJGVoHntFfzRvGoEqOBf/AOG+6ALOrmflGITnkdGRAet7HGKp/ttndNWskbPSHhtuHtQCPirj2RLmK1aEFLydBRTWjjwQM8UpbHIPAPXJnMv6vrXzWAC/Tmjym+Rh3lPNLghGOvf6q2le77Uws5HEBNRMiZChhOcQTrkZgPUdOVNkAx2p2vDn4tbJP/S3w/U67uGaIBEtCO0qTlDjtT574s8QvdRxu2gSGOPcSR6SCZfGjgfJEIkvvXUWstHZo5PTkvWnDlmQvt3xL/yjGNne7WFXSBNlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(186003)(36756003)(31686004)(38100700002)(8936002)(26005)(6486002)(66556008)(8676002)(66476007)(66946007)(4326008)(316002)(5660300002)(16576012)(2616005)(956004)(83380400001)(2906002)(86362001)(478600001)(31696002)(53546011)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDJIWnV2ZGNHQnFsV2QrdkFPMGxkRGtVY1F3Qk1Wano2M1IrNEo2TUQ5SjNt?=
 =?utf-8?B?VHJXSHRzT1JCNEs1T1hjMWRlVjQ0MXViMGpheS9kbmFwaDkyYVZpcEJJdEQ5?=
 =?utf-8?B?c0laNFJNS2NabXRud2Nyb1RkSkVoUzc2d2JJbmhGYVNvejg2VDZySVU5TzJh?=
 =?utf-8?B?c0ZaN3QvaSt2b2xUeElVVjV4aEdxZ0cyM05UczhoRk9NQ1g1Zm5IUEVjYzFl?=
 =?utf-8?B?N3VSY053bjZuNW1UOG45SFlZMG5QMlZWb2F1czRUSStVYnRQeXIxRk9yTWEz?=
 =?utf-8?B?N3B4WlE4VTk5WDkvYnBkL0FiTS84WWgzV2VpdFRUeVVkeWhza1p1S21ZTlN4?=
 =?utf-8?B?MTlWSEt3QXZ1L1B3OHRtOUd6L3dYNUtSdEUxSzkvbE1WK2JWbFViRDkxc1Yw?=
 =?utf-8?B?aDBHUHViY3lWOGQ3b3RjT0lYU1ZJNGJpbnlNTWFiZGNWTG9BYUloODhHRnpB?=
 =?utf-8?B?ZHlSZXlEK1BXaXF1YmQ4cjliQTBycGtRWnJHS09MZVc3dVdvQUtnMHcvbnhT?=
 =?utf-8?B?TjVtVTg2SEc4NGF0anRVWUttajVaUC9XcWk0L1g4UTB1akJyZFlLTmptd2FX?=
 =?utf-8?B?bHFUejZuTExRNXdFSkxHSnorNHlOdko1ZFFtOEFGVXNLMFpnaXFrZmJPaDAz?=
 =?utf-8?B?VmdNcDBtL0liVFNMV2o2NVZsQWthbmVIdVl6cjJSMndOUnQwYmZoQXY1WUtq?=
 =?utf-8?B?Z2F6bE82Mk5KOUF3dktsSUdJYW5DYVJZdEVrUnRQeVRyK3p5UmczdnRISXR0?=
 =?utf-8?B?Nnc0SFVYY3kzcTdyM251RTVvbnJxRFFLb1Y3T3d0NktPVVlRcFBjd3IxdUIv?=
 =?utf-8?B?Y21hR3ppSURIbURKdFhxc1hhRVp4MTdqSHJSMzRidWVvYkNEdmpLYXpqVkFa?=
 =?utf-8?B?cVdhQjE1Q2JEeEdpL0FvNmNtQzJpRWwrNGI0ci9SRWRHL1RncnhsZ0NrYSsr?=
 =?utf-8?B?NVdHc3cyYVdubjA3QnpFMm4wek9QYm5BR2NzVUM5UVdKZmw3T3RJb210clpB?=
 =?utf-8?B?WmFUYVN2V3VPeGtDZlJlK0hyaEs5aWZ3Vk5BaTFLNy9LZCs1L3VlTUpXMXhS?=
 =?utf-8?B?czFxTmVEeXRaOXNNWVBnaStXQk51aUJzV2cyalh0dzhTVnc5My9DakVZQUJF?=
 =?utf-8?B?VFRzWjQ0U3EyczE2K0J4YXhtaE9SUVFRY1E2VUljQ2YxUWJwa1A0ck0yMUpy?=
 =?utf-8?B?cndNOGI0dnA1aTNrZlV0dHJwT0k5ZS9JeFFoTkY3SGdEcUc5L2srNmtvdkVI?=
 =?utf-8?B?WU04SHZ1aUJxYzM5QzVPbGtxUnQ4WGRZa21TTFFyUFd2TkF5ZDVQWnlzcHhm?=
 =?utf-8?B?eXFVTlEzcXRmM01nNk5oeTQ1VUlMT3FNdW5ibmJJVjFLRzh3b2JnckYrcllm?=
 =?utf-8?B?MHdoVXdJRFk2d0lkcWE3alZYM2VvTWRpK0dsMkM2Qy9zWUcvTDFPS1l3RzhG?=
 =?utf-8?B?WEo0amNxbjlVaUVaQ1lhVXlKTTh3Vk1jT1hXdFFtUUk4bERRYzdlZmpWeFFF?=
 =?utf-8?B?K1VrNGd1UUlRUkREUXlKeTdxZEtLM2xCTFlHZy9sZ2RaKzdkN3pseFk3eUFw?=
 =?utf-8?B?UE1sT3B3Und1UWxhU3NFS21xUS9DOHhUU20zaEFqNXZtOThJL0NVN0hnM2FU?=
 =?utf-8?B?a0NwOXRGYmN2YUNVSllhT1hLZk5RSmV5MEIrdTNiOEtWdDVreFdxeFNBUTQx?=
 =?utf-8?B?R3lNMWFiUldYbmUvWlQzZDRGai9BUTFtMHBQRHN1c0lYRHZHOERyaVlpRDhw?=
 =?utf-8?Q?wphdRzIbnRthS90F4S6YfT/bbwyJ99XVIOxxIIk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6ce86d-b149-488c-9b61-08d9675c4c62
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 00:07:16.7810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY4mCvXtZYfGlHa/3tcq5PYxhhCSoPxb6DNwcSUAAVrKVtj8OwZywZW7PCLvOsE+JA+JR2b8f4xV70OYZrrV4Wt3oYetD0koF/5OH+I9ytw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5380
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> GuC submission has exposed an existing memory corruption in
> live_lrc_isolation. We believe that some writes to the watchdog offsets
> in the LRC (0x178 & 0x17c) can result in trashing of portions of the
> address space. With GuC submission there are additional objects which
> can move the context redzone into the space that is trashed. To
> workaround this avoid poisoning the watchdog.

This is kind of a worrying explanation, as it implies an HW issue. 
AFAICS we no longer increase the context size with GuC submission, so 
the redzone should be in the same place relative to the base address of 
the context; although it is true that we have more objects in memory due 
to support the GuC, hitting the redzone consistently feels too much like 
a coincidence. When we write the watchdog regs there is a risk we're 
triggering a watchdog interrupt, which will cause the GuC to handle 
that; on a media reset, the GuC overwrites the context with the golden 
context in the ADS, are we sure that's not what is causing this problem?
Looking in the ADS we set the context memcpy size to:

real_size = intel_engine_context_size(gt, engine_class);

but then we only initialize real_size - SKIP_SIZE(gt->i915), which IMO 
could be the real cause of the bug as the GuC memcpy starts at SKIP_SIZE().

Daniele

>
> v2:
>   (Daniel Vetter)
>    - Add VLK ref in code to workaround
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_lrc.c | 29 +++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index b0977a3b699b..cdc6ae48a1e1 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -1074,6 +1074,32 @@ record_registers(struct intel_context *ce,
>   	goto err_after;
>   }
>   
> +static u32 safe_offset(u32 offset, u32 reg)
> +{
> +	/* XXX skip testing of watchdog - VLK-22772 */
> +	if (offset == 0x178 || offset == 0x17c)
> +		reg = 0;
> +
> +	return reg;
> +}
> +
> +static int get_offset_mask(struct intel_engine_cs *engine)
> +{
> +	if (GRAPHICS_VER(engine->i915) < 12)
> +		return 0xfff;
> +
> +	switch (engine->class) {
> +	default:
> +	case RENDER_CLASS:
> +		return 0x07ff;
> +	case COPY_ENGINE_CLASS:
> +		return 0x0fff;
> +	case VIDEO_DECODE_CLASS:
> +	case VIDEO_ENHANCEMENT_CLASS:
> +		return 0x3fff;
> +	}
> +}
> +
>   static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
>   {
>   	struct i915_vma *batch;
> @@ -1117,7 +1143,8 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
>   		len = (len + 1) / 2;
>   		*cs++ = MI_LOAD_REGISTER_IMM(len);
>   		while (len--) {
> -			*cs++ = hw[dw];
> +			*cs++ = safe_offset(hw[dw] & get_offset_mask(ce->engine),
> +					    hw[dw]);
>   			*cs++ = poison;
>   			dw += 2;
>   		}


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE165F16AC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 01:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5C910E0F5;
	Fri, 30 Sep 2022 23:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA36B10E0F5;
 Fri, 30 Sep 2022 23:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664580824; x=1696116824;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l5eSnkQxXLqvzW4h9ILGqWgY1VP66CQfBQu04poXZUs=;
 b=oJS5kXVPLT03P74WK2AuQEigsYOeWyPm0hs4oVqApWPB6uSkkeBDE3Xu
 7a9zYk/WEBCM/BhyJwpRSPc9QHXH1y+gewMtmoz/ftuZUgTmCu9ecTJDm
 Z25v2+BZjZ9OoFAwYZ1wqEJguWGZO6p67xQswtP4CJrso7BE/YrgSvjjj
 xgm7+QUAw6MopjDuFKqfljJAlxdH0HtbPBsJOmeqS3tf9qLPucvCUID3G
 Ev25kGdOX7Q5X+mwm6N7hqSVs/OkqmLmTjUMMFfjqv4UI3/mPeDDmjN4r
 iMXyGSxtKAWnWU77qQfSRvR5RbkQQSEgpHW8MOHPRxXk1yw95tb1/anvW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="285447186"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="285447186"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 16:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="691422885"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="691422885"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 30 Sep 2022 16:33:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 16:33:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 16:33:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 16:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOGl2NRJD1XRtroDQv9V9iT7ScuXVlKw24dHFVpnWqBlcUItY9x0B9KbbtGOxBGGMeBy1Sbn9/DuU9RXAXD1phxQ1upmZa7tgOHEnajor2dQ7aDRNWYLCZB3/OzLvS/Cpu2IoWs+qsY8rKC9UErVl7KlbDwAhla8RpOD4ADlxwnJ9I2veNScOC6XqXd6P6h+g/nxJbeWxHluyRQJ6v7z/VadVy95yuQkHZahk/zg0bHFp5oXXm80u3CLc9NX6m+SyKdpF90pmxOoyKZ1AgmORGdF/HjrEpSyvmW6fG3n4be0DZkfRgIr3Izo3t8BKTRdXeGBZCC/ty2NlRD5b4Tptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2PKV3wwSSwSeMSbc2myT2Nem7InjwqVQzHxSl8sGSo=;
 b=LNFP8ymFclS1OwIsq87+9KerZyBm2sZ+v846NleXCf/qUqM0WGZi58g5nIhWC6SP/hHXqDx9snkig5IBGLjGLnx9EaWPKxPxcSrw3WMJdAAYUoi8gw2xAH1Wx2T7Xp144oDoGUocgD+waTY+nYKMFByskTGjf6Cqu8GARTN67XlCdet3RfX7XyO+OVgm3hUEXRtdwAFY1AOvWH/qWUZ2kcHnJU4QliD1aQWwO0Y/5X1XpbF7huYOi8BK0Nl5ogE4Sp4Cgfj8Cc8ah/EKml/9kUtQQ4JD1ATN8YGOC2jGttq0mU/o6EfupluIQgRDNMR4dNEtOrnmxk2GpOO5nOtn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Fri, 30 Sep
 2022 23:33:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 23:33:40 +0000
Message-ID: <ba816df4-7364-9056-55af-fe278fedd84a@intel.com>
Date: Fri, 30 Sep 2022 16:33:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 4/7] drm/i915/guc: Add GuC deprivilege feature to MTL
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-5-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220922221117.458087-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY8PR11MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fcf6876-09e4-4236-1bbd-08daa33c34ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4E8FJmwtJKbvjeDJaylDAtsRDbKv1U28Pm6kvD3qVfNHMF3BnVa+Oi6THhlxH31wV9h8VSU05YbjjIfFCY1+ab5uv8Y/v3xoLSA7pcFZL/HDne5NS1JGQy2e/UEZ4jTvJEEpE7pGIRiqUBLk3/yRt+5cyjbVUSPsi67sElWclprOzguuu8QZHz5U2xVPOvumf57TjzKaz/6onRR0nGWYn1XyfL8LyNE/PX0TA/jZNppiqASBBrcbVA/+4k7LsKWnjYtt8a9QjP1iOb5UmfsvIM1WQcPrRpt6yr/YM+mIggo1ZhXpqs20kgHI0A1U+LLF6GS1cj19andcs+SHhQL7fYzbCO67HtV7e/rFxldcmnSTnLn/+PIvMEANtGyJQ3DKAaVJWpMwv4mjgpTSq7PAOU8BD63xfWg7E0fC5iVyxNvjyNR1vPeVywpbcWXh358hhmDYW5fZRG6KSEa8jEzDgZsIGD597WxyYpDN4sgtigxIyuuzS/Hrc4xi9gtjDseGOGwCCYlljGdnsVzGgNT0S/30TcAKZQtq06GPyLV7KenxYyhBx1Qv6TXI33QQvNBtx2BjNJaiWI6kDwPIzHzkxkiV/m5Rv7hO8JtZFOctnrRIiVGZEwZ4VCyURukE/iaE+I8P89g1CEO9FmQjWITCta3MaFsnJBWnAvUuqNG6ZiaDKrYDHUWWSKqAvb7uFsXPPTDxEg9iR3tI8cb8Huq6GG4qOfqzxa4Tm3R27Hm51JDZ7zmlNY5O7qPHIirSjKYv479FoQybtOOolXWGvf+0jX5tPuXIJZUg5n69Kbi+7TQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(86362001)(2906002)(66946007)(6506007)(41300700001)(82960400001)(450100002)(5660300002)(66476007)(6512007)(54906003)(38100700002)(478600001)(8936002)(6486002)(107886003)(36756003)(26005)(186003)(4326008)(31686004)(66556008)(8676002)(53546011)(31696002)(316002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWdkUFlrM2k5WDNyRnBzbFZOOTRCZVlvbUdKNHZ5eG5GU3dibWZmdmJNSmR2?=
 =?utf-8?B?b2R3UHdzcUI1dkt1SXV1a1ZBbjNkSWRmQy8rQWRUekFzVnRIVEkraUZGTnY0?=
 =?utf-8?B?V2xmQ1g3Tm5NSGFuY01pKzEwVC91OGQ1MktmaWJObjJhbjdsUWNxVFkrUXJY?=
 =?utf-8?B?RmJhWG52dDVQK2VmeGxHVS9SNXV3TmFlZjdWdkxXbUx2RmUwaFRiTHNYOTl0?=
 =?utf-8?B?Y21WS0w2RVY0amU3dGR1aTdPdlErWCtLYytzZTRWRW02VXM3d2dBK3dTaHV2?=
 =?utf-8?B?WUY4aVVMT1QzT1Y0amYwQTBiRGJWLzNLa0F0bkNOSFJDNnVWZ29YWDNEdkVp?=
 =?utf-8?B?NllFZG1HRnpaTnlmVWE0N3ZwSk5qcTJnblE1aFhSZzZjMUR1RDhOcVYySHZo?=
 =?utf-8?B?TlhabE9vTDV2R0pkbld6VmpmVWJ2anM1bjhKOTN0NDNrSmtmMlNkL29rNmts?=
 =?utf-8?B?K1ZEY3RvV0g5SWlaMnh4SDYwWWI1NWlwZ1hMcEpqek9jdGsrQytGNU5XRFlw?=
 =?utf-8?B?TzNXUHY3YWY2cExDa2ZTK1hGQi9aY0J0Q2hyeFQrckpDcGoycUd1eTZLL3k1?=
 =?utf-8?B?b1E2aTc2UTBCK1RFYmxQeGpyNVRSaHE2N0VBVERBdGlQN21ZK2RsVXlObmh5?=
 =?utf-8?B?YWxycWFNbTBsaEhuUnZmK1l2ZG5ibzdJdDd3eDB5ZUZzcVVabHp3eSt3bVVV?=
 =?utf-8?B?bE0zUm1EdUdlWUh3aWhJWXpjdmExU0RZRk5VWC9uS0pVUzRLWHpHSkprSDZL?=
 =?utf-8?B?aVEwendWT051STBsVW4rbVlPUGtvOUlVcTBNL3kwd2F4OUZuOFQrWTU3T0lK?=
 =?utf-8?B?UXFBLzdXV2NwcHU0ZldWM3FCVWNwZ2t0Y0lZVVpVZ0dPcmRYY2tsdSs0Nk1m?=
 =?utf-8?B?UDJ4cjFaWTYzbVdkb3k2VXZNNTA0V0wwZmhjUW52VTlWNGhPTGNaU1grM3E3?=
 =?utf-8?B?TER2bVJtUHZra2RZTzAvVG9YOEswYXBYcitsMTZRWEdPcUhOQXp6VWw1ZmU1?=
 =?utf-8?B?QitpdUtnNVgzbW5oTFhUNkxvTk1ralc3c0owanA4SXVGQWZHbWZHRVlXbC8z?=
 =?utf-8?B?cHhxaTZDY05Ed1dBdEtVMVlXRjlCRUlxS1hUOGxCT2FBc1d0cXZFaTNDSzF2?=
 =?utf-8?B?SkZsdWVhVlN2dzlINE03em1WVmdScm1zajNQd1B0UHAwWmo3V0JITUhhSXEz?=
 =?utf-8?B?dEdjVE5DMU93Wm5ZcG5oZ0U3OXIrNE02OUgyVE80cng4anozNHNKVnlZT2NB?=
 =?utf-8?B?ZkIxZFVhVU9ETkNxbWR3dW5QMnlhQXhPTEJ2WFh5NTRPa3pjVjNEZjFBSXln?=
 =?utf-8?B?TmhPU0RtWWxNSTJpV2Z1Wm9ZbG5ySUhmVjl0eHVYR2tzOHhNSUJlS3hpUDY3?=
 =?utf-8?B?K0VDYVBNeDlwL1JoMXVLcjJyUnVmM21ZMktaWm90NFZPVXNxTVlBRXFpMDBh?=
 =?utf-8?B?QlAyQ0wzTlhOMlJPTmpQcDJSTGR0WHRZRmlDQTRobjB5UTBNRXhCT1FrY3Vk?=
 =?utf-8?B?SkU4aHpLVW5SSHN4VGEzOXJCejltQ2dNbzhCaDFwazc0TFgxT252WmxLbGlr?=
 =?utf-8?B?ZFBQZm1ScjhaOVVXMURFaTFZcUpyK2NMQkVkOHB6UThRMGo5Y2NQOWVXRGVz?=
 =?utf-8?B?ZDBob09VSmNLZ0lhYlhUZ2crR3kzN09IZXIrSVZwckI0OFlZaDFacUNGYkx6?=
 =?utf-8?B?NjlnZU1ORndJRklaWmIrYkRxN1A2NmpxNDBKS3BLWGkwVEVVMnFxRzdXNGlP?=
 =?utf-8?B?WmJoRGxVcU01a0kvY3UxS3gveC9nZEtPS3pYclZOMTVVdTg2clNLTmJwckUx?=
 =?utf-8?B?WXREd1B3Z3VKQVJEQ3ZJbUg2V3FMVlYwZThHUXFkUk52NytVdEtsSWxKZGVj?=
 =?utf-8?B?SFIrMWVsby9aWUJRcDg0SFV4M1QrbzV4TjRaVWN3R01mbFRDdkJlT3pNT0FX?=
 =?utf-8?B?Z0ZGaG84K001dUpTd0ZSajdKb3o0TFRaR2gxWkNMZGdFQ3l0MW5tK0xIR1F3?=
 =?utf-8?B?T0hTbkdHRk83cTd1dHo1UHdSQkU2dG9zcHpQZkd1NjNma3Y5cENoM0VIelc0?=
 =?utf-8?B?emVQcGN6bnQySGhqNGlTbEdydkJmM1VoTDlPNS80UUsxYWJuenpmamNXa1ZB?=
 =?utf-8?B?a3FySDBLeTdybFpBcE5wc2U1UlMrb2hVMGd1WlZBNHJ5N0kyM0g3ZVUxUEhq?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcf6876-09e4-4236-1bbd-08daa33c34ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 23:33:40.6622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iarhbOQT3Jtwiakez/nvs3xiNDCxEvBdVj1burnk497+Qc1YEadSFzdJ7saPtwG1jSIoxrpT/dF6DywSfgLRwyg1zGSYNoITTGwupWS5Pd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/2022 15:11, Daniele Ceraolo Spurio wrote:
> From: Stuart Summers <stuart.summers@intel.com>
>
> MTL supports GuC deprivilege. Add the feature flag to this platform.
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/i915_pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 77e7df21f539..b1b720870da8 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
>   	.display.has_modular_fia = 1,
>   	.extra_gt_list = xelpmp_extra_gt,
>   	.has_flat_ccs = 0,
> +	.has_guc_deprivilege = 1,
>   	.has_snoop = 1,
>   	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>   	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),


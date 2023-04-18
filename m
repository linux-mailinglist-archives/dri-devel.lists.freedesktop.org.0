Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4266E6C39
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631D010E83E;
	Tue, 18 Apr 2023 18:37:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B5E10E83E;
 Tue, 18 Apr 2023 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681843073; x=1713379073;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A1LE3TmhFA9Pm3VXPgwNNkLZnCCLFKx3d1tb3K+x++w=;
 b=UwjueIM9+tyB8UsM+efluIZzX3QT2lo5qBdl/WP/3l+NrKWJwsOqH1+G
 31I+6Z6PtgF39wOng6z2w8+HbNMzwMWNW2sucn8gwVVCeXcc5gy7hh/Az
 3+GqsmAxaDlFJ1fIJ7JoaVO/idRxfNPtoMFjERgEsENFTtJZ0bLuoAimC
 srGxV5ABW5Mph+caigHswsrbN6rsxgj6kZ2IEJgGJmcf3NNEUj2YZitbc
 o++NnlZFfWuS9ePDBAuRTmWoBjFFd6/35uZ+uDeJRrAPNdKvhKgaynB6C
 rNQyxHYbMzqRjfUwW+h5F/L/Fzi3hm2HawSkzaQRLs+0J+6lZPdC44cMM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345255456"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="345255456"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 11:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="865513610"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="865513610"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 18 Apr 2023 11:37:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 11:37:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 11:37:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 11:37:50 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 11:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghMx4XDLFml4QsBWhRNuEeNfKFHqOIDPJgeBbJEsSxJFyO5khbXDHlta2PUgJeJ7ATBvZjPtI7OTdqyjsIkKwMpoRshUZ+HVn3OOUaTk9hSobDXJNCUNlyJ56N+Yj9EDBlmI7lCD4pe1Aw1KpROLoAthgtrf/MyXdqfGaCB0Uta4QGHkU/69DhSNCpwZEjBFnIxDRjxMyPLeI649XgmzvIrWAWZ0/GQTMDRw0CyTuSQaFQssutAh0cR51TuVuVD+Rj1J+AVNVjv9FIsBMp4PcSv2jwLltZbbfoYKq6xusiC5YUijC/KeBRMMES6ps3V0UzeteD8QowGdppeEOu/5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zJcNVTtFytNNFUblTHn/AbWCc0DCsP4Dxyo6wC8ero=;
 b=DoX1Y32T3cIK5PXho1Ss0lgX11ksL/pk8WSzHWEWr2nXNqYg1yu/ahayZ23/6c/fOoZxQWx4Afq+zRK0dGtrZsMsq4uhyH7WTFhx/JMTKgSd+6hXnVlR1MAZQ+ih4XNk9a34Xz8MekUx174pJOzwKlLSCXYgn/nlkNf6OOf2P8494y+zSmQQj6CgZ3nuhQtXH83yNsxS4X3D3Ea9NLDSe7Z2r/T5pL3gc8HBIHdDvat57XEwdVMW+uELtKgMTbBSmYXyO3aLehjMBVwBHq/YVF41Y7ZkW8+JGBsBRPLvESIudOQxOMRwBhk39AVSLJ0oJGxidsdPtx1k/sh/c2Cdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 18:37:43 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 18:37:43 +0000
Message-ID: <7b9676c0-d012-bad9-0c62-a96c68a8fe27@intel.com>
Date: Tue, 18 Apr 2023 11:37:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915/guc: Print status register when
 waiting for GuC to load
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230415005706.4135485-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MW4PR11MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 3091b4c8-841e-425b-44e9-08db403bfef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxZvxDb/aJy64rzP6x6xzDKWI/lZDg/rthRNwrfrd/wpdmTowck53Zz1kvEcqrgvYB6z7uPgyQK0PRFYqu/eVdoQ5+3h9fXW+nZu6d2fFwnDXlNTWN10s1q3HhzrntRBprRrEDh+eLF4VPJU/Vy8fpCs8IWtyRb3ggEttmVqjLs9QQcto2InbLlUBypsDug4+tvNDpTNwkP2JmOs/1N6QT7Nm1oCz2tOggmhNfTN83qGg+gg6GWVmMSXQL+fI7MuPYV4DOArMDeK3RKU+nobsRf8kAjHEzy/uEDqEpW43gKU9Ji3Il+2GSp5tcOHQMWOA1RI/EBVuuT4rmE92xvT7Cvf7lOTRMF5p2JuYSmdob8kyF3ZhJ/FgrHqKB7gja+rZCXsLfzjSbZH0OoKH5cvSbulB+xEACW6IKoMkfI9QM6UHKq+UoeNpVEX3ctNfckKyDbVwSoSsiHPH1p0CoyCDti0uFVx0aeEmuXO2Pux8yuKKp795LrEFPAkhZDe7qiz0nAaOW0WaUJrAU18xxyNuE93bp8/Ed4YzLTHhoj5PhirL0vMNizk8SDuf4z20MNXJfEwmw07YxckQbXJdn1PyT635iN+d1VlAnTxhDh+oJvNvNJkA2mJ65XmL9tVGrnePFSQLQTXVsUgHHco750JCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199021)(5660300002)(8936002)(31686004)(478600001)(6486002)(41300700001)(8676002)(66556008)(4326008)(66946007)(66476007)(316002)(6506007)(26005)(186003)(6512007)(53546011)(450100002)(2906002)(83380400001)(2616005)(38100700002)(86362001)(82960400001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTlKMlRTZ0wzbk0vVDBTaENXVlF0akU1UUZGcmUwaWp6QTVXKzA4ME5rQm5P?=
 =?utf-8?B?UjJ3WmRqcGlKM3plQzJsaG1lcmF4QWpCV3NYTnQ5ZW15V0tnNDQ1dEduakNa?=
 =?utf-8?B?bmhod0lNTE0zZHo5Z1lkb1VRK0lUaEFWa0lDa0lZUTBQOGN5bGtkTGNlaUVO?=
 =?utf-8?B?VVR3TFB1TGkvZFBYaUdteUp0MkdhODhaNWJpcFhMSUNEZkFXUHk0TG92RFdt?=
 =?utf-8?B?NDBCazZyeDROMDBUVURRVUFwV3FtaGh3ZGZ1d1V4Q3BIS3ZMZ3BuU3RWM2lV?=
 =?utf-8?B?YVljNHpwbHdrWStjS21DNDZZRnlwbTZPRFVTb0FBSlZ0Y1JqZ1RtN29NRkN3?=
 =?utf-8?B?aWFMdTNTZ0VsRGJubDQ2K2pMNnJtcFpBL0FtNFBMSkFyb3M4NTRneG42Nndo?=
 =?utf-8?B?bjZiSENwc3BYQ1VGLzI3K05VMVJzeEJSbGNNQWRkK0hIL2tYckY3VTh5Mm1J?=
 =?utf-8?B?dmRyWCtuZlhOV2R6ZUlxU05WSVRlNUhtZnF5dmdGWDhRTkRDa3JrUUhIaDhN?=
 =?utf-8?B?OC9ITUR1R1V4a0xibktJTEFJRHFvK3ZGWUI3aFdWRExBa1ZhL0R3LzhqMk05?=
 =?utf-8?B?c1FkU2dqNy9yYm1mR3BPRHQrZDR6SnhWbG5GMEV3R0pTanBqR0I5dDVkZFAz?=
 =?utf-8?B?WFVNcStzb2dVaGVub0ZsZUE4eWViM3hhK2U2RG4zNHMyMEJrRVFoeXpyT3JN?=
 =?utf-8?B?QVlMM0hmZWJCWXpEazZCQlZvcWJJNnVWSXdPR0Y1Mzk0UFl2U3RPVXJ3OEw4?=
 =?utf-8?B?RjBuajRxeVJuNzEwYXVpOTR1SHpFTjJpNjI2N0VyRVVLMDRjMnNqdGVLTEs4?=
 =?utf-8?B?am1jeDZsTnFZbXVwd0p0eTRYZjhSVEdVbG9XaG00WjRnM0ZyWkNsdDNudWMy?=
 =?utf-8?B?bEdyaGJCVS9RU1VyVll1YUUrdFhPaFMxVWRtaEpnUHltMElTWXR6Q3JLb202?=
 =?utf-8?B?VU9iZmdrY1I2MmQvZklPQjQwajF0ZlVOZ0pzd05EbWVud2xUVURlbXM1YUVq?=
 =?utf-8?B?V2ZpbEFER0w3VXN2dmwyWTUwMWR5Q1pIUzBxSDduWG9hZjJ2ZzNab1IraFgz?=
 =?utf-8?B?eURkN1hwZnR2c000ZTJ1Y3hMNTdFeWFQd0lDTFVqdU1sditqd0lQdHpkSFk3?=
 =?utf-8?B?L2NOc0ZIRWNTanBFSGJrQ1VabFhpV2pVN3lESUJDdVB0YTlqalh0QTBiVmZY?=
 =?utf-8?B?ampSOU5nandGU2Z0UUU5emJqK2tVUE53WVhKRnpYblVtRGZOVXNnZWpjTW1R?=
 =?utf-8?B?eWU2QVNFWjhyVFkyZ1RaMU50NGtMdWhCSU0yQngwYURSaTNJc2xLcTFCSzhC?=
 =?utf-8?B?bjFabnliWEV4QTZVUmlzcGNNSTVtcy9ocE1nUGFpMnpvYk5WMjM5azg0TVpJ?=
 =?utf-8?B?STJRUXJKU0owaEVDbGJWWklLYitJdncyeW9nRE55d3Buc0lIZnZnWG1Pd2NM?=
 =?utf-8?B?bW5OV2h3U0pZZ2lFSVdENEpiUVJYYmJaaG84UDFxb3Mvdmx1YVpDZWdMdVRE?=
 =?utf-8?B?bnRreHZOU2h6TXNUUnpoV2dpekFzNGVaYks0VGFsOFEvS1g0dlV6R0RTcXhu?=
 =?utf-8?B?U0ZUaXpsbjdjZDB4bmlwZXNBS1VtRVM2K2I2VjFzTVQ4bEhBKzZNMGx0MjVX?=
 =?utf-8?B?MzVYQU1jdlI4dmFCNWJXbTlTbityeUxYdlZsUGlUK2hFYklPS280MENJaldZ?=
 =?utf-8?B?dWhmWnVaUE1oTGovVzhkNFV5TTdFekxpZUZFdXkrSnVPUnlXVEZRa1dJTStl?=
 =?utf-8?B?NE41c1EzY3Y0RXA0b3pQbHZIMDl3NWVzUk55QnM3THlhNnJBRHZhZW9kTzdC?=
 =?utf-8?B?OUlJaWJwRGVpVGRMdHBqMUswSUFScVRGNDVIYkNhVUw4eFQ1NEdBbVlWK25N?=
 =?utf-8?B?QVZETWFhaDVuaHNQdnFUbytKU1ZvVmExaWE1bnozRU94Z3Y0alBTWXAySTJi?=
 =?utf-8?B?dDk2ZWljUUVOTDZYb2hjZEFXS0VWbEJHcU5Ib09KMmZ1SXJzc1J6YkZlQk93?=
 =?utf-8?B?NEtCcFZuWm44VVloZXo3NHRTNDZlaDdFQ1ZzTFBWUXVQdFB0MURkcnl6KzEv?=
 =?utf-8?B?NVhJNjVkcnZkMEJEdy9hLzhJbXZiOFlMVGpCRUk0RlR2TjRDZGJzT1JvbWts?=
 =?utf-8?B?RE43UExxUzdTVG9wdVc5cW5ZWCtkY3d0N0VxRGZpeWI5MERGTjRVQkVCSklL?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3091b4c8-841e-425b-44e9-08db403bfef0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 18:37:42.9956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gho4F1oU8LY8/3TaKF+jjD7uBGC+rQzli9gB7vZGa8THZ2QTUls1AeDGwumBZH134XS2KnbBVxg7/QmBKLIKVZjY0Z08Ka4s2LLMewu5z4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
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



On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> If the GuC load is taking an excessively long time, the wait loop
> currently prints the GT frequency. Extend that to include the GuC
> status as well so we can see if the GuC is actually making progress or
> not.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 0ff088a5e51a8..364d0d546ec82 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -191,8 +191,10 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   		if (!ret || !success)
>   			break;
>   
> -		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz\n",
> -			count, intel_rps_read_actual_frequency(&uncore->gt->rps));
> +		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz, status = 0x%08X [0x%02X/%02X]\n",
> +			count, intel_rps_read_actual_frequency(&uncore->gt->rps), status,
> +			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> +			REG_FIELD_GET(GS_UKERNEL_MASK, status));
>   	}
>   	after = ktime_get();
>   	delta = ktime_sub(after, before);


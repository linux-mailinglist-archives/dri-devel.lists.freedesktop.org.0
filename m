Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AB7ECAF2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 20:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A18B10E131;
	Wed, 15 Nov 2023 19:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519810E131;
 Wed, 15 Nov 2023 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700074977; x=1731610977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LnsdmLmK8AUBo8DIl7XsPd1DDM/N6cYKc6HKFM16jAw=;
 b=gZLx7DBK5D1VMQFIGH3v4+jee5c/DFPG3Rw3PswRlhU/eKEU+ZZ4Ooe+
 E76Ony4iG/5veMr6UDyDhojVQrYSM6l9oK6wTi6siqJvCpVAVtHnJ+DkY
 yP1sBOp0mFh95b0pzuyMEJBLvYQHHSvTnWfjCZCxsQ2Rn3k/3xOlw6rH3
 WecqpEX0iRulBlIUnPNQmsC2YH/xbDyjzPb1M+gSx7+mabXvHcsOhLQHo
 ljb755pyR2Z0sr3uK8RopBLsdgD3/Nt4FQdf79Yg/yQLumYneCeKxeXP0
 ftK+5zH8cJh5FDZtQiFuL0UOBJyZo2gV+ISypQ2HTIhYEOQenjW7b2kAv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370285703"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370285703"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 11:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741516914"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="741516914"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 11:02:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:02:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:02:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 11:02:16 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 11:02:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ1u4m0n5JI05xq0G0TesPdTLzh0bCnQq/cevl0ULSeTxns2lP0xzVSdL82CuIZiiFRMHs+cJAgL0ANAv++pLXiXnm8sI2F5bmOpd2ef/71dYd/nosG/dOstnX/70hJoMehwzg7p2nBEOsKydIQvatpj0l0Z7Jwi4pBUD7+g+mS9IwFdSNaG/07Iv9ae+1I+4ACbA7Kb5h6zq6XxX2aYeApaVaLBQG4xdtm5oGR/lv91zYpsFSDM/1gnuw69fFyE6W4pgvfDUCNHrtiPAJIjRJJWesdbH01zrSJ89yud6HVrXvLDQVRoP5vMcGuHkBXG7qUksYWsUbGI3nJSH46fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCCXJciximm0zyAMldr2dmr6EvgJgxOkuuJiN73jsI0=;
 b=I/ZYZbNEBHEllImIyFRfIrluVFQB7BlunoCEDBATUdqbGf4s3goeymY58iaIc6x1haq/ImqN6l4yE7mpFGpOx3njddsSQOOCe3EVaBW+XGqp5o17qfh5URBNW/C1UUSs6khWz77rN9nMXlgE44d1pwaC7/SM//A3vMkZC6DF/ImjmHy3XgU9QqTn457O7hd0k6EgXRg6YAFIWDyjrV4wfq3oPc+sPjbUJkosuVKs7aKYoZSTNKUwtBhC2vG/f+XgJWVs0r5ax5MOm0/8Q2Z/tFWa8IArDxwG6ra0ki5ggPftNjKiciIIqNhNqC+AQdSfYfU/Zmn8hoGuaRaEsTn2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 19:02:13 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57%5]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 19:02:13 +0000
Message-ID: <798c7cbd-70ad-4b69-9465-f5e2ca23c3ed@intel.com>
Date: Wed, 15 Nov 2023 11:02:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gsc: Mark internal GSC engine with reserved uabi
 class
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20231115110216.267138-1-tvrtko.ursulin@linux.intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231115110216.267138-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::17) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: ef706f6d-37a0-4d2c-b937-08dbe60d60b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTG3OSAV1Hkf528hSNSk5ms6eQH0MThtf+yEMQjB6Ns1nrT5ugYMepQCyqY6YKWiymYp+pkgxO/3C3Eok226hW3GXmCa8igAr32tLInlFVYH5IOOt7RjHU2o0OX45LPY+47u9ZibD818aU0h/oUWBBmofvKElF+1qVJRa81RdHcdGKuPLCzN16AqT+6a9gVfwkxrmfLrtAVW3mURuSq13NrL2jpDzDZlfUYLRdlczCD+bjgetghda5qX7AS1U4nPRU97mCYUBmWrs9LboW5thy+msJs6o95kmwpIKLoBRianohHz3bRjIMlFL/iC80wQHeWHoRxKXQI8cgUZmUehki02Se+3VPkdAEZtpO+M3ZdeU3gvGFIMRcvfPLPynQfOxGyYh5F2Ko9W58SYvwkn0kLMnHUXBKvLlSTOeiARMnt1b7O43/aD2YGFJc3vJBX1BHeljJK3y+mMNgSG6tG0H6Mt0GYjC1Kw17OwUByBSmMRXdpQ3Vhr28Qh/tZN3xgPfJI+rDuuo/kjexiuegQR5yudiG6H4LbDXuEkd156fQTzwZ1Vnh7o44bMCpQ1zv5xZYCWayCZB8Yfgqeb0spJ7GAaJ4YBKBEKhML22/dqn64h2ZVS2Kx9iaIZuRQe6yS5JCGpY+2mQfZ0wKIMuI5iCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6486002)(478600001)(2906002)(2616005)(6512007)(31696002)(5660300002)(53546011)(6506007)(86362001)(4326008)(8676002)(8936002)(66556008)(54906003)(66476007)(316002)(66946007)(41300700001)(31686004)(82960400001)(83380400001)(38100700002)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTllR1BUMGVRT0FLWi9IZmxkVldBeHJHd0EwOVlPME40WUxwcFZTdkZjREJn?=
 =?utf-8?B?OGV2M2IxL3d2L3E5S2tGRUU4cVVwNHpuOG81K2pBOTZBanR0MGJGL3hYQm5h?=
 =?utf-8?B?S2hxR0dSQzZaelkrb2lZeURMZkhBa1dIR3p2QVNYMzZ1TWdnbUdrYjRXZExI?=
 =?utf-8?B?YTRpTTFyekJRNmJDUG1yUlBKTjFxY3IzTFQ1OHdPa2R0aEcrSkovRHpiOFg3?=
 =?utf-8?B?MG5jNWVKSFNCMlRXNEJqZ0JFVmNBQ2ltUUpaZDZ0c29NZXREMGxpSXY3MkQy?=
 =?utf-8?B?SkFpNzNCeGVQVDRwQkhjMC9hWU10dGFBNUFvQXpmeFVENnAwUUx0WktPMm9F?=
 =?utf-8?B?Si9McXAra2VjZXJIT2tBNHJISGtYeEVGY1J6U0piQ1hEWTJMRGNUQzI1TVQv?=
 =?utf-8?B?QzJpeE5MMzNqaFVJUEU1Z1RtZEovNHNPVlVuOEEzbXBxNW5SYW9vM3hiODRX?=
 =?utf-8?B?c3hYKzQ1d3J6TG5YTzU2QUpUSXg2aXlTSU5mcDhKY1dtSk01REU3N1JNRGlP?=
 =?utf-8?B?V3RESHdvd1BmMGloY0VYZzg1UjRiUkUxZkVaZXUwWW16ZDNmWkVjOWpac3J1?=
 =?utf-8?B?VFkxUGE4OU1EV3daZnhWcHVqWE1NeFFEUlFtUU1BN0Q1QjQrMWdxckt2OGh1?=
 =?utf-8?B?UldpSnUwQWNoUWtrdW5OTytVOVZrdGVwUUw5MWpuTDVSSHNBQmlFUlFtUUlU?=
 =?utf-8?B?aW5jT3RZNUhzczVDS09xU3IxQU9XUXViMG5Tc0EwYXFwQlcva2l1SG9aV2V5?=
 =?utf-8?B?cnpYV0c4N1hOVUY4SlhvSk0vaEFSNHYrcEgySVduUTJuV1gvVERBQjhLZmUv?=
 =?utf-8?B?di8wQTd2SmxtNWEvY245Ym5hSnRNM3VvaVVVL1J6Ui8vM2x4Ly9TNVZqSUdB?=
 =?utf-8?B?YzVSVUVkNExUc28rZXl3YUVKSnBOd1d0d3l2dTNKZTMzczlNbTRsNk04ZVlX?=
 =?utf-8?B?aGNGS0JZSENDc2NpaHJTYmlaQ1RBRi9qUCtuRzVJNnZHNU8zQjU4NWVHY0Yy?=
 =?utf-8?B?UmJlU1NITG1EMlF1dDVDc1JPbWJscm9zWjB3Y1JKZ1ZRbGdCMmpYci8vYnJm?=
 =?utf-8?B?SnRBa1EwVzRkNnFsOWJnVDBZcnFCbTlSY0JkTkdLeEg4blZWb2ZtMURDa3VT?=
 =?utf-8?B?eitwemJwdWE1ZHF3S1hjdWZPbFVaSWpkcjk2dk0zMXlYTHhtVDF4c1BUb2F2?=
 =?utf-8?B?Y1R5ZnJwN1c3K0tkaUZ0SWcySlpicFVJZ2R3WjFmNEtmRjV4ZTI5RUFxMnV5?=
 =?utf-8?B?aDVtMXdLNVRjUTBEVytDek0yRkV0TlM3N3lGalgxSUV4aU5IblVCUDdlL2s1?=
 =?utf-8?B?M2xOd0Fkb0NHRzlVamlPMWxMR3BpL2pyd3dZSXQ5MkxMWGwrUi8wcjNHb2w0?=
 =?utf-8?B?UDhrZHM0VHFneC9oT3VPZWR1U29yQUVMRzQrUWsvK1NHTEVhb2VVbGVNNnMx?=
 =?utf-8?B?UkJJbWhhbkVXU1J0K2ZTNTRPdE53ZzM0eUQ3VU42a1hmV3ozNjNRV3pmOVds?=
 =?utf-8?B?N1IxUmhodFlNekNkSmxUMllJVElmcXZnWElMUFVVNzkyRUI2TytJWURGeita?=
 =?utf-8?B?bHJzZWtqc0Fpbk81cXZrZHR1MzhKVlNzMEwwUi9McWpLcFdmTmFJUGtLd2Zj?=
 =?utf-8?B?TnhraGtyYk5SaHM4T1Z0YkVLRm4zcGdXWlVUQk5ycUxiOXBwWTdMZEhxcEtx?=
 =?utf-8?B?bnRKNTZYc2hOZkgrb0RZWWVzTDl2Y0hQVGtHamg0eVRMQXVVWjQrNld2SE10?=
 =?utf-8?B?UkFpQTEzVG9EMFJuVHM0R2lncE9oMndQemw3WmE3SFBNSkxjNmtGUnlvWTlL?=
 =?utf-8?B?Mm80cCtBbmFwRTEwRVVnNUhIYXVrWWh0SndPQUdpdVczZkN6Vk5UU3JvdWJu?=
 =?utf-8?B?R1p0K3UyKytqcGs1NlAwWjcxeU1zckl3WTZjK3RWZE9CQmppeVJPcFYxeUZY?=
 =?utf-8?B?bm9BL3d3K3hzZ3hBVkltOHc5TXZOR2toNHd3NG9vQWFDaTNkQ3JxZW9nVEVT?=
 =?utf-8?B?R01JNXdsYTFPcEk2N2FxLzh6S2ZkNzRkRk9ESkhjL1RVYmgzVVBIcVg2R2xq?=
 =?utf-8?B?dUhzaHVyZDBWNFZvTUY3Q2lsNXZnSkJjNlVjbzFxYmp1NGVHRzk0dGoyWXRS?=
 =?utf-8?B?cWI5VklPYXNWcndWa1FQSkhSRGZOdlRLUjdDUUxDKzdmZ2h0OG5Ca291QUpn?=
 =?utf-8?Q?U7bzORJ/l1Hl0lW3XDAbD60=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef706f6d-37a0-4d2c-b937-08dbe60d60b6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 19:02:13.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7ld09It9Uze1FITGfCapG6gZfoXKXgkD3trUw9G5FVoBi9k3LiZlkaSITchrH0OHBs9LwEaUhjCnQLrwZ5MjdJsNUGgtlslSq1ZKFmjAGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/15/2023 3:02 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> The GSC CS is not exposed to the user, so we skipped assigning a uabi
> class number for it. However, the trace logs use the uabi class and
> instance to identify the engine, so leaving uabi class unset makes the
> GSC CS show up as the RCS in those logs.
>
> Given that the engine is not exposed to the user, we can't add a new
> case in the uabi enum, so we insted internally define a kernel
> internal class as -1.
>
> At the same time remove special handling for the name and complete
> the uabi_classes array so internal class is automatically correctly
> assigned.
>
> Engine will show as 65535:0 other0 in the logs/traces which should
> be unique enough.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 194babe26bdc ("drm/i915/mtl: don't expose GSC command streamer to the user")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> Daniele I borrowed most of your commit text as is, hope you don't mind but
> I was lazy. See if you like this solution. It is also untested so lets see.

I'm ok with this approach. As you said the naming is unique so we can 
easily identify the engine. I've tested this locally with a small change 
(see below) and I see the expected values in the logs.

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_user.c | 37 ++++++++++++---------
>   1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 118164ddbb2e..7693ccfac1f9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -41,12 +41,15 @@ void intel_engine_add_user(struct intel_engine_cs *engine)
>   	llist_add(&engine->uabi_llist, &engine->i915->uabi_engines_llist);
>   }
>   
> +#define I915_NO_UABI_CLASS (-1)

I see the lkp is complaining about using this for comparison against a 
u16. When I locally tried to reduce this to u16 my compiler also 
complained that we're assigning it to a u8 in the uabi_classes array, so 
I've just set I915_NO_UABI_CLASS directly to 255 and it all worked as 
expected. With that fix, or an alternative change to work with all the 
involved types:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   static const u8 uabi_classes[] = {
>   	[RENDER_CLASS] = I915_ENGINE_CLASS_RENDER,
>   	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
>   	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
>   	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
>   	[COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
> +	[OTHER_CLASS] = I915_NO_UABI_CLASS, /* Not exposed to users, no uabi class. */
>   };
>   
>   static int engine_cmp(void *priv, const struct list_head *A,
> @@ -200,6 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
>   
>   void intel_engines_driver_register(struct drm_i915_private *i915)
>   {
> +	u16 name_instance, other_instance = 0;
>   	struct legacy_ring ring = {};
>   	struct list_head *it, *next;
>   	struct rb_node **p, *prev;
> @@ -216,27 +220,28 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>   		if (intel_gt_has_unrecoverable_error(engine->gt))
>   			continue; /* ignore incomplete engines */
>   
> -		/*
> -		 * We don't want to expose the GSC engine to the users, but we
> -		 * still rename it so it is easier to identify in the debug logs
> -		 */
> -		if (engine->id == GSC0) {
> -			engine_rename(engine, "gsc", 0);
> -			continue;
> -		}
> -
>   		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
>   		engine->uabi_class = uabi_classes[engine->class];
> +		if (engine->uabi_class == I915_NO_UABI_CLASS) {
> +			name_instance = other_instance++;
> +		} else {
> +			GEM_BUG_ON(engine->uabi_class >=
> +				   ARRAY_SIZE(i915->engine_uabi_class_count));
> +			name_instance =
> +				i915->engine_uabi_class_count[engine->uabi_class]++;
> +		}
> +		engine->uabi_instance = name_instance;
>   
> -		GEM_BUG_ON(engine->uabi_class >=
> -			   ARRAY_SIZE(i915->engine_uabi_class_count));
> -		engine->uabi_instance =
> -			i915->engine_uabi_class_count[engine->uabi_class]++;
> -
> -		/* Replace the internal name with the final user facing name */
> +		/*
> +		 * Replace the internal name with the final user and log facing
> +		 * name.
> +		 */
>   		engine_rename(engine,
>   			      intel_engine_class_repr(engine->class),
> -			      engine->uabi_instance);
> +			      name_instance);
> +
> +		if (engine->uabi_class == I915_NO_UABI_CLASS)
> +			continue;
>   
>   		rb_link_node(&engine->uabi_node, prev, p);
>   		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1386FF9B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432D010FFB3;
	Mon,  4 Mar 2024 10:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ze3PgboJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5351110FFB3;
 Mon,  4 Mar 2024 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709549873; x=1741085873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JSg83YKUxRuNCC+MtmbONQ+f7nW5ZJYP1zum03+RgSs=;
 b=Ze3PgboJo08XFptko1GbOsI09j2FtdLtuwKwvEohRM4ksNI4c7RNJdcZ
 u9Uz3dr4nrMx3GuXEy1oSCxXJqm4QYD12q3onK/y0bxrES52GmDFyd4BH
 mYzU5sIHojpjXcgaXva3uXbqIGP+8QjhlwurRMwbw/MgEwyv54WhjEeJk
 83h5/ZpNfWftK155GjaTFGlfG6+GbIR9xgGVFFxHQM9FgUmBtHWaXNBuB
 KJD+aFJIM6ZHQsklyiZk3y7n8HfAgUY7vk4rTGthAbzalQL5E3NGgEea6
 QS5Gy95z9WrwcCGI0Lu7+j5hdUpDqeA/2fb98m40QztUvyAL+Y4jUAlUL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7843975"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7843975"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13536059"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 02:57:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:57:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:57:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 02:57:51 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 02:57:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCv8t7PoS4c+BkcXnLpokdEytxcfN1k0m9c3ktIHwY8WLGMu/Nm6HYf3W1at4FTSLvMxaVRZ8GAzx5IkpYM7ZepsRm9x+PHvQmFmzX5NJR2Nu8ODdx+KWL+v3QQdscdA3a3VGZKEYLED9NB+jLzN4wpaVL2LnHt9KKGsuhtKU5C4SQYEa98qVRySy0TpUn1ssNWvIfW4FqpIRWQZ/4E7mwssABu4dslgqYD6Xs2wC5LAA5mSngemRg5fAN+wH4iJpNkmvy2MNPopD+5P9cBmRz7lfIZ70QuI2JP01eMzOEiFPHa1FzZk4VuWbaEQVb+U0nKi5eEgY4TNecsqu+Dqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIMaCS3lFtWayc6zGB5EPxLCEj2loyycYFrCHVkXNjo=;
 b=VMje7oscV8mKVztrY1DmELhoQdMVXqAFv0M8xl1bSqAw4Q5QhZomYN9p4ekNcai+wzV4+Fkgb5OUizvLlAwE49Ui7UFeYB4gOINdZWNiZtxu4ujbKecdoO/67py3BRBA6seYs2u2T1g0fSOH232P1/zesnJBxSol4kzFibfuwymL8b+90oxqa4aVw+MXVENSjVa6wdW74WzKei9L3MivdzgIyMV8ix1dOchJRHyeO3JT+BAZ9N0MG3mXfjBAmUSM/Pj6AA/XavOBvD5bHYyrH7RMHTkMD0GRZu0RaKzGPiNY80AFtWNwefhy2Ek60agzbWGvfdJtpg8ucZm+SnrQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 10:57:49 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 10:57:47 +0000
Message-ID: <96a5392c-f11a-45e2-b5bd-16e112be0110@intel.com>
Date: Mon, 4 Mar 2024 16:27:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 9/9] drm/i915/display: Read/Write AS sdp only when
 sink/source has enabled
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-10-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-10-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::26) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b90de9-ad9e-4dfa-2549-08dc3c39ed3f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwrzOwpvk37BhpfjG8AuG76kA8PjaUCii4i0UrGm4WikXXx6Ng4bCxxddAm7uyQPcucIUZVEtYEgRWhcKOqTW3nhYsUJ5E/pVgwdi0vPzbrfsbkeb+uTk4IkiO/bBtQ4Rj+bLTfDjY/dRLUe6g+YG7t0X8osgiQ2sqMwpex8xmizuTN9rmO/fVFjWASPyO4DwOD6lnzq+UqdU1U0Pkfd93bOMxpYlnuTQQxD9gHtfuL7J6GDXabJs4G50Ufx9de8oiYXBA9ExHssqCfOBW1HL3/IUJZmbhVS5Tqugqx5dM4ykDKpxBXdJnaFVn7H8sdiOzGt347kJ8v1ZS1PvtV7mBT0RXpgF4MKLyv+K7VP2HOc4YRQpcPJ9XEPP13O2cLq6lA/ej5U7QKHGHjmMKsV6J4p1CCoAH4n5/170XE+iNxMTSTPoMysSVpOs5BuycQ1jMUhh9Y5HF7FtuMo+VCEEGXmgw8rOyg+U2vyK/c01qxL1HBXaDbVcHX9awKgCBcpbL2+8sV/ePyJjsOnZrdwBuSx8fz/AuOdUFCFEj/l8/Pg7wRCiR0xD8u/57gAd4YqmeqBfDFLgrPeADiB7eAwtZHnXbaVuYaXoRPbQnRYg3nr2t/C9VwvAvlrbQel8fhFOb5VjUn/vHaBPsoHFoQ4Adc1DR7jDyUZ1wZrNBVBFqQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xqbmlkQm9mOXlsY2pPR0IveDgvM1hDVTFidHY1NVppNmd0UTBiS2pZUVpB?=
 =?utf-8?B?Znp5a1FYeUgzQ0NQZnZ2bTgxZVZ3R2tHTm1SRVN1SndqSzlTaDZOMTFoR1lI?=
 =?utf-8?B?TUlRY0xIaXhiV1RSckZBQzZTMklqT240YVk2MFN5ZzZHRng0ZkhQMFA4ZXg1?=
 =?utf-8?B?TUlUVzZJbGtYbzBEanlENHc4RWlkYmd2ZmtYalRqRGs4dHRCS2pMaUZmbE1T?=
 =?utf-8?B?bmtMdjRUdkx4Wi9RWk1mS2NtcndPUC9xaGdVcjZmdDZLR3M1dmhsZzlicHp0?=
 =?utf-8?B?L0Z3U0h3cUlFSUtmVmI3V0pyTTgyNlYzNzE4anFoK0tidkwyRTZNNVpqb1R0?=
 =?utf-8?B?Zit2ZStDRno0Y3BSZ1EzY0RkSHp2eE11YjAyU2lFZkFndmRiVWdXemdCOVlp?=
 =?utf-8?B?RWJlWXFZSUl0WFNnWWkwL2dIbEpMYlRObE9FaVhrQWN0ekZ5RmZSYUxMZnp5?=
 =?utf-8?B?UTdZZmRUOWEwUE5BYTBraGM5NE0rbGpCWjZUWXNOS3lnYWpzNnhxVG1raUl3?=
 =?utf-8?B?UTF5OUdJWEpZNHk1UExVMUl1dWM1M1ZYRjY4eGJpcVI2cWxXTnhLT2ZQZVBF?=
 =?utf-8?B?eG1rSzYzTjhqbnZwcTFLYUx3QTBFQmJPRTRBemQvekcyS0YzL2lsa1lKZ1Rj?=
 =?utf-8?B?T01TcEh5RWVmc0RLeHc3TTBoRlRDNDFFMEE5UUJNblpKUitLK08rdnNnZDR6?=
 =?utf-8?B?S1NCblZWZGM1aFlycWFNaDdiU0RVTy9aeHZMbHpFLzZLcFJsWGFHV3d4NDE0?=
 =?utf-8?B?d0ZWSXNqSnR0d2VITjlGdjdnQWJINnFBZ2M2aTBVT0JQeTg4dk9FSSt4TjBS?=
 =?utf-8?B?MHZtL21UQWIrLytMbyt1WTkvellLSHlzT3pYQzA0U3VpQVRVckFTdXdtVTVj?=
 =?utf-8?B?RHNEcGV6M3N1ZnVSR001ckl5Ym1LYnFROGhab1FnbVk2ZGxQT3VscmpMVWZB?=
 =?utf-8?B?L0VDRHIwMzJLMDZuVWZhUWNxb2FWTVZJdFJjMmhBSHVBOFBBVjlaeVpKMDIw?=
 =?utf-8?B?SUtueG9YNS9ZR1VGR0JINkU4enh4Q2Z0ZXFoWGJoeVlNNGFIanFkL25nejI3?=
 =?utf-8?B?MHFMeDZMR0hXMEIvVFRmR2RWTENVcjdCcTJUd2swRVlyVmlXYmE3czBRazNh?=
 =?utf-8?B?alk1ZjR3U3hlU1FKWE9MNk9ab0RmRnNtd0tSVGg3ZFhTUGpWL3RuMVZmZldx?=
 =?utf-8?B?VGRxcHlpQ25MZ3FtSGdrdWhRYUJIWncwOElNQURMeXh0dDdPYnNhOW1oV0E4?=
 =?utf-8?B?YlN2ZEhTTFJIcWNwUit6Z1RPSVBVbWxOdklaVk1VWjRmMW9BbXBHWmNHb2E4?=
 =?utf-8?B?RUYxdlFNd1g3VktzTlIramw0VUE4QUV2Tkl0dFZYUElRdEZzYnlLL21pc0Ir?=
 =?utf-8?B?U2h2c1h3TmVFWGV2aU05ZXNmeGlZTVQ0SkdxSEQ3ZjU4eVNXT205SVF5ZGYz?=
 =?utf-8?B?RGJMVW5BeHVDcHFZZDNhOHc4V3YyYlNGQWxXRnRaR3Z1OXo5MHlmNUticUpZ?=
 =?utf-8?B?NDFlbUFLYTRxVUhHbDY0Wm5Nd21GanlhaXVXWmRjWVdiYm8zYU9VV1gzZ0xl?=
 =?utf-8?B?a3ZJdnJuUlBKSkJzZmxGOEJUUlF0ZFF2K0pjV2pKK1ZSREl5eXdEVHZXMTM0?=
 =?utf-8?B?RzI4QmQ3UWNVUWVXa0tkYXJRQ2greVhueEZMckcvU3lhNTc3VlAwSDh3R3Vh?=
 =?utf-8?B?cVVxUFJsTTZKUzgzNHdvMTUyYmhScGhaa3RRT2w3RHd6SzlNdUdPRks5c1Vt?=
 =?utf-8?B?KzBnTXJjUlc5clVHbEMxdnlDclhhSXhaTGVSZC84NWorSXlTcjgzcnZNK0p4?=
 =?utf-8?B?emF0TUxBSjgzSEVZQjRLeDAvRkNWQWE1WlpXaVdqVEpUQjBKd0pVNklDUnBn?=
 =?utf-8?B?RVhCRTVtYzNOcXVLcjh0V0NlMkZiRFdBU1NSbGk3eHoxMjRycTB0MDlKRU14?=
 =?utf-8?B?dGk4Q0tSMmlJeFdHUGJMWExEOW5JempJOWxMb0wwYmRsUjVrMDdXbmxwWWc3?=
 =?utf-8?B?bkkwTEFaTk9Qckw3Qk1Ya2pjUHFZY2JlM3UxeTJndnVGTFA0S1dkUEVVVUJa?=
 =?utf-8?B?bE1LeDg1NnpLZHNjK3pNZ2N5WEl5NllqWUhXYVNwcm5wS1FzRlFDdlA2bzM4?=
 =?utf-8?B?Z1UyRFBMRVFrbGdsOHRCRFpidWFuR2grMHluK21mdG9jMVFHQlZBcExwVUUr?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b90de9-ad9e-4dfa-2549-08dc3c39ed3f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 10:57:47.4224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rbQbEEw9cABkEp3iYXoe1DPRDYkl5fAGpQM2fLkrzpGiwkEi9Fit9L1/p9DO1Vqw5SEq3GpIQmUPaizy/5zNkBr43TTWhyRSAfWxk6GqLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
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


On 3/1/2024 2:15 PM, Mitul Golani wrote:
> Write/Read Adaptive sync SDP only when Sink and Source is enabled
> for the same. Also along with write TRANS_VRR_VSYNC values.

The subject line and commit message need to be updated.

Now we are just enabling Adaptive sync SDP.


Regards,

Ankit


>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
>   drivers/gpu/drm/i915/display/intel_dp.c  | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index c587a8efeafc..f164020a4773 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3972,6 +3972,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
>   
>   	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
> +	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
>   
>   	intel_audio_codec_get_config(encoder, pipe_config);
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ef1543205ee9..9abe245ac1ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4332,6 +4332,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   		return;
>   
>   	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_VSC);
> +	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_ADAPTIVE_SYNC);
>   
>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ADB4BB7F7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397F410EB2F;
	Fri, 18 Feb 2022 11:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFCC10E391;
 Fri, 18 Feb 2022 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645183372; x=1676719372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U86Bm+e378dTMAUKwedHhs2Q/6ggRs+RXkFypg5pSkc=;
 b=fywmYajDKE4rLA3H1oSofJSLYnfVlc+lSDz0wQgls83F457KSvRjO3UW
 3437NQ75KsY2i3oXJfepxtVjdK9YNqve6iKgXPwCdFxOjLJksMPg6eqmu
 9e/djK2609HwM1OgBsRZCZIjc2WiIwUaum2AjqFvTLxQ2cR9m/nMTt5C8
 Y2prittZ7DI9jPtedH+osYtYDk0WiL+ktq8/MjP0J2cEhKrSLn5QAWHhO
 8tQQlmkNzenlYYWHLAIV1r2yvjsAvb+hyhdVtTiMkCajqH44CMs/jszQO
 9FEVntVsGte1ur0rhQEF4qd615+xS2Pf9kCNYJqxgwEabCrlQRFwfFoVF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="234639298"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="234639298"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 03:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="705344148"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 18 Feb 2022 03:22:51 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 03:22:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 03:22:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 03:22:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP5vdo0Rod1gt8Tl5SF4iWKf7oFn0uwHv72rqN9R7CVg3aFe9eRA8i3+/Vl5kGjxyoazrCVmBOiqB4sIw8kUFtWl/KVPCzsnd5S9R/FXkM+H8iCS6WMF4TuYWlmkiySOKkxULusZoJJ/YAiC3OE+e834NWf2YepCTayuEB9gH7wBlGmHJDsyO9ZERZgiIt7pxMpu8jDbn2wwyhwghrauirQ3gU05AQAVjSDdEsQ6OOhIfxgSoH0GulEdOAjWU+y13eBlGxBmQ64VdZ67ndELtagiA/r3iYc/JWy++8kTjh/aDrHqT7W4rTzJH1wjA9s8Iu7J4orJmHBs0q81Vs5F3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87+EGXfM1fphz4Uw8NhMuFmOy7tdPD0iVxnWiQk78sw=;
 b=JiUhF2x1YoM4Fu50RwdcskGhTr4+0tkffzQRcN24DWBdQFpvgP2texflYK4xU3YhkIL5HXsbz5EOGGq6BewEsl6rJ8m0dB/MMBU4GJ2aJIKWABV2hLN/tFnfjEqtAeyb3/J8rn0rHCufJadf4sKrh8zmbf42YxCbKF67cqW8dRhReRySI+AfWuenSmbKve0geEO+VDZdNE4lcQg1jaSJRUIHYi4l9B0aUIWgztJwfmfHXMdx1CtOHXT4P5Iq5+ebseNJ7Io+avTSw5CbdKG2NuuSPGNPqoF5TlI8pM+KfQWH6xWU626SXwzaZ9CHNAUrdMC9xP0+xGYvASNdEDvNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BN6PR11MB0051.namprd11.prod.outlook.com (2603:10b6:405:65::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.22; Fri, 18 Feb 2022 11:22:49 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 11:22:49 +0000
Message-ID: <0e2baaab-6a38-5f80-5552-57326d781c43@intel.com>
Date: Fri, 18 Feb 2022 12:22:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 01/22] drm: Add drm_mode_init()
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-2-ville.syrjala@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220218100403.7028-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::23) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a353f9-ea2b-4891-72e4-08d9f2d0fecf
X-MS-TrafficTypeDiagnostic: BN6PR11MB0051:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB00510A616E07E006E0A7CC5CEB379@BN6PR11MB0051.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6G91UgRaGTHfleMfiTsiqUpD9r8sdhIgbwgcywSBSX2GS/urcjUEf5VBQNcXhVEpSRlhWHGwOalByatMY/fuurLBaeQu1kFHCHaKavcV9ZOiHckiDdpKdGN2D/qQt/6XmGkoTtLEgSrMM6tdSl8w46Pw6a1DvZgTd3QIdbTyo9gkOMKEHWDBhBZhCI005JrwHd0ne0jxyw97ijKYOWQcm55FGS5+lTi3rUw+jpstBMK61PUgBD4AENoI40C3lWYEgUV1XdR9LtM7k9V0tmihaLjiVakiQ7idIVga2H22kQiUg/3C34Ml6zWiK8RXcx5/V7uAgilGPhAinJEQRjMrgnEEQpRe3pgox807YpnWFinpoSPRLTctrMSRlO9/I2YZacJYTM29OjR8sp9YxIirBE+Eb0dUHb2VP3UYXtEhn1v45wVR6NC+oA2XnM0H+jQ6FL/U/AoZ8e3MyHtuHXP1CMB2InN1s+NaQoAptFSrQ77kxi+7WLCsOI0buvf1YW1LUsr0rCVzDWyZjxJSl5XhEo9cZBTKHebJc5+Cfa85g/0Z4MVeqGI2jOYVIJ/PDcWLvisRmp0dcHtNWnlhcjcv0QyVZJu1tZX/rphC4clm23tV/h9RVM7hxtjXy1kX+7djWehFEDq1ApoayXs879j7iRIdmGLZ/A0pOxhN9/Q9MjL+5UfIJ2Vtpb8CgNWCLLdHcIADfEsgcrEb0UncEQmNzGizqQTsJyw3Wj/gwDPH+uQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(38100700002)(508600001)(6486002)(36916002)(53546011)(6512007)(31696002)(316002)(8936002)(44832011)(36756003)(186003)(26005)(5660300002)(31686004)(66476007)(66946007)(66556008)(8676002)(82960400001)(4326008)(2906002)(2616005)(6506007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmtkaVZ6eklEek15TlhKN1NxODEvVDF3a0o2ZVJLblV3Q1FJTnZxVm04YnhD?=
 =?utf-8?B?QjEvTmVXVURuY0hWNlF1WVIwKzFuTFdlamFKK1EzVEw3RGFPWHFrVDVNa05z?=
 =?utf-8?B?R3haY2dWZHhTWHp0Wm1vU0xFRkFTdFg1dnZ0dGRRV2VTWUtFTjJRSHdIUVFq?=
 =?utf-8?B?OWhTcDlGTEpxQWhDRk50NUdrOWlFUkRmUU1NdEVIZVQ2TXNnc3BFSURib3cr?=
 =?utf-8?B?TFd2bzBjTytYSWtxTEhEMm4xZitOY09BeG5DVEFESWFrTERhM1RmWGg2V01L?=
 =?utf-8?B?Q0JyNkhMQ0xVUHh0VzljamxPRGlrbUxjaWlKYjRicXlnUmZUc2YvOEpnZnhw?=
 =?utf-8?B?UFhQL1Z6Nm5VUnJsWVJKU051Rk54TEVuS0lQaGZoSkpia0NPU2gvcXhQVWZE?=
 =?utf-8?B?bGVzUC84QWF4cm50czRHOWw2ZHNNT3YrQXdSeVhJOWt1YmVsR3lWSUFzcGJp?=
 =?utf-8?B?NEJSWG5PdzFseDJESVEvNlZjZkJscHFjcWZ3dXlDVFEya2xJNU15ZUUzdDl1?=
 =?utf-8?B?Qy80MnhSY2Q1cW5DL3g1ZURMeHlOY1ZqQ0krcGxxeThEWEoyRmt6K1ZOWnNX?=
 =?utf-8?B?ampzUGxwMUp3SFFqbmM3clFEN3o4bjNBaUNzVXl5N2VMS3Bzbm9jdTdNVm1D?=
 =?utf-8?B?d2xiMUtxWXNadFZDMVJQcXkzQ25zYmNIckxRRHFGN3VpTWdmY29JZ1BuZk9Y?=
 =?utf-8?B?Q0hUS2hJbkh0Y0JwQ0doWE5jcDBwRExmaElsVXg3dEUxVzlPZ2FzZmNyOUpi?=
 =?utf-8?B?YVFtQ2xTcFlMREtSQjBCeEN2cGpQWTNqM1NmWEV5d2NkTWtLaVBOdlZDRXE0?=
 =?utf-8?B?eEx6TGZrVTZ5cVVlVnNFZXF6TW5PaG5iVmJjZHZCRVh4OFByV2MvTnEvTTF0?=
 =?utf-8?B?TlN5TmxQZTJLbk1Ga1lPbk81ZVNrSkJSS3NkMGZwYzFiSDNoMlNUVUVYV2lo?=
 =?utf-8?B?aE5SVlQxNnRoS1lYUjZYalh3MjRBVElwQm80aWtPRnp6NXBWaWZRL0c5c2hu?=
 =?utf-8?B?bCtaOVVmandnR1N6bXJ1NndPRlFCd2NYSit5NEh6a3FqUVVBUnpjcDh0a1dK?=
 =?utf-8?B?MHM0QWNORmlpeGZETWo5WGxjRFhuSzZ5ZDc5NFlFOVZ0RHQ0SHlKbzRQTUtH?=
 =?utf-8?B?SjBGWDlxajNrb2Vibk9RbmtUNHBYdFNRVWwzdTJNMjloSlJTd1lxY1Y0OHRF?=
 =?utf-8?B?WXlIMUdHUVpnWDE1UHBkWGlPNlRsbFd1b2VXNERJS21EeGlhdUVud01QN2JN?=
 =?utf-8?B?OXRBT0g4clVPakFrQkhsamEzZGJWWC96RjVxbE03THRVN1d0aGEyMmxEOEtT?=
 =?utf-8?B?R3BubnFHUGVXeDRiSUJzdjJ0YWlUM1daY1hKbkw4K0VUcTF3d2NRelExK0NC?=
 =?utf-8?B?cVRQd2xOUGpIc2kwU0lTa3pKQVVkeDBJdDltU2ZFN3Y3YjlWamE5dWN1UmRn?=
 =?utf-8?B?NDFzS3FnNWV4Rmt2UmVlZVkrdW1XY05RWDI1YUpuZysvME9aRXR5Rk1BU0FC?=
 =?utf-8?B?UFhDajNlQ3hwd1lwa1RyTHdLRk5GZVhQVDN2eHFFL0tOUlUweWlFc2ZlZVZh?=
 =?utf-8?B?TXh5Vk40alhyLzZyVmZIdTRQMjhrNzR6dkpNM2ZkSXRVaGE1Wi9NVGZPU0tm?=
 =?utf-8?B?bXMrMjJMUTFCeWtLRFFHNkI4TnIwZzhRYS9uVkg3cHB1VCsrZ3l2by9pdXR6?=
 =?utf-8?B?UkwwaHhqeklvVFlJZDgvcDdzSktHYklnN21MNFFmUWFsZ2R4RjBlYUN5WS9J?=
 =?utf-8?B?L3QvVnQyL2ZDaGpFdklWTkIrcmxjQno1MmM2MDZLQzVrZjljUVJTbVN4VzBo?=
 =?utf-8?B?U1lUVGZRd2pWckRHRmt2UVlLd2N0NDFtZ3JVNng4eDhjT2tIZjM3L0dCLzFt?=
 =?utf-8?B?bVZnL1NtUHFXOWhPU3hQU2tadnBmakk2VitlY1pXM0pTUk1YOHoveHhKY1ZL?=
 =?utf-8?B?aFpibDBLOWFvZ3hFVGRLaTZpd1RYY2x5R3pDZWozaERiZUVjV05mZDVuOVl3?=
 =?utf-8?B?Myt5Yi9QZFVIT2wranFoN3h3aVJCME9SUUxaVVQxbHlmMi8xQTg1bW96TUE2?=
 =?utf-8?B?WHVONWxDcGs1SFJyTHA2Tkd5VDVxeHhRMEJqYlNtWG1TdVdLZ2VLeURWNmlC?=
 =?utf-8?B?T3JaU0lkMngwbmtYckZ0c2tzL3BWTVpkZXd2K1pOTWJrT1NieHZHOG1zNnJR?=
 =?utf-8?Q?kuCfMLMT46F/BqT7iWUlzxY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a353f9-ea2b-4891-72e4-08d9f2d0fecf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 11:22:49.4419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99e+fBNT1/M0NRBIvDArHg/XemiVNNeZB17N5zArZpfkI8HYpXMws1GYvZdWZu9PTYpRBcIpyhX12dUZgudG6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0051
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.02.2022 11:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Add a variant of drm_mode_copy() that explicitly clears out
> the list head of the destination mode. Helpful to guarantee
> we don't have stack garbage left in there for on-stack modes.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_modes.c | 17 +++++++++++++++++
>   include/drm/drm_modes.h     |  2 ++
>   2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 96b13e36293c..40d4ce4a1da4 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -892,6 +892,23 @@ void drm_mode_copy(struct drm_display_mode *dst, const struct drm_display_mode *
>   }
>   EXPORT_SYMBOL(drm_mode_copy);
>   
> +/**
> + * drm_mode_init - initialize the mode from another mode
> + * @dst: mode to overwrite
> + * @src: mode to copy
> + *
> + * Copy an existing mode into another mode, zeroing the
> + * list head of the destination mode. Typically used
> + * to guarantee the list head is not left with stack
> + * garbage in on-stack modes.
> + */
> +void drm_mode_init(struct drm_display_mode *dst, const struct drm_display_mode *src)
> +{
> +	memset(dst, 0, sizeof(*dst));

Why not just clear the list head? Or maybe poison it? It would be more 
cleaner.

I wonder why there is no such helper in list.h.


Regards
Andrzej

> +	drm_mode_copy(dst, src);
> +}
> +EXPORT_SYMBOL(drm_mode_init);
> +
>   /**
>    * drm_mode_duplicate - allocate and duplicate an existing mode
>    * @dev: drm_device to allocate the duplicated mode for
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index 29ba4adf0c53..e6e5a588fab1 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -484,6 +484,8 @@ void drm_mode_set_crtcinfo(struct drm_display_mode *p,
>   			   int adjust_flags);
>   void drm_mode_copy(struct drm_display_mode *dst,
>   		   const struct drm_display_mode *src);
> +void drm_mode_init(struct drm_display_mode *dst,
> +		   const struct drm_display_mode *src);
>   struct drm_display_mode *drm_mode_duplicate(struct drm_device *dev,
>   					    const struct drm_display_mode *mode);
>   bool drm_mode_match(const struct drm_display_mode *mode1,


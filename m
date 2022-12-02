Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62196410E1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 23:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEC610E045;
	Fri,  2 Dec 2022 22:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6857E10E045;
 Fri,  2 Dec 2022 22:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670021368; x=1701557368;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6l920QZyEPiCr32xlp2Nhl5E9GsewjKrk1Bqy9bwL/Q=;
 b=jCu4/ez3OPsBT/bSwXHwqr5mhNVH5+3SAhPDgGLondH6XMPvbihch1wL
 1EhcTzIsMqf6Nr4BHggwWGBHUe1jsryUlVbx0vE+/nDiLyGzk8MuMkh1N
 8AhJbELSWSrRbitcQSFLOEMSzACfen+1OO9jh/tAOV5rq8T7uTj2QFXvv
 NiIW7EhAt4C5+/sP4GdJm2uVAfazaYLSb5sA/ri+bPawO1wUrfxCRQ2gY
 WU2+22PD6kt6cn+i1qyiqyltQCD77rVm4OxN8IA2K+N9/39mrrJKSjEsn
 h9+vkbsK+HFWW0PgxMA8OxOBOtQENOf8h9TLZKosLbumExpC5Jx+JHRyj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="402341091"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="402341091"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 14:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="890317590"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="890317590"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 02 Dec 2022 14:49:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 14:49:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 14:49:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 14:49:26 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 14:49:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A70BnpfDBD+ZHm13XRvmyEPcIp4S158w3m229fXSdyGkJ34THX9ePGzDSPvpts5iONZFMXK5dwBkx6Zx2b+iFB5K3umkTR3i3GVWisXjlnFZWuSivD5D9Az7fbln6wEcDBbyJrl5iq1ZgKvY9sM5RcT3xjNf8sKbFqxTJrBBDm1Lb/qOGWGdFcbUKWEW6rdCudgtoE+KpYg7EuVX0Gz0k/5EeuK5jGHGNINE6GhWKEcRD7Nh+Ww2XKxNvUKXxND5eSNhHfRi8sm2a1uBg6Okh/tklmnoD0vunivzEssl3y3SkoWROqn7SnL5S89LFK0JiLHaliO5NTEpPdvFxj+WYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wywS1+ZjsSVAd1wq57tu2Wk2gITAdO652V/YR31veIk=;
 b=m42Z6MAzb9Tx2pGeFssw75gLwtx3DwdMu8AYsIMsTYOeekkDznNyUB2B044aIPMvkfrvsxrFCPMkxrKVAe0Hpb2CHln8mJCBnIivbpbE9gJ1QMIa99KjbPPI/SlIrGtnG3wMFEJiWjH5imKaW0+DwLu87oXlI6UPJBTZnLOzbSOw9vp/BvoyuibE325Rn2Ya219e9n9d1guWO5aqusZqKGpU4/DXL186CK2SLxEAo1vd9XI3dHwiTeSB3R0PmaFJ2hlb1hnhJ67oAsLv8lUotDY+0lpRBu3s/cATBk824I+9eBk3KUWV9vmA10DwCKtfoVDLA5Ylf1v4jUlfQcBHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7885.namprd11.prod.outlook.com (2603:10b6:8:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 22:49:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%7]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 22:49:23 +0000
Date: Fri, 2 Dec 2022 17:49:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Check full IP version when
 applying hw steering semaphore
Message-ID: <Y4qA760HHNU2b7RJ@intel.com>
References: <20221202223528.714491-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221202223528.714491-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 909cd10e-9781-488b-9cde-08dad4b7751e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: auMghdJzOpT4GY/gk4aVftF5WlCW2NOFfcEbdnrkhCkyI6Fw64pRI/J7QAmzO6MCY6Q7lUBT/u/9v8cQNDNufk0wB1uJQgoo6UaaopyAqr6ZWklrRXnguLwJBR9HKdTu274p/4ByltVnGuSEbK+/hI49lzqUVgP4c394NoF2pLwfum0eTnXLMOBOZYB3V4wnDjQjEv1IsPS4JxCXAlBN91qOBEUApajouKrz9noS0531ym2kMRizWOgTMW+4uSAdcT8Wo2b7Xw15o9XcOO0THwTvuj9BI2t2jsFro+6IOW+HRmYMrQo+gcHXajGf+YbmolgZ1RENIysfYlIkDdYbB7fKZVwXPuk3jHY20eXJJsJznUWpMjk2ayNWSQEFrygzZFlPD+qROx360fV8CoTJIrHIyTBD+Guz+Kv9TZKcp/eReud3E5TvoMyNroat3AdOdDST2HdQEVjY5I+A8AOr4ZhnPJbqYYqd2XNMuoMbvHHW1YtqxHah3/AX1dbGDc92PuvlH51jYxhLinR2D8VDFugvY34TWnoEh9qiv11xnoxV7/w0lz/KRKrozsZvgH4W0jDWUyl9JJbk4JDl1OoYLKKqJw9eLm8/WoXXqCY0uBZXsIRpe6B6mJqhSnWhsZjF7JR7NY36/+IzTBg565uCosRTRzahx8RApfp+92ffVE9r3t+C6dBH6CdB3Zxg8K5/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199015)(186003)(26005)(6506007)(8676002)(66556008)(66476007)(6666004)(107886003)(450100002)(6486002)(478600001)(66946007)(4326008)(2616005)(41300700001)(44832011)(5660300002)(6862004)(8936002)(83380400001)(2906002)(38100700002)(82960400001)(36756003)(86362001)(316002)(6636002)(37006003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWCFCzRKhxLl2E7OqfZUnVqND7pSw43TQ3jsALv9f5eK6d+A0iTRkdAAVgoP?=
 =?us-ascii?Q?jPB4ymixXoBdUj7MSEpcuG8fBFUY5kW3G++CZjdG7juG9o2Y2nrSrglehk6t?=
 =?us-ascii?Q?jk0jVtCWlvxZUSXjFzCIS5QBUQWHERXLDS8mcMtqQoElFmGmXktJgZd180lR?=
 =?us-ascii?Q?suz+6/IdQfq7yagCaevZDFItnwa8cOKuMUpNFHiHuFeoHZhVuMhVlr4YZ9/I?=
 =?us-ascii?Q?9peMR88W/fejJVT3yVfmGnnSRReSFpKhTCflJvW+6vgRyTEvwbwpeXCgMENv?=
 =?us-ascii?Q?czUnhi581IIumcGEwmYPdsj2EJR0XAb5t9QwijztmqURAzYXV1wYmQnmbx/G?=
 =?us-ascii?Q?NhQJ5NS1McEQc60Ey/l1QNq1YO8V2DGhv/+3rfCTlJTlD/SdBc9oiezx9+8D?=
 =?us-ascii?Q?KNFDyjrQGpEYxMohvrxRfl0R0y57YApVM99ytqp72sfOxHFVgjyn4Q4efY49?=
 =?us-ascii?Q?IbuVezc5hrQ1UN851cIVE1THyVOuAIpASuqU1gh0ABa9pfIaO0w4jOpsdP7N?=
 =?us-ascii?Q?dlfZruRLlLRZKrTUmpm2vf+u6LZADnZX7ojl0sqvp1+yHAIHzKBTMOS4G1Io?=
 =?us-ascii?Q?mMnMd8rnW/u4u9MtjnX0aapJNHC7luRo7Y9i0jk9U8hDIDCmMXu7/bmqH6cy?=
 =?us-ascii?Q?aoHMPIYpIJC/YjSnZSmman75mbYcQbVUIJM18ZboHUubAk7XaM0Bn38fWKze?=
 =?us-ascii?Q?u+Rc73ZQl14kQvIcwTQXEIUoZItS/Ai04UGbZrqPz6KdZmIe1PhjGQcibXfS?=
 =?us-ascii?Q?5wsLM9AgPn/0B03ndylRhC/PIWitDD2LDTAflS4xSiwCdPcOD3KfVWpukT6O?=
 =?us-ascii?Q?FBD1x6LYE5diRqCh7k0ruiu90a/9yPbph1OqzIBtKSsYb96oYCkfvtmMOuUw?=
 =?us-ascii?Q?eFdlWTMPB8FPA1ejZZRIfXn06X5lW5M1ZoeNg2iUqxSPgssCvsz7EpSdUjf/?=
 =?us-ascii?Q?lyFtlY387YPps77G6HG1yQPx7u2Vs2ozpbhdrpAkV6lQ2CxIHapKxYKWdvEt?=
 =?us-ascii?Q?80Hife1MJZrP3I5daQQn2SpKS5FfZlpIpTixQhV0nYU039KsBcbsRIgcwBTc?=
 =?us-ascii?Q?dQ3zPi2346iXxsF9EiECCJF2a7Cm/Q6tr1wXViQfWb61vv0b7Giagr4ikwaz?=
 =?us-ascii?Q?sOf/CenVZm2I4NQDOuaaXy32Ip4NwSxj+5Jgeh96++XvD87QeEW9MbshK0Jc?=
 =?us-ascii?Q?xz0Cbo/NOKDNLv+qAzxOuOf99v+FRutb57gTtOwBb/9+q2AlPDHH5d6RgnH9?=
 =?us-ascii?Q?ii1bbNSLfqg6gajO6IPO+tFE068ZXQf+ngt72mCq2yXLdPYpfxYTREglkZA7?=
 =?us-ascii?Q?YSfabIRTjxf9bE1HhqHUNtdps0ZG0ETatlW4tFHkOzlNmZ66ztsOteVgg18+?=
 =?us-ascii?Q?IUWxL7/+ISv7HqZn8xQdM42BeMdNqA4q7eYrNL+KQJIc1kQYqkzAicHW733/?=
 =?us-ascii?Q?5L85NI+7Mg8i9DQKLj2UmoPeqxO+/6as/FvYeyI8GgMKC7q6G9sUgRPRuuUm?=
 =?us-ascii?Q?fjaF4KnWHKDj+9hDs7e6uT6HDug7IGFDLZAagwZTbzzs90deTuE6X36cLUrz?=
 =?us-ascii?Q?sWRuY5gUa+zxxOzS8PqNXdHLhBUYdQPSiff7ESZy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 909cd10e-9781-488b-9cde-08dad4b7751e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 22:49:23.8827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Se3sYiVeZLtD0osNmEv4d6vT67yFJdJeHn8aZfHDG6+Fmoopar3g5S9nkDR34POR5J8O8f97+fljJaBhEmQrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
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
Cc: intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 02, 2022 at 02:35:28PM -0800, Matt Roper wrote:
> When determining whether the platform has a hardware-level steering
> semaphore (i.e., MTL and beyond), we need to use GRAPHICS_VER_FULL() to
> compare the full version rather than just the major version number
> returned by GRAPHICS_VER().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 3100240bf846 ("drm/i915/mtl: Add hardware-level lock for steering")
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 087e4ac5b68d..41a237509dcf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -367,7 +367,7 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>  	 * driver threads, but also with hardware/firmware agents.  A dedicated
>  	 * locking register is used.
>  	 */
> -	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>  		err = wait_for(intel_uncore_read_fw(gt->uncore,
>  						    MTL_STEER_SEMAPHORE) == 0x1, 100);
>  
> @@ -407,7 +407,7 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>  {
>  	spin_unlock_irqrestore(&gt->mcr_lock, flags);
>  
> -	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>  		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>  }
>  
> -- 
> 2.38.1
> 

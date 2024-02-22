Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0562A86024F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE83D10EA40;
	Thu, 22 Feb 2024 19:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDikd+rq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CB010EA3D;
 Thu, 22 Feb 2024 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708628970; x=1740164970;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/uQIqYFMFeMPyC7DwE8SzNHtllNO+OXhGmumgx39xDI=;
 b=aDikd+rqiMLSToStdRamAV3/ncanflkPnF85rBgYmSTzeTg+biLB896m
 0XdJc2//SSuKQmsv+PNkEBEJUFhGb6DSP1S4OV3eWLwHKhDZzk5IB52yE
 lpFTO/TUM8Ftwg8POopOEjYqz73o2hVBSeNsjwnd+zpirqcdliVdm8p9E
 BJk8KFe4q2d3JQlFTQX5EpgVMR6X1KvMXpVq5LM3BaH8DTQddfUamuII3
 s/Ca9SBr1iPGY7VgoXrvap+Ki8dKZyN2L/D/lY0fQ7yGvpIfOtv/GcU+G
 2oGq1HQqd/6b9/DeXo5Z5mndU27LV24AdilYWDgOoeIKyLY9IT9unugH8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20320525"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="20320525"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913572585"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913572585"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 11:09:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 11:09:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 11:09:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 11:09:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyC6xGj1K7WcPYMF6UuTUs1fq5ZZphbA1jXYwdJPcuhEovidjXm4bW/mwjWEbWeQItjSV5mS55Qa6JX9RNvQmZ58Q4QduBERRtCfD5N6Ad6yrH0N29WYGoT0E54As7xEymJiWYeR4dtR2KbuWD9tFHn9/oAkZuvCjgRnvfv+SM4xU53+6JfG+tA0XqRNEJXG+o1kwh/UYRU8CqAf63J5wfmhAikZGX9nz6CwaR03/VQ03B2eKVhIKUAlrhFuZkfjA2GHx/9UZ6o7jEKPV/kuGJdf5B7t6KTuCNALNZiPLR5/+IxtdzjiwBuyk+f2bw4ZEWf37aybXLNmE2cZzj23Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue3dhNHyDa3Vqk8fwdoorWHziYMn8Nr3B7VA2KDopXM=;
 b=gwOUkw0BhFESzk1WlwqHOhJNTc+EcUdYOov6iOR7R8vrP7NwiUmXcJ5zm9YjK7t+9mpPydXxdSNKQ4vvpVr2U3fI+D+1VfEGRU+JoJflsd7iuVU01zYKb1WO/HEA13ayfjGOeJQ4Ow2KQr/i0e9+YidOgxikIItUnA8phint/AMInzd7RBZFQXE3ct/WHIbDAmFdactrqKyvuM2moTH2UfHjfGnFZlo35ghGf7EPYco7I85jHT2fSuwEh3t2j5RDHM/IHmS25Z6tHd2MNMEz0c8T4ppkpilrb5X016rwXBHCeKLcdQwU9/Yja4c48w/YTr9fJG0SWmX/MJJzvCggSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6800.namprd11.prod.outlook.com (2603:10b6:806:260::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.42; Thu, 22 Feb
 2024 19:09:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 19:09:22 +0000
Date: Thu, 22 Feb 2024 14:09:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <robdclark@gmail.com>,
 <freedreno@lists.freedesktop.org>, <dmitry.baryshkov@linaro.org>,
 <intel-gfx@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <quic_jesszhan@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/dp: drop the size parameter from
 drm_dp_vsc_sdp_pack()
Message-ID: <Zdeb3DHQ_WMTp8zR@intel.com>
References: <20240220195348.1270854-1-quic_abhinavk@quicinc.com>
 <20240220195348.1270854-2-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240220195348.1270854-2-quic_abhinavk@quicinc.com>
X-ClientProxiedBy: BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3a1377-b527-4535-8e1c-08dc33d9c713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hXvytRYnGPgLs9Kthut+G1GsTmmlZhCOc4R4oiG3mbLAtcOfyHI981DxqVDtjP4rdg6VupRrOduwC1Nu7Tu1dVhJe22IcjVq1+WI1DkcFV/JexBZiaMqy46pl7psAqxif00KkwNZggLJl3VmjPG2C7BD6eAlxUlbkumlQfPykltARm3dSCgPKo8HW7Ec02nfGCwll8dYmIW2yLfDrguqE5twx6GW+vh1iVdBPeBgTV4mYziXsdYGNbOpDE+NUS+JyaA54mRcPdPZGDSrKtBJ59ajZIlQrTwfwCdu81BdWFwG5vwkqU5g9un8p1VDzo/fkHxqAo0a6/Q3+UkP0fY30rgIoEusu7sN6YP9gVl2Ej0LeMc21ilXP7R1OUvHBr4QkA71OddP9bHxTyUHbwHBOssRvtVuk7GVIT8i/NKZcDkOnjbLCZDftQ/1n40gQcekEUi+g5ZYSDPO2ZpglI3CatBH8gnWUsww4BDZ52buG9hehSoypzRxu5m5I6rOH2u/YvsLV2l3S+nQhkwYYJDyOnlsbdkknUiKb8UW4EbC0lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vkop/vfiJZxDCjzZx7QmuTRX1Vt6CgSbRk9Kd44JX6yViQ6h9HO5shxlTfqm?=
 =?us-ascii?Q?u87qi3752CyEtP7Zka5IGBSP5+aXTSc8vWlAg64nniBD2fRDTf9vci1svXit?=
 =?us-ascii?Q?+9mHo3jPVpb5bIngp2Z334mNG6E26vdie2lasg1LuDGkg0hXThXwjfcA0gHM?=
 =?us-ascii?Q?//seJMHWtB7mRDa3JV8XmOOlMThW9iUgEuQvGZduIBePFivpKQ5BuyWjqHIM?=
 =?us-ascii?Q?YMyQzyu3+pMFvKCiqE7r0C5aYf4yFW4LJtXiMmpIppM4yaU0YBrnIA4UhhgC?=
 =?us-ascii?Q?/njBBVGOzx5W8Uo++y/5wzVl4ELRhNbGDl/1mDiCsRLs8tfON0K3NM4QWWvl?=
 =?us-ascii?Q?FxHi1N9j7T9CZC+HEi4tkk/K/FFDTfU2aJpxdoGVHXS0O8iCBmeOa5H3o8S8?=
 =?us-ascii?Q?G/YLNTIoH43wHb+p/MLDOJk9kw0cwS7xx5hF+q7qXO9/uQxbQ2ELIH1+nit7?=
 =?us-ascii?Q?35jHdbNUDkMOH8Tx+SOUBpTcny1+la1rn75n3iAXduZV0qWMmxi+Uwzq8XQU?=
 =?us-ascii?Q?/qTjdz5UbokigIVrWLwcJEV+oibi3DlEaHo5Gj6GOLs2h0Xl3eWSkq8il3U9?=
 =?us-ascii?Q?oWbhihMLszIPIE5NvdDohn8zE6PPxSSH4XIVtkGJMM6M4aN5RHwyo18UzB6w?=
 =?us-ascii?Q?rih2CWl+2MswHs7r+aU9QIxhtQV6cot8rhElhwYodilvGbs8MR3bapmAl4tN?=
 =?us-ascii?Q?FcfvrB21nVkHBPZiID9hDk0ujAKnKBjO3TuzzIGF5Q27g5iKOdcgtIgyfAss?=
 =?us-ascii?Q?uFh/KyilS8JZSO5o9zow8k/OwS0iSM8MABfaAVjuEd3bjezBIme9QHZAt1nj?=
 =?us-ascii?Q?rOTkEHcL1aDc/tYce2NEm81wPdT8zIfUDHUcUhlJYBTVnL1i9esqp7sRRtLj?=
 =?us-ascii?Q?zL5FXC8/YIjaJii6RSfaTPYbuE6bsG9CgcTagKX7vHbiICkX+s7Frn8K+LH5?=
 =?us-ascii?Q?jYgqgBiENEXytIjxEDf8Dlg/WP5ucvrXUzezD/mr2p/x9rPGVPCVd9xy4ISQ?=
 =?us-ascii?Q?dMpesRaXNR0gvjjRIelhEcZo6a1/0LsDUxCndFo8GBeQJwXrIIMHp+E5zKlU?=
 =?us-ascii?Q?L3vhYtbc6gI3fMNuX5gi9xfYpicNFYL50isBJE5j0hku1RSailK/5Hv/xB/e?=
 =?us-ascii?Q?vDLmhWZBrZh1Dypx/bDovDoBalA1kXBSiblK/K1aoqyhD9vhZJHVffJWLG8a?=
 =?us-ascii?Q?l6stkrFv/VWY9+E1mXdagUUovaBMDMVpYtg13saH3QOvHiRj5DfQN+9FEEEp?=
 =?us-ascii?Q?wMr/mxI4JZJG1bnUXVxwTn99GhGIzF2dm0iVz0mE2audwaFx6jtE3Far0cXq?=
 =?us-ascii?Q?RJb7Ni9sHUXCdkJ2MSPK8sfzQprB/ZuON/GLsNzVc7mjfUoJ0riokHQPp2F2?=
 =?us-ascii?Q?9O5c1dM9F0uwUXmoQECQtIE4XPU5D2dVmssRWAspxdBsPzvKzqJPZDo59Flj?=
 =?us-ascii?Q?nDfqqeqBIamQnVSEsS5QXHBvTXiHy6/pT9LK3l6PMMZN+5zFZAfnJxaFlYMD?=
 =?us-ascii?Q?rWmDF0NWsc69aeB3rAhe/cgW5r4JmhPnmNm+PZ/ast3wnsZ1ebLz/WEevHRH?=
 =?us-ascii?Q?LsO3UrGESCNz1DIK8DyV/VxpBggd/M5l7eX+0J0i+AnpiMjqnqpGkz7wM8Y/?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3a1377-b527-4535-8e1c-08dc33d9c713
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 19:09:22.2584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0HkKvKFNCF68c8yiTE+I2+ns133c0VIWiuQoDamFZZJ1ofBwj9bcP/DeRBiEytOh+KNpuz6v3Qet1pYqpnQjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6800
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

On Tue, Feb 20, 2024 at 11:53:47AM -0800, Abhinav Kumar wrote:
> Currently the size parameter of drm_dp_vsc_sdp_pack() is always
> the size of struct dp_sdp. Hence lets drop this parameter and
> use sizeof() directly.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

it looks indeed an unecessary check.
you can convert my ack to a

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and the ack to take this through drm-misc if needed

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 8 ++------
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 +--
>  include/drm/display/drm_dp_helper.h     | 3 +--
>  3 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 6c91f400ecb1..10ee82e34de7 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2918,19 +2918,15 @@ EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>   * @vsc: vsc sdp initialized according to its purpose as defined in
>   *       table 2-118 - table 2-120 in DP 1.4a specification
>   * @sdp: valid handle to the generic dp_sdp which will be packed
> - * @size: valid size of the passed sdp handle
>   *
>   * Returns length of sdp on success and error code on failure
>   */
>  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> -			    struct dp_sdp *sdp, size_t size)
> +			    struct dp_sdp *sdp)
>  {
>  	size_t length = sizeof(struct dp_sdp);
>  
> -	if (size < length)
> -		return -ENOSPC;
> -
> -	memset(sdp, 0, size);
> +	memset(sdp, 0, sizeof(struct dp_sdp));
>  
>  	/*
>  	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a9458df475e2..e13121dc3a03 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4181,8 +4181,7 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>  
>  	switch (type) {
>  	case DP_SDP_VSC:
> -		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
> -					  sizeof(sdp));
> +		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp);
>  		break;
>  	case HDMI_PACKET_TYPE_GAMUT_METADATA:
>  		len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 8474504d4c88..1f41994796d3 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -812,7 +812,6 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  		       int bpp_x16, unsigned long flags);
>  int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>  
> -ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> -			    struct dp_sdp *sdp, size_t size);
> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
>  
>  #endif /* _DRM_DP_HELPER_H_ */
> -- 
> 2.34.1
> 

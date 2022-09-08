Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082AD5B27B7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527E710E63A;
	Thu,  8 Sep 2022 20:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDACB10E660;
 Thu,  8 Sep 2022 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662669056; x=1694205056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xfJriIB6giCP8T8jZ2Z1dY2dzSSoRBV+Be7K3K3u0W8=;
 b=bFaTAtYFkxo2qYzCcFTytHwprBYuDjfKn0w0bp2F4kLoWiDn4ylskKfJ
 2T32OCbeLmHQNQegrcpruFfsz9Ftzc0eDK7OiKgVJ/sPZFIJTT7clTdSJ
 Wtuccj6qq0SjKct8soIAaA9afME7UpCzP8rvkjHFdrFGoj8VZDdpMZCbo
 dKuYeD9AqrT2ywerrGNKrZww4mLR+k1QKBmDjlQUgztCTRu/eybqJnfRy
 F1aFF8k7EWsyhqrOr+imzHswgpuVKUW4Q6XjGhRRuNIC0UF3VRGliZFhk
 q8l1mwKtpfSywoJIQqv06STln4WQjwjqm4uLkKlpHJBKk2f7kaFRymwVC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="383612340"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="383612340"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="943507359"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2022 13:30:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:30:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:30:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:30:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gd6LFYcP+S4Yfy+uzrB8oobRU22HVLQcL8vvGZr6k9egSHcWUw6BaVMz1G+YcpIXhLIzHMYy/X6ddHvDJPi2/CNJyGk4nUXya104auzfROMQa23Htly4DCxmjTIqGzyZewftvt4KrzSGCFvEpIIpJiHRRcq5I6+tN+ZDJ/LeRlaWaTgWLK1B4n1cfVOY/PHisUy70/Mg8RrVTNDiEw70R/lmH03rHBBbm+oKBrVjdm1PKlJLh/F8yhbve0NUfDBD+hn8sRItqf4boL3NLVN+lvJXQMXtJ8h4et2Nt3IElq8fvT+6mbuANyfN/hzgdeksn6j3jHUDL88aH+EkNmCSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD+pxmGXvdrkPMr4PIlkzUNt0P7PCOdwmbTutYdsyws=;
 b=G9x5ybWo6G4JW0QWnmaEFyQDAdx6/KIgIA8d4vodC2XtBpicquUimjfprrERPPWEjhGKRL6Q2wMiN+VUChcCUmq5C7S7R5EyLWl8sA5yAZ/jBDzz5NZtYfNyAm/2b4UdURkQhww09MzPk7RPs2ivuFWC8LXHsJ4QrdHefngEQP1HL5ZrNuGos5H+utGNWNwG+rgwlPmMSugBhTnj3XQXEaMOscDYGniZPz6IPeoKPRly6BvBQJxLDtsuvwIjpXUrajw1bC5D+7GKjH65yiITvr78XBfhNv24foziecCSxs2LgQFtIqYkcxpAHiJFl4d/nKyRP6c517rnpGaNhtLk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB7026.namprd11.prod.outlook.com (2603:10b6:510:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 8 Sep
 2022 20:30:52 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 20:30:52 +0000
Date: Thu, 8 Sep 2022 13:30:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v4 10/11] drm/i915/mtl: Update CHICKEN_TRANS* register
 addresses
Message-ID: <YxpQ+VQSbF2fp+Yc@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-11-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-11-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SA9PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:806:23::10) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e67db986-5ecf-47a6-1270-08da91d90632
X-MS-TrafficTypeDiagnostic: PH7PR11MB7026:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXRxM+cLI688elaZMZd6KbuZF64bECAixjhfiKlRPsdvNgqMe2Jwtk2XN6p1e/Ca31WdTeFiPeIRBLTvTAH4YmAyYSkXwwiU19YjqXnhrnacb9ftbwm+9yuosE/dSGNVLGPQ4Q9laB2pfAO585P6yVtjdlCSAIyrbJhEvRDIPs69yvx8pIO1ps06inzbN6wQAUJcBhyqmcZCcCKF7HauB+kqWDoVFg+mgmb+09VL9Itm/OidSAQ9+IKskMzP7lzXaPzIhP/kH/lQIBG4jgUjuorTRlsLbxSbV3WhkVNct+M+WCEjn4PTOU8mDTGzopfj0dhvuKS0g3+cxB4WKWWnsK/Eho6L8/iw8ljVT/ZzvQBE6LKgQ43TJ3oDAD+39ca3mxNaBhFMxDPYObnSsNdBNu7h1ZkcxrDN6re+/Dz2j/mYYhXeTOUUyz4yl9kEiz+UGG/k9Pa9pYA6jUIBrM13tNqEBymHrk2YMUzgC+7I/+YS+cBS0sgweUKQjBnHU+NZJNn+95BL9TKVNpwjPmlrFt8tK9TInGaX0dkWClZP9nGHt8oBIYJufBbuShUXjql/S5jI3jd8LUpb65By4nK5C2UdajaKWtbtsIQO2Zb45a72Ydb/wofzVeR7dXUYte5VCqHekcb8zbI1VAPS/5OQPY+oKKEeKq1TyXqYOKyKblO95zqR/451hHUn/cYzfr6dX38ZgF1H+vTnjZkx8Dk0RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(376002)(346002)(39860400002)(83380400001)(6666004)(478600001)(6636002)(450100002)(6486002)(66946007)(66476007)(8676002)(5660300002)(82960400001)(41300700001)(6506007)(8936002)(316002)(4326008)(186003)(2906002)(38100700002)(15650500001)(66556008)(86362001)(26005)(6512007)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oa5AvVrxtmctHWWOYTKnlpARe/ZiZrZ8bOlAz0X+o+BuT8MgH1zQ59OWjs2J?=
 =?us-ascii?Q?6jMbAolGrR7kGcXox7Kwu4soH8Q92bRGkDFWVbauuhIYWQg0CZmooEDScXuE?=
 =?us-ascii?Q?Ug4xazzLWr+ZFsYS5P73Z9CmxYIhZP/JJ2+UpbPbsrzFsHaH8fl1UjT0OzlD?=
 =?us-ascii?Q?QCMKSZ5AFvtMlOVagjbnkQx4ItUH5GTBLb8xDIXmQlKLh8CM2XPK2ntYd5uM?=
 =?us-ascii?Q?vbXYfe4ruttB/w2i2Plc55mmk7P2tIHzH7j5a2OJEXebzisPWxrUjhzXwHhA?=
 =?us-ascii?Q?eRYqRkZDMtrRzjbi7ZWkgtRrKI3S2m6yC3UwOiXqQj3WNp7EdDYhDBgo0rVS?=
 =?us-ascii?Q?xO2No3jnnr8MxV2y/8iUkgIB8xUBDNVpoGasgS/hQrEURM1DEyE6v97i437F?=
 =?us-ascii?Q?NfW2NrsoHylTTLZCfOswaziR0FE1kNpvPYzXK/5ssBMWTDnrAlHzEvYR4hEf?=
 =?us-ascii?Q?GmNqnyJpQ1M/YFQQOU34DDfnrgeHLbVUDCBMzk+ZPx2d/vTxaWUv3uA6yj7z?=
 =?us-ascii?Q?TD+vDtI5iQaUWfR6VeD0N1ID3bNcMTTl1CfYBpzBHi3llmNO6BXzoYgPSkqQ?=
 =?us-ascii?Q?X8+H0ubSTr843kYnsFHzVXzMBX0+RQg2BB9uCejC58knjBaHBzzCqH+qDqNS?=
 =?us-ascii?Q?J/9ucMT/Zu9hkFHo4S4K8nvGNJled0lU5tq3aaaMVegssULO+t2Y0hSHPGXB?=
 =?us-ascii?Q?EyB3BQRFm7QJN58Wc68pKEurw3fvfbRc+9IdSXfno1RR2PhgHtcmguTQI3MS?=
 =?us-ascii?Q?UhUagB1nY5ri1ZQc2g5UlkY0mohavpk9BYBe5VxJC+YRbaV5YH9xWTr+26MD?=
 =?us-ascii?Q?nHvcqgDtMGNIfg7GLnuepviuHJHkcBTUfnISSxAf9iMokvnjHcAoEQRiVdTX?=
 =?us-ascii?Q?hCGliXmYcpGeZ2ZwtS9MPuG5VzA+1cg0XOtc7VlcrW729TaZWqFn1JER4AQD?=
 =?us-ascii?Q?ZYfjnjTBeQaiXmGtXGrP1AVCzgBfbdQTlKgJOX5pqARQWBhU2Dadr9Y5j9q2?=
 =?us-ascii?Q?ax83JcE4dJEHkxdmAhPvi4yBXYvjatlN0OGKVFssL/1q2Jfd//NYZxW/39eo?=
 =?us-ascii?Q?VnM3ALZV6cc/WbPx8nqAkHY+yEciFhWrGSZkJvQ4CA3raf6mp1vO0mbjFNc2?=
 =?us-ascii?Q?gA+RoaVPVNL9hD31b74plAN9sabFLz0kxJgr92JMhIfctM1JUwwV/rsVr1YJ?=
 =?us-ascii?Q?WyYkBrwU/rjQVyl7/3nJhBYnndsSmodanSKFrQR5QlE2feW9B0xtn/tIEhgf?=
 =?us-ascii?Q?7xrPCtgCPIPkhz0q1TdH15hpDchI7OD+onj9tzod5oRQSaq/a4d29OKbaOD0?=
 =?us-ascii?Q?BR6VTv6RgK/bSEA7LoVyQc8JEydw5cAIaFGUgYyd/kYTQeHY1iBd0+sv3ch6?=
 =?us-ascii?Q?G58XuGqRxemE6+93jJYFY7JTmOZDopQL52CfKvcrJYFePfxiD8aFF4rRL/+c?=
 =?us-ascii?Q?CbBAZdFalYBVk9CoWCt5L1eD1EkLypDuehTJsR+O/uvgirt35FwhLyArm5cF?=
 =?us-ascii?Q?KxGreAiKGrKg2shShy9bNnOtkjELfO+22P8VDP9FckAqGreOLNJre4H2VC5I?=
 =?us-ascii?Q?Jd2HlSMGK/AHYXE5N9v8V7BnTGd69XI10INtaDsNdYxPnDnVOt7+JXF2MDKV?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e67db986-5ecf-47a6-1270-08da91d90632
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:30:52.5628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9re5ed/FDLEyG6cfpne1bSwIyaf0v+tIVscbevAlsNkDsuE0YWbd2W3Qrbu9rzMgDmyk0FEF+Tq66KBy+sUWI0AHd4NVJL2P9zrMuUb9dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7026
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 11:03:41PM -0700, Radhakrishna Sripada wrote:
> From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> 
> In Display version 14, Transcoder Chicken Registers have updated address.
> This patch performs checks to use the right register when required.
> 
> v2: Omit display version check in i915_reg.h(Jani)
> 
> Bspec: 34387, 50054
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  |  5 +++-
>  drivers/gpu/drm/i915/display/intel_psr.c     |  6 +++--
>  drivers/gpu/drm/i915/i915_reg.h              | 25 +++++++++++++++-----
>  4 files changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index be7cff722196..a3d0d12084a9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -618,7 +618,10 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
>  	if (!IS_I830(dev_priv))
>  		val &= ~PIPECONF_ENABLE;
>  
> -	if (DISPLAY_VER(dev_priv) >= 12)
> +	if (DISPLAY_VER(dev_priv) >= 14)
> +		intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(cpu_transcoder),
> +			     FECSTALL_DIS_DPTSTREAM_DPTTG, 0);
> +	else if (DISPLAY_VER(dev_priv) >= 12)
>  		intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder),
>  			     FECSTALL_DIS_DPTSTREAM_DPTTG, 0);
>  
> @@ -1838,7 +1841,9 @@ static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> -	i915_reg_t reg = CHICKEN_TRANS(crtc_state->cpu_transcoder);
> +	enum transcoder transcoder = crtc_state->cpu_transcoder;
> +	i915_reg_t reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(transcoder) :
> +			 CHICKEN_TRANS(transcoder);
>  	u32 val;
>  
>  	val = intel_de_read(dev_priv, reg);
> @@ -4033,6 +4038,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
>  {
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>  	struct intel_display_power_domain_set power_domain_set = { };
> +	i915_reg_t reg;
>  	bool active;
>  	u32 tmp;
>  
> @@ -4124,7 +4130,9 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
>  	}
>  
>  	if (!transcoder_is_dsi(pipe_config->cpu_transcoder)) {
> -		tmp = intel_de_read(dev_priv, CHICKEN_TRANS(pipe_config->cpu_transcoder));
> +		reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(pipe_config->cpu_transcoder) :
> +			CHICKEN_TRANS(pipe_config->cpu_transcoder);
> +		tmp = intel_de_read(dev_priv, reg);
>  
>  		pipe_config->framestart_delay = REG_FIELD_GET(HSW_FRAME_START_DELAY_MASK, tmp) + 1;
>  	} else {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 13abe2b2170e..298004cae5a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -568,7 +568,10 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>  	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
>  				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
>  
> -	if (DISPLAY_VER(dev_priv) >= 12 && pipe_config->fec_enable)
> +	if (DISPLAY_VER(dev_priv) >= 14 && pipe_config->fec_enable)
> +		intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(trans), 0,
> +			     FECSTALL_DIS_DPTSTREAM_DPTTG);
> +	else if (DISPLAY_VER(dev_priv) >= 12 && pipe_config->fec_enable)
>  		intel_de_rmw(dev_priv, CHICKEN_TRANS(trans), 0,
>  			     FECSTALL_DIS_DPTSTREAM_DPTTG);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 079b7d3d0c53..da2d0661b630 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1139,7 +1139,8 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
>  
>  	if (intel_dp->psr.psr2_enabled) {
>  		if (DISPLAY_VER(dev_priv) == 9)
> -			intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder), 0,
> +			intel_de_rmw(dev_priv,
> +				     CHICKEN_TRANS(cpu_transcoder), 0,

This whitespace-only change on a non-MTL codepath doesn't look
necessary.

>  				     PSR2_VSC_ENABLE_PROG_HEADER |
>  				     PSR2_ADD_VERTICAL_LINE_COUNT);
>  
> @@ -1149,7 +1150,8 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
>  		 * cause issues if non-supported panels are used.
>  		 */
>  		if (IS_ALDERLAKE_P(dev_priv))
> -			intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder), 0,
> +			intel_de_rmw(dev_priv,
> +				     CHICKEN_TRANS(cpu_transcoder), 0,

Ditto.

>  				     ADLP_1_BASED_X_GRANULARITY);
>  
>  		/* Wa_16011168373:adl-p */
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index f9237586ab4f..8be7685e8a3e 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -5717,17 +5717,30 @@
>  #define  SKL_PLANE1_STRETCH_MAX_X1	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 3)
>  #define CHICKEN_PIPESL_1(pipe) _MMIO_PIPE(pipe, _CHICKEN_PIPESL_1_A, _CHICKEN_PIPESL_1_B)
>  
> +#define _MTL_CHICKEN_TRANS_A	0x604e0
> +#define _MTL_CHICKEN_TRANS_B	0x614e0
> +#define _MTL_CHICKEN_TRANS_C	0x624e0
> +#define _MTL_CHICKEN_TRANS_D	0x634e0
> +
>  #define _CHICKEN_TRANS_A	0x420c0
>  #define _CHICKEN_TRANS_B	0x420c4
>  #define _CHICKEN_TRANS_C	0x420c8
>  #define _CHICKEN_TRANS_EDP	0x420cc
>  #define _CHICKEN_TRANS_D	0x420d8
> -#define CHICKEN_TRANS(trans)	_MMIO(_PICK((trans), \
> -					    [TRANSCODER_EDP] = _CHICKEN_TRANS_EDP, \
> -					    [TRANSCODER_A] = _CHICKEN_TRANS_A, \
> -					    [TRANSCODER_B] = _CHICKEN_TRANS_B, \
> -					    [TRANSCODER_C] = _CHICKEN_TRANS_C, \
> -					    [TRANSCODER_D] = _CHICKEN_TRANS_D))
> +
> +#define  CHICKEN_TRANS(trans)		    _MMIO(_PICK((trans), \

Nitpick: there's an extra space between 'define' and the register name
that shouldn't be there (same with the MTL definition below).  It looks
like some of the subsequent register definitions in i915_reg.h are
misformatted, but we shouldn't copy that mistake here.

> +						[TRANSCODER_EDP] = _CHICKEN_TRANS_EDP, \
> +						[TRANSCODER_A] = _CHICKEN_TRANS_A, \
> +						[TRANSCODER_B] = _CHICKEN_TRANS_B, \
> +						[TRANSCODER_C] = _CHICKEN_TRANS_C, \
> +						[TRANSCODER_D] = _CHICKEN_TRANS_D))
> +
> +#define  MTL_CHICKEN_TRANS(trans)	    _MMIO(_PICK((trans), \
> +						[TRANSCODER_A] = _MTL_CHICKEN_TRANS_A, \
> +						[TRANSCODER_B] = _MTL_CHICKEN_TRANS_B, \
> +						[TRANSCODER_C] = _MTL_CHICKEN_TRANS_C, \
> +						[TRANSCODER_D] = _MTL_CHICKEN_TRANS_D))

The registers are equally-spaced and there's no edp transcoder anymore,
so this definition can be simplified down to just

  #define MTL_CHICKEN_TRANS     _MMIO_TRANS((trans), \
                                            _MTL_CHICKEN_TRANS_A, \
                                            _MTL_CHICKEN_TRANS_B)

and we can drop the definitions of _MTL_CHICKEN_TRANS_C and
_MTL_CHICKEN_TRANS_D.


Matt

> +
>  #define  HSW_FRAME_START_DELAY_MASK	REG_GENMASK(28, 27)
>  #define  HSW_FRAME_START_DELAY(x)	REG_FIELD_PREP(HSW_FRAME_START_DELAY_MASK, x)
>  #define  VSC_DATA_SEL_SOFTWARE_CONTROL	REG_BIT(25) /* GLK */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation

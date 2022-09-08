Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB95B2566
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A686B10EB98;
	Thu,  8 Sep 2022 18:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E0510EB99;
 Thu,  8 Sep 2022 18:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662660794; x=1694196794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lYlgFARFZnC8pC/p3m0si0knXGfnNprKkPeS9V1Ud+g=;
 b=aZKk0FZOgfJR54ulVoBKJNZIA1ZMxqgDFVkXYUeK6l7BUjIqP2yQqC96
 Wh1nwVYtpewp4pZCliZP02WOrs7zYKgcHZtRyko/DuNkoola89/sEjT7m
 4qLUEZQeYGt9sqGM8clOTI9DEifhyRToNQzxJ3knXACk7lFpEozotnWRz
 rkHyDCGqvCpjk+B1phsUNlvAK8XwAq02WaA4MYx68ecdej5ZaSOBmTrWn
 GtaVrOO6eF0FUQOlslDuBSCGRBWQyFfyRuinctY4cuAnxuZDyIArY+Bmr
 6QRr9w+nJEFsd4nzjJEW11Gn6l+xW+S8tVAT0nWNafe0eZnF0oNqS7YYQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280310009"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="280310009"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 11:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="704108990"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2022 11:13:13 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 11:13:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 11:13:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 11:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhCXttiT55hApAnlXcAjAzMuSFbvhVZSg4/2uZMf1Cj0sMRop2NxZLMfVwjoJO9JXXLS2K6CgeWUM5EmyEwbc+BCW37gkhRDgI0aD7byD6oyxAOe3Kh3dkN/lVnOQOMGcqVxpUJaRRW4ZN6rdFKEzGVYvfHjfA3AavIHta3ESYLePCHQjJmsNyUaFfh6IUwn+qcyzwwgtb5KS/QSxOcu4NnWMv4evxYruNf9FzrFEAkr/k4PK+ytySj2mXTxW4ztVKYrOFjewRWEfteVmzeaMW65zvgeSMpXpvR/87EcKWYda0OBUbFkuWO93xAm9eXd3y3z9fytIhog6GSjBSc2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGIqe2yQ0BbNmCzgOJpYL5/UNixUKdT/HcDCupiKJro=;
 b=VZ95AXY8IjuPZOCRzzCbtrGMWjx3gMGkCMpFYxd14xmq6/cYIygId1ZA4MkLs9ZB4gpGxiszQ+MUI/4UKLjc4658iqxr9lRaj2Jd4Hyiexo5s5OPx0RHmq/kOGMwVehWZmB55Bl+LyjUKTzoD2Be8gxzOx6xkiWC3puR9L0QXejooxnwQQh0ED63cB+4mP6R9uKIs+3Z2fBUOJHXGSkvZmDnlpGRFUHT54h23Lu9U2YBBUpbKoLtj+QpSp8YTje7U9CValTWS1dnvCLz7+NA2b8yoJK8UfhRv2rd7EX5rEKsh/WI6T1fucOjRPK1E8MFoy6VxdpY+QuDAKADyEUSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BN6PR11MB3874.namprd11.prod.outlook.com (2603:10b6:405:81::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Thu, 8 Sep
 2022 18:13:11 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 18:13:11 +0000
Date: Thu, 8 Sep 2022 11:13:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v4 07/11] drm/i915/mtl: Add DP AUX support on TypeC ports
Message-ID: <YxowtHYTvgWyulCg@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-8-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-8-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2a849b9-25c6-43bd-a54f-08da91c5c9ed
X-MS-TrafficTypeDiagnostic: BN6PR11MB3874:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9OcJVmO5EuQ/SNWBEUUWqweTnBMr+NBVMtm+HXeSQ5UFp1RVdL5/2MJrSkSRDsI1pMPPHUFHqRy/XPb5b+zmofa+LrJH0+6Dz1ktpZ9EuvsQLDoG/7tYekd41a7cJnL039bhrdfzxwG+YmqktrTlnVlqK6BYt+eZXzbJkP5tE3WxdovoPt6SMn1jqGZchBko1DBDJRNMWV170a7cHrrWk7d9gWUlvhDY7n/4sBEc6STth3L4j6kuG4D0PMurHAsoGRN4O40PauxxLZnDyh5ghTHWddss55x97rMLsKt1maJ2PHlVuB4dhHyvD85B6iJI3IQ0G6rOtFkbXVyOAhM6Mw6C64T7oNdd0rYZssF+J/JworUkEY++dleWBxVfHXpX17uItyeaRWr9jeAKkQd4iWNSq/8tb4ov/bN8CfVSNC0lpgnV/A7s5xw1HhHk1fjzHuY+unRAjuNudrheeyIKLxZIscqBPV458Jd7sSG34ZT/Lb/OEGOIOtuKccRTmMOyXLCowOmXqwICEEMoYNNZipfA58LgKTHQlZ3dXWI4L8z+y/njYZCbXXubjisJBqTUtZqJIm3E+u4BkxS3N+eeXmdp2c3prU+SGpLu922dXOvkS1Qmv2fsPmP9FMrqJDZY3F0XV3RDJBNK5JIwrKX9nVgUN0TPbNpqvKqVaPKwMxqxgMi8VreCMGMB0nfacgPdWuWUzskOFFvVSAu+HGiUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(396003)(346002)(39860400002)(376002)(6506007)(26005)(6512007)(6666004)(41300700001)(316002)(6636002)(478600001)(86362001)(6486002)(38100700002)(82960400001)(186003)(83380400001)(5660300002)(2906002)(8936002)(6862004)(66476007)(66946007)(8676002)(450100002)(4326008)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S1PMpCgjTImXyOrBOGqHRW/Af2f+MEvN4GzYwi2njMp7UEGDAe9BQshpmiUZ?=
 =?us-ascii?Q?MqNOrufnfv/MHvolqNTAtIzpjyx+hZLngIZHm1RjbVeTR1jTKRgbRAh7+V70?=
 =?us-ascii?Q?qWkDq4rOnSqXirlyWswEgj0F3rKL39nn/PhtSUJ4EgWGKkYVhkPhbEkV21rz?=
 =?us-ascii?Q?HUbHeN3opGM3k8vFk3u+HNLy8ecK+MEmXuQ4erCe24yOoC6mpBEcdOu8Zyh6?=
 =?us-ascii?Q?wm/GZKk2cMqYk6OMymvmIRZtkOoh5gG+n7DtrvJl4jLFdlX+ewYJkGywgGUL?=
 =?us-ascii?Q?WFuMeKVwyROi6Mw2iXHE0JCCihy1AQVhVBgzw3mgnlyyb/sW//a4GsGK1kt2?=
 =?us-ascii?Q?uaWd8HphfC+kDLdbvYrDDgoyUpTHdVEx73+KY6TeLTs7xgCTrRS/gbww1/U7?=
 =?us-ascii?Q?Dt1IMlWwTtKPBi2gMlLoUq9x2D780Jj9Nkusr6KnxdStBFwLUQ1dfhJG1Rdl?=
 =?us-ascii?Q?XmqoGszfTqsE0OfRSej8nWg2YzlmBlM508qhZdy6gTrgL9EkXagd0Xv+FsuZ?=
 =?us-ascii?Q?4I95GQymfHBdbtE4rV7bgGHDFdq40Qn/CCRjzdkclA3y0n3tBf8WYJn3DkHN?=
 =?us-ascii?Q?6ESM0cu3gOVGK48lWJfSZzHURv2xO0797bYNDx0dhZYo/GaJzo+WDDN31Xv7?=
 =?us-ascii?Q?1yBv2v2jD+B+I9jyoenIun0XSXl0ijb3ZL2P2Ww68tWY5vwuZFlun90+JhSZ?=
 =?us-ascii?Q?yBoKFoKCPSK4lMyyiA7GiLTEUAqpgprtdERpiws7Ml4I1hjaaGEP79C8folv?=
 =?us-ascii?Q?RfDAvq0Yq9lAl0WVyzyi1zqizM8peF+1vybNOHDr9Fm/kjVC/BAk/ieLtmzZ?=
 =?us-ascii?Q?xQUaaH5P1D+zMMope+sV2J6ZNc8C3cW1Jx5EZQYEJCQPHje5VciNGjcg6rCE?=
 =?us-ascii?Q?lOeLICS1G6Mp8+9XhBz0lHtP085YSzP1SdoZIH2V37daSnksFTkpbBTMoOIa?=
 =?us-ascii?Q?mUiBv/NSJdnEoP9F9mjxgqjkcdaqKHi8yFrjRnyxTEg8bwHd33pzcfoWKMk1?=
 =?us-ascii?Q?P5vzZRuLkR8O+3lWODTnrrZTDUhcL/Jqr+/DUoikw9xz/CW8KunhZw97WXNA?=
 =?us-ascii?Q?8oooO/INumsW1QM9t6X2rHt4F4uxafSQnoRMvZ1/5fzs5gdbR5LtzIJhbh0Q?=
 =?us-ascii?Q?AP+PCRq4A4LPPgPULoaqFFiDoAnllH72WOVFHYBnkyyfJTOu9KizOLbENkgc?=
 =?us-ascii?Q?pEvK7dSfqyo6pyAqTBIMNYtkUMoCTsPE+mv05zqWyP5WaIjeUzR6dWnya8XZ?=
 =?us-ascii?Q?kA17rvyEkQqNvcwpAclgVljdyCtofGwaWphsG16YXH8t9MtrzkX8mzPGlxa3?=
 =?us-ascii?Q?ldAVXp7gxsn/XuyNnr2S4sV8qqiGQX9K8DC8hWZyyd+7QCnBRZ8gf2QIv9JF?=
 =?us-ascii?Q?+OYyvz/LHOCpAWZVr1k1QSQV+zM2w1O2M0JOhHkcDAImfSYoe4+6u0ExjoSG?=
 =?us-ascii?Q?Bz3VzNVfjPMq2a6GY5Nc0Tcab2iwjv7zqhrfOJ4yNzkMpfOn3vukNuzbw5Vs?=
 =?us-ascii?Q?rmUGyuSkprlw6/OwJ/UD3KBM345RG4OBVPCBKAAnpRnI29zlK/rhQvvLglSq?=
 =?us-ascii?Q?eH6I7qP+wUOps0gokDJ7i7FXJxadysoMLfoWFiTuPt0OYjuvx4v6ghDsy59C?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a849b9-25c6-43bd-a54f-08da91c5c9ed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:13:10.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3C1p/8cMNqtCkB3JZdQjWIvnThjPijxBBSRwZAlP3YE+0bmbmOF+nbzd0citLzxF/A/Kpijp2ZSnBs57IbNxGVjNbfIpH64e42xTQaOJlr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3874
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

On Thu, Sep 01, 2022 at 11:03:38PM -0700, Radhakrishna Sripada wrote:
> From: Imre Deak <imre.deak@intel.com>
> 
> On MTL TypeC ports the AUX_CH_CTL and AUX_CH_DATA addresses have
> changed wrt. previous platforms, adjust the code accordingly.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

As noted on the previous patch, the _XELPDP_USBC1_AUX_CH_DATA*
definitions aren't used until this patch so they should probably move
into this one.  Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux.c | 45 ++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_reg.h             |  9 +++++
>  2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 98bd33645b43..48c375c65a41 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -637,6 +637,46 @@ static i915_reg_t tgl_aux_data_reg(struct intel_dp *intel_dp, int index)
>  	}
>  }
>  
> +static i915_reg_t xelpdp_aux_ctl_reg(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> +	enum aux_ch aux_ch = dig_port->aux_ch;
> +
> +	switch (aux_ch) {
> +	case AUX_CH_A:
> +	case AUX_CH_B:
> +	case AUX_CH_USBC1:
> +	case AUX_CH_USBC2:
> +	case AUX_CH_USBC3:
> +	case AUX_CH_USBC4:
> +		return XELPDP_DP_AUX_CH_CTL(aux_ch);
> +	default:
> +		MISSING_CASE(aux_ch);
> +		return XELPDP_DP_AUX_CH_CTL(AUX_CH_A);
> +	}
> +}
> +
> +static i915_reg_t xelpdp_aux_data_reg(struct intel_dp *intel_dp, int index)
> +{
> +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> +	enum aux_ch aux_ch = dig_port->aux_ch;
> +
> +	switch (aux_ch) {
> +	case AUX_CH_A:
> +	case AUX_CH_B:
> +	case AUX_CH_USBC1:
> +	case AUX_CH_USBC2:
> +	case AUX_CH_USBC3:
> +	case AUX_CH_USBC4:
> +		return XELPDP_DP_AUX_CH_DATA(aux_ch, index);
> +	default:
> +		MISSING_CASE(aux_ch);
> +		return XELPDP_DP_AUX_CH_DATA(AUX_CH_A, index);
> +	}
> +}
> +
>  void intel_dp_aux_fini(struct intel_dp *intel_dp)
>  {
>  	if (cpu_latency_qos_request_active(&intel_dp->pm_qos))
> @@ -652,7 +692,10 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
>  	struct intel_encoder *encoder = &dig_port->base;
>  	enum aux_ch aux_ch = dig_port->aux_ch;
>  
> -	if (DISPLAY_VER(dev_priv) >= 12) {
> +	if (DISPLAY_VER(dev_priv) >= 14) {
> +		intel_dp->aux_ch_ctl_reg = xelpdp_aux_ctl_reg;
> +		intel_dp->aux_ch_data_reg = xelpdp_aux_data_reg;
> +	} else if (DISPLAY_VER(dev_priv) >= 12) {
>  		intel_dp->aux_ch_ctl_reg = tgl_aux_ctl_reg;
>  		intel_dp->aux_ch_data_reg = tgl_aux_data_reg;
>  	} else if (DISPLAY_VER(dev_priv) >= 9) {
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 99b2cd2abca4..4ec6a3dd1f2b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3470,6 +3470,15 @@
>  						       _XELPDP_USBC3_AUX_CH_CTL, \
>  						       _XELPDP_USBC4_AUX_CH_CTL))
>  
> +#define XELPDP_DP_AUX_CH_DATA(aux_ch, i)	_MMIO(_PICK(aux_ch, \
> +						       _DPA_AUX_CH_DATA1, \
> +						       _DPB_AUX_CH_DATA1, \
> +						       0, /* port/aux_ch C is non-existent */ \
> +						       _XELPDP_USBC1_AUX_CH_DATA1, \
> +						       _XELPDP_USBC2_AUX_CH_DATA1, \
> +						       _XELPDP_USBC3_AUX_CH_DATA1, \
> +						       _XELPDP_USBC4_AUX_CH_DATA1) + (i) * 4)
> +
>  #define   DP_AUX_CH_CTL_SEND_BUSY	    (1 << 31)
>  #define   DP_AUX_CH_CTL_DONE		    (1 << 30)
>  #define   DP_AUX_CH_CTL_INTERRUPT	    (1 << 29)
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation

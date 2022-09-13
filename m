Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4C5B7C3B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD2910E060;
	Tue, 13 Sep 2022 20:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF4110E060;
 Tue, 13 Sep 2022 20:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663101255; x=1694637255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o7gR5mMiR+oAjQP8Yuf3AJn7/7YGTzBlmFm4ikORXxM=;
 b=HjG3I0g4K2ZM1pYZ+BUk4h83NUc1gs5i6WxsfwpGP5cAMqxWNBuGER4p
 DTF63C0FL95tN8PK+NRymxSGMZ6boyGbkythOmIEepdOmhxE1N72g2Zlp
 BE4vIW35uJQTeiqLXUFPrn3+34/BE7hIzoY/mkWMnhZRUeeL5202u8JOn
 4YQqNdTLDCF8FiUA4dqDuMXStxIQzkNN9DVILOiO9QJ2TjvH3IDOFgvgD
 0JLK30wJ0ChBVXktcToFgBK1fNqWZnPTecQ/8ai4E7/jcBwmRJEC2dZ3r
 LM2mc0POnb7Fz6gZg3MqbYtN+InJ8AD26+j0evV/+E2KF+LvzL8dZjya1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="298252955"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="298252955"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 13:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="619052271"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 13 Sep 2022 13:34:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 13:34:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 13:34:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 13:34:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 13:34:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d15l6Cq9Ebq28UWMHnluikbZqrv/QfMVJ9D/YopU5jR8nT6FgffC5dzmXr5TSRLeqHX1S8bX6uPDCxVTpng4ZV+Mp/U5b4qEk261C+g+LeJJor1C+7MYg4Y1qCe4Zj8cuftz33tZWTY79QUpT8fqYI1nf3dEr7pupefpKH4GDKA0CGQNKRasebgxxNpm7G6SNvnxIkgOnS25XQBA6n7vgS/ClBYlRsSeeWdQn7AvOVoK4y0+c1LoXBPGYP4shRy42rxFBpJXEHi8IC0qyJ5yoM5yN4f+3qoLI2D1NDj/ht8LTZ4dtPddtsc8G9FxAmAkQTLhgzsOY+QSXvbOzHeIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIg31A0CVU4wImMFhLc34OnCzot4gZF4GN0bcSa4BYw=;
 b=bDYA+wLGHri8mwkDHKpy8TlxdBA/zI+KUSomD9CFgua4wrtqSjo3DFCGbLj6deiyB0GrVtNTSaXe3ZlXjsxMolNMFlDqXkTZmEtllGx2p/mqshRWnRfsn6KUrjciPr3RVPObRUGFxBpc5gcX1xNkLezlFPJ4x+d0HkXFddGZi0twIbTl89Vc2ITv8ecXQiCE/6Hb0futWpsqh2fcsSalxFYvSuKoD/tpTl5mQ1eer+6klJ/uCBzbF24jlXYzhbLF5TgqRMiSLiNodScDlOx8hnOmWPosa2hC2zptRRVclgVCZzcyfhaU/9bnnVCmCnJlBwEUwr6sfZPITRE9k6v8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB5518.namprd11.prod.outlook.com (2603:10b6:5:39a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 20:34:05 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5612.022; Tue, 13 Sep
 2022 20:34:04 +0000
Date: Tue, 13 Sep 2022 13:34:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/5] drm/i915/mtl: Update CHICKEN_TRANS*
 register addresses
Message-ID: <YyDpOrc3WZTPyfOF@mdroper-desk1.amr.corp.intel.com>
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
 <20220913183341.908028-6-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220913183341.908028-6-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB5518:EE_
X-MS-Office365-Filtering-Correlation-Id: c47caa3b-d5a9-4eb9-e007-08da95c74ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwylE0N/FQoh7xpMOzt5tCoOotDguh9t0dgWsUa4ynMy5eKv/ZpPq87ptTVANV536bEfFo3PcNrRpFQL69f5voM+jN5kh1nhxk1BJUC3RSwmkM+F0eammMHT5ywBh+kdxDFrg6k4X9a2/cvEBjgyy6049pAWRT0GdmEzCPFN02nIieq+MNSDrdVMwCBvA3uqpzfCAAoyp2V2Vp7Wqjt5sdTzbwSMoFxFeVtOV5T+//KoG9+ATP1C8gObNxRKulpRlPf+M7z5yVm3ijYcvW9JeNLb6q3JpbI9aoEr75sAjazENnx665aLnAcsBtp8KAWSVVS/9sUvy1ylRWXA+uJc39ajq3761uIduT24fozsnItiCTt8KQshNYA8o7F/bi0NPXsCLVN3dwweVlUqTnr0ctipyReSzTtwDUkuGfPNL6ZVWCWnMPxI1Xayf1dCF9uTpLAGVumWCECqnwVsZbnPtzjtbWwnJIZLJg/VXXBKQYcHqMG8nbxtyzESxZpNthT81vVUu4bsq1AytNDeTcLSV1mSpIqHXwQQuz/+vlEjolR9nExovKu8GVASHiRGyjkiCG+MtByQl79brnBGFCviqLBcTI1wNzqvSYc2WTj+W2Hsktar7uMIsKtJLawAc44OwQ0a1xYojTynWhRaFfLbY0OUEzMPAghh/fbjRAqXSjt9VvW3BvLU6BxM9T0NalS3wD+MCYUc15JWxD9I4TSjaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(450100002)(41300700001)(82960400001)(478600001)(6636002)(6862004)(6512007)(38100700002)(15650500001)(66946007)(6506007)(26005)(316002)(6486002)(83380400001)(66556008)(186003)(8676002)(4326008)(2906002)(5660300002)(8936002)(86362001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D0nsGHEY5tuVpBlW9/7WiW8HYS0dzd1+e1diqEAgykbFAzJKez1mwb/kiuUa?=
 =?us-ascii?Q?AJL95sjvhgPaGRoQD+1kDmYxqzEEsF6rZtwYk4tAZ4cOPdR5LiKeEb0VnFsw?=
 =?us-ascii?Q?xb8kHiq3U/RpJUATfDs6fl1U6HoFvSoLUxb21qWCgjf4UhXb0blkUoRC3RdU?=
 =?us-ascii?Q?CjseHmwKXlZboGS7GTXmgvclY8p8A30Ic70SbX5JmaLKr8os6Hwk/S6wv1+G?=
 =?us-ascii?Q?b5RxFEjeI4zQJ4I4eTGBLU6sCoynlUwAP/xjR2Nhs6uM87OQqfBKAYekBgUz?=
 =?us-ascii?Q?+rn6xZHwjEJwYCepEJt5Xjze0C4R69meVZ+VfTzuM5HWhgjKRx+IIHK7t7Hl?=
 =?us-ascii?Q?KOHLIpwEI0tb7QIQysH/lvyOMMIXmH1rOJF856HuZkMdf16mOBllGo35U3Cy?=
 =?us-ascii?Q?i3hV/qW5saGsH32uUTywfFiKMspZN3vzbaXl0zcr2ziLN056YpR+6gwUGIk9?=
 =?us-ascii?Q?53ZeNyFG27/Tyq1rfAq5G7w7uC1NU0S14wDj7cy3osGzWPKoYVuWK3k1vmlf?=
 =?us-ascii?Q?b7OPp3ETQJX6fuilQEbWqPFLjZlfS/0601vq4OAg2I0yKkGUw71smBa9fTk+?=
 =?us-ascii?Q?3hDGjXykTWTKWJJGHe6si/KkV3pd7wHDDt2o06QN/LqURadKC5NViyUngZQh?=
 =?us-ascii?Q?yCx/wwvSDQw6axsSP+vjwzTnWOKfDq6sfyvRAMYMrZCaMtGLOlVZuFt7O1fm?=
 =?us-ascii?Q?TAiLCBgySXGiKwI3gS8FCkd8VWVXPIyiOcnxJat/ALMKUpVoAEbg8Hi4OxbC?=
 =?us-ascii?Q?HFg4JIIfu0JnfVw41TeGy06+vPo0MUd825Ggmcysc0RCXQY+S9dOcDmb7No2?=
 =?us-ascii?Q?9zrJ35GYbfq9mAErgMvSTCJ/Sn/dTR2e889J4GqHVEB6cwHAUrM/U6cWSjsN?=
 =?us-ascii?Q?zRW4M+kF8cMBIgcjsqMPnPx9Kiqii94HnNbO5Q0WHmjocEO89T2NqsrZqN1o?=
 =?us-ascii?Q?DHonqHWTXdNcSmPwMFDV/ijnGmgHfgcSTOOF4JIlfBCFxEZ4fj5IMeKMQ81T?=
 =?us-ascii?Q?74moWDUOH0+aJ+3ZyUW2YWtotmcft0g9vrKyQ+G2eo1I2aSbVdVfX7PvRIqb?=
 =?us-ascii?Q?81Lxvub4sz+uJJz15twkx2qOUt87fWhc0bRlwBePqvfS5BQsPEFyGkSxSc/P?=
 =?us-ascii?Q?A3z4YVPM0r1JnpapD04XCJ1IU9bWsRnLtAW2b/QENuJIkpHedCZIlwQsMqbe?=
 =?us-ascii?Q?c5LE9gkwUrVsWvbgl/glHoTAmE68Zvjg0BoBBauFOt88hJfIlwsXFHvD5lOm?=
 =?us-ascii?Q?Fn9f0MrbMxKn0XtgoLb7R1eC0PMpE3ZPNa1SQm+vZ/l888FYb3By4xX/4RNm?=
 =?us-ascii?Q?w42vww+owv3W6UmCq+v6FxphZEdaUGNLRXmhzxIowf2AzJz8ERlTuXfL0or0?=
 =?us-ascii?Q?Ft01S+5YSIGFqkVp0WWhCVc/431g838HMoW3IKY3sLn8o6yJmkb7kHK3y93J?=
 =?us-ascii?Q?Poj80n3Ck/Q3MJ49K8Yiz98hpz5Ghlud3Q4kHFshSO8yhn82Xsj8DfkNxnb4?=
 =?us-ascii?Q?welHn8TMOeaDxmBsFyl3d6avvDC5jmp+TT//Qa6hLUC8fdSxxw8+PFtCy57f?=
 =?us-ascii?Q?987BBUuB1uG5IrNaZXHI4MuTXfhkKeC3L11sZgGZX7EQHUWt+/dBYSiPxZZN?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c47caa3b-d5a9-4eb9-e007-08da95c74ccd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 20:34:04.7812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4Uplt2DrE0bYsJlGMJCPUcKQpDpU6FT/XqhcdAP1BSqdInPch29Rwn4CLNh9Bhmwtx680zn8NydGcyCvj5LqkDoAqASfxjtISYlFrklYdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5518
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

On Tue, Sep 13, 2022 at 11:33:41AM -0700, Radhakrishna Sripada wrote:
> From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> 
> In Display version 14, Transcoder Chicken Registers have updated address.
> This patch performs checks to use the right register when required.
> 
> v2: Omit display version check in i915_reg.h(Jani)
> v3:
>  - Remove extra whitespace introduced
>  - Fix reg definitions for MTL_CHICKEN_TRANS(MattR)
> 
> Bspec: 34387, 50054
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  |  5 ++++-
>  drivers/gpu/drm/i915/i915_reg.h              |  7 +++++++
>  3 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index a0829dcfd6d3..e94a7e1d6fe6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -620,7 +620,10 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
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
> @@ -1840,7 +1843,9 @@ static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
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
> @@ -4037,6 +4042,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
>  {
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>  	struct intel_display_power_domain_set power_domain_set = { };
> +	i915_reg_t reg;
>  	bool active;
>  	u32 tmp;
>  
> @@ -4128,7 +4134,9 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
>  	}
>  
>  	if (!transcoder_is_dsi(pipe_config->cpu_transcoder)) {
> -		tmp = intel_de_read(dev_priv, CHICKEN_TRANS(pipe_config->cpu_transcoder));
> +		reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(pipe_config->cpu_transcoder) :
> +			CHICKEN_TRANS(pipe_config->cpu_transcoder);
> +		tmp = intel_de_read(dev_priv, reg);

Bikeshed:  I'm not sure if it's really worth adding a new local 'reg'
variable for this vs just writing

    tmp = intel_de_read(dev_priv, DISPLAY_VER(dev_priv) >= 14 ?                                    
                                  MTL_CHICKEN_TRANS(pipe_config->cpu_transcoder) :                           
                                  CHICKEN_TRANS(pipe_config->cpu_transcoder));                               

But up to you.  Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  		pipe_config->framestart_delay = REG_FIELD_GET(HSW_FRAME_START_DELAY_MASK, tmp) + 1;
>  	} else {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 5adfd226d6c4..03604a37931c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -565,7 +565,10 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
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
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index fc57f304c16e..acfcd155c8d0 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -5728,6 +5728,13 @@
>  					    [TRANSCODER_B] = _CHICKEN_TRANS_B, \
>  					    [TRANSCODER_C] = _CHICKEN_TRANS_C, \
>  					    [TRANSCODER_D] = _CHICKEN_TRANS_D))
> +
> +#define _MTL_CHICKEN_TRANS_A	0x604e0
> +#define _MTL_CHICKEN_TRANS_B	0x614e0
> +#define MTL_CHICKEN_TRANS(trans)	_MMIO_TRANS((trans), \
> +						    _MTL_CHICKEN_TRANS_A, \
> +						    _MTL_CHICKEN_TRANS_B)
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

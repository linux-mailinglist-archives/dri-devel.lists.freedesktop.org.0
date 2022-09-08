Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68295B2550
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8B010E98D;
	Thu,  8 Sep 2022 18:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7C010E98D;
 Thu,  8 Sep 2022 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662660442; x=1694196442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fe9rRO2LqBQlqmy90QqdQla7fiJn8+tLQcl9hhNr+eo=;
 b=OkPU10M7ngb6LDoU9ms6is5iwVJ8MEjokTxc8T3wPseYlKyz7QvQl/pS
 2bOaQcl6RphqCv1QZOe9NiU7ILYznPzy2XF2MdZe4ojft00RL6JwVyTtZ
 82bvduoxdvpMABFzaNE01oKewL7EgLRJS3qY3/SmUCOFRbxxtcYObdTkC
 YLda6C61TJCH8/rqwwhgzaW3J78p1VDayFWGzDpegGmJup6q4Overp/T1
 gXe01bCldYHrf9gj6Nlz+G6dzPhojoWqCkea4I/tUnGMe9dQL+0T2Gr29
 BPtn2hzB+r1IzCdaUyN5QRzYY2mcuL6k5GGHGgmindxhoI2FXoTdDSVZW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323481284"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="323481284"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 11:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740769239"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 11:07:20 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 11:07:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 11:07:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 11:07:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 11:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIjH+9GWkzRuygl9GyasyNtgyv6WEU9SdbRUkIzRbmFk4E5jr5eDdvGh1cIYIas46nzXgrDb+8zGV6uM5L+wiou3rP56U8WhDf7oK1UrxRiJPcNWvCc2LN9xc8Qe5hXb+Cm/2GWUKuBfY8kiQuUFiF/qpFcdeuqYTk4SIQhEl8lTQamy87MRTU2Q6C8FyH/mrUqGdoYPOvKsI6i5D+pp0GZ/GPQLHIiS+oGbWUpNrEU1UcA0PJ3/WoC6J9lxfx/u/D/fle5g1ShFBwEMmDp2dFY39S9OiBD2d44zFp+GdIW8k3vTVjPQO3+memqAtsJnihJyJda5W4AebZWEMWSGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy7QnhAwb58YpEOeBbrXBzQl6ezR4Ee4giLXol/cZkY=;
 b=lOYHqmuSbW9G3NPvHoZ0CHwTaEQMewqs+d9xsgqR8ITDVmNnFbhzl/Cs/cQqLISztdru3h5nORSG2gWiz6/Z3b88XHBnol3nG+5w8hgmHK2bJIuJheKoWWPERVx0WM26zHpx08HPzvD5nqPvgJ6dxoa7oWJIV+nHWaQIlIEBm4Btiw9UUchbCuKs55jThMnJaFp+2LejGMed028rwqAqm8vE7oxQdGm+TD5N2h0FQLK9nA0qrZwzBYZkFp01CRlCWhiuhddv1giPfrnK73eGAomP+AuS2CRXPr7AatM03rF2h/SEYJ9WvfNQlYfZSIIN67RVr86G3oCYZAoM0jnc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 18:07:16 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 18:07:16 +0000
Date: Thu, 8 Sep 2022 11:07:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v4 06/11] drm/i915/mtl: Add display power wells
Message-ID: <YxovUR2g07QO6Wss@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-7-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-7-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89aa258f-c4fd-4e9d-4069-08da91c4f6a3
X-MS-TrafficTypeDiagnostic: SA2PR11MB4905:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gteHJ2gaxEZ4u6/1MM5HR0c9soSqHkTx4JObsSGQYziebtiNotbgk3RlU1GKdVGHhNE0DZ961NwyOsEy8Cl5jcWBgE+5tZuu2zGw+13wcatsQ/LM+GwVtamFpWqA0teVBAlb0JWnNkLjtgJm5i6/wsKUNrCesPP93JMBiZ0KLSfVuWBmPeKTsgwRTN9A5wPZAW7Fcg8nsU7f1DVMFhJB1PTveiQAKY/eKW7wyi2a6dCxKqX8ygPcZx5Pm3vro63G7Wz3Bz3JQughku3//3qNUabov5OOKuRWEVz9jaIxMXFhRcAk3V2i7aOoRa5tKokI+dcq1Y39DLAOBfMmp3Y0vKE0rmexxzQkDfkIZWWRBahQsSCgtGf+8IJ6i6NV5Y+jHcxEO9WNg22VmpenT79lun1lZ9a8jLrOy/Mqs3adTsgzJkidpe+/ndXRpP0h9zZEkak8V6pZiOZpUaGnORyIXWLUjebGCfYAn4J1ivhDE5GqnuBZk2v/Sn8HjJpa9rkHIOLdqfbnUsumb5Ggzivu7TVuQBdh78VN89mNgNC4sCmMn5nNjlJ8YteHs6u9d8YcjhDsm3W+7DxL0oUdvQBi5SQ8cq4k1CJEkkAJWWebNvyYo+LwJKrzQiYnyd/9bLRpgrn0HocMW/qqdNeHwad6LvQqmTI+sG9sjY9dSfg4bJz/7bUAW9YTJwdLG50qfVy3GZJA8ocg66YHVKC+Y4ftYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(376002)(136003)(366004)(346002)(6666004)(83380400001)(186003)(478600001)(86362001)(6486002)(6512007)(41300700001)(82960400001)(6506007)(8936002)(26005)(38100700002)(316002)(6636002)(4326008)(2906002)(6862004)(66946007)(66476007)(450100002)(8676002)(5660300002)(66556008)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gxNzedKKI87mIXkyMQ/VDGqFBbwl8Z9wgYEnHfrv52i+HQrvjMiy1xanDCeZ?=
 =?us-ascii?Q?frx6Nw6Cf10mKPO3v/ed8tQUXU3Itufj1A9ssc1dE63APU8Z5JOonvU3b+Rz?=
 =?us-ascii?Q?8XjUlnMw8QgM+3OGbpIqFEJw/tdPf08SvmkMdicwsMcnrFDtfDaz6SfHgFfe?=
 =?us-ascii?Q?Jkjb1As1/2W3l9TMsT588uA7lWrJX4uZ0+ouChyreGNKPAIdK21IuLNFK54S?=
 =?us-ascii?Q?OZYDGslnIiPt0KSDyec7VAN/enFcyVARJXp5JOejt81bcxrqZD6jUDNRHo4Q?=
 =?us-ascii?Q?6ne2ElckazFs19E28p3t6hvl6ffyohj8MsjoZ2LHrWxGbKuKgEKEok31FnM/?=
 =?us-ascii?Q?jbPlnsMhEwn3ZwFj+8SRz3g4niSSbQlwgps3i/LQOE7/rj8/rYQ4q6g8Cs2S?=
 =?us-ascii?Q?luIcipDb22NYOxwOx4WblWJmQUW0wT0VgwBhvZEhtsDOF//irjTHDVzfrVYl?=
 =?us-ascii?Q?AKOXUfSfcZ1buajEKB9XyFhdI8XC+RKXprhBdbjrrYEJQFS2Iejh3+uUwxH8?=
 =?us-ascii?Q?FAfVeKRzPgJLW7HFkLkSLRvg9ADHLLGKhpxjr1xdqkI6Fart2MZgVi1Xf8Vi?=
 =?us-ascii?Q?Cn6CHOrm5cmzNW8KHKgPNLE6I4b7M6Hs2rLGeX1ZMXhxYTwA6AcLDRC8qcX1?=
 =?us-ascii?Q?NStuV+kE0FF868pBFm3PZViVPSig1samRKRUEKDKLXP4j2OtlQ6+Zm3il002?=
 =?us-ascii?Q?QoVYzKSa2EnsT9/ChSWfd6OT9Z8PeIUnDAPtuRXVUdUPZahDpDclV5++SMIP?=
 =?us-ascii?Q?NU+mqm7ZFPzOhIyFVcV8CF05YAHYGLI0Iyv+o3V3DNckPae4lJsbh4btCFl9?=
 =?us-ascii?Q?69McFqMmth8VBdEIjDAbBn4wSp2+T0MboUAYEOIUZnOI62+QxsnjWiw2utba?=
 =?us-ascii?Q?LlbW+acIhteGyYA3K7qMFFGlMXozHvIkH5+had6ahoMs9LOCQrynqcxMRbEr?=
 =?us-ascii?Q?2jc8FgmTYoJvVobOx+Q9HcgN1tufL/itlbwUZbRflqAw4jR7j5fAWlCPnGqB?=
 =?us-ascii?Q?6LXSpRHOSsLP5REoBwQ3+Ji9U7EtXde7pJ5bsQeEqbJKe6wysVmPRaD+e42z?=
 =?us-ascii?Q?JsxBgfeDbgH985o8QB3ESs+OlQHWneG2KmYfmtQX1Vv8bMccVeYhhC863Qpl?=
 =?us-ascii?Q?iZ6uX5ZTSf543jPz/opSdaWtLdVDyO4exg8k1lHobNARxZW6zgUkVC9EZzKe?=
 =?us-ascii?Q?DcaFTQ2F4efY+JJ83eGqwXoebY83LHyqyI8e7T7qOIQ3UmBnuANLEgr+/5My?=
 =?us-ascii?Q?VCVnXWVXtUt+ptOD+L0CVitXAnWs/8Dew4gL+QDD1U1DMZFtQAxYNTPr+JVh?=
 =?us-ascii?Q?ozWVznznHSMcDWYSvNJ1/Ot/vfXYV6xckyboLi5rrm2YFcRWYonGFKYiBvM4?=
 =?us-ascii?Q?+a/C5evXxlJPoA53CmyA+7wvCBpvvtRE/W0J+3UC9oMIi9IkjDdBAkky9H0h?=
 =?us-ascii?Q?BbOWfd9/22D/4JklOTxTUvz3HYX4ab4EPqkeQHRSSa1YeRhUrpGHX5ISHKpL?=
 =?us-ascii?Q?mD7drc3jZUoqm/X7qc4fFpFYpQ86+oNeHcg+kMSibJ6BOKKTGrlub401+Mvc?=
 =?us-ascii?Q?zjUPoGYrhh5NCdaDsVthJHgJ3J+0um1Y9+Fz/5YmkJnix6qe5csU8Hwn5U8i?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aa258f-c4fd-4e9d-4069-08da91c4f6a3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:07:16.5732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OW7lL0X1SOnJmH4wDA0yTsODPVf8zfHU/gI/BupbfO08WhOSRUswgVPOX/aNFqFwBKvjPiRz5hXfBTKsgv7uUCWN2h0aAGtsFjn76uPOWbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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

On Thu, Sep 01, 2022 at 11:03:37PM -0700, Radhakrishna Sripada wrote:
> From: Imre Deak <imre.deak@intel.com>
> 
> Add support for display power wells on MTL. The differences from XE_LPD:
> - The AUX HW block is moved to the PICA block, where the registers are on
>   an always-on power well and the functionality needs to be powered on/off
>   via the AUX_CH_CTL register: [1], [2]
> - The DDI IO power on/off programming sequence is moved to the PHY PLL
>   enable/disable sequence. [3], [4], [5]
> 
> Bspec: [1] 49233, [2] 65247, [3] 64568, [4] 65451, [5] 65450
> 
> v2:
>  - Update the comment in aux power well enable
>  - Reuse the noop sync fn for aux sync.
>  - Use REG_BIT for new register bit definitions
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  .../i915/display/intel_display_power_map.c    | 115 +++++++++++++++++-
>  .../i915/display/intel_display_power_well.c   |  44 +++++++
>  .../i915/display/intel_display_power_well.h   |   4 +
>  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   8 ++
>  drivers/gpu/drm/i915/i915_reg.h               |  21 ++++
>  5 files changed, 191 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> index 5ddd1b93751c..dc04afc6cc8f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> @@ -1350,6 +1350,117 @@ static const struct i915_power_well_desc_list xelpd_power_wells[] = {
>  	I915_PW_DESCRIPTORS(xelpd_power_wells_main),
>  };
>  
> +/*
> + * MTL is based on XELPD power domains with the exception of power gating for:
> + * - DDI_IO (moved to PLL logic)
> + * - AUX and AUX_IO functionality and register access for USBC1-4 (PICA always-on)
> + */
> +#define XELPDP_PW_2_POWER_DOMAINS \
> +	XELPD_PW_B_POWER_DOMAINS, \
> +	XELPD_PW_C_POWER_DOMAINS, \
> +	XELPD_PW_D_POWER_DOMAINS, \
> +	POWER_DOMAIN_AUDIO_PLAYBACK, \
> +	POWER_DOMAIN_VGA, \
> +	POWER_DOMAIN_PORT_DDI_LANES_TC1, \
> +	POWER_DOMAIN_PORT_DDI_LANES_TC2, \
> +	POWER_DOMAIN_PORT_DDI_LANES_TC3, \
> +	POWER_DOMAIN_PORT_DDI_LANES_TC4
> +
> +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_pw_2,
> +	XELPDP_PW_2_POWER_DOMAINS,
> +	POWER_DOMAIN_INIT);
> +
> +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_dc_off,
> +	XELPDP_PW_2_POWER_DOMAINS,
> +	POWER_DOMAIN_AUDIO_MMIO,
> +	POWER_DOMAIN_MODESET,
> +	POWER_DOMAIN_AUX_A,
> +	POWER_DOMAIN_AUX_B,
> +	POWER_DOMAIN_INIT);
> +
> +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc1,
> +	POWER_DOMAIN_AUX_USBC1,
> +	POWER_DOMAIN_AUX_TBT1);
> +
> +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc2,
> +	POWER_DOMAIN_AUX_USBC2,
> +	POWER_DOMAIN_AUX_TBT2);
> +
> +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc3,
> +	POWER_DOMAIN_AUX_USBC3,
> +	POWER_DOMAIN_AUX_TBT3);
> +
> +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc4,
> +	POWER_DOMAIN_AUX_USBC4,
> +	POWER_DOMAIN_AUX_TBT4);
> +
> +static const struct i915_power_well_desc xelpdp_power_wells_main[] = {
> +	{
> +		.instances = &I915_PW_INSTANCES(
> +			I915_PW("DC_off", &xelpdp_pwdoms_dc_off,
> +				.id = SKL_DISP_DC_OFF),
> +		),
> +		.ops = &gen9_dc_off_power_well_ops,
> +	}, {
> +		.instances = &I915_PW_INSTANCES(
> +			I915_PW("PW_2", &xelpdp_pwdoms_pw_2,
> +				.hsw.idx = ICL_PW_CTL_IDX_PW_2,
> +				.id = SKL_DISP_PW_2),
> +		),
> +		.ops = &hsw_power_well_ops,
> +		.has_vga = true,
> +		.has_fuses = true,
> +	}, {
> +		.instances = &I915_PW_INSTANCES(
> +			I915_PW("PW_A", &xelpd_pwdoms_pw_a,
> +				.hsw.idx = XELPD_PW_CTL_IDX_PW_A),
> +		),
> +		.ops = &hsw_power_well_ops,
> +		.irq_pipe_mask = BIT(PIPE_A),
> +		.has_fuses = true,
> +	}, {
> +		.instances = &I915_PW_INSTANCES(
> +			I915_PW("PW_B", &xelpd_pwdoms_pw_b,
> +				.hsw.idx = XELPD_PW_CTL_IDX_PW_B),
> +		),
> +		.ops = &hsw_power_well_ops,
> +		.irq_pipe_mask = BIT(PIPE_B),
> +		.has_fuses = true,
> +	}, {
> +		.instances = &I915_PW_INSTANCES(
> +			I915_PW("PW_C", &xelpd_pwdoms_pw_c,
> +				.hsw.idx = XELPD_PW_CTL_IDX_PW_C),
> +		),
> +		.ops = &hsw_power_well_ops,
> +		.irq_pipe_mask = BIT(PIPE_C),
> +		.has_fuses = true,
> +	}, {
> +		.instances = &I915_PW_INSTANCES(
> +			I915_PW("PW_D", &xelpd_pwdoms_pw_d,
> +				.hsw.idx = XELPD_PW_CTL_IDX_PW_D),
> +		),
> +		.ops = &hsw_power_well_ops,
> +		.irq_pipe_mask = BIT(PIPE_D),
> +		.has_fuses = true,
> +	}, {
> +		.instances = &I915_PW_INSTANCES(
> +			I915_PW("AUX_A", &icl_pwdoms_aux_a, .xelpdp.aux_ch = AUX_CH_A),
> +			I915_PW("AUX_B", &icl_pwdoms_aux_b, .xelpdp.aux_ch = AUX_CH_B),
> +			I915_PW("AUX_TC1", &xelpdp_pwdoms_aux_tc1, .xelpdp.aux_ch = AUX_CH_USBC1),
> +			I915_PW("AUX_TC2", &xelpdp_pwdoms_aux_tc2, .xelpdp.aux_ch = AUX_CH_USBC2),
> +			I915_PW("AUX_TC3", &xelpdp_pwdoms_aux_tc3, .xelpdp.aux_ch = AUX_CH_USBC3),
> +			I915_PW("AUX_TC4", &xelpdp_pwdoms_aux_tc4, .xelpdp.aux_ch = AUX_CH_USBC4),
> +		),
> +		.ops = &xelpdp_aux_power_well_ops,
> +	},
> +};
> +
> +static const struct i915_power_well_desc_list xelpdp_power_wells[] = {
> +	I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
> +	I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
> +	I915_PW_DESCRIPTORS(xelpdp_power_wells_main),
> +};
> +
>  static void init_power_well_domains(const struct i915_power_well_instance *inst,
>  				    struct i915_power_well *power_well)
>  {
> @@ -1457,7 +1568,9 @@ int intel_display_power_map_init(struct i915_power_domains *power_domains)
>  		return 0;
>  	}
>  
> -	if (DISPLAY_VER(i915) >= 13)
> +	if (DISPLAY_VER(i915) >= 14)
> +		return set_power_wells(power_domains, xelpdp_power_wells);
> +	else if (DISPLAY_VER(i915) >= 13)
>  		return set_power_wells(power_domains, xelpd_power_wells);
>  	else if (IS_DG1(i915))
>  		return set_power_wells(power_domains, dg1_power_wells);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> index 29cc05c04c65..9bf98a37204b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -1798,6 +1798,43 @@ tgl_tc_cold_off_power_well_is_enabled(struct drm_i915_private *dev_priv,
>  	return intel_power_well_refcount(power_well);
>  }
>  
> +static void xelpdp_aux_power_well_enable(struct drm_i915_private *dev_priv,
> +					 struct i915_power_well *power_well)
> +{
> +	enum aux_ch aux_ch = i915_power_well_instance(power_well)->xelpdp.aux_ch;
> +
> +	intel_de_rmw(dev_priv, XELPDP_DP_AUX_CH_CTL(aux_ch),
> +		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST,
> +		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST);
> +
> +	/*
> +	 * The power status flag cannot be used to determine whether aux
> +	 * power wells have finished powering up.  Instead we're
> +	 * expected to just wait a fixed 600us after raising the request
> +	 * bit.
> +	 */
> +	usleep_range(600, 1200);
> +}
> +
> +static void xelpdp_aux_power_well_disable(struct drm_i915_private *dev_priv,
> +					  struct i915_power_well *power_well)
> +{
> +	enum aux_ch aux_ch = i915_power_well_instance(power_well)->xelpdp.aux_ch;
> +
> +	intel_de_rmw(dev_priv, XELPDP_DP_AUX_CH_CTL(aux_ch),
> +		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST,
> +		     0);
> +	usleep_range(10, 30);
> +}
> +
> +static bool xelpdp_aux_power_well_enabled(struct drm_i915_private *dev_priv,
> +					  struct i915_power_well *power_well)
> +{
> +	enum aux_ch aux_ch = i915_power_well_instance(power_well)->xelpdp.aux_ch;
> +
> +	return intel_de_read(dev_priv, XELPDP_DP_AUX_CH_CTL(aux_ch)) &
> +		XELPDP_DP_AUX_CH_CTL_POWER_STATUS;
> +}
>  
>  const struct i915_power_well_ops i9xx_always_on_power_well_ops = {
>  	.sync_hw = i9xx_power_well_sync_hw_noop,
> @@ -1911,3 +1948,10 @@ const struct i915_power_well_ops tgl_tc_cold_off_ops = {
>  	.disable = tgl_tc_cold_off_power_well_disable,
>  	.is_enabled = tgl_tc_cold_off_power_well_is_enabled,
>  };
> +
> +const struct i915_power_well_ops xelpdp_aux_power_well_ops = {
> +	.sync_hw = i9xx_power_well_sync_hw_noop,
> +	.enable = xelpdp_aux_power_well_enable,
> +	.disable = xelpdp_aux_power_well_disable,
> +	.is_enabled = xelpdp_aux_power_well_enabled,
> +};
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.h b/drivers/gpu/drm/i915/display/intel_display_power_well.h
> index 31a898176ebb..e13b521e322a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.h
> @@ -80,6 +80,9 @@ struct i915_power_well_instance {
>  			 */
>  			u8 idx;
>  		} hsw;
> +		struct {
> +			u8 aux_ch;
> +		} xelpdp;
>  	};
>  };
>  
> @@ -169,5 +172,6 @@ extern const struct i915_power_well_ops vlv_dpio_power_well_ops;
>  extern const struct i915_power_well_ops icl_aux_power_well_ops;
>  extern const struct i915_power_well_ops icl_ddi_power_well_ops;
>  extern const struct i915_power_well_ops tgl_tc_cold_off_ops;
> +extern const struct i915_power_well_ops xelpdp_aux_power_well_ops;
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index f2ad1d09ab43..98bd33645b43 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -150,6 +150,7 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
>  				u32 unused)
>  {
>  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> +	struct drm_i915_private *i915 =	to_i915(dig_port->base.base.dev);
>  	u32 ret;
>  
>  	/*
> @@ -170,6 +171,13 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
>  	if (intel_tc_port_in_tbt_alt_mode(dig_port))
>  		ret |= DP_AUX_CH_CTL_TBT_IO;
>  
> +	/*
> +	 * Power request bit is already set during aux power well enable.
> +	 * Preserve the bit across aux transactions.
> +	 */
> +	if (DISPLAY_VER(i915) >= 14)
> +		ret |= XELPDP_DP_AUX_CH_CTL_POWER_REQUEST;
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index e02e461a4b5d..99b2cd2abca4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3451,6 +3451,25 @@
>  #define DP_AUX_CH_CTL(aux_ch)	_MMIO_PORT(aux_ch, _DPA_AUX_CH_CTL, _DPB_AUX_CH_CTL)
>  #define DP_AUX_CH_DATA(aux_ch, i)	_MMIO(_PORT(aux_ch, _DPA_AUX_CH_DATA1, _DPB_AUX_CH_DATA1) + (i) * 4) /* 5 registers */
>  
> +#define _XELPDP_USBC1_AUX_CH_CTL	0x16F210
> +#define _XELPDP_USBC2_AUX_CH_CTL	0x16F410
> +#define _XELPDP_USBC3_AUX_CH_CTL	0x16F610
> +#define _XELPDP_USBC4_AUX_CH_CTL	0x16F810
> +
> +#define _XELPDP_USBC1_AUX_CH_DATA1	0x16F214
> +#define _XELPDP_USBC2_AUX_CH_DATA1	0x16F414
> +#define _XELPDP_USBC3_AUX_CH_DATA1	0x16F614
> +#define _XELPDP_USBC4_AUX_CH_DATA1	0x16F814
> +
> +#define XELPDP_DP_AUX_CH_CTL(aux_ch)		_MMIO(_PICK(aux_ch, \
> +						       _DPA_AUX_CH_CTL, \
> +						       _DPB_AUX_CH_CTL, \
> +						       0, /* port/aux_ch C is non-existent */ \
> +						       _XELPDP_USBC1_AUX_CH_CTL, \
> +						       _XELPDP_USBC2_AUX_CH_CTL, \
> +						       _XELPDP_USBC3_AUX_CH_CTL, \
> +						       _XELPDP_USBC4_AUX_CH_CTL))
> +
>  #define   DP_AUX_CH_CTL_SEND_BUSY	    (1 << 31)
>  #define   DP_AUX_CH_CTL_DONE		    (1 << 30)
>  #define   DP_AUX_CH_CTL_INTERRUPT	    (1 << 29)
> @@ -3463,6 +3482,8 @@
>  #define   DP_AUX_CH_CTL_RECEIVE_ERROR	    (1 << 25)
>  #define   DP_AUX_CH_CTL_MESSAGE_SIZE_MASK    (0x1f << 20)
>  #define   DP_AUX_CH_CTL_MESSAGE_SIZE_SHIFT   20
> +#define   XELPDP_DP_AUX_CH_CTL_POWER_REQUEST REG_BIT(19)
> +#define   XELPDP_DP_AUX_CH_CTL_POWER_STATUS  REG_BIT(18)
>  #define   DP_AUX_CH_CTL_PRECHARGE_2US_MASK   (0xf << 16)
>  #define   DP_AUX_CH_CTL_PRECHARGE_2US_SHIFT  16
>  #define   DP_AUX_CH_CTL_AUX_AKSV_SELECT	    (1 << 15)
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation

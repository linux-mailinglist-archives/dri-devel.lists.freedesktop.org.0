Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616F5B2562
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD4110EB91;
	Thu,  8 Sep 2022 18:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673CB10EB8E;
 Thu,  8 Sep 2022 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662660718; x=1694196718;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MgcJa3erTBJztjoNjkMg7BPw8SWiWmZ8LgMqFEk/9nU=;
 b=B7dBVtVew1YnNUej19QnL1XO/TP/KzEelsbspFEQfp0ehwygOZYj7vkn
 wgJ9MagC9wAZVXOcFN5XUYxyJQQZgOZZ/lEvc2QH/K720eTshGOz9pJln
 Xdmes9DYeDo3qACeWnqilzd8OEps4Lp/uwOtFecdiRUWiTrGSc5HgD3rW
 /OQGnTtM3z+QQbhNT4inbOwDPrAyE376kU8JEisHmWN2s4w5AsYhkAUXr
 SoYIvctdLxtXFrC1EaBLhYMpitUHx/iFuueLq9S4/0qAC2QPGxOLT1mmB
 /pzy4Z8o/DoV1kK3SPctL7XVyqsvQ297j9g4DKKltGd/QOPhqEWOq5OH3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298620946"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="298620946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 11:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="645201053"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 08 Sep 2022 11:11:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 11:11:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 11:11:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 11:11:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FckI2tdFfxad4yw2/EudVTOC3QrMqnULYT+HkK6n6OyBiC1CiCG0+UiV4McTU94yUCr8pr1eXkFW3oiJMmf1Lds6ml/pIIuM5f3IhRglNjAkZqk+xhh1ywzsxBDgrQ5N/Ml8aiJRRKA//gFBftU1gcPb/oVyplvNjohSn4ClMFYD4ryjTPq4aKcE3ZE9AZNmEHh2BkJM7D359rw4qIAVFxHdOaGEzGK/pb4UjLFDbHDF+/ETVYu+MyhUklNHCD4Ctrw6kCc6MSE/m6WSTQEVTrdipLetbcBvO7A1wq6hNHGGh+vl3/R34BIRzNFLNQIlIBY7Pc0geGoEAEtDzwyXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyolMJB5s1C2vcQQfyfPGgugT8Pince6NN/S5yASVos=;
 b=kg/T7KrEFYGT6dtoAtF+5Ax7ksL8akCn5MMhbWVMEVsivkTupZfPJIzh+o1JbiD/liBlEg7WN4+HZpqtozk7qKBT3MUc/2d9/34cw6lA6AJQB+asFbqJrhcw4HcPLVnjKL2eNu3SOs1R1VT+GiICfWvCJOp/ydVkuIk/TyHhgYImme2UiEBKCL1X665+rIYI4M88mFPvyiy3KMehj2NdE8FY4qQzW+ODZUmz//Nu6WOJ+AdRrt2wxEzsRLCnjAn3lSYonZAgHsM3IiZT7Lsj02jZmvI4SrYQKn/EwDaT7zINLZt0yW3BziFKJOKENHq0eVlecm4Lt7orGPfZ2TBmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM6PR11MB3946.namprd11.prod.outlook.com (2603:10b6:5:19d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 18:11:51 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 18:11:51 +0000
Date: Thu, 8 Sep 2022 11:11:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v4 06/11] drm/i915/mtl: Add display power wells
Message-ID: <YxowZXjcWFGybZfF@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-7-radhakrishna.sripada@intel.com>
 <YxovUR2g07QO6Wss@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YxovUR2g07QO6Wss@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aa48cac-a531-4fab-6d9b-08da91c59a95
X-MS-TrafficTypeDiagnostic: DM6PR11MB3946:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ilkEn0SbR3LPU4SbZzlXpAipa0O4PKXBjIoyn/gtdYCW8ZGni1pfZAhj2vAn+og/FYSGvUqKeHTy00tVGZg4WO6REbhs+2Vvxri1zO6bIwR3FUokgT3Ch5sWGm41S0p9I25QgOMtjG/1LMn8WLEdj8ImsoUsTYkasX2vdSVN/WrbGNrl/UGK1bxvmfyMfBDAUreLMBRTawQbALouO1kp54uy5CAlSegHF/ycWwPqPTy0CNsCY8F4xeq2EC/Syl4+AeMKUp3e37BVR/HSbYN82QpNCD+MbKJl4Xsgn5eqkmFfXZntc8M2nsgJP5zrtX8oVWfDyBeXHypl2Jyk9Pc7Q7Du/dK2o5f42AXd7Y9ui/pjCqBqfja15T7c0bR5Dsxu5RX5c5BrhaJpcXQp/Q+m0P3alcbDzGEa24T63dL5mamKKej3OYZYN6iXLlyAWQzFsDwJ9HT71Z0atfcWAB1vXZ0VUE518tKGF0LxFY98fIHuHzOk+EMlAmjh5Z9rJrR8F1EoRsc/kkYT4j7+EJy1b+TEXIfAhFC8OqDtu9Bhjln5xyN9F8rGqhdWtsCmD5wkiVwgrkycQjI35suk8CqE+kXp9XzDvNENKmZdkr/G6DkIYRAv4z7TDGMA4Ucz1Bnhj7DhqI95s3wJj4np/f6pK8DO8kdwJdSVtCLSDXA8/6zyaR4tZpIb7Lq8aaEZNhrU/7MgttBJVAXunXr1S5ZK1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(366004)(346002)(376002)(6486002)(450100002)(41300700001)(478600001)(6636002)(316002)(82960400001)(186003)(83380400001)(6512007)(26005)(6506007)(38100700002)(86362001)(5660300002)(2906002)(66556008)(6862004)(8676002)(66946007)(66476007)(8936002)(4326008)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zG77cEQ3XPGXD2uBl+Ny+9nD7fvWQoszQVtinc2mqUnu3J3txPIcqJgbkiHS?=
 =?us-ascii?Q?u1JSxAsMm9wPbDCQ/wZGvkLRn08rLfHiEzREzTP/8P4F4zYKN/gPSyV4kAkx?=
 =?us-ascii?Q?7wrGqPVmp1g6b50ftHPgYrpE54Qpt2J1WMxKgipX/IEL82VY6KEkTrUDn4by?=
 =?us-ascii?Q?tfQ79D6jcUqaQsbuBYycH5f9HLpJlQWNB1eQXotftkHNZ3W+u3fKqnJ4ldOL?=
 =?us-ascii?Q?s2F5LdLDXMwcG9zJZbIAnD0BGxvsIF4WGstyrKQwX3R8XoarJGRJFtDc0D84?=
 =?us-ascii?Q?OgXlClpRa9M9Yynde4aix5V6qN7kcqAWOfBbzqQ8JoMNcgP0ZHo3TtDFRM2g?=
 =?us-ascii?Q?3KZwO/rizsDZ3qsKmvt4qhlLk/egbkD7sjR7es1P9nHvgxNNFQtN9SDo76Sy?=
 =?us-ascii?Q?vN/sgShGl5PLVhFHlxXb/wLm6XIpII39M6ZKX//uGwxQpBJbYFqQJj8CKhKs?=
 =?us-ascii?Q?9RjwTJK05kPcA5zlPdXfE4py27cN5kiXIVL6TzM8Ck0I5BNbGUE6CeWZnD1s?=
 =?us-ascii?Q?PQtewaqie7PclxVQFj03uIcPfsEZkd8HFrKzCchbdAWJ9GPhykDcuYYh+BF8?=
 =?us-ascii?Q?z1rZ0oUtaMsEbmjCktZY+8C3DoO83/Mn+SzGNWCZP8jMZZPsRu2Avzh7VVek?=
 =?us-ascii?Q?KcgqmZ9maWpFAukokqhKlwgxIKqTizVLAUqdrNGRk8hpwXmVebAjypS7yary?=
 =?us-ascii?Q?bwZAoe5bxGwnLS9YZjysgpbc1AJu03nU3RhFNk3tydL/3sxI9TLw0+JKCCg3?=
 =?us-ascii?Q?dy9dU2ZHjo1DydBYZDGRXu7//lxG0s5F6M0c9vc2lKSikE/lbaNLsR13mfbJ?=
 =?us-ascii?Q?r17JXjGXDlU6VtzOs/fQWTh4ksUFKIjaihIbgjqppCK2xHlSRarqSeFNpOGT?=
 =?us-ascii?Q?bsW5YUN4k5pPY640cpKPEqUlBmscOWIVCKOAkTRDTenAQfZlV7PY90Ctgm+H?=
 =?us-ascii?Q?NAFDSGqjJ3mABf5cgw08NROjAG5NST9Zg+xmGJBjkSftYHadYPiMx0x2fY3f?=
 =?us-ascii?Q?QNDPbgQSLIhONj4Bf97Vd2Gq65JyglnIb4ZadIhWNjMJRADjA01NFpFF/p27?=
 =?us-ascii?Q?BIRdA7asFY400s2QZWASSuKwbs7bNGioaKtCzcGdzsYc4RxHTFn40fWi2GQl?=
 =?us-ascii?Q?VapvoaV6PnacME/+GBRrKlgRPT/YO6gKPxDGnVpYaebIgMuWBZrVJtY6pz+v?=
 =?us-ascii?Q?TyPiIPN/kcqwp7AohR4NdVrqxZ8rytsQ4AQEmggZPC2JMDIya5YCeXVYTUfK?=
 =?us-ascii?Q?Cihm4GzyrZ0Iuwe/89SiUskrCCMDRhXizplSBibNItHTTqbhVaVSzsgwNf30?=
 =?us-ascii?Q?T1fOnopvkHq+p9Whb/TX1w4SfxhcJIbIHvhkJ5WNaN1u/rBCsGr2+6fj0mz9?=
 =?us-ascii?Q?7wH8rUA8C2p7dn5yqK9ZxaWvLukjAq53t6L1dEJe78rNZdMH2DXWDXNhnF21?=
 =?us-ascii?Q?PlWmIZ2iltBApU/hI2U2ek2F0dOCVDJeSem0KnhaMbpv4Zyk2yJGmd2WFkWQ?=
 =?us-ascii?Q?1+yu5IbMyaWd0Q1cUYttu9fGIphLU5WQwC+37nkTjugJUI/T5xNoeQRu20Ks?=
 =?us-ascii?Q?PVgfaVjMv9RxFE6ZAeXK3Af/vUUkvnNeNwmMzmKgBoUrG4+rruPwBph9OFGZ?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa48cac-a531-4fab-6d9b-08da91c59a95
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:11:51.6134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS+7YTWRagRwCF4smtHxeHqdQjOaC0hqjtoeMaNKr8HlakwMuuUUpZOIxslqE2+8iGM3OTR7DmSKYOquXZKg5X9BwZOCvVpb1PDpuvIAZBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3946
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

On Thu, Sep 08, 2022 at 11:07:16AM -0700, Matt Roper wrote:
> On Thu, Sep 01, 2022 at 11:03:37PM -0700, Radhakrishna Sripada wrote:
> > From: Imre Deak <imre.deak@intel.com>
> > 
> > Add support for display power wells on MTL. The differences from XE_LPD:
> > - The AUX HW block is moved to the PICA block, where the registers are on
> >   an always-on power well and the functionality needs to be powered on/off
> >   via the AUX_CH_CTL register: [1], [2]
> > - The DDI IO power on/off programming sequence is moved to the PHY PLL
> >   enable/disable sequence. [3], [4], [5]
> > 
> > Bspec: [1] 49233, [2] 65247, [3] 64568, [4] 65451, [5] 65450
> > 
> > v2:
> >  - Update the comment in aux power well enable
> >  - Reuse the noop sync fn for aux sync.
> >  - Use REG_BIT for new register bit definitions
> > 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Oops, one very minor comment down at the bottom.

> 
> > ---
> >  .../i915/display/intel_display_power_map.c    | 115 +++++++++++++++++-
> >  .../i915/display/intel_display_power_well.c   |  44 +++++++
> >  .../i915/display/intel_display_power_well.h   |   4 +
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   8 ++
> >  drivers/gpu/drm/i915/i915_reg.h               |  21 ++++
> >  5 files changed, 191 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> > index 5ddd1b93751c..dc04afc6cc8f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> > @@ -1350,6 +1350,117 @@ static const struct i915_power_well_desc_list xelpd_power_wells[] = {
> >  	I915_PW_DESCRIPTORS(xelpd_power_wells_main),
> >  };
> >  
> > +/*
> > + * MTL is based on XELPD power domains with the exception of power gating for:
> > + * - DDI_IO (moved to PLL logic)
> > + * - AUX and AUX_IO functionality and register access for USBC1-4 (PICA always-on)
> > + */
> > +#define XELPDP_PW_2_POWER_DOMAINS \
> > +	XELPD_PW_B_POWER_DOMAINS, \
> > +	XELPD_PW_C_POWER_DOMAINS, \
> > +	XELPD_PW_D_POWER_DOMAINS, \
> > +	POWER_DOMAIN_AUDIO_PLAYBACK, \
> > +	POWER_DOMAIN_VGA, \
> > +	POWER_DOMAIN_PORT_DDI_LANES_TC1, \
> > +	POWER_DOMAIN_PORT_DDI_LANES_TC2, \
> > +	POWER_DOMAIN_PORT_DDI_LANES_TC3, \
> > +	POWER_DOMAIN_PORT_DDI_LANES_TC4
> > +
> > +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_pw_2,
> > +	XELPDP_PW_2_POWER_DOMAINS,
> > +	POWER_DOMAIN_INIT);
> > +
> > +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_dc_off,
> > +	XELPDP_PW_2_POWER_DOMAINS,
> > +	POWER_DOMAIN_AUDIO_MMIO,
> > +	POWER_DOMAIN_MODESET,
> > +	POWER_DOMAIN_AUX_A,
> > +	POWER_DOMAIN_AUX_B,
> > +	POWER_DOMAIN_INIT);
> > +
> > +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc1,
> > +	POWER_DOMAIN_AUX_USBC1,
> > +	POWER_DOMAIN_AUX_TBT1);
> > +
> > +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc2,
> > +	POWER_DOMAIN_AUX_USBC2,
> > +	POWER_DOMAIN_AUX_TBT2);
> > +
> > +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc3,
> > +	POWER_DOMAIN_AUX_USBC3,
> > +	POWER_DOMAIN_AUX_TBT3);
> > +
> > +I915_DECL_PW_DOMAINS(xelpdp_pwdoms_aux_tc4,
> > +	POWER_DOMAIN_AUX_USBC4,
> > +	POWER_DOMAIN_AUX_TBT4);
> > +
> > +static const struct i915_power_well_desc xelpdp_power_wells_main[] = {
> > +	{
> > +		.instances = &I915_PW_INSTANCES(
> > +			I915_PW("DC_off", &xelpdp_pwdoms_dc_off,
> > +				.id = SKL_DISP_DC_OFF),
> > +		),
> > +		.ops = &gen9_dc_off_power_well_ops,
> > +	}, {
> > +		.instances = &I915_PW_INSTANCES(
> > +			I915_PW("PW_2", &xelpdp_pwdoms_pw_2,
> > +				.hsw.idx = ICL_PW_CTL_IDX_PW_2,
> > +				.id = SKL_DISP_PW_2),
> > +		),
> > +		.ops = &hsw_power_well_ops,
> > +		.has_vga = true,
> > +		.has_fuses = true,
> > +	}, {
> > +		.instances = &I915_PW_INSTANCES(
> > +			I915_PW("PW_A", &xelpd_pwdoms_pw_a,
> > +				.hsw.idx = XELPD_PW_CTL_IDX_PW_A),
> > +		),
> > +		.ops = &hsw_power_well_ops,
> > +		.irq_pipe_mask = BIT(PIPE_A),
> > +		.has_fuses = true,
> > +	}, {
> > +		.instances = &I915_PW_INSTANCES(
> > +			I915_PW("PW_B", &xelpd_pwdoms_pw_b,
> > +				.hsw.idx = XELPD_PW_CTL_IDX_PW_B),
> > +		),
> > +		.ops = &hsw_power_well_ops,
> > +		.irq_pipe_mask = BIT(PIPE_B),
> > +		.has_fuses = true,
> > +	}, {
> > +		.instances = &I915_PW_INSTANCES(
> > +			I915_PW("PW_C", &xelpd_pwdoms_pw_c,
> > +				.hsw.idx = XELPD_PW_CTL_IDX_PW_C),
> > +		),
> > +		.ops = &hsw_power_well_ops,
> > +		.irq_pipe_mask = BIT(PIPE_C),
> > +		.has_fuses = true,
> > +	}, {
> > +		.instances = &I915_PW_INSTANCES(
> > +			I915_PW("PW_D", &xelpd_pwdoms_pw_d,
> > +				.hsw.idx = XELPD_PW_CTL_IDX_PW_D),
> > +		),
> > +		.ops = &hsw_power_well_ops,
> > +		.irq_pipe_mask = BIT(PIPE_D),
> > +		.has_fuses = true,
> > +	}, {
> > +		.instances = &I915_PW_INSTANCES(
> > +			I915_PW("AUX_A", &icl_pwdoms_aux_a, .xelpdp.aux_ch = AUX_CH_A),
> > +			I915_PW("AUX_B", &icl_pwdoms_aux_b, .xelpdp.aux_ch = AUX_CH_B),
> > +			I915_PW("AUX_TC1", &xelpdp_pwdoms_aux_tc1, .xelpdp.aux_ch = AUX_CH_USBC1),
> > +			I915_PW("AUX_TC2", &xelpdp_pwdoms_aux_tc2, .xelpdp.aux_ch = AUX_CH_USBC2),
> > +			I915_PW("AUX_TC3", &xelpdp_pwdoms_aux_tc3, .xelpdp.aux_ch = AUX_CH_USBC3),
> > +			I915_PW("AUX_TC4", &xelpdp_pwdoms_aux_tc4, .xelpdp.aux_ch = AUX_CH_USBC4),
> > +		),
> > +		.ops = &xelpdp_aux_power_well_ops,
> > +	},
> > +};
> > +
> > +static const struct i915_power_well_desc_list xelpdp_power_wells[] = {
> > +	I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
> > +	I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
> > +	I915_PW_DESCRIPTORS(xelpdp_power_wells_main),
> > +};
> > +
> >  static void init_power_well_domains(const struct i915_power_well_instance *inst,
> >  				    struct i915_power_well *power_well)
> >  {
> > @@ -1457,7 +1568,9 @@ int intel_display_power_map_init(struct i915_power_domains *power_domains)
> >  		return 0;
> >  	}
> >  
> > -	if (DISPLAY_VER(i915) >= 13)
> > +	if (DISPLAY_VER(i915) >= 14)
> > +		return set_power_wells(power_domains, xelpdp_power_wells);
> > +	else if (DISPLAY_VER(i915) >= 13)
> >  		return set_power_wells(power_domains, xelpd_power_wells);
> >  	else if (IS_DG1(i915))
> >  		return set_power_wells(power_domains, dg1_power_wells);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > index 29cc05c04c65..9bf98a37204b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > @@ -1798,6 +1798,43 @@ tgl_tc_cold_off_power_well_is_enabled(struct drm_i915_private *dev_priv,
> >  	return intel_power_well_refcount(power_well);
> >  }
> >  
> > +static void xelpdp_aux_power_well_enable(struct drm_i915_private *dev_priv,
> > +					 struct i915_power_well *power_well)
> > +{
> > +	enum aux_ch aux_ch = i915_power_well_instance(power_well)->xelpdp.aux_ch;
> > +
> > +	intel_de_rmw(dev_priv, XELPDP_DP_AUX_CH_CTL(aux_ch),
> > +		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST,
> > +		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST);
> > +
> > +	/*
> > +	 * The power status flag cannot be used to determine whether aux
> > +	 * power wells have finished powering up.  Instead we're
> > +	 * expected to just wait a fixed 600us after raising the request
> > +	 * bit.
> > +	 */
> > +	usleep_range(600, 1200);
> > +}
> > +
> > +static void xelpdp_aux_power_well_disable(struct drm_i915_private *dev_priv,
> > +					  struct i915_power_well *power_well)
> > +{
> > +	enum aux_ch aux_ch = i915_power_well_instance(power_well)->xelpdp.aux_ch;
> > +
> > +	intel_de_rmw(dev_priv, XELPDP_DP_AUX_CH_CTL(aux_ch),
> > +		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST,
> > +		     0);
> > +	usleep_range(10, 30);
> > +}
> > +
> > +static bool xelpdp_aux_power_well_enabled(struct drm_i915_private *dev_priv,
> > +					  struct i915_power_well *power_well)
> > +{
> > +	enum aux_ch aux_ch = i915_power_well_instance(power_well)->xelpdp.aux_ch;
> > +
> > +	return intel_de_read(dev_priv, XELPDP_DP_AUX_CH_CTL(aux_ch)) &
> > +		XELPDP_DP_AUX_CH_CTL_POWER_STATUS;
> > +}
> >  
> >  const struct i915_power_well_ops i9xx_always_on_power_well_ops = {
> >  	.sync_hw = i9xx_power_well_sync_hw_noop,
> > @@ -1911,3 +1948,10 @@ const struct i915_power_well_ops tgl_tc_cold_off_ops = {
> >  	.disable = tgl_tc_cold_off_power_well_disable,
> >  	.is_enabled = tgl_tc_cold_off_power_well_is_enabled,
> >  };
> > +
> > +const struct i915_power_well_ops xelpdp_aux_power_well_ops = {
> > +	.sync_hw = i9xx_power_well_sync_hw_noop,
> > +	.enable = xelpdp_aux_power_well_enable,
> > +	.disable = xelpdp_aux_power_well_disable,
> > +	.is_enabled = xelpdp_aux_power_well_enabled,
> > +};
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.h b/drivers/gpu/drm/i915/display/intel_display_power_well.h
> > index 31a898176ebb..e13b521e322a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_power_well.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.h
> > @@ -80,6 +80,9 @@ struct i915_power_well_instance {
> >  			 */
> >  			u8 idx;
> >  		} hsw;
> > +		struct {
> > +			u8 aux_ch;
> > +		} xelpdp;
> >  	};
> >  };
> >  
> > @@ -169,5 +172,6 @@ extern const struct i915_power_well_ops vlv_dpio_power_well_ops;
> >  extern const struct i915_power_well_ops icl_aux_power_well_ops;
> >  extern const struct i915_power_well_ops icl_ddi_power_well_ops;
> >  extern const struct i915_power_well_ops tgl_tc_cold_off_ops;
> > +extern const struct i915_power_well_ops xelpdp_aux_power_well_ops;
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > index f2ad1d09ab43..98bd33645b43 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > @@ -150,6 +150,7 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
> >  				u32 unused)
> >  {
> >  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> > +	struct drm_i915_private *i915 =	to_i915(dig_port->base.base.dev);
> >  	u32 ret;
> >  
> >  	/*
> > @@ -170,6 +171,13 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
> >  	if (intel_tc_port_in_tbt_alt_mode(dig_port))
> >  		ret |= DP_AUX_CH_CTL_TBT_IO;
> >  
> > +	/*
> > +	 * Power request bit is already set during aux power well enable.
> > +	 * Preserve the bit across aux transactions.
> > +	 */
> > +	if (DISPLAY_VER(i915) >= 14)
> > +		ret |= XELPDP_DP_AUX_CH_CTL_POWER_REQUEST;
> > +
> >  	return ret;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > index e02e461a4b5d..99b2cd2abca4 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -3451,6 +3451,25 @@
> >  #define DP_AUX_CH_CTL(aux_ch)	_MMIO_PORT(aux_ch, _DPA_AUX_CH_CTL, _DPB_AUX_CH_CTL)
> >  #define DP_AUX_CH_DATA(aux_ch, i)	_MMIO(_PORT(aux_ch, _DPA_AUX_CH_DATA1, _DPB_AUX_CH_DATA1) + (i) * 4) /* 5 registers */
> >  
> > +#define _XELPDP_USBC1_AUX_CH_CTL	0x16F210
> > +#define _XELPDP_USBC2_AUX_CH_CTL	0x16F410
> > +#define _XELPDP_USBC3_AUX_CH_CTL	0x16F610
> > +#define _XELPDP_USBC4_AUX_CH_CTL	0x16F810
> > +
> > +#define _XELPDP_USBC1_AUX_CH_DATA1	0x16F214
> > +#define _XELPDP_USBC2_AUX_CH_DATA1	0x16F414
> > +#define _XELPDP_USBC3_AUX_CH_DATA1	0x16F614
> > +#define _XELPDP_USBC4_AUX_CH_DATA1	0x16F814

These data register definitions aren't used until the next patch, so you
should probably move them there.

Aside from that, the r-b still stands.


Matt

> > +
> > +#define XELPDP_DP_AUX_CH_CTL(aux_ch)		_MMIO(_PICK(aux_ch, \
> > +						       _DPA_AUX_CH_CTL, \
> > +						       _DPB_AUX_CH_CTL, \
> > +						       0, /* port/aux_ch C is non-existent */ \
> > +						       _XELPDP_USBC1_AUX_CH_CTL, \
> > +						       _XELPDP_USBC2_AUX_CH_CTL, \
> > +						       _XELPDP_USBC3_AUX_CH_CTL, \
> > +						       _XELPDP_USBC4_AUX_CH_CTL))
> > +
> >  #define   DP_AUX_CH_CTL_SEND_BUSY	    (1 << 31)
> >  #define   DP_AUX_CH_CTL_DONE		    (1 << 30)
> >  #define   DP_AUX_CH_CTL_INTERRUPT	    (1 << 29)
> > @@ -3463,6 +3482,8 @@
> >  #define   DP_AUX_CH_CTL_RECEIVE_ERROR	    (1 << 25)
> >  #define   DP_AUX_CH_CTL_MESSAGE_SIZE_MASK    (0x1f << 20)
> >  #define   DP_AUX_CH_CTL_MESSAGE_SIZE_SHIFT   20
> > +#define   XELPDP_DP_AUX_CH_CTL_POWER_REQUEST REG_BIT(19)
> > +#define   XELPDP_DP_AUX_CH_CTL_POWER_STATUS  REG_BIT(18)
> >  #define   DP_AUX_CH_CTL_PRECHARGE_2US_MASK   (0xf << 16)
> >  #define   DP_AUX_CH_CTL_PRECHARGE_2US_SHIFT  16
> >  #define   DP_AUX_CH_CTL_AUX_AKSV_SELECT	    (1 << 15)
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCAB5AA20C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 00:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8335C10E33A;
	Thu,  1 Sep 2022 22:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1127610E33A;
 Thu,  1 Sep 2022 22:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662070022; x=1693606022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7cbxmOJubXosLEx5fdTaeY5XD4ryQD86eQZay2lZAZY=;
 b=DV2CogRLT7XmAigQOXhwQK2FIbcVmOjKPi+N9G8P8QdgrFvBEY/VJv2J
 GWD9rxIk/n7pWabA7TqP0FBBDzSxvCOkVzvpyAi8lM4JBAddLhcJrhCQn
 cdO712VubY5JMxRmrq7z3bfxky30wYG1G0NhGGZX3YssTjTUwsnMowbrC
 AckY+L8QMtVQBxmUENHUsOw0onMqDPyqBiWIjKpqPwmIMYY42+77fkURm
 yaUruTA8Lu/69O5BpcVAB8MyE5HrGaCepS2XiJgN8MnVZ1VmzwWQNbYkP
 KQoEoM/GWwrezaBxM+3dnf8VVsp8Iy50ix0430qtejGvLS1Sc2jBWd7X1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278855266"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="278855266"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 15:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642573460"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 15:06:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 15:06:55 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 15:06:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 15:06:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 15:06:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0jWSGP57Mqm/6vVSFXfN+qRBwAT1FUCEs+mQ3LDM8a59YVXIEnHPqDpm8jMIsX8EF3WuaPz5KqeuRexaKqkKzfZIP2Y9Zfhz9tSVLLVzgv3afyaqRS1lp7fQNfovnGJqJCsPlOdVvOn16AmYdutwWijiDSn7b+4IFLnxVHWz9/fV5mdZILQqXMw7qUHJ8YEqMnZQ+5RWDuAfcY5QmzuJjsOA4ILSCzn81bEjLEWtrSC7cnhVeIHm1pwDkpPkXmsyoC+XVJayvGeXIKSQ+0LdvyCH24KCOXVQvxES7iTb4C8CNDoN+mMqKDFQNdBvQh9MpCsm0Eza6BM8V6ywrcVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bcfBcOf1jL6h56gz30j7nIjz4j46oU4u7LR1p0OFJg=;
 b=Vxq6wJCXsi3XDr/5kTWke2auJaOEW15Ew7aRPbiTdYVl9eRJRKZoOKg3HoYfyY5RWjHgwASEU/DuBx7Ql/X9UxYNtw3GEuhAVmZCX/zKf2z2C0W4APcEIYFKEJg340Yx0ER8PLWGENazIkXitS19DKdrPGbXjJis6va3qlkzW4MOGGN0e+uqn2tK4/0tn+CnTGGfi66j+g+suqDl/cI+9SlV96aubMaaq16sTN01aouZ+gjZutpzShZMiJMmc3rUIcPFXHGKxXOUgUsiagvyC8zMsMwdu+r4NGcDstqQ+9R5M9VLoEZTkrAApCOQBRY/VGJ5Ki1S2xzkX4Y5aHbnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Thu, 1 Sep 2022 22:06:53 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%6]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 22:06:53 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3 02/11] drm/i915: Read
 graphics/media/display arch version from hw
Thread-Topic: [Intel-gfx] [PATCH v3 02/11] drm/i915: Read
 graphics/media/display arch version from hw
Thread-Index: AQHYvYPP0orxZHvcZUKvKovu5Cm+fq3KNiwAgADpalA=
Date: Thu, 1 Sep 2022 22:06:53 +0000
Message-ID: <DM4PR11MB59710F8ED626778BBC536328877B9@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
 <20220831214958.109753-3-radhakrishna.sripada@intel.com>
 <875yi7cyqr.fsf@intel.com>
In-Reply-To: <875yi7cyqr.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e275fe5b-5a9a-43d9-f8a3-08da8c664700
x-ms-traffictypediagnostic: CO1PR11MB4995:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CBdQGdo8f/F2f7iedfEjMH0mvOTQXsztqVJwA5vBzC+ENAcHZ+RiIcqImXs5acmPh5zTMSmfF5OWbORMCItIBb5XnkUweg8Ns1xQp75SJx9Z70zFTC3zPTQLPldArm1+r/bJiAMedy7UMM060NpJSYbgvFFyAZSV7WYfCUCaB/Cu7wSitlHJXReT7xIaLvN0JjrSOCMf+Y9FCX1aYuXtt36Y+ZVADE0E/GI/kSWGGphhRhMKE/xieCPWrerD92CECxckDIcQqsv2kabMmwIzaKtMJhmmrdSa4jYPXQIPIxNU9rUsG6pm0FdEiz/k73U6JKKuAH7e5QRzXp0+3Sw2XEQCuvc3llz7MIDO87Ub7k6nTSGMTgosmhupOIj+JNrhT/oc1fH2oF9lLDJkXoxZ6Hb4nxdO7nuXOZi41yE9WSe9sJ+HolBnFLqXnzWJxhvOfAXR8/QBdNRhPq3Trjp/03bw3f/5KOt3BkQ+DGaUAkdHAr6PAX7it1OCtBeoMS6BV4RvOpAU0D92ITpHX+x618iCJIO4rdeN9PBRn6XWyZc6XVsfRpR1oOC5APml3bTlTVaiwVq3s+gdNEHrYqgwnX/OR4B55rLQwFSyoYFddpG61svtKkidjBrSb34y9YpFg2TMAVt+4789ImE0sJ+MpJamEPfSnWSIjZ+Gr9tsnF41iQ6SsOxB1DBET8X7+FpyefQuvVTT7OLqhFSsMwGFLK50usoYPIu5Gc0Oe0KorPQyJC98M8FaLDSSMwzYEvFEr598HKCO0iwByKosKLpDtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(316002)(5660300002)(30864003)(66446008)(8676002)(66476007)(4326008)(76116006)(64756008)(66946007)(66556008)(110136005)(26005)(9686003)(71200400001)(2906002)(6506007)(7696005)(8936002)(53546011)(38070700005)(478600001)(52536014)(55016003)(41300700001)(186003)(82960400001)(86362001)(83380400001)(33656002)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8D6aIQ5wwSP7Vx8m4Ehqd2B3Uc66p4bQ5XVY1IiBF+TybF2dJgxgAnQNyUjA?=
 =?us-ascii?Q?6ZK0oWLWdSrgMMMmbEJZDHVC6cliRr7IyVgM4fXlHyxeoSE1Bif3TUuWmwDm?=
 =?us-ascii?Q?Z9UcPQpMNuPWKLd4j3Dr5WDIH7ypiPP8I06JclCk4neTUm1BkXRB3jJwrSXl?=
 =?us-ascii?Q?LPnSVepenI65BdJLes/RoBe+ageb58jYQyrJ1iWpmSQKPgjB78t0mlkOhjDy?=
 =?us-ascii?Q?d6CgOuaop1d0r/EGfBLHxJ/LI6s29HowdbFnes4Ro3U8Xjge3cI6YbM/IjWA?=
 =?us-ascii?Q?SXjNffrYgdhlptdW3VJN5D5lVCVRg/WRhAh4BByHkWefHJrYmnUA23ycjZS+?=
 =?us-ascii?Q?/A9wX07nwZACA1xqBx6BXd+Qw4oQOObnbf/JCDG3gyDP6TvfxpKmsRoGRBCl?=
 =?us-ascii?Q?PnBWcxxP2n14jVzZLhmSFX3hp9srNgcvyD+q1AHcdAbdszfkP18lugju5iTt?=
 =?us-ascii?Q?3NOYwELLaha7wXmqZyDJ5HjjSEm/A0n6cOxjvzCXPv05CWQ2LJEKwVrL5cOa?=
 =?us-ascii?Q?GhoYHZMhGovGB2FH4eArYiQe2KT3ysXYQI82S4OPWczaf7eIDlKDEhyGXXNU?=
 =?us-ascii?Q?VL5zUPmlUzKXgJ5zCgPGYzDJHSGodHYzY2kDMFaZizxC1lIFbzH/Hhs3sdWE?=
 =?us-ascii?Q?1p83YTLJlQPgzuVw1m27DrhUJL3qeGxZTEx9l2Uq0dxLYb5sj6n4YDiaGHaC?=
 =?us-ascii?Q?PLqnn+Sd4QKq/VVx6PN7qIwnWAj5Tt/usibiwYB0PVIJzEIY1nsbNWr5FhyK?=
 =?us-ascii?Q?eBbmiTTwl8e7zXOgFYN3abQNK8UEiEh+qwcXemu78BMfdbCRrcgM+JAh4Cun?=
 =?us-ascii?Q?8atkQJMZZ4ba6pibA4HG+5AvKkqoEyDU2D7VxnSInkn6qg2IiL+m0C3ZZSzJ?=
 =?us-ascii?Q?u+X+fMU4JPD78xZl3quI2GcTqNmKKcEIra9tKpmfDhlxgNGghCcx17C7E28T?=
 =?us-ascii?Q?gYZuhjYklRytO1Q/AesXvps/DYpg/Oi505sut+ddq5Pmi6VkwS5Bjcdr5aDY?=
 =?us-ascii?Q?eV5C1L7txWeHtl/spcvaeObmKO/Cr8GHyVXSzQe6lH9rabjettLeWcMmFrG7?=
 =?us-ascii?Q?kusKb7fxX4G/S4juez1iqi5ikC3icQ9YGpxLEjBBaQgmZL9ctKmmTvOBgMd+?=
 =?us-ascii?Q?LUyAKonXiVTHqt5isxk/0cozu2qBblrg561LOoom/xJNQaKEugwmkFjSoYyY?=
 =?us-ascii?Q?JSTkvUUbRmdTNL+KDxZvMrgBWOUNew/1Zzn/ymjHsOj3h1+uM5IOElTa2WLq?=
 =?us-ascii?Q?PiYRDtNP1AC5fUuRLYwriZUy2BiCBilcIeNR+nhjYrwnDOq7waxUyNzB0gi9?=
 =?us-ascii?Q?YaAnHoUSJgtnVfxLQ2h6ic7hhFoasxOeIWRGgEyUxQOkRUA/zohBzSeiqA92?=
 =?us-ascii?Q?ecXHW3FDkwstCovjvOKy8nVNob9gjFo/Jwuq2XGUm0Rpoza7YjDIFiSR7IE+?=
 =?us-ascii?Q?saI8UBMzg61SENIAfO+b4GTcbZF76daiaPvm86pz6Tde8Ec56LUmjfPO0kwl?=
 =?us-ascii?Q?xtUG7bZwUkG2nwSXD5ijDs2yoqrDO7hMYJqkLEs6CKF2Ajm5jjRuqRQrOjgN?=
 =?us-ascii?Q?OjgD3XLfdUZMBxJYs2Oqc3ikCsSZAKg+DWLNxenRTQLwK7KCL3XtVIHKXqjW?=
 =?us-ascii?Q?Yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e275fe5b-5a9a-43d9-f8a3-08da8c664700
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 22:06:53.1520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qULPQCJ+sr4dOknCObQZLzOIAXvAzU3bOU+JMTbpQtQKxLPswtPZNgelGB/vsA3G4ZQVQxiNWSUNPYi2ksEh1YGLezpimf1/4Gc/WNayE0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, September 1, 2022 12:58 AM
> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH v3 02/11] drm/i915: Read graphics/media/d=
isplay
> arch version from hw
>=20
> On Wed, 31 Aug 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com=
>
> wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> >
> > Going forward, the hardware teams no longer consider new platforms to
> > have a "generation" in the way we've defined it for past platforms.
> > Instead, each IP block (graphics, media, display) will have their own
> > architecture major.minor versions and stepping ID's which should be rea=
d
> > directly from a register in the MMIO space.  New hardware programming
> > styles, features, and workarounds should be conditional solely on the
> > architecture version, and should no longer be derived from the PCI
> > device ID, revision ID, or platform-specific feature flags.
> >
> > Bspec: 63361, 64111
> >
> > v2:
> >   - Move the IP version readout to intel_device_info.c
> >   - Convert the macro into a function
> >
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
> >  drivers/gpu/drm/i915/i915_driver.c       |  2 +
> >  drivers/gpu/drm/i915/i915_drv.h          |  2 +
> >  drivers/gpu/drm/i915/i915_pci.c          |  1 +
> >  drivers/gpu/drm/i915/i915_reg.h          |  6 ++
> >  drivers/gpu/drm/i915/intel_device_info.c | 73 ++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/intel_device_info.h |  3 +
> >  7 files changed, 89 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index d414785003cc..579da62158c4 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -39,6 +39,8 @@
> >  #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> >  #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
> >
> > +#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
> > +
> >  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> >  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> >  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> b/drivers/gpu/drm/i915/i915_driver.c
> > index 3aedc33ded57..5826c70d6fa5 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -323,6 +323,8 @@ static int i915_driver_early_probe(struct
> drm_i915_private *dev_priv)
> >  	if (i915_inject_probe_failure(dev_priv))
> >  		return -ENODEV;
> >
> > +	intel_device_info_runtime_init_early(dev_priv);
> > +
> >  	intel_device_info_subplatform_init(dev_priv);
>=20
> Hmm, so why not move the subplatform init call to runtime init early?
Will move in next rev.

>=20
> >  	intel_step_init(dev_priv);
> >
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> b/drivers/gpu/drm/i915/i915_drv.h
> > index bf60593a4ce5..935ff3486fef 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -936,6 +936,8 @@ IS_SUBPLATFORM(const struct drm_i915_private
> *i915,
> >
> >  #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
> >
> > +#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
> > +
> >  #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
> >
> >  #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c
> b/drivers/gpu/drm/i915/i915_pci.c
> > index 72577e327c71..9772c315185d 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1129,6 +1129,7 @@ static const struct intel_device_info mtl_info =
=3D {
> >  	PLATFORM(INTEL_METEORLAKE),
> >  	.display.has_modular_fia =3D 1,
> >  	.has_flat_ccs =3D 0,
> > +	.has_gmd_id =3D 1,
> >  	.has_snoop =3D 1,
> >  	.__runtime.memory_regions =3D REGION_SMEM |
> REGION_STOLEN_LMEM,
> >  	.__runtime.platform_engine_mask =3D BIT(RCS0) | BIT(BCS0) | BIT(CCS0)=
,
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h
> > index 5e6239864c35..f52ed6d00030 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -5798,6 +5798,11 @@
> >  #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
> >  #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
> >
> > +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
> > +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> > +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> > +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> > +
> >  /*GEN11 chicken */
> >  #define _PIPEA_CHICKEN				0x70038
> >  #define _PIPEB_CHICKEN				0x71038
> > @@ -8298,4 +8303,5 @@ enum skl_power_gate {
> >  #define  MTL_LATENCY_LEVEL_EVEN_MASK	REG_GENMASK(12, 0)
> >  #define  MTL_LATENCY_LEVEL_ODD_MASK	REG_GENMASK(28, 16)
> >
> > +#define MTL_MEDIA_GSI_BASE		0x380000
>=20
> Blank line here.
>=20
> >  #endif /* _I915_REG_H_ */
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c
> b/drivers/gpu/drm/i915/intel_device_info.c
> > index 8ff66b4e11c1..e36ba0520be7 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > @@ -29,6 +29,7 @@
> >
> >  #include "display/intel_cdclk.h"
> >  #include "display/intel_de.h"
> > +#include "gt/intel_gt_regs.h"
> >  #include "intel_device_info.h"
> >  #include "i915_drv.h"
> >  #include "i915_utils.h"
> > @@ -133,6 +134,78 @@ void intel_device_info_print(const struct
> intel_device_info *info,
> >  	drm_printf(p, "rawclk rate: %u kHz\n", runtime->rawclk_freq);
> >  }
> >
> > +static void ip_ver_read(struct drm_i915_private *i915, u32 offset, str=
uct
> ip_version *ip,
> > +			const struct ip_version *dr_ip)
> > +{
> > +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> > +	void __iomem *addr;
> > +	u32 ver;
> > +
> > +	addr =3D pci_iomap_range(pdev, 0, offset, sizeof(u32));
> > +	if (drm_WARN_ON(&i915->drm, !addr))
> > +		return;
> > +
> > +	ver =3D ioread32(addr);
> > +	pci_iounmap(pdev, addr);
> > +
> > +	ip->ver =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, ver);
> > +	ip->rel =3D REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
> > +	ip->step =3D REG_FIELD_GET(GMD_ID_STEP, ver);
> > +
> > +	/* Sanity check against expected versions from device info */
> > +	if (ip->ver !=3D dr_ip->ver || ip->rel > dr_ip->rel)
> > +		drm_dbg(&i915->drm,
> > +			"Hardware reports GMD IP version %u.%u but minimum
> expected is %u.%u\n",
> > +			ip->ver, ip->rel, dr_ip->ver, dr_ip->rel);
>=20
> So this doesn't work because you pass in the same pointer in both ip and
> dr_ip, and you overwrite it above. These will always match. I think just
> drop the 2nd pointer from parameters, and make a local copy. Or read the
> values to a local copy, check them, and assign.

We pass 2 different pointers here. Ip obtained from RUNTIME_INFO is=20
&dev_priv->__runtime.{display,graphics,media} and dr_ip obtained from
INTEL_INFO is &dev_priv->__info.__runtime.
So the original hardcoded values in match info would be in dr_ip.

Since we copy INTEL_INFO(dev_priv)->__runtime onto RUNTIME_INFO(dev_priv)
During driver create, we can cache the values and skip passing 2 pointers.
>=20
> > +}
> > +
> > +/**
> > + * intel_ipver_early_init - setup IP version values
> > + * @dev_priv: device private
>=20
> We don't need (or want) kernel-doc for static functions. It just
> pollutes the generated documentation. The informative part can stay as a
> regular comment.

Will drop in next rev.
>=20
> > + *
> > + * Setup the graphics version for the current device.  This must be do=
ne
> before
> > + * any code that performs checks on GRAPHICS_VER or DISPLAY_VER, so th=
is
> > + * function should be called very early in the driver initialization s=
equence.
> > + *
> > + * Regular MMIO access is not yet setup at the point this function is =
called so
> > + * we peek at the appropriate MMIO offset directly.  The GMD_ID regist=
er is
> > + * part of an 'always on' power well by design, so we don't need to wo=
rry
> about
> > + * forcewake while reading it.
> > + */
> > +static void intel_ipver_early_init(struct drm_i915_private *i915)
> > +{
> > +	struct intel_runtime_info *rtime =3D RUNTIME_INFO(i915);
> > +	const struct intel_runtime_info *drinfo =3D &INTEL_INFO(i915)-
> >__runtime;
>=20
> "runtime" and "info" have been used elsewhere as the variable
> names. Whether they are good is debatable, but better to stick to one
> naming.

If passing single pointer is sufficient, I will skip using drinfo and modif=
y the
variable in next rev.

Thanks,
RK Sripada
>=20
> > +
> > +	if (!HAS_GMD_ID(i915))
> > +		return;
> > +
> > +	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS), &rtime-
> >graphics,
> > +		    &drinfo->graphics);
> > +	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_DISPLAY), &rtime-
> >display,
> > +		    &drinfo->display);
> > +	ip_ver_read(i915, MTL_MEDIA_GSI_BASE +
> i915_mmio_reg_offset(GMD_ID_GRAPHICS),
> > +		    &rtime->media, &drinfo->media);
> > +}
> > +
> > +/**
> > + * intel_device_info_runtime_init_early - initialize early runtime inf=
o
> > + * @i915: the i915 device
>=20
> Even if this isn't a static function, I think it does beg the question
> does it need to be part of the generated documentation?

Will drop in next rev.
>=20
> > + *
> > + * Determine early intel_device_info fields at runtime.
> > + *
> > + * Use it when:
> > + *   - Early init of certain runtime info fields are to be initialized
> > + *
> > + * This function needs to be called:
> > + *   - before the MMIO has been setup as we are reading registers,
> > + *   - before the PCH has been detected,
> > + *   - before the first usage of the fields it can tweak.
> > + */
> > +void intel_device_info_runtime_init_early(struct drm_i915_private *i91=
5)
> > +{
> > +	intel_ipver_early_init(i915);
> > +}
>=20
> Blank line here.
>=20
> >  #undef INTEL_VGA_DEVICE
> >  #define INTEL_VGA_DEVICE(id, info) (id)
> >
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h
> b/drivers/gpu/drm/i915/intel_device_info.h
> > index 6511b25277dc..6031e729714e 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -152,6 +152,7 @@ enum intel_ppgtt_type {
> >  	func(has_4tile); \
> >  	func(has_flat_ccs); \
> >  	func(has_global_mocs); \
> > +	func(has_gmd_id); \
> >  	func(has_gt_uc); \
> >  	func(has_heci_pxp); \
> >  	func(has_heci_gscfi); \
> > @@ -197,6 +198,7 @@ enum intel_ppgtt_type {
> >  struct ip_version {
> >  	u8 ver;
> >  	u8 rel;
> > +	u8 step;
> >  };
> >
> >  struct intel_runtime_info {
> > @@ -307,6 +309,7 @@ struct intel_driver_caps {
> >
> >  const char *intel_platform_name(enum intel_platform platform);
> >
> > +void intel_device_info_runtime_init_early(struct drm_i915_private
> *dev_priv);
> >  void intel_device_info_subplatform_init(struct drm_i915_private *dev_p=
riv);
> >  void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)=
;
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center

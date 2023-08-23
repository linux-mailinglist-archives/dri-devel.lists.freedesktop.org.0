Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1513784EAE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 04:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251DC10E0E2;
	Wed, 23 Aug 2023 02:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146CC10E0D1;
 Wed, 23 Aug 2023 02:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692757466; x=1724293466;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cm2tvFq/tkb07sj4+NsPFswne39n0Nx6zaqoXkqGkuc=;
 b=GTMwY5bSac4UchG6BkX4Ik6kKN5oXRbPRhNCAxN3+WeObx5xEASvcw9v
 ODqMhfYGRRILAk5tuWDnz415VDpQppajtTNZeAKBMwvt2HetQoDurTYPb
 +LuAMxEkKtKmyxQGCdXo7gIu32DmGLQ/iWQjoBShmjab2Vlx9qrFSHhc8
 DBp8otQuz3WnDpjehL7Dcip1wotY8hkxysAWkv/lXupybWLoItiLaRXUI
 yVWaeAKh5H3BWHt5RDxHtY0MkNb4+p0fnQBmgX+yM4X2rzllkqk5MfPLY
 wiPEruJWjEimoM5u31ZUIiUsvJcjxUgowW8j3g0RL5T82f5N0ZBTPgKjr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="437975917"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="437975917"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 19:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="801917248"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="801917248"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 19:24:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 19:24:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 19:24:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 19:24:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 19:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8JeGI1xYWdZCtYh4a5yIR3W7dDJN/v3VF7M64x8QynVitNaNod5oLm01R23DyVDRm5d0OIP9MmuscDysuioRmVtrWgWjsmwB0GCzJNoW5qhCRbXenZMaoA0Z8HqtrrjvGeqm/6u5qY+6PpiOBQ6OBqtG7dya65sViBOJ5cELR1RSsvQzDROdDK5SAFLTUBaH9j07cQLAWy7yGRtcqj5nqCDshY9vfhAflxCroGm7/0BHpRIAPVPMvCMLRG+vU09iu3P1SeTeTvlinN2UUikBlPLkglSziRm5Tsry1wcwV1pnmqZdKKzsvVgatWGoHZ3d9V2/C9XE10hmnG/2/JMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUNSazZdCqTU1rijboQV64932OBisFequ/HVj37FyaA=;
 b=hEvkSvVvWWuLkb7pEyd2eOqw3uuQ+QGwHYrz45db58EXzeSJSYi90y73ncbQ3D8seyS31aN6zaW96+HZKjHy7ZVI3JsjzSaLMICnUjImy76J81P+Bc3j9Ylp8rSJ/PaulAprcOgcqmM1QJt+sjszCAMS98ePPA17P4GNQUOe5lUePrjcGqnykfq838WVNey5dPYd2oRVLMU/XZhXDRKRuvLrvMzjyNlcYwYLlBf0WpDz0cRepc3+GiIdR1KiJO9qiXuH4Nth1Scwx3og+SnHbH1nqYo2gIcAGSCQDSpANCHkPQdWIvJz963++te2mrNnDRMfL+af6oHZwitqos1Xpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 02:24:21 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::94a8:a58f:4cdc:f2a1]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::94a8:a58f:4cdc:f2a1%7]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 02:24:21 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Cable type identification for
 DP2.1
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/dp: Cable type identification for
 DP2.1
Thread-Index: AQHZmpg30pWc9jVem0etTpBk2lZPCK+CJaSAgHV3AoA=
Date: Wed, 23 Aug 2023 02:24:21 +0000
Message-ID: <670a9466403175a9e02f9fc0298bd7355779f86f.camel@intel.com>
References: <20230609055435.299584-1-animesh.manna@intel.com>
 <874jnhrq1c.fsf@intel.com>
In-Reply-To: <874jnhrq1c.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4620:EE_|DS0PR11MB8019:EE_
x-ms-office365-filtering-correlation-id: 810a3201-13ac-4230-b814-08dba3800f6a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pi1JxFlpWkPZ3Jz45G68KIVtTp3C25GMz2NokUKLvQIeFjH9nAX5ZI5dkun1TLiMiSFkPUEjZVp8w/b4+Kn7lWTnWgSiS5oj9cZYtP7Rc3rmBrOiOHO3CkYglSXJnw2GoC2ww3MB/1+jMGvAc/98ibw50kQGWHniejclGaSFYEaqA/r6wE03L0VZ1Epp4J70nXq0eCxgYAyDm9qZK9uBkUVWic6T9vQ/xKus3hf7C1nGDW/lTXbE1dJ6cpl3YiEpgS+iL2CF/fUR/R1jDoLQKfiD0e/BslIz5g2D5j1wPmv17fcFTrNMtVgEHLw5QR6jLmncofLwKqm0PF2qou0vxlCqODUDr85TNn6VxDAqGlgno7tB64H4ARntumK6kt9f9sZvxfiGVX27Am08mupbxWhvT5AKKozcDVEZ+FrL5gvponBezELjEI++q6aoAF/5oNinCE0VVVdQLHbSrXNi0cSNRIzOirnaSzSWLYzIg78Vo+KCfbtyYduXOZgHEPBAa16yKa7PJ3mT8OvSdIhVQhJvqNYvga5Zvmp21IUSGYMyJDmQzpszkCqJC9Hd8UIQ64G3NsA6LgUEb5w/j7V70+XO6QToxNlhQHjZzR01b033YVBDO6G2gzIIxcbyU5pt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199024)(1800799009)(186009)(2906002)(30864003)(38070700005)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(86362001)(8676002)(450100002)(2616005)(8936002)(316002)(64756008)(6512007)(66946007)(76116006)(66446008)(66556008)(66476007)(110136005)(6636002)(82960400001)(478600001)(122000001)(71200400001)(36756003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?EskCuJ+EoqRYdyv+i67hwtOHeeE7FwS+ftIP466EtImx1I1kqWhZ2gTMm?=
 =?iso-8859-15?Q?gsGkzLkPP2NVMU4DyUZ+vsZZ3rY1MPAu9SF8IzgXpPRLbeK1/nlROou3Q?=
 =?iso-8859-15?Q?49Fi4yebFTfUQWxS5e2kXknQAANiz9xSyW6gpvRNdF0xS2FJMXg+WU7dx?=
 =?iso-8859-15?Q?ljec4711KVrHK8WB/vxKi4eJ/9zI04Gzi1xHpGzC0GoQEi7QQHxBe/NX5?=
 =?iso-8859-15?Q?mD0TPX6qOCp/rP+AFtr1CEyTDFrJpY9gmS1k0iD/ock+zmZZVDaqoXdyF?=
 =?iso-8859-15?Q?Vh6OC5Su4IjMj1hVqUB75Q1meIqj7h1LFq41p5t/zGJiMAoIDKUYQ+DEy?=
 =?iso-8859-15?Q?ryE1kKgLYBcyWBw8+OrHOfN4s0JDeldRrozZXvxmPtMW6TqlPP7Nb8DAG?=
 =?iso-8859-15?Q?OsvW4zpVN+1PlaL5axZXMZaMgCnY+xM9YfMl8ZdUznT7r+BU6ICjIhGRR?=
 =?iso-8859-15?Q?ihEfuxulRVUrbH3ZMmDtkRwDCVbu3Fuj5mQePvKKBsJqVYkA2abzhdlby?=
 =?iso-8859-15?Q?4Mf6OzzX66k3otemGkYSlaPzng62r4Tz2QWlovu4ric4e2Vr2AYp67Ff6?=
 =?iso-8859-15?Q?XZ5AOTsM/4GHLYs8rcH0NGXLS2Hdc2O3sAv5GYmJB8tCvgm92RpwOCvRw?=
 =?iso-8859-15?Q?DXhsllpZfHzF5us1rFza3kMdztLIOW3h9SyvTLvnala6Tezyqi8QXTBJr?=
 =?iso-8859-15?Q?NQu4WeOwxzPm+N2V5SV78Sljy6w8AMJRaQrBHZSUcjDI99JpjoLjEVYDE?=
 =?iso-8859-15?Q?tGafnf+v3jClohRW7EDhcNt3pzbL/+pJ3+afbv+KH7JszfVrfb9FolnoO?=
 =?iso-8859-15?Q?o0K8Szw/Gn5l+QwIT/eYs/iEgGEKdshPTYXLDPlWdDuhYhMgZ3MOCbWzu?=
 =?iso-8859-15?Q?BmPTItgEUNX8+JqXs/hzWXlqqDEUID8QGqkYVkbWCS7gWgc6CJ8NcBtJq?=
 =?iso-8859-15?Q?6yubX20IbdXXW5v8ZqJCt7RvqzyfNjiK+7G1wMOD2z6JU452bgjQc9O3S?=
 =?iso-8859-15?Q?qJpYjUMCfIeLXhPxpeG8HLugtZTzCrxPgcIzv5KQh1PdqcO7fdo4Lh88W?=
 =?iso-8859-15?Q?BpzideClpaT8Z7JLYDTXwLcjS2OF+6CWs2GyophL3GHr/0z1io/1TKSdI?=
 =?iso-8859-15?Q?Bu9A2UqWtqD41+ztdhht9zIe0DAsHn5Rp27kZKtrc3wgEiS0wdbEhogou?=
 =?iso-8859-15?Q?kT9g6PGYgGZ5/JbN3UtwhXg/5nMP9kkW05tUpdU0UqBHDsIS/EYAKNiu0?=
 =?iso-8859-15?Q?7m44q70aoqbyivm9q4ef2QtfWx4CZIV1J2FPWmMQei1epvkgfur0ry6jM?=
 =?iso-8859-15?Q?TYvZPHANJrIsl6Ee4F+CZDgOxgPeaMdv6A4K0U9RmuI6qx3XuPJvq0Hz5?=
 =?iso-8859-15?Q?kcZPbczYbymwu1xkWVFuLsXxqMe4Pgk8rhYZHa5SbZ+E8zU/xnsBg6iIM?=
 =?iso-8859-15?Q?KhStp/8doUsY4ykkwNiXPCL//67+JPz9YVZnRhnwwiPXkoGmpDrmGu8Mn?=
 =?iso-8859-15?Q?AjErENQZdpek3sXS2NYjZA9aE60TYsx3gePqKJ52U+ROGpf2FjEbY10ld?=
 =?iso-8859-15?Q?B3Qi2WOFA/0dWOcDv//qVvJfGqvnI2fcgfF98mvdrDr+12cYUuXuMIGNv?=
 =?iso-8859-15?Q?H/DjxAuDB5FTUe0FCyO4Lnzh7WqLmGGuewf9BK98NyIxv1k9G8ilaLuFD?=
 =?iso-8859-15?Q?3E3riTFfJ5njxvZGh4fZ9UT2DcUaVotWXyxpVtbzmTUV/vem8OjB0tVDM?=
 =?iso-8859-15?Q?fqgqcYjnoGBvI1mWEAo8CdzIBcEoNLsqDFCcEmCQNfccApvSqc3p7U=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <F269FFE486683345A0102CC34820C4AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810a3201-13ac-4230-b814-08dba3800f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 02:24:21.2729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A1Wy3dRh/VBq4NTWYdfm0cLq5qXHqaRSplBr0HV+e3bYShMHE6niYBNSdTqfopEUtggEANaL/GZhoybRpbM0IWhhNVX7AJi+RT7J7HlSrRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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

On Fri, 2023-06-09 at 11:35 +0300, Jani Nikula wrote:
> On Fri, 09 Jun 2023, Animesh Manna <animesh.manna@intel.com> wrote:
> > For DP alt mode display driver get the information
> > about cable speed and cable type through TCSS_DDI_STATUS
> > register which will be updated by type-c platform driver.
> > Accodingly Update dpcd 0x110 with cable information before
> > link training start. This change came part of DP2.1 SCR.
>=20
> No need to refer to the SCR anymore, as DP 2.1 is out.
>=20
> There are a bunch of detailed comments inline.
>=20
> High level, this should probably be done much earlier. See Table 5-21=20
> in
> DP 2.1. We need to read DPCD 0x2217 before writing 0x110. The DPRX
> updates 0x2217 before asserting hotplug, so we should probably read
> it
> at detect where we read all other DPCD too.
>=20
> How early is TCSS_DDI_STATUS available, should we read that at
> hotplug
> too?=20

This is available once the cable is inserted and is configured
by TCSS/EC in Chrome and PD in Windows.=20
Please check: VLK-42522

> For USB-C we should write to DPCD 0x110 the least common
> denominator between DPCD 0x2217 and 0x110.
>=20
> Another question which I didn't find an answer to yet, does writing
> 0x110 impact what the RPRX reports for capabilities i.e. can we
> proceed

No, DPRX caps will not change. DP2.1 Sink will still repot UHBRx even
if the cable doesn't support UHBRX

> with link training normally from there, *or* should we limit the
> sink_rates/common_rates based on TCSS_DDI_STATUS and DPCD 0x2217
> i.e. filter out UHBR as needed.

Yes, we should limit "common rates" to the intersection of (source,
sink, cable)

The question, do we really need to care about reading/writing DPCD
0x110 & 0x2217 given TCSS_DDI_STATUS already reflects that?=20

Thank You
Khaled
>=20
> Please read bspec and DP 2.1 further to find answers.
>=20
> > Note: This patch is not tested due to unavailability of
> > cable. Sending as RFC for design review.
> >=20
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c | 57
> > ++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_tc.c  | 10 +++++
> >  drivers/gpu/drm/i915/display/intel_tc.h  |  1 +
> >  drivers/gpu/drm/i915/i915_reg.h          |  5 +++
> >  include/drm/display/drm_dp.h             |  9 ++++
> >  5 files changed, 82 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> > b/drivers/gpu/drm/i915/display/intel_ddi.c
> > index 70d44edd8c6e..3a0f6a3c9f98 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -2208,6 +2208,55 @@ static void
> > intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp
> > *intel
> >  			    str_enable_disable(enable));
> >  }
> > =20
> > +#define CABLE_SPEED_SHIFT 4
> > +
> > +enum dp_cable_speed {
> > +	DP_CABLE_HBR3 =3D 1,
> > +	DP_CABLE_UHBR10,
> > +	DP_CABLE_GEN3_UHBR20,
> > +	DP_CABLE_GEN4_UHBR20
> > +};
> > +
> > +static void intel_dp_set_cable_attributes(struct intel_dp
> > *intel_dp,
> > +					  u8 cable_attributes)
>=20
> There are two "domains" for the cable information, the hardware
> register
> and the DPCD register. However, cable_attributes is neither, but also
> not helpful, which makes this function cumbersome.
>=20
> Usually in cases like this, you'd pick one or the other, *or* if you
> want to have a generic middle ground, you'd make it helpful and easy
> to
> use and understand (e.g. a struct).
>=20
> In this case, I'd just pick the DPCD as the format, because it's
> platform independent and the whole thing is simple enough.
>=20
> So this function would really reduce down to a single DPCD write.
>=20
> > +{
> > +	u8 cable_speed;
> > +	bool active_cable, retimer;
> > +	u8 cable_attr_dpcd;
> > +
> > +	cable_speed =3D cable_attributes >> CABLE_SPEED_SHIFT;
> > +
> > +	switch (cable_speed) {
> > +	case DP_CABLE_HBR3:
> > +		cable_attr_dpcd =3D 0;
> > +		break;
> > +	case DP_CABLE_UHBR10:
> > +		cable_attr_dpcd =3D 1;
> > +		break;
> > +	case DP_CABLE_GEN3_UHBR20:
> > +	case DP_CABLE_GEN4_UHBR20:
> > +		cable_attr_dpcd =3D 2;
> > +		break;
> > +	default:
> > +		cable_attr_dpcd =3D 0;
> > +		break;
> > +	}
> > +
> > +	active_cable =3D (cable_attributes <<
> > TCSS_DDI_STATUS_CABLE_ATTR_SHIFT) &
> > +		       TCSS_DDI_STATUS_ACTIVE_CABLE;
> > +	retimer =3D (cable_attributes <<
> > TCSS_DDI_STATUS_CABLE_ATTR_SHIFT) &
> > +		  TCSS_DDI_STATUS_RETIMER_REDRIVER;
> > +	if (retimer && active_cable)
> > +		cable_attr_dpcd |=3D DP_CABLE_TYPE_RETIMER_ACTIVE;
> > +	else if (active_cable)
> > +		cable_attr_dpcd |=3D DP_CABLE_TYPE_LRD_ACTIVE;
> > +	else
> > +		cable_attr_dpcd |=3D DP_CABLE_TYPE_PASSIVE;
> > +
> > +	drm_dp_dpcd_writeb(&intel_dp->aux,
> > DP_CABLE_ATTRIBUTES_UPDATED_BY_TX,
> > +			   cable_attr_dpcd);
> > +}
> > +
> >  static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
> >  					const struct intel_crtc_state
> > *crtc_state)
> >  {
> > @@ -2414,6 +2463,7 @@ static void mtl_ddi_pre_enable_dp(struct
> > intel_atomic_state *state,
> >  {
> >  	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> >  	bool is_mst =3D intel_crtc_has_type(crtc_state,
> > INTEL_OUTPUT_DP_MST);
> > +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
> > =20
> >  	intel_dp_set_link_params(intel_dp,
> >  				 crtc_state->port_clock,
> > @@ -2480,6 +2530,13 @@ static void mtl_ddi_pre_enable_dp(struct
> > intel_atomic_state *state,
> >  	intel_dp_check_frl_training(intel_dp);
> >  	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
> > =20
> > +	if (intel_tc_port_in_dp_alt_mode(dig_port)) {
> > +		u8 cable_attributes;
> > +
> > +		cable_attributes =3D
> > intel_tc_get_cable_attributes(dig_port);
> > +		intel_dp_set_cable_attributes(intel_dp,
> > cable_attributes);
> > +	}
> > +
> >  	/*
> >  	 * 6. The rest of the below are substeps under the bspec's
> > "Enable and
> >  	 * Train Display Port" step.  Note that steps that are specific
> > to
> > diff --git a/drivers/gpu/drm/i915/display/intel_tc.c
> > b/drivers/gpu/drm/i915/display/intel_tc.c
> > index 3ebf41859043..6b10a8839563 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> > @@ -260,6 +260,16 @@ assert_tc_port_power_enabled(struct
> > intel_tc_port *tc)
> >  		    !intel_display_power_is_enabled(i915,
> > tc_port_power_domain(tc)));
> >  }
> > =20
> > +u8 intel_tc_get_cable_attributes(struct intel_digital_port
> > *dig_port)
> > +{
> > +	struct drm_i915_private *i915 =3D to_i915(dig_port-
> > >base.base.dev);
> > +	enum tc_port tc_port =3D intel_port_to_tc(i915, dig_port-
> > >base.port);
>=20
> So I think this function should return the information in DPCD 0x110
> format.
>=20
> Read the register, convert to DPCD format, return. Make this the
> single
> point of conversion between the two, and don't pass intermediate info
> around.
>=20
> Whoever calls this should then have DPCD 0x2217 and the info returned
> by
> this function, and find the least common denominator, and update
> 0x110
> accordingly. And *maybe* also update sink_rates/common_rates
> accordingly.
>=20
> > +
> > +	return (intel_de_read(i915, TCSS_DDI_STATUS(tc_port)) &
> > +		TCSS_DDI_STATUS_CABLE_ATTR_MASK) >>
> > +		TCSS_DDI_STATUS_CABLE_ATTR_SHIFT;
> > +}
> > +
> >  u32 intel_tc_port_get_lane_mask(struct intel_digital_port
> > *dig_port)
> >  {
> >  	struct drm_i915_private *i915 =3D to_i915(dig_port-
> > >base.base.dev);
> > diff --git a/drivers/gpu/drm/i915/display/intel_tc.h
> > b/drivers/gpu/drm/i915/display/intel_tc.h
> > index 3b16491925fa..edafe92844b4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tc.h
> > +++ b/drivers/gpu/drm/i915/display/intel_tc.h
> > @@ -43,5 +43,6 @@ int intel_tc_port_init(struct intel_digital_port
> > *dig_port, bool is_legacy);
> >  void intel_tc_port_cleanup(struct intel_digital_port *dig_port);
> > =20
> >  bool intel_tc_cold_requires_aux_pw(struct intel_digital_port
> > *dig_port);
> > +u8 intel_tc_get_cable_attributes(struct intel_digital_port
> > *dig_port);
> > =20
> >  #endif /* __INTEL_TC_H__ */
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h
> > index 0523418129c5..991ecf082b5c 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -6576,6 +6576,11 @@ enum skl_power_gate {
> >  #define TCSS_DDI_STATUS(tc)			_MMIO(_PICK_EVE
> > N(tc, \
> >  								 _TCSS_
> > DDI_STATUS_1, \
> >  								 _TCSS_
> > DDI_STATUS_2))
> > +#define  TCSS_DDI_STATUS_CABLE_ATTR_SHIFT	9
> > +#define  TCSS_DDI_STATUS_CABLE_ATTR_MASK	REG_GENMASK(14, 9)
>=20
> This "cable attr" thing defines something that I think should not be
> used, a field in a register where you can't even use the other
> defines
> to parse. Please remove it, and replace with mask and values for
> CABLE_SPEED.
>=20
> This reflects the comment on cable_attributes parameter in
> intel_dp_set_cable_attributes().
>=20
> > +#define  TCSS_DDI_STATUS_ACTIVE_CABLE		REG_BIT(11)
> > +#define  TCSS_DDI_STATUS_CABLE_TYPE		REG_BIT(10)
> > +#define  TCSS_DDI_STATUS_RETIMER_REDRIVER	REG_BIT(9)
>=20
> Usually I promote following the spec for macro naming, but the above
> two
> are silly.
>=20
> I think the options are:
>=20
> 1) just define them for what they are:
>=20
> #define  TCSS_DDI_STATUS_CABLE_TYPE_OPTICAL	REG_BIT(10)
> #define  TCSS_DDI_STATUS_RETIMER		REG_BIT(9)
>=20
> 2) consider them reg fields:
>=20
> #define  TCSS_DDI_STATUS_CABLE_TYPE		REG_GENMASK(10, 10)
> #define  TCSS_DDI_STATUS_CABLE_TYPE_ELECTRICAL	REG_FIELD_PREP(
> TCSS_DDI_STATUS_CABLE_TYPE, 0)
> #define  TCSS_DDI_STATUS_CABLE_TYPE_OPTICAL	REG_FIELD_PREP(TCSS_DDI
> _STATUS_CABLE_TYPE, 1)
>=20
> #define  TCSS_DDI_STATUS_RETIMER_REDRIVER	REG_GENMASK(9, 9)
> #define  TCSS_DDI_STATUS_REDRIVER		REG_FIELD_PREP(TCSS_DDI
> _STATUS_RETIMER_REDRIVER, 0)
> #define  TCSS_DDI_STATUS_RETIMER		REG_FIELD_PREP(TCSS_DDI
> _STATUS_RETIMER_REDRIVER, 1)
>=20
> I think the latter is just too verbose, so I'd go for 1).
>=20
> >  #define  TCSS_DDI_STATUS_READY			REG_BIT(2)
> >  #define  TCSS_DDI_STATUS_HPD_LIVE_STATUS_TBT	REG_BIT(1)
> >  #define  TCSS_DDI_STATUS_HPD_LIVE_STATUS_ALT	REG_BIT(0)
> > diff --git a/include/drm/display/drm_dp.h
> > b/include/drm/display/drm_dp.h
> > index b046f79f4744..dde715d567c2 100644
> > --- a/include/drm/display/drm_dp.h
> > +++ b/include/drm/display/drm_dp.h
> > @@ -654,6 +654,13 @@
> >  # define DP_LANE13_POST_CURSOR2_SET_MASK    (3 << 4)
> >  # define DP_LANE13_MAX_POST_CURSOR2_REACHED (1 << 6)
> > =20
> > +#define DP_CABLE_ATTRIBUTES_UPDATED_BY_TX   0x110
>=20
> Please use _DPTX suffix like in the spec.
>=20
> /* 2.1 */ missing at the end.
>=20
> The UHBR capabilities bits should be defined here.
>=20
> > +# define DP_CABLE_TYPE_MASK		    (0x7 << 3)
> > +# define DP_CABLE_TYPE_UNKNOWN		    (0x0 << 3)
> > +# define DP_CABLE_TYPE_PASSIVE		    (0x1 << 3)
> > +# define DP_CABLE_TYPE_LRD_ACTIVE	    (0x2 << 3)
> > +# define DP_CABLE_TYPE_RETIMER_ACTIVE	    (0x3 << 3)
>=20
> The values could just be decimal instead of hex.
>=20
> > +
> >  #define DP_MSTM_CTRL			    0x111   /* 1.2 */
> >  # define DP_MST_EN			    (1 << 0)
> >  # define DP_UP_REQ_EN			    (1 << 1)
> > @@ -1139,6 +1146,8 @@
> >  # define
> > DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS             0x05
> >  # define
> > DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS             0x06
> > =20
> > +#define DP_CABLE_ATTRIBUTES_UPDATED_BY_RX               0x2217 /*
> > 2.1 */
>=20
> Please use _DPRX suffix like in the spec.
>=20
> > +
> >  #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
> >  #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250

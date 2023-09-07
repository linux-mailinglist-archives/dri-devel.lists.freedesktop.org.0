Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F72796ECC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 04:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FB310E74A;
	Thu,  7 Sep 2023 02:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B4D10E6A2;
 Thu,  7 Sep 2023 02:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694052401; x=1725588401;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SiAqmdjrf98IiXk9dNQeQFWGV0fjLKGzSBSB8xnyDCU=;
 b=Tmggqb7mABmyPsai6nVqNG7HQk5lQ0vfmANStOZPkWZAocsJIrpakAVy
 N1Zm8/V+bmKuJfT8kXvbBCP4/oMGnw7vL1LnK+y9rYP8oNJjO22UtfYwO
 bgMsuEDvGO6spZvY3fPm2ttb3bk+LNHGDDZxxNUy/yxunB1UpWtAd7Ld2
 36swaDjFdS+RUBuLC8B8Yl48GSHit+5VCXM+cRnVHYCXB6X284LGLgAOf
 H38P4rzsL24KJQdrwSzCCqFzImcU2DC/wNl/qqiuh4vagKQVNg1KRzDLu
 SAnsxsarrJ2eGuUaGJzodpz+xMHkSU04bQPAvJVLqSMVvj93DRqdes/wp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379946392"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="379946392"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 19:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865406929"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="865406929"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 19:05:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 19:05:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 19:05:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 19:05:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 19:05:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKBKdhOuCQBxz8lw1R3f+WqUiybAZBPRRj7SSJ9le2fK0iEnVJ5gmELDApIsK1U2rf1KTJl7jChOyxBr+MZ7IBSsGbcqvNO+io1Ih96p8LeYGmO2JsYpYPfl95AoH4xO4+ThPgBAlYOKobxYK/bOIcUpO+Q0I7AgGIlqtSOwZ1z4IVrikSkA2SJ85AcrzrRVc8+owsO+zho99flOl6+P2kcvxg6Bdt0fAdxVn3FEQ7JFO9jwGyKGDgFJy0Y/eVmjths8ddoCJxuU8pBXgN7CIW05Wg32ILyGuQ8+F4F2jwLPaxT2jfodeAHm55z+BYYDE9eOPSDLjPH/0xL+7zm5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC+LL3do1ZiC1EGcs6swe5xhVugtWQ97VYSOFZwvXW0=;
 b=PLj2fPQmlceiKaW81O24Mi99J9eutlHhFcNv/yuXq1X32jJdKdM6mg/0z5HTtilm1ofUmd7tNPmx3f2BCDpRlDjvbZK8psR7AsZfP5Iw2mjEnwKodtlOHOn7kIywhAPYs6WLIt0J9EhjaDo7Wb8ayK2mXznxMa2HOEntOJQNfnPRo0LWn3WIfXKNmtGehFr7+5+Fe3/sP4YzqD4MW1AYHVjTsJXM1LsqdF1nJ0oaoM+MJRu6yhOMc6iDBnrlRFP1R6YaVurcWHBqkDOPWDK7Fk4BZQI29B65cgRTNktm212al6YIjzibae6djbylELW+bpaDkGPQIOe89KLOb5teuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Thu, 7 Sep
 2023 02:05:38 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::8934:bc24:bf8a:2316]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::8934:bc24:bf8a:2316%3]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 02:05:37 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/mtl: Drop force_probe requirement
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/mtl: Drop force_probe requirement
Thread-Index: AQHZ4DCcTmpTfsrwd0ipJ1N4APhCrLANh8yAgABO9wCAAMR5EA==
Date: Thu, 7 Sep 2023 02:05:37 +0000
Message-ID: <DM4PR11MB5971613E92C6F4949746310887EEA@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230905193624.525020-1-radhakrishna.sripada@intel.com>
 <ZPhFj0H8OYtp1CGh@ashyti-mobl2.lan> <ZPiHzDymgI+kMRMc@intel.com>
In-Reply-To: <ZPiHzDymgI+kMRMc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|SJ1PR11MB6178:EE_
x-ms-office365-filtering-correlation-id: d28eaa4b-317b-4ad5-62c9-08dbaf46edde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LT37ZjSulwBZjAHk4rHdSFYJvhFYGzLM65gzRZpLusi64/SaJdzXQ8//gelBKPYoalLacHmDDmiDMuG/tQej1ECC1cEMYz2B99PqRzVbDC7EWxX3FCF83+/P0iOuqtv0WVBCQeJDc1VZ5XOq2JkNolWCRnWJjpEdADoV/HrV3UTISSOYRoQidgNIxWuqRIer8SWiSv9NutPNJVK7694pGOejGTv6SjOgWB1EZikk7yGfA8TuXcRH2uZNHGDKaNQrc620J9YgpC91M+GE/ilDQ20BeYl3LiPAgkQAAIUsROgjrl/cJcyjedO1mWlvSgq1VSknzqD/BC07LfroqQfuI8w3qNaVf0T866qGwjpd19R/IL5gdPuHo25U+p7uPbELfUwDBEGJIodRUZ7y+sDxfH8E+XKyODuVV6DJdslAsmZjMunXzjtTS/ry8leeYsALWLrunOWHNzOdi7dbx8vCpVtz4H634jNCwumKCMzIc/sb8tCnfB2YYAfE/mmAX0FCvjVYIU3NG3q/x4zSxyEa01mjJdYM28e8p3S7vYAIBgavdc67g7wXsscuqZscwIvw3JBm7oPn1pmkxgPzm20PBAqwsL8Yj5vA5R6vHj/nUcs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(53546011)(5660300002)(26005)(66476007)(66446008)(64756008)(9686003)(66946007)(54906003)(316002)(6506007)(110136005)(76116006)(7696005)(66556008)(41300700001)(55016003)(122000001)(52536014)(71200400001)(8936002)(4326008)(8676002)(478600001)(83380400001)(966005)(2906002)(86362001)(38100700002)(33656002)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?92wUaPzjGr4pkL5SGArLFhPjpW9LBMTVCHI0WMtANkw3Lfb/VHhJWLZS8iMv?=
 =?us-ascii?Q?Cb+Lz7M/ubQ42uWjtM6mo0AkJeJRB1YdiylC3gXI5P6s+bgu27fZA/5w/cPT?=
 =?us-ascii?Q?h+Wi8WoQxCMsDRy6Wvue9sQW8G+GQiZqINV65PlQN97DmBoWBK+C5MxrN5eb?=
 =?us-ascii?Q?GUFea1TlvEnInpdVYuxbGv9ZYfRxugiYsrDqhDxoNqO0DnJbhrrBo+3Rgf+y?=
 =?us-ascii?Q?SLbe8wPH9vFI0bdgb+DHXqS4NEezhIBfLaqn5cN5H7GTN9UKsedhWWaFAd8Z?=
 =?us-ascii?Q?CN4mlODoBDy26Pml/O5J2t6x4qqtwkru6mi2dqy2IM0FMPePHQfIuCb1/7xC?=
 =?us-ascii?Q?ph2W9y2AlnS3QSvr6LUbczLnnLJeUNmJCC/soiVxqC9zAWNT2Wn9099Xiqmt?=
 =?us-ascii?Q?QM2Z3zdETdmJQcgSJ1SKbSUTjQFkEF+NjRl+A12FnUgcXJNTvf/LXolJPdZ6?=
 =?us-ascii?Q?7XGU5VICANXacHCAxp0/TA5CjuW//P+p+TWaD6Wg7J6JByhgZ36Xgi2GCwQN?=
 =?us-ascii?Q?b4ITtowQv9woRssqcNa1IOf5j5VfUaFaKxdKBXtbZq7lKHWOo7MuZ8uMiLYs?=
 =?us-ascii?Q?X5RqkTJg+ApeK1oey7DuyyV+u4O7GXizLURe/NdB9k4Dwge5J4rLVORPO+Pe?=
 =?us-ascii?Q?oPPmRaLGyITmEMOIuXFCTU+grOptNWUMCQ4Md+DeMAJA0ONUosP5li7217Zg?=
 =?us-ascii?Q?HTAYTsxMGS+VuivilJMy0nnvKnYvO9wNBiLBjxUC8nIdbMyfobJfa17+PIVL?=
 =?us-ascii?Q?/Wz8h4gVhhdx1UcD3d2mb5vbSYkFbUNiZFZvaA32HW/NekQnBSHCl6iT+RfU?=
 =?us-ascii?Q?7p0LKYFi7TT58Zq509k/j1MmuXYyAtkc6CfDcPedtpARUeOeRfXuB5TwseiR?=
 =?us-ascii?Q?5jRe5Utjxb1oqOgrBLbQax3l199Iq/2l4UX9FlUTYOh20JUz/a+TVeYL+QdJ?=
 =?us-ascii?Q?GrXj7+55v2pYqifqTMqW0/iwW9ciIjW3iGdh2CsVoUChFF7tLTi7UFGiDuN/?=
 =?us-ascii?Q?zuDjxL+kA39dkFBEOHKcg/Mb52mUQybjCKKQSQKbYg8gcT3MWXZuNJ/6CfVL?=
 =?us-ascii?Q?Gw76ehVVYB2NccXtnsOL4Sb2OmMOFwJSfK6rePKEil5BCJv7OEbRR0O7lOxA?=
 =?us-ascii?Q?5Ej0A8N02f3TVhsjgVaDrSLW9MiY5o47sIvEWESy7BY0uEwMb14YWKRBuJS9?=
 =?us-ascii?Q?v1zwNn0H2vw7eZhwXxo3z1WJy/jEawKvbvmEFWChb5QJ2myC1Zh+22LLVR1D?=
 =?us-ascii?Q?hQfcPQhR4AcpGzAUuVpvnvYVzOJK/APMCxuQpXojNiaH3gXjcGRK4KAT0U3+?=
 =?us-ascii?Q?F0Wb/sA7wSLbiyLgrMEOo3vaCzS+wSEaKxbD/mqlznn+s5SvZ839ICIFOjiS?=
 =?us-ascii?Q?RDFxg5sDWIMKAv/WswHWOS2foI5kH6i0YM9sZgoQ9iR4NrJ3XpRtU6slyQrR?=
 =?us-ascii?Q?ULv0XdRNm0Zj0YdlXYH8lPyhEfvMmiUtp2TrrQkO6rBEgW8T7VXAhUUxlBW4?=
 =?us-ascii?Q?3m/PhJ5cHXYzcn04P1cTD5OcsQxSR4w1xoAecrfOYADT5ISI73IFcYkubtjm?=
 =?us-ascii?Q?wB6F9p6EpQKn1RNN/tEPFKjW+rlozf1yh7B7HHeox1KBv2GfUTkBMnuBCVmq?=
 =?us-ascii?Q?sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28eaa4b-317b-4ad5-62c9-08dbaf46edde
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 02:05:37.6475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3spTDEz4GDKNNhFopdR3izpWkwySoNhqA5yhygZ+UGWIXOq54L/Ch7tsN4fDDdc2nrGH4ZUVrhvaAuyTmWu+3krW1CCuonsTlfMGw803XDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo/Andi,

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, September 6, 2023 7:38 PM
> To: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Drop force_probe requireme=
nt
>=20
> On Wed, Sep 06, 2023 at 11:25:35AM +0200, Andi Shyti wrote:
> > Hi Radhakrishna,
> >
> > On Tue, Sep 05, 2023 at 12:36:24PM -0700, Radhakrishna Sripada wrote:
> > > Meteorlake has been very usable for a while now, all of uapi changes
> > > related to fundamental platform usage have been finalized and all
> > > required firmware blobs are available. Recent CI results have also
> > > been healthy, so we're ready to drop the force_probe requirement and
> > > enable the platform by default.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> >
> > Please keep me in the loop as well... It's been a year I've been
> > working for this patch to work :)
Sure will do.

> >
> > > ---
> > >  drivers/gpu/drm/i915/i915_pci.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_pci.c
> b/drivers/gpu/drm/i915/i915_pci.c
> > > index df7c261410f7..fe748906c06f 100644
> > > --- a/drivers/gpu/drm/i915/i915_pci.c
> > > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > > @@ -836,7 +836,6 @@ static const struct intel_device_info mtl_info =
=3D {
> > >  	.has_pxp =3D 1,
> > >  	.memory_regions =3D REGION_SMEM | REGION_STOLEN_LMEM,
> > >  	.platform_engine_mask =3D BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> > > -	.require_force_probe =3D 1,
> >
> > What's the thinking behind this patch? Are you trying to
> > understand how CI behaves?
>=20
> CI uses kernel config to force_probe. MTL is already being tested there.
> Also there's no 'CI' or 'HAX' tag on this patch.
> So I would assume this is the ask to remove the protection.
> But based on this question from Andi and knowing that he is working on
> the MTL w/a I'm assuming that this is not the right time yet to remove
> this protection.
>=20
> Please ensure all the diligence is taken before sending this patch again.
>=20
> Also ensure that the current CI failures are fixed (gt_pm and gt_engines)
> and that CI has a stable green picture.

Sure Rodrigo. I believe the changes in https://patchwork.freedesktop.org/se=
ries/123329/
are significant enough to not remove force_probe at this time.

Will wait for a later time till CI comes clean.

Thanks,
Radhakrishna
>=20
> Thanks,
> Rodrigo.
>=20
> >
> > Andi
> >
> > >  	MTL_CACHELEVEL,
> > >  };
> > >
> > > --
> > > 2.34.1

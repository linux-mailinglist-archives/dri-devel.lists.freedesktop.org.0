Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DCA44E614
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70DD6EC04;
	Fri, 12 Nov 2021 12:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBECA6EC04;
 Fri, 12 Nov 2021 12:06:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="213848880"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="213848880"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 04:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="453042858"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 12 Nov 2021 04:06:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 12 Nov 2021 04:06:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 12 Nov 2021 04:06:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 12 Nov 2021 04:06:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbI7Q3qpJRCRjmP38Lo3YCnodYKT1IORfN58DGQMWILPFGJ7ujYEpTu0nNZIKFj5xhQcaGodbzq3Oly/NhRT3XOFKrp+9guRSVPbIhKe63yiyRvewPc8Cg0oSAQ7rltCVdSJ5t2W5U/R5vsAz508PXAPy87OaLhTmFo6TuCl13eU+c0IbqhtxoFRMgC7cxkNYlbRoikL24eb5Jmu0kxzkMSebwRb7n+DtwUMsZujmFsb2vGiAT7Vrb6ZhWS1vYLia4GY1CBNcDYHOwa+iJbM1qctGrINm8FhtlhY/Fc88aJNocdkaiT7CG+VHQwFHL8qDeU7mYc4dKdXtXGQA56//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LmaPgCXCTwrqr6Fmey05rfspcFfhSWvkcGbpFrCp/s=;
 b=RPz3IfVXnY/EIq5Y8FQ/0vCoIHVldf/cLckrXqYyo2pwgncfGkvaN6xHbkIIR94qw8viOxATQvZ6b6bDCiTCSNw/7jKfexQt1O+vHbGBeGwS6u3mJW0xypdYYwKOXpuJsODQtqjsyDSIcxh5SMctOFztmV30q3zRVDQFOVQXAjDqToTjmnavGW2D0h90Njh/3x8lejxcHJSmHz5JODCbpZarPdCHwKJ2HnehsOzSlFcUVIktWSQYsXZIr3eaIohXNdeS2xUGS0dMcn6q/06kNcG/PeLIEvaw45owAExvvnR7S6F0ztIeUfNbKueapilSYwkPbyGzEYxqMk2mVyL9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LmaPgCXCTwrqr6Fmey05rfspcFfhSWvkcGbpFrCp/s=;
 b=FZfCbGdk8f8vjg+GtU2j0fh4/D0O+6ftOo+uiDyf9s44zZqGNPbU9ba6+p6LPjTmkVAKQqOIK5rVCZ+5rDvSgY0JHpeK6q54/kJ1g6u/h5xpFgPsPXKTYr5TK83kHW04Rk3hbV/YzYaOz2anOkIdJNoat76/V2y+sQh6uD/BRKQ=
Received: from CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21)
 by CO6PR11MB5570.namprd11.prod.outlook.com (2603:10b6:303:138::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Fri, 12 Nov
 2021 12:05:36 +0000
Received: from CO6PR11MB5636.namprd11.prod.outlook.com
 ([fe80::611a:91c5:a055:69e3]) by CO6PR11MB5636.namprd11.prod.outlook.com
 ([fe80::611a:91c5:a055:69e3%9]) with mapi id 15.20.4669.011; Fri, 12 Nov 2021
 12:05:36 +0000
From: "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
To: "Latvala, Petri" <petri.latvala@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [Intel-gfx] [PATCH 2/3] drm/i915/dg2: Add initial gt/ctx/engine
 workarounds
Thread-Topic: [Intel-gfx] [PATCH 2/3] drm/i915/dg2: Add initial gt/ctx/engine
 workarounds
Thread-Index: AQHX17ctaoSwtmQ9w0euzOJVGVgEPKv/yRPw
Date: Fri, 12 Nov 2021 12:05:36 +0000
Message-ID: <CO6PR11MB5636C48DCB1105E76244D184DE959@CO6PR11MB5636.namprd11.prod.outlook.com>
References: <20211102222511.534310-1-matthew.d.roper@intel.com>
 <20211102222511.534310-3-matthew.d.roper@intel.com>
 <YY5Ne7HtlWFcVHp1@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YY5Ne7HtlWFcVHp1@platvala-desk.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75d7f1e5-d1fb-4450-8384-08d9a5d4bcb2
x-ms-traffictypediagnostic: CO6PR11MB5570:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO6PR11MB557018F70CE38BBBE26EA432DE959@CO6PR11MB5570.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JaYWngBZfMqtWjMPVjZvjQ39PCBCEC3GPSZ31deqXgP2lGlmh+qclTU0eKSUO8K552O4ZrhnLgLERybrwKo1mCsTQWzWw+liF312FWpnPQwZdwZt8HqWaQ8dRqm00IEoiX6InJazWQpde2nn+JTZVeR8cIKmQmrs3YipS1AXGXCwgkEoIY7Qrv6vYCVweAjADEid4XNwl5iOG+mbm3cY+OsjyP0s3NOSrRDFVWEfKFiA+OOJMQGGXxitTrFESz75rqCWG9R3IOnlGexrIf62nIHj0sNMYiCNNRNa6Pfda0A8mY42mOouuyWmOwU77xj/D6sml1ksDyQK1ruK4E8GmSowuz4VC/4mGdJvEL+l72e9zHXRWZ6a6GqmA33MlDH9yxSoTDe2aErHfEftK2d7vPJZuOMOHcT4xjrzEPZhpW09lPkynafbI0eznwitzXCCI+SNMw4br4Jx5txHxhptfH5CJzKKuN4kkm6c6Df4UQ20dQrsFyMkBBLYkF7kwOrONN4SXU+m5pekNOT6AqT0rtmcMZHilWLyFAvHkbJpgFHzPWjvBjVPFV4Yj3s3Oqg/bd7uu4NnTT4AvnNU/s+iyR59rM278ii9VD2dTu/Sn8tVwJQ7ZO03LCbY7ZFHtL7Vc/1jILQ3ZjL4RPUgGS9izOEWJ3U4zswfnYVhP7PM7MSdvMZsc8E1wT0p9HcrT284nXYb+5hysWbj2XVdGcfSKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(30864003)(38070700005)(54906003)(8676002)(52536014)(122000001)(38100700002)(186003)(6506007)(66574015)(83380400001)(8936002)(26005)(966005)(55016002)(7696005)(5660300002)(9686003)(76116006)(82960400001)(33656002)(4326008)(6636002)(110136005)(2906002)(66946007)(86362001)(66476007)(66556008)(66446008)(316002)(450100002)(64756008)(71200400001)(508600001)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XWA0hdFvPdPPLiJMe1M+hWfPdYjst1081gxsL5KsN1l9iwWlL79zqkRAYzST?=
 =?us-ascii?Q?mYCFzKUZ92FkRdgqf9cIJrkiVEl28hATNgi2q9KdreRThg8KTTu4dAfIELXr?=
 =?us-ascii?Q?sOrpoK6WPch/OyjhHz/eAjc6Hd6gja7bdxJ8qAdBHvzh/9krwnjZyglth4UB?=
 =?us-ascii?Q?x8jsQrW70KchRz5VPQIlKuwS+Qa/5WJCkhzwwJKH7YboWvcuIP6ckHHaqEe6?=
 =?us-ascii?Q?lKQR1mqAA/nhMmHTZA+sDbltEUyA+DnUi7blrAq1WPVowk+x75DDV1+pnKOr?=
 =?us-ascii?Q?VceXXnHU/qYdzfRX8NsuDVZ8fafx77m0TtBG1LbbW9h5ALWLT8bOIILhiwVt?=
 =?us-ascii?Q?yHlNBftaOoWG8wBxVoYi8WYQTIJeEE5JCinDA4KBt1iHn4ZEbjWKZOMptqyf?=
 =?us-ascii?Q?TLvKR6xomA5A62IqL46j+bPjH/DPZUfcc0lvJ5SIGOEolDDQ+0/FVa+mRPGe?=
 =?us-ascii?Q?zY8cuoPyVCWix7WJDtIGH4NoFRLOG8dh6s8MIvlFhMMADHChIVKxTSyr9Ez8?=
 =?us-ascii?Q?OF6QiJ4Sy/X3+B0yP0tTco80DMUx/CFp5boiegGcSe3bik1JGnGY8oUGScuv?=
 =?us-ascii?Q?KibQ4m/UDSVeLr+9YF47bzFrOIwIqxytZQMsLEAbYHbUqR4xoy+LFB9eKczg?=
 =?us-ascii?Q?5vyMpk3aJ2NnYD4STK9Z+yp9p/yFwT0U0gPnhyoyxVvdcpPikrDA7+hmpKWY?=
 =?us-ascii?Q?u9MSg/XEfllB5YRMy1YHA6RJTeqNuEkyMqCZW+i7AvOJJL2NpavDlxZvW8Fa?=
 =?us-ascii?Q?oye2sCC/r34w0H99MJM95KC2rfaA7Pio7UNWMgxT33PgM4Sa4cNu/Dt2LjTy?=
 =?us-ascii?Q?QLTYqJUOgW5my1GhGihb7sYWzRQ+mwsZpOofClKpoo8MJ/FWCzkzSK1jwx+3?=
 =?us-ascii?Q?7ucbrdUOYp+1+2QBjTOJpMh+XwecUSEyNm+5+C23V2gJDElWiNnMujcneH1v?=
 =?us-ascii?Q?mSpwNi4QL8r6acEdYwWVGtl56KSYdisa/iEEzW92xVo7JNBzyuuGxlpBGZMG?=
 =?us-ascii?Q?5zRD/dEPJ2O3B/01pLzKo0fsCZsBBqPn6Vob1/zn+83FRuTYOFirgxlGb1gX?=
 =?us-ascii?Q?bLfsTMWkPKs6FNM2LfF004KcDV8jx+QnaC31JaJ+WdpgYjnJYC2LblYpiSSy?=
 =?us-ascii?Q?yCskGg+7l2/DFl55w3wYPy/sNoAde0gI6O1IjFH0JCg4Z0rcRksYmG2L3L8Q?=
 =?us-ascii?Q?Xeoo8Ok1Bjm5Qa2WSVDQTHad1V9BTbRgz6XctMIjINWYSSEty2L1kJxMo2YA?=
 =?us-ascii?Q?XEAAzR3SZS5Ct6HRRhexITZNHKZvA20rJyU6HWKWTnxulNCjq/crazX/6Uk1?=
 =?us-ascii?Q?G9r3VqrIXA5tITh2HjsBmAr6u3Rh9MWcdTMeExTxJEPpsyNILmdS6Nkd4443?=
 =?us-ascii?Q?vUvLrddY6jOKkS55B9ayv8k4aFR5KG+23FvBWt2wT51fCFB3954RtZk2+byN?=
 =?us-ascii?Q?6+KOW+5fpU1S0HrzDRxRkkrPBVvOkTjvfZRFUgUOJAl5wJydeDTieQSNwMgY?=
 =?us-ascii?Q?pvVB0k88ZB3P1vOcKTlXOBAoj2DXMTHpwYuX9U2c+eHHdRRsDNEjLuoLZwR0?=
 =?us-ascii?Q?NiUIb1N/MopWDEKJLX/q3FF3uzTGKJ6dsyZ1xb97wNTODRZ992jDw+nM+ZkE?=
 =?us-ascii?Q?TOfKnsRRQxFOznwiIfM03sFctRms9/9T+3QPGifBubVaE50iBdZqCM555h5H?=
 =?us-ascii?Q?zRGP6Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d7f1e5-d1fb-4450-8384-08d9a5d4bcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 12:05:36.5647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KUnhh4TpJ0IPyMVyXunHRvSVehU41zrTRgP75Q/JWMLBJanGX0/ozJEuReOlIeio4hbkQFz1XStcyRVAiaQAMucKXDwqZ/LRILXo0Jh1ezA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5570
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

This issue was not catched by CI, because of series of unfortunate events.

Before, CI has rebooted without module blocklist, and CI catched boot-time
dmesg correctly and marked it as 'ci@boot' test with failure if there was a=
 taint.

I've been doing changes to make blocklisting i915 possible and load it as
the first test of IGT: that'd make possible to remove some workarounds
and integrate the result better on our framework.

The test to decide if i915 should be modprobed was slightly off, and
on these runs where i915 failed to load in boot, it was modprobed again,
and modprobe hanged because of existing i915. Results were not collected.

I've added the condition to the conditional modprobe, and the results
from failed boot-time modprobe should be soon available as before,
eg. CI_DRM_10873 later shards with SNB.

Regards,

Tomi

> From: Latvala, Petri <petri.latvala@intel.com>
> On Tue, Nov 02, 2021 at 03:25:10PM -0700, Matt Roper wrote:
> > Bspec: 54077,68173,54833
> > Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 278
> +++++++++++++++++++-
> >  drivers/gpu/drm/i915/i915_reg.h             |  94 +++++--
> >  drivers/gpu/drm/i915/intel_pm.c             |  21 +-
> >  3 files changed, 372 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index 4aaa210fc003..37fd541a9719 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -644,6 +644,42 @@ static void dg1_ctx_workarounds_init(struct
> intel_engine_cs *engine,
> >
> DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
> >  }
> >
> > +static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
> > +				     struct
> i915_wa_list *wal)
> > +{
> > +	gen12_ctx_gt_tuning_init(engine, wal);
> > +
> > +	/* Wa_16011186671:dg2_g11 */
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0,
> STEP_B0)) {
> > +		wa_masked_dis(wal, VFLSKPD,
> DIS_MULT_MISS_RD_SQUASH);
> > +		wa_masked_en(wal, VFLSKPD,
> DIS_OVER_FETCH_CACHE);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0,
> STEP_B0)) {
> > +		/* Wa_14010469329:dg2_g10 */
> > +		wa_masked_en(wal,
> GEN11_COMMON_SLICE_CHICKEN3,
> > +
> XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
> > +
> > +		/*
> > +		 * Wa_22010465075:dg2_g10
> > +		 * Wa_22010613112:dg2_g10
> > +		 * Wa_14010698770:dg2_g10
> > +		 */
> > +		wa_masked_en(wal,
> GEN11_COMMON_SLICE_CHICKEN3,
> > +
> GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
> > +	}
> > +
> > +	/* Wa_16013271637:dg2 */
> > +	wa_masked_en(wal, SLICE_COMMON_ECO_CHICKEN1,
> > +
> MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
> > +
> > +	/* Wa_22012532006:dg2 */
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0,
> STEP_C0) ||
> > +	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0,
> STEP_B0))
> > +		wa_masked_en(wal,
> GEN9_HALF_SLICE_CHICKEN7,
> > +
> DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
> > +}
> > +
> >  static void fakewa_disable_nestedbb_mode(struct intel_engine_cs
> *engine,
> >
> struct i915_wa_list *wal)
> >  {
> > @@ -730,7 +766,9 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs
> *engine,
> >  	if (engine->class !=3D RENDER_CLASS)
> >  		goto done;
> >
> > -	if (IS_XEHPSDV(i915))
> > +	if (IS_DG2(i915))
> > +		dg2_ctx_workarounds_init(engine, wal);
> > +	else if (IS_XEHPSDV(i915))
> >  		; /* noop; none at this time */
> >  	else if (IS_DG1(i915))
> >  		dg1_ctx_workarounds_init(engine, wal);
> > @@ -1343,12 +1381,117 @@ xehpsdv_gt_workarounds_init(struct intel_gt
> *gt, struct i915_wa_list *wal)
> >  		    GLOBAL_INVALIDATION_MODE);
> >  }
> >
> > +static void
> > +dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> > +{
> > +	struct intel_engine_cs *engine;
> > +	int id;
> > +
> > +	xehp_init_mcr(gt, wal);
> > +
> > +	/* Wa_14011060649:dg2 */
> > +	wa_14011060649(gt, wal);
> > +
> > +	/*
> > +	 * Although there are per-engine instances of these registers,
> > +	 * they technically exist outside the engine itself and are not
> > +	 * impacted by engine resets.  Furthermore, they're part of the
> > +	 * GuC blacklist so trying to treat them as engine workarounds
> > +	 * will result in GuC initialization failure and a wedged GPU.
> > +	 */
> > +	for_each_engine(engine, gt, id) {
> > +		if (engine->class !=3D VIDEO_DECODE_CLASS)
> > +			continue;
> > +
> > +		/* Wa_16010515920:dg2_g10 */
> > +		if (IS_DG2_GRAPHICS_STEP(gt->i915, G10,
> STEP_A0, STEP_B0))
> > +			wa_write_or(wal,
> VDBOX_CGCTL3F18(engine->mmio_base),
> > +
> ALNUNIT_CLKGATE_DIS);
> > +	}
> > +
> > +	if (IS_DG2_G10(gt->i915)) {
> > +		/* Wa_22010523718:dg2 */
> > +		wa_write_or(wal,
> UNSLICE_UNIT_LEVEL_CLKGATE,
> > +			    CG3DDISCFEG_CLKGATE_DIS);
> > +
> > +		/* Wa_14011006942:dg2 */
> > +		wa_write_or(wal,
> SUBSLICE_UNIT_LEVEL_CLKGATE,
> > +			    DSS_ROUTER_CLKGATE_DIS);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0))
> {
> > +		/* Wa_14010680813:dg2_g10 */
> > +		wa_write_or(wal, GEN12_GAMSTLB_CTRL,
> CONTROL_BLOCK_CLKGATE_DIS |
> > +			    EGRESS_BLOCK_CLKGATE_DIS |
> TAG_BLOCK_CLKGATE_DIS);
> > +
> > +		/* Wa_14010948348:dg2_g10 */
> > +		wa_write_or(wal, UNSLCGCTL9430,
> MSQDUNIT_CLKGATE_DIS);
> > +
> > +		/* Wa_14011037102:dg2_g10 */
> > +		wa_write_or(wal, UNSLCGCTL9444,
> LTCDD_CLKGATE_DIS);
> > +
> > +		/* Wa_14011371254:dg2_g10 */
> > +		wa_write_or(wal, SLICE_UNIT_LEVEL_CLKGATE,
> NODEDSS_CLKGATE_DIS);
> > +
> > +		/* Wa_14011431319:dg2_g10 */
> > +		wa_write_or(wal, UNSLCGCTL9440,
> GAMTLBOACS_CLKGATE_DIS |
> > +			    GAMTLBVDBOX7_CLKGATE_DIS
> |
> > +			    GAMTLBVDBOX6_CLKGATE_DIS
> |
> > +			    GAMTLBVDBOX5_CLKGATE_DIS
> |
> > +			    GAMTLBVDBOX4_CLKGATE_DIS
> |
> > +			    GAMTLBVDBOX3_CLKGATE_DIS
> |
> > +			    GAMTLBVDBOX2_CLKGATE_DIS
> |
> > +			    GAMTLBVDBOX1_CLKGATE_DIS
> |
> > +			    GAMTLBVDBOX0_CLKGATE_DIS
> |
> > +			    GAMTLBKCR_CLKGATE_DIS |
> > +			    GAMTLBGUC_CLKGATE_DIS |
> > +			    GAMTLBBLT_CLKGATE_DIS);
> > +		wa_write_or(wal, UNSLCGCTL9444,
> GAMTLBGFXA0_CLKGATE_DIS |
> > +			    GAMTLBGFXA1_CLKGATE_DIS |
> > +
> GAMTLBCOMPA0_CLKGATE_DIS |
> > +
> GAMTLBCOMPA1_CLKGATE_DIS |
> > +
> GAMTLBCOMPB0_CLKGATE_DIS |
> > +
> GAMTLBCOMPB1_CLKGATE_DIS |
> > +
> GAMTLBCOMPC0_CLKGATE_DIS |
> > +
> GAMTLBCOMPC1_CLKGATE_DIS |
> > +
> GAMTLBCOMPD0_CLKGATE_DIS |
> > +
> GAMTLBCOMPD1_CLKGATE_DIS |
> > +			    GAMTLBMERT_CLKGATE_DIS   |
> > +			    GAMTLBVEBOX3_CLKGATE_DIS
> |
> > +			    GAMTLBVEBOX2_CLKGATE_DIS
> |
> > +			    GAMTLBVEBOX1_CLKGATE_DIS
> |
> > +
> GAMTLBVEBOX0_CLKGATE_DIS);
> > +
> > +		/* Wa_14010569222:dg2_g10 */
> > +		wa_write_or(wal,
> UNSLICE_UNIT_LEVEL_CLKGATE,
> > +			    GAMEDIA_CLKGATE_DIS);
> > +
> > +		/* Wa_14011028019:dg2_g10 */
> > +		wa_write_or(wal, SSMCGCTL9530,
> RTFUNIT_CLKGATE_DIS);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0)
> ||
> > +	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_B0))
> {
> > +		/* Wa_14012362059:dg2 */
> > +		wa_write_or(wal, GEN12_MERT_MOD_CTRL,
> FORCE_MISS_FTLB);
> > +	}
> > +
> > +	/* Wa_1509235366:dg2 */
> > +	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> INVALIDATION_BROADCAST_MODE_DIS |
> > +		    GLOBAL_INVALIDATION_MODE);
> > +
> > +	/* Wa_14014830051:dg2 */
> > +	wa_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
> > +}
> > +
> >  static void
> >  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
> >  {
> >  	struct drm_i915_private *i915 =3D gt->i915;
> >
> > -	if (IS_XEHPSDV(i915))
> > +	if (IS_DG2(i915))
> > +		dg2_gt_workarounds_init(gt, wal);
> > +	else if (IS_XEHPSDV(i915))
> >  		xehpsdv_gt_workarounds_init(gt, wal);
> >  	else if (IS_DG1(i915))
> >  		dg1_gt_workarounds_init(gt, wal);
> > @@ -1739,6 +1882,34 @@ static void xehpsdv_whitelist_build(struct
> intel_engine_cs *engine)
> >  	allow_read_ctx_timestamp(engine);
> >  }
> >
> > +static void dg2_whitelist_build(struct intel_engine_cs *engine)
> > +{
> > +	struct i915_wa_list *w =3D &engine->whitelist;
> > +
> > +	allow_read_ctx_timestamp(engine);
> > +
> > +	switch (engine->class) {
> > +	case RENDER_CLASS:
> > +		/*
> > +		 * Wa_1507100340:dg2_g10
> > +		 *
> > +		 * This covers 4 registers which are next to one
> another :
> > +		 *   - PS_INVOCATION_COUNT
> > +		 *   - PS_INVOCATION_COUNT_UDW
> > +		 *   - PS_DEPTH_COUNT
> > +		 *   - PS_DEPTH_COUNT_UDW
> > +		 */
> > +		if (IS_DG2_GRAPHICS_STEP(engine->i915, G10,
> STEP_A0, STEP_B0))
> > +			whitelist_reg_ext(w,
> PS_INVOCATION_COUNT,
> > +
> RING_FORCE_TO_NONPRIV_ACCESS_RD |
> > +
> RING_FORCE_TO_NONPRIV_RANGE_4);
> > +
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> >  void intel_engine_init_whitelist(struct intel_engine_cs *engine)
> >  {
> >  	struct drm_i915_private *i915 =3D engine->i915;
> > @@ -1746,7 +1917,9 @@ void intel_engine_init_whitelist(struct
> intel_engine_cs *engine)
> >
> >  	wa_init_start(w, "whitelist", engine->name);
> >
> > -	if (IS_XEHPSDV(i915))
> > +	if (IS_DG2(i915))
> > +		dg2_whitelist_build(engine);
> > +	else if (IS_XEHPSDV(i915))
> >  		xehpsdv_whitelist_build(engine);
> >  	else if (IS_DG1(i915))
> >  		dg1_whitelist_build(engine);
> > @@ -1826,6 +1999,105 @@ static void
> >  rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list
> *wal)
> >  {
> >  	struct drm_i915_private *i915 =3D engine->i915;
> > +	u64 dss_mask =3D intel_sseu_get_subslices(&engine->gt-
> >info.sseu, 0);
>=20
> fi-snb-2600:
>=20
> https://paste.debian.net/1219275
>=20
> [    4.348876] intel_sseu_get_subslices:39 GEM_BUG_ON(slice >=3D sseu-
> >max_slices)
>=20
>=20
>=20
> --
> Petri Latvala
>=20
>=20
>=20
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0,
> STEP_B0)) {
> > +		/* Wa_14013392000:dg2_g11 */
> > +		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> GEN12_ENABLE_LARGE_GRF_MODE);
> > +
> > +		/* Wa_16011620976:dg2_g11 */
> > +		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW,
> DIS_CHAIN_2XSIMD8);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0,
> STEP_B0) ||
> > +	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0,
> STEP_B0)) {
> > +		/* Wa_14012419201:dg2 */
> > +		wa_masked_en(wal, GEN9_ROW_CHICKEN4,
> > +
> GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0,
> STEP_C0) ||
> > +	    IS_DG2_G11(engine->i915)) {
> > +		/*
> > +		 * Wa_22012826095:dg2
> > +		 * Wa_22013059131:dg2
> > +		 */
> > +		wa_write_clr_set(wal,
> LSC_CHICKEN_BIT_0_UDW,
> > +
> MAXREQS_PER_BANK,
> > +
> REG_FIELD_PREP(MAXREQS_PER_BANK, 2));
> > +
> > +		/* Wa_22013059131:dg2 */
> > +		wa_write_or(wal, LSC_CHICKEN_BIT_0,
> > +
> FORCE_1_SUB_MESSAGE_PER_FRAGMENT);
> > +	}
> > +
> > +	/* Wa_1308578152:dg2_g10 when first gslice is fused off */
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0,
> STEP_C0) &&
> > +	    (dss_mask & GENMASK(GEN_DSS_PER_GSLICE - 1, 0)) =3D=3D 0)
> {
> > +		wa_masked_dis(wal,
> GEN12_CS_DEBUG_MODE1_CCCSUNIT_BE_COMMON,
> > +
> GEN12_REPLAY_MODE_GRANULARITY);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0,
> STEP_FOREVER) ||
> > +	    IS_DG2_G11(engine->i915)) {
> > +		/* Wa_22013037850:dg2 */
> > +		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW,
> > +
> DISABLE_128B_EVICTION_COMMAND_UDW);
> > +
> > +		/* Wa_22012856258:dg2 */
> > +		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> > +
> GEN12_DISABLE_READ_SUPPRESSION);
> > +
> > +		/*
> > +		 * Wa_22010960976:dg2
> > +		 * Wa_14013347512:dg2
> > +		 */
> > +		wa_masked_dis(wal, GEN12_HDC_CHICKEN0,
> > +
> LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0,
> STEP_B0)) {
> > +		/*
> > +		 * Wa_1608949956:dg2_g10
> > +		 * Wa_14010198302:dg2_g10
> > +		 */
> > +		wa_masked_en(wal, GEN8_ROW_CHICKEN,
> > +			     MDQ_ARBITRATION_MODE |
> UGM_BACKUP_MODE);
> > +
> > +		/*
> > +		 * Wa_14010918519:dg2_g10
> > +		 *
> > +		 * LSC_CHICKEN_BIT_0 always reads back as 0 is
> this stepping,
> > +		 * so ignoring verification.
> > +		 */
> > +		wa_add(wal, LSC_CHICKEN_BIT_0_UDW, 0,
> > +		       FORCE_SLM_FENCE_SCOPE_TO_TILE |
> FORCE_UGM_FENCE_SCOPE_TO_TILE,
> > +		       0, false);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0,
> STEP_B0)) {
> > +		/* Wa_22010430635:dg2 */
> > +		wa_masked_en(wal,
> > +			     GEN9_ROW_CHICKEN4,
> > +			     GEN12_DISABLE_GRF_CLEAR);
> > +
> > +		/* Wa_14010648519:dg2 */
> > +		wa_write_or(wal, XEHP_L3NODEARBCFG,
> XEHP_LNESPARE);
> > +	}
> > +
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0,
> STEP_C0) ||
> > +	    IS_DG2_G11(engine->i915)) {
> > +		/* Wa_22012654132:dg2 */
> > +		wa_add(wal, GEN10_CACHE_MODE_SS, 0,
> > +
> _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
> > +		       0 /* write-only, so skip validation */,
> > +		       true);
> > +	}
> > +
> > +	/* Wa_14013202645:dg2 */
> > +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0,
> STEP_C0) ||
> > +	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0,
> STEP_B0))
> > +		wa_write_or(wal, RT_CTRL, DIS_NULL_QUERY);
> >
> >  	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
> >  	    IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0)) {
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h
> > index b806ad4bdeca..ee39d6bd0f3c 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -502,6 +502,11 @@ static inline bool i915_mmio_reg_valid(i915_reg_t
> reg)
> >  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
> >  #define   GLOBAL_INVALIDATION_MODE
> 	REG_BIT(2)
> >
> > +#define GEN12_GAMSTLB_CTRL		_MMIO(0xcf4c)
> > +#define   CONTROL_BLOCK_CLKGATE_DIS	REG_BIT(12)
> > +#define   EGRESS_BLOCK_CLKGATE_DIS	REG_BIT(11)
> > +#define   TAG_BLOCK_CLKGATE_DIS		REG_BIT(7)
> > +
> >  #define GEN12_MERT_MOD_CTRL		_MMIO(0xcf28)
> >  #define   FORCE_MISS_FTLB		REG_BIT(3)
> >
> > @@ -777,6 +782,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t
> reg)
> >  #define EU_PERF_CNTL5	    _MMIO(0xe55c)
> >  #define EU_PERF_CNTL6	    _MMIO(0xe65c)
> >
> > +#define RT_CTRL			_MMIO(0xe530)
> > +#define  DIS_NULL_QUERY		REG_BIT(10)
> > +
> >  /*
> >   * OA Boolean state
> >   */
> > @@ -2781,6 +2789,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t
> reg)
> >  #define VDBOX_CGCTL3F10(base)		_MMIO((base) +
> 0x3f10)
> >  #define   IECPUNIT_CLKGATE_DIS		REG_BIT(22)
> >
> > +#define VDBOX_CGCTL3F18(base)		_MMIO((base) +
> 0x3f18)
> > +#define   ALNUNIT_CLKGATE_DIS		REG_BIT(13)
> > +
> >  #define ERROR_GEN6	_MMIO(0x40a0)
> >  #define GEN7_ERR_INT	_MMIO(0x44040)
> >  #define   ERR_INT_POISON		(1 << 31)
> > @@ -3124,7 +3135,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t
> reg)
> >  #define GEN9_RCS_FE_FSM2 _MMIO(0x22a4)
> >
> >  #define GEN10_CACHE_MODE_SS
> 	_MMIO(0xe420)
> > -#define   FLOAT_BLEND_OPTIMIZATION_ENABLE	(1 << 4)
> > +#define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
> > +#define   FLOAT_BLEND_OPTIMIZATION_ENABLE	REG_BIT(4)
> >
> >  /* Fuse readout registers for GT */
> >  #define HSW_PAVP_FUSE1
> 	_MMIO(0x911C)
> > @@ -4333,18 +4345,25 @@ enum {
> >  #define  SARBUNIT_CLKGATE_DIS		(1 << 5)
> >  #define  RCCUNIT_CLKGATE_DIS		(1 << 7)
> >  #define  MSCUNIT_CLKGATE_DIS		(1 << 10)
> > +#define  NODEDSS_CLKGATE_DIS		REG_BIT(12)
> >  #define  L3_CLKGATE_DIS			REG_BIT(16)
> >  #define  L3_CR2X_CLKGATE_DIS		REG_BIT(17)
> >
> >  #define SUBSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9524)
> > -#define  GWUNIT_CLKGATE_DIS		(1 << 16)
> > +#define   DSS_ROUTER_CLKGATE_DIS	REG_BIT(28)
> > +#define   GWUNIT_CLKGATE_DIS		REG_BIT(16)
> >
> >  #define SUBSLICE_UNIT_LEVEL_CLKGATE2	_MMIO(0x9528)
> >  #define  CPSSUNIT_CLKGATE_DIS		REG_BIT(9)
> >
> > +#define SSMCGCTL9530			_MMIO(0x9530)
> > +#define   RTFUNIT_CLKGATE_DIS		REG_BIT(18)
> > +
> >  #define UNSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9434)
> >  #define   VFUNIT_CLKGATE_DIS		REG_BIT(20)
> > -#define   TSGUNIT_CLKGATE_DIS		REG_BIT(17)
> > +#define   TSGUNIT_CLKGATE_DIS		REG_BIT(17) /*
> XEHPSDV */
> > +#define   CG3DDISCFEG_CLKGATE_DIS	REG_BIT(17) /* DG2 */
> > +#define   GAMEDIA_CLKGATE_DIS		REG_BIT(11)
> >  #define   HSUNIT_CLKGATE_DIS		REG_BIT(8)
> >  #define   VSUNIT_CLKGATE_DIS		REG_BIT(3)
> >
> > @@ -8404,6 +8423,9 @@ enum {
> >  #define GEN9_CTX_PREEMPT_REG		_MMIO(0x2248)
> >  #define   GEN12_DISABLE_POSH_BUSY_FF_DOP_CG REG_BIT(11)
> >
> > +#define GEN12_CS_DEBUG_MODE1_CCCSUNIT_BE_COMMON
> 	_MMIO(0x20EC)
> > +#define   GEN12_REPLAY_MODE_GRANULARITY
> 	REG_BIT(0)
> > +
> >  #define GEN8_CS_CHICKEN1		_MMIO(0x2580)
> >  #define GEN9_PREEMPT_3D_OBJECT_LEVEL		(1 <<
> 0)
> >  #define GEN9_PREEMPT_GPGPU_LEVEL(hi, lo)	(((hi) << 2) | ((lo)
> << 1))
> > @@ -8427,9 +8449,10 @@ enum {
> >    #define GEN8_ERRDETBCTRL (1 << 9)
> >
> >  #define GEN11_COMMON_SLICE_CHICKEN3
> 	_MMIO(0x7304)
> > -  #define DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN
> 	REG_BIT(12)
> > -  #define GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC
> 	REG_BIT(11)
> > -  #define GEN12_DISABLE_CPS_AWARE_COLOR_PIPE
> 	REG_BIT(9)
> > +#define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN
> 	REG_BIT(12)
> > +#define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE
> 	REG_BIT(12)
> > +#define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC
> 	REG_BIT(11)
> > +#define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE
> 	REG_BIT(9)
> >
> >  #define HIZ_CHICKEN
> 	_MMIO(0x7018)
> >  # define CHV_HZ_8X8_MODE_IN_1X
> 	REG_BIT(15)
> > @@ -8493,6 +8516,12 @@ enum {
> >  #define  HDC_FORCE_NON_COHERENT			(1 <<
> 4)
> >  #define  HDC_BARRIER_PERFORMANCE_DISABLE	(1 << 10)
> >
> > +#define GEN12_HDC_CHICKEN0
> 		_MMIO(0xE5F0)
> > +#define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK
> 	REG_GENMASK(13, 11)
> > +
> > +#define SARB_CHICKEN1
> 	_MMIO(0xe90c)
> > +#define   COMP_CKN_IN
> 	REG_GENMASK(30, 29)
> > +
> >  #define GEN8_HDC_CHICKEN1
> 	_MMIO(0x7304)
> >
> >  /* GEN9 chicken */
> > @@ -8523,6 +8552,10 @@ enum {
> >  #define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU 	(1 << 15)
> >  #define   PER_PIXEL_ALPHA_BYPASS_EN		(1 <<
> 7)
> >
> > +#define VFLSKPD
> 	_MMIO(0x62a8)
> > +#define   DIS_OVER_FETCH_CACHE		REG_BIT(1)
> > +#define   DIS_MULT_MISS_RD_SQUASH	REG_BIT(0)
> > +
> >  #define FF_MODE2			_MMIO(0x6604)
> >  #define   FF_MODE2_GS_TIMER_MASK	REG_GENMASK(31, 24)
> >  #define   FF_MODE2_GS_TIMER_224
> 	REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
> > @@ -9346,6 +9379,9 @@ enum {
> >  #define   GEN8_SDEUNIT_CLOCK_GATE_DISABLE	(1 << 14)
> >  #define   GEN8_HDCUNIT_CLOCK_GATE_DISABLE_HDCREQ (1 << 28)
> >
> > +#define UNSLCGCTL9430
> 	_MMIO(0x9430)
> > +#define   MSQDUNIT_CLKGATE_DIS
> 	REG_BIT(3)
> > +
> >  #define GEN6_GFXPAUSE
> 	_MMIO(0xA000)
> >  #define GEN6_RPNSWREQ
> 	_MMIO(0xA008)
> >  #define   GEN6_TURBO_DISABLE			(1 <<
> 31)
> > @@ -9661,24 +9697,39 @@ enum {
> >  #define   GEN9_CCS_TLB_PREFETCH_ENABLE	(1 << 3)
> >
> >  #define GEN8_ROW_CHICKEN		_MMIO(0xe4f0)
> > -#define   FLOW_CONTROL_ENABLE		(1 << 15)
> > -#define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE	(1 <<
> 8)
> > -#define   STALL_DOP_GATING_DISABLE		(1 << 5)
> > -#define   THROTTLE_12_5				(7 <<
> 2)
> > -#define   DISABLE_EARLY_EOT			(1 <<
> 1)
> > +#define   FLOW_CONTROL_ENABLE
> 	REG_BIT(15)
> > +#define   UGM_BACKUP_MODE
> 	REG_BIT(13)
> > +#define   MDQ_ARBITRATION_MODE
> 	REG_BIT(12)
> > +#define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE
> 	REG_BIT(8)
> > +#define   STALL_DOP_GATING_DISABLE
> 	REG_BIT(5)
> > +#define   THROTTLE_12_5
> 	REG_GENMASK(4, 2)
> > +#define   DISABLE_EARLY_EOT
> 	REG_BIT(1)
> >
> >  #define GEN7_ROW_CHICKEN2
> 	_MMIO(0xe4f4)
> > +#define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
> >  #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
> > +#define   GEN12_ENABLE_LARGE_GRF_MODE
> 	REG_BIT(12)
> >  #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
> >
> > +#define LSC_CHICKEN_BIT_0
> 	_MMIO(0xe7c8)
> > +#define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> > +#define LSC_CHICKEN_BIT_0_UDW
> 	_MMIO(0xe7c8 + 4)
> > +#define   DIS_CHAIN_2XSIMD8
> 	REG_BIT(55 - 32)
> > +#define   FORCE_SLM_FENCE_SCOPE_TO_TILE
> 	REG_BIT(42 - 32)
> > +#define   FORCE_UGM_FENCE_SCOPE_TO_TILE
> 	REG_BIT(41 - 32)
> > +#define   MAXREQS_PER_BANK
> 	REG_GENMASK(39 - 32, 37 - 32)
> > +#define   DISABLE_128B_EVICTION_COMMAND_UDW
> 	REG_BIT(36 - 32)
> > +
> >  #define GEN7_ROW_CHICKEN2_GT2		_MMIO(0xf4f4)
> >  #define   DOP_CLOCK_GATING_DISABLE	(1 << 0)
> >  #define   PUSH_CONSTANT_DEREF_DISABLE	(1 << 8)
> >  #define   GEN11_TDL_CLOCK_GATING_FIX_DISABLE	(1 << 1)
> >
> > -#define GEN9_ROW_CHICKEN4		_MMIO(0xe48c)
> > -#define   GEN12_DISABLE_TDL_PUSH	REG_BIT(9)
> > -#define   GEN11_DIS_PICK_2ND_EU		REG_BIT(7)
> > +#define GEN9_ROW_CHICKEN4
> 	_MMIO(0xe48c)
> > +#define   GEN12_DISABLE_GRF_CLEAR
> 	REG_BIT(13)
> > +#define   GEN12_DISABLE_TDL_PUSH
> 	REG_BIT(9)
> > +#define   GEN11_DIS_PICK_2ND_EU
> 	REG_BIT(7)
> > +#define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX
> 	REG_BIT(4)
> >
> >  #define HSW_ROW_CHICKEN3		_MMIO(0xe49c)
> >  #define  HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE    (1 << 6)
> > @@ -9693,9 +9744,10 @@ enum {
> >  #define   GEN8_SAMPLER_POWER_BYPASS_DIS	(1 << 1)
> >
> >  #define GEN9_HALF_SLICE_CHICKEN7	_MMIO(0xe194)
> > -#define   GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR	(1 <<
> 8)
> > -#define   GEN9_ENABLE_YV12_BUGFIX	(1 << 4)
> > -#define   GEN9_ENABLE_GPGPU_PREEMPTION	(1 << 2)
> > +#define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA
> 	REG_BIT(15)
> > +#define   GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR
> 	REG_BIT(8)
> > +#define   GEN9_ENABLE_YV12_BUGFIX
> 	REG_BIT(4)
> > +#define   GEN9_ENABLE_GPGPU_PREEMPTION
> 	REG_BIT(2)
> >
> >  /* Audio */
> >  #define G4X_AUD_VID_DID
> 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x62020)
> > @@ -12519,12 +12571,17 @@ enum skl_power_gate {
> >  #define   PMFLUSH_GAPL3UNBLOCK		(1 << 21)
> >  #define   PMFLUSHDONE_LNEBLK		(1 << 22)
> >
> > +#define XEHP_L3NODEARBCFG		_MMIO(0xb0b4)
> > +#define   XEHP_LNESPARE
> 	REG_BIT(19)
> > +
> >  #define GEN12_GLOBAL_MOCS(i)	_MMIO(0x4000 + (i) * 4) /* Global
> MOCS regs */
> >
> >  #define GEN12_GSMBASE
> 	_MMIO(0x108100)
> >  #define GEN12_DSMBASE
> 	_MMIO(0x1080C0)
> >
> >  #define XEHP_CLOCK_GATE_DIS		_MMIO(0x101014)
> > +#define   SGSI_SIDECLK_DIS		REG_BIT(17)
> > +#define   SGGI_DIS			REG_BIT(15)
> >  #define   SGR_DIS			REG_BIT(13)
> >
> >  /* gamt regs */
> > @@ -12903,4 +12960,7 @@ enum skl_power_gate {
> >  #define CLKGATE_DIS_MISC
> 	_MMIO(0x46534)
> >  #define  CLKGATE_DIS_MISC_DMASC_GATING_DIS	REG_BIT(21)
> >
> > +#define SLICE_COMMON_ECO_CHICKEN1
> 	_MMIO(0x731C)
> > +#define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE
> 	REG_BIT(14)
> > +
> >  #endif /* _I915_REG_H_ */
> > diff --git a/drivers/gpu/drm/i915/intel_pm.c
> b/drivers/gpu/drm/i915/intel_pm.c
> > index 16fa3306d83d..a1d9a6ac3e49 100644
> > --- a/drivers/gpu/drm/i915/intel_pm.c
> > +++ b/drivers/gpu/drm/i915/intel_pm.c
> > @@ -7486,6 +7486,22 @@ static void xehpsdv_init_clock_gating(struct
> drm_i915_private *dev_priv)
> >  		intel_uncore_rmw(&dev_priv->uncore,
> XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
> >  }
> >
> > +static void dg2_init_clock_gating(struct drm_i915_private *i915)
> > +{
> > +	/* Wa_22010954014:dg2_g10 */
> > +	if (IS_DG2_G10(i915))
> > +		intel_uncore_rmw(&i915->uncore,
> XEHP_CLOCK_GATE_DIS, 0,
> > +
> SGSI_SIDECLK_DIS);
> > +
> > +	/*
> > +	 * Wa_14010733611:dg2_g10
> > +	 * Wa_22010146351:dg2_g10
> > +	 */
> > +	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0))
> > +		intel_uncore_rmw(&i915->uncore,
> XEHP_CLOCK_GATE_DIS, 0,
> > +				 SGR_DIS |
> SGGI_DIS);
> > +}
> > +
> >  static void cnp_init_clock_gating(struct drm_i915_private *dev_priv)
> >  {
> >  	if (!HAS_PCH_CNP(dev_priv))
> > @@ -7896,6 +7912,7 @@ static const struct drm_i915_clock_gating_funcs
> platform##_clock_gating_funcs =3D
> >  	.init_clock_gating =3D platform##_init_clock_gating,
> 	\
> >  }
> >
> > +CG_FUNCS(dg2);
> >  CG_FUNCS(xehpsdv);
> >  CG_FUNCS(adlp);
> >  CG_FUNCS(dg1);
> > @@ -7933,7 +7950,9 @@ CG_FUNCS(nop);
> >   */
> >  void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv)
> >  {
> > -	if (IS_XEHPSDV(dev_priv))
> > +	if (IS_DG2(dev_priv))
> > +		dev_priv->clock_gating_funcs =3D
> &dg2_clock_gating_funcs;
> > +	else if (IS_XEHPSDV(dev_priv))
> >  		dev_priv->clock_gating_funcs =3D
> &xehpsdv_clock_gating_funcs;
> >  	else if (IS_ALDERLAKE_P(dev_priv))
> >  		dev_priv->clock_gating_funcs =3D
> &adlp_clock_gating_funcs;
> > --
> > 2.33.0
> >

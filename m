Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C728434B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 02:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1676E1D3;
	Tue,  6 Oct 2020 00:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB58D6E1D2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 00:22:50 +0000 (UTC)
IronPort-SDR: bwrJHcb8Yix2BKhq5ZRFCy00ZOQkp7LCNLeY1X+8qrq7AIMhHrx8frnly6Z2hdLjYvSPkTKOq0
 axMJHZvgoHDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="181728942"
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
 d="scan'208,223";a="181728942"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 17:22:46 -0700
IronPort-SDR: JZDVyPbCHr8ck2GD/WwcoTlCVrC9f1ZcGhbD88jzHCMV3OR1ownPn3qU/aYd//prJbwJy2srJC
 iqizEivevsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
 d="scan'208,223";a="387310220"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 05 Oct 2020 17:22:45 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 17:22:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 5 Oct 2020 17:22:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 5 Oct 2020 17:22:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO81S0TgxdGWtYzcrIinEoCQEtaBLCEQO9/0+5d5HO4fJk/bwUoW2C3IwM7m4En6fMuq8ZvM0GmneE4I47rorNkTfqmoaMjL8tRTrFEY5rwwO88mMhKafBfqdqqTaSIIXxuW+/OhdCpXoaRWL1cNEaVsRNdGIuRnhNt+s5qB4D0jwIaZA1hatD/JxpZYmFFSpBC4q+57r7xu/1htzpyYvxTAoFVNX3Jb2OCSKIyKlxmFOrHy83dFQglj9s8Fwh8nigz4EnfBfimcwMp+aYPagK9DP0ojhqiIaB+yX2xgzDDsKyP7RsyKG31WRt4s70oF8hSFVJY7HhbZdhHwSBL2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ajCLHpz3AdBtHMHb4WIbKWsXtneLmiY1qcf5l/NFTY=;
 b=OLe+xleFH+s3jnbRFXdCzON44ictMwBr16U4i1w5Er3ky+Lf1MB1Xe8Z0GosaEaUfod5cEFN/uAY19ufd0c472R7thz5pyGGUEbl2H6c9wOZeeD+ajEbxhpHp2VYmGwbBYCtg8rzTd+6r6sJh2UYWdQBS0HJ9jgq5M65wo5/FXsR7naNl7mJt4RIYwFItwKodeOfOQ5wDzwxSC/KIxJcXguYDnrNZUnGYRc2sF6IWu7YzGLdlnFHPD7rO7Yk2Pmq/jybbS/sVG1z0HNqvMdUV/TrAwJqLq51QzYjS4/vDM5d+IGjXUHrOLT0IwupegWWKLMInx8XOS9vcadvDrcsLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ajCLHpz3AdBtHMHb4WIbKWsXtneLmiY1qcf5l/NFTY=;
 b=ST5WC16dykJ9cwqO8hod0LNFde0e4jzh4uakvsL5wPdaP1dEVslGUSr7NoRz64ZMriav2F8huOBfye8uRWnlznhqzE2+koBbB9s5fTrgYdkOR80FrDhItNaJC8wHhcy7qNcv1aePv5DH9hjYEC3MkLYToItAXZFDqagrlIB3Org=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Tue, 6 Oct
 2020 00:22:37 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6%6]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 00:22:37 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Thread-Topic: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Thread-Index: AQHWf9HFmAm5AcKirkeVCqcGep3UralhmbMAgCGUtgCAAQwrAIABSD3wgAO6NACAAC8U0A==
Date: Tue, 6 Oct 2020 00:22:37 +0000
Message-ID: <BY5PR11MB4182DE7017EE772BED3097B18C0D0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
 <20200910083042.GH438822@phenom.ffwll.local>
 <BY5PR11MB41825BA878A60FBCFF8655E78C300@BY5PR11MB4182.namprd11.prod.outlook.com>
 <CAKMK7uFXFxbfD-knNMZtphFN+VGi7qucq+y03DnH7BRneb4ixw@mail.gmail.com>
 <BY5PR11MB418286B4B35E16146E89B2D38C0E0@BY5PR11MB4182.namprd11.prod.outlook.com>
 <20201005134922.GP438822@phenom.ffwll.local>
In-Reply-To: <20201005134922.GP438822@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a61a7c3f-9448-4c43-3ee9-08d8698dedf6
x-ms-traffictypediagnostic: SJ0PR11MB4896:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB489641D55AE106A70176D4EC8C0D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kEu2NVOocPN/orVrbjreiz0o9zAySGZo39XGR8VhydYdv+dudbWsfxWK+/Rode0RbU9Le7DM+IAXwPLzsaCfeiG/aN0J8mM2cVEuuq2N+MJYVDZRy3b9BP2RKFD2BAxf+UDn5QemPtRVfCCOhatOZJ31SQGU05KQ4AaiuYwRxjbJoR19UFZ5zkMz9xotyyujA7oUrD42uh/z1A4kBQVlFUgjBiW1NfaKR2PDOkrZ9vNe+VH5zMPQFawVEO05AvGe7gQ12eN98YVu+F76BlzmuD8IQhV7peWCSwvOe1eDI5sB5+ffVpVPCdzW7Zj4hcq030pQk4KbR0yV1MOyLoI5XAC/knaKym+MuWmVjkbkhfcKQh0GPCoUJshdMss7plYr3ojMwymoEs21yAOMqyLkYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(8676002)(26005)(53546011)(6506007)(2906002)(33656002)(107886003)(86362001)(4326008)(9686003)(66946007)(83080400001)(30864003)(966005)(8936002)(71200400001)(55016002)(186003)(54906003)(7696005)(83380400001)(66616009)(6916009)(99936003)(478600001)(5660300002)(76116006)(316002)(66476007)(52536014)(64756008)(66556008)(66446008)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CK1xidorX4Ek9JG8tUUO6TMQgjy3i62s8AKL4nNfJ5mzRiaYGpaR3YwEjC/xl3xhHAmnOQVHmI0Wvg+KhoobGjEpOwDkN/YVoWDuGLmQ1/grMpvl4J801Kx2ogXS2UTWffyiaG9h8wEi1Q1Izx7ox7z2cSvRbvFiaxoldUpDkdfEtA0/nxAcXKvHN9gDuAlGVYJAQbeTuZi9XPqnVCeUX3O2MrxLKl8vVDeXYXYWVsigwO1hXmDG3bYSL3UjELAnGW0KGN2SkkgywbDdVJl5SEoUzDI0DLkeLpoztxR2BzWQ8irWeP1RroJcJlsPhbVBcGPDLwUefKT+Gsv+RDrwyZF6L+y3wZpc9WlvN5JTaQ/8evsCZX9dB91yZ6WXgxCbY52Jm3ova1sSvzraOK77X3gTxjOHpVxCCi6zqcjTZGIhzi6VSevDIpbNi0Lxnx12Hq8uI/gxJqWkoRGc9ADVgIIdUQLG9G/XarWyrBOUPvt8EM6Oy4rBpo5mULDufcP+MfLXwmp6RUBwUVGP1j9weEQEzVPJayhnxfCfFvaATBzszceDq4PfOu0K+nNCRxjIXgru1kbJAN4SdiH1KLP+BiX1lBTBr2p2IV7bzYoGUI+2dXKEmErxN0bwMod1wAi/fZ8E8z3PQUI551lyOAAi3w==
Content-Type: multipart/mixed;
 boundary="_002_BY5PR11MB4182DE7017EE772BED3097B18C0D0BY5PR11MB4182namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61a7c3f-9448-4c43-3ee9-08d8698dedf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 00:22:37.4989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5KHXvA8xXAZ+UQUFYjfCJEyza1RdR+aIzoCVylCERWHpnqBlt3puahE2Ks9tTI5ngoqZLg6/BMEI/jmlCoN7EN2zUaW5Neb/a+0q5wpbl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_BY5PR11MB4182DE7017EE772BED3097B18C0D0BY5PR11MB4182namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, October 5, 2020 6:49 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org;
> Paauwe, Bob J <bob.j.paauwe@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>; Vetter, Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
>=20
> On Sat, Oct 03, 2020 at 04:58:51AM +0000, Chrisanthus, Anitha wrote:
> >
> >
> > > -----Original Message-----
> > > From: Daniel Vetter <daniel@ffwll.ch>
> > > Sent: Friday, October 2, 2020 2:19 AM
> > > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > > Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J
> > > <bob.j.paauwe@intel.com>; Dea, Edmund J <edmund.j.dea@intel.com>;
> > > Vetter, Daniel <daniel.vetter@intel.com>
> > > Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay
> Display
> > >
> > > On Thu, Oct 1, 2020 at 8:02 PM Chrisanthus, Anitha
> > > <anitha.chrisanthus@intel.com> wrote:
> > > >
> > > > Hi Daniel,
> > > > I was finally able to test the driver with 5.9 kernel with minor ch=
anges
> in
> > > the driver.
> > > > Ran the igt_vblank test and it passed/skipped all the subtests exce=
pt
> the
> > > pipe-A-accuracy-idle test.
> > > > Results are attached. Investigated the failing test and it seems li=
ke
> > > drm_handle_vblank() is taking too long sometimes. I can work on this
> after
> > > we merge.
> > >
> > > kms_flip is the one that should check whether vblank events and page
> > > flip events agree. Which I think isn't the case with your current
> > > code.
> > Thanks. I will run that test and work on the failures. I did send v8
> > with 5.9 testing changes today and also sent the YAML file v1 today to
> > devicetree@vger.kernel.org, not sure if I should cc dri-devel,, should
> > I?
>=20
> I think usually people send out the entire series, first device tree yaml=
,
> then bindings, then drivers, to everyone. It helps with context I think
> (But I don't review dt stuff myself).

Thanks, I will wait for review for DT YAML and will include dri-devel if v2=
 is needed. Also attaching dt binding yaml patch.

I am still awaiting approval for push access to drm-misc, I think there is =
some confusion on what this driver is.
This was requested for v7. Can you grant access?
https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/291

Anitha

> -Daniel
>=20
> >
> > Anitha
> > > -Daniel
> > >
> > > >
> > > > Will send out V8 with the minor changes and device tree YAML
> binding
> > > file ASAP. Will work on the rest of the review comments after.
> > > >
> > > > Thanks,
> > > > Anitha
> > > >
> > > > > From: Daniel Vetter <daniel@ffwll.ch>
> > > > > Sent: Thursday, September 10, 2020 1:31 AM
> > > > > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > > > > Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J
> > > > > <bob.j.paauwe@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>;
> > > > > Vetter, Daniel <daniel.vetter@intel.com>
> > > > > Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay
> > > Display
> > > > >
> > > > > On Mon, Aug 31, 2020 at 01:02:50PM -0700, Anitha Chrisanthus
> > > wrote:
> > > > > > This is a basic KMS atomic modesetting display driver for KeemB=
ay
> > > family
> > > > > of
> > > > > > SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bri=
dge
> > > > > > driver at the connector level.
> > > > > >
> > > > > > Single CRTC with LCD controller->mipi DSI-> ADV bridge
> > > > > >
> > > > > > Only 1080p resolution and single plane is supported at this tim=
e.
> > > > > >
> > > > > > v2: moved extern to .h, removed license text
> > > > > >     use drm_dev_init, upclassed dev_private, removed
> > > HAVE_IRQ.(Sam)
> > > > > >
> > > > > > v3: Squashed all 59 commits to one
> > > > > >
> > > > > > v4: review changes from Sam Ravnborg
> > > > > >     renamed dev_p to kmb
> > > > > >     moved clocks under kmb_clock, consolidated clk initializati=
ons
> > > > > >     use drmm functions
> > > > > >     use DRM_GEM_CMA_DRIVER_OPS_VMAP
> > > > > >
> > > > > > v5: corrected spellings
> > > > > > v6: corrected checkpatch warnings
> > > > > > v7: review changes Sam Ravnborg and Thomas Zimmerman
> > > > > >     removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> > > > > >     renamed mode_set, kmb_load, inlined unload (Thomas)
> > > > > >     moved remaining logging to drm_*(Thomas)
> > > > > >     re-orged driver initialization (Thomas)
> > > > > >     moved plane_status to drm_private (Sam)
> > > > > >     removed unnecessary logs and defines and ifdef codes (Sam)
> > > > > >     call helper_check in plane_atomic_check (Sam)
> > > > > >     renamed set to get for bpp and format functions(Sam)
> > > > > >     use drm helper functions for reset, duplicate/destroy state
> instead
> > > > > >     of kmb functions (Sam)
> > > > > >     removed kmb_priv from kmb_plane and removed
> > > kmb_plane_state
> > > > > (Sam)
> > > > > >
> > > > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > > > Signed-off-by: Anitha Chrisanthus
> <anitha.chrisanthus@intel.com>
> > > > > > Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
> > > > >
> > > > > Sam asked me to take a look at this too, looks reasonable overall=
.
> I've
> > > > > spotted a few small things plus a potential functional issue arou=
nd
> > > > > vblank/event handling. I strongly recommend running the igt test
> suite
> > > > > over the driver to see whether it all works reasonably ok. See be=
low
> for
> > > > > details.
> > > > >
> > > > > > ---
> > > > > >  drivers/gpu/drm/kmb/kmb_crtc.c  | 224 +++++++++++++
> > > > > >  drivers/gpu/drm/kmb/kmb_drv.c   | 676
> > > > > ++++++++++++++++++++++++++++++++++++++++
> > > > > >  drivers/gpu/drm/kmb/kmb_drv.h   | 170 ++++++++++
> > > > > >  drivers/gpu/drm/kmb/kmb_plane.c | 480
> > > > > ++++++++++++++++++++++++++++
> > > > > >  drivers/gpu/drm/kmb/kmb_plane.h | 110 +++++++
> > > > > >  5 files changed, 1660 insertions(+)
> > > > > >  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
> > > > > >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
> > > > > >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
> > > > > >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
> > > > > >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c
> > > > > b/drivers/gpu/drm/kmb/kmb_crtc.c
> > > > > > new file mode 100644
> > > > > > index 0000000..a684331
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> > > > > > @@ -0,0 +1,224 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * Copyright (c) 2018-2020 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/clk.h>
> > > > > > +#include <linux/of_graph.h>
> > > > > > +#include <linux/platform_data/simplefb.h>
> > > > > > +
> > > > > > +#include <video/videomode.h>
> > > > > > +
> > > > > > +#include <drm/drm_atomic.h>
> > > > > > +#include <drm/drm_atomic_helper.h>
> > > > > > +#include <drm/drm_crtc.h>
> > > > > > +#include <drm/drm_crtc_helper.h>
> > > > > > +#include <drm/drm_debugfs.h>
> > > > > > +#include <drm/drm_device.h>
> > > > > > +#include <drm/drm_drv.h>
> > > > > > +#include <drm/drm_fb_cma_helper.h>
> > > > > > +#include <drm/drm_fb_helper.h>
> > > > > > +#include <drm/drm_gem_cma_helper.h>
> > > > > > +#include <drm/drm_of.h>
> > > > > > +#include <drm/drm_plane_helper.h>
> > > > > > +#include <drm/drm_vblank.h>
> > > > > > +
> > > > > > +#include "kmb_drv.h"
> > > > > > +#include "kmb_dsi.h"
> > > > > > +#include "kmb_plane.h"
> > > > > > +#include "kmb_regs.h"
> > > > > > +
> > > > > > +struct kmb_crtc_timing {
> > > > > > +   u32 vfront_porch;
> > > > > > +   u32 vback_porch;
> > > > > > +   u32 vsync_len;
> > > > > > +   u32 hfront_porch;
> > > > > > +   u32 hback_porch;
> > > > > > +   u32 hsync_len;
> > > > > > +};
> > > > > > +
> > > > > > +static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
> > > > > > +{
> > > > > > +   struct drm_device *dev =3D crtc->dev;
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(dev);
> > > > > > +
> > > > > > +   /* Clear interrupt */
> > > > > > +   kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> > > > > > +   /* Set which interval to generate vertical interrupt */
> > > > > > +   kmb_write_lcd(kmb, LCD_VSTATUS_COMPARE,
> > > > > > +                 LCD_VSTATUS_COMPARE_VSYNC);
> > > > > > +   /* Enable vertical interrupt */
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > > > > +                       LCD_INT_VERT_COMP);
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
> > > > > > +{
> > > > > > +   struct drm_device *dev =3D crtc->dev;
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(dev);
> > > > > > +
> > > > > > +   /* Clear interrupt */
> > > > > > +   kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> > > > > > +   /* Disable vertical interrupt */
> > > > > > +   kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > > > > +                       LCD_INT_VERT_COMP);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct drm_crtc_funcs kmb_crtc_funcs =3D {
> > > > > > +   .destroy =3D drm_crtc_cleanup,
> > > > > > +   .set_config =3D drm_atomic_helper_set_config,
> > > > > > +   .page_flip =3D drm_atomic_helper_page_flip,
> > > > > > +   .reset =3D drm_atomic_helper_crtc_reset,
> > > > > > +   .atomic_duplicate_state =3D
> > > > > drm_atomic_helper_crtc_duplicate_state,
> > > > > > +   .atomic_destroy_state =3D
> drm_atomic_helper_crtc_destroy_state,
> > > > > > +   .enable_vblank =3D kmb_crtc_enable_vblank,
> > > > > > +   .disable_vblank =3D kmb_crtc_disable_vblank,
> > > > > > +};
> > > > > > +
> > > > > > +static void kmb_crtc_set_mode(struct drm_crtc *crtc)
> > > > > > +{
> > > > > > +   struct drm_device *dev =3D crtc->dev;
> > > > > > +   struct drm_display_mode *m =3D &crtc->state->adjusted_mode;
> > > > > > +   struct kmb_crtc_timing vm;
> > > > > > +   int vsync_start_offset;
> > > > > > +   int vsync_end_offset;
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(dev);
> > > > > > +   unsigned int val =3D 0;
> > > > > > +
> > > > > > +   /* Initialize mipi */
> > > > > > +   kmb_dsi_hw_init(dev, m);
> > > > > > +   drm_info(dev,
> > > > > > +            "vfp=3D %d vbp=3D %d vsyc_len=3D%d hfp=3D%d hbp=3D=
%d
> > > > > hsync_len=3D%d\n",
> > > > > > +            m->crtc_vsync_start - m->crtc_vdisplay,
> > > > > > +            m->crtc_vtotal - m->crtc_vsync_end,
> > > > > > +            m->crtc_vsync_end - m->crtc_vsync_start,
> > > > > > +            m->crtc_hsync_start - m->crtc_hdisplay,
> > > > > > +            m->crtc_htotal - m->crtc_hsync_end,
> > > > > > +            m->crtc_hsync_end - m->crtc_hsync_start);
> > > > > > +   val =3D kmb_read_lcd(kmb, LCD_INT_ENABLE);
> > > > > > +   kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, ~0x0);
> > > > > > +   vm.vfront_porch =3D 2;
> > > > > > +   vm.vback_porch =3D 2;
> > > > > > +   vm.vsync_len =3D 8;
> > > > > > +   vm.hfront_porch =3D 0;
> > > > > > +   vm.hback_porch =3D 0;
> > > > > > +   vm.hsync_len =3D 28;
> > > > > > +
> > > > > > +   vsync_start_offset =3D  m->crtc_vsync_start -  m-
> >crtc_hsync_start;
> > > > > > +   vsync_end_offset =3D  m->crtc_vsync_end - m->crtc_hsync_end=
;
> > > > > > +
> > > > > > +   drm_dbg(dev, "%s : %dactive height=3D %d vbp=3D%d vfp=3D%d
> vsync-
> > > > > w=3D%d h-active=3D%d h-bp=3D%d h-fp=3D%d hysnc-l=3D%d",
> > > > > > +           __func__, __LINE__,
> > > > > > +                   m->crtc_vdisplay, vm.vback_porch,
> > > > > vm.vfront_porch,
> > > > > > +                   vm.vsync_len, m->crtc_hdisplay, vm.hback_po=
rch,
> > > > > > +                   vm.hfront_porch, vm.hsync_len);
> > > > > > +   kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT,
> > > > > > +                 m->crtc_vdisplay - 1);
> > > > > > +   kmb_write_lcd(kmb, LCD_V_BACKPORCH, vm.vback_porch);
> > > > > > +   kmb_write_lcd(kmb, LCD_V_FRONTPORCH, vm.vfront_porch);
> > > > > > +   kmb_write_lcd(kmb, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
> > > > > > +   kmb_write_lcd(kmb, LCD_H_ACTIVEWIDTH,
> > > > > > +                 m->crtc_hdisplay - 1);
> > > > > > +   kmb_write_lcd(kmb, LCD_H_BACKPORCH, vm.hback_porch);
> > > > > > +   kmb_write_lcd(kmb, LCD_H_FRONTPORCH, vm.hfront_porch);
> > > > > > +   kmb_write_lcd(kmb, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
> > > > > > +   /* This is hardcoded as 0 in the Myriadx code */
> > > > > > +   kmb_write_lcd(kmb, LCD_VSYNC_START, 0);
> > > > > > +   kmb_write_lcd(kmb, LCD_VSYNC_END, 0);
> > > > > > +   /* Back ground color */
> > > > > > +   kmb_write_lcd(kmb, LCD_BG_COLOUR_LS, 0x4);
> > > > > > +   if (m->flags =3D=3D DRM_MODE_FLAG_INTERLACE) {
> > > > > > +           kmb_write_lcd(kmb,
> > > > > > +                         LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - =
1);
> > > > > > +           kmb_write_lcd(kmb,
> > > > > > +                         LCD_V_BACKPORCH_EVEN, vm.vback_porch)=
;
> > > > > > +           kmb_write_lcd(kmb,
> > > > > > +                         LCD_V_FRONTPORCH_EVEN, vm.vfront_porc=
h);
> > > > > > +           kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT_EVEN,
> > > > > > +                         m->crtc_vdisplay - 1);
> > > > > > +           /* This is hardcoded as 10 in the Myriadx code */
> > > > > > +           kmb_write_lcd(kmb, LCD_VSYNC_START_EVEN, 10);
> > > > > > +           kmb_write_lcd(kmb, LCD_VSYNC_END_EVEN, 10);
> > > > > > +   }
> > > > > > +   kmb_write_lcd(kmb, LCD_TIMING_GEN_TRIG, ENABLE);
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_CONTROL,
> LCD_CTRL_ENABLE);
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > > > +                              struct drm_crtc_state *old_state=
)
> > > > > > +{
> > > > > > +   struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> > > > > > +
> > > > > > +   clk_prepare_enable(lcd->clk);
> > > > > > +   kmb_crtc_set_mode(crtc);
> > > > > > +   drm_crtc_vblank_on(crtc);
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
> > > > > > +                               struct drm_crtc_state *old_stat=
e)
> > > > > > +{
> > > > > > +   struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> > > > > > +
> > > > > > +   /* due to hw limitations, planes need to be off when crtc i=
s off
> */
> > > > > > +   drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> > > > > > +
> > > > > > +   drm_crtc_vblank_off(crtc);
> > > > > > +   clk_disable_unprepare(lcd->clk);
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
> > > > > > +                             struct drm_crtc_state *state)
> > > > > > +{
> > > > > > +   struct drm_device *dev =3D crtc->dev;
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(dev);
> > > > > > +
> > > > > > +   kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > > > > +                       LCD_INT_VERT_COMP);
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
> > > > > > +                             struct drm_crtc_state *state)
> > > > > > +{
> > > > > > +   struct drm_device *dev =3D crtc->dev;
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(dev);
> > > > > > +
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > > > > +                       LCD_INT_VERT_COMP);
> > > > > > +
> > > > > > +   spin_lock_irq(&crtc->dev->event_lock);
> > > > > > +   if (crtc->state->event)
> > > > > > +           drm_crtc_send_vblank_event(crtc, crtc->state->event=
);
> > > > >
> > > > > Uh, you have vblank event support, but you immediately send out
> the
> > > > > vblank
> > > > > event. That breaks userspace assumptions. You probably want to
> use
> > > > > drm_crtc_arm_vblank_event here. Also there's tons of races that
> can
> > > > > possibly happen, so please read the kerneldoc comment for that
> > > function
> > > > > carefully - you probably need to validate that the vblank event
> arming,
> > > > > vblank process and re-enabling of LCD_INT_ENABLE cannot race
> against
> > > > > each
> > > > > another in bad ways.
> > > > >
> > > > > Also we have igt testcases for this, so please run them:
> > > >
> > > >
> > > > > https://dri.freedesktop.org/docs/drm/gpu/drm-
> uapi.html#validating-
> > > > > changes-with-igt
> > > > >
> > > > > > +   crtc->state->event =3D NULL;
> > > > > > +   spin_unlock_irq(&crtc->dev->event_lock);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct drm_crtc_helper_funcs
> kmb_crtc_helper_funcs =3D
> > > {
> > > > > > +   .atomic_begin =3D kmb_crtc_atomic_begin,
> > > > > > +   .atomic_enable =3D kmb_crtc_atomic_enable,
> > > > > > +   .atomic_disable =3D kmb_crtc_atomic_disable,
> > > > > > +   .atomic_flush =3D kmb_crtc_atomic_flush,
> > > > > > +};
> > > > > > +
> > > > > > +int kmb_setup_crtc(struct drm_device *drm)
> > > > > > +{
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(drm);
> > > > > > +   struct kmb_plane *primary;
> > > > > > +   int ret;
> > > > > > +
> > > > > > +   primary =3D kmb_plane_init(drm);
> > > > > > +   if (IS_ERR(primary))
> > > > > > +           return PTR_ERR(primary);
> > > > > > +
> > > > > > +   ret =3D drm_crtc_init_with_planes(drm, &kmb->crtc, &primary=
-
> > > > > >base_plane,
> > > > > > +                                   NULL, &kmb_crtc_funcs, NULL=
);
> > > > > > +   if (ret) {
> > > > > > +           kmb_plane_destroy(&primary->base_plane);
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +
> > > > > > +   drm_crtc_helper_add(&kmb->crtc, &kmb_crtc_helper_funcs);
> > > > > > +   return 0;
> > > > > > +}
> > > > > > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> > > > > b/drivers/gpu/drm/kmb/kmb_drv.c
> > > > > > new file mode 100644
> > > > > > index 0000000..e413099
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > > > > > @@ -0,0 +1,676 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * Copyright (c) 2018-2020 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/clk.h>
> > > > > > +#include <linux/console.h>
> > > > > > +#include <linux/list.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/of_graph.h>
> > > > > > +#include <linux/of_reserved_mem.h>
> > > > > > +#include <linux/platform_device.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > > > +#include <linux/spinlock.h>
> > > > > > +
> > > > > > +#include <drm/drm.h>
> > > > > > +#include <drm/drm_atomic.h>
> > > > > > +#include <drm/drm_atomic_helper.h>
> > > > > > +#include <drm/drm_crtc.h>
> > > > > > +#include <drm/drm_device.h>
> > > > > > +#include <drm/drm_drv.h>
> > > > > > +#include <drm/drm_fb_cma_helper.h>
> > > > > > +#include <drm/drm_fb_helper.h>
> > > > > > +#include <drm/drm_gem_cma_helper.h>
> > > > > > +#include <drm/drm_gem_framebuffer_helper.h>
> > > > > > +#include <drm/drm_ioctl.h>
> > > > > > +#include <drm/drm_irq.h>
> > > > > > +#include <drm/drm_of.h>
> > > > > > +#include <drm/drm_probe_helper.h>
> > > > > > +#include <drm/drm_vblank.h>
> > > > > > +
> > > > > > +#include "kmb_drv.h"
> > > > > > +#include "kmb_dsi.h"
> > > > > > +#include "kmb_regs.h"
> > > > > > +
> > > > > > +int kmb_under_flow =3D 0, kmb_flush_done =3D 0, layer_no =3D 0=
;
> > > > > > +static struct kmb_clock kmb_clk;
> > > > > > +
> > > > > > +static struct drm_bridge *adv_bridge;
> > > > > > +
> > > > > > +int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> > > > > > +{
> > > > > > +   int ret =3D 0;
> > > > > > +
> > > > > > +   ret =3D clk_prepare_enable(kmb_clk.clk_lcd);
> > > > > > +   if (ret) {
> > > > > > +           drm_err(&kmb->drm, "Failed to enable LCD clock: %d\=
n",
> > > > > ret);
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +
> > > > > > +   ret =3D clk_prepare_enable(kmb_clk.clk_mipi);
> > > > > > +   if (ret) {
> > > > > > +           drm_err(&kmb->drm, "Failed to enable MIPI clock: %d=
\n",
> > > > > ret);
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +
> > > > > > +   ret =3D clk_prepare_enable(kmb_clk.clk_mipi_ecfg);
> > > > > > +   if (ret) {
> > > > > > +           drm_err(&kmb->drm,
> > > > > > +                   "Failed to enable MIPI_ECFG clock: %d\n", r=
et);
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +
> > > > > > +   ret =3D clk_prepare_enable(kmb_clk.clk_mipi_cfg);
> > > > > > +   if (ret) {
> > > > > > +           drm_err(&kmb->drm,
> > > > > > +                   "Failed to enable MIPI_CFG clock: %d\n", re=
t);
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +   DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct
> > > device
> > > > > *dev)
> > > > > > +{
> > > > > > +   struct device_node *vpu_dev;
> > > > > > +   unsigned long clk;
> > > > > > +   int ret =3D 0;
> > > > > > +
> > > > > > +   kmb_clk.clk_lcd =3D clk_get(dev, "clk_lcd");
> > > > > > +   if (IS_ERR(kmb_clk.clk_lcd)) {
> > > > > > +           drm_err(&kmb->drm, "clk_get() failed clk_lcd\n");
> > > > > > +           return PTR_ERR(kmb_clk.clk_lcd);
> > > > > > +   }
> > > > > > +
> > > > > > +   kmb_clk.clk_mipi =3D clk_get(dev, "clk_mipi");
> > > > > > +   if (IS_ERR(kmb_clk.clk_mipi)) {
> > > > > > +           drm_err(&kmb->drm, "clk_get() failed clk_mipi\n");
> > > > > > +           return PTR_ERR(kmb_clk.clk_mipi);
> > > > > > +   }
> > > > > > +
> > > > > > +   kmb_clk.clk_mipi_ecfg =3D clk_get(dev, "clk_mipi_ecfg");
> > > > > > +   if (IS_ERR(kmb_clk.clk_mipi_ecfg)) {
> > > > > > +           drm_err(&kmb->drm, "clk_get() failed clk_mipi_ecfg\=
n");
> > > > > > +           return PTR_ERR(kmb_clk.clk_mipi_ecfg);
> > > > > > +   }
> > > > > > +
> > > > > > +   kmb_clk.clk_mipi_cfg =3D clk_get(dev, "clk_mipi_cfg");
> > > > > > +   if (IS_ERR(kmb_clk.clk_mipi_cfg)) {
> > > > > > +           drm_err(&kmb->drm, "clk_get() failed clk_mipi_cfg\n=
");
> > > > > > +           return PTR_ERR(kmb_clk.clk_mipi_cfg);
> > > > > > +   }
> > > > > > +   vpu_dev =3D of_find_node_by_path("/soc/vpu-ipc");
> > > > > > +   kmb_clk.clk_pll0 =3D of_clk_get_by_name(vpu_dev,
> "pll_0_out_0");
> > > > > > +   if (IS_ERR(kmb_clk.clk_pll0)) {
> > > > > > +           drm_err(&kmb->drm, "clk_get() failed clk_pll0 ");
> > > > > > +           return PTR_ERR(kmb_clk.clk_pll0);
> > > > > > +   }
> > > > > > +   kmb->sys_clk_mhz =3D clk_get_rate(kmb_clk.clk_pll0) /
> 1000000;
> > > > > > +   drm_info(&kmb->drm, "system clk =3D %d Mhz", kmb-
> > > > > >sys_clk_mhz);
> > > > > > +
> > > > > > +   /* Set LCD clock to 200 Mhz */
> > > > > > +   clk_set_rate(kmb_clk.clk_lcd, KMB_LCD_DEFAULT_CLK);
> > > > > > +   if (clk_get_rate(kmb_clk.clk_lcd) !=3D KMB_LCD_DEFAULT_CLK)=
 {
> > > > > > +           drm_err(&kmb->drm, "failed to set to clk_lcd to %d\=
n",
> > > > > > +                   KMB_LCD_DEFAULT_CLK);
> > > > > > +           return -1;
> > > > > > +   }
> > > > > > +   drm_dbg(&kmb->drm, "clk_lcd =3D %ld\n",
> > > > > clk_get_rate(kmb_clk.clk_lcd));
> > > > > > +
> > > > > > +   /* Set MIPI clock to 24 Mhz */
> > > > > > +   clk_set_rate(kmb_clk.clk_mipi, KMB_MIPI_DEFAULT_CLK);
> > > > > > +   if (clk_get_rate(kmb_clk.clk_mipi) !=3D
> KMB_MIPI_DEFAULT_CLK) {
> > > > > > +           drm_err(&kmb->drm, "failed to set to clk_mipi to %d=
\n",
> > > > > > +                   KMB_MIPI_DEFAULT_CLK);
> > > > > > +           return -1;
> > > > > > +   }
> > > > > > +   drm_dbg(&kmb->drm, "clk_mipi =3D %ld\n",
> > > > > clk_get_rate(kmb_clk.clk_mipi));
> > > > > > +
> > > > > > +   clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> > > > > > +   if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > > > > > +           /* Set MIPI_ECFG clock to 24 Mhz */
> > > > > > +           clk_set_rate(kmb_clk.clk_mipi_ecfg,
> > > > > KMB_MIPI_DEFAULT_CFG_CLK);
> > > > > > +           clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> > > > > > +           if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > > > > > +                   drm_err(&kmb->drm,
> > > > > > +                           "failed to set to clk_mipi_ecfg to =
%d\n",
> > > > > > +                            KMB_MIPI_DEFAULT_CFG_CLK);
> > > > > > +                   return -1;
> > > > > > +           }
> > > > > > +   }
> > > > > > +
> > > > > > +   clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> > > > > > +   if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > > > > > +           /* Set MIPI_CFG clock to 24 Mhz */
> > > > > > +           clk_set_rate(kmb_clk.clk_mipi_cfg, 24000000);
> > > > > > +           clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> > > > > > +           if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> > > > > > +                   drm_err(&kmb->drm,
> > > > > > +                           "failed to set clk_mipi_cfg to %d\n=
",
> > > > > > +                             KMB_MIPI_DEFAULT_CFG_CLK);
> > > > > > +                   return -1;
> > > > > > +           }
> > > > > > +   }
> > > > > > +
> > > > > > +   ret =3D kmb_display_clk_enable(kmb);
> > > > > > +   if (ret)
> > > > > > +           return ret;
> > > > > > +
> > > > > > +   /* Enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
> > > > > > +   kmb_set_bitmask_msscam(kmb, MSS_CAM_CLK_CTRL,
> 0x1fff);
> > > > > > +   kmb_set_bitmask_msscam(kmb, MSS_CAM_RSTN_CTRL,
> > > 0xffffffff);
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int kmb_display_clk_disable(void)
> > > > > > +{
> > > > > > +   if (kmb_clk.clk_lcd)
> > > > > > +           clk_disable_unprepare(kmb_clk.clk_lcd);
> > > > > > +   if (kmb_clk.clk_mipi)
> > > > > > +           clk_disable_unprepare(kmb_clk.clk_mipi);
> > > > > > +   if (kmb_clk.clk_mipi_ecfg)
> > > > > > +           clk_disable_unprepare(kmb_clk.clk_mipi_ecfg);
> > > > > > +   if (kmb_clk.clk_mipi_cfg)
> > > > > > +           clk_disable_unprepare(kmb_clk.clk_mipi_cfg);
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void __iomem *kmb_map_mmio(struct drm_device *drm,
> > > char
> > > > > *name)
> > > > > > +{
> > > > > > +   struct resource *res;
> > > > > > +   struct platform_device *pdev =3D to_platform_device(drm-
> >dev);
> > > > > > +   void __iomem *mem;
> > > > > > +
> > > > > > +   res =3D platform_get_resource_byname(pdev,
> IORESOURCE_MEM,
> > > > > name);
> > > > > > +   if (!res) {
> > > > > > +           drm_err(drm, "failed to get resource for %s", name)=
;
> > > > > > +           return ERR_PTR(-ENOMEM);
> > > > > > +   }
> > > > > > +   mem =3D devm_ioremap_resource(drm->dev, res);
> > > > > > +   if (IS_ERR(mem))
> > > > > > +           drm_err(drm, "failed to ioremap %s registers", name=
);
> > > > > > +   return mem;
> > > > > > +}
> > > > > > +
> > > > > > +static int kmb_hw_init(struct drm_device *drm, unsigned long
> flags)
> > > > > > +{
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(drm);
> > > > > > +   struct platform_device *pdev =3D to_platform_device(drm-
> >dev);
> > > > > > +   int irq_lcd;
> > > > > > +   int ret =3D 0;
> > > > > > +
> > > > > > +   /* Map LCD MMIO registers */
> > > > > > +   kmb->lcd_mmio =3D kmb_map_mmio(drm, "lcd_regs");
> > > > > > +   if (IS_ERR(kmb->lcd_mmio)) {
> > > > > > +           drm_err(&kmb->drm, "failed to map LCD registers\n")=
;
> > > > > > +           return -ENOMEM;
> > > > > > +   }
> > > > > > +
> > > > > > +   /* Map MIPI MMIO registers */
> > > > > > +   kmb->mipi_mmio =3D kmb_map_mmio(drm, "mipi_regs");
> > > > > > +   if (IS_ERR(kmb->mipi_mmio)) {
> > > > > > +           drm_err(&kmb->drm, "failed to map MIPI registers\n"=
);
> > > > > > +           iounmap(kmb->lcd_mmio);
> > > > > > +           return -ENOMEM;
> > > > > > +   }
> > > > > > +
> > > > > > +   /* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and
> > > > > > +    * MSS_CAM_CLK_CTRL register
> > > > > > +    */
> > > > > > +   kmb->msscam_mmio =3D kmb_map_mmio(drm,
> "msscam_regs");
> > > > > > +   if (IS_ERR(kmb->msscam_mmio)) {
> > > > > > +           drm_err(&kmb->drm, "failed to map MSSCAM
> > > > > registers\n");
> > > > > > +           iounmap(kmb->lcd_mmio);
> > > > > > +           iounmap(kmb->mipi_mmio);
> > > > > > +           return -ENOMEM;
> > > > > > +   }
> > > > > > +
> > > > > > +   if (IS_ERR(kmb->msscam_mmio)) {
> > > > > > +           drm_err(&kmb->drm, "failed to map MSSCAM
> > > > > registers\n");
> > > > > > +           iounmap(kmb->lcd_mmio);
> > > > > > +           iounmap(kmb->mipi_mmio);
> > > > > > +           return -ENOMEM;
> > > > > > +   }
> > > > > > +   /* Enable display clocks */
> > > > > > +   kmb_initialize_clocks(kmb, &pdev->dev);
> > > > > > +
> > > > > > +   /* Register irqs here - section 17.3 in databook
> > > > > > +    * lists LCD at 79 and 82 for MIPI under MSS CPU -
> > > > > > +    * firmware has redirected 79 to A53 IRQ 33
> > > > > > +    */
> > > > > > +
> > > > > > +   /* Allocate LCD interrupt resources */
> > > > > > +   irq_lcd =3D platform_get_irq_byname(pdev, "irq_lcd");
> > > > > > +   if (irq_lcd < 0) {
> > > > > > +           drm_err(&kmb->drm, "irq_lcd not found");
> > > > > > +           goto setup_fail;
> > > > > > +   }
> > > > > > +
> > > > > > +   /* Get the optional framebuffer memory resource */
> > > > > > +   ret =3D of_reserved_mem_device_init(drm->dev);
> > > > > > +   if (ret && ret !=3D -ENODEV)
> > > > > > +           return ret;
> > > > > > +
> > > > > > +   spin_lock_init(&kmb->irq_lock);
> > > > > > +
> > > > > > +   kmb->irq_lcd =3D irq_lcd;
> > > > > > +
> > > > > > +   return 0;
> > > > > > +
> > > > > > + setup_fail:
> > > > > > +   of_reserved_mem_device_release(drm->dev);
> > > > > > +
> > > > > > +   return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct drm_mode_config_funcs
> > > kmb_mode_config_funcs =3D {
> > > > > > +   .fb_create =3D drm_gem_fb_create,
> > > > > > +   .atomic_check =3D drm_atomic_helper_check,
> > > > > > +   .atomic_commit =3D drm_atomic_helper_commit,
> > > > > > +};
> > > > > > +
> > > > > > +static int kmb_setup_mode_config(struct drm_device *drm)
> > > > > > +{
> > > > > > +   int ret;
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(drm);
> > > > > > +
> > > > > > +   ret =3D drmm_mode_config_init(drm);
> > > > > > +   if (ret)
> > > > > > +           return ret;
> > > > > > +   drm->mode_config.min_width =3D KMB_MIN_WIDTH;
> > > > > > +   drm->mode_config.min_height =3D KMB_MIN_HEIGHT;
> > > > > > +   drm->mode_config.max_width =3D KMB_MAX_WIDTH;
> > > > > > +   drm->mode_config.max_height =3D KMB_MAX_HEIGHT;
> > > > > > +   drm->mode_config.funcs =3D &kmb_mode_config_funcs;
> > > > > > +
> > > > > > +   ret =3D kmb_setup_crtc(drm);
> > > > > > +   if (ret < 0) {
> > > > > > +           drm_err(drm, "failed to create crtc\n");
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +
> > > > > > +   /* Initialize MIPI DSI */
> > > > > > +   ret =3D kmb_dsi_init(drm, adv_bridge);
> > > > >
> > > > > Split up isn't correct here, this won't compile since the dsi cod=
e isn't
> > > > > in this patch yet. So you need to have this ordered the other way
> round.
> > > > >
> > > > > > +   if (ret) {
> > > > > > +           drm_err(drm, "failed to initialize DSI\n");
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +
> > > > > > +   /* Set the CRTC's port so that the encoder component can fi=
nd
> it
> > > */
> > > > > > +   kmb->crtc.port =3D of_graph_get_port_by_id(drm->dev-
> >of_node,
> > > 0);
> > > > > > +   ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > > > > > +   if (ret < 0) {
> > > > > > +           drm_err(drm, "failed to initialize vblank\n");
> > > > > > +           pm_runtime_disable(drm->dev);
> > > > > > +           return ret;
> > > > > > +   }
> > > > > > +
> > > > > > +   drm_mode_config_reset(drm);
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static irqreturn_t handle_lcd_irq(struct drm_device *dev)
> > > > > > +{
> > > > > > +   unsigned long status, val, val1;
> > > > > > +   int plane_id, dma0_state, dma1_state;
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(dev);
> > > > > > +
> > > > > > +   status =3D kmb_read_lcd(kmb, LCD_INT_STATUS);
> > > > > > +
> > > > > > +   if (status & LCD_INT_EOF) {
> > > > > > +           kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF);
> > > > > > +
> > > > > > +           /* When disabling/enabling LCD layers, the change t=
akes
> > > > > effect
> > > > > > +            * immediately and does not wait for EOF (end of fr=
ame).
> > > > > > +            * When kmb_plane_atomic_disable is called, mark th=
e
> > > > > plane as
> > > > > > +            * disabled but actually disable the plane when EOF=
 irq is
> > > > > > +            * being handled.
> > > > > > +            */
> > > > > > +           for (plane_id =3D LAYER_0;
> > > > > > +                           plane_id < KMB_MAX_PLANES; plane_id=
++)
> > > > > {
> > > > > > +                   if (kmb->plane_status[plane_id].disable) {
> > > > > > +                           kmb_clr_bitmask_lcd(kmb,
> > > > > > +                                               LCD_LAYERn_DMA_=
CFG
> > > > > > +                                               (plane_id),
> > > > > > +
> > > > > LCD_DMA_LAYER_ENABLE);
> > > > > > +
> > > > > > +                           kmb_clr_bitmask_lcd(kmb, LCD_CONTRO=
L,
> > > > > > +                                               kmb-
> > > > > >plane_status[plane_id].ctrl);
> > > > > > +
> > > > > > +                           kmb->plane_status[plane_id].disable=
 =3D false;
> > > > > > +                   }
> > > > > > +           }
> > > > > > +           if (kmb_under_flow) {
> > > > > > +                   /* DMA Recovery after underflow */
> > > > > > +                   dma0_state =3D (layer_no =3D=3D 0) ?
> > > > > > +                       LCD_VIDEO0_DMA0_STATE :
> > > > > LCD_VIDEO1_DMA0_STATE;
> > > > > > +                   dma1_state =3D (layer_no =3D=3D 0) ?
> > > > > > +                       LCD_VIDEO0_DMA1_STATE :
> > > > > LCD_VIDEO1_DMA1_STATE;
> > > > > > +
> > > > > > +                   do {
> > > > > > +                           kmb_write_lcd(kmb, LCD_FIFO_FLUSH, =
1);
> > > > > > +                           val =3D kmb_read_lcd(kmb, dma0_stat=
e)
> > > > > > +                               & LCD_DMA_STATE_ACTIVE;
> > > > > > +                           val1 =3D kmb_read_lcd(kmb, dma1_sta=
te)
> > > > > > +                               & LCD_DMA_STATE_ACTIVE;
> > > > > > +                   } while ((val || val1));
> > > > > > +                   /* disable dma */
> > > > > > +                   kmb_clr_bitmask_lcd(kmb,
> > > > > LCD_LAYERn_DMA_CFG(layer_no),
> > > > > > +                                       LCD_DMA_LAYER_ENABLE);
> > > > > > +                   kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> > > > > > +                   kmb_flush_done =3D 1;
> > > > > > +                   kmb_under_flow =3D 0;
> > > > > > +           }
> > > > > > +   }
> > > > > > +
> > > > > > +   if (status & LCD_INT_LINE_CMP) {
> > > > > > +           /* clear line compare interrupt */
> > > > > > +           kmb_write_lcd(kmb, LCD_INT_CLEAR,
> LCD_INT_LINE_CMP);
> > > > > > +   }
> > > > > > +
> > > > > > +   if (status & LCD_INT_VERT_COMP) {
> > > > > > +           /* Read VSTATUS */
> > > > > > +           val =3D kmb_read_lcd(kmb, LCD_VSTATUS);
> > > > > > +           val =3D (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
> > > > > > +           switch (val) {
> > > > > > +           case LCD_VSTATUS_COMPARE_VSYNC:
> > > > > > +                   /* Clear vertical compare interrupt */
> > > > > > +                   kmb_write_lcd(kmb, LCD_INT_CLEAR,
> > > > > LCD_INT_VERT_COMP);
> > > > > > +                   if (kmb_flush_done) {
> > > > > > +                           kmb_set_bitmask_lcd(kmb,
> > > > > > +                                               LCD_LAYERn_DMA_=
CFG
> > > > > > +                                               (layer_no),
> > > > > > +
> > > > > LCD_DMA_LAYER_ENABLE);
> > > > > > +                           kmb_flush_done =3D 0;
> > > > > > +                   }
> > > > > > +                   drm_handle_vblank(dev, 0);
> > > > >
> > > > > Would be nice to use the new-style drm_crtc_handle_vblank here.
> > > > >
> > > > > > +                   break;
> > > > > > +           case LCD_VSTATUS_COMPARE_BACKPORCH:
> > > > > > +           case LCD_VSTATUS_COMPARE_ACTIVE:
> > > > > > +           case LCD_VSTATUS_COMPARE_FRONT_PORCH:
> > > > > > +                   kmb_write_lcd(kmb, LCD_INT_CLEAR,
> > > > > LCD_INT_VERT_COMP);
> > > > > > +                   break;
> > > > > > +           }
> > > > > > +   }
> > > > > > +   if (status & LCD_INT_DMA_ERR) {
> > > > > > +           val =3D
> > > > > > +               (status & LCD_INT_DMA_ERR &
> > > > > > +                kmb_read_lcd(kmb, LCD_INT_ENABLE));
> > > > > > +           /* LAYER0 - VL0 */
> > > > > > +           if (val & (LAYER0_DMA_FIFO_UNDERFLOW |
> > > > > > +                      LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > > > > > +                      LAYER0_DMA_CR_FIFO_UNDERFLOW)) {
> > > > > > +                   kmb_under_flow++;
> > > > > > +                   drm_info(&kmb->drm,
> > > > > > +                            "!LAYER0:VL0 DMA UNDERFLOW val =3D
> > > > > 0x%lx,under_flow=3D%d",
> > > > > > +                        val, kmb_under_flow);
> > > > > > +                   /* disable underflow interrupt */
> > > > > > +                   kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > > > > +                                       LAYER0_DMA_FIFO_UNDERFL=
OW
> > > > > |
> > > > > > +
> > > > > LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > > > > > +
> > > > > LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > > > > > +                   kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> > > > > > +
> > > > > LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > > > > > +                                       LAYER0_DMA_FIFO_UNDERFL=
OW
> > > > > |
> > > > > > +
> > > > > LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > > > > > +                   /* disable auto restart mode */
> > > > > > +                   kmb_clr_bitmask_lcd(kmb,
> > > > > LCD_LAYERn_DMA_CFG(0),
> > > > > > +
> > > > > LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > > > > > +                   layer_no =3D 0;
> > > > > > +           }
> > > > > > +
> > > > > > +           if (val & LAYER0_DMA_FIFO_OVERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER0:VL0 DMA OVERFLOW val =3D 0x=
%lx",
> > > > > val);
> > > > > > +           if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER0:VL0 DMA CB OVERFLOW val =3D
> > > > > 0x%lx", val);
> > > > > > +           if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER0:VL0 DMA CR OVERFLOW val =3D
> > > > > 0x%lx", val);
> > > > > > +
> > > > > > +           /* LAYER1 - VL1 */
> > > > > > +           if (val & (LAYER1_DMA_FIFO_UNDERFLOW |
> > > > > > +                      LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > > > > > +                      LAYER1_DMA_CR_FIFO_UNDERFLOW)) {
> > > > > > +                   kmb_under_flow++;
> > > > > > +                   drm_info(&kmb->drm,
> > > > > > +                            "!LAYER1:VL1 DMA UNDERFLOW val =3D
> > > > > 0x%lx, under_flow=3D%d",
> > > > > > +                        val, kmb_under_flow);
> > > > > > +                   /* disable underflow interrupt */
> > > > > > +                   kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > > > > +                                       LAYER1_DMA_FIFO_UNDERFL=
OW
> > > > > |
> > > > > > +
> > > > > LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > > > > > +
> > > > > LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > > > > > +                   kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> > > > > > +
> > > > > LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > > > > > +                                       LAYER1_DMA_FIFO_UNDERFL=
OW
> > > > > |
> > > > > > +
> > > > > LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > > > > > +                   /* disable auto restart mode */
> > > > > > +                   kmb_clr_bitmask_lcd(kmb,
> > > > > LCD_LAYERn_DMA_CFG(1),
> > > > > > +
> > > > > LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > > > > > +                   layer_no =3D 1;
> > > > > > +           }
> > > > > > +
> > > > > > +           /* LAYER1 - VL1 */
> > > > > > +           if (val & LAYER1_DMA_FIFO_OVERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER1:VL1 DMA OVERFLOW val =3D 0x=
%lx",
> > > > > val);
> > > > > > +           if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER1:VL1 DMA CB OVERFLOW val =3D
> > > > > 0x%lx", val);
> > > > > > +           if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER1:VL1 DMA CR OVERFLOW val =3D
> > > > > 0x%lx", val);
> > > > > > +
> > > > > > +           /* LAYER2 - GL0 */
> > > > > > +           if (val & LAYER2_DMA_FIFO_UNDERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER2:GL0 DMA UNDERFLOW val =3D
> > > > > 0x%lx", val);
> > > > > > +           if (val & LAYER2_DMA_FIFO_OVERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER2:GL0 DMA OVERFLOW val =3D 0x=
%lx",
> > > > > val);
> > > > > > +
> > > > > > +           /* LAYER3 - GL1 */
> > > > > > +           if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER3:GL1 DMA UNDERFLOW val =3D
> > > > > 0x%lx", val);
> > > > > > +           if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > > > > > +                   drm_dbg(&kmb->drm,
> > > > > > +                           "LAYER3:GL1 DMA OVERFLOW val =3D 0x=
%lx",
> > > > > val);
> > > > > > +   }
> > > > > > +
> > > > > > +   if (status & LCD_INT_LAYER) {
> > > > > > +           /* Clear layer interrupts */
> > > > > > +           kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LAYER);
> > > > > > +   }
> > > > > > +
> > > > > > +   /* Clear all interrupts */
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, 1);
> > > > > > +   return IRQ_HANDLED;
> > > > > > +}
> > > > > > +
> > > > > > +/* IRQ handler */
> > > > > > +static irqreturn_t kmb_isr(int irq, void *arg)
> > > > > > +{
> > > > > > +   struct drm_device *dev =3D (struct drm_device *)arg;
> > > > > > +
> > > > > > +   handle_lcd_irq(dev);
> > > > > > +   return IRQ_HANDLED;
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_irq_reset(struct drm_device *drm)
> > > > > > +{
> > > > > > +   kmb_write_lcd(to_kmb(drm), LCD_INT_CLEAR, 0xFFFF);
> > > > > > +   kmb_write_lcd(to_kmb(drm), LCD_INT_ENABLE, 0);
> > > > > > +}
> > > > > > +
> > > > > > +DEFINE_DRM_GEM_CMA_FOPS(fops);
> > > > > > +
> > > > > > +static struct drm_driver kmb_driver =3D {
> > > > > > +   .driver_features =3D DRIVER_GEM |
> > > > > > +       DRIVER_MODESET | DRIVER_ATOMIC,
> > > > > > +   .irq_handler =3D kmb_isr,
> > > > > > +   .irq_preinstall =3D kmb_irq_reset,
> > > > > > +   .irq_uninstall =3D kmb_irq_reset,
> > > > > > +   /* GEM Operations */
> > > > > > +   .fops =3D &fops,
> > > > > > +   DRM_GEM_CMA_DRIVER_OPS_VMAP,
> > > > > > +   .name =3D "kmb-drm",
> > > > > > +   .desc =3D "KEEMBAY DISPLAY DRIVER ",
> > > > > > +   .date =3D "20190122",
> > > > > > +   .major =3D 1,
> > > > > > +   .minor =3D 0,
> > > > > > +};
> > > > > > +
> > > > > > +static int kmb_remove(struct platform_device *pdev)
> > > > > > +{
> > > > > > +   struct device *dev =3D &pdev->dev;
> > > > > > +   struct drm_device *drm =3D dev_get_drvdata(dev);
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(drm);
> > > > > > +
> > > > > > +   drm_dev_unregister(drm);
> > > > > > +   drm_kms_helper_poll_fini(drm);
> > > > > > +   of_node_put(kmb->crtc.port);
> > > > > > +   kmb->crtc.port =3D NULL;
> > > > > > +   pm_runtime_get_sync(drm->dev);
> > > > > > +   drm_irq_uninstall(drm);
> > > > > > +   pm_runtime_put_sync(drm->dev);
> > > > > > +   pm_runtime_disable(drm->dev);
> > > > > > +
> > > > > > +   of_reserved_mem_device_release(drm->dev);
> > > > > > +
> > > > > > +   /* Release clks */
> > > > > > +   kmb_display_clk_disable();
> > > > > > +   clk_put(kmb_clk.clk_lcd);
> > > > > > +   clk_put(kmb_clk.clk_mipi);
> > > > > > +
> > > > > > +   dev_set_drvdata(dev, NULL);
> > > > > > +
> > > > > > +   /* Unregister DSI host */
> > > > > > +   kmb_dsi_host_unregister();
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int kmb_probe(struct platform_device *pdev)
> > > > > > +{
> > > > > > +   struct device *dev =3D get_device(&pdev->dev);
> > > > > > +   struct kmb_drm_private *kmb;
> > > > > > +   int ret =3D 0;
> > > > > > +
> > > > > > +   /* The bridge (ADV 7535) will return -EPROBE_DEFER until it
> > > > > > +    * has a mipi_dsi_host to register its device to. So, we
> > > > > > +    * first register the DSI host during probe time, and then =
return
> > > > > > +    * -EPROBE_DEFER until the bridge is loaded. Probe will be
> called
> > > > > again
> > > > > > +    *  and then the rest of the driver initialization can proc=
eed
> > > > > > +    *  afterwards and the bridge can be successfully attached.
> > > > > > +    */
> > > > > > +   adv_bridge =3D kmb_dsi_host_bridge_init(dev);
> > > > > > +
> > > > > > +   if (adv_bridge =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> > > > > > +           return -EPROBE_DEFER;
> > > > > > +   } else if (IS_ERR(adv_bridge)) {
> > > > > > +           DRM_ERROR("probe failed to initialize DSI host brid=
ge\n");
> > > > > > +           return PTR_ERR(adv_bridge);
> > > > > > +   }
> > > > > > +
> > > > > > +   /* Create DRM device */
> > > > > > +   kmb =3D devm_drm_dev_alloc(dev, &kmb_driver,
> > > > > > +                            struct kmb_drm_private, drm);
> > > > > > +   if (IS_ERR(kmb))
> > > > > > +           return PTR_ERR(kmb);
> > > > > > +
> > > > > > +   dev_set_drvdata(dev, &kmb->drm);
> > > > > > +
> > > > > > +   ret =3D kmb_hw_init(&kmb->drm, 0);
> > > > > > +   if (ret)
> > > > > > +           goto err_free1;
> > > > > > +
> > > > > > +   ret =3D kmb_setup_mode_config(&kmb->drm);
> > > > > > +   if (ret)
> > > > > > +           goto err_free;
> > > > > > +
> > > > > > +   ret =3D drm_irq_install(&kmb->drm, kmb->irq_lcd);
> > > > > > +   if (ret < 0) {
> > > > > > +           drm_err(&kmb->drm, "failed to install IRQ handler\n=
");
> > > > > > +           goto err_irq;
> > > > > > +   }
> > > > > > +
> > > > > > +   drm_kms_helper_poll_init(&kmb->drm);
> > > > > > +
> > > > > > +   /* Register graphics device with the kernel */
> > > > > > +   ret =3D drm_dev_register(&kmb->drm, 0);
> > > > > > +   if (ret)
> > > > > > +           goto err_register;
> > > > > > +
> > > > > > +   return 0;
> > > > > > +
> > > > > > + err_register:
> > > > > > +   drm_kms_helper_poll_fini(&kmb->drm);
> > > > > > + err_irq:
> > > > > > +   pm_runtime_disable(kmb->drm.dev);
> > > > > > + err_free:
> > > > > > +   drm_crtc_cleanup(&kmb->crtc);
> > > > > > +   drm_mode_config_cleanup(&kmb->drm);
> > > > > > + err_free1:
> > > > > > +   dev_set_drvdata(dev, NULL);
> > > > > > +   kmb_dsi_host_unregister();
> > > > > > +
> > > > > > +   return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct of_device_id kmb_of_match[] =3D {
> > > > > > +   {.compatible =3D "intel,kmb_display"},
> > > > > > +   {},
> > > > > > +};
> > > > > > +
> > > > > > +MODULE_DEVICE_TABLE(of, kmb_of_match);
> > > > > > +
> > > > > > +static int __maybe_unused kmb_pm_suspend(struct device
> *dev)
> > > > > > +{
> > > > > > +   struct drm_device *drm =3D dev_get_drvdata(dev);
> > > > > > +   struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> > > > > > +
> > > > > > +   drm_kms_helper_poll_disable(drm);
> > > > > > +
> > > > > > +   kmb->state =3D drm_atomic_helper_suspend(drm);
> > > > > > +   if (IS_ERR(kmb->state)) {
> > > > > > +           drm_kms_helper_poll_enable(drm);
> > > > > > +           return PTR_ERR(kmb->state);
> > > > > > +   }
> > > > > > +
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int __maybe_unused kmb_pm_resume(struct device *dev)
> > > > > > +{
> > > > > > +   struct drm_device *drm =3D dev_get_drvdata(dev);
> > > > > > +   struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> > > > > > +
> > > > > > +   if (!kmb)
> > > > > > +           return 0;
> > > > > > +
> > > > > > +   drm_atomic_helper_resume(drm, kmb->state);
> > > > > > +   drm_kms_helper_poll_enable(drm);
> > > > > > +
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend,
> > > > > kmb_pm_resume);
> > > > > > +
> > > > > > +static struct platform_driver kmb_platform_driver =3D {
> > > > > > +   .probe =3D kmb_probe,
> > > > > > +   .remove =3D kmb_remove,
> > > > > > +   .driver =3D {
> > > > > > +           .name =3D "kmb-drm",
> > > > > > +           .pm =3D &kmb_pm_ops,
> > > > > > +           .of_match_table =3D kmb_of_match,
> > > > > > +   },
> > > > > > +};
> > > > > > +
> > > > > > +module_platform_driver(kmb_platform_driver);
> > > > > > +
> > > > > > +MODULE_AUTHOR("Intel Corporation");
> > > > > > +MODULE_DESCRIPTION("Keembay Display driver");
> > > > > > +MODULE_LICENSE("GPL v2");
> > > > > > diff --git a/drivers/gpu/drm/kmb/kmb_drv.h
> > > > > b/drivers/gpu/drm/kmb/kmb_drv.h
> > > > > > new file mode 100644
> > > > > > index 0000000..352f2d2
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> > > > > > @@ -0,0 +1,170 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0-only
> > > > > > + *
> > > > > > + * Copyright (c) 2018-2020 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef __KMB_DRV_H__
> > > > > > +#define __KMB_DRV_H__
> > > > > > +
> > > > > > +#include "kmb_plane.h"
> > > > > > +#include "kmb_regs.h"
> > > > > > +
> > > > > > +#define KMB_MAX_WIDTH                      1920 /*max width in
> pixels
> > > > > */
> > > > > > +#define KMB_MAX_HEIGHT                     1080 /*max height i=
n
> > > > > pixels */
> > > > > > +#define KMB_MIN_WIDTH                   1920 /*max width in pi=
xels
> */
> > > > > > +#define KMB_MIN_HEIGHT                  1080 /*max height in p=
ixels
> */
> > > > > > +#define KMB_LCD_DEFAULT_CLK                200000000
> > > > > > +#define KMB_MIPI_DEFAULT_CLK               24000000
> > > > > > +#define KMB_MIPI_DEFAULT_CFG_CLK   24000000
> > > > > > +#define KMB_SYS_CLK_MHZ                    500
> > > > > > +
> > > > > > +#define ICAM_MMIO          0x3b100000
> > > > > > +#define ICAM_LCD_OFFSET            0x1080
> > > > > > +#define ICAM_MMIO_SIZE             0x2000
> > > > > > +
> > > > > > +struct kmb_drm_private {
> > > > > > +   struct drm_device               drm;
> > > > > > +   void __iomem                    *lcd_mmio;
> > > > > > +   void __iomem                    *mipi_mmio;
> > > > > > +   void __iomem                    *msscam_mmio;
> > > > > > +   struct clk                      *clk;
> > > > > > +   struct drm_crtc                 crtc;
> > > > > > +   struct kmb_plane                *plane;
> > > > > > +   struct drm_atomic_state         *state;
> > > > > > +   spinlock_t                      irq_lock;
> > > > > > +   int                             irq_lcd;
> > > > > > +   int                             irq_mipi;
> > > > > > +   int                             sys_clk_mhz;
> > > > > > +   dma_addr_t                      fb_addr;
> > > > > > +   struct layer_status             plane_status[KMB_MAX_PLANES=
];
> > > > > > +};
> > > > > > +
> > > > > > +struct kmb_clock {
> > > > > > +   struct clk *clk_lcd;
> > > > > > +   struct clk *clk_mipi;
> > > > > > +   struct clk *clk_mipi_ecfg;
> > > > > > +   struct clk *clk_mipi_cfg;
> > > > > > +   struct clk *clk_pll0;
> > > > > > +};
> > > > > > +
> > > > > > +static inline struct kmb_drm_private *to_kmb(const struct
> > > drm_device
> > > > > *dev)
> > > > > > +{
> > > > > > +   return container_of(dev, struct kmb_drm_private, drm);
> > > > > > +}
> > > > > > +
> > > > > > +static inline struct kmb_drm_private *crtc_to_kmb_priv(const
> > > struct
> > > > > drm_crtc *x)
> > > > > > +{
> > > > > > +   return container_of(x, struct kmb_drm_private, crtc);
> > > > > > +}
> > > > > > +
> > > > > > +struct blt_layer_config {
> > > > > > +   unsigned char layer_format;
> > > > > > +};
> > > > > > +
> > > > > > +static inline void kmb_write_lcd(struct kmb_drm_private
> *dev_p,
> > > > > > +                            unsigned int reg, u32 value)
> > > > > > +{
> > > > > > +   writel(value, (dev_p->lcd_mmio + reg));
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_write_mipi(struct kmb_drm_private
> *dev_p,
> > > > > > +                             unsigned int reg, u32 value)
> > > > > > +{
> > > > > > +   writel(value, (dev_p->mipi_mmio + reg));
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_write_msscam(struct kmb_drm_private
> > > *dev_p,
> > > > > > +                               unsigned int reg, u32 value)
> > > > > > +{
> > > > > > +   writel(value, (dev_p->msscam_mmio + reg));
> > > > > > +}
> > > > > > +
> > > > > > +static inline u32 kmb_read_msscam(struct kmb_drm_private
> > > *dev_p,
> > > > > > +                             unsigned int reg)
> > > > > > +{
> > > > > > +   return readl(dev_p->msscam_mmio + reg);
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_set_bitmask_msscam(struct
> > > kmb_drm_private
> > > > > *dev_p,
> > > > > > +                                     unsigned int reg, u32 mas=
k)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_msscam(dev_p, reg);
> > > > > > +
> > > > > > +   kmb_write_msscam(dev_p, reg, (reg_val | mask));
> > > > > > +}
> > > > > > +
> > > > > > +static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p,
> > > > > unsigned int reg)
> > > > > > +{
> > > > > > +   return readl(dev_p->lcd_mmio + reg);
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_set_bitmask_lcd(struct kmb_drm_private
> > > > > *dev_p,
> > > > > > +                                  unsigned int reg, u32 mask)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> > > > > > +
> > > > > > +   kmb_write_lcd(dev_p, reg, (reg_val | mask));
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_clr_bitmask_lcd(struct kmb_drm_private
> > > *dev_p,
> > > > > > +                                  unsigned int reg, u32 mask)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> > > > > > +
> > > > > > +   kmb_write_lcd(dev_p, reg, (reg_val & (~mask)));
> > > > > > +}
> > > > > > +
> > > > > > +static inline u32 kmb_read_mipi(struct kmb_drm_private
> *dev_p,
> > > > > unsigned int reg)
> > > > > > +{
> > > > > > +   return readl(dev_p->mipi_mmio + reg);
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_write_bits_mipi(struct kmb_drm_private
> > > *dev_p,
> > > > > > +                                  unsigned int reg, u32 offset=
,
> > > > > > +                                  u32 num_bits, u32 value)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > > > > > +   u32 mask =3D (1 << num_bits) - 1;
> > > > > > +
> > > > > > +   value &=3D mask;
> > > > > > +   mask <<=3D offset;
> > > > > > +   reg_val &=3D (~mask);
> > > > > > +   reg_val |=3D (value << offset);
> > > > > > +   kmb_write_mipi(dev_p, reg, reg_val);
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_set_bit_mipi(struct kmb_drm_private
> > > *dev_p,
> > > > > > +                               unsigned int reg, u32 offset)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > > > > > +
> > > > > > +   kmb_write_mipi(dev_p, reg, reg_val | (1 << offset));
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_clr_bit_mipi(struct kmb_drm_private
> *dev_p,
> > > > > > +                               unsigned int reg, u32 offset)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > > > > > +
> > > > > > +   kmb_write_mipi(dev_p, reg, reg_val & (~(1 << offset)));
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_set_bitmask_mipi(struct
> kmb_drm_private
> > > > > *dev_p,
> > > > > > +                                   unsigned int reg, u32 mask)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > > > > > +
> > > > > > +   kmb_write_mipi(dev_p, reg, (reg_val | mask));
> > > > > > +}
> > > > > > +
> > > > > > +static inline void kmb_clr_bitmask_mipi(struct
> kmb_drm_private
> > > > > *dev_p,
> > > > > > +                                   unsigned int reg, u32 mask)
> > > > > > +{
> > > > > > +   u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> > > > > > +
> > > > > > +   kmb_write_mipi(dev_p, reg, (reg_val & (~mask)));
> > > > > > +}
> > > > > > +
> > > > > > +int kmb_setup_crtc(struct drm_device *dev);
> > > > > > +void kmb_set_scanout(struct kmb_drm_private *lcd);
> > > > > > +#endif /* __KMB_DRV_H__ */
> > > > > > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> > > > > b/drivers/gpu/drm/kmb/kmb_plane.c
> > > > > > new file mode 100644
> > > > > > index 0000000..d1e7786
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > > > > > @@ -0,0 +1,480 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * Copyright (c) 2018-2020 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#include <drm/drm_atomic.h>
> > > > > > +#include <drm/drm_atomic_helper.h>
> > > > > > +#include <drm/drm_crtc.h>
> > > > > > +#include <drm/drm_crtc_helper.h>
> > > > > > +#include <drm/drm_fb_cma_helper.h>
> > > > > > +#include <drm/drm_fb_helper.h>
> > > > > > +#include <drm/drm_fourcc.h>
> > > > > > +#include <drm/drm_gem_cma_helper.h>
> > > > > > +#include <drm/drm_managed.h>
> > > > > > +#include <drm/drm_plane_helper.h>
> > > > > > +
> > > > > > +#include "kmb_drv.h"
> > > > > > +#include "kmb_plane.h"
> > > > > > +#include "kmb_regs.h"
> > > > > > +
> > > > > > +const u32 layer_irqs[] =3D {
> > > > > > +   LCD_INT_VL0,
> > > > > > +   LCD_INT_VL1,
> > > > > > +   LCD_INT_GL0,
> > > > > > +   LCD_INT_GL1
> > > > > > +};
> > > > > > +
> > > > > > +static unsigned int check_pixel_format(struct drm_plane *plane=
,
> u32
> > > > > format)
> > > > > > +{
> > > > > > +   int i;
> > > > > > +
> > > > > > +   for (i =3D 0; i < plane->format_count; i++) {
> > > > > > +           if (plane->format_types[i] =3D=3D format)
> > > > > > +                   return 0;
> > > > > > +   }
> > > > > > +   return -EINVAL;
> > > > > > +}
> > > > > > +
> > > > > > +static int kmb_plane_atomic_check(struct drm_plane *plane,
> > > > > > +                             struct drm_plane_state *state)
> > > > > > +{
> > > > > > +   struct drm_framebuffer *fb;
> > > > > > +   int ret;
> > > > > > +   struct drm_crtc_state *crtc_state;
> > > > > > +   bool can_position;
> > > > > > +
> > > > > > +   fb =3D state->fb;
> > > > > > +   if (!fb || !state->crtc)
> > > > > > +           return 0;
> > > > > > +
> > > > > > +   ret =3D check_pixel_format(plane, fb->format->format);
> > > > > > +   if (ret)
> > > > > > +           return ret;
> > > > > > +
> > > > > > +   if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h >
> > > > > KMB_MAX_HEIGHT)
> > > > > > +           return -EINVAL;
> > > > > > +   if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h <
> > > > > KMB_MIN_HEIGHT)
> > > > > > +           return -EINVAL;
> > > > > > +   can_position =3D (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY=
);
> > > > > > +   crtc_state =3D
> > > > > > +           drm_atomic_get_existing_crtc_state(state->state, st=
ate-
> > > > > >crtc);
> > > > > > +   return drm_atomic_helper_check_plane_state(state,
> crtc_state,
> > > > > > +
> > > > > DRM_PLANE_HELPER_NO_SCALING,
> > > > > > +
> > > > > DRM_PLANE_HELPER_NO_SCALING,
> > > > > > +                                            can_position, true=
);
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_plane_atomic_disable(struct drm_plane *plane,
> > > > > > +                                struct drm_plane_state *state)
> > > > > > +{
> > > > > > +   struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> > > > > > +   int plane_id =3D kmb_plane->id;
> > > > > > +   struct kmb_drm_private *kmb;
> > > > > > +
> > > > > > +   kmb =3D to_kmb(plane->dev);
> > > > > > +
> > > > > > +   switch (plane_id) {
> > > > > > +   case LAYER_0:
> > > > > > +           kmb->plane_status[plane_id].ctrl =3D
> LCD_CTRL_VL1_ENABLE;
> > > > > > +           break;
> > > > > > +   case LAYER_1:
> > > > > > +           kmb->plane_status[plane_id].ctrl =3D
> LCD_CTRL_VL2_ENABLE;
> > > > > > +           break;
> > > > > > +   case LAYER_2:
> > > > > > +           kmb->plane_status[plane_id].ctrl =3D
> LCD_CTRL_GL1_ENABLE;
> > > > > > +           break;
> > > > > > +   case LAYER_3:
> > > > > > +           kmb->plane_status[plane_id].ctrl =3D
> LCD_CTRL_GL2_ENABLE;
> > > > > > +           break;
> > > > > > +   }
> > > > > > +
> > > > > > +   kmb->plane_status[plane_id].disable =3D true;
> > > > > > +}
> > > > > > +
> > > > > > +unsigned int get_pixel_format(u32 format)
> > > > > > +{
> > > > > > +   unsigned int val =3D 0;
> > > > > > +
> > > > > > +   switch (format) {
> > > > > > +           /* planar formats */
> > > > > > +   case DRM_FORMAT_YUV444:
> > > > > > +           val =3D LCD_LAYER_FORMAT_YCBCR444PLAN |
> > > > > LCD_LAYER_PLANAR_STORAGE;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_YVU444:
> > > > > > +           val =3D LCD_LAYER_FORMAT_YCBCR444PLAN |
> > > > > LCD_LAYER_PLANAR_STORAGE
> > > > > > +               | LCD_LAYER_CRCB_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_YUV422:
> > > > > > +           val =3D LCD_LAYER_FORMAT_YCBCR422PLAN |
> > > > > LCD_LAYER_PLANAR_STORAGE;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_YVU422:
> > > > > > +           val =3D LCD_LAYER_FORMAT_YCBCR422PLAN |
> > > > > LCD_LAYER_PLANAR_STORAGE
> > > > > > +               | LCD_LAYER_CRCB_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_YUV420:
> > > > > > +           val =3D LCD_LAYER_FORMAT_YCBCR420PLAN |
> > > > > LCD_LAYER_PLANAR_STORAGE;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_YVU420:
> > > > > > +           val =3D LCD_LAYER_FORMAT_YCBCR420PLAN |
> > > > > LCD_LAYER_PLANAR_STORAGE
> > > > > > +               | LCD_LAYER_CRCB_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_NV12:
> > > > > > +           val =3D LCD_LAYER_FORMAT_NV12 |
> > > > > LCD_LAYER_PLANAR_STORAGE;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_NV21:
> > > > > > +           val =3D LCD_LAYER_FORMAT_NV12 |
> > > > > LCD_LAYER_PLANAR_STORAGE
> > > > > > +               | LCD_LAYER_CRCB_ORDER;
> > > > > > +           break;
> > > > > > +           /* packed formats */
> > > > > > +           /* looks hw requires B & G to be swapped when RGB *=
/
> > > > > > +   case DRM_FORMAT_RGB332:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGB332 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_XBGR4444:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBX4444;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_ARGB4444:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBA4444 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_ABGR4444:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBA4444;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_XRGB1555:
> > > > > > +           val =3D LCD_LAYER_FORMAT_XRGB1555 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_XBGR1555:
> > > > > > +           val =3D LCD_LAYER_FORMAT_XRGB1555;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_ARGB1555:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBA1555 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_ABGR1555:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBA1555;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_RGB565:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGB565 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_BGR565:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGB565;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_RGB888:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGB888 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_BGR888:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGB888;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_XRGB8888:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBX8888 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_XBGR8888:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBX8888;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_ARGB8888:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBA8888 |
> > > > > LCD_LAYER_BGR_ORDER;
> > > > > > +           break;
> > > > > > +   case DRM_FORMAT_ABGR8888:
> > > > > > +           val =3D LCD_LAYER_FORMAT_RGBA8888;
> > > > > > +           break;
> > > > > > +   }
> > > > > > +   DRM_INFO_ONCE("%s : %d format=3D0x%x val=3D0x%x\n",
> > > > > > +                 __func__, __LINE__, format, val);
> > > > > > +   return val;
> > > > > > +}
> > > > > > +
> > > > > > +unsigned int get_bits_per_pixel(const struct drm_format_info
> > > *format)
> > > > > > +{
> > > > > > +   u32 bpp =3D 0;
> > > > > > +   unsigned int val =3D 0;
> > > > > > +
> > > > > > +   if (format->num_planes > 1) {
> > > > > > +           val =3D LCD_LAYER_8BPP;
> > > > > > +           return val;
> > > > > > +   }
> > > > > > +
> > > > > > +   bpp +=3D 8 * format->cpp[0];
> > > > > > +
> > > > > > +   switch (bpp) {
> > > > > > +   case 8:
> > > > > > +           val =3D LCD_LAYER_8BPP;
> > > > > > +           break;
> > > > > > +   case 16:
> > > > > > +           val =3D LCD_LAYER_16BPP;
> > > > > > +           break;
> > > > > > +   case 24:
> > > > > > +           val =3D LCD_LAYER_24BPP;
> > > > > > +           break;
> > > > > > +   case 32:
> > > > > > +           val =3D LCD_LAYER_32BPP;
> > > > > > +           break;
> > > > > > +   }
> > > > > > +
> > > > > > +   DRM_DEBUG("bpp=3D%d val=3D0x%x\n", bpp, val);
> > > > > > +   return val;
> > > > > > +}
> > > > > > +
> > > > > > +static void config_csc(struct kmb_drm_private *kmb, int
> plane_id)
> > > > > > +{
> > > > > > +   /* YUV to RGB conversion using the fixed matrix csc_coef_lc=
d
> */
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF11(plane_id),
> > > > > csc_coef_lcd[0]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF12(plane_id),
> > > > > csc_coef_lcd[1]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF13(plane_id),
> > > > > csc_coef_lcd[2]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF21(plane_id),
> > > > > csc_coef_lcd[3]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF22(plane_id),
> > > > > csc_coef_lcd[4]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF23(plane_id),
> > > > > csc_coef_lcd[5]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF31(plane_id),
> > > > > csc_coef_lcd[6]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF32(plane_id),
> > > > > csc_coef_lcd[7]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF33(plane_id),
> > > > > csc_coef_lcd[8]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF1(plane_id),
> > > > > csc_coef_lcd[9]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF2(plane_id),
> > > > > csc_coef_lcd[10]);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id),
> > > > > csc_coef_lcd[11]);
> > > > > > +}
> > > > > > +
> > > > > > +static void kmb_plane_atomic_update(struct drm_plane *plane,
> > > > > > +                               struct drm_plane_state *state)
> > > > > > +{
> > > > > > +   struct drm_framebuffer *fb;
> > > > > > +   struct kmb_drm_private *kmb;
> > > > > > +   unsigned int width;
> > > > > > +   unsigned int height;
> > > > > > +   unsigned int dma_len;
> > > > > > +   struct kmb_plane *kmb_plane;
> > > > > > +   unsigned int dma_cfg;
> > > > > > +   unsigned int ctrl =3D 0, val =3D 0, out_format =3D 0;
> > > > > > +   unsigned int src_w, src_h, crtc_x, crtc_y;
> > > > > > +   unsigned char plane_id;
> > > > > > +   int num_planes;
> > > > > > +   static dma_addr_t addr[MAX_SUB_PLANES];
> > > > > > +
> > > > > > +   if (!plane || !plane->state || !state)
> > > > > > +           return;
> > > > > > +
> > > > > > +   fb =3D plane->state->fb;
> > > > > > +   if (!fb)
> > > > > > +           return;
> > > > > > +   num_planes =3D fb->format->num_planes;
> > > > > > +   kmb_plane =3D to_kmb_plane(plane);
> > > > > > +   plane_id =3D kmb_plane->id;
> > > > > > +
> > > > > > +   kmb =3D to_kmb(plane->dev);
> > > > > > +
> > > > > > +   if (kmb_under_flow || kmb_flush_done) {
> > > > > > +           drm_dbg(&kmb->drm, "plane_update:underflow!!!!
> > > > > returning");
> > > > > > +           return;
> > > > > > +   }
> > > > > > +
> > > > > > +   src_w =3D (plane->state->src_w >> 16);
> > > > > > +   src_h =3D plane->state->src_h >> 16;
> > > > > > +   crtc_x =3D plane->state->crtc_x;
> > > > > > +   crtc_y =3D plane->state->crtc_y;
> > > > > > +
> > > > > > +   drm_dbg(&kmb->drm,
> > > > > > +           "src_w=3D%d src_h=3D%d, fb->format->format=3D0x%x f=
b-
> > > > > >flags=3D0x%x\n",
> > > > > > +             src_w, src_h, fb->format->format, fb->flags);
> > > > > > +
> > > > > > +   width =3D fb->width;
> > > > > > +   height =3D fb->height;
> > > > > > +   dma_len =3D (width * height * fb->format->cpp[0]);
> > > > > > +   drm_dbg(&kmb->drm, "dma_len=3D%d ", dma_len);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id),
> dma_len);
> > > > > > +   kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_LEN_SHADOW(plane_id),
> > > > > dma_len);
> > > > > > +   kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> > > > > > +                 fb->pitches[0]);
> > > > > > +   kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> > > > > > +                 (width * fb->format->cpp[0]));
> > > > > > +
> > > > > > +   addr[Y_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state,
> 0);
> > > > > > +   kmb->fb_addr =3D addr[Y_PLANE];
> > > > > > +   kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_START_ADDR(plane_id),
> > > > > > +                 addr[Y_PLANE] + fb->offsets[0]);
> > > > > > +   val =3D get_pixel_format(fb->format->format);
> > > > > > +   val |=3D get_bits_per_pixel(fb->format);
> > > > > > +   /* Program Cb/Cr for planar formats */
> > > > > > +   if (num_planes > 1) {
> > > > > > +           kmb_write_lcd(kmb,
> > > > > LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> > > > > > +                         width * fb->format->cpp[0]);
> > > > > > +           kmb_write_lcd(kmb,
> > > > > LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> > > > > > +                         (width * fb->format->cpp[0]));
> > > > > > +
> > > > > > +           addr[U_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane=
-
> > > > > >state,
> > > > > > +                                                   U_PLANE);
> > > > > > +           /* check if Cb/Cr is swapped*/
> > > > > > +           if (num_planes =3D=3D 3 && (val & LCD_LAYER_CRCB_OR=
DER))
> > > > > > +                   kmb_write_lcd(kmb,
> > > > > > +
> > > > > LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > > > > > +                                   addr[U_PLANE]);
> > > > > > +           else
> > > > > > +                   kmb_write_lcd(kmb,
> > > > > > +
> > > > > LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > > > > > +                                   addr[U_PLANE]);
> > > > > > +
> > > > > > +           if (num_planes =3D=3D 3) {
> > > > > > +                   kmb_write_lcd(kmb,
> > > > > > +
> > > > > LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> > > > > > +                                 ((width) * fb->format->cpp[0]=
));
> > > > > > +
> > > > > > +                   kmb_write_lcd(kmb,
> > > > > > +
> > > > > LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> > > > > > +                                 ((width) * fb->format->cpp[0]=
));
> > > > > > +
> > > > > > +                   addr[V_PLANE] =3D drm_fb_cma_get_gem_addr(f=
b,
> > > > > > +                                                           pla=
ne->state,
> > > > > > +                                                           V_P=
LANE);
> > > > > > +
> > > > > > +                   /* check if Cb/Cr is swapped*/
> > > > > > +                   if (val & LCD_LAYER_CRCB_ORDER)
> > > > > > +                           kmb_write_lcd(kmb,
> > > > > > +
> > > > > LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > > > > > +                                         addr[V_PLANE]);
> > > > > > +                   else
> > > > > > +                           kmb_write_lcd(kmb,
> > > > > > +
> > > > > LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > > > > > +                                         addr[V_PLANE]);
> > > > > > +           }
> > > > > > +   }
> > > > > > +
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_HEIGHT(plane_id), src_h -
> 1);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_COL_START(plane_id),
> crtc_x);
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_ROW_START(plane_id),
> crtc_y);
> > > > > > +
> > > > > > +   val |=3D LCD_LAYER_FIFO_100;
> > > > > > +
> > > > > > +   if (val & LCD_LAYER_PLANAR_STORAGE) {
> > > > > > +           val |=3D LCD_LAYER_CSC_EN;
> > > > > > +
> > > > > > +           /* Enable CSC if input is planar and output is RGB =
*/
> > > > > > +           config_csc(kmb, plane_id);
> > > > > > +   }
> > > > > > +
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
> > > > > > +
> > > > > > +   switch (plane_id) {
> > > > > > +   case LAYER_0:
> > > > > > +           ctrl =3D LCD_CTRL_VL1_ENABLE;
> > > > > > +           break;
> > > > > > +   case LAYER_1:
> > > > > > +           ctrl =3D LCD_CTRL_VL2_ENABLE;
> > > > > > +           break;
> > > > > > +   case LAYER_2:
> > > > > > +           ctrl =3D LCD_CTRL_GL1_ENABLE;
> > > > > > +           break;
> > > > > > +   case LAYER_3:
> > > > > > +           ctrl =3D LCD_CTRL_GL2_ENABLE;
> > > > > > +           break;
> > > > > > +   }
> > > > > > +
> > > > > > +   ctrl |=3D LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
> > > > > > +       | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
> > > > > > +
> > > > > > +   /* LCD is connected to MIPI on kmb
> > > > > > +    * Therefore this bit is required for DSI Tx
> > > > > > +    */
> > > > > > +   ctrl |=3D LCD_CTRL_VHSYNC_IDLE_LVL;
> > > > > > +
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> > > > > > +
> > > > > > +   /* FIXME no doc on how to set output format,these values ar=
e
> > > > > > +    * taken from the Myriadx tests
> > > > > > +    */
> > > > > > +   out_format |=3D LCD_OUTF_FORMAT_RGB888;
> > > > > > +
> > > > > > +   /* Leave RGB order,conversion mode and clip mode to default
> */
> > > > > > +   /* do not interleave RGB channels for mipi Tx compatibility=
 */
> > > > > > +   out_format |=3D LCD_OUTF_MIPI_RGB_MODE;
> > > > > > +   kmb_write_lcd(kmb, LCD_OUT_FORMAT_CFG, out_format);
> > > > > > +
> > > > > > +   dma_cfg =3D LCD_DMA_LAYER_ENABLE |
> > > > > LCD_DMA_LAYER_VSTRIDE_EN |
> > > > > > +       LCD_DMA_LAYER_CONT_UPDATE |
> > > > > LCD_DMA_LAYER_AXI_BURST_16;
> > > > > > +
> > > > > > +   /* Enable DMA */
> > > > > > +   kmb_write_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id),
> dma_cfg);
> > > > > > +   drm_dbg(&kmb->drm, "dma_cfg=3D0x%x
> LCD_DMA_CFG=3D0x%x\n",
> > > > > dma_cfg,
> > > > > > +           kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));
> > > > > > +
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF |
> > > > > > +                   LCD_INT_DMA_ERR);
> > > > > > +   kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, LCD_INT_EOF |
> > > > > > +                   LCD_INT_DMA_ERR);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct drm_plane_helper_funcs
> > > kmb_plane_helper_funcs =3D {
> > > > > > +   .atomic_check =3D kmb_plane_atomic_check,
> > > > > > +   .atomic_update =3D kmb_plane_atomic_update,
> > > > > > +   .atomic_disable =3D kmb_plane_atomic_disable
> > > > > > +};
> > > > > > +
> > > > > > +void kmb_plane_destroy(struct drm_plane *plane)
> > > > > > +{
> > > > > > +   struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> > > > > > +
> > > > > > +   drm_plane_cleanup(plane);
> > > > > > +   kfree(kmb_plane);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct drm_plane_funcs kmb_plane_funcs =3D {
> > > > > > +   .update_plane =3D drm_atomic_helper_update_plane,
> > > > > > +   .disable_plane =3D drm_atomic_helper_disable_plane,
> > > > > > +   .destroy =3D kmb_plane_destroy,
> > > > > > +   .reset =3D drm_atomic_helper_plane_reset,
> > > > > > +   .atomic_duplicate_state =3D
> > > > > drm_atomic_helper_plane_duplicate_state,
> > > > > > +   .atomic_destroy_state =3D
> > > drm_atomic_helper_plane_destroy_state,
> > > > > > +};
> > > > > > +
> > > > > > +struct kmb_plane *kmb_plane_init(struct drm_device *drm)
> > > > > > +{
> > > > > > +   struct kmb_drm_private *kmb =3D to_kmb(drm);
> > > > > > +   struct kmb_plane *plane =3D NULL;
> > > > > > +   struct kmb_plane *primary =3D NULL;
> > > > > > +   int i =3D 0;
> > > > > > +   int ret =3D 0;
> > > > > > +   enum drm_plane_type plane_type;
> > > > > > +   const u32 *plane_formats;
> > > > > > +   int num_plane_formats;
> > > > > > +
> > > > > > +   for (i =3D 0; i < KMB_MAX_PLANES; i++) {
> > > > > > +           plane =3D drmm_kzalloc(drm, sizeof(*plane), GFP_KER=
NEL);
> > > > > > +
> > > > > > +           if (!plane) {
> > > > > > +                   drm_err(drm, "Failed to allocate plane\n");
> > > > > > +                   return ERR_PTR(-ENOMEM);
> > > > > > +           }
> > > > > > +
> > > > > > +           plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMAR=
Y :
> > > > > > +               DRM_PLANE_TYPE_OVERLAY;
> > > > > > +           if (i < 2) {
> > > > > > +                   plane_formats =3D kmb_formats_v;
> > > > > > +                   num_plane_formats =3D
> > > > > ARRAY_SIZE(kmb_formats_v);
> > > > > > +           } else {
> > > > > > +                   plane_formats =3D kmb_formats_g;
> > > > > > +                   num_plane_formats =3D
> > > > > ARRAY_SIZE(kmb_formats_g);
> > > > > > +           }
> > > > > > +
> > > > > > +           ret =3D drm_universal_plane_init(drm, &plane->base_=
plane,
> > > > > > +                                          POSSIBLE_CRTCS,
> > > > > &kmb_plane_funcs,
> > > > > > +                                          plane_formats,
> > > > > num_plane_formats,
> > > > > > +                                          NULL, plane_type, "p=
lane %d", i);
> > > > > > +           if (ret < 0) {
> > > > > > +                   drm_err(drm, "drm_universal_plane_init fail=
ed
> > > > > (ret=3D%d)",
> > > > > > +                           ret);
> > > > > > +                   goto cleanup;
> > > > > > +           }
> > > > > > +           drm_dbg(drm, "%s : %d i=3D%d type=3D%d",
> > > > > > +                   __func__, __LINE__,
> > > > > > +                     i, plane_type);
> > > > > > +           drm_plane_helper_add(&plane->base_plane,
> > > > > > +                                &kmb_plane_helper_funcs);
> > > > > > +           if (plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> > > > > > +                   primary =3D plane;
> > > > > > +                   kmb->plane =3D plane;
> > > > > > +           }
> > > > > > +           drm_dbg(drm, "%s : %d primary=3D%p\n", __func__,
> > > > > __LINE__,
> > > > > > +                   &primary->base_plane);
> > > > > > +           plane->id =3D i;
> > > > > > +   }
> > > > > > +
> > > > > > +   return primary;
> > > > > > +cleanup:
> > > > > > +   drmm_kfree(drm, plane);
> > > > > > +   return ERR_PTR(ret);
> > > > > > +}
> > > > > > diff --git a/drivers/gpu/drm/kmb/kmb_plane.h
> > > > > b/drivers/gpu/drm/kmb/kmb_plane.h
> > > > > > new file mode 100644
> > > > > > index 0000000..141cdaa
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> > > > > > @@ -0,0 +1,110 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0-only
> > > > > > + *
> > > > > > + * Copyright (c) 2018-2020 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef __KMB_PLANE_H__
> > > > > > +#define __KMB_PLANE_H__
> > > > > > +
> > > > > > +extern int kmb_under_flow;
> > > > > > +extern int kmb_flush_done;
> > > > > > +
> > > > > > +#define LCD_INT_VL0_ERR ((LAYER0_DMA_FIFO_UNDERFLOW) |
> \
> > > > > > +                   (LAYER0_DMA_FIFO_OVERFLOW) | \
> > > > > > +                   (LAYER0_DMA_CB_FIFO_OVERFLOW) | \
> > > > > > +                   (LAYER0_DMA_CB_FIFO_UNDERFLOW) | \
> > > > > > +                   (LAYER0_DMA_CR_FIFO_OVERFLOW) | \
> > > > > > +                   (LAYER0_DMA_CR_FIFO_UNDERFLOW))
> > > > > > +
> > > > > > +#define LCD_INT_VL1_ERR ((LAYER1_DMA_FIFO_UNDERFLOW) |
> \
> > > > > > +                   (LAYER1_DMA_FIFO_OVERFLOW) | \
> > > > > > +                   (LAYER1_DMA_CB_FIFO_OVERFLOW) | \
> > > > > > +                   (LAYER1_DMA_CB_FIFO_UNDERFLOW) | \
> > > > > > +                   (LAYER1_DMA_CR_FIFO_OVERFLOW) | \
> > > > > > +                   (LAYER1_DMA_CR_FIFO_UNDERFLOW))
> > > > > > +
> > > > > > +#define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW |
> > > > > LAYER2_DMA_FIFO_UNDERFLOW)
> > > > > > +#define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW |
> > > > > LAYER3_DMA_FIFO_UNDERFLOW)
> > > > > > +#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE
> |
> > > > > LCD_INT_VL0_ERR)
> > > > > > +#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE
> |
> > > > > LCD_INT_VL1_ERR)
> > > > > > +#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE
> |
> > > > > LCD_INT_GL0_ERR)
> > > > > > +#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE
> |
> > > > > LCD_INT_GL1_ERR)
> > > > > > +#define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR |
> LCD_INT_VL1_ERR
> > > \
> > > > > > +           | LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
> > > > > > +
> > > > > > +#define POSSIBLE_CRTCS 1
> > > > > > +#define to_kmb_plane(x) container_of(x, struct kmb_plane,
> > > base_plane)
> > > > > > +
> > > > > > +enum layer_id {
> > > > > > +   LAYER_0,
> > > > > > +   LAYER_1,
> > > > > > +   LAYER_2,
> > > > > > +   LAYER_3,
> > > > > > +   /* KMB_MAX_PLANES */
> > > > > > +};
> > > > > > +
> > > > > > +#define KMB_MAX_PLANES 1
> > > > > > +
> > > > > > +enum sub_plane_id {
> > > > > > +   Y_PLANE,
> > > > > > +   U_PLANE,
> > > > > > +   V_PLANE,
> > > > > > +   MAX_SUB_PLANES,
> > > > > > +};
> > > > > > +
> > > > > > +struct kmb_plane {
> > > > > > +   struct drm_plane base_plane;
> > > > > > +   unsigned char id;
> > > > > > +};
> > > > > > +
> > > > > > +/* Graphics layer (layers 2 & 3) formats, only packed formats =
 are
> > > > > supported */
> > > > > > +static const u32 kmb_formats_g[] =3D {
> > > > > > +   DRM_FORMAT_RGB332,
> > > > > > +   DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> > > > > > +   DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> > > > > > +   DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> > > > > > +   DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> > > > > > +   DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> > > > > > +   DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> > > > > > +   DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > > > > > +   DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > > > > > +};
> > > > > > +
> > > > > > +#define MAX_FORMAT_G       (ARRAY_SIZE(kmb_formats_g))
> > > > > > +#define MAX_FORMAT_V       (ARRAY_SIZE(kmb_formats_v))
> > > > > > +
> > > > > > +/* Video layer ( 0 & 1) formats, packed and planar formats are
> > > > > supported */
> > > > > > +static const u32 kmb_formats_v[] =3D {
> > > > > > +   /* packed formats */
> > > > > > +   DRM_FORMAT_RGB332,
> > > > > > +   DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> > > > > > +   DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> > > > > > +   DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> > > > > > +   DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> > > > > > +   DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> > > > > > +   DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> > > > > > +   DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > > > > > +   DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > > > > > +   /*planar formats */
> > > > > > +   DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> > > > > > +   DRM_FORMAT_YUV422, DRM_FORMAT_YVU422,
> > > > > > +   DRM_FORMAT_YUV444, DRM_FORMAT_YVU444,
> > > > > > +   DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> > > > > > +};
> > > > > > +
> > > > > > +/* Conversion (yuv->rgb) matrix from myriadx */
> > > > > > +static const u32 csc_coef_lcd[] =3D {
> > > > > > +   1024, 0, 1436,
> > > > > > +   1024, -352, -731,
> > > > > > +   1024, 1814, 0,
> > > > > > +   -179, 125, -226
> > > > > > +};
> > > > >
> > > > > The static const arrays above look a bit strange in a header file=
 (and
> > > > > could result in duplication in the driver .ko), please move to .c=
 files.
> > > > > Headers should only contain definitions, not declarations of actu=
al
> > > > > storage.
> > > > >
> > > > > Cheers, Daniel
> > > > >
> > > > > > +
> > > > > > +struct layer_status {
> > > > > > +   bool disable;
> > > > > > +   u32 ctrl;
> > > > > > +};
> > > > > > +
> > > > > > +struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> > > > > > +void kmb_plane_destroy(struct drm_plane *plane);
> > > > > > +#endif /* __KMB_PLANE_H__ */
> > > > > > --
> > > > > > 2.7.4
> > > > > >
> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--_002_BY5PR11MB4182DE7017EE772BED3097B18C0D0BY5PR11MB4182namp_
Content-Type: application/octet-stream;
	name="v1-0001-dt-bindings-display-Add-support-for-Intel-KeemBay.patch"
Content-Description: v1-0001-dt-bindings-display-Add-support-for-Intel-KeemBay.patch
Content-Disposition: attachment;
	filename="v1-0001-dt-bindings-display-Add-support-for-Intel-KeemBay.patch";
	size=3655; creation-date="Tue, 06 Oct 2020 00:21:00 GMT";
	modification-date="Tue, 06 Oct 2020 00:21:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmN2M4MzMwNjhkOTRlZWIzZjkzZDVlOGJkNWQ0MmM0YzgxYmM5Y2M3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbml0aGEgQ2hyaXNhbnRodXMgPGFuaXRoYS5jaHJpc2FudGh1
c0BpbnRlbC5jb20+CkRhdGU6IEZyaSwgMiBPY3QgMjAyMCAxNDowNDozNyAtMDcwMApTdWJqZWN0
OiBbUEFUQ0ggdjFdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgc3VwcG9ydCBmb3IgSW50ZWwg
S2VlbUJheQogRGlzcGxheQoKVGhpcyBwYXRjaCBhZGRzIGJpbmRpbmdzIGZvciBJbnRlbCBLZWVt
QmF5IERpc3BsYXkKClNpZ25lZC1vZmYtYnk6IEFuaXRoYSBDaHJpc2FudGh1cyA8YW5pdGhhLmNo
cmlzYW50aHVzQGludGVsLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9pbnRlbCxrbWJf
ZGlzcGxheS55YW1sICAgICAgICB8IDEwNiArKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2ludGVsLGttYl9kaXNwbGF5LnlhbWwKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbnRl
bCxrbWJfZGlzcGxheS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvaW50ZWwsa21iX2Rpc3BsYXkueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwLi42NTgzNWNiCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW50ZWwsa21iX2Rpc3BsYXkueWFtbApAQCAtMCwwICsxLDEw
NiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CislWUFNTCAxLjIK
Ky0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2ludGVsLGtt
Yl9kaXNwbGF5LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKKwordGl0bGU6IERldmljZXRyZWUgYmluZGluZ3MgZm9yIEludGVsIEtl
ZW0gQmF5IGRpc3BsYXkgY29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAgLSBBbml0aGEgQ2hy
aXNhbnRodXMgPGFuaXRoYS5jaHJpc2FudGh1c0BpbnRlbC5jb20+CisgIC0gRWRtb25kIEogRGVh
IDxlZG11bmQuai5kZWFAaW50ZWwuY29tPgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgor
ICAgIGNvbnN0OiBpbnRlbCxrbWJfZGlzcGxheQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMwor
ICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlvbjogTGNkIHJlZ2lzdGVycyByYW5nZQorICAg
ICAgLSBkZXNjcmlwdGlvbjogTWlwaSByZWdpc3RlcnMgcmFuZ2UKKyAgICAgIC0gZGVzY3JpcHRp
b246IE1zc2NhbSByZWdpc3RlcnMgcmFuZ2UKKworICByZWctbmFtZXM6CisgICAgaXRlbXM6Cisg
ICAgICAtIGNvbnN0OiBsY2RfcmVncworICAgICAgLSBjb25zdDogbWlwaV9yZWdzCisgICAgICAt
IGNvbnN0OiBtc3NjYW1fcmVncworCisgIGNsb2NrczoKKyAgICBpdGVtczoKKyAgICAgIC0gZGVz
Y3JpcHRpb246IExDRCBjb250cm9sbGVyIGNsb2NrCisgICAgICAtIGRlc2NyaXB0aW9uOiBNaXBp
IERTSSBjbG9jaworICAgICAgLSBkZXNjcmlwdGlvbjogTWlwaSBEU0kgZWNvbmZpZyBjbG9jawor
ICAgICAgLSBkZXNjcmlwdGlvbjogTWlwaSBEU0kgY29uZmlnIGNsb2NrCisgICAgICAtIGRlc2Ny
aXB0aW9uOiBTeXN0ZW0gY2xvY2sgb3IgcGxsMCBjbG9jaworCisgIGNsb2NrLW5hbWVzOgorICAg
IGl0ZW1zOgorICAgICAgLSBjb25zdDogY2xrX2xjZAorICAgICAgLSBjb25zdDogY2xrX21pcGkK
KyAgICAgIC0gY29uc3Q6IGNsa19taXBpX2VjZmcKKyAgICAgIC0gY29uc3Q6IGNsa19taXBpX2Nm
ZworICAgICAgLSBjb25zdDogY2xrX3BsbDAKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1z
OiAxCisKKyAgaW50ZXJydXB0LW5hbWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogaXJx
X2xjZAorCisgIGVuY29kZXItc2xhdmU6CisgICAgZGVzY3JpcHRpb246IGJyaWRnZSBub2RlIGVu
dHJ5IGZvciBtaXBpIHRvIGhkbWkgY29udmVydGVyCisKKyAgcG9ydDoKKyAgICB0eXBlOiBvYmpl
Y3QKKyAgICBkZXNjcmlwdGlvbjogPgorICAgICAgICAgIFBvcnQgbm9kZSB3aXRoIG9uZSBlbmRw
b2ludCBjb25uZWN0ZWQgdG8gbWlwaSB0byBoZG1pIGNvbnZlcnRlciBub2RlLgorCityZXF1aXJl
ZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gcmVnLW5hbWVzCisgIC0gY2xvY2tzCisg
IC0gY2xvY2stbmFtZXMKKyAgLSBpbnRlcnJ1cHRzCisgIC0gaW50ZXJydXB0LW5hbWVzCisgIC0g
ZW5jb2Rlci1zbGF2ZQorICAtIHBvcnQKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisK
K2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvaXJxLmg+CisgICAgI2RlZmluZSBHSUNfU1BJCisgICAgI2RlZmluZSBNT1ZJU09D
X0tNQl9NU1NfQVVYX0xDRAorICAgICNkZWZpbmUgTU9WSVNPQ19LTUJfTVNTX0FVWF9NSVBJX1RY
MAorICAgICNkZWZpbmUgTU9WSVNPQ19LTUJfTVNTX0FVWF9NSVBJX0VDRkcKKyAgICAjZGVmaW5l
IE1PVklTT0NfS01CX01TU19BVVhfTUlQSV9DRkcKKyAgICAjZGVmaW5lIE1PVklTT0NfS01CX0E1
M19QTExfMF9PVVRfMAorICAgIGRpc3BsYXk6IGRpc3BsYXlAMjA5MDAwMDAgeworICAgICAgY29t
cGF0aWJsZSA9ICJpbnRlbCxrbWJfZGlzcGxheSI7CisgICAgICByZWcgPSA8MHgyMDkzMDAwMCAw
eDMwMDA+LAorICAgICAgICAgICAgPDB4MjA5MDAwMDAgMHg0MDAwPiwKKyAgICAgICAgICAgIDww
eDIwOTEwMDAwIDB4MzA+OworICAgICAgcmVnLW5hbWVzID0gImxjZF9yZWdzIiwgIm1pcGlfcmVn
cyIsICJtc3NjYW1fcmVncyI7CisgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzMgSVJRX1RZ
UEVfTEVWRUxfSElHSD47CisgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiaXJxX2xjZCI7CisgICAg
ICBjbG9ja3MgPSA8JnNjbWlfY2xrIE1PVklTT0NfS01CX01TU19BVVhfTENEPiwKKyAgICAgICAg
ICAgICAgIDwmc2NtaV9jbGsgTU9WSVNPQ19LTUJfTVNTX0FVWF9NSVBJX1RYMD4sCisgICAgICAg
ICAgICAgICA8JnNjbWlfY2xrIE1PVklTT0NfS01CX01TU19BVVhfTUlQSV9FQ0ZHPiwKKyAgICAg
ICAgICAgICAgIDwmc2NtaV9jbGsgTU9WSVNPQ19LTUJfTVNTX0FVWF9NSVBJX0NGRz4sCisgICAg
ICAgICAgICAgICA8JnNjbWlfY2xrIE1PVklTT0NfS01CX0E1M19QTExfMF9PVVRfMD47CisgICAg
ICBjbG9jay1uYW1lcyA9ICJjbGtfbGNkIiwgImNsa19taXBpIiwgImNsa19taXBpX2VjZmciLAor
ICAgICAgICAgICAgICAgICAgICAiY2xrX21pcGlfY2ZnIiwgImNsa19wbGwwIjsKKworICAgICAg
ZW5jb2Rlci1zbGF2ZSA9IDwmYWR2NzUzNT47CisKKyAgICAgIHBvcnQgeworICAgICAgICAgICAg
ZHNpX291dHB1dDogZW5kcG9pbnQgeworICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmYWR2NzUzNV9pbnB1dD47CisgICAgICAgICAgICB9OworICAgICAgfTsKKyAgICB9OwotLSAK
Mi43LjQKCg==

--_002_BY5PR11MB4182DE7017EE772BED3097B18C0D0BY5PR11MB4182namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--_002_BY5PR11MB4182DE7017EE772BED3097B18C0D0BY5PR11MB4182namp_--

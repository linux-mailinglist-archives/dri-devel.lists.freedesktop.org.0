Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF4678123
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78F110E508;
	Mon, 23 Jan 2023 16:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB89610E509;
 Mon, 23 Jan 2023 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674490520; x=1706026520;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OijgA96elsJ5KaJEkEu7EK74Rt18hmjdlbsSoHueefM=;
 b=jZ3kxWiMpkPp1PmJeOuKyZ+zUo3ntrla1yJTNdTAiWdfvabPj04veoda
 LmI3q0G75mTW7e74hDSrCL6wxY9gXBVvN9xwH61HLiLGF+BSSEKVbylS+
 cn+malf2rOPmttu6J7/oG7M969IXc94c8Sw57yI9I7xPb1J7CtHM3xWt0
 jthZn+qRnRmbhKwOBHSR3mi55HCI/ukOAqSw9X1rRhXFg2yAWa6/uKPZi
 1HbYJ6RmcE/1AI5O3iOESCdgQCGecsFbUZcv3ENmKt3X8rZY4VS6dFoym
 0Ki4GUB6DxN2DxCvpjqQyw8Yr8AQBoiiUAYMvn/77LEURzjg9Qd0THYFl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305737174"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="305737174"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785702205"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="785702205"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 08:15:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 08:15:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 08:15:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 08:15:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMBNlKKAlxlrq/Bx4QAHnNBZz/KgiLgUK8/lFM6Jb/GrFKgBn0mVYKUHX0eE0tELHIFOYLxk+QhL0cDDN6P5iuvkRBQA3zHmMFyCtkyi6X89AdkistBph0LgeIdZiyRQ7HLVFS2+WWWJOyt6IBpSIR4Mj0WRqwDVzHKqXhw+2/qpWw6LsFiwpIiIPJy94xnnm6/bbDhKMhVfT5SPBwdoEclpfu8jS8c0E2foDiLikp9ooL3cbGfq8gLMfuY8W5s0gCSldBn5vPCijVLR+yj/+3nCA91mcDQgL4lff+E20ulXp1pSKnZ+ua++OMHokKV/nz9g0lG5eXw9U3BIlcT98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpwmmlbvhVBojf35tbYzaNjVKwHveSNv+mpYxA00sRE=;
 b=h7N1w8P1KhzGsKSzfWRD5K2mkx58dwmt8+uAN4r/S0gcyRwBGceXW2Ev91+A/CV/sndPXO39FdgDuS4DAbB5H5/mwVPi7zASBCX8ISsKo+MIekjB/VUNoDHjOmEjlWUtAnxZQIk/mjOC12d7nMFDSzmU8/6wcFTZUqiVSNh3rS+c6VH5xpKIEY7CFWCHm1WfOrAHFT8vTwVjr9OJX8l6MVVaDg2ZfKRqgfaUllrZ9ok3ozPInkzA/noE1rmnL0P4mgLVbWXscXMJiIZYM3ls9iRBfLAEFcdB8Dc6Xgw+8NENRSH2pc1/Nd1CGtyYwHLL2Y1QVwvpmT0DeYV1viD3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:15:16 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:15:16 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Thread-Topic: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Thread-Index: AQHZLQZn9U3vWVdqMEyhYK+5D+AZPq6oZGPwgAFDJICAAjJXgIAAV1qg
Date: Mon, 23 Jan 2023 16:15:16 +0000
Message-ID: <SJ2PR11MB77159353F7EC04904FAC27BCF8C89@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-2-lucas.demarchi@intel.com>
 <SJ2PR11MB7715CD391A024B61AA4E2323F8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
 <20230122012811.zd7ujwbsuwpt7wjw@ldmartin-desk2.lan>
 <87cz758qhm.fsf@intel.com>
In-Reply-To: <87cz758qhm.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|MW4PR11MB5775:EE_
x-ms-office365-filtering-correlation-id: 9ef936ed-d1c7-4a4d-6394-08dafd5d039b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XHvBug4D0GTcW8snjL+XiSeyT7hHR4S2EPNJedXrAA0Cz9OStFebKl8D6Adxg8L3YUs4H9ELVD6bS9gKduqUlOLJGQ+pMXa744fKq4bSU9MJmlNn1gc2KM55HBtcx8ux5X0xmB+1vnKVCwiqCXSk3Dn9uQHCTBfeXzcY+Kj3wiH10NUiJu+JST0m9bM3metJmqoTCpzfzPKl6LhnkeJhO718AwuIDzAK4WJFEjn841+vPzkGlVLVjp+gH3gxtBQSmnOfsxco5FDO7xXp3BADUY7f99sXGvqgXNLxBBervhzvtEusS2fEIKGn6vwJfu6yhuJBqQZ3SbzkR3FQfO6RJAgu2MSKHbmaViU3zJP8cMiub6MTMmftFN8HhXHXOEGxiOXPKtEu0r0lA/38ROTRFIXeDIof1Lmn05dXF8zdVjDRDgRbZPKWfHnJCcyQkKr1hHKVdX4hctz3sQZribOi7HLlV9lpds/oS6WF20j/l+MNl7x7Yc93PYZcf2Z+6eIecbo+vMJiSparhWiUral79rd1uAovhvBj7X2mFVtx4FwsPNlP86N2IrX09e+OkBqC64ev/rLHgmkbLTEJDseWWzMWLFPOsUDE08D8HB2xGTMaq+Kwt38TVwJ3z23ggzJTdUa/rNl9Dr3G4dyflNnBjLoex1ykG1B9DpdVgu0kq1H19yozJ96lNfHg2qKLW1IMfAfrb5NzEC7RA1A3w45x3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(41300700001)(86362001)(38070700005)(82960400001)(5660300002)(8936002)(52536014)(4326008)(2906002)(83380400001)(122000001)(38100700002)(33656002)(478600001)(110136005)(71200400001)(7696005)(8676002)(53546011)(186003)(6506007)(9686003)(55016003)(6636002)(316002)(76116006)(64756008)(66446008)(66946007)(54906003)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iBToJW5BjTp6i3xsFTnS+R2qXAyoynIMM3lmEnD/vgVq7IzWFupQlukBOW5S?=
 =?us-ascii?Q?PQj1bEkIwRBVbwA943OcqrR8LgVC8Ed7+Im8Pmagwvv13M1v/fBPB6+4zExQ?=
 =?us-ascii?Q?uEAaHoz3wOsf06ZV78QkzM38U12pH2okyXAYZhlu2u2tlVpfyuddIPW2MOb9?=
 =?us-ascii?Q?KtP5brQ2U9uTdaKIsSjx2COWbRRJltIKD/vVYYQM4kOvcXs72wL9nPA5850H?=
 =?us-ascii?Q?dXKvYr66av5tHKovHA8cdJxVy2vL7I4nkLWN6keAbFxCiNqDDOD1QSMXpqno?=
 =?us-ascii?Q?fs+RvDMkP696Xgx0jHsdEe4WgSzyY79HOmfYAu/YZtwW3hVe1CMKccO1JSO0?=
 =?us-ascii?Q?dm7OyxKgvOMWrzuz1OeJpWngMkrfqhrbICn+j7bSWAwV18dIeNHsemprDna+?=
 =?us-ascii?Q?p47a9p/9vqaDfed9VQJfJ6K8m8LxTi/sApux14yoQzL45V/eFUqHWnwk+qtN?=
 =?us-ascii?Q?4Be7QBRcjcjF6+2MTRqJVlTKuyHgQle2ZnwrgWzmqf0CgeaWf6cJT+IsAxXR?=
 =?us-ascii?Q?r6eMeTBjNdpKg1jppn/YpdAyflG1vYxwfF4PRIkeEci1SX0tEk5F+mqbZpmY?=
 =?us-ascii?Q?ivM8lASl4fcKop0bB0GNF+L9ziLoOjqdSvx4eiMB+GCyA4mo0vR8diF7wa+K?=
 =?us-ascii?Q?7NSwLn3wY2g7jJbi2vIi5YBFaUmz6wvFGcvwHjMbCuBcSmjMPDFMUZJyvPGZ?=
 =?us-ascii?Q?8K3d4HAgTyxhutf0X16c7Yc2c4cicsQtEP1P7ISfvhf3WR65eLr3fdUw1o+/?=
 =?us-ascii?Q?ZNbB2ey3Dp6uTsDiZh6LNYIEYpZ5BBsbmfD2PY9wHaGTN8KtuqA7TJmP/sgC?=
 =?us-ascii?Q?ht8YFxOmvDjujxnhCyovSSQpCvXCR0V2J0RNpzTSGCXj5dwGQUWRIE/FyKPd?=
 =?us-ascii?Q?8J212unL5ZZFbHMNc1bQ+DiFFXadamv/tXHZnwgUa78Ia7X5vDbn3FSM6+hN?=
 =?us-ascii?Q?A9jPIKusrGleGphgtSlEtE1Sp+H4I2voDAM/PlYdXgc+RrvKQE4WyqoFOgPl?=
 =?us-ascii?Q?bxnl+hgvmZcaqorFiksCuqSrPKM9J0eIuj4GHrn5lTe10opeBZbSJnmVxeWu?=
 =?us-ascii?Q?uLO1DRvzRHtISqC5UgWlbg+TU6ZBD+nbpehDXR/e0z2ZSjmJNQuBgXogL+cl?=
 =?us-ascii?Q?8kCwm+loET/GPPTc/mktAGAJse03wbi7E4TSrcqQ4pMJRgxTUqsDiGhl1YET?=
 =?us-ascii?Q?hRaJk6MTN+hYo39YmiHoKeKTe86FJdnI47RqqEkYl3+BLHuakixDGnZo6ovL?=
 =?us-ascii?Q?jrFCa8PGjP2UB9L/khR8Yo8kzOnu0CDgAJgCMD/4Jatl89ZHfSIHDX+bUNMu?=
 =?us-ascii?Q?1wqVHuX5WzoG4epTP4tXE133tRGs3R051lwirUffKXd/zrdagUzzAKQC8mnw?=
 =?us-ascii?Q?KAX3zKscVc/Oc7Wvbl0I9ak6s6SuRZQaqGxFl2bj+rzQAxk0gaKpZmcC1rFe?=
 =?us-ascii?Q?Hd8u0EDpC6+OokBOdbVISYjwXDEG0KG1eyHMs4pducls820wGXxzdyAkvu+E?=
 =?us-ascii?Q?8tip27Xkeb702psR/iZNzrBe1YhYyqprk2PZWTqAlAS0ccZ5UPhFzg6Wb11X?=
 =?us-ascii?Q?22wCAKgM8NJ8h3wA5BRkcEmaB2cfVXp2txHf2D03e0BFGNWIkl9/+qgbsn3O?=
 =?us-ascii?Q?kZRCnnK1tatc+p0YXTPVW29Ief0v1hfYSamNlvSmqybM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef936ed-d1c7-4a4d-6394-08dafd5d039b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 16:15:16.0491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkuJ3ndS4HWCS9apShleHEssKtCS8xG+VHEo5Z2XQH2lxUasgCZcJrHcyyymzjqodszKziCVEw/kRzvK7cK7HRQ0Kqd24k/LA1/sBtoypmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
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



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, January 23, 2023 3:01 AM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Srivatsa, Anusha
> <anusha.srivatsa@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES(=
)
>=20
> On Sat, 21 Jan 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Fri, Jan 20, 2023 at 10:14:19PM -0800, Anusha Srivatsa wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf
> >>> Of Lucas De Marchi
> >>> Sent: Friday, January 20, 2023 11:35 AM
> >>> To: intel-gfx@lists.freedesktop.org
> >>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
> >>> devel@lists.freedesktop.org
> >>> Subject: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add
> >>> _PICK_EVEN_2RANGES()
> >>>
> >>> It's a constant pattern in the driver to need to use 2 ranges of
> >>> MMIOs based on port, phy, pll, etc. When that happens, instead of
> >>> using _PICK_EVEN(), _PICK() needs to be used.  Using _PICK() is disco=
uraged
> due to some reasons like:
> >>>
> >>> 1) It increases the code size since the array is declared
> >>>    in each call site
> >>> 2) Developers need to be careful not to incur an
> >>>    out-of-bounds array access
> >>> 3) Developers need to be careful that the indexes match the
> >>>    table. For that it may be that the table needs to contain
> >>>    holes, making (1) even worse.
> >>>
> >>> Add a variant of _PICK_EVEN() that works with 2 ranges and selects
> >>> which one to use depending on the index value.
> >>>
> >>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/i915/i915_reg_defs.h | 28
> >>> ++++++++++++++++++++++++++++
> >>>  1 file changed, 28 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h
> >>> b/drivers/gpu/drm/i915/i915_reg_defs.h
> >>> index be43580a6979..b7ec87464d69 100644
> >>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> >>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> >>> @@ -119,6 +119,34 @@
> >>>   */
> >>>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) -
> >>> (__a)))
> >>>
> >>> +/*
> >>> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address
> offsets.
> >>> + * The first range is used for indexes below @__c_index, and the
> >>> +second
> >>> + * range is used for anything above it. Example::
> >>> + *
> >>> + * #define _FOO_A			0xf000
> >>> + * #define _FOO_B			0xf004
> >>> + * #define _FOO_C			0xf008
> >>> + * #define _SUPER_FOO_A			0xa000
> >>> + * #define _SUPER_FOO_B			0xa100
> >>> + * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,
> >>> 		\
> >>> + *					      _FOO_A, _FOO_B,
> >>> 	\
> >>> + *					      _SUPER_FOO_A, _SUPER_FOO_B))
> >>> + *
> >>> + * This expands to:
> >>> + *	0: 0xf000,
> >>> + *	1: 0xf004,
> >>> + *	2: 0xf008,
> >>> + *	3: 0xa100,
> >>You mean 3:0xa000
> >
> > doesn't really matter. This is an example of register addresses. They
> > don't need to start from 0, it's whatever the hw gives us.
>=20
> I think the point is that the example is inconsistent between _SUPER_FOO_=
A and
> "3: 0xa100".

Yes. It's the inconsistency with _SUPER_FOO_A that I was pointing out.

Anusha
> BR,
> Jani.
>=20
> >
> > Lucas De Marchi
> >
> >>
> >>> + *	4: 0xa200,
> >>4:0xa100
> >>
> >>> + *	5: 0xa300,
> >>5:0xa200
> >>
> >>Anusha
> >>> + *	...
> >>> + */
> >>> +#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)
> >>> 	\
> >>> +	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +
> >>> 	\
> >>> +	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :
> >>> 	\
> >>> +				   _PICK_EVEN((__index) - (__c_index), __c,
> >>> __d)))
> >>> +
> >>>  /*
> >>>   * Given the arbitrary numbers in varargs, pick the 0-based __index'=
th
> number.
> >>>   *
> >>> --
> >>> 2.39.0
> >>
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center

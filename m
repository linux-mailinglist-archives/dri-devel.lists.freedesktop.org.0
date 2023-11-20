Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F917F142B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 14:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2F310E3C9;
	Mon, 20 Nov 2023 13:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D47710E3C7;
 Mon, 20 Nov 2023 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700486230; x=1732022230;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=83uaNdEsgxNI7IHPn0CHYWtaebrAsDRouGTbcdSGxZw=;
 b=IfjA5JNVBTtU7Yb4TOPr06B1rWI6uYfUs23syRvTspBupV2IERGadZi5
 1r4NQqGCqWozdgMqCuaZabDCk7lRQsCLNzabTHnkttNiC1I7umF0C0nda
 okJnN06RxLEn1yd0qNW7PjF5phjds5yZa8QcozUKVoQG7rtWYwapnBQDv
 6+654e/+Nd7xr5NqQA8RPb3kZbvNY63Cinum2ZNDTifxg2S8M4xWX8wg7
 yxVKD0SpSe+e+9MZnwMEtXrhLu76wveruVjTjE69riV4QHhrrVTnnnHTg
 aG3LLGxrVDkmBRGkFlGIxKi/eF/xWdBf8DiJ6cFLwynnKnxMDTCFaJ7+G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4797951"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="4797951"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 05:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="801167103"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="801167103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 05:17:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 05:17:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 05:17:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 05:17:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 05:17:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri8gGAkx0zkpZTk/ncurAEoHwRepNUmBvo4Uo2AkDeVr6OwbXaBAJdFX4TzApTSwe9KAzxg9P37DW6OUIhu7CbZEmRZuRpirEKc/IFDi71rBK+OBsEjDFDVqywlJUVDlLnWCMpr6UCYGFib9z9BdGdCwqCczLTkWKQ18o4Ygn2uW6Vy5BgLSFYqZr6ONgqyvWoIPLsVrHBH/KVyOBJD6MsTpxAzD6+pt65zMYPkMEQtzNWQKVZA+72/3MrHEH+fSuyvjdmnp7fCb3Nj1wL+QmyrWZO02LBjLpNPYbkDQtyrp+CZ5mVtigG3XLgWQxZ3R9AN+riSakk3NKDDOLs05fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QR2f05GZnWfVYMn/0j9ZixlqeA9on/NT7rSJuoVo8Uc=;
 b=BDQxZLney77kELzYU9+BhgPmnvQTYCCkZTyRlfBTIPIRdpcix5VGpTBw6+nO2eKf1Ppxq6HVhG3ONM47sdoZ+dybbNRz0gkP3jrnsnPZwhYhaZMPKx3cyhwXVrPV6MfGuQtKS8a+faPAsHgfRwdWkNHnlRc74ROYV1Tyeezsp8xObtDoR+7dxedLckWGhPu/MpCTEQwKyJjFwmyHLVt5TOTHF5zHMxS4BuKiHTdjx0Y01Eub2B+k2lSGOiDz/KF0NkzIArwiqXV30cepEZrKsPb/nOlUZXlJ+E7VPFjGN/eD2jN7tO7btypshWpHxnS8bxDeMVZ5mhLwCevePxyxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 13:17:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 13:17:05 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
Thread-Topic: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
Thread-Index: AQHZ/ddIZSsnYdkm4UKlnbOX3TZtTbBjue2AgABy1ACAHzjNEIAABXow
Date: Mon, 20 Nov 2023 13:17:05 +0000
Message-ID: <SJ1PR11MB61299BB0464C687EBA4C41B1B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-2-ville.syrjala@linux.intel.com>
 <8734xr5f0o.fsf@intel.com> <ZUElHKaa5rnifyvy@intel.com>
 <SJ1PR11MB61295A8D16AEFE78E0F9EBD3B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61295A8D16AEFE78E0F9EBD3B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MW4PR11MB6840:EE_
x-ms-office365-filtering-correlation-id: 88a39589-0128-48da-d679-08dbe9cafdb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ETaQeoMkD9b8710HiDpus9u0yIAvITdKaDvVg8EtToKW/OicsqFmyXTfus+Ph13TtSEiJNDrZEHo1ZtR0POO7Dpe/BJPhw2Tkig5VlTLS6ckJ7mM22cbaXcpz9EcuxJDpfoeKkhcrN1rBOtWccZVj6YVmPNHGLyrLRosIvTWuWinvwL6Tq5OTSNH+FiTxZctMtVMf5deYAC/Wma38YMxU8iCDptOPpiN7ZHCoau5IrLIHZl4kr2uEWuCqz19pmTPBbEOrVZQHXxOjt1YYKdkk8s/z3sXMN2OFQl+FTzP3auL/4GCwiuvtEZFjTiDu8DM7BvBSnqBa4+APbBvkhx/tgCAhqNsIQ0begVR738F7QparSB4hFBwUByZBgwrUj5hACXmSzu6QlojpBFSbMCy5lyPhst796pjWJ58xIkCkhV/vFAdEIAIcscrrZN9kAjDF4tueRIIloRi7YwQeJikxWgco2uVUQbcObwFbQOiDKcUp+uIHyh57hjlRnT7SwwgiQ2zsyCXj5PJ571/nNvF/uFgP6YZ+o2TRMNrsr+e0km27nxEzkp3Drr/ai1RPPl2TDevF20xvwa1NSEaAPVjlFrYQoIyz7F72JXkcBCZPSc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(83380400001)(54906003)(64756008)(316002)(6916009)(66556008)(66946007)(66476007)(66446008)(76116006)(53546011)(6506007)(7696005)(86362001)(5660300002)(2906002)(478600001)(2940100002)(52536014)(33656002)(55016003)(9686003)(82960400001)(122000001)(41300700001)(71200400001)(38100700002)(38070700009)(966005)(8676002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2WB5Q6ZE+KZ0acTimwdvLRrytfVA3AWJkE3HsRgHkCP7aMG+jvNDMJLNTz?=
 =?iso-8859-1?Q?a782HE22JPdsI3P54Xp2UiaMs92BJsBlE6bqjR2BtHnFtXYp1j2fVwz4+D?=
 =?iso-8859-1?Q?7PoIP2HUzNKHmqWedi5ISrkf9pKFGYkHCup70Hs4F38LjTLbN5T+L6u/Q7?=
 =?iso-8859-1?Q?Xm51dYhSRDlskJ+6/s3pbHlmmQ9WnguAi4APFq+xhCfUtqa3A2SI05YBLX?=
 =?iso-8859-1?Q?K5GH6kTM8X0PXUEKaiw6KXuxyMxjQUxmGbvQSjVwEUFKiT+RhTYXQIu9j5?=
 =?iso-8859-1?Q?20ma0+wAYW2BZu2DtRIe/YkNPUzHUD6GaK1D1QZnW0/LDqoY9xceDJLQUG?=
 =?iso-8859-1?Q?oGJYc1/MLlte1inDiXiCg5cmWS9E/dDlV/SoE/LgkJyXOGKB8GUUIBiXgq?=
 =?iso-8859-1?Q?RuCbrb/Bbmg6ihotpFRz1aJ9nzTMyn+gFuiG2v9hFx4pckDpqpVuMHOksx?=
 =?iso-8859-1?Q?Y67HkUyHe/81p0LIY0AkvBF2KcsORAZmoh5Pfo4+ad4iVCmcX6WztdLIM0?=
 =?iso-8859-1?Q?LZ9Rl/AjbHKLKhPvMytuYGm0mfXXZ2VSqBzcrQU+cFFHy+wZHPJb4pDzBe?=
 =?iso-8859-1?Q?oXzVYpPPCwcwGiAgaKvk6PXo2CxNeSfdIYKIUGvBHydMX27RjqwCO8XCcw?=
 =?iso-8859-1?Q?pFxOJfzUz+zvKPgoQ9WtTE6nCheG3RGcIZ4zCJnhpnd7zKByWdLKtgi5R/?=
 =?iso-8859-1?Q?S9DvmtydQMZFS4sFLOIESc6SSGq31Ef2D/QRmPHdLZmyzQ3UaPBKiH880I?=
 =?iso-8859-1?Q?mUe2KhxmTAkZfqHD9qhnXD8Wxpss8KOVjr9qYfYdPNgWLpiJ0hbciQmgeO?=
 =?iso-8859-1?Q?1nMUXfOK5idOYhqGaZn+9m9S2lKDcfj6G++vntLZSvnQ5F4Sq2sdbf1FAN?=
 =?iso-8859-1?Q?gA9j9d2KMQcCs5u1KLKqAUC1EGeF1Nn5cr2IoTmhRy0j/1PQcVkW2j1bIB?=
 =?iso-8859-1?Q?+98yN8B14FZ1JxYNRpUzwqURb1g6mNfA5cHI3PKO7E9NvvhhyBywDsHR2X?=
 =?iso-8859-1?Q?NwquSnguhLliQgBeL2/+YTzl7gP5atlIMRjeUh+4fde/SoM5iWilGbCly7?=
 =?iso-8859-1?Q?pkAxOcg0gE25eUTQswrniWkO4YCVWP5kYzquI4/28v8f//T6qq49eti8C7?=
 =?iso-8859-1?Q?fycu7juHVUv9mDn86MfUmQoW0doktFupGMh9nch42u3PWaR3lTsWvNapxd?=
 =?iso-8859-1?Q?qGl52niBn6JdrEd7v59+RMxYvLl+UrnzptdS8VHdSulsdzDlKgkgIjhHHJ?=
 =?iso-8859-1?Q?pstoLgjHFH45XKqlf3WGmGadkmTQ2/6ylj14PqDir90CcsoX3zztMVdm/2?=
 =?iso-8859-1?Q?mdVrJCQu+SRoG+wJDc9+JUzrRgCrwIU8+i7WNFUQzL28nBJ5N5tZZmBOqy?=
 =?iso-8859-1?Q?zcmjGBvJHMZNQISLXfWGtCL8msINgVgkFhD0/2tecxVlH5DGLy6wpakgab?=
 =?iso-8859-1?Q?n8xqvk837E4rs/ZqGIivlQSWb+P4uLgLD0vsZvLcVXdQEO4L4bpmmYIyHj?=
 =?iso-8859-1?Q?fiBqP2DrKECMdofnP70NrploCHJcDiEBvYBlYcptqAMjEHzPvY5ZPnCeTY?=
 =?iso-8859-1?Q?Tlns8ryxbrQdwV7vwrQMPSR9qwqoRIYaGPH6ess83bEDoBX4BUkmoX5J1h?=
 =?iso-8859-1?Q?dNOWOYWe8EO306EWoL9ARTdO9/NXfcP/pGmbCYZD/RkwioLSY+YNG4uQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a39589-0128-48da-d679-08dbe9cafdb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 13:17:05.2221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBRKiQQyLh2j8ZJDOMdjiRUkKoEi6533Oxg6c03czL53RfWAJwT3g6atwcrNa1I++9cKcduv4o0tNFYrnOVq/9y52HpoANs0Gaqerj58iCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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
> From: Borah, Chaitanya Kumar
> Sent: Monday, November 20, 2023 6:33 PM
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Jan=
i
> Nikula <jani.nikula@linux.intel.com>
> Subject: RE: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
>=20
> Hello Ville,
>=20
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > Ville Syrj=E4l=E4
> > Sent: Tuesday, October 31, 2023 9:37 PM
> > To: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Subject: Re: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
> >
> > On Tue, Oct 31, 2023 at 11:15:35AM +0200, Jani Nikula wrote:
> > > On Fri, 13 Oct 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wr=
ote:
> > > > entrirely. But perhaps a better idea would be to follow the OpenGL
> > > > int<->float conversion rules, in which case we get the following
> > > > results:
> > >
> > > Do you have a pointer to the rules handy, I couldn't find it. :(
> >
> > Eg. '2.3.5 Fixed-Point Data Conversions' in GL 4.6 spec. The section
> > number probably changes depending on which version of the spec you look
> at.
> >
>=20
> This section particularly talks about conversion of normalized fixed poin=
t  to
> floating point numbers and vice versa.
> Pardon my limited knowledge on the topic but aren't we just doing a scali=
ng
> factor conversion(Q0.16 -> Q0.8) in these patches?
>=20
> I could not draw a direct relation between the formulas in the section[1]=
 and
> what we are doing here.(but it could be just me!)

Scratch that! As I understand, in effect we are doing a Q0.16 Fixed Point -=
> Floating point -> Q0.8 Fixed Point conversion.
Correct me if I am wrong! Otherwise

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


>=20
> Regards
>=20
> Chaitanya
>=20
> [1] https://registry.khronos.org/OpenGL/specs/gl/glspec46.core.pdf '2.3.5
> Fixed-Point Data Conversions'
>=20
> > >
> > > Might also add the reference to the commit message and/or comment.
> > >
> > > BR,
> > > Jani.
> > >
> > > --
> > > Jani Nikula, Intel
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel

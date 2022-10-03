Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3B5F328C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 17:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E95910E3FE;
	Mon,  3 Oct 2022 15:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFB810E3F8;
 Mon,  3 Oct 2022 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664811205; x=1696347205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T2PPRU6+GdnePh5xGHFaX4XiJLxa1WZLQ8f8qbO324s=;
 b=Z5x0P99K2cuD+VM7/Ev5ysWFxYrbt32s5O4LMPvA7rwsXNlSJKjRLJyF
 tMtPJl6kKhxNJSsZq27f0+XI5veLcayksOr2MTgYd98vhsXH/VeBnCtJE
 E+OTrrBZti5XS2+SvBAemO/75U9r0dVm356iHTgFoJ+4EyscwprXEzTpC
 e67Cts12vaQg5H3esF19S6xGC+R/YDdVfPW6/8vg3/xj6FdlJqn1endT1
 BDOjdvN6uOOgE2VDOeVkKmMa9Eiqzds4rxo7MVrvM6Deq4n58RBd0oS4T
 dUM6VBDaNK5OCbp1DYxuHrA5tbYvF68T/Jai/j8Ij5jyey+mxhe+O303t A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="329062565"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="329062565"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 08:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="601264401"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="601264401"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 03 Oct 2022 08:33:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 08:33:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 3 Oct 2022 08:33:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 3 Oct 2022 08:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wj1QetTvVL4pYwjxwBwE715EJaxnMbb9hesswuy8YvL1HFKOKx7U9u7NyVHX/vj3gHInZo1rnjc7K1LHZJocEF4IXOhWSPy1enC7EzVXK7lJJgop6FqT+net9ZNuBsDX7zxxsfieETY0zmER/PoiqQpJ0MMckLM9IDGpIJfRtzm5GINK/ooFQwtiWeJkoCn45mT+qR32xF+E4jsokmKjldpvqHjyy7SJ7MmMesHGLIxdxB87Foy/W60i5TPlcJgKSLa35gqRdQqFnb9+F3eXI+QKbKPFst9kumu7LLdFnQt1+kv6ISpC53kq3FIu4+BAcRz4bSWlZjsFmuTti0tDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2PPRU6+GdnePh5xGHFaX4XiJLxa1WZLQ8f8qbO324s=;
 b=japjhiQX45VzQ2s6dIDgDW9W8YTL7XVkXeRGtp6svhmvJ3z/iJy8Cl9eQMWes7QxM/7nWPJI62IXST0zUl7bGOZ/HZtiodqKM8NQCbAdTqdIpMZPgMWLGOEX13XEaxjTaHoqPAPepXLQINw+cXqdYKWZ9R38BWNQn8JqqEzUUyXBslIlCxcoofmWMhlp2cXgCr5JRARykqeQZOen0AEKHCvUOl+Ixd+HN+iHgz19wl036LLMK/acEt1LpqWyKv8g2MLDBCsFUiuao9JDRmC+10MFUQQ489LF+kx44W2wts46GB4qIMZw6NawAEoLz/7LkTRwUOqCyWXBrIufhOyiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 CO6PR11MB5667.namprd11.prod.outlook.com (2603:10b6:5:35b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.24; Mon, 3 Oct 2022 15:33:22 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::6405:c026:bd12:85d4]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::6405:c026:bd12:85d4%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 15:33:21 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v4.1] drm/i915/mtl: Define engine context layouts
Thread-Topic: [PATCH v4.1] drm/i915/mtl: Define engine context layouts
Thread-Index: AQHY01LQs/+rDmozhES2YdbM0MvBd633G3WAgAAFJaA=
Date: Mon, 3 Oct 2022 15:33:21 +0000
Message-ID: <DM4PR11MB5971395EEA872335C9A3DAC9875B9@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220928155511.2379663-1-radhakrishna.sripada@intel.com>
 <20220930001031.35cnjng7txadie5b@ldmartin-desk2.lan>
In-Reply-To: <20220930001031.35cnjng7txadie5b@ldmartin-desk2.lan>
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
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|CO6PR11MB5667:EE_
x-ms-office365-filtering-correlation-id: 99069a85-4a5b-44c2-7ddb-08daa5549a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LaEePu6ioKo71O3Qpk8cPk3EyJ+3ZvaCfGI/agH49qHkxLCv4ueWOw/c/RXOlGXmLGmvQSXOI2rQ12LwyJ/T3MxOHqDO1ona55Qk/kK1WcAElXRdaxELPMO3/aBOPm0ZOueuktHwZFwFwSvPZrQfdOsJ6rRCjM57QSFQdAN11DdV+zGD8/InxgdbtYeY5bgIDIYx0Fow0K0yJHldyauM/0KgV+xQYWx67nK20JuBSQfdoTSsm26QT6GK/MhgeSpe0NRrQKxpc/AcVOCGukqbOO5c9J+CiOfpcIL3ine8FZhfq8LOwkN4IoIaRdPHWrTZypPTuFLmU2egtCLAEjd5ViSPUlqHEZTSaE99L/CEyq5o/f8igl4bLGZGcpQ1GNQZjFFcFUx4qdLrCMmAGW2TS2iwlufDaLqlPuMuZJb1tp1C40rcoxXfot5gjDWk50+lYcLPW7IRI5mBolIizRxLis3sgKlYe4DQWQkWh8hL2q03Tcy874D6fFFR/rdrQvc8LKoXhlyU7LsAaRVpiAhhQIhe6X22HZbJRpyA1QOoBBm4N3MmGlrzTgi/dHncA3ZzVoZiLMp7YbA9WfkkhLhQe9pb+8sF62ALDSJDKiUdUqotnbq11crb661U4zZrCHTeJPGENbQ6uT1cE3iLAnkqVyoEHnB9yTtUNHsyqRvsrJxY7JWOOEsgUvVwOBkoeDlIy2f0zMNlxzYAw5UB7X1SbFJs5LE+pDhnJozuaHWICN3cTBRJtVBjaSpfKY+0VqBt+LgCMlpNebEDLK1yruIRmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(71200400001)(38070700005)(6636002)(82960400001)(316002)(54906003)(478600001)(66556008)(66446008)(41300700001)(38100700002)(8676002)(4326008)(450100002)(186003)(2906002)(55016003)(86362001)(122000001)(6506007)(7696005)(53546011)(66476007)(64756008)(5660300002)(26005)(9686003)(66946007)(6862004)(76116006)(83380400001)(8936002)(33656002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5ryARKCmiM2Vhnwl4U0hyr5a3qh2dOBcBzvv9oG3sYov1jvLf0od/2kTW9Ya?=
 =?us-ascii?Q?mfCeERKFB4ogGI8PSbe6Oh+xRvNhqdAz/IGpzeUDPrA7OyysbsasFMTekCNg?=
 =?us-ascii?Q?xl1FVfXvnqh34+Q9h/pwXrCRjlvMpahWLmd826cOh04c59uOjZs6MH9oOOjD?=
 =?us-ascii?Q?3dgpEVbqCKouRj7V4hnWfpi3M7dIME36/peHz9AhnrE1JnLAxG8u4I9QUcAY?=
 =?us-ascii?Q?0Pb9TOUpWDsAcvjFVp+4r4rsnF0naRHVNZutxnvkTiHg1VIJXtWQZhFUCgTb?=
 =?us-ascii?Q?WGwmf2MSYEaTmU/h6/9gLUqbJBLRBw1aX9RvLH4aINaPgaWjmWcM1c6yOUuZ?=
 =?us-ascii?Q?snsq1QqGhWcBwzmpiFhBHpdUbijXHK85nWDMZioVp03wWUyJvcg/0YaQJBJB?=
 =?us-ascii?Q?7ceLdRR24qVUIgT1AOvcylk/9lZhKk3Hutm5EkUFWd1QgGXJXxAISehGw63H?=
 =?us-ascii?Q?UF8+cV5JYcMNVOaDd57eJ7ohRcInAQhTfjiq6/NQfjstDRRJYYq8KKJ2E7hg?=
 =?us-ascii?Q?HMyI0HPhFcJwYENeP58WCakwhGSQcKyT9GyOBXQAFrbarqqA0bylcvzsv0UI?=
 =?us-ascii?Q?a+VXXuueNldH6cNoEwKHaFiHHG2nkyAC5HaWncPSD8fIuaiQp4VHN4x8c1k3?=
 =?us-ascii?Q?N+AUj/ChACxcwEip1UFJ5zD/EMUCLQ4Bt0nuzcPaZoT2+t197DKTn6t3n/Vu?=
 =?us-ascii?Q?MppVOYkbm1zVCF/2WjuAggYSptv3lI1aLnjsAfqMzQjHO9mR68uITrlr21Z6?=
 =?us-ascii?Q?Uf19eX1RYrssEUd1US2/NQ46pC68coZGVb8LS3xbDLY7QqZDQGeAq0gXm0vS?=
 =?us-ascii?Q?qu62yS8b7SQxKhFrwF0ThIGVlWyoFyZAA+srDkDmi8Rtrk2o0OJS0NJeYhZG?=
 =?us-ascii?Q?7kaSU1YF9pDBuvVZfEKHQWbf/ID1YZvDmkKps64odQrtmkimXJDUBfeI3CJI?=
 =?us-ascii?Q?5XEnL2+RIkt6Y2ZPqMcWOvUH32hzlTnhzc6mWxNIh6cN8kOc6IOGAyOSiZY0?=
 =?us-ascii?Q?71fNDq3tkWrM7YWIowozAJMwSiwVJIU3MNKHKAf5wux/+tfwUov9lXOKSRKP?=
 =?us-ascii?Q?b82je5E3ua6VdE/Zv0p5jiTS3MdAn23Dw6D+/qPwHQPSuxvkf9o/tPf/Kmas?=
 =?us-ascii?Q?qy91a7gtuM+GSEdBtqX/FwEBvBLlff0tqaIjFh63MxHgKbde4CTnUvLNfHJk?=
 =?us-ascii?Q?QxqiAj9nam98iH0d05YNE1iNQNhsomUSg/gkzo98raGPJZZtvDCS+hKIxNLF?=
 =?us-ascii?Q?E27lJ2iEkzMhrLvdPj76LOtJTpr0EaNl/H9EB2298nw3gkDYz4DiEjFBQJXi?=
 =?us-ascii?Q?uCe9nC9bGfegPKPCsb29vXdsP9pND7mHSm/MMUdrD8EB1YomOyBYnpOTibxR?=
 =?us-ascii?Q?HGWv5TTe5GNz4kPsbCntFW2CNXft7e0akrraMsSv7anIKR/qTUpESzkbRsTk?=
 =?us-ascii?Q?Uyf2b3/0j0L8Jh9PoDiSIGeGkux5zBs2RJcldk3OZYSbpojbLZdY+6JmKSxN?=
 =?us-ascii?Q?41sS9ngsfvWP9eousEG8d0dXzZSr7ZZdTeL34L1F68Vhmkx6nxliPFhdjlnB?=
 =?us-ascii?Q?ty8HSJuJQksOAh6JlswtQ14raA9U1vN1VVax27NKHemm5e9/fQtQGzwX448H?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99069a85-4a5b-44c2-7ddb-08daa5549a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 15:33:21.0417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cD3hf7U31m33fWkeb/+uMAisMvbbv172EdB1pDbj8RMgdVTLdhrKeg68UBtnZOj7vjJ2pFJ4uJ6mpfomM6wtYXMz1Bs6FDgs5TGsyOsUTwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5667
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, September 29, 2022 5:11 PM
> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH v4.1] drm/i915/mtl: Define engine context layouts
>=20
> On Wed, Sep 28, 2022 at 08:55:11AM -0700, Radhakrishna Sripada wrote:
> >From: Matt Roper <matthew.d.roper@intel.com>
> >
> >The part of the media and blitter engine contexts that we care about for
> >setting up an initial state on MTL are nearly similar to DG2 (and PVC).
> >The difference being PRT_BB_STATE being replaced with NOP.
> >
> >For render/compute engines, the part of the context images are nearly
> >the same, although the layout had a very slight change --- one POSH
> >register was removed and the placement of some LRI/noops adjusted
> >slightly to compensate.
> >
> >v2:
> > - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala=
)
> > - Add missing nop in xcs offsets(Bala)
> >v3:
> > - Fix the spacing for nop in xcs offset(MattR)
> >v4:
> > - Fix rcs register offset(MattR)
> >v4.1:
> > - Fix commit message(Lucas)
> >
> >Bspec: 46261, 46260, 45585
> >Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> >Cc: Licas De Marchi <lucas.demarchi@intel.com>
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>=20
>=20
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Pushed the patch, Thanks for the review.

-Radhakrishna Sripada
>=20
> Lucas De Marchi

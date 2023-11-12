Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B777E8E66
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 05:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1253210E127;
	Sun, 12 Nov 2023 04:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3206F10E127;
 Sun, 12 Nov 2023 04:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699765017; x=1731301017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2vvz8zuEqTHMfAlogCBhYbgsX+Oz6VzYb5VHYVnjwdk=;
 b=DR61DCEggImYHtRQ6zlrDSnX6Y+QIu9WwX7bERP+J8xlh1nxluYQ0Y+q
 Ud79UVaOKskdEdnK42gDmFYxygBDWEcZyZUL8f5YE9YYWyWmZsfEQyESO
 GBZ1N0Tg1ivGUXtM+B0bUDBCJZGTYs3aK9af04SU9JQVnwQV+a+fHtAfy
 IC0CskAkNcmY28nGooBRent7B/LcB0yTgVHvDo93dHmWb2MSf3x0EBQjJ
 woJDiZC91Nac1SCRsYSZYH5kDvcDVeCEIJLOh0o2n0A5CV6D2JSDvDhL+
 SsiU8tTO61BvqekLcKZII2eX9RjIc4U/jJpt4WAr/8sLmF/RYmdMpLYiH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="390118917"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="390118917"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 20:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="829967022"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="829967022"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2023 20:56:56 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 20:56:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 20:56:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sat, 11 Nov 2023 20:56:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sat, 11 Nov 2023 20:56:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz7tg8PDiSYL4Bac+7eCJ6DeAleLFtWdjvZ4hi9EkamGKHdnjQiPUR8RWCZtUyy3D1XqAnClDBx+WTBo1wPmgDfFTyiIzBlf7V9EyTwjGrLQrLX6iIcBGVx4RC0ErSvRNH2Mo46hDWs9Tynx2v5+FiSX5TdJWO/l7vJD6PhqNdICNUToKRDyooCttLJ/WhCJ7KQ0iX7N/G023k3+ETXdfGFK2z4qQWHMUPUHcTMdx0HG2FiQOi7O8UYC/6Atjnj84ReFHL7mnwleA5LrOIeveh9oSJw5ZgTmLzw1WT+AfoxxFkLPalXXB6krYGNzKHKYkprXoj8XWcQkNVsAuiPT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7PCJxDBz5gszuIh9bry8jWq/pp9j9IRk15v4IUu3/w=;
 b=MKYDl/yF8OQz8S627fgZnbuAZkOsSjzg/ABg4P/yuN5in97JonJ5wLAewxE2WRK/leiMAJEucDalAXvlU0wDSDzU5LZ3WZl/G9apvOIB7hPnq+OPVhg1PB1WoVZLbCO3Y6bsOOn76lwXM75xwQafe7rOTcFr5qNZuvSQ2BaL7K26sSIBbx6vnFsXi5uwwWyGydwNrSJFem73fqtxWTHJBOP0r/CAXeakn/u8zQ+s74lz1StuJkJmGBly3JacZ4Q4QtuQUx0OX8TTsIjtEkwYG/mMCoEiO6cj8zQGvJEfEDrj7g2NdoOOrABR44JmV1sWAbgibgdbZLy/WioxNJNZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Sun, 12 Nov
 2023 04:56:54 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb%4]) with mapi id 15.20.6977.026; Sun, 12 Nov 2023
 04:56:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 10/11] drm/i916/dp_mst: Iterate over the DSC bpps as per
 DSC precision support
Thread-Topic: [PATCH 10/11] drm/i916/dp_mst: Iterate over the DSC bpps as per
 DSC precision support
Thread-Index: AQHaE78DgA8GoNndtUuoAuwB2L3kTLB2IXPw
Date: Sun, 12 Nov 2023 04:56:53 +0000
Message-ID: <SN7PR11MB6750501B84F1B4E613DD7E81E3ACA@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
 <20231110101020.4067342-11-ankit.k.nautiyal@intel.com>
In-Reply-To: <20231110101020.4067342-11-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH8PR11MB7966:EE_
x-ms-office365-filtering-correlation-id: bc8c3b94-ad00-4ebb-258d-08dbe33bca4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4Pw7CiiJLykzbjjZLmZYP4ZxHKNJVUPVEFUXFdseBOaK9GmkBQ62kcp6QHrpPZ9aoAVJ4zkAlTH+KQJPljQNQHNB48eCBWeHkTJOd/c2CMdL/gLy9A/f4D3CV338U0lasqnmslOYkHjfGDYcave8abCxF9jOpdntBH1mbTlTP/eR/qqVxBBGCiEjlDRaJ/HFsiGCCsS/LxXKlIy5aqgo4pJjW1aRvS1Uv5WbrZ8qbfrvSOouh0XWEhoHMssj5WN0Nq3aWLdIzJG4MuFb44xUy++on4fMnrVQ1Z7IUJA2GXEZXSJzZsITnnXoP4l91TuNYqWwdgiqHcAaxtvVoQHo9kGTotC5KEWuUsgsCfA/DwP1Dh8Ee6TOM1OM5uaJVl0OqXsZUieRFO/q05MwrRIIFU1kzpFRtB+exzL9dF2puevpnVM1N+jqxUIV5cMQFFABHNmP60c88FqtgXEDwHJOxUecO2dfcBuamuLl/s9I+4gw0F3x8nVjbi0Rqlkn3aWVDzH4fXE1JXc5RFazIJTfHKqjMGN+Y83TIzEM7J0z9AsBs6bjVPqFYqt5pV2zifFqSkvrwvU5jkSE7FVZXjr4B2ctpR4UyDKmWUSr2xiIDVAS7T94nqPbPTB9TSMB9Sf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(83380400001)(8676002)(71200400001)(38100700002)(52536014)(2906002)(4326008)(122000001)(55016003)(41300700001)(82960400001)(5660300002)(8936002)(9686003)(7696005)(66946007)(110136005)(26005)(478600001)(86362001)(66476007)(6506007)(316002)(76116006)(33656002)(66556008)(54906003)(64756008)(66446008)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oY17em9f8XkXnE2U06YsVjDE0thzLqd4jiHtlA0KpA0HoiDGIGTodvhlVj6F?=
 =?us-ascii?Q?9BOR0QTMIPjczP54MRMOJmZLFprCPPKagIHUF9PWNM3YOG8VWBxPwcC0cFZQ?=
 =?us-ascii?Q?J5WU9T+VYpwQ6fEtLLfAqrqzNAaR469JuN1BRMQJBH+0tXQ5XPo7hd3PzSqD?=
 =?us-ascii?Q?OtW/z3WmAUtA3MJZ1AZknuntog+YRWgOH3zziuhADWBjwEVNHblzkZlyDmL5?=
 =?us-ascii?Q?bYA7cTcgAFAU/8lWij7r8AVQYpcDvdpBIIZ6gB9ez2dNP+DDHyDF7VhgdwOQ?=
 =?us-ascii?Q?7+YJRL5/40Xx7kPS5nXUwwQbXTciUCC1/stDiNQQXMu4HrpLCCgObC2RncJV?=
 =?us-ascii?Q?Ds42ftq1cO5enEJf35T5C1Rnam/J2hvhYi4LEaVMPnVItEe/POxvmh6XCLU8?=
 =?us-ascii?Q?ZIx4M4CXaL8KYkZcTPh57RF9wtnB810LqtXl3fao49WdeF9NC25apQBfczMl?=
 =?us-ascii?Q?vd3xSVlzDBlBIFsuQC7X1305M1670chLBCw2/YQso6WndRTYnpEptLDLg58X?=
 =?us-ascii?Q?11OnS4U+0S7d+uLrSE6SStrScVWZjC8EhjQ8gUsz0LKapNxacu9ThVLd6rVJ?=
 =?us-ascii?Q?LmP0lnzmzezToEOg96ExJCmQBeQhsTbISixe3cLfF+Qmk3/7sVctxGv5aLfL?=
 =?us-ascii?Q?3fg7MflMmn2g2XEJCjDI0ACfK7Sq1x2moBE9eBQLjRW2xyYUtSF/p5TVZ7k7?=
 =?us-ascii?Q?esC5mE9Y7ltEJCvkL5b1bggz8Yph8nadHWfHXj2HmRxSwL567AbTP7nJqbSz?=
 =?us-ascii?Q?dUWUCcl27HgZafUAQnSAMjmpEqNJvj+VBBBLZU8bMFbRqoCTnvSHGZkYQNe9?=
 =?us-ascii?Q?rsFgC9T64YbQUbrk+d1ysbAbsAc5AmGm8h/Eoaqe2/lm5nCRxkDDV/ThwctT?=
 =?us-ascii?Q?PQyIJOT2aZNz3N3mqXaIsjbd/aQbsXPB6afPLT3Ki1jolOyNmG1jy/IPsQu3?=
 =?us-ascii?Q?5RaP1UHDsu/c1n5iTy1zzNQuXlvb82pwu6zy8+3yVCG6KvOw3tR9+X+CGoZ9?=
 =?us-ascii?Q?MqddKDhbGSuKCjqSCKxboVxVyaDS2bRq85/i1REeJSs1t2QS0JgiJp0mr98B?=
 =?us-ascii?Q?KblHMPTWQJiIeg7Kqgv4StsC4vAsWo7o4fL06Q3nMo3kBiZC9l6pMNpqkg9j?=
 =?us-ascii?Q?C43z/Sft+dFtTI+WKxJtbwUR664gYWxIJP4MMj2jXf3tULwY0fK7J5/NG9Xf?=
 =?us-ascii?Q?masx7T1As9FRifibvMCxJQut8TMojaqXuwGeZ76h25PsIxANv3Mkokhe/LGx?=
 =?us-ascii?Q?QyBzCiIg2kC5FYUdL8rMPG7mbEv9hm9M8G0/0Qbb0Bq8aryNrojP90a/Ce8U?=
 =?us-ascii?Q?RDrq4vodC4vvIqiqPP5NwMm9uW8qWlE+L1801EEJUn/rcuOSukpDLYfoZXUa?=
 =?us-ascii?Q?Gw8xz5Tb+SVDil1Rf99Gufy95kAT5Iw2fYks3qQ0XT/e8afalE0ryCtWrkFR?=
 =?us-ascii?Q?3/gnOCIWWsuoxoGRyhpD9QQCvJFRxFKJ7QXboAkvuG2Rb7k8jA+bl6+rP6oQ?=
 =?us-ascii?Q?6c6ELE2fQ6vyGrFhJ1Nj1YUA34G+bP8qWwSAPx0LBxPgazOiULxpqYw68KX8?=
 =?us-ascii?Q?6jYsdDAiztCfVgrkLWYxrIc/7MmH6XBG75t8OCSn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8c3b94-ad00-4ebb-258d-08dbe33bca4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2023 04:56:53.9313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h7xsKd/guodEIUc5DNp++eDfqXTr37UIyEyH+UhVk6b2UnuPrAz/FLq20DXFmSZqq3LuPyaePMy6jv7XVoQs7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: [PATCH 10/11] drm/i916/dp_mst: Iterate over the DSC bpps as per
> DSC precision support
>=20
> Currently we iterate over the bpp_x16 in step of 16.
> Use DSC fractional bpp precision supported by the sink to compute the
> appropriate steps to iterate over the bpps.
>=20

LGTM.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index e7806fe11b9d..322046bb7d42 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -273,6 +273,8 @@ static int
> intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>  	int min_bpp, max_bpp, sink_min_bpp, sink_max_bpp;
>  	u8 dsc_max_bpc;
>  	int min_compressed_bpp, max_compressed_bpp;
> +	int bppx16_incr =3D drm_dp_dsc_sink_bpp_incr(connector-
> >dp.dsc_dpcd);
> +	int bppx16_step;
>=20
>  	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
>  	if (DISPLAY_VER(i915) >=3D 12)
> @@ -327,11 +329,16 @@ static int
> intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>  	min_compressed_bpp =3D intel_dp_dsc_nearest_valid_bpp(i915,
> min_compressed_bpp,
>  							    crtc_state-
> >pipe_bpp);
>=20
> +	if (DISPLAY_VER(i915) < 14 || bppx16_incr <=3D 1)
> +		bppx16_step =3D 16;
> +	else
> +		bppx16_step =3D 16 / bppx16_incr;
> +
>  	slots =3D intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
>=20
> to_bpp_x16(max_compressed_bpp),
>=20
> to_bpp_x16(min_compressed_bpp),
>  						     limits,
> -						     conn_state, 16, true);
> +						     conn_state, bppx16_step,
> true);
>=20
>  	if (slots < 0)
>  		return slots;
> --
> 2.40.1


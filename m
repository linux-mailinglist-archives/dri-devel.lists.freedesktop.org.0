Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219F6B0532
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CFB10E66B;
	Wed,  8 Mar 2023 10:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E259E10E5F7;
 Wed,  8 Mar 2023 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678273194; x=1709809194;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d9A3Nr/HYpD8idq1qZmqEm7NrxxLxfBN97nNgsC0Hkk=;
 b=hUWO0wR5gYH0ijz7B/qIOh2pTnLOQ2SFhUQdOrHkFiuuH6wmD7zJyVeB
 VbRohXSRJiU+qOcB9+29DmOjDfNetB1jGK5jysd+BHsbf0jahsQ/au0Mp
 7BwOs52ZvmGlH2XqafK0eAu4u1By5JSUXtFKo6f8DnH0vgoHDAsbJ2rpm
 mu2pxJraDHatqKlk+s5aqhKMIrDWbFy1OzC5gHKz9R53ha+ZAiPoceCln
 Wio0+3IBI0Me+KPDamxRJvCKrMqxEYM7G0UoQvJUCnS6HY6qFglX0VeQW
 oXuBQBEJtlhww94W4lqBhhx9aSJrX/AQ/dFYS+fzjCeJKqmiZE7s/aTa0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319956099"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="319956099"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="707141968"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="707141968"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 02:59:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 02:59:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 02:59:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 02:59:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4XSxNTOHQS+SKhfrFioi31p49obXyz56JA89V0uXYaIulVOsnW8k//zwyHmOB5D7MccBFPNXmHLlFBR+KggsB9C2sBUHE021vj3L0ii12opLnJTM06IfHgYGynJaPrZ87y6JQiZarJbmc1oGWEQayryHIa75vsDd35ABHpnksaDcecmXP9Yni+YoYkUatmcZCCNuuadAsbm9OYTy6IdM5HQdmAVFNzwPbISo1vIxAiQYRhVcTlQdrU7YFolKJDUDHHE66TZUqdH3VL4S2rpCojNMsbRinzKwW69uNMqk8Ux7cPSkBwpPSjTNOlSZwR/yApWKKkPtMdLGxXBkwQzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajTzvXpSYrzwkyiX9ubBhmRU1y+2Ql7F928p/D+3veU=;
 b=fseaRXuflWYnaoT6HooAJTVETW6HNFh4Ap/HKeoOV4j53kfJPZSx8jbfQg0+/Rx2yWHNE7pfXmD/8E3iptXYMRKaJh07zz2e6lHvKHuxBzoWjmUh+bSVOp3U59kB7kesR7YH4h3YxYVYVYJP6ZPbzb+LW8Et7dyWPXftbkGzES3cY/a/4+FSw46H+0h32Vh2LjhL6yTfr6PmvE4NJr4WQ9fUabFEw+nbhGpSDbs9dcp706W2XZk6nX3KXY15FgYBFqDtq7XUe4FRUPXkUNiSOVgSzM6CEGOm7yXABouEyS6R8Z8j72Kovq3tWUE+e2RjYemBBRUeSKOCNSzWa7J2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Wed, 8 Mar 2023 10:59:47 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e%6]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 10:59:47 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/7] drm/i915: Enable YCbCr420 for VDSC
Thread-Topic: [PATCH 4/7] drm/i915: Enable YCbCr420 for VDSC
Thread-Index: AQHZRn8q+AHAgpcE/EafZaR11pQfOa7wzO7w
Date: Wed, 8 Mar 2023 10:59:47 +0000
Message-ID: <DM4PR11MB63600FA8866FEEF788CE5F91F4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <20230222053153.3658345-5-suraj.kandpal@intel.com>
In-Reply-To: <20230222053153.3658345-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB6513:EE_
x-ms-office365-filtering-correlation-id: 76a4c1ed-ad7b-4a39-4a89-08db1fc43b39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o/Ul3Cia+ZwSbGKZS5zfV8sZFMkijsXiaVVDffDMXm3opLYBXWVSAcuzbohLAlSbWsKqfd3YAjWUN3LANMjWnb0hYJ4+ENrSJ8uKc6FETpaAiCXuAW8vpvq1HaTEioo1Exq5mJbjKJLF8iS6oATN6eunUvvol3UXOEM2Thgh3CG/pgZBbv7qvywh/xdUtSScl0/j2kCt6TycchmfBIdwOQaHAziYPrKpnBIoEmOutw3SCjvrpfwdPV8bwmLkL2kF4J9w3shu3cgU+VaxfzUMZIXArp0VDLyjzIW5h5i8r4pSth98RH9LEJ8LDJnS/4zQm77NEofnidpMD9lxpd75eFCEbZXJugz+TsWhOw5t5/M7yEC4iihetHUGM47vSfJBPtU25uRqi+WlKeHQxc11DkTsvjIJX9oerNlvQ89miUzE/Cq8jmuaWWKVMUQIbndutYXJIAc1VMFaGTNFSDNoKfAuLycsRCXg8hpEY99w3vJpFtwmhPE+kZLcgnd+hVEYJsRaPmwnO+ZYplJd73nqqfim7xk+F8y7cRTYXG6FcQfK9BJVZCd1YgPESs5ni5A/ueDjSaetltt4QHw8ycsrh4MPdlCjonSGQivDDjVkV0dOkJVWXzZXlcWcJ9v/SNdn61Zf5rKuv5b+R0ezb7E3Y9tmJUB8zizt5MLmN5ymHvtfSUsTKS96blAWaPGzJ5Rzp0X7l3eznLGGpvwWK+BiNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(6029001)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(26005)(6506007)(53546011)(107886003)(83380400001)(38070700005)(33656002)(122000001)(38100700002)(9686003)(86362001)(55016003)(82960400001)(186003)(66946007)(66556008)(41300700001)(66476007)(66446008)(4326008)(8676002)(2906002)(76116006)(30864003)(52536014)(64756008)(5660300002)(8936002)(478600001)(71200400001)(450100002)(7696005)(316002)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PMSD9yWq80aZmPfMrm4wUurT2TouVVgM4C70ddUvr7yr0ydBob9Z66HWhMJB?=
 =?us-ascii?Q?pqbaMwNvKf3lwolN6ug4WhsswgI56g3sUpEgi255d6r7ZggoggpzPLL4ZV4l?=
 =?us-ascii?Q?CsuX5QKA1nkLUx5vgnW7/4P8PfUFXXl6fRdptfbfTfPztP8eue2Un9N0DYZp?=
 =?us-ascii?Q?ZBJLMlT2o8BQdDc6Xccn0Enb3Mfq8lVj4h9wEfpL12Z1cubGSse1kzaaOdo3?=
 =?us-ascii?Q?JSgGUWHRBLcd8ir7oxn/zkcgt3oWLrZZ9kYCvNlOEIh6B4XI5B3/zAluLJZK?=
 =?us-ascii?Q?0cyeBSEQJ7xsy9Ob5xXP3N0+TWhiJJ50uJ1jPA87xXJbp9qHnXECs8DCJ2V0?=
 =?us-ascii?Q?YTVxOssT2+2WuyR78rOnXsaHPlj8omC3J0pG4esgW1VA//BbPk66TlkQk0xv?=
 =?us-ascii?Q?Gx5+BOS7UxCiyQBghjBEbQsHc6jG3tdIuJMstHGZZ/IMa6cXKr/DeOo5bptt?=
 =?us-ascii?Q?R9Lv/qnKj7PtAiYu+ml1uTOZuFJSMeHn25Bsgw5TjuxBPtfLIKQFVIPWjVEp?=
 =?us-ascii?Q?q+9DmP3WX1N3JkOwtcLLvunxGne8Nl3AqdxoKegX34B6+aDhsWRuj8DRsUKK?=
 =?us-ascii?Q?KVOppMElDL//qfcBLYqAMyK0QArLX3D8YQL34wGpcfjWCymIJBThUlwyxod6?=
 =?us-ascii?Q?a5jnBAfJMJBx9PDRKgbWNnr8w+JwZga1WOSQZut0R23ewpZLOB91qJjN9xYJ?=
 =?us-ascii?Q?kmMbV8iM/SEnIIwOcWAyNeqpyEyKGm8SSwoT9/3LwPBQGGxfBH/3ed4wQKBv?=
 =?us-ascii?Q?i5Cejq6epdV/zbvqLg8kd62s3Vq2vU7UlR5Vp5EjJbKMMwK/IzLMC1JWUbD+?=
 =?us-ascii?Q?dBKUAOvq/rDVKH8MaPfumZLVEaoPS5kN5fZ4eozFRw9kblc2O/Z2Bhr5w+Ke?=
 =?us-ascii?Q?8qIjy18kwTzMw2A6pP6po2PJR3MHd7Amh3fsd455n2c2WKgCe/Vv55Q4+kK4?=
 =?us-ascii?Q?xDfu67gZ0ZbgzgBgCt0LWQezgnhATKMDZaGXlnlsU29Kvfk97Skmk462KKUP?=
 =?us-ascii?Q?7Y3VaZjCQRKSI/1CIdHO54lGp935R99CpJpz0EA8hKq3ELSA8b4+oy7L+S16?=
 =?us-ascii?Q?i0MQKWTxMPqUSajwYfyEzJvOI6/DUXS4Cb5AcIBagsy8bdL6iZFzSaVedam5?=
 =?us-ascii?Q?obbzZNvKfQycZlHY67hXIvy4SN9lLKYYENaq4qihz0hNqGnRcKrISCOIpqfg?=
 =?us-ascii?Q?2ODmSurI+ny7Vje43GODhA8tmOr1unF0IIBu8cTkp+HG5I/m25WVhR1W53pf?=
 =?us-ascii?Q?Buis25hhhFQAwB/9b2Q6fXsI6XVwZzruW/qQuWLrs0Jluqif6HTfaiyZrSTV?=
 =?us-ascii?Q?bhekwO9dq8SjlvyD2c1U7S0N7KAEmalgT0ie9l07U26LEiIY2jESlgV3yA5O?=
 =?us-ascii?Q?Xz565/vw6K0wdUzz3nZy9tTAuUISPW5rCeUG9yZ1GwsxbaFQOtcaUDOQb/Xy?=
 =?us-ascii?Q?JzdlnA9MWxmk8VnFivkG8cI1iDwAo0aF5yg1gVcbn0zVQFjgmY8xaxBpoNBV?=
 =?us-ascii?Q?tkMcznVmw613WQxBbUYsYOa3w+Ozvxsy11bIQdgdsfyZ5fw5Ufbwd9+GC0Cn?=
 =?us-ascii?Q?ZNmYpShwpXAcXm4FtbPz7lvM2nrntNwnv8v24G4T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a4c1ed-ad7b-4a39-4a89-08db1fc43b39
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 10:59:47.0405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p3mN8vu8CJwky56QjvGwV/Mq+NdknejlcovjzYh+E7CxQUo1rlTYVzUhROzNXg2jwTr927J1SBd3ZpfteUGHkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Wednesday, February 22, 2023 11:02 AM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>; K=
ulkarni,
> Vandita <vandita.kulkarni@intel.com>
> Subject: [PATCH 4/7] drm/i915: Enable YCbCr420 for VDSC

drm/i915/dsc is better

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Implementation of VDSC for YCbCr420.
> Add QP tables for 8,10,12 BPC from rc_tables.h in intel_qp_tables.c (Deri=
ved from C-
> Model, which is given along with DSC1.2a Spec from Vesa)
> intel_lookup_range_min/max_qp functons need to take into account the outp=
ut
> format. Based on that appropriate qp table need to be chosen.
> Other rc_parameters need to be set where currently values for 444 format =
is
> hardcoded in calculate_rc_parameters( ).
> vdsc_cfg struct needs to be filled with output format information, where =
these are
> hardcoded for 444 format.
> Bspec: 49259
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Vandita Kulkarni <Vandita.kulkarni@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_qp_tables.c    | 187 ++++++++++++++++--
>  .../gpu/drm/i915/display/intel_qp_tables.h    |   4 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |   4 +-
>  3 files changed, 180 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_qp_tables.c
> b/drivers/gpu/drm/i915/display/intel_qp_tables.c
> index 6f8e4ec5c0fb..6e86c0971d24 100644
> --- a/drivers/gpu/drm/i915/display/intel_qp_tables.c
> +++ b/drivers/gpu/drm/i915/display/intel_qp_tables.c
> @@ -17,6 +17,15 @@
>  /* from BPP 6 to 36 in steps of 0.5 */
>  #define RC_RANGE_QP444_12BPC_MAX_NUM_BPP	61
>=20
> +/* from BPP 6 to 24 in steps of 0.5 */
> +#define RC_RANGE_QP420_8BPC_MAX_NUM_BPP		17
> +
> +/* from BPP 6 to 30 in steps of 0.5 */
> +#define RC_RANGE_QP420_10BPC_MAX_NUM_BPP	23
> +
> +/* from BPP 6 to 36 in steps of 0.5 */
> +#define RC_RANGE_QP420_12BPC_MAX_NUM_BPP	29
> +
>  /*
>   * These qp tables are as per the C model
>   * and it has the rows pointing to bpps which increment @@ -283,26 +292,=
182 @@
> static const u8
> rc_range_maxqp444_12bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP444_12BPC
>  	  11, 11, 10, 10, 10, 10, 10, 9, 9, 8, 8, 8, 8, 8, 7, 7, 6, 6, 6, 6, 5,=
 5, 4 }  };
>=20
> -#define PARAM_TABLE(_minmax, _bpc, _row, _col)  do { \
> -	if (bpc =3D=3D (_bpc)) \
> -		return rc_range_##_minmax##qp444_##_bpc##bpc[_row][_col]; \
> +static const u8
> rc_range_minqp420_8bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP420_8BPC_MA
> X_NUM_BPP] =3D {
> +	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
> +	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
> +	{ 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
> +	{ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
> +	{ 3, 3, 3, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
> +	{ 3, 3, 3, 3, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
> +	{ 3, 3, 3, 3, 3, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
> +	{ 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 0 },
> +	{ 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 0 },
> +	{ 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 1, 1 },
> +	{ 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 3, 3, 3, 3, 2, 1, 1 },
> +	{ 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 3, 2, 2, 1 },
> +	{ 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 3, 3, 2, 1 },
> +	{ 9, 8, 8, 7, 7, 7, 7, 7, 7, 6, 5, 5, 4, 3, 3, 3, 2 },
> +	{ 13, 12, 12, 11, 10, 10, 9, 8, 8, 7, 6, 6, 5, 5, 4, 4, 3 } };
> +
> +static const u8
> rc_range_maxqp420_8bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP420_8BPC_MA
> X_NUM_BPP] =3D {
> +	{ 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
> +	{ 4, 4, 4, 4, 4, 3, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0 },
> +	{ 5, 5, 5, 5, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
> +	{ 6, 6, 6, 6, 6, 5, 4, 3, 2, 2, 2, 1, 1, 1, 1, 0, 0 },
> +	{ 7, 7, 7, 7, 7, 5, 4, 3, 2, 2, 2, 2, 2, 1, 1, 1, 0 },
> +	{ 7, 7, 7, 7, 7, 6, 5, 4, 3, 3, 3, 2, 2, 2, 1, 1, 0 },
> +	{ 7, 7, 7, 7, 7, 6, 5, 4, 3, 3, 3, 3, 2, 2, 2, 1, 1 },
> +	{ 8, 8, 8, 8, 8, 7, 6, 5, 4, 4, 4, 3, 3, 2, 2, 2, 1 },
> +	{ 9, 9, 9, 8, 8, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 1 },
> +	{ 10, 10, 9, 9, 9, 8, 7, 6, 5, 5, 5, 4, 4, 3, 3, 2, 2 },
> +	{ 10, 10, 10, 9, 9, 8, 8, 7, 6, 6, 5, 5, 4, 4, 3, 2, 2 },
> +	{ 11, 11, 10, 10, 9, 9, 8, 7, 7, 6, 6, 5, 5, 4, 3, 3, 2 },
> +	{ 11, 11, 11, 10, 9, 9, 9, 8, 7, 7, 6, 5, 5, 4, 4, 3, 2 },
> +	{ 13, 12, 12, 11, 10, 10, 9, 8, 8, 7, 6, 6, 5, 4, 4, 4, 3 },
> +	{ 14, 13, 13, 12, 11, 11, 10, 9, 9, 8, 7, 7, 6, 6, 5, 5, 4 } };
> +
> +static const u8
> rc_range_minqp420_10bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP420_10BPC_
> MAX_NUM_BPP] =3D {
> +	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }=
,
> +	{ 4, 4, 4, 3, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }=
,
> +	{ 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0 }=
,
> +	{ 5, 5, 5, 4, 4, 4, 4, 4, 4, 3, 3, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0 }=
,
> +	{ 7, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3, 3, 3, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0 }=
,
> +	{ 7, 7, 7, 7, 7, 6, 5, 5, 5, 5, 5, 4, 3, 3, 2, 2, 1, 1, 1, 1, 1, 0, 0 }=
,
> +	{ 7, 7, 7, 7, 7, 6, 6, 5, 5, 5, 5, 4, 4, 4, 3, 2, 2, 2, 2, 1, 1, 1, 0 }=
,
> +	{ 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 5, 4, 4, 4, 3, 2, 2, 2, 1, 1, 1, 0 }=
,
> +	{ 7, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 1, 1 }=
,
> +	{ 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 1, 1 }=
,
> +	{ 9, 9, 9, 9, 9, 8, 8, 8, 8, 8, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 1 }=
,
> +	{ 9, 9, 9, 9, 9, 9, 8, 8, 8, 8, 8, 8, 8, 7, 6, 6, 5, 4, 4, 3, 3, 2, 1 }=
,
> +	{ 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 8, 8, 7, 7, 6, 5, 4, 4, 3, 3, 2, 1 }=
,
> +	{ 13, 12, 12, 11, 11, 11, 11, 11, 11, 10, 9, 9, 8, 7, 7, 6, 5, 5, 4, 3,=
 3,
> +	  2, 2 },
> +	{ 17, 16, 16, 15, 14, 14, 13, 12, 12, 11, 10, 10, 10, 9, 8, 8, 7, 6, 6,=
 5,
> +	  5, 4, 4 }
> +};
> +
> +static const u8
> rc_range_maxqp420_10bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP420_10BPC_
> MAX_NUM_BPP] =3D {
> +	{ 8, 8, 7, 6, 4, 4, 3, 3, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 }=
,
> +	{ 8, 8, 8, 7, 6, 5, 4, 4, 3, 3, 3, 3, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 }=
,
> +	{ 9, 9, 9, 8, 8, 7, 6, 5, 4, 3, 3, 3, 3, 3, 2, 1, 1, 1, 0, 0, 0, 0, 0 }=
,
> +	{ 10, 10, 10, 9, 9, 8, 7, 6, 5, 4, 4, 3, 3, 3, 3, 2, 1, 1, 1, 1, 1, 0,
> +	  0 },
> +	{ 11, 11, 11, 10, 10, 8, 7, 6, 5, 4, 4, 4, 4, 3, 3, 3, 2, 2, 2, 1, 1, 1=
,
> +	  0 },
> +	{ 11, 11, 11, 10, 10, 9, 8, 7, 6, 6, 6, 5, 4, 4, 3, 3, 2, 2, 2, 2, 2, 1=
,
> +	  1 },
> +	{ 11, 11, 11, 11, 11, 10, 9, 8, 7, 7, 7, 6, 5, 5, 4, 3, 3, 3, 3, 2, 2, =
2,
> +	  1 },
> +	{ 12, 12, 12, 12, 12, 11, 10, 9, 8, 8, 8, 7, 6, 5, 5, 4, 3, 3, 3, 2, 2,
> +	  2, 1 },
> +	{ 13, 13, 13, 12, 12, 11, 10, 10, 9, 9, 8, 8, 7, 7, 6, 5, 4, 4, 3, 3, 3=
,
> +	  2, 2 },
> +	{ 14, 14, 13, 13, 13, 12, 11, 10, 9, 9, 9, 8, 8, 7, 7, 6, 5, 4, 4, 3, 3=
,
> +	  2, 2 },
> +	{ 14, 14, 14, 13, 13, 12, 12, 11, 10, 10, 9, 9, 8, 8, 7, 6, 5, 5, 4, 4,
> +	  3, 3, 2 },
> +	{ 15, 15, 14, 14, 13, 13, 12, 11, 11, 10, 10, 9, 9, 8, 7, 7, 6, 5, 5, 4=
,
> +	  4, 3, 2 },
> +	{ 15, 15, 15, 14, 13, 13, 13, 12, 11, 11, 10, 9, 9, 8, 8, 7, 6, 5, 5, 4=
,
> +	  4, 3, 2 },
> +	{ 17, 16, 16, 15, 14, 14, 13, 12, 12, 11, 10, 10, 9, 8, 8, 7, 6, 6, 5, =
4,
> +	  4, 3, 3 },
> +	{ 18, 17, 17, 16, 15, 15, 14, 13, 13, 12, 11, 11, 11, 10, 9, 9, 8, 7, 7=
,
> +	  6, 6, 5, 5 }
> +};
> +
> +static const u8
> rc_range_minqp420_12bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP420_12BPC_
> MAX_NUM_BPP] =3D {
> +	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, =
0,
> +	  0, 0, 0, 0, 0 },
> +	{ 4, 4, 4, 4, 4, 4, 3, 3, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, =
0,
> +	  0, 0, 0, 0, 0 },
> +	{ 9, 8, 8, 7, 7, 6, 5, 5, 4, 4, 4, 4, 3, 3, 3, 2, 2, 1, 0, 0, 0, 0, 0, =
0,
> +	  0, 0, 0, 0, 0 },
> +	{ 10, 9, 9, 8, 8, 8, 7, 7, 6, 6, 6, 5, 5, 4, 4, 3, 2, 2, 1, 1, 1, 0, 0,=
 0,
> +	  0, 0, 0, 0, 0 },
> +	{ 11, 10, 10, 10, 10, 9, 9, 8, 7, 6, 6, 6, 6, 5, 5, 4, 3, 3, 3, 2, 2, 1=
,
> +	  0, 0, 0, 0, 0, 0, 0 },
> +	{ 11, 11, 11, 11, 11, 10, 10, 9, 9, 9, 9, 8, 7, 6, 5, 5, 4, 4, 3, 3, 3,=
 2,
> +	  1, 1, 0, 0, 0, 0, 0 },
> +	{ 11, 11, 11, 11, 11, 11, 10, 10, 9, 9, 9, 8, 8, 7, 6, 5, 5, 5, 5, 4, 3=
, 3,
> +	  2, 1, 1, 1, 1, 1, 0 },
> +	{ 11, 11, 11, 11, 11, 11, 11, 10, 10, 10, 10, 9, 8, 8, 8, 7, 6, 6, 5, 4=
, 4,
> +	  3, 2, 2, 1, 1, 1, 1, 1 },
> +	{ 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10, 10, 9, 9, 8, 8, 7, 7, 6, =
5,
> +	  5, 4, 4, 2, 2, 1, 1, 1, 1 },
> +	{ 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10, 10, 9, 9, 8, 8, 7, 7,=
 6,
> +	  5, 4, 4, 3, 2, 2, 1, 1, 1 },
> +	{ 13, 13, 13, 13, 13, 13, 13, 12, 12, 12, 11, 11, 10, 10, 9, 9, 8, 8, 7=
, 7,
> +	  6, 5, 4, 3, 3, 2, 2, 1, 1 },
> +	{ 13, 13, 13, 13, 13, 13, 13, 13, 13, 12, 12, 12, 12, 11, 10, 10, 9, 8,=
 8,
> +	  7, 7, 6, 5, 4, 3, 3, 2, 2, 1 },
> +	{ 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 12, 12, 11, 11, 10, 9, 8,=
 8,
> +	  7, 7, 6, 5, 4, 4, 3, 2, 2, 1 },
> +	{ 15, 15, 15, 15, 15, 15, 15, 15, 15, 14, 13, 13, 12, 11, 11, 10, 9, 9,=
 8,
> +	  8, 7, 6, 6, 5, 4, 4, 3, 3, 2 },
> +	{ 21, 20, 20, 19, 18, 18, 17, 16, 16, 15, 14, 14, 14, 13, 12, 12, 11, 1=
0,
> +	  10, 10, 9, 8, 8, 7, 6, 6, 5, 5, 4 }
> +};
> +
> +static const u8
> rc_range_maxqp420_12bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP420_12BPC_
> MAX_NUM_BPP] =3D {
> +	{ 11, 10, 9, 8, 6, 6, 5, 5, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0=
,
> +	  0, 0, 0, 0, 0, 0 },
> +	{ 12, 11, 11, 10, 9, 8, 7, 7, 6, 6, 5, 5, 4, 3, 3, 2, 1, 1, 1, 1, 1, 1,
> +	  1, 0, 0, 0, 0, 0, 0 },
> +	{ 13, 12, 12, 11, 11, 10, 9, 8, 7, 6, 6, 6, 5, 5, 4, 3, 3, 2, 1, 1, 1, =
1,
> +	  1, 0, 0, 0, 0, 0, 0 },
> +	{ 14, 13, 13, 12, 12, 11, 10, 9, 8, 7, 7, 6, 6, 5, 5, 4, 3, 3, 2, 2, 2,=
 1,
> +	  1, 1, 0, 0, 0, 0, 0 },
> +	{ 15, 14, 14, 13, 13, 11, 10, 9, 8, 7, 7, 7, 7, 6, 6, 5, 4, 4, 4, 3, 3,=
 2,
> +	  1, 1, 1, 0, 0, 0, 0 },
> +	{ 15, 15, 15, 14, 14, 13, 12, 11, 10, 10, 10, 9, 8, 7, 6, 6, 5, 5, 4, 4=
,
> +	  4, 3, 2, 2, 1, 1, 0, 0, 0 },
> +	{ 15, 15, 15, 15, 15, 14, 13, 12, 11, 11, 11, 10, 9, 8, 7, 6, 6, 6, 6, =
5,
> +	  4, 4, 3, 2, 2, 2, 1, 1, 0 },
> +	{ 16, 16, 16, 16, 16, 15, 14, 13, 12, 12, 12, 11, 10, 9, 9, 8, 7, 7, 6,=
 5,
> +	  5, 4, 3, 3, 2, 2, 2, 1, 1 },
> +	{ 17, 17, 17, 16, 16, 15, 14, 14, 13, 13, 12, 12, 11, 11, 10, 9, 8, 8, =
7,
> +	  6, 6, 5, 5, 3, 3, 2, 2, 1, 1 },
> +	{ 18, 18, 17, 17, 17, 16, 15, 14, 13, 13, 13, 12, 12, 11, 11, 10, 9, 8,=
 8,
> +	  7, 6, 5, 5, 4, 3, 3, 2, 2, 1 },
> +	{ 18, 18, 18, 17, 17, 16, 16, 15, 14, 14, 13, 13, 12, 12, 11, 10, 9, 9,=
 8,
> +	  8, 7, 6, 5, 4, 4, 3, 3, 2, 2 },
> +	{ 19, 19, 18, 18, 17, 17, 16, 15, 15, 14, 14, 13, 13, 12, 11, 11, 10, 9=
,
> +	  9, 8, 8, 7, 6, 5, 4, 4, 3, 3, 2 },
> +	{ 19, 19, 19, 18, 17, 17, 17, 16, 15, 15, 14, 13, 13, 12, 12, 11, 10, 9=
,
> +	  9, 8, 8, 7, 6, 5, 5, 4, 3, 3, 2 },
> +	{ 21, 20, 20, 19, 18, 18, 17, 16, 16, 15, 14, 14, 13, 12, 12, 11, 10, 1=
0,
> +	  9, 9, 8, 7, 7, 6, 5, 5, 4, 4, 3 },
> +	{ 22, 21, 21, 20, 19, 19, 18, 17, 17, 16, 15, 15, 15, 14, 13, 13, 12, 1=
1,
> +	  11, 11, 10, 9, 9, 8, 7, 7, 6, 6, 5 } };
> +
> +#define PARAM_TABLE(_minmax, _bpc, _row, _col, _is_420)  do { \
> +	if (bpc =3D=3D (_bpc)) {	\
> +		if (_is_420)	\
> +			return
> rc_range_##_minmax##qp420_##_bpc##bpc[_row][_col]; \
> +		else	\
> +			return
> rc_range_##_minmax##qp444_##_bpc##bpc[_row][_col]; \
> +	}	\
>  } while (0)
>=20
> -u8 intel_lookup_range_min_qp(int bpc, int buf_i, int bpp_i)
> +u8 intel_lookup_range_min_qp(int bpc, int buf_i, int bpp_i, bool
> +is_420)
>  {
> -	PARAM_TABLE(min, 8, buf_i, bpp_i);
> -	PARAM_TABLE(min, 10, buf_i, bpp_i);
> -	PARAM_TABLE(min, 12, buf_i, bpp_i);
> +	PARAM_TABLE(min, 8, buf_i, bpp_i, is_420);
> +	PARAM_TABLE(min, 10, buf_i, bpp_i, is_420);
> +	PARAM_TABLE(min, 12, buf_i, bpp_i, is_420);
>=20
>  	MISSING_CASE(bpc);
>  	return 0;
>  }
>=20
> -u8 intel_lookup_range_max_qp(int bpc, int buf_i, int bpp_i)
> +u8 intel_lookup_range_max_qp(int bpc, int buf_i, int bpp_i, bool
> +is_420)
>  {
> -	PARAM_TABLE(max, 8, buf_i, bpp_i);
> -	PARAM_TABLE(max, 10, buf_i, bpp_i);
> -	PARAM_TABLE(max, 12, buf_i, bpp_i);
> +	PARAM_TABLE(max, 8, buf_i, bpp_i, is_420);
> +	PARAM_TABLE(max, 10, buf_i, bpp_i, is_420);
> +	PARAM_TABLE(max, 12, buf_i, bpp_i, is_420);
>=20
>  	MISSING_CASE(bpc);
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_qp_tables.h
> b/drivers/gpu/drm/i915/display/intel_qp_tables.h
> index 9fb3c36bd7c6..a9ff9ca29938 100644
> --- a/drivers/gpu/drm/i915/display/intel_qp_tables.h
> +++ b/drivers/gpu/drm/i915/display/intel_qp_tables.h
> @@ -8,7 +8,7 @@
>=20
>  #include <linux/types.h>
>=20
> -u8 intel_lookup_range_min_qp(int bpc, int buf_i, int bpp_i);
> -u8 intel_lookup_range_max_qp(int bpc, int buf_i, int bpp_i);
> +u8 intel_lookup_range_min_qp(int bpc, int buf_i, int bpp_i, bool
> +is_420);
> +u8 intel_lookup_range_max_qp(int bpc, int buf_i, int bpp_i, bool
> +is_420);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 207b2a648d32..ed16f63d6355 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -422,9 +422,9 @@ calculate_rc_params(struct rc_parameters *rc,
>  	for (buf_i =3D 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
>  		/* Read range_minqp and range_max_qp from qp tables */
>  		rc->rc_range_params[buf_i].range_min_qp =3D
> -			intel_lookup_range_min_qp(bpc, buf_i, bpp_i);
> +			intel_lookup_range_min_qp(bpc, buf_i, bpp_i, vdsc_cfg-
> >native_420);
>  		rc->rc_range_params[buf_i].range_max_qp =3D
> -			intel_lookup_range_max_qp(bpc, buf_i, bpp_i);
> +			intel_lookup_range_max_qp(bpc, buf_i, bpp_i, vdsc_cfg-
> >native_420);
>=20
>  		/* Calculate range_bgp_offset */
>  		if (bpp <=3D 6) {
> --
> 2.25.1


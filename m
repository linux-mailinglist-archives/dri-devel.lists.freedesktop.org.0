Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9812479DF34
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 06:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5303010E18F;
	Wed, 13 Sep 2023 04:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE1E10E0E4;
 Wed, 13 Sep 2023 04:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694579879; x=1726115879;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u6SbI0AeopdaE2hvf6S0Wem1cwWUnpfIn/oq0v8BClA=;
 b=JeInCmeXoXzJLkW6rWvJeFuUz9dZMHEs7qxy7306DG6MktwUpg7Dlr9I
 bMJbY8uAp0oGsj6Li8MFoH2vMKV6m4l6gHGlNDOxlHGGPDjRNvuKYOQFh
 e8MrwM12d3ryUMvZJpXPuP7d83Ge7/75/TKOEM29+cfwdodSuOZ9rwgBq
 k24yp93325wpSCQIV9S0yPjekykGt8a5iBsz1zVuq6g0s1qH147vVaNTf
 OqQVK6CCrOzDo3rSe9vg6RTWZfmSQnplNeCpESbchE3bo91QvFZKtAyoT
 kiTyRcxeW9E6vJVg5FpIjSU4GIKmA6Rk663jelSeP1mkd6Hs0uLosLDxj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409512972"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="409512972"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 21:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720676195"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="720676195"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 21:37:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 21:37:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 21:37:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 21:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDBvcSMuSHE1R4wgsDrwUDvT5ubbk+mwDRksEx5RMmb4CXVLNzxIfmAMzC/2d1BFw/M7OKSDIX9I/AX+E6/MVrOpJAisqKoSczlGM2h9OiSCKkF285hPENe28WgPMIUTHKJYMeOtNmLyC2m7b/JOvxoeZikl6UmkFPQ0TVwWcZIS/zi05iQ9sJb6y+19dSiCG7NLvgi2IWW2FxT08jjdkj3MGZwrU1Mo1cUM92wxIhEXvWtZmDzMHNL0jrqVM+wGUSic3VELvqp6bVVoTh7Yp+msxyfbcauQzw1Lbc/BCHY0J9E8yzJfqGDXC8XoR5Dzrocym+4CWTZ+LdlmhvyBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSXgkJEDWu6m4gZ8DA3uwwaaVaTm6ZEKoHJ1HHwbWSs=;
 b=KGJVMXIolCOEk06jbIKMv56gNiSipR4AfT/4R9oZuMddiT+JsocGKsp3vPUiFDgkqsgfLC/gZuZFkh6Ib+S5u1ukite8gU9za28rNbGSQ8X1XLDxTfLQv03t3pSLQsk1RjFlp2WzYydHje2CQpP+hHUKa6ztWrwG9SfjUPRi+dDJP9KWAzxz6Obbv5kZxV7LoD1T/F31XnkgEn0oE+U6zmSr4UIb4R7nGOLFncOiez0OG+aEAgS2opx+u13mKH3ECo7xDO1NMYh892dmPywEviic8UwMcG5BBDCxKcTccj54OWFpcsL3IHPPsL31xkzPbghdcq5SQ161a/lV6fDe4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 04:37:47 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419%7]) with mapi id 15.20.6745.035; Wed, 13 Sep 2023
 04:37:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 prescision
Thread-Topic: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 prescision
Thread-Index: AQHZ5Zg1djywYgm3bE6AHisAa9iuHrAYLLDw
Date: Wed, 13 Sep 2023 04:37:47 +0000
Message-ID: <SN7PR11MB675017F8866960FE8C7AB248E3F0A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
 <20230912163735.1075868-2-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20230912163735.1075868-2-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA1PR11MB8246:EE_
x-ms-office365-filtering-correlation-id: 5949a4cd-d91c-44b3-9c0f-08dbb4132e5c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P/n/0y1KBlHo2Aw/6dYCrfF2ZS1cpm/810zWIUfm38Bj2MvH9cX1wWUwOPsDy5eGlVhR1psiFnNDb6dmhJckR5ONOgpK/AocLAXJH//lPN/xcRzdEcptm8RjO15RWLi6hC57oN2aI8JRxAqDIX6Kov0r/9VYNd9zo4CbT3KPDfgcRTx5+A00T3ctKFr9caxaAyCVMmrd1eBBnhqeQurkuGnlDZVoIzVWo9D87V4L4mhfRNHZWztv2p68YA4Xfkr6MGCfDoi6n3h8RLQZ+kajDtN3+B07eCXflFUVSumTktFlVuiUs7dCtyO5kKeNUFP8nJ6tmfV2u5aZcve5iIFA5O3j3vJ3hvwGAyqvrXRWHP3Z1wrAcQBji/SerGso/OmlbrYy6liJUcBnOQlkZk9RN2k6zjxqwqfYXXP5G+UHq+hIIJqFfIYKiJY8X2zSxo3GZrZdUMadPLyB13zUnhiJqGB7aZoEWcnbgdwsZZBkT5P4Yob+rxcst/QY/Ikfh7BNn3xBO9gAOBmpTRSntuP0D7b6iNB+rXAmBGEPUdvoCXbYs1n4NS959dOm+8JaKRKef180YpXLZDbGR2he8g/i9zI2o0TV7TMIXX6tNS5HtNtFaZAghB2wzaoQHrJREhHf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199024)(1800799009)(186009)(5660300002)(450100002)(52536014)(4326008)(41300700001)(66946007)(66476007)(8936002)(66556008)(8676002)(316002)(64756008)(66446008)(54906003)(110136005)(76116006)(122000001)(71200400001)(478600001)(38070700005)(33656002)(6506007)(55016003)(86362001)(26005)(107886003)(2906002)(38100700002)(7696005)(9686003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0843uh4wN1nxLJOvWqoL3AVwzU3jwiVJredEnXkmOsgTfNU84iZvtKHjKtXd?=
 =?us-ascii?Q?UOy2d+onT+mDY4lQ4WuPPd/ugn/VzrSD7+xOnGWJ9s9ATFS+Ghn1ySw/95Gi?=
 =?us-ascii?Q?c6wA6VJEZs1TcPK584RuXBu+RjywwogtkEmDcvR3FYVpdszOr6hY9pl5M/7c?=
 =?us-ascii?Q?43KOPB93N975VxRjEZSa52pHtNgk6mfeyZf5fgfhZ47fznmd5Mdfx6Ht6qsb?=
 =?us-ascii?Q?K3hF9wz9BUmu4eVZE7mzmWT92YmV2FcvimhZsxf7zJeCxaYzO8c3nk8Ik/ib?=
 =?us-ascii?Q?J9gP1uAnLg5wlTTgaP94cN5c2hPQIIMqy3BBGrVBsTor/JjCt5oRtpD0P2lO?=
 =?us-ascii?Q?sfknyFvao9m8tUNHxrVoLP9SALHWbxuJSranlbNPhNs9S/PUtO61BB1QAhwH?=
 =?us-ascii?Q?kr0MG2+lOn4UQzZpRLCc1SOqFisaBlPPC4l+EHKBzJa4oM+49zSxBT/Yfsgs?=
 =?us-ascii?Q?dlJnrVCXIz7Xy6IP9XxH8rMDL/xZTyPJ0rYwCi7kkPVQOQquo2QHBaysecWs?=
 =?us-ascii?Q?fGmC3Ap2qIUdytA2rBmQTxHeyWkhgoALg+ILk3P/eAMulET3azlyDOvjFh0e?=
 =?us-ascii?Q?OosqidaiQgeU0sNqvsyo74hjJ9NDTvA3PdJFtz1WqX8JLVH2ub9PUhpOr839?=
 =?us-ascii?Q?JRw+1oDLHSAIH5z3b7VMO5qT6eaoYad9Q4aae3dyq0EXpQcJLHOQsy4iS+rV?=
 =?us-ascii?Q?jof41LNGtICCa21h1p6ls6CVx8LKTBR/bKs5yJZIr31YH7PyRL1NgKAmYJCr?=
 =?us-ascii?Q?AkaxayPzMoMMvS6ZsYk06xf26ojVFLedHVu+Dbte6ZEXKpk8XHHyiYHxStrD?=
 =?us-ascii?Q?ZRU1mU/m9WVeN82f8464P9XavD0U541JFFmZ1habivmnOqrsK5jOM12udFY5?=
 =?us-ascii?Q?plWyULICo308q5DlCy/eTw/SFCkjzcv/b0Esaa8sCRThQh2dKO0gmSQjXIBc?=
 =?us-ascii?Q?NMX0yKgXdaJIQvmQrqf0OzJKeZBH+yu8hIwkEpydQW0T1agUY6AhOCgp+9SJ?=
 =?us-ascii?Q?xv15P1zwseQCteNp2XSBMYRzMIZofWFEUc9070fZVfzcBrQeaGAzQGwChOIK?=
 =?us-ascii?Q?/yeh6t7zbyp+viMQ/sWG7eDl0FESAQRyil5glaQk+HuyKli0uxw0gP1v4pvS?=
 =?us-ascii?Q?nL79KCGn6LJnn52whwFscPMdB8oPQiCun/rC+IeVZB5y/sLgf0F0ejasAQ0B?=
 =?us-ascii?Q?+KAdgO9/v5wcLGswS+eN0ZBVP3qOswjNDzBTTYHhVw4A8BjO30Nx1nDg7k0e?=
 =?us-ascii?Q?ZXhdcDpO5ln9NGvrFAfErT73f8BuF948vWdZyOw+wfnwsA8CLckJX6BBVMuA?=
 =?us-ascii?Q?tBeZVVGNm3EZ4Z3taJ3SYj1EQixj7Vqez41wNaUgb2W5XiqwIq7vvC74zTw0?=
 =?us-ascii?Q?bePY5K9hEdXVLwoiuanHdp7mjkQirrDS8jLpu50zgk25LjPM5Uy5qL/6ddHB?=
 =?us-ascii?Q?6eidBUZXVCSklEOgUGc/UVjYRUHISKC8RZG+IoPggzSVp12OeQz/RKjliprp?=
 =?us-ascii?Q?PNfwSwO1jsUCPPdDg1+wIO2feA5qdBLkayupIHFONKgX2ByS3m38NQR1CXVD?=
 =?us-ascii?Q?JbfLy8WCkuuXQYha3pzxgb/yzgYS1HVH/Y/uexZ/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5949a4cd-d91c-44b3-9c0f-08dbb4132e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 04:37:47.7645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zI6Kvagl69QQww+ifVt5sE7jwV6GjtivK7NcabOzhFcK5FJbR311F3gf2i9pfBhQtPkUIaS4Y5vL1p41hw75TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
> prescision
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Add helper to get the DSC bits_per_pixel precision for the DP sink.
>=20

LGTM.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 27 +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 8a1b64c57dfd..5c23d5b8fc50 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2323,6 +2323,33 @@ int drm_dp_read_desc(struct drm_dp_aux *aux,
> struct drm_dp_desc *desc,  }  EXPORT_SYMBOL(drm_dp_read_desc);
>=20
> +/**
> + * drm_dp_dsc_sink_bpp_incr() - Get bits per pixel increment
> + * @dsc_dpcd: DSC capabilities from DPCD
> + *
> + * Returns the bpp precision supported by the DP sink.
> + */
> +u8 drm_dp_dsc_sink_bpp_incr(const u8
> +dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> +{
> +	u8 bpp_increment_dpcd =3D dsc_dpcd[DP_DSC_BITS_PER_PIXEL_INC -
> +DP_DSC_SUPPORT];
> +
> +	switch (bpp_increment_dpcd) {
> +	case DP_DSC_BITS_PER_PIXEL_1_16:
> +		return 16;
> +	case DP_DSC_BITS_PER_PIXEL_1_8:
> +		return 8;
> +	case DP_DSC_BITS_PER_PIXEL_1_4:
> +		return 4;
> +	case DP_DSC_BITS_PER_PIXEL_1_2:
> +		return 2;
> +	case DP_DSC_BITS_PER_PIXEL_1_1:
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
> +
>  /**
>   * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
>   * supported by the DSC sink.
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 3369104e2d25..6968d4d87931 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -164,6 +164,7 @@ drm_dp_is_branch(const u8
> dpcd[DP_RECEIVER_CAP_SIZE])  }
>=20
>  /* DP/eDP DSC support */
> +u8 drm_dp_dsc_sink_bpp_incr(const u8
> +dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
>  u8 drm_dp_dsc_sink_max_slice_count(const u8
> dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
>  				   bool is_edp);
>  u8 drm_dp_dsc_sink_line_buf_depth(const u8
> dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
> --
> 2.25.1


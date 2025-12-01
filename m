Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E133C965DB
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836A010E35C;
	Mon,  1 Dec 2025 09:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+L782KX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DC310E35C;
 Mon,  1 Dec 2025 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581089; x=1796117089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yJ5LcrDtl0gWGfuP75RpuPT+ZpDzPlSI7cu2NF0cpkI=;
 b=A+L782KXp+T18MT+mxBFavWiAX5/meNXbB6f1+nHIUM314MgMZC40VR9
 BL/FbTy/j3xQthotK3ErBxFvbLb1GSU8GAdEWwCIuGUHa1lk2y7rn+wu3
 uC2qIPZQrq5Vcd1ftVk7zSQZklp5+XQrf2MmDXPdnJmkDe+aii9X3HFfb
 Z3iJkyS4e72W1n8q0Z1t0KDn27B5IL+0SoZ9uKEA1huXFSIxBtF1WDMxN
 ya6YzBF5vQQmhG24IXZ7+6i1BgITotknKOHqIvvVzoyTHuGiQ0sIBKwG5
 DHi0ufw5CQp2R4XKKxC6U9gnZGGtmNsAv9kkmvVyuYdgPTHV8cS7AUF9z w==;
X-CSE-ConnectionGUID: cwyBie31QNK/mKgiWhMz/g==
X-CSE-MsgGUID: EeSUthaQSVCeifZq+PjQ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66677346"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66677346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:24:49 -0800
X-CSE-ConnectionGUID: YJym9Pa7RXSJs7AB8/0IdA==
X-CSE-MsgGUID: AKerYQvyQVSSmSUp9Kcotw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193139091"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:24:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:24:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:24:47 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:24:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DokVnJ5klBoPr1iLz9hHhnhViQKbCGkEUDIVsL4zlp2IX3U+Pyn6EQzmr63qRLSNSOHfGEzG2L5rbK4nxwF/pUCvbp2Ll5JclXAmNhdlTMLP4e4iAdgQA2uroTofrxqAJW4FO3w5h0XVh59Zgu45scHz5v1fo9nVYE8nQFbVaSCbjMk9K4dddHErPnAhDnp47IbLWht63NOR4dphj5g5mbRQ5rOgqW00Hbm7EBon/ZRDg7PYxtFuDUZklU01gN03vRbgyi5TkzDSj+0E8nAL8FKzW34UH5plXb0lBhAPTJk3a4q6nuzkfW0M7RG+axOfrqnIENGrGEzs7noLE52ADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cJER4BB7KCZR2SLceXVPEayBPuELHaJKNdbjCllaTw=;
 b=H0uxi35zAj2UkIMs6yGdrnmlSqZdG/akpj4XkBionVbkHAzinqddYOq5pSvWvCv8Ndm/u1Yi9Amz0C3gqTcq2DzCPMsSNn+saRRXgwLSjExMkavasAcl/onPrTtgDSeHvb3yh26ziDtKad1ENbtsOLIBJ25xGN/YhBZYwWyK+O02xHu3evjWArs8wGjH7jvl9ulfXdBf0bv7whVrv/EeCOk6UhiXmISYf6DsCgtlVZt7Te5RAiH5EOOvdshHp3Ceoh1iWqt1TdGZm7L9jz6FYkTmqpkwgq8IqMH0ve37ntRHevMjd8fDKtHcQVRjVQh1/ZzFbUxZqQdkig4FQ31gXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA3PR11MB9111.namprd11.prod.outlook.com
 (2603:10b6:208:57d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:24:44 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:24:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Thread-Topic: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Thread-Index: AQHcYozH2hBK9lVsC0KXxVFiN/qQD7UMg2dw
Date: Mon, 1 Dec 2025 09:24:44 +0000
Message-ID: <DM3PPF208195D8DA1980D5CD74E95BEA81DE3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-12-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-12-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA3PR11MB9111:EE_
x-ms-office365-filtering-correlation-id: c2c49561-a741-452b-b6da-08de30bb76c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hY4JaihE3LJo5FF2GpUZq4h+id4STSAwuHoI3q3haDaqF44W79T+jBR6ruLQ?=
 =?us-ascii?Q?U9n6UExx0rCJMYUgfjY39P8jxqsvK4+giW4TjrDoLwCrByJMSC1c9gJiKHhy?=
 =?us-ascii?Q?vuw6ifd52H1M1k5xWwVej2GPmuv/PmcIXLS1+Gj7Pw03PbripIH3KCGhw68J?=
 =?us-ascii?Q?hgwm2u92c8SUuoNyzXTgyKmJnr2swb8xdeV60Hvx8QTIiJvF1OVNbeI8NZtY?=
 =?us-ascii?Q?xkCqBm+g4j2UsXD+pdcU226ciVagubyZuhpEw/yArWxfVZJ08iiblqqmIgU7?=
 =?us-ascii?Q?f1CDjSa/6ndW7ATpmjfPG05e4io9u0lPE66bIVpX19Zx7py9yvtgFqwRAcK4?=
 =?us-ascii?Q?idFV9Mjm7kZr/j8grc+76qqm8AdiodF9BPnnyQrb8T4TTOki3xbvRrncYWAv?=
 =?us-ascii?Q?UlnCL2Ua7UxrofaIbiEoTOfWmZIJ3eFeKDr9LlzlLeNUjbfgNH4CiGq21pvh?=
 =?us-ascii?Q?AdcV/ks6QQ68F2mPuJv08SPU+4eGnxjyyOw7pmNgCeF6MIdTGtbG/VsLfo+t?=
 =?us-ascii?Q?5fCTSdv+cXE0iPHouO+9h5zxaeSTP/e8rzntkZzURQY0OJubAuhH+jw23oYW?=
 =?us-ascii?Q?YfVHuNGBnDS76lf4/WxIXBfzOZ3fcQFqT0diBTYBT4bO8JdmL4CjkgsOlW0C?=
 =?us-ascii?Q?OwcToDyEUdqWMZ0H/sFJc26kYBIk5/LG+W/xLNRR7B+EjVdCsqRw/aPIzjh+?=
 =?us-ascii?Q?uEijX2uU+7cWDpHikjCbmtz03lStmS8CiqP/MsyEyZ8xY1nXzys6yisIvjcv?=
 =?us-ascii?Q?bMzcBdnoMGXn2cjK/bWtlHUv0/l/Z+c/lGPNWfXvrwGjfKNBbprFlntUZjYM?=
 =?us-ascii?Q?IoDf6JjYiyE51nB5punrFy+1lFSjN4Dow9SDZMwxiBMh/zNPmdpjWmlT8/W0?=
 =?us-ascii?Q?ScqngQzkFtlU5xUloOSOZ9KrMDpzs1/Hp2qnVEnOo94L10XSJ2y/kruq8RTG?=
 =?us-ascii?Q?dWUBov5DnbAXV8TpJZoFMycIsNfNlo7rmV+fB6rsyVCW/qIzJ8aD9SiANhw9?=
 =?us-ascii?Q?vuU5xPLf/d/fo4PJyibrgSIkjNXV1d4MogJdL/i5SYbDyF2OkD0QYqYIvtmA?=
 =?us-ascii?Q?MU/EEDyLQji96BQ2SOLZn+Yj3lQrngmqCT3sAeZ3el6QwH0L4wR5LvSHWc5v?=
 =?us-ascii?Q?iTx9ypG5TMT9l9fOAUvWbIZlqjyHI94/Lom2FMmvRfckJsA2x+f9LdHCEyHO?=
 =?us-ascii?Q?fIdNgk9aQPQwzaKE4eqXjl5QvS3XQsthiXghXeDNxgIsNYKHjkaWF6d5JWXG?=
 =?us-ascii?Q?hCfJtdXbZE6Y2VeYsi1n18G0+l/pxGeOa9bVsFOb+vSU8S3Mi2kZvOBw2uBc?=
 =?us-ascii?Q?wY/+8Y8HMf4InrOUE5LpfdDad5nMG7gnPpdm5FtbiwKK3Hcv/11caYJ/GL/3?=
 =?us-ascii?Q?wPGnwauhKMvljuylDsI3pRdArotWxCGfXpyNgEnTaNCWlPNE7lWsuzIp3SH6?=
 =?us-ascii?Q?PU6L0PfsqHtROhWM1r/P5TLFDxdd+Id4uTHzmlqudmiIq3OvuCMvVWQfxVi6?=
 =?us-ascii?Q?Fx5mbNYLMOyocSWtpcejOfTwmWuFfe+tdIJh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BfSjXEZXcH+YLYlHd7slg33t9AiPWRlACG44uRV1JXLjrUTfL82bNKcg2J26?=
 =?us-ascii?Q?MC7ZQDkLC6rI9rtM1FOggK19fGGHGSuEtnUpEP51pRaAGSEeOPXho/C8BmD3?=
 =?us-ascii?Q?gv+l5Sno+c52hEDWdGAJYPHaGXAkCwaIoPR+mFhGv8v9VCIciz+J2ye5MOBI?=
 =?us-ascii?Q?RA0BpmaZBKJL++8A4LTtOuAbV7smNECJMJqX68P2o5iibfijgihMFSpuzo4f?=
 =?us-ascii?Q?gMiq4jRM18S6lxflRhUoioHhXjBv2LlRvRPTRrcXmaPtU09vTYdQYz6sEoRD?=
 =?us-ascii?Q?UUJblDrLKKASMKSUKYxY5Ut9Ffna0Z+MxIzdtqmwY9d854c7iwh/WZ66BJla?=
 =?us-ascii?Q?oew6noROpgy8/t0CGdqrpL8sD2jGevucORX/3Mkpml/9YZNVT1gd+gws1FCQ?=
 =?us-ascii?Q?OehDyobbgK0awdeCkDqxkjhKBEKTbcdDgMHQAalnTCw4IQE/sHZ93d19tDfz?=
 =?us-ascii?Q?aAfGV2NF5FmSoBCDqkjtxlUR404HEmZQnl2vgbvF1VO43XSICm09IY94aYBH?=
 =?us-ascii?Q?B0o56Pb4x+fR1EQIzxOl0nQjD3X5bDUfgDejCw1D5NdtS/B6e02zWyd1f/D0?=
 =?us-ascii?Q?rUmyBDLyhFLt1v1UFvgxyDXd4+gx1s6Ny/QVRshMRcFxDfYVP8qebrUcC7t8?=
 =?us-ascii?Q?hYY8AeOl3eXCrhnx/VnyhTrFEl2JOm/zLYU7uwWcZESfC5xvWSgJE+i2cLe4?=
 =?us-ascii?Q?fu+uuBBPH9Omdkdtmm0+lgNKqSLE8nrf541ZxgAbOspKJ/w0h8eDcRo131Tm?=
 =?us-ascii?Q?Cgk5kiLsO3ncaDi8r+RKtqe1Yey0bruk8ELmIRl2F6oB/4L+svCVfy7cGERR?=
 =?us-ascii?Q?6OJ3mDq6SX8+37Vtz9ewTC0AjjL6fN91FpWUXv8pHyxCCP74o9IOjTAc3Led?=
 =?us-ascii?Q?jWAiV1zVCS/Y0XigEAWR/XRvYbYRVOMChWrdwa8tDXgnlQAL5DxsbA4jxao+?=
 =?us-ascii?Q?6YEwQV01AzHSFT827/lo75xqJsMzmKAACVtIj55j/qGwMMxymHw33jLL+twO?=
 =?us-ascii?Q?nveqF1unM4UEZoNaKUQIqUHIMJw2yKwQgbqgTUF+gXpO87C1SA0fd97Rx1Eb?=
 =?us-ascii?Q?A9gnM6E19PcimVQOwxjF1SgMPEC7g2o32IcpTFaPvfVj0pECztDJI+2HawB1?=
 =?us-ascii?Q?Y/zC8/G0R4nYGygmEfCaPH4GQU8LUQ2GeBsLPrgD3wgYDCues6gEMYLd2xlZ?=
 =?us-ascii?Q?0qpo+tQsUMpWVEP54/Bv9VXqETHSWScejonWu/+LWnBgZxd/ftQsKubevMTz?=
 =?us-ascii?Q?xS2EDwXp14m3jnIEoHCWwkmj+Eh/6Sq42BISTHzLrFtdggGrjoTXcY73ocxz?=
 =?us-ascii?Q?3DqooVeYVC7lYW48Rv/siZtIgm9ss2213QBRX04inIALU4DhQnGSU35ykFg0?=
 =?us-ascii?Q?SSRFuZ9fmczIdEwtNV+Yc8YMgjRcsUML8zUi8Emhlp+naofHHa2NSOpoyots?=
 =?us-ascii?Q?J/PJEdjRiR/2wGQ/GMEq5DdxbK6gny1isxSnIcppB+F3B7rB4M3JMe+/saZp?=
 =?us-ascii?Q?TlztOWPxJ1NftQ0rqr9qCw6XtatNjBuuaIgm0TE2KaEJex0cr2JsoiaMag29?=
 =?us-ascii?Q?2letoC18leStBFPRnBKGSI0g3TtUoG6m/cNvwM9I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c49561-a741-452b-b6da-08de30bb76c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:24:44.2335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxjhuefk3U+vDlTRAI0sJzVLzySP7hu+SNBCe+E4kQvlzdQL3DAnoErWjugQMCHcQ6dhsLNYLAmCTbiUiIGHKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

> Subject: [v7 11/15] drm/i915/color: Program Pre-CSC registers
>=20
> Add callback to program Pre-CSC LUT for TGL and beyond
>=20
> v2: Add DSB support
> v3: Add support for single segment 1D LUT color op
> v4:
> - s/drm_color_lut_32/drm_color_lut32/ (Simon)
> - Change commit message (Suraj)
> - Improve comments (Suraj)
> - Remove multisegmented programming, to be added later
> - Remove dead code for SDR planes, add when needed
>=20
> BSpec: 50411, 50412, 50413, 50414
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 4ca359d68730..2a114d2964fa 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3943,6 +3943,66 @@ xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
>  			   ctm_to_twos_complement(input[11], 0, 12));  }
>=20
> +static void
> +xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
> +				const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;

Introduce intel_plane here and use that

Regards,
Suraj Kandpal

> +	const struct drm_color_lut32 *pre_csc_lut =3D plane_state-
> >hw.degamma_lut->data;
> +	u32 i, lut_size;
> +
> +	if (icl_is_hdr_plane(display, plane)) {
> +		lut_size =3D 128;
> +
> +		intel_de_write_dsb(display, dsb,
> +				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe,
> plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +
> +		if (pre_csc_lut) {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 lut_val =3D
> drm_color_lut32_extract(pre_csc_lut[i].green, 24);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   lut_val);
> +			}
> +
> +			/* Program the max register to clamp values > 1.0. */
> +			/* TODO: Restrict to 0x7ffffff */
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   (1 << 24));
> +			} while (i++ > 130);
> +		} else {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   1 << 24);
> +			} while (i++ < 130);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> +	}
> +}
> +
> +static void
> +xelpd_plane_load_luts(struct intel_dsb *dsb, const struct
> +intel_plane_state *plane_state) {
> +	if (plane_state->hw.degamma_lut)
> +		xelpd_program_plane_pre_csc_lut(dsb, plane_state); }
> +
>  static const struct intel_color_funcs chv_color_funcs =3D {
>  	.color_check =3D chv_color_check,
>  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -3991,6 +4051,7
> @@ static const struct intel_color_funcs tgl_color_funcs =3D {
>  	.read_csc =3D icl_read_csc,
>  	.get_config =3D skl_get_config,
>  	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
> +	.load_plane_luts =3D xelpd_plane_load_luts,
>  };
>=20
>  static const struct intel_color_funcs icl_color_funcs =3D {
> --
> 2.50.1


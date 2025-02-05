Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F21A29604
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 17:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D575010E398;
	Wed,  5 Feb 2025 16:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgOprnc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C38410E0C7;
 Wed,  5 Feb 2025 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738771846; x=1770307846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Aw7hUsUWcdNOROVl1TnGZ61vnOumJGONjEfKBgLZVKM=;
 b=LgOprnc5t1QAgjUFDH1kFTK5w6nUAFsMuEUDwEBBeK1O79wzsUQTkIzT
 w9AI2tx+d3zATAxJeDcnwUU39jVNf8BD/qAIeC7gZbqEXT1W30Q81oE1Y
 nmTT1GXfeJ+iNN9tFosAWDZZtZIWx6MItpfSmA/hBmd5B9wg3jmxVFpIL
 SqOW8OR1RQqJfbIeUoaxBS2GQaFwWj5rGX5nMLzsRyG12ipRMQB4tddnG
 VKaJuudRk09CmMG5/g8jU7uFxVeT86TV6mz1k4SCEmcG3XfbfNzRrOOgc
 3h+GaN3AYZV2a0/lXjnt7qsmE4VfNjJg1yQenqEoaTNXoV0VgO9abm31c g==;
X-CSE-ConnectionGUID: d2PYnCZvQ0WLgTqQqvb0WQ==
X-CSE-MsgGUID: a6n3InJzTTCoZVAbC+bT6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43263529"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="43263529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 08:10:45 -0800
X-CSE-ConnectionGUID: 8LBKOPLeSzKlZ9YhMqK9pg==
X-CSE-MsgGUID: jVWFRgadS0mGiZfuwCtNtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111123824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 08:10:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 08:10:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 08:10:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 08:10:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saPSWSXZhPWQ6Fr9a/8zcanEy6GQwXIAUeQ/SC1OpzHlmFBNRQL0VUtM+p2YFPpcauTwBiLZAJIi0Xye8uuR2K9D0HPfNahJL+FSk6pvPVYYYMePCEp8O+22E9RAbY/6n/u7JXvblndZD9orpjWBEczTEYmz7omt/OYWo+RC5EA955+dpKNeayiVYreqlg8fzX3SZPl/6eM7sr33dnD0tiloq8AUg2e0uENA214cj8a1HqaBtG2aG8QhcTuTmgtGkG7NhI4A7nQ0j2WS7di50b2c/NDTHIvud98qhvb1rHQMeipd9w3sk534hVUPtFZJf8U8nybnO9o7nhZsudaBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rz7rh/NdUMpxfHyUnsUkFU/h8Rf6IOH9Nprpe7IyfA=;
 b=kTeggw1TXJfpJBeW4IoC6h4JI1ZXw3H1qxMhQlPIPb7sNG3JI3Ug7ng23ttYjT+FN7pOqGW6bI5Ucx+iuiZZVyqPa9mTIJOOlxXpK7Xtd8LlRgkiKxe+7z1IM2QpVTnIBAkeloZqZLwK7Q+rNVv8bvycMZzwbyOMDsHbn6feCeIl4jbmWkx8wQ2L4/9ocoX+ESKYvrDO1hnMNZ8l8GCFOE8agNU0gmCXlJ12velELyfDoI6JOv3a7Tghjh3hKb45XdiCl+pbLKSCxr3s6L8AcrFpZCn1Tc6QPA6v8LNAvIZWMEMRI17MonEgfxQsh+EI6i6jRMsvpt9NyVdB4yDtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 16:10:24 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 16:10:24 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
 brightness in Nits
Thread-Topic: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
 brightness in Nits
Thread-Index: AQHbdwNpinRitcn/AUWCNHwU+2EllrM44Lcw
Date: Wed, 5 Feb 2025 16:10:24 +0000
Message-ID: <IA0PR11MB730743EF97A0FDAE5F1AD11EBAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-5-suraj.kandpal@intel.com>
In-Reply-To: <20250204125009.2609726-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA0PR11MB7329:EE_
x-ms-office365-filtering-correlation-id: 764798fb-a0c9-443a-d056-08dd45ff9952
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FzPJGLMDQ9B+c4t8+Z2OegpxMogpj81jOBrxT3GoDXiiMIpITpou9SQMDv+w?=
 =?us-ascii?Q?bJYZXUptOulOIMprpKxZbRNDOkMGI/RFgA/dRZSUOvISeACU98hpZkNiePpC?=
 =?us-ascii?Q?sqbxRa+1ANegr3UuRouD71FtpTXxKiN0sUAvG1HzfrauH8sbTxvkDq2lNVjt?=
 =?us-ascii?Q?ESw0EiUkf6E+vPUigwbOqAqsgmK/C6jil13zBnug5BbS92zM85b+Fo5dRgC/?=
 =?us-ascii?Q?8aGnuNmswiJoFJlNpVk+PX0eYw4Og21J1YlIsCPEGD2DR3iRdCgfDVBjqWZ5?=
 =?us-ascii?Q?TgzROQTChQFoIaf1NjP0mp7L4d/viKboDv103hId32J83Tis6a29g9A3NYg1?=
 =?us-ascii?Q?TczUH5OZ7NcU++IcP9SIQg1GXFHZD8kz+C4ISoj5ekox8pAPNOC+NQrFpBGp?=
 =?us-ascii?Q?mw9UPX9TW0L82BPvaLbSz91HhMUnwg1AJZ1MqgzZjxMKo7DVgyjAHKj6EeJk?=
 =?us-ascii?Q?dojIkNpLOAjRxvmDz3UnM8MpevvvaQuPiuE0Zw9qoPM7CAqzK2qWZnUojhpx?=
 =?us-ascii?Q?8PPcFPGzOoVMdElyy+qjSRdTnbYoQm0oAvOJDG6TuwXqkn7BmXaN0JSOLaPB?=
 =?us-ascii?Q?/B6xuKZILnyJzXn7qutbO1sHfTykLIX82RHSe8k6HfIi+HG6cVbhDZXRhBIj?=
 =?us-ascii?Q?c//YBc4KFTT130ZGC+q7Pnnrc2AOO/0QzTxB89BTFApPPtHyfEP/fYZB3T3u?=
 =?us-ascii?Q?RrpRWrqUniQrZzy2BeaoIs9z4wBeF9YaBPUl9K0f0e3BpmY81Y9nkmT/BMM5?=
 =?us-ascii?Q?wy3CXwPQe/t4dvWppnyu6ekyFxF5rV/CQ4N2A7ZKBJSTPE5AE9SIcwNFOtN6?=
 =?us-ascii?Q?KPcVg6eDM+j85qlkuHkelGnREl6s1PAjQ7uifCHES3VhDC7378O7ANITJc5k?=
 =?us-ascii?Q?bS0f0rMgL6VaOgq8JEmpUtMhb/LL7g3GgVcmTLWI27ttai768Bo6Ubf7sYpv?=
 =?us-ascii?Q?h9f74BOBi5SXO9NAM+XJeiaihg1YOPTFDk4uqGg7K9ER91uQ4iUojKUUMUgs?=
 =?us-ascii?Q?CWLH6VL9Rgpv0K8KC1+HwiYZstlYLxcD9OAwW+VyvMncxG6CnLL9bjXd2JRI?=
 =?us-ascii?Q?Nx3IXZxln39kzUhKuVLOFBuTPr+RZFOWFzZN5iHrMDx+Ez5+EUkhCNnvZiE9?=
 =?us-ascii?Q?gb6ioC5hZlLGk/xCYgQ5wzA5DTq5PEQgvpVB2sszpF+y0CUw7LPtF5d6oJG7?=
 =?us-ascii?Q?SJi1x67PXxx4t/Z+n5i44aeh2ItK4cD8afF6hz6qnvOFe2+yB2O4B4k8xSDP?=
 =?us-ascii?Q?DlDYrbI3eAEAvtwXFAC2UANN4mFbGpe5Dt+L4rDVUy32hO1ISKvYlSmmYsVB?=
 =?us-ascii?Q?h2DfyrXXK5H0mNkFVvrfHdi6v5SXT4MmAL/qrr2CYErS2WhQhRXvormuGXB0?=
 =?us-ascii?Q?aUzHuQC5EPQjS5f6cpQYc6D2bspJmc1UiJdtqPCFqHMwtLKe+Bt4QG3aQpdO?=
 =?us-ascii?Q?sO2I3j8VcQgT6K2Lhs65KE4EZnU0fMe0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yKSzqGXrlbdyoEU8IXYQZZRWtlSToC8DpCwDjYUu7j1KAKI+AMnCbBlLqCaM?=
 =?us-ascii?Q?NZ2HyY2/XHV3cziwL85UWA701/EzSD9Uq2HOmih3/yneCmkYck989rYFjVvB?=
 =?us-ascii?Q?C0VPu64Fs65dRQ/ZMsmEPMX2NhZYneGHluDRijfRcY+CKkO8a3FC75yJnbVL?=
 =?us-ascii?Q?NyLfU9f0cNSHglAd16/+GYWDY6MDxaaXuK3we9IrPz69Z9JSJ6eiPTdra+HA?=
 =?us-ascii?Q?nW4HzhAqQfYuDRhSHij7WT8C0HL8oy9tfIBj1TUPo3UuCEUEdzPV2xBIXPzH?=
 =?us-ascii?Q?P8XjluZmN5+N1s0VHA4mNDnR9aQZz4W0YpzpaBXj+ApGg21BaVb0kC6/0jjd?=
 =?us-ascii?Q?W9gcUSkIBpVGeSwir+2j6K8gKncm+j6UyCAtOX4QEFRq/THGKwndiCXxtkSF?=
 =?us-ascii?Q?ouJbMdzlDiviYk9+OnCQ8UJSW38xirchabzX/P9/+bkt8IrHfxabCOkAzkI5?=
 =?us-ascii?Q?ZtcLQ/VyyMgY5Ha0WUBhHbD1i0If+I+hQ3sCd96C2JftzNzf98VRCYEU74+h?=
 =?us-ascii?Q?0iCkiPyButF8+bM9x60w4FzwFnPzoZJiYuZxDtif7BdKudRDcq1fgZGLhiyG?=
 =?us-ascii?Q?ar7k6RIWMS0AQ0HguF7JNy0cpxEGwbJ5WwJk4sx45S0ThK7tQ5CQDZA4dUEK?=
 =?us-ascii?Q?jj009qMZjbIGVZ2bk2WsmC4CZZPAbGbAil1oAxrZBg9I9e02Ob01dBttTH5k?=
 =?us-ascii?Q?8HZei258SvHZnfcB3WEND0b6NwMUJw1dzVqzEUYAiOpXVG9yFadpNrIMGOay?=
 =?us-ascii?Q?16Yiv1a6vtXeKFYrQPADhUDsrFfQVl2w8Mu0JI4nvL/+qEzrREU9vVonfNaR?=
 =?us-ascii?Q?U4W4qmjqqtKWiYgAW3eYjFroGsNB5AWkVTjCZDaP8uUx6i1NrMI0gTbk3gTN?=
 =?us-ascii?Q?qQhem4KzR5XZNbYDuWEBOnQppLtNCSPxjl7td6TILkaBntBhisE1BNRrv3a3?=
 =?us-ascii?Q?sA7/1KPmSNEJB5L0YjKf48WPDKgouIIhgaREck8b06aoZa95dP1cdTXtLXdu?=
 =?us-ascii?Q?imb8yl638d3kWcykSLy4OTM3vz8LaZ/vuXQxCt5RxbpRT6K/MvIba4KWNPn7?=
 =?us-ascii?Q?UtWLe+wN/cZzCJBdRk3+WtPuqeqcfti/VcPtkOhwHUc9v5zw+D5mR83kXRx+?=
 =?us-ascii?Q?necw7wQ/pZgsuZCeHXK5MaD2DbwXlRyyXdFnJgANuiO7rjjlJb2DusRpLMLe?=
 =?us-ascii?Q?GhCdYPJEj8lAuOpFB1nF5ACOan1bbEkydPHF3CkRPO98m6E2aaDnFgOyEAdn?=
 =?us-ascii?Q?MS+7i/PJ6KhvgnIsSLjPKglDTNvnUC9HGDkieUMXatzMbcXmkHMAOueRpjAE?=
 =?us-ascii?Q?rQYyZjRu1fAJO+NLsMsML3MnAvBUw098+S65YNk9JJNzaAF9NFrrbSSW2eYh?=
 =?us-ascii?Q?Bgq4mPMF5p9n68zlGX1TI2GAWbeOSqIu9PPsm4qmFjMue9YH8pdPWv+G45V5?=
 =?us-ascii?Q?tEjbVTBfHAuHJ1lmSnucPqFRe0mALd8UH8T9EuJ+JXzB1XlhblGLzERjE33A?=
 =?us-ascii?Q?PaBmm0zE5HLMmTEJy0wK1KBxCnmwZ5TNB2Q/FSGxCybpZw4ePofm3xMmE7Ql?=
 =?us-ascii?Q?F5ta4nJwObGDZ3p3L+53IKnh7Yn7Djbn4BTOvKr9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764798fb-a0c9-443a-d056-08dd45ff9952
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 16:10:24.7509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNuE+4v0vVEkyPOuqHe5b33LZrMmqW+VC/ygtNVkzmgChBG5S7Y1XiLJasoTSeJygClTI24Bya9+kNcx986jFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

> Modify vesa_get_brightness function to take into account
> luminance_control_support and based on that read the appropriate register
> and return the value.
>=20
> --v2
> -Changes since we now use luminance instead of nits
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Tested-by: Ben Kao <ben.kao@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 84126e7d1716..a733b5623563 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -451,6 +451,26 @@ intel_dp_aux_hdr_setup_backlight(struct
> intel_connector *connector, enum pipe pi
>  /* VESA backlight callbacks */
>  static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *conne=
ctor,
> enum pipe unused)  {
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
> +	struct intel_panel *panel =3D &connector->panel;
> +	u8 buf[3];
> +	u32 val =3D 0;
> +	int ret;
> +
> +	if (panel->backlight.edp.vesa.luminance_control_support) {
> +		ret =3D drm_dp_dpcd_read(&intel_dp->aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
> +				       sizeof(buf));
> +		if (ret < 0) {
> +			drm_err(intel_dp->aux.drm_dev,
> +				"[CONNECTOR:%d:%s] Failed to read
> Luminance from DPCD\n",
> +				connector->base.base.id, connector-
> >base.name);
> +			return 0;
> +		}
> +
> +		val |=3D buf[0] | buf[1] << 8 | buf[2] << 16;
|=3D doesn't add any value
Also better to add braces (buf[1] << 8)

> +		return val / 1000;
Fractional value will be lost.
If its expected then with the above said changes
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

> +	}
> +
>  	return connector->panel.backlight.level;  }
>=20
> --
> 2.34.1


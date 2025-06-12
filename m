Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F7AD674A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 07:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4203E10E77A;
	Thu, 12 Jun 2025 05:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KY7vbZxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33D10E71F;
 Thu, 12 Jun 2025 05:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749706062; x=1781242062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GQN9O7bt0WcH5BI0wFl7xtJM8vYp+WmAsVC+gO/EmA0=;
 b=KY7vbZxOS6A7/T5iP8C1c85gjCb59mF+e1SAvjnrE1LQyW28rEI34tRf
 /nX7NToE1R59c9YYUcOHMtPbYdlxutzD8UKZA9xGW5WGF+LULVDfZ8Qz5
 93ZdxU9moVC/KxkM5zkB70hG+holzxx1jdX2OsuHTMeyn4KNls2Pgvndw
 vCxmvpChks30NGlHGHiKqCqO5lHYmhoMX5uOlDsCnGdESedsTY1GXrtQr
 Vz7mEKSlrnf9gjw130ndzEvru12KoFuaTj6wT0q6KCdaiFFYTwHqY8aMz
 jo1ClzS0SAlfKhS4iubu3K6j9Q27JT3Gph4Gd/Ac2Ph8wVKGG9wvMxP3C A==;
X-CSE-ConnectionGUID: iOI4t0jlQIybSY32rGaU5g==
X-CSE-MsgGUID: BESYYghyQR2+dCBy+nT1bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63276560"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63276560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:27:42 -0700
X-CSE-ConnectionGUID: ltr3oTQ4SyiOaCbx0uSuWg==
X-CSE-MsgGUID: 2dZvFoX9QUGXGgICZIXaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147316492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:27:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:27:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:27:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0pvBkNHziePrkau4YhF7sNRJmMsrgWIfN33GzXrbvEhY/WyTeRlo+Ph7GZgmwV2pPGvhvC7lZKfMX7FBkBtLQ7mdR/Iux8riexoSamYZjx3isy/z4daurvwyAGjKNIIqH8ub14mZ3Va3l1+7D5eDnLaw9CTrwN82XleZt2sz3DHThR8XL0dskyO3HD7HtLP83bPiYQt0pDUpz/gyVw+3IZMHJx6Bx2iVyz8vsFYPSF1upgSYSpj3S8/FQGxbp3b0ZmkYnJa4oNknrP1IrV0ri80vdb1kNh6LrFYmH0cmgjGuL8AEcbUPC1Z3ZcnUndoqXXdbUMvdtq+IKtl9n/oVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVHyqu6wUVIU3CnvCt92yeqM7S326whyiAhnNBbovOY=;
 b=XGQPnRB311ZFvx7Q5oyJKw/w/aw9twCkszr7LYcd1HnIaY52o1WlkZTYdtRhJIZUy03gfB2P9SAsCQkakAfiHHzLpF0jZYFaGLwiC7XNqVwL9DOWGOUBlETOipg2ZWPryU0FiIQFRF7KG3SY+zT45EYupPZR6hP/rPjfERFeLlnoIMBA0h3rhwEIBHhmsIQeD9ZzFrz4eFXaET1gnKEeTkFRcPxE5OhWJpQhap/LLxCI24SEw1nJaznuMg4wK8FbjE5VPW0hEPci3+9i9oRyrcS8Cl4dCyMc2qOGB3Vqm5OopzfK1BJ6P71FhqdnZ/rIR4sATGxFonls3+nXY+I4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 05:27:25 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 05:27:25 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 02/13] drm/dp: Add argument in drm_edp_backlight_init
Thread-Topic: [PATCH 02/13] drm/dp: Add argument in drm_edp_backlight_init
Thread-Index: AQHbrPQipcauEveqs0KSE0MBbUwk9LP/WWkw
Date: Thu, 12 Jun 2025 05:27:25 +0000
Message-ID: <IA0PR11MB730791819AC67833719A07ADBA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-3-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH0PR11MB4855:EE_
x-ms-office365-filtering-correlation-id: acff7dae-8e08-4b1a-3285-08dda971d0d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oOh+TKyalghTJGtnB0yDc+vkZ+KCcjB0jwCsH1yO4par4lTn9hZ4z525XFkA?=
 =?us-ascii?Q?04bXpjl5ifb+noCUclMHrWEE/UwknZodfM97hbqkNY1Rma9IzWUiLDWoZztw?=
 =?us-ascii?Q?flhe0hiGt4fm3Yddmx4bV2y00qS3V4GpDtV4Y68fXBZRSePCVaQ+FvTO6Wvk?=
 =?us-ascii?Q?PIpF0h+iwtGxYGu5R5k2F6M8H4J+LP74bSpWx0HTlXLXRt0xFOw51Csl7wPR?=
 =?us-ascii?Q?JyNKD1x2B2A9q1L0qml0MDUc3VT095l05J6NKPkDYuaki4601Cd/6MQUJHh8?=
 =?us-ascii?Q?rSVCyQa0PB34pYNf4RNM/YfwzWjyG64vW8lWKA4n52AlYgLMeMgRF4vM9chf?=
 =?us-ascii?Q?mG7f+dNe9KugHUbwm7uUEP0Yk1CABCeOQ7nsYFZKWkaFmjUICRdRByR7XZVI?=
 =?us-ascii?Q?tyOcjhy7CU//ZhPwq/Df9cm/1C7W0q/lnyaQ0Ih51c+1f5Xe+GjWFejq+cEl?=
 =?us-ascii?Q?tHIAt5JEffwjwmHHsxQrYLzS2rTVn4caRD8gJOd7mwJrTeXyza+c+WILpLSY?=
 =?us-ascii?Q?vJPmF8GRfwDWfvjysF/wafBLJSKOAR2DimWb6kimzJB8n1CBcMIJ5PAXOfhS?=
 =?us-ascii?Q?4dn2mOHe+36hFWs41GAr3ta/dFV2ThpBEn8gGF8ntauk9i6GVbKbPAXJSoNQ?=
 =?us-ascii?Q?XsNsVoHnvouVwxrA62gewdvrbo/bCFCgyFwPIVGAVXxvZO++NHbeoRSpo18m?=
 =?us-ascii?Q?brxRjuot/1JeRDzhGWabkmjUiWdJudckH8bhEE61AusvADwnQaP5cEiB3EvD?=
 =?us-ascii?Q?xQkkbEL3T/imaS2rZlqq7NzvBR6+LKZVlbfluH5S79ra5F3/0gA959zyYk5h?=
 =?us-ascii?Q?nRQHdl7KpZbgQ3tg5Bas/vwpl4B+wVhM8iUmhfyNYPtMBi9SccEHDn6avTq2?=
 =?us-ascii?Q?2D5HdM5lJ43lVSTWEAb+0r4AJ9jT0gFqn6oFrbYizW/Bks84JkF+eqdu5rnK?=
 =?us-ascii?Q?yCIJf2YAsQm6/H6qxBzil//oNLmdeZXEv2XbdJKtQ4ZgdMUskpLjQkXC8/Vq?=
 =?us-ascii?Q?3mk7hE5GKR/56IytRkqXwdfzzK4vcQ7JDsjraPNTVEsjlvhWSXGI2vnNeAjm?=
 =?us-ascii?Q?Yvnb7LHJQNBBYLd3d4ULAos1GKGCOOGvYrkRDix994AeahLzOk+2uUwcRvY7?=
 =?us-ascii?Q?4m07/OfNbYONz9I3qj79xFTsGhjNv8cEp8qeyQFM3cf7gkt1/AOSNo5pQAO9?=
 =?us-ascii?Q?3yV+1+Ozc/JXUJ5ZMoNCxWRIbF98cxuzto9fbTU+MqW3V83BTWh6TXppA27p?=
 =?us-ascii?Q?8VlUC1QzMxF/G8tKUOep7FLQV1tnUpPWZdl1fZR+sL/oV5PBnKyMgaVQDInI?=
 =?us-ascii?Q?02cQB5A3Wd3AODEL9Ipe9V2V7WN9SRYh6IWb3qN7o8ibWB1M0rKG3pKygYI/?=
 =?us-ascii?Q?KSo+bNmFTSHYMn8EjIlLeZAKcLXd1FM7zRmlu53NWIsTJr20c9/EBQ05aX5g?=
 =?us-ascii?Q?PT/y0/Cb1WuIZF27ts2qBx6EgDJWEc50BLfyjMR1jTcoWGyrrUpSr82ezKvA?=
 =?us-ascii?Q?KuYx/iduGqTP+XI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tHZPANAXuNQFJ4ZZLMwHRANy8ldWU0OeVXpBHL18aLATUOlq/m4a5NCD0G+M?=
 =?us-ascii?Q?Lj+Q14eytTawqbOVEX+hrjNIEslmuFrlK1MVekuovnAArs0DoVr7uShppnYd?=
 =?us-ascii?Q?JTOj7CP5F/59PC5fsSyhH37OLbclGUam8MHmALbtxIC9QJgh8dqaRxpypK03?=
 =?us-ascii?Q?gFlWk6+2OUDQDWQ4lw0qfX2Ih95iRGTSt4GyQX0Brp6eKAKn8Xub9CMtOCot?=
 =?us-ascii?Q?sx9lZII8BXUHANzXnnEBiBI1BYDMCo8GeIRNKUUoD5phvR+yHfkgJ4OiDKKi?=
 =?us-ascii?Q?SUn/CbhXGRLfZwmdHrFn3lX9ulPLxQ+xqR9b+gXsp+2S8VsfEiJovj/Z6lnD?=
 =?us-ascii?Q?CRPz4S7knTLTBkOKpt1bhIZNvjCMazxZHYm+YW9RtgizoZ6DXD3vn0jXRzyT?=
 =?us-ascii?Q?zI9LXAX3au55vfNBkwGenXnDF1qfH/KEpmJAPBwh93DQ08UpuGkOun+vtqYc?=
 =?us-ascii?Q?lM2G5UKilEdcEnMDjoQMCHonvQh/y9uztKq2XPF8YMXrEfQ7eOfcqpGh5fcp?=
 =?us-ascii?Q?/5H0MTGsUdWuXnx9R5rItn5OohaW/vu39wxYzHP7jWVskuL06nFeZSjl8524?=
 =?us-ascii?Q?P/+e07Kv46fLr2oqmMcYeG9XCIl7cqkBYyRCmFO2w3Zm9iNWCYLJ5IsN/FA+?=
 =?us-ascii?Q?k02QxSjQzsTRr9s+v7yGCwK0TAVqy5DEB+z1gsnAuIzm2h6T80oCKTBtXbe5?=
 =?us-ascii?Q?aJReL6BaXBt9vFCbWcE7HZmCR8D3n41w2mScZ2LFVzJOMMJ4MU4P0u0fuIGl?=
 =?us-ascii?Q?RlHe7EBTd2ZXTJz9chHiSDFAjgiRbODtcZXm1R5eQl69XIGJFoJ16pSUF/uf?=
 =?us-ascii?Q?4dvWircW5TM1XLhPLDmFTaw/ykuMNJi34oLSITCszpZX0fk2bXXSPgie1EPm?=
 =?us-ascii?Q?sQC8Bm9WKwmAMRT+V6VJ/5206kE3PTateQyoXInIZUD1UECtwbatSYk34grn?=
 =?us-ascii?Q?7NvqrEdheZxa5UfSfpxXwZxzoMdu97/cZpJArVR/tcOR3JxBwPOj5+K5WwsT?=
 =?us-ascii?Q?5fX3S131zAxivSSg4t47HYCFMSfXWwSSciv7BsBgrER4b1par74YAUyAzPiN?=
 =?us-ascii?Q?vEToH18QUzynm+5Ja+Vn6jypZIP5vJRSMhQ839h57QS1TVz4POboEY9iAHw0?=
 =?us-ascii?Q?3lq5rDUpNnv+5l7UkexWblPSE2iLqj+Q5zqiIHh++nZXB0NMuZZIi6MNnAHk?=
 =?us-ascii?Q?jAWtOumJIMKkl0fnD9gf1Ix/xDyNLmbHCnAgmqEcWsLXI+Ndou6KgobqssIr?=
 =?us-ascii?Q?mR+StFhpgn1s8eAw1FphiJUOjt/kutcja3Z6dW36Y8HoGod9TuLIgVlzT83U?=
 =?us-ascii?Q?8ftO+dGlavu8ECdSaol6atFFKvnbb5x7yBy1xxaL0kZY3Z8jA5iK9gued52E?=
 =?us-ascii?Q?ZB31AT3Yrv8UX/BY7iVQRcNLgkLx5NF0bSCo6nKLcIeJFiSXEq+BkZAzgLt3?=
 =?us-ascii?Q?7yUrP7udl5cZdB9zJKrg3D1CX8I/OLKKlmrmysTp1bAb7CiidTrfrOnanDvL?=
 =?us-ascii?Q?qOURAjMDeIHEfwf9xh1F+WmVyiNVR2NUNp8pS3wa/wnOJUk5tx5BDMw1cHOC?=
 =?us-ascii?Q?VJ1urjFGKV2atBu3WpckIinRSwhRlHxCdgXtSSp5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acff7dae-8e08-4b1a-3285-08dda971d0d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 05:27:25.6214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TWBrcq7fxQXOYHYFFkqJQDYYZnP7qHZiTEY6FLJuQ/LOcicLsd4w3ruJW1dKRvm6g3Jbef5ybYoAT0h4r+FQWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:46 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 02/13] drm/dp: Add argument in drm_edp_backlight_init
>=20
> Add bool argument in drm_edp_backlight init to provide the drivers option=
 to
> choose if they want to use luminance values to manipulate brightness.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@gmail.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/display/drm_dp_helper.c               | 7 ++++---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 2 +-
>  include/drm/display/drm_dp_helper.h                   | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 41de7a92d76d..99b27e5e3365 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4231,6 +4231,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> *aux, struct drm_edp_backlight_i
>   * @edp_dpcd: A cached copy of the eDP DPCD
>   * @current_level: Where to store the probed brightness level, if any
>   * @current_mode: Where to store the currently set backlight control mod=
e
> + * @need_luminance: Tells us if a we want to manipulate backlight using
> + luminance values
>   *
>   * Initializes a &drm_edp_backlight_info struct by probing @aux for it's
> backlight capabilities,
>   * along with also probing the current and maximum supported brightness
> levels.
> @@ -4243,7 +4244,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> *aux, struct drm_edp_backlight_i  int  drm_edp_backlight_init(struct
> drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> -		       u16 *current_level, u8 *current_mode)
> +		       u16 *current_level, u8 *current_mode, bool
> need_luminance)
>  {
>  	int ret;
>=20
> @@ -4254,7 +4255,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
>  		bl->lsb_reg_used =3D true;
>  	if ((edp_dpcd[0] & DP_EDP_15) && edp_dpcd[3] &
> -	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE))
> +	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE) &&
> need_luminance)
>  		bl->luminance_set =3D true;
>=20
>  	/* Sanity check caps */
> @@ -4372,7 +4373,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel
> *panel, struct drm_dp_aux *aux)
>  	bl->aux =3D aux;
>=20
>  	ret =3D drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> -				     &current_level, &current_mode);
> +				     &current_level, &current_mode, false);
>  	if (ret < 0)
>  		return ret;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 20ab90acb351..d658e77b43d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -601,7 +601,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  	} else {
>  		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
>  					     panel->vbt.backlight.pwm_freq_hz,
> intel_dp->edp_dpcd,
> -					     &current_level, &current_mode);
> +					     &current_level, &current_mode,
> false);
>  		if (ret < 0)
>  			return ret;
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index d47442125fa1..b938684a9422 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -262,7 +262,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>  				 nv_conn->base.name);
>=20
>  			ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> >edp_info, 0, edp_dpcd,
> -						     &current_level,
> &current_mode);
> +						     &current_level,
> &current_mode, false);
>  			if (ret < 0)
>  				return ret;
>=20
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index b8fdc09737fc..ef0786a0af4a 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -850,7 +850,7 @@ struct drm_edp_backlight_info {  int
> drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> drm_edp_backlight_info *bl,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> -		       u16 *current_level, u8 *current_mode);
> +		       u16 *current_level, u8 *current_mode, bool
> need_luminance);
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
>  				u16 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> --
> 2.34.1


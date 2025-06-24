Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF2EAE5B9B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7810E4BE;
	Tue, 24 Jun 2025 04:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzkr1gLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4B810E4BC;
 Tue, 24 Jun 2025 04:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750740270; x=1782276270;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RP2al/jyp9DtHstLrmQmOt2nbGEurhPPusGB1kok1xo=;
 b=bzkr1gLtF7rYz0TDO9GMYNVT15F8ycZ3RoS8KgFErVtIdd/RxRrdpK/E
 O3ZI9zlPBQhoA6ojLC4RDi7l4HNKdJeSY4tLvTB6d0tCPyJbb9TfoxmUC
 dYYZbgR9LbWtIaF7XWoF4plq5u6cYiySzK/N2U/txWXRQuHzmlghPgAtd
 FcECZRijYzMFUM6ot4R0VzCerpkGYDNjh0aZeHUDDSi9n4UyG9ml7I6vb
 YO3cmdREzRnu1wypIYK613dQMWDBT31k6PWbHM+7+MYz1N9j+F8UXn1+o
 51A3g4wtJoB1AZBB+VN4nmqdwAMqa/gAHG9mSKNs003z/m+k3pr5fCrNo A==;
X-CSE-ConnectionGUID: C2TEAz/qQ6KIHqNC1387BQ==
X-CSE-MsgGUID: ALAMDwhkSK2ImYR9RQiP8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="78381570"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="78381570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:44:30 -0700
X-CSE-ConnectionGUID: XfMq2/wtQf+qN83hoIlbeQ==
X-CSE-MsgGUID: xUigmaQAS+mwhChLa/Iuzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="156091174"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:44:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:44:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 21:44:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.73) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARbkoacKEvPWhoHX+AVNtqelBE6qoV8i+sbBy9CoAuw0f7Ht8Lmo+lJdmYU7N3+49XJtRUtUcbViAygqmbHYfZIkvo/L0s6jUlzZojdpWiAvjeDYgHMruFlmM5+zA7RLRKXtiq4bXL8CzKK9K0sRES4kffQmmwBP1hqjpxcNu7eGSu50Hhq+afOtTbK1aQ2+/GOMjUTR+UOi3qjx0kO05O37dgxE0mSBYSeBGBrZSes0NlAtkWw5WQeV2dtdcxh8i3Dp2XgzBO/4jSpXYC8XzjsPAUmLMKn33BkM6TWAm9ey6YsIi/NFbx2gkYhtAvvfCm7m8UnvfjYCRU5gI+VZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a+RWPGryTCBBRO3UVMl2++bEsiG1QWrMPP733JRfQ4=;
 b=VH5ginuFfG+SFH8mGrW318Uai5GS2vO2BXDNbJjR9+sLe1+SqyDPdEJBCSlrQ6ZZ8DuIPXohhvZdQBk1NAALlGZ58gSQVg862HO97SeOT8UsdJ3q55XSIUzf51LI3KFFUbTAj1z9Is2u8qlXw1Bdy44Eum9ILWQ3iggcC6L0n5ExA/mNEe5PJuiSYG3f2qJhfFI5oR+nDmnjHVC0xR8HXxVZYCWW7ZqONsHFQ4a5fe36eZaEP36R0GvZw+Rec5FzK3Go+1i/VQGp9e+wlJLr9oLppQ+h/avN9OUeXKD9HqL8+v1X8JfV39z4+ZC5nJyOA6HDLOEO7CO4j3xsE/kWoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Tue, 24 Jun
 2025 04:44:00 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 04:44:00 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v3 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Thread-Topic: [PATCH v3 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Thread-Index: AQHb4a2EQEwWgccNA0uGS8z6xJi+tbQRwX5A
Date: Tue, 24 Jun 2025 04:44:00 +0000
Message-ID: <IA0PR11MB73073F1E90025426EA8DC883BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <20250620063445.3603086-5-suraj.kandpal@intel.com>
In-Reply-To: <20250620063445.3603086-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY8PR11MB7241:EE_
x-ms-office365-filtering-correlation-id: f989f7dd-9a80-4fbe-e27d-08ddb2d9bcdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?j+kqqa5wdxT+FFgzOYeHcSbkwdTtNypdYcqv9HQTuZk/+UigONggJ3ZsE/05?=
 =?us-ascii?Q?xOHhUNXBDDFbO6FmCJJWa2pF7wqoNSgujYeKadnadNyrGPiZm1SHp+9f00Ml?=
 =?us-ascii?Q?Z0l9WMZ/sASmRt13pExoHLLY6f7ik3dPydNSNHLShNduzOYSdNHJu/f8w7bF?=
 =?us-ascii?Q?AI17I4AdQHpQv+j0G+KkB/YkHsXLBwY4PN9RuvSXHklDZaDBDwKT76zyjzB7?=
 =?us-ascii?Q?SUuM0Zk+/CUDsAy3SfvDnYRmjJGRaIwO601Dm4WDOjLRhxTvKOctbJg6iBif?=
 =?us-ascii?Q?omlExMf9bRjgHXTywjSNRerDOnD8xran1ZWxklcLlwUcFyKMKk+1Ubep4wKW?=
 =?us-ascii?Q?DHaKOJdn3q/O7KTCmXYn4+COop28t+oq9GoB2/S89ED6pBNfRQY0gImq2Et4?=
 =?us-ascii?Q?hZ47nTRoZLI+QkOUWTysByvVj3+l/TAp6k9uSBqaN1+Xl6jgS9T+1Q5i514A?=
 =?us-ascii?Q?7FQlR1hYVUcbxeSVdpQvjoFc3JO6OVYwQ1Wkn0dnq+/vZgkIZf+MjC2Cn7PB?=
 =?us-ascii?Q?TZ9udYcid8QZfX2HR0C9birvgo+n98gZIpZ4AXG8813kW8glTcLWFRN2/wCo?=
 =?us-ascii?Q?ve5JXgSNbYgt/2Npn7KXHA6/QQuGUEPQZFPrggtE8+slzgyZnU4CUu5dDUZ0?=
 =?us-ascii?Q?6Sgah9cvUS3MJd3wH7A4gZIGkXxmgsfSjVsFWoiSFj4mI22UpeiLB0Z8h/oW?=
 =?us-ascii?Q?RHui//3JuK64BhEQ82w7x83xk2f2NvR/jkbuHeA5G1j2P7oYiPVCnyfqiqyf?=
 =?us-ascii?Q?Gn//7y0eh5j0lucxYlKG+N0zW2e5Fbo8o5sCKcl22fnCdItehzWAqpPyNWNW?=
 =?us-ascii?Q?R+EWqeB6Ha52yeLfD27m/YG3J0FVtpj5HlZUuPgKNAx2w40PBtI3ioelItOS?=
 =?us-ascii?Q?X9lIawN6HfvrT7eMEmoygj7JoDKI77OiRuu5vihhqaTPdFluaHzUnfRixF7t?=
 =?us-ascii?Q?0gDTBJwXfTLbU/1DB9HTtbogt192RJishHtpA+Od6Ua40g/+bMahIWXkV91i?=
 =?us-ascii?Q?XAbSb4RBJH3RL+CuvK2jT/2VjxtXOgBnp5VwYr/LPUgOzvzWQAXkvjDGfOO6?=
 =?us-ascii?Q?d3wyNjMNHfy05L6S5Q/5WAr8BtEhiywUgwiDcUISon05ckQoW0JvSVGIRkUW?=
 =?us-ascii?Q?+jcYqTRqAaSSsr10WIRCK0CNyi/PyAeQw/YVA/nqHw7+UMeaQkTh0zEDJI6M?=
 =?us-ascii?Q?7edTlVoDy2HIwnmUMwoPaFSAACStMaSrqe6ROS9eilXWiYcUrnLn8CcwVASR?=
 =?us-ascii?Q?fk1ZlxDitQB7QhyJRIC0ZDgNio989zgyHu88yzKiip3aIlTkayi9Qh9nJV2d?=
 =?us-ascii?Q?lHEcpE0nmtHKVRthmJEhCW+MZ7PydTdldm9f//aSvGQpzMP9NxJ3+WYEoO0U?=
 =?us-ascii?Q?7D5HTVjgCpCmpP+2B/h2H+E93RCFB7mfrsijbPb8ltX/Eo6JWYIBkY1MPp2R?=
 =?us-ascii?Q?I3byHxI8kjvLjbcYM8+CzU5cqiSHbQ+funIuOh6rh0hyXeFf52g3wKm0/kmF?=
 =?us-ascii?Q?3DSBcvEfhjJHKSI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9zlSfhYxajCu/UtXqSWqdUW4Hli6cUkAYqbgU0iMWlIZr6LY10TUoHOFclpj?=
 =?us-ascii?Q?R5dpkZdWrhF4tN3KiIywe7lFUAd/jrWeaivvKygcLBcx9PlX0gCpdOxOro4O?=
 =?us-ascii?Q?zmSIwI1UEAU4icBPEKhWAQj+E3+V9k5u6B57pd06cQ+kwaI/ntG3UsKwSjgH?=
 =?us-ascii?Q?BXTnZe77VeWAhJAQmgWRBiOSW5ccy0wgG9m26iniOFYxjqXgzKf/T83G2hzd?=
 =?us-ascii?Q?KX8D0V+Uvlnmx2B5mnT86e45om2DpdzqkUFRk0OiTDr8onF1BxwPv0tI3aVz?=
 =?us-ascii?Q?t8JPpV+X8uJ2BbWgtCJYBl2jzxxrTyW7ePPF9pO/uiGjj096ZdNat/SNUqWr?=
 =?us-ascii?Q?FlHeYq2vkYRvMVjh+6WwzzC/Zi+LsjkTz/yKC9YkN3p8lhUK4k/zq2MlH1qK?=
 =?us-ascii?Q?VIFvxYv549jfbMDmKij0pdZmS4LcJc2LTGWNLTZZ3r8J9XtY4Re6+h9ijPad?=
 =?us-ascii?Q?/OvVrQtG7QAGKxN8/juOcJj8jDpuQrbUb8ADoAV80ENXNsLjiUjuytYVtRFV?=
 =?us-ascii?Q?0Vz+oeJ33G6Iqciqz/ej2YtntBMAvY0meq4l03oLmvgjYZ15PaecpTsB/A/1?=
 =?us-ascii?Q?3SazWktZ9t5rUC1Fth1daXFjr0z3q2D6KTuXCaVW5U7ECeZzchmwFBqYPiSg?=
 =?us-ascii?Q?50mCJQlJCSYCgvM14cJR9g8i/BoLLDlk/VVbK45HmBZ7fYVuAMsRnx7z8Ttq?=
 =?us-ascii?Q?NmWARqtoK6uCJx4leBo0RZYUUO/nUSMyWxK4EuRfp826H777UKh8ZS7ZiXpf?=
 =?us-ascii?Q?R6ZcPDMayFAUgCOpqW6F+SucBWczX4j5GYqW9qzCbwEjO4XwmK6q+PeZ6JY1?=
 =?us-ascii?Q?jcl7gSFyIzqndRPMuPuas8slfMXxwObSM067uBrRd331boaVMlp9/+EO/EYb?=
 =?us-ascii?Q?MwY8l5bCSczhOa5RqbGLmP5QCdJmYgqKJOpkNjllzMrl/bhZTYA+s6OzqXlJ?=
 =?us-ascii?Q?+yeBOMj5XOSM29N7iuIumNGnzJVIK0M8x0s5i1ZV6ydAal85ajYO8VqzTJFH?=
 =?us-ascii?Q?Q1DZe7UrbVEvOEj2iifuLoxQNaks8vHtTT+LAMdfdSCVczOG1/s0zFgopyse?=
 =?us-ascii?Q?kc+YOkbQdlNfLc9BIucAmL16PDGVqCxKlbwRo+g2V/m6vG+cdSkwxmxvRc2y?=
 =?us-ascii?Q?qzq/LezEIzzC9gn6EbXGqELjqG25Jym7QHZ77eOPSxK3Jx3gh08LjUJfci/x?=
 =?us-ascii?Q?dx00mwVyqKY9/c3cKMr0zTGuGRPdJmvwc4Rb0eK+cVZpRdtkJhd+ycbaaF5A?=
 =?us-ascii?Q?kUaBFvq9l5QGzik22S0vDQFvSRAacl64wNrX0GVZ/Ao0+OoyAcPmRp9dBl1B?=
 =?us-ascii?Q?+J5/1ubaC7hwtbCRGn1TLzA5k13Knp3iP9088eomo9BwnEQP1oOKHwBtb/a/?=
 =?us-ascii?Q?RMRX1qbBcepKAX9/WewLZonDLS27JuiOzNvhdhQVR5UhU89v7t6hVRd15fUr?=
 =?us-ascii?Q?3KUm1Y8KMQFEwpgFFY3Rx4wkZvZiuxT14BAYD9i5i1gyR8ILRGhm5VtDN8QY?=
 =?us-ascii?Q?ICf+L9A7Ra3KrxHpWDMbO64ISdF5im6SSekVX0c1oLSR+lRD6SO+NAZZsV8e?=
 =?us-ascii?Q?jH9i1ZD8ZYoHV9ItWXO/ArcTa/SUV2zhyMrF7fMg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f989f7dd-9a80-4fbe-e27d-08ddb2d9bcdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 04:44:00.2435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dhWqLuwwoXah2bYgIwbM/ZrGL71QLxLMsFkM3p7i7k7OOOlnSXtqixjoIMpohBt8zLDuHwI+vbKIkkrve8/G0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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
> Sent: Friday, June 20, 2025 12:05 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; nouveau@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v3 04/13] drm/dp: Move from u16 to u32 for max in
> drm_edp_backlight_info
>=20
> Use u32 instead of u16 for max variable in drm_edp_backlight_info since i=
t can
> now hold max luminance range value which is u32.
> We will set this max with max_luminance value when luminance_set is true.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------
>  drivers/gpu/drm/display/drm_dp_helper.c | 10 +++++++---
>  include/drm/display/drm_dp_helper.h     |  2 +-
>  2 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 9df95776d1cb..90b23f78a12d 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4293,9 +4293,13 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  		return -EINVAL;
>  	}
>=20
> -	ret =3D drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz,
> edp_dpcd);
> -	if (ret < 0)
> -		return ret;
> +	if (bl->luminance_set) {
> +		bl->max =3D max_luminance;
> +	} else {
> +		ret =3D drm_edp_backlight_probe_max(aux, bl,
> driver_pwm_freq_hz, edp_dpcd);
> +		if (ret < 0)
> +			return ret;
> +	}
>=20
>  	ret =3D drm_edp_backlight_probe_state(aux, bl, current_mode);
>  	if (ret < 0)
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 91094a38594c..6176e0b5ea1a 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -850,7 +850,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc,
> enum drm_dp_quirk quirk)  struct drm_edp_backlight_info {
>  	u8 pwmgen_bit_count;
>  	u8 pwm_freq_pre_divider;
> -	u16 max;
> +	u32 max;
>=20
>  	bool lsb_reg_used : 1;
>  	bool aux_enable : 1;
> --
> 2.34.1


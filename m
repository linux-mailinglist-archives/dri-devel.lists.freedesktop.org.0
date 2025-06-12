Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F54BAD67C7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 08:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF1F10E727;
	Thu, 12 Jun 2025 06:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XK4h1Cb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3110E717;
 Thu, 12 Jun 2025 06:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749708880; x=1781244880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=27A9e6wXgl7aPqtUDodJjZngVRW25ErpFTDWzG2qP0s=;
 b=XK4h1Cb90diTcbmuUMvDNLWb5OzwslgjWJWgHGYRxmYAsriM4HidYJIB
 L2oMVmnalpfOJdbB0Hdax29knaHO1lpu3hj4AMopDQpt6w2aLMPo+jeNs
 BhiUecr9sYfCD8/LLUjzyKfZAXoJa+YnoX/LAZWKU+nJczJBs36AMaZdo
 nBr9rSVwcVYr1lhWIQSO+DQPLSRtfYOVfTFgaiN0Z3SQGA0SCCUZQRigL
 5tc/BLaDFjIa+xAdHEkK25FqimTAZqHlg98VKcVI4jZAMRR3h8BcD8NxE
 qw9T1NqoXmsMmsiSZeNVzK7uHBBnXkBSoVOSEddHHQO2P16yM2n53S5kR Q==;
X-CSE-ConnectionGUID: ymMi00uBSxSld1Q+iirdwQ==
X-CSE-MsgGUID: p4lazecnQpip3lwn73LjHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51862492"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51862492"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 23:14:37 -0700
X-CSE-ConnectionGUID: bxlB5bDGT/6jqFxxcYOlOw==
X-CSE-MsgGUID: Rg0TDeJkSBummbu/YIuwMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178381298"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 23:14:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:14:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 23:14:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.80) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:14:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOr9pbF4dLbVtXQVerGjAClVgWjd+/sGNO/hsYKvLb1c1ICcwysnNNt0CQpta5fI0tCFu4N6Mbm+DB4sNUa62hmfRbbCMYch+YTfJXvWBPapm3Jw/JCyXWFITpPXARlt9vVPoZBOPg8r9/oBbGOjetszGtFuuiiVLhVhRsPNBOqf1tGgeDYOsx0ENsBzLBZchLwX8j9gyqBg2kB+zNfvGNjVRd22mpFIyGcdFfPf1v9vVyMoLEhxQ8RRYC++g/eSOw6hP6vLEJlZhs7wcskrbjDBvxH4Thpe7goJS+Mt562RF0QnV253Vq+z2BJJhB9UjzJpyWi2IHzLKXbEYUbNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXafNa2B4h83Nef/ad5Gxei0Qb77r+mARNjilaZYg14=;
 b=aTVloGwiqDfni3gT04QK20PsX/H11GLGu1hW6K63uHtDtlOvfvjPR0gE0pjm3hbTCONOmppQr1J0Z/IgO5aMxadeKeAhWiIx7OL6NVtcW9ys4szj9ZT1HtkgctC75hg/dyKZXJK6+N/bIX78hKxs4b28dQXWVBThqs2Mj74H+DlfD6I7uc07vh2b08jjYJYcxGJ9xxQVxMTwJ8z1NiJ2Iy05tWL5EUURQzwi9Oe+T5n7cLZoMX/mW/VOnpx9Ug8jZa4fHXn++2zriGW8vYs8pTIi3b39Vk6vVqoHn4hUS+yPjgeXev6LCC5nwPPXAWYSd+xrCTc+tZhVMGfF/A2iCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH3PPFC852EF225.namprd11.prod.outlook.com (2603:10b6:518:1::d4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 12 Jun
 2025 06:14:30 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 06:14:30 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Topic: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Index: AQHbrPQjxmDvPxxadkOJV/gto6LZRrP/W3kg
Date: Thu, 12 Jun 2025 06:14:30 +0000
Message-ID: <IA0PR11MB73072A82012F059738260626BA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-4-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH3PPFC852EF225:EE_
x-ms-office365-filtering-correlation-id: 96e85374-a592-4330-f58c-08dda978647c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?eOQ9308Tv021LcBb6+3TH1IuwXj4J2Zj5GyNKioSt+61xERpz8WSyRGb1r/L?=
 =?us-ascii?Q?HJdk7mUATmWgTJvlmt/DawfB91QyGDMm0eAFJ/ljVVqpEEmjqLWY9I06Bcc/?=
 =?us-ascii?Q?TQiNN18AHpZINpXb7Z4GgQ+kVy/5nSXApL5R0XUafYbNTga4Vm7F/Ep6IrrS?=
 =?us-ascii?Q?dYrV5N3ce7TJOujeFw4Ge/T2bbWt0Lzx1wwdb0LSyBum4VidO3uHhd88Wmv5?=
 =?us-ascii?Q?j0CDV9IJQgfq6vySQIogj/iTqyAulGqP7QwbyVCvKF2GPXgcu+I/aE6OkBK8?=
 =?us-ascii?Q?qX8svxy+wDippJIKIbH/pGTEwg+RhTr5+lRtyYNlMz31dX/dQq+rVZc1p9hA?=
 =?us-ascii?Q?DWux+FTxZK2bish8SjdPd3oUpsjc498ICPMmqPYTlCTkmo4lqZb6KkvJHmvi?=
 =?us-ascii?Q?uWsHnid30kR21k3wnKlXXX4jwvmZHKY5a4TiVHKMJCjIrqs4OdYffozJOawS?=
 =?us-ascii?Q?nTULJ5ko9d8A290NHU05FiTVpd5A693kI5aeultMTINAnhdIG8QJnvXrHC5i?=
 =?us-ascii?Q?1GX9Q7m8WxAKE0RSH5AKUKjC2R7WrNTc1dWOBQCnMCk4qsw2bFrmP3LG4Da/?=
 =?us-ascii?Q?z9J4cwuiPSUuFSNYH+EhlO5E+Yfuz/7U7VbWU/vuih4j/n43z1iKfrQAd/DQ?=
 =?us-ascii?Q?WnWfEHjk+NpmSvKmujjHqqL3DYgfk+mUBXXy2NI1DR7RNidNBPyW4CCCoBYN?=
 =?us-ascii?Q?V4X6Pribimh9RJhDcJ9xrSRnuCFdL8sFng7573H1V5r8SqFi2aD7H9oOtlmQ?=
 =?us-ascii?Q?jq4zEpy+0EYBYaDlLfeHgNB6ggc4tMTowhfWY3oPvlmsEaBopw/7dXwkkzRH?=
 =?us-ascii?Q?ucQhiNmv7aoGLZzChJrgJPDSMq38/5gLvf52hie1FC6JrA/bO/92G/QFQkET?=
 =?us-ascii?Q?J2FRaDjLR2o1UuJGk23cNLxidg5VGBNOKQbR6/LE7vH2oGO42e4aG0ZZHvG5?=
 =?us-ascii?Q?iqyM+isBstwuISaqhnp8RVYFHM8DvCyWIFPgGkpfWnX7aXo4dQv/grCvY3Hc?=
 =?us-ascii?Q?83L5d7d9gSp/wRn+WWPsmWKDSFmzSudjih14X3JXwgmJKQHtrQ9uOsXuxls9?=
 =?us-ascii?Q?LoUMXJDElx4hYpmbu0HOV5fK3WsUieomESXVzqRUeSasqdM22ZDmSf1UafJZ?=
 =?us-ascii?Q?8rk9/nr48blj4cQmVitoKnwxC4hf6cXYDvTDvtzs+bzMSDp4EDAz9E5UrDGg?=
 =?us-ascii?Q?nXCLAxGCaYLbvzwpK2/jXW2MC95HoNPpirpyoHAJ+W0Z2vTtcI4iSINFukGm?=
 =?us-ascii?Q?a/3cmiEQJ9ddt+85KgnYEZgBTsGww2q/QzMFDZShuraA295FV9BQ1kqKxzqd?=
 =?us-ascii?Q?upXMA3wcpX7gD0hoKoytRoAKvJtTXUSM9F4vuIXBfjNYOZSaQ1JrDIyBMd20?=
 =?us-ascii?Q?64vT7NN9xpJ5mcYXfWi9YRfvcpGpwZW8PWwo2jjl91Q9j2vlyGR9LSlV7Hvz?=
 =?us-ascii?Q?eGPUQxHY9V/TiKeH+DEi+6AeR0zjvnU7hvPvAIT/yA1afcaGUwmTbQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cJHsCPJRy4JxX8C/q8zFfLkZpSsrpyeLQJ8lI+germwP8fkWnPIsdJfg3JaM?=
 =?us-ascii?Q?i7hzUhxHMoDY5vPfb7pmL6nXqbSaX30ZFAwOCnc0VTg14H67FauE0it+/8Mf?=
 =?us-ascii?Q?Yi+mrb7Gcc8b7jxquxauIPahfHFf7+A/lEQU7QI4Wus2gkz82R6QPmgcju40?=
 =?us-ascii?Q?QphuLGSgK2UCPoJvdkcSjbUxXQlla1jRKHgZNGbWEu4IA6aeoHJXV/YefKom?=
 =?us-ascii?Q?SYDpcTD0uGpilfN4r0eUsRTA5SG6U06zPYUybY2jLuVt+BNrg7tCIErE3tbY?=
 =?us-ascii?Q?gY5B4ieE7oKFP26DcTTIcZ8R2PosI430dgoWnSHT4wFXTeYU8pWX9omj2geJ?=
 =?us-ascii?Q?69T2316fLor2hbdAJ3HlyZBBByjWcPKMrsRdOgZ6rkyGiUkeDymQYx/0UvpY?=
 =?us-ascii?Q?Cp0k4xN9iiOMLIhN313zSI8K3dx6XwI1V93HFBCpC1YEotgLVeikVq8sM/ld?=
 =?us-ascii?Q?uo4oHeMYDtJXPK0tvhlpeedUXsJ4NkkK+BcVmsQ7hggmkpi7mNJS+itdKojD?=
 =?us-ascii?Q?JJlA+9hcDJpKzEPcR7l4+n4GnREn2ixVJkzX7GWfUbyVSGj/CB9dj+Y7sQvW?=
 =?us-ascii?Q?izG7yb1QoQKwonXGDvjan2nzu2sQYDHnPuGRCFt0ZkFUdVXZVithAviJRZcy?=
 =?us-ascii?Q?8qeJyeNZKT4EkHtjoWN2c1cBeXEsGVhA+dyxMVo7Jqg81W7GK+2ckwdU477P?=
 =?us-ascii?Q?EmXo8fRZU6SXWBaW3fmH++rooKyjI5L7Mijs6ftGWoBZm4idIkk4NMk6sxD9?=
 =?us-ascii?Q?dsXstV4nSBB/xoYoBEjWI7xYAFX4DOFV61wNPF8kvCAn3QTj5N8FPFCifvFu?=
 =?us-ascii?Q?6lnaUMg2j27Y0LP4GUxFetQyUcGN35rAeUkWlbqtEn69IyJ7lluvcqLhJ3Ud?=
 =?us-ascii?Q?ST9tstemzFPNiKnBrDZzTc8QLj4JcSX9iWoohvKMHcQRko2CEnJYJJ2HSyeM?=
 =?us-ascii?Q?Wc4E/Tn31vIF+XtrFVb0dPAlgChcxEHECgY3l+Wtr5D06LH29uk6OMOFGVwx?=
 =?us-ascii?Q?YSHyEmMywDAPkRQ3oQ1S+g3GQvBipKWHPqKKqlWjOC2j7RvR22rYcEBZTRKT?=
 =?us-ascii?Q?CTnU+65MYTSk2Y6cC8ZVF3NC54Cw6T8iS2xMD3Rku48O2jRs0MetS+08pl/l?=
 =?us-ascii?Q?aZag/v7AAGuXZLT7PK8mS+raQlBfLVaLuX+vBizF5pnNbY5ViMMMV6J1ArOg?=
 =?us-ascii?Q?/86M1m1ncJwWLdboFavLymQ+6BUr8yD0ZE2zE9MvGZxL77sIHkpsZ8GEFlAs?=
 =?us-ascii?Q?SwA3raB+C4vQIjPP+zgGMZUrhFzxNzkJUJ9JYdqciGIAjwIv7eVqRoL19G44?=
 =?us-ascii?Q?TGKzfaKQR6CMGqC5vYJOOP9rjNmvgFHc2yqHA2mFGsYiAKPbvfhaCqBH/9os?=
 =?us-ascii?Q?pnog87OBfMC8nXi84ZLwoStZLAbmcmDNRLbt3ncj/XaWBbo06zPoC/AYTHI6?=
 =?us-ascii?Q?wbL5Fg1zSMnQEdiJBnW7d29RfNwNVQ+V5R0qrtHBxt6TuVinWmqg+U6uEvmF?=
 =?us-ascii?Q?TBM0njS47yYf3FTxIaWTjeT5oee2JM65ZMvkbDIcCPLaGV9mGn0pUsk5seBz?=
 =?us-ascii?Q?SoBTHKioCV9M4cUFB76+RK8+rXqLEMPRFNGYQ6Jx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e85374-a592-4330-f58c-08dda978647c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 06:14:30.2916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qR/rS9jK/vZlaBmU92FlXRxrle/zslC0nGf4FDiTVipEPk0A3Y219G3M/Q+8vNQyR3x5lHU++KYblddXYldCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC852EF225
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
> Subject: [PATCH 03/13] drm/dp: Add argument for luminance range info in
> drm_edp_backlight_init
>=20
> Add new argument to drm_edp_backlight_init which gives the
> drm_luminance_range_info struct which will be needed to set the min and m=
ax
> values for backlight.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c               | 5 ++++-
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
>  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 5 ++++-
>  include/drm/display/drm_dp_helper.h                   | 1 +
>  4 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 99b27e5e3365..3b309ac5190b 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4227,6 +4227,8 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> *aux, struct drm_edp_backlight_i
>   * interface.
>   * @aux: The DP aux device to use for probing
>   * @bl: The &drm_edp_backlight_info struct to fill out with information =
on the
> backlight
> + * @lr: The &drm_luminance_range_info struct which is used to get the
> + min max when using *luminance override
>   * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
>   * @edp_dpcd: A cached copy of the eDP DPCD
>   * @current_level: Where to store the probed brightness level, if any @@=
 -
> 4243,6 +4245,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux,
> struct drm_edp_backlight_i
>   */
>  int
>  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> drm_edp_backlight_info *bl,
> +		       struct drm_luminance_range_info *lr,
Would it be better to have this drm_luminance_range_info inside the drm_edp=
_backlight_info?

Thanks and Regards,
Arun R Murthy
--------------------

>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u16 *current_level, u8 *current_mode, bool
> need_luminance)  { @@ -4372,7 +4375,7 @@ int
> drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux
> *aux)
>=20
>  	bl->aux =3D aux;
>=20
> -	ret =3D drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> +	ret =3D drm_edp_backlight_init(aux, &bl->info, NULL, 0, edp_dpcd,
>  				     &current_level, &current_mode, false);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index d658e77b43d8..abb5ad4eef5f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -600,8 +600,9 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  			    connector->base.base.id, connector->base.name);
>  	} else {
>  		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> -					     panel->vbt.backlight.pwm_freq_hz,
> intel_dp->edp_dpcd,
> -					     &current_level, &current_mode,
> false);
> +					     luminance_range, panel-
> >vbt.backlight.pwm_freq_hz,
> +					     intel_dp->edp_dpcd,
> &current_level, &current_mode,
> +					     false);
>  		if (ret < 0)
>  			return ret;
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index b938684a9422..a3681e101d56 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -234,6 +234,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>  		    const struct backlight_ops **ops)  {
>  	struct nouveau_drm *drm =3D nouveau_drm(nv_encoder-
> >base.base.dev);
> +	struct drm_luminance_range_info *luminance_range =3D
> +		&nv_conn->base.display_info.luminance_range;
>=20
>  	/*
>  	 * Note when this runs the connectors have not been probed yet, @@ -
> 261,7 +263,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>  			NV_DEBUG(drm, "DPCD backlight controls supported
> on %s\n",
>  				 nv_conn->base.name);
>=20
> -			ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> >edp_info, 0, edp_dpcd,
> +			ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> >edp_info,
> +						     luminance_range, 0,
> edp_dpcd,
>  						     &current_level,
> &current_mode, false);
>  			if (ret < 0)
>  				return ret;
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index ef0786a0af4a..6f53921f5dce 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -849,6 +849,7 @@ struct drm_edp_backlight_info {
>=20
>  int
>  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> drm_edp_backlight_info *bl,
> +		       struct drm_luminance_range_info *lr,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u16 *current_level, u8 *current_mode, bool
> need_luminance);  int drm_edp_backlight_set_level(struct drm_dp_aux *aux,
> const struct drm_edp_backlight_info *bl,
> --
> 2.34.1


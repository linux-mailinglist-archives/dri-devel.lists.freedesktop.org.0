Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B6ADFCE2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A291310E99A;
	Thu, 19 Jun 2025 05:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp0Tfiy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB80D10E996;
 Thu, 19 Jun 2025 05:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750310605; x=1781846605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i76FqDD+sz2ILRlG75lFW4GDNaB+gGFQj0C6lecXGI4=;
 b=bp0Tfiy2Mf6SCALq82mOWdFqxOZxTkwI7Lxq1nvK4dNjyUb9G2ABg9/m
 bjOyTNFMgWFaUBP0FHBkVegBVcoBWIiJcqEbQtlkvOstqcVV8DmkcJDRt
 a5nCFR79nIFglSmo2PuKY8Jw+9yg+OG+84KPJvSlidM3vcUeZOObmBt4s
 Ds+YOF4UpKlqRgjX0UbP0XrqoMqBYNQ2epWWX2nMkDlvw2RDq+yFCc4vg
 MvhlHLVKA16IaGQYq98HafOWtvmBIPt9EwYXmZfkJt6EhELEBrfjz3pXQ
 5N4vigTQPJnI4+EqRxgxhNhQIG9zpz1pb4ugt9zocL7MShhJzKHyLBRHK g==;
X-CSE-ConnectionGUID: 157Xiht2RGKVj0467oF4sg==
X-CSE-MsgGUID: EXvqBjpWRECaaSlkesiUGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="62824150"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="62824150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:23:16 -0700
X-CSE-ConnectionGUID: /XCGqjBkSUGB8X6LvXM0rA==
X-CSE-MsgGUID: bAFn6k3gR9+sbKiPgNisDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="155992130"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:23:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:23:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:23:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/RSpuP16nOe9zcWBRrqKcRvzBOnJdMuz051UMo8V6ig3cDQ4hYJNOLvVodFmyOdHh5dlZ/D/qJBq4qCQzBNwutAqFLQ6TlertYH9plnEfKO+DHglhUKGwy6F6PeP2EHr4JBNor+oiE/RwGhMtTFSViVrIjKAGL0CUWDEdP0G2CsfGvAOuyqzfz6hJFozIbJCqvMiu9CWMh/7ElasuSpusjnsO8yh5b/gTYrs4exlmoUlRL/BfOfa0VXliVlZCPnjCrQEZ3QtRHzxmCRJm1cb2ZZMcMN+BS7e2fbs7XB8DTlmP31lsdTascvgZIMrK237MKI+HDqjaxvvlSVl9dF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvOZHgMDmXxlGx10o2tvtRfR9K/2xYBAqK3TRcr1n8Q=;
 b=A6sEigZrN+IygCX8XZQpnToDHcMUfdMGCsZnHo7EB5Knb6dSSEaEBKvEn7eKZY01xjXXeHYwoy9sQqJ0E1dBITi1kcOo1iVR4T5vckL85/6csDovFFD3HTJZ28B8xVcj06R//6TmUwat8rmpeBN8F0LTB65xm4CV5yW/EJcFXm+i7UIlEw7TGb1NYgKtWbsOuvA55j1Ieehfs6+5XvT1rZ64mjNjcqsXB57BsSOaCbW3w4c5v7Frnl+IOJg1rXT8WrC9qpdnVFqVjWgLqMheff1L2IAKvdI4CF9fD3SSHzbFcetl+tCEsFVBxsUsSUJQrQ9d7oCxPujrurJTiG5ygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 05:23:10 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 05:23:09 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 05/13] drm/dp: Change current_level argument type to u32
Thread-Topic: [PATCH 05/13] drm/dp: Change current_level argument type to u32
Thread-Index: AQHbrPQkmx/g6BWyrU6w+mz7R4EUIbQKWilA
Date: Thu, 19 Jun 2025 05:23:09 +0000
Message-ID: <IA0PR11MB7307E5272FF33B6621A55CCEBA7DA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-6-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-6-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB7205:EE_
x-ms-office365-filtering-correlation-id: 3e3e228c-f346-46e7-e31e-08ddaef16103
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?82li58vfklEq//nKWkeeIuFlAkM+sYQXbrlgeChwIC+GQepcjrCQ8GfeSqhq?=
 =?us-ascii?Q?AT7fjphfkoE5bcpo+s/aF0nvnEHl2bSsIlldz7pSaI5OGYJe4I8HaL3i0Be1?=
 =?us-ascii?Q?+1qgOg8kQMts3FKYPseKKypvWx1kuFdVaLAPdWA/eeKCHCl7Tk/XwdTgJnXo?=
 =?us-ascii?Q?Hv0BsGys60h22A/lqZ4ql1j/jSuayMg2vzUnTH4hJBNCkx6h9Ea5dwqmc9Kh?=
 =?us-ascii?Q?8X7RY68UoPxfzLxbTmGs1ImtCzjoyEKu0m4JYkS5fQeKavLH/Yfd36H9mZk7?=
 =?us-ascii?Q?StAa5MPpxydGw/T3j2y0d6IBE4FatGtbpR6ovZgYr9uyu3Fm1MufprYMeFMA?=
 =?us-ascii?Q?Twmj71SgBtPVdZVmlZSz2cTNJTxUJbqnZLJunvLYVzderwi9gGklu04VIW/1?=
 =?us-ascii?Q?HAH8DGzeW3x2I8C3vw4N4fA7yS1D71a68YcG038+gK/zBRA4iK2KsTy6vBuX?=
 =?us-ascii?Q?I2yRP/M1PpMdqoJ4Xb3jh7L4jKG7ERlVGpR6cjBF7OyZvbz9R4J/HMcfXa5/?=
 =?us-ascii?Q?6stFKFgn3fXwsNpmhtS6q7FYoivs22Da7RtTfK5I5XfF988bIiV7L00GnlRp?=
 =?us-ascii?Q?XGJKSBry3lVHWMpveXHzgbEyZtHs6X+xh249k+M4DxYXYEh+7NL7s/4TMEzE?=
 =?us-ascii?Q?DKs/9lceHvH5G8vuFDG5/2UwaZDccUsc/0KwrF7GGhT1G6NbzkEYjAxxNfCC?=
 =?us-ascii?Q?0vGjalTNySZtwFz82OVEm22jDwYbd4pYqr8+SAAXHnAX8UmZZGyYhMfCdtB8?=
 =?us-ascii?Q?GwUl/J7cysxwUU2aQL17LaQ1nabWnKS5OJkF05lSrw8ccoeHDkfHbPO1KFXj?=
 =?us-ascii?Q?DxpCRTSaDL/goUs12kGxzqkVD4wbzENVw5gjMy0C8Rz2K6g7YIhjKVjD/vKx?=
 =?us-ascii?Q?GcZ97BdpKEc9wIV0Kvw8R9ez/Q/hyKMZ05xVtcTxKlWHSVBreAvBdztkNYQ5?=
 =?us-ascii?Q?YOBtLFhxyuAEEyHskOdHhLA8xB4TBRx4ltuDZZTUNawMw+bZJqpxwX8wV9d8?=
 =?us-ascii?Q?rcwGfELFHPQFpHfD+cGI8W6P8lG/0o7MkYAXUosqAuWJy2PRe6LUV5uAB4be?=
 =?us-ascii?Q?S8e1HEH3i5Bjc/KX5OLEIUPMSex+qPpX2PPcbuvz9U6r0hb5WEw6H4gcw/Xe?=
 =?us-ascii?Q?TkZMEUEkuXMoXgUFw2xrJL7G0TsyYfyeJ9dPRVkNwlAvo6Yxl32omPK7Antl?=
 =?us-ascii?Q?dGDfErpb8FY7/9j8x84inRGyC/VjmLU6UlhzuZe0H4JbGMk+0/q1nF+N5Vs8?=
 =?us-ascii?Q?yqWtYxqISrrJ9TPvICLCgubyWUuFRxw7YsBpSqJ87mjFamu1RhUPypRb+zXz?=
 =?us-ascii?Q?ES+0HDk427P+eg878s8zsC0T6KYOP4M3p9dSc5eDS8NxiGO9IEAJm7tk3IxV?=
 =?us-ascii?Q?wjD7ALtLOnYEoPqoKGvwZ/f26rZmuf/9o9QaustyFJ7BnWZw8gAkt7ujrbjq?=
 =?us-ascii?Q?LoFsugiyAEhI/XH8bM+JuIqqo+xadsxYWQVsbv4lxj2jObQrX9LQNYAbikHL?=
 =?us-ascii?Q?ZT0G6SXBeAggQic=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Goh2D/xh3fAHUT/eF4JmIWlS/+cGXDHMsINA1EnKcMP9/38qpVp+Zt++Yhxl?=
 =?us-ascii?Q?ObbpJmY+gnKhtO2v2RnApVcj3qzqoyJZHVlnMBSXVsypFoqXk+7e5FEagOOa?=
 =?us-ascii?Q?NYJH0jqa98f/OFEHPf193I7czbx0WV1FlCd7HsnO4SjoU2S73S+O7IVipD4L?=
 =?us-ascii?Q?g+49+E2C0JGaPVW8TLMsTSl7/CRytns7PU7vBLlubMgQaVMGiF+ru3IBPiUQ?=
 =?us-ascii?Q?bx5vSFSmrLo2MwLyBqedbZvqWNPxZsMGsXdAcqyz1RUZKebgcHxSESAnhTaK?=
 =?us-ascii?Q?tNcpQIHaNvivlwwHrgPzewJ4bJL11U9Ww04FZgdPdignfbPc/4EKK3GO/pJR?=
 =?us-ascii?Q?L854Oc0BBWi3Yqqbvu8KUJJeiLF2PSbBnpq5H6TkMtwg5Lee52hJLkDfooSf?=
 =?us-ascii?Q?VOMl8fMaFf1ijV7iaP1CpS4MdoLbEpkGhYuJnkTP8Sn3fFq1pplrKQ5EDfP/?=
 =?us-ascii?Q?zBa7cZxlaHwFd444d7nwnDaLNEqCHUoFufqwfEJKrNdQOQ2muHXuvij9yXy1?=
 =?us-ascii?Q?dwqJQl28uy32m/ih0VxKteAdoyhxFKtyEntNvtJFtmLqaMn26XJBdiwSnVPi?=
 =?us-ascii?Q?oztYPeOtvC2o1SAK5Ob5V9Cm+1wn+2FKX4uX9K+UGizmblNcVp8JH2bV2Q5w?=
 =?us-ascii?Q?yFpVm1uc03t/Nc3Re+ehoq3YX86Xk1VMPFX6PM6n9wqkVFdgym9iPuG7fC//?=
 =?us-ascii?Q?Hfos3XkiMtkhTthPI6Gk8JEw24ezMPEEYE2tbiyHpARnv/yyOrfr60iQZvsn?=
 =?us-ascii?Q?Slzp0bnQ3e/NHyufc3C+DPh6+x6mt+4cpStRru8SmO9xH7ST2LT7QZ3QM9Oy?=
 =?us-ascii?Q?3cTMkmy0zgvJ/DRMso1mfjd1BcYFPbJfhmr4tJtAhl9I/8nDXdBBLNqFDRRB?=
 =?us-ascii?Q?lX+jm0Fyg/d0RiKh3HWw8JV3IaN8EV4BQPXtMUv4TiayvIBjx6f7xIuLNVjz?=
 =?us-ascii?Q?j8hupqn8UkUVaFM/Qh0fuGbJhkoxg4glc5xj6zm8kHnxGhD/ZWozN8et+17j?=
 =?us-ascii?Q?VrZLuycBmmv1PxKkF7NEs7AVggAIdkyujyJdRrY7ojiJKc5sAqzEF+0GPyTw?=
 =?us-ascii?Q?THXJAe23N5XyGWxLd7cXqvgc/X2cJDyktL8jWH+9ybAlW/RLdLcJhRvgUGk8?=
 =?us-ascii?Q?FtZoZea5/dYZg/cSgikFbbli+zv3NW0VlGwahP3AcYWQV17Zb6icIplUrTIK?=
 =?us-ascii?Q?TTQPcxJyP9YYnlFNkMtQ5p0hbQHUYHB7DRyc8HK9gnVwVjUG85RCAJxbV5zo?=
 =?us-ascii?Q?gPszR0sbfFv024h+P3TpIIbkmyusNwEQshZgwsbeM35xunfxXaG96lOfLEnF?=
 =?us-ascii?Q?LaKvuYXxM5+jjEDtsmdPRgXhYumI80uplscENajQ0J7XRSI3ME2lf6ETXBT2?=
 =?us-ascii?Q?2mE8Bc7eDMrdsgvQ4ZVIaI/raK6ln9LSZ577Ak8MrbVLF0Jcmhlf2C8RYSuD?=
 =?us-ascii?Q?GEvgCrOp0tQIqE3AmdoW9PoOL2PuB8oDlnAbW8XnQWe6f8J+mGN8CVuqCMLN?=
 =?us-ascii?Q?O/4/KMX++Ns8vi1T5lfLAgc6c74H83d7nPlkO/jyYkSGtIE1561fyETOoQ3A?=
 =?us-ascii?Q?C10YwGhbajgnah2VZJAap1XKg7r8lM2GJKdrHXwh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3e228c-f346-46e7-e31e-08ddaef16103
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:23:09.4082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbv94GTMVu/Po0kaso7p6nT+rsNCNScQE6YEaj+GhjB87wQSGiLJQy/CpOMTHYCGHzozaS+En8niEgLOqPObBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
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
> Subject: [PATCH 05/13] drm/dp: Change current_level argument type to u32
>=20
> Change the current_level argument type to u32 from u16 since it can now c=
arry
> the value which it gets from DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Looks good to me!
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
>  drivers/gpu/drm/display/drm_dp_helper.c               | 4 ++--
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 2 +-
>  include/drm/display/drm_dp_helper.h                   | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1322bdfb6c8b..c58973d8c5f0 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4247,7 +4247,7 @@ int
>  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> drm_edp_backlight_info *bl,
>  		       struct drm_luminance_range_info *lr,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> -		       u16 *current_level, u8 *current_mode, bool
> need_luminance)
> +		       u32 *current_level, u8 *current_mode, bool
> need_luminance)
>  {
>  	int ret;
>=20
> @@ -4355,7 +4355,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel
> *panel, struct drm_dp_aux *aux)  {
>  	struct dp_aux_backlight *bl;
>  	struct backlight_properties props =3D { 0 };
> -	u16 current_level;
> +	u32 current_level;
>  	u8 current_mode;
>  	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
>  	int ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index abb5ad4eef5f..be740fb72ebc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -581,7 +581,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  		&connector->base.display_info.luminance_range;
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>  	struct intel_panel *panel =3D &connector->panel;
> -	u16 current_level;
> +	u32 current_level;
>  	u8 current_mode;
>  	int ret;
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index a3681e101d56..a430ee30060e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -247,7 +247,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>=20
>  	if (nv_conn->type =3D=3D DCB_CONNECTOR_eDP) {
>  		int ret;
> -		u16 current_level;
> +		u32 current_level;
>  		u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
>  		u8 current_mode;
>=20
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 39d644495f3e..62be80417ded 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -851,7 +851,7 @@ int
>  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> drm_edp_backlight_info *bl,
>  		       struct drm_luminance_range_info *lr,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> -		       u16 *current_level, u8 *current_mode, bool
> need_luminance);
> +		       u32 *current_level, u8 *current_mode, bool
> need_luminance);
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
>  				u16 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> --
> 2.34.1


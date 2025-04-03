Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23001A7B119
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902C10EB7E;
	Thu,  3 Apr 2025 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIsaziqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABE410EB7C;
 Thu,  3 Apr 2025 21:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743715733; x=1775251733;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N2nCmRQNccJxIX/nA42OM6pyMhhdGnSltWVfrKrcGrM=;
 b=HIsaziqmvsR/t5NxxJE3nZWxGYa5GUsOK0Gjmu24dav84+b++Cam5h/D
 LL5ut77+DX+64pk6rMJCuHG23MowTyzI7PpLSDnaY5Z++jpviQNuNwfbx
 7tws3AC+owG8jDnVMGRagEFMt/+p0bIaxJxYYxD95VaGvV6C2yni+DiM8
 QEBoQVL9v4/uqMEUM6UJUHzCeN6CtbdbVmrci8aYrMnmLKFqIP/BXyKhT
 192exSo1NPW+K8FlCbmJmulVyGfmVofa2ViK/LgHfBKAqw0fGVjEPBrp3
 RsMR5BAs252Q3/mk6Q2GuPzr1aiWGGVKEu9kg2eV1YARByAIdFNncK44t A==;
X-CSE-ConnectionGUID: 3e/ubciLRHeeRdBWlvdcnQ==
X-CSE-MsgGUID: nHYgmkuNQru3oSZAo470Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44862793"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="44862793"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:28:52 -0700
X-CSE-ConnectionGUID: +TISXZwxQjuuUJ6K020+IA==
X-CSE-MsgGUID: CptgXO61TPyVhfCr8FNGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127648086"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:28:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 14:28:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:28:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+7CZ/5xmTRBx0wxaBgv7tKnsfJTOtZansno2c1rajVaKtV9Tqx3Pj9FIT5V2MyqW+yeZpLNkaoU1ghZ4i/usEcTB384EwOQO6C0xynTdBzW3HJ5LIKUCEqOU+IZVibLkUO4kIif0nmMLosk6jkrv7LrekoKpnK6SEhYLFUNJRS7az/cbmpHaZN2jX/Ia1T2dqCp6z3fET5ktn/L6kNRe8Rtl017AKYrYtWeTTzmznmtqV073R9yPpMsK2DwUv7iY8wOX8mSSlqV6RNNeMLcZ0knuX89EsQ7JXOO5J++vMaePmzXn6cyvkkSDDF5M51zCJrRpBmfpnJe6pjq7vBYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP6+4DDRN7hN9zvZYY5/ten5w/XrXRdErTkDi0yiXA8=;
 b=JffRZkC9xn8qzlIZ86Gx0AyLRzUw6fggUSsHIrLDXIDuW/k1bAQdq3M1HSaNgf1/vFyPy9Q8NzwRtZxjANpOHNmEsRuPDqIi+/tM6DEgnrxJiyt9aRvrUpLpMEG/bC8D7ZEhjkwqzliL0DIEhcegNM+JFrz8H3wEQTY5P/hFkDTl0oS2AP8czUkFS2kutVQ67qHqWN0gy2PuBZfdSGc6kyHdqqVyzdqMCrNSQ67xV+xKmtl351s2De8Hdybgy8yk9JTQoroNPzINt+8NNUSe6hGyORDv6uCsBDcgnsQMuYUoRL33ZJL1dAp0AQOPUBiFjWBpyall6JpVXkFOjiBTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:28:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 21:28:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
Thread-Topic: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
Thread-Index: AQHbpNaks6nYR6a33UOxdYQQaScsHbOSZwOA
Date: Thu, 3 Apr 2025 21:28:34 +0000
Message-ID: <CH0PR11MB54440C198B9BAF07700665E8E5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-2-matthew.brost@intel.com>
In-Reply-To: <20250403202705.18488-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6764:EE_
x-ms-office365-filtering-correlation-id: 09fedf59-081c-4213-3359-08dd72f67d2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MkREQUb5c8qpiZ/KB8xGkHAcQemyjc+w8xDp4KafT5rW0aPavHxR2Jh44eSx?=
 =?us-ascii?Q?8SGME4fLQIlLJOcdkGwrziKSENdy2bCLawhFpbxVMKoD6/Ij8XrNcJXmR3Ro?=
 =?us-ascii?Q?M0WrwpnNvA6dOFTdWn+4YSHpWPeswSMDghIS4boXQ591bvJdoFIF2JXEDhYL?=
 =?us-ascii?Q?HPm8MTsXLvHK/6440WISe4CPi1VH7MOeWSKorxrV2OHQx9HyMESewvhH3lCP?=
 =?us-ascii?Q?n9qVGdQVpISXceJ1y2lmIUuzn71t11QkiYpUmWsg0VRnOnK6W9bSAHx+haWk?=
 =?us-ascii?Q?A+DXMRQASA4+9HAZirhXnCcOcTcUal9M7fuUxPeIqHFxylLxoIO8qWsIbb/z?=
 =?us-ascii?Q?q0QqZyMwkNF72ebawh3Tt9ujMfrUZW0s5D6B7TV71JpzJyA/4J0EbMe2hy/0?=
 =?us-ascii?Q?1+aiCUS6z1sn6aIQbpmUr8c8AGGEP0V8uHrne/ODdtFs30siQwSRF+Y4vJv9?=
 =?us-ascii?Q?MVTIyzs08yA5TgeSZ0HizfjWlqwygq/oPnxJoqWsR0fui7A2yBuiYg34yrFJ?=
 =?us-ascii?Q?OVp3qMajFmfHyAdyWc0GtUkD0/q2AzG66uLFe/ZsHghLb6+FjsSaHuiVqkr9?=
 =?us-ascii?Q?LCDt+EIFMUqFEUgFkUZD6IgcZx5jV17TYsfEjjH2TCs3/Y1m9e6IQQkFmaA2?=
 =?us-ascii?Q?iTQiNFRF0jbRK7hxgggoQyemgtImDotXXR7NpP7eN9i+aHMoZHBE/nYRVzPs?=
 =?us-ascii?Q?yaOZBrsjCDgL+Pp8UvsjsN/4udjsQO5sQvg1w3R4kkwbrijtYtjG4FBHQGQA?=
 =?us-ascii?Q?AEYtZ842uFBMyPaJOeEijFZJ6ZYXMsIGlXZQX0NzyrEaglJcDMMtqVVqmoNh?=
 =?us-ascii?Q?E35/wMLkKz7HYhLvMS4IIuovRT1Hznj3LEP046fzD1IGd01nvL5px6Hj3wuU?=
 =?us-ascii?Q?h7PCGksnYz3NktWuyAzXwLx2p2JKP+uOav2wLUp0j8FH5H5tE2flRuHrcHDI?=
 =?us-ascii?Q?qkmZS9CbBNf+AflDUvgh8Rw+iyMBMGOdLruaP8JI3mUpweafBWiqBLNu/cq2?=
 =?us-ascii?Q?b6nbMUYovVwIqscydwiCdTAavUGnp9Tbgx3oZHtykoNbG7cDQYv48cnQ8ZgV?=
 =?us-ascii?Q?PkqGc4kKt6Sky4BHLK9xTpprM4m33mQjaoTFUaRWoWDrpIgJQNbkAFMv/8HY?=
 =?us-ascii?Q?bS4bVFDDvHEwcv+NasHb5l/g4Uniaus6O49t4jXh1fpFDMs/25KobZTH3zde?=
 =?us-ascii?Q?qv4hgVx0BJikZBF0iR8Q2eZru6Wnn6oEJmN33iaZgeqgP05ALcShtbaD5BOR?=
 =?us-ascii?Q?buyMCPr8+SCJCViZXFrb72PDQjRZ7B/75BZ1ozGAG9B7d6tf0svs3MLBctT8?=
 =?us-ascii?Q?/jP2GMDmIxgMUp+iReS8w6DIpNhaTX+GK75T4CLg0xRyslBAWAYMH5PDATSL?=
 =?us-ascii?Q?8rBcpmipwVIGQYfxGVFyGXrkYVDU0wzDNw9BA13Bd/75RkLK0mm3A77suu8s?=
 =?us-ascii?Q?/gXek/v/OjjphD1/5861akafRCEUnYB4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aOC312rwYiWord2ooDyGIYmQUuH/jvEG2Q6MEMst4b0tVoy8l4mSKulDQ1jC?=
 =?us-ascii?Q?+HDa+kYqXNFclOlAQdg1YTQK6CGXbj8k7hSzgggJvH6hSJd/ePmSBD2gaurY?=
 =?us-ascii?Q?YYQJ0ab8wfx5G9vlu/MJ5LWSLU5poa+BKmfmqzCZBuTn+kxgZWPSfT0tSLLL?=
 =?us-ascii?Q?piDKFJumeUKO/y5RPIs/uOYlQ21iymsRxdYCIV4vjdhkOC5ISr3PUnSXpm2a?=
 =?us-ascii?Q?lwlmL1B9i1QVR5aKLu4FGfKp2jVsF8WSqttHA4EOFYX6oH7sKbHm9CLLZXER?=
 =?us-ascii?Q?IiYJf844dQDFPwDopFQKN4D6/Q963WSHEYmUjzrt3imd3RaAEJweMuVq51RY?=
 =?us-ascii?Q?xq5nZH9/CUrY3+N3o+rwZHUhDnxqW/ZhGspuPSR8vyPdNwF+q7gEJJGbvPYL?=
 =?us-ascii?Q?hw0mMnKHuTz1WNTz6n+4XNCMZ0mLGI/Txmr54eqlh6lwvLQ3UWBzcUoyNSKk?=
 =?us-ascii?Q?iPDJlaELYvguL/LOjXZUT9O/aDePQjZY/5i1ffqXL01Kw/vTHX45VAQIdFIS?=
 =?us-ascii?Q?Xqr+VkgUL0QEze0PGZUz0Ykxiju19lCCbu77QIltpK+N6gEuuBM4YnWLOx9m?=
 =?us-ascii?Q?PnK80ZkJpbFvl0Lf0VUytbEs4L0E2DGC0r3SrVFr/2TEpVkTACsiVUrLB2jD?=
 =?us-ascii?Q?xnyZJaX7CI8qZVgfWZcaD0YXG+KULh2cTzzLhRv9hTEcely/KvOoMrstQAL+?=
 =?us-ascii?Q?DttcBDLqdN5eGEScGWbBBsH/XZGbIvG81aS05tzptonxJbcnWKBsroDZdSjC?=
 =?us-ascii?Q?7jQRvZzqCTIMCIMUt9DzLRilr03KibJUevhfCSoFY0Bg/idddYLxipxZKE1u?=
 =?us-ascii?Q?o6r37gTXIkhehXv4Wgte9kpklgCnn1Hq+FrycDHLCDjYH0Iphf3pU6wZ1MsF?=
 =?us-ascii?Q?ZPWJf1hTt7o1J5Yrltykii266BA5r+IqK2MeokXrvsHW+oQ8XhclX8qlr6Nh?=
 =?us-ascii?Q?bqJrpgmYKPRqXXx9GkFXdqAe8+Xdy0jCck81ojBUx3bEjw2GnpQe2yhQQoNK?=
 =?us-ascii?Q?+GJ4RLT1G9oRmbKkjmkV3YqD/t3jGx8u6zg+HLIZclQ9TlNuYWzmyhiT9MBZ?=
 =?us-ascii?Q?gsxL88ehh1hEAD4tFZg8si2E4eUiHkM9/BM7DKsComnpAaiNIn3wEK3QbaLM?=
 =?us-ascii?Q?564g7sAdsXh50ntYcKmFapKlv2nC64ShClYBdrPs3e7J4ez3rUqPAryyJwMu?=
 =?us-ascii?Q?4qSGj72CFXMSUsrzKmxcIENS/C4P4QY27+SDqC1j4YinNy8EgFyen6oK5nYU?=
 =?us-ascii?Q?wIBikCGkI8jZNrAdAq3Tz0oq7UIS4DHzTP6XXE+bL0uDfeUoH4VlltB69d1u?=
 =?us-ascii?Q?XqMd5HBFubGEgt5yy/JmbUveL26g8mFQnm/ueqT1H+2wjbgV5ATvuikGrRen?=
 =?us-ascii?Q?iR2CelPpXwiuDVj8GdyXV4ZyZExXdqJN8lzFcIaKJL2OPxKTsTuAtQt5pbsA?=
 =?us-ascii?Q?p+9PbNR8d7NlWNqNTh0QxvCrq0CLwf1+emDwDcGJNb8bZ9J5+OnBwwWqp+oy?=
 =?us-ascii?Q?NI5l1xHZtJl0r8M69G+d21dOfIlzKX/pQYbMQW0K98CWbyKQ7n1BEn/plb0u?=
 =?us-ascii?Q?nP5RvK3XLECvWr1U3HzPIAfrREYeZaXfliC7UmVWTspW0Oqr9vqpZUjXqY4o?=
 =?us-ascii?Q?0A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fedf59-081c-4213-3359-08dd72f67d2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 21:28:34.3545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: naYFi5k0Xrx/BHtkKpEI4VIe4rwF2mZNMMHTVSlEBIcBmZFHrRPS6LrGtWa5KgMzfV14Pgjz74vbLs499b5o2vy2TO0NxfWLmkmNzxHItLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Thursday, April 3, 2025 1:27 PM
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
>=20
> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> callback as needed.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I have no issues with this patch, though you should maybe get a second opin=
ion.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>  3 files changed, 50 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 81b9d9bb3f57..a9e618abf8ac 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_=
queue *q)
>  	return &q->gt->uc.guc;
>  }
> =20
> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> +				     ssize_t start,
>  				     struct xe_devcoredump *coredump)
>  {
>  	struct xe_device *xe;
> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size=
_t count,
>  	ss =3D &coredump->snapshot;
> =20
>  	iter.data =3D buffer;
> -	iter.start =3D 0;
> +	iter.start =3D start;
>  	iter.remain =3D count;
> =20
>  	p =3D drm_coredump_printer(&iter);
> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_de=
vcoredump_snapshot *ss)
>  	ss->vm =3D NULL;
>  }
> =20
> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> +
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff=
_t offset,
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
> =20
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> +
>  	mutex_lock(&coredump->lock);
> =20
>  	if (!ss->read.buffer) {
> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, lo=
ff_t offset,
>  		return 0;
>  	}
> =20
> +	if (offset >=3D ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> +	    offset < ss->read.chunk_position) {
> +		ss->read.chunk_position =3D
> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      ss->read.chunk_position, coredump);
> +	}
> +
>  	byte_copied =3D count < ss->read.size - offset ? count :
>  		ss->read.size - offset;
> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> +	memcpy(buffer, ss->read.buffer +
> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> =20
>  	mutex_unlock(&coredump->lock);
> =20
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> +
>  	return byte_copied;
>  }
> =20
> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struc=
t work_struct *work)
>  	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>  	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> =20
> -	xe_pm_runtime_put(xe);
> +	ss->read.chunk_position =3D 0;
> =20
>  	/* Calculate devcoredump size */
> -	ss->read.size =3D __xe_devcoredump_read(NULL, INT_MAX, coredump);
> -
> -	ss->read.buffer =3D kvmalloc(ss->read.size, GFP_USER);
> -	if (!ss->read.buffer)
> -		return;
> +	ss->read.size =3D __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> +
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> +		ss->read.buffer =3D kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> +					   GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      0, coredump);
> +	} else {
> +		ss->read.buffer =3D kvmalloc(ss->read.size, GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> +				      coredump);
> +		xe_devcoredump_snapshot_free(ss);
> +	}
> =20
> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> -	xe_devcoredump_snapshot_free(ss);
> +put_pm:
> +	xe_pm_runtime_put(xe);
>  }
> =20
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, con=
st char *prefix, char suffi
>  	if (offset & 3)
>  		drm_printf(p, "Offset not word aligned: %zu", offset);
> =20
> -	line_buff =3D kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> +	line_buff =3D kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>  	if (!line_buff) {
>  		drm_printf(p, "Failed to allocate line buffer\n");
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/=
xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..a174385a6d83 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>  	struct {
>  		/** @read.size: size of devcoredump in human readable format */
>  		ssize_t size;
> +		/** @read.chunk_position: position of devcoredump chunk */
> +		ssize_t chunk_position;
>  		/** @read.buffer: buffer of devcoredump in human readable format */
>  		char *buffer;
>  	} read;
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe=
_guc_hwconfig.c
> index af2c817d552c..21403a250834 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u3=
2 attribute, u32 *val)
>  	if (num_dw =3D=3D 0)
>  		return -EINVAL;
> =20
> -	hwconfig =3D kzalloc(size, GFP_KERNEL);
> +	hwconfig =3D kzalloc(size, GFP_ATOMIC);
>  	if (!hwconfig)
>  		return -ENOMEM;
> =20
> --=20
> 2.34.1
>=20
>=20

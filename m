Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645796C588
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111E810E81F;
	Wed,  4 Sep 2024 17:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpI0ibQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1CE10E81F;
 Wed,  4 Sep 2024 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725471422; x=1757007422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jOwtg2xIkNlYwtDLrrmV04Ue8R6zv51rI6KXe8QINS8=;
 b=gpI0ibQSjfI0wHnhOzuuZUeTSdMzGfONZIS3lVB1SQX8l6NCp0AVZfEN
 Pxko0P+oIm4ytfruPHWIs/pGmd2pkw8Z8LButnj2qQeQrfN6mL/IXZYPb
 xlqQdVpOGv6e7j1HDS3sSjn2nYt7UicoIxEaw1NgdOxfWgcc5deBOm+z6
 0B9++wTlpUURND1u4SaWmoZQWiZcILnafDEITRK5v/dnzwdhAweEIgM0H
 t7q6I0fWPXkFGuMnDgH24zpE8h6zPWNQwM9XaeOTQGxHKcypnUYNgbTFk
 8ei0/mqOkLToprao4XUENN1Qn6VZy43SqXY6JMhUCoLxlsqItt/7TinPW g==;
X-CSE-ConnectionGUID: UQxLyL1HRiC7w1hXPstw7g==
X-CSE-MsgGUID: MKTrZjTPTwmizY45vO3gPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23953162"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="23953162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:37:00 -0700
X-CSE-ConnectionGUID: vXanCpOpT0OmrvPNGUwweQ==
X-CSE-MsgGUID: Z8hGcsZ1QquhakCkq7fjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="64990431"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 10:37:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:36:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 10:36:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 10:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRMZSTgZfSCSfne2c/CMrcCU4DTtR8k1M0fYL0yt3AFmY3ov60bKOiViASmP2FyIvVlJyhsj4bXIdsVfsj75w+5wqVgSJXXNj+aGhQ3NIPWJYH2YhlGNup6voR0if1bqXJkHQLJNaaB/cOnI/vYHHSP280AVlA9jd+l0++J9ijt+sAYigVJBjlliavPtn7w6BL0XyxALKIQCXasNgcwGrc5oJ7iz7x9UPQGpUyXswkqdhMPFNWhcADs1159qcA6DwsdgHkb8MP0qX9LmcWg5oEz55BhyBtsWffG/BKFKFx60eaI9AvPDkp2B76p9HkBbCN3dDsT5HdDfJvdulU6cSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4B2Yiz1UOf+HEnCBgWkQaMFEWvnqSztWRxBhb9t4JQw=;
 b=EDQNDCnTZOOfDWanAUVoLFOYSweqT4h3PsKfwXnhkAtRgOIEtoftG2KTLoMaFCzxE4++A4WeU/JQR3P4sOElKjnHwZeq/BN4wh404LWRKHUxhSgYTVTFYUR5RGv7tGM5NFnTDruEgSmpvarthTGWknX7GGiw+bqZUHt9t4Y73MZ+U3IN71p2RweHxJ0LPT9n2eMSSazmL+3SnIJSCjaChNkzOES7n+316i9Sj2tmG9HuWwQJGg7Af2rzW28p7G2PS5ZcNbLmr0vgr6txIFvbwR9V9OiLrAg+du6/bHdjzinyNtjY7adq86lJdSoe5eas+q1dD8jtHdLV82wn7MAAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7778.namprd11.prod.outlook.com (2603:10b6:930:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 17:36:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:36:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>, "Landwerlin, 
 Lionel G" <lionel.g.landwerlin@intel.com>, "Graunke, Kenneth W"
 <kenneth.w.graunke@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
Thread-Topic: [PATCH 1/2] drm/xe: Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
Thread-Index: AQHa/uybSnNBoP5WyUSLGnmS7wtOwbJH487w
Date: Wed, 4 Sep 2024 17:36:53 +0000
Message-ID: <CH0PR11MB54442B999B12FC28140BC6C8E59C2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240904170500.3303081-1-matthew.brost@intel.com>
 <20240904170500.3303081-2-matthew.brost@intel.com>
In-Reply-To: <20240904170500.3303081-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7778:EE_
x-ms-office365-filtering-correlation-id: f507a2cc-b57d-4217-20a4-08dccd082a34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FYiuNnJtkQp9aNTYZfh2IltYkLvRz4xAlhswwR8vYYbpIb3v9Rm3BuDREJEn?=
 =?us-ascii?Q?P1oxCFpM0M2EcPcKZTpWxyRl7AUgvCN7HxZeMPBSIH4iUFg5vJF8bAWakpxe?=
 =?us-ascii?Q?suwXWtmnOfyzUXZweneAWj3n9SEL2QuavYX3f0KnSgsMtnafyoftYOhaLse/?=
 =?us-ascii?Q?0XT6koMpcHM0x/Lad9uVB5RT5Y+gyypqO9hE+z3nuq/yR36HHcbsotddS8Pb?=
 =?us-ascii?Q?xHcSFV2/VzqUcEtg3yaz4hvrJyK3feS1PEk5hDSp7z/OO2p9gCKDFJ3w47ZD?=
 =?us-ascii?Q?ctav7zS5UjYFQejyg1knLSKgsIoaMtjqMn2EKXxaFosM2YiIAYNrXhG8VSAA?=
 =?us-ascii?Q?ZZkY57+FyNRxGtokrjPxIckJLtLmgCsYkWlarg65pdwT5JGT8UffDWUtWYTA?=
 =?us-ascii?Q?HOEluudRcW+b7q0lIbnfcl+nqNv21RWofmL+frqLlfKz6nEBkUDKpKbGfvr2?=
 =?us-ascii?Q?tes4bK05AoIDTZK9dpQWbIZIcKod7YZIAIPLQ1gjq2mF/mKhA02XB5n9iHEj?=
 =?us-ascii?Q?KxGTE8TuAL6J4ATgV+YWxaFZVenqeemEvVkraCxSVwMb842jGvLOT+n920hV?=
 =?us-ascii?Q?ulQQ+X0hVno/riss3kU7/Iwm6/Ih9af4ll6CqjN6w067SO/4ZEIJY55zLkMS?=
 =?us-ascii?Q?X9H+bbGTAE0hUnfTTDRWeiEF6Hm8ywZZmrmZa/hihVmJpVH4AktICQ8Kx5TI?=
 =?us-ascii?Q?A67qpu03++WdgQQvZ1K1SEism0EEnxvPDRCilxPR0pCRZJVEijp5HUVHxzo5?=
 =?us-ascii?Q?lyhunpxcrRkqggDkmDsT2rL7N7dc3AiSdePQGhE5splW+BzXNgevHHX5Dctv?=
 =?us-ascii?Q?uP9L4ZgogaIPxfUpOdFodPv574lfKK7AEkGf7T5ejDgfaNN5orBYJSAl9iLz?=
 =?us-ascii?Q?F8JleskcURKRyMe138rUvS4Xw8oL5dKxXj/Nixn9tZn5lH4fYsdZnbJm/Vri?=
 =?us-ascii?Q?5eIfFBqI/wcpDpVH7UP9UfLQHccr2R1aKxa5bYUmgyrAFF6SeDjsnpPKkJk9?=
 =?us-ascii?Q?mdks7dNMvSUihxtKextthEiT2VT0Pry9/g15XxdQAE/wPm1o5kIK4m85yX7K?=
 =?us-ascii?Q?CtHvgvB+PGBj9eFIQJ+B71/OEma3e2NiVu+yxF6seIU/0DluGLLBI4M1Q3w9?=
 =?us-ascii?Q?dT2BPw43OuO6q6tzR1TIyqYJAv499QaGXQRC2HmFJD636FUIbO8A7Yh9+Xpr?=
 =?us-ascii?Q?0I+3IDKaFyJ7RsY5uM3/JwD6E2n4Ee1zdxYJAkjemBi3KwNF5O5puK9Zhb2J?=
 =?us-ascii?Q?4AzOFC1kzgJTUXyhTOQ8i0wr/wJgCgI+I3MOFPoIAKpWCkc5wPC+rO2kfV3h?=
 =?us-ascii?Q?qiTyL6yopwOhQf/coY3r0pQOJh65stBggDP2cN3agHZOBVtk2Y1S9MNuoRv4?=
 =?us-ascii?Q?D3kgOBVtHlrSdp/EEOJwb8V8dsj9f9dSnNydS7j/2yKcbegt0g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GYn8KirZuDgyJn1ep6LQDF1i38T8nFnZeJ9YdpMecRPg6cILC+yyuWoRWi1c?=
 =?us-ascii?Q?27J10BlGNBrW9jtqcWAJPeTSRae88B5GRUMck9zCdIVMZ3xXr9bj2AZRyl5i?=
 =?us-ascii?Q?c3r3lK5wRQHe5aolUp2G58P/XRWVIQ5oxs7+qDP5o+gdYt0lVsh+4Sk4xMsB?=
 =?us-ascii?Q?VvRivhVsl5Uqjy7riFPR65dWT9CgiYu/0pZ76eV/XXlC+LIMopm42clt+Kvm?=
 =?us-ascii?Q?TlMyS4dJuPxid/jW0W2MHgjm/dNt1JjCOnwWYZ+LMOTylu8W9Rkae2xhPlKj?=
 =?us-ascii?Q?2kldprKTxv4bP7c66vOb/IhXYei/T3MD3td6ZzMBwLhlpMDFF2h5bHYO8iyf?=
 =?us-ascii?Q?bnTkeTXGCOiGSZXWjLCPSol8afSf80ib+eStO/OV+6B6sCqYNlz4y74IFTKn?=
 =?us-ascii?Q?qR455PAQQFi9k2GVXEPx7m5DhzJ8tWeP0Rfeq7oFeIeq+x+Au3/On1hRB2ci?=
 =?us-ascii?Q?SAPYvbQ1aQulqNUD/ndYvmH+DiLfJZZFiu0yb5LQ7IMBtQBM2FLoK8n+raG4?=
 =?us-ascii?Q?1WW85PJdLX8itfe72CCcI00nRehGRSfNT7SdwFHkod5KaFFoDqV3ZhgmzaKX?=
 =?us-ascii?Q?dsMRpDyTkbvXdf0e92VdpL3KJ3K8QHkHd6kef1LjXnWHSNAUYjkBYpTeryXw?=
 =?us-ascii?Q?9pVxvvp00vLRx/9aYNjuDgh7tdfGUg5mhrVaCw1pgBxM8m2OF821dEoaUCQ/?=
 =?us-ascii?Q?mFhRDgIRTHsDBr4AY/3AiimZlCOuGMy1WpAgAVqab5adHIgTaJSSp3Rtggz9?=
 =?us-ascii?Q?jjYpDbuoeQQ2lbTRwnxMt0lY6QNEeRoyT2ITO0aOKcYnTLmAM+sYsZnX/mJQ?=
 =?us-ascii?Q?q3iDkx2cpXvQ6Kl6RUsxUwIfnWbnUqjpkDN2pn2JQiwDptFc1YLl0wfGJTOy?=
 =?us-ascii?Q?LAv4lQJk8gOdYaYIQbo3aj4ehb2Ji/yOViUb1ED66G3ncwR/KRsRWdaMajoe?=
 =?us-ascii?Q?x9eQDNPQ8OfhmymT5cDAbDivPYvAslubFnmpYKAxsXns0tsvirzGryqN3QKA?=
 =?us-ascii?Q?zAUOI9x++7S8ey5tEH6n0o0CNW8LKyGLZ2wn96T6aDf5/o0nZTgJmS8lAkx2?=
 =?us-ascii?Q?8tMukogjuc74nfAxUxmsOUO5ZBK8LKf2tO2q9TmRN2O1o7397BuM96XvBF1w?=
 =?us-ascii?Q?jI7v4yPgKdX2oqqy1WGQ/e/jNtGNH1uICWt8hM/8/q+//jeoF1rN442sLCTe?=
 =?us-ascii?Q?6Ro3AWv/y6GI5WaBrDVTuZFQ/2F6uP8uRKmHUAhbKFOgv7B/inwyAz8p7oyk?=
 =?us-ascii?Q?D0gybhUHSIoHPqJ4edpp3i2XBRbENCmhy2qEMFZann8AKBYjZC/dge05SzR9?=
 =?us-ascii?Q?boRNvGGQ0OOzdDV9VwnxvQGZ1WqFJZE40nP/9/D7pGKAbcGwVpvTHN5VHJFl?=
 =?us-ascii?Q?PF0qjbKIwBUTSiVkOVmPBJ9d/Klzy8Vzn69NnyhuVWyiduuYa7q8T0W4giyE?=
 =?us-ascii?Q?1SwSbs/iFvRLtNnsoOyCiAhNZc7Podbu8Ew+lk6gj4du2WZqFLJLI/nGGuIf?=
 =?us-ascii?Q?5vHE+SqocSzJj5fzqRT8ua/W27z/ngN2L7s9eg/FCj3ki8yQLNI0M7HYe5wl?=
 =?us-ascii?Q?uXMbn2QArthmOUsplxpHk2i8yRmWZ/A4/oN5AGc3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f507a2cc-b57d-4217-20a4-08dccd082a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 17:36:53.1024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIV+ux8h3A0uMP1ZyR7capBqlxPMroqXo+X1ET2CGyoFsULe+jaz3IUWDvScrjbO/hHYxTUTJ5H8JeuHXWWQRiiqDmnnZ891CROOBEYb2Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7778
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
Sent: Wednesday, September 4, 2024 10:05 AM
To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch; boris.brezillon@collabora.com; Landwerlin, Lion=
el G <lionel.g.landwerlin@intel.com>; Graunke, Kenneth W <kenneth.w.graunke=
@intel.com>
Subject: [PATCH 1/2] drm/xe: Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
>=20
> Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP which will install exec IOCTL
> fence into external BO's dma-resv bookkeep slot rather than write slot.
> A bit of confusion of the usage of the dma-buf sync uAPI lead to using
> the write slot. With a proper user space the bookkeep slot is
> sufficient as user space will install read / write dependencies. Flags
> is added to not break old user spaces.
>=20
> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM, though there may be an argument to be made that this should
be squashed with the next patch in this series.  I won't be making that
argument, however.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  include/uapi/drm/xe_drm.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..54ec1cbce895 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -849,6 +849,11 @@ struct drm_xe_gem_mmap_offset {
>   *    demand when accessed, and also allows per-VM overcommit of memory.
>   *    The xe driver internally uses recoverable pagefaults to implement
>   *    this.
> + *  - %DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP - Insert exec IOCTL fences =
into
> + *    external BO's bookkeep slots rather than write slots. A bit of con=
fusion
> + *    the dma-buf sync uAPI lead using the write slots but with a proper=
 user
> + *    space implementation only bookkeep is required as user space will =
install
> + *    read / write dependecies. Flag added as an opt in to correct usage=
 model.
>   */
>  struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -857,6 +862,7 @@ struct drm_xe_vm_create {
>  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP	(1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
> =20
> --=20
> 2.34.1
>=20
>=20

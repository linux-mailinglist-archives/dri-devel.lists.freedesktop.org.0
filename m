Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7B9D7D38
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 09:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2AA10E5E0;
	Mon, 25 Nov 2024 08:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUq6awDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795D110E3A8;
 Mon, 25 Nov 2024 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732524358; x=1764060358;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CXo2Pq6FpW2W5Ejq6NEcmjKMSS1AM9fWzzjxlBt4ce4=;
 b=NUq6awDmqjO/9yb4TrE8ISYr5nyugnIsNNt+GRacETUgZ8vGpbFeRgJH
 w2wpPelVuR1az1KpeLlNNYgsRSi0EluYtnrdryHhit6qFItmwSS/EV/PO
 LuqsetkbrtwTWWht+IvgsA29igYP8Ll/EwV0ladayU9Tqz2fSRFCUUoaU
 piCclGpijd1blCjrFQdFfCSQg6TksnroxhJmSlXoCmQHqXIghQc0OTPGi
 DkVeA2dhX4QC/FzJyKRBMaSFb73RDHxRPza8++Ag52v6ratEqtVj/gmy3
 WAgNMHh55tacblOsMAu4MUSN7PQCX8jFzfyWkj0YIHs2yoZIR5LGxabF5 g==;
X-CSE-ConnectionGUID: QSKwkidcSKyGRYatKrUi7A==
X-CSE-MsgGUID: /NQbNb0yT7WlxtEXWXBX+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32669129"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="32669129"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:45:57 -0800
X-CSE-ConnectionGUID: wfU+xYVOTcuvqd1VwVEIUA==
X-CSE-MsgGUID: a5t7m6XNSVKtoA3+BW4alQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91611938"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 00:45:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 00:45:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 00:45:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 00:45:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqWi9cZ2aTEiejF8U9CUObuVYliuZDckfLhCk3dGf9hq9PNE6B2GVGz61yeYMebxiIx38pzMJDW4IfSTwMKIme3KUQPpVK9wgX7h/jV7k3anDFk6Oz9P1U3kBWu3nMP8J0l/DRyi2PhFfVsyCLeF5uV/mQrH80h53g/LbaDrq14euNAbUsxZcBukkN1BEqyex6tgTQEKKszYzQy+VlXZ/l6F3PFB7Ejf95GHAC/LlxjqhzDH0BbM6LeNPqCwDkSrbHSlCsPuCAxo2/L//QRICGe74ieYgKE3gNvk+6NB172YzOboClPFTxtDKU1l7EpGIlpp06aHSMb7D0V6ZQELBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysyPWJkL7Zfn9YAbVG1rOtusHuOKikrYT26o7FmDO5E=;
 b=mC9J7VI9v+bFt6fV/vx4hUUFzg/2iAPoMgoAG4zT+sjejJNbFBb6N5DqVuj4W0hZvqRG0WgbqFkE0fsYBweK0x8rtNlUz7hbab6q7m1BdFyZhY1efgPR0dfCFgIdlpIMQcOYbns4T0lO7svw2YKVF+E5724kU/rWx314/826iW9tgBK0oIZ8g2EorSxDkXn3XPwS4BXwHJ6Rfmc1ygZ9ifk0nwDFH20AOW+DfUWJlko8B3Z453zhC1St7EWLofO8cbaLEBBzRKqVR+sbXcmqEK6DtBN7XZKqMIuxtkfmX7cMn9LqQjMNAPgyEwuo3o4xnaFUOpGLTDftGBKgRDbwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 08:45:53 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Mon, 25 Nov 2024
 08:45:53 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv2 2/3] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCHv2 2/3] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbOZBYgsjyDCMLvEGqPvWiVvX5P7LDwNWAgAPu10A=
Date: Mon, 25 Nov 2024 08:45:53 +0000
Message-ID: <IA0PR11MB7307E97C627599FB153BFE84BA2E2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241118075315.466009-1-arun.r.murthy@intel.com>
 <20241118075315.466009-3-arun.r.murthy@intel.com>
 <Z0DkNcS-qLgoArml@intel.com>
In-Reply-To: <Z0DkNcS-qLgoArml@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH7PR11MB7450:EE_
x-ms-office365-filtering-correlation-id: cc7437d7-534e-4a28-273f-08dd0d2d9209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?U/JkLB0avFmfrTlDX+HVQyYaKEd0FBIICtz4y9zBpXQELBwNISHsh7xoVA?=
 =?iso-8859-1?Q?mHvBndX7ZZG4x6Tces5mAY9fTWxIPAAw6ZaDimfi40u8kx74zvzwz3wp/x?=
 =?iso-8859-1?Q?muN+r8YdTEAfp+kZGs07PW/xPi3jdMFOEwgMao84xDp4m8BEoMK9y4HFPF?=
 =?iso-8859-1?Q?UmC8s9i5CiSrOdkdVFxiR03ULygNZIYbBa/vbYE1vJkM/OlX3Vu2NPUb2F?=
 =?iso-8859-1?Q?K4py2gNq6gAjxkpzGQN3JfJeJMXERear+zskt8F2mGgN4J3s0dTtVRGtQQ?=
 =?iso-8859-1?Q?3z9sbHvKM2DZCBhY8UDUdqLZ9ElTZ3/G64qlc1tVG6P2PNLXEny/eqlBU8?=
 =?iso-8859-1?Q?4/gFaJHx8F7NisK6d+1I4Pcjlq+/oGQAjg0kO4xPg8w5ysO8d/EjnGyln0?=
 =?iso-8859-1?Q?L6OXYxGx1+Iats3WoLmPnJKes8P20IFnqmbpwLKVh9PW2btDC7BoJ4vMNL?=
 =?iso-8859-1?Q?5SXUvEyU5ABp2fiTNIUyDCPwZTYfDgo/SU3nUSIA4u4aPN8SKh5Wq/v8tS?=
 =?iso-8859-1?Q?uA6vccUVPazoy3SY9dAz67eBMfXZGyWUftdEmWEpgMNmKy+JkxovNxZ9A8?=
 =?iso-8859-1?Q?QPj1BS2QX3Dxro1Ddr+HFh48IAjyWAvx8vFsJOSYjQ2rrbuLnO/0SQ+i5k?=
 =?iso-8859-1?Q?4CgKkr8m0dWqIooPTZQgCGjiF+c+WOJQAIacLF6HoLNPoZGmAclVjrxxyR?=
 =?iso-8859-1?Q?cj4W2JbVpOjpGuL1WfTV5VO4zUs0eSXXvC7uiYIMm7X2xIzfvRVMLE6nfW?=
 =?iso-8859-1?Q?lHcZUBZuAV5FFeOGLBqZ+62bFbsm5znkV0qStAQ1MisYcZNPAYT60RiYM8?=
 =?iso-8859-1?Q?xeEcqJd7J5DKDjljZxy5ugomD5a0E0NcnJu3aTLgOZmiw5ulCXxbqe1zBP?=
 =?iso-8859-1?Q?Nf5V4OVW9jY11SSQRJViHmAaUZJSRxSHdhTfjaYKqnb+DayF5/vamJsHM2?=
 =?iso-8859-1?Q?U0CIqDWEdbulhH707qKpxUQ+hrQTmEHEQDj5uEMuFCrfttOYFlZuvjUg8k?=
 =?iso-8859-1?Q?GOBlSLzLibFEbQMl3q3WfrtPYYXF8KQ0yTkQOEg8Zl4DuaOCNJPzG07OAs?=
 =?iso-8859-1?Q?0s8jg7Au3G7vecOo5hitGoU86xtItXVRraR3h84XQFuG8LYbJF6EvT3QsE?=
 =?iso-8859-1?Q?YvdfVQoGwgYFJVfcSBe4vxWr5TqsSaey1fqvF7AfMkU5F6VxvgxHOm/ffG?=
 =?iso-8859-1?Q?L7pNY7h1uGmzRMYui43+pgbutrH8Prv6M5TYP319IHx7ur4Q98hbzdc/Lz?=
 =?iso-8859-1?Q?y6ucpBgJf0+bGDUie96nJLS+S3DgLpBemt4HaJO7s591Rr0Cg8uIX0AsD9?=
 =?iso-8859-1?Q?gC4diUP/VZ+HO9NoRulOsG4YiUhk1dtrSp6aZvqFxFIP92krhKVvEwOKhf?=
 =?iso-8859-1?Q?lnxtNfCXLi5dQtg/Icl9NuLxpc3K2cFtbol4v36Y+8fd87o/Gccgs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6fPqyy/x+wadnjOA+ITwybJyDiIQ0J+016bejPrYK3nlap3zTkUTqqRbJl?=
 =?iso-8859-1?Q?PVK+E/qUgYpDxD1p1+vGLnVGpikhDhQ2aWEfOLJK8RJujx/2nm6RWmuizy?=
 =?iso-8859-1?Q?APRRYP8QSjcgmlT26L3QZ91i73ktyrv5e7PhUk4YB3z1jTaic0y2LwdzIo?=
 =?iso-8859-1?Q?a719P7ruLLPEaIg6Ntc0445FvpcYLKiDEPKO7HBQTStjcMCzYCY/9+10yX?=
 =?iso-8859-1?Q?ebkc2uq4SIYxain6DiOpeSsaDcVXiQmpAzpLpt5ON0bqrkgAgf+e/pJl+k?=
 =?iso-8859-1?Q?fGDbN3iWOws/iu7FNRSrjCFzqY7Oz1ejt2oG26Gmnql28li59hx/ZvYY/o?=
 =?iso-8859-1?Q?p8OlFhPsNXDiqoREMddcmCLHAKQxcPHdU/4X9k2SIi4mEIu9KocV/ByQxD?=
 =?iso-8859-1?Q?eg7onXEAw2UQshmIkbaRaMuaJsgJK9XEYAP4y3umMF5frw2x0nPZPVjI+I?=
 =?iso-8859-1?Q?yayn8sCwTQ9mGiEGdtSLsKUEAy9AYtCZE5M5KHTarvdgi2qFEmwEoFBT7E?=
 =?iso-8859-1?Q?I2ypek4haqu3z+bjpwfkJ8AIIPKiEzbz6aUoS3lts2M4K4XpHRYgwYrto/?=
 =?iso-8859-1?Q?XF8YWrJvjr9Ujgo6bfRWHDWes7dbr0x/196ldbjFidepuJmGvqKhKuaelK?=
 =?iso-8859-1?Q?NABT4UPW8sp3DoYmU3nT/MrD2ERp6rSjugexbM76xElde6x3GNDInxoDzh?=
 =?iso-8859-1?Q?Asqmr2dllhbjmSBegkpDq7LEaW/J7A0lnUZXALTPResEWBG1vCa7tRUyfe?=
 =?iso-8859-1?Q?hDW7FuKZ1FXfYtGszNwm3MNXRheXk8SmnikSH4ljKuqdKTIco4s5PJriG0?=
 =?iso-8859-1?Q?ilVhLg9dJdOZVUUKxjH22n+0I5aZhkAw5LK7H7lObk/qZ768b1SeJ+0d/t?=
 =?iso-8859-1?Q?wG0VyJmhM2fPx9LqYu7U284m9Ch1PCsal0MDP8gB/nV8bNxHZCIQEscIXh?=
 =?iso-8859-1?Q?q8iTVGI45M5bzWXgHCqOZzj0eReZZz0j6qX0Grkv+QWIaRSP2x1z3eHC0o?=
 =?iso-8859-1?Q?BjoJ9DPTUz4Dsgdp6pOIBuC6J7wj2zb3CNTXbkaEbV0i7woXg5xmQEveJ+?=
 =?iso-8859-1?Q?iph7m8RFZC0cnwfNlQon4IaWh5oRpKCCkOGVuqwbxkpK0ClO8XemrAmZp9?=
 =?iso-8859-1?Q?3txS8r4v43tpPEO3zGMfRqUhDnCSHJ2opMdShyIKQHqN8bEKTA0vTpZPJy?=
 =?iso-8859-1?Q?ATBAmgqvPnUttNjpSnZQ4oM+41V4trHlo0NOFJKV9HQ8I7i16ztHVdVPqW?=
 =?iso-8859-1?Q?iR8gmn0eBRFxCs3C9q+nR4/O7gwIRXmuCIPXfnm20mlXb6pEw2nZ1NhAug?=
 =?iso-8859-1?Q?75deYC+Bex/BwBuSLxXJ53NCjg9QsSnwpmWbn4ySN/G5bncEu3Wcnn36nL?=
 =?iso-8859-1?Q?rRhmnpy0SQZmWQuCicSaaYiQPPLP/YPrw+3oOCSokncox6WGQJdWNek4tH?=
 =?iso-8859-1?Q?YrMdoZZOOy30STzk9WZUhyozehbYFuLX2G1bC+JEgGdCHJHwgNWphWNrF/?=
 =?iso-8859-1?Q?MiVBJFln+aJX5T10EH7zqfGLWH+8+BbN5lJzJF8npkd3MpoVq0APCBn0e+?=
 =?iso-8859-1?Q?9gXj0/uLoJqxr+eKLBHgOMOpxcgY5K5L8lNm+0c7a1LynVhqcOoNsiRtGV?=
 =?iso-8859-1?Q?riGH2v1R75XMJz2iW0+sO9VS9sOHZPDcG2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7437d7-534e-4a28-273f-08dd0d2d9209
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 08:45:53.1157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V41FS69dLA2Y7ONffyYlgq0MF68L7D4fyQCDSHUM1KkHvqEFNIxadp3Qt+kIi6bBO9a+JZqK4g/lTM46BAwnuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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

> On Mon, Nov 18, 2024 at 01:23:14PM +0530, Arun R Murthy wrote:
> > Expose drm plane function to create formats/modifiers blob. This
> > function can be used to expose list of supported formats/modifiers for
> > sync/async flips.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/drm_plane.c | 44 ++++++++++++++++++++++++-------------
> >  include/drm/drm_plane.h     |  4 ++++
> >  2 files changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index 416818e54ccf..4f35eec2b777 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -191,7 +191,10 @@ modifiers_ptr(struct drm_format_modifier_blob
> *blob)
> >  	return (struct drm_format_modifier *)(((char *)blob) +
> > blob->modifiers_offset);  }
> >
> > -static int create_in_format_blob(struct drm_device *dev, struct
> > drm_plane *plane)
> > +int drm_plane_create_format_blob(struct drm_device *dev,
> > +				 struct drm_plane *plane, u64 *modifiers,
> > +				 unsigned int modifier_count, u32 *formats,
> > +				 unsigned int format_count, bool is_async)
> >  {
> >  	const struct drm_mode_config *config =3D &dev->mode_config;
> >  	struct drm_property_blob *blob;
> > @@ -200,14 +203,14 @@ static int create_in_format_blob(struct drm_devic=
e
> *dev, struct drm_plane *plane
> >  	struct drm_format_modifier_blob *blob_data;
> >  	unsigned int i, j;
> >
> > -	formats_size =3D sizeof(__u32) * plane->format_count;
> > +	formats_size =3D sizeof(__u32) * format_count;
> >  	if (WARN_ON(!formats_size)) {
> >  		/* 0 formats are never expected */
> >  		return 0;
> >  	}
> >
> >  	modifiers_size =3D
> > -		sizeof(struct drm_format_modifier) * plane->modifier_count;
> > +		sizeof(struct drm_format_modifier) * modifier_count;
> >
> >  	blob_size =3D sizeof(struct drm_format_modifier_blob);
> >  	/* Modifiers offset is a pointer to a struct with a 64 bit field so
> > it @@ -223,37 +226,45 @@ static int create_in_format_blob(struct
> > drm_device *dev, struct drm_plane *plane
> >
> >  	blob_data =3D blob->data;
> >  	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > -	blob_data->count_formats =3D plane->format_count;
> > +	blob_data->count_formats =3D format_count;
> >  	blob_data->formats_offset =3D sizeof(struct drm_format_modifier_blob)=
;
> > -	blob_data->count_modifiers =3D plane->modifier_count;
> > +	blob_data->count_modifiers =3D modifier_count;
> >
> >  	blob_data->modifiers_offset =3D
> >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> >
> > -	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
> > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> >
> >  	mod =3D modifiers_ptr(blob_data);
> > -	for (i =3D 0; i < plane->modifier_count; i++) {
> > -		for (j =3D 0; j < plane->format_count; j++) {
> > -			if (!plane->funcs->format_mod_supported ||
> > +	for (i =3D 0; i < modifier_count; i++) {
> > +		for (j =3D 0; j < format_count; j++) {
> > +			if (is_async ||
>=20
> I asked for a format_mod_supported_async(). This is not that.
>=20
In the previous version I had this format_mod_supported(), a similar implem=
entation as in create_in_formats_blob().
Create_in_formats_async_blob() was added but the same function pointer was =
maintained i.e format_mod_supported.
The intention was in the function defined by vendor specific driver for for=
mat_mod_supported() the format and modifier to be checked for async would b=
e sent.
The flag async_flip in drm_crtc_state would be used in the driver to check =
these format/modifier for async.
I can add something like this
Static bool skl_plane_format_mod_supported(drm_plane, format, modifier)
{
	If (crtc_state->async_flip) {
		Plane->can_async_flip()    /* https://patchwork.freedesktop.org/patch/619=
047/?series=3D139807&rev=3D3  */
		Return;
	}
	/* continue with the code for sync format-modifier supported check */
}

But the comment was to overcome changes in drm and handle in i915. Hence cr=
eate_in_format_async_blob() in drm_crtc.c was removed in this version.
Please let me know on this, I can add this create_in_format_async_blob() ba=
ck in the next series along with the above said changes for can_async_flip(=
)

Thanks and Regards,
Arun R Murthy
---------------------

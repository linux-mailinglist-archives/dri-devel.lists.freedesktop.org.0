Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9DFA6EDD9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 11:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ECF10E2E6;
	Tue, 25 Mar 2025 10:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJvlCwuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD2F10E272;
 Tue, 25 Mar 2025 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742899017; x=1774435017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=dVCL3wtBUuVwefBZhCDr276cxMVW9IDF/6hKIQc6JlM=;
 b=lJvlCwuWB1KMMG79hVX9rXtivj1XSCcl8/nU2a/5gDtHm+fiR/VSXUbF
 NvGZU5wx5nmihzp90hmqEvDaPI/gms/zYtWRihPVlCczDFcXUcMVF0Uyi
 h9A46PWIhYm9lIOfB1lfozua5CIxmxjUtHcD/KkVodeT07FnIJbWauaq+
 6RlbbtQzKNeuCf1FgwfN+EQeJEL+HBb3UZvl4OkD32l7rO10o1fYIlOMu
 S2BK8SgayKNNeTYTLW963NF5u7BJ9XcecuCKklWiXNM5Q0Uywyyp+VSqs
 oyY/rp4CoZi8NXpHcCpynFwkusfGm1J1ePCiKKn/iRIHWi2FxMYUInhTz g==;
X-CSE-ConnectionGUID: JwS89DQqSH+T6PWMhNGiyQ==
X-CSE-MsgGUID: hLRGqKu/TTWx/5ZSm5hRRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44243213"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208,217";a="44243213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:36:48 -0700
X-CSE-ConnectionGUID: Q/EFTsKnTU+1nFnYjnlcmw==
X-CSE-MsgGUID: zW86Xn3IRX+o5DLWDWaOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
 d="scan'208,217";a="124312751"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 03:36:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 03:36:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 03:36:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 03:36:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slUnsZItXFCvF8qCu4nivfErLlKtYUIB/mmfBMlFsFIlArx2TpoYpKYwwA3cOCaH4xT53ohOdm2ieOVnopk3DG6dWCEMFaQOUGlY2QpkBesfo4dxMm4Y3Z81wV2IesKDwqprLnbjdbypwVN0fWzhvCOryku30uVHCQW0ns9oCCs9Xq5axh0YU+N64AFKqYyUOMwgcmX74p3uz/oXnid/Gz8ArO6/Ablc1lQP5zefRJ98rq+6Iy4NCz2g6rrcQ+yhXzhdtowtskrgJ+gKiNEdGkim3HOt7CLTElOY+WFrhPJK/aktXiXvrmYQJgHkNMwAL5QP29Fbh8OzBu41j2V5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+aqpqBCFkXRyQ3tlsZI0sJEcv/qgmL62vQE5noKDQ0=;
 b=dI+wq4PcNpldpNrZWTQcTepyS/1cTdVzFyFYepQ9pQZrVGgO41Z4knHlBSEf+VSHycHNNtvp3EaEzIoJ01hvw9SeECdOaAUI3y5lBAnzIM8LXYdTl2ptBh7aw2CxPVSU03xabsn2mDMtTxSrm++9mj4K67ZS+kJSHMHVCUzXbFv+DMN8iX066NwZkYa1dHHuPmlRmNAGtzRpKuYy1eAGHhQSccZMCffKxVabDWFg18GkYJ5RqHONaQgL7VuRb0aoC0b2cgpMydVs8gh9GI6KqEEDDDN3Sw1TbcsvrHf13hnpDS4vBOjon27ulh57seeR0mnQpqcPQ/rOW5LYiq1yVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 by CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 10:36:17 +0000
Received: from SJ0PR11MB5070.namprd11.prod.outlook.com
 ([fe80::2698:e0e9:162a:a498]) by SJ0PR11MB5070.namprd11.prod.outlook.com
 ([fe80::2698:e0e9:162a:a498%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 10:36:17 +0000
From: "Mehmood, Arshad" <arshad.mehmood@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH v4 00/15] CCS static load balance
Thread-Topic: [PATCH v4 00/15] CCS static load balance
Thread-Index: AQHbnMDyRmk5dK9LQEW71zVvhG1RdbODpsxW
Date: Tue, 25 Mar 2025 10:36:17 +0000
Message-ID: <SJ0PR11MB50701535D5CD3A2ABE94280185A72@SJ0PR11MB5070.namprd11.prod.outlook.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5070:EE_|CH3PR11MB7865:EE_
x-ms-office365-filtering-correlation-id: e0804a71-2266-485a-378d-08dd6b88dfdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|8096899003|13003099007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?vJ+PBNBPtyUby8fvLTlnRB5z0W+okYxp9ajnwTlHXWu4R7D6/o++WOjsFy?=
 =?iso-8859-1?Q?yfSssxfnIGAOIXyh7Ibd2N4OFoTMhlQMLvQpfh7pCdKp3sY+QwJAg05I6b?=
 =?iso-8859-1?Q?R/Ha9epZfsGmyZx8HShnM9pnPdPaMa1ouEY1WBgRMHL6EWDVyH4K4t0JZK?=
 =?iso-8859-1?Q?SeaQnUYKKTKiHPheN5l/jsRC4cC5isCmRjlvZKX3U+ncvDrOrlXifbt3DD?=
 =?iso-8859-1?Q?iRTvCzoaTgY5GgNyU/KGy6rKtOgdwMAk7oB+Yr2AmfCQpURG/SD3oJ+HLL?=
 =?iso-8859-1?Q?qDG5auwdYc0gVlaBXKXdVyHDlra/9MgjjqZGAvjf0ANtGkRP5JUGaRc/3C?=
 =?iso-8859-1?Q?8q1JRgorreGBNAYubUfV2l4S0gOHes7p1E6Z3VHfv0zqEd4D4DxmoTOiKA?=
 =?iso-8859-1?Q?ro9FDfZeU2DrhMlR8U1OlNUu4nXsiMujLwVrgXFRp0k6b+vq6BUe/bQaTS?=
 =?iso-8859-1?Q?it7VYoIOD37I5Wrm6eP2FUmcnxLbEeAtUJHunw9SNxYRXJMC4cRINtQmsz?=
 =?iso-8859-1?Q?9e7yjmAc9RKNn0sWwop0jL1D3UgjNQRrCxQBmdPm07M5/wXGFzfA3YXTcL?=
 =?iso-8859-1?Q?DgehkklONIAdlp8WLXA+Tv1M8+HXPTPD9kqB55E0EcKpCBOu5kiElyePOe?=
 =?iso-8859-1?Q?PkYjvA3r/lJMTaT40Np+LfNI74K9Hvso9US7A1g44Xss+QLpffu3kHXZDr?=
 =?iso-8859-1?Q?iW8bQX1GlQORjg5NKXd+HOHyAZ+181rjh3a/UWqlxQnLeZNRXpylxCkjkB?=
 =?iso-8859-1?Q?diENkX/9XAzN72+Q7wuTR1J8MkbQY/GlobjWAjA6m9VbhMg+qH+mF/OFUq?=
 =?iso-8859-1?Q?SD6wGyB//fd5NvlN0Jh1m9bPFD8KlMRdAJsuHFAovw+JlrTXB/GsRRgrta?=
 =?iso-8859-1?Q?k1Vdwm7n1f6ePCBbleW/bxsDApHza6rwSwntIQZbBrUL1w4POn0DgaQrgu?=
 =?iso-8859-1?Q?x4+FWGXMIPZYxwGDjz79Ws94krHMa4jY1VA/qxlEec2nxUVqPvgC8oXTG8?=
 =?iso-8859-1?Q?ruu/wtaLkkfBXCIjNmvblKe3vq5mbLLoPZ7RkCwlgzJ3Kisrk8dByn4t+X?=
 =?iso-8859-1?Q?fFmVV5z4FEpMInPYWbIeigG0B0O6FgDprITg5ucTfx3WbkIe/N7QjNnXwR?=
 =?iso-8859-1?Q?ZPqvAU/02cGZ1H0TWBl86n+4wcVBf5wrVXB+OHgSnPRM9xipw0uJeatWdl?=
 =?iso-8859-1?Q?yqueKnfPIpbK/bB/RJVpVc9/U08sx/w7FQNQTzv2/sgCkx4b7fHIoq8Ub3?=
 =?iso-8859-1?Q?5VWwGBtnhoqQnbOUVis2Rftva9GpZKbOhaNvSpZ9nYVA+fqFVvKh1kYZIn?=
 =?iso-8859-1?Q?BxxKJAxLeApvsAoVfXfV8zbvDehjAuiKTsEhaV8RuQZZQ7g7UHgZWEg92G?=
 =?iso-8859-1?Q?2htc/dHW697/gvOBkGpPbBMX8SXscnsX3sy8b913HV0fz0pA4y1pLoBV//?=
 =?iso-8859-1?Q?8D/+hypGNGR4QFB91cfRfDto7DP3S6jiVsVcXVXpP09EJd7uU7nY/2Lx7G?=
 =?iso-8859-1?Q?sp4reI1JtRBxORaCoL/pIpiDjADz3gHnaYBNRwc3YhPbL5Kq3stRQ+lXhT?=
 =?iso-8859-1?Q?zQZeSNc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5070.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?U79TWCeICfe8fJzBKpBz2vpXcfbORnIWLiFH3BUPRbzJQ9Du4VgG+O1AuS?=
 =?iso-8859-1?Q?haMC1UsSnnrhcERkYNgikf+z8Zi8YLOMZftMZfqp2aH/MUyO/TmOO8tRvW?=
 =?iso-8859-1?Q?7zJpyhgmFfv5ko2pcHuAz9QZSRNDgR3nnPv3FzQFWNt1+TgXloSygpXuLd?=
 =?iso-8859-1?Q?i2UJ573u+NcBZScNvPS4ka9UcMp/U03rh0f3dTDyGW9O6nflEt+ciywqAA?=
 =?iso-8859-1?Q?LnTS5Y6U5HsBxvJ9AFQce8tOxg6EW6oZ+mvzI/2VXKRBGk3dWLaplW5eOH?=
 =?iso-8859-1?Q?WAGt5kG6nenVPCXlGPF1bOvE7vuRvB/Cky6vZsn0GGwPVrJkWC9/3KEeBO?=
 =?iso-8859-1?Q?bM2nBKOoF8nSTiYwxg2WhtztgLtamcB8lXci48HH9S9SsfVAqBk2yhFStZ?=
 =?iso-8859-1?Q?60PRuIqYV7T4RuFyTc0eLa0wvkknaAZTy02Oq9iIi92yBf8lvm/C6Gr6zt?=
 =?iso-8859-1?Q?4Vm6YsTeoP1MzSNYU7rRyXn/JPvhwGk2ML9eTJLYlz3kTkUx+PHVi84+tY?=
 =?iso-8859-1?Q?VbQzDlZk8lRZ7EfdYqqWGuVVjZtUfETzoWDK7PR+XTef6iusL6xmoHi2RT?=
 =?iso-8859-1?Q?dV+srqTxFtRMNB0ZdhXCvNFA0W6C/YOWO5w5Ea6LETAAdUyaP9TkOiuGW0?=
 =?iso-8859-1?Q?X3aK9Vsmd5okUMKfFrtCPg3sHbKUhfzzpPZDTb+K8Mvt8SE1fioFHsQPXc?=
 =?iso-8859-1?Q?bs+hQaSM5SOWd0QCXtDAIoIX1ewkPYZm9ghnxwxaMJU7GNNLsr6tc+Z121?=
 =?iso-8859-1?Q?unzQBgIdSJ+OE6TQNl2jaIE89ZMhUYL9RG4KHFkg/T62UkVf4ulj7JWscg?=
 =?iso-8859-1?Q?KSRImaGfUSxwtMd6NYWvmlnuap9gjrM8CJmIwAbuvx3aJALVcLO8jIzA1C?=
 =?iso-8859-1?Q?aRmdHj41uYU0BJgNFQb67SnKPsesrwxpfLHmPgsBqDZ6HM5YJ7b8+nae6n?=
 =?iso-8859-1?Q?B3WX7cS9otYZvPkaKO21kBWjvvnH0IJP1Tui+6oby3qbTX7jP4L0E54l/N?=
 =?iso-8859-1?Q?DXeV6h200o0F1JEgrrqaicf1lGI9CyaAqU8ZI81pbftejf1yAFwO86rZ6i?=
 =?iso-8859-1?Q?X3i848jjkcUeQFEOD9lekmxTZmUC1cvG7y9BoWPbYJw/fo3azez7SJA9v0?=
 =?iso-8859-1?Q?xhir8KqfMIoQJ1iv5K1WX6jDJV8y2D/QZzzGbOfOIdfO3Yky+kkTcRgUki?=
 =?iso-8859-1?Q?Js+nsLzQ1DpZsdFo3X4h913mCxE2iw2Yi51BgwNCBDGVhEW1kaQbtkRHv+?=
 =?iso-8859-1?Q?ddnnMOY8iDVib9h514KKXbtuFUxPiJNOid6K5p5RshkvX7qBI57vFnOVua?=
 =?iso-8859-1?Q?hnWRglxm4NFLUtQSD6mDAHB+jeBOk9RBn47v9ClxGNs2iimRCKfs2Rr97c?=
 =?iso-8859-1?Q?wg8XDGq0fy1Y2oa8lxPMlbJ4w7pDGrFppk44AWftylfAcT+zkXHDZNqvkJ?=
 =?iso-8859-1?Q?QnSs4pibG0xPLcGVw0SJbRFZJ3Mhkq5FcwuFTD6KRoaLO1q0eaodKXNKjh?=
 =?iso-8859-1?Q?DHdGzcz92grsxgyyFFTJ25tkYoy7pDO/6Utp/X3+iZnRsuhWD9dy+Ih7KL?=
 =?iso-8859-1?Q?VoalUnYNlCbvsBr5g5YzHpd8w4RO5gAUSGqtA2eJZREWFSTJfNiozZtHns?=
 =?iso-8859-1?Q?pMLn1Wl9lypAhmYGpAbbZjGjidlajN9P+W?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR11MB50701535D5CD3A2ABE94280185A72SJ0PR11MB5070namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0804a71-2266-485a-378d-08dd6b88dfdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 10:36:17.1498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BHmx9NixRvmgKp/46zVKQvUdrIfW20vmz26q+x6YHoCjct6Ol3HyXkoR3F24tGHcXkd9kFfudL6Hjr3XAXEV4LqRlML5Ymw1QebydUd+pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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

--_000_SJ0PR11MB50701535D5CD3A2ABE94280185A72SJ0PR11MB5070namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The ccs mode setting support via sysfs is required by our customer.

Acked-by: Arshad Mehmood <arshad.mehmood@intel.com>

________________________________
From: Andi Shyti
Sent: Monday, March 24, 2025 9:29 PM
To: intel-gfx; dri-devel
Cc: Tvrtko Ursulin; Joonas Lahtinen; Chris Wilson; Simona Vetter; Mehmood, =
Arshad; Mrozek, Michal; Andi Shyti; Andi Shyti
Subject: [PATCH v4 00/15] CCS static load balance

Hi,

Back in v3, this patch series was turned down due to community
policies regarding i915 GEM development. Since then, I have
received several requests from userspace developers, which I
initially declined in order to respect those policies.

However, with the latest request from UMD users, I decided to
give this series another chance. I believe that when a feature
is genuinely needed, our goal should be to support it, not to
dismiss user and customer needs blindly.

Here is the link to the userspace counterpart, which depends on
this series to function properly[*].

I've been refreshing and testing the series together with Arshad.

This patchset introduces static load balancing for GPUs with
multiple compute engines. It's a relatively long series.

To help with review, I've broken the work down as much as
possible in multiple patches.

To summarise:
- Patches 1 to 14 introduce no functional changes, aside from
  adding the 'num_cslices' interface.
- Patch 15 contains the core of the CCS mode setting, building
  on the earlier groundwork.

The updated approach focuses on managing the UABI engine list,
which controls which engines are exposed to userspace. Instead
of manipulating physical engines and their memory directly, we
now control exposure via this list.

Since v3, I've kept the changes in v4 to a minimum because there
wasn't a real technical review on the previous posting. I would
really appreciate it if this time all technical concerns could be
raised and discussed on the mailing list.

IGT tests for this work exist but haven't been submitted yet.

Thanks to Chris for the reviews, to Arshad for the work we've
done together over the past few weeks, and to Michal for his
invaluable input from the userspace side.

Thanks,
Andi

[*] https://github.com/intel/compute-runtime

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PATCHv3 -> PATCHv4
------------------
 - Rebase on top of the latest drm-tip
 - Do not call functions inside GEM_BUG_ONs, but call them
   explicitly (thanks Arshad).

PATCHv2 -> PATCHv3
------------------
 - Fix a NULL pointer dereference during module unload.
   In i915_gem_driver_remove() I was accessing the gt after the
   gt was removed. Use the dev_priv, instead (obviously!).
 - Fix a lockdep issue: Some of the uabi_engines_mutex unlocks
   were not correctly placed in the exit paths.
 - Fix a checkpatch error for spaces after and before parenthesis
   in the for_each_enabled_engine() definition.

PATCHv1 -> PATCHv2
------------------
 - Use uabi_mutex to protect the uabi_engines, not the engine
   itself. Rename it to uabi_engines_mutex.
 - Use kobject_add/kobject_del for adding and removing
   interfaces, this way we don't need to destroy and recreate the
   engines, anymore. Refactor intel_engine_add_single_sysfs() to
   reflect this scenario.
 - After adding engines to the rb_tree check that they have been
   added correctly.
 - Fix rb_find_add() compare function to take into accoung also
   the class, not just the instance.

RFCv2 -> PATCHv1
----------------
 - Removed gt->ccs.mutex
 - Rename m -> width, ccs_id -> engine in
   intel_gt_apply_ccs_mode().
 - In the CCS register value calculation
   (intel_gt_apply_ccs_mode()) the engine (ccs_id) needs to move
   along the ccs_mask (set by the user) instead of the
   cslice_mask.
 - Add GEM_BUG_ON after calculating the new ccs_mask
   (update_ccs_mask()) to make sure all angines have been
   evaluated (i.e. ccs_mask must be '0' at the end of the
   algorithm).
 - move wakeref lock before evaluating intel_gt_pm_is_awake() and
   fix exit path accordingly.
 - Use a more compact form in intel_gt_sysfs_ccs_init() and
   add_uabi_ccs_engines() when evaluating sysfs_create_file(): no
   need to store the return value to the err variable which is
   unused. Get rid of err.
 - Print a warnging instead of a debug message if we fail to
   create the sysfs files.
 - If engine files creation fails in
   intel_engine_add_single_sysfs(), print a warning, not an
   error.
 - Rename gt->ccs.ccs_mask to gt->ccs.id_mask and add a comment
   to explain its purpose.
 - During uabi engine creation, in
   intel_engines_driver_register(), the uabi_ccs_instance is
   redundant because the ccs_instances is already tracked in
   engine->uabi_instance.
 - Mark add_uabi_ccs_engines() and remove_uabi_ccs_engines() as
   __maybe_unused not to break bisectability. They wouldn't
   compile in their own commit. They will be used in the next
   patch and the __maybe_unused is removed.
 - Update engine's workaround every time a new mode is set in
   update_ccs_mask().
 - Mark engines as valid or invalid using their status as
   rb_node. Invalid engines are marked as invalid using
   RB_CLEAR_NODE(). Execbufs will check for their validity when
   selecting the engine to be combined to a context.
 - Create for_each_enabled_engine() which skips the non valid
   engines and use it in selftests.

RFCv1 -> RFCv2
--------------
Compared to the first version I've taken a completely different
approach to adding and removing engines. in v1 physical engines
were directly added and removed, along with the memory allocated
to them, each time the user changed the CCS mode (from the
previous cover letter).

Andi Shyti (15):
  drm/i915/gt: Avoid using masked workaround for CCS_MODE setting
  drm/i915/gt: Move the CCS mode variable to a global position
  drm/i915/gt: Allow the creation of multi-mode CCS masks
  drm/i915/gt: Refactor uabi engine class/instance list creation
  drm/i915/gem: Mark and verify UABI engine validity
  drm/i915/gt: Introduce for_each_enabled_engine() and apply it in
    selftests
  drm/i915/gt: Manage CCS engine creation within UABI exposure
  drm/i915/gt: Remove cslices mask value from the CCS structure
  drm/i915/gt: Expose the number of total CCS slices
  drm/i915/gt: Store engine-related sysfs kobjects
  drm/i915/gt: Store active CCS mask
  drm/i915: Protect access to the UABI engines list with a mutex
  drm/i915/gt: Isolate single sysfs engine file creation
  drm/i915/gt: Implement creation and removal routines for CCS engines
  drm/i915/gt: Allow the user to change the CCS mode through sysfs

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   3 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  28 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  23 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  62 ++-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |  12 +
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c   | 357 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h   |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  19 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   8 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |   4 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |   6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  52 +--
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  22 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  18 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |   6 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |   8 +-
 .../drm/i915/gt/selftest_ring_submission.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        |  14 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  14 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  14 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c       |  80 ++--
 drivers/gpu/drm/i915/gt/sysfs_engines.h       |   2 +
 drivers/gpu/drm/i915/i915_cmd_parser.c        |   2 +
 drivers/gpu/drm/i915/i915_debugfs.c           |   4 +
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |   4 +
 drivers/gpu/drm/i915/i915_perf.c              |   8 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  11 +-
 drivers/gpu/drm/i915/i915_query.c             |  21 +-
 37 files changed, 648 insertions(+), 193 deletions(-)

--
2.47.2


--_000_SJ0PR11MB50701535D5CD3A2ABE94280185A72SJ0PR11MB5070namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The ccs mode setting support via sysfs is required by our customer.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
Acked-by: Arshad Mehmood &lt;arshad.mehmood@intel.com&gt;</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Andi Shyti<br>
<b>Sent:</b>&nbsp;Monday, March 24, 2025 9:29 PM<br>
<b>To:</b>&nbsp;intel-gfx; dri-devel<br>
<b>Cc:</b>&nbsp;Tvrtko Ursulin; Joonas Lahtinen; Chris Wilson; Simona Vette=
r; Mehmood, Arshad; Mrozek, Michal; Andi Shyti; Andi Shyti<br>
<b>Subject:</b>&nbsp;[PATCH v4 00/15] CCS static load balance </span>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Hi,<br>
<br>
Back in v3, this patch series was turned down due to community<br>
policies regarding i915 GEM development. Since then, I have<br>
received several requests from userspace developers, which I<br>
initially declined in order to respect those policies.<br>
<br>
However, with the latest request from UMD users, I decided to<br>
give this series another chance. I believe that when a feature<br>
is genuinely needed, our goal should be to support it, not to<br>
dismiss user and customer needs blindly.<br>
<br>
Here is the link to the userspace counterpart, which depends on<br>
this series to function properly[*].<br>
<br>
I've been refreshing and testing the series together with Arshad.<br>
<br>
This patchset introduces static load balancing for GPUs with<br>
multiple compute engines. It's a relatively long series.<br>
<br>
To help with review, I've broken the work down as much as<br>
possible in multiple patches.<br>
<br>
To summarise:<br>
- Patches 1 to 14 introduce no functional changes, aside from<br>
&nbsp; adding the 'num_cslices' interface.<br>
- Patch 15 contains the core of the CCS mode setting, building<br>
&nbsp; on the earlier groundwork.<br>
<br>
The updated approach focuses on managing the UABI engine list,<br>
which controls which engines are exposed to userspace. Instead<br>
of manipulating physical engines and their memory directly, we<br>
now control exposure via this list.<br>
<br>
Since v3, I've kept the changes in v4 to a minimum because there<br>
wasn't a real technical review on the previous posting. I would<br>
really appreciate it if this time all technical concerns could be<br>
raised and discussed on the mailing list.<br>
<br>
IGT tests for this work exist but haven't been submitted yet.<br>
<br>
Thanks to Chris for the reviews, to Arshad for the work we've<br>
done together over the past few weeks, and to Michal for his<br>
invaluable input from the userspace side.<br>
<br>
Thanks,&nbsp;<br>
Andi<br>
<br>
[*] <a href=3D"https://github.com/intel/compute-runtime" id=3D"OWAda19eff1-=
352b-b32f-0db1-c87219682866" class=3D"OWAAutoLink" data-auth=3D"NotApplicab=
le">
https://github.com/intel/compute-runtime</a><br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
PATCHv3 -&gt; PATCHv4<br>
------------------<br>
&nbsp;- Rebase on top of the latest drm-tip<br>
&nbsp;- Do not call functions inside GEM_BUG_ONs, but call them<br>
&nbsp;&nbsp; explicitly (thanks Arshad).<br>
<br>
PATCHv2 -&gt; PATCHv3<br>
------------------<br>
&nbsp;- Fix a NULL pointer dereference during module unload.<br>
&nbsp;&nbsp; In i915_gem_driver_remove() I was accessing the gt after the<b=
r>
&nbsp;&nbsp; gt was removed. Use the dev_priv, instead (obviously!).<br>
&nbsp;- Fix a lockdep issue: Some of the uabi_engines_mutex unlocks<br>
&nbsp;&nbsp; were not correctly placed in the exit paths.<br>
&nbsp;- Fix a checkpatch error for spaces after and before parenthesis<br>
&nbsp;&nbsp; in the for_each_enabled_engine() definition.<br>
<br>
PATCHv1 -&gt; PATCHv2<br>
------------------<br>
&nbsp;- Use uabi_mutex to protect the uabi_engines, not the engine<br>
&nbsp;&nbsp; itself. Rename it to uabi_engines_mutex.<br>
&nbsp;- Use kobject_add/kobject_del for adding and removing<br>
&nbsp;&nbsp; interfaces, this way we don't need to destroy and recreate the=
<br>
&nbsp;&nbsp; engines, anymore. Refactor intel_engine_add_single_sysfs() to<=
br>
&nbsp;&nbsp; reflect this scenario.<br>
&nbsp;- After adding engines to the rb_tree check that they have been<br>
&nbsp;&nbsp; added correctly.<br>
&nbsp;- Fix rb_find_add() compare function to take into accoung also<br>
&nbsp;&nbsp; the class, not just the instance.<br>
<br>
RFCv2 -&gt; PATCHv1<br>
----------------<br>
&nbsp;- Removed gt-&gt;ccs.mutex<br>
&nbsp;- Rename m -&gt; width, ccs_id -&gt; engine in<br>
&nbsp;&nbsp; intel_gt_apply_ccs_mode().<br>
&nbsp;- In the CCS register value calculation<br>
&nbsp;&nbsp; (intel_gt_apply_ccs_mode()) the engine (ccs_id) needs to move<=
br>
&nbsp;&nbsp; along the ccs_mask (set by the user) instead of the<br>
&nbsp;&nbsp; cslice_mask.<br>
&nbsp;- Add GEM_BUG_ON after calculating the new ccs_mask<br>
&nbsp;&nbsp; (update_ccs_mask()) to make sure all angines have been<br>
&nbsp;&nbsp; evaluated (i.e. ccs_mask must be '0' at the end of the<br>
&nbsp;&nbsp; algorithm).<br>
&nbsp;- move wakeref lock before evaluating intel_gt_pm_is_awake() and<br>
&nbsp;&nbsp; fix exit path accordingly.<br>
&nbsp;- Use a more compact form in intel_gt_sysfs_ccs_init() and<br>
&nbsp;&nbsp; add_uabi_ccs_engines() when evaluating sysfs_create_file(): no=
<br>
&nbsp;&nbsp; need to store the return value to the err variable which is<br=
>
&nbsp;&nbsp; unused. Get rid of err.<br>
&nbsp;- Print a warnging instead of a debug message if we fail to<br>
&nbsp;&nbsp; create the sysfs files.<br>
&nbsp;- If engine files creation fails in<br>
&nbsp;&nbsp; intel_engine_add_single_sysfs(), print a warning, not an<br>
&nbsp;&nbsp; error.<br>
&nbsp;- Rename gt-&gt;ccs.ccs_mask to gt-&gt;ccs.id_mask and add a comment<=
br>
&nbsp;&nbsp; to explain its purpose.<br>
&nbsp;- During uabi engine creation, in<br>
&nbsp;&nbsp; intel_engines_driver_register(), the uabi_ccs_instance is<br>
&nbsp;&nbsp; redundant because the ccs_instances is already tracked in<br>
&nbsp;&nbsp; engine-&gt;uabi_instance.<br>
&nbsp;- Mark add_uabi_ccs_engines() and remove_uabi_ccs_engines() as<br>
&nbsp;&nbsp; __maybe_unused not to break bisectability. They wouldn't<br>
&nbsp;&nbsp; compile in their own commit. They will be used in the next<br>
&nbsp;&nbsp; patch and the __maybe_unused is removed.<br>
&nbsp;- Update engine's workaround every time a new mode is set in<br>
&nbsp;&nbsp; update_ccs_mask().<br>
&nbsp;- Mark engines as valid or invalid using their status as<br>
&nbsp;&nbsp; rb_node. Invalid engines are marked as invalid using<br>
&nbsp;&nbsp; RB_CLEAR_NODE(). Execbufs will check for their validity when<b=
r>
&nbsp;&nbsp; selecting the engine to be combined to a context.<br>
&nbsp;- Create for_each_enabled_engine() which skips the non valid<br>
&nbsp;&nbsp; engines and use it in selftests.<br>
<br>
RFCv1 -&gt; RFCv2<br>
--------------<br>
Compared to the first version I've taken a completely different<br>
approach to adding and removing engines. in v1 physical engines<br>
were directly added and removed, along with the memory allocated<br>
to them, each time the user changed the CCS mode (from the<br>
previous cover letter).<br>
<br>
Andi Shyti (15):<br>
&nbsp; drm/i915/gt: Avoid using masked workaround for CCS_MODE setting<br>
&nbsp; drm/i915/gt: Move the CCS mode variable to a global position<br>
&nbsp; drm/i915/gt: Allow the creation of multi-mode CCS masks<br>
&nbsp; drm/i915/gt: Refactor uabi engine class/instance list creation<br>
&nbsp; drm/i915/gem: Mark and verify UABI engine validity<br>
&nbsp; drm/i915/gt: Introduce for_each_enabled_engine() and apply it in<br>
&nbsp;&nbsp;&nbsp; selftests<br>
&nbsp; drm/i915/gt: Manage CCS engine creation within UABI exposure<br>
&nbsp; drm/i915/gt: Remove cslices mask value from the CCS structure<br>
&nbsp; drm/i915/gt: Expose the number of total CCS slices<br>
&nbsp; drm/i915/gt: Store engine-related sysfs kobjects<br>
&nbsp; drm/i915/gt: Store active CCS mask<br>
&nbsp; drm/i915: Protect access to the UABI engines list with a mutex<br>
&nbsp; drm/i915/gt: Isolate single sysfs engine file creation<br>
&nbsp; drm/i915/gt: Implement creation and removal routines for CCS engines=
<br>
&nbsp; drm/i915/gt: Allow the user to change the CCS mode through sysfs<br>
<br>
&nbsp;drivers/gpu/drm/i915/gem/i915_gem_context.c&nbsp;&nbsp; |&nbsp;&nbsp;=
 3 +<br>
&nbsp;.../gpu/drm/i915/gem/i915_gem_execbuffer.c&nbsp;&nbsp;&nbsp; |&nbsp; =
28 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_engine_cs.c&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 23 --<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_engine_types.h&nbsp; |&nbsp;&nbsp; 2 +<=
br>
&nbsp;drivers/gpu/drm/i915/gt/intel_engine_user.c&nbsp;&nbsp; |&nbsp; 62 ++=
-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 12 +<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c&nbsp;&nbsp; | 357 +++++++=
++++++++++-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h&nbsp;&nbsp; |&nbsp;&nbsp;=
 5 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_sysfs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_types.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 19 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_workarounds.c&nbsp;&nbsp; |&nbsp;&nbsp;=
 8 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_context.c&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 6 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_engine_cs.c&nbsp; |&nbsp;&nbsp; 4 +-=
<br>
&nbsp;.../drm/i915/gt/selftest_engine_heartbeat.c&nbsp;&nbsp; |&nbsp;&nbsp;=
 6 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_engine_pm.c&nbsp; |&nbsp;&nbsp; 6 +-=
<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_execlists.c&nbsp; |&nbsp; 52 +--<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_gt_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_hangcheck.c&nbsp; |&nbsp; 22 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_lrc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 18 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_mocs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 6 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_rc6.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 4 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_reset.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 8 +-<br>
&nbsp;.../drm/i915/gt/selftest_ring_submission.c&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_rps.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 14 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_timeline.c&nbsp;&nbsp; |&nbsp; 14 +-=
<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_tlb.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;.../gpu/drm/i915/gt/selftest_workarounds.c&nbsp;&nbsp;&nbsp; |&nbsp; =
14 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/sysfs_engines.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 80 ++--<br>
&nbsp;drivers/gpu/drm/i915/gt/sysfs_engines.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 +<br>
&nbsp;drivers/gpu/drm/i915/i915_cmd_parser.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +<br>
&nbsp;drivers/gpu/drm/i915/i915_debugfs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&nbsp;drivers/gpu/drm/i915/i915_drv.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 5 +<br>
&nbsp;drivers/gpu/drm/i915/i915_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&nbsp;drivers/gpu/drm/i915/i915_perf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +-<br>
&nbsp;drivers/gpu/drm/i915/i915_pmu.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 11 +-<br>
&nbsp;drivers/gpu/drm/i915/i915_query.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 21 +-<br>
&nbsp;37 files changed, 648 insertions(+), 193 deletions(-)<br>
<br>
--<br>
2.47.2<br>
<br>
</div>
</body>
</html>

--_000_SJ0PR11MB50701535D5CD3A2ABE94280185A72SJ0PR11MB5070namp_--

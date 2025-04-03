Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2914A7B11B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFC010EB7F;
	Thu,  3 Apr 2025 21:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/wMPq1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD70310EB7F;
 Thu,  3 Apr 2025 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743715736; x=1775251736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uqclMaQKOZDr1U6GkIkx8/oYXk2O/0sVcxqgcVwjsFU=;
 b=Q/wMPq1CASpFCCaso3z+DwpLgqoCAnIOnOCcnYnasvqMUBeDR5A1AEUq
 cdx1Ud7k+kJeb0TBHTcTOl4SuTWCGPZmcPiB7EbIaj8QsrsxIn14f33iw
 eWmh3mdHVQS2BxuxO8HnKGijlSRYQ+ZyA6tYBAmT+fdYUZc84TLiWaCxM
 8D7PIAD/rh4xrOxhwcRluSob2tvMGazzbLS/6/pSkOAa/noZznqrHUKIY
 vEe/UfjTQI5Lk6Xz8JwRaEEOrw6V/7sQ+HQKyBor0bDdq7gmvMBxpjBAK
 RN1O0IQ8Zlaox2QCpQ+NhYVPqZv7yCO4/78q9cY5FspRS7A7JIgCNIfzR w==;
X-CSE-ConnectionGUID: 2yXUPip2QQe3lvidf7nYaw==
X-CSE-MsgGUID: 6VybkrG2Sju7a/S63rfCgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="67619368"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="67619368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:28:54 -0700
X-CSE-ConnectionGUID: UDrCJd2DS2yfQvJ11vGeug==
X-CSE-MsgGUID: nLHZ3YaSRgq/R7dVxqXOJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="126933565"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 14:28:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 14:28:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:28:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:28:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf+Yl8MEOWSA0ou5jOJEGUUTx8vvH2hiWkwXpHrsfJ9fFBeqfTNsxgQITaxNnuNDpedWhU+CuD7lpLdZ5FcDV3jscOf601CcRZSMYUsZz471ikB49Nstd3MhbrZrKEqqcdrtA9lKHLvlBhZ+z9hsTmcOwPqKPS9j6SHki7c7xP+JDPbUIuQOJbtHk5cO7Nq3r5KA9jMZyADpoFlOjPwHT7CVcVJmI33Q7seDVtnTCN75fkIzyGspZ1MiYUipWZSvCkiMkvpspiTjE6YHZyN0sbvko7k2NLg/tjRNV6DTMfKcviENUMYLUTY0H07Yb+KfgHrioWZ2DL6oXuBEYQqmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eHGo3SLeVSVWY7yyY8Hhn53Bh5fa7P1UqH/uRgT3uk=;
 b=JJlq9rtxjFyPj4VmiUDAR9fqg+X0fY58vB4vXzUuMvPiVwNWRZCJNbKGiJ5MDxootB/SK8FrVPDZEJp2xYX2szJ39nrh0aXv5aeLInMBj+ecTCH2Z+gJj5uzd2B53mTsRNRD2LJJrAn7s44daCUd+VwfhQJvdhVRKbkT9USd482Xgz+0y0G4NZgqwn74osuR32KxvD01ragnxd3Fi/6caEjuZLj9isxo4fS+8iCqMUYw+XINgloe11uSpGHd5Sfd6Mfv2gYTfECgIIcf/iVqFJBVoLXb0PJQOpucSgP/IDOTNaRvrCfs1YDA+mHkQzBrMbLHr8sW+2q6K/iWSwntAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:28:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 21:28:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU for
 non-visible access
Thread-Topic: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Thread-Index: AQHbpNajSaIwCD24QU+UQ/PrDa6HiLOSZ0XA
Date: Thu, 3 Apr 2025 21:28:48 +0000
Message-ID: <CH0PR11MB5444564A7A44CBF255CE097DE5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-3-matthew.brost@intel.com>
In-Reply-To: <20250403202705.18488-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6764:EE_
x-ms-office365-filtering-correlation-id: d07927ab-4f63-4f19-ffd4-08dd72f6858c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/B2X+pTy+SBbJTeOMzenC+/+i4WKusnQy+ywaxBGY1XbMGn1hxptPGBfnGdC?=
 =?us-ascii?Q?G+KRNb1j04P/5eg1DPwwtz51MNuzYf5jnCDgLufVBnPVaBak64cYDFgHYBJy?=
 =?us-ascii?Q?yKSHI10ElxrJ74Sq6+IiftiHkCRNvpQ9wr9TJtzXkVees1u/RfeXP+7p9nei?=
 =?us-ascii?Q?vcSeKkyGcQFwCzpfoJPWT8E8lSgh8powSzrpuFNkkfBagqTUrok55m94cmI6?=
 =?us-ascii?Q?9M1t+CmRL4+Vi1my2sCCgtaIB+qYjBJFnVHb8ScwzbiXsCqR5bdI6HK2scxL?=
 =?us-ascii?Q?pQeNNfUW6g1o/mh/OjXT2/OAozBcz1ux5c0DJQD9N8pv0ffTmC1f+orxoPfG?=
 =?us-ascii?Q?fZl+vewgCuQ4B9jseowVbp+Sw9SLxHTagfwFvJSsjt0Wp3Dyt5YQwHlELDn3?=
 =?us-ascii?Q?teL4ZnrxbKZvGXdOOhJ7YhiQGWkRevm/84Z1e/tVpd1t8pPMOL4vL5Qpuzoo?=
 =?us-ascii?Q?PDFVIAQzyiunOkvf2KHQBfNi5n2DflQw2uArdhnCzv7oZ/Q374U0c99pRVdQ?=
 =?us-ascii?Q?VzSPYT2EpCV9yECEcaTrsfGjcOUM7KgKANq43RXeZYj9sdCpzzdUYIsEXBLb?=
 =?us-ascii?Q?wPGk4nx/wSD9czDXn3xSA+BfSLeiIqC0sC7/I1Xm7vEhalcXCuyaZxQDxvQv?=
 =?us-ascii?Q?W7zgKBujM7g9njTAkh18Q7hD5EsgeOA0rOTI8475UMJo9dTLaco0NDw4EP2z?=
 =?us-ascii?Q?kRl1xcPOKtptd5gCgIVEL1OGceGeR9ngoGK1TuyUwXsKKye8Iw4bMaa/iEAS?=
 =?us-ascii?Q?4TwWN0NL/wjoMeA1vgWMnrhk3ZLVJt6HzkKUWZssc2WFbPHixJraIjOr0gxN?=
 =?us-ascii?Q?/FtV9yZzmakuefLT9LhXo7jwlbbNfTC/rkqqJjxX4iQY/EhRHN/LdewhAsZ4?=
 =?us-ascii?Q?V5HdAj4qXyWYjU29xPlR4nCtmQG8UnH7RsTIrdViK+INDf700wPck1Eu4OCA?=
 =?us-ascii?Q?CGDTIITPqshbNaSGJEEHvBCa9QeiVlr+InwR6POhnw4slSad26hrBnF0STQD?=
 =?us-ascii?Q?cqse8ypBa3eszsaeiql4kFJ9ZPmVSt2xaVhHSHttwd9OnH9jMOHoCgjuHTKH?=
 =?us-ascii?Q?EsSoIkdfJR5hcZUBABjVyE6XRaDbZBKNNb/T1uLYjUY4JbE43nxLIyyTF3zz?=
 =?us-ascii?Q?nehVJuYxJ8fUieFLVpLW4FvQKSV9k8UWHYZyx5L31ILnOi4TQ2K2MXRxNXYn?=
 =?us-ascii?Q?pxWxiYi2KQ51Vlu5rgqYq2aPfYBHcgyVpQZor8G3M3xX9ckogydMsPkZ4umN?=
 =?us-ascii?Q?EbP0GOSwOuNjZzKAPRnuI+5l7OmA14icy3Clkf9OabBF4+dWoIsoXUaagrxS?=
 =?us-ascii?Q?kNPZUB1Zlf6grOmKFPyZHyPs4XvC8Y0ed7ib3OzEOn4jwcGgl07WYM6ceIxr?=
 =?us-ascii?Q?oExFndd/bJVQCPF8APKUOdKYbfpT5c2+ajlCllj8tkow3ddct+z0d24FRswk?=
 =?us-ascii?Q?TDl7TCHMVMmN4ypn+g+jFYaJDn3dZYGD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GjDu10astb8zZdIm2fBl0OKirCIjqJHh3VTJ9lyhoM3Eqe9bIsSYn5EwGZAw?=
 =?us-ascii?Q?3fyEgm0Hpxipzt5p9Abycuauk369+VnFN++JyFtgPOqyKCpvzt5olsLb+EVx?=
 =?us-ascii?Q?x9u1yHCdsYle7Uz0WVH5seCQzishGUpAubfMBHRTwrQcPHVJWNerxSyJI8r8?=
 =?us-ascii?Q?3voycw+cbYzpvMoJaZa18pxDh2eys3PQ47WKvGed2zwf8CQujkLssGCvdatI?=
 =?us-ascii?Q?KvhtN3VwMBz+LzxiuWPEy37MYBAd3+sLtzyNcnmRPHP0zxOcq0s8S+cqd2TA?=
 =?us-ascii?Q?COP1nK2Rc5uHVjRB2/abBpMNln2PDk1wp6rTr99A4ROi+mWc5hjhOj7iIX55?=
 =?us-ascii?Q?L9JRgjDohqPFph5tWZOW3Cx+6hcGngFi3/DGd+q04X3MeQMiDo0kJRRtXI8x?=
 =?us-ascii?Q?oRuXmTerndCoNVX9a0LjnCy7TI2adzoyYO26Z0UC4vtRlxnB95lRLsrUzGek?=
 =?us-ascii?Q?3aA1g0obFYGAX2qAky7tp/YgV1G57DmZVeEg5HWJBvYgkzViNoENObk4z9GP?=
 =?us-ascii?Q?Enk5CVT61ZZWg86gaAlMFyZH66lh5eBCQv00s1pKKl+VPrWO9lZNgHiz4IX5?=
 =?us-ascii?Q?NORFCbFZI4lClA7TTxtrXlhfpu1NP7kiEO8y1VM1/Iss4f2e+SFOuADtRmnk?=
 =?us-ascii?Q?gaNsCaLWatFT1j6IKbJhx11aX/c4wo7ejKTcNZ5vo2Jb8YedBWQKeZtxR4Yk?=
 =?us-ascii?Q?Q4EBbXH3GQPwau9JZsUkryJcdNc+NIjbg/bQOgs3rPs8SpPd3jA5Xhn0l7eE?=
 =?us-ascii?Q?bOr00MHpAdlPWpUSgV0dPxPHfw8ODwxCJbyVmt/wLrtUwGFXdpAPwhhrRqsS?=
 =?us-ascii?Q?UAeAyp1J0sNrUkmLll9/qgJDNVHlJ/mEo16MoGQbzwsRCDNnUTRvfBivqkiK?=
 =?us-ascii?Q?UsKF0zBv+bukYFtUVRmFAGopaYhTnLfBxViQ2+Dipi5B3lnE7YOQMfgZ+tcs?=
 =?us-ascii?Q?Yr4YgULrZDt3N5JjCak0WScQmDz1O6axPbZSXcZRLpbKrWd4p8jswnG7voTR?=
 =?us-ascii?Q?AB6gK0FLl/9EVDi9DTuqprrd/mv8RL/chI2OzQU+1uhrrJHoeUw5g6drH4j4?=
 =?us-ascii?Q?e9MLMdPVDmB/EhtAs7qQhQaKhG3+pm03UPYxAeOkSYKRi2vNKONLJCFqGtz+?=
 =?us-ascii?Q?NOLwIlmQydwVshXnPPKf/wOFjF75BweOJVjCya+LvYX25XuZTvhmSttXpIle?=
 =?us-ascii?Q?TymEo9X7lHgTrA6HLMTOGEl8J3YU7c/IEcOI8tW9YDRRhvJ/acX1ccG5LOqP?=
 =?us-ascii?Q?i9yQqsZZSOC+XOITLpu4L/PGyDkYtOC54PH+8kj4ANvVoGidCseE58tT+y8g?=
 =?us-ascii?Q?2yuRA965G1k9pPz1Gnz284csEpYRL9R9Q1v9u/h876c0+VYe9Q4b5Hr6C+au?=
 =?us-ascii?Q?MP0AbykhPuQnlWeNwApYzrcnAhcJkbz5CuxO1O8v3WZLUmD8uybN2Lih3mSP?=
 =?us-ascii?Q?MsdwnrMo0pMdm/C3AaitoBJThgNG15X3+nrFL+3izLM5iigyGFJOgtQ62cB0?=
 =?us-ascii?Q?22zf91i9heEguNmTC7HgQwWxEIfk4/a1cTFkcpWZxIH8O1SAtCtd+aMS+qN+?=
 =?us-ascii?Q?mu44HMbWYqUWG7RBbncr23hZUQPQh4wSY+6nznHOa8ltHHmvvTUktbkgkMuS?=
 =?us-ascii?Q?zA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07927ab-4f63-4f19-ffd4-08dd72f6858c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 21:28:48.4384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xLt7qq66MQG5Q6H1+MAHulzKlpnZCwvPZhQD05mpYGp674x5j5+2ItuTnrF9fYxUHIIRqQ75AULenM8xFC71I4welr3wDF3KsNfvbaaeqi4=
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
Subject: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU for =
non-visible access
>=20
> Add migrate layer functions to access VRAM and update
> xe_ttm_access_memory to use for non-visible access and large (more than
> 16k) BO access. 8G devcoreump on BMG observed 3 minute CPU copy time vs.
> 3s GPU copy time.
>=20
> v4:
>  - Fix non-page aligned accesses
>  - Add support for small / unaligned access
>  - Update commit message indicating migrate used for large accesses (Auld=
)
>  - Fix warning in xe_res_cursor for non-zero offset
> v5:
>  - Fix 32 bit build (CI)
> v6:
>  - Rebase and use SVM migration copy functions
> v7:
>  - Fix build error (CI)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I left some notes down below.  Most are non-blocking, which I labeled as su=
ch.  And
as for the rest, it's probable that I'm just misunderstanding some parts of=
 the code, and
that the notes I left are not relevant.

So, I'll be providing my reviewed-by now in the case that the blocking revi=
ew notes
turn out to not need to be addressed.  And in the case they need to be addr=
essed,
you can take my reviewed-by for the next revision.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c      |  15 ++-
>  drivers/gpu/drm/xe/xe_migrate.c | 221 ++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_migrate.h |   4 +
>  3 files changed, 223 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3c7c2353d3c8..c7e6b03d4aef 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1414,6 +1414,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_o=
bject *ttm_bo,
>  	struct xe_res_cursor cursor;
>  	struct xe_vram_region *vram;
>  	int bytes_left =3D len;
> +	int err =3D 0;
> =20
>  	xe_bo_assert_held(bo);
>  	xe_device_assert_mem_access(xe);
> @@ -1421,9 +1422,14 @@ static int xe_ttm_access_memory(struct ttm_buffer_=
object *ttm_bo,
>  	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
>  		return -EIO;
> =20
> -	/* FIXME: Use GPU for non-visible VRAM */
> -	if (!xe_ttm_resource_visible(ttm_bo->resource))
> -		return -EIO;
> +	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >=3D SZ_16K) {
> +		struct xe_migrate *migrate =3D
> +			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
> +
> +		err =3D xe_migrate_access_memory(migrate, bo, offset, buf, len,
> +					       write);
> +		goto out;
> +	}
> =20
>  	vram =3D res_to_mem_region(ttm_bo->resource);
>  	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
> @@ -1447,7 +1453,8 @@ static int xe_ttm_access_memory(struct ttm_buffer_o=
bject *ttm_bo,
>  			xe_res_next(&cursor, PAGE_SIZE);
>  	} while (bytes_left);
> =20
> -	return len;
> +out:
> +	return err ?: len;
>  }
> =20
>  const struct ttm_device_funcs xe_ttm_funcs =3D {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index ff0fc2fb0eb9..ba8568691d99 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -670,6 +670,7 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb =
*bb,
>  	u32 mocs =3D 0;
>  	u32 tile_y =3D 0;
> =20
> +	xe_gt_assert(gt, !(pitch & 3));
>  	xe_gt_assert(gt, size / pitch <=3D S16_MAX);
>  	xe_gt_assert(gt, pitch / 4 <=3D S16_MAX);
>  	xe_gt_assert(gt, pitch <=3D U16_MAX);
> @@ -1602,8 +1603,12 @@ enum xe_migrate_copy_dir {
>  	XE_MIGRATE_COPY_TO_SRAM,
>  };
> =20
> +#define XE_CACHELINE_BYTES	64ull
> +#define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
> +
>  static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> -					 unsigned long npages,
> +					 unsigned long len,
> +					 unsigned long sram_offset,
>  					 dma_addr_t *sram_addr, u64 vram_addr,
>  					 const enum xe_migrate_copy_dir dir)
>  {
> @@ -1613,17 +1618,21 @@ static struct dma_fence *xe_migrate_vram(struct x=
e_migrate *m,
>  	struct dma_fence *fence =3D NULL;
>  	u32 batch_size =3D 2;
>  	u64 src_L0_ofs, dst_L0_ofs;
> -	u64 round_update_size;
>  	struct xe_sched_job *job;
>  	struct xe_bb *bb;
>  	u32 update_idx, pt_slot =3D 0;
> +	unsigned long npages =3D DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> +	unsigned int pitch =3D len >=3D PAGE_SIZE && !(len & ~PAGE_MASK) ?
> +		PAGE_SIZE : 4;
>  	int err;
> =20
> -	if (npages * PAGE_SIZE > MAX_PREEMPTDISABLE_TRANSFER)
> -		return ERR_PTR(-EINVAL);
> +	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> +			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> +		return ERR_PTR(-EOPNOTSUPP);
> =20
> -	round_update_size =3D npages * PAGE_SIZE;
> -	batch_size +=3D pte_update_cmd_size(round_update_size);
> +	xe_assert(xe, npages * PAGE_SIZE <=3D MAX_PREEMPTDISABLE_TRANSFER);

Hmm... Does this case still need to return an error value?  I don't think r=
eplacing it with an
xe_assert is entirely valid, as asserts should not be used as a replacement=
 of proper error
handling.  Or so I've been told.

So, I guess the question is: what error was this preventing previously, and=
 is it still a concern?

> +
> +	batch_size +=3D pte_update_cmd_size(len);
>  	batch_size +=3D EMIT_COPY_DW;
> =20
>  	bb =3D xe_bb_new(gt, batch_size, use_usm_batch);
> @@ -1633,22 +1642,21 @@ static struct dma_fence *xe_migrate_vram(struct x=
e_migrate *m,
>  	}
> =20
>  	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> -				   sram_addr, round_update_size);
> +				   sram_addr, len + sram_offset);
> =20
>  	if (dir =3D=3D XE_MIGRATE_COPY_TO_VRAM) {
> -		src_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0);
> +		src_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
>  		dst_L0_ofs =3D xe_migrate_vram_ofs(xe, vram_addr, false);
> =20
>  	} else {
>  		src_L0_ofs =3D xe_migrate_vram_ofs(xe, vram_addr, false);
> -		dst_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0);
> +		dst_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
>  	}
> =20
>  	bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>  	update_idx =3D bb->len;
> =20
> -	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
> -		  XE_PAGE_SIZE);
> +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, pitch);
> =20
>  	job =3D xe_bb_create_migration_job(m->q, bb,
>  					 xe_migrate_batch_base(m, use_usm_batch),
> @@ -1696,7 +1704,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migr=
ate *m,
>  				     dma_addr_t *src_addr,
>  				     u64 dst_addr)
>  {
> -	return xe_migrate_vram(m, npages, src_addr, dst_addr,
> +	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
>  			       XE_MIGRATE_COPY_TO_VRAM);
>  }
> =20
> @@ -1717,12 +1725,199 @@ struct dma_fence *xe_migrate_from_vram(struct xe=
_migrate *m,
>  				       u64 src_addr,
>  				       dma_addr_t *dst_addr)
>  {
> -	return xe_migrate_vram(m, npages, dst_addr, src_addr,
> +	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
>  			       XE_MIGRATE_COPY_TO_SRAM);
>  }
> =20
>  #endif
> =20
> +static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_a=
ddr,
> +				 int len, int write)
> +{
> +	unsigned long i, npages =3D DIV_ROUND_UP(len, PAGE_SIZE);
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		if (!dma_addr[i])
> +			continue;

Non-blocking:
I'm guessing the dma_addr array can be non-contiguous (I.E. position 3 havi=
ng a
dma address does not imply positions 1 and 2 have them).  Because otherwise
this can be a break condition instead of a continue.

> +
> +		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
> +			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
> +	}
> +	kfree(dma_addr);
> +}
> +
> +static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> +				      void *buf, int len, int write)
> +{
> +	dma_addr_t *dma_addr;
> +	unsigned long i, npages =3D DIV_ROUND_UP(len, PAGE_SIZE);
> +
> +	dma_addr =3D kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> +	if (!dma_addr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		dma_addr_t addr;
> +		struct page *page;
> +
> +		if (is_vmalloc_addr(buf))
> +			page =3D vmalloc_to_page(buf);
> +		else
> +			page =3D virt_to_page(buf);
> +
> +		addr =3D dma_map_page(xe->drm.dev,
> +				    page, 0, PAGE_SIZE,
> +				    write ? DMA_TO_DEVICE :
> +				    DMA_FROM_DEVICE);
> +		if (dma_mapping_error(xe->drm.dev, addr))
> +			goto err_fault;
> +
> +		dma_addr[i] =3D addr;
> +		buf +=3D PAGE_SIZE;
> +	}
> +
> +	return dma_addr;
> +
> +err_fault:
> +	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> +	return ERR_PTR(-EFAULT);
> +}
> +
> +/**
> + * xe_migrate_access_memory - Access memory of a BO via GPU
> + *
> + * @m: The migration context.
> + * @bo: buffer object
> + * @offset: access offset into buffer object
> + * @buf: pointer to caller memory to read into or write from
> + * @len: length of access
> + * @write: write access
> + *
> + * Access memory of a BO via GPU either reading in or writing from a pas=
sed in
> + * pointer. Pointer is dma mapped for GPU access and GPU commands are is=
sued to
> + * read to or write from pointer.
> + *
> + * Returns:
> + * 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> +			     unsigned long offset, void *buf, int len,
> +			     int write)
> +{
> +	struct xe_tile *tile =3D m->tile;
> +	struct xe_device *xe =3D tile_to_xe(tile);
> +	struct xe_res_cursor cursor;
> +	struct dma_fence *fence =3D NULL;
> +	dma_addr_t *dma_addr;
> +	unsigned long page_offset =3D (unsigned long)buf & ~PAGE_MASK;
> +	int bytes_left =3D len, current_page =3D 0;
> +	void *orig_buf =3D buf;
> +
> +	xe_bo_assert_held(bo);
> +
> +	/* Use bounce buffer for small access and unaligned access */
> +	if (len & XE_CACHELINE_MASK ||
> +	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
> +		int buf_offset =3D 0;
> +
> +		/*
> +		 * Less than ideal for large unaligned access but this should be
> +		 * fairly rare, can fixup if this becomes common.
> +		 */
> +		do {
> +			u8 bounce[XE_CACHELINE_BYTES];
> +			void *ptr =3D (void *)bounce;
> +			int err;
> +			int copy_bytes =3D min_t(int, bytes_left,
> +					       XE_CACHELINE_BYTES -
> +					       (offset & XE_CACHELINE_MASK));
> +			int ptr_offset =3D offset & XE_CACHELINE_MASK;
> +
> +			err =3D xe_migrate_access_memory(m, bo,
> +						       offset &
> +						       ~XE_CACHELINE_MASK,
> +						       (void *)ptr,
> +						       sizeof(bounce), 0);
> +			if (err)
> +				return err;
> +
> +			if (!write) {
> +				memcpy(buf + buf_offset, ptr + ptr_offset,
> +				       copy_bytes);
> +				goto next;
> +			}

Non-blocking:
This should debatably be an if-else block, rather than relying on a "goto n=
ext"
here, as "goto next" is not used elsewhere in the function.

"""
	if (write) {
		memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
		err =3D xe_migrate_access_memory(m, bo,
						    offset & ~XE_CACHELINE_MASK,
						    (void *)ptr,
						    sizeof(bounce), 0);
	} else {
		memcpy(buf + buf_offset, ptr + ptr_offset,
			  copy_bytes);
	}

	if (err)
		return err;
"""

> +
> +			memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
> +			err =3D xe_migrate_access_memory(m, bo,
> +						       offset & ~XE_CACHELINE_MASK,
> +						       (void *)ptr,
> +						       sizeof(bounce), 0);
> +			if (err)
> +				return err;
> +
> +next:
> +			bytes_left -=3D copy_bytes;
> +			buf_offset +=3D copy_bytes;
> +			offset +=3D copy_bytes;
> +		} while (bytes_left);
> +
> +		return 0;
> +	}
> +
> +	dma_addr =3D xe_migrate_dma_map(xe, buf, len + page_offset, write);
> +	if (IS_ERR(dma_addr))
> +		return PTR_ERR(dma_addr);
> +
> +	xe_res_first(bo->ttm.resource, offset, bo->size - offset, &cursor);
> +
> +	do {
> +		struct dma_fence *__fence;
> +		u64 vram_addr =3D vram_region_gpu_offset(bo->ttm.resource) +
> +			cursor.start;
> +		int current_bytes;
> +
> +		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
> +			current_bytes =3D min_t(int, bytes_left,
> +					      MAX_PREEMPTDISABLE_TRANSFER);
> +		else
> +			current_bytes =3D min_t(int, bytes_left, cursor.size);
> +
> +		if (fence)
> +			dma_fence_put(fence);
> +
> +		__fence =3D xe_migrate_vram(m, current_bytes,
> +					  (unsigned long)buf & ~PAGE_MASK,
> +					  dma_addr + current_page,
> +					  vram_addr, write ?
> +					  XE_MIGRATE_COPY_TO_VRAM :
> +					  XE_MIGRATE_COPY_TO_SRAM);
> +		if (IS_ERR(__fence)) {
> +			if (fence)
> +				dma_fence_wait(fence, false);
> +			fence =3D __fence;
> +			goto out_err;
> +		}
> +		fence =3D __fence;

Non-blocking:
It would be nice if we didn't have two paths assigning fence the __fence va=
lue,
but any attempt I do to try and change that ends in having to compute the I=
S_ERR
value for __fence twice.  E.G.:

"""
	if (IS_ERR(__fence) && fence)
		dma_fence_wait(fence, false);
	fence =3D __fence;
	if (IS_ERR(fence))
		goto out_err;
"""

So, either way works.

> +
> +		buf +=3D current_bytes;
> +		offset +=3D current_bytes;
> +		current_page =3D (int)(buf - orig_buf) / PAGE_SIZE;
> +		bytes_left -=3D current_bytes;
> +		if (bytes_left)
> +			xe_res_next(&cursor, current_bytes);
> +	} while (bytes_left);
> +
> +	dma_fence_wait(fence, false);
> +	dma_fence_put(fence);
> +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +
> +	return 0;
> +
> +out_err:
> +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +	return PTR_ERR(fence);

Non-blocking:
The branching execution might be able to be shortened.  Perhaps:
"""
	dma_fence_wait(fence, false);
	dma_fence_put(fence);

out_err:
	xe_migtate_dma_unmap(xe, dma_addr, len + page_offset, write);
	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
}
"""
-Jonathan Cavitt

> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_migrate.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migr=
ate.h
> index 6ff9a963425c..fb9839c1bae0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -112,6 +112,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate =
*m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
> =20
> +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> +			     unsigned long offset, void *buf, int len,
> +			     int write);
> +
>  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
>  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
>  #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> --=20
> 2.34.1
>=20
>=20

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715199D4E4F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 15:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573B410E96E;
	Thu, 21 Nov 2024 14:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqtNNsHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9D810E966;
 Thu, 21 Nov 2024 14:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732198184; x=1763734184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I4iA3LTRgfxIc31OdOmROQsXcgkiD2euBmIbQNkw0Rs=;
 b=cqtNNsHY1f/GC5gRZwIS23llruduheXgLQdz+qJ8HDT3QBkA/I3vd/E8
 c/EtRRUcnO4PIyBXxgQQhGi20qyci34zaQLH7DhAwdbwJw8hoNxLmHXdp
 IL8eGB/EtjBhvUoGa5Aln3br8xAMRkR3LdquQhKXrMvEyFTE3gGmbEk5s
 bnaTPQINa3Eup5GQcviFY/JSP0n4eT74jjKZDhj0Irao5Ueiu39H1Uzam
 mKqWjUxgzALmUwtQzskF98Wh+kCj0Si4kQmNFZGtx7/Zrv2jJNnngQhCC
 nVmyl3pjZlTaCv7Gw2mRmrEV7SU1Ruu5NVrDdOlc4hSf3VlfB4xmyZTbV A==;
X-CSE-ConnectionGUID: tZs6VwSkS221n9b9bOvyHw==
X-CSE-MsgGUID: eyyzWRRCSyqbGzt4GlMjkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35977825"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="35977825"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:09:43 -0800
X-CSE-ConnectionGUID: gaAAUG/bQEeB6MnUJM6PdA==
X-CSE-MsgGUID: JQV8ekY3RBWIIpiLj6L6Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95068570"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 06:09:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 06:09:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 06:09:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 06:09:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzRIyLEStFjB5JsYDQsufItBxcbE+ApQZamCWiGeu6lW3k/+TJNFqgjaXYcxqsxlw1A78Swf86WKcbTgoXjQ44GONT3tAITaRVfY+R33PnwKrtSg3nAYw4cGq3J3CzNuESsADAMIlLLkymF+9NXXQUDaOVVAm7bFv7KFvJdg8x8pkJUCc5Y9MNjgp8ao9F4Y3isFQe/8HTlArd2nrM7tVogiAD15ruoy6ooFgNjC07jeTXk0XZTxGN8hEIJT1me41Cn6u2v6+vUZtN+jtkF/le9kFcoypqec6qE5gAOWpZwySblG7qyEv5DVCGGazCEFw7k569UzGBHQuSIKCurbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fojc5EsKO4u1dqgMcnPf0C5BO6embs78yFnNQ2Yeu0Q=;
 b=LYMXD7c0WEsfi8IMsXyk+yUeyIV3gVdgaAGyoUetqCj9sAvthD4SFT6hYFjQXrttX0u8rm6CFMVtk+oR5w+4wWTTrD3uDJQx1DMUi8VQm4tEkqwiq5MgRPBarAwLnccLH2+ktIOmfVQFURqr2aXlDofQx1e1gKINbjsTd4slBvdbLMDZPir0PBUr/fzZuU1LbUbVNKEiug136/nlI4EwZqm4oltIoO3EuURbCUYQrn4Qc56zVR5PCL6F1mCd+nu8vC0bfwlDQeYS9yinQTZjL6YZctDlaAI+LwWRhhNoWXW0yGDd0xuPonBwxF2vFDIaA/7hlI5DL4CtHBZZFiV6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 14:09:34 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 14:09:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbPBIhX471FQ1A6EuIfBvfg3i2B7LBw8/A
Date: Thu, 21 Nov 2024 14:09:29 +0000
Message-ID: <SN7PR11MB6750748F22B5F4C6B1949A88E3222@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-8-arun.r.murthy@intel.com>
In-Reply-To: <20241121122603.736267-8-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DM4PR11MB7376:EE_
x-ms-office365-filtering-correlation-id: 771d55cf-08cf-41e2-845d-08dd0a361d3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mRZrDn3Asi1BaYF0rR0929AOLRqvDSrN/l/IsnDlQK2oYLNL9Hy+u3n0dJ+j?=
 =?us-ascii?Q?3DoWCAGjMlwfkeD9OQk6e3EOVphNY8pXFidfkCm+YZ5v1O1Df4hM88qOtUN+?=
 =?us-ascii?Q?6CAGCMMY2Zm+fIi9Fh9TOovQ+F/rErfx/647dpu/eTquEjXkNpcyECWEtJkb?=
 =?us-ascii?Q?7kOWPZM4IynVLla1ZDKrQRnP0k+wZ8f5+YoCh2ZdP/TkBUqzPXTqZQMBfzCf?=
 =?us-ascii?Q?jBr5USgGETdMBEiF4Y9CSZ7/fuAVskry/GECjS/+3UQCH/Qs2XJLAF4CYoDe?=
 =?us-ascii?Q?o0KXr+1TwRp0dQAZgih9tUkcfn0IE1+UaCL62ZlW+SSBoAZoiWbZuzA1Rz5p?=
 =?us-ascii?Q?2pcWY91MsFmZZGKAKyKpxNngANUsT/dC52+Mh71n97SwHNYJfMopNvQr6JST?=
 =?us-ascii?Q?v6SgkXPMOtnMQe1CNGUAzMzMGd3MiEF6mFnA6kiTChNO7jonnP80xW7r5MCu?=
 =?us-ascii?Q?x4dgz2Y08ZuKaV0dmaU0+ryyKLnYCSXNzVU7hv9SHb1K0gkD13TXkp6EqeGH?=
 =?us-ascii?Q?1JLtxpLEZ6UU2HHSUOQyCQFMQGCFDuqcKJN00VqH97Z0h/sgEYzHbicrD0jb?=
 =?us-ascii?Q?Fe5Yj6r6ZCS7pABTcM/q8LLvh4VhnyclxXfJetsLvHjjx4wQrQvyttkobPbn?=
 =?us-ascii?Q?8tVoi8M1Y8aV1Xk4QXmrsCLmJwtIkQLovNO37e/GRRKxCetuZczz2gRI9ZAj?=
 =?us-ascii?Q?JG0U5epnYs4reRd0kL0SkzDiQMNWB4RQ7RNgU1WFNBPdP5F25j7lcFTaW8pP?=
 =?us-ascii?Q?9kgNQkc3SEqVrt+R6yz/ui+9uC5V8lbgrO/Ed6T6HdTHc0iCSVSJjDaWCcOk?=
 =?us-ascii?Q?Ld2W71j96Kd7RTT9VJekvhsgE9apKTjFlMJslZGHGB5wPoTd0xQaGajys9yj?=
 =?us-ascii?Q?qZQSznaMKTqDBkQnMuBYrjhie1uWTgGlaLQxhaPhNMWWokzXNuwk96mgivej?=
 =?us-ascii?Q?uxYyj1tmGl4Ro7GQKfqixUE4ACGuVhIonglw6g4tdrpuLDzvKMkIw2W1rHZ6?=
 =?us-ascii?Q?ShIeWDXmIHg14/EtbEP/sYAC2v5Y570AohZjUFT9yERw6oVu8cLF1n+tWnEo?=
 =?us-ascii?Q?hJMTvag4o/3YKXmHDMuV7KCsaB2CiLG8Cmr5MOhetT9Jt3w081SDUR+Ox5jq?=
 =?us-ascii?Q?OapHFzYuRrkqBp+5pM2z2uEp+G+I/1gsM8L2XOoKj8cw6V26NaRWDEVqECGW?=
 =?us-ascii?Q?yoI2knYBI0O+tKJPq9puMu3NpkIoanb6AWztzWnyY7GkZPdk7FASxuvA9s5v?=
 =?us-ascii?Q?9/Z0WSO90k4vpJi+oeBYC0BICN2+7VnY94M1/NzyWBy+8d9/JPrYQxlxm1ZC?=
 =?us-ascii?Q?uzg4tuCdaTthoVqVmnaMWtmPCHcZ9WS+p+TBFY1G2PgZYIQpEOyy5cih1YZH?=
 =?us-ascii?Q?iNoDnV0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vx5LN56Mz0FGuQBI7F6GlmkWAHRYCrKbfHXEsdQ8CeBKprWFle4LTAZBwoNw?=
 =?us-ascii?Q?VNJyJoY8+AQMzCl4ASwnIc1Rj4KWcFaxjR9LwNRNM9NMj8Uu4alr4kCP/Bcp?=
 =?us-ascii?Q?N1VVIq2Eb10SYaqm/jmZlz8ASRMiDSIyDAJ0FpH2aYRo46s/9ygEd8k4zzyO?=
 =?us-ascii?Q?c9NgJI8VCxPcpNP8AW0lojX8vB2Q0BE5oWw2dePLSVzTnpFgv4CHRngc5Arx?=
 =?us-ascii?Q?PRpPFN5eCJXtWdJqqyinhVgQI5LKdSdnuFRJE3x9o7ye0rnMLig0tR76zvrQ?=
 =?us-ascii?Q?EL+wH0igMhcKdDVZv1OevmRYQX0wgptvqqfp6agj97bSeYMKRWPSlwbRYBD+?=
 =?us-ascii?Q?DkT4uq/AVrxZ+8n+ZTByv4OA18+LnJ3L4O82UZh5SKm1z8uFMxZWw1VnPpF+?=
 =?us-ascii?Q?LqO5ZIIc5euWQCcTs9yTRGd7l6VkgcrIQUd2Yh+pHir+5RpvJirDaxMiaSqa?=
 =?us-ascii?Q?75JbIFh87cepZY+xL9JqRLIK+A9dOGvChvt/XWuz8PVVIz7uuJ87YdmwX1kF?=
 =?us-ascii?Q?n4NLI+sf7OBfCcDJIoD0NOFFN3/frX5S0jPggpF72OY5p3o8hoZzMQD2N2y+?=
 =?us-ascii?Q?pwOf8Q0/lejX3azYzbzxCO0GnZD2oNRPYXwbC9a6OtiEr3p7AH8rnL8CFz8u?=
 =?us-ascii?Q?wx8kcVloPR2FycG9bDJSNfvi3nSGNeg8mU2VZy/GJoGtQRXGMxVCCrhWC0wT?=
 =?us-ascii?Q?t4GJlBmcO8kpE6YpAIhaACpLxKC4V6uySlxsekAU1mH0ClRfAXz3pY2KkLY2?=
 =?us-ascii?Q?+IEgCp/d8kQRluZpAKPoQ8r6KH8iaI7h9cJyptmA7T/R6p2nmnUeA1NXVtVu?=
 =?us-ascii?Q?cgzRnYAUXQrK5vZxi127UCQXgw259WFpuOUO5h5DUGN91+q1lKeh+UJdxnqD?=
 =?us-ascii?Q?VEBlOKL93sbn8W7RW4P36skcWkruoP5k5g7nPislyag29Ckwqhn9KktYOHv8?=
 =?us-ascii?Q?M78QhwBLmp8WhOK+8G5nQHJvOcpVR1+uMf7pC/faMHUvhzUHNeAlVJnN9P2N?=
 =?us-ascii?Q?m58+lbYvRSP7CTRz/q7WbWmoFKIK2n/IgquzbQ3QSuq78JOXoaSvzqLQa2Cw?=
 =?us-ascii?Q?BBo5w5i9omGpNZfhff3wMAaXGXqFlcKTr1rmZz2HF1zXJFTUC7/MJFapVNPx?=
 =?us-ascii?Q?hIudK83E2a17nq0iLCL8e3wdN2EU1RyoodeYPW0aFaSu+WZCp3kiz58qjwfL?=
 =?us-ascii?Q?OSF6l8u0NZBN3WNQLg3XXnGtoFTVGyBzHgMl5tsAO4bkK0Ienk2CW7xao6Xo?=
 =?us-ascii?Q?FV9R06Ba48NnxS0LZ/3TjhSGd2qnRvJkTlcAOqhVjkQIqXehSq2qqHoKcEjC?=
 =?us-ascii?Q?7Vd0dkaNDl0hcxTFtGSDmwiPcHw19UstYByeowuJnvdRUBwI2kxCvqvi2eAk?=
 =?us-ascii?Q?62bNG3qQWwHGH1rrW0nGVqaZDM/8iq5D6CoK76wydxs4ctMmQqBakgQLLWaS?=
 =?us-ascii?Q?HRHDC8Vg9BGS+cgYgdv56OEUn64a0h7EmcjaZN1kz5xahnNQqfxNtGN9x6k0?=
 =?us-ascii?Q?rIyOppGmwwPHBBWxdB+m05Jj9KCUb9T9Z3JLQYX8iSBLZP8lcQjVn5NnBXv5?=
 =?us-ascii?Q?ZT2AXJYUr+7suPumJojJk5YuOyVLWSAhfPg/YfaJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771d55cf-08cf-41e2-845d-08dd0a361d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 14:09:29.0981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yhayLnj2Q0QM1wfUqk0cwKc6Y2X5qXQp4VuHgf8r5zLHqUkXcraqlTBjjmavzCvs3AOTDx5fC4VQyUSLeIPf8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Arun R Murthy
> Sent: Thursday, November 21, 2024 5:56 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
> 20+
>=20
> In Display 20+, new registers are added for setting index, reading histog=
ram
> and writing the IET.
>=20
> v2: Removed duplicate code (Jani)
> v3: Moved histogram core changes to earlier patches (Jani/Suraj)
> v4: Rebased after addressing comments on patch 1
> v5: Added the retry logic from patch3 and rebased the patch series
> v6: optimize wite_iet() (Suraj)

I think you missed some comments from previous revision
Add the bspec reference for registers added

>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_histogram.c    | 105 +++++++++++++-----
>  .../drm/i915/display/intel_histogram_regs.h   |  25 +++++
>  2 files changed, 103 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index a64e778fface..db4bc60be557 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -29,6 +29,37 @@ struct intel_histogram {
>  	u32 bin_data[HISTOGRAM_BIN_COUNT];
>  };
>=20
> +static void set_bin_index_0(struct intel_display *display, enum pipe
> +pipe) {
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_IE_INDEX(pipe),
> +			     DPST_IE_BIN_INDEX_MASK,
> DPST_IE_BIN_INDEX(0));
> +	else
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_MASK,
> +			     DPST_CTL_BIN_REG_CLEAR);
> +}
> +
> +static void write_iet(struct intel_display *display, enum pipe pipe,
> +			      u32 *data)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> +		if (DISPLAY_VER(display) >=3D 20)
> +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> +				     DPST_IE_BIN_DATA_MASK,
> +				     DPST_IE_BIN_DATA(data[i]));
> +		else
> +			intel_de_rmw(display, DPST_BIN(pipe),
> +				     DPST_BIN_DATA_MASK,
> +				     DPST_BIN_DATA(data[i]));
> +
> +		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> +			       i, data[i]);
> +	}

This looks more clean according to me=20
if (DISPLAY_VER(display) >=3D 20) {
    register_base =3D DPST_IE_BIN(pipe);
    data_mask =3D DPST_IE_BIN_DATA_MASK;
    data_temp =3D DPST_IE_BIN_DATA(data[i]);
} else {
    register_base =3D DPST_BIN(pipe);
    data_mask =3D DPST_BIN_DATA_MASK;
    data_temp =3D DPST_BIN_DATA(data[i]);
}
 intel_de_rmw(display, register_base, data_mask, data_temp);
  drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i, data[i]);

The rest LGTM
So with the above comments addressed=20
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>



> +}
> +
>  static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)  {
>  	struct intel_display *display =3D to_intel_display(intel_crtc); @@ -36,=
12
> +67,27 @@ static bool intel_histogram_get_data(struct intel_crtc *intel_c=
rtc)
>  	int index;
>  	u32 dpstbin;
>=20
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_HIST_INDEX(intel_crtc->pipe),
> +			     DPST_HIST_BIN_INDEX_MASK,
> +			     DPST_HIST_BIN_INDEX(0));
> +	else
> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
> +
>  	for (index =3D 0; index < ARRAY_SIZE(histogram->bin_data); index++) {
> -		dpstbin =3D intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> +		dpstbin =3D intel_de_read(display, (DISPLAY_VER(display) >=3D 20
> ?
> +					DPST_HIST_BIN(intel_crtc->pipe) :
> +					DPST_BIN(intel_crtc->pipe)));
>  		if (!(dpstbin & DPST_BIN_BUSY)) {
> -			histogram->bin_data[index] =3D dpstbin &
> DPST_BIN_DATA_MASK;
> -		} else
> +			histogram->bin_data[index] =3D dpstbin &
> (DISPLAY_VER(display) >=3D 20 ?
> +
> 	DPST_HIST_BIN_DATA_MASK :
> +
> 	DPST_BIN_DATA_MASK);
> +		} else {
> +			drm_err(display->drm, "Histogram bin busy,
> retyring\n");
> +			fsleep(2);
>  			return false;
> +		}
>  	}
>  	return true;
>  }
> @@ -69,8 +115,6 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	 * Set DPST_CTL Bin Reg function select to TC
>  	 * Set DPST_CTL Bin Register Index to 0
>  	 */
> -	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
>  	for (retry =3D 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++)
> {
>  		if (intel_histogram_get_data(intel_crtc)) {
>  			drm_property_replace_global_blob(display->drm,
> @@ -153,15 +197,26 @@ static int intel_histogram_enable(struct intel_crtc
> *intel_crtc)
>  	if (histogram->enable)
>  		return 0;
>=20
> -	 /* enable histogram, clear DPST_CTL bin reg func select to TC */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
> -		     DPST_CTL_HIST_MODE |
> DPST_CTL_IE_TABLE_VALUE_FORMAT |
> -		     DPST_CTL_ENHANCEMENT_MODE_MASK |
> DPST_CTL_IE_MODI_TABLE_EN,
> -		     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
> -		     DPST_CTL_HIST_MODE_HSV |
> -		     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC |
> -		     DPST_CTL_EN_MULTIPLICATIVE |
> DPST_CTL_IE_MODI_TABLE_EN);
> +	 /* enable histogram, clear DPST_BIN reg and select TC function */
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE,
> +			     DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE_HSV);
> +	else
> +		 /* enable histogram, clear DPST_BIN reg and select TC
> function */
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE |
> +			     DPST_CTL_IE_TABLE_VALUE_FORMAT |
> +			     DPST_CTL_ENHANCEMENT_MODE_MASK |
> +			     DPST_CTL_IE_MODI_TABLE_EN,
> +			     DPST_CTL_BIN_REG_FUNC_TC |
> DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE_HSV |
> +			     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC
> |
> +			     DPST_CTL_EN_MULTIPLICATIVE |
> +			     DPST_CTL_IE_MODI_TABLE_EN);
>=20
>  	/* Re-Visit: check if wait for one vblank is required */
>  	drm_crtc_wait_one_vblank(&intel_crtc->base);
> @@ -230,7 +285,6 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc, u32 *data)
>  	struct intel_histogram *histogram =3D intel_crtc->histogram;
>  	struct intel_display *display =3D to_intel_display(intel_crtc);
>  	int pipe =3D intel_crtc->pipe;
> -	int i =3D 0;
>=20
>  	if (!histogram)
>  		return -EINVAL;
> @@ -245,22 +299,19 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc, u32 *data)
>  		return -EINVAL;
>  	}
>=20
> -	/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL,
> DPST_CTL_BIN_REG_FUNC_IE);
>=20
> -	drm_crtc_wait_one_vblank(&intel_crtc->base);
> +	if (DISPLAY_VER(display) < 20) {
> +		/* Set DPST_CTL Bin Reg function select to IE & wait for a
> vblabk */
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL,
> +			     DPST_CTL_BIN_REG_FUNC_IE);
>=20
> -	 /* Set DPST_CTL Bin Register Index to 0 */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_MASK, DPST_CTL_BIN_REG_CLEAR);
> -
> -	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> -		intel_de_rmw(display, DPST_BIN(pipe),
> -			     DPST_BIN_DATA_MASK, data[i]);
> -		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i,
> data[i]);
> +		drm_crtc_wait_one_vblank(&intel_crtc->base);
>  	}
>=20
> +	set_bin_index_0(display, pipe);
> +	write_iet(display, pipe, data);
> +
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> index 213c9f483567..3fbb9c2deaae 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> @@ -45,6 +45,31 @@
>  #define _DPST_BIN_B					0x491C4
>  #define DPST_BIN(pipe)
> 	_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
>  #define  DPST_BIN_DATA_MASK
> 	REG_GENMASK(23, 0)
> +#define  DPST_BIN_DATA(val)
> 	REG_FIELD_PREP(DPST_BIN_DATA_MASK, val)
>  #define  DPST_BIN_BUSY					REG_BIT(31)
>=20
> +#define _DPST_HIST_INDEX_A				0x490D8
> +#define _DPST_HIST_INDEX_B				0x491D8
> +#define DPST_HIST_INDEX(pipe)
> 	_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)
> +#define  DPST_HIST_BIN_INDEX_MASK
> 	REG_GENMASK(4, 0)
> +#define  DPST_HIST_BIN_INDEX(val)
> 	REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)
> +
> +#define _DPST_HIST_BIN_A				0x490C4
> +#define _DPST_HIST_BIN_B				0x491C4
> +#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe,
> _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)
> +#define  DPST_HIST_BIN_BUSY				REG_BIT(31)
> +#define  DPST_HIST_BIN_DATA_MASK
> 	REG_GENMASK(30, 0)
> +
> +#define _DPST_IE_BIN_A					0x490CC
> +#define _DPST_IE_BIN_B					0x491CC
> +#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe,
> _DPST_IE_BIN_A, _DPST_IE_BIN_B)
> +#define	 DPST_IE_BIN_DATA_MASK
> 	REG_GENMASK(9, 0)
> +#define  DPST_IE_BIN_DATA(val)
> 	REG_FIELD_PREP(DPST_IE_BIN_DATA_MASK, val)
> +
> +#define _DPST_IE_INDEX_A				0x490DC
> +#define _DPST_IE_INDEX_B				0x491DC
> +#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe,
> _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)
> +#define  DPST_IE_BIN_INDEX_MASK
> 	REG_GENMASK(6, 0)
> +#define  DPST_IE_BIN_INDEX(val)
> 	REG_FIELD_PREP(DPST_IE_BIN_INDEX_MASK, val)
> +
>  #endif /* __INTEL_HISTOGRAM_REGS_H__ */
> --
> 2.25.1


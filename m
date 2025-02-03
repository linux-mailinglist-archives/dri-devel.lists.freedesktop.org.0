Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40636A252D1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8029A10E3A8;
	Mon,  3 Feb 2025 07:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQOR0tDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7E310E2AE;
 Mon,  3 Feb 2025 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566710; x=1770102710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=GQOR0tDoRLDGd/Et89TzgTGnFRY3UfDyfTvTApt83vj7ElL0n0stETig
 0hllKqpE6c+btEbraWzktR3Edd7twc9qLzZs0OKdPaLC4W12i+cg/LizN
 EqMFN8H2eWlMWci3dyVj/8gkUlOPkRvMUpIk2/0EPvIN+TgDhXdoE8Cbw
 luWUVqqfD5JwnF7OTtDF+EGuiXWbXzC4dfaRjetvrFC7mQX7ipYk+StcH
 YbZuLxlGd1EYeD6EZx+uzDBTTTvcH22zedXaTwEto1W6UX4olsGnNbc2J
 72hWhzdNGJBqK+UfRXq86RZRBd6lSFOXwUFu2DomxmmqtMU9PRfk3p2GJ w==;
X-CSE-ConnectionGUID: OeJqKUsETKa9kOxnLiikqQ==
X-CSE-MsgGUID: etkIeoAhTOm7oNNr2BzuJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49306249"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49306249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:11:50 -0800
X-CSE-ConnectionGUID: SRH2eUaASHmFKhP8eTfvXA==
X-CSE-MsgGUID: EadPXW8gT+y20jEsxLYSww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115188163"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:11:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:11:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:11:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:11:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBc5zjklqoBippsZUZJ5kG3/28LGu1OQDo/oLOiBwgE3NOd+7nCj/d2Mwzm/g5QFmh8HDrkRnGuvYaGupeZu8R+6uLmKDJAyhUsPl8ll+FgHw2uMhx0LymaJJWk2gKWqAJnQoChgcGTI0BFIqjbxrOrfr4DOl6rlCH2rQZHMa4czMj65TI6dEQmJt/hVW4QBylIhP3UBTYIZKV3uWKX+SrR2ztZIBYQfD4SA2rx3YIJlvz8zpjp2aYQP7mvNTMPCFJnjVcBGAQCb9PoUIlf72XUuP95HpZPYLL7y51nXtvnm3OJ6ZO3rtS6+EybXSMFKBCX8JU1QgfCP56xfNayisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=UK+QRacGL2nvZi56s7V8Lpa3lnYaxNfTg6etdh0CUAESe22K2zoQV5dIBgxXnEuxzPkrilu0M8AigC/OKYLsg/IXuvqUuwyNWHT5kVr8KWqyJ+m4SVVIzU6zw4UogezuJpq0WH/qVOv/w3d63lpkHDsHgaMCplcw6Zx59626XkGuNIzi4gYPmBL+gbCif2ig5z8jtbxh9WX2gn7y6pt+WiS5/ujorVQiUaewO7JtlAC93vrFk1mOsJ9JHhAU1Fwd0Yv9oxVPUmTfUuME+qdoV6e5tuoNrOsRSWODAlXzQCjnPJx6tMXmGDlAbD9VjG4bHnuq10Ys0AIBrQe5b+4NEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:11:26 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:11:26 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 3/7] drm/i915/backlight: Check Nits based brightness
 control for VESA
Thread-Topic: [PATCH 3/7] drm/i915/backlight: Check Nits based brightness
 control for VESA
Thread-Index: AQHbbiN37tAewJZ07UGFo7LNjpuQdrM1OVRA
Date: Mon, 3 Feb 2025 07:11:26 +0000
Message-ID: <IA1PR11MB73438E5B20F689F7AAACBEFEEDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-4-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-4-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 0d16a1c8-3df3-4581-f022-08dd4421f97c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?iklXPu8A0dGTtD5hGHrlp96FLrRGHcybUvMfPHXaW5s5b1LH5DtAKcCaQ5SL?=
 =?us-ascii?Q?VVT5To7wKNaKFNxujvEwDNTlVMXUCX7SbWdhwXaaDLTI2AUGwed/kY9CW/gn?=
 =?us-ascii?Q?aghZxaqGb2dDSetywxYpXFtHqVKCh1ylkrQ0GHHX2SxBxVccC81DLmk/G2d1?=
 =?us-ascii?Q?kBge34SRULmQ9p56SrWfb8yoURDSA7IAauYFsTzv8bmmH6W+fyDQmHJ0HKQX?=
 =?us-ascii?Q?aPloj8EHirtAZRhqhyr74IdJc+U0KnVjT1TbN7Bccxu24rflLYFRyWB5tKe1?=
 =?us-ascii?Q?LVm94Azv1AObGpKFb8KLAXjzQXrArdWBdTM4K2MVk7nYJZ4c3xeh6WX/BOmN?=
 =?us-ascii?Q?0T7jBAkOrUuaTtiWFs0aAz77XuZSemO+VVPYXOG5h9M+dF2FTpsLeYxjfY5O?=
 =?us-ascii?Q?Uc8VHoNb3UxKGAj/iYnpruF28z72Dv5Jh2qUSwuMV8aGA5QnApmv6qhIwUbK?=
 =?us-ascii?Q?cIv18DfpigKfL62krWXFiRwUW0sTFirdc4QxuAeT7KgCyw7V5HGfUjyuNO21?=
 =?us-ascii?Q?uU2hwPbRnrRXmJ6okIoDUrNMiu0oz2wFcvOTdqYz8MWYnqbBN5h9kma0FLBj?=
 =?us-ascii?Q?JIEpKJr7tvMtSxo0GBzNjyDttkWfHCBP+of4ekxfOTfSoedMcQqRrbPoFpe2?=
 =?us-ascii?Q?zmwGS0t3NozZrmEcxHvjd19y+cySUqPE10PpwA1dPjQyV2+wrPEbkq7SRMfn?=
 =?us-ascii?Q?ZHes89bWhla2PTlBkIk4OlLHmURMjO2lI1ICeuBAaptl9FaAFgu8tPabGgaq?=
 =?us-ascii?Q?CHW0uOGk97K0VmdaC3cC6BLkMCwRM9PtGviBcsRWz/CdnOh2uB77m+rziOA1?=
 =?us-ascii?Q?SP6YJA0WTTphELk1zIzbjq6hCqqSgq2KiqTbQGi6U89lkzDbLq+uqJoHQcmb?=
 =?us-ascii?Q?0mFFb9EPJ4oP8745GIUXO9hj5hns1e99vRUnCRmD8xrdI4osARDYzZ6I9YBu?=
 =?us-ascii?Q?NI5UHTmvQP2ngUsdAuM5RDJkji9T802ZNMzIv5zfWErO4zZ54dgQwqvoWL17?=
 =?us-ascii?Q?Q3WpDLMXinwJs+H4KdZx3je2qb8HXiFzXDAnexIOvSwKMDmFrWWKyg7pDqta?=
 =?us-ascii?Q?SlyUk1vPBMrXXStoxLprl9QtyPF4ShEKZteFvdZDUYS4CowrZSPN5aoUhDER?=
 =?us-ascii?Q?LRb5FZk862gSpF5+gNUZw7B+hdK5U/o6wutCjh4eRTEdhJGzyHX+9mI81NZt?=
 =?us-ascii?Q?NxBk8FRWnxrYZh8/9A1wMy3ir1pmS0HhLVOgZBRuoCJtArOvx/pBkVZ0jV0P?=
 =?us-ascii?Q?OcjZB+y+Qdstb4gAzcABh/1WKG/F0XfjsxPaY824+TX/r33flaKKWt0sT1Zw?=
 =?us-ascii?Q?8v0EglVuwVmpiUpwoQNVC6W4jLPrpasyOUM74uXe0wpp9tKy3DOh4GSECQ/S?=
 =?us-ascii?Q?mCslsVunpJP3QPHe50zOE27jn/h+tqQFv1sQoi4+3pbitTF13/C3U+MmdAal?=
 =?us-ascii?Q?QH0EZ6fBI7Y9SlNJCLpYdpQHBpgwkd3s?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tE4733LlTHDp8kqvHn29bB9XfZus2O6XlONaCTaAZgns7B5ampghErVbFYnB?=
 =?us-ascii?Q?wZlfIp/kxviHREoWBWaOmpouKMn8tqJL4ECLysexvm96EQeTCquTYWd/AAVS?=
 =?us-ascii?Q?sHTQbnvl+6jI9NgD4G4SmVrR1t+7DiBdYCn2DX63EpDcgLAYiUTB2GycScfp?=
 =?us-ascii?Q?iy+yD6Xe899wb7RiG0EZpeNKxoGlTFX/SVx1IaBNvz/OITkS879PwiKRQWW0?=
 =?us-ascii?Q?SXvSI49B5DSeo/ZlmZJiXIb8mbfEL4vUh6fsJgwVEBvkU276twTGq4dx+q5O?=
 =?us-ascii?Q?dgt2/dlMlvVtUgFdm/2dZnElJOiH80egnLl7msaEUYuXnbY4rXNs9c2qvmDb?=
 =?us-ascii?Q?D/Ga360VWl2MWUxTiiaLJ3kwtW70Zne9jfLEzajQr7zKMZ8ldN318HLm/cdt?=
 =?us-ascii?Q?C5jCh64thbJ2R5db4mbo/WCJIPNzyn4Lb4DcNxk+ZfuZFKCh3u0kv12y4K3W?=
 =?us-ascii?Q?Vt/NuJ4WOJ8E3LjaqVIA74l2AevKEhUKO45abQ/cGWpgH4FoRAsvjPlDQLvU?=
 =?us-ascii?Q?1BH4PXX44XrE623QIfR2I+hxwBYbTDtvdncKdvOt+ulpQOoUOu1G77D8zhf3?=
 =?us-ascii?Q?XXG+Y3jg7ERHzrIupTraieTcg0EHyHOQZQlc5nHjmMmQEnsxhy7e8pVO+fC3?=
 =?us-ascii?Q?5STzx6T/Ak91X3W7U0Eq7INtNVdZnEgcfkZroI2IHIcw6p4cB9qcyPylGX1Q?=
 =?us-ascii?Q?UvN3bg+E9zb9Ko6jbyiIsMF3+Z9/DfKvKeBF7bbdnHmhw2JGu17iVDZ4iSc4?=
 =?us-ascii?Q?W48fzl7UxgzfTCrSQvfkky1wY9/S6HbxU344WcG6G5PKR5vy7gtu+wC0zNGG?=
 =?us-ascii?Q?bfU6gP4eRiSlalhZ3qNKYpKSuxaFakqlcdCIjgdV2eQtOERmADljsIHxBAni?=
 =?us-ascii?Q?x3Ashw6RA/pHAKeB+zLw4csMSty6leR8B5LBLWqSQWnq5WHU7L9nVrN7DuBm?=
 =?us-ascii?Q?LwoFTO/2JpRNJhFdNmuLJsJ44kyccB0OeoL6bFhKnLtjlWprObArtVaGbls8?=
 =?us-ascii?Q?cSTZvZo/leMVSHonQ7TfLcGiPVwj6y6Cvlmj5RdgPGpP3hPR7S4A5e2Gzs8y?=
 =?us-ascii?Q?DJ1cYnI8atsl6q7zidY7io1ProoUtdROKqGhoObjSdMW0xabVudhg+owi9kd?=
 =?us-ascii?Q?KmsILXb6Tc8H0MoKXCz9lcgG4pgXJfgu1n+DR9im6TzvcRQuLx5++VMgER2L?=
 =?us-ascii?Q?P0SL672Fh9C8LjIqs1nxxJXO80eyYrhvng8s0SqiBY8CLGGpifhDe46NtWSI?=
 =?us-ascii?Q?JMtdYBdIbXN0/B8UGI45gN5q78nDK5EIrRqVFIXFP1qg05SDDFeVJzxfT7nd?=
 =?us-ascii?Q?LT1XFXKusP8hvrhkWn1jz10YRn1TbxC4MVPACysBob0SZpI58WbW18tBXltY?=
 =?us-ascii?Q?lsaKZoOtvMTiCH/nLKYStt0Q+1WHl1aNN8A62soL8hqKDoXuSaTUWCP1eMOH?=
 =?us-ascii?Q?x6THTXw3kgdN2ZpDNDlbjEBa9cSpcI4Otc0uol5hYsbAutB67pibA4MIrV6d?=
 =?us-ascii?Q?vew6z0jl2Aax/rPZZhdariApQcLIiyGKSfRn6erG7CgIG7HDJB9skFFC45BY?=
 =?us-ascii?Q?afsdMUv6U40W8PPKaLw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d16a1c8-3df3-4581-f022-08dd4421f97c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:11:26.6569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmO2XjDtm+JQXWpBRQlsavXXenXgcZLmISkOBpD1LkZ/gL4SqcAJ1+0B/F1AhKeBnPFXz6PgXICd0A7u+oLM7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

This patch works as expected with 6.13.0-rc7 on Dell Bolan.

Tested-by: Ben Kao <ben.kao@intel.com>

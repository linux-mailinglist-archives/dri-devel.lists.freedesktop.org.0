Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A34AC474E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 06:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C614510E3A1;
	Tue, 27 May 2025 04:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bApd20fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214E10E0ED;
 Tue, 27 May 2025 04:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748321827; x=1779857827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aD5f0ngU0aAah48scu5UgIgt+9WBi9rWjhMLYQ7xxuA=;
 b=bApd20fcuAo/WdjJ0Q2fRpsY9/pbJVRb50LVsaLmnKS68jvYM8eyxcLQ
 3AV7m1jfDooz0MPdKP/5DHsvyb2njFKts0wYkt2OjnBlk5RKTtm+T87D3
 4h6SFD1rbFV88CRDCk7D+7yfdScOJdddtOPeishVNxz2PkpTbfZVFsmkG
 8IcST8Jh4DggV7ukm72BC+zPlfdDmPPo1Zr/eygfyD7MHGMxRDp6irEJx
 ANGed8POlJ1IOv2V5auY1CuxiGTb7YKbNl4QOTRglJpP6x8U65zbrqDdA
 DThPUfdxddIrEvdtEafZzxC3qioxQF+t1pa2POYAsvRSaBp7r2drZ4DCB g==;
X-CSE-ConnectionGUID: 8ShLrPdMQ8KvOovnmdGofQ==
X-CSE-MsgGUID: 9Lfep6HHQf+9zrQ7rHnSEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49994487"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="49994487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 21:57:06 -0700
X-CSE-ConnectionGUID: rrRDdwp0Sm+VF/AQ+3ikbw==
X-CSE-MsgGUID: GSWrEiypQDeFNPC/ohO/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="173575062"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 21:57:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 21:57:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 21:57:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.76) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 21:57:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMuKvLTWUupETUCwzLoR32DuTK190YJFEEpWlYgutm04lCdkiremcFVixpb5QPp/p5gHeyAr6Jla73M0eKEo+Z1pz5Fjg2fdP6IiOUFKcZNj+pLkCCJKJNUieCQjKq8cV6WG3aL1678ag5Ah1g6biKJOd7OJqvoIFC2hukJnmxpveeZsrUIyih+AQ4RBxBKgnaBn8mywWh2l4NIRvGAvp+sgJiNuuJdOAdNs3Zn6BYW1+fZKiG8SB4P+XSdiFWoPFZzsgKGARr66HBgXBVQGbDUMhUZc8hoidkHvlVmaMyLjtYI30H2Xjd7i5bsDyIvso4OM592C9+HQjkpdqGR+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEm4dlEjrM+2uTyxNsw1gzWJk/GjU2fgNCePQ41k7BQ=;
 b=kOj9qBSCPyJk3jrNIW4XUypt1nPZM+uNHv+jxWpjFxvnIg2BOdBAoRClftXDny+rITOwfl/rzcXwSPqQg+7h+Co9lOP3hbyOHezDxK4LNCNRDKppT/kBzBxjZNI9p0Z0qfFxJI/aTylb2u2OaKg6dSpdj+3OuepXTzd6D+t48C8mJfQeLvfC5vkXsLm4LXPqfNXwo0I6clGUqnH6vqbSkTuv5aDBKZ4pAjfMVEZgC6sb7OqfRcBOZZ2lD6n8njTdhd6HxxwMUlnOUHGhsT71PAt0w51nPbOAHD9FeAgxIOIupLm43SZm2ALEbkWDBJJneAReA2p2jX6ey25i+bitWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Tue, 27 May 2025 04:56:49 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 04:56:49 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 05/10] drm/i915/display: Compute the scaler coefficients
Thread-Topic: [PATCH 05/10] drm/i915/display: Compute the scaler coefficients
Thread-Index: AQHbyLoIW0yzM1EVSUuyUMSOUtEhwbPZ6EIAgAwLkzA=
Date: Tue, 27 May 2025 04:56:49 +0000
Message-ID: <IA1PR11MB64679BAEF631971598D684A5E364A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
 <20250519122644.3685679-6-nemesa.garg@intel.com> <87bjrovk3f.fsf@intel.com>
In-Reply-To: <87bjrovk3f.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|DS7PR11MB6199:EE_
x-ms-office365-filtering-correlation-id: b7be0a90-0bfe-46ca-4912-08dd9cdae3a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wHk5mgofSrfB5Hxo2tFZP+AueWTVQWVoDF+FqoU/T2fQzKiTev9LYSSdL2Ab?=
 =?us-ascii?Q?qMe7/0TCBwcHpLoE3z2DyMSl+B4zha7jN8UTrsyNiXCtGBcUdWNV1ZbF2cad?=
 =?us-ascii?Q?2b7IFwfNP2gIdYKgyR4u16hQIixzO0UIfK2LgBVIfAYxVdDP8/T9o28ZSct8?=
 =?us-ascii?Q?n08CDoXpPmHGCsx3GEEl2mMmEB4sJWmRQYcDMdKljqfOiB+FT5sU7yYi+itr?=
 =?us-ascii?Q?tyOM2+BAanpOJtIsEP4T6vzigSnW86++sZhFAf5VsoLMal3aEeQddh0qrXVz?=
 =?us-ascii?Q?6/JBkcTOK99ye8V3UhLwHve7+C92DV9Dn5Oi0yF+E7OvRGGWSCieS2+bx2ri?=
 =?us-ascii?Q?WxttF8u5qQdPWqryR3N5ArdPk9tYgZgDeaMhfy5PgFpCB9E0/qvUC1lGxf9s?=
 =?us-ascii?Q?ErYsVt4x67OnBOa+6IC2i6RYv1sjmKgEQ87n16NXiKW6oy4W1PW6LAqBhn7A?=
 =?us-ascii?Q?xN/pQ1NVoyOJh/9EjtNMnoLTYqm28LmLuqXAt5fU8lL2/AWHYHzsjKMyrCtJ?=
 =?us-ascii?Q?jB3eb102QmNw4N4CcJzIw68hRMKLbzyhKLAAGTowu9KT0TegFrlKO/ZBl5ry?=
 =?us-ascii?Q?1sgUrwhCahjG7iWw/+NwwrSVYguPqXUUc2jPwnc0HwOf+fzMeOl8ivZjd4Rq?=
 =?us-ascii?Q?ad57T4VfUi6a5JqN/bWpIYaiDnP+1eVPK+8hGXDBjE7k//OjWI1SjDaboTTx?=
 =?us-ascii?Q?EC1LIQR0aepunwxghIVGq5Dz27ss97W9l+fe9CTzk3F0GnRcvxpAuuICf/Va?=
 =?us-ascii?Q?NroeRZjJi7XBodYk7Jykfi6C4LyPSkwh/fJ00phzneBIyKGcREQMokgha6Ft?=
 =?us-ascii?Q?BBbc3N6BFzFTsTzZUeeYXBt4Xck190cZi588andj19Pg4EgpS2DSHo0zmL2d?=
 =?us-ascii?Q?splxEoXrUIxI19cGBitTUjF+Pqt4G5oVcPLJnr5eQeDkROJawQDje5ZaZekZ?=
 =?us-ascii?Q?HsnBe7vvK7wczHFxK7Lif47qJdWD/mLwfkTToN4jWZJJWJoJCntfWlFLl2v/?=
 =?us-ascii?Q?g7y1WBaCrKLQ5EnrrFEqF0ViSs2W3xV6MDIQJ3DEhFZLc6bB1uzrpD6qRy4V?=
 =?us-ascii?Q?WlzWHDXCM1HlkWDauwwx0+nK276uLPvxafxS09ZgjWdkdXeMxAtM8ER6+gLW?=
 =?us-ascii?Q?LAHYYZJkGsoG7yax1zqpaxbxSekEzZGxLOvNfUsAby1lHWfbVhNG9HMGEZLE?=
 =?us-ascii?Q?wnek5/ABK3lGtNr4zCfO4Z5AFjiTp6+UpxfR8stSmMJ11+THopIu9nWPhrGf?=
 =?us-ascii?Q?mWznqLgwkYyoXnL69gjKwb5fL61WeOpivQLXu0a2UNFuGwJ1ruIl1W+rSIJx?=
 =?us-ascii?Q?2u9ZBFufXw0TXbVnmFGNb7hIQpjuo55WcY6VvOsJumnodN44lzZ3KGpRDgbI?=
 =?us-ascii?Q?LHnqzB7tPilDDfPzQ/Po8vcantHJDJ8V5YhLYo5Tp4nWYie6WEFvTvpSz7X4?=
 =?us-ascii?Q?4A8wEvsPFKbmEpLqPA1cmG/MyR+z7MH0zrm6Umrba7NgF5D4f33P0A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DJv72LW0xz/BzHLC0YE5/5jXK1nw94ecR1ur35p2b6SOqXs2UHjdudpji7Oa?=
 =?us-ascii?Q?MW9UffN0HofyAhqNmkhmNrmP62UFN7YabTjWCptfFQZUv+yUC5cPw3xF9dme?=
 =?us-ascii?Q?cZ1EiTD4NAPwOQM96YhmyzQPub1GdhwXCY5w+3RNXzEEoaCiE1JIX3wNxKB8?=
 =?us-ascii?Q?8DOAfxOC+qpSm3nypIjsJ5VIiPJbTXXKPCV9rA/e6nzM75NFVqzs64Ex7Fii?=
 =?us-ascii?Q?GbOtFEQhOmxvMxrmEGp48YqDXVYjDDri6uta6XQQE/vnKVYCjV2n/a7lkT+k?=
 =?us-ascii?Q?l/9J7enQTJulvLuTXV/JQYZu0rfPlc3mJnmg9OglR+YSYWsaSSFJsRHCV5uS?=
 =?us-ascii?Q?rTE8kEHmOvgBk/qASKlKY2sxLdFVR2gm3sUsXMtXAddTCfVWS8jG0p5UTHq4?=
 =?us-ascii?Q?KdFVbl2OGLPH8ODPo/HBJFEXEzYZ2MzHCsqoYq6HuOUAE3bRznAywrY/lTl5?=
 =?us-ascii?Q?6+KijGCN9enBg1+vdlJCjhEuGzi+Sw2GyeP48WWm1gFZLkfWJnozP5Oz/gPC?=
 =?us-ascii?Q?z2yFk5Q8cVg2QLwcpZOG20+HI1DruEvdCOZNwt/wmKkKCCovyhI/KfEeEfGF?=
 =?us-ascii?Q?DrRAF3ui3uB7u7fI1uKikC9FaG/jFKxWlqmrcRydqP6zpYULcGydU04U5zt6?=
 =?us-ascii?Q?kQzR7mqki4eFtGaMa1UM5ZJKsrOGn/IUAgwlM1nhPVuynn/6xp5o6DIhE+i0?=
 =?us-ascii?Q?7ML1Z8jE0NKVmHzP1K8mN+BPl0SEu+GPytP5xufZXl/h3IelIaVsbTw6tzYT?=
 =?us-ascii?Q?lPamzMEy5YI3ltXc1zmluOyxF9aiUU1AypazoGdcw7iPPrndFwTZYTFZGsi9?=
 =?us-ascii?Q?lA2QYKCbL1sXnjP4VoFyWFadCOu0Lri8H20QwXPDLelC9L83f9/3NS0B5Qz1?=
 =?us-ascii?Q?9oK2lCT37FF5ZKTrKN93KYgM37zOJ35jE+ssD2Ph4Gi6NLDEMQ+k50BC5m2J?=
 =?us-ascii?Q?ANPqrnKMXdXeiH9GfjofB/amKtj89oDLpAS327F6OE9Crivoq4OPHJTLMKOf?=
 =?us-ascii?Q?RrOpzzZlnK/hmm882cp0YjcSPk0uumZUx6+jDbHqRr/Xuebf7z2ewlEYeivJ?=
 =?us-ascii?Q?xA5MLr096jcNALCVOF5HcDRvcYoBWb4w9v3eSeYQVAyF2xsonb0LOQ7zk++u?=
 =?us-ascii?Q?ugQ+rD/PE3M3D0vIhCH1dB9Ul0spo6IL1rIzx+A0jmSnMgtEb4C3DSg+TIha?=
 =?us-ascii?Q?ibAVy+SPfDWgPOunm5dobn8/1PztskegXdqfr8kUFiRUuWq+3JjNjGu4jp6/?=
 =?us-ascii?Q?p1E7g0vKGeCJQ26JC3z76CB9Fupf3M3aAc8BRoEZn9wT/7VtuGjvRaaq1RAd?=
 =?us-ascii?Q?RxrbQueuks2hc080rUg7xYG9PR2Sp44vRD/0PntzCQiwHmJDhAB/+bPPIYTN?=
 =?us-ascii?Q?eq4XMvC3rDlNkL5BSbNVWAskBTSjOwcTD7ykJS7eRQAy8UMGcuPeG6ketTvI?=
 =?us-ascii?Q?z/J5Plb/i4cEP3mM+EaEN9Eg2pBFTVQAq/454UmQg6YSy/V70rj2/LoyCaBB?=
 =?us-ascii?Q?w80LIKpqulfHpDBmOANHW/NLfy1Tckb8MA97EJOWDWc1vqTnNvAdCcM4O//u?=
 =?us-ascii?Q?0++9M+7dLvRQ6ZFUMELMrHX8/HtrZJvZ+bmJ65MK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7be0a90-0bfe-46ca-4912-08dd9cdae3a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 04:56:49.2020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CH6ThKHsVOXb73/8gidmgAHZYY2IMGCI1gMIa/kkwWHRJP1Ns98KOSRt7CBq8zk/RizgAZIVMIHb0gBhUF8Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, May 19, 2025 6:22 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: Re: [PATCH 05/10] drm/i915/display: Compute the scaler coefficie=
nts
>=20
> On Mon, 19 May 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> > The sharpness property requires the use of one of the scaler so need
> > to set the sharpness scaler coefficient values.
> > These values are based on experiments and vary for different tap
> > value/win size. These values are normalized by taking the sum of all
> > values and then dividing each value with a sum.
> >
> > v2: Fix ifndef header naming issue reported by kernel test robot
> > v3: Rename file name[Arun]
> >     Replace array size number with macro[Arun]
> > v4: Correct the register format[Jani]
> >     Add brief comment and expalin about file[Jani]
> >     Remove coefficient value from crtc_state[Jani]
> > v5: Fix build issue
> > v6: Add new function for writing coefficients[Ankit]
> > v7: Add cooments and add a scaler id check [Ankit]
> > v8: Remove casf_enable from here[Ankit]
> >
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_casf.c     | 120 ++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_casf.h     |   1 +
> >  .../gpu/drm/i915/display/intel_casf_regs.h    |   7 +
> >  .../drm/i915/display/intel_display_types.h    |   8 ++
> >  4 files changed, 136 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_casf.c
> > b/drivers/gpu/drm/i915/display/intel_casf.c
> > index 6dab67eb77ab..f5ae5e1efbd5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_casf.c
> > +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> > @@ -15,6 +15,13 @@
> >  #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)  #define
> > MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> >
> > +#define FILTER_COEFF_0_125 125
> > +#define FILTER_COEFF_0_25 250
> > +#define FILTER_COEFF_0_5 500
> > +#define FILTER_COEFF_1_0 1000
> > +#define FILTER_COEFF_0_0 0
> > +#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
> > +
> >  /**
> >   * DOC: Content Adaptive Sharpness Filter (CASF)
> >   *
> > @@ -38,6 +45,24 @@ static const u16 sharpness_lut[] =3D {
> >  	73, 60, 48, 36, 24, 12, 0
> >  };
> >
> > +const u16 filtercoeff_1[] =3D {
> > +	FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
> > +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
> > +	FILTER_COEFF_0_0,
> > +};
> > +
> > +const u16 filtercoeff_2[] =3D {
> > +	FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> > +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> > +	FILTER_COEFF_0_0,
> > +};
> > +
> > +const u16 filtercoeff_3[] =3D {
> > +	FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> > +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> > +	FILTER_COEFF_0_125,
> > +};
> > +
> >  void intel_filter_lut_load(struct intel_crtc *crtc,
> >  			   const struct intel_crtc_state *crtc_state)  { @@ -
> 107,6 +132,8
> > @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> >
> >  	intel_casf_compute_win_size(crtc_state);
> >
> > +	intel_casf_scaler_compute_config(crtc_state);
> > +
> >  	return 0;
> >  }
> >
> > @@ -129,3 +156,96 @@ void intel_casf_sharpness_get_config(struct
> intel_crtc_state *crtc_state)
> >  			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
> >  	}
> >  }
> > +
> > +static int casf_coeff_tap(int i)
> > +{
> > +	return i % SCALER_FILTER_NUM_TAPS;
> > +}
> > +
> > +static u16 casf_coeff(struct intel_crtc_state *crtc_state, int t)
>=20
> The result is stuff that gets shoved into registers. u32 would be in orde=
r.
>=20
> > +{
> > +	struct scaler_filter_coeff value;
> > +	u16 coeff;
> > +
> > +	value =3D crtc_state->hw.casf_params.coeff[t];
> > +	coeff =3D SET_POSITIVE_SIGN(0) | EXPONENT(value.exp) |
> > +MANTISSA(value.mantissa);
>=20
> Those macros return u32 values. coeff should be u32 too.
>=20
> > +	return coeff;
> > +}
> > +
> > +/*
> > + * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
> > + * To enable casf:  program scaler coefficients with the coeffients
> > + * that are calculated and stored in hw.casf_params.coeff as per
> > + * SCALER_COEFFICIENT_FORMAT
> > + */
> > +static void intel_casf_write_coeff(struct intel_crtc_state
> > +*crtc_state) {
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> > +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> > +	int id =3D crtc_state->scaler_state.scaler_id;
> > +	int i;
> > +
> > +	if (id !=3D 1) {
> > +		drm_WARN(display->drm, 0, "Second scaler not enabled\n");
> > +		return;
> > +	}
> > +
> > +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id,
> 0),
> > +			  PS_COEF_INDEX_AUTO_INC);
> > +
> > +	for (i =3D 0; i < 17 * SCALER_FILTER_NUM_TAPS; i +=3D 2) {
> > +		u32 tmp;
> > +		int t;
> > +
> > +		t =3D casf_coeff_tap(i);
> > +		tmp =3D casf_coeff(crtc_state, t);
> > +
> > +		t =3D casf_coeff_tap(i + 1);
> > +		tmp |=3D casf_coeff(crtc_state, t) << 16;
> > +
> > +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc-
> >pipe, id, 0),
> > +				  tmp);
> > +	}
> > +}
> > +
> > +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *=
coeff,
> > +					  u16 coefficient)
> > +{
> > +	if (coefficient < 25) {
> > +		coeff->mantissa =3D (coefficient * 2048) / 100;
> > +		coeff->exp =3D 3;
> > +	} else if (coefficient < 50) {
> > +		coeff->mantissa =3D (coefficient * 1024) / 100;
> > +		coeff->exp =3D 2;
> > +	} else if (coefficient < 100) {
> > +		coeff->mantissa =3D (coefficient * 512) / 100;
> > +		coeff->exp =3D 1;
> > +	} else {
> > +		coeff->mantissa =3D (coefficient * 256) / 100;
> > +		coeff->exp =3D 0;
> > +	}
> > +}
> > +
> > +void intel_casf_scaler_compute_config(struct intel_crtc_state
> > +*crtc_state) {
> > +	const u16 *filtercoeff;
> > +	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
> > +	u16 sumcoeff =3D 0;
> > +	u8 i;
>=20
> It's used for looping. It's an int.
Ack
>=20
> > +
> > +	if (crtc_state->hw.casf_params.win_size =3D=3D 0)
> > +		filtercoeff =3D filtercoeff_1;
> > +	else if (crtc_state->hw.casf_params.win_size =3D=3D 1)
> > +		filtercoeff =3D filtercoeff_2;
> > +	else
> > +		filtercoeff =3D filtercoeff_3;
> > +
> > +	for (i =3D 0; i < SCALER_FILTER_NUM_TAPS; i++)
> > +		sumcoeff +=3D *(filtercoeff + i);
> > +
> > +	for (i =3D 0; i < SCALER_FILTER_NUM_TAPS; i++) {
> > +		filter_coeff[i] =3D (*(filtercoeff + i) * 100 / sumcoeff);
> > +		convert_sharpness_coef_binary(&crtc_state-
> >hw.casf_params.coeff[i],
> > +					      filter_coeff[i]);
>=20
> Are you should u16 is the right type to use here?
Here I am using 16 bit value and further combining 2 16-bit values to form =
32 bit value.
>=20
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_casf.h
> > b/drivers/gpu/drm/i915/display/intel_casf.h
> > index 80642809c08b..381d5e10c70d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_casf.h
> > +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> > @@ -16,5 +16,6 @@ void intel_casf_update_strength(struct
> > intel_crtc_state *new_crtc_state);  void
> > intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);  =
void
> intel_filter_lut_load(struct intel_crtc *crtc,
> >  			   const struct intel_crtc_state *crtc_state);
> > +void intel_casf_scaler_compute_config(struct intel_crtc_state
> > +*crtc_state);
> >
> >  #endif /* __INTEL_CASF_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > index b96950a48335..f8c3c86f2949 100644
> > --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > @@ -30,4 +30,11 @@
> >  #define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
> >  #define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK=
,
> (x))
> >
> > +/* Scaler Coefficient structure */
> > +#define SIGN                           REG_BIT(15)
> > +#define EXPONENT_MASK                  REG_GENMASK(13, 12)
> > +#define EXPONENT(x)                    REG_FIELD_PREP(EXPONENT_MASK, (=
x))
> > +#define MANTISSA_MASK                  REG_GENMASK(11, 3)
> > +#define MANTISSA(x)                    REG_FIELD_PREP(MANTISSA_MASK, (=
x))
>=20
> I think the macro names are way too generic, and likely to conflict with =
other
> headers, in the future if not now.
Will change.
>=20
> Please define these as part of the register as described by the big comme=
nt at
> the top of i915_reg.h. Please do not add comments or vertical space in
> between. Please indent them. These need to be attached to the register th=
ey
> describe.
>=20
> > +
> >  #endif /* __INTEL_CASF_REGS__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 3a2e2bdfd356..3de4738f4080 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -935,7 +935,15 @@ struct intel_csc_matrix {
> >  	u16 postoff[3];
> >  };
> >
> > +struct scaler_filter_coeff {
> > +	u16 sign;
> > +	u16 exp;
> > +	u16 mantissa;
> > +};
> > +
> >  struct intel_casf {
> > +#define SCALER_FILTER_NUM_TAPS 7
> > +	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
> >  	u8 strength;
> >  	u8 win_size;
> >  	bool casf_enable;
>=20
> --
> Jani Nikula, Intel

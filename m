Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4DBCF2711
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 09:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECF810E146;
	Mon,  5 Jan 2026 08:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AymyOdng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5803C10E146;
 Mon,  5 Jan 2026 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767602011; x=1799138011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5jHCLd6oZOhWp/jfUZJTxGR3480A7F2tpGW8ezxWWdE=;
 b=AymyOdngQbtBkK5ChU0nWsjJfwX0TCNV0/mBrttvr8GEc52Wg+HmG0tR
 265gqPPrfBgkD+DbzW7eqrw1fauIk+we9NcMcYOfSnRdUHV08Fj6Cu5oc
 Lb2DWE0DFHZmZEwrRH+hPWNh1JEVoaJbXQ4yJ6Cp+I3zyEaV0OG5A3VK6
 ho8p8E5odu0i45nUlJ1psfegf3oLu+tDy6x9dIS355yoG6OJOG0M1BAF4
 jC/MPOTdtJgeosMooWj+F6W7kJkiPQxmF4Yh6lpnXceL3TBr/ps3TMf30
 qHWL+w0IlliE++SC3u8108dNtS4/jnkCjSTapm9LAInr4M7GYQZVQ5GPx w==;
X-CSE-ConnectionGUID: kQq0fm4SQs+xQYw78EOeHg==
X-CSE-MsgGUID: QpLJ4pI7QUuFSk6t6DpSoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68898117"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="68898117"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:33:31 -0800
X-CSE-ConnectionGUID: B72Ec/XoQs6XdFavPUJBFw==
X-CSE-MsgGUID: BWw1tTBYRgaCK3QYDJez9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202809138"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:33:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:33:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 00:33:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:33:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4Bl6aPpUTHdXhwUDPYwsw16bPDEUtbcX+GtvdC/T8hFGfwR1DGlGOi9H9X3ESMyS/tf+qDMzstWurwgoYaAujBpBgLOomYHuzsSxnyb0Qj9asksC9Ww49IRjgd/GMwGc0b9q3jS6QQRBaXW8h4a556JSmuFhHY170lU+RofM9XgB195C1b75j1PsNTDM/57ya8Kg8ov8CVbWKO1O6s5zoMdo52qCGQlaW7oZL6fpFS216QmZ90Ov1UvF85FKgB+hijSWrJMs1wKczEw777yP0kgTcSedYGvr0bqwedHTN2UvQnUYKhiQbJqzq0e1hw+FZkhTls6gGlYIyI+0BWiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lGlvdbBFiBjfVPFLkvaouSAQxiGw/OTKJqkOQ1pRP4=;
 b=wXF/ux48N5XSPNyHZH2lD0q6vzW5X6zIktqUs/jpRgJnGeD1rlyzE4yOfMFoh1SAnpNexDyparZGfHucPI20IljHW7kuChspKC12bzTWfghPdGbdjKs9jrqMk3Mr/omeSCjldrKoLdxc7B9GY2Vy7m56XZnSj9vlroCpFzphZA1dx0MdwjmB7xwkn4kzFaLv+hsvWvWr1/gMZ5xqG+iTkQ5nwjwSvGhkgklKzG+xQQpekaFm3CBZz5Nz/ffC7NIQndjaMIxrsOjj3sVSK+KhbzFogYb93AoCDxqARDHhpXBCCDTm4amCvKAIRK89VA8hYzxRAJUwFM0SadBsL55/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA4PR11MB8990.namprd11.prod.outlook.com
 (2603:10b6:208:56b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:33:28 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 08:33:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 01/13] drm/i915/color: Place 3D LUT after CSC in plane
 color pipeline
Thread-Topic: [PATCH 01/13] drm/i915/color: Place 3D LUT after CSC in plane
 color pipeline
Thread-Index: AQHccLbuB2pOzhbEbk2LjdVzj+J4vbVDWddw
Date: Mon, 5 Jan 2026 08:33:28 +0000
Message-ID: <DM3PPF208195D8D971E64EC82E45627003CE386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-2-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA4PR11MB8990:EE_
x-ms-office365-filtering-correlation-id: bd21c9c9-2188-4b3b-1ddd-08de4c3519d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZFpqtJfZ21+K4Vc0Qzc6mMMoCYXWNUbfxxOQUvSShgqdj4olSIrL0PLJaBTP?=
 =?us-ascii?Q?1VD/AdDDp5FPyncJ1OfaWMs9TewpE3ZpMr+kr84DELAoD6RGxSLfHsZmzmld?=
 =?us-ascii?Q?Dah6g7TzRWXo5RR8elN0sDJ4QrrXib55bexUTRNfC+zblNZKaaiyIfoVJcxi?=
 =?us-ascii?Q?hfv+4yUD36l/MTnLiinlD7jO19z11csXT1bF2hO0iFiHMGf6aO1t8hZpkYPu?=
 =?us-ascii?Q?Zf6VNg3yuE4dOlegc7RrDRLBRTdreAtYIGAPkchR2ELVUQ2+pEoebtTS1/NL?=
 =?us-ascii?Q?gq8/YNDCZ4qsN41HDB6E1GMjaxsHi9PS//88LIVRiOoyIXV4zu1WPJ+bOBhC?=
 =?us-ascii?Q?xsH3M8EmNVtwk010XE+42VR43baqHQ1Me9LzGVO6GPKybLwM2tHdu4zsQZhO?=
 =?us-ascii?Q?PnYWz3BN+z5whulIUrMFz9i+iB4uXUE1D7i5QN5vYsWMHBEx5xqu4awMPdVS?=
 =?us-ascii?Q?h+QIpSUQXIcrRLxyze/pN6UsBm6pUTAvKFBIOFRTuJHFqfXqPUV7gGYnrYBi?=
 =?us-ascii?Q?jmHQ6bFL1q0eePU28W2QksJOEdgYjJf0VKvNFyAW84cfXLcMHZSeut79Rizf?=
 =?us-ascii?Q?awhQVZh13jSgP4xiLTLT33tJb/jZ8Z9+6X7qXHdejTxqr4JC1v7hu4KA8cGu?=
 =?us-ascii?Q?ulGYcTuhRgE87ubZIIya3VrBvSzzJWNSdBRK3+RrooAszb6K/Sc7c9cMo7XW?=
 =?us-ascii?Q?MEmdRpvpeT6yLCgURXHBVHbiRwMl3VaPx8T5YwSfXep3oFmQbaXUNROXAppC?=
 =?us-ascii?Q?NvQ7EwAQ4YsXIqIRic3J7n66Hrkouz5KjKYfyOIX/FXtNaOKRbGGtm6nZ+lX?=
 =?us-ascii?Q?+a/+d955h5P+yczjddsQY9DzBBh2BhD40ho/XV9CeNK49hmDDD7k18RCIc8J?=
 =?us-ascii?Q?dWqC/iGwhL5T8a8B5dBFGLs2cBQnysD0m38tXraBC+oLbw7rXOXab5CrCAMh?=
 =?us-ascii?Q?FLjKaWzeI6AaG048CDFDXMxrQOpHMqBA2OehzH1T3rrULl/CWZIsqVTBnprC?=
 =?us-ascii?Q?ABGtJPCSIpnoMI1Six/TlYmtbl8ZHpxqwZABFkIOuB7y9Xs1JayqYR29A0Iq?=
 =?us-ascii?Q?yBVOJRB2K6W1ds3vxxHORi0+iHXJJWHhIYbGIgATqPw8ScWQAQ6NUIyALgik?=
 =?us-ascii?Q?xkQ4feyYjvEE3/EvsicPAE5ntJgT+Iin6C+rF1u08Z4kBYYw9AsIJgyXdfl8?=
 =?us-ascii?Q?KgjwiF1/l+0LWaG03EbpTqqmx3/HaStXl+TsQeoO1LFajm7pD2F6qa2+5GdA?=
 =?us-ascii?Q?xXBPq6Hlo2t3bLOdV3RFoT2y7TflRrRTSNxSXcXVjahLDZdXSoIGlO/liuga?=
 =?us-ascii?Q?VKQgIQwgEePZcPRyr/L7ThvfkbmQD1V82xEMD1aVgfYTh7YAt+siI4BS7A8P?=
 =?us-ascii?Q?IIam6qTKDJsk5nP5zO4MjCriHK52UEHXztykSxnr147Vo2Sa7YPgS+SljI/l?=
 =?us-ascii?Q?h3GY74B9gbq7dvReKPpbf37nKewyygF13XEcPIRpcYBzPt0JfM9N1aUh9raY?=
 =?us-ascii?Q?410MAL1QTtMnVwIcj5SFEP0REQVKwHsfNyV9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YF9UQ0jzjw2EULSHH9NGDi7MkCfyhZ64rgTT7YUqbaYEEUYFbbegw+QZ0fHp?=
 =?us-ascii?Q?6ntXqixOVmD2WgPfosz/ZlaWDmqSROcyH21aRpBrAhQcPonVauZ73vYjVpb5?=
 =?us-ascii?Q?vcieNSerqjqv3PvIuIJSRslQsXq8GqduBW3GGcWGH9Rxu8EpiY3mtyQ8T4r3?=
 =?us-ascii?Q?PE5xNv0vZKMqh3q2LiLjISLm/cR/UKV7CWqJHRD8Ms6YWSTGeVtOLQcbaC9z?=
 =?us-ascii?Q?Ui7FNXYp3ZkKSfA1kntmHO43AYLSZ2t0sB+ftMMlHremWcecyhk0n3SG37BZ?=
 =?us-ascii?Q?wGFWs6fV/1q7iiSlpAil2vKtfZ5rONZYV8uFk9AehEvs+P+HtzDd/h9J4N5L?=
 =?us-ascii?Q?jGrWtvC7DAbQzoihkb/tihB+N/fNKZvAN75G9hCeALwfpfbv4oEKa65DGsB6?=
 =?us-ascii?Q?o21znH7bFzRUKc0AApJAkZ2pq/gY1BgdMFkSA/ii/eqj6u/nvz8qN+rxrSpf?=
 =?us-ascii?Q?4xKAIG3X5X4/tN6r6oP1W+9aJQsiRUm2UD3L/a+G+8FXq/1VqBKiM4vpQwc7?=
 =?us-ascii?Q?cNcnMhhQmuXml+ffIAxICiwPnux8OVzz+gM650x2Uo1/bnFbAw9efEFinptl?=
 =?us-ascii?Q?CmOZBjxrNtL28ROSD63IOO9/+8pAilr1aW4jR88rNqk1Vxj1LA+I3rwijZNp?=
 =?us-ascii?Q?/iDIhtU67iNNnv5Nbn+Xhvwdnep42yS9/DEbyPzuM8wZoRDf681x5Rdlk3s4?=
 =?us-ascii?Q?Tbnfe93uZAk//kKu/8vRwqJnzSJ31shCOL/0x0Y0rR3BPMoGtZ2oVzhH9PGp?=
 =?us-ascii?Q?S2b9j451TkLoteqeBhAACJ8pGfPGTq9O1S3vk9qtlhpKYgXpxrFXLvLq5YNp?=
 =?us-ascii?Q?Ggz0J2t3R4KApAxW51TR9Sy1OKM9Rghf6IVRxlkqYXzziLAfOBrfjA6Y9vFG?=
 =?us-ascii?Q?3mSdO5zUjvclxTRWXDCIAUH+V47hgQlyGurXJZaCQDZKX7Brjc3RdyRvwkGa?=
 =?us-ascii?Q?8M6TGuLCJ/kxbk7U9RrQGf3n4fXkcawAIFjJ+2LMZJB5pG0i5QPotLhxigfV?=
 =?us-ascii?Q?6ZKCZHUSPZRt3VENkYQ/dmx7j3MU0FvyB5vuXk3rsFI3Oepfr6EUyZpAqA73?=
 =?us-ascii?Q?MelX4jWaysWmjBk2q87DhNjvBjBs+3YKHKaxt6kTcJGlLYNV3teUDp32eiSl?=
 =?us-ascii?Q?si9wiImmugsnAXLn8QS7lXdWsvOiOTXp9ZiJkXhbEKGD4r8PgQUr5FFw+/Bo?=
 =?us-ascii?Q?eWZGPrfQQW4G0nY/bxx8dVMYWR7XE0ianO5fzzKmaAtR3ik2348lc7lk7lTt?=
 =?us-ascii?Q?X/3R1v185ryk2aIQv3gJiht2hL0Er+EZUxh/2sKHw/dwi+L0CbgTfCGhoKLv?=
 =?us-ascii?Q?gI1NpKYjU+XVtPcPWsa1Q/+kGpW1T5L4W3Vb43eJ6MiuNFWL9Mlh/c3X6V+l?=
 =?us-ascii?Q?eJyT4jnt6Hm8tbbnou95V5XqP7yv2dIbOp6cTuIQhPRyQlgYjdg1YkfW9c4Y?=
 =?us-ascii?Q?dIfBCLd3ROy5oe8IWtBQIQReknwSbwLcPP8o8G6Tj844p7ZrOhmr1V1++kgx?=
 =?us-ascii?Q?DSPF3/XMAxqem6iCb7wv8HKySJmYiBEAcwHDpZ/hIJ2pXMwhxkOI9JJxdeDH?=
 =?us-ascii?Q?FUVedDXMA2Dp6HbJQ7FJUYv0kGFKfxXKOizhk1PBXtKKL900HlGUNgc7/I10?=
 =?us-ascii?Q?4CFMnf2kyxSRbeShEpObPImVi6UqFnwYE7bk1Ws7KDK/HCZR7qnUjUMlwjo+?=
 =?us-ascii?Q?nBCME3bCeX7NQwqkCT8uugE0HU6BNA5COgA2OkJB/gXWbYfdaiaQomSuIMt6?=
 =?us-ascii?Q?iQ4GnrDKvw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd21c9c9-2188-4b3b-1ddd-08de4c3519d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 08:33:28.3536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDAQprqRVu9RY/GZ5BZwmD30T2bXWCdGGTey+od/WAVYVBvyBYlQ3JLWxQTvMoT3AUaIQSsdShi3wUeRR7n2zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8990
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

>
> Subject: [PATCH 01/13] drm/i915/color: Place 3D LUT after CSC in plane co=
lor
> pipeline
>=20
> Commit 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")

This line is not needed since Fixes tells us what introduces the problemati=
c change.
Maybe add why this ordering was incorrect.
With that addressed,
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> introduced the 3D LUT block before the CSC stage. This ordering is incorr=
ect.
>=20
> Move the 3D LUT block to its correct position in the plane color
> pipeline:
>=20
>   [Pre-CSC] -> [CSC] -> [3DLUT] -> [Post-CSC]
>=20
> Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../drm/i915/display/intel_color_pipeline.c    | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 942d9b9c93ce..684641c8323b 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -39,6 +39,15 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	/* TODO: handle failures and clean up */
>  	prev_op =3D &colorop->base;
>=20
> +	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +	prev_op =3D &colorop->base;
> +
>  	if (DISPLAY_VER(display) >=3D 35 &&
>  	    intel_color_crtc_has_3dlut(display, pipe) &&
>  	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) { @@ -55,15 +64,6
> @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
> drm_prop_en
>  		prev_op =3D &colorop->base;
>  	}
>=20
> -	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> -
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		return ret;
> -
> -	drm_colorop_set_next_property(prev_op, &colorop->base);
> -	prev_op =3D &colorop->base;
> -
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
>  	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
>  						  PLANE_GAMMA_SIZE,
> --
> 2.25.1


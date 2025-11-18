Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC985C68396
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B5710E157;
	Tue, 18 Nov 2025 08:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1u27wYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FC210E13A;
 Tue, 18 Nov 2025 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763454989; x=1794990989;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GHo2FNIfBdINwQox+sn3JdkQFhLDQGMOR9/vFzhyKPk=;
 b=P1u27wYUDwfhYeaoo68e8ADWPiy/kMxLvArM+5FByfWrvoBKOU6fVCSD
 w/dgW/rEWUAxCMQSJqptXcauXYLpXG6WcVWoRIWrZDZWn5J3TgxTxCllh
 Pbh4maLk4wD3B/d9DBeT1YOULLgOYJzTkKAAAQEOjcv+4HVAO3oa0AQ0R
 zKb0j6vwGUwLUzRTgsDHmHE5YzPzQhXaicUM9ReDK6Fv41NvpjTCZMgPk
 +RbsW0shCG4/aMESJWzlLkBYgWWbmO9KV/dW/RoS390eAieKWd5XUNoge
 9Czy5AOVVm/KmRAo2uPBxbhUZDfN3nJx5GZSMp+jHxuc8NbUurLZ+QxgY Q==;
X-CSE-ConnectionGUID: H0kXADrhSjappdY5blELMg==
X-CSE-MsgGUID: Wl8IjwtCSn2prviaCo7a/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75792091"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="75792091"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:36:29 -0800
X-CSE-ConnectionGUID: oPs9bIEFRjaiavUhxCSnIA==
X-CSE-MsgGUID: UjicLk66Sui6uflZl7nDiQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:36:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:36:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:36:27 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:36:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYy+SqhLXUkx6Lk0jrK4JHphr4ElE19UifXnbf4HWKzIVkrr/OIYKj25hroZfBLxXdnCOj5evda4dj5I12VUHRNI/Q2V2/rx0k1BQE5St4hYueV+1z2otL7Ppg3RtZu3mfK3p/uJ2OYa2FzarwHjHSh+3Yyd7CEZf8Jio5RhSM0NFWZ0JzDEsHqUN67ebSEcQ1FXWZm7cegn8ClJVp5+uAz1E98u0Dp58iohBEBI0p+x/VsXCh+vobi2KzXzuj8PVZGjuNJZZR5plbBNciAnaLVmpztPjHRNlhulqb8pvnkIsNkm4eN6MFlbP/MLwqfPVIO57qrHSTdq4lbhd+PVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkZr5aqdhXLAqjQeeFOuz7lHPmt2eQ7+nl07UXzQ9j0=;
 b=jbXOPM22LaMeXPytmTD41hDI+D/6d5tDyDMDoztV4L6wzjCvgkeecQhEU5P1QH9fIgU6sW9V42zkyaPy4KsIKKfUKNScW80JT0pcBPVXGevI3MvsG84x7J5ROb7VdJrVlmra1ws2JmgClbZFvflG/fBxfjfS05bxDyITPfrqcxu9v2rTyXRmVkMwd3iUFiJ3oLKMnIUCHf8c3CUSIQjS4K5Kx4EQRg+CjDi8XpU/f7KJi/ttTybIw0K3QxknkQX112m+GIkawYGZnRE+7Ovbp9jxmsINyM5OuLszABbcoymPOL1EJPhFfhwNlHIZn0WgBpDaz6d02V5P1N7IS+xJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB6989.namprd11.prod.outlook.com
 (2603:10b6:806:2be::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 08:36:24 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:36:24 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 14/16] drm/i915/display: Add registers for 3D LUT
Thread-Topic: [v6 14/16] drm/i915/display: Add registers for 3D LUT
Thread-Index: AQHcTk8Df6YLYKjUyEmE2QaYWIdqiLT4MBmw
Date: Tue, 18 Nov 2025 08:36:24 +0000
Message-ID: <DM3PPF208195D8D2AAE819F0D5B57282457E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-15-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-15-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB6989:EE_
x-ms-office365-filtering-correlation-id: 91c887cd-36c1-42cf-87a5-08de267d8f00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bBYNmPPfbrRM0vNUr4jFa0RsLCx7JeBRNdgwkHrctNg7F+MbI/aiioSA14Ye?=
 =?us-ascii?Q?1Q8RlQxyDMCyJYjmJ7Rk0e3TYj+E5/Mav8v0AsHoGyaHZzGGw4UhBg7WOYPF?=
 =?us-ascii?Q?HytJ1b9MnJ6afHUhCoswMY8P5/k7/0tOop7WekxlSktBnBV5l7cLLU/o8Smx?=
 =?us-ascii?Q?cNw/fSB4Z6S3w1DqX0CzBFnRZvMJOHCc1tScMxbYCXGXb+Dts5cmOvAvt+7e?=
 =?us-ascii?Q?C0MG6FOLzAueRgbkER9idW6r3CAR5HSTSJ8eAd82w1Gpkksc7salNjEuru3q?=
 =?us-ascii?Q?PUKqNzLWEzz9cjWpX2IsWbkWb2Py0JgAAI54Kxwu3+nxeTGB6PHcE2YO5nU4?=
 =?us-ascii?Q?fqZvtsl+ANaCd7IrNEBbagRcfm9kHE6eINSKZAMHU9abtJei0gssVtwGKrhx?=
 =?us-ascii?Q?A5pelMAO0gvmxolz/npnNNl50pom0VdKYh8HjwnL+LE15BRYQl+3jPYL6yqm?=
 =?us-ascii?Q?0DMIh3aSo4WCnozeOvSxRgROIVtu46//jwe7DP96d2sHAVUDPmlV2bApcG2u?=
 =?us-ascii?Q?vwqJxvAYRPFg4KjZmqmpFiSDMpDDjxB6ECdfbKMFeRo2f0Rte2uS/nECuDXs?=
 =?us-ascii?Q?Q8hg8OgAIa5gqVkYGjRQ0C8/Uz0SfnqS/9b+jAL7RHtkMk/YIE7snqgc1d9r?=
 =?us-ascii?Q?wlc/sg4+oxEGZZkHzhbottDj56j/nIBJb2xX5mnt6OEnYyrF/Z+WD3x2f8NF?=
 =?us-ascii?Q?HGr0kwCoGCS39g5HUQ7wflQQQAgpifBq6uxsoCcSRq4jxmUTH1ra88sqOlq5?=
 =?us-ascii?Q?oLzgit/otRDMbzrKdItBAyepkxffA+8oHy+6MbgLFRtWleLKnlZvhAnBsJQf?=
 =?us-ascii?Q?0R8Ik7lS2V4efuJ2ovkczb1BbxYKpJyKalZ8U/A47J4Fm/WU35SyUHymcW0/?=
 =?us-ascii?Q?32ug/8/iqkW0TX3Tw/lF5hFKNQb1qSSQq7jVI6W6Yj0pgW1g7gRm+fHL/PkO?=
 =?us-ascii?Q?p9tf9BfwEVp/OFKy7zlgufBkCvjEO8qQqydkk7UzMXDo4dtHpb33O6Ffk5T1?=
 =?us-ascii?Q?9amMZ49T5AtEwQYqe9OoWHRD0XmA5f1tYkMnIZLo+/7j38IZeJ1csLPT6SVE?=
 =?us-ascii?Q?eJwaJvLn3hxbh4sD5AVsTa6lhBP+ZglsWwFDZF1QbhChIOaCjjjuhIo+a/DX?=
 =?us-ascii?Q?SsK9bUTVdQw1hOURwzR7tPFd2Un1F28560nKRJdAYCXetC/fFVCKSfq+N7xh?=
 =?us-ascii?Q?zrtPX+LrdM5rA3XNyQdV1mP3wT1kR+ILbOsVIDKRG4C0tbBxmjpvImNF3dAC?=
 =?us-ascii?Q?LAmjYQRHobgX1qnd3hiBvClFSpgLNW2LSMWia4F4dWV0o0xAh9/VuWih6n0b?=
 =?us-ascii?Q?PL+McNwQNbc890JoZ1LgsWrVzMtrDVfULePmpuopfMwa8I3V/F6GbGBmemej?=
 =?us-ascii?Q?bsltDjLb44BURTH8UabYUtlPqm9vR/wTnOI+m0cTIydB9HY8OOtKWAzQu6/g?=
 =?us-ascii?Q?N5ruE0cjVlc2sVzei0g5V69iVS4w1jv4CHn5qDpsSkTJpXIvWQUyQMGGGLS3?=
 =?us-ascii?Q?qQQmO40y5LfLagEgCv/s/DMBDzgbsY5QSFW+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gNt1kfG20Hpr5Auq9rKRb4+dhFKrU4tmo87gaV46widg+QkyuOLY2Hww2RFG?=
 =?us-ascii?Q?GfqAHXSpXhSKpjNJx2L6Sf1T+I/qkSJ8JI9tP2jw6xdGM2fzCvkhZ+l56eNf?=
 =?us-ascii?Q?cM2Q7c5LeMMiKXaW1lOqylZTp7WO82Ms4TDx1pc/8/2vVoxQy915SmqzJs0M?=
 =?us-ascii?Q?Tmc4Y60g7xsT/v82dbtZSul5dbiLYWPRWFLeeamyRIyfhLVWSNVRyJW48cA6?=
 =?us-ascii?Q?pDUZu75Xy2WW5MAQWTS9W5J6R5Co7lA53YaJ1fbq2uap93yf1RQpHciaIBu7?=
 =?us-ascii?Q?2RybZgwQIAVUHuSzB1aUn8AWA2w+FsLLAbdF6r5pP8oEmvfuqW9AmsTFlE8D?=
 =?us-ascii?Q?czZsqFe97GRmzoz39mPjc/LIvjtMhyLOulMXQDL3HmXomWgs8JBrQSykMstc?=
 =?us-ascii?Q?co/otwuMz7nRbXazw11ryTDBUBImWhh+/ITz8LjSpOKnvw3fNL76jgk1a2X9?=
 =?us-ascii?Q?JTeyq4o3mAr97byom3QvHGCwTn5XX/wCKDXWYzhv/0dnsaJjoz/BluVuWuo5?=
 =?us-ascii?Q?vorQ0lp7neUwTu9JW432Au5h52x5wZs/IjOS/mDx6G81O6ehEwK/BEbL6mm6?=
 =?us-ascii?Q?1JY/3QlLU/j98Y823qRXvhFPhQNZQe7JRSeTM8zb6gw/rxQUoAXc1/jhkoL8?=
 =?us-ascii?Q?yVmtIzAeEEqoXlFqHLZNAfh+BiW8ZsTs+8X61241dupplA43LrPKqTLff+zo?=
 =?us-ascii?Q?ZE+nAVEBncFmR8fsHj52enE/w7XaUyOFVC5Fjfm1EYKwawO3qDDseIBNVZUe?=
 =?us-ascii?Q?IvRrTtX3u7aNQTBpR2+jytgprTy6DKoTNAQcBjTqkkZYwwBnENRpEiqSN/2N?=
 =?us-ascii?Q?KuScmW6oUpSeK2ZFQ+mnh04H+oGQceUJEzn76I5iXRgE3zXymxKjnw4y6Zf6?=
 =?us-ascii?Q?d1jvliNaIhJFt9DpQPv0/2heEp8K0PDtuJOJnLwUXJcZMR2fDDpU1vp3T//6?=
 =?us-ascii?Q?ft6KDrzeBFVOJF0O61hsGyNBM4gpO3F/dn/eoCNYW4PvtaO6HuYYnZXB3Dqv?=
 =?us-ascii?Q?pfht4DDIB8Nsi9C7PBwuwBG2bJR0LnXuV8dGMlJ9UuqY+R6LF4MPSUWDldav?=
 =?us-ascii?Q?12DTog/egvz2HJhr5KSfuiP03FmgE8tzXsdpQ7WZn8DfHXeL2wx9w9CotV9d?=
 =?us-ascii?Q?TUwdYRCtt31wvzxdXAqpGDQouKnAULaDcAGNEYRuCgxFZiQ4g5jRkhXrZb0o?=
 =?us-ascii?Q?t6Q9tWmMGjMTLDRZHbZ5UQeTIEtgifIdtFdnis8zzTddD/CfrDMt1+B+gbMS?=
 =?us-ascii?Q?OQ74dYI+RARqrqZRaDGoHhoaOCIKZ3aAS/+yyCv4lfV8MsBoLFlkhAOYJi4e?=
 =?us-ascii?Q?pfvvnQM9weIOmHHUDJU28KfmdoTrY7c/zjgvU0k/Rowtj/8DgIUY25xIiFFH?=
 =?us-ascii?Q?xcJL4G0sq3Fq8Pg/RHfYw4kMJpDBFeuNGdlDadofSU6ZuSw1VEzd/4DYkw7T?=
 =?us-ascii?Q?/7Cl3grjf3o8lca/r+q5qZBfMEIRmjGAsZVSkMFGVQGJ25QJiX4bVif5erZk?=
 =?us-ascii?Q?oouL/8fytAW8Si/9RUgKxxQfFM8vRxaBeVWCvglfIyO3kLosUuA/wuc0COHT?=
 =?us-ascii?Q?IG5MGho/EiimTFIY38htAZ6RB8lKOaJUKtbgo1m2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c887cd-36c1-42cf-87a5-08de267d8f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:36:24.4940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PW2p2c/1VTku5R6l8aj+e73vbkcKXwNGeaNm6KRJQPUgKNVeGWtwX660iAcAuCYZMMk0UewYxrn2EYKfovYulQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6989
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

> Subject: [v6 14/16] drm/i915/display: Add registers for 3D LUT
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add registers needed to program 3D LUT
>=20
> BSpec: 69378, 69379, 69380
>=20

No need for the extra line=20

Regards,
Suraj Kandpal

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  .../i915/display/skl_universal_plane_regs.h   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> index 4d71d07e90ff..88b4c6c57054 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> @@ -520,6 +520,32 @@
>  #define	  PLANE_MIN_DBUF_BLOCKS(val)
> 	REG_FIELD_PREP(PLANE_MIN_DBUF_BLOCKS_MASK, (val))
>  #define	  PLANE_INTERIM_DBUF_BLOCKS_MASK
> 	REG_GENMASK(11, 0)
>  #define	  PLANE_INTERIM_DBUF_BLOCKS(val)
> 	REG_FIELD_PREP(PLANE_INTERIM_DBUF_BLOCKS_MASK, (val))
> +/* 3D LUT */
> +#define _LUT_3D_CTL_A		0x490A4
> +#define _LUT_3D_CTL_B		0x491A4
> +#define   LUT_3D_ENABLE			REG_BIT(31)
> +#define   LUT_3D_READY			REG_BIT(30)
> +#define   LUT_3D_BINDING_MASK		REG_GENMASK(23, 22)
> +#define   LUT_3D_BIND_PIPE
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 0)
> +#define   LUT_3D_BIND_PLANE_1
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 1)
> +#define   LUT_3D_BIND_PLANE_2
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 2)
> +#define   LUT_3D_BIND_PLANE_3
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 3)
> +#define _LUT_3D_INDEX_A		0x490A8
> +#define _LUT_3D_INDEX_B		0x491A8
> +#define   LUT_3D_AUTO_INCREMENT		REG_BIT(13)
> +#define   LUT_3D_INDEX_VALUE_MASK	REG_GENMASK(12, 0)
> +#define   LUT_3D_INDEX_VALUE(x)
> 	REG_FIELD_PREP(LUT_3D_INDEX_VALUE_MASK, (x))
> +#define _LUT_3D_DATA_A		0x490AC
> +#define _LUT_3D_DATA_B		0x491AC
> +#define   LUT_3D_DATA_RED_MASK		REG_GENMASK(29, 20)
> +#define   LUT_3D_DATA_GREEN_MASK	REG_GENMASK(19, 10)
> +#define   LUT_3D_DATA_BLUE_MASK		REG_GENMASK(9, 0)
> +#define   LUT_3D_DATA_RED(x)
> 	REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, (x))
> +#define   LUT_3D_DATA_GREEN(x)
> 	REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, (x))
> +#define   LUT_3D_DATA_BLUE(x)
> 	REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, (x))
> +#define LUT_3D_CTL(pipe)	_MMIO_PIPE(pipe, _LUT_3D_CTL_A,
> _LUT_3D_CTL_B)
> +#define LUT_3D_INDEX(pipe)	_MMIO_PIPE(pipe, _LUT_3D_INDEX_A,
> _LUT_3D_INDEX_B)
> +#define LUT_3D_DATA(pipe)	_MMIO_PIPE(pipe, _LUT_3D_DATA_A,
> _LUT_3D_DATA_B)
>=20
>  /* tgl+ */
>  #define _SEL_FETCH_PLANE_CTL_1_A		0x70890
> --
> 2.50.1


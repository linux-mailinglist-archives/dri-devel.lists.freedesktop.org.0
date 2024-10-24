Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F599AE43F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 13:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4D610E90C;
	Thu, 24 Oct 2024 11:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NykW/kyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB5B10E90A;
 Thu, 24 Oct 2024 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729771070; x=1761307070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xfRVlsfCvU8z1+gSviw7k0BryD0DS95FYE/TWfoyX7w=;
 b=NykW/kyy4/nHLqGKLl6yppSKIyh50BtjJvkUpJGeWP9U06FbEUYsHqUc
 TirXGtxQ/V2ZiNzmp6CNK0tFMJJvgoeRwdrdYbYdJ8tHlnOUfYL1Q/qb7
 lbopUkNmO/EjoMxv4ZdvEtx0pYT2RlcuaoQAi2oonOzoDuAFTkCBLNe7z
 1cv1SkyWE9TMoziqw7qNGVXbbzEISAanUsY1ExYJNKuz3dsRHRCUMMfD8
 vbhikYX3VgQubyc/1cdZvJgRpvoPfMmE8eH/xMYTQ66N2ee1SUH4Zg8z6
 rQoaOaqpbdEukdWiP3Dfz8NBl1xerRwrWHFc7XI2Iv1wZ9i3JA15B2pA/ w==;
X-CSE-ConnectionGUID: lfcohNEAQae5B9fHgQqGVQ==
X-CSE-MsgGUID: uT9QNzmqT76dKO9cX7ZLJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29259058"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29259058"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:57:49 -0700
X-CSE-ConnectionGUID: 5/RK07vHR4uqbjDmPpJ4BQ==
X-CSE-MsgGUID: X+QKDJ9OSMGTfd7adRF5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80494033"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 04:57:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 04:57:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 04:57:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 04:57:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8Y3LX4MSXjIbR1015kam/jN6CktS7PIsaehYTMZQtZVPdc6esbuP1GU8tnkmvduvAdlOUhZCBrGUkvHv51xzVhh5Hu1eP5EJKPiaRt/mgyJPTb7Y2iLa2MGpiIaAYMM0SbvfILH9uN7i344nnhpbzX5eVvjrAnw2ReHrz64s5HUmfj845wli8aWMb5B06lqaWOLf5y1BsQSsdtuHEI7SwoQlD3LQlO6U/Dm14r6MRWoDDuYBS+vHU+94sEO4oOshhMVPe1/8xlJGFe0F+OLlx/G0EdQ3A375WZkznfzEMisuGhAhhmP6fJKbsY0dpDrC5Cif/nETX/fX07fzqtNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZnGkW4tZgb6VRgB7K112EesR3/3QNZzdDrq98JN15c=;
 b=CwxEDZAozwYEqWIkynj4bi32q9tqqk0p4VGLiAXXirS2pD4r6HgYQI+0ukNxgal5p5ieAdcH5GtEeS+yRu9aWvHP73uDASEBDcVCrXW334u6gAWoHbediwEudVgK0PlX2+b5uPxnmdsXYB6m0QK4zMTSWGS+FN8rocdWBi4ek4yxesi+uT3gjIHT+h00Hnpy1w0HTC3FXahNhcyuyCB5oMGf7UdbtZ16rPYWc202kHD8pCJFZxhI8xBANWo8zQDSrQVNKALnV+2Gh4lAhdxVVpkCXRLdnx4K76URhR122sMHHAGwBeEl0eJLFGWHaFadtxojuO+GyXsMFrmyZyFmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB7263.namprd11.prod.outlook.com (2603:10b6:8:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.33; Thu, 24 Oct
 2024 11:57:40 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:57:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv4 5/7] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Topic: [PATCHv4 5/7] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Index: AQHbD14x06JLEKAXYEu9FpAtMDujyrKVjgig
Date: Thu, 24 Oct 2024 11:57:40 +0000
Message-ID: <SN7PR11MB6750ABB17A53A903EADEF26AE34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
 <20240925150754.1876893-6-arun.r.murthy@intel.com>
In-Reply-To: <20240925150754.1876893-6-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB7263:EE_
x-ms-office365-filtering-correlation-id: a6475f7e-7f09-42a8-6df2-08dcf4230fb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3w9yp7fM/VZqRwqHe1raRLBDUO+MqDsmPTUtkg4h/wVHCuhYPwCYLgYc0M5s?=
 =?us-ascii?Q?iI7AsY12RgfBjJLyyjnVqZdqoxkxYMDHdMTSY3s4A1RF2jcK7/EgJVPBRVs5?=
 =?us-ascii?Q?N39tdefIbgfj7z6P/pa4DV4AiFeTcL3sw1MJi4Sp0+s4FADs03vYBaRylE1U?=
 =?us-ascii?Q?7g14GqxrIrudSnb1EacbMrlKKDJm2gXPozC6Ul49wuu5eqkr3mNGnglXfXp/?=
 =?us-ascii?Q?AnPtQNp/MWom1VrDkORgYf7G/yTEHaCbmxCtDI/2phJCjX2HyIIQZKqPqiTY?=
 =?us-ascii?Q?YZojApBNNpbFmrA0LOz5yxDPgwbDweKbJiJ8DKDG2LPiQ+RAG0CqpMXtfuYO?=
 =?us-ascii?Q?7kU8KZUnNYN54GONQM5iJCAK4KT1C8qplL6f7aRwh+yGgVmc1wNA/g9QXqop?=
 =?us-ascii?Q?45zFNcAfam4ibRQgFWXX3SqfVzVJ+Qu+btg5n3LpiRO3Y86n7YPbnj/RRTwq?=
 =?us-ascii?Q?BxcKPvw2fjyqYSyJQPgNTIfh+VaBelMldqMXkrbmaD44knkWtwa+T/CIi7g3?=
 =?us-ascii?Q?VyRgtrCdZzVzWIaKnP7FPGUVWwpjc4QjggkDlP5ZF25WcfPOYtRrkUCy15fZ?=
 =?us-ascii?Q?tauDZdnoCe3KTkwd1ipl8eJQ5KqoTwBrCJUlUm6oJK7qWyeN0OLGczAe/Xjt?=
 =?us-ascii?Q?wKGGBrDSj0P7hmihLD06RtjzEkW8N4gxhaps+C7Y1RyftRyF3STwMtm3MhT7?=
 =?us-ascii?Q?u7MnkaUXLDHTod/jt4LaTgsEbqMdVnwd+6D9UTeTi6PlDHt4cpzEtwdHrnua?=
 =?us-ascii?Q?xa6Uv0EPbRQH/56ZKjys4TbNxs0YMIs0x6iuQWHoRHufISMBNkAy2JaBnut+?=
 =?us-ascii?Q?nuxfMybHBR5R8HHXQkgNDgwfLYwpqyJtAx9CauCJEcq8wnOEg0k+ESu1d9fs?=
 =?us-ascii?Q?XBdXQmoFriVJDF/RI5x75LUYXx1o0Badjf1WAxqAfNY9nyHF3nfUwz0MZ2Nl?=
 =?us-ascii?Q?JK4Oa5BUJezJXTc9YZ/UZcb3hp4/wkypUL59Y3VMJa2HnMLuqdnmC28WNG8P?=
 =?us-ascii?Q?hNssk25n+uPLfNEnUl8RUG52bsSig2L7PD1bfq/Yr8OXn45kYbpCyXZz29Nv?=
 =?us-ascii?Q?5GV3qbPBwnZ44vOmG7IMSvjKsYljFbDnWdOMpwqtrclgVHDF6QW/HIIrFb6G?=
 =?us-ascii?Q?1ckc75h5ck17j5+T9uo1+qJSXkD0JM4c53HSE6Y9mv2PefvAX9hWP1qaWqe+?=
 =?us-ascii?Q?s8JPARl3Lin9MslFcPT9hbh5JAqMuwVKi93z9BA7VF8tr2ZwBDXmZIbyuZwA?=
 =?us-ascii?Q?rladdgg0tYuyZeUuSH0JYbZhfiKYfe+y4Aj6VkhylmMS53ufiUHmaDwE02Gb?=
 =?us-ascii?Q?yYK/e2aBLy4vqGUdcm8HnGCb5jJ64g0FM8zFBEB4/N9oMYzULfVQS35lyASG?=
 =?us-ascii?Q?LzTkjns=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?itbtqDfCza6kLliNB3LtY69ZKChMVHLa2Q5PQ6lGy5l+2hgaOWeEJ9hoP7em?=
 =?us-ascii?Q?clDFWwP/94vymiBjqlorBC2oYHvzyum6kPUNKs1K656G3eoY+slrFxWtqshX?=
 =?us-ascii?Q?3vJLcLyVw0bfZi2OTtS/nwubKn2OeDo9LZsE7Jmd74TRYv9hXBax22bXcV/g?=
 =?us-ascii?Q?zJwLupWo+md2bIjQiIvTVCxmGbHtSFRH4YJxe13ZdzySyzILJVCO4dVjuyHp?=
 =?us-ascii?Q?kI/KwIQMWUOlkDFDW8X+Rt5YVXfZSEMs/dQfDm9vMKQWRtb+1WWfZzK0/nYz?=
 =?us-ascii?Q?I04IURDmIYx8Vu9hkXE3TeH8KwFBJ/AzL7QDC56oPIvuO0ycQZJc+XfgBbRL?=
 =?us-ascii?Q?6PYQj5htM+yekH0wGk0/GfnsYE8Gyrnl/xKnK3CB+SfkK76Q7bD2FaFs2nyP?=
 =?us-ascii?Q?gdj1kNyzA3/dFFYqNSI/ZJKYg/b/+g/CSfIDoRcF3nB85K3NndGN8D1+4n3g?=
 =?us-ascii?Q?SKOyV+NdVaeTQs0uXEO6TsCqemB4TH9J4f/btfO+ukAN/6Myugr4rPAwR2XZ?=
 =?us-ascii?Q?Lw+MyXWoURkCR8llZJUY7XzWAKez2POANr0JHhqmA2LYqgbjXKjGdb0dXiIQ?=
 =?us-ascii?Q?791FEgwbhXKxbYh7eFMhExHkf2etjhaLUmeZtVrOLhNco397/SVPCcHGju8T?=
 =?us-ascii?Q?CZUILiqm/TO2QGDr9HMFbBjcQwyF9fNErghaiqa3pQrvZml6NvfA0/tSQVcd?=
 =?us-ascii?Q?mLB3eI/qTVVuZPPFAisULyIhFs5IPPv+Hcu4LsAPkRVvZgyTYAs66NlAlEDm?=
 =?us-ascii?Q?9Xd9dzxcUlFgvxdLTch7vWsh/lxVlcDfA4We67zSLWosoE13YDhoR4IEpGF1?=
 =?us-ascii?Q?clikHir0Yrrrnzy9WwJeI6gRemc1IVh2Qc2/h5osmP/9P1ChKfsCPkGWosoD?=
 =?us-ascii?Q?n8/Zcn4b3rCC50S1AEaJJCdlWP4RT1jYfPet6J8SPlgMag+kLVJm9HfQ9/Vd?=
 =?us-ascii?Q?VuPHOkITdddnt3cs3QDpi8ErB7tUs7whzC+cOEbwV2Hx4w5ioOE9d1eb1aeA?=
 =?us-ascii?Q?VI0iyAtEX5J+cVe+bfhTq0mGjrD/D2UBt912qtZpuR3d9r+SkIRFmZuPGy00?=
 =?us-ascii?Q?Ku5l4so8euIHOgsS1Hg5U2oiQRzezfl2blXjeXw214aMucb4ISETVbt8tR5H?=
 =?us-ascii?Q?YcMJDiN8amUexwmUvjNRk9cTp8Y10k+hQJkH1SaI0RYeo4f6FFHZoRBB5Nyg?=
 =?us-ascii?Q?tqKR0GUDqJ6v3nzbnim8JSNtqGWIIn1legBjBc/N2OBd7HbmzW1iNIt+RqE7?=
 =?us-ascii?Q?vwxXhFcPb1WYH+VeOgamOyyWR/yEMI39jFy8eMCbikHywoD3N12ZS1ISYPtu?=
 =?us-ascii?Q?V/qW+6OqAu69nNgBltY+3VwTeXg02LVlaMKafRDUf8RF5fW0Z+NO5kxiYOWw?=
 =?us-ascii?Q?p54U9/QcUZ1YNpIFeVnYhu1Pkz0XPhUF9Al6eqO9gfu2/vkvr3L9B2Zhyzpk?=
 =?us-ascii?Q?DkDDQbXjUVTe1zgPI2aOrTQ9xADkpzyMJRnr47HO2ZBkkDcHMir968Q5WRyx?=
 =?us-ascii?Q?7RO0Xqj052tK1Kmae6UgAMZOPiCGdN3o5oZHeJlBEZTw9FIBO/F1KjTDlqIH?=
 =?us-ascii?Q?EWeTArutlhglzsNGATwL41B2NpX3ytJMWs4FSw61?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6475f7e-7f09-42a8-6df2-08dcf4230fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 11:57:40.3768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmcI5GqU02zE4P1ilZ6VsV5goFQjE7gzuVvRTIykLtTP7IMpOnncmGy26kQBaioVQHlPSgzJ/uvrD3UBsboljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7263
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
> Sent: Wednesday, September 25, 2024 8:38 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv4 5/7] drm/i915/histogram: Add crtc properties for global
> histogram
>=20
> CRTC properties have been added for enable/disable histogram, reading the
> histogram data and writing the IET data.
> "HISTOGRAM_EN" is the crtc property to enable/disable the global histogra=
m
> and takes a value 0/1 accordingly.
> "Histogram" is a crtc property to read the binary histogram data.
> "Global IET" is a crtc property to write the IET binary LUT data.
>=20
> v2: Read the histogram blob data before sending uevent (Jani)
> v3: use drm_property_replace_blob_from_id (Vandita)
>     Add substruct for histogram in intel_crtc_state (Jani)
> v4:  Rebased after addressing comments on patch 1
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     | 169 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  13 ++
>  .../drm/i915/display/intel_display_types.h    |  13 ++
>  .../gpu/drm/i915/display/intel_histogram.c    |   6 +
>  6 files changed, 210 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 6cac26af128c..b2089605e125 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -246,6 +246,8 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>=20
>  	__drm_atomic_helper_crtc_duplicate_state(crtc, &crtc_state->uapi);
>=20
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_get(crtc_state->histogram.global_iet);
>  	/* copy color blobs */
>  	if (crtc_state->hw.degamma_lut)
>  		drm_property_blob_get(crtc_state->hw.degamma_lut);
> @@ -277,6 +279,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->update_planes =3D 0;
>  	crtc_state->dsb_color_vblank =3D NULL;
>  	crtc_state->dsb_color_commit =3D NULL;
> +	crtc_state->histogram.histogram_enable_changed =3D false;
>=20
>  	return &crtc_state->uapi;
>  }
> @@ -313,6 +316,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_vblank);
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_commit);
>=20
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_put(crtc_state->histogram.global_iet);
>  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
>  	intel_crtc_free_hw_state(crtc_state);
>  	if (crtc_state->dp_tunnel_ref.tunnel)
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c
> b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 3a28d8450a38..e3df5e2e6c8b 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_vblank_work.h>
> +#include <drm/drm_atomic_uapi.h>
>=20
>  #include "i915_vgpu.h"
>  #include "i9xx_plane.h"
> @@ -27,6 +28,7 @@
>  #include "intel_drrs.h"
>  #include "intel_dsi.h"
>  #include "intel_fifo_underrun.h"
> +#include "intel_histogram.h"
>  #include "intel_pipe_crc.h"
>  #include "intel_psr.h"
>  #include "intel_sprite.h"
> @@ -210,6 +212,7 @@ static struct intel_crtc *intel_crtc_alloc(void)  sta=
tic
> void intel_crtc_free(struct intel_crtc *crtc)  {
>  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> +	intel_histogram_finish(crtc);
>  	kfree(crtc);
>  }
>=20
> @@ -229,6 +232,67 @@ static int intel_crtc_late_register(struct drm_crtc
> *crtc)
>  	return 0;
>  }
>=20
> +static int intel_crtc_get_property(struct drm_crtc *crtc,
> +				   const struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   uint64_t *val)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> +	const struct intel_crtc_state *intel_crtc_state =3D
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> +
> +	if (property =3D=3D intel_crtc->histogram_en_property) {
> +		*val =3D intel_crtc_state->histogram.histogram_enable;
> +	} else if (property =3D=3D intel_crtc->global_iet_property) {
> +		*val =3D (intel_crtc_state->histogram.global_iet) ?
> +			intel_crtc_state->histogram.global_iet->base.id : 0;
> +	} else if (property =3D=3D intel_crtc->histogram_property) {
> +		*val =3D (intel_crtc_state->histogram.histogram) ?
> +			intel_crtc_state->histogram.histogram->base.id : 0;
> +	} else {
> +		drm_err(&i915->drm,
> +			"Unknown property [PROP:%d:%s]\n",
> +			property->base.id, property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_crtc_set_property(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   u64 val)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> +	struct intel_crtc_state *intel_crtc_state =3D
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> +	bool replaced =3D false;
> +
> +	if (property =3D=3D intel_crtc->histogram_en_property) {
> +		intel_crtc_state->histogram.histogram_enable =3D val;
> +		intel_crtc_state->histogram.histogram_enable_changed =3D
> true;
> +		return 0;
> +	}
> +
> +	if (property =3D=3D intel_crtc->global_iet_property) {
> +		drm_property_replace_blob_from_id(crtc->dev,
> +						  &intel_crtc_state-
> >histogram.global_iet,
> +						  val,
> +						  sizeof(uint32_t) *
> HISTOGRAM_IET_LENGTH,
> +						  -1, &replaced);
> +		if (replaced)
> +			intel_crtc_state->histogram.global_iet_changed =3D
> true;
> +		return 0;
> +	}
> +
> +	drm_dbg_atomic(&i915->drm, "Unknown property [PROP:%d:%s]\n",
> +		       property->base.id, property->name);
> +	return -EINVAL;
> +}
> +
>  #define INTEL_CRTC_FUNCS \
>  	.set_config =3D drm_atomic_helper_set_config, \
>  	.destroy =3D intel_crtc_destroy, \
> @@ -238,7 +302,9 @@ static int intel_crtc_late_register(struct drm_crtc *=
crtc)
>  	.set_crc_source =3D intel_crtc_set_crc_source, \
>  	.verify_crc_source =3D intel_crtc_verify_crc_source, \
>  	.get_crc_sources =3D intel_crtc_get_crc_sources, \
> -	.late_register =3D intel_crtc_late_register
> +	.late_register =3D intel_crtc_late_register, \
> +	.atomic_set_property =3D intel_crtc_set_property, \
> +	.atomic_get_property =3D intel_crtc_get_property
>=20
>  static const struct drm_crtc_funcs bdw_crtc_funcs =3D {
>  	INTEL_CRTC_FUNCS,
> @@ -383,6 +449,10 @@ int intel_crtc_init(struct drm_i915_private *dev_pri=
v,
> enum pipe pipe)
>  	intel_color_crtc_init(crtc);
>  	intel_drrs_crtc_init(crtc);
>  	intel_crtc_crc_init(crtc);
> +	intel_histogram_init(crtc);
> +
> +	/* Initialize crtc properties */
> +	intel_crtc_add_property(crtc);
>=20
>  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos,
> PM_QOS_DEFAULT_VALUE);
>=20
> @@ -716,3 +786,100 @@ void intel_pipe_update_end(struct
> intel_atomic_state *state,
>  out:
>  	intel_psr_unlock(new_crtc_state);
>  }
> +
> +static const struct drm_prop_enum_list histogram_enable_names[] =3D {
> +	{ INTEL_HISTOGRAM_DISABLE, "Disable" },
> +	{ INTEL_HISTOGRAM_ENABLE, "Enable" },
> +};
> +
> +/**
> + * intel_attach_histogram_en_property() - add property to
> +enable/disable histogram
> + * @intel_crtc: pointer to the struct intel_crtc on which the global his=
togram
> is to
> + *		be enabled/disabled
> + *
> + * "HISTOGRAM_EN" is the crtc propety to enable/disable global
> +histogram  */ void intel_attach_histogram_en_property(struct intel_crtc
> +*intel_crtc) {
> +	struct drm_crtc *crtc =3D &intel_crtc->base;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D intel_crtc->histogram_en_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_enum(dev, 0,
> +						"Histogram_Enable",
> +						histogram_enable_names,
> +
> 	ARRAY_SIZE(histogram_enable_names));
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_en_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0); }
> +
> +/**
> + * intel_attach_global_iet_property() - add property to write Image
> +Enhancement data
> + * @intel_crtc: pointer to the struct intel_crtc on which global
> +histogram is enabled
> + *
> + * "Global IET" is the crtc property to write the Image Enhancement LUT
> +binary data  */ void intel_attach_global_iet_property(struct intel_crtc
> +*intel_crtc) {
> +	struct drm_crtc *crtc =3D &intel_crtc->base;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D intel_crtc->global_iet_property;
> +	if (!prop) {
> +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB |
> DRM_MODE_PROP_ATOMIC,
> +					   "Global IET", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->global_iet_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0); }
> +
> +/**
> + * intel_attach_histogram_property() - crtc property to read the histogr=
am.
> + * @intel_crtc: pointer to the struct intel_crtc on which the global his=
togram
> + *		was enabled.
> + * "Global Histogram" is the crtc property to read the binary histogram =
data.
> + */
> +void intel_attach_histogram_property(struct intel_crtc *intel_crtc) {
> +	struct drm_crtc *crtc =3D &intel_crtc->base;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_property *prop;
> +	struct drm_property_blob *blob;
> +
> +	prop =3D intel_crtc->histogram_property;
> +	if (!prop) {
> +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB |
> +					   DRM_MODE_PROP_ATOMIC |
> +					   DRM_MODE_PROP_IMMUTABLE,
> +					   "Global Histogram", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_property =3D prop;
> +	}
> +	blob =3D drm_property_create_blob(dev, sizeof(uint32_t) *
> HISTOGRAM_BIN_COUNT, NULL);
> +	intel_crtc->config->histogram.histogram =3D blob;
> +
> +	drm_object_attach_property(&crtc->base, prop, blob->base.id); }
> +
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc) {
> +	intel_attach_histogram_en_property(intel_crtc);
> +	intel_attach_histogram_property(intel_crtc);
> +	intel_attach_global_iet_property(intel_crtc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h
> b/drivers/gpu/drm/i915/display/intel_crtc.h
> index a58ecd11bba2..b203f8eb862a 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> @@ -7,6 +7,7 @@
>  #define _INTEL_CRTC_H_
>=20
>  #include <linux/types.h>
> +#include <drm/drm_crtc.h>
>=20
>  enum i9xx_plane_id;
>  enum pipe;
> @@ -54,4 +55,8 @@ void intel_wait_for_vblank_if_active(struct
> drm_i915_private *i915,
>  				     enum pipe pipe);
>  void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
>=20
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc); void
> +intel_attach_histogram_en_property(struct intel_crtc *intel_crtc); void
> +intel_attach_global_iet_property(struct intel_crtc *intel_crtc); void
> +intel_attach_histogram_property(struct intel_crtc *intel_crtc);
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index f7667931f9d9..ce51a151b9ae 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -93,6 +93,7 @@
>  #include "intel_fifo_underrun.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_hdmi.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug.h"
>  #include "intel_link_bw.h"
>  #include "intel_lvds.h"
> @@ -4373,6 +4374,10 @@ static int intel_crtc_atomic_check(struct
> intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>=20
> +	/* HISTOGRAM changed */
> +	if (crtc_state->histogram.histogram_enable_changed)
> +		return intel_histogram_atomic_check(crtc);
> +
>  	return 0;
>  }
>=20
> @@ -7546,6 +7551,14 @@ static void intel_atomic_commit_tail(struct
> intel_atomic_state *state)
>  		 */
>  		old_crtc_state->dsb_color_vblank =3D
> fetch_and_zero(&new_crtc_state->dsb_color_vblank);
>  		old_crtc_state->dsb_color_commit =3D
> fetch_and_zero(&new_crtc_state->dsb_color_commit);
> +
> +		/* Re-Visit: HISTOGRAM related stuff */
> +		if (new_crtc_state->histogram.histogram_enable_changed)
> +			intel_histogram_update(crtc,
> +					       new_crtc_state-
> >histogram.histogram_enable);
> +		if (new_crtc_state->histogram.global_iet_changed)
> +			intel_histogram_set_iet_lut(crtc,
> +						    (u32 *)new_crtc_state-
> >histogram.global_iet->data);
>  	}
>=20
>  	/* Underruns don't always raise interrupts, so check manually */ diff -
> -git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c5504f4c3178..317b3e469dbb 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1301,6 +1301,15 @@ struct intel_crtc_state {
>=20
>  	/* LOBF flag */
>  	bool has_lobf;
> +
> +	/* Histogram data */
> +	struct {
> +		int histogram_enable;
> +		struct drm_property_blob *global_iet;
> +		struct drm_property_blob *histogram;
> +		bool global_iet_changed;
> +		bool histogram_enable_changed;
> +	} histogram;
>  };
>=20
>  enum intel_pipe_crc_source {
> @@ -1408,6 +1417,10 @@ struct intel_crtc {
>  	struct pm_qos_request vblank_pm_qos;
>=20
>  	struct intel_histogram *histogram;
> +	/* HISTOGRAM properties */
> +	struct drm_property *histogram_en_property;
> +	struct drm_property *global_iet_property;
> +	struct drm_property *histogram_property;
>=20
>  #ifdef CONFIG_DEBUG_FS
>  	struct intel_pipe_crc pipe_crc;
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index ce2a5eae2784..72e9cb5156a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -82,6 +82,11 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
>  		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
>  	if (intel_histogram_get_data(intel_crtc)) {
> +		drm_property_replace_global_blob(display->drm,
> +				&intel_crtc->config->histogram.histogram,
> +				sizeof(histogram->bin_data),
> +				histogram->bin_data, &intel_crtc->base.base,
> +				intel_crtc->histogram_property);
>  		/* Notify user for Histogram rediness */
>  		if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
>  				       KOBJ_CHANGE, histogram_event)) @@ -
> 195,6 +200,7 @@ static void intel_histogram_disable(struct intel_crtc
> *intel_crtc)
>=20
>  	cancel_delayed_work(&histogram->work);
>  	histogram->enable =3D false;
> +	intel_crtc->config->histogram.histogram_enable =3D false;

We need to pass the crtc state here and get the old and new crtc state to c=
ompare so that we can make sure we only
Disable historgram once this can be done by either passing intel_atomic_sta=
te or intel_crtc_state to intel_histogram_update
Looks wrong we are aiming to not use crtc->config this will be solved if as=
 suggested above we pass the
Crtc_state to intel_histogram_update and consequently intel_histogram_disab=
le.

Regards,
Suraj Kandpal

>  }
>=20
>  int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable)
> --
> 2.25.1


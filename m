Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD2C9C118
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 17:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0F410E685;
	Tue,  2 Dec 2025 16:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLJA+pRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906D310E677;
 Tue,  2 Dec 2025 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691229; x=1796227229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fXPfdgbQZCr3F0A7EElRGzqP1CTIW1h2BL+DMgo10+g=;
 b=OLJA+pRdBw1JeHD6QtewlswAoN01UMeLITubJWlZuA9RUfultjBy/UeR
 DjwlIwW/k912inVm4y+DMg4v3iPojrfAP4ThetBqKspAJVY+O2UYR6nJn
 ueAk3ypYq1/PPlbiZ9PUQ6PJvJ4tJWhKu72zImj3eK7UJPC9tISAtkpp/
 H8qJ8eKZr3xdCcpXzZFCPrxxZ55tie49tu1rbnTOKD+nXWCT6aA9etsKn
 XbexXQaP+zhluOzx0BbA4IwBA6/GNKZJhmb8r4ZLDIh3n0Q8ofMUEHy6v
 jiQMijCBHzkLEzgOoy/2dxefNn2b5C3xOwOzXw9O8fCLtyMLwclwksQFN g==;
X-CSE-ConnectionGUID: 2eY/V0QbQ3+j6/3Dp740vw==
X-CSE-MsgGUID: Hg2M2g/MS/S9+PDR4nomNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78128241"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78128241"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:00:27 -0800
X-CSE-ConnectionGUID: puU5i5QARYK5uS/sbZiZDQ==
X-CSE-MsgGUID: hamcUeiKTW+3U7KJGJOfsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198875458"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:00:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:00:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:00:26 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:00:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrqo909MgTOoTYzbrBgShnGl5EcK6qnGaJE0pkLTjHZH71FfQQLZF/9sddXRpcmop+YH7GNSCMVBF+oVhNCAdfahkP61kh2H7qsYDSfS8dWw8xodscJVb7qdz/aTJjLumKG7M/PS6bOo8AJn+CgItN3UYMVaOtnMUkZPzKTk+cD5yy7m3Fl8++DlthduiBfDdN0YIR3tzlkunp6BBQrpi+b/JONOUQ/p5cpoPYpkd7ETuvUNlw5bkWZgKk6nhxAfHtBa/JRrVVkJfTSxgVR1/GuYCueGu1YvLhmJzYZ4YegV1Iwvrv5+m7UybDShc/tHdx4YJc9R2ux7UtzlNGB03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lmjsybR2a/vhcTQAJdMe+GgZngOwIcgEoCTeFOm/0Y=;
 b=lUgjTNmNEIFlz8vzE28Nmsgjp3Zq5BqqkysS5TA9OHpTW9bIHsIBKbAmB5bf2d/QB2iJH6nhZ5rI/XOus77OosOT8oq91PmCq+9vZw25m3xvQ2/mtAu753dNs8rHLEHHwatSSHJf3VERyLhANl5qakpBxR+IZKUZalm83xPCYLMO75Sw883Qphyr6v+1+VvtWQAoBzpJHwlgV7C5fqDWP9IVdSrkqUa6rhg/g9HPLIxb1SibM2+ZKdqpYEEZs1ikbaby+wn+AYXMHA56rS0cEHmlVamed5UgoK7PyHO/a8FFDdUU3XNkGISmV70d4omkjoB0nfoxMVId8zd48O5KSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS7PR11MB7887.namprd11.prod.outlook.com
 (2603:10b6:8:e2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:00:16 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 16:00:16 +0000
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
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Thread-Topic: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Thread-Index: AQHcYozH2hBK9lVsC0KXxVFiN/qQD7UMg2dwgAGBtACAAH8bIA==
Date: Tue, 2 Dec 2025 16:00:15 +0000
Message-ID: <DM3PPF208195D8D7FD22D5A5EB558F3FBB7E3D8A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-12-uma.shankar@intel.com>
 <DM3PPF208195D8DA1980D5CD74E95BEA81DE3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <CY5PR11MB63445DCDE616C4C99C21F275F4D8A@CY5PR11MB6344.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB63445DCDE616C4C99C21F275F4D8A@CY5PR11MB6344.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS7PR11MB7887:EE_
x-ms-office365-filtering-correlation-id: b377d9d2-5a3d-4de9-0a36-08de31bbe25b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rocS1bUd2c4lYphBiS+VHfxuF11OE0OTV5j32Yuslc+ZHJuFO6dDhutPYz7i?=
 =?us-ascii?Q?uD8a8IWm+2hX4OBMHwBI4m1UywksG9NcPpWTa04m0A/PtkPda6ee/jeYXfqD?=
 =?us-ascii?Q?ARoj7I/vNMNX7Oz54c3xslM1vXqlLuuMpXlPnJAIqchJfnDhVBXrhHHMG3G6?=
 =?us-ascii?Q?Qua6lMFZopY1UusJEJzzCAUEmpVPZiNQ6biQUOcYsIYgulplQLlplpo9jA/n?=
 =?us-ascii?Q?SjfT6fD0EIom9GZpGL/YgbFqPutT4pEfOIaBOZ6hzAEM5Mt4/iW95cuiivRS?=
 =?us-ascii?Q?AmYxV9+a92a4WbIpFVxp5s5VnZqU3m3rhF+5m2MPSIEEfRpFSRg3qYbOhMyK?=
 =?us-ascii?Q?OE5PI65uelUaRQveJojtJPZdY1iua3jp+MI88TbRwjxO7raQCTkC+Cukr7tx?=
 =?us-ascii?Q?L585Wd6bq2NyOMeTpKrZOuLX+EQ8r8JQ5pO8StUUMZbnw8K4yT3l2hjdo19F?=
 =?us-ascii?Q?/eibl4sXQ0CqNlQKM2an4CAkf+ZnOSMEOSBQcMSVPjADa7Fzb0fbkrT8fkKn?=
 =?us-ascii?Q?ocsJwPTpTAyStRmmCmlFihiLSq3RKjtxRWCj3hgjr9gjBFjprYMAU0qZ4ryc?=
 =?us-ascii?Q?pnDlOcig1sOP5TWXqwrv5XRi2OMEo7DirjkTISoNH3AYVpq/4TKhLXlAxCsE?=
 =?us-ascii?Q?WVTTvr9lkKlwzPJYIklwbKza8zeffsfs88VcAih04Z91sapBRaZlLyk8abSN?=
 =?us-ascii?Q?7sHZXOEz2bxCDkING1zJZh6kpBJ/Sd0xiCPi7j45JOHt1J7Ofico05xFBury?=
 =?us-ascii?Q?4dzgrDwdLCooPL9dKopwI7ce8klQHxX6xueW52X7fBbNLlJIIqh7E3eHDi4P?=
 =?us-ascii?Q?tCv9f56CU2kkirvsYXw89mip74yyz+Gb1f3tdIFIt6ed0rsIm7fGYCToPwn2?=
 =?us-ascii?Q?S31L4cwjFD2cIJV0rw6TDdtUK2aag9KZ1XITW5yH01PwVhyicvB2J0VsFsxi?=
 =?us-ascii?Q?UCyJ1jCd8ffCVGmrDhphWJXtkJYE5aSsAB2Y9wX5N3QoMkmuNN3TQFxa2mPQ?=
 =?us-ascii?Q?6lPgxZMgmKNs7qFMxEsSbVkyc1taGrGJIKVRyWV/9b9TO0icdkGP6us0V7St?=
 =?us-ascii?Q?hlNO7sA1e7cG/2j304Ef4+0lu5LrknT1ZIOjjBkANKjfTOAw1jUwN9nW8Cir?=
 =?us-ascii?Q?gpNw7kt6Uob/a/pVOyrqtzomRidBwyEzvteQe12a92pSEqIlmc5gVAgiZ04l?=
 =?us-ascii?Q?CTvIU43CARnqg39lvqL8y24DnIrpuC9KGfBBSq+ipxQCPAKcREI9qppYi7ca?=
 =?us-ascii?Q?s+HX/cRu1hRyaBGVshnyqZM+o5qY+wCtEmbP3+fDUOH2ejoTpE9wr39ymuGC?=
 =?us-ascii?Q?D7sLV3ev0QJZKrQDRlGFAdZozTEkYbHkwS01p/QFlARIam3sSC6y2qAIVXU3?=
 =?us-ascii?Q?t/lGjeLAUECXT6ckkwqkV3xpAO8D9Arw1fnp+YnZXSKtmN2vlKadw+Rss3H3?=
 =?us-ascii?Q?EEqb4dkm1H/fcs4vC0UacKD+5jcRgKvt/HuGfL5nY3OFE5dIS/q29CUh+83V?=
 =?us-ascii?Q?B4Jbt92WQpokFjQQPeSDw1CmUKLT6NIhjWJq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JO53S7qyGH7zEz2Ir0EWrSlJxiDBjDBZc1Lg6tVfXuLpiZ+2UhSKZiZB39ga?=
 =?us-ascii?Q?31NhDWpBhY8sL0QsS69kY3E2ZBVIVAR4Ah3J9ECXkBV46fNlVHzk5RLdlK9A?=
 =?us-ascii?Q?sI16/ZTNN44aJ8cpVDmP5lAOlihU9xyMAXX/dWEPWFdYbfO0Ain1lYDDNt8+?=
 =?us-ascii?Q?v4K1ba2bAXi/oLv+tmc832tuK+grte9y/B7hDMBukSodWpENTiyFD0EIpDQR?=
 =?us-ascii?Q?5/WMXtcIbGWyDjSGj1B+wEase3TbWye/clp8eOu1jpSMYMicwDc4WPATM98w?=
 =?us-ascii?Q?9mJnXsV2sWN9tfSGNn9O9S0aEU67vG1BTtdz/7OGSDadg3K1KkXOjS/lvP22?=
 =?us-ascii?Q?MwNeYjO8fZjNTohyLZdZiBxHNTSASMaFljx3K1J3r2/RUOvCpi81DnlVePhj?=
 =?us-ascii?Q?ePiqHpgI7lwj0kYy+586CzgH7NeZpUFebaINh97iVm2oC+IaUa16S2yYA+pk?=
 =?us-ascii?Q?fKvKd1JMCWVbR5ZsKic6p/lsHsFoxNKkULuXCVR2iNyCN3jzq+dJCElcZTps?=
 =?us-ascii?Q?hhNoWB1ZRSAPLoGjrYR/HtXYkhnTSW8fi4YeAbF8gCC/d7zZzi+kGxKWjfqP?=
 =?us-ascii?Q?YaNhxMQhlm4FNHFLSKZHo+Exje8cbwxElFQQ7U/gQtlBvX6j+XmiZRSx46fE?=
 =?us-ascii?Q?EtTqFRU2axK7wWAPEK4GNlWE139Ajqd1xImxnoGbnPgDyAxlTkUD89gx420p?=
 =?us-ascii?Q?58mOKOIOwgZKTdxSMyHWsZmQe9oUEUF34a9aQ2y2iUyBJHZMcEyVDGzm7hOX?=
 =?us-ascii?Q?Fo2fHr1wtt64IOzut/fwPnv2FTCvf5MJ4Rpdfm96wp1gbC/HbAyFQxNZ7cbl?=
 =?us-ascii?Q?JNRPUhYZ7C4MZF/NvPTjSvyKngKAKkzPahja7F6OUH8T54yLP/9E0C4KqBHS?=
 =?us-ascii?Q?0w+FRDHAaz97rzXPrk/i9kp80N1Mn/NI99nBNjOzOjt1JAw/CLZ+Pza1teE4?=
 =?us-ascii?Q?H0iajSCfA8t4AQtTs9BiHbfkQ+MYMVhg4FZAIGPBThGURVD3iulhK55/Ot9r?=
 =?us-ascii?Q?UKC2XSawlXm1IEGyw7FPhoLGOmoKpq9fmtE/ilYjnzn+ktv3lMBv5nOTpdSF?=
 =?us-ascii?Q?Nb18PDwb3Hpw6ZPWJCCzMdA1ocp/a4dKTx7hj65tEo/dsecvNWlPNpN8i0kX?=
 =?us-ascii?Q?unKKsb66YsWha44bByB0/BpsMW270kaCpduRhFJ6PyoKKtxwuoC/Nrh2NaYS?=
 =?us-ascii?Q?CTfuu+I6NneDqaEOlrSt4iNif0NAa2okFgyqf5TPOWKJlAPsWAtM47kjS6sh?=
 =?us-ascii?Q?d+iT2/u9DXomd+SbkLnEJWTHt7k02Eij4udkJ2Cabdbb9nrCp3ccGaX2ozlP?=
 =?us-ascii?Q?Sj5xi5XgWfyH4PO92Su/Qo+T6wsB8viQz8cB4E0iayPHA/fYCk4J8oLfnhFB?=
 =?us-ascii?Q?KI9vU+XkTvlCnJ1hFUxVhbtxfOK/tKgIZVoXMenbsrL94S/Rn8YcNasMQQf5?=
 =?us-ascii?Q?WkWM3PmlcdHe0fU2uJdBNjGzgN/fEDdYU003c4OPNlhaDmab45NjZl/0E3WP?=
 =?us-ascii?Q?SLRYUYYpo3QjD7b/LIIQJCzA1phvdlYj3Or/Pt00bdjT0lvHqR2YGoU6DdFF?=
 =?us-ascii?Q?VR9ItLJAlrt5+3LHLXOv+xEEVFdAI4oNrYvP1GQj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b377d9d2-5a3d-4de9-0a36-08de31bbe25b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 16:00:15.9173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3nzLTvvEkZt29PZvGg9m1XVupAL/7r1v2f3aNGM0rsZN04Y54PlJbFCXF87mxXDZ+cSAwyAayWu1JuyHkifkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

> > Subject: RE: [v7 11/15] drm/i915/color: Program Pre-CSC registers
> >
> > > Subject: [v7 11/15] drm/i915/color: Program Pre-CSC registers
> > >
> > > Add callback to program Pre-CSC LUT for TGL and beyond
> > >
> > > v2: Add DSB support
> > > v3: Add support for single segment 1D LUT color op
> > > v4:
> > > - s/drm_color_lut_32/drm_color_lut32/ (Simon)
> > > - Change commit message (Suraj)
> > > - Improve comments (Suraj)
> > > - Remove multisegmented programming, to be added later
> > > - Remove dead code for SDR planes, add when needed
> > >
> > > BSpec: 50411, 50412, 50413, 50414
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > Signed-off-by: Chaitanya Kumar Borah
> > > <chaitanya.kumar.borah@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_color.c | 61
> > > ++++++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > > b/drivers/gpu/drm/i915/display/intel_color.c
> > > index 4ca359d68730..2a114d2964fa 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > > @@ -3943,6 +3943,66 @@ xelpd_load_plane_csc_matrix(struct intel_dsb
> *dsb,
> > >  			   ctm_to_twos_complement(input[11], 0, 12));  }
> > >
> > > +static void
> > > +xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
> > > +				const struct intel_plane_state *plane_state) {
> > > +	struct intel_display *display =3D to_intel_display(plane_state);
> > > +	const struct drm_plane_state *state =3D &plane_state->uapi;
> > > +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> > > +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> >
> > Introduce intel_plane here and use that
>=20
> I think its only used at 2 places, don't see any need of extra variable.
> If no strong objection, I think it's ok to keep this way.

Sure Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Regards,
> Uma Shankar
>=20
> > Regards,
> > Suraj Kandpal
> >
> > > +	const struct drm_color_lut32 *pre_csc_lut =3D plane_state-
> > > >hw.degamma_lut->data;
> > > +	u32 i, lut_size;
> > > +
> > > +	if (icl_is_hdr_plane(display, plane)) {
> > > +		lut_size =3D 128;
> > > +
> > > +		intel_de_write_dsb(display, dsb,
> > > +				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe,
> > > plane, 0),
> > > +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> > > +
> > > +		if (pre_csc_lut) {
> > > +			for (i =3D 0; i < lut_size; i++) {
> > > +				u32 lut_val =3D
> > > drm_color_lut32_extract(pre_csc_lut[i].green, 24);
> > > +
> > > +				intel_de_write_dsb(display, dsb,
> > > +
> > > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> > > +						   lut_val);
> > > +			}
> > > +
> > > +			/* Program the max register to clamp values > 1.0. */
> > > +			/* TODO: Restrict to 0x7ffffff */
> > > +			do {
> > > +				intel_de_write_dsb(display, dsb,
> > > +
> > > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> > > +						   (1 << 24));
> > > +			} while (i++ > 130);
> > > +		} else {
> > > +			for (i =3D 0; i < lut_size; i++) {
> > > +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> > > +
> > > +				intel_de_write_dsb(display, dsb,
> > > +
> > > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> > > +			}
> > > +
> > > +			do {
> > > +				intel_de_write_dsb(display, dsb,
> > > +
> > > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> > > +						   1 << 24);
> > > +			} while (i++ < 130);
> > > +		}
> > > +
> > > +		intel_de_write_dsb(display, dsb,
> > > PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> > > +	}
> > > +}
> > > +
> > > +static void
> > > +xelpd_plane_load_luts(struct intel_dsb *dsb, const struct
> > > +intel_plane_state *plane_state) {
> > > +	if (plane_state->hw.degamma_lut)
> > > +		xelpd_program_plane_pre_csc_lut(dsb, plane_state); }
> > > +
> > >  static const struct intel_color_funcs chv_color_funcs =3D {
> > >  	.color_check =3D chv_color_check,
> > >  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -3991,6 +4051,7
> @@
> > > static const struct intel_color_funcs tgl_color_funcs =3D {
> > >  	.read_csc =3D icl_read_csc,
> > >  	.get_config =3D skl_get_config,
> > >  	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
> > > +	.load_plane_luts =3D xelpd_plane_load_luts,
> > >  };
> > >
> > >  static const struct intel_color_funcs icl_color_funcs =3D {
> > > --
> > > 2.50.1


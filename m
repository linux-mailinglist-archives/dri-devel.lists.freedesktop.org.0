Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFDAD52B2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4513510E617;
	Wed, 11 Jun 2025 10:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTOK1zqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B472410E617;
 Wed, 11 Jun 2025 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749639161; x=1781175161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2wbaIS1hkRjczagCP7WKaw54Czzew9Gn4SKMo0PbnDg=;
 b=CTOK1zqf9DmTolwecAwcoWAMJkz1uPISB1/sAhHWiUbdpy/pJooZLm/4
 2058ZGZ5GgvpaxdxuYnClJ+LD9ConngPdjJu4tloAzJ2Z056gDWbkE7yQ
 NOGzLzou4nB+LqfGAD6972KH4eqVcCxpoafRuRZ32+hhegp1E/XA6s39Z
 GrSTvKo9OenU1QpzAbdomo4ib61vBLh6jtgWBm7SOtKEpldLNRyajxWHJ
 CvgfHzjOrpqs9h5swifR1YrABn6OXXn7if09Ii88t3xSOCrie207c6los
 R0KoJV8mOGYQcNbwADQfvcqCHdD7fUjD4PeO/M4uJO3M0fYATYYV2oWuq w==;
X-CSE-ConnectionGUID: IVtIeepnTvSZQul8SEPK8Q==
X-CSE-MsgGUID: wqZ/UqRSSM+s0ekPRJP3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63186314"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="63186314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:52:40 -0700
X-CSE-ConnectionGUID: ikuj9OFtRdCWt5h7tWQ0ow==
X-CSE-MsgGUID: LVCR9LxVQRqA1MomTKKdHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147074513"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:52:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:52:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 03:52:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEdKjf7ulbTKJVSjQ0IZAEDhBCNh84tPIlX7ecp1RnTBqJtX+06Bx2RLApzMMINJm1NGrogf90xTdkwH4OoeglhvEkzc2EgrvMU5BamMrUko9Uiwjck5cvxzu0T67x3BvmgAfSxe4RvJJmYUejWBQGtxxcig+j+t7nsQZ+1++Ps50LmcCzbjB2jRno2/S6GnjZr+8KhE2zbui9qhoDw9nN5iFKlJ52307W6uzJYiQKSNDROZZCU4rbaaq/uxSy+4JOlF3dND6YDpBVCVbk1phDH17yVjag5fP1poHC1bY/FkCS8lsPFM8nnD7x2fZpR6MJyBSseroRQNMl4WePEK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wbaIS1hkRjczagCP7WKaw54Czzew9Gn4SKMo0PbnDg=;
 b=W7nxDhNm+xdJSa9DTdSv5dXdR1uuCKzyBURkocx90Wkbg0cQLN2NCAFdAHfDZVfRF/ygNOsk/s2mPrM3VfEjXPL1fTDcU1zFqdirj4R0vBTNanPd1hsdG7b1S46xuX2oPbQ/41lwxDl8l3hMuYmRCR/rizcnB0NkKqvppbWw4bGVO1OCg81uV+0yar1CfAbOFdFZF6lLfi+DkPpDw3Qab2FKmrMlc98gmZ5FfsWedZWj4WTWy15getaNApqf6ZJL98sDTROtW6z+9RP4gAFKMFaqYmxqo3WWFiLGl0TYwtOttbOyOKmHi5rnqsmFQjT5WC7vQyBTOtlKRIqopOJTYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Wed, 11 Jun
 2025 10:52:37 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:52:37 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>
CC: Guenter Roeck <linux@roeck-us.net>, Vignesh Raghavendra <vigneshr@ti.com>, 
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, linux-mtd <linux-mtd@lists.infradead.org>, "DRI
 mailing list" <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v6 01/11] mtd: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigIAAFAQAgAAhxhCAAAxMAIAAXViAgADet1B87pkdB/wY57yAgAEiYbGAAA56AIAABaLg
Date: Wed, 11 Jun 2025 10:52:36 +0000
Message-ID: <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
 <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
 <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
 <877c1ivcym.fsf@bootlin.com>
 <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
In-Reply-To: <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SN7PR11MB7666:EE_
x-ms-office365-filtering-correlation-id: be11c44d-b9e0-4f8a-5443-08dda8d61419
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VUFXSThxbHVOdnVKSGRCbGJ2M3ZLaVVlZmE0by9DMEFrTmdsQUE2c2NjQzlN?=
 =?utf-8?B?YTRtMHhOdUlZQkpURGVUcWdQVWt5VHBKSWx0T0JPNi9EL0JlQlVvb3dWZmNI?=
 =?utf-8?B?aGVwZE5GZUJkTnNNV2tDaFZVTFVORHFPdkNmYi9WSlhSQ29IcEl3NzYrekNN?=
 =?utf-8?B?QzNETU1SMGl6cWFDZEhjTThyYnFpd0hMYTIrckNVakdJZzdKZ1J3dmFCcE5F?=
 =?utf-8?B?eU5WQS9BMHVWblY2Z2pETTliL3lGek40VnZWdzl5dFhsc1hMVzFjQ0NqT2dy?=
 =?utf-8?B?dCs3ZlZjcEp2ckZJMW9SdW5yTUNyRHdkdEQ4bmlMdElpdWwrUFdvNVZMQUEy?=
 =?utf-8?B?S2h3S2dJdGVXWkthaXZWSjc1RStNU0NEdEV1NU4vcjkvRG8zOFczeXJsSlNV?=
 =?utf-8?B?K0N0Ylp2UlZrUWdoZVZ3VXhkUjdkS0xtQXF1VE9zekRIREg1bEFhWCs4eTJy?=
 =?utf-8?B?bisrYU9Xcm5UcG5IelRzdDZaWC94NWs4bXdPMGlLTUV0SHZEWGtOa04yeUUy?=
 =?utf-8?B?czJaMXRYTEV1NHZOeXA1a29VRWRnb05oZ1ZyRWNCZUxESGxlR3kwbEJiY3NV?=
 =?utf-8?B?dE9tRmtxSW0wVUVnOEdMbzFpNWxYZkltMm5odTVkNDRIZGlqbnAyUktTZmhn?=
 =?utf-8?B?ME1XaTZ0a3FGd2h3ZEtWYTc1a1BPT0pBaCtpSEMrMytOWHplSWE1RGZzR0Vh?=
 =?utf-8?B?bGRNenBRcWw3YUhYUFlGZUFkbXAyN0IzdnhmQU4rRDB5TjhIMXpwVGtMTmJq?=
 =?utf-8?B?Z3FIZ0d5d3VVSW9rU01PNkVTUUs5NWhZdnNGempvZG9vRXRoMlJ0aXZIN1Uz?=
 =?utf-8?B?QlA4WXJERTFrdUlja0JtNVFGQW5jTEYvOG51Y3Rta0ZqcXFQSDRFVldpS2dk?=
 =?utf-8?B?QUxadWkzWkh5SHNYYkZ3ZmlYWUpDdW9lSVk0eERwYzYrVmJGYkJYeFoybXNj?=
 =?utf-8?B?dDdSRS9qNnpNQjUzeFlGWHZNenpvcWtJL01aOUZpeEZRVENRVmc3bnM0d3cx?=
 =?utf-8?B?NExVSE9HMDFOQmcwMXliOG9haUJ5bkx2SlZPYWcrNkVEaEpKbDdTRENkOVor?=
 =?utf-8?B?SGF2TlB1K3VBeHhyWmgveWZ0ZGdLVlJ2aGw2TS9CbDVxMzZBOHdKa2w3ZlZN?=
 =?utf-8?B?QzFBRkFJYXF3SWJrWGlUbEFFMGQ0MHlUN2doYWRQRnFKeWZ1YmIzeFR2MTNJ?=
 =?utf-8?B?U3V2R2ZaSE5HMFFYVnlLekpsVVlPaXF2c1FwU3c4akE1YmR4aVBuRmJaZXh6?=
 =?utf-8?B?dGo4U0VKamlwRUlNcXBXNkk3Y2RvRTUzREUwaFRpUFRHdDZ4ZHFyeVNFdlVT?=
 =?utf-8?B?VG9Cdy9mckY3S0ZNaDZvZDVPSWFLb3Q0WTg1a0d4UkUzYnlxeUM2STBEdW8y?=
 =?utf-8?B?VGpBVlJBZkR0RlBwdjk1TDdtQTBlQU5FMjVJRGplMFZzeUtuditBeGl6cGdp?=
 =?utf-8?B?NGszMEJTY2xKQlBXbkcxay9uSWQwKzZFN2IzV3hrd3VBeXNtazRjajJHOFY0?=
 =?utf-8?B?MmpqMHhpd0FpV3pBelJMbnYxZFpOS0YxWUQ5S2xhaCsxSDB6cHV4MnJVTXNq?=
 =?utf-8?B?R0Zjb0hjTm8yTGxRSWNPcDhMd1FTZWdiN0RWbzh1Z3A5RmV4czVRR2RrUVRV?=
 =?utf-8?B?QnlPbjNTNE9GYzRzTnd0cUhLelN0L1JmeFBCc241MWNpcG9TOThuVzdURU9T?=
 =?utf-8?B?NTBzT1VYSFNXMUJNVmhSMTBkcDZ3N1pqeGFidTRseXppcGY0ZGRVZ3Z3VGQr?=
 =?utf-8?B?dkRhbWJwMzZLa0FaZU9XdGxQS2Rkd1FLenkxd3dBcnNMVlFRUm9lZ3JZcDd5?=
 =?utf-8?B?ZkN5UWZrRmpsaEgzY2NTTTVKb25JS1RHR1J2aFhlWnUyZkZaNHBHLzJrTTQv?=
 =?utf-8?B?RC9KbWVvWFFRQkNRanBNWGFIOGJGZ2FlMVlNMmw0T3ZHR0ZTWWFJMFFiQU04?=
 =?utf-8?B?d3hUanZCTmtWWnpMU0dPSzliWmg5bDIwZk5RRDU2UzFndEp0d2t6a2JZL3NY?=
 =?utf-8?Q?zN+0bxGiywiYc49d8mdP0KZ70RnorI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0NscEFIV3grSkFwWHlTSWtNOGs1Vm00WEgvbGJtcWlhKzRSUUZwVERZM213?=
 =?utf-8?B?dWdIZFNZdGUrR0ZlelhRU1FjRmE4amRYTUROZ0RKaStKa3lkQ0RkTjU0Qmk5?=
 =?utf-8?B?NzVHMlQyd3BDZko2aGpRSlgzajMvOEMwMDR5Nk9uYng2ZUFBdlFPV0l4bHF5?=
 =?utf-8?B?dmdvTTJJT3ZLNVFXcTYzbm9iY2VMTW1HVU96b0hWVXlyTC95UDdUamRoRzRS?=
 =?utf-8?B?dUNvUE9rQkVWbVZFWlFDekVMdjduRENpSENTSFkzbmV0R0xQZFNSZUtmalQ4?=
 =?utf-8?B?dnNxSk5Rd28xMTZpdERPNk8xR3NaUkpjWklJaGRnUUtLcFJwYmFFQUd3WSsz?=
 =?utf-8?B?dVBkV1cwdFdiTStObkFlV0dkbDNCV1FZU2src0pPeWpwZWZwRVl1TmhRYWJ6?=
 =?utf-8?B?Rjd5c203aldZVDNlT0pWb2p1UmJheTZya0pFNGxrR0UvRmRRendVZjRzcytI?=
 =?utf-8?B?bXViMHh1QVVkbmJZTEdMbU5uS2lJci9RYmFzN1FsNjN5VFpVVEFuTWtvd25n?=
 =?utf-8?B?dUhOWlNJZHpOaWo2WlZ0SkxYZHVaMTBtOFQxTzRyaHNOcm50Q2lJSVpjZXpP?=
 =?utf-8?B?d0kwTVpKa2dxendjektyU2Rrd3dSY3gyWkR4M2JqVmFIVFRHdnRIVFBUd2VL?=
 =?utf-8?B?aFNkY2NJT0czZDZwWEpFeU44NEFOam5uTkxKdGVtMzNMOFFqdEEvWEtjdFZS?=
 =?utf-8?B?amFLQnBXU1VrNW5FVzVpM2N0K2QrQzFMMk4yUnlScVRLMG1RVFk1elhGcDI5?=
 =?utf-8?B?US9SRVpnMjRpVW9GQ1RMYTFkMWQrU3g5QUZDY2txU3MzL092eWFLTDFMdGdF?=
 =?utf-8?B?K2ZWMmNCNC9yMUkrWTR5bUhUTytkRE1wazBJaU9wVWlWMlYrQ2YwTHVPV0Rt?=
 =?utf-8?B?VVIycGZaWEF1UmZsSjBZRWQyVTdseExVS2xYMVhDOHdXQ0puREdZRHZTMGJC?=
 =?utf-8?B?NDVhbFcwTTZ3VmMxSVNMblp3ejlsVGVzekdxWkNsWUtjU0FHVXdsM09GNU9x?=
 =?utf-8?B?L0J0OGxzeGgyMnlPS2V6NEg1MGZ6OEJwRDVRSnFBbkh3eWREVVdxdEdaSjcr?=
 =?utf-8?B?b0lqTU1SS1Z5Y1QxdFFtaUJXZjZXTlBtWjBmeWJPTDJZK0JZSjc4MklSVmRy?=
 =?utf-8?B?U3pEWFBGbnpZKzVHemZJazB0YzBQUnB6dm9MZytYRlh3UE5LMDR2UVNFUlA4?=
 =?utf-8?B?czhQS2F4blVhSXlXTTRUY084dEdiSjMwWUFpSVdPRHpVZ1hmcXlnOExQSmtH?=
 =?utf-8?B?OFJFdW1IRElsSFVzUTRFTHpENHpuSjcxL1djcFhLM0JDUkgyb1F5VjY5WTRX?=
 =?utf-8?B?UU1pbDdTMDM1WCtwUHNEZFdQWnVkVE42UGkwZHhkcWlhR0NEL2JTb3kwaHdw?=
 =?utf-8?B?VGJyVzloWUNVRWZnMk9FOEFIS005Q2tOd3pMbDEvdlYxOFhXTmw3WG9EenY0?=
 =?utf-8?B?MWEvTWNqU2p6VW5xWkFFKzNnSHpmcWNkRDFJN0t0REllVHZrV3FUVXk0eFZU?=
 =?utf-8?B?ajVRS3BXZDBOYjRPUU02bldzS0pjbzhmYmV0RzdzaUZVV3VYK0J4ZDVId2M2?=
 =?utf-8?B?NzJUd3J1aEh0NjJ2b1V0SWpNbU80eEpzbHpSdkQ0ZUYrRU1ERm9oK2dRMXNn?=
 =?utf-8?B?UGZVZVhEWjNwbEFhWTNGRUNqUkFIRU10Y2lVUTZrK3d6WktwT013RGdQV1E1?=
 =?utf-8?B?cmdRZFJPWUpsd20waHB3WVIrQUlwWnJON2tJVVpFN2pCTE4rLzFZbjIyZ1J2?=
 =?utf-8?B?cmhUMWhuK3pZUk1UYzdvQkxLZ0dmdTlaTlo1aWlkU3A2VFdmaVpjcVVoc1hp?=
 =?utf-8?B?eHQ2eUtjTStIdEpQSG1jdEk3NUV3QnNuWUsyU0drbXVxRUdVVjJnOGhxazdP?=
 =?utf-8?B?OEZtRHZmZ2ZHK1VTL1hjdXpOV2hrT1cwbHlQbXBBZVpSd2ZTTVNTSVlySkFy?=
 =?utf-8?B?M1hLZGU4MVI2Ry9KN2xvS012L1ozaE11Zmp4NUlaYlBuNlVXOW5YVnZ4RUsz?=
 =?utf-8?B?RVhlSkxWWFU2ajFuTXowUFNFbmdrWnFXYnNiNmxzU2l4RE1CQUdnekxkU0Fk?=
 =?utf-8?B?UzVrcjdGQW5Namt1eUM3dDVRNjZFN0ZDY2FpMXVYblFoQzlCUzFabFJxL3dP?=
 =?utf-8?B?OGtKM1RSQTdYOVFITG1kMllGL0pMOWxRNzlZWlQybndZakFmcm5STVByZGhM?=
 =?utf-8?B?L2gwTXhieEI3djlVM1R1NmxkNjRQaFh5ZHU3WkN3VDJsbHhmTjltVzliSVVR?=
 =?utf-8?B?N095dDd4S1pDc3EraTNRei9vc2Z3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be11c44d-b9e0-4f8a-5443-08dda8d61419
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 10:52:37.0031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQsrJ7EM0X79lVE2f9TFaD7untDRgrZFebaxmm03D9VMskNTNL2XGlFtQWkoaPoSiGn7CQ7n8TKByJyDgfS8kfdDgSe6enVOcUm7KoDGYNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzExXSBtdGQ6IGNvcmU6IGFsd2F5cyBjcmVhdGUg
bWFzdGVyIGRldmljZQ0KPiANCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQ0KPiA+
IFZvbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPg0KPiA+PiBP
biA2LzEwLzI1IDA1OjU0LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6DQo+ID4+PiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tDQo+ID4+Pj4gVm9uOiAiQWxleGFuZGVyIFVzeXNraW4i
IDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4+Pj4gUmljaGFyZCwgSSd2ZSByZXBy
b2R1Y2VkIHlvdXIgc2V0dXAgKG1vZHVsbyB0aGF0IEkgbXVzdCBsb2FkIG10ZHJhbQ0KPiBtYW51
YWxseSkNCj4gPj4+PiBhbmQgcGF0Y2ggcHJvdmlkZWQgaW4gdGhpcyB0aHJlYWQgaGVscHMgdG8g
Zml4IHRoZSBpc3N1ZS4NCj4gPj4+PiBDYW4geW91IGFwcGx5IGFuZCBjb25maXJtPw0KPiA+Pj4g
WWVzLCBpdCBmaXhlcyB0aGUgaXNzdWUgaGVyZSEgOi0pDQo+ID4+Pg0KPiA+Pg0KPiA+PiBJdCBk
b2Vzbid0IHNlZW0gdG8gZml4IHRoZSBpc3N1ZSBpZiB0aGUgcGFydGl0aW9uIGRhdGEgaXMgaW4N
Cj4gPj4gZGV2aWNldHJlZS4NCj4gPg0KPiA+IEkgaGFkIGEgbG9vayBhdCB0aGUgcGF0Y2ggYWdh
aW4uIFRoZSB3aG9sZSBtdGQgY29yZSBtYWtlcyBhc3N1bXB0aW9ucyBvbg0KPiA+IHBhcmVudGlu
Zywgd2hpY2ggaXMgdG90YWxseSBjaGFuZ2VkIHdpdGggdGhpcyBwYXRjaC4gVGhlcmUgYXJlIHNv
IG1hbnkNCj4gPiBjcmVhdGl2ZSB3YXlzIHRoaXMgY2FuIGJyZWFrLCBJIGRvbid0IGJlbGlldmUg
d2UgYXJlIGdvaW5nIHRvIGNvbnRpbnVlDQo+ID4gdGhpcyByb3V0ZS4gSSBwcm9wb3NlIHRvIHJl
dmVydCB0aGUgcGF0Y2ggZW50aXJlbHkgZm9yIG5vdy4gV2UgbmVlZCB0bw0KPiA+IGZpbmQgYW5v
dGhlciBhcHByb2FjaCwgSSdtIHNvcnJ5Lg0KPiANCj4gSSB0aGluayByZXZlcnRpbmcgaXMgYSB2
YWxpZCBvcHRpb24gdG8gY29uc2lkZXIgaWYgdGhlIGlzc3VlIHR1cm5zIG91dCB0byBiZQ0KPiBh
ICJiYWNrIHRvIHRoZSBkcmF3aW5nIGJvYXJkIiBwcm9ibGVtLg0KPiANCj4gPiBBbGV4YW5kZXIs
IGNhbiB5b3UgcGxlYXNlIHJlbWluZCBtZSB3aGF0IHdhcyB5b3VyIGluaXRpYWwgcHJvYmxlbT8g
SQ0KPiA+IGJlbGlldmUgeW91IG5lZWRlZCB0byBhbmNob3IgcnVudGltZSBQTSBvbiB0aGUgbWFz
dGVyIGRldmljZS4gQ2FuIHlvdQ0KPiA+IHBsZWFzZSBlbGFib3JhdGUgYWdhaW4/IFdoeSB0YWtp
bmcgdGhlIGNvbnRyb2xsZXIgYXMgc291cmNlICh0aGUNCj4gPiBkZWZhdWx0LCBiZWZvcmUgeW91
ciBjaGFuZ2UpIGRpZCBub3Qgd29yaz8gQWxzbyB3aHkgd2FzIHNlbGVjdGluZw0KPiA+IE1URF9Q
QVJUSVRJT05FRF9NQVNURVIgbm90IGFuIG9wdGlvbiBmb3IgeW91PyBJJ20gdHJ5aW5nIHRvIGdl
dCB0byB0aGUNCj4gPiByb290IG9mIHRoaXMgY2hhbmdlIGFnYWluLCBzbyB3ZSBjYW4gZmluZCBh
IHNvbHV0aW9uIGZpeGluZyAidGhlIHdvcmxkIg0KPiA+IChmYXN0KSBhbmQgaW4gYSBzZWNvbmQg
dGltZSBhIHdheSB0byBhZGRyZXNzIHlvdXIgcHJvYmxlbS4NCj4gDQo+IElJUkMgdGhlIHByb2Js
ZW0gaXMgdGhhdCBkZXBlbmRpbmcgb24gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVINCj4g
d29uJ3QgZmx5IGFzIFBNIG5lZWRzIHRvIHdvcmsgd2l0aCBhbnkgY29uZmlndXJhdGlvbi4NCj4g
QW5kIGVuZm9yY2luZyBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiB3aWxsIGJyZWFrIGV4
aXN0aW5nDQo+IHNldHVwcyBiZWNhdXNlIG10ZCBpZCdzIHdpbGwgY2hhbmdlLg0KPiANCj4gT24g
dGhlIG90aGVyIGhhbmQsIGhvdyBhYm91dCBwbGFjaW5nIHRoZSBtYXN0ZXIgZGV2aWNlIGF0IHRo
ZSBlbmQNCj4gb2YgdGhlIGF2YWlsYWJsZSBtdGQgaWQgc3BhY2UgaWYgQ09ORklHX01URF9QQVJU
SVRJT05FRF9NQVNURVI9bj8NCj4gQSBiaXQgaGFja3kgYnV0IElNSE8gd29ydGggYSB0aG91Z2h0
Lg0KPiANCj4gVGhhbmtzLA0KPiAvL1JpY2hhcmQNCg0KVGhlIG9yaWdpbmFsIHByb2JsZW0gd2Fz
IHRoYXQgZ2VuZXJhbCBwdXJwb3NlIE9TIG5ldmVyIHNldA0KQ09ORklHX01URF9QQVJUSVRJT05F
RF9NQVNURVIgYW5kIHdlIG5lZWQgdmFsaWQgZGV2aWNlIHRyZWUNCnRvIHBvd2VyIG1hbmFnZW1l
bnQgdG8gd29yay4NCg0KV2UgY2FuIHJldHVybiB0byBWNyBvZiB0aGlzIHBhdGNoIHRoYXQgb25s
eSBjcmVhdGVzIGR1bW15IG1hc3RlciBpZg0KQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIg
aXMgb2ZmLg0KSW4gdGhpcyBjYXNlIHRoZSBoaWVyYXJjaHkgcmVtYWlucyB0aGUgc2FtZS4NCg0K
TWlxdWVsLCBjYW4geW91IHJlLXJldmlldyB2NyBhbmQgc2F5IGlmIGl0IHdvcnRoIHRvIHJldmVy
dCBjdXJyZW50IHZlcnNpb24gYW5kDQpwdXQgdjcgaW5zdGVhZD8NCg0KLSAtIA0KVGhhbmtzLA0K
U2FzaGENCg0KDQo=

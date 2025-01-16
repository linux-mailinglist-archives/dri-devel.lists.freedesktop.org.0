Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCBA1336F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 07:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778D610E568;
	Thu, 16 Jan 2025 06:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5YbXi3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E3C10E19F;
 Thu, 16 Jan 2025 06:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737010485; x=1768546485;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=220b+hEHYLdwJ0kBAsK62UYU0cF+JjGzSuOt1bd1nko=;
 b=C5YbXi3df3pPFaiMUfFO9uh2AaNNVX2AbJSsz9lARuoBkuDFic37S9zq
 Mr+q+CZH/ciPadkNL/iGZkMQyCCG6h5tW+CUAgDX6Jsv2xxLJttjicpJz
 6Rsv851O5VB9jQ63SHUXzUAh6Qu2ukuUOeTFmVaEkLcZ815PKiIYBXE9E
 9EHBvsMnSXtWYYNPN6hsKGlLXT5acHdmT81jmnv/nQGrtX1x/gg9aLwV3
 uhs3wPKQYoL8bYK89dUR3P3rIW6HE2WmtKh+JdFLixh5mAbfKiCX+m12P
 DZSNF+OrDuqcvKBTyraBPgTPP34aRzG7iRIcncn/Ol/VzsZ28KhziDX/R w==;
X-CSE-ConnectionGUID: 5Ki3Dr3ORLaGOABpGdk0Ng==
X-CSE-MsgGUID: xp6BBws4QT+DsqbjHszx3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37409745"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="37409745"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 22:54:45 -0800
X-CSE-ConnectionGUID: gtK7BtuhTxGlVg3O7Ywy4A==
X-CSE-MsgGUID: rGeq7qTRSK2J5tCDoTJ7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142655478"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 22:54:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 22:54:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 22:54:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 22:54:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNUe73oqhxPWruR0naKqdusOCVSNbg2j7PcLx7/8FimTlIZ6MaXeRfjXl8dUjXapvB5+4XrCWi042yz9NfRQCUWVMDMLaY8fmLdY5CvDx+Tovgm1HdbiefiYpc1RnKyauwfnPOdRCt5vBzDKha1dSxa2z/+//ZVP5UkbmcV9+1edCE1Si69983avswaCNnNMFVeWKTBHSMdLe3NP50qJilIBOv54wU5e7fqzR+sSjALzGV0bxj3mSasBFUiANIuZKD11ibWTjTg002HnEv6AfKh0YIOCsCK9bS64gyVVcy1mK7GStqcVMbUCjczsFxjB1w1Lrn3PTxHSscfNWcLvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=220b+hEHYLdwJ0kBAsK62UYU0cF+JjGzSuOt1bd1nko=;
 b=J/ink/SNS651BoIkbziKZDITyQTUSe5w29GZ2AedSGCwsRDzs2ks0gKhlruZdOKXGBZhe4zM9HnNcVE4R6eRAW/NXsJ4KQCp5LcYd2F6HoA4ZJkSbckS/RONWe+YF/xtmA25Ba+1aeEDs9liXU600zEGgXyrivgZBTVFsgxOFgB7bECRQRAvX/92xe8MdMYUbYhL3FsP7xRqkmMudawppUPgY4vPjCGw9guscNWkkg9Te2QVsWR0z3GfLpt0EbgPV/WXjErMI3XqQ7OOtigWQY5K3diJDfo7Yk7/ahvgsIJKjT5YCD4TVX4h9PyWl6csuIPqYMoqtRceKU7sZaBfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 06:54:39 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 06:54:39 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
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
Subject: RE: [PATCH v4 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v4 01/11] mtd: core: always create master device
Thread-Index: AQHbXGTq3Ynz/rfH2UqisY27+I2b+LMYgWoAgACDNgA=
Date: Thu, 16 Jan 2025 06:54:39 +0000
Message-ID: <CY5PR11MB63660C230457299E1201C38FED1A2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
 <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
In-Reply-To: <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB6883:EE_
x-ms-office365-filtering-correlation-id: 1e5b102a-ae37-47a7-a35e-08dd35faa5ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M3gyNXBoNGd5UkdrOENoZ2V4SkRrRGZHNjRUZzNML0tweHlLUHV6UUZ4d2xO?=
 =?utf-8?B?QnoxSTZuQTJLQzZKNnNML3V5UVNMbGdBYXRFR1FOM3o4TXR4djlybU11VEFH?=
 =?utf-8?B?WFZBZnhCbHpSNXRlVzFRRlZlUTZQOE9kdXNrWG54RnFsalBBT1k5TFB5NXYy?=
 =?utf-8?B?N0twUmNVRVFTZHZINmIyb0NtK2dPZ3B5SDFGNFNDMmFmVG9HLzc4a3Y1dTVD?=
 =?utf-8?B?aTFsZXZGaWVsYzJobDNpNVVHWmN3ZjFUZ0xpejJLRW1uMXpUc3l6WS9wbFlQ?=
 =?utf-8?B?MDVlUy92WkVjZ3ZHdTJqQXFzWUpnblErSitZcWs1SFdsdi9xTDgxbXFwRVVm?=
 =?utf-8?B?OThBcmxrdmVsKzdXeXNUam8vTGc0SUtsdG52Qy9xZWFhUnh2c1FXSkZiUFZW?=
 =?utf-8?B?dU9nMFIvcXFDR0tNUVY5ckNhQlYrbHFJMmhra2ZzbEdkcVNiM2pSMlVMQU9F?=
 =?utf-8?B?aVZUQU9JckFLS1cyOVZRNWg4eW9ySjZ0SW80OVNseW8zdStoQWIyOXFEVEc1?=
 =?utf-8?B?dWpjN3QxMzVhTlhxaERmMzZqVU9XRnhBd05zUXhqemZndzcvc0xiN0QveDdH?=
 =?utf-8?B?NGFRc3ZPYnhKR1RyWTMxdncyNWw5eTd4SUFrQ2R2SWtYQ3MvNDRQWEJHbU1D?=
 =?utf-8?B?cTM2WDBtaUIzbVcwbytBTUkvc002Nmhnc2xLZFhiNTc3YWFUVzhHL2tBbC9y?=
 =?utf-8?B?TzRTZWd5ZlZCKzJzU0lPV3pSZUJtWndEcUlHVUM2eXJFdG1YMENUSXJQYnhI?=
 =?utf-8?B?UmdIRDhCeUhPWjdtQm5KemJYZEtpV0dGeG9uRlJEZGYwTnZtb041ZlNIK2dI?=
 =?utf-8?B?WkcxWWErWmloSWFuWHZYY1NOcWlQWXl6UnkwZXZpQUNIdXl2YW5mN2IyRVI4?=
 =?utf-8?B?Nld4cUFTQi9uWk5iSUxzY1grRXB5dFlVaDBkaWhXa3pxdFd1TmJhZXNERnVj?=
 =?utf-8?B?N2d6THBWK0k1Nk1VN2lVSWxZT0N5V3ZEMi9lanZOM3lvOHExdFBWUTEreWFv?=
 =?utf-8?B?cnZDU0JUS0o0b3lwdUJBYkdHampjS0tyT2FqNEF6ZVR5Y2oxbUcrY2NxVG11?=
 =?utf-8?B?dGd0MVNyWG9IaFBuRVluUFUwQTNJTE9HZENXSVFvdXNmKytzMTdSa1djUzdi?=
 =?utf-8?B?cENicWlxMTNadi94NjhMR1Fwdnl4dk1ZeUN6WDRKeGpxSmVobk5vWHUwYm5h?=
 =?utf-8?B?Y01yc3lBV00wTjRwRzNFc1M5OGY5UnVOY3RvV00rMWlzbHBkcFk4aWk1K2RQ?=
 =?utf-8?B?alc3WW5ORFZjdmQ4SFBnL29EdlNEcGx6V0s2Q0EyblBFeHB4RlYxYmNyRXFN?=
 =?utf-8?B?WHJpam8yWVczZWhUQXlyWlJUUm0yL1dOWGd0Qm5hZUV0YjlHcUxBTFBDQmF0?=
 =?utf-8?B?aXhkVDhVZG91cE9HeU1rRmRjdHFnMnhkUlpFcm00T1ZxaE5jQkNuWW5IQURt?=
 =?utf-8?B?S1Z1OFZxM2dsRUFhaTc2OXJyN0w3Y1FqUWYvZTdmVzZidFAxQ3RsUlkzSjF0?=
 =?utf-8?B?YXhRSlZHVXorNHJ0NE80K0VpVE5ETlM0THNieldUZ1pNUFlvdmZSNEUvczNK?=
 =?utf-8?B?U09KZERvbjVIU3QyaHNEUHArZW45cDdORTFLWno5c3M4MHQ2TVJ6QnFvT2cz?=
 =?utf-8?B?RkNIN21pWFJCVC9RRDJYcURGaUhMZjZsSGo1b2FJQlRoR2RGOSs1TW9SeUc2?=
 =?utf-8?B?Q2RYMlRTaHRQYjBIcGVBaTg2OVF2dmpjMllnRllaandnSURsVmdacytwVkJD?=
 =?utf-8?B?QVNNdE5QTnVydzJRQWFSaTdHYVN1NTNRWFk1d2x3dHljNm5aMlhaUmNSbFdJ?=
 =?utf-8?B?d04rMXpNRC9vMUVmNUVTYzV5dmcvY2U5SGdhSEx1VzY2WkdtdC9QcTh4OUNn?=
 =?utf-8?B?cklrMWx5TXdHL3ZrUnhJMW5kL2lzMHlRTHRJWGJjVEVqeDdoY0RZMVgzZExx?=
 =?utf-8?Q?udUg1VD4TiqBWQqhwr2KP+8AS9OEJUDJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(7416014)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTVTNFljVUtWNmZLTG1RSURLa0cyaE56TVNveEE3Slp5c1MxejJFM1VOVVk5?=
 =?utf-8?B?bnQ5aHpVZUNwRVBUOWY0R1BoM25sVlNwY2p5NlBkeTRvN2NIc0lIZm44djJU?=
 =?utf-8?B?bytzcjlVZXlmd2pDTXpVN1k3MXczT0R3M2txZnBKVjUzbGVRRUxqeXZGSFVt?=
 =?utf-8?B?VDFGU243S0g2Q3F4U2pFcXo2eWdvN2lNa3poQU1jY3lQNEkrRnJHcjRYMi9H?=
 =?utf-8?B?c3BCMnlnODVFYUNtblRNRWZxUFQ1RzZGek1ibnBCazQ3NExRV0ZCTmFEUmlD?=
 =?utf-8?B?K1d1UVRpcXhuM3lXRDk5M2dMMjBHUVQ4VGFNNjZYdGJhMEJ5V0I4REM4blhY?=
 =?utf-8?B?K3NIY2pvRzRmUFltaFhFOHlZVFhTejgvNlNRWFpNVHVaRlFvaHpvNWhxSzB2?=
 =?utf-8?B?Q1NSMmFZU1ZpRzJZRFJhSW9EalJTQ2lWV1o3T1VRYTY4VEwvQlBneW9aWDUr?=
 =?utf-8?B?K2dqL3p5Q2kySUVOSFRyNWhYUWpzK1RxR1hIYUlxM2FrSkRhOXNlcXlaUWxX?=
 =?utf-8?B?eTRhN1hpZWRxZnMwNmJJeEdLZzErZkN6dnhWeVp0VCsxYm1SMWVQcWZvVDNX?=
 =?utf-8?B?d3lDUEFSNGdDN2xlbzZYcW5BQ21vM0RueTZPNHFvc1FHVVhSc1QzbXVpRkNm?=
 =?utf-8?B?UnFMMmwyWk9neXFjaWhYTkpsaXVPby9PMk1qcnc1YjRmNEJmZTVwK1VwYkwx?=
 =?utf-8?B?RHJ4UGh3cHZFbE1OeklUY2pVbDE4RmRQTGQ3OURHMDlFU1JyeDJHdmVOMEdR?=
 =?utf-8?B?S0Z5Y0RiNXZOZVRuKzNud1RTMGlqeVdVd0xJTHpCaXU3RjdUNUg3MkNyMnhH?=
 =?utf-8?B?SFF2bzM1dGhHcEVJUy9UMUJ2ZThjWXNCZ0JNVG5IMlljQ1AyNmtVUnI5b1Nq?=
 =?utf-8?B?dlFOb210aGxmL09aWnNTRVZGK2dqTlpuSTRJUUQwTjMySDlmSTV5SmdrV3B0?=
 =?utf-8?B?WTRCUllRM0doQ2Y3UG4vckRPWHdtSk5leW42RXgySW1BQS94TUZvTFkwTkN2?=
 =?utf-8?B?M3JzcnNIM01MRTVnblArM2NMN1hoZXR2cDJwTThkWVhjcjZuYldrUXRtejRw?=
 =?utf-8?B?S3VDYWVYZVBldnkrbGs4K2FvTkNpNHlUN05pcnM0Zk5EQ3Y3V3dWV2UycS9R?=
 =?utf-8?B?SkZpMTd1UEN1RVVJKzVUcTBQejlpNGpzNzN5THlVUDh5YmRKeTNpbE1vNEp4?=
 =?utf-8?B?a3ZGeEFKY1dHUHNwSmdSbEZZQU5tbHBvVzNucHlTSFZNMDVzcFQ2Qnh3NkNu?=
 =?utf-8?B?VTdDYlBxT0JlUm91NVEySC9TTjZQWnR0RTRxYUcwOURnYld5OW9nMmZ6anFj?=
 =?utf-8?B?RkdsREpHY3V0N1h1N2R6VjYyUEFOOUZoUHlqdjNlQWlnektPWXEwZ0xrcm5H?=
 =?utf-8?B?RWp5eDVKRU1VcTI1c2g0OW5oNytHVDhNcXlleGZVQjNySWZWY0FVOGhQclEx?=
 =?utf-8?B?YjBDSStJT3NreUhRYzE5Wng0eHkvRkVZM0g3RWM5cllFYi9yYktVaDBCZFAx?=
 =?utf-8?B?eFJsWGExbExqdlcyQjZSSnk0RzdZZExOTWhOY0thSko1bHRMM242dHBCTytS?=
 =?utf-8?B?clBiTTM3bWVXUjhuc0hEeHNQNGdKeW5hYnFZRWhRcHUxSDlBN01BVE02b0Zj?=
 =?utf-8?B?cE1vTThuNURwbHdXUUxPcDZpWDJDdTR1bjVUMkRnU2xWcExMc0Y2K2pCRWFt?=
 =?utf-8?B?U3JRNnl1ZlUvT013Y2V1eGlvSEJSQVI2SVAzbGVMQ1RvVFo1T3R0V1VrbmxK?=
 =?utf-8?B?ejdXYWY4RnI0Tmh1NFdkR2cva0NvaTRPNUNBQmpJdWtsemNHMFZ2enRFMWl4?=
 =?utf-8?B?a1JqWGUyS3pXVk1TTThLYVZFd01RdWlpQlBPVTNnWng0UVpFMFk2VUJVdUFW?=
 =?utf-8?B?M3J5Vng0eEd0VUVZSWFmMnNHZ1lCNldmanRhU2k3YUt6WTJ4UERSQnVGZVJM?=
 =?utf-8?B?VzVvOFRIelI4WllpUGlTcTYzZU96b3RwLzQraVB5VFpwTG5hZm9NRnc2ZS95?=
 =?utf-8?B?RWNSN2xSdWNIeDArOE5RSFp1ZHFnZjUvdEI3cVViRmNNOW1SNWFoTHVidHVw?=
 =?utf-8?B?b2cwSDloQVFyZzU3TXBuRXFCOFR6SHVxK0Z5NmhCd0ozZk4xanQvZ1VJc1d0?=
 =?utf-8?B?N3MvM3JsUlRVSk82dzV2aW85eEx4RHpQYWpkS093aTAvS3Y3bmMrYit3SUxa?=
 =?utf-8?B?M0doM1I4U2tkditoV0dEK1hXWmtKU0NkOTdSb0M0Tmcwc1lRdkVPVytCQ0Nt?=
 =?utf-8?B?aVFPU1VXZHZBWmNJaHZTVktQdXRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5b102a-ae37-47a7-a35e-08dd35faa5ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 06:54:39.5651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GxubvAZ5DmVEgsCCGz19LuBtCshNfgJPn46MJwqIglUDc+aih/r8Wc4tfxoRtOIflQqbFgIEKSS+vnCPwPt/hAxX0ari962ZjPEyGXgZq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
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

PiA+IENyZWF0ZSBtYXN0ZXIgZGV2aWNlIHdpdGhvdXQgcGFydGl0aW9uIHdoZW4NCj4gPiBDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBmbGFnIGlzIHVuc2V0Lg0KPiA+DQo+ID4gVGhpcyBz
dHJlYW1saW5lcyBkZXZpY2UgdHJlZSBhbmQgYWxsb3dzIHRvIGFuY2hvcg0KPiA+IHJ1bnRpbWUg
cG93ZXIgbWFuYWdlbWVudCBvbiBtYXN0ZXIgZGV2aWNlIGluIGFsbCBjYXNlcy4NCj4gDQo+IFBs
ZWFzZSBleHBsYWluIGluIG1vcmUgZGV0YWlsIHdoeSB0aGlzIGlzIG5lZWRlZC4NCj4gSWYgdGhp
cyBjaGFuZ2UgbWFrZXMgdGhlIG92ZXJhbGwgc2l0dWF0aW9uIGJldHRlciBhbmQgYnJlYWtzDQo+
IG5vIHVzZXJzcGFjZSwgSSdtIGhhcHB5LiA6LSkNCj4gDQoNClRoZSByZXN0IG9mIHRoZSBzZXJp
ZXMgaXMgYSBkcml2ZXIgdGhhdCBuZWVkIHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudC4NCkFic2Vu
Y2Ugb2YgdGhlIG1hc3RlciBkZXZpY2UgYnJlYWtzIHBvd2VyIG1hbmFnZW1lbnQgbG9naWMsDQph
cyBrZXJuZWwgYXV0b21hdGljYWxseSBwcm9wYWdhdGVzIHN0YXRlIGZyb20gY2hpbGRyZW4gdG8g
cGFyZW50Lg0KSSBpbml0aWFsbHkgaG9va2VkIHJ1bnRpbWVfcG0gb24gY2hpcCBhdXhpbGlhcnkg
ZGV2aWNlLCBidXQgdGhpcyBpcyBhIGhhY2ssDQpub3QgYSBzb2x1dGlvbi4NCg0KPiBGcm9tIHNr
aW1taW5nIG92ZXIgdGhlIHBhdGNoIEkgdGhpbmsgdGhlIG10ZF9tYXN0ZXIgZGV2aWNlIGNvbXBs
ZXRlbHkNCj4gdXNlbGVzcyBmb3IgdXNlcnNwYWNlLCByaWdodD8NCj4gDQoNCkFzIG9mIHRvZGF5
LCB5ZXMuDQpJbiBmdXR1cmUgd2UgY2FuIGFkZCBjdXJhdGVkIHN5c2ZzIHdpdGggY29tbW9uIHBh
cmFtZXRlcnMgZm9yIGFsbCBwYXJ0aXRpb25zLA0Kc28gdXNlci1zcGFjZSBjYW4gcXVlcnkgbWFz
dGVyIGRldmljZSBpbnN0ZWFkIG9mIG9uZSBvZiB0aGUgcGFydGl0aW9ucy4NCg0KPiA+IGludCBh
ZGRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkNCj4gPiB7DQo+ID4gCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAgPSBtdGRfZ2V0X29mX25vZGUobXRkKTsNCj4gPiAJc3RydWN0IG10ZF9p
bmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQpOw0KPiA+IAlzdHJ1Y3QgbXRkX25vdGlm
aWVyICpub3Q7DQo+ID4gKwlib29sIHBhcnRpdGlvbmVkID0gdHJ1ZTsNCj4gPiAJaW50IGksIGVy
cm9yLCBvZmlkeDsNCj4gPg0KPiA+IAkvKg0KPiA+IEBAIC02NTUsNiArNjc4LDExIEBAIGludCBh
ZGRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkNCj4gPiAJaWYgKFdBUk5fT05DRSht
dGQtPmRldi50eXBlLCAiTVREIGFscmVhZHkgcmVnaXN0ZXJlZFxuIikpDQo+ID4gCQlyZXR1cm4g
LUVFWElTVDsNCj4gPg0KPiA+ICsJaWYgKChtYXN0ZXIgPT0gbXRkKSAmJg0KPiAhSVNfRU5BQkxF
RChDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikpIHsNCj4gPiArCQlwYXJ0aXRpb25lZCA9
IGZhbHNlOw0KPiA+ICsJCXByX2RlYnVnKCJtdGQ6IHVucGFydGl0aW9uZWQgbWFzdGVyICVzXG4i
LCBtdGQtPm5hbWUpOw0KPiA+ICsJfQ0KPiANCj4gU28sIHdoZW4gQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIgaXMgbm90IHNldCBhbmQgYSBkcml2ZXIgbGlrZQ0KPiBNVERSQU0NCj4gZG9l
cyBtdGRfZGV2aWNlX3JlZ2lzdGVyKG10ZCwgTlVMTCwgMCkgd2UgZW5kIHVwIGhlcmUgd2l0aCBw
YXJ0aXRpb25lZCA9DQo+IGZhbHNlLA0KPiBhbmQgYWxsb2NhdGUganVzdCBhIG1hc3RlciBkZXZp
Y2UgYnV0IG5vIHJlYWwgbXRkIGJlY2F1c2Ugd2l0aCB6ZXJvDQo+IHBhcnRzIHRoZSBtdGRfZGV2
aWNlX3BhcnNlX3JlZ2lzdGVyKCkgZnVuY3Rpb24gd2lsbCBub3QgY2FsbCBhZGRfbXRkX2Rldmlj
ZSgpLg0KPiA6LSgNCg0KWWVwLCBtaXNzZWQgdGhpcy4NCkkgdGhpbmsgdGhhdCB3ZSBjYW4gY3Jl
YXRlIG1hc3RlciBhZnRlciBwYXJ0aXRpb25zIGFuZCBjb25kaXRpb24gaXQNCm9uIG1hc3RlciBu
b3QgY3JlYXRlZCBpbiBwYXJ0aXRpb24gcGhhc2UuDQoNCj4gDQo+IFRoYW5rcywNCj4gLy9SaWNo
YXJkDQoNCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg0KDQo=

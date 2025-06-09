Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3AAD2221
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D19310E120;
	Mon,  9 Jun 2025 15:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvz+aWl3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6ED10E0DD;
 Mon,  9 Jun 2025 15:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749482195; x=1781018195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X3unb1QIEjmjLTXyNXg1kQItoW9r2XqiEXRQNC9RCbE=;
 b=fvz+aWl3Dw3AKQ6Um6k+bUeu3Vi500ka9EfZQtFV0ysGrrtyh3tSgKAr
 au939OKF5YpG8adMA9cgk9MdBfnI0NIBeaMYd9NIf/O31WEtRUUBo8mV7
 I1/+XOiaHuJZOo8O2nKsCjDzrKQoPZzzm/8BU1/K7582Q5JaZ/6aF03lR
 mi6SsG+v7pbjkvbo8ui95+BatENk/A9kZZaru9Mmtxv5EvkwzrRFOh99q
 6mbIFFJ2iZJ4tHMndKiDu2glgX6kbxyPMZdHLa/YPv64qdbwb5j/t+tZ8
 7BtNHJ6k+hSIk3mPtF++dS72z9kg1cyXFEKRGgtDcu5AgcMuJNp24FS39 A==;
X-CSE-ConnectionGUID: XPVbIZnTRjWapTQHhSFwQQ==
X-CSE-MsgGUID: pqsAg9wvQKKLGP+i+J2yhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51648037"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51648037"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:16:34 -0700
X-CSE-ConnectionGUID: ENuPUEP0TfOkS4BCq54b6g==
X-CSE-MsgGUID: 5+nB0rTCQDOfQ0KzoKHhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147480735"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:16:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 08:16:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 08:16:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 08:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqoGW+zxj43TETm1rxPqAoqs8gJZ1WaTytG1yEya7JKhj2QYponfgSl9xN9zQHherml0d4PaU6Dkarp5FQgiaCJVqa91n8ID6hXM2vNunEMsUx2asDDUzud+iweiyjBIv1NFE9zmTaTW5fXm1LQKJhdiaOcuXZUZmqlKpLMNiVst65efDSOJHznNmsqHdt9lOWVy7mTkanIs/UkZN6YJlV1JnNv//QtYflZhz6gtnObt9oRgcsIeDonqq3MHht1ErhLkSZ6yfNarVWq3XXiThWlVJK8LpIZig0V+sa2Ev/aA5BvKiTlj1QpLcyM6EsM7dkVKL62/HsEsOv/Q2QL1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3unb1QIEjmjLTXyNXg1kQItoW9r2XqiEXRQNC9RCbE=;
 b=sW3Yc3imiVDh4amPULyv3Eo4J0Eavgc5ilVP3nODW1XpFLQaoV7+1pHATrxpUsY2679NZ+Sva7c4oFgn2UjlTJIfurd4fsqc5DKfdjJu7+NM+4BUynamgXMME/Q7YgYYiM4viytnSiba1FS11UEtHYFy4N2GDctDyMLl8nsVhfY1kOEIXI5T1wWSzx/qyoTSUxzq45QAqIWAHtLYxgeWdJ7eA6JLieCJiL7Ln1NUsbBv5Uov+pR0+fBh4DiLskYpGi6E6h7W4YaGBCBtHpVyeBr4D7wlPSojQTs7cIzYm/kZ2JMUVO5aqe2QQ9Zx+LDqRWjNOvsUODoOyZLlyDVokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA1PR11MB8857.namprd11.prod.outlook.com (2603:10b6:806:46b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 15:16:27 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 15:16:27 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Guenter Roeck <linux@roeck-us.net>, Miquel Raynal
 <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v6 01/11] mtd: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigIAAFAQAgAAhxhA=
Date: Mon, 9 Jun 2025 15:16:27 +0000
Message-ID: <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87bjqyja7o.fsf@bootlin.com>
 <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
In-Reply-To: <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA1PR11MB8857:EE_
x-ms-office365-filtering-correlation-id: 8529c426-4766-41c1-beb9-08dda7689abc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dk1GczM0Nk5vWWZHaWkvMUxvblFIY1RtazNvVUtRcWVxOXNLMVVoVFlUd2p4?=
 =?utf-8?B?QVpaZDRXUTI3SmxXM0VJYjk5WWtyZEh2dWFnZTVGTkhVU2NEWDZkVCtiZm9x?=
 =?utf-8?B?eHNDeU50OUVuUGZaY2U0eTNhR1BuT1R4Yi9NMG5mK2J3YmVsb3Ywd3VhN3Iv?=
 =?utf-8?B?RDREaE14SXBMSGcrNCtLbVVIaldYM285L0hPb1JDZ3c4MmFia3VzL0VocXBu?=
 =?utf-8?B?cC9XQ3Q3YkFrS0RsZjBKSmhxQ1N3a0dzN3kxTmVScU02d01GeVdmVDhZSXda?=
 =?utf-8?B?RjBjS05wdEV1TmNGVHRKWmN4dlJHMjBBQnhhY1VmVGhqWldoZ3ZXSTduUGNM?=
 =?utf-8?B?YzFPaGhteUV3TUhPY0pTWk02T1RxbGM3OFlCaWNGUlViMittSVJUSDNiQkNh?=
 =?utf-8?B?aEI2YVpBYllRQzZiN0NNNlNNQUtGS3hhaWVORmtBYUNzQm51aGROclB3b3U4?=
 =?utf-8?B?YUNQQU9qMC9sa2JMd2M2d21LUExkeDMwSHQ0Z3VPOTlOQW1VSWkxeUdDSXJ6?=
 =?utf-8?B?WjhMbUVEdlo1L1E2Mm1zUEYwYU1sSmtZTzU2cmtGUlBYUkhaY2VXbCs2NW1I?=
 =?utf-8?B?NVVjdFdqR09TWHB4clRBbmdyVkVQMDZVb25PQmRDS1YzcEtYdFJyc2t1OTcy?=
 =?utf-8?B?ZWtTMmE2WWJvT3dTQmNPaUJndGZGVFk5ZmJXY1dzaEs2ZjJsSU1TZEdKOTBt?=
 =?utf-8?B?bWcyRFJVcEtYOFlUc2xwR1YrTGd1L1pmdkkzdlFVWXh3UHNlWlYxTXdEL1NE?=
 =?utf-8?B?bExJeSs2VDk4RU10YUJtQkRTRGxaKzZzRldSMENxLy9qSlM2aW9neDltdWc1?=
 =?utf-8?B?MzhoeG9nZ2FSM25NdithbmZSWVVVaHRVNlliN3dQQ0hVQkwxaWgxa1RKU2M5?=
 =?utf-8?B?R0czVjBTYnpnd1YvOVRUajBoQVkvaVBoaXFFeno3ZzVoblZIUWg0NjZUZzlB?=
 =?utf-8?B?emF0UGRrUzFKTmJDL0pyUHZLNFp5amZ5L3RablhSRWZEY3JkODdubmZCYUwr?=
 =?utf-8?B?eG9RNjdmWCtvbjZXdlVTN1pYYTBiMUJ2UnE3K2tNUTdxMXQ4NXc1UmlnQ2VN?=
 =?utf-8?B?R3c2Vk1xcXpuZWlPNEp5dmJ0ZXpjT1g3ZWU5NW1KU3NBRGV5eHFjSGZsa2xJ?=
 =?utf-8?B?Y3RSeHBwTVJrYXFJRnF3N3NzVGhkNlZXR0pYdExONHFZUTJZTHJDaTFKTzNk?=
 =?utf-8?B?L1RRNFBucS9Pemh5dnEwSkhaT056UU1VRW9QT1lpOUVpbm9KSGtoemJwM3B6?=
 =?utf-8?B?TWlja1N2MVRnaDQ4VzBUMkQrTUI4dVpuZ2ducG1DRGJHeHBPcU9LVTVwTEJo?=
 =?utf-8?B?alJFU0JvNnFlcTJCWEtVSlYwdk8wclo3ZWVuTDk2YjZZbEdvZ0VVZ3lsVFNj?=
 =?utf-8?B?K0tPaWRzTHp3Sm1xWXZyMmJTU01iRGFlS0kyRnIrd3Q1OXJMOEY3cVRaLy9C?=
 =?utf-8?B?TFlQeG9jbkhhazdDTWwrWXo4N3BPM0IxR0NPZ1RXM016ZnNvTSs1VXNPaHlY?=
 =?utf-8?B?UVc4VnhFSDBxM21nQmFrenppNkRNNDNXTEpBZUJuSDlFdFIzV1NTK2QwN0lq?=
 =?utf-8?B?dUhqallJeEhVS2FRS2taOGZzWnNhNGZZTjk1MDBwK2tkZW50RzF4Q21WeWtH?=
 =?utf-8?B?d085eGlza3hDeWNpQ0tKTzZJdGcwdytNdEMyblBsUmE4citXT0doR09hNVZH?=
 =?utf-8?B?VU8vUkR3b0pnb3c4aUNpM2ZNWHIrazBJNTF2N0I1eksya0FiTjRiM3QxRm9O?=
 =?utf-8?B?YUtNR0tnaThHV2ZrRHptcHVURVNvVFRpSkc2dHE0YlpWeDZuaitPckNUMTY5?=
 =?utf-8?B?QlBuWGRUQ1FlRDdSZHArcEpKb1FzbUdzQWdrczVib1JmYTRuVG1wYklLb3Fk?=
 =?utf-8?B?QUFCQlZEN1V5VmV1VG82VUlaVEx2NlFvejM3T3Areks1cFphajc2TVZndUdP?=
 =?utf-8?B?a240TitnT09RRENITFp1dHY0d0JibjhMeVZrVy9Eb2xsZU92YkFYV2JKOC9a?=
 =?utf-8?Q?f6XersnokDr1/l1txB/TLmP6EPUhGo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0k2cTZ0NU9jNFJsZDQ1Mm8wSUJnTTZzRTNjRmRiUHd1SUVMZnNyN3dScVN4?=
 =?utf-8?B?T21oVG1ocXV1WlVtYnliNTdrWmZxTDJTOVJLZTZ2V1Z4ZFJaK0RiQXVGU0lQ?=
 =?utf-8?B?SDRoY2tpQUZ3UEJQTVdPVjN6a2l1SWdidHBMZ1J5N3pPcjlkbEovZnk1MUZI?=
 =?utf-8?B?WHA5NGpmaUNOUGQyY2Vza1N2TmdZeE9CdWQ1ZU00UEhhQUJTaFl2VkFwVzgw?=
 =?utf-8?B?VFBGU2xUak94OVhKbUo5K3g1YzV1L1M4aHJBL2V1OFpmcjd4YXZtZVFUS29G?=
 =?utf-8?B?d3hWOE5lMzhiK2dYWW9zdDZMZGJFVXV5SHdSclNyWEZ1YUZOQ01mcGtaSjlC?=
 =?utf-8?B?Qmcvd1lBV3BRQ2hLUUgzZ2dQRlg1dVdsU0taRzdya0ptbEgrc0pCNzg0Rkxj?=
 =?utf-8?B?OHhBaUVMY3ozQVQ3L1NpcmFyRC9NMWJzWEhTYWtCcTEybFNzYkhaSzdUUXNu?=
 =?utf-8?B?OE1ONjUvZFdxUC91emhCWnFLelpJcFVZZ1NzVkh0V201di9JenFFazZOTmVN?=
 =?utf-8?B?cjdMUjlGQncvZ2pNbHN2TkEzRG1vZDJORzdyWEZCckF5R0kwalgrR0FNYk9Q?=
 =?utf-8?B?NXd2YjZhV2NZU0U5cThqc282Yjh2cDBiNkFjUEt2c0xWT2dtWUZ0enBPWk9r?=
 =?utf-8?B?MzFFSFR3bVBGQmJYcWpDQmpDeEp5VHN6Rm81OU9zZS9VOHdEOEU3eXh2dG5J?=
 =?utf-8?B?MnlOeVByTWR0SUM4L0ZtTGZZNTJ1TmE2Vm1DNFZ6UUpVR2RPWm5mZk4yalhl?=
 =?utf-8?B?L1Q1Vld1QXNtU3hERkphNkV3Zzl0Q09mVThpMGxkQld1d1o2V2JqWWMrNkNh?=
 =?utf-8?B?T3ZiazNvTUx1V2dJWjdCUGM4ZzNoQzJsR1MybzY5UXhMWkRKYi8zSC91d0Fp?=
 =?utf-8?B?V0g1ekt5TkhuSGQ2Zk02dWZhdFg1aytpOG5QWGdiYThTVlgyRkZNNDcyMEM4?=
 =?utf-8?B?SEFZaHBHbFkvT2svYjVNNlFwVVFZeVRVNXFVdHdmTDlyOWNXYkhraVhmcUx4?=
 =?utf-8?B?cVkyUlAzdkgrclU5cXFhRG1RVDlEUGYyVjltZ0VxOXZYQ2dyNmRLbit5VGI5?=
 =?utf-8?B?RklvdVExcktGS3BSNUhsUHU4bnBsNmlXTnV6UnNlRDdIUUdKd1BtRWQvaXV5?=
 =?utf-8?B?ZHVCM2ZOUUk4UDNqSVlQZlhsOFU3U0kwVlZWZEZyK1d2ZjZQTTNYbnYrRkc0?=
 =?utf-8?B?Wisxa2l2OXd6cUpGSWV5blBIZnRyazlUbnFVUHVJM25HOWJ1cnFnVWI3dEFl?=
 =?utf-8?B?Qi9XbmEyRXBGNGY0ek9BTVQvYmpEVTZiZFAzcmpvUDRiZng1bXVka1dBVVJr?=
 =?utf-8?B?S1I2cmtGbXVrWGlFQWhyRTE5UlpsN1hQa0hoZ0d1aFNabUVhQ3V5R2F1T2la?=
 =?utf-8?B?ci9NSWZmSUExUjVoUWFEWTRwMjkxVEsvSnBzaGZjOUFZRWN1MkU4elc4dXF6?=
 =?utf-8?B?L0pVOTJqRmcrK21nVXQ1Zm5GQ3RVckl6VHd0dVo0OU52Q1QrMit5VEsrWWtk?=
 =?utf-8?B?Z3pwSFdOVi80bXppSzhRRkhWQzZMb2xXQUFPOWxPazlsb3ArUjJZYUhKNHhL?=
 =?utf-8?B?UDJBL2NMdU9kSjd6YWs0U2ZJeXQ2Y2wyaTBKVm51amZEdHpzdWEvdDM2Smsy?=
 =?utf-8?B?MjRTSGtadWZndURPSEZqbjZWNmdnanpNdnR1djBiL1RTa1VDQXVmU1BDdHVX?=
 =?utf-8?B?eEFTN3dNQ2E1a3hYU1ZwOU9vMitDS2ZNMzNCV29KSW16d1lvemRMaTFERlll?=
 =?utf-8?B?OUl0NmVreDhtd2hPS21hMXdMY3dzUU4ybXI4V2czSWh0aG5SaWtCYUp6VmxF?=
 =?utf-8?B?ZGRteVVHU1M3UE5MZlpCKzVvSUdvMWNuMmFCYWhLeFIybzVCZm9pSWM5UUQ4?=
 =?utf-8?B?L0NCMFYvU25iRjNZSVlvSWlDZ21jMnVJbndielQ4UGtiWDJ3bFRtWitBcGxY?=
 =?utf-8?B?MExUMkFrZ0d0NmZxby9KS3d2cG5XaGxQZjlqSmU5WnM2YVFSTU9uM2tLTktk?=
 =?utf-8?B?V2g2bXZScC9HNkVNWHBFVTlpK0cxMUdFWXZtVldWbXdXVHJyNlVQWnE2NDNL?=
 =?utf-8?B?eWNjWUhMeTRCZFFsREdhWXBOaWdSWG9rd0UvQ0JqcW1UQWFrOGxvQXhnVyt6?=
 =?utf-8?Q?oLneW+9cX7wvns+gyiTrMHXir?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8529c426-4766-41c1-beb9-08dda7689abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 15:16:27.0820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2ebaoMML/7eZT0qcnlWltujMqk2aPag9OWvABaZGO59lA6gVgOj9EYMnOmYuHmiSCDXXoopePtz8SZQytShdrgY53XWVQhdxdBWK7kL/Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8857
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
bWFzdGVyIGRldmljZQ0KPiANCj4gT24gNi85LzI1IDA1OjIzLCBVc3lza2luLCBBbGV4YW5kZXIg
d3JvdGU6DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDEvMTFdIG10ZDogY29yZTogYWx3
YXlzIGNyZWF0ZSBtYXN0ZXIgZGV2aWNlDQo+ID4+DQo+ID4+DQo+ID4+Pj4+PiBTZXZlcmFsIG9m
IG15IHFlbXUgYm9vdCB0ZXN0cyBmYWlsIHRvIGJvb3QgZnJvbSBtdGQgZGV2aWNlcyB3aXRoIHRo
aXMNCj4gPj4gcGF0Y2gNCj4gPj4+Pj4+IGluIHRoZSBtYWlubGluZSBrZXJuZWwuIFJldmVydGlu
ZyBpdCBmaXhlcyB0aGUgcHJvYmxlbS4gQXMgZmFyIGFzIEkgY2FuDQo+ID4+Pj4+PiBzZWUgdGhp
cyBhZmZlY3RzIGNvbmZpZ3VyYXRpb25zIHdpdGgNCj4gPj4gQ09ORklHX01URF9QQVJUSVRJT05F
RF9NQVNURVI9eQ0KPiA+Pj4+Pj4gd2hlbg0KPiA+Pj4+Pj4gdHJ5aW5nIHRvIGJvb3QgZnJvbSBh
biBtdGQgcGFydGl0aW9uIG90aGVyIHRoYW4gbXRkYmxvY2swLCB3aXRoIHRoZQ0KPiA+Pj4+Pj4g
bXRkIHBhcnRpdGlvbiBkYXRhIGluIGRldmljZXRyZWUgKC4uLi9hc3BlZWQvb3BlbmJtYy1mbGFz
aC0NCj4gbGF5b3V0LmR0c2kpLg0KPiA+Pj4+Pj4gSXMgdGhlcmUgYSBndWlkYW5jZSBkZXNjcmli
aW5nIHRoZSBjaGFuZ2VkIGJlaGF2aW9yLCBieSBhbnkgY2hhbmNlLA0KPiA+Pj4+Pj4gYW5kIGhv
dyB0aGUgYm9vdCBjb21tYW5kIGxpbmUgbm93IG5lZWRzIHRvIGxvb2sgbGlrZSB3aGVuIHVzaW5n
DQo+IG9uZQ0KPiA+PiBvZg0KPiA+Pj4+Pj4gdGhlIGZsYXNoIHBhcnRpdGlvbnMgYXMgcm9vdCBm
aWxlIHN5c3RlbSA/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gVGhhbmtzLA0KPiA+Pj4+Pj4gR3VlbnRl
cg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJJ3ZlIHRyaWVkIHRvIG1ha2UgaXMgYXMgdHJhbnNwYXJlbnQg
YXMgcG9zc2libGUgZm9yIHRoZSBleGlzdGluZyB1c2Vycy4NCj4gPj4+Pj4gT25seSBjaGFuZ2Ug
aXMgdGhhdCBub3cgZXZlcnkgcGFydGl0aW9uIGhhcyBtYXN0ZXIgdGhhdCBpcyBub3QNCj4gcGFy
dGl0aW9uZWQuDQo+ID4+Pj4+IElzIHRoZSBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj1u
IGZpeGVkIHRoZSBwcm9ibGVtIGZvcg0KPiB5b3U/DQo+ID4+Pj4gTm8gY2hhbmdlIGlzIGV4cGVj
dGVkLCBjYW4geW91IHBsZWFzZSBkZXNjcmliZSB0aGUgZGV2aWNlcyB0aGF0IHlvdQ0KPiA+Pj4+
IG9ic2VydmUgd2l0aCBhbmQgd2l0aG91dCB0aGUgcGF0Y2g/IE1heWJlIHRoZXJlIGlzIHNvbWV0
aGluZyB3cm9uZyBpbg0KPiA+Pj4+IHRoZSBjb3JlIGxvZ2ljLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+
Pj4gSSBhbSB0cnlpbmcgdG8gYm9vdCBzdXBlcm1pY3JvLXgxMXNwaS1ibWMgaW4gcWVtdSBmcm9t
IGZsYXNoIHBhcnRpdGlvbiA2Lg0KPiA+Pj4gVGhlIHFlbXUgY29tbWFuZCBsaW5lIGlzIHNvbWV0
aGluZyBsaWtlDQo+ID4+Pg0KPiA+Pj4gICAgICBxZW11LXN5c3RlbS1hcm0gLU0gc3VwZXJtaWNy
by14MTFzcGktYm1jLGZtYy0NCj4gPj4gbW9kZWw9bjI1cTI1NmExMyxzcGktbW9kZWw9bjI1cTI1
NmExMyBcDQo+ID4+PiAJLWtlcm5lbCBhcmNoL2FybS9ib290L3pJbWFnZSAtbm8tcmVib290IC1z
bmFwc2hvdCBcDQo+ID4+PiAJLWF1ZGlvIG5vbmUgXA0KPiA+Pj4gCS1kcml2ZSBmaWxlPS90bXAv
Zmxhc2gsZm9ybWF0PXJhdyxpZj1tdGQsaW5kZXg9MSBcDQo+ID4+PiAJLW5pYyB1c2VyIFwNCj4g
Pj4+IAktLWFwcGVuZCAicm9vdD0vZGV2L210ZGJsb2NrNiByb290d2FpdCBjb25zb2xlPXR0eVM0
LDExNTIwMA0KPiA+PiBlYXJseWNvbj11YXJ0ODI1MCxtbWlvMzIsMHgxZTc4NDAwMCwxMTUyMDBu
OCIgXA0KPiA+Pj4gCS1kdGIgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtc3Vw
ZXJtaWNyby14MTFzcGkuZHRiDQo+ID4+IFwNCj4gPj4+IAktbm9ncmFwaGljIC1tb25pdG9yIG51
bGwgLXNlcmlhbCBzdGRpbw0KPiA+Pj4NCj4gPj4+IFRoaXMgaXMgd2l0aCBhc3BlZWRfZzVfZGVm
Y29uZmlnLiBOb3RlIHRoYXQgdGhlIGZsYXNoIG1vZGVscyBuZWVkIHRvIGJlDQo+ID4+IHNwZWNp
ZmllZC4NCj4gPj4+IFRoZSBkZWZhdWx0IGZsYXNoZXMgYXJlIG5vIGxvbmdlciByZWNvZ25pemVk
IHdoZW4gYm9vdGluZyBmcm9tIHFlbXUNCj4gc2luY2UNCj4gPj4gY29tbWl0DQo+ID4+PiA5NDdj
ODZlNDgxYTAgKCJtdGQ6IHNwaS1ub3I6IG1hY3Jvbml4OiBEcm9wIHRoZSByZWR1bmRhbnQgZmxh
c2ggaW5mbw0KPiA+PiBmaWVsZHMiKS4NCj4gPj4+DQo+ID4+PiBUaGUgYWJvdmUgb25seSB3b3Jr
cyB3aXRoIHRoaXMgcGF0Y2ggcmV2ZXJ0ZWQgKG9yIHdpdGggdjYuMTUgYW5kIG9sZGVyLCBvZg0K
PiA+PiBjb3Vyc2UpLg0KPiA+Pj4NCj4gPj4+IEd1ZW50ZXINCj4gPj4NCj4gPj4gQWxleGFuZGVy
LCBjYW4geW91IHBsZWFzZSBpbnZlc3RpZ2F0ZT8gV2UgbmVlZCBhIGZpeCBiZWNhdXNlIEd1ZW50
ZXINCj4gPj4gbWlnaHQgbm90IGJlIHRoZSBvbmx5IGFmZmVjdGVyIHVzZXIuIE90aGVyd2lzZSB0
aGlzIHBhdGNoIGNhbid0IHN0YW5kLA0KPiA+PiB1bmZvcnR1bmF0ZWx5Lg0KPiA+Pg0KPiA+PiBU
aGFua3MsDQo+ID4+IE1pcXXDqGwNCj4gPg0KPiA+IE1heWJlIHNvbWV0aGluZyBpcyBtb3ZlZCwg
YW5kIGl0IGlzIG5vdCAvZGV2L210ZGJsb2NrNiBub3cuDQo+ID4NCj4gDQo+IFdpdGggdGhpcyBw
YXRjaDoNCj4gDQo+ICMgbHMgLWwgL2Rldi8qbXRkKg0KPiBjcnctLS0tLS0tICAgIDEgcm9vdCAg
ICAgcm9vdCAgICAgICA5MCwgICAwIEphbiAgMSAwMDowMCAvZGV2L210ZDANCj4gY3J3LS0tLS0t
LSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAgMSBKYW4gIDEgMDA6MDAgL2Rldi9tdGQw
cm8NCj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAgMiBKYW4gIDEg
MDA6MDAgL2Rldi9tdGQxDQo+IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkw
LCAgIDMgSmFuICAxIDAwOjAwIC9kZXYvbXRkMXJvDQo+IGNydy0tLS0tLS0gICAgMSByb290ICAg
ICByb290ICAgICAgMjQ0LCAgIDAgSmFuICAxIDAwOjAwIC9kZXYvbXRkX21hc3RlcjANCj4gY3J3
LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAyNDQsICAgMSBKYW4gIDEgMDA6MDAgL2Rl
di9tdGRfbWFzdGVyMQ0KPiBicnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAzMSwg
ICAwIEphbiAgMSAwMDowMCAvZGV2L210ZGJsb2NrMA0KPiBicnctLS0tLS0tICAgIDEgcm9vdCAg
ICAgcm9vdCAgICAgICAzMSwgICAxIEphbiAgMSAwMDowMCAvZGV2L210ZGJsb2NrMQ0KPiB+ICMg
bHMgL3Byb2MvbXRkDQo+IC9wcm9jL210ZA0KPiB+ICMgY2F0IC9wcm9jL210ZA0KPiBkZXY6ICAg
IHNpemUgICBlcmFzZXNpemUgIG5hbWUNCj4gbXRkMDogMDIwMDAwMDAgMDAwMTAwMDAgImJtYyIN
Cj4gbXRkMTogMDIwMDAwMDAgMDAwMTAwMDAgInBub3IiDQo+IA0KPiBBZnRlciByZXZlcnRpbmcg
aXQ6DQo+IA0KPiAjIGxzIC1sIC9kZXYvbXRkKg0KPiBjcnctLS0tLS0tICAgIDEgcm9vdCAgICAg
cm9vdCAgICAgICA5MCwgICAwIEphbiAgMSAwMDowMCAvZGV2L210ZDANCj4gY3J3LS0tLS0tLSAg
ICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAgMSBKYW4gIDEgMDA6MDAgL2Rldi9tdGQwcm8N
Cj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAgMiBKYW4gIDEgMDA6
MDAgL2Rldi9tdGQxDQo+IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAg
IDMgSmFuICAxIDAwOjAwIC9kZXYvbXRkMXJvDQo+IGNydy0tLS0tLS0gICAgMSByb290ICAgICBy
b290ICAgICAgIDkwLCAgIDQgSmFuICAxIDAwOjAwIC9kZXYvbXRkMg0KPiBjcnctLS0tLS0tICAg
IDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICA1IEphbiAgMSAwMDowMCAvZGV2L210ZDJybw0K
PiBjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgICA2IEphbiAgMSAwMDow
MCAvZGV2L210ZDMNCj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAg
NyBKYW4gIDEgMDA6MDAgL2Rldi9tdGQzcm8NCj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJv
b3QgICAgICAgOTAsICAgOCBKYW4gIDEgMDA6MDAgL2Rldi9tdGQ0DQo+IGNydy0tLS0tLS0gICAg
MSByb290ICAgICByb290ICAgICAgIDkwLCAgIDkgSmFuICAxIDAwOjAwIC9kZXYvbXRkNHJvDQo+
IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgIDkwLCAgMTAgSmFuICAxIDAwOjAw
IC9kZXYvbXRkNQ0KPiBjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICA5MCwgIDEx
IEphbiAgMSAwMDowMCAvZGV2L210ZDVybw0KPiBjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9v
dCAgICAgICA5MCwgIDEyIEphbiAgMSAwMDowMCAvZGV2L210ZDYNCj4gY3J3LS0tLS0tLSAgICAx
IHJvb3QgICAgIHJvb3QgICAgICAgOTAsICAxMyBKYW4gIDEgMDA6MDAgL2Rldi9tdGQ2cm8NCj4g
YnJ3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgMzEsICAgMCBKYW4gIDEgMDA6MDAg
L2Rldi9tdGRibG9jazANCj4gYnJ3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgMzEs
ICAgMSBKYW4gIDEgMDA6MDAgL2Rldi9tdGRibG9jazENCj4gYnJ3LS0tLS0tLSAgICAxIHJvb3Qg
ICAgIHJvb3QgICAgICAgMzEsICAgMiBKYW4gIDEgMDA6MDAgL2Rldi9tdGRibG9jazINCj4gYnJ3
LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgMzEsICAgMyBKYW4gIDEgMDA6MDAgL2Rl
di9tdGRibG9jazMNCj4gYnJ3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgMzEsICAg
NCBKYW4gIDEgMDA6MDAgL2Rldi9tdGRibG9jazQNCj4gYnJ3LS0tLS0tLSAgICAxIHJvb3QgICAg
IHJvb3QgICAgICAgMzEsICAgNSBKYW4gIDEgMDA6MDAgL2Rldi9tdGRibG9jazUNCj4gYnJ3LS0t
LS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgMzEsICAgNiBKYW4gIDEgMDA6MDAgL2Rldi9t
dGRibG9jazYNCj4gfiAjIGNhdCAvcHJvYy9tdGQNCj4gZGV2OiAgICBzaXplICAgZXJhc2VzaXpl
ICBuYW1lDQo+IG10ZDA6IDAyMDAwMDAwIDAwMDEwMDAwICJibWMiDQo+IG10ZDE6IDAwMDYwMDAw
IDAwMDEwMDAwICJ1LWJvb3QiDQo+IG10ZDI6IDAwMDIwMDAwIDAwMDEwMDAwICJ1LWJvb3QtZW52
Ig0KPiBtdGQzOiAwMDQ0MDAwMCAwMDAxMDAwMCAia2VybmVsIg0KPiBtdGQ0OiAwMTc0MDAwMCAw
MDAxMDAwMCAicm9mcyINCj4gbXRkNTogMDA0MDAwMDAgMDAwMTAwMDAgInJ3ZnMiDQo+IG10ZDY6
IDAyMDAwMDAwIDAwMDEwMDAwICJwbm9yIg0KPiANCj4gSSBhbSB0cnlpbmcgdG8gYm9vdCBmcm9t
ICJwbm9yIi4gSXQgbG9va3MgbGlrZSB0aGUgcGFydGl0aW9uIGRhdGEgKGZyb20NCj4gZGV2aWNl
dHJlZSkNCj4gaXMgbm93IGlnbm9yZWQuIG10ZGJsb2NrNiB1c2VkIHRvIGJlIHRoZSBzZWNvbmQg
Zmxhc2guDQo+IA0KPiBHdWVudGVyDQoNCklzIHRoaXMgd2l0aCBDT05GSUdfTVREX1BBUlRJVElP
TkVEX01BU1RFUj8NCg0KSSB0aGluayB0aGF0IG10ZF9pc19wYXJ0aXRpb24gaXMgYW1iaWd1b3Vz
IG5vdy4NCldlIGFsd2F5cyBoYXZlIG1hc3RlciBwYXJ0aXRpb24gd2hlbiBDT05GSUdfTVREX1BB
UlRJVElPTkVEX01BU1RFUg0KaXMgZW5hYmxlZCBhbmQgcGFyZW50IGNoZWNrIGlzIHVzZWxlc3Mu
DQpXZSBtdXN0IGNoZWNrIGdyYW5kcGFyZW50IGluIHRoaXMgY2FzZS4NCk1pcXVlbCwgYW0gSSBy
aWdodD8NCg0KV2UgY2FuIHJldHVybiB0byBvbGRlciBwYXRjaCB2ZXJzaW9uIHRoYXQgaGF2ZSBj
cmVhdGVkIHBhcnRpdGlvbg0KaW5zdGVhZCBvZiB0aGUgbWFzdGVyIGRldmljZS4NCk9yIHRyeSB0
byBmaXggbXRkX2lzX3BhcnRpdGlvbiwgbGlrZSBiZWxvdy4NCkd1ZW50ZXIsIGlzIGJlbG93IHBh
dGNoIGhlbHBzPw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVy
cy9tdGQvbXRkY29yZS5jDQppbmRleCA0MjlkOGMxNmJhZjAuLmI5NzdkY2U2ZDU4YyAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYw0KKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5j
DQpAQCAtMTA0LDcgKzEwNCw3IEBAIHN0YXRpYyB2b2lkIG10ZF9yZWxlYXNlKHN0cnVjdCBkZXZp
Y2UgKmRldikNCiAgICAgICAgaWRyX3JlbW92ZSgmbXRkX2lkciwgbXRkLT5pbmRleCk7DQogICAg
ICAgIG9mX25vZGVfcHV0KG10ZF9nZXRfb2Zfbm9kZShtdGQpKTsNCg0KLSAgICAgICBpZiAobXRk
X2lzX3BhcnRpdGlvbihtdGQpKQ0KKyAgICAgICBpZiAobXRkX2lzX3BhcnRpdGlvbl9vcl9tYXN0
ZXJfcGFydGl0b24obXRkKSkNCiAgICAgICAgICAgICAgICByZWxlYXNlX210ZF9wYXJ0aXRpb24o
bXRkKTsNCg0KICAgICAgICAvKiByZW1vdmUgL2Rldi9tdGRYcm8gbm9kZSAqLw0KQEAgLTExOCw3
ICsxMTgsNyBAQCBzdGF0aWMgdm9pZCBtdGRfbWFzdGVyX3JlbGVhc2Uoc3RydWN0IGRldmljZSAq
ZGV2KQ0KICAgICAgICBpZHJfcmVtb3ZlKCZtdGRfbWFzdGVyX2lkciwgbXRkLT5pbmRleCk7DQog
ICAgICAgIG9mX25vZGVfcHV0KG10ZF9nZXRfb2Zfbm9kZShtdGQpKTsNCg0KLSAgICAgICBpZiAo
bXRkX2lzX3BhcnRpdGlvbihtdGQpKQ0KKyAgICAgICBpZiAobXRkX2lzX3BhcnRpdGlvbl9vcl9t
YXN0ZXJfcGFydGl0b24obXRkKSkNCiAgICAgICAgICAgICAgICByZWxlYXNlX210ZF9wYXJ0aXRp
b24obXRkKTsNCiB9DQoNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaCBiL2lu
Y2x1ZGUvbGludXgvbXRkL210ZC5oDQppbmRleCA4ZDEwZDlkMmU4MzAuLjA1MjcxNDU4YzRkYiAx
MDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5oDQorKysgYi9pbmNsdWRlL2xpbnV4
L210ZC9tdGQuaA0KQEAgLTQxOSw2ICs0MTksMTUgQEAgc3RhdGljIGlubGluZSB1NjQgbXRkX2dl
dF9tYXN0ZXJfb2ZzKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCB1NjQgb2ZzKQ0KIH0NCg0KIHN0YXRp
YyBpbmxpbmUgYm9vbCBtdGRfaXNfcGFydGl0aW9uKGNvbnN0IHN0cnVjdCBtdGRfaW5mbyAqbXRk
KQ0KK3sNCisgICAgICAgaWYgKCFtdGQtPnBhcmVudCkNCisgICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7DQorICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19NVERfUEFSVElUSU9ORURfTUFT
VEVSKSAmJiAhbXRkLT5wYXJlbnQtPnBhcmVudCkNCisgICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7DQorICAgICAgIHJldHVybiB0cnVlOw0KK30NCisNCitzdGF0aWMgaW5saW5lIGJvb2wgbXRk
X2lzX3BhcnRpdGlvbl9vcl9tYXN0ZXJfcGFydGl0b24oY29uc3Qgc3RydWN0IG10ZF9pbmZvICpt
dGQpDQogew0KICAgICAgICByZXR1cm4gbXRkLT5wYXJlbnQ7DQogfQ0KDQoNCg0KDQoNCg0K

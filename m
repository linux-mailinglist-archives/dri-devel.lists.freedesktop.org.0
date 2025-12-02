Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC3C9C1FF
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 17:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF1310E684;
	Tue,  2 Dec 2025 16:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPlfe2Ta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E1110E187;
 Tue,  2 Dec 2025 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691811; x=1796227811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yN7Ob4jmkc2CNkhePPjTDVzJNblooKY1wRTPHp+TMbM=;
 b=LPlfe2TaQNjg9f74V3Qp45CwR9Kp+ONKC8OGwk3MpFD99MKHZ1ryBusw
 HPRQdZWYCVpR1HbAzMMJ1JG2OZBgaTzpFTi8qPIBoFNP+qr1HGidfgh0H
 JHX4c+w5G/6EWAMf03UmG4EwTs8SqXt+PjyV46KcBWE0K4dkYOfY7EoL6
 vox3QLSNhzKoPwp5rFk8Nn7W+vIVV5Of7ZVaTDjV07xfO5MFtTrcNsk1F
 hhhQy/oNo6miwQcQWmqiUKyVdh/T+h+P2jvuWLyyHZdUyc2p19y78NaMr
 IeqsiqO9jCqR2zvQBc8tePFjz4QdTR5B26LwkNPiysRCXVRvxYutXINsW w==;
X-CSE-ConnectionGUID: nbDXhYyKSmSJV/liCaq3Jg==
X-CSE-MsgGUID: /R6ldneXSX+DjcYQ9xiPQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66621852"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66621852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:10:10 -0800
X-CSE-ConnectionGUID: zGZF9v6xTG61OBhaViWR7w==
X-CSE-MsgGUID: l+c5MM66QIy6baqOfF1rSA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:10:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:10:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:10:06 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:10:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg3jeViwZNh6fHK5b5Yr+ZWNE6PTrXOpZHJnucgeQXl3jAdNxhnAXTBktxfOdp8f+KpO4JL9MRN69em8V7wK9JW7r01Zm6sPCnCPPYS4T0NdDae4Vex0L0xEt4OxG8p0T9RekgTw8p5b5M/wseJYRzAhxtz4UA/klimY6dXLdKBRC4cHA0yErxS7OPMVKQuifLpxVA9UKWUXuPVVIQh3++8JKJQ9rbPEBVEhqUEZwimuW4QMR6MYndIVaVjj6hYIFYB9SPPQ6C31ZL0ulnvsz5ABPbiUgWlHB/VdY0ee/QZ9xx1e7J+T6LxaFsAQhTqqdgH4hovqU2UIV/6pW//j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN7Ob4jmkc2CNkhePPjTDVzJNblooKY1wRTPHp+TMbM=;
 b=PdClBiF+7tZnhPQlxPBTKVLLl92DRLX1d7gWiPsxVdU4MkHseHYi/XOrrWUAymNiOvzJslo4soEI+7n+X1Lx7beekSV0UyIvsLLjKyP2qyVQslJ6tIijQfHi0ZqEcJkdQGfDPN7m6sE1KjU3TcQQ0zXkba/lnN0rE7/+CKZ0gELCrZmPcf9ARSnTqRfWSgBpNhd8k/PhhoXjzlMmX8yymdAB8Lf9j4YKJTJwZozTu+eXkpytuF2/b1hyPOiReQPkAwn9+oJDR9Id09CSHTncEs3ptVC6+VtJxDYLnn769hEbwgzLNrVPQzm4lmwTH3run1E3DgZW2LXpkSOb5af/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA2PR11MB4905.namprd11.prod.outlook.com
 (2603:10b6:806:117::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:10:04 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 16:10:04 +0000
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
Subject: RE: [v7 12/15] drm/i915/xelpd: Program Plane Post CSC Registers
Thread-Topic: [v7 12/15] drm/i915/xelpd: Program Plane Post CSC Registers
Thread-Index: AQHcYozPlp5SSnNE7E6b0tiWlj901LUOe0TAgAALiPA=
Date: Tue, 2 Dec 2025 16:10:04 +0000
Message-ID: <DM3PPF208195D8DD149C4E1C3081EB8F9F7E3D8A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-13-uma.shankar@intel.com>
 <DM3PPF208195D8DFD85AA38F3B352353836E3D8A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DFD85AA38F3B352353836E3D8A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA2PR11MB4905:EE_
x-ms-office365-filtering-correlation-id: 9b8e229e-5590-4e58-1f91-08de31bd4159
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YTA4bUM2YU9JRlV5TTNuRzMwbHFXZjZQbStRUWxjMzdOVWNuUEVPb2trRkli?=
 =?utf-8?B?cWZ4cXlMelp2cnBGeFhwWU1nejIxeDU3VmlXWmZ5a1UzR1FWbGVnVGVrb1ZD?=
 =?utf-8?B?b2FkQjczV2RYcFF1Uk9UY0U0QWtZMmEzUkljdWZBWjl0VDNKRWRnaTk2MmxF?=
 =?utf-8?B?ZlhPNG1ReDFDVkFPZmdLSFlkeDZFV00zNnRuWDY0WTJpNFRzaW1VL2JoVGcz?=
 =?utf-8?B?eUEzTXhzbjBYbjEvMnFDMnFwTHB2VUpHR1JodGNQV3NqNDJsQ1YyQjRUSWFK?=
 =?utf-8?B?NzdXVzd0YnY2bFpTU2k3TXFZRHA4c2l1NkxhN3F6R3dBOEMvZW5jQmV2b1cr?=
 =?utf-8?B?VnphT1ZJYzBBaGxLR1ZEekpST082RmVxMytxbkRHUEtjSmdZZE83Zyt6RlB2?=
 =?utf-8?B?T3FwK3dEaGhydk5OWkpsQXpnYVdEcmtJc1REamlOejU5VW9mZjljZ2x3ZWdo?=
 =?utf-8?B?OXFyVkhlOEdhSUtwY09FL08vZDNZeFY1S3VkeEsxVElQNlRKZXF2RWhQNDhX?=
 =?utf-8?B?MXBEOUpWVUdkRWVySW90YmRuMCtCdDdGOEpOZDJTREVzMG80RVlJbDdKS09Y?=
 =?utf-8?B?WGlhNGFmQ3BLWXM2cTA2bS92bzc2SWdnTThEYmRXS0phRStCWll6QnpqT3oy?=
 =?utf-8?B?bHBkc2hDRnFQb1F5U1Z5YkdDeUhPYXdTN1B2VWxEeUtsaEJZZ3k3Nk1nT3VS?=
 =?utf-8?B?VmgvUjFrcHhmdlAzY1NHUHdSdjBYMzRxcE9kQkErdGxGTU4zL3NoZDJKN3No?=
 =?utf-8?B?cUdobXlrL3d0L3NydVVVc20xZWJwc2xMVFNBOTdlWXR0N2NkbzcrSFVRaSt2?=
 =?utf-8?B?ZHNoaElkdC82TGE0UWwwSDdQc2VqMEVwbFp4TlpPRXRVV0loQS8yall6Zk83?=
 =?utf-8?B?QlhOSDBTUGU5eXZZTDNsTzJ5MW43cWxTekV0Wkl5TFo5TVZNa3dxZGhjRGNl?=
 =?utf-8?B?aklvWWUvcnpVT1UwOUU1MzltUGhqZ2tnVDlmdHpESy9aSGF2ZzE3cGtNY0dY?=
 =?utf-8?B?UkdtM29jd3p3KzhnRCtvdUl2TnR2YW00MEdWM0tPbUJSR2xVQkE3cXFxWVg4?=
 =?utf-8?B?OUZLOGkrVk1BOS9TNWRlNzVjN0R5WmVuaFF3dXV4NGpRSlZBWlV3dlVPeGh6?=
 =?utf-8?B?TUxjT1lBaFlXNFdJWlJxRVIxQU9CeGQ4VWNUenBsS3ZiTGRXaGRwNnhjVi9Z?=
 =?utf-8?B?NXdFQTlwb202ZElsaU9FZmpvdTIyWCtONXc5c1lBejVwdlhsZlJPL1NWVmto?=
 =?utf-8?B?L2Ixck9TWlhiQWFydzVDSmxhRFFHQzJ4YkZyREw2Qkh4bE9FbU9SNW1TTUo2?=
 =?utf-8?B?bi9teTY4WEI1TDdiOHJEYXh0aWVvNmN1LzFRUC9vdXpDdE0rVUdoZGRxQU9R?=
 =?utf-8?B?V0JzNDc3UjladmljSU5sOTV2eGVvTlNUeitPWTZyR3M4emRlYmRiekNwalJx?=
 =?utf-8?B?Ry9DL2FOT1ZTVHM3Z2lGZmxDcVNRWUVLczZrcGpHZzdzeVZBdEpVZUNacDdY?=
 =?utf-8?B?UDNoNEZuZ1lnZlhPUGwyeTd3UmN1dDdQYzF1ekxkems0SEV5R1dVbWNSS3VM?=
 =?utf-8?B?SXRBRGp1MTB4dHF0MVdhREZHQ210aGVqUElVZ1ZyVUh5WURjV0lRUitlbmNM?=
 =?utf-8?B?dWh1cG1mcXJ5TitTUHpXVDhmMEx3cjJNSTkrYlVqVGc0bCt1QzJOWnJ2QkRW?=
 =?utf-8?B?S1NDNHM0ODJVWVlqbjFGUWNzdi81WDRRTGpJbWpuSzlCYkxUV2szUnlHWjI5?=
 =?utf-8?B?bHRUdWJnY0JlTnZFUGcycXpDYjFhY3ZEZTlFRmNDT3dOT0ZJa0hwS2Zzc0Jq?=
 =?utf-8?B?dDRvR1RrMmM2RjhZU0NyTkwwZGxRUE51OGZ1UDFBU00wNU92WXc1a250VWNh?=
 =?utf-8?B?VUIxdkxKM2lGb3lZeEJTY2IwWW9SeUpwU2luQjA5VXZRVUtnTzNCbkJTN2ZU?=
 =?utf-8?B?d3plZXhYL3ViTjFPN0NqcDdLdXhVenBoSk1ZYktFTm9mckJITklPMXk4dWRY?=
 =?utf-8?B?dnV3R3hnME5sbHUzZXRDRUQ1eDIzTFBGRG43RGpCV2c4bnlabE02SlcxcnRP?=
 =?utf-8?Q?KzbG8y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXg3UjJQR09XSy9KaHAwWElWWG0zdWhrYUtvdklkNncxdXdMR1gzRnZzYlhk?=
 =?utf-8?B?TERtNFBwYnQyTmx6dTNONkMzSTBZQnorM0JHSXdnREliYWJGNkxSRHNJUnpO?=
 =?utf-8?B?aHpxZFRUZ3hJbzFuaGpNTHEvb1ZnaGE1dWNnNHo0WWxxazY4Q0NDZVNiSFhI?=
 =?utf-8?B?amJLanpTdzR6amRjZlhKM0xtQ3VhWUhzUEQxQVFkM05ucW9JWTRlRXEwcUhr?=
 =?utf-8?B?L1JnWGVqS1U3UlU3cTJJL0ZKUWI5WCtiV0JmZ2xUdG9zY0llQk5rbC9vOHZX?=
 =?utf-8?B?ZWFqT3JTSGV2N2tneGdNYTE3MnZvSkI0c29hbGlhcVZ0RTE0aXZiMW9ha1Vq?=
 =?utf-8?B?Qm1WMTNYYjNBazdXL1QvM29QZnVRQ1dRQXRQL3VONDVmbTdKaDBEaU93c1JR?=
 =?utf-8?B?dDRSbTJJdXN5bC9NeWxjcTVkczJDTDBUZUhQTFQ0UHUvcndvaU9QU0Q0cUJO?=
 =?utf-8?B?TGxGdnRsRVVybmNqbElwc3ZWVHNEYzBFWUZGQTZnQmNFc2djYkduWmk3ZVkw?=
 =?utf-8?B?YndqZFFhN0tFa3VYVW9ZRHBmQmxGZk96Zkhlc3E2N2F6NzJCMGZNNnRzY1lT?=
 =?utf-8?B?TFFqWFl6OE10UG14ZVIyQVpwMEg1TXpVbkpvMjRUM3VqeXNvU0wxdkw4bDFZ?=
 =?utf-8?B?WTF0V1FJRkVPWUQ4ckxtM01aMm1Bb0h3aVp3dS9SelpMUEZzOGt1SDNCTmNK?=
 =?utf-8?B?THRoZEVuNllydnFSaVErOWs2ZENxYjNFNEt6Z01SUGxQblM3dDZ3YmZkNWlO?=
 =?utf-8?B?ZHdIUHhTZmVQV3B0ZGpsQXZGU1RPbDBEMldhb0NzZDJyVkFLU2VPSDFFQjB1?=
 =?utf-8?B?Y0RzZmUweVptclV0ZWdRVVI3RzBqTy9yM0l1eS9Ga3B0M1B6c2pCN1pFT2xp?=
 =?utf-8?B?WnN2WldqMC9TR3loem96L05HbGdBd1J4M1ZjNnJtSFg4U3ZyYlBaVE9OdG1x?=
 =?utf-8?B?OE43UDVpdlN6R0F0OEtYczcwUmhzYzRRRGdYdC9PQW9RZFJmWlpFVTFwTkdK?=
 =?utf-8?B?K2pMNnJaRGczZXgrcnZna3RNU0x1dlhRWjBWVnluWjJ4djg3T2NNQWRLbHZm?=
 =?utf-8?B?N2xZUW9pWmJOL1M2V3RUcHQzNmRZQWR4b24xQXVxeE5DMmtpODgvWUxZNjYv?=
 =?utf-8?B?eXdmWVMyK0tjNXNXRmFEK1VzTnRXVGxodmIwaC9uSEl4ckhrL0JjOVhrbUdv?=
 =?utf-8?B?TmdZQzV6SFd4Z0tjaDROM3M1bEZJQSt3NURLaDRDMlV0YTR6V29LNS9vVEdL?=
 =?utf-8?B?ZE4wMTk4TEVwMkUrRm55ZmRtZXVVR0UyTDlQdllneDBONGdnNUl6WHBnbXJJ?=
 =?utf-8?B?TDdBRDZ5ZVBIUzNmdWFJUDRuWHJiMUZob2VKN3V4R0ZvdnN0WFdzc1FoT0Nl?=
 =?utf-8?B?ZTVSUHlBUUoxc2dwMXcvSGpVRW9QZEFKTktyTEluS1lnc1YvQytqbzVxNFM1?=
 =?utf-8?B?RG1BNDBIS0J4T2FDMXI4cktuVm5xU2tBU2xMemdBazB2TXV0ekQxOUp4Wjlv?=
 =?utf-8?B?NjBKWlRiZDltKzBKMFcvWUlleDJOMjlTTXpuMDVhbUM0YUxlT2FXMVJoRy8v?=
 =?utf-8?B?NFRrYy91MGMrZWZMdnhSZFFwUjlQMkdDNjNWSXUxMXAwRG04S1E1dm9jMklu?=
 =?utf-8?B?MkhqS2ZjVWNiQmpGQXNMU2dPS213S1ZtSXJQS0c3WEZudGo4MzBGN0pVT25S?=
 =?utf-8?B?ZjhiT2ZZUUVLblJEMXp6RUpId0w5WlVpK044SzY1SGtzVVpqbmZjaHlqbStl?=
 =?utf-8?B?Wnc4dHRRRjN5VjE2dW5nK1RYSXR6eUswUlMvaGhCK001c3pZTHlqSHlxUkw1?=
 =?utf-8?B?SjYrckRKTThuK3hIQkhPWk1ucmJaUHZQblQ2bE1TNXp1NDFBdXJPb0VuelVU?=
 =?utf-8?B?WU9SK3Rtby9LUWt0YXJSS0FkN2U4SUpENnRUdk04ZHNGVjB5RmR5L3Mrc05O?=
 =?utf-8?B?ZG9zejVWYUZFNEJIT3hiTW5JSUpITExpWk1YaXhPWGVUcXFicStsaFNTQnJa?=
 =?utf-8?B?REQvZ2dsMGtDK3lDVUx2RXh1cEtTQnVPQW5HZExnMm9OdXRCK3UyTHRETUVK?=
 =?utf-8?B?WEsrUnE2cHU3NkswTFFzdExMc3dNbjJNakp1OFhyM1BoTGFZV1cyaU5QVDBo?=
 =?utf-8?Q?pKQW/Sv9J688N6i5pmLe1zp7u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8e229e-5590-4e58-1f91-08de31bd4159
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 16:10:04.7975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRevOf2GObFiHOBL3ZQygS8HAx4mMx/jlSWWCMmThYxKxv0GMYxtuLgUmmC9kplYAFmNom8UNz8FmsNEgdiniA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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

PiA+IFN1YmplY3Q6IFt2NyAxMi8xNV0gZHJtL2k5MTUveGVscGQ6IFByb2dyYW0gUGxhbmUgUG9z
dCBDU0MgUmVnaXN0ZXJzDQo+IA0KPiBUaGlzIG5lZWRzIHRvIGJlIGk5MTUvY29sb3I6DQo+IA0K
PiA+DQo+ID4gRXh0cmFjdCB0aGUgTFVUIGFuZCBwcm9ncmFtIHBsYW5lIHBvc3QgY3NjIHJlZ2lz
dGVycy4NCj4gPg0KPiA+IHYyOiBBZGQgRFNCIHN1cHBvcnQNCj4gPiB2MzogQWRkIHN1cHBvcnQg
Zm9yIHNpbmdsZSBzZWdtZW50IDFEIExVVA0KPiA+IHY0Og0KPiA+IC0gcy9kcm1fY29sb3JfbHV0
XzMyL2RybV9jb2xvcl9sdXQzMiAoU2ltb24pDQo+ID4gLSBNb3ZlIGRlY2xhcmF0aW9uIHRvIGJl
Z2lubmluZyBvZiB0aGUgZnVuY3Rpb24gKFN1cmFqKQ0KPiA+IC0gUmVtb3ZlIG11bHRpc2VnbWVu
dGVkIGNvZGUsIGFkZCBpdCBsYXRlcg0KPiA+IC0gUmVtb3ZlIGRlYWQgY29kZSBmb3IgU0RSIHBs
YW5lcywgYWRkIGl0IGxhdGVyDQo+ID4gdjU6DQo+ID4gLSBGaXggaXRlcmF0b3IgaXNzdWVzDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1
bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jb2xvci5jIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+ID4gaW5kZXggMmExMTRkMjk2NGZh
Li44NmQxZmJjOTA2YmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9jb2xvci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9jb2xvci5jDQo+ID4gQEAgLTM5OTYsMTEgKzM5OTYsNzAgQEAgeGVscGRfcHJvZ3Jh
bV9wbGFuZV9wcmVfY3NjX2x1dChzdHJ1Y3QNCj4gPiBpbnRlbF9kc2IgKmRzYiwNCj4gPiAgCX0N
Cj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkDQo+ID4gK3hlbHBkX3Byb2dyYW1fcGxhbmVf
cG9zdF9jc2NfbHV0KHN0cnVjdCBpbnRlbF9kc2IgKmRzYiwNCj4gPiArCQkJCSBjb25zdCBzdHJ1
Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKSB7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxf
ZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkocGxhbmVfc3RhdGUpOw0KPiA+ICsJ
Y29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSAmcGxhbmVfc3RhdGUtPnVhcGk7
DQo+ID4gKwllbnVtIHBpcGUgcGlwZSA9IHRvX2ludGVsX3BsYW5lKHN0YXRlLT5wbGFuZSktPnBp
cGU7DQo+ID4gKwllbnVtIHBsYW5lX2lkIHBsYW5lID0gdG9faW50ZWxfcGxhbmUoc3RhdGUtPnBs
YW5lKS0+aWQ7DQo+ID4gKwljb25zdCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dDMyICpwb3N0X2NzY19s
dXQgPSBwbGFuZV9zdGF0ZS0NCj4gPiA+aHcuZ2FtbWFfbHV0LT5kYXRhOw0KPiA+ICsJdTMyIGks
IGosIGx1dF9zaXplLCBsdXRfdmFsOw0KPiANCj4gaiBpcyB1bi11bmluaXRpYWxpemVkIGhlcmUg
YW5kIGl0IHJlbWFpbnMgdW4taW5pdGlhbGl6ZWQgZXZlbiB3aGVuIGZpcnN0IHVzZWQgY2FuDQo+
IGNhdXNlIHVuZm9yZXNlZW4gZXJyb3JzDQoNCkkgbWVhbnQgdW5pbml0aWFsaXplZCBoZXJlIPCf
mIMsIHdpdGggdGhlIGFib3ZlIGNvbW1lbnRzIGFkZHJlc3NlZCANClJldmlld2VkLWJ5OiBTdXJh
aiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiANCj4gUmVnYXJkcywNCj4g
U3VyYWogS2FuZHBhbA0KPiANCj4gPiArDQo+ID4gKwlpZiAoaWNsX2lzX2hkcl9wbGFuZShkaXNw
bGF5LCBwbGFuZSkpIHsNCj4gPiArCQlpbnRlbF9kZV93cml0ZV9kc2IoZGlzcGxheSwgZHNiLA0K
PiA+IFBMQU5FX1BPU1RfQ1NDX0dBTUNfSU5ERVhfRU5IKHBpcGUsIHBsYW5lLCAwKSwNCj4gPiAr
CQkJCSAgIFBMQU5FX1BBTF9QUkVDX0FVVE9fSU5DUkVNRU5UKTsNCj4gPiArCQkvKiBUT0RPOiBB
ZGQgbWFjcm8gKi8NCj4gPiArCQlpbnRlbF9kZV93cml0ZV9kc2IoZGlzcGxheSwgZHNiLA0KPiA+
IFBMQU5FX1BPU1RfQ1NDX0dBTUNfU0VHMF9JTkRFWF9FTkgocGlwZSwgcGxhbmUsIDApLA0KPiA+
ICsJCQkJICAgUExBTkVfUEFMX1BSRUNfQVVUT19JTkNSRU1FTlQpOw0KPiA+ICsJCWlmIChwb3N0
X2NzY19sdXQpIHsNCj4gPiArCQkJbHV0X3NpemUgPSAzMjsNCj4gPiArCQkJZm9yIChpID0gMDsg
aSA8IGx1dF9zaXplOyBpKyspIHsNCj4gPiArCQkJCWx1dF92YWwgPQ0KPiA+IGRybV9jb2xvcl9s
dXQzMl9leHRyYWN0KHBvc3RfY3NjX2x1dFtqKytdLmdyZWVuLCAyNCk7DQo+ID4gKw0KPiA+ICsJ
CQkJaW50ZWxfZGVfd3JpdGVfZHNiKGRpc3BsYXksIGRzYiwNCj4gPiArDQo+ID4gUExBTkVfUE9T
VF9DU0NfR0FNQ19EQVRBX0VOSChwaXBlLCBwbGFuZSwgMCksDQo+ID4gKwkJCQkJCSAgIGx1dF92
YWwpOw0KPiA+ICsJCQl9DQo+ID4gKw0KPiA+ICsJCQkvKiBTZWdtZW50IDIgKi8NCj4gPiArCQkJ
ZG8gew0KPiA+ICsJCQkJaW50ZWxfZGVfd3JpdGVfZHNiKGRpc3BsYXksIGRzYiwNCj4gPiArDQo+
ID4gUExBTkVfUE9TVF9DU0NfR0FNQ19EQVRBX0VOSChwaXBlLCBwbGFuZSwgMCksDQo+ID4gKwkJ
CQkJCSAgICgxIDw8IDI0KSk7DQo+ID4gKwkJCX0gd2hpbGUgKCsraiA8IDM0KTsNCj4gPiArCQl9
IGVsc2Ugew0KPiA+ICsJCQkvKlRPRE86IEFkZCBmb3Igc2VnbWVudCAwICovDQo+ID4gKwkJCWx1
dF9zaXplID0gMzI7DQo+ID4gKwkJCWZvciAoaSA9IDA7IGkgPCBsdXRfc2l6ZTsgaSsrKSB7DQo+
ID4gKwkJCQl1MzIgdiA9IChpICogKCgxIDw8IDI0KSAtIDEpKSAvIChsdXRfc2l6ZSAtIDEpOw0K
PiA+ICsNCj4gPiArCQkJCWludGVsX2RlX3dyaXRlX2RzYihkaXNwbGF5LCBkc2IsDQo+ID4gKw0K
PiA+IFBMQU5FX1BPU1RfQ1NDX0dBTUNfREFUQV9FTkgocGlwZSwgcGxhbmUsIDApLCB2KTsNCj4g
PiArCQkJfQ0KPiA+ICsNCj4gPiArCQkJZG8gew0KPiA+ICsJCQkJaW50ZWxfZGVfd3JpdGVfZHNi
KGRpc3BsYXksIGRzYiwNCj4gPiArDQo+ID4gUExBTkVfUE9TVF9DU0NfR0FNQ19EQVRBX0VOSChw
aXBlLCBwbGFuZSwgMCksDQo+ID4gKwkJCQkJCSAgIDEgPDwgMjQpOw0KPiA+ICsJCQl9IHdoaWxl
IChpKysgPCAzNCk7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQlpbnRlbF9kZV93cml0ZV9kc2Io
ZGlzcGxheSwgZHNiLA0KPiA+IFBMQU5FX1BPU1RfQ1NDX0dBTUNfSU5ERVhfRU5IKHBpcGUsIHBs
YW5lLCAwKSwgMCk7DQo+ID4gKwkJaW50ZWxfZGVfd3JpdGVfZHNiKGRpc3BsYXksIGRzYiwNCj4g
PiArDQo+ID4gUExBTkVfUE9TVF9DU0NfR0FNQ19TRUcwX0lOREVYX0VOSChwaXBlLCBwbGFuZSwg
MCksIDApOw0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9pZA0KPiA+ICB4
ZWxwZF9wbGFuZV9sb2FkX2x1dHMoc3RydWN0IGludGVsX2RzYiAqZHNiLCBjb25zdCBzdHJ1Y3Qg
aW50ZWxfcGxhbmVfc3RhdGUNCj4gPiAqcGxhbmVfc3RhdGUpICB7DQo+ID4gIAlpZiAocGxhbmVf
c3RhdGUtPmh3LmRlZ2FtbWFfbHV0KQ0KPiA+ICAJCXhlbHBkX3Byb2dyYW1fcGxhbmVfcHJlX2Nz
Y19sdXQoZHNiLCBwbGFuZV9zdGF0ZSk7DQo+ID4gKw0KPiA+ICsJaWYgKHBsYW5lX3N0YXRlLT5o
dy5nYW1tYV9sdXQpDQo+ID4gKwkJeGVscGRfcHJvZ3JhbV9wbGFuZV9wb3N0X2NzY19sdXQoZHNi
LCBwbGFuZV9zdGF0ZSk7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlu
dGVsX2NvbG9yX2Z1bmNzIGNodl9jb2xvcl9mdW5jcyA9IHsNCj4gPiAtLQ0KPiA+IDIuNTAuMQ0K
DQo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCBBB53A52
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 19:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1ED10E3B1;
	Thu, 11 Sep 2025 17:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReTvPYkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EEA10E3B3;
 Thu, 11 Sep 2025 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757611522; x=1789147522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j3uSkEvK149keo8NT5IHsuAv2MI4BMXps+d6YxINsUQ=;
 b=ReTvPYkEeQaNV/eDuC3dG5iaMGNDNUkZZ1FcZnLMO/fpjObGvGVMqDcU
 oUisGvahpdljC89f8jieVlfwhgQesplyyqEhWYKUte6U8qgEzndTyZb9w
 ItllSWGBhKcZmg9K7WoNEPHCyoHmFCQnPFAkPwkuAd18eyxQt79f0oaLN
 2ENvG1++WdaMBnR5IivZFMOvBflZ4t10zMxt/FzexCYleOms9RhIsV7x8
 99PkPsa9MKpXnZLQF9+DVIjHBrbnZcMjPhKapjaVAdUwAoZqvm0C2qqle
 rycjgrjM299J39nLQ969+mkbCZ5I2JFhu0piIrPI7lqS+yfjVkRlg9GvF g==;
X-CSE-ConnectionGUID: BPqvXw6ZSxml3igi5SN1mA==
X-CSE-MsgGUID: 9qUL0OHHRDedHaOabMtjug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60013561"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60013561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:21 -0700
X-CSE-ConnectionGUID: vz65NzTITeiyHV2ePMcppA==
X-CSE-MsgGUID: rasI8mp4SN2cJaZwO+GKPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173812830"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 10:25:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 10:25:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 10:25:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJqw+sSZV5xfkv0wg2AwU7tbNoHCCEBOiUuARsf7kDUFyedSygIH9WldR684I9XG0z7daWq2yDjvboklNS3AX6pCColw9bcKk/671EwT6M0uBlSrJdR48w2CUBqC1MQ9DW2U+KvYXxtxbRkN+ZoT4Kzf7gYn6RgTFO2OsNWLPPkurjXB5HArVffIKVTgoJJYjfddKdLUlekqc71RuCYpWZu4haatsE8ZqlD6WYAAsgZryFFkTLMFC86ixO0jaZR2xer1OW2JL/QAEgmLft4q58yW1nnVNUhFEd8gUwsUUrSlkNDnpIRcEoZPPsaoZ2/SOeMqnPZo2xBRgKLyiwNGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3uSkEvK149keo8NT5IHsuAv2MI4BMXps+d6YxINsUQ=;
 b=od4ZC6mndHuS0VMSiy0R6rvGmOL87aYcoaFCtnF+ybLbuOw95Z+GMaFuPYIzBvMeVexjRbfbvYqbWntoBJ6PsanvrihKtCjUHwbW59ZSCRIgBXUJ3dmELb4WRmA3+h6DFJDMCiAr7NFqgzFvG/z49q9i1EFSaHlIVM5H+tAyjdE4kspzWh361d5KYYmpCFx7toa80v73NPLj3sqHAx562vg60Q5P9HrnDgmJkNemTQHavde3cxGad4IdruZ59V/OB0MlR2+C6pYl2Pe9CP2/1+Q72p76cnxj/oNla9p9vWZqgBiHuzwBNZlWlFfDsB+CEkU8F4WVLGDxuBJLHRMLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 17:25:16 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 17:25:16 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
 <kw@linux.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, "Winiarski, Michal" <michal.winiarski@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Simona
 Vetter" <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 02/11] PCI: Cleanup pci_rebar_bytes_to_size() and move
 into rebar.c
Thread-Topic: [PATCH 02/11] PCI: Cleanup pci_rebar_bytes_to_size() and move
 into rebar.c
Thread-Index: AQHcIvGroS/ZYwmAGUyEFAoHhntLlLSOOxqQ
Date: Thu, 11 Sep 2025 17:25:16 +0000
Message-ID: <IA1PR11MB64183AD6FDE18C9DF0014282C109A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
 <20250911075605.5277-3-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20250911075605.5277-3-ilpo.jarvinen@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BN9PR11MB5260:EE_
x-ms-office365-filtering-correlation-id: 2fdbd0ae-ed56-450c-b733-08ddf1582c93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?NExoTTZkbkdPQ0NOTkJXbGVqaUJiV0JraEVkdXZWR3BFZUFoQkdyQ1RCM2R5?=
 =?utf-8?B?M1hlbHdFMWdQVExBOTlvNUVmc2UrRllNcmlSM0g0aElZd2lmTVBsOVJrcWpC?=
 =?utf-8?B?REJlUC9DK0hVWHliQlVFeDlGNGYzUXdOVFlLZ3RXeEFUVmdicCtndklOTFZ0?=
 =?utf-8?B?NSs4dlZySGVvbXJucnpoZmxLSjFqcCtnS3lOaHBPRjF5RDVHaGJxR0JaZGF2?=
 =?utf-8?B?bFViRVdjdkR5VWhNaDgxYmMwWHRzd29nOGFxSzZqU0lFNnZSWUVlWWdoVVlI?=
 =?utf-8?B?d3Q3V21Fcm51RUZmSU8xNTRlME10eGtYcG45enN3anhxbVhyT0pVdTRKT004?=
 =?utf-8?B?d3pld05XZTRSb01HWC8zUW1wZ0xCRit3WTlUQnBBQTdncVIxZ3l3bzhKTktO?=
 =?utf-8?B?QjcvZDg5Z2VlMkZZeUM1RkNrT280aUs2ZXVMUFgrUzNDdW5DRlJuUTBKazlh?=
 =?utf-8?B?WDdZanpKTWgxS2tua0Z3dGVaSVNOTndLaTlHYmJRcks0c0lmdFRWOHhRVHBk?=
 =?utf-8?B?NFpvenRKMDZjbHZKRU9XaVpicWlxa3lKMWJEcFNOK0doWEdyVnJTellrQmNw?=
 =?utf-8?B?eUVYMHFBTXR1ZC9KZ2h0SFl0bDd6aGlDdkRsSkJYa21RaVNpSVM4VjBZUEti?=
 =?utf-8?B?a2l4MDhvWThsL3I1WkFvcXA1MlBxNUN1N1FjTHZ4RWg2M2pvOC9vU2prSDFj?=
 =?utf-8?B?b3Bjblc5YjlFbVp5YTBHdXQ0Y0pnZDV2S3lDc0p3cVM3aFYrakxoelAyN3Rh?=
 =?utf-8?B?amhHbTVLZERXNTdXbXZmYXRFUWNlRkFkMVVBVlFUZE1uYTY5RDBiVURydmtU?=
 =?utf-8?B?UDJOSm1ZWEk5ZTdhemUxVzJqK2FVK0JWcVZSakMrei9xM2h6cXZmSXd6MUdL?=
 =?utf-8?B?QkV2NGp6WWs3NFZVVnpQbzdQalpNWXgvclFNMFUrdkNBNHJOZlcvbUdpOGZn?=
 =?utf-8?B?WlUweWZxU2oxZWI4Z01uT1MyMnhvd3A4ek5CaFN0c2NMWDZmUUE2clMrYmtZ?=
 =?utf-8?B?VmRCcDZFakJSamVzUGlRaU1vaG11cHg0alAwaE12NFI1empsZUtNYXpRNXQz?=
 =?utf-8?B?N3BBQVI5NCs5NGY0MlBYUUc0eWFOVzZFeVNULzFOS25DREk4ZFRzR0JSQmZy?=
 =?utf-8?B?ZzI3ZktNYm84SFVReFg0anpiUUpGdDNOMnVzZFh5dXhCNUpuZGRMS1NhUllY?=
 =?utf-8?B?Nm9aMmlzSm9IdW04bGpEQ2lrNXZnN2dSSnFORjBZZnBjY3RzTkFQMEF4YVBm?=
 =?utf-8?B?aVFLL09vRy9SSStUMXJxSE45M2NnQmJpanBZaHl5V0JhditVb3hlYVlYUTha?=
 =?utf-8?B?bzBVRWJPbEROdlBRWlhFWWhnKzVFL0hDS3RBSVNQbHJhNjB0MnlZSkRTSzhz?=
 =?utf-8?B?NHlXZzB2R1VIMThoK2Nmc2lBbktITkdsN0VLVG1ZK3ZtWTVUQlJpMGIvQ21E?=
 =?utf-8?B?bXpqQjBHcWNPVUVkN0FvcytlbkE4WUhlSzRNSE82TWIvY21FUGkxaS9rRTZB?=
 =?utf-8?B?Tkw2T0dzSkpxZmNseG53NE5NenpzZVVIcVRUTHM0SjliM3c3Y1kzWFQ1UHpK?=
 =?utf-8?B?ejF1OG9ISklsMWhQelJEM3lxRmZMNHh2N2h6bitrdE45ZFRmS0Y4WHZXUVpJ?=
 =?utf-8?B?QXRIYi8xVEpmcHgrK3U1bWpCWitFL3E0TllPOXYwMi8wVjlIZmMrYUxJWGwz?=
 =?utf-8?B?OFkvcUxvL3JJaUQ1QUlxRzFGdkl1MU4zcjZMK2h1Unk4a0VnMSt1dHdNQUow?=
 =?utf-8?B?b2xndFJoVjlYUExZK1FCZWJRK3pnaXNUSllMQ0JwV2JoWXN1cUtBZGw1b1hS?=
 =?utf-8?B?UzFnR3FKZGJMWEZRdnIxLzFRSXV1Q3REMVNWaUtmUnpLQlVmUHpTK0tBbEZp?=
 =?utf-8?B?a3Q4Rmp0WDQ4R1g3NzBGaHovNXRoWXNhMU1vNFBySTY0NDFndXh0QU5QM1N1?=
 =?utf-8?B?NldxYmZQem9uZGRqVEJJWjk1OGVNTFpIU1pRb2JFWWFGUXVpU2FiK1dKQXlL?=
 =?utf-8?Q?oFQrY0KJ1jQgO2hOoOuM1+sfpr7gMk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1NNbmtEdmFyVWFSK2lMdTU4Ym5HQkc4R0ZSbEs4Q290LzFhUU1YL2wyWk0y?=
 =?utf-8?B?STEzbUNwaTlFbnZ5dkhIalBLbTcrbVIxa3piSHZSS1orbHZQcEEyckVDalVj?=
 =?utf-8?B?Z1diUGYwSmRqamdOZHlaSDI1aVYzLzFETGFkNHEyc2Y3UDNGb2s3WHJiNVh6?=
 =?utf-8?B?ZEMvVWFBQ0pBU0ZmUXlXNC8vKzIvdGtNd282WU1SbzhzY0xjUXJSTWVVQlhX?=
 =?utf-8?B?bFdRU0dYb0JBYVBwM3BNSnA2Vm8yS01kOXJ1ckVUWS94YWpaQWZlSWk1T3pi?=
 =?utf-8?B?bVZDNzFNWjRGaGJvUzFTT2lwRjhqTDhzeHNSWncxd2ZPQXZTcGpnU2lZRFRz?=
 =?utf-8?B?ajVXTzFQdG1DUmZhMUhEdXpvdFV4YXNseDdaN1lnM1YzZmRBQVBpRmY3bDhP?=
 =?utf-8?B?YTFYY0dNSmFQRUZhR1NmallxbHo3UUsxdllZOE9NWWRZUkVhS2pvT0ZhbWpB?=
 =?utf-8?B?dWkySUtaWXZBSEp6YUlzMEJFSUZueExFQXY3YzNvbFNmeGRFNk9TSkMwZzJh?=
 =?utf-8?B?cEIzd0E1RWRLZkNWTkZFSk44amFmY2JtS21lTXVrbUhLVUxDdVZTUllHUmFE?=
 =?utf-8?B?L2JEWU9EcW9BK0pKTmVBdDg2cVNHUGpITkxhQm9SdmY1cmI2OHI4TmVHamhN?=
 =?utf-8?B?bHJYcmh6OUw5MFNjcFBqZVdzaVFMeUlkRkVrcnRRZjExWHlKRWl5WjBVTE5u?=
 =?utf-8?B?ejZaU3duQmlaQkhSVUZNc3NtYUI4MmFvejZwcXdpaU56dmpLeFZxeFBrbTFi?=
 =?utf-8?B?WThCd2Jwcmxhc0l0WW5LMCtlWmFsZFBKa3k5bklBdTA4M1BqQXlCY0JIR1J4?=
 =?utf-8?B?UytseVVEWG9rcStldGt0MTY4NnJiay9mU1dUWi93V2F6YU15QUpTVUJTclhu?=
 =?utf-8?B?ejJXUHdoNWI1VXM5Wk1YSG52dmVkQ1pVeWJQanlHdjFGSXJYTW9DNG8vZUVB?=
 =?utf-8?B?ZG4rTitaWGtnU3pmbEdGK3M3Q2ZFZCt5MzYzbXRBNXVXbXBhQThjb2FSWHBS?=
 =?utf-8?B?WGpBblNKdmlVMEVsZHpIS3FKRENNM3hEaDM0aysvam9MM2tQVGw0R1JKWGtu?=
 =?utf-8?B?Vy9QMDZEWVREbTVxa2xobnI0R3huOENkK0RiM0grdkJaNnN1ZkRjOWhXeDdO?=
 =?utf-8?B?dmN6NlBtL1VrZXlTOE5UZ3N1SGJIcmVYY2JYcCs1Mng5bENWbFY0aDRPU3U2?=
 =?utf-8?B?WnhhQ2dNYk45MlJyU1hYK2JpQ2tCWjkxRHNydzVDNWJOTWRYNU1PUUFTTXJC?=
 =?utf-8?B?bHVpa1g5em5Zd3J1bXJHMENYVHpIK09zWlpsZk1sU0o1dU4xcy9JMEg4eGhs?=
 =?utf-8?B?Mll4eTdlblc5cDFzRlNUWXlxS2Q3VjVWU01ZYnNWTWJMUkdCVk5Vc1NWK0I5?=
 =?utf-8?B?b2pUWGN3U3VkM0kzeGYzSld4MDV2R3RFOWtva1FBWHlHenlpLzRMeWxmdEti?=
 =?utf-8?B?N0NIcGJDOW9GcDhzbTMzejZmZGl0MVMrdytPQmFsc1poallXSzFKV3lSTTI0?=
 =?utf-8?B?S3JKMGNMN21HWTNtWVYzS3NiRnpNQkVFMjIxdVdEU2pTcGxwV2wzNUQybGFE?=
 =?utf-8?B?Vk5yUitwekd6WnhqdkFRemNwSk4zdTRqdVpERnc3ekVtQWxCU2djN2h1V3Bk?=
 =?utf-8?B?UzQ0RWx6eDNTVnpUYkJKblltYTMxbUwvOEtNbyttNGNhb3FJeVZTTzRRUmly?=
 =?utf-8?B?SDFzQ0VYRlFzdXhlYmdRL21MbzZIUTExS3hhMzROQ2o1eCsrTkRZb1MxTFBF?=
 =?utf-8?B?K1gzMm1FazBlT09ieE1heVU5SEtJbHh6VzdxaXNORmNpSFFWOUhQVndXdTlR?=
 =?utf-8?B?ZDNQY1Z1cVlhVDlCSFgzR1VxakZYcnQrNjAxcGlCZEFBMlJzUjJZRDVVc1VW?=
 =?utf-8?B?SU1CWks3MkdBeE9QVGlvM3dCUE9jS3VQMmhPYUdCYytOcnluMGRvRDdPcjhY?=
 =?utf-8?B?MTlsa2F3R0R2cFJlU28wWGI5WjRFdkwwWno1eGYvNk9ZblBnZnRzL2ptY3V6?=
 =?utf-8?B?WXlGVElRYTQ2b1dmQllzRG42ZVRONE5lTW5wSXF0SkE1d05PS3pHcXF2clZL?=
 =?utf-8?B?ZVl5VWh6NE51cEhFTHZCODlVRkVOb3lpZ0JTQkluN0tYNXRHc1IyakwxTEUv?=
 =?utf-8?Q?ezmZj+RybSd/AX411rJIeULbx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdbd0ae-ed56-450c-b733-08ddf1582c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 17:25:16.3139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHjtYXn+2Jo7Ks3ByYsR9X2hyAPGP1P8MLb2cDbhVZyFZ9qGbSh7nZmlbO1hpSkZsv1zSZ/zCks5dCGs34nOJVs5bKdWUDsv5SoPlbnu5j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBJbHBvDQo+SsOkcnZp
bmVuDQo+U2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxMSwgMjAyNSAzOjU2IEFNDQo+VG86IGxp
bnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5j
b20+Ow0KPktyenlzenRvZiBXaWxjennFhHNraSA8a3dAbGludXguY29tPjsgQ2hyaXN0aWFuIEvD
tm5pZw0KPjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBXaW5pYXJza2ksIE1pY2hhbCA8bWlj
aGFsLndpbmlhcnNraUBpbnRlbC5jb20+Ow0KPkFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPkRhdmlkIEFpcmxp
ZSA8YWlybGllZEBnbWFpbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBp
bnRlbC0NCj5nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IEphbmkgTmlrdWxhDQo+PGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IEpv
b25hcyBMYWh0aW5lbg0KPjxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsgRGUgTWFy
Y2hpLCBMdWNhcw0KPjxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgU2ltb25hDQo+VmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+
OyBUdnJ0a28gVXJzdWxpbiA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+OyA/VVRGLQ0KPjg/cT9UaG9t
YXM9MjBIZWxsc3RyPUMzPUI2bT89IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47
IGxpbnV4LQ0KPmtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj5DYzogbGludXgtZG9jQHZnZXIua2Vy
bmVsLm9yZzsgSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0K
PlN1YmplY3Q6IFtQQVRDSCAwMi8xMV0gUENJOiBDbGVhbnVwIHBjaV9yZWJhcl9ieXRlc190b19z
aXplKCkgYW5kIG1vdmUgaW50bw0KPnJlYmFyLmMNCj4NCj5Nb3ZlIHBjaV9yZWJhcl9ieXRlc190
b19zaXplKCkgZnJvbSBpbmNsdWRlL2xpbnV4L3BjaS5oIGludG8gcmViYXIuYyBhcw0KPml0IGRv
ZXMgbm90IGxvb2sgdmVyeSB0cml2aWFsIGFuZCBpcyBub3QgZXhwZWN0ZWQgdG8gYmUgcGVyZm9y
bWFuY2UNCj5jcml0aWNhbC4NCj4NCj5Db252ZXJ0IGxpdGVyYWxzIHRvIHVzZSBhIG5ld2x5IGFk
ZGVkIFBDSV9SRUJBUl9NSU5fU0laRSBkZWZpbmUuDQo+DQo+QWxzbyBhZGQga2VybmVsIGRvYyBm
b3IgdGhlIGZ1bmN0aW9uIGFzIHRoZSBmdW5jdGlvbiBpcyBleHBvcnRlZC4NCj4NCj5TaWduZWQt
b2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+
LS0tDQo+IGRyaXZlcnMvcGNpL3JlYmFyLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0K
PiBpbmNsdWRlL2xpbnV4L3BjaS5oIHwgMTAgKysrLS0tLS0tLQ0KPiAyIGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGNpL3JlYmFyLmMgYi9kcml2ZXJzL3BjaS9yZWJhci5jDQo+aW5kZXggYjg3Y2ZhNmZiM2Vm
Li45NjFiZDQzYmUwMmIgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9wY2kvcmViYXIuYw0KPisrKyBi
L2RyaXZlcnMvcGNpL3JlYmFyLmMNCj5AQCAtNywxMSArNywzNCBAQA0KPiAjaW5jbHVkZSA8bGlu
dXgvZXJybm8uaD4NCj4gI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPg0KPiAjaW5jbHVkZSA8bGlu
dXgvaW9wb3J0Lmg+DQo+KyNpbmNsdWRlIDxsaW51eC9sb2cyLmg+DQo+ICNpbmNsdWRlIDxsaW51
eC9wY2kuaD4NCj4rI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+DQo+ICNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPg0KPg0KPiAjaW5jbHVkZSAicGNpLmgiDQo+DQo+KyNkZWZpbmUgUENJX1JFQkFSX01J
Tl9TSVpFCSgocmVzb3VyY2Vfc2l6ZV90KVNaXzFNKQ0KPisNCj4rLyoqDQo+KyAqIHBjaV9yZWJh
cl9ieXRlc190b19zaXplIC0gQ29udmVydCBzaXplIGluIGJ5dGVzIHRvIFBDSSBCQVIgU2l6ZQ0K
PisgKiBAYnl0ZXM6IHNpemUgaW4gYnl0ZXMNCj4rICoNCj4rICogQ29udmVydCBieXRlcyB0byBC
QVIgU2l6ZSBpbiBSZXNpemFibGUgQkFSIENhcGFiaWxpdHkgKFBDSWUgcjYuMiwNCj4rICogc2Vj
LiA3LjguNi4zKS4NCj4rICoNCj4rICogUmV0dXJuOiBCQVIgU2l6ZSBhcyBkZWZpbmVkIGluIHRo
ZSBQQ0llIHNwZWMgKDA9MU1CLCBiaXQgMzE9MTI4VEIpLg0KDQpUaGFuayB5b3UgZm9yIHRoaXMg
aGVscGVyIGFuZCBkb2N1bWVudGF0aW9uLiAgSSB3YXN0ZWQgYSBsb3Qgb2YgdGltZSB0byB0cnlp
bmcgdG8gdW5kZXJzdGFuZA0KdGhpcyB1c2FnZSBhIGZldyB5ZWFycyBhZ28uDQoNClJlZ2FyZGxl
c3Mgb2YgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoIHNldCwgdGhpcyB1cGRhdGUgc2hvdWxkIGJlIHVz
ZWQuDQoNClJldmlld2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1qcnVobEBoYWJhbmEuYWkNCg0K
TWlrZQ0KDQo+KyAqLw0KPitpbnQgcGNpX3JlYmFyX2J5dGVzX3RvX3NpemUodTY0IGJ5dGVzKQ0K
Pit7DQo+KwlpbnQgcmViYXJfbWluc2l6ZSA9IGlsb2cyKFBDSV9SRUJBUl9NSU5fU0laRSk7DQo+
Kw0KPisJYnl0ZXMgPSByb3VuZHVwX3Bvd19vZl90d28oYnl0ZXMpOw0KPisNCj4rCXJldHVybiBt
YXgoaWxvZzIoYnl0ZXMpLCByZWJhcl9taW5zaXplKSAtIHJlYmFyX21pbnNpemU7DQo+K30NCj4r
RVhQT1JUX1NZTUJPTF9HUEwocGNpX3JlYmFyX2J5dGVzX3RvX3NpemUpOw0KPisNCj4gdm9pZCBw
Y2lfcmViYXJfaW5pdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gew0KPiAJcGRldi0+cmViYXJf
Y2FwID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxpdHkocGRldiwNCj5QQ0lfRVhUX0NBUF9JRF9SRUJB
Uik7DQo+ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGNpLmggYi9pbmNsdWRlL2xpbnV4L3Bj
aS5oDQo+aW5kZXggNTk4NzZkZTEzODYwLi44OTRlOTAyMGIwN2QgMTAwNjQ0DQo+LS0tIGEvaW5j
bHVkZS9saW51eC9wY2kuaA0KPisrKyBiL2luY2x1ZGUvbGludXgvcGNpLmgNCj5AQCAtMTQxOCwx
NiArMTQxOCwxMiBAQCB2b2lkIHBjaWJpb3NfcmVzZXRfc2Vjb25kYXJ5X2J1cyhzdHJ1Y3QgcGNp
X2Rldg0KPipkZXYpOw0KPiB2b2lkIHBjaV91cGRhdGVfcmVzb3VyY2Uoc3RydWN0IHBjaV9kZXYg
KmRldiwgaW50IHJlc25vKTsNCj4gaW50IF9fbXVzdF9jaGVjayBwY2lfYXNzaWduX3Jlc291cmNl
KHN0cnVjdCBwY2lfZGV2ICpkZXYsIGludCBpKTsNCj4gdm9pZCBwY2lfcmVsZWFzZV9yZXNvdXJj
ZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBpbnQgcmVzbm8pOw0KPi1zdGF0aWMgaW5saW5lIGludCBw
Y2lfcmViYXJfYnl0ZXNfdG9fc2l6ZSh1NjQgYnl0ZXMpDQo+LXsNCj4tCWJ5dGVzID0gcm91bmR1
cF9wb3dfb2ZfdHdvKGJ5dGVzKTsNCj4tDQo+LQkvKiBSZXR1cm4gQkFSIHNpemUgYXMgZGVmaW5l
ZCBpbiB0aGUgcmVzaXphYmxlIEJBUiBzcGVjaWZpY2F0aW9uICovDQo+LQlyZXR1cm4gbWF4KGls
b2cyKGJ5dGVzKSwgMjApIC0gMjA7DQo+LX0NCj4NCj4rLyogUmVzaXphYmxlIEJBUiByZWxhdGVk
IHJvdXRpbmVzICovDQo+K2ludCBwY2lfcmViYXJfYnl0ZXNfdG9fc2l6ZSh1NjQgYnl0ZXMpOw0K
PiB1MzIgcGNpX3JlYmFyX2dldF9wb3NzaWJsZV9zaXplcyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
aW50IGJhcik7DQo+IGludCBfX211c3RfY2hlY2sgcGNpX3Jlc2l6ZV9yZXNvdXJjZShzdHJ1Y3Qg
cGNpX2RldiAqZGV2LCBpbnQgaSwgaW50IHNpemUpOw0KPisNCj4gaW50IHBjaV9zZWxlY3RfYmFy
cyhzdHJ1Y3QgcGNpX2RldiAqZGV2LCB1bnNpZ25lZCBsb25nIGZsYWdzKTsNCj4gYm9vbCBwY2lf
ZGV2aWNlX2lzX3ByZXNlbnQoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPiB2b2lkIHBjaV9pZ25v
cmVfaG90cGx1ZyhzdHJ1Y3QgcGNpX2RldiAqZGV2KTsNCj4tLQ0KPjIuMzkuNQ0KDQo=

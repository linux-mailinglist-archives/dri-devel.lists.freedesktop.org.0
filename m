Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF40A78BE1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0610E73D;
	Wed,  2 Apr 2025 10:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOx0uhbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77A410E73C;
 Wed,  2 Apr 2025 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743589235; x=1775125235;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q9EPVa63Xerk57YcSsz6OpmvqI2Q9qaAsnBACU5KExI=;
 b=kOx0uhbzozgAPG9QMGna28IIcRk8bdKIAZSlrRa5KDRE9qlur9DCzRol
 jp/9188w+sUJYGH9+9zqg6Su+7W0l1Upb6xVJNMnGmb8Wglx0lfuibDki
 QN6a4jJIYQcMnIgVWYxMq+CFM9GucoyLAIzvbidSbHqcTAj8IU5HQrRjf
 MPZRTDsNKNTX93vClMoa7W6Q04T2JN9GonCCGuJvjNGKr3Oc3n66b8A77
 owv/NMWIpYEnJ5ZXox1jh8WBIiMMmsMMAkuWGWYToq/SG28PbhCBwONQz
 EX4Uozvsiqwm5fl4YXpDQs8UtrHZH5JO4Hf6E20uI3tqC6ZdCHS7bwXp6 w==;
X-CSE-ConnectionGUID: jcQUdaA7TxKdMLjmDtH1sg==
X-CSE-MsgGUID: GNC2MebFRrGyrBKt5hC6sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44092630"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="44092630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:20:34 -0700
X-CSE-ConnectionGUID: 0kMVcfihTV+Xj/+D/rxWBw==
X-CSE-MsgGUID: sEw3OzopSQ6HjEVUslzGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="127558607"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:20:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 03:20:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 03:20:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2KHJJJz1SguLaGdW2zNaZUgzoNs2Sr++nPK92dEc0NWqNPfAbv9nLYYsqguud/jWMqy+eHbOWrGBUD7dCDrAJzu5x9xip6wQmUyDcToJF8CEMyU2WGegNJkXJyODb/jMiNHBAkVCEsL28tv3+6nflGXpszlAb52YhXL/17jF9QW1gotqwdT+HEe6aYCMzcC+WmeflbeFEESYdjCVvV8pjLZJu7ijjY69i1IV8ztkqoi88kVACw4Awv0GFvoX5huE0mhFr6LBGDkkd/+kuigwycpVrrbdj/kP7yYlIcQJTlktFpZefJJxISSw6KCzw4IIrh7VjfOtQncjoPq1TpYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjjcO9VKHltAFWSRVMZ22ZGttnXfpwvyF62P7djqz2A=;
 b=o/M0lIpNckvfwM/5zi52k/FkxTyUIJ9XIbSMpysxQM1nZUP1dA7psadh87zErXvpiCXsTLmw4yki2NpISN0mn61t2AHvxHJwb4D+lf7C+9ABK1i0DpIqKaCgbj1D7sX/oPPwUrLUIPQgiIyhn1xi763kZx6zPla2G4uPN6Hz2ZGfPFZglkAz8SSLqIEbINRgxmVJyqttxmZIbDo7rLRNEl7KdLHzVSxYJe3BNlDBdDptznWqZDOpPEZLDZIIYSdepSdMAQSED418AWX36UZv2HyoOPSJYywW4EW5KpsGQObjFPdo4FCSNnuD+MrrmcyBQmLcgxaXu1lJOFq0NhX+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 10:20:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:20:17 +0000
Date: Wed, 2 Apr 2025 12:20:13 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 1/6] PCI/IOV: Restore VF resizable BAR state after reset
Message-ID: <d4mnsiiq3hjnpan3ue5e36ibu2kjuspsbq74viilwtoetljyyl@dabmlm6yu6e5>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-2-michal.winiarski@intel.com>
 <b10b559c-cb23-d21e-d6ee-e060eb0b6b5b@linux.intel.com>
 <f12b85eb-0dad-fa48-ffca-d052f41e0a28@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f12b85eb-0dad-fa48-ffca-d052f41e0a28@linux.intel.com>
X-ClientProxiedBy: VI1PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:803:64::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: de3cea88-b2e0-4a53-40ce-08dd71cff703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NURKVk56R0dyd2FUYmY0RVN3N1d6T2RBT2N2aXlnVVhmK1RiWEIxQUlnMHdk?=
 =?utf-8?B?WTZyL2pzS2NNaENubVpmY2JNQ2xaM1BFTGUwc2JiZXgrdnBCWkVmRlIvN0Jq?=
 =?utf-8?B?WmJpTnM2bi95ZGdVUHFQY2FhQTZuTjVscU5FZEhXRVFEWjE3MXcwMC9CMjJo?=
 =?utf-8?B?RkFyVHJCNCswYWVZZ0ZPNnpwTHFvNElnRjltM3Yzenpld01ZNkxHT1J1NnNk?=
 =?utf-8?B?SmFYeDdvRWpBUzhENmcvblE4RW9WUzhmekJWLzVZS0hjelRUbU5Ra3BRZ0cr?=
 =?utf-8?B?OE4wVDB0N0ZSVUJXbk0zRmkyODh3UDhCRjA3V0FQMVp4YjJMQXpReXVuR2cw?=
 =?utf-8?B?UmVtSTlpV3haaFBxMXlKeDFnMXVzcUhocGltUXZxdzlLNEM5SUtUWlIweElZ?=
 =?utf-8?B?QjBiaEZKcmc5REt2SlcvaXJQZ3RwRXp2SWduRC9aMEFKQkQzRGJyRWVVRHht?=
 =?utf-8?B?dnFNeE5tdU80TURaWmFhamFPYWFJbTA2aTh1UHdEeVF6Y0RxVmdLMU9tL2Jy?=
 =?utf-8?B?em9Wb3c5ZjVjbFA0Q25Nd1lRVHZaTmtrWnVhUUQ2T0RlSGtLaFdERUlrT1du?=
 =?utf-8?B?SnFkeHpNdTBWNWJqalVXZy8zNzRhTnI2cmwzUHNRZ0JPTDV2VGYvRDhnc2pV?=
 =?utf-8?B?L0I4cTRlL0VTUzR4ZHRsTThYVjd1QlRZMlVJN2lyaXNUQktlcGZLdmV6cUt6?=
 =?utf-8?B?STdBM3g2RTdIaEhzUDVXK0k4N3RtYmdFTWNtUnp3U05rNWFHaXdnMHdkVzVs?=
 =?utf-8?B?eWR0TFIvV0NadHR6b1FSczQzS3VNNUphM01jRUhjYjBxK2ZhRUNna2g1QjRT?=
 =?utf-8?B?Q2RCaEV3WHROZDZITnZwc2NiTzJoWlZTaDV0UUFCamx0c1FTQXlLcktiYzlG?=
 =?utf-8?B?MWxuSTBzVG9TblJHQjB5bXBkbVdtNTRJcEpRMXlBMzg4d09vUUhDamZtR0I1?=
 =?utf-8?B?QmZ4K1lsZklEenBvbktLcHVwQzBxaVpNdy93Y3F3Y05CdW9xczZBV2h2ZjZQ?=
 =?utf-8?B?bWFmYTN5L2ttTllqM0JlZWM1QVd5U0IzSk1VQkoxQmRxbm4wMXB6Q3ZLNXBY?=
 =?utf-8?B?U3pZL1ZSSWxab2t3cUhOaHpOQlE1ckVBWDFlWGhiYkhQTS9wY2VGNHlIdHFv?=
 =?utf-8?B?cC9BRmdlWW9uMUVRcWQwbnU1clhNbkM5ZlRsZGd2cGxOQldjSWRXbWZrWElm?=
 =?utf-8?B?M0RDU3g0Zks5YjI4em10V0p5YjVxQldqazkzS0JyTTIydzJNM0JwL29NNWtU?=
 =?utf-8?B?VW5taExkS0RZVWh6ZlJJcHBJL1llQTlFZHMyS3VPUzlGNGNWazVZVDJYUEVq?=
 =?utf-8?B?OXpEN01YN25EMUo4amd3Qlc2WkxjQ0puY0hPd0JnSHFubFZuRm15UXpQcTM3?=
 =?utf-8?B?YWlFU2ZGK0VJdXdPVzRBa3BGMjM1M2ZOSE0yRzRFVktPU2pDWVVUaXhWVU44?=
 =?utf-8?B?MHNLYS9wZ01JQVhacE5CeFAvR1UrT0czS054ZUVXQ2hXTTI1VTFxSTdQdkpU?=
 =?utf-8?B?Qk5jdHNwRDE3OG5sZllKbGRxWE9kMUJKNVFldUJNRU4yRG5XVFJ1ZkpqMTFs?=
 =?utf-8?B?eVhoKys1YXNSV21XUTVrNHFiVTZRenZVeWRRZWxaSjBZNzZCaU9nL0hENVRS?=
 =?utf-8?B?SmxMUzBMNFBhTXRLY0lGL3c4NGpUZURCVHZGZWVkOTcrN2UwczZmQklEWGFz?=
 =?utf-8?B?RlA3ZmhZci83V2V4MnRCTGxqQm0xVGFBNW5aMXovS0FabXJxRU5YdWdNQ3Rx?=
 =?utf-8?B?WVI3VTgvWXBKSlREaThDV25jcWxKeG9hY2I1Y24xK2tjSW9OUUd3WkJUMGtX?=
 =?utf-8?B?amRheXRWdit2bWdHL2MrT3BRem5ETGJ2U2lkZ3JNNlcxeEMxYytwZVFuVUU3?=
 =?utf-8?Q?q6F9GmzOC6MlP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M21UMzhCNlFidldhcUxTQUdmbEc0aHlETVUzdDRQd1pZL3N4TkpLQjJ1WWtu?=
 =?utf-8?B?alNGWVhIOCtMeFhSUUc2bkpmeDRiS1BnVDZQMkY3eTQ4cERzenRVNVV2TzJh?=
 =?utf-8?B?Qkh5MXBKNHFhdlh5TjRnUERFWFdndC9pRDR1WG5vdXhPVEtmenoxNG9kS2dy?=
 =?utf-8?B?TGduYjlGcFd2N2EySDRYNS9YYVNRSy9CMk84YmhiVnF0T2dIQWVUeVFSekls?=
 =?utf-8?B?SEVNMXRLTjB1OGRsc0xLTjFQSVUwOElSaVFZeFczV1dlcUZFN0pCby95S0xQ?=
 =?utf-8?B?UG82UHczUzhRU2VUTWh2b3RBSkVtaCtZb0t4c0gzV0RONll6eW8yb0ZoK0Zw?=
 =?utf-8?B?eFN3NmdZalEvZDVub20wb1Y4K2hqR2MyWVJrL1JsT1VZRFBVUTRKL2tLZ2kv?=
 =?utf-8?B?ZlNFV2xsMVJFVW5TWTJwZW5tVUVoMCs1OFJHK1VMOXVyZTU1REFmYWJ2bEdj?=
 =?utf-8?B?RTg2bGVmVjFTYVlVM2xEbzNOWktDeHZNNTZvWmhsek83ZDljV1ZxejVicUdy?=
 =?utf-8?B?bWpVVzdVWVNTYjlyaGRPcllhZ2wwMHg2Z01SRkRRbHdPVFFwWjhwc1MwbkJw?=
 =?utf-8?B?WlhhSW9FWHgyOEJWNndFc1ZwODMrZWtNc25ZaGxuWGsveUlyYlcyUTZoNUJJ?=
 =?utf-8?B?dHErbndqaHpQZTcwY0lVcjR3NkNXeC9WaHpSdERzeElodXFWemVHT1hyMXc4?=
 =?utf-8?B?UEgxdUViZGtwRERvUjhSenVXVjAyV2xsZ0pWVGZ0TzFLWElQSHVkOC9MZ0V2?=
 =?utf-8?B?UnZEN2drR1FxQnVXKytYODJxa3cvaVhqWEdNdytSODBxNWczejg2aFFIL01m?=
 =?utf-8?B?bzFVU2ZITUdLV2I2N3BWZjBERmtZM0tNd0xTS2VtWDJZamwzVE1nV3VKLzh0?=
 =?utf-8?B?OGdGendreCtvaGo4Z2plOXVLOTFVd0Rndk1LUUEvK3piZGxsWklTUG5odzAy?=
 =?utf-8?B?clNRTStZSHFWdDJ6WnpaVW55bmxzT2xhN083eWpPRFlYUlpkUEcxdE1kekky?=
 =?utf-8?B?czJpcWpwaXMvbStqZ0hESlBDZm1CNTM5eUhsNUdCNGZ4UkNrMThrVy9nZWRp?=
 =?utf-8?B?UksvOVJyVEFvZzFBZXlWSE5LWlZwY09QeUdPMlk5VS9NZU5BRnpMWUR5cUJH?=
 =?utf-8?B?QkN0alAyeUZsS21QcklScjh0UVk4b2tiVDh1MS9qeXNoK1EvQ3NXL3ZQeTdL?=
 =?utf-8?B?UDlMSnNoSCs5MmlQVEw2N3F5aGV4SVc2cW44TWpNdURnSlMzRmxuVlNPRlBL?=
 =?utf-8?B?TlBuQmV1cHBlV2pFa0JLZVVMUkczTVdXakpkMmhEazRGS3JYM0JhYWRmUTRB?=
 =?utf-8?B?YWl3aEdvZlJvNTJsYVAyaEdKUzRmaFBib3ozUGJ6Tjc1MExUQUVlTmJYczZV?=
 =?utf-8?B?bmxBMTh3NFdvV2tRMzRaWEppTHB0V1pZWTNaWm1ubnAwclZDK3FsUHAwcjlB?=
 =?utf-8?B?eDN1cWI0OTk2T0NpNW8yN2RoZzVDWXFGR1NCV24vOEFQOUJIZ1huQU0zT1du?=
 =?utf-8?B?NGo2VnBJenRkb2FvSVJiMGJteGdUVHdhMWthTjhtYXRLZjNUUCtZbTh5TFdM?=
 =?utf-8?B?dGxwYnMzQ1NsUjJJa09sYkY4NW9hQ2tSdTFJbmRic21HNFIzeFhNN2NocVFS?=
 =?utf-8?B?ck0xYlZZWlV1dmZkRG52VjErK3NtZzhpV0hOcXZ6QWZIVjJlZFJsbTI4NTk4?=
 =?utf-8?B?OGE0MFFTOUl0MWxWVXJ6Z2FSOEZ4aGJjeWY0Y09MbERxUU8rSks1SFV5MjB1?=
 =?utf-8?B?RkdCbkVWZ3FOeDNnUUpmQysxVThXRXUrbVZjWjZqUVlhZnRncENyTFFuKzRY?=
 =?utf-8?B?SXhESHU4UnNKZVVNdXJDMjBDbXNMOFJ6d2c3eFM0MFhqY2xHV29jcnUwY3V0?=
 =?utf-8?B?eVY4M0JKaXNLL2U1RkMrSDlSdmhDbXg0V1Z5NXFLZXRDMEFHSmJzNlU2WmJj?=
 =?utf-8?B?WjJKREFweTBENXVUc1hOTElHNW5GRFlXTk9DVHBEZ3QySXpLMHJ5QjNOTEM2?=
 =?utf-8?B?K2JFQkt4VWExdVpLcHNjUEFFSzAybU5nWWs4WVR1V2Evbi84MkIzRXVUYWZs?=
 =?utf-8?B?WFlFUWNHSHp1QTdCU3AxREJhS2k5amppeWNuRStPUjBtYnY5c1B5RkpqR0hC?=
 =?utf-8?B?TWw0K0NCYStKSHlQVUQ3YnpDQ1lVSTZpSGYwNEhmeFl5NlV3a05FUVBFREJi?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de3cea88-b2e0-4a53-40ce-08dd71cff703
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:20:17.5677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJg5oOUem++0kWFFHocQ7NGb+x/Ivgaj4LtX0KiQ7z4CmFJaifKEiLs7UqrZhbpYzJ6fi3r3JoeqZKAnV0O9x278GOfhaQQZ4G4sMcx/ZAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
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

On Wed, Mar 26, 2025 at 04:52:22PM +0200, Ilpo Järvinen wrote:
> On Wed, 26 Mar 2025, Ilpo Järvinen wrote:
> 
> > On Thu, 20 Mar 2025, Michał Winiarski wrote:
> > 
> > > Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
> > > the system firmware or the PCI subsystem itself.
> > > 
> > > Add the capability ID and restore it as a part of IOV state.
> > >
> > > See PCIe r4.0, sec 9.3.7.4.
> > 
> > Usually it's best o refer to latest gen doc, the section number seems to 
> > be the same also in r6.2.
> 
> Actually, it isn't. r6.2 9.3.7 does specify capability IDs so I though you 
> be refering to that section, but there's no 9.3.7.4 section at all.

Yeah - I'll change it to refer to r6.2:
"See PCIe r6.2, sec 7.8.7."

> 
> --
>  i.
> 
> > This didn't refer to spec section that specified VF Rebar ext capability
> > (7.8.7) though. I think it should and it would also be good to mention the 
> > capability layout is the same as with the rebar cap.
> > 
> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >  drivers/pci/iov.c             | 30 +++++++++++++++++++++++++++++-
> > >  drivers/pci/pci.h             |  1 +
> > >  include/uapi/linux/pci_regs.h |  1 +
> > >  3 files changed, 31 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > > index 121540f57d4bf..bf95387993cd5 100644
> > > --- a/drivers/pci/iov.c
> > > +++ b/drivers/pci/iov.c
> > > @@ -7,6 +7,7 @@
> > >   * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
> > >   */
> > >  
> > > +#include <linux/bitfield.h>
> > >  #include <linux/pci.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/export.h>
> > > @@ -830,6 +831,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
> > >  	pci_read_config_byte(dev, pos + PCI_SRIOV_FUNC_LINK, &iov->link);
> > >  	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_END)
> > >  		iov->link = PCI_DEVFN(PCI_SLOT(dev->devfn), iov->link);
> > > +	iov->vf_rebar_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
> > >  
> > >  	if (pdev)
> > >  		iov->dev = pci_dev_get(pdev);
> > > @@ -868,6 +870,30 @@ static void sriov_release(struct pci_dev *dev)
> > >  	dev->sriov = NULL;
> > >  }
> > >  
> > > +static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
> > > +{
> > > +	unsigned int pos, nbars, i;
> > > +	u32 ctrl;
> > > +
> > > +	pos = dev->sriov->vf_rebar_cap;
> > > +	if (!pos)
> > > +		return;
> > > +
> > > +	pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> > > +	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
> > > +
> > > +	for (i = 0; i < nbars; i++, pos += 8) {
> > > +		int bar_idx, size;
> > > +
> > > +		pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> > > +		bar_idx = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, ctrl);
> > > +		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
> > > +		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> > > +		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
> > > +		pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);
> > 
> > I started to wonder if we'd still want to have the VF Rebar ones in 
> > uapi/linux/pci_regs.h (despite the same capability layout):
> > 
> > /*
> >  * PCI Resizable BAR and PCI VF Resizable BAR extended capabilities have 
> >  * the same layout of fields.
> >  */
> > #define PCI_VF_REBAR_CTRL		PCI_REBAR_CTRL
> > #define PCI_VF_REBAR_CTRL_BAR_IDX	PCI_REBAR_CTRL_BAR_IDX
> > etc.
> > 
> > as then it would be possible grep to pick up only the relevant lines.
> > 
> > I'd not duplicate _SHIFT defines though. FIELD_PREP/GET() in general does 
> > not need _SHIFT defines at all and they are just duplicated information.

And I'll also add the defines for VF_REBAR and usage for config space
restore.

Thanks,
-Michał

> > 
> > > +	}
> > > +}
> > > +
> > >  static void sriov_restore_state(struct pci_dev *dev)
> > >  {
> > >  	int i;
> > > @@ -1027,8 +1053,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
> > >   */
> > >  void pci_restore_iov_state(struct pci_dev *dev)
> > >  {
> > > -	if (dev->is_physfn)
> > > +	if (dev->is_physfn) {
> > > +		sriov_restore_vf_rebar_state(dev);
> > >  		sriov_restore_state(dev);
> > > +	}
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > > index b81e99cd4b62a..adc54bb2c8b34 100644
> > > --- a/drivers/pci/pci.h
> > > +++ b/drivers/pci/pci.h
> > > @@ -482,6 +482,7 @@ struct pci_sriov {
> > >  	u16		subsystem_vendor; /* VF subsystem vendor */
> > >  	u16		subsystem_device; /* VF subsystem device */
> > >  	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
> > > +	u16		vf_rebar_cap;	/* VF Resizable BAR capability offset */
> > >  	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
> > >  };
> > >  
> > > diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> > > index ba326710f9c8b..bb2a334e50386 100644
> > > --- a/include/uapi/linux/pci_regs.h
> > > +++ b/include/uapi/linux/pci_regs.h
> > > @@ -745,6 +745,7 @@
> > >  #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
> > >  #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
> > >  #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
> > > +#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
> > >  #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
> > >  #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
> > >  #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
> > 
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > 
> > 


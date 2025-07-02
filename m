Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE54AF100E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF6510E6B2;
	Wed,  2 Jul 2025 09:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwaKVM+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74010E69C;
 Wed,  2 Jul 2025 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751448974; x=1782984974;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=QMv8O1aPy2arNOqAdmtctSslFqDnKyoAtjAV4SDhBlk=;
 b=MwaKVM+hKXIaJbkAtMznjzzbO9gBGdAQLmUDKY5KHMQ6K2VHeiV4FuUs
 q3MZBhlk6SSY9uWSEcyNh8903nnp/+mSUefb3z4AXZ/kcLdIvntcOIgn1
 1aMk1Rhr/402pZBhRknxQf12d/6aMOev77QFPo4J1CXGFLKKSiUh4zdTR
 eSortLDL2mHLlo3XKFA0P4a2aY5Ds4IUTwVr1TVjHwhSSWlLpNdYeqm+D
 BlkQl/E2XH0zcSY6IpVBDJMh5Li5+YvNFFHxYTVxNQtJtLkwXSFQEY1RC
 yBnyos/NeTMbuEv3DE1LPg+pKTPsSsFNQtnRERS0ngoeqpU18T56IMs9o Q==;
X-CSE-ConnectionGUID: 86cd96V4TkqDRPeBOt2IDQ==
X-CSE-MsgGUID: 4Iegvd3CQCKNW0RYhAJmLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53852651"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53852651"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:12 -0700
X-CSE-ConnectionGUID: 80gSUKEmQYyAHsj48ZQHtg==
X-CSE-MsgGUID: eSGrQ5fuS0adB32o4jYqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158404614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 02:36:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mm8TG5I2ZC1Jy5HAWjdRU2vEFO6Mxwg6/lyad50DJQW4or1nd4EZ4k72GHJsn6GTjMOKKF7DeUqaIXztJHyds8L2xmif2SzbFR7KkcwkltRDS9vYRby8R3ajXAx8V2IWupSmvdw6+fLyLTlLBvGIhKvoc6Lf78Ux7aPEyitmIV2xkLgnLp7KtmehzE9EZ0Twtw/inU6MfUINtgD/SKBFNRSr1N0KCAR+bGsg0CLA65LAKTtLioXp2Yv0BNJbPuKs5atM5WKdIAx3Bs649UU6Q92KLJV87p9rypNyzOw97fMKbp7L0b/Qj3oa6jhAq84bZdbbhRNallKxLDYnDlyYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PtxqpJsZwzRnaEDwrD/mwUIHujJD/kccLV13L+A7iE=;
 b=n7XJ5niQrfBMddrZ+DG8jl32ks4xmk0h8drqKfZQ5u+YHJ1Ni7i88a+LRH9aJxhQhAu+6NS7acAlBkoj/XMqFNsD314JGsTKu73NjbEePIbQ0uLrYPC42DNQu2pbJA94nV6PI8IjXIUJmVNnuy2s35w6ckydMLguHKd7TIX0EY+Ti7JaD06RjkQBa5B0oDk0F0jYkjHooQ4l+4HwWgIBfXw99WxUf8svL/cplelp8Hx0v9aTHP78JJvb78Z1ECrUWBFapZi/V0KzFIo09n6Pj7BOchN7oJjcVLgvshadPqHMczz5uBOI6UT4MHOMCXKFrlIgaUbOkiq857/VdFlySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 09:35:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 09:35:41 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v10 0/5] PCI: VF resizable BAR
Date: Wed, 2 Jul 2025 11:35:17 +0200
Message-ID: <20250702093522.518099-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: adec531e-8a50-4cc6-53ab-08ddb94bcfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjRVZEJYZ3BodmhJQVZ2ODZ4TFlqWkM0cVkvZnhQZWFzK0N5VGovQ3ZiSCs2?=
 =?utf-8?B?L0t5YW1ib212YzZSTlAwaW5zNGlhaDU5ZzlwOCtRUERNb2tDMU5LQWwwNW1j?=
 =?utf-8?B?eE5PeElXSTlNU21DVzRNT2c4Y3dybVpldFV2blVVTVBINHNQZzVRWitkdTRV?=
 =?utf-8?B?aHI3KzJ1aHJrSzdQNTRIOWJ3c01uRFhjeGFJZUhFdjNZZ0t6ZWp6a0JWOGpF?=
 =?utf-8?B?ZC8vSjNGN1ZXRjRlVlpVdHJRRnByM3dXMXR1TUpLS1duUEErSWRLNDFQZ1Yx?=
 =?utf-8?B?SnBmZkI2Zk81ZDdUMGFhWC96dWNON0xsYzQ5dWF1RWZFaW9OdUZOT2FjU3ZE?=
 =?utf-8?B?dlhCclI2OTFGcVkrTG5RVGJCM0p4Ylo0K1NqczMvTUZFRHJpa0pFdG5yNGc1?=
 =?utf-8?B?RkpyVkNjY01nWUdZb0pzOURIeHFLcVdsaHU3dTIwYzhlaXE5NXJQdHY3MGpN?=
 =?utf-8?B?RW4rYldxOU5xbVhXS2tUY3BJR2tPVFRYZHE1TWFDSitWcjN5K1dGTzRlZGNy?=
 =?utf-8?B?Vm15MjVRd2c5Ym00RjRuUmdVYUhuMlBGWStXOXJ0bnR2RWJZTDFGYklBdENv?=
 =?utf-8?B?SHFrZFlXcmQvaFJEWkF0K2tnYkFBd2VrbFdrUmpkaDBHU29iWFZ4eEEvRFZw?=
 =?utf-8?B?VDFwNXlmSlMvQjJMRVdJNVlVVTFXTmlDNzBjV1RJcEsySUM2em5pMWFham5W?=
 =?utf-8?B?NjBidTJxMzZUNDVMQmhrdmhQU0pKREFRSTBoNG5ZamlUckFQckNEWUVud3JL?=
 =?utf-8?B?TmsxU05ncU1heVBPZzVxL2ZianU5NjNXZXRMYlRYTHBLRHhXQk9CSEhiMVpt?=
 =?utf-8?B?K0pGSkprU0QzVVVIdXY0UlJmbTlyUDlvRzNuK0VPSlh5UE0xVTFYS3BOSU9y?=
 =?utf-8?B?Q1Q3c2JmOWJXUkJIcFI2UHd1ZUlndHdIT3NFSU1sTFlXK0dIdE80SlB3ckFP?=
 =?utf-8?B?ckIrUTdFVmZuVktYbGpveGRmdjA3RVdTL1ROanA0VXRjbktQWjI1SFV3Szh4?=
 =?utf-8?B?aVpaQWlOL2JJRURSYk9iOG5XNEFmRXBISXpLYW5NRWFJUHdJaGgyMXp6VnN1?=
 =?utf-8?B?TnB2MHJqYlZ1VFV6dTNGVGpKWXk3OXZudmdxZ1lURFBIb3FvRVFlYnZReVNa?=
 =?utf-8?B?MkU1MHI2djU3RjVVVERxeW1KZnhjQ1BSckdZSU82dFFtVUdXMlRjeDdGelF3?=
 =?utf-8?B?ajk2NUZ4N2VQd3A4N1ZON3REbVExaGdaUW9Pb1FMQkpkejh0V2lOa25ackVL?=
 =?utf-8?B?WUhMYjBwaVdYSjBrVXAwanNHY2dGR05iY1pzUUxMWW0rckxQRkc0ekw5b3Vw?=
 =?utf-8?B?bWRJV2lmcUFWTGtrU3dsZzVwTkdHVFRRbjR3NTRqQUE1b25DbEp0YmtOMkJu?=
 =?utf-8?B?ZHFYRE40b3NnY3hiaGVwTkNhNXpRZWRxYk9UN05LS2JWLzdEeTBYbld5MTM4?=
 =?utf-8?B?OHpKSEtDT0pIMGovYWNKakR0NFNOa09tYXhya0RsOXRGeE9vcXNKSFNJczMy?=
 =?utf-8?B?ajdubmFNY3NLQzlwVTh1QnIxZ2dNTnQvaXVtSTBWUmt1T1BTcEtUeVVwWXJz?=
 =?utf-8?B?L09CWTBJOElxeVpUMTVKZkl2K1F5cTVXSGFlMXdVbjJXeGRGU2dCNmdPVFVT?=
 =?utf-8?B?bGZhNzJiZ3V0c1AxU0VDVHlzMXFZeXhZaUdUWEJ3QjJpSHFTak1HblVYSHFT?=
 =?utf-8?B?YVpUTllnUWdiamFLbTJoazBmbS9MclB1WGVwMmpmTkFmOWlTR2dmTXRFaTZo?=
 =?utf-8?B?RUNIY0I5TWxpKzB4UHFsSUNBSDVmSHJIMVQ4VllMcW1IdGpVWEN0bTVjd29P?=
 =?utf-8?B?ZU5IdHkrSUgzdFZlN2RMdFQrU1gwM3h5anM2Ky94WXdQME9hNldrOUtraGgw?=
 =?utf-8?B?cTJ1QUtvL0huaUppdmttUGN3dWxYblMwd2JhbVNxSGRzK3NQWDdCTlNFZ0R2?=
 =?utf-8?Q?RT5czNo8bN4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1FzS0w2K3M2TnFKdGlQSHlWNnA1WDFXdis3RGtJRGpxRk52RHBSZUEwdW0r?=
 =?utf-8?B?UnhuY2dWSlNxOTRSdXMwVElObTAwVE53TDZlNlk4bWpPclgzeklqRFdMSU9s?=
 =?utf-8?B?RG81aS9HVWs1ZFk0a3JYV3c2YUE4N2U2MjFVU2VjVmdPU1dmcHZibmM0YW9M?=
 =?utf-8?B?MFJBdVlaKzZyYWJQUy9wbURyMGthVUphV3BCN1ZtSEY4dnBzaFdvMll2a29i?=
 =?utf-8?B?MzFScWtsc0d4ZXFudnlBc3RWeDdzcFVHUXBHRWFUNnB1aEZMdFQ3QUx2d3FQ?=
 =?utf-8?B?VFpRNzJYdFNxd1l5Ynlhb1ArcmtTQjF5dWR6ejNsRmg2SXhrYVBtS0lSSlU0?=
 =?utf-8?B?Mk5uZWhndllFdGI0dXUwcnRrdk9IQi91RnluUW9aVDh0ZE02OC9qYVpjUDZy?=
 =?utf-8?B?L0FxaWpOVkJsekU2MDVFY3NsMFVQRW44NVV3czRYR1lLZnVHMDQ5cFk1U0FD?=
 =?utf-8?B?a05LYTBQUnZYaXpLbUVhNkhnYmdZeENGUGMwQmZId3NGRVdoZnpPTUpYTWo5?=
 =?utf-8?B?S3VxK1lRZzlUM2dBNzU4TnRqeEVmbm5HQnlJZmhwMnJxYVArZTdjTk45Y0hW?=
 =?utf-8?B?ZWpwQTcrRGdrSXNkVU5PYmQwYnE5N1h0cjFERGMvV09XdEMvSUtRMm4yZkJQ?=
 =?utf-8?B?bzVZRDZkNTJpVitObGRLMFdBZUIzQ2w4MkdCOTJobk9oSkVhSFpPWnRXTHMr?=
 =?utf-8?B?UVQ1alBaRDVDamFZVGpWRGV3a3ZJRVZjcEpUQ1J1elUwc3Y5Z0YreXJDdFBn?=
 =?utf-8?B?VDdydXM3Zm9uU1pFN09VZ2dyVWIxTWh5djBhVHltMjlKQ0djYmtWS2Qya1VQ?=
 =?utf-8?B?OTFUb3NlcThld08xdVlwSVZDaGVkRmg2QncwOXNjSzgwcUh0VEFOVmZFYkY5?=
 =?utf-8?B?QUtxS1I3Znhld2xvVWRacElUbTc1ZzRHM2VWVGRwcDdENFVNSTYxTFJtLyt5?=
 =?utf-8?B?bEtNUDNMb1dWSXEwMFhkeWI5RllnUGRWZGpPc2VNaXpuamwyYnZzVjRhbkFo?=
 =?utf-8?B?alErc0JGWFltYXZyZ1R0cms5TnhOcitkV0VVcXFhNGhYd2JjNFYvOVE4SVM2?=
 =?utf-8?B?djlmVzkzMmc3ZnNxYy9RdnhsbktudlIrT2s1NnFIRXhEeTR4NkJmRG42T2NJ?=
 =?utf-8?B?UGVQUTE0MEhhUDlYWDkrYjlOb0pKYU9LT2tpT0ZTNTRiK0VzeldNS3Y5WkVz?=
 =?utf-8?B?S2J1WEcrUzJTYVVXcGl2R0EyQ3pqVEJvRE9XUGFRZ0ErVWRycGN1a3poQXZz?=
 =?utf-8?B?anQyYUVhZVByN2UwMGNSMGRyWGc5TjZNZHdoL1RZaUlZaHBDWExPR1NrcTNk?=
 =?utf-8?B?RUN0ZDZLRUFFUDNocktHZHZKUFZ3RmFiOVNzSWdMRUJ1VktlNXRqejN5ZHJq?=
 =?utf-8?B?d2FGOVFSUk56UUJ4c2RERGtaYmFzTnpIVEd6UVJDeFRkNWdEMVlJaXhwYzRN?=
 =?utf-8?B?V0pacWlldXcvbTNJNUg1OXVmNnNSRXdyTE5mSVNCUlU0aFpCbUtFb3NsVkxS?=
 =?utf-8?B?VkRiTXlIMmFza0JqTXhZUnVnK1NUdm1vZVMvcUlMZ1FZaHdrc1YzVzFDNEZC?=
 =?utf-8?B?cjBNelZHazRUbTJzZHZTbmM4b0gvM2M0bXI5aXV5QTI3ZDI1VSs2ajBuOERC?=
 =?utf-8?B?SGdTOG9xZlVNZzQxY3JTazhSQ0R5Ukpsc1JwaUlaVkd4QllJS1ZSUDBSVUEy?=
 =?utf-8?B?UFlzQ3AxYldRU1ZwT1VUMkdWbldvSi94c0xTWEp6NzYxOWFEdEM3cnlLZE5z?=
 =?utf-8?B?MWlDK2NJM1QyTUtQUHRwTVk3elJXV0hHRU1qMjhsMzhWelJCWjI4RXRrMm9n?=
 =?utf-8?B?Ry9GNkdsVk1haGZHS0xRcisvWCtUQWpWamFyNVdYcEx4Z0h3UzZ2cUFFa3h5?=
 =?utf-8?B?b0dKZnJCcThqRnEyeGt1MWhOMjJGeko0OTVRenQ0c1ZoSWdrR1pmd0lySHpu?=
 =?utf-8?B?bnlOMlU3dUZsUUlIQXU4a2tFY0ZPZlIyd0JuRGE3emF3dkdycVhVb3JsbVo1?=
 =?utf-8?B?NFg2SHozYjF4T1dFTFlXRG1WN0Nia0tKREx0MDM3S2Nad0JBRGZOWXBPcUF0?=
 =?utf-8?B?bEh5MnlrN0hkNDJNbnFSMjNkNlJRUnhDaFVNMHQzTzh0OEhRK25qYUdQbXBY?=
 =?utf-8?B?REVSeDhONXpHK2hPTXpCZHByMjIrZWI4bGo4TzFtWUtjMUN6b3d1SmZuVEla?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adec531e-8a50-4cc6-53ab-08ddb94bcfc0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:35:41.6985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbXaIH7utIlGL2uv87Q0L40bN20tjuneR31Kuga3BEwoZ07RVi12BXfSgMuK1TtCq2tiiW++MrHdVygh5JTVkiYXKCZT4+kpWOE63i/sIp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
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

Hi,

The series is now reviewed, and it looks like there's no further
feedback.
To limit it to PCI subsystem, I removed the last patch in the series, as
it contained changes in drm/xe driver (it can still be found in v9 for
reference, and I expect that this single patch will go through DRM tree
anyways).

v9 can be found here:
https://lore.kernel.org/linux-pci/20250527120637.665506-1-michal.winiarski@intel.com/

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API for drivers to change the VF BAR size
without resizing the entire underlying reservation (within the original
resource boundary).

Thanks,
-Michał

v9 -> v10:
- Remove last patch with drm/xe changes

v8 -> v9:
- Use u64 as do_div() dividend (LKP)
- Introduce a helper to access cached vf_rebar_cap (LKP)

v7 -> v8:
- Update variable ordering and missing includes (Ilpo)

v6 -> v7:
- Eliminate the loop in pci_iov_vf_bar_get_sizes() (Ilpo)
- Use helper variable for indexes (Ilpo)
- Kerneldoc formatting (Ilpo)
- Refer to latest PCI spec (Ilpo)
- Commit message wording (Ilpo)

v5 -> v6:
- Rebased on latest pci/next
- Cache the VF resizable BAR capability position to avoid multiple
  lookups (Ilpo)
- Use pci_resource_n helper (Ilpo)

v4 -> v5:
- Rename pci_resource_to/from_iov helpers and add WARN if called without
  CONFIG_PCI_IOV (Ilpo)
- Reword kerneldoc for pci_iov_vf_bar_get_sizes (Bjorn)
- Reword commit message for VF BAR size check, extract the additional
  size check to separate conditional (Bjorn)

v3 -> v4:
- Change the approach to extending the BAR (Christian)
- Tidy the commit messages, use 80 line limit where necessary (Bjorn)
- Add kerneldocs to exported functions (Bjorn)
- Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
- Use FIELD_GET(), tidy whitespace (Ilpo)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

Michał Winiarski (5):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to convert between VF BAR number and IOV resource
  PCI: Allow IOV resources to be resized in pci_resize_resource()
  PCI/IOV: Check that VF BAR fits within the reservation
  PCI: Allow drivers to control VF BAR size

 drivers/pci/iov.c             | 153 +++++++++++++++++++++++++++++++---
 drivers/pci/pci.c             |   8 +-
 drivers/pci/pci.h             |  39 +++++++++
 drivers/pci/setup-bus.c       |   3 +-
 drivers/pci/setup-res.c       |  35 ++++++--
 include/linux/pci.h           |   6 ++
 include/uapi/linux/pci_regs.h |   9 ++
 7 files changed, 235 insertions(+), 18 deletions(-)

-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052DD97CF40
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 00:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291510E778;
	Thu, 19 Sep 2024 22:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ky0qvNCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCCF10E03A;
 Thu, 19 Sep 2024 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726785507; x=1758321507;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YbWF9nIBa4DD7UTYOO4XTcGGdWYgSVwlwL3Pl1SvZko=;
 b=Ky0qvNCcrc7w2iDIMLDceDkGmrtBmzzYdBALM9bs9MudFbNwj+zaC0Kd
 5oianxRR4AqK2GW5CHA88DTfGWh4oUPg4y+gRAcghZ/iyNh6AFaY12Mcd
 pqtirIe7L8e2x0tt+XAmdQ/2FMPMN3nnNAAwCbNnKh+TuI0QOP0xZ5JHo
 GHthtNs84k4IZoLG1OaqIsq4wgxp9Z1Cul41UOu+S1PT6BvLmIFGzK1pf
 SNn8/S4Boaeh7d0kjq32COETZxS+etK2JiYri0BHaCjJcoFG/7+YeCR4M
 bk6ll+XqGZAkuW6NPRI+daderkdOA7ZBDnEXhSSvnbSq0a61akFnzSWEo A==;
X-CSE-ConnectionGUID: LyCenUjCSPKHH/3NADH9Ig==
X-CSE-MsgGUID: XQn52HajSZyutx3n6/aGbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29514934"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="29514934"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:38:26 -0700
X-CSE-ConnectionGUID: UFEJhJckTQGZTgWCqfO9oA==
X-CSE-MsgGUID: uTHuzJfGSamRsfZrRxehYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="75061346"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 15:38:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 15:38:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5AwAc0HI2MK0vDEiedgLs16HAHQGgp2Ki3ylyw8gC8MXQUY1oe3bKROgjeUMH5Q9+j1NlYUajCl9BVGiq8RPR31PTnFgynhgRmjRqvTpk23oJUN/nxXLuWb8B8XsCp7eiraJiW6thUZKlfZ5gp2NkE5ZJVDmt83tR+Fx5q0xJZHSivsu/p6NvgmFWu1aHsJy9ZYRWr9sooyKGvupeLWiFekHZbR2Aw2r769u4GtnQ7SFUCB+uhhdaM8P1IW9loTBifUqhb5T5Si/iapP4R6s6q0tLkSHPfYKUCxqiBXTLXILLCFWNH/E4M3BDYt1J04dQdGjuKu0bDSvtY1k0U+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2LOO0TQoxaV4GEmA+bJHioFpYdwNbXXIMX6LjCnrJk=;
 b=fx2NgQOSjqGw7LN+3HVnUGrsMvmIYKHGeFslqYQd44esmIFmN53HX5nS2VfjFPmvUHtVbPkQUC526r+X+ouqR8wdjMV9OZBEFF1APGTMfXMfN0bXwgiLlH1xurKGufIO/IlaQSSBmhvE2sb3wnMoIBNd+iAz7qJtVSTwOMWBWLC1tmG4zFGno95lS76ezj9Fq3tw/IZLuLE6qLjRrJIRRIlqImaO+EhYB9YspqHK49tA0UvFq2mBEQ8C1ctYIeheY+6zVB30jDctEYVKkYLMS/a7ZDnnUEyxvuWeeH3e4gxvXycMkkEtzgxZKP9s/Rf2lkqxtHyEZQTlCOEJr/bowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26; Thu, 19 Sep
 2024 22:38:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 22:38:21 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 0/3] PCI: VF resizable BAR
Date: Fri, 20 Sep 2024 00:35:54 +0200
Message-ID: <20240919223557.1897608-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cac091d-dd62-45da-13bd-08dcd8fbc258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a212S1M4Nlp0MnhNQWliMnFYS2VhQ3hQRHg5RVplOWI2cExtRGc2UFdzSE5H?=
 =?utf-8?B?cm5vNHpGSy8xYVFnd0dBZ2xqcVBoU21ubmU1YlFkMVdXOGdSaU5teFMrU1Mr?=
 =?utf-8?B?WnhNVkxEWDM5RXVvNGpZenduN3BacVNlQTFIQXZsWmJzZW1jcm80WnFqOWor?=
 =?utf-8?B?b09hQjFlOWVpQmdDWENvckxvR1B6VklhMzB2YjBZYzBBMEw4R1B0V0NybDVp?=
 =?utf-8?B?U1BhWWJxNWtXV1JJTmdyR1ArRjFkR2I3eUR6SmFod2pwNW9selNZMkFzVjM4?=
 =?utf-8?B?alp4NGxmbkNNNzgrZGpLUk40ek1QS0pKSjRKb2FmZFROZS9hREwxYUdrdHBn?=
 =?utf-8?B?ZmZ0OGk0bjNSdkJSbXR4enRWUCtUZEdvMWxqdzd5UmlrTlUvV0F2eEJiT2Zz?=
 =?utf-8?B?RTV6RlBtREJITWFpdUFyb1EreHQwTUEvTHpYNisvY2VpYVprbytLdTRDRUw2?=
 =?utf-8?B?U3hVbHN0WEx6cVhPcCtDeEFqS0h6b0RzMWs5dkFwTEVFRzBOYW1yaDNTUEN4?=
 =?utf-8?B?T2M2NXhnVWlxWkE4WERUYzBVUWRFQ3JlbEtKZzdSd01UOG8zRFdPTU5BR3pG?=
 =?utf-8?B?T3VuODdDcmJsNFpkS0E4aE8rTTRCY3ZCU1JrYmZYODR1bG1FdUFMWFJ0Z214?=
 =?utf-8?B?MmFsb05vYlFLUzRPV2gzYmJUSkVnRldJQ0lLZWRJVS8ra3VWY3ZuSHhMUEZX?=
 =?utf-8?B?K2tjcFdZL2g0SVhMZ25rUDFRb2hCRVJlSGVkZ3pmeXJUYUlHcVpJeHZDL0RP?=
 =?utf-8?B?cUN2N0hVY2c1NXFDU1lsbEhhaFk3SU11Y3c1T2ozRWRBTVZGMjM2b3VLc0NK?=
 =?utf-8?B?WURiOXdOdTV3eDRxY2EyU0lheFdrTXRaMjd3V3hvU0FtbERidEExVjlwK2tC?=
 =?utf-8?B?NjUxaXRaNStlMXBMeGd4UVBMWnlITWVJZDZMNG9YUCtFRHc2NitsOE51d0Nh?=
 =?utf-8?B?VnhVZlZBTThIVmJHVXpHcnV4SStxNEN2U1pqRTJwTXE1NXRBc2d1R2p2TWRl?=
 =?utf-8?B?Rnh1a0c1R0RNb2k3S1JiaE9VREdxVkl2citvTkE0UWN2Zjh4L3pnbDlVVlRY?=
 =?utf-8?B?VlkyY3lGbHNyTW1TQXRzSkhNV2cyQ1JhSnc4UmF5UVRUNDdkR3NCalh3Y3kz?=
 =?utf-8?B?d2tDNWpjUlp2djd4RjhvbklIWjY4VzV0NjZTd0RpK1VGRkcwais2YmlKLzl6?=
 =?utf-8?B?WGpFL1BleXQzZ0YyenorRVdxVlFNU29MYzN0SHhxWE9ydkxUM2oyRTVXbDN6?=
 =?utf-8?B?RlpPQVU4YjZOWGIwOXNxdXBOd3M1WjU2TDAzckZxcUxSV0JJbG54Q2Q2WHQr?=
 =?utf-8?B?a0Zrb0l6R3pWOVppbCtlN2JkNWxJTmgzZldYQmY3OUYxSm84c0NQOVd2R0ds?=
 =?utf-8?B?Ukp6bjlJdXV0a0JFWklxZUhCTmd6cy9KZU52cnFhSGRvVjNBdjNhYndlSVVB?=
 =?utf-8?B?cldkdE13aExqV1ltOUd3N3pWWm5lRjB1a0krU2pQZ3U3RUVudGEvVG5zWHdB?=
 =?utf-8?B?TUt0Sm9UQVhndHlRdjM5TzBxdkVSc1JXRUtRRS9GUjNMQmtJa2hha2JBbXBa?=
 =?utf-8?B?OHZ1ZEhLblJaZW5LSThqbXkranVyeU1xdTJWSHdwbjVXTkNXbE5xY0tjNmx0?=
 =?utf-8?B?aDh3RG1HVXZvWFRDRG9xSGxEY09Mc1F2MGhoek0wU1Y0ZlJsVjJnbURlV0d5?=
 =?utf-8?B?WXNBRUdMQSt2NW1HMkY1OGVhUlZ2cm1wUklTQmJZWkh0YVpBamNZZWtvOEtC?=
 =?utf-8?B?VlVmNVVuU2J6UmFFMWlTKzhrVFRyVlJUM2c1MnUvenQvQnZzTmhFaXB1b08w?=
 =?utf-8?Q?zuYtkDWiWioaeJWSBI9ijxNbS/qNqHGoGNmbI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm4zQ0NuSXRyTDIvenFYamhrbUx3anE3dXROOHhrNXpGQ255S0F0UTNaR3BD?=
 =?utf-8?B?bldhNGtFUjdPK3lTbWp6WTBYT3NYWm02YjlnSXZBaTRoMXpZUUFVMnpZZjha?=
 =?utf-8?B?NHFDME0wMHBQYXhFa2pLNExORkVrZHg0Wk5GcjMrUnZhTEZ2Z0FTSkJZcG1D?=
 =?utf-8?B?SVpjWjlxY0EvKzNYdTJ1R2FENk8rTWVyVHlSWlhPN1pmR3BNblFKVUdHeWM3?=
 =?utf-8?B?Q1lKQUVIQ0xpbEVSZEdZV0xxZWk2KzJNVDJRQzA4ZEM3dy9aOHkyaGVzam9N?=
 =?utf-8?B?VTRUbjBMWWZMR0xjK3NPem1sc3RYMitXbHBkdjJoalRJUU9oeCtSOVl3M0dR?=
 =?utf-8?B?RmVCck1Ubm12OUNKSEJMN3dFV3ZxYmpvcmQ4VURDalYrVGtmcksveEw1NzRH?=
 =?utf-8?B?djB6VldDbDlTNnlXZzllaUltRkh4TTlzWDY1Kyt5eURkay9lbDRtZ0ZteVg5?=
 =?utf-8?B?eVloRDBqZGpub1U3WDhoUWE4L2o0THhhL0drNUYvbXFPVXVHTUNjNmxoRHVW?=
 =?utf-8?B?WHZjSzYrT0hLOUZ3MGNrcHZKYmQ3bElpSTRQb1JETjdRSE40MXE4Z0xla1pF?=
 =?utf-8?B?STBZQnhoL0I5RnRBQW15MitRNnJkeTkzZVUrSC9DVW5GNlUyNTJZYk1xZ29N?=
 =?utf-8?B?Vml6a3BNb0ZvSGVwU2lZWStYcjI1bURXUHorRVVsSFVUMThvT3prWWt0Unow?=
 =?utf-8?B?SUJmUmlCNk5rVy9MQUZRUHRYNVhXd1JVS2hnNU5XcXFYTnJQUnk4eURrcU83?=
 =?utf-8?B?aEE0OGRVdFFCb2s4amhJN1gvSjljVjl0aFdaMjlURXJMUEtDUGhIUTJ2V0Jn?=
 =?utf-8?B?Yjg0cTlnRG55K1RwY2VkS2NLSmJNM2lKMU4xUEJHaTc1WDd5U05aS0V5ekM5?=
 =?utf-8?B?a0kwWkVJU3h6WmFrUEhZTVB0MDRpc2xwcVR0YnppV05HTnFiRVdTNWhHN3pk?=
 =?utf-8?B?eXdOWHZiMHc4SExwWm4xay9KaDVieDBvd0F3NDhiRWFCMXQ1UmFjdUEvekVH?=
 =?utf-8?B?a01RREF4MnpXeTVpaFIzUkM1ejlVRGNzTS9hTWJ5bE0rZ0YwQUd2UFNlY2hM?=
 =?utf-8?B?WmhhTEFkOHVrSFN4MkxzNmp4Y2R6L2l2TW8vVU9SRWVMOGMyU2tIQ2YvVjVK?=
 =?utf-8?B?cnZ5WVZxREx2VEVkSG9kOTNXQVlVOEp1Y01pWTBRV1p5eVh1ZS9nUms4eURX?=
 =?utf-8?B?cWt0VDRrWkRqQWNUczgxRmlUOGRSaHpyL2duaWNOTFQvWWI1cW9QTzUxRTVO?=
 =?utf-8?B?YzNCMTYxN0dsV0ptRmtkbUVoVEdDNkNWK21UUy9hSWZZSUwxY3ZEbnl0SzF3?=
 =?utf-8?B?RjRuM3FCRTZKb2IxMXBmT3V0SGZmRnZCek5NSnZQdnpTVjJkeFYxNlVzOXlS?=
 =?utf-8?B?QnFzWHVYQmJqSDRMZlBqT3o0MlJsZThWUlJIeUtHR29lRnFsWHRxdENOUFBW?=
 =?utf-8?B?S0N4YkZ6a3M2ZUxrM0dDM0ZTNG9tZFJFVldjRmdtYllqeExpd2hiMG82TVVV?=
 =?utf-8?B?N3dhR0lsWVkrUjBLdVQ1Y1h0RVNVbEM5QXZpSkkwam1MQkdXWU5sM2p1dHEy?=
 =?utf-8?B?RmY1bUUzSSt2ajlaTEgwV0o0TUxhbUJySmczNDlKRC90VmRDSXNROXNEZ0JU?=
 =?utf-8?B?Q24yOXhNeGI5Y1JUb2QyUFhvSkVlNFlLbDhjVnJDVGxvM0lNQ2ZsbGlwRmo5?=
 =?utf-8?B?ZVh1MWJuTGtwekFjWTdwYlVuc0UrWjd6dnQ2TVlaSXFvQWVZV1gxKzVjejVF?=
 =?utf-8?B?ZFByei9RLzduSm5WTTJuazJIV01MM0VoRi9RWTlmMXVPQjFwdmpVMWNFOW5v?=
 =?utf-8?B?S1ZUd0dFRUI5R0Z5WlRaYk1VbmlOVy8wemYwQjVSQTlCVzB2c3ZsekJtcGNQ?=
 =?utf-8?B?NDc0bXMrT3dKa2ZtNkFpZkxJYnJuRjNYN0xyd0RUc2JxNGwvTWl4cjFhOC9o?=
 =?utf-8?B?ejlhT29uWWVvZzlpeENoNWhQNmJBMk1DUTlKOW1vTmVGblB6TWk5ZzM1UGxR?=
 =?utf-8?B?SmRPbitHSS96bCsxSFdKS2hnZk1mU1JJV3BOZEtzSkxlT2VJaEMyTlA1N3VJ?=
 =?utf-8?B?c0lUckhIcGYzR055QnZaOTl3dVFrV3dlYXl0VkFYUWMzWVBxM2VGTml3T2w3?=
 =?utf-8?B?M2wrZFB5ZjhzWHU4emxoSExQUFhrdG9XZmgvZmZHRTNwdVFUMVk5R001WjZq?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cac091d-dd62-45da-13bd-08dcd8fbc258
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 22:38:21.7715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oe27+F8xndMl8ECaPbJH2PeXQQSvcjevr4fKuNGgTw8ArBnbOgrb3Gx2XjLQUPcFl5H9/2yA/POPM/whdHpzQIwsmU3xhHqKq1F8/jIIm7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
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

Resurrecting an old series [1], now that we have an in-tree user for it.

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API to allow extending the VF BAR within the
original resource boundary.

Thanks,
-Michał

[1] https://lore.kernel.org/all/20211215141626.3090807-1-michal.winiarski@intel.com/

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

Michał Winiarski (3):
  PCI: Add support for VF Resizable Bar extended cap
  PCI: Allow extending VF BAR within original resource boundary
  drm/xe/pf: Extend the VF LMEM BAR

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c  |   8 ++
 drivers/pci/iov.c                 | 120 +++++++++++++++++++++++++++++-
 drivers/pci/pci.c                 |  40 +++++++++-
 drivers/pci/pci.h                 |  15 +++-
 drivers/pci/setup-res.c           |  44 +++++++++--
 include/linux/pci.h               |   3 +
 include/uapi/linux/pci_regs.h     |   1 +
 8 files changed, 223 insertions(+), 9 deletions(-)

-- 
2.46.0


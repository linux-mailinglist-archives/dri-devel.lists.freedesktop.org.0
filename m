Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA89BF913A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D7910E64C;
	Tue, 21 Oct 2025 22:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwMKG8dC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4780E10E650;
 Tue, 21 Oct 2025 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086553; x=1792622553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ncs/smUsaGDkTdIAfsfA0wjX93+VU6pKAYQISgt9TwU=;
 b=cwMKG8dCbsZEU/Ep5t3zRUzNU73jBXyZFIYQlK9yLJPyi53cF+HjYh1h
 Nj/WUtnxs8SL2xfpTLTVk3TzMsl1S7trrIk3Kg+QmDCB9uKFgLu7m693s
 J9JG/Jq6a0x1mqSqytlUP63ST5/16uzB5IWta18Im9ofW033WAm3mkqXv
 BGYt8p70BIvrvF5BNUs8j2q+FBwWYrn2SAacMhUC9R75Gdom7hiNYn6DT
 OkY6OFQy02M0Z3mI36myyIhJ+aY3pDryhvpz6vGqmwNV2Mkpi8h1Vz103
 QBi6K2UIB+v2AffPmW3XgYjCM57GOWMCBvtz6V3qzAiw+8cgOZIZHZS+1 g==;
X-CSE-ConnectionGUID: bP0QKlyVRA+moMClpxpYBQ==
X-CSE-MsgGUID: tc3osiGZQY+dxZMijpxd6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80662990"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="80662990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:32 -0700
X-CSE-ConnectionGUID: TORThV96RX2R/4FizdySiQ==
X-CSE-MsgGUID: peEbsIt+RY+XCkqaquaJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183738497"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktTNl+o+RsFEzBwyu9kghAjU7MCGyr6X19E4DlJ/uhrrb6UaBkZgdku/gyeIJjBnfONhOHpvX47QH90Fixpo7jf4jTOGf6uOUkFdKOnRc9Wcca+9SArHK7Ujjs/wQQE4A9RrjfsPfPvtjUNWs+yMNh1AwwnMomJW9/ZV8dtkJFF1hjkyVw2fIAEU75dDJrfkE9tquUgZ01q8rtoHTKDosaVOum+nmSMTSQN+HGupWsI/t73svRZR83q0OMfSVvqCV87vWVphhQOku4x76k8EYxgGE62LdXRfzRXfZTD+dAnbGsltOHDP0h1/84l4XbMkDpn3qPHbOmNXK7uy+X7zGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVqWm06bVIVBSkckawqvb9T/mjNXnw1B9tcYnpO2gYs=;
 b=jmo+rfXfb2guYFNMmFQ/yJh+PX29NWRO8BVcuu49c4KEPsEX2syLwQOwAAS/V9mStCyq6DFyOHVgTkuq44qo7fS8NeoLNq82SgQHAVxEkU/1RFwLIFlvtnYFDdunur3vGLPZs+An968caRJ3Mk9T4gZqlJ8sGszHvmInEypH1piyiespQm05tW2F8xD554qjDVmLRXEGvXqRV/0gNhpOidkN5+W2IDwWAkMGr1pklAU6YKEoT5lOPzj77hN+ojLnk5DQjntt/ivOmR5QqAa5eDfw2U3MGs9D0KtiVlTOErp89BAPCln7pDSsgHKKEYslzfojX3vJ54dsq9Oth1oQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:29 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 04/26] drm/xe/pf: Add data structures and handlers for
 migration rings
Date: Wed, 22 Oct 2025 00:41:11 +0200
Message-ID: <20251021224133.577765-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: e034d3fd-4b5b-473c-8861-08de10f31da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjVQYjJ3QXpDc0l1WDYyczdCS21Pb0RwUkpuU3Rja0tBWjVkL0ZKUnRqa01R?=
 =?utf-8?B?YzBDQVl0L1I4MjhrU0VFMnJGUk84NFlmb1hoUkpUQUVlenJvZVFXcjdySElj?=
 =?utf-8?B?ZDJFajZESHJYOU0yc21scHpPTTdVS242SjcxQktPMHdoS2JqajR0VGRKTklL?=
 =?utf-8?B?dEdmVG9QTjREY2Q4TXNGTDd6Qnk0b0tvTzFQa01XWGJmQ2RQay8xYmFFUHFv?=
 =?utf-8?B?Um5yMGxLbEZlc1c2cWo1ek9DaitRaU5yd1FGNjlDTUY0UU43c2F4SXAxeUhF?=
 =?utf-8?B?Qy9UcW5BbkF4QkhoNGZUSFpuSTB4VWJDWGVpQlFEOVZvdjVmZVVmNXpsYk1T?=
 =?utf-8?B?bnNKcnNDOXJWd3N2YnIrY0Vja2drSGpJTW5sdkJYcFBreWQrTjduc3dPT01Y?=
 =?utf-8?B?a0htdHAxazZDRUFTK1d1WXBMTlFXNHJPMGVNUWYrTVhrN3lIb0NkWFExOUFv?=
 =?utf-8?B?RVNLaG80cWJtdWRPVXkvaytWUndkeXE0NkwxeklEb2V3K2NNRnlVVUJ4VGsx?=
 =?utf-8?B?K1RoS1lrZlJNaTc1ZTFDNkI4MEpNSTJNcll0TElWRTNldTFqUzgvcmZlVmlr?=
 =?utf-8?B?YzZ4bmpHcklmVFpwOTRjS3VkZHdJSUd0NURFOFRBSEJ1MEgxWDZocHhzSXhz?=
 =?utf-8?B?eE9uQmdhY0NDVnRYK1RrWHlWVnYraUo5NVQ1dlJDaXFKVllOcEZqYTQzMk5i?=
 =?utf-8?B?TGgzVkhRaHRoWlNjNURWYy9sN3ZmYjdNbnFDMmlNc2pQN3pyUnFoVkpFcS9u?=
 =?utf-8?B?dzNZWXMxYk9iQTgrRjBpYVU1U2QyYW5ucmJZUHhMVFZFam5INnBJellrdmx0?=
 =?utf-8?B?ZTFSNkovdTJvLzRZN25FR1Z4QWpsRWZFQlNrTHpGaFozTkljQjFmeXdnR3Mw?=
 =?utf-8?B?cXkzUVEvQXVYak1Cdytnais3T05WQ0FCcFNWRmFRM21KRDVYY2tTWWdVK0dR?=
 =?utf-8?B?SFJZY1NGNE1jcXNQTTA0S1MreFV0UngrVUJXbStTM2hKeWhzczNobG5ObUxr?=
 =?utf-8?B?N1hjRkRXZ1VNOE9yakptbVlYNFFQOFVDK0ozQzhJSHhsRzQvRWFXNkNPb1pH?=
 =?utf-8?B?bEdhRWpPWkhMaHZqWncwd3BZVWp5QXFISVdtT1dVeUJtWXNRT2RpclQ2Vlp2?=
 =?utf-8?B?QUhIUFNRTkpqcGxOeXZTd3ZOc1VSbGlGbjZPVVordFJad2dmTmh6SnF2UFFK?=
 =?utf-8?B?OHJyc1J5Q0FiUU5aQ21FVWV6R2Z6VDlDQ1F5MytVY2Y2c0x0UjVJN01zc0hz?=
 =?utf-8?B?NTdtdS9UVmZ5eWxobU9NVmMxSUxKdEx0cDVzTlhDNjErVDFoaWZsYmJQK2E1?=
 =?utf-8?B?VFJHbTVWcUZFWFNuUVkwZHlRK2xTTE9nSFM3UVRKTnVTaXVleVNvUExJRGUy?=
 =?utf-8?B?VHB0VVdid28zRzlTU1Yxd1VwRzB4N1ZOSU5NYjMzdDN2TksrSytpY0dUZEF1?=
 =?utf-8?B?VFN0VFhUTFZqUTloYUw4VGhyWmhRUktucnFIVDMxcVJ2SHFxQTVId0NHdkls?=
 =?utf-8?B?UFhDR0QybTZXYllXc1A4UGFRK3JCTVUxY3RFUlRZb2dMdnQ4Wm9pMUNwTlFq?=
 =?utf-8?B?dHY4VklqM0h0dmttM3JkVXFZM2tvZFNST2YxVWpTQkQraHdiSEpiSXAwYW5C?=
 =?utf-8?B?NnZzTVBZeDErcDNqanQwNm5yaHF0aE9ROWt2T1Jrdno4emp1QkdOUjBzUVVp?=
 =?utf-8?B?NXp0c0VacjZ5VzNvclp2SnA4ajh4YVBrQkxoU1J0dDdJdnAyK3dDS0tjYTl3?=
 =?utf-8?B?R2pudFA1MWtKQytIWmVDcGM5TkJ2LzltbUl0cGtDNWRwWmVSUkdTYmE3OFZN?=
 =?utf-8?B?NWplZkhhSmFFR3hoTjduS1dsUFZsVXJRU29XczBmdUdIcC9obGZVWitBN2ZV?=
 =?utf-8?B?MW9vRmxLaHVXMXJLdktNdlhFWkFPV21ORWh1RmQ3MkE5Vk1EODRnWFoxVXlU?=
 =?utf-8?B?S3QybVozcjFPcGxYR1JUT3VrV0RPU2FIQkFXWGxES1oyS0VMbStnSm5HZXRz?=
 =?utf-8?Q?ngDs6/KPV6o9bJL2n9S1SIalmlYyN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dMRmVxMlJKV0FxQmxxVmRheS9Mem5sRDlrckxUcFNZazVadVhRNDVrSjVW?=
 =?utf-8?B?b0gxWkZZbVk4U25sVEhoSlNNZGpzQk5XajJDcnBndjEraDBDM0FicjZlZWta?=
 =?utf-8?B?ZzE2V0JXRHYrTjBRanVjcEJTckw3UWJ6UWtjMlZFbzQrRmFqaHBwVGhSdXQ0?=
 =?utf-8?B?UGptRWZWRGhEWnFROVJvWmNvdnpIMWhoam1CaTduanhJM1hVcENqQmZnQWh3?=
 =?utf-8?B?aENSVWtYdFpVVWgxbWc1bmFScHhyVUJEd2JyQUxML1RIYmwrbE9TSzJ2NFlU?=
 =?utf-8?B?bVdFaFpzZUNUUnc4T3h2OGpFajZpcEF0YmZ5WWJsTW9VSHlPVFRnMXhuVDVO?=
 =?utf-8?B?ek03RGV1QWNvOEhudHNiYzlHVVJmRUdwNkc4ZnNrckFrK3hMY21JRnFmOTVL?=
 =?utf-8?B?akdvVnNEZ2tubzA3Yzg2Nmt2QU85TG80Z09hdGVEelJpUzNGOGZTTFNNMTUw?=
 =?utf-8?B?NGwrVUNRWTNYaE9BdUx1WGJUSkhiMFczVWx5K2dQYXo2Q2tmdjVrdmRleGJ3?=
 =?utf-8?B?VWIzYWlNWk9ERFRiV2I4a2tPR25iN21BdVlyZDQyYUNkalZCRlJZTzV6R0dW?=
 =?utf-8?B?UUdYYkRpOWRtQ3JjandrdGdZOXFkckR4WUJEcEJSRlB1T1crTFJhZTNQWGpG?=
 =?utf-8?B?ZlBCZ1JoY0JKS2wydHdaMkNXMUFaMkNCRFFMR0lPRnVvY1NKNzVNOTdxNU41?=
 =?utf-8?B?bzMwK1dGM3V0WTRidUVZam1qVHdTakJyTmsvMzUvT3pkcnpJTXlibDJYVlJq?=
 =?utf-8?B?a0xPVUhxNWl1RlIrYWRmS2krTFd5c2MrQUpmNEY4UzJPamNlQjVuUVEvSW5l?=
 =?utf-8?B?VkhVaUFjVStud2ZUcVhaL25wR0ZzRGtRMWVYYjhWR3ZQc2ZjNDhMZHdGdllC?=
 =?utf-8?B?NmlMbDc1VUVsSTNXTlVlOWdjcGphQzU5VDJRcysyQitQb1dmOFdIVk9hMkpU?=
 =?utf-8?B?UTBSWVdsT1VYd3Rnb01qYTM1cjRHUDlWdEd5Qld5ekhnaEdpOTRCVTBTSGxz?=
 =?utf-8?B?a21DSklvQmh6R2NIcHZuSGw4Sld5bUUwM2lqVmRtdzZWT3lzNlBhdm84V3ll?=
 =?utf-8?B?eHpEd1U3UjZ2K0w0TGgxcHdEd21YblE1RE4rSzB3WXQxeWtaMHY2eEx1Skph?=
 =?utf-8?B?bTNQQzNEaWFaMmtnWGE5UG44U0kxdXQrcmIwOFVweWRMcy9qcWZvMXFhSzlV?=
 =?utf-8?B?K0ZyMHpPdVU4czI4eC9iZzNFS1R4NlVCYjc0cVhCZnVtOVkrZXpRRVRkUm5C?=
 =?utf-8?B?MU1vaEVUa2pMaWswL1cydmFpZ21naHZTZDJPSHEvS1Z2aXhhaVhwN3ZtWE9j?=
 =?utf-8?B?R0xKOFhUNGlaRlRGOG5CVDc0ZG51Yi9lY1QwT09MMHpBQ0hGK0pKUitNSW9K?=
 =?utf-8?B?SEk1QlNubU9jWGFRMjdRNldjUVVFWUc2a3kzR2cwZUx3RXFPbnhhT1o3S0Rz?=
 =?utf-8?B?UG5VYXNSaGQ0UCtEYXk0MVZDc2VkMURGUEVpOGVEQWx4QVhvRERnencxeE50?=
 =?utf-8?B?TmhCNmhxbW5QdWN5a3hVSnhMd2hXTzJCTDhNRno0TzFqV1JuRENTTFV3SkFy?=
 =?utf-8?B?Tzk1OE5EL0Q2alZCQkxsa013cittVU1xU2RsaFZJeTBMbU1pdDZpakJNR0ZJ?=
 =?utf-8?B?WXRtRXRqbllVbFJoTEtFKzN1RHB4TGRlQ1RxaGdSemVtUDNCa2hmdVNBMmxX?=
 =?utf-8?B?dnRITlBLR3BWOVdzeksvMTM0Zi9ldnYrQksvLzZ6TnNiOWZTekhZU1lqU0Jv?=
 =?utf-8?B?SWV5TjU0RGFIRUxJc3huWnMyQU1TcDZ2TGZ2SnVyaCtPSFJiNUNSUzJoakJz?=
 =?utf-8?B?Z2ZOYjZwWTgxVkVhdzJHU0xLVjVCMW5lWXJmUXBsaTFHRFBHanhQVTFmTGZn?=
 =?utf-8?B?bmMycDFCZDc2SG1MaXFlOTE2NmxPYkZaOVdUMk1PN3JiREc0Q0dWSWk2NlZr?=
 =?utf-8?B?Rll5aVFzUkZBNE5mSzRkOVVkMkZ2YnByb0tYck5WUTVpVWloaVZNUEZmQ3JX?=
 =?utf-8?B?cjRnOG5RNlc3OWo2bjVqbmpVeCs3TkdnSFRCekptWnMxa3JDTktRUnhFMlpB?=
 =?utf-8?B?TU00MlNyRVFVS2s5NDloSEQwL1hrSHlLYlR6ZFFyZ2RQVWVzNHhyMDRQRHZS?=
 =?utf-8?B?eXJoV2tHYW04VEJnUW9mYklUcHhNL2ZhWnpMVkZJZDdXd0hQbnBGUWp0WVZ1?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e034d3fd-4b5b-473c-8861-08de10f31da3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:29.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ddw2PGrVJRuOYA43ptos0bwEY27IIrdupk/bmNhGuQ5ZJ7YaNqShI1XbUEGu9/VLoBr9Ecwc5yBEAD3FUPbi9GR/C4KGD8IpO2yNS4ChwSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

Migration data is queued in a per-GT ptr_ring to decouple the worker
responsible for handling the data transfer from the .read() and .write()
syscalls.
Add the data structures and handlers that will be used in future
commits.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 259 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +-
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 183 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 143 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  58 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
 11 files changed, 684 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index b770916e88e53..cad73fdaee93c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -19,6 +19,7 @@
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_tile.h"
 
@@ -185,9 +186,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_PROCESS_DATA);
+	CASE2STR(SAVE_WAIT_DATA);
+	CASE2STR(SAVE_DATA_DONE);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
 	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_PROCESS_DATA);
+	CASE2STR(RESTORE_WAIT_DATA);
+	CASE2STR(RESTORE_DATA_DONE);
 	CASE2STR(RESTORE_FAILED);
 	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
@@ -804,9 +811,50 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+/**
+ * DOC: The VF SAVE state machine
+ *
+ * SAVE extends the PAUSED state.
+ *
+ * The VF SAVE state machine looks like::
+ *
+ * ....PAUSED....................................................
+ * :                                                            :
+ * :     (O)<---------o                                         :
+ * :      |            \                                        :
+ * :    save          (SAVED)    (SAVE_FAILED)                  :
+ * :      |               ^           ^                         :
+ * :      |               |           |                         :
+ * :  ....V...............o...........o......SAVE_WIP.........  :
+ * :  :   |               |           |                      :  :
+ * :  :   |             empty         |                      :  :
+ * :  :   |               |           |                      :  :
+ * :  :   |               |           |                      :  :
+ * :  :   |           DATA_DONE       |                      :  :
+ * :  :   |               ^           |                      :  :
+ * :  :   |               |        error                     :  :
+ * :  :   |            no_data       /                       :  :
+ * :  :   |              /          /                        :  :
+ * :  :   |             /          /                         :  :
+ * :  :   |            /          /                          :  :
+ * :  :   o---------->PROCESS_DATA<----consume               :  :
+ * :  :                \                      \              :  :
+ * :  :                 \                      \             :  :
+ * :  :                  \                      \            :  :
+ * :  :                   ring_full----->WAIT_DATA           :  :
+ * :  :                                                      :  :
+ * :  :......................................................:  :
+ * :............................................................:
+ *
+ * For the full state machine view, see `The VF state machine`_.
+ */
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
-	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+	}
 }
 
 static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
@@ -821,12 +869,39 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
 	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 }
 
+static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
+{
+	return 0;
+}
+
 static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+	int ret;
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
 		return false;
 
-	pf_enter_vf_saved(gt, vfid);
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+
+		return true;
+	}
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+
+	ret = pf_handle_vf_save_data(gt, vfid);
+	if (ret == -EAGAIN)
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+	else if (ret)
+		pf_enter_vf_save_failed(gt, vfid);
+	else
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
 
 	return true;
 }
@@ -834,6 +909,7 @@ static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_enter_vf_wip(gt, vfid);
 		pf_queue_vf(gt, vfid);
 		return true;
@@ -842,6 +918,36 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 	return false;
 }
 
+/**
+ * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+}
+
+/**
+ * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ */
+void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
+		return;
+
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
+		pf_queue_vf(gt, vfid);
+}
+
 /**
  * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
  * @gt: the &xe_gt
@@ -887,19 +993,62 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
  */
 int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
-		pf_enter_vf_mismatch(gt, vfid);
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
+		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
 		return -EIO;
 	}
 
 	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+	pf_enter_vf_saved(gt, vfid);
 
 	return 0;
 }
 
+/**
+ * DOC: The VF RESTORE state machine
+ *
+ * RESTORE extends the PAUSED state.
+ *
+ * The VF RESTORE state machine looks like::
+ *
+ *  ....PAUSED....................................................
+ *  :                                                            :
+ *  :     (O)<---------o                                         :
+ *  :      |            \                                        :
+ *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
+ *  :      |               ^           ^                         :
+ *  :      |               |           |                         :
+ *  :  ....V...............o...........o......RESTORE_WIP......  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |             empty         |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |           DATA_DONE       |                      :  :
+ *  :  :   |               ^           |                      :  :
+ *  :  :   |               |        error                     :  :
+ *  :  :   |           trailer        /                       :  :
+ *  :  :   |              /          /                        :  :
+ *  :  :   |             /          /                         :  :
+ *  :  :   |            /          /                          :  :
+ *  :  :   o---------->PROCESS_DATA<----produce               :  :
+ *  :  :                \                      \              :  :
+ *  :  :                 \                      \             :  :
+ *  :  :                  \                      \            :  :
+ *  :  :                   ring_empty---->WAIT_DATA           :  :
+ *  :  :                                                      :  :
+ *  :  :......................................................:  :
+ *  :............................................................:
+ *
+ * For the full state machine view, see `The VF state machine`_.
+ */
 static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
-	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
+	}
 }
 
 static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
@@ -914,12 +1063,50 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
 	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 }
 
+static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static int
+pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+
+	xe_gt_assert(gt, data);
+
+	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+
+	return 0;
+}
+
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+	int ret;
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
 		return false;
 
-	pf_enter_vf_restored(gt, vfid);
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
+		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
+			pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+			pf_enter_vf_restored(gt, vfid);
+
+			return true;
+		}
+
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
+		return true;
+	}
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+
+	ret = pf_handle_vf_restore_data(gt, vfid);
+	if (ret)
+		pf_enter_vf_restore_failed(gt, vfid);
+	else
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 
 	return true;
 }
@@ -927,6 +1114,7 @@ static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_enter_vf_wip(gt, vfid);
 		pf_queue_vf(gt, vfid);
 		return true;
@@ -935,6 +1123,41 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 	return false;
 }
 
+/**
+ * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
+		pf_enter_vf_state_machine_bug(gt, vfid);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ */
+void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
+		pf_queue_vf(gt, vfid);
+}
+
 /**
  * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
  * @gt: the &xe_gt
@@ -1000,11 +1223,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
 {
 	int ret;
 
-	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
-		ret = pf_wait_vf_restore_done(gt, vfid);
-		if (ret)
-			return ret;
-	}
+	ret = pf_wait_vf_restore_done(gt, vfid);
+	if (ret)
+		return ret;
 
 	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
 		pf_enter_vf_mismatch(gt, vfid);
@@ -1703,9 +1924,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
+		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
+					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
+		return false;
+	}
+
 	if (pf_handle_vf_save(gt, vfid))
 		return true;
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
+		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
+					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
+		return false;
+	}
+
 	if (pf_handle_vf_restore(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index abc233f6302ed..6b1ab339e3b73 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -14,12 +14,14 @@ struct xe_gt;
 int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
-bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
-
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index e113dc98b33ce..6e19a8ea88f0b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -32,9 +32,15 @@
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
+ * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
+ * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
  * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
  * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
  * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
+ * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
+ * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
  * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
  * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
@@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSED,
 
 	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
+	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
+	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
 
 	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
+	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
+	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
 	XE_GT_SRIOV_STATE_RESTORE_FAILED,
 	XE_GT_SRIOV_STATE_RESTORED,
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index ca28f45aaf481..b6ffd982d6007 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,7 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
@@ -15,6 +16,17 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf_migration.h"
 
+#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
+
+static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return &gt->sriov.pf.vfs[vfid].migration;
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -382,6 +394,162 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Return: true if the ring is empty, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
+{
+	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Return: true if the ring is full, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
+{
+	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @data: &xe_sriov_migration_data packet
+ *
+ * Called by the save migration data producer (PF SR-IOV Control worker) when
+ * processing migration data.
+ * Wakes up the save migration data consumer (userspace), that is potentially
+ * waiting for data when the ring is empty.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data)
+{
+	int ret;
+
+	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
+	if (ret)
+		return ret;
+
+	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Called by the restore migration data consumer (PF SR-IOV Control worker) when
+ * processing migration data.
+ * Wakes up the restore migration data producer (userspace), that is
+ * potentially waiting to add more data when the ring is full.
+ *
+ * Return: Pointer to &struct xe_sriov_migration_data on success,
+ *	   NULL if ring is empty.
+ */
+struct xe_sriov_migration_data *
+xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+	struct xe_sriov_migration_data *data;
+
+	data = ptr_ring_consume(&migration->ring);
+	if (data)
+		wake_up_all(wq);
+
+	return data;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @data: &xe_sriov_migration_data packet
+ *
+ * Called by the restore migration data producer (userspace) when processing
+ * migration data.
+ * If the ring is full, waits until there is space.
+ * Queues the restore migration data consumer (PF SR-IOV Control worker), that
+ * is potentially waiting for data when the ring is empty.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
+					     struct xe_sriov_migration_data *data)
+{
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	int ret;
+
+	xe_gt_assert(gt, data->tile == gt->tile->id);
+	xe_gt_assert(gt, data->gt == gt->info.id);
+
+	while (1) {
+		ret = ptr_ring_produce(&migration->ring, data);
+		if (!ret)
+			break;
+
+		ret = wait_event_interruptible(*wq, !ptr_ring_full(&migration->ring));
+		if (ret)
+			return ret;
+	}
+
+	xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Called by the save migration data consumer (userspace) when
+ * processing migration data.
+ * Queues the save migration data producer (PF SR-IOV Control worker), that is
+ * potentially waiting to add more data when the ring is full.
+ *
+ * Return: Pointer to &struct xe_sriov_migration_data on success,
+ *	   NULL if ring is empty and there's no more data available,
+ *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
+ */
+struct xe_sriov_migration_data *
+xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct xe_sriov_migration_data *data;
+
+	data = ptr_ring_consume(&migration->ring);
+	if (data) {
+		xe_gt_sriov_pf_control_process_save_data(gt, vfid);
+		return data;
+	}
+
+	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
+		return NULL;
+
+	return ERR_PTR(-EAGAIN);
+}
+
+static void action_ring_cleanup(struct drm_device *dev, void *arg)
+{
+	struct ptr_ring *r = arg;
+
+	ptr_ring_cleanup(r, NULL);
+}
+
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -393,6 +561,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int n, totalvfs;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
@@ -404,5 +573,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 1; n <= totalvfs; n++) {
+		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
+
+		err = ptr_ring_init(&migration->ring,
+				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
+		if (err)
+			return err;
+
+		err = drmm_add_action_or_reset(&xe->drm, action_ring_cleanup, &migration->ring);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 09faeae00ddbb..9e67f18ded205 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -9,11 +9,25 @@
 #include <linux/types.h>
 
 struct xe_gt;
+struct xe_sriov_migration_data;
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
+
+int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data);
+struct xe_sriov_migration_data *
+xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
+
+int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
+					     struct xe_sriov_migration_data *data);
+struct xe_sriov_migration_data *
+xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
+
 #ifdef CONFIG_DEBUG_FS
 ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
 						char __user *buf, size_t count, loff_t *pos);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9d672feac5f04..84be6fac16c8b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/mutex.h>
+#include <linux/ptr_ring.h>
 #include <linux/types.h>
 
 /**
@@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
 	} guc;
 };
 
+/**
+ * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
+ *
+ * Used by the PF driver to maintain per-VF migration data.
+ */
+struct xe_gt_sriov_migration_data {
+	/** @ring: queue containing VF save / restore migration data */
+	struct ptr_ring ring;
+};
+
 /**
  * struct xe_gt_sriov_pf_migration - GT-level data.
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index a64a6835ad656..812e74d3f8f80 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
 
 	/** @snapshot: snapshot of the VF state data */
 	struct xe_gt_sriov_state_snapshot snapshot;
+
+	/** @migration: per-VF migration data. */
+	struct xe_gt_sriov_migration_data migration;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 8c523c392f98b..eaf581317bdef 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -3,8 +3,36 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration;
+}
+
+/**
+ * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: pointer to the migration waitqueue.
+ */
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
+{
+	return &pf_pick_migration(xe, vfid)->wq;
+}
 
 /**
  * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
@@ -33,9 +61,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
  */
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
+	unsigned int n, totalvfs;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+	if (!xe_sriov_pf_migration_supported(xe))
+		return 0;
+
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 1; n <= totalvfs; n++) {
+		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
+
+		init_waitqueue_head(&migration->wq);
+	}
 
 	return 0;
 }
+
+static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid) ||
+		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
+			return true;
+	}
+
+	return false;
+}
+
+static struct xe_sriov_migration_data *
+pf_migration_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data *data;
+	struct xe_gt *gt;
+	u8 gt_id;
+	bool more_data = false;
+
+	for_each_gt(gt, xe, gt_id) {
+		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
+		if (data && PTR_ERR(data) != EAGAIN)
+			return data;
+		if (PTR_ERR(data) == -EAGAIN)
+			more_data = true;
+	}
+
+	if (!more_data)
+		return NULL;
+
+	return ERR_PTR(-EAGAIN);
+}
+
+/**
+ * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Called by the save migration data consumer (userspace) when
+ * processing migration data.
+ * If there is no migration data to process, wait until more data is available.
+ *
+ * Return: Pointer to &xe_sriov_migration_data on success,
+ *	   NULL if ring is empty and no more migration data is expected,
+ *	   ERR_PTR value in case of error.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+struct xe_sriov_migration_data *
+xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
+	struct xe_sriov_migration_data *data;
+	int ret;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	while (1) {
+		data = pf_migration_consume(xe, vfid);
+		if (PTR_ERR(data) != -EAGAIN)
+			goto out;
+
+		ret = wait_event_interruptible(migration->wq,
+					       pf_migration_data_ready(xe, vfid));
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+out:
+	return data;
+}
+
+/**
+ * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @data: Pointer to &xe_sriov_migration_data
+ *
+ * Called by the restore migration data producer (userspace) when processing
+ * migration data.
+ * If the underlying data structure is full, wait until there is space.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
+					  struct xe_sriov_migration_data *data)
+{
+	struct xe_gt *gt;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	gt = xe_device_get_gt(xe, data->gt);
+	if (!gt || data->tile != gt->tile->id) {
+		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
+					 vfid, data->tile, data->gt);
+		return -EINVAL;
+	}
+
+	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index d2b4a24165438..df81a540c246a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -7,10 +7,17 @@
 #define _XE_SRIOV_PF_MIGRATION_H_
 
 #include <linux/types.h>
+#include <linux/wait.h>
 
 struct xe_device;
+struct xe_sriov_migration_data;
 
 int xe_sriov_pf_migration_init(struct xe_device *xe);
 bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
+					  struct xe_sriov_migration_data *data);
+struct xe_sriov_migration_data *
+xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index e69de29bb2d1d..2a45ee4e3ece8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
+#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
+
+#include <linux/types.h>
+#include <linux/wait.h>
+
+/**
+ * struct xe_sriov_migration_data - Xe SR-IOV VF migration data packet
+ */
+struct xe_sriov_migration_data {
+	/** @xe: Xe device */
+	struct xe_device *xe;
+	/** @vaddr: CPU pointer to payload data */
+	void *vaddr;
+	/** @remaining: payload data remaining */
+	size_t remaining;
+	/** @hdr_remaining: header data remaining */
+	size_t hdr_remaining;
+	union {
+		/** @bo: Buffer object with migration data */
+		struct xe_bo *bo;
+		/** @buff: Buffer with migration data */
+		void *buff;
+	};
+	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
+		/** @hdr.version: migration data protocol version */
+		u8 version;
+		/** @hdr.type: migration data type */
+		u8 type;
+		/** @hdr.tile: migration data tile id */
+		u8 tile;
+		/** @hdr.gt: migration data gt id */
+		u8 gt;
+		/** @hdr.flags: migration data flags */
+		u32 flags;
+		/** @hdr.offset: offset into the resource;
+		 * used when multiple packets of given type are used for migration
+		 */
+		u64 offset;
+		/** @hdr.size: migration data size  */
+		u64 size;
+	);
+};
+
+/**
+ * struct xe_sriov_pf_migration - Per VF device-level migration related data
+ */
+struct xe_sriov_pf_migration {
+	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
+	wait_queue_head_t wq;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 24d22afeececa..c92baaa1694ca 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_sriov_pf_migration_types.h"
 #include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
@@ -18,6 +19,8 @@
 struct xe_sriov_metadata {
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_sriov_pf_service_version version;
+	/** @migration: migration data */
+	struct xe_sriov_pf_migration migration;
 };
 
 /**
-- 
2.50.1


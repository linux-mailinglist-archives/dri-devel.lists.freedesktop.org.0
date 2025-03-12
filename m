Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB5CA5E7E6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EDC10E7DA;
	Wed, 12 Mar 2025 23:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRLmUANv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDCB10E7D9;
 Wed, 12 Mar 2025 23:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741820474; x=1773356474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BisXOnZ5cEvZI+ssx95p+8hjk5ouP7x3ssYTV+BBEos=;
 b=FRLmUANvArsCv8tsC/SfVkHVqe8Pgla8DMBJLiYTdRHvQhz7/ZbaCpZp
 fjDFKdotIwwI7ue7YqJT0NpcwByD6pAgSKhv/TdenZvwvnJnk05kxr2Is
 Iu8FNKpyRNbZdMJQMuJgHodEEjGIG6fKH5A4WPDvnpmHIIG0CkTGQaHLz
 969cy28nXS/7p3fPJGt7yYyDnON0CFChm58AKlyM+WRoMKwnYolw/Kx/K
 qcybsvV6M29GyZlUKZm6cpVCKsskx4tgtXqdAJxZtriLINme0sc8lURZQ
 DoapToJQ2NAEYbSYNuVLA7BZD1/oQ9tkzICsru+aO5rJsTLo2zBPQKWTN g==;
X-CSE-ConnectionGUID: jv8Mf0dvS0SfHY1gQsSmVg==
X-CSE-MsgGUID: mw3pE1s3R3yQob21qWyTiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42088710"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42088710"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:01:13 -0700
X-CSE-ConnectionGUID: 5Wr/6eFKTWuBVLOipHRLDw==
X-CSE-MsgGUID: Ubc7HvXHSBOOmvKfazc20Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="121006911"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:01:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 16:01:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 16:01:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 16:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYHVXrABm3fEWjKMWhwTCnI1Mb1rQlcZpaxSK/Mj97O9pF74EZLJ3niG1+awlay3n8EqPsvfaVGKrrPwKfLIipzeC3ktalzAmRCrIpp7hlTOgliM5tZ5Ntua4WBojha8mq1WY3XvDuPY4HgGgc6w1zmFLeaQfkW08dWrCp3c4roQ02vFBev0TqzIioe1qvYtALaGUHxy94Zcy0eIdIU7T6GooK4LvbLiqdsvrMcOVaPBPDbZnBXCwy+GLLNlze6GT/jqtYUSIJTh3+GwMFPRGn8NQQwuq6ltHvEuxtA9uqzYYhan+/Ok+I+ScaqBoOA3jjaBHFb9Ch+wG1YVmRC60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0OxEcu+K2ART199oOw5i/HpMIa5ejIljMcmNngQLbA=;
 b=ELM101RQe2DYokK9J530ZKuciAy8YynworeRV1skQAe88D9q9RgfaAc+lTJY8shky0xRJHbtDv+xNJzqGfK3JsJ/mU4te25urMuk8BJvCDpNWWxNXCXzUj5i7T0AQ3u4/AawjP4bPu+MfmtQAMZVMejRgRA1t1oUgsHQM3Nvs/HX+mZ15iyxB8n+sWqZccli5CwtE+XFww8OImF/SqsOP+6L3iKNlf662d5D1NWmJ4gOJ7HiGUUxWRNnq1bA7yM1BzUzxwO0xyKQ3Ol/6U6JZhHSsK3XvLJE8xYbEUkOLTW3BRjsCbG0C49ZIOhOUoo+DZ7HP8ICtTzjfnKUXojUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Wed, 12 Mar 2025 23:00:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 23:00:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v5 6/6] drm/xe/pf: Set VF LMEM BAR size
Date: Wed, 12 Mar 2025 23:59:49 +0100
Message-ID: <20250312225949.969716-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312225949.969716-1-michal.winiarski@intel.com>
References: <20250312225949.969716-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 50750f3f-792b-40d9-f8bb-08dd61b9bfca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXl0MWNzUWxhaDN0Vko3KzZyTUc0MlVSc25XbnBITzRDZUgzbjRMUmFlMmRG?=
 =?utf-8?B?TkFCMDZmVjdIWkhETmRVd3NXSHNkeXlta1lQZmNqVWJLb25hZ1Z6WWxycCtK?=
 =?utf-8?B?WnUza3JlTzJRL0dBQVFIUWQ1L3VpWDhFVEhvZTZSV0drbDNLUStwYldLSVdt?=
 =?utf-8?B?TGhRUk0xUGc1bzNxeFUyVURNejh4YmZQUjFxNjF4NEwwanMxeHJ0WFhwUVRX?=
 =?utf-8?B?VVEyR3lmc3M4L0ZzMnFGSm05enZEMGNLVmVyQ25yMFNKUjJTTkZjaGJBRmtp?=
 =?utf-8?B?OUR6Uy82TDNhZWpPdHlQTnA3RWk1RytZY096UjdCS0FoWlFHdWxIKytvUm5L?=
 =?utf-8?B?bktuQ0w5NldPWDByczNxd3hQblRMMmMybE1EcWt6N3JmVGNnNjMwMDgvbUdQ?=
 =?utf-8?B?NGpwbHB2MkxwT2d1eVRZTlh3MDFRVlhIYWRCMHhlc2IzdUtqU3NOemttaG5x?=
 =?utf-8?B?aWZVV2pJMk9Fdk1heTNiREtxOE9qK3VRVFM4R1NVZnJtdER1Um1QUlE2VTJB?=
 =?utf-8?B?a0paOFpaVlRpbnhZZVlGOU9jR3Q2SWZjZ0kxSlJMeFprSmxPdnJRMHRTSHQ3?=
 =?utf-8?B?RE5RNzdxVEdaMlRzd25JSkwrQkNKZC83WENBeE9JU3piL2FEeVN4UE12YlJV?=
 =?utf-8?B?RVdWR1VvWm5jd1FWSGFudXBXZ1BDWlZRYytVRDFtR2xNT0ttQVhxOU5hNU5o?=
 =?utf-8?B?TG9QTkRtc1pxYVNWWXd2T2IrK1AzQ2ZuVllRSEJWTXgzMi9nLytaMEY1a0Nq?=
 =?utf-8?B?N1hFWkdObXBzeWN1bHVDaVRtSXlORnA5TDhrbUt3WEFiWEFzT3dNdnlIV0dL?=
 =?utf-8?B?MisvYkR4cEgzdkFWcnJNZ1hIR2kzVW1OdjVidU1qZkZXemJLUmp3Mzd3VS92?=
 =?utf-8?B?R0pOa1pVb2xxcWpXOEJWZXNMZmY4L1BDeW5qS1hBWDV0dkFlbDlQTk43aVQ0?=
 =?utf-8?B?aTZ4SXZybXRzMytPSXFvNXlEb29Yb1JqTjRCaytoOVVFT04xQzRvT2ZGYzc0?=
 =?utf-8?B?Y1ZNZDV2UDBtZ3FNaC9iRkR1M2djc0R5VE1CMGtjNERTWkN1WG40ZkJsNmRI?=
 =?utf-8?B?V3kxdEduck1BbjZEOVdzV1RacDRBd2JZTk1tUWZtbkFHczhCcHFkVndwOGJI?=
 =?utf-8?B?TkwrNEltNjFVampUZzhaaUFFc0Jpdk5WM3NMSkRCbXRlZ3VDY29CeFluR21H?=
 =?utf-8?B?SngyOVRCamgyZ2dFMC9Gdy80OWR6cGQxb0crcGF6YnJmc0EzQ3I4azh4Z0g0?=
 =?utf-8?B?SGZLNzF5dUZuRjJEc2RNK1h1Y3RsVE9wYXIyRFNYcnppdFBHOGhhZjd3bk9F?=
 =?utf-8?B?WGhDTHdTMzhoWkVYT2VZS3BTS044b2lXeFNIOUtoaithR1Q5a3JyYUpqRlZE?=
 =?utf-8?B?cHA3dG5mc3Y0V3lSTFJKbXovclByR1RCMmlNaThoa3E2ZVdqR05pUndLWmht?=
 =?utf-8?B?ZUxMMW5WNTVtcXl3Z0M1cGk4S2VDdGVPYkk5MHdqMjJzbkZ6VXczV0NPb0lC?=
 =?utf-8?B?Y2lVSUI3TlQ3S1QrWWNXOWNBNlNzMGJ1OSt1QjFEandZRExpakNrMkQ0ckZu?=
 =?utf-8?B?MXNkcTB1bUNQbGpwR1owUEt3cWFJMEpwelZFTWtOb2tOVFN2UmN2VkhmcWRW?=
 =?utf-8?B?dm83cmg1ck9oOXFZYXB0R0szWEQ4OUZlcitYTGZFSXcvMjlBZTV5czRQRWR6?=
 =?utf-8?B?YjN3VVFsc05ReUF0RWUvdS9ld3NIditlRGoyTCtBZmZSNEJVKzBKUS9wK01F?=
 =?utf-8?B?aml2U0xFcmhsY1E3RHhnL3ZyS09lbFhHYzRBeFU4VWo0QkJIL2NLNXJ4cm5S?=
 =?utf-8?B?YmQ4aXdZM296VEdmUXYvTk9NcE0xV1YyNExOL0pvOSt0MTdGck5QbmVJUUsz?=
 =?utf-8?Q?Mn0hgwXpEDKXx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHFMT1djeWg2OGlpc21ZK2ZoQVlobjQ1UnE0TEY5QmtLc0JVMWt2bmRIck4y?=
 =?utf-8?B?c1VOS21EaTN1S293UVdwV1gzVk0zQzZVRVZGVEIweWRIcjVBVVBrV3NZSXVv?=
 =?utf-8?B?QmdGWFNsRzhXdjFNTE8yWkdhWlBTMGtORWRYTXVmNTR2blJXcEZNYWxxQmhQ?=
 =?utf-8?B?TXk4Z0c0cHZkNFg3NDVFZS9GSENWVjhtK2NoVkdJN3MyMGRWMk14eEtYOEp2?=
 =?utf-8?B?WVFIR1BKbkU4bE1wYkNUSEs0Vkt2ZEV5OGh6SVBLYXJlTkhENi9RZlRYVFRX?=
 =?utf-8?B?b1gydGwwS3VkQTZwVUtPdnY1ZUVRSVlFTkFNTEpTZjFTd2ladVVoNEExUkJ2?=
 =?utf-8?B?Rk9QempUQlc0VE8vOHM3bjNqQWZrWm9LUDl2UFVXUis4NjN1dXQ5ZTI3MG1M?=
 =?utf-8?B?d0gyQkYvNU1td1hJejdNd1pwWXJmcndlS2YvWjlySisxaTJTNlJscUlSRFRL?=
 =?utf-8?B?UjlnV0dGUVRBT0F4RHhTZVJwdHBxMEY2ck5pTTJaVzF4SitMVGNOOFZIVEZQ?=
 =?utf-8?B?cjB0WmduS09IcGcvci8zVURMTE4yOS9TYjlXUlNMcnhVdDlCTWhUYnQwS3cr?=
 =?utf-8?B?TlFNNVN0b1c3OVp0eGZ2YnpOTkRPdjkxcGkzdlE3d2ZVZDVSM2FFRitnWHR5?=
 =?utf-8?B?UThjeHZzYStxcjZPT3liQmtGRGtWV1VvbXAvZllkSVI2UnlvT242eWxaWlBR?=
 =?utf-8?B?QURpTDgwNWQ3M3ZISEVwbUFoN0syWWF1L1RRNCs0SDJEc3BHM1FmekdNbThl?=
 =?utf-8?B?Q3RYRjRVK3VFV29vMWloanllMHJXb05CTThHOW9mNDk2VU0vUWRwVk1oNGVx?=
 =?utf-8?B?QXdHU0I3R2xqYjByN0RLU2VNMVBZNVhjb0tEVktZVFRFTlhDVEVsdUYvV3lx?=
 =?utf-8?B?MUxQQkhOTVNBMGVpdHhya3Q3SGxScE80TXg0cG12TVJjaUpEOEZTT1RmUkgz?=
 =?utf-8?B?dE1pTlVRYVJ5SVRNaTNWK2o1MGpGbVJCU2RLRmplbndxNGNTMHlPVStiaXBu?=
 =?utf-8?B?WWx1V3FNa3JnS3UzOXdYSUZIYXRjNnZrQ2RsU0xDcTNtbWxzY3dVQU1uSzF0?=
 =?utf-8?B?U3JIL3c3b3UvWkFSVVlSbWpxczZ3NlpiejNmMXpYcDV4bDVxQkkyVEZrUG1x?=
 =?utf-8?B?eUlBYUY3Zlo0dVdPek9Rb2NoYmxHa0pldFhvQkNLMW9vcDhMVzVNK1I2MkJZ?=
 =?utf-8?B?T2pCNFVRZTVDM3o1ZGdUejNTNzQyRzdTbGlvNGZicmpiZFVWSzdXVjcxVWRL?=
 =?utf-8?B?V0ZhVlU2Z1Q1RUlyYWM2ZjJnRnYvWmlsODQyTWpkOThrbTBGVE94dHVGaWVh?=
 =?utf-8?B?WDQ0Z2hxMDVZckVDbWVxSmRxZUZFa2liWTduaWdxa0N3RytRYldlajlHL0tQ?=
 =?utf-8?B?YVRxUzhGbmg4aVpnM2xYYk1XeW5sZm9Ud2ZreXdxbTg3WVBZdS95Vm5XR3NB?=
 =?utf-8?B?ZkFrUzNaYWpHRjY1dUdxVTUyVmtFQk5MLzN1ZUZQQ3liaTMxNHpVcENNbWlq?=
 =?utf-8?B?QXpoWVBJSjhCck83TVd1amtnMS93aGNnZDVobjFRVEhqWlk3Y050cXF2cGFI?=
 =?utf-8?B?TG1IY2pnbmJIa3BDWmwvdVo2KzEySzZTd1JMM0FrUXcyRGkrNy8vUFBlZTJW?=
 =?utf-8?B?dkFabWtZcnhYUlFRVEFmZkRtQ0g4dlpkaFdMU3BVUmZleHBmbitTWDk3czgw?=
 =?utf-8?B?UXVYZW5tditPOWdXcHZ3RnpUaVpVZ2dtUXA3dTV1ZURZQTR2S1dNaTZPZXlw?=
 =?utf-8?B?TUdOSXNSYjUydmZHUE1LQkFwU2FWZmJjNGh6cy9iQkdhVHY1MWxTQ1d5MmQw?=
 =?utf-8?B?M05iY29SSDY0ZUYrUXBJN295Y0xIM1NDVFlXQ0ZnSVUwM0N6MlJXT1VRTkZi?=
 =?utf-8?B?UFAxKys0NThNeEo4bWxlWWppOUdwcFpibVNRVXVadC9XSGpPTzNiVVNCQlVB?=
 =?utf-8?B?V3dmVXAwZHBiSFMycjlBVFpwd0dCVDBmTUZaaS9LKy9aQ1FMTkxtdFVLdEFU?=
 =?utf-8?B?ZDFGbFp3S0JiYnpFSGxxcWdMNlJpN21rU1Z6bWRHMUxUNUdlTkxBZzJQeitq?=
 =?utf-8?B?TS9FUTVwTTJHMm1sOHlIaEc2dmZCNWQrYzJRSE9YR1FWWlFTbkxIZUdtWGl0?=
 =?utf-8?B?Rm01QTlRWC9UaDFmZ05tYVZQeFNBSHFQcktkV2pXSWNKdlRMbDR2WGZrelkv?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50750f3f-792b-40d9-f8bb-08dd61b9bfca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 23:00:57.2471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BoS0Jhgo86TTXMdSX/W/vsIKg+2+nFYeiryfHk86C44w3NMAEpmtIf/o8hgtDJ2dzRhIPrVvWnfTXyA48EEPAeVzZs1WhaWK9xyj4/ARyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

LMEM is partitioned between multiple VFs and we expect that the more
VFs we have, the less LMEM is assigned to each VF.
This means that we can achieve full LMEM BAR access without the need to
attempt full VF LMEM BAR resize via pci_resize_resource().

Always set the largest possible BAR size that allows to fit the number
of enabled VFs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
index ce05b6ae832f1..880140d6ccdca 100644
--- a/drivers/gpu/drm/xe/regs/xe_bars.h
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -7,5 +7,6 @@
 
 #define GTTMMADR_BAR			0 /* MMIO + GTT */
 #define LMEM_BAR			2 /* VRAM */
+#define VF_LMEM_BAR			9 /* VF VRAM */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287e..57cdeb41ef1d9 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -3,6 +3,10 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <linux/bitops.h>
+#include <linux/pci.h>
+
+#include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
@@ -62,6 +66,18 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u32 sizes;
+
+	sizes = pci_iov_vf_bar_get_sizes(pdev, VF_LMEM_BAR, num_vfs);
+	if (!sizes)
+		return 0;
+
+	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -88,6 +104,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	if (IS_DGFX(xe)) {
+		err = resize_vf_vram_bar(xe, num_vfs);
+		if (err)
+			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
+	}
+
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
 		goto failed;
-- 
2.48.1


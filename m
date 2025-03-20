Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C5EA6A480
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E092F10E5E9;
	Thu, 20 Mar 2025 11:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqmKKOaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9526710E5F4;
 Thu, 20 Mar 2025 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742469038; x=1774005038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bvVvwt0y5ZU+ZkeloQRdenfa1tfIFKVtQjEFgD/wv3Y=;
 b=kqmKKOaKxItrjYzoxGAme76p6uCzAt+aAL7Jp33YwcoGXe/SLNthq88D
 ps0LP/BNqX08/LLsfhhkbtjFZrHBAhUZXlLDhCJhfSUQEWBK4fLAwHmsC
 21O49i4oyq3FgUErpYaxYuJeYgdXAcUYxbXPHGvjt4HgL2eLNUiah0xf4
 6EiF4Cv5vdW3No8ACMknnWZXLmGq6ECnEcv8Ggy9pbaRbfD58mP4hs00+
 QqCt8kVAUX+9imrBvuBC1pE1SBzJjZCSesM9lKZnipymY1VXz5lq/KfBN
 /f4fdpXliNV5L8BthT4JDcO8sSeAcrzLMuDncsl97VP7UwO0+EI0514+Q g==;
X-CSE-ConnectionGUID: XCWRq3e2R22hE2u0ddu51w==
X-CSE-MsgGUID: QCIbLBU6RLK+fWCs5VwpAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55070954"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55070954"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:10:37 -0700
X-CSE-ConnectionGUID: j9q8d2P+SHy6FvZwy4SfvA==
X-CSE-MsgGUID: sZuMH+97TYynQecJtD7/Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="146265891"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:10:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 04:10:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 04:10:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 04:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZH3VMsxtz8q54vpOF/Wn43AgX1wju5RRGwDoyaqmt4sEWwjTnb4jDYMThqkiM0+Ov3G08oeAliLlalcks3jRexdaCK6Aj49moMQhiRBlxBZXRlQ+b5tIhUIpNtyHothImD2G9xT5AcbGimKSc7hOp8lukosg56qIqoz7EnKAwl5l5NvYT0Yd6/W+I0jl3KoLt7WAoXnnHl/TjAQTrfb9+A0kjlOYVgi/+o6u5Kb37sjdihv5ANEbSLR7X9bTMzNaelcx/WW0fYNaVz4IIO+jalUHRV0IpjefQSOB6kYrl04SDPNRCmXrrFKhy/qbfXz145MaH3A4WQuFVN/xKiJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZAkXwf8MLaO3y2+dBIyKmc26XFB+GjoTCgYEzxxgVE=;
 b=fSgDcmBHQXxHpsEpedZZiOAJgeXQKdMrCtw8WuH+h2+1U2pKP9eRzV9qYqzvRQD1z8seZT4qFSMzlzjEWZ5wYqnM+BpRnmmXhxjZbr/Z+7/77EGEBs9W40yI9sKnbtsAZwh2EKbkBQZVNdp2EvhJat589d4/9KFBp6TWXoiP8MWVdqrW0dof19ilxhqCSmlxg1FpCw/xCcNhLXqwTvUUurGvdSNCSrA4h/tdypcgPyZPvSaAoIyvIIbOmmVi4ZvSzegaPMxwK0fCJN/GimEATUgeqlt/zl7ism/QNFrGI5l7ttEtOh9gyVcbCRdSokUfvkIpxC2BlxfEuy8UWQOKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:10:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 11:10:01 +0000
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
Subject: [PATCH v6 6/6] drm/xe/pf: Set VF LMEM BAR size
Date: Thu, 20 Mar 2025 12:08:54 +0100
Message-ID: <20250320110854.3866284-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320110854.3866284-1-michal.winiarski@intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0169.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b020934-2e31-4b3a-cf7c-08dd679fc270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vnh1VTNmQ1ovU1FpNDh5T2lvdmxjWCs1WDFBSkpjRWFEcytpNVV6ZldoOEpP?=
 =?utf-8?B?ZEVmQ2N5U1F5NEJqcllBcnpMK3luL2dyeFhPUmVrNWVIdnl2OCs5WGloVzU5?=
 =?utf-8?B?N0hQMnNLNVBUaUlJRUtSaEVxLzY4T2RXWE5nc3JCWEVjOGpNQzhEWUJxQlo1?=
 =?utf-8?B?TzFESmpDMXNZcEExd0xZdENqYmRTblFvZXhzQjAxeFVHcTg0MEN6V0JuMDAw?=
 =?utf-8?B?U1NPMXRrYS9LeW1pSHI3Q3l0NFZWU01FLzkvQmtuTTZ6RFZ1WXRmQnVobHZX?=
 =?utf-8?B?aWkvczBwZ3hwOTNNQ2U3WVZ0RW55bUVRZ3FOVWVFWnd4dTdBOE5GOGxTdXJ4?=
 =?utf-8?B?MlpCUHZVSFBnQ3ZpYTd6NUJRanczTHMrZlpSRm00bnpNK05kamprVEpaNFQx?=
 =?utf-8?B?anU3T0E0bGNVY1RLRGJrR09yVk5ZdjM0aDdNSmJ5c0VTUkNvbFJEa2hTMDhW?=
 =?utf-8?B?VlBUS203S2VMa05WZ2ZhS3VJak9Lc0FnWEc1MUE5YmhhUmtmN1RjaWxpQTFs?=
 =?utf-8?B?aVdpdy9SZHBLOWVkKzRkRUdBWFVQeGVnV0pLRlNlZ2drUC8ybzZFTjJnU3h6?=
 =?utf-8?B?dEplYWYySVZxUHZyQm03Wmd2cy9VaXNnNUJaTVhTTWViWk1ieXYzTVptMnRM?=
 =?utf-8?B?VGNVODdBdTJSQ0JiN2tLWVc2YUxxZ2ZkQ3BXSW1ublF6K2NMeGdBUTQvRlYz?=
 =?utf-8?B?Qjg3QUdCaEpkM3VMb0ZJUlAydVpIRGtPcHArMGdrbDlSSlRITVVIMjR5elAz?=
 =?utf-8?B?OU5uVERkSFVuOGJCYzNOZFg3VVlUNG1DRWxxMlU0L1dGZWNsM1JIdlAxTjhi?=
 =?utf-8?B?eHhXSlhwaDg3UUxEUVdJV2wxcDFVK0ZmdTlvTmxkWFhuTnV6UitnWGhGTkhI?=
 =?utf-8?B?NjZtS1RvaCtDaVo4TGZLSFpEaUZXVHA2YWlaZXBaazlFd0tDRm8wRTFKK20w?=
 =?utf-8?B?Y2ZPRmdaNTUrV0hmMWJlTkhTcVYwL2d4MU1NaS9rSEpsaC8wN0lQWHNMb2N0?=
 =?utf-8?B?cDJLR2Y1Ym1qYmlEU2M4Ykx1Vmh1M2s2Rkt2MnhBWTJaQXpuMllWd2ZsazZJ?=
 =?utf-8?B?UHJta0ZTQ3gvSThMS3cvcXRFMlJHaDdBWVVyUE1wUHlrazVvWTBMa2dRMUR2?=
 =?utf-8?B?T3RwMzlZWnVZeU9EaGgydGdMQmVBYlBCWWVBQW83YVB3M1JMZS8zSTBlSDBS?=
 =?utf-8?B?VWRyUTB5ZkFPbXYwS1pacXVXOXMxSFpMZWJGNU1YOS9ONjU0VFQ1OW1aSHNM?=
 =?utf-8?B?a09BeDBoZElaYVRqOGEyWkZ5czZWd1ZLMHR4bUMrTW5ocUV3Uml6dDBIdThB?=
 =?utf-8?B?dktjZFdnemZ2ME02czhrMCtkWVhWNzBLejVjaVl6YmFYMk5Ua2FvZWxoK3Iz?=
 =?utf-8?B?MzlwcXNFSkxPZ0N2TUw1eFVLTExuYUFYeDNDa1pWSWJVbWx4d3FGTllYNDYv?=
 =?utf-8?B?eTlsNFNJK1NybzM1c2k0VzVsMDZDVlNYeDAvOGxYclVCKzZIUDZSSTRtUWEy?=
 =?utf-8?B?eE1UMUowTldRbFJvWkpoQ3FaYWlsMHJvTHZXbG9rdmJkUmVXMU9ad1BIYS9W?=
 =?utf-8?B?L2VYTSs2Q1RYbkovbVlLV0dmUElyOVVhWGs5WnJWaUVjM05HOUg2SFdBaHJ3?=
 =?utf-8?B?ZE5nb011M2JJcG5ia21wM3lnSGQ5Z3FnWXhMTXR2Qm1rVDNKbkJVeGZxK2lH?=
 =?utf-8?B?QjZBb1kyTGNWV3FqT2FwSWk5ZnoxajJxNWlWTnBPMzVZZytnVEF4N2RVeEk4?=
 =?utf-8?B?YUV1dmFPNGFDRXYrWld2NlBjK2t2bG5vODNRZVhJazZBY2U5YVlJUUxCTmdN?=
 =?utf-8?B?b3ZSVDRNRU5ndVZtZVhkY2E2a29yVnFmQkNmRjEyWHlpM3EzTENGNkhUVlor?=
 =?utf-8?Q?W9zpUdSnMoQx8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdWN25Udzl4YTlXcFlZNmYyOEFxa1lSeCtuRWd1Y1BGbHV3eEtJbEVUOGVw?=
 =?utf-8?B?OTMxY0xwc1FxalhkUnVNc1JXVVRNYk43N0diVHZONFpGclFPTjlncTBiMVVn?=
 =?utf-8?B?UE1aMXFlb0NyRGUzZXNPOGJnY3llN3pnYUhDdVQxQVpEUWxZTGRtSk1idnJ1?=
 =?utf-8?B?SnhQOFhIUy9Ta3owTHdsZWFZMEZMZmpHRjJIaUkyQ0RIZXhGUVlmZ0FuVlND?=
 =?utf-8?B?NnU5SjdaQUM4UWtwdHFwTHJvN0tNTzg3YzJtMm1ua2xObWtKNmtwQ0lDaXBy?=
 =?utf-8?B?a0M4RmtHcEEzTkpmN0Q0VHFzeWNnL0xmWUVJNkgvUzM3anVOU3A0MnRzV1FM?=
 =?utf-8?B?V1N0YTFBSG9vTTRTUkdXaldOVlIrbFVVQkVLUDR0RGVyZ3A2WmRRQ0p1YUxS?=
 =?utf-8?B?OW43V3NkcW1vWFZiSFdtT3JlT0VJS0diZTNWSDJoWHlBYjJTK3pQbEM4ZmF4?=
 =?utf-8?B?ZStOdGlXRlV1MXhxeHBpMGxWeFpwdks5YjZ3ajJwUmRTZVQ1YWZFMCtEekdE?=
 =?utf-8?B?TkFKZ0RENXFrNkdBLzhuNW80T0cwc3p6SEhFRUF6WWNIeE1VRGlIYTdLOWlt?=
 =?utf-8?B?anhIaFd0S0k0UFFGVnVPdUZSQWUwaWZBSSs5clVGQlZCb0FvajB2aUs5bWZM?=
 =?utf-8?B?S2xkcFdGTFJhSytVSDZaQjFNK0IyZXVYdWZtU0tCTU9nY2hQd2RTcDluUzh1?=
 =?utf-8?B?MElrRFM1TVk3V3ZCTElRbytVZnJsRERONjNMSmdhRUYrc0t2Rnkrb3lRSXdB?=
 =?utf-8?B?MzM5dGpRbTJNSHQ2OXhWRTQ1TG9JR2VOUnA0VU8xYmlaUFkxYmtlbmJXS3g2?=
 =?utf-8?B?My84eWtzbnc5aHJablpSS3pSZzM0SFBNb29GYnZTVkdrUFJFaDdhcHNHVVo3?=
 =?utf-8?B?V0ZnQXR6OHpHYUQ5VnNPRkJWcVRUQXQrSjUrYi9tTWRwUzdvdU94aEh0TmFR?=
 =?utf-8?B?OFZldDRoK0RvYUdjTERyeHRYbmZHaXNnZ2xjd0NQeHVydU5QZmc0VFlQV1p4?=
 =?utf-8?B?UGVncE8yV1g3Zmp6b0tiN1czV1FZMXcvK3ppOG9VY2hsKzdnWmVuVUI1RTdJ?=
 =?utf-8?B?QXJ6WkI3SE44Q2VWMzFCYmg5Zk9ySlZBUVVBVGV6THEvdUtjdzQ1YTFSWEZ6?=
 =?utf-8?B?dzc3NWZHVnRweXhPc0FVTjhLaTVSTUpROFhQYkg2aU5aT2N5cVllbG9TRmlW?=
 =?utf-8?B?TE9MaFFHQ1FEaCs5empxbEVicFd2eGlSdkd0eDR0S0FuMVZjRUFodTl4ZEVs?=
 =?utf-8?B?NDZSeWovVVhFa2QvRHFFOXYwSHpla3Eya2pmYmJIZyswRW9qV2FyS2RUbGxm?=
 =?utf-8?B?cngzbzE1cnowU0cydmtjNUQxUmJCTEFCNGVkREhlclJFeVNpVmFEYzNoTzM0?=
 =?utf-8?B?WUtOdEMzRzRsZnJjSGMxV2RTVzBpUjhMbklhaklRaHRLMVA3VXM5YTZLSVdx?=
 =?utf-8?B?WDBqcndMWk80bHZJSGMwc0kxSkhSMG96RmJWTGxDSGxxaEd4aE1hQitONWVN?=
 =?utf-8?B?aU9jTmtuZXJVR01YeGpjT2Z4YjJ2N0xQL1pib0tDRUJhYWlKbE1pb3U4dFBj?=
 =?utf-8?B?VmNsd01GVEk3TE1OUklXVU5nZVJZdHJjTlVTNmUzMHlpYUdteW5aYjZoYTl4?=
 =?utf-8?B?SmcvNnBQaks2Vk5zdTh0eURyWmRvWE1UY25iS3FnVy8xQVplenY3R3Rsd2hZ?=
 =?utf-8?B?ZVZSMmRYM0dRZlR2T3F6eFZzaTNXbEliU0dScXlBZVpuWGlKUmJjN2pSQXBB?=
 =?utf-8?B?L0VvVTZiSjhBYXM5Skpra3NSNU5CWFFybGJLejhIbHVNdnIwTmNKWnI3bDcw?=
 =?utf-8?B?MDlFOHF5NVJEOGZEcG9MR0pKbUI3WERQSmt6blVxdUJha016OUVmMUIrTTBl?=
 =?utf-8?B?Q2d5MVk3TzRzQXJPMWtJbTBML3NYeW1QbnZwWCs0OHNrOFg0Ti9rL29mYkRX?=
 =?utf-8?B?azRVV0thd0dJcFVSQUF1eHlpdE5oOFovMnMyVEthdk9XRjZYamdXOTNPcCtB?=
 =?utf-8?B?aGZ2Rlpua0o5RitnQnh2TC85UXpnU3hNUGdzT1g0RTZsVEJUWlQyaGNDY1cr?=
 =?utf-8?B?S01iRTcwajFCUmxDbDk3WDJlWlg4VHRFb2JoUHJaTHczOGo1c1BGSlVJQTJU?=
 =?utf-8?B?U2J4Y0NQblR1TTlGSWZJV1N3clN4Sm4zYWZNSlRTWUl3bzhEdDJ2YzBsVHd6?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b020934-2e31-4b3a-cf7c-08dd679fc270
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:10:01.7382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3b0HK9H7r9wff6fPo4bXVREXcCB53gVFDRkm3lZ+mWWm4eojndsxzcwjdqMJgmbq2ptMPL4MzZMpt1Evh5sNWwI8ykU4M3gdz+bJadHZ4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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
2.49.0


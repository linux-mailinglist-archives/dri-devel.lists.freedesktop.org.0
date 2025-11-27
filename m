Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B724AC8D985
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FAD10E7F0;
	Thu, 27 Nov 2025 09:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ht56CNCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A58810E7F5;
 Thu, 27 Nov 2025 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236408; x=1795772408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6qOOPeYZd++mVUVz8SDakDv7MGM+o2I532UHlwoJl2I=;
 b=ht56CNCh7QlxEMBtmAycfmYGfdMq9kNox7Fn+wRuJQrzSERPNuQvJSSJ
 imbILOQtrMWn/+3PY2Zzkn+NmQ0Q9jkvbMGivIceBfafl/wdnn2nl/sYl
 Hz4N3UFL8f26y3vSqeyGSfEIvOifNFXzut411ChiAf8jskcQX4fBxKhQ1
 rufbL3qGBkMyyPdktBcXdm24CS5nxHDCQJIGMAMRoB+BXLyFpsiWK64WI
 H08dHV24zF+XuSFTCK8HVWE1lx4cgq4Glz9QxhY6b35t71kmkKoOWNPwN
 QnmLB3BEoOnEYqiT7lX2S+nLE0kE3S2dPxT9lrjbjlCMu82yz7eE4Qq9V g==;
X-CSE-ConnectionGUID: d7UK4ZaQTP2wjhLqL6isgg==
X-CSE-MsgGUID: nPPi79zDTVeDKMtIotueRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65467358"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="65467358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:40:08 -0800
X-CSE-ConnectionGUID: gUNXCw7KSTOr9jQVEObPJA==
X-CSE-MsgGUID: iF1C+2ARQc2JoQ0BcKbB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193999121"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:40:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:40:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:40:07 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:40:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeJJ1u3OPxc+BMcutQGuVqAyA1rePrWdv7YuDZXimzesvThETlgicUmocq/qPMFuOXBjeWnIVSR8nQwIXPV+9QUKwFqaK5ugnOXh2iGAtNHHbxqWX7dyovXnAfShmeyZnaBBHBKEH1dMXG7d+TlNIbl6n3+20INGJGRelH7USQK3SfNXiRdb94vxmMKvQSv1+KLZvo+J4tPiGZVyio4bd/GSfh1z5QPVzZZDGbM5Il3euMLMYWXSFdFy3Wsru5ITzaSDAgSJW2EsacFW1Fnb65COTCbuARIuw7eFvTfponaHSHySM0FRvNU1DW0oWYj4TY7VrjdnAtczYVTrUXlfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oevr8P9weYP5XebNGSh/hc/SI3Mk1a9fHP7v7CoSeS0=;
 b=GHMWgSrD6fhmNed7AxrMcm9eZG0Pq8Q05AEXsfXXLQo1Ult7cY/Enpfk4LJbJbxD2yiNXahijwFrVmF9KDSgmfpKtGSAM9Tmr8mtiX2Gusju0amdDhhjGvXQm1Fz05Oe/Rkg16xtXZyBpm0BeLUq8963PARoT6NLksQruzkDYPAOxWdMIjVBGU1KYlEqhH/loKdYQxYUYFVPEjFH/ar9IX2jJghmwh0cRkEOkJ9cYjcZrWxFABq3fdlLaB2z2jm4uCTpEQE1xVUvbeooyGsK8E3ufN6JNfeXRNEI6aS7j9dC2pQ7txAG1avd3EU1xIl9WnMDP8U7mrKZ9JX6f8j4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 09:40:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:40:04 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v7 4/4] vfio/xe: Add device specific vfio_pci driver variant
 for Intel graphics
Date: Thu, 27 Nov 2025 10:39:34 +0100
Message-ID: <20251127093934.1462188-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127093934.1462188-1-michal.winiarski@intel.com>
References: <20251127093934.1462188-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0088.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3b8e91-d109-4aaf-0f5a-08de2d98f144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW5xd2t5UHRsK3g0UlFwaExJaWJoaE4yT282cTg1MkN4dXczZkhQZzhlOVZR?=
 =?utf-8?B?bVhkdnZzbFJGN1Y2ZnNZb1MvZnRseFNqQ3d0NVJjVDU5Y2pnRGdRbHNoV1JM?=
 =?utf-8?B?VzU0VUlaamxPT1BJeTE2OXlCZ2pQS1BWZURrZTJaWDN3OENWT291V2NmN2hz?=
 =?utf-8?B?dlFpUWkwY2RiV2JpK1JlVmwvOVFoVkhDZ1VsamI2K2NjSGM0TUNwU2JqRnd5?=
 =?utf-8?B?RjVydFlad2NQV0xXMmlhanJnSGNFdC9Vb01Bcm1vWnhIaGczSTZGT2Z3YlhY?=
 =?utf-8?B?MlBMNHpad3RBMVgxbkF5RFQvMExHOUhKYWVMQzE3RExTWEo0T1MyL0p3blZH?=
 =?utf-8?B?cTFBWjc0Uml2RzBUa3FDdHdkRUt0Kzc0dnBYOFZKMTBWSlJEcld5eXY5Wkdy?=
 =?utf-8?B?djdxdzJESitUdFI5c3JEOHJ1dHQ0amxPS1QwdGNISzhHSHlHbzR5T2ZNRjdS?=
 =?utf-8?B?TWdLUEhQcXdiUms4NGRaQWVoOVBvVXgwZ3VKbXVpTFpLQ01qbm1TS1VGSFo1?=
 =?utf-8?B?eTNPZUYxZ3ZwbGNKKzRLbGFnWjRmTDhaNzZTbUVJRzJhbmlIeDNBUHRxTUVO?=
 =?utf-8?B?cnZxNVNwQWJHa2JPaXVXV1NMWlVyc1RTRDBxTHRQZ2U4STQ5U1FuYkFwVy9B?=
 =?utf-8?B?YmIzdVBDYzFEQUFGb0J5RTBBNnZVdVEycFZDZVVoSStod2tSNFh4U2hFalNw?=
 =?utf-8?B?bWVIMWJBMENBU00wNnZQODI2N3Y4QmZCUWZZZmVoeFFGN1VSZkI2VFJPbVNv?=
 =?utf-8?B?UXVia2tKbCs0WG1KRTMwbzBuUGk1dTVnSHkwMjhMWmJqV0xxMmlWVEhCbktR?=
 =?utf-8?B?WjZ0QzJaMFpKMW15WUtPa0NkUUhhSkV3RW15YVFOdjJNWURycEM1eEsrVjhG?=
 =?utf-8?B?blNHZUFpeEZZaVp5NmhRYWV2dW01T1VZNndkOVk1N1NxSGM5TWZhQXhHd3NE?=
 =?utf-8?B?SVo5Z2wwSHZEU1kyS3I1OHV6L1BqejErdVlSSGhZc0dNR3lDR0p4K1JsR2dm?=
 =?utf-8?B?anRSTmFzQlVueFdwMG8rTTVJUFJoalRWcmRBM2xSNER0WmFMaE9MYVpUNE1R?=
 =?utf-8?B?WkorN2pjT252VzE2elR3a1F1a21LckV6YmxZN0JzZ1FIaS9hY20yUWpDaFB2?=
 =?utf-8?B?WlVMaS9oUWNmQng4d0gwMldEMENTeTJHS2o3bTFEUE16d001U0xmVHU3c2I2?=
 =?utf-8?B?MjBTazlZY3dZQVdDRlprVFlGUGlFenNSMURhVGt5My9GUVo5VUJ2WVJUMzM0?=
 =?utf-8?B?czByZ0ZvcGZ3cXo3bjYzbFhDTEFjNC9zNVJjZFFudVh1aXJFY21OQ3BxQkxC?=
 =?utf-8?B?cUpJRy9iQzJSMVhqc1JqQmVIaGkxTXV1d05sT2ZYMlpuQVROMm9HdXVDZHZZ?=
 =?utf-8?B?YTFzYlR4S2dIbVB4Q0U4dm1Bd05VVWt1ME1ycGptLzE0aHl3WlBGc2R4VnA5?=
 =?utf-8?B?TUovUGJqR1ZwWXhId3FoTXdHaUN5NnJVZFVkbUNRYjN2RllJNEt5b3ZrVTNB?=
 =?utf-8?B?TkVpdVlPUVJYOFZkUEp2YU91cXRKYU91Q1hHVnNXUGpJU2ZUZ0l2TUZsMjg1?=
 =?utf-8?B?WTFYakJ2RlJQT2JaSy9BVEUxTzNwaExtb1NGTVpRaGZGRllZT3dtQnVLTTVx?=
 =?utf-8?B?dUdIQ0dESy9IVk45cklvNlRYRUJ1SUw3eG55Mm9MMVoyUm5wSmFrQys3RjE0?=
 =?utf-8?B?VWhmYS9rVk9aYmJPTm9VbnUzM3FZMkxselB4R0Q4ampoQmZHOUNIYTF5MjZK?=
 =?utf-8?B?ZXd6d1FHOVZURDhqOTRsOHBJYjdmenJ5Q2ZmcUt5SzRUZDB2UnBhdnhFWFdQ?=
 =?utf-8?B?ZytCZHFzY3RzcUZBNkt2VE1nd1p1WG9XdlVnUnBTQXhNV0h4NmZJQ3Rkd3Fw?=
 =?utf-8?B?SW9Md3J1MnNYWnZUbS83RWhnYWhzQnpyUzZoakhsSGh5Y1o1Y1VnWHJQa2dZ?=
 =?utf-8?B?QVJwT3lQTURMb3BTb3NvNDRTa1JFLzNZUWt6U0xSczlFYlQ4ZnE5MGZmaC9y?=
 =?utf-8?Q?JnL1DMJu8Ypih6CrAkbsEmqHK1Tj00=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDg5OXdJZnZ4Nm43R0JoeWJ6eGtsRzdWMk9FS0tIUHNoakdmUnhFS1lPQWZH?=
 =?utf-8?B?VXMrSDhnenNXcXhHdllTQnd5MTVDR29mRVZBOE1vMTZEd2NZM0RCckNaTWZJ?=
 =?utf-8?B?OVFmckFlRGFlVGMvblp0cE4xTTJCVmIzczV0MlRHbnJGQW9ueGRQUzhzRy9G?=
 =?utf-8?B?bTAwSHpiNTBKcTVhU1p2Ymk0Qmp0VHRZVEd0ZmdCYm9WaTdWdHozVU1vVEE3?=
 =?utf-8?B?RFZtRTZvelQ0dGdQSWJJSVg1SFpmTTMxVDE0cjk1eTlKNmhycDB3aFlFbU1t?=
 =?utf-8?B?YXByR1RvSFh0c2ZXemlvajUyQW1rVUxMOUdqUDlGejhvYmRuczlqUmFIYUJu?=
 =?utf-8?B?aG5VZ2F1aTIxdU9HYTdPYVFFUUJabXFMN1V5Rk9HV0VyYXBrRmtSNi96QzBl?=
 =?utf-8?B?WERVcWo2STNvSE56My9wSW9PeVZacmtGMk01bE13NWc3V2VGVmhKUUN0dU4y?=
 =?utf-8?B?dkV2ejJ2L290TWhJNW84MllTZmVFSVNxcVZobjN5UXZTVFZQaUg0NytaRDhU?=
 =?utf-8?B?NmdyeVhSdGhHRkdVZkN2c1lnVkVGSDQ2eU5udi9IeWlJZ1lLUTRlR2p5disw?=
 =?utf-8?B?U2ZWS00rS0Fya2V4aFBNd1UzbmdRVkxZRXd2cnRNWXE0Q3RXcDhiR051eGUv?=
 =?utf-8?B?VE0rVHVLTnZRY3AyMHlNMVlwb0M3ZnJCMytpUnlacTlwY2hHWnFsWFdtdTBo?=
 =?utf-8?B?WmRGZmZUc09vOXRQVDE1UmpoNTVPWHlmMVBVOU5MbWlkbkkxaU5WWkVtL3hI?=
 =?utf-8?B?VDd6KzBTNlMwem1CdkMvdy8zVzlGUDlXaWpuSUg5N002SStKam92TnlWdjJQ?=
 =?utf-8?B?cG9pRFgwT2IxMDlhMFVDeDFFUzVGOFUydEFLM2JCcGIwYkNpbERQcWZVekYy?=
 =?utf-8?B?RmxRTHVvZndaS1NuYXNkb2FTQWlrODNOV203THNzcnRtNnA1Q2Q5cGs3cnAv?=
 =?utf-8?B?VkxWOXVWWEFxU0V5VzVybEtuWGEyd3ZyZXRVeE1pL0Vmbnd1dTQ5Z1lWeW1U?=
 =?utf-8?B?SDNiWElXemg0RzdWZmdlRzZLQXBsTlJpU3RCWGVyZjBxeW1lZXhXejdPVWc1?=
 =?utf-8?B?UUQwNFVoUFNhUFdwdS9JN0RjaHBZN01KQkh5NW5hd2Y1SVMyNU1PNlVuY2Vy?=
 =?utf-8?B?MVcwWDZvK2hjd2JvRGwxeTllc2xXUW5GUXpvNTlodHJvdmluNC9TQVZ6dlRM?=
 =?utf-8?B?ODEzTDJjYjJ6MXJINkp5elRMU0czVFhvSnFIVklaL2taQ0FXcGZ6d3g1V2lU?=
 =?utf-8?B?dWJTaWs0cjZZa3BRdkwrTlhyOU8wemtSd1BjSDlVYi80WUJhQkQ4ZmFRUEVi?=
 =?utf-8?B?cXNsaTBQZGlGZVYxaVFIczF4bVhxVjhWS0RBeDRoKzIyQTNuNTA3QjBPVXlB?=
 =?utf-8?B?YzVCTlRibUwxSTZQcXRBbmwvSXlpZld4WGUrdVRNeUNZelBMNnlsdlFjM2NY?=
 =?utf-8?B?MXA5eGYrZytGOU85bzBlUk9tWGk0R3lQV1ZTbEFVZ29BSVdTaUlHQ2JVNTNj?=
 =?utf-8?B?dHNJMHdnRkN5OHl3OVBSYnZlVUtqcGlxdjdhcm9MZG5pMldFamlmTzlZNVIz?=
 =?utf-8?B?MzB2SG83MHZzU25SQlFpR2l3cXV0ZjRLV1R0bElzNXBvWVpjM3lCZTBjUEVo?=
 =?utf-8?B?UERqK0RtM1EyNmM3Ni9yWHVIMkVyQitzeFQ2ZnI4NHZBZjRZbnA5RURMcUc2?=
 =?utf-8?B?UlZBYlRLVzNqR25VcitFMGR5eDFzeXNZTjBVRnZVTkVNK1JlbzFMSU1NWFZx?=
 =?utf-8?B?ZWk4bjZwRkxCSmxUcWlGKzg0UW12NWUrenZDbXQ3MythelBPZ1JsbTMxQlk5?=
 =?utf-8?B?N0NpaVl4azhZK2JTUDlCMHlkdFBMZ2tqTnhvaVZmVXJYK1Zsc2dEdGM4TlQ4?=
 =?utf-8?B?MkNLWGFKb01pOTRmZzNPVDlqWmE2K1hwRTU5Y0VWdmdMeEhGOTBkMDlUdTBF?=
 =?utf-8?B?ZmwvVkQwZHdKbktVNWtOOWhtMEp4aUpiaXQweDIxR1NualVmdnpobGowZ1Rh?=
 =?utf-8?B?VUpZNkVnVFNZL3R5WncrUGdWcEN6STI4NDRjbzd5b084WDlJbm9TNHJZbTZy?=
 =?utf-8?B?WWpSTlovVFBmejNRdks4V0l6K3ZTQjF1VVJ4ZmZGUVNzTUk5K2JYM1ArSTMz?=
 =?utf-8?B?QmpXOVM0d2pqcjNwUDJiQy9VYzNJbnh3bEp0N280L2JTcWV0UFhBRHB1ck80?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3b8e91-d109-4aaf-0f5a-08de2d98f144
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:40:04.1448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYyolvLhcu0bYer1ShvHqm1bFplBr5KqunBJ3OuFxo+Ql4r10nctgA4/A8OdVta/1V8Q4HKbSQh56o2FH5aPlPoyPqKnDufSnuA1C69RynY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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

In addition to generic VFIO PCI functionality, the driver implements
VFIO migration uAPI, allowing userspace to enable migration for Intel
Graphics SR-IOV Virtual Functions.
The driver binds to VF device and uses API exposed by Xe driver to
transfer the VF migration data under the control of PF device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/vfio/pci/Kconfig     |   2 +
 drivers/vfio/pci/Makefile    |   2 +
 drivers/vfio/pci/xe/Kconfig  |  12 +
 drivers/vfio/pci/xe/Makefile |   3 +
 drivers/vfio/pci/xe/main.c   | 573 +++++++++++++++++++++++++++++++++++
 6 files changed, 599 insertions(+)
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c

diff --git a/MAINTAINERS b/MAINTAINERS
index acc951f122eaf..adb5aa9cd29e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27025,6 +27025,13 @@ L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/vfio/pci/virtio
 
+VFIO XE PCI DRIVER
+M:	Michał Winiarski <michal.winiarski@intel.com>
+L:	kvm@vger.kernel.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/vfio/pci/xe
+
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..c100f0ab87f2d 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
 
 source "drivers/vfio/pci/qat/Kconfig"
 
+source "drivers/vfio/pci/xe/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f5d46aa9347b9 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
 obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
+
+obj-$(CONFIG_XE_VFIO_PCI) += xe/
diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
new file mode 100644
index 0000000000000..cc9b6dac6ed39
--- /dev/null
+++ b/drivers/vfio/pci/xe/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config XE_VFIO_PCI
+	tristate "VFIO support for Intel Graphics"
+	depends on DRM_XE && PCI_IOV
+	select VFIO_PCI_CORE
+	help
+	  This option enables device specific VFIO driver variant for Intel Graphics.
+	  In addition to generic VFIO PCI functionality, it implements VFIO
+	  migration uAPI allowing userspace to enable migration for
+	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
new file mode 100644
index 0000000000000..13aa0fd192cd4
--- /dev/null
+++ b/drivers/vfio/pci/xe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
+xe-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
new file mode 100644
index 0000000000000..0156b53c678b7
--- /dev/null
+++ b/drivers/vfio/pci/xe/main.c
@@ -0,0 +1,573 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vfio.h>
+#include <linux/vfio_pci_core.h>
+
+#include <drm/intel/xe_sriov_vfio.h>
+#include <drm/intel/pciids.h>
+
+struct xe_vfio_pci_migration_file {
+	struct file *filp;
+	/* serializes accesses to migration data */
+	struct mutex lock;
+	struct xe_vfio_pci_core_device *xe_vdev;
+	u8 disabled:1;
+};
+
+struct xe_vfio_pci_core_device {
+	struct vfio_pci_core_device core_device;
+	struct xe_device *xe;
+	/* PF internal control uses vfid index starting from 1 */
+	unsigned int vfid;
+	u8 deferred_reset:1;
+	/* protects migration state */
+	struct mutex state_mutex;
+	enum vfio_device_mig_state mig_state;
+	/* protects the reset_done flow */
+	spinlock_t reset_lock;
+	struct xe_vfio_pci_migration_file *migf;
+};
+
+#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
+
+static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
+{
+	mutex_lock(&migf->lock);
+	migf->disabled = true;
+	mutex_unlock(&migf->lock);
+}
+
+static void xe_vfio_pci_put_file(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	xe_vfio_pci_disable_file(xe_vdev->migf);
+	fput(xe_vdev->migf->filp);
+	xe_vdev->migf = NULL;
+}
+
+static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (xe_vdev->migf)
+		xe_vfio_pci_put_file(xe_vdev);
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+}
+
+static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	mutex_lock(&xe_vdev->state_mutex);
+}
+
+/*
+ * This function is called in all state_mutex unlock cases to
+ * handle a 'deferred_reset' if exists.
+ */
+static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+again:
+	spin_lock(&xe_vdev->reset_lock);
+	if (xe_vdev->deferred_reset) {
+		xe_vdev->deferred_reset = false;
+		spin_unlock(&xe_vdev->reset_lock);
+		xe_vfio_pci_reset(xe_vdev);
+		goto again;
+	}
+	mutex_unlock(&xe_vdev->state_mutex);
+	spin_unlock(&xe_vdev->reset_lock);
+}
+
+static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!pdev->is_virtfn)
+		return;
+
+	/*
+	 * VF FLR requires additional processing done by PF driver.
+	 * The processing is done after FLR is already finished from PCIe
+	 * perspective.
+	 * In order to avoid a scenario where VF is used while PF processing
+	 * is still in progress, additional synchronization point is needed.
+	 */
+	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
+
+	if (!xe_vdev->vfid)
+		return;
+
+	/*
+	 * As the higher VFIO layers are holding locks across reset and using
+	 * those same locks with the mm_lock we need to prevent ABBA deadlock
+	 * with the state_mutex and mm_lock.
+	 * In case the state_mutex was taken already we defer the cleanup work
+	 * to the unlock flow of the other running context.
+	 */
+	spin_lock(&xe_vdev->reset_lock);
+	xe_vdev->deferred_reset = true;
+	if (!mutex_trylock(&xe_vdev->state_mutex)) {
+		spin_unlock(&xe_vdev->reset_lock);
+		return;
+	}
+	spin_unlock(&xe_vdev->reset_lock);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	xe_vfio_pci_reset(xe_vdev);
+}
+
+static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_done = xe_vfio_pci_reset_done,
+	.error_detected = vfio_pci_core_aer_err_detected,
+};
+
+static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+
+	vfio_pci_core_finish_enable(vdev);
+
+	return 0;
+}
+
+static void xe_vfio_pci_close_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	xe_vfio_pci_reset(xe_vdev);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+	vfio_pci_core_close_device(core_vdev);
+}
+
+static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+
+	mutex_destroy(&migf->lock);
+	kfree(migf);
+
+	return 0;
+}
+
+static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	if (migf->disabled) {
+		mutex_unlock(&migf->lock);
+		return -ENODEV;
+	}
+
+	ret = xe_sriov_vfio_data_read(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_save_fops = {
+	.owner = THIS_MODULE,
+	.read = xe_vfio_pci_save_read,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
+					size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	if (migf->disabled) {
+		mutex_unlock(&migf->lock);
+		return -ENODEV;
+	}
+
+	ret = xe_sriov_vfio_data_write(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = xe_vfio_pci_resume_write,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static const char *vfio_dev_state_str(u32 state)
+{
+	switch (state) {
+	case VFIO_DEVICE_STATE_RUNNING: return "running";
+	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
+	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
+	case VFIO_DEVICE_STATE_STOP: return "stop";
+	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
+	case VFIO_DEVICE_STATE_ERROR: return "error";
+	default: return "";
+	}
+}
+
+enum xe_vfio_pci_file_type {
+	XE_VFIO_FILE_SAVE = 0,
+	XE_VFIO_FILE_RESUME,
+};
+
+static struct xe_vfio_pci_migration_file *
+xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
+		       enum xe_vfio_pci_file_type type)
+{
+	struct xe_vfio_pci_migration_file *migf;
+	const struct file_operations *fops;
+	int flags;
+
+	migf = kzalloc(sizeof(*migf), GFP_KERNEL_ACCOUNT);
+	if (!migf)
+		return ERR_PTR(-ENOMEM);
+
+	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
+	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
+	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
+	if (IS_ERR(migf->filp)) {
+		kfree(migf);
+		return ERR_CAST(migf->filp);
+	}
+
+	mutex_init(&migf->lock);
+	migf->xe_vdev = xe_vdev;
+	xe_vdev->migf = migf;
+
+	stream_open(migf->filp->f_inode, migf->filp);
+
+	return migf;
+}
+
+static struct file *
+xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
+{
+	u32 cur = xe_vdev->mig_state;
+	int ret;
+
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
+
+	/*
+	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
+	 * have the capability to selectively block outgoing p2p DMA transfers.
+	 * While the device is allowing BAR accesses when the VF is stopped, it
+	 * is not processing any new workload requests, effectively stopping
+	 * any outgoing DMA transfers (not just p2p).
+	 * Any VRAM / MMIO accesses occurring during "RUNNING_P2P" are kept and
+	 * will be migrated to target VF during stop-copy.
+	 */
+	if (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P) {
+		ret = xe_sriov_vfio_suspend_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
+		return NULL;
+
+	if (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING) {
+		ret = xe_sriov_vfio_resume_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf)
+			xe_vfio_pci_put_file(xe_vdev);
+
+		ret = xe_sriov_vfio_stop_copy_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_resume_data_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf)
+			xe_vfio_pci_put_file(xe_vdev);
+
+		ret = xe_sriov_vfio_resume_data_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	WARN(true, "Unknown state transition %d->%d", cur, new);
+	return ERR_PTR(-EINVAL);
+
+err:
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"Failed to transition state: %s->%s err=%d\n",
+		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
+	return ERR_PTR(ret);
+}
+
+static struct file *
+xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
+			     enum vfio_device_mig_state new_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	enum vfio_device_mig_state next_state;
+	struct file *f = NULL;
+	int ret;
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	while (new_state != xe_vdev->mig_state) {
+		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
+					      new_state, &next_state);
+		if (ret) {
+			xe_sriov_vfio_error(xe_vdev->xe, xe_vdev->vfid);
+			f = ERR_PTR(ret);
+			break;
+		}
+		f = xe_vfio_set_state(xe_vdev, next_state);
+		if (IS_ERR(f))
+			break;
+
+		xe_vdev->mig_state = next_state;
+
+		/* Multiple state transitions with non-NULL file in the middle */
+		if (f && new_state != xe_vdev->mig_state) {
+			fput(f);
+			f = ERR_PTR(-EINVAL);
+			break;
+		}
+	}
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return f;
+}
+
+static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
+					enum vfio_device_mig_state *curr_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*curr_state = xe_vdev->mig_state;
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
+				     unsigned long *stop_copy_length)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->xe, xe_vdev->vfid);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
+	.migration_set_state = xe_vfio_pci_set_device_state,
+	.migration_get_state = xe_vfio_pci_get_device_state,
+	.migration_get_data_size = xe_vfio_pci_get_data_size,
+};
+
+static void xe_vfio_pci_migration_init(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	struct vfio_device *core_vdev = &xe_vdev->core_device.vdev;
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+	struct xe_device *xe = xe_sriov_vfio_get_pf(pdev);
+
+	if (!xe)
+		return;
+	if (!xe_sriov_vfio_migration_supported(xe))
+		return;
+
+	mutex_init(&xe_vdev->state_mutex);
+	spin_lock_init(&xe_vdev->reset_lock);
+
+	/* PF internal control uses vfid index starting from 1 */
+	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
+	xe_vdev->xe = xe;
+
+	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
+	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
+}
+
+static void xe_vfio_pci_migration_fini(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (!xe_vdev->vfid)
+		return;
+
+	mutex_destroy(&xe_vdev->state_mutex);
+}
+
+static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_init(xe_vdev);
+
+	return vfio_pci_core_init_dev(core_vdev);
+}
+
+static void xe_vfio_pci_release_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_fini(xe_vdev);
+}
+
+static const struct vfio_device_ops xe_vfio_pci_ops = {
+	.name = "xe-vfio-pci",
+	.init = xe_vfio_pci_init_dev,
+	.release = xe_vfio_pci_release_dev,
+	.open_device = xe_vfio_pci_open_device,
+	.close_device = xe_vfio_pci_close_device,
+	.ioctl = vfio_pci_core_ioctl,
+	.device_feature = vfio_pci_core_ioctl_feature,
+	.read = vfio_pci_core_read,
+	.write = vfio_pci_core_write,
+	.mmap = vfio_pci_core_mmap,
+	.request = vfio_pci_core_request,
+	.match = vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
+};
+
+static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct xe_vfio_pci_core_device *xe_vdev;
+	int ret;
+
+	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
+				    &xe_vfio_pci_ops);
+	if (IS_ERR(xe_vdev))
+		return PTR_ERR(xe_vdev);
+
+	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
+
+	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
+	if (ret) {
+		vfio_put_device(&xe_vdev->core_device.vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void xe_vfio_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+
+	vfio_pci_core_unregister_device(&xe_vdev->core_device);
+	vfio_put_device(&xe_vdev->core_device.vdev);
+}
+
+#define INTEL_PCI_VFIO_DEVICE(_id) { \
+	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
+}
+
+static const struct pci_device_id xe_vfio_pci_table[] = {
+	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
+	{}
+};
+MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
+
+static struct pci_driver xe_vfio_pci_driver = {
+	.name = "xe-vfio-pci",
+	.id_table = xe_vfio_pci_table,
+	.probe = xe_vfio_pci_probe,
+	.remove = xe_vfio_pci_remove,
+	.err_handler = &xe_vfio_pci_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(xe_vfio_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michał Winiarski <michal.winiarski@intel.com>");
+MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
-- 
2.51.2


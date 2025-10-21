Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4EBBF9130
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D1910E64D;
	Tue, 21 Oct 2025 22:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igYVw9m2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D9D10E64B;
 Tue, 21 Oct 2025 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086543; x=1792622543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YzVgWcfTuAFJeL8ew9D510BkwhVAI3ocVBl77gqL7DI=;
 b=igYVw9m2fgDgDpJltuC9kBlQCZXdSzpC7rdG05b9uV4e83He/9kKvvfa
 5jhPnz1SMOMgDH5P+ehk3nea8G0YA2T628ieRha62iWYGf4C9YLzPH7kS
 Xz7LjOTjOlWYZRTig2IC3M2q1vguVldHD6646L2avpdBW4ijQs2PNigXS
 n+FMO5TXQ5ts8MRJu7JVpFVVBr6sda7q86J1b8bSqwUX7/7a2sJp3elNl
 IyKHqTswlnReYxBwZPljoCXUdlA1Fl4Mm5q2t0gA+Lh7udfsD0CVxrObk
 R2CTy0QtsGMWakk3bTFhZOpxcVmlBbwtXRo2YktTG40pZ+opdtu+hToUQ A==;
X-CSE-ConnectionGUID: Y63iILJzT965ixiogBFRkg==
X-CSE-MsgGUID: o26QeJHhQOCvtG0QP2QnFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63321604"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63321604"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:23 -0700
X-CSE-ConnectionGUID: VVh9x1amSzyp/lu6NyFNSw==
X-CSE-MsgGUID: ohAQ8e+iQZi/6+39PREbjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183738458"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5FqLomWNg+u5YTNms+lxSDwLR9bp3XqcCNSuNJxXnZw8TIMqXRbcoJOKNC89B5pgEnA6sHYljJPYdMnH/dhXqxpXV7HuYk8yqzHT6m9CiMey2PE89s1JiMVwkgf5CMp0FQY5CvLDY6SbcvqZWVT8xYB9jRN88umYtiDMUijjaq5fYk7YH6kGb7EDTbYd1OrGYZcrMLgbiVv7C9BOVzUBaDVNsaFv3yELgthWrNPX8nPmoJqRlVuMPW7tqpGHVwuU88PeFmf9AwUHCIp192myFl92aTSFELKSipKLhjfOyesX8i+p06RMu11zjbnoARIR5TtLakGJDnZpG1tYMaoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYGSrldPZDDSDC1F/qbp95/CiTz4bhJnPePVp22JvFU=;
 b=jfrdDglh5b5N0RcW4XssSxy0IliQDJcNN40cDCuFzbPqPUjNdgm9SY9bcfL3pWbry14Q3NvvMYOnt5mUn4A8H+PS1rS/ogpMSem4OgkdqJ4/rOTE38jEI8yhMgY4fpjwnBubrwqnL5AHY7TvEEpT0m1iAzHw8Qr9yGiquo9MVDflaOdZDVOSvXbp7IipTJiwo/ga2s1GbgsIh0UT5w8X6EeAY1zs/A0WKTtmQMJyTnSW0n9xjYCp7DewL2ji86QFNLwhNrZP5Wwg50HSeaEgxhFxA24noqYuMl4vNQIWQm53YB4HoAKTdboDiXZNJYwSbUsN0OWDEEO52ij/QVU1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:19 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:19 +0000
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
Subject: [PATCH v2 02/26] drm/xe: Move migration support to device-level struct
Date: Wed, 22 Oct 2025 00:41:09 +0200
Message-ID: <20251021224133.577765-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0001.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: df5bb84f-a50b-4367-4b7f-08de10f317d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmdsM3dCMzVxWGNORHBXdmNUVk4rL0Z5T05ML3cra040eFNWNGJUNktVNjFs?=
 =?utf-8?B?RVdMdWlYSWIxblF6U3pIRHdTMW5sWEpsWExHSnNYUk9SMzVYSG82ZisyekVq?=
 =?utf-8?B?b1B6RG15cmxtNi96L0VKdEg5WGtyU3czQ2M0TFJ0V1JZY0xjT0cvZU9tNktM?=
 =?utf-8?B?ZDdMV2xpdTNVMmZ1OUxoS2E2REs0VS96MjNoektHajN3eHRQRlN6ZUtrUFpQ?=
 =?utf-8?B?bUdoeG5CakxvNUtTeDNtblNTSVBlVGN0c1RUY3MzSS92Y1Vnb0NPS2xwQk0y?=
 =?utf-8?B?eGovL3lCaiszY3JsNDNsVkFXKzlYQ3gycGdXdDFnOGQ3Rzl5RUVsOFNRQlZO?=
 =?utf-8?B?SG12RjJITng1ZjVsaWo1ZmFiMUdFbVZtOCtDdUQxSGM4dnh0aGtCMWxrQWgx?=
 =?utf-8?B?ektMaVVjSGVoRDkraGQxclh2RDAwWTBScSt0cU5ZdGhLNnUzSjg5bWJjWEox?=
 =?utf-8?B?MWM3eWJHR09nMEN0Q3ZuNU8yVFRUQVYvL2lwMkNrVCsyRy9FSU96RGltVnJy?=
 =?utf-8?B?cVRRSTNqT1dONkZQODlrd1pHU0VaMGxxNVBEZ0NGRCs0QWd1ZG43YW1GUWFW?=
 =?utf-8?B?NWRoaEtsVVROTU82WXduZUJia083VmF1MjR6dVlDeFNVOVk5aElpTURyM25X?=
 =?utf-8?B?bGdKMHZKaTRER0ZVMFVDaTFVUWtxQmFEWDNsVGlUNEZqTVFzNzJqM1Bvd2ZO?=
 =?utf-8?B?cS83bXZTOXo0U1dsY3U5WVYwcGI0SUhtVkVsNDhQbTh3TW9iSkdWWDRlYnpX?=
 =?utf-8?B?ZWd4VTQzbnhkU1ZUcTFhRE02QmdDMmRPOEp0Q0Z1c3FvNFJoMGtBdUliYzBl?=
 =?utf-8?B?TFIzY3pEUTV0eXlpTE5qdmpWcjE0cTNQTTRMcmpMd2tOU1p0dW90S1VnOWVZ?=
 =?utf-8?B?Vnh1Y3NDcUlzSVhibkhWazRxbUI3UTI3aFYvUmppanE5dU52QnNZdVRURGUx?=
 =?utf-8?B?OG5MdHlHQkZDS2VZVzJBVGhWTXJzb3ByYjFmNnE0Z21yWGN6M1lWRnJZWjlY?=
 =?utf-8?B?L01CTW43MHRGd0J6aGZZMXJlcSsyYy9EUFBtY2FCL1BIeFJ4UE9SMkVsZyta?=
 =?utf-8?B?aHZSYkJJUlNnTjhHNnN0YnRPb1pya3F5ZzQvRHpIUHg5eHBpbWFOdk9NWS9j?=
 =?utf-8?B?cnNvaEx6QjdGanc1a1AxZDdrQU1mT3lobTQxQmV6WC9kbkI4NXQ4NmduazhT?=
 =?utf-8?B?QjlqMnNqRUNHaXBYWlRiV0lCZDk1V1FsWU9LZnBaQWx3dlNqRTRoUitHRHRL?=
 =?utf-8?B?M1hFY2xyZmlFMVU0QjVxRVUwSis1ZHZhMlJUNUJGZlZvSjQ0d0wvcnVLTFQ3?=
 =?utf-8?B?bFNPanZRaGFsSDZpbzU5V1EyOStPdmpVK0VwRXFrWElYcm9VUS8yQ1U4aVE3?=
 =?utf-8?B?TXU4Q3pBRFJpUWk5UVEvU1AyTDFTeWI2bjdaNG9paCtqWWp3RW5ESy94VGlr?=
 =?utf-8?B?ZkpBTkpyaE9yNDNLR0dSdjJhcHk3TkNTZWxNZkVDejhWMUtGaTZkTWxVOTZn?=
 =?utf-8?B?MW5QNVdaMjBZK3o4eTZwcVJjbGdGcnlLMVZCejlOK1dOaG9kZGdrL2xpM3dC?=
 =?utf-8?B?M2I2VDFKMkFzV3VtY202WlJIYlZnWHpwakVScjRYQlNjTFQ1YnpNVEQ1ZWJo?=
 =?utf-8?B?SVU3ZS9EK1JML0hueFExRExZZnloVEFYc3ZvL0xIWXBNNG90SHJxZ0tuUFRJ?=
 =?utf-8?B?WFN3eDdGYXhNZ0NJWlorTGc4OThGeHFmOWdoTkduWHk4YXB2WW8yc3dTcmg2?=
 =?utf-8?B?R3RZN3dVUlh0bktzUFRRQkg4aTFmQlNtWDhiOTB5SmUvQWJ2bHgyd3RWSFRJ?=
 =?utf-8?B?SXM1WTdVQWxTc1FVLzNNNWF4V0FuQytONVVOd0d4SXB0M0ZvZzJUVnpWNU1N?=
 =?utf-8?B?QmZackpZc0FQTFdCRXlFODgyVHFTbXpPaWdFSDBkZ2tiazZCSkVtOHY0TkZH?=
 =?utf-8?B?VG5FcWZXTllTYjIvd2gydGgvTjhVM09vaGRJZkwwZThCVUMvZ3kvcVY3TFgv?=
 =?utf-8?Q?eY6Wx7aEV3tFsfssDalF4J27z1j4Uc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjR6SUhaSzdoRFlEaDZUNDIwSWwvNCtROVpOVTlPb1VFTHNWekpTV043RG96?=
 =?utf-8?B?RmtxNVpZZVJnbUNaK0ZqV3NkWkE4azN1MXo5NjNOV2h3Q1BncTRiUlFWbUNv?=
 =?utf-8?B?WUJjakY1MEsva1F4aThneUh2cyt4ZVlLcnNqMEV6NFRwTTBCY1NuYjFtVjhW?=
 =?utf-8?B?WHgrOFZCRlh6Y2tFN1A0eDdoZDJLU2xKdjRJNVRRcjlUOE5BYTkyb08zL3JK?=
 =?utf-8?B?aEdaV3FlSWZmbkpxajdoWUJtZ25VUjl4Y3FoMEd0TWpBYmlQNXBFRFFRemNT?=
 =?utf-8?B?aUtZMUJUazdMbm5WUHVsY1FhenVlTERIYTAzci94MlE5Wnl0cVZkYXNpVTI3?=
 =?utf-8?B?S1pSK3IrZjVXVU43a1ZUVjdNTFNBVk1QZlBVQ1RsM3lESW9HanNwdHF1WXA0?=
 =?utf-8?B?VHVXaExwSkwxdVpPSlo2TllzM0JocFl1Q09BOThiV0dwVXVpN1ZjNzBGMHJ3?=
 =?utf-8?B?cE9lOTlCNkhjSzNVbjRvWlFTcUtIaUJGbkwxTWZnUCtWRHVtdjNDdVdHTDFh?=
 =?utf-8?B?S1NPVURmVmo0VHMxcjIycVZWUXd2OTZRWTh1Y1MwWERaMXR4NXJCOHRKQ21L?=
 =?utf-8?B?OXJFcVdia056N2JBeWJxY1RDb1NJTWVORHhMNnM3TGpnTEtDejJ2LzBQRjJX?=
 =?utf-8?B?dXZZTkE0Zlo1eURiV3BqQmlsMUZBblN2SGZXSGNqcTF5eVQzcXo0VTIva3dZ?=
 =?utf-8?B?WkFHV0ErYzJ4YUMyUUgrNWFBMjlXUndJZnJaQ0x0Mm0wL0l1enEySWpLb1dS?=
 =?utf-8?B?VC8rYll2N1AvaXMxZStNMFZvcmR1cjk0M3VHaEd4TTZJMGJ3aWV0clFPcWF4?=
 =?utf-8?B?YWV3ZkhmSVZrVUFMVWZrUFNnRDYyTGxGTjhOTUZ6QzFMUjdmT2tCOU5YUUdq?=
 =?utf-8?B?Zll5dFl5VWQ2MkRIMVJjS2dmR1U5UEZMWHE2c09OOWUrblJOWGZpdVRLeHpP?=
 =?utf-8?B?eHdLdjFqY3paTG5TSG4wTzZ5Vk5qSnZwcGF5Sy9UcTBsdTRvK0s3YWVSYUd6?=
 =?utf-8?B?YlRDK3JUR3E4Y1FhREh0STBCVllLSlJxQUZESFlmdnJWUE9UMFF5Q2I3K2Jl?=
 =?utf-8?B?S1lRejY5VUh3TlpMWk82eG1LUVdLOWtpYUpzVW5nV0dzVEZMc1hrenZRVWth?=
 =?utf-8?B?NUpSeU9pZmFoTUl6REhGZjVuTC9GK3ZweDVqaXVhVUNsdFRiNitXRzJqVEZW?=
 =?utf-8?B?UUVxWDJkQ3M2WWlOV1JvR3FyQUttUU4ybHpjQlNvQVBLZ2hyNHFoMi9ScFB2?=
 =?utf-8?B?NFdrQXRvU1U2b092djlRWXByTUYwL09mR0x5OExIallVRFZIZERxZDlVTDZC?=
 =?utf-8?B?bWZXOEZBUnpnZWF5TDhobXZpYkVnamxLdk8vOWxUQ3lPNlQ4bS92OStEcVEr?=
 =?utf-8?B?eUd2WGwzVDBKRmw2UzhyVnJIQkRYNEVjSXZzZW9XRVdqTFlKdTQ5QlBQeTVV?=
 =?utf-8?B?OE85dWdTT0dYc05qK3dlVWt0czZWZm5KbUhoYXpwdy9rMTM0My9LUWFKWXA3?=
 =?utf-8?B?TmQ4eUVHbXJXUW9vQzEzMk1UNitoWGVJUlNrQzBhdm1jRDlRc3o3ZWRpcUFQ?=
 =?utf-8?B?MHdoMHpPQmd4VVU2RzZ5a3dwZEQ2WDFzazlhVFZoeGZiU1JjVWlmZWJVK2I2?=
 =?utf-8?B?RGI2blI1OGV4WlUvbERtN3BUaXQyYnRiZEtiVEh0ejZxcVJDc2FUSHRlMzhO?=
 =?utf-8?B?cW5zd1lkRnZZeGhJUHA4djRNdUwzOWxHeklydUZONHRqUlM0cGEyZ2tmR2lh?=
 =?utf-8?B?NEMvbktnc2tlM3lnaUwzQXFHOW1OTXUzMFZGaUZIZ0g2Z1F1bG04ZDUyQTNY?=
 =?utf-8?B?Zk85NmdQTkpFeGlUL0NpMFpSWlBaRkpUdWVGYUloM1RRWGVvdmE2L0NUMnFV?=
 =?utf-8?B?VERYQnVEZmNweEVnbzNkQnpvb0dLMm4rd2szTkVaV2Y4UHdCTVVaWm1hR0tF?=
 =?utf-8?B?QUk5bWsrNVRvMWVlZXB6UnY3S20yVlVKZStFNmlWaHExdnNoREw4cVprVVlV?=
 =?utf-8?B?eHU5VnZhaXZya2VqWnRzRXUxUisvQnNGZnNnWFphSkdUUTd5YTFrREc5WjNs?=
 =?utf-8?B?eFNxOHpER3EzNVRZZ2wveXBPSlpDL29YRnZPZEdFVFhDR2Y1c1hoc3Rsd1hP?=
 =?utf-8?B?SGRpL1NFNWsxT1RKWjMxMGNRMWxwbG1wSFlmeXFETjAwK2dPYXFxazRMemNh?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df5bb84f-a50b-4367-4b7f-08de10f317d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:19.7375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oc2FmiPwV/8hbGau39xm+h0FefDxSdP34hflGOtj5v/CO5ohqh3mYS6zMWukoOrd5v+wipoF8up4eVnITZ6VVJdFgY47HlISqHVz0kxkVEg=
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

Upcoming changes will allow users to control VF state and obtain its
migration data with a device-level granularity (not tile/gt).
Change the data structures to reflect that and move the GT-level
migration init to happen after device-level init.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +-----
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  3 --
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  5 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    | 16 ++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  0
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  6 +++
 8 files changed, 71 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 82c6b3d296769..89e5b26c27975 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -176,6 +176,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
+	xe_sriov_pf_migration.o \
 	xe_sriov_pf_provision.o \
 	xe_sriov_pf_service.o \
 	xe_tile_sriov_pf_debugfs.o
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index a5bf327ef8889..ca28f45aaf481 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
@@ -115,8 +116,7 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
 
 static bool pf_migration_supported(struct xe_gt *gt)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return gt->sriov.pf.migration.supported;
+	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
 static struct mutex *pf_migration_mutex(struct xe_gt *gt)
@@ -382,12 +382,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static bool pf_check_migration_support(struct xe_gt *gt)
-{
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
-}
-
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -403,8 +397,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
-
 	if (!pf_migration_supported(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 1f3110b6d44fa..9d672feac5f04 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -30,9 +30,6 @@ struct xe_gt_sriov_state_snapshot {
  * Used by the PF driver to maintain non-VF specific per-GT data.
  */
 struct xe_gt_sriov_pf_migration {
-	/** @supported: indicates whether the feature is supported */
-	bool supported;
-
 	/** @snapshot_lock: protects all VFs snapshots */
 	struct mutex snapshot_lock;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index bc1ab9ee31d92..95743c7af8050 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -15,6 +15,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
 
@@ -101,6 +102,10 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_sriov_pf_migration_init(xe);
+	if (err)
+		return err;
+
 	xe_sriov_pf_service_init(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
new file mode 100644
index 0000000000000..8c523c392f98b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
+ * @xe: the &xe_device
+ *
+ * Return: true if migration is supported, false otherwise
+ */
+bool xe_sriov_pf_migration_supported(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return xe->sriov.pf.migration.supported;
+}
+
+static bool pf_check_migration_support(struct xe_device *xe)
+{
+	/* XXX: for now this is for feature enabling only */
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+}
+
+/**
+ * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_init(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
new file mode 100644
index 0000000000000..d2b4a24165438
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_H_
+#define _XE_SRIOV_PF_MIGRATION_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+int xe_sriov_pf_migration_init(struct xe_device *xe);
+bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
new file mode 100644
index 0000000000000..e69de29bb2d1d
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index c753cd59aed2b..24d22afeececa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -39,6 +39,12 @@ struct xe_device_pf {
 	/** @provision: device level provisioning data. */
 	struct xe_sriov_pf_provision provision;
 
+	/** @migration: device level VF migration data */
+	struct {
+		/** @migration.supported: indicates whether VF migration feature is supported */
+		bool supported;
+	} migration;
+
 	/** @service: device level service data. */
 	struct xe_sriov_pf_service service;
 
-- 
2.50.1


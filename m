Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3142C2240B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E716310EA2F;
	Thu, 30 Oct 2025 20:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HF6v5sba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C93610EA29;
 Thu, 30 Oct 2025 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856338; x=1793392338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YzVgWcfTuAFJeL8ew9D510BkwhVAI3ocVBl77gqL7DI=;
 b=HF6v5sbaGxhSw32Mshnu0xTGy6UXq2WDVhexkYBCvFL6/djw2TJEo3UZ
 wcM5ILFbAMI4Lxd65+sIuGDLptAZtYGPczrD5CNLu5nXNPUI6IZA+SDvG
 qERKWUlTwPzCmfNuIVNpQiGc7QZU/FhMJtlDy9aD7ztVN4+l6ionxw2i8
 GAvJNf73M4MeKiejX+msBodSBglSAZI3mJu/8DcwQaGThgGywyzYUcBGM
 xob4ZvE9xf2yECSwcvNod5LbGcU2DD76e7R350AoD6d2rixMCs2TgJF9Z
 1HfzL01zHgxjFBXvN8+iQXUt2c8i2jF6TEXr0oRZTCtgU6YWaHL8tcrFQ w==;
X-CSE-ConnectionGUID: x/JQFaFmSpyxj3iPDDb2RQ==
X-CSE-MsgGUID: QUSJJmWITL+MXKztJdlI5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81639935"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="81639935"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:17 -0700
X-CSE-ConnectionGUID: ndcUHCg5SJ6djS4aXZArzg==
X-CSE-MsgGUID: lWiqwTyQQISlaX83Mo8AoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186492606"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:17 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFcgsBB5S6ub9ly+iW4Hk7OD8DCpv8LAyGAWI0eVC1eySzbM1RGQLN1lv34PXTMtfVhycDroWwVkYMHis355zJkSRqXnGCJ8LFJAKBp9PYaDwC+MS5jXZCwgkXpsV+NO39HJl+9hwZR6CqNziQ858U+RcHGnLcwRzeJqSQ+vBdBy4yUMv3kC/TSLlc9xbEkX6NljyO68BijMMsX6mwaS0bXd6prItI2GCq7ol4owL5hcBp2+smKjc5nW8b4N34dE85vqfrHreJzUhkVqDAahY3PDdKQQhFK4mJO4ZBk67zCvpWonst3E7Ph+56yV2t+Y7VlnnC26QfW8biWzm/7EvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYGSrldPZDDSDC1F/qbp95/CiTz4bhJnPePVp22JvFU=;
 b=tXFnqAUn7tuZvOk/7Wq87gTbdmj51lQEkSf+9+qxMxNELDta8n4ID5Ly6pdps48wmSTBL7jAQ1PNfSjXdpPho+VetFJ16c3ceg/+2TLsXeiQDkY0j4y3lanZ2uJbjNcmTyqsbxAMvYl6m6qSETZn1Lttnb/xrcczJwbLWYFO4jGvPCH3UNjTl9wR058YhzxATzuY/nj42HuG4ay0/fmPHHCjh4sVJYDihIcsPm8EttADSlcbf/zQ2cFAs40yQ/9//XFFSJ99QzZWcLlNFqKCMvzAcKbZporDj5tpQslhSuVLwwOUhfDYEFHB5exLKOln5leHzsvFh9qB3cndmnJB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:12 +0000
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
Subject: [PATCH v3 02/28] drm/xe: Move migration support to device-level struct
Date: Thu, 30 Oct 2025 21:31:09 +0100
Message-ID: <20251030203135.337696-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0212.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::33) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da57f94-556f-4761-d85f-08de17f367fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkUwUkVSdTZ0S0RTcDRrRFE1ZGhuNGtkYjNiRTlkcUJCaCsvR0MvNVduYzRu?=
 =?utf-8?B?KzRVWFJzUWNIRXMvSUhwYXVFb09ZWXpsVU9ER2RoZ0V1Y3pKci95T0xoRVdJ?=
 =?utf-8?B?eno5bjkzbCszSXdZT0tLbm5CQTVsdHdTNUJNK0pKQ1I0aE9NVGhFZHBXYity?=
 =?utf-8?B?Tlk2TEFEZ3hZUEdwWEZma1ZSbm44anY3MFJNVzJNR2lBQndUOFE0anpMMm5m?=
 =?utf-8?B?QS9FZVNMdlRRbW5DUFBQTFFRc2VTeDM3MGp6YWVIWUErcnhwVXZBeVBvZmhl?=
 =?utf-8?B?Tk40QjJwT0FPT2M5SDcrdzM2QXc0RDJUekxueS91ZjNRVXo3UllUY0N3QzBK?=
 =?utf-8?B?WlJxWVJtQ3N5cXo3bmdaQm01K1E4TmY3N2Faa1B3MDQvNDJaTEx4bnlLdTlZ?=
 =?utf-8?B?WWg4ZTVtdkV0YVI1L2tyMDBTM1lSM0N2YUJ0N1N2SkQ5ZnNVMlZCTlFldTY4?=
 =?utf-8?B?VE10TUFPc3ZjRDIzdTF2SGlCU2hHKy9DL2pYYXhJSGxkYkVjVjBxYmpPWldw?=
 =?utf-8?B?K0ZTNCtQcm12YUJsbnlQalljcjdHRTFXVERtc2praFhQYk5vMVJsYUR5UzhR?=
 =?utf-8?B?N0xKcWRoUXI4YVlSeXFiNE4zQlRiWVpSdGQyMXlhTVl2OU9CTHVBazYxWUc4?=
 =?utf-8?B?a0NPNFlJdW5UYWR0T2dHVzJwMHliUnBRbkVBNklrM0dlSHFhK0xOT3cvRmxi?=
 =?utf-8?B?L25Nc1V2aGRoQXUrVFRzdENmSytKeHNUMTkzVm9aOURobmpsWmlmYlhHOVds?=
 =?utf-8?B?L2xTTElxaWxzaDNRbkZXaU0yWW9Fb3M0L1VNdjV2d2tkcnhPaU95V1hWWWJX?=
 =?utf-8?B?NHFUMlpPRDFLbE4yVlBoWUQweXRqcFQxZS92di85dXZhcStmQjM5anMrK2V4?=
 =?utf-8?B?U0RmNituSW9Td1Q0eUtHeGxLWWV3NWVQcjQ4RGcrTkVCOGZtbGZrTDRSRDJN?=
 =?utf-8?B?SnBZNFdISjFYa2lSZCt1S2ZMSkNNM0lvcXN1dE4vUnZCdmMvVnB6elZPVVU3?=
 =?utf-8?B?b09LdUxGYzhsbkxCendpYmRSdXA3SExMQ2pFZzVZRjBnMTR2V1VaditteVJS?=
 =?utf-8?B?RFA3WmtCUFdXbEZTVTR3K1haWTJMbHZLWEdvWmxESEtBKzA5NFgwbWNVZGtm?=
 =?utf-8?B?ekVEVnNpeHVrWG9wWmZhVGlzSW10cGRmaHlucjd4ZXlsRkhjSW5LMDVQWHRY?=
 =?utf-8?B?L25oOWpUMjFpeTBObDhSZjRtM2lHbkZpMVlwdWtBaG5yOXVTSzF5UFcyREtq?=
 =?utf-8?B?Y2dCN0h3R0IvUUxvNjluMkdQSjEwSGhpZVNIczNMWXR0SlFzd3c0NDlNL2lZ?=
 =?utf-8?B?Y1NXQzdzVk40K3M2cmI2elRIUTlUV2pPdmxqaWd0NytJS0R4VDhEMFFhMm5W?=
 =?utf-8?B?QUN2MVV6c0d4MDJFOWd4NVlXNlB3eU9HaGtGUEpTYkRVVG1weXFFRENLRkpU?=
 =?utf-8?B?VTI0K3NkS2tFMEJjL1FyZ25PbjFWU0k3UlhJemszMWRnZ2xXbFhWazBwR1Za?=
 =?utf-8?B?NDJWL2FRekFOUTFEKzVDQ3kvTGhMQ2hReHdWYVd0WmxNWnBnT3dHaXFvMGg5?=
 =?utf-8?B?ZmdwMjc2YlhHTTJwOUhGSFMzbXNlRk1JSEhId2tNYjVkVXlyVzRrYVJFditp?=
 =?utf-8?B?bjR2bXROS0xOUXJDN3hnLzY4MUY5dkx2cjE3NmF6czVVQTNmUEFZQXY5SXNT?=
 =?utf-8?B?a3RoWnVWdFNYblNtcHEwREh6OEpweTh5NWpNK1dkL1hGS1ZMK0Z0RWlqNzg2?=
 =?utf-8?B?b2VGNENwNUpzM3c1djFBMUp1TllsbGZkUm1xOUlWUDdLaHM5QVk3aHZvR1lm?=
 =?utf-8?B?TkhIU1ZWKzl3ZHRNb3hUeS90M0cxMDQ0NW1NY0laekJMVUltNTc4SmhCMGJx?=
 =?utf-8?B?UXp4ckNGb2ladUFhbnFOSEVMVTFqMlMwM1I2QUtBTTQrOVFLYkRUK0NBdml3?=
 =?utf-8?B?RHJacjFIWUdrOE1mblE5NjJ5bVUxc2Y5OEc5MUhhSmlRcWcrQTRncTA5azUx?=
 =?utf-8?Q?1p/GGA9u4inzQvRjkRUeX59tec69aw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE5BcW9sNVVydk1xaFBLb1V0ZnlmSy85RDVQM293UndUREtuRFZKNmdIbHFk?=
 =?utf-8?B?cUhGMXRzSFowNUs4aU1VT291NXZMOE8xQWNVamoyUk9sVjJ3RW5YV1lBZlJk?=
 =?utf-8?B?REZib1BBSmErejFoWXpXdUNqWjdJUFdpTlJaSHMxZThTNnVLQlJqcDdXZUJW?=
 =?utf-8?B?Wm16N1VKekNPZVV2dkJhcnpOeWFpSndQeElqWnl3OTk0WVJVeENUQ3h4TTlw?=
 =?utf-8?B?VGlCdGhJZXBLbkFUMjdTaThHTXBabnk2MVVSbVFHbUxFU1ZFUEE3WGFRT1A3?=
 =?utf-8?B?TnYxZEZmZ2ZNQk4vRHY2NWJ6QzVnRkpQVktMSWR6TDkvTlAvS0ZERWx0QlZU?=
 =?utf-8?B?WVRFTTJnbStHNzd3MjJIc0NSRmpnbW5qWkdoRVV2Z3VIUHJvQzV5TWd2bWYx?=
 =?utf-8?B?czI3NG5ReHdLck53amdRbmtCdWRNa25RM0Myb0E2MkJVcnp6dDd5YVNUVHJn?=
 =?utf-8?B?cE91REZxYUJHSkprSmxOS1duZHZDczB1Mk41YVYxV3NzU2FNanZ6T0JTWElN?=
 =?utf-8?B?cjBmTW9FMzlmN1hkbndISzdFYy9ZcStMNXIvQWZQR2RaK052VUR5K2RNRHVy?=
 =?utf-8?B?SllnVnV4blVGRjZNYlJRR2owcWVDYm1HdHFiODNTdEE4SFk3UW1RNmRaRnRE?=
 =?utf-8?B?cVpKdFFsRW1ZYjZHeUNzTlZHdm1hYXp5akJvMWVzNk84ajFVNmlnYWsrKzFx?=
 =?utf-8?B?NXVRUkMyQjd1c3FJYjRCU1E4SUVFVFdJcjFsUkt1NDdzdnQ4UVFWV1NqMFJZ?=
 =?utf-8?B?NytEWWRMWk9xS3B2blR4ak9iWnJld0VkbVkzenhaMDdSRUIrMnk3S2xkalFx?=
 =?utf-8?B?V2NSNmZsS1dYLzBpYmtPbGRZTW1idEp5NjNYOHVncy9mQ3l6NnYxWHpudzNi?=
 =?utf-8?B?bEpNbVhhNGlMVkp3VUg5RVIwNlBqRktnQk0zYm5HaEZxSFVNdjJITjV2Yk9N?=
 =?utf-8?B?a0l2N0pCcVMwcGk1MS9PN1kvTHZJQWRsYzdqUWRmYmZCaXNxRlZsWlpsTG5T?=
 =?utf-8?B?a3B0YUdpa0RQWHpHcjgyTTlvT3BBR05RRi9VOUJaTUhhdEYzdW5iWi9xS2Q0?=
 =?utf-8?B?UU5MVFBDZUxpMHBiRTEvZzBJT0dKYmZkNkIyT1Y3c1R6dzZkcjdxVVlUc2M1?=
 =?utf-8?B?L3VQZ3FMVnVGWlVDS0lxYTNiRmdZVkRRZTRoZTUvcXFaYVlNUVVPSTFKQ1Nw?=
 =?utf-8?B?OVMzNkNxcUtaQnZBd3I0eENvZ3lXQnlJa3NHZ3B4Z1gzN2pFK01lSUc0UmxM?=
 =?utf-8?B?MFNmalBNc1U3NjltYTFEa3VZYmhtRytHOWpjYllGZHpOOTZhYlp3UE15Q3dl?=
 =?utf-8?B?YXhTeUFYRFNPN3hqcXNHZlpZd2J1YU53UzJudkRPbWIyajFuRE42YXdTcXN6?=
 =?utf-8?B?WHlxRGRtdXR5WTRFSE1IbndMa3RkeW8vQjhmSTZ1SjJ0OE5laTllNDNST1V3?=
 =?utf-8?B?UlRXMWN0VlhJMUdxdWkxLzJlQ3JrbTBYQ2g3MlF1TG8wQTQ0TWJtNHByNHl2?=
 =?utf-8?B?NVRIOVcwT3VYK0dhQlVoV0I4YXFpNVNlTExOOWJKUnN1NFpYQVZxT2ZIb2xp?=
 =?utf-8?B?dklXU0FvbkYzd24vRGdmY2lsbmY5UnRlNjdPM3ErcHdTMmh5Qkk3WUh0VUVp?=
 =?utf-8?B?TUhXVXhFbWxFVTVHVnhxOVB3UmQ5YSsxU0dUNW9LdWdXU1JXQmhYY1BIeUV0?=
 =?utf-8?B?Ui96dzRsVnFJUStTTjFkQVlmb1NEVTIzYXlVU0J0RHBEcGVoQitvK2EvRE9n?=
 =?utf-8?B?WVBDYjBOUVN5WGJRVjhwQUxHbWZlSjUrV29DR3RWd0ExdC9ueThxTkZiK1o5?=
 =?utf-8?B?elB0UlZCNUEzREpnMmx1c1hTUTd5cHFnVUdHUHloaGFqR3BXZ1Y4ZUphOWZw?=
 =?utf-8?B?aVgwaTF4SUVxdTJzZ1I1TGl3THRLVU9IM29rVlp3WFd1SE5Fa2JzNlRIbE9Z?=
 =?utf-8?B?aHFaSzdIN0o5ZFdBOVlOalgwRURBZ3NoQ2N0OFo0ak9OSHlkeXpTb2VMOGN4?=
 =?utf-8?B?QlpTamc2THphbWpXMTVQTit4U0FHZyt1TXpZMGJSM213WEt1blg2TVlCbk93?=
 =?utf-8?B?YmtVZmFtbGNIVFg1MTd4UG5NZXU2Z2RNQVphbFBTNXUxK0ozcXpLeGNmWUFY?=
 =?utf-8?B?K2IvbUcrYUNCRmRuZFh6UFhDWVVmdGdKc2pHV0tCU3RXSGlIRzl6K3IzNEFE?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da57f94-556f-4761-d85f-08de17f367fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:12.3512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h89mcTyw3cBKFlEemEw39BZaSHcLFLHCcaN7FXDHyI3H4bIelT64ICEttDPjsAh3DhCmSUGq/WVz6Mlxi3NrmLWaQbPvQKBLAYbCOiFCTj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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


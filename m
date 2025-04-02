Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D310DA790CC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFFC10E7E3;
	Wed,  2 Apr 2025 14:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ie7wCuHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7869C10E7D8;
 Wed,  2 Apr 2025 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743603131; x=1775139131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=luDF2Sdx2KVSQ5m4lKqpObI9udJNMyroUb4ugSNNWFg=;
 b=Ie7wCuHqkmL7vcWXf9bGwZC0oKjo5kzpnXKdPOjbLLmulvSNLChrX1NH
 W1rCR30ZzTkcTA/9seiI5KsXTpTCuAVqif/6sVwNnLIiPQkF1+NOZJinI
 HQ463CvP6v9EwlrhUtuo6ODoBCQ24xTLyFzoMZGSONCZgiOy5zEYvJyDH
 tD346lvEhlFH6H4oDtQEauX/+vcf7BpKI8tpWVlZzYNFzu1xI06rJXMTE
 /+r8jnrVGFyxyQNvRTVlVJPeDezqLqyammsMOMGhqV2rGmDoDXMjUjIfJ
 npGph3iSxyr/u5wr0QYk2OYn4JrHDiK6YfbbkFcgqTD19u4cr7nbNjkSB A==;
X-CSE-ConnectionGUID: p29IMcclQYWjQo9Z+tZDMQ==
X-CSE-MsgGUID: W9BSvO+ZQHO19tGQ1CPmMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44677170"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44677170"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:06 -0700
X-CSE-ConnectionGUID: /6ispDT8SpOk7w4yB2GJ6A==
X-CSE-MsgGUID: lAG+bcylS1i0085DR92eIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127620423"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 07:12:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 07:12:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIwx723fmq7F+fbrMo2EBOnoEuBR9o2GSev/KMXEM0fvcinci0hOl90iCoJ68UqllK1TdTnlsUpOITgMRAh+X6rpBY6rhOnTKzqQMBrJKlttSsT3ldEdbKmN3Quhxa/m21zveWxl1BUytXo4+GhFx+9NG/KcJ/OZBJeE9NpvVGY92c0AuVtVXwC9erue2m50U8Fta351VTA1Gqp8m362VAe/qT8wFzxAj0QbmsEHC3eXEhXxnJghQ8Eb4nzO3NuYmV+tXik5F0yT5jF0SZsdwgehxEDTDlQ5dvoZXMLqmx2ZiaEHlNTWF2Wnd/qJpXg78ol/ZhSAD5pITCHOgb9MpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ueZT6TffxGJQiUqEov+JWnO8IZEZetcax/CaDTXGnk=;
 b=PPVAacLHfX+xITP1iSFRWm2ojeX5AY7sGKOqEYJvR8k1WX3Tr7vByIEDJOOuzXhwbx/ML3Pb8Pxh3bZ2Ap1XjHz57+r+x1dWegQvqp32l/GWSZLqPyEV6T7nuMuDZY9k5PoYCRZzinA2GpiO8DI3XSDaf5XQo/KFeMM68TXzDEHt9EYaTeeXA1UnUDyFoW2u+f02aGJusAYzQuTXtz9rvN6u3AFO0qmeal+375ul440dunTB/k0AYmPuHRMH2UZt1/lIHZZMZP+xX6pjECZTK3x38F7dHtQPwxOaaah8BMdqGjVZP9gN5s+CxVTi5Cod7V7I563sH3HfATm5Z/iX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 14:11:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 14:11:55 +0000
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
Subject: [PATCH v7 4/6] PCI/IOV: Check that VF BAR fits within the reservation
Date: Wed, 2 Apr 2025 16:11:20 +0200
Message-ID: <20250402141122.2818478-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402141122.2818478-1-michal.winiarski@intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0127.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 61fcf376-a4f5-41e2-7227-08dd71f052cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWZoR1ZwYTdtSFlSTno4MXFhZjN0S1V6akUyeEdTVGZXVHlVUkFudEM4YW5K?=
 =?utf-8?B?NGpXZkpEcVMzN25lN1Z0OXBTRDFBSkZSNEtEMDBldUcwTE9OMy9PNzZQUjB5?=
 =?utf-8?B?aUpoR1lFdTJYTFBycUlLTWJvWlV2bHZqMjVRV3Z0MGhWNDhaWFlqTWJvVFNi?=
 =?utf-8?B?elYzU2lady9BRTFlSlFLaTdEVWtMVnIwQ0kxTktVemJEeUkzSU96QVlvY1No?=
 =?utf-8?B?Vys4Mi90bDJiRFBRemdQQkhiUHk4RXdlSUJUTmlCMzlFOVRBSCtKMVBKS2xu?=
 =?utf-8?B?cjZMdWNBcjNLTlFwSklFa1NQamd5TStqcUVMVCtKQnp2SHNxTEw2K3FhSjZk?=
 =?utf-8?B?V2lMclZ4Z2dPRDNEa1FyUXo5OGlyalkvMkNrOFVyWkQ5a0lyeW5OcDVsVE9T?=
 =?utf-8?B?ZFl1c2c3SmR2TGx3ZFJrWDI3RVB5YXNtT2p5c3FYeTdISitpL2ltM094OWhK?=
 =?utf-8?B?VU1BWkZrTnJwT3BhTXFXeU15QVMxWkVLekU2aDhtRndoRXllVm5Kd2NTem5j?=
 =?utf-8?B?L0tKVFJjVDYzV2sxNkRUb0NqYTNRUkVqa2d1aXI4dEsrT25adkZBaG56Szdw?=
 =?utf-8?B?RUtHc3NDRll3U3VYL01GbThUKzJNM04xTEYrYURVUGJDTklnQjVFRjFLcElD?=
 =?utf-8?B?aldhYTN3Nng2NXROZ1g5MG4zdVp0elFWUC9wL1d4YjJpTHdtaFloUVdkb2Vi?=
 =?utf-8?B?WW5uY3Ryb1JCVG9uQ0ZrVXVsNDhwU0syNXYzdzZGUjVHdVZtYUtTZXJHeU9j?=
 =?utf-8?B?Ym55cTFEQ0M3WE1ZMDZGQjBsNmxYNndDam5xQno3UmRlWmptaVhZUEo1TFNz?=
 =?utf-8?B?NHRiZDRlVE5vNWs4bzNSenJWZnpDeDdVbFhJcHNjTzBaMDI3Sk1aYzRPdFNz?=
 =?utf-8?B?UXdWK1E0TXhMamxkeWgwQlppajFiNU5xQURWMTZxV1dwTlg5SkczU2QwVTIz?=
 =?utf-8?B?ZEJJamZNN05VL1g4Vy9zZ2M2aGI3ZCtMRE1OTTI1czFMUzAzeHlzQ0FtZll5?=
 =?utf-8?B?dnRnbEs5cGV2NG8zckN6bVJWZDNFQmxMN2RTZ0NYc1JQNm03YjBiU1JPaGtM?=
 =?utf-8?B?eGxaZHFld2ZIYTRzUkpPcXV0blc2aTlVSEhxUXM0MEVnbGNOVCtiaTh4dWF2?=
 =?utf-8?B?MkE0SmEvOVRFWkF5ZjVJUmZ2cEgxQldpUjdBMWlYMWpKcXdLL2RqK2RkVXZk?=
 =?utf-8?B?U3Z6bTJQQ09IQU0vcVlLUlpYVzVIQmJIN2Q3eG84SVJkYzlyQ1p6R3JCQVlu?=
 =?utf-8?B?NTRJRTFEQW45UFVRNFNmTkFSVDNzQ2dUUnkvYTBDY3VhelVhUyttdC9Hc0RC?=
 =?utf-8?B?dHFJLy9CVEt4UCtoQlBGdi9Qc0p4anNuVEN3RVVQOE4wbkQyMWQzUStFOHhw?=
 =?utf-8?B?aG1nVnBqMnFOQVkycjlIL2ZHR1FDbitnMUlFemFHVkpTYUtFNnArS012VTZO?=
 =?utf-8?B?YUFWMlA3Tks1TityYUFHc2s2TncxdkJjZ2N0WXg4d1FESTEzY1JVblI4NzNa?=
 =?utf-8?B?dWdNckZQZGQwTHo4UVpMSjllRTk1dzdCc0hxczEvbVc4aUs5NEJ5NDZtRWY5?=
 =?utf-8?B?YlZuc0RXTHRIZjlTUVF5WGEvSmhzSlZsajUyckxHNlJGYzl1WElsd2F2QlZB?=
 =?utf-8?B?em02NldZUXJoYUhraHhSMXFsR3NzY0FJaFFqcHdMQlZCaFh0NDRNb3VsVnhQ?=
 =?utf-8?B?d3BTeENQN00vbG5YbDlhT3dIRFJ5VWRaemVWQ2xPSXJzZHJSa0QwVTA1ejIx?=
 =?utf-8?B?OUxtSHVYamo2V0lhOFl4UWZqNTcvdFFvM2V5RXdNaVJVaFFOa21hczVHeTRj?=
 =?utf-8?B?QmRLZXhhMnE5ZFoxUFR4WG5VRDI4V0p3ZHpLYVZTZk9iektrWW1ZSnlOVDBv?=
 =?utf-8?Q?NFnB8Qu68ttr/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkduV0NQaGxNTnNYbG5yQ3M3eEJ5R3U0cWVlSDMvS0lKTGJveVhoa0ZIcVFo?=
 =?utf-8?B?aXdxblB3elpxaGViSWRPdENiaVV1L09DNEhzYlVIK2pIYVE1UThSUzI5b1FJ?=
 =?utf-8?B?dGtBQ1VzYW85V3ZOMWkrR1hBQW9oZlJ0VTdVbDljNVZnZEVoVFEwamlzQUtP?=
 =?utf-8?B?NzJlZzdjcEkwU2UwUWJjRDF6QU5yMkgrdUtlcVI3M3BPSjd2bnlEWWNZNWM5?=
 =?utf-8?B?V1dIYkgrUEg0VjgrcWpjUXlqaGI1enFsdFFnUWxLSEtBOXdqNWZ6a1VHcXc1?=
 =?utf-8?B?VjNLSFVSUjdCUzQ3NG9EVTNGRndPQnA2QXJTRDF2aVBVTjFTZkZQRS8xZEVs?=
 =?utf-8?B?QUNTVGV1c2t0MVlzaXlkempPSEJyczQrNDdyaHNQSjFlaGxqZTQ0RjYwZG0z?=
 =?utf-8?B?Wk1IOUUxZ3Q0bFd5QThCTitIdUpLUFEzY0xsSUNqYnk3R3N0bVdGZzJseDd3?=
 =?utf-8?B?dWVvNzJlK2k5N1lPTVhpRnJoRXlZRXdFOFhxL29aR2pkS0xNUHREeDJla0JB?=
 =?utf-8?B?RmxXSnR4SmVzbkJsZEZKWmZaenhZd3dzeFAvSlR4WWIyUlZpMkNkZnZPL2N2?=
 =?utf-8?B?YVA1NVJSNHBiUytrZDZxdUhmcEhzYURzQnNxaE4zTkhZWkNlUHgxYzJ4alRk?=
 =?utf-8?B?OTVFVy9pcXQzWThWbzlnR0tlY0RVdTExemxqUEpGKzlSTUU0dmZoMmFOSWF0?=
 =?utf-8?B?MWtWV3YxcVE3UUpVQzd0NWRkRlkveXBJVjRJWUJIZzlobmFmb1ZFUlVZRG9N?=
 =?utf-8?B?L1hKQ3dzSHJHK2hka0FqTkl4MXZWVERxL2NFR0hmZEpGMjk4ZVVkK3JwVS9m?=
 =?utf-8?B?RjJPQzR1SVhNOG12Nk9iaXZjK2hsdGRPSHpSeFhHQnAzcWVPTGs0TVowc3dY?=
 =?utf-8?B?Z0kxT0tjb0FxRktIUFRZNXlWZnVURGloYXVWWWJiT204NVNHVzRmMTJ0Nm9o?=
 =?utf-8?B?OTRjR3E3SWFac1dqZkVvNlhUR1hyRHNDK0VQV2VFRXZpQXR2YXdpSmlnOEhq?=
 =?utf-8?B?T0t4U0pFenA2V2thNm5SMUVCVmkvczQ2cjdQZkQxWG45VUp3bXJya3V4VlFT?=
 =?utf-8?B?L3JBL2Z5ZGl1d1FiTTVudklySEdnN3RFWmtvcWF3NGJwUWQ2YS9RNTN3eWJM?=
 =?utf-8?B?ejF3bktOTzRhczVSUHNIR2xHRkZiaEJxMGMrUEw4b3RDTmNuNFhVM3J0WFQ2?=
 =?utf-8?B?U2pxRy9DSWNYdHl2MUViQnIrWDV6cmVpYnhGTDFacDdOZzcwbTcvV2JzNVZ0?=
 =?utf-8?B?eGtMbW5zZFNxbmFXMUhCWFNwOVBoSlNOTW1qQ3l0R2Y3Y1VqU0NXUUlMQmsv?=
 =?utf-8?B?Vkw1STBUR3lBUndBVW9lK0g1Z2dYd0g2MGZtU0lKLzBReHo4UnJ2MkN6Uld5?=
 =?utf-8?B?NWt5R0Y1aWptek8rNWpkY2Ztbk84S3BhQmRncGFHNWVHYU56WG94cEVYdm5O?=
 =?utf-8?B?dzI2R3JKblFUZlo1cXorcFRQMnU3Q01zOEpFYS9iek9aOEt2aWpNQUcxeTlP?=
 =?utf-8?B?NzlWdHl0QXVkODRRVGdwVHZUSnY3cno3cktTRmVrMHZPYkJ6dzZxSS9sR0Rs?=
 =?utf-8?B?L1FtYzVMa2hrZnZrTkh4MjI2b3BMSG1UdXRMeWExa0dBN1orVllRdlFoQmxN?=
 =?utf-8?B?cUdDWFdjai9wNnVHaHYwRUlZY1BwazZKbWdvQ1o3cndhN2ZIbGhOQktpM1R6?=
 =?utf-8?B?STRUTUhVVXZCZHVwNmlzNXB0cWpFRVpYVDlrUytZUUxxMC9GMUwrUEJ5ajFY?=
 =?utf-8?B?dUlSa09oVFlmN0xCUFA1M3hlell3dStmek1mbUN2WnVWdkxUZzI1NXlCTDk5?=
 =?utf-8?B?a2lYcnJ4b1F6VjMyTDVEMUZ6c0VkTmZFUjBsdmdSTHpVUFJiOFFoSVg4Q2FV?=
 =?utf-8?B?ZTFzMGZJVzNYanNodTFwekMybWthLy9UWGRLOVBzM2FrMUk2dmJkWUpwLzhF?=
 =?utf-8?B?cVdlcG1xWjJhRHNkeGpXbkdjUkVvUDRiQjQ3bHFhOXhJVUkxazhGWHk0dUFt?=
 =?utf-8?B?KytOQ25HTFRYRkVOTHREeG9KYkxsK3Z5OGZ1Y3dUeEVkb3NYcGU1TXQ0bG5l?=
 =?utf-8?B?YnY2OHhrT2lEOHdhaTMzekxGcEprTGdkVS9RWEJLN0R5YnJVU0pDdkpac3Vp?=
 =?utf-8?B?Qm9LaVpSOGRZMlc0NmZhZ0FpdGtybklwaDlHdTY4UHQxL1d1VmhHbGhmU1VX?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fcf376-a4f5-41e2-7227-08dd71f052cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:11:55.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C29O/bJfiTtbiR9YDfFR238o1GbVCTKtNnVY0J2VEc46MzeMTkt1kbu0XSDcKoQ+Ls78joeval7edU80QffA/VI2Jr6z0kREHX+28JzHV9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

When the resource representing VF MMIO BAR reservation is created, its
size is always large enough to accommodate the BAR of all SR-IOV Virtual
Functions that can potentially be created (total VFs). If for whatever
reason it's not possible to accommodate all VFs - the resource is not
assigned and no VFs can be created.

An upcoming change will allow VF BAR size to be modified by drivers at
a later point in time, which means that the check for resource
assignment is no longer sufficient.

Add an additional check that verifies that VF BAR for all enabled VFs
fits within the underlying reservation resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index fee99e15a943f..2fafbd6a998f0 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -668,9 +668,12 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
 		int idx = pci_resource_num_from_vf_bar(i);
+		resource_size_t vf_bar_sz = pci_iov_resource_size(dev, idx);
 
 		bars |= (1 << idx);
 		res = &dev->resource[idx];
+		if (vf_bar_sz * nr_virtfn > resource_size(res))
+			continue;
 		if (res->parent)
 			nres++;
 	}
-- 
2.49.0


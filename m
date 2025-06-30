Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D658DAEE166
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89CD10E240;
	Mon, 30 Jun 2025 14:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="ZMPUAvjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023141.outbound.protection.outlook.com
 [40.107.159.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7894110E240
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHe8TZ/omoGasXoJ77kQnXTlel8GWrjSI96f1IwfMansDDXwQsd3MExoOeo9xB+DGSJV2zLqdLYusTGlkOHe73cvW5wM231dUKw84jwIIque6QVJ9hIi1oyEtytBD41PEXmaHnOO4Fq/u9mCEZusMylA6GO6tyLzLmFQ26mdX1DPGBzKfj5VNFeOPUtxZKRikh9RdEA/yeofalZfKdt9Y9RnzgTbCfILqMJKoHkvda2NzXS8KJ/K0Bl0rfM5hQKvjiL5cQzXVqm1+zS3QLqJX7zGF5j9PoIzMgZIY8/DDHT1pY/DkwVNHoYkM8pA1+DD4OxAMQEllJniNCaZMAp+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jFg8vPafT8rpulAlA0jCAkpHSdMkjbPzIr1hHUYS90=;
 b=lOgPZt/TDpvJxGc6x59IbZ6jFGGmgw+F3+EUEOkH9vXcmLpuT1PGgIfl8psQYDW7FTh9v7mYFJ9Y8r4powroZkGzPow5FJXIc1zJCqfCiPflKO0NVz1lHqWkP3qkqcj7p6DpwZb5KVm2u23/zrW9DSeAL9C4yX/1SDRUdwzT44A9alP8fCRcnP6LzaHFxu7OZcKoWOBr39YQ7w9LHx+bKqk6imtMEKvZOKX6Gf69JzHuzaMMxe8DKfhCH7gxVyIUHnR1CLwIpywftnlpbGiWt/0+IP9lJURDcDPH31fa53qW8fCWQR93jdSwew1hzp8s/KSB/cFOtJq64DB8PqXCMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jFg8vPafT8rpulAlA0jCAkpHSdMkjbPzIr1hHUYS90=;
 b=ZMPUAvjoy+3oj7a7op3aN4cXf73Yd3k4JYjhbxenj5K4+QfVvKC479Rq+E5FrI+CLVZL4YJXXV5gLiEQwWhG+olDee9IVZKOYRPRqejSgiHUCRGdnCZW+Ihiq/NmaoGPHVcDhBnZM3A229qoOfGrPfyLkKtEguzUgaOURgFV236eM2yet2GTboe77twNEkky4zoMxwLxrfqsp1BS7uGf0jTI+EB38ZuVPfmHodnDaEBm8jcF6DIEQmmHlnIimHrhMkKxJwx4Dsd0iHM4mt/3WYNEDUV9m4A9Bl/tPOWworOpI+Z1z05EUQl0CwMG26ofEoA97EUzdoLZEnmG0gIfRg==
Received: from DU7P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::21)
 by VI0PR04MB11069.eurprd04.prod.outlook.com (2603:10a6:800:266::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 14:49:24 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::76) by DU7P250CA0006.outlook.office365.com
 (2603:10a6:10:54f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.28 via Frontend Transport; Mon,
 30 Jun 2025 14:49:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 14:49:24 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com (40.93.64.31) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 30 Jun 2025 14:49:23 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Mon, 30 Jun
 2025 14:49:21 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 14:49:21 +0000
Message-ID: <21227b4e-d345-4e12-bbfb-b2ab5330d0d2@topic.nl>
Date: Mon, 30 Jun 2025 16:49:20 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630082123.GA23516@pendragon.ideasonboard.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250630082123.GA23516@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI1PR04MB9833:EE_|DB1PEPF00050A00:EE_|VI0PR04MB11069:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cde69b-0a73-4f95-38f3-08ddb7e54e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MWxTcWJuRnByT0hGZEZsdkNCbW0rN3JLZHNTblgrcUtuQ2tteEVsc0FpMlZo?=
 =?utf-8?B?VU9pTktSNk0wNm11aDRzNWN1SGxDeSsveFZDMkZHM01MLzFoeGozWndUd0xP?=
 =?utf-8?B?bnJnQkVzOVpxTktubjJYVVY0dWVmRWlQTHJjenZiWkl4dVhhTHN2eXBHR2V6?=
 =?utf-8?B?QVI5aEZBK2x2M3NxTlVuVTY1bVlNZE5vVmdqOGFtYU9HM3pXTTh6dlcwWW1p?=
 =?utf-8?B?NTRmeHJZV3IrNUM5TU1qUC9DSmw1elI3dkhXNm5kME5DaG92VEcxMWI3NmxO?=
 =?utf-8?B?K0tOTEw5OVlWZU9rK2t6N0JISSt1VDZ3cnNMS0x4Q2lxajIwejNZdExIWUhT?=
 =?utf-8?B?SU9jYmIxTHllMG5tRTUyYXdqd1pzRDNmY01IK2tta1poaHJMaG5ZT1dLR2FN?=
 =?utf-8?B?bDNJd1Jkc0pLYnIreFRhRkp1c1NCNFhVbGZCUTM1SDNYZXFRZm9kRzZNNFFD?=
 =?utf-8?B?YU5yT1ozQmxjd0haM3BxMkZrdUpGWTVJVUxxSVZic2RldXRsSGdmQlo2QU1u?=
 =?utf-8?B?RG94eElJd09IWWxyNzNUVzVLTDZ0N2Nld2RFWERmTXpNUnZpOTVXNEUxOGVq?=
 =?utf-8?B?VElNNEc3dU9XY2R6L2x4WjYzVUgyZFU5ejhIOHdIc2JQTmQ3OUthbkZ0WFVr?=
 =?utf-8?B?MGFlN1hDVEFrTW1xRmFidXp0eW9XMFBLNTZFaDJmenlLRHo1cWdiL1BmMk5P?=
 =?utf-8?B?YnBpTk5tczdqUG5aL3liRSthSVJwOTdla1N1aE9GVWpBeURhdHJXeDFVQmZW?=
 =?utf-8?B?akNrNEliZW5DSm5Ka2ZsdEZJaEQyT0NmWWxzT2dVWGFiRmNnWTNxU2lMUnM3?=
 =?utf-8?B?Y2MvaDZnQzc3ZUdkaUszKzV3MDh3WlJWSFRhd3BSOUNkSkxpcE9icTJOZDkr?=
 =?utf-8?B?VENWd1Q4N1YySWduZGN4YlpNL1JrMW4zRW1DYXRyVjZ2TlBzajJ1RDhTd1F6?=
 =?utf-8?B?M1hwY0NMaTFhZUdHWWdudGFWMllOdXZBTDdCWFZKcjFyWGJORzhDYjUzbk12?=
 =?utf-8?B?QjY2RUV5dit5K3d3Nkd3OWZINGJ4b1BoNUg2ektUTHhsL3JOQW9TVFVuN2ZC?=
 =?utf-8?B?K0NUZHpyMjZja0Z4cU1vaitNdHFFN0JUbVp5clh4STBIVGJ0M0dVbFVLMWp5?=
 =?utf-8?B?VTI3aDEyUjRPK25JZXQveDB1TzVFWWJYV1FHSyttYWo0STdpSGhxN2pFeUxv?=
 =?utf-8?B?TW1tMDRtMFNKdXY4Z3ZWQ3Z5N3l3WVZrZnJhbVdpV2RkVGxOV2k3MzVWbXVW?=
 =?utf-8?B?TWxqS0E4cVphTHc4MUpvKzNGMEZURWVUOHdYQlk1VEYyYkJiMnZrMzRHeEsz?=
 =?utf-8?B?YVhkVEViUGlYM29oWDNDSjB6UTBlZXdyNTN5dmo4WDlQSHA3YmpnUi9sL3Fp?=
 =?utf-8?B?cDBHZmdYT3ZGVzArKzFOZ21tMUNSSlVhbGdMTGU3YzVtRWptNCtUSkowMVRO?=
 =?utf-8?B?WU13VnQxRytvMTdGZVFOdXZQUktwOHY3S045QUxBc1FaVVZZOEdTZmJzWGFW?=
 =?utf-8?B?Qyt6UDNQdXhNQnpvRiszdkVzcVErY1cxOVREdFI3Q2s5TVdxZXFyL1BjamMx?=
 =?utf-8?B?cFdVZStBU2hLZDN4cjhuV2c5eFp1OHY5ODFaT1lWWEZPaVg5UkhnTUo4dXpk?=
 =?utf-8?B?dzhSQnE5dnZ3Z1RNMkZXVVlLY1hDVTJPMmsvSkVoMVltbVc4R21PUDZESFA5?=
 =?utf-8?B?Y3ZRTCswZk42NGNnNFcveFczN1g3cjczQTVuWjZIUmIrd0NQemloNXl1YUlN?=
 =?utf-8?B?dmR4RWV0MDFKVStVNDdja2Z2RFNJRFpiUVdjNlplRjY2UXpJU0p1WU9kTm84?=
 =?utf-8?B?MGFhTGhFNHZuMjM2V1JZdXZKRUgxQzk4TjhBSTZGbVBsMnpuZlQ1NEhIU3hB?=
 =?utf-8?B?cUQ1dGg2V2FQamkxN25OcFhBNHJxV3duTWl1a0ZwMEdTSVcxRjRYMnFSK01N?=
 =?utf-8?Q?hzPLezgjiIM=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
X-CodeTwo-MessageID: 9346b306-1a8c-45f1-8703-07d58b92f508.20250630144923@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 922720ec-3093-4020-0046-08ddb7e54c20
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|14060799003|7416014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWNDUnpQNC8vTkdoMko5VWpINjY4eGpoY1NWaTFrU0U0ZHR6Mmt2QWNKejFH?=
 =?utf-8?B?a0wwYkYvWVh6N2ZLaFBSdjl2N2w0bFZhSFZzVWxZOERadUFROXdBWGVmcCtD?=
 =?utf-8?B?cXlQeUJNOGVYQTlrMU05VXFaNmkxSVpJazVHanIxeGwwbUlUWnlWYklHSVZM?=
 =?utf-8?B?VGxVc3ZKbGI2OVJGOFRDNUdnSHVzY2dqL2krZ1A1N3hOR3F6SE5ibmxUTThK?=
 =?utf-8?B?RmFGZmppUk9GV09jZDhpaFo2Si9LNGFrak5lNWV0RTFYSnBKc0c4Uk9Hb1RT?=
 =?utf-8?B?a1BLam5hWFdxYUluWnl4Mmc0LzU5UktVUjJiL21ZZXc4OGZEVXVMWC9pL08x?=
 =?utf-8?B?Z2ZUcEF6RVJQZ0NNdlpqMXRxMHRsV216aVJOZzVMdFdIRXV0OGZHUzgvMEN3?=
 =?utf-8?B?M3Y5U3B2VWg0WEZCYjRoeDFtQnNjc3RJYXdWTUlKd0ZuZ2dQQzlpN3FWcmJt?=
 =?utf-8?B?c3FrS3RCeXNzc2F1RVBycjRVcnhuRHJEWUFzZ09obUtlelR4bVlYSTFvdUJP?=
 =?utf-8?B?RllBR1BvMnNoVXE5S1RZNkN3bDhqUmZySHVCeTNwNVZlQTZJd0NyZ2ZGaUhH?=
 =?utf-8?B?VWpPeWdBRG9Rd3FDOHBLVkRYNGtDd1h3MldKUFhMYkdsZmdEdmlGWDZnTTFr?=
 =?utf-8?B?RVZEZEtwb0srUnNCZDNCbVpVT0ZFMUxNNmNSdEE5L2FkdG90OXRLYUpjZ01N?=
 =?utf-8?B?WEMzYUpKV1dxd3RyaHgwZkhRU2ZpTUFaVThnNnQ3RGZRcnJiRENiMlZSN2FL?=
 =?utf-8?B?NFZ6YlR4S0FrR2tlcy82dmxmcFA1UDA3WEVEUkZVK3V6VjB4N3JBRzluSjdB?=
 =?utf-8?B?RmpPODV2WVZVRkNuTUFiVXRMdDBRUmVCYzlaYW1WUWtYWlJRRVlRZHVVT0FT?=
 =?utf-8?B?S0JUaUY5dVJGN1pvS1VyREM2bzFxR2xkd3pEQ0xLRWJvYllvaGJqMzNTbnpT?=
 =?utf-8?B?dmF1ZWNXU2UyODZsUzhTMjBVWHZPSzF2RmdjRGFWL3h5QmlXVTA3YU5iOW1I?=
 =?utf-8?B?c0RGM2pPZHR5MXc3SThSZXUzQmxZWkpXcWNveVR6WjM5dCtURUhPaE1vbzAw?=
 =?utf-8?B?MFlLcllwOEdYZWtyeGZvUFRXd1FLOE92anFyTXpjWTFzZklveGtSQ3lpYitE?=
 =?utf-8?B?VWVhZTNWd0p1NXBTdm8xRWxIOG1GQS92WTk5TVVqakpBMmhIMytoTHBQKzBt?=
 =?utf-8?B?blU0RUh1dXdUSjhIbXdWeWJQUHVnRGxpaXg2U1NhZWRIS09HbkpRQnIzR0dS?=
 =?utf-8?B?MG9ZZ3hxeWw4d1BYc0N3K3BzN2VpZXBKeVU5cmZtQ0QwenVxTWZYWUlDSy9N?=
 =?utf-8?B?S3RNRThpT094dkRiN21paHJhaGJFbkJJbjVEa0FxUmU3Z05sV2t0cEZCVjVE?=
 =?utf-8?B?YTd5Tm5kZENPdGdZYnB6ZytOOHBGTkNtc25SbE5xbDZUOXV0ZEpKU1NRcXJW?=
 =?utf-8?B?b012OStxTW83RHlONml1aERwQlpnMkFFZDF2MkFsRFd3REJubk9BWWVGVm42?=
 =?utf-8?B?d1pOODJIeXcxdjAxaFYxb3lvRDJiOXU5QmRrSmJ6cjVWZkhTUmdxMEN6MVNx?=
 =?utf-8?B?bER0OEtaUi9nSzh2bGdOeVVyVmpQdmRLaDErSTgwUkJ4a0VMc3RUY2JvNTNt?=
 =?utf-8?B?aFZYQWNSOXdkUDRaRWZTYnBqRGxqb3dQb0duaThtVWhYWnhVSXVmNUVKNjdT?=
 =?utf-8?B?b3ZScWlsMXVtUURvVTc5ZXlKME5UN1lINHRyY0kwVFgzWExwUExNYVRrWjdW?=
 =?utf-8?B?Rk84ZXFnM0hOVE1DTlljOUEwU0ZaNzRwY0NwRHVPblh5Ykx2MW81dW9MN0Qx?=
 =?utf-8?B?NzE3bWlTczVUYzYzVW14NzRPV2ZjNzJBc2JvRzdqeVZGMWxib1Qrb2hoVUND?=
 =?utf-8?B?SlZkVi93MUJFTmVDSmgyTzdPZzNaNGt5NjNMNTRaUnl4RlRBVHF1VzNCcFR1?=
 =?utf-8?B?ekRSWnA2elY0MEFUY2Q5WGVwTU8xZGFHWmlvMTA2Mm56c0puQ0NiWEpHQmxy?=
 =?utf-8?B?MjlXby9IdTRRPT0=?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(14060799003)(7416014)(35042699022)(82310400026);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:49:24.1662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cde69b-0a73-4f95-38f3-08ddb7e54e30
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11069
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

On 30-06-2025 10:21, Laurent Pinchart wrote:
> On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
>> On 27-06-2025 20:19, Laurent Pinchart wrote:
>>> On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
>>>> XRGB8888 is the default mode that Xorg will want to use. Add support
>>>> for this to the Zynqmp DisplayPort driver, so that applications can us=
e
>>>> 32-bit framebuffers. This solves that the X server would fail to start
>>>> unless one provided an xorg.conf that sets DefaultDepth to 16.
>>>>
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>> ---
>>>>
>>>>    drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx=
/zynqmp_disp.c
>>>> index 80d1e499a18d..501428437000 100644
>>>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_=
fmts[] =3D {
>>>>    		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>>>    		.swap		=3D true,
>>>>    		.sf		=3D scaling_factors_888,
>>>> +	}, {
>>>> +		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
>>>> +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>>> +		.swap		=3D true,
>>>> +		.sf		=3D scaling_factors_888,
>>> I'm afraid that's not enough. There's a crucial difference between
>>> DRM_FORMAT_ARGB8888 (already supported by this driver) and
>>> DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
>>> The graphics layer is blended on top of the video layer, and the blende=
r
>>> uses both a global alpha parameter and the alpha channel of the graphic=
s
>>> layer for 32-bit RGB formats. This will lead to incorrect operation whe=
n
>>> the 'X' component is not set to full opacity.
>> I spent a few hours digging in the source code and what I could find in
>> the TRM and register maps, but there's not enough information in there
>> to explain how the blender works. The obvious "XRGB" implementation
>> would be to just disable the blender.
> That won't work when using global alpha unfortunately :-(
>
>> What I got from experimenting so far is that the alpha component is
>> ignored anyway while the video path isn't active. So as long as one
>> isn't using the video blending path, the ARGB and XRGB modes are identic=
al.
> Correct, *if* global alpha is set to full opaque, then you can disable
> the blender. That could confuse userspace though, enabling the graphics
> plane with XRGB would work, and then enabling the video plane with
> global alpha would fail.
>
>> Guess I'll need assistance from AMD/Xilinx to completely implement the
>> XRGB modes.
> The blender can ignore the alpha channel of the graphics plane for
> formats that have no alpha channel. It would be nice if there was a bit
> to force that behaviour for 32-bit RGB too, but I couldn't find any :-(
> It's worth asking though.

Yes, my problem exactly.


>
>> (For our application, this patch is sufficient as it solves the issues
>> like X11 not starting up, OpenGL not working and horrendously slow
>> scaling performance)
>>
>>>>    	}, {
>>>>    		.drm_fmt	=3D DRM_FORMAT_RGBA8888,
>>>>    		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BC4B436AC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 11:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7055510E9BF;
	Thu,  4 Sep 2025 09:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CH+DRb0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013039.outbound.protection.outlook.com
 [52.101.83.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9AF10E9BF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 09:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ21X4isaYwEHIc+L547YbeaNtgA88A3vGHHvkUDY152m0gHH8x6wsy90snHokwU/FBkhzdsnR6EsE0vlketux4XyL6O4KKJqXWuXziVeKGsaaNkPDcjL7BDVFFp5GrsT4mIHvgl9s85JlOMEJNI7TUml6QH1+vseMyzJmgPJSH/hXuDafMrWqFdjF8NqmQR6YANVwfNDEJXw/bZHl3Wpmcm1r9zBg+I1dL5CqnOB1BrUpN1HmDNYDPT2SHmM2qZjvirqK+duOSNJQfFgpPWaaySI8yl+jcjRBs2rxefMVrS9Q4agV6x+dotbWc/Ni0vxDotAzvU8/7CyXmS2zsV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkVxXGpneA0F6KITkRptj9Guss5XZosRe4l/x75JiaM=;
 b=EyRQF+0Z6rHCMKZ4vP9rgHkS75wcJGFyGK4cH3jtWMpT3bFfHRuZKrlnnConM7G49/61acRwJKFPwwErQ0vVxuBOzwmvM3NydUUKKTw61JHmnEwTEaewMFT9cXbdZnom84Ie1vVQIpfd52MH61tjfKOr1I9jr3rRVT7JFCvUn/pGzN0fv8VCc22fh8+kpFRmYdP/QeZcR9X2Ft+DCBx2fvIqXycAap9Hi4xAGmbPenCRx5c3LOH0dOwZP0CniAdgLzN+UhfZP9GeMnfvGP12VqnOD0biJ6eZ7G/jifCXiM+1hwWs8oN1pm2E4qIYAuC0b437TqcYjMg8psDML+oz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkVxXGpneA0F6KITkRptj9Guss5XZosRe4l/x75JiaM=;
 b=CH+DRb0D3k2+3RS1fFViakwZwUwmJaylkCSl3ESKNbnMo8Fv63oWm+gyVK4F+p3EpgNI9dDZVWNGhdZjinoC4hgWJqh6y8729k5nbtUO7AZHma0SICF1HMivO/9OXYi3JdBFIouYht2jZqjNVkzGQ9S9WuwCwrvEJjrtvppf5hktwc503zomxLHAaSeicC+2CCOmzNE2XJpA5vBJci27kUOL7xRINe/fyhP1NYF3WBsItnrOr8JCxLM/czMAnVb8ZrqHiw3xvl7lvcd+Ap6FZ/a9iqkIr0CCVkbOsQeP5bQE+ZyTmJ/APQfX8Vzw5hXCWwlG6uoSxSy+WOWQeE3ISA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 09:08:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 09:08:59 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 04 Sep 2025 17:10:02 +0800
Subject: [PATCH] drm/bridge: ite-it6263: Support HDMI vendor specific infoframe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com>
X-B4-Tracking: v=1; b=H4sIAGlXuWgC/x3NQQrCMBBG4auUWTuQxFjRq4iLkM7ovzApEymF0
 rs3dPlt3tuoiUEaPYeNTBY01NLhLwPlbyofYUzdFFy4uYeLjP8YxisvUqZq3GbJUGRG0aqWfsI
 pRRd81Oj1Tj0zmyjWc/F67/sBgZXYEHIAAAA=
X-Change-ID: 20250904-it6263-vendor-specific-infoframe-aa40214f41f7
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 21659e8d-ebce-4c83-886e-08ddeb92aee1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTROUGlzK2YzMzNzUHJxUlpsU0lIaGxncmxqZlg3enNaejFFRisyZHJoOHRK?=
 =?utf-8?B?ejV1YldSL3BvR1owcW1USDIvQ2F2cjNJWStTcnI4Qlp0REwyYUp1MTl1ay9H?=
 =?utf-8?B?QzJieW5zWUZTb29NOXJmamgxb2tkNnB4QjJsbVVDT1RxQmRiQnJXMGpyMzRq?=
 =?utf-8?B?TEhZWlkyaDhzY3VER2dTc2xGVEFybjdEWXNQQk9mekdROWthTmZWZStFVkZs?=
 =?utf-8?B?SEc2OG13YXBoZ3diWlFSTWttY056QU5kMGk2TmpDK2MzaEgycUlwbWsybklz?=
 =?utf-8?B?UVJVRURESjI0V1R1d20rUWhURm12bmlKMWF0VnRFQjVVWVdBQ2ZKRzR0eWNt?=
 =?utf-8?B?aVN2aEYya2JMNi85NW1NVmpJb3JYQ3cydk9ITjVDMGhTNTU3U0JaZjdWVi9O?=
 =?utf-8?B?NGVZN2pxcVVIOVJhUThxTEVhd1U2UnNKamJYWHFhL29lL05VelJmMnRxVVZ0?=
 =?utf-8?B?U3pENUhTVnpadWhRaXA2a3oyaFdFd0pnNWxZK215N25aMTB4ZWxGdUI5UWo0?=
 =?utf-8?B?WmxIOFNnMXFRZDE3bU5iOWh4WFNxcVlFcUt6b0pUMHV6Sm8ra01RUnJTc0RG?=
 =?utf-8?B?NHMvTktnQXFEaEFlWHFyekdBWGtSSUNlWmRKQ3hmS3lsMXNlRjlsdlVpUGFo?=
 =?utf-8?B?S01FWnU4NmE1TWpaQUpPbHJvZDZMM2JtUlU5Wk9jSng4c2Z2czQ1S2M5ckN0?=
 =?utf-8?B?L1RRQm4wSmdRdnBtWDhnekd1cTkyRU5rVGZNUHU3V0VPcmF3TGQrbVIyRDdz?=
 =?utf-8?B?aW5KeU9CUWQ3cTl4WHFCQWF2c3N3NEVia1RvMnMwWmg0MGpLMWZ5c1Yxd3JV?=
 =?utf-8?B?KzJ3RWtKaC9iemQ5NjJTTmgwTVNmTEJxZU10Q085K0JoYktEZjlrOUtKSSsz?=
 =?utf-8?B?aEt5YkNzdGRhcDdiOGZTdFlrRVVVNjNBN3RiSGdMOVJPSE95QkRmQnRXZ3J2?=
 =?utf-8?B?UXRiZVlSQU1XVjZ5NWJPaWdqa2t5NWVJajRVMDNiWW9qcEUvbSt5SzczdUVl?=
 =?utf-8?B?aTlkUExzcm1BLzNwUnlBSjhZK21tRVJxTG5UOHFEdDlXWjRNNXNHVUxTeDJk?=
 =?utf-8?B?VkIyTG5IR3J6ZzNwcklLVFVGYktZb1F2TDdKZUZnVHhwUktHVm1vVndPSVRw?=
 =?utf-8?B?YUVid0c3SG9WTURFUEJLYmtHbzBxcUQyY2Zxd0kwWVRuYndidFAwQlhqWDNJ?=
 =?utf-8?B?dWdOMWxvV0J3NkJRMGtHMXdaSVY2Ym5oT1NzWUkrdTNKMXBHb3U1eEZVdC9h?=
 =?utf-8?B?ZGdvVlhzYkljRzh5ME5nMmEybEhUc2FFcUM1OVBiKzQrTnB4WTUrWUJMZS9J?=
 =?utf-8?B?aytSWThhQ3RXMHRSSjNSQ0Q4RDFsY3Vha0ROWmtUVTh3TFBqLy9CMVZLTHgz?=
 =?utf-8?B?dXBWcW9kTHYvT1k4eVREMjRYSy9GVSszZm9BdUJFWTgvU3czMmZ5OEI4Wisr?=
 =?utf-8?B?ZDNvUFpTdzAyc2VWRkQwRUZZRmxtWnlJS05YRTBsOVJtcDZCMGRJZjVGeExI?=
 =?utf-8?B?eFJQQVdxUml2enE2QzFaVlFlNUFudVNObytwTitmMnhEQVZPVXdCVm9zblM1?=
 =?utf-8?B?MWpTVFM4N3FNVTArSkNCN1NTV2FLUEdjZEZ2QzFidDBmd2xXazUzSWxsM3BV?=
 =?utf-8?B?emY1TWV0b3o0MWJXbVRKQ1lRQ2E1cXlod084eFZOWDBFZm1zV0dySnRqdEpC?=
 =?utf-8?B?L2NaTTNDWERtRVVjN2xGcjh2ejlGSER3eCt5cWxIVmJLM3o4T3lkUThRVElr?=
 =?utf-8?B?SDJJY2hXTEhqRE5OZVRpd1p1bk9pcVMzYXdtWGRINHNLK21JU2tJcHoxNmtu?=
 =?utf-8?B?alJsdmFFZkVKMGQrL2UxdUNJWVdna1ovaVNZMEhwTFB3bDljUC80SkpseEdL?=
 =?utf-8?B?TUU2N2RKU2gwUkdFbm9ISEhLRlNqZUhBMzdZNGtkZHpqZlQvTXVFZXFqVkcz?=
 =?utf-8?B?N2tRQ3hPWCtyRjdtaG9mNnVnSzc1TitwUjY5WlVSOUhxbXRrMXZ0TWh4Tzd5?=
 =?utf-8?Q?Pra7bQNJx0Jw6nAoHiMuh1+Eig2M6g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWxTNEgrSk81R1VLS25SVjAzRlZXK2w1NEI1WE9FMFViM0FUTGFhTzZnZ1pk?=
 =?utf-8?B?R0NQNkRWOGJCL0JxUEEvMFQvNDlLSERrN0sxNTl2T09sV2VoV3lsOXNmMUg4?=
 =?utf-8?B?WGQvL3AyWGlLS0xQSHBPckZTc0x2dXhielU2RTZTVWpWRjAzc2o2cUdPKzZv?=
 =?utf-8?B?eEFuV002L1NsSWZvaDA2eVRsd28wU3Y3Z3BmdjFJWnIyYmZRSWh0SzJMOFlM?=
 =?utf-8?B?eHkzTVVDUGxZQVpuQTF3SXJVbDlnS25MNU54amNpT29CajF0VHhNd1p0dXlI?=
 =?utf-8?B?anBLcTV1cVcyWlR2dzNtY2JvVnNSVGdVWWFhdkVSTUdZK3VUNEZNWGdiZFRL?=
 =?utf-8?B?SWlxTnZoQ3NjVTFLOVFpYzVGYlpIdnhoTHljTUdFMlFvd2lPa05paTUycUVB?=
 =?utf-8?B?NzA1b2tTSzVsS2NpSGpFT0VLV3VtbFBIQ0d5bG5GZnM4dTJ5Sm9jdnZTSm8x?=
 =?utf-8?B?Z3cvTndCRGJJSkdWVVorM2l4Wk96VnBDL3R4YmVCZGQvYVV6Yk9TckdiMHJH?=
 =?utf-8?B?NFJHSVhJekdidENPNkxIWTAxTUx6WCtwak5INlYxVm1qMk53UnFKeTBld0Nz?=
 =?utf-8?B?T3RFbnBGWDM2L0pUK1JQOWRsYXFpSmR2NTF1akNXWC9lOHlsalo4L1hhbWpK?=
 =?utf-8?B?cERDNDdqeU43d0xQSFJFQkVETmxxNlFsYjdqSU9Oc3UwOGVSNyt3d2VpMXFD?=
 =?utf-8?B?WHMzdFFvaE5ReDk0TmFpcGN4RjBtVDM0K0RrcWZZSldOYU5FZkRJalI0NGEv?=
 =?utf-8?B?ZlFOVE03OHpNekpFUFBCRFlLejVCK3BITytxM1Jka1V4VzVTckhBWnc5N3lv?=
 =?utf-8?B?eDdGNGxnTEFWQ3pLZEpUR1N6bVVOdEcwWm1ScXNET3Z4TUZoZHZYWi8vMlF3?=
 =?utf-8?B?blRXRkJSSW42c0NCRE9Mb2xUWHgyWHM4UjZtK0hZQklyL0wxb2R0VS9NQ1ZZ?=
 =?utf-8?B?SVJkZXZDZ0MyUHhtV2E0V284WXA0WVBBOWdPOU1BZys1cXNrNHVLRmNuMW9w?=
 =?utf-8?B?Q2prUTlEdG13N0tQL0ZNeFBkaklSYjBSeU1ObjBCbTczUzN4ZFBDajR5Z2lK?=
 =?utf-8?B?ZGVvWm9NWVlkWVBTTlBvYUtFend1N0ZXb1FSUEd6WUh3QlZqOTVLbDNiWWFM?=
 =?utf-8?B?UWhDcmpqc1RYbzA1N3hsbkU1SUpzeTE0SzZSbmdmaEErd2VVT05reWZuV3lI?=
 =?utf-8?B?QVYybnVYd2orWlRmRGx6RDdqTnBnVG80c1F6NW5jYmJ6dTRma3RQYWdsUXpr?=
 =?utf-8?B?dy9QcUtGK25ieXlvSFNtMVFXcFlvWDRFNWRDbER1OUNRS1ozNkJyMFBMbDVY?=
 =?utf-8?B?M2lwUjN2TDFuT1UyaWxhc0drUmZ0UStiMURtMnMzNTduSXFyVGJ5RGQxclN5?=
 =?utf-8?B?b2x2SkpRYlNXbzhiK3FyWFRIUGd2eGxNU1dGV3JMZy9nalRnL3NWSFZ6NHJQ?=
 =?utf-8?B?ZngyeW03cmU2RjdwbTZTSHBtY2hYL0hCbFNIM3FSa0FYQ3YrdEUxZ2RIUERF?=
 =?utf-8?B?WTdsVDMwMzh4dVJ0cVFLYitsVDhYUUhzQmdzdkZBRkFKN2t0NHdLYU11UlJZ?=
 =?utf-8?B?dVdybWNFbjZ6OXBYYTZZRlg4dmRiMHNMTHIyTXVXRlpscmRXaElDUHI5WU9n?=
 =?utf-8?B?R0RFd0EzSHJFU1lqQjIyNzUyYSs3bkxQY2hlMFd6bEFyTVhvWWNGdXgwSnVQ?=
 =?utf-8?B?Q290dHIwZnVXNDdJcGpmMEwva2hLNk5xWlZRWXlYMm9mRHlQTzg5Mlo0R3U5?=
 =?utf-8?B?ZnJVcndTdE94UWIvUVkvUWdqd2hJaHUwYVF6U2lYRnhUbUx1WTJmNm5OV3dS?=
 =?utf-8?B?ZlowL21aaTg3c2ZXRnN1VDBnUXhhUzQ3VFRGbVFNVkJzZGNac052cmN5cGJx?=
 =?utf-8?B?anhybmV5U2xVTXgvVjZtdHVVMXI5S1dKRmMvVC9BWFBVaHJ0WGRQNWgwcWtp?=
 =?utf-8?B?bFQzNTAxeXh1bzhNOUNhQzAyMzByVkl3QkhPQ2hWSzU4ZmtpVjV1Ulh2ZlJr?=
 =?utf-8?B?MkExMVY0amE0TWpVd1k1Nkg5T0psdXJ1YmFQQlEwMTBvYjZ5ZzZqT1pHd1Y2?=
 =?utf-8?B?bVUxYk9Yd1ArZDIrb204TnljcFFOMmpjSmZST1IzcXBPbDA4cHFEVW9PSFlq?=
 =?utf-8?Q?AIEfKeXkD7DZyePh6ZNc9f5iw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21659e8d-ebce-4c83-886e-08ddeb92aee1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 09:08:59.0385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXr9I936u0pYlPmDOjLOxUTFGpgmwj2kFdppvYIasn/8kNg0SplZ8/yeBcZ553l1n7ga1dV5TS6ERztVM46ILw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
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

IT6263 supports HDMI vendor specific infoframe.  The infoframe header
and payload are configurable via NULL packet registers.  The infoframe
is enabled and disabled via PKT_NULL_CTRL register.  Add the HDMI vendor
specific infoframe support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 72 ++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ffb8ab5c524c6414ee7b414cebc018..0cc5e44b325afe177e0da41cdce753407cec51e7 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -146,6 +146,7 @@
 #define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
 
 #define HDMI_REG_PKT_GENERAL_CTRL	0xc6
+#define HDMI_REG_PKT_NULL_CTRL		0xc9
 #define HDMI_REG_AVI_INFOFRM_CTRL	0xcd
 #define  ENABLE_PKT			BIT(0)
 #define  REPEAT_PKT			BIT(1)
@@ -154,6 +155,14 @@
  * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)
  */
 
+/* NULL packet registers */
+/* Header Byte(HB): n = 0 ~ 2 */
+#define HDMI_REG_PKT_HB(n)		(0x138 + (n))
+/* Packet Byte(PB): n = 0 ~ 27(HDMI_MAX_INFOFRAME_SIZE), n = 0 for checksum */
+#define HDMI_REG_PKT_PB(n)		(0x13b + (n))
+#define HDMI_PKT_HB_PB_CHUNK_SIZE	\
+	(HDMI_REG_PKT_PB(HDMI_MAX_INFOFRAME_SIZE) - HDMI_REG_PKT_HB(0) + 1)
+
 /* AVI packet registers */
 #define HDMI_REG_AVI_DB1		0x158
 #define HDMI_REG_AVI_DB2		0x159
@@ -224,7 +233,9 @@ static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned int reg)
 	case HDMI_REG_HDMI_MODE:
 	case HDMI_REG_GCP:
 	case HDMI_REG_PKT_GENERAL_CTRL:
+	case HDMI_REG_PKT_NULL_CTRL:
 	case HDMI_REG_AVI_INFOFRM_CTRL:
+	case HDMI_REG_PKT_HB(0) ... HDMI_REG_PKT_PB(HDMI_MAX_INFOFRAME_SIZE):
 	case HDMI_REG_AVI_DB1:
 	case HDMI_REG_AVI_DB2:
 	case HDMI_REG_AVI_DB3:
@@ -755,10 +766,16 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
-	if (type == HDMI_INFOFRAME_TYPE_AVI)
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
 		regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
-	else
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
+		break;
+	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+	}
 
 	return 0;
 }
@@ -770,27 +787,42 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 	struct it6263 *it = bridge_to_it6263(bridge);
 	struct regmap *regmap = it->hdmi_regmap;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* write the first AVI infoframe data byte chunk(DB1-DB5) */
+		regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
+				  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
+				  HDMI_AVI_DB_CHUNK1_SIZE);
+
+		/* write the second AVI infoframe data byte chunk(DB6-DB13) */
+		regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
+				  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
+					  HDMI_AVI_DB_CHUNK1_SIZE],
+				  HDMI_AVI_DB_CHUNK2_SIZE);
+
+		/* write checksum */
+		regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
+
+		regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL,
+			     ENABLE_PKT | REPEAT_PKT);
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		const char zero_bulk[HDMI_PKT_HB_PB_CHUNK_SIZE] = { };
+
+		/* clear NULL packet registers due to undefined default value */
+		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0),
+				  zero_bulk, sizeof(zero_bulk));
+
+		/* write header and payload */
+		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
+
+		regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
+			     ENABLE_PKT | REPEAT_PKT);
+		break;
+	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
-		return 0;
 	}
 
-	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
-	regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
-			  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
-			  HDMI_AVI_DB_CHUNK1_SIZE);
-
-	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
-	regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
-			  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
-				  HDMI_AVI_DB_CHUNK1_SIZE],
-			  HDMI_AVI_DB_CHUNK2_SIZE);
-
-	/* write checksum */
-	regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
-
-	regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL, ENABLE_PKT | REPEAT_PKT);
-
 	return 0;
 }
 

---
base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
change-id: 20250904-it6263-vendor-specific-infoframe-aa40214f41f7

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D7BA7CFF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C37910E050;
	Mon, 29 Sep 2025 02:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WWdI3Sn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013043.outbound.protection.outlook.com
 [40.107.162.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017BF10E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ/ckbIbN7nbojDjTUcQwbXji+pYbkumoVJOL1wTPsrJuZ2OPUjuXDRRNDdpwHQH4zBHmSLLR2cQqk282FrRl5y9CKqU9sc4cKNjTSVR9WgX7zIMhOJulb3FHNBrB2jUkfZZnW2wD7LwFayBMd+MRlBBX59hdN4puSfeqK5CrimIQ9h6s9rvA0AjZ9X8TIgnXX4AEXA0mNizlJrFOz3HyzVadanogVkxuVMxf4Fm3IvgoZyqPo6ifREzzXXMIRvtSCGW12Z7c/wl7ET6/8DxtOFWfdhqc49grBzK/QwaizGG2cdnAfY9Rrv3KIA3MZzjs9w+JZCgV/FXaXXd2Tsj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=uVoPg177VynBcV3VKuC0/njI1z2PO2VjGnIeGykh9L98evW55jnQWrqSWCZe/MG9tJVwPSPnmal1qPNlZTdgAYFIIn3sBgv2lNNpxTkHq8wKmL9AmahLcJroexqRHorLYUZugBFZPVV3MbwtCBTpEkOzISjXhyzZhH90OaxAn1inSEVRoocM4yVRf5A62vqfOrv3ZcCl8bpvXyHncF237jiSvqNZmxRfYqY7o9XCP7rN8cFzPKcHOt9/Aeum3uAtN6bEVt7t5527URwql2ZTkdwGXIyUZ818nZUPHJSz1KlofZw6pyyWxUhdi8z5JTYoUDiRZNmwmFq4OrxnoY4n0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=WWdI3Sn1LgZ6XWNXDtVDfpyqeUhspDpzB8+NfUDgCDHsvL85qViuLSuCySmFVN8LCq6ouBeH6jWAyeHOznYrrj3JhizPtpI/xQmU/Eku74DJBmeivRfVLBYmea+8vvup6PHG/pW7mxtYylXeTztll7wYwWF162oCs8BZXBxTO/tmVlsDad11wXONQjxGg4qJvOYskNvdQJWuYsee4F8p2vMpUxBZ8+lHauv5GlN0MXeUXxxi0snxa+JA/3fHu2GJ6FzvPZ2n3/gMQ4GUG6V2dLUjSeJs9TK+zdSwSZayosV/KE8MFloHxMKn7zHFR4kPnJuWki1Q0bDVzNol68U4JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:40:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:40:37 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:37 +0800
Subject: [PATCH v3 02/14] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-2-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 449f7c3a-810d-4551-b9b4-08ddff01927a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJ1d2lRNjFNbkpkazc4bU5SaUk5RHozbGR4UmNaOVVWMnJWQnFtN3RvdFV1?=
 =?utf-8?B?eGxKL0N2dER3RTZjU2JQakt5UWQ3cnIvVmxvaHJuWE9td3BkWGtiTTRmOXBu?=
 =?utf-8?B?ZTB4MGZtcy9aNFB0UnFOSEUwQkVteUdiRFNLUzBDeERYaXg4alB6WmNqV0Zt?=
 =?utf-8?B?VEt3R0QrZDZNaFNZUkJlY2t0REhxcCthODRHbnB4dHJvcC9WdlNsOUkzdFR4?=
 =?utf-8?B?d09KUWZFc1h1TUlUdGJoZm9RTDJOS3hGMmxYLzdmTUpPdHlBNTN2NDR0Z0xa?=
 =?utf-8?B?OGtvREVTMWljdXNRL1N3YWg1UVlTRUlzTnFhVW1PNkdWRWtQMy9YcWViNjk4?=
 =?utf-8?B?cTVTeWNnRnVQWU9zOHhZNlpHOUJHeDB0cnFmMXJKdWJWdVllZW9tUGtPeDIy?=
 =?utf-8?B?a2Q0Qm1lc29yWGFKVXptL3Bvb2FyUU1oVG44Tnd5SXhqbHBwWE1RQi9RaGpm?=
 =?utf-8?B?Q2p1YnNpZ1dvWjdLU0paS29YQm1RTXcwWmtIUTNTL3JjVkQ3TFp0ZWFwRlUw?=
 =?utf-8?B?MXlEM25TcUpneHdiNk5jZiswUkhNY25FRm9ZaHFyVmdkMkdUakdnN0QwUkhF?=
 =?utf-8?B?Zyt4akhaV3I4T3pnQnZvT25pWG9OaWhYaTRCQWpQcEp6Mnp0NU9MSG1MNGFh?=
 =?utf-8?B?RFk1UFlDTUY2SWFOVDB4M3hqSU5EaThGK2l5SDBhNWpNNWVvb21BZUh2NUZF?=
 =?utf-8?B?YnA4SkRBMHNKTkgzV3d1WHd3VS9UeXducGxZaXpvOCt4UnpDRGdERUJTRjJL?=
 =?utf-8?B?T3BXLy9FaGFKbkw5NDAzVGw2aHZvRXYzVDM1MzBvMTBGVlpLdGZaTUFZZGpt?=
 =?utf-8?B?SFlYdllSMWlxeXZaT3NUb0VBVFo2RGNSdzlQUmVQSkNhOFhOd3FiSU0yNWJR?=
 =?utf-8?B?MmMvQ2F6WVF0L2FXZ3JuTW1YeTJjYyt0bFZYWnRaTFN3YXB4VkY3VmkvUmFt?=
 =?utf-8?B?dWlQVGYrRXFKbVFLQWpIbVhidE9DM3hjRFNlUHMvMG9HZmxUaDdzOEEwbjNN?=
 =?utf-8?B?NXFURlRvcThFVHc2YWdvdndrSVJmYWdJeWZ0Q2ZBbXFGcFp3NGNSb1ppSzlL?=
 =?utf-8?B?RnA1ZmF0bHloTDg3R2k1UHhYT1ZjTkY4ai9aVzhSRWpGcjQ5TEo2eFJ2ZDUv?=
 =?utf-8?B?Skx6ZDFEUk1EcWV1YVZzN3NycWgzdXNhczdoTUdjckFQN1FCV2UzbmFFTlND?=
 =?utf-8?B?clBDZXkvdnVTb01GbnZJcnN3R2FMYy9hYitUQkQyODZmTGVPNnhBeWhKN2N3?=
 =?utf-8?B?enFOdkhRdnhBNjNaZGV3QWkzYjI2VzVNa1poQWVVSFk1ODgyeURhVVRycnF3?=
 =?utf-8?B?TVZrRnE5WGhzYXpRWVRmd3REbkQ4WE1pU3NkVWtESEs5bmJPNkFmZnhuU3hB?=
 =?utf-8?B?RGNhejhnZDRkc241S1NqWThuRlBiek9FZ05YNFk2dmcyRXQycURLRUR5ZEtS?=
 =?utf-8?B?QlRrR1dEWVQ2RnMvTFpmMXJQZXpIejd2TG5yZjAxbjJUMkFvaWt6aEpRVDhM?=
 =?utf-8?B?MTgzUCtBbXRpenZzWmRZVjQ5YUx5UmUzQ2s2Qk96WWFkdXA1d2srd2Z3UTM3?=
 =?utf-8?B?QVRjcG1rM3RaZjYrdmt1THdKcGtaTGEzOCttaDFBMFVvUlFmNG9VRWNrZkN6?=
 =?utf-8?B?YWl1QVorbjcrRnVRVzYwSCs1TzZGN2VqRzJLTm5EankxeEVNM0d4bHg1NHBh?=
 =?utf-8?B?dklsZ1JvNlZVa3BEQ0JsYUxCb1dFUTNkOFNMOFlCN3d6MmFvR3JKOUEweGdT?=
 =?utf-8?B?czc0YkNORVlrT1dYN3d1Uy85bTIwV2hGNnRFd0U2bUxqU2tlcUlrUkN4SGdG?=
 =?utf-8?B?YW9HUzJTWi9EZ0RRV3hHS3AwMjVjSW8yTXdwdllYeVdDMVBLTGYyY0hrTnk4?=
 =?utf-8?B?Q2o0by9VT0tUdmZqOHVtYjVycVNyU0VrTjNGMXBhTk03ZEVyb0xhcXJiV3ho?=
 =?utf-8?B?aEtsQzVpMUNTMkdLS1A5TlNrQVRJalMyaFdtZXc3dmdxdlh3bzBzTG9CdEdN?=
 =?utf-8?Q?0uNeXnSTlz+Lg9uiqSkHrmQvE0XDIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkNUTjlSK0FIRDFTK3dEbXA2ZUFyaWswQVlnOVJVb1MyTXZJc2c2VmhPV3Bt?=
 =?utf-8?B?RFR3ZFM4cmZGVWhsWmo1YlNiaGhNSDZqMTdHNExWbUlQMG1oYlJtdGI1MG1T?=
 =?utf-8?B?T3hVQzFiSHorRHZVNkpxOGFuSlpRaHV2VnZLUU9XUHRZS0NTMTZxdG4reHRp?=
 =?utf-8?B?NW1KdXgrU1llVUswdXljWGR0WDhMUVZYTGk5Qnh6bVp3bVYzWlBEaWhpQlpW?=
 =?utf-8?B?VER0aG0rd25BR3UxKzN6eGo4YWVZbFlRODJtbjhOcW04T1YyNVMxMFlENmxn?=
 =?utf-8?B?VThycG1RTGlQTFhDS2lkT0FrUmVieENhMkV1dCtyTjh1ZzBBUHE5ejFQUTRx?=
 =?utf-8?B?TEZ1UW5mVk42bEwwdENGZWV6eFE4cnFNeHpTa0p4ejFtclMwWXc2b3VISllC?=
 =?utf-8?B?cGgvUkpYVWl2Q1hlSVhUSUJUazRyR1hrdUJNS3pWNjB5WDNCK2ZsaU4yWGEx?=
 =?utf-8?B?L3REblIzanYwdDBadHdpWExhSi9FMGI5Tk5uaklua25selZnVWtnTDhIN3RE?=
 =?utf-8?B?ZlhmKzR1cDVQWGJjRjQxM3lkQlJtUWF4eWpNKzF0TFVDZVVYVmg0cW1WdG1I?=
 =?utf-8?B?MnlsNzFZUGJIZGZWNUhwdk1PSmZUQ3g5OUFTbXZOQy9UMDhUcDdSdkRaWkZM?=
 =?utf-8?B?QjZNZGpZQUdCbGxHdGNCOEkySmpZWGlZZDV4Z2VDTU81Z2xjRk9VWktja1l1?=
 =?utf-8?B?WVBscTRHUnpUc0V6WkpDa21DQS8rN1djWHhZb0hjbnIyakRodU9kb3AzSHoy?=
 =?utf-8?B?dXo4ZUI4U0JOdnV2Wm1zell3MHQyYWk2RHpId2JGekRSaC8rYWtKQWc5UDA4?=
 =?utf-8?B?cmN2aFEyRFJ2Mk1MN1BJNHBqM3VKUk4wYjhEakFJcmVQUy9yN05OWmJ0eVBW?=
 =?utf-8?B?MUFBTnRUTm55akxxRVBrSjZaY2VadTFtYno3WGdYbzg4MVhZUVlzOG1aRVRj?=
 =?utf-8?B?azlveHk2M2NudzN0Y1NOeWJxTDhjRXJBaEE1Mkl3alJ0Q01SbDlOSUZPaW5t?=
 =?utf-8?B?bllOWmcxUzFzc2wrbnNBelM2YXB4Uis2dmM3SURwcUtWbjlITU5ZUFY3UWl4?=
 =?utf-8?B?Z3QxY0I3eWU0ckZoaHc5R00rZ3BqdUZsV0VtR24yZ0UrSStnWUpXQlk5Q3lC?=
 =?utf-8?B?SDVEN0VaR3ROQmJPK3g3QklxSk04MDhsWmYzZitWSXc5blVjM0RocThmbGVZ?=
 =?utf-8?B?WEtNVi9DVVJKS0c1UzBTUzZmUXEvb2dPL1BmNEtrU25Cd2JiZSs4KzhGNmxY?=
 =?utf-8?B?L1FjQzFlYTBlUzYvY3BwTktjTHpCSmxZTnNRTEErQlFnWTRMbVRkOEEwL1Rj?=
 =?utf-8?B?L01xaklYeFBzWFN0aE1OYUwzN2FBbm1kd1IxcjZxaTlhTy9RTzg4QlRScFo5?=
 =?utf-8?B?RGJqd1B0d2pXNDRuTU5GcWRsYU9OZUJxM1Fnb2tXakZQN2JxbWM1cVJRV2Nl?=
 =?utf-8?B?S2FEK2ViRGtVVmltaVZmVUVDeE15RnRYaVdaSDhZR3JkQlpLZEJuUk84TXpw?=
 =?utf-8?B?L3pXOXozeEhhZFZDYTRPRk05OHNsd3RGcEJPek1zNFlJZ2FZMHUzc1N3Nkxu?=
 =?utf-8?B?UmZBdm1FcjJneE16QTVoa2xYdERiTCtIcUVUTmxncnRiQzRIZjlkSzhZYlJo?=
 =?utf-8?B?QUZxYVZnWk9ZdCtZUlN6Y1JVRFhkNVJ1OG41dTh1U1JmejMwS1Jqa2xDMHh2?=
 =?utf-8?B?djBxWE1Ccm4yZDJrMHFNVVk2NjU3QUxsaW9ZSmJRaWhMR3ZLSElaV1RMYlJT?=
 =?utf-8?B?bFl0VVZxQ2xJNGlJSk5NSEUvUVBveVZ3UFFLMUwwcEwySFBFSURRRzdja1R2?=
 =?utf-8?B?QVNJS1MzQkNyMHptSVNja3ZqbXY1QXpKZE5IMmFCdmtyaVBCaWZXdEV4VnBy?=
 =?utf-8?B?TG45ZW8zbHBYVUo0aU5rVndsdWNMZWdmazVtZDljV1NOZDdxTnEyMStzWnBD?=
 =?utf-8?B?eFJFRlRsOFg2NmtQMjNncmFTajFhRk9SZVIwcE5nQnhhdFBieUFEbVNvT3hC?=
 =?utf-8?B?OWFMKzN5dCt5SXUxK1czQW8xcG9UemZyZDNGZVdPOURKaWc2SU05aUxISGIx?=
 =?utf-8?B?MG4vSGN5MDAweUcvejd0Q1lFUmFkVDVnWE54T21lUTk1aWFvQmdieitEM2lo?=
 =?utf-8?Q?M2iZWPmYRLeGJZAkuf0yeRcpl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449f7c3a-810d-4551-b9b4-08ddff01927a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:40:37.5181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVykS3RozEeboEvSdGwjuLAMi0UXDQLkU63ZWOM/VP2cz7BsLtrstD8qbj3uvufRwao2blqkF0Esqf+HyaB0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bd94254c1288d75f81662ef12b7f79209efb45f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1


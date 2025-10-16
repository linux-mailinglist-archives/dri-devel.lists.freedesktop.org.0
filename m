Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D07BE1BE1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B42F10E956;
	Thu, 16 Oct 2025 06:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BnxeO+wB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013062.outbound.protection.outlook.com
 [52.101.83.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2AE10E956
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJpbfVvJ6B/ybyjsdQUrK1zp/pMZvDalaegG5jcdDgMrrgdn4THRcjiMQBRn/UOVRmKGq9EfBTCDbDF46CZH8EfN3mer7EjmmXft0RYGHKcthRdG0FslFNBdlmCXK21pz1JM/RBb/xdWkAh0cxL3zysvDt4fvbuUPmHnIM3NhYhfHnm2AIvpDelG7uQEUmJUF4AyDrE5Fi/RNrCSFFbKrjeaWeXTskQh3WZurpM0o5ULct3mvZ2aBS0a6aMc6pOjBkmW8BduUr9owyJ1UkMjnTFfADcIXJZ8XLtoMpAMdSZPXSJBuAzavSh6KSfRXmF+ZnzXwMJmjjcNeVHpXj4NMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwDaYv5/cMfGnFFRJ90QjTnkksikVmdb3TO2/4Ta+/M=;
 b=MFfeld67uOOf+vnpmQ7KOPYg6Ih/a/XDVDLpN8DZCYOwJwlc65HaaOQtbPYFoKFuWVvXAQhE0J/zgFbP+Y9qcv91Ma6mKWmPH37PdKg5Jk1TPZu+o1Zpgtp73GlyiZN3CeK2tDza9qNc2RTfS6Icbc+cF8gElnpE1SkTGvOJ5u7YcKGFXAZmPfNaOvSTeHmee7IPXf31t5GXJKLgbjq3TTp1HBBYuceLyxE1GbIJsy6T4LGq04XhCpQPHKCuQFYbbA0fJfEUiyFyR7QqSQKizEg7N49ri5j02bK6eyjmgQc0eXpXEk0tzfctugxG5ASKCJqDJT22hySRFWS4w+CTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwDaYv5/cMfGnFFRJ90QjTnkksikVmdb3TO2/4Ta+/M=;
 b=BnxeO+wBMSoHXb92QweOI7WO2yW5EXN8VBOz1g1tvsPz/RULh2/FJ6I8zzMXyeRbhWvdH7eE/KY/BMxfE6FyhwAsTySNQZY2dC1IdQT2iKHJtpQRdZ3QAEYV10HayNB7z+Ar5i63H81zS91gFa5n4mjluYCTYFMSHPGCWVnU5vI8RzUWY21cbfZWuUBq7xFeBGry4QhSeZoQ7wT0dLvUzVTvgenGpTnTwKQVGAOKnlEesBupozEzZ+9Cb5xJfpujPiWMqf6YiMbK+mBs3zvwQ6/WYOU8XLMgEkygyaHZmCnswWWwrcN3jFF0zBZYaxiCYRI4oVdLxTyp84XcKsdKeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:33:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:35 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:29 +0800
Subject: [PATCH v4 11/14] drm/imx: dc-ed: Drop initial source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-11-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be4b0a3-1bdd-47b8-b88a-08de0c7deef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmd4aEZ6N05MdXNhcnl6OENDQUU2UE4yN2hDRUFXME1iclFMRjkrNlZhUEZF?=
 =?utf-8?B?OHBSOEg1cnFTZHltV0lKbnJIUzViMXRGNFNTdUlvVGxEKytxeHFDaDZtd2RM?=
 =?utf-8?B?Y1A1T3BvaW95Q1ZWQkxobEttR0ExSi8yZjIyd3FpY0xUeCtEYVk2NGNDRDNB?=
 =?utf-8?B?L2R1TDRtME13NGVMMkc2UU1kM1IwSHlQeGdZejBxR0lBeXhhMm1uOXFrbmlC?=
 =?utf-8?B?VVRwY09hTzFJdHRmVTJGQjVXUVRrcFQ0aFBaSi9MMGxFd0RmNTZSbkVMUGlJ?=
 =?utf-8?B?SjkySFlSbCtCLzdaZFdwRDNPWEQ0YVpwRktnSXp0TUdoUmlEWnNNMUdVUEIy?=
 =?utf-8?B?REEvWW5aUnhKcktBVW9QNWgxRm4yOGFvV2trYVhUOCtYQS8vVFpCWmFUbXhJ?=
 =?utf-8?B?d0Vjbk1YSFlpZkFJazBEbDZ3Q1NabDFBbUVkazZpZXhBOFdsc2xUSWhUWkVX?=
 =?utf-8?B?MzJpS3lzakdnWE84S1VlaURxZVp5NU1NTFRMa2IwWFIwUlhVMGcxb3RkTzF4?=
 =?utf-8?B?ckZ2ellrWjZFUHJZRElLaXgzVk9KY1lYNmYzNGpydXU3U0QyUEsxN2huVDlN?=
 =?utf-8?B?K0g2cGZXRTZrOWN0WUgxQ0dEWllHeFdwei9TNUZVMWJYYUtGU0lLU25MYUVH?=
 =?utf-8?B?WEpwVUNIWDVCSld1OEFvYnFmVFZiUzB2SnlLSTZSVE11cURNa2xpZ1FaZS9H?=
 =?utf-8?B?bHp0a3d4WHdPTUpsZ3hYUlE4R09Za3h2WGlFR0MvWExBc0xQek42Vkc1K3pT?=
 =?utf-8?B?NmJQRUp5cFZkaGtFYjNnWEVJUDRYc2owMXk2L2g0Q21NOWV2ek9ZdXhJQW1i?=
 =?utf-8?B?UEtKWGZlRnJlbElMU1ZrblVZb25oajFkYTRMSkZzSHYvWUw3WUF5Ump6THNT?=
 =?utf-8?B?eHhJOHFxa0pTS0tFQzczeUhOZ2NWZ3JscktzbVlNZm13R1NBMEpaVEVmeXRj?=
 =?utf-8?B?S1dwOWtaVDl6dW15OHY2WUIydUFLODY5K1NGR1hyU0NSTkJ0NFFBVVNiQmZs?=
 =?utf-8?B?elhNVENOa05FRkx0MmFDdkRkZktUNm1JL2dvTXdCemVQc2JSNUZpUHRQRkFq?=
 =?utf-8?B?ZVQ2ODJkQWJtUTFad1k5VnFmSDVObEUrVGZ5YjdrZ3o4dE9Nd1NSVkQzVWQw?=
 =?utf-8?B?bFNQUmFxeGp2VFdSM1k2MXRxSCtEQmJ1TEtERkl1dnJJUWE5bDNTTmJOSlF0?=
 =?utf-8?B?SVQvTFZUQ2xyZW4yaXJaWW8rVjFPN2xVZlZXVFBiUkZrSGF3alVjaVRYQ1I3?=
 =?utf-8?B?UWtkVndBQjhXQi9wT0JMSzdwaHloelhzUGdUZllKUXowOVMrZTdZQ0k3OEc0?=
 =?utf-8?B?NTZ6SnFDMGVMNVNjTks2NVh3cHRLVnV6MmVzN041cGVpaTQ0am1TNlQvaUhm?=
 =?utf-8?B?Nk52ejR1NmZkeHduTXNhbFJ0Mm42S1BnaUVTdDF0SW9Xb2g0L1BpTXRNZWF1?=
 =?utf-8?B?dkpiMWtDeEo4dzJ0Z25LMWxyS0E2TndTNzlYeDExNll2a3VjZ2xjcy9YSDBT?=
 =?utf-8?B?blhoWXJkNGNmeTgxWHlXWmwrQ3dLK0t4d3JRemt0eEpQSGczcmQydDlySGdM?=
 =?utf-8?B?N3NOdW1mVEIvV3JUb1htN3U3U1drT2tJQlBFcU1rV1BpTUl4U1BBYzJDTTNC?=
 =?utf-8?B?NE1yeU8rK0xFQlhWR3FtOHM3b01QbGFrTzRST2xFemVkdjN2d0tBVzZxY2Vr?=
 =?utf-8?B?ei9EUGQ1b2ttbjlKdHVWNUFuaHFycVkxVTh5dVhKUTIwVVJrR2lBWkx0bDdJ?=
 =?utf-8?B?SkRUcGdnNUJpMDN2RGNJN3FQUjRHSWZ3TjhkU2U2UHdsTElpb1RacXZzaVg1?=
 =?utf-8?B?b04yRi83MVlNdVgvR3Y0V3AwSmZKd1o0b3AvbjFFUmN5N3FKZVl2SmdQVk9s?=
 =?utf-8?B?d0VULzNuL3NVK1ZCS0F0QUNQbm45S3R6Um9hRENTalN0b0ZFL01VSnRuNzRL?=
 =?utf-8?B?amovZGNESTUxZ2dIeGdYRnYreW5WWnB1WTlmODVTMXpFMVF0M1VxNmtHN3Js?=
 =?utf-8?B?RDhUbGdUL3hjSGFCUWdoRmVOZjZiV2VKaVloKzFBd2g0L1JPRExhRTBpZ24x?=
 =?utf-8?B?OTdWS1UvSHhJL0k1VVIxd1dmUjlTV0FmaW1iUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlzekFUdWE5S0JxaC81RnVIYTB5NzREaXJoTHhuYWZqVXFiMVU3RWRUR3I2?=
 =?utf-8?B?eE0rVUhJSGs0bmpqbnVmbVpveHNZUVBkdHBRZlJoRTdZOENoWitHNTlab1ds?=
 =?utf-8?B?M3FwVmpOTFNMclB6UGMvRWFrR0VlYTdycHlURi9XUHp3MWVpUmRMWDRnc1Fk?=
 =?utf-8?B?eXZMUUhwRTM5emYwOXAwQ29JTlJ1ZlVSdlorcGZ3cFJ3SUNKaktKWDVjQ1VE?=
 =?utf-8?B?RStZT09vdmVTeFpGTlE3L0xIUkxXOWp2TVkrZzN3d2xUNERwd3NUQXZVMlhv?=
 =?utf-8?B?S3Z1cXlpYUhLVmhqSEdJK3VRU3FodnpjZlFPSTh1WVhKUlVtZmlIUisvcmNl?=
 =?utf-8?B?bkdXWmQ4Mnhvc2VNNkdUVDRnbHZmZFhMTnBOU1Z1ZU0ycjRHZENTS2UxVTJY?=
 =?utf-8?B?cGxVWDBuOVJjNm9KUUdvV3h3eHBmdHlPNDFzb1ZtcTdpMTZQd0l0bjJrb2xk?=
 =?utf-8?B?M2tkbDhPNzZkWFM1eVFBVlVndXhQaGtVaFhmRndMS1F2cnY4NkZPbStuNlR5?=
 =?utf-8?B?clVNMUxFOTd1cWlUV3hTeFRHd3FGd3pnaDVUU3FrY1BIbUk1TXBxQmV4MWF2?=
 =?utf-8?B?NUxVdENpMk1TYmtXK05kSzFFbnh3NlJqRUVMYVNwZWZ6UnNZRmpXSGJmOThK?=
 =?utf-8?B?c1VTZ2VBWUNGUlIrVjF2TXQ5YXYxZlhWWkQ2ZWpsSk1RclpiVDE1TDVZcmFq?=
 =?utf-8?B?THlWV3lJeXZyeTFtd0d3QlJaRFFIUWFnQm5JSy9jaXlwRlhOelNUcmFPWEkx?=
 =?utf-8?B?THI0RzRhKy85MXRrRnVmWFg4cW1wdVJDVS80ZGFheExzalk4eXBVNm1GOUcy?=
 =?utf-8?B?M2o3NVFZai93aHBtNjhDK2tpaTNvTFc5MHpoZGJtU3V5eEdmSDB6T3pORENY?=
 =?utf-8?B?enBwUTRGcnBCRXl4bTF3V3hnTVhiMHM5OHZzREc1blRrd085TTd2TExsQnll?=
 =?utf-8?B?NDhrL2N5TGZFd2wwci8xWmNGMmRTeldBNllDZnlRRzV0blhVY3NISUlOVTFi?=
 =?utf-8?B?UEtLeG84TjNKcGpkUWdmSW81MU9GU3Ava2NRa2ZqS2o3bjhPb3dqUlhCS0Y1?=
 =?utf-8?B?R3M5RHJzelZkd2p5Wjl4UExoY1Z6MzZDa1d5TmlnTVVBM00xc1RtRklXSEhp?=
 =?utf-8?B?SjZDaFEyUWhrVWhvbC9mZWNDWEdmaHVHRldCVU9VUHlISFNJbmpOZHoweXNy?=
 =?utf-8?B?MEh4ZjdhTElJNlFNTXE5RVUwZVVzcUxORUg3Y1ppaHBReWhVZ3d4YTlQWTFY?=
 =?utf-8?B?VFc3dWYxK29zc252YXNFc292WFEydmRJQUk2a1pRN0lCNXhjODlhUlVqblox?=
 =?utf-8?B?cFQ5S3BKekMrbG16QklWN1ZpWUw0T0RURXUzcTNPQXdUb2tjMTJoWmQ5REZF?=
 =?utf-8?B?NVBhelQzMkVsanlCSUFwbmlYU0dWcHZmV3M3Y0orMGhwOHErNzh3c1VWMU95?=
 =?utf-8?B?TTZUU3JnQWZ6N0tieGgxVGhzSjNrY0Jna1crMzdhdENFQ1YxQ0R4TWtTQTJ6?=
 =?utf-8?B?TXliYlJBTU52UXJHQmw2cndyQVhvMVF5WDczeVVRemNKajVlWm0zQ1FOd0dv?=
 =?utf-8?B?NVFRZkRxUzZzcEF6dHN4d2gzUWtDQ3RIMzhrU1R3QTRDZTk3ZVVhcUVqSWpL?=
 =?utf-8?B?Sy9wUVdCTUxTTGdYWUZ6N2pEeXRQSk42YVFjR3NHSWdXQkxHNGk0VGlZSm1z?=
 =?utf-8?B?V3I0eG5LMzJFUkthOXhTNXhQOXlFcE1JcnAyVzVHZS8xTUNTQUpNZDJGNlBv?=
 =?utf-8?B?eGhiZmlGU0t5M3FQRFM4aEhhbmw4ZTVvckdWZ1JEaCtOTnNOS0U2NnFoY0tl?=
 =?utf-8?B?ZEEzZTFFbFkzWllnQUs5RzFuZFpma2RxRWNFaWJiT25lcXNMMzlrUThXKzIy?=
 =?utf-8?B?YlFHT1NSR3VzRW9nUXlBWmtSQ2JMSjlOVW9peko2MW04ckJLTlk3bFl1Mmtr?=
 =?utf-8?B?NWZqNjBrdFJlWGtPdmxDNW9GZ3JMeHo5dThqT3dsQk1JazdQdnZRZDNabWlM?=
 =?utf-8?B?VkhJSlpiN0pBM1YxaEZSVW1sTTNqR1h2QisvNkwyUllIeGtxd1hxY3h1UEtT?=
 =?utf-8?B?cE1yZEZRV0Nkemd4L0Jwekl2blJVMWZRR0JtTHg3eEV0d3c1NHZINXJmRm5u?=
 =?utf-8?Q?lnP6uBByu9tAHeGfbn0tyGnXJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be4b0a3-1bdd-47b8-b88a-08de0c7deef0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:35.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/AVNFHIxYnanBps19QBTB57H+1rN2vBwrFKFbJmtB8sjYvaKhsL7bnthTPzwEdCrqkVvCXDHtQHxcg3ZUZhrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964
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

It's unnecessary to set initial ExtDst source selection because KMS
driver would do that when doing atomic commits.  Drop the selection.
This is needed as a preparation for reading ExtDst source selection
when trying to disable CRTC at boot in an upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index c8cd15f9e32de4d86c2acb8764146af1c3663c1d..7ea305e81ad651d4f80a629a62075f80c5a25f58 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -203,7 +203,6 @@ static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
 
 void dc_ed_init(struct dc_ed *ed)
 {
-	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
 	dc_ed_pec_enable_shden(ed);
 	dc_ed_pec_poweron(ed);
 	dc_ed_pec_sync_mode_single(ed);

-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GZHGgWFeWnGxQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 04:39:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A785C9CC86
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 04:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E5210E612;
	Wed, 28 Jan 2026 03:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="A8zLON3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013029.outbound.protection.outlook.com
 [40.107.162.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822F710E611
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 03:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyT2uu2bwMOiTs9BAyExK3cj5aC4nIuQotSN/UxRyg0VMsQKeE38Cwf1xRdD9XOcUhKGsQy7IYiEZWGQxNSzdiDFq9PuJv1AVNuEaSy7NT4pXd+fm3v4lFwyA5PEuvJcDXIIuQ8D4DDjGI+ZXuyKXfRojwz5DtaONy9k04RyHjBg4PIbgCaFgSB/G3CoV6Tc52k7GJClJ/ylDdXfSe/dfLq/BBdmLWmCKr80s/Of2lL21sKR9AY5ivgi/139pB/pGTCCEAO5s8RrkeUjVM8xTsbLh7F+rgbLkmIxU7203uGamxZLlK761aojwlES99JU9adPoPDl93TIumWMRzHZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GO7q+sWSl6bW4lfshfKTKjYjmZbhBxAaF7YHzJj7678=;
 b=E4oN3BvZ+FQfoRlJD524uEea0nsC784yKgqzjk7Ya3gzWJZnfVsPhb1lZqZSUbMaN8T1KOKHG6FD8sHRdsV4xxWcL4+Zif64wOk2jO9DQq5LTLQzleoBpi51oFzMiMPj7nDH8E9FjUCzu40WSuTEELjM9P40Gosjq/mQzCEWJt10vjRJi4c0UF/1I0HyikHcts+ze84xaeMT6Upc5pdEEAiomLl5L8xFFL+j3zwZJOKCht9PxMZW6UM8KwFU1vC3lkeDC/g2ksWlZdY3QxCtjhKWiD60AtzA5jDe15LFwfeXUcAUW4HFJTK8HLvO3ziS0HplcMwkML/AoaH18i5KQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO7q+sWSl6bW4lfshfKTKjYjmZbhBxAaF7YHzJj7678=;
 b=A8zLON3O6F1WhpAdZzExZaoJF3Sk/H7kpwy6cV2XEuwubt7htSe7jQc9HrLruMv/YTECBKHQQUcQez7t3azLLttkek3uk1/CevROJBUgFBkw8aG6QnUiP9Mh1GBAkq3Scn1PKv7qlI/qCv0v9+n7vfTcwRA1X2cIAw8CvAdRbkEaOei8mI3ysnbtXeTmt/U8Eymgo+LVUWw7VvX37n2dO2uGfkOIEBaHkJySOGugTOS8LnxQCWPYia27gsl8di0EkSYv3Eytuvc2PnFyRJ2J792OOsl4ZcpjW+yKuXz3FJtySSADFB/cYhHwPHZaRazBbqS/IilA3QVXiGJ7nhT8cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10490.eurprd04.prod.outlook.com (2603:10a6:150:1e2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 03:39:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 03:39:40 +0000
Message-ID: <e70fe923-c33f-400e-9b64-79f0955e45d1@nxp.com>
Date: Wed, 28 Jan 2026 11:40:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: ldb: Document
 nxp,enable-termination-resistor
To: Fabio Estevam <festevam@gmail.com>
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, frank.li@nxp.com,
 Fabio Estevam <festevam@nabladev.com>
References: <20260120231930.2782444-1-festevam@gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260120231930.2782444-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10490:EE_
X-MS-Office365-Filtering-Correlation-Id: 38094e0e-8a72-4567-a11f-08de5e1edded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG1QKytMSldGdUNqVGFRWWV0WGxwMlVvNW5oMFpRdWV2eVp5MlhWNEliVnlm?=
 =?utf-8?B?Qys4ZWZiTG5JNkJ2S1VVZlZkOG9jOVZVYTRxRGVwR0VENTd3bmdGbnIwMmxB?=
 =?utf-8?B?eEVsbWhneVVtcUpxd2ZFNTJ2TzFNY2pRU0YxM2ZFaWxNa3c3L2dOTFZCQi80?=
 =?utf-8?B?R2ZQNW1WUm1hRkp3SHRhejJYdSs5a2xCb3dPQWx6Q0tqQm1FYkF5aTRqUTVo?=
 =?utf-8?B?b0RZREYvR0gwbFoyNUcxRHVlZFRoekRnMlExNjRPNlk0bFNKUElUS1VwaGsw?=
 =?utf-8?B?VGxwcEl5SjgrakQyRVNZSlpyWnNDV2U0bzF6aXVrMmNxSkdXZXNvWjBXclZE?=
 =?utf-8?B?RmRGSHRPTVhqS3loSThuQWhnZVQzcW45TjA5b1ZJMksrRFZaYW9oeVhkTW5m?=
 =?utf-8?B?ZUZHMDNZWEZxb2lFRFZIRTlyRWwzSjZZOFZVUVJNMkNKRDhhOHhVN1FXdm0r?=
 =?utf-8?B?ZE4zME1yaXk1SzNUbkxtOWVIUHVxWDl4WFhyamdCNkVCL3A0VGw0K0dBV2FU?=
 =?utf-8?B?dHBFYTJGWW1SRmRGZ3l3eWE0N0JyS1UzeFRvM2U2YjdOZk4rMy9aWWtKK0ln?=
 =?utf-8?B?bkgrMHNuL1diZWFkSVovWHJ2Qytudk54RlRTNDl4ZmFSanphK2dWeHRPWGpS?=
 =?utf-8?B?RjBQKzRCOTk1TWJUa1ZaVkd2M2UrV0ZwcVNTTDBrajMzZWJMMVE3aWNEMHBa?=
 =?utf-8?B?clJ5dnhwTTg1ZzNGSUttK0h1YmVDYjlra3FzU0tIbU1RMU03RnBQSDJSZUFZ?=
 =?utf-8?B?YlY1VU84WUs5SytqK2p6Y2c5L09FQ2FQS0hGbXdobWlwZjVMQldXNHV3SDU1?=
 =?utf-8?B?bGRwNzZhY25DeFlkcjRQZGZpNmhzRE41eXdwMFhqT3cxdHBzNWlwRU9tQytZ?=
 =?utf-8?B?ckt0cFE2eVRGNkUvNDJkWlozT2pJcC9iQVBySjExYmVjdTV0MnRQNXNTMXlx?=
 =?utf-8?B?OUIwNHljRnFwOXFIamZHSE5abkJaTWZDVDgvTG1HOTQyZE1scFFteWV2WTRt?=
 =?utf-8?B?NHF5NWI3OG1nSmtoRmJjcmhJeGZOTHNPQnZCQU9lMEZSV3lsT04zWWVtRnZ5?=
 =?utf-8?B?czF3MGdoODV5MzliSURqMm1SUnNtczVCU2k3Y3Awa09UcHd2WDVmMXRtMHo5?=
 =?utf-8?B?TldDaVpQSm9BazFyUjhBUEZ1WUEzOWQ2a3YyS25VNkR1cVIrbEVkVjZRZ1hs?=
 =?utf-8?B?NGljb1RzbllYdUphM0ZITlViL3pCdzdKZE9LajVGQlp5cDZUdWxTdDJkWnBw?=
 =?utf-8?B?RGlVWmF4b2prU3hwWDFTUGx0NnRoZC9sL1NBNXE2MHZHaVpiZ1JQNzl4dWc4?=
 =?utf-8?B?YUZLMDdENm9waXdDRGdRMTIzRTh6L1l5WU1jNHRhNXMzdFd3dit6emZNQTFM?=
 =?utf-8?B?YklWMmY3Wjd4QllodmhtaGlJWWZnaEZjMHhHYzVseUtCV3RXeG0zeElIV0F6?=
 =?utf-8?B?WE9ucW00bGJ1dUszVFQ2VWx3VHk5UnpOSUdiWlRndjhrbVVDMHQ3Sk9MRjU4?=
 =?utf-8?B?ekNqaEh2eUhod0JMYWxxTGxwUWZPbmZxVVpZZXNQNEJiOEtHQXAxSS9ZNUt3?=
 =?utf-8?B?a2xhbHRWeTJPT2pGNlNoM2VMRDJHTDB0ZThvaWVZR3VsT0xhQmtyRis1dWw0?=
 =?utf-8?B?UEg2ZXJzY0VDdnk1dnAzd08wZmlVb3ZMSVJVMWl6MWxGOWkyRFFzQ2o5RFBh?=
 =?utf-8?B?V3UyTWp0SmpZREl3eTJ3WTNGN0lxd2N0K1V1N0Q1TGRBdXlvS3VBSm9EUGdF?=
 =?utf-8?B?RFNNWmR0VmdqZEJ2d3Y1MTAwbk1RZWphQUl3dGgwWXk2VUlHRTMxR3N1K3Bl?=
 =?utf-8?B?cnV1a2x5azVaV3U1a2JTVC8rNEY3RFdza1k3TWRDMTN5cUhzT2w0LzRTUERV?=
 =?utf-8?B?cldtMHNSVW5EeUMweHhMcHhFRlR1bVdDVmpOQnc1RGVxbXNaSkwyQ1oreXNV?=
 =?utf-8?B?WENzMzVjd2R6Zit2T2Jyb3RrbnZrbjZyTmU4SjJvR1IxR1U2dkJDY05CVUlU?=
 =?utf-8?B?Szg5L1JjNkR1THVRcmJjRWNmRUc2cXlzY1ppZEYydXVuS2J3aEhVUmVNWkJs?=
 =?utf-8?B?UWozeDc0djl3cUpnUWo2ei80aXMrdndiOFhXZnhzSnRYd1I1MmFlaGRQL1Rl?=
 =?utf-8?Q?YDYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdyVy92OHNoTXR6K0lGUnZCQytqak9rM2F2UElESUhzN3VnRmFBM0piZExD?=
 =?utf-8?B?NU5TUDlWenVlb1FTek5Ob0k3dUV5Y3h2ajYvUjVUeURFWmlld3NJcmk2eSs4?=
 =?utf-8?B?cVdyVVZMUXNNM0Uwem5uZzFFQ2VnYlhwOTE5aTlWTm5pV1U2dVFzdTNZVE5F?=
 =?utf-8?B?RWxnSVpQdm11bnkzVnZxREVQVHUxdUNsMyt6TkpWc1JoVy8xY056Mk1nUFMz?=
 =?utf-8?B?ZUFNcmhhWnZORzlURzJyZzdESGNYdmphSFVsRStBcnBqdFlmNTVDd010dmRt?=
 =?utf-8?B?UXFwOE8zTzU2WnZlTGJFbDRoY3FqZnRVdkNyR05yeC9zOGtsN0RRM1lGNHhL?=
 =?utf-8?B?RXc1UVc5SWd4bGlFaSt6b2Y4M3Z0cnBRbGwxVHNOS1psSmhOa0ZCM0ZmcmVu?=
 =?utf-8?B?OG43eDhwQ09OVDBiMU1KeXNzZTNXR1VvVllXMXJtTHlyQmVWaU9tL2NtSlRH?=
 =?utf-8?B?R0tXSDRNc01Vd3MvY2NmWkpiSmVQbDJVeWprbE9uRGxBbWt2RDE1WVNMN1dH?=
 =?utf-8?B?T1lnUEtYZWhUMy9tYnNsWUEzeWZtN003Y1dORVBaVHpaS0p4L203MWJ4clky?=
 =?utf-8?B?cHU0TlhHdTB5dG1BODdJRUNkTjVuSkdqckFSUzlrelp3Qys1RTJtOUtPalBm?=
 =?utf-8?B?UWJJL0FxekRZUnFTV0hVV1c3TVEvc05qK1pGSmFwTXluMjNXQmZseUZqVld2?=
 =?utf-8?B?VEdLM0NLNUcxVEpGNnBQUUQ1M0hWN21SRzFOVFdaRUVGT1BDdXowLzc3bDV2?=
 =?utf-8?B?Yk1HRGtLKytoRG5BV3NRUjBkYW1aTnFDUDYxN0JTam1RWEk0YjFVRGE1ajZ2?=
 =?utf-8?B?SU1FTk1ueW9EQjhoWGdyU1VwZXVhZUdKOE9IS1VUNmpOVXpMZ3QvdWhxb0Ez?=
 =?utf-8?B?aDB1OUNsMWlxbGVrZ2YzZFBETkFpcjlyY1c0YTJPWVNnUFVQWXpuMW1QT28x?=
 =?utf-8?B?UTBoWm9IVjlGcVNDcWNKZzBNbHdUQlh6ZzYxVlpmNGxqMFJ1UXNFb2p3QjJq?=
 =?utf-8?B?WndhZFhGWkl0azdsT3ZEKzN4eThCL3pPM1o3cUJmek4xblVGTUZPRTd2bzMz?=
 =?utf-8?B?ZmtDeFBCMlNDWnZ3OTFTYWc5blJJaGxjaHcwZEE5SGtwdTdDeHRBVHBuTzY2?=
 =?utf-8?B?VGpVdXZsbDdGdTRHSFEwNnJJK3dINmlxKzB2NGo3VHo4VVpiUlVFVW5Manls?=
 =?utf-8?B?UFhCdFhKejg1bitnakxFZjBubE1kNEVuODUxNTR0bnZhTThOTVMraEtxQVZx?=
 =?utf-8?B?b1psb3VDUVZQK2U1SXVNZjNmbHRGUVQwNFN1RVl2dTEyZm9mRzZkdlVYZ3Jw?=
 =?utf-8?B?SFRzNG5qT2RaOWNvbTBPZ21KUGxQeTZIRTFRTnNPQVlhZnl5eitNUWp3aUpZ?=
 =?utf-8?B?N0s4aFZnUDlIM3lGbHgvS2gzYVNMeG5yRWRRRFUveXo4TGc0S1c2RndSSDFH?=
 =?utf-8?B?elVVWkRUWlV5UTQxaGZ0RDh4TVRUNU9qS01IemNjUmQzcjVDYVBOMnFpWGpJ?=
 =?utf-8?B?WXlxUTZkMUx1czROSkRzbDBuNFo0cGNtcEpXdVlVRHR2MCt3ekRjZUdGRm40?=
 =?utf-8?B?ZXRybjcydlNKVDB3WU5rMHE4ZmhjZHF1a2FzRVFnR0Fac3Rzc0xRR2ZoVzhX?=
 =?utf-8?B?MlVZT2REUVFVYTFzR2FjNXJrK21LRDNTMkFCNTNkUVJSTnlZNENYRm5HUTBL?=
 =?utf-8?B?TmtnaTlBUjc0MVN3d1ZNanlZYmFWTGkzVG1WbXF6YVltRU0wSFhqTG9OTHVZ?=
 =?utf-8?B?MHFNTWd2YWgvWC9wQ1BWQnl0TldSQ0pNU05VczVWY2JlTlVjb2YrcGFPdDZx?=
 =?utf-8?B?bjF4OGoyS25NM0hwb1NqZkhXaldQRE5yNjNPWHdIYkFhQ1lnenRJajFwK3Rv?=
 =?utf-8?B?WHVlcHdPSjM3cDBkU1ppc0pjRWxobnJyRGxyTDlIMDRHRjAwaThXamUyZ0Na?=
 =?utf-8?B?YzFkaEUwTFpTUEh4NlBHUVNmN1FwOXRoaWNLZU9wVGo3djhRNEc5M3BjR2Zs?=
 =?utf-8?B?a0hXdm9qRlFXa1RRZ21EbHFGTkloN3EwbE9HUDUwSGRyT1VqRzVGb1ZMY3BJ?=
 =?utf-8?B?ejdjN21QZDBFRW5hazcyVG8zMWdEVXBNeFA4cFpUUFhNN01wQllnQzYzYXl4?=
 =?utf-8?B?ejV0VmhZK00rZi9WcVFJOWlsNTZ0Nm84RllKd3V1YUtnczFjZHVDRGZ3LzdC?=
 =?utf-8?B?MnJUWkxxVDFtdUtsd2orZ3g1emx0T0xKWmhnVEtRWm54dDlkb0Q2UWtqeGhy?=
 =?utf-8?B?WGV0RmlRS3Z5NEk5KzBweGZKVWhZQjFsbUhhUjFSTGluNVlBV2l3U1pFQkF6?=
 =?utf-8?B?VGVmRVc0T29VRmY5VXZQeWN6Vy9hcXRma25tNmtPUnlXUW9oRjdjZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38094e0e-8a72-4567-a11f-08de5e1edded
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:39:40.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWjamSfjLVdDS61Z5J/boH6EAfYlhzC12irUowd3nR2+goC5XaBTr1W2jFF0xWgR4AIwd/UJDUv1Sx20hoyrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10490
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:festevam@gmail.com,m:marek.vasut@mailbox.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:frank.li@nxp.com,m:festevam@nabladev.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nabladev.com:email]
X-Rspamd-Queue-Id: A785C9CC86
X-Rspamd-Action: no action



On Tue, Jan 20, 2026 at 08:19:29PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Document the optional nxp,enable-termination-resistor property for the
> i.MX LVDS display bridge.
> 
> This boolean property indicates that the built-in 100 Ohm termination
> resistor on the LVDS output is enabled. It is controlled via the HS_EN
> bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
> signal quality and may prevent visual artifacts on some boards, but
> increases the power consumption.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - Restrict it to i.MX6SX. (Liu Ying)
> 
>  .../bindings/display/bridge/fsl,ldb.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 49664101a353..7f380879fffd 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -35,6 +35,15 @@ properties:
>        - const: ldb
>        - const: lvds
>  
> +  nxp,enable-termination-resistor:
> +    type: boolean
> +    description:
> +      Indicates that the built-in 100 Ohm termination resistor on the LVDS
> +      output is enabled. This property is optional and controlled via the
> +      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
> +      quality and prevent visual artifacts on some boards, but increases
> +      power consumption.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -84,6 +93,15 @@ allOf:
>        required:
>          - reg-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx6sx-ldb
> +    then:
> +      properties:
> +        nxp,enable-termination-resistor: false
> +
>  additionalProperties: false
>  
>  examples:

Applied to misc/kernel.git (drm-misc-next).  Thanks!

-- 
Regards,
Liu Ying

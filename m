Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E210F8C7036
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 04:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F5F10E186;
	Thu, 16 May 2024 02:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="n9Qp89D9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2060.outbound.protection.outlook.com [40.107.6.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE5C10E186
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:19:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cab581aK1W745uP1Ww2FtqCV4Io08JNUZzGxnak5pWNwIuCY/KbF4czpzl5hBnVGcGVLuqeOpJc5pIKHNYqJPpxpWMQfg4XURzM3xTSwlZWwH0ZJG/ZQB+GWmpD9j/zKADWnQG6aIjoW4/p4jZboVnoCbqhlcj4vCXksBXVhruZoTIlLw3Nm50VkC491tj48Fx4EdDkR3a/OKLgroZRM6hNJJbj5/QVr/NROGKm24bKHJ+R/FtvyWeXAY2RCHxuZSPhVGf1E80jaWapjzJ04MVL0IhL4JyQaAQ8v3/Vgu912cfQ3V+CSsAXUkFk0HPxaorGLqVDiLNJ2tSwmBLZyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGI+0lMdP1nuFendXkb1tmle5zfWEMSEC7mQeo/rnBU=;
 b=Og6HYCJf117o86RXsb4GgLt3eY64KJXWddLQZgJdUWoRRNYl2WnbdJqlhR2exFJYovgXRwHfNZrr62xsxEZTB3E5lan2rmKT4omWK0ooeP0wDNZ+HJ2iDWC8PverEmdhouSiKc2GfD3ROUa1jSUz8rShMzx78Q9JE9rbPoEnMDmv8r08osFQ6F5v8ZoFhum82JdDHl0ZzDOsBXN5gLG6tylpNSj01/1N4mw+jjA+ZvORISYVaowwGpQ4ajA90ZiwAGfHetbqonf/W94CQu50Z8reYSM5XSAtqDmBtC8WnfTuCAjMUR7MjV1PJEu/A6QBxYlm5v7q1PO4ihoP/sT96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGI+0lMdP1nuFendXkb1tmle5zfWEMSEC7mQeo/rnBU=;
 b=n9Qp89D9AHCqbbcDXjdNQ9PSrBEn4VGByKPDYmHxHt43tyTxQ8MQchXQqrJMSjuUf8qY48AE/anMPLl5mCMrxEbz4iivi8wEHV11tb+9XCYTZTTfxdQrk+nBiWjqQJE5DeerQWVoapk0x5eAtVWPvhw+vGyGa/4s7zSd48dycOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7900.eurprd04.prod.outlook.com (2603:10a6:10:1e8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 02:19:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 02:18:58 +0000
Message-ID: <9f3c1825-0438-464e-bd6d-88da6a9c3b3b@nxp.com>
Date: Thu, 16 May 2024 10:19:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: display: simple: Add Microtips &
 Lincolntech Dual-LVDS Panels
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
 <20240515095133.745492-4-a-bhatia1@ti.com>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20240515095133.745492-4-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6446b2d9-bc4d-47f5-31c5-08dc754e8b55
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|376005|1800799015|7416005|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3NmNGhPcWVrL2NtWEdqZjFtYWJWdVZuWlZTSFhoM2hiL0tGcndUTzF6aXdt?=
 =?utf-8?B?WlNGK3RpS0hNLzYwQ2ZKMTY5TFpvam5pdmdUQUY4aUNma1AydjFlTXUreG9G?=
 =?utf-8?B?VFpYMFgvNGtLakVEN1F5a2VlSlpadHNvc0duVE1rRUxzZ29XRmxxODZrRE9M?=
 =?utf-8?B?cURxdTVKSC9sUzU3V2c1NWVrSU1LZmdxN0wva1AvM3NaVTVFaWZPdXo0bEtT?=
 =?utf-8?B?NDE0Skh5cTdqanA2TDRISmhtcDRZN0k1Q0Q2QmYrVWpPMkpTT1ZlRzJiRkZh?=
 =?utf-8?B?bnUycFVoU0ZjV0VaTW40dk1xMUhxTTROYkhlL2g4enA4MjYzNEw5MUU0TGdE?=
 =?utf-8?B?aEZ5Z3gvRmtsN2ZRbnRJMUNESExPSFFHeXo4UEVzbVMvS0dBVFg4OU5CS3U2?=
 =?utf-8?B?T2pDWWxQRkd5Y1VDK1k5aVF6NmtyRkdHNDdCRkJDVVRJekc3SWlxOGlKanUy?=
 =?utf-8?B?ZFVaN3JUdFZKaityOFc2RlpBZ0VVelNoK0hpZVM3aHJQeDN4NnRzVDNZMTBs?=
 =?utf-8?B?TGZ3QUx5Zm4rbzV5OGdsRkE0SzhjMTdDSGxYeiszUytiMVVUVC9ObG9lVlYx?=
 =?utf-8?B?T3ZaZnZ2VEt5QkZVSWtGUVR6d0ZFandSTHN3NnVzNVJ2RXljRlNkRXEzcGRu?=
 =?utf-8?B?TDVsNlhya3pKK1QzVzRFVjFmZ0FUTENQR2tRNmZ6WWIzbVBpQjhBUDlNTmI4?=
 =?utf-8?B?R3ZobGtlbXh5eURiOHM2RUVCa2o0cEUzUlR4TDZ6NkNSRTdQd1IzbzU4d3Zs?=
 =?utf-8?B?NFI0RWlrSzNYMkFpa0V5UmVaTWJ6a0UxeGpwdUJFMzU1enI1azFiYnVWallx?=
 =?utf-8?B?MFZ0YkpvRFVJazNONllPWTl4Y0dJM3lPRDFnZVlmNlB1MmdhS1ZYaTlQQjJM?=
 =?utf-8?B?cmMrajFtTUY3VXZVd0RzcXI2UFJwZDNlakVoWEg2SnVYbHZ3WUlrWFNPSU9t?=
 =?utf-8?B?c3UrT2RBYmxkN1p5QzRqTGQwVlZMbVk1U2dsbXhMU3FNQXlVcWozdnNuZGFp?=
 =?utf-8?B?WUlyaDZqeEoyYWZVdHJFY3RNb3M0NFJPT2xMUTRRVlBScnFrSnRjWnhNTEE4?=
 =?utf-8?B?U2M0M0g2QnZCVmova3UwV0k0SGNCSEJ0cFR5eTBLWHFRbE9CY08ralMwSHNr?=
 =?utf-8?B?RnZRb3E5YkFJZnI0d3VMRk9DTEZTbUJqakF6NXNVRUVBejZ5SVpwMzdZRUpI?=
 =?utf-8?B?QTYyMmlxelJ0cmg1Y1RENnVGNkpITEM5MG1uTERBTXZZQ3ZxYytDNllyZ3lx?=
 =?utf-8?B?YjBIVGhxQXFOVDc0Uy9adFRIWk5aazhpeG1pYzBsYzhWMXp0TjNQWmIwMkk0?=
 =?utf-8?B?T0grMUpMMVdrajZQeXVjRFJINGpGWEpHa0JmOHdodFdtTWNzL2ZGcFpnekJv?=
 =?utf-8?B?WGF4b0NuemdXZEY1YXAzRGxyU2FZSFVVMHNrcUVVZTVWTTEySHltYTFoa0th?=
 =?utf-8?B?Sy9GelZsbVpqd2FjRHJYbng5eHBodEozZWlKK3k4Uk00QlRHeFhtcW1oNEpC?=
 =?utf-8?B?NmJjM25WYnBYcGMxdkhwcUU0YkhaVTg4b1FzZmcvaGpEbHlJbGFBOWdHVGJS?=
 =?utf-8?B?dzNzbW1ZbFZtRnE4LzF1cno5eXkxMzFEZVFFc09pckVreHVabXVUNjhRRlVz?=
 =?utf-8?B?YWw1eFp6amc5VTlab0k5ZE9LTjFlbnhlVWVXYkhlV3ovV2pyZkVIZ2pheEx2?=
 =?utf-8?B?QjZBdHpkSnpBSXV1bU5VWUd4djd6MHNPRzlRckVHYi81ZCtWUGRwRXFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk9ET3JwN0d4T2ppU2hVRkJJb3YzK01NWDhxamNxZVVjRnhpRXo5ekF0aG1y?=
 =?utf-8?B?c2hHSFBJbmx3ZlFZNWl2ZzBJVWdhMlBxSG1zeE8remtpV0NKU3o1dnlvK0VD?=
 =?utf-8?B?eDVNSkpUZUJCdEZmSE1YczZvSnNnTlIxaS9qYXpKL04rN1IvaVFpSGVlZUN0?=
 =?utf-8?B?Ylg5amFjVlJpUmw1UGE3Y2piU3k1VEFSUVlrb2x0WEtNUjY4d0JkeVBEcVJD?=
 =?utf-8?B?K2pzR2doRGYzVUJXamJYV2FlZ3VzczhBemFOQkhuK2pFM3U1K2RVN2JhUDRo?=
 =?utf-8?B?QmtrSDlTb3llQWRVSHRnRk5abUNITjMwdzFvV1FMVUR5VFBKWVdUakYzbm1j?=
 =?utf-8?B?OGFCQnJLOXM5enFmSFh5QWdiT0NubTNZbUljNlRLU1FPUFRWbUpMQ0JCaVhU?=
 =?utf-8?B?cU90cUwrWUIySE8rYmN5NlB0WWVZVlFtN2ZOL0VkaTdMZnc2VDByY1NxY3Qw?=
 =?utf-8?B?d0N6Q2U4WEtoenJjamh0aURNK2c0cFA4bko5Q3ZBWEIySnY3M2pWMERBV05T?=
 =?utf-8?B?dFhuL0QxOEdqenRNT1pSazhWVHgrN0dRWkhxMHJpM25NSEkvL2RBZDc1TUNr?=
 =?utf-8?B?aUxLektvcnMzMURUU29iR1ArQ3hWM0c3SHBDdWZnK1lhcUdNeHRzMjhHWXVY?=
 =?utf-8?B?dm9Ca1ZheXBoQVhNL3RvcjlTVVZxK3hub2hqQlRjWUFVeENFT2x3STRRTkNB?=
 =?utf-8?B?anRFN3RXaEQ2THp2TGpxS29Mc1FrL3ZkeEI4QnRXTEExNHlnV2VMbm1LV09L?=
 =?utf-8?B?aHhBVlZtMk9YVkhTOThQV05uVEdjL0g3amFsOTdJZ3l1eUF5QTFlbDZ6KzlP?=
 =?utf-8?B?dTVEQVVoY1V5QjJSZFUvekx3dHlITUFYdjI1MzZTV01yRXdGcGFWaHVlaEgx?=
 =?utf-8?B?VlE4QkJPSytVZm5Wa0toQmpIV0lBM29UWittWi8rRjJ2aGs5dDFVT3h1cWhO?=
 =?utf-8?B?bElWNnBhWUkxMDY5eFoycXFuUWVXRE1mUTJxc3NvQS9DOUFUWVN0NkdXbkNr?=
 =?utf-8?B?THlDaFI1YlFwby94K0FOb3NIR1FoRk9EQlFNWkR2dEw3OVUzVkw1Mm8ycEpS?=
 =?utf-8?B?SXVzZEJWNDlKc0Jra1czdmZyeGNHanR3eVA2NW5ZcisrbkVFK2tTaE11NG5o?=
 =?utf-8?B?L1hUZWhvZlVoZ0hPRDBlMGMxN1p6MXpMeWp4ZXpGV1EzekhaRng5Qm5VK0cz?=
 =?utf-8?B?anJldHA1VHhyeURQcldxKzkyaDI4ZkxQajFFS25COE9oWll1a1N3ZVFiNVI0?=
 =?utf-8?B?SUs3bkt6QUlvWmE4U0VQVjF6VUZIRDI4QXk2cEFadW1RanA2ZndqY1JjUkxZ?=
 =?utf-8?B?WjNjeHp2QnhIRTdwS0dkd2F0ZE5iRDVoc3Ixd0VaRHp4K0VoZUVJUUtUWE9E?=
 =?utf-8?B?dlFuYktMRmQyVXE4QVNCeW1nd2UrOXJmcHQrNkk2RzY5eCtLNzZTa0ZnWFNV?=
 =?utf-8?B?MkQ2aytZQk5lRkw2TnRwU1U3VTZrVjd5RUF2L0hWb0N4VXFuM2xibko3bWlm?=
 =?utf-8?B?ZzJmSU9kQXR3ek5FZFd6VFBLQU02T0FUdmRDd1VlR2drbm9wdUdvNGNvU3cx?=
 =?utf-8?B?RjBJV2ZiUWNnQU1HSGYxN3BaRHZYQVpnTkpwanVvMmExakg1VnpXTTlRZ0xw?=
 =?utf-8?B?aVZNV2o5Sm1TRzlxcGR3TXJZV1NXSFdwM2M1dWFZelA4Q1BpdzBvMGVUMGc5?=
 =?utf-8?B?eXMycUQ4MlF3eFNpV3VyTWE4YWNBTlkzVlJIRk0vblRxcC9ZTUxWRUhMSHYz?=
 =?utf-8?B?TGU2ckw5S25sajlwVWNaSzZnaFNyam5qS0lZbFN4ZUhVVDNnSGVPaFI0MUhi?=
 =?utf-8?B?c2djRUdRTjBmN2p4TzNHZWRRZitFQnVlRm03aG91MGFoYVBvMXUzNUw0MGdY?=
 =?utf-8?B?c3hNQjFXL0dFODFIbFFLSXQvbGJGSFQxQm9KTmlMOWFuVUVXTVVZU0dmTlR5?=
 =?utf-8?B?TWY1TjFpTlBjTDJ6SVFlNFdDcUNKM2FiV0xKQ2dxYnJpTjdwK0dIb2FjYW9Z?=
 =?utf-8?B?Vmdodk43bTViZlRXQWROL0VFYnZLTkM1UnNRbGpiMEdMOS9KNmk2ZEFTREI5?=
 =?utf-8?B?am5Lc3p1OHpGclVmU3l5RnJqNUhWMG5OOGx1RUVqVVBkbTJ2R2ZjQ0NTbkRm?=
 =?utf-8?Q?DGzJkr0SvZ6+3HlsCCTJtCxFp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6446b2d9-bc4d-47f5-31c5-08dc754e8b55
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 02:18:58.6619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKZ/P5Q8xrVKtNYBvF+GCoN4yQCiCfcuzkMMSUkhda9JmkpPopvPGI63uPmz+xWrH7hT+AGiTtq2zznpk7lC8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7900
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

On 5/15/24 17:51, Aradhya Bhatia wrote:
> Add the Microtips Technology USA's MF-101HIEBCAF0 10.1"[0] panel,
> MF-103HIEB0GA0 10.25"[1] panel, and Lincoln Technology Solutions'
> LCD185-101CT 10.1"[2] panel.
> 
> Thes are all dual-lvds panels.
> 
> Panel Links:
> [0]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2588/13-101HIEBCAF0-S_V1.1_20221104.pdf
> [1]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2660/13-103HIEB0GA0-S_V1.0_20211206.pdf

This one mentions some controls in '3. PIN DESCRIPTION' which
don't comply with this binding, like RL, TB, STBYB and RESET.
Note this binding only allows compatible, ports, backlight,
enable-gpios and power-supply properties, nothing more.

Regards,
Liu Ying


> [2]: https://lincolntechsolutions.com/wp-content/uploads/2023/04/LCD185-101CTL1ARNTT_DS_R1.3.pdf
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> index 716ece5f3978..e78160d1aa24 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> @@ -41,6 +41,12 @@ properties:
>        - auo,g190ean01
>          # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
>        - koe,tx26d202vm0bwa
> +        # Lincoln Technology Solutions, LCD185-101CT 10.1" TFT 1920x1200
> +      - lincolntech,lcd185-101ct
> +        # Microtips Technology MF-101HIEBCAF0 10.1" WUXGA (1920x1200) TFT LCD panel
> +      - microtips,mf-101hiebcaf0
> +        # Microtips Technology MF-103HIEB0GA0 10.25" 1920x720 TFT LCD panel
> +      - microtips,mf-103hieb0ga0
>          # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
>        - nlt,nl192108ac18-02d
>  


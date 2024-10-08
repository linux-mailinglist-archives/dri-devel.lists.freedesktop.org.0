Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0683993F32
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 09:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D64410E47B;
	Tue,  8 Oct 2024 07:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="Fl+btY4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2104.outbound.protection.outlook.com [40.107.241.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A190310E47B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ2cYmSG7q/fc0QwpqBMUIS7SI56jBZukNdUc7Kqm8uyYG/ytZaGYvV/+X4/0VdR+TA5+02eSNaTWTUun4eUsfT78g217H8QSCgpkIdMlYxY6nrfldaXOHPKEmPmgX4vfF6EHGUwHIXlnvwJFCmoxYa/HbwActlulpEydVC4ypEmQttRgVitgbxzQ+FF4TrU8WcaHeCul33cG5WhnJUJAS/TXmKe8bloSEUgjImagB8VC4Joio/NjfszN4JRgY8Co2QIVTOwjSUvVihfdAba/etx/EucWKcW+rWnVH6TZY/jydBj8/4rQYVroeTU82VU/O47duucjNCZ0FrvEtJppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv6BfYCzGqjS5M6JwXTqXEk50D2P+p/cOSn9Sa4se+A=;
 b=ip4fDMCFwtRzs/J+J1/UwkPKKHhDZVSv94ATXGebjIqJJ927Fk8ciPCRGowkZ2IUDbJ9hv10fXzKC+aqYoF7iORyMd41ksUaMg6RAxVPPw1mbmk0X2Bj6ajgHLFBGanUVjR3ua+2uxEofhFwScttyxgulVuGAA2yRc53PJJI93/TV9GEkton5ZE9j4OnA0tZHz8qE9+SM/LbrcLwVMCkYashSQoRd8FMTfjjGThWoH0VCoJv39zOvWlRcUlIIUV4v0hRJYQOhh6ACxnqU9AHgcNblrf5WU4mQioAUMuPP2jeUmQ6Bd7jGtWottSXOG6i/n9QK9pYNwuJKgDqVWSV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv6BfYCzGqjS5M6JwXTqXEk50D2P+p/cOSn9Sa4se+A=;
 b=Fl+btY4wvfcJXdgWKHWR4xuVq8bVMK6JpZef6Tklz+c52QigTXetPve7lhwtJnVaUqQ1KHVfel2yUZ0seuO834iYu3fDOIFl7d+4qLN2KcaxjnGpW2OyeQfcp4Qr3eyXrZjHHUv5N/G/f0suvN0162p71bEpOQha985sFgdHVgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM9PR10MB4037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 07:21:07 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 07:21:07 +0000
Message-ID: <3280f47c-f1e4-4e12-8b48-4e5f68b7a606@kontron.de>
Date: Tue, 8 Oct 2024 09:21:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64: dts: imx8mm-kontron: Add HDMI and LVDS
 display support
To: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, Fabio Estevam
 <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Parthiban Nallathambi <parthiban@linumiz.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
References: <20240828074753.25401-1-frieder@fris.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20240828074753.25401-1-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM9PR10MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: 325ef7cc-759f-468d-fdb8-08dce769c6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1JOcjE4WjZlSjMzbHZqS1JFTm10RHIxeXJlTHFCY0JpS2RlNXY4anlCTk1s?=
 =?utf-8?B?NFNkRGhJR1BjVnNpZmZtT01tRFZWYktZSm1Uckk3UDRrc0poaUkwVEhTdnFx?=
 =?utf-8?B?VzNZY1ArdGl5WC9TT1p0cDdtQzhnNnU2bjh5bWxVenVCK0J1VGNrR2dTcDY3?=
 =?utf-8?B?ZytSY1FvUEFvR3RUb1ppK1RhakxveUJCMVZmK1VZdWR1K1VveHdLdktzblhJ?=
 =?utf-8?B?YStrOHRYM290djVIVUxyeXNyT1FKd25TdVBpMTdtdSt3T3VMQUhlZHdNNjFV?=
 =?utf-8?B?UHNzMGV2YlJpanJobjdHM0JVck5wRVJuNE1zdnVpQmphblkzZExSdmJFdWNO?=
 =?utf-8?B?OWhpaStBMnhBbUMxUVpYaHk4aXRmMGFXdUhWY0x2cHdlT29NS0NmVktaTUt5?=
 =?utf-8?B?MlpLcktZY2h4cnlCWVh6N2hjVis2VC9FYjhHanVJNnJUaExVUktZdVdRRWs3?=
 =?utf-8?B?elRwa0wveFNpQlBXajVxTjhIWWJ3QVEzenY5eXNZWHMxdFFOWkVuZkMzcm1T?=
 =?utf-8?B?ZThzaDR1ZEZsUUJCa2wxenlzcGN5NGJVeTkyT2d0VDdhRjJtWkVNMUxhdTdG?=
 =?utf-8?B?RmVTb2J1YVZLNW9hTFcwMDMzU1ZVWlJaZ1IyVU5TeTdMNXN2ODQ3RmVVWWd1?=
 =?utf-8?B?WTU5ZFZiTVRaV0xHdU9KdGlvYVZlSkpCRWtQM0xZVVhLWVZSVEFJYXdVTFdm?=
 =?utf-8?B?ckRWWTJ4aWpVR2Z6dUx0OUZJQUNLWGhMV1pGbnZIbmNsQktKeUdibmY1am12?=
 =?utf-8?B?ZXY4M0IvSEhYZmlydWZsVnhUYTFjbDVaWU9PWXJtYVdmdWN4VExUOTMxVFJw?=
 =?utf-8?B?Rk5uMjMzeGtkZWgxc2szUHlXMGxzMUNJRysyd2l1bVk4ZU4vTTR6RS81ajV6?=
 =?utf-8?B?Unhwbjg3S094Zi9rRzc4Sy9xN0dUcElUVkNHQU5Qb2FkRGhEc0dnY0lNNVNy?=
 =?utf-8?B?R1hDaFRWcjd4ZkNHeXVpcXpXeko2aTVYVFNKT2lMUnpzTnFNdEVqV2U2Nldr?=
 =?utf-8?B?VjVYZ3Noa0xKRHl2Y0ZRd054RlFqUmpiZjEyRktKaG1kc2IzejdjNUE2UzBv?=
 =?utf-8?B?Nm5rZDRkdkRJU0dDT0RjdE9sRUg4cUtkMGRveU9SOFdaWW5jRGpPZTYzOW1H?=
 =?utf-8?B?ZkRzMi9JNkZBaSt0Z1dud3czbDh1MVhpN1lXakxpbkFiRzBQV3pmRkxjdE5T?=
 =?utf-8?B?OWtJajZNbU1PSWNvK3ZUcHFkSUdGQ0xtOXNGd28yRkE0ZFpVaTE0WHlJbGFQ?=
 =?utf-8?B?a1JGSjA5NmNKOFFWQ1U1Tk5jR21yOXNOUnpDcC9EcFN5MVVVMUJqYjR3L1Ur?=
 =?utf-8?B?RnhRVFhpbzZWWmt2eHFIMkFyaVhhTE1pcit5SUhQNllNc1NtWjRxcVR3YTB1?=
 =?utf-8?B?aUpXSG5qZlRXRk12eUhMbnpJczM4bURLMUxZK0V1NmxxUjF4UFhZRjVnQ09l?=
 =?utf-8?B?bVpoQ3JRTjIydHNZS2ZQMWlPN2tQdzNETFE3VFZCOGh2dVdQNTNwM2FTMk1O?=
 =?utf-8?B?N00ydmNmaTRiT3R0SmdFS2FBS3M3Q2VTRW9pTzN4clZZbis1eFBwSUhVb2hT?=
 =?utf-8?B?UTI5ZHk3K085Q3A4WXhTd3RrVHE5cVJFMXVSU1VDZk5lRWFLVVRnblBmVGxJ?=
 =?utf-8?B?VHpZRjkrVU1HeEFXNExEdWMzcnRHTjJveFdlTU9OUnZOVzJ2U3hFdGdSRXpL?=
 =?utf-8?B?bU5PSEIwbU04V2VYb2JwZWxzektVM1JpNDZDUzBNK2ZDbEJORFo1WlBVLzVY?=
 =?utf-8?Q?F1Barjs+k5g66CiAMyinaS3ESIBrcmaoLUNDeai?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amFtNkxHa21kSks0SmlYTDJjVWN3VTlwdVpJTDFjdmZGMlJKeEQvN1FrYlRq?=
 =?utf-8?B?dWhRb3hUd2pQOHRDaDZmckRVOTdLaWpmalprOEtQTmZJT0tDaUtlSmNnSFJ4?=
 =?utf-8?B?OHl5L1N0Y0s4VStqcGU2ZnpDWHJsc1VrNEdwcUZRNzY5dDdnYm1kbUtkU0xW?=
 =?utf-8?B?NmtJU0wwN2xVUDdsTFlVa0ltSFpEWjNvY09HMWN3R1FmRVV5YXZVK1UrTFZF?=
 =?utf-8?B?L0pmMXZrMW5wMHZCWkI3MHNjOUVQUW5jR0tGaERoT3BXSFVMcGZBLytaZU1X?=
 =?utf-8?B?MXduTGJKOXVkZnRpQ2xMQkNkNXY4TVQvbVRndGsxVElFdUdvcWxXSXdEM0VH?=
 =?utf-8?B?cDR3SGdNbDJhTjhOU1lQN2RPcWJsN0RIVHN4TXRPSytORWJRWHhLMXNjWXVU?=
 =?utf-8?B?WTlubitoOEZ5NUF3UjMzNU5XTUNXS05aRDNoUHVjcTYvRTlsbHVqR0dWaWZJ?=
 =?utf-8?B?bkJZb3FkTjI2OERDVFh0Y1RQM3hpUkVzVk04U05ZZE5MekFtY3c3TEN1UmIz?=
 =?utf-8?B?U0dXZVYrTjFJaGkxK3RTbzVkQXI1cnRVS1BscGpEY1NaQzZLdXFvVy9Nb1E5?=
 =?utf-8?B?djVEdkFWSHBRcUpKclhOenRlZElZcldKOWRiZVpiVDhZQndLWWhJQTFidWpB?=
 =?utf-8?B?ZFZucm1LLzFPdWpnYjFIY242aFdyYnlCallmK3J0dkxZRjJKZmVZYWNQQ1BO?=
 =?utf-8?B?cytLQUdTK3k0TGRmYkxPWXRxRG5uOG4yZEFod0l2RXMxSy9NTHQ5TW5VTW94?=
 =?utf-8?B?RTROTTFBcGVHL3FTU21BZEI2TDVaZnhqU0l0YVhXL2Q2THd2d0ZyRVJmMHJP?=
 =?utf-8?B?NlZRY1AyY21za1pidzRUdzc5N3FWM3UvTXVIUEJ3bWVQaTJ3ZXN2MnNRdGQ2?=
 =?utf-8?B?RzRMa1IzVW5NN3RERXdQTW5QNUF4VDcvckNycS9SaGFobmIwR2hNZ0gvNytL?=
 =?utf-8?B?eEY0NW5MS0ROYVZ2a3dTWG9pN3FaTVZrc3JrODdTSDBGcTZPa1QyODA0dGFX?=
 =?utf-8?B?Q0MvZ21Zc0grcHl1OFBMblVjTURCRzZqeUhidk1FUFNTRGNHN09IOFpMTmxN?=
 =?utf-8?B?YjhoVXRCMkViS09tb3FFVVA2UVRzeUtwZU9wOGhhc2hPR0dGc1B5blJlcEdr?=
 =?utf-8?B?NFNySXJ4RXVDSGVRR3VHdUNzT2VSV0JIZlZzaEREdVEzTHBRZ2UrUWlxT0xQ?=
 =?utf-8?B?K0tZNXBpTngyQ2ZObmIzdzE4MDNzODlxOVBwZ3JkYVZRYlJOUkJqM0p2WmJq?=
 =?utf-8?B?TGxGUDhFd09Cb2RZR2ZXU0VjMjlGR0RUVTlhMUJ6bVlsUXB3bWdUcXcxRUtZ?=
 =?utf-8?B?ZXRyODJ4WHJXRzNQSjZubmFWcWdRWEl2WXZRZmh4STVuNkZMcGlnZC9zcWZy?=
 =?utf-8?B?MkJ5UWk0S1ZoVmRrZGhjRWI5VkZFbVQzM2prZGZaN2RPMnZhQ0JHTmFKcjFq?=
 =?utf-8?B?dE5RSXFXSmlrbGpKSW5PUkFDRUQ2b0ZuQklPRitKbGhTZ1RidEhGcTNhVFpx?=
 =?utf-8?B?Yy9zR2hrcFlubXFBdUFpMTZCWUxxa3cxWlBlZi9Ed08rZHpqZXJPdTY0NlZ0?=
 =?utf-8?B?T29tTHQ1WFg2ZDJVK2FzSkw1Mk9YNHFlSEJObWZObU9iL3RTMmt3VTFoa3pr?=
 =?utf-8?B?bXBwcy9ocHpWQzJ2N3QzdmpQSXlSSDNiNzIzeWZHVDhsaUUyRk9xUUNZVDgr?=
 =?utf-8?B?R1R2M0NFVHN4bFIrdVFUdEtiZnh2a0tQUm1Tek5xY3B0TGxOakI5VmdoeFox?=
 =?utf-8?B?L0hsKzVKVndpd1FrUVA4UHpTVEIzN2NpMHlVWUxzNUhuNzZsSWZsVzQ2cVFQ?=
 =?utf-8?B?KzBoNUV1aDZXNlZTK3h2NWhEVm1jM1BhOGIzTVRuSDVFSGU3UXIrU3Vlc1A2?=
 =?utf-8?B?djBROGlLZFdiMHRodVBRdzZLdy9HdDlBbVRaQ0g4MHQ3TXptQkdLMCtPUDNU?=
 =?utf-8?B?dWJENXUyTitxQ0Q3dWhqNWxkT3B6eFpvSFN6b3JibVNUQmo5Tk9nUEFqaDRs?=
 =?utf-8?B?UHdjb2lXc1RTV3NWRUxYRUVsV3dhVDdXeVdkT0VNOXRuTW0wRnBNWTZFYS9F?=
 =?utf-8?B?RmM4TjZ0YndCck5JR0pXallnQkk4TE9sUjlZWXd1L1VneFcxNDNpemVudUpH?=
 =?utf-8?B?Vk00elpRQnA2Uno2THdvL2xvam5kRXR3RnVrdTJ5dDd0MExaNmw5OU1SV29t?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 325ef7cc-759f-468d-fdb8-08dce769c6dd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:21:07.4855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygfDkl+odFfTVPKZ96BKvI31MhpM3DwyvRTz2V13nXhG7OlnkwJBELygntwU3WZ/FHu9/zYMFtbe18w4dxNBc44RfuYlopi7ZT3rp7kxRmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4037
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

On 28.08.24 9:46 AM, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This add support for the display bridges (DSI->LVDS and DSI->HDMI)
> on the BL i.MX8MM and the 7" LVDS panel in a separate overlay.
> 
> Only one of the interfaces (HDMI or LVDS) is supported at the same
> time. Enabling the LVDS overlay will disable the HDMI interface.
> 
> * Patch 1 and 2: Add the necessary binding changes
> * Patch 3: Extend the BL devicetree
> * Patch 4: Add the LVDS panel overlay
> 
> Changes for v2:
> * Patch 1: Add link to commit message
> * Patch 2: Add Conors A-b tag
> * Patch 3: Remove blank lines from hdmi node
> * Patch 3: Fix order of lvds and hdmi nodes within i2c
> * Patch 3: Remove the unneeded deletion of samsung,pll-clock-frequency
> * Patch 3: Use the existing MIPI DSI output port from imx8mm.dtsi
> * Patch 4: Update copyright year
> * Patch 4: Use exisitng MIPI DSI output port from imx8mm.dtsi
> * Patch 4: Fix pinctrl for GPIO hogs
> * Patch 4: Fix property order in i2c2 node
> * Patch 4: Use generic node name for touchscreen
> 
> Frieder Schrempf (4):
>   dt-bindings: vendor-prefixes: Add Jenson Display
>   dt-bindings: display: panel-lvds: Add compatible for Jenson
>     BL-JT60050-01A
>   arm64: dts: imx8mm-kontron: Add support for display bridges on BL
>     i.MX8MM
>   arm64: dts: imx8mm-kontron: Add DL (Display-Line) overlay with LVDS
>     support

Gentle ping for this series. Neil proposed to apply path 1 and 2 to
drm-misc-next. Shawn, can you review/apply patch 3 and 4, please?

Thanks
Frieder


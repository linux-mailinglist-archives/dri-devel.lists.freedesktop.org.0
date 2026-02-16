Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAbpC/Wmk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B71480D4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285BC10E401;
	Mon, 16 Feb 2026 23:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CAzLUrYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013026.outbound.protection.outlook.com
 [40.107.162.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40FD10E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6NXjA9jSH8qg3zxkrCSa6j8h0EXk3QAnC0dMio4cicshutEbP/fjN08b88NFwWkwFDGRkM6AJoZqBh8h3irKF/sFIe/KOPQTuCOA9TbxyfaIEvMWoD5FY0Z7NW+IXhzQ434FZwfuDU+Zv2tPC9W3DcyltR2rxjWmsal6apyVzd3B4T5e5tNJyESYO20WuIyXC2OzHjclyayLg5zHtnRJrRbefzzHS1QMosdOCdp2sbkv9mPRWhgcNtZUW5j5auPUECeJOBt+5xQKCBzs7tPZ9rqJZKiCZDToQShfUJVcGhi+YTaW/A0MSCHDDvi6H9lrc5GuCTqKqqSAns8DFy0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEb2rdRQJkxB2CEDwWA2n3C62CGIQPblgjRMzdvF/3M=;
 b=OItXwULOfBqwEinCrFQtkpkmh8/aCETZQp2yvBlQIlqy9cPpCucf+7d6hDZaO8TCRGJq3J+U2l63xx9so4pWaI4WVHOmX5Mna9vo9vGdIHIED+SrObyMkIlkngdXXLdQtRKhy4c8oWTPkP0oQtRKgO3+6LpjUDFhn+A3jp3OutF+ylwEPCO6FGqKeJrcVSgJ1Z5Pb9y6IMUOum2WyWM88h+Owv9ZlWCDlPva1Dm6/PFlXz2IQ+TcAbSkEPaOJEZuNLgCjsZerDr0MV+OU4apyXnqPuacE9STEaWnod2H8LQSSNpgMQ1+wSsdTZjkGtCUVD2xdrRpXzUBI0IaJEey0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEb2rdRQJkxB2CEDwWA2n3C62CGIQPblgjRMzdvF/3M=;
 b=CAzLUrYI6ZJpYjOjD6fVi0hhpp6gUUO7F6ueQWGS37VQkDrrElobiUHSfZ+I3vf8rs30fDYT6H5uepfKj9R726IY2jWvkc+F51JOSlVwvYNaEgouPh5e/kQO67UmKvguIymK3VTh0ppGWFQ1C7vuOQlex2NbEu3lSUJfn8WFmMarGzkozwQSpnrP8C4qvVXGjJ1XH42lfZMeQRuo+5Ftzm1DRx7x0lrhHXR9IeBShe4n4oFjG4QD3EykO2UMgn/8OeWaZqkkZZooHTLpwPtGL+RKMuU/OYgtzx5RZ2OYIRfWrHeG0/ZjsQReHdb9SYyEB2EQDhHLh4Bg5ksPfheySQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:11 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:11 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 01/13] serial: linflexuart: Fix locking in set_termios
Date: Mon, 16 Feb 2026 16:01:53 +0100
Message-ID: <20260216150205.212318-2-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::6) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 93687f4d-cc92-47dc-4d21-08de6d6c5cdc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bS9TSzhCZXNYMll6WGtOV1ZDUXVQaGwxb1hPSEt0TmQxMjR4MXM5MEtxN3pi?=
 =?utf-8?B?MWloNUcwTGRYNWFqT2dRTWdzaTFLanJad2txemxRRDhBaWZuQ096bmtpNHFa?=
 =?utf-8?B?TmFRTGxYL3lLY3VxZXhmc1NoU0RXTFJkbnFFaHkycFVKYzFFelVFMmdoa0x0?=
 =?utf-8?B?dENUeFM2VjJXL0t5eGxBMXpZWmJwNEEzMlJLYmNpcGhoZ3YzSUd5SDhYY1Er?=
 =?utf-8?B?cUNsWUNPVk43QlB3Q1gwZys2N3RubndON1ZrbVJLVVJFNTVtSW5HUnhaUkVw?=
 =?utf-8?B?TDZHOGZJektRL0grZW4wUS9DNCtLYmlwNnBGZm1BWTZkYmswQ0RZdjRGUTMr?=
 =?utf-8?B?Q3VGM3FZT1ZadFk5eXdxaS95Z1I1ZlpYaGowdjJSMUp1ZVVwbVlvL0lFdjN4?=
 =?utf-8?B?ZmxZQkViZi9VRDIralpVb09adkFQS05KUVU3Z0psd1pOTU5lbjAvVjFDU0xD?=
 =?utf-8?B?R0dPTFMya1hJak9IRW42ZDdkV3I1TmdveW9CNWNEM1R2c3FLcStoZFR0Smdm?=
 =?utf-8?B?Zk1kL3UwMElxUjFSVmZQVThWbk9QZHlMTnliMVBoTXFOTCsyMVdkd2k3K1ZJ?=
 =?utf-8?B?YURNRm1ZTysrRi9sdk1KczFKRDRQcUtzaHdkZ3p2UXNkUm9CK3VZcVN5NnVL?=
 =?utf-8?B?Q0RBNFZLcW5zTU9jY1QyRjRXa3RnNUVQK09vcWFsWWttaFVuMkZXaWR6QjNS?=
 =?utf-8?B?eUtNVWhjNTJjc0Qxc2RpYWc3TTN2VlFrbWhmQlVUOVFxNWVocFgyVDhPMG1P?=
 =?utf-8?B?eW5zRllKTWY5RmIyWFc2K0tQbm1TNGR6MjhrY3BmS0RhZkNjeDd4b053Z2dK?=
 =?utf-8?B?TWoxMEpNMW9DV05wVnBzYjJ0M1Q0QlVwejNQb3JpVWRwQWdmaWlyemd6am9a?=
 =?utf-8?B?NVNPZ0EyNElKbm9MNUQ0ckhZa3dwMFJJbm0rSjB2Qy84Vm9MRVltT0xhMXZR?=
 =?utf-8?B?dEpFYUFFUksybUZIM2RFWisvN0FFR0ZKQUtVYnB2aVZDZVlZZCtQdVhMYTcx?=
 =?utf-8?B?NkFrMXFsYmo4ckN5ejc1dGtLbEFvajhCSkVEd0xISzhTVm9TY0xKNVkyUXND?=
 =?utf-8?B?TlUrYU80dTlVVzRvNkV4dllyU0FVSEtPUnpoc3FndEhoakJHSC9hM244SnMx?=
 =?utf-8?B?TnowREVNblk1SElvS1Y1eHBrRHNRSUJWMmJ5YVdjR1lxZjdNcUM3V3FXOGNV?=
 =?utf-8?B?WUdISjdnRVV5QnFuVTZtcnlmLzJjNHZmU1hqUjJjS0pXOWlEVTExMVBJRjcw?=
 =?utf-8?B?dU9jUURoanMySFdwNzR1bnpjMDJrL0hQeDN6T09ScllhR1VrZDIwTmJob1FW?=
 =?utf-8?B?L1d5VG5jUCtYdUdRUGZERDNxWFYyQ1ZWeTNKN2lFRVFudGlpUEVadXo4b2h1?=
 =?utf-8?B?ZlZDU3FQeTlyaUFHMEwvREltZno0SFB5dlJjU1kzc0RIK3JDdVFWMlJwWksw?=
 =?utf-8?B?bXR4dlFCdjlhaE9Zcm1JdGxpK3pvS01GU1VPRXlJTUg2WlZwdGFIM2VUSWdS?=
 =?utf-8?B?WnVNekwvQmxRK2NPN0FScmtRb0NBeTh6ZmpJN0xLdzRnRXFOVXVhdkVNNE81?=
 =?utf-8?B?WGRoa0k2STFHMjJ5b2Q5djQxSmVZaUU3aEtEa2JIZk03V1lWK3ZUWG1VQnQy?=
 =?utf-8?B?Qjd4Vm9rSVh5ZGdQanVCWlZyd1VjODFXbDhWRU4wMStNc2Z6VTZmOWNuQklp?=
 =?utf-8?B?K0U4ckorUkRxQ2RxNDVaYzV3V28yZ2N6SnIwdXVSZnJMa2c0WVgwS25Ua0ZD?=
 =?utf-8?B?clBlMjJYZlRuTXBzSVYwdGQvdXJaMExlbEpqc2Y3bDhzQm9sN2Y0MUY3T2Rh?=
 =?utf-8?B?YVFvd2pUOFp1L2w0cVQwNCs1eTZyZHFFb3RMUlo5NWgyamZRaDFOUEpISGRh?=
 =?utf-8?B?Ly90WDNIemNGZlZjL3lZM1pFZDF5dVJEeFJvd0JHdWRpV0xPa1plcGZlR2lM?=
 =?utf-8?B?QVV1ZEhvOWtYNGFPN1dLWUxWMENVK1pndzV4UVhhbGZqV1RyZ05MektYRkhH?=
 =?utf-8?B?RG4xM3BGT0xIMW5wS2p4STdiWkpocnlLK20vWGpIRmRyOUhLaDJGMVE1RmdC?=
 =?utf-8?B?dVJsNXpLS3JZYjlqTi9ZR3ZRdHVCeU0xODVVM2JuUnpTdmFtcmQweFUzdjhw?=
 =?utf-8?B?RXdhd0ZHaXovV1oya3RGRU5GVWVQdFVZVEJYTkY0dmZ4cXE5S0g2SmFIa010?=
 =?utf-8?B?dVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09zTlJnRU81ZEp4dVN4K0gzU0k2cXFMVVZNZ0EvdGVYWGNQVEo2TU5hSGtu?=
 =?utf-8?B?a1lVdWdIWnBUcVZadmRtOWpraHIrSm5KbW9hWE1nUkxDL2dZTmNEaEtiY25q?=
 =?utf-8?B?Y3JkZDhXZ25tdFlQdi9kbmpWaXNVb1lkOHh1YXBBemt5VGw2b2U2VVN6T1Ex?=
 =?utf-8?B?dXBUYUVUVzB5S3FEcjJ1TmR4UmUvbjFBRlNsK3RlSGJFMStsWUp2SGZGekla?=
 =?utf-8?B?UlV3SXQ1SkRoZzNHWTBBQzdXTE42ZXphaE9oYXh1VGdUSDZKTTZYOEJubkFB?=
 =?utf-8?B?ak1XZGZGSjhueGI2TXRwQ1B3amRqbm1rMk9iOWRWREhCcUJxdEtFNFVyQTVy?=
 =?utf-8?B?OUlicTJJdzF4TWM5OXR3aVlYRTJHaXNSelk0YlBodDhxV0JOeVh5SGlOV2xX?=
 =?utf-8?B?NEsvQXBBZldmQ0ZjOTlGdHY2SlVCVEtmbW42WTQ2cWoxOUJTam9nT0dQY3Q1?=
 =?utf-8?B?dlExZ0pkRG8zL24yVFdnVU9HUDRleml0UlBLdzI3U1JjZGIrZkFsZERCZklK?=
 =?utf-8?B?eU4yT2pBTWthUWNqV1RvdUVNdmU2eGF1QnU0c25Pd2ZEVmxrS0NzY25ybHor?=
 =?utf-8?B?Qm5HRnUwaU9WeFY2SHVEN0piQTNVRmNrQVRXRURicEVlUXgrUm5uZHVyVk01?=
 =?utf-8?B?TW1ndE1qK25KNFBIbnhpRGV5Mzc5NzUyRk8zNGxoaEhBWXR1bGtzdU4wdVQr?=
 =?utf-8?B?dUxhV0RUSlJLZGRsWjdvYmh4T051bm9XNzNmTmFaOGRlSm9pVXg5SjRaRU4x?=
 =?utf-8?B?bE8zcDJTMU1KcmtmSlgwNWRLSE8yd1ZWUGsvbmJSSzdpOHlWeU15V21zYWVl?=
 =?utf-8?B?SmZjMDhSWGwzL2Fnd2dUY0xENWhZU3RhWkJ5dzdQcUZidk9wMFZrYTJMT1dS?=
 =?utf-8?B?em1COXRWc0VBMXB6VDBXdVJRNUFadTJaY290MlhMTi8xUzM0bldESzZ2bloz?=
 =?utf-8?B?bXJpajRjY3Y5bDIxTms2dlc2U2JEV1d6cWg2Uk9jdFRhQmtENkxTbWF6TXFv?=
 =?utf-8?B?eFBnOXVWVDg5L3dGU1BWb0FCdU92MGZVSmdrbnZPZmdIaTgzZFlNM1VicmNz?=
 =?utf-8?B?c1JkK2RXMlExcU05UjJJTSt0amFxc29jUWpkWW5vbmMrSFluMkNNUktOcnQr?=
 =?utf-8?B?bEdjVEgrZXVySGhuU2VFWUxZV2pwcVdFdUVsYUpRdGZtRFJLZ1gvOE9SREhp?=
 =?utf-8?B?azJaQWlZSWJaYXlvMFhrNGpmWjB3di85VFJRcGljbFBBOVFnbTJIM1RQUXN1?=
 =?utf-8?B?a1JMeHZETllSY292b0lGR2kwTUc5enhUZDIrcldtOWNoVHdBaGVSdFkyRXRr?=
 =?utf-8?B?eGtIR09IWHdsV0pnRDl0L2Z0QUhTa25ZaHd3R3JiZ0RidTkwOTdDaWRDOEMv?=
 =?utf-8?B?bFZWMFljNndWWVJ6c0FKZnZnSXIwZ3VvaDZKNlVpSzlPa2QxMjhMWmk1SkEy?=
 =?utf-8?B?VFFlL0k5cmExVC9qSmJzbmFlMDdPMFhQOFozTVVmUCtFcWxDb01vZndNaXZs?=
 =?utf-8?B?TUlBTzFrUW9lSWRiem8zRTZjbTFnTU1HbUxXMFk2VDR2YlpYVVlCVHJ6S01Z?=
 =?utf-8?B?dWJBUWxhQ3RZT1Vjb0piMjRDR3huS0x4N05ZMmRQTnVrLzRDZGZ1eHY1K3hX?=
 =?utf-8?B?VEVSYnlYZmE5U2Y2WVFFeXptZEg4NTF3S0NXalpubTBmQUg3OTFDbzZjMUhY?=
 =?utf-8?B?dUVxd0JsdER1T2JBaXRNVkxRNTRXWWZDcEhSSHkzSU5BOUNGS1V0N2FZdURi?=
 =?utf-8?B?K05McCtPMEtTbFVsdGNlOXNacWhtMTdVRWdHd3A3R3IzZU1BWkZDcjA1VFhn?=
 =?utf-8?B?RTRXN3pkUHJRam43ajdhYjdKdGpSQ0IybEhIQzlGRSt4ZWg3MmJ2cUxCcFdo?=
 =?utf-8?B?dWxCR2FjQmRCaVN5VXBiUi9yTm9lZHAzMnlzMVpRRDZNWGJDVm1CYld5eHpq?=
 =?utf-8?B?UEJpZ2wwOFRCQ3hteC90M0ZHUFV2OURGY0RIZVJuTXpXRjg5S3UwU3lHZkxK?=
 =?utf-8?B?L2k5eUFreUFxUXEvUVdzUXpUVXRtZVhORHErbXh6U3RIdEdYL2tIdTNQcURn?=
 =?utf-8?B?cWdEZW9nVjFTT2JXMHR6UUlQTGlpeFZ5aFA4enZTOXRXejkwWS9CcjRWVUhO?=
 =?utf-8?B?TEJjV0NTQjhFU043RG1GQ0NoVGhSeDZoMHRDaUdxQlppbW5aVDkzdEhYeG8w?=
 =?utf-8?B?Rjl1MGh6Qmp3em52dWJVWDFPaWJ4RWpoRjZTSGNXbVhaQnYzY0NZOC9hajNN?=
 =?utf-8?B?bnU5eGN4S0d1NjlWWDQ3dHFHK2l4Tno2M29NZEtTeHlyRGhCZ1U4Smd5djVn?=
 =?utf-8?B?V0pmeDVHaXdoZ3VZbWNpKzRUT0FCUkJSOG1vYzhxdFlaN3FyT21HelVGQ2hj?=
 =?utf-8?Q?KJrnQ70s/eV/14DA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93687f4d-cc92-47dc-4d21-08de6d6c5cdc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:11.8125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTrEIjL6vIA0p/fRGM7GGsUXai5zZVuCvTWpgyqWffRh8qzrUo43nltAMIGwnobEQDMGLxn5ANIGc+8PrHLrmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:larisa.grigore@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: D67B71480D4
X-Rspamd-Action: no action

From: Radu Pirea <radu-nicolae.pirea@nxp.com>

Take the port->lock when set_termios is called, otherwise if characters
are sent while IP is in init mode, the IP will hang in an uncertain
state.

Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index e70a56de1fce..5a410e2d56ac 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -407,6 +407,8 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 	unsigned long cr, old_cr, cr1;
 	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
 
+	uart_port_lock_irqsave(port, &flags);
+
 	cr = readl(port->membase + UARTCR);
 	old_cr = cr;
 
@@ -475,8 +477,6 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 		cr &= ~LINFLEXD_UARTCR_PCE;
 	}
 
-	uart_port_lock_irqsave(port, &flags);
-
 	port->read_status_mask = 0;
 
 	if (termios->c_iflag & INPCK)
-- 
2.47.0


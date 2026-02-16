Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HntFgGnk2ly7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4981480FB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52C010E40C;
	Mon, 16 Feb 2026 23:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HI2L+sYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4E10E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfL2x4nx2ZtyqCVJD1oifiZLMnJU+jIzVvy4HDqTLxh8FEAVRXaaJVm4BispcE3pHupuNvffrnefeg9bmC3LtkwVOKkGVpAoofb5SLsLXg7B2JjGmRGKNxBnXp7cVQrjeR/2Yo4a5SSh81rP3Gchy3dBFoguwNxAsB1jn+zc1N2U1wCNbZB40lYWMuxwnZRMS6sbK9SzBm0sfcS6RW0LSXiDIKVzLpqjTQhx5hYZAPB1cEQigCaFiRZc28+GOhnid5q2Rd8rRcQ9VMhELUBKNuQt9Nu5NRcsPe7B2wa98jvWujwU5LZbhHQbrR0N3vMsT2VUF/hz1pkPfCCfJb0wAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8QsxCnbpw/JkbLFAphYXrNvxW3IlBmlOx4mSHyDMOw=;
 b=DScoCwfS+ZxVdSyJKaFAKNBecToeRsSZkhsOC2OjIVd6nFADg0EreAdwI8j1bDxiiSCmPDtCqiwAqUns39gsnSQbGrkdnLCqrBzKwcvfayHqLQc8PrSkUDPgXN9ENCWr7G0Nv+zmdpvRn7pV1oatw/g0XcV+67KJbHdTuJ3p5HfYxFoSKf2Goi2XeTJacXw2xPS5FZMZVa9zGneDr0J8oInAK8OiJt5gdLAhArAFepqvORVtJ3mA5zOo6FQ0Ctmh8vVVKacMzmViufeh3O1eyRSwLo5aPcekUpSfZLaz3GYJ35ujdlTgo9Dp3YIyGD5R8p+5q38UH8AIRrC0pKpkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8QsxCnbpw/JkbLFAphYXrNvxW3IlBmlOx4mSHyDMOw=;
 b=HI2L+sYiN2ZLtfZg+BC/nTB1BokVjglfb+Pv7vIDdM76vLycIF7INlW+3/lJRlZn/NEywO9yyD/xlYzd5KlDKRLMr3ArCy5AQ08dpVUW4RliU9cQOkqYI2P0Db6dAHLh+Nuba657vkQcUSi+ZvsVmDEBgzdkOEiOU8H4KB7vS/qMSOfKwGNZY+6e7WEHgdwMS0VB1lhhNYUklI+WOMU4Yq1uXq4v5Yty4uhuHNJ5KzxA11509Orgd+f5avwlazdt4NojWDL9aF5IjYf8e+ScTDnXExkXa5AiyvOxzPFSqOE4r1jnrD3HMIb0RpohCykFte1qY+ZDeT5VJyCXLQ1Xgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:23 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:23 +0000
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
 Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 05/13] serial: linflexuart: Update RXEN/TXEN outside INITM mode
Date: Mon, 16 Feb 2026 16:01:57 +0100
Message-ID: <20260216150205.212318-6-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::20) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e972d0c-7762-4914-13ec-08de6d6c6361
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDBNbmFkWFViWmR0SzMydkxPSmpZUk9tTC8xS0FWTTI2WFhuUFVVdkp4VjN0?=
 =?utf-8?B?ck40cWNacGNOb25QZmcrWnhuWkQzYjZpdkpHQkJEVVNFZ28wdHh4WG1XVU1R?=
 =?utf-8?B?cXBPK1hsYUJXMXBIWGNLS0IwNVJCSnZRRUxwTDBlVkJGSVVaQjhacUR4Q2lX?=
 =?utf-8?B?UTdwcGtBVUJEZDZEZXJIWDA2VGtLMUVjSGhmejlpbkFoNVlxOFIyWG1tcHUz?=
 =?utf-8?B?NlZIcS9ueVVvSWhHWUJqMldIS202VUluZEcyZDNOcXZIdGUwbWhFVUVIMmxG?=
 =?utf-8?B?K1N2Qmg4VDA5VWZhUjRjdUU2eWwrSUt5Wm9kVHVzbzJaWUJVcGpzWkFVYkNY?=
 =?utf-8?B?TVEya0xaSEpOMEV1a055V1E5cDNMTGJVcHgyQmFKVm1ZdnZtcEFiMmxxNTFt?=
 =?utf-8?B?aUxiSUIrNEdkMnBtWDdiWDA1d0JjTkxHYUY4amhOWlBTeDBCaTlpM2Zqbkk0?=
 =?utf-8?B?K2hOQmsvQjlIekxJOFlCTVJEUFRhMDRYZ2l6L1RoZ2lCOFplRkcwdFdzS29T?=
 =?utf-8?B?emM1M3Y1SnNPaldMWVVWMkltdmFxL1NQS0xULzMwU0RWeUM5WDZTWlo3YmZt?=
 =?utf-8?B?SnpYUnBSUi85YzZyTkJXZGZpaXlNTXI0NGxNc0RnejFqcExseDQwR2k4aVcw?=
 =?utf-8?B?WFd1L0cxdjV3V0FuNHhQYUdWWGFCbXBxUTBocWJRM29nRDRpREovVkJ4Z2dS?=
 =?utf-8?B?VW40N0UrbjdYUGg4TlNxMHV4aklyNmdNMnNqaFlNOWJqNjhDa1FyWlFjdG1s?=
 =?utf-8?B?N3FoVms3c1p0V3lxNHliVFo1dklCVFNrRkQ5SmpNZ0p6am1YTGZRNHd4bkRo?=
 =?utf-8?B?ZXVXNVdFODVWSnU0MjBpOGpqdXBKc2NTK2czQjVMbFFpcTBsL3cyL0MyQXpB?=
 =?utf-8?B?UktNZ2s5QklTWTNrdHhpVlVHWDRxN1ZCcDdsbG9TNW0zUTVRVnZDRnVEVGtG?=
 =?utf-8?B?aUVFNkhZUk56VXdCdXk2SlFsZnkycVkvSjI3cnJYRzdUVlFVUnNoWWJ5STVD?=
 =?utf-8?B?WDZSeG1CdHNyWHltZVQ0L2V0ZHU3MVgzdmxDelJ4VVc5TStVUm05Z3ZtSGRo?=
 =?utf-8?B?Y29BQzJZWDE4VWhXb0xVMWhnd3VmYmlZU3pnM3VtM2NEMWs3eE9vUzM3bnpI?=
 =?utf-8?B?WGlkNFRiT1lwUnFZNDE2TGpjc1NRYmZ1Uy8wb3V5b04xS3owMlI5Z2JyL21M?=
 =?utf-8?B?YXlXbU5hVWp0RWFCK2RpR0haR1dZMkhnY1lpa2FObXlNMFI5dnJ2SThaMnVp?=
 =?utf-8?B?aWpMMFhxZW45eEdqZHRhM2QrT05RQ1k0OWlUc3pycWFSaVlzVGxKVUF5UWQx?=
 =?utf-8?B?bWxWV1hLNVBWYXMyM0Rha09CbU9tTFUrU2creklWbld5dnVPZnkzZ3RTM2N0?=
 =?utf-8?B?QUJCT0JudlhDOTArdHdSdVRCZkwvWjVKSVU3Qlp6djhpZVBGSFNtTHY2ak0x?=
 =?utf-8?B?R0tUbzBycEV4cXRjZEtaQW42NFl5elZmNFJCVUpCR0IzajRwWU5ySVFrM3V1?=
 =?utf-8?B?Rmo3d080ZVFObExEUUVLOHo2TFJ6YWZSZktYY1FPQzFTZXpLUEF6Zm5CM1NP?=
 =?utf-8?B?cEVnZDRvMTFSTExGNGtvSUMxVEk1d2Z0NW1MWDJacEFpc3p0SUlZYXM4MTJq?=
 =?utf-8?B?L0VHRitIT1NzZzc0NXlkMjdEa2RZUFkxeWtWWnhaNms0dVNuYmszU3JJSWVR?=
 =?utf-8?B?bnhLM1BXclk3OVJsS1pKWU5QNGJwVy9hdUVtbk9sOG9qRlhhblJoellab0dK?=
 =?utf-8?B?a2U4UnhOY2p5bWJIMm9EVW5vVDdzN2ZhUmg5UEpkY2VMYU14czJhQnVRVFRn?=
 =?utf-8?B?L3lGZUtwYlRuYmJudk9jd2d5d1VvaXZyT3lRaU5iUzI5TzkyN21UMkwydkZG?=
 =?utf-8?B?TlcxMzM0dTlSaWdYaEdEdGVXTUMxb2JDS0ZzbHIxR1JPcDBzN3R6TkpicG5j?=
 =?utf-8?B?cU5LWis4RVJKSDd5MmVrZThNNkl3am0rdXJrMXA4WFJ1T3BPYlRFRTdkQlZo?=
 =?utf-8?B?dUtQcFMwTDNYNDltMTJhck95TkhINVNYQTJVTlUySlMvbnVkb0pCRkRIR2FE?=
 =?utf-8?B?UG5Vb1RkMHp4VTdTYTVxaFQ4Y0pHekF2SXI3UkJhR0MwQUt2eWxwanBBYW53?=
 =?utf-8?B?SHpuM0xNTlk3Qm00aHRHWjFLcDBORXQ2d21wMVpJNXVrRnJPdVliOXNkZU1i?=
 =?utf-8?B?aHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlpzRktrRGZHYmxNRGRrTWR0eFRJUVlFaVZET0VpcEFnYy81M1E3T3dWT0hC?=
 =?utf-8?B?VEZjbkcvOHBYazVqQTRDV2hoZHZSUC9kdGYrM2RUd1BTa3Bvbkxxc3MxUzIz?=
 =?utf-8?B?ZnJXUElTcVNDcTl2Zjlhcng1dlIrNFVmUEhNdEUySm94aDFOZTZHWVFXOHJV?=
 =?utf-8?B?K09oSEttemd6WG5URUt5UG92SVFjVGVjWXRxYk1mSzA5RExlcklkVXp0UHZi?=
 =?utf-8?B?TUpNa1VRNkpXK3ExTjU0cHl3YWxHbURpMDZ5Z1JJREt6QlFVMFpDaHJadVRS?=
 =?utf-8?B?T2hCdDBCazdjVHZZc3p4ckNjUDQ3bUMweHFYakZNMFFlV0tJSmk5UXVRSDAz?=
 =?utf-8?B?QUNPRitIWG03L204cDBuV1dvRGtVWjZTOUIxRUg2R2tqSW9uQUhONmFVTnkz?=
 =?utf-8?B?Wnh2a0RpWDZXT2U1ZzFoYm1vVEhtdlpETWQ3ZC9oekx1MURFQ2RiQXIyM1Ns?=
 =?utf-8?B?anFzTjZLZW5yeTUxN3kzVis5QnhsREk1RElWalpWT1krNFlPbEVic2NKUXla?=
 =?utf-8?B?UUtJdDlycXR3NnZQYWRRaC9WUHlGdDNZdUJ3OXpKa1pXZVhZZUVZczkreE5n?=
 =?utf-8?B?RTNpVnFFTW9MN0k5Y0wxaEFQY3E5SEtHTjNZNUN6T0dzUndwSmNxV1huRnBL?=
 =?utf-8?B?NzNDSnM1bmpKdXErRTQxcE1JUy8wVk9TUExmSzRZZHdzOTFWSkdGdGU0RUg4?=
 =?utf-8?B?OS8va3dNTHgvb1VzUlNIQk1jQS9JbHdtQVhraXVNdnBscVlPQzhwVkFCamw0?=
 =?utf-8?B?VGVJT2p0aFBEWWxmZVpKbWhEZU1TeGYreGNBdDVONk9FbGpUdjA1V2RXVmtR?=
 =?utf-8?B?bjFwQWM0S3Q2WUJFL0dMWTlNMTM0R1RjekIwZlBUMmhvZm44NkRQNGM1UUVK?=
 =?utf-8?B?NUVKRXBvbFAzVGwrUlF6T2F1cGRKUGpMb2lGOStlZ1lScUswdjFnREV6N2dL?=
 =?utf-8?B?bFJDUW1vczUvNVFiQklYMTlSY3RYYnZRZXhXQytwQ3E1M09TdjB0Mi9jaVky?=
 =?utf-8?B?R3pwdG5uSmpGVzgwTXQvWlNJRmczckpOeng4aFI5Ym92b3h1d0RzcEVJcnFu?=
 =?utf-8?B?YjhDSEx4OXZtanJ6ckRiaXRZTVpQazhuUW1CUnpiR2NVZEVZbTdZcVJKS0tQ?=
 =?utf-8?B?WlFWVFlwM0FFaTN5UDBhNW16N2wrV0JIQlhoUkF1SkQ1UWxHK2xvVmJ1OEJR?=
 =?utf-8?B?ajZ5eElWU1U4LzdrbnRrRnNVQ1VydWQ1Y2VhcmVxQlA4UmNQdGhxMUF3Y21y?=
 =?utf-8?B?bVR6M2kxcTRpR0d3QWpCSEovRExZVUxVSU5FTzh5S3hWTTBVU25maEFkZng2?=
 =?utf-8?B?a0kwZHJjVU9RZzUyV3lkU0Z1U1UzazdxdzQ1cWR5YU5SaTZMblZ5RkZqV0ww?=
 =?utf-8?B?RXRvZDZsUTJvVFR4cjJ5OUpYZkgzdFZLTUhtZ0hCMUVRKzNJM1R4Umg0TGxt?=
 =?utf-8?B?d3ZwTDJOM1BnN0lueHIzT2VxeVp6Rng0dnA0NG1BN29lczZXeEMzOG9mQ3FV?=
 =?utf-8?B?L0xiN2l2MkxFZkUvR3VWenV1QVd4S3p6NUt3ait0THdmNGp5K1l3RFJOSGJ4?=
 =?utf-8?B?TytseWN0SWpHWnpMWUxDMm5iVW1ZRUtlcUtKbkthT3g4ZFRnVUwvQ0g4ZVQy?=
 =?utf-8?B?aElTb1dRc2lKRHJWUzR4UFVZSVl5UGVaT3Q5TEtnM3gwa3hFMkN4S0NZUnhj?=
 =?utf-8?B?Z1M0aGVqS3VFZnhTT0FEUjM5S0d1WWFkcEI5Wk5FbitBdnNzT1NQMjlBRWE1?=
 =?utf-8?B?UU1YT0FEdmdraTBUT0hKSjIxZVVXd0lUYlJaRHhxU3FibnFYZEpMZUlNVXp6?=
 =?utf-8?B?K0VGVW5hNVZqekJhKzZZQ0FWQmdjd0pzRGJ0TzJEUzdWeHA4djRjUzNkSi9l?=
 =?utf-8?B?TmtocXI3ZFJPenA3NzNhVG1xdXVBZ3dIOGI5NWd6TXh3N1IvSTJPU01PK0VK?=
 =?utf-8?B?QVJTWWlidmNwb1ZKVGdHUVNqWEozb1UrL3BoSHVEWmdoNzgrTlZaMmxTNnU5?=
 =?utf-8?B?TE1yTTQ1UkJrOUxHQkdiRndVVGkvdmJWOWRKWXdHV28rMW9QaG5OQ0xaUlQv?=
 =?utf-8?B?dEZraGlmWHVZbjEzV3hCY0crMVNzNXRDNlpEVjd3UlcxT1dBV051bU1KSzk3?=
 =?utf-8?B?U2svd1d1VjVXNG5xL3d6UU1yeDA3NHNWNXpIZ0tQWktzdXZWREFTZVVzRG5E?=
 =?utf-8?B?Vkl2M0ZUTm9nT0x5RU5IeXcxWlRkU09DQlpmYWM5WXIzWjhOdFVXV1pGK2E1?=
 =?utf-8?B?a2ZhVEF0T09SRnF5N1Y4Rmh6YXVRSllYaGJWRWF2b2xMSit6RXkzbHVuQUla?=
 =?utf-8?B?VjNSaWlXUWdlT2RPZksrcFNpNHVJSU1DNk83YjZSUkpuZ2hjY0dJYnppTXNs?=
 =?utf-8?Q?LXBvSPU6dBz5iLgw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e972d0c-7762-4914-13ec-08de6d6c6361
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:23.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHxFOoMR17+lCkZHKQ+LvI6AaTH4xIedDhXhAbHWFM8ja5/r+plJ6fqNzwYtnhfF/R09vW60I/lyPylgviT76Q==
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:larisa.grigore@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CD4981480FB
X-Rspamd-Action: no action

Reception and transmission should not be enabled or disabled while in
INITM mode.
Although the manual does not explicitly forbid modifying RXEN/TXEN
during INITM, this mode is intended for other types of settings.

Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index a48240b0a5f2..768b3c67a614 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -350,8 +350,7 @@ static void linflex_setup_watermark(struct uart_port *sport)
 	/* set UART bit to allow writing other bits */
 	writel(LINFLEXD_UARTCR_UART, sport->membase + UARTCR);
 
-	cr = (LINFLEXD_UARTCR_RXEN | LINFLEXD_UARTCR_TXEN |
-	      LINFLEXD_UARTCR_WL0 | LINFLEXD_UARTCR_UART);
+	cr = (LINFLEXD_UARTCR_WL0 | LINFLEXD_UARTCR_UART);
 
 	writel(cr, sport->membase + UARTCR);
 
@@ -359,6 +358,9 @@ static void linflex_setup_watermark(struct uart_port *sport)
 
 	writel(cr1, sport->membase + LINCR1);
 
+	cr |= (LINFLEXD_UARTCR_RXEN | LINFLEXD_UARTCR_TXEN);
+	writel(cr, sport->membase + UARTCR);
+
 	ier = readl(sport->membase + LINIER);
 	ier |= LINFLEXD_LINIER_DRIE;
 	ier |= LINFLEXD_LINIER_DTIE;
-- 
2.47.0


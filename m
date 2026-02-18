Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCUOCUTFlWmTUgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 14:57:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229F156EA1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 14:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2B110E5DD;
	Wed, 18 Feb 2026 13:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xTRRTOPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2626610E5D6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 13:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr+M3QOLQAPu052aJk9yNzSqvSe+gcgdkRpvu1XpDxz6oDWARcS/XzBFTb035r2hR3g9uoqAbTVdW4GmPtI7qI8Zgp1WxJIcpdNP4Kuv1mFeYeLoUjqEDRb8X1AkUbuzOTRHbOarzn4NImQm3pGRHF97aGV9rrD4Wrtn+1xQ34Wbm/VIrWykl5XtaGMplqLzdo7Rl5H+PlfOjEss7U1P2NA5jX8Y5QuVTB585dU9AinRFsoME1f8kpGlIb0KaBF5q/QgTcVYYwNoS2L3HreuCbgtfN7WQysEbsLqlEdQ3FfvVU1OtdqMJKEtJEg1CHWSGlDbdxw8adPh2O95QoXnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2EnkRkIZsI+QeNhcck4ItFAq/L7RVBti+nYXol2D1E=;
 b=xs0sUNf+BtfG23SvxZYEMDnETk73yc6dsfxib8vxJzE6zK6DtoE8XMWOcUq2j/mKq1dLTeQQEKS8I3BZPd3fapToBWr0MLV08g9lPWWQEZ3PgPbGuXDciV4oV5oDMe7ILNcfYsmtdyaQvXpF9ztmp0l+r5sRxvF0RX5zO9jq/SSa745IZ9PWbWrcEFI6zGMDiCBI1gOP1hX0Ulf/Pp2r94/7iFUv98gTz1MvQRFUsT/oA5czOrWVgzhF4+20vqqPgCEMNULYNQ1JgZeYtRWuSSrLea6irgAu/qE42VeUoQHjVwSSIb05HuT5ymKeMrLi/PY9H9C2lrLsIVKrGNzYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2EnkRkIZsI+QeNhcck4ItFAq/L7RVBti+nYXol2D1E=;
 b=xTRRTOPkHvleGg6LqXraB6lF8NTmiPBwULJN4W1dXGRnWfEKmIYEIWDU4NdZTXmPSyirtAE80PcUKT8H2E0yzPPiRUUlbat59hmeO3tw7PQutEGi/ZTvmB2qq+HdY8VfM94wYtrg0wWZ9iED+LnHoH2kioqCLcghTeN+HFJ/uiN/TWbk2a5MXDAfTOjv6K+gWTv1WRV7Tui1mhB3Iaa0L4xOw58ASnHHyxJtrJOMnLKAxhi8EisITekQnx0FmwNmQbtNSltGjsZiSRuTjTO8Rnv0WX3vt/SFXcjDRrxzyBYVca5Us3fYvUGU81CW7MBKkoJjucrpndRZ/asqSf0RUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 13:57:15 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 13:57:15 +0000
Message-ID: <69fafe15-a539-4429-ad15-3ec44babab28@oss.nxp.com>
Date: Wed, 18 Feb 2026 15:57:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-linflexuart: add clock
 input properties
To: Krzysztof Kozlowski <krzk@kernel.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-9-larisa.grigore@oss.nxp.com>
 <24443e02-886e-48e2-911e-e4093d251155@kernel.org>
 <e9c214be-840a-43fe-b24d-610fe90269b2@oss.nxp.com>
 <b7adddfc-db7a-466d-a2e8-72bc6a87ae81@kernel.org>
Content-Language: en-US
From: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>
In-Reply-To: <b7adddfc-db7a-466d-a2e8-72bc6a87ae81@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0187.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::24) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|PA4PR04MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d6b5d3-7c52-46c1-57fb-08de6ef59f1f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejNUZlVnMlZnb29CNlVMZVZQYmp1b3hlR0hMb0Y3Y3owSndDd3pvZVkrNDdN?=
 =?utf-8?B?T0FtWmg3K2hhVDZXKzFoaDZ5ZlNPSVdVVUVPY3ZxemtjSWMvS05hUVk1MWI3?=
 =?utf-8?B?V1BXc3hza2dlNW0ranJWVUtJR0FhclRFbE1JSU8vZXBSdUZCTVJSclg2UVpi?=
 =?utf-8?B?MlN1bHpJU0VXTzdtbHM0cXEwUUVvNm56NTU1Tkd1VUE1U3VPaUprUFJOUmlm?=
 =?utf-8?B?aE8wMm9rMXZma2p1dE9jUmZxajZtZnh4WjExcmUzVGpFMHJ2S1lHam9ENWIx?=
 =?utf-8?B?ZTMyTGdWQW5mY0FNMlVxLzZUM0hiSXBrOTIxaGFYMUF3R1dpenorSGJORkZo?=
 =?utf-8?B?SmpaUVg2N01MczIxb1FvZUZtOWxmTEp5aTdsSDBlUkJuRjI4NmU4clg2cmxk?=
 =?utf-8?B?YVVQTU56ZHl5UkhXUmpEVndqUFlBZmVWZ1ZFN29ja1V6eFVZeEpHYUJ2SXQ0?=
 =?utf-8?B?c3pVVlEybWozYTVhTWtEUDZwTWd3cHVBK21PRUJhdGNhVC9IYVQ5blJVTURE?=
 =?utf-8?B?NkF0c3NNMEo3NW5PaXlKLy80KzJHQzhQWVR5SGVZOGZDcGtBampVYllHVlZS?=
 =?utf-8?B?QlkyRGlNRWZXOTF0bTN5VXgyQm9tUlZ2SFhKYTlvTmpPZFNjVGpwSXB6RUJW?=
 =?utf-8?B?WVhoOHRjUGJ1RnJUY2hjdGFXVjRGS3dSY2FTYXVrLzFtOXFuTHdSY3VmV0dv?=
 =?utf-8?B?bWNEWjFrYVNPUG9PK0lDWmpSMVVCblNxWEowKzdodEVsdFpKVkFYdUhJSURF?=
 =?utf-8?B?SEJwSE50V0VCSVR2YUlDWGtUYUNyZlo3VWk1aXhIVFlMNkRJc2Z0QXd6OGU5?=
 =?utf-8?B?MkJGVjY3TjRRMkw5SFZRMWRKTE4raDA4eW5FOWZQS1puSXlldDhLb0EwUFFJ?=
 =?utf-8?B?NW5pdW91VHVBcmZFMHpOYTZOclRXTFpzWFZPNVBVS3RHcUZ4TTBDd1Y1WmJi?=
 =?utf-8?B?UGJ4ZC9TWFhCazdSUUVzbERBTjBMTUpveXQwb2o1T2hvU2ZjN09DSk90elh5?=
 =?utf-8?B?UUJqVTRISXhwV29EcEhzS3ovOGVLSGNJL3JwOEp6eVZlbHZFZWVlUG56eUtk?=
 =?utf-8?B?a0FxcjJES3Y4Q0xtT0ZuWUlFNFhGUmRnQkdQWEs1bCtRVGRJbXJYWmdKajh1?=
 =?utf-8?B?c0E4UVVrSjNBVDM3TFlta205K2owaHNHc0NMc0tBVFZvUG1VYkVqczBjYjI2?=
 =?utf-8?B?SEczc0RmZnFGRGtFc3JDenFjT1lzbzR1NUZXKzhGSzFndEIrU2YzeWlIUm9D?=
 =?utf-8?B?UlMzTWs3MTBMVU1iOHlzNEQ4RTNiWTMyOEdiYjRJaHd5OVR2Y0RiUlNmVkxO?=
 =?utf-8?B?cXVxU1RMa2ZYSS8reS8rZU5WNDZ6ckVtWVZEa1hmaVdodVhLMUZZL2lBUkxY?=
 =?utf-8?B?Y0lHakFRTkN2cWUybktDNzZDWllBL1k0Y052Z25mQnNqYXZ4RmVOalA3VHZH?=
 =?utf-8?B?ajJGV1Irbkp0VzFDSFFLdWRVS2l5QVVmNUltWXRWWUVGdmZVeDY3Rk00aVNG?=
 =?utf-8?B?c2paVjhzNDMrVGQ3aWczbkQrRzY1eG9GZWhtcysxcDErWm5zdVE5dWo1RnhW?=
 =?utf-8?B?U2x6VjJzRFVtT08xSCswaGtGeGNlQldJd1RMd0tlb2d5Q25zT3hpa29TWHVh?=
 =?utf-8?B?dUZLWERXTGExV3RwNFVKRWN3Q296K2Y0RHB0NmNVaG5USWh1eWlwUWY2UXhV?=
 =?utf-8?B?UXl0VXpYR1ZTUENCVkZ0T253RURtaDhZUXZJQkhaV1MweW1Dd2FxTmlXcFZN?=
 =?utf-8?B?SllJNDFDQ3doMVEwSkVVSXFoZkgzNXl2ZVZiRnRvU0kzQytZQS9lTHo5Q2dp?=
 =?utf-8?B?SmNJZmp1ZG9aZkRRUk1kcThJNS9hYi9rV0JIeHJpQnN4bVdiNExxdnVlYTBk?=
 =?utf-8?B?NGVJNHNLd3dPaEcyWGtxUmlaUmk5ZDNFSVVtbUJpbmpnbmtQVk5aNDVGVkpp?=
 =?utf-8?B?cWx4RWkxNjhrUEhobHlxbGF4MEw4SjlkRGhVb2E3cVZ5ZkZXZVhmenJUQ3ly?=
 =?utf-8?B?MnliK1lKd0ZpTVNqWFdWK3ZyRE1UWk56YU5OcW9iSXFjTWlMajkxSk9LaW1W?=
 =?utf-8?B?NEJTVG9JcE9GZXErMEFWcmxwZlFaeG9CZE5zam9odFdxNlJnWFVTMSsxZjgr?=
 =?utf-8?B?WHFVUk1HcmtpRzFyVnNBV01MeURvZzBFREY0eTcyRUltaE1DQjVoRWVuQ0VO?=
 =?utf-8?B?QVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGI2dnROcW5GMkhqZDhSVzNYK2ppUTZUWVd6aEJTb1hlbkJmQVN6THRzNWk5?=
 =?utf-8?B?K2VqY01BTW0rV3hMUXRFeUlBLzJQV3R4K1BvZEFEUVlsVlE2RkZCQVkrakZV?=
 =?utf-8?B?aVM3NWRZSVlmTWIxaWp4TWZ1SmJ1WlY3VGtWR2pKZWNlS0ovTGdkRXIxaVpw?=
 =?utf-8?B?YjJvbDdmNGx2cXBBNVRRMTdSZVN0dDFWTGtGTUxpZzFGLzJpZVNiWXVBTGZV?=
 =?utf-8?B?ZVBKRGxYQ0FBMzAveTFtWnU5aERvc1VTdWFYWHgxbHl6ZitlbzFUSG5IbW16?=
 =?utf-8?B?V2p3aWk4OUlWTmVjdFRMUzhkVlJ3dk4vaXJRNGRhRW9sbmZyd0FpaUg2ZW1t?=
 =?utf-8?B?aTJFdkhRczZCSmJEekttVWR0TXNuVW9taFpxc2lleFEwWWlKY3J6Znp1N0ZL?=
 =?utf-8?B?ODRQdTRIL3FYdlFqZ2hBK2dDN3dTamljK2MyaFpvNFdwVUhuQXVSSGNwTjZv?=
 =?utf-8?B?a0hlcklXYklwWEJJVDdPN29YWHhHZ1grLy9KZzB6ZVBUNjhTQVh4NUg2dFh5?=
 =?utf-8?B?amUwZUdreTFPZi9zcWtpNEZPSGx1THFUSENRUHFKUHMxL3huQlpzUmh3Y3hG?=
 =?utf-8?B?WXE0Y2J5MmpNZ0VUT3pLRzIwZkcvYlRFSkZHYTdJUHBDV0hmRzhXWXZOSGt2?=
 =?utf-8?B?TGpoMFZiNkYwM1JiWFowZllCR0ZNUCtIVmN3TStiSFdCdWJvNFVVazBJekVD?=
 =?utf-8?B?Y2QwMlFjUkxENDZCeVROTEIxQy9SK0VWcmFzWW8xNE9oMVRrUjZhdGFDUEt2?=
 =?utf-8?B?b3l3OFIwQTMySzVpZTcxdW9zdlJJYllISXZ1b2pCYnB4QWFudjJkZmR5b0pN?=
 =?utf-8?B?Q2U1VysvTDQ3c29WMXFJZFFIakU1Yy9TcWhrTHJTTHdxU3Y3dUhocjBFdzJF?=
 =?utf-8?B?UnVXTTZLRWIzM291NlZwb2dtYXpRVXRzTXh2VjZhZzZyQWMzVzc0bk1Ta1Jz?=
 =?utf-8?B?LzJmUjBLZ3pna2cyWFBVWWpoaG91S3lxajFEVEV3emxTeDJBY0Q4NjNsbzlI?=
 =?utf-8?B?Q0NxWXRMY1FOTGJHeHNNUXhCa21jTUoyMG00a2xvMW9mV3orTnhqb01Vck1s?=
 =?utf-8?B?eEhOdlJ5M3YxYVlyaUJpZ0plZ2tzaUJEZ2w5U0FLRlpXRUpsbnRzaGpwUkti?=
 =?utf-8?B?aWNkTTlLRjQwQ0JKUXQrclI1VnBpQnZwaitNODR4YWttRUVjT0lHQnZXdm5Q?=
 =?utf-8?B?WlU2UERvcGdZcmtwcTZPRzNBL1JLOEJLNWt6dkwzdTNFYjZVV3RvUlV6a3Fz?=
 =?utf-8?B?cXhpdzdnM2wrZVlqK3lYc0lmdEl4QVU3b1NxV0dTay9DeDh6c1lybUwrNlJw?=
 =?utf-8?B?QlloZEFmV3JnU0dIQ3RORVJQS1YvV2xsZ1EvVVZOVDRlZzI4UFRGS3dLUW5Y?=
 =?utf-8?B?V2RZK2tlYlhUVzVPQUgwM3lHb2grWWxKODdzNlJ0NjE0Z2o3WStseVFFdC85?=
 =?utf-8?B?Snk0NWQxWFNPQjdtbk94MmhWaHVxSXFPZlZxV0FPUkNlVHg4cGorK0VHbWJJ?=
 =?utf-8?B?MG9vVitRdVVEcnFCWEhLS1ZCQ2RxajlvY2lqOVB1U2VUbkFMZXhiWkRDTTEz?=
 =?utf-8?B?VVFhNXJ0Mi9PeldYVHhzYXhxZ1JGNFlCS1RlbnphLzIveVY2REI0LzNkeEp3?=
 =?utf-8?B?d3ppclEwRWR2dHVXVFF1TnhNVU9qS1duclM3SjZFRFVaU2dpQmswZEtRWE1F?=
 =?utf-8?B?bGs5czQweVFYNmNOTDBrWUI1aHliR1NTN2FjaFI0VE0zS0tadzRVcE9NMER4?=
 =?utf-8?B?UkFndDlQS2pieXc4d1lZVzBYZzZPNXpoUUNDNCs2cjJ3cjFuQmFnM3pEWnlP?=
 =?utf-8?B?THNJdm5qZEdOK3pxcEYxN0Ztb290MXRWMmhWUUVBM2diMEtJSnVJdjZOTndV?=
 =?utf-8?B?Sm5RM0pPbEpZbmw4VFFibWtsSVB6REtsU2EwQndoa3NESWNtSHM5WTloNU1m?=
 =?utf-8?B?eForaitSZjJVWTloTFJwaEo5UEJRdHlEOWtzUTR5Y1YwNDE4TVlQNG5WSEZj?=
 =?utf-8?B?eGh6ZjdqNUF6NmFoNmllSW1xVmQ5TzljZlZOTjExREVGUEhYaUhyU0FUSzhs?=
 =?utf-8?B?OWVMOU4xcXFRYlVDMUgwekQrckRaMytQeXRmMFZtRnlOZWZ5MSswcGFHbkpi?=
 =?utf-8?B?U3JZUnpaK2p6V3Z4aVhjRDJoaU1PZ1lKcGtUa3VsSjFWNjNYdng0Q3U5MVpS?=
 =?utf-8?B?TzRkOUk5R25zQ2ptblNUMXJZOFRKYkZoanRnNSt3N2xtamlRaEQ4ZWM4TlA0?=
 =?utf-8?B?VzlNTEo3MkJvVXowK3pzU2JReTUxWk9Nd2FHK3IwRnRMYy9zUGdkWEpzczh2?=
 =?utf-8?B?dUJ6cVkyVjJqWi9GeFlJb0tPU3ZuMktuYTdoVmtESENqTUlOSzF6QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d6b5d3-7c52-46c1-57fb-08de6ef59f1f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 13:57:15.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkC/X1ftEzwljsYVdNAgXE1NpgRifiPFlD+a0UzRNrFHyIVTVKU1MNQp/AH2IrKiHZzTA+T4TtDuZo0sx6fRKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7885
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email,401c8000:email,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 8229F156EA1
X-Rspamd-Action: no action

On 2/18/2026 3:29 PM, Krzysztof Kozlowski wrote:
> On 18/02/2026 14:26, Larisa Ileana Grigore wrote:
>> On 2/16/2026 5:10 PM, Krzysztof Kozlowski wrote:
>>> On 16/02/2026 16:02, Larisa Grigore wrote:
>>>> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>>>
>>>> Add optional support for the two clock inputs used by the LINFlexD UART
>>>> controller:
>>>> - "lin": LIN_BAUD_CLK
>>>> - "ipg": LINFLEXD_CLK
>>>>
>>>> The clock inputs are kept optional to maintain compatibility with the
>>>> S32V234 platform.
>>>
>>> Does S32V234 have the clocks? I don't understand the "maintain
>>> compatibility" in this context. Either you have or you have not clocks,
>>> which should be expressed in schema (: false, see example schema).
>>>
>> Hello Krzysztof,
>>
>> Thanks for pointing this out! I will update both the schema and the
>> commit description.
>> S32V234 does not expose these clocks in its device tree—on this platform
>> the LINFlexD clocks are set up and enabled by U‑Boot, so they are not
>> available to the kernel.
> 
> So there are clocks. DTS is being used by bootloader, so how bootloader
> is going to set up clocks for S32V234 if no one provides them?
> 
> This looks like buggy/incomplete approach, although I understand that
> the original binding had the issue.
> 
Indeed, I also believe the binding is not fully accurate on S32V234. As 
I mentioned earlier, the LINFlexD clocks are not managed by Linux on 
this platform. They, along with several other clocks, are usually 
initialized by U‑Boot, and Linux does not handle them. That is likely 
the reason they were omitted from the S32V234 binding.
I’m willing to correct this for the S32V234 compatible by making that 
property optional, so we don’t break compatibility.
For S32G, I would prefer to avoid repeating the same oversight we had on 
S32V234 and make the property required, since the IP, as you correctly 
pointed out, does have dedicated clock inputs.

How would you approach this?

Thank you,
Larisa
> 
>> The changes in this patch are intended specifically for S32G2/G3, where
>> the clocks are provided in the DT and required by the driver.
>>
>>>>
>>>> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>>> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>>>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>>>> ---
>>>>    .../bindings/serial/fsl,s32-linflexuart.yaml   | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>>>> index 4171f524a928..885f0b1b3492 100644
>>>> --- a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>>>> +++ b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>>>> @@ -34,6 +34,14 @@ properties:
>>>>      interrupts:
>>>>        maxItems: 1
>>>>    
>>>> +  clocks:
>>>> +    maxItems: 2
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: lin
>>>> +      - const: ipg
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>>> @@ -48,3 +56,13 @@ examples:
>>>>            reg = <0x40053000 0x1000>;
>>>>            interrupts = <0 59 4>;
>>>>        };
>>>> +
>>>> +  - |
>>>> +    serial@401c8000 {
>>>> +        compatible = "nxp,s32g2-linflexuart",
>>>> +                     "fsl,s32v234-linflexuart";
>>>> +        reg = <0x401C8000 0x3000>;
>>>> +        interrupts = <0 82 1>;
>>>> +        clocks = <&clks 14>, <&clks 13>;
>>>> +        clock-names = "lin", "ipg";
>>>
>>> Just add the clocks to existing example. No need for new example for
>>> each new property.
>>>
>>>> +    };
>>
>> The existing node refers to S32V234 which does not expose any clock
>> properties in its device tree. Because of this, I couldn’t extend that
> 
> You just said S32V234 has clocks...
> 
>> example with clocks and clock-names. The additional example is there
>> only to illustrate the S32G2 case, where the clocks are required and
>> actually present in the device tree. Should I remove it?
>>
>> Best regards,
>> Larisa
>>>
>>> Best regards,
>>> Krzysztof
>>
> 
> 
> Best regards,
> Krzysztof


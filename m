Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBOJFVhUfGnTLwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 07:48:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BDAB7B22
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 07:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30FD10E14F;
	Fri, 30 Jan 2026 06:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Map0Z9U6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013029.outbound.protection.outlook.com
 [40.107.162.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A019310E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEo9fUGRkxQzMsAW/AiZAGHWj/h0rW8bc7pQOaF1awV2bBrdH6iKTpCZQrCu9G9bRTlIhWU/J7LkBJjeqSGHwEwm1rAaqq7AfPBIRtRQKYDt2Su9LLzgwYgASuQMVLSrZave3/A4gRZ+QP6ikugpXkMlU7DB7VJmmNAEJ4N9I7dTfGzhIhYGjnkP0OiSGdeHx14+52EmHXl0MWlLxGRwsE+7jx0CqmAKocVIUHC9dyuJ9OJ7ThCHAkaFQX/JKAJ1swdFsbnx6hFWjQudgHtjDUKuePmYsovfKO9g0LgvkfugRBdvDeQw9X1BLc5Y0RdL8AU63nPtEhEzna4Sk6X0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsL7ihbVNHxteSnIrmWt6+96eSizv04RtoQWjSToSqQ=;
 b=ikwvsUfV5aKJyhvt15JQ27YHRNilJLkW4+iIBf998ND+BlR9Cvl/YOa/fDqW5yvJlmWOqeRagT4J2WbMWNhved9sgtUjRsqCqNHu62E5Tg1vg2o2SACBBS9LKpV5R5odXBhVa2SFVhOEZbbtQuvoHTo6TRAC89tiSVqIDN+ccUnaRezlQxdV56EbRTfxJl0EE/kPawn1fGi3p5ZQw3wXGgoSwP+itzNsLRYMl1kQgGzNfb3TS5FrdVEw4uguDfN2ZCEeVrVd3tYrga65hIMvxdUJHymwUmSdnlectNxszCQAsrdkFFYuL0EU/SDesQgyo9AvBiaTmVO0JF4papoC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsL7ihbVNHxteSnIrmWt6+96eSizv04RtoQWjSToSqQ=;
 b=Map0Z9U605wb97slMbgST++hPsIFcaZF7XPKh31VmFgwd4XFTkXW1WHOPB/7acFTNUxixtOfAfgAOPWfswxMaMdNnFecqbSw55XVuU6OOPz7ecEqZkQWtYRyWJ8upeKjlv1KuWpUBpGbS+tyXxnDkCgKikBhQZbnJBfSqEhfim/pS6jR68KNEFMyu32z48S1W7J9sT/PY64c9jFlDwFaFQaV8/pzJsw6IN0lvNkK5sD6q4QMXUE3ysJioq0XKJZkYnhytbCm2R0MghlDsRmLuCCpUWWsFpIo5TWuWDrvqsyYq0LsUjQja4VBxT6hsgKwWd4RvU2sJALbvaU8UPZG2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10387.eurprd04.prod.outlook.com (2603:10a6:10:568::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 06:48:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 06:48:48 +0000
Message-ID: <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
Date: Fri, 30 Jan 2026 14:49:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10387:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d9c18b-537e-4345-7e5a-08de5fcb9e97
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlhNUk3YXdhQTVTdjRTWW9qMWRNbEtYMktFcktXcTZZcjlWOEx0V25OdFhX?=
 =?utf-8?B?eGxweEFER0RRd0xDeGNwOGFyVGRsSWM5aTVaWkdxbGFCRjczKzhFN2RSWnpo?=
 =?utf-8?B?blRBT0JjV3NJOVZIOGpzaHFsYy94Y2NLVHQwTnpBcU9ibFV5c2lYdFovK1Nm?=
 =?utf-8?B?RGVUM1JMM2pqczhnYlJLRVBDMlQ2alBVOXZaYitlZGVSMTV1Yi84WmxlRENs?=
 =?utf-8?B?T0NkZ0k4WHRhTDYyTTZRR2U5N01PWXUyMXlhbGNWcmtCS0I2cGlwSDYwdnNF?=
 =?utf-8?B?MjU1Q0FWay9TeHBPUjFrRWJrbDI3R0hYaFdHZzhFQ3Q1MjIrYjEwQTFjcGJq?=
 =?utf-8?B?WFpHTXAzK2hMZ1VRRkg5ZCtSblVaVFZuRW9wbkd0ejZxOXZVOTN0QkdvdWNO?=
 =?utf-8?B?TndTcklJM20zSGJuZHl5eEZybnc4YlJsWTg2UDNuM0V2c2VBd01nTUd1Ykkv?=
 =?utf-8?B?OWVqYjVBYVhSZ0xyTCtlYVRjYlZlbkZBRnAxS0tiL0hhS2g2Qmt4WFovSnkx?=
 =?utf-8?B?MjU1VXdIdjhwRytVTFoxRVNjQUpjdjdaSjVDbGt1Uk9VcHg2K09uL3hMVlRp?=
 =?utf-8?B?TDZ2QldVY0RkOHdQbnNNK28wYmFYVmViR0FqVGFhMDdhWXNncWFGd0RpbGVl?=
 =?utf-8?B?L0FsYjlJb2QwQ3pYSEFJL1lCMTNKenR1TFNqaENyNnErSy9vcUV4UVNNUkVz?=
 =?utf-8?B?WTBINkUzTXB4OC8rbm9rRzNxSFpFVEtEczVEc3Y2by81eHpMcWRqbklUckFi?=
 =?utf-8?B?THFZb2pCTm5kNVhpQ3VScFlScUhJdkp0clRxTHJ4TzJ2a05nRWJKTko2VkJs?=
 =?utf-8?B?TllZK0IrTm9NbjBLM0hvOFowbG53WE9kRWhzMDFhRkFZMzFwdzhTODBLNnpp?=
 =?utf-8?B?Rys2amNPTkdMYzNNWW0rMGMySDVGckJUdlZ5Q0JYVkh3RElOK0VWb3l5dHpX?=
 =?utf-8?B?VWxmZi94b2tGZTBEb1pXUzVNUWQ4WThKMjB3Z1ZrMzV5bUw5TU5iWXE4ZFh5?=
 =?utf-8?B?T2ZlNTljcHpncDhodmhWcWIzemxFdFQxOXBKSFkxMzNtQm1SWXB3aFhkUmU2?=
 =?utf-8?B?b1lLcXhsa1p6VkUvZ0d0WXl0SkFrVzJMWFdrT082N0p5VHowRDJ6Q1NYT1BF?=
 =?utf-8?B?S0hnQlRWMEhWcUJyeFZuZ3hhbjBMa0tWbXFMZkVoTWxiV1F0emdBdCt1dWty?=
 =?utf-8?B?MVlxZ3M1dXQ4YWwveE9hMFJQaWtPSmxWeVRLSklhczBJdnVoZGRKNW1vRmZR?=
 =?utf-8?B?blYyQmJKTjhoRCtSZ1NSYlkvWVlZUVQzdWE2bVVyNmdxdlJ2eEVrVWpnaktN?=
 =?utf-8?B?a3pLNTFLY2VpSE84cFhVSGxQS2RQOWhmOTMvTDZaOTl5VmxMMURtdWQ2cERn?=
 =?utf-8?B?eWpHb0hHcmZ0V2RJS2lWNkIwQ3d6U0xmQmtUVlMxNlhOVTdLTUR0aVRPWEZi?=
 =?utf-8?B?OHNLTDBkUFhiZTFWM3Nzd0Jycmd6OUZ6QW00MTlwbjd1Z1RDWVVOeDZWMlV6?=
 =?utf-8?B?TGNGNDVxa09XU0FHY1ovZWY0MVR3MCtYNTVqOVJFZzNSU0VNb3FHSTlPa1o4?=
 =?utf-8?B?UUNHQ1k2ZS8vWWZvZmxReW1SS0JOcFBRVlp2a1c0QW41OW95K3pYM2o4TWxI?=
 =?utf-8?B?bzhoT1ZQeksvN2V3TnFvSGdtemVZa3BCNmJyOXJjYVhpdGdlaWNQSU9pb3Y4?=
 =?utf-8?B?ZHF0V3VENmZseDhtei84SDN0VVIyUGlBb1FncS9rL2xSOUxWU2xqVCtLZ0xG?=
 =?utf-8?B?bGRITkVtaUYraE10L1dlbFUvL1pLd2NOZlhBcjJoRjl2UmFoQ1NHU1M0YXFz?=
 =?utf-8?B?ODZzWUU3bDdRMUdQN1cvU1RTZ1JhL3YzWmh6L0RoTFV5VnFHNWdxYlNpeG0w?=
 =?utf-8?B?OTI0YnBOU3N0ZWgrRjNpTUtKb1R6cEFqNGlDY2pIN0hwdGk4NkJWbjdLL2tV?=
 =?utf-8?B?SS9lVjZIeUZEWlFPWkM5ZEJ1ZHJLRkVSUHZGVk9UbzVnSlVaeUlaQjl2K0Jz?=
 =?utf-8?B?elprbWpVKzF6d1I5NGtudlcwL1JTYnh5TldvN0VTVmdMaWVvQWdtMmdGMUxB?=
 =?utf-8?B?RkFOdzMyQXhsWk9OL3RwNjI5UERaT2ZSczh0QW9mSkYraWwrcVZzNlZINnZa?=
 =?utf-8?B?UVNzaitSSVgxKy9KOXR2TkE5TUd6RWVZRmgyd0V3cnZjN1dTMndmUHNvQ0tq?=
 =?utf-8?B?NVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kys5aHV3VHRIdkhsVVJybXRhMlU3Zk5xQ015SXo1RUcyS2VIakJFOGhlamZu?=
 =?utf-8?B?MU1yaExnbU5DYWF4cGc1Tk5VUThoZmt0NkdSWTM5R1AvSHJkRXdSOHVxWjJo?=
 =?utf-8?B?WWRNUkhqQVdndDZMM2hTdmp0QW9DRXo3ZXJrdjFaTEN0bmU3YlRJRlZjZFk1?=
 =?utf-8?B?ekNpa1I0Ni9KWmtWL2MvcU1zS2VqcUU0VStNcHE0ZkFRb2ZnSklPbi9WRVd2?=
 =?utf-8?B?S3hFSVdjRFc2bXE5WW9iTWlzdzBWMXcrRklsb3RGRUx6VXRZblQrUWtnalNG?=
 =?utf-8?B?bWRPcnNGMnUxMExQUTBHbmkxK2o3UURUVXZma2htQlhYSzNsdUlpQXZaM2Qv?=
 =?utf-8?B?ODJnenVGRUpLRS9CSklZL1J5djEvdzVxdFlpanJ4dzJvUFUyd2FPdjVlZXhI?=
 =?utf-8?B?WTB0Y0V4RzFWamF4Z2MyU0RjN0RVR01tQ1JoMSs0Mms5RW5PTi9LUkxlZWlz?=
 =?utf-8?B?M3IvbjF3cWlGVjNOTFplTG1aZ3p5clNRQVpWck10RXdTSFA5YXZGWVQ5SlVK?=
 =?utf-8?B?ZFlpcDhpWldtSjRqOTJqWnZ3aThlNEJIaW1EUkhzSVRML2huSzVvMWFmaFF4?=
 =?utf-8?B?N282NnVzK0UzWHVZT1N2dHVzU0dUQVJad0xvdlV4QTdxdUJpL21oZU8xSEJN?=
 =?utf-8?B?Y2NMNUxtbCtnRnZJdVhYdjV3NG5QNEdSZlZHVDhWVGxDUnJNRkI3bWsrcWg4?=
 =?utf-8?B?WGlDTE4zZ0xyTkpaS1V5S1MvVkFybHE5Qkh3cnBMZVFOMW1lRHF4UUptQ3VG?=
 =?utf-8?B?anJsU2U2eHQvRkJhSklZVWtzVTM0Nm42VHU3SHkvNkYzbWRLRmdqMUc4OWFa?=
 =?utf-8?B?SVJaQ29IbDFhM3lPTTZ4L1RIRlJDakZQRFpGZVUrVThtbkhrRjZXazdsVTF3?=
 =?utf-8?B?UmlNSlNYb3JJcGwzazN1VUppeWJNSWJNdUZwbFJ4RmhkMHUzSVVvSUVyWEQx?=
 =?utf-8?B?aTh4QTd3WkpDNDhUdGxIc05RYjM3SDJsSnRpN2h4eVBWKzRxSmNyN1pMRDE1?=
 =?utf-8?B?NXl6NVdkRUYvMEJ1S3VNcHNsT1E5YlFTcGkvNG4vZkpEN3VOcDBvQmpjM3ZJ?=
 =?utf-8?B?K3ZPWDk5czgzSlNoM1JwM0wvelk2SW9mM1RBSENpZW1kZEdxWGFQTXF5M0FP?=
 =?utf-8?B?NW5BTkl6RlZKcHRWdUFTelkvQ2lUVzdUTDR6cVJmV0p5amsvcUxkblFUU3hY?=
 =?utf-8?B?S3M2bHBKUTVydzh4WGxkdml6d3p3aVBvK0J6cVVzZmdWNFZXNkFrV0N4cC9j?=
 =?utf-8?B?OHV6OXVsVE83bEt6VDdTY09EWFc2Y0duM3R2a3pHTWUzWm5RUDJnVmwvZm0w?=
 =?utf-8?B?MEp0bWkrT0x3RmhyaHc2VDFVSTZ2ellEdmRSSENCYWRscnU1eGNoNmNYV3d4?=
 =?utf-8?B?YkppUXBrYW1KTFA0UHhZNjh2L3RTNlA2R1pVVTBwZ0RncTFEcFlUM3Zncklt?=
 =?utf-8?B?NTZNdU1BSWFsUTVkdi9sTEgrWW9TZ3Brc0xzVzJ1LzMrdTc3K2h4ekFxY040?=
 =?utf-8?B?TnhPTTRJY3B2aVFETWdRNzhvdEo1aVhOWUxCSFhQdzNMSmlqZDJneHpJUEU0?=
 =?utf-8?B?NnpHV2dNRzNEaFE2UkowN3hncE9tRnpYQUdIU1RHcW1LbFp0SjNZcGo3NDZY?=
 =?utf-8?B?NWFyWmozelA1QU0rSkFmV0RxZlFyNy9XV3hRelZNT2h4QkdqdHoyWGRsME10?=
 =?utf-8?B?Rno2QmFrWDRYTkIzV2ZnOWFESU4xTWVnZ1pmSDEwR3N0SlNWaEs0VXpTcjhX?=
 =?utf-8?B?WHh5TUw0eTFOek9ZMTd5UThGSzVaUlFGYWg4djY5OHJibGFXVk1KbUpaTjBR?=
 =?utf-8?B?TkpvZDhMTVRkTnZMQUhjSlFYTG9rc2ovVkllR3NmTnNkRVZLVHNoV0xva0c4?=
 =?utf-8?B?dU1MaWY0a0hVdWljS0pZUWVPd0hXVnJKdGZNR3FzOVY2b1FZMWs3REk1ZVlh?=
 =?utf-8?B?Ymk3dVRFUzNKU0R5UEZaN2svTVh2ck12Nko0SUJoM0t6OFJXSlk4RzNUZ0JU?=
 =?utf-8?B?NmtXR0VhcU9rVjZBSFFZdUNEMkFTaTVTWUEvR2VFeER4MXo1QkRDUVNDZkZT?=
 =?utf-8?B?YWp1SkMwMnZHSkpQM2V3VHV2UjlBSjhxVlBEUG5RYTZwTXhCbUQ5eUxiZTZx?=
 =?utf-8?B?Q1VNS244M05kdk5mbTJsbk1SNThnc1VtQW1VMmhsVDE3Q3hxcDh1MU8xOC9S?=
 =?utf-8?B?VE1wTVFGZjg2NUxhdTRsalY0RXFwTWp6RVFYZ3ZtbXNrbnVBZEhCOFpmYkdK?=
 =?utf-8?B?YVFtcnMvbGNNUEtFQmE4Z2xvSXJJNHhId3hHTUdMeFBhUHRpZ0dFRnI4YUNo?=
 =?utf-8?B?UUVrT1IrVEsxTlNQVENETldlQnRvek1JNEF5aFlXRWVaVFlzTG5zQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d9c18b-537e-4345-7e5a-08de5fcb9e97
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 06:48:48.0208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNwAB6o82zclcP/AmUJBxLFzdvoUIeek4R7gO3PHRRgxKS6VOUzQN04+3E5fcM0qbd/uEji9FJ2xgZTPP29pbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10387
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: A6BDAB7B22
X-Rspamd-Action: no action

Hi Shengjiu,

On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
> There is an audio channel shift issue with multi channel case, first run
> the channel order is correct, but second run the channel order is shifted.

Nit: I'd rephrase "There is an audio channel shift issue with multi channel
case - the channel order is correct for the first run, but the channel order
is shifted for the second run.".

> The recovery method is to reset the pai interface.

s/pai/PAI/

Can the channel order shift issue be fully fixed instead of implementing
a "recovery method"?  I presume that this patch implements a recovery
mechanism.  If it can't, any chip ERRATA?

> 
> The reset can be handled by pm runtime, so add the pm runtime function.

Nit: s/pm/PM/

s/add the pm runtime function/enable PM runtime/

> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Subject prefix should be "drm/bridge: imx8mp-hdmi-pai:".
Refer to what previous commits for i.MX bridge drivers use.

> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> index 8d13a35b206a..1afc729da9b9 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <drm/bridge/dw_hdmi.h>
>  #include <sound/asoundef.h>
> @@ -33,6 +34,7 @@
>  
>  struct imx8mp_hdmi_pai {
>  	struct regmap	*regmap;
> +	struct device	*dev;
>  };
>  
>  static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
> @@ -43,6 +45,9 @@ static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
>  	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
>  	int val;
>  
> +	if (pm_runtime_get_sync(hdmi_pai->dev) < 0)

Use pm_runtime_resume_and_get instead.

-8<-
  `int pm_runtime_get_sync(struct device *dev);`
    - increment the device's usage counter, run pm_runtime_resume(dev) and
      return its result;
      note that it does not drop the device's usage counter on errors, so
      consider using pm_runtime_resume_and_get() instead of it, especially
      if its return value is checked by the caller, as this is likely to
      result in cleaner code.
-8<-

> +		return;
> +
>  	/* PAI set control extended */
>  	val =  WTMK_HIGH(3) | WTMK_LOW(3);
>  	val |= NUM_CH(channel);
> @@ -85,6 +90,8 @@ static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
>  
>  	/* Stop PAI */
>  	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> +
> +	pm_runtime_put_sync(hdmi_pai->dev);
>  }
>  
>  static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
> @@ -101,6 +108,7 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
>  	struct imx8mp_hdmi_pai *hdmi_pai;
>  	struct resource *res;
>  	void __iomem *base;
> +	int ret;
>  
>  	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
>  	if (!hdmi_pai)
> @@ -121,6 +129,13 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
>  	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
>  	plat_data->priv_audio = hdmi_pai;
>  
> +	hdmi_pai->dev = dev;
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable pm runtime: %d\n", ret);

s/pm/PM/

> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  

-- 
Regards,
Liu Ying

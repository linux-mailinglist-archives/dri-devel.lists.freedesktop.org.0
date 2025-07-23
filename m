Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A1B0EDE6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 10:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7624910E3F5;
	Wed, 23 Jul 2025 08:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Cp3YSihD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208B010E0AE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 08:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXirgwlfWfDWHM84uY7xdEAlqQVZeZBdbvuyPfkkrqIzS5KPgKv8LpmDf+YyuFC6LaAcMtdr94JIfFG92TfwI3h3wLn6ROTq8Agj5+MxzIGwf96Z+an/Dc+ug07OPA/j4KM4HCI4sqDm4ruNa9uM7gAvHQRzhmh8t2/xKYToSJKI/lldsfqWAkfUQJP8fnJe7dY1qf5UIE25UG400HPMr6eOFbamzJhuhn4SqNFzTG7Gxzci7WJbsnu83fP2kFtg6NT/mRcwwzYAR4mP2GIKcfSO+QldIlJSb3EboNYLDYfsAAPmKR2NmtlqSiIY3uQG+Z9Pe/olCSOpFraIhgFoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDlab+WoMlh3WvpFRAqch8rh4EcSLqpq/wpTMR/0938=;
 b=egVI/yYxh66U5wb7l2tM3RiA6FjP56yryYWp3b5deCcHvPFc3c2G+CWyG/mzxp9bfztEPaNXC+mVOhuG0P6vDfYDYhigtxnjiLCtAu/18DPl3aIbOQen6irE1Hd8Yg6164V/nXAUo7JVwHTlkAJyUtAspKRZ7eQN+2siXqK6XxdG29lI5Q2m3hkDa5CaLRL6/2kihv9adOWDwKTJK/sUxKSdX7Oi21RzUrWssg0DH3/a4toUS0lESvFPjvy81qpNxckyeuMPC/5qARJm7wXL/Ho6V4waCqERNPKLtCGbZBMA1mt1A1qJR1QFQnEb1GE/uE0rQ0L3F0qwswjsOFmPWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDlab+WoMlh3WvpFRAqch8rh4EcSLqpq/wpTMR/0938=;
 b=Cp3YSihDscnivgq5KWgsdA9L06dpzZQDkynyAAaA9FlbPV7TNPWvPvpYSNJucb2l+5tLLMOh3T+AIN9CushmLMWMECha1Xqe7vcY5gxHXBAD2Tg2uuPr4O46aCUSPbCVZxrWXUKis93bWod7SHMPj9ULJCZigArkO228Bju4SqN65dwwn9sdgel5GpNJmYE3NdxKRhSMBTKWwhhCxLatMIl2UaxHE/5IMkFLqhPDpkHRnAc4ecshbpVxLS7stmB1Btg1N2wSHg95PufjMyjNsanDEhBDIsNe2ls5IiVSW/VD1/1oojB+23aN6iD1qdhNDnuvKtAj0d/v1dVD/u2tpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10315.eurprd04.prod.outlook.com (2603:10a6:10:56b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 08:59:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 08:59:37 +0000
Message-ID: <adf144c9-3c36-4806-b1bc-9122d511f338@nxp.com>
Date: Wed, 23 Jul 2025 17:01:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com>
 <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
 <CAA+D8ANb7kZETxO_CQazoz6-DiNCOGivLhJVwhw9p78ynP1ntQ@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8ANb7kZETxO_CQazoz6-DiNCOGivLhJVwhw9p78ynP1ntQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10315:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2559c2-9d9e-4106-3e15-08ddc9c7407f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3FjaFFBNVlBNjIrUUJzQURDVUZZN0NGZjhoNHVlUlZ4RUVuSHJ3UnR3OW1H?=
 =?utf-8?B?bzBKTndtMEE4ZkFodVJ2RlJFVmY3YjZaNlhvbmZ3WG1RTEk5SXlieXNWTEwv?=
 =?utf-8?B?eExiRUw0cGNZKzR0cVZZUUtDNzhrbC90c0RYSU1RblI4NGYvWWhPcDZFVU1R?=
 =?utf-8?B?TTZaaC9KUmVaZ0FnWW5iL1Q1dGdSVmVCR3JVRFg3L280MC9na09lQ2duN2Nj?=
 =?utf-8?B?clNScTRnQ2M3aEhEcHZlUnRYRi9jaW04YjN5UjY1NG4yRzhMeWpSZkRqeGxN?=
 =?utf-8?B?WHQyamxWSjE5aWJna3BFSHZrWWtOOVZXcWVxSmV0SHdGNjUyNWVDamgrTjdB?=
 =?utf-8?B?Vnc2MEwrOWpvdnB5Ky92d1hrMFR5WE9OTnZlZHd2QkVoZUtieERkK3RHU3E3?=
 =?utf-8?B?TXpwcEI2SDBRa3BVQWhzdmt5VzFkWHNma2Q4ajA3ZFpxaDdFQy81VmNuYUJN?=
 =?utf-8?B?LzNseHJRNktKV3U5UnJXTmhYa0ZEZThmcnRjYmViRWJiL05iaG1HZW84VE4x?=
 =?utf-8?B?Y2pGZ1FxeDJJVzV1UUNBb3c5SlQ1RXhtTjZoUjJnNVRQcTNnaEdyRmNIR1J3?=
 =?utf-8?B?VHVJWjVsOWxYcGk3aU40d3VuMDNMazRqMmpoL0hTc2MzZXZhNjVVdlhmWGp1?=
 =?utf-8?B?YkJuUzVjMi9TcUJIN3FnT2ZDOE84MU9WTy9oRUErbXVpTEhkNHMySjlQNFhD?=
 =?utf-8?B?UGVsd1RTVFVvOGwwUDk1MEpwREs1cGRVdU1EQzJOQVlqbmVOZ3RGczVqcXFv?=
 =?utf-8?B?d0V3RW02MzhWdjBSN0lqZUthd1NEcWdOOVRkMGxlK1d6V29Nb1l0b2ljdjFk?=
 =?utf-8?B?ejlaV1dnNXIyNi9udThMai81NUxMMENhbjVuSW9TK0U1N2Zpb2pmOWlkbzhJ?=
 =?utf-8?B?azhGRXdXSDE1clJReUIvRUdGa3hTYW9XVHhQUzNnUjgzM0xjYXc0RmFXZGx5?=
 =?utf-8?B?YWliZEtzTGk2VjVXQTNyZFY2Z1FyK0gyVk1aUE1kWWdocTFmYk9PaFUrQlFR?=
 =?utf-8?B?K2w4NEhPbktPUkprbzFteDREUU4yMjg1Y0VGUVhQbUx0SU8zdStVVllocnlV?=
 =?utf-8?B?NXprUE5MWjRmRHZWYjhvVmRjZk52OXBWVWdkc2g4MldZRUY2ZnB1OFY4TGtK?=
 =?utf-8?B?Y1dSaUEvbFVLa1I2Wk5DVStKd2YvdThwOTBQRGw3MTRBWW04Z0N2VzFuL01U?=
 =?utf-8?B?cHpQQ3V2NkV4dFFPVEltOE1RTDR6Y2tVNTREVmx2bmFDYkJSYi8vdU9kVzN5?=
 =?utf-8?B?TlBYOHdtOWlxVkQ4bWhRK1dPYTdnc3o1Z0JQTlMvL2NRU0pDaFhOZ0wyK2lr?=
 =?utf-8?B?S1RTOHNwY083WEhXZDduek1TTVdjQVNtU21OU1RsMVF6UklvSFNTQWRONTdY?=
 =?utf-8?B?akVTZ3hyeGUyaUkxUjlKUjRaWGNNWEZOakp2TTBPVGxDeEsvblBWTEpOY2Ji?=
 =?utf-8?B?OWg5Rjc2Z2RNeit4R3FrbiszTFdyMmZORmJhUTZPbWZUOVhIY0pjelhob3hs?=
 =?utf-8?B?bWgrUHFweGJqd2xxYWt3U3BlYzdDdHByK25Ta1ZQYVZpWVJJQ1FIK1FSWWcv?=
 =?utf-8?B?NUtNOTArWHI3MGhBN0k0RHViV2VXaUtjTm9vNEhuT1JqSHVLWWxIWWZXeGhV?=
 =?utf-8?B?aTA5UCtDUGN6ODNPS0tsTGF0K2REajJYYVp3YSsvdHd6aUNtb3NWeFo1NnFp?=
 =?utf-8?B?Tjh1MTZ6aWE4a3VEaU5Oa01NWnMydEVZYVA2VE92NWQzeFFUY1QyQXkvOU5h?=
 =?utf-8?B?YUNFcjAzSGExU1JmY2xGckM1NUc2ZGIvR2F4YTg3ZDVVQWRGZk1VVFpmRHNV?=
 =?utf-8?B?aWRvWnBSWkc4UzlKYjRYcHEvbEZFT3hINU5ycTVVT1NrRDlxUUtWYVl5Z3Zz?=
 =?utf-8?B?TVpHWGxjUzEvcjdZS3lVWG9EQ2svQzBsUk10Y285MkVneWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE41VlpRc3I0eGV4OGt1QUxCWVdUaFNySmI1SDBtVWpGRnQ1b053NnhsVEZa?=
 =?utf-8?B?MVZsdmZLU0ZFd1VjcVVTMU4rSENlU1NMZFdoNWRSck1rMU5tV0dHdzhONGFn?=
 =?utf-8?B?emF5UkhRNWNSdkNRMWRTWjVSMU1ZOGdEQXl3N1NSdThlRHQ4V2dXdG4xbzBx?=
 =?utf-8?B?dW9RNCtBK1pnZ1VhcWx4SXlibVFGN1BHOGphSWVwWjJ0bENxQ2k2WHFPVU92?=
 =?utf-8?B?YmQxOFJDbGcxeFBEWkVsU3pyUW55aklCYVZ6SjJ1cFNDUEEzSjhHV3Evamwr?=
 =?utf-8?B?OVpqemticmE2OHNsYitxYjhibjZUSlJoK1JURDZrNWUva05LZ1VadExJTTNM?=
 =?utf-8?B?SldObDhVMHJVTXA1Y0daODF3VWt4MzA2b2YyZHNoNlRKVHpibnJpOUZtdi9C?=
 =?utf-8?B?RWNZWWlvSTg5bWpRbmFsYlFDbmx5bS8rekExWnZXRERBVEtKMzA3Yk9rbkw0?=
 =?utf-8?B?a1RMTis1N3hPMC9kbVZlMlZHTmV0d2kyNGttRFoxNWRzb2dLVkVoRDZVc0Nv?=
 =?utf-8?B?MGJjS2NaN1JRUXkvdGk0NFBpNHVMRkpsZUMxL2F6eFZsandJeStvSGdhZVR1?=
 =?utf-8?B?UG9qSmdYWWF3anl6OEFiemxSM0V5cVk1V1Y1bVMrcnE5YWh5TE44dEZ6ckJv?=
 =?utf-8?B?blRucTJGemtFVFozS2dpYk1DS0tFN3d5ZWhaaW5iWGl2SFA3UXJBbkN0Qnlm?=
 =?utf-8?B?aHE5R3lSNXUrYWwrTVhHUHM4T0dYMm0reDZHSW81bUVmejJBTHZMWmhmZnoy?=
 =?utf-8?B?cGh0d3ovV2lPMnpBZWR5ZTU2Y1EyMkh6UWdRZXVZNU0vSy9mNDJGK1hFck9l?=
 =?utf-8?B?QTRCTW1JLzh3NGR4a3JEVk5mYzZrMXFHZTJqQ0VxdGV5ZVB5dGdJdXNzalY5?=
 =?utf-8?B?Y1ZzV0lmcHM5RmhWR2tZeFNiK3lHcnB1NEJnMHpLOFBVZDlnMXNaNEhvRjlN?=
 =?utf-8?B?OXBnZDJyVUdhREcveHVNamU3dXl2WmF0NURtbWhDRWpKZ3l1a1dUOTJ4Qk9j?=
 =?utf-8?B?b21nSTZhVnNJbUZLTUJGMG0zdHhxelFhNFVTaS9CTEM2ZUpUdUgvOGZGa1VE?=
 =?utf-8?B?aEo1YkxDQitFaW9iSjVEUk0zbFJTSndKYk5NMUlueHZ5d3RERDJZN1ZjUnI4?=
 =?utf-8?B?dExLQWJUMThkdkZiTk8xRzAzTUNVT2Y2MjlwTERwSnk1bFVDc3piN0REV3FW?=
 =?utf-8?B?UWtyS2E4Rjc4RWtWaHluTkNKYUl1cEpRSnZVSnBvbEFKcWNVU2dZVmJvVXRq?=
 =?utf-8?B?YXVmVTJydkZ5ZDl5cllrMzBWanhpU1piRisrMlNONXlUeko1dzc0UU5hVXAy?=
 =?utf-8?B?b0g3RmFKY1R0VXpuUDh3SnhwTlhubGhud2JjQjJmVSsxdnlQdHRjNk9Rd0NK?=
 =?utf-8?B?Q2VYOXJJTk5ML0IrS2hNNEhPa0VYVTMycWhYZGR0MXUyT1k0cW9VTjZhYjVK?=
 =?utf-8?B?eG44djBVdU1taWpjSHBzbmgzVjFOaE5ldHZQYk9BYm5kalBpa0pUNzlLVmpr?=
 =?utf-8?B?UWwyeVg5ZXZVazR2cXFkcmwvNUJFNkpERXMzalNPazV3QWFXOE5UMFBmcGlD?=
 =?utf-8?B?c2psQkxLdzRlM0RJeFZmaTB4bzI1WHIxRkx5alV4N0xFdUxUVktVUVNXUkFt?=
 =?utf-8?B?eG80T1RKSUVqMmwwZkEza081VjU4SGZ2ZHR4Z0hCT0U0YnFQSGtyNkdZdEpO?=
 =?utf-8?B?SnMvdlFUZkd1NVdoNmxsWmJ2bWY5Tkg0QWdQbld6V3UwVG1icStld0dLZjJr?=
 =?utf-8?B?MGx3aSttUmlmRnF5UzRYRUpYTlNGVXdzdk1YM2txemJVK0ljZHU5QWVZNXV0?=
 =?utf-8?B?UDQzSzh2a1o5Zy9LMWZtTWtOQkhNRjE1a1NuMHNNWmN5OWx5dGVaRUhrck5H?=
 =?utf-8?B?bzFpaGNWMWJvZW9wYXZDalhhaXo1RFZlOVJhMVdkdmZEaGVLTXlINXl6eWRM?=
 =?utf-8?B?K2pqRkdBMUJKUXN6dytrMURFWXJrTWJHVDAvVG5sY2hHNHVsblh5Slh5OHk4?=
 =?utf-8?B?MHZ2RUkwSGhiMGIwWGk4WnlCU2FlMFRKMW5CR2NSR3I3dEZwSDNjSmo5Mzc0?=
 =?utf-8?B?V0xEUkNBbWF4cTNMMWpucFZVV3ZuK0FmNXQvTHRvMlJObWw4SmlXeXRmTEVM?=
 =?utf-8?Q?E9nqa9gZEJcHwUJGBfdZO1Sr5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2559c2-9d9e-4106-3e15-08ddc9c7407f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 08:59:37.7657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwNymLuPDMw8hWPOMlvYEC/7Z7++1PLAlobZd/DhsVauikosbMHr/uGl9AYtwnqBvVlEx6pFOCVpfxPK2/39UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10315
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

On 07/23/2025, Shengjiu Wang wrote:
> On Tue, Jul 22, 2025 at 3:16 PM Liu Ying <victor.liu@nxp.com> wrote:
>>
>> Hi Shengjiu,
>>
>> On 07/18/2025, Shengjiu Wang wrote:
>>> Add binding for the i.MX8MP HDMI parallel Audio interface block.
>>> As this port is linked to imx8mp-hdmi-tx, add port@2 in
>>> fsl,imx8mp-hdmi-tx.yaml document.
>>>
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> ---
>>>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
>>>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
>>>  2 files changed, 74 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

[...]

>>> +properties:
>>
>> In i.MX8MP TRM, HTX_PAI block diagram mentions an APB interface.
>> Does it mean a clock is needed?
> 
> The APB clock is bound with the power domain, so no need to add it here.

That depends on OS's power domain driver implementation.
From DT's point of view, the APB clock should be a property here.

> 
>>
>>> +  compatible:
>>> +    const: fsl,imx8mp-hdmi-pai
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description: Output to the HDMI TX controller.
>>> +    unevaluatedProperties: false
>>
>> Why do you need this line?
> 
> per my understanding, this line can be added or removed.

I'd choose to drop it :)

[...]

-- 
Regards,
Liu Ying

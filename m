Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03ABEF751
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 08:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00A510E25E;
	Mon, 20 Oct 2025 06:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FSXAjCe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23D610E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4UuT6XbJaasfTkT6u7VAu6po+1SRjuIxL1fz62GEBuPQU/6dL5euE6hk1gtrk6ZD7rDr02UGQF34QeEuoTgYIJl/mEFKYfWVJhz+3ozETyfcRHQlCyai88bz/R1CChzUv74wl1UEvwS57j9cZxdbElo4/TIllagUphYlBwGs30fuYiTB3lvMCiQshyMvffj2oY0pkNRJJAVaFRLNTwQHSSj7Go7DRfH74UtQloxiHQev0Bd/QOgIuRmLNKWAYDaZ8WWExg8TqZ2Rpy/K0yLqgvBSJqEidtx3nSlDZ0F9xOvSl68zPtXhd2ectNrE7mqmc+mP6sJ0l1fmxj3SooPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaGP7uTcJdcvn3BSYOzHeiY447AXofcJyFkDo62N4co=;
 b=ZdpfFjOa07A6YVSlDW1ePpvEq+8InQPCU9VVLyky2Ibt3mu++PBsBCIP9BvJ2W6FjU/Qp5BjtVMNoDiKj87wyDz2KwEatoNUENVP9iwnGTGvjYhCiwhoHw3+Qbm4x2aI8uJsYlNvp0MVoL97d3l+PvDzKp3x1wPBDR4jEGjTgtEdv6WMeKlL4luWSU2AADentj9o4X8SJkKgkq4dpdSEbuo1fkF7VqWRrgbWuR0VfPjm0HDuIk09B5dB7OPd40vj2zvF7XCNi/3GNXsH8wDEArQt+ggD49ylFBT/Ra9r6HHVn92LeK8NOs9feqoGlbP9ucmPyuT0QCAoRm6hkJ4zOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaGP7uTcJdcvn3BSYOzHeiY447AXofcJyFkDo62N4co=;
 b=FSXAjCe9+DF2Wc6amKINdejetnHtQGowBLi7WUVXtgXJzpGUl8uF3TJdvLHt0c4XS8mnKu7XJiKPTsRIfCyQAyrtN7ZMWYJIhHLgQxqZ1wXiqsUeOG6o7HgPJhOLu9iKOUWZ0MHG1JWO8qGDi7EBJetqrsATF3rXZ06tu+hgAzXQ+25VkIkvLWd3bwpXeioWrRcB2HQcTSgITsW32mOMJgHi+VVGmkSnahSqGcKK3gPVY9ZyrPFVtE2n+k0Sxe72Og4nnqUYRc87N5SuVDiNsX+foIzC2ylXJvxmI/NN/pNp4+rAonxntW1VoUUuBZLqkQ9Hne+/RJevA2GhOJTrjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10749.eurprd04.prod.outlook.com (2603:10a6:150:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 06:21:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 06:21:30 +0000
Message-ID: <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
Date: Mon, 20 Oct 2025 14:21:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251017154029.105099-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10749:EE_
X-MS-Office365-Filtering-Correlation-Id: e2698e8e-c80b-41c8-17f6-08de0fa0e820
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|19092799006|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmxBL09JdVNTd2NTT3RvUmhIeSsyZTFLSUI3a2NCMmJHTGhNVlVZTlpSeHFB?=
 =?utf-8?B?ZjFKaGhuR3hDRlRaSWtyVlVua3lJOHRpNDF2Rk9aOHFpdUlSbXB1MEVCVjNM?=
 =?utf-8?B?M3ZsVXhqV2tTUUFsZ0JnazRQMmRwaWJ3ZFpvQ0xmTkNUWnlCTFpyWlN6UXh5?=
 =?utf-8?B?cy84aVlnNUxIVFUyZlNqbUJ6YkIrWmtSRmtkOUk5SkROUkNUamtVVnV0bHo5?=
 =?utf-8?B?akFITUMyVm9PaVBSd2MrcWx0SDZhdVI0REtxRlVUNFNyemFCRVNXWG1YcUFi?=
 =?utf-8?B?bkxDU3p6UksxRFMwdFBQWExyUHF0RXNYbUZUQjFHSWYvNFJtalJyWHJOY2Zl?=
 =?utf-8?B?eWxQR2ZaMnRjaEFtTjRsbllrN1R4ajROK3NKTm9RNHVuKzEweE43R3E5OUJv?=
 =?utf-8?B?WEtPL01nSDJSbDhGWS9BQTZ6bEZQaysxTHhlbnQ2Uzc2WGc5Tlp0MzhTL3Jn?=
 =?utf-8?B?Q3F1WnBobHF0YVU5WkNjUmpDWUtXN0tYQ1B5bHZpTG42TWROV2xxVGowQzNX?=
 =?utf-8?B?YU1yNWY5alZDK3RqazFFNmZKYWszcDZ4WDYwRmVZT0lVVzEzVmNDa2RUbFg2?=
 =?utf-8?B?TFJTakM3L0lPQkFvT1Z1UjVQeFcvbnJ1RHdueU53bHJaNUY2czRiem4xYjJR?=
 =?utf-8?B?K0p2aUNVK05IK1lwZktTKzVNR1k3QXhEU08vdVU1WXNJSzVrWlp1RENzT0cr?=
 =?utf-8?B?cmdnbTFzQk5YWGNXbVlTdkdnZCtMVytxQ1NtbFZ5cmRycy9Lb2FQblJtUDFU?=
 =?utf-8?B?WS9MYkcwbGdMZCs3R1JISGl3NVVtWVh5Q29sZ1VITUFCMCtvU0RGYWllOTIw?=
 =?utf-8?B?NW9zVmtaNktBUFJBdjh2YVhQc2NrQVNBTmtUaWd2SExwSE41aXByK0NLT0JW?=
 =?utf-8?B?TkxJQ0c4QVZyRnFEQ3pvNFhEcUlGQnNXS3l1anhCWU40c09JUm16QWZ5L2dZ?=
 =?utf-8?B?NFFVL1cyS0twK0w0VVVLQkp3Z28ralIyL1c2Mi9tMTNSdjFibEo2VnNxMWkw?=
 =?utf-8?B?Z2RzZG90T0QwcmJKMkUxQ0F2dUczOEx3VVdVdTkrQkN1akhXRHVvc0dBbE53?=
 =?utf-8?B?R0VzMERKVXhVbER1ZWJsRmZDUThCaWRLb0xLa0dCYnZhazVZNDFTUkNub3ZO?=
 =?utf-8?B?YkVQZnFhSE03Uk1xbWRCMUtxTjdrdWk3TVlKNXk1aklkLzRVdjdobzdKYWdP?=
 =?utf-8?B?RnNRbGZUNWliUWtaY0tFOC9BQloyeWZQVWtYM0xLWEpycVEvT3BVU2QrQzFT?=
 =?utf-8?B?Q1ltV2ZiUmdRODZteFNRMERZTVVORkZzY0RFbnBQNjRJTzh6WE9WTUZWdkNU?=
 =?utf-8?B?RjhibW5icmFtMktqS1lkTFFHTCtWRWxONStvMDFna0p3UGk1V2dQa1Z3VkU0?=
 =?utf-8?B?clArVFowQXVVRFVwYnVYNU5nS3ZnbW5XLzZkMzZoSE1tNEdJZmZseldjRExl?=
 =?utf-8?B?aDlFbGZuYzBkbzJMeTFOVjV4Vmoza0czMU9oRGxDSmtZaXl5cFlaQldiY2pH?=
 =?utf-8?B?S2psWTNEZDJOQ2U0V3o0U3l0eUNsRldLOFdBdUtvVGlSK052UkI4U2RaQytJ?=
 =?utf-8?B?ajJMM2tLYkFPM1pHNDUzNHNwMmxQMEJhVlpRTDRabDZ4RFp3WDFEcFVzTTUv?=
 =?utf-8?B?c1lkR0ovcG1ZU3owdWl5RUEwaEtaSHl6eWl4clZaa3J2alF5bVlZbFZBNHJm?=
 =?utf-8?B?UFBLRDQzbU0wYkdlbHBZOE1JNnQ4RXR2Q0tycE1nWEpLN1NVWTR1VEFLV1VS?=
 =?utf-8?B?amc4N2liVTZkbEd0dDNlTE0wSnFDOVVkUTlqcnVJQmxBZ3RSdHRZbEVFYmJ5?=
 =?utf-8?B?NEZzNThCZ0FWVHZYYUpyT0paMnUvUHl6UDZmVTA3YXNxeXN6YWx4VnloaGtm?=
 =?utf-8?B?bldkY1B2NXhCUXF1MlQ4U0VGUmNXNEtlNERKam1PNTlsdUZ4N3pLR2FHSUJw?=
 =?utf-8?Q?MwInhx/chJKzg7DUzuFUm9+ZU9iPucgg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(19092799006)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umh1YWFVL0hDTEJDU0prWDE4aCtDZUFNckVHQ2ZGTEFvMFB2SmFLYW9aajRq?=
 =?utf-8?B?NnozMGxWVFhYWE1DblNCcnlmdmFnOElzb00zT2xyd2puU0hlVFp2cWxLdGpW?=
 =?utf-8?B?bnlXbW5LeU5JTEtuTWNBTFdoSksvSXhNb1NrWlVkM3ljYXMzMDFxOHVSMEZm?=
 =?utf-8?B?QWtTYU1XbDZjN0RtR29UUjExbzNaM3JLSWRGVzBnYkNwQmN2N2xtUjhrd2J1?=
 =?utf-8?B?cC9UWUMwelRHQjFjU0dyY3ZHUTllazFQYUMvRWk5UXhiTElXTTVMVVhKQzJw?=
 =?utf-8?B?Yk50Z1ArcHhtVUdxR1BkUTArU3R3WlRaNXNZbncvL2xIb214RjE3eVQ1WnZS?=
 =?utf-8?B?bHdvUFgrM1RaUWFPaTN3RUlQK0FObWx0RGZjNGQya2ZlRVo5RFppWEFXRnpX?=
 =?utf-8?B?MnJod0x3NVp2N1ExRSt3bmJxbmRaSjUyRGZ0Sm03ZDZlYU5xQnRlbjFyc3lP?=
 =?utf-8?B?YTdVbHo2MWpWbVE3blJyazlCZkNuZjJlMXdyTjdGN0RtQkI1QXlFQVRISGdG?=
 =?utf-8?B?dmwzdFBaVnp2WkZUUjJwUXRJOGViZFBYUjd2UGY0QUNibGVvZUFZZDRuU01N?=
 =?utf-8?B?L2VSVnRBdk5SV05YYjhZWm4yM0RDM2VWY0ZYdENMTTlDNTdTbENpWTh3OExU?=
 =?utf-8?B?OENmOHRXMFd0dEVqcEpGU0sxUlAxbnorVTlLZm9POHpEVGlINE00RzlCcTdC?=
 =?utf-8?B?UXdXcytGWWkvWisyMDBIYkt0bUdzVis5bTYvOU9FN0k0MFliYWhOM2dCZ1Ru?=
 =?utf-8?B?cjBMT3p2QzBCdk1nWVRiUGZCWmgwNWt5RnI2a0dPdlJaK1A1Z1pzNmpPUCs2?=
 =?utf-8?B?YUFQSXhlMDZKWFUvaVNHSDY1QjA4VEJGWnJqT0V3a0hob3pPdnFMSjlnemtB?=
 =?utf-8?B?U3lveVhpNkdveUZNREpQb2xhV0h0a0JLcjhnVnJNYStkemNSTjVBdFNvb3d2?=
 =?utf-8?B?dUw4OTRjSDFVUG81Umxnbm5VM3RKK2pZL1NjRUJ5RmVZTHovK0NDOW5SeUR0?=
 =?utf-8?B?Z0J6dDVSK1FpU1lKQ3FPdjVWcFRUaWdCUTE0MzQ3OG1RQnFNb2Rmc013MG5w?=
 =?utf-8?B?aXBvRUpVREc5NlljRGFhL2UzQlh6Y0VyRHVFRWhQKzJ5bW1xTDdxQ3h4a3lv?=
 =?utf-8?B?Vk1NRUxuWW1WUXVOWGtIdElzUTRLNVFSc3IyNE9ocTg2MVI3bmQvcHZOQjBN?=
 =?utf-8?B?aTBHcEthYVJoYUd4clpRNG0xVnlIaG5lb1VJb0hSNDBnYnhINmt3SVhYdGwz?=
 =?utf-8?B?VGZ1Ujhxc3VLeFc1QmlpU2Y3Z2NrZit1c3ozUktXSk0rdGFwN1dTZEFXa3Fa?=
 =?utf-8?B?US9Dak13Q1dSNk0wRUEzWDRKZTl1NWYwUU1JRTZRK0hUNlh6d0Q2NThMaGhE?=
 =?utf-8?B?cTlPbTVDRlZ1R0puZHhmSkFVeEJJdHM3TnBjSlVEM2VobjNmZzhvMjJuU3oz?=
 =?utf-8?B?eDNrMVFVcE8zRE1NU0gvdlc3N1N5eTVDR0lUdXpQNC93Qm82S3BNNXJMcmxU?=
 =?utf-8?B?WmVmR05TZGFEZFB1MXRIcVVzSEVWSGlFYjBvWjZtYWtHZ1BYd0N1N3c3STll?=
 =?utf-8?B?RExiV2ZjNERQaTIzVVZnOXlnVkswU3J0cXJ1T3ZxQTJHY0ZYRVpvd0VIZ0Jt?=
 =?utf-8?B?RG5objBwaFdiWS9qUGtzSkUxOEpOckRMZmdBajJ4ZDNGTHNYLzBkWmxNSk1H?=
 =?utf-8?B?SGFGSnVnZk5sbTNzRjdra3VnMmVJQ0lmUE1SYU43dEw0NjhSd1BWbW54RC9W?=
 =?utf-8?B?MHR1VXFBS3hKYmxTS0tOdzdickV0QjRybHhWK1FCMzVEMERpN3JNQ0wvbnJw?=
 =?utf-8?B?dm9hcUZPeExWdG1ORDluYWZPK1VsMU1ldUU3Wkg4dkFhYW5mVGRtblpKOVlM?=
 =?utf-8?B?bis2NzcvSU12ZmNPWjQwMzZtcHhuNGFCMXRUZkx2V0V5a0FnU0N0TDZpLzZM?=
 =?utf-8?B?MGJWa1dpbUFiTndQT05ENUJPTVFUSFhjbkREMlFUR2FMQnNZVnV6WERkQWk4?=
 =?utf-8?B?eWphR3VUV3ZYVmQ0TFVxSnJKUWFXUTZDd210eWNJY3BoR29XWUFsQWJOR0h4?=
 =?utf-8?B?YjR0NHVPR3VmWURRL1UyMkFRQmIyM1liMGw1ZWN5a2kveXRvTlJGVzFmSzRF?=
 =?utf-8?Q?em+7z1YfY1/wFLTCpeo5TbHzk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2698e8e-c80b-41c8-17f6-08de0fa0e820
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 06:21:29.9710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1bArZCI9rXaxKo9WqPIl+gqKV1cHkuokL5Dp/wbdfuWOaz1riQKPK/GXGDwfETs/fOpGFuLAn0bAdREy1+U2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10749
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

On 10/17/2025, Marek Vasut wrote:
> The DT binding for this bridge describe register offsets for the LDB,

s/describe/describes/

> parse the register offsets from DT instead of hard-coding them in the
> driver. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 42 ++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bce..c54caea0b63fc 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>  };
>  
>  struct fsl_ldb_devdata {
> -	u32 ldb_ctrl;
> -	u32 lvds_ctrl;
>  	bool lvds_en_bit;
>  	bool single_ctrl_reg;

single_ctrl_reg can be dropped then, as it can be expressed by failing to
get the second register.

Furthermore, with this done, lvds_en_bit is the only member left and hence
struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
use a structure for device data with only a flag.

>  };
>  
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  	[IMX6SX_LDB] = {
> -		.ldb_ctrl = 0x18,
>  		.single_ctrl_reg = true,
>  	},
> -	[IMX8MP_LDB] = {
> -		.ldb_ctrl = 0x5c,
> -		.lvds_ctrl = 0x128,
> -	},
> +	[IMX8MP_LDB] = { },
>  	[IMX93_LDB] = {
> -		.ldb_ctrl = 0x20,
> -		.lvds_ctrl = 0x24,
>  		.lvds_en_bit = true,
>  	},
>  };
> @@ -90,6 +82,8 @@ struct fsl_ldb {
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> +	u32 ldb_ctrl;
> +	u32 lvds_ctrl;
>  	bool ch0_enabled;
>  	bool ch1_enabled;
>  };
> @@ -204,7 +198,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
>  			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
>  
>  	if (fsl_ldb->devdata->single_ctrl_reg)
>  		return;
> @@ -212,7 +206,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	/* Program LVDS_CTRL */
>  	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>  	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  
>  	/* Wait for VBG to stabilize. */
>  	usleep_range(15, 20);
> @@ -220,7 +214,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
>  		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  }
>  
>  static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
> @@ -231,12 +225,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
>  	/* Stop channel(s). */
>  	if (fsl_ldb->devdata->lvds_en_bit)
>  		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
> -		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
> +		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
>  			     LVDS_CTRL_LVDS_EN);
>  	else
>  		if (!fsl_ldb->devdata->single_ctrl_reg)
> -			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
> +			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
>  
>  	clk_disable_unprepare(fsl_ldb->clk);
>  }
> @@ -296,7 +290,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	struct device_node *remote1, *remote2;
>  	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
> -	int dual_link;
> +	int dual_link, idx, ret;
>  
>  	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>  	if (IS_ERR(fsl_ldb))
> @@ -309,6 +303,22 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	fsl_ldb->dev = &pdev->dev;
>  	fsl_ldb->bridge.of_node = dev->of_node;
>  
> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
> +	if (idx < 0)
> +		return idx;
> +
> +	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->ldb_ctrl);
> +	if (ret)
> +		return ret;
> +
> +	idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
> +	if (idx < 0)
> +		return idx;

Hey, i.MX6SX LDB's single_ctrl_reg is true.  This would break i.MX6SX since
this returns with error code?

> +
> +	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->lvds_ctrl);
> +	if (ret)
> +		return ret;

I'm not sure if these of_property_xxx function calls are correct or not,
but they look pretty heavy.  Can they be replaced with of_property_read_reg()?

> +
>  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))
>  		return PTR_ERR(fsl_ldb->clk);


-- 
Regards,
Liu Ying

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B468C7FC6
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 04:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFA510E0A3;
	Fri, 17 May 2024 02:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gjtf0bRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2286410E0A3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 02:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlsBwCLrqb6qFeOojRL4ooUkbJ33PbqLiUu98sr011T5VK7oFLODzBga4nmPKJQFQCRg6zMppGg7Ok0xORYR/ZZwWY/eyhh45r7fpiPKhTIzX3ZsM5+SKI/eBhF/E5UB+S8j74nnOFr4A6L4Ocf1uUpEqitlN4rPi2hl8Y5iRLEcwqEtoqfqaW8FQamCAVsePgelA36JA47QqB97xN/gu8+yTo705+mwtyk8oM8kEiln2IYzEGQ+SE/+lYOzKrTMspMO08Wgyfe+bTIOkzz3vfrpeg3IAIQuOAKScbwgf7pjB4mauHmLYp+2i1WZhl89x7JdOwfGAJDQVnSNigkU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL2cuG/84XNf3kXsWmxWBFCsUdQNX52bvGEUAtEM19A=;
 b=A0pECpYJgw4c0oK2H5CWywuln87e2KMPa9dT+jeWJintKF/UCQ15s1m29ZqIpW2ghD+7Yl4U/YsZh8K26XJR8FYM38GD0fiO7G3ayhjZzUIlZVoQxyhkrjNYEIEQE8WkDHtMWs9CbQkPW8xPPaTselu+2EPlon3xcYjFOsujqA5fTFXyIhcb7DMKVeabey/PhBIiG7r+BrKlRc5kR//twMP6KN0D9RROOSamDUvghmcB8mWqRbBV6ICiMQen0yziDBLYVXfRm7VxXUcUsFKybIsvVjiDmyDsMVtRxaooxd4t2GbhaJyFqXYelis3vMHOTk6jJ9FYX6/NDpRpUmPIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL2cuG/84XNf3kXsWmxWBFCsUdQNX52bvGEUAtEM19A=;
 b=gjtf0bRIW2G44+I50e5S3atPbLJpXbqy5aIsCZf+KejPpqJAhXOALfnNIZZaOmufRNZ1barQixBZ3KhbXqXyLsMhZT10ot7c/8j4sIV5eOAAl75grR10NvKacqKTZyxj5CYmmFuq/O/wy0HQu8psCIb4uyD7Ken9+E1mvXE/9zA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7441.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 02:11:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 02:11:14 +0000
Message-ID: <82bffafa-567d-4988-a7c5-31a2f0a4214d@nxp.com>
Date: Fri, 17 May 2024 10:11:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: display: simple: Add Microtips &
 Lincolntech Dual-LVDS Panels
To: neil.armstrong@linaro.org, Aradhya Bhatia <a-bhatia1@ti.com>,
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
 <9f3c1825-0438-464e-bd6d-88da6a9c3b3b@nxp.com>
 <cecb865d-2f59-4cdf-991a-4607b200d503@ti.com>
 <6f54a590-d3dc-48f2-9061-27afb1c34fef@linaro.org>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <6f54a590-d3dc-48f2-9061-27afb1c34fef@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 60714c9e-03de-48ae-9d3d-08dc7616a10d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlJOTEN2bEVYbEpYZVZiSkNOdSs5UmwrNkRqRjRsWlZ3dENYcXVLNFVKQWdL?=
 =?utf-8?B?OWxkeTUzQldIekZSRGZDYW9UNDZ1bGpVTnhVSTExSUZzRzhqY0JXOURVdi92?=
 =?utf-8?B?R1FweFI1L2lVZ2ludjg5bWRnWXA1bndLSUJaV3JTMWJHL3BoSm1nQlBYTjNK?=
 =?utf-8?B?NURRU0dsSGozaUF4K2V1VUE0Zmk4c1gvaUNuYUV1cmt1R2l0L1RzRG8yeXdW?=
 =?utf-8?B?ZWZGdlJPdGlVNnpGcENRbGpCMG9PZ25jamJ0Ukl6eEdxVTZHL2kzMnZnR091?=
 =?utf-8?B?VzlXbXFlTFJaVHVBaHJySW9pdVgvaXZJc0FQU3lJK0NWbnM2U1N2a2p3dzdM?=
 =?utf-8?B?TWF1STRqSGR6Sk43Q3JVV24wRlFyRHR6RG5adzRNR3djbjRyRnQxb0pIa2NG?=
 =?utf-8?B?TlRqK0VXYlJGblgwYUh3eDJpeVFOQ1VKVVNFNVQ1ekg5YkY1aFM2cmVGeFBI?=
 =?utf-8?B?bXg3c2VKQm1pYTZjMU84bURqTWh6NGRyWDRzMTcxU3lGVHYyb0RKemlFUDVN?=
 =?utf-8?B?akhiejlNOEt0TDFSOGZWMllnTnNGN0dxQk9sK0ZFNFhBT3Q5dFo0aHA3UGwy?=
 =?utf-8?B?eUU2cGNaRWdkZWFScVpoU1JtL1BDY3FIQzBQbVZvb0h2NVZnKzd2QVkvbmJt?=
 =?utf-8?B?ZXVjeWRIR3kwazhadThUd1BYaStXVXdISGJXaEZmbnc1K1BmTmZWZk9XU1cx?=
 =?utf-8?B?dkdoeEYzYzZncVVkY3R5cWFPZUhIb0c3c21VbHZtY25pTVVPcTRYZFZsd1R5?=
 =?utf-8?B?ZkJ4eE03V0xObXdoTGtmcHEzZzRFQnNIZjg3SWY0Wnp1TjVmZE9FWGljR2Vi?=
 =?utf-8?B?RmxUazB0RVhhUzB3LzhJbzlvN0FZV0YzU01tYTNYR05sWmRQRUc3MGVjbzQy?=
 =?utf-8?B?YklSK0pWT0QwbXNSRW5BaEIrRUR2NEJIQWp3N0tOMWR5bllTaDFqME5lb2lT?=
 =?utf-8?B?RFZrUEQyclE0dkhnYXprRkYxc0E2bjhPanQ4YTlHdFZpV1hrbE9pYzVOVVY3?=
 =?utf-8?B?U0J1VDhoaFN3dUJyajNPb0JjSU00OWdwY3NHcG84UVRWc3h2dGd0NkVtSFZm?=
 =?utf-8?B?M094a0tKNkYyTW9yYi9Od0lKajJFQjRLQmNocXp4SHd4K3lNOGpkem9zS2h6?=
 =?utf-8?B?WXNYMSthYm5JYlV2eDgralBOSFRJcTB3UE5ZNGQ2UHJFenJNYzRCL3djNjRL?=
 =?utf-8?B?WWR3NmNNZnRZKzl6WGxJNUY2SVhpYisyWkFtQzJZNFB0MXVvSmRrM0Roa3Rr?=
 =?utf-8?B?Rlp1SklZQWJNb0dEVEx2elZLMkFOSm81cEJrSjhWZE5nN0NDRk5xY05PR0JD?=
 =?utf-8?B?aVR0dEZtMk91eGU4VXE4Uk5qZzNqMHNsQTRSamlGVVJQMHhzYTRJK0FyVnQ5?=
 =?utf-8?B?MHJyZjFzSFI2N3Y3TTBQaE1nYWZiNTNaZkRIZnEyUHBoZG1DVmRHOWV6MHpu?=
 =?utf-8?B?S1hHdk1Pb0hGd21GTGVrS2huN2NHRlNsSEsvbWJRdlF5TjQ5SG5GUjBCVy9S?=
 =?utf-8?B?Y2VFSUJHcDJWcTVJSnAwVm4vWnR1Zy9jMG9UaXZiNzhxNDRsT3ZTZkJsTXJi?=
 =?utf-8?B?cTdzRlJjbHB5TVZRcXU3RHVnSTM0NCtPMjFtTkFyTjUxNGdNZ2tMMkxnNHFU?=
 =?utf-8?B?ZUlkWml6RTBoMVE4R2J1K09JNTl5ODJaQ0FzbVo0YXJMQ1IvRTNVcUJKTWxB?=
 =?utf-8?B?Z2xoRGRhTHRocGlhUXU0ekthbzB0Z1VlYmpHeTZWUXBrMGd2TnVFNS93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThNc3pkakp3S0ZaNFRQN2hRL3ozQkI4M3NTVmFobU0rZVZPRlM5Z3pheHVO?=
 =?utf-8?B?QmtkcXNoZmVqVkplTzZzOFZXTHZ4Z002WVJtSVQ0ZlFIVzdzU2tqZDBJZ1Bj?=
 =?utf-8?B?NHg3TnJVY2wrQWFaMHNIUVRxdzdxQ0N4ZTl5dFlvRTNXb2c4cTNjRzdncHdl?=
 =?utf-8?B?NWl4U3FFTkpXQlR5bVEyWjRmVk9Kd0hLbDFqLzg4QStNYjl6UDdEWVI3Wlcx?=
 =?utf-8?B?dlNEanVkRWRQODgxaU95MUc1M0c5bnJuK0l4SE8yN013R3dxemREdFpoOW9C?=
 =?utf-8?B?bzNzdTRuZUEvT1YwU01WSUlCUjZwL3NpREhQc3RTa2thaXdhVVNVVEtZc0FK?=
 =?utf-8?B?NCs2K2p5eWRvZEw5KytEQU9KcVpNZEJNb2pKMjF2Nm1YZ3pyMk9CSHRKM2pK?=
 =?utf-8?B?L3E1cWpzRWt6U0FUYlZScktPbUZGb01xRWRYK00rcnZSNUZRZitsK1JhV2dT?=
 =?utf-8?B?TmxOOCtxWmZRNlVmNGJLejZNZjNMT2pUMUh5RlNtS1BvRTloVUxGaVlIODNz?=
 =?utf-8?B?L2Jha1poS3MxdUpicURtTmtmTzhRcG96NGttOWVSZUJOR0VZMk9aUzBoNlpB?=
 =?utf-8?B?VEx2M2ZLSW8vb3JVQkRPWFptWmdWaHF1cnhFTy9XdWt4UUlqbkZ4b2UvczhT?=
 =?utf-8?B?bFlZRDNJeXkraUp1R0tuTEhrb0dPRGxsM1ovUGVueDdDZzJnUkFtaDNTYXZY?=
 =?utf-8?B?dGx4ZWR3MCsyV2p4bFZvaEJ5cXQwTU43VzNncC84c01WZjVIQUQrNGJabXRa?=
 =?utf-8?B?YW5yTTlRbk93VXVwU1d0SEpVbVI1OE5OanhhVnBnVDQ3dUFrZFVTbDN4OEd0?=
 =?utf-8?B?MzdvS3JhSEdNSGZEeWNXYmhrQmRhM3d6SXhXTlIyelFLa3FmWEtpVFdTUlU4?=
 =?utf-8?B?RkhaR3R2QWJqVGMvcHVBRlVrVmZVVkRYNG5GaUVxRzFIbWd2UFJsTjNkVUZU?=
 =?utf-8?B?bVUweDRyU1dnS2tKNjFUcFZxb2J6V3VTbHlJT3pUbGt6Yk55TUhJaDVSWmdJ?=
 =?utf-8?B?bDlCY2xYNjNLTEFUK2xTTW5oVE5FSVZyOXVlNXV3d3lzZUtrT3lsRm00am03?=
 =?utf-8?B?RDQzS3hKdmF6SjRpanVDSTRXaFM5eGZXNm9IcGVSaDBjZkROMWVOMitQRU1h?=
 =?utf-8?B?OTQ3dWxpanRIcno3MEpTVXIweHI1VlREWTRKd0IwTlVKcWp5UWpvR1VIemdj?=
 =?utf-8?B?d3hRMnhWdDhCeE9GMzdBNmxjY1QrYWRMQ3kvclMyeG9kN1V5NDFHTm1ZVzlt?=
 =?utf-8?B?dUtUTEIzUmQzZmcrMmZISmpYdEtIR05JaHBhazZKUG5sRFhJcVNxTjZIVzZR?=
 =?utf-8?B?NzNubEl4UWlsRlRtZE51dnB2Q2huUmk4cXJGSDlaQ29sVDA2ei9ZV2pXcmdL?=
 =?utf-8?B?eHlUU3NmcGZKWWhEcXNiQ2JYRzB4S0kwNTJ1MWtQckZqcldQVlI4WGg5WlBB?=
 =?utf-8?B?alFVVXNWSkE2MDNnUjU1UkJBV0ZjN1VObUZ1RnQyTGpOa0dQV3ZzbTJJb0Jq?=
 =?utf-8?B?MnRHc3lIK1NRL3lVZmtUT21SNUdZdzI3Z2hnYkN4alJ2S0txR01oa0ZRNUho?=
 =?utf-8?B?Vnp6bjdpOGd1Y1pUNVgzUjdwYm90cm1ZSjBSUmkyRWZsblBLSkFmdXh0eE5Z?=
 =?utf-8?B?aVBTZjl4WU1saG9CTkhHZkk2L0owOFdYZ2pGZGlSamh4eGdhNjVUK2FZTGtk?=
 =?utf-8?B?bFF2OVg5VlJWV01tdFpZL0hQbWs4NnVLMlRkd2swdGJrNnNtS1djdEdaZFNo?=
 =?utf-8?B?RXhvV2xtNlNiUndDY1l3TWg4S1FueVlndWFwb0QySUJFTFRHakRWN3VIRU1D?=
 =?utf-8?B?WlRsdkt0UW9KZktPQysrSjQ5Y3pDTS8wMXRmTlJ0SldjMnk0Wk93bXBGcHBz?=
 =?utf-8?B?ZythZjQvWWI5THAzeHBZc0wwYUFTdCtyeDR3MmFKVVN1cXVuaUpPZk0wZDcy?=
 =?utf-8?B?WkRjVnl5aDA1cVVodDN6aDB0WVRaaXhYV1BKVW5YVThFRFlhclVJL1pPQkJ1?=
 =?utf-8?B?cVVEcDJmVC9zSFdCRitWOXMrWjV2cUFkSDFQYVJtV3ZqcG8rUnkvRXRNQ1lj?=
 =?utf-8?B?bHM0Ky83ZkJaSzBtOG5hOTlkd2Rmc1BmajdqMzhCeDlMY2NUUHlUOGptWkZS?=
 =?utf-8?Q?I0Vwgcl0A4YhsecPnHDDZhMhe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60714c9e-03de-48ae-9d3d-08dc7616a10d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 02:11:14.6821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKN+/MmqhEgyCa+/P96tiNjJcBBfSqkop6+nqxSeymkkPH0aobuvULQIPW9LZF7bnUkAGZSQboHnWEihId7wBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7441
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

On 5/16/24 20:36, Neil Armstrong wrote:
> On 16/05/2024 13:06, Aradhya Bhatia wrote:
>> Hi Liu,
>>
>> Thanks for reviewing the patch.
>>
>> On 16/05/24 07:49, Liu Ying wrote:
>>> On 5/15/24 17:51, Aradhya Bhatia wrote:
>>>> Add the Microtips Technology USA's MF-101HIEBCAF0 10.1"[0] panel,
>>>> MF-103HIEB0GA0 10.25"[1] panel, and Lincoln Technology Solutions'
>>>> LCD185-101CT 10.1"[2] panel.
>>>>
>>>> Thes are all dual-lvds panels.
>>>>
>>>> Panel Links:
>>>> [0]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2588/13-101HIEBCAF0-S_V1.1_20221104.pdf
>>>> [1]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2660/13-103HIEB0GA0-S_V1.0_20211206.pdf
>>>
>>> This one mentions some controls in '3. PIN DESCRIPTION' which
>>> don't comply with this binding, like RL, TB, STBYB and RESET.
>>> Note this binding only allows compatible, ports, backlight,
>>> enable-gpios and power-supply properties, nothing more.
>>>
>>
>> Maybe the internal module _can_ support these control options but the
>> actual panel hardware does not expose any of these controls on its
>> connector pin-out, and hence has no possibility for additional SW
>> control. Even for the usage, the device-tree node for the panel only has
>> "compatible" and "ports" properties defined.

At least, power-supply is required by this binding doc.

>>
>> The panel is being used within the confines of a simple panel.
> 
> If somehow some modules with those panels would need more control lines,
> we'll simply move them out of simple panel bindings & drivers if
> required.
> 
> Those are perfectly fine as is, we don't want useless description and dead code.

It would be better to specify module vendor and panel type in
the compatible property instead of using the generic one in this
binding doc.

If TI is the module vendor, it could be something like "ti,panel-type-x".
See ili9881c based panel "bananapi,lhr050h41" as an example.

Regards,
Liu Ying

> 
> Neil
> 
>>
>> Regards
>> Aradhya
>>
>>>
>>>> [2]: https://lincolntechsolutions.com/wp-content/uploads/2023/04/LCD185-101CTL1ARNTT_DS_R1.3.pdf
>>>>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>   .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>>>> index 716ece5f3978..e78160d1aa24 100644
>>>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>>>> @@ -41,6 +41,12 @@ properties:
>>>>         - auo,g190ean01
>>>>           # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
>>>>         - koe,tx26d202vm0bwa
>>>> +        # Lincoln Technology Solutions, LCD185-101CT 10.1" TFT 1920x1200
>>>> +      - lincolntech,lcd185-101ct
>>>> +        # Microtips Technology MF-101HIEBCAF0 10.1" WUXGA (1920x1200) TFT LCD panel
>>>> +      - microtips,mf-101hiebcaf0
>>>> +        # Microtips Technology MF-103HIEB0GA0 10.25" 1920x720 TFT LCD panel
>>>> +      - microtips,mf-103hieb0ga0
>>>>           # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
>>>>         - nlt,nl192108ac18-02d
>>>>   
>>>
> 


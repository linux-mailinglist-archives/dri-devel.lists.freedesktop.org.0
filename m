Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BA8C7051
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 04:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54ED110E215;
	Thu, 16 May 2024 02:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NP/JPOrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D135B10E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:33:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6mBmtGIE+Pb1GallzwCaXJzub5YRTbgMUV5PVU2btCwa5hwz9rHt1jjvaQF8ZBfrhivLoF1b8G+CH10UL4qsQLwLsRMCaARVid2vhlZXWswpyxv+Ir7pwRoDzyM7+KApjYEnDh/1Ajsy7yoQEwIrTI7jRhoZ5EW6Xa46y1PtkprZ7TuulYTuJ+CajN34cJoA48QCly5O9UmYEripmphJVtssoojYKdy6uQqUYQgv98ne8NjAjv5C9SYxEk3Cm5MndYkdLVfLp/hOjWz6qrnwjgQhHaWinqCwnXDso6u8sguIlhjWuV/DLBMwS1UNIJ/ua1ymF9GcZURXs8QJcmF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ncfduEuJJcLjr53ev9LfIprVAExvcTrapQOovP+awA=;
 b=IHF+cpUTGqTI72o0VWO4Oz1lq0SDnhbAytAckSx/A4vLr1FTMrSNmzTrfD6XmpFS6ET6Cc0ljGKJ3VKzWZYT5K21TdUznu1rI2w8h/7eUeDiXSxqb7ZmfqYbUqoat183EDOKFZAYAAF2CWQ7AXEAQHyewI4/lVrbZuZaLcTl/bCss4WSz5MRpHC6YqbYcdOfOkunM3EGdUsR+mPAR0+SAIpg8u08+AU4YBJc6BJ/A8kURKw7MWdb0Xy2CrR0QW8PhkC1uZsxhL3jWenHbTq3Xi/XmysFOQTmwBYI6sve83zs0OakChFhGmH0h1kjobOFBR8SXZ2hE+MlTeFYAPsrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ncfduEuJJcLjr53ev9LfIprVAExvcTrapQOovP+awA=;
 b=NP/JPOrpLEL6d8a8CXkry+2w4Mn4l2AEe3uS5upquZIT5nN4yUY+Bv8I8JGsvfoIgakZEeciAjfe7Da1U1qAhcesc+3KZiB/G+Z6z6n6PrWRwCUI6NgXl9oit7MLu2INo+d+F7DDtsad7MZthqHnrsRRjZu/mOaUofX44DYkegk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7814.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 02:33:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 02:33:28 +0000
Message-ID: <15511740-ceba-42c6-abf5-b74a757a2930@nxp.com>
Date: Thu, 16 May 2024 10:33:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/panel: simple: Add Microtips Technology
 MF-103HIEB0GA0 panel
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
 <20240515095133.745492-7-a-bhatia1@ti.com>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20240515095133.745492-7-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:3:17::31) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cdb9a1-e5cc-47a2-54f0-08dc755091ee
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|366007|1800799015|7416005|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0FOU0UxMEE5RmRqQ2Zta0VNOElRWEdBeVBXL2pKSENWdFJ4K1R1dEhoa2pr?=
 =?utf-8?B?eVlVZFBCQU5JZU0vUTV4aFREQ0NEbnA0c2ZNYlgrdmNkdkltZFRWeU5oZkdm?=
 =?utf-8?B?dXVUbkNTOEV0YitxMHNOU3Y3UWxvcXlmSmFsUURiQjVBZmJmU1FlL3k3Z2t0?=
 =?utf-8?B?dytMdk04VkhFZFluN3FPTzlST1RxWHZpaEZ3bzg2Qm1ROWUyR0JNR080VG1i?=
 =?utf-8?B?Mnh4VVdueXNNVHNkcFdVS0FsN2IyMW1xMmlnU0Q3cHM2Y3UyY1BQR0dKWEpI?=
 =?utf-8?B?MktIOTljR1JqOENuMXFIWFpQSmlwZ0t1RzB5cXFJcDVaYmJyZTd1M2RFMFZy?=
 =?utf-8?B?THJ2QjJUSjJWaDNnY0hYcERJbzdQLzNmeFBLMmY2dkVyYm1Zb3NwYlVGOFpZ?=
 =?utf-8?B?L2hvVUdnM0IxeWtjeDk0c2ZKeS9NYkw2V2t5dmJ2YXpZaHVxclR2SC9lbmd5?=
 =?utf-8?B?MzNlTmVqNkZNL2hRaGtkbzc2NXhvRlZTL05FemVJT1k1L3RjSnROdTNiMjNK?=
 =?utf-8?B?R1FiL0Q5S0FzWWtNN0dURWNCd2lkcU5KeXNaTGQxR3JlU3lxaWhJeDNuSlZv?=
 =?utf-8?B?R0U3V0JpeUNUdWpPZXJ3N3JIWDVmTllzbWdFZlNmVmRXZUlDWlZ4TVlFOFlQ?=
 =?utf-8?B?bVlTbUR6Nk9Gd0NwenM5UjJLTi8wVzBQWnJQRUdFYTZoOCtHRmpOa3ZQb25X?=
 =?utf-8?B?SXRicytBbHN0QXk3V1krY1hFbzUwenlDY0JFUnZIb0ZmaC9JalFCM3VRYUhj?=
 =?utf-8?B?Um1ER1ZTdFVxVHgwMXRZQWJwQUpHS1B1OGZJdWZDQ0toUXBLZzg1VW9odVZl?=
 =?utf-8?B?MlhxS2gyUEkxVEtnZTFsNkNwL1E0TytJZ1M5QWFlUityYS9Jb1RUcmVxcUs3?=
 =?utf-8?B?OTZVK2JZemcxTVJ5TDB5eG1MRjYwN0k5bGJjQjZZZTkwU3ovWE5HU0tRS2la?=
 =?utf-8?B?bU90OHllQUxhaFRhUDNFcDBobk93T293b21PLy90ZE1qTG83MURJVTZONjRE?=
 =?utf-8?B?K1F2S2ovOGZxdHYwcmtYNXNmRkw1S2RHNzlLMzdaSFFCTm5KM0srampXOFMy?=
 =?utf-8?B?NU1YWUVoS1ZoeVM2ejlpZ01RYmhDSHZUSmZWa01PWXR3WFBwNWNYZk5XYlhu?=
 =?utf-8?B?UzE4UkZIcnVZK3FSSVZRdU1xeXpCL1MvelllUEJkUEhvQWxnTFVUOXJWWUJT?=
 =?utf-8?B?VFlxdzNsWmZrTWhiWXN0cTRGWFpDcHZDRU91cm5WdHorNTZRTGlUZWxNRnpT?=
 =?utf-8?B?SzlQSDlsc2hmL0JmRkpQRkRObHZIejh0MG1veC9qcFJHNUN5V3ppMHRTeFBC?=
 =?utf-8?B?UEppQnkzVkxHK2FaS1pOeDRIK3BIeWxuckJxcnlOa2NjOVYyaHB0QU03dnZo?=
 =?utf-8?B?cmpEUGFMbGpaS2NwWU1WczNPbmZrVkJ0V0VtL2owUktoUlBkczhsa0ZFNmJz?=
 =?utf-8?B?eFh4OVZhZ1dSSnRXSURsRUdSM2xBMUVNaFhYTUZoQ09Ya2FXNUJzTi9QVjdD?=
 =?utf-8?B?OGpacEJidlR0anA0ZkN6M1U3cWNaMkZjK3FjbXJ6Rm5SZ0YzRndFTW5VQjBs?=
 =?utf-8?B?NkxXNittQ0JyOW93MmN0bjBMM3ZuNDU2OW9CTTV6ZC82TFdYOFptUmIwY240?=
 =?utf-8?B?dmlSa2VDRXY5UWJXMGpwUnBPa1lXb1h3dzFtVnNZY2hqVDF3TlVVWmZwRC93?=
 =?utf-8?B?SDQ4TzZSQVZUaGJPZVF4cUlvTE5SK2FLbXM1c1NHdGk2c2w0akJDZjFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTdTa0t6enJjN3ducjh1czNka0I2Q1dZUkh4RWtONk92T3pIQ1pVWjMrTVBl?=
 =?utf-8?B?cGxOWWV5Y2NKeEhibE45UlJmZXBHVzBBYzNHRFlhU3V4aldaeUJYa0xJOE9J?=
 =?utf-8?B?dkxGcGpZZTZCT0pIRlFIQUdobTIvTWVLaG5mZHl0d3J3YVBYWTlvcXpiblJN?=
 =?utf-8?B?L3lXRDJud281UVAwNTBzNEFnYXA4UHVleDFyMEJGQzdmWTRUdytDNVFPR3RL?=
 =?utf-8?B?UGpMdEtkNjJHVXN1Ri9SVzNBeHpGcXRRU0JBMzJOV01hOUNJenlHVVNCOWVH?=
 =?utf-8?B?cDd0ZDRSUjJaZVJxTjlMVDIxYkx6ekkvKzVUMG9VUUdVQWs1NjVsUi9lbldm?=
 =?utf-8?B?b1hkbk1xQXlQVHVWeUZBaitVV1pTa1YyTFVEaXlXc1JrbldpYlJZWW9aYldx?=
 =?utf-8?B?SHVQMFpVRFdZTDdFN2s1THNMSnRsdjVrdm4zd2RwNHZ6YnIzOTQxNzU2STBh?=
 =?utf-8?B?STNxczBwU2ZXbFdmdnc4ME5zRk84RDRkcDdSMWF6b3pmbTcyTjdLNDJxRDZW?=
 =?utf-8?B?UVlnZlFnRGdCZTJLZTBld3pzWHZjalVDQ1VvZEo3MzRBMk8vemFUaVQ4bGtC?=
 =?utf-8?B?YTFvT3crOEVjMWhQbW12MFZONnlsTjFVcmRqOHpjeWcrUVYwcW0rNktoUWdY?=
 =?utf-8?B?SlFGYXA5dDZTb2V1TG4yeVBBREdxZDVLMEprZmtIOVN3Z1VBQTBmMTdaSjhj?=
 =?utf-8?B?YWIzRjFLd2l4QmRZQzROSWdxV0twd0FGbEZMUHIxdkg4cVBhWXZoNnZHZHhB?=
 =?utf-8?B?UHhSSHZvQzgwYzNiWm5mMHVHdDZaWXl3YXhReEoxb2t0dTVaMitMRmxsNDc2?=
 =?utf-8?B?SEhGZFF6TVFzd0tTbFZyMkhMQnF0VnN4WjRFRjY4aXR0ZEtpdE9ITDY1b0tr?=
 =?utf-8?B?MEtDNGJ2a0xBZWY2NFhCbnUxRWMyY3JuTmFjcDJEYkZwUHlXZnJJaWVyWjg3?=
 =?utf-8?B?NitHQllxQk11TTQ5WUtMWDBDWEFtZ3J1YXVlMEtMdFNONks0ZFMyU3lDa3ds?=
 =?utf-8?B?RGF3bzk4MWNjZW1lMiswQ3VCc2dSTitjWU1yWEVkUGFGM0tvYWJ6Wmo5dHBq?=
 =?utf-8?B?TSsyZXpuUFJtcDJFWGprSGJ4VFlGREk5RUpXNCtXbVJlV2c4OVZVdk1aZC9w?=
 =?utf-8?B?engrWHBlUFIxbUVyNXJOSmptcnpvNlJaclhxTTRrNXliaFpBbTdwQTVQYmdS?=
 =?utf-8?B?TElrY1pqNzA1ZUIrMDVadGtITVBiN3dkdHh2NzZvMGVmNWs3SG1zd0JyOFVq?=
 =?utf-8?B?N2RsMEVrU0k2QkNRZmxzOHhQcHJ1NmtOb012RnJwY01QWTAwbFVKRUtxRE9G?=
 =?utf-8?B?RjNMZGZpOEhaakFTTHlKNWlDSGhET3Z0amJ0NlpsSE00eWRMa0ZNK3lsVDNn?=
 =?utf-8?B?azM4dE5SdC9FYndsZnpoUnY3Nnpkc01mMUJXVzQrUHhEWUZEbWtaZmxZY3ZB?=
 =?utf-8?B?MGhJTVdxOXFLY29Rdm1CMFB5TmZrUFJudlRHUm4xNlZCQmc2SzBiZFVBaDlZ?=
 =?utf-8?B?ZlBBdGwwaHlNLy96U2pmWElZUmRRWHNodVkzTlRFTzUzT0Jaa08wdmRlbW1J?=
 =?utf-8?B?cDFJRFg0QmhrTldMRVRaNnFTNU9ZcWFEeWlheFV3OVhqRytPVGZTcnhTMWFJ?=
 =?utf-8?B?Y0szTWo0MDhkWGJiQmNuSndHSUR6cW1zcVY1UHZWaFArV0hvaGJlYUFQZi96?=
 =?utf-8?B?dG1qcXc5TjU4REdKWFhKbDdzYnB3THorck1sTnl2bGxNbHJPU1ZTV2pGMVEy?=
 =?utf-8?B?cjdOdUtCN3dXdHNDbjE4d0RtTUVGMHdlRWlrWEd0S3lIbmU4NnpnRm13RVUw?=
 =?utf-8?B?NFJQRnFXaDVac0NmalZqemZBZG9peVJzWkNON2VTcnN3QmNmdXBMMXc1UUQz?=
 =?utf-8?B?OUc4TDdWZTdUZzNZd21sMkdudDN3UU9uczV4dzhFeXVpaFJzVVBGMWo3b1p2?=
 =?utf-8?B?ekRDQWlKekk5S2FPalRVeE5rT1FGbHlaelR2VTlUand5ZkRRVFlmUWRmWHBa?=
 =?utf-8?B?aHRHSmttekJDWXhkUXBJbnBKc0ZpOWdTQ0trdFlvOWpBakhjVkIzb2QreldT?=
 =?utf-8?B?QW9PKzNZYzAxZExkRzhubE9aNElwRXJLRmxISVhnbUcxWGdtU05ncjNvdVhw?=
 =?utf-8?Q?MkjJb0Qp3WBfnpBGRFoy52M0a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cdb9a1-e5cc-47a2-54f0-08dc755091ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 02:33:28.8972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7YdLP5urQlYIznOEpDN2nekFEzB9cKHk2TcnIl2Id0U/bBg2dZGPl+T/80TCMBIRpZMs4JnhYXtnpg+JB5uBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7814
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
> Add support for Microtips Technology USA MF-103HIEB0GA0 10.25"[0],
> 1920x720, 8-bit TFT LCD with LVDS interface. Its a Dual-LVDS Panel and
> does not support touch.
> 
> [0]: Panel Datasheet
> https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2660/13-103HIEB0GA0-S_V1.0_20211206.pdf
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Like my comments for patch 3/6, this panel is not simple enough
for this driver.

Regards,
Liu Ying

> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3a0d8f0ff267..1b0a6b4e034c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3084,6 +3084,35 @@ static const struct panel_desc microtips_mf_101hiebcaf0_c = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct drm_display_mode microtips_mf_103hieb0ga0_mode = {
> +	.clock = 93301,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 72,
> +	.hsync_end = 1920 + 72 + 72,
> +	.htotal = 1920 + 72 + 72 + 72,
> +	.vdisplay = 720,
> +	.vsync_start = 720 + 3,
> +	.vsync_end = 720 + 3 + 3,
> +	.vtotal = 720 + 3 + 3 + 2,
> +};
> +
> +static const struct panel_desc microtips_mf_103hieb0ga0 = {
> +	.modes = &microtips_mf_103hieb0ga0_mode,
> +	.bpc = 8,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 244,
> +		.height = 92,
> +	},
> +	.delay = {
> +		.prepare = 50,
> +		.disable = 50,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>  static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>  	.clock = 30400,
>  	.hdisplay = 800,
> @@ -4726,6 +4755,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "microtips,mf-101hiebcaf0",
>  		.data = &microtips_mf_101hiebcaf0_c,
> +	}, {
> +		.compatible = "microtips,mf-103hieb0ga0",
> +		.data = &microtips_mf_103hieb0ga0,
>  	}, {
>  		.compatible = "mitsubishi,aa070mc01-ca1",
>  		.data = &mitsubishi_aa070mc01,


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8AAF8D57
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7BB10E9B8;
	Fri,  4 Jul 2025 09:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VTRSIXh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944C410E9BD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Muewu0fdI+u9416aO7hywOk6oMd6S910Hw4Nb6XymSbzr/Y37bCrmPsCVGG18OrizV+K0/+iYDkoJ4SXA2RPFiTzO9Hhtz0nN2LGsq0/pF81THWztShnm/+wtItg6yoFxbbgIN758PQszsjkMTvpfDqqeH/JWm60kkj6OYbLaXDg5TRvRwb5NpuLt3UaAr71JS6qNcSvtx8VKXtvPbxJiZFCyn/WPyOp8DAA78vDU/esEIYGbZTP9FQP/6uIQXmQ1pIIYy+0l8QMkvN2GgfUWldxxt7d/1I3CgDAHBadNIKO/JG3d4vKy4sqMdNJQBzF1lIjop8a/QKqvhke16hf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaP9jJ8bUoK7K/hCe5o1ZGQwhKDgjiWI+XkzJQC4Oeo=;
 b=v2EEC+tVhNckSLlXCNC3DPU41lqBOGsZ1DqHcX+xyOihNKB45kBqOmKgGuOOyis5snCs+XgCxvxJvsRkm2rHN0bUuSaXjk/9aJ2d3+AZEMeeO1v6zDQbIrMg5RuSTYNcTANY3J0Yre9Zqhmcx/z4rcRkMIzQjJuhuDg61KJn/WrGIT6AloeX8RH87UP/eSaw0aDGCZJpQYFY90GQqPEynzChJzY1UB4wZLjHSkbzzPK+MYIG9pxgd9xttrD4P6W/lOg9drzQGwM8X88KFs9nrVGW/ICse+eyW7Apvo7P2pZhZCdgHrehX35z01v+KCPhLPIYBbr5WkIqJZ5q8dBl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaP9jJ8bUoK7K/hCe5o1ZGQwhKDgjiWI+XkzJQC4Oeo=;
 b=VTRSIXh6aOFGGU5f6IJ5IVRjQXNeLZvgGCr89hwgT63d4rrT8fD3W6OpRzODuwaz0CgxqWqm2qX/CmLMSkITwYEd8aoJU1mXElZbt8qju8jo+QFgICF6F3haka9QK3lvaQni5wUbjKd83e71dVvHotKzV8pXLeONbwJmr3+diDNcyUNKbThL71HEcNet8FwLUJA8mKD1AB4ipJVzTNtrc0Pm2fmMB5zTmAQNQo5qAxuuf1wbno0+0I8UJykI7Vr+luxR31Da9NxPNakWQmAn+vcTEfWAS++DUlc4evKld+9T4Z1enUTiPg6584EEVNExEAmkqpJtHFe0Jc7pgJvUYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:03:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:50 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:57 +0800
Subject: [PATCH 10/14] drm/imx: dc-lb: Support getting secondary input
 selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-10-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: 673e6525-90a3-4f41-478b-08ddbad9b138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWl5TVBMNjYwMmV1Vk0zRG9SVGxLc012ZXdtTi9SaEcxNGI2RHB6ekxxdGJW?=
 =?utf-8?B?dXhROHQwczFzd0tENjhTNWozbG5oakFqYkN2aXZNb3FHSTQxQ2FxYis0eFBx?=
 =?utf-8?B?NXdKcEJKVXhicTJsVzFhL2U1Nlp1Vnl0N0RTVEkzbGZIQUVqczM5cTZBOU1O?=
 =?utf-8?B?ZVlPd2N3QkVmYlBFRzVPVkJvQk1aYlJYWUZvVytwSWtFZVA4WFRPanU4Ry8x?=
 =?utf-8?B?K2RHUXJhODdvSjBJQjZTTWVzN1JOaEwvY0V0TWordEhTLy83Vjdsa0lCaysv?=
 =?utf-8?B?UlFMUnM1TnU1NHNYVW5DOTUxREJEV3E2S016T1dFQml1WHMvZTE4TlUxVk9z?=
 =?utf-8?B?ejBaOWI1bitHdFd6d3NXQjN2NVRJY1N3dEg1SFZIU09YVjU4aURZVTNoRUFm?=
 =?utf-8?B?ajQ3c3JjWlV6UkxZRHkzdHlvaVpVWG5YVkI5RkFtbVlMd2NYSFJJTzJxNE5X?=
 =?utf-8?B?U1l1cG5SMEhqRnRkeVFNa3psUzZSWWFQWUEzOGhoQlkwQ2lWWklJNnhISTc2?=
 =?utf-8?B?dStQKzNJY2xpcE12M3V1QmFGZ3lFYnNUUmR4QlNPOXIyeHFEd0ZuTmo2WDdX?=
 =?utf-8?B?SnBCU0luWWlMOGU0RmRaeTIwZExhR0JqVStuZHU2NDBLSjY1N25HSFZidFRr?=
 =?utf-8?B?RGx4MnN1eXl1dkFWdmFoaGtqblY4UVNPUng4OE1nNVZOaDQ3NDR5VXVkb2pK?=
 =?utf-8?B?WkVuUW1ObnkyVzZneFAySUNNakM2WFF4WTR1M1hrdzhDbUs4eEI2T0thVkpn?=
 =?utf-8?B?ZEFCVjZaT1JnZEJaUi9xWjFNV0l4N0JxR0pZRjZVcFkvU0l2dVFXNXNMMFdv?=
 =?utf-8?B?MmFGVWxxWDJlc252L2Yrd3kwWXhDRmRJMVQzWnE5UXk3NTIyb2xITHJnV3VE?=
 =?utf-8?B?WU9hMWJIT0xJbm5nQU1HQWZTaHU0Y3ltNGQ2QVNGL1hYNG1sSDRsV1crdjd3?=
 =?utf-8?B?S3llNllNUTB6Yy9xM2ZtcHpGK2dNclBaM0xOOTdYTXluNDVsNGdWeHBwVGNL?=
 =?utf-8?B?TWUxY1FGSGxrYU8rOXFpaFk2RXhLZW1xWHBtaUtXOWtRNDA3eUxRL1lBNXpw?=
 =?utf-8?B?STdIMWt0VjU4SVNaZk1EdTdodkNRTDV3WEdPdjNCbDlrUDVwTTFDRWhrQWFz?=
 =?utf-8?B?alZSQVRVSmdxbVBXT2N3R3RuRTdZdVdqYkNLUmRnZXlXbXJKRmR4bXRtUEZy?=
 =?utf-8?B?VGM3QitDc25IOVY5UmtFSWRmVlp5U0h2NEIwYXN3cmJFd3RqSzc3WUowVmp3?=
 =?utf-8?B?WC9XdUNrQ21nQ0RQd1MzcjFrNDEvTlBjWWY1SHROc1RjZFVUQmdBMktXdE0r?=
 =?utf-8?B?NFJ2Ym5FUUg0b1FacnNNK3YzOXJLNldZUlVkZkxqZGEyWE9pdE5iVTE5dUg4?=
 =?utf-8?B?MFZ2U0FramxkK1RSaUFkOWJFZDBhQUxCRXk2Mzc3YU11QUNvMmhBeWNLSEpE?=
 =?utf-8?B?eEhuSGRPRnNFY2U0MkRzcGozeDNjMkJtRDA1Ri9kOG44OEFBWnJBYWpzejhv?=
 =?utf-8?B?bUtpeUx1dGhOM0FodWhacVZHRWU2QUcvUHYxcjY2Zzk3WkowVUdWZkpMVnow?=
 =?utf-8?B?MGRSbkVkazh6MFlyWXZMc3MrNXhjQklKdGxYQ28vTkNqYW5FSXVmdUhvY1A4?=
 =?utf-8?B?ZDBrNHVLNW12M2FPdVU3RHdFSlQxR01qc3RDUnVZUDFRSVhuYUhid0kwMGpa?=
 =?utf-8?B?b00xaDdnb0V0YlJ0b01FODM0dXIwZVBhdFdoUGlTYVBGbEhKaUhXSm9XOXFs?=
 =?utf-8?B?aDFRVzlEaElJR1d1QlpmNGN2ZmxWY2czbURzb0NiVkM5aEdGZ0luWjdPbno0?=
 =?utf-8?B?Ri9ORllaQUJVS2djSHVIVTk4MGxZRjRlbTIyQy9kT3JxazJBNFdlWVcxVVVB?=
 =?utf-8?B?S25uQzA2SHZRWTU1VTFKYnNTUDNXUGsyVUJjZWpXRUNxQXU4a3RQYnhjWFJH?=
 =?utf-8?B?cmltUTNzMnVJKzF5NHI0M3VwY2JUYmZOU0o5VndwT1JxQ084RVdtc1EwU2da?=
 =?utf-8?Q?hmt1dcC553Tf8upzW0WT4+9JlsOlm4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtqTFhqTUkwYXJuZElEdTRic3lpK3NweGdnZFRsbm9IT216WUY0eWhmc3No?=
 =?utf-8?B?cnNZQjJWWGZJMU93OWRvbU1RdmJvT3htZWJRdGhoUmJOSHRFK01aQXhybDlj?=
 =?utf-8?B?dU5FN2NrMkl3NFlDOGdCT3podmFuY1c5QlU0TlRJMlV3R1JudHhoTk5hVXRG?=
 =?utf-8?B?WXpOZVhYTWUzd0hOV0d6cXhKKyttYzdWMi80SFZ2bEo2V1JNYlFyRjc3aEJt?=
 =?utf-8?B?S1dCclNYNWxPYm12Z3hLZ0RyZUVnaEQvTTBsb1J4aTVvUU5ZdHlMYysrUldT?=
 =?utf-8?B?d285K0plaWxZbW5KRGRsdUhsR1hVSFhYaThReDJBNlNBQXZvT2RCc0Mvdmls?=
 =?utf-8?B?eEFTQk1nRDUyYUl1b28rd0Jzc3RiWlhFMU40Y3hkald6UExDdmlUZTVHK1pZ?=
 =?utf-8?B?WnJLZnJIcmJwN3R3T2R4VzZkOW1oMXIrcE13VEpvVWsrdmRadzAzWEpzWVB4?=
 =?utf-8?B?Z1FvV00rdE5ER3NBQlQraVFJQmQxREJGMTJQV1FZUHNmNEhuTytDL0REZW1j?=
 =?utf-8?B?R1ZDNFVJZVFLSmRtbFFZSUx2UlZxRnNwMFJGdUc5Tmx4VzJ1Y2crYzFZeG9Z?=
 =?utf-8?B?YWxJMWlzdFVPOVVFUjdvQ25hZ2dqVTZCUlVxbkF5R0lzNHUzWnNzOVdIaEdC?=
 =?utf-8?B?b3J1NHoyaTRDL2h4alBmZTlGRjU1QzFMY0dyWmdJTmV2a3ptTzdIVkJRRGtV?=
 =?utf-8?B?azJ1S3hXUkJnazdHTjQzZVF4M1J6aERGalBGRUxGeHNZYTF2Vmc0SDlMN0g3?=
 =?utf-8?B?QUpRMGJwa2JWYmd6ZUNDdWU2c3B2ZFFjM3pvTGNaaWx2bWxiODBxaXQyaW5Q?=
 =?utf-8?B?dGxyWS9ENWNRWE04elY3YXpLTDlXenNkc0VPZmkvVUgvT3JnRkQ0ZG9kc2pQ?=
 =?utf-8?B?VTNtYXJ5MER0ZVE0NjRmMm5YWHJlNjJaMjNDRG5xUDhXY0lJa0srMk8zcWty?=
 =?utf-8?B?ZWxFZElXV0QxWGJTQ2JxMlZ1TVlYK1dLNGp0c2liZVVxbG84ZWNnMkdkT2pP?=
 =?utf-8?B?VlNQOXBCSTRMS3JCWnR3YzhNN1hjRURVMWRab3FrSlJXL09GTWE3ay9sUCtZ?=
 =?utf-8?B?S25SZW9idS8xYWdRZStuekVJVmhKQUNJbFlXWnh3TlgyKzN3R2VMR1RXSm9Q?=
 =?utf-8?B?UVh2MDRyOWZ4bjZNSDBwOEYySlRIeS9hL2NiYmxmMHluR3lUejRjblNwTmk5?=
 =?utf-8?B?ai84aExMZ2lzWSthNDZwWFJZTDFYVEt3K05iSjFYU3dTQVNjR3ZybUVDZWRG?=
 =?utf-8?B?bVZ1OE1rcnovUGNMMG9yNFFFVmN3UkZxNjhxd0JlaFVnOFFPTG4rOU1HZnJU?=
 =?utf-8?B?aE9ITmQyNm13V0xFZWIzLzEyclZkUWpzNHkvQUxhZG4ycWp4V3JBeC9JM3RX?=
 =?utf-8?B?Qk16UVd3Q25MaXJDSHliSlNUcEJ6ZkttbXN6VHBQZGp6R2VNOFB5WitsVS9h?=
 =?utf-8?B?QXZLUFI1R2xiRENDam9Ubnh0WkhMc00yS0VEZnVvVm1WamRqQWxLQ3VPdVhh?=
 =?utf-8?B?MmJTdGxPdGR0SklXZ2ptTlhENXNEbzVWbG80RGlFaWpIRmlqN2ZFaEFBSUtO?=
 =?utf-8?B?MzJsNUxNZURmZnJHZlNrWjg0V0JHTExQVUI1WHhVbkc1VTVoemdFRElibGR3?=
 =?utf-8?B?N0oxcWsxdCtEb1FxVXE2OW8wM1lnOVhUK1NhZnJkWVdmVCt1d1JGY1BPSUlB?=
 =?utf-8?B?MWwranFQSlRtUjZDQ0FncXdjMGtQWXd2ZE1VVGZUdXE4VmZGRUl0QlBKdTVt?=
 =?utf-8?B?MEVuYklGbUVxZFFLWXN5SHdkenVOSmp3bnJaanBKeGtlUkhiSmZvL3RRZ25o?=
 =?utf-8?B?T2wrMVVoMjdmaUs3TnlVd04rc2luTmpiTnNaYW1sdjhwL3UyUnZUV2R5ajlj?=
 =?utf-8?B?UUFiRldpekJOYzNyWEVnRjBENXhWOGdaWHdpeFZ0QThwdlFKMDltUlBpa2VR?=
 =?utf-8?B?UW1aQjlDZDJoV1EyUGo3Q3MxaUROUjJGTWRBMVhXTU1QSjhKb1dDNGdqUkF0?=
 =?utf-8?B?ZSttS3U0TkUrOGZsUWFtdUlVTkZzaVp1Qjd1QXhaMnlmQklRNkhiV2xwNnFG?=
 =?utf-8?B?RW02OVhHODJldW9ibzVPczZ5ZEd5OE8yaVhua2xLMXN1REJoUHRRL3ptaTll?=
 =?utf-8?Q?ewvXW8rUFd6W3dZyOmMCK6zM6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673e6525-90a3-4f41-478b-08ddbad9b138
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:50.2055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OD1hELwKXZqkEr74ht2wBtgXJR4IRfOmyBrn2jQsBGFiUavJ7Ysyv5cPVskHRyU0NRekWbc8wHIfGa3pfutTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289
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

Add a helper to get LayerBlend secondary input selection.  This is
needed by disabling CRTC at boot in an upcoming commit which tries
to get the selection.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 38f966625d382487e45c2e0c202e15c1417f6e65..b0f3fb818799b58597e8ae41d868338c3fd40800 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -23,6 +23,8 @@
 #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
 #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_GET(x)	\
+		FIELD_GET(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
 
 #define STATICCONTROL				0x8
 #define  SHDTOKSEL_MASK				GENMASK(4, 3)
@@ -182,6 +184,25 @@ void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
 	dev_warn(lb->dev, "invalid secondary input selection:%d\n", sec);
 }
 
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec)
+{
+	u32 val;
+
+	regmap_read(lb->reg_pec, PIXENGCFG_DYNAMIC, &val);
+	val = PIXENGCFG_DYNAMIC_SEC_SEL_GET(val);
+
+	switch (val) {
+	case LINK_ID_NONE:
+	case LINK_ID_FETCHWARP2:
+	case LINK_ID_FETCHLAYER0:
+		*sec = val;
+		dev_dbg(lb->dev, "get secondary input selection: 0x%02x\n", val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
 {
 	regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC, CLKEN_MASK,
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 0b81dc6b251c452e7ca72f1cd12af065bafaa198..4e38aead69bce6e9ad4cf2a7cd1fedbaeda60650 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -93,6 +93,7 @@ void dc_ed_init(struct dc_ed *ed);
 enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb);
 void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim);
 void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec);
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec);
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken);
 void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode);
 void dc_lb_position(struct dc_lb *lb, int x, int y);

-- 
2.34.1


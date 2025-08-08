Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70680B1E47F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAE510E8E8;
	Fri,  8 Aug 2025 08:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="noGWAzoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013001.outbound.protection.outlook.com
 [52.101.83.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6934810E8E8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ0yRkzSECOJ/1YRs/9FmbzPHZ/IFts7tWNKeOpWZ5WF2DkU4grqWVI6Ln/WDkIlVXV6cbeOJp0oypoHRnuKZxEiLmBKB0etziMR91ZyBLquneuuPsl8h9SMULoC/WdqCxaZ07RA1U22w4R9J9dXuR+3vjXm6KgxndgqkdwXqggYb16TfkB5goSb9nsgAzAPO24FjGkV//+GZdaj6SNZ/62VT/k+xRxDJA2qwWB/Q9JkPA2EWMsmpIbVc5KjDw4MeipZpgKfUZWNunFnHaB2ozSjffaQBDYQ6TQaAB0iCCkygQ+8fW/gRPmWG4JmWffrhfKSPtXvDJDANq7xdZjQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sikPpxhE2pItt29B8ORa5Xfa2iOA6VtGnMVrkiWQNs=;
 b=Mmz9OJjfXa+pkZiiWL2/MTZnHkXOe2YCuZeoUwPK/70vxRYgu/fvvImixp0Ilf9F1qnQKBfQY3zG0/4df2uo3bftKyoRA1ldF+IoBhRWir5R9RtOGVvKUwL95jxp+xQna9+MC2bcWUmjVKY78N2ySJdGB8/ObeUvWM2uHDJtbSxifLDGOuj51jX/sXMAUvN3Cc2F/0v/sa4LNexk4o9Gu1YKgHLvV20LZgAu4sNQJQfQhHiOOmc1hIqmWbB/sdMgAHlgAa4ztexA/msv4TYazaLWA7H3XJROeH/AICUwY7mqJDRkjpQv7J+QLL9nS4e+DIDGQwylngfQqs3iwbX3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sikPpxhE2pItt29B8ORa5Xfa2iOA6VtGnMVrkiWQNs=;
 b=noGWAzoc0ESmboRltzN8CO/qanKDL7NGilhYKSsYYkOV5RFfXjrskrwTUvi7LavVi4OrgJGKjGssWll9scm4Mq9/UVGidW1JFKi61fG9BlBbzd2d3aSPhax/CfGrOT39DyldNMARG3gi/bsBbPQRlbxJKGhptvHKNYEetRqp84jg3uI9+HSWi9X6xsFjFsnV38eV0DW6Ar+2CMNKAow2O+20emVDH+y46EofIZcNKZoniCkXQTlSZLuwqjf6x3MiU2UWTgn9XG68fz8eZ90fKwEGqT+M1JXL7JQmCdZ+c64z+zIlgH5JxuH55/qf7jsVFD1CwLEw0BAT8TC0hkew3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 08:38:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:38:14 +0000
Message-ID: <9dee39f6-797e-4428-9a00-4e7f6d3461bb@nxp.com>
Date: Fri, 8 Aug 2025 16:39:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
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
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
 <20250808080617.2924184-5-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250808080617.2924184-5-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ba84c4-1b07-41c5-eabf-08ddd656ea5b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTFOZGhoYldZQmdZNkViT3VxcWhROTlVYy9BS1BkczRPenNxN0dnV1VwQ25v?=
 =?utf-8?B?c3luVHZ5K3M3SXc0bENqMVdOc3pwYk1CYyt0RUtFZ3g2OEUyYVJ0NXJIQjh6?=
 =?utf-8?B?emNOcDNqTHVxcTNXV1h2ZDJ2cEZmRC95NER6V2FsNGhNbTloUUNPSzI3Ujkr?=
 =?utf-8?B?MU9keGlteHRISS8zNU8rK3c3d0NDVjVYTTRIY3VyODFWR2phVnRtZ2dILzNx?=
 =?utf-8?B?UmtVc0kzdUd2Szl2VWdORFRyNUN1Tm4yRTd2OTdESHByUDRNUmk4Zm41MXVD?=
 =?utf-8?B?VkJvaE5jRjcvR2NOZ0ZwdXFYc1d1QzhHYlMzdGN0OUhQSC9xWGhlY2VFU2pz?=
 =?utf-8?B?bGgzZTlYenBmMzZSbFFaTmxZQkJIM3FGSmZVTnRvLzZsSFRXN29KaUx0eW1Q?=
 =?utf-8?B?bzhHQ25jdUp3MmZRL3JFQk5vb1JLcVRJTE40QXFhNHlDYUFhSUFqUXcrM3Fq?=
 =?utf-8?B?Zm11YkV6VmRPVUVRZm5wUGUvSFBQbGdFcll4a01HdHd3NHRzUDVkSk55aCta?=
 =?utf-8?B?UHVyeXVla0p3WTdaMXhuQy91Sk55dG81enhEbzdqZEVORDZrVzd4QTBIeXR0?=
 =?utf-8?B?SW1oZ3lhZHo0eDNyZUpJQ1NIV3N2eHEyVk1ZWUw1Yys5Y2hSMWRoZUl3aEFI?=
 =?utf-8?B?TnVveDhWUkcxKzRZbHpyR1NZNTVETGhqR2xuUUdlbDRXSGF4SFhoSUVHTk9j?=
 =?utf-8?B?Y0lxWVVtbEJDd0czVTY3VWdwUkN5TjBWdGhjQk5oUmR0SmxSeEpwT0lXU2F1?=
 =?utf-8?B?bTIwenV3QjcxU2Rzb01hbzkvRXNkazBPRVBYci8xYndBZGlCTDgvWnBsZmUy?=
 =?utf-8?B?bGVHUUpuTjJjNDhIWThURk54WEU2aEw2ZFlSdjFNemRZSko2RkRhektQcE0y?=
 =?utf-8?B?YXVTdVMwZVlyTjYwd3lxbS9kdkhHaUVLbjlreWhFb3NTTnNsbTFJL01VTXE4?=
 =?utf-8?B?NTJWRk9vbUtNa3NxTXd6STNiZ2lxOVVvVnJvTWpicjlQZ1d3M0NNUHZ4UWVU?=
 =?utf-8?B?OFU4TWZVYytSbTRzQVk4bGNhTmlsMzhjeEljbm9zdGZqZmJUYmx1ckpPa01Z?=
 =?utf-8?B?QVdydENWbjV1OHpKNWh3bmNqd2QyWFFHeXlCQWd2WDYvTVc5ZlZXSDk0MHVj?=
 =?utf-8?B?WTJvalRHTlh5eG5xcFdMZ3RJM0xCbTFsZU91cVpHbW1SNjR2d2RZREJpY3Z2?=
 =?utf-8?B?VStnbll3NkxHR3JrQXhyVmVuT2F3dzQrdFlqSUtTb3F3WGJOeEhiZFVoRWhG?=
 =?utf-8?B?RTE0cjVaVTlTSzU5MWJwd21wdUUzdjN4ZENYWDVIQnMvLzhWMGRPNHc3Qmln?=
 =?utf-8?B?Ni9UVkg4UWxMRXNOVWsvSmxhZUdGL2VwUUY2NFVGbDFOVFlwUjdsRlBvUXI2?=
 =?utf-8?B?a0R3a1B5enZpTUlrVXhhT2VYTEtsTUNJL1ZkbVVGTGc0Y0JWOEJvQ0V3OGcr?=
 =?utf-8?B?QWphQTFqNC9sODJWaGMwcVl1WVVsQjc3OFh6TDAwZThudXlDZUFTTDdTeDBn?=
 =?utf-8?B?TEQ3VlBVOUtzcHMrUkZ4T05KTXk2b2hVaGRMekluZnp0TThDVVJsZGZGRURY?=
 =?utf-8?B?TEwvOTg4K251L2xGeHVIQ2ljbDlNMmxyMnJoZUs5ZlBIRzQyUjRVYjNQc0k4?=
 =?utf-8?B?NUo5U0F1bDAvTGF0Y0NCWjdYZG9KUndqTGp5VlJ4QU1RVndlZjlrcGJxaG9h?=
 =?utf-8?B?NUhlU2Rmbmx0TVNTVGp0Y2VvZjJkeFl4cCtxSXlFelJKVXRhNzM5S21yb2gr?=
 =?utf-8?B?ZDhUd0FKeGdMc2orTGRQV0wxOUtFY29SdFliWHFjekVLMUcrZ2RtcldCQmFn?=
 =?utf-8?B?RFA0dzZQajcyVDdHVG5HVkJoYkZ5VGhoZ1VGZlVsQjI1K0kxN3pBS0RkNkF6?=
 =?utf-8?B?RkVQZ0ZSRklURGI5Y1FWRm1RVjFQUVhMQ2VyMzFYeDRXV1RxWTQ3ZVlTUFAy?=
 =?utf-8?B?WG53VjJlNlUySFdxNC9pTlB4a1NFT1ZRWmM5MStLdXhzdDVFZ1FMWW16MGJQ?=
 =?utf-8?B?bDhhVkJGSk9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXQ0OTc0dHUzMFBsMTIyNjZmbEU1MktpOThQT1ZzUUF3d2RCTFpPVUZ1OHNq?=
 =?utf-8?B?eUtncnI3THltcnNNd0ZCMDFFSEFiZzBHL2JQQWovOU04V1RDOTNsaFpTREU5?=
 =?utf-8?B?WXJXdGx2VWJ1K1p6YTg2MWRkUS9YTHdSUkticmlES3RtNnEwdFJUNWU1MzYw?=
 =?utf-8?B?aVo5YkEyY29MajArQlJHR3habG5BcVVNVDVvcE80VE0zZnFjMjdhd216N0Uv?=
 =?utf-8?B?VHEzWG40UC9iUUE5MjdKa3hXV1FvOW5oQmFVMjZNd3JTbUx4a0Q3NXFZRHkr?=
 =?utf-8?B?Ly93ZU0vaWllbFJRTkUvd2prMUt3RSs1S0IvcTBVMHRhQkIwaWtYdkh6SEdU?=
 =?utf-8?B?SlZxUVZKRnQ4cVE2VHpuRTlQVXJxNUR6MW96WUNjWThJNTd2QitkU0x5dE1h?=
 =?utf-8?B?KzZQUEM4NDZlNGVNRVdxT2NPMDR3cWlxcnJ5S2hreEN0djhmUXZjTWE3TlhH?=
 =?utf-8?B?b3dDT3ZvMTZhMXYvbG5WU0FPbDF6amwzcVpqeGk5blpQYUJZTTVOWnVydXEr?=
 =?utf-8?B?RUZhZEhML0orNHY1QW0raTF1L0JNV1lxT2RyNmFWa05FVVQ1SkR2cExQRk0w?=
 =?utf-8?B?WEg5QjM4ZlBvUGUyT1h4K3VGRGQ5SHFqbXp4UVJUYlVRTjRVaGl5bnhmdHVQ?=
 =?utf-8?B?RjJXaDVKaTdPejI2bkp2NjZra0VpS3hBNFg3azZGZDFUdzEvQ1p4b0ZaTFhP?=
 =?utf-8?B?SEFicVVMcWRNWTZ4cDh4aFNsdWFibTYzNnR5VGw5L0YxQ3k3Mk5wSVJkOHMz?=
 =?utf-8?B?UG9yd2VXL0lvdWt3KzNqOEx3VlB0TjA5bnlCaW1tOHEzL242NjJTRzRnUnlN?=
 =?utf-8?B?bjBrcWNQYmFuN3h5U0Y3ZHZIUjB6UkVXVmdoL0luSnVzVEVzUjlabDdNOHpP?=
 =?utf-8?B?RC9NT0hTZ2xGcUJtSWNhM1hjZGVMQU9LZ080d3lyRkRabkZGbkppN1RpdVh0?=
 =?utf-8?B?aHFra2VZa3F2SVlsOHBTRDlFSW1GekdGcWhrTWJ4bU9ISGVQMm1GZHdUSTJn?=
 =?utf-8?B?YTI5RnNXeVgwc2c3Mjd4U2NZMkQ0WUpiNmdtWmU0OGlzUWc3MURTckxpaE1X?=
 =?utf-8?B?bEVGOVhrWmtyTVFKVFJPaWNySXVaTXRlSjkrS1pFWjZGVlVJMkl1UWFhMnQr?=
 =?utf-8?B?MDAxRXdWL1R2MHFGY1ZwQ1BiM2VxUktISTVLMUN0WS8yK0oySGFub0xEZTVn?=
 =?utf-8?B?V0ZMYWs1UnM5YzZ5NEhBNkZ5Ymx0b1gwRm5zZ3UycTlHaTF6Sy80cWh5L0Mw?=
 =?utf-8?B?WlJuQW1kWXNubTl0KzJXeDViMnVhN1VyTCt6Q0M1UjNsb0d4c1lEV3ViQ2hi?=
 =?utf-8?B?b012b3pONk5EZUtVbThIc0xzSW96Q3ptbUVNNDRUL0pjRFJsR2VRKzZHMHUy?=
 =?utf-8?B?ZDlvQks1NHJxSkFkUUlpK0VMVlRqbmQ0bHliU2RWQmFqOURhVGJrSWFoVUNs?=
 =?utf-8?B?OHR3V2hIa2pVNjZ5RWhmb2VoZHF0cU9qT1F5Mmk1dlpVQjZTOWRWaHdqdzRC?=
 =?utf-8?B?N1h0U3I2aTJhY2RiY0hTV2oyR2ptQUZNRC8zeEU1V0JYWEQ5SmlpR2kvb2hm?=
 =?utf-8?B?ZEVsZW9xdEl2NmQ5QUtFandsS2pNSVE1MUZ5bk9ZN290Y2dHc0g2ZURPTVFJ?=
 =?utf-8?B?S2djeUtJTG9BWFY3cWNPeDlnU091QjdhVHhvOUpZeVlIUU5qQ2xRdVBTU3NN?=
 =?utf-8?B?dmkvMndNZkZaMHpoZEVEeHp4cDJpWXJzOFpxTFlMRmJmRXV4OTlXaDFpVlBo?=
 =?utf-8?B?N3Z1czVQcHE2MGlOR0paOW9STlFVb0FuRDdtejlBZTY1OGpMWmtXY3JZVFNz?=
 =?utf-8?B?NGRzRFhwdDllMnFRSHgxa1VuNVdEbHM2aElPYW91WnRiOEpDaGkzc2RXNjgx?=
 =?utf-8?B?UkFDay8yZEFWUDRuanFBTVVrYUVPU0pXY0tZeWZ2NEZuend0RTJQVXc2REtZ?=
 =?utf-8?B?cVY0Z056R0sxamNzd28xQ2pLb1NwbDZuemRqT2pMOEdWVitQMlRQa2VPWkxz?=
 =?utf-8?B?MWVmM3Z1MHpSdW82YnZuZHB0ZVRhOTI3dC9xbDVaeFpwRi9sdkZ1TS9rTXBY?=
 =?utf-8?B?Ky9la2pvUXNHOWsvck1qL0dPY1ZseFdjTW5WYmcvNjhsNTF2d2JKcGpoUmdj?=
 =?utf-8?Q?vJpdVH9lxSmD8/B3WDCuRzUqj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ba84c4-1b07-41c5-eabf-08ddd656ea5b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:38:14.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5IkgUdphl2g8xcCuubwQA6BJewd/eIU5h2HBfUW8hs1lmy36Ls8To+YvLqkweMddi4zrs4kdkg+tnsJ0Eavyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802
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

On 08/08/2025, Shengjiu Wang wrote:
> Add API dw_hdmi_set_sample_iec958() for iec958 format because audio device
> driver needs iec958 information to configure this specific setting.

Nit: s/ iec958 / IEC958 /

> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |  5 +++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 12 +++++++++++-
>  include/drm/bridge/dw_hdmi.h                       |  3 ++-
>  3 files changed, 18 insertions(+), 2 deletions(-)

Not an audio guy, FIWW:
Acked-by: Liu Ying <victor.liu@nxp.com>

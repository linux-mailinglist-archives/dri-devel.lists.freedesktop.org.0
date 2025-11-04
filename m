Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39DFC2F917
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B6310E031;
	Tue,  4 Nov 2025 07:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GGd6jDUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013004.outbound.protection.outlook.com
 [40.107.162.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2C510E031
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 07:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMemULB/s1defVIJb3DRrVbovuJD/VFz2TEXEzGKQJ/cnTRCagIFkXxyhEENiY4m4ZLuo+1lfQIwSwfzUYw4hywVVDaNsvQwp1OIXlXnDfQJvISpdjHbNetNAhS0wDVh2p117ve1pEVyll0XYJvNFk2mNP3EHjzSXEIzdG6qz/lRqO3lfa7Qs0K/mGHN6cCna8g5vz4RuDelYKMSu8HJrWTF+dbtxwrQec9F/hDbZ6BkhkZ/M8AhBvmJhAXP6u+CGo82dGJomW+51e89P50BnwNBebzM/C60X0R6E1UxlPLdBKPdg+xrb4OY/QvcqT1OVkej4SCK8a+QOMeVIDnXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dNXCkn+cG4BI0w05pbZ0y7Yqh1Gr7D/fvB1NR6RsqU=;
 b=ddwKNAUf8SXARRTVHBdn8cU04hMu0dVJVx1y8vQTO5Te+Asae0/w5QIc6qULIVXBLTPytTjKNZGs2QSofVdHiVKK+sniOtwawfQ+lJyAZBchYlAMNgY3k2S70ttc/fJ0fW8n871eODzQA1AF786JaPsd6ZqbOITiOPXvnhhHW+HFQkzbb4qoZJssqe8tapNcbVbyNPmcFbIKaFy3gbzw3hFaBZ/cwYWw8gn1c+K7V351NYPJKsNSBLVgu5zdI+DXeoW2wtO8+uXxr0boAnKkZnPRrJpZuXzqEVV3orZUf40qnOJaM1t/zbPH/WFuy/GVxLy6Sp2OmXMrh6I/40AoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dNXCkn+cG4BI0w05pbZ0y7Yqh1Gr7D/fvB1NR6RsqU=;
 b=GGd6jDUC8CVXjP+E+CxSUVN3P5wJBST8Cr2N+vzDhmPukgRE03qcSJr/ERrVKCRViZkIaibmNLeJnou4Z9JSqCrnRg3UdXOmvUA7b2sjbAQAizvgjEvjj4nzefPBXNhdPxfbV8cN0WVqJzibt920P2OIy5BuubpuG4gkJuAg1eh5L1H8YwtRKqoPUfldbvLB8tp94o55yID52iLhGRnEiy/2xjJMvs0/EUt2ts66fmqEe3uPjMGvBAdqboU9ejC3IvpQDm9GLgpRDSVEjxRSV4izjT/Irjkt22qsMxfFuW6/FFCgchWr/G6cmHN0UPpOyrecFclZRTdfelKeYj8DmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8455.eurprd04.prod.outlook.com (2603:10a6:20b:414::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 07:17:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 07:17:44 +0000
Message-ID: <df8751ba-7215-4635-98b0-ca659ec786cd@nxp.com>
Date: Tue, 4 Nov 2025 15:18:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Marek Vasut <marek.vasut@mailbox.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
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
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
 <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
 <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
 <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: e4947d5f-ba7d-4e3f-70f2-08de1b723f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFY1dkcvWlNYZGg5emhmN05sMks3ZkdLTzhrU3lSLzlrQ254YWJGd1dJbFly?=
 =?utf-8?B?YnVuYklCZVlONXBzUkdOektnaDRuZlV3ODljaEhRb3Yyb3VabDExQUpRS0gv?=
 =?utf-8?B?bmRDaUJ1bjBia3h5MVF0WU9aV1FYdTBFTTJhRG9YMjRiVUlnTWxaSVhmQ3h1?=
 =?utf-8?B?YWJ5ZEwzSGYrMFdtRXhjYlI2b2x3ZEhESGJBM3plS0dkdEo4S05ZeWFUSUlZ?=
 =?utf-8?B?d2lFOEZZMDdTVkwva1VwbDZka1A3UlVhczY4Y2tYMW1HZGpwK3NHVHVRR29Q?=
 =?utf-8?B?MU95VWlXOGwzVTJqd2NRRk0zTTBoZDJmTWdOZjlpclZQVUtSVFR4YWh4Y01K?=
 =?utf-8?B?Qk1iUjZqMzllclVENVRkNGFJcThLN0tyMHZFR2p3ell0ZnBoWmZhTHpVU2V3?=
 =?utf-8?B?angyRGpDNTJrZXFFdGtJZGc3M0FpZ2M1TmV6bGpsdE1LWGtNMFZZcnBQM3E2?=
 =?utf-8?B?V0U2QlpXMEludVlyM1Q1aGNoNXJPQ1RvWDBKbGJCWUVwQzZHbkU5MmVRd3dE?=
 =?utf-8?B?cXc2WTVHRFAwTzFJSVJoZEN0R3dydlZXME95OEx4SlRON1ZqQklZbHo1RCtF?=
 =?utf-8?B?cjl6ZjU5b0FyVEZpSis2SzlWOEVKNUZkc3pjRWNLcnpFUFV3eEM5Vm00UnpO?=
 =?utf-8?B?c0kreTVWZm1LaHFlNkJPWks5ZDdyRS9ZbGI4NjAzSzVmNWduMUJScVpleUJP?=
 =?utf-8?B?cWRLaEwyNm1Mcnp3dmZVVldBamhVekVzRVBENGR6a3JLcU5IQmdhYlloS3U1?=
 =?utf-8?B?K2xSSjV3cU8yMmdQZ3pGZEpNN3UrU0ErcmJ3NGV1VG85aWMrdFQzNkJ2K2ZH?=
 =?utf-8?B?aHVlWWJ5UWNUQ0wvOThPRlFDRmw4K1VTRWxvK2k2aWV1R3RaaERkOTBiUytF?=
 =?utf-8?B?bk14SHBUS0NuQTQ3ZER3S0VDVGJ6UXNjZWtvYUlzdGdTN0p3emxpVlJnYlZa?=
 =?utf-8?B?bHkyWkI0UHVQRzhLZzNwYVFWWU9zZXdDTFowMng5NThvT3RmZkIzRXJ5TU5j?=
 =?utf-8?B?VWhrU1gyeW9jOWhvYTJ4TVhlWFFSdnNwdlluRXFhdFlRT29YYzNNclB5aExh?=
 =?utf-8?B?b1BCR05qWUFGa25nUUlDdXhEdEhiNkJpbFBhMHcwUDdUdC83amFsc052TmFB?=
 =?utf-8?B?SHNtUTZnL0lQUEwvMVE3SU9PV1hwbWhsaFVDOVdlOFM0N0NiRXpkSnZGckFK?=
 =?utf-8?B?eFI5YXB6Ly90b05lR01kVzR0UXpNSGlBVlM2QlplemF4bjc1U2tjYWFwVmRn?=
 =?utf-8?B?TG44UVFOWGxvMWpTRm1xazRWRXJMZ0p6WUNWLzkvMzV2WnQzZU0rNHFHRjRl?=
 =?utf-8?B?bCtFTnlQVVRqaFdnbTZjYmcrZVdSbEJpNFVKMmFoWCt6VlV3OGk4RXAzSG9m?=
 =?utf-8?B?ZFhDRVk2YkZLMkoyeHV4bjdLRDNldTlsQnhIVzNROUJBc3kvS2ZUbVdDMGo0?=
 =?utf-8?B?QmIzK1h2OTkyVmtFZzJYYitsV2o3VkRRcnJyeEZ6RFNsNXlSMVp6TnNoL1E3?=
 =?utf-8?B?eTJUbkl2c2dsNFhZeWk4ZzcvWU1za05Vbzl4WmY0QzF6V2crWDdTQzlabllo?=
 =?utf-8?B?NjJCajJ3R0x3N1VmM01rRTBReGhQZEVsanV4cGhCZE1rQXdvSS9lUHh5MmUz?=
 =?utf-8?B?QkxwZmpTRG1IaWJWMGYraUI4d1hJdGJjek9ldmlEckpYMUNFVHBNUERDc3RR?=
 =?utf-8?B?VVNLVnMzb3ZmNExSMk9teGtWN2FybFBOTnhsdzdJZ1RVbFBkK2x1dVFlQlRV?=
 =?utf-8?B?OVhtc3BYdzJLV1FRYnlmYUlKd3VVRi9iekdnZUxsVHJSS3dpN2hrcFQxUSt2?=
 =?utf-8?B?YjUxOU5FTXY3QVY4d2IrWnhJMmNJc0REdG40MStTdU5ja0k4TGd4clQzS244?=
 =?utf-8?B?RXlaamU3a3IzUG13TkptcEJibE4rYjROYUV1SkgrMEVVL3Awa01KcTd0emxs?=
 =?utf-8?B?NGdpTWswQTNsU0s5cGxQejgyRlpnd2VFV3BxVTB4QzRZdDBXeXp5dHVxOEI0?=
 =?utf-8?Q?it5ViIvdTH3s1yN/QeRKCWle7DOeNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0c4azh2WmNKOERzRHpWakdzbFpqdzJwZ2V0TzQzYnlkdzFhaWF2S0g4ZFFk?=
 =?utf-8?B?OG5QcGNBcEdLWllGZVFjZHp2K3JpMTMwUTdLS0ZzUktIeGlISmtNMU9yVzV2?=
 =?utf-8?B?cEcrbngyMjlsdngyOVJNbi9ock5NeWVkbGZqTGREK1YyUDhhd2JtWG1jamk1?=
 =?utf-8?B?ek9uZ3FNN2l6OTB2b3VmWmZQdDc3b3FLZmR0TVZhdGhhNjh2R0dIS2h2cFVz?=
 =?utf-8?B?dTZNYW1rUC9LVVVOYzkxMHdRSFJVU3RlbDB2Q0swTlF5c2JCNmRHU21wRytK?=
 =?utf-8?B?VjBJRUt6emRPMGEvMXE3YnhwU2tJa3ZkM2JqRVdIWHBuWE5aZVlTSFFXSkxL?=
 =?utf-8?B?REczVTRNeWhDYmhsMDN5MDREYkxkQXBrQkMwTzcwVjhySUFzYWxVSGpud1Jo?=
 =?utf-8?B?Sm9lbnFIUU84K3FZa2lMeHlKZlIvT0RnSUF5ckc0RmwyN3h6VFJvR2NqajAr?=
 =?utf-8?B?K0t3UCtLVUNIb2UxSWFVYkFTQTkrWC93VTE2R05FVG5VbWhOWGtrWkh6SE5W?=
 =?utf-8?B?WGhlZWhleTRQZXYrSHpvNU4rcURwYWRLc3ZTamxzYTRIWlJjenRMZlNvekMw?=
 =?utf-8?B?OHBMbGlZWDRmMVpNeDlCbXNKbkg3OHhYMW8vWW9vbzBITFBlbW1VYnNFRlVj?=
 =?utf-8?B?Z0pHbHpVd3M0RDFCL0dVdzFuQUFtUE9DaXk0bFc2dE04bFFHcFluMDlJSkUx?=
 =?utf-8?B?WjJPNSsrNWZlTk5mSVBLUDNsUGVnbk01WnMzWWVSOGVqdTZpK3hMQ0UzY04r?=
 =?utf-8?B?RmZhUkRmUnp4Mzg1NGh3cy9pMnY3QWRESUxHU2tpNzNHVWZweEduWjJyYk9p?=
 =?utf-8?B?WHQwZ3ptWE5XbFdZd1dJNnhudStDakFvL2NQTDJOcWljS2RNZjJ4ZTZjK09U?=
 =?utf-8?B?bnhpTWhzVGdzWnZqUXJiV3dGWXhiemZWZi8zSXY3RHc4TEtPNGRCeXRGWi9P?=
 =?utf-8?B?Rm1kRUJUQmloOE1Fdm44cS85R3JTaWZPblRqQWV0UktjMXkrWjlTMjEvbzlR?=
 =?utf-8?B?M1dOU2x1UXo1ODFhV0hHTFpoWFM1RHNJQWtaQ0RPMWdOUXh1b01VZDZlNDFv?=
 =?utf-8?B?ckc1NTFDNC9aeUJ5cXRjVTJaNG15SUlxVkxtSVhkU3JpRG4wazgyU29jb3Rt?=
 =?utf-8?B?Y3FUemNRSG1lTUNickVJOUtuNjN0elluMUNCRUdvbXBnM0VQWmZrMXpwU3dL?=
 =?utf-8?B?SWpodFdZamUxVFFUVENtcGpjQ0VMTTJHclg4WmZOZ0NINUhPaHRzZ0xuYlh3?=
 =?utf-8?B?TDVCM1VjTkhvSW5mK2R4N1pjWWorbS9DSGRCVFpObExiVlM2QXVVYzF4ZzVk?=
 =?utf-8?B?b0QxcnkyZC9Ia284V0hrRXBHOUpvWjNxaUZvZkh0cWNQUGFWRG1rMWprbXMr?=
 =?utf-8?B?WjE1aTJaeUJuTnhmZ0NpNEcrODl3L21mL2ZtRFhldGlIamtXeld1Q3Fuc29K?=
 =?utf-8?B?Yk5PNEg2RWZHVVhFY25UcHVUUS8xZmxLOU9HZmlFRTIyeVVnSjJsWk5RdENR?=
 =?utf-8?B?UWI1NlZzRTh2Q09HVXJsNndlRlJQZmdCSlVnTzZUU0hJeGhIdWJ5ZFYzdmZY?=
 =?utf-8?B?ejNTV2xsb0d6akt2T256TWFEQW8vcUpRREtJZmF3M1hqNksyWUdOT2tZdTEz?=
 =?utf-8?B?NmtUaFZVUVdMekFmZUFaeHAxTE1lR3luUlVwVVp4MmVqR25ka3dBUW1EV0dj?=
 =?utf-8?B?MnBIQVZoN25zek1ucFg3bjlNSzhXUkhxNWw0QUJCRFh2NW03Rnphczh3aWs4?=
 =?utf-8?B?aEdpcE1CTkhyK29Fc2FYbHVIak5aOUNyQVR2eHpTL2YyekhyRTB4dUxUbnB0?=
 =?utf-8?B?bU8ybm15RGlKMGY0RDNtd09XTE1qWGZ6WHdhanpZbmtvOGxzZ3RaZ2tpVmpQ?=
 =?utf-8?B?d3Q0K0xzSUx1c3dMS3JCTlBXaWJFYmg4U2pkSWQxTHhIeFUzdjZCNEl4M1Ra?=
 =?utf-8?B?QTFXdWw0czVHcVZNQk8rWVdyQXhhVk5IU1BoMWg0eXM2dXJIa3RLNXhZMXlF?=
 =?utf-8?B?U0E5ZUV3SC9UUmpRYll5QlJJcUxPaDI5U05nNzBRYi9CcGw0SDA4L2wwUTRD?=
 =?utf-8?B?WUM5TDExRTlQbUVId1pUMVRLZFBQdm9RRmZYR0lkYjBWWUczNFdNOHpvZVpT?=
 =?utf-8?Q?CQTY/Nfrg6IXkR/C1dZhE5DDr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4947d5f-ba7d-4e3f-70f2-08de1b723f8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 07:17:44.2682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzSJxY8a97mEOLuD1eLBLOR9z8g4jBWnvgxt3xdPu/pFLtimNEmU+9BFTuKxHieUVQ3w948Ickj+tnVHjFN2FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8455
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

On 11/02/2025, Marek Vasut wrote:
> On 10/20/25 4:47 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
> sorry for my late reply.
> 
>>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>>> @@ -1,6 +1,7 @@
>>>>    config DRM_IMX8_DC
>>>>        tristate "Freescale i.MX8 Display Controller Graphics"
>>>>        depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>>> +    depends on IMX_SCU
>>> Can the SCU dependency be made optional,
>>
>> I don't think this can be done.  If you grep 'depends on IMX_SCU' in
>> kernel, you may find a handful of existing dependancies.
> 
> Sure, I do not dispute this part.
> 
> But the SCU dependency can be contained in a component of this driver,
> which is not used by MX95, and used only by MX8Q . Then there will be
> no problem.

Which component?  You mean PRG and DPRC?

If we add something like CONFIG_DRM_IMX8_DC_PRG and make CONFIG_DRM_IMX8_DC_PRG
depend on SCU, then should we make CONFIG_DRM_IMX8_DC depend on
CONFIG_DRM_IMX8_DC_PRG?  That's yet another dependency.

> 
>>> or per-module,
>>
>> Well, DRM_IMX8_DC(for the imx8_dc_drm module) depends on IMX_SCU just as
>> this patch does.
> 
> I assume it shouldn't have to, because the SCU dependency is only relevant
> for the prefetch engine ?

The SCU dependency is only relevant for the prefetch engine, agreed.
But, how to avoid the dependency?

> 
>>> or somehow abstracted out (via regmap?),
>>
>> Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
>> registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
>> know how to abstract IMX_SCU out, especially via regmap.
> 
> The simplest way would be to use regmap_config .reg_read and .reg_write ,
> if there is no better way.

Can you shed more light on this?  Any examples?

> 
>>> so iMX95 support can be added into the driver easily too ?
>>
>> Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
>> can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
>> (something like imx95_dc_drm) plus an additional common module(like
>> imx_dc_drm_common).
> This design part is something I do not fully understand. Sure, it can be
> two modules, but in the end, the result would have to be capable of being
> compiled into single kernel binary if both modules would be =y in Kconfig
> anyway.

This is something like imx8qm_ldb, imx8qxp_ldb and imx_ldb_helper modules -
DRM_IMX8QM_LDB and DRM_IMX8QXP_LDB select DRM_IMX_LDB_HELPER.

Note you may make CONFIG_DRM_IMX8QM_LDB=y and CONFIG_DRM_IMX8QXP_LDB=m with
CONFIG_DRM_IMX_LDB_HELPER=y.

-- 
Regards,
Liu Ying

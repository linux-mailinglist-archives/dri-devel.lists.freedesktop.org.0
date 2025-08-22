Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C7B3108E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B8610EA7F;
	Fri, 22 Aug 2025 07:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="fafUOXVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021111.outbound.protection.outlook.com [52.101.70.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703410EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK0Cf/uRnRb4P2wnniQMfoy/OtX+Gf8X8cnZzzApe8qDhezNgfza8qRoKl1MiVJI9oSoV0ciXxhOK+KChxhTV2UESGG5VgIC2drMN2muciw/tk42GMiqAn0v8XhNf/7DbtpJg86CbQTkaWi7xxFFdMt8bI+SRHUAURG2ia7Gsn3UjsJ3+2zGMF4YuSY/LCWQejpdrbE0JelgwiQyWfFhCiSUJq007jBgyLpgLPvuk0aOopyWu11kgrTIpldAEH/MFxyj7kuyIc6CVfswtikc5f/Kz3Uk0jNwUaqpiZrFNadSlAoZXfmdRsEJ68mWBTq/jTLYTd657jm2zUirdjf/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL+cU0P3p9/AntoaKdh98f8pMamuudHJ1hHX8STHjJo=;
 b=A63DJs8oLEZhqVE/lwEHzHCzk5sv/j49Wye0w9/F4I6j6/lt0mFL+liTrI6XrjlH3M4+pGV2cb5ipmdT0nuVw45sjgzaWkej5DCpr1r9upQakGlEeUh0BeiqBImQPfB1PyWmznMNlYY0656/oQdmKBGiRE29OcFZQd0YtKQ8hQBsGtSP2lnopSYLXOyCbIZhRiHZ2KSB6s7atmefkd05pjXengnPdKvii/ZohCMQrV3i/riuhbB65HuLc8uVEvXw47Gr6dtb5AOMrqtWJTw5HBGHz7WyU60nGS+LlnxiRaxVlGHA86LnTG/K3kpqMz86wHPXvASWhJvqJjMy4KWThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL+cU0P3p9/AntoaKdh98f8pMamuudHJ1hHX8STHjJo=;
 b=fafUOXVODW+r9mj2AMj7DVBWq9Ti0Pwn3PM2LVUB5vCRNU05PhTLCVhqk/yicmApOLbgPPm2HQ27d9aMfurrvYdXwxlRiFv+ZRVxfUBQNNGFXOFWFp1zA+0gsMMYTw2ipop9rDV9FDF+FU/XjFfWr/53IFi0LIhkFa6joJBTiUyeRs3QwYE79HTAcIPnsbmw8hA2Eo7+fd8EqVmwgjUYPvEyx6gfKX2Y+WLrAqOYSksfLYbFxnFlzXdxDsP0VjXlIQl+EN7camuS39Z1pe0yP4KkHtDW1N2z6rG77/ODzwLd/yse0+rpIeILV2vODugX9on+wOMMYCF9Vc7yi0lInw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AM9PR04MB8601.eurprd04.prod.outlook.com (2603:10a6:20b:438::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 07:35:20 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:35:19 +0000
Message-ID: <8e7796b2-1e6f-4c91-93d0-a72f6343ab47@gocontroll.com>
Date: Fri, 22 Aug 2025 09:35:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
 <aKgboFjwjtZsanWb@aspen.lan>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aKgboFjwjtZsanWb@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0088.eurprd05.prod.outlook.com
 (2603:10a6:208:136::28) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|AM9PR04MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f37759e-9237-45d7-6b35-08dde14e7220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEpaSEkyU2tTQlU3dVFJdGk4bCtzQmhvNnA3UmszdEVOMFBEK0dXMlRkaHZ3?=
 =?utf-8?B?SVg4QWZMNFVvcHVmVkJwTkRUNVA2Q3JmajBvZWd6Y3k3alNFRkRmRk9LdHE3?=
 =?utf-8?B?U2Z5eFhwZzJFSEp2UXgvczU4Sk9WbzFhZ0ZNdDllaFdybzNrRW4rREQxRlY0?=
 =?utf-8?B?VXZZV1RsZ2VuaUNMNzRzS04vWHBMWTBJQW5LRFFpZnNUZGVITmU5cGVIVUZC?=
 =?utf-8?B?NUNvbkFFUnNjRW51cVFDUnpiRlpMTlY2L2tqSTRtMmtob1QxMWxzdkRXZjNP?=
 =?utf-8?B?MnhoYU9wQkpQNHhtcjVreXVZVjh4dGpWMW9UQ1lRVkV2ZFg4ejRMTVlHZUR0?=
 =?utf-8?B?blhqRjNEUXhzWjRRbllVeXk5V1h3cTIzSEEwbmFZM09iYWxjUjU0QVVVMmV0?=
 =?utf-8?B?dm1ZMHlDSkswWDNqTk5Bcm11WURIZFJiODVjYlNJL2Y5Qmp3dzlyb2E1TEdX?=
 =?utf-8?B?eVluNEZYNytOL3RMUzFHekpPZTVtaG1LQ0FYd2VsMVVzakQ3WHBaRFpjNkM4?=
 =?utf-8?B?SkFNVDMwekFJVXNjNmNWZ2F3Q0p0TGhPalNYWVRxc1hNWUcwWFN2MmF5Vy9C?=
 =?utf-8?B?aXRBNGhBTHdMbGpOMlJxRmdOblVXbkN5M0hkOHo1VHQ2UC9Cb1U0TnZ3cits?=
 =?utf-8?B?cG1yd2pBNWxrMWRQSTNRQmJHbFErRS9IalZOdGJSODNXYUdXVnNqbldxMEph?=
 =?utf-8?B?WlJWNlFJYmNRREk3Y1dubWpsclNhWmV6c1ZOL1FGaXUxZGFnSHBVckl6Y3U5?=
 =?utf-8?B?U1FIUkE2QUExcjhCdVRZZEEwYmhIRFhLRzhHSE5USmp6ejByeGRlM2hNenJz?=
 =?utf-8?B?VzdWK3k0ZEc3aG9yLzNaZVJndFNkNDk2WjJ4cnJSTEMrcTJURFVzbng2MWE1?=
 =?utf-8?B?bFJweWxNRUpZU0xadEU4N2VwckJIRzhSWEFJUDRSMjlQWjBiQTJUR0dONGtn?=
 =?utf-8?B?T1FlakptcXE4b2l5WEh2NmhXUEQ5dk9aUEVEbnNRVUV5YjlOTFlRZzBROW1i?=
 =?utf-8?B?Qk9wTjdwbHZjcjR0NnBJVzVPRDRFSkU4clRoanV0dlh4TFAwMldYQWsvWFhm?=
 =?utf-8?B?UnVyc1JiczNHT0R5dlVWM1c0RXlpc2MyeTl0bTVhV21qYnRKNHMyOFNyNmJy?=
 =?utf-8?B?ODNyM3Jzemd5Smp3dEF1eEM2K0lLcTVXSXdPOHByZ2x1Qk90UmxlTlZEeFZm?=
 =?utf-8?B?c0YxQk5ZWDlzMHNYR3ZEZGNUNit2ck92ekhJN2hXMEFZN0hBUE94dTN2T21m?=
 =?utf-8?B?c3VXOFl2TmxtQ0ZWQUZXWktleC9HMXZLWGV2WDhGUGJWaG9IMks3L0ZhTm12?=
 =?utf-8?B?d29UTWlIcnQ5WS9jdmgxMWhxaTJScVE3WTMwSjRVZlVOWDhEeEVybUgyaXFS?=
 =?utf-8?B?djdCVW85VzlGdzZPUmJuNWNMM2hrV1diQkp6YUNucDBWMzZPK3lnL2lJNXQr?=
 =?utf-8?B?UDJqVlY0cDQ2M3F3elpHekIvQllqeVI0K0pNVmp3c1ZUZ0N0cHFtbTg0dmhD?=
 =?utf-8?B?RGZ3RUVKbGZueGY1YXoyYzR6TjlYU0sxUE5wMmkzODFiVUtTZUlZdm5UbmUr?=
 =?utf-8?B?ZGdvMDlDMmFEdVpzeVRMTGNxMlNZbUQ3QVNlMUFlYS80VXpGai9vREg4SnV4?=
 =?utf-8?B?T2NUeEx0YzZVdlpoOTN3K3lucHo3YWd1cXhqa2svVitXUEYvakZaaWpGdEZJ?=
 =?utf-8?B?VW43L2pVMjRLK0k5R1YySkw0aTBQQ3puSmtvNmROQncySXk2M1JFMmlOSFhL?=
 =?utf-8?B?SStmbW91Qy9Nc1B6TFRTeGJ5VVlVK3BCSGRPQVd6L1hGeXJnVWtEUjlyeUNS?=
 =?utf-8?Q?fZZqIe6VyYXVGJG7umetMuTaoSiecSKbEKnFE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJONGxNci9oSUtDSkxXbnJDVlZKR2Z2ZjhjUDdJSXBvQ3Y1aTdUYVQ5ZFhV?=
 =?utf-8?B?ZUJFeU9KbnhvRHZmMGV4UmJ6SGJ4di9wM2tmT3FjYWYxY2dZazhxUitUZWtJ?=
 =?utf-8?B?SDdQcFNnalZtVFBWaWJTVldqWm83M3JKMjVvdlZ0SVpGc1h6Qk1nS3ZEQU9t?=
 =?utf-8?B?NFZxZTRIVEhQRFY3bk1LeGZhSVJaZEJmQnlyT09CZFl6TWhZSGV0S24xL3J1?=
 =?utf-8?B?dmJKRm1BN2ZaV2g3dmtTckVGU3pqVHM4Z0F2VGVEdk5Ba3JIb2dhMG0wWURx?=
 =?utf-8?B?S25sdUF4cmJFb1J1eGR3TmR0b3htcjMxcnZ5elBMRVNKajEzeldsWFN0Titx?=
 =?utf-8?B?SmJDelFXMkF0T01DT05WMlA3SjZ0NmVYN0VsRXpscWwzQUxaSjZBQ2U3R3Vn?=
 =?utf-8?B?WFdnd0FRZXIzMEQzcUtCS2ZDSkR0STZMWEZxNmJjb1R2TE0wQjVrZTlJdWdj?=
 =?utf-8?B?b2xRaW9CcERVWWNNWkZmUERacWNSSWxLWldFa2lWdURhNXJaSGJWTE1jdHV1?=
 =?utf-8?B?dmNiK3RkV1RmM0YvN09CZTVYY20zbVhuUUpCTEQ4Sk5rKy9uTCswMHRQTXZs?=
 =?utf-8?B?a3ZZWU1tNXJFeW9EZ1YrdGZDTVNtNlVyRkVNV3JuOU51Qi82YzJwcmdEK3ZU?=
 =?utf-8?B?NjNJUzF4V0FENXYwekluYkJiYkZXR0lINDRjY2YwcmZrT0RYN3YrYWMxWnNh?=
 =?utf-8?B?U2M2aWp6SzM1UGZWcEtLR051WG0ydDhoY2w1Y2FzZFZaTXJXK3NIM2h2aXFW?=
 =?utf-8?B?YzhFSW41YlhhNzRjbG95anlyRUhvNDBBNk1pRis0OGluMHpPWXpoSHE5N2U2?=
 =?utf-8?B?ci9HR0x0dmlqM0RmK0NhM2JCVjlGZTFiQWs4TnlBOWlXaDEzb1ltM1RHTSs0?=
 =?utf-8?B?ek05eXhsWkszUXdhQVFLbjlRYVF2NjFtRnRwRTJ0THQ1WUZ3TVYvcU1YN1di?=
 =?utf-8?B?WnRYYmxaK3lraXpnWTRsSTdYZGY5Q1Z5VUorQi9vUWFBR1lDNnpMSTV2aDRu?=
 =?utf-8?B?Ym1ZWkVaLzBrd1V6U0pIdTNFZnNwM1YwVDE4N1NPZHJwUFBMbGl1V2trMlcv?=
 =?utf-8?B?N3Bucmp6Qy96ckNxYzhJQXhNL1JkWW5yOEhkK0wxSGpmTjRuSjNyajFZaGt5?=
 =?utf-8?B?bm1HV0p2NktsQ2VvMUNaOTU4OWNvWTlSTERtRTI0ZXBzcE1qaTY2TjRYU2ZT?=
 =?utf-8?B?clJWeFYvd3Zwcm1RdGNLVldXY3Q0UWtYaVFqd0d2WFdya1BhcU5JVldudy9V?=
 =?utf-8?B?OWlUMUN0K3JhSTNlM0xWSnZzalVNa2xwR25wVlVOYldYVjFoYnlQU1gra01U?=
 =?utf-8?B?OEFzZXhpKzB6a0loZW02bnRNek9oK2s4cXdPeDNQL2srdjE4SjNSVGlyVHpr?=
 =?utf-8?B?eHdXTTRDb2xIWGRzRzg2bm03eVlaM0tmQVhSWFFaM2dYVi9RSFNXT09RdXdL?=
 =?utf-8?B?QWNSSlVCRTJnaDBkMWEvVmhFUlhuS0lwTVYzenJjL1Brd0poYjFOZmFqeTFX?=
 =?utf-8?B?YjdVaGVQczkrZ1A0eUhrOENWdVN4ckwxdkxyM3VtL2NQdmNoL25uVFFWYXpl?=
 =?utf-8?B?aTdwb0Q0MWNQRmFwVVdRMXVvc2hDaUxQeGQ2dUhZSmxveUZDcVhzLzlnRkkw?=
 =?utf-8?B?OHFKbzFOd2F6bHU1NTI5VW1XcVBUSGVlWVlDbk8ycTNZTnJrNkdBSkFCaWhv?=
 =?utf-8?B?aHNLUXMyYXZKWXFEZHNXelQ4V1c1djVPQXdMMWlhMU1hd3FGQjhSVHRmdStj?=
 =?utf-8?B?ZjVwbkN5K3RyeFhGKzJZbkpaK3hlcllpQUZEQ3lrb3NxY0JBcUdaS2REMk9N?=
 =?utf-8?B?cTlmR2x3STlHWnlZeWI0S2xyZUxHSlFoUU0yemFJOTJDTzl5MGpZVXlxSVNW?=
 =?utf-8?B?OGt1QzcyemtJdzFmbmRnS25uWW5CZ0hNNlJiczlSakNtTndhV3VPZGNFQ3lt?=
 =?utf-8?B?aXpOamZLbG1MdVBVQkErZkFKN2JvQ1UvRkxEYlF4c1FYL0JRVlNMSnBoZGh0?=
 =?utf-8?B?STk3UGhYV0RUNEZYcWluTGg1T0VlUkxQQmdVNmxMTURGL3RnVS95dVBWaGx4?=
 =?utf-8?B?SWQ2TTJFUmFvbjNVWmRpN2JoMmIrS29OTUR2M21xdlpoTHdta2FtNDR1UHE2?=
 =?utf-8?B?MmRzZ0lSMGR1NDNPSkFUZ1E4MUpWQlFIT3NOb2NDaXpPTFB2OW9FcWlydlRE?=
 =?utf-8?B?TnJ2YkNpaVBlR1N6SzJIL2lyUkY2Rk5qdWZHRHoxQnZ2R1J1MUM1cG1zN0N4?=
 =?utf-8?B?ell4SkJUMkFQN1lFdHBTdDBEclFnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f37759e-9237-45d7-6b35-08dde14e7220
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:35:19.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2i+z+Hgzfaz3UqM1s9eWUtmTv1m4paCFQ98w+OS+NAcbSh1VclIJaV9KL7uBZDrZhQM7nrdIs8DNSt5WsoI+ceUmZMNt542Iik3s46BXR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8601
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

On 8/22/25 09:26, Daniel Thompson wrote:
> On Tue, Aug 19, 2025 at 12:58:59PM +0200, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with intgrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 84 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..30b591152fa31d5e43243cac44c72028b05b5f8a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim max25014 backlight controller
>> +
>> +maintainers:
>> +  - Maud Spierings <maudspierings@gocontroll.com>
>> +
>> +allOf:
>> +  - $ref: common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
> 
> Is the interrupt useful for anything?
> 
> AFAIK its perfectly OK for DT bindings to describe hardware features the
> driver does not use... but is the driver missing out on error reporting
> (for example) by not using this interrupt for anything?

The interrupt is indeed for error reporting, it is not wired up in the 
driver right now (although there is already a function for scanning the 
error registers, I am not sure how I would properly hook that up to an 
irq. This is my first driver so I thought to keep things simple for now, 
these extra functions can be added later), same with the pwms for 
example. But jeah I wanted to fully describe the hardware in the 
bindings as from what I understand that is what should be done.

Kind regards,
Maud


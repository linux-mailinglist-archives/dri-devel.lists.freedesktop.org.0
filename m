Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A630CB1ADE8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 08:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DEB10E5DC;
	Tue,  5 Aug 2025 06:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EVQwkuZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA1710E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 06:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSxhN4V8dCmMrweIgbtjp9z/TRcIJd/MKoRto0CUPnueOS0foU9LGIHOQ1pEZH3qaYDFRvUshSA2v4YlgCjnNCSOdUFZNdHC2n+QJvsaUOWQVeJ8yh/m4Fq6fdI+rQYdLxTtjp3jt2gXd9h0k47X35x05RSRZ302DVtHKDJtHMkMfSAe4BxgeG3aEUYY7yjwa7sMLwNKIzCuXST7QkHumK3ZcSL+RouVh/TdMW+cPZuAqDcrLcieePfCFatQP5GNZ60zJEHb4Zq3Me42ihBwMvaVbcJAvVX08NtqnxtQzcDQRGMPLY60x5Gagzw7ZKe3BE+Y2T+TPVBhTX+y6VBdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNeiWEa3a7hPWPY5TZwX0Im3GKAL4AZfq4/8tzIzRz8=;
 b=ksc57VrJn0S59hEiCwBQLcBJrwaSXjhm2KFedwpxhvW8D/H4063oXhVq028fMkwbtgGHoUe5qpk/I9TSAtGBHhVxsRO2VGSE1mXT8jTu32xeFd+S0lOy0NTk1rsROiXHihIV+DF6wZQ96VsSuGiV4NIvXztdo9kgi7Srb5mNSuFet7wpatBRvcjoOeNtvcQv4u0wKO3MOCBzz5ocAGoikVSPQFuVzWm2XfnbBPFu5zG6H1amhfKw0WP0d4zwFd4G6orpf26uEQS/+iCV85QN9Kf1g3pOtq/dJZRoaWds+5peXt9jdpSP/6II37L/0pVrTM8TzUprF8B+TmB/QghynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNeiWEa3a7hPWPY5TZwX0Im3GKAL4AZfq4/8tzIzRz8=;
 b=EVQwkuZ4Tob01bjFDHtA4uDo+YDO81GFI/j2k/vYrIctqaA1pdlW2mJRqwSIo3nFFMMMzEmv6HcA2bUp0hdyOoLqpucxedZ7lILu7C6Mag4S280aW9d5IWiprg51PwsTIj563tc37vhvNqjIr7g8tcbqOik/AOZKZUHRge/oDvPT85RqoEywS4vdJEPy8tSBvNL2IH02XIQay0RqY3rttCdsRAV3ZMt0KE4z7UJE8tLChAyEY1AoOBot6fiWEAmqHNiZNJ4R90mKvUTHQw4JIzQZp8vd/dJ26mlffKJhcvO2MAaouo6O4px1ZbZWuCb8mzHv11UpiJ+XBpWW9oGySg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 06:10:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 06:10:05 +0000
Message-ID: <901dcf27-f9b8-4c21-8012-3c77ea9bdd83@nxp.com>
Date: Tue, 5 Aug 2025 14:11:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm: bridge: Add waveshare DSI2DPI unit driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
 <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
 <9aca40c3-e22a-4d41-bac8-18a7cc8e3e96@nxp.com>
 <8c8d9723-bb0e-4c4b-9fcf-3e1ec46609bd@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <8c8d9723-bb0e-4c4b-9fcf-3e1ec46609bd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 2916958c-1bfe-4370-4d0c-08ddd3e6b8c2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUlGOE5pbDNSejV4dUVjYkQvblRHMHQ3OVJZMFlrZVZOTXpaQUZUNHArTWRz?=
 =?utf-8?B?TTg2bXZiL3dBamNJTXlyS1MxUUVkMHVtMFVOcFVCYzd6TEt5MldqeU5jS2p6?=
 =?utf-8?B?bFFUNWNvNVEveWIveUk4RnZQblA3TC9sRUM4YTNJaGhaMHRLakVuUUFhRTRv?=
 =?utf-8?B?akV2WGVjc1FnTFJaOXZsMllQU2szbDV0Y2tTaVZ0ZWd5WVAyVXRtUlRuRzRN?=
 =?utf-8?B?R0hyU1FoYmpmQ3JDTkxwcUNxS2NWZWpHNGR5S3dDa2RQK2dLc0JtYlRTL3JO?=
 =?utf-8?B?ZDJiNTlNNGUyMkxZdk9DSEVxUnZIbUwwdGduWWp5YW1uTWJZUEx2Nk0wU1V1?=
 =?utf-8?B?cWVyQjFDRVYyWW5RRm9XMHN3M3g1UHpKVVdBbThmR1k0QUpkS2JwLzEwOHVj?=
 =?utf-8?B?V2hkWkV3RDIxT0d6MWVZekVONGNPa3VFVTROWTR1YVpQdUd5VkNvZjFDUWFQ?=
 =?utf-8?B?Y1NDTElOYzc1TGp4NzVWaGFlRGlmaUEyRkt4czgxVU5sUkZySEJ5K2tXeFVL?=
 =?utf-8?B?ZmkwNG8rc0ViTm84Zm9FNDhrNWtydGVZUWtvK0hLOHEwVTRCN09Xa3ZlbnR4?=
 =?utf-8?B?S3RRVDJEMTRpcEFiUGlXazR3eG90R3E3MmcvTktsNDU4c1hUTnNpYnlsZ1Ev?=
 =?utf-8?B?Y3diVlhzYlpzTHlyR3F1V01TVXpXWmZkQXB3cnMzVXNjdmNnalV1cEc1NHU2?=
 =?utf-8?B?ZWloRW45L0ZhcnlkbGRHN0xHRW54S1l0NEFLQTJYblFuWHltVzhmbEJDZ0pk?=
 =?utf-8?B?NU0rdHo2bFJlVDFUSnJ5TS82ZEh1ZjFWZGRwYWZpQVpaY01UaEJBcWRscDBE?=
 =?utf-8?B?VmdZUlo1OGIwdEFGTU8za0RZb2xnMEdKZ1czaTNLSHFxUityanAyUC9idG9o?=
 =?utf-8?B?VUN4U3JEMHRIVkJrYmVQNXBhdklOQ011WjlqOHZoZFpZd3RsOU9yL0JCaFpx?=
 =?utf-8?B?UXhTZmJBblJxOUF1YklnMzRrSWtpam5HVCtlNkkzZExwWU9XK3JFWWYreDdJ?=
 =?utf-8?B?Um1tQ0NnMXQ3R3NkUi9HRkhkZnRWcllhRnlPeWI4YVpUZmhOU0ZOTEo5U0g5?=
 =?utf-8?B?WkU0bkZORytJR2pZMjhaV0w1clVZWFcrdTBGbjJhelZiNHNpSkFWV0k3bE9U?=
 =?utf-8?B?WW1VYXYrV1p0aGZPQTVsWFpjalE0U1J5SzZkWCswOXl3TUdWdzQzSFVVMnhi?=
 =?utf-8?B?UVZ4d0p0eHdYeXA5Y3lucUsvNUp5MjRxV2hqNjdKbGJBYURYRzZPN3lPU0M5?=
 =?utf-8?B?TDkvWlpocmh3QnI4UjhZK2N0TGdlUmJmTkF2V0VUTlgwZUQ3eHJ5NW1yYytU?=
 =?utf-8?B?YklQd1RjYkcyYkdHSUR1Ymo0QmJnYkVwaXc2c3RWSytuWlUybW8vQjZaMDdm?=
 =?utf-8?B?WXo0SWZwUlpsbHZKTkNKd3c1OVpkR0pLbmFQaytzWEFyZjYweUZmNFlvMTlJ?=
 =?utf-8?B?Q3hTWHlQN0lhTHhDeFpHaEtVTEhMQXc5bHpTUGp0Y2VObXB3b2Jkckw2bGNO?=
 =?utf-8?B?eGxHcXl5L2M4LzJzTUFVNzRCT0VZWmxuOGx6V24rMkVBc3g0OWRLZjhZdVhW?=
 =?utf-8?B?bXBsa3ZwaU5rMVowcWcySkk4REQvTnBLYWdRZEZLUGxSWmRrRVl6c1hzNS9p?=
 =?utf-8?B?cXpNWmFqUFRZbjcvM1F1L0E4SkdVNE1PdUJ6RmFPY3dyV2I2Ry80YlczUmdL?=
 =?utf-8?B?a2xRV2lvNm5yMDl1bUhmZXZVK3BDak8rNjhpUC83U1dNSUtYV3M2cHE3cnlx?=
 =?utf-8?B?Z1A5T2NRbkZrMHY1SzF0clM2bGFoY3VMNWhoYVQ3V0ZyUjhPOEVCVmpMblgz?=
 =?utf-8?B?cEVtTjZhOUFrb0ZaQ1ZBWFgyV1BKbEVKaThKV3NLNlVJbjlVbVN1MmF3UHh4?=
 =?utf-8?B?TkJpUlhXaGRqYWd6ODA0a2pMMkhYUlpCZVVJV0oxdm9Oc1pWT1Y1clhOTUFY?=
 =?utf-8?Q?9vmwwOcVaLc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2dKVVJwQ3F6ZW1KYWRqNEF4VHNjSUVVaUdweWxzZ240V25tYnIwbUo2cGt0?=
 =?utf-8?B?TVFtSWVDZFpPMjlUOG1OWjBpc0NjQmxaQ0N5eFFjZnpVVDNGVGF5cjFrY0RP?=
 =?utf-8?B?MXliSFMvK1VSU2Zvck14d3llT0d2Y1pqeGQrQ3dUZmliK2MrcW1oQ2Rpc0p1?=
 =?utf-8?B?a2s1Ymx1THA3dDBJSGZRWGJOZ1VwM3JJeWdXVHI2WGErNFZVb3E2ODhBQzFM?=
 =?utf-8?B?RDI1L3dUNVA3cVF3YkpUZTMrenNNRTZlN1ppS2dKMEV1dW12UC85U1o5cHIw?=
 =?utf-8?B?TE9pYUZTdW82N3BjMTFNRndGQ2haUmJiTkxucFl4VzlGRHVidUdpdWhheXhZ?=
 =?utf-8?B?MEpURjN2aHhGdFNrYS90ajhpbWxYNHVPeUdTTkFZN0d5V05vcjk3Q3F1bElC?=
 =?utf-8?B?cExYdmN1S09MNU1Ecitmc3dUTHdqL2VBUmU3VEVUazV3T1RUcFFGbG5ZUFVp?=
 =?utf-8?B?T1NoWFJTSWRiTHJMTGg1VW5Sc3BUUWFxWmdmRzRRSS94ZTkwMnhhbmZQT1du?=
 =?utf-8?B?R2lCaTRzQVV2KzVnZ2RnS1FMUHJoSTZ3WTRUR3QrbGVJWTZxdzlKWjJIZ29K?=
 =?utf-8?B?d0xGV1c5VG5IZ2NsRlM4OFFMNmpJNk9nQTRpdGJyazhCRE5SMjBYVjZyWlBj?=
 =?utf-8?B?SWx4cHIyZnNrWGdtUEpuQVRJOFNUTFpveEwySVVuQ1FvRDZsVGY1RUg0elVS?=
 =?utf-8?B?TDdUTXNLR0cybXRzTm1vVGtOUWFCLzYzT0dvbFhMQUdKOVRmWlJVdm4zMHNl?=
 =?utf-8?B?allIQU92WlhTeUVrQzFIbWJVUVBLNUJyR3JmWDRYM2JPNnArRXpMQjlrZGV1?=
 =?utf-8?B?dS9rVFFyendCTVhlRzQrL1JpYy92NTVGRFcvaDhXeW5ZNSt5Zk5mdEhoNEcr?=
 =?utf-8?B?UVlOdWFxTjB3VURVWHl1dndySW1pKzVrK1hNWHlzRkRWU0hQS24zakNqMnk1?=
 =?utf-8?B?SXNnU0Q2bEdZdlFRUmZ4WllyVVJYUHQzbFIvV01PaGRESGQrMGxWRENoY0ZC?=
 =?utf-8?B?Qnl2MUJWdTVzeGFaWW1sYkhSNStnQkpVeENPc0huWmZWTTk5dS9OeEpyOUh4?=
 =?utf-8?B?YWExRmgwTHRBQjQrMFZNbUNwWXhsSmN6U001d1pZd1Fld0xLWjJOTnArN2s0?=
 =?utf-8?B?US9oemdqZm5xS1VvUDAvRTd3aTg1Tjh1Qk5aY0Yvc2tZdEFpKzg2Qmh2ZVU4?=
 =?utf-8?B?YitXUU1ESmcwUXEzUlkwbThGY0huaWlrNTZkUGtDZHJZRG15cURvcG1vZ3lB?=
 =?utf-8?B?TkxLWWNyZWluYjlaczBQR0Q5cjJCNHJwN2E0YzE5dGdNWTJjSnRHN2xpWVlP?=
 =?utf-8?B?MmVIMHF0THJLR3NQaEhOQ2d1MmRBN3RmQjIxa0NXRUFNUkJhNUF6NzVEL2pu?=
 =?utf-8?B?VTFhdUJ5aXY5cm12SXZzMGVqM0E0dlg4Q0hOUGp2Z3FnbnJQdEVERkZnR0pi?=
 =?utf-8?B?aUlOUmpyN1NJRmorUVpiVVNPMko4THB3b1N1VEtPU2xoYkhQNDhZOUJCQW9Q?=
 =?utf-8?B?UFdUWSt4K2NUVnN2RjZnSDVGNWRBSS92UC8rK1pRUFRQMGhyRk5Pb2VtemEv?=
 =?utf-8?B?NVdXaU1YRnBFRTZBSFNzODJyUENGd3NiMWNBY3FKelNrVGVpZk5kM1lXdUxE?=
 =?utf-8?B?U295ZUdPYzhTV0hacjgxYStZUmc3bk10c1lRMWtJbkNOWHdyK00rWXM2WUNY?=
 =?utf-8?B?eHZiVFBlSzJ3bXpBSDBZRTNUbkVjcTQ3ZGFrSjFtcXFqTm5WOVZJVEhmOTY4?=
 =?utf-8?B?RlNlMjRjRmUrcm1VS0d1NW4yZzJueHM4VkRrQTdYT1c2NkZJOGRTT0FaSDlw?=
 =?utf-8?B?c2VQWGFmQkQraTZ3T0dBT1JTRzlyQkpFbEtBMmR5dS9Na2tKaUxLOGczZWVO?=
 =?utf-8?B?Ulh2bmlUMytPQVljWEJBbnNLMGZudUhIVzBUbWdIcUtoQWR1dDIvTUpJNkRB?=
 =?utf-8?B?TWo2Q0ovRjJIQUdRZk4xVDdIcHphYVl0dy9IRERuMzJZOWxnTXZ0USszOUx1?=
 =?utf-8?B?Q0tJT2UxM1hYUGhmR0lnQ1U5dXR4ZEpXbTYzWkJGMVlGSEQzcHdCVlZWL0wv?=
 =?utf-8?B?dWdiaGgxSVNpSkdCOGdqN1d6b09pZjQ2bG05NVR1KzdnTjVOMWVrSkN2OWgx?=
 =?utf-8?Q?UbkYoTD76hajOrnzpOf4s7a2y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2916958c-1bfe-4370-4d0c-08ddd3e6b8c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 06:10:05.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXJf2/ejfOjRi9jcr3kYDB/jppFnBVs6xfjUXMq3Uc0Jdrj+sOcasmUS7E/iqky/8wJ36rfJ/S2sIIpstt53qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024
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

On 08/05/2025, Krzysztof Kozlowski wrote:
> On 05/08/2025 04:22, Liu Ying wrote:
>> Hi Joseph,
>>
>> On 08/04/2025, Joseph Guo wrote:
>>> Waveshare touchscreen consists of a DPI panel and a driver board.
>>> The waveshare driver board consists of ICN6211 and a MCU to
>>> convert DSI to DPI and control the backlight.
>>> This driver treats the MCU and ICN6211 board as a whole unit.
>>> It can support all resolution waveshare DSI2DPI based panel,
>>> the timing table should come from 'panel-dpi' panel in the device tree.
>>>
>>> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>>
>> For next version, you may add:
>> Suggested-by: Liu Ying <victor.liu@nxp.com>
> 
> Why?

As I replied in the cover letter, I provided general idea for this
patch series in NXP down stream kernel.  Same for the DT binding patches.

https://lore.kernel.org/dri-devel/647f4a16-cb25-46f7-95d7-4c049e6c145b@nxp.com/T/#mb491c1e74df28dab74d8dcb7843f12e7a3b537cb

> 
> Best regards,
> Krzysztof


-- 
Regards,
Liu Ying

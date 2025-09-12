Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FEB541DF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 07:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CA210E42F;
	Fri, 12 Sep 2025 05:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="T6HY3RLb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E202710E42F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJ2dk4PCcoGOaPbbbvbqfvNT8pLNxKPKnV/0M3ay7ZMfDB0hBVDsxzvLKv3xHB3yPO/H5gLXNTm6YYAUVDQKaP+m4/mGoC1TgK/KlQAWofrKhYAqtrrk9K1OPeUaa2h+e08yEt6mnsbgurEF//1ZzQoH9w0/pb6VKip44+XIR2QfjtKAgKvvzxPFUMtGWLt19woa+EIMBgWaxqP7u80ymIz+H5KB5ncrwok+ex7bz4Q5Xfz7odF2WlBKz9mwodQCpFEbSHUL8ZDCnmFSek3nTy0HLUgCWYGSegZia8NcVLSrsKHt12WwuGTKB2Y4XiMfmIswrWIt8JWK5qSI4XIDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yzoe9bBy6JqFGvw4aQe+FnT/opNYGoZccJet5HeyrHc=;
 b=dI+Ak5KPTgazN+I1OpqHMaP7hgYCWMdky6FudPZVQJPwmVMisD93LrGVbWVnN2RbAAmPPcDdVJpoiopscj6sQIi0VwO/7ZGNu5OOAyDmo5swxR02FlHgE3zPk6/R/TxqxLqVkuUPHWYNMUq62xBpXkslD0v8/GU2yTdMLz+fmnjAuw+7uHNKMj6/Mk0P3CdSHs7WfVgsTdGcF7ZDIxmOmCDWkbV+TBepZF/3yWs64FtALauKLp6IREKuO6173zGH3NaY+MQ/cnu2smPw8lis886eV311gSMoCg5Bu+IBMauN1XY72ew5zCIFtCBaXgmNC+l8kzaH1FdFJuAzW3Dr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yzoe9bBy6JqFGvw4aQe+FnT/opNYGoZccJet5HeyrHc=;
 b=T6HY3RLbxI6CeX6pgDgp9bdar2qCEmjpfuOVLE2vkzeJUlkhQt7O0LxiYtfvfKJKmsB3pHFb9q0kgP0JH6/tM7HuLRdCKyQ2V5K+OPTJ8s908tL5dVrfea2wf4HwHwDmgznLPGh+eVXHC3UEclUMEUXliASBm7gLcsbk80PUfteCOaUHnHsglUPm+UUbooq35b+UGvT3HZq1FONaqAmUyJJ40NkvNEYngLjG7F1n3Ahd0AjuoxckWUgL2yEQ3XxUTxlZYJyzvE5J2EwyeCvHKW8Ug6zBT1s/KXySH+nUo+cjNKz7xGlEsTUwf2iAgcsAbbcs9ghaoWX3Vb7+gRrDXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Fri, 12 Sep
 2025 05:14:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%5]) with mapi id 15.20.9115.010; Fri, 12 Sep 2025
 05:14:11 +0000
Message-ID: <9ee65036-be35-4adc-a3b3-bd495a926905@nxp.com>
Date: Fri, 12 Sep 2025 13:15:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx8qxp-ldb: Remove dummy Runtime PM callback
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <c7436cda28409f0080dca6cd2ca13f142d6dc489.1756999913.git.geert+renesas@glider.be>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <c7436cda28409f0080dca6cd2ca13f142d6dc489.1756999913.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PR3PR04MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1f2a0e-902d-4c7a-e0f7-08ddf1bb3528
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUhjdDFua2FnWm1Gd3FodWc5MHNCdnJKdldwcHBGS1RNZGJlQ3dqT0JNQUdr?=
 =?utf-8?B?SnpyOFY4YWJnQTk4NFNWSlJZUjBmQ1VtT3h2Mkw1VER3K2xnNUZvaE9sODBS?=
 =?utf-8?B?UFhWeTNvVUJTa0xTcjRncEtaS3k5UXFLSjJTdHpING5Bd1FNMUVpUkM1d3pS?=
 =?utf-8?B?Vkd4bms2dVZLUG9iWUE4QTkrUEpqMUo5Z2ZHaHpEaDVmaURza2N5Z1VwdmYz?=
 =?utf-8?B?bkhUcGNpV3FqK3NjeXlkb1lmMzZ4SnEwbHF3TndEMkk1alhHK1RnRDEwMWJh?=
 =?utf-8?B?UmJkMmFmaERsSlNucVhBN1NRbnVlMU1xc012bGFDQndlN3AzaUFzWFA1ajcw?=
 =?utf-8?B?QTkvL3lHMkJ4Tm01bFFucWJJc2JOb2daY0NOcTFHeERQWTRzbHRFb0JkTmNr?=
 =?utf-8?B?U3JPTS9CdjFpcE9iRkQySy92dUhXbVhOZEI2ZUxTMmtZMnVTOHhRTHcyYW8r?=
 =?utf-8?B?dVl2RGFMUnhGaWhSUTZ4NnpqRnBocWo4aVRWYlh1N1dLSlFrazdvcTRkeVRY?=
 =?utf-8?B?YmNNVlZRQWVZM1dZTDB6OUxyTXBYakZIUjN1ZUNHa0ZtQTRvUENjRG01STd3?=
 =?utf-8?B?RXdZeVNKUHcrWjc5cEEzVlRlZlYvNjVnUG56ZmtPMlR4WXZ2UGlNaTFCUUlQ?=
 =?utf-8?B?aEk2UmRLWTJaYStZZCtLbFl6bDgvbGQyNzlJazBqaFZpTEtYa29QcG10dmh4?=
 =?utf-8?B?Q2xvTUsvaUxMc29MVDNRaTBuM1pta3NIb2lrZVhpdE94SitsVkU2bWNSeVNG?=
 =?utf-8?B?L3pSTWlPd1ZXdUpMWndRL1pGNEZmMlpUckJqMU82TjVJVDM1R0VrQ1BxYXQ4?=
 =?utf-8?B?YkJXQlJzSkVQbTlhZ2ZGVUk4QVVzTjJTMjV5cUl0TDc4ODhrRnJ3T1liRUxi?=
 =?utf-8?B?RXkwZENBN3dUOElTNjBIbmhGdHNqMXR2SS9tRnVyM3pxVDNmRDNKbUs3ck1x?=
 =?utf-8?B?LzVpcDk0VVUyYTd6WExlczFwa052NW9HOHhlMUdJaHJnRmg2NlFseXQxNTlr?=
 =?utf-8?B?RGZKVUo0eFhuTVNEVkxwQ0ZXamhTMmNtcXp3NXlBNnVkWHN1ZmN0WXpTZnh6?=
 =?utf-8?B?TzYyVjJ4Wm9zN0hnenlwbkRyZlNxazJkazEyYlBsZnNpUXpJSjZFeU93d1k5?=
 =?utf-8?B?S3NsSFN5QkMyL21UQ3gwbGhscjczemU5ckM5UUVqTlJodkxkM2NiaVVHRnpV?=
 =?utf-8?B?bEdTY0s0NktYeDlmVkRESjc3aG9LWFIxaUJpY3FTTkU0cUNaaVgyaGZHQ0Vl?=
 =?utf-8?B?alFweGZzaFp1QXR6dUk4dmY3U2EvWTdnWmg0YVA3d1MwRWxPalN6UHR0YW56?=
 =?utf-8?B?OEZHUEt1aDQxVjk0YlVuVm0yR3E0TmxQdDBiWG9RRW5KUU9xUG9QcXhJcnF2?=
 =?utf-8?B?bHdTZFNjOEUxMUFONU1PV1hrQlNhUVJ5Qmk2dXVvQVF4M1J0TDNQcFdlUzhD?=
 =?utf-8?B?MDFlcGVhWEJhTmtDalBGeXdTTnVHQmQreC9MOGkrdW1yVEJZdXU2YzJUd1dL?=
 =?utf-8?B?QWFHaWlJUlVwY3lneGgxT21UYjErTWlQVWhWZWx3SVhRQjRjblVpaEwraTVq?=
 =?utf-8?B?U3A3R3hySjZsR2NxRUlRQUNMRTNvUG9mYVBaWEswc1lxZFNZaWJWTVU0VkpH?=
 =?utf-8?B?ZVNQNGQ1blBoanN6aFBZR0RyaGdPdy9LUG9nSUFBS1RoMFZkZm9DRkVLWEFC?=
 =?utf-8?B?UnFiNmNxNXlDSkZvaHhoRm9BRUVkWllnd1krMXQzcEJpYkhNS2ptMWFuNE1m?=
 =?utf-8?B?aHJQelROVEx2OTd4L0RPWllyNGNHUmtVekJjNEw5WmN1RUR0SG9CWFZUMmtN?=
 =?utf-8?B?cnZOa2hiaDNpNElvZFRpeU1CcThIaG0yVnAyOUYwZ1dndHBtV2JRR1JzNVla?=
 =?utf-8?B?SFN0bFQ3RDZvS3RKYWxESnlyVXArMUxqK05TQ3VJVHlLNjNmM0RPSDBma3l6?=
 =?utf-8?B?aVJJS0x6dlBITHMrQU5Yd1JQaVZQYUJaZjBiTmwxZ2tTQWM0bzlkSlZyalI2?=
 =?utf-8?B?TWVMT002RnFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkszVVlLQkFWSVBTRUIyQnhiMDlOYnA5NlByelFCREFja3lydHY5QVREVVc4?=
 =?utf-8?B?Qzd2MFprZTF1c25KNFZxbkx4WWloa29XQi9pd1ZEa2ttZWFTZUsxNmh0eFYz?=
 =?utf-8?B?bnJ4a09RSHZHaklKbExDbTI2T0REV2xsQmhPTW1YQ0lKL0VtNUVjTmtJd2po?=
 =?utf-8?B?RFJVUmxuK1VuUkhKUzZySE91TXE5ZHVETVJSQVNJMzFPTlJQOXBBMENDTExF?=
 =?utf-8?B?cHJOcGRmZmNSYVU2U1FTQnZhSWsydGlFSEFBRmJWNmd2SkkwMFpjSGtuNlNW?=
 =?utf-8?B?OUJmbWN4S2d5ZW1xbVRJT1BscDNiaE1jTDZnd1hOOFdkeFFieUhtSW0vWWRw?=
 =?utf-8?B?Rk52WERUa01haHF3ZTVlTlR6Qnl2S240dEN3R0NHM1VhenA3V09Wd2JIYWRJ?=
 =?utf-8?B?NGRpWGNUZHdqL0FsdlQ4UittN2ZFSlExWFFlUkFDZFZERW9BZjZpYjRQZm1Q?=
 =?utf-8?B?NGxBb0dGQW54TXhKaDU5RjhHYjkySHF2WDdpL1RyeThGVmxZM2xnbWtoNllq?=
 =?utf-8?B?amR0YXIzRFNjdkh6UHBxZVloMHEvemc2K3FyM2p1K2pFN0txRWE0ZkNlTmFH?=
 =?utf-8?B?TFdMb1VLNWlFZXRKbUR6VStCQWErODdVSlM3MllzSjk5OEJ2TW9DTnJISWVI?=
 =?utf-8?B?TnRlUStZSmxqV2J5Y29QSEVUMDhiYzFucVllVU9RS1dYVU0zQjF4Uk5mMVE0?=
 =?utf-8?B?UkR1UmVwVEtKWWNnMmV5UUUyNk1oWFN1YS94ZTFTRkk3allMd0lwdlpNQnAw?=
 =?utf-8?B?dDl2UmJOaUNlZXdMWGpRVmVBbDJVOUJBaE5sdDZTUStvYmNKYkRsZmJaQk1l?=
 =?utf-8?B?eVlvRmRCYTFXYWk1b0hBdzYvSVpMK2xpbXVkakF4ZTEyOVV0M2cxL1IrVDlk?=
 =?utf-8?B?VVZzN1M2eGNyZ1hnVHc0U2lpa29pSk9wM3ZMQWg0aXdqazEvSHhuZmpSUG1p?=
 =?utf-8?B?M3NtbEJoZVgwN0pXcDN6VFZHem1DRVkrWlI3d2twYWQ4aXpodzZZRVdwc2I5?=
 =?utf-8?B?dnpQUkhTVjk3VzhjMHN4ZTVuVlBTZFMwaGVVQ0wxbkpWTXN1YjY1Z3ZBei9W?=
 =?utf-8?B?YkFuQ3VoUTdzZmNhQVZCYzY1NHo4d1RtbjZUWmpUUkJhUWVOUHcxRnhaN0N2?=
 =?utf-8?B?YVRuVHFyV0hxMzF6ZHA3eVIwc1dGOFd3Q1RKMlRiTnRhZkVTM25ZYjNxamVv?=
 =?utf-8?B?OTlOaXMrc3ZOYTVWU1VaeDl3OXpjUEk3eFdWOEJDdDdWdXFjVnFkRk9IL3h1?=
 =?utf-8?B?ejZWeHdNU2NMYnBkOE0vMVVxKzBMQ0FoVHhMQ1NqQnRYbWpPTkVPNnZSNW9S?=
 =?utf-8?B?MERWVm1TT2JncW9Ua1RVRFlnMTF5eEY4VDRmYXFHU2E1SytvNm5RaitlWEND?=
 =?utf-8?B?T3R1c0Mwd1Q5ZGZBOHpPMWRtUmlhakR0eTZoaTBWcjdzWC9NUjd5Wk5Ia0FL?=
 =?utf-8?B?d0Uyejd2WDZXUG9iZ0FRelh6QjlHQjJGb0FoLzhkKytlSno5R2VCREdNZDNN?=
 =?utf-8?B?K0t5S2IxM0svb3F0OU5ubjlKM1AzamN0NmlNUWFWR2VFcmNrUGducGQyaGU4?=
 =?utf-8?B?WCs1K3NwSHFDZkQ1ejFZOFFESjJSYzRzU1B4djFzd1A3SzU0QzcvRlhKTDAw?=
 =?utf-8?B?c0Z1eHpjSEkzYUNHaC9Qb1hFSUVYV2xLMnNYWUNQcU83Mk5ZREpjU0RmU0lE?=
 =?utf-8?B?Kzh5Zm04UkMyZm8yQ0Fhb1R6YkxqY2w2QzQzZENYMG5JUE9aKzRhc0JhMzRi?=
 =?utf-8?B?YWJWeVFUKzV5aC8rVWxSYzNndkJiOWxuY1Vkb2dwVmVwakt5MmxOczludXY1?=
 =?utf-8?B?MmlPWTJ2ZTdvNU0zdFZXT3FGWXo4QkwxUUJzNWdtWkgwY1h0eHZETjZpYjVw?=
 =?utf-8?B?U2FydHRNZXY3aytUekNxWEpYb2s0dDdmMlRKVFVUSmNyNFNsVlNWZjcvendG?=
 =?utf-8?B?Z2tydlVDbnYwMzVTQWUreGFtTjg0Y0QvbzFCUjB2S3NxR1o5aEp6MEY1ZXZ2?=
 =?utf-8?B?M0ZMZy9tVDRzdXBWOHhPT00yWENzdVpYbmZzRHdvMGVtU2RBbkRvRnhiYjRW?=
 =?utf-8?B?NkxGSzVvZklrN2VBWSttVFNvdlVkdWVOOEQ3UlZNNXhYRFh5ZVlROE5mVlhI?=
 =?utf-8?Q?JFA++3mAJ+Ekxs+tQaoY9I38E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1f2a0e-902d-4c7a-e0f7-08ddf1bb3528
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 05:14:11.3502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHRQ2wB4VXQcw1QX/EArVBNDYyBsQHDG9LYL97AJxWWVPhx2/uxMSmEljn8Ba46CDsdYrYDk34T9wrCwM0obNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243
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

On 09/04/2025, Geert Uytterhoeven wrote:
> Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
> ->runtime_suspend|resume callbacks"), unassigned
> .runtime_{suspend,resume}() callbacks are treated the same as dummy
> callbacks that just return zero.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied to misc/kernel.git (drm-misc-next).  Thanks!

-- 
Regards,
Liu Ying

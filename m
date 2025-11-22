Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD4C7CDD3
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 12:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA00B10E05D;
	Sat, 22 Nov 2025 11:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="mOcI9kd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazolkn19013085.outbound.protection.outlook.com
 [52.103.46.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3D10E040
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 11:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmmlbFoX7Qw6wZb3Zi3jDqby7cj5INqnzegrxQgi/rzo4aauazWFM6ZziGhsenoOuask1q39n352UvEeltw5pyQK5DLA6dczeeZ3gA4iKmp3TjN3wKdjL+q746+8LI4d2WfgMmcOBEoYf2VAyVevo36D86mjsM2vGbSFvoSKhv4OKAHhRPHOzXMpA670CDVUw0/3h0TTI8GGnbw6pz1NoHeoq9GoWwIUzBRiVO8bHku3+nozVHfTTECywJYvssKim5aJpYsN5Ep1jh/M0kL41TPXvayV6UaBhvWjTKzAB3A5BKLHxD1Z9XK+mhkZCy/XHOo/ytODUaKD2dLU/a7khA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vZmmn2fgeqlK6fj8Wn5VIIqiQcg2Nv9hiTM4hrEAGY=;
 b=GXvBxAEr12PMEoUCkDFnrR9CY65oMtVlG0sGboPRq6+v9CjQBIjxxiKvK6lTc0kxA1Idi7SdPozdsUHivfXVH6LCU4zJ2yvCitku8lUtQf7pi+3C1aCk6U1vPHKIJGznEVVOGtamH932Uvp3etzRPEuq6KLVp4d/ST++stg5/fop+F87xkp6pe0HrfGH4/+KIsjfQvhvvNJ944tQswJWImXy+T4GOOw5YSuH3KOKA1guh9+w8MsQ2gKN08TVfpgd9EeSOd6mv0e1+ZPc8NgJQtUdFx7SZWnTE42YOPSiX/3I7GOoe3yYpHAUWO+9iRrPRkg6NUmV6Q8Cl9quxkSxCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vZmmn2fgeqlK6fj8Wn5VIIqiQcg2Nv9hiTM4hrEAGY=;
 b=mOcI9kd4qJYkADuwMPp0OB5EoTbmuSt9b3sA3+oq02bChmACb/wyMYmwO+umd+H4b93P5sGR8PVWhXHH5zDuW1Hqyw6e8MmcHZmQNdCSsl3m6LORumMorNIZxL+sbQrT0Rs8HLv6RLYiuFBcYNVRPB30ClRFqggxfPhO2qJYZXhR4X9YxZjbM7Z7BTg6Rj27dKBm+qreIVfktF95ppAreYk6YtA+Nysix/6RPhT4rgvAwAnaKVZrJIVfkTlDevJZzOXbmk35WhOEc9aqmEVZ+uOhear+NCoqPR97PXQ7YbhEFAZydWh+1W7gGNNxSB+tRTX9qy8gx1mRl1oBTx7MGg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by BESP189MB3180.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Sat, 22 Nov
 2025 11:07:33 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 11:07:33 +0000
Message-ID: <AM7P189MB10093041E89777C2AFAE2CEEE3D2A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Sat, 22 Nov 2025 12:07:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
 <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <57bab427-d8fd-490d-88f6-358b79367ed1@oss.qualcomm.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <57bab427-d8fd-490d-88f6-358b79367ed1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::22) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <8403e09c-9e37-44e9-892e-7420d2faf286@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|BESP189MB3180:EE_
X-MS-Office365-Filtering-Correlation-Id: dc892b9c-390e-49d0-bfde-08de29b755b7
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUhM6k1QWx02acDuEqXpbI5WKAf76I4g/De41oWsynTQm40/I4VQyOEDhhhrH2h6ERqxW5rDOlVHvfXv7PKP7urxW4TdpnxEDj1PSir2UMFWZw7/AX9leMP2JVrX/qaZ+aXYrCwBCyZBskDj7N1W+xeMXdfr063Gc9N2X39d/lNNxPx/MDbc/3mdH9qHD9UcjfEdYJLiVExh5SNKKCueEqBePRjoZSsVI36KIj7HN3WZuqFASeRsAtcFrvy3JG0Tyt+8TCF/wAAYCb0KDWzYg58o3JB/GsAZkd4119i0tyFvQ1+wo1ebX/tuyGYcb3p0M59wtxsPS+8sLvcM/ZwaPMcp1OjQ4voswouqbpfSmT9Wrb5vHPA2FJkok15zPsM3D+mE2zjL6DrToqOjN/THDKxlaJcHy4aSW59creqZad1WeRVYe2lo315TlJPVuhHYMqVJFyCnUUyre6C0kdlBmnkz+1c8BUO8D8qYDnpcfANncmNg9Tkh1f9ktgwdJ4KzUsx6RcbK3lagcd7fDtDO4aRn2ajWf2zFW9y+XJbF/AWe7L4h4rejgFuVhF8NIMiqMfBZTB7RhYlz+1F3RS31GTiTOdL4p1nKMG7iL37UmHgP0O7yuPD4IZDa2ixlDjFik/nkYxqVB+yTcdHxARO4INnGDsuZMWEQ/UIT6sMzgtU3fCawCA8WA89sJ7yHzFdJNUxFuhBb6/jMaam0Q14zKwc650BOdBr1YdPfuhG9p4a+ky2GsY8RwBF60C5GMyW1Dw=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|10092599007|15080799012|19110799012|461199028|23021999003|6090799003|5072599009|51005399006|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlM5ZUJnZFJzbHVmRlRIOFc3WkxLc2xoOXAraXduZmp6THllRmNPNUFiMElp?=
 =?utf-8?B?blpjSVNtNFNRU2F5WUtBYTlycVJReEpDOHZ4MUFuVUdZV0R4cGUzdk5yZ3pY?=
 =?utf-8?B?bGRIendGbUd2ZHNZbEdxTE1SSjUxZHEraWZwM04zSmxlOEF1aklrbXpRelBH?=
 =?utf-8?B?RjdBNjJhSVA2bjFYejduNUpCU3dGTFpPUFBna2szWWkzdkZQM3EzN2dZd3JD?=
 =?utf-8?B?T0FudUZvaW1TanZRNVhZK1NVcUFuZmN2ZUg1WHlyZ0pnSzUyNFR3VmVUWVk5?=
 =?utf-8?B?YTRhb1BuY210OHlZR0NhQUdBd28wb0ZoblpTM29DSVRRdGtBZm9OT2tsZ1dk?=
 =?utf-8?B?akxwT0MveGMvQVhZL2tYSWVkV0k0OTFYMUpCbVcra29OcmFvcVJINXlyYWhj?=
 =?utf-8?B?VW1yVFd0ZjRidDRYeTMyM2s1eXJkS1hrOW5KQzk4ZnBTVEx2K0lYYUY1QzRK?=
 =?utf-8?B?eWZSSjMyNG1ZVnNvUHNzekFsM0UxaGpYQzlxRUI2dE9mbVZiUGtQOHhvaDkw?=
 =?utf-8?B?b1BVMzlyRkJoUGM1ak1XTWtqQWc0WUNxWjZjeTF3M3FrV1RXdnAxQVhudFR4?=
 =?utf-8?B?bDE4dFg3WGZsUllpUVo5cjJoMUp2WGk5ZGxFcEpaK1Fjd1JSRjFoVGdhdG1B?=
 =?utf-8?B?QUpWSWdSOFNhMDZ1akk2Y3JEWnJZakMvZlB5aEFuMnVmSUJ6aHEwWDlsZlVL?=
 =?utf-8?B?MWNHZHF4RHZYS2w4UUU4aXFWc2pKSG5udVlvcFU1YlJocTA2ckhhd0dsRDFE?=
 =?utf-8?B?Q2tyUHVLUlhNZkQ4bDkvc0h6bmNtSU44aXNyaHRpTStzdEdmRDNMYXNKOHRC?=
 =?utf-8?B?TEdkangzQXJ4NnJlbU5OS2YzNjdSYVM0OVNlejBjd2xnRytLMDhyT0VVbmFt?=
 =?utf-8?B?UGpJRTBYa0tFOE9sMnVHMXBadUsvb2ljOVdBNnpuR3NkQlEvM0hkUmFSKzZa?=
 =?utf-8?B?OGxJSFBodzg5NjBUZWdRbmd5L3c0SVZzTFh1dm1XRWRKdXdFRDlrV0VPYUlv?=
 =?utf-8?B?TnJsSzlKRmtWOWdFejlIbzN5djBJMUxkZEljYitsTkFod2ZsYmNiODZaSnFk?=
 =?utf-8?B?MkZUQ3Nvd2ZWQzQ5VThYUmcyRFhTS1drQUxpN1RXMUE4V0l5b0ZFTnVWTU4y?=
 =?utf-8?B?N1E5ZS91a01EM0V6Y2ZsT1RJSjNtYlRPUzFxcG9jc0VRQm5BUjgrc3I5Smxn?=
 =?utf-8?B?UWE5MVFFd2tEN0lTZjByWEd3aGF4Y1FwNHhmZEpGYVpyUEs3NVR1bDBEY2ov?=
 =?utf-8?B?R2JCMXB6WXpUeERUeWpSS0tJamI2UE9XdFdCcGdNa1dTSDVkNVcyT2Q1cUVm?=
 =?utf-8?B?WDBDZ21SUlFrUHZweTUyNWxmMEw3TmlKR294ai9YLzFwaEFIakZ2SklTZW1J?=
 =?utf-8?B?Tzd6aUVnZnNRckRDVmZCTTc1cFRhcjlPbi9BdHBkQ0Y4YmZ3K3dsZEZTRVRH?=
 =?utf-8?B?Z1dGeEJHaU5xUlA3YmI2Z0FLLytFUlNpc1lxMGxGSWhneEpERFZsYWNBMDlD?=
 =?utf-8?B?ZDN4MCtuaHhTMHg5SnBNMmxIbEl1cnlJZmlXeWoxTWdJcUZvKzlUbkxuY0FI?=
 =?utf-8?B?UnJhVGZ5NEtLTVlLNklOd3lTTUZpVkVXWjdhQlA0NEhScVovVmlBUlJoYjhH?=
 =?utf-8?Q?BIZBSomNkDiGMIs4r174tobbYW8aGCnOWYEWOTMRONzY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnJXN09KclkxVUYrK0lCOWIxSEV5QStNYmVJL2twYS9UVHBlK1VFM1pqMzdE?=
 =?utf-8?B?czNTQVc2bjY0bzA0RDlyQlBMeWVLNGNRSFdDUTlGOHROV2NkZm0yM1BtTk15?=
 =?utf-8?B?QlZGNkFyUGxUZ05XTURVbUdTaElrMk53VGVueFhXYVB5NWRUR0pxbGF1NU1y?=
 =?utf-8?B?NkFZVGFIOXFWQXVDSnZ2dlBFRWlZRnlucUxzZGovY0FxZ09GZUcvVTQ3Y0N4?=
 =?utf-8?B?QUQ1ZGoxaXlVWVZxYVpQM0t1WmVpVkY0bDcyNVZydVhiMjg1aGdNamNJUVdv?=
 =?utf-8?B?Y3N0S0h2V2lKallHSjdCeEQraHBxTERNVDB1M1RqZ3pyd2xtc3BldUlSc05z?=
 =?utf-8?B?S21RVTJQZTYvZVBKQlpkSTlHeVRYTUtjQ1VrNWtGODZ6Ui9rNzA3TnNjSTBB?=
 =?utf-8?B?SGNNUXpSQ2ViTDhHQ1BpOXlMUjk3eGRSRXlmK2dOeHVkRjhEdmN0cXcrc3cy?=
 =?utf-8?B?Sm1PODE2RHhXVW4ydWpNd1RmYlZ0VWU1QUFldWhaZ2RjNDE2WXlNbG5NWEpZ?=
 =?utf-8?B?c1VUV2UzTWRhVTJuRDhsT2JheHZ3VWxvemdBYjFOclIyU1dwVTVETE1tRFAw?=
 =?utf-8?B?ODVqUVhvNk14bWdJckNFQWVnczQwZ2FDUHZYZ1JkNjd1ZDkrbkxKa1phVXVU?=
 =?utf-8?B?dWxoczdxczdFaG9HTUpKanc3VzY3ZjVhYXMxME0zOTV1N01YSitGdTJmNFVk?=
 =?utf-8?B?dXJjaVFlbDlLRVJWS2t0dUhCSW81NGxzYXZlU3lnS1dYU1A1TjFROXlzOHA2?=
 =?utf-8?B?N3BaTUlpNVY3aWpoYVhlaXhKTGFsc2tOU3FldkFnRnlHU1BKUmsvUHIxOEVY?=
 =?utf-8?B?VllHMzlsRmFaOG1WcklaNEY1Q0tHeFBtSytmNFN2Zkd0WENjQVBPRHpKYmlY?=
 =?utf-8?B?Tm40czExWVNnNVo5a2V5a1VtM2ZtbDJTLzV6T3YvWWR0ZEF5VGVBTFBJYnNx?=
 =?utf-8?B?T0JBK0ZSbC84WXFLVlo5U3Y3ZEY5UGRZU3RxWUxBdEZvTWg5b1c2SDZlaXlH?=
 =?utf-8?B?MVYvaUxkSk9YTFNndWJMNXpZT1dkQ2VDTXd2SU8weE0yd21hTTZzWHpLbTNP?=
 =?utf-8?B?ektzSnQ0aWdLS1VLL3AyNHQyYU5qWE5aZDdEOTNVTU1HdFkyTk9EakVpbE5n?=
 =?utf-8?B?c3REeko0OTRLWGJqUXJnWE44OWc4eXJyMTVaQmVjeHFxL3lmMmV0UzFiSHVx?=
 =?utf-8?B?NHZmRnV6Z1Z4bzMwQlhpWE9nd3VmSFZZT0tzVUhHVDQ4NjU2TUFmT3JQaHVk?=
 =?utf-8?B?dVlsUUlTV0Z1bGh3ZnpCTCtmb2pWbHo3cG9Kdk1NZkJYUnlLdXRmaEtIZGJY?=
 =?utf-8?B?aE1mYnJDUDZnWFVPWWIxYkFZeDErSTBPZ3FuSTRlcFF1UTdob2MyRFdUd1hw?=
 =?utf-8?B?ekFHdzJSaHBraXVESEJDTjhTbjI1T213bFlCZHY0Vi9EeTA5cVpqZ2lVN3NQ?=
 =?utf-8?B?UWhzeWg4RUtrcnk3bWRiQnZOWXRSVDlwVFdHdkdNc0ZZOE1yeENGVlRSSDRJ?=
 =?utf-8?B?Y04vYTkzRmQ1aHdMMU9oeHFCR0cza2xZa0tXVFp5eDhNbkZkOERCWTdUVEhp?=
 =?utf-8?B?Yk9zQTd4d040S0tPdVZla2pndjJUeW5mTzJLTVZLWEU3QWZabjFEUkRDVVJK?=
 =?utf-8?B?NGhwd2VTaDYzaEZwU056ak1mMXJvcWx2emdKTkRnT0lVM3UyZ0dKRkU0OTJG?=
 =?utf-8?B?bWtDcThaSk4yN3Ewc2x4b2FNTWFXTFdCMkU2ditYWFpUdzN0N0lON0gzSUty?=
 =?utf-8?Q?GT6yLtywnpnSIgsFPEOYLXyM3ssarOUmZkqTDXb?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: dc892b9c-390e-49d0-bfde-08de29b755b7
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 11:07:33.0874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3180
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

On 11/20/25 16:36, Konrad Dybcio wrote:
> On 11/17/25 4:44 PM, Maud Spierings wrote:
>> On 11/17/25 16:35, Konrad Dybcio wrote:
>>> On 11/17/25 3:13 PM, Maud Spierings wrote:
>>>> Hi Konrad,
>>>>
>>>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>
>>>>>> Add nvmem cells for getting charge control thresholds if they have
>>>>>> been set previously.
>>>>>>
>>>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>>>> ---
>>>>> Have you verified that e.g.
>>>>>
>>>>> connecting the charger
>>>>> setting the charge threshold
>>>>> rebooting to windows
>>>>> rebooting to windows once more for good measure
>>>>> rebooting to linux
>>>>>
>>>>> still has the settings persist?
>>>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
>>> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
>>> used by something else..
>>>
>>> Can you set a threshold in windows and see if Linux can read back that
>>> data?
>> the values in /sys/class/power_supply/jada-jada/ are zero when rebooting from Windows into Linux after enabling charge limitting in the Asus application.
>>
>> I remember my old vivobook (x86) also forgot its settings each boot, but given the nvmem cells that should not be happing here I guess. It is odd that there seems to be no collision between Windows and Linux. Maybe the Windows mechanism is doing the old trick of writing it in there every boot?
> Odd indeed.. Does it work if you reboot from Linux to Linux?
It seems not, I seem to remember testing it quite some time ago, but I 
cannot get it to remember any way, at least it is not popping up in 
sysfs, always back to 0

Kind regards,
Maud

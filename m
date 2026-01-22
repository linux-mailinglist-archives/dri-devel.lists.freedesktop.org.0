Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K+DO4D6cWmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 11:22:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605A652F0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 11:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B0A10E1F6;
	Thu, 22 Jan 2026 10:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11023120.outbound.protection.outlook.com
 [40.107.44.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4389510E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 10:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFYZxw/WjA5t/U8e4atje0viQuE8MYxMKfgZ8w9sRaK9nWLi6ZC3tIkpi1vhkEzFbGepHHY3E7Y0QggGPRfNDvLEJhTmuEIaA7NCp4us+S9OqZ/m0Gb5DK0i04Rno2LxzEc5dT4i5CfR0bpRh8x0qjTQrwXWD5mGyWNFD1kJsQi3vniuC6cMzBOq8Q9ECHDzL692j7n/tax5nEp2Q+uWixOCOwGzZ0P8DPXeINj9RwJDkV9feaYnuxBoKSJ/pIyMqKbWmjvC4726pCZKalrrXEDT8nSsWC8n4kY/O7wjG9gl4yeqyX6N3Ol4gdIov/NlmPTv2pV6eb4nXbVgHdBW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KshWMRaeKt8+Y/udjcsuhr1um7EFjxjytu7mKhSjXro=;
 b=ARMrBWye7Ph2u5i5OHvwrbeyEl3R/yKcXAv39LM+upn0OO4Q6i74oux/9Vp3PvhaeVxVl0iLPgqkDBMGL403+r7m3dJxNvFeJOmBXL5QCDnEgmC/fhTLbi24HnEbWwLsSmVtFXxuozngGA3YR+I42gmSvgLImkLGZaymoSXiJotHCc9PYYTRtKjVqyqYXvWVGGu+OUeh06LYweWDxTkCOlLxpogefGxaxO+1O4KjqkX28Qoaa94d9H92xCqRjtaDiAtCJT+8sT8Lyn0mWzTI5kwKITRGgtINJYtU2gBrq/JLwp3+H0qWptbu95j1YDbE9WoK/DMpptTTt9Z698wFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by PUZPR06MB5818.apcprd06.prod.outlook.com (2603:1096:301:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 10:22:49 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 10:22:48 +0000
Message-ID: <6825d5bf-9d99-4872-a61f-1b145bfd2efa@linumiz.com>
Date: Thu, 22 Jan 2026 11:22:00 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 3/6] drm/sun4i: Enable LVDS output on sun20i D1s/T113
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134835.447357-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20251116134835.447357-1-kuba@szczodrzynski.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::18) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|PUZPR06MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 3419be3b-e288-48af-fac7-08de59a030e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmxROEU3QmJ3T2gzeGZ3bTJCWjdzMXY3cmZ2eDQ4T0tIWGxmdFpyMU9XbUM4?=
 =?utf-8?B?bndnOSt2TEE1YU9tZ0RKK3czQzdOTTR0SjExck15cTZuM21mb1hjaS9YckN5?=
 =?utf-8?B?aWhsekhDMHArSm1heFhUTzJGWmlsM1ZqZ2JXQXlmRnAybkNJTkx6RXJwMTNX?=
 =?utf-8?B?ajVQdDJxeStCcUQ0RUdNQUhNbGdYK1djUXNBWDlZRTJLb1RZNWd0bGpNNlVs?=
 =?utf-8?B?NzJ5Y0JmVFE5WEpONXA1dytVSE1zMHVIWVN1NzcydmtkdTlKUFdKNnNTMnN6?=
 =?utf-8?B?cm1IRXVjU2Rqc3BMVzVPUFlwcm9UUHNIRWROQndkQU5OZzRNVE9yODVYWkpx?=
 =?utf-8?B?NmJnYy9rLzhmOUc0bjNCclNzbFJCeUtwUXFHeE5aTDdQMk9vRERpeTR4WUYy?=
 =?utf-8?B?dnk4aCtmOW9VcFJwVkRoZmFpUzF3c29HMnVaUEdQSFNoK2JwT05va3Jlc2wv?=
 =?utf-8?B?eUZRYzBhS1RleUdKOG10VnBEeFRIMmZoRld0T0Q1MnRycEc0OGlaTTVEOHpJ?=
 =?utf-8?B?TWdkTENCeWdKT0N2blArdUxBNWMvaUpiYTZnRXhSZWtMMUJ0dVkvV3RNTjgz?=
 =?utf-8?B?VDNJMkRnZ1JYa1pZZEZGTjF2K2JwUThkTHpLNHJCdGF5YTFMNjRtU1l4WEFO?=
 =?utf-8?B?aFljTER5aFpHZThqRkJqUGVPdjc4TXBzQWRLVCtQTHdFYmFQQ0pNYjdvSTI3?=
 =?utf-8?B?NWNFdU5IK2VvSzQ0M001eVRkT0tKenArRGI1b2tEZi9jMnhMMmNzOE03UGNU?=
 =?utf-8?B?TTdLQ0EzcXBmbk90c1pSbEdVN1h1QUVUd08zZ0NMZ1RZL3RSQTYrR09hMkVE?=
 =?utf-8?B?SUM4TTVid2VTdUFya2RNWjFsTUpGdWV6NzdISWF6STFwWWZBcnpYZjduTWdj?=
 =?utf-8?B?VEtBU1NHTVkzSUNHN01nUWljaFdHOU9KTExXODgwU0dxL2ZpOU43a0txNERE?=
 =?utf-8?B?NU0wWlVrM2dzWDVJK1hFcVc3SWc1REtScFMva2dsZTkyTmpKWnN6eUMrY3Z1?=
 =?utf-8?B?Z2tRN1QvUjdzbEt4c3dMQXlXN2d0ODdWS2d3cjNWOTZXSFBzTm90QmEzOXlN?=
 =?utf-8?B?WUs0U0Uwd0VISlVlbEJhajhReVN5alZqcVJIQm9LeVRKVnVERXpLOUdPMSt6?=
 =?utf-8?B?S25IcHFZTHl3aWRHaHNLbWQxWm81ZmlaTlg0QWRnUzVTMkhydGFwOGg5elBQ?=
 =?utf-8?B?ZWNZVmVFanlJamhndEJPTTJvZFowRmx2Qzl5ZFlZY0xpcmFYZXBmeUxTWGFE?=
 =?utf-8?B?TWhlaE9hSmdrZFNaYVNOclkrZWc3RlZkbTB5aEw4STNCYXdCUmNDZHJLb0sx?=
 =?utf-8?B?ZXRXYW9mc3NqVld1V2lWVE1nVXZDaFpNQ05GTitpNDBFQTQ0TzdSOFcxWGJX?=
 =?utf-8?B?MmJxc040am9RNnBiZkRpeEQ1SFpaNDNCWUlNNkVhYiszQ0pNQzdITXJ3TG5J?=
 =?utf-8?B?Q0k4d1ZaSkVPVmpNWUF5Vzk0eC9EL0EyU3hONjVQVmdGa0VYR0NKaG9OYThy?=
 =?utf-8?B?cmcvZFBYQWpwVU56ZkJtTUtOSWRhS3hMZTlTUjNwRDk5clpzbU45VkxOcmlU?=
 =?utf-8?B?a0E0RXZVWFcxOEFCN2tDU0lrd0FDZ015RXJrYndBMXF1Y2VTQTR2QTBzdmVP?=
 =?utf-8?B?TDFhbUVEM1pseVpOa0pyNnBKZkk2VHd4czgzbTNLRlpLM3hoUDduMnJMQTlP?=
 =?utf-8?B?ZlZtWGtPa2Jic1MzUHpocE1rZVhKUWpXZWhSYTdJR0c3aUhvRllvdy82RHYz?=
 =?utf-8?B?NWRNQUZYbGJHdEdiVkdmODU1aUxwSUUweG1pZGFhM01Yd2k3MXorUVc0SlZO?=
 =?utf-8?B?TE9hQmVFNlZVanFHMVNUN2U3MmhJQThaQVM3SDNVa24rQUpRYnZUSUNjcG12?=
 =?utf-8?B?VTZtaWlDWEtHSFFMTk5CWDd2N04rdGkrRWlXK2J2cjBoTzExWnV1dXJsRmF6?=
 =?utf-8?B?eE9tV2ZCM3NuTjZUK3pOSVdSSzdkM2ZqbDNDazBrR3dlWGFqemVCWHhib2Iv?=
 =?utf-8?B?MmJmZW9xUnVyQ1pYRk9DVzdqZXZqV0txT0Q2MnROeUx4SlNNZEtwb2lYZ1Rr?=
 =?utf-8?B?MU1HT2pzeDNzVHJBTGJXNTJmcXo0SE1nMFBDdVZVVDU2ZEs4cjV3Rkd1aFpJ?=
 =?utf-8?B?dVBMNElvVjNMMFFuWUhCNlAxdGFkdzlaSEt5MlVBYmc3SHZvSEVHMGdlc2pm?=
 =?utf-8?B?NGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC9vaW04WjY0VVJ2WGJyeDNkN3VTRGFxUjJ5dG9zNk9uTTJucDVOdUlWa1Jm?=
 =?utf-8?B?SWVLNlRTQ1c2bU1XaUE3MEZ1cjVISVpiRWdVblhYOEh2Q0RxYW9xNmdHSzZ0?=
 =?utf-8?B?NU94SmlmWHp2SnN4YUxQeG5lSWdWSW1ha092eDcrUTVvNmVNVWdlT0R2aGkz?=
 =?utf-8?B?M3hPOUVUdE1nMjArMTJIZDBwZEJ3T0lOTm5mcTZMSHhlL2lxRnhxTXY2Z3Zi?=
 =?utf-8?B?T3ZKemRtcEpnT0ZKM0RpVmhaRHZtc3NWelBLQjBMNjdVZnl1bHJ0bzFXcjJu?=
 =?utf-8?B?dklBSkx5cHFIQTA4SkhQMWdJMnZzR25yb0dPcXh3blBTZzZrdDk5OGVHaG4r?=
 =?utf-8?B?QTZTa1JyS1JTZGdLeEZzZjUwcVBYSHNqc0RVVmtLaEcxMEh2aUxzSWtnTTR1?=
 =?utf-8?B?Z0s1eDViV1lhaUl4UFVlOFNYV2o1SWF1QkRiWXF1NlJ3ei9oWDZudnhvTzFF?=
 =?utf-8?B?eHVoZ2JZano2V2dvbzI1KzhGR3ZyZ3NFWmNCWld0aTJXWUFtbVNqNi9jaXUx?=
 =?utf-8?B?a3dOZmJTbUZMS2NiczVFemRKYnRxeFp5L2hHSTI3UHBMbjR6b210dlBTdEhq?=
 =?utf-8?B?Zit2UWFEWFFoTDJzb0ZWYUR0UDBIczFsQ1VPSVJDeXJmbHc0SFhXZGx1Z3lw?=
 =?utf-8?B?Unk1Z2JONnNXTThNT3k4UmFEUjBSWlYrL0YrU2JITXdoMCtJb0xlWWdWd25F?=
 =?utf-8?B?ajhPcmxETG45Y2VEemdnTjJ3RU44eGZxK0Z4SnBmZUJhTVRUTTBpY1NZdUFB?=
 =?utf-8?B?Mjl1WTF0em54WTZhckNneUYvQ1pkM1NZYnlKSkZlaWhvNXJsODc0L2t4eWlo?=
 =?utf-8?B?WTd0S0VLaEZSS0hVRUtpNjhpV1ZtWjNpNGJleXh5TGVOYUZVU280QjY5dW9R?=
 =?utf-8?B?bXBvSE1Nb0JVQ0NlTzQ4TzA0MklLMUdnWEVkUGtiOWdGdHE2S2gwUTdXbHVq?=
 =?utf-8?B?eUNaWi9naVd6UTBLSjdzTXRDSFFEMGVxTlNGM1ozYW9VdmEyNjNMT240VDUz?=
 =?utf-8?B?U0o5aGI3T3I5bEFoL3k1TkpkQ25paDdMUVBidXJEU2pYS0c4MWZnTVBad0dz?=
 =?utf-8?B?a0VlWjZzVEFjeW5YbTBBYnJ3d1Zya2xsVTIzd1lVZGlnT0hYc1VxVFhOdk5B?=
 =?utf-8?B?dlA1WW9CMEZLMGZHRWt2aDBUOFluTTlOeTN5TFB1Y3NoVElBVUYzUEllZm40?=
 =?utf-8?B?YWdOMTZEU0FQZ2gyVy92OFpBTnkxbHU2a3llMTNQSzVHSllKT3ArcURuME5p?=
 =?utf-8?B?MG5JVFh4ZFgwK1RLUGlVT05rVk1XMFN5RlZHbXl0N2RJSWxDNzhQalk3cDdT?=
 =?utf-8?B?QU9LK3BzdDVFV3E2bE1ybHJyRUNBSGN1QWpWK0xxdExVYml6RUg4WDgzcTh1?=
 =?utf-8?B?VXVDWmZKbTdWRzA1QUM1UWFhN0Q1bmt0eDg4WUdqN2VaQ3VIeVN5ZmtvSHN5?=
 =?utf-8?B?SmE1K3dGSytocmVrSkp1Z2s4aTVSL01MZVREMjM5WVk5TDI0S1czVjlsQ0dL?=
 =?utf-8?B?TkRMS0lCbkc4aVJvZm5kaUE4d1A2bXBDVXBMdk5jNnlUUWEzOHoxQ2lzTCsw?=
 =?utf-8?B?T1ZQUXRsWjA5MTRURzlyb2lIZFVCdnd1OWhwWHdnVExsWVhBQ1ZtbHZEUzZI?=
 =?utf-8?B?UkgrbjZ1b2NuV2EzaHZTYmY0cGxPb0xXc0hpK2lKZDhMTDFnQURrN1ZxV2pS?=
 =?utf-8?B?VitjU2g1OG42UkR3a2hyMk5LRWczR2E4dXF2K1laT2Z1Z255K1U1RTJtOThF?=
 =?utf-8?B?eUlUNVZYVGtnVWU0SkxaYUJQQXRveFloaDE4YUNSMTV4MGRJSy80V0poM1gv?=
 =?utf-8?B?bStuVDJPRTVCQXAvWWlNTjl1R1VseGM2bFZBYUlZNXM5eGUyVlhNNG1YUWNO?=
 =?utf-8?B?aW1OcHRqK2tSYlpwUWlKWnhLanlIT2N5VlhyeTdjYm1EeU1lU1oxRDFjZWU0?=
 =?utf-8?B?YWY2RXRSOFZzSUYzYTNyZ05odlBxZHlxZzVvSDFqU3hJcDBZZ2JZa3k4OVlz?=
 =?utf-8?B?NWVYUWU1R25HUVR1SUVub3RkZUFIZEdNbEhxTHFPRWJJUEtyeUw1b2dxSVA3?=
 =?utf-8?B?VWhWdFU2ZUFLZCt5VmtsMCtVN1d5dmtpV2VXeG94VnR0dTRMUGlaWWluUHZN?=
 =?utf-8?B?T0U4eXhkUTdtWVdkN2EzYkRzYllLWEoxRG9yQmt0SWNqZ3JjRlQzREVFQnlz?=
 =?utf-8?B?TTBRUXlGVTY1MGRXaVFqYUhiMWU3ZlloNlRrMmNLSFJHYWNKOUpVUkMyR0Za?=
 =?utf-8?B?bGl2dVFFcm1ZQk1NODBIa09CZ0pVcTdiQXlIdXJlY1JjN3NwZUxyMFNsUGI0?=
 =?utf-8?B?SktkOVBleDB0T3lEaG9ZR25NZFAyS2J3c1NqV0tmbXU0WEZORjM2Zz09?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3419be3b-e288-48af-fac7-08de59a030e6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:22:48.5002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2T7vThY1pr01On0i0AerlcY4QetCgDh68Fu6X/29sckFhN6OJotHFUBG+GT31gVjzjvJCC/h0iT7/LX32mq4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5818
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:parthiban@linumiz.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:paulk@sys-base.io,m:kuba@szczodrzynski.pl,m:mripard@kernel.org,m:samuel@sholland.org,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linumiz.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[parthiban@linumiz.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[szczodrzynski.pl,kernel.org,sholland.org,csie.org,gmail.com,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[parthiban@linumiz.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linumiz.com,gmail.com,ffwll.ch,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,sys-base.io];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linumiz.com:mid]
X-Rspamd-Queue-Id: 6605A652F0
X-Rspamd-Action: no action

Dear Kuba,

On 11/16/25 2:48 PM, Kuba Szczodrzyński wrote:
> +static void sun20i_tcon_setup_lvds_dphy(struct sun4i_tcon *tcon,
> +					const struct drm_encoder *encoder)
> +{
> +	union phy_configure_opts opts = { };
> +
> +	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
> +		return;
> +
> +	if (phy_init(tcon->dphy))
> +		return;
> +
> +	if (phy_set_mode(tcon->dphy, PHY_MODE_LVDS))

From Documentation/driver-api/phy/phy.rst, set_mode shall be after power_on. But re-order
will fail to work for our case. Not sure if this is fine.

Thanks,
Parthiban

> +		return;
> +
> +	if (phy_configure(tcon->dphy, &opts))
> +		return;
> +
> +	if (phy_power_on(tcon->dphy))
> +		return;



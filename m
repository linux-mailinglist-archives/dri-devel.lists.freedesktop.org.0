Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51FEC3A2E8
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD4510E87F;
	Thu,  6 Nov 2025 10:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="MBlEs7pm";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="fj7s2pSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF11D10E880
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:19:37 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A66w7EH879402; Thu, 6 Nov 2025 10:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=4+1n0rlJ5mGyrlmtxpj2v1sYg
 sP+OaydnFKuxJxEr6E=; b=MBlEs7pmIpaNo7jS/4ZOIXZffCeVKl8yU2Hxpt1Zk
 7tHa64BK0EYHV7tE7VJYgcyD08GF9PKq/YaOW2g3n2zcuapyln7FClauSDKT8tgz
 OUMbFMiMC72+DvMnFXjJL/BB2docnlF8hAfrGKXGZqnCug8qzOyLxxK+3qluMay0
 wrRBRZx5/UIijBx9XJFVZnYwoln8HmqUroXinZHUa4GbX7Cv3PyPZjvQjCkCa3sS
 8JBgJBbY6FMDduefBs9LjDYBsLW3Li0vPUlPKUtzLOIxyhjR7QQ07oVOrsr5Whzm
 vrMPG54ulCRTEJ77wr0Ap6TPfOvMoc3T7NayZOljc+uKg==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020100.outbound.protection.outlook.com [52.101.196.100])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a7w9cs66b-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 06 Nov 2025 10:19:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVPi+aka+neQLgP3g9opcTe2f6YV2EH5/GxGa2jXTHytpGlTbJsgaKLiDJOuBmI7q+42Lf+eb4Szlp1o2so/Og6oUlcsPgZNpcBy8WL+c2SWjUKivZDPkpkuD/J2YwRj4M7qpI7J7LH41vyKHc1woKQxDMUgUvPu0qjM5efnGG23PcK5UzkvWvTsP2kRkCBGNiclIvyennwblP21f8hnQjw0F0jfk6YpQ6kXfk4D19KrGZRIekwKxsmrsN08RsV43rDDgtRFVSOIxtQjk9o73KpxrS23Kq/5SiBm8zNGoIJa9bc1tJ51gp8Ex2GZdV1upWGbzJhzik3NrbR+k7UzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+1n0rlJ5mGyrlmtxpj2v1sYgsP+OaydnFKuxJxEr6E=;
 b=EpJsz8t+7wBfY9+3Pu98W/jovhpdgVbpacGYqhAV8i9wC4SDo7zyVvH2NX3wNUSIEglodY7anXCzKBWvMmzrFiE+IzWmANGa05beautHfcyL2O/cOFzfydaVaXL4Kl/ZWAK4N5ovhtsD56ONH6sEtESWNCiZZgmCKqLIO59Vyrh+SXCan+CPYiLOnL860g/8XH4wiGrZSJWoWPCWii8NRGqcFpkBqeIwfFEeaMgGSvVTizc3PNLLJyFJZG3d39G9RmEJKsBNH6f6bTGne8jktNysovfeGvKq2WxB8mbnAbVV4EuX38mE6alHXepreLHoXbbTcEeuLHBYCbw4VLmrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+1n0rlJ5mGyrlmtxpj2v1sYgsP+OaydnFKuxJxEr6E=;
 b=fj7s2pSuVNn56Yxg8b/kB5VLT6cOjEbaAghordSsYnm7IjnEOX6J78FUCC91xS6mZHTtuuQqOTbQW+ZepyWC5kXMdvHoxJKsEzLybZEWutfyV6uiJF9t5JNa9rUahcAlvS7oqodUL9qCKfBJjqljEFcRbxjrmcm1ThwZjHi7zN4=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO6P265MB7231.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:347::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 10:19:14 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 10:19:14 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
 <niklas.soderlund+renesas@ragnatech.se>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring
 <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
Thread-Topic: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
Thread-Index: AQHcTwbMkaKZXEyi40emgNXDXGZPcQ==
Date: Thu, 6 Nov 2025 10:19:13 +0000
Message-ID: <c1c5a3ee-f5c9-46e4-8095-104d25d4621c@imgtec.com>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO6P265MB7231:EE_
x-ms-office365-filtering-correlation-id: 9b180bb9-d55b-4fd5-986e-08de1d1def4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?M0dsZHZFSVlBTi8zUWxBSUszUUZicGZUdGxBVHJnYUJRNW1XOFM3eFpsLy93?=
 =?utf-8?B?WkN5VkFyM3NvNFF2dGR1NmEySWRGZGhyaHdSNXQ5S1E0Rk03U3RpUkN3c0xO?=
 =?utf-8?B?aXQ3dDlvWER3U1ZHNEZqSTA2UXlnb0xCbEorNm5xOU5neGRyRlI0VlVCeTNK?=
 =?utf-8?B?Z1NXYzBBbUM3dDZpcmdNOVhLL0lKcFZMWEZ4dFI2WnppZG52dmluam8vY1Bw?=
 =?utf-8?B?N0FiRzZ6QS9wamZhUSs2Slo1bTU3Q1Nhc1NtT0FoWGFyMmhEc0IwTnViR3FT?=
 =?utf-8?B?NHZSbDgyM1dMclA5MGw3cmd5ZUV1MmNyaVNEOHkxbXVGTXpKb1k0cEgydVdN?=
 =?utf-8?B?OWhWWmVYUndSLzVsak5LRnhUQ3huZjRsaHJZSWlKZ2E4SVZGYVd0aWZBWDJ2?=
 =?utf-8?B?WDNKNWg4L2hPVytDSWhqRXdVQmpJZTZ0N25ua1VwQTRLTkhoTENCeDREQkwr?=
 =?utf-8?B?MFg5OHNWcFVvcTlzNDJmK2xSUU1qZk1HWHJRZS9RM3ppc2tIc0NRSTA2aWQ4?=
 =?utf-8?B?OXV4bFZDUHhYKzR6aWhqNmh3eWZZWXAyY3ZBRFFYdnpxNkJwOUc5VTdieFh1?=
 =?utf-8?B?RG02OFlubnZjcmF2WUtvdkxTN3lwa3Z2a1JyRnByc1RCcjJQOTA3c0kzbHZ3?=
 =?utf-8?B?MGpHZk1USTNsOVZjUXZqQnQ2bUlGemV0Zi9tT0pmZXp5K3Q5SkFwNUdlNnF0?=
 =?utf-8?B?emE5aUg3dUlDWVMrM1ZTaFVsUG0zbzJNRlRXbmtxdXB1L2NJVWdoUm1aY1VH?=
 =?utf-8?B?cXdkbzNkWHQxWjBrY0YwRXAyYUY3d0grZjlFdnlhWnY4OWh2dHNmUEtUcWFq?=
 =?utf-8?B?eXh5OTVhTDk5VDFkTlZMOU4vaGdUaWNmM1l1MGxFN0pUN2hYRGFaeXpPMzFm?=
 =?utf-8?B?ZkRqY2RuYWpoVVBPSnNtVjN5M0VPWFlzN2VtRk81UTZuU0RGbVpSaHJMcUV3?=
 =?utf-8?B?Y1V6TTlSeUxIU1VpSjFmSHlSVW8vR3JRZzRYekxxNU9GckpjbjhXWkVZQW1i?=
 =?utf-8?B?c1J3STIxcGpMUW55Y3dhTlRpMmozUGtGVE04Z3JoM3lKUzJOc1A4NEZaV2lD?=
 =?utf-8?B?ZVJ6UmpmNzJqZTZmRUVkN3lTcGZGcW1GWWwvemQxWG9ZYlVReGRYY2xGWWRQ?=
 =?utf-8?B?dFdURzJnK0lvc1h6T291ODh1V2NkUXVoeTNjR2NlanJBcUVKcmVqMVFZU3FK?=
 =?utf-8?B?MHRKbUhGWGRGTkZ2Zi9jdmRaeTVybHl6VFMwa2ZVeFg4T3hObVJHVXQxNU5J?=
 =?utf-8?B?cVNrZGJTR29mc2RPYVY1TUJrQVYzZGpZSkJaMmxSc2ROdEttZk1TdFVoRTBP?=
 =?utf-8?B?bHRYcW84MGlmQnJMUVllRkVzM3JGTFhiZUIzT09hekd6UjJHamdzYzRXVG0y?=
 =?utf-8?B?ZU43czltdWREeWRVWHRJdWZ4WVZpZ2QyeUIydTkzc3VYWkc5SlM3ajRuQ25h?=
 =?utf-8?B?UUVVak1TU2YwRERYTlo3SllYcVVUNEoycjhwVm9lYXg0bTNPQU1telVyWVpL?=
 =?utf-8?B?Y1dWRTVtNHQwSDM0RXRya0FscUwxMUVEbVdNeFBrREo4anRkZUVUcEpXSVhn?=
 =?utf-8?B?dWFiemNxRUcwMW5VVytneFF2RTNHaWF4aTNMdTI4QUtWRjd2dDMvTFlZMjg0?=
 =?utf-8?B?MldFbUx3K0ZHK0JRY1orbjdFTTJIeUtDaWQrV0x6ZUgzQVg1c0hzQW1oTHlF?=
 =?utf-8?B?SGJPMU0xd05lQWV5K0tHTXJ4S2FvOHBvQS9wZ2hvcE8yQVB6Z1d4dVVMWUY2?=
 =?utf-8?B?L2VwcjlRQlR1dWhma1B3S0VGVXBSYzFlTEJkTmZjTHE5ZSsrRHZVWmRqTEFD?=
 =?utf-8?B?bTdEM25QOS9yYUVodmhPdm4zNTVoNk5DeVNEZGhzVE1nZ3JxbFlYdDR2SmFL?=
 =?utf-8?B?Z1Jwa0pITkNrVndRTHdjNFVFb2Z5YzhWUzZEMzlnb2crcGhzNFBpcHFYV2px?=
 =?utf-8?B?dWFoZFU0eks2bFpZNmNuTEFtMjlqbXAwVGZ6OGQ4RXJzK3NFNjhvNVU4OHgz?=
 =?utf-8?B?WUFLakhteVBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDZJd0NpK0ZlSjFCcEtBWVdnNTFvUDdVU2FGU3dDbEdCUTlUbE81dmQvVXlR?=
 =?utf-8?B?cmdQKytqVkl2aFpLS0hqbWdLYkYzSmtBbXF2Y3V2dERYYzJCbnNZNjVOb2Jz?=
 =?utf-8?B?dU5KZUwzRGRpYkRmU0NNV0tYcWtXNDhMR2o3dVpiNENSVHdrMkpGT1dzdThT?=
 =?utf-8?B?aXV5ZHdDVGdMV0tQOFBiQjBxNEJHVFg2UXViMHppUUxhU0VjRGUyMCtqaDNh?=
 =?utf-8?B?UUdmSHdIVGoxbUVtdWx4cDZOdHRZNWhDc2NoMXk2bXlqRXpidXBMc1RDTEx3?=
 =?utf-8?B?ZlE2S3RManFJbzZXVnUwSEpCKzhPbnhOK2VaaVh5a1VFclE1NUY3b0RaSUdD?=
 =?utf-8?B?M28rdTluSmxwSG56VVFhM08zd0ViNmtTOXIrSjBwMmZrWTVsZWwrQzdzaThw?=
 =?utf-8?B?M1dLTkpSWi9nU2Q4T3UrNnVrVHV0UTVRZ1VUT1pENHNGRDNlWlZJQ3RKdjAr?=
 =?utf-8?B?Z095SlRnVjN1aVZNTnA3b3B1RllqSXBmRksvOTF1UW55VldMdUZzejg5endX?=
 =?utf-8?B?K3M0Vm1HUWtvaXJHeTI4Y1QvS3RuQlIvdHNYSTdMRjJNZnU5QkF6eU0waHVx?=
 =?utf-8?B?cUVHbit1c1dNdGcwVDdtemF4T2RvcnpnbWVpTjF2MFBRN3NONC93bndnaUdl?=
 =?utf-8?B?bUF5TnNHOXpwYmhWTUFPL2ptemd2ZEhSaUl3Z0RkVUFrNEJZRVQxc09KcUVM?=
 =?utf-8?B?K1prMnZCM1ZVbzZiYW9UWlN1LzAzbldPejRJMVlpVnR2RVpKaS9adldQRXlq?=
 =?utf-8?B?a3dMRExVazNYZXBUODlDakNCMTJoWGNLUmtiY09CK3ViRU5XVW9jVGZQUkhE?=
 =?utf-8?B?bFBDUEtCeXQ4QllyRHNiYkxqa1lIZHpoaU1id295cTdzWUk5RDZXV0RibzNT?=
 =?utf-8?B?SktvZ0dRSTNWNiswQ2VTMm1mbHR5azArY0FIRzk1NHlFQmlHNkR4c3NFUWhk?=
 =?utf-8?B?QkZNMXEyZEhINERZWFRqSVFndHloUnpaWjg5bi9zZzU2Z1dDb0FmMVFja3hC?=
 =?utf-8?B?WU9tL0U4RHg3UTh4bzlHMHRNaU8zU3JnMkNlZGVxOXlFY0hFUzhscDdpMEh5?=
 =?utf-8?B?ZnVLSWdCRjdYQkJqUnY0QU1iUWV2MXgrQURqUzJ1eGlwZlhQNkFRYThpUVds?=
 =?utf-8?B?SEJEMXNMWkpzVjlNOXRtL0RtTTNrM3hzd3U1YitJT3dRYk0yalV0RlFmclFZ?=
 =?utf-8?B?MTNvSCtTL3IyYXpNUjFjOTBGOFlGZ3pUd0IwUzFIOWFlMlN5MEljamVkcThh?=
 =?utf-8?B?SDU0NnBtMmtaVVZYMlE4REdmR0k4M3NnSktTNytwT0pvd2MyVVl4NmdWWkJF?=
 =?utf-8?B?TXI1RHlwdFE4bDB4dnRpeldMM1AreVlvSEVpVXp2T1V3U2pyOGxvdzdxRXZy?=
 =?utf-8?B?b2tiZ05iZzdDTFI0TjkwVytpY3BsekFOUVhXd3IrU3VpNUVSWitPRGZPNVhp?=
 =?utf-8?B?cElZQ2hyNGx2STdHVVdJWWVocGpKYlZMWkpmeEtzb0p2VVh4akNHYkxpNVRF?=
 =?utf-8?B?dUUxaE1ndVBsQTNERGZJcWZGYjJpL3BtWlVaRHVCODJaemhvUXNLVnhRT254?=
 =?utf-8?B?RnY3bFNpMDlMUlBhQUl3aEU0S2dNWVg1NTFQVWZIaEJnSVNFcWpSSmpFamRF?=
 =?utf-8?B?SjNmVUM0WkV2SkJhSER6aWovbm41S3RvYTZoNzdNb0d5R3lQVHBpZWpHb3ZT?=
 =?utf-8?B?N3VheUZIcmgvSXlLOUt1cVNHa3VxeUxEd2I5QnFMTnBabGxvRHd5M2pwREpK?=
 =?utf-8?B?bm5laXFic0VjUm02dW1Hb3MzVk1SVm9tNWRSdlFkaGk1N3NTVjlBRXZseGlk?=
 =?utf-8?B?MzYwTTYxbG1rSXVVelZXMzQ2WTh1WUtuUGJmQ0h4bExXSVRSRXA0ZXphSjN5?=
 =?utf-8?B?ZXBKdmc4eWF1K2I1bStUQWdZNHk4SlQreXlWYTNoTEtVbkh1Z29BUzNBa0Z5?=
 =?utf-8?B?eXY4a2dCdkp6ZUpWY0ZXQUQrRUJ6bGo4UVBUZjM3bGVWZVZnOHZzODN0eWZL?=
 =?utf-8?B?V2h2dG1ZVXZHcGUyMmkzdWdHNkhXOXkwQ2QrZEVXdWE4OFBtV3lETVJ1T3cz?=
 =?utf-8?B?emZoS053bXRER1dyMC9Md1M0eEdvK2tnOVhDU3cyRHRVempac0hMTTVPT1JH?=
 =?utf-8?B?WTl4dm05dlNURTJMZTQrZytUalA0RWpRU01YVE5pNjdBaWNaMkJHNHBNYTlR?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GUuZRyuOwvnp67eVKc0Oa0ce"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b180bb9-d55b-4fd5-986e-08de1d1def4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 10:19:13.8951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7xNpkqYS6Ua99AYFtmImIKVyKQZ6e5duEDHQ3fXkEeWCg4dqyIVYqlsYHBO5NHD7NI4EjHwnI3nTV8ZVLgNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7231
X-Authority-Analysis: v=2.4 cv=bbZmkePB c=1 sm=1 tr=0 ts=690c7626 cx=c_pps
 a=nbtYJZzcFMt4lBPRWcvQ/Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8
 a=r_1tXGB3AAAA:8 a=bJMKBFi9lNTxCnde3t4A:9 a=QEXdDO2ut3YA:10
 a=UlACQ9sh6NrYMOnicBoA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA4MCBTYWx0ZWRfX17ziAhmBXWEF
 zEVgv7fesHDGHZ9vE7Z7uqRBUmWy1WsyKL4q/6v8e518LJp45luw4fBa6VMHgejwUWakd1kp6i0
 RDTIn+phZvtDDslq7VOpKkoI/gO+JEh4kb9xgF9Nxv45C2a17XZgcYbT/xlg1OcjwEy8iqlAgQy
 MwRDl1iW6AlyhL0lfvpOtyYpB0RevvGk0lmLNtZfEQwhpt34mhrzRUxMWNanRHNA6fVfoz1K0yA
 KSeewM5JClaCVfc+mDDcsLn5tGsnFsnmQnuZPZBudVKEsEKyiBlL7dyIcKtbDlUoXCU3aQfANzW
 UTAbffoZ7tXs+AzqkqRyI/Xsrpp/DeB365EMs0Z+LDxG3woEp9ax6mYiqLuqrXRZ34kO1+Jn4e2
 1qsbLUIrF3K8wANysHYqOx/Iz3K4+A==
X-Proofpoint-ORIG-GUID: FBJvQ8x6NmmRL5-LSJTAcsHZkYJaL8V7
X-Proofpoint-GUID: FBJvQ8x6NmmRL5-LSJTAcsHZkYJaL8V7
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

--------------GUuZRyuOwvnp67eVKc0Oa0ce
Content-Type: multipart/mixed; boundary="------------P50fraVSnvi5b9gI05nsMvT0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <c1c5a3ee-f5c9-46e4-8095-104d25d4621c@imgtec.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>

--------------P50fraVSnvi5b9gI05nsMvT0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On 05/11/2025 23:27, Niklas S=C3=B6derlund wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a779a0.dtsi
> index b08865841476..aa347b699340 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -338,6 +338,23 @@ cmt3: timer@e6148000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gsx: gsx@fd000000 {

Why gsx? Marek's equivalent patch for r8a77965-gpu[1] used gpu (as we do
for every dt so far).

> +			compatible =3D "renesas,r8a779a0-gpu",
> +				     "img,img-ge7800",
> +				     "img,img-rogue";
> +			reg =3D <0 0xfd000000 0 0x40000>;
> +			interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R8A779A0_CLK_ZG>,
> +				 <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
> +				 <&cpg CPG_MOD 0>;

I don't have access to a TRM for V3U (it's too new apparently, despite
already being obsolete), but I believe the GPU integration should be
similar to the M3N in [1]. In that case, the TRM (v2.40, fig 23.3) shows
S2D1 and 112 in place of S3D1 and 0 =E2=80=93 are these definitely correc=
t? The
0 especially feels wrong (see also 8A.2.1.2 MSTPSR1).

> +			clock-names =3D "core", "mem", "sys";
> +			power-domains =3D <&sysc R8A779A0_PD_3DG_A>,
> +					<&sysc R8A779A0_PD_3DG_B>;
> +			power-domain-names =3D "a", "b";
> +			resets =3D <&cpg 0>;

Same 0 concern as above.

Cheers,
Matt

[1]: https://lore.kernel.org/r/20251104135716.12497-3-marek.vasut+renesas=
@mailbox.org/

> +			status =3D "disabled";
> +		};
> +
>  		cpg: clock-controller@e6150000 {
>  			compatible =3D "renesas,r8a779a0-cpg-mssr";
>  			reg =3D <0 0xe6150000 0 0x4000>;

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------P50fraVSnvi5b9gI05nsMvT0--

--------------GUuZRyuOwvnp67eVKc0Oa0ce
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQx2IQUDAAAAAAAKCRB5vBnz2d5qsGfZ
APwK3Uqzdox+uVIqS5xxaX0pBX9te6Xx1zYSHM6ncdDhYAEApYyL8JWJD/4WdoiNTU5A0g0NkJSG
8OWiMM/NE6DlHQ4=
=8RGz
-----END PGP SIGNATURE-----

--------------GUuZRyuOwvnp67eVKc0Oa0ce--

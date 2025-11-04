Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7279C316D3
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B102810E60C;
	Tue,  4 Nov 2025 14:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="SnqJPo2N";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="MeqcWroa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B3310E60C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:09:57 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A46iF7A3770398; Tue, 4 Nov 2025 14:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=ktbCjfJxSFuX98Rg6TBPUkvZf
 uyF0U0ayn8BZY187KM=; b=SnqJPo2NI8ORu2Im+1cwb26yG7j3858MZQnK2PDt8
 CMwiMs0+QAg4buKt40TYDLzgmdZhY3ZI365m6T2S8VqtAL4NQ210WsNHZDZkCeAi
 MCEbH3PyjxHJcx4zyEh8P+DRsOmLtxf5mJK59iKBSF2gxrnYwoGiOQqHRX15znQI
 YXkEnx3e5u8+8mDl3v+eC5LCE0YMLfvmIWs5QI1/ilD22xBpw4OIckVyg7+b6nOk
 5H2H+K7pCHESv6ChhwKnqEndpAxhlQscTHtJoNL+qKRwWzsNwuB/lkNu0uIWNIQp
 OFu6pDjYOoCQc7ZYvgWUtLOMYLxQPx3DjLpVuciLEcE9g==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021097.outbound.protection.outlook.com [52.101.100.97])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a59bst1fp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 14:09:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge2jjSUz4gEOe00LHhGr4qn2YQcd+GhaKpEBik+JMGRMEUcQ2DBbgs9+t4OdY5CDMBtCjLMOy1xU25H2SVDrJTh8xCMD4WxhV14u+9XCs2hBl4gSWY+SiRRtOu7uuF9le3h60HH1FCVNvIUOlkMQZa30IIydMYiheqiU2UcX5j9aQgYQg4u+Z6j9ZUrkekn8+Ir4FYkgzEdkEVcbaFu+lEi572jXOIcZ4I6TTCgdHCmFz0kR1zLZH0uSFaTz3Cixxv0tCjvO/EF+Q9+Fm8s90mex9kftU0RSDRhVfd1f/9EWQ/0c39yeOg6d/13OpQ3uq8UXFmzpJotXZWGPa+mXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktbCjfJxSFuX98Rg6TBPUkvZfuyF0U0ayn8BZY187KM=;
 b=pbVBLl+ntd/0tqCoWrMxbCSs3f6wa9XVTY/YMcMfXqHrXpS40prTiQNrhnZVl4RgrvHrJb3Kr1/mzh0A2ggZuu4FVEQaz3BAdL3SpppE0v4LTWB3UO7y0Mjz1oC++PRE6plm/m55zMNGzdT8MlCkxVKf52By2MWnizoJy49UKbg5751JfErmQ0cbRQcs6sR05i9fLOnZy7F2JMEalQHpGHCiogffmKiiETK014Kt1tXbLFqAp/D4mq388uItE8eZsx2M6mFPH4OUc2z2ExnuCJvFU3vprlSXEM1wQPyCPaxYUJ8LqIFFsqRrXoMZ6Ls5hdRtGP98g+G7CoveFkTAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktbCjfJxSFuX98Rg6TBPUkvZfuyF0U0ayn8BZY187KM=;
 b=MeqcWroaCxYlBhVnN97yk9/6Xm8ncBxznjXQWpkbXMZVaZs7Uj6jgWIIuQFXk4uSCsrAipnyFU/ZvWzC5M83XLBwnt1RJhHO8ZipmNjMiDw/Aqjj3mwYh4yPf4B1crE07I29gNUFQa2p2tPtExTbUWfy2n1Z7Fvu5pk0hCdCCsw=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB3668.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 14:09:44 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 14:09:44 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Rob
 Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
Thread-Topic: [PATCH v2 3/3] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
Thread-Index: AQHcTZSrLdIRXgAp8k6fWAp05Oldxg==
Date: Tue, 4 Nov 2025 14:09:44 +0000
Message-ID: <792e9df2-4f19-4a44-8c1f-014fd4ac18e4@imgtec.com>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-3-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB3668:EE_
x-ms-office365-filtering-correlation-id: fa68d3e1-733f-4050-638b-08de1babce58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ak1xQkJFOVJzQ01sRWZTb3R5RlFYZ3dFbFBsV2FZUndoVXVpZ0ZjOTByMlFD?=
 =?utf-8?B?aHRteDNrcTVkTHY0Y2Y5NGRodGRJWGtxVGlnRGJvdHNLaU9VM21KUmVJZXpz?=
 =?utf-8?B?eElDMFRNYUNheEFwR1ZTTElacENoWHZWRkIyeTI2K1BSWlQxRk05QmxrK1Vn?=
 =?utf-8?B?UmQ2d3VIMUxLUmxkSXovN1RJZjVISDlSRHRITC8wYkhFMyt1Vm93eldpTUZr?=
 =?utf-8?B?UUJMU2hWUWsvRjlURHNPVEROT2xrOTlwMm43WDNHVXdCRUFRVklBQ3UrK2dM?=
 =?utf-8?B?L3JDVDdHSHdKbGh5TExCSHg0Y0UvMXRPS1hiYkw5clpxdWMxaE1CRldkMGFW?=
 =?utf-8?B?azdRb01hdjlOVHFiajVHVnY1QUVWd0JpckFsa21GOXRyR0ttNW5uSDB6eWQ2?=
 =?utf-8?B?SFFRY1I3NGl6MmVUUW5BWW54ZGxRTkZnczRQYWVSOVM1bTRHekk0VnlvQWoz?=
 =?utf-8?B?UmRjM2tRK3NlZmQvVThqQWVQVElpN1IvM2lKc0ZianNOOUZ6d1I2RUMrTDBs?=
 =?utf-8?B?WTY4T3A1UnFOd0FXTlVGNmp5N3duUXZ5VER3bU5JbEZIUTdia3F4Ymk0SCs5?=
 =?utf-8?B?NE1LYjBBbFBWbzZxRExMWm93SWFDQkVaazREamZrcTRldlJONmx4bEtmelpE?=
 =?utf-8?B?eUJaaUhzOHY4ZzU4YXUvS2dacHBmV3NTVmRUbGJKRWNhcDhLb2paa0xDYVU3?=
 =?utf-8?B?Um5uZXNhRnFXUnhVNFNTZkVrUzcvV3A4SWxzZUtMNWZqalhWa2ZIWmdSaGlK?=
 =?utf-8?B?Z2VIalpRWGtzZ3hRNUowbkRtU0VyTTQ4V0tKV2pZSzNQM3BVVFVLaXBEWWQx?=
 =?utf-8?B?aHplVEJSSDRVWGkvYm43cGVGQk84dUhUNTIrZnowTzdJZnBQaWpaZXRqOFZF?=
 =?utf-8?B?QklwNGtXUHBuUHpoQldLYkJ3UFBtUVprTnFZNi8zaENrM3o5YkovRjBub2lH?=
 =?utf-8?B?VzBNeHV6UEtoVzBzTHFnOEg0NTRINWlXWTM1WnZBZmRZUUhLT0c3eVgwR3V0?=
 =?utf-8?B?S09sR3B2akY2TGV5OE9jT0lHNjA1TFdWZnZaZEdnQmFSQjJKblFiaHFTN3Jt?=
 =?utf-8?B?WWkrMTVoUzhWVnBxMFlzRUZJb01wTStHY3dPYjBqSm51RmRia1lZSy8yaHlh?=
 =?utf-8?B?Z3QvZllXYUhJcURGaFlzR1pDeUpjZGQ4OGtrTkVKdllGUUgzelFnNEdKcDBP?=
 =?utf-8?B?OFE4YlRKQ2NabDR1cGJ6TE1mRldyNy9wd1dvQll3ektyeFFjR2VjOUNFbzl5?=
 =?utf-8?B?SHMzWm1COFp0cUZJNlc2MXFnZjEyaUhPT1B0cnVmZ2lrNmpkRnJhbHAxcXRC?=
 =?utf-8?B?aHNMdzlGVUplL1lwNi9LQzcwNVJWWHI1NmlWUDdiL3RsZVoxYmI4ZFhvWTdF?=
 =?utf-8?B?c3VOYk8vNE1Kbk1ENldmZHdocDJQS0VaM2NRUGZSNlhYQ0lMeDZhWnlEbkJK?=
 =?utf-8?B?UGp1cDJnZjVBWUNFRE1wa3F1QXhsZkQ0WGdtMkNkb3oxSXRFOFZIbFVUeTJp?=
 =?utf-8?B?K2g5aW05dVo5ZThhcnhtU1JMWHJrTGR5c0pwb3BsK20yMkRGeGtUdmoreUdw?=
 =?utf-8?B?MEp6WURrRkE2QzIrMDNjSFh2V01MYnRuSG0rWk9kVSswRDNtNGd6MGFETGRU?=
 =?utf-8?B?MnlhVnNUbnBrZmdPQWJ0RG5SQTlqSHBzdTlVeFJPd2M2RFZYamhkS0x6NXdZ?=
 =?utf-8?B?bi9GWVM4NXNnU0ZncENlcUJoY2JoRXo1WTFqWUhSNXJyVzRtZG1TMS84MGRH?=
 =?utf-8?B?TlVQTnZBbUFwS2VnNHRDN1BUSFBlUTM3aWRNK1ZiSUJmNDVnSUtDN1ZhTTJ2?=
 =?utf-8?B?ZDFjdEorRk1TNDV2MzZGOGJYWGhsMWN2cUtRMkFjd1prUGgzazN6SE9lVFlF?=
 =?utf-8?B?Vm9XNG12Z0VHbWl2U2dNOUx6RU9pUE9DYmRidUREdzJXWmFwVU15T0hGWmNI?=
 =?utf-8?B?YmxERXkrazlTMTdQclQwTEJQbExyeUpaUDh1TDFJZVl3eGdGWVE5bGlBMXdr?=
 =?utf-8?B?SVZYcW56MXlLT3dZN1RJQ3g2aStpYjRwMVI2c3FRcCsxVVNscngvTGNiaHFN?=
 =?utf-8?Q?tziQlS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnJDNVJkMmNPbENiRXcyMldtZzB3MFBlMER6RXlkQmJCZnhkTENVTlpRSUc5?=
 =?utf-8?B?UEw5WnVMdmUxck9MSkd0blJRN3ZCQ3BVT215dUFpd2pMV2FHZUlVV0c1WDM4?=
 =?utf-8?B?dWl0eVhZZktNK3BtTWNsckRFNFRkT2RoUUZsQWkvY1g2QTNBSFZON0kxSnJZ?=
 =?utf-8?B?d3NMc3JHL3NtQnJHY052NkNITWphamhFRHUvckJ4WmJFbkMwd2NVbEhwNzNB?=
 =?utf-8?B?RU5ucHRDdEU3MW9GMDZ4dTJHTFRRYWdpd2p6WGNCQStmZnltS2kxd3hxMXgr?=
 =?utf-8?B?MzJYdWluLys0NjZTSE40b3hwcVVnaTRJZXR2dG04WkJNbzdtSStnU2NDdEoz?=
 =?utf-8?B?VGpycHZtdlVpNXFoaytRRmZROEpkYnIrenhSeUtYT08vMGhUYUc0cElwSGZn?=
 =?utf-8?B?Q3RETDhDcmlaNnd0bmpkQ1llZ3YrTmlpclFDdUVtbkVOUHpncVA3NnhZcTJ2?=
 =?utf-8?B?R2NEbW03L2RuUThJeVNEUGQrS0Q2bkc1Qy9yUWNqQ2hBNjBsRlMwZlF1allx?=
 =?utf-8?B?V1RWZ0NxQWlzc2pVN1A2ZGg4T0ZSZVZZTzZxNkJnNVh1dVdTRVB0NE4reXVm?=
 =?utf-8?B?eEhWa1dyMmhQcGNueXlhZ0I2aWZ6UTMyUHJxQ3B0cVA3VGdEQXRIWjd3V0Uy?=
 =?utf-8?B?eUZzaW1CUURTMmhHQ1A1ZlhSbkRLaFcyUzBhUlRTMWV1b1NqS1B3SVZFWlBB?=
 =?utf-8?B?bXhKMk9mRElHUjRSV0NUQTRFSFVBVDdkTk1uUzkrd1U3djE3aklHKzN5UFdr?=
 =?utf-8?B?TytiLzc4N21RNEtiZ0pZSGZwb0xUUG1zV1k5MTFZeVVCOGtpUno0V2dSaW5k?=
 =?utf-8?B?VUZsY0xxbEVUZmUzejlXR3ZuUzZuQzk2QmlCMTJGbHBtcFhaUzF4T3RDRTdF?=
 =?utf-8?B?NVBTY0M1bytISGF5RFd6WjI2aXlLL00rcGlXaXZvMGtWMWZ6T1FRRXd4UmV1?=
 =?utf-8?B?SDEwN0hZWDNuVGpCV2FsUDluZHZIdVBoaTFxZjJVMjIyeVcvdnM5YW1DakN3?=
 =?utf-8?B?YmpRY0FGQnlFYTZISXRuNkZDemRIeUh6bmdrVWlTaHlxTTNRaThtWElQeUtK?=
 =?utf-8?B?dFNWVWIyQzJKcWhVb3hwWHRCNDQ1ekFwM29zQ05WMC9ZODBxRWNKRVY1Q2lt?=
 =?utf-8?B?K2ExSm9GZGNmMndFYnhjU0ZXYWZNTDc3R2NIOURpeGN6RVhGQi9sdUM5ZzJx?=
 =?utf-8?B?RW5yVExXTDBZTUMwY1FrbE8weVRvK2w0ZGRidEhyU3VoL1ptL2pma1BlRHc4?=
 =?utf-8?B?M0tqQ252MnBJV1NJcnVTWFd2R2FMZVVEY1ZNNFp6SzdmYy94Y2Z2YTNXNTFm?=
 =?utf-8?B?OUZSYU13SmErRC9KRllHQllBRVFZaHNXR2toKzhQQ1VGa2dkUjdsMjJDU0R5?=
 =?utf-8?B?anRYdWt1S01DQ1VXL0VnUjlKb0lXTHNDOVZiQ0FuSkJaOThqOCtBWW1SQTh3?=
 =?utf-8?B?SVQ3RXNxYzBvVGJyS29YVE5XOFIzaCs2Q1U0cmk3cFBzRFoxWjY2OEZOTTVH?=
 =?utf-8?B?TVptcVhIeHNYeVh4WEZQd2hicTdGWERyOThqYUthRVBDS2dNTHhWM0Z4eUl5?=
 =?utf-8?B?VTVCVHE3NVBkZnBlMjhHVk1nVjV2NUZxZENVYldwMm83UEJhaHRPZXc5WTFE?=
 =?utf-8?B?YnpVU1c1N3BCVlNxMm1OVWxDcHN5RitXd2pNbXdRYUwwK1dkdGg4MnJnTzc2?=
 =?utf-8?B?VU54QzRIazJjMENLeldBdmlKU1gyalFVRnBwRDliNlhRMWpEcWdNYlIzYTJC?=
 =?utf-8?B?ZHNWMzNDR3pMQU01MEZGcmtmcGhkYkRlNHBid3FyZTJONE9PeTJDenFTV2lH?=
 =?utf-8?B?NDNMSHU5UmVFU080ZC9HOFhHOXFZbzM4ZzlUNXh0Yk5ncmwzQ0dLa0EwNG9u?=
 =?utf-8?B?dy9OTHV4UEdIY2p0eGJLalVibGxXTXY3NWlTNkRxVUx4Qm9Gc2d0WXZKd243?=
 =?utf-8?B?cEVkYi8vM2kybzk3VmpCZmxTZjVtZisvYlh1U2ZDNXNtRHU3R1NCWGpRcWN4?=
 =?utf-8?B?aWNzc0t4eFpKODhteFJZY2RFS3UvNlR0RnhRQURUdWxkajEzN0o3RGt5Nnd2?=
 =?utf-8?B?N3NxRE94UllCRW1RMzkxQy9iUUlRUVRMYzBFUkhhdlZkMUY0WGRITThFRlY5?=
 =?utf-8?B?TnppbytGVWd2bUtuTHBqM2hzblViSU5STjJnalpJdG5ucnhKS2FRclloQWZr?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4T9XqQpN0U1iRMqRy0I5f3Da"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa68d3e1-733f-4050-638b-08de1babce58
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 14:09:44.8118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3ZMX4iZqwjyUpsVyRUVJ6jOf1EJsvDn3Actmhc93ruK0hAyN47YOtZGsK6GiZquWJxfRM+Bbfj7Bz0C2XE0Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3668
X-Proofpoint-GUID: gjtyle8No3XwlCkdbONKSetvInmtU7Er
X-Proofpoint-ORIG-GUID: gjtyle8No3XwlCkdbONKSetvInmtU7Er
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDExNyBTYWx0ZWRfX503rM5B0rrtI
 cUXnqeo+iLIre9owMZF9g5JSr11Hha616GTZPMJDjVJ6R9Q8i69HviOgdExKLwhQ4Lyhx13+N8V
 CylRsbuseBZHrVvll0si4pvZcfI7Pb18nd+4gSdQVKN1mGG/hZZQoMgn7oG+SepjBkB51G+AJiW
 lN4DGSOjDpVNIUbsJJDqprcA0uqOh4Kswxx3BAMiTTAa0x0CKkfnCNcCmczN+R/stjZjTG7J6zY
 Dz+YOZmBblFUi8Ykn03m0Gs1R7kL/qEd/phNIxYNvWdWWkJhYpByfVh8EnelOciRCR8QHZvdeAw
 2aj6RjBd+QSO8f7mDogUXgXaYv9guZg1gmVi8QqPWvMqRLNpEsbFBc/k62XyDsWeIu1IVp7L+J3
 CFHEtfOtl8UDfqQcDKPVU7uryRutDg==
X-Authority-Analysis: v=2.4 cv=Yb2wJgRf c=1 sm=1 tr=0 ts=690a092d cx=c_pps
 a=yNdzxiJtKnHaiOZJ9/WMvw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=tqqa_KJukSL2-KTKk3wA:9 a=QEXdDO2ut3YA:10 a=DFU9x4WIXiAHKlIygbsA:9
 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
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

--------------4T9XqQpN0U1iRMqRy0I5f3Da
Content-Type: multipart/mixed; boundary="------------B0pXyTJUAPoLenj4cR2UPjKW";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <792e9df2-4f19-4a44-8c1f-014fd4ac18e4@imgtec.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-3-marek.vasut+renesas@mailbox.org>

--------------B0pXyTJUAPoLenj4cR2UPjKW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/11/2025 13:56, Marek Vasut wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Just for completeness:

Acked-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add RB from Geert
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a77965.dtsi
> index 0868b136883c..4e730144e5fd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2450,6 +2450,23 @@ gic: interrupt-controller@f1010000 {
>  			resets =3D <&cpg 408>;
>  		};
> =20
> +		gpu: gpu@fd000000 {
> +			compatible =3D "renesas,r8a77965-gpu",
> +				     "img,img-ge7800",
> +				     "img,img-rogue";
> +			reg =3D <0 0xfd000000 0 0x40000>;
> +			interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R8A77965_CLK_ZG>,
> +				 <&cpg CPG_CORE R8A77965_CLK_S2D1>,
> +				 <&cpg CPG_MOD 112>;
> +			clock-names =3D "core", "mem", "sys";
> +			power-domains =3D <&sysc R8A77965_PD_3DG_A>,
> +					<&sysc R8A77965_PD_3DG_B>;
> +			power-domain-names =3D "a", "b";
> +			resets =3D <&cpg 112>;
> +			status =3D "disabled";
> +		};
> +
>  		pciec0: pcie@fe000000 {
>  			compatible =3D "renesas,pcie-r8a77965",
>  				     "renesas,pcie-rcar-gen3";


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------B0pXyTJUAPoLenj4cR2UPjKW--

--------------4T9XqQpN0U1iRMqRy0I5f3Da
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQoJKAUDAAAAAAAKCRB5vBnz2d5qsClv
AQCfHDx4gXr0vHgLOYI67Ef1fsfZ1IjjSTN1qB2TA4RJ1wD+Oo0/+W02R8Ch6ZABHnq0Lrxchb1Z
vULiXHAcdNmwog8=
=6r48
-----END PGP SIGNATURE-----

--------------4T9XqQpN0U1iRMqRy0I5f3Da--

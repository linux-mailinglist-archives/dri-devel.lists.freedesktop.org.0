Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8BC31619
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408210E5F0;
	Tue,  4 Nov 2025 14:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="KAwiiaYK";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Vn1GSymo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D52A10E5F0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:05:32 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A46budK3758806; Tue, 4 Nov 2025 14:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=AhOW74NLn0jVpRS8rsNN6UKTC
 kI/wEICOhoMjq4Y5c4=; b=KAwiiaYKq/3NFyFrN0qPt4N63Pi7uLOV0gACtkL4b
 wYhKCYJRhBvtJ+Px3Ddb/YH4NSr08GADWMYk0vHivNBUcoJ8sbxC2tl8xKUE1SC4
 b/lwjZUF11IJMHUJFfhTxhIGJ6bRIs2CXya0jhPkazugle2LKdOssYZzc+W+bGiU
 zkRFLy32rVaQ5n2wEIWTp2sFmmmlsz16vbO3WQAfZ7R3GT/kBzepc6FwI3Nl6tNf
 dRrlMdpA0iA2YSaEtEZlzEaI1frodXDHXtlEdwtn6s25cLOaTNZ6m3oG27Z+1hb0
 yX0RwRM63C2C1R5MulfxBGUtus7OQoQQr3U161lnvVq5w==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020119.outbound.protection.outlook.com [52.101.195.119])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a59bst1dq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 14:05:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZXdHQwjLAzSNYm+dTz+bUm9OCpI+78+Y1p/ZnSg0aUGheC5/muvspbd4MQo4W2VTbYahsD/Z7CzFzXgWUa/32l8s09UEKDRpbJFlYLrF6j61u4tIafLD8ehvAM5zpI+0avIVs1esk80fo+whCh8U31KFjQgx/MVtdwNrsxsty7P+GCAvGUBKNNvFDgwPOas1IoqpCUqZM4RRaWCRfDTzoCXTgEXFSiyNjO8+KT4Q3K+FsxC/AXlwf6V9hyRpEaYnD6w20svKKb0aN2J/ofHy9cibUCNERDTFi+DFa81UxIQn0aIj9H+AgqF2Is8+RsxjmoWsMJ2L4jRgawdg8stjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhOW74NLn0jVpRS8rsNN6UKTCkI/wEICOhoMjq4Y5c4=;
 b=n7IwiHzd9z7cYE8kEGqRuVvHxxBfgnNHyKfXHlajtd6jf+Syh/HPgJ/PvlbgXR7axj7NjdZdrIfkKqhsjcp0fF3ZoOGzdA9lyWULcxOYq6iOTTUz+KHD8Vv6glmnUaZv4K0LnYXAtn4u54xq3Q/YJxs4+AaUDjrfvT7sxnQLFGnRHyH6ksLFa0Q9c8C9eiN/XIuIb0KS8AbXn70FxeJr7bRzkuz5CsYSVlvlKzQOQk6J+88ySbmvMCzhM0b+O8T+xoC1lkwrprJU84iXXhgRBt5VXlMX+G08Q8RSb5cOF8P6LIfYh19QlSBAAg6y0nrkcdv0EEaOoJ7nOpoqTiukLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhOW74NLn0jVpRS8rsNN6UKTCkI/wEICOhoMjq4Y5c4=;
 b=Vn1GSymoSpKqv5Z46j/6eEUzyeuAMorY4fxBSVJBjnyERIYTOIibDuQ1a90RaCUNhqU5YNNZBz0JoX0rent3bRblgyS31OJHVbCL6O0YmID2ZN/vWo7u3+8ttDSitbfRquBnQi9Xc/XP0TaDm62guGqIer/GnHiIziNOHgR37eo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB7331.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ec::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 14:05:06 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 14:05:04 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Rob
 Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists
 sorted alphabetically
Thread-Topic: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists
 sorted alphabetically
Thread-Index: AQHcTZQEIRrSYqanrUSVjyN1d33SwQ==
Date: Tue, 4 Nov 2025 14:05:04 +0000
Message-ID: <b0403010-9f88-43f2-a6dc-b85ac741e82b@imgtec.com>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB7331:EE_
x-ms-office365-filtering-correlation-id: 52275ed1-d50b-4958-9e2b-08de1bab26fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dmRyWUgxS283VDFMOEJUV2cvU1l6UmRaUk1UUTFVcUs1SUtxNDcyelpjd0p0?=
 =?utf-8?B?ZE0xa1NDRkZsSllGbFpURmdsRUQwVHV1SjNTMEU2K1l4RkQ0Mk12Mi9xMFJJ?=
 =?utf-8?B?dXlocG1NbDFnWjA3K0hSTzVWbzVXeXRYY2xBQ2w2bzFYNStQY3hUU1pBV0Zp?=
 =?utf-8?B?Q0Y1K2h1VU5oeVh5R2h6TDhHeDhUbW56THhoOXRMbkh3b2JvdHFtZTlESWlw?=
 =?utf-8?B?djlJRGhoVDByT2czNEZwV1hISDlCRUVGemZNdnljSlNTVFFLUlVURm5LSVBl?=
 =?utf-8?B?dkJRY1kxa1FXaDMvZzJhM3RZZHNVOEZ1ZC9mdzdkaGlHZlAxem4xQW56R210?=
 =?utf-8?B?S1BFTGhDTERScG9nVDZpZjNEVUxjV25yaGlaMjdSNGY4aXdHL1dCbCtJd2h6?=
 =?utf-8?B?YS9oeXpaOEhJb1o2V0pmZ2VQRUFVWVpwem43OEhSWFJVRG5uLy9lWjlvbXFZ?=
 =?utf-8?B?WkcrdlRSNENTcEdKWXhpUVZkUDAxUEpZSklDZFFHMHpSSkh0MnV3Sk52UXdC?=
 =?utf-8?B?SXJNSVBDenVwV2c0ckhYT21UU3RNTFVvcEdrQ1lvcXFHWWJwYTBFc2svMnhX?=
 =?utf-8?B?RE1nU2k0U0NOazNPakx5SjFzdHo2dWZEYW9uM0R1WXlQd2FqL2tMeE9TOFZW?=
 =?utf-8?B?eTh1MTZmTGduWGdkbys1MVNTaHJlUlZCRXJheFFmTUxmdUxHSVRRRHg3TmVo?=
 =?utf-8?B?NDQ3R2ZIZ09LdHl1dGhkUWVPaUlVU09SVGpVUUpEaTN1SHp0bnVKVnRyQ3BO?=
 =?utf-8?B?UVZRa0hMUG9QNWdmMnZsdlJTZ1dhcjUwS3NGa2JwV2t2RkYrZWFDbnNHUzNa?=
 =?utf-8?B?VnJWbzNLYUt5cDZVd3Yxa1U3NCt2UmJEaXVSN092RFFsL040VkU4UTExY1Z4?=
 =?utf-8?B?NmZQblM3d1hZK29OODdQaXNGcHVFZHB2cnB5K3V2RzExQmJrRnpwSnVVMUQ3?=
 =?utf-8?B?eEk4TU1MKzZVRjZ6YThqWHMxeENYdG9wNzBoeGRINkNDdWtWdE1pdThMQjAv?=
 =?utf-8?B?N2xISC9Ba3ptWUdtc3habHRzRHhFRkJpWjdSTEQ4WFZWMUtsMmtIZ3o0UnNX?=
 =?utf-8?B?K2FQWmV3bFpQeDBWb3NzVm0xSnJwRU51UGFDM0NvU3hmOFhXSXVHZThtMXl5?=
 =?utf-8?B?Q0tKNE02cEY1WjVVZzhNbHY0YzljdC84NjQyZVgrZlBvL2tqdmQzRHNZTkVH?=
 =?utf-8?B?Y0xVQzNqU05zRXdtWXozSjVLMHVwVHh3UkJWeDVqc0l0am5oeWx3S3RyV0dV?=
 =?utf-8?B?ZWhsZjRXRTlubi9HSUxVUE9TTDJZaEphUlJSRllRc0pCbWtkUEFJYm9laGk1?=
 =?utf-8?B?czJvc0FlR1I0bWsvU0FwYVZnYlFTMEY3NVF5bXROUkJoK01qYXJtSFpucDhn?=
 =?utf-8?B?cjcwZlJVYnFXQmMrNlEyQm43YlU0RnhsMmZpZ24zdE1kbnlFMkYxOG9wWkxY?=
 =?utf-8?B?NWVpeGEwMDh5ZlRaWXFqeFF5YmlDdUdhZmY1UnJTSEJaMGdtMDhnOG92QkJC?=
 =?utf-8?B?Y3YyaFpGVWRyY2NCaW0vN2lOZ09aMHdmNWZRZnZCYjdpOWFNTDlNWjNHZ2hY?=
 =?utf-8?B?T1hIL043MllYZU1oNmRDenlZM29yTDczUDVKRFNtLy9yUmxYanNqQk11a2lI?=
 =?utf-8?B?a1BLZEM3b25vYWdlTWE5YjlWZUFtbHFpN2R3cUJtNnhoZXpQYzlhTjh6UG1o?=
 =?utf-8?B?WGZ1QVdQMlNFbjRiKzVwT2RwODQ0V0RvWGt5L2V6dWl1V0haa25jb0RSWlg3?=
 =?utf-8?B?QUFaT1d0dG9manhrQUFsTjlzNW5GbXRiVUJZL1VGUzlKcWt4TEp5SWlMNklR?=
 =?utf-8?B?TmJPSUFzNjJJRVVUbmpGZThLbXB4dkpXNFUvMncvUlBCc0tQZHkxMy9WWjQy?=
 =?utf-8?B?Y0x3R0dRS1dQTFVyOVJNQW42TzRObWUvREdpRXNjcXIxS2NEYjZFQTNVMkV4?=
 =?utf-8?B?eFdrVGhWSlFNNS82U3F6YkFjSzNGU0NSdHg0N0JJYkZVRGhSYzdZQnJWSVhY?=
 =?utf-8?B?WTNLK2l2N0V6UjRKcG1ua0xwbHYxT1NMUWYvOVpaa1E4ZzBod255YWhCRUJC?=
 =?utf-8?Q?GK1+ix?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUNOb3M2ZDVBVmNPQVBqL25HcHJXdVE3Ti9OKzV6RXNZK2U0RkVGWmFLalFy?=
 =?utf-8?B?SERKbENUV0Z2dlJZT1ZBTUEwOW90VTFyYVEzUkhUQjBnVzVYWDYxTlk1MWxp?=
 =?utf-8?B?QTQrd3VZNllRZVBucXdhQUw0UkVnSHM2NmZJTks1bUhmcFVHaklucEY5Zkk2?=
 =?utf-8?B?ZUJqYVM1YkRYQVJTbkZjcC9OVVlGcWVpTmtnNjJmaDJYTUJXZzl0WEVLSlJt?=
 =?utf-8?B?TlAzd2g0MG9YOUlCQzZzV2hzSkNQa21qcHlWZkJqYzZDeFU5R3g1YWl5S3Yz?=
 =?utf-8?B?QmN3L0VlUTBBdkd0Tkcxc2IwQjNVZ2JVU1ErS3hzN0VpeUxDWmZ4NTFLR0h2?=
 =?utf-8?B?V3NNeUtSU1NPUjEzU01RK3pSVTFTSHBrYmNRYUdmZEJxMG5YVlVRWGZybHZa?=
 =?utf-8?B?VktlWG81NmQ3WU1CT04zMUFPN3B6aWlraEhDNlhDaFpIbllIMjhiWlNVL2N6?=
 =?utf-8?B?TldKZWx1Tms4eTExK1VLbW1hbWUzMmJ5WU1DdlFyd2l4dWN3dXVFejdzd1ll?=
 =?utf-8?B?TGNGMGIzRzhYNXFqb2lkcENRL2tOajloUndveTdCMmpoSUtuVXZ5ME94NERs?=
 =?utf-8?B?OVdiTURvUHFjSHlpczJjZ1I4c2R5eEh3Yk1qMjhGQm1mY2JpMFhWL1FuTzdG?=
 =?utf-8?B?SjNWSStiZUlrZE1jNThGcCtyNE9oQVNFemdKVVBUYVFlcTJYTkFZSUlza1d3?=
 =?utf-8?B?Q1J4MGFuSmVwUXVVS3FkdXcxOFE2NWwrOE9sY21OUFhpZTI0Q2kxVC9XbWdj?=
 =?utf-8?B?bmkwcC9yNkxCV0NJNUhwb01MQVQ4ZHptTkt6SmJMSHhjQ3N0dVZRY1IxN1BQ?=
 =?utf-8?B?VnhZaW44UXl1YTF3aC9YN011bjJSa0VSYTdYa2o5SXgzekRicGc3cXJsSDRo?=
 =?utf-8?B?R1VNVFZxaXpuMDBtcGVSdk5CUHdZM1pJUlF3eXI1RmxNMmZ1ZElmSm15Wnkv?=
 =?utf-8?B?cWlsdmJ2R3pHVGJGenZVaFBzekpOVGthVDFSV3FiL2FWWVhqNkEyOXhFaUcy?=
 =?utf-8?B?S2lCdFYwVmwycms0QVdUc0s3cFJCQVEyYTEwQ096YjJiYnpXWDJ0ZGw1QjQw?=
 =?utf-8?B?ZS9jTnBFemdHUndNeVpyMEI1ellZK0hHQ2hIRGM3TW9nNElXTGdTU0RtUktR?=
 =?utf-8?B?dllOK0JKOFV3ano0TWpUZWk5b1Y1UEF4RkhKOGN2RjBSN0hIc0xzOEtKM3Va?=
 =?utf-8?B?UERkMThlZGFaL2d5YSticHpyT0NIdDk3bjU0cVV2bC9NRWkraWVBNEdYaEx3?=
 =?utf-8?B?amE3U3dhTVJobnBtVStvMmFhdFByRDVtZGNLcWxtM0ttaXQ0bzlQRUZ4eUZj?=
 =?utf-8?B?QTd3WHJ1bGNlTDZYRG1jUFo2N2x1UHJMRUpvWU9rRERKenNySVFiTzlhaC9S?=
 =?utf-8?B?d1VHbTZZdmpCSWM0SHVUY2p5OXVKZ2dGYnd0TGtkd21tRld3cVB1aC9oejhV?=
 =?utf-8?B?SUtCcDVQTXJteHlUWHduVi8zc1BxaTFueW8wV2NuT0VtSEw4QTdJWDlXZWVE?=
 =?utf-8?B?NUoxeG1mQmdibUtra3lSYkNteGtQRXJkQW5pM1VHSldtTWxydjNZYjNLK3dK?=
 =?utf-8?B?NnMwV0pyRmtJTExzWWpvSVVydm5ESi9yL1FVVjk0ckFtblA4Z1NQMVZ2dVpw?=
 =?utf-8?B?YXBkY2VOMkJxVHJVYXZrZ0NObURCVit1dlZHeEdyZTcxRjhMYXFscjd5dncv?=
 =?utf-8?B?aDhKL1pJQmJ3cTZJTFVNc1VnV0VtemhXc1dSSjlHODFFMHpxMlBYdU5Fby9Q?=
 =?utf-8?B?c0gzVHVpS1lTRm4xOTg2bFpMUFRoZkh1NjBubXVSOFNTMXd3alc5ZFdKOUNw?=
 =?utf-8?B?bitGYzEwWS83cDh5TFJQM0ZMWlNkWktRMDFTQnBNajJwVmxVbTVJRlJQS1Jh?=
 =?utf-8?B?a1hvVklhZnFDL1ozUlF4VXMzUUVnTDlvYVo5VHlNRGw4Zi9EcXdiWGZjSGFK?=
 =?utf-8?B?MnY5ZE4zVVRHSForOE14Z1JaaUZKdFFuSndKUlZoVDdpS0hOUjJzRGphYkly?=
 =?utf-8?B?L05RVVRvZ1lsYi9uaSsybW9hTTQzeGVDNzNKUWs1dEltcXFTUWdRdUE5MDFG?=
 =?utf-8?B?YnNFd3QzaXBMRGg3SzNGalMxNXdZemVwNGlqSzhqWFQ3TWxXczNzb0F4YTZq?=
 =?utf-8?B?ZDViKys2WmRVckhYZGlRbzNGSXduSjlseWt4WEVJMDRVVEdHcEJnK3Z6dGUv?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ma3HjKS1nQVBGV0m3o8A49mb"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52275ed1-d50b-4958-9e2b-08de1bab26fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 14:05:04.0525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGJcxEIqpSSykliWheDlcS/apPGAsaK9xaO72D6xrXl5VnSCQQFgFncYm0Ev/8bd/pjr3RVvCfiYiRWNyhQRFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7331
X-Proofpoint-GUID: P7mzkjuKfTDXYKiWqvb9AohPD9Dtt7QV
X-Proofpoint-ORIG-GUID: P7mzkjuKfTDXYKiWqvb9AohPD9Dtt7QV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDExNyBTYWx0ZWRfX02v2mnk8it8s
 PnZeNQpyk2TkRz/n5wLU3wOklImnHFbLB4T1gERNFhnwCI8UWPGnj2TSIA1jm+pvYkdVM9lqoIt
 s+nrieXxOR8Z22e8fHZiVgjOPEV5zUFpMSscCvpJ/4CO7pAgIJOJP5tlgiKsy1ZXC2axXNMFazQ
 1kP5JHpX3BuU2c0w0FEk9DNYGtRvCZxnyASW5bJM9Cl4IkgUt1/msOmfTqmLbF3maCUEHbIDPye
 fhK1RAOW466h1PA7NQdD4Vb8c+vIEshoOS0Um5PtW1LZnJ7nYUAQojSmXful8HhHjJ58GIlcH3M
 a+m+xNFkCaw/JH4EQQ8jBN7oGs7mUcRzYPvWZiVnU2CbeIcqUrRgJ4JysnzftmOyuof5qvLF2f1
 +48MJ+En8cXmqJWSIP4lII8a50MSFA==
X-Authority-Analysis: v=2.4 cv=Yb2wJgRf c=1 sm=1 tr=0 ts=690a0817 cx=c_pps
 a=2+K8fcPkQ1vb4r61bGsGrw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=qtP4umix1bXqwJ3Z_ZEA:9 a=QEXdDO2ut3YA:10 a=OmomlU05d8J_A3Afy0QA:9
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

--------------Ma3HjKS1nQVBGV0m3o8A49mb
Content-Type: multipart/mixed; boundary="------------tZ9rIXQHEnHaEDjbuG7zrH5E";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <b0403010-9f88-43f2-a6dc-b85ac741e82b@imgtec.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists
 sorted alphabetically
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>

--------------tZ9rIXQHEnHaEDjbuG7zrH5E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/11/2025 13:56, Marek Vasut wrote:
> Sort the enum: list alphabetically. No functional change.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

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
> V2: New patch
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a7ca6d3fdf10..550da008629c 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -134,8 +134,8 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - img,img-gx6250
>                - img,img-bxs-4-64
> +              - img,img-gx6250
>      then:
>        properties:
>          power-domains:

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------tZ9rIXQHEnHaEDjbuG7zrH5E--

--------------Ma3HjKS1nQVBGV0m3o8A49mb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQoIDwUDAAAAAAAKCRB5vBnz2d5qsL/U
AP48wbgSrbt2E/cYXYOMEEGQESByZuxgFpwa3qfuYfd/BQD+JhvFsaHZs2iLt6lWEJ4adIGDKz4C
tkzHQtY02sVTNAU=
=BO2K
-----END PGP SIGNATURE-----

--------------Ma3HjKS1nQVBGV0m3o8A49mb--

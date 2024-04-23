Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD88AF384
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 18:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309EE11347C;
	Tue, 23 Apr 2024 16:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="EDVSKn9Z";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="VRYrGmcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1F811347C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 16:10:11 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43NE6DHA004668;
 Tue, 23 Apr 2024 17:09:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-type:mime-version; s=
 dk201812; bh=4J3718iqHmUqRJ30WshlhjiS880Y34b0ConiL9B6o84=; b=EDV
 SKn9Zr+FwViT6DC0iOmaju5rxkNqCbKVLwfcRfWlLvZvVWeFp8c4xhutDDVUSPL7
 +i5HVjn8tkUDqgeisDzLENNmzVjXAMBuMjXG77A9swn70PqDxNSxqhLmO4OIB6Ev
 hXFjywCsTCgo714cRUXuk9TNC4Ag+uqmRn7ai7ZkEwQDCAGwacPmouVvfA8mtHXy
 M8Ahlsb5gmpYUrZ1yTQxKVsBZMHz3QQm5JH/kdG8yjgJKNwVwfY9SdLtKDdeyKpC
 tuKuqwnV3H7aB+fC4wUjOUxwnhT+nusfhaHxm93S0BMlilpMSUn+pSnHm3/jfCFA
 aK0mcNnF79yYln7ElMQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3xm3ynkmy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Apr 2024 17:09:45 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 23 Apr 2024 17:09:44 +0100
Received: from LO2P265CU024.outbound.protection.outlook.com (40.93.67.0) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Tue, 23 Apr 2024 17:09:44 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXkaM3em+jnlnxkvrDIw5NeFYplcF9Zr8HHCpEczNaArp1+CX+sODKRLXSnbq87DDKGDzhAM0gjw8lZZHrFEFXbhkEkCw18AQffqNP9MB/tlgdPm2QOPCQBrQZZgXzC4zjKX3IwY1+DPbLTwW3F4HKGREkqxCFw4nZCOAmFzGkBhqBEABKSC9vWW7G3ExwFjDAjI73/5s9pfK2s7Jhd6kntDyPANNiw3fU6u1KnIQC/fhBNldJd8k0XHBx1oawDwR3mBNdZywA3rinwMQPtvvgRB3eFyglL2qSheZFCFKskm2my3H+BSFFsVV/3u4oLqzoHAXQrYlT9WGvpbF6ZoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J3718iqHmUqRJ30WshlhjiS880Y34b0ConiL9B6o84=;
 b=VHEE2IwQp5ObCfQgSAReCtj/wRrGH4XjD4YZ6K0YCKvHXtvLb10hXWt6fIsjC8RN9UJdd5KHjyuzxdbd/1uUzwsgwxJX0Ga2jTgxr6BUKzS7J5fw41Brsnx/AjEYL2iPtI0J/sar2W3L1luYUc0gHia4HOwp5pAYif8snc0Imq6c3vKyuZILOF5ONQCT6kD72ffy5NL4LXnnp/ufiPbJJAiRVgIYCvxhB9FL3VdlZBadK5yUa2W9YhILjkiN+g5cO25X3alTuN+Ziykz9ourOzy4ptg5zoDIpn1/TN51f6u7U+js+qczDjMKGnEvwTphPMrPemePHzTebshuIv7xfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J3718iqHmUqRJ30WshlhjiS880Y34b0ConiL9B6o84=;
 b=VRYrGmczYn3SBpk0g09WRWQJOOq/l/G5Iis896A+Jp3a2tBVfCQWMfK/00Xpc9dEicIk6SCcrXebibYEDrHIkL0mV2FB0ibdgjll/azvoHRdQeI7y5ZH34gfqbAygLPgTtMfhc3EDKSW8C39EL0RFYUY9q8CQ0YKXKKYGPy9FtM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO7P265MB7763.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:413::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Tue, 23 Apr 2024 16:09:42 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 16:09:40 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/imagination: Ensure PVR_MIPS_PT_PAGE_COUNT is never zero
Thread-Topic: [PATCH] drm/imagination: Ensure PVR_MIPS_PT_PAGE_COUNT is never
 zero
Thread-Index: AQHalZilaE7HTvidvkqz+oS3jgfrlg==
Date: Tue, 23 Apr 2024 16:09:40 +0000
Message-ID: <489aa9ab-3de1-4bfb-aaae-b093536d16ce@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO7P265MB7763:EE_
x-ms-office365-filtering-correlation-id: 8b5774a2-9685-4059-4cc1-08dc63afc7f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?b1RLRkpsaExGekhpSWpvSkltQWQwcDRaVG5FR1F1Q1IwNmJKYkM0MWdsNjJ2?=
 =?utf-8?B?QmY3WGRNSFh2c3ZORkVwQThoeEV4eFU5Wm43c1dSOVJpZThkQUZBNjUyWjNM?=
 =?utf-8?B?SHVYZjVUd0M0elJnc2NiUXNhT0xlVi80QVJURVU4eVMxclZLaTRnYjBzNVp1?=
 =?utf-8?B?dWJOMm9XQ1lBMmdYTXhzRXFNb3ZwVTZ4Z3k2eUJiY2JibVN4bk95bUEvdzJZ?=
 =?utf-8?B?RHpwMmU4U3pUSlVPVGgzT0hLL25lR1ZPQUpkZzloL3U3aXZVYVhiS2JEVXdS?=
 =?utf-8?B?Q0Q3WTVUMUtDdWlzUGxETG5FbEwwckpPODdKc3d5d0cyVkRkekdjMVkwQUdL?=
 =?utf-8?B?bmJnbTExNjdmV2dhWnhFZjIyZ0ZUWTdNNG01WTRkcFkreThjdHFoa2hVRGs4?=
 =?utf-8?B?MjMxc3NXSlZhVUh2Q2djci9YSDNldUROWkNDY3UyazlSdkdYeldETmtESGV0?=
 =?utf-8?B?WXBPdmFDYUhTai93aG1TZ3Qva1M3bldCcHQ5YzVobkxLYlVTeGsrV2NTdkF0?=
 =?utf-8?B?R3BYbGNxYTZuSWdQdDZKUWFLZkZIbTBOcEhZblorMDdwZTZONldkN0l6WS9C?=
 =?utf-8?B?eUtOZ1Z5KzZiQTV0YmcwOWt4bkZIYUNudHovZ2J0bjY2eVl1UWpWSFRMbnp0?=
 =?utf-8?B?TWJwcytWMDFjeVdDQ0krSWFrQjVJcTRHWkduN1NkRmdJcjRSZ2xFdmtIbTJN?=
 =?utf-8?B?clFqODBlL2FwdUZGMkx2SGJIOWFLUStOMjIvbTJuQmE5Q3F4Z0JmUkppcHRp?=
 =?utf-8?B?bDluU09Sak1rSGVUMDZ4dWcrYUNEdnpBbzcrOXZzNXpKNlpaWE5mZXl4MFhY?=
 =?utf-8?B?OXNnMlY2UVMvZ3RoN0owVTQ2bHRERVZXS2puQ2RYRWRzRWlzb3ZISXNoUExs?=
 =?utf-8?B?ZWtOSGV3emFqbGZVd2NSMlhYeEN5ZFF1VS9uNTNpUHpNU1hkclJZb3Y1ZERm?=
 =?utf-8?B?L1VWUU81c3pHbjhhQ3pFY0phSEp2cC8wVG9VZVkvU0NMTTBoSE82UnQ3S3No?=
 =?utf-8?B?NzhmZlVtVUtCT3BiNlRieFo2SUZkbDNKQnpVLzh2cisyS2QyS01wa1FXdlVu?=
 =?utf-8?B?Ym9yQ0lkVUtOQ3FLcm1CT0lSMFJtS0pBUFdKSWhNQSt4MFlqdkRRY0dIanAy?=
 =?utf-8?B?WHhsSlZaQzM0NnM2eThHQTFjUGJPQ21RcGlmc3Z0c3FXNEUvMEIrR0Ztc2Qx?=
 =?utf-8?B?OFZUUEt6dm1pdXZUSmhrMHFCbXc4Um5zaU1wVTJFQmFzb2NHVnc0QjlrTENB?=
 =?utf-8?B?anZlSW0yd0RIZFVDYkIrVlhVL1UxK1A1eGxiM1M2K0dOWDI5WHBPQ0lXZy9t?=
 =?utf-8?B?WXM4cGNudXpjaWJ6UTF2eU1tK09jZHpOZkhNL0tFZHREcUIxdEtuTE02S3da?=
 =?utf-8?B?SXBzbnIzUkp5eWFjcG1XbmovRzZwM3lNT1JRZ3VWZTZkK0U0M2FJZEdrSEhw?=
 =?utf-8?B?TzRET1I0Z2FsajA0UG1ocFF5MFpQTWVlQVQ5VFBDVHY5NElYZWFIZkF4cE12?=
 =?utf-8?B?TFRIS09zd05yeW1lNDFiRFBmUkE1Uk5PUlUycGpTSGVpVXhNaEhmNk1ZdFZ5?=
 =?utf-8?B?Q0xjUVFvNkllM3ZnUkpPekswL1hmVHNtZGNLVGp1T1RxdG0xTlcvb0syMmFJ?=
 =?utf-8?B?WFJFMVNwU290UkhzMXoycjBYMEYxZFVoellrb2hMdEVVOEg5dTdqSGtIekZs?=
 =?utf-8?B?UC83TlFSdFpud0hLQ0N1cXZ4NjR2dTMzbEFUYUk0NE04dGtZS1ByZ1RJeFBv?=
 =?utf-8?B?TE5mOUZpQm16K2Y5SVpGbGxZYUxMbHBya1p6RC8rNjBtK0JIaUZISnJUQnQv?=
 =?utf-8?B?WlV6WlFKS01aMEVzSDVQQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1NycDd3a21mb2RKVStmWm8vYVBJNURKWmhWZFR0dTFrRXlpSlo3WGlyZ0gr?=
 =?utf-8?B?Rm1Kajg0ZXA2anp4R0F2R3o0WnBWUmN4YWxIT2RoaVJBRVhveWFJaTdSTVdj?=
 =?utf-8?B?cXFoUEJlUlFyeWJYVDN3ZS9hd0ViMXRrUHFnZEJKSkU0Wi9ic2srOFYxT1gw?=
 =?utf-8?B?NnVON3lGSEtiYXBtL1F3VS9pcmtwUFltQ2tTcTlFcWw1d2VlcVZqa0VTVEEr?=
 =?utf-8?B?OFJCeU9CVHFBdGk1MFh3Y1ZUTHlwaTUwRWdQZ0IyWkdFa2N5RTN4VFcxbjZs?=
 =?utf-8?B?VTJZak04b3pVU3NZY3lVSjFlUkpZZTBSTlQyY1cvaVB1ZjZuMGlnR2xmbkFx?=
 =?utf-8?B?c2NKeU9ZNkZmNWhpeWhtYU54azJzS3VNaGlCeklYYWYwRlNUYVRnRGpZMk9F?=
 =?utf-8?B?czNHdVhJbDVYSHpJUEY0VmpUWXNLeml2d0p2U2l6WlVrQkJBbmdXU0FrTE9r?=
 =?utf-8?B?K3QrbXF5T3RyVHRXK1N4NENiQVdJbXhKbEhYK3dsNndnRmcxUmkwMldGeVl0?=
 =?utf-8?B?U3cveUNLT0d5VEg5YnRBa09IaGE2L3NwOWVCN2VTSGNYcXBYMGhleEM1ZWg0?=
 =?utf-8?B?Qno2ZE4yRHZERytTT3dFUW1wSjhJNURtbUIwZUdQOW5la3krNlg1UzJLaGFh?=
 =?utf-8?B?OFRCZTZPb1RhZWwydDRHamxzMXBKTzR6Y3ovZG9XZVEyMEd2YnYrSFlWNG43?=
 =?utf-8?B?QndXcVBEM2YzTDk5TEl0SnI1U05xMXhhb0VBWnJTazBsNmYxd2x4SDBFNFlO?=
 =?utf-8?B?SUxmLzdHTHlSQ3hNdy8yK1B4ZHdhU1dJcTdKYnJTcEZCT2xmOEVhUHJZK1pV?=
 =?utf-8?B?Yk5EQ0M1Mjc5QTRsMGQ2TDFGVWY4djNMdHFPay9Pc0lVekxGcDhrMkNXbVY0?=
 =?utf-8?B?TnpyYUk0RG14Z3VyeVRqUFdKV3BJSEF3ZWhjUy8rdFhWMVRXV3pJVzdmeTlj?=
 =?utf-8?B?RkZ0c0lqN2RzV0FFREgyNUV2VWkrZm0yRUtkM09vNG0rdW1oWU1sL296NUVG?=
 =?utf-8?B?Yms3Yk9aZEh0L3J5Y0Y0dFpXSnVlTU5lQ0NnZndkL0hPeXptUHRiRG9YYm1u?=
 =?utf-8?B?VGRjYVU2bHRaVlQxTk42M3BZdEt6N3B6NjlwTjdjenlmbG8xUzBLc2ZsN3RX?=
 =?utf-8?B?VDNObXZUbFplcktwbVB5NGRLTXpKZlFNZjdXd09OM1RuMXBONUVjNWVQa3Z3?=
 =?utf-8?B?bWlDdWJENHZ4Z2doOFlXeHVXOUFnZElQM2VQTGxuZHUzSkZUTllQMTRYWVlh?=
 =?utf-8?B?dHN5RXdrUUo4c1ZDMVk3emR4QXVIQ21NMythODhFdCtBQndZQW84TDdvS20x?=
 =?utf-8?B?UFlhSXdSeEphcHp5eGQwOE5zNEltRGtuOFZaOXZDZi9JMDVxbW4vNGJvWUJD?=
 =?utf-8?B?THRZcGY5V3g2RHZTdVZaeGxscFpHQzB5TGY1NEJSeHgxNzVpdWJWYVRhWUpJ?=
 =?utf-8?B?VWttcU12dFRhN1NHMm9LZDVMR1drc0ZkbEpMSFBIbzlwUXI0VC9DRURTU3o0?=
 =?utf-8?B?NHlsV0hlN2w2ZWM5Y1VUK1QwZURHM1NEMFJmVk1rNXErK2ZnZHZ4cXJFRUpv?=
 =?utf-8?B?OHdMR3VGZFl1d3c3Z200ZHBXU2lHaW13NE5IelNVelk5WWFUb0I1Z3pGWjVC?=
 =?utf-8?B?WUZhdFhRaTBiRWxmbFlYTzRFQVFORXFLRTBVQmNpWFJpaWJLVE9xdnRwN2ht?=
 =?utf-8?B?UUhNNFhrcDZtOXlHMGJDOWdkY3RrbVI5bUdnTkRqR2Fwc0ZrbzBqRDcrZXNX?=
 =?utf-8?B?ekllV1dnMHhjTERKaDJPSXc4dE5YYzNOZnRYM3pSSktGdTJ3Tkl3emwwTXJT?=
 =?utf-8?B?NDJCK20weWE5UEFmRy82a2FyaFBkRzdta3ZHUlo2eDNscEVXdUNvVUh1WFRu?=
 =?utf-8?B?Q3c2MzJMc2RIUjk3bHhBZm5ici91aTlHNkpKR1NjRmwrL01ZdTdOamtxSWl5?=
 =?utf-8?B?dkt0OGlISTZvWUJWbDh4ZlB0aTVEeDhvMEhCVVdiVkp0MytLa2d3MkZOWUhR?=
 =?utf-8?B?MXNTRDEwNEZrRkQvT1NnUWV4Q0dXblV1Y01DZW9qR2xVelNGR3NzQTNBRU9O?=
 =?utf-8?B?ejhqdHB6K0czS081YjNPamczbjJvdkxpOUlmVFlYOS9BeVdJeDExa2xQYVV3?=
 =?utf-8?B?VjFiMlIrcm8weW9rakdnQ25TWmNoSGV5cnZwUjlaMWI2ZGtKNHRGdHkwTzND?=
 =?utf-8?B?anc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jQnLKfGFbDXiPllSRghZJPys"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5774a2-9685-4059-4cc1-08dc63afc7f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 16:09:40.4216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+xJniw2dtE2t6Um5XXVwZsS/8mrbjPgCP3ADmaafmob3b1PMreFimD8bgOAM2urGTswppNws/uxOkAdaiuWmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7763
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: maMLkjh2kXjMdu3vORVVTkqNisJ4tLbF
X-Proofpoint-GUID: maMLkjh2kXjMdu3vORVVTkqNisJ4tLbF
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

--------------jQnLKfGFbDXiPllSRghZJPys
Content-Type: multipart/mixed; boundary="------------s1YEidU6Bv56KK2J1DKb9TlL";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <489aa9ab-3de1-4bfb-aaae-b093536d16ce@imgtec.com>
Subject: [PATCH] drm/imagination: Ensure PVR_MIPS_PT_PAGE_COUNT is never zero

--------------s1YEidU6Bv56KK2J1DKb9TlL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When the host page size was more than 4 times larger than the FW page
size, this macro evaluated to zero resulting in zero-sized arrays.

Use DIV_ROUND_UP() to ensure the correct behavior.

Reported-by: 20240228012313.5934-1-yaolu@kylinos.cn
Closes: https://lore.kernel.org/dri-devel/20240228012313.5934-1-yaolu@kyl=
inos.cn
Fixes: 927f3e0253c1 ("drm/imagination: Implement MIPS firmware processor =
and MMU support")
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_mips.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.h b/drivers/gpu/drm/=
imagination/pvr_fw_mips.h
index 408dbe63a90c..a0c5c41c8aa2 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.h
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.h
@@ -7,13 +7,14 @@
 #include "pvr_rogue_mips.h"
=20
 #include <asm/page.h>
+#include <linux/math.h>
 #include <linux/types.h>
=20
 /* Forward declaration from pvr_gem.h. */
 struct pvr_gem_object;
=20
-#define PVR_MIPS_PT_PAGE_COUNT ((ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * =
ROGUE_MIPSFW_PAGE_SIZE_4K) \
-				>> PAGE_SHIFT)
+#define PVR_MIPS_PT_PAGE_COUNT DIV_ROUND_UP(ROGUE_MIPSFW_MAX_NUM_PAGETAB=
LE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K, PAGE_SIZE)
+
 /**
  * struct pvr_fw_mips_data - MIPS-specific data
  */

base-commit: e95752752eaf06c860811ac5ddf9badf6c1b43ca
--=20
2.44.0


--------------s1YEidU6Bv56KK2J1DKb9TlL--

--------------jQnLKfGFbDXiPllSRghZJPys
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZifdRAUDAAAAAAAKCRB5vBnz2d5qsOyt
AP96HBJQwbU2Mjv/qB39mrpgji33atMTjknlmZPmi7OxJAD7Btbcxlg8Hbo+3OdDKlDhyaQdtJeS
EnUKGiHi1vICSwo=
=Lsy9
-----END PGP SIGNATURE-----

--------------jQnLKfGFbDXiPllSRghZJPys--

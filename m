Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E599CCB0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BCB10E360;
	Mon, 14 Oct 2024 14:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vcTT9Jr7";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="P7+GZcEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2E410E360
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:23:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E69VuC004748;
 Mon, 14 Oct 2024 15:23:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=MlIOk/5orVk5Lct4n3dW0r7QR
 Sgwf/6/gluRooM1z0c=; b=vcTT9Jr7KU1ooGGe0j5VpDffc7DMyglmXXXnOVJdR
 N1PbS0iAlwQ81SB56UNkumMBhZK8TbDKHDGTHmSEgxzRq5v20/9uWv3w6WL/QKsg
 /obf+lBUOjpMTNhRVY1fHCaE97SinqLT3RNM0W0baa1E3ChW6dLChoCDPNEjx1CY
 JKwtnwT2FKzVl/+bKzljwYySPf0XrWbWKlyioQSspQoTDuOgAFDAYTUDHEGLY037
 F4U62xsfdEjY5TNJ0sMf7RoNs6NvQFrT2KdqI6qo2y/L1peKMv7j6NlsIuWmR24D
 NJN7/4RwV5FT8HrcPhsNsc9b2+ciOxmxnY1gULrdHTDeg==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazlp17010002.outbound.protection.outlook.com [40.93.67.2])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 427h6w29ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 15:23:37 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xE65ExYTcE+06zozsEJDE89uoc7o7L88ePRQcBexnc6UK94dMUc4tRkkxBgeXyXv06Tvsa1Xl4JdQVv8U8jFiRLGha06RwegMNbyw+HKykvHqSLST6QFzYBZYcPjsXpRODjcketOXIRbuA6aDc9Hnaauazqb9dq8feXdy0WBC4SaqgLeb2yCg74ZGDFpw67YJAn1kAd6R9I2YWXZ9JySVnfKbZtrrpQxlXRvQ+sGQZd9Z3bv1x4AzAan2fD1FhmeFuH7UAQp6WqFkcvrgZWe/LpcZ2p/PgNQgAvt+qegzWD/mVhx8a1tVZ01iIKPuQWGNQTN5P1m5/dzHYxMqgCeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlIOk/5orVk5Lct4n3dW0r7QRSgwf/6/gluRooM1z0c=;
 b=tAze9Kmk0aaVeS5dUSo/VwqoWO2dlvR6+i8iDGu/41ebqv1ykUkN8f1FgbkMR4fuLFTu6/DoYfj8kjRuuZWsGvhVvhCQOx8HFczzI+DuO6dgAp0+EFVTo6PLDIkwR3HhmuWkksJp0gGX921V/hIJDe8VmvMf5rgKqs4D0XduJN7GSIaZzWAMO4TPqs6uap4VSzvd3UzzzA94RNehGR3EuEl8hruT7xNQFJiDCmZoje7sLh6Fu0GUc2OjAxI0X3eRyFnbyhQmj4KJw3/pUTOpptO/IA391QCRDLqHVyQZ+xwMxxvYrgpwe9GMVHSX3kop8QnzUe9EF2eEcTPlCEZ1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlIOk/5orVk5Lct4n3dW0r7QRSgwf/6/gluRooM1z0c=;
 b=P7+GZcEihD1aRrjVihxClHi+Ly5ZV0fbyMniByIDgYoiHyLSeYRgCZx0oOsd/hoVf6Vbf2XEVze8BKygIdopTRG1veuJ7J8HDKH9DmUtfyNq2pxsQ3YrqD6Mfa2KjU6RkIwMUJcVzGHmQZmq9hp+K1LYk3VOOcsyHurZloYitjI=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB3569.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Mon, 14 Oct 2024 14:23:35 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 14:23:35 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] drm/imagination: Break an object reference loop
Thread-Topic: [PATCH v2 2/2] drm/imagination: Break an object reference loop
Thread-Index: AQHbHkSnYxB3i+0dE0uMRxpUhCZA3Q==
Date: Mon, 14 Oct 2024 14:23:35 +0000
Message-ID: <48476abf-2def-4d83-87a3-8cbd8eb9db3b@imgtec.com>
References: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
In-Reply-To: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB3569:EE_
x-ms-office365-filtering-correlation-id: 4b0648c9-a2d6-40eb-b8a0-08dcec5bc9d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UTdybWNoOHJnbFVVdndLOTcwWE93d2ZYdUhSQ1FRMHUzWnFEYi9CUXBtWitE?=
 =?utf-8?B?cDZWRVh5alNhS2tNRFlHNW1yUGI1S3ZkRGdxR0VLaExwalA3R3NaVVBWTW02?=
 =?utf-8?B?SHZMZ2tTRXIyV3VjTHRIcW5ZR0l6MFQ0QjdyQXB1c3ZZdGV6ZWFZZUlmQktj?=
 =?utf-8?B?Ym95azkxTVZtS3hTRzFxTm5MOEYrQ2FyQ0tERG9aQ2FnRDhGbEdreUVLUjE3?=
 =?utf-8?B?c3lNN2R5U2UvZ09RdWlqZnE5Wlc5YVZoUnNPMkJIQXdadXc1dGpRWWUyYitH?=
 =?utf-8?B?dEFMQ3pMbm1PU2ZUbHRCM0lqZlp0RnF2akhnSUpMc3lFbU8rbnlhbkNRWjZv?=
 =?utf-8?B?c2NCclNxUHpGbjIrUGlPbDJLd09aSGFzTUtOZW84MFdwQzV3T3BYODBId3J3?=
 =?utf-8?B?TkoxQlBjVjlKMUNtTkVjRk5ZVzU3anl1R2R0ek9VeUFHT2Y1Zlc2UVN1VTBl?=
 =?utf-8?B?Z3UzT2lVZG11ZDgveDl3NllBTTlsR2V1MFF5Tis2cldSQjBiTCtSZlJhb2ty?=
 =?utf-8?B?YmJFYUhsTmYyWDNBOEh4M0l3c2F3UXBOU3FGTlA4MEZaaUNWd2JiT3RURm04?=
 =?utf-8?B?RURjYklJNlE4UkJzYWVMZDhqbHRLeWlpR1Jod0RUS1IrRklBcU5pZHV2cmpk?=
 =?utf-8?B?bE5UcUhmclhmODRJVVVJWnhYaGZPbXBJWjV1T2ZKbGhMOVlWMTQrZWsvTlN6?=
 =?utf-8?B?Z1ZVVXU2QXZlOTJ6aFlacFpwbjgxVk1ReE1WM2ZyYVRsWlU0em9JVDd6RDVK?=
 =?utf-8?B?Mk4yUFdaM2JFRmdzNjJiRkJxSEN3TS96Z0l0VVF6eFpXV1gwc0tKTWdpYUps?=
 =?utf-8?B?b2NBNlMyQy9oMnJqRmxYYnNnbDgrZjJPTEI3ZTNldkxmdUx5c25Rdk9TNDRE?=
 =?utf-8?B?cTQ0a1JuZDFsYWJvS0lRM1pSSG85ckhwNENqdmorTUtQSVJWeDljMmk3cGJr?=
 =?utf-8?B?Z1pPcXR0WkFPV2tVV0U0STJpOG1HRDVibXFFa2EyRmE0bDhHVGtyTHYzci9i?=
 =?utf-8?B?dTdscHJ5cWI2R3Q4SUl0aG82MmRTem5wNGF5eHJsQm5iVkxFMXZqVzMrS1Iv?=
 =?utf-8?B?elJ5c3pTNEhYMUlhVzk0UjRFL3ptYklBME05dmRYV1FwY1dxbUpGa0YyMnFM?=
 =?utf-8?B?U1pBNXdQL29DTHQrVzZKZktveGxoVnU4TXl0SDdKVlZzcVFSWU5hOG1uWFFP?=
 =?utf-8?B?QmhaMTdlQkNSbnFpdGlZRjNkaURPYVhWMFRRaTZVVVNDcnJRVXh4cFprWWtG?=
 =?utf-8?B?akRyZW50Sm9Ba3NVQkpJZHdnNGhoNVFuVzlkTHRTWGgxNjhJcWxDdzNYNDly?=
 =?utf-8?B?WHBnei9iVXVxT2J3bzRMWkVyRkZnb1VseEJPaHpvMldENWhCeHVuZ1kwMmdG?=
 =?utf-8?B?REtGSFNQU2l0eE5UU2VxV2I1TkdqdU5EcjZha2ZIWkZqUnRld3hTbjFpbVRW?=
 =?utf-8?B?dkozK2ovVmVCdTJ6R3hSM1ljR0I4TTBERnZyWkNCb0VvZmtmYzJzbzZFMjky?=
 =?utf-8?B?MVo0STViTjBiRHlvakYxN3ByT3crUlRVdytid2RldXo2bUczSEhNSzdXTE1M?=
 =?utf-8?B?SDBIMzJ1MFhOanVtWVVpSVlNbXQ3bkR4TnRmRXEyNEJhTUk1WTFueE51VjJ6?=
 =?utf-8?B?SEZ3eWM1Y1ljTjJNdVE4bHhWYXR1U0lTeTNIcFN1M1NBcVN2Z1FaNC85Mlk3?=
 =?utf-8?B?LzVveXJPYkdFeHlFTVFUY0Z6S2ljdlFFUm44QzhCZm1YNXhmajU3TVdsYmhx?=
 =?utf-8?B?S3pUVW1aQXh2b3dlME5qMURoSk1MVEpGUjFETWN3NDZqL0xXOVlBTVhqaDFH?=
 =?utf-8?B?UDk5Umx4ZmRLdDdCR3V2QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXBTenBwckhCRm1GYmVCeloyZUtTOVpiZmF0S3E5SXVCT0RoRE9FVCszWWwy?=
 =?utf-8?B?R3BjN1A4Z0lsMFJrZGs5NjdWRm55QXE0UmRiMGo5dE1jb0w0SERGOFQ3a0Zk?=
 =?utf-8?B?ZFZwMEtpNHJzaWJLUjRPQlA4N1dpcEdNUTNkbUdmVUlRRVBEQVR5WkhsR3c5?=
 =?utf-8?B?dGZWQ0RGS0VLdjdRd3dYMVNvN1FHdGRwZXFhUEFFMG1ia09VNTR2bVNBVnpX?=
 =?utf-8?B?eFhkV0VFQXB4R0lJbzgvSW5nSGJLd1o2bmhsaVZ2WW1LRzNWNWlnMzJBVUJo?=
 =?utf-8?B?SVFkWmx6QUQ0TkxNbjZPUm1ONGVnOFdXQmFwdndqcWxhMWREdE9CUlBWTnow?=
 =?utf-8?B?VFFmd1JhT2Npa0hyb1JlZ2g3cllkdnJJVWlYd1ZzQlNyV1JPY2I5bEcyM0ts?=
 =?utf-8?B?dFZVTys4STMxZmV4M0ZxMnJWL1MvVzFVNW1CZjB5NXhtWDZYSWVFK3dzKzFV?=
 =?utf-8?B?TWY3NFNYa2l2ZXVtTENESjF3bTdSQWFwcGxyQm0rRE9zQzZLQ2ZWYTI2UWky?=
 =?utf-8?B?Tzk0U0lKYmU1NjdFcU5aMFo2L3pnMUd6bUlHSnJjTU14RDdYQ3k4RDFVM0Fp?=
 =?utf-8?B?dGFoYWFyZ0N6VHR2K0IrYms0TnFGUm51UHBvMkhONUoxbGdVdmpGYjZLNU16?=
 =?utf-8?B?SFdkcG9WV08xMEJETGtCOHI4d1BpUUJUNkZ2MFZ4aElGN3VUSWdlb1hxWFpM?=
 =?utf-8?B?WFkwVktFSEo1R3dVYWM3QmZpZDZ4QVNmWGZRVHdZU3hSV0JRM2l1QlhNS3Vn?=
 =?utf-8?B?ZTVUZDEvTDZYOFdQQ2ZLK3Z5RGhaVjBicU9EcnNzWkVsdXRiMnZMbWQ4bENy?=
 =?utf-8?B?aHpqK3pjT3BOd0sxa2w4bDQ2VThnaWl4UU1kbXlJRE1wRDdrWC9weFU3ZFFH?=
 =?utf-8?B?ZmN6czUxOXRlNlJJb3hBL09ya0hSemJvZDQ5YjFUYzVzRnp0amhFSW41aVpw?=
 =?utf-8?B?dnpvNkdJdkRrdEZIRnZGMEVra082bTBSbHJjdEkrWndjSWkzeDdMdWdZYW8z?=
 =?utf-8?B?YXVHUjMyYW5ZTG5zWmt5eHMzL0RmaDJhN1l1SWthUlFzaXJSSGY3NGpzUTh3?=
 =?utf-8?B?bDhsczE4YUJtRks2Qm82aEtGck4wRk80NiszMUh6MThrNWxNY0JtZDc5ZmFZ?=
 =?utf-8?B?b1lxWUhSQlZKb2ZiUC9xODJXVzl2M0cxUWNEUGtTY3IvbTlBc2phQXptV2w3?=
 =?utf-8?B?M0kzTldFcTNoenZNWGhmbHFvLzN5cGNSa3phcURyN1B0Z2RqSzNwNzlhU3A2?=
 =?utf-8?B?aHVyd3FFTEF4UC9TZHZlZmgvZEVFNUlzRDhjQXJHSXZucVJUYlByUTdNUzRk?=
 =?utf-8?B?VGdkOTB5a0YvaDZNcmY0cGMwTFBZQXdVRWZvc0t2QndCUmkwdVFXTkROSDVo?=
 =?utf-8?B?aW0yWEJjd053RnhrZG44N01sMDBRRS9hSk9sazVGNEtETlFML2VjcXJPYnBJ?=
 =?utf-8?B?YWxIQlRLQjRHK01Ub1JaUTlISncvRjIvNDFTbzN0aCtPLzl1a043OW9Wekhm?=
 =?utf-8?B?QzNRQm4yWE9NMld2MXhQa0hNTTJZUFZLN29IbkdhVit3ZWI0OTFVdHcwT2RX?=
 =?utf-8?B?U2hkL2I2c1hqb3RkcTVRUmk1bVZMOFJ6dVVOYkV5ZHNMZjRTMjZEY0hqT3Fn?=
 =?utf-8?B?WmpQdVlJSHp5WE5mdVN2V2Q3RjZGeTVqeW9USkt6RTlkdmphcHV0RXFFSms4?=
 =?utf-8?B?ZElxbVcrVVVrdlYvS2lPTGxZSk9SelVjUTFKdGt6d0RmdUlsMzI1WDF6MDVU?=
 =?utf-8?B?ZXdtTDR5YjFCcThMNVFqTkNKbUUyRlVtYWhIbUxNU2liT0lIaG1FaG0rYlE1?=
 =?utf-8?B?VTRJc1FRZm1wMGRRWWVmTnRjSEI1eVdtOTBNWjZDUG5jOWRYQTBTN2gwUGM5?=
 =?utf-8?B?ZmFjbVc3T21CemdjcHpIMk5hTHBoalJKdUtkYk9xaDVtRDFZcDh0U3JXRTNI?=
 =?utf-8?B?ZWVpbFl1N1FXQng1clJHa0dFNk8vSGpYQ25pK0tXMzl4UXI3V1E5NENSdnN2?=
 =?utf-8?B?dnFFMmZhbDV5Q3J4QUlIK0xpb2ZmSlh6VVFvWXExNjhFejczYUFaK1JjUmlh?=
 =?utf-8?B?c29zU04rbDJHVHZWb09IRnkzaWZjcW5DWTdXaXZoMGhoUnBSTHp2VzZuVFc2?=
 =?utf-8?B?eUFvdHJlNHJCd00yOUp5eXl3TVBzTVhHaExkeHhudU56VnZrVnI1UWdKeHph?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qwjWoOzjVoowy6crUCxQVaJ1"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0648c9-a2d6-40eb-b8a0-08dcec5bc9d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 14:23:35.1633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0f5y3S+/0FEssFdoLnT2NYYgVDW3ClLtrk5pl9KqjcZlLoRgxW+Z/6RFuqbrxxLwGZ065c7BPeoRztxf1zWstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3569
X-Authority-Analysis: v=2.4 cv=LbZu6Sfi c=1 sm=1 tr=0 ts=670d296a cx=c_pps
 a=fMXg3PN8hKgTqCYPrQuxSw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=E0pLgM0HJGh-r-XSUJMA:9
 a=QEXdDO2ut3YA:10 a=sEnSv1DDc_9R21KruKkA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: WRWMUomBiqf3y8HQAbVZYpP_TD0pN7Q_
X-Proofpoint-GUID: WRWMUomBiqf3y8HQAbVZYpP_TD0pN7Q_
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

--------------qwjWoOzjVoowy6crUCxQVaJ1
Content-Type: multipart/mixed; boundary="------------czh38hws900xlKBHLx9U0ESy";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <48476abf-2def-4d83-87a3-8cbd8eb9db3b@imgtec.com>
Subject: [PATCH v2 2/2] drm/imagination: Break an object reference loop
References: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
In-Reply-To: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>

--------------czh38hws900xlKBHLx9U0ESy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Brendan King <brendan.king@imgtec.com>

When remaining resources are being cleaned up on driver close,
outstanding VM mappings may result in resources being leaked, due
to an object reference loop, as shown below, with each object (or
set of objects) referencing the object below it:

    PVR GEM Object
    GPU scheduler "finished" fence
    GPU scheduler =E2=80=9Cscheduled=E2=80=9D fence
    PVR driver =E2=80=9Cdone=E2=80=9D fence
    PVR Context
    PVR VM Context
    PVR VM Mappings
    PVR GEM Object

The reference that the PVR VM Context has on the VM mappings is a
soft one, in the sense that the freeing of outstanding VM mappings
is done as part of VM context destruction; no reference counts are
involved, as is the case for all the other references in the loop.

To break the reference loop during cleanup, free the outstanding
VM mappings before destroying the PVR Context associated with the
VM context.

Signed-off-by: Brendan King <brendan.king@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v1 -> v2:
 - None
---
 drivers/gpu/drm/imagination/pvr_context.c | 19 +++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h | 18 ++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm.c      | 22 ++++++++++++++++++----
 drivers/gpu/drm/imagination/pvr_vm.h      |  1 +
 4 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/=
imagination/pvr_context.c
index 255c93582734..4cb3494c0bb2 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -450,11 +450,30 @@ pvr_context_destroy(struct pvr_file *pvr_file, u32 =
handle)
  */
 void pvr_destroy_contexts_for_file(struct pvr_file *pvr_file)
 {
+	struct pvr_device *pvr_dev =3D pvr_file->pvr_dev;
 	struct pvr_context *ctx;
 	unsigned long handle;
=20
 	xa_for_each(&pvr_file->ctx_handles, handle, ctx)
 		pvr_context_destroy(pvr_file, handle);
+
+	spin_lock(&pvr_dev->ctx_list_lock);
+	ctx =3D list_first_entry(&pvr_file->contexts, struct pvr_context, file_=
link);
+
+	while (!list_entry_is_head(ctx, &pvr_file->contexts, file_link)) {
+		list_del_init(&ctx->file_link);
+
+		if (pvr_context_get_if_referenced(ctx)) {
+			spin_unlock(&pvr_dev->ctx_list_lock);
+
+			pvr_vm_unmap_all(ctx->vm_ctx);
+
+			pvr_context_put(ctx);
+			spin_lock(&pvr_dev->ctx_list_lock);
+		}
+		ctx =3D list_first_entry(&pvr_file->contexts, struct pvr_context, file=
_link);
+	}
+	spin_unlock(&pvr_dev->ctx_list_lock);
 }
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/=
imagination/pvr_context.h
index a5b0a82a54a1..07afa179cdf4 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -126,6 +126,24 @@ pvr_context_get(struct pvr_context *ctx)
 	return ctx;
 }
=20
+/**
+ * pvr_context_get_if_referenced() - Take an additional reference on a s=
till
+ * referenced context.
+ * @ctx: Context pointer.
+ *
+ * Call pvr_context_put() to release.
+ *
+ * Returns:
+ *  * True on success, or
+ *  * false if no context pointer passed, or the context wasn't still
+ *  * referenced.
+ */
+static __always_inline bool
+pvr_context_get_if_referenced(struct pvr_context *ctx)
+{
+	return ctx !=3D NULL && kref_get_unless_zero(&ctx->ref_count) !=3D 0;
+}
+
 /**
  * pvr_context_lookup() - Lookup context pointer from handle and file.
  * @pvr_file: Pointer to pvr_file structure.
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
index 97c0f772ed65..7bd6ba4c6e8a 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
=20
+#include <linux/bug.h>
 #include <linux/container_of.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -597,12 +598,26 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, b=
ool is_userspace_context)
 }
=20
 /**
- * pvr_vm_context_release() - Teardown a VM context.
- * @ref_count: Pointer to reference counter of the VM context.
+ * pvr_vm_unmap_all() - Unmap all mappings associated with a VM context.=

+ * @vm_ctx: Target VM context.
  *
  * This function ensures that no mappings are left dangling by unmapping=
 them
  * all in order of ascending device-virtual address.
  */
+void
+pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
+{
+	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
+			     vm_ctx->gpuvm_mgr.mm_range));
+}
+
+/**
+ * pvr_vm_context_release() - Teardown a VM context.
+ * @ref_count: Pointer to reference counter of the VM context.
+ *
+ * This function also ensures that no mappings are left dangling by call=
ing
+ * pvr_vm_unmap_all.
+ */
 static void
 pvr_vm_context_release(struct kref *ref_count)
 {
@@ -612,8 +627,7 @@ pvr_vm_context_release(struct kref *ref_count)
 	if (vm_ctx->fw_mem_ctx_obj)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
=20
-	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
-			     vm_ctx->gpuvm_mgr.mm_range));
+	pvr_vm_unmap_all(vm_ctx);
=20
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagi=
nation/pvr_vm.h
index f2a6463f2b05..79406243617c 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.h
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -39,6 +39,7 @@ int pvr_vm_map(struct pvr_vm_context *vm_ctx,
 	       struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
 	       u64 device_addr, u64 size);
 int pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 siz=
e);
+void pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx);
=20
 dma_addr_t pvr_vm_get_page_table_root_addr(struct pvr_vm_context *vm_ctx=
);
 struct dma_resv *pvr_vm_get_dma_resv(struct pvr_vm_context *vm_ctx);
--=20
2.47.0



--------------czh38hws900xlKBHLx9U0ESy--

--------------qwjWoOzjVoowy6crUCxQVaJ1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZw0pZgUDAAAAAAAKCRB5vBnz2d5qsBVY
AQCX4MCRm1DhkcSZXlm8cA8Z79i+VF4RJ2tFWf3sU8sBGgD6A+JxFpH/2pyBJaMwbcKX/5SQ6HKa
7rGqLyHoxppggwE=
=i8Pd
-----END PGP SIGNATURE-----

--------------qwjWoOzjVoowy6crUCxQVaJ1--

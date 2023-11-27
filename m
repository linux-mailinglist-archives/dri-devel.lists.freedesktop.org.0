Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B07F9DFD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 11:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142C010E23A;
	Mon, 27 Nov 2023 10:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Mon, 27 Nov 2023 10:56:53 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63810E230
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 10:56:53 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AR7ObwZ026095; Mon, 27 Nov 2023 10:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=Mb0KNZfkrZIu1LiVxU5AyD9kEeXUjrKv9waPCR+9VFI=; b=
 b24K4ET3rLIsyA6fphGLY37QbJMNYRF+HfBlabkbSeDwJpVkFtvzQzvZgEF53/8n
 4lFoQgu2/1ezIuHSnkZTzFfkaoDH1YkjJvucOah7S/jfq36Dj5nnGxeuNjz2yj39
 4K0Qko5SkddLUgQLuhyMmYP5DIf+lAFN1Yghx/QkB7v7Ef0OUE7RQVX9zwAqd4IY
 BZb1FERJoEL6R5e/iM4Rj+q62D4hPQ+J+G5Wk+ck33xbA/We0QSp7BbZcyYgVyi0
 M+0Bcd1GHjgMlIpGXPKPXlk896h/I9f8GUkFgPUgT3/Ws9RKGukzkqXoxsvclgL9
 EI2iCA3omFCaR2sTFwNPMA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uk82sha5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Nov 2023 10:40:24 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 10:40:23 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Mon, 27 Nov 2023 10:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYpAHtnqAYFLb2QgE5CQ4vQGTCGNrOkV2kre6EwDF0nll1dhLu7fpRV+4UsFGUo3wKlLnKNM3JNlRjeJtAwFqAPWWTfgCE391U2mcK9fXLKe3HAaID3rNGOYNFcpm5+6HBjOq+JbpvR8m4BadYK2GXvv8HAMaYN9K10Ndo790cOLgPYfNwlAjgt54EWM9WlpatdUqfzR5EMY2tB40bZmn2SP88bMeuRb0ZFnihFv0xFPjS1G58Q5eBeig69jYSsGia+bxXCjzj9DIqGczdPmLH4DKX/joOevypnIimJHPvIlZXSBeY6lfINJXRdkf+OoT8uQRg7Dr5iewZetHJ8zDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mb0KNZfkrZIu1LiVxU5AyD9kEeXUjrKv9waPCR+9VFI=;
 b=epAcsjuT6bgFDleHifLkYCkuPMYQDQrH1NS6NyYHoVRC3WfhRxAJO19C4Vqezb4ewqs+NXWjCXpHKtRZ2R/X3KcO1RwIN5KFjynN953ylu+UGIBK0JqNTwvVLNjyKEA/jaLWSCKG2m7G9ea6/tlk3KkpBNZaBujD3izaIF82sX169M9ai0WkuwphzFeAI4CDhmqX4TkQ6VaHrmskSTHv5FuaP+8FQNxPNPw0lHHUEIpPepht4NZf4X7gzHuK6r1fBwLutruebcrhDKdyjN2p5h+8pmPMjh5HMAq8U5MlJvSMRCHxx1DFqWqEVOn4smCbx4zx+v35JCO9MhX4W9OCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb0KNZfkrZIu1LiVxU5AyD9kEeXUjrKv9waPCR+9VFI=;
 b=Qc0nwLIrYBepD1bAAGvY/llxKeR85o+rj1ytlxUTAMtGZWZGOdzzQtbCzAbuTClxo/aV8GrtFlFrogqT1JN+d+Hn0PGBLwGE3SfPefuEO7EILJ0X70KRJy6tAkhR0w84dqWVwPOstCJibuy3KMdVuD5HJP6R6uichiow85nr094=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LOYP265MB1838.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Mon, 27 Nov
 2023 10:40:23 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:40:22 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, Donald Robson
 <Donald.Robson@imgtec.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "colin.i.king@gmail.com" <colin.i.king@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH][next] drm/imagination: Fix a couple of spelling mistakes
 in literal strings
Thread-Topic: [PATCH][next] drm/imagination: Fix a couple of spelling mistakes
 in literal strings
Thread-Index: AQHaIR4fozIACA5n80yTD+74aC97IA==
Date: Mon, 27 Nov 2023 10:40:22 +0000
Message-ID: <e0575791d72a69fec7100d17a9232641f7a4c836.camel@imgtec.com>
References: <20231124163917.300685-1-colin.i.king@gmail.com>
In-Reply-To: <20231124163917.300685-1-colin.i.king@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LOYP265MB1838:EE_
x-ms-office365-filtering-correlation-id: 45fc0f91-a1b9-4df0-9f18-08dbef354251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /lJ756Tt/BjDXT51Xwg1fjvb92mVluYIUHaAUssV2MqGZabN6HYSL6TGsV2YX4aWSw9yrrZ2mGWLl4hDXlWLmtWQfwo5MEcMAUuKGcdeHTqNdaWOfofroIX+AYz0CcZkKH9qeq+bZLm82vBvAzuH56oDh0Ts24VK5yip+HD+wnaa6qPDs2vQu9pihwWwwcWYPwEOHqf1/3v1aAXxtoQx9yQbi8CGD+HlwL+/XXzDft+96eUU9f/3jdIJcFmD6l6oj3hB4H3cBdsBXQL/L3s0I/Wl/56jBQAcSwxZDif8qyCDECRav/XuUs/UvopYLTkFWVkZ1/6RNDe2AMuNh3eSdHnZqkRiORfq064PMEfz7wuWmOXxmZfMbTmYu6gJmAwr6Yntdgqh2TVj6Yi7OFrbNawELql90tAakU/eETpK3YdiREnjD5SaMn7+PhW6jqQnHpcmp1ifxJImi6GlcoFbOv4t02+hpb7M0/g89ya1KfSNBv9BJyKMxA1FmeSvSqeRlCjFGK6s1LHsqP9034DcK8tJmWenXPlBzGXlHoNyRKUSyZDfBRjFyn2vjfSxQoNKicSWlaT/kCdXU9Aozel22QnZXBUVeKPlRzQI3RTW284j7d0FLjBSPPND7+bR5gnh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39840400004)(136003)(366004)(376002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(4001150100001)(41300700001)(5660300002)(2906002)(8676002)(8936002)(4326008)(66446008)(66946007)(54906003)(316002)(6512007)(66556008)(66476007)(76116006)(110136005)(6486002)(478600001)(64756008)(71200400001)(36756003)(2616005)(6506007)(38070700009)(26005)(83380400001)(38100700002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0VKb2RmaGlzczkwWUptQlFtODFIRVFjUCt2OEJGUi8wYzZ5TlNKMTlNVlY1?=
 =?utf-8?B?U3h6M1pKb3hCc0dOMTJWOE1DdmdTWUR1a3ZvMDVnaTN2b2UrdDVkaUdkVkVS?=
 =?utf-8?B?bENZYVkxdjAyY3pxY25HeVJNRUFlWUI1ZklXWVlhdDV6SERGVTMzdWtWZFpG?=
 =?utf-8?B?aGhTbW1ZdmVwOUxpQmhpVVR6ZXN1aDdYdHdKejhrYWVZdGNhbVRNOGdhTnJt?=
 =?utf-8?B?NTdpZ2hETk1PcXVrZVd5cU56ejRzb0k2MU41ZTBETE5ic0crdUFLdmxsR01W?=
 =?utf-8?B?YkRaMnh3TCtqbjVGMW9YbFM1UFZkblBrYit1OGxkVlRLWXdyQjJzWkVJUEli?=
 =?utf-8?B?VVl0TFgxMnBJZ0hWc1Jpa0t3ZnFoeE5tcFhrNVJ0MnJ6b1hsVjEwRjZHZnZm?=
 =?utf-8?B?dE9mZ2RCaWlNK3VMaHRNOUkvSGVQMlN3OGJSd3RzeVViUnBOcXhUM3FXMWV3?=
 =?utf-8?B?NVdzb1gxOW8wNU1odWFDeUx2eUZzY2RwMGF6Tkdwa3NabVF4MEcydyt3dnFj?=
 =?utf-8?B?eGRtRVVldkNRclZjcXpLU2xqSG5CTkFmK0R5dVBWeXlmY3I0aGNvTzR0MTJz?=
 =?utf-8?B?UVlmcWxUUkNJclkrSjZ1TmpGM1J0aVBzZlJsOWpUV2FPdThYRDlnWWxkd1Ja?=
 =?utf-8?B?Q3RUZnhWZGREZi9pejdFRlptdTVSajM2bmZBWS9aakI0ZUN3UXZqWkoyd3ZK?=
 =?utf-8?B?QnhLUkhicHEvV2R6U2pqTmRHb05oVm1XempYSDJlT1dFTDczdVZCZENoS2FE?=
 =?utf-8?B?eTUxV3dLbUFvdGRZY0RNVFJOZFVrSjFVNCtJdVVBeVZRTHU5N3Y4ZUZQTVJr?=
 =?utf-8?B?ajdtcElNOWd6cEdwdHJvak1VeXhxOVhCZS91WFl5M1JpQzNOVStHRDQwTFJk?=
 =?utf-8?B?TUdSdG5xc1R2QTZBRlh1aXNjTFJsM2pxOWdzSGNJNjFYUCs1OEVLaDh6UGhJ?=
 =?utf-8?B?SS96RVVrdkw2UjE2eTRCd0NOM1dhOHBXcm85WWFZRUduanNuUEFrOFBWVSs4?=
 =?utf-8?B?cVV2TExSUmxYVlovNGkwOThUNGI4UkFBQW1zVkdBWDd6KzdNVEFtQXY0T1Q3?=
 =?utf-8?B?QXRhT0NmSy8vMy9rNU5yNSt1M014dEw5dkpud2psWHYrbjdrUW0xZVlVZFBw?=
 =?utf-8?B?dGdwV1BJWFIzMTdZY1BNejRsTTJSSUMwZWlGMkVmU2xJV0xSK1dLNTFHN2Na?=
 =?utf-8?B?RG1EaXg5R3UxM3ZNVWpGUEVzTmVyTWZmbVBaTzNVRlZ0cVI2eU5mN0pUdXo3?=
 =?utf-8?B?ZmpvNzZ2T0FXckRMVXZ2VG1ZQjFEcTIwUlhBMzh6Wk9laEtUdmRrZXg1ZVV1?=
 =?utf-8?B?VFRGWVM4R0F5V3JKRDh4WTBjTE9aeWlhNE1tdlRLWjl3TWEzWWt1aFM5dGhN?=
 =?utf-8?B?TkpEYVE5aEdMaVhIYjVDZVdYSVpSMU9LbjZjMW9TWWd0N2lVWGZCZithQUUx?=
 =?utf-8?B?MDNVbnN0UHBBdGtIM2VWV3Q4cVZjTUJDRzROTk5XV0VCeFhvOFFJR1NxK3ZO?=
 =?utf-8?B?OFFTdUlvSTI4anNkNk9mMUJvUzNuMEtxejJhQ0R6R2hobTJOeXRwbmdaUnQ1?=
 =?utf-8?B?VUNTbjRGZlVwakJzbE9xUS84MG10ck1TeHdjMWowOVlta0dOSGZMam1DUW1V?=
 =?utf-8?B?UkVGdDJ2WkFSaXdIbXc3NkZTV1dzREZoVjlWWjhvNkt1TEVXT2hLTTR1MTR0?=
 =?utf-8?B?U0JRRGx6dkFlUDhqaXZwY0tic2huSTIvK3kza3FOY1RFdnVtVEJuOFlsZEFC?=
 =?utf-8?B?dVRoVVlvOGkyNmlwRkNzTm5oWmN3UncrMm1FaUxXdnMwTVdYZUNHUmw2VE14?=
 =?utf-8?B?VFNkK3BNczR6UWU2QTlMa08vcTdMVFRYNks1WDNRVEZkT1JKeVVsbDIrWm1R?=
 =?utf-8?B?N2VidTJxWWVVMlEvUDNkZWJIUk1DUDZiVEdTMXg3S1ZTcXRDcGxjdTVRQm0y?=
 =?utf-8?B?MnMvS3hYZG1ZczYwUkhjeVVGVEUzOXZPYWpOZyt2TDlqeDVucFdFU0pvZENR?=
 =?utf-8?B?MUVQSnJzZS9Xc2Q1TVkvbUNTck1XTnNPa0FsbFQ1WTl5aHhzMFBFdXdYck5W?=
 =?utf-8?B?TDNiOXdpYzZhQm04RjFLdHJMbUltQ3UybGVhRU1GYWF2WjlKK2hzNkhHK1hD?=
 =?utf-8?B?bWxIMEljSXN0emdhK1ZKYWsyc1pDdTR4QzA0TWp6c3owbG5DMWlSUGdiWDVS?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39EB98C3C99ED440AF6DAF83E24DEBA4@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fc0f91-a1b9-4df0-9f18-08dbef354251
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:40:22.7440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMOuIA1ueFkuHkT5pojNgBOd6Hz37EZCoQLn2g4SoBID9p85c1nk7MPb/VuHNgVAefg60oH+t+m7z/uslnDVjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1838
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: QGkkkpkmA6mq39Hs3UBhyJuvbV_Rgkwz
X-Proofpoint-GUID: QGkkkpkmA6mq39Hs3UBhyJuvbV_Rgkwz
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29saW4sDQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KDQpPbiBGcmksIDIwMjMtMTEt
MjQgYXQgMTY6MzkgKzAwMDAsIENvbGluIElhbiBLaW5nIHdyb3RlOg0KPiBUaGVyZSBhcmUgYSBj
b3VwbGUgb2Ygc3BlbGxpbmcgbWlzdGFrZXMgaW4gbGl0ZXJhbCBzdHJpbmdzIGluIHRoZQ0KPiBz
dGlkX2ZtdHMgYXJyYXkuIEZpeCB0aGVzZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5pLmtpbmdAZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogRnJhbmsgQmlu
bnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
aW1hZ2luYXRpb24vcHZyX3JvZ3VlX2Z3aWZfc2YuaCB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3JvZ3VlX2Z3aWZfc2YuaCBiL2RyaXZlcnMv
Z3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcm9ndWVfZndpZl9zZi5oDQo+IGluZGV4IDU3MTk1NDE4
MmYzMy4uNTZlMTEwMDllMTIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX3JvZ3VlX2Z3aWZfc2YuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX3JvZ3VlX2Z3aWZfc2YuaA0KPiBAQCAtNDk3LDcgKzQ5Nyw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgcm9ndWVfa21fc3RpZF9mbXQgc3RpZF9mbXRzW10gPSB7DQo+ICAJeyBST0dV
RV9GV19MT0dfQ1JFQVRFU0ZJRCgyMTMsIFJPR1VFX0ZXX0dST1VQX01BSU4sIDEpLA0KPiAgCSAg
IlNhZmV0eSBXYXRjaGRvZyB0aHJlc2hvbGQgcGVyaW9kIHNldCB0byAweCV4IGNsb2NrIGN5Y2xl
cyIgfSwNCj4gIAl7IFJPR1VFX0ZXX0xPR19DUkVBVEVTRklEKDIxNCwgUk9HVUVfRldfR1JPVVBf
TUFJTiwgMCksDQo+IC0JICAiTVRTIFNhZmV0eSBFdmVudCB0cmlnZ2VkIGJ5IHRoZSBzYWZldHkg
d2F0Y2hkb2cuIiB9LA0KPiArCSAgIk1UUyBTYWZldHkgRXZlbnQgdHJpZ2dlcmVkIGJ5IHRoZSBz
YWZldHkgd2F0Y2hkb2cuIiB9LA0KPiAgCXsgUk9HVUVfRldfTE9HX0NSRUFURVNGSUQoMjE1LCBS
T0dVRV9GV19HUk9VUF9NQUlOLCAzKSwNCj4gIAkgICJETSVkIFVTQyB0YXNrcyByYW5nZSBsaW1p
dCAwIC0gJWQsIHN0cmlkZSAlZCIgfSwNCj4gIAl7IFJPR1VFX0ZXX0xPR19DUkVBVEVTRklEKDIx
NiwgUk9HVUVfRldfR1JPVVBfTUFJTiwgMSksDQo+IEBAIC0xMTE0LDcgKzExMTQsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHJvZ3VlX2ttX3N0aWRfZm10IHN0aWRfZm10c1tdID0gew0KPiAgCXsg
Uk9HVUVfRldfTE9HX0NSRUFURVNGSUQoMzksIFJPR1VFX0ZXX0dST1VQX1NQTSwgMiksDQo+ICAJ
ICAiM0RNZW1GcmVlIG1hdGNoZXMgZnJlZWxpc3QgMHglMDh4IChGTCB0eXBlID0gJXUpIiB9LA0K
PiAgCXsgUk9HVUVfRldfTE9HX0NSRUFURVNGSUQoNDAsIFJPR1VFX0ZXX0dST1VQX1NQTSwgMCks
DQo+IC0JICAiUmFpc2UgdGhlIDNETWVtRnJlZURlZGVjdGVkIGZsYWciIH0sDQo+ICsJICAiUmFp
c2UgdGhlIDNETWVtRnJlZURldGVjdGVkIGZsYWciIH0sDQo+ICAJeyBST0dVRV9GV19MT0dfQ1JF
QVRFU0ZJRCg0MSwgUk9HVUVfRldfR1JPVVBfU1BNLCAxKSwNCj4gIAkgICJXYWl0IGZvciBwZW5k
aW5nIGdyb3cgb24gRnJlZWxpc3QgMHglMDh4IiB9LA0KPiAgCXsgUk9HVUVfRldfTE9HX0NSRUFU
RVNGSUQoNDIsIFJPR1VFX0ZXX0dST1VQX1NQTSwgMSksDQo=

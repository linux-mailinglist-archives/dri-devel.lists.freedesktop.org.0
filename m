Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE5A44662
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690EA892AA;
	Tue, 25 Feb 2025 16:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="U0MRBMSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010013.outbound.protection.outlook.com
 [52.103.67.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FCB892AA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWGIbtutUUGWNovSBzxFOtCSBPtsOaA/JEy/x9R8y3xi5i+rpIdvciX7YfUJhZPaJUJOS+bF3CI4jxCVslraUFLIEExGwk9TpdFov7homuhcs1qKRq1PSZ9ZjbCBvhd10eTQpoSeMZxgtU0z7O3X9jTzeHQz8NZR5RvBIoGRB01ANn7Uvhc9zjirrDkFOCFXYyjAX8v6z7pXS3ZFdRQD4n0IoLn75YJIx6e8/tOudqTWSpH7Ip4c0Qq+FVtVJMM1KiptIgY58wQ5LNtwG7a78PYfd7POjYXaZQXqiKkF9982+v6GGl/opm07e8gubFM67JMvsFsO/xGjN37mdjiTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szNc/GRz3caln/7NrDu/S+0B7Sju4pYHaDwtIVxlWm4=;
 b=QSFZGMVziRQMX9USrLLpqDC/ucK+6mkQbTUZPXWHFlLN0Zeo/37ZzZN7YabSyFGsgNfQfqVHRW9xClLhNITjjJPFSDXZVoJMY4vHBqkITzE6GiX4sk9DzhweEh2X0nL3oaeG1Y7epYoh4AFmwo5My3qA1TU4AYRsdHq2FkCEJ0jr2sN9RrtGlWn3Td0ptXCQaVvWFYUSBSvL609Qn+c0ZtrzDZ/0Y8RYR3uwIEH6axEm59tP8cU07fF+5heHbFc+Kz5ESyMbU0CswDtC25oJTACxrFvZ8zAUDvb4b8NEzCRPzWtELSGTtvceeDIUPdQg1wp3JRAzK0Am5p1OCLXHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szNc/GRz3caln/7NrDu/S+0B7Sju4pYHaDwtIVxlWm4=;
 b=U0MRBMSm9W/6sRXdKtc3ziueFqLXcCKrVi/huB+NCkXGuxUjkEceBLcX7N6npkfcVExWL27W0FaejWvvEkndgbU5GQXH36uCgsrUnWsdJyoyEhnMyJpFwqv6YSt+gfac3qLEnyt2znENIcP5AgkYjxxZTlRMY7F+Qj3ZxT2fzhi4EtLICW/96fnYxQrpwK8e1pBOFSHcz04lF5AM3B4me0v6zh1EBJDDAAEdiAmj/aCqeqROdoVi03wFQSLACLrMWKvuhr58X8Q5Qme7ItWPyv9M9GtTSuJbVaIwE0ARHnlSTYiwGckPvAcH0YwA9QNFnrSibKPV2yEa/F9ppkKEpw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9876.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:40:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:40:54 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi
 <admin@kodeit.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAXooCAADE6yoAAFCiAgAAAtSqAAAjSgA==
Date: Tue, 25 Feb 2025 16:40:54 +0000
Message-ID: <5C84C111-B1F1-4B6C-9671-559F6E1BDB78@live.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
 <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <28e67cc5-6932-48ac-84ef-93af893b2ed9@suse.de>
 <PN3PR01MB9597AC25AAC82FC9BAC0598AB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597AC25AAC82FC9BAC0598AB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9876:EE_
x-ms-office365-filtering-correlation-id: 7477f048-ae24-4b74-b102-08dd55bb2c65
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|7092599003|15080799006|6072599003|461199028|440099028|3412199025|10035399004|4302099013|41001999003|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?cmgzd01ROGJneTYxdUFiZXZ4dHE2enlTU0owQjRPcW82eWM2dG9aTGVyV3k5?=
 =?utf-8?B?b3M4cEV4U3g3bWhVZVFML1RxVjdUZmM1UlpHMXc1SUtFeVlMVFRDbzJvRity?=
 =?utf-8?B?ditId3Nmem1xVTY1byszMmFRMVhDMis5VW9WbW8zUC9hRHpZRGpPczFXZzlq?=
 =?utf-8?B?eHlSNVZMOW82OFZPQTc5cUFib2hpeWRiRFduSEJBM1Q5bXE3RzBQZkpWZG05?=
 =?utf-8?B?SkQ0OUFaZHFSMlpmTU5WbFhwQUFBT1JUZzA2aXZjbVdMRWlUWGhYU2ludllx?=
 =?utf-8?B?b1dEN1hWZ3pzSi9pS1U3cUJ1a2gxUXIyYVYvaXNLRXlyd0M0S04vTXZHRXds?=
 =?utf-8?B?WjBqT2RtVytuQU8yWmlmazlSemU0ajlUU3I2eWNvYXFXK0h4NjUyYURVdXpF?=
 =?utf-8?B?SVBQUlIrZ1FCeXBUOEYzOVM2dm1oYkRreTVWV25pZm03YXhJdUU1ZTk5a2dq?=
 =?utf-8?B?SEJlYVpudFBUVDJIVk04MUQvbUxuVGVNd1BUbjZFZC81Z29DQ3hFcExrak9k?=
 =?utf-8?B?RHpBN2dUK1hFWWwxYmJURXVnWStrdVJzQlZuMEdCM2s3RHlPbFRxNzFUV3ZT?=
 =?utf-8?B?Tjk4aGJ2cGZTTDJud3ZBWmwxeWlwRXBMT1NNTk5pS01NZ0twS2xMS1lrUlVi?=
 =?utf-8?B?Z0hLclR4R3ZNWUFRUXN4eExwUWhLdWR3NGhwcGx5Rklsc1ZEUDZMaks4aE1B?=
 =?utf-8?B?YXlrNHZEeElJOW1icWJhRnlxMjY0ZER1aVBRVkkxZ3NVZFk4UWduM3RYQkRy?=
 =?utf-8?B?ZW9GM2dYVytkU0ZwYUdRT01pK04wbG1IbmxrWXVEa3dzRko3dzlMMEdaN01m?=
 =?utf-8?B?MVhJakYrMlY1cmNiQTJodUlzMzdUNmRxc085c3lvK1FxNWIrNUpOLy9TNGJa?=
 =?utf-8?B?eUZGbzNybXJjZ0s4K0FYeDZjdlkyS1FqbjUvaGNKbjM0Y3hHdVQvWm0vbXFX?=
 =?utf-8?B?VHpTbnFYS09YR0F4NUhPRGdOVnR0T05uSzRnb0Evak04VnUwN1JOMys5a2xN?=
 =?utf-8?B?cTJxRG1iVnl5cjNmVExWLzJqaGc0SlZIam0xRzdWUlNDaG1nL2lINkhLYUky?=
 =?utf-8?B?UzVaUGZNbUE5MWxESllwKy9nU2RwMkpRMlJDZzZrOUtkRWtmbnZINUdLTnVS?=
 =?utf-8?B?WkZPa2U1SFFvU1l2YzljLzF1MGtOek0zNTJ4TFFIU0dIWlN1aWNNK3U1QUti?=
 =?utf-8?B?RTk4Z0FxK1FvREM1OFlMdlBLdnk3a2U5eG9xSjcvdy9TS1ZSVlVSVS8xU2k4?=
 =?utf-8?B?MjdYYkpaK3M1WXd5WG1jWGhnSFZZOEUyUC9vRGRHVTFsOTU4M3RJLzJSVHFS?=
 =?utf-8?B?aE80cG9DSWtuSkFFVHh0elVHWk1MZXNUQ3N5aUcva2c3Z3NLdXpONlNGRmdy?=
 =?utf-8?B?TkFqY1R3bDVTdGwxZU1RcEprejNLRStwN3Z3OXoycmIrbnNKMW9LMjVaVTRz?=
 =?utf-8?B?MVIwekN4NnREbDhiMW50NS9SeW9vcnBvQ28rZ2Ixd1EraGc5bi9ZZjNTdVpS?=
 =?utf-8?B?ZEF2YmM4eDY5elF6b0N0Q3lKT01PZzQ3c0hUMjc5U09rTG1zWlZJMmNMeEky?=
 =?utf-8?B?dkR0Z05CaHg2aEk1K0ZnZGJlUDE0Q1hVa1dkenpTS21qMmpQWHMxK2lGTTI1?=
 =?utf-8?B?R21nZXUzZGtET1BDdDc5NGdEUWlhN1EySVlINjlwSE1aaUFvZVlRUmZGRGVU?=
 =?utf-8?B?Q2h4OHlYSmFwTXV2U2hyL2g4N1hXc2ExV25qSXNub0JyUnFxcjE0Z3R3PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czN2c2lVa3dRczM2QTNjeW5ReFBnRUU3ZStNRFBtd3ZZUWtLNnYvR3lzS1Rx?=
 =?utf-8?B?ZUVhdmVma1NVeVNDTmxzR3lGYnczSllNVnY3aG9MR20yY0FYKzR6TzN1Y1Js?=
 =?utf-8?B?ZTgrYUtPZXFCcHI5M1RBS0JWMGV3dENhbU5HbEZ4cUJoYmtPcWJpZnJqK0tC?=
 =?utf-8?B?SkxBRExOc2pObnFWNGh3MW9HZHF6MnB0MVhWY1owN1dUVkhoeExKQmNkMHdV?=
 =?utf-8?B?ZUNwZk8yK05ESnUvRXUwOHFaWVZ5cFBBTXh4b2JNcnRnbUdFeXVSeXFyKzgz?=
 =?utf-8?B?azhIQ2pXUHJVQVVNY0laRlRHS01mVXBsbHI2K21RYm1HdmpObEJlZUhTdER5?=
 =?utf-8?B?V296ZTQ5eDd6RFBGUTd1aTM5TnIvSzIzbzFoaHBhVDhRNmJ3N0xzSlNtUm5m?=
 =?utf-8?B?R1VwU21uUmtBSWNLb1dIa25iWGFBSHhoTUxpSjdEK2xYSEM4ZjNvK3JsUi9s?=
 =?utf-8?B?TUJrMnJvTUpoaWxHM0tIWFR5NHFseU9TdWgwb2FnM1Q2NnBzN21QbUFsTlVF?=
 =?utf-8?B?dVA0SUdDZ1NmNWgvT08zRzFlaGpFN2dPdlg5b2h0dExMdzNkeTdUQVphanI0?=
 =?utf-8?B?K2J5VHprakIxVFYzT2wydGxPZnB2YitwcUg0VUdxRmhWam1qSHF5TGxpeXhk?=
 =?utf-8?B?U0x1Q2lnclBuenZrMjRCTXJVUys3cENOU1NIcU1kVS9TaUVTaTVNUk1sRzhm?=
 =?utf-8?B?Qk4wQjQ1L2U1T1ZxNGFCdFVOMlExcWl4eFE0U2JEamlmV1hlRW9tZFFTcVda?=
 =?utf-8?B?OXFHZGJnc0VmTE1NOXhDS29oditrYjZ2aDVmMHcyMVhHcEQ1RHhJS0htL3lu?=
 =?utf-8?B?VzlpV2kxLy9aUXdMMS8ySWUyZXQwV1NCcm5SZlRCYXYzNzZ1S1BtU0s4SUlm?=
 =?utf-8?B?VHRJRHFZempNb1ZqVDFUZGY2eTdvYzcxR1JZcy82WEFoY2pqam9PNWdHSHpS?=
 =?utf-8?B?aE9aWkFEcVVxcnVwL2xDU0U3MmxDWWcwUjQxR254ZUM3c2sxTkRMMXhvcU80?=
 =?utf-8?B?ZnFUSWpicjRKYkE2Rk1sYmdEdDJ0N3hMQ0NVZW9rSE9qUmVlSzFqN0F5UmQx?=
 =?utf-8?B?ZE1oemEwT3orRjlvT2NKaWtJaE42RkFKT2pTK1Q5M29nbGtJZkFGSVpuY1k3?=
 =?utf-8?B?a2d3eDFQK1pQZm55RVlzSTBuV2taa2Mwd2lVeUdYWFBMbTZVdEFKcFh3NlFa?=
 =?utf-8?B?TGdXOXZ2VS9BNGY4K1hVMStZOTlucnNxU3U1Z1c4WUlFbm41dUpXVWxxZndX?=
 =?utf-8?B?L0ppVU52ZGdDVTVTOFk4V2VEZ2xoWk5Sc1YrRVdkRkRWTW9IdDM1d0hwdCty?=
 =?utf-8?B?YTByK0tSWk8xRDFNYjcwc1psZmxCaGlkWHJXRk5RVWxSQzBYK1RieGhXVDk3?=
 =?utf-8?B?c3V0b3BPamZhTlJ3VldObndVbXordDVGZU1Ma2s5b2YxeTBWS1RJMnRzMG1j?=
 =?utf-8?B?T25xdFRHVXRTcFZLZFJtQXNHVklNZ1JITHM1V0JYVWtFa054MWJSaXpKTm1I?=
 =?utf-8?B?WGw5R256cExGL2JrNDg5TEFDeFY1eis2OU1hQTlWUnRkYjRQcTc5YjFNQnVo?=
 =?utf-8?B?WlVOUTJaTW9VVTJwdXZOQzNLYnJ2N1Y5eG15bjNxMk9jcE4zSDhWeERpUmJo?=
 =?utf-8?B?UUx5RHhzeFFxTy93SVlITGNYMENIbldlV241bmt5WlcvQnJoODArUjJEaG12?=
 =?utf-8?B?aWVrK0FUUGRjalFBQ0trSmtXOXNuSWt5VkUwTVdyR3p3V1NmeURaQ1A4SDJ5?=
 =?utf-8?Q?Y0O29sDtIzN7aCFPGVQ1VHL+4lOu2+fXY37X6Q0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49114E88B71DBA44A98316B9558B37A8@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7477f048-ae24-4b74-b102-08dd55bb2c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 16:40:54.8005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9876
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDk6MznigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAyNSBGZWIgMjAyNSwgYXQg
OTozNuKAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6
DQo+PiANCj4+IO+7v0hpDQo+PiANCj4+IEFtIDI1LjAyLjI1IHVtIDE1OjU0IHNjaHJpZWIgQWRp
dHlhIEdhcmc6DQo+PiBbLi4uXQ0KPj4+Pj4+ICtzdGF0aWMgaW50IGFwcGxldGJkcm1fcHJvYmUo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgdXNiX2RldmljZV9pZCAqaWQpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAgIHN0cnVj
dCB1c2JfZW5kcG9pbnRfZGVzY3JpcHRvciAqYnVsa19pbiwgKmJ1bGtfb3V0Ow0KPj4+Pj4+ICsg
ICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmludGYtPmRldjsNCj4+Pj4+PiArICAgIHN0cnVjdCBh
cHBsZXRiZHJtX2RldmljZSAqYWRldjsNCj4+Pj4+PiArICAgIHN0cnVjdCBkcm1fZGV2aWNlICpk
cm07DQo+Pj4+Pj4gKyAgICBpbnQgcmV0Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIHJldCA9IHVz
Yl9maW5kX2NvbW1vbl9lbmRwb2ludHMoaW50Zi0+Y3VyX2FsdHNldHRpbmcsICZidWxrX2luLCAm
YnVsa19vdXQsIE5VTEwsIE5VTEwpOw0KPj4+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+Pj4+ICsg
ICAgICAgIGRybV9lcnIoZHJtLCAiRmFpbGVkIHRvIGZpbmQgYnVsayBlbmRwb2ludHNcbiIpOw0K
Pj4+Pj4gVGhpcyBpcyBzaW1wbHkgd3JvbmcgKGFuZCBpbiB0aGlzIGNhc2UgZXZlbiBsZWFkIHRv
IGNyYXNoIGluIHNvbWUgY2lyY3Vtc3RhbmNlcykuDQo+Pj4+PiBkcm1fZXJyKCkgbWF5IG5vdCBi
ZSB1c2VkIGhlcmUuIFRoYXQncyBteSBwb2ludCBpbiBwcmV2aW91cyBkaXNjdXNzaW9ucy4NCj4+
Pj4+IEluZGVwZW5kZW50bHkgb24gdGhlIHN1YnN5c3RlbSB0aGUgLT5wcm9iZSgpIGZvciB0aGUg
c2FrZSBvZiBjb25zaXN0ZW5jeSBhbmQNCj4+Pj4+IGJlaW5nIGluZm9ybWF0aXZlIHNob3VsZCBv
bmx5IHJlbHkgb24gc3RydWN0IGRldmljZSAqZGV2LA0KPj4+PiBUaGF0J3MgbmV2ZXIgZ29pbmcg
dG8gd29yayB3aXRoIERSTS4gVGhlcmUncyBzbyBtdWNoIGNvZGUgaW4gYSBEUk0gcHJvYmUgZnVu
Y3Rpb24gdGhhdCB1c2VzIHRoZSBEUk0gZXJyb3IgZnVuY3Rpb25zLg0KPj4+PiANCj4+Pj4gVGhp
cyBzcGVjaWZpYyBpbnN0YW5jZSBoZXJlIGlzIHdyb25nLCBhcyB0aGUgZHJtIHBvaW50ZXIgaGFz
bid0IGJlZW4gaW5pdGlhbGl6ZWQuIEJ1dCBhcyBzb29uIGFzIGl0IGlzLCBpdCdzIG11Y2ggYmV0
dGVyIHRvIHVzZSBkcm1fZXJyKCkgYW5kIGZyaWVuZHMuIEl0IHdpbGwgZG8gdGhlIHJpZ2h0IHRo
aW5nIGFuZCBnaXZlIGNvbnNpc3RlbnQgb3V0cHV0IGFjcm9zcyBkcml2ZXJzLg0KPj4+PiANCj4+
PiBPayBzbyB0aGlzIGlzIGFjdHVhbGx5IGFuIGludGVyZXN0aW5nIGNhc2UsIHNpbmNlIEkgYW0g
dHJ5aW5nIHRvIGZpeCBpdC4gVG8gaW5pdGlhbGlzZSB0aGUgZHJtIHBvaW50ZXIsIHdlIG5lZWQg
dG8gaW5pdGlhbGlzZSBhZGV2LCBhbmQgdG8gaW5pdGlhbGlzZSBhZGV2LCB3ZSBuZWVkIHRvIHJ1
biB1c2JfZmluZF9jb21tb25fZW5kcG9pbnRzIGZpcnN0LiBTbyBJTU8sIHdlIGNhbm5vdCB1c2Ug
ZHJtX2VyciBoZXJlLCBidXQgcmF0aGVyIGRldl9lcnJfcHJvYmUgY2FuIGJlIHVzZWQuDQo+PiAN
Cj4+IE1heWJlIHN0YXJ0IHJlYWRpbmcgdGhvc2UgY29tcGlsZXIgd2FybmluZ3MuIFRoZXkgYXJl
IHRoZXJlIGZvciBhIHJlYXNvbi4gWW91ciBjb21waWxlciB0ZWxscyB5b3UgdGhhdCB5b3UgYXJl
IGRlcmVmZXJlbmNpbmcgYW4gdW5pbml0aWFsaXplZCBwb2ludGVyLCByaWdodCBoZXJlOg0KPiAN
Cj4gVGhlIHRoaW5nIGlzLCB0aGF0IEkgZGlkbid0IGdldCBhbnkgY29tcGlsZXIgd2FybmluZ3Ms
IGV2ZW4gd2l0aCBzcGFyc2UuDQoNCkV2ZW4gdGhvdWdoIEkgcmVhbGx5IGRpZG4ndCBnZXQgYW55
IGNvbXBpbGVyIHdhcm5pbmdzLCBhbmQgdGhlIGRybV9lcnIgd2FzIGFjdHVhbGl0eSB3b3JraW5n
IHdpdGggZHJtIHVuaW5pdGlhbGlzZWQgKGl0IGp1c3Qgc2hvd2VkIE5VTEwgaW4gcGxhY2Ugb2Yg
YXBwbGV0YmRybSksIEnigJl2ZSBzdGlsbCBjbGVhcmVkIGl0IHRvIE5VTEwgYW5kIHNlbnQgYSB2
NjoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzBCQUIyNkJFLTVCQjYtNDY3
Ri1CRUQzLTlBQThERTI1NDMzQkBsaXZlLmNvbS9ULyN0DQoNCg0KPj4gDQo+PiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMy40L3NvdXJjZS9pbmNsdWRlL2RybS9kcm1fcHJp
bnQuaCNMNTg2DQo+PiANCj4+IENsZWFyaW5nIHRoYXQgcG9pbnRlciB0byBOVUxMIHdpbGwgZml4
IHRoZSBlcnJvciBhbmQgbWFrZSBkcm1fZXJyKCkgd29yay4NCj4+IA0KPj4gQmVzdCByZWdhcmRz
DQo+PiBUaG9tYXMNCj4+IA0KPj4+PiANCj4+Pj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+
Pj4+ICsgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGFkZXYgPSBkZXZtX2RybV9kZXZfYWxs
b2MoZGV2LCAmYXBwbGV0YmRybV9kcm1fZHJpdmVyLCBzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2Us
IGRybSk7DQo+Pj4+Pj4gKyAgICBpZiAoSVNfRVJSKGFkZXYpKQ0KPj4+Pj4+ICsgICAgICAgIHJl
dHVybiBQVFJfRVJSKGFkZXYpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGFkZXYtPmluX2VwID0g
YnVsa19pbi0+YkVuZHBvaW50QWRkcmVzczsNCj4+Pj4+PiArICAgIGFkZXYtPm91dF9lcCA9IGJ1
bGtfb3V0LT5iRW5kcG9pbnRBZGRyZXNzOw0KPj4+Pj4+ICsgICAgYWRldi0+ZG1hZGV2ID0gZGV2
Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGRybSA9ICZhZGV2LT5kcm07DQo+Pj4+Pj4gKw0KPj4+
Pj4+ICsgICAgdXNiX3NldF9pbnRmZGF0YShpbnRmLCBhZGV2KTsNCj4+Pj4+PiArDQo+Pj4+Pj4g
KyAgICByZXQgPSBhcHBsZXRiZHJtX2dldF9pbmZvcm1hdGlvbihhZGV2KTsNCj4+Pj4+PiArICAg
IGlmIChyZXQpIHsNCj4+Pj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBnZXQg
ZGlzcGxheSBpbmZvcm1hdGlvblxuIik7DQo+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4+
Pj4+PiArICAgIH0NCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX3NpZ25h
bF9yZWFkaW5lc3MoYWRldik7DQo+Pj4+Pj4gKyAgICBpZiAocmV0KSB7DQo+Pj4+Pj4gKyAgICAg
ICAgZHJtX2Vycihkcm0sICJGYWlsZWQgdG8gc2lnbmFsIHJlYWRpbmVzc1xuIik7DQo+Pj4+Pj4g
KyAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+PiArICAgIH0NCj4+Pj4+PiArDQo+Pj4+Pj4gKyAg
ICByZXQgPSBhcHBsZXRiZHJtX3NldHVwX21vZGVfY29uZmlnKGFkZXYpOw0KPj4+Pj4+ICsgICAg
aWYgKHJldCkgew0KPj4+Pj4+ICsgICAgICAgIGRybV9lcnIoZHJtLCAiRmFpbGVkIHRvIHNldHVw
IG1vZGUgY29uZmlnXG4iKTsNCj4+Pj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4+ICsg
ICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIHJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZHJtLCAw
KTsNCj4+Pj4+PiArICAgIGlmIChyZXQpIHsNCj4+Pj4+PiArICAgICAgICBkcm1fZXJyKGRybSwg
IkZhaWxlZCB0byByZWdpc3RlciBEUk0gZGV2aWNlXG4iKTsNCj4+Pj4+PiArICAgICAgICByZXR1
cm4gcmV0Ow0KPj4+Pj4+ICsgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIHJldCA9IGFwcGxl
dGJkcm1fY2xlYXJfZGlzcGxheShhZGV2KTsNCj4+Pj4+PiArICAgIGlmIChyZXQpIHsNCj4+Pj4+
PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBjbGVhciBkaXNwbGF5XG4iKTsNCj4+
Pj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4+ICsgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+
PiArICAgIHJldHVybiAwOw0KPj4+Pj4+ICt9DQo+Pj4+IC0tDQo+Pj4+IC0tDQo+Pj4+IFRob21h
cyBaaW1tZXJtYW5uDQo+Pj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+Pj4gU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+Pj4+IEZyYW5rZW5zdHJhc3NlIDE0Niwg
OTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQo+Pj4+IEdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCj4+Pj4gSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo+Pj4+IA0KPj4gDQo+PiAtLQ0KPj4gLS0NCj4+IFRob21hcyBaaW1tZXJtYW5u
DQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCj4+IEZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQo+PiBHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQo+PiBIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg0KDQo=

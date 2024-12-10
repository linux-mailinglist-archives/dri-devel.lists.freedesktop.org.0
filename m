Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EDC9EAFDA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6F010E8AE;
	Tue, 10 Dec 2024 11:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="mMQ/8uj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01olkn2053.outbound.protection.outlook.com [40.92.52.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9368710E021;
 Tue, 10 Dec 2024 06:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfzAS5VY1QJ5lqsxf91Icx/BccUzc9h4zwQl2IVQKivHaZg+VFd5uLN54E8YBa+kDng1LrFso2LhtvvI4XHJwmszNIOrhuaIfUunNB0b+7FOfqOA9aWMPrNoBFNhpX7txjWsaw5MHNbDXsZlUmeAUH3FI8HgvW9ROV9oAt5SPvS4lhvJhLVm/LodMvhDfzAVmRFr5pRtleN2VZelCpquSDYlj2XHovqOc1eb+Bo9xL5xPKjy9QzFKmes6bofP4FF3Dy12OINWrugCjcyF1Mws3qsclY0b/sLwJCVT6WC/rMwEJvKOkxzE1I9unaXxluK2H+ujwnqM396+JlUS/dXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD6A3LWJVHVNZvqh6qhI/63/S994d8rlEW366Qsg6l0=;
 b=JEQ+akcULQSMroDFewW0UsVTIzH4edt3U22aoEXg7NN1JMa6JdBbFDAgRQTa1bX+jS2TZHIPzEPbUVM6O3RcByCoYiVJOg8UhiNgsRccwG/50E0bl/3+PJH7cHiYy8SI8sT+Q2hSWJ5/H05q1mjI1S8KWfFJx0cNnGGLWpAjJdd++JsRrpjbOPhyldYfnHccjHo2MeyY8gvUqxyp3xEp05wpMzUZmA10GibvHpBBKTnXcBMXZ5ge7jxkJL63SbzHdri3+ZRUyxy90Bm1VJTt9mcr8MSE0vX8s2+hXvbEA5zQ6hlGnoSKXeO+L6f7s7JxCaI5Af2b8bm7Mjt/9v72RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD6A3LWJVHVNZvqh6qhI/63/S994d8rlEW366Qsg6l0=;
 b=mMQ/8uj/lDEhPFrgHSX5eIAzd2J/21fULOjtZopfm0Y0PDkJyMyn7BVvHWikx4WzKbUKPrmlUyzFCpxTwPoFNW9PJpom7xkSWzEwKWv7Dn0+fM7l+Us0xKD5XsNXVUJDjFv3QSE+p47i/2Of40S6xrpvao7Nm+pp+BX5FPkmWLGEsUv47mxwIb79rcdJNBnKEeqRGWdss9qqlYbPiBeGQ28XbpipEbNoIZ13XnaYpc99l1CUQ8eJ1q3E1t4Y9PoY8GWFDRSwAkf4bD01tqKQ06jKUY8FgwjVgYw04uzaiKxoBqFC5QfzvipoPBkeJvTK0UppaPAoF7hGmAYqISnSdw==
Received: from PSAPR02MB4919.apcprd02.prod.outlook.com (2603:1096:301:69::6)
 by KL1PR02MB7004.apcprd02.prod.outlook.com (2603:1096:820:103::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 06:17:01 +0000
Received: from PSAPR02MB4919.apcprd02.prod.outlook.com
 ([fe80::68da:6531:5e7d:fe00]) by PSAPR02MB4919.apcprd02.prod.outlook.com
 ([fe80::68da:6531:5e7d:fe00%6]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 06:17:00 +0000
From: =?gb2312?B?4aog1bn2zg==?= <zhanxin0@outlook.com>
To: "kherbst@redhat.com" <kherbst@redhat.com>, "lyude@redhat.com"
 <lyude@redhat.com>, "dakr@redhat.com" <dakr@redhat.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/nouveau: Fix memory leak in nvbios_iccsense_parse
Thread-Topic: [PATCH] drm/nouveau: Fix memory leak in nvbios_iccsense_parse
Thread-Index: AQHbSsq7UwqufV3tAkWbfpsghu8G9Q==
Date: Tue, 10 Dec 2024 06:16:59 +0000
Message-ID: <PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2@PSAPR02MB4919.apcprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR02MB4919:EE_|KL1PR02MB7004:EE_
x-ms-office365-filtering-correlation-id: b1f885c4-0799-4046-e8f1-08dd18e24136
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|15030799003|19110799003|8062599003|6092099012|7071999006|461199028|850799032|13095399003|102099032|440099028|3412199025|26115399003;
x-microsoft-antispam-message-info: JVD06FpvW7QZn8NoEv3dqdjuagQzkYEmQFZNQz70m3xkYfyD5fS5u3FRlXxhnW6+GdR4GqkbB0ELwrrE6FZ72TbsZvgsk1N3Rbrp2+PLfTkVUUrnJZyATupVnoPpUWuBR75sK8nXJHPhiacsWzlBNrJBezXQQt/UyYaaxLwn0FA83P7G1UsQ5vVRLEJXLRcIK2Ifdyx/5PLK05EYdMGjPXu0w+sIsXj4hdtyAFWPnkSK8zoaK3vVMZYYq8EsatKRKtFgNSE5rXKQG3a9K2wvZCchD+z11k6MhroIDpXnbyHnaY1wBYwNV58zum+m8doZxPpk6WAuUzDgZ41LvzP8f9CuPLUjqiJkjasLMl4DMvT3MTpFGMdDpocTbPdlByGWRJVKxTBEsYkF/Sw2IWKR5fbWC+L2LJJCHPh5ic7c6KQXc/UVVLG4YiHW3+wcIUAHCv8t6XyuPYJSLqlpv0UR7Nti1ebasQS3kmJWqS+NUK8DvVZnn0d5w3uEMqULNaCg7oe6/a8YE11ZMqfRNWJd7+xEvVTPIlTlcMHoBDFjTp4wqaNHej0ahH2ttob1corf3P5zhsq/nsYtIUbMkxEIouwqYX3zC3bs0YPMyCP2FK1hEpxvwfqLWKVbXUS5OFGZUMrtvyQC47+2x6GZ43Ikg4LedwsXp5P/7BlCWprJ68mk7j8G6moXScbK5PRRCCEx3/9ioic3Vf2eNt6CVDZRD0ESFWrnLtTkjxZn2mR0dHlh4w1vmtytdN8CoV7uPoiqodw6OgHns3dlaukbWTzY8DD85WKyzNrjU4Nih6lxnImAHaLAzQ+zSgazeWLC/WqS2FblQtH+3Std/uWJtMb/ttWhT8oEvIdr2CIvQaU6onJtslDtCVKJbkdBziqx0bLx
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QmlwY1hxV3BwcHdTU0RScXRSRG1FTkllSmxIbER5NHVzMFM3Z1JUYkI4L2Ns?=
 =?gb2312?B?eXF6dEJRRFlYTC8zWGpBTzBmTGJiTDBXRHV3ZE5PRDdiYU1BMnMrSGxReU1G?=
 =?gb2312?B?d2h5RG1ST013T3c3R1ZZVk0zTmFuZkI5Y0FtUytoZkpZUmVoNC9na3FzV2JE?=
 =?gb2312?B?ekNCN09wTlRLYTJjMmcxZW5OTTlSZ0tVOFZqWW1LTFdRQisva0FTbmJUMHIw?=
 =?gb2312?B?bVVWMWxXZkRzVEN1eVowSWg2UC81dk15ZWpFN0gvZjBxRWt1UENPcGZYaUlW?=
 =?gb2312?B?aFZlZElKV0pUTlRjVVJGVVZ5a1U3WTc5aFhMdGY5ZjNkS3F3WW9qazF6YXVY?=
 =?gb2312?B?RmlCMmNOaTlNQmFqNW50MFk5TEEyQXE0TFlaOEFNVi92K2J0MHBZVkRWYjZS?=
 =?gb2312?B?azR1M3gweEg1cGY5QWRpeE5Id1F0L2JyMjJtQlV1N0YrNEJmcVBtRlI3Tkhn?=
 =?gb2312?B?bVVHbjR6ejRmZXRWdXNWeDRWWGJUM1NBNHZpMUE5RS92SnY0akRRUDhUaHhp?=
 =?gb2312?B?bWRWRTN5R0pRU1VtZDR5QmI0U0xVMmpQWDVXYTRjb2RDNzRQNFczYTJLdVJD?=
 =?gb2312?B?WVB3YmloWk1oSTFuakdoVzhxQ0NyNW1Gc2daZCt6dHg4L2xhbVp0TmFTaytQ?=
 =?gb2312?B?MFVNWWc3REdQZFFaZzhpWkNrMFFoWWZCUkZGRGd1eWk4RlNTUlhIdzluTzJz?=
 =?gb2312?B?SytjeUFTd0pYV1BhM1ZzbFFmeWZxemtZTWNtazVmYm1CWnNldjRCalFRais2?=
 =?gb2312?B?UXQ3cHNXV29qTnBvOVhhZk5sb0NiVXFYYmIwY29XQVNzMmlXZkdyek1hQ011?=
 =?gb2312?B?VU1jNy84bzI4VmRtZjFWaVZXMUd4VUp1TkZEZkJKLzJIZ2NGMGw0MEpwL3Nu?=
 =?gb2312?B?cGp4SlMvU1ZWR0pFMTkvcHdENjc4UlM0a1Nnc0NHUXZzMVJPNHYvc3dhTG9Y?=
 =?gb2312?B?VndNYkRLc2VaaW1IZlk1cnlMOXUzd2tFQzgwNUNyLzNDVU1OcDlvaHZjVVZw?=
 =?gb2312?B?U095UXVIRTVqV3ArSCtBZjl5TFZGMnk1TndzZHhTYkZmWE9VT1ozZDh4TXpt?=
 =?gb2312?B?K3g4SWJMaCtVcWxNUDlkNUI4dXBtYVlCYWd3S21LQVZReGU4WkFielhnR2hx?=
 =?gb2312?B?enQ0OFZ1NzkvRHhmMnljNHZPMEtkVlRLaEEvd1VNdTFTdi9vd2x1OXFjQWhP?=
 =?gb2312?B?Z2hrR1dkS0JaT0IyZmdXbktOclNEQzI1YXdRYzVodGhncGVDL1o3bE1vZ2VY?=
 =?gb2312?B?MXBUeVBGdThIZnlyRTNOMlJhMExVVm04MElnWW02NVZPN0lheWEwbG4zcUtZ?=
 =?gb2312?B?MWJGYW9aK3ZaaVQwNlprV3R6VWUwRzNubEZTTHVKVVhnRGIrUW8vTDYyZWla?=
 =?gb2312?B?dG4rM2RYemxkeU9SeTdWOTQ4U1dTMTd2T0grdkFLMzd2QmV6c0tpWCtSQmcx?=
 =?gb2312?B?bEFabjA1MlYxRkNyZXRtWlgyYis0ajd1TG80THRSZWJNZHUxOXdWb09IVnlx?=
 =?gb2312?B?Qmtmc3I4eExYcjBWaThHdWNmdTFRcUk2Yzhob1R1enVwNTFncHBPTDdHWWh6?=
 =?gb2312?B?WDhmU3Z5Z3VuVTRERUNKOEFTcFlEdSt1M2Nia1N2TVhRV0M1clloZktaZlli?=
 =?gb2312?B?YlVCU09vRUpuTzBjNEZXTWdNbm9tdkE9PQ==?=
Content-Type: multipart/mixed;
 boundary="_004_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4919.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f885c4-0799-4046-e8f1-08dd18e24136
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 06:16:59.1993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB7004
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

--_004_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_
Content-Type: multipart/alternative;
	boundary="_000_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_"

--_000_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQo=

--_000_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_--

--_004_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_
Content-Type: application/octet-stream;
	name="0001-drm-nouveau-Fix-memory-leak-in-nvbios_iccsense_parse.patch"
Content-Description:  0001-drm-nouveau-Fix-memory-leak-in-nvbios_iccsense_parse.patch
Content-Disposition: attachment;
	filename="0001-drm-nouveau-Fix-memory-leak-in-nvbios_iccsense_parse.patch";
	size=1016; creation-date="Tue, 10 Dec 2024 06:16:53 GMT";
	modification-date="Tue, 10 Dec 2024 06:16:58 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4OTVkNDM2MjQyYzk0YzU2YTFkNjk2YzcxMzAxNmNjMTUwNGI5YjgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFueGluIFFpIDx6aGFueGluMEBvdXRsb29rLmNvbT4KRGF0
ZTogVHVlLCAxMCBEZWMgMjAyNCAxMzoxMjowNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGRybS9u
b3V2ZWF1OiBGaXggbWVtb3J5IGxlYWsgaW4gbnZiaW9zX2ljY3NlbnNlX3BhcnNlCgpUaGUgbnZi
aW9zX2ljY3NlbnNlX3BhcnNlIGZ1bmN0aW9uIGFsbG9jYXRlcyBtZW1vcnkgZm9yIHNlbnNvciBk
YXRhCmJ1dCBmYWlscyB0byBmcmVlIGl0IHdoZW4gdGhlIGZ1bmN0aW9uIGV4aXRzLCBsZWFkaW5n
IHRvIGEgbWVtb3J5CmxlYWsuIEFkZCBwcm9wZXIgY2xlYW51cCB0byBmcmVlIHRoZSBhbGxvY2F0
ZWQgbWVtb3J5LgoKU2lnbmVkLW9mZi1ieTogWmhhbnhpbiBRaSA8emhhbnhpbjBAb3V0bG9vay5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaWNjc2Vuc2UvYmFz
ZS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pY2NzZW5zZS9iYXNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pY2NzZW5zZS9iYXNlLmMKaW5kZXgg
OGYwY2NkMzY2NGViLi41MDI2MDhkNTc1ZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2ljY3NlbnNlL2Jhc2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9pY2NzZW5zZS9iYXNlLmMKQEAgLTI5MSw2ICsyOTEsOSBAQCBu
dmttX2ljY3NlbnNlX29uZWluaXQoc3RydWN0IG52a21fc3ViZGV2ICpzdWJkZXYpCiAJCQlsaXN0
X2FkZF90YWlsKCZyYWlsLT5oZWFkLCAmaWNjc2Vuc2UtPnJhaWxzKTsKIAkJfQogCX0KKworCWtm
cmVlKHN0YmwucmFpbCk7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4zMC4yCgo=

--_004_PSAPR02MB4919C9D48BA8B4B6E655C25B8E3D2PSAPR02MB4919apcp_--

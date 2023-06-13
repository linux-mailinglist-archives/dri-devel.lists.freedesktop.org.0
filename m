Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C872DB97
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A3610E347;
	Tue, 13 Jun 2023 07:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2108.outbound.protection.outlook.com [40.107.6.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E478D10E347
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8ee+m2kK827ZVc4IMhgwk2p3FwDdxfg8rTDw5emVJfd9ANHOE8BP+9Qi1yECg2EGvPNPl2ukb4mtWduIbp3Q/piT/pkgLj3fBo+2UXO/PZkx6tt8w89qKsRSiM/++lM59UyHHj601p/FDkjtHHR+2E/NojilaCyDH9Xqrl+qiBTMkq61B3QxzkrZsOySdzSeu4LzFYSkXn+LD/H1fN1s8Y2sX1uuNMhFC7JmVya6/VSTGrao+rBnSYTKVvmBgIFIhAHg2jg5Grz3t6o23T+DslAGzwZqJz25054B+QwPgmYTp2yO6Lm81H7IEAyEizq5rLIx560JK734M0kZWoBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9K1/APOje56hlOJenyfh4eDzZQaQ4mepmVDmy6mfvc=;
 b=Bmn5P1RE0Wmvd+UsqrO4rI0CBMxnKweVezJvxa2SxXKc8BcPdk439Mtnuln0cxtEwzLLqPUOwfh8bHZ7CslwCtp+izIYS1VJgO3NT2BOBU3B7ZfbkHJ24Tmy57B1oYLQ9QZtOLofZ9A7Udjv4xgqjf6IZB5sEQCPQUFLUoHMC//kk0scBP5fzijmpc3aqi6FA0ZNGwpQ0YhQ1eHrtGGyKkImAM1mB/TO3l1m9g8IBO3cDvFq2UX+9V6SYhP/2PgWPkMIXGCBEI0A3ktLhdr3iDvOuV2DupixJ9PbAVbuVDzag/702X34ajBl0foYoBs1VK2VTFDbNedbUzrvrDF+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9K1/APOje56hlOJenyfh4eDzZQaQ4mepmVDmy6mfvc=;
 b=QZb8KI6mYWR9vr+iNfmKqcsjWLhnqSn/4/Z9MN6Mx9UDiPXeeZdEigAlbU+YvydEKYetTEDicibi6P31TB7H4wbzsByQYQLnCQQyywKHRei412D54UwEjbapDNufeVpVG28HyWJkgRnUKMqxHmzEv1da18s5LghVtp0adFw/3VfCw4iGyJuiPPlVPC85aIPQZmBVCt5oCo0D5I/Zr5aHx1MRxwD7NhD5nIoBtF08ldyFvxHj7q1IFMO1/mvQnQMj7xfsHCF68SlGiRpJIht6gMksUcS4WmqOXFInLNCdyDzvPT7fNx2kYV1ot6ohtIeffPSOZ7vkb5taDdcamqgpfA==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AM0PR02MB5764.eurprd02.prod.outlook.com (2603:10a6:208:18d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 07:54:11 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::75e2:1d42:18a6:2354]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::75e2:1d42:18a6:2354%6]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:54:11 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] accel/habanalabs: remove pdev check on idle check
Thread-Topic: [PATCH 1/3] accel/habanalabs: remove pdev check on idle check
Thread-Index: AQHZnSaAGkVtCnIfrUCYh6vJ4Rn9qK+IXiwA
Date: Tue, 13 Jun 2023 07:54:10 +0000
Message-ID: <4a83fb29-9c64-e08c-9e9e-7375ca526abf@habana.ai>
References: <20230612120733.3079507-1-ogabbay@kernel.org>
In-Reply-To: <20230612120733.3079507-1-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AM0PR02MB5764:EE_
x-ms-office365-filtering-correlation-id: 28022472-29b4-4517-72e7-08db6be35fb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ukkJibKDHLyX+KLhXSn7QGj/tBSf1dSSZycqWXJ82ZZrSj8uUsxsHIeUr5p0y0QMyVivnwpePXqxoZZZXrqktE5iD5z16YdRs92jlsBSgQMdrTsgkTNMNxsoYxZO0aI+v/h081LVZuQLo5EZJpDX1vkGTUeLr3oKNjoNqc/vOPFVQsCIKrw2Y8XVvcJZrLdfuoCuJmkfByQ5DLhkalhEEzF9KsbDw8PkurSbn7ztPjORItJ+lIuVOUAv1lVupzBSK4nX73AVvx+DqwRrUqv//u/a3+NqfvJfJ/x5f+RtHuqh3YqKwCICdgQkUsIRboo2D7DyG1E7+3nuhdF0B+7hl9oMNdjRynG0sEp5HPavbYue7SqZm//r1CSCG/MxAedGZutvb1OO7E1aT2+Hc9XBi2dF6/MhKmgLzwPcSkOJc80duaww4Uvl3uCftY4JncqgwNyD2Ik6A67yZDFKqmh6uolOjRgalwcAacr4UI89kHUYSCD2KzFRROjJJd/Rc762zS9aU6KBWzsh6BG9pIUqyf8frQy74m57Zf63XvBRNIjtMDD9HHKUn0rbwzwCnD1PsomU8GZhKu7ycILc9SXcH05AzJIJxSbh4tgVMxShm/dBgv00varZartZZej0SwYOxZEn1leuOwP/4LDUbJX0JfIxsLaxNKTBW4jw+UGXWUL3P54zo/Nhm5EbR6JYLGT9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(451199021)(38070700005)(2906002)(31686004)(8676002)(8936002)(41300700001)(5660300002)(316002)(66556008)(91956017)(76116006)(66476007)(66946007)(66446008)(64756008)(110136005)(71200400001)(36756003)(6486002)(478600001)(6506007)(53546011)(6512007)(86362001)(2616005)(83380400001)(38100700002)(186003)(31696002)(26005)(82960400001)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rzl3c29la1h5bURNRUJrSVl6b25VcURxM040aXJCS1NTT3lZRWUwaWVDelFL?=
 =?utf-8?B?K1E5dm56aWZUUGtPWDJGb0Q3dEgvUGFYUmRHUWUwWUkyQ1BUMXcvYllCSVRv?=
 =?utf-8?B?NThMeTd0ZEZEdzB0ZlF4MkNjQzRLSVVCRTl5cFQwdndVbHZRSitnUjNSamxt?=
 =?utf-8?B?aFlXTHdDUUJ2ZDdkc1RGUU5PMXNFUGpibEZlN0NmTkI2WklORXNwMGEwc2dV?=
 =?utf-8?B?bE5oYjBTbzlvU0gvSUx0MkdJMit3cW94alZxMmlKakRqZVZCeGdQa2NlaklP?=
 =?utf-8?B?L0RCWTllMG5CRXJrdjRRZDNnQ3JNajQ2R0ljM2FzUjd6U21MOVIxZU9nVlda?=
 =?utf-8?B?SHhOYk5UTXRpaXNacnNDVnNWQ0NNejZMK3hicTRJelltbTZXSnBPZVRhcUpJ?=
 =?utf-8?B?MzlLVm5rUnM0eTFwMVJnMHRiNjhLbk5ncWMxWSs2VkUwenBXdWdqaVVUQkJQ?=
 =?utf-8?B?R3kvcXJEdXE4dnFORVlkS3ZjVElleEhFRWlVQ1VQbzRrSTVwVDRKcThmSEVY?=
 =?utf-8?B?NzRZVjh3R1M0MXpUZC9JU2dhVmNFeVNGSkUxaDArK1BOK0E2Ukw2Umh5YUw1?=
 =?utf-8?B?cURlNnVMbW1OdVJ2UDR3d1BxbmFMc2RITmRPd2hmRWd1TUVZb0V1RG5WOEdq?=
 =?utf-8?B?eWZhOGlJMW95RklhU0pWNGxjZ0xNNzJDbWFDS1RMajl0eUlpVFdpMHBuaGc1?=
 =?utf-8?B?NjBCZ3hvYnkzbDBad3VVZ3ZubFU0aUxFQmNtaWIvcUtRUVFTL2VjcFRLT3E3?=
 =?utf-8?B?Z1VMYTdaVnhjVmszMFR6NUx4SHRFM3F2VnRnWktiQ0o0dzNhSW12NjVvZzBQ?=
 =?utf-8?B?Y3k2N3Fxbnlnb0hnZlZrTm00aFdia2dUNXhaSnQrNVZqMllWL0lDU1dzWEEv?=
 =?utf-8?B?blRGTW0ydFRFNG54VG1pNVg4eTZHZ25RUWptdHBrMkFONlNXckZzZ3NxeHVY?=
 =?utf-8?B?cUQ2dEpxNUltdjRyR3VpaWplaTRrRi9KL0FUMzlWRGxTWW1wa1JDRlVNQ3dI?=
 =?utf-8?B?SzJjTFRUQXNKQVpjRHJKcVAzWWpHM3M4cUtmTDdoSWNIYkpJbDBtcTBpb1NL?=
 =?utf-8?B?bElYQXc0L3RNNFlvVXU0d29hbjl6U2NjalViRFpGdk5TN0F3RHQvU0U0dW95?=
 =?utf-8?B?NUI0clRlQTB2S21aNWxNRW9UTEVuNTZnT1VnbWZzeEQwTlQ4WlAyWDB5eDZC?=
 =?utf-8?B?aHNQVEk3dE90dnErYXoyM3JNUzMxcks2eEZudjFYbktVUkhYb0tQaUM5Z0p6?=
 =?utf-8?B?Ty9hME91ZjVHM0ZkWWtiamR0bmRwT1Z2K2tnNkliS1BOeEFoWElaV25oVXZv?=
 =?utf-8?B?U1lud29yTXpoWlhrbVpJU1o2aVF2bXVPdHNVQUU5UWZXU3NiQWFENDVaakFF?=
 =?utf-8?B?L3hEV0lvakNwLzMvR0hDTStld2FBVlBEM0JVVjVFNEZvRUlVTGpCRWF4SmRa?=
 =?utf-8?B?ZkpYcmt4ck1uTGFPei9SYS9ENGFMVTJZK1FrOTRCNHJHSVlKVUdyM0MrYlIw?=
 =?utf-8?B?UzZrNG9nVElUcXRhVXpqQVJDeGxmRGdvcnFzTE94TzhqM3NRNDk1WkFzRGpS?=
 =?utf-8?B?dlFXNVJPYVVHWXlaajhoQ01xbGczbG1VR1U1SEhDVFZEUkRObE5kOG5EL3Jz?=
 =?utf-8?B?RXBJSVh5Ujg1ZERLTmJFMHRLZjhXak9oeWlBWkZXdkZDcUozc0JsUVJFYmV3?=
 =?utf-8?B?Z21KVXkrcmNzTWN2WDVtOVN4QUpvcEE4a3JtT1FNUEx4VmhkUCtvcUxab0di?=
 =?utf-8?B?SjVySnVFY1VNRk1mYkhoV0U1ak5QWi9tZE9yQ3ZVZWJqTUxmNExBVDNCdHc5?=
 =?utf-8?B?VWVabXYzNXliaWU4RFpOdUpweGFoWVpaMG1vKzB6OGpER3o1R1I2ZnRlTENl?=
 =?utf-8?B?a1Axcnl4ZE5FRTRzdHdXdlZMdHRZTUFzS2VyTkw5SWI5VVAwNVQ3SFR6Qm5Z?=
 =?utf-8?B?blBJZHdTNENaVXZneEJ1cmpqdFhxeUNXQ2xoMXlweGs2VlhvdWlEaktCUWMr?=
 =?utf-8?B?dFc4ZnJ1ZnFOK0VhODJPTmc5cjVnSkxjREJ4MFJUeFY5TEhBQ1VHay9IcC9q?=
 =?utf-8?B?UnRSODIxclpSYUpQeHNpNkdlVXoxSXMzdVRkQzgxSkxBdnJQNWZIL0JDbytN?=
 =?utf-8?Q?+4Iw=3D?=
Content-Type: multipart/alternative;
 boundary="_000_4a83fb299c64e08c9e9e7375ca526abfhabanaai_"
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28022472-29b4-4517-72e7-08db6be35fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 07:54:10.9605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oq4pTNNSwfZFTtUortIH+ODklya4/2hBslhoXbhQbtInCO/u6TDU0B+hfAEzv6ElPGy6P149WDH4pZIYju7l0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5764
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

--_000_4a83fb299c64e08c9e9e7375ca526abfhabanaai_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTIvMDYvMjAyMyAxNTowNywgT2RlZCBHYWJiYXkgd3JvdGU6DQoNCk91ciBzaW11bGF0b3Ig
c3VwcG9ydHMgaWRsZSBjaGVjayBzbyBubyBuZWVkIGFueW1vcmUgdG8gY2hlY2sgaWYgcGRldg0K
ZXhpc3RzLg0KDQpTaWduZWQtb2ZmLWJ5OiBPZGVkIEdhYmJheSA8b2dhYmJheUBrZXJuZWwub3Jn
PjxtYWlsdG86b2dhYmJheUBrZXJuZWwub3JnPg0KLS0tDQogZHJpdmVycy9hY2NlbC9oYWJhbmFs
YWJzL2NvbW1vbi9kZXZpY2UuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFi
cy9jb21tb24vZGV2aWNlLmMgYi9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvY29tbW9uL2Rldmlj
ZS5jDQppbmRleCAwZDAyZjFmN2I5OTQuLjVlNjE3NjFiOGMxMSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvYWNjZWwv
aGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmMNCkBAIC00MjQsNyArNDI0LDcgQEAgc3RhdGljIHZv
aWQgaHByaXZfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqcmVmKQ0KICAgICAgICAvKiBDaGVjayB0aGUg
ZGV2aWNlIGlkbGUgc3RhdHVzIGFuZCByZXNldCBpZiBub3QgaWRsZS4NCiAgICAgICAgICogU2tp
cCBpdCBpZiBhbHJlYWR5IGluIHJlc2V0LCBvciBpZiBkZXZpY2UgaXMgZ29pbmcgdG8gYmUgcmVz
ZXQgaW4gYW55IGNhc2UuDQogICAgICAgICAqLw0KLSAgICAgICBpZiAoIWhkZXYtPnJlc2V0X2lu
Zm8uaW5fcmVzZXQgJiYgIXJlc2V0X2RldmljZSAmJiBoZGV2LT5wZGV2ICYmICFoZGV2LT5wbGRt
KQ0KKyAgICAgICBpZiAoIWhkZXYtPnJlc2V0X2luZm8uaW5fcmVzZXQgJiYgIXJlc2V0X2Rldmlj
ZSAmJiAhaGRldi0+cGxkbSkNCiAgICAgICAgICAgICAgICBkZXZpY2VfaXNfaWRsZSA9IGhkZXYt
PmFzaWNfZnVuY3MtPmlzX2RldmljZV9pZGxlKGhkZXYsIGlkbGVfbWFzaywNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSExfQlVTWV9FTkdJ
TkVTX01BU0tfRVhUX1NJWkUsIE5VTEwpOw0KICAgICAgICBpZiAoIWRldmljZV9pc19pZGxlKSB7
DQoNCg0KUmV2aWV3ZWQtYnk6IE9maXIgQml0dG9uIDxvYml0dG9uQGhhYmFuYS5haTxtYWlsdG86
b2JpdHRvbkBoYWJhbmEuYWk+Pg0K

--_000_4a83fb299c64e08c9e9e7375ca526abfhabanaai_
Content-Type: text/html; charset="utf-8"
Content-ID: <E137B0287256BC4FACC9BDC63B4A7006@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5PbiAxMi8wNi8yMDIzIDE1OjA3LCBPZGVkIEdhYmJheSB3cm90ZTo8
YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDoyMDIzMDYxMjEy
MDczMy4zMDc5NTA3LTEtb2dhYmJheUBrZXJuZWwub3JnIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+T3VyIHNpbXVsYXRvciBzdXBwb3J0cyBpZGxlIGNoZWNrIHNvIG5vIG5l
ZWQgYW55bW9yZSB0byBjaGVjayBpZiBwZGV2DQpleGlzdHMuDQoNClNpZ25lZC1vZmYtYnk6IE9k
ZWQgR2FiYmF5IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpv
Z2FiYmF5QGtlcm5lbC5vcmciPiZsdDtvZ2FiYmF5QGtlcm5lbC5vcmcmZ3Q7PC9hPg0KLS0tDQog
ZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9kZXZpY2UuYyB8IDIgKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmMgYi9kcml2ZXJzL2FjY2VsL2hh
YmFuYWxhYnMvY29tbW9uL2RldmljZS5jDQppbmRleCAwZDAyZjFmN2I5OTQuLjVlNjE3NjFiOGMx
MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmMN
CisrKyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmMNCkBAIC00MjQs
NyArNDI0LDcgQEAgc3RhdGljIHZvaWQgaHByaXZfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqcmVmKQ0K
IAkvKiBDaGVjayB0aGUgZGV2aWNlIGlkbGUgc3RhdHVzIGFuZCByZXNldCBpZiBub3QgaWRsZS4N
CiAJICogU2tpcCBpdCBpZiBhbHJlYWR5IGluIHJlc2V0LCBvciBpZiBkZXZpY2UgaXMgZ29pbmcg
dG8gYmUgcmVzZXQgaW4gYW55IGNhc2UuDQogCSAqLw0KLQlpZiAoIWhkZXYtJmd0O3Jlc2V0X2lu
Zm8uaW5fcmVzZXQgJmFtcDsmYW1wOyAhcmVzZXRfZGV2aWNlICZhbXA7JmFtcDsgaGRldi0mZ3Q7
cGRldiAmYW1wOyZhbXA7ICFoZGV2LSZndDtwbGRtKQ0KKwlpZiAoIWhkZXYtJmd0O3Jlc2V0X2lu
Zm8uaW5fcmVzZXQgJmFtcDsmYW1wOyAhcmVzZXRfZGV2aWNlICZhbXA7JmFtcDsgIWhkZXYtJmd0
O3BsZG0pDQogCQlkZXZpY2VfaXNfaWRsZSA9IGhkZXYtJmd0O2FzaWNfZnVuY3MtJmd0O2lzX2Rl
dmljZV9pZGxlKGhkZXYsIGlkbGVfbWFzaywNCiAJCQkJCQkJSExfQlVTWV9FTkdJTkVTX01BU0tf
RVhUX1NJWkUsIE5VTEwpOw0KIAlpZiAoIWRldmljZV9pc19pZGxlKSB7DQo8L3ByZT4NCjwvYmxv
Y2txdW90ZT4NCjxwPlJldmlld2VkLWJ5OiBPZmlyIEJpdHRvbiAmbHQ7PGEgaHJlZj0ibWFpbHRv
Om9iaXR0b25AaGFiYW5hLmFpIiBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0Ij5vYml0dG9u
QGhhYmFuYS5haTwvYT4mZ3Q7PC9wPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_4a83fb299c64e08c9e9e7375ca526abfhabanaai_--

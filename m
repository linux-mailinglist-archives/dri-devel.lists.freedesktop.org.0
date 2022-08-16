Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02201596A38
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E400710FE3C;
	Wed, 17 Aug 2022 07:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DEU01-FR2-obe.outbound.protection.outlook.com
 (mail-fr2deu01on2112.outbound.protection.outlook.com [40.107.135.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCB4112937
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaVdoeYRyYfcDXy3kkU7kObOzTNG0+ljHpqBhlsDl6W+BHT4GK2Ke5HW3sGKPCzTO2BHgTI9x/aUm88IAhfjdoBKmJGxQ2QLPiUArcpTY7tYoELbFePB8Qx1IpbYCFxBm0Ea/LoAuMxlBikVtB/yxNiNBGdA2+Ps/KDMn4Sz+3IpfwHaWzmdmPPqOWbVSxjPkyWjWn8nQe4SSsuk9GJacB8nCNbEMJuBEOzGWepxuUuXKqiGJkgbmN8yd750DvAn/Ru4FkO+IZ+YpbZiR8bu4L9mdkHJ7qMUt/62KirgujGGnscilyHDwhFm3wobSoTJnhPhXqJf+C92DCdUmjweIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN46lB/h2d9WLTHbs42LUjpecfRd/vEfFzqKdcTNWPI=;
 b=Cg03FCL5PVTLtSi7Mq14i0jeLQWERgK5norNjmXu+UWyZz0M670Rybw2gd93ozjGV94HWOzYxIrQzgV2xl/9n0v9Ld8vntpuJDJihvNPrjZdeF1il/3OVL1KLb52hlNloxR/yfJcGiYrwbh+9sgRJYPDBGnQ5pMMFi94wPDCwZ0K9S21UhidZh/r0JHpHqHRPjJ1aouKyvS9lw6MsqlNDjaVw81zmjgLGd6czBftJ4qTfUenomcyX9RzDI2m+asARC2/QLmoG43nosLCHz8QJLbR0dKH5r3IR7mVsEAC6jC948yb6S700ynfeYpiSGoyw9oKcu3J67A8ffy9xRA3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN46lB/h2d9WLTHbs42LUjpecfRd/vEfFzqKdcTNWPI=;
 b=xakJB7/OzBPXN6U91v+g07V42XN0CGEgLwkO+NMQlBts9XGxwwzVoGhf5WXLBxSyVBJTk8UGPQKaIeh8mExh70aPIyZUpAXiDVfFDjWgyJv8FFKMMXybn305VyFgNEw1MI9Xl2UM63GCRIiR1qs7p6kwCQ3ydNlyIsU24BouhDM=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR2P281MB3374.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.15; Tue, 16 Aug
 2022 11:06:21 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::140:1f52:1b5a:ff64]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::140:1f52:1b5a:ff64%3]) with mapi id 15.20.5546.015; Tue, 16 Aug 2022
 11:06:21 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Thread-Topic: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Thread-Index: AQHYrjODEkpLnjXMEEiLI50ZP+QfK62wH3oAgAACzICAAAq3AIAAJvoAgAAjS4CAAAUigIAAG40AgABkpACAAF8TgIAACF4A
Date: Tue, 16 Aug 2022 11:06:21 +0000
Message-ID: <bb590e14-f99b-5bfb-414b-a45ca77045c2@fi.rohmeurope.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
 <YvrO+velKdYdGVve@sirena.org.uk>
 <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
 <YvtzJw3jmocM0JFi@sirena.org.uk>
In-Reply-To: <YvtzJw3jmocM0JFi@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c9d10a0-00e1-4730-3b8c-08da7f7759d7
x-ms-traffictypediagnostic: FR2P281MB3374:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JEOHD44VOtNcXEQ3WA1+/ZnR536KQADtE6KysmmiNu6+XuaqZgIHRHm4Moi2I/EyGdjkwLjOA4ahE9VdSLtJW8Tnd2RPdsX/0RmkowY2fx161SywG7TgnPPmXUt5gGOK1vnaoqHMLSan2yZj1bnAP4bX/rxuIDpdvwfk4MD+zF3iUThw4goN6yDgX5ZmtNXd1Yd70/l0yP6h05T49oR/LcJnSU+kelDd8FddB2zR0KJoE5QA8+hdmC59MRdNxfggWL0VdyEVisLFpAmvYlYSwCIbXUNmZci3bxt8pTDewMJvOACTOAbPs3x3U1USo8lAlSpUxI2TLvFcViKCLFvya68BOZstTSf9N3e41tjFSOl/Sgjb8uFcJfc9ReHzn+4TFF5gabZkyA9RUxf45Wru7x9rBcmV0bPARawGJHTnyGas9FsAPCCbpVw+WbMBCJOmdbbld5V5Mb8agfYkJqPc/tyhwoo0MaUNXf2QCCRhuw39ELyj/kB/5XxWYBghlK57az20ZUGYRGEstNLVQMIH1Xs+U1t0t53jNHfwfQNSTuPo0XvpDJxEoRGVgUul3fyKkC5UNTxVgYm4Qu2MP0wxsMAj/aIY9BYONSBIJZiOnodcqr+DTJq0TlDzeVqrlA1rYOfYxS6tvOC058zQewIoe58H5kpzmywE270MNP2bzdDM93Tk2N5TqMbdEuVHWgYKqNVp/tCwNwcSvVyb21szHI6trebwu1eP4V79Z7th2VIkcPHZovqkh+jxYDDLRbFsuXytAL2MRPp4x9wAJ/dPqnDfDrN1Tu7bxCEQMkjPqDxMY3iMYHX4aSy+321GXpTzW4dV3A+mehUJDQSltJCEJeDc2Di6qHiievWaXKSHh/8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(122000001)(83380400001)(64756008)(66556008)(66476007)(8676002)(4326008)(66946007)(66446008)(91956017)(76116006)(6486002)(71200400001)(110136005)(54906003)(31686004)(478600001)(316002)(5660300002)(86362001)(31696002)(7406005)(8936002)(7416002)(2616005)(41300700001)(186003)(2906002)(6506007)(38070700005)(38100700002)(6512007)(53546011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3JlcUVhK0pNWlFQdGR5OXRwZ3RtZ2dHZ0svYWh1RWpwUmVhRGlGQmtMdXI2?=
 =?utf-8?B?eWhsUHAzVE0xS2tObzk2MktCOVlYYXg5MUkxQkx0ZGdTa0VjUkdHM0YvTVZ0?=
 =?utf-8?B?ZzhYcnNuUUZGSGRER21FdWJUYTZBRE5pYTdvV1MzTFVPdHJhYmRwUUMyVTNz?=
 =?utf-8?B?WFZCb2tsZjMxOVBwTmtUTDNRQ2xzV3Z0a25VSFMzSTd0eGUvN2dWblFWdFJR?=
 =?utf-8?B?Z2VxN29pZlE4VnFFYW1pdXc4eFFEMHFaWlIvcVFjSHFGczFBSkQ4MHJldFBl?=
 =?utf-8?B?VE5pSEZBWWtiK0JTYzY5MEJrV1ZpaXcybk85RlpteUtWcGxFOVBIbnJaY0pv?=
 =?utf-8?B?bTNyVXUrUVUwQ015dFV4VzR1OEh6OWl5MjN1SmZ5U2VtaGs2RW5zQzVwU2Rv?=
 =?utf-8?B?UVE5L3BTV0dEWXp3TCtCT25URXNaYmJlNmlsbUtoclEydnVjTy9aQm1qRnYz?=
 =?utf-8?B?L3YrT3VMRUxNbWlYbWl4cStpM0NVTVA1N1IrZXRCK3dDd1BrYkpQYUxnV2tu?=
 =?utf-8?B?QmQ1MmZST1VLQ3NJRERnMjZIckNCeXRGUExhVGhGME5MR0UyZ1ExZjdJbmhM?=
 =?utf-8?B?UkIyLzJLUkpJTXpFWnZmZzBBNnJNWXMwZzFEQXBNKzQ5QVhNZjJsTXloblh3?=
 =?utf-8?B?MWt2cytCekVMWURTR1hpcnBTQktreWtaUlcvMGFPU3B5UnpVSnd3K1I5NHlL?=
 =?utf-8?B?clRkblRxUUUxenpBeVFNQkdLcDU2NkVWVG1hSXZLV1RJUi9ZdFJsOEtoMGgw?=
 =?utf-8?B?ZndQUGNoU0ExVkdGcy85TUlONmdqdlZxd3NqL1FkVnFUdTRuN1ZKQ3N4K3Qx?=
 =?utf-8?B?NXpwTWF4R3hhK2hiSU95MUM3Z3dLd2k0Q28xaU1YVHB1YTNYeS9vQjVBT3FL?=
 =?utf-8?B?c2o0b0hHUWRCaTdEZWxJZ1ZlbTJ0am56cE1ybDVCYkx2MFFDK1RKZlhJRm5s?=
 =?utf-8?B?am1Ia09SN1JkMnh3b1pMWlRjQUVkWWlDaDFoYm5UalBjMW16WklHUDhoY0Y2?=
 =?utf-8?B?L256bHgwdjMrNnpRMEtZM3RQaXpkbUlNeXNyOTI1YTlCRkJ3ZFFjR0hJMGRF?=
 =?utf-8?B?Q1JCYkNtQ3J5aUlSd3gzVEVZZCtQRXZOdk96NjA5bFYwVlpER1o1czNSZ3pH?=
 =?utf-8?B?ejlDcUJxZTJLWjRvM0EwcTREaUVBbmVWV1B2eEE1RThaQXhURGhSMEVsbnVo?=
 =?utf-8?B?eHZVbXdPR0hybW9idE01YzZJdk4rNzhXQkFhckNwQ0xlay94RWYrc3VKUTN3?=
 =?utf-8?B?Q0hNYkZRS2pqRlNnQXFSakpyQXNraVlwNU9CQ0oyeHBoaUl3c3NGTDRzZVpv?=
 =?utf-8?B?NGF4dkpvV3hVQjkzNHJyNENlVjZtd2NUQ1JOaVBJSnhobk10TVVKSlhnT3RW?=
 =?utf-8?B?RGdVdHZWR29aSlBEUkErTGJNUXJPVDNuNU9wV2JBcWJPMUk0OG4ya25OdmdP?=
 =?utf-8?B?RkExbU9qMXF6a05Nc0xaWG9lRnhjcVVxVjVQdXR6U2RDUnhQL1pVVFVHMkpP?=
 =?utf-8?B?VlB4RVdncHJwQ1RjUlpyaUprSzkrMlVwemJBV1M5amM1UTlJK0phT0ZjUHp1?=
 =?utf-8?B?K3A5VUtIMU5taUlqTTQvSDVVMFlmTlNPcENBSWlvN3VXdUtWTFM1VUg5clpn?=
 =?utf-8?B?WnJldTZOUXpEcFY4QTFLYlhVRVQyVHlpc0c4ZHRpKzU5WDFDZ1hINVpNMDli?=
 =?utf-8?B?TlNrY0tXWTdXZVFPYmpOVEtCeHhIVi9VYzE3VUN0b1dpUjdDY3pzUWtzZHdy?=
 =?utf-8?B?N3hDVm1wQ1lPMmpxZG5RaXBuV3gxV2NKZEEwVElvTW9HdHN2RkZPWlJ0am9G?=
 =?utf-8?B?VS9MbHV1akJuVEZnQUJCamlHNVErTDNuVytGN21udGc0L3Z6bWIwNGljb3lJ?=
 =?utf-8?B?M1dESG5ucUJJVEx1QUZIV0hzZDNYUVVnVjU5Mk9kS25rTU9iZkhKYXlnWko1?=
 =?utf-8?B?WXN0cjFBS3I3M2ZqcHZaOGhQV25wR2tRUEhEZkcxNVpDOGtPVzdYV0FaSnJ0?=
 =?utf-8?B?VFh3SFZhMXFReGVDY1ZhaGUranZMU0NDVnk0ZE5SU3pzMGhtWWQ1WXdxdFF2?=
 =?utf-8?B?aHBtbFQzU3k5VE0wWG5SSXE3M25UL2ZGKy9tVFE3VGRSV0hnOFZUa2lDTkpn?=
 =?utf-8?B?UHlXUW1KNE00QVVzU1V3T3BPUzA3ODcwUDlLdkZYdWE5Tml0R3ZhZDdZNlpT?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE09DB7109145549B96B378A5A8EC059@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9d10a0-00e1-4730-3b8c-08da7f7759d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 11:06:21.0992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /I2m4IuNo55QdlrmrAhlrVILgMjktx5+QC6No7RkaoEERBWroBNEpkJshgZDawKe5Cl0qgGmQGTKIeZn+LZKcOjeJSIoe5Gm6k0vFR2vdMCPS/+jZ/B+cFhZvrXJU1MK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB3374
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:17:49 +0000
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Michael Turq uette <mturquette@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?utf-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNi8yMiAxMzozNiwgTWFyayBCcm93biB3cm90ZToNCj4gT24gVHVlLCBBdWcgMTYsIDIw
MjIgYXQgMDc6NTY6MDZBTSArMDMwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPj4gT24gOC8x
Ni8yMiAwMTo1NSwgTWFyayBCcm93biB3cm90ZToNCj4+PiBPbiBUdWUsIEF1ZyAxNiwgMjAyMiBh
dCAxMjoxNzoxN0FNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiANCj4+Pj4gVGhl
c2UgZGV2cmVzIGhlbHBlcnMgZ2l2ZQ0KPj4+PiBhIGZhbHNlIHNlbnNlIG9mIHNlY3VyaXR5IHRv
IGRyaXZlciBhdXRob3JzIGFuZCB0aGV5IHdpbGwgZW5kIHVwDQo+Pj4+IGludHJvZHVjaW5nIHBy
b2JsZW1zLCB0aGUgc2FtZSB3YXkgdGhhdCBkZXZtX2t6YWxsb2MoKSBtYWtlcyBpdA0KPj4+PiBv
dXRyYWdlb3VzbHkgZWFzeSB0byBjcmFzaCB0aGUga2VybmVsIGJ5IGRpc2Nvbm5lY3RpbmcgYSBk
ZXZpY2UgdGhhdCBpcw0KPj4+PiBpbiB1c2UuDQo+IA0KPj4gSSB0aGluayB0aGlzIGlzIGdvaW5n
IGEgYml0ICJvZmYtdG9waWMiIGJ1dCBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIHdoYXQgaXMNCj4+
IGJlaGluZCB0aGlzIHN0YXRlbWVudD8gRnJvbSBkZXZpY2Utd3JpdGVyJ3MgcGVyc3BlY3RpdmUg
LSBJIGRvbid0IGtub3cgbXVjaA0KPj4gYmV0dGVyIGFsdGVybmF0aXZlcyB0byBmcmVlIHVwIHRo
ZSBtZW1vcnkuIEkgZG9uJ3Qgc2VlIGhvdyBmcmVlaW5nIHN0dWZmIGF0DQo+PiAucmVtb3ZlIHdv
dWxkIGJlIGFueSBiZXR0ZXI/IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQgLSBpZiBzb21lb25lIGlz
IHVzaW5nDQo+PiBkcml2ZXIncyByZXNvdXJjZXMgYWZ0ZXIgdGhlIGRldmljZSBoYXMgZ29uZSBh
bmQgdGhlIGRyaXZlciBpcyBkZXRhY2hlZCwNCj4+IHRoZW4gdGhlcmUgaXMgbm90IG11Y2ggdGhl
IGRyaXZlciBjb3VsZCBkbyB0byBmcmVlLXVwIHRoZSBzdHVmZiBiZSBpdCBkZXZtDQo+PiBvciBu
b3Q/IFRoaXMgc291bmRzIGxpa2UgZnVuZGFtZW50YWxseSBkaWZmZXJlbnQgcHJvYmxlbSAodG8g
bWUpLg0KPiANCj4gSWYgYSBkcml2ZXIgaGFzIGRvbmUgc29tZXRoaW5nIGxpa2UgY3JlYXRlIGEg
ZmlsZSB0aGF0J3MgYWNjZXNzaWJsZSB0bw0KPiB1c2Vyc3BhY2UgdGhlbiB0aGF0IGZpbGUgbWF5
IGJlIGhlbGQgb3BlbiBieSB1c2Vyc3BhY2UgZXZlbiBhZnRlciB0aGUNCj4gZGV2aWNlIGdvZXMg
YXdheSwgdGhlIGRyaXZlciB0aGF0IGNyZWF0ZWQgdGhlIGZpbGUgbmVlZHMgdG8gZW5zdXJlIHRo
YXQNCj4gYW55IHN0b3JhZ2UgdGhhdCdzIHVzZWQgYnkgdGhlIGZpbGUgcmVtYWlucyBhbGxvY2F0
ZWQgdW50aWwgdGhlIGZpbGUgaXMNCj4gYWxzbyBmcmVlZCAodHlwaWNhbGx5IHRoaXMgaXMgZGF0
YSBzcGVjaWZpYyB0byB0aGUgZmlsZSByYXRoZXIgdGhhbiB0aGUNCj4gZnVsbCBkZXZpY2UgZGF0
YSkuICBTaW1pbGFyIHNpdHVhdGlvbnMgY2FuIGV4aXN0IGVsc2V3aGVyZSwgdGhhdCdzIGp1c3QN
Cj4gdGhlIGNvbW1vbiBjYXNlLiAgVGhlcmUnbGwgYmUgYSBkZWxldGlvbiBjYWxsYmFjayBvbiB3
aGF0ZXZlciBvdGhlcg0KPiBvYmplY3QgY2F1c2VzIHRoZSBwcm9ibGVtLCB0aGUgYWxsb2NhdGlv
biBuZWVkcyB0byBiZSByZWZlcmVuY2UgY291bnRlZA0KPiBhZ2FpbnN0IGJvdGggdGhlIHRoZSBk
ZXZpY2UgYW5kIHdoYXRldmVyIG90aGVyIHVzZXJzIHRoZXJlIG1pZ2h0IGJlLg0KDQpPaCByaWdo
dC4gVGhhbmtzLiBTbyB3ZSdyZSBkaXNjdXNzaW5nIChhIGNvcm5lcj8pIGNhc2Ugd2hlcmUgdGhl
IGZyZWVpbmcgDQppcyBkb25lIGJ5IGEgY2FsbGJhY2sgdGhhdCB3YXMgcmVnaXN0ZXJlZCBieSBh
IGRyaXZlci4gQ2FsbGJhY2sgYmVpbmcgDQpjYWxsZWQgZm9yIGV4YW1wbGUgd2hlbiB0aGUgcmVm
Y291bnQgZm9yIGEgcmVzb3VyY2UgZ2V0cyBkb3duLCANCnBvdGVudGlhbGx5IGxvbmcgYWZ0ZXIg
dGhlIGRyaXZlciB3YXMgZ29uZS4NCg0KSSBzZWUgdGhlIHByb2JsZW0gb2YgcmVsZWFzaW5nIHNv
bWV0aGluZyB3aXRoIGRldm0gaW4gc3VjaCBjYXNlLiBTdGlsbCwgDQpJIGRvbid0IHRoaW5rIGl0
IGlzIHNvbWV0aGluZyB3ZSBzaG91bGQgYXZvaWQgYnkgYmFubmluZyB0aGUgdXNlIG9mIGRldm0g
DQotIHdoaWNoIGlzIHVzZWZ1bCBpbiBtYW55IG90aGVyIGNhc2VzLiBJdCdkIGJlIGVxdWFsbHkg
d3JvbmcgcmVsZWFzZSB0aGUgDQpyZXNvdXJjZSBpbiAucmVtb3ZlKCkgb3IgZG9pbmcgYW55IG90
aGVyICJkb3VibGUgZnJlZWluZyIuIFRvIG1lIHRoaXMgDQpib2lscyBkb3duIHRvIGVkdWNhdGlu
ZyBwZW9wbGUgYWJvdXQgdGhlIGxpZmUtdGltZXMuDQoNCkkgd29uZGVyIGlmIHdyaXRpbmcgc3Vj
aCAncmVsZWFzZSBjYWxsYmFja3MnIGlzIGNvbXB1bHNvcnk/IEkgbWVhbiwgaWYgSSANCndhcyB3
cml0aW5nIGEgZHJpdmVyIHRvIHNvbWUgbmV3ICh0byBtZSkgc3Vic3lzdGVtIGFuZCB3YXMgcmVx
dWlyZWQgdG8gDQp3cml0ZSBhbiBleHBsaWNpdCByZWxlYXNlLWNhbGxiYWNrIGZvciBhIHJlc291
cmNlIC0gdGhlbiBpdCdkIHN1cmVseSANCnJhbmcgYSBiZWxsIGFib3V0IHBvdGVudGlhbGx5IGRv
dWJsZSBmcmVlaW5nIHN0dWZmIHdpdGggZGV2bS4gRXNwZWNpYWxseSANCmlmIHRoZSBkb2Mgc3Rh
dGVkIHRoZSBjYWxsYmFjayBjYW4gYmUgY2FsbGVkIGFmdGVyIHRoZSBkcml2ZXIgaGFzIGJlZW4g
DQpkZXRhY2hlZC4NCg0KPiANCj4+PiBUaGF0J3MgYSBkaWZmZXJlbnQgY29udmVyc2F0aW9uLCBh
bmQgYSB0b3RhbGx5DQo+Pj4gdmFsaWQgb25lIGVzcGVjaWFsbHkgd2hlbiB5b3Ugc3RhcnQgbG9v
a2luZyBhdCB0aGluZ3MgbGlrZSBpbXBsZW1lbnRpbmcNCj4+PiB1c2Vyc3BhY2UgQVBJcyB3aGlj
aCBuZWVkIHRvIGNvcGUgd2l0aCBoYXJkd2FyZSBnb2luZyBhd2F5IHdoaWxlIHN0aWxsDQo+Pj4g
dmlzaWJsZSB0byB1c2Vyc3BhY2UuDQo+IA0KPj4gVGhpcyBpcyBpbnRlcmVzdGluZy4gSXQncyBu
b3QgZWFzeSBmb3IgbWUgdG8gc3BvdCBob3cgZGV2bSBjaGFuZ2VzIHRoaW5ncw0KPj4gaGVyZT8g
SWYgd2UgY29uc2lkZXIgc29tZSByZW1vdmFibGUgZGV2aWNlIC0gdGhlbiBJIGd1ZXNzIGFsc28g
dGhlIC5yZW1vdmUoKQ0KPj4gaXMgcmFuIG9ubHkgYWZ0ZXIgSFcgaGFzIGFscmVhZHkgZ29uZT8g
WWVzLCBkZXZtIG1pZ2h0IG1ha2UgdGhlIHRpbWUgd2luZG93DQo+PiB3aGVuIHVzZXJzcGFjZSBj
YW4gc2VlIGhhcmR3YXJlIHRoYXQgaGFzIGdvbmUgbG9uZ2VyIGJ1dCBkb2VzIGl0IGJyaW5nIGFu
eQ0KPj4gbmV3IHByb2JsZW0gdGhlcmU/IEl0IHNlZW1zIHRvIG1lIGRldm0gY2FuIG1ha2UgaGl0
dGluZyB0aGUgc3BvdCBtb3JlIGxpa2VseQ0KPj4gLSBidXQgSSBkb24ndCB0aGluayBpdCBicmlu
Z3MgY29tcGxldGVseSBuZXcgaXNzdWVzPyAoV2VsbCwgSSBtYXkgYmUgd3JvbmcNCj4+IGhlcmUg
LSB3b3VsZG4ndCBiZSB0aGUgZmlyc3QgdGltZSA6XSkNCj4gDQo+IFNlZSBhYm92ZSwgc29tZXRo
aW5nIGNhbiBzdGlsbCBrbm93IHRoZSBkZXZpY2Ugd2FzIHRoZXJlIGV2ZW4gYWZ0ZXIgaXQncw0K
PiBnb25lLg0KDQpZZXMuIFRoYW5rcyBmb3IgdGhlIGVkdWNhdGlvbi4NCkknbSBzdGlsbCBub3Qg
c3VyZSBJIHVuZGVyc3RhbmQgaG93IGRldm0gY2hhbmdlcyB0aGUgcGljdHVyZS4gSSdkIGd1ZXNz
IA0KaW4gdGhlIGNhc2UgeW91IGRlc2NyaWJlZCBhYm92ZSwgdGhlIHVzZXItc3BhY2Ugd291bGQg
c3RpbGwgc2VlIHRoZSANCmRldmljZSB1bnRpbCBpdCBjbG9zZXMgdGhlIGZpbGUgYW5kIHRoZSBj
YWxsLWJhY2sgY2xlYW5zLXVwLiBJIGd1ZXNzIA0KZnJlZWluZyB0aGUgc3R1ZmYgKHRoYXQgaXMg
dXNlZCB1bnRpbCB1c2VyLXNwYWNlIGRyb3BzIHRoZSBoYW5kbGUpIA0KYW55d2hlcmUgZXhjZXB0
IHRoZSBjbGVhbi11cCBjYWxsLWJhY2sgaXMgd3JvbmcgLSBiZSB0aGUgbWVjaGFuaXNtIGRldm0g
DQpvciBkcml2ZXIncyAucmVtb3ZlKCkgb3IgYW55IG90aGVyLiBUbyBtZSB0aGUga2V5IGlzIHN0
aWxsIHRlYWNoaW5nIA0KcGVvcGxlIHRvIGtub3cgd2hhdCBiaXRzIG1heSBiZSB1c2VkIGFmdGVy
IHRoZSBkcml2ZXIgaGFzIGJlZW4gZGV0YWNoZWQuDQoNClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0
aW9uIGd1eXMgLSB0aGlzIGhhcyBiZWVuIGluc2lnaHRmdWwgdG8gbWUgOikNCg0KQmVzdCBSZWdh
cmRzDQotLSBNYXR0aQ0KDQotLSANClRoZSBMaW51eCBLZXJuZWwgZ3V5IGF0IFJPSE0gU2VtaWNv
bmR1Y3RvcnMNCg0KTWF0dGkgVmFpdHRpbmVuLCBMaW51eCBkZXZpY2UgZHJpdmVycw0KUk9ITSBT
ZW1pY29uZHVjdG9ycywgRmlubGFuZCBTV0RDDQpLaXZpaGFyanVubGVua2tpIDFFDQo5MDIyMCBP
VUxVDQpGSU5MQU5EDQoNCn5+IHRoaXMgeWVhciBpcyB0aGUgeWVhciBvZiBhIHNpZ25hdHVyZSB3
cml0ZXJzIGJsb2NrIH5+DQo=

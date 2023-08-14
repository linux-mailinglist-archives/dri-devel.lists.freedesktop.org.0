Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2077B518
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 11:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE4510E164;
	Mon, 14 Aug 2023 09:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF5110E164
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 09:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL9YesG+m/aVz+MplihPMUL5fdPjQNNLqkghfUo1Bc256+KYACNKxK1a7NTNJkrcm9Y44SzyWOMWI/E63fMPq1ULFLqZLWnYc3ZF+PUKVLjtjAky61kWNqb6Z9+kF6PaJRuF/AhYWY7uUM20OVrYzphifZK0NEPkdA1xp+Gms9QtiGkPdY+gu8U/Uo7UNmPTnBtjWsCU9QNjS6HWfM+lI05vlt0JGmjKOJGqelG1GylF8U/kqY1bPEYw71nAVq4GeaSM0xTAV+Nih3d3ZB5Yq5gd9KD5NJ8VJEq7jVKm08wPK9+/WSDvwPPjxlS4lSxnMCLMarPyez4I9GR/6rVmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxagtzksxaLcdmDVgQMf6+fbfSA8/AOdikDEDc60ofM=;
 b=DPmmJIkJPiIpo5IlzN2tCj6Bi2VHsrmVl2/yvcU3PU8+lQ71mqECtuOmg8EgdnD2gXKgWbHlCh9/JOTVkf0kZq18qZZT/0pw2YnqU7sNSs9YtIsihvdEpX2IFPRAlORXuj9j/tYpp46Vt5eRhE49L/eRj9hKxVWd+vevWIyf508/loTnrhUItIP5m8SHF2BlCsA6M8KZvVat0xk0Jgv75XDS20j6iQc2f3EsZ7FwwORr6f9+d9dqN884Y2vO7xx3YhA41eoLXXobiprF0OvJxhUe2+zKWMYiRGS5qYo7EmxAymOrIzj0PQRDFf/zaBhjLRp9U3z5bWe/pC89u4eggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxagtzksxaLcdmDVgQMf6+fbfSA8/AOdikDEDc60ofM=;
 b=GYoZVRF3DPgZCogKQGv+hOX80c01KoDSshPhlSLmH5bEQYYVzTYLkKll79n+w4xjMLiJcwKX+G8aiVLixj/l0dM4mNkJY4LqO45ek7X6ueaxhaHY3MjOv2Cv2S5ParEXYsdyfNuHGIQu9+XWseq7piDXxnKuJ5rX3J/RI5GW5U4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8069.jpnprd01.prod.outlook.com (2603:1096:400:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:06:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 09:06:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Thread-Topic: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Thread-Index: AQHZzbzsYXkuCHBFJ02/ZQuvljioB6/oe1OAgAEC58A=
Date: Mon, 14 Aug 2023 09:06:46 +0000
Message-ID: <OS0PR01MB592291F889F1BE13981169D78617A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813080520.65813-1-biju.das.jz@bp.renesas.com>
 <20230813172715.GA19398@pendragon.ideasonboard.com>
In-Reply-To: <20230813172715.GA19398@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8069:EE_
x-ms-office365-filtering-correlation-id: 2fecc3e7-36c9-493c-1d66-08db9ca5c95a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L1MF9D3tX/BpLdv14bm754mwvy9baGU3wZNQDEF38ZHTAhlQGIp4omujyoFyxlI5WM4/fXJx9eA+KMpnOl5Nuo5WNSfvKB2nK6eQhDJKEBuSQH6omM/lT7vBg3rw1qvXZGUSMlOW9cf7WLOZ7L8C05P5JM7mVaQkSEWMi45bsiCz9SHeYyiJuZ6bHJN2nu0Bq8JtI1Z2Alqk4VXgOCSFlV5lcXv9jxj5dXlKFDbwHsHRoM3BS8OWnC97c6CigD6OYtHvMAspzIwVJ/RYriv9D3OGNktJRn3DinaZn63GmpyV6dwcWWR9jGgdKuS5v+8w2jGE+PZXKKsLd1259ABvKNqZe3oMTGUtiR0gwT7P7XA6ej+SrMcQRMAMOls6EEa4/rXMeEu7YpiKqhrv9UQ3PosAkXku3ztKUESkButHl77+wKeWXe/qu7EOp1ga0wupAURqUR2nzaa4ctXbIXZtrcgKKJacQz8Na3mhlZ+WdoYqZpr/OfPbNsQxeazPkJEyy7nRvzqk/DsIX1M3OdS113mYN7saQ9Z9eDj5ylVtkd6Q4mvCQW1+jJpDuSBmYrrErXOGGezw8KHRPkzm0YsV82n42sEynMFgXyvJtgLQaVZHzsZCX5MeyqFqQakFrbM0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(1800799006)(186006)(66476007)(6916009)(54906003)(5660300002)(7416002)(52536014)(66946007)(33656002)(478600001)(66556008)(38070700005)(86362001)(41300700001)(8936002)(76116006)(66446008)(64756008)(2906002)(71200400001)(8676002)(122000001)(38100700002)(7696005)(4326008)(6506007)(26005)(316002)(9686003)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUd3NlNXMUdZdHMxc1UzNEF0ZHFNckxBektGS0cwbTFkZlV0K2tZc1REUFB4?=
 =?utf-8?B?cktkMWtjZzZFVW84MEhmUzhlNUtEVDhwd1ZPazBGVmVCejVOMlRsZUdUeWxF?=
 =?utf-8?B?QkxJQm9lQW1PUVFSODNtWksxeEYwYklVS1c0S3RRZ2ZodlhGaW9tQ2ZmV0V2?=
 =?utf-8?B?aVp6Q2hwZ0NXcWwvZmFnSGVaV0wzUm9hMVRkbjVOUE9mQThsSzBHMzkwdGxv?=
 =?utf-8?B?a1lrLzhvOXhQTTVyZDFDWlc0aDc0blh1ZjRQcndzTDRKcHlFYzJNZmNIZVpS?=
 =?utf-8?B?NjJVejBYZ3JEWitZM1NmbEJ6bTVvT0t5NmFUM0J2N3JPMit6bEwvRndpTml5?=
 =?utf-8?B?L09tOU56b0NvMmVBWUY1RnNYM05vck1zQlVaYi8weDJTTVdsL2hQMlZiRzZr?=
 =?utf-8?B?UVRsZUJKa0o2YkdCKzQvbXg5bWhVQzNodVFDMDlKRU5LQkl4T3A1Y1ZOWnpD?=
 =?utf-8?B?MERLaTBOUFFOQ3ErTGF5dldoVzR5Mm9jVWpPTkVwUGwyVFdkcEhjekpyOWlU?=
 =?utf-8?B?eU50aE0vTW1PbFlSaXpDdEVEUTBZalVCazJ4eHlTZnhoNk9oS3M2WlBXZEhM?=
 =?utf-8?B?SDFINnMzYVF1eWk0bVVpZzVTSjZEelVBZXJQZHVJbklTaGMwczFBMk9OdDR5?=
 =?utf-8?B?OC9VNzVwOXRYUDFVdGRlUDNJN3F5V25ublpzZGZWeDlNR3dtUFdmZ3kzOEtu?=
 =?utf-8?B?VjlxaEUwTGlyQUdKSmpEblhuaG9FWndUZnE4TVZnS1dvN1BSMVpQWUJ3Z1Q0?=
 =?utf-8?B?TUpHSlVnenA1YklQN3VKanVyei9yRzRJYUFad1JoZk5oWGRpMVJIWjl0WVJU?=
 =?utf-8?B?L0tHQWt6ZFZkR0FVaTQ3WExUSSs1cFpTWThpR2gzeDA5d2k4bVE2SVZDamo1?=
 =?utf-8?B?WkRsUE1nM2pqYkhkYkhKM0ZKeVJHWHlBM3ByVmlObmwvZmRVRVVxZWpIckt4?=
 =?utf-8?B?b2h3bWY4UFZVSCswSVVtVUh0SjlwNmJyS0tWbkxlKytHREFjQ3VDVmRDYk5M?=
 =?utf-8?B?WVJ3UHYvM1h2Q1JvR3A1dy9jSFZ5TlY0b1V3cmkxanZ3TlUxbUJsMDVWdkpU?=
 =?utf-8?B?aHBzb3VIMitobjllZUNCZHV4SGJLWmZIZnhydFV2cTdOMCsxakZqVDBlV3By?=
 =?utf-8?B?TE9zbXVqMXhwQUh0ckJ4R0FDRzFHcGNZeENHYlU5VVNWUUcvSnRuK1ZSVWo5?=
 =?utf-8?B?UUZmOVROZ25EMFpTZ3N6VGlkQVl1d3l0NDRPNXNqMHA5RVNMVDFEUmd6dUQ5?=
 =?utf-8?B?NWM1VXgweUFST2J3UzBNR0g0ZFhIcTFyRUlROHdocGlEUUxPOWh3a05ndDdC?=
 =?utf-8?B?aDhVcHltQVJyLzc3YkhMSEhLeFdXZjdDcTRVa3pKRC9DTndIREUrcUZPcitW?=
 =?utf-8?B?UGtscnhMQ1l5dTA5c0VkOHVQaHlGRVFmNGkvZGVLMUxzRDBmc0JETVVFZXRE?=
 =?utf-8?B?aVVIRGNtRnFOMW1nUHV2SnVLKzA1K0RqTldGeFErNkpXTzVQWDI5ZzVNS1dk?=
 =?utf-8?B?S2RNNXZrdE1QakxtUFVTTnowUitYaEFld0pKQUE4UmRPTm5yODdCYUhCWEhH?=
 =?utf-8?B?NkJCWmZVYVh5b0p3Yk95TUhLL0VkKzdIWFVFd2lPS0h5cUVFcXFkTWpzdEMr?=
 =?utf-8?B?WXZPZnRINlR5RWpIWE9jWEprRUhyOUQ0TW1Xd3AwdWRmdVoxMjBZTi9SV2Fj?=
 =?utf-8?B?T3o2bEdWeUNyN2YyT1VzbjZmV1UvSEFPZ2RoaTZGajJRK25KVENtcWIzMjY3?=
 =?utf-8?B?UmNWRWJUTWgrRDdkYUJERTU4bU0zUnN2c25TeWtRQXM4OG9NV0U4R3FpbkVr?=
 =?utf-8?B?QWw4bjVHMktqU1cvNUxua0Z5Q2wveHUvYldLZjVpbkRkeS9IbWZmc1B0cWlv?=
 =?utf-8?B?TTVmZmlnL1pZUU51UWxLOS9MSnluMDZsY2RZMGFqakFiK2lTMUFGSUtrcGFz?=
 =?utf-8?B?cjRVb0t3LzdFbW5VQ1JLckluTHRLYTl6Q2REQU1VVTJGVjllWEhPZEJqT0hW?=
 =?utf-8?B?TTR2bStDdHZsbDlweDdBZ1dNa3Bwak15TkhxS2tPNzROY09ocTRlTnZRMFgw?=
 =?utf-8?B?VWcwbm9Hb2p5UHF6MjZ5a1lXck50UFo1MFVmZldzeXpxUU5zWG5kWGNPc3J2?=
 =?utf-8?Q?GOWnnV06iEmzr2vyDmRCnZB2f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fecc3e7-36c9-493c-1d66-08db9ca5c95a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 09:06:46.4387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iZWLO9QjWcDvj9J/Vic8wkhZI1eK6hlz3c4eotbEGu9EaspWv/RqQCo3VbCrgX1/HwB0ui/isYLXU9r57F5UJj+SNPYm8yqTrNrQ64jHvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8069
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtOiBicmlkZ2U6IGl0NjYxMjE6IEV4dGVuZCBtYXRjaCBzdXBw
b3J0IGZvciBPRg0KPiB0YWJsZXMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9y
IHRoZSBwYXRjaC4NCj4gDQo+IE9uIFN1biwgQXVnIDEzLCAyMDIzIGF0IDA5OjA1OjIwQU0gKzAx
MDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoZSBkcml2ZXIgaGFzIE9GIG1hdGNoIHRhYmxlLCBz
dGlsbCBpdCB1c2VzIElEIGxvb2t1cCB0YWJsZSBmb3INCj4gPiByZXRyaWV2aW5nIG1hdGNoIGRh
dGEuIFJlcGxhY2UgSUQgbG9vayB1cCB3aXRoIGkyY19nZXRfbWF0Y2hfZGF0YSgpDQo+ID4gZm9y
IHJldHJpZXZpbmcgT0YvQUNQSS9JMkMgbWF0Y2ggZGF0YSBieSBhZGRpbmcgc2ltaWxhciBtYXRj
aCBkYXRhIGZvcg0KPiA+IE9GIHRhYmxlLg0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBleHBsYWlu
IGluIHRoZSBjb21taXQgbWVzc2FnZSAqd2h5KiB0aGlzIGlzIGRlc2lyZWQgPw0KDQpDdXJyZW50
bHkgdGhlIGRyaXZlciBpcyB3b3JraW5nIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgYQ0KSTJDIGRl
dmljZSByZWdpc3RlcmVkIHZpYSBPRiB3aWxsIGFsd2F5cyBtYXRjaCBhIGxlZ2FjeQ0KSTJDIGRl
dmljZSBJRC4gVGhlIGNvcnJlY3QgYXBwcm9hY2ggaXMgdG8gaGF2ZSBhbg0KT0YgZGV2aWNlIElE
IHRhYmxlIHVzaW5nIG9mX2RldmljZV9tYXRjaF9kYXRhKCkvZGV2aWNlX21hdGNoX2RhdGEoKS8N
CkkyY19nZXRfbWF0Y2hfZGF0YSgpIGlmIHRoZSBkZXZpY2VzIGFyZSByZWdpc3RlcmVkIHZpYSBP
Ri4NCg0KQmFzaWNhbGx5LCBpdCBpcyBmaXhpbmcNCg0KRml4ZXM6IDlhOWY0YTAxYmRhZSAoImRy
bTogYnJpZGdlOiBpdDY2MTIxOiBNb3ZlIFZJRC9QSUQgdG8gbmV3IGl0NjYxMjFfY2hpcF9pbmZv
IHN0cnVjdHVyZSIpDQoNCkJ1dCBpMmNfZ2V0X21hdGNoX2RhdGEoKSBpcyByZWNlbnRseSBpbnRy
b2R1Y2VkLg0KDQpNYXliZSBvbmUgcGF0Y2ggd2l0aCBmaXhlcyB0YWcgdXNpbmcgb2ZfZGV2aWNl
X2dldF9tYXRjaF9kYXRhIGFuZA0KSUQgbG9va3VwIGZvciByZXRyaWV2aW5nIG1hdGNoIGRhdGEg
ZnJvbSBPRi9JMkMgdGFibGVzDQoNCmFuZCBhbm90aGVyIHBhdGNoIHRvIHNpbXBsaWZ5IHVzaW5n
IGkyY19nZXRfbWF0Y2hfZGF0YSgpIGJ5IHJlcGxhY2luZyBvZl9kZXZpY2VfZ2V0X21hdGNoX2Rh
dGEgYW5kIElEIGxvb2t1cC4NCg0KPiANCj4gPiBXaGlsZSBhdCBpdCwgZHJvcCB1bnVzZWQgbG9j
YWwgdmFyaWJhbGUgaWQgZnJvbSBwcm9iZSgpLg0KPiANCj4gSSdkIGRyb3AgdGhpcyBzZW50ZW5j
ZSwgdGhhdCdzIG5vdCBhICJ3aGlsZSBhdCBpdCIgY2hhbmdlIGJ1dCBhbiBpbnRlZ3JhbA0KPiBw
YXJ0IG9mIHRoaXMgcGF0Y2guDQoNCkFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiAtLS0NCj4gPiAgVGhpcyBwYXRjaCBpcyBvbmx5IGNvbXBpbGUgdGVzdGVkLg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY2MTIxLmMgfCAxNyArKysrKysrKy0t
LS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0
NjYxMjEuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NjEyMS5jDQo+ID4g
aW5kZXggNDY2NjQxYzc3ZmU5Li5hODAyNDZlZjRmZmUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NjEyMS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9pdGUtaXQ2NjEyMS5jDQo+ID4gQEAgLTE1MDEsNyArMTUwMSw2IEBAIHN0YXRpYyBj
b25zdCBjaGFyICogY29uc3QgaXQ2NjEyMV9zdXBwbGllc1tdID0gew0KPiA+DQo+ID4gIHN0YXRp
YyBpbnQgaXQ2NjEyMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KSAgew0KPiA+IC0J
Y29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkID0gaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lk
KGNsaWVudCk7DQo+ID4gIAl1MzIgcmV2aXNpb25faWQsIHZlbmRvcl9pZHNbMl0gPSB7IDAgfSwg
ZGV2aWNlX2lkc1syXSA9IHsgMCB9Ow0KPiA+ICAJc3RydWN0IGRldmljZV9ub2RlICplcDsNCj4g
PiAgCWludCByZXQ7DQo+ID4gQEAgLTE1MjMsNyArMTUyMiw3IEBAIHN0YXRpYyBpbnQgaXQ2NjEy
MV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQpDQo+ID4NCj4gPiAgCWN0eC0+
ZGV2ID0gZGV2Ow0KPiA+ICAJY3R4LT5jbGllbnQgPSBjbGllbnQ7DQo+ID4gLQljdHgtPmluZm8g
PSAoY29uc3Qgc3RydWN0IGl0NjYxMjFfY2hpcF9pbmZvICopIGlkLT5kcml2ZXJfZGF0YTsNCj4g
PiArCWN0eC0+aW5mbyA9IGkyY19nZXRfbWF0Y2hfZGF0YShjbGllbnQpOw0KPiA+DQo+ID4gIAlv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihlcCwgImJ1cy13aWR0aCIsICZjdHgtPmJ1c193aWR0aCk7DQo+
ID4gIAlvZl9ub2RlX3B1dChlcCk7DQo+ID4gQEAgLTE2MDksMTMgKzE2MDgsNiBAQCBzdGF0aWMg
dm9pZCBpdDY2MTIxX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50KQ0KPiA+ICAJ
bXV0ZXhfZGVzdHJveSgmY3R4LT5sb2NrKTsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGl0NjYxMjFfZHRfbWF0Y2hbXSA9IHsNCj4gPiAtCXsgLmNv
bXBhdGlibGUgPSAiaXRlLGl0NjYxMjEiIH0sDQo+ID4gLQl7IC5jb21wYXRpYmxlID0gIml0ZSxp
dDY2MTAiIH0sDQo+ID4gLQl7IH0NCj4gPiAtfTsNCj4gPiAtTU9EVUxFX0RFVklDRV9UQUJMRShv
ZiwgaXQ2NjEyMV9kdF9tYXRjaCk7DQo+ID4gLQ0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGl0
NjYxMjFfY2hpcF9pbmZvIGl0NjYxMjFfY2hpcF9pbmZvID0gew0KPiA+ICAJLmlkID0gSURfSVQ2
NjEyMSwNCj4gPiAgCS52aWQgPSAweDQ5NTQsDQo+ID4gQEAgLTE2MjgsNiArMTYyMCwxMyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGl0NjYxMjFfY2hpcF9pbmZvDQo+IGl0NjYxMF9jaGlwX2luZm8g
PSB7DQo+ID4gIAkucGlkID0gMHgwNjExLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGl0NjYxMjFfZHRfbWF0Y2hbXSA9IHsNCj4gPiArCXsgLmNv
bXBhdGlibGUgPSAiaXRlLGl0NjYxMjEiLCAmaXQ2NjEyMV9jaGlwX2luZm8gfSwNCj4gPiArCXsg
LmNvbXBhdGlibGUgPSAiaXRlLGl0NjYxMCIsICZpdDY2MTBfY2hpcF9pbmZvIH0sDQo+ID4gKwl7
IH0NCj4gPiArfTsNCj4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgaXQ2NjEyMV9kdF9tYXRj
aCk7DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgaXQ2NjEy
MV9pZFtdID0gew0KPiA+ICAJeyAiaXQ2NjEyMSIsIChrZXJuZWxfdWxvbmdfdCkgJml0NjYxMjFf
Y2hpcF9pbmZvIH0sDQo+ID4gIAl7ICJpdDY2MTAiLCAoa2VybmVsX3Vsb25nX3QpICZpdDY2MTBf
Y2hpcF9pbmZvIH0sDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFy
dA0K

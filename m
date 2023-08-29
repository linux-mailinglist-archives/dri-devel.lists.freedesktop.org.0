Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3478C6BD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5099510E118;
	Tue, 29 Aug 2023 14:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F160F10E118
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBysjCRfBMGjMRiBklyxVpPR79HbTY4ScOiRIVwfdiuRjzyXEAbRWEU2zQAU1ZgvHcI1X/0mmPaHAc1e4KP61+cWI8e3LdYsxoLqfbnAdd5Y7qJ4+HnXMEpZKzmHQrnjRNFyfL8NUAmPy7WVJi6DGFWy7PD+2UjNdYLt+edipMu8F6s94OvpU5IFJaG0CqkpqRvbCAaqHjYsfpW2YKiSS7LyAk2bXS5KYXPmw2sJYLFbs8VSTul3tj4PlkZdAAef9UKhaYsISbevYpVvBZrNcefhazb5YIVwRd3FcYQV/jbNrT6L+POUnQKvmROUJgWtp5aN1BBPC5nP4V9iQso02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTqAJUxcMsyo3ajO2avv2bak/jNABmT7fI8npIMv9kA=;
 b=jveqBPg8GtX3CLSIwxYW/IaMvRR8RDuveGoYIh1dn7VVLWuUDUygXUKoaGfo/OovspcXpUMT5OeTu+DAghz/LajhX3WeJk8d+gg7ka00UH9yLBkIDh/+IcDTiX82C6RqCNxo/4eiaOqHR3JLRvNzxU8EAjxE+4CkVqhCzq05HmPjT1C+zK/8QoFi5bnqh8vcx0GwPdY0rfukHEMk3cQBpVR+kFKVf50vGN1F7OOpEggGGiB5fbZhBb01eHuajetAo4qSTpen6VGnOBRQPkxHw3jN1Kbjsj79/zFZXojNSUsMLuwWF4A+armT3Its6tx5opKrKCX7Gnz3TkPFa3f7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTqAJUxcMsyo3ajO2avv2bak/jNABmT7fI8npIMv9kA=;
 b=RXTTRMhMf9yYGWTXfhrl7EPj4r8LAfzYSelU3XaytdgPYO2kJOhsHi7jDP+apNVv134ga2LURMEy9BIgpcrQQC4T57dndZBCjecdT5DvlUUkJewC413KDP1oU6+4cWpZXyw/4xYja+irFLKlpCbf95FhWSZBkQvuMEuCXfRJo4U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11465.jpnprd01.prod.outlook.com (2603:1096:400:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 14:01:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:01:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 2/7] drm: adv7511: Add max_mode_clock variable to struct
 adv7511_chip_info
Thread-Topic: [PATCH 2/7] drm: adv7511: Add max_mode_clock variable to struct
 adv7511_chip_info
Thread-Index: AQHZzhDCXbz9QRi7OU+vZRezXdbWvrAA902AgABvFYA=
Date: Tue, 29 Aug 2023 14:01:54 +0000
Message-ID: <OS0PR01MB5922F0D0C5BB069D87EF470D86E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-3-biju.das.jz@bp.renesas.com>
 <20230829072333.GL17083@pendragon.ideasonboard.com>
In-Reply-To: <20230829072333.GL17083@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11465:EE_
x-ms-office365-filtering-correlation-id: d1f6e65d-cfb7-4aa3-1142-08dba898802c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RBo5HJkb08vaG2eZaR3dvwcGd7obMCexi7Xk0iB8kd270bFrsqpbEv6geoEgrh1da2Zepz9kvmOMAR2mJn/+zXe9bZv3G3vU9e2WouWxpywfu0l0MJ/HaSFJ21eQK9/8eWMrlEkms1WYO8UEE4Vc7NyRxt3r3XPBrM9qpgxGQi+XtrNxEGWRBdToAUGXlwkGZKkweuNpvZcowCsb4LhPd4gY7yAck8h5+wfcLQC6E+wV7vlMFRte6/l2SY/lGslheMvmh8bAKzlJdN+QPlrG/JOdJ7T88SOaTZucyOjxxrRvNJc6q1k5vt6kqONbsH9GwFVLq5Z+GffZkEanljf+2UP3f7Gf7o+jevQpVwH+Ega1A6eD22F/nQFnunsk0Hdnj7YqX1Jbbn41kDok9H2aL066NKozQDoqXsSJvqPhUhDeugWkF9wjNXzpJbjn5cRvTSPo1gyh2Pe0e7gxxX61uDu/dn2N5BMBwRFR1bdWQp1F8uLu0WMGGxvsHXrp3C+o8ddQUKi665/HF9XBgs+UxNzmlBjH3u/7CSbxAFGThBtoG8MQPV2csINSfSpPwiJGXmaMwoJA3IdahoxhWj2SNBi0r8iZMHBRazTKyKgejtIkQN8fwIDVhKvRNnpYpSU8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(186009)(1800799009)(451199024)(9686003)(6506007)(7696005)(71200400001)(83380400001)(478600001)(2906002)(76116006)(7416002)(6916009)(54906003)(64756008)(316002)(66446008)(8936002)(66946007)(66476007)(52536014)(66556008)(41300700001)(5660300002)(4326008)(8676002)(33656002)(38070700005)(38100700002)(86362001)(55016003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUFLWjcxYTRTVnhjMlcyWmd0RHk4emxUbWJ6NlVGMmpnbC80cG9tTWdZd2N1?=
 =?utf-8?B?U1JFdTlUV3VQNlVXc0dUbEJUZFpqUHZlVDQxQVRPbHlIbkhQL29abHMrWDd5?=
 =?utf-8?B?VURtT1ZKcndtUHBGS1pkYWQrM2MrL2ZCaE1PZWVHVDU0UElvRHk2MlcyVmxn?=
 =?utf-8?B?L2tBcWxqa0Mycms1TW43OHhKalFsS3E5YThaNTVYU05iK2FqaG1ycWJxSEVB?=
 =?utf-8?B?MU01Um1xYzJSZStkUVhtWkFSM2hTdHVsQ1FxTDR0cUhJY1oxWGpHWUdkMTJF?=
 =?utf-8?B?MnIzTmdRUVRENjhDdzdkRit1Vk9CYm1NUDQ2NS9SSW9aeEY3WmtSMEV1SGJo?=
 =?utf-8?B?aFpudTJTOTRzcFdONFIwRGl1OU9ndEJvYklnU291b0hWQXlCaHNTdDRDYURn?=
 =?utf-8?B?NEgxcGpsWnlXV25WYUROck1jaG1oOUhUVlgwMEFLYzF5bGMzcE5YeVhjdmdE?=
 =?utf-8?B?SysyMGtwa2RPb1RPSnltNm0yVEZCZFRvK1lzbXQzamQyME00a1FBSXQyNkNR?=
 =?utf-8?B?d2N1eXN0V01xaDdudCtGeFFXbG5hbjFTRW9iSXo3RytSTCtsQTFJaGpuS012?=
 =?utf-8?B?Q3Y5R0Z5SXcyQkZZSU5Fb0R2SUlEWmErelpBN2Y3RGFoNEptaFlMai92WUxH?=
 =?utf-8?B?T0tyd0cyb3lnL1BZblFMdldTbVFCZWYrK1JYM3dFVm5oYzhqb1FwZVlLd0Np?=
 =?utf-8?B?MkZHOXl4QXNJdElUYnhDT0RKUCt5U0t6MDZJL3h6OFpLLzk0TFgwQUw5RmVV?=
 =?utf-8?B?Um9EMEs3WVdkVzl5ZG0zSGhHck4wajhRbUticVVlZUtLejBhS3NyQ0wveC8v?=
 =?utf-8?B?TUoxeUVYVFFXOStvQ2NpZ0x6ZmtUcjZXYitVNURNa2c1ZGwxOWN5ZStoQmNV?=
 =?utf-8?B?ZGtPdWI1Zm1HMTFRWUFrRFV0ZjVXTnpyY2I4TWxBeWtWNlRjaWhXenpyQmdB?=
 =?utf-8?B?ZXM4TXBBYXFvbGprdWJpWW80eFJSeTZnK0I3a3BQeFRMQTNyMDZoa2hDZzFZ?=
 =?utf-8?B?RHdXTzRneDlzWjhZTGhWT2tKdCtwcFE3MFZFZ0liY2d4Z1EyS3RCRFI1VHNs?=
 =?utf-8?B?alFFZ05SVitwa3lIQkNvSWN5aHB0Y0FhSURLVHVHR3NVOWdaczY0ZExoUWxL?=
 =?utf-8?B?OEFUVHozM1NCc2dvQldsdnF4N0Y5bWR0RFQ4NlBaaDJraldIOXA0VE92NEJp?=
 =?utf-8?B?azZDVFIzWk9HWUt2YUg5cXJ5TFlzb1RXajdvdjFWZjdQSGdTZnpxNEJPVmla?=
 =?utf-8?B?Ump1Sm0xY2JiWFBocm9YMEhXeXVzNlIrbnhLcnovbkxRbHlsQUJIRFlxUnc3?=
 =?utf-8?B?M1JhTVUrVXNGS1FhZ0RHelJ2OEgyb0VXNDI2eFBSRGJUM2RyZWZmRU9XaSti?=
 =?utf-8?B?cEdSRnhFa3ZXWlJkRHJ4TTFJRU9PakZtTlZTaFF1V0ZhKzJmZDJjNHY0RlhW?=
 =?utf-8?B?N3BrU0pDbC9XaGhUZWJMK1IyRzJVa1N0bFJRak5rWHFqd0x0VVRDM2szR2Jy?=
 =?utf-8?B?Q3ZpZnJhazhiajZoY0NBSXZyU0owQ2J5RktZRndtZG12VGlGakRIUFF6dUhY?=
 =?utf-8?B?YVh0dkY3Zk1YYjBpU1RWTkJqZkFkZWhnVkc4OTBQZW11dVpwVXpIMXNxNkRK?=
 =?utf-8?B?TGIwbThnRWJVV0w4bHViNUdZMlJPaEJSbi9mRk91SWdENmFrd2lnWUNRTVJ4?=
 =?utf-8?B?VUljQ0o0clJrWkp6aGVtZURsWlRDSVJGa2NoV0l2am51Vmo5cVR6V2w3clZL?=
 =?utf-8?B?VTgvOVQ2eUhrTzhXc1l0UzQ5bUpoVHJyOFpLN05ZcWI4U0h6ZmhnQmdzRENQ?=
 =?utf-8?B?MzZnVlI2Y0NzYjBxRjQ5YVdoZVZHT3JEU1Q5ZkN6cWVMSUcrY0JsMGpQNjFU?=
 =?utf-8?B?amFUN3VpUG9rL2x4ZWwrNmI4RHVSUjJaa0NMVDJEV0FnbkR6MFhDQVBHendE?=
 =?utf-8?B?REFPUkY3OTI2VUhJVVRQeUlHQUs3cWVTZ091RytNMmpEUGtsbU1SU2lVd0Q3?=
 =?utf-8?B?SFFGRFNhNHpkbThtbzg4b0szKzFjbmhmei94QXM2MTlORy9ZWUQ2WFBwa3Ay?=
 =?utf-8?B?b1VNcU5SeDdZZVc1bDlKOENuaFR2WXNydnFKNzg5Q1Q5UUVORStmMEtYY045?=
 =?utf-8?Q?8PqA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f6e65d-cfb7-4aa3-1142-08dba898802c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:01:54.1327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keiLiJUUgMsySPEzFvS8pdpnSy0OaYPPB7An4HjIMX3BJFm8zUfrP7dXnbeAQCR4KE75XPj9724djBsQIvHppx5G+ntteVX2hmlr9BtkGxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11465
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
 Adam Ford <aford173@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAyLzddIGRybTogYWR2NzUxMTogQWRkIG1heF9tb2RlX2Nsb2NrIHZh
cmlhYmxlIHRvDQo+IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbw0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gU3VuLCBBdWcgMTMsIDIwMjMg
YXQgMDc6MDU6MDdQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gVGhlIEFEVjc1MzMgc3Vw
cG9ydHMgYSBtYXhpbXVtIHBpeGVsIGNsb2NrIG9mIDgwTUh6IHdoZXJlYXMgaXQgaXMNCj4gPiAx
NDguNU1IeiBmb3IgQURWNzUzNS4gIEFkZCBtYXhfbW9kZV9jbG9jayB2YXJpYWJsZSB0byBzdHJ1
Y3QNCj4gPiBhZHY3NTExX2NoaXBfaW5mbyB0byBoYW5kbGUgdGhpcyBkaWZmZXJlbmNlLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5o
ICAgICB8IDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9k
cnYuYyB8IDYgKysrKy0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTMzLmMgICAgIHwgMiArLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1
MTEvYWR2NzUxMS5oDQo+ID4gaW5kZXggNTllOGVmMTBkNzJlLi5mODE5MDQ0MmZmY2EgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPiBAQCAt
MzM1LDYgKzMzNSw3IEBAIGVudW0gYWR2NzUxMV90eXBlIHsNCj4gPg0KPiA+ICBzdHJ1Y3QgYWR2
NzUxMV9jaGlwX2luZm8gew0KPiA+ICAJZW51bSBhZHY3NTExX3R5cGUgdHlwZTsNCj4gPiArCXVu
c2lnbmVkIGxvbmcgbWF4X21vZGVfY2xvY2s7DQo+IA0KPiB1bnNpZ25lZCBpbnQgaXMgZW5vdWdo
IGFzIHRoZSBjbG9jayBpcyBleHByZXNzZWQgaW4ga0h6LiBUbyBtYWtlIGl0IGV4dHJhDQo+IGNs
ZWFyLCB5b3UgY291bGQgYWxzbyBuYW1lIHRoZSBmaWVsZCBtYXhfbW9kZV9jbG9ja19raHouDQoN
CkFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IA0K
PiA+ICB9Ow0KPiA+DQo+ID4gIHN0cnVjdCBhZHY3NTExIHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gaW5kZXggMDEzZDhkNjQw
ZWY0Li4xOTNiMmQ1YmM3ZTYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IEBAIC0xMzcxLDExICsxMzcxLDEzIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gPiBhZHY3NTExX2NoaXBfaW5mbyA9
IHsgIH07DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBh
ZHY3NTMzX2NoaXBfaW5mbyA9IHsNCj4gPiAtCS50eXBlID0gQURWNzUzMw0KPiA+ICsJLnR5cGUg
PSBBRFY3NTMzLA0KPiA+ICsJLm1heF9tb2RlX2Nsb2NrID0gODAwMDANCj4gPiAgfTsNCj4gPg0K
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFfY2hpcF9pbmZvIGFkdjc1MzVfY2hpcF9p
bmZvID0gew0KPiA+IC0JLnR5cGUgPSBBRFY3NTM1DQo+ID4gKwkudHlwZSA9IEFEVjc1MzUsDQo+
ID4gKwkubWF4X21vZGVfY2xvY2sgPSAxNDg1MDANCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgYWR2NzUxMV9pMmNfaWRzW10gPSB7IGRpZmYgLS1n
aXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiBpbmRleCBjNDUy
YzRkYzFjM2YuLmU5MmIyN2UwYWZkMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hZHY3NTExL2Fkdjc1MzMuYw0KPiA+IEBAIC0xMDgsNyArMTA4LDcgQEAgZW51bSBkcm1fbW9k
ZV9zdGF0dXMgYWR2NzUzM19tb2RlX3ZhbGlkKHN0cnVjdA0KPiBhZHY3NTExICphZHYsDQo+ID4g
IAl1OCBicHAgPSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKGRzaS0+Zm9ybWF0KTsNCj4g
Pg0KPiA+ICAJLyogQ2hlY2sgbWF4IGNsb2NrIGZvciBlaXRoZXIgNzUzMyBvciA3NTM1ICovDQo+
ID4gLQlpZiAobW9kZS0+Y2xvY2sgPiAoYWR2LT5pbmZvLT50eXBlID09IEFEVjc1MzMgPyA4MDAw
MCA6IDE0ODUwMCkpDQo+ID4gKwlpZiAobW9kZS0+Y2xvY2sgPiBhZHYtPmluZm8tPm1heF9tb2Rl
X2Nsb2NrKQ0KPiA+ICAJCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7DQo+ID4NCj4gPiAgCS8qIENo
ZWNrIG1heCBjbG9jayBmb3IgZWFjaCBsYW5lICovDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiAN
Cj4gTGF1cmVudCBQaW5jaGFydA0K

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C580A78C6D0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB08410E278;
	Tue, 29 Aug 2023 14:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA6D10E278
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePK3irUNNFDob0Kh7ajXk4MWgSd9DpLEECSml2Cj4vFmhwwPzXXsjNqcZWr/SOV4N5FUOzEZH/2NZ1PvnSV26VaXrsjJAEy0SLaBbKJX6h0kVt7ZcJwN5257HKkW9MEeikni/EjieuqX3TPeZDvRpb7zUvKGcvZuJ3oNNMxw+TA8naWbpVWutqrVzlg3snmtb+FHP92okNSILwkEKDC/xJaV2unfEJjkZhKrn57Hb3GTe5KZYfEk9z9N1pZ0Ha/vebryxRnyManYUnEt7Qwm4cVdsveFGaDXJGZhCJ5I3tOjSwDFbkocEfRQ5cZQcMrozwwXHmPBaYuchxn6V3P94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX00FCWjJanF1dvA8s5ySURB6mi4LUk994LoNYEzcHk=;
 b=jO/cxflcxkvdMl1hMPU1VLhqpXM7oPsYunnOcjHJDZhho+pZuWp062JN4edl5sUYaidyZ67Y/4KRQ3k5UTZgDqjat0gl0jdtXuC62q89rMHS4P2vnmM6xXzLCFnjnxNMwgIu3jEvixU5E5/DRCNN7ZY/Zgg3GzjpHx0D9tEcS/ULoL8Dst9iJOTV5HH2uOKsCYrd0FIpDSvz+fjrva/2r6zhOBqpisysN8jY8mbpinPLLRFQD4rWmomsAoMGKte90NtuJapa6zJLyr6gQX8JZCLd/WnQwKcWcQD2cqGzWtzjosWHPqwQWeZj/2+HHNGT/8EtrA32/vZ6IaUQZ8SguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX00FCWjJanF1dvA8s5ySURB6mi4LUk994LoNYEzcHk=;
 b=Zvux+2uCE/07Opxj4pdQ1EA5yKJmHttvZ2Gw3CUXqKwYvkyxDYSaxp0it86wuHboVxUZonVEPLbysuR4/roFZQfSyaWzlvAwSRcg1CLsxpPw5jCjdi0M/+PnJNmR4QFAtSGBAgxnOobOpESbBzV/Yp+ZQuhOwg3yuwg54SuqIG4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9362.jpnprd01.prod.outlook.com (2603:1096:604:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 14:05:29 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:05:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 3/7] drm: adv7511: Add max_lane_freq variable to struct
 adv7511_chip_info
Thread-Topic: [PATCH 3/7] drm: adv7511: Add max_lane_freq variable to struct
 adv7511_chip_info
Thread-Index: AQHZzhDFJmC8GQepn02fDdoKj/pkvLAA98uAgABu18A=
Date: Tue, 29 Aug 2023 14:05:29 +0000
Message-ID: <OS0PR01MB59222E37A4E52699F25F004086E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-4-biju.das.jz@bp.renesas.com>
 <20230829072519.GM17083@pendragon.ideasonboard.com>
In-Reply-To: <20230829072519.GM17083@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB9362:EE_
x-ms-office365-filtering-correlation-id: 01ce2134-175d-48ba-f4a7-08dba8990044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4WgCJMVaQSgpeCdWawI2J7iOnKbmOwVb0Lj+OP/xrcdrbcIxCNa3p6zw+VZ5PG777vJ0DtLlkDwz2HFCa0bETOhWfLKlhp6SPtT0CpIa8bJSUC+Lc1H9jbG3lk+8+eFgYEXOeFwmk4UuggVPhVZFkO93QcZrUdKljxXIfUwbBYCG+rUgR2qABq9qmasNRVDZppHlALhqemIhtrRmtcfoNzZIUxPhOQYuCPb9WobIAtE5Qn8IUZOtLrGATrrbVE84k4HSDpUnETXeU+srDERDJ8xSaaDAmlY9ZB8xozerBEL0ROmONEkeJTtnu9OC93MFYjKk6JJVebTx9fcPymgdAm0gaI4+OWLVT0GctG3HDgOeakWYhwqXNKHQeQrnkfKvydXiQToRuGKsm2hBIhp+BBTT7eAZH2oPwDkDI71NX5+ZyrDH1LcZFHgZfxf+5eJ47KSb+6Ra3XCbiVsr1KWqVxNT6n5RQxy/Nmqj+4N+XpU9wDQYsRwAZMUzQwQ2buHVpp8513gb8shmfbvhMb10adrLrPJd01112FXGuGiZWuDMlXiC1EZtSqhwOiaY2VAILBf5We83RSxYy4Jxv7agjxbbqXM2YHNBXETy9zVaxBAkBpDCiFMYM2k4f/etAVDn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(186009)(451199024)(1800799009)(6506007)(9686003)(7696005)(71200400001)(478600001)(83380400001)(2906002)(76116006)(7416002)(54906003)(64756008)(66446008)(6916009)(316002)(8936002)(66476007)(66946007)(41300700001)(52536014)(66556008)(5660300002)(8676002)(4326008)(86362001)(33656002)(55016003)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTRmcTBHdXdlNUlmeEpTYVN1MGFGOFc3M1YvYzRrdjI1aVRaeHd5NHhKdmUw?=
 =?utf-8?B?YUpUaTF0K01PL3JQVDhLRGRPL2pkYTZEblU1eUNlZDk0TVowZENTR3lXREd6?=
 =?utf-8?B?cG1HUnJma2NnRDhMUmpENmtUUjR4VThSQ2pWRGtNUzI3YmhoaFdXUFhFRmZu?=
 =?utf-8?B?NWRMaVRqVjJYWE9uRTh2bVV3MUJMaUtVZ1AyQnRSK2h6d1NSR09pNndkKzBX?=
 =?utf-8?B?MkR6WHYwa3pub2RDcURHbDFYNmY1OW1TdDB1WHpYK1N2eG9iai9rOUI0SWZh?=
 =?utf-8?B?NjJYMTR5SGs4eDB1cEMwV09uSkVnZXRwdHEzVklKendJK09rd3RSc3pFWFRX?=
 =?utf-8?B?c3cxR1N0eFVMTk9nTnpsZ3l2REtuZzFtRE9udUp4MVdMdmFvUnYrZnBFa3oz?=
 =?utf-8?B?bVdUbkhUSG1pNnIxaGFYZEdZaTNqczkxQ2dYVVEwU3piZmkrMHhkdThIbGt0?=
 =?utf-8?B?M1ZsR2s5Z0pGNUwzWkpkdjFTZFF4cDg0eHYxYkxFb04xL0o2Q2lLUnRtTWEw?=
 =?utf-8?B?bkdLdzFVWjk0empxdHMxSEdQaWNja2YwWHpkYmpIV2t0cVhRVzdPK3JPRXpG?=
 =?utf-8?B?S0l5bVdqMXNDc0tWMGl6OERiNHlpUVdxV3RBckZobG1MRGdUZmJPb1ptblBx?=
 =?utf-8?B?SzNaT3dxcXE4ci84SWRtOHJrVldscU5vdWZNZThYTEpEMXJXY3pKZk84TlVa?=
 =?utf-8?B?MldYekEwVm5DcGx1ZXdXbHRxMmZYUlA5OVhWbjNPR3gxV25oQzMyazljR1RT?=
 =?utf-8?B?LzcwVGJRc1lBWUtneVlBMi9naWYrZTVFS2tqOFptMHZDMFplTTFVN3kwMGdV?=
 =?utf-8?B?SEl2eWpWc2p3Q0t4WTk0cUYycTlqQzdsb0ttbUJXbjJPQlg0Rkh6U0RhaW1a?=
 =?utf-8?B?SnZlNkY5UE1SOXRoSkRTYTNoMlNxS0J1aHNRSVpGN3Q2Q1Z5Z3FMUDRBNnNa?=
 =?utf-8?B?Z2M5SURaM2pQOHpOc2xYbjJ5VSs5b1RBNUltbXhGenhqSHI0cmI0MmNYUnVM?=
 =?utf-8?B?TFoxNVV5MVpYOEZHSy9RVTg3WjVpNVN0WUVZU1JhemdlYVNIYUNYLzFvLzRs?=
 =?utf-8?B?UElHb0VjZGg3a0s4OTE1NUloZFhvOFBhM0Z2Umx3cnRlM2RnUm41encwWW83?=
 =?utf-8?B?REFCVnJ6enJKcGRkZVQzeXdmcERGQ0w5SHpZbWkxdFN3VGdvM2FqTmM4UnFv?=
 =?utf-8?B?OUVnUmpYTkNtT0d2V3BvVUxsRGlwRm5jQ3BqdTZaNWdJc3hRZXREc2NPb1Rp?=
 =?utf-8?B?VjFpamtCVEhva2hydGFOejJVaEZjbVhNbkExWkRWOUxMVjdHckphSS96RFFt?=
 =?utf-8?B?UHVCV3RQcUpmVGxLWkdicENvUjJTbWI3YkJZSCtZNEpsL0F4clQ1NHNFNllV?=
 =?utf-8?B?dmdYaUwyNUtZaGlTOEdCVU5NbGQwZ3VrcGVmaStWODZGQjJsRHV5OVpweHM0?=
 =?utf-8?B?TXZWcDJvRGc0cmU0OGFSNXF2TlpEMVJVOG1vLzFiWGJOV3J2clk0eXJHcENO?=
 =?utf-8?B?YmFIdVZ1dXRZbEV3ZVM3UWFKS2ZxNnRBdExzY3BCU3U5SVZTL3dqM2tKTkNU?=
 =?utf-8?B?RE1SWmpXZVV2ZDU4aHJ3bm0xKzdxUkdiQS9QaFpwcVNyMkZUZWFEWjJJUjFR?=
 =?utf-8?B?MDRRTXR4aFA2UDl3Yy9Tc3A4a1lMcGkxdVgweCtvZVlUSmdGK3ZwSlBjbnNS?=
 =?utf-8?B?bDBqMkFiNEhBNGU0M1BEeXVKVnlNN2tjM0VsTzlZVzRFdTRjS0FDNXE2UXJs?=
 =?utf-8?B?VWZINDk0T1ZhM3JQVWt0UzN0eHQrVWs2eWZJOVpFaTZDd0JJTWV4YmNIcnBt?=
 =?utf-8?B?cEhRQ3ZLbWd1dGVxY0tQYm9zdnArRlBRWXhwSEl6VjhyYlZKdFRMYUxLZUox?=
 =?utf-8?B?WXY0MWhqdHFTMDVzQldLU1IxRFYrdjlzU2swNG4zMitNSmJ5eGVqQUc2K3o2?=
 =?utf-8?B?eGhKaldBdEZQWGlUZzNSdXg1bkxJT2RuS25HU0M5ejk5VUgvMzRvTWZLWmhF?=
 =?utf-8?B?VGxWRjl2TmtDdUdTSmIvdVJaengrckdRMXU1cnE2cXdwR3ZyTzlZK2RDbkdW?=
 =?utf-8?B?d0E2NXNqUXRNYmRMZ09XODlDdHlURytYcUlqeHIvUzNZRHNHcWxUeWJqNG5y?=
 =?utf-8?Q?DyeQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ce2134-175d-48ba-f4a7-08dba8990044
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:05:29.0443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zq6GpCJ0ruvCGE7dLuAq0BmB61zxtwcdCsb0FAYVz/82or2PG1c9L9hiVVNO6+WPMoTRXcjoi1aNJ/sHjjm1KnZ+DqMptgot6GKWgkZ0EyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9362
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

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvN10gZHJtOiBhZHY3NTExOiBB
ZGQgbWF4X2xhbmVfZnJlcSB2YXJpYWJsZSB0byBzdHJ1Y3QNCj4gYWR2NzUxMV9jaGlwX2luZm8N
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IFN1biwgQXVnIDEzLCAyMDIzIGF0IDA3OjA1OjA4UE0gKzAxMDAsIEJpanUgRGFzIHdyb3RlOg0K
PiA+IFRoZSBBRFY3NTMzIHN1cHBvcnRzIGEgbWF4aW11bSBsYW5lIGNsb2NrIG9mIDgwME1IeiB3
aGVyZWFzIGl0IGlzDQo+ID4gODkxTUh6IGZvciBBRFY3NTM1LiAgQWRkIG1heF9sYW5lX2ZyZXEg
dmFyaWFibGUgdG8gc3RydWN0DQo+ID4gYWR2NzUxMV9jaGlwX2luZm8gdG8gaGFuZGxlIHRoaXMg
ZGlmZmVyZW5jZS4NCj4gPg0KPiA+IFdoaWxlIGF0IGl0LCBkcm9wIHRoZSB1bnVzZWQgbG9jYWwg
dmFyaWFibGUgbWF4X2xhbmVfZnJlcS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaCAgICAgfCAxICsNCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgfCA2ICsrKystLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jICAgICB8IDUgKy0tLS0NCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+IGluZGV4IGY4
MTkwNDQyZmZjYS4uMGUyYzcyMWE4NTZmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gQEAgLTMzNiw2ICszMzYsNyBAQCBlbnVtIGFkdjc1
MTFfdHlwZSB7ICBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8gew0KPiA+ICAJZW51bSBhZHY3NTEx
X3R5cGUgdHlwZTsNCj4gPiAgCXVuc2lnbmVkIGxvbmcgbWF4X21vZGVfY2xvY2s7DQo+ID4gKwl1
bnNpZ25lZCBsb25nIG1heF9sYW5lX2ZyZXE7DQo+IA0KPiBTYW1lIGNvbW1lbnQgYXMgZm9yIHBh
dGNoIDIvNywgeW91IGNvdWxkIG5hbWUgdGhlIGZpZWxkIG1heF9sYW5lX2ZyZXFfa2h6Lg0KPiBB
biB1bnNpZ25lZCBpbnQgbWF5IGJlIGVub3VnaCB0b28gaWYgdGhlIGNhbGN1bGF0aW9uIGJlbG93
IGRvZXNuJ3QNCj4gb3ZlcmZsb3cuDQoNCkFncmVlZC4NCg0KMiBwb3dlciAzMiA9IDQsMjk0LDk2
NywyOTUgaXMgbGFyZ2UgdmFsdWUgY29tcGFyZWQgdG8gYmVsb3cgY2FsY3VsYXRpb24gdG8gdHJp
Z2dlciBhbiBvdmVyZmxvdy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQogDQo+IA0KPiBSZXZpZXdlZC1i
eTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2Fy
ZC5jb20+DQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0cnVjdCBhZHY3NTExIHsNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gaW5k
ZXggMTkzYjJkNWJjN2U2Li4yOWUwODdlNmQ3MjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IEBAIC0xMzcyLDEyICsxMzcy
LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gPiBhZHY3NTEx
X2NoaXBfaW5mbyA9IHsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFfY2hp
cF9pbmZvIGFkdjc1MzNfY2hpcF9pbmZvID0gew0KPiA+ICAJLnR5cGUgPSBBRFY3NTMzLA0KPiA+
IC0JLm1heF9tb2RlX2Nsb2NrID0gODAwMDANCj4gPiArCS5tYXhfbW9kZV9jbG9jayA9IDgwMDAw
LA0KPiA+ICsJLm1heF9sYW5lX2ZyZXEgPSA4MDAwMDAsDQo+ID4gIH07DQo+ID4NCj4gPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBhZHY3NTM1X2NoaXBfaW5mbyA9IHsN
Cj4gPiAgCS50eXBlID0gQURWNzUzNSwNCj4gPiAtCS5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMA0K
PiA+ICsJLm1heF9tb2RlX2Nsb2NrID0gMTQ4NTAwLA0KPiA+ICsJLm1heF9sYW5lX2ZyZXEgPSA4
OTEwMDAsDQo+ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNl
X2lkIGFkdjc1MTFfaTJjX2lkc1tdID0geyBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gaW5kZXggZTkyYjI3ZTBhZmQxLi5jMWU3NDRkNGYyYjEg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4g
PiBAQCAtMTAzLDcgKzEwMyw2IEBAIHZvaWQgYWR2NzUzM19kc2lfcG93ZXJfb2ZmKHN0cnVjdCBh
ZHY3NTExICphZHYpDQo+ID4gZW51bSBkcm1fbW9kZV9zdGF0dXMgYWR2NzUzM19tb2RlX3ZhbGlk
KHN0cnVjdCBhZHY3NTExICphZHYsDQo+ID4gIAkJCQkJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUpICB7DQo+ID4gLQl1bnNpZ25lZCBsb25nIG1heF9sYW5lX2ZyZXE7DQo+ID4g
IAlzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kgPSBhZHYtPmRzaTsNCj4gPiAgCXU4IGJwcCA9
IG1pcGlfZHNpX3BpeGVsX2Zvcm1hdF90b19icHAoZHNpLT5mb3JtYXQpOw0KPiA+DQo+ID4gQEAg
LTExMiw5ICsxMTEsNyBAQCBlbnVtIGRybV9tb2RlX3N0YXR1cyBhZHY3NTMzX21vZGVfdmFsaWQo
c3RydWN0DQo+IGFkdjc1MTEgKmFkdiwNCj4gPiAgCQlyZXR1cm4gTU9ERV9DTE9DS19ISUdIOw0K
PiA+DQo+ID4gIAkvKiBDaGVjayBtYXggY2xvY2sgZm9yIGVhY2ggbGFuZSAqLw0KPiA+IC0JbWF4
X2xhbmVfZnJlcSA9IChhZHYtPmluZm8tPnR5cGUgPT0gQURWNzUzMyA/IDgwMDAwMCA6IDg5MTAw
MCk7DQo+ID4gLQ0KPiA+IC0JaWYgKG1vZGUtPmNsb2NrICogYnBwID4gbWF4X2xhbmVfZnJlcSAq
IGFkdi0+bnVtX2RzaV9sYW5lcykNCj4gPiArCWlmIChtb2RlLT5jbG9jayAqIGJwcCA+IGFkdi0+
aW5mby0+bWF4X2xhbmVfZnJlcSAqDQo+ID4gK2Fkdi0+bnVtX2RzaV9sYW5lcykNCj4gPiAgCQly
ZXR1cm4gTU9ERV9DTE9DS19ISUdIOw0KPiA+DQo+ID4gIAlyZXR1cm4gTU9ERV9PSzsNCj4gDQo+
IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=

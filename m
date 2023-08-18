Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD4F780C8F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AB410E518;
	Fri, 18 Aug 2023 13:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E455410E516
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJWzKxp8Y3MRvYzSwyOswrM9fvrDFZHAXcpomGjHySV6PYLAR/JLWnLl1PqISkYc3ML4fWcjZptwENSBL1z2XLozGRw/NoyMbfR4lYRurqn1cLuQq4nd4Tn3XPmIDIZFdw7Ll2s1ZAOTtlQR3iWJH2F/LdCCkvGIz0Qm77ED1/e2YnC6QeOoRDtAVMcazbCiBIaW8VaejcNIcypkqArZbs6P0hWZfD54og8qlz/i8g2lmf1SYjC2IeJ1KJruhLlxEO59R9vPhLawY77voiTExCsJazrtItExStqtjv74sWP3MBbpSyd7C486tKu7cZWmk2FKngpVih0p1uPYqS/zXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1R3BUO8BLAbNUrwqcIimp+QmxoMt2jrmhZ8xov/JTDg=;
 b=BexhOovVRb9WBSp4N9Of0QiMrY33uX4OtFzDHxQubcfjPL32N321deJejw6xNX1qpIdpjADiqqLLiyjsmR9YwAjfnidfPgXpm8njP2FvGtPN8MX5/bJMNYQFEr6hFT8ArnQsTbnqh6IKG6rPsytm/XsqAVxJoYSFue/5xowhe/S4imNa9uhhzW4u3OpLUGhzi5jBxp2LR5xMSRSXkH62Yb3jpwl4egdmoHX/1lCAdAKSbYBD5DtpH3TE1r3+sWe/gWR1p4HZiEQGhWdXmhATTh8rzTcGmvVtNi3PC/z2fCv6ZxPLVDozY+ExPYmzAJyvObeCccCZkzUrIwd/leKy3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R3BUO8BLAbNUrwqcIimp+QmxoMt2jrmhZ8xov/JTDg=;
 b=vuM2Sd/JXLzMBlG0b5zXdYWd876/Rza4O/UkW2Xmokp7eKYP8Ct7WCGzJerOJ+jA0JzIjy7cnXD/+LU1bsdZKKrHmFQQ7vMu7ykckRbsoRxXgdZRG4eWHk7EdPIJklZIcXDx65ThqIQ1652HIiGCWIRh0DQYWfu5p056UPi7AbQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11702.jpnprd01.prod.outlook.com (2603:1096:604:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 13:34:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 13:34:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Adam Ford <aford173@gmail.com>
Subject: RE: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
Thread-Topic: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
Thread-Index: AQHZzhDVVl0EoPvANkCIEcdmuUZDTa/wBo+AgAAONtA=
Date: Fri, 18 Aug 2023 13:34:56 +0000
Message-ID: <OS0PR01MB59226206B73CB28275EB9C3A861BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
 <CAHCN7xKo4Gnt+3rBgNyHq5tAAWU+nUpfJjzgb4RSPrgOgRsuyw@mail.gmail.com>
In-Reply-To: <CAHCN7xKo4Gnt+3rBgNyHq5tAAWU+nUpfJjzgb4RSPrgOgRsuyw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11702:EE_
x-ms-office365-filtering-correlation-id: e90831e4-9476-4e28-b701-08db9fefe96d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tYUtAC2WE/OZ86jMwf5XvdpJt9pTZHXcXMvno6+CCB9LOFbEjQMpVUkRGKTAkzCWafuqvokn+Y4/MTxIKrEMN2V94tLM+utpz3x0s2IYKziiCeP0r4fs2/D73liMmomPQc6w8nrzDMeSBEr0VxG91MYIxu0wjAxVUX87z01P9syR3R4hHfD11nnd96y8/D6bTsPwBbEFx9T8lbyP8+G8FefxyilwmnKkeCi4F5pnmXjbW4xu0/1ho9R8JT3PdXYEnVts6plyNZ4Hr9XlLDl++O2ehK+7BaaRTWklBibzUvnD1/ZvA1IDluh26zomDyDmiYLcFcDttBT6d2XBK/8L5Xc2ocOdf+KFKePmN9gHT79xwGd0C7103fA6+UF0GQq2b82hqwGB0jC0O2EPZLk/YENrspNrfaa+LaTfJkZolEF+wjX5bxlkXu0BT2PE3ZWJuhaZ/2uBea9zbZ8NQ7naXO61hHYvfgAXgi0DG4PyuqJqn+5EESS6Krm/TujqPEIlBwd+sepTI5rgtKugHNVQvw6N6jLQa/ZEVLagHNGnfvmcOhFUFUWFHYw/fnq8pVCSMhGXl4aUTi7Jn02PyBohZaly1TvML7uFqOnL/f2tcUTNvVVe0NlrTa2anmeyMSLM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199024)(1800799009)(186009)(26005)(71200400001)(7696005)(9686003)(53546011)(6506007)(83380400001)(4326008)(5660300002)(8936002)(52536014)(8676002)(2906002)(7416002)(478600001)(41300700001)(76116006)(54906003)(64756008)(316002)(66446008)(66476007)(66556008)(66946007)(6916009)(38070700005)(38100700002)(122000001)(55016003)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTRhTllrbGc0bDRCWlZVa3VTZXdmR3NLUU9zK3YwUkRvb2lVWk85NzhnYlZQ?=
 =?utf-8?B?cmVhV0RmdjlnTHB4NXJIY0QxSCtjZE9YZHJmSUgvdmdmcTFvQXZqVm9vUUND?=
 =?utf-8?B?cUlWdDM0MUwyWmlXalJZT1JqemNDRVFEWDA1SHM0UHA3ZzBRd0FTeEFXeEJF?=
 =?utf-8?B?OGdRWEtsUWx3ZVF6MzZzZUtBVERQOUxMR1pic2FIVnU4N0gxM0R4RlZLOVpM?=
 =?utf-8?B?NW9KWHhqbHQxTnp2cjl4ZDV4UDBvQW04M1BzdEh2Zk9XUEFMWitoTS9NUmR6?=
 =?utf-8?B?bTdTaUNBYlF0ZVRJTmtXKzR3Rk90N3dRWm5CZm5VNUtSTFNYWVBwakNQTGtY?=
 =?utf-8?B?bk9ETWRTZGRjdUdTQmZUbkxxYW1mTU9HNHRVTUp2TVhUUndZSlNDeHRkOGcz?=
 =?utf-8?B?cGVpdmRkc2hoSERQQWZIR0VWS09WV2thRm01MWVjdEh5UWg5anBIT0NBMVZS?=
 =?utf-8?B?YWI5OXhzOUFwSk5TbzkrZUMxRzAxTWVzbmQ4YlRyb2p0d3haSk1VTXg4TWZl?=
 =?utf-8?B?Zlk3a2xiV252VldQVkt5SUJYTmRtd0tyQ1pPSmEvOXJPUHdPN0tHS3FOQ3Jy?=
 =?utf-8?B?N0ZkbFhvenFmalZ2RnY3UWtZeVVwQjAycUw5ZE1zbDVoQVJqZUlEQzR6MDhR?=
 =?utf-8?B?U0VQV1E5a0JESU05UE9UZktuNURlRldtOWdneVo1QkJSbTVZVHpnUTdwcFIy?=
 =?utf-8?B?T1lHRjlaZGVXenFIb2U0QXlEdEVJNG45N0djcFV2LzNJSk1WVlhDWU44Qm40?=
 =?utf-8?B?aTlzYnZGZDBLckRmc2NXVmpCMThQbTg5U3pwZGV6ZDhITzFXQitxNWJXS3Zo?=
 =?utf-8?B?U1FpR2FkV2RXejBacDNxVUh4WVhRVVROTms4M3VOV1pUWHNDV3FLc0lPMUN4?=
 =?utf-8?B?Z051VVU4Nmc3ZDhwRzZwcFI5Qk1LeHU3M3N6Yys3R2NWSDk5eWgzS3RrbUY3?=
 =?utf-8?B?SHFUSXIwa1ZhSEJyZ3VNQkxBOTdVcEY2T29VOVVGQ0FrRmF0QkJvdS9zTTZH?=
 =?utf-8?B?WGx4aGx6dCtnN1dMbU9TRHdmVjZRZUpBVGhONGlaK2tadWt1L3U1WWwzTmhV?=
 =?utf-8?B?TlduN3BndU41M01KQjJoU0FwYUxOdmlGODZGYlF3Um5vSXY1elpZb3R4d1d5?=
 =?utf-8?B?WEVnU3NFSVQ2Yi9rMjZzRVkvbHUvUTErS0E5azVxVDRUbVF3c3dQVG84R2J0?=
 =?utf-8?B?RlkvRHlBa0pDY0YxaFdqdXhqWVp0UVM1bFZieU1nYmcxNmhtcWV6WFBHUHFE?=
 =?utf-8?B?V25UT2dIWW9id2djVitKYkZ1M0VmbENnaXNUejVjSXloa1E5WXluaGkrR293?=
 =?utf-8?B?eWxNNGRUV2tuQllWcjBuTy9oNVR3emsrWWhwZ2xmajJOLzdNVDl0d29UaVpP?=
 =?utf-8?B?OUFuWmltNDd1aWswTUZmUDBuMFdsQkdNVHpaNXdQRlZwVnlwMFdJTC9Mbmpj?=
 =?utf-8?B?UXZVUytJNEprbUp4bjh2aitKU3hRZE1KZFpIN2d2YXc1RmgwNmxkbEpzYUcy?=
 =?utf-8?B?SG4rSEM2bDhDSG9kZUJrYWpNV0FLR1ozTW5BZ2cvQWZVZ01HN2l2cHBnQUlU?=
 =?utf-8?B?U3hyMHdvUnNkbHJweTRlbDRUMjVrVUkxUGtWODRZeGN5VHVTYnIvZVVmTG1I?=
 =?utf-8?B?OGxYVytIMkFWWGp4ZjIrYVJHM3pFQmZiWDNXNHNrM3JCa3NDd0RrSDVicWV1?=
 =?utf-8?B?eTRwTVFNVmtKWnJVcHZ3T0E0K01zdHpiZ2QvTFpUNzBXbkpVQ1VOQWdOOFh6?=
 =?utf-8?B?b0NZbnJDNUpQVERCcmVjK25vWklqcWh3RXBjNGZaTnpQcmI3Z084M0NWcG4w?=
 =?utf-8?B?MG83SlNCVnp3N0JKbXRyKzYrb3o4TXR6VTJLbEduUmdJZHJwNHBPQndIY2hT?=
 =?utf-8?B?bS8wNG1kRUVPYkZXVURSTmlaU085Y2pFM2tKWktyajFUMFEwZWpFSFlCZ0pa?=
 =?utf-8?B?WWphMVExVlpsOFdFVTFNTW5wVHdzTzBMTDhWZ0FhblBNWkt2VDZva3JZVnRt?=
 =?utf-8?B?QmRSZFIxeEhXcmtOalgzeHJkVkQzN2p4ai82MlVNYklPdCt3bWdEQ0dmQWxl?=
 =?utf-8?B?ZFBTdjBCajFBZklTMXJWZStqTENpTHZPS2dya21uMU1lMmN6OHZ1V05WdGdQ?=
 =?utf-8?Q?j/jUL/rUSMgjQGFKl0J2sGHvZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90831e4-9476-4e28-b701-08db9fefe96d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 13:34:56.4784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqAbOYYPcTOTbZiW/ci2vcbbHJXBmCz/A0sCcI4Yzl/khnoXkUJyBCHZz6W6AYLElZYQ5Q+IsHHL8ykFDt/MgO4Ef0Muq94XBi8j3LW80Og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11702
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbSBGb3JkLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDcvN10gZHJtOiBhZHY3NTExOiBBZGQgaHBkX292ZXJyaWRlX2VuYWJsZSBmZWF0
dXJlIGJpdA0KPiB0byBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gDQo+IE9uIFN1biwgQXVn
IDEzLCAyMDIzIGF0IDE6MDbigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gQXMgcGVyIHNwZWMsIGl0IGlzIGFsbG93ZWQgdG8gcHVs
c2UgdGhlIEhQRCBzaWduYWwgdG8gaW5kaWNhdGUgdGhhdA0KPiA+IHRoZSBFRElEIGluZm9ybWF0
aW9uIGhhcyBjaGFuZ2VkLiBTb21lIG1vbml0b3JzIGRvIHRoaXMgd2hlbiB0aGV5IHdha2UNCj4g
PiB1cCBmcm9tIHN0YW5kYnkgb3IgYXJlIGVuYWJsZWQuIFdoZW4gdGhlIEhQRCBnb2VzIGxvdyB0
aGUgYWR2NzUxMSBpcw0KPiA+IHJlc2V0IGFuZCB0aGUgb3V0cHV0cyBhcmUgZGlzYWJsZWQgd2hp
Y2ggbWlnaHQgY2F1c2UgdGhlIG1vbml0b3IgdG8gZ28NCj4gPiB0byBzdGFuZGJ5IGFnYWluLiBU
byBhdm9pZCB0aGlzIHdlIGlnbm9yZSB0aGUgSFBEIHBpbiBmb3IgdGhlIGZpcnN0DQo+ID4gZmV3
IHNlY29uZHMgYWZ0ZXIgZW5hYmxpbmcgdGhlIG91dHB1dC4gT24gdGhlIG90aGVyIGhhbmQsDQo+
ID4gYWR2NzUzNSByZXF1aXJlIHRvIGVuYWJsZSBIUEQgT3ZlcnJpZGUgYml0IGZvciBwcm9wZXIg
SFBELg0KPiA+DQo+ID4gQWRkIGhwZF9vdmVycmlkZV9lbmFibGUgZmVhdHVyZSBiaXQgdG8gc3Ry
dWN0IGFkdjc1MTFfY2hpcF9pbmZvIHRvDQo+ID4gaGFuZGxlIHRoaXMgc2NlbmFyaW8uDQo+ID4N
Cj4gPiBXaGlsZSBhdCBpdCwgZHJvcCB0aGUgZW51bSBhZHY3NTExX3R5cGUgYXMgaXQgaXMgdW51
c2VkLg0KPiANCj4gSXQgc2VlbXMgbGlrZSBkcm9wcGluZyBhZHY3NTExX3R5cGUgaXMgdW5yZWxh
dGVkIHRvIHRoZSByZXN0IG9mIHRoZSBwYXRjaCwNCj4gYW5kIEkgdGhpbmsgaXQgc2hvdWxkIGJl
IHNwbGl0IGZyb20gdGhpcyBpbnRvIGl0cyBvd24gcGF0Y2gNCg0KV2l0aCB0aGlzIHBhdGNoLCB0
aGVyZSBpcyBubyB1c2VyIGZvciBhZHY3NTExX3R5cGUgdGhhdCBpcyB0aGUNCnJlYXNvbiBpdCBp
cyBhZGRlZCBoZXJlLiBJIHRob3VnaHQgdGhhdCBpcyB0aGUgY29tbW9uIHByYWN0aWNlLg0KDQpQ
bGVhc2UgY29ycmVjdCBtZSBpZiB0aGF0IGlzIG5vdCB0aGUgY2FzZS4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo+IA0KPiBhZGFtDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYWR2NzUxMS9hZHY3NTExLmggICAgIHwgIDggKy0tLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgfCAxMiArKysrKy0tLS0tLS0NCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPiBpbmRl
eCA2Mjc1MzFmNDhmODQuLmM1MjNhYzRjOWJjOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+IEBAIC0zMjUsMjIgKzMyNSwxNiBAQCBzdHJ1
Y3QgYWR2NzUxMV92aWRlb19jb25maWcgew0KPiA+ICAgICAgICAgc3RydWN0IGhkbWlfYXZpX2lu
Zm9mcmFtZSBhdmlfaW5mb2ZyYW1lOyAgfTsNCj4gPg0KPiA+IC1lbnVtIGFkdjc1MTFfdHlwZSB7
DQo+ID4gLSAgICAgICBBRFY3NTExLA0KPiA+IC0gICAgICAgQURWNzUzMywNCj4gPiAtICAgICAg
IEFEVjc1MzUsDQo+ID4gLX07DQo+ID4gLQ0KPiA+ICAjZGVmaW5lIEFEVjc1MTFfTUFYX0FERFJT
IDMNCj4gPg0KPiA+ICBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8gew0KPiA+IC0gICAgICAgZW51
bSBhZHY3NTExX3R5cGUgdHlwZTsNCj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWF4X21vZGVf
Y2xvY2s7DQo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIG1heF9sYW5lX2ZyZXE7DQo+ID4gICAg
ICAgICBjb25zdCBjaGFyICogY29uc3QgKnN1cHBseV9uYW1lczsNCj4gPiAgICAgICAgIHVuc2ln
bmVkIGludCBudW1fc3VwcGxpZXM7DQo+ID4gICAgICAgICB1bnNpZ25lZCBoYXNfZHNpOjE7DQo+
ID4gICAgICAgICB1bnNpZ25lZCBsaW5rX2NvbmZpZzoxOw0KPiA+ICsgICAgICAgdW5zaWduZWQg
aHBkX292ZXJyaWRlX2VuYWJsZToxOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0cnVjdCBhZHY3NTEx
IHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MTFfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Ry
di5jDQo+ID4gaW5kZXggNjk3NGMyNjdiMWQ1Li43YjA2YTBhMjE2ODUgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IEBAIC0z
NTQsNyArMzU0LDcgQEAgc3RhdGljIHZvaWQgX19hZHY3NTExX3Bvd2VyX29uKHN0cnVjdCBhZHY3
NTExDQo+ICphZHY3NTExKQ0KPiA+ICAgICAgICAgICogZmlyc3QgZmV3IHNlY29uZHMgYWZ0ZXIg
ZW5hYmxpbmcgdGhlIG91dHB1dC4gT24gdGhlIG90aGVyIGhhbmQNCj4gPiAgICAgICAgICAqIGFk
djc1MzUgcmVxdWlyZSB0byBlbmFibGUgSFBEIE92ZXJyaWRlIGJpdCBmb3IgcHJvcGVyIEhQRC4N
Cj4gPiAgICAgICAgICAqLw0KPiA+IC0gICAgICAgaWYgKGFkdjc1MTEtPmluZm8tPnR5cGUgPT0g
QURWNzUzNSkNCj4gPiArICAgICAgIGlmIChhZHY3NTExLT5pbmZvLT5ocGRfb3ZlcnJpZGVfZW5h
YmxlKQ0KPiA+ICAgICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVn
bWFwLCBBRFY3NTExX1JFR19QT1dFUjIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBBRFY3NTM1X1JFR19QT1dFUjJfSFBEX09WRVJSSURFLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQURWNzUzNV9SRUdfUE9XRVIyX0hQRF9PVkVSUklERSk7
DQo+ID4gQEAgLTM4MSw3ICszODEsNyBAQCBzdGF0aWMgdm9pZCBhZHY3NTExX3Bvd2VyX29uKHN0
cnVjdCBhZHY3NTExDQo+ID4gKmFkdjc1MTEpICBzdGF0aWMgdm9pZCBfX2Fkdjc1MTFfcG93ZXJf
b2ZmKHN0cnVjdCBhZHY3NTExICphZHY3NTExKSAgew0KPiA+ICAgICAgICAgLyogVE9ETzogc2V0
dXAgYWRkaXRpb25hbCBwb3dlciBkb3duIG1vZGVzICovDQo+ID4gLSAgICAgICBpZiAoYWR2NzUx
MS0+aW5mby0+dHlwZSA9PSBBRFY3NTM1KQ0KPiA+ICsgICAgICAgaWYgKGFkdjc1MTEtPmluZm8t
PmhwZF9vdmVycmlkZV9lbmFibGUpDQo+ID4gICAgICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVf
Yml0cyhhZHY3NTExLT5yZWdtYXAsIEFEVjc1MTFfUkVHX1BPV0VSMiwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEFEVjc1MzVfUkVHX1BPV0VSMl9IUERfT1ZFUlJJREUs
DQo+ID4gMCk7DQo+ID4NCj4gPiBAQCAtNjgyLDcgKzY4Miw3IEBAIGFkdjc1MTFfZGV0ZWN0KHN0
cnVjdCBhZHY3NTExICphZHY3NTExLCBzdHJ1Y3QNCj4gZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9IGNvbm5lY3Rvcl9zdGF0dXNf
ZGlzY29ubmVjdGVkOw0KPiA+ICAgICAgICAgfSBlbHNlIHsNCj4gPiAgICAgICAgICAgICAgICAg
LyogUmVuYWJsZSBIUEQgc2Vuc2luZyAqLw0KPiA+IC0gICAgICAgICAgICAgICBpZiAoYWR2NzUx
MS0+aW5mby0+dHlwZSA9PSBBRFY3NTM1KQ0KPiA+ICsgICAgICAgICAgICAgICBpZiAoYWR2NzUx
MS0+aW5mby0+aHBkX292ZXJyaWRlX2VuYWJsZSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICByZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVnbWFwLA0KPiBBRFY3NTExX1JFR19QT1dF
UjIsDQo+ID4NCj4gQURWNzUzNV9SRUdfUE9XRVIyX0hQRF9PVkVSUklERSwNCj4gPg0KPiA+IEFE
Vjc1MzVfUkVHX1BPV0VSMl9IUERfT1ZFUlJJREUpOyBAQCAtMTM2MCwxNCArMTM2MCwxMiBAQCBz
dGF0aWMgdm9pZA0KPiA+IGFkdjc1MTFfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMpICB9
DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBhZHY3NTEx
X2NoaXBfaW5mbyA9IHsNCj4gPiAtICAgICAgIC50eXBlID0gQURWNzUxMSwNCj4gPiAgICAgICAg
IC5zdXBwbHlfbmFtZXMgPSBhZHY3NTExX3N1cHBseV9uYW1lcywNCj4gPiAgICAgICAgIC5udW1f
c3VwcGxpZXMgPSBBUlJBWV9TSVpFKGFkdjc1MTFfc3VwcGx5X25hbWVzKSwNCj4gPiAgICAgICAg
IC5saW5rX2NvbmZpZyA9IDENCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGFkdjc1MTFfY2hpcF9pbmZvIGFkdjc1MzNfY2hpcF9pbmZvID0gew0KPiA+IC0gICAgICAgLnR5
cGUgPSBBRFY3NTMzLA0KPiA+ICAgICAgICAgLm1heF9tb2RlX2Nsb2NrID0gODAwMDAsDQo+ID4g
ICAgICAgICAubWF4X2xhbmVfZnJlcSA9IDgwMDAwMCwNCj4gPiAgICAgICAgIC5zdXBwbHlfbmFt
ZXMgPSBhZHY3NTMzX3N1cHBseV9uYW1lcywgQEAgLTEzNzYsMTIgKzEzNzQsMTIgQEANCj4gPiBz
dGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFfY2hpcF9pbmZvIGFkdjc1MzNfY2hpcF9pbmZvID0g
eyAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFfY2hpcF9pbmZvIGFk
djc1MzVfY2hpcF9pbmZvID0gew0KPiA+IC0gICAgICAgLnR5cGUgPSBBRFY3NTM1LA0KPiA+ICAg
ICAgICAgLm1heF9tb2RlX2Nsb2NrID0gMTQ4NTAwLA0KPiA+ICAgICAgICAgLm1heF9sYW5lX2Zy
ZXEgPSA4OTEwMDAsDQo+ID4gICAgICAgICAuc3VwcGx5X25hbWVzID0gYWR2NzUzM19zdXBwbHlf
bmFtZXMsDQo+ID4gICAgICAgICAubnVtX3N1cHBsaWVzID0gQVJSQVlfU0laRShhZHY3NTMzX3N1
cHBseV9uYW1lcyksDQo+ID4gLSAgICAgICAuaGFzX2RzaSA9IDENCj4gPiArICAgICAgIC5oYXNf
ZHNpID0gMSwNCj4gPiArICAgICAgIC5ocGRfb3ZlcnJpZGVfZW5hYmxlID0gMQ0KPiA+ICB9Ow0K
PiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBhZHY3NTExX2kyY19p
ZHNbXSA9IHsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BE8119F5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 17:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E06F89A5E;
	Wed, 13 Dec 2023 16:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463289A5E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 16:46:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaTLbiE526B2Ez0hn3Pw9TRzdbzemld34imn7aSdxk60FTjf+wrj3924M/dRyz7ys0VzNKtWacXJ/p566TJuU9VKPk9wuI9BEdG77nHyEeVNRZLraS+YOZiABwHm+FddJW7RENVRhSfV603Ues1q5y9BRPyVIsiCDRjCKiWNxUXm8O6mtKPi/Jq27qdbXdJ0MRPU8Zky970fwzkriPn19CvuJRSaikbZzjEA5kuqIPLb0WFAOLXhKmCwMH1vdebYOA4NV0yoQHzPTUXaY40UdOCEOrPLQKFgqnNjBcoh8DCZCnfo/s4J1IqmlUdGy5qH/dtvNrCTbdU1pX6ZIEdBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKGcGdumD4BoGvzTChFDqQlOnXQOcvz43rgrpSCE4PE=;
 b=RhSBqX0iqPTJVJYE4NiMfhHAhq3o3zwJSrciBH/u8m27BkKFu7MCTe8NiptTgywVRSch515U7pPTLJeQVTpQt4BTgi4tjrbosEk3yBVa8FvzDZVTtN6xK0AMa0QpbF6br1J3b8xRmdiGug9OlaJ1SQNn0VqGhe0RGp/dsS+Y2mCi4rFH/6z1LT91YybODwvR5ioaGNRwQH08eYn6l4fjfM5k9s8+/kObVzUlofix2M1qLYiCNTvdsNI8S7+hpDUsIiao9F3Io7wHIp+5MrdK8Gk34QFUIMn6PU+PMYlYqIYrZsnz7W3GSVDpODip0Ltxjsbt3Or3H7ltotGUjYR44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKGcGdumD4BoGvzTChFDqQlOnXQOcvz43rgrpSCE4PE=;
 b=WaXIDHFHSx0LOF5C3A5AXYtDsEi/6fx97DqqWNaxdvUD088JIMGoDlGRcVJFUOqQ4CjXyp9qAXJ5n+8c6eYUuL6JmUCj8yNoBkksMqYQsWTo3Ou7I2GQ6uOowa/1YNHTvVDvtQSOlyTodUp4Br0sckHs8MK4gBdIVZ0PpMEw8yk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYYPR01MB8262.jpnprd01.prod.outlook.com
 (2603:1096:400:fe::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Wed, 13 Dec
 2023 16:46:12 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 16:46:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard
 <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAABB4CAAA8LQA==
Date: Wed, 13 Dec 2023 16:46:12 +0000
Message-ID: <TYCPR01MB11269D104AF4CE8CDF8A40B3D868DA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <20231213155049.GH12450@pendragon.ideasonboard.com>
In-Reply-To: <20231213155049.GH12450@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYYPR01MB8262:EE_
x-ms-office365-filtering-correlation-id: 66e06b8d-88a5-47cb-f134-08dbfbfb03bc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: btQahSi1SStaX2XZ0lq7ffrmgaeQ2ZO/d3scMxioK7PzjxP5C7HvUAgiDwZBpRU0KXU26tAv9Wx0+y6Y3r2euA7Ck2j2X/hUcWCrU0Wqw5fGZMLKk9luRHrhIs/oAnLbQ7gZh1aY7ezW0rYQY0S/VI92rlnDk4zP//RF4I/1ALNUvUIRJi77LmYM0iJpJkZyES0e3k2sNutyYa0vDy2jjrSDSmr012fPo6Itfs5CEwm5YimbAbmVdXtV5fZ4wBU2IlGpILsAUBY9CAvltvYgwstqYLVgsmf4p2mcL/K23JvWIkjmrY10fxufoxk/pAAG+/v6xdkAD0Y0hmaGzLTZ+iHI68/5UEnthaXCajwNJfkTO31Uy3h5iYBBUDZXRKqRGSOvgk3KOk/PuYaH1nl6ACUbGVLMY0d+ZgFPkEpaCF02g3Sd0h1QsHFz0Q0+Nd5ry/mJW41kkVFGi4o1gIPWP44a2Wy7XTS6Z/u4LlP6kh7idfeSGdPQIn9AKiSyba1uEAISZt6fHR8eOtmd9LjzsTPIVZ477/mDNrQa2dHAcFbQkIFOryHWlSdd8+gTUXm8xJ70mKu1YP+gNkNkBz3OLErLWiy725+QbkxDEDKIwYg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(478600001)(55016003)(966005)(6506007)(7696005)(26005)(5660300002)(110136005)(9686003)(71200400001)(53546011)(66946007)(66446008)(66476007)(76116006)(66556008)(83380400001)(316002)(64756008)(54906003)(8936002)(8676002)(4326008)(52536014)(2906002)(38070700009)(41300700001)(86362001)(33656002)(122000001)(38100700002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEpVREx5RTB0Q2x5dlhJZHp1b2U0Y2lkdVNCc3VsMU1adzlMNU1veldJQTM5?=
 =?utf-8?B?VmkrU1BDMlNvUlhidHo2a1oxNTJYdjl0MnIrWUJHUXYyZVFsdmtkVW9BR3pQ?=
 =?utf-8?B?Q0cySmVmdVYrVTVDU0h0bktWaVRBZGxqWU9wQ1VNb1V5c04zdmVxUk5sTWVC?=
 =?utf-8?B?K1hPN01VYVArYXE2cGJ5VXpZOVhsb3dmOVR5QmtRNWRrWmI3bXc5ek14dlVK?=
 =?utf-8?B?MTdXbWx2OXVQYlJUZzhaV0FRaVRQUWVsc1Z4MUVYcmN4S3M2NkxnWFRYZTZN?=
 =?utf-8?B?MisvV2NLb3RFK0hpNVUrdTdoWi81WEpsUDhTL2tDVTFuTU53QVlUN2wyNG1V?=
 =?utf-8?B?T1dpdHliVlVwTHdzQWtiZWwzTWhsTk1pbEYxNUU4WU9aVTJzeWVmaERMWU9i?=
 =?utf-8?B?ZGpIb2JsSjZjbzgxZ3BaaXg3UURUTDk5L2o5WWtxc2RlRFdSNUJMNmxlOXNh?=
 =?utf-8?B?dU9QY0NWQjlqUkpMeU5SQm9WZWx4MnZLQkNnUk9TSjlEN2tkZ01YelBxZnFM?=
 =?utf-8?B?ajVNdzlkcWxiWk5PTHYxc3ZRckdEekNFV0svc2VqVU1nNm5RQzVtT2xOTnN2?=
 =?utf-8?B?Y0g0SnY5UDZBL2FLbEZCbko1NXRmUHhodTJsendwWWNxVUpHeUVHcUY1RVY0?=
 =?utf-8?B?M1hzVkJCOGtHNFRqYlg5QXBTZnBPMy94aTZMMURGaWhJTnkyUHVwV1ZnODBT?=
 =?utf-8?B?am1rUFZxa3pESzJ5S2FzbFYyVFZKY21uTVVjTjUxdGFRNTY0QXRiRk5MeWdp?=
 =?utf-8?B?WXZNWFZJMlNybERKNzVaU2ZndXNZcGVtdGI0NEdwNnRaRnlRN0EyeE9aWG5q?=
 =?utf-8?B?ZUJISDNFMW0zeE1HWlA1VkNMN3Nqb2p6L3VHYURSZHVYSFFmMFNNMCtHTmZ5?=
 =?utf-8?B?ZUJIVDM3ZDRDaXZyd0ZHeXFJUE8vU1VidHZuNElxM0tXc2RIMWpVN3hVaTA3?=
 =?utf-8?B?ZWdVcEcrZVVHdjB4eHZabEhFM3VTd0R6ZnZJcjR5SjZOVUlXS3hkZDQrZ1NX?=
 =?utf-8?B?K2E5WXdtMW1kYnVmVllFdmtCOVRrcW44bHF3Wjc0dyt3RWZVMERoL3Zvb0lv?=
 =?utf-8?B?UDUxMUk0eWdtLzVVVlJ6aFV2U1pDUTBrTWRxbHY2T2NQNEREUm5nVjRya2hu?=
 =?utf-8?B?Mzd3Z1o2SHorelBQVUQrc0J5QnRqbVJ1Q2tZbERjSmNLRktWUFZudTZTQ1NK?=
 =?utf-8?B?RHU3WlNaeXMxTWllVGpncVI2V2ptT2VqOFVYUUNWTTFEV25wa2FmYTRaZFM1?=
 =?utf-8?B?SCtUYzBUWFcvUTNtWFVrZ1ZRWnh0cEY2Znc3OVdnT1Y1MXhhRU1lNGRGaEd6?=
 =?utf-8?B?QksveVI3V2VnNnBMOXlKVVJPQVo4bEkxYXlOR2FMTXFJUVpUZzdGanlXSWY3?=
 =?utf-8?B?S2NpVHlXMzc1RnhIM1p3U2NLOUhvSE1zbjBtNWJOM1p6Tk96dTZEMDJxdGpo?=
 =?utf-8?B?MEZKbFY3NzN3UzVGVk9zS2xMaEc4eGk2ZkVsV201ZjdxaTV2NlhucURSRENl?=
 =?utf-8?B?alNVWjJBNkdaSHI3SzBLWTFUN1ZjaDBrZFJUQnQxNjJ1ekoxR1Yvamd4c1hC?=
 =?utf-8?B?QnFjNjJncXZuY21vUllwMHZ4ZDJmcTNIT1dIQ1JWdFJvM3Rzc1EyRnF2ZFdv?=
 =?utf-8?B?RlkvTEp6S0VFcy81bW40dWtKUjZ1a05XNlZzd3V2TUdvUlRpdU5zUjdES3k2?=
 =?utf-8?B?dHpkeGp4ZjB6RnNnaXdidGQ4YUtyay9XcWZPZ3cvUjZzQ1NQK01NUzY3UkxT?=
 =?utf-8?B?aStXSEpma3ZxMGtCVTBJN3lsbnZ0RDhVb3JRSTZpS1ptcGJMQWU1cjlEdk8w?=
 =?utf-8?B?T295SjVsR2h6b0JIb1V2Mk9sN3JQZ0g5TXhmNGpVNW5SSjNUYmVmbm5Kbm1r?=
 =?utf-8?B?YVNXZUZwSllXTDdSQlQyYzhQanNEdXIwQUtRYk11TThKY3FSUEE3aFJsZElm?=
 =?utf-8?B?RDk3SDV3SjRTMExYTkp6QTl2ZUlEWWkyTzVQQW1Ed3lVZ3lVa0JTSmdIYnEv?=
 =?utf-8?B?WFFtdWxKa3FXMTJFd3l3dHhIOHBQdEtBNWcvbWlKelRJaWRDMjR5NWVNbE5n?=
 =?utf-8?B?OGlnVTRCS1pjS2RSWVRGRW5ERENxYzd3ZERoY1JMU0FDeWlBVXNCUXowakQ5?=
 =?utf-8?B?amZBa0twN2FaNkFYTzBXVXgxdGN2eUpUci92Q0RLTm1hMlltS1lDVjNKcUh2?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e06b8d-88a5-47cb-f134-08dbfbfb03bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 16:46:12.0963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhdXYjAy/z7lza/R2/m43nQ4b1iL2J7qEV8e+yVT+aTxvNtafa5HTzQuYc41yrgdYNt4HeFAmqdvMjglUifMxFGNVUhflfhZBXhj+ZeLTxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8262
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
Cc: "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBhbmQgTWF4aW1lLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4NCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxMywgMjAyMyAzOjUxIFBNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjE1IDMvNV0gZHJtOiByZW5lc2FzOiBBZGQgUlovRzJMIERVIFN1cHBv
cnQNCj4gDQo+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDA0OjQ3OjA5UE0gKzAxMDAsIE1heGlt
ZSBSaXBhcmQgd3JvdGU6DQo+ID4gT24gVHVlLCBOb3YgMjgsIDIwMjMgYXQgMTA6NTE6MjdBTSAr
MDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiBUaGUgTENEIGNvbnRyb2xsZXIgaXMgY29tcG9z
ZWQgb2YgRnJhbWUgQ29tcHJlc3Npb24gUHJvY2Vzc29yDQo+ID4gPiAoRkNQVkQpLCBWaWRlbyBT
aWduYWwgUHJvY2Vzc29yIChWU1BEKSwgYW5kIERpc3BsYXkgVW5pdCAoRFUpLg0KPiA+ID4NCj4g
PiA+IEl0IGhhcyBEUEkvRFNJIGludGVyZmFjZXMgYW5kIHN1cHBvcnRzIGEgbWF4aW11bSByZXNv
bHV0aW9uIG9mIDEwODBwDQo+ID4gPiBhbG9uZyB3aXRoIDIgUlBGcyB0byBzdXBwb3J0IHRoZSBi
bGVuZGluZyBvZiB0d28gcGljdHVyZSBsYXllcnMgYW5kDQo+ID4gPiByYXN0ZXIgb3BlcmF0aW9u
cyAoUk9QcykuDQo+ID4gPg0KPiA+ID4gVGhlIERVIG1vZHVsZSBpcyBjb25uZWN0ZWQgdG8gVlNQ
RC4gQWRkIFJaL0cyTCBEVSBzdXBwb3J0IGZvciBSWi9HMkwNCj4gPiA+IGFsaWtlIFNvQ3MuDQo+
ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+DQo+ID4gSSdkIHN0aWxsIGxpa2UgYSByZXZpZXcgZnJvbSBHZWVydCBvciBM
YXVyZW50LCBJIGRvbid0IGtub3cgdGhlIFNvQy4NCj4gDQo+IEkgd29uJ3QgaGF2ZSB0aW1lIHNv
b24sIGFuZCB0aGlzIGRyaXZlciBoYXMgYmVlbiBibG9ja2VkIGZvciB3YXkgdG9vIGxvbmcNCj4g
ZHVlIHRvIHRoYXQgOi1TDQoNCg0KSXQgaXMgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIHllYXIgbm93
Lg0KDQpGWUksIEFsbCB0aGUgYml0cyBhbmQgcGllY2VzIG9mIHRoaXMgZGlzcGxheSBwaXBlbGlu
ZSAoRkNQLCBWU1BELCBEU0ksIEFEVjc1MzUpDQppcyBtYWlubGluZWQgYW5kIHRoZW4gYmFja3Bv
cnRlZCB0byBsaW51eCA1LjEwLnktY2lwWzFdIGFuZCBsaW51eC02LjEueS1jaXBbMl0gYWxvbmcg
d2l0aA0KTUFMSSBHUFUgYW5kIE1FU0Egc3VwcG9ydC4NCg0KWzFdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NpcC9saW51eC1jaXAuZ2l0L2xvZy8/aD1s
aW51eC01LjEwLnktY2lwDQoNClsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jaXAvbGludXgtY2lwLmdpdC9sb2cvP2g9bGludXgtNi4xLnktY2lwDQoN
ClszXSBodHRwczovL2dpdGh1Yi5jb20vcmVuZXNhcy1yei9tZXRhLXJ6LXBhbmZyb3N0L2Jsb2Iv
bWFpbi9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1rbXNyby1BZGQtcmNhci1kdS1l
bnRyeS1wb2ludC1mb3ItUmVuZXNhcy1SWi1HMkx4LXNlLnBhdGNoDQoNCk9ubHkgRFUgZHJpdmVy
IGlzIHBlbmRpbmcgZm9yIGNvbXBsZXRpb24gZm9yIFJaL0cyTCBmYW1pbHkgb2YgU29Dcy4NCg0K
Q2hlZXJzLA0KQmlqdQ0K

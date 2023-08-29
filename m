Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75E78C76F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405A10E344;
	Tue, 29 Aug 2023 14:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FF710E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AT83ifZjMEiZc1HkyXKg7pRtGxBUzVgq2kcPG9+GKPaBUnCBJFb/jiInaPZ6L1lq+aNsv8oTcfA3H5YhGPNF3uJyKisHAjwL6Q4idnCJqP0RETE//Ys0Woy0GR8LOIpvK1BV2unsAtCg33dn3r0nL7HIxYHBtT81n1sW5yqD2Nj+K3J7j2VYgmLbH3KNRvTErVa3MWVa7v1V1t153HAT6lbvEsGzH41ah3fOjpLrqR2d09lJqRHWdRYnm7s27xdbdK4NMP7aZK2YpOuIMw+C/jnUC26JVuBiAqqSzdvSMi8yjI8Iv+f6LvH9pZRynLd9UfCrS1aHUvZGqVjon0AJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N61GkdrZKMYGTYslzhOyoZ+IzVvpJLnO7FlOQhaEgeY=;
 b=jt8zqK8NQTHi84qJ1S7tyN1stX1M4aCMreBTr70px3JlildtsH7JE6Bf/kaifJAM8tl3lPQCUWwfoubmDC7RbUSR4R97MgmtZEAbt/85ETH70QQCnPOJ7PhUZPQK0TJLRTza6PckFfSF86SOKC1MVMti+lf53Rm5QKi2VwyS5txQJ/EUM9o+d08lWxJKkVimSh6NzOhKs/gta97aEfIYd7aTyFOiO+Sx1TE/NEWW1IiC/kTPZuHc555mp5zqyfNlaUNUhaDAZvkYfUvMWv7uMQ1PnrVaqBy8LvNFuAa0CucfHIqCtt1SXf/PzTvbEC6m984xi6Yo1UxLS9+A+iiSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N61GkdrZKMYGTYslzhOyoZ+IzVvpJLnO7FlOQhaEgeY=;
 b=d2pB4vxL0oHVcHt2FJCYNak20306jZwYqzawihgq01DUxIaFwtbHfMus4Ny3vIlIzCiIUpUvywYJVNidHXfFREUm9Y4mj+pNlyHXpCVeU+gAFzq4b6sJPHcDIQt1l+RFUf5mEVjov/iDcC4mBM0XgAv9uwDxkZ4gWBwdhZMNmTY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8905.jpnprd01.prod.outlook.com (2603:1096:604:17d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 14:22:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:22:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Adam Ford
 <aford173@gmail.com>
Subject: RE: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
Thread-Topic: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
Thread-Index: AQHZzhDVVl0EoPvANkCIEcdmuUZDTa/wBo+AgBD0ewCAAHDgwA==
Date: Tue, 29 Aug 2023 14:22:45 +0000
Message-ID: <OS0PR01MB592263D8F36CA6119659DEBB86E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
 <CAHCN7xKo4Gnt+3rBgNyHq5tAAWU+nUpfJjzgb4RSPrgOgRsuyw@mail.gmail.com>
 <20230829073656.GC2302@pendragon.ideasonboard.com>
In-Reply-To: <20230829073656.GC2302@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8905:EE_
x-ms-office365-filtering-correlation-id: a5739cdc-c701-40b0-2457-08dba89b6a19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fyv8TOQoUgfyevlsRep3f1XIMalGZWk/H4+1M94YMMFuFMnXOcKDhH9iB+3STlk8ZJ//umRX/05z0PEFcN4hGvi3nPMBJAnHX/OSAXeoB58PzSgHG56proQFDLSHv+CctPG+wdvVySTC+GHi0lDe8Y+9KAloCwv7MxzQ2odBN/L4SrKWkA2qpBZxDwiOEtlb3rsfUc9sdHyI3W88COgcFCEaCi2PcHAcBNixxzXZKRXqM/W/leUD3bMlirXcRcfEZfDJNiqYXUw5W66CBkj4xcXcdKDWcU+z4w5S9fsXK++ReZ1c/S5kwaMoreZ/JXcs5utyjqnJ6UD6USW5XfImSU24zuP6muqmF1t3DjiaZ3uE+3UXaSBzECd2iLl2n80dAZbv4W/I2UDQm97lLa1bCE+zTY56vAUiTkEDDKdbdxO23ST+rwUnF184N7FPKEXZdHCXzOfeiAt3QKXxkGcNoVetuupBhaahDmJD6hcxqLxrMu1r8ywdw7Q60Xxx4X8F5HTg0eqA3A7neTYbiqwbp8ifCAET7xpYeTNiMwk4Tm+oFfbbQm4RsyWyRib+CpRR31TffkSnxU4OLZXGVIaQHRo6XdmC2I4m+2bAyvDJRvUnSnCMuok89G4iiHF5IpjE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(1800799009)(186009)(451199024)(7416002)(2906002)(54906003)(76116006)(33656002)(64756008)(66446008)(66476007)(66556008)(66946007)(5660300002)(316002)(55016003)(41300700001)(8936002)(4326008)(8676002)(52536014)(110136005)(71200400001)(6506007)(7696005)(53546011)(9686003)(38100700002)(38070700005)(122000001)(86362001)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0diUCtQMXg5RHVCTVZUdVFMazlWWklSR1NwZlg5VGJ1TGNmV0Y5THVjL08x?=
 =?utf-8?B?STd2N2xFVDgrQ0YwTkhUWDVKVk9JMDV1NklVYXNjejlzMG5aRHBJamNmS0hV?=
 =?utf-8?B?NmdlbjEvQWJWTU5BYXZIRWNUL2d1NWxKeU5QOHo2eEZ1dWptclM5N0JlaCtp?=
 =?utf-8?B?ZUNFc0hBRlRKZTdUaThVbk13dWRUdTRsaHBnOUJycmdPR2JUVWIzTXAyalBU?=
 =?utf-8?B?S1pFaHptY1JxOFUwV3lPN1U3cVdUaksxa2xjTDZZVTQwMW8vRytnKzRseTQx?=
 =?utf-8?B?ZUdpaEFMOWZTUzIyUDJ5ajFrZU9TeWIyVGtjcHlabkJvMmtzZlIxWTUwdCtP?=
 =?utf-8?B?eGtqTzZ2VzFCUkNrQ2ZUUEx0WnBzTEozT0lZSFgxYXZmTkliRmJ5VVNiUHht?=
 =?utf-8?B?dGxQMmN0ZXl2WFVJWEJIQ25Ib2Urc3VGRmZhZ3RLWW1jeHQrZkJKSkRPbjA1?=
 =?utf-8?B?R2pnRjIxWXI1cVMzZkhGS3VVd1pZYXowc1YwaUVrKzBaSUdmdU9maXU5UFNZ?=
 =?utf-8?B?M0xyaUF3ZlVNaFB5WDdRRU91b003bzJOeGZxMzlRbG03djlvR0FDcmNxTVRk?=
 =?utf-8?B?Q3lzUm1uUFo3cEEzTEc2N0lrOXJvSlNwbDVmY1diTlRXT3I1UDQ3WkRoVEcx?=
 =?utf-8?B?cEFvWENwb09oaDFDVFcrcGtNZ3crLzNncENqTzdxeXFCVTV3czJ0N204YmRy?=
 =?utf-8?B?Mk54NE9aT3dSQjM5K3VnSzd2TFJwUjBuNXQ4MmdMSVBoRnRka21BVGc5bXdv?=
 =?utf-8?B?V2xWMzAwQk5FZzFkUUpqakxuY3hYNmVacnpIWGpORDhBdU9sbGovbkJibmw1?=
 =?utf-8?B?TjVRaVd2MGpRMVE1MWQyWGIwNUdNK09ndUYyL1ZrWk5ZemkrTWk3YkQyK1V3?=
 =?utf-8?B?OWpHek9NdXJHVStUTlc2TXNzZGFoTEp2bVkwVldwSkFjTDE1bElWSVNYNk9M?=
 =?utf-8?B?RTF6Y255Zm50dUlWamJycjZOMVA3ejNMUHZwUDVCWDRQV1cvdkp2K2xWZUU2?=
 =?utf-8?B?L0FzZEVNVWRLZnlVWTFweDUxRWp4aWlod0s1L3hPSndNdWRxZE92OTllNVJU?=
 =?utf-8?B?cDV5RnZiQytjUFFUWDRsRWV5bC92WTJ4dzdVVTloc1pTcGRrRWY4b0R4akFZ?=
 =?utf-8?B?NHNUZWhxMWgvQkRTazNNSTNPWWtmMS9QNUpYMkdDa3IxQThTSXdUNUFhaTJy?=
 =?utf-8?B?eUJBbWVzRGZQODh1bG1WYno4aGh5UzQ3S3FYanV6anRRdXRNc2pUYWRmT25T?=
 =?utf-8?B?L1RmVTBXZzZNYUJIUlA0ODREb3gya2lvd3N1MUhUdCtEelROSVFnYjQ0V0tw?=
 =?utf-8?B?RHIwY3pUdHJOOWpCOEo4WEFZWGxiUVcrTXJHWk4xOEh5alZ6V0lCQ1Z1NFdP?=
 =?utf-8?B?ZTlINVord01mNDhwRXJsTU9zVU5QUE4vODQ4S1l2UkZIWGJTM0hZc1B5Mzd5?=
 =?utf-8?B?T2E5d1dpSVN6dU40VHg1c3F1anU2ckZtU25ldjBOYnNHMkY0YUw3QUNuN05C?=
 =?utf-8?B?SEJ6R1N4dU1CZTcyL29ONDBsY0VPU3lycjBlMWNMS0laUCtQMjZmNDd0cmd6?=
 =?utf-8?B?bkcxSFZtdkdkTWZZNWt0ak5oQVJ1NnFxWWJFZnZ4SjFhdHFRZ2VtT3dQSzRp?=
 =?utf-8?B?VWtOSWQ4TmtyVC9HMmdZZnZjcUFUa0E3THZYUnhaVSswV3lEWUVDME1Oc0hy?=
 =?utf-8?B?Uk1aVXBMZ2RST3poYksyYmxxOEV4ZW9xMmhuUVBINTdSSk5kM2EybThqUFZK?=
 =?utf-8?B?ZzJiSG1ZQkl0VEU3TWtrazhPUnF4UVJVdzRaQ0pzWFVKVzFvV0xiUTFJYnpZ?=
 =?utf-8?B?aUZ0ZWd6d3lCNk9Uek93WnhuZlRjTkMrWHlnNEtLaHBzYWNhaHR2STVVelRw?=
 =?utf-8?B?Q2RBZSsvRE03aU82U3FVWXdFNWFlYldCVmw3UUVGL3g4TEs4bmRGd3NhZGhm?=
 =?utf-8?B?eDVMWDlwVExhQ2NGbTBMQnRDbTlJblU4N1dac1VOMFBQTTE1M1p4WUpyMFlJ?=
 =?utf-8?B?RXRFMUlpc3k5TEtvS1NyMGkvdG10M0J5RFI5SnZLaGN3NVRvZUZqU29qWWdr?=
 =?utf-8?B?dnp0bXVEZDZhKzhJN3ZsbEpDM0VQeTR5SlgrVW9ySWQzVFZsZzYwSXNEaUNY?=
 =?utf-8?Q?/k6o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5739cdc-c701-40b0-2457-08dba89b6a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:22:45.6448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MlIXeqX9ookwIdhfDPWbGZFTpTHFRi9OPzrF3EJraai/Jxd+ZF24brHgCP2gR09j319Zk5TpYHKvdXujwv7n4W8WaKwEBO9nmQv8u9SdpHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8905
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
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDcvN10gZHJtOiBhZHY3NTExOiBB
ZGQgaHBkX292ZXJyaWRlX2VuYWJsZSBmZWF0dXJlIGJpdA0KPiB0byBzdHJ1Y3QgYWR2NzUxMV9j
aGlwX2luZm8NCj4gDQo+IE9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDA3OjQxOjQ1QU0gLTA1MDAs
IEFkYW0gRm9yZCB3cm90ZToNCj4gPiBPbiBTdW4sIEF1ZyAxMywgMjAyMyBhdCAxOjA24oCvUE0g
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+DQo+
ID4gPiBBcyBwZXIgc3BlYywgaXQgaXMgYWxsb3dlZCB0byBwdWxzZSB0aGUgSFBEIHNpZ25hbCB0
byBpbmRpY2F0ZSB0aGF0DQo+ID4gPiB0aGUgRURJRCBpbmZvcm1hdGlvbiBoYXMgY2hhbmdlZC4g
U29tZSBtb25pdG9ycyBkbyB0aGlzIHdoZW4gdGhleQ0KPiA+ID4gd2FrZSB1cCBmcm9tIHN0YW5k
Ynkgb3IgYXJlIGVuYWJsZWQuIFdoZW4gdGhlIEhQRCBnb2VzIGxvdyB0aGUNCj4gPiA+IGFkdjc1
MTEgaXMgcmVzZXQgYW5kIHRoZSBvdXRwdXRzIGFyZSBkaXNhYmxlZCB3aGljaCBtaWdodCBjYXVz
ZSB0aGUNCj4gPiA+IG1vbml0b3IgdG8gZ28gdG8gc3RhbmRieSBhZ2Fpbi4gVG8gYXZvaWQgdGhp
cyB3ZSBpZ25vcmUgdGhlIEhQRCBwaW4NCj4gPiA+IGZvciB0aGUgZmlyc3QgZmV3IHNlY29uZHMg
YWZ0ZXIgZW5hYmxpbmcgdGhlIG91dHB1dC4gT24gdGhlIG90aGVyDQo+ID4gPiBoYW5kLA0KPiA+
ID4gYWR2NzUzNSByZXF1aXJlIHRvIGVuYWJsZSBIUEQgT3ZlcnJpZGUgYml0IGZvciBwcm9wZXIg
SFBELg0KPiA+ID4NCj4gPiA+IEFkZCBocGRfb3ZlcnJpZGVfZW5hYmxlIGZlYXR1cmUgYml0IHRv
IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyB0bw0KPiA+ID4gaGFuZGxlIHRoaXMgc2NlbmFyaW8u
DQo+ID4gPg0KPiA+ID4gV2hpbGUgYXQgaXQsIGRyb3AgdGhlIGVudW0gYWR2NzUxMV90eXBlIGFz
IGl0IGlzIHVudXNlZC4NCj4gPg0KPiA+IEl0IHNlZW1zIGxpa2UgZHJvcHBpbmcgYWR2NzUxMV90
eXBlIGlzIHVucmVsYXRlZCB0byB0aGUgcmVzdCBvZiB0aGUNCj4gPiBwYXRjaCwgYW5kIEkgdGhp
bmsgaXQgc2hvdWxkIGJlIHNwbGl0IGZyb20gdGhpcyBpbnRvIGl0cyBvd24gcGF0Y2gNCj4gDQo+
IERyb3BwaW5nIHRoZSBlbnVtIHdpdGggaXRzIGxhc3QgdXNlciBtYWtlcyBzZW5zZSwgYnV0IEkg
dGhpbmsgdGhlIHNlcmllcw0KPiBtYXkgZ28gYSBiaXQgdG9vIGZhciBieSBhZGRpbmcgdG8gdGhl
IGluZm8gc3RydWN0dXJlIGJpdHMgdGhhdCBkb24ndCByZWFsbHkNCj4gZGVzY3JpYmUgbG9naWNh
bCBmZWF0dXJlcywgYnV0IGFyZSBoYWxmIG1hZGUgdXAgZm9yIHRoZSBzb2xlIHB1cnBvc2Ugb2YN
Cj4gZHJvcHBpbmcgdGhlIGVudW0uIEkgd291bGQgcHJlZmVyIGtlZXBpbmcgdGhlIGVudW0gZm9y
IHRoZSBoYW5kZnVsIG9mDQo+IHBsYWNlcyB3aGVyZSBhIHR5cGUgY2hlY2sgbWFrZXMgbW9yZSBz
ZW5zZSAoaW4gbXkgb3BpbmlvbikuDQoNCkJhc2VkIG9uIHlvdXIgZmVlZGJhY2sgb24gcGF0Y2gj
NSB3ZSBjYW4gZGVjaWRlLiBTdGlsbCB3ZSBjYW4NCmF2b2lkIHR5cGUgZm9yIGh3IGRpZmZlcmVu
Y2VzIG1lbnRpb25lZCBpbiBwYXRjaCM1Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
PiAtLS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oICAg
ICB8ICA4ICstLS0tLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTFfZHJ2LmMgfCAxMiArKysrKy0tLS0tLS0NCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+ID4gaW5kZXggNjI3NTMxZjQ4
Zjg0Li5jNTIzYWM0YzliYzggMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gPiBAQCAtMzI1LDIyICszMjUsMTYgQEAgc3RydWN0IGFk
djc1MTFfdmlkZW9fY29uZmlnIHsNCj4gPiA+ICAgICAgICAgc3RydWN0IGhkbWlfYXZpX2luZm9m
cmFtZSBhdmlfaW5mb2ZyYW1lOyAgfTsNCj4gPiA+DQo+ID4gPiAtZW51bSBhZHY3NTExX3R5cGUg
ew0KPiA+ID4gLSAgICAgICBBRFY3NTExLA0KPiA+ID4gLSAgICAgICBBRFY3NTMzLA0KPiA+ID4g
LSAgICAgICBBRFY3NTM1LA0KPiA+ID4gLX07DQo+ID4gPiAtDQo+ID4gPiAgI2RlZmluZSBBRFY3
NTExX01BWF9BRERSUyAzDQo+ID4gPg0KPiA+ID4gIHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyB7
DQo+ID4gPiAtICAgICAgIGVudW0gYWR2NzUxMV90eXBlIHR5cGU7DQo+ID4gPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgbWF4X21vZGVfY2xvY2s7DQo+ID4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
bWF4X2xhbmVfZnJlcTsNCj4gPiA+ICAgICAgICAgY29uc3QgY2hhciAqIGNvbnN0ICpzdXBwbHlf
bmFtZXM7DQo+ID4gPiAgICAgICAgIHVuc2lnbmVkIGludCBudW1fc3VwcGxpZXM7DQo+ID4gPiAg
ICAgICAgIHVuc2lnbmVkIGhhc19kc2k6MTsNCj4gPiA+ICAgICAgICAgdW5zaWduZWQgbGlua19j
b25maWc6MTsNCj4gPiA+ICsgICAgICAgdW5zaWduZWQgaHBkX292ZXJyaWRlX2VuYWJsZToxOw0K
PiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gIHN0cnVjdCBhZHY3NTExIHsNCj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+ID4gaW5k
ZXggNjk3NGMyNjdiMWQ1Li43YjA2YTBhMjE2ODUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiA+IEBAIC0zNTQsNyAr
MzU0LDcgQEAgc3RhdGljIHZvaWQgX19hZHY3NTExX3Bvd2VyX29uKHN0cnVjdCBhZHY3NTExDQo+
ICphZHY3NTExKQ0KPiA+ID4gICAgICAgICAgKiBmaXJzdCBmZXcgc2Vjb25kcyBhZnRlciBlbmFi
bGluZyB0aGUgb3V0cHV0LiBPbiB0aGUgb3RoZXINCj4gaGFuZA0KPiA+ID4gICAgICAgICAgKiBh
ZHY3NTM1IHJlcXVpcmUgdG8gZW5hYmxlIEhQRCBPdmVycmlkZSBiaXQgZm9yIHByb3BlciBIUEQu
DQo+ID4gPiAgICAgICAgICAqLw0KPiA+ID4gLSAgICAgICBpZiAoYWR2NzUxMS0+aW5mby0+dHlw
ZSA9PSBBRFY3NTM1KQ0KPiA+ID4gKyAgICAgICBpZiAoYWR2NzUxMS0+aW5mby0+aHBkX292ZXJy
aWRlX2VuYWJsZSkNCj4gPiA+ICAgICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoYWR2
NzUxMS0+cmVnbWFwLCBBRFY3NTExX1JFR19QT1dFUjIsDQo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEFEVjc1MzVfUkVHX1BPV0VSMl9IUERfT1ZFUlJJREUsDQo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFEVjc1MzVfUkVHX1BPV0VSMl9I
UERfT1ZFUlJJREUpOw0KPiA+ID4gQEAgLTM4MSw3ICszODEsNyBAQCBzdGF0aWMgdm9pZCBhZHY3
NTExX3Bvd2VyX29uKHN0cnVjdCBhZHY3NTExDQo+ID4gPiAqYWR2NzUxMSkgIHN0YXRpYyB2b2lk
IF9fYWR2NzUxMV9wb3dlcl9vZmYoc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEpDQo+ID4gPiB7DQo+
ID4gPiAgICAgICAgIC8qIFRPRE86IHNldHVwIGFkZGl0aW9uYWwgcG93ZXIgZG93biBtb2RlcyAq
Lw0KPiA+ID4gLSAgICAgICBpZiAoYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTM1KQ0KPiA+
ID4gKyAgICAgICBpZiAoYWR2NzUxMS0+aW5mby0+aHBkX292ZXJyaWRlX2VuYWJsZSkNCj4gPiA+
ICAgICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVnbWFwLCBBRFY3
NTExX1JFR19QT1dFUjIsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEFEVjc1MzVfUkVHX1BPV0VSMl9IUERfT1ZFUlJJREUsDQo+ID4gPiAwKTsNCj4gPiA+DQo+ID4g
PiBAQCAtNjgyLDcgKzY4Miw3IEBAIGFkdjc1MTFfZGV0ZWN0KHN0cnVjdCBhZHY3NTExICphZHY3
NTExLCBzdHJ1Y3QNCj4gZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgc3RhdHVzID0gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7DQo+
ID4gPiAgICAgICAgIH0gZWxzZSB7DQo+ID4gPiAgICAgICAgICAgICAgICAgLyogUmVuYWJsZSBI
UEQgc2Vuc2luZyAqLw0KPiA+ID4gLSAgICAgICAgICAgICAgIGlmIChhZHY3NTExLT5pbmZvLT50
eXBlID09IEFEVjc1MzUpDQo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGFkdjc1MTEtPmluZm8t
PmhwZF9vdmVycmlkZV9lbmFibGUpDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZWdt
YXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVnbWFwLA0KPiBBRFY3NTExX1JFR19QT1dFUjIsDQo+
ID4gPg0KPiBBRFY3NTM1X1JFR19QT1dFUjJfSFBEX09WRVJSSURFLA0KPiA+ID4NCj4gPiA+IEFE
Vjc1MzVfUkVHX1BPV0VSMl9IUERfT1ZFUlJJREUpOyBAQCAtMTM2MCwxNCArMTM2MCwxMiBAQCBz
dGF0aWMNCj4gPiA+IHZvaWQgYWR2NzUxMV9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykg
IH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBh
ZHY3NTExX2NoaXBfaW5mbyA9IHsNCj4gPiA+IC0gICAgICAgLnR5cGUgPSBBRFY3NTExLA0KPiA+
ID4gICAgICAgICAuc3VwcGx5X25hbWVzID0gYWR2NzUxMV9zdXBwbHlfbmFtZXMsDQo+ID4gPiAg
ICAgICAgIC5udW1fc3VwcGxpZXMgPSBBUlJBWV9TSVpFKGFkdjc1MTFfc3VwcGx5X25hbWVzKSwN
Cj4gPiA+ICAgICAgICAgLmxpbmtfY29uZmlnID0gMQ0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8gYWR2NzUzM19jaGlwX2luZm8g
PSB7DQo+ID4gPiAtICAgICAgIC50eXBlID0gQURWNzUzMywNCj4gPiA+ICAgICAgICAgLm1heF9t
b2RlX2Nsb2NrID0gODAwMDAsDQo+ID4gPiAgICAgICAgIC5tYXhfbGFuZV9mcmVxID0gODAwMDAw
LA0KPiA+ID4gICAgICAgICAuc3VwcGx5X25hbWVzID0gYWR2NzUzM19zdXBwbHlfbmFtZXMsIEBA
IC0xMzc2LDEyICsxMzc0LDEyDQo+ID4gPiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFf
Y2hpcF9pbmZvIGFkdjc1MzNfY2hpcF9pbmZvID0geyAgfTsNCj4gPiA+DQo+ID4gPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBhZHY3NTM1X2NoaXBfaW5mbyA9IHsNCj4g
PiA+IC0gICAgICAgLnR5cGUgPSBBRFY3NTM1LA0KPiA+ID4gICAgICAgICAubWF4X21vZGVfY2xv
Y2sgPSAxNDg1MDAsDQo+ID4gPiAgICAgICAgIC5tYXhfbGFuZV9mcmVxID0gODkxMDAwLA0KPiA+
ID4gICAgICAgICAuc3VwcGx5X25hbWVzID0gYWR2NzUzM19zdXBwbHlfbmFtZXMsDQo+ID4gPiAg
ICAgICAgIC5udW1fc3VwcGxpZXMgPSBBUlJBWV9TSVpFKGFkdjc1MzNfc3VwcGx5X25hbWVzKSwN
Cj4gPiA+IC0gICAgICAgLmhhc19kc2kgPSAxDQo+ID4gPiArICAgICAgIC5oYXNfZHNpID0gMSwN
Cj4gPiA+ICsgICAgICAgLmhwZF9vdmVycmlkZV9lbmFibGUgPSAxDQo+ID4gPiAgfTsNCj4gPiA+
DQo+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGFkdjc1MTFfaTJjX2lk
c1tdID0gew0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==

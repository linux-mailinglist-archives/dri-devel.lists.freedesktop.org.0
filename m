Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44014490CAC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 17:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37F710F206;
	Mon, 17 Jan 2022 16:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01on2096.outbound.protection.outlook.com [40.107.23.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0763310F206
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 16:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eu+IJq7HARW8oR4wG+b5XJTMxEfGPvwRSSkT52f4UFFyyq96ZfLd57MicmEki5QS/L7flpAwbyNpag8ALKffdaU7bsrsApgwBcYeYXQAYbTI5X0ECSvEnLbU+OYoS6M798d1ZJcvi6LlR6iFR/feyr2NdkqJpJPiahvPkO6BMTTMAaNx9VdfH0lZqbviTB2DbZK1zZFjFxUmCrJ/RhWDMdwyHsj6qEMDBp/mAM2bsYLMYRJhqojlzkvSf4Ik0U4XUyBHaPeMh1QVxsSKJOPVVvmP+i3J4mxh2B6T47TWuGVv9AglkFQXqLZgRufHS07e5JR95hrOywxHFn/OJnHfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEQRVBlAVt4KOJ+nYlbNFy+Zy+n+xfjJQfeRE4iMIFo=;
 b=AtmjHEzmdqUUX5hdJmzi6A1CxOyxYZf9ZrstFpU17JdtQOQDwhCG9H6XhLfeYHB/NvLdp+j7rKJZWNum9I/eBFhBMuUQM9mMKq+Ls/qSQN7h5O0B6pVuXkQzJEq135z9MTm4gpypWOWF64PjkwwADysMuYkO4YTlwIiAh/WutKCD6bPPcWkgW0olob06ONdNm1EDC2JOwo4Rk4VMAEahInPM97EvwC3x7QTczY5NwebPJZeDiwOyV4gE6BRjMmD+3u1eNUTrm11nvzHag3hYzSW3cg5Vfs6OVsVn28iNt5aFhmid6Fu5BoJVk/Sx0yJZbDwIaE8oN1DndBYuIv8HcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEQRVBlAVt4KOJ+nYlbNFy+Zy+n+xfjJQfeRE4iMIFo=;
 b=euAsUIRJGPyds3I5x0j+g9jvbnNOTL2S7M717iLPPV2rlpTLgRc3hEeazZpxPnnBGUoaTX6Oj0H7XTJT4//DCi/PEf4DmIosSVWizaNCuh+1PN1rWjgpsQMZHi4NWt9pBby0xBDbYKycIB7Q3Pauul+PWUVsgQy3ew4GdrobeK8=
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 GVAP278MB0279.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:3c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Mon, 17 Jan 2022 16:53:59 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7067:aadd:1aa2:85ee]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7067:aadd:1aa2:85ee%8]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 16:53:59 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: use safe format when first in bridge
 chain
Thread-Topic: [PATCH] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
Thread-Index: AQHYC8LSSOfkBvha+Eugd8X3rLMYDg==
Date: Mon, 17 Jan 2022 16:53:59 +0000
Message-ID: <cdc8dd0f08aea5f8a32a6da7ec087c8d48d627f5.camel@toradex.com>
References: <20220117141750.1182223-1-narmstrong@baylibre.com>
In-Reply-To: <20220117141750.1182223-1-narmstrong@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4537bd29-cb87-4856-69c4-08d9d9d9f52c
x-ms-traffictypediagnostic: GVAP278MB0279:EE_
x-microsoft-antispam-prvs: <GVAP278MB027920D4C93D807EB3518641FB579@GVAP278MB0279.CHEP278.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBqYzlPYnMjb3F7BE7YEIhU9NtexELKX9QPP1vA9li9kkEbPApMPHiZZkrPrywTCTayCyF8UNU+JN+zFH7Csf+BVcCT5BqBWmS74Gu6SojNbroLZUL8k9t0OAuCgogjQ8IAGwkzlHC6ay1XxOsuAKuni0PEdMZYehmIhXJt1BPhp5HL/6D8HW+UtTD7SVMAiJS26Jeqem3zpGUpHrjawXDNwcDCc2BZZDTxM1xd2wZerVGtllwHJ5fq+//4r3giVmSJd+HnIrQ2LWj8qvZTfmJPXv+r4htJpBRdoDIsZTQFGPbu24RKn+ez6VyaAVGLLGZrcLhluWqIzv1ltIvBSflZrxu9EhPm1t10q6M1bHEyPRqdDUJPCEkp8atGGjyySvvmHLFXGvpO1nw91SbuwINQBHCRMUyaxNYECKNcOiyExcrWSx3iJqq+eR6mZ8zWRUTzymMsGz/R5N7+Pg1uurqjSJYfGyhEPZ/j9ERSPnbPEbuccqfV6ousPosCmpDbTIiz38FIAUOPWIqJ0A+uAUs3DoKxBdfXjHPL0RCF7vxSCfpJOU/nlAVjt8lr3S4BRUHhRtwo1JcY3pH34PrtOiov5PZTpwY0MCszQSQnWNTgSWJAvRjAjC0ViiL6yVK/V6ZhU7XW3bdEa/KIN8sXp+aysG7FMhT8auyub2g/BfP+tPUAdq8cUf4s9wf//t9AEQ/38jcr/LYRqQP3Ra5j43g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(376002)(346002)(366004)(5660300002)(2906002)(7416002)(8676002)(71200400001)(26005)(38100700002)(122000001)(186003)(508600001)(6506007)(83380400001)(316002)(110136005)(54906003)(44832011)(86362001)(4326008)(76116006)(66946007)(36756003)(38070700005)(8936002)(6512007)(66446008)(2616005)(64756008)(6486002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yi90Mlh6czB5SThnR2dDR25lQkNIQ0xBY3BTcVNKbG1zbFF5Y3dhSVpKcTdW?=
 =?utf-8?B?YTlaK3lQNmdHd2Z5TkRESzkxSVl1WWhRZGZ0ZWNNaUlnNE5jMUIzRTN3UkEy?=
 =?utf-8?B?dzUxUFViUlM0WDl5OTBORkF5ODBXZFlSQW9qemhtRmg0MXZYaDlMcjVPazZm?=
 =?utf-8?B?b3pFdjlhT2VMd3BiWE9MMVJnYWFvaDlNVFVnRm93VTFsM2E3TkFhS3VIQmk2?=
 =?utf-8?B?SDhRazdFZEF0N0c4emdSZXB3UkVJNmpzakJEQWg0WGVyRXhYeldsN01EcXJ5?=
 =?utf-8?B?eVQwSUtiYmZqUHoyVFZPeFlveVJPWnNmdnpVRFJPcXdaL0hLcHlsY1B6R1Zx?=
 =?utf-8?B?WkpaODhiSzhmRjNJN1BEdytLSVg5dzMxNytpQ3VieHpTTzNXbjJmamJTVjVx?=
 =?utf-8?B?SEFTV3pRQkp6Z3RaWlVKNngrVStSakMrMmVTVkxQNzgxRGpUOC82Tk5RRTl6?=
 =?utf-8?B?SnM0aXZYNGZtaTFXSVVGZU03SGFNOU8yS3lkbmpRWXFGOGE0V3lBZWU4Z243?=
 =?utf-8?B?R3BNcjdOcWFjeERBRjQ0YjJQWEVYeVMyd3VxRHhXSDNpVTNtd0poWmdUWGZv?=
 =?utf-8?B?RndIM2RXNUdFQzVrRWpxbS9mc2gyaERNWnA3Y3Z1c1FjMFBzdk5UNENZZjZv?=
 =?utf-8?B?SnNtdGVoYXJoOVhKV21XV1dzdjE0cmc3dStDTmJyM0IrVkJidSsreFRQNTQ2?=
 =?utf-8?B?U2ZPNzRMVHBHcHZ5VkRhM0JhcU5IaDQvWWlsRE0vUDNsK0NDT3RhSkNXQ2pD?=
 =?utf-8?B?dk04V1NvNFlXQTRmNFBDdGJTNVBRdWV3QTJjaFRtR3pSMWYyMUdFVzFUQzB5?=
 =?utf-8?B?dFZHOFgxSzArRjFsUHMrMmNwd3JkaGtleWZUSXdvV0F3TGxOS1BEUWU2UjZV?=
 =?utf-8?B?UG4rYTdteHlXSnJoNVZmK1ZzbjBHK0tZTkY5cWtUTGZtWmVFOFd0VURPZkZT?=
 =?utf-8?B?UzVYa0NIcGlEbFlKeVdQNGpaZ3VIdFZ0V0p3SlNQdXFRNDFBSFpnZ0swUFls?=
 =?utf-8?B?OWVOU2xlNlVuK085QmN3V3VXMFN0MUlackZrVG9Zb2I5NzI0eEZQMkQvWFZ1?=
 =?utf-8?B?S1BuQmtMQnVKQTJxTU5vaGtYUGxCWDRFZG1FMk1tN1I2ZkhBbDl0OEVnM0xK?=
 =?utf-8?B?ays1eEpWOExTMVJHeGNYZmpGZkRmNDh0dHczL29oU1g0ODE5dzFhNW9LeG1k?=
 =?utf-8?B?QTB5ZHk0UkY5M1Y0L2RJK3A5QWhjWEFZbVo2WElGNXJIYjFqbVgwM2V2bHdX?=
 =?utf-8?B?MEx4V0VVYWJnb0hqeEZnWlkvanhVdmJraEZwMkZnRGxXbTM5WU9xR01xTlBN?=
 =?utf-8?B?cGpjQ3R6ODVQMkhuem9USEpvODYwcjZma1pVaG0rOERDRkVFcTdoeHFWUytL?=
 =?utf-8?B?VjFsVnMrTmlJV0Jtcng4RzNmYkd3MGpnTkY3aG1XZnlManVpbW8vTFFibU1V?=
 =?utf-8?B?aEhSc1RVbEMwZ21YeTlWV1FUckJHWSt2TkFQMWJOZUhiWG05elIzL0lmYnI4?=
 =?utf-8?B?STFGSlpMTkFYbXRPOFpLVWsxcksvOWkxRjRiT1dlemtybGNldkQyTHI3c1Iz?=
 =?utf-8?B?dVo4Z3Zud254Z3dPcGtDNnlGaTFEMHAvUmU4YU9DdmJmRlZVQnF5TzhsdFVm?=
 =?utf-8?B?ZndKRnpjelRwazF6K3FEM094bTFFbzVUSzBQVkdHNTUzRmhKS1g1UzBjdEFU?=
 =?utf-8?B?bGRCMmpSTTlXTWFsZGUvaDRnREFqOVgrTkp5akQ5aUVmRVpuUGpxN00vcmFZ?=
 =?utf-8?B?UjFyeXNhZFFubWJvRlR6U2N1UW5hazFtUlJxVGZXdGVuOUZjTXJiRlBsUVdE?=
 =?utf-8?B?WDNMbXM5WnN3SUdZMmRqUXNpeWh3SEJwWWR0UHJtTTBYcVBwQ1NVbkZhR3pz?=
 =?utf-8?B?dTVFUEdTVEhnTE52cFhwdExBYm5DT3dIMFRYM3Q3WjMxaC9ITFl0enBjRHNa?=
 =?utf-8?B?SlhDUjFtU2hQVWVaMDd6d3VDUGdkWkRrblNEY2dMckl6Z0ZtQzdIaFkzT0pp?=
 =?utf-8?B?TitOVWFDUHhPcUZNRTc3cmpad3dJM29ncnpNeWJjMGtaNy8yT2podDVFems3?=
 =?utf-8?B?THhFK1hhazJBTk52YmM0ME53akpQYnM5ZE1mZ01uM3B1WXdTRXZQd0IxMEZa?=
 =?utf-8?B?MXhkZWRNNk04NTdkbnNYWHNPMnBmUE9pUmx1d0xQcXJTc0NRSExLeSs2Tnoy?=
 =?utf-8?B?dUV1akhBQW5ieTBabEg4MDBKeFA0YXJsK1lhVFVqZVZUeUtwMFU4UHpQUWVB?=
 =?utf-8?Q?qiSyYOmPuSIBZfDwx1Bcxha5oK5kAdDrs6e/e5lQk4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <005DBA46EB373A4EACF72DF42D556FE7@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4537bd29-cb87-4856-69c4-08d9d9d9f52c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 16:53:59.3782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9OHl7I0OjE16M9BKkfTroUWANq15LWp4wDiIAikYbCEuJgSnnoitvn/d/SZEpAB02quhTUxYSjJY2fS2hOly1sB6iw7l70rAPv42ZjbXIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0279
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
Cc: "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbA0KDQpTb3JyeSwganVzdCBzb21lIHRyaXZpYWwgc3BlbGxpbmcgZml4ZXMuDQoNCk9u
IE1vbiwgMjAyMi0wMS0xNyBhdCAxNToxNyArMDEwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6DQo+
IFdoZW4gdGhlIGR3LWhkbWkgYnJpZGdlIGlzIGluIGZpcnN0IHBsYWNlIG9mIHRoZSBicmlkZ2Ug
Y2hhaW4sIHRoaXMNCj4gbWVhbnMgdGhlcmUgaXMgbm93IHdheQ0KDQpubyB3YXkNCg0KPiB0byBz
ZWxlY3QgYW4gaW5wdXQgZm9ybWF0IG9mIHRoZSBkdy1oZG1pIEhXDQo+IGNvbXBvbmVudC4NCj4g
DQo+IFNpbmNlIGludHJvZHVjdGlvbiBvZiBkaXNwbGF5LWNvbm5lY3RvciwgbmVnb2NpYXRpb24N
Cg0KOiVzL25lZ29jaWF0aW9uL25lZ290aWF0aW9uL2cNCg0KPiB3YXMgYnJva2VuIHNpbmNlDQo+
IHRoZSBkdy1oZG1pIG5lZ29jaWF0aW9uIGNvZGUgb25seSB3b3JrZWQgd2hlbiB0aGUgZHctaGRt
aSBicmlkZ2Ugd2FzDQo+IGluIGxhc3QgcG9zaXRpb24gb2YgdGhlIGJyaWRnZSBjaGFpbiBvciBi
ZWhpbmQgYW5vdGhlciBicmlkZ2UgYWxzbw0KPiBzdXBwb3J0aW5nIGlucHV0ICYgb3V0cHV0IGZv
cm1hdCBuZWdvY2lhdGlvbi4NCj4gDQo+IENvbW1pdCAwNjU2ZDEyODViNzkgKCJkcm0vYnJpZGdl
OiBkaXNwbGF5LWNvbm5lY3RvcjogaW1wbGVtZW50IGJ1cyBmbXRzIGNhbGxiYWNrcyIpDQo+IHdh
cyBpbnRyb2R1Y2VkIHRvIG1ha2UgbmVnb2NpYXRpb24gd29yayBhZ2FpbiBieSBtYWtpbmcgZGlz
cGxheS1jb25uZWN0b3INCj4gYWN0IGFzIGEgcGFzcy10aHJvdWdoIGNvbmNlcm5pbmcgaW5wdXQg
JiBvdXRwdXQgZm9ybWF0IG5lZ29jaWF0aW9uLg0KPiANCj4gQnV0IGluIHRoZSBjYXNlIHdlcmUN
Cg0Kd2hlcmUNCg0KPiB0aGUgZHctaGRtaSB3YXMgc2luZ2xlIGluIHRoZSBicmlkZ2UgY2hhaW4s
IGZvcg0KPiBleGFtcGxlIG9uIFJlbmVzYXMgU29Dcywgd2l0aCB0aGUgZGlzcGx5LWNvbm5lY3Rv
cg0KDQpkaXNwbGF5LWNvbm5lY3Rvcg0KDQo+IGJyaWRnZSB0aGUgZHctaGRtaQ0KPiBpcyBubyBt
b3JlIHNpbmdsZSwgYnJlYWtpbmcgb3V0cHV0IGZvcm1hdC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IEJpc2VjdGVkLWJ5OiBLaWVy
YW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiBU
ZXN0ZWQtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25i
b2FyZC5jb20+DQo+IEZpeGVzOiAwNjU2ZDEyODViNzkgKCJkcm0vYnJpZGdlOiBkaXNwbGF5LWNv
bm5lY3RvcjogaW1wbGVtZW50IGJ1cyBmbXRzIGNhbGxiYWNrcyIpLg0KPiBTaWduZWQtb2ZmLWJ5
OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+DQo+IC0tLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgOSArKysrKysrLS0NCj4g
wqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4gaW5kZXggNTRkOGZk
YWQzOTVmLi45ZjJlMWNhYzBhZTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jDQo+IEBAIC0yNTUxLDggKzI1NTEsOSBAQCBzdGF0aWMgdTMyICpkd19o
ZG1pX2JyaWRnZV9hdG9taWNfZ2V0X291dHB1dF9idXNfZm10cyhzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlLA0KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFvdXRwdXRfZm10cykNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gTlVMTDsNCj4gwqANCj4gLcKgwqDCoMKgwqDC
oMKgLyogSWYgZHctaGRtaSBpcyB0aGUgb25seSBicmlkZ2UsIGF2b2lkIG5lZ29jaWF0aW5nIHdp
dGggb3Vyc2VsdmVzICovDQo+IC3CoMKgwqDCoMKgwqDCoGlmIChsaXN0X2lzX3Npbmd1bGFyKCZi
cmlkZ2UtPmVuY29kZXItPmJyaWRnZV9jaGFpbikpIHsNCj4gK8KgwqDCoMKgwqDCoMKgLyogSWYg
ZHctaGRtaSBpcyB0aGUgZmlyc3Qgb3Igb25seSBicmlkZ2UsIGF2b2lkIG5lZ29jaWF0aW5nIHdp
dGggb3Vyc2VsdmVzICovDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChsaXN0X2lzX3Npbmd1bGFyKCZi
cmlkZ2UtPmVuY29kZXItPmJyaWRnZV9jaGFpbikgfHwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
IGxpc3RfaXNfZmlyc3QoJmJyaWRnZS0+Y2hhaW5fbm9kZSwgJmJyaWRnZS0+ZW5jb2Rlci0+YnJp
ZGdlX2NoYWluKSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpudW1fb3V0
cHV0X2ZtdHMgPSAxOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG91dHB1dF9m
bXRzWzBdID0gTUVESUFfQlVTX0ZNVF9GSVhFRDsNCj4gwqANCj4gQEAgLTI2NzMsNiArMjY3NCwx
MCBAQCBzdGF0aWMgdTMyICpkd19oZG1pX2JyaWRnZV9hdG9taWNfZ2V0X2lucHV0X2J1c19mbXRz
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWlucHV0
X2ZtdHMpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIE5VTEw7DQo+
IMKgDQo+ICvCoMKgwqDCoMKgwqDCoC8qIElmIGR3LWhkbWkgaXMgdGhlIGZpcnN0IGJyaWRnZSBm
YWxsLWJhY2sgdG8gc2FmZSBvdXRwdXQgZm9ybWF0ICovDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChs
aXN0X2lzX2ZpcnN0KCZicmlkZ2UtPmNoYWluX25vZGUsICZicmlkZ2UtPmVuY29kZXItPmJyaWRn
ZV9jaGFpbikpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvdXRwdXRfZm10ID0g
TUVESUFfQlVTX0ZNVF9GSVhFRDsNCj4gKw0KPiDCoMKgwqDCoMKgwqDCoMKgc3dpdGNoIChvdXRw
dXRfZm10KSB7DQo+IMKgwqDCoMKgwqDCoMKgwqAvKiBJZiBNRURJQV9CVVNfRk1UX0ZJWEVEIGlz
IHRlc3RlZCwgcmV0dXJuIGRlZmF1bHQgYnVzIGZvcm1hdCAqLw0KPiDCoMKgwqDCoMKgwqDCoMKg
Y2FzZSBNRURJQV9CVVNfRk1UX0ZJWEVEOg0KDQpDaGVlcnMNCg0KTWFyY2VsDQo=

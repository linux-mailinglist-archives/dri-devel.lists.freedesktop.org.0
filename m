Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E85508CB8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 18:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC910E20F;
	Wed, 20 Apr 2022 16:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDE410E20F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfPnOXKFXdnidiE1HDF1aL7q2keJu9h+LujLAx+GUPsM18TSLGbR7Xl2GxHcRLrA6xyTsHomFGbr2zbCd4+wuksjKqkJx7fBm4/GoFM6BCoBeVVb76vrAHZIsQ/T6BtGliMWAZ2u7iDG3AJFSEU7IrYpG4MU5D7W7PX5whrPVc3Di9oQoHx86YSMRIVNXg49QoznCmzVryvzy3IWCriDR96HW/u8lEhS0L35dx0Ouu2Yeo/5AYhBDyTa8g3rBxf9UacN1wQJjoGDn+t1xC1KEAIPY/kjR9EXpUsPj6EfxVJr2v5lW70e2AY7We/X2fWx0yRQrPViLy5dLdskipOqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA3mpoL9JQJkdMr+b4LiR0/dUO5n3yhJhoSX+zcJj9s=;
 b=MDri92wdaNWPXhAiI2BBudmSrUUczU/2/RTC4+E5a+mTcnmN7v1OJZBUY6ExRXfoVOJuaueFcHlmYiJ8QVPVznamBuuwX+Oow2MvIiobavKOa9IiV4UjiMCHZH6Tmc/H7FgcKXaGxEPocZjY3kih34M8b1X68BfF6V4xvxLoOqRvimgVGsL0drxjiUKW1WUkRDLu88Pmu7lu35orw5Ylur56e/F+psXDqy5f63hd41mhPZi7jncV36Hs+sop/yHTIzh2ad5dgjwe6VMZaHucXLz0711/jPKhC8CnFn/v0JbevG5CD1oMG+J4HU2zdTDAX/wCEuEmCVy21wsR7wdqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA3mpoL9JQJkdMr+b4LiR0/dUO5n3yhJhoSX+zcJj9s=;
 b=ZmkH03BAuyrjHBpvHokwI9AghordAaKlI1pS/zDknQXoGEM/g9xcD1DweXiVcCW2OoAegEpHX7I+6f8YD1gFrRvqkD7WnqPepPyDFewCE10/bf+4zrAQ5FvD5O0P17BCVjAhC8O+CpEv1IjvVbnJPoL6hA+L6Wo8OB5pk7qfuBo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8835.jpnprd01.prod.outlook.com (2603:1096:400:188::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 16:03:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 16:03:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 4/7] drm: rcar-du: Move rcar_du_output_name() to
 rcar_du_common.c
Thread-Topic: [PATCH v2 4/7] drm: rcar-du: Move rcar_du_output_name() to
 rcar_du_common.c
Thread-Index: AQHYOTdaBoFm9N1RMkCwJsXitTwe9qzxA7SAgAgp6yA=
Date: Wed, 20 Apr 2022 16:03:51 +0000
Message-ID: <OS0PR01MB5922D738D45F15CF99FAEEC986F59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-5-biju.das.jz@bp.renesas.com>
 <YllVa2xL9s3c5xWt@pendragon.ideasonboard.com>
In-Reply-To: <YllVa2xL9s3c5xWt@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6541319a-f9b4-40bd-67b5-08da22e75d10
x-ms-traffictypediagnostic: TYCPR01MB8835:EE_
x-microsoft-antispam-prvs: <TYCPR01MB88350522FEE12940BA079F9B86F59@TYCPR01MB8835.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aIq74c5ICsrZqc13Ceu9aIBUK690FGWo5toYroz2+oDFwXqs1/n8u72Sc2Nz34K5VqMV2ME/B6uTYbAko+9Wc7HINdZnMjtWrZllORZzXNI8ntl6iTi3FCMLwaRVL4n74QdGXVYq+z7uUkgORew/88fgv2qmx8+cyjcATmb1R0Jv0w+04aUOdZHpIM0WeWwXk+EMBkeqTpAbDkliTOpqOosGWOogJPLWuFmDovqNoOHS3m5STFXON+mFPzos7EAzcJjHxTSJJvSXEXcC7hl8R+JEqwcwrHf2TWjmK15wmzytuwdIlc23cMz1iaDEGdcqsai5jF8GNS+x6croHppYyYzLvZy1dAPbbM06ZxnhoPS4eJXSsRM3pVpT5qgDLZg6RQfwaKiAwfEJSS7mRksn6ftyftQh118MT8bwHZYZbmz1Rc8cXZBTNce/G8wgHqxdgI3FRf2b8Ruqn1esjxM1TjZ9F9TEUZXGZqhqa47cG5ndB3Ig1Kuy4mnqgRnCmw0YMNQxo+DVt/OjWlgai4zUryIbOe1ZYH222kTFv5Aj07SxIfd33Nglpc0wEMdYrvJnuutXw9765PPtBp0CrJLh47X0jIMpyDbyJK4NVbvL5EbvSu6OX+zxVXA7SUOI7IQ3M1Tr6OBnUtUltCG/wR0SInrzTDYop6KiMTIcwZmxHqS9vtBXXPLS6FLqZUeW5lLayxz/dPijkd6jTqxIntis9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(38100700002)(6506007)(7696005)(52536014)(33656002)(76116006)(6916009)(86362001)(186003)(316002)(107886003)(5660300002)(26005)(71200400001)(38070700005)(4326008)(83380400001)(66946007)(66446008)(9686003)(8676002)(54906003)(66556008)(2906002)(8936002)(508600001)(64756008)(66476007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk9PdFE4MXRoSVBpUTJuT1pwa0lCUWtmcVl4RTN6QlkyUUI0U2h4amZFdVJ5?=
 =?utf-8?B?V1d2SFRlRVIyc1VVd1g4SE9wY0dSUjR4TG53ODVmd3UveDFGelM1b3dlSGpL?=
 =?utf-8?B?Q0YwdG8rdDJGQ3VIeXRUNGRJck01bit0ekFXUEFMUVpNM2tlL0dhS3FYeUhO?=
 =?utf-8?B?T1JkQk04TWRIOFdnRndCeS8rMjVKZklVZFFKdU5lRGRFL045OWg5RGRzNC9t?=
 =?utf-8?B?MDExUzB1T3V4UTF1d0dobWU0UGFYRnV2d21yS2xYL1JUNGJBRWxVUi9ob0lJ?=
 =?utf-8?B?SC9YczFBNmY3Slo4QWdiMTBUa1graDZqNCtYazFhR080REYxNm50alk4UHdj?=
 =?utf-8?B?QlhFTHowWXZ1eWk5eVhlNkdacGNmUDNiRzUzZlFVcjB3YWk5UGM1a0xkTTZl?=
 =?utf-8?B?MVZ3cFN3UDFHUkU5YmwvdWtMdGNKRmMxaW5pQkJaZG9IVUlKaWNtMURmdUtt?=
 =?utf-8?B?TWxuRlJ6b012MmJMbERJV3hscDZJb1RNbG1CSWRNQVowK3Q5Ukw3OThaR3JN?=
 =?utf-8?B?TVIzZlBUbTJGSzlXd2xLLzFTMnI4a0s2b1dIUzlPRy81OGdRbVJ0OFp6Qmpw?=
 =?utf-8?B?TkkvbW90c2VIWmdYbURLZVhibVIzbTZpSjZLbWZLMllGVGpsUzRWRERubGpH?=
 =?utf-8?B?KytlVDU1M0xxR1pJRzI3djErcVM1OWt4MVJHd280WkNOYy9NZi9lV1BrOXF6?=
 =?utf-8?B?Qjl1UXJIS0pQTTdxbUlDRzdwbkZTUlBlcThhOUQ3K2t4UER2VGJ4bFYwbTgy?=
 =?utf-8?B?QTM5eWdtVENhT3lQMWlCcnZWSEtqak9CRG9sMDd2c1FoSlVpWmJCVTNNTU9H?=
 =?utf-8?B?RGphUjZMeDFzZGMzcTZ4ak8wZ0JnaEo2aHFnOWppTE5SaGwrVE5SY21zZ3BG?=
 =?utf-8?B?TkdPd2NXdDJqVTA3UzNraUMvSHJvUXhLWjFRTTdZTi9ZR0FsY1BBMDNKYWJQ?=
 =?utf-8?B?amF6Mi81MWxJSkpmcDl4ZTVhWVFMVHg1S2FHTHpoMmhTTWpPU3hwQ2RsTmlk?=
 =?utf-8?B?NzZqRUNxeWNUTFYva0dhSUphd1pEdStqM2haVlAvWWlaV1dTa25wWElseUtS?=
 =?utf-8?B?a1doN2R4ZmExd0dQUUNFcHA3UThxWDg2dXpxVVpGMWRvckMwTXVVUDQ3VW9S?=
 =?utf-8?B?WGJlT0JtMVRVOEIwRlUrc0VhZjZ6ZHZ2RU9qaU9Eb1BpOG05MmhmM01MQnpt?=
 =?utf-8?B?Mm43dnFOL1FUU0tpRlY1NmdVWEdWSk1nQmw4am5pVnh2UzY1OC9RK0taamhF?=
 =?utf-8?B?WHNWQXgraXJLUHkxdC90VTBlQXFIOHJRVXBrSmkrVUw5bkE0OWl0aFBJWlpx?=
 =?utf-8?B?R3lnR3B0MUt6aG5JTm95Tm9OZGgwUXhvVGJjVlptQisva24weUFBTmNZY0Qr?=
 =?utf-8?B?aGNUZTgzN2cyZ0tFZjk5c05XY293aGNEZUpSNjJHRmJXeDU5MmZOaUVJRS9i?=
 =?utf-8?B?OWhuTkw4Q3orVXdsUEh6TmREU080UG5Tby85THhjNUlHSGhWeW0rM0hTKzVT?=
 =?utf-8?B?ZisvNHN0SDBVMmV2dWdVVWVvYWV3eVh6NEdna2VueWR6eUp3WHlVd015Q2dM?=
 =?utf-8?B?bzZNZmwwWjVYbEN2Wk8wZ1VRY0J2c3ZLVU9DaWlsYlZyZ0dzSHlxNytYUjVK?=
 =?utf-8?B?YmFEUkFwL0JBUkV2dXlveFJ5bFpRODFFc3M3Q2k0VUhabjhpSXVzSzcrVHp2?=
 =?utf-8?B?NmxvbW1EeEVRYU1KWHNMUlpxT0pMMUZzR2Roc1JpcktoZkJCdVFMd2hoa1cz?=
 =?utf-8?B?WUtGZDR5dVNVam1vdCtQTUo0bkt2aXRQcm1kLzdaWTdLcDlyZDNQUFFYc1BI?=
 =?utf-8?B?WWtOT3pDN3BPZEtKcWRtZnQ5NzgxQ2o1QWtybXpZWTV4S3NzZ1FtSWFXNXBX?=
 =?utf-8?B?VStKOGlXMWJXUjk5ZnBucjBKVTVxSUYwMFNlV29rRWQ3aWhLMkhwcllzQWtx?=
 =?utf-8?B?VTRzSjY2c3RRNTVqaVdTWDZONzZablltWDZVeVdjTnFZcEhDdkFVb2FGRE9t?=
 =?utf-8?B?VVJ0Ky9hNHJ6M3VmWVZ5c2w4YkIzY0x5d1lPWGxQQ2Y2UUE5aGh3S01LUFUw?=
 =?utf-8?B?a1ltN2lKdlBCdjFabmtJV2REZU1XVEFhb1Q3b3FHa09WMWxCQWVkUzU1bUdm?=
 =?utf-8?B?ZitXdGRhQnYxcFNBczhON3R1UDlQLzRYK2pOaVNDYUNHTUdoMFZVYWhwYUdD?=
 =?utf-8?B?YmxpZm5udGd3U1lidnlQUmtTeVJUYm1NZGVZSkpNUVNONUlHSWIxZWxEYnAy?=
 =?utf-8?B?SWQwL0lXbHNoTXFJUTZ5dEYxQ1NuU1FTQ1pmclFucHNEMDYzVnRHUU1IMllx?=
 =?utf-8?B?K2hoZzlqSU1aQUFtSS9DN09JdE9iOW5NRitzcjhGVFh6bDd2VTlwVVZPVzB1?=
 =?utf-8?Q?62Kbc/DSes3/CV/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6541319a-f9b4-40bd-67b5-08da22e75d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 16:03:51.9868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vnuwmpYWMF8yBO+cBjIXmAKEyuwLGAGLjA0sre2KXfTrxNElnyteiaVhZB1ysQ4fiLgMi+78VaUYe86wSBhhPJkO78sL9yzpiHa4XCrxsws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8835
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiA0LzddIGRybTogcmNhci1kdTogTW92ZSByY2FyX2R1X291dHB1dF9uYW1lKCkg
dG8NCj4gcmNhcl9kdV9jb21tb24uYw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLg0KPiANCj4gT24gV2VkLCBNYXIgMTYsIDIwMjIgYXQgMDE6MTA6NTdQTSAr
MDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gUlovRzJMIFNvQydzIGRvZXMgbm90IGhhdmUgZ3Jv
dXAvcGxhbmUgcmVnaXN0ZXJzIGNvbXBhcmVkIHRvIFJDYXIsDQo+ID4gaGVuY2UgaXQgbmVlZHMg
YSBkaWZmZXJlbnQgQ1JUQyBpbXBsZW1lbnRhdGlvbi4NCj4gPg0KPiA+IE1vdmUgcmNhcl9kdV9v
dXRwdXRfbmFtZSgpIHRvIGEgbmV3IGNvbW1vbiBmaWxlIHJjYXJfZHVfY29tbW9uLmMsIFNvDQo+
ID4gdGhhdCB0aGUgc2FtZSBmdW5jdGlvbiBjYW4gYmUgcmV1c2VkIGJ5IFJaL0cyTCBTb0MgbGF0
ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIE5vIGNoYW5nZQ0KPiA+IFJG
Qy0+djE6DQo+ID4gIE5ldyBwYXRjaA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9NYWtlZmlsZSAgICAgICAgIHwgIDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X2NvbW1vbi5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgICAgfCAyMCAtLS0tLS0tLS0tLS0t
LS0tDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25z
KC0pICBjcmVhdGUgbW9kZQ0KPiA+IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2R1X2NvbW1vbi5jDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvTWFrZWZpbGUNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L01ha2VmaWxlDQo+ID4g
aW5kZXggZTcyNzViNWU3ZWM4Li4zMzFlMTJkNjVhNmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9NYWtlZmlsZQ0KPiA+IEBAIC0xLDUgKzEsNiBAQA0KPiA+ICAjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gIHJjYXItZHUtZHJtLXkgOj0gcmNhcl9kdV9jcnRjLm8g
XA0KPiA+ICsJCSByY2FyX2R1X2NvbW1vbi5vIFwNCj4gPiAgCQkgcmNhcl9kdV9kcnYubyBcDQo+
ID4gIAkJIHJjYXJfZHVfZW5jb2Rlci5vIFwNCj4gPiAgCQkgcmNhcl9kdV9ncm91cC5vIFwNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jb21tb24uYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jb21tb24uYw0KPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mOWY5OTA4Y2RhNmQNCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9jb21tb24uYw0KPiA+IEBAIC0wLDAgKzEsMzAgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjArDQo+ID4gKy8qDQo+ID4gKyAqIHJjYXJfZHVfY29tbW9uLmMgIC0t
ICBSLUNhciBEaXNwbGF5IFVuaXQgQ29tbW9uDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAo
QykgMjAxMy0yMDIyIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycG9yYXRpb24NCj4gPiArICoNCj4g
PiArICogQ29udGFjdDogTGF1cmVudCBQaW5jaGFydCAobGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tKQ0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJyY2FyX2R1X2Rydi5o
Ig0KPiA+ICsNCj4gPiArY29uc3QgY2hhciAqcmNhcl9kdV9vdXRwdXRfbmFtZShlbnVtIHJjYXJf
ZHVfb3V0cHV0IG91dHB1dCkgew0KPiA+ICsJc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBuYW1l
c1tdID0gew0KPiA+ICsJCVtSQ0FSX0RVX09VVFBVVF9EUEFEMF0gPSAiRFBBRDAiLA0KPiA+ICsJ
CVtSQ0FSX0RVX09VVFBVVF9EUEFEMV0gPSAiRFBBRDEiLA0KPiA+ICsJCVtSQ0FSX0RVX09VVFBV
VF9EU0kwXSA9ICJEU0kwIiwNCj4gPiArCQlbUkNBUl9EVV9PVVRQVVRfRFNJMV0gPSAiRFNJMSIs
DQo+ID4gKwkJW1JDQVJfRFVfT1VUUFVUX0hETUkwXSA9ICJIRE1JMCIsDQo+ID4gKwkJW1JDQVJf
RFVfT1VUUFVUX0hETUkxXSA9ICJIRE1JMSIsDQo+ID4gKwkJW1JDQVJfRFVfT1VUUFVUX0xWRFMw
XSA9ICJMVkRTMCIsDQo+ID4gKwkJW1JDQVJfRFVfT1VUUFVUX0xWRFMxXSA9ICJMVkRTMSIsDQo+
ID4gKwkJW1JDQVJfRFVfT1VUUFVUX1RDT05dID0gIlRDT04iLA0KPiA+ICsJfTsNCj4gPiArDQo+
ID4gKwlpZiAob3V0cHV0ID49IEFSUkFZX1NJWkUobmFtZXMpIHx8ICFuYW1lc1tvdXRwdXRdKQ0K
PiA+ICsJCXJldHVybiAiVU5LTk9XTiI7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIG5hbWVzW291dHB1
dF07DQo+ID4gK30NCj4gDQo+IEFzIHdlIGhhdmUgbm90aGluZyBlbHNlIHRoYW4gdGhpcyBmdW5j
dGlvbiBpbiB0aGlzIGZpbGUsIGhvdyBhYm91dCBtb3ZpbmcNCj4gaXQgdG8gcmNhcl9kdV9kcnYu
YyBpbnN0ZWFkLCB0byBhdm9pZCBhZGRpbmcgYSBuZXcgZmlsZSA/DQoNCk9LLCBzaW5jZSBpdCBp
cyBzbWFsbCBjaGFuZ2Ugd2lsbCBhZGQgdGhlIHNhbWUgaW4gcnpnMmxfZHVfZHJ2LmMgZmlsZS4N
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IFlvdSBhbHNvIG5lZWQgdG8gYWRkIGEgZGVjbGFyYXRpb24g
Zm9yIHJjYXJfZHVfb3V0cHV0X25hbWUoKSBpbiB0aGUNCj4gYXBwcm9wcmlhdGUgaGVhZGVyLg0K
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYw0KPiA+IGluZGV4
IDQ2NDBjMzU2YTUzMi4uZjZlMjM0ZGFmYjcyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X2Rydi5jDQo+ID4gQEAgLTU5MSwyNiArNTkxLDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiByY2FyX2R1X29mX3RhYmxlW10gPSB7DQo+ID4NCj4g
PiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcmNhcl9kdV9vZl90YWJsZSk7DQo+ID4NCj4gPiAt
Y29uc3QgY2hhciAqcmNhcl9kdV9vdXRwdXRfbmFtZShlbnVtIHJjYXJfZHVfb3V0cHV0IG91dHB1
dCkgLXsNCj4gPiAtCXN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgbmFtZXNbXSA9IHsNCj4gPiAt
CQlbUkNBUl9EVV9PVVRQVVRfRFBBRDBdID0gIkRQQUQwIiwNCj4gPiAtCQlbUkNBUl9EVV9PVVRQ
VVRfRFBBRDFdID0gIkRQQUQxIiwNCj4gPiAtCQlbUkNBUl9EVV9PVVRQVVRfRFNJMF0gPSAiRFNJ
MCIsDQo+ID4gLQkJW1JDQVJfRFVfT1VUUFVUX0RTSTFdID0gIkRTSTEiLA0KPiA+IC0JCVtSQ0FS
X0RVX09VVFBVVF9IRE1JMF0gPSAiSERNSTAiLA0KPiA+IC0JCVtSQ0FSX0RVX09VVFBVVF9IRE1J
MV0gPSAiSERNSTEiLA0KPiA+IC0JCVtSQ0FSX0RVX09VVFBVVF9MVkRTMF0gPSAiTFZEUzAiLA0K
PiA+IC0JCVtSQ0FSX0RVX09VVFBVVF9MVkRTMV0gPSAiTFZEUzEiLA0KPiA+IC0JCVtSQ0FSX0RV
X09VVFBVVF9UQ09OXSA9ICJUQ09OIiwNCj4gPiAtCX07DQo+ID4gLQ0KPiA+IC0JaWYgKG91dHB1
dCA+PSBBUlJBWV9TSVpFKG5hbWVzKSB8fCAhbmFtZXNbb3V0cHV0XSkNCj4gPiAtCQlyZXR1cm4g
IlVOS05PV04iOw0KPiA+IC0NCj4gPiAtCXJldHVybiBuYW1lc1tvdXRwdXRdOw0KPiA+IC19DQo+
ID4gLQ0KPiA+ICAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gLS0tLS0tLS0NCj4gPiAgICogRFJNIG9wZXJh
dGlvbnMNCj4gPiAgICovDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5j
aGFydA0K

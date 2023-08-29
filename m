Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33AE78C7B8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271AA10E34C;
	Tue, 29 Aug 2023 14:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDC810E34C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8Lnb3Vrdm7e7f3YevhFMyS6iriuPQ/i1IsKSABMCFPV9aB8BhHGiAJiw6AexC/grhs35ZgLE/5qZCWgVtymg1BpLHRkd3ePmBdjbIiDCJKbiCZPCZOw1Umycthc5qp7lQhv0zqiyanP13q1ML1eFaXcBux3DOb21EkuP91vRIX8Ug5GxcSOfYCKwkz7npitKRkvjCLupWk8O+ve8cuGr7cQKTiJfmUlO277wBSI2LhUOPGuDHOcbIpznhHhCvPVNC4e9FuC2Yc0zWah0GSf3+xMMHPMHTvRPt0VSbRpvzryigyTddy+ysdRGG6Nv9DX4GzwRbBtSxoCxn+EjpIP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRVNQoM/mNq9LbTUhd2J4xzpkZ3lmfmazecVyqTPFtw=;
 b=M7LhC7C6WMGKAjJ0/Qhy16O5poatAITHkbPhRhA/PBDgUwaeP58ifhIZirnrNbaSkh8yZa0bW7aiD/GpOqLvJFh/23Kd8BR0wRyrdpWTJX2xy8FouJ0YpZP5nsaKEkxhbdGYDQGf4mnCFhZgiAmChPcVPWMd5OEzC+gLumaWVGSS++niyZFGP9sRF0nYzSU3GacZ4kUl25hpoKBcgZDJrCShGvAMyav7QlpuCbJE31vRgcaYBfdGQeiBiR4iIVYi52ng8tD/r4ag09P1nv4vz2M8Goi7IrIgRo6lgvb1VvsP3VcQiRi+vXeYVPuPKvENda9bBtkLE8mYzZnZ5MfcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRVNQoM/mNq9LbTUhd2J4xzpkZ3lmfmazecVyqTPFtw=;
 b=gdcWc/wjRuMfbGsIWd91Di5qNx9T/CBH6TYxTXbXdZBJzQ1vEFYCQDYU+AGMkLvl+gizkQDKJEUKC2nQ/SAH0T0gnnXdJP51W02S5kT66hng44sjKpicO7vh11EwWNDyeGFeVr7x/tuAJn9VE9YU84KfaEFHZIgamGAp5F0524M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8912.jpnprd01.prod.outlook.com (2603:1096:604:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 14:37:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:37:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Subject: RE: [PATCH v4 2/2] drm/bridge: Drop  conditionals around of_node
 pointers
Thread-Topic: [PATCH v4 2/2] drm/bridge: Drop  conditionals around of_node
 pointers
Thread-Index: AQHZ2a4bDNFAFX51KU2nw39Vlc67w7ABWKdw
Date: Tue, 29 Aug 2023 14:37:27 +0000
Message-ID: <OS0PR01MB5922CE898B4A4E2E8C58C6A386E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
 <31ff-64ec9800-1-66482280@42123241>
In-Reply-To: <31ff-64ec9800-1-66482280@42123241>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8912:EE_
x-ms-office365-filtering-correlation-id: 4c7c98a8-03b5-4f84-68e6-08dba89d778c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lir8AhjhWIJr9V/3EhPGM+ssM79TIZBJBX4bHPS7KlX4ebGnmAtbZiTKPduENAL/cuCz5CwD1VPM2g0tYxWUQ8ycDPGP//7+pfdCwSlqIHVWJRA8k60dfGHpnEPYxIevQoeVaWyGfV+LkCztNfxWQ9F87kXy+pR/KOZXwaksbehFKA0Jz5peI0pjJPDz1rth8nhyumbz7Yf4RpXT5HL6jDXbz8XPyll1qyMi1pCF5yETcGLv2WU0jbvBMDy7SI4a/7Ph6wJ2QXsXWZEIjJPGGk2fVmW5gC5T9WZ5zJ9dCPKN5X589bXluht2kaS47MJPG1mphay7GuZpHJXnJFEYAHtWBSJEMWJBgbeHr4pp44CgGyLS0d56TfWZaUuyg13uZDnZBzH++7Y/fVtpsUmDmqKrHCLw0c5FBpIsyZ/hTPcb71n8VcKvErVmmcCOPhnV4mr+aG7wC0z4jwH7X2chhtug1O9lNw6WY6r9GZtkPfUFXeLJDmjO7IANkBa5xOKLLPm0Sc64KC+S3GKXXiduAZehL/K0sfsYIn5OaeNkFTP5uHZgQukJcHV8AQG0rWfWNV6HFqsGS/7cy2mXpMD7bqdz7MkNM9WKarZtTrUPKKkXqBKrHxL7y2eWyGR03hWH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(186009)(451199024)(1800799009)(71200400001)(6506007)(9686003)(7696005)(53546011)(478600001)(83380400001)(2906002)(76116006)(7416002)(316002)(64756008)(54906003)(6916009)(66446008)(66946007)(66476007)(8936002)(52536014)(66556008)(5660300002)(41300700001)(8676002)(4326008)(86362001)(33656002)(122000001)(55016003)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGdrdlpCa0xJaWVkT1F1eWR6ekR1L2xZdlpoczdWSFNPOURLWUhvb0hBL2tM?=
 =?utf-8?B?UTJnNmlhRGVGTG5iSDMvcldDOWNnR1hRR3l0SHNVSDRmUHltYnBqV1c4dld0?=
 =?utf-8?B?MVlZZXBJbmZCR0czQ1R3L1FtdGZZaWsvM2pBNk5OM09ma3RzbHZzamlQUXlF?=
 =?utf-8?B?eDZac0VFOTJpQjkwOWsrTkxJa292QkVpWUVsQ2ltc1o1a0l4NXVsUWd5ckQ5?=
 =?utf-8?B?SHV1ODB6bHE5NWtBZnhLcU1jWklabElqamV2MnI0ZmR6Vi9Cem1NMGQyK1k4?=
 =?utf-8?B?MkVzbThpUjB1dlBCbVFTVlZleTM1Ri9ZL0FXVDlEOGllWlF1bFhRVFY4WGMr?=
 =?utf-8?B?cFF5YzFkNGl3c0R0Vk9RQlUzODhHU3lFU1JObzFBYlpOTTBNYmg1SWZGcmw0?=
 =?utf-8?B?OVBmUFkrY0FiSVhWSVNhOE1UT0tIV2ZxTmgvZFRyVVF0dlZJNlN3eXNnQXhr?=
 =?utf-8?B?M00wazMwd3hCVVd5WWNHTmRveFFROEdzakN1REhyQlRXWGtDNDNvOG5oTHhz?=
 =?utf-8?B?Y0U3V3BQTlRoa29jVjM2VTJsYjhvaUN3VUMxNFg1SDk4WjJzMUphOS9KdUkr?=
 =?utf-8?B?Z3pBV0lPT2tBSmxuU2ZobUJHNjJGc0xUQ1VjQ0lCSVZWM1RhVW8wMFpEckU5?=
 =?utf-8?B?K1RDQzhPelRpY0JYWXdqMDRUS3NMQnAzWHFFV2ptcDlWckVXSStiUENGcklC?=
 =?utf-8?B?d3BDY3dVU1RmSndwQ3UvQU5iMnRiUWJ2QWZ2S1ZRQmsySW1HQ0hka01Pa2Nk?=
 =?utf-8?B?T0cxMWtRWlR2alBtaXl6QkhVbFBUUFNIcGRSenNocTlycTlMVyt1NGpud29z?=
 =?utf-8?B?RFE2U3ZRNnh0cS84b3poWXpTdlhKdXNTdmQ4M2lNUllrb3JneFYvTGIyenhL?=
 =?utf-8?B?Nm5ZbjBhK0RZVXN0alpxUW9rd0NoajI1bUg4M1kxMnNHRkZwSWZsWFJ2L0c3?=
 =?utf-8?B?V2ZLVUNEZmlRQ0F4bXQ5TE5pampjOW0rVi80RDlhaERWTUo1eEgyNSttc0oz?=
 =?utf-8?B?WTE4WUtRQVBYb3VyTXdhbjFmY2N0YXJabi83QnYxUllWbUZ3dUFvU3ROcU5v?=
 =?utf-8?B?ZmM2OExyVk02M3dESUN1SFlPQkhpOEF1QlNsUHphaHFEaHErWUdxSVBrdzQ3?=
 =?utf-8?B?L3pieFN1Q0VKRUR4YzU3QVZxNmxzNVptQ0d2ekdzamhvVTBjKzRwMFVpT0pQ?=
 =?utf-8?B?Rk43MitzeXZkSTdsZUt6ZFI4ZTRqNXl5QlZwcjhtUGZiNHMvQ2lnQVdSMUVK?=
 =?utf-8?B?WmhZNVdwS3BXaldXSDJlbVRpS2RGbit0ZmVkOVJ0bVlncnhlSXp1Uy9YVFZl?=
 =?utf-8?B?Y3N3UkV0Y0tCMWl5ZWN2cUN6MWZaMDBpUUh0dlBuUGJWQWdIak1WUWRadm5a?=
 =?utf-8?B?ZDQrU09NNER0cVg4UmtqQkkyNjNtVWsyamhKWTlrRWo4R250SHlsNjFNam5Q?=
 =?utf-8?B?WHVQaVFUT1dkem01V2RsNUt3WHVPekw5b0JhTU1UUjEwcUpHVHcxVmQ3MFBC?=
 =?utf-8?B?ellMdE5ob2w2OXJ0M25VZFMvK0lDS2tsK0xLQkRkVVlJaDEzZkF5eDVNTkRM?=
 =?utf-8?B?L2pscWMxUVRXb1pKYnlrcVRmY2lxdXdNTWF2cC9MaEVaTU9pYjdJdVZYeisr?=
 =?utf-8?B?NWdLRmswaDBmdkxIMnB3NUZVellrUDgydkdONGgwQXhNcThGTkVPcVhpSWl6?=
 =?utf-8?B?aXpodnc0RktoejdsKzAyaXRYQjl5YTU0aVdrRnl3SnJqYk5LVEZQb0Yrdk9x?=
 =?utf-8?B?Q1lHdjhNOERGUzVjU2lBWktGeEZGNnZrdk5IOVJlQ2hDa3ZNcUcvWmJocUhx?=
 =?utf-8?B?SHdRb0g4SDl4NlBxTFBpQWh4ZXFTZzVJZUoxY2tXRGs2Y2dRU1R2VXlVckdC?=
 =?utf-8?B?SzZHcThUc2dPaWd1Nm9CQkMxZjBIZnljSDNsWFJVL3F2NkpWS052RUxvODk1?=
 =?utf-8?B?Y1E5cXNOQXJ2QUpXVW9vN21lRmlNTUdKa3JXWjN0cXhjVkNxOHozK3NHY0h1?=
 =?utf-8?B?L3F5Qzk5TS9xeGhNSGxWc0laaUtkSVJleTNmb0lwWk1Od3RGT3hrbll0OVdL?=
 =?utf-8?B?T1lPL0c3b1NBcUQ3RUV4bXppdkkyRzBGbEhVZHArYmU4M05kUjY3QjlIcDVU?=
 =?utf-8?Q?uahs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7c98a8-03b5-4f84-68e6-08dba89d778c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:37:27.1529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BUjtazBtxLRt10JaBHmMz04rx6aA+mUosS/xWU+xVI4odqvF9lqYywRzXrUXPZQ2kN+n3cms+yhaQKL9hirjn3p5OyvH8SBswudUsjTqhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8912
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVsZW4gTWFlIEtvaWtlIEZvcm5hemllciwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IDIvMl0gZHJtL2JyaWRnZTogRHJvcCBjb25kaXRpb25hbHMgYXJvdW5kIG9mX25vZGUNCj4gcG9p
bnRlcnMNCj4gDQo+IEhlbGxvIQ0KPiANCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+IA0KPiBP
biBTYXR1cmRheSwgQXVndXN0IDI2LCAyMDIzIDA0OjE5IC0wMywgQmlqdSBEYXMNCj4gPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gDQo+ID4gSGF2aW5nIGNvbmRpdGlvbmFs
IGFyb3VuZCB0aGUgb2Zfbm9kZSBwb2ludGVycyB0dXJucyBvdXQgdG8gbWFrZQ0KPiA+IGRyaXZl
ciBjb2RlIHVzZSB1Z2x5ICNpZmRlZiBhbmQgI2lmIGJsb2Nrcy4gU28gZHJvcCB0aGUgY29uZGl0
aW9uYWxzLg0KPiANCj4gSXQgd291bGQgYmUgbmljZSB0byBleHBsYWluIHdoeSB0aG9zZSBpZmRl
di9pZiBjb25kaXRpb25hbHMgYXJlIG5vdA0KPiByZXF1aXJlZCBhbnltb3JlIChiZXNpZGVzIHRo
ZSBjb3NtZXRpYyBwYXJ0KS4NCg0KT0sgLHdpbGwgZXhwbGFpbiBhcyBpZiB3ZSBpbmNsdWRlIHRo
ZSBoZWFkZXIgbW9kX2RldmljZXRhYmxlLmgNCnRoZW4gd2UgZG9uJ3QgbmVlZCBjb25kaXRpb25h
bHMuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gUmVnYXJkcywNCj4gSGVsZW4NCj4gDQo+ID4N
Cj4gPiBTdWdnZXN0ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9y
Zz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gLS0tDQo+ID4gdjQ6DQo+ID4gICogTmV3IHBhdGNoDQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jIHwgMiAtLQ0K
PiA+ICBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDIgLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4
eC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4
eHguYw0KPiA+IGluZGV4IDYxNjlkYjczZDJmZS4uYWQ4MjQxNzU4ODk2IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4
LmMNCj4gPiBAQCAtMTIzMSw5ICsxMjMxLDcgQEAgc3RhdGljIGludCBhbng3OHh4X2kyY19wcm9i
ZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQpDQo+ID4NCj4gPiAgCW11dGV4X2luaXQo
JmFueDc4eHgtPmxvY2spOw0KPiA+DQo+ID4gLSNpZiBJU19FTkFCTEVEKENPTkZJR19PRikNCj4g
PiAgCWFueDc4eHgtPmJyaWRnZS5vZl9ub2RlID0gY2xpZW50LT5kZXYub2Zfbm9kZTsgLSNlbmRp
Zg0KPiA+DQo+ID4gIAlhbng3OHh4LT5jbGllbnQgPSBjbGllbnQ7DQo+ID4gIAlpMmNfc2V0X2Ns
aWVudGRhdGEoY2xpZW50LCBhbng3OHh4KTsgZGlmZiAtLWdpdA0KPiA+IGEvaW5jbHVkZS9kcm0v
ZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGluZGV4DQo+ID4gYzMzOWZj
ODVmZDA3Li5kNDlkNWMwM2RmM2UgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Jy
aWRnZS5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oDQo+ID4gQEAgLTcxNiwx
MCArNzE2LDggQEAgc3RydWN0IGRybV9icmlkZ2Ugew0KPiA+ICAJc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyOw0KPiA+ICAJLyoqIEBjaGFpbl9ub2RlOiB1c2VkIHRvIGZvcm0gYSBicmlkZ2Ug
Y2hhaW4gKi8NCj4gPiAgCXN0cnVjdCBsaXN0X2hlYWQgY2hhaW5fbm9kZTsNCj4gPiAtI2lmZGVm
IENPTkZJR19PRg0KPiA+ICAJLyoqIEBvZl9ub2RlOiBkZXZpY2Ugbm9kZSBwb2ludGVyIHRvIHRo
ZSBicmlkZ2UgKi8NCj4gPiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zfbm9kZTsNCj4gPiAtI2Vu
ZGlmDQo+ID4gIAkvKiogQGxpc3Q6IHRvIGtlZXAgdHJhY2sgb2YgYWxsIGFkZGVkIGJyaWRnZXMg
Ki8NCj4gPiAgCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4gPiAgCS8qKg0KPiA+IC0tDQo+ID4g
Mi4yNS4xDQo+ID4NCg0K

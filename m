Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6327A3B89C8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 22:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4456EA80;
	Wed, 30 Jun 2021 20:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C323F6EA80
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 20:36:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvTHEkICCt0rVJJwzDDHrongan57U6GeLKX1hpfu2IvCJu2INWfjjfJt0H8JNR0IKE3ZawMG3B7cFvFxrGkcwPpVAXfYwyTdb/yW8WQSvYysLWLZywD2/E9ZFtSFF7/22tYw368t9N/ejEToWiQUURFLYS+kqUf+A+ZgES6c7cN+k0wdQsrRQ5tAWV8oidropKXMOsKgea0ZPFyxmUhOErNiNrWIF26DCwR+FTPPPTocEmi5rjM9ZtixAQUXbVlOOCQkcBM3pIbnLwu6BlQp5OCHA7N7V4riUS/vRv6BDAmxJGMPv+d6wxW0VfMcJscmHapHSXF0TO6QHC0zu9e7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/WJrM9XBrjFMav6ViCLVbE0jKxE4xc70+MWbxkPl68=;
 b=EOCQTgK8zzwY40c7hm8hiKcPfcb01CirQsG7ouZV54zi+d9A8qeGVGnkeq9d1n0SWrHeFk/jW/Xvu6W9yHUtR7JbqlMr4c3gI8+YVrFp5RiyptJkEvGmhuHh8elg9Gka3MQf/d0EFNi84bYc0notN14eWu9mehmh6Twjk1PpoJQiQh/NIKncKGlUeo8SWSZnAU5L2MDeedyICPyVadCH7uyGX9uZyid05VsICG8PfL6RIbTbef3hOelXlvRBOyvoga+SJLr1NY77a7/aWUbnT+Ye/BdjwwIPGJFYonZY/1Mdg5l1nJp7rGwVYnwoqyBxEHUn5f4gAZwbEHi97nOLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/WJrM9XBrjFMav6ViCLVbE0jKxE4xc70+MWbxkPl68=;
 b=t32JAVVDkeAI3bp0N0CsFfRQWRc9/Y/kC8kgLTBMkNqjwdT+x5e5ZnqYFDGBe9YH5z8GKYzGX9B0zNp3ev0EokoVgbTua3YqEP+A97YLSx53NOrNJecEjDZpqY4DYfW50RHl6wXVcR2TCX/TYd7Rtu9BS51mWRa5djl12P2eqV4=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6671.namprd05.prod.outlook.com (2603:10b6:208:d7::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.15; Wed, 30 Jun
 2021 20:36:29 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::f55f:1a1e:7d62:8c8c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::f55f:1a1e:7d62:8c8c%5]) with mapi id 15.20.4287.022; Wed, 30 Jun 2021
 20:36:29 +0000
From: Zack Rusin <zackr@vmware.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next] drm: vmwgfx: add header file for ttm_range_manager
Thread-Topic: [PATCH -next] drm: vmwgfx: add header file for ttm_range_manager
Thread-Index: AQHXbe8ew3LxHtB6zU2bEF9Sg4oQ+KstA1eA
Date: Wed, 30 Jun 2021 20:36:29 +0000
Message-ID: <8CB463FC-BF27-48CD-8843-975AE600DE35@vmware.com>
References: <20210630203252.32471-1-rdunlap@infradead.org>
In-Reply-To: <20210630203252.32471-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e5ae95a-97c7-44bd-7008-08d93c06bd8d
x-ms-traffictypediagnostic: MN2PR05MB6671:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB667169C581B6DF2C07EB8D1DCE019@MN2PR05MB6671.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AC6S5aXMSjkaoLj1ElEEXIo2xhqa2H/1RzAdlRnbPTn8InQsD893cR68446hpexwXjICqQ9vny5+dwQWHw7C8nFmp1AOjNdoECeCM/sQ+z5Da5zgizNiSO3h5uuae8vBwcZ8leXwr0qpwF+YZw4BlrhoBI8NXqlt7d0ZPo74iVPZmRlJDJRWY8lkw99rDY+gzyQFbnGgGk0gu3jH+AySHg7rwLnl24NOY+jXpaOkUjuUigtb/R1HGltlmCiro59D/97VxpXYk1C5KqSvnP7ScO3YdOxlNVQrmsRK8MBF6dvOUhBuYeyJvDSsSULXCBwXqA7rQ1xUhrS2luaen8Gr2JVhtTM0kdqHrkBYvjn8VFZS+FWTMkerbQ9czlPJaOCJZZNrpVCsg5oiNED2SuECiWoYOTxFSx2QsFKWb40zJr6kMU7wcv/zE65RZGJSmVJDXohdCbQR3KO3+w65MdjO9omt2jepir/wvp3Bql83zGwmDe0WpGz82SX8zV+xeqCrhVXA9/n3+shk2jqHQtwc6Z8quExSp1K/zgI8ktMeTZSrsiO4IGv715snLF2+BBe9YXgs/ZCohZCKMVnWIEUmBRpekjhxPhlLuvJMA4rblYEprWApxDnFFkho8ex3btX8aOeiZZ70iw0dWUDfW6WjnuR2zqi6Vbs9x+MKTyOAHMOBSFGsjOp1+qZxgPYUuXcHCPNQzBNhz8+95+El1oAMznIKZdaSnwbcFQ9LYLICLEOj19glvwJugPAg7JkpdjTS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(76116006)(54906003)(6506007)(36756003)(33656002)(66446008)(66476007)(66556008)(64756008)(186003)(478600001)(6916009)(66946007)(316002)(53546011)(966005)(6486002)(2906002)(5660300002)(8676002)(122000001)(26005)(71200400001)(4326008)(8936002)(38100700002)(86362001)(6512007)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlo2ZXJFSFRRMDBxdnpDdmg4WUNaOHNxQlpHTWhRclBZWGhCNyszSDBSS0Rt?=
 =?utf-8?B?WHNCZ1AwSkhIT2FQYzdkOElMaGYxQWp1aHlZUVZ0RXk4SC9OandVdFVUVk8x?=
 =?utf-8?B?cVBGSWNuTXJNbE5VR3gzZGs0T2NMaVRSV01XalI3cFh5bmlDZmI0TDBiT2Vh?=
 =?utf-8?B?Uk9vc1ZFOXkwYVlhZG1iVktnM0NyL0h2OE1EQ1lpL3BGdkMyWStuNjRxWkd0?=
 =?utf-8?B?Q0VoRW4zNnRDNFpaeEVBQkprWHlDOHM5eEVTOGgvMFNIS3dtVUhDd3NWcnJV?=
 =?utf-8?B?RWhnUklLWko4YnFnVmF5aDVBWUt6cjZzSXBpQkwwR0N6TFhCN09ibk0xb2Zj?=
 =?utf-8?B?ZERUREJEOHluTm1UYkw3SHFmMmpZQVJOU2lWYUtQTjBRZmVGMHJxWW0yV3Ar?=
 =?utf-8?B?ODdQOWVIbk9uMTQ3Y2xGZ3U0dzR0TFYxVzc1dGZveFFzRjBXVnR0M2poQ0Rx?=
 =?utf-8?B?OTJLcDlyWndJTlk1VnZIUkhUSFZRazFlc1FjSDl5WFZXazhBWThvNzVKNk5C?=
 =?utf-8?B?ak9qTWRhYm9pajcwQW1tblpxU2FKS2MyNTlFL25PZnlvalRUQVEvWWhOSHlj?=
 =?utf-8?B?eituTWpaNERObC9FQ0VvaTVTVk5oc01WeEdBOW9FdURvZWd2ZWdLVXhjT1Z1?=
 =?utf-8?B?ZmZhU1dDd1Z3VFZMOUFVTVVQcCs3WE5qZFkvQmVMOFo5Tys1cjYrMVl2aWJp?=
 =?utf-8?B?L0QyL2J5TWd3ZHhicEgrajNJeEFUWFEvWlJxYnpERU5BZy9nTFVXVnZ3czgw?=
 =?utf-8?B?ZVRMUmYxS0F6QTJjYS9iRVlaSGZzNHJ1Q0xKRGM4THJHYk4wZDZyTlYwWDRv?=
 =?utf-8?B?QkI0MkpvbGFRTWVhODc4ZFYrVFJURmIyZHZDRTVnaGRqbG9uSldsaEw2aXZJ?=
 =?utf-8?B?ejQ3UzJHOHdxTUhwZ2d5YkM5dzl6L1Z4eEI3cGRzekJ5NHQvRmlBZ1ZUSU5M?=
 =?utf-8?B?ZkhnWU5PVzhhQTNoNHJsczlaT2ExZWtNYkxXUjBnYjFGWDIvNlcxVXR5NGFq?=
 =?utf-8?B?LzBFQzlObnVwWHM3NnFRd3Rwb1I4aE9tMTNKNUowZXRYYXgxNTR4YXhMUTZ2?=
 =?utf-8?B?WTZNcDhzYyt5eHJpM1dSZkpRVmpLcnN1eXFwd1B5ZDRyL05GTkRZMEFDazNj?=
 =?utf-8?B?NjFFKzBESlQ4ZmtiNjJRN25NRnhQUVFpRkc0Mk94bGhFUktUeENzVnB4aXpL?=
 =?utf-8?B?OHVSbG52NXZXSEJFQ2ZjK2RXN2NYVFEvQUlpelI5RkRXWGRFZVdIMkx3cGMw?=
 =?utf-8?B?bmJUY3VUVXNQZ3ZxUXJ3Q3kxWThhTyttUFRTeGRab1dVZUVKelZZdUNTU1FZ?=
 =?utf-8?B?eGJhTW0xa1V3N2loemEwdGhOa3Q4bjBhUjVDZUwxVVBtTFBIVDd4dWZ1OTM0?=
 =?utf-8?B?aHY1ei8yQU1wZUNLbEc5V3dHZVlGMzE0dEM3TEZXaXZSZG9tekNBajZGb1Rs?=
 =?utf-8?B?RnUzNUQ2a0J3MXl5TUlmN1g3bHoxTWxMQmVrY1JidjJodkhSbzlTbzNUOHJ0?=
 =?utf-8?B?ODkrbmthd2puaDBHbUxsWm12RXE2TFRraklyb3BYRTVnU09YWGtnZGN4L2Za?=
 =?utf-8?B?RVpUdW0vTjNaK0NZaTR3SGpMRlAxRVgya24zWTN3LzdrdFdUWFUyTTU4MWFQ?=
 =?utf-8?B?SHliL3JzWWlZVktackVVemFUTm5sUEZSbHlyNlk5aFhqRENlZ0U3ekNYWGZJ?=
 =?utf-8?B?UzJLT1FsNTVxeHZ0aUNxRDh6Q3I1MTJRV1ZiUnpnMjFsbGFHbDNkNmJvRmJx?=
 =?utf-8?Q?THVTa4QbXw7nrvZp1JzCC/X5TzJl/+I/obIHz4C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4C5C774CA17C44DBE72DC430BA177AA@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5ae95a-97c7-44bd-7008-08d93c06bd8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 20:36:29.6169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rIQblwRwPSExi6QMgIoa7+qiBuTvh1a5cDGjjH0Z56BdCuebHY91K155J9uKohn8jg12x3iARxgwZhBFX2Czwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6671
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gSnVuIDMwLCAyMDIxLCBhdCAxNjozMiwgUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOg0KPiANCj4gQWRkIGEgaGVhZGVyIGZpbGUgZm9yIHR0bV9yYW5n
ZV9tYW5hZ2VyIGZ1bmN0aW9uIHByb3RvdHlwZXMgdG8NCj4gZWxpbWluYXRlIGJ1aWxkIGVycm9y
czoNCj4gDQo+IC4uL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jOiBJbiBmdW5j
dGlvbiDigJh2bXdfdnJhbV9tYW5hZ2VyX2luaXTigJk6DQo+IC4uL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2Rydi5jOjY3ODo4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2Yg
ZnVuY3Rpb24g4oCYdHRtX3JhbmdlX21hbl9pbml04oCZOyBkaWQgeW91IG1lYW4g4oCYdHRtX3R0
X21ncl9pbml04oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4g
IHJldCA9IHR0bV9yYW5nZV9tYW5faW5pdCgmZGV2X3ByaXYtPmJkZXYsIFRUTV9QTF9WUkFNLCBm
YWxzZSwNCj4gLi4vZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmM6IEluIGZ1bmN0
aW9uIOKAmHZtd192cmFtX21hbmFnZXJfZmluaeKAmToNCj4gLi4vZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZHJ2LmM6NjkwOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBm
dW5jdGlvbiDigJh0dG1fcmFuZ2VfbWFuX2ZpbmnigJk7IGRpZCB5b3UgbWVhbiDigJh0dG1fcG9v
bF9tZ3JfZmluaeKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+
ICB0dG1fcmFuZ2VfbWFuX2ZpbmkoJmRldl9wcml2LT5iZGV2LCBUVE1fUExfVlJBTSk7DQo+IA0K
PiBGaXhlczogOWMzMDA2YTRjYzFiICgiZHJtL3R0bTogcmVtb3ZlIGF2YWlsYWJsZV9jYWNoaW5n
IikNCj4gRml4ZXM6IGEzNDMxNjAyMzVmNSAoImRybS92bXdnZngvdHRtOiBmaXggdGhlIG5vbi1U
SFAgY2xlYW51cCBwYXRoLiIpDQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxh
cEBpbmZyYWRlYWQub3JnPg0KPiBDYzogIlZNd2FyZSBHcmFwaGljcyIgPGxpbnV4LWdyYXBoaWNz
LW1haW50YWluZXJAdm13YXJlLmNvbT4NCj4gQ2M6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFu
ZEB2bXdhcmUuY29tPg0KPiBDYzogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERhdmUgQWlybGllIDxhaXJs
aWVkQHJlZGhhdC5jb20+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQoNClRoYW5rIHlvdS4gVGhhdCBjaGFuZ2UgaGFzIGJlZW4gcGFydCBvZiBkcm0t
bWlzYyBmb3IgYSBmZXcgd2Vla3Mgbm93Og0KaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9k
cm0vZHJtLW1pc2MvY29tbWl0Lz9pZD0zNTJhODFiNzFlYTBhM2NlOGY5MjlhYTYwYWZlMzY5ZDcz
OGEwYzZhDQpJIHRoaW5rIGl0IHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBuZXh0IG1lcmdlIG9mIGRy
bS1taXNjIHRvIGxpbnV4LW5leHQuIElmIG5vdCBJ4oCZbGwgcG9ydCBpdCB0byBkcm0tbWlzYy1m
aXhlcy4NCg0Keg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2DE40E1EF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 19:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DE36EBED;
	Thu, 16 Sep 2021 17:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-oln040093003013.outbound.protection.outlook.com [40.93.3.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B666EBED
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 17:15:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAbDFyUdvlGPu2qOy0nCRtAZWWkUejAlUUjgFcI9CBfZO1nzS/wWo0B+ouJHfyGsNsmLNf1vovztch9lIRYavjSV5+zk5VRVpuIn4obo3e4ZSpcm2aGQb4jgyJqmPNISNKXuTh/RbcFjIE97vn3kU61Ke6wlTzByQe7fK481CJoS5JCemUcmh0w6eXz6jWxtGN3woao6Lh10SFxQNw2H6lhb8y+LtPlc47pq0tKBPS622umuHxp4cf9TTMsYXkW5NLX/ryR7x9NtNBJt8NWEg2/TCgpr6JgWlJUPSrmTOSmITSez1/OF/OwwUVaxDdWLgEAsRxf8GeU7SLDkAVw0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=V9/0ht69rSgHA4RWeq8iM0wgw9sbIqL8c7I7quy/ZzU=;
 b=PijiFFcB/rarZfDponz+pWsdx45fBuc18u5mtcPix+f4+6MEDamu0+D9P4jLP3tvAxsR+iEqN4aBDGEkeAR6c3WJISnIFmEYvRrRnMyAjLcIAg1DCrUuWxuBd2bv+5NNFyKZ+Lw7lXVwVjfpCJFtZi/Uh7U8sS7Suxr7zhygyqQX8ZX6xnM9Q91XaIdzjdHrecgAiYfuhfF7ttqiDIpU7nyvdDECfLxa5FUTYjHKJwoOZP+0Jjp7UqIEm5WsSKdA5X+YKan19OMpccr6vJDVIAThzZZA7uMF1ZAyR2LXvrhVFF5DOVDR41cBhPdkXied0xbpJm3zM/KjFNytWTt4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9/0ht69rSgHA4RWeq8iM0wgw9sbIqL8c7I7quy/ZzU=;
 b=RxOjrZREf6ZDnd9jLH/TxCt+FK6RZgpXnTeHfHmYEeYrKEhNK6wzMNR3Pd95e9yorFl6GvPcSnzv9s/zZPbJhMrzViG35oHBrmlKTgpOxSORTnp5NUebcbBrEIP794jaiX2JqT4AJINfcczyLxKH+MzngOqNSlwJZJKJQEMhpGw=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by BYAPR21MB1176.namprd21.prod.outlook.com (2603:10b6:a03:104::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.3; Thu, 16 Sep
 2021 17:15:02 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::e56b:9b01:9633:78c0]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::e56b:9b01:9633:78c0%7]) with mapi id 15.20.4544.002; Thu, 16 Sep 2021
 17:15:02 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Deepak Rawat <drawat.floss@gmail.com>
CC: Haiyang Zhang <haiyangz@microsoft.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Topic: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Index: AQHXqYGDSoFNik8c8kWZU0a77zui5aukpo7QgAIzCwCAAA9bQA==
Date: Thu, 16 Sep 2021 17:15:02 +0000
Message-ID: <BYAPR21MB1270E92AFA833942EB6B75C8BFDC9@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <20210913182645.17075-1-decui@microsoft.com>
 <CAHFnvW0iX1FMTcJzQQtjHGosavSJ6-9wkRb7C0Ljv3c+BBUEXQ@mail.gmail.com>
 <BYAPR21MB1270C4427C264D14F151A0CCBFDB9@BYAPR21MB1270.namprd21.prod.outlook.com>
 <CAHFnvW3J-9LGCUSP_5mvYFyiUMCy63=egu1X3Uv9GrecfOJvRQ@mail.gmail.com>
In-Reply-To: <CAHFnvW3J-9LGCUSP_5mvYFyiUMCy63=egu1X3Uv9GrecfOJvRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=20d8c9ba-e140-4051-a0c6-422e94604b97;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-09-16T17:12:09Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa0bef30-1f83-4c5f-60ea-08d97935852d
x-ms-traffictypediagnostic: BYAPR21MB1176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR21MB11762F484EC1C5F3F795F64ABFDC9@BYAPR21MB1176.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9WZgm6BFrf4Z0l6nqrLgNR7LJ8mpycC4NKtrLKuA3wR6bkocptv1vxLvJB0sQzVjIjAuxfk18NeljXKCIk95ucTQJLvfSWlyl42AB76ycVH1N01yetBmvKl0PUifKO9VolZkCcbGp2vmmcj29pOxg/2PYuMsbj/+wAU43qhVzzNL+qRzIdOeDF04RbTG7jpIILpM6iZ9PRwio3LFluco6enFzNhkvcGINgNVKnDSxA6DB3jeDvzvU8gNfmPbhsKzTLjlDHsZFfl99UbokrtFca9ZlA7Y3YiLNJwnhHfisZ1cXMFtLmFElHk9FniTHnvLkL0jp3CbIcmzojA2EUiMrATjHCVJNyUBGF79eZgtQ2JJxK+Zvws2d0nlSaj/kJHyKDu7oyjX+v8Nl9m88VSSAw284iXqkck8xtk+O4K4IFISfMGZqpqHoi0rZpcQmINxXmvkou7n5uRvRtcMHITN1q22J7Vu/YK8rDdwosOkD1Oafk0tbZkp4W+p1JHfaMFZyLwh7tk69X0teeYJyRi7wJXKmnsUdmtw5SMLdF9Ljr4ON3X8eclF9pcx8UeepIbn1q4RLiQjOVSxeKl4heSSFglCzmGH+xGjVyY4yR8TWsHBCK72Z7CBj/arwgMQIiw5Z4M3to+V+fUIIF2BVsqTyBA0qgsOEW6gc/bT/tq0OMQ8MTPWpx7bKVfW+DHhibC6d/7aYYhyqNM0cvSGiQmdGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(52536014)(82960400001)(82950400001)(38070700005)(4744005)(4326008)(38100700002)(186003)(8676002)(8990500004)(122000001)(33656002)(9686003)(54906003)(55016002)(2906002)(10290500003)(66446008)(64756008)(53546011)(66556008)(316002)(6916009)(26005)(86362001)(71200400001)(76116006)(83380400001)(5660300002)(66946007)(6506007)(66476007)(8936002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekV5NmFzQWRNUld2SWEydGpURk5QVWNudzcxZ3JpMmJDa0RodkhnbnFkWEpR?=
 =?utf-8?B?d1hhV1cvKy96ajVYVk9vbVhZZDQ0Z1VUUllnUTBpWHE1cG4ra1c5Q09DZTNU?=
 =?utf-8?B?VThhYTd5b3NDazR1TGMwS2ttd2kyQkE2bFkvUHk2Sy9hVWw5Z0JlNDJCZFlF?=
 =?utf-8?B?V2tKcVVBMys2OTkrclZoVkgwSE5QeTRrdGk4Ry9wak1ndDNEZy9JM3Faa0Ns?=
 =?utf-8?B?MDNPR05ZR2FCNTV3cUw0OFBtYTQxWWRhUDMyWFBWYVJVd0I0ZjFLNTNLam9G?=
 =?utf-8?B?ZEZ0R2c0b0NwMzYxNGlMRFdiSUZXK00yYmE3RzZJWTBIbVNoMldwWmZ6Y05W?=
 =?utf-8?B?TUpDVjQxdVpUaXQxQ2I3SnRHa0Jnd056Wm1OcjkyaGlwR2tvYWhKeFJ4ZDBn?=
 =?utf-8?B?dXJ3L0JxNUltbXhQMFFjMjhkSTMrTjhQY2tsQjNPRHJBbWVXUHV1YjZSOWNT?=
 =?utf-8?B?WkZXUDN4VVE3Snl6Qks0Z0NzQ0tZblA3K29QQmMxUnE3cXN5M1BKVHpXN3FB?=
 =?utf-8?B?cjdYblZwd1NWbWVicU1iYTZsWkJmNkJ2dU5xM0xWb0FRWE5uWTNNZTVpblRa?=
 =?utf-8?B?blBSZEFiUmhzMDJYRmZSZmh0VDhnT25jMDd5Q05NUGlLNW5LM1dMaTkvb3Ru?=
 =?utf-8?B?Q2VEZjcrV2tIalFyWGpJN3dROUJiaTlnQnBhMTNoV0M3eHhHb1psZFZIRVdh?=
 =?utf-8?B?R2hkOGxDeXUzK1FlQThzSGV2TGxaQ3lvQnNaa29EbFQ1VFdtb1NpbkxnbFhD?=
 =?utf-8?B?SVVnM0Y4d2ZLNlRkV2RkT2toNnp0RFpMVHVCMVBVN3RTWlpLT1F1S2JXT3V4?=
 =?utf-8?B?K0Z6MzBFOUdJYlNMcjVkZVJ5ZUFVSkdHekNGZXZwSnZkS25NR0ZBeS9KSkpX?=
 =?utf-8?B?Z0pIeWYxemV3UjNOU3c1QlBiY1BFQlJYL2NvcFE3SlNrVGo1Y3NwejBmSS9H?=
 =?utf-8?B?alpvaUtCdjdjV0NYM0dVUWwrdHBuUCtia0Fkdnc4Tk9UUGFBU3FPZWJ1K3hW?=
 =?utf-8?B?ZlFYL2pTM2tpaGlVZERQNlZiRGp3dnJIU05rY0dldytSN2FNMzREVmdyY2hO?=
 =?utf-8?B?L3E1bS84bHVLSDZkYUNzRzVjeG1FdkkwZURvTXFINUhWK0pCcUo1QlNsUUlu?=
 =?utf-8?B?M2xLd2hoTUh2Mi9OdUVmNkhDMndpc3lqSUlFTEhKT0w5UWpuZ3lyd1RRUDQ0?=
 =?utf-8?B?M2x0YUEyWFVvTDZUQUtyWE1NTHpyNkNyZjgwRnB6TFUyYkFPazhvSUc3K0t2?=
 =?utf-8?B?WFBVcVdJV3NKWit6OGlQeS8wb1VubG40Tk5Td0V6K2hkb2RHREQ3MFJyTTc2?=
 =?utf-8?B?bWRCNFNRYyt1bHErK3Bmd3JlcEFJbnp0SzNCS3ZUWGpUbGVCNUszd3ZSZm9m?=
 =?utf-8?B?L2hZWjBhd2trR2F5LzZEL1VlZXdaT1M1UHhEaU5vcnp3WXhGeU82b0dqdWFF?=
 =?utf-8?B?NEpsQzVHMUQ3Sm1UbzNuc3RBSjkyc1F5SGhpVThEdUp5VEdkVVJ3c3VHYzhU?=
 =?utf-8?B?aG5abndHSjh1RTF3Vjlla3RjNndkSTl4b096cDkrTEFsTTJEOXp3c1h6cnZy?=
 =?utf-8?B?alRDVlk5N04yaGVYajJNL002VDAzNDBpU1BBVHR5MWJrejA3K1hpbkVvOThj?=
 =?utf-8?B?Qm0yRHhPaVVOMTRWZUFJcmtkSmZkaysrMndaR2YzZkFLd3B2Vys3Wk83NDhO?=
 =?utf-8?B?QlJIUi94TUxtZFNuNU4rWTdIbi80Wk5JM3I4eFpCRzB2R29YM1h1WVBTSlZz?=
 =?utf-8?Q?KCwZ8tI1rK8VQcsPq6jl4BBvZoroGoZCT7k6b7g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0bef30-1f83-4c5f-60ea-08d97935852d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 17:15:02.2797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hkAl/BJqc35HMaiTKcktJFlmLOyq5ds47c14SmpzR6+5et//QVRdh8v1G0gIslxJ6fNJWfhmzMAH6pAhgHcorg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1176
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBEZWVwYWsgUmF3YXQgPGRyYXdhdC5mbG9zc0BnbWFpbC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjEgOToxNyBBTQ0KPiBUbzogRGV4dWFuIEN1aSA8ZGVj
dWlAbWljcm9zb2Z0LmNvbT4NCj4gQ2M6IEhhaXlhbmcgWmhhbmcgPGhhaXlhbmd6QG1pY3Jvc29m
dC5jb20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Ow0KPiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+OyBUaG9tYXMgWmltbWVybWFubg0KPiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGxpbnV4LWh5cGVydkB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL2h5cGVydjogRml4IGRvdWJsZSBtb3VzZSBwb2ludGVycw0KPiANCj4g
SEkgRGV4dWFuLCB0aGFua3MgZm9yIGNvbmZpcm1pbmcuIENvdWxkIHlvdSBwbGVhc2UgYWRkIHRo
aXMgYXMgYQ0KPiBjb21tZW50IHRvIHRoZSBmdW5jdGlvbi4NCj4gDQo+IFJldmlld2VkLWJ5OiBE
ZWVwYWsgUmF3YXQgPGRyYXdhdC5mbG9zc0BnbWFpbC5jb20+DQoNClRoYW5rcywgRGVlcGFrISAN
CldpbGwgZG8sIGFuZCBJJ2xsIHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gaHlwZXJ2X2hpZGVfaHdf
cHRyKCkgdG8NCmJldHRlciBleHByZXNzIHRoZSBpbnRlbnQgb2YgdGhlIGZ1bmN0aW9uLg0K

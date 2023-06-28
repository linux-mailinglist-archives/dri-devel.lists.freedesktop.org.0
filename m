Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C874164B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 18:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F86310E128;
	Wed, 28 Jun 2023 16:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR02CU006.outbound.protection.outlook.com
 (mail-eastusazon11013004.outbound.protection.outlook.com [52.101.54.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3A510E128
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 16:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhJ2obC0gPZI99XKB5CCu+Qmk5pPMvYTnl2kOjui76p7uvRu5sdP/qrWKjBLeMxE1lv9/+KwQaawHxuvxUcTcMguSZpYn9fQrjrqPpWXBrQxp57XXPjGhx628fFEq1mnQs6UStA10oKLDe7zV9FZ9FTuy6MfK1k4uvxVvN6srB8EjeBy1ho8pdWAEqX3CEGDoKcvIt6nV5s/c+mC3GU6jK4z2qaksaDwNSo0GN7/b6wUuFPyQsu2fPdZL9Ug5N0CbJun0K1L9rFfPWJDwTupQDrtgwWpysWJ6AcSq8zWsSVkCR4r3D3Vhwp/0gGGTuKtODGtLrEnZyTViMncO3I3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfAzGfBnc6IZEUu/lOqoZRPqrwhSx0MBpz3zUz+VAQc=;
 b=bhjTr1a83Rsv3sZ3LQhQiQLd1QpuqsOrsle61jPkKwUViatkbv/J0mXGo2/9BP3Ps0m6N4TDuGQ4Urgv1M19ymH+ThIcl//10GduDW2wQqlR/9jtlWLnbQxohWqgBrfPmpYPswx+pJV/4hpNJbSDOBogMjDPDwusCBMzHd3M9LEJZNVA447UIug+lnrBRi/kiQHW7Eys3NuSPAZxKNt7ywChExGzrza46MPnBZdSpTmCw1l7sxxup6fnA+KUD9ElwTzM40AwGAvdFet1cmJT/turGeY+wiolN5v7DDA4IVxEXJUxWvnuGKKhjukUU+jB+3ADWI9cEvI3gOmsfFIkQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfAzGfBnc6IZEUu/lOqoZRPqrwhSx0MBpz3zUz+VAQc=;
 b=BRKCy/Hhv5ahPE+ePkeQmFRQD2AWa7goQ9Bkv2fT11rZmE/oe+1wLuf06pYS/8v150Ki2P2T9KBCfQI7f3jMNIysRarZFb0ScLyQBHum+OZB12ODJoh18WYbOrqvi2kkw0tAhTp7W45AkZ8YUd9gboTicZKezlCD1bP2sUntyJU=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by PH0PR05MB7512.namprd05.prod.outlook.com (2603:10b6:510:29::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Wed, 28 Jun
 2023 16:26:37 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::ae06:b40c:b514:83fa]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::ae06:b40c:b514:83fa%7]) with mapi id 15.20.6500.036; Wed, 28 Jun 2023
 16:26:37 +0000
From: Zack Rusin <zackr@vmware.com>
To: "contact@emersion.fr" <contact@emersion.fr>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Thread-Topic: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Thread-Index: AQHZqYB0IAa7YmGt/0WC41DxXOpPjK+gQxuAgAAkgQA=
Date: Wed, 28 Jun 2023 16:26:37 +0000
Message-ID: <9e7a97481d17439f81cf1126e497bf720638c5f0.camel@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <ELiKi1uMIZlwdApTnf2UXxjOpykcSbJ8YC8EXm-kzkHNMKHzA6iYzXTvbyyAfhqf9LGkjQSt1QErJ1m6WwglWXg9Hmh3QsG6mV84jbYTLFQ=@emersion.fr>
In-Reply-To: <ELiKi1uMIZlwdApTnf2UXxjOpykcSbJ8YC8EXm-kzkHNMKHzA6iYzXTvbyyAfhqf9LGkjQSt1QErJ1m6WwglWXg9Hmh3QsG6mV84jbYTLFQ=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|PH0PR05MB7512:EE_
x-ms-office365-filtering-correlation-id: 45546f60-70dd-462e-74ce-08db77f47213
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KJvMaapRTWisFp4doP4DoA0Ms/F12pi2ND9Qs5humzSwjpUG2J4peo3/lwoHoOLKFkCss3MOucaFP2N33OivloZk+plTvjAk0+QdQ5gJSfOaY+ca95fDwxNIbsTRAxGtjj/GiO4rgWHKc1OmJ+8L3vfrgef10V+CJUHLhwWeaBcEUFRc8pFwp3XdsBhEaJDy9y2Rq5ZCgxFcgALdmhA8e9BtLOsXu76ny/QfbLwBwsFG1XLNbLeo6mq/yd4WjQY5nZgchJcVcMfgWB975krTBNBjx6FKqfSLBRi+Gg4HK2fMP6u2AdBYTt0QyjLiGr9/zwOqPvX7sjCo4cdJKT3MqSlNsxSZxUiTSrau5jrpXHIA1y8HlhUrs+m8goYBzn2n6nq73tDSPKWxbu4lErg552Zdz5HW7OHORoglNA5ZHkT5JzlO1noMi64d8ZE7qfOx8ThCjKUvHfWqwNZ0uPyo5G0VvFpHH8qxPftXBj3lvxW8wlC4syXCBnzvC/v6MHUVbj/lscJ27MnuBHKLjTX9nwfnOGIWv2IgvvXXdGYeXEVmC6gk0Kg78tCwQwhYfqdUKqkb8EfE6tbygaFHPkQ/gffGQYoeSme22hLgr/ojhtHCv0gg/yebvAvfQGjbBRk0aNGfxCjZrPN8PGcdgy9TGIc0cBRcgYSNjISTJdKoVJw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(2616005)(86362001)(2906002)(4744005)(38100700002)(122000001)(36756003)(38070700005)(8936002)(8676002)(41300700001)(6486002)(5660300002)(478600001)(54906003)(316002)(6916009)(76116006)(66446008)(64756008)(66476007)(66556008)(66946007)(71200400001)(26005)(6512007)(186003)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUhmTWQ0SzBVeE4vKzBXSGZQcmxGazdzbnArb2dzU1ZxeG9nd0lIdHVCSXJJ?=
 =?utf-8?B?QVlyQW5kdXJ5Ri9TZGNpU0hEK21ydS8vSjQvazRaTkpOS0JLRlgyU0FuQUJ0?=
 =?utf-8?B?cjl5dkdpNFRBRVdHR0RCY09id2FmVEx0Q0lhVEFzeTQyUHFCcEg2UG1YSTMw?=
 =?utf-8?B?elAxdGU5dkRnMVQwNHRnY0I4RDZkNTNneVUvYzJ1TkNGanBGUkdKVmtlSkVz?=
 =?utf-8?B?MVhLZDBmaXlhZW5aSTE5YzlZeTNVSFJZYy9ocEV2ZWJoUjA0N1Q0MldHZExN?=
 =?utf-8?B?QmV5OG9zZXZOTkYrVjhqRG9DNTdKTCtRTVFjbEFId29lSjF4a05sTE9oT0V3?=
 =?utf-8?B?RCtiMmd3ZWxQRWxuUUh2T3NlVnN5SWxXeUl6T0V5S0VXVzRlM3EzT3UwWjM0?=
 =?utf-8?B?RUdBd0FRWTRIeXpzei9qcDJuOHV4ZVBScWJBNEZCU1RnZ296djVmTkpBbnMx?=
 =?utf-8?B?TEorM3FnNGRIMjNidGd6OVUyVzk2c2YxWjA5SEpleEN5ajNRQmRIWmhPSXVF?=
 =?utf-8?B?N1NGblVtRndndGlJQ2NBd0ZRM1BCa0VGdHpMcEZzeU15WVMySzZxTHdGZno4?=
 =?utf-8?B?cDkyZEJMZmhwc1RDZ0RsRHNTOGROK1RvbkZRR1h2RzVTVjZWczI4cWtTZWYz?=
 =?utf-8?B?M2daTThpNCsySXdyWGdhSG8yZlVEVENwMTcrYWRhdHpHM2xOVGV6cWducDVE?=
 =?utf-8?B?T2lzcjlGR0dnWVhWbG54ME1IVm54LzZmWng4UUZtTS9FZkdERGh3TDB5emVS?=
 =?utf-8?B?amZSaGRmNDJJTFBjak5CQ2N6SzdQZTFENk9QWk5NNC94Ty9CN05mTDQ0YU9v?=
 =?utf-8?B?d25YQmo2RGppWkNkSWMwb0dEc1IvdWpwMTJ1NFViQXFvQ09HS1Bad2lhVHdO?=
 =?utf-8?B?aHhqSHJuNGlIZDQ0SE1rL0w4bFoxZ00wN1VFbzBBM3QxYStrT05nWDFPaWEr?=
 =?utf-8?B?M3NmZE55M0g0dHBZSUw2TC9wVjVEUGpJQ3FrVFk5cmVXMm5WbmtJQUFpbFc0?=
 =?utf-8?B?K3JWMzZ3cEJTUENhdGNPQk5nN0dkc0U5eU5MNTErTG1oOVZJb0tNbTEwLzBq?=
 =?utf-8?B?YmpUY004Ris1TUpEQ2UvaVpqRTJENmN3Q01qUmUwVVVVOHg3SEMrWVdhclMy?=
 =?utf-8?B?MVIxL0l1Vkh6T0VlSGs2T0NsSTZCM2J0M1BvbnBrMjlSSWVWSXhhWVNocVJO?=
 =?utf-8?B?cGtsZUdLSGhpTzFzUXh6bVdwcW5KUm03VlV2VDZxSE10N3lWVW9QRWtMQXQv?=
 =?utf-8?B?Um1ZSGRPWVdnT1RpMlBBUVk0bTlNQ2JnRWFkT29RMjNBNTlTcXNwVHI0SHEy?=
 =?utf-8?B?Z0VuNDVjdzFrYkFoeGRCeWNxLzV1STV6cWV4KzhqSVo2RWorNGxPZzd2bFdz?=
 =?utf-8?B?L2xUMSswbmpvS3NoMHBZNnRkOTMxUm0vL2o2UWk3b1hHcHhXWmZqVVkycGNa?=
 =?utf-8?B?cGk4NCt2Snl1WjZzeVRLNklaZjI3R2R5TFk1UXBKZmhIMEYxeHlOeWcyK3Zy?=
 =?utf-8?B?bGpkZXlVb3FoVDdFRUtiOEd1UlRjcDRmMGVBWHRLVS9GWW96TjBmbjVORGxN?=
 =?utf-8?B?VVVRQVhvWHdkeGdmTzRPRWhYVURJTzNzY1JkOFBjeWhWRHBuUTB6eVo4UzZl?=
 =?utf-8?B?SmpRdThoYjBud1RHajgwNDRzMi9PWmZNeDlkVlhhN01xcHVWbld0SmoxV1RZ?=
 =?utf-8?B?ZlkxZDFyNlMveElFYSt0a3dzL2J2Y2Vjcjhrc284VXE5ZEEybDdJQis0YVpU?=
 =?utf-8?B?N0kzK0hBNHp5ZkdrWlhKalV3R2xOUStsaU51VUVjQTh0dW5sUEU3UlJvSWU4?=
 =?utf-8?B?OS9vWWg5YWhtQUVvVHBkWnh4SzNNblprNmxYSHdBS2hkRlVrRHBzZThDb0Y1?=
 =?utf-8?B?UGdJRTBMbklZRmVSNCszajdOZkdQaU52SUZ1WFpDdjNRR2Y5N0NNNDBoZk1v?=
 =?utf-8?B?RW5yV2ZNTjJxbS9lRjREWXdxbFhjcnJheGRsOGJicnhTRmRkSVdRbGlqb3Nr?=
 =?utf-8?B?U0JsdWluazAxcng2M0VQMlptVzduUWlBc00vK1dMeVgzRi9FbWpYdGRoU284?=
 =?utf-8?B?UmNYUTN6bzZEWGpWaFY3dTVjUGN5WmNKT1U1cW0xaG5yR0xTREF1aGxWdXp0?=
 =?utf-8?Q?UpbX36uzkob+CMo20q4/ngz1C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C46699A7664CFF4E84DD453310DBCFFF@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45546f60-70dd-462e-74ce-08db77f47213
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 16:26:37.2429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7a97Im0xaB+rPo9D2xlFQLZbFbBGP2HTzAc8npxfqSt4yq4xdAcqhkfJkZ2uCGF+czXpurRqfbKNFpIaCowdew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB7512
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 Michael Banack <banackm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA2LTI4IGF0IDE0OjE1ICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6DQo+IEkg
dGhpbmsgd2Ugc2hvdWxkIGRyb3AgdGhlIENSVENfWC9DUlRDX1kgcHJvcGVydGllcyBmb3IgaG90
c3BvdC1hd2FyZSBjdXJzb3INCj4gcGxhbmVzLg0KPiBUaGUgZHJpdmVycyBhcmVuJ3QgZ29pbmcg
dG8gZG8gYW55dGhpbmcgd2l0aCB0aGVzZSwgYW5kIGV4cG9zaW5nIHRoZW0gdG8gdXNlci0NCj4g
c3BhY2UNCj4gbWFrZXMgaXQgc291bmQgbGlrZSB1c2VyLXNwYWNlIGNvbnRyb2xzIHRoZSBwb3Np
dGlvbiBvZiB0aGUgcGxhbmUsIGJ1dCBpdCByZWFsbHkNCj4gZG9lc24ndC4NCg0KSSB0aGluayB3
ZSB0YWxrZWQgYWJvdXQgdGhpcyBiZWZvcmUuIFRoZSBDUlRDX1gvQ1JUQ19ZIHByb3BlcnRpZXMg
YXJlIGFic29sdXRlbHkNCmJlaW5nIHVzZWQgYW5kIHRoZXkncmUgcmVzcGVjdGVkIHdoZW4gdGhl
IHJlbmRlcmluZyBpcyBkb25lIGd1ZXN0LXNpZGUgLSB0aGUgc3lzdGVtDQp3aWxsIGJlIHByZXR0
eSBicm9rZW4gaWYgdGhlIGNsaWVudCBzZXRzIHRoZSBjcnRjIHgveSBwcm9wZXJ0aWVzIHRvIHNv
bWV3aGVyZSB3aGVyZQ0KdGhlIG1vdXNlIGlzbid0IHRob3VnaC4NCg0KQW4gYXJndW1lbnQgY291
bGQgYmUgbWFkZSB0aGF0IGNydGMgeC95IHByb3BlcnRpZXMgc2hvdWxkIGJlIHJlbW92ZWQgb24g
dGhlIGN1cnNvcg0KcGxhbmUgaW4gZHJpdmVycyBmb3IgcGFyYS12aXJ0dWFsaXplZCBoYXJkd2Fy
ZSBhbmQgaW5zdGVhZCByZXBsYWNlZCB3aXRoDQptb3VzZV9wb3NpdGlvbiB4L3kgcHJvcGVydGll
cyB0aGF0IGRvIGV4YWN0bHkgd2hhdCBjcnRjIHgveSBwcm9wZXJ0aWVzIGRvIGJ1dCBtYWtlDQpp
dCBleHBsaWNpdCB3aGF0IHRoZXkgcmVhbGx5IGFyZSBvbiBhIGN1cnNvciBwbGFuZS4NCg0Keg0K

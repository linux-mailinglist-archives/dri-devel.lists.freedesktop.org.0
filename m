Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0446EE88
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70C10E846;
	Thu,  9 Dec 2021 16:53:32 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62A889BF0
 for <dri-devel@freedesktop.org>; Thu,  9 Dec 2021 09:34:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfhadjcZPT1hCfe4TyIttH4x8oCEf3B/1P7ufsmYIqj9rmmMzkQ3NTTkHUd0sBLlrtxsEkZObEKRxse4yTUBRErJYZQEIWfyMtybFzUk27bh9nBjWYT/YWqV9efXycMeq6GGnlthwVgydCjrgpLauDSawj+qV3uxlVyWVaZOUt1D8L6UQWeEnQVqfJ1sHMI4F5UFQwa/6f7OWN3diFct6/3d4ApYQ/IEyuIDA2OVIXdUezLbpBItWumPNQR3Jec3PlfVORIkO6hHtk0/8yiI7RQOOBOyYbD6qMXtCwgpY3CBeh8w5muMhnlAiXQuclUnNxlE3IY9PGYaaM/TJTUNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsGROe4zwhQmqE94g6oy8JTk7iwmpOpwG+j3v0Wd+pg=;
 b=dNM45JCP6YvaJWHh2LvdWCXvLYw0kKXQXRmEyyTPnRW2zVIPqJwNs3nU0guhrTEM9MdX1uKSSALTXIYRMZnCzPsYbBg6HKPfTQ/Xv6c6Lpw81hzyXgaVqobRuDbNeRe8ZtA/agYTG77bp2pEhbG9KAHt3dChXgI8Lj2n1Y+1+mLGQTfrwKpylamXdAqhxiqv5MioobPoPBqfyM+lwB7QdPu49dDw63YTC9NTuBx2ZdSjWiIsjUzexp1W4EQ2rFaBvhLO8Rq7c6QEobU3GU6IpLFlRvmQuVsBt5ckrHi3XL2+bqmB6kPwOCPpQ2AC/VyNX0pN7YxX3IfRUyQ4LNTIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsGROe4zwhQmqE94g6oy8JTk7iwmpOpwG+j3v0Wd+pg=;
 b=eODWhDsu45b3gKt3P6s53/T50hLRFiaQ6JxeseMWnHsv0hbHy/lg14um4ZqfIHmEDdoAsoqOTMJf83aYKYlz5wr/iOwRb+P1H2+ddQiDz/U8jOPr3g3Rdv38pv+/x2YEqBms4CvZmRqRbraz4YLMGFkYiNX7bm+vzcOkVv4MPGY=
Received: from DM6PR05MB7099.namprd05.prod.outlook.com (2603:10b6:5:14e::10)
 by DM6PR05MB6988.namprd05.prod.outlook.com (2603:10b6:5:1dd::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.8; Thu, 9 Dec
 2021 09:34:48 +0000
Received: from DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::eca1:ac54:5509:47dc]) by DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::eca1:ac54:5509:47dc%4]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 09:34:48 +0000
From: Martin Krastev <krastevm@vmware.com>
To: "dri-devel@freedesktop.org" <dri-devel@freedesktop.org>, "zack@kde.org"
 <zack@kde.org>
Subject: Re: [PATCH 11/12] drm/vmwgfx: Remove usage of MOBFMT_RANGE
Thread-Topic: [PATCH 11/12] drm/vmwgfx: Remove usage of MOBFMT_RANGE
Thread-Index: AQHX6sZwjk4+FIcWlkGljq+69wWxlKwp6nWA
Date: Thu, 9 Dec 2021 09:34:48 +0000
Message-ID: <7e5ed7b9e73d3c7ef6d0142aaed47df0d620b692.camel@vmware.com>
References: <20211206172620.3139754-1-zack@kde.org>
 <20211206172620.3139754-12-zack@kde.org>
In-Reply-To: <20211206172620.3139754-12-zack@kde.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83aacb04-4d20-4373-37d0-08d9baf724bb
x-ms-traffictypediagnostic: DM6PR05MB6988:EE_
x-microsoft-antispam-prvs: <DM6PR05MB698821595C2BF865393DB86EAE709@DM6PR05MB6988.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGseG61Ri3rgBDsAZE/4pZl3ZCunBHS0L/9AytXz6lYFP6439WnBanQRBJ3PxR8WEChJddtU1dMq42JAZ+L6pvjYM1RK8EusI371JAgPkwjtb4wrvfmIU+4I5+8OGmqT7YHTm+zhxbxu5wJiij3sshmL7LpWp35UYz+nuKruIF+vEALHf8BupH7/++PZP9ZcWWPlXKgOhhRT6Ppm2uOXxozw6ta/Fc0t4MG3YGtOrYCFM/8SjBK1DY0UcSoJz3lOmNvd5HWKq6W+lXntKN5hm65BRJjP89FsX3t+aubT0cKvHg4h9fx/meZPATD6MM5ScOkHlge2LcLgn8gWFZwUIPDnOEQf586rH9XAjXCjk/FHgvUVfYN/DKhUYuxWHhC/L+4p8u9sO8/IGov1zPPW8rlb+xlZRlv/5Gn4wchq9SlcFXCcGmYpmkrNMOBQdkKek/1dNEMTxTDHN9aFX0PQbctcI/4e50hjj8ZcUmrN1TRzBAtA8fkUfAg47XnI9wfnorCnyEGpOz30WItMVCsoFxuf2azAlVIM2CdM5WErO02IChekUXX84FBp7qTHl1N9cjlMGOHDt02h/EI9ieWmrqoSeX4T/t+ijjsWGj6GKaNdw/VElXW6CEEXDEKieW7Q5a4zVE1zHcBYBGHB1ywLUDUlEGUk9AMOuQLwowexW8QAtC1nQrkYjK/7O2wR6izPsjL0ULGQvvd4hiQcAsLbU9ADHLlrwuJ7yuc6RDfNmL4XzDLG0Z0z53OhPkrOhtDJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR05MB7099.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(5660300002)(2906002)(38070700005)(38100700002)(6486002)(66946007)(64756008)(8676002)(6506007)(66556008)(76116006)(91956017)(508600001)(316002)(66476007)(2616005)(66446008)(86362001)(107886003)(54906003)(186003)(71200400001)(110136005)(6512007)(26005)(36756003)(8936002)(83380400001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2xuSitaYjM3NU1JYkg0SkN4dlhZOEt5QWZVZWNxOS9yc2poY09HbzVqV2xa?=
 =?utf-8?B?enFPR1U0SlNSMDhpNDZSenhqbEdsdGNkenpSNnMxZjNEYi81K3dpZm14NlVD?=
 =?utf-8?B?TTNWTlJLRGpTQ01kbUY3ZWttTlFjR1F2SVpDQm8zMjFnZzRKMmJMY1JMYlQ0?=
 =?utf-8?B?UkFDcC9zc0N5QjRsR0U0SDBoUDJSNHJSOE5mc0h4UkNlVXc2ZXQxcmJBb0Qz?=
 =?utf-8?B?U0grT2NTZ3JNTG5NSStDVy80blNNUG8vTEcyKzRYTVdnRGw1TitzOEJKSWIy?=
 =?utf-8?B?bnk4SmlEM0N2ZktnTnhPQ0p4OGlGaUViZjV4YTN0aWFDVHNRc2NFSHY5T29y?=
 =?utf-8?B?SDFNbTMydmJ4bUdKZk9uclFsQXRXNGtqVEhTd0lZY2YwZ3YrL2toM2hGWVJu?=
 =?utf-8?B?RnY1ZHVLMGVxUmlpUXdHNEl5Mld5bWVoZTBKZ0hTbmx0YzRETzVkOGdqbVQv?=
 =?utf-8?B?OVcvczcvZ2J5cGRkdWlwUDZHQXpOaTFPV1I0QlloL1Y2aWxHS2tKcVpodTFS?=
 =?utf-8?B?eDRRNnFTQ0ZVK1NkWFNSNjE3QXVFZ0RjdWR4aUtOVWllWWFER2MvK1VlUXNk?=
 =?utf-8?B?Vi9uOEZTUitpRmFlRzIwalJPdWlJamRZR3FmT1dRaEViTlI5UCtpQXhKUXgv?=
 =?utf-8?B?bHl6QXZ3clhGVDUwSSt0MFBpd2pZR2lkNm05K0FPRnBGV3I4bFJ1R0JGVFk2?=
 =?utf-8?B?VUIzbmxIWEQ5V3YyZVpKZlhESnNGS3hIdE51bG5NdVR4WGhPMEVwalRVZEJ1?=
 =?utf-8?B?cnV6ZExidDhIcHA2MDg3Zm9SaTU2Ni92alhLbHJvZ29LUEZ2TEMrV09OMVlV?=
 =?utf-8?B?eFl5emEreGpuQjl1cDF0N01UMmV4TWx6eXBlWFQ0M3N5U1VpOUp0QVczbGVs?=
 =?utf-8?B?ejNlMzc2UGNDSnFwUk05c29hN3ZhRWU5KzlEOTNFQXM3dzN4cTQ3ditPR3hp?=
 =?utf-8?B?RVFMWHFXdG0yZWMzU3Fmay9iZ0JTYUZENmhtZ2Z1VTgwL0hzeE1SSWVuVkxF?=
 =?utf-8?B?QzNRNnpqZWlzc3FQUVlraVo0bytTdEdKZTQyQ3ZzWjVVK0o4ZDEyN2VLV0hC?=
 =?utf-8?B?MEw3NmthVmpsdzM2Tk43akpFVjdtU2JZQzFXeWpKTzNtNEpFNi9HdlhHenFn?=
 =?utf-8?B?dTV6dWdqcG5oV0pyT3hWV1c1NkFiZWowQXk4N0RQTzFkNzhYY0luMXprNlJT?=
 =?utf-8?B?Tm9ZeTZxNE5nV3hodHRuMjN5L0dYcEd0dzdHejVKYmVxb3VnWVJady9SaGRI?=
 =?utf-8?B?aW10NEFXeklxcDdvVGJDMHRxbS9aOHBLbjMxR0wwbUUwZmpDNTJoWGZWVXhh?=
 =?utf-8?B?Yk5NcU9TdWUvSVQ5WExiRHFiTW9USVNMa1pPWlFuMmVNOFBQMnBGbmlOeVd0?=
 =?utf-8?B?bnl1OHdrejRsQjl4WTB1TzhCSXhQcFVqWW9KK05BUnhSQUlyUUVVOG0zeTFD?=
 =?utf-8?B?ejZBUmxHK2pNZlNEdUpTS2ZwaGhHOTlEcHN6a1dsUGh0MnEyUXpmL0FZdUlq?=
 =?utf-8?B?QnhuU3hOUDFIaWg0aXRaV282alBVUGlZL3hBd3BsZGJ4dWNxQTdlRTNXSHRC?=
 =?utf-8?B?cURVK2p6clZkQXBUdzIwdzFvSmFuNWZxZzVMdW8zeU85dnc0VjFrUk04bkZh?=
 =?utf-8?B?WjJ6UkM2NU1xdXN5MG5NU1hpeTJwYTZiWGtEWklCazRDMUlKbmxKTVhmcEUv?=
 =?utf-8?B?R29pY3JhcDBKazhZcXU3ZFVHaC9aZHFNcWdCaG5LVWc1enoyaTU1MUNPZGJ3?=
 =?utf-8?B?Rms4ekFnVWZwS2V3M0V1aEdtSVA4bHcxVVZuRGcraUhtYTZENlkzeXlZSlNz?=
 =?utf-8?B?VWp5LzIvY0FEWmRaNmVDUk15TFhKeGlaN1pabWdiMnFQUnZkeGJJK1pTS2w0?=
 =?utf-8?B?WmlZQnIyVjBOVU1kMXVJbGsvMThtd3pZTjNvaG95U3dkYzlsRHBSdlBSS0pY?=
 =?utf-8?B?bUdKQ0UxOExCaGFzK0pyU3o5T3dlQUtSUjA0dU5QUzY2MGNxZzR1SVlFL1Mz?=
 =?utf-8?B?eVNMVDgrSXNJc1RzckpldU1HZy9nYXl4UnBkZCtETDI5dWw5WG1JMUlSRm1h?=
 =?utf-8?B?YUFVbjJKSTY0SmxuaHNPdHNFK1YzUktKSE1aaEczOHB0UzdIVXYxWTRzcisz?=
 =?utf-8?B?VUUwdTBHQUlJZjBWeWdJakl3alB2bDc0bVc4RzRnYXg4Tm9VSzRNWmpWUUhl?=
 =?utf-8?Q?BCz88G/v5KCIc32WH0n4biM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E0C1222694C8D4E9E38AA524F33ADBE@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB7099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83aacb04-4d20-4373-37d0-08d9baf724bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 09:34:48.5143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vp7dA2yyCROqODQnpd9n0DprZXV80lGaJsDCMlYoVDx6YLjfzTtY/sflb2qpTTDNDxy/LUo/yO6I9HrrMthlOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB6988
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
Cc: Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTEyLTA2IGF0IDEyOjI2IC0wNTAwLCBaYWNrIFJ1c2luIHdyb3RlOg0KPiBG
cm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiANCj4gVXNpbmcgTU9CRk1UX1JB
TkdFIGluIHRoZSBlYXJseSBkYXlzIG9mIGd1ZXN0IGJhY2tlZCBvYmplY3RzIHdhcyBhIG1ham9y
DQo+IHBlcmZvcm1hbmNlIHdpbiBidXQgdGhhdCBoYXMgY2hhbmdlZCBhIGxvdCBzaW5jZS4gVGhl
cmUncyBubyBtb3JlDQo+IGEgcGVyZm9ybWFuY2UgcmVhc29uIHRvIHVzZSBNT0JGTVRfUkFOR0Uu
IFRoZSBkZXZpY2UgY2FuL3dpbGwgc3RpbGwNCj4gcHJvZml0IGZyb20gdGhlIHBhZ2VzIGJlaW5n
IGNvbnRpZ3VvdXMgYnV0IG1hcmtpbmcgdGhlbSBhcyBNT0JGTVRfUkFOR0UNCj4gbm8gbG9uZ2Vy
IG1hdHRlcnMuDQo+IEJlbmNobWFya3MgKGUuZy4gaGVhdmVuLCB2YWxsZXkpIHNob3cgdGhhdCBj
cmVhdGluZyBwYWdlIHRhYmxlcw0KPiBmb3IgbW9iIG1lbW9yeSBpcyBhY3R1YWxseSBmYXN0ZXIg
dGhhbiB1c2luZyBtb2JmbXQgcmFuZ2VzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmFjayBSdXNp
biA8emFja3JAdm13YXJlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9kcnYuaCAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9tb2IuYyAgICAgICAgfCAgNiAtLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3R0bV9idWZmZXIuYyB8IDEyIC0tLS0tLS0tLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAx
OSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oDQo+IGlu
ZGV4IDIxZGQ2OWU1Y2RmYi4uMTc2MGJhMWIwZDRhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaA0KPiBAQCAtMzMzLDcgKzMzMyw2IEBAIHN0cnVjdCB2bXdfc2dfdGFibGUg
ew0KPiAgCXN0cnVjdCBwYWdlICoqcGFnZXM7DQo+ICAJY29uc3QgZG1hX2FkZHJfdCAqYWRkcnM7
DQo+ICAJc3RydWN0IHNnX3RhYmxlICpzZ3Q7DQo+IC0JdW5zaWduZWQgbG9uZyBudW1fcmVnaW9u
czsNCj4gIAl1bnNpZ25lZCBsb25nIG51bV9wYWdlczsNCj4gIH07DQo+ICANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21vYi5jIGIvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfbW9iLmMNCj4gaW5kZXggNjVmN2MyYmRjMzIyLi4yZDkxYTQ0YTNiMjIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21vYi5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21vYi5jDQo+IEBAIC0xNDYsOSArMTQ2
LDYgQEAgc3RhdGljIGludCB2bXdfc2V0dXBfb3RhYmxlX2Jhc2Uoc3RydWN0IHZtd19wcml2YXRl
ICpkZXZfcHJpdiwNCj4gIAlpZiAob3RhYmxlLT5zaXplIDw9IFBBR0VfU0laRSkgew0KPiAgCQlt
b2ItPnB0X2xldmVsID0gVk1XX01PQkZNVF9QVERFUFRIXzA7DQo+ICAJCW1vYi0+cHRfcm9vdF9w
YWdlID0gdm13X3BpdGVyX2RtYV9hZGRyKCZpdGVyKTsNCj4gLQl9IGVsc2UgaWYgKHZzZ3QtPm51
bV9yZWdpb25zID09IDEpIHsNCj4gLQkJbW9iLT5wdF9sZXZlbCA9IFNWR0EzRF9NT0JGTVRfUkFO
R0U7DQo+IC0JCW1vYi0+cHRfcm9vdF9wYWdlID0gdm13X3BpdGVyX2RtYV9hZGRyKCZpdGVyKTsN
Cj4gIAl9IGVsc2Ugew0KPiAgCQlyZXQgPSB2bXdfbW9iX3B0X3BvcHVsYXRlKGRldl9wcml2LCBt
b2IpOw0KPiAgCQlpZiAodW5saWtlbHkocmV0ICE9IDApKQ0KPiBAQCAtNjIzLDkgKzYyMCw2IEBA
IGludCB2bXdfbW9iX2JpbmQoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwNCj4gIAlpZiAo
bGlrZWx5KG51bV9kYXRhX3BhZ2VzID09IDEpKSB7DQo+ICAJCW1vYi0+cHRfbGV2ZWwgPSBWTVdf
TU9CRk1UX1BUREVQVEhfMDsNCj4gIAkJbW9iLT5wdF9yb290X3BhZ2UgPSB2bXdfcGl0ZXJfZG1h
X2FkZHIoJmRhdGFfaXRlcik7DQo+IC0JfSBlbHNlIGlmICh2c2d0LT5udW1fcmVnaW9ucyA9PSAx
KSB7DQo+IC0JCW1vYi0+cHRfbGV2ZWwgPSBTVkdBM0RfTU9CRk1UX1JBTkdFOw0KPiAtCQltb2It
PnB0X3Jvb3RfcGFnZSA9IHZtd19waXRlcl9kbWFfYWRkcigmZGF0YV9pdGVyKTsNCj4gIAl9IGVs
c2UgaWYgKHVubGlrZWx5KG1vYi0+cHRfYm8gPT0gTlVMTCkpIHsNCj4gIAkJcmV0ID0gdm13X21v
Yl9wdF9wb3B1bGF0ZShkZXZfcHJpdiwgbW9iKTsNCj4gIAkJaWYgKHVubGlrZWx5KHJldCAhPSAw
KSkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZm
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYw0KPiBpbmRl
eCAyMGY3NTJmZjYxNjguLmI4NGVjYzZkNjYxMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYw0KPiBAQCAtMjg4LDggKzI4OCw2IEBAIHN0YXRpYyBp
bnQgdm13X3R0bV9tYXBfZG1hKHN0cnVjdCB2bXdfdHRtX3R0ICp2bXdfdHQpDQo+ICB7DQo+ICAJ
c3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiA9IHZtd190dC0+ZGV2X3ByaXY7DQo+ICAJc3Ry
dWN0IHZtd19zZ190YWJsZSAqdnNndCA9ICZ2bXdfdHQtPnZzZ3Q7DQo+IC0Jc3RydWN0IHZtd19w
aXRlciBpdGVyOw0KPiAtCWRtYV9hZGRyX3Qgb2xkOw0KPiAgCWludCByZXQgPSAwOw0KPiAgDQo+
ICAJaWYgKHZtd190dC0+bWFwcGVkKQ0KPiBAQCAtMzIxLDE2ICszMTksNiBAQCBzdGF0aWMgaW50
IHZtd190dG1fbWFwX2RtYShzdHJ1Y3Qgdm13X3R0bV90dCAqdm13X3R0KQ0KPiAgCQlicmVhazsN
Cj4gIAl9DQo+ICANCj4gLQlvbGQgPSB+KChkbWFfYWRkcl90KSAwKTsNCj4gLQl2bXdfdHQtPnZz
Z3QubnVtX3JlZ2lvbnMgPSAwOw0KPiAtCWZvciAodm13X3BpdGVyX3N0YXJ0KCZpdGVyLCB2c2d0
LCAwKTsgdm13X3BpdGVyX25leHQoJml0ZXIpOykgew0KPiAtCQlkbWFfYWRkcl90IGN1ciA9IHZt
d19waXRlcl9kbWFfYWRkcigmaXRlcik7DQo+IC0NCj4gLQkJaWYgKGN1ciAhPSBvbGQgKyBQQUdF
X1NJWkUpDQo+IC0JCQl2bXdfdHQtPnZzZ3QubnVtX3JlZ2lvbnMrKzsNCj4gLQkJb2xkID0gY3Vy
Ow0KPiAtCX0NCj4gLQ0KPiAgCXZtd190dC0+bWFwcGVkID0gdHJ1ZTsNCj4gIAlyZXR1cm4gMDsN
Cj4gIA0KDQpSZXZpZXdlZC1ieTogTWFydGluIEtyYXN0ZXYgPGtyYXN0ZXZtQHZtd2FyZS5jb20+
DQo=

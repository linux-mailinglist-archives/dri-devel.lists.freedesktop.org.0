Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A527DE65
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 04:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60A6E4B6;
	Wed, 30 Sep 2020 02:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA6E6E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dP2/h1s7q1j1yuRUWy8SCZ1djGf13zUYlujPhAQhQTXa0iyoSt9AjAe55qyXA9gxlb5k/DnzLZeHlvRpPwGY5hEZhSM4rhqurgZ3XdVhSndtkZ76ZVR6SFcig+t9kfPpezRahYLw8CfjHoOU+y7qTd/PWdUwFoGsI7Gnkj/GAfpZbaPNxAu3u0GfF5yIuDjXGdgpvrVPzIyKtFMcciK5Z9aQm05VYlN6X6Oxr391viS7P7YNy0KXB3F5ObCy7U4KIM0GNNmG1Ti7uAZcivHJTUhuf9yArmymCsH6sx8nqUpsEOmWNqPtn9j3uEbQukglZIc4NRX4AiKkDLICpncRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vGleGnkLaHKzGdM3DGv8DYz5wQaRMMJ+wH1dwQMbnI=;
 b=XLqzNIU4ELHAi/o2LItVWJjnOhtOI2YAKCZygkUznSM3vkS7tnm9XquCdUxd993XTjUngzhBEmsxSFwboldESUlItC0vRogft0dGjqdIaLtWrI7PzRpA2kZfpJM4cKlDG4OtB1ugFe2g7vGpBMZxldQqQH2gaolMp9CxGl1S75VNunNnr/v2Pi1NmEjOsfo5S6G/y76NndPluGQbH+T8HX1L3OmHyudWxC5tIQdsRy6q1E6gwcG518ae0rfb8Oe51D9S87sjNIDzn96FZGTr5Z5q3Yg+J17SpXzSDRpW9B0JmnjpnBSy9g7DjOhKjQArQ1zNMaKvP8DIsxHpljY5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vGleGnkLaHKzGdM3DGv8DYz5wQaRMMJ+wH1dwQMbnI=;
 b=BDOARCvp9e+UFDPgGKJGrhiBr5tJqGhDfuzbDbLO42JOi1KMh02f/pwaisaX62+mGB2SVeZQWmPmwzFmypruQ1Q8uxV+CPjxXBRXLC4ZeIjDwRxhikwOChB+/D9oyY9kMUwGdKAjqTgeJJIDJtdCLKG3hAUpTHzOZSWSGhHWlVo=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by MN2PR05MB6797.namprd05.prod.outlook.com (2603:10b6:208:1bb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.14; Wed, 30 Sep
 2020 02:17:37 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::6499:fc85:5382:1f06]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::6499:fc85:5382:1f06%3]) with mapi id 15.20.3433.031; Wed, 30 Sep 2020
 02:17:37 +0000
From: Zack Rusin <zackr@vmware.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: return value from inserting in thp mode.
Thread-Topic: [PATCH] drm/vmwgfx: return value from inserting in thp mode.
Thread-Index: AQHWls6Ao3eerkMBKUyutYkvoS7XmqmAchoA
Date: Wed, 30 Sep 2020 02:17:37 +0000
Message-ID: <FA4856C5-AB9D-454D-96EE-AE60AFDAD06A@vmware.com>
References: <20200930020738.786609-1-airlied@gmail.com>
In-Reply-To: <20200930020738.786609-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 846791bf-4343-414e-f2cf-08d864e70033
x-ms-traffictypediagnostic: MN2PR05MB6797:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB67976513831B7D058DA60DB7CE330@MN2PR05MB6797.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jhlJWVlHadsoseJIws34PjgddxIdWmMK4eIMvNJwsMrA/31sbel7QemzaTCAhrt46/gmLWVLXiOPPkdGdodNtZN/qmh/jboT2AbRVW5paAZj6JdF5jR4qZIDeX02rqQuyu/7mhm1s3SmO2AkCpvIFVqaUPJt8A5w01sdJTQEsGU+AnWhbSYfuR5P6FTCmvMKI+Ei4mXxaYH4ZDITwxHhzwyfOgfEh5x112WF+tEFrHez//Hp+3sPVN+E5y37UzGYsL7OO0BzJuhXXaqbXPjygjYEWWt76oulzO34oMkqU3/u9jhOTVic08XLBFIbJL/jjtBkLuIpLJThNCjnnha8SQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(26005)(53546011)(186003)(83380400001)(6506007)(478600001)(2906002)(107886003)(2616005)(4326008)(6512007)(36756003)(6486002)(76116006)(6916009)(4744005)(71200400001)(66476007)(64756008)(66556008)(54906003)(66446008)(316002)(66946007)(8936002)(33656002)(8676002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZbmeWgmNI6NMzXZTUUPYyZJTxva5gc5+JpVew32DXh3tRX2JUksG19CCJBrl4gsoeVBlink51bN8mAJ4mVDfY/elyYgCT375B0JSvvCe7w0d9jJ3hfa4bSl5RHOQDcOKOJ5b0ZtvOWUAUVdOOM9l2LUkk+ppwUJzPAahafyKZg0aVqIqWkK5ZSnYbWJfniI0l+tf44Km5c0vvXItZ99oz2fMBub/tfGW42z4UpBCHzB1fCBlkvU4PgZ1mujS9WRe6eFeAiWCrDeJ3lb1RZEnC6yabZZnla+eirVBy8fw3hIgZds7tr/WesVrWCo7oiiPfs1nnWDq/hN+IrHaDJTOrf+VUHbdpByBoKPZ+mOya0jzcQJOOjSPza6JhQN8t1CLwi6VsjljJjnZWr5X/xcg3l0vI3PNMFGtLwalHjbmXnP4xyhllhYcufnuu3372Dyd42DzQZf3ocLvTXQzdP9N/9a4nsxbDhYR+qD09wsC2Ei2/p3lgQJtul5N2o1IVDrBPBuP/rvDiT2el/1l3WRhM/vmS+w6GJeVH46ayEor8AmiDXk2Qqmf/mYMRIw+3PxWjbse0/RTOov0tBqzrjksY2i/fWuZklkipAFW8CBkPj4LgNMIpG8oIZ5sZOcJb+suzNY4Rc4XlaKur1cJMr6fXQ==
Content-ID: <69F6B598D51FA54A9EBF9D0C22806677@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846791bf-4343-414e-f2cf-08d864e70033
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 02:17:37.5453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JX8sS4VUjJY68MN8oGcE+Uf2mM35/S0T/HK4wkPRg4keulTc69rITCirRxzvPlZ28b4DwdYPbTYnjHISlpHOMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6797
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "rscheidegger.oss@gmail.com" <rscheidegger.oss@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IE9uIFNlcCAyOSwgMjAyMCwgYXQgMjI6MDcsIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29t
Pg0KPiANCj4gVGhpcyBzZWVtcyB0byBmaXggdGhlIGZhaWx1cmUgSSdtIHNlZWluZyB3aXRoIDUu
OS1yYzcgdW5kZXINCj4gdm1wbGF5ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxp
ZSA8YWlybGllZEByZWRoYXQuY29tPg0KPiAtLS0NCj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfdGhwLmMgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3RocC5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdGhwLmMNCj4gaW5kZXgg
YjdjODE2YmE3MTY2Li5jOGI5MzM1YmNjZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3RocC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3RocC5jDQo+IEBAIC05NSw3ICs5NSw3IEBAIHN0YXRpYyBpbnQgdm13X3RocF9nZXRfbm9k
ZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCj4gCQltZW0tPnN0YXJ0ID0gbm9k
ZS0+c3RhcnQ7DQo+IAl9DQo+IA0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiByZXQ7DQo+IH0N
Cg0KVGhhdOKAmXMgcGFydCBvZiBpdC4gUm9sYW5kLCBoYXMgYSBwYXRjaCBmcm9tIG1lIGluIGhp
cyB0cmVlIHRoYXQgZml4ZXMgaXQuIFJvbGFuZCwgY2FuIHlvdSBwbGVhc2Ugc3VibWl0IGl0IHRv
IERhdmUgZm9yIG1lcmdlPw0KDQp6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=

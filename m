Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C076316C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5F689913;
	Tue,  9 Jul 2019 07:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A1689FC5;
 Mon,  8 Jul 2019 17:32:27 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6589.eurprd05.prod.outlook.com (20.179.25.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 17:32:24 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 17:32:24 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Thread-Topic: hmm_range_fault related fixes and legacy API removal v2
Thread-Index: AQHVMer7t/tGwC82LkyVSWCA9HbG9qa6qyIAgAZW04CAAABlAA==
Date: Mon, 8 Jul 2019 17:32:24 +0000
Message-ID: <20190708173219.GL23966@mellanox.com>
References: <20190703220214.28319-1-hch@lst.de>
 <20190704164236.GP3401@mellanox.com>
 <41dbb308-fc9e-d730-ffb0-6ce051dff1e1@nvidia.com>
In-Reply-To: <41dbb308-fc9e-d730-ffb0-6ce051dff1e1@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:208:d4::39) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06f06ac4-6250-447d-49b3-08d703ca3d01
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6589; 
x-ms-traffictypediagnostic: VI1PR05MB6589:
x-microsoft-antispam-prvs: <VI1PR05MB65893AD6AA3A6095CC078DD2CFF60@VI1PR05MB6589.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(6916009)(8936002)(66556008)(2906002)(66476007)(66446008)(64756008)(66946007)(73956011)(305945005)(99286004)(81166006)(81156014)(8676002)(86362001)(102836004)(316002)(6436002)(54906003)(6246003)(36756003)(52116002)(256004)(71200400001)(71190400001)(6486002)(478600001)(14454004)(53546011)(68736007)(186003)(5660300002)(66574012)(476003)(6512007)(33656002)(11346002)(2616005)(6506007)(25786009)(26005)(386003)(66066001)(7736002)(76176011)(53936002)(486006)(4326008)(6116002)(1076003)(446003)(3846002)(229853002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6589;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nY15vKNO4PNEEgep0hJ6zItN1FcRngQV6udYZyjYDpozrGLDU2uJLKpU0keTx/nEevhOBPj/hvaucyE4urOVb0RHPpgr2ma1NCYL7SbLmv67CmHEs2VXDZV29Hq0kI56JUBDc0nCsGHmevOXqmMKc2qVv25V9aSISiDyC0NRgxlidjKRpQeOgcWgP919clBsGOGQXD4+VKwVCvRlE6vB/fFiI2NdxRwqAdnPVzKZRf6+Sp0FS9gVbCio9cq6zjh7KBqS0fYd4XzYC84u+eziq5JTcxvqrunyUxw4qV5WP6+Q/IiOk4ndl7wR9u8YU3lYua0DsUP7yqWyxJUcLwzIpnwaRM7lFxgy+DzD/mDmG9BZTtcFPpMQGS5A/guKF2ExxGzAfUbQxe5q4dg+9zEsvC+Wuvfv29xC7iQkHNUYRh4=
Content-ID: <F61E600089470D4898FBE87BCA1D4B71@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f06ac4-6250-447d-49b3-08d703ca3d01
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 17:32:24.4372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6589
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyRZoytxL5GxI8Nuxt8XuYqlyWChhgVpZkttH29Bvqo=;
 b=D4QnriIZp4nCkMSSM2oTOX28PMZcD/EM4rVQVZ1eL2yXyrf+EdxcjiPBRi6WuEX8r2u9lmg+NFOAcTriiU939Jer4mN8rDHc8bGgK3JN5NsLY4eaIiryDsHapvOXyN+VUHZcLA/agG2Z19YfRhT71+nGTx5C2n1X0ZwLgJ2JiyE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTA6MzA6NTVBTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6DQo+IA0KPiBPbiA3LzQvMTkgOTo0MiBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0K
PiA+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDAzOjAyOjA4UE0gLTA3MDAsIENocmlzdG9waCBI
ZWxsd2lnIHdyb3RlOg0KPiA+ID4gSGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sDQo+ID4gPiAN
Cj4gPiA+IGJlbG93IGlzIGEgc2VyaWVzIGFnYWluc3QgdGhlIGhtbSB0cmVlIHdoaWNoIGZpeGVz
IHVwIHRoZSBtbWFwX3NlbQ0KPiA+ID4gbG9ja2luZyBpbiBub3V2ZWF1IGFuZCB3aGlsZSBhdCBp
dCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhNTSBBUElzDQo+ID4gPiBvbmx5IHVzZWQg
Ynkgbm91dmVhdS4NCj4gPiA+IA0KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gPiA+ICAgLSBk
b24ndCByZXR1cm4gdGhlIHZhbGlkIHN0YXRlIGZyb20gaG1tX3JhbmdlX3VucmVnaXN0ZXINCj4g
PiA+ICAgLSBhZGRpdGlvbmFsIG5vdXZlYXUgY2xlYW51cHMNCj4gPiANCj4gPiBSYWxwaCwgc2lu
Y2UgbW9zdCBvZiB0aGlzIGlzIG5vdXZlYXUgY291bGQgeW91IGNvbnRyaWJ1dGUgYQ0KPiA+IFRl
c3RlZC1ieT8gVGhhbmtzDQo+ID4gDQo+ID4gSmFzb24NCj4gPiANCj4gDQo+IEkgY2FuIHRlc3Qg
dGhpbmdzIGZhaXJseSBlYXNpbHkgYnV0IHdpdGggYWxsIHRoZSBkaWZmZXJlbnQgcGF0Y2hlcywN
Cj4gY29uZmxpY3RzLCBhbmQgcGVyc29uYWwgZ2l0IHRyZWVzLCBjYW4geW91IHNwZWNpZnkgdGhl
IGdpdCB0cmVlDQo+IGFuZCBicmFuY2ggd2l0aCBldmVyeXRoaW5nIGFwcGxpZWQgdGhhdCB5b3Ug
d2FudCBtZSB0byB0ZXN0Pw0KDQpUaGlzIHNlcmllcyB3aWxsIGJlIHB1c2hlZCB0byB0aGUgbmV4
dCBjeWNsZSwgc28gaWYgeW91IHRlc3QgdjUuMy1yYzENCisgdGhpcyBzZXJpZXMgeW91J2QgZ2V0
IHRoZSByaWdodCBjb3ZlcmFnZS4NCg0KVGhhbmtzLA0KSmFzb24NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

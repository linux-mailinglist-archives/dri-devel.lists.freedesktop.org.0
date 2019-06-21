Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B463A4E1D8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 10:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37CC6E84B;
	Fri, 21 Jun 2019 08:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680064.outbound.protection.outlook.com [40.107.68.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAEB6E84B;
 Fri, 21 Jun 2019 08:23:57 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1708.namprd12.prod.outlook.com (10.175.89.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 21 Jun 2019 08:23:55 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 08:23:55 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Emil Velikov
 <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0AgAl2VwCAAPZpAIAACCkAgAAL3QA=
Date: Fri, 21 Jun 2019 08:23:54 +0000
Message-ID: <c954db03-098d-096c-6fc3-c6aae5a9b3d3@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <80d7f5d7-e1a3-f03b-6dd9-d1979da27adc@daenzer.net>
In-Reply-To: <80d7f5d7-e1a3-f03b-6dd9-d1979da27adc@daenzer.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51f7c506-0844-4d11-1c7c-08d6f621ccab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1708; 
x-ms-traffictypediagnostic: DM5PR12MB1708:
x-microsoft-antispam-prvs: <DM5PR12MB1708B3CBD78865941F8EBFEF83E70@DM5PR12MB1708.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(376002)(346002)(366004)(189003)(199004)(6116002)(6486002)(65806001)(53546011)(6436002)(25786009)(14444005)(476003)(7736002)(186003)(31696002)(11346002)(6246003)(305945005)(446003)(8936002)(71190400001)(8676002)(73956011)(486006)(71200400001)(81156014)(256004)(76176011)(4326008)(66556008)(66476007)(14454004)(86362001)(64756008)(66446008)(36756003)(58126008)(31686004)(53936002)(46003)(99286004)(316002)(65826007)(2616005)(72206003)(81166006)(66946007)(6512007)(6506007)(52116002)(68736007)(229853002)(102836004)(2906002)(66574012)(54906003)(64126003)(110136005)(386003)(5660300002)(478600001)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1708;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /2wnNZIYYUz7gbceXsRJMT3IyUg4vwt9xD0lBoH1i5G5lv7cqboxfbnFfXv+Bv2OUpeXJK0g/ayNU8WNwgnk0MrWg1LmUwI7CT8JOCQOEDVoUg8pW2nFlTOXHpEjVNsEYboDqtH8rIzmmyfQdpzUMOypYFGxo8ADEOmcEv9iHiiYfKOjgpe0znrCOZa8ImxoFsfUlinpwMrv9Qf1owMjaV5ReBO13Is56WhfN3lysBr7jJHwYZU3Jbleo7u7ozlOWBE8FWDf3u83t2V8wQC4bygSPlnssiRr7X+ILvzQuSx00Qn62nD5JhRhWGUCSDH6pUCUXzJIUTmP4I9uWxi2Q7Ackmp5QZ8SeY2ah78X6r7IIGLHxj3vjmM4lGMNY1Jj5TpwRJ838jYv06g+gLCN0DvJeGuPUtmfCl3M41Hfux4=
Content-ID: <69F644A58F7BE54DAFC056201413F393@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f7c506-0844-4d11-1c7c-08d6f621ccab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 08:23:55.0225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygqccRZuNHgw9V5VCak2PuqpwLNUc9+HJm7bqu+GWz0=;
 b=MylxwvjzLP6K6R1oSSbhXSIy1Zngx/394I6uzJfGMF1E2qvgsCMbMxKlDtOD8chagymzlIR5G89MmU6zMMkS54fL/ZO9Qqs0veVF/HSIJWBH8c0buRL38ijzIDtWXkqLmyNGlKsCCFw1sZCAWmJwuLmSr+cYpNAqdI5tj7HHlug=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMTkgdW0gMDk6NDEgc2NocmllYiBNaWNoZWwgRMOkbnplcjoNCj4gT24gMjAxOS0w
Ni0yMSA5OjEyIGEubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gRmlyc3Qgb2YgYWxs
IEkgdHJpZWQgdG8gZGlzYWJsZSBEUk0gYXV0aGVudGljYXRpb24gY29tcGxldGVseSB3aXRoIGEN
Cj4+IGtlcm5lbCBjb25maWcgb3B0aW9uLiBTdXJwcmlzaW5nbHkgdGhhdCBhY3R1YWxseSB3b3Jr
cyBvdXQgb2YgdGhlIGJveCBhdA0KPj4gbGVhc3Qgb24gdGhlIEFNREdQVSBzdGFjay4NCj4+DQo+
PiBUaGlzIGVmZmVjdGl2ZWx5IGFsbG93cyB1cyB0byBnZXQgcmlkIG9mIERSSTIgYW5kIHRoZSBy
ZWxhdGVkIHNlY3VyaXR5DQo+PiBwcm9ibGVtcy4gT25seSB0aGluZyBsZWZ0IGZvciB0aGF0IGlz
IHRoYXQgSSdtIGp1c3Qgbm90IHN1cmUgaG93IHRvDQo+PiBzaWduYWwgdGhpcyB0byB1c2Vyc3Bh
Y2Ugc28gdGhhdCB0aGUgRERYIHdvdWxkbid0IGFkdmVydGlzZSBEUkkyIGF0IGFsbA0KPj4gYW55
IG1vcmUuDQo+IEZXSVcsIGdldHRpbmcgcmlkIG9mIERSSTIgYWxzbyBuZWVkcyB0byBiZSBkaXNj
dXNzZWQgd2l0aCBhbWRncHUtcHJvDQo+IE9wZW5HTCBkcml2ZXIgZm9sa3MuDQoNCkdvb2QgcG9p
bnQsIGJ1dCBJIGRvbid0IGV4cGVjdCBtdWNoIHByb2JsZW1zIGZyb20gdGhhdCBkaXJlY3Rpb24u
DQoNCklJUkMgdGhleSB3aGVyZSBxdWl0ZSBoYXBweSB0byBub3QgaGF2ZSB0byBzdXBwb3J0IERS
STIgZXhjZXB0IGZvciBhIA0KdmVyeSB2ZXJ5IG9sZCBYIHNlcnZlciB2ZXJzaW9uLg0KDQo+PiBB
cyBhIG5leHQgc3RlcCBJIGxvb2tlZCBpbnRvIGlmIHdlIGNhbiBkaXNhYmxlIHRoZSBjb21tYW5k
IHN1Ym1pc3Npb24NCj4+IGZvciBEUk0gbWFzdGVyLiBUdXJuZWQgb3V0IHRoYXQgdGhpcyBpcyBy
ZWxhdGl2ZWx5IGVhc3kgYXMgd2VsbC4NCj4+DQo+PiBBbGwgd2UgaGF2ZSB0byBkbyBpcyB0byBm
aXggdGhlIGJ1ZyBNaWNoZWwgcG9pbnRlZCBvdXQgYWJvdXQgS01TIGhhbmRsZXMNCj4+IGZvciBk
aXNwbGF5DQo+IEknbSB3b3JraW5nIG9uIHRoYXQsIGNvbnNpZGVyIGl0IGZpeGVkLg0KPg0KPg0K
Pj4gYW5kIGxldCB0aGUgRERYIHVzZSBhIHJlbmRlciBub2RlIGluc3RlYWQgb2YgdGhlIERSTSBt
YXN0ZXIgZm9yIEdsYW1vci4NCj4+IFN0aWxsIG5lZWQgdG8gc3luYyB1cCB3aXRoIE1pY2hlbCBh
bmQvb3IgTWFyZWsgd2hhdHMgdGhlIGJlc3Qgd2F5IG9mDQo+PiBkb2luZyB0aGlzLg0KPiBNeSBz
dWdnZXN0aW9uIHdhcyB0byBhZGQgYSBuZXcgdmFyaWFudCBvZiBhbWRncHVfZGV2aWNlX2luaXRp
YWxpemUuIFdoZW4NCj4gdGhlIG5ldyB2YXJpYW50IGlzIGNhbGxlZCwgbGliZHJtX2FtZGdwdSBp
bnRlcm5hbGx5IHVzZXMgYSByZW5kZXIgbm9kZQ0KPiBmb3IgY29tbWFuZCBzdWJtaXNzaW9uIGV0
Yy4gd2hlbmV2ZXIgcG9zc2libGUuDQoNClllYWgsIHNvdW5kcyBsaWtlIGEgcGxhbiB0byBtZS4N
Cg0KQ2hyaXN0aWFuLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs

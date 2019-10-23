Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F802E1EED
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB86EB04;
	Wed, 23 Oct 2019 15:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780059.outbound.protection.outlook.com [40.107.78.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622876EB01;
 Wed, 23 Oct 2019 15:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMOorKBk+92hZ4hTdu7nXfWg8h4xntppI1J72dZOxmqr+8muJWiipT4UOuoYxNbQbCUbPBEqJHWR7Afjm+reBi3UxcJ+H1fpPH7kbumbhsWZxYu9KqIzG0yWkDHgcQZ0m/zUvH3GmmCt9cbu19yRshU1DXNixhiUv8RfOhO97Zl1wX5Zb3WpkLLhbDuyHMHhmWc/brwdBHhqNp9H4HbPjOVg6xr48m4B9v67A6S/Ww3Q3uiwKPlS7mVu8oZBrqFqXG/AMl9exy6I//1s6rJZ8FpFJuM3ee8Dx33A7Ij8SeODyKZsaHcsGgCCtDzu2XpMmxavVbyYEfWoIvHP34gUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ow02aj8UJjqfQA2PqxSMpmLNMqA/6E0y4MiGFlCzY7g=;
 b=XwM7iC9ivM2spbK9/V+rpalieZvep/1WO2IsodiaRSHtFIZHbwHoV3Pgo6dAXg8KVFd67ZdRuE1Ey4xqCSdEbAsceC5oUPcnQSXzmQ+knum1n5+HkUeUmUHz8Nz4OZMwFM0G2/AAXbM/6tu79MUozuYh533unHJXmHiKlihkkO1qRRoP8MQkOpnfN0tVcpTlLmFDE3Cw6neL7TY8bl3tKajJqqXFwPBmWXmF6y3CQnCeSxCbR32wNQ7bLHfY790Uupbst8xdqiwn6AxWnQJnyz7b/dfR8yNlunawv/qMwtAISVuK4CbrE+z8RS9d4u5bnfR5cIhXiUvGiSGyAp/wPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2503.namprd12.prod.outlook.com (10.172.116.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 15:09:37 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 15:09:37 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Wambui Karuga <wambui@karuga.xyz>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: correct length misspelling
Thread-Topic: [PATCH] drm/amd/amdgpu: correct length misspelling
Thread-Index: AQHVhtphIugDXIurOUq9HckZdzuHT6doWgwA
Date: Wed, 23 Oct 2019 15:09:37 +0000
Message-ID: <6c7a76ae-6af7-39bf-5d5a-a2f5e77d57b3@amd.com>
References: <20191019073430.22093-1-wambui@karuga.xyz>
In-Reply-To: <20191019073430.22093-1-wambui@karuga.xyz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
x-clientproxiedby: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 71decd2c-379c-40d8-f783-08d757cb050c
x-ms-traffictypediagnostic: CY4PR1201MB2503:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB250348E7C5065AB2B1DFF24F8C6B0@CY4PR1201MB2503.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(305945005)(110136005)(3846002)(2906002)(7736002)(4326008)(6246003)(6116002)(52116002)(6486002)(71190400001)(76176011)(54906003)(4001150100001)(71200400001)(316002)(36756003)(229853002)(99286004)(6436002)(58126008)(6512007)(31696002)(478600001)(81156014)(8936002)(81166006)(446003)(14454004)(8676002)(186003)(11346002)(476003)(31686004)(386003)(5660300002)(53546011)(256004)(102836004)(6506007)(26005)(2616005)(14444005)(25786009)(66446008)(66946007)(486006)(66476007)(65806001)(66556008)(2501003)(66066001)(65956001)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2503;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VShdpMU5pOWhGb0nxCaH+cOOCaUKuV+9ah3XpI0LD1HTJje7oI5fg3JVAe2X5X4iu2yazWRNeSLz7+aHEVVs2R10twybKQZVVXZmq1n/bLgj28hjzkxKU07KUnPvr81fw4MVSMM8yB0x6D1tWLNZhpP9AkpX7Gf6NYQK9BhfLyF8He0sJ8PwS6lyD7uEa9MX4SDck+Ai3qeovef6wkbpFIGk8OiWSTb+jJ6cbPW3VHt3tIg9rJPJaPNPb9/8RBGqdLdX81f5CVOR0HxR9bMCxuCQNHDDQ8jsg/izgt7Oy+HwQW7lC8WU8KWSULZmiJBdxK3hLGTQ8i5OWXAJ49Rjj/EQRCg8zePQTapedt5KUAcrQE3deYc+Er7PsAd8y52NzVZlRpbWpDkRY97DDbHhwrRvoA+/q+faz/K/pRj8l1WL/XfHk7AkxvxGbfqI2svg
Content-ID: <D436C0D5DC56AF4CAC599E34AF15B934@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71decd2c-379c-40d8-f783-08d757cb050c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 15:09:37.3366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRw91J7/H2Qu6cY/1Ycc6xMjlgR3KT5enVxpleD1xLc5Ct6jLMZX7EM2R0Eown1/OugVA7qHStMJTwhPgQ3pcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2503
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ow02aj8UJjqfQA2PqxSMpmLNMqA/6E0y4MiGFlCzY7g=;
 b=uQj8g4tbW889hdsRB06AuP9e/97QPFQ9IkQux3Sk/reQmf1f5XJGuLo9Fu6t8t5tnNr1u/c6z9cuHMWutF0M9VXvml1HvvOvsmX7XTYwz+XW/UcDalywnroTdAeQDdsaiK5PQBtOdBy7QVczRPVuRo1m5IxyVz0mAgM1sk5VvKw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "outreachy-kernel@googlegroups.com" <outreachy-kernel@googlegroups.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xOSAzOjM0IGEubS4sIFdhbWJ1aSBLYXJ1Z2Egd3JvdGU6DQo+IENvcnJlY3Qg
dGhlICJfTEVOVEgiIG1pc3BlbGxpbmcgaW4gdGhlIEFNREdQVV9NQVhfVElNRU9VVF9QQVJBTV9M
RU5HVEgNCj4gY29uc3RhbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2FydWdhIDx3
YW1idWlAa2FydWdhLnh5ej4NCg0KVGhpcyBwYXRjaCB3b3VsZCBiZSBiZXR0ZXIgc2VudCBpbiBh
IHBhdGNoIHNldCB3aXRoIHRoZSAibWFrZSB1bmRlY2xhcmVkDQp2YXJpYWJsZXMgc3RhdGljIiBw
YXRjaC4gWW91IGNhbiBkbyB0aGF0IGJ5IHByb3ZpZGluZyBhIHJhbmdlIHRvICJnaXQNCmZvcm1h
dC1wYXRjaCIuIEkgdXN1YWxseSBjYWxsIGdpdCBmb3JtYXQtcGF0Y2ggd2l0aCB0aGUgLW8gcGFy
YW1ldGVyIHRvDQpwdXQgYWxsIG15IHBhdGNoZXMgaW4gYSBkaXJlY3RvcnkuIFRoZW4gSSBjYW4g
c2VuZCBpdCB3aXRoICJnaXQNCnNlbmQtZW1haWwgKiIgaW4gdGhhdCBkaXJlY3RvcnkuDQoNClJl
dmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KVGhp
cyB3b24ndCBhcHBseSBjbGVhbmx5IHdpdGhvdXQgIm1ha2UgdW5kZWNsYXJlZCB2YXJpYWJsZXMg
c3RhdGljIi4NClBsZWFzZSBzZWUgbXkgY29tbWVudHMgb24gdGhhdCBwYXRjaCBhbmQgc2VuZCBh
IHYyIGZvciB0aGlzIG9uZS4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDggKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jDQo+IGluZGV4IGM1YjNjMGM5MTkzYi4uYWFhYjM3ODMzNjU5IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+IEBAIC04Niw3
ICs4Niw3IEBADQo+ICAjZGVmaW5lIEtNU19EUklWRVJfTUlOT1IJMzQNCj4gICNkZWZpbmUgS01T
X0RSSVZFUl9QQVRDSExFVkVMCTANCj4gIA0KPiAtI2RlZmluZSBBTURHUFVfTUFYX1RJTUVPVVRf
UEFSQU1fTEVOVEgJMjU2DQo+ICsjZGVmaW5lIEFNREdQVV9NQVhfVElNRU9VVF9QQVJBTV9MRU5H
VEgJMjU2DQo+ICANCj4gIGludCBhbWRncHVfdnJhbV9saW1pdCA9IDA7DQo+ICBpbnQgYW1kZ3B1
X3Zpc192cmFtX2xpbWl0ID0gMDsNCj4gQEAgLTEwMCw3ICsxMDAsNyBAQCBpbnQgYW1kZ3B1X2Rp
c3BfcHJpb3JpdHkgPSAwOw0KPiAgaW50IGFtZGdwdV9od19pMmMgPSAwOw0KPiAgaW50IGFtZGdw
dV9wY2llX2dlbjIgPSAtMTsNCj4gIGludCBhbWRncHVfbXNpID0gLTE7DQo+IC1zdGF0aWMgY2hh
ciBhbWRncHVfbG9ja3VwX3RpbWVvdXRbQU1ER1BVX01BWF9USU1FT1VUX1BBUkFNX0xFTlRIXTsN
Cj4gK3N0YXRpYyBjaGFyIGFtZGdwdV9sb2NrdXBfdGltZW91dFtBTURHUFVfTUFYX1RJTUVPVVRf
UEFSQU1fTEVOR1RIXTsNCj4gIGludCBhbWRncHVfZHBtID0gLTE7DQo+ICBpbnQgYW1kZ3B1X2Z3
X2xvYWRfdHlwZSA9IC0xOw0KPiAgaW50IGFtZGdwdV9hc3BtID0gLTE7DQo+IEBAIC0xMzI3LDkg
KzEzMjcsOSBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJYWRldi0+c2RtYV90aW1lb3V0ID0gYWRldi0+
dmlkZW9fdGltZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0Ow0KPiAgCWFkZXYtPmNvbXB1dGVfdGlt
ZW91dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOw0KPiAgDQo+IC0JaWYgKHN0cm5sZW4oaW5wdXQs
IEFNREdQVV9NQVhfVElNRU9VVF9QQVJBTV9MRU5USCkpIHsNCj4gKwlpZiAoc3RybmxlbihpbnB1
dCwgQU1ER1BVX01BWF9USU1FT1VUX1BBUkFNX0xFTkdUSCkpIHsNCj4gIAkJd2hpbGUgKCh0aW1l
b3V0X3NldHRpbmcgPSBzdHJzZXAoJmlucHV0LCAiLCIpKSAmJg0KPiAtCQkJCXN0cm5sZW4odGlt
ZW91dF9zZXR0aW5nLCBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEgpKSB7DQo+ICsJCQkJ
c3Rybmxlbih0aW1lb3V0X3NldHRpbmcsIEFNREdQVV9NQVhfVElNRU9VVF9QQVJBTV9MRU5HVEgp
KSB7DQo+ICAJCQlyZXQgPSBrc3RydG9sKHRpbWVvdXRfc2V0dGluZywgMCwgJnRpbWVvdXQpOw0K
PiAgCQkJaWYgKHJldCkNCj4gIAkJCQlyZXR1cm4gcmV0Ow0KPiANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

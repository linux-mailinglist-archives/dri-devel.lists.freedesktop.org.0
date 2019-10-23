Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FDE1EE4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30FC6EB01;
	Wed, 23 Oct 2019 15:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780059.outbound.protection.outlook.com [40.107.78.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FA16EB00;
 Wed, 23 Oct 2019 15:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0csRe8nO+Xlq5DSgD7KX+l//NvXgVBlFIVlejXad3yUwS8gK888eSGX6Ou21uFVD6C8hfZrHuVU14xjD+LZRmEeqsRowgnWcEPhz6xDYvE6RIKnj+WjJ+mZuQGTGrXc2NTn+YA7soHG8Qb4b3ihyvMeC/szS5JthogG06Ws3eSwzwnsFDV/gD4R+P1UuqhLknWB6GLiz5eMKXfQW4F2vSVYp22vQX6Y6A9RmZzNEusKi9BWyeSdcH4drFzAeyB0fSkLs//Zl7uTlLcB5e0N+UKlVmAyi8Fm8YZ4N35WQmUD+cihc1WGV3BnWs7AbFI+F0azRxjhp1siaBPvArKrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLsUTAwVWOhjK1KcoN0kjBv6aZkTAONVb9OoBmeizkU=;
 b=HwoQqKf7JJWGS1/35uVGRsgyMpA5EiRxYDQkDDrVL0u1jzd5rWEyHpatPeN8/0NyO+23oyCnHVHtzqqBqBPpoKVPpbN25N9HCgDaqhGJSjhB/AZgmHnwAgM5IZ44ied5FghWTPEEZaVIs1S6uLmzIPaRokWPmtkUdFosKP55nsJuDBOc91hQqb0S8TeakTsCNUHU70aDCGBKPMR/a7ZkhTD+HO1pjXjzSVCyDgPQ3zrwX45NYG6ZQoyhccP7qYMaMgqUu2wgrGK15AuOquwzJUweF+H/eJ5JoXP1aNzvbfAICSSWgfPbcjwrRgB68O+8O7s5B1dkitSLXYaMSLipxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2503.namprd12.prod.outlook.com (10.172.116.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 15:09:34 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 15:09:34 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Wambui Karuga <wambui@karuga.xyz>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: make undeclared variables static
Thread-Topic: [PATCH] drm/amd/amdgpu: make undeclared variables static
Thread-Index: AQHVhtpcup3yDyLbLkW9oq/0oA1P3KdoWgmA
Date: Wed, 23 Oct 2019 15:09:34 +0000
Message-ID: <0f3fa30e-0392-054b-a81e-b9cb4475fe07@amd.com>
References: <20191019072426.20535-1-wambui@karuga.xyz>
In-Reply-To: <20191019072426.20535-1-wambui@karuga.xyz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
x-clientproxiedby: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 184adec6-bf1f-4861-6853-08d757cb031f
x-ms-traffictypediagnostic: CY4PR1201MB2503:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2503AA87890F9C6810D0BDC18C6B0@CY4PR1201MB2503.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(305945005)(110136005)(3846002)(2906002)(7736002)(4326008)(6246003)(6116002)(52116002)(6486002)(71190400001)(76176011)(54906003)(4001150100001)(71200400001)(316002)(36756003)(229853002)(99286004)(6436002)(58126008)(6512007)(6306002)(966005)(31696002)(478600001)(81156014)(8936002)(81166006)(446003)(14454004)(8676002)(186003)(11346002)(476003)(31686004)(386003)(5660300002)(53546011)(256004)(102836004)(6506007)(26005)(2616005)(14444005)(25786009)(66446008)(66946007)(486006)(66476007)(65806001)(66556008)(2501003)(66066001)(65956001)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2503;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jdR0CWfZxOV/Go+d/G0FIPBpzC2xLTYWvsZwgCieUTihtJhNWKeRwnbXGlc12pfm1V0RxLSDnen63I5Hu1MJJLvteXimsODaVIjH/zMdO1fS06WlphBRdq9ozVu8XN3cU3UH7fSV6vEEiJ7UEalFCdKUyuK0HIDe3KtfXi/SbCB/zv9lK7h1MANKvNrWUqAgclMYGlmJGNt+0bkWlLfY70VpnqP+EwNcgqYgyJAhMap1RqE51wYFoSWTpa9fss8VlRMkvbg237F6ME5TlcnU9B8aL7UsGJ8vl2/zAbAEENTU513723kI+45dwB1LmjhhEhE0DvgaV0JaBiE2OdH84L3sbasynAbY6S6YKoDf7qyBKV8RZEer1CKk7Z/yKokpp8Az9D6gi1bhQ3qbDAiKFDPRB0uETDjdeK1qa2mb+aEoTTBfeqaMags/qxcaZXnJzIXzkS0wTbq0rRE/THqsw5R7ruTrKs1gwA2zuacT32g=
Content-ID: <73D636242A42C84890D7BF400312A648@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184adec6-bf1f-4861-6853-08d757cb031f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 15:09:34.1190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GgXB0oOxQ2lUNDbFRW5Soopm4YO4ePf1W5pKn90Dmjfx0MsHAaGF79Dzyin0djFERPjO+dPB+U4eKIy2EsYgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2503
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLsUTAwVWOhjK1KcoN0kjBv6aZkTAONVb9OoBmeizkU=;
 b=0omwQSQzBEEaCtAl+xI/Pl8oGIBs/HnnBG4KaKhl+/O9wn8xO2skqJT6Ed9He5BJCnu+4j0KNhcD5rYI/6D6C5Tv7iCEROiQwdhMshTr41QYNBG9Ffue4bYMrqhYlaqWlq6AVj3Ir/AV1B6/o1y+XMMUFxKI0nedAQCHpdv0mww=
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

T24gMjAxOS0xMC0xOSAzOjI0IGEubS4sIFdhbWJ1aSBLYXJ1Z2Egd3JvdGU6DQo+IE1ha2UgdGhl
IGBhbWRncHVfbG9ja3VwX3RpbWVvdXRgIGFuZCBgYW1kZ3B1X2V4cF9od19zdXBwb3J0YCB2YXJp
YWJsZXMNCj4gc3RhdGljIHRvIHJlbW92ZSB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nczoN
Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jOjEwMzoxOTogd2Fybmlu
Zzogc3ltYm9sICdhbWRncHVfbG9ja3VwX3RpbWVvdXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/DQoNClRoaXMgc2hvdWxkIGJlIGRlY2xhcmVkIGluIGFtZGdwdS5oLiBh
bWRncHUgaXMgbWFpbnRhaW5lZCBvbiB0aGUNCmFtZC1zdGFnaW5nLWRybS1uZXh0IGJyYW5jaCBm
cm9tDQpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eC8/aD1hbWQtc3Rh
Z2luZy1kcm0tbmV4dC4gQ2FuDQp5b3UgY2hlY2sgdGhlcmU/DQoNCj4gZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jOjExNzoxODogd2FybmluZzogc3ltYm9sICdhbWRncHVf
ZXhwX2h3X3N1cHBvcnQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2FydWdhIDx3YW1idWlAa2FydWdhLnh5ej4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA0ICsrLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+IGluZGV4IDNmYWUxMDA3
MTQzZS4uYzViM2MwYzkxOTNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jDQo+IEBAIC0xMDAsNyArMTAwLDcgQEAgaW50IGFtZGdwdV9kaXNwX3ByaW9yaXR5
ID0gMDsNCj4gIGludCBhbWRncHVfaHdfaTJjID0gMDsNCj4gIGludCBhbWRncHVfcGNpZV9nZW4y
ID0gLTE7DQo+ICBpbnQgYW1kZ3B1X21zaSA9IC0xOw0KPiAtY2hhciBhbWRncHVfbG9ja3VwX3Rp
bWVvdXRbQU1ER1BVX01BWF9USU1FT1VUX1BBUkFNX0xFTlRIXTsNCj4gK3N0YXRpYyBjaGFyIGFt
ZGdwdV9sb2NrdXBfdGltZW91dFtBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEhdOw0KPiAg
aW50IGFtZGdwdV9kcG0gPSAtMTsNCj4gIGludCBhbWRncHVfZndfbG9hZF90eXBlID0gLTE7DQo+
ICBpbnQgYW1kZ3B1X2FzcG0gPSAtMTsNCj4gQEAgLTExNCw3ICsxMTQsNyBAQCBpbnQgYW1kZ3B1
X3ZtX2Jsb2NrX3NpemUgPSAtMTsNCj4gIGludCBhbWRncHVfdm1fZmF1bHRfc3RvcCA9IDA7DQo+
ICBpbnQgYW1kZ3B1X3ZtX2RlYnVnID0gMDsNCj4gIGludCBhbWRncHVfdm1fdXBkYXRlX21vZGUg
PSAtMTsNCj4gLWludCBhbWRncHVfZXhwX2h3X3N1cHBvcnQgPSAwOw0KPiArc3RhdGljIGludCBh
bWRncHVfZXhwX2h3X3N1cHBvcnQ7DQoNClRoaXMgaXMgaW5kZWVkIG9ubHkgdXNlZCBpbiB0aGlz
IGZpbGUgYnV0IGZvciBjb25zaXN0ZW5jeSdzIHNha2UgaXQncw0KcHJvYmFibHkgYmV0dGVyIHRv
IGFsc28gZGVjbGFyZSBpdCBpbiBhbWRncHUuaCByYXRoZXIgdGhhbiBtYWtlIGl0DQpzdGF0aWMg
aGVyZS4NCg0KSGFycnkNCg0KPiAgaW50IGFtZGdwdV9kYyA9IC0xOw0KPiAgaW50IGFtZGdwdV9z
Y2hlZF9qb2JzID0gMzI7DQo+ICBpbnQgYW1kZ3B1X3NjaGVkX2h3X3N1Ym1pc3Npb24gPSAyOw0K
PiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

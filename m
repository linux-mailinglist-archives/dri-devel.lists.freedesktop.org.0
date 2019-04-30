Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7AF8E7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 14:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A870B89121;
	Tue, 30 Apr 2019 12:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770042.outbound.protection.outlook.com [40.107.77.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9739489121
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 12:32:21 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1915.namprd12.prod.outlook.com (10.175.88.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 12:32:19 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1835.018; Tue, 30 Apr
 2019 12:32:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Sahu, Satyajit" <Satyajit.Sahu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] amdgpu: Query uvd handles info
Thread-Topic: [PATCH] amdgpu: Query uvd handles info
Thread-Index: AQHU/0KcnCug65nra0CSUmQZHYvUhaZUiPkAgAADlYCAAAXQgIAACGAAgAAINQA=
Date: Tue, 30 Apr 2019 12:32:18 +0000
Message-ID: <fab5c951-ad3b-7ace-4348-62500b1ed557@amd.com>
References: <20190430104904.23140-1-satyajit.sahu@amd.com>
 <ce0c18ac-0ca5-cbc3-1478-491cc93ddda5@gmail.com>
 <a3cfa926-0a85-373d-1d64-2167ede73412@amd.com>
 <3d4ef984-0f81-f7fd-da28-0a1943252af4@gmail.com>
 <2fb181ae-f546-b984-fca2-fc1ff88fbaaf@amd.com>
In-Reply-To: <2fb181ae-f546-b984-fca2-fc1ff88fbaaf@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR06CA0030.eurprd06.prod.outlook.com
 (2603:10a6:20b:14::43) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9af8e95-4525-4897-38b5-08d6cd67e28e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1915; 
x-ms-traffictypediagnostic: DM5PR12MB1915:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB19150217D76C6CB46C3CCF9D833A0@DM5PR12MB1915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(39860400002)(366004)(396003)(199004)(189003)(36756003)(64756008)(66556008)(186003)(66574012)(68736007)(14444005)(256004)(76176011)(66446008)(6512007)(6306002)(102836004)(6506007)(73956011)(110136005)(93886005)(53546011)(316002)(4326008)(66946007)(66476007)(53936002)(99286004)(65826007)(14454004)(386003)(25786009)(52116002)(72206003)(478600001)(2906002)(97736004)(46003)(966005)(71200400001)(486006)(8676002)(71190400001)(81156014)(81166006)(229853002)(65806001)(6116002)(8936002)(65956001)(31696002)(58126008)(6246003)(6436002)(64126003)(5660300002)(2501003)(2616005)(305945005)(7736002)(11346002)(86362001)(446003)(31686004)(6486002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1915;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v45ZtnGMO5cz/W05tb/Ew+xf9HbZ7hiBuGECrnc2msPAb6/rYlglwWowQH7gK1ypafShgqh5+h06ILAlt9JWKVylTYsxdCO7g1RmYncSN0pTj4Pfz6lvz+T4iFiaOEouj9drBvpRnVKjcpaMXcyaaSEqwBFHBhU+o33D3k8PzGOkznD+DdztNEXopMkmoNmL5gEnU7l0O5aaGUMytdpA6vWpKY6l3TeKrgAkzUdjKfgHE8604vQ92ICMgmbNKAUiOVb3KS+zcehVH03la97OO7Cz1DnT5orsFqAa8MJKFOqQxoVzMEK8BPkLTckIWdueC3jwB1EfdNs6KieHZ0UUq2XOud2csHUUDuz6SD72TU7r3MqMvxyyeUpp2o+Zz8z8K4bwhmJCi/iehDpUdWp5/JUFF7cCf5fsOiAjTmLo7Q4=
Content-ID: <A3FD5C540E2E084B9D264710FDE30A6E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9af8e95-4525-4897-38b5-08d6cd67e28e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 12:32:18.9614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1915
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9WAPLqJeYgO+GZbtJb1FiacekpQ4waogIDuK1ZmcSU=;
 b=nwJrhniGgOdd/2ibWU59NL9Gt2tpVU+u4L23Xj4Kx+idX/NvfHrhI4PghzUllVrVROzCnvOf1CwOgL3Ekv0rB8EJTCfGT03YFZXCN0KVFxKn9GYuSnSrrFINapYDRb3LO5Cp40a6aDzkwPLCPvbelXZkbG9u0G/ob2ySkxaApFc=
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
Cc: "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTQ6MDMgc2NocmllYiBTYWh1LCBTYXR5YWppdDoNCj4gT24gNC8zMC8y
MDE5IDU6MDIgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBbQ0FVVElPTjogRXh0ZXJu
YWwgRW1haWxdDQo+Pg0KPj4gQW0gMzAuMDQuMTkgdW0gMTM6MTIgc2NocmllYiBTYWh1LCBTYXR5
YWppdDoNCj4+PiBPbiA0LzMwLzIwMTkgNDoyOSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToN
Cj4+Pj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPj4+Pg0KPj4+PiBBbSAzMC4wNC4xOSB1
bSAxMjo1MSBzY2hyaWViIFNhaHUsIFNhdHlhaml0Og0KPj4+Pj4gUXVlcnkgdGhlIG1heCB1dmQg
aGFuZGxlcyBhbmQgdXNlZCB1dmQgaGFuZGxlcy4NCj4+Pj4gTkFLLCBwbGVhc2UgdXNlIHRoZSBn
ZW5lcmljIGFtZGdwdV9xdWVyeV9pbmZvKCkgZnVuY3Rpb24gZm9yIHRoaXMuDQo+Pj4+DQo+Pj4+
IFJlZ2FyZHMsDQo+Pj4+IENocmlzdGlhbi4NCj4+PiBDdXJyZW50bHkgYW1kZ3B1X3F1ZXJ5X2lu
Zm8gZG9lcyBub3QgcHJvdmlkZSBhbiBvcHRpb24gdG8gc3BlY2lmeSB0aGUNCj4+PiBod19pcF90
eXBlLiBGb3IgQU1ER1BVX0lORk9fTlVNX0hBTkRMRVMgdGhlIGh3X2lwX3R5cGUgbmVlZHMgdG8g
YmUNCj4+PiBBTURHUFVfSFdfSVBfVVZELCBvdGhlcndpc2UgdGhlIGtlcm5lbCByZXR1cm5zIGVy
cm9yLg0KPj4gT2ssIHRoYXQgbWFrZXMgc2Vuc2UuDQo+Pg0KPj4gQnV0IHBsZWFzZSBzdGlsbCBh
ZGQgYSBnZW5lcmljIHF1ZXJ5IGZ1bmN0aW9uIHdoaWNoIHRha2VzIHF1ZXJ5IGFuZA0KPj4gaHdf
aXBfdHlwZSBpbnN0ZWFkIG9mIGhhcmQgY29kaW5nIHRob3NlIHZhbHVlcy4NCj4gU2hvdWxkIEkg
YWRkIGEgbmV3IHBhcmFtZXRlciBpbiBhbWRncHVfcXVlcnlfaW5mbyBvciBhZGQgYSBuZXcgcXVl
cnlfaW5mbz8NCg0KQWRkIGEgbmV3IG9uZSBhbmQgcGxlYXNlIGRvdWJsZSBjaGVjayBpZiB0aGVy
ZSBpc24ndCBzb21ldGhpbmcgZXhpc3RpbmcgDQp3aGljaCBjYW4gYmUgdXNlZC4NCg0KPj4gQlRX
OiBXaGF0IGRvIHlvdSBuZWVkIHRoaXMgZm9yPyBUaGUgbnVtYmVyIHJldHVybmVkIGlzIHByZXR0
eSB1c2VsZXNzIG9uDQo+PiBuZXdlciBoYXJkd2FyZS4NCj4gT24gc3RvbmV5IGNocm9tZWJvb2sg
d2hlbsKgIHNpbXVsdGFuZW91cyB1c2VkIHV2ZCBoYW5kbGVzIGV4Y2VlZHMgbWF4DQo+IHN1cHBv
cnRlZCB1dmQgaGFuZGxlcywgdGhlcmUgaXMgYSBmYWlsdXJlIHdoaWNoIGlzIG5vdCBoYW5kbGVk
LiBUaGF0c3doeQ0KPiB0aGVyZSBpcyBhIG5lZWQgdG8gY2hlY2sgaXQgYmVmb3JlIGFsbG9jYXRp
b24gc28gdGhhdCB3ZSBjYW4gZmFsbGJhY2sgdG8NCj4gc29mdHdhcmUgZGVjb2RpbmcuDQoNCldl
bGwgdGhhdCBpcyBzdGlsbCByYWN5LCBlLmcuIHR3byBwcm9jZXNzZXMgY2FuIGF0IHRoZSBzYW1l
IHRpbWUgcXVlcnkgDQp0aGF0IHRoZXJlIGlzIG9ubHkgMSBoYW5kbGUgc2xvdCBsZWZ0IGFuZCB0
aGVuIGJvdGggdHJ5IHRvIHVzZSBpdC4NCg0KQmV0dGVyIHdvdWxkIGJlIHRvIGFkZCB0aGUgbWlz
c2luZyBoYW5kbGluZyB0aGF0IHdlIGNhbid0IGNyZWF0ZSBhbiBVVkQgDQpjb250ZXh0IGluIHRo
aXMgY2FzZS4NCg0KQ2hyaXN0aWFuLg0KDQo+PiBSZWdhcmRzLA0KPj4gQ2hyaXN0aWFuLg0KPj4N
Cj4+PiBSZWdhcmRzLA0KPj4+DQo+Pj4gU2F0eWFqaXQNCj4gUmVnYXJkcywNCj4NCj4gU2F0eWFq
aXQNCj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNhdHlhaml0IFNhaHUgPHNhdHlhaml0LnNhaHVA
YW1kLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gIMKgwqAgYW1kZ3B1L2FtZGdwdS5owqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTQgKysrKysrKysrKysrKysNCj4+Pj4+ICDCoMKgIGFtZGdwdS9hbWRncHVf
Z3B1X2luZm8uYyB8IDE1ICsrKysrKysrKysrKysrKw0KPj4+Pj4gIMKgwqAgMiBmaWxlcyBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2FtZGdwdS9h
bWRncHUuaCBiL2FtZGdwdS9hbWRncHUuaA0KPj4+Pj4gaW5kZXggYzQ0YTQ5NWEuLjQwN2I1ZmFl
IDEwMDY0NA0KPj4+Pj4gLS0tIGEvYW1kZ3B1L2FtZGdwdS5oDQo+Pj4+PiArKysgYi9hbWRncHUv
YW1kZ3B1LmgNCj4+Pj4+IEBAIC0xMTc0LDYgKzExNzQsMjAgQEAgaW50IGFtZGdwdV9xdWVyeV9n
cHVfaW5mbyhhbWRncHVfZGV2aWNlX2hhbmRsZQ0KPj4+Pj4gZGV2LA0KPj4+Pj4gIMKgwqAgaW50
IGFtZGdwdV9xdWVyeV9pbmZvKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwgdW5zaWduZWQgaW5m
b19pZCwNCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVu
c2lnbmVkIHNpemUsIHZvaWQgKnZhbHVlKTsNCj4+Pj4+DQo+Pj4+PiArLyoqDQo+Pj4+PiArICog
UXVlcnkgdXZkIGhhbmRsZXMgaW5mby4NCj4+Pj4+ICsgKg0KPj4+Pj4gKyAqDQo+Pj4+PiArICog
XHBhcmFtwqDCoCBkZXbCoMKgwqDCoCAtIFxjIFtpbl0gRGV2aWNlIGhhbmRsZS4gU2VlDQo+Pj4+
PiAjYW1kZ3B1X2RldmljZV9pbml0aWFsaXplKCkNCj4+Pj4+ICsgKiBccGFyYW3CoMKgIHNpemXC
oMKgwqAgLSBcYyBbaW5dIFNpemUgb2YgdGhlIHJldHVybmVkIHZhbHVlLg0KPj4+Pj4gKyAqIFxw
YXJhbcKgwqAgdmFsdWXCoMKgIC0gXGMgW291dF0gUG9pbnRlciB0byB0aGUgcmV0dXJuIHZhbHVl
Lg0KPj4+Pj4gKyAqDQo+Pj4+PiArICogXHJldHVybsKgwqAgMCBvbiBzdWNjZXNzXG4NCj4+Pj4+
ICsgKsKgwqDCoMKgwqDCoMKgwqDCoCA8MCAtIE5lZ2F0aXZlIFBPU0lYIGVycm9yIGNvZGUNCj4+
Pj4+ICsgKg0KPj4+Pj4gKyovDQo+Pj4+PiAraW50IGFtZGdwdV9xdWVyeV91dmRfaGFuZGxlcyhh
bWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIHNpemUsIHZvaWQgKnZhbHVlKTsNCj4+Pj4+ICDC
oMKgIC8qKg0KPj4+Pj4gIMKgwqDCoCAqIFF1ZXJ5IGhhcmR3YXJlIG9yIGRyaXZlciBpbmZvcm1h
dGlvbi4NCj4+Pj4+ICDCoMKgwqAgKg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVf
Z3B1X2luZm8uYyBiL2FtZGdwdS9hbWRncHVfZ3B1X2luZm8uYw0KPj4+Pj4gaW5kZXggNzc3MDg3
ZjIuLjI1M2M0ZGE3IDEwMDY0NA0KPj4+Pj4gLS0tIGEvYW1kZ3B1L2FtZGdwdV9ncHVfaW5mby5j
DQo+Pj4+PiArKysgYi9hbWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMNCj4+Pj4+IEBAIC00NCw2ICs0
NCwyMSBAQCBkcm1fcHVibGljIGludA0KPj4+Pj4gYW1kZ3B1X3F1ZXJ5X2luZm8oYW1kZ3B1X2Rl
dmljZV9oYW5kbGUgZGV2LCB1bnNpZ25lZCBpbmZvX2lkLA0KPj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKHN0cnVj
dCBkcm1fYW1kZ3B1X2luZm8pKTsNCj4+Pj4+ICDCoMKgIH0NCj4+Pj4+DQo+Pj4+PiArZHJtX3B1
YmxpYyBpbnQgYW1kZ3B1X3F1ZXJ5X3V2ZF9oYW5kbGVzKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRl
diwNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgc2l6ZSwgdm9pZCAqdmFs
dWUpDQo+Pj4+PiArew0KPj4+Pj4gK8KgwqDCoMKgIHN0cnVjdCBkcm1fYW1kZ3B1X2luZm8gcmVx
dWVzdDsNCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqDCoCBtZW1zZXQoJnJlcXVlc3QsIDAsIHNpemVv
ZihyZXF1ZXN0KSk7DQo+Pj4+PiArwqDCoMKgwqAgcmVxdWVzdC5yZXR1cm5fcG9pbnRlciA9ICh1
aW50cHRyX3QpdmFsdWU7DQo+Pj4+PiArwqDCoMKgwqAgcmVxdWVzdC5yZXR1cm5fc2l6ZSA9IHNp
emU7DQo+Pj4+PiArwqDCoMKgwqAgcmVxdWVzdC5xdWVyeSA9IEFNREdQVV9JTkZPX05VTV9IQU5E
TEVTOw0KPj4+Pj4gK8KgwqDCoMKgIHJlcXVlc3QucXVlcnlfaHdfaXAudHlwZSA9IEFNREdQVV9I
V19JUF9VVkQ7DQo+Pj4+PiArDQo+Pj4+PiArwqDCoMKgwqAgcmV0dXJuIGRybUNvbW1hbmRXcml0
ZShkZXYtPmZkLCBEUk1fQU1ER1BVX0lORk8sICZyZXF1ZXN0LA0KPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0
IGRybV9hbWRncHVfaW5mbykpOw0KPj4+Pj4gK30NCj4+Pj4+ICsNCj4+Pj4+ICDCoMKgIGRybV9w
dWJsaWMgaW50IGFtZGdwdV9xdWVyeV9jcnRjX2Zyb21faWQoYW1kZ3B1X2RldmljZV9oYW5kbGUg
ZGV2LA0KPj4+Pj4gdW5zaWduZWQgaWQsDQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlu
dDMyX3QgKnJlc3VsdCkNCj4+Pj4+ICDCoMKgIHsNCj4+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

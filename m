Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9981E436AF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC489A60;
	Thu, 13 Jun 2019 13:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720050.outbound.protection.outlook.com [40.107.72.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818CE89A59;
 Thu, 13 Jun 2019 13:35:23 +0000 (UTC)
Received: from DM6PR12MB3561.namprd12.prod.outlook.com (20.178.199.24) by
 DM6PR12MB3691.namprd12.prod.outlook.com (10.255.76.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 13:35:22 +0000
Received: from DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6964:1dd9:bddd:b451]) by DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6964:1dd9:bddd:b451%7]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 13:35:22 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: Re: [PATCH] amdgpu_dm: no need to check return value of
 debugfs_create functions
Thread-Topic: [PATCH] amdgpu_dm: no need to check return value of
 debugfs_create functions
Thread-Index: AQHVIeq/R7uLJSHF4EyU9F8bOYwN3qaZldmA
Date: Thu, 13 Jun 2019 13:35:21 +0000
Message-ID: <5d1dd6bf-32c1-dc65-bf49-13f1cbba4c57@amd.com>
References: <20190613132012.GC3432@kroah.com>
In-Reply-To: <20190613132012.GC3432@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To DM6PR12MB3561.namprd12.prod.outlook.com
 (2603:10b6:5:3c::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56e90f01-dd8a-4eaf-bc1a-08d6f003fb89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3691; 
x-ms-traffictypediagnostic: DM6PR12MB3691:
x-microsoft-antispam-prvs: <DM6PR12MB36910EE771C830B9B83C47D4ECEF0@DM6PR12MB3691.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(366004)(136003)(39860400002)(189003)(199004)(14444005)(446003)(11346002)(476003)(478600001)(2616005)(14454004)(486006)(71190400001)(6512007)(2906002)(66946007)(73956011)(86362001)(64756008)(66446008)(31696002)(66476007)(6246003)(102836004)(3846002)(186003)(68736007)(26005)(53936002)(229853002)(71200400001)(72206003)(6486002)(6116002)(66556008)(256004)(6436002)(6636002)(386003)(76176011)(8936002)(6506007)(8676002)(99286004)(7736002)(53546011)(4326008)(66574012)(316002)(31686004)(110136005)(54906003)(305945005)(25786009)(81166006)(81156014)(52116002)(5660300002)(36756003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3691;
 H:DM6PR12MB3561.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 08qxhtB+pGuTqYrZFMQ77weSuVn8SHZCPcIfgrKApgqpGJF5SYijzXBhTIOd25zAPwW5lELrwF8r/8AZhaRNTo/OC9rR9YWb8HJF8AO9ePFpr2Mxu5tgL7BfglIhcBB1FlAWhfJbBo3KqtUcQke/AD/f/SGdfwTDgGnObFOsqG52trXGJ3/zm7fZBuMjqV5E4AaoQtJ5UYJnS5k2MCH5d7E3u0mWPlXAr7yFUxt0aBC77kH1H6lSpfjmKYcLlpu70SveNIyilBlGmo0lJaoGA56IBzXGP2w2QE/5C1DrZv3JMnUiI8Y2GeMx6yLhQ+0RyHmiQOn5R3xfw5WXBzr8i4KsjCfdJY3eto4U4K4AEKMPqJzte84KE3AwTrXESO2REMXJ/l/saOlXQ2zMkmUpXXvobI3U6DY1OfPhhtgwwEo=
Content-ID: <422BE4389832424587EF8FE224D3F051@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e90f01-dd8a-4eaf-bc1a-08d6f003fb89
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 13:35:22.0776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/2kpWhcrwKGJ6jtop8iLL/+HTX4GoquDfG1voA571Y=;
 b=Hs+mHw16KxPWCzWEEkSz85sNoSGzeijoYnfqxGpScKJjeTy2AuB94hUAppgv1fU9jSqAsmAy0ytdNAQHltzGYMNV0WPXLx3cpHszFzUfHV7AnJfAKSaqf0dVLMbnkah8lixRjUfHyWvT1DVoSNQRqGdY0QU8lVD2RscgmCFFxHU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Francis,
 David" <David.Francis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Ma, Hanghong" <Hanghong.Ma@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Koo,
 Anthony" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMy8xOSA5OjIwIEFNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+IFdoZW4gY2Fs
bGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRo
ZQ0KPiByZXR1cm4gdmFsdWUuICBUaGUgZnVuY3Rpb24gY2FuIHdvcmsgb3Igbm90LCBidXQgdGhl
IGNvZGUgbG9naWMgc2hvdWxkDQo+IG5ldmVyIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgYmFzZWQg
b24gdGhpcy4NCj4gDQo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNv
bT4NCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IENjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8
RGF2aWQxLlpob3VAYW1kLmNvbT4NCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IE5pY2hvbGFz
IEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCj4gQ2M6IERhdmlkIEZy
YW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4NCj4gQ2M6IE1hcmlvIEtsZWluZXIgPG1hcmlv
LmtsZWluZXIuZGVAZ21haWwuY29tPg0KPiBDYzogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnBy
ZWV0Lkxha2hhQGFtZC5jb20+DQo+IENjOiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNv
bT4NCj4gQ2M6IGhlcnNlbiB3dSA8aGVyc2VueHMud3VAYW1kLmNvbT4NCj4gQ2M6ICJMZW8gKEhh
bmdob25nKSBNYSIgPGhhbmdob25nLm1hQGFtZC5jb20+DQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBT
aWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPg0KDQpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPg0KDQpJJ2xsIGtlZXAgdGhpcyBpbiBtaW5kIHdoZW4gd2UncmUgYWRkaW5n
IG1vcmUgb2YgdGhlc2UgZW50cmllcyAtIHRoZSANCmZ1bmN0aW9ucyBkbyBzZWVtIHRvIGNoZWNr
IGludGVybmFsbHksIHNvIHRoaXMgbWFrZXMgdGhlIGNvZGUgYSBsaXR0bGUgDQpzaW1wbGVyLg0K
DQpUaGFua3MhDQoNCk5pY2hvbGFzIEthemxhdXNrYXMNCg0KPiAtLS0NCj4gICAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAgNiArLS0tDQo+ICAgLi4uL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jIHwgMzUgKysrKysrLS0tLS0t
LS0tLS0tLQ0KPiAgIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMu
aCB8ICAyICstDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzMSBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYw0KPiBpbmRleCBiY2IxYTkzYzBiNGMuLmNkMTBiMDgyNTA4NyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jDQo+IEBAIC00ODI1LDExICs0ODI1LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1fY29u
bmVjdG9yX2luaXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLA0KPiAgIA0KPiAg
IAlkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKCZhY29ubmVjdG9yLT5iYXNlKTsNCj4gICAjaWYgZGVm
aW5lZChDT05GSUdfREVCVUdfRlMpDQo+IC0JcmVzID0gY29ubmVjdG9yX2RlYnVnZnNfaW5pdChh
Y29ubmVjdG9yKTsNCj4gLQlpZiAocmVzKSB7DQo+IC0JCURSTV9FUlJPUigiRmFpbGVkIHRvIGNy
ZWF0ZSBkZWJ1Z2ZzIGZvciBjb25uZWN0b3IiKTsNCj4gLQkJZ290byBvdXRfZnJlZTsNCj4gLQl9
DQo+ICsJY29ubmVjdG9yX2RlYnVnZnNfaW5pdChhY29ubmVjdG9yKTsNCj4gICAJYWNvbm5lY3Rv
ci0+ZGVidWdmc19kcGNkX2FkZHJlc3MgPSAwOw0KPiAgIAlhY29ubmVjdG9yLT5kZWJ1Z2ZzX2Rw
Y2Rfc2l6ZSA9IDA7DQo+ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMNCj4gaW5kZXggMWQ1
ZmM1YWQzYmVlLi4yYjllYTFiNjdjOWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMNCj4gQEAg
LTg3MywyNSArODczLDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiAgIAkJeyJhdXhfZHBj
ZF9kYXRhIiwgJmRwX2RwY2RfZGF0YV9kZWJ1Z2ZzX2ZvcHN9DQo+ICAgfTsNCj4gICANCj4gLWlu
dCBjb25uZWN0b3JfZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICpjb25u
ZWN0b3IpDQo+ICt2b2lkIGNvbm5lY3Rvcl9kZWJ1Z2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kbV9j
b25uZWN0b3IgKmNvbm5lY3RvcikNCj4gICB7DQo+ICAgCWludCBpOw0KPiAtCXN0cnVjdCBkZW50
cnkgKmVudCwgKmRpciA9IGNvbm5lY3Rvci0+YmFzZS5kZWJ1Z2ZzX2VudHJ5Ow0KPiArCXN0cnVj
dCBkZW50cnkgKmRpciA9IGNvbm5lY3Rvci0+YmFzZS5kZWJ1Z2ZzX2VudHJ5Ow0KPiAgIA0KPiAg
IAlpZiAoY29ubmVjdG9yLT5iYXNlLmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RP
Ul9EaXNwbGF5UG9ydCB8fA0KPiAgIAkgICAgY29ubmVjdG9yLT5iYXNlLmNvbm5lY3Rvcl90eXBl
ID09IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFApIHsNCj4gICAJCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKGRwX2RlYnVnZnNfZW50cmllcyk7IGkrKykgew0KPiAtCQkJZW50ID0gZGVidWdmc19j
cmVhdGVfZmlsZShkcF9kZWJ1Z2ZzX2VudHJpZXNbaV0ubmFtZSwNCj4gLQkJCQkJCSAgMDY0NCwN
Cj4gLQkJCQkJCSAgZGlyLA0KPiAtCQkJCQkJICBjb25uZWN0b3IsDQo+IC0JCQkJCQkgIGRwX2Rl
YnVnZnNfZW50cmllc1tpXS5mb3BzKTsNCj4gLQkJCWlmIChJU19FUlIoZW50KSkNCj4gLQkJCQly
ZXR1cm4gUFRSX0VSUihlbnQpOw0KPiArCQkJZGVidWdmc19jcmVhdGVfZmlsZShkcF9kZWJ1Z2Zz
X2VudHJpZXNbaV0ubmFtZSwNCj4gKwkJCQkJICAgIDA2NDQsIGRpciwgY29ubmVjdG9yLA0KPiAr
CQkJCQkgICAgZHBfZGVidWdmc19lbnRyaWVzW2ldLmZvcHMpOw0KPiAgIAkJfQ0KPiAgIAl9DQo+
IC0NCj4gLQlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICAgLyoNCj4gQEAgLTEwMzQsNyArMTAy
OCw3IEBAIGludCBkdG5fZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiAgIAl9Ow0KPiAgIA0KPiAgIAlzdHJ1Y3QgZHJtX21pbm9yICptaW5vciA9IGFkZXYtPmRkZXYt
PnByaW1hcnk7DQo+IC0Jc3RydWN0IGRlbnRyeSAqZW50LCAqcm9vdCA9IG1pbm9yLT5kZWJ1Z2Zz
X3Jvb3Q7DQo+ICsJc3RydWN0IGRlbnRyeSAqcm9vdCA9IG1pbm9yLT5kZWJ1Z2ZzX3Jvb3Q7DQo+
ICAgCWludCByZXQ7DQo+ICAgDQo+ICAgCXJldCA9IGFtZGdwdV9kZWJ1Z2ZzX2FkZF9maWxlcyhh
ZGV2LCBhbWRncHVfZG1fZGVidWdmc19saXN0LA0KPiBAQCAtMTA0MiwyMCArMTAzNiwxMSBAQCBp
bnQgZHRuX2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJaWYg
KHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgDQo+IC0JZW50ID0gZGVidWdmc19jcmVhdGVf
ZmlsZSgNCj4gLQkJImFtZGdwdV9kbV9kdG5fbG9nIiwNCj4gLQkJMDY0NCwNCj4gLQkJcm9vdCwN
Cj4gLQkJYWRldiwNCj4gLQkJJmR0bl9sb2dfZm9wcyk7DQo+IC0NCj4gLQlpZiAoSVNfRVJSKGVu
dCkpDQo+IC0JCXJldHVybiBQVFJfRVJSKGVudCk7DQo+ICsJZGVidWdmc19jcmVhdGVfZmlsZSgi
YW1kZ3B1X2RtX2R0bl9sb2ciLCAwNjQ0LCByb290LCBhZGV2LA0KPiArCQkJICAgICZkdG5fbG9n
X2ZvcHMpOw0KPiAgIA0KPiAtCWVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGVfdW5zYWZlKCJhbWRn
cHVfZG1fdmlzdWFsX2NvbmZpcm0iLCAwNjQ0LCByb290LA0KPiAtCQkJCQkgYWRldiwgJnZpc3Vh
bF9jb25maXJtX2ZvcHMpOw0KPiAtCWlmIChJU19FUlIoZW50KSkNCj4gLQkJcmV0dXJuIFBUUl9F
UlIoZW50KTsNCj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlX3Vuc2FmZSgiYW1kZ3B1X2RtX3Zpc3Vh
bF9jb25maXJtIiwgMDY0NCwgcm9vdCwgYWRldiwNCj4gKwkJCQkgICAmdmlzdWFsX2NvbmZpcm1f
Zm9wcyk7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuaA0K
PiBpbmRleCBiZGVmMTU4N2IwYTAuLjVlNWIyYjJhZmEzMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVn
ZnMuaA0KPiBAQCAtMjksNyArMjksNyBAQA0KPiAgICNpbmNsdWRlICJhbWRncHUuaCINCj4gICAj
aW5jbHVkZSAiYW1kZ3B1X2RtLmgiDQo+ICAgDQo+IC1pbnQgY29ubmVjdG9yX2RlYnVnZnNfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsNCj4gK3ZvaWQgY29ubmVj
dG9yX2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsN
Cj4gICBpbnQgZHRuX2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+
ICAgDQo+ICAgI2VuZGlmDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

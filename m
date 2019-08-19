Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6494D33
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 20:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091FD6E263;
	Mon, 19 Aug 2019 18:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFA66E263;
 Mon, 19 Aug 2019 18:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr68Cnja0gXaCyri1NaFurlTUF8RlKNmv3vsHvIafJBZahYVeNRJjVPFbYj0TqJNUC3+K5AjiUBhXNLcPJNlfTtgcnk6uXDxs0riPxOiOVlnEKJHspHse/5x0srolSd1OorFAioIt8MKdiF7Yq4h2U7fpx02wZtLOZT/tj5BcKseaVPXtfDOwO+wJI6RguWTh7spb8DX2KF0dRCmkFUkx0qEkyH/t3YNw91WrDEntqykNEAaIXBE/P8N5/N7t2AVsx3EZYl2TIo59CygBbyHrg06WKcYeYFAfzFIhgvkBv/1kKMxxhuD4Fg9az34QOR1zc5yV7tMtWmy167KJKBOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BczVs00bqhroxXs+qSerRfrIoeEZV6Rh3U2Q66mPMos=;
 b=LftwFfvlmQSWxzBcbS58qImWJmY99vfiwmwWCtkbtc3YnagPIKQWB8XraozgMzKrcoMmKxw4yIH4ig+04IGql9xFGyAyND/EaHLZNDDkq9VF2Xl8PI8K3igchpcHCIQiylhs2WI6d05Yg4OvqKbUin32m2wSdeGO4ir52nygAwnEty1AbAgAvq7aQLGg1driu2JtCz/ovU/+n9hTsj4BpxI0pMLnPlUuNJyW8OFG2zhy0Ud8Y98b5VeChV2TSs4lZqNpAI3PDIIAd/rwCxjmswKTGW+BoyB7XAHVEJg+qV+nRwn+0BU/nd8EAK4i2FoDxgz5jcXu7gcRMXke03WHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3662.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB3182.namprd12.prod.outlook.com (20.179.83.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 18:46:35 +0000
Received: from MN2PR12MB3662.namprd12.prod.outlook.com
 ([fe80::a4c7:e1f3:47df:4294]) by MN2PR12MB3662.namprd12.prod.outlook.com
 ([fe80::a4c7:e1f3:47df:4294%6]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 18:46:35 +0000
From: Mikita Lipski <mlipski@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 05/14] drm/amd/display: Enable SST DSC in DM
Thread-Topic: [PATCH 05/14] drm/amd/display: Enable SST DSC in DM
Thread-Index: AQHVVqXfWsZGWSG1/E+kRGooj2VtTqcCz4uA
Date: Mon, 19 Aug 2019 18:46:34 +0000
Message-ID: <d6015e13-3239-9a30-8f70-b2b83960823a@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
 <20190819155038.1771-6-David.Francis@amd.com>
In-Reply-To: <20190819155038.1771-6-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::21) To MN2PR12MB3662.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
x-originating-ip: [165.204.55.250]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58f56482-f34f-440a-0b84-08d724d58f66
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3182; 
x-ms-traffictypediagnostic: MN2PR12MB3182:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3182D3E569472C60FA00F8C5E4A80@MN2PR12MB3182.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:156;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(6512007)(71200400001)(71190400001)(2906002)(229853002)(316002)(26005)(25786009)(478600001)(2501003)(81156014)(53936002)(476003)(446003)(2201001)(31696002)(2616005)(11346002)(186003)(66066001)(256004)(31686004)(14444005)(486006)(7736002)(305945005)(14454004)(8676002)(81166006)(76176011)(8936002)(6506007)(386003)(110136005)(66476007)(99286004)(66946007)(53546011)(6116002)(5660300002)(102836004)(4326008)(3846002)(450100002)(6486002)(66556008)(6436002)(6246003)(52116002)(66446008)(64756008)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3182;
 H:MN2PR12MB3662.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m4GVUVchAioobya3O+yw57DFYy9TQG2jWIEBAQjTEcWEJQD69LsmMMZg2moxoHBBmpysodA82elX104SJ5G5mZ6HwX+z9u1M0y6EQcS04ZbT4VLD34Yhr4ack7cVzhBNiLtgQD19dZS/whM5EsYCJpPlvxxIM9deEiDJRXLfjVNN8c026Z21rsz6F8bNhDnjgLHVRZ5hLGxjw6yky6ZE9i8BNA8hCsYhWWivgI4VV3vKM2Ffim1w5uVJB/A+OQwIS20VSOY9n5dmfGHuDvdhxoDN79mJjofMn8RegZ95h0voCsvzi/hZezZFlIDQjjvemiVPmK0y7DnHTGe+h2pvn8tz4Itpjhs9+egTiyR9bXgXj47i9N6MdSWxiviocVj5X4MaNO4AgfuXPfJDpAOd64KG82HOq7ju+4EQYNX+bYg=
Content-ID: <429F70DC7F29ED4892EB6F5BF19BC7C7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f56482-f34f-440a-0b84-08d724d58f66
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 18:46:35.1286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ug5nz0JVPPFlH7AyeiV8bCCbz5occjTu+LtEoVJ8Ux3ueWy3pE2DUM3QyQbPyG+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3182
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BczVs00bqhroxXs+qSerRfrIoeEZV6Rh3U2Q66mPMos=;
 b=Lf/vNkS0WwzIWqAca0YdJNVtq8uUSf3FdtOI0I0KYeb+prTz3EaYdqQ277fvfMf7W2ekQtg++pn1WDXTgXfXcp4q8VybjSUzcnp+paJ5EiVQKHbjs4k4YOO1tz8rceSjl3h9L4ALeLvbBRbPTu6/gHj3n9PWRf7hBL80jFuu2LA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
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
Cc: "Lipski, Mikita" <Mikita.Lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGVzdGVkLWJ5OiBNaWtpdGEgTGlwc2tpIDxNaWtpdGEuTGlwc2tpQGFtZC5jb20+DQoNCk1pa2l0
YSBMaXBza2kNCg0KT24gMjAxOS0wOC0xOSAxMTo1MCBhLm0uLCBEYXZpZCBGcmFuY2lzIHdyb3Rl
Og0KPiBJbiBjcmVhdGVfc3RyZWFtX2Zvcl9zaW5rLCBjaGVjayBmb3IgU1NUIERQIGNvbm5lY3Rv
cnMNCj4gDQo+IFBhcnNlIERTQyBjYXBzIHRvIERDIGZvcm1hdCwgdGhlbiwgaWYgRFNDIGlzIHN1
cHBvcnRlZCwNCj4gY29tcHV0ZSB0aGUgY29uZmlnDQo+IA0KPiBEU0MgaGFyZHdhcmUgd2lsbCBi
ZSBwcm9ncmFtbWVkIGJ5IGRjX2NvbW1pdF9zdGF0ZQ0KPiANCj4gQ2M6IE1pa2l0YSBMaXBza2kg
PE1pa2l0YS5MaXBza2lAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8
RGF2aWQuRnJhbmNpc0BhbWQuY29tPg0KPiAtLS0NCj4gICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzMiArKysrKysrKysrKystLS0tLS0tDQo+ICAgLi4u
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgIDQgKystDQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
Yw0KPiBpbmRleCA5MTFmZTc4YjQ3YzEuLjg0MjQ5MDU3ZTE4MSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IEBAIC0z
NTc2LDYgKzM1NzYsMTAgQEAgY3JlYXRlX3N0cmVhbV9mb3Jfc2luayhzdHJ1Y3QgYW1kZ3B1X2Rt
X2Nvbm5lY3RvciAqYWNvbm5lY3RvciwNCj4gICAJYm9vbCBzY2FsZSA9IGRtX3N0YXRlID8gKGRt
X3N0YXRlLT5zY2FsaW5nICE9IFJNWF9PRkYpIDogZmFsc2U7DQo+ICAgCWludCBtb2RlX3JlZnJl
c2g7DQo+ICAgCWludCBwcmVmZXJyZWRfcmVmcmVzaCA9IDA7DQo+ICsjaWZkZWYgQ09ORklHX0RS
TV9BTURfRENfRFNDX1NVUFBPUlQNCj4gKwlzdHJ1Y3QgZHNjX2RlY19kcGNkX2NhcHMgZHNjX2Nh
cHM7DQo+ICsJdWludDMyX3QgbGlua19iYW5kd2lkdGhfa2JwczsNCj4gKyNlbmRpZg0KPiAgIA0K
PiAgIAlzdHJ1Y3QgZGNfc2luayAqc2luayA9IE5VTEw7DQo+ICAgCWlmIChhY29ubmVjdG9yID09
IE5VTEwpIHsNCj4gQEAgLTM2NDgsMTcgKzM2NTIsMjMgQEAgY3JlYXRlX3N0cmVhbV9mb3Jfc2lu
ayhzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciwNCj4gICAJCQkmbW9kZSwg
JmFjb25uZWN0b3ItPmJhc2UsIGNvbl9zdGF0ZSwgb2xkX3N0cmVhbSk7DQo+ICAgDQo+ICAgI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+IC0JLyogc3RyZWFtLT50aW1pbmcu
ZmxhZ3MuRFNDID0gMDsgKi8NCj4gLSAgICAgICAgLyogICovDQo+IC0JLyogaWYgKGFjb25uZWN0
b3ItPmRjX2xpbmsgJiYgKi8NCj4gLQkvKiAJCWFjb25uZWN0b3ItPmRjX2xpbmstPmNvbm5lY3Rv
cl9zaWduYWwgPT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUICM8eyh8JiYgKi8NCj4gLQkvKiAJ
CWFjb25uZWN0b3ItPmRjX2xpbmstPmRwY2RfY2Fwcy5kc2NfY2Fwcy5kc2NfYmFzaWNfY2Fwcy5p
c19kc2Nfc3VwcG9ydGVkfCl9PiMpICovDQo+IC0JLyogCWlmIChkY19kc2NfY29tcHV0ZV9jb25m
aWcoYWNvbm5lY3Rvci0+ZGNfbGluay0+Y3R4LT5kYywgKi8NCj4gLQkvKiAJCQkmYWNvbm5lY3Rv
ci0+ZGNfbGluay0+ZHBjZF9jYXBzLmRzY19jYXBzLCAqLw0KPiAtCS8qIAkJCWRjX2xpbmtfYmFu
ZHdpZHRoX2ticHMoYWNvbm5lY3Rvci0+ZGNfbGluaywgZGNfbGlua19nZXRfbGlua19jYXAoYWNv
bm5lY3Rvci0+ZGNfbGluaykpLCAqLw0KPiAtCS8qIAkJCSZzdHJlYW0tPnRpbWluZywgKi8NCj4g
LQkvKiAJCQkmc3RyZWFtLT50aW1pbmcuZHNjX2NmZykpICovDQo+IC0JLyogCQlzdHJlYW0tPnRp
bWluZy5mbGFncy5EU0MgPSAxOyAqLw0KPiArCXN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQyA9IDA7
DQo+ICsNCj4gKwlpZiAoYWNvbm5lY3Rvci0+ZGNfbGluayAmJiBzaW5rLT5zaW5rX3NpZ25hbCA9
PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQpIHsNCj4gKwkJZGNfZHNjX3BhcnNlX2RzY19kcGNk
KGFjb25uZWN0b3ItPmRjX2xpbmstPmRwY2RfY2Fwcy5kc2NfY2Fwcy5kc2NfYmFzaWNfY2Fwcy5y
YXcsDQo+ICsJCQkJICAgICAgYWNvbm5lY3Rvci0+ZGNfbGluay0+ZHBjZF9jYXBzLmRzY19jYXBz
LmRzY19leHRfY2Fwcy5yYXcsDQo+ICsJCQkJICAgICAgJmRzY19jYXBzKTsNCj4gKwkJbGlua19i
YW5kd2lkdGhfa2JwcyA9IGRjX2xpbmtfYmFuZHdpZHRoX2ticHMoYWNvbm5lY3Rvci0+ZGNfbGlu
aywNCj4gKwkJCQkJCQkgICAgIGRjX2xpbmtfZ2V0X2xpbmtfY2FwKGFjb25uZWN0b3ItPmRjX2xp
bmspKTsNCj4gKw0KPiArCQlpZiAoZHNjX2NhcHMuaXNfZHNjX3N1cHBvcnRlZCkNCj4gKwkJCWlm
IChkY19kc2NfY29tcHV0ZV9jb25maWcoYWNvbm5lY3Rvci0+ZGNfbGluay0+Y3R4LT5kYywNCj4g
KwkJCQkJCSAgJmRzY19jYXBzLA0KPiArCQkJCQkJICBsaW5rX2JhbmR3aWR0aF9rYnBzLA0KPiAr
CQkJCQkJICAmc3RyZWFtLT50aW1pbmcsDQo+ICsJCQkJCQkgICZzdHJlYW0tPnRpbWluZy5kc2Nf
Y2ZnKSkNCj4gKwkJCQlzdHJlYW0tPnRpbWluZy5mbGFncy5EU0MgPSAxOw0KPiArCX0NCj4gICAj
ZW5kaWYNCj4gICANCj4gICAJdXBkYXRlX3N0cmVhbV9zY2FsaW5nX3NldHRpbmdzKCZtb2RlLCBk
bV9zdGF0ZSwgc3RyZWFtKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYw0KPiBpbmRleCA3Y2YwNTczYWIy
NWYuLjVmMmMzMTViMThiYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYw0KPiBAQCAtNTQ5LDcg
KzU0OSw5IEBAIGJvb2wgZG1faGVscGVyc19kcF93cml0ZV9kc2NfZW5hYmxlKA0KPiAgIAkJYm9v
bCBlbmFibGUNCj4gICApDQo+ICAgew0KPiAtCXJldHVybiBmYWxzZTsNCj4gKwl1aW50OF90IGVu
YWJsZV9kc2MgPSBlbmFibGUgPyAxIDogMDsNCj4gKw0KPiArCXJldHVybiBkbV9oZWxwZXJzX2Rw
X3dyaXRlX2RwY2QoY3R4LCBzdHJlYW0tPnNpbmstPmxpbmssIERQX0RTQ19FTkFCTEUsICZlbmFi
bGVfZHNjLCAxKTsNCj4gICB9DQo+ICAgI2VuZGlmDQo+ICAgDQo+IA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

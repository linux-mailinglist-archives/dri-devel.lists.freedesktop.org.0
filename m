Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F7F8B2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 14:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF495891D2;
	Tue, 30 Apr 2019 12:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730061.outbound.protection.outlook.com [40.107.73.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E29891D2;
 Tue, 30 Apr 2019 12:22:00 +0000 (UTC)
Received: from DM6PR12MB3561.namprd12.prod.outlook.com (20.178.199.24) by
 DM6PR12MB3273.namprd12.prod.outlook.com (20.179.106.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Tue, 30 Apr 2019 12:21:59 +0000
Received: from DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::7d79:3424:dc67:24ec]) by DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::7d79:3424:dc67:24ec%3]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 12:21:59 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Mario Kleiner
 <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Allow faking displays as VRR capable.
Thread-Topic: [PATCH] drm/amd/display: Allow faking displays as VRR capable.
Thread-Index: AQHU/yehe/0NO22DJESoyvKr2m9dBKZUUr6AgABNjYA=
Date: Tue, 30 Apr 2019 12:21:58 +0000
Message-ID: <64cb858c-f97d-67e6-e477-8b3f8e16fda6@amd.com>
References: <20190430073724.505-1-mario.kleiner.de@gmail.com>
 <cc0516a8-36ea-55f6-96f1-558df96d5493@daenzer.net>
In-Reply-To: <cc0516a8-36ea-55f6-96f1-558df96d5493@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To DM6PR12MB3561.namprd12.prod.outlook.com
 (2603:10b6:5:3c::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63b6e6ff-775b-4d82-89fc-08d6cd6670f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3273; 
x-ms-traffictypediagnostic: DM6PR12MB3273:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3273CD6D5C702A882B0E40F9EC3A0@DM6PR12MB3273.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(366004)(189003)(199004)(6116002)(68736007)(8676002)(71190400001)(81166006)(81156014)(7736002)(71200400001)(36756003)(305945005)(66574012)(2906002)(3846002)(478600001)(6306002)(6436002)(73956011)(66446008)(14454004)(66946007)(6486002)(31686004)(8936002)(5660300002)(66556008)(64756008)(229853002)(66476007)(97736004)(53546011)(72206003)(6512007)(186003)(486006)(26005)(386003)(102836004)(476003)(2616005)(66066001)(31696002)(86362001)(256004)(446003)(110136005)(14444005)(99286004)(52116002)(25786009)(54906003)(316002)(6506007)(6246003)(966005)(76176011)(53936002)(11346002)(4326008)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3273;
 H:DM6PR12MB3561.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kb9EAE7ERm3/3OMmlucVcCFnYYrO3CixVZ+AZdNmNLz4wUGZ+WRuzcKMEX7b0rUSXxOiXKx/2u55O2bm4Az9up2We3IqnD1VXqSKUCw2Ng2hiOatFjjl6PZqguOBSDTz2qvTUI56+QpvbQT7McNmV7WCHTxvexptfZJIvugHpjOrB9UXntpg2mCUmJc46o2XMTiKXKokVWPlwtVK1ntwvPtBaM42R8pwqhtjChi9KEWlA7trtRJXWeOkz3r4fGUtALbnwv0DO9kZr9KdMfalz7G5lCpImvZTtmrKqsdgm/EzxOGKkIxq+0WsHjOroIOlS3XgQE6JvwqhIRr1UvTEdGwp6CIGI6CUAxh+cQEHb03tRM5WZwebiezJ4FiZsXHhQA9T5mHJRUsALb6+f7+yfvNEQDcWyuOsCf3jo+yW1Fw=
Content-ID: <D07E3CD2B6139341B6B74AD6978046CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b6e6ff-775b-4d82-89fc-08d6cd6670f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 12:21:58.9186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFKles8jHdBMLCzwuYl6eoOvtNZLfXB/cuXViBtIkQQ=;
 b=k3mFfmqNpNkjcSZecYO+yI807Qs+Wwuh8ZyatOx7l1/rVVMkplnWWTT2omX+Xm9mf8SPc84Huc0WjOkoyjMqvC87zdzNumCCmoK61R0zqi3WyfXD05S2S9rfskN19Zj1yklHOCMlpq4I/TpJQMxPSub6OyQOMXpQhXWeK9uquz8=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC8zMC8xOSAzOjQ0IEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPiANCj4gT24gMjAxOS0wNC0zMCA5OjM3IGEubS4sIE1hcmlvIEtsZWlu
ZXIgd3JvdGU6DQo+PiBBbGxvdyB0byBkZXRlY3QgYW55IGNvbm5lY3RlZCBkaXNwbGF5IHRvIGJl
IG1hcmtlZCBhcw0KPj4gVlJSIGNhcGFibGUuIFRoaXMgaXMgdXNlZnVsIGZvciB0ZXN0aW5nIHRo
ZSBiYXNpY3Mgb2YNCj4+IFZSUiBtb2RlLCBlLmcuLCBzY2hlZHVsaW5nIGFuZCB0aW1lc3RhbXBp
bmcsIEJUUiwgYW5kDQo+PiB0cmFuc2l0aW9uIGxvZ2ljLCBvbiBub24tVlJSIGNhcGFibGUgZGlz
cGxheXMsIGUuZy4sDQo+PiB0byBwZXJmb3JtIElHVCB0ZXN0LXN1aXQga21zX3ZyciB0ZXN0IHJ1
bnMuDQo+Pg0KPj4gVGhpcyBmYWtlIFZSUiBkaXNwbGF5IG1vZGUgaXMgZW5hYmxlZCBieSBzZXR0
aW5nIHRoZQ0KPj4gb3B0aW9uYWwgbW9kdWxlIHBhcmFtZXRlciBhbWRncHUuZmFrZXZycmRpc3Bs
YXk9MS4NCj4+DQo+PiBJdCB3aWxsIHRyeSB0byB1c2UgVlJSIHJhbmdlIGluZm8gcGFyc2VkIGZy
b20gRURJRCBvbg0KPj4gRGlzcGxheVBvcnQgZGlzcGxheXMgd2hpY2ggaGF2ZSBhIGNvbXBhdGli
bGUgRURJRCwNCj4+IGJ1dCBub3QgY29tcGF0aWJsZSBEUENEIGNhcHMgZm9yIEFkYXB0aXZlIFN5
bmMuIEUuZy4sDQo+PiBOVmlkaWEgRy1TeW5jIGNvbXBhdGlibGUgZGlzcGxheXMgZXhwb3NlIGEg
cHJvcGVyIEVESUQsDQo+PiBidXQgbm90IHByb3BlciBEUENEIGNhcHMuDQo+Pg0KPj4gSXQgd2ls
bCB1c2UgYSBoYXJkLWNvZGVkIFZSUiByYW5nZSBvZiAzMCBIeiAtIDE0NCBIeiBvbg0KPj4gb3Ro
ZXIgZGlzcGxheXMgd2l0aG91dCBzdWl0YWJsZSBFRElELCBlLmcuLCBzdGFuZGFyZA0KPj4gRGlz
cGxheVBvcnQsIEhETUksIERWSSBtb25pdG9ycy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJp
byBLbGVpbmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4NCj4+DQo+PiBbLi4uXQ0KPj4N
Cj4+ICAgc3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvID0gew0KPj4gICAgICAgIC5t
dXRleCA9IF9fTVVURVhfSU5JVElBTElaRVIobWdwdV9pbmZvLm11dGV4KSwNCj4+IEBAIC02NjUs
NiArNjY2LDE2IEBAIE1PRFVMRV9QQVJNX0RFU0MoaGFsdF9pZl9od3NfaGFuZywgIkhhbHQgaWYg
SFdTIGhhbmcgaXMgZGV0ZWN0ZWQgKDAgPSBvZmYgKGRlZmF1DQo+PiAgIE1PRFVMRV9QQVJNX0RF
U0MoZGNmZWF0dXJlbWFzaywgImFsbCBzdGFibGUgREMgZmVhdHVyZXMgZW5hYmxlZCAoZGVmYXVs
dCkpIik7DQo+PiAgIG1vZHVsZV9wYXJhbV9uYW1lZChkY2ZlYXR1cmVtYXNrLCBhbWRncHVfZGNf
ZmVhdHVyZV9tYXNrLCB1aW50LCAwNDQ0KTsNCj4+DQo+PiArLyoqDQo+PiArICogRE9DOiBmYWtl
dnJyZGlzcGxheSAoaW50KQ0KPj4gKyAqIE92ZXJyaWRlIGRldGVjdGlvbiBvZiBWUlIgZGlzcGxh
eXMgdG8gbWFyayBhbnkgZGlzcGxheSBhcyBWUlIgY2FwYWJsZSwgZXZlbg0KPj4gKyAqIGlmIGl0
IGlzIG5vdC4gVXNlZnVsIGZvciBiYXNpYyB0ZXN0aW5nIG9mIFZSUiB3aXRob3V0IG5lZWQgdG8g
YXR0YWNoIHN1Y2ggYQ0KPj4gKyAqIGRpc3BsYXksIGUuZy4sIGZvciBpZ3QgdGVzdHMuDQo+PiAr
ICogU2V0dGluZyAxIGVuYWJsZXMgZmFraW5nIFZSUi4gRGVmYXVsdCB2YWx1ZSwgMCwgZG9lcyBu
b3JtYWwgZGV0ZWN0aW9uLg0KPj4gKyAqLw0KPj4gK21vZHVsZV9wYXJhbV9uYW1lZChmYWtldnJy
ZGlzcGxheSwgYW1kZ3B1X2Zha2VfdnJyX2Rpc3BsYXksIGludCwgMDY0NCk7DQo+PiArTU9EVUxF
X1BBUk1fREVTQyhmYWtldnJyZGlzcGxheSwgIkRldGVjdCBhbnkgZGlzcGxheSBhcyBWUlIgY2Fw
YWJsZSAoMCA9IG9mZiAoZGVmYXVsdCksIDEgPSBvbikiKTsNCj4gDQo+IGFtZGdwdSBoYXMgdG9v
IG1hbnkgbW9kdWxlIHBhcmFtZXRlcnMgYWxyZWFkeTsgSU1ITyB0aGlzIGtpbmQgb2YgbmljaGUN
Cj4gdXNlLWNhc2UgZG9lc24ndCBqdXN0aWZ5IGFkZGluZyB5ZXQgYW5vdGhlciBvbmUuIEZvciB0
aGUgdmFzdCBtYWpvcml0eQ0KPiBvZiB1c2VycywgdGhpcyB3b3VsZCBqdXN0IGJlIGFub3RoZXIg
a25vYiB0byBicmVhayB0aGluZ3MsIHJlc3VsdGluZyBpbg0KPiBzdXBwb3J0IGJ1cmRlbiBmb3Ig
dXMuDQo+IA0KPiBIb3cgYWJvdXQgZS5nLiBtYWtpbmcgdGhlIHZycl9jYXBhYmxlIHByb3BlcnR5
IG11dGFibGUsIG9yIGFkZGluZw0KPiBhbm90aGVyIHByb3BlcnR5IGZvciB0aGlzPw0KPiANCj4g
DQo+IC0tDQo+IEVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20NCj4gTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyDQo+IA0KDQpTaW5j
ZSB2cnJfY2FwYWJsZSBpcyBhbHJlYWR5IGFuIG9wdGlvbmFsIHByb3BlcnR5IEkgdGhpbmsgbWFr
aW5nIGl0IA0KbXV0YWJsZSBjb3VsZCBwb3RlbnRpYWxseSBiZSBhbiBvcHRpb24uIEl0IHdvdWxk
IGFsbG93IGZvciB1c2Vyc3BhY2UgdG8gDQpiZSBhYmxlIHRvIGRpc2FibGUgY2FwYWJpbGl0eSBh
cyB3ZWxsIHRoYXQgd2F5Lg0KDQpJdCdzIGEgcHJldHR5IG5pY2hlIHVzZWNhc2UgdGhvdWdoLiBI
b3dldmVyLCBhcyBNaWNoZWwgc2FpZCwgaXQgd291bGQgDQpwcm9iYWJseSBqdXN0IGVuZCB1cCBi
ZWluZyBhbm90aGVyIHNldHRpbmcgdGhhdCBhbGxvd3MgdXNlcnMgdG8gYnJlYWsgDQp0aGVpciBv
d24gc2V0dXAuDQoNCk5pY2hvbGFzIEthemxhdXNrYXMNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

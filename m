Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938B6203E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40AE89337;
	Thu, 16 May 2019 10:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE9589337
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:51:34 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1946.namprd12.prod.outlook.com (10.175.90.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 10:51:32 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 10:51:32 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
Thread-Topic: [PATCH libdrm] enable syncobj test depending on capability
Thread-Index: AQHVC9S2/EABbDkCjUyVU1/4/D+JjaZtkvOA
Date: Thu, 16 May 2019 10:51:32 +0000
Message-ID: <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
References: <20190516104642.21450-1-david1.zhou@amd.com>
In-Reply-To: <20190516104642.21450-1-david1.zhou@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR05CA0139.eurprd05.prod.outlook.com
 (2603:10a6:207:3::17) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e327cc8-2951-464b-0b8d-08d6d9ec7529
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1946; 
x-ms-traffictypediagnostic: DM5PR12MB1946:
x-microsoft-antispam-prvs: <DM5PR12MB1946CDC3ABF897FA75667564830A0@DM5PR12MB1946.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:207;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(36756003)(71200400001)(53936002)(5660300002)(71190400001)(6512007)(305945005)(6486002)(229853002)(6436002)(81166006)(58126008)(68736007)(65956001)(6246003)(65806001)(8936002)(64126003)(81156014)(446003)(65826007)(11346002)(2501003)(46003)(52116002)(186003)(72206003)(7736002)(99286004)(76176011)(8676002)(6116002)(14454004)(2906002)(25786009)(86362001)(316002)(31696002)(256004)(31686004)(486006)(476003)(66446008)(386003)(6506007)(2616005)(102836004)(110136005)(478600001)(73956011)(64756008)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1946;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3w993xsVWlxoA82FDgMB0ecfBfaublJ8dCY81Z83pyhQgw0yaHChHfVwzLLy1UZJVjx9vpJYvR4X+tj7vVhMEuNOnMcsdwmYqH/gcoXefJaY+O4pBFqR5RctMQ81h2UmpuGQ3idhfUBSY/kFMViFWUSAOmAJxsMh+Dk0FJ2feezuGITqOOECwDzTkSyNM8T9Kf+D9C47UuAeFUy8YSmXTuIfwLA0SX+m+Gf8JMge4qW/BBHWbvG/PlCu9myFe/z1gBo5dDSwFqHw/sgTMR9+gyhCoLo3h8cRNbAKyC4jjH32I/nIsORIVGzGEarMzheNGF26KJmSvc3t8dusTrFhGI99HSWmVwspPKVr3FNo/eWfi4e53nHVEaQ7ngOj8ohKXLYpcitpUJdeBGs6Ni0h9nJpWqdE+5I5Bbv3O1B4kl8=
Content-ID: <149986BFCBDA3441B64177EE0BBC8BC0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e327cc8-2951-464b-0b8d-08d6d9ec7529
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 10:51:32.4930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1946
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+kUS6sRfpRnt2culjCns3R5ixI3bm86vSDH/LG4GmE=;
 b=YARHPY0gqsbEPVfM2wF1rfrplKUsgqolAskLwGFfhNWIsS2XBhLL/pjMfQbro4IJjhDfKGRd7TpZSHknsh96NCO6x1vgh/jo+xrYLj8I8Edf6ea7OMxS/KecZNA+eQn4SzZGPTFDWu6f0ayHAHBuKSCsIv2Xh6+19/5UUGyRp6M=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDUuMTkgdW0gMTI6NDYgc2NocmllYiBDaHVubWluZyBaaG91Og0KPiBGZWF0dXJlIGlz
IGNvbnRyb2xsZWQgYnkgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FIGRybSBjYXBhYmlsaXR5Lg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPg0K
DQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KDQo+IC0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybS5oICAgICAgICAgICAgfCAxICsNCj4gICB0
ZXN0cy9hbWRncHUvc3luY29ial90ZXN0cy5jIHwgOCArKysrKysrKw0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm0u
aCBiL2luY2x1ZGUvZHJtL2RybS5oDQo+IGluZGV4IGM4OTNmM2I0Li41MzI3ODdiZiAxMDA2NDQN
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtLmgNCj4g
QEAgLTY0Myw2ICs2NDMsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9vcGVuIHsNCj4gICAjZGVmaW5lIERS
TV9DQVBfUEFHRV9GTElQX1RBUkdFVAkweDExDQo+ICAgI2RlZmluZSBEUk1fQ0FQX0NSVENfSU5f
VkJMQU5LX0VWRU5UCTB4MTINCj4gICAjZGVmaW5lIERSTV9DQVBfU1lOQ09CSgkJMHgxMw0KPiAr
I2RlZmluZSBEUk1fQ0FQX1NZTkNPQkpfVElNRUxJTkUJMHgxNA0KPiAgIA0KPiAgIC8qKiBEUk1f
SU9DVExfR0VUX0NBUCBpb2N0bCBhcmd1bWVudCB0eXBlICovDQo+ICAgc3RydWN0IGRybV9nZXRf
Y2FwIHsNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdwdS9zeW5jb2JqX3Rlc3RzLmMgYi90ZXN0
cy9hbWRncHUvc3luY29ial90ZXN0cy5jDQo+IGluZGV4IGEwYzYyN2Q3Li44NjllZDg4ZSAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvYW1kZ3B1L3N5bmNvYmpfdGVzdHMuYw0KPiArKysgYi90ZXN0cy9h
bWRncHUvc3luY29ial90ZXN0cy5jDQo+IEBAIC0yMiw2ICsyMiw3IEBADQo+ICAgKi8NCj4gICAN
Cj4gICAjaW5jbHVkZSAiQ1VuaXQvQmFzaWMuaCINCj4gKyNpbmNsdWRlICJ4Zjg2ZHJtLmgiDQo+
ICAgDQo+ICAgI2luY2x1ZGUgImFtZGdwdV90ZXN0LmgiDQo+ICAgI2luY2x1ZGUgImFtZGdwdV9k
cm0uaCINCj4gQEAgLTM2LDYgKzM3LDEzIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9zeW5jb2JqX3Rp
bWVsaW5lX3Rlc3Qodm9pZCk7DQo+ICAgDQo+ICAgQ1VfQk9PTCBzdWl0ZV9zeW5jb2JqX3RpbWVs
aW5lX3Rlc3RzX2VuYWJsZSh2b2lkKQ0KPiAgIHsNCj4gKwlpbnQgcjsNCj4gKwl1aW50NjRfdCBj
YXAgPSAwOw0KPiArDQo+ICsJciA9IGRybUdldENhcChkcm1fYW1kZ3B1WzBdLCBEUk1fQ0FQX1NZ
TkNPQkpfVElNRUxJTkUsICZjYXApOw0KPiArCWlmIChyIHx8IGNhcCA9PSAwKQ0KPiArCQlyZXR1
cm4gQ1VfRkFMU0U7DQo+ICsNCj4gICAJcmV0dXJuIENVX1RSVUU7DQo+ICAgfQ0KPiAgIA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

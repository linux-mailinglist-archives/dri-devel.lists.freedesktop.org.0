Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE39C0CE7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 22:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BBF6E24D;
	Fri, 27 Sep 2019 20:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770084.outbound.protection.outlook.com [40.107.77.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641926E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 20:55:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P++z8aeo2frWt5N9REo7D7puyHfyQVCi6ElZGjMGGlPuH0QY15U5m/wQFjFx4HtrgPR85l04RtSvDdyfROxGPfb4j/SAayX9FAj24hXwHV5qoXDEEuwJzNxOgYspzouJjPaeZaYx6tF/2RuudnGRXRm2R4m+fLDPXiCHN/+0YjmoxfAiwk/VAQxMuwUVxTodX9CdfJEXezSi+Wj+P6OsHYcGCGL4KutEmAiCAcBtFlddXue9y4dhpX7LtB1mYxwWyPB5m2kWMtGp40hOyJE7usfp5ztxFSma5WLcCssnP0GItIikajQQZek23N9Tl6doAXXq+jspIZoN7OUx0JL4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX7yj9jLUzQcm5DBkaAkxFwoyZkri3auLn7bi0rCrXY=;
 b=TV2f6oBHII9R428ZHiY25ue6Jq+7HcG6/2Ks8E/vmlic/4osxoeFbM2utpR2bLbKv+5saxMhRr+g8e2oqvVsMwevgDMq9VNuh9zQYmVnjUB0rXLN6FeUnVrzRKDHq3Mt0SZc97Nclgr9tvEoxZtYRzhBr5zASVAFHykGikGdMETgAHwXqCFGB3TV+ycLx7gtG6EOrTtMddir1EBIS5RIic7tLE2kNJer571FkR73YTi3nh116ArJEd03Ti5hGR8gajJprFhCHdx3mZHpMezlxr9Q+34+h5urA9GbDc6LT6gy3iyR8G63jjqK/8/HNQdSc15Rrtm/lbkvXPPdom//cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1693.namprd12.prod.outlook.com (10.172.56.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 20:55:55 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6%10]) with mapi id 15.20.2305.017; Fri, 27 Sep
 2019 20:55:55 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Neil Armstrong <narmstrong@baylibre.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: drm_sched with panfrost crash on T820
Thread-Topic: drm_sched with panfrost crash on T820
Thread-Index: AQHVdQtdjrcnE/APhki/CyOIa6xfH6dAAc4A
Date: Fri, 27 Sep 2019 20:55:55 +0000
Message-ID: <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
In-Reply-To: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0aed735-28c0-4f50-83c5-08d7438d16f8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1693:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB16935EAF24DF9FC3C1CB6D31EA810@MWHPR12MB1693.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(199004)(189003)(51234002)(52314003)(316002)(478600001)(446003)(5660300002)(11346002)(14444005)(256004)(66066001)(2616005)(476003)(6246003)(99286004)(7416002)(229853002)(86362001)(6512007)(7736002)(52116002)(36756003)(8936002)(31686004)(66556008)(66946007)(6506007)(64756008)(54906003)(66476007)(486006)(386003)(66446008)(2201001)(53546011)(110136005)(45080400002)(3846002)(6116002)(6636002)(305945005)(25786009)(26005)(2906002)(14454004)(186003)(4326008)(2501003)(76176011)(71190400001)(71200400001)(6436002)(8676002)(102836004)(31696002)(81156014)(6486002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1693;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sjcSFo5wb8fu2vsivCgc1cI63PoUPWrL1Jc8/qJt2iL1lVzAJs2ixfDfnvwEHI+D35n4Yz3WTz3/Om0OfIbcKN8Dwxf/PtgM5arT9TNc/SVcoWf8ssxVkzkCh7oXWazQML4nOSu4NAOzIk7qYRFoQ9ONL4CTp6xck2LQyAyxOuK4/uXwfEyoIRkzdTudDD7Pf8vPBxQV7q/JqHjZlcU2eGecoQ/k8Ht6heUcVn1BlVofoHGZ/ZF6KcYwgTEr8f22jg86lY+seDrnJKFAJnryHMRBqPaV8jkaLRg4plJwxGLu9n5g5SsGE1JLCZXy9/CB3TGlmUF/Hwvp8WJO9yWvhazPYdw7gFnsEpugJyWcV3M0A6UymJ2Rs1vO29VnT5MeP/uvkhutyDkifV/bxiuRsoi498Qq5adTw3S5yoo7nOk=
Content-ID: <C59B838ADB0BFB40BDF91512DA78EF80@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0aed735-28c0-4f50-83c5-08d7438d16f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 20:55:55.4738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RqjwhEx7DkbtNXlFFgp77gueyq6PVBLvyc7QAfdx6qokz3RJXAkdL0h0xcFKLLFvvl0p2q5dgHqqzZWBWYmUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1693
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX7yj9jLUzQcm5DBkaAkxFwoyZkri3auLn7bi0rCrXY=;
 b=Zixga9UhFs1Y30lswDwLbPnp85/A50w0EudfyFudkLai17BSlG6Zbas/zhCWUdBrkdudEGgq3JcB9OQYgXEPNJ9wlUNTxVA0XpkBuMyblMREOTxziEisSGkj78yFqxcE1kWjF7wxaJwPwrHMN/5C2gPye9TMHlXES1eM7AUTt2s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FuIHlvdSBwbGVhc2UgdXNlIGFkZHIybGluZSBvciBnZGIgdG8gcGlucG9pbnQgd2hlcmUgaW4g
DQpkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEgeW91IGhpdCB0aGUgTlVMTCBwdHIgPyBJdCBsb29r
cyBsaWtlIHRoZSBndWlsdHkgDQpqb2IsIGJ1dCB0byBiZSBzdXJlLg0KDQpBbmRyZXkNCg0KT24g
OS8yNy8xOSA0OjEyIEFNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToNCj4gSGkgQ2hyaXN0aWFuLA0K
Pg0KPiBJbiB2NS4zLCBydW5uaW5nIGRFUVAgdHJpZ2dlcnMgdGhlIGZvbGxvd2luZyBrZXJuZWwg
Y3Jhc2ggOg0KPg0KPiBbICAgMjAuMjI0OTgyXSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxM
IHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwMzgN
Cj4gWy4uLl0NCj4gWyAgIDIwLjI5MTA2NF0gSGFyZHdhcmUgbmFtZTogS2hhZGFzIFZJTTIgKERU
KQ0KPiBbICAgMjAuMjk1MjE3XSBXb3JrcXVldWU6IGV2ZW50cyBkcm1fc2NoZWRfam9iX3RpbWVk
b3V0DQo+IFsuLi5dDQo+IFsgICAyMC4zMDQ4NjddIHBjIDogZHJtX3NjaGVkX2luY3JlYXNlX2th
cm1hKzB4NWMvMHhmMA0KPiBbICAgMjAuMzA5Njk2XSBsciA6IGRybV9zY2hlZF9pbmNyZWFzZV9r
YXJtYSsweDQ0LzB4ZjANCj4gWy4uLl0NCj4gWyAgIDIwLjM5NjcyMF0gQ2FsbCB0cmFjZToNCj4g
WyAgIDIwLjM5OTEzOF0gIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSsweDVjLzB4ZjANCj4gWyAg
IDIwLjQwMzYyM10gIHBhbmZyb3N0X2pvYl90aW1lZG91dCsweDEyYy8weDFlMA0KPiBbICAgMjAu
NDA4MDIxXSAgZHJtX3NjaGVkX2pvYl90aW1lZG91dCsweDQ4LzB4YTANCj4gWyAgIDIwLjQxMjMz
Nl0gIHByb2Nlc3Nfb25lX3dvcmsrMHgxZTAvMHgzMjANCj4gWyAgIDIwLjQxNjMwMF0gIHdvcmtl
cl90aHJlYWQrMHg0MC8weDQ1MA0KPiBbICAgMjAuNDE5OTI0XSAga3RocmVhZCsweDEyNC8weDEy
OA0KPiBbICAgMjAuNDIzMTE2XSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgNCj4gWyAgIDIwLjQy
NjY1M10gQ29kZTogZjk0MDAwMDEgNTQwMDAxYzAgZjk0MDBhODMgZjk0MDI0MDIgKGY5NDAxYzY0
KQ0KPiBbICAgMjAuNDMyNjkwXSAtLS1bIGVuZCB0cmFjZSBiZDAyZjg5MDEzOTA5NmE3IF0tLS0N
Cj4NCj4gV2hpY2ggbmV2ZXIgaGFwcGVucywgYXQgYWxsLCBvbiB2NS4yLg0KPg0KPiBJIGRpZCBh
ICh2ZXJ5KSBsb25nICg3IGRheXMsIH4xMDBydW5zKSBiaXNlY3QgcnVuIHVzaW5nIG91ciBMQVZB
IGxhYiAodGhhbmtzIHRvbWV1ICEpLCBidXQNCj4gYmlzZWN0aW5nIHdhcyBub3QgZWFzeSBzaW5j
ZSB0aGUgYmFkIGNvbW1pdCBsYW5kZWQgb24gZHJtLW1pc2MtbmV4dCBhZnRlciB2NS4xLXJjNiwg
YW5kDQo+IHRoZW4gdjUuMi1yYzEgd2FzIGJhY2ttZXJnZWQgaW50byBkcm0tbWlzYy1uZXh0IGF0
Og0KPiBbMV0gMzc0ZWQ1NDI5MzQ2IE1lcmdlIGRybS9kcm0tbmV4dCBpbnRvIGRybS1taXNjLW5l
eHQNCj4NCj4gVGh1cyBiaXNlY3RpbmcgYmV0d2VlbiBbMV0gYW5nIHY1LjItcmMxIGxlYWRzIHRv
IGNvbW1pdCBiYXNlZCBvbiB2NS4yLXJjMS4uLiB3aGVyZSBwYW5mcm9zdCB3YXMNCj4gbm90IGVu
YWJsZWQgaW4gdGhlIEtoYWRhcyBWSU0yIERULg0KPg0KPiBBbnl3YXksIEkgbWFuYWdlZCB0byBp
ZGVudGlmeSAzIHBvc3NpYmx5IGJyZWFraW5nIGNvbW1pdHMgOg0KPiBbMl0gMjkwNzY0YWY3ZTM2
IGRybS9zY2hlZDogS2VlcCBzX2ZlbmNlLT5wYXJlbnQgcG9pbnRlcg0KPiBbM10gNTkxODA0NWM0
ZWQ0IGRybS9zY2hlZHVsZXI6IHJld29yayBqb2IgZGVzdHJ1Y3Rpb24NCj4gWzRdIGE1MzQzYjhh
MmNhNSBkcm0vc2NoZWR1bGVyOiBBZGQgZmxhZyB0byBoaW50IHRoZSByZWxlYXNlIG9mIGd1aWx0
eSBqb2IuDQo+DQo+IEJ1dCBbMV0gYW5kIFsyXSBkb2Vzbid0IGNyYXNoIHRoZSBzYW1lIHdheSA6
DQo+IFsgICAxNi4yNTc5MTJdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDA2MA0KPiBbLi4uXQ0K
PiBbICAgMTYuMzA4MzA3XSBDUFU6IDQgUElEOiA4MCBDb21tOiBrd29ya2VyLzQ6MSBOb3QgdGFp
bnRlZCA1LjEuMC1yYzItMDExODUtZzI5MDc2NGFmN2UzNi1kaXJ0eSAjMzc4DQo+IFsgICAxNi4z
MTcwOTldIEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBWSU0yIChEVCkNCj4gWy4uLl0pDQo+IFsgICAx
Ni4zMzA5MDddIHBjIDogcmVmY291bnRfc3ViX2FuZF90ZXN0X2NoZWNrZWQrMHg0LzB4YjANCj4g
WyAgIDE2LjMzNjA3OF0gbHIgOiByZWZjb3VudF9kZWNfYW5kX3Rlc3RfY2hlY2tlZCsweDE0LzB4
MjANCj4gWy4uLl0NCj4gWyAgIDE2LjQyMzUzM10gUHJvY2VzcyBrd29ya2VyLzQ6MSAocGlkOiA4
MCwgc3RhY2sgbGltaXQgPSAweChfX19fcHRydmFsX19fXykpDQo+IFsgICAxNi40MzA0MzFdIENh
bGwgdHJhY2U6DQo+IFsgICAxNi40MzI4NTFdICByZWZjb3VudF9zdWJfYW5kX3Rlc3RfY2hlY2tl
ZCsweDQvMHhiMA0KPiBbICAgMTYuNDM3NjgxXSAgZHJtX3NjaGVkX2pvYl9jbGVhbnVwKzB4MjQv
MHg1OA0KPiBbICAgMTYuNDQxOTA4XSAgcGFuZnJvc3Rfam9iX2ZyZWUrMHgxNC8weDI4DQo+IFsg
ICAxNi40NDU3ODddICBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KzB4NmMvMHhhMA0KPiBbICAgMTYu
NDUwMTAyXSAgcHJvY2Vzc19vbmVfd29yaysweDFlMC8weDMyMA0KPiBbICAgMTYuNDU0MDY3XSAg
d29ya2VyX3RocmVhZCsweDQwLzB4NDUwDQo+IFsgICAxNi40NTc2OTBdICBrdGhyZWFkKzB4MTI0
LzB4MTI4DQo+IFsgICAxNi40NjA4ODJdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxOA0KPiBbICAg
MTYuNDY0NDIxXSBDb2RlOiA1MjgwMDAwMCBkNjVmMDNjMCBkNTAzMjAxZiBhYTAxMDNlMyAoYjk0
MDAwMjEpDQo+IFsgICAxNi40NzA0NTZdIC0tLVsgZW5kIHRyYWNlIDM5YTY3NDEyZWUxYjY0YjUg
XS0tLQ0KPg0KPiBhbmQgWzNdIGZhaWxzIGxpa2Ugb24gdjUuMyAoaW4gZHJtX3NjaGVkX2luY3Jl
YXNlX2thcm1hKToNCj4gWyAgIDMzLjgzMDA4MF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDM4
DQo+IFsuLi5dDQo+IFsgICAzMy44NzE5NDZdIEludGVybmFsIGVycm9yOiBPb3BzOiA5NjAwMDAw
NCBbIzFdIFBSRUVNUFQgU01QDQo+IFsgICAzMy44Nzc0NTBdIE1vZHVsZXMgbGlua2VkIGluOg0K
PiBbICAgMzMuODgwNDc0XSBDUFU6IDYgUElEOiA4MSBDb21tOiBrd29ya2VyLzY6MSBOb3QgdGFp
bnRlZCA1LjEuMC1yYzItMDExODYtZ2E1MzQzYjhhMmNhNS1kaXJ0eSAjMzgwDQo+IFsgICAzMy44
ODkyNjVdIEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBWSU0yIChEVCkNCj4gWyAgIDMzLjg5MzQxOV0g
V29ya3F1ZXVlOiBldmVudHMgZHJtX3NjaGVkX2pvYl90aW1lZG91dA0KPiBbLi4uXQ0KPiBbICAg
MzMuOTAzMDY5XSBwYyA6IGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSsweDVjLzB4ZjANCj4gWyAg
IDMzLjkwNzg5OF0gbHIgOiBkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWErMHg0NC8weGYwDQo+IFsu
Li5dDQo+IFsgICAzMy45OTQ5MjRdIFByb2Nlc3Mga3dvcmtlci82OjEgKHBpZDogODEsIHN0YWNr
IGxpbWl0ID0gMHgoX19fX3B0cnZhbF9fX18pKQ0KPiBbICAgMzQuMDAxODIyXSBDYWxsIHRyYWNl
Og0KPiBbICAgMzQuMDA0MjQyXSAgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NWMvMHhmMA0K
PiBbICAgMzQuMDA4NzI2XSAgcGFuZnJvc3Rfam9iX3RpbWVkb3V0KzB4MTJjLzB4MWUwDQo+IFsg
ICAzNC4wMTMxMjJdICBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KzB4NDgvMHhhMA0KPiBbICAgMzQu
MDE3NDM4XSAgcHJvY2Vzc19vbmVfd29yaysweDFlMC8weDMyMA0KPiBbICAgMzQuMDIxNDAyXSAg
d29ya2VyX3RocmVhZCsweDQwLzB4NDUwDQo+IFsgICAzNC4wMjUwMjZdICBrdGhyZWFkKzB4MTI0
LzB4MTI4DQo+IFsgICAzNC4wMjgyMThdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxOA0KPiBbICAg
MzQuMDMxNzU1XSBDb2RlOiBmOTQwMDAwMSA1NDAwMDFjMCBmOTQwMGE4MyBmOTQwMjQwMiAoZjk0
MDFjNjQpDQo+IFsgICAzNC4wMzc3OTJdIC0tLVsgZW5kIHRyYWNlIGJlM2ZkNmY3N2Y0ZGYyNjcg
XS0tLQ0KPg0KPg0KPiBXaGVuIEkgcmV2ZXJ0IFszXSBvbiBbMV0sIGkgZ2V0IHRoZSBzYW1lIGNy
YXNoIGFzIFsyXSwgbWVhbmluZw0KPiB0aGUgY29tbWl0IFszXSBtYXNrcyB0aGUgZmFpbHVyZSBb
Ml0gaW50cm9kdWNlZC4NCj4NCj4gRG8geW91IGtub3cgaG93IHRvIHNvbHZlIHRoaXMgPw0KPg0K
PiBUaGFua3MsDQo+IE5laWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E719C8F01
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967E06E8DF;
	Wed,  2 Oct 2019 16:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810078.outbound.protection.outlook.com [40.107.81.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CE26E8DF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqEPeLbgs5PsLWveq2G5Lc3ltYlF/IjZRd7zyTJbNBfCglqZha+H0PdQ0OdlysDn4cTJP2npsNUjYiXjGrSFgjhaSR+kseOBSCXebH2G1sHBe6iRWN4ssq2FIkOFM/IOEWFI81QqyIvaFI3fQVBRekwlh+lQsAZdvHfrVxG7lr7BDh2Je+vu70I3SQJozPTxk/+iQIQoE1hUg7/gOn5FT4ChjcT7QW6z+ClbcZGEK33T3XiQTq7wreTYHieJLrcAlAFcdBtZ++WtIy2R5Nbk7sSaFSYcwfP7HxM9eSzjkZ0tlmjuoD6U1KFC8cJTxW205KTG4wyPVby29iPIwMqE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkWZFIUKli+yxaFCWJ5tEkeDEe1zSbC/JY1oNDETO1E=;
 b=og/KCvp5vLpEwlC1YYozv3NmP+sWuXdWQT2FDNY92qI2ZNp/pE9nwWAtBNr2jT4pMnwIs4mznVJ3gBOrieR1CR1XjRkO5fBWU5Bafh7J5GGg7RT/kINLKqTpNAHSI1x5/r0FfWLwdubHXXPoyCFfnkbT0KPU3K2s3nVWTnJRxkZ4F/MTKjgvgQw0u0NrdzOJZ/Ni7djvf5Yg7FqqmaBEZEiysKXAdBFpZmHF8lMQWnTMd+TjaUIWInzhSJ9z1wPWKVdylIVNZ69PHugR4t5NyxAy/Y0h3RTLz+q36yDkue6gbPqFo2Q2oQtVvYV4DKCXQeMtNayaZbztR+l0f71ZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1583.namprd12.prod.outlook.com (10.172.56.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 16:53:10 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6%10]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 16:53:10 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Neil Armstrong <narmstrong@baylibre.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: drm_sched with panfrost crash on T820
Thread-Topic: drm_sched with panfrost crash on T820
Thread-Index: AQHVdQtdjrcnE/APhki/CyOIa6xfH6c/vsAAgAQ2/4CAA6PTAA==
Date: Wed, 2 Oct 2019 16:53:10 +0000
Message-ID: <d5ceef14-b876-c102-d793-25289635cab1@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <5f7d10ab-1ce5-25aa-90bd-4f87ed2a9bfb@baylibre.com>
In-Reply-To: <5f7d10ab-1ce5-25aa-90bd-4f87ed2a9bfb@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::15)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2607:fea8:3edf:fe95::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28ade9d2-d561-4873-afa9-08d747590195
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1583CBBA8CC4758F51002DC0EA9C0@MWHPR12MB1583.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(52314003)(51234002)(189003)(199004)(5660300002)(46003)(86362001)(99286004)(31686004)(186003)(31696002)(53546011)(6506007)(102836004)(52116002)(14454004)(76176011)(386003)(36756003)(7736002)(110136005)(4326008)(256004)(6636002)(6246003)(2906002)(71200400001)(14444005)(71190400001)(45080400002)(25786009)(316002)(6116002)(2201001)(486006)(478600001)(64756008)(2616005)(446003)(54906003)(7416002)(476003)(66476007)(11346002)(66556008)(305945005)(66446008)(66946007)(81166006)(81156014)(8676002)(8936002)(6486002)(229853002)(2501003)(6512007)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1583;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1//5BZAL3iMRo/2qc6gNwIg9IqBW62i7BtMBMsNL55K83Fg5O2fCBWi11QKmRB222AUfVJyUsB7V6krpq/XTeI89QDXjz26lnqRUmhSL93vK5jJRA7BH9u8gdn5jrjc+O/kRS+/G6HYyuVAwLF/hy7In7RwsRR+IgDoqyuOia1G20mnd+ZFpUcRbsamjYXQvf9BHHUqqBzIXky7pc7OXhLglPjGADoSlNfWP7SbHlxRaB/NNSUkqZwDG987TsNApNpUH5NFrgodggx5koghuX7OSSS4R2eqG2ILXeFl5Tsnjcx+VR06+LWdV+F7O6vcL1LaojM6Z3/FSsEUaLAUgNjnFF4h5lx2c5lRolCpa4PYnn40++zNAEiI+pqf8wGp3KHTifLGUzkNK3FF4aKSdscpF4+drigbmwSUw4i61/h0=
Content-ID: <AAF20E40FC56A446A552B6C34B982D53@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ade9d2-d561-4873-afa9-08d747590195
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 16:53:10.3461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7yWjZB4OQTtC94BIGFWAZTHfZ1l2B8uS6C9+B8Z5ffr2Msh9tYV9DxwjDb2Gsef82FeUXdTW5zg1YdVq/KscQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkWZFIUKli+yxaFCWJ5tEkeDEe1zSbC/JY1oNDETO1E=;
 b=r8fugI+PFLPu3zn9YNaFVCIMZODmNIbduQoFus/Gt002KcmUUHSEZRBS95TmB/NIuV0ZFekqQWeiVInjouC7ixjbky/yxJhWuv/ZAE9Ggk0KFbOpnlgB1TQdECFfEsoGeVyOKuc4bA3E1sLpujNrmU+wf/BiNK8jbNX1xwqzGpc=
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

DQpPbiA5LzMwLzE5IDU6MTcgQU0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPiBIaSBBbmRyZXks
DQo+DQo+IE9uIDI3LzA5LzIwMTkgMjI6NTUsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToNCj4+
IENhbiB5b3UgcGxlYXNlIHVzZSBhZGRyMmxpbmUgb3IgZ2RiIHRvIHBpbnBvaW50IHdoZXJlIGlu
DQo+PiBkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEgeW91IGhpdCB0aGUgTlVMTCBwdHIgPyBJdCBs
b29rcyBsaWtlIHRoZSBndWlsdHkNCj4+IGpvYiwgYnV0IHRvIGJlIHN1cmUuDQo+IERpZCBhIG5l
dyBydW4gZnJvbSA1LjM6DQo+DQo+IFsgICAzNS45NzE5NzJdIENhbGwgdHJhY2U6DQo+IFsgICAz
NS45NzQzOTFdICBkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWErMHg1Yy8weGYwCWZmZmYwMDAwMTA2
NjdmMzgJRkZGRjAwMDAxMDY2N0Y5NAlkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYzozMzUNCj4NCj4NCj4gVGhlIGNyYXNoaW5nIGxpbmUgaXMgOg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoYmFkLT5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA9
PQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW50aXR5LT5mZW5jZV9j
b250ZXh0KSB7DQo+DQo+IERvZXNuJ3Qgc2VlbSByZWxhdGVkIHRvIGd1aWx0eSBqb2IuDQo+DQo+
IE5laWwNCg0KDQpUaGFua3MgTmVpbCwgYnkgZ3VpbHR5IGkgbWVhbnQgdGhlICdiYWQnIGpvYi4g
SSByZXZpZXdlZCB0aGUgY29kZSBhbmQgDQpjYW4ndCBzZWUgYW55dGhpbmcgc3VzcGljaW91cyBm
b3Igbm93LiBUbyBoZWxwIGNsYXJpZnkgY291bGQgeW91IHBsZWFzZSANCnByb3ZpZGUgZnRyYWNl
IGxvZyBmb3IgdGhpcyA/IEFsbCB0aGUgZG1hX2ZlbmNlIGFuZCBncHVfc2NoZWR1bGVyIHRyYWNl
cyANCmNhbiBoZWxwLiBJIHVzdWFsbHkganVzdCBzZXQgdGhlbSBhbGwgdXAgaW4gb25lIGxpbmUg
dXNpbmcgdHJhY2UtY21kIA0KdXRpbGl0eSBsaWtlIHRoaXMgYmVmb3JlIHN0YXJ0aW5nIHRoZSBy
dW4uIElmIHlvdSBoYXZlIGFueSByZWxldmFudCANCnRyYWNlcyBpbiBwYW5mcm9zdCBpdCBhc2xv
IGNhbiBiZSB1c2VmdWwuDQoNCnN1ZG8gdHJhY2UtY21kIHN0YXJ0IC1lIGRtYV9mZW5jZSAtZSBn
cHVfc2NoZWR1bGVyDQoNCkFuZHJleQ0KDQoNCj4NCj4+IEFuZHJleQ0KPj4NCj4+IE9uIDkvMjcv
MTkgNDoxMiBBTSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6DQo+Pj4gSGkgQ2hyaXN0aWFuLA0KPj4+
DQo+Pj4gSW4gdjUuMywgcnVubmluZyBkRVFQIHRyaWdnZXJzIHRoZSBmb2xsb3dpbmcga2VybmVs
IGNyYXNoIDoNCj4+Pg0KPj4+IFsgICAyMC4yMjQ5ODJdIFVuYWJsZSB0byBoYW5kbGUga2VybmVs
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAw
MDAzOA0KPj4+IFsuLi5dDQo+Pj4gWyAgIDIwLjI5MTA2NF0gSGFyZHdhcmUgbmFtZTogS2hhZGFz
IFZJTTIgKERUKQ0KPj4+IFsgICAyMC4yOTUyMTddIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9zY2hl
ZF9qb2JfdGltZWRvdXQNCj4+PiBbLi4uXQ0KPj4+IFsgICAyMC4zMDQ4NjddIHBjIDogZHJtX3Nj
aGVkX2luY3JlYXNlX2thcm1hKzB4NWMvMHhmMA0KPj4+IFsgICAyMC4zMDk2OTZdIGxyIDogZHJt
X3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NDQvMHhmMA0KPj4+IFsuLi5dDQo+Pj4gWyAgIDIwLjM5
NjcyMF0gQ2FsbCB0cmFjZToNCj4+PiBbICAgMjAuMzk5MTM4XSAgZHJtX3NjaGVkX2luY3JlYXNl
X2thcm1hKzB4NWMvMHhmMA0KPj4+IFsgICAyMC40MDM2MjNdICBwYW5mcm9zdF9qb2JfdGltZWRv
dXQrMHgxMmMvMHgxZTANCj4+PiBbICAgMjAuNDA4MDIxXSAgZHJtX3NjaGVkX2pvYl90aW1lZG91
dCsweDQ4LzB4YTANCj4+PiBbICAgMjAuNDEyMzM2XSAgcHJvY2Vzc19vbmVfd29yaysweDFlMC8w
eDMyMA0KPj4+IFsgICAyMC40MTYzMDBdICB3b3JrZXJfdGhyZWFkKzB4NDAvMHg0NTANCj4+PiBb
ICAgMjAuNDE5OTI0XSAga3RocmVhZCsweDEyNC8weDEyOA0KPj4+IFsgICAyMC40MjMxMTZdICBy
ZXRfZnJvbV9mb3JrKzB4MTAvMHgxOA0KPj4+IFsgICAyMC40MjY2NTNdIENvZGU6IGY5NDAwMDAx
IDU0MDAwMWMwIGY5NDAwYTgzIGY5NDAyNDAyIChmOTQwMWM2NCkNCj4+PiBbICAgMjAuNDMyNjkw
XSAtLS1bIGVuZCB0cmFjZSBiZDAyZjg5MDEzOTA5NmE3IF0tLS0NCj4+Pg0KPj4+IFdoaWNoIG5l
dmVyIGhhcHBlbnMsIGF0IGFsbCwgb24gdjUuMi4NCj4+Pg0KPj4+IEkgZGlkIGEgKHZlcnkpIGxv
bmcgKDcgZGF5cywgfjEwMHJ1bnMpIGJpc2VjdCBydW4gdXNpbmcgb3VyIExBVkEgbGFiICh0aGFu
a3MgdG9tZXUgISksIGJ1dA0KPj4+IGJpc2VjdGluZyB3YXMgbm90IGVhc3kgc2luY2UgdGhlIGJh
ZCBjb21taXQgbGFuZGVkIG9uIGRybS1taXNjLW5leHQgYWZ0ZXIgdjUuMS1yYzYsIGFuZA0KPj4+
IHRoZW4gdjUuMi1yYzEgd2FzIGJhY2ttZXJnZWQgaW50byBkcm0tbWlzYy1uZXh0IGF0Og0KPj4+
IFsxXSAzNzRlZDU0MjkzNDYgTWVyZ2UgZHJtL2RybS1uZXh0IGludG8gZHJtLW1pc2MtbmV4dA0K
Pj4+DQo+Pj4gVGh1cyBiaXNlY3RpbmcgYmV0d2VlbiBbMV0gYW5nIHY1LjItcmMxIGxlYWRzIHRv
IGNvbW1pdCBiYXNlZCBvbiB2NS4yLXJjMS4uLiB3aGVyZSBwYW5mcm9zdCB3YXMNCj4+PiBub3Qg
ZW5hYmxlZCBpbiB0aGUgS2hhZGFzIFZJTTIgRFQuDQo+Pj4NCj4+PiBBbnl3YXksIEkgbWFuYWdl
ZCB0byBpZGVudGlmeSAzIHBvc3NpYmx5IGJyZWFraW5nIGNvbW1pdHMgOg0KPj4+IFsyXSAyOTA3
NjRhZjdlMzYgZHJtL3NjaGVkOiBLZWVwIHNfZmVuY2UtPnBhcmVudCBwb2ludGVyDQo+Pj4gWzNd
IDU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9uDQo+Pj4g
WzRdIGE1MzQzYjhhMmNhNSBkcm0vc2NoZWR1bGVyOiBBZGQgZmxhZyB0byBoaW50IHRoZSByZWxl
YXNlIG9mIGd1aWx0eSBqb2IuDQo+Pj4NCj4+PiBCdXQgWzFdIGFuZCBbMl0gZG9lc24ndCBjcmFz
aCB0aGUgc2FtZSB3YXkgOg0KPj4+IFsgICAxNi4yNTc5MTJdIFVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAw
MDAwMDA2MA0KPj4+IFsuLi5dDQo+Pj4gWyAgIDE2LjMwODMwN10gQ1BVOiA0IFBJRDogODAgQ29t
bToga3dvcmtlci80OjEgTm90IHRhaW50ZWQgNS4xLjAtcmMyLTAxMTg1LWcyOTA3NjRhZjdlMzYt
ZGlydHkgIzM3OA0KPj4+IFsgICAxNi4zMTcwOTldIEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBWSU0y
IChEVCkNCj4+PiBbLi4uXSkNCj4+PiBbICAgMTYuMzMwOTA3XSBwYyA6IHJlZmNvdW50X3N1Yl9h
bmRfdGVzdF9jaGVja2VkKzB4NC8weGIwDQo+Pj4gWyAgIDE2LjMzNjA3OF0gbHIgOiByZWZjb3Vu
dF9kZWNfYW5kX3Rlc3RfY2hlY2tlZCsweDE0LzB4MjANCj4+PiBbLi4uXQ0KPj4+IFsgICAxNi40
MjM1MzNdIFByb2Nlc3Mga3dvcmtlci80OjEgKHBpZDogODAsIHN0YWNrIGxpbWl0ID0gMHgoX19f
X3B0cnZhbF9fX18pKQ0KPj4+IFsgICAxNi40MzA0MzFdIENhbGwgdHJhY2U6DQo+Pj4gWyAgIDE2
LjQzMjg1MV0gIHJlZmNvdW50X3N1Yl9hbmRfdGVzdF9jaGVja2VkKzB4NC8weGIwDQo+Pj4gWyAg
IDE2LjQzNzY4MV0gIGRybV9zY2hlZF9qb2JfY2xlYW51cCsweDI0LzB4NTgNCj4+PiBbICAgMTYu
NDQxOTA4XSAgcGFuZnJvc3Rfam9iX2ZyZWUrMHgxNC8weDI4DQo+Pj4gWyAgIDE2LjQ0NTc4N10g
IGRybV9zY2hlZF9qb2JfdGltZWRvdXQrMHg2Yy8weGEwDQo+Pj4gWyAgIDE2LjQ1MDEwMl0gIHBy
b2Nlc3Nfb25lX3dvcmsrMHgxZTAvMHgzMjANCj4+PiBbICAgMTYuNDU0MDY3XSAgd29ya2VyX3Ro
cmVhZCsweDQwLzB4NDUwDQo+Pj4gWyAgIDE2LjQ1NzY5MF0gIGt0aHJlYWQrMHgxMjQvMHgxMjgN
Cj4+PiBbICAgMTYuNDYwODgyXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgNCj4+PiBbICAgMTYu
NDY0NDIxXSBDb2RlOiA1MjgwMDAwMCBkNjVmMDNjMCBkNTAzMjAxZiBhYTAxMDNlMyAoYjk0MDAw
MjEpDQo+Pj4gWyAgIDE2LjQ3MDQ1Nl0gLS0tWyBlbmQgdHJhY2UgMzlhNjc0MTJlZTFiNjRiNSBd
LS0tDQo+Pj4NCj4+PiBhbmQgWzNdIGZhaWxzIGxpa2Ugb24gdjUuMyAoaW4gZHJtX3NjaGVkX2lu
Y3JlYXNlX2thcm1hKToNCj4+PiBbICAgMzMuODMwMDgwXSBVbmFibGUgdG8gaGFuZGxlIGtlcm5l
bCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwMDAw
MDAwMzgNCj4+PiBbLi4uXQ0KPj4+IFsgICAzMy44NzE5NDZdIEludGVybmFsIGVycm9yOiBPb3Bz
OiA5NjAwMDAwNCBbIzFdIFBSRUVNUFQgU01QDQo+Pj4gWyAgIDMzLjg3NzQ1MF0gTW9kdWxlcyBs
aW5rZWQgaW46DQo+Pj4gWyAgIDMzLjg4MDQ3NF0gQ1BVOiA2IFBJRDogODEgQ29tbToga3dvcmtl
ci82OjEgTm90IHRhaW50ZWQgNS4xLjAtcmMyLTAxMTg2LWdhNTM0M2I4YTJjYTUtZGlydHkgIzM4
MA0KPj4+IFsgICAzMy44ODkyNjVdIEhhcmR3YXJlIG5hbWU6IEtoYWRhcyBWSU0yIChEVCkNCj4+
PiBbICAgMzMuODkzNDE5XSBXb3JrcXVldWU6IGV2ZW50cyBkcm1fc2NoZWRfam9iX3RpbWVkb3V0
DQo+Pj4gWy4uLl0NCj4+PiBbICAgMzMuOTAzMDY5XSBwYyA6IGRybV9zY2hlZF9pbmNyZWFzZV9r
YXJtYSsweDVjLzB4ZjANCj4+PiBbICAgMzMuOTA3ODk4XSBsciA6IGRybV9zY2hlZF9pbmNyZWFz
ZV9rYXJtYSsweDQ0LzB4ZjANCj4+PiBbLi4uXQ0KPj4+IFsgICAzMy45OTQ5MjRdIFByb2Nlc3Mg
a3dvcmtlci82OjEgKHBpZDogODEsIHN0YWNrIGxpbWl0ID0gMHgoX19fX3B0cnZhbF9fX18pKQ0K
Pj4+IFsgICAzNC4wMDE4MjJdIENhbGwgdHJhY2U6DQo+Pj4gWyAgIDM0LjAwNDI0Ml0gIGRybV9z
Y2hlZF9pbmNyZWFzZV9rYXJtYSsweDVjLzB4ZjANCj4+PiBbICAgMzQuMDA4NzI2XSAgcGFuZnJv
c3Rfam9iX3RpbWVkb3V0KzB4MTJjLzB4MWUwDQo+Pj4gWyAgIDM0LjAxMzEyMl0gIGRybV9zY2hl
ZF9qb2JfdGltZWRvdXQrMHg0OC8weGEwDQo+Pj4gWyAgIDM0LjAxNzQzOF0gIHByb2Nlc3Nfb25l
X3dvcmsrMHgxZTAvMHgzMjANCj4+PiBbICAgMzQuMDIxNDAyXSAgd29ya2VyX3RocmVhZCsweDQw
LzB4NDUwDQo+Pj4gWyAgIDM0LjAyNTAyNl0gIGt0aHJlYWQrMHgxMjQvMHgxMjgNCj4+PiBbICAg
MzQuMDI4MjE4XSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgNCj4+PiBbICAgMzQuMDMxNzU1XSBD
b2RlOiBmOTQwMDAwMSA1NDAwMDFjMCBmOTQwMGE4MyBmOTQwMjQwMiAoZjk0MDFjNjQpDQo+Pj4g
WyAgIDM0LjAzNzc5Ml0gLS0tWyBlbmQgdHJhY2UgYmUzZmQ2Zjc3ZjRkZjI2NyBdLS0tDQo+Pj4N
Cj4+Pg0KPj4+IFdoZW4gSSByZXZlcnQgWzNdIG9uIFsxXSwgaSBnZXQgdGhlIHNhbWUgY3Jhc2gg
YXMgWzJdLCBtZWFuaW5nDQo+Pj4gdGhlIGNvbW1pdCBbM10gbWFza3MgdGhlIGZhaWx1cmUgWzJd
IGludHJvZHVjZWQuDQo+Pj4NCj4+PiBEbyB5b3Uga25vdyBob3cgdG8gc29sdmUgdGhpcyA/DQo+
Pj4NCj4+PiBUaGFua3MsDQo+Pj4gTmVpbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B734586DF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 18:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD9D6E063;
	Thu, 27 Jun 2019 16:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2771989262
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 16:19:16 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1916.namprd12.prod.outlook.com (10.175.91.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 27 Jun 2019 16:19:14 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 16:19:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Topic: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Index: AQHVLPGOv8ZFH37+40SwLhEqcDKxyqavrjOA
Date: Thu, 27 Jun 2019 16:19:14 +0000
Message-ID: <41b33cc3-2f07-681a-5fee-25a328de46bd@amd.com>
References: <20190627140626.GA6027@mwanda>
In-Reply-To: <20190627140626.GA6027@mwanda>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::27)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2206f933-980a-4481-fd41-08d6fb1b31f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1916; 
x-ms-traffictypediagnostic: DM5PR12MB1916:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB19166282DE413C0AEE21D74A83FD0@DM5PR12MB1916.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(366004)(396003)(136003)(189003)(199004)(66574012)(316002)(6306002)(6436002)(64126003)(446003)(6512007)(486006)(8936002)(81166006)(81156014)(68736007)(8676002)(966005)(6486002)(6916009)(305945005)(31686004)(2616005)(256004)(7736002)(5660300002)(54906003)(102836004)(58126008)(476003)(14444005)(478600001)(65826007)(72206003)(11346002)(73956011)(36756003)(66946007)(2906002)(66446008)(64756008)(52116002)(76176011)(6116002)(66556008)(66476007)(229853002)(14454004)(6246003)(31696002)(71190400001)(25786009)(46003)(86362001)(71200400001)(4326008)(99286004)(65956001)(65806001)(186003)(6506007)(386003)(53936002)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1916;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OQfqtnHx0P8znEQQb5Jk5+2YjnWrNco3OtmAZXfV2Hrz4uoBMlh2fspuLE+WYpzV3/NjWiIcarkqBZ6G1uafVxcmh1MWpzcwaW2PicNkm3Drlw2mdtymw9HctpIHy5UHlb8qEJnRUuOsiUruPA1SRkKCwOJCLnO1VvYGybmi3WM9PS33CiAdvekMyR84ZD5jK3nt329hqsveMBWY1Z5jQdQ8EnFiuHidYPtTMT6qk6mQ3ILNwG3XjvKILzHTuE/S2tBbBeyqcfJ736eNL06ox0Zs/NSP/ot7hA+PEVfhwMemyWnO/ybqCb0BLLtMfrGtBoIFeBwQP/D+T5sfCYUVbsplEqqRB9ERnydPFX+DpkwsPXLAvMFqFZWUbk9RgQMfQiHgelfsNBe7r7yuKsQk0fwETlt5hJXhLpfQImvULCU=
Content-ID: <A5A93EF24C2B494488B0CED6379F3071@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2206f933-980a-4481-fd41-08d6fb1b31f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 16:19:14.4299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1916
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxApejPYmXD5XLoIvAwPIvYWUPDmpWJtPPj7ynu2KyU=;
 b=bkZnFl+Ky/4rAWud8CXmUiowxsrVcs7/Qh5ClFAFuGAXP7HUNTBi6NuJi7BeBiR4P/6cMZ6E7UNUgaIW2jgnMGEqPDWNBvPvGAhp/O79lm5g7YUC9NvS+Zc1tk7/3NdEYSSbx8O9HfF8iDp5IY/I0lGbZKW3+WiicqhuE/P6Blo=
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
Cc: Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDYuMTkgdW0gMTY6MDYgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBIZWxsbyBDaHJp
c3RpYW4gS8O2bmlnLA0KPg0KPiBUaGUgcGF0Y2ggNjQ4YmMzNTc0NzE2OiAiZHJtL3R0bTogYWRk
IHRyYW5zcGFyZW50IGh1Z2UgcGFnZSBzdXBwb3J0DQo+IGZvciBETUEgYWxsb2NhdGlvbnMgdjIi
IGZyb20gSnVsIDYsIDIwMTcsIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcNCj4gc3RhdGljIGNoZWNr
ZXIgd2FybmluZzoNCj4NCj4gCWRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1h
LmM6MzE0IF9fdHRtX2RtYV9hbGxvY19wYWdlKCkNCj4gCWVycm9yOiAndmFkZHInIGNhbWUgZnJv
bSBkbWFfYWxsb2NfY29oZXJlbnQoKSBzbyB3ZSBjYW4ndCBkbyB2aXJ0X3RvX3BoeXMoKQ0KPg0K
PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jDQo+ICAgICAyOTUgIHN0
YXRpYyBzdHJ1Y3QgZG1hX3BhZ2UgKl9fdHRtX2RtYV9hbGxvY19wYWdlKHN0cnVjdCBkbWFfcG9v
bCAqcG9vbCkNCj4gICAgIDI5NiAgew0KPiAgICAgMjk3ICAgICAgICAgIHN0cnVjdCBkbWFfcGFn
ZSAqZF9wYWdlOw0KPiAgICAgMjk4ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXR0cnMgPSAwOw0K
PiAgICAgMjk5ICAgICAgICAgIHZvaWQgKnZhZGRyOw0KPiAgICAgMzAwDQo+ICAgICAzMDEgICAg
ICAgICAgZF9wYWdlID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IGRtYV9wYWdlKSwgR0ZQX0tFUk5F
TCk7DQo+ICAgICAzMDIgICAgICAgICAgaWYgKCFkX3BhZ2UpDQo+ICAgICAzMDMgICAgICAgICAg
ICAgICAgICByZXR1cm4gTlVMTDsNCj4gICAgIDMwNA0KPiAgICAgMzA1ICAgICAgICAgIGlmIChw
b29sLT50eXBlICYgSVNfSFVHRSkNCj4gICAgIDMwNiAgICAgICAgICAgICAgICAgIGF0dHJzID0g
RE1BX0FUVFJfTk9fV0FSTjsNCj4gICAgIDMwNw0KPiAgICAgMzA4ICAgICAgICAgIHZhZGRyID0g
ZG1hX2FsbG9jX2F0dHJzKHBvb2wtPmRldiwgcG9vbC0+c2l6ZSwgJmRfcGFnZS0+ZG1hLA0KPiAg
ICAgMzA5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvb2wtPmdmcF9mbGFncywg
YXR0cnMpOw0KPiAgICAgMzEwICAgICAgICAgIGlmICh2YWRkcikgew0KPiAgICAgMzExICAgICAg
ICAgICAgICAgICAgaWYgKGlzX3ZtYWxsb2NfYWRkcih2YWRkcikpDQo+ICAgICAzMTIgICAgICAg
ICAgICAgICAgICAgICAgICAgIGRfcGFnZS0+cCA9IHZtYWxsb2NfdG9fcGFnZSh2YWRkcik7DQo+
ICAgICAzMTMgICAgICAgICAgICAgICAgICBlbHNlDQo+ICAgICAzMTQgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRfcGFnZS0+cCA9IHZpcnRfdG9fcGFnZSh2YWRkcik7DQo+DQo+IENocmlzdG9w
aCB3YXMgZXhwbGFpbmluZyB0aGlzIGVhcmxpZXIgYW5kIEkgZG9uJ3QgdGhpbmsgaXQncyBzdWZm
aWNpZW50DQo+IHRvIGp1c3QgY2hlY2sgaXNfdm1hbGxvY19hZGRyKCkuICBTZWUgaHR0cHM6Ly9s
a21sLm9yZy9sa21sLzIwMTkvNi8xNy8xNTUNCj4gQXBwYXJlbnRseSB0aGUgdmFkZHIgbWlnaHQg
bm90IGhhdmUgYSBwYWdlIGJhY2tpbmcuLi4NCg0KVGhhdCBzdHVmZiB3YXMgY29waWVkIGZyb20g
dGhlIG9sZGVyIG5vbi1odWdlIHBhZ2UgY29kZSBhbmQgSSBhY3R1YWxseSANCnRoaW5rIGl0IGlz
IGNvcnJlY3QuDQoNCklmIG5vdCB0aGVuIHRoZSByZWFsIHF1ZXN0aW9uIGlzIGhvdyB0byBjb3Jy
ZWN0bHkgZ2V0IHRoZSBiYWNraW5nIHBhZ2UgDQpmcm9tIGRtYV9hbGxvY19hdHRycygpLg0KDQpD
aHJpc3RpYW4uDQoNCj4NCj4gKEkgYW0gYSBuZXdiaWUgdG8gdGhpcyBzbyBJIG1heSBiZSB3cm9u
ZyBvciBoYXZlIG1pc3VuZGVyc3Rvb2QgYWxzbykuDQo+DQo+ICAgICAzMTUgICAgICAgICAgICAg
ICAgICBkX3BhZ2UtPnZhZGRyID0gKHVuc2lnbmVkIGxvbmcpdmFkZHI7DQo+ICAgICAzMTYgICAg
ICAgICAgICAgICAgICBpZiAocG9vbC0+dHlwZSAmIElTX0hVR0UpDQo+ICAgICAzMTcgICAgICAg
ICAgICAgICAgICAgICAgICAgIGRfcGFnZS0+dmFkZHIgfD0gVkFERFJfRkxBR19IVUdFX1BPT0w7
DQo+ICAgICAzMTggICAgICAgICAgfSBlbHNlIHsNCj4gICAgIDMxOSAgICAgICAgICAgICAgICAg
IGtmcmVlKGRfcGFnZSk7DQo+ICAgICAzMjAgICAgICAgICAgICAgICAgICBkX3BhZ2UgPSBOVUxM
Ow0KPiAgICAgMzIxICAgICAgICAgIH0NCj4gICAgIDMyMiAgICAgICAgICByZXR1cm4gZF9wYWdl
Ow0KPiAgICAgMzIzICB9DQo+DQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

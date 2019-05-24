Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B329591
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AA86E04B;
	Fri, 24 May 2019 10:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972B66E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:18:13 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2519.namprd12.prod.outlook.com (52.132.141.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Fri, 24 May 2019 10:18:11 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.018; Fri, 24 May 2019
 10:18:11 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Thomas Hellstrom <thomas@shipmail.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEghVWyfc42SAm0iQ56wuAPU/AaZ589eAgAAJjQCAAAwvAIAABk4A
Date: Fri, 24 May 2019 10:18:11 +0000
Message-ID: <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
In-Reply-To: <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR0502CA0011.eurprd05.prod.outlook.com
 (2603:10a6:203:91::21) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 374cb64e-7a44-4228-9f00-08d6e0311fb7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2519; 
x-ms-traffictypediagnostic: DM5PR12MB2519:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB2519223803F9A670931FE2D183020@DM5PR12MB2519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(346002)(376002)(396003)(136003)(189003)(199004)(966005)(6436002)(46003)(53936002)(86362001)(446003)(11346002)(5660300002)(316002)(65826007)(2616005)(476003)(478600001)(6246003)(186003)(31686004)(14454004)(486006)(72206003)(66574012)(6486002)(71190400001)(31696002)(71200400001)(6116002)(68736007)(256004)(64126003)(7736002)(65956001)(14444005)(2906002)(66556008)(6306002)(386003)(6506007)(6512007)(53546011)(102836004)(305945005)(64756008)(65806001)(66476007)(81156014)(81166006)(8676002)(58126008)(2501003)(229853002)(66446008)(99286004)(4326008)(73956011)(66946007)(76176011)(110136005)(36756003)(8936002)(25786009)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2519;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WrWFd9AehMHKmfwfK5ilPIPlIFT2PbZZ6K6clFraT37cc4VhnaX6sLSrddkNkgVg/7ljsI/AQ5sJfOP87A1ZronMICZrIun+Fdbe8hBZIcoA77txulhentumo9qjMFG62v2Wheh7L4q252g27YdaGL2RCTkV5a5lXz/yxFqAZo18pYQBvSe1o9AeREs+s/sPmkfbK6ivlIMhMaXVST+b6lLAsdkZWQz9fNq8ojkd3fmTIhRPnnXoJfloLziSQb1/Sot1L0fYbPb75LnGrAUsKV2NFKKSN7mu9MYcjRbnqk8J8jnk89TYkRe0tGgKjFKGv03JbjPmhKWAuQ52Nc6fYgTbST3O8UunbCsqND2auOf+WsBee1thj5afHVK08I3RANRQNYcRB/moW/KT9d5g6sMAwco1nO3T488tBHcxlz4=
Content-ID: <A33267F4E33AA84E8582F594B67C8B1A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374cb64e-7a44-4228-9f00-08d6e0311fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 10:18:11.2863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWUgpfvs21t7px5nfR1xFK2MQzL72xd055DqtKn5wJc=;
 b=NgHjeL1tO+dVrbXJk2EdjOI673O/hUkfEaWdea/jWU9+vVaYSeNsQu6Ud9QBrzLOqVru3Gedkyi0df5GhwCo31fFJ/qL4hLTUwsDlgNl3+ATrXSaFbODm2x0qbhQW1KLsJcGQiSdRHWcRI0sKXEDK1T9CyNs/3Ci5WDs+2u8uvc=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDUuMTkgdW0gMTE6NTUgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOg0KPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IE9uIDUvMjQvMTkgMTE6MTEgQU0sIFRob21hcyBIZWxs
c3Ryb20gd3JvdGU6DQo+PiBIaSwgQ2hyaXN0aWFuLA0KPj4NCj4+IE9uIDUvMjQvMTkgMTA6Mzcg
QU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+IEFtIDI0LjA1LjE5IHVtIDEwOjExIHNj
aHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6DQo+Pj4+IFtDQVVUSU9OOiBFeHRlcm5h
bCBFbWFpbF0NCj4+Pj4NCj4+Pj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2
bXdhcmUuY29tPg0KPj4+Pg0KPj4+PiBXaXRoIFNFViBlbmNyeXB0aW9uLCBhbGwgRE1BIG1lbW9y
eSBtdXN0IGJlIG1hcmtlZCBkZWNyeXB0ZWQNCj4+Pj4gKEFLQSAic2hhcmVkIikgZm9yIGRldmlj
ZXMgdG8gYmUgYWJsZSB0byByZWFkIGl0LiBJbiB0aGUgZnV0dXJlIHdlDQo+Pj4+IG1pZ2h0DQo+
Pj4+IHdhbnQgdG8gYmUgYWJsZSB0byBzd2l0Y2ggbm9ybWFsIChlbmNyeXB0ZWQpIG1lbW9yeSB0
byBkZWNyeXB0ZWQgaW4NCj4+Pj4gZXhhY3RseQ0KPj4+PiB0aGUgc2FtZSB3YXkgYXMgd2UgaGFu
ZGxlIGNhY2hpbmcgc3RhdGVzLCBhbmQgdGhhdCB3b3VsZCByZXF1aXJlDQo+Pj4+IGFkZGl0aW9u
YWwNCj4+Pj4gbWVtb3J5IHBvb2xzLiBCdXQgZm9yIG5vdywgcmVseSBvbiBtZW1vcnkgYWxsb2Nh
dGVkIHdpdGgNCj4+Pj4gZG1hX2FsbG9jX2NvaGVyZW50KCkgd2hpY2ggaXMgYWxyZWFkeSBkZWNy
eXB0ZWQgd2l0aCBTRVYgZW5hYmxlZC4NCj4+Pj4gU2V0IHVwDQo+Pj4+IHRoZSBwYWdlIHByb3Rl
Y3Rpb24gYWNjb3JkaW5nbHkuIERyaXZlcnMgbXVzdCBkZXRlY3QgU0VWIGVuYWJsZWQgYW5kDQo+
Pj4+IHN3aXRjaA0KPj4+PiB0byB0aGUgZG1hIHBhZ2UgcG9vbC4NCj4+Pj4NCj4+Pj4gVGhpcyBw
YXRjaCBoYXMgbm90IHlldCBiZWVuIHRlc3RlZC4gQXMgYSBmb2xsb3ctdXAsIHdlIG1pZ2h0IHdh
bnQgdG8NCj4+Pj4gY2FjaGUgZGVjcnlwdGVkIHBhZ2VzIGluIHRoZSBkbWEgcGFnZSBwb29sIHJl
Z2FyZGxlc3Mgb2YgdGhlaXIgY2FjaGluZw0KPj4+PiBzdGF0ZS4NCj4+PiBUaGlzIHBhdGNoIGlz
IHVubmVjZXNzYXJ5LCBTRVYgc3VwcG9ydCBhbHJlYWR5IHdvcmtzIGZpbmUgd2l0aCBhdCBsZWFz
dA0KPj4+IGFtZGdwdSBhbmQgSSB3b3VsZCBleHBlY3QgdGhhdCBpdCBhbHNvIHdvcmtzIHdpdGgg
b3RoZXIgZHJpdmVycyBhcyANCj4+PiB3ZWxsLg0KPj4+DQo+Pj4gQWxzbyBzZWUgdGhpcyBwYXRj
aDoNCj4+Pg0KPj4+IGNvbW1pdCA2NGUxZjgzMGVhNWIzNTE2YTQyNTZlZDFjNTA0YTI2NWQ3ZjJh
NjVjDQo+Pj4gQXV0aG9yOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQo+Pj4gRGF0ZTrCoMKgIFdlZCBNYXIgMTMgMTA6MTE6MTkgMjAxOSArMDEwMA0KPj4+DQo+
Pj4gwqDCoMKgwqDCoCBkcm06IGZhbGxiYWNrIHRvIGRtYV9hbGxvY19jb2hlcmVudCB3aGVuIG1l
bW9yeSBlbmNyeXB0aW9uIGlzDQo+Pj4gYWN0aXZlDQo+Pj4NCj4+PiDCoMKgwqDCoMKgIFdlIGNh
bid0IGp1c3QgbWFwIGFueSByYW5kb21lIHBhZ2Ugd2UgZ2V0IHdoZW4gbWVtb3J5DQo+Pj4gZW5j
cnlwdGlvbiBpcw0KPj4+IMKgwqDCoMKgwqAgYWN0aXZlLg0KPj4+DQo+Pj4gwqDCoMKgwqDCoCBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+Pj4gwqDCoMKgwqDCoCBBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPg0KPj4+IMKgwqDCoMKgwqAgTGluazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMDg1MDgzMy8NCj4+Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4gQ2hyaXN0aWFuLg0K
Pj4NCj4+IFllcywgSSBub3RpY2VkIHRoYXQuIEFsdGhvdWdoIEkgZmFpbCB0byBzZWUgd2hlcmUg
d2UgYXV0b21hZ2ljYWxseQ0KPj4gY2xlYXIgdGhlIFBURSBlbmNyeXB0ZWQgYml0IHdoZW4gbWFw
cGluZyBjb2hlcmVudCBtZW1vcnk/IEZvciB0aGUNCj4+IGxpbmVhciBrZXJuZWwgbWFwLCB0aGF0
J3MgZG9uZSB3aXRoaW4gZG1hX2FsbG9jX2NvaGVyZW50KCkgYnV0IGZvcg0KPj4ga2VybmVsIHZt
YXBzIGFuZCBhbmQgdXNlci1zcGFjZSBtYXBzPyBJcyB0aGF0IGRvbmUgYXV0b21hdGljYWxseSBi
eQ0KPj4gdGhlIHg4NiBwbGF0Zm9ybSBsYXllcj8NCg0KWWVzLCBJIHRoaW5rIHNvLiBIYXZlbid0
IGxvb2tlZCB0byBjbG9zZWx5IGF0IHRoaXMgZWl0aGVyLg0KDQo+Pg0KPj4gL1Rob21hcw0KPj4N
Cj4gQW5kLCBhcyBhIGZvbGxvdyB1cCBxdWVzdGlvbiwgd2h5IGRvIHdlIG5lZWQgZG1hX2FsbG9j
X2NvaGVyZW50KCkgd2hlbg0KPiB1c2luZyBTTUU/IEkgdGhvdWdodCB0aGUgaGFyZHdhcmUgcGVy
Zm9ybXMgdGhlIGRlY3J5cHRpb24gd2hlbiBETUEtaW5nDQo+IHRvIC8gZnJvbSBhbiBlbmNyeXB0
ZWQgcGFnZSB3aXRoIFNNRSwgYnV0IG5vdCB3aXRoIFNFVj8NCg0KSSB0aGluayB0aGUgaXNzdWUg
d2FzIHRoYXQgdGhlIERNQSBBUEkgd291bGQgdHJ5IHRvIHVzZSBhIGJvdW5jZSBidWZmZXIgDQpp
biB0aGlzIGNhc2UuDQoNCkNocmlzdGlhbi4NCg0KPg0KPiBUaGFua3MsIFRob21hcw0KPg0KPg0K
Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

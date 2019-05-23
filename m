Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF127B86
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 13:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0070889CE1;
	Thu, 23 May 2019 11:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274EB89CE1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 11:16:09 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2472.namprd12.prod.outlook.com (52.132.141.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Thu, 23 May 2019 11:16:06 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.018; Thu, 23 May 2019
 11:16:06 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v8
Thread-Topic: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v8
Thread-Index: AQHVEJFiz9NM5rNUykq60O9fx2wdD6Z3AicAgAGOfgA=
Date: Thu, 23 May 2019 11:16:06 +0000
Message-ID: <d3cfa8f4-7719-9f84-38c8-9b4c897ce457@amd.com>
References: <20190515143831.1639-1-christian.koenig@amd.com>
 <20190522081949.GU21222@phenom.ffwll.local>
 <c7324bd8-e003-207e-af80-96bcbdf8870a@gmail.com>
 <CAKMK7uHL6pouBwM3-srbdBUOD1BbWFobiALp3VVu3ohyFEK9bQ@mail.gmail.com>
 <CAKMK7uHJyK9G5cVjNqAu1Z1qhYjYqsNhjfvZqxdsGjMOsqd8aQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHJyK9G5cVjNqAu1Z1qhYjYqsNhjfvZqxdsGjMOsqd8aQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::22) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fea93a7-6fea-438d-9e2e-08d6df700ca4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2472; 
x-ms-traffictypediagnostic: DM5PR12MB2472:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB24726F7883F4479E55E8414E83010@DM5PR12MB2472.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(366004)(39860400002)(189003)(199004)(81156014)(587094005)(5660300002)(229853002)(6486002)(73956011)(81166006)(66476007)(64756008)(66446008)(14454004)(71200400001)(66946007)(66556008)(68736007)(71190400001)(8676002)(11346002)(446003)(25786009)(2906002)(305945005)(4326008)(99286004)(2616005)(8936002)(476003)(386003)(31686004)(46003)(53386004)(102836004)(6306002)(966005)(72206003)(6916009)(6436002)(7736002)(6512007)(6506007)(58126008)(478600001)(53936002)(486006)(6246003)(6116002)(316002)(65806001)(65956001)(86362001)(76176011)(65826007)(31696002)(64126003)(186003)(256004)(36756003)(52116002)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2472;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zG4MkBxOgBP9jgKWMnv5qKKuArUIJE7jiV/E25GqVbxPcOWsxGCVQr9RKk/2MS/ruDmkOtLWI6Sa1EFxlOxrNNtA8NYT3QZilDwF8yE+KMy316A91GkkPHebSEQ6JVf4Ju3Q5f6O6FowJUG5g1Phepm3Ya1SclopcdhkAiD2jiRRDVm7+wrWkhRGN0BZ14nrk1o3ETpdRDLI5rqd5PIsqnQcvgY709Z3DXMc+oUHD3C7TB2JNPBgj4SpXTnbVOFVT5psstnmuWyBzQJ9cPKqKLcBDNBdUkV10zZkpNLucXAB/XIMBSgTCq1AvVWgfn7m3SPRg7tC1CzAfzJFkzrsy9EZczYgEiJ9ct7N8VZqO02HA9M0xQQamZI+b5WhTy3C7iaK7ahs2jVEZpizmapo5z00yXbcrJN2ThMisGOflKA=
Content-ID: <9AFC5EC6D1886C4287962F9C545E5C8B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fea93a7-6fea-438d-9e2e-08d6df700ca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 11:16:06.4402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2472
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETeeMcLHG7IfiDBWCH/1ypDRCDVboyD0DAxx3Ouq9uo=;
 b=wddQ8t4sYLJG0RThDqMA65cZeO69yyOOhedD178HK5iV3h5MbJAASeHxMweH/yHR0NMYjiAPR/5cB32yFHZAuemz5W2eED9Uy54P6ERp/qz48SRY6wvTueWcwUludtcxiEdEfGzrNJfnPMVRrr7w243ijW/jxhHwZR5nliXNCy0=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDUuMTkgdW0gMTM6Mjkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbU05JUF0NCj4g
Rm9yZ290IHRvIGFkZDogSWlyYyBpdCB3YXMgYnVmZmVyIHNoYXJpbmcgYmV0d2VlbiBpOTE1IGFu
ZCBhbWRncHUgdGhhdA0KPiBoaXRzIHRoaXMuIENhbid0IHNheSBmb3Igc3VyZSBzaW5jZSBpbnRl
bC1nZnggaXNuJ3QgY2MnZWQgb24gdGhpcw0KPiB2ZXJzaW9uLCBzbyBvdXIgQ0kgaGFzbid0IHBp
Y2tlZCB0aGlzIHVwLg0KDQpJJ3ZlIGNoYW5nZWQgdGhpcyBzbyB0aGF0IHdoZW4gZXhwb3J0ZXIv
aW1wb3J0ZXIgZGlzYWdyZWUgb24gZHluYW1pYyANCmhhbmRsaW5nIHdlIGFsd2F5cyBjYWNoZSB0
aGUgc2d0IGR1cmluZyB0aGUgYXR0YWNobWVudCBwcm9jZXNzLg0KDQpHb2luZyB0byBDQyBpbnRl
bC1nZnggb24gdGhlIG5leHQgdmVyc2lvbi4NCg0KPiAtRGFuaWVsDQo+DQo+Pj4+PiArICAgICAg
ICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3Q7DQo+Pj4+PiArDQo+Pj4+PiArICAgICAgICAgICAg
c2d0ID0gZG1hYnVmLT5vcHMtPm1hcF9kbWFfYnVmKGF0dGFjaCwgRE1BX0JJRElSRUNUSU9OQUwp
Ow0KPj4+PiBBbmQgdW5mb3J0dW5hdGVseSB0aGUgbm9uLWR5bmFtaWMsIGkuZS4gbGVnYWN5L2N1
cnJlbnQgY29kZSBpbXBvcnRlciBpcw0KPj4+PiBhbHNvIHRoZSBvbmUgd2hpY2ggdXNlcyBvdGhl
ciBmbGFncyB0aGFuIERNQV9CSURJUkVDVElPTkFMLiBBdCBsZWFzdCBvbg0KPj4+PiBBUk0sIGFu
ZCB0aGF0J3MgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgdGhpcyBtYXR0ZXJzIGJlY2F1c2UgdGhlcmUg
dGhlIGRtYQ0KPj4+PiBhcGkgbWlnaHQgZG8gY2FjaGUgZmx1c2hpbmcuDQo+Pj4gV2VsbCB0aGUg
b25seSBpbXBsZW1lbnRlciBmb3Igbm93IGlzIGFtZGdwdSwgYW5kIGFtZGdwdSBhbHdheXMgcmVx
dWlyZXMNCj4+PiBhIGNvaGVyZW50IGJpZGlyZWN0aW9uYWwgbWFwcGluZy4NCj4+Pg0KPj4+IFNv
IHRoaXMgd29uJ3QgYmUgYSBwcm9ibGVtIHVubGVzcyB0aGUgQVJNIGRyaXZlcnMgc3RhcnQgdG8g
aW1wbGVtZW50DQo+Pj4gZHluYW1pYyBETUEtYnVmIGhhbmRsaW5nIHRoZW1zZWx2ZXMgb3Igc3Rh
cnQgdG8gdGFsayB0byBhbWRncHUgKHdoaWNoDQo+Pj4gd291bGRuJ3QgaGF2ZSB3b3JrZWQgYmVm
b3JlIGFueXdheSkuDQo+PiBIbSwgZmVlbHMgYSBiaXQgZXZpbC4gSSBqdXN0IGhlYXJkIGEgc29t
ZSBzb2MgcGVvcGxlIHRlbGwgbWUgdGhhdCBkcm0NCj4+IGlzbid0IGNvb2wgYmVjYXVzZSBpdCBs
aWtlcyB0byBpZ25vcmUgc29jIGF0IHRoZSBleHBlbnNpdmUgb2YgeDg2Lg0KPj4NCj4+IE90b2gg
SSBkb24ndCBzZWUgYSB3YXkgb3V0IGVpdGhlciwgYW5kIG1heWJlIHRoaXMgd2lsbCBiZSBtb3Rp
dmF0aW9uDQo+PiBlbm91Z2ggdG8gbWFrZSB0aGUgZG1hLWFwaSBjYWNoZSBtYW5hZ2VtZW50IGEg
Yml0IG1vcmUgZXhwbGljaXQuIE5vdA0KPj4gdGhhdCBJIGV4cGVjdCBtdWNoIGNoYW5nZSB0aGVy
ZSAuLi4NCg0KQWN0dWFsbHkgaXQncyBub3QgZXZpbCBhdCBhbGwsIHNlZSB0aG9zZSBleHBvcnRl
cnMvaW1wb3J0ZXJzIGNvdWxkIA0KaW1wbGVtZW50IHRoZSBjYWxsYmFja3MgZm9yIGR5bmFtaWMg
aGFuZGxpbmcgYXMgd2VsbCBhbmQgdGhlIHByb2JsZW0gb2YgDQp0aGUgY2FjaGluZyB3b3VsZG4n
dCBhcHBlYXIgZWl0aGVyLg0KDQpDaHJpc3RpYW4uDQoNCj4+IC1EYW5pZWwNCj4+IC0tDQo+PiBE
YW5pZWwgVmV0dGVyDQo+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24NCj4+
ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gNCj4NCj4NCj4gLS0N
Cj4gRGFuaWVsIFZldHRlcg0KPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24N
Cj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D86AAFE47
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 16:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966DE6EB0A;
	Wed, 11 Sep 2019 14:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F5A6EB0A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 14:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bW4pLS1zWgZ0K/xDpfweDgAttNWYmtrkjZZXiW0DWHUoIxu2pf3VrzwloLyhS7mz4epTDnKpO/5Dop5/Ww63FManJ+PaL2YVgZpRUe0zoYPWuWO7sByHsrxyDFe6JRoTld8j30O59dcqIYlaQulULZKe0+Xb3CRCRUtdqVC1MT1YWpWvTvzY0cj2fdWh3oNUfLobIB+H6YncHptJZZnx7te3MM8NeQMYOg36WhbV1N+rxi8sjSkYP5n1ntOvox9suXQ2PCdpyZrAFwUWFuq9/hNrRJoGGook28mbUsl4cYJ8AsKWuxYceUB8La/rmVPktIAwkzli650FVwZWSVfiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMlkIAissU4k9iS0at8VFAlx6JS5XiE4joYoXMsszs4=;
 b=auWopRf8icGEBOhWLCeEwyUcHMCzqD1C8at9N8ik5qwe6iSWLfVm8HC3dojYgb0RWVdCSpiD+PfA13LUjHT9407e4xxM7POZHtFbuUolyOb2WNoJv266q6ie/B6pzZvMDfkZGAZofVI6F1uHBEP0lJAfzVTDsllqFlP3VOHSB8U9ia73rIcDPBbsbsvM60KSaDUY3sVX+xTXXOhGQVatL58/iUbk8cjMxYPPpo/9A+AGWDVYfntx8prYjzu5r7jVinFIBJAlRLFiv/tnY/lwuo9sRSu84/KNGxmHxAYdwA7EtU6zAjabFX+NlB5m6xzFdF5OTZkMgWMfPIZS2wgs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1788.namprd12.prod.outlook.com (10.175.86.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 14:06:03 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 14:06:03 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas_os@shipmail.org>
Subject: Re: TTM huge page-faults WAS: Re: [RFC PATCH 1/2] x86: Don't let
 pgprot_modify() change the page encryption bit
Thread-Topic: TTM huge page-faults WAS: Re: [RFC PATCH 1/2] x86: Don't let
 pgprot_modify() change the page encryption bit
Thread-Index: AQHVY9W/NbX8l5jE2EqdnkeqDdb24qcdIPeAgAAShQCAAADnAIAH6LoAgAA2koCAAOVxgIAAEXGAgABB0YA=
Date: Wed, 11 Sep 2019 14:06:03 +0000
Message-ID: <ea486b68-7751-e51f-5a59-7e1f145820f4@amd.com>
References: <20190905103541.4161-1-thomas_os@shipmail.org>
 <20190905103541.4161-2-thomas_os@shipmail.org>
 <608bbec6-448e-f9d5-b29a-1984225eb078@intel.com>
 <b84d1dca-4542-a491-e585-a96c9d178466@shipmail.org>
 <20190905152438.GA18286@infradead.org>
 <10185AAF-BFB8-4193-A20B-B97794FB7E2F@amacapital.net>
 <92171412-eed7-40e9-2554-adb358e65767@shipmail.org>
 <d6da6e46-d283-9efc-52cb-9f2a6b0b7188@amd.com>
 <cace2653-447f-bcdc-2714-142d9dc85787@shipmail.org>
In-Reply-To: <cace2653-447f-bcdc-2714-142d9dc85787@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::33) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6228f08-a562-4d2c-fd33-08d736c12e6f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1788; 
x-ms-traffictypediagnostic: DM5PR12MB1788:
x-microsoft-antispam-prvs: <DM5PR12MB178858607C20AD61F82A77E883B10@DM5PR12MB1788.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(51444003)(189003)(199004)(486006)(476003)(2616005)(4326008)(446003)(31696002)(11346002)(6486002)(31686004)(6436002)(66574012)(99286004)(186003)(229853002)(102836004)(52116002)(386003)(76176011)(6506007)(25786009)(65806001)(65956001)(86362001)(316002)(5660300002)(46003)(54906003)(58126008)(6916009)(66946007)(478600001)(66446008)(64756008)(81166006)(66556008)(305945005)(66476007)(7736002)(71200400001)(71190400001)(14444005)(14454004)(256004)(36756003)(6512007)(81156014)(8936002)(6116002)(2906002)(6246003)(53936002)(8676002)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1788;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PFSJjm9DDU+Fzj7UGSecJcmKQxe9ZwsoIXYCRW2sUXMv8pLVKFo2rNc54tQGm1jSc99geJ+PZ2hySC7YfkVadrHxHYjB3lBbXZTUD/NoRkc5ky2sgeMbVqE40Y77g6m6OueRs8xd76tcC7ctzcDLQK53esPBZgiE75nJ/wrX53xFBSFi1GnW3OGRrjNP6OKkIwC6rneI6UO6ochtVarGLjMO2je6C4HBpxfSuBDk7coRYH9zbmGzixwcI22qhHpBU0JoQJLfpmX9+SKXU43hnpckLGsmFLZPM4xxjPux8w07iYrQaJlZ70vdH6Xf8UgwdWVFdjJrU4OSatrPiPk6zPpmLUYk/AsI8AB2qSxja8t9kpIYIucqW315Jxzh7K5PdKPEuZBKrstSu+nOVnbNUNh3IdwtAR0n3/ZZu+tVgyU=
x-ms-exchange-transport-forked: True
Content-ID: <21B0DCCD446B4A418690745FEE536B37@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6228f08-a562-4d2c-fd33-08d736c12e6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 14:06:03.4542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8g/BUEJUGkj6Do+f6w44Kyef0g4mdKsuqOT0W8srxFMF6yr1sMMkRylpVUR0VqQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1788
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMlkIAissU4k9iS0at8VFAlx6JS5XiE4joYoXMsszs4=;
 b=qcKHO/PESyiufRvSj7prSqaUOAvdTB9DxJY0DxM2v9t+f/f1VxnGvLW/qO27rEnLudUPNLUCzKtFWz5vbdDd1W7yRGHe8Fi/1XNm71KJ+SG8mhYDKB3DB/MAw8lepLy/iE8iBWy62QoGfg1mv1uJ9wDimbOFiBfeCKSseeMA3H8=
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
Cc: "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDkuMTkgdW0gMTI6MTAgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToN
CltTTklQXQ0KPj4+IFRoZSBwcm9ibGVtIHNlZW4gaW4gVFRNIGlzIHRoYXQgd2Ugd2FudCB0byBi
ZSBhYmxlIHRvIGNoYW5nZSB0aGUNCj4+PiB2bV9wYWdlX3Byb3QgZnJvbSB0aGUgZmF1bHQgaGFu
ZGxlciwgYnV0IGl0J3MgcHJvYmxlbWF0aWMgc2luY2Ugd2UNCj4+PiBoYXZlIHRoZSBtbWFwX3Nl
bSB0eXBpY2FsbHkgb25seSBpbiByZWFkIG1vZGUuIEhlbmNlIHRoZSBmYWtlIHZtYQ0KPj4+IGhh
Y2suIEZyb20gd2hhdCBJIGNhbiB0ZWxsIGl0J3MgcmVhc29uYWJseSB3ZWxsLWJlaGF2ZWQsIHNp
bmNlDQo+Pj4gcHRlX21vZGlmeSgpIHNraXBzIHRoZSBiaXRzIFRUTSB1cGRhdGVzLCBzbyBtcHJv
dGVjdCgpIGFuZCBtcmVtYXAoKQ0KPj4+IHdvcmtzIE9LLiBJIHRoaW5rIHNwbGl0X2h1Z2VfcG1k
IG1heSBydW4gaW50byB0cm91YmxlLCBidXQgd2UgZG9uJ3QNCj4+PiBzdXBwb3J0IGl0ICh5ZXQp
IHdpdGggVFRNLg0KPj4gQWghIEkgYWN0dWFsbHkgcmFuIGludG8gdGhpcyB3aGlsZSBpbXBsZW1l
bnRpbmcgaHVnZSBwYWdlIHN1cHBvcnQgZm9yDQo+PiBUVE0gYW5kIG5ldmVyIGZpZ3VyZWQgb3V0
IHdoeSB0aGF0IGRvZXNuJ3Qgd29yay4gRHJvcHBlZCBDUFUgaHVnZSBwYWdlDQo+PiBzdXBwb3J0
IGJlY2F1c2Ugb2YgdGhpcy4NCj4NCj4gQnkgaW5jaWRlbnQsIEkgZ290IHNsaWdodGx5IHNpZGV0
cmFja2VkIHRoZSBvdGhlciBkYXkgYW5kIHN0YXJ0ZWQgDQo+IGxvb2tpbmcgYXQgdGhpcyBhcyB3
ZWxsLiBHb3QgdG8gdGhlIHBvaW50IHdoZXJlIEkgZmlndXJlZCBvdXQgYWxsIHRoZSANCj4gaGFp
cnkgYWxpZ25tZW50IGlzc3VlcyBhbmQgYWN0dWFsbHkgZ290IGh1Z2VfZmF1bHQoKSBjYWxscywg
YnV0IG5ldmVyIA0KPiBpbXBsZW1lbnRlZCB0aGUgaGFuZGxlci4gSSB0aGluayB0aGF0J3MgZGVm
aW5pdGVseSBzb21ldGhpbmcgd29ydGggDQo+IGhhdmluZy4gTm90IHN1cmUgaXQgd2lsbCB3b3Jr
IGZvciBJTyBtZW1vcnksIHRob3VnaCwgKHNwbGl0X2h1Z2VfcG1kIA0KPiB3aWxsIGp1c3Qgc2tp
cCBub24tcGFnZS1iYWNrZWQgbWVtb3J5KSBidXQgaWYgd2Ugb25seSBzdXBwb3J0IA0KPiBWTV9T
SEFSRUQgKG5vbiBDT1cpIHZtYXMgdGhlcmUncyBubyByZWFzb24gdG8gc3BsaXQgdGhlIGh1Z2Ug
cG1kcyANCj4gYW55d2F5LiBEZWZpbml0ZWx5IHNvbWV0aGluZyB3ZSBzaG91bGQgaGF2ZSBJTU8u
DQoNCldlbGwgb3VyIHByaW1hcnkgdXNlIGNhc2Ugd291bGQgYmUgSU8gbWVtb3J5LCBjYXVzZSBz
eXN0ZW0gbWVtb3J5IGlzIA0Kb25seSBvcHRpb25hbGx5IGFsbG9jYXRlIGFzIGh1Z2UgcGFnZSBi
dXQgd2UgbmVhcmx5IGFsd2F5cyBhbGxvY2F0ZSBWUkFNIA0KaW4gY2h1bmtzIG9mIGF0IGxlYXN0
IDJNQiBiZWNhdXNlIHdlIG90aGVyd2lzZSBnZXQgYSBodWdlIHBlcmZvcm1hbmNlIA0KcGVuYWx0
eS4NCg0KPj4+IFdlIGNvdWxkIHByb2JhYmx5IGdldCBhd2F5IHdpdGggYSBXUklURV9PTkNFKCkg
dXBkYXRlIG9mIHRoZQ0KPj4+IHZtX3BhZ2VfcHJvdCBiZWZvcmUgdGFraW5nIHRoZSBwYWdlIHRh
YmxlIGxvY2sgc2luY2UNCj4+Pg0KPj4+IGEpIFdlJ3JlIGxvY2tpbmcgb3V0IGFsbCBvdGhlciB3
cml0ZXJzLg0KPj4+IGIpIFdlIGNhbid0IHJhY2Ugd2l0aCBhbm90aGVyIGZhdWx0IHRvIHRoZSBz
YW1lIHZtYSBzaW5jZSB3ZSBob2xkIGFuDQo+Pj4gYWRkcmVzcyBzcGFjZSBsb2NrICgiYnVmZmVy
IG9iamVjdCByZXNlcnZhdGlvbiIpDQo+Pj4gYykgV2hlbiB3ZSBuZWVkIHRvIHVwZGF0ZSB0aGVy
ZSBhcmUgbm8gdmFsaWQgcGFnZSB0YWJsZSBlbnRyaWVzIGluIHRoZQ0KPj4+IHZtYSwgc2luY2Ug
aXQgb25seSBoYXBwZW5zIGRpcmVjdGx5IGFmdGVyIG1tYXAoKSwgb3IgYWZ0ZXIgYW4NCj4+PiB1
bm1hcF9tYXBwaW5nX3JhbmdlKCkgd2l0aCB0aGUgc2FtZSBhZGRyZXNzIHNwYWNlIGxvY2suIFdo
ZW4gYW5vdGhlcg0KPj4+IHJlYWRlciAoZm9yIGV4YW1wbGUgc3BsaXRfaHVnZV9wbWQoKSkgc2Vl
cyBhIHZhbGlkIHBhZ2UgdGFibGUgZW50cnksDQo+Pj4gaXQgYWxzbyBzZWVzIHRoZSBuZXcgcGFn
ZSBwcm90ZWN0aW9uIGFuZCB0aGluZ3MgYXJlIGZpbmUuDQo+PiBZZWFoLCB0aGF0J3MgZXhhY3Rs
eSB3aHkgSSBhbHdheXMgd29uZGVyZWQgd2h5IHdlIG5lZWQgdGhpcyBoYWNrIHdpdGgNCj4+IHRo
ZSB2bWEgY29weSBvbiB0aGUgc3RhY2suDQo+Pg0KPj4+IEJ1dCB0aGF0IHdvdWxkIHJlYWxseSBi
ZSBhIHNwZWNpYWwgY2FzZS4gVG8gc29sdmUgdGhpcyBwcm9wZXJseSB3ZSdkDQo+Pj4gcHJvYmFi
bHkgbmVlZCBhbiBhZGRpdGlvbmFsIGxvY2sgdG8gcHJvdGVjdCB0aGUgdm1fZmxhZ3MgYW5kDQo+
Pj4gdm1fcGFnZV9wcm90LCB0YWtlbiBhZnRlciBtbWFwX3NlbSBhbmQgaV9tbWFwX2xvY2suDQo+
PiBXZWxsIHdlIGFscmVhZHkgaGF2ZSBhIHNwZWNpYWwgbG9jayBmb3IgdGhpczogVGhlIHJlc2Vy
dmF0aW9uIG9iamVjdC4gU28NCj4+IG1lbW9yeSBiYXJyaWVycyBldGMgc2hvdWxkIGJlIGluIHBs
YWNlIGFuZCBJIGFsc28gdGhpbmsgd2UgY2FuIGp1c3QNCj4+IHVwZGF0ZSB0aGUgdm1fcGFnZV9w
cm90IG9uIHRoZSBmbHkuDQo+DQo+IEkgYWdyZWUuIFRoaXMgaXMgbmVlZGVkIGZvciBodWdlIHBh
Z2VzLiBXZSBzaG91bGQgbWFrZSB0aGlzIGNoYW5nZSwgDQo+IGFuZCBwZXJoYXBzIGFkZCB0aGUg
anVzdGlmaWNhdGlvbiBhYm92ZSBhcyBhIGNvbW1lbnQuDQoNCkFsdGVybmF0aXZlbHkgd2UgY291
bGQgaW50cm9kdWNlIGEgbmV3IFZNXyogZmxhZyB0ZWxsaW5nIHVzZXJzIG9mIA0Kdm1fcGFnZV9w
cm90IHRvIGp1c3QgbGV0IHRoZSBwYWdlcyB0YWJsZSBlbnRyaWVzIGJlIGZpbGxlZCBieSBmYXVs
dHMgYWdhaW4uDQoNCkNocmlzdGlhbi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

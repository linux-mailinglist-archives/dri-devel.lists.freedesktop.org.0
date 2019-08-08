Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBA86092
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 13:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40AB6E825;
	Thu,  8 Aug 2019 11:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710040.outbound.protection.outlook.com [40.107.71.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EA56E482;
 Thu,  8 Aug 2019 11:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbC7t1iByMzXCQOnwNxr34v19pneiJFQoQrwBVwPYvYzvLiq34CdjaWUkdfKv+JTDpbtjeucdVl1Mm7DQs7JVOaisYIKyjcal+e4v0/Vpcn9bdo70zVOajdUDMnsl72Yi/TnWIbeTUa0UpGfATreX2o3c3hY7DGofeFezitvYQIgt8jNqTGDpnWQxbdI7yQwuN8e3ATsmD/LZwUUBEK4YOJc83fWTnfjm3Xnbn8LMM194Z0BlPZ0wRzLu+8+lqQUlzD60pmO7z2RVD8fpXLAa2431iNmndIQ8TTluiV+UMET1KBqkURl+EgNYjEPaYU5UF+b+pXhty3wDncEODMFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSpGIpa7gdqDJORjDD2PTXdctF1xnmUtB5s+Sc/nVhE=;
 b=Z0CX8rRAKsS41/UC2q28QeSCiFGUBurb3R/TmQC1d3bzFN1I3/QYbdI0BkzbcFaUo/0AZkAOTVJ8T1C8nFOnztg0DNv5OrwW/aIRUbJkzHdDpyrzEwycnPVS4DJYQIuM6jxMclfU2P6YIIpG2Qqq6X4tBy3o6X9iu+JuVBCiKgeEuxMa0W7y42aH0Qz6b1TSzUxwlwfwL6MkUP7sHdNp7gaoA2sFFmqEd8+rvZoVqpG5FH8Tj61h08KmKzzSGogyQ1ZHv1KsQpoStIhpI7laX54msGreGhbMXSuJX6JO1bxWN7aHKSucraUJB8his2RIt8WtnSEGgtNhh0wCpByRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2566.namprd12.prod.outlook.com (52.132.141.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 11:05:39 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 11:05:39 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: =?utf-8?B?UmU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHNlcmllcyBzdGFydGlu?=
 =?utf-8?B?ZyB3aXRoIFsxLzZdIGRtYS1idWY6IGFkZCBkeW5hbWljIERNQS1idWYgaGFu?=
 =?utf-8?Q?dling_v13?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVzIHN0YXJ0aW5nIHdp?=
 =?utf-8?B?dGggWzEvNl0gZG1hLWJ1ZjogYWRkIGR5bmFtaWMgRE1BLWJ1ZiBoYW5kbGlu?=
 =?utf-8?Q?g_v13?=
Thread-Index: AQHVR32oPI9Y+501fUybpHgYLyDLD6bwPI8AgACk+gCAAAViAIAAPIAA
Date: Thu, 8 Aug 2019 11:05:39 +0000
Message-ID: <890117cc-21e6-dec1-7e42-ad0fea2a731f@amd.com>
References: <20190626122310.1498-1-christian.koenig@amd.com>
 <20190626133225.9081.7676@emeril.freedesktop.org>
 <41eab2c2-0592-1308-41a9-c76c887a6113@gmail.com>
 <20190731085502.GH7444@phenom.ffwll.local>
 <20190807211918.GJ7444@phenom.ffwll.local>
 <429e8c1a-55af-8e94-8e5d-0545c35f0beb@amd.com>
 <CAKMK7uG=7AqvJiS3Ooo2rE2WvRQpaRiRuPFdVgj=8A=7e1=VQw@mail.gmail.com>
In-Reply-To: <CAKMK7uG=7AqvJiS3Ooo2rE2WvRQpaRiRuPFdVgj=8A=7e1=VQw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96f4b080-63e7-46b1-0093-08d71bf05892
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2566; 
x-ms-traffictypediagnostic: DM5PR12MB2566:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB2566857A285AC39AF83C501083D70@DM5PR12MB2566.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(6116002)(6306002)(229853002)(6486002)(2906002)(6916009)(99286004)(66574012)(5660300002)(486006)(5024004)(14444005)(256004)(478600001)(86362001)(46003)(6436002)(2616005)(476003)(71190400001)(71200400001)(14454004)(966005)(446003)(52116002)(11346002)(386003)(53546011)(6506007)(31696002)(186003)(102836004)(76176011)(53936002)(4326008)(65826007)(25786009)(6246003)(66946007)(64756008)(31686004)(58126008)(66446008)(305945005)(7736002)(316002)(65806001)(6512007)(81166006)(36756003)(81156014)(64126003)(54906003)(66556008)(66476007)(65956001)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2566;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eZI8h5OVw0u5vtcXf+IyQuvzw6c6GIsnuPZ8WGwtS48eJPk8zCdTstoLThFAT/12QjxORCEZ3qc+Y+e3RbiT4Zd+IK6FbhxijXfJaLaLKGz6xuOmVUviQCQP4wKFKBT7utX7GVG7Jg7g/HQ48yj4bPg246BHOKCmiPGNxcXZGuLat6v0sttfJof2wTp2j8WZpruStidQgKLlKrku9XAWXgan2fUfplRGAd9n6CMnMmqaPGyNj7oVBtw94ZS176JwUsVtDE2iRLpb5mYLWiaO3z0a91k/Th/9pwlACcuU4PXyr/fN2U9dEoA5cCEYLjVR4PM0Rs+wzkmPkf5XQAvZBhxX96Et9sdGnjCjEND7gxL4FvNsHi7LEratrjhuvmXg9Bejgobe+fnmB8/DXZ8yap/6hzRJgmKVYyKw/mGstMw=
x-ms-exchange-transport-forked: True
Content-ID: <5366BC0D86047D489006610C2A3F1655@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f4b080-63e7-46b1-0093-08d71bf05892
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 11:05:39.6285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6J/wB1QfEvr9WpSxuxzgV7xbo+Gs9tEWg08jz5N4EaIq2QW7+bUDirQ75UI5iSkV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2566
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSpGIpa7gdqDJORjDD2PTXdctF1xnmUtB5s+Sc/nVhE=;
 b=Xjb0BDneLlXcJ2ugU4fF03Dxo9zkzrTn84Buco3mvVzy6FH4Ezrvorx3hqGj/y8Q2y/SoAAqhaENhH7Xf2v+kF/AVAA5omoIqMxEHpzh2NCprw3Wkx5BbsRk1xvh4X2LH+LaNEKO/bZGEpzaaU5OefzBaRuVFahV0PEFC25ZBb0=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDguMTkgdW0gMDk6Mjkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUaHUsIEF1
ZyA4LCAyMDE5IGF0IDk6MDkgQU0gS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6DQo+PiBBbSAwNy4wOC4xOSB1bSAyMzoxOSBzY2hyaWViIERhbmll
bCBWZXR0ZXI6DQo+Pj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTA6NTU6MDJBTSArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToNCj4+Pj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDk6Mjg6
MTFBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+Pj4+IEhpIERhbmllbCwNCj4+
Pj4+DQo+Pj4+PiB0aG9zZSBmYWlscyBsb29rIGxpa2Ugc29tZXRoaW5nIHJhbmRvbSB0byBtZSBh
bmQgbm90IHJlbGF0ZWQgdG8gbXkgcGF0Y2gNCj4+Pj4+IHNldC4gQ29ycmVjdD8NCj4+Pj4gRmly
c3Qgb25lIEkgbG9va2VkIGF0IGhhcyB0aGUgcmVzZXJ2YXRpb25fb2JqIGFsbCBvdmVyOg0KPj4+
Pg0KPj4+PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL1BhdGNod29y
a18xMzQzOC9maS1jbWwtdS9pZ3RAZ2VtX2V4ZWNfZmVuY2VAYmFzaWMtYnVzeS1kZWZhdWx0Lmh0
bWwNCj4+Pj4NCj4+Pj4gU28gNSBzZWNvbmQgZ3VlZXMgaXMgLi4uIHByb2JhYmx5IHJlYWw/DQo+
Pj4+DQo+Pj4+IE5vdGUgdGhhdCB3aXRoIHRoZSBlbnRpcmUgbG1lbSBzdHVmZiBnb2luZyBvbiBy
aWdodCBub3cgdGhlcmUncyBtYXNzaXZlDQo+Pj4+IGRpc2N1c3Npb25zIGFib3V0IGhvdyB3ZSdy
ZSBkb2luZyByZXN2X29iaiB2cyBvYmotPm1tLmxvY2sgdGhlIHdyb25nIHdheQ0KPj4+PiByb3Vu
ZCBpbiBpOTE1LCBzbyBJJ20gbm90IHN1cnByaXNlZCBhdCBhbGwgdGhhdCB5b3UgbWFuYWdlZCB0
byB0cmlwIHRoaXMuDQo+Pj4+DQo+Pj4+IFRoZSB3YXkgSSBzZWUgaXQgcmlnaHQgbm93IGlzIHRo
YXQgb2JqLT5tbS5sb2NrIG5lZWRzIHRvIGJlIGxpbWl0ZWQgdG8NCj4+Pj4gZGVhbGluZyB3aXRo
IHRoZSBpOTE1IHNocmlua2VyIGludGVyYWN0aW9ucyBvbmx5LCBhbmQgb25seSBmb3IgaTkxNSBu
YXRpdmUNCj4+Pj4gb2JqZWN0cy4gQW5kIGZvciBkbWEtYnVmcyB3ZSBuZWVkIHRvIG1ha2Ugc3Vy
ZSBpdCdzIG5vdCBhbnl3aGVyZSBpbiB0aGUNCj4+Pj4gY2FsbGNoYWluLiBVbmZvcnR1bmF0ZWx5
IHRoYXQncyBhIG1hc3NpdmUgcmVmYWN0b3IgSSBndWVzcyAuLi4NCj4+PiBUaG91Z2h0IGFib3V0
IHRoaXMgc29tZSBtb3JlLCBhc2lkZSBmcm9tIGp1c3QgYnJlYWtpbmcgaTkxNSBvciB3YWl0aW5n
DQo+Pj4gdW50aWwgaXQncyByZWZhY3RvcmVkIChCb3RoIG5vdCBhd2Vzb21lKSBJIHRoaW5rIHRo
ZSBvbmx5IG9wdGlvbiBpcyBnZXQNCj4+PiBiYWNrIHRvIHRoZSBvcmlnaW5hbCBjYWNoaW5nLiBB
bmQgZmlndXJlIG91dCB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRvDQo+Pj4gdGFrZSB0aGUgZGly
ZWN0aW9uIGludG8gYWNjb3VudCBmb3IgdGhhdCwgb3Igd2hldGhlciB1cGdyYWRpbmcgdG8NCj4+
PiBiaWRpcmVjdGlvbmFsIHVuY29uZGl0aW9uYWxseSB3b24ndCBiZSBvay4gSSB0aGluayB0aGVy
ZSdzIG9ubHkgcmVhbGx5IHR3bw0KPj4+IGNhc2VzIHdoZXJlIHRoaXMgbWF0dGVyczoNCj4+Pg0K
Pj4+IC0gZGlzcGxheSBkcml2ZXJzIHVzaW5nIHRoZSBjbWEvZG1hX2FsbG9jIGhlbHBlcnMuIEV2
ZXJ5dGhpbmcgaXMgYWxsb2NhdGVkDQo+Pj4gICAgIGZ1bGx5IGNvaGVyZW50LCBjcHUgc2lkZSB3
Yywgbm8gZmx1c2hpbmcuDQo+Pj4NCj4+PiAtIEV2ZXJ5b25lIGVsc2UgKG9uIHBsYXRmb3JtcyB3
aGVyZSB0aGVyZSdzIGFjdHVhbGx5IHNvbWUgZmx1c2hpbmcgZ29pbmcNCj4+PiAgICAgb24pIGlz
IGZvciByZW5kZXJpbmcgZ3B1cywgYW5kIHRob3NlIGFsd2F5cyBtYXAgYmlkaXJlY3Rpb25hbCBh
bmQgd2FudA0KPj4+ICAgICB0aGUgbWFwcGluZyBjYWNoZWQgZm9yIGFzIGxvbmcgYXMgcG9zc2li
bGUuDQo+Pj4NCj4+PiBXaXRoIHRoYXQgd2UgY291bGQgZ28gYmFjayB0byBjcmVhdGluZyB0aGUg
Y2FjaGVkIG1hcHBpbmcgYXQgYXR0YWNoIHRpbWUNCj4+PiBhbmQgYXZvaWQgaW5mbGljdGluZyB0
aGUgcmVzZXJ2YXRpb24gb2JqZWN0IGxvY2sgdG8gcGxhY2VzIHRoYXQgd291bGQga2VlbA0KPj4+
IG92ZXIuDQo+Pj4NCj4+PiBUaG91Z2h0cz8NCj4+IEFjdHVhbGx5IHdlIGhhZCBhIG5vdCBzbyBu
aWNlIGludGVybmFsIG1haWwgdGhyZWFkIHdpdGggb3VyIGhhcmR3YXJlDQo+PiBndXlzIGFuZCBp
dCBsb29rcyBsaWtlIHdlIGhhdmUgdG9ucyBvZiBoYXJkd2FyZSBidWdzL2V4Y2VwdGlvbnMgdGhh
dA0KPj4gc29tZXRpbWVzIFBDSWUgQkFScyBhcmUgb25seSByZWFkYWJsZSBvciBvbmx5IHdyaXRh
YmxlLiBTbyBpdCB0dXJuZWQgb3V0DQo+PiB0aGF0IGFsd2F5cyBjYWNoaW5nIHdpdGggYmlkaXJl
Y3Rpb25hbCB3b24ndCB3b3JrIGZvciB1cyBlaXRoZXIuDQo+Pg0KPj4gQWRkaXRpb25hbCB0byB0
aGF0IEknbSBub3Qgc3VyZSBob3cgaTkxNSBhY3R1YWxseSB0cmlnZ2VyZWQgdGhlIGlzc3VlLA0K
Pj4gY2F1c2Ugd2l0aCB0aGUgY3VycmVudCBjb2RlIHRoYXQgc2hvdWxkbid0IGJlIHBvc3NpYmxl
Lg0KPj4NCj4+IEJ1dCBpbmRlcGVuZGVudCBvZiB0aGF0IEkgY2FtZSB0byB0aGUgY29uY2x1c2lv
biB0aGF0IHdlIGZpcnN0IG5lZWQgdG8NCj4+IGdldCB0byBhIGNvbW1vbiB2aWV3IG9mIHdoYXQg
dGhlIGZlbmNlcyBpbiB0aGUgcmVzZXJ2YXRpb24gbWVhbiBvcg0KPj4gb3RoZXJ3aXNlIHRoZSB3
aG9sZSBzdHVmZiBoZXJlIGlzbid0IGdvaW5nIHRvIHdvcmsgc21vb3RoIGVpdGhlci4NCj4+DQo+
PiBTbyB3b3JraW5nIG9uIHRoYXQgZm9yIG5vdyBhbmQgd2hlbiB0aGF0J3MgZmluaXNoZWQgSSB3
aWxsIGNvbWUgYmFjayB0bw0KPj4gdGhpcyBwcm9ibGVtIGhlcmUgYWdhaW4uDQo+IFllYWggbWFr
ZXMgc2Vuc2UuIEkgdGhpbmsgd2UgYWxzbyBuZWVkIHRvIGNsYXJpZnkgYSBiaXQgdGhlIGV4aXN0
aW5nDQo+IHJ1bGVzIGFyb3VuZCByZXNlcnZhdHJpb25fb2JqZWN0LCBkbWFfZmVuY2Ugc2lnbmFs
aW5nLCBhbmQgaG93IHRoYXQNCj4gbmVzdHMgd2l0aCBldmVyeXRoaW5nIGVsc2UgKGxpa2UgbWVt
b3J5IGFsbG9jYXRpb24vZnNfcmVjbGFpbSBjcml0aWNhbA0KPiBzZWN0aW9ucywgb3IgbW1hcF9z
ZW0pLg0KPg0KPiBJZ25vcmUgdGhlIGRyaXZlcnMgd2hpY2gganVzdCBwaW4gZXZlcnl0aGluZyBz
eXN0ZW0gbWVtb3J5IChtb3N0bHkNCj4ganVzdCBzb2NzKSBJIHRoaW5rIHdlIGhhdmUgYSBidW5j
aCBvZiBncm91cHMsIGFuZCB0aGV5J3JlIGFsbCBzb21ld2hhdA0KPiBpbmNvbXBhdGlibGUgd2l0
aCBlYWNoIGFub3RoZXIuIEV4YW1wbGVzOg0KPg0KPiAtIG9sZCB0dG0gZHJpdmVycyAoYW55dGhp
bmcgZXhjZXB0IGFtZGdwdSkgbmVzdCB0aGUgbW1hcF9zZW0gd2l0aGluDQo+IHRoZSByZXNlcnZh
dGlvbl9vYmplY3QuIFRoYXQgYWxsb3dzIHlvdSB0byBkbyBjb3B5XypfdXNlciB3aGlsZQ0KPiBo
b2xkaW5nIHJlc2VydmF0aW9ucywgc2ltcGxpZnlpbmcgY29tbWFuZCBzdWJtaXNzaW9uIHNpbmNl
IHlvdSBkb24ndA0KPiBuZWVkIGZhbGxiYWNrIHBhdGhzIHdoZW4geW91IHRha2UgYSBmYXVsdC4g
QnV0IG1lYW5zIHlvdSBoYXZlIHRoaXMNCj4gYXdrd2FyZCB0cnlsb2NrIGluIHRoZSBtbWFwIHBh
dGggd2l0aCBubyBmb3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZSBhdA0KPiBhbGwuDQo+DQo+IGFt
ZGdwdSBmaXhlZCB0aGF0IChidXQgbGVmdCB0dG0gYWxvbmUpLCBpOTE1IGFsc28gd29ya3MgbGlr
ZSB0aGF0IHdpdGgNCj4gbW1hcF9zZW0gYmVpbmcgdGhlIG91dGVyIGxvY2suDQoNCkJ5IHRoZSB3
YXkgdGhhdCBpcyBpbmNvcnJlY3QuIEJvdGggYW1kZ3B1IGFzIHdlbGwgYXMgcmVhZGVvbiBkb24n
dCB1c2UgDQpjb3B5X3RvL2Zyb21fdXNlciB3aGlsZSBob2xkaW5nIHRoZSByZXNlcnZhdGlvbiBs
b2NrLg0KDQpUaGUgbGFzdCB0aW1lIEkgY2hlY2tlZCB0aGUgb25seSBkcml2ZXIgc3RpbGwgZG9p
bmcgdGhhdCB3YXMgbm91dmVhdS4NCg0KTWF5YmUgdGltZSB0byBhZGQgYSBtaWdodF9sb2NrKCkg
c28gdGhhdCB3ZSB3aWxsIGJlIGluZm9ybWVkIGFib3V0IA0KbWlzdXNlIGJ5IGxvY2tkZXA/DQoN
CkNocmlzdGlhbi4NCg0KPg0KPiAtIG90aGVyIGlzIHJlc2VydmF0aW9uX29iamVjdCB2cyBtZW1v
cnkgYWxsb2NhdGlvbnMuIEN1cnJlbnRseSBhbGwNCj4gZHJpdmVycyBhc3N1bWUgeW91IGNhbiBh
bGxvY2F0ZSBtZW1vcnkgd2hpbGUgaG9sZGluZyBhIHJlc2VydmF0aW9uLA0KPiBidXQgaTkxNSBn
ZW0gZm9sa3Mgc2VlbSB0byBoYXZlIHNvbWUgcGxhbnMgdG8gY2hhbmdlIHRoYXQgZm9yIGk5MTUu
DQo+IFdoaWNoIGlzbid0IGdvaW5nIHRvIHdvcmsgSSB0aGluaywgc28gd2UgbmVlZCB0byBjbGFy
aWZ5IHRoYXQgYmVmb3JlDQo+IHRoaW5ncyBnZXQgbW9yZSBpbmNvbnNpc3RlbnQuDQo+DQo+IEFi
b3ZlIHR3byBjYW4gYXQgbGVhc3QgYmUgZW5zdXJlZCBieSBhZGRpbmcgc29tbWUgbG9ja2RlcCBh
bm5vdGF0aW9ucw0KPiBhbmQgZGVwZW5kZW5jeSBwcmltaW5nLCBzZWUgaTkxNV9nZW1fc2hyaW5r
ZXJfdGFpbnRzX211dGV4IGZvciB3aGF0IEkNCj4gaGF2ZSBpbiBtaW5kIGZvciByZXNlcnZhdGlv
bl9vYmouDQo+DQo+IFRoZSByZWFsIHBhaW4vc2NhcnkgdGhpbmcgaXMgZG1hX2ZlbmNlLiBBbGwg
dGhlDQo+IHNocmlua2Vycy9tbXVfbm90aWZpZXJzL2htbV9taXJyb3JzIHdlIGhhdmUgYXNzdW1l
IHRoYXQgeW91IGNhbiB3YWl0DQo+IGZvciBhIGZlbmNlIGZyb20gYWxsb2NhdGlvbiBjb250ZXh0
cy9kaXJlY3QgcmVjbGFpbS4gV2hpY2ggbWVhbnMNCj4gbm90aGluZyB5b3UgZG8gYmV0d2VlbiBw
dWJsaXNoaW5nIGEgZmVuY2Ugc29tZXdoZXJlIChkbWEtYnVmLCBzeW5jb2JqLA0KPiBzeW5jcHQg
ZmQpIGFuZCBzaWduYWxsaW5nIHRoYXQgZmVuY2UgaXMgYWxsb3dlZCB0byBhbGxvY2F0ZSBtZW1v
cnkgb3INCj4gcHVsbCBpbiBhbnkgZGVwZW5kZW5jaWVzIHdoaWNoIG1pZ2h0IG5lZWQgbWVtb3J5
IGFsbG9jYXRpb25zLiBJIHRoaW5rDQo+IHdlJ3JlIG1vc3RseSBvayB3aXRoIHRoaXMsIGJ1dCB0
aGVyZSdzIHNvbWUgaTkxNSBwYXRjaGVzIHRoYXQgYnJlYWsNCj4gdGhpcy4NCj4NCj4gTXVjaCB3
b3JzZSBpcyB0aGF0IGxvY2tkZXAgY2FuJ3QgaGVscCB1cyBjaGVjayB0aGlzOiBkbWFfZmVuY2Ug
aXMNCj4gZXNzZW50aWFsbHkgc3RydWN0IGNvbXBsZXRpb24gb24gc3Rlcm9pZHMsIGFuZCB0aGUg
Y3Jvc3MtcmVsZWFzZQ0KPiBsb2NrZGVwIHN1cHBvcnQgZm9yIHN0cnVjdCBjb21wbGV0aW9uIGxv
b2tzIGxpa2UgaXQncyBuZXZlciBnb2luZyB0bw0KPiBnZXQgbWVyZ2VkLiBTbyBubyBkZWJ1Z2dp
bmcgYWlkcyB0byBtYWtlIHN1cmUgd2UgZ2V0IHRoaXMgcmlnaHQsIGFsbA0KPiB3ZSBoYXZlIGlz
IHJldmlldyBhbmQgdGVzdGluZyBhbmQgbWFjaGluZXMgZGVhZGxvY2tpbmcgaW4gcmVhbGx5DQo+
IGNvbXBsaWNhdGVkIHdheXMgaWYgd2UgZ2V0IGl0IHdyb25nLg0KPg0KPiBDaGVlcnMsIERhbmll
bA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

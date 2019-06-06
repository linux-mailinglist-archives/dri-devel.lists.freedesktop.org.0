Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6F36FB3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D678941D;
	Thu,  6 Jun 2019 09:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8BD8941D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:20:15 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1435.namprd12.prod.outlook.com (10.168.240.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.21; Thu, 6 Jun 2019 09:20:13 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.023; Thu, 6 Jun 2019
 09:20:13 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Ser, Simon" <simon.ser@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, 
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Subject: Re: Linking ALSA playback devices and DRM connectors
Thread-Topic: Linking ALSA playback devices and DRM connectors
Thread-Index: AQHVHEgnKwcqy+d3LEKuL+6uye0Vs6aOWX4A
Date: Thu, 6 Jun 2019 09:20:13 +0000
Message-ID: <80d5ea60-5bb3-81a8-e74d-ab7dc8d6cd31@amd.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
 <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
In-Reply-To: <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::29) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f40d3e89-4e14-4c39-33af-08d6ea602e38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1435; 
x-ms-traffictypediagnostic: DM5PR12MB1435:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1435F01F721D04FA8EB14AFE83170@DM5PR12MB1435.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(39860400002)(346002)(136003)(189003)(199004)(66476007)(66946007)(6512007)(73956011)(66446008)(66556008)(64756008)(6306002)(68736007)(256004)(305945005)(6246003)(2906002)(14454004)(25786009)(966005)(72206003)(478600001)(5660300002)(65826007)(31686004)(66574012)(8676002)(8936002)(6436002)(7736002)(6486002)(4326008)(229853002)(71190400001)(71200400001)(31696002)(58126008)(6636002)(81156014)(81166006)(316002)(86362001)(386003)(476003)(486006)(6116002)(186003)(46003)(446003)(11346002)(2616005)(6506007)(53936002)(99286004)(36756003)(65806001)(65956001)(64126003)(102836004)(76176011)(110136005)(52116002)(2501003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1435;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 58bj/XaUi6dDHhjnvzGhsVLriEk6qy9LGG/kNWjkkmPEVk116xKZrXVTnjgeyR0ZcX3iznuPAVqjZq8gfCY8ujzNT/V9zCDjSrEeIgH5p2wtzrDan7axxt28bjYQEKkmm4vkBQaEGZIKfFQy4KBm9l+0oAltuFRwfeRAV42TxSbCVTmjD3hgy3+USv6E8BGjSLxuHXqcwUGNzCHmU7LMiNcxM3Ko+JRZd+YStNolHzO8F3LHAFCxnPDCgHjxNnXBdco5cWblBlYtmfbjM71T7Zu1MheVZu7RMWwM+lKE5V0KTGBD88WA3mZ29QsGl7LY7enen2dgJ4SoBwwCciXqPJNSb2ITNijHnsHr3051zDFRYGlkxFb0Ywj8B9ghf0r44vLgttd/mDsXaUXcpNK7AHsl6u1IZjNlWr8BK2m1d2Q=
Content-ID: <911DA7E9A54EE749BC9EEF4AA45ACBD8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40d3e89-4e14-4c39-33af-08d6ea602e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 09:20:13.5751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1435
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOkaFb9maDwCDGOEgdiud9x71qYzssdEjs/G7cneC+c=;
 b=BY9QTexq1CL4nvFEKxyvJJoUoa8h1/wzChhfKOg8essXPrV65Lv+3ni1dyEwDgEGq6O9xnBEwI3kQiCnxoyrKv8vNCJWze3ninvjPZrQwZP8XZHIQU9RqzRg0FIcNyHCCFhTKK3lRwLemT+l7RUICUWYAhBNjd3ZLS8JxkzTtiQ=
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

QW0gMDYuMDYuMTkgdW0gMTE6MTMgc2NocmllYiBTZXIsIFNpbW9uOg0KPiBPbiBUdWUsIDIwMTkt
MDYtMDQgYXQgMTc6MTUgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAwNC4w
Ni4xOSB1bSAxNzowNSBzY2hyaWViIFNlciwgU2ltb246DQo+Pj4gSGksDQo+Pj4NCj4+PiBJJ20g
dHJ5aW5nIHRvIGxpbmsgQUxTQSBwbGF5YmFjayBkZXZpY2VzIGFuZCBEUk0gY29ubmVjdG9ycy4g
SW4gb3RoZXINCj4+PiB3b3JkcywgSSdkIGxpa2UgdG8gYmUgYWJsZSB0byBrbm93IHdoaWNoIEFM
U0EgZGV2aWNlIEkgc2hvdWxkIG9wZW4gdG8NCj4+PiBwbGF5IGF1ZGlvIG9uIGEgZ2l2ZW4gY29u
bmVjdG9yLg0KPj4+DQo+Pj4gVW5mb3J0dW5hdGVseSwgSSBoYXZlbid0IGZvdW5kIGEgd2F5IHRv
IGV4dHJhY3QgdGhpcyBpbmZvcm1hdGlvbi4gSQ0KPj4+IGtub3cgL3Byb2MvYXNvdW5kL2NhcmRO
L2VsZCogZXhwb3NlIHRoZSBFRElELWxpa2UgZGF0YS4gSG93ZXZlciBieQ0KPj4+IGxvb2tpbmcg
YXQgdGhlIEFMU0EgQVBJIChhbHNvOiBhcGxheSAtbCBhbmQgLUwpIEkgY2FuJ3QgZmluZCBhIHdh
eSB0bw0KPj4+IGZpZ3VyZSBvdXQgd2hpY2ggUENNIGRldmljZSBtYXBzIHRvIHRoZSBFTEQuDQo+
Pj4NCj4+PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPj4gSXMgdGhhdCBhY3R1YWxseSBmaXhl
ZCBvbiBhbGwgaGFyZHdhcmU/IE9yIGRvIHdlIG1heWJlIGhhdmUgc29tZQ0KPj4gaGFyZHdhcmUg
d2l0aCBvbmx5IG9uZSBhdWRpbyBjb2RlYyBhbmQgbXVsdGlwbGUgY29ubmVjdG9ycz8NCj4+DQo+
Pj4gSWYgbm90LCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0byBleHBvc2UgdGhpcz8NCj4+
Pg0KPj4+IC0gQSBzeW1saW5rIHRvIHRoZSBBTFNBIGF1ZGlvIFBDTSBkZXZpY2UgaW4NCj4+PiAg
ICAgL3N5cy9jbGFzcy9kcm0vY2FyZE4tQ09OTkVDVE9SPw0KPj4+IC0gQSBzeW1saW5rIHRvIHRo
ZSBEUk0gY29ubmVjdG9yIGluIC9zeXMvY2xhc3Mvc291bmQvcGNtKj8NCj4+IElmIGl0J3MgZml4
ZWQgdGhhbiB0aG9zZSB0d28gb3B0aW9ucyBzb3VuZCBzYW5lIHRvIG1lLg0KPj4NCj4+PiAtIEEg
RFJNIGNvbm5lY3RvciBwcm9wZXJ0eT8NCj4+IElmIGl0J3MgY29uZmlndXJhYmxlIHRoYW4gdGhh
dCBzb3VuZHMgbGlrZSBhIGdvb2Qgb3B0aW9uIHRvIG1lLg0KPiBJJ20gc3RpbGwgbm90IHN1cmUg
d2hldGhlciB0aGlzIGlzIGZpeGVkIG9uIGFsbCBoYXJkd2FyZSBvciBub3QuDQoNCldlbGwgZnJv
bSByZWFkaW5nIHVwIG9uIHRoZSB0aHJlYWQgSSB0aGluayB0aGUgYW5zd2VyIGlzIHRoYXQgdGhp
cyBpcyANCk5PVCBmaXhlZC4NCg0KQXQgbGVhc3QgZnJvbSBBTUQgaGFyZHdhcmUgSSBrbm93IHRo
YXQgdGhlIG9yaWdpbmFsIFI2MDAgaGFkIG9ubHkgb25lIA0KYXVkaW8gY29kZWMgd2hpY2ggY291
bGQgYmUgcm91dGVkIHRvIG11bHRpcGxlIEhETUkgY29ubmVjdG9ycyBhdCB0aGUgDQpzYW1lIHRp
bWUuDQoNCkFuZCBJIHVuZGVyc3RhbmQgdGhlIHJlcGx5IGFib3V0IE1TVCBzbyB0aGF0IHlvdSBj
YW4gZXZlbiBoYXZlIG11bHRpcGxlIA0Kc3RyZWFtcyBvdmVyIHRoZSBzYW1lIGNvZGVjIHJvdXRl
ZCB0byBkaWZmZXJlbnQgY29ubmVjdG9ycy4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IFZpbGxlLCBv
biB0aGlzIG9sZCBJbnRlbCBodywgaXMgdGhlIHNpbmdsZSBjb25uZWN0b3IgdGhhdCBnZXRzIHRo
ZQ0KPiBhdWRpbyBjb25maWd1cmFibGU/DQo+DQo+IEFkZGl0aW9uYWwgdGhvdWdodDogc2luY2Ug
SSBuZWVkIHRoaXMgZm9yIHRoZSBJR1QgdGVzdCBzdWl0ZSBJIGRvbid0DQo+IHJlYWxseSBjYXJl
IGhvdyB0aGlzIGluZm8gaXMgZXhwb3NlZCBhcyBsb25nIGFzIGl0J3MgZXhwb3NlZCwgYnV0IG90
aGVyDQo+IHVzZXJzcGFjZSBwcm9ncmFtcyAoREVzKSBhcmUgcHJvYmFibHkgaW50ZXJlc3RlZCBp
biB0aGlzIGluZm9ybWF0aW9uDQo+IHRvby4gVGhpcyB3b3VsZCBhbGxvdyB1c2VycyB0byBhY3R1
YWxseSBoYXZlIHRoZSBuYW1lIG9mIHRoZSBtb25pdG9yIGluDQo+IHRoZSBhdWRpbyBvdXRwdXQg
c2VsZWN0aW9uIFVJLiBIYXZpbmcgc29tZXRoaW5nIHRoYXQgZG9lc24ndCBkZXBlbmQgb24NCj4g
c3lzZnMgd291bGQgYmUgYmV0dGVyIGZvciB0aGlzLg0KPg0KPiBXb3VsZCB0aGVyZSBiZSBhIHdh
eSB0byBleHBvc2Ugc29tZSBpbmZvIGFib3V0IHRoZSBtb25pdG9yIGluIHRoZSBBTFNBDQo+IEFQ
ST8NCj4NCj4+IEFueXdheSBhZGRlZCBvdXIgREMgdGVhbSwgc3R1ZmYgbGlrZSB0aGF0IGlzIHRo
ZWlyIGNvbnN0cnVjdGlvbiBzaXRlLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+
Pg0KPj4+IC0gU29tZWhvdyBleHBvc2UgdGhlIGNvbm5lY3RvciBuYW1lIHZpYSB0aGUgQUxTQSBB
UEk/DQo+Pj4gLSBFeHBvc2UgdGhlIGNvbm5lY3RvciBFRElEIHZpYSBBTFNBPw0KPj4+IC0gT3Ro
ZXIgaWRlYXM/DQo+Pj4NCj4+PiBUaGFua3MhDQo+Pj4NCj4+PiBTaW1vbiBTZXINCj4+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QNCj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

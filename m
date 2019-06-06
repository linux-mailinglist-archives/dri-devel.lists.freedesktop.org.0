Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413DB37CF0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 21:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABE489842;
	Thu,  6 Jun 2019 19:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710069.outbound.protection.outlook.com [40.107.71.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FF989838;
 Thu,  6 Jun 2019 19:04:47 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3691.namprd12.prod.outlook.com (10.255.76.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 19:04:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 19:04:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "alex.deucher@amd.com"
 <alex.deucher@amd.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 0/2] Two bug-fixes for HMM
Thread-Topic: [PATCH 0/2] Two bug-fixes for HMM
Thread-Index: AQHVB2oFymYy9x0alkiQIwO1y+NKl6aO5X+AgABBFAA=
Date: Thu, 6 Jun 2019 19:04:46 +0000
Message-ID: <1d309300-41d8-eb31-38c2-c6c9dd5c0ba8@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190606151149.GA5506@ziepe.ca>
In-Reply-To: <20190606151149.GA5506@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::25) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b05933f-e207-4e8c-7ec0-08d6eab1d74c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3691; 
x-ms-traffictypediagnostic: DM6PR12MB3691:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <DM6PR12MB3691AE0B95B19787670F74D192170@DM6PR12MB3691.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(366004)(346002)(39850400004)(199004)(189003)(486006)(8676002)(6436002)(2201001)(256004)(31696002)(186003)(14454004)(14444005)(316002)(65826007)(2616005)(52116002)(3846002)(86362001)(8936002)(81166006)(81156014)(2906002)(11346002)(53546011)(478600001)(76176011)(99286004)(36756003)(26005)(72206003)(6116002)(386003)(966005)(102836004)(6306002)(6506007)(305945005)(7736002)(6512007)(2501003)(446003)(53936002)(65806001)(476003)(66476007)(229853002)(6486002)(66066001)(54906003)(4326008)(64756008)(5660300002)(64126003)(58126008)(31686004)(110136005)(6246003)(25786009)(73956011)(68736007)(66556008)(66946007)(71200400001)(66446008)(65956001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3691;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0YXCf2xHTOFkj2YuyWtiF5Rxd9vPDMHPMdiwI/wl47DvMYU8CFRq4wv1b4/Z+MaRbNUHNaG3M3zvuOqB2BwmWOpO00hsC8t/vkLV40rurjAOVXmqNXW+gRY1QKAEQgCoiGV1dTkgp+MhXCVA/LXjXeoknpoVW04v32yJcKWo0HgvxXSuyVRHHec6jyv6W3iGgPXlIk4BI0Bnr2zfgsRKyhPYeTO571U+7/tduypDqctGnt+016mlKDFqt4mzCbH6UD1571As0SW0v75CRIeyNHcTdlqCP7TX1iB2qy+000KeS+otZMus9WuQhx4nHKpLucdwdWdCO7+3hmAtikV1PswpO/8ynzDssbHdTLaG0q4s5rmp3N0L2ok31At98lXKFIRWe2o/R7UsYKuiupaPlytZKam+oAszeSRnuvVJYz0=
Content-ID: <C02A2BA0FA0B124EAD2EC5D85B54BD99@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b05933f-e207-4e8c-7ec0-08d6eab1d74c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 19:04:46.4218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g+JTSGE0pIRFDErc0S3c8ZNl+vjtjP0b4hWE61WNZY=;
 b=cTqWQ84IB6kjz0wuK/T7Oz++uMzhRnymkZPynngA/QJjUUd2xlghooNdPTM9jL0dMXy+h41EopqHpPwVCm79Jkcr7txndjfqo+Sozbsvpd7zTr64zQgYNfz0skkq3Sy9y/UMsH0XWEGJUCXX6KgD18U4BEDlrb+4XvauHHbyLZQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0wNiAxMToxMSBhLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+IE9uIEZy
aSwgTWF5IDEwLCAyMDE5IGF0IDA3OjUzOjIxUE0gKzAwMDAsIEt1ZWhsaW5nLCBGZWxpeCB3cm90
ZToNCj4+IFRoZXNlIHByb2JsZW1zIHdlcmUgZm91bmQgaW4gQU1ELWludGVybmFsIHRlc3Rpbmcg
YXMgd2UncmUgd29ya2luZyBvbg0KPj4gYWRvcHRpbmcgSE1NLiBUaGV5IGFyZSByZWJhc2VkIGFn
YWluc3QgZ2xpc3NlL2htbS01LjItdjMuIFdlJ2QgbGlrZSB0byBnZXQNCj4+IHRoZW0gYXBwbGll
ZCB0byBhIG1haW5saW5lIExpbnV4IGtlcm5lbCBhcyB3ZWxsIGFzIGRybS1uZXh0IGFuZA0KPj4g
YW1kLXN0YWdpbmctZHJtLW5leHQgc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLg0KPj4NCj4+IEN1
cnJlbnRseSB0aGUgSE1NIGluIGFtZC1zdGFnaW5nLWRybS1uZXh0IGlzIHF1aXRlIGZhciBiZWhp
bmQgaG1tLTUuMi12MywNCj4+IGJ1dCB0aGUgZHJpdmVyIGNoYW5nZXMgZm9yIEhNTSBhcmUgZXhw
ZWN0ZWQgdG8gbGFuZCBpbiA1LjIgYW5kIHdpbGwgbmVlZCB0bw0KPj4gYmUgcmViYXNlZCBvbiB0
aG9zZSBITU0gY2hhbmdlcy4NCj4+DQo+PiBJJ2QgbGlrZSB0byB3b3JrIG91dCBhIGZsb3cgYmV0
d2VlbiBKZXJvbWUsIERhdmUsIEFsZXggYW5kIG15c2VsZiB0aGF0DQo+PiBhbGxvd3MgdXMgdG8g
dGVzdCB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgSE1NIG9uIGFtZC1zdGFnaW5nLWRybS1uZXh0IHNv
DQo+PiB0aGF0IGlkZWFsbHkgZXZlcnl0aGluZyBjb21lcyB0b2dldGhlciBpbiBtYXN0ZXIgd2l0
aG91dCBtdWNoIG5lZWQgZm9yDQo+PiByZWJhc2luZyBhbmQgcmV0ZXN0aW5nLg0KPiBJIHRoaW5r
IHdlIGhhdmUgdGhhdCBub3csIEknbSBydW5uaW5nIGEgaG1tLmdpdCB0aGF0IGlzIGNsZWFuIGFu
ZCBjYW4NCj4gYmUgdXNlZCBmb3IgbWVyZ2luZyBpbnRvIERSTSByZWxhdGVkIHRyZWVzIChhbmQg
UkRNQSkuIEkndmUgY29tbWl0ZWQNCj4gdG8gc2VuZCB0aGlzIHRyZWUgdG8gTGludXMgYXQgdGhl
IHN0YXJ0IG9mIHRoZSBtZXJnZSB3aW5kb3cuDQo+DQo+IFNlZSBoZXJlOg0KPg0KPiAgIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA1MjQxMjQ0NTUuR0IxNjg0NUB6aWVwZS5jYS8N
Cj4NCj4gVGhlIHRyZWUgaXMgaGVyZToNCj4NCj4gICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9yZG1hL3JkbWEuZ2l0L2xvZy8/aD1obW0NCj4NCj4gSG93
ZXZlciBwbGVhc2UgY29uc3VsdCB3aXRoIG1lIGJlZm9yZSBtYWtpbmcgYSBtZXJnZSBjb21taXQg
dG8gYmUNCj4gY28tb3JkaW5hdGVkLiBUaGFua3MNCj4NCj4gSSBzZWUgaW4gdGhpcyB0aHJlYWQg
dGhhdCBBTURHUFUgbWlzc2VkIDUuMiBiZWFjYXVzZSBvZiB0aGUNCj4gY28tb3JkaW5hdGlvbiBw
cm9ibGVtcyB0aGlzIHRyZWUgaXMgaW50ZW5kZWQgdG8gc29sdmUsIHNvIEknbSB2ZXJ5DQo+IGhv
cGVmdWwgdGhpcyB3aWxsIGhlbHAgeW91ciB3b3JrIG1vdmUgaW50byA1LjMhDQoNClRoYW5rcyBK
YXNvbi4gT3VyIHR3byBwYXRjaGVzIGJlbG93IHdlcmUgYWxyZWFkeSBpbmNsdWRlZCBpbiB0aGUg
TU0gdHJlZSANCihodHRwczovL296bGFicy5vcmcvfmFrcG0vbW1vdHMvYnJva2VuLW91dC8pLiBX
aXRoIHlvdXIgbmV3IGhtbS5naXQsIA0KZG9lcyB0aGF0IG1lYW4gSE1NIGZpeGVzIGFuZCBjaGFu
Z2VzIHdpbGwgbm8gbG9uZ2VyIGdvIHRocm91Z2ggQW5kcmV3IA0KTW9ydG9uIGJ1dCBkaXJlY3Rs
eSB0aHJvdWdoIHlvdXIgdHJlZSB0byBMaW51cz8NCg0KV2UgaGF2ZSBhbHNvIGFwcGxpZWQgdGhl
IHR3byBwYXRjaGVzIHRvIG91ciBpbnRlcm5hbCB0cmVlIHdoaWNoIGlzIA0KY3VycmVudGx5IGJh
c2VkIG9uIDUuMi1yYzEgc28gd2UgY2FuIG1ha2UgcHJvZ3Jlc3MuDQoNCkFsZXgsIEkgdGhpbmsg
bWVyZ2luZyBobW0gd291bGQgYmUgYW4gZXh0cmEgc3RlcCBldmVyeSB0aW1lIHlvdSByZWJhc2Ug
DQphbWQtc3RhZ2luZy1kcm0tbmV4dC4gV2UgY291bGQgcHJvYmFibHkgYWxzbyBtZXJnZSBobW0g
YXQgb3RoZXIgdGltZXMgYXMgDQpuZWVkZWQuIERvIHlvdSB0aGluayB0aGlzIHdvdWxkIGNhdXNl
IHRyb3VibGUgb3IgY29uZnVzaW9uIGZvciANCnVwc3RyZWFtaW5nIHRocm91Z2ggZHJtLW5leHQ/
DQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+PiBNYXliZSBoYXZpbmcgSmVyb21lJ3Mg
bGF0ZXN0IEhNTSBjaGFuZ2VzIGluIGRybS1uZXh0LiBIb3dldmVyLCB0aGF0IG1heQ0KPj4gY3Jl
YXRlIGRlcGVuZGVuY2llcyB3aGVyZSBKZXJvbWUgYW5kIERhdmUgbmVlZCB0byBjb29yZGluYXRl
IHRoZWlyIHB1bGwtDQo+PiByZXF1ZXN0cyBmb3IgbWFzdGVyLg0KPj4NCj4+IEZlbGl4IEt1ZWhs
aW5nICgxKToNCj4+ICAgIG1tL2htbTogT25seSBzZXQgRkFVTFRfRkxBR19BTExPV19SRVRSWSBm
b3Igbm9uLWJsb2NraW5nDQo+Pg0KPj4gUGhpbGlwIFlhbmcgKDEpOg0KPj4gICAgbW0vaG1tOiBz
dXBwb3J0IGF1dG9tYXRpYyBOVU1BIGJhbGFuY2luZw0KPiBJJ3ZlIGFwcGxpZWQgYm90aCBvZiB0
aGVzZSBwYXRjaGVzIHdpdGggSmVyb21lJ3MgUmV2aWV3ZWQtYnkgdG8NCj4gaG1tLmdpdCBhbmQg
YWRkZWQgdGhlIG1pc3NlZCBTaWduZWQtb2ZmLWJ5DQo+DQo+IElmIHlvdSB0ZXN0IGFuZCBjb25m
aXJtIEkgdGhpbmsgdGhpcyBicmFuY2ggd291bGQgYmUgcmVhZHkgZm9yIG1lcmdpbmcNCj4gdG93
YXJkIHRoZSBBTUQgdHJlZS4NCj4gUmVnYXJkcywNCj4gSmFzb24NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

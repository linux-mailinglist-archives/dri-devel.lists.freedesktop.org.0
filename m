Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9FE8383F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 19:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A623D6E519;
	Tue,  6 Aug 2019 17:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0D06E50E;
 Tue,  6 Aug 2019 17:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDLa6cWkd3MKeqZy90uUvUmclvhbJb69Nd3vK1R1kDlmyuIccdlA6DB0jMptIMDbkI+w5ZnjwQHA2iDUqtdWuc/2lF7k2d9Y/LArqu9nFj6d3oZbGCSuULusMZxu0TX9doIJ1d75+ZmsAdfO+beYQLr70Iu8W6rA2dEFgeAMOMnwUz/3Fi3C5HgItJlyPQriElfWuA0WXQQQ7NsMCf34cyFHX1tktqrZMiIGiyyyfxyfbt2/ZVw6ZY3druLuaU/jVbA0PGOAq1vA4tljVr8CtPxmtbc+dWXxRor5jSOWfXHt+RzhYr6fV4fBvc6hLeLDzP57CB1yq1BZKvMilVr8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQNTf5fB336M0EgjgxTq//hoMbtzGDvCuqWqrTcNxBk=;
 b=TIvEjlnI7TcXr+K9X3/i5+A9kNvNbuN6xzvMl7qzkPINeSiYFuk1osD+cZ4SH75B7qKb/cb+gAnvfLRrw2BD+aTHcp65oRvWUibBm2LSca/FnvgkOleYzb0WZMBj3cSV/dHu97X8+m8XxXQY5ilGEx7zK/BqBYdWxr1taWnjBVWVjnPyHRZ9sczfe1anC691UvgXN56AdZ+W6DDTrxoj1n1uhWCJLiJW0DO1PzWP2qGRUwsgVtdIk1tG5PUMFeG7R5MCWnavbGfa1QsT4zDLYYv4+GgTvbSi8brSb72TLg39jXfDJPeXlsSBU9KTdKk2fS7633CILOa+93/G1Fw5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4186.namprd12.prod.outlook.com (10.141.186.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Tue, 6 Aug 2019 17:51:42 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2157.011; Tue, 6 Aug 2019
 17:51:42 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH 15/15] amdgpu: remove CONFIG_DRM_AMDGPU_USERPTR
Thread-Topic: [PATCH 15/15] amdgpu: remove CONFIG_DRM_AMDGPU_USERPTR
Thread-Index: AQHVTHDu3MOrnAsG0k6xIfWlHrhaOqbuZFmAgAAB+AA=
Date: Tue, 6 Aug 2019 17:51:42 +0000
Message-ID: <587b1c3c-83c4-7de9-242f-6516528049f4@amd.com>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-16-hch@lst.de> <20190806174437.GK11627@ziepe.ca>
In-Reply-To: <20190806174437.GK11627@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 835abc0c-24d8-46e0-a067-08d71a96bd4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4186; 
x-ms-traffictypediagnostic: DM6PR12MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4186A217ACCD65FD05D1EF5692D50@DM6PR12MB4186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(189003)(199004)(76114002)(6436002)(8936002)(66946007)(68736007)(31696002)(14454004)(31686004)(64126003)(2906002)(6506007)(71200400001)(25786009)(305945005)(3846002)(53546011)(76176011)(86362001)(7736002)(386003)(71190400001)(36756003)(81156014)(5660300002)(6636002)(8676002)(99286004)(52116002)(4326008)(6116002)(81166006)(54906003)(110136005)(316002)(65826007)(64756008)(6486002)(66446008)(66476007)(66556008)(229853002)(256004)(478600001)(7416002)(476003)(486006)(2616005)(53936002)(186003)(66066001)(26005)(102836004)(65806001)(65956001)(446003)(11346002)(6512007)(6246003)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4186;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /M2XdxpxIpUSZMhte3o5Ku1227J6SEZK2M3iR+6jjGrBQ6hkOHB42zSxRJfHAw54pA1DMlYx79rqvijRZVjTXAdKukuk6dt6HFlglnL2oOmVMQBWMqcmRs8gwdqRVYCCJyEypD+ctncD8S4lgOYVsAqnEOXCH0BpMU94PZj9RV/apFxB/gIgqkn3cI8pEcFaRvepUhfKYsTnSolnm/cXvO2wcqabFJ5k228eyiFtlWIhz74SyRh/A1O0JBzobhqCwdwONoZx+aICaj8p3O2/BnIMO/X0sHH05GLDQvHoUER7Z4C+lSk6PazKsn0IYRQseLWG9+0918F19Rmcnq0kA10U1A31T6J1GGCLePd7cXmWYg24RiHJGyfHmYIRWOVh+Q+/DPw5fHnpoCPJZ0QpP3vSlowpDdUj2rssKkxn4zs=
Content-ID: <253371366C4977429E154A1B7CA108CB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835abc0c-24d8-46e0-a067-08d71a96bd4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 17:51:42.1896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HNo3A/f3l03mC7OtpMyTWSH9pJgZaMIzkc1jVO21lowg9XmFn3Fw9A7dTKXzOC0r5gFNpDlTDKJN9x04SxXShQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQNTf5fB336M0EgjgxTq//hoMbtzGDvCuqWqrTcNxBk=;
 b=Gx5QVn5Qi8GRtw2ZCmr+wImFVrUolDpNpj2McaWDjl223Q1AE6WNhmwTw9GDrrN128DTVWK+7u7BoUKWPrGn5dKkJ+vWIFDVoHf3NHWuaSNQ8sjHtDUGui+/GtNUvVk2d1hDNo5nBgvr554cPGs9vsST90Dhkh3pIJ2K0T6LMpo=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wNiAxMzo0NCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiBPbiBUdWUsIEF1
ZyAwNiwgMjAxOSBhdCAwNzowNTo1M1BNICswMzAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToN
Cj4+IFRoZSBvcHRpb24gaXMganVzdCB1c2VkIHRvIHNlbGVjdCBITU0gbWlycm9yIHN1cHBvcnQg
YW5kIGhhcyBhIHZlcnkNCj4+IGNvbmZ1c2luZyBoZWxwIHRleHQuICBKdXN0IHB1bGwgaW4gdGhl
IEhNTSBtaXJyb3IgY29kZSBieSBkZWZhdWx0DQo+PiBpbnN0ZWFkLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPg0KPj4gLS0tDQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAyICsrDQo+PiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L0tjb25maWcgICAgICB8IDEwIC0tLS0tLS0tLS0NCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgIDYgLS0tLS0tDQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCB8IDEyIC0tLS0tLS0tLS0tLQ0K
Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pDQo+
IEZlbGl4LCB3YXMgdGhpcyBhbiBlZmZvcnQgdG8gYXZvaWQgdGhlIGFyY2ggcmVzdHJpY3Rpb24g
b24gaG1tIG9yDQo+IHNvbWV0aGluZz8gQWxzbyBjYW4ndCBzZWUgd2h5IHRoaXMgd2FzIGxpa2Ug
dGhpcy4NCg0KVGhpcyBvcHRpb24gcHJlZGF0ZXMgS0ZEJ3Mgc3VwcG9ydCBvZiB1c2VycHRycywg
d2hpY2ggaW4gdHVybiBwcmVkYXRlcyANCkhNTS4gUmFkZW9uIGhhcyB0aGUgc2FtZSBraW5kIG9m
IG9wdGlvbiwgdGhvdWdoIGl0IGRvZXNuJ3QgYWZmZWN0IEhNTSBpbiANCnRoYXQgY2FzZS4NCg0K
QWxleCwgQ2hyaXN0aWFuLCBjYW4geW91IHRoaW5rIG9mIGEgZ29vZCByZWFzb24gdG8gbWFpbnRh
aW4gdXNlcnB0ciANCnN1cHBvcnQgYXMgYW4gb3B0aW9uIGluIGFtZGdwdT8gSSBzdXNwZWN0IGl0
IHdhcyBvcmlnaW5hbGx5IG1lYW50IGFzIGEgDQp3YXkgdG8gYWxsb3cga2VybmVscyB3aXRoIGFt
ZGdwdSB3aXRob3V0IE1NVSBub3RpZmllcnMuIE5vdyBpdCB3b3VsZCANCmFsbG93IGEga2VybmVs
IHdpdGggYW1kZ3B1IHdpdGhvdXQgSE1NIG9yIE1NVSBub3RpZmllcnMuIEkgZG9uJ3Qga25vdyBp
ZiANCnRoaXMgaXMgYSB1c2VmdWwgdGhpbmcgdG8gaGF2ZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxp
eA0KDQo+DQo+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
DQo+DQo+IEphc29uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

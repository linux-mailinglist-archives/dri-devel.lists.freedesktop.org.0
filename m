Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA62CC0FD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 16:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553436EA60;
	Wed,  2 Dec 2020 15:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E686EA55;
 Wed,  2 Dec 2020 15:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huNvjHwrCtksz+aEfh3e2VsJo7o3eCQheejXtCTDXm14yPt8897+SemsNcnAis9IIZ/EmL5OcdXwtmU5aaoKactC5jFq03zctW7uBbUUD2Cu7fq8s+TR/kh81boQZzVeyttiwsqfRkp4vl72bctqVDqZgF1BlXLZeYW1weJcoZxu/Orb9ARaFkK4FEjopqzI1srFCnMYnJERDw5MGX+1o81aDNRYoPfV0oBmyxgrElucl0FuVcADYW7NewB+j73igwh2WiZdbZUsFdzzrY8GTOFid8PAuuJq83BOM34GAeDEhAH1veAjabzXHYPGS3zopzeArXZT0BX37obPbRoy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJq696j4BYP+BlyoYyjJOTH7x2Ot+IxjX+IKYGdEtFg=;
 b=PeT88Ne4DrrE2G1yu/zhvdvusUeTskKU9IIqkSnV0wnGJDqfT1A1jfFmsNg96gzizdXmF5Zb7Y6mFSWdQq0I+Lav+SDA5qHFV5dvnEWuZ87IiJmK5PXiqsyryzn+OF+xO6bYyxJz1xvWSskS78O/8DFdXLwQQOxhI2qlSjW6SbTF63kWDThjl85BBg0uG+IilgRzMnqxU7VdN+2hcjTsSUh8hqN/IRfrxXox+rpRqX5YtgQad8815sOoxIR50kjvnwgGZ5O7lyXC0GOBXaNwllsY5WhV1DzqXA1hYT2VlV4kYLVveCiGSJdWGDkAKGt3dxhXDtqV79YL+CwPgq3ZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJq696j4BYP+BlyoYyjJOTH7x2Ot+IxjX+IKYGdEtFg=;
 b=bO96a5FGYeHF9YkWCQiUeu6A+8IeR0atHxrMlLFYf170CdzS/JNaqwyqpNFFLxJQJ+OZ4VYQyiqGW/K9iZTedRdB3Pp7Y4NqSe9AazSyWLbXR8M5AMVs4wnEYxRse6gDMd7HOLSLO+4dNyz2FJJ8Rgy81m+YFI+B6MjZt2uakrw=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by MN2PR05MB6975.namprd05.prod.outlook.com (2603:10b6:208:18d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9; Wed, 2 Dec
 2020 15:37:01 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3654.005; Wed, 2 Dec 2020
 15:37:00 +0000
From: Zack Rusin <zackr@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Topic: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Index: AQHWwlaG5WlZT6CPxU6T7GsrbIaTjanhMtCAgAJLGYCAAGvzgIAAE2oA
Date: Wed, 2 Dec 2020 15:37:00 +0000
Message-ID: <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
 <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
In-Reply-To: <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3780aa26-fa89-4224-6689-08d896d81c85
x-ms-traffictypediagnostic: MN2PR05MB6975:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6975C675C3B17C917C7CC5D5CEF30@MN2PR05MB6975.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fzyH1Yk6Aoe86Te7X1J5YfyUi3xSTQCBn22Js1TpomGa8U64JHe7blPHoe+dsx4PB1D7TNdHclNNSLdAi9lHTT4gRq7+8bNolFr1em2uWEwNqO9NTdtUodJNvh8lSYeVrToraSx+gyUlK6lUh5IVonHrzD1Rts8gP2i2bItp5Nmi6rX4M3fkY6yflsA55NF0R3GgPOHj0LL5JkkYISOJ9wFrHbWjSPODPK58m1+U/IixXbvW8R4a/ybsrJBC5UVNIkaqmZPnfjJTOSEyITIjHMPcQ2ljFvyMFsS4QGY41/ZfsuQGzr6IsTDe6Wcx9jaAG4hGFAFTphxLcu3DgC+3R+UpNsg1Tqy423f4EC8HD1iwTKCBKctjdnkaz8r+6u+k
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(33656002)(36756003)(4326008)(186003)(71200400001)(54906003)(2616005)(26005)(316002)(478600001)(66476007)(6506007)(53546011)(5660300002)(2906002)(6916009)(6512007)(8676002)(66556008)(7416002)(66446008)(66946007)(64756008)(86362001)(76116006)(6486002)(4744005)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?S2tlSy90NlNWcnlRbEk0RmNnN1pKemhpcmJnTEhPMlNORGsvdmYzY2tUMFNv?=
 =?utf-8?B?QXd3NklqTXV1b0NESFFnUDhpVisvOG9ld2xlOEZrV3N3WFhRbTRVdk1vTkVq?=
 =?utf-8?B?TlQvSHFmVGNnWmhiUG8xdVhxekJJbTU2UDdLall0OXlLbFZZTklrQk1mVldE?=
 =?utf-8?B?aFI2Q1M3Tng3ZTNCMEd3VEV2S29FK2szUkxaalhLNlUrQ1VyVzJib3licDQx?=
 =?utf-8?B?aTByTUE3d09qeHpxSnFobUZ6K1VzSldPTy9teERIc3h1RHhJR1czNlJGYnN0?=
 =?utf-8?B?QTVhTms1ZnBHYTkvb0xiSWxEMnp6b1VTb0kxNDBjVU9sNlZuRndQOHBaakcx?=
 =?utf-8?B?SVowVWdzMGFpRFB5ZTA3dWtrTkFTQkliQ2ZVL2crOURmZm9tUkhUMGF1WGdp?=
 =?utf-8?B?eXpocWM2eUFaeXB2T1lRaXNiTkxNZ0dmTzNpWnpaZVRJdUxpMWZmS1VlcERn?=
 =?utf-8?B?bHgwRSszQW92ZCtHZHZYYWkxR0RNQU5UUlNUUzJpV0VZNGtnMHRtL0xxNWZj?=
 =?utf-8?B?bktYc1dzSk1ybnhDaTFMdjZKV2p1MU11b3FiZDQwbGVaRWRpTjZmTHgva1lU?=
 =?utf-8?B?ZUJQTTY2b3ZFekFmcnFxWnFWSHpBam1YOHRxTXhaeE8zT05oV2NjQnJ5U2ZS?=
 =?utf-8?B?NHNTZy9GLzc4RUlVbEpXSElQRzRzM1JlWWt2SU9hMDlTUGNMTzh5U3VRd0Qz?=
 =?utf-8?B?NWZvMEgvQ1JKMXU2NTFhUFZ6VExXREFkc1AyZ2c4eWpBSmFRQWdPbFc1S3RS?=
 =?utf-8?B?dzRGOFJzVTg1RncwU0thQjNHSDRjeUVmUHhqMXRSMS85aGRFdnB5d25iOUgy?=
 =?utf-8?B?c0tEeWVFMUpkdTRxVng4d3FQSU1TQytYNU5VR0JHR2NTcUJ6ZGtFN3h5Sk5o?=
 =?utf-8?B?Rk00cytycUlNd2w1b3NpYXo0WUt0dzdlSTAyZ0p1N2kzSXhjOE5yR1crcVFN?=
 =?utf-8?B?NHVDSFJJMFhUL1NYMW05bkEzUENFcDNMSzJqS1NQdkQwSmx2eG8yTzV6KzQz?=
 =?utf-8?B?bFlqR00xcW84OGJiSFUrMHRNdXFZOWlZY3VUOXRsYURCV2ZaZFhCeHRtN0cx?=
 =?utf-8?B?N2xpWUhJbTNuUXhQRnlpVklSN0pINmZyVFFJTll6b0VXSFM5OEZaTzI3d2FU?=
 =?utf-8?B?K3Ayc0lLdDVJbFQ3TzNkeWs5OGN4V0JjaStNTEUzcUl6bkdXV0JCeVo4VjNG?=
 =?utf-8?B?OXNtTHdyQzhTMFFKczZZM1IvRDRnUEJObGFaa3cvUnJqUEJtY2NFalhoU0NE?=
 =?utf-8?B?UkU1QVVQTldBYnowYVFmMDlUZTNyQjlFdEMzSEVIb3JDeVNJNTFOWFgzMkZj?=
 =?utf-8?Q?Rn71P+bW8ZhdOgtqYBwKJfdY7I07SEqZVX?=
Content-ID: <AA28D6F9E38CC942957B0E99C0C72BC1@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3780aa26-fa89-4224-6689-08d896d81c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 15:37:00.7402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0g8aqEzAxautH6RFCc7NJPU+wmy2ffQYT+PXX0DA1f+4zciOqPN/uaFqGoJZW0r+uxFOyOt3A9XxPUFoFDipcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6975
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDIsIDIwMjAsIGF0IDA5OjI3LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiBIaQ0KPiANCj4gQW0gMDIuMTIuMjAgdW0gMDk6
MDEgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+IEhpDQo+PiBBbSAzMC4xMS4yMCB1bSAy
MTo1OSBzY2hyaWViIFphY2sgUnVzaW46DQo+Pj4gDQo+Pj4gDQo+Pj4+IE9uIE5vdiAyNCwgMjAy
MCwgYXQgMDY6MzgsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90
ZToNCj4+Pj4gDQo+Pj4+IFVzaW5nIHN0cnVjdCBkcm1fZGV2aWNlLnBkZXYgaXMgZGVwcmVjYXRl
ZC4gQ29udmVydCB2bXdnZnggdG8gc3RydWN0DQo+Pj4+IGRybV9kZXZpY2UuZGV2LiBObyBmdW5j
dGlvbmFsIGNoYW5nZXMuDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4gQ2M6IFJvbGFuZCBTY2hlaWRlZ2dlciA8
c3JvbGFuZEB2bXdhcmUuY29tPg0KPj4+PiAtLS0NCj4+Pj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfY21kYnVmLmMgfCAgOCArKysrLS0tLQ0KPj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9kcnYuYyAgICB8IDI3ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+Pj4+
IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ZiLmMgICAgIHwgIDIgKy0NCj4+PiANCj4+
PiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4+IENvdWxkIHlv
dSBhZGQgdGhpcyBwYXRjaCB0byB0aGUgdm13Z2Z4IHRyZWU/DQo+IA0KPiBBTUQgZGV2cyBpbmRp
Y2F0ZWQgdGhhdCB0aGV5J2QgcHJlZmVyIHRvIG1lcmdlIHRoZSBwYXRjaHNldCB0cm91Z2ggZHJt
LW1pc2MtbmV4dC4gSWYgeW91J3JlIE9LIHdpdGggdGhhdCwgSSdkIG1lcmdlIHRoZSB2bXdnZngg
cGF0Y2ggdGhyb3VnaCBkcm0tbWlzYy1uZXh0IGFzIHdlbGwuDQoNClNvdW5kcyBnb29kLiBJ4oCZ
bGwgbWFrZSBzdXJlIHRvIHJlYmFzZSBvdXIgbGF0ZXN0IHBhdGNoIHNldCBvbiB0b3Agb2YgaXQg
d2hlbiBpdOKAmXMgaW4uIFRoYW5rcyENCg0KegpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK

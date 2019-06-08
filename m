Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05A39FAD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 14:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6645891EB;
	Sat,  8 Jun 2019 12:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710064.outbound.protection.outlook.com [40.107.71.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F751891EB;
 Sat,  8 Jun 2019 12:37:42 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1241.namprd12.prod.outlook.com (10.168.236.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Sat, 8 Jun 2019 12:37:39 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1965.011; Sat, 8 Jun 2019
 12:37:39 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/amdgpu: Fix bounds checking in
 amdgpu_ras_is_supported()
Thread-Topic: [PATCH] drm/amdgpu: Fix bounds checking in
 amdgpu_ras_is_supported()
Thread-Index: AQHVHdvw2BUFmxvpPkiLYRczcpAQFKaRr3CAgAACsAA=
Date: Sat, 8 Jun 2019 12:37:39 +0000
Message-ID: <3bcce070-801d-7cac-bfea-75858e610a3f@amd.com>
References: <20190608092357.GB28890@mwanda>
 <SN6PR12MB2800185519D425526956EDA687110@SN6PR12MB2800.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB2800185519D425526956EDA687110@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR04CA0148.eurprd04.prod.outlook.com (2603:10a6:207::32)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfb2a1cd-bfbc-4c31-71e6-08d6ec0e17d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1241; 
x-ms-traffictypediagnostic: DM5PR12MB1241:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB12413A29D3C2821CCFA30CDA83110@DM5PR12MB1241.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(39850400004)(396003)(346002)(189003)(199004)(72206003)(25786009)(4326008)(966005)(65806001)(2906002)(486006)(478600001)(46003)(236005)(446003)(606006)(11346002)(7736002)(5660300002)(8936002)(8676002)(316002)(186003)(71190400001)(71200400001)(6116002)(81156014)(81166006)(2616005)(476003)(14454004)(6486002)(66946007)(53936002)(31696002)(65956001)(52116002)(6512007)(110136005)(36756003)(229853002)(76176011)(6246003)(99286004)(31686004)(102836004)(58126008)(54896002)(6306002)(256004)(86362001)(386003)(53546011)(65826007)(64756008)(66446008)(66556008)(66476007)(14444005)(68736007)(6506007)(54906003)(64126003)(73956011)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1241;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h+YuW0hT7y7DD81DZ9E3pAaiXb/z/GgR0mxwUs+Fnq+jrN1n8UNplaEYF+sBssGzXMpP0FPxuDm6i/crtABzxkZFnJJvQwEwJVyQTQcsz/eHe373IN+h8AJPhAUpX2SXTBFl13Rr4yGy5SLr9fH/svDFHSVs9ym6rtSEGjc6b5tXmi8YiGzhnT6RL65vJn9B6O/ejD3Bx5pZgaH0p38SW+4EEBPPzt2rRRk9QJpdHWHnGAGGvA5fDn3/kAtNG57QGmVUfICQX/N3lQlxRb7By63e3MdXFEbPCBcyY9IQBTsliqjS/FwU4G0jETjEEvMXo8Hvd7yAg0/ggCfiaERX1OmbvhGV/z1si1Ed2sSKCwdskrSKn/qDnSjyRUu3a6CGOpspa0nGE2lw30sNnz+JzAOVjemZsf00uC0SH+yGw+Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb2a1cd-bfbc-4c31-71e6-08d6ec0e17d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 12:37:39.6138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1241
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htPFcUtjJgGaLcz5O+ZMVGWkEsWwhtzX53Juk7IhqZ8=;
 b=uPA0KAGfSfPXEx5ck4xNxPPjJZbxZFPz5ajSEpZpopiJlh+/6alG9HyTUrJGJk7J0xyD2kenMvHaVJeCtyBxRhRDoN5guKgTxcWs33JKdsH4OVg+V9yXB+6M6U5ZGR5XEnXe5fN4HvIkSnFUX2jdFVHdzsOuEY1RHfkX63by8V4=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhu,
 James" <James.Zhu@amd.com>
Content-Type: multipart/mixed; boundary="===============1467565520=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1467565520==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3bcce070801d7cacbfea75858e610a3famdcom_"

--_000_3bcce070801d7cacbfea75858e610a3famdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCB0aGF0IGlzIHVuZGVmaW5lZCBiZWhhdmlvciB3aGF0IHlvdSBkbyBoZXJlLg0KDQpTZWUg
aGVyZSBhcyB3ZWxsIGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzExMjcwNDky
L3doYXQtZG9lcy10aGUtYy1zdGFuZGFyZC1zYXktYWJvdXQtYml0c2hpZnRpbmctbW9yZS1iaXRz
LXRoYW4tdGhlLXdpZHRoLW9mLXR5cGUuDQoNCkNocmlzdGlhbi4NCg0KQW0gMDguMDYuMTkgdW0g
MTQ6Mjcgc2NocmllYiBQYW4sIFhpbmh1aToNCmRvIHlvdSBtZWFuIHRoYXQgc29tZXRoaW5nIGxp
a2UgMTw8NjUgbWlnaHQgYmUgYSBub25lIHplcm8gdmFsdWU/DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KRnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPjxtYWlsdG86ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPg0KU2VudDogU2F0dXJkYXksIEp1
bmUgOCwgMjAxOSA1OjIzOjU3IFBNDQpUbzogRGV1Y2hlciwgQWxleGFuZGVyOyBQYW4sIFhpbmh1
aQ0KQ2M6IEtvZW5pZywgQ2hyaXN0aWFuOyBaaG91LCBEYXZpZChDaHVuTWluZyk7IERhdmlkIEFp
cmxpZTsgRGFuaWVsIFZldHRlcjsgUXVhbiwgRXZhbjsgWmh1LCBKYW1lczsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc8bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsg
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86ZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz47IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc8bWFpbHRvOmtl
cm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRn
cHU6IEZpeCBib3VuZHMgY2hlY2tpbmcgaW4gYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoKQ0KDQpU
aGUgImJsb2NrIiB2YXJpYWJsZSBjYW4gYmUgc2V0IGJ5IHRoZSB1c2VyIHRocm91Z2ggZGVidWdm
cywgc28gaXQgY2FuDQpiZSBxdWl0ZSBsYXJnZSB3aGljaCBsZWFkcyB0byBzaGlmdCB3cmFwcGlu
ZyBoZXJlLiAgVGhpcyBtZWFucyB3ZSByZXBvcnQNCmEgImJsb2NrIiBhcyBzdXBwb3J0ZWQgd2hl
biBpdCdzIG5vdCwgYW5kIHRoYXQgbGVhZHMgdG8gYXJyYXkgb3ZlcmZsb3dzDQpsYXRlciBvbi4N
Cg0KVGhpcyBidWcgaXMgbm90IHJlYWxseSBhIHNlY3VyaXR5IGlzc3VlIGluIHJlYWwgbGlmZSwg
YmVjYXVzZSBkZWJ1Z2ZzIGlzDQpnZW5lcmFsbHkgcm9vdCBvbmx5Lg0KDQpGaXhlczogMzZlYTFi
ZDJkMDg0ICgiZHJtL2FtZGdwdTogYWRkIGRlYnVnZnMgY3RybCBub2RlIikNClNpZ25lZC1vZmYt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT48bWFpbHRvOmRhbi5j
YXJwZW50ZXJAb3JhY2xlLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuaCB8IDIgKysNCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCmluZGV4IGM2YjM0ZmJkNjk1Zi4u
OTRjNjUyZjUyNjVhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgN
CkBAIC0xNzMsNiArMTczLDggQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19pc19zdXBw
b3J0ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogew0KICAgICAgICAgc3RydWN0IGFt
ZGdwdV9yYXMgKnJhcyA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7DQoNCisgICAgICAg
aWYgKGJsb2NrID49IEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQpDQorICAgICAgICAgICAgICAgcmV0
dXJuIDA7DQogICAgICAgICByZXR1cm4gcmFzICYmIChyYXMtPnN1cHBvcnRlZCAmICgxIDw8IGJs
b2NrKSk7DQogfQ0KDQotLQ0KMi4yMC4xDQoNCg0K

--_000_3bcce070801d7cacbfea75858e610a3famdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D2CFEC3CEA26324293A3D89A5A4BEC05@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5ZZXMsIHRo
YXQgaXMgdW5kZWZpbmVkIGJlaGF2aW9yIHdoYXQgeW91IGRvIGhlcmUuPGJyPg0KPGJyPg0KU2Vl
IGhlcmUgYXMgd2VsbCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRw
czovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy8xMTI3MDQ5Mi93aGF0LWRvZXMtdGhlLWMt
c3RhbmRhcmQtc2F5LWFib3V0LWJpdHNoaWZ0aW5nLW1vcmUtYml0cy10aGFuLXRoZS13aWR0aC1v
Zi10eXBlIj4NCmh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzExMjcwNDkyL3do
YXQtZG9lcy10aGUtYy1zdGFuZGFyZC1zYXktYWJvdXQtYml0c2hpZnRpbmctbW9yZS1iaXRzLXRo
YW4tdGhlLXdpZHRoLW9mLXR5cGU8L2E+Ljxicj4NCjxicj4NCkNocmlzdGlhbi48YnI+DQo8YnI+
DQpBbSAwOC4wNi4xOSB1bSAxNDoyNyBzY2hyaWViIFBhbiwgWGluaHVpOjxicj4NCjwvZGl2Pg0K
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOlNONlBSMTJNQjI4MDAxODU1MTlENDI1
NTI2OTU2RURBNjg3MTEwQFNONlBSMTJNQjI4MDAubmFtcHJkMTIucHJvZC5vdXRsb29rLmNvbSI+
DQo8bWV0YSBuYW1lPSJHZW5lcmF0b3IiIGNvbnRlbnQ9Ik1pY3Jvc29mdCBFeGNoYW5nZSBTZXJ2
ZXIiPg0KPCEtLSBjb252ZXJ0ZWQgZnJvbSB0ZXh0IC0tPjxzdHlsZT48IS0tIC5FbWFpbFF1b3Rl
IHsgbWFyZ2luLWxlZnQ6IDFwdDsgcGFkZGluZy1sZWZ0OiA0cHQ7IGJvcmRlci1sZWZ0OiAjODAw
MDAwIDJweCBzb2xpZDsgfSAtLT48L3N0eWxlPg0KPGRpdj4NCjxkaXYgZGlyPSJhdXRvIiBzdHls
ZT0iZGlyZWN0aW9uOmx0cjsgbWFyZ2luOjA7IHBhZGRpbmc6MDsNCiAgICAgICAgICBmb250LWZh
bWlseTpzYW5zLXNlcmlmOyBmb250LXNpemU6MTFwdDsgY29sb3I6YmxhY2siPg0KZG8geW91IG1l
YW4gdGhhdCBzb21ldGhpbmcgbGlrZSAxJmx0OyZsdDs2NSBtaWdodCBiZSBhIG5vbmUgemVybyB2
YWx1ZT88L2Rpdj4NCjxociB0YWJpbmRleD0iLTEiIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9j
azsgd2lkdGg6OTglIj4NCjxkaXYgaWQ9InhfZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250
IHN0eWxlPSJmb250LXNpemU6MTFwdCIgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgY29sb3I9
IiMwMDAwMDAiPjxiPkZyb206PC9iPiBEYW4gQ2FycGVudGVyDQo8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tIj4mbHQ7
ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tJmd0OzwvYT48YnI+DQo8Yj5TZW50OjwvYj4gU2F0dXJk
YXksIEp1bmUgOCwgMjAxOSA1OjIzOjU3IFBNPGJyPg0KPGI+VG86PC9iPiBEZXVjaGVyLCBBbGV4
YW5kZXI7IFBhbiwgWGluaHVpPGJyPg0KPGI+Q2M6PC9iPiBLb2VuaWcsIENocmlzdGlhbjsgWmhv
dSwgRGF2aWQoQ2h1bk1pbmcpOyBEYXZpZCBBaXJsaWU7IERhbmllbCBWZXR0ZXI7IFF1YW4sIEV2
YW47IFpodSwgSmFtZXM7DQo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVm
PSJtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmciPmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPC9hPjsNCjxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhy
ZWY9Im1haWx0bzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIj4NCmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc8L2E+OyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlh
dGVkIiBocmVmPSJtYWlsdG86a2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZyI+DQprZXJu
ZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnPC9hPjxicj4NCjxiPlN1YmplY3Q6PC9iPiBbUEFU
Q0hdIGRybS9hbWRncHU6IEZpeCBib3VuZHMgY2hlY2tpbmcgaW4gYW1kZ3B1X3Jhc19pc19zdXBw
b3J0ZWQoKTwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPGZvbnQg
c2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFp
blRleHQiPlRoZSAmcXVvdDtibG9jayZxdW90OyB2YXJpYWJsZSBjYW4gYmUgc2V0IGJ5IHRoZSB1
c2VyIHRocm91Z2ggZGVidWdmcywgc28gaXQgY2FuPGJyPg0KYmUgcXVpdGUgbGFyZ2Ugd2hpY2gg
bGVhZHMgdG8gc2hpZnQgd3JhcHBpbmcgaGVyZS4mbmJzcDsgVGhpcyBtZWFucyB3ZSByZXBvcnQ8
YnI+DQphICZxdW90O2Jsb2NrJnF1b3Q7IGFzIHN1cHBvcnRlZCB3aGVuIGl0J3Mgbm90LCBhbmQg
dGhhdCBsZWFkcyB0byBhcnJheSBvdmVyZmxvd3M8YnI+DQpsYXRlciBvbi48YnI+DQo8YnI+DQpU
aGlzIGJ1ZyBpcyBub3QgcmVhbGx5IGEgc2VjdXJpdHkgaXNzdWUgaW4gcmVhbCBsaWZlLCBiZWNh
dXNlIGRlYnVnZnMgaXM8YnI+DQpnZW5lcmFsbHkgcm9vdCBvbmx5Ljxicj4NCjxicj4NCkZpeGVz
OiAzNmVhMWJkMmQwODQgKCZxdW90O2RybS9hbWRncHU6IGFkZCBkZWJ1Z2ZzIGN0cmwgbm9kZSZx
dW90Oyk8YnI+DQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpkYW4uY2FycGVudGVyQG9yYWNsZS5jb20iPg0K
Jmx0O2Rhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbSZndDs8L2E+PGJyPg0KLS0tPGJyPg0KJm5ic3A7
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIHwgMiAmIzQzOyYjNDM7PGJy
Pg0KJm5ic3A7MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygmIzQzOyk8YnI+DQo8YnI+DQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oPGJyPg0KaW5kZXggYzZiMzRmYmQ2
OTVmLi45NGM2NTJmNTI2NWEgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5oPGJyPg0KJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oPGJyPg0KQEAgLTE3Myw2ICYjNDM7MTczLDggQEAgc3Rh
dGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsPGJyPg0KJm5ic3A7ezxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBzdHJ1Y3QgYW1kZ3B1X3JhcyAqcmFzID0gYW1kZ3B1X3Jhc19n
ZXRfY29udGV4dChhZGV2KTs8YnI+DQombmJzcDs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoYmxvY2sgJmd0Oz0gQU1ER1BVX1JBU19CTE9DS19DT1VO
VCk8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gMDs8YnI+DQom
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIHJh
cyAmYW1wOyZhbXA7IChyYXMtJmd0O3N1cHBvcnRlZCAmYW1wOyAoMSAmbHQ7Jmx0OyBibG9jaykp
Ozxicj4NCiZuYnNwO308YnI+DQombmJzcDs8YnI+DQotLSA8YnI+DQoyLjIwLjE8YnI+DQo8YnI+
DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9ibG9ja3F1b3RlPg0KPGJyPg0KPC9ib2R5Pg0KPC9o
dG1sPg0K

--_000_3bcce070801d7cacbfea75858e610a3famdcom_--

--===============1467565520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1467565520==--

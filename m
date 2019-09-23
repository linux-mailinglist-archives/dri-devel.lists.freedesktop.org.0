Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7294BC243
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496706E9C0;
	Tue, 24 Sep 2019 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150088.outbound.protection.outlook.com [40.107.15.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071F56E99E;
 Mon, 23 Sep 2019 21:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bx3BWJaVzuclcnSCCTZ3+q9kSC6XqcHz9tDIbHMdjWMdejkCN/Q6ad7q8EqXXXSqIMKvV7e09AQ3Y0V/AzDvL0I8j1SsREJXEc+TR9neWP60/pEg6MdLBGq39LbVN5tV3nr4svlt/IoO8yBlLlqVJW4VnW6jQB00qvqLlwAaHtu+MafUgGVm9UUeJqsPD0tfOXpK3vQ0+UXDdz3x1NhlI3kspxpAlRRQDU2mZj0wkYaJf8nUI8NR+DDBqi1fy25M/C6oxQmUNjzSE9jPKjEjK8MommiRsdfqRc8JJf4NOrDGiPn/tvYqmzE0lynz5QEM09tARHeuS1XLNGrX4b+2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUgww1O+SotrZSvEPpBNEqpue37Qo5fZklgsQJmJva4=;
 b=efmaCXrY5cFWnolQdk9qVUgIMfj5srbRT7La8Vmz3G9BxJHenIydTK2cfuUQvfUiIyQ2BIuQCG6SDh1Fq2XUomXyZkorgkItNlSAkOM8XVqa4rQiJyRqlDS84ylium+Dx7v9V9pLCB+CIJRRDmH6v9qJAqQl+ZNReAeU4aXLpovKLmO+c0zmw4XzdG74VMH0LDBMapdib9YE7B2oLyFbN1tnusiEP9lxk57g5VvlAWddXRvBeenXZn7C3nKXbKapzR5NyHvouD/hX8uzawPkAtukTLyQMXvw7sLWXA1kXoIm5wxT5XEiXsidGF+ymgnHwlWMo6UkEYa+vQXcZ1Fiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com (20.176.214.160) by
 AM0PR05MB4913.eurprd05.prod.outlook.com (20.177.41.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Mon, 23 Sep 2019 21:02:39 +0000
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::bc4c:7c4c:d3e2:8b28]) by AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::bc4c:7c4c:d3e2:8b28%6]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 21:02:39 +0000
From: Parav Pandit <parav@mellanox.com>
To: Jason Wang <jasowang@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>
Subject: RE: [PATCH 1/6] mdev: class id support
Thread-Topic: [PATCH 1/6] mdev: class id support
Thread-Index: AQHVcg9tP+s325DFukm8x3s6EiJzu6c5v99w
Date: Mon, 23 Sep 2019 21:02:38 +0000
Message-ID: <AM0PR05MB486657BB8E48F744D219CF9BD1850@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-2-jasowang@redhat.com>
In-Reply-To: <20190923130331.29324-2-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.176.44.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75c0b691-181e-4156-7702-08d740695e12
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR05MB4913; 
x-ms-traffictypediagnostic: AM0PR05MB4913:|AM0PR05MB4913:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR05MB49134659721B286F51A1A69ED1850@AM0PR05MB4913.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(346002)(366004)(396003)(136003)(376002)(199004)(189003)(13464003)(7406005)(256004)(478600001)(26005)(55016002)(6436002)(486006)(229853002)(102836004)(71200400001)(53546011)(25786009)(76176011)(71190400001)(6506007)(54906003)(316002)(7696005)(446003)(110136005)(186003)(52536014)(9686003)(966005)(5660300002)(11346002)(6306002)(64756008)(7736002)(3846002)(6116002)(66476007)(66066001)(66446008)(476003)(2501003)(74316002)(2906002)(4326008)(81166006)(81156014)(8676002)(8936002)(66946007)(66556008)(305945005)(86362001)(76116006)(6246003)(14454004)(7416002)(99286004)(2201001)(33656002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB4913;
 H:AM0PR05MB4866.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4fhTK+flDcZ2Jj7ds0yII8EAdhFtYJtyJGhrvd6cCn9iVvOydVcSmirbFmKp/sOCHTzXoli8YLtXp1aQwAcmCFEASxkM3Huj2Cf1MZO/AqD9aKLYcYqK3dFg8pHgEhvgaRiqRiOsVDlLchs1i8zZhZNP2vZmDokNApGRfO2ZeZKoRw3HVc/ip04UgYlqJIK7Xtki+zmsDCbVA52t2RGhFPX2bYm7TldrGGYKqgmbOHcVi8Wz/GySOlQO3JxAuZdDKaP+kcNcePV/XriBYqNYSt7yiz5Y/UB/YLjdH2lnVmP8IvAQQGFR69+u6bnl8JwprD44YX0N+O2dzgHADhTdlrmm/RP9Ls+de+WRvn1m514fXaT1j28eWlw8QgIImcDoH3udKpQTAja0FnIb38ajYVOrjMmESM2nUhQ1CnLeLeY=
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c0b691-181e-4156-7702-08d740695e12
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 21:02:38.8737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZYdqqU8fCZF62yOFudeIR+5hhqf4+mL9KDaGh3yNO7TGXerVBrjm1J+hztV9sOHKPVNGFUcTb0A6s0YkZSdFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4913
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUgww1O+SotrZSvEPpBNEqpue37Qo5fZklgsQJmJva4=;
 b=FtHAMnug5/xWIjub1VPMDx8+7WHJtaXHZ+Yuh8Kl8XoaB1+QbPN/bBEPJ+P/Rg+L6Dsn3WX7/CdbK6YpQnYHjF+PNZF3+72mWh8fjoaQjg8DVag+rP/Ai8bsZcxACw8tQ3dPle8+PAjInFDFivz32BNCFeyVaRexwely1r1/i5k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=parav@mellanox.com; 
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
Cc: "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFzb24sCgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMjMsIDIw
MTkgODowMyBBTQo+IFRvOiBrdm1Admdlci5rZXJuZWwub3JnOyBsaW51eC1zMzkwQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4ga3dhbmtoZWRlQG52aWRpYS5jb207
IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsKPiB0aXdlaS5iaWVA
aW50ZWwuY29tCj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
OyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOwo+IGNvaHVja0ByZWRoYXQuY29tOyBtYXhpbWUuY29x
dWVsaW5AcmVkaGF0LmNvbTsKPiBjdW5taW5nLmxpYW5nQGludGVsLmNvbTsgemhpaG9uZy53YW5n
QGludGVsLmNvbTsKPiByb2IubWlsbGVyQGJyb2FkY29tLmNvbTsgeGlhby53LndhbmdAaW50ZWwu
Y29tOwo+IGhhb3RpYW4ud2FuZ0BzaWZpdmUuY29tOyB6aGVueXV3QGxpbnV4LmludGVsLmNvbTsg
emhpLmEud2FuZ0BpbnRlbC5jb207Cj4gamFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tOyBqb29u
YXMubGFodGluZW5AbGludXguaW50ZWwuY29tOwo+IHJvZHJpZ28udml2aUBpbnRlbC5jb207IGFp
cmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsKPiBmYXJtYW5AbGludXguaWJtLmNvbTsg
cGFzaWNAbGludXguaWJtLmNvbTsgc2Vib3R0QGxpbnV4LmlibS5jb207Cj4gb2JlcnBhckBsaW51
eC5pYm0uY29tOyBoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tOyBnb3JAbGludXguaWJtLmNvbTsK
PiBib3JudHJhZWdlckBkZS5pYm0uY29tOyBha3Jvd2lha0BsaW51eC5pYm0uY29tOyBmcmV1ZGVA
bGludXguaWJtLmNvbTsKPiBsaW5nc2hhbi56aHVAaW50ZWwuY29tOyBJZG8gU2hhbWF5IDxpZG9z
QG1lbGxhbm94LmNvbT47Cj4gZXBlcmV6bWFAcmVkaGF0LmNvbTsgbHVsdUByZWRoYXQuY29tOyBQ
YXJhdiBQYW5kaXQKPiA8cGFyYXZAbWVsbGFub3guY29tPjsgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMS82XSBtZGV2OiBjbGFzcyBpZCBzdXBwb3J0
Cj4gCj4gTWRldiBidXMgb25seSBzdXBwb3J0cyB2ZmlvIGRyaXZlciByaWdodCBub3csIHNvIGl0
IGRvZXNuJ3QgaW1wbGVtZW50IG1hdGNoCj4gbWV0aG9kLiBCdXQgaW4gdGhlIGZ1dHVyZSwgd2Ug
bWF5IGFkZCBkcml2ZXJzIG90aGVyIHRoYW4gdmZpbywgb25lIGV4YW1wbGUgaXMKPiB2aXJ0aW8t
bWRldlsxXSBkcml2ZXIuIFRoaXMgbWVhbnMgd2UgbmVlZCB0byBhZGQgZGV2aWNlIGNsYXNzIGlk
IHN1cHBvcnQgaW4gYnVzCj4gbWF0Y2ggbWV0aG9kIHRvIHBhaXIgdGhlIG1kZXYgZGV2aWNlIGFu
ZCBtZGV2IGRyaXZlciBjb3JyZWN0bHkuCj4gCj4gU28gdGhpcyBwYXRjaCBhZGRzIGlkX3RhYmxl
IHRvIG1kZXZfZHJpdmVyIGFuZCBjbGFzc19pZCBmb3IgbWRldiBwYXJlbnQgd2l0aAo+IHRoZSBt
YXRjaCBtZXRob2QgZm9yIG1kZXYgYnVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92
ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgfCAgNyArKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9rdm1ndC5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3MzOTAv
Y2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9z
MzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgICAgICB8ICAzICsrLQo+ICBkcml2
ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysr
KysrKysrLS0KPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyAgICAgICAgICAgICAg
ICAgICB8IDE0ICsrKysrKysrKysrKysrCj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0
ZS5oICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRl
di5jICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPiAgaW5jbHVkZS9saW51eC9tZGV2
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKy0KPiAgaW5jbHVkZS9s
aW51eC9tb2RfZGV2aWNldGFibGUuaCAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrCj4g
IHNhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gIDEzIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQo+IApZb3UgYWRkaXRpb25hbGx5IG5lZWQgbW9kcG9zdCBzdXBwb3J0IGZvciBpZCB0
YWJsZSBpbnRlZ3JhdGlvbiB0byBtb2RpZm8sIG1vZHByb2JlIGFuZCBvdGhlciB0b29scy4KQSBz
bWFsbCBwYXRjaCBzaW1pbGFyIHRvIHRoaXMgb25lIFsxXSBpcyBuZWVkZWQuClBsZWFzZSBpbmNs
dWRlIGluIHRoZSBzZXJpZXMuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3Jr
L3BhdGNoLzEwNDY5OTEvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

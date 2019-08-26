Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1659D5E3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AE96E294;
	Mon, 26 Aug 2019 18:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720057.outbound.protection.outlook.com [40.107.72.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712C66E294
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E76wkNq24moVActUK1xPX5/GIRpIfQ4fPOVE2FUsKjMiH7wgfNUqaTg3/nktpgTlK8rVQ4PMYa+r+slSI7Cz3PgiZE2d3nJmmKS3RCiZbzXVbk4KUC0hOnATxQ6Hu9VGkZT/SAA6deht/Gu/LlnmJvJe/S7ZvvR0+nTBIOVKM7+OR/tLx7WBnqlpkhvPhco/QzOCXjQdCp/I2fJEgKy78GF0aKBp8aDAx801wAD7n2K1lNNOdu069f/c8C2AblJiArIEcanIe7AmETYdz2BytFOrRprrJJGVCMDefS5vHVGJP4dCd2pi2wYpaCKOoFam4SHehrRqwwpLQbl3MwEzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/OXG7dv9zjnd2KjHXzWVFM2sXMTotWp2Qx8y/50jCU=;
 b=BpNr3c9HQ+wnmZJNoLMsB1OgqRqEZsPPVkTGyCWcUcJ/d05LSXVRjpynknX108U5ZDf76sb1l+V/szi/nrT/0qPEWEHRHinl/tgHgC8iPOqNlmtAIYp9EMlJ8XIvoyz9RrwbqDk3kBnjgIzuzWxJMfw8vy9fn93FcN1mj0R2dETQbrM5RC0l3fEA7Xvm47hnFswl7AetgxPlbpfViWdlt2pQCUt0q6vyiy0s7OpNrAZltVxqr3iVMwgKRBck9z7HKdvPKD8KXkmepjLwsWR994jrcYN6lLs+oo/ytmyLYOYNtFUtNkM3DEgr60gEswH2df/gMKCRveVXdS1PTf53yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 18:36:16 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 18:36:16 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v8 2/6] drm/dp_mst: Parse FEC capability on MST ports
Thread-Topic: [PATCH v8 2/6] drm/dp_mst: Parse FEC capability on MST ports
Thread-Index: AQHVXDjWQQOpnfR0t02tnAhgDYRsW6cNwdUA
Date: Mon, 26 Aug 2019 18:36:16 +0000
Message-ID: <d3aaa435-cc80-ef71-cd6e-3183590defe1@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
 <20190826180507.17802-3-David.Francis@amd.com>
In-Reply-To: <20190826180507.17802-3-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e7c3baa-dad9-419d-8f55-08d72a544782
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0037; 
x-ms-traffictypediagnostic: CY4PR1201MB0037:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00377DD510BF2AD7717CEAC38CA10@CY4PR1201MB0037.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(110136005)(58126008)(8936002)(66946007)(6246003)(6436002)(386003)(229853002)(53546011)(65956001)(65806001)(66066001)(52116002)(6512007)(53936002)(14454004)(6506007)(25786009)(478600001)(5660300002)(305945005)(186003)(66556008)(446003)(66476007)(66446008)(11346002)(316002)(64756008)(31686004)(7736002)(256004)(6486002)(71200400001)(2906002)(8676002)(81166006)(2501003)(76176011)(31696002)(102836004)(476003)(71190400001)(486006)(6116002)(26005)(3846002)(81156014)(36756003)(2616005)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0037;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PYmVjraOD+4vKHcLdXl2ytIErfbm7lsTjC2ET+7sjzzNnu//SZi9n3QP0dP3lKJkkbBbezO1AeEtuijwxq9f/b51RqIoMsmDNWadLZ/dtREkXdB2YJit2yiovGh2DdIxcP06j4TfWWhmuGZYlzZJP2q2CqIgeD+EV3zbfp/Y/8lfl6HJZ8dZYVh9RWHjW47N5p//XmVcH0aKn7FWEQcJcqhXcx392/Aj/ar/IF+n8Z4G16Pols9ECS4gy/iy1PubMENOLR07my66wbjwRuwo52psEnSd9ONCjWzX8ZY4pTzn9w+5ON/er4Q44Zvmr9O0VGIwNr5GZ0u+REQxIcr6LILtUifp+fcT57ilL2jcwsZrf3+bkAPWBhTXWSWb2hvKDTZ11Auv2MQRlJnh3jPcaFcJmsWfG+YBsg7WZWVkF2g=
Content-ID: <92B1814F439261439DB71B89D016FF13@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7c3baa-dad9-419d-8f55-08d72a544782
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 18:36:16.4021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9Gk5nUJC3QLaw7RONpOPCtADvEy6bUjcRnG7pnq0+/DlrTwYZVT/9vC+FknHOGv3SEnyXOYfUMQkZWw88HCwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/OXG7dv9zjnd2KjHXzWVFM2sXMTotWp2Qx8y/50jCU=;
 b=s1hdb5sIveBfDETRv7RR/hBK2ElhTBdSeyH6PcqhmvsDN++dVBtXilodPLECshf46VhVMLyDXwvPkx1vipRRU7TrXodxcmBisXx868FxXqVasyoVsYhHm/Z2NFPyaxNCHQwDS4L9kEOv4WLNW4/wi4uVPsZHBErJ+PA7+78cK1g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

DQoNCk9uIDIwMTktMDgtMjYgMjowNSBwLm0uLCBEYXZpZCBGcmFuY2lzIHdyb3RlOg0KPiBBcyBv
ZiBEUDEuNCwgRU5VTV9QQVRIX1JFU09VUkNFUyByZXR1cm5zIGEgYml0IGluZGljYXRpbmcNCj4g
aWYgRkVDIGNhbiBiZSBzdXBwb3J0ZWQgdXAgdG8gdGhhdCBwb2ludCBpbiB0aGUgTVNUIG5ldHdv
cmsuDQo+IA0KPiBUaGUgYml0IGlzIHRoZSBmaXJzdCBieXRlIG9mIHRoZSBFTlVNX1BBVEhfUkVT
T1VSQ0VTIGFjayByZXBseSwNCj4gYm90dG9tLW1vc3QgYml0IChyZWZlciB0byBzZWN0aW9uIDIu
MTEuOS40IG9mIERQIHN0YW5kYXJkLA0KPiB2MS40KQ0KPiANCj4gVGhhdCB2YWx1ZSBpcyBuZWVk
ZWQgZm9yIEZFQyBhbmQgRFNDIHN1cHBvcnQNCj4gDQo+IFN0b3JlIGl0IG9uIGRybV9kcF9tc3Rf
cG9ydA0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0Bh
bWQuY29tPg0KPiBSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpI
YXJyeQ0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8
IDIgKysNCj4gIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAzICsrKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiBpbmRleCAzZTdiNzU1M2NmNGQuLjlmMzYwNDM1NTcwNSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jDQo+IEBAIC01NTMsNiAr
NTUzLDcgQEAgc3RhdGljIGJvb2wgZHJtX2RwX3NpZGViYW5kX3BhcnNlX2VudW1fcGF0aF9yZXNv
dXJjZXNfYWNrKHN0cnVjdCBkcm1fZHBfc2lkZWJhbmQNCj4gIHsNCj4gIAlpbnQgaWR4ID0gMTsN
Cj4gIAlyZXBtc2ctPnUucGF0aF9yZXNvdXJjZXMucG9ydF9udW1iZXIgPSAocmF3LT5tc2dbaWR4
XSA+PiA0KSAmIDB4ZjsNCj4gKwlyZXBtc2ctPnUucGF0aF9yZXNvdXJjZXMuZmVjX2NhcGFibGUg
PSByYXctPm1zZ1tpZHhdICYgMHgxOw0KPiAgCWlkeCsrOw0KPiAgCWlmIChpZHggPiByYXctPmN1
cmxlbikNCj4gIAkJZ290byBmYWlsX2xlbjsNCj4gQEAgLTIxODMsNiArMjE4NCw3IEBAIHN0YXRp
YyBpbnQgZHJtX2RwX3NlbmRfZW51bV9wYXRoX3Jlc291cmNlcyhzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1nciwNCj4gIAkJCURSTV9ERUJVR19LTVMoImVudW0gcGF0aCByZXNvdXJj
ZXMgJWQ6ICVkICVkXG4iLCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5wb3J0X251bWJl
ciwgdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZnVsbF9wYXlsb2FkX2J3X251bWJlciwN
Cj4gIAkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5hdmFpbF9wYXlsb2Fk
X2J3X251bWJlcik7DQo+ICAJCQlwb3J0LT5hdmFpbGFibGVfcGJuID0gdHhtc2ctPnJlcGx5LnUu
cGF0aF9yZXNvdXJjZXMuYXZhaWxfcGF5bG9hZF9id19udW1iZXI7DQo+ICsJCQlwb3J0LT5mZWNf
Y2FwYWJsZSA9IHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmZlY19jYXBhYmxlOw0KPiAg
CQl9DQo+ICAJfQ0KPiAgDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hl
bHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaA0KPiBpbmRleCA5MTE2YjJj
OTUyMzkuLmYxMTNhZTA0ZmE4OCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21z
dF9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oDQo+IEBA
IC0xMDgsNiArMTA4LDggQEAgc3RydWN0IGRybV9kcF9tc3RfcG9ydCB7DQo+ICAJICogYXVkaW8t
Y2FwYWJsZS4NCj4gIAkgKi8NCj4gIAlib29sIGhhc19hdWRpbzsNCj4gKw0KPiArCWJvb2wgZmVj
X2NhcGFibGU7DQo+ICB9Ow0KPiAgDQo+ICAvKioNCj4gQEAgLTMxMiw2ICszMTQsNyBAQCBzdHJ1
Y3QgZHJtX2RwX3BvcnRfbnVtYmVyX3JlcSB7DQo+ICANCj4gIHN0cnVjdCBkcm1fZHBfZW51bV9w
YXRoX3Jlc291cmNlc19hY2tfcmVwbHkgew0KPiAgCXU4IHBvcnRfbnVtYmVyOw0KPiArCWJvb2wg
ZmVjX2NhcGFibGU7DQo+ICAJdTE2IGZ1bGxfcGF5bG9hZF9id19udW1iZXI7DQo+ICAJdTE2IGF2
YWlsX3BheWxvYWRfYndfbnVtYmVyOw0KPiAgfTsNCj4gDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

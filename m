Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE049B63B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 20:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261A76ED16;
	Fri, 23 Aug 2019 18:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF97C6ED16;
 Fri, 23 Aug 2019 18:32:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDLE1IDXbEyd6YRx36wbCM9fsuY8Z+ytOZGGm71sSDWEHsyyw+NlvWLb25WfEdhFEJlOv+BbQYKthD4J9r2IQCJgUQ9VWGz4Ot+Pz5aO/2IWr+sC+JZ8iJyfJ6/0Wlb41c3GQqjUGj/S3hIthgpdauwWNqJI8r1DnzUFZFAzsV+k4gG0i/Sa5wWx+w4V0FQDg0Vz+0xiofFLYUa2tSsBlxQBURBrEmBB72dO5ViaWmq42DtgTquMpnk3yXGGL3MpPcMcqcwXMwjAs5mQ55+Kf4nUFgaZbg6Yb/PK9sF/GM3KidA1H6ecup9z1pXMibJYpXX3mtRxIECnfAX0nKwueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXIreVSstfon8e/GDT9A7Af6OYL/bRHkPlpyRnC4VIo=;
 b=clEm7HtCR7pzQCFRHQBfbz75kn46a1YaUMvaXhXXV9jnJfRUqtR/ey0UfMBjlJF1bHcRBDm957fqaCBoeBnffBl/irn6oCPksPVqESaFU6LEi10noDkHT+sbBZm9zzy5SP3L1y5EhHtsNaePf6R9bQsDK95UrtUKz8g5HhyArNN/FzraR++hAx0qkVqV9RaHfLQY7qT0yBqd6mMdgqqpczwfZdlv6EwYSWSiD8RS832rGq8WxrfVh523YlN69/xyf9iCgwgTxD0MZgPvOEvVrJo22Qw0b1gH6TJzucxoaJoD8BgkDP9xDnAljkMz0Ml5z0EN6Kv7jHIXR5/7SSsUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2534.namprd12.prod.outlook.com (10.172.121.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Fri, 23 Aug 2019 18:32:58 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 18:32:58 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/drm_connector: add additional aspect ratio values
Thread-Topic: [PATCH] drm/drm_connector: add additional aspect ratio values
Thread-Index: AQHVWTQDWkSYlYvVBk+Uwe25+5gGaacJD/QA
Date: Fri, 23 Aug 2019 18:32:58 +0000
Message-ID: <d58f94d1-fff2-848e-1e34-803a9a865b45@amd.com>
References: <20190822215002.17836-1-waynelin@amd.com>
In-Reply-To: <20190822215002.17836-1-waynelin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::16) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58a9b67b-8ff1-4e30-7425-08d727f8524b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2534; 
x-ms-traffictypediagnostic: CY4PR1201MB2534:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB253458DAB242C10F53D98F788CA40@CY4PR1201MB2534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(6486002)(110136005)(58126008)(36756003)(8936002)(305945005)(6246003)(7736002)(64756008)(66066001)(66446008)(65956001)(65806001)(66556008)(450100002)(71200400001)(66946007)(316002)(66476007)(5660300002)(229853002)(2201001)(4326008)(31696002)(53936002)(256004)(71190400001)(31686004)(102836004)(6436002)(54906003)(81166006)(81156014)(8676002)(186003)(14454004)(26005)(476003)(2616005)(6116002)(478600001)(11346002)(446003)(486006)(99286004)(2906002)(386003)(6506007)(6512007)(76176011)(52116002)(2501003)(3846002)(25786009)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2534;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hy3VHBN9QZufVDwS6DS2LW4bkMDoXXWtufHXwbZyld8DJsr8wm7X8GYRNGtjDwZ/Oe/WA5/37kehBDshqfjh8k4WUYJ5SlLQ9PtBf8006ndLB1lR5oK2LmTNcO5JQAG08OjRIP/hfbYGG5lMXg2dCaZ/RQFe4IhbQRSwc08eMf3zuo2+Mc0ECR8+FhZpTXIMxHzYGCdiZU6Qfzg29kMlJ8XOLPw05wz1CdNVyUQJib886yLKWj69Ym6xRBNN9H/R55zBlePPl80duEUGPC6KYssoD6okTNOmhCHvzuwajJi8i7bYfD5QvMifbZSsOw6KHkt6JU+QZ5Mzt2FaxtrwlkBld1bNZAcRGKl8eHWfs1p27AWviVGFp+TVCNMSsfTGDFBN7X5hu1JV/1zka743b2U7WRPuyLzO7mDeWS1fpnQ=
Content-ID: <0E14EB75EF34364A94DD1BB77EDE577B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a9b67b-8ff1-4e30-7425-08d727f8524b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 18:32:58.5732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GF2zIzFZMnJ8v8oukfjN/R/ICXUVsOmpbcxk8WvbjxgD4r2xEUrYbk5aZDuxCfJ26R+lCrURnvP+XNtpvMNWVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXIreVSstfon8e/GDT9A7Af6OYL/bRHkPlpyRnC4VIo=;
 b=gLeSsEYQ2AuoSDvcmko2w3W2BGJGqQ8q1onePt5t7R94HNyLSy9Ntv2yKYgc3RGgz1SefL7k4UtosOoBanCt0qbPlqYMC4VyDNausq5pCRgjsU7iqd9XGFu+QyVaLRgFx+lzxEX4UDXtHYa2BX57i7iwOm5N28hc7kcTFKBRm9U=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yMiA1OjUwIHAubS4sIFdheW5lIExpbiB3cm90ZToNCj4gRm9yIEhETUkyLjAg
Q1RTIGl0ZW0gLSBIRjEtMzUsIGl0IHZlcmlmaWVzIGlmIHRoZSBzb3VyY2UgZ2VuZXJhdGVzDQo+
IHZpZGVvIHRpbWluZyAiNjQ6MjciIHZpZGVvIGZvcm1hdCBjb3JyZWN0bHkuDQo+IA0KPiBlZzog
KHZpYy03NikgMTkyMHgxMDgwcEA2MEh6LDI0YnBwDQo+IA0KPiBUaGlzIHBhdGNoIGFkZCBvbiAi
NjQ6MjciIGFuZCAiMjU2OjEzNSIgdG8gZHJtX2FzcGVjdF9yYXRpb19lbnVtX2xpc3QuDQo+IFRo
ZXJlYWZ0ZXIsIG9uZSBjYW4gc3BlY2lmeSB0aGUgYXNwZWN0IHJhdGlvIHRvICI2NDoyNyIgb3Ig
IjI1NjoxMzUiDQo+IGFmdGVyIGNyZWF0aW5nIGFzcGVjdCByYXRpbyBwcm9wZXJ0eS4+DQo+IENo
YW5nZS1JZDogSWZjOWRmNTRlOGU4Zjc4ZTcwOTYwZmNkNzM3YTNhNTdlNDljODExNTINCj4gU2ln
bmVkLW9mZi1ieTogV2F5bmUgTGluIDx3YXluZWxpbkBhbWQuY29tPg0KDQpEcm9wIHRoZSBDaGFu
Z2UtSWQuDQoNCldpdGggdGhhdCBmaXhlZCB0aGlzIHBhdGNoIGlzDQoNClJldmlld2VkLWJ5OiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCAyICsrDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMNCj4gaW5k
ZXggM2EwY2FjYjcxMjM1Li5jMDYyOWEwMWQwOGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fY29ubmVjdG9yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0
b3IuYw0KPiBAQCAtNzcyLDYgKzc3Miw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Byb3Bf
ZW51bV9saXN0IGRybV9hc3BlY3RfcmF0aW9fZW51bV9saXN0W10gPSB7DQo+ICAJeyBEUk1fTU9E
RV9QSUNUVVJFX0FTUEVDVF9OT05FLCAiQXV0b21hdGljIiB9LA0KPiAgCXsgRFJNX01PREVfUElD
VFVSRV9BU1BFQ1RfNF8zLCAiNDozIiB9LA0KPiAgCXsgRFJNX01PREVfUElDVFVSRV9BU1BFQ1Rf
MTZfOSwgIjE2OjkiIH0sDQo+ICsJeyBEUk1fTU9ERV9QSUNUVVJFX0FTUEVDVF82NF8yNywgIjY0
OjI3IiB9LA0KPiArCXsgRFJNX01PREVfUElDVFVSRV9BU1BFQ1RfMjU2XzEzNSwgIjI1NjoxMzUi
IH0sDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcm9wX2VudW1fbGlz
dCBkcm1fY29udGVudF90eXBlX2VudW1fbGlzdFtdID0gew0KPiANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

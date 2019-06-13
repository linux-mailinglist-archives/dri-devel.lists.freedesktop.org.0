Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFC643735
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAEB89971;
	Thu, 13 Jun 2019 14:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9493C89971
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:27:44 +0000 (UTC)
Received: from AM0PR08MB4226.eurprd08.prod.outlook.com (20.179.36.17) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.213.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 14:27:41 +0000
Received: from AM0PR08MB4226.eurprd08.prod.outlook.com
 ([fe80::bc0c:5148:629e:1a31]) by AM0PR08MB4226.eurprd08.prod.outlook.com
 ([fe80::bc0c:5148:629e:1a31%6]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 14:27:41 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>, Liviu
 Dudau <Liviu.Dudau@arm.com>, Brian Starkey <Brian.Starkey@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Subject: Re: [PATCH] drm/komeda: Enable/Disable vblank interrupts
Thread-Topic: [PATCH] drm/komeda: Enable/Disable vblank interrupts
Thread-Index: AQHVHUIw9rNeEORvRUuKBGT248hnN6aQgGsAgAktYAA=
Date: Thu, 13 Jun 2019 14:27:41 +0000
Message-ID: <20190613142740.GA32394@arm.com>
References: <20190607150323.20395-1-ayan.halder@arm.com>
 <20190607181856.GK21222@phenom.ffwll.local>
In-Reply-To: <20190607181856.GK21222@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To AM0PR08MB4226.eurprd08.prod.outlook.com
 (2603:10a6:208:147::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff2ace66-3059-4dee-b6fa-08d6f00b4b0e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5393; 
x-ms-traffictypediagnostic: AM0PR08MB5393:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR08MB5393E97FC979225C44697FC6E4EF0@AM0PR08MB5393.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(366004)(40434004)(189003)(199004)(476003)(2616005)(44832011)(8676002)(81156014)(11346002)(2501003)(446003)(6486002)(8936002)(486006)(81166006)(6436002)(72206003)(966005)(14454004)(478600001)(6306002)(53936002)(6512007)(305945005)(7736002)(68736007)(86362001)(2201001)(229853002)(2906002)(6116002)(3846002)(5660300002)(66446008)(64756008)(66556008)(66476007)(73956011)(110136005)(6636002)(53386004)(6246003)(25786009)(66066001)(66946007)(587094005)(99286004)(71190400001)(71200400001)(386003)(6506007)(102836004)(26005)(186003)(1076003)(52116002)(76176011)(14444005)(5024004)(33656002)(36756003)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5393;
 H:AM0PR08MB4226.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1oX8Cwi+vN+Wo3865LYNyyo0lRKJUGBLx7d3A2Gf3bXWHDuHtKByDtpt4dWD3tNWSReyCiEPjl4mMrbYR5siUTRMc/wa4V1M7X8rxI/QCiOMFyCtU+pJYWz/6e3QSUGqCI58EE0qm8IsFEKjGTyjdyHiW4oeHdmkHIK8ZgP5Ek5F6Jdau+OsyiwM2yoxxtThAYwTyE/12OxPq1HhuYhTjzE04AsdvaTwL2dzlCQbNl/iBTD/8ydkUbebspPcBCelioMHhi03OAP/V459dpyLdqp6uEzgGdfQl14fQ7EwGwxxt1awJET9/e0gQ4NKO78lexyEUeYPswlWZtTzeUjPQ3mmozhCHZVH7jChAxfw6Tfshbo8ptQV0YLXRz7E5zaclnUdN9Ru12j0Nt4sUXfAZlwyH/yT8F0bAVaPs9BYDrw=
Content-ID: <DBCC2575CF0E6F489A9EC8C188EF6B4F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2ace66-3059-4dee-b6fa-08d6f00b4b0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 14:27:41.7793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ayan.Halder@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtBIuhBXRVlxxD+ll8fmCwqj4wgCi6dpMg6N1Cr03BE=;
 b=QTCbjZMiiY06q08WZDr9b5a8MLgaod64YaRTLmJrYtD1h5jjmBadtbL5UrOS+lUEiDBQOI4aMCx+Z/QTHff/RPyQrnfw6OD4l8H5ImYVZOYWQfqBKsIugg55bxXklA8RJYZYDMvuLjyqdoHSwEeQ5QBf2DD6NUcN/PEoFOTelZA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
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

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDg6MTg6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCkhpIERhbmllbCwKCj4gT24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDM6MDM6MzlQTSAr
MDAwMCwgQXlhbiBIYWxkZXIgd3JvdGU6Cj4gPiBPbmUgbmVlZHMgdG8gc2V0ICIoc3RydWN0IGRy
bV9kZXZpY2UgKiktPmlycV9lbmFibGVkID0gdHJ1ZSIgdG8gc2lnbmFsIGRybSBjb3JlCj4gPiB0
byBlbmFibGUgdmJsYW5rIGludGVycnVwdHMgYWZ0ZXIgdGhlIGhhcmR3YXJlIGhhcyBiZWVuIGlu
aXRpYWxpemVkLgo+ID4gQ29ycmVzcG9uZGluZ2x5LCBvbmUgbmVlZHMgdG8gZGlzYWJsZSB2Ymxh
bmsgaW50ZXJydXB0cyBieSBzZXR0aW5nCj4gPiAiKHN0cnVjdCBkcm1fZGV2aWNlICopLT5pcnFf
ZW5hYmxlZCA9IGZhbHNlIiBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZQo+ID4gZGUtaW5pdGlhbGl6
aW5nIHJvdXRpbmUuCj4KPiBPbmx5IGlmIHlvdSBkb24ndCB1c2UgdGhlIGRybV9pcnFfaW5zdGFs
bCBoZWxwZXIuIFF1b3RpbmcgdGhlIGtlcm5lbGRvYyBpbgo+IGZ1bGw6Cj4KPiAvKioKPiAgKiBA
aXJxX2VuYWJsZWQ6Cj4gICoKPiAgKiBJbmRpY2F0ZXMgdGhhdCBpbnRlcnJ1cHQgaGFuZGxpbmcg
aXMgZW5hYmxlZCwgc3BlY2lmaWNhbGx5IHZibGFuawo+ICAqIGhhbmRsaW5nLiBEcml2ZXJzIHdo
aWNoIGRvbid0IHVzZSBkcm1faXJxX2luc3RhbGwoKSBuZWVkIHRvIHNldCB0aGlzCj4gICogdG8g
dHJ1ZSBtYW51YWxseS4KPiAgKi8KPiBib29sIGlycV9lbmFibGVkOwo+Cj4gTm90IGVudGlyZWx5
IHN1cmUgd2hlcmUgeW91J3ZlIGZvdW5kIHlvdXIgcXVvdGUsIGJ1dCBpdCdzIG5vdCBjb21wbGV0
ZS4KPgo+IENoZWVycywgRGFuaWVsCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKVGhhdCB3YXMg
bXkgcXVvdGUgd2hpY2ggcmVmbGVjdHMgbXkgaGFsZi1iYWtlZCB1bmRlcnN0YW5kaW5nIG9mIHRo
ZQppc3N1ZSA6KC4gSSBoYWQgbWlzc2VkIHJlYWRpbmcgdGhlIGhlYWRlciBmaWxlcy4KClRoYXQg
c2FpZCwgSSB3aWxsIHNxdWFzaCBteSBwcmV2aW91cyBwYXRjaCAiZHJtL2tvbWVkYTogQXZvaWQg
dXNpbmcKRFJJVkVSX0lSUV9TSEFSRUQiIGludG8gdGhpcyBvbmUgYXMgdGhlIGN1cnJlbnQgcGF0
Y2ggaXMgYSBjb25zZXF1ZW5jZQpvZiB0aGUgY2hhbmdlcyBtYWRlIGluIHRoZSBwcmV2aW91cyBw
YXRjaC4KClJlZ2FyZHMsCkF5YW4gS3VtYXIgSGFsZGVyCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBeWFuIEt1bWFyIGhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwgNCArKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiBpbmRleCA3YjVjZGUx
NGUzYmEuLmI0ZmQ4ZWUwZDA1ZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ID4gQEAgLTIwNCw2ICsyMDQsOCBAQCBzdHJ1
Y3Qga29tZWRhX2ttc19kZXYgKmtvbWVkYV9rbXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICpt
ZGV2KQo+ID4gIGlmIChlcnIpCj4gPiAgZ290byB1bmluc3RhbGxfaXJxOwo+ID4KPiA+ICtkcm0t
PmlycV9lbmFibGVkID0gdHJ1ZTsKPiA+ICsKPiA+ICBlcnIgPSBkcm1fZGV2X3JlZ2lzdGVyKGRy
bSwgMCk7Cj4gPiAgaWYgKGVycikKPiA+ICBnb3RvIHVuaW5zdGFsbF9pcnE7Cj4gPiBAQCAtMjEx
LDYgKzIxMyw3IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2goc3Ry
dWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gPiAgcmV0dXJuIGttczsKPiA+Cj4gPiAgdW5pbnN0YWxs
X2lycToKPiA+ICtkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gPiAgZHJtX2lycV91bmluc3Rh
bGwoZHJtKTsKPiA+ICBjbGVhbnVwX21vZGVfY29uZmlnOgo+ID4gIGRybV9tb2RlX2NvbmZpZ19j
bGVhbnVwKGRybSk7Cj4gPiBAQCAtMjI1LDYgKzIyOCw3IEBAIHZvaWQga29tZWRhX2ttc19kZXRh
Y2goc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMpCj4gPiAgc3RydWN0IGRybV9kZXZpY2UgKmRy
bSA9ICZrbXMtPmJhc2U7Cj4gPiAgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBkcm0tPmRldl9w
cml2YXRlOwo+ID4KPiA+ICtkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gPiAgbWRldi0+ZnVu
Y3MtPmRpc2FibGVfaXJxKG1kZXYpOwo+ID4gIGRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOwo+ID4g
IGRybV9pcnFfdW5pbnN0YWxsKGRybSk7Cj4gPiAtLQo+ID4gMi4yMS4wCj4gPgo+Cj4gLS0KPiBE
YW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMg
ZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBi
ZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUg
Y29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Ig
c3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

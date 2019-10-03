Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A1CA0D1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 17:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E18689E33;
	Thu,  3 Oct 2019 15:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2019 15:00:27 UTC
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583A689E33
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 15:00:27 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AdZ0vHBbGj7Dymmzflf2APXz/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el20gabRp3VvvRDjeee87vtX2AN+96giDgDa9QNMn?=
 =?us-ascii?q?1NksAKh0olCc+BB1f8KavobCsgB8JPT3du/mqwNg5eH8OtL1A=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AOAAC7CpZd/4QNJK1lGgEBAQEBAgE?=
 =?us-ascii?q?BAQEMAgEBAQGBVAQBAQEBCwGBSlADbVYgBAsqg2JAg0cDikWCXJd4gS6BJAN?=
 =?us-ascii?q?UCQEBAQwBARgLCgIBAYRAAheCLiM1CA4CAwEDAgMBAQQBAQECAQUEbYUtDIV?=
 =?us-ascii?q?MAQEBAwEBCgYRBA0MAQEsCwEPAgEGAhgCAiYCAgIlAQoVEAIEDgUigwABgWo?=
 =?us-ascii?q?DHQEOkl2QYQKBOIhhdX8zgn0BAQWFCBiCFwMGgQwoAYwNGIFAP4E4gms+gmE?=
 =?us-ascii?q?BBIEnNxeCdoJYj2uOZ45qCoIjhwiIaoUgBhuZQJZLkRECBAIEBQIOAQEFgVQ?=
 =?us-ascii?q?BNoFYcBU7gmxQEBSBTwwXg1CFFIU/dAGBKI1gglQBAQ?=
X-IronPort-AV: E=Sophos;i="5.67,252,1566864000"; d="scan'208";a="349885917"
Received: from alln-core-10.cisco.com ([173.36.13.132])
 by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 03 Oct 2019 14:53:19 +0000
Received: from XCH-ALN-017.cisco.com (xch-aln-017.cisco.com [173.36.7.27])
 by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id x93ErJsU029657
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 3 Oct 2019 14:53:19 GMT
Received: from xhs-aln-003.cisco.com (173.37.135.120) by XCH-ALN-017.cisco.com
 (173.36.7.27) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 3 Oct 2019 09:53:18 -0500
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-aln-003.cisco.com
 (173.37.135.120) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 3 Oct 2019 09:53:12 -0500
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 3 Oct 2019 10:53:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7FlL1/xjeYuK0GclBO3lyfl0bErh7uPQUXhwkXgxcTXpmQtu5v1N3HkWmWvDNiKXNL4tpkrKEDqzIUMXe09K9127VonTQ/p870VH1569bLGOaex0C3vX0IDJnDbdll1a8uVqJXSSh+N2Hf4iiyJbQSn7aXNeAhzntf9apffb2NplvwyG+9F22Pv8HpS+CKLJ9CJ94H1WZqnMUxHBpQ88zLBTJwjKZq2rPwPsguK3fPDUFo6bClcL5yx0ubcz18CZtQZ0OwXu0uxcqzHZAN1b/GTDxhoiEbh08ke+5yr4p5n1S1i6CAGAzyeFXOu8C5KRmkic47LI+P9r8zngJyXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bawN2kYZipJnwaeAhsHx+UhBnhrPkewM6/rGQHRm7Rc=;
 b=Nal1CpHcgRct6mgNPpPF03FuQYiE0u/xpcPeQQsv/EyRGg08v5k1qHvHPgw5E5xaCCBEalDYCrKfUzJtRG73KBDDFvK/UHaAdufmS8jS6O+JUso0cDOgdXtq1OX2M/6Hl0qF9keFsPB4E+AlgXNDXOFaMJ2R2T8gZGAF/cLuCsY2plaDY1Gzk79afOuySwbt+MwNisUnHMVJ7BnH2Srw0PrMhMKQr20MiKIw8IZwMwv17eNCX1Kz6vthkmaZGYi+pkd4ag3nfJT7SyZL0ePGi2cPsJzqGo6hygb+it71JRra840/bNwtK2UgVji+akXRWqrC0vvD3GRLCFOEgzj60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com (10.174.104.137) by
 DM5PR1101MB2361.namprd11.prod.outlook.com (10.173.173.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 3 Oct 2019 14:53:11 +0000
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::9511:5547:ff62:72e6]) by DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::9511:5547:ff62:72e6%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 14:53:11 +0000
From: "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Thread-Topic: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Thread-Index: AQHVebpwiYPUJFa2nk+tYdVtmvLfh6dI7diAgAATQIA=
Date: Thu, 3 Oct 2019 14:53:11 +0000
Message-ID: <9f91ec63-20e4-25b9-45ac-e9b372184128@cisco.com>
References: <20191003071549.31272-1-jkorsnes@cisco.com>
 <20191003134417.GF1208@intel.com>
In-Reply-To: <20191003134417.GF1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:420:44c1:2576:6778:78a3:599f:41d0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efa09abc-2e98-4293-d5bb-08d748116968
x-ms-traffictypediagnostic: DM5PR1101MB2361:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR1101MB2361DD153B68E9C46FDDC974D79F0@DM5PR1101MB2361.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(66574012)(2616005)(46003)(66446008)(6116002)(66476007)(66556008)(64756008)(99286004)(86362001)(8676002)(5660300002)(316002)(6246003)(478600001)(14444005)(54906003)(4326008)(446003)(81166006)(81156014)(486006)(256004)(305945005)(476003)(7736002)(36756003)(8936002)(966005)(11346002)(14454004)(186003)(102836004)(31686004)(76176011)(6306002)(76116006)(6506007)(25786009)(229853002)(71190400001)(2906002)(6486002)(6436002)(31696002)(91956017)(66946007)(71200400001)(6916009)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1101MB2361;
 H:DM5PR1101MB2140.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cOjnLPUiRyCUL/wCGt8HnA3u8SyxRUMQU6x4cSOit2CW9ef5BjmDLUrcuAlEb/r8j4bFYUbMFQlMVt1ALAiWyI6OzwlKV7wPI8H7IHMoiOzeVNnJiYGufBGThITMGdU2m+L3j4cTm/GgmPObJiJVEqx4rIKSeMh83ZSisNEhJLfo7lw3v6WOxx7D9pm4GE8CudEBQtgWyno2aRbC+/aMgqSiDd8Y4KdbI0t/RstqF2RB0lAY8KEdnXyLLxCLzLiTIm/0U9cXY6uHu9uQS4TFWcVzbcBmSjFc7TuNN2fp0aC3MYGKJcBNi94MGDpmElY1eo/B5YfUaY5TcfeahKia8c/f7fP+ejBPdJPdxQxvg2td3Afy5j6iDRekVJwNyBtjBrTq9M4m0Co/xpLsgKUK2Z2XoYJPiDS2xsach6/EasvuSK3mc+CbfMrlW6+h/BkWhEP1+rgMFa4DFm4e54Pl4Q==
x-ms-exchange-transport-forked: True
Content-ID: <2C2A62E8BB0A384580D5DE3AA4050C95@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: efa09abc-2e98-4293-d5bb-08d748116968
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 14:53:11.5596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAgcwuFePf8mMLQkGsxzKRmqXOaJvlkcOBa2ilLWMu8dpvgHUG396Iy8/Cg1O0P87n2ALGkMPLNVvruF7hHC0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2361
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.27, xch-aln-017.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3310; q=dns/txt; s=iport;
 t=1570114827; x=1571324427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=bawN2kYZipJnwaeAhsHx+UhBnhrPkewM6/rGQHRm7Rc=;
 b=SI6gL20S8lOFuK1JVXGga0OLX3xAS/hxrqRd0LRk9v7l3WiYt+f1t72I
 rHyLOJRW/qQ3/7SqT35h7wfpXMYIA1W9nt/aeMvl0MYyu5Uf8283Anfbk
 7Kb26tKqIAHJXKpHta0eCTrWYBaO9ICWdJbJwkZZEkPdl1+jJVtCaIvN0
 o=;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cisco.onmicrosoft.com; 
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bawN2kYZipJnwaeAhsHx+UhBnhrPkewM6/rGQHRm7Rc=;
 b=KY0E4qxe41axYPhbAvJ84u48UiaE/NnosDhQEOJAC33MKmK8v5B6zyPHTe9lm0BVv/ZhpdYc7pBa46x3mZASUI73J0gbXBzESEh/tNTN9WipoD2TiSzRXZeMC6zSf14ubOcezct62/4y5tzcLsdgJx72YN0Qs/gNEs0EiP0iZRY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jkorsnes@cisco.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMTAvMjAxOSAxNS40NCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOg0KPiBPbiBUaHUsIE9j
dCAwMywgMjAxOSBhdCAwOToxNTo0OUFNICswMjAwLCBKb2hhbiBLb3JzbmVzIHdyb3RlOg0KPj4g
V2hlbiBsb2dnaW5nIHRoZSBBVkkgSW5mb0ZyYW1lLCBjbGVhcmx5IGluZGljYXRlIHdoZXRoZXIg
b3Igbm90IHRoZQ0KPj4gZXh0ZW5kZWQgY29sb3JpbWV0cnkgYXR0cmlidXRlIGlzIGFjdGl2ZS4g
VGhpcyBpcyBvbmx5IHRoZSBjYXNlIHdoZW4NCj4+IHRoZSBBVkkgSW5mb0ZyYW1lIGNvbG9yaW1l
dHJ5IGF0dHJpYnV0ZSBpcyBzZXQgdG8gZXh0ZW5kZWQuIFswXQ0KPj4NCj4+IFswXSBDVEEtODYx
LUcgc2VjdGlvbiA2LjQgcGFnZSA1Nw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEtvcnNu
ZXMgPGprb3JzbmVzQGNpc2NvLmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvdmlkZW8vaGRtaS5j
IHwgOCArKysrKysrLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9oZG1pLmMgYi9kcml2
ZXJzL3ZpZGVvL2hkbWkuYw0KPj4gaW5kZXggZjI5ZGI3MjhmZjI5Li5hNzA5ZTM4YTUzY2EgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2hkbWkuYw0KPj4gKysrIGIvZHJpdmVycy92aWRl
by9oZG1pLmMNCj4+IEBAIC02ODIsOCArNjgyLDE0IEBAIHN0YXRpYyB2b2lkIGhkbWlfYXZpX2lu
Zm9mcmFtZV9sb2coY29uc3QgY2hhciAqbGV2ZWwsDQo+PiAgCWhkbWlfbG9nKCIgICAgYWN0aXZl
IGFzcGVjdDogJXNcbiIsDQo+PiAgCQkJaGRtaV9hY3RpdmVfYXNwZWN0X2dldF9uYW1lKGZyYW1l
LT5hY3RpdmVfYXNwZWN0KSk7DQo+PiAgCWhkbWlfbG9nKCIgICAgaXRjOiAlc1xuIiwgZnJhbWUt
Pml0YyA/ICJJVCBDb250ZW50IiA6ICJObyBEYXRhIik7DQo+PiAtCWhkbWlfbG9nKCIgICAgZXh0
ZW5kZWQgY29sb3JpbWV0cnk6ICVzXG4iLA0KPj4gKw0KPj4gKwlpZiAoZnJhbWUtPmNvbG9yaW1l
dHJ5ID09IEhETUlfQ09MT1JJTUVUUllfRVhURU5ERUQpDQo+PiArCQloZG1pX2xvZygiICAgIGV4
dGVuZGVkIGNvbG9yaW1ldHJ5OiAlc1xuIiwNCj4+ICAJCQloZG1pX2V4dGVuZGVkX2NvbG9yaW1l
dHJ5X2dldF9uYW1lKGZyYW1lLT5leHRlbmRlZF9jb2xvcmltZXRyeSkpOw0KPj4gKwllbHNlDQo+
PiArCQloZG1pX2xvZygiICAgIGV4dGVuZGVkIGNvbG9yaW1ldHJ5OiBOL0EgKDB4JXgpXG4iLA0K
Pj4gKwkJCWZyYW1lLT5leHRlbmRlZF9jb2xvcmltZXRyeSk7DQo+IA0KPiBZZWFoLCBzZWVtcyBm
aW5lLiBNaWdodCBtYWtlIHRoZSBsb2dzIGEgYml0IGxlc3MgY29uZnVzaW5nIGF0IGxlYXN0Lg0K
PiANCj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+DQo+IA0KPiBQUy4gd291bGQgYmUgbmljZSBpdCBzb21lb25lIHdlcmUgdG8gZXh0
ZW5kIHRoaXMgY29kZSB0byBkZWFsIHdpdGggdGhlDQo+IEFDRSBiaXRzIHRvby4gRG8geW91IGhh
dmUgcGxhbnMvaW50ZXJlc3QgaW4gZG9pbmcgdGhhdD8NCg0KSSB3YXMgYWN0dWFsbHkgZ29pbmcg
dG8gZGVhbCB3aXRoIHRoZSBBQ0UgYml0cyBhcyBwYXJ0IG9mIHRoaXMgcGF0Y2gsDQpidXQgbm90
aWNlZCB0aGF0IHRoaW5ncyBzZWVtIHRvIGJlIGhhcmQgY29kZWQgZm9yIEFWSSBJbmZvRnJhbWUg
djI6DQoNCmludCBoZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChzdHJ1Y3QgaGRtaV9hdmlfaW5mb2Zy
YW1lICpmcmFtZSkgew0KICAgIG1lbXNldChmcmFtZSwgMCwgc2l6ZW9mKCpmcmFtZSkpOw0KIA0K
ICAgIGZyYW1lLT50eXBlID0gSERNSV9JTkZPRlJBTUVfVFlQRV9BVkk7DQogICAgZnJhbWUtPnZl
cnNpb24gPSAyOw0KICAgIGZyYW1lLT5sZW5ndGggPSBIRE1JX0FWSV9JTkZPRlJBTUVfU0laRTsN
Cg0KICAgIHJldHVybiAwOw0KfQ0KDQpJIGhhdmUgbm8gcGxhbnMgdG8gZml4IHRoaXMsIGZvciBu
b3csIHVuZm9ydHVuYXRlbHkuDQoNCj4gDQo+PiArDQo+PiAgCWhkbWlfbG9nKCIgICAgcXVhbnRp
emF0aW9uIHJhbmdlOiAlc1xuIiwNCj4+ICAJCQloZG1pX3F1YW50aXphdGlvbl9yYW5nZV9nZXRf
bmFtZShmcmFtZS0+cXVhbnRpemF0aW9uX3JhbmdlKSk7DQo+PiAgCWhkbWlfbG9nKCIgICAgbnVw
czogJXNcbiIsIGhkbWlfbnVwc19nZXRfbmFtZShmcmFtZS0+bnVwcykpOw0KPj4gLS0gDQo+PiAy
LjIwLjENCj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

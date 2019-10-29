Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCFE8F08
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9706E509;
	Tue, 29 Oct 2019 18:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800047.outbound.protection.outlook.com [40.107.80.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC016E504;
 Tue, 29 Oct 2019 18:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNgVjOf0uUR9MsqPhQfiGG9emHTVsTLZEFZ6KztO2hJR1iTbPWmZXh0BzV2PW7XbDeVoKvbsAmeHWkaDyOGMtpaL7ZZhGU40/H+vT/QyZK4nblRtAvf8nla6pTsEBeSGZ572e4G+4HQgUHJBwSEI9VCMCXZ8C6S8Zo5xWyvHGIFfPSckUODs9BOhQMv4zJ/q7BJ/VLuFSFxaBbisnb81gylPlqbM6VMLWr5OVMIscZ2wbi4JXvyjEKGCE2hdFNOD+5XeepC05eikZv3wWzWYBrV7sPnEd9Qt52Zzv/+KsiXTcBnEvbYxzRHTH6Vs2O/auVyJtpK2Yzn9E/6uiAUufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK7vVYCNkfz7JMod15T8XD0feZI3JEFwBJ/1fPX0f50=;
 b=Ksab+02xF0iT5bnqloxiLv9Mq8xdcBpsfVGEaphzhUJQ2lhm9F9ZgiFjyECqDsQx+1Lbbft4FLxSsBDKqfw6C5Sn4aFG7PpJS92jceD4Wt9fWsegY/AKJcurbjtUKzWTv8HxzV9PpymHID+TpzmJUmjvki/TprnhvXFEv4MwXBHHAz/nBrJCabQUqa8xoUeg2oL/A6pLIpxEiM3fCFPxqI1gWrV73hWpixb+HxQaVUOiPXOy18wLFIfbx/dSsFRSyUu5d9UDmQPXDuwd+i9cdO20ggqBtgK2PTTfMbFydm6inc47MyLR9FchWxCbY1BrS8RTEtBWVazRyhFLjjBMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1534.namprd12.prod.outlook.com (10.172.56.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Tue, 29 Oct 2019 18:10:47 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 18:10:47 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/sched: Fix passing zero to 'PTR_ERR' warning
Thread-Topic: [PATCH] drm/sched: Fix passing zero to 'PTR_ERR' warning
Thread-Index: AQHVjoQvUrPMUsv6hUm04vk041vOTg==
Date: Tue, 29 Oct 2019 18:10:46 +0000
Message-ID: <a0e81d20-8175-15f4-1fcf-a8b99e8d6500@amd.com>
References: <1572361484-9828-1-git-send-email-andrey.grodzovsky@amd.com>
 <20191029180357.GB3866@kadam>
In-Reply-To: <20191029180357.GB3866@kadam>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 80eec187-79ab-4b4e-9396-08d75c9b5249
x-ms-traffictypediagnostic: MWHPR12MB1534:
x-microsoft-antispam-prvs: <MWHPR12MB1534E669CAD222378988840BEA610@MWHPR12MB1534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(189003)(199004)(66446008)(71200400001)(64756008)(71190400001)(305945005)(66556008)(6436002)(8936002)(66476007)(478600001)(8676002)(81156014)(81166006)(102836004)(3846002)(6486002)(7736002)(31686004)(52116002)(25786009)(5660300002)(66066001)(76176011)(6916009)(229853002)(386003)(53546011)(6506007)(6116002)(99286004)(14444005)(316002)(256004)(6246003)(36756003)(476003)(31696002)(86362001)(54906003)(186003)(4326008)(14454004)(446003)(66946007)(2906002)(2616005)(486006)(11346002)(6512007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1534;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5DDNYRJzu9LFtfJl5rPTKxH2+dQS8vLO8qOQFqbOPsStxyxa8X6WIloyyDOmPWZ5Qli0JUdpj0hjGpWYbbam5WQo1qmxybpGRQ0OwZ/qBEUuql08odHAH22Gav2ZlRn7OCSQKAD9+14lgYg0gFW2X3wKJDTA7WPKzLgI/FHYDU9Xy5uMNTmFYufa+rJbQlm0Cs76wX5cLCfw462sY+jlotPcIxNvbUeRj0L+M+lDifbeBRann4QaV4qnsxyl9Mf6B/ISd7rdJXpIg5jXRMyfVmFihwOwFY1h3lxxBevh/yPEd0EqbWWyq+mIaTz90+BcV4w5Uj/0IKvEzZMMV3UKoRXwrxIZdDWCLw5OTnN/dEtOq2tULYC/qiUkmu8loZ494k90fA9wmM2WI0jxjKfMtXHPBeKvblaAG4U7VqYvUPEB2zYi6VPjXPo/ZfpXJBah
x-ms-exchange-transport-forked: True
Content-ID: <6FB90D61BFC36A43A1712EE31D8E876D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eec187-79ab-4b4e-9396-08d75c9b5249
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 18:10:47.1002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpyIWSru3v7KoUD3iUN04WL7daehWUicU5JcqaIArC/LcM0S/4VzoIarjHoyUwBfBHOtUQbHZzds1OZHuR/NkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK7vVYCNkfz7JMod15T8XD0feZI3JEFwBJ/1fPX0f50=;
 b=NGf8zaaoynGZl1gDjHTwnL0PNgz37FcusH3nOvbvA1naV8aMJTsZ50f94TTv/S+y0TwOW3eFo78tB++WS1nKdmbGf36+5B94Bz4Cbt1VerZRVCylkZE4DBxdzHybM5loz14vFjiZ07FCQSu5agHUav1g8iKdcoRiZXbe3tFbxpQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMC8yOS8xOSAyOjAzIFBNLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPiBPbiBUdWUsIE9j
dCAyOSwgMjAxOSBhdCAxMTowNDo0NEFNIC0wNDAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToN
Cj4+IEZpeCBhIHN0YXRpYyBjb2RlIGNoZWNrZXIgd2FybmluZy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+IC0t
LQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDQgKystLQ0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+PiBpbmRleCBmMzliOTdl
Li44OThiMGM5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
DQo+PiBAQCAtNDk3LDcgKzQ5Nyw3IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3Ry
dWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkNCj4+IAkJZmVuY2UgPSBzY2hlZC0+b3BzLT5y
dW5fam9iKHNfam9iKTsNCj4+ICAgDQo+PiAgIAkJaWYgKElTX0VSUl9PUl9OVUxMKGZlbmNlKSkg
ew0KPj4gICAJCQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gTlVMTDsNCj4+IC0JCQlkbWFfZmVu
Y2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUihmZW5jZSkpOw0KPj4gKwkJ
CWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSX09SX1pFUk8o
ZmVuY2UpKTsNCj4gSSBmZWVsIGxpa2UgSSBzaG91bGQgZXhwbGFpbiBiZXR0ZXIuICBJdCdzIGdl
bmVyYWxseSBiYWQgdG8gbWl4IE5VTEwgYW5kDQo+IGVycm9yIHBvaW50ZXJzLiAgVGhlIHNpdHVh
dGlvbiB3aGVyZSB5b3Ugd291bGQgZG8gaXQgaXMgd2hlbiBOVUxMIGlzIGENCj4gc3BlY2lhbCBj
YXNlIG9mIHN1Y2Nlc3MuICBBIHR5cGljYWwgc2l0dWF0aW9uIGlzIHlvdSByZXF1ZXN0IGEgZmVh
dHVyZSwNCj4gbGlrZSBtYXliZSBsb2dnaW5nIGZvciBleGFtcGxlOg0KPg0KPiAJcCA9IGdldF9s
b2dnZXIoKTsNCj4NCj4gSWYgdGhlcmUgaXNuJ3QgZW5vdWdoIG1lbW9yeSB0aGVuIGdldF9sb2dn
ZXIoKSByZXR1cm5zIEVSUl9QVFIoLUVOT01FTSk7DQo+IGJ1dCBpZiB0aGUgdXNlciBoYXMgZGlz
YWJsZWQgbG9nZ2luZyB0aGVuIHdlIGNhbid0IHJldHVybiBhIHZhbGlkDQo+IHBvaW50ZXIgYnV0
IGl0J3MgYWxzbyBub3QgYW4gZXJyb3Igc28gd2UgcmV0dXJuIE5VTEwuICBJdCdzIGEgc3BlY2lh
bA0KPiBjYXNlIG9mIHN1Y2Nlc3MuDQo+DQo+IEluIHRoaXMgc2l0dWF0aW9uIHNjaGVkLT5vcHMt
PnJ1bl9qb2Ioc19qb2IpOyBhcHBlYXJzIHRvIG9ubHkgZXZlcg0KPiByZXR1cm4gTlVMTCBhbmQg
aXQncyBub3QgYSBzcGVjaWFsIGNhc2Ugb2Ygc3VjY2VzcywgaXQncyBhIHJlZ3VsYXIgb2xkDQo+
IGVycm9yLiAgSSBndWVzcyB3ZSBhcmUgdHJhbnNpdGlvbmluZyBmcm9tIHJldHVybmluZyBOVUxM
IHRvIHJldHVybmluZw0KPiBlcnJvciBwb2ludGVycz8NCg0KDQpObywgY2hlY2sgcGF0Y2ggJ2Ry
bS9hbWRncHU6IElmIGFtZGdwdV9pYl9zY2hlZHVsZSBmYWlscyByZXR1cm4gYmFjayB0aGUgDQpl
cnJvci4nICwgYW1kZ3B1X2pvYl9ydW4gd2lsbCBwYWNrIGFuIGFjdHVhbCBlcnJvciBjb2RlIGlu
dG8gRVJSX1BUUg0KDQpBbmRyZXkNCg0KDQo+DQo+IFNvIHdlIHNob3VsZCBqdXN0IGRvIHNvbWV0
aGluZyBsaWtlOg0KPg0KPiAJZmVuY2UgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsNCj4N
Cj4gCS8qIEZJWE1FOiBPY3QgMjAxOTogUmVtb3ZlIHRoaXMgY29kZSB3aGVuIGZlbmNlIGNhbid0
IGJlIE5VTEwuICovDQo+IAlpZiAoIWZlbmNlKQ0KPiAJCWZlbmNlID0gRVJSX1BUUigtRUlOVkFM
KTsNCj4NCj4gCWlmIChJU19FUlIoZmVuY2UpKSB7DQo+IAkJLi4uDQo+DQo+IHJlZ2FyZHMsDQo+
IGRhbiBjYXJwZW50ZXINCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

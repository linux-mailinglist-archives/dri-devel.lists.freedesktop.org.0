Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B5ED81C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 04:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294226E10F;
	Mon,  4 Nov 2019 03:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740042.outbound.protection.outlook.com [40.107.74.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A1D6E10F;
 Mon,  4 Nov 2019 03:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBa2LWBsnVnuVqSUTyk+IWmU4KYaowbh8LBrBHNTVsK7lS11o3aAj9lJH2ZZ4iW8OVOT3sx/0Mfc8reyRFVmvGYyTnoYos1dwlGm/8pOwIKW8zW/m2apOCk6Pb2tGYIhcdqm0A/0SKTBdcoDPoFXWF5/ihY1MUXbBdtxh3kmymsJGlIhdRaVvu36UJKUANqi/3EQuc58pBMTHM2wAv1jbaD8nUr+TAat4JWDLPMtcNxTH1TFi+chfHiTE5ytXclkwTxTdtn27ZQY1s4mOPvxasxGq5EX3n6m0QOK8q91scB4fdGrUpLuxtsgWLiM57HIEWIPNYNwZrx//PoO2fKKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjHapGLALgF8yMe5/lGWdvMbe5wn/Gs0uhe6Jmsbde8=;
 b=nqBsGbuEmf9EXTVTXkIWaR4Xtgbus6IiuDsLf9veiKPdDK8+WVAlwnKm1U7azMJcAjMSRuua5bzE6GOh23wwl7diYiU3y01exAazGAN577SdELvl86Pkg3AEpFwHxdXNx3WlIAvhrDeO+ACqyam9x+0cLjYBiOva2lRAmGS6EaKhFW734XEge0mq5HrM5M/1q9KsPHVOkiagu4ATRrg5kpA4uLHRcilhS3qiYOGA90Qc4MNWRT8XlWOkwiSXKd9nfWt4qxSgqDRbT2gf8akITIRQ+nkBXJCIQtiHxaaXGQFlp78VZ7DR/4i99BNsNQPIZfiQPnsFzJvNO0fAnyNn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3568.namprd12.prod.outlook.com (20.178.240.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 03:37:50 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7%7]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 03:37:50 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: RE: [PATCH v2] drm/sched:  Fix passing zero to 'PTR_ERR' warning
Thread-Topic: [PATCH v2] drm/sched:  Fix passing zero to 'PTR_ERR' warning
Thread-Index: AQHVjoPNUjzn9mnuEUeKFbSrSd0TIad6ZUBQ
Date: Mon, 4 Nov 2019 03:37:50 +0000
Message-ID: <MN2PR12MB29755DDF54361142B8340FEF8F7F0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1572372468-20569-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1572372468-20569-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e9a8f0bf-8ac8-445b-ea4e-08d760d85e5f
x-ms-traffictypediagnostic: MN2PR12MB3568:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3568E7FFD6B7BC1B05D4A85D8F7F0@MN2PR12MB3568.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:84;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(13464003)(189003)(199004)(99286004)(71190400001)(71200400001)(229853002)(5660300002)(66066001)(14444005)(256004)(52536014)(9686003)(81166006)(2906002)(8936002)(25786009)(81156014)(6436002)(7736002)(305945005)(55016002)(478600001)(74316002)(66476007)(4326008)(486006)(14454004)(6246003)(66946007)(76116006)(8676002)(33656002)(6306002)(11346002)(446003)(6116002)(7696005)(2501003)(76176011)(26005)(54906003)(102836004)(6506007)(3846002)(316002)(186003)(86362001)(110136005)(476003)(66446008)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3568;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+h5l2VbrF6Jjlu2LchdjBCuICpDZsIAoZhZ1VUYMxsQnRL9QViY17XUoTHpxVNTyMBM5Z46K65s2Gtcj/TXqhEU/ENQMZv5VFb/8nNScW+jRmorRRnAeAJyw+y8myrrMgGj5+9DUshhucC5sxsy22cSiAGVMaUQbNJ8EtAQ2yH/bBNvRqZ2EeD7LX0qk3EPQQEO42Mp/8Mp8ALg0gIRypM+ajJmnWs/+92SStMm2eGvR2+gsI83/9iONZdPpDOT+PJaQSJq1JvKoUvcZVFYB8SUe9YAlA93PS+uSLwPQ4Gl+Rw1rEF1cL4S8tFqtxujkQydWkcwRENHCWboMB0gI8zbd8nBiBGAHzWzMQQhLoUEJeFSjpo9t+SEi+GlimaNsrM128nmfbShbBKvuOvz/V5sI1006pE1USZk4KavI46WNvwRB0CtwUqPHb4ZxYsiXcuu6yDq/0mT5r2iJpA+8jGoIbJmIXPiLQu3eH45BsE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a8f0bf-8ac8-445b-ea4e-08d760d85e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 03:37:50.6682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8gUsD6axyPrezScAETjPSkG2gPoz8rW+skxZ1RDHioit9YwKbN3SOVYEKQe/M+9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3568
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjHapGLALgF8yMe5/lGWdvMbe5wn/Gs0uhe6Jmsbde8=;
 b=TuGAO+dRIWaszPSD3eSp7M07v8XOOfsIq71LRYPB3aGwZLe7fbYeOErg8cW1ey0HTs+8+a0bztwhY/nzNj57vw/w9nlSpbmkH1cz/B5uZ8Zk58DodSfcVeH8dVRe0q6u/wcR7V0g+Xz47GrhAJqcOTif+wrX69nS5yjaHAHb1kE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCg0KPi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+QW5kcmV5IEdyb2R6b3Zza3kNCj5TZW50
OiBXZWRuZXNkYXksIE9jdG9iZXIgMzAsIDIwMTkgMjowOCBBTQ0KPlRvOiBkYW4uY2FycGVudGVy
QG9yYWNsZS5jb20NCj5DYzogR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBh
bWQuY29tPjsgYW1kLQ0KPmdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS9zY2hlZDogRml4IHBh
c3NpbmcgemVybyB0byAnUFRSX0VSUicgd2FybmluZw0KPg0KPkZpeCBhIHN0YXRpYyBjb2RlIGNo
ZWNrZXIgd2FybmluZy4NCj4NCj52MjogRHJvcCBQVFJfRVJSX09SX1pFUk8uDQo+DQo+U2lnbmVk
LW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+
LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgNyArKysrKy0t
DQo+IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Yi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPmluZGV4IGYzOWI5N2UuLmRi
YTQzOTAgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPkBAIC00
OTYsOCArNDk2LDEwIEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0DQo+ZHJt
X2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPiAJCWZlbmNlID0gc2NoZWQtPm9wcy0+cnVuX2pvYihz
X2pvYik7DQo+DQo+IAkJaWYgKElTX0VSUl9PUl9OVUxMKGZlbmNlKSkgew0KPisJCQlpZiAoSVNf
RVJSKGZlbmNlKSkNCj4rCQkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVk
LA0KPlBUUl9FUlIoZmVuY2UpKTsNCj4rDQo+IAkJCXNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBO
VUxMOw0KPi0JCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwNCj5QVFJf
RVJSKGZlbmNlKSk7DQo+IAkJfSBlbHNlIHsNCj4gCQkJc19qb2ItPnNfZmVuY2UtPnBhcmVudCA9
IGZlbmNlOw0KPiAJCX0NCj5AQCAtNzQxLDggKzc0Myw5IEBAIHN0YXRpYyBpbnQgZHJtX3NjaGVk
X21haW4odm9pZCAqcGFyYW0pDQo+IAkJCQkJICByKTsNCj4gCQkJZG1hX2ZlbmNlX3B1dChmZW5j
ZSk7DQo+IAkJfSBlbHNlIHsNCj4rCQkJaWYgKElTX0VSUihmZW5jZSkpDQo+KwkJCQlkbWFfZmVu
Y2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwNCj5QVFJfRVJSKGZlbmNlKSk7DQo+DQo+
LQkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLA0KPlBUUl9FUlIoZmVu
Y2UpKTsNCj4gCQkJZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKE5VTEwsICZzY2hlZF9qb2ItPmNiKTsN
Cj4gCQl9DQo+DQo+LS0NCj4yLjcuNA0KPg0KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj5hbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

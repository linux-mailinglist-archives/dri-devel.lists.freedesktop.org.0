Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E342251E7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 14:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2287B6E04B;
	Sun, 19 Jul 2020 12:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4380E6E04B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 12:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUc7bPI8VQd6wmQxd2T1wiikjylQAmmiR8CIRITfC/x0n8WfihGFESpss69gisGyqnJNkvR/PW+G2bPXFkRWtOWSoDeQpOSIaeP6Xg7Al7vPwlyvHtAYCh8Gx0UbzkgbQKprtCNfiCnDkXWztvZozZ39/P+F8eEC1T1Dx+W1iea7LA6CetQjtHpX4nA1jGnsLOLlJsGx4zW3U4YQIR2iOUmjPkhdeWZZuRibM4fX6omrJa5tk9jAB4qJ7EuTK7ahb/OMCT0dyvcX+fz77lCKUUNiHZzTtHhxT27nB1wBZnOFDokLiRBBaaTwZYww3dgDdAxVAgygMTawi0/i6Wvmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzSCMOOL9ZJcFztfgSFzM1RjwywIM5bAGWPVAOSTNXo=;
 b=XBdhZAwy8BTYPJBPn0GFMc/H9QVs5NifcH/Dafk86JozUhrfysO9o+nrFNZ1AxgEDTZ9K1sSSWthARrj0RdNvvLREMi+VsFMsRRu1xTcgfRZENyY6vIQZswDstdWkMuy5m8i43NkuaaAn3ef2d3Jq+/3jPXYTUmiduLMgA5V3cibJRe6eQU9H/lSR18Y4ujOr6ftmBp6tgndkYdac5fG237DfI0q+UIPXmg7Iu/BDctJzWVTRdN7ZTpOb/3dqDXOP2Jt9XDNKdSrR+CaLbbM+LCsgzu0EqE0ZeZZobIDOfhczyP+OGsxInqkWTLPqRrhP6P6NOXt9ZmFapzny7/+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzSCMOOL9ZJcFztfgSFzM1RjwywIM5bAGWPVAOSTNXo=;
 b=kX/sXgGpDwwfgEJAs6kZpToqGBip+bY8W5599eDbGnn7Bv1tWI5LrtpYq00vMxUhvqMEV8AcJUAQXppBkfZ6OQ3cTfIz7qPHVL8VL01Y1AiB11Y0MzkYrwf7X6UW1gck0bsjrRbmUFL73LyHugVBZ5+NXTeCJ3NNoMiprCWKPGc=
Received: from BL0PR12MB2433.namprd12.prod.outlook.com (2603:10b6:207:4a::25)
 by MN2PR12MB3920.namprd12.prod.outlook.com (2603:10b6:208:168::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Sun, 19 Jul
 2020 12:57:09 +0000
Received: from BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8884:f5cd:cc08:b29a]) by BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8884:f5cd:cc08:b29a%7]) with mapi id 15.20.3174.026; Sun, 19 Jul 2020
 12:57:09 +0000
From: "Chauhan, Madhav" <Madhav.Chauhan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/8] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Thread-Topic: [PATCH 2/8] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Thread-Index: AQHWW2+3iJBWH3foeEy+BVSTAn/cXqkO34Wg
Date: Sun, 19 Jul 2020 12:57:08 +0000
Message-ID: <BL0PR12MB24332E2D588EEE15F702AEFD9C7A0@BL0PR12MB2433.namprd12.prod.outlook.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
 <20200716125037.67437-2-christian.koenig@amd.com>
In-Reply-To: <20200716125037.67437-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-07-19T12:57:00Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=d6108533-8b3e-4bcb-8b18-0000cc7c33b4;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-07-19T12:56:50Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: a518ebbe-f1ba-4e2e-a8cf-0000d4d5e12b
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-07-19T12:57:03Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: cf914747-30f5-48ff-b21f-000038232dfd
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [122.171.179.105]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dd571c52-4db9-481a-18c7-08d82be33f48
x-ms-traffictypediagnostic: MN2PR12MB3920:
x-microsoft-antispam-prvs: <MN2PR12MB39206E8B902EB2BD77EFEC029C7A0@MN2PR12MB3920.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vc9o7bme+LdQMm265WZ+A2bWTcyjttS55zOOagcUHV+zJ4GOz8OcPC/P7Sn1VWvMV7bD/KcfwJIoRUm03IHlVqPpYp6bcVqdqJfQ5RqS1J8i71tbqX4pmNLtevq08ZVbpWGrDEhCayMGkFX0x9L3zs6Lk+0oWP9tNqxRv/cvg8tjZbJLmrpteq41CAJkh1LTpYmnoZFPiHv0/GrKEh+77KuFd6jQ6T2kZ+lGFqON2viQYCO2k1H1X7EvRi+x2nSXw5aV1uNLfcFLDXsogZ9ZIONFy7XPMQWJYMbFYV+ugq6G0YQHkoCPSGeNYWZgAyVanDBxXYcd8g7EP3Ufd/JAvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2433.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(9686003)(55016002)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(8676002)(26005)(110136005)(71200400001)(86362001)(52536014)(186003)(316002)(33656002)(83380400001)(5660300002)(2906002)(7696005)(53546011)(6506007)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bw7yjoZV+7bm+5gMcDVpXv/YKOwUohbsYUy07STU/mAjHbqTzLOGCdGUx2L6Yz8If55V9nBiSgJ3LSN3CjfPQXnZM+PsIzYZlkeUaq0lGpkHXAZQosM+BjPUGjL5LkQR+0kzz4VAsGO2hVm/dQY+Jl8womXuQbXgSVmIjZdrW3aUJBuGKIDGill7jkUNnqXeAsQFi9fWMpvihjMQ/x1C3ZxtTKDwlWcfd24FxzFChLeb0hxoB3sj9Kk0qtEIoBsLqTFubKpDnrwyGGMTu6N49bTmX4k9+p4uuqIrWHSyjLCP7goMExIgb+XJWKCHrgsYh/ziaJ8G2sxaY+3v3xW+Aqdftz7O8adO6gysj3OfeDqyMjfuzAadIG7jf98PJnKBEAIa73ald5YzZZVSIPNh8fK3QaL1Yay6GsqTDFWUCarKxu3R+bGmBJK6OdRtszJgwNJQZ7FlAqdd5ELLgkFWjIIcjKG3I8yznlwi2RXowxDP5tWa/GYYdYCry8EQSViH
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2433.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd571c52-4db9-481a-18c7-08d82be33f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2020 12:57:09.0846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fppl0axgBtWtOeNHxK861xjEg7V9b3iYlIQnoy+HmWA4jFiXej2qk5tnv4JGj0MV8yupfk+PsE06U3uiYAcJ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3920
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBQdWJsaWMgVXNlXQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0KU2VudDog
VGh1cnNkYXksIEp1bHkgMTYsIDIwMjAgNjoyMSBQTQ0KVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCkNjOiBDaGF1aGFuLCBNYWRoYXYgPE1hZGhhdi5DaGF1aGFuQGFtZC5jb20+
DQpTdWJqZWN0OiBbUEFUQ0ggMi84XSBkcm0vcmFkZW9uOiBzdG9wIHVzaW5nIFRUTV9NRU1UWVBF
X0ZMQUdfTUFQUEFCTEUNCg0KVGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFi
bGUgbWVtb3J5IHJlc291cmNlcy4NCg0KTG9va3MgbGlrZSBzcGVsbCBtaXN0YWtlIGluICJtYXBh
YmxlIi4gUGxlYXNlIGNoZWNrLg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl90dG0uYyB8IDEzICsrKystLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYw0K
aW5kZXggNTRhZjA2ZGY4NjViLi5iNDc0NzgxYTA5MjAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMNCkBAIC03Niw3ICs3Niw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVt
X3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsDQogCXN3aXRj
aCAodHlwZSkgew0KIAljYXNlIFRUTV9QTF9TWVNURU06DQogCQkvKiBTeXN0ZW0gbWVtb3J5ICov
DQotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsNCisJCW1hbi0+Zmxh
Z3MgPSAwOw0KDQphZGV2IG1lbW9yeSB3YXMgc2V0IHRvIHplcm8gd2hpbGUgYWxsb2NhdGVkIGFu
ZCBhZGV2LT5tbWFuLmJkZXYgdXNlZCB0byBmZXRjaCBkaWZmZXJlbnQgbW1hbi4NCkRvIHdlIG5l
ZWQgZXhwbGljaXQgaW5pdGlhbGl6YXRpb24gdG8gJzAnPz8gDQoNClJlZ2FyZHMsDQpNYWRoYXYN
Cg0KIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7DQogCQlt
YW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsNCiAJCWJyZWFrOw0KQEAg
LTg0LDcgKzg0LDcgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwNCiAJCW1hbi0+ZnVuYyA9ICZ0dG1fYm9f
bWFuYWdlcl9mdW5jOw0KIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9NQVNLX0NB
Q0hJTkc7DQogCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsNCi0J
CW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOw0KKwkJbWFuLT5mbGFncyA9
IDA7DQogI2lmIElTX0VOQUJMRUQoQ09ORklHX0FHUCkNCiAJCWlmIChyZGV2LT5mbGFncyAmIFJB
REVPTl9JU19BR1ApIHsNCiAJCQlpZiAoIXJkZXYtPmRkZXYtPmFncCkgew0KQEAgLTkyLDggKzky
LDYgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgdWludDMyX3QgdHlwZSwNCiAJCQkJCSAgKHVuc2lnbmVkKXR5cGUpOw0KIAkJCQly
ZXR1cm4gLUVJTlZBTDsNCiAJCQl9DQotCQkJaWYgKCFyZGV2LT5kZGV2LT5hZ3AtPmNhbnRfdXNl
X2FwZXJ0dXJlKQ0KLQkJCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsN
CiAJCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQgfA0KIAkJ
CQkJCSBUVE1fUExfRkxBR19XQzsNCiAJCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9G
TEFHX1dDOyBAQCAtMTAzLDggKzEwMSw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5
cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsDQogCWNhc2UgVFRN
X1BMX1ZSQU06DQogCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovDQogCQltYW4tPmZ1bmMgPSAm
dHRtX2JvX21hbmFnZXJfZnVuYzsNCi0JCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJ
WEVEIHwNCi0JCQkgICAgIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7DQorCQltYW4tPmZsYWdz
ID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRDsNCiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBU
VE1fUExfRkxBR19VTkNBQ0hFRCB8IFRUTV9QTF9GTEFHX1dDOw0KIAkJbWFuLT5kZWZhdWx0X2Nh
Y2hpbmcgPSBUVE1fUExfRkxBR19XQzsNCiAJCWJyZWFrOw0KQEAgLTM5NCw3ICszOTEsNiBAQCBz
dGF0aWMgaW50IHJhZGVvbl9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJv
b2wgZXZpY3QsDQogDQogc3RhdGljIGludCByYWRlb25fdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkgIHsNCi0Jc3Ry
dWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+bWVtX3R5cGVd
Ow0KIAlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiA9IHJhZGVvbl9nZXRfcmRldihiZGV2KTsN
CiANCiAJbWVtLT5idXMuYWRkciA9IE5VTEw7DQpAQCAtNDAyLDggKzM5OCw3IEBAIHN0YXRpYyBp
bnQgcmFkZW9uX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwg
c3RydWN0IHR0bV9tZW1fDQogCW1lbS0+YnVzLnNpemUgPSBtZW0tPm51bV9wYWdlcyA8PCBQQUdF
X1NISUZUOw0KIAltZW0tPmJ1cy5iYXNlID0gMDsNCiAJbWVtLT5idXMuaXNfaW9tZW0gPSBmYWxz
ZTsNCi0JaWYgKCEobWFuLT5mbGFncyAmIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEUpKQ0KLQkJ
cmV0dXJuIC1FSU5WQUw7DQorDQogCXN3aXRjaCAobWVtLT5tZW1fdHlwZSkgew0KIAljYXNlIFRU
TV9QTF9TWVNURU06DQogCQkvKiBzeXN0ZW0gbWVtb3J5ICovDQotLQ0KMi4xNy4xDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD2AFDD2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 15:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C4A6EB03;
	Wed, 11 Sep 2019 13:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790077.outbound.protection.outlook.com [40.107.79.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2966EB03
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 13:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hap/dnUWzLB0gl8YHojihDstMhVlSRAnFLyEa5QtSdAKS7R3NxcuUbHPR+R+xexLjAGMpQI3PE2TaCAx1I040j4by6HU8fUtgtjAeD06dRgIWTpMeXsogWE8NF2g/025HRLMYHloQGgHwDqoKw7bsq6jltBWEADsj1UeJa3hTM69yKhCEqr0mdh3mDBU9/e7krVFWAc5PSu530p2u5r8fGEU5a/k7YKdyuiQGQdmqqEberD7fuPCXpIp1r2HGDUInyBV+hTQz4Okk8eecvrPqtgbrhckqZDroaVT1JEcLJwQ7viwBfyKscZBCGV6oQ0Ej2wh98uIUpE1vbh/Z8g3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc6BSiUPFRVTn+QOvF+8v8MEOEBoeX2zN/6DeU9qkh4=;
 b=ZDhlO93LWbp0fzUE/QlyxO9PnjqK/1+JlUOauKxZRfrfcwFldDMRBNyRPS3r8m1xVeYEbF9l8K0xh4seVJq0V97H+M4C27+jD4jqW9HZ/tnXtgB8kx6B74UzMcg80GRM+sknCbssG6BL9LzX0dePo4rMIdOJ5fhjxPGWDKOPw0fGZz/64eJeqkfHJzJA/CYM0V39RZ4wQ9ieMoW2jSkBGg5UA7ZSRaf2CORqPXEsrCp+kVWUU4E8fViArRth4KaRv2rgl6Ovw1RalV2uZQhvEvTIc+hIV6J9QGTVtbWANiu1mGeUiM3q7N5U3KcNCP11f5/sE8MefGEjHj2O9T71ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0165.namprd12.prod.outlook.com (10.172.78.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 11 Sep 2019 13:41:04 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2263.016; Wed, 11 Sep
 2019 13:41:04 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>
Subject: Re: [PATCH] drm: fix warnings in DSC
Thread-Topic: [PATCH] drm: fix warnings in DSC
Thread-Index: AQHVaH2noNv/TEfIRUGOThl8NI3eqacmfB2A
Date: Wed, 11 Sep 2019 13:41:03 +0000
Message-ID: <8235afe0-1796-1647-8a39-84ab354e290a@amd.com>
References: <20190911084759.6946-1-benjamin.gaignard@st.com>
In-Reply-To: <20190911084759.6946-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::47) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8b2ac86-f4d4-49e4-1fa0-08d736bdb0a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0165; 
x-ms-traffictypediagnostic: CY4PR1201MB0165:
x-microsoft-antispam-prvs: <CY4PR1201MB01657F1F8177ACA5EA6C8EA18CB10@CY4PR1201MB0165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(199004)(189003)(8936002)(186003)(53546011)(6246003)(102836004)(6512007)(2616005)(5660300002)(26005)(476003)(486006)(25786009)(76176011)(52116002)(305945005)(7736002)(36756003)(64756008)(66446008)(66556008)(66476007)(256004)(2501003)(66946007)(6116002)(316002)(110136005)(3846002)(54906003)(2201001)(229853002)(71200400001)(71190400001)(31696002)(99286004)(58126008)(6486002)(65956001)(478600001)(31686004)(8676002)(66066001)(65806001)(14454004)(11346002)(4326008)(446003)(53936002)(6506007)(386003)(81166006)(81156014)(6436002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0165;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5vjcXF+E7lRIDHi6OK4iPq24rSk8pkF+mua8stvKx+1/Gw8Z3pfzJ+Ikwb1zPZsMw712UlJRr4Hb7xxdy7dIvGrFQ29xqE9ccJxQCvyTJad8eukwM0HfEDC5U1UrEatC0Z9T+uVDrFXSfjukZeG+ov2SZJQy9Zdk9oXXLg30Qs3NiECvoj/zk7R2FiY7vOAwkk5AjRJ2FI82fQAl4nWLbMRp+qg89hHUfYitqqXLjZc1UWAKBAse8PCYNmmJRZGGcm/iKxe6PPEVQrxFdMDCDVSNCDd5JObAgl8700j8Iin4sqLDqe6mtI+gc977meJj5JsW/8qnqujpQ7fqtPdA17PFdR86KKuu0iZG9AZkjMHvq8dJu1q5DhwwzKta/CelOKYC2t/PQovKEFWeAbJMcqoIov8YbbbbA+bGE1zgM70=
x-ms-exchange-transport-forked: True
Content-ID: <CECBB06CA9059745AABDFDC74C33DF3C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b2ac86-f4d4-49e4-1fa0-08d736bdb0a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 13:41:03.9646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVwwV/wqXG7qkTqYRQwDAFnzyGtcZ1eFqT2Y4lmId9ck03lpK1YR1xFPvaUfP4EgEiHdb5dJhYlxT8/BWqMzLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0165
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc6BSiUPFRVTn+QOvF+8v8MEOEBoeX2zN/6DeU9qkh4=;
 b=A2crms8ZaLA7hn5Q5sjEfVeCxnwWtrK8y1Rqrci4C0aAv6NbwAp1cbnFwquracq2B2747gc0B+t6yLjnRZ32Vjvuqt1YnxL+5HLuXeFfHQzYpPUkaa6QhBYmNg9/h5EMD4F/r/+TQ86G0li1fi3dGkNFr3uihAPkvIVMgCLatBE=
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMSA0OjQ3IGEubS4sIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOg0KPiBSZW1v
dmUgYWx3YXlzIGZhbHNlIGNvbXBhcmlzb25zIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9mIG5mbF9i
cGdfb2Zmc2V0DQo+IGFuZCBzY2FsZV9pbmNyZW1lbnRfaW50ZXJ2YWwgZmllbGRzLg0KPiBXYXJu
aW5ncyBkZXRlY3RlZCB3aGVuIGNvbXBpbGluZyB3aXRoIFc9MS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQoNClJldmll
d2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkN
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgfCAxMSAtLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jDQo+IGlu
ZGV4IDc3ZjRlNWFlNDE5Ny4uMjdlNWM2MDM2NjU4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RzYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMNCj4gQEAg
LTMzNiwxMiArMzM2LDYgQEAgaW50IGRybV9kc2NfY29tcHV0ZV9yY19wYXJhbWV0ZXJzKHN0cnVj
dCBkcm1fZHNjX2NvbmZpZyAqdmRzY19jZmcpDQo+ICAJZWxzZQ0KPiAgCQl2ZHNjX2NmZy0+bmZs
X2JwZ19vZmZzZXQgPSAwOw0KPiAgDQo+IC0JLyogMl4xNiAtIDEgKi8NCj4gLQlpZiAodmRzY19j
ZmctPm5mbF9icGdfb2Zmc2V0ID4gNjU1MzUpIHsNCj4gLQkJRFJNX0RFQlVHX0tNUygiTmZsQnBn
T2Zmc2V0IGlzIHRvbyBsYXJnZSBmb3IgdGhpcyBzbGljZSBoZWlnaHRcbiIpOw0KPiAtCQlyZXR1
cm4gLUVSQU5HRTsNCj4gLQl9DQo+IC0NCj4gIAkvKiBOdW1iZXIgb2YgZ3JvdXBzIHVzZWQgdG8g
Y29kZSB0aGUgZW50aXJlIHNsaWNlICovDQo+ICAJZ3JvdXBzX3RvdGFsID0gZ3JvdXBzX3Blcl9s
aW5lICogdmRzY19jZmctPnNsaWNlX2hlaWdodDsNCj4gIA0KPiBAQCAtMzcxLDExICszNjUsNiBA
QCBpbnQgZHJtX2RzY19jb21wdXRlX3JjX3BhcmFtZXRlcnMoc3RydWN0IGRybV9kc2NfY29uZmln
ICp2ZHNjX2NmZykNCj4gIAkJdmRzY19jZmctPnNjYWxlX2luY3JlbWVudF9pbnRlcnZhbCA9IDA7
DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKHZkc2NfY2ZnLT5zY2FsZV9pbmNyZW1lbnRfaW50ZXJ2YWwg
PiA2NTUzNSkgew0KPiAtCQlEUk1fREVCVUdfS01TKCJTY2FsZUluY3JlbWVudEludGVydmFsIGlz
IGxhcmdlIGZvciBzbGljZSBoZWlnaHRcbiIpOw0KPiAtCQlyZXR1cm4gLUVSQU5HRTsNCj4gLQl9
DQo+IC0NCj4gIAkvKg0KPiAgCSAqIERTQyBzcGVjIG1lbnRpb25zIHRoYXQgYml0c19wZXJfcGl4
ZWwgc3BlY2lmaWVzIHRoZSB0YXJnZXQNCj4gIAkgKiBiaXRzL3BpeGVsIChicHApIHJhdGUgdGhh
dCBpcyB1c2VkIGJ5IHRoZSBlbmNvZGVyLA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

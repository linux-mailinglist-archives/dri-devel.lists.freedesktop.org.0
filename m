Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F449DD7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 11:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C0E6E128;
	Tue, 18 Jun 2019 09:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9996E128;
 Tue, 18 Jun 2019 09:55:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I9qudb005040; Tue, 18 Jun 2019 11:55:53 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4nt882dk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 11:55:53 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2283B3A;
 Tue, 18 Jun 2019 09:55:51 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBB2F25A7;
 Tue, 18 Jun 2019 09:55:51 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 18 Jun
 2019 11:55:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 18 Jun 2019 11:55:51 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 30/59] drm/stm: Drop drm_gem_prime_export/import
Thread-Topic: [PATCH 30/59] drm/stm: Drop drm_gem_prime_export/import
Thread-Index: AQHVIvDp+m2tmeOns0K9ARUDkRE2JKahEJIA
Date: Tue, 18 Jun 2019 09:55:51 +0000
Message-ID: <34a31eef-e720-bb71-9402-6a4a01ddfa8a@st.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-31-daniel.vetter@ffwll.ch>
In-Reply-To: <20190614203615.12639-31-daniel.vetter@ffwll.ch>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <B884CE2004CC1745B816A4BE9D9C9100@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_05:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6UA/B9nOCc5f1idH3NZT/7FGLUW2DK1pBlQj4NqpSyI=;
 b=VKnDJqq9uoqmEPSwSry8KUis0DkFsCtSGm+Zut614Blnv8yFedzMoBRa8Iu5l7O+MJ0d
 QcTjF3L5SKkPHQ52V7DjaSry2A6TeggE21DCDRSi1l+ixAjdYRLl+1md6zUS9F6ZLshD
 FYtKruQ46cEVPGAKLQGOWhZ9WE0u+iqMlZTUbFsr/NTryGXF6bt/BgJOXdU86KYj2/19
 icFcU0rxRdWLuym9g0dHGGvD+9s274rKGNY0kcpQUyaIv5A1lDcqbXYjtgbWI4zCFIQl
 q/gklpsqNaCFePWQ/3WaGrnhqhAdhFU8ocI/CpzJgRkm0yAXi4ktEodY272RYozQhE47 oQ== 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel
 Vetter <daniel.vetter@intel.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLA0KDQpBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0
LmNvbT4NCg0KV2Ugd2lsbCBoYXZlIGEgbG9vayB0byBzaW1wbGlmeSB0aGlzIHBhcnQgb2YgdGhl
IGNvZGUuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4NCg0KUGhpbGlwcGUgOi0pDQoNCk9u
IDYvMTQvMTkgMTA6MzUgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IFRoZXkncmUgdGhlIGRl
ZmF1bHQuDQo+IA0KPiBBc2lkZTogV291bGQgYmUgcmVhbGx5IG5pY2UgdG8gc3dpdGNoIHRoZSBv
dGhlcnMgb3ZlciB0bw0KPiBkcm1fZ2VtX29iamVjdF9mdW5jcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogWWFubmlj
ayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gQ2M6IFBoaWxpcHBlIENvcm51IDxw
aGlsaXBwZS5jb3JudUBzdC5jb20+DQo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4u
Z2FpZ25hcmRAbGluYXJvLm9yZz4NCj4gQ2M6IFZpbmNlbnQgQWJyaW91IDx2aW5jZW50LmFicmlv
dUBzdC5jb20+DQo+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5j
b20+DQo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4NCj4g
Q2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20NCj4gQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vc3RtL2Rydi5jIHwgMiAtLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vc3RtL2Rydi5jDQo+IGluZGV4IDQwMjZjMzNjY2MzOS4uMzMxZjVlOGQ3NzliIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdG0vZHJ2LmMNCj4gQEAgLTY3LDggKzY3LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJp
dmVyIGRydl9kcml2ZXIgPSB7DQo+ICAgCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3By
aW1lX2ZkX3RvX2hhbmRsZSwNCj4gICAJLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCA9IGRybV9n
ZW1fY21hX2ZyZWVfb2JqZWN0LA0KPiAgIAkuZ2VtX3ZtX29wcyA9ICZkcm1fZ2VtX2NtYV92bV9v
cHMsDQo+IC0JLmdlbV9wcmltZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwNCj4gLQku
Z2VtX3ByaW1lX2ltcG9ydCA9IGRybV9nZW1fcHJpbWVfaW1wb3J0LA0KPiAgIAkuZ2VtX3ByaW1l
X2dldF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwNCj4gICAJLmdl
bV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFi
bGUsDQo+ICAgCS5nZW1fcHJpbWVfdm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsDQo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

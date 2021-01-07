Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39AE2ECC0B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0F6E44F;
	Thu,  7 Jan 2021 08:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9386E44F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 08:54:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1078LRZO030412; Thu, 7 Jan 2021 09:27:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8rjYlVyA94yuNuaVUffJF82e0WsqwIDeyV/3+psy6uo=;
 b=wFO7Bmw27CauKG+iQmePDKipL1CBH/Uw0NB9rbLOtKyqEJ5W+Mx8HPUlY1TdniSXMX3T
 pRsfy+/pXqj7TuBOZRq3sTdqp5hJrI1eubtA5lkJ+JrJklhymqs0akdSYgAZyeAhUFGz
 BPyEqCWsOCqXTqpoxm6tRlVbRTHEemODxp6ga/rGR6VWlKQRHJ4BXiAkU9mcgeMc3+Rp
 3NmolwRym2r7YOsPOM+gxq6JL5vSPCUpWnBJNHLkQkbfuWyBr6g1jgMHkYMM9RslLV3r
 pxM2YJM2TdG9nzjz3PvqBZrYftAcDPdVExNyFOHqEccKmPAjR5Xwbfp3zEDnRf5i7RfJ Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35wt3295mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 09:27:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B72210002A;
 Thu,  7 Jan 2021 09:27:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FF6922AA65;
 Thu,  7 Jan 2021 09:27:02 +0100 (CET)
Received: from SFHDAG2NODE1.st.com (10.75.127.4) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 Jan
 2021 09:27:01 +0100
Received: from SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90]) by
 SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90%20]) with mapi id
 15.00.1473.003; Thu, 7 Jan 2021 09:27:01 +0100
From: Yannick FERTRE <yannick.fertre@st.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/stm: Remove usage of drm_display_mode_to_videomode()
Thread-Topic: [PATCH] drm/stm: Remove usage of drm_display_mode_to_videomode()
Thread-Index: AQHW2bzmYkLaov4sTUyxutUANfnvQKob2YCA
Date: Thu, 7 Jan 2021 08:27:01 +0000
Message-ID: <0ab4ee45-4437-3b02-cf63-0e3b1b53920f@st.com>
References: <20201224062030.92287-1-marex@denx.de>
In-Reply-To: <20201224062030.92287-1-marex@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <D80BC71185489B49A9CD1DDD0C6EBFA2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-07_04:2021-01-06,
 2021-01-07 signatures=0
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
Cc: Alexandre TORGUE <alexandre.torgue@st.com>,
 Antonio BORNEO <antonio.borneo@st.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyZWssDQp0aGFua3MgZm9yIHRoZSBwYXRjaC4gSXQgd29ya3MgZmluZSBvbiBzdG0zMm1w
MSBldmFsIGJvYXJkIHdpdGggYnJpZGdlIA0KRFNJICYgRFBJIHBhbmVsLg0KDQpUZXN0ZWQtYnk6
IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KDQpCZXN0IHJlZ2FyZHMN
Cg0KT24gMTIvMjQvMjAgNzoyMCBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+IFRoZXJlIGlzIG5v
dCBtdWNoIHZhbHVlIGluIHRoZSBleHRyYSBjb252ZXJzaW9uIHN0ZXAsIHRoZSBjYWxjdWxhdGlv
bnMNCj4gcmVxdWlyZWQgZm9yIHRoZSBMVERDIElQIGFyZSBkaWZmZXJlbnQgdGhhbiB3aGF0IGlz
IHVzZWQgaW4gdGhlDQo+IGRybV9kaXNwbGF5X21vZGVfdG9fdmlkZW9tb2RlKCksIHNvIGp1c3Qg
ZG8gdGhlIHJpZ2h0IG9uZXMgaW4gdGhlIExUREMNCj4gZHJpdmVyIHJpZ2h0IGF3YXkuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gQ2M6IEFsZXhh
bmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPg0KPiBDYzogQW50b25pbyBCb3Ju
ZW8gPGFudG9uaW8uYm9ybmVvQHN0LmNvbT4NCj4gQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5q
YW1pbi5nYWlnbmFyZEBzdC5jb20+DQo+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+DQo+IENjOiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3Qu
Y29tPg0KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiBDYzogVmluY2Vu
dCBBYnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4NCj4gQ2M6IFlhbm5pY2sgRmVydHJlIDx5
YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcNCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20N
Cj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzMyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc3RtL2x0ZGMuYw0KPiBpbmRleCAyMmM3ZTlmYTVhYjcuLmU4ZmM4ZmM1MGQ5NCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4gQEAgLTU0NSw3ICs1NDUsNiBAQCBzdGF0aWMgdm9pZCBs
dGRjX2NydGNfbW9kZV9zZXRfbm9mYihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpDQo+ICAgCXN0cnVj
dCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRkYyhjcnRjKTsNCj4gICAJc3RydWN0IGRy
bV9kZXZpY2UgKmRkZXYgPSBjcnRjLT5kZXY7DQo+ICAgCXN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlID0gJmNydGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlOw0KPiAtCXN0cnVjdCB2aWRlb21v
ZGUgdm07DQo+ICAgCXUzMiBidXNfZmxhZ3MgPSAwOw0KPiAgIAl1MzIgaHN5bmMsIHZzeW5jLCBh
Y2N1bV9oYnAsIGFjY3VtX3ZicCwgYWNjdW1fYWN0X3csIGFjY3VtX2FjdF9oOw0KPiAgIAl1MzIg
dG90YWxfd2lkdGgsIHRvdGFsX2hlaWdodDsNCj4gQEAgLTU2NSwzMSArNTY0LDMzIEBAIHN0YXRp
YyB2b2lkIGx0ZGNfY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4g
ICAJCX0NCj4gICAJfQ0KPiAgIA0KPiAtCWRybV9kaXNwbGF5X21vZGVfdG9fdmlkZW9tb2RlKG1v
ZGUsICZ2bSk7DQo+IC0NCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiQ1JUQzolZCBtb2RlOiVzXG4i
LCBjcnRjLT5iYXNlLmlkLCBtb2RlLT5uYW1lKTsNCj4gLQlEUk1fREVCVUdfRFJJVkVSKCJWaWRl
byBtb2RlOiAlZHglZCIsIHZtLmhhY3RpdmUsIHZtLnZhY3RpdmUpOw0KPiArCURSTV9ERUJVR19E
UklWRVIoIlZpZGVvIG1vZGU6ICVkeCVkIiwgbW9kZS0+aGRpc3BsYXksIG1vZGUtPnZkaXNwbGF5
KTsNCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiIGhmcCAlZCBoYnAgJWQgaHNsICVkIHZmcCAlZCB2
YnAgJWQgdnNsICVkXG4iLA0KPiAtCQkJIHZtLmhmcm9udF9wb3JjaCwgdm0uaGJhY2tfcG9yY2gs
IHZtLmhzeW5jX2xlbiwNCj4gLQkJCSB2bS52ZnJvbnRfcG9yY2gsIHZtLnZiYWNrX3BvcmNoLCB2
bS52c3luY19sZW4pOw0KPiArCQkJIG1vZGUtPmhzeW5jX3N0YXJ0IC0gbW9kZS0+aGRpc3BsYXks
DQo+ICsJCQkgbW9kZS0+aHRvdGFsIC0gbW9kZS0+aHN5bmNfZW5kLA0KPiArCQkJIG1vZGUtPmhz
eW5jX2VuZCAtIG1vZGUtPmhzeW5jX3N0YXJ0LA0KPiArCQkJIG1vZGUtPnZzeW5jX3N0YXJ0IC0g
bW9kZS0+dmRpc3BsYXksDQo+ICsJCQkgbW9kZS0+dnRvdGFsIC0gbW9kZS0+dnN5bmNfZW5kLA0K
PiArCQkJIG1vZGUtPnZzeW5jX2VuZCAtIG1vZGUtPnZzeW5jX3N0YXJ0KTsNCj4gICANCj4gICAJ
LyogQ29udmVydCB2aWRlbyB0aW1pbmdzIHRvIGx0ZGMgdGltaW5ncyAqLw0KPiAtCWhzeW5jID0g
dm0uaHN5bmNfbGVuIC0gMTsNCj4gLQl2c3luYyA9IHZtLnZzeW5jX2xlbiAtIDE7DQo+IC0JYWNj
dW1faGJwID0gaHN5bmMgKyB2bS5oYmFja19wb3JjaDsNCj4gLQlhY2N1bV92YnAgPSB2c3luYyAr
IHZtLnZiYWNrX3BvcmNoOw0KPiAtCWFjY3VtX2FjdF93ID0gYWNjdW1faGJwICsgdm0uaGFjdGl2
ZTsNCj4gLQlhY2N1bV9hY3RfaCA9IGFjY3VtX3ZicCArIHZtLnZhY3RpdmU7DQo+IC0JdG90YWxf
d2lkdGggPSBhY2N1bV9hY3RfdyArIHZtLmhmcm9udF9wb3JjaDsNCj4gLQl0b3RhbF9oZWlnaHQg
PSBhY2N1bV9hY3RfaCArIHZtLnZmcm9udF9wb3JjaDsNCj4gKwloc3luYyA9IG1vZGUtPmhzeW5j
X2VuZCAtIG1vZGUtPmhzeW5jX3N0YXJ0IC0gMTsNCj4gKwl2c3luYyA9IG1vZGUtPnZzeW5jX2Vu
ZCAtIG1vZGUtPnZzeW5jX3N0YXJ0IC0gMTsNCj4gKwlhY2N1bV9oYnAgPSBtb2RlLT5odG90YWwg
LSBtb2RlLT5oc3luY19zdGFydCAtIDE7DQo+ICsJYWNjdW1fdmJwID0gbW9kZS0+dnRvdGFsIC0g
bW9kZS0+dnN5bmNfc3RhcnQgLSAxOw0KPiArCWFjY3VtX2FjdF93ID0gYWNjdW1faGJwICsgbW9k
ZS0+aGRpc3BsYXk7DQo+ICsJYWNjdW1fYWN0X2ggPSBhY2N1bV92YnAgKyBtb2RlLT52ZGlzcGxh
eTsNCj4gKwl0b3RhbF93aWR0aCA9IG1vZGUtPmh0b3RhbCAtIDE7DQo+ICsJdG90YWxfaGVpZ2h0
ID0gbW9kZS0+dnRvdGFsIC0gMTsNCj4gICANCj4gICAJLyogQ29uZmlndXJlcyB0aGUgSFMsIFZT
LCBERSBhbmQgUEMgcG9sYXJpdGllcy4gRGVmYXVsdCBBY3RpdmUgTG93ICovDQo+ICAgCXZhbCA9
IDA7DQo+ICAgDQo+IC0JaWYgKHZtLmZsYWdzICYgRElTUExBWV9GTEFHU19IU1lOQ19ISUdIKQ0K
PiArCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfUEhTWU5DKQ0KPiAgIAkJdmFsIHw9
IEdDUl9IU1BPTDsNCj4gICANCj4gLQlpZiAodm0uZmxhZ3MgJiBESVNQTEFZX0ZMQUdTX1ZTWU5D
X0hJR0gpDQo+ICsJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19QVlNZTkMpDQo+ICAg
CQl2YWwgfD0gR0NSX1ZTUE9MOw0KPiAgIA0KPiAgIAlpZiAoYnVzX2ZsYWdzICYgRFJNX0JVU19G
TEFHX0RFX0xPVykNCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

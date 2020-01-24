Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEACC147EEC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 11:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C73B72A13;
	Fri, 24 Jan 2020 10:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E662C72A13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 10:43:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OAgYob031905; Fri, 24 Jan 2020 11:43:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=s3pHyhv0PCh8sGshQz4ekk+q5dFM8CCywPBYtm+/lFk=;
 b=Q895OI1PxaXKzyB4WQkmpaCqTe5YYRiCFMNVMh01mF9MgV34HkyeopJI/vg0wKczHnww
 KodFj26mp+PN+dfkv82AQFe1tX12CYnVNthQyTGovap02fSzk+hrNuCMwb1DEKBIRXyH
 hNJsT0q4g1PHNBJDHvW45jEF4WTDGeMETyaBqWb7gUmjTJCbvlm+rlxnnnCamVFMHJ/q
 TkvkZBE0ZGPd6y2IIrlKU0J9N5DscQGOcHaTw4v7XXmn2xD047fUap8zIGJP96isgVXH
 GBSi0bIl1dWfNqE28Z2utR0kFohbQOlAw8iu26/RLQWO5LkOEJXdtd9JjHTQUIVyLDVD gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1efg3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 11:43:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3943910002A;
 Fri, 24 Jan 2020 11:43:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E97F220316;
 Fri, 24 Jan 2020 11:43:05 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jan
 2020 11:43:04 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Jan 2020 11:43:04 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "benjamin.gaignard@linaro.org"
 <benjamin.gaignard@linaro.org>, Vincent ABRIOU <vincent.abriou@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "eric@anholt.net" <eric@anholt.net>, "rodrigosiqueiramelo@gmail.com"
 <rodrigosiqueiramelo@gmail.com>, "hamohammed.sa@gmail.com"
 <hamohammed.sa@gmail.com>, "linux-graphics-maintainer@vmware.com"
 <linux-graphics-maintainer@vmware.com>, "thellstrom@vmware.com"
 <thellstrom@vmware.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 15/22] drm/stm: Convert to CRTC VBLANK callbacks
Thread-Topic: [PATCH v4 15/22] drm/stm: Convert to CRTC VBLANK callbacks
Thread-Index: AQHV0fVoJhPO6GURiEmbInh/nWrCgaf5kW4A
Date: Fri, 24 Jan 2020 10:43:04 +0000
Message-ID: <40c4b198-0796-631e-b533-494822af9c47@st.com>
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-16-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-16-tzimmermann@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <DB2A5D2782CBB040AC5BB0FB174AA7FD@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_02:2020-01-24,
 2020-01-24 signatures=0
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBUaG9tYXMsDQpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsDQpGb3IgdGhpcyBzdG0gcGFy
dCwNCkFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpQ
aGlsaXBwZSA6LSkNCg0KT24gMS8yMy8yMCAyOjU5IFBNLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gVkJMQU5LIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVwcmVjYXRl
ZCBpbiBmYXZvciBvZg0KPiB0aGVpciBlcXVpdmFsZW50cyBpbiBzdHJ1Y3QgZHJtX2NydGNfZnVu
Y3MuIENvbnZlcnQgc3RtIG92ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gVGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyw6kg
PHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9k
cnYuYyAgfCAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDEgKw0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9k
cnYuYw0KPiBpbmRleCA0ODY5ODU2MDQxMDkuLmVhOWZjYmRjNjhiMyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Ry
di5jDQo+IEBAIC03Miw3ICs3Miw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcnZfZHJp
dmVyID0gew0KPiAgIAkuZ2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLA0K
PiAgIAkuZ2VtX3ByaW1lX3Z1bm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3Z1bm1hcCwNCj4gICAJ
LmdlbV9wcmltZV9tbWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwNCj4gLQkuZ2V0X3ZibGFu
a190aW1lc3RhbXAgPSBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zLA0KPiAg
IH07DQo+ICAgDQo+ICAgc3RhdGljIGludCBkcnZfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRl
dikNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMNCj4gaW5kZXggOGI2ZDFhMjI1MmUzLi5lZTJhOGNhYzU5Y2IgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zdG0vbHRkYy5jDQo+IEBAIC03MjIsNiArNzIyLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fY3J0Y19mdW5jcyBsdGRjX2NydGNfZnVuY3MgPSB7DQo+ICAgCS5hdG9taWNfZGVz
dHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2NydGNfZGVzdHJveV9zdGF0ZSwNCj4gICAJ
LmVuYWJsZV92YmxhbmsgPSBsdGRjX2NydGNfZW5hYmxlX3ZibGFuaywNCj4gICAJLmRpc2FibGVf
dmJsYW5rID0gbHRkY19jcnRjX2Rpc2FibGVfdmJsYW5rLA0KPiArCS5nZXRfdmJsYW5rX3RpbWVz
dGFtcCA9IGRybV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3ZibGFua190aW1lc3RhbXAsDQo+ICAg
CS5nYW1tYV9zZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0LA0KPiAgIH07
DQo+ICAgDQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

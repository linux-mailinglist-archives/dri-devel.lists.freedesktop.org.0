Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DC147EF3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 11:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FE36E1ED;
	Fri, 24 Jan 2020 10:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAE46E1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 10:45:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OAcXBI014165; Fri, 24 Jan 2020 11:42:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=D+MMRA3+BtQCtkYlV+DM8L3Pa4+L2pFui0hyJ9a84oI=;
 b=Jf1ryFWPa2PKfJ9c67b5IdbVHc2k3zdto7nVqJ1uJxpyqbf/3Z+oTDjcQEeergZdv+b9
 pFGVF4AsI3nGKQ+DFWj2wX5JrBfkhlpwhtaRv/dBxBLrTWeqn8zT2WUcJ19p5P/7fdJU
 Ke8bfoi/25j/B7Qg9Ek15abVu8YnWOH4o5KVcDGsq7s/EBwl6K4qxzgUiBauJE1M0MzB
 X9LjN/7b6ltO2rLOG4cKNyFr81u5M/3qSTHvg8PNmRtsNHaEeKLDHmOG+JqZC2GgYVHX
 t7V6Ge7popo11tnJ763BENxPXUBBIzXF5/GBJ7CVU5VHn2dhd5ddPUvRNVLCsb6+8FeW eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc5ferq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 11:42:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCECE100034;
 Fri, 24 Jan 2020 11:42:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61E9A220316;
 Fri, 24 Jan 2020 11:42:44 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jan
 2020 11:42:43 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Jan 2020 11:42:43 +0100
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
Subject: Re: [PATCH v4 14/22] drm/stm: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Thread-Topic: [PATCH v4 14/22] drm/stm: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Thread-Index: AQHV0fVoJkeO+wB2bU+W8G1aYiLgiKf5kVEA
Date: Fri, 24 Jan 2020 10:42:43 +0000
Message-ID: <fda392b6-0011-40d9-ed2c-671500428ca5@st.com>
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-15-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-15-tzimmermann@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <281F59C29CE208498694442BD5B99E93@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
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
ZToNCj4gVGhlIGNhbGxiYWNrIHN0cnVjdCBkcm1fZHJpdmVyLmdldF9zY2Fub3V0X3Bvc2l0aW9u
KCkgaXMgZGVwcmVjYXRlZCBpbg0KPiBmYXZvciBvZiBzdHJ1Y3QgZHJtX2NydGNfaGVscGVyX2Z1
bmNzLmdldF9zY2Fub3V0X3Bvc2l0aW9uKCkuIENvbnZlcnQgc3RtDQo+IG92ZXIuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4g
VGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyAgfCAgMSAtDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMgfCA2NSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oIHwgIDUgLS0tDQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYu
Yw0KPiBpbmRleCA1YTlmOWFjYThiYzIuLjQ4Njk4NTYwNDEwOSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5j
DQo+IEBAIC03Miw3ICs3Miw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcnZfZHJpdmVy
ID0gew0KPiAgIAkuZ2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLA0KPiAg
IAkuZ2VtX3ByaW1lX3Z1bm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3Z1bm1hcCwNCj4gICAJLmdl
bV9wcmltZV9tbWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwNCj4gLQkuZ2V0X3NjYW5vdXRf
cG9zaXRpb24gPSBsdGRjX2NydGNfc2Nhbm91dHBvcywNCj4gICAJLmdldF92YmxhbmtfdGltZXN0
YW1wID0gZHJtX2NhbGNfdmJsdGltZXN0YW1wX2Zyb21fc2Nhbm91dHBvcywNCj4gICB9Ow0KPiAg
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vc3RtL2x0ZGMuYw0KPiBpbmRleCBjMjgxNWU4YWUxZGEuLjhiNmQxYTIyNTJlMyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMNCj4gQEAgLTYzNiwzOCArNjM2LDEzIEBAIHN0YXRpYyB2b2lkIGx0
ZGNfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgIAl9DQo+ICAg
fQ0KPiAgIA0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MgbHRk
Y19jcnRjX2hlbHBlcl9mdW5jcyA9IHsNCj4gLQkubW9kZV92YWxpZCA9IGx0ZGNfY3J0Y19tb2Rl
X3ZhbGlkLA0KPiAtCS5tb2RlX2ZpeHVwID0gbHRkY19jcnRjX21vZGVfZml4dXAsDQo+IC0JLm1v
ZGVfc2V0X25vZmIgPSBsdGRjX2NydGNfbW9kZV9zZXRfbm9mYiwNCj4gLQkuYXRvbWljX2ZsdXNo
ID0gbHRkY19jcnRjX2F0b21pY19mbHVzaCwNCj4gLQkuYXRvbWljX2VuYWJsZSA9IGx0ZGNfY3J0
Y19hdG9taWNfZW5hYmxlLA0KPiAtCS5hdG9taWNfZGlzYWJsZSA9IGx0ZGNfY3J0Y19hdG9taWNf
ZGlzYWJsZSwNCj4gLX07DQo+IC0NCj4gLXN0YXRpYyBpbnQgbHRkY19jcnRjX2VuYWJsZV92Ymxh
bmsoc3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiAtew0KPiAtCXN0cnVjdCBsdGRjX2RldmljZSAq
bGRldiA9IGNydGNfdG9fbHRkYyhjcnRjKTsNCj4gLQ0KPiAtCURSTV9ERUJVR19EUklWRVIoIlxu
Iik7DQo+IC0JcmVnX3NldChsZGV2LT5yZWdzLCBMVERDX0lFUiwgSUVSX0xJRSk7DQo+IC0NCj4g
LQlyZXR1cm4gMDsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIHZvaWQgbHRkY19jcnRjX2Rpc2FibGVf
dmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4gLXsNCj4gLQlzdHJ1Y3QgbHRkY19kZXZp
Y2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7DQo+IC0NCj4gLQlEUk1fREVCVUdfRFJJVkVS
KCJcbiIpOw0KPiAtCXJlZ19jbGVhcihsZGV2LT5yZWdzLCBMVERDX0lFUiwgSUVSX0xJRSk7DQo+
IC19DQo+IC0NCj4gLWJvb2wgbHRkY19jcnRjX3NjYW5vdXRwb3Moc3RydWN0IGRybV9kZXZpY2Ug
KmRkZXYsIHVuc2lnbmVkIGludCBwaXBlLA0KPiAtCQkJICBib29sIGluX3ZibGFua19pcnEsIGlu
dCAqdnBvcywgaW50ICpocG9zLA0KPiAtCQkJICBrdGltZV90ICpzdGltZSwga3RpbWVfdCAqZXRp
bWUsDQo+IC0JCQkgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQ0KPiArc3Rh
dGljIGJvb2wgbHRkY19jcnRjX2dldF9zY2Fub3V0X3Bvc2l0aW9uKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YywNCj4gKwkJCQkJICAgYm9vbCBpbl92YmxhbmtfaXJxLA0KPiArCQkJCQkgICBpbnQgKnZw
b3MsIGludCAqaHBvcywNCj4gKwkJCQkJICAga3RpbWVfdCAqc3RpbWUsIGt0aW1lX3QgKmV0aW1l
LA0KPiArCQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkNCj4gICB7
DQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBjcnRjLT5kZXY7DQo+ICAgCXN0cnVjdCBs
dGRjX2RldmljZSAqbGRldiA9IGRkZXYtPmRldl9wcml2YXRlOw0KPiAgIAlpbnQgbGluZSwgdmFj
dGl2ZV9zdGFydCwgdmFjdGl2ZV9lbmQsIHZ0b3RhbDsNCj4gICANCj4gQEAgLTcxMCw2ICs2ODUs
MzQgQEAgYm9vbCBsdGRjX2NydGNfc2Nhbm91dHBvcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwg
dW5zaWduZWQgaW50IHBpcGUsDQo+ICAgCXJldHVybiB0cnVlOw0KPiAgIH0NCj4gICANCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfaGVscGVyX2Z1bmNzIGx0ZGNfY3J0Y19oZWxwZXJf
ZnVuY3MgPSB7DQo+ICsJLm1vZGVfdmFsaWQgPSBsdGRjX2NydGNfbW9kZV92YWxpZCwNCj4gKwku
bW9kZV9maXh1cCA9IGx0ZGNfY3J0Y19tb2RlX2ZpeHVwLA0KPiArCS5tb2RlX3NldF9ub2ZiID0g
bHRkY19jcnRjX21vZGVfc2V0X25vZmIsDQo+ICsJLmF0b21pY19mbHVzaCA9IGx0ZGNfY3J0Y19h
dG9taWNfZmx1c2gsDQo+ICsJLmF0b21pY19lbmFibGUgPSBsdGRjX2NydGNfYXRvbWljX2VuYWJs
ZSwNCj4gKwkuYXRvbWljX2Rpc2FibGUgPSBsdGRjX2NydGNfYXRvbWljX2Rpc2FibGUsDQo+ICsJ
LmdldF9zY2Fub3V0X3Bvc2l0aW9uID0gbHRkY19jcnRjX2dldF9zY2Fub3V0X3Bvc2l0aW9uLA0K
PiArfTsNCj4gKw0KPiArc3RhdGljIGludCBsdGRjX2NydGNfZW5hYmxlX3ZibGFuayhzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMpDQo+ICt7DQo+ICsJc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0
Y190b19sdGRjKGNydGMpOw0KPiArDQo+ICsJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsNCj4gKwly
ZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJfTElFKTsNCj4gKw0KPiArCXJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBsdGRjX2NydGNfZGlzYWJsZV92Ymxhbmsoc3Ry
dWN0IGRybV9jcnRjICpjcnRjKQ0KPiArew0KPiArCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9
IGNydGNfdG9fbHRkYyhjcnRjKTsNCj4gKw0KPiArCURSTV9ERUJVR19EUklWRVIoIlxuIik7DQo+
ICsJcmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJfTElFKTsNCj4gK30NCj4gKw0K
PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MgbHRkY19jcnRjX2Z1bmNzID0g
ew0KPiAgIAkuZGVzdHJveSA9IGRybV9jcnRjX2NsZWFudXAsDQo+ICAgCS5zZXRfY29uZmlnID0g
ZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZywNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zdG0vbHRkYy5oIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmgNCj4gaW5kZXggYTFh
ZDBhZTNiMDA2Li5jNTQ2N2Q3NGU3MDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oDQo+IEBAIC0zOSwx
MSArMzksNiBAQCBzdHJ1Y3QgbHRkY19kZXZpY2Ugew0KPiAgIAlzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3VzcGVuZF9zdGF0ZTsNCj4gICB9Ow0KPiAgIA0KPiAtYm9vbCBsdGRjX2NydGNfc2Nh
bm91dHBvcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSwNCj4gLQkJ
CSAgYm9vbCBpbl92YmxhbmtfaXJxLCBpbnQgKnZwb3MsIGludCAqaHBvcywNCj4gLQkJCSAga3Rp
bWVfdCAqc3RpbWUsIGt0aW1lX3QgKmV0aW1lLA0KPiAtCQkJICBjb25zdCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqbW9kZSk7DQo+IC0NCj4gICBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2
aWNlICpkZGV2KTsNCj4gICB2b2lkIGx0ZGNfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2
KTsNCj4gICB2b2lkIGx0ZGNfc3VzcGVuZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldik7DQo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

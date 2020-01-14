Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC92213ADB6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 16:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9E66E41D;
	Tue, 14 Jan 2020 15:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448676E41D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 15:33:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EFRNUj021416; Tue, 14 Jan 2020 16:32:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=STMicroelectronics;
 bh=MgUcUhwWVRxVq9fCgI+yfZ6UWk1/dMI8JwsK5rxzvRc=;
 b=O1AbswxwX+w0dBo1Zi5MP/rjZ0mhUGVkBB5w1vBv0Kxcae7GX8iHz7vmuviQj94JvfoS
 1MJ+POwVZshIqHAbJlhzgC1MlALy0yVlndBjZJ+NexnYuw5r3pzXRwEcg+fuYn0Qy8rW
 fG6Okbtw+sZmR2j2lDN+vbv8jVAEIYWXDGpxmXKF77nW2Jr6F5IaZZy4X6V6QjsIKttG
 SSq6FMQo799BEFpB7Y5+B/yFJSQLHqGfoEmQE5lBs5PMUSmDT0elnytN4zwG/9pOpsZy
 XfeFfHMz8bsVaBT4POZQdUWaLeGFjyvRS3XLJrF5vNRG8hgQCBviivESHBSyXylaplKs yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78s691a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 16:32:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 292A210002A;
 Tue, 14 Jan 2020 16:32:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00BE02BEC65;
 Tue, 14 Jan 2020 16:32:46 +0100 (CET)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jan
 2020 16:32:45 +0100
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Tue, 14 Jan 2020 16:32:45 +0100
From: Yannick FERTRE <yannick.fertre@st.com>
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
 Philippe CORNU <philippe.cornu@st.com>, "mcoquelin.stm32@gmail.com"
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
Subject: Re: [PATCH 19/23] drm/stm: Convert to CRTC VBLANK callbacks
Thread-Topic: [PATCH 19/23] drm/stm: Convert to CRTC VBLANK callbacks
Thread-Index: AQHVx5di0wxYWmwrC0KECpJk9EfgC6fqP8gA
Date: Tue, 14 Jan 2020 15:32:45 +0000
Message-ID: <c2742962-37f2-0df5-63d5-235b0e85ef7f@st.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-20-tzimmermann@suse.de>
In-Reply-To: <20200110092127.27847-20-tzimmermann@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_04:2020-01-14,
 2020-01-14 signatures=0
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
Content-Type: multipart/mixed; boundary="===============1659467176=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1659467176==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_c274296237f20df563d5235b0e85ef7fstcom_"

--_000_c274296237f20df563d5235b0e85ef7fstcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNClRlc3RlZC1ieTogWWFubmljayBGZXJ0csOpIDx5YW5u
aWNrLmZlcnRyZUBzdC5jb20+PG1haWx0bzp5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQoNCkJSDQpZ
YW5uaWNrIEZlcnRyw6kNCg0KDQpPbiAxLzEwLzIwIDEwOjIxIEFNLCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToNCg0KVkJMQU5LIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVw
cmVjYXRlZCBpbiBmYXZvciBvZg0KdGhlaXIgZXF1aXZhbGVudHMgaW4gc3RydWN0IGRybV9jcnRj
X2Z1bmNzLiBDb252ZXJ0IHN0bSBvdmVyLg0KDQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT48bWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGU+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jICB8IDEgLQ0KIGRyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jIHwgMSArDQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9zdG0vZHJ2LmMNCmluZGV4IDQ4Njk4NTYwNDEwOS4uZWE5ZmNiZGM2OGIzIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3N0bS9kcnYuYw0KQEAgLTcyLDcgKzcyLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVy
IGRydl9kcml2ZXIgPSB7DQogICAgICAgIC5nZW1fcHJpbWVfdm1hcCA9IGRybV9nZW1fY21hX3By
aW1lX3ZtYXAsDQogICAgICAgIC5nZW1fcHJpbWVfdnVubWFwID0gZHJtX2dlbV9jbWFfcHJpbWVf
dnVubWFwLA0KICAgICAgICAuZ2VtX3ByaW1lX21tYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV9tbWFw
LA0KLSAgICAgICAuZ2V0X3ZibGFua190aW1lc3RhbXAgPSBkcm1fY2FsY192Ymx0aW1lc3RhbXBf
ZnJvbV9zY2Fub3V0cG9zLA0KIH07DQoNCiBzdGF0aWMgaW50IGRydl9sb2FkKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZGV2KQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCmluZGV4IDhiNmQxYTIyNTJlMy4uNGZlOWIwMzNk
ZTFiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9zdG0vbHRkYy5jDQpAQCAtNzIyLDYgKzcyMiw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2NydGNfZnVuY3MgbHRkY19jcnRjX2Z1bmNzID0gew0KICAgICAgICAuYXRvbWlj
X2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jcnRjX2Rlc3Ryb3lfc3RhdGUsDQog
ICAgICAgIC5lbmFibGVfdmJsYW5rID0gbHRkY19jcnRjX2VuYWJsZV92YmxhbmssDQogICAgICAg
IC5kaXNhYmxlX3ZibGFuayA9IGx0ZGNfY3J0Y19kaXNhYmxlX3ZibGFuaywNCisgICAgICAgLmdl
dF92YmxhbmtfdGltZXN0YW1wID0gZHJtX2NydGNfY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fu
b3V0cG9zLA0KICAgICAgICAuZ2FtbWFfc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfbGVnYWN5X2dh
bW1hX3NldCwNCiB9Ow0KDQoNCg0K

--_000_c274296237f20df563d5235b0e85ef7fstcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DEAF222464187C41877F2CCC8006A1AD@st.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPHByZT5UaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KVGVzdGVk
LWJ5OiBZYW5uaWNrIEZlcnRyw6kgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0ibWFpbHRvOnlhbm5pY2suZmVydHJlQHN0LmNvbSI+Jmx0O3lhbm5pY2suZmVydHJlQHN0LmNv
bSZndDs8L2E+IA0KDQpCUg0KWWFubmljayBGZXJ0csOpPC9wcmU+DQo8YnI+DQo8YnI+DQo8ZGl2
IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDEvMTAvMjAgMTA6MjEgQU0sIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOjxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0i
bWlkOjIwMjAwMTEwMDkyMTI3LjI3ODQ3LTIwLXR6aW1tZXJtYW5uQHN1c2UuZGUiPg0KPHByZSBj
bGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5WQkxBTksgY2FsbGJhY2tzIGluIHN0cnVjdCBk
cm1fZHJpdmVyIGFyZSBkZXByZWNhdGVkIGluIGZhdm9yIG9mDQp0aGVpciBlcXVpdmFsZW50cyBp
biBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MuIENvbnZlcnQgc3RtIG92ZXIuDQoNClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhy
ZWY9Im1haWx0bzp0emltbWVybWFubkBzdXNlLmRlIj4mbHQ7dHppbW1lcm1hbm5Ac3VzZS5kZSZn
dDs8L2E+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jICB8IDEgLQ0KIGRyaXZlcnMv
Z3B1L2RybS9zdG0vbHRkYy5jIHwgMSAmIzQzOw0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oJiM0MzspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYw0KaW5kZXggNDg2OTg1NjA0MTA5
Li5lYTlmY2JkYzY4YjMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jDQom
IzQzOyYjNDM7JiM0MzsgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jDQpAQCAtNzIsNyAmIzQz
OzcyLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRydl9kcml2ZXIgPSB7DQogCS5nZW1f
cHJpbWVfdm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsDQogCS5nZW1fcHJpbWVfdnVubWFw
ID0gZHJtX2dlbV9jbWFfcHJpbWVfdnVubWFwLA0KIAkuZ2VtX3ByaW1lX21tYXAgPSBkcm1fZ2Vt
X2NtYV9wcmltZV9tbWFwLA0KLQkuZ2V0X3ZibGFua190aW1lc3RhbXAgPSBkcm1fY2FsY192Ymx0
aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zLA0KIH07DQogDQogc3RhdGljIGludCBkcnZfbG9hZChz
dHJ1Y3QgZHJtX2RldmljZSAqZGRldikNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQppbmRleCA4YjZkMWEyMjUyZTMu
LjRmZTliMDMzZGUxYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQom
IzQzOyYjNDM7JiM0MzsgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KQEAgLTcyMiw2ICYj
NDM7NzIyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyBsdGRjX2NydGNf
ZnVuY3MgPSB7DQogCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Ny
dGNfZGVzdHJveV9zdGF0ZSwNCiAJLmVuYWJsZV92YmxhbmsgPSBsdGRjX2NydGNfZW5hYmxlX3Zi
bGFuaywNCiAJLmRpc2FibGVfdmJsYW5rID0gbHRkY19jcnRjX2Rpc2FibGVfdmJsYW5rLA0KJiM0
MzsJLmdldF92YmxhbmtfdGltZXN0YW1wID0gZHJtX2NydGNfY2FsY192Ymx0aW1lc3RhbXBfZnJv
bV9zY2Fub3V0cG9zLA0KIAkuZ2FtbWFfc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfbGVnYWN5X2dh
bW1hX3NldCwNCiB9Ow0KIA0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQo8L2JvZHk+DQo8
L2h0bWw+DQo=

--_000_c274296237f20df563d5235b0e85ef7fstcom_--

--===============1659467176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1659467176==--

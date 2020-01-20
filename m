Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BE1142652
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF676E864;
	Mon, 20 Jan 2020 08:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9B66E5C8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 08:11:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00K87Ku6013010; Mon, 20 Jan 2020 09:11:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=W5ZIAUnsWsfFcqvySnIeAvxGCgNCyePoHk2zyVInFqg=;
 b=j6yw6w9I0h9Zv7j87xHA1fneV8BH+khC8d4c4JYHNvtyAYGXnxGZcZNiE0wtfIfDiXRl
 sQQJsDHVNjq7cj9uQ1056zLeL1hzWUr0S7YsMej/LNsks2f6otKbh6IwOBm9D5XL+VAd
 setBjnOIZOFtDgoZnDAypppM335JLgnIQcPmBx0B0pyY7sNyLmvT91JjUDnOuBrr0XuE
 kZoeTJ7MvS6hzJkPlIbRqfrsH+1mF50pbGhVqy8UxDHd6QhODLdg5czx+eBQhH0U/ILi
 Ifxolw8X5J4VYj1eHr/HVqvMGcQ+gYRHFlZbWRhZwsb4HKUWL/RTinnw6TvOPkhvYw4S SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkssnr2mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2020 09:11:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9F52100034;
 Mon, 20 Jan 2020 09:11:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A87421CA7E;
 Mon, 20 Jan 2020 09:11:02 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Jan
 2020 09:11:02 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 20 Jan 2020 09:11:01 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] drm: fix parameters documentation style
Thread-Topic: [PATCH v2] drm: fix parameters documentation style
Thread-Index: AQHVyvPofDa6XF50OUmec7ESqHJ+56fwIF8AgAMLQ4A=
Date: Mon, 20 Jan 2020 08:11:01 +0000
Message-ID: <372573cc-b0ae-72cb-f2c3-3f9310c3cf27@st.com>
References: <20200114160135.14990-1-benjamin.gaignard@st.com>
 <20200118094156.GB12245@ravnborg.org>
In-Reply-To: <20200118094156.GB12245@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <2E698A794AA66D4AA82A905734947894@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-19_08:2020-01-16,
 2020-01-19 signatures=0
X-Mailman-Approved-At: Mon, 20 Jan 2020 08:58:36 +0000
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxLzE4LzIwIDEwOjQxIEFNLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+IEhpIEJlbmphbWlu
DQo+DQo+IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDA1OjAxOjM1UE0gKzAxMDAsIEJlbmphbWlu
IEdhaWduYXJkIHdyb3RlOg0KPj4gUmVtb3ZlIG9sZCBkb2N1bWVudGF0aW9uIHN0eWxlIGFuZCB1
c2UgbmV3IG9uZSB0byBhdm9pZCB3YXJuaW5ncyB3aGVuDQo+PiBjb21waWxpbmcgd2l0aCBXPTEN
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25h
cmRAc3QuY29tPg0KPiBUaGFua3MgZm9yIHRoZSB3YXJuaW5nIGZpeGVzLg0KPiBUaGlzIGlzIGxl
Z2FjeSBzdHVmZiB0aGF0IGlzIG5vdCBldmVuIHdpcmVkIGludG8gdGhlIGtlcm5lbC1kb2Mgc3R1
ZmYuDQo+IEJ1dCB0aGF0IGlzIG5vIGV4Y3VzZSBmb3Igb2xkLXN0eWxlIGNvbW1lbnRzLg0KDQpU
aGVyZSBpcyBzdGlsbCBxdWl0ZSBhIGZldyBvZiB0aGVtIGluIG90aGVyIGRybSBmaWxlcyAoZHJt
X2NvbnRleHQuYyzCoCANCmRybV9idWZzLmMsIGRybV92bS5jLCBkcm1fbG9jay5jKQ0KDQpidXQg
SSBkb24ndCBrbm93IGhvdyB0byBmaXggdGhlbS4gWW91ciBhZHZpY2VzIGFyZSB3ZWxjb21lLg0K
DQpCZW5qYW1pbg0KDQo+DQo+IEFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4NCj4NCj4gCVNhbQ0K
Pg0KPj4gLS0tDQo+PiBDQzogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+
PiB2ZXJzaW9uIDI6DQo+PiAtIGZpeCByZXR1cm4gZG9jdW1lbnRhdGlvbg0KPj4NCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9kbWEuYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQ0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RtYS5jDQo+PiBpbmRleCBlNDViMDc4OTBjNWEuLmE3YWRkNTVhODViNCAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZG1hLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZG1hLmMNCj4+IEBAIC00MiwxMCArNDIsMTAgQEANCj4+ICAgI2luY2x1ZGUgImRybV9s
ZWdhY3kuaCINCj4+ICAgDQo+PiAgIC8qKg0KPj4gLSAqIEluaXRpYWxpemUgdGhlIERNQSBkYXRh
Lg0KPj4gKyAqIGRybV9sZWdhY3lfZG1hX3NldHVwKCkgLSBJbml0aWFsaXplIHRoZSBETUEgZGF0
YS4NCj4+ICAgICoNCj4+IC0gKiBccGFyYW0gZGV2IERSTSBkZXZpY2UuDQo+PiAtICogXHJldHVy
biB6ZXJvIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSB2YWx1ZSBvbiBmYWlsdXJlLg0KPj4gKyAq
IEBkZXY6IERSTSBkZXZpY2UuDQo+PiArICogUmV0dXJuOiB6ZXJvIG9uIHN1Y2Nlc3Mgb3IgYSBu
ZWdhdGl2ZSB2YWx1ZSBvbiBmYWlsdXJlLg0KPj4gICAgKg0KPj4gICAgKiBBbGxvY2F0ZSBhbmQg
aW5pdGlhbGl6ZSBhIGRybV9kZXZpY2VfZG1hIHN0cnVjdHVyZS4NCj4+ICAgICovDQo+PiBAQCAt
NzEsOSArNzEsOSBAQCBpbnQgZHJtX2xlZ2FjeV9kbWFfc2V0dXAoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikNCj4+ICAgfQ0KPj4gICANCj4+ICAgLyoqDQo+PiAtICogQ2xlYW51cCB0aGUgRE1BIHJl
c291cmNlcy4NCj4+ICsgKiBkcm1fbGVnYWN5X2RtYV90YWtlZG93bigpIC0gQ2xlYW51cCB0aGUg
RE1BIHJlc291cmNlcy4NCj4+ICAgICoNCj4+IC0gKiBccGFyYW0gZGV2IERSTSBkZXZpY2UuDQo+
PiArICogQGRldjogRFJNIGRldmljZS4NCj4+ICAgICoNCj4+ICAgICogRnJlZSBhbGwgcGFnZXMg
YXNzb2NpYXRlZCB3aXRoIERNQSBidWZmZXJzLCB0aGUgYnVmZmVycyBhbmQgcGFnZXMgbGlzdHMs
IGFuZA0KPj4gICAgKiBmaW5hbGx5IHRoZSBkcm1fZGV2aWNlOjpkbWEgc3RydWN0dXJlIGl0c2Vs
Zi4NCj4+IEBAIC0xMjAsMTAgKzEyMCwxMCBAQCB2b2lkIGRybV9sZWdhY3lfZG1hX3Rha2Vkb3du
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIH0NCj4+ICAgDQo+PiAgIC8qKg0KPj4gLSAq
IEZyZWUgYSBidWZmZXIuDQo+PiArICogZHJtX2xlZ2FjeV9mcmVlX2J1ZmZlcigpIC0gRnJlZSBh
IGJ1ZmZlci4NCj4+ICAgICoNCj4+IC0gKiBccGFyYW0gZGV2IERSTSBkZXZpY2UuDQo+PiAtICog
XHBhcmFtIGJ1ZiBidWZmZXIgdG8gZnJlZS4NCj4+ICsgKiBAZGV2OiBEUk0gZGV2aWNlLg0KPj4g
KyAqIEBidWY6IGJ1ZmZlciB0byBmcmVlLg0KPj4gICAgKg0KPj4gICAgKiBSZXNldHMgdGhlIGZp
ZWxkcyBvZiBccCBidWYuDQo+PiAgICAqLw0KPj4gQEAgLTEzOSw5ICsxMzksMTAgQEAgdm9pZCBk
cm1fbGVnYWN5X2ZyZWVfYnVmZmVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1f
YnVmICogYnVmKQ0KPj4gICB9DQo+PiAgIA0KPj4gICAvKioNCj4+IC0gKiBSZWNsYWltIHRoZSBi
dWZmZXJzLg0KPj4gKyAqIGRybV9sZWdhY3lfcmVjbGFpbV9idWZmZXJzKCkgLSBSZWNsYWltIHRo
ZSBidWZmZXJzLg0KPj4gICAgKg0KPj4gLSAqIFxwYXJhbSBmaWxlX3ByaXYgRFJNIGZpbGUgcHJp
dmF0ZS4NCj4+ICsgKiBAZGV2OiBEUk0gZGV2aWNlLg0KPj4gKyAqIEBmaWxlX3ByaXY6IERSTSBm
aWxlIHByaXZhdGUuDQo+PiAgICAqDQo+PiAgICAqIEZyZWVzIGVhY2ggYnVmZmVyIGFzc29jaWF0
ZWQgd2l0aCBccCBmaWxlX3ByaXYgbm90IGFscmVhZHkgb24gdGhlIGhhcmR3YXJlLg0KPj4gICAg
Ki8NCj4+IC0tIA0KPj4gMi4xNS4wDQo+Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=

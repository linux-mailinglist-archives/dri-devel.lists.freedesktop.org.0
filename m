Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DFB113C88
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FEA6F59A;
	Thu,  5 Dec 2019 07:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A5672D8E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 10:07:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4A2uX8011913; Wed, 4 Dec 2019 11:07:46 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkg6kmc1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 11:07:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C9D84100034;
 Wed,  4 Dec 2019 11:07:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AB592AC0B4;
 Wed,  4 Dec 2019 11:07:44 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Dec
 2019 11:07:44 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 4 Dec 2019 11:07:44 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "sean@poorly.run"
 <sean@poorly.run>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/modes: remove unused variables
Thread-Topic: [PATCH] drm/modes: remove unused variables
Thread-Index: AQHVnt/VSP/oKiq2AUetqzXw/N41gKepveoAgAAI6IA=
Date: Wed, 4 Dec 2019 10:07:44 +0000
Message-ID: <f210413f-2d2f-9887-ca3b-a3c48564d9d6@st.com>
References: <20191119134706.10893-1-benjamin.gaignard@st.com>
 <8056f838-3ebf-26db-f5be-3e78d61aa512@suse.de>
In-Reply-To: <8056f838-3ebf-26db-f5be-3e78d61aa512@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <74BF3CA761102347A7D3B2745BDA20A5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Mailman-Approved-At: Thu, 05 Dec 2019 07:44:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=mooPwyMKqKXw7FbErPboyCzEEJ1X0+5Wq2Zf6DUE08s=;
 b=KIr6acxC6AcslemFW8emuwRshHmh4t2WVbRrwpJLMEW06n6Co15WVdSq6XChVGnSBUG5
 z87/41g7CB6IeGPgn7cjlOslmX2y83Q/yfMRX6frOWALWLKsgYIuImdp6AE3QhkygBz0
 bzEKWdbLnxRZvX3WjCMWagpStEE96+pi3og3YfhL/2h62jFEJVE6P3BTPtQip0a8FlXd
 K40sqMAKdqDrBYNRZzJApgDrUOha2+Bk7qdcczXsiMmbxfU71I/f1RkduOmBF/y9dgGK
 S8Vjr3+UXt0D5EyWwL/+Cc103rSS1wZv73q+r4meHyrZihwdMhD1yaDtQGGrQAZTo01J /Q== 
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

DQpPbiAxMi80LzE5IDEwOjM1IEFNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gSGkNCj4N
Cj4gQW0gMTkuMTEuMTkgdW0gMTQ6NDcgc2NocmllYiBCZW5qYW1pbiBHYWlnbmFyZDoNCj4+IFdo
ZW4gY29tcGlsaW5nIHdpdGggVz0xIGZldyB3YXJuaW5ncyBhYm91dCB1bnVzZWQgdmFyaWFibGVz
IHNob3cgdXAuDQo+PiBUaGlzIHBhdGNoIHJlbW92ZXMgYWxsIHRoZSBpbnZvbHZlZCB2YXJpYWJs
ZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdh
aWduYXJkQHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMg
fCAyMiArKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMNCj4+IGluZGV4
IDg4MjMyNjk4ZDdhMC4uYWNhOTAxYWZmMDQyIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2Rlcy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMNCj4+
IEBAIC0yMzMsNyArMjMzLDcgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9jdnRfbW9k
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgaGRpc3BsYXksDQo+PiAgIAkJLyogMykgTm9t
aW5hbCBIU3luYyB3aWR0aCAoJSBvZiBsaW5lIHBlcmlvZCkgLSBkZWZhdWx0IDggKi8NCj4+ICAg
I2RlZmluZSBDVlRfSFNZTkNfUEVSQ0VOVEFHRQk4DQo+PiAgIAkJdW5zaWduZWQgaW50IGhibGFu
a19wZXJjZW50YWdlOw0KPj4gLQkJaW50IHZzeW5jYW5kYmFja19wb3JjaCwgdmJhY2tfcG9yY2gs
IGhibGFuazsNCj4+ICsJCWludCB2c3luY2FuZGJhY2tfcG9yY2gsIGhibGFuazsNCj4+ICAgDQo+
PiAgIAkJLyogZXN0aW1hdGVkIHRoZSBob3Jpem9udGFsIHBlcmlvZCAqLw0KPj4gICAJCXRtcDEg
PSBIVl9GQUNUT1IgKiAxMDAwMDAwICAtDQo+PiBAQCAtMjQ5LDcgKzI0OSw2IEBAIHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICpkcm1fY3Z0X21vZGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50
IGhkaXNwbGF5LA0KPj4gICAJCWVsc2UNCj4+ICAgCQkJdnN5bmNhbmRiYWNrX3BvcmNoID0gdG1w
MTsNCj4+ICAgCQkvKiAxMC4gRmluZCBudW1iZXIgb2YgbGluZXMgaW4gYmFjayBwb3JjaCAqLw0K
Pj4gLQkJdmJhY2tfcG9yY2ggPSB2c3luY2FuZGJhY2tfcG9yY2ggLSB2c3luYzsNCj4+ICAgCQlk
cm1fbW9kZS0+dnRvdGFsID0gdmRpc3BsYXlfcm5kICsgMiAqIHZtYXJnaW4gKw0KPj4gICAJCQkJ
dnN5bmNhbmRiYWNrX3BvcmNoICsgQ1ZUX01JTl9WX1BPUkNIOw0KPj4gICAJCS8qIDUpIERlZmlu
aXRpb24gb2YgSG9yaXpvbnRhbCBibGFua2luZyB0aW1lIGxpbWl0YXRpb24gKi8NCj4+IEBAIC0z
ODYsOSArMzg1LDggQEAgZHJtX2d0Zl9tb2RlX2NvbXBsZXgoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgaW50IGhkaXNwbGF5LCBpbnQgdmRpc3BsYXksDQo+PiAgIAlpbnQgdG9wX21hcmdpbiwgYm90
dG9tX21hcmdpbjsNCj4+ICAgCWludCBpbnRlcmxhY2U7DQo+PiAgIAl1bnNpZ25lZCBpbnQgaGZy
ZXFfZXN0Ow0KPj4gLQlpbnQgdnN5bmNfcGx1c19icCwgdmJhY2tfcG9yY2g7DQo+PiAtCXVuc2ln
bmVkIGludCB2dG90YWxfbGluZXMsIHZmaWVsZHJhdGVfZXN0LCBocGVyaW9kOw0KPj4gLQl1bnNp
Z25lZCBpbnQgdmZpZWxkX3JhdGUsIHZmcmFtZV9yYXRlOw0KPj4gKwlpbnQgdnN5bmNfcGx1c19i
cDsNCj4+ICsJdW5zaWduZWQgaW50IHZ0b3RhbF9saW5lczsNCj4+ICAgCWludCBsZWZ0X21hcmdp
biwgcmlnaHRfbWFyZ2luOw0KPj4gICAJdW5zaWduZWQgaW50IHRvdGFsX2FjdGl2ZV9waXhlbHMs
IGlkZWFsX2R1dHlfY3ljbGU7DQo+PiAgIAl1bnNpZ25lZCBpbnQgaGJsYW5rLCB0b3RhbF9waXhl
bHMsIHBpeGVsX2ZyZXE7DQo+PiBAQCAtNDUxLDIzICs0NDksOSBAQCBkcm1fZ3RmX21vZGVfY29t
cGxleChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgaGRpc3BsYXksIGludCB2ZGlzcGxheSwN
Cj4+ICAgCS8qIFtWIFNZTkMrQlBdID0gUklOVCgoW01JTiBWU1lOQytCUF0gKiBoZnJlcV9lc3Qg
LyAxMDAwMDAwKSkgKi8NCj4+ICAgCXZzeW5jX3BsdXNfYnAgPSBNSU5fVlNZTkNfUExVU19CUCAq
IGhmcmVxX2VzdCAvIDEwMDA7DQo+PiAgIAl2c3luY19wbHVzX2JwID0gKHZzeW5jX3BsdXNfYnAg
KyA1MDApIC8gMTAwMDsNCj4+IC0JLyogIDkuIEZpbmQgdGhlIG51bWJlciBvZiBsaW5lcyBpbiBW
IGJhY2sgcG9yY2ggYWxvbmU6ICovDQo+PiAtCXZiYWNrX3BvcmNoID0gdnN5bmNfcGx1c19icCAt
IFZfU1lOQ19SUUQ7DQo+PiAgIAkvKiAgMTAuIEZpbmQgdGhlIHRvdGFsIG51bWJlciBvZiBsaW5l
cyBpbiBWZXJ0aWNhbCBmaWVsZCBwZXJpb2Q6ICovDQo+PiAgIAl2dG90YWxfbGluZXMgPSB2ZGlz
cGxheV9ybmQgKyB0b3BfbWFyZ2luICsgYm90dG9tX21hcmdpbiArDQo+PiAgIAkJCXZzeW5jX3Bs
dXNfYnAgKyBHVEZfTUlOX1ZfUE9SQ0g7DQo+PiAtCS8qICAxMS4gRXN0aW1hdGUgdGhlIFZlcnRp
Y2FsIGZpZWxkIGZyZXF1ZW5jeTogKi8NCj4+IC0JdmZpZWxkcmF0ZV9lc3QgPSBoZnJlcV9lc3Qg
LyB2dG90YWxfbGluZXM7DQo+PiAtCS8qICAxMi4gRmluZCB0aGUgYWN0dWFsIGhvcml6b250YWwg
cGVyaW9kOiAqLw0KPj4gLQlocGVyaW9kID0gMTAwMDAwMCAvICh2ZmllbGRyYXRlX3JxZCAqIHZ0
b3RhbF9saW5lcyk7DQo+PiAtDQo+PiAtCS8qICAxMy4gRmluZCB0aGUgYWN0dWFsIFZlcnRpY2Fs
IGZpZWxkIGZyZXF1ZW5jeTogKi8NCj4+IC0JdmZpZWxkX3JhdGUgPSBoZnJlcV9lc3QgLyB2dG90
YWxfbGluZXM7DQo+PiAtCS8qICAxNC4gRmluZCB0aGUgVmVydGljYWwgZnJhbWUgZnJlcXVlbmN5
OiAqLw0KPj4gLQlpZiAoaW50ZXJsYWNlZCkNCj4+IC0JCXZmcmFtZV9yYXRlID0gdmZpZWxkX3Jh
dGUgLyAyOw0KPj4gLQllbHNlDQo+PiAtCQl2ZnJhbWVfcmF0ZSA9IHZmaWVsZF9yYXRlOw0KPiBU
aGUgYW1vdW50IG9mIHVudXNlZCBjb2RlIGlzIHF1aXRlIGxhcmdlLCB3aGljaCBtYWtlcyBtZSB3
b25kZXIgaWYNCj4gdGhlcmUncyBzb21ldGhpbmcgbWlzc2luZyBiZWxvdyB3aGVyZSB0aGVzZSB2
YXJpYWJsZXMgYXJlIHN1cHBvc2VkIHRvIGJlDQo+IHVzZWQuDQo+DQo+IElmIHRoZXNlIHZhcmlh
YmxlcyBjYW4gYmUgcmVtb3ZlZCwgY29tbWVudHMgc2hvdWxkIG1lbnRpb24gdGhhdCBzdGVwcyA5
DQo+IGFuZCAxMSB0byAxNCBhcmUgYmVpbmcgbGVmdCBvdXQuIEFmdGVyIGFsbCwgdGhlIGZ1bmN0
aW9uIGlzIGZhaXJseQ0KPiBleHBsaWNpdCBhYm91dCBpbXBsZW1lbnRpbmcgdGhlIEdURiBhbGdv
cml0aG0gc3RlcCBieSBzdGVwLg0KPg0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQoNCklmIHRo
ZSBnb2FsIGlzIHRvIGtlZXAgYWxsIHRoZSBzdGVwcyB0aGVuIEkgY291bGQgcHJlZml4IGFsbCBw
cm9ibGVtYXRpYyANCnZhcmlhYmxlcyB3aXRoIF9fbWF5YmVfdW51c2VkIG1hY3JvLg0KDQpCZW5q
YW1pbg0KDQo+DQo+PiAgIAkvKiAgMTUuIEZpbmQgbnVtYmVyIG9mIHBpeGVscyBpbiBsZWZ0IG1h
cmdpbjogKi8NCj4+ICAgCWlmIChtYXJnaW5zKQ0KPj4gICAJCWxlZnRfbWFyZ2luID0gKGhkaXNw
bGF5X3JuZCAqIEdURl9NQVJHSU5fUEVSQ0VOVEFHRSArIDUwMCkgLw0KPj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

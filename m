Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47166114D64
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA65489E33;
	Fri,  6 Dec 2019 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079C76F879
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:24:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5AHC2D030733; Thu, 5 Dec 2019 11:23:55 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkf2y25f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 11:23:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB6CE10002A;
 Thu,  5 Dec 2019 11:23:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACFD52B85DB;
 Thu,  5 Dec 2019 11:23:52 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Dec
 2019 11:23:52 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 5 Dec 2019 11:23:52 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "sean@poorly.run" <sean@poorly.run>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "yakui.zhao@intel.com" <yakui.zhao@intel.com>
Subject: Re: [PATCH] drm/modes: remove unused variables
Thread-Topic: [PATCH] drm/modes: remove unused variables
Thread-Index: AQHVnt/VSP/oKiq2AUetqzXw/N41gKepveoAgAAI6ICAAY8BAIAAB9aA
Date: Thu, 5 Dec 2019 10:23:51 +0000
Message-ID: <f3a86fe8-6bf8-6767-2ec5-d6fecd81231f@st.com>
References: <20191119134706.10893-1-benjamin.gaignard@st.com>
 <8056f838-3ebf-26db-f5be-3e78d61aa512@suse.de>
 <f210413f-2d2f-9887-ca3b-a3c48564d9d6@st.com> <87tv6fgkpn.fsf@intel.com>
In-Reply-To: <87tv6fgkpn.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <308C22EC813B4843BE2B56928F6C15BB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_02:2019-12-04,2019-12-05 signatures=0
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bYJoKqSpjYlvlrkfQCWNl7XM5Zz+YVY0F66tUt9Lv5M=;
 b=Evrq0hv+4EXFBTUY63KjEO9dgcCc8GftpyzGI6h4ZoHwWct3vXnx+L/Awrt+RVB3XpiT
 TDhXFK5Bg5jdnMhoMCYyg4nV4MNIhfj3bL7eypE918AC34fLusy4I/vz//mq6N6R4Tor
 hGR2+zK3RvxKz6khhydUa6hfD6SSNspJufH4MBI556zsnbCkhB0DmKSfNdHhJWhG9SMm
 gvII4gzP8TebM1t5XVgxI+0PLtsbDmp0GNdIcusAjwrwApM4SlwBuo58uJLBImx/ucC3
 nC7lHpkGoYGzdNkYjYzZhpmpegv+5lA66WLHEwvkFOLpFlk7j9AA12Ny3U2TevCKapNE Zw== 
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

KyBaaGFvIFlha3VpDQoNCk9uIDEyLzUvMTkgMTA6NTUgQU0sIEphbmkgTmlrdWxhIHdyb3RlOg0K
PiBPbiBXZWQsIDA0IERlYyAyMDE5LCBCZW5qYW1pbiBHQUlHTkFSRCA8YmVuamFtaW4uZ2FpZ25h
cmRAc3QuY29tPiB3cm90ZToNCj4+IE9uIDEyLzQvMTkgMTA6MzUgQU0sIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOg0KPj4+IEhpDQo+Pj4NCj4+PiBBbSAxOS4xMS4xOSB1bSAxNDo0NyBzY2hyaWVi
IEJlbmphbWluIEdhaWduYXJkOg0KPj4+PiBXaGVuIGNvbXBpbGluZyB3aXRoIFc9MSBmZXcgd2Fy
bmluZ3MgYWJvdXQgdW51c2VkIHZhcmlhYmxlcyBzaG93IHVwLg0KPj4+PiBUaGlzIHBhdGNoIHJl
bW92ZXMgYWxsIHRoZSBpbnZvbHZlZCB2YXJpYWJsZXMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQo+Pj4+IC0t
LQ0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAyMiArKystLS0tLS0tLS0t
LS0tLS0tLS0tDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jDQo+Pj4+IGluZGV4IDg4MjMyNjk4
ZDdhMC4uYWNhOTAxYWZmMDQyIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jDQo+Pj4+IEBA
IC0yMzMsNyArMjMzLDcgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9jdnRfbW9kZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgaGRpc3BsYXksDQo+Pj4+ICAgIAkJLyogMykgTm9t
aW5hbCBIU3luYyB3aWR0aCAoJSBvZiBsaW5lIHBlcmlvZCkgLSBkZWZhdWx0IDggKi8NCj4+Pj4g
ICAgI2RlZmluZSBDVlRfSFNZTkNfUEVSQ0VOVEFHRQk4DQo+Pj4+ICAgIAkJdW5zaWduZWQgaW50
IGhibGFua19wZXJjZW50YWdlOw0KPj4+PiAtCQlpbnQgdnN5bmNhbmRiYWNrX3BvcmNoLCB2YmFj
a19wb3JjaCwgaGJsYW5rOw0KPj4+PiArCQlpbnQgdnN5bmNhbmRiYWNrX3BvcmNoLCBoYmxhbms7
DQo+Pj4+ICAgIA0KPj4+PiAgICAJCS8qIGVzdGltYXRlZCB0aGUgaG9yaXpvbnRhbCBwZXJpb2Qg
Ki8NCj4+Pj4gICAgCQl0bXAxID0gSFZfRkFDVE9SICogMTAwMDAwMCAgLQ0KPj4+PiBAQCAtMjQ5
LDcgKzI0OSw2IEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1fY3Z0X21vZGUoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgaW50IGhkaXNwbGF5LA0KPj4+PiAgICAJCWVsc2UNCj4+Pj4gICAg
CQkJdnN5bmNhbmRiYWNrX3BvcmNoID0gdG1wMTsNCj4+Pj4gICAgCQkvKiAxMC4gRmluZCBudW1i
ZXIgb2YgbGluZXMgaW4gYmFjayBwb3JjaCAqLw0KPj4+PiAtCQl2YmFja19wb3JjaCA9IHZzeW5j
YW5kYmFja19wb3JjaCAtIHZzeW5jOw0KPj4+PiAgICAJCWRybV9tb2RlLT52dG90YWwgPSB2ZGlz
cGxheV9ybmQgKyAyICogdm1hcmdpbiArDQo+Pj4+ICAgIAkJCQl2c3luY2FuZGJhY2tfcG9yY2gg
KyBDVlRfTUlOX1ZfUE9SQ0g7DQo+Pj4+ICAgIAkJLyogNSkgRGVmaW5pdGlvbiBvZiBIb3Jpem9u
dGFsIGJsYW5raW5nIHRpbWUgbGltaXRhdGlvbiAqLw0KPj4+PiBAQCAtMzg2LDkgKzM4NSw4IEBA
IGRybV9ndGZfbW9kZV9jb21wbGV4KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGludCBoZGlzcGxh
eSwgaW50IHZkaXNwbGF5LA0KPj4+PiAgICAJaW50IHRvcF9tYXJnaW4sIGJvdHRvbV9tYXJnaW47
DQo+Pj4+ICAgIAlpbnQgaW50ZXJsYWNlOw0KPj4+PiAgICAJdW5zaWduZWQgaW50IGhmcmVxX2Vz
dDsNCj4+Pj4gLQlpbnQgdnN5bmNfcGx1c19icCwgdmJhY2tfcG9yY2g7DQo+Pj4+IC0JdW5zaWdu
ZWQgaW50IHZ0b3RhbF9saW5lcywgdmZpZWxkcmF0ZV9lc3QsIGhwZXJpb2Q7DQo+Pj4+IC0JdW5z
aWduZWQgaW50IHZmaWVsZF9yYXRlLCB2ZnJhbWVfcmF0ZTsNCj4+Pj4gKwlpbnQgdnN5bmNfcGx1
c19icDsNCj4+Pj4gKwl1bnNpZ25lZCBpbnQgdnRvdGFsX2xpbmVzOw0KPj4+PiAgICAJaW50IGxl
ZnRfbWFyZ2luLCByaWdodF9tYXJnaW47DQo+Pj4+ICAgIAl1bnNpZ25lZCBpbnQgdG90YWxfYWN0
aXZlX3BpeGVscywgaWRlYWxfZHV0eV9jeWNsZTsNCj4+Pj4gICAgCXVuc2lnbmVkIGludCBoYmxh
bmssIHRvdGFsX3BpeGVscywgcGl4ZWxfZnJlcTsNCj4+Pj4gQEAgLTQ1MSwyMyArNDQ5LDkgQEAg
ZHJtX2d0Zl9tb2RlX2NvbXBsZXgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGhkaXNwbGF5
LCBpbnQgdmRpc3BsYXksDQo+Pj4+ICAgIAkvKiBbViBTWU5DK0JQXSA9IFJJTlQoKFtNSU4gVlNZ
TkMrQlBdICogaGZyZXFfZXN0IC8gMTAwMDAwMCkpICovDQo+Pj4+ICAgIAl2c3luY19wbHVzX2Jw
ID0gTUlOX1ZTWU5DX1BMVVNfQlAgKiBoZnJlcV9lc3QgLyAxMDAwOw0KPj4+PiAgICAJdnN5bmNf
cGx1c19icCA9ICh2c3luY19wbHVzX2JwICsgNTAwKSAvIDEwMDA7DQo+Pj4+IC0JLyogIDkuIEZp
bmQgdGhlIG51bWJlciBvZiBsaW5lcyBpbiBWIGJhY2sgcG9yY2ggYWxvbmU6ICovDQo+Pj4+IC0J
dmJhY2tfcG9yY2ggPSB2c3luY19wbHVzX2JwIC0gVl9TWU5DX1JRRDsNCj4+Pj4gICAgCS8qICAx
MC4gRmluZCB0aGUgdG90YWwgbnVtYmVyIG9mIGxpbmVzIGluIFZlcnRpY2FsIGZpZWxkIHBlcmlv
ZDogKi8NCj4+Pj4gICAgCXZ0b3RhbF9saW5lcyA9IHZkaXNwbGF5X3JuZCArIHRvcF9tYXJnaW4g
KyBib3R0b21fbWFyZ2luICsNCj4+Pj4gICAgCQkJdnN5bmNfcGx1c19icCArIEdURl9NSU5fVl9Q
T1JDSDsNCj4+Pj4gLQkvKiAgMTEuIEVzdGltYXRlIHRoZSBWZXJ0aWNhbCBmaWVsZCBmcmVxdWVu
Y3k6ICovDQo+Pj4+IC0JdmZpZWxkcmF0ZV9lc3QgPSBoZnJlcV9lc3QgLyB2dG90YWxfbGluZXM7
DQo+Pj4+IC0JLyogIDEyLiBGaW5kIHRoZSBhY3R1YWwgaG9yaXpvbnRhbCBwZXJpb2Q6ICovDQo+
Pj4+IC0JaHBlcmlvZCA9IDEwMDAwMDAgLyAodmZpZWxkcmF0ZV9ycWQgKiB2dG90YWxfbGluZXMp
Ow0KPj4+PiAtDQo+Pj4+IC0JLyogIDEzLiBGaW5kIHRoZSBhY3R1YWwgVmVydGljYWwgZmllbGQg
ZnJlcXVlbmN5OiAqLw0KPj4+PiAtCXZmaWVsZF9yYXRlID0gaGZyZXFfZXN0IC8gdnRvdGFsX2xp
bmVzOw0KPj4+PiAtCS8qICAxNC4gRmluZCB0aGUgVmVydGljYWwgZnJhbWUgZnJlcXVlbmN5OiAq
Lw0KPj4+PiAtCWlmIChpbnRlcmxhY2VkKQ0KPj4+PiAtCQl2ZnJhbWVfcmF0ZSA9IHZmaWVsZF9y
YXRlIC8gMjsNCj4+Pj4gLQllbHNlDQo+Pj4+IC0JCXZmcmFtZV9yYXRlID0gdmZpZWxkX3JhdGU7
DQo+Pj4gVGhlIGFtb3VudCBvZiB1bnVzZWQgY29kZSBpcyBxdWl0ZSBsYXJnZSwgd2hpY2ggbWFr
ZXMgbWUgd29uZGVyIGlmDQo+Pj4gdGhlcmUncyBzb21ldGhpbmcgbWlzc2luZyBiZWxvdyB3aGVy
ZSB0aGVzZSB2YXJpYWJsZXMgYXJlIHN1cHBvc2VkIHRvIGJlDQo+Pj4gdXNlZC4NCj4+Pg0KPj4+
IElmIHRoZXNlIHZhcmlhYmxlcyBjYW4gYmUgcmVtb3ZlZCwgY29tbWVudHMgc2hvdWxkIG1lbnRp
b24gdGhhdCBzdGVwcyA5DQo+Pj4gYW5kIDExIHRvIDE0IGFyZSBiZWluZyBsZWZ0IG91dC4gQWZ0
ZXIgYWxsLCB0aGUgZnVuY3Rpb24gaXMgZmFpcmx5DQo+Pj4gZXhwbGljaXQgYWJvdXQgaW1wbGVt
ZW50aW5nIHRoZSBHVEYgYWxnb3JpdGhtIHN0ZXAgYnkgc3RlcC4NCj4+Pg0KPj4+IEJlc3QgcmVn
YXJkcw0KPj4+IFRob21hcw0KPj4gSWYgdGhlIGdvYWwgaXMgdG8ga2VlcCBhbGwgdGhlIHN0ZXBz
IHRoZW4gSSBjb3VsZCBwcmVmaXggYWxsIHByb2JsZW1hdGljDQo+PiB2YXJpYWJsZXMgd2l0aCBf
X21heWJlX3VudXNlZCBtYWNyby4NCj4gVGhlIGVmZmVjdCBpcyB0aGUgc2FtZTsgaXQgaGlkZXMg
YSBwb3RlbnRpYWwgYnVnIHRoYXQgc2hvdWxkIGJlIGFuYWx5emVkDQo+IGFuZCBmaXhlZC4gSWYg
eW91IGhhdmUgdGhlIHRpbWUsIHBsZWFzZSBsb29rIGF0IHRoZSBjb2RlIGFuZCBmaWd1cmUgb3V0
DQo+IHdoYXQgaXQncyBzdXBwb3NlZCB0byBkbywgYW5kIHdoeSBpc24ndCBpdCB1c2luZyB0aGUg
aW5mb3JtYXRpb24uIExvb2sNCj4gYXQgZ2l0IGJsYW1lIGFuZCBsb2csIHdhcyBpdCBhbHdheXMg
c28sIG9yIGRpZCBzb21ldGhpbmcgY2hhbmdlPw0KPg0KPiBUaGUgd2FybmluZ3MgYXJlIGFib3V0
IHBvdGVudGlhbCBidWdzLiBUaGUgb2JqZWN0aXZlIG9yIGVuZCBnb2FsIGlzIHRvDQo+IGZpeCB0
aGUgYnVncywgbm90IHRvIHNpbGVuY2UgdGhlIHdhcm5pbmdzLg0KVGhpcyBjb2RlIGhhdmVuJ3Qg
Y2hhbmdlIHNpbmNlIGl0IGhhcyBiZWVuIGFkZGVkIGJ5IGNvbW1pdDoNCjI2YmJkYWRhZDM1NmUg
KCJkcm0vbW9kZTogYWRkIHRoZSBHVEYgYWxnb3JpdGhtIGluIGtlcm5lbCBzcGFjZSIpDQpUaGUg
dmFyaWFibGVzIHRoYXQgSSdtIHJlbW92aW5nIGFyZSBub3QgdXNlZCBhbnl3aGVyZSBlbHNlLg0K
VGhlIGFsZ29yaXRobSBpcyBjb3B5IGZyb20geHNlcnZlci9ody94ZnJlZTg2L21vZGVzL3hmODZn
dGYuYyB3aGVyZQ0KdmZyYW1lX3JhdGUgYW5kIHZfYmFja19wb3JjaCBhcmUgdXNlZCB3aXRoICh2
b2lkKSBjYWxsczoNCih2b2lkKSB2X2JhY2tfcG9yY2g7DQoodm9pZCkgdl9mcmFtZV9yYXRlOw0K
SXQgaXMgYW5vdGhlciB3YXkgYXZvaWQgdGhlIHdhcm5pbmdzLg0KTm90ZSB0aGF0IGlmIHlvdSBz
dGFydCByZW1vdmluZyB2X2ZyYW1lX3JhdGUgdGhlbiB2ZmllbGRfcmF0ZSBiZWNvbWVzIA0KdW51
c2VkLCBldGMuLi4NCg0KQmVuamFtaW4NCg0KPg0KPiBCUiwNCj4gSmFuaS4NCj4NCj4NCj4+IEJl
bmphbWluDQo+Pg0KPj4+PiAgICAJLyogIDE1LiBGaW5kIG51bWJlciBvZiBwaXhlbHMgaW4gbGVm
dCBtYXJnaW46ICovDQo+Pj4+ICAgIAlpZiAobWFyZ2lucykNCj4+Pj4gICAgCQlsZWZ0X21hcmdp
biA9IChoZGlzcGxheV9ybmQgKiBHVEZfTUFSR0lOX1BFUkNFTlRBR0UgKyA1MDApIC8NCj4+Pj4N
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

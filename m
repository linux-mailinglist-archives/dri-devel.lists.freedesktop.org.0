Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5406AB6417
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F25A10E234;
	Wed, 14 May 2025 07:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 942 seconds by postgrey-1.36 at gabe;
 Tue, 13 May 2025 12:43:34 UTC
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE2D10E1E6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 12:43:34 +0000 (UTC)
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZxbKg450kzYlqTV;
 Tue, 13 May 2025 20:25:43 +0800 (CST)
Received: from a003.hihonor.com (10.68.18.8) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 20:27:31 +0800
Received: from a010.hihonor.com (10.68.16.52) by a003.hihonor.com (10.68.18.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 20:27:31 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Tue, 13 May 2025 20:27:31 +0800
From: wangtao <tao.wangtao@honor.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "jstultz@google.com"
 <jstultz@google.com>, "tjmercier@google.com" <tjmercier@google.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>, yipengxiang
 <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>, "hanfeng
 00012985" <feng.han@honor.com>
Subject: RE: [PATCH 1/2] dmabuf: add DMA_BUF_IOCTL_RW_FILE
Thread-Topic: [PATCH 1/2] dmabuf: add DMA_BUF_IOCTL_RW_FILE
Thread-Index: AQHbw+qAM8Fnhu6qq06hsP+5NR7CSrPP5xYAgACTT/A=
Date: Tue, 13 May 2025 12:27:31 +0000
Message-ID: <5ca2b6f4912946e7a7415dd35679704c@honor.com>
References: <20250513092735.1931-1-tao.wangtao@honor.com>
 <d77ed1c0-3f66-447a-956f-37e1dd543ca3@amd.com>
In-Reply-To: <d77ed1c0-3f66-447a-956f-37e1dd543ca3@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.163.18.240]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 May 2025 07:23:32 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTMsIDIw
MjUgNzozMSBQTQ0KPiBUbzogd2FuZ3RhbyA8dGFvLndhbmd0YW9AaG9ub3IuY29tPjsgc3VtaXQu
c2Vtd2FsQGxpbmFyby5vcmc7DQo+IGJlbmphbWluLmdhaWduYXJkQGNvbGxhYm9yYS5jb207IEJy
aWFuLlN0YXJrZXlAYXJtLmNvbTsNCj4ganN0dWx0ekBnb29nbGUuY29tOyB0am1lcmNpZXJAZ29v
Z2xlLmNvbQ0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBsaW5hcm8tDQo+IG1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiB3YW5nYmludGlhbihCaW50aWFuV2FuZykg
PGJpbnRpYW4ud2FuZ0Bob25vci5jb20+OyB5aXBlbmd4aWFuZw0KPiA8eWlwZW5neGlhbmdAaG9u
b3IuY29tPjsgbGl1bHUgMDAwMTMxNjcgPGxpdWx1LmxpdUBob25vci5jb20+OyBoYW5mZW5nDQo+
IDAwMDEyOTg1IDxmZW5nLmhhbkBob25vci5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8y
XSBkbWFidWY6IGFkZCBETUFfQlVGX0lPQ1RMX1JXX0ZJTEUNCj4gDQo+IE9uIDUvMTMvMjUgMTE6
MjcsIHdhbmd0YW8gd3JvdGU6DQo+ID4gQWRkIERNQV9CVUZfSU9DVExfUldfRklMRSB0byBzYXZl
L3Jlc3RvcmUgZGF0YSBmcm9tL3RvIGEgZG1hLWJ1Zi4NCj4gDQo+IFNpbWlsYXIgYXBwcm9hY2gg
d2hlcmUgcmVqZWN0ZWQgYmVmb3JlIGluIGZhdm9yIG9mIHVzaW5nIHVkbWFidWYuDQo+IA0KPiBJ
cyB0aGVyZSBhbnkgcmVhc29uIHlvdSBjYW4ndCB1c2UgdGhhdCBhcHByb2FjaCBhcyB3ZWxsPw0K
W3dhbmd0YW9dIEZvciBwZXJmb3JtYW5jZSBvcHRpbWl6YXRpb24sIHdlIGNhbiBhY2hpZXZlcyAz
Nzc2IE1CL3MgKFVGUyA0LjAgZGV2aWNlIEAgNEdCL3MpLg0KQXBvbG9naWVzLCBteSB0aHJlZSBw
cmV2aW91cyBlbWFpbHMgd2VyZSBub3QgY29uc29saWRhdGVkIGludG8gdGhlIHNhbWUgdGhyZWFk
Lg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IHdhbmd0YW8gPHRhby53YW5ndGFvQGhvbm9yLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYyAgICB8ICA4ICsrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgv
ZG1hLWJ1Zi5oICAgICAgfCAgMyArKysNCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L2RtYS1idWYu
aCB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgNDAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+ID4gaW5kZXggNWJhYTgz
Yjg1NTE1Li45NWQ4YjAxNThmZmQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj4gPiBAQCAtNDYw
LDYgKzQ2MCw3IEBAIHN0YXRpYyBsb25nIGRtYV9idWZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUs
DQo+ID4gIAlzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmOw0KPiA+ICAJc3RydWN0IGRtYV9idWZfc3lu
YyBzeW5jOw0KPiA+ICAJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uOw0KPiA+ICsJ
c3RydWN0IGRtYV9idWZfcndfZmlsZSBrZmlsZTsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAg
CWRtYWJ1ZiA9IGZpbGUtPnByaXZhdGVfZGF0YTsNCj4gPiBAQCAtNTA0LDYgKzUwNSwxMyBAQCBz
dGF0aWMgbG9uZyBkbWFfYnVmX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLA0KPiA+ICAJCXJldHVy
biBkbWFfYnVmX2ltcG9ydF9zeW5jX2ZpbGUoZG1hYnVmLCAoY29uc3Qgdm9pZA0KPiBfX3VzZXIg
KilhcmcpOw0KPiA+ICNlbmRpZg0KPiA+DQo+ID4gKwljYXNlIERNQV9CVUZfSU9DVExfUldfRklM
RToNCj4gPiArCQlpZiAoY29weV9mcm9tX3VzZXIoJmtmaWxlLCAodm9pZCBfX3VzZXIgKikgYXJn
LCBzaXplb2Yoa2ZpbGUpKSkNCj4gPiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ID4gKwkJaWYgKCFk
bWFidWYtPm9wcy0+cndfZmlsZSkNCj4gPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwkJcmV0
dXJuIGRtYWJ1Zi0+b3BzLT5yd19maWxlKGRtYWJ1ZiwgJmtmaWxlKTsNCj4gPiArDQo+ID4gIAlk
ZWZhdWx0Og0KPiA+ICAJCXJldHVybiAtRU5PVFRZOw0KPiA+ICAJfQ0KPiA+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oIGluZGV4
DQo+ID4gMzYyMTZkMjhkOGJkLi5kZTIzNmJhMjA5NGIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVk
ZS9saW51eC9kbWEtYnVmLmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaA0KPiA+
IEBAIC0yMiw2ICsyMiw3IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9mcy5oPg0KPiA+ICAjaW5j
bHVkZSA8bGludXgvZG1hLWZlbmNlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC93YWl0Lmg+DQo+
ID4gKyNpbmNsdWRlIDx1YXBpL2xpbnV4L2RtYS1idWYuaD4NCj4gPg0KPiA+ICBzdHJ1Y3QgZGV2
aWNlOw0KPiA+ICBzdHJ1Y3QgZG1hX2J1ZjsNCj4gPiBAQCAtMjg1LDYgKzI4Niw4IEBAIHN0cnVj
dCBkbWFfYnVmX29wcyB7DQo+ID4NCj4gPiAgCWludCAoKnZtYXApKHN0cnVjdCBkbWFfYnVmICpk
bWFidWYsIHN0cnVjdCBpb3N5c19tYXAgKm1hcCk7DQo+ID4gIAl2b2lkICgqdnVubWFwKShzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXApOw0KPiA+ICsNCj4gPiAr
CWludCAoKnJ3X2ZpbGUpKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCBkbWFfYnVmX3J3
X2ZpbGUNCj4gPiArKmZpbGUpOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIC8qKg0KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZG1hLWJ1Zi5oDQo+ID4gYi9pbmNsdWRlL3VhcGkvbGlu
dXgvZG1hLWJ1Zi5oIGluZGV4IDVhNmZkYTY2ZDlhZC4uZWM5MTY0YjdiNzUzDQo+IDEwMDY0NA0K
PiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9kbWEtYnVmLmgNCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvbGludXgvZG1hLWJ1Zi5oDQo+ID4gQEAgLTE2Nyw2ICsxNjcsMjkgQEAgc3RydWN0IGRt
YV9idWZfaW1wb3J0X3N5bmNfZmlsZSB7DQo+ID4gIAlfX3MzMiBmZDsNCj4gPiAgfTsNCj4gPg0K
PiA+ICsvKioNCj4gPiArICogc3RydWN0IGRtYV9idWZfcndfZmlsZSAtIHJlYWQvd3JpdGUgZmls
ZSBhc3NvY2lhdGVkIHdpdGggYSBkbWEtYnVmDQo+ID4gKyAqDQo+ID4gKyAqIFVzZXJzcGFjZSBj
YW4gcGVyZm9ybXMgYSBETUFfQlVGX0lPQ1RMX0JBQ0sgdG8gc2F2ZSBkYXRhIGZyb20gYQ0KPiA+
ICtkbWEtYnVmIG9yDQo+ID4gKyAqIHJlc3RvcmUgZGF0YSB0byBhIGRtYS1idWYuDQo+ID4gKyAq
Lw0KPiA+ICtzdHJ1Y3QgZG1hX2J1Zl9yd19maWxlIHsNCj4gPiArDQo+ID4gKwkvKiogQGZsYWdz
OiBGbGFncyBpbmRpY2F0aW5nIHJlYWQvd3JpdGUgZm9yIHRoaXMgZG1hLWJ1Zi4gKi8NCj4gPiAr
CV9fdTMyIGZsYWdzOw0KPiA+ICsJLyoqIEBmZDogRmlsZSBkZXNjcmlwdG9yIG9mIHRoZSBmaWxl
IGFzc29jaWF0ZWQgd2l0aCB0aGlzIGRtYS1idWYuICovDQo+ID4gKwlfX3MzMiBmZDsNCj4gPiAr
CS8qKiBAZmlsZV9vZmZzZXQ6IE9mZnNldCB3aXRoaW4gdGhlIGZpbGUgd2hlcmUgdGhpcyBkbWEt
YnVmIHN0YXJ0cy4NCj4gPiArCSAqDQo+ID4gKwkgKiAgT2Zmc2V0IGFuZCBMZW5ndGggbXVzdCBi
ZSBwYWdlLWFsaWduZWQgZm9yIGRpcmVjdCBJL08uDQo+ID4gKwkgKi8NCj4gPiArCV9fdTY0IGZp
bGVfb2Zmc2V0Ow0KPiA+ICsJLyoqIEBidWZfb2Zmc2V0OiBPZmZzZXQgd2l0aGluIHRoaXMgZG1h
LWJ1ZiB3aGVyZSB0aGUgcmVhZC93cml0ZQ0KPiBzdGFydHMuICovDQo+ID4gKwlfX3U2NCBidWZf
b2Zmc2V0Ow0KPiA+ICsJLyoqIEBidWZfbGVuOiBMZW5ndGggb2YgdGhpcyBkbWEtYnVmIHJlYWQv
d3JpdGUuICovDQo+ID4gKwlfX3U2NCBidWZfbGVuOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgI2Rl
ZmluZSBETUFfQlVGX0JBU0UJCSdiJw0KPiA+ICAjZGVmaW5lIERNQV9CVUZfSU9DVExfU1lOQwlf
SU9XKERNQV9CVUZfQkFTRSwgMCwgc3RydWN0DQo+IGRtYV9idWZfc3luYykNCj4gPg0KPiA+IEBA
IC0xNzksNCArMjAyLDEwIEBAIHN0cnVjdCBkbWFfYnVmX2ltcG9ydF9zeW5jX2ZpbGUgew0KPiA+
ICAjZGVmaW5lIERNQV9CVUZfSU9DVExfRVhQT1JUX1NZTkNfRklMRQ0KPiAJX0lPV1IoRE1BX0JV
Rl9CQVNFLCAyLCBzdHJ1Y3QgZG1hX2J1Zl9leHBvcnRfc3luY19maWxlKQ0KPiA+ICAjZGVmaW5l
IERNQV9CVUZfSU9DVExfSU1QT1JUX1NZTkNfRklMRQ0KPiAJX0lPVyhETUFfQlVGX0JBU0UsIDMs
IHN0cnVjdCBkbWFfYnVmX2ltcG9ydF9zeW5jX2ZpbGUpDQo+ID4NCj4gPiArI2RlZmluZSBETUFf
QlVGX1JXX0ZMQUdTX09QX01BU0sgKDB4RkYgPDwgMCkgI2RlZmluZQ0KPiA+ICtETUFfQlVGX1JX
X0ZMQUdTX1JFQUQgKDEgPDwgMCkgLyogUmVzdG9yZSBkbWEtYnVmIGRhdGEgKi8NCj4gI2RlZmlu
ZQ0KPiA+ICtETUFfQlVGX1JXX0ZMQUdTX1dSSVRFICgyIDw8IDApIC8qIFNhdmUgZG1hLWJ1ZiBk
YXRhICovICNkZWZpbmUNCj4gPiArRE1BX0JVRl9SV19GTEFHU19ESVJFQ1QgKDF1IDw8IDMxKSAv
KiBEaXJlY3QgcmVhZC93cml0ZSBmaWxlICovDQo+ID4gKyNkZWZpbmUgRE1BX0JVRl9JT0NUTF9S
V19GSUxFCV9JT1coRE1BX0JVRl9CQVNFLCA0LCBzdHJ1Y3QNCj4gZG1hX2J1Zl9yd19maWxlKQ0K
PiA+ICsNCj4gPiAgI2VuZGlmDQoNCg==

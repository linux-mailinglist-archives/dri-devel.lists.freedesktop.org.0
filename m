Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF3467378
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 09:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4387382C;
	Fri,  3 Dec 2021 08:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AFE7382E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 08:46:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B9B521709;
 Fri,  3 Dec 2021 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638521204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IXIAddKf47NvmPSg6fr8omn4Ihjf4sLMtaCGrTab5U=;
 b=nhR3oatLImACwfVNm4wtEvwMA+3x2lmSHcIEUrHaVU7+zij22Q5PHsew890IQSftKdRhj1
 Zun3J6UhBmAay7hNHNJ3xl9WbTAaosm9RZG71qLwZvUavQlegc8zjrmiV24KAKOv2I4m/4
 xwdG0wtN9j45h3YcidcM3Z7m5bQPqAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638521204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IXIAddKf47NvmPSg6fr8omn4Ihjf4sLMtaCGrTab5U=;
 b=ZVbW0zkUzPQtarqccn9wsplMMxzJqDjz2VGYOPxbk16HI+ixTOLyTmpwMLl1arVj87DAlS
 y74qxucZTsiL2tDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1007A13CF5;
 Fri,  3 Dec 2021 08:46:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /H/JAnTZqWGPYQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 03 Dec 2021 08:46:44 +0000
Message-ID: <4a7ce84d-faef-4fb2-d36d-5cff2fba8ecf@suse.de>
Date: Fri, 3 Dec 2021 09:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/ast: Atomic CR/SR reg R/W
Content-Language: en-US
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
 <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0D3tRR0iAjyAn7RMZkuVDNXk"
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?5riF5rC05L+uKG8tc2hpbWl6dSkt5Y+w54GjTkVD?=
 <o-shimizu@nec.com.tw>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung <arc_sung@aspeedtech.com>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0D3tRR0iAjyAn7RMZkuVDNXk
Content-Type: multipart/mixed; boundary="------------kX9E0menofnSmumUbLYr70Vv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, "airlied@linux.ie"
 <airlied@linux.ie>, =?UTF-8?B?5riF5rC05L+uKG8tc2hpbWl6dSkt5Y+w54GjTkVD?=
 <o-shimizu@nec.com.tw>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung
 <arc_sung@aspeedtech.com>, Luke Chen <luke_chen@aspeedtech.com>
Message-ID: <4a7ce84d-faef-4fb2-d36d-5cff2fba8ecf@suse.de>
Subject: Re: [PATCH] drm/ast: Atomic CR/SR reg R/W
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
 <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>

--------------kX9E0menofnSmumUbLYr70Vv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTIuMjEgdW0gMDI6MjMgc2NocmllYiBLdW8tSHNpYW5nIENob3U6DQo+
IA0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3VvLUhzaWFu
ZyBDaG91DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMzAsIDIwMjEgMzoxOSBQTQ0K
PiBUbzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hc3Q6IEF0b21pYyBDUi9TUiByZWcgUi9X
DQo+IA0KPiBIaQ0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VGhvbWFzIFppbW1lcm1hbm4gW21haWx0bzp0emltbWVybWFubkBzdXNlLmRlXQ0KPiBTZW50
OiBNb25kYXksIFNlcHRlbWJlciAyMCwgMjAyMSA0OjE3IFBNDQo+IFRvOiBLdW8tSHNpYW5n
IENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2guY29tPjsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBkcm0vYXN0OiBBdG9taWMgQ1IvU1IgcmVnIFIvVw0KPiANCj4g
SGkNCj4gDQo+IEFtIDE3LjA5LjIxIHVtIDA5OjIyIHNjaHJpZWIgS3VvSHNpYW5nIENob3U6
DQo+PiAxLiBBdm9pZCBJTy1pbmRleCByYWNpbmcNCj4+IDIuIElPLWluZGV4IHJhY2luZyBo
YXBwZW5lZCBvbiByZXNvbHVzdGlvbiBzd2l0Y2hpbmcNCj4+ICAgICAgYW5kIG1vdXNlIG1v
dmluZyBhdCB0aGUgc2FtZSB0aW1lDQo+PiAzLiBTeXN0ZW0gaHVuZyB3aGlsZSBJTy1pbmRl
eCByYWNpbmcgb2NjdXJyZWQuDQo+IA0KPiBJJ2Qgc2F5IHRoYXQgdGhlcmUncyBzb21ldGhp
bmcgZWxzZSBnb2luZyBvbmUgaGVyZS4gTW9kZSBzZXR0aW5nIGFuZCBjdXJzb3IgbW92ZW1l
bnQgc2hvdWxkIGJlIHByb3RlY3RlZCBhZ2FpbnN0IGVhY2ggb3RoZXIgYnkgRFJNIGxvY2tp
bmcuDQo+IENoYW5naW5nIHRoZXNlIGxvdy1sZXZlbCBmdW5jdGlvbnMgd291bGQgbm90IHNv
bHZlIHRoZSBpc3N1ZXMuIEknbGwgdHJ5IHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBBU0FQ
Lg0KPiANCj4gSGkgVGhvbWFzLA0KPiANCj4gU29ycnkgdG8gaW50ZXJydXB0IHlvdSBhZ2Fp
biENCj4gTWF5IEkgdW5kZXJzdGFuZCB0aGUgcmV2aWV3J3Mgc2l0dWF0aW9uPyBUaGFua3Mh
DQoNCkxvb2ssIHlvdSByZWFsbHkgaGF2ZSB0byB3b3JrIHdpdGggdXMgZHVyaW5nIHRoZSBy
ZXZpZXcgcHJvY2Vzcy4gRG9uJ3QgDQpqdXN0IGV4cGVjdCB1cyB0byB0ZWxsIHlvdSB3aGF0
IHRvIGRvLg0KDQpJJ20gbm90IGdvaW5nIHRvIG1lcmdlIHRoaXMgcGF0Y2guIEFzIEkgc2Fp
ZCwgSSBkb24ndCB0aGluayBpdCBmaXhlcyB0aGUgDQpwcm9ibGVtLiBNb3VzZSBtb3ZlbWVu
dCBhbmQgcmVzb2x1dGlvbiBzd2l0Y2hpbmcgc2hvdWxkIG5vdCBpbnRlcmZlcmUgDQp3aXRo
IGVhY2ggb3RoZXIuIFRoZSBEUk0gZnJhbWV3b3JrIHNob3VsZCBndWFyYW50ZWUgdGhhdC4N
Cg0KSSBjYW5ub3QgcmVwcm9kdWNlIHRoZSBpc3N1ZSwgYnV0IHRoZXJlJ3MgbW9zdCBsaWtl
bHkgc29tZXRoaW5nIGVsc2UgDQpoYXBwZW5pbmcgaGVyZS4gSG93IGNhbiB0aGUgc3lzdGVt
IHN3aXRjaCByZXNvbHV0aW9uIGFuZCBjaGFuZ2UgdGhlIA0KbW91c2UgYXQgdGhlIHNhbWUg
dGltZT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gSGkgVG9tYXMsDQo+IEdv
b2QgZGF5IQ0KPiBNYXkgSSB1bmRlcnN0YW5kIHRoZSByZXZpZXcgc3RhdHVzLCBvciBpcyB0
aGVyZSBhbnl0aGluZyBJIGNhbiBkbyB0byBpbXByb3ZlIGl0PyBUaGFua3MhDQo+IA0KPiBC
ZXN0IFJlZ2FyZHMsDQo+IAlLdW8tSHNpYW5nIENob3UNCj4gDQo+IEJlc3QgUmVnYXJkcywN
Cj4gICAJS3VvLUhzaWFuZyBDaG91DQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+
IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEt1b0hzaWFuZyBDaG91IDxrdW9oc2lhbmdfY2hv
dUBhc3BlZWR0ZWNoLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbWFpbi5jIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIGluZGV4IDc5YTM2MTg2Ny4uMWQ4
ZmE3MGM1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+IEBAIC00MSwy
OCArNDEsNTIgQEAgdm9pZCBhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKHN0cnVjdCBhc3RfcHJp
dmF0ZSAqYXN0LA0KPj4gICAgCQkJICAgIHVpbnQzMl90IGJhc2UsIHVpbnQ4X3QgaW5kZXgs
DQo+PiAgICAJCQkgICAgdWludDhfdCBtYXNrLCB1aW50OF90IHZhbCkNCj4+ICAgIHsNCj4+
IC0JdTggdG1wOw0KPj4gLQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPj4g
LQl0bXAgPSAoYXN0X2lvX3JlYWQ4KGFzdCwgYmFzZSArIDEpICYgbWFzaykgfCB2YWw7DQo+
PiAtCWFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgYmFzZSwgaW5kZXgsIHRtcCk7DQo+PiArCXVp
bnQxNl90IHZvbGF0aWxlIHVzRGF0YTsNCj4+ICsJdWludDhfdCAgdm9sYXRpbGUgakRhdGE7
DQo+PiArDQo+PiArCWRvIHsNCj4+ICsJCWFzdF9pb193cml0ZTgoYXN0LCBiYXNlLCBpbmRl
eCk7DQo+PiArCQl1c0RhdGEgPSBhc3RfaW9fcmVhZDE2KGFzdCwgYmFzZSk7DQo+PiArCX0g
d2hpbGUgKCh1aW50OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4+ICsNCj4+ICsJakRhdGEg
ID0gKHVpbnQ4X3QpKHVzRGF0YSA+PiA4KTsNCj4+ICsJakRhdGEgJj0gbWFzazsNCj4+ICsJ
akRhdGEgfD0gdmFsOw0KPj4gKwl1c0RhdGEgPSAoKHVpbnQxNl90KSBqRGF0YSA8PCA4KSB8
ICh1aW50MTZfdCkgaW5kZXg7DQo+PiArCWFzdF9pb193cml0ZTE2KGFzdCwgYmFzZSwgdXNE
YXRhKTsNCj4+ICAgIH0NCj4+DQo+PiAgICB1aW50OF90IGFzdF9nZXRfaW5kZXhfcmVnKHN0
cnVjdCBhc3RfcHJpdmF0ZSAqYXN0LA0KPj4gICAgCQkJICB1aW50MzJfdCBiYXNlLCB1aW50
OF90IGluZGV4KQ0KPj4gICAgew0KPj4gLQl1aW50OF90IHJldDsNCj4+IC0JYXN0X2lvX3dy
aXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4+IC0JcmV0ID0gYXN0X2lvX3JlYWQ4KGFzdCwg
YmFzZSArIDEpOw0KPj4gLQlyZXR1cm4gcmV0Ow0KPj4gKwl1aW50MTZfdCB2b2xhdGlsZSB1
c0RhdGE7DQo+PiArCXVpbnQ4X3QgIHZvbGF0aWxlIGpEYXRhOw0KPj4gKw0KPj4gKwlkbyB7
DQo+PiArCQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPj4gKwkJdXNEYXRh
ID0gYXN0X2lvX3JlYWQxNihhc3QsIGJhc2UpOw0KPj4gKwl9IHdoaWxlICgodWludDhfdCko
dXNEYXRhKSAhPSBpbmRleCk7DQo+PiArDQo+PiArCWpEYXRhICA9ICh1aW50OF90KSh1c0Rh
dGEgPj4gOCk7DQo+PiArDQo+PiArCXJldHVybiBqRGF0YTsNCj4+ICAgIH0NCj4+DQo+PiAg
ICB1aW50OF90IGFzdF9nZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFzdF9wcml2YXRlICph
c3QsDQo+PiAgICAJCQkgICAgICAgdWludDMyX3QgYmFzZSwgdWludDhfdCBpbmRleCwgdWlu
dDhfdCBtYXNrKQ0KPj4gICAgew0KPj4gLQl1aW50OF90IHJldDsNCj4+IC0JYXN0X2lvX3dy
aXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4+IC0JcmV0ID0gYXN0X2lvX3JlYWQ4KGFzdCwg
YmFzZSArIDEpICYgbWFzazsNCj4+IC0JcmV0dXJuIHJldDsNCj4+ICsJdWludDE2X3Qgdm9s
YXRpbGUgdXNEYXRhOw0KPj4gKwl1aW50OF90ICB2b2xhdGlsZSBqRGF0YTsNCj4+ICsNCj4+
ICsJZG8gew0KPj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4+ICsJ
CXVzRGF0YSA9IGFzdF9pb19yZWFkMTYoYXN0LCBiYXNlKTsNCj4+ICsJfSB3aGlsZSAoKHVp
bnQ4X3QpKHVzRGF0YSkgIT0gaW5kZXgpOw0KPj4gKw0KPj4gKwlqRGF0YSAgPSAodWludDhf
dCkodXNEYXRhID4+IDgpOw0KPj4gKwlqRGF0YSAmPSBtYXNrOw0KPj4gKw0KPj4gKwlyZXR1
cm4gakRhdGE7DQo+PiAgICB9DQo+Pg0KPj4gICAgc3RhdGljIHZvaWQgYXN0X2RldGVjdF9j
b25maWdfbW9kZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1MzINCj4+ICpzY3VfcmV2KQ0K
Pj4gLS0NCj4+IDIuMTguNA0KPj4NCj4gDQo+IC0tDQo+IFRob21hcyBaaW1tZXJtYW5uDQo+
IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KPiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+IEdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXINCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------kX9E0menofnSmumUbLYr70Vv--

--------------0D3tRR0iAjyAn7RMZkuVDNXk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGp2XMFAwAAAAAACgkQlh/E3EQov+DU
CRAAvAyBfc9yooroXfaNe0N8UYcYr72RRpmMrH3P51Q69MYT7ATPd9zC463oG6FULmjLJVeLm1wU
qn9I0Ols6RamCAw3unsGMfgjF2VLn2gOqX5RxPiXdWRynYi6NubSVMSmP4d/eNPNBeH/S7o5sFdd
ciwgIuKNy1Ga9j3YjEPBYrCL6NSxQfNZalUzAM1jrzcAyC26m49MJr0a6fixSw6neCbWetLEwk04
fHqGonrapX3+dF5bAPxXBGTJAb6X7fnSbjfB1xcGhVctOIy+Q4CQmR6y+4QpZHbE+kvWp8x3GCbo
MiHQeENK9Igk6w6etwpkUg/u7NWPsFlbqkSwO9+N3sHmR1gaJTrjkVpb7inZSZPxwsMZ9Yc9F1U0
P//Z2E8bgoRpHrVBD73Uue5LvlnrhdjEllERPpRmfuAE0OmoGP7GaNOXnTJTqc8d0wrf5Ps9N9k2
nowjW0EnRdqfb6AhN36GloboqVaVsvEdksXMip22FoUhjvwWvb5XRzwkdMpFKBK+EaJzDiBQulS8
vr8UEbWRVcumyfF8TTnM+c5UgrChDGh0fgyvuv1RBy1F3OIwx4LzQjVG+d+qlc2C9gM+/eYF4hxV
A9FgxH0TuezwSgHLn4Le9DVK/RerDkAzRFuEU86mbl6opHRQNHUk1Qdw6eEcsHC6ZvnI8o3RbEQ0
r4c=
=CSiN
-----END PGP SIGNATURE-----

--------------0D3tRR0iAjyAn7RMZkuVDNXk--

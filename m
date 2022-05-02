Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44EC51719E
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7910EFC1;
	Mon,  2 May 2022 14:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A96810EFC1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:32:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE5FC210DF;
 Mon,  2 May 2022 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651501953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hr8tg7qMvq7+HBRxnxzbzDH6LiepcRan1rlU5pg3igw=;
 b=dIRWbKzV+mgrep8V4vn6J11EgOs6HpBkjha5xwQ7g1/RxopgD8e3yjmnJZ1Z9xxhOpL3Sr
 qf5atz9xzNtOAAwjzyyNHATcXY1kyXTrJ5GH/gL8k/2RhmkeYAC3NHz5iHODuPDCME45fV
 jw2N5qRBWGucw9dUgSX/ZvJZMJfjbhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651501953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hr8tg7qMvq7+HBRxnxzbzDH6LiepcRan1rlU5pg3igw=;
 b=RhbLrLuZ4DthDjKP5l+A5wN1STKadLhlkwnWvBYP4T8R0WoNgqhwVHK0kBkE8gKqFQz5Mc
 K/i7AeSn+IXPQSCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7961013491;
 Mon,  2 May 2022 14:32:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CN3IHIHrb2I5NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 May 2022 14:32:33 +0000
Message-ID: <869155ca-cf9c-d334-c815-56f0e9eb2b2b@suse.de>
Date: Mon, 2 May 2022 16:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/ast: Atomic CR/SR reg R/W
Content-Language: en-US
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
 <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <4a7ce84d-faef-4fb2-d36d-5cff2fba8ecf@suse.de>
 <HK2PR06MB3300A0A69348024725AFD4BE8C6D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <HK2PR06MB3300A0A69348024725AFD4BE8C6D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wzzUxt8MQyWnqJGFQv6a0wjb"
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
--------------wzzUxt8MQyWnqJGFQv6a0wjb
Content-Type: multipart/mixed; boundary="------------jq5GfvK6DDMjQqDrbTiNIaKJ";
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
Message-ID: <869155ca-cf9c-d334-c815-56f0e9eb2b2b@suse.de>
Subject: Re: [PATCH] drm/ast: Atomic CR/SR reg R/W
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
 <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <4a7ce84d-faef-4fb2-d36d-5cff2fba8ecf@suse.de>
 <HK2PR06MB3300A0A69348024725AFD4BE8C6D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB3300A0A69348024725AFD4BE8C6D9@HK2PR06MB3300.apcprd06.prod.outlook.com>

--------------jq5GfvK6DDMjQqDrbTiNIaKJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjEgdW0gMDI6Mzggc2NocmllYiBLdW8tSHNpYW5nIENob3U6DQoN
Cj4gSSdtIG5vdCBnb2luZyB0byBtZXJnZSB0aGlzIHBhdGNoLiBBcyBJIHNhaWQsIEkgZG9u
J3QgdGhpbmsgaXQgZml4ZXMgdGhlIHByb2JsZW0uIE1vdXNlIG1vdmVtZW50IGFuZCByZXNv
bHV0aW9uIHN3aXRjaGluZyBzaG91bGQgbm90IGludGVyZmVyZSB3aXRoIGVhY2ggb3RoZXIu
IFRoZSBEUk0gZnJhbWV3b3JrIHNob3VsZCBndWFyYW50ZWUgdGhhdC4NCj4gT0ssIHRoYW5r
cyBmb3IgeW91ciBjb25maXJtYXRpb24uDQo+IA0KPiBJIGNhbm5vdCByZXByb2R1Y2UgdGhl
IGlzc3VlLCBidXQgdGhlcmUncyBtb3N0IGxpa2VseSBzb21ldGhpbmcgZWxzZSBoYXBwZW5p
bmcgaGVyZS4gSG93IGNhbiB0aGUgc3lzdGVtIHN3aXRjaCByZXNvbHV0aW9uIGFuZCBjaGFu
Z2UgdGhlIG1vdXNlIGF0IHRoZSBzYW1lIHRpbWU/DQo+IFN1cmUsIHdlIHdpbGwgY2hlY2sg
aWYgdGhlcmUgaXMgYSAxMDAgcGVyY2VudCBtZXRob2QgdG8gcmVwcm9kdWNlIHRoZSBpc3N1
ZS4NCj4gVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlcy4NCg0KSSd2ZSBiZWVuIGF3YXkgZm9y
IGEgd2hpbGU7IHNvcnJ5IGZvciBhbGwgdGhpcyB0YWtpbmcgc28gbG9uZy4gIEkndmUgDQpt
ZWFud2hpbGUgYmVlbiBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbS4gSXQgaGFwcGVu
cyB3aGVuIEdOT01FIA0KY29uY3VycmVudGx5IHRyaWVzIHRvIHNldCB0aGUgdmlkZW8gbW9k
ZSBhbmQgcmVhZCB0aGUgYXZhaWxhYmxlIHZpZGVvIA0KbW9kZXMgZnJvbSBFRElELiBSZWFk
aW5nIEVESUQgaXMgbm90IHByb3RlY3RlZCBhZ2FpbnN0IGNvbmN1cnJlbnQgbW9kZSANCnNl
dHRpbmcgb3IgY3Vyc29yIG1vdmVtZW50Lg0KDQpJJ3ZlIHBvc3RlZCBhIHBhdGNoc2V0IHRo
YXQgc2hvdWxkIGZpeCB0aGUgcHJvYmxlbS4gU2VlIFsxXS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjIw
NTAyMTQyNTE0LjIxNzQtMS10emltbWVybWFubkBzdXNlLmRlL1QvI3QNCg0KPiANCj4gUmVn
YXJkcywNCj4gCUt1by1Ic2lhbmcgQ2hvdQ0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21h
cw0KPiANCj4+DQo+PiBIaSBUb21hcywNCj4+IEdvb2QgZGF5IQ0KPj4gTWF5IEkgdW5kZXJz
dGFuZCB0aGUgcmV2aWV3IHN0YXR1cywgb3IgaXMgdGhlcmUgYW55dGhpbmcgSSBjYW4gZG8g
dG8gaW1wcm92ZSBpdD8gVGhhbmtzIQ0KPj4NCj4+IEJlc3QgUmVnYXJkcywNCj4+IAlLdW8t
SHNpYW5nIENob3UNCj4+DQo+PiBCZXN0IFJlZ2FyZHMsDQo+PiAgICAJS3VvLUhzaWFuZyBD
aG91DQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4NCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBLdW9Ic2lhbmcgQ2hvdSA8a3VvaHNpYW5nX2Nob3VAYXNwZWVkdGVjaC5j
b20+DQo+Pj4gLS0tDQo+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyB8
IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4+PiAgICAgMSBmaWxl
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIGluZGV4IDc5YTM2MTg2Ny4uMWQ4ZmE3MGM1
IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPj4+IEBAIC00MSwyOCAr
NDEsNTIgQEAgdm9pZCBhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKHN0cnVjdCBhc3RfcHJpdmF0
ZSAqYXN0LA0KPj4+ICAgICAJCQkgICAgdWludDMyX3QgYmFzZSwgdWludDhfdCBpbmRleCwN
Cj4+PiAgICAgCQkJICAgIHVpbnQ4X3QgbWFzaywgdWludDhfdCB2YWwpDQo+Pj4gICAgIHsN
Cj4+PiAtCXU4IHRtcDsNCj4+PiAtCWFzdF9pb193cml0ZTgoYXN0LCBiYXNlLCBpbmRleCk7
DQo+Pj4gLQl0bXAgPSAoYXN0X2lvX3JlYWQ4KGFzdCwgYmFzZSArIDEpICYgbWFzaykgfCB2
YWw7DQo+Pj4gLQlhc3Rfc2V0X2luZGV4X3JlZyhhc3QsIGJhc2UsIGluZGV4LCB0bXApOw0K
Pj4+ICsJdWludDE2X3Qgdm9sYXRpbGUgdXNEYXRhOw0KPj4+ICsJdWludDhfdCAgdm9sYXRp
bGUgakRhdGE7DQo+Pj4gKw0KPj4+ICsJZG8gew0KPj4+ICsJCWFzdF9pb193cml0ZTgoYXN0
LCBiYXNlLCBpbmRleCk7DQo+Pj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3QsIGJh
c2UpOw0KPj4+ICsJfSB3aGlsZSAoKHVpbnQ4X3QpKHVzRGF0YSkgIT0gaW5kZXgpOw0KPj4+
ICsNCj4+PiArCWpEYXRhICA9ICh1aW50OF90KSh1c0RhdGEgPj4gOCk7DQo+Pj4gKwlqRGF0
YSAmPSBtYXNrOw0KPj4+ICsJakRhdGEgfD0gdmFsOw0KPj4+ICsJdXNEYXRhID0gKCh1aW50
MTZfdCkgakRhdGEgPDwgOCkgfCAodWludDE2X3QpIGluZGV4Ow0KPj4+ICsJYXN0X2lvX3dy
aXRlMTYoYXN0LCBiYXNlLCB1c0RhdGEpOw0KPj4+ICAgICB9DQo+Pj4NCj4+PiAgICAgdWlu
dDhfdCBhc3RfZ2V0X2luZGV4X3JlZyhzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCwNCj4+PiAg
ICAgCQkJICB1aW50MzJfdCBiYXNlLCB1aW50OF90IGluZGV4KQ0KPj4+ICAgICB7DQo+Pj4g
LQl1aW50OF90IHJldDsNCj4+PiAtCWFzdF9pb193cml0ZTgoYXN0LCBiYXNlLCBpbmRleCk7
DQo+Pj4gLQlyZXQgPSBhc3RfaW9fcmVhZDgoYXN0LCBiYXNlICsgMSk7DQo+Pj4gLQlyZXR1
cm4gcmV0Ow0KPj4+ICsJdWludDE2X3Qgdm9sYXRpbGUgdXNEYXRhOw0KPj4+ICsJdWludDhf
dCAgdm9sYXRpbGUgakRhdGE7DQo+Pj4gKw0KPj4+ICsJZG8gew0KPj4+ICsJCWFzdF9pb193
cml0ZTgoYXN0LCBiYXNlLCBpbmRleCk7DQo+Pj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQx
Nihhc3QsIGJhc2UpOw0KPj4+ICsJfSB3aGlsZSAoKHVpbnQ4X3QpKHVzRGF0YSkgIT0gaW5k
ZXgpOw0KPj4+ICsNCj4+PiArCWpEYXRhICA9ICh1aW50OF90KSh1c0RhdGEgPj4gOCk7DQo+
Pj4gKw0KPj4+ICsJcmV0dXJuIGpEYXRhOw0KPj4+ICAgICB9DQo+Pj4NCj4+PiAgICAgdWlu
dDhfdCBhc3RfZ2V0X2luZGV4X3JlZ19tYXNrKHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0LA0K
Pj4+ICAgICAJCQkgICAgICAgdWludDMyX3QgYmFzZSwgdWludDhfdCBpbmRleCwgdWludDhf
dCBtYXNrKQ0KPj4+ICAgICB7DQo+Pj4gLQl1aW50OF90IHJldDsNCj4+PiAtCWFzdF9pb193
cml0ZTgoYXN0LCBiYXNlLCBpbmRleCk7DQo+Pj4gLQlyZXQgPSBhc3RfaW9fcmVhZDgoYXN0
LCBiYXNlICsgMSkgJiBtYXNrOw0KPj4+IC0JcmV0dXJuIHJldDsNCj4+PiArCXVpbnQxNl90
IHZvbGF0aWxlIHVzRGF0YTsNCj4+PiArCXVpbnQ4X3QgIHZvbGF0aWxlIGpEYXRhOw0KPj4+
ICsNCj4+PiArCWRvIHsNCj4+PiArCQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgp
Ow0KPj4+ICsJCXVzRGF0YSA9IGFzdF9pb19yZWFkMTYoYXN0LCBiYXNlKTsNCj4+PiArCX0g
d2hpbGUgKCh1aW50OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4+PiArDQo+Pj4gKwlqRGF0
YSAgPSAodWludDhfdCkodXNEYXRhID4+IDgpOw0KPj4+ICsJakRhdGEgJj0gbWFzazsNCj4+
PiArDQo+Pj4gKwlyZXR1cm4gakRhdGE7DQo+Pj4gICAgIH0NCj4+Pg0KPj4+ICAgICBzdGF0
aWMgdm9pZCBhc3RfZGV0ZWN0X2NvbmZpZ19tb2RlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHUzMg0KPj4+ICpzY3VfcmV2KQ0KPj4+IC0tDQo+Pj4gMi4xOC40DQo+Pj4NCj4+DQo+PiAt
LQ0KPj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
Cj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55IChIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCj4+DQo+IA0K
PiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KPiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------jq5GfvK6DDMjQqDrbTiNIaKJ--

--------------wzzUxt8MQyWnqJGFQv6a0wjb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJv64EFAwAAAAAACgkQlh/E3EQov+C7
xQ//cgBVHEuNi37X7EVR30pP1yw4aTWd/9Im5/e8ABjgzCptBq6HIejXC0KdRRrilMpzRdLtMCon
3xRV8OmcJG0gQbaET1SZAVEvJJSTEGwLWfcntSDWYO5UcEJcXZ43rKZT6FpDJSjHZ/XJetvXdp3u
1srpsSciase/4lzj1Mzae83MmVzmZlaiKkxkUrVSUskEqqSIK2lVxsDJBDW1FIJmOckpcZsukvAC
EhWJSRWlb2ng7C3+JbKZcRypWzxmpE3GKgghHqE85muzH7F0bTp2mBFq/I2FYH1zACR3i2MxEOXk
CAnY5Jvew/CPQLkIOVqkwwUCd31QLdl+l8nxSt4vtNFHEZUr1J9v4bl8L9vtfHvdqOryO6Qzumvc
hrTruO5LtZFcYlmU6CEvZIrHdoq1+Ny0E9JCPPs0106BktEoN7q7QkgJ2XzuFUk0UgDpA8KqM05P
hIRE/3WpQxkC8Dw+OioF/PxwUsd9G04io0gWDmOl4gMQOlwKeOVOAaDeQseFeiqamZY/n6xrygPY
Aow0ODahJfOK4qVik8y3xiWcNKIg+BpClOoLPvsbcil611rG4WCpMqVug0BZporwNs/X0l+jFANi
aVgNaVj0DEK25vY8KHXcHIgMpHNUTJKkO8A49Hwusmuk/6Lxf4Hrtm6JGLt488SE8S3DtFjRIc6m
4S0=
=yMm0
-----END PGP SIGNATURE-----

--------------wzzUxt8MQyWnqJGFQv6a0wjb--

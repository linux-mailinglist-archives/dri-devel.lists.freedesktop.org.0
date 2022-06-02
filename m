Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398653B614
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 11:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA4910E603;
	Thu,  2 Jun 2022 09:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F0110E603
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 09:32:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A11D821AC3;
 Thu,  2 Jun 2022 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654162346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5m1YhxlxjV4X2+PMCuMOJPR3apEIWVF9jVDiS1rOt8s=;
 b=NDj9zxkWevSFlY8RBgXiyyb2mpTM3mi7A4UudJE2eX2kkrPp8io3ftb0TJ+2XodQ6dqf+m
 qyGX+RwoJgpL+xvir8FKDigEpMvir5lTCB1igDS9SUVwUzM4RZccSZ8kz2//orluQy71L8
 phBDbNh29HIZfE8i3Z6UedXW0tD47H8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654162346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5m1YhxlxjV4X2+PMCuMOJPR3apEIWVF9jVDiS1rOt8s=;
 b=kH58jNoDVqzlu3iT1GPl1v9XIzBLgm24YDLfoqpq5OZHG1m5aDJwGwqWCbrYZoWKHHunCv
 vchcXI6M1lYAUYBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72D68134F3;
 Thu,  2 Jun 2022 09:32:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vcX5GqqDmGLORQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Jun 2022 09:32:26 +0000
Message-ID: <78f8bd77-3dca-9cc6-b8e4-49d811d9dd47@suse.de>
Date: Thu, 2 Jun 2022 11:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 4/5] drm/ast: Fail probing if DCC channel could not be
 initialized
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-5-tzimmermann@suse.de>
 <CAMeQTsZHH0XOwXrogeWpeHjFHNeHCnwZT6aYR7G2dv1bM6F=kA@mail.gmail.com>
 <CAMeQTsaFg4Rq=WCv=GFuc2+fp-ePuuQQpJvgE3V3N9s+tps0sQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMeQTsaFg4Rq=WCv=GFuc2+fp-ePuuQQpJvgE3V3N9s+tps0sQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7c4lfIcybyF5Jr32PM0liWUN"
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7c4lfIcybyF5Jr32PM0liWUN
Content-Type: multipart/mixed; boundary="------------J99nuc60QewitqOFqHiaIRKk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, kuohsiang_chou@aspeedtech.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <78f8bd77-3dca-9cc6-b8e4-49d811d9dd47@suse.de>
Subject: Re: [PATCH v2 4/5] drm/ast: Fail probing if DCC channel could not be
 initialized
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-5-tzimmermann@suse.de>
 <CAMeQTsZHH0XOwXrogeWpeHjFHNeHCnwZT6aYR7G2dv1bM6F=kA@mail.gmail.com>
 <CAMeQTsaFg4Rq=WCv=GFuc2+fp-ePuuQQpJvgE3V3N9s+tps0sQ@mail.gmail.com>
In-Reply-To: <CAMeQTsaFg4Rq=WCv=GFuc2+fp-ePuuQQpJvgE3V3N9s+tps0sQ@mail.gmail.com>

--------------J99nuc60QewitqOFqHiaIRKk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF0cmlrDQoNCkFtIDAyLjA2LjIyIHVtIDA5OjQyIHNjaHJpZWIgUGF0cmlrIEpha29i
c3NvbjoNCj4gT24gVGh1LCBKdW4gMiwgMjAyMiBhdCA5OjI1IEFNIFBhdHJpayBKYWtvYnNz
b24NCj4gPHBhdHJpay5yLmpha29ic3NvbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4NCj4+IE9u
IFR1ZSwgTWF5IDMxLCAyMDIyIGF0IDE6MTUgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+DQo+Pj4gRXhwZWN0IHRoZSBoYXJkd2FyZSB0
byBwcm92aWRlIGEgRERDIGNoYW5uZWwuIEZhaWwgcHJvYmluZyBpZiBpdHMNCj4+PiBpbml0
aWFsaXphdGlvbiBmYWlscy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4NCj4+IEl0J3MgZnVubnkgaG93IEkg
anVzdCBkaWQgdGhlIHNhbWUgdGhpbmcgdG8gZ21hNTAwLiBHcmVhdCBtaW5kcyB0aGluayBh
bGlrZSA7KQ0KPj4NCj4+IFJldmlld2VkLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsu
ci5qYWtvYnNzb25AZ21haWwuY29tPg0KPiANCj4gSSBqdXN0IHJlYWxpemVkIHRoYXQgdGhl
IGFzdF9pMmNfY2hhbiBpcyBuZXZlciBmcmVlZC4gQ291bGQgYmUgZml4ZWQNCj4gaW4gYSBm
b2xsb3ctdXAgcGF0Y2g/DQoNCkluIGFzdF9pMmNfY3JlYXRlKCksIHRoZXJlJ3MgYSBjYWxs
IHRvIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgpLCB3aGljaCANCnNldHMgdXAgYXN0X2ky
Y19yZWxlYXNlKCksIHdoaWNoIGluIHR1cm4ga2ZyZWUncyB0aGUgbWVtb3J5LiBVbmxlc3Mg
SSdtIA0KdG90YWxseSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPj4NCj4+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcnYuaCAgfCAgMiAtLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
aTJjLmMgIHwgIDcgKysrKy0tLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jIHwgMzggKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+ICAgMyBm
aWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oDQo+Pj4gaW5kZXggMzA1NWIwYmU3YjY3Li4yYTU1
ZmM3MzAzYjkgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2
LmgNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPj4+IEBAIC0x
MzIsNyArMTMyLDYgQEAgc3RydWN0IGFzdF9pMmNfY2hhbiB7DQo+Pj4NCj4+PiAgIHN0cnVj
dCBhc3RfdmdhX2Nvbm5lY3RvciB7DQo+Pj4gICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0
b3IgYmFzZTsNCj4+PiAtICAgICAgIHN0cnVjdCBhc3RfaTJjX2NoYW4gKmkyYzsNCj4+PiAg
IH07DQo+Pj4NCj4+PiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGFzdF92Z2FfY29ubmVjdG9y
ICoNCj4+PiBAQCAtMTQzLDcgKzE0Miw2IEBAIHRvX2FzdF92Z2FfY29ubmVjdG9yKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+Pj4NCj4+PiAgIHN0cnVjdCBhc3Rfc2ls
MTY0X2Nvbm5lY3RvciB7DQo+Pj4gICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgYmFz
ZTsNCj4+PiAtICAgICAgIHN0cnVjdCBhc3RfaTJjX2NoYW4gKmkyYzsNCj4+PiAgIH07DQo+
Pj4NCj4+PiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGFzdF9zaWwxNjRfY29ubmVjdG9yICoN
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfaTJjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9pMmMuYw0KPj4+IGluZGV4IDkzZTkxYzM2ZDY0OS4uMWQw
MzlmZjEzOTZlIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ky
Yy5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfaTJjLmMNCj4+PiBAQCAt
MTE3LDcgKzExNyw3IEBAIHN0cnVjdCBhc3RfaTJjX2NoYW4gKmFzdF9pMmNfY3JlYXRlKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+Pj4NCj4+PiAgICAgICAgICBpMmMgPSBremFsbG9j
KHNpemVvZihzdHJ1Y3QgYXN0X2kyY19jaGFuKSwgR0ZQX0tFUk5FTCk7DQo+Pj4gICAgICAg
ICAgaWYgKCFpMmMpDQo+Pj4gLSAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPj4+ICsg
ICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4+Pg0KPj4+ICAgICAg
ICAgIGkyYy0+YWRhcHRlci5vd25lciA9IFRISVNfTU9EVUxFOw0KPj4+ICAgICAgICAgIGky
Yy0+YWRhcHRlci5jbGFzcyA9IEkyQ19DTEFTU19EREM7DQo+Pj4gQEAgLTE0MywxMCArMTQz
LDExIEBAIHN0cnVjdCBhc3RfaTJjX2NoYW4gKmFzdF9pMmNfY3JlYXRlKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpDQo+Pj4NCj4+PiAgICAgICAgICByZXQgPSBkcm1tX2FkZF9hY3Rpb25f
b3JfcmVzZXQoZGV2LCBhc3RfaTJjX3JlbGVhc2UsIGkyYyk7DQo+Pj4gICAgICAgICAgaWYg
KHJldCkNCj4+PiAtICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+Pj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+Pj4gKw0KPj4+ICAgICAgICAgIHJldHVy
biBpMmM7DQo+Pj4NCj4+PiAgIG91dF9rZnJlZToNCj4+PiAgICAgICAgICBrZnJlZShpMmMp
Ow0KPj4+IC0gICAgICAgcmV0dXJuIE5VTEw7DQo+Pj4gKyAgICAgICByZXR1cm4gRVJSX1BU
UihyZXQpOw0KPj4+ICAgfQ0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4+PiBpbmRl
eCBiYmM1NjZjNGM3NjguLjVmMjczYjVkZDc2OSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMNCj4+PiBAQCAtMTMzNCwxOSArMTMzNCwxOCBAQCBzdGF0aWMgaW50IGFz
dF92Z2FfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhc3RfdmdhX2Nvbm5lY3Rv
ciAqYXN0X3ZnYV9jb25uZWN0b3IpDQo+Pj4gICB7DQo+Pj4gICAgICAgICAgc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciA9ICZhc3RfdmdhX2Nvbm5lY3Rvci0+YmFzZTsNCj4+
PiArICAgICAgIHN0cnVjdCBhc3RfaTJjX2NoYW4gKmkyYzsNCj4+PiAgICAgICAgICBpbnQg
cmV0Ow0KPj4+DQo+Pj4gLSAgICAgICBhc3RfdmdhX2Nvbm5lY3Rvci0+aTJjID0gYXN0X2ky
Y19jcmVhdGUoZGV2KTsNCj4+PiAtICAgICAgIGlmICghYXN0X3ZnYV9jb25uZWN0b3ItPmky
YykNCj4+PiAtICAgICAgICAgICAgICAgZHJtX2VycihkZXYsICJmYWlsZWQgdG8gYWRkIGRk
YyBidXMgZm9yIGNvbm5lY3RvclxuIik7DQo+Pj4gKyAgICAgICBpMmMgPSBhc3RfaTJjX2Ny
ZWF0ZShkZXYpOw0KPj4+ICsgICAgICAgaWYgKElTX0VSUihpMmMpKSB7DQo+Pj4gKyAgICAg
ICAgICAgICAgIHJldCA9IFBUUl9FUlIoaTJjKTsNCj4+PiArICAgICAgICAgICAgICAgZHJt
X2VycihkZXYsICJmYWlsZWQgdG8gYWRkIGRkYyBidXMgZm9yIGNvbm5lY3RvcjsgcmV0PSVk
XG4iLCByZXQpOw0KPj4+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4+ICsgICAg
ICAgfQ0KPj4+DQo+Pj4gLSAgICAgICBpZiAoYXN0X3ZnYV9jb25uZWN0b3ItPmkyYykNCj4+
PiAtICAgICAgICAgICAgICAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRl
diwgY29ubmVjdG9yLCAmYXN0X3ZnYV9jb25uZWN0b3JfZnVuY3MsDQo+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9DT05O
RUNUT1JfVkdBLA0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJmFzdF92Z2FfY29ubmVjdG9yLT5pMmMtPmFkYXB0ZXIpOw0KPj4+IC0g
ICAgICAgZWxzZQ0KPj4+IC0gICAgICAgICAgICAgICByZXQgPSBkcm1fY29ubmVjdG9yX2lu
aXQoZGV2LCBjb25uZWN0b3IsICZhc3RfdmdhX2Nvbm5lY3Rvcl9mdW5jcywNCj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX0NPTk5FQ1RP
Ul9WR0EpOw0KPj4+ICsgICAgICAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRj
KGRldiwgY29ubmVjdG9yLCAmYXN0X3ZnYV9jb25uZWN0b3JfZnVuY3MsDQo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfQ09OTkVDVE9S
X1ZHQSwgJmkyYy0+YWRhcHRlcik7DQo+Pj4gICAgICAgICAgaWYgKHJldCkNCj4+PiAgICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4NCj4+PiBAQCAtMTQwNiwxOSArMTQwNSwx
OCBAQCBzdGF0aWMgaW50IGFzdF9zaWwxNjRfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBhc3Rfc2lsMTY0X2Nvbm5lY3RvciAqYXN0X3NpbDE2NF9jb25uZWN0b3IpDQo+
Pj4gICB7DQo+Pj4gICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9
ICZhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+YmFzZTsNCj4+PiArICAgICAgIHN0cnVjdCBhc3Rf
aTJjX2NoYW4gKmkyYzsNCj4+PiAgICAgICAgICBpbnQgcmV0Ow0KPj4+DQo+Pj4gLSAgICAg
ICBhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+aTJjID0gYXN0X2kyY19jcmVhdGUoZGV2KTsNCj4+
PiAtICAgICAgIGlmICghYXN0X3NpbDE2NF9jb25uZWN0b3ItPmkyYykNCj4+PiAtICAgICAg
ICAgICAgICAgZHJtX2VycihkZXYsICJmYWlsZWQgdG8gYWRkIGRkYyBidXMgZm9yIGNvbm5l
Y3RvclxuIik7DQo+Pj4gKyAgICAgICBpMmMgPSBhc3RfaTJjX2NyZWF0ZShkZXYpOw0KPj4+
ICsgICAgICAgaWYgKElTX0VSUihpMmMpKSB7DQo+Pj4gKyAgICAgICAgICAgICAgIHJldCA9
IFBUUl9FUlIoaTJjKTsNCj4+PiArICAgICAgICAgICAgICAgZHJtX2VycihkZXYsICJmYWls
ZWQgdG8gYWRkIGRkYyBidXMgZm9yIGNvbm5lY3RvcjsgcmV0PSVkXG4iLCByZXQpOw0KPj4+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4+ICsgICAgICAgfQ0KPj4+DQo+Pj4g
LSAgICAgICBpZiAoYXN0X3NpbDE2NF9jb25uZWN0b3ItPmkyYykNCj4+PiAtICAgICAgICAg
ICAgICAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgY29ubmVjdG9y
LCAmYXN0X3NpbDE2NF9jb25uZWN0b3JfZnVuY3MsDQo+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFZJ
SSwNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsNCj4+PiAtICAgICAg
IGVsc2UNCj4+PiAtICAgICAgICAgICAgICAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRl
diwgY29ubmVjdG9yLCAmYXN0X3NpbDE2NF9jb25uZWN0b3JfZnVuY3MsDQo+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9DT05ORUNUT1Jf
RFZJSSk7DQo+Pj4gKyAgICAgICByZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMo
ZGV2LCBjb25uZWN0b3IsICZhc3Rfc2lsMTY0X2Nvbm5lY3Rvcl9mdW5jcywNCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9DT05ORUNU
T1JfRFZJSSwgJmkyYy0+YWRhcHRlcik7DQo+Pj4gICAgICAgICAgaWYgKHJldCkNCj4+PiAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4NCj4+PiAtLQ0KPj4+IDIuMzYuMQ0K
Pj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------J99nuc60QewitqOFqHiaIRKk--

--------------7c4lfIcybyF5Jr32PM0liWUN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKYg6oFAwAAAAAACgkQlh/E3EQov+C7
BRAAk5wyGyJXb5Kn9eV4sOH53hlQbwPMWuzF9qokKYxPXGAb/dU+1XuoMg7UzacHKamFn0S16CBx
lTdnS/W9jAuaVWWs80/CcZ+LEdCLuio0qIXsansMyt638i8s0IsEVQeRFM0HQXiiCKPzvgnK90mj
WY+EpJSMZI1lE02FWdZVgmUzJZ0MOmNIfk6sEbYp86GCG/+A+FkxH+aR4fqSRyjTGAg6qmPZj/Nk
nQ1+3Yjqm2owTvN1FLcWQrezFkw1Ph2L8KhtiEsiSfEg2Co4yn+wcq0fHWE2ohzmdjp45OCI+BWS
msdGiTKpqeTh3mMHaRsZ3qzKn3ekQSOwcUhq+TyDnLZRlAFnIeKiCqb/3Jp5ZoVMBvNGe2op8WA1
WabARC6P/5oBr2th2I/c4O/1EYfBPr/oZykjApohoT+kl+9SwJlSlsgqHNhZh/RFLrfCs2Q95ED7
N613mRVWPH93XA9xMDIR3+pesbWNDUPqz1IfRFNSk8B4fqU8czqsytVr+B3MVegCQKFlor8KMDFL
Lt+fNQh2ISeWUPIpIuhyifpnuqbGIzYW7KOZLiOpR6t2sjx6UN44wQmcyTb7/hsYPWjHg8eiCrkH
LEiq84IsiE8TGGgEpJ8j3zZJAmZ2ay4Pr74vt314+V+sFtQKXY3jhuCG+DIa9NnFW5QkWHvpg38v
uHg=
=L35U
-----END PGP SIGNATURE-----

--------------7c4lfIcybyF5Jr32PM0liWUN--

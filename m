Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A83522D6B
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 09:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AC810F66D;
	Wed, 11 May 2022 07:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B5410F66D;
 Wed, 11 May 2022 07:31:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C32B1F8DE;
 Wed, 11 May 2022 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652254306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t61IF+SoXuT5Idhq5G2NgF2bpPnZ3NfERJN2lII0/zs=;
 b=LfXcxeMlN0H4E1vppGAcAwBf8gFhwZL5JeSdsFgshQpCi958AkiaLjE6hrfiscDCGVBMJa
 hQTL9BjXtHPH/woALZpW32Jh8buudaAZU6pG0eqPLZlhxBH9pgDQ0hQFXKWBm66Xq/mEoU
 4p9MD0Z7oVWqB8AXiJNrDg5pj63tzco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652254306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t61IF+SoXuT5Idhq5G2NgF2bpPnZ3NfERJN2lII0/zs=;
 b=f4BxnFYsJ/n/e5+18g/voQvsSFB8UIMNBxFyUAl1HveNqA1nX8sOq1kuaDCG51zN/YavEX
 9dmKducrQVJZ33Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA11613A76;
 Wed, 11 May 2022 07:31:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f0QtOGFme2LOUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 07:31:45 +0000
Message-ID: <1b5dc787-2fef-9b8c-e9ba-5e4a847c3fdb@suse.de>
Date: Wed, 11 May 2022 09:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220510131309.v2.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220510131309.v2.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Vi6bEJo5912Vd6sf0kbdE0kd"
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Vi6bEJo5912Vd6sf0kbdE0kd
Content-Type: multipart/mixed; boundary="------------SAC53mZPu0Bys1bhDVPWOgg3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: quic_sbillaka@quicinc.com, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Message-ID: <1b5dc787-2fef-9b8c-e9ba-5e4a847c3fdb@suse.de>
Subject: Re: [PATCH v2 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
References: <20220510131309.v2.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
In-Reply-To: <20220510131309.v2.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>

--------------SAC53mZPu0Bys1bhDVPWOgg3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjIgdW0gMjI6MTMgc2NocmllYiBEb3VnbGFzIEFuZGVyc29uOg0K
PiBUaGUgZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzKCkgaXMgYSBi
aXQgbG9uZy4gTGV0J3MNCj4gYnJlYWsgYSBjaHVuayBvZmYgdG8gdXBkYXRlIGFuZCB2YWxp
ZGF0ZSBtb2Rlcy4gVGhpcyBoZWxwcyBhdm9pZCBvbmUNCj4gZ290byBhbmQgYWxzbyB3aWxs
IGFsbG93IHVzIHRvIG1vcmUgZWFzaWx5IGNhbGwgdGhlIGhlbHBlciBhIHNlY29uZA0KPiB0
aW1lIGluIGEgZnV0dXJlIHBhdGNoIHdpdGhvdXQgYWRkaW5nIGxvb3Bpbmcgb3IgYW5vdGhl
ciBnb3RvLg0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgaW50ZW5kZWQgdG8gYmUgYSBuby1vcCBj
aGFuZ2UtLWp1c3QgY29kZSBtb3ZlbWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERvdWds
YXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IEFi
aGluYXYgS3VtYXIgPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+DQo+IC0tLQ0KPiANCj4g
Q2hhbmdlcyBpbiB2MjoNCj4gLSBUd28gdW5kZXJzY29yZXMgZm9yIF9fZHJtX2hlbHBlcl91
cGRhdGVfYW5kX3ZhbGlkYXRlKCkuDQo+IC0gUmV0dXJuIGVyciBhbmQgdXNlIFdBUk5fT04g
aW5zdGVhZCBvZiByZXR1cm5pbmcgYSBib29sLg0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3Byb2JlX2hlbHBlci5jIHwgMTA3ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jDQo+IGluZGV4IDY4MjM1
OTUxMjk5Ni4uZmYzZGQ5YTVkYTcwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3Byb2JlX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVf
aGVscGVyLmMNCj4gQEAgLTM1NCw2ICszNTQsNjEgQEAgZHJtX2hlbHBlcl9wcm9iZV9kZXRl
Y3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gICB9DQo+ICAgRVhQT1JU
X1NZTUJPTChkcm1faGVscGVyX3Byb2JlX2RldGVjdCk7DQo+ICAgDQo+ICtzdGF0aWMgaW50
IF9fZHJtX2hlbHBlcl91cGRhdGVfYW5kX3ZhbGlkYXRlKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IsDQo+ICsJCQkJCSAgICB1aW50MzJfdCBtYXhYLCB1aW50MzJfdCBtYXhZ
LA0KPiArCQkJCQkgICAgc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4ICpjdHgpDQo+
ICt7DQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNvbm5lY3Rvci0+ZGV2Ow0KPiAr
CXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOw0KPiArCWludCBtb2RlX2ZsYWdzID0g
MDsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJZHJtX2Nvbm5lY3Rvcl9saXN0X3VwZGF0ZShj
b25uZWN0b3IpOw0KPiArDQo+ICsJaWYgKGNvbm5lY3Rvci0+aW50ZXJsYWNlX2FsbG93ZWQp
DQo+ICsJCW1vZGVfZmxhZ3MgfD0gRFJNX01PREVfRkxBR19JTlRFUkxBQ0U7DQo+ICsJaWYg
KGNvbm5lY3Rvci0+ZG91Ymxlc2Nhbl9hbGxvd2VkKQ0KPiArCQltb2RlX2ZsYWdzIHw9IERS
TV9NT0RFX0ZMQUdfREJMU0NBTjsNCj4gKwlpZiAoY29ubmVjdG9yLT5zdGVyZW9fYWxsb3dl
ZCkNCj4gKwkJbW9kZV9mbGFncyB8PSBEUk1fTU9ERV9GTEFHXzNEX01BU0s7DQo+ICsNCj4g
KwlsaXN0X2Zvcl9lYWNoX2VudHJ5KG1vZGUsICZjb25uZWN0b3ItPm1vZGVzLCBoZWFkKSB7
DQo+ICsJCWlmIChtb2RlLT5zdGF0dXMgIT0gTU9ERV9PSykNCj4gKwkJCWNvbnRpbnVlOw0K
PiArDQo+ICsJCW1vZGUtPnN0YXR1cyA9IGRybV9tb2RlX3ZhbGlkYXRlX2RyaXZlcihkZXYs
IG1vZGUpOw0KPiArCQlpZiAobW9kZS0+c3RhdHVzICE9IE1PREVfT0spDQo+ICsJCQljb250
aW51ZTsNCj4gKw0KPiArCQltb2RlLT5zdGF0dXMgPSBkcm1fbW9kZV92YWxpZGF0ZV9zaXpl
KG1vZGUsIG1heFgsIG1heFkpOw0KPiArCQlpZiAobW9kZS0+c3RhdHVzICE9IE1PREVfT0sp
DQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiArCQltb2RlLT5zdGF0dXMgPSBkcm1fbW9kZV92
YWxpZGF0ZV9mbGFnKG1vZGUsIG1vZGVfZmxhZ3MpOw0KPiArCQlpZiAobW9kZS0+c3RhdHVz
ICE9IE1PREVfT0spDQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiArCQlyZXQgPSBkcm1fbW9k
ZV92YWxpZGF0ZV9waXBlbGluZShtb2RlLCBjb25uZWN0b3IsIGN0eCwNCj4gKwkJCQkJCSAm
bW9kZS0+c3RhdHVzKTsNCj4gKwkJaWYgKHJldCkgew0KPiArCQkJZHJtX2RiZ19rbXMoZGV2
LA0KPiArCQkJCSAgICAiZHJtX21vZGVfdmFsaWRhdGVfcGlwZWxpbmUgZmFpbGVkOiAlZFxu
IiwNCj4gKwkJCQkgICAgcmV0KTsNCj4gKw0KPiArCQkJaWYgKGRybV9XQVJOX09OX09OQ0Uo
ZGV2LCByZXQgIT0gLUVERUFETEspKQ0KPiArCQkJCW1vZGUtPnN0YXR1cyA9IE1PREVfRVJS
T1I7DQo+ICsJCQllbHNlDQo+ICsJCQkJcmV0dXJuIC1FREVBRExLOw0KPiArCQl9DQo+ICsN
Cj4gKwkJaWYgKG1vZGUtPnN0YXR1cyAhPSBNT0RFX09LKQ0KPiArCQkJY29udGludWU7DQo+
ICsJCW1vZGUtPnN0YXR1cyA9IGRybV9tb2RlX3ZhbGlkYXRlX3ljYmNyNDIwKG1vZGUsIGNv
bm5lY3Rvcik7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gICAv
KioNCj4gICAgKiBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMgLSBn
ZXQgY29tcGxldGUgc2V0IG9mIGRpc3BsYXkgbW9kZXMNCj4gICAgKiBAY29ubmVjdG9yOiBj
b25uZWN0b3IgdG8gcHJvYmUNCj4gQEAgLTQyMSw3ICs0NzYsNiBAQCBpbnQgZHJtX2hlbHBl
cl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsDQo+ICAgCWNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyAqY29ubmVjdG9yX2Z1bmNzID0NCj4gICAJCWNvbm5lY3Rvci0+aGVscGVyX3ByaXZhdGU7
DQo+ICAgCWludCBjb3VudCA9IDAsIHJldDsNCj4gLQlpbnQgbW9kZV9mbGFncyA9IDA7DQo+
ICAgCWJvb2wgdmVyYm9zZV9wcnVuZSA9IHRydWU7DQo+ICAgCWVudW0gZHJtX2Nvbm5lY3Rv
cl9zdGF0dXMgb2xkX3N0YXR1czsNCj4gICAJc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVf
Y3R4IGN0eDsNCj4gQEAgLTUxOSw1MiArNTczLDEzIEBAIGludCBkcm1faGVscGVyX3Byb2Jl
X3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwNCj4gICAJCQkgICBjb25uZWN0b3ItPnN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX3Vu
a25vd24pKQ0KPiAgIAkJY291bnQgPSBkcm1fYWRkX21vZGVzX25vZWRpZChjb25uZWN0b3Is
IDEwMjQsIDc2OCk7DQo+ICAgCWNvdW50ICs9IGRybV9oZWxwZXJfcHJvYmVfYWRkX2NtZGxp
bmVfbW9kZShjb25uZWN0b3IpOw0KPiAtCWlmIChjb3VudCA9PSAwKQ0KPiAtCQlnb3RvIHBy
dW5lOw0KPiAtDQo+IC0JZHJtX2Nvbm5lY3Rvcl9saXN0X3VwZGF0ZShjb25uZWN0b3IpOw0K
PiAtDQo+IC0JaWYgKGNvbm5lY3Rvci0+aW50ZXJsYWNlX2FsbG93ZWQpDQo+IC0JCW1vZGVf
ZmxhZ3MgfD0gRFJNX01PREVfRkxBR19JTlRFUkxBQ0U7DQo+IC0JaWYgKGNvbm5lY3Rvci0+
ZG91Ymxlc2Nhbl9hbGxvd2VkKQ0KPiAtCQltb2RlX2ZsYWdzIHw9IERSTV9NT0RFX0ZMQUdf
REJMU0NBTjsNCj4gLQlpZiAoY29ubmVjdG9yLT5zdGVyZW9fYWxsb3dlZCkNCj4gLQkJbW9k
ZV9mbGFncyB8PSBEUk1fTU9ERV9GTEFHXzNEX01BU0s7DQo+IC0NCj4gLQlsaXN0X2Zvcl9l
YWNoX2VudHJ5KG1vZGUsICZjb25uZWN0b3ItPm1vZGVzLCBoZWFkKSB7DQo+IC0JCWlmICht
b2RlLT5zdGF0dXMgIT0gTU9ERV9PSykNCj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCW1v
ZGUtPnN0YXR1cyA9IGRybV9tb2RlX3ZhbGlkYXRlX2RyaXZlcihkZXYsIG1vZGUpOw0KPiAt
CQlpZiAobW9kZS0+c3RhdHVzICE9IE1PREVfT0spDQo+IC0JCQljb250aW51ZTsNCj4gLQ0K
PiAtCQltb2RlLT5zdGF0dXMgPSBkcm1fbW9kZV92YWxpZGF0ZV9zaXplKG1vZGUsIG1heFgs
IG1heFkpOw0KPiAtCQlpZiAobW9kZS0+c3RhdHVzICE9IE1PREVfT0spDQo+IC0JCQljb250
aW51ZTsNCj4gLQ0KPiAtCQltb2RlLT5zdGF0dXMgPSBkcm1fbW9kZV92YWxpZGF0ZV9mbGFn
KG1vZGUsIG1vZGVfZmxhZ3MpOw0KPiAtCQlpZiAobW9kZS0+c3RhdHVzICE9IE1PREVfT0sp
DQo+IC0JCQljb250aW51ZTsNCj4gLQ0KPiAtCQlyZXQgPSBkcm1fbW9kZV92YWxpZGF0ZV9w
aXBlbGluZShtb2RlLCBjb25uZWN0b3IsICZjdHgsDQo+IC0JCQkJCQkgJm1vZGUtPnN0YXR1
cyk7DQo+IC0JCWlmIChyZXQpIHsNCj4gLQkJCWRybV9kYmdfa21zKGRldiwNCj4gLQkJCQkg
ICAgImRybV9tb2RlX3ZhbGlkYXRlX3BpcGVsaW5lIGZhaWxlZDogJWRcbiIsDQo+IC0JCQkJ
ICAgIHJldCk7DQo+IC0NCj4gLQkJCWlmIChkcm1fV0FSTl9PTl9PTkNFKGRldiwgcmV0ICE9
IC1FREVBRExLKSkgew0KPiAtCQkJCW1vZGUtPnN0YXR1cyA9IE1PREVfRVJST1I7DQo+IC0J
CQl9IGVsc2Ugew0KPiAtCQkJCWRybV9tb2Rlc2V0X2JhY2tvZmYoJmN0eCk7DQo+IC0JCQkJ
Z290byByZXRyeTsNCj4gLQkJCX0NCj4gKwlpZiAoY291bnQgIT0gMCkgew0KPiArCQlyZXQg
PSBfX2RybV9oZWxwZXJfdXBkYXRlX2FuZF92YWxpZGF0ZShjb25uZWN0b3IsIG1heFgsIG1h
eFksICZjdHgpOw0KPiArCQlpZiAocmV0ID09IC1FREVBRExLKSB7DQo+ICsJCQlkcm1fbW9k
ZXNldF9iYWNrb2ZmKCZjdHgpOw0KPiArCQkJZ290byByZXRyeTsNCj4gICAJCX0NCj4gLQ0K
PiAtCQlpZiAobW9kZS0+c3RhdHVzICE9IE1PREVfT0spDQo+IC0JCQljb250aW51ZTsNCj4g
LQkJbW9kZS0+c3RhdHVzID0gZHJtX21vZGVfdmFsaWRhdGVfeWNiY3I0MjAobW9kZSwgY29u
bmVjdG9yKTsNCj4gKwkJV0FSTl9PTihyZXQpOw0KDQpPbmUgbW9yZSB0aGluZy4gQUZBSUNU
IHlvdSBhbHJlYWR5IHdhcm5lZCBpbiANCl9fZHJtX2hlbHBlcl91cGRhdGVfYW5kX3ZhbGlk
YXRlKCkgYWJvdXQgdGhlIGVycm9yLCBzbyB0aGlzIFdBUk5fT04gDQpzaG91bGQgYmUgcmVt
b3ZlZC4NCg0KV2l0aCB0aGF0IGNoYW5nZToNCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQoNCj4gICAJfQ0KPiAgIA0KPiAgIHBydW5lOg0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------SAC53mZPu0Bys1bhDVPWOgg3--

--------------Vi6bEJo5912Vd6sf0kbdE0kd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ7ZmEFAwAAAAAACgkQlh/E3EQov+DT
kQ/+P7fo8lumHbOfDjHHhUBPiQ68klIuZVK4/G28HqwJFMAgdZ+J9YEuh6glXF49ahWlfwv8R41M
6qwhyfGoxrinSHhCk4NyrD8Kj4ck4IbRpURP2m4u3iSn4S7+Q2URTn1+NpLeWYefTjP1bxNa2fMs
bfbg+wtd+KqBl1+0LRc66+IRkQTdokI4QcESBvFPcz335aOfuHzt3gzKRgHAeX1AYKJjyjtGAtmT
o+hVbdnO+VfZNch+16mqs1sB87Zq4zC7GCR+z80gzWVlvSPhWR4bFc69MRfqB2ShK411on34Ygex
UxnYFts5Sp893AM/QdetLkLJcmUnAfYDCJ2Ha2T7R1RK5nvDlAdGfl7cOru4YvB/7VlSWqeyYFa+
NUbfOatucatJIInU0ii0cLLP42zYTgVosvNPvL84i+aCo4sllWEmUhXrmtyb9OJPzCf9/3t86VPY
jRN/cUYCwGf5CMOsQEkdjUA9MGmKo64IVPYrXyLr69ISzTb4f59DpSIxHb4EdPIvYsx/JMgCGeCa
dFND0++YgvNgPuJR3PXh9f2FV+N39kdvQT8NjrxE0G7Wb6ZsNVzkfmTygO8WkHpp/8gMxkf0a/iD
c4YlajvPJCYFciLircu22ttRjDOeDP0fGuJUCLGrezdumgKPzrC5nmBg64F4xng1dgALdAqmc+VI
UjA=
=4pCR
-----END PGP SIGNATURE-----

--------------Vi6bEJo5912Vd6sf0kbdE0kd--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B751C798
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451EF10E9FC;
	Thu,  5 May 2022 18:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABD310E9FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 18:34:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7B5A51F8D0;
 Thu,  5 May 2022 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651775669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a/FDtzVo54pXU0gESSj26SSwrG94fNo021bRyTX+A3k=;
 b=1F9xmGU8mi38n2qsqmP+U2Li8n9MNNkqef32m4DudMVBYZuU2owl3cwzuBkgOw1GYY0V3y
 4Sah2K+jlLy1bpZHfPP8LA05KNksOebkeS/MqbpE484Tdo8K6fBCujjffhHIVNe8TI2h57
 cUHNXH6hprmnpMFgHgNFN+UIUhynE3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651775669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a/FDtzVo54pXU0gESSj26SSwrG94fNo021bRyTX+A3k=;
 b=HIznE7wdpzarMMCgElyhzSrNA5djBc96qRHonsFvHT4EYq0BxwbX3JAW8WJ6L3szGiyy4I
 b+HrFhfQGh2IJhCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B43F13A65;
 Thu,  5 May 2022 18:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id po4BDbUYdGLtFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 18:34:29 +0000
Message-ID: <a0342c52-6d39-cf16-632a-f45ff051210c@suse.de>
Date: Thu, 5 May 2022 20:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uvArjD8BBk0l8XSeSfNnFgOh"
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
Cc: quic_sbillaka@quicinc.com, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uvArjD8BBk0l8XSeSfNnFgOh
Content-Type: multipart/mixed; boundary="------------z9oIwSGpdljbtuDoAMPor8oJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: quic_sbillaka@quicinc.com, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, linux-kernel@vger.kernel.org
Message-ID: <a0342c52-6d39-cf16-632a-f45ff051210c@suse.de>
Subject: Re: [PATCH 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
In-Reply-To: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>

--------------z9oIwSGpdljbtuDoAMPor8oJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjIgdW0gMjA6NDYgc2NocmllYiBEb3VnbGFzIEFuZGVyc29uOg0K
PiBUaGUgZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzKCkgaXMgYSBi
aXQgbG9uZy4gTGV0J3MNCj4gYnJlYWsgYSBjaHVuayBvZmYgdG8gdXBkYXRlIGFuZCB2YWxp
ZGF0ZSBtb2Rlcy4gVGhpcyBoZWxwcyBhdm9pZCBvbmUNCj4gZ290byBhbmQgYWxzbyB3aWxs
IGFsbG93IHVzIHRvIG1vcmUgZWFzaWx5IGNhbGwgdGhlIGhlbHBlciBhIHNlY29uZA0KPiB0
aW1lIGluIGEgZnV0dXJlIHBhdGNoIHdpdGhvdXQgYWRkaW5nIGxvb3Bpbmcgb3IgYW5vdGhl
ciBnb3RvLg0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgaW50ZW5kZWQgdG8gYmUgYSBuby1vcCBj
aGFuZ2UtLWp1c3QgY29kZSBtb3ZlbWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERvdWds
YXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4NCg0KDQo+IC0tLQ0KPiANCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jIHwgMTA1ICsrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMo
KyksIDQ2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJvYmVfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBl
ci5jDQo+IGluZGV4IDY4MjM1OTUxMjk5Ni4uODE5MjI1NjI5MDEwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMNCj4gQEAgLTM1NCw2ICszNTQsNjEgQEAgZHJt
X2hlbHBlcl9wcm9iZV9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwN
Cj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChkcm1faGVscGVyX3Byb2JlX2RldGVjdCk7DQo+
ICAgDQo+ICtzdGF0aWMgYm9vbCBfZHJtX2hlbHBlcl91cGRhdGVfYW5kX3ZhbGlkYXRlKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQoNCkFGQUlLIGNvbnZlbnRpb24gaXMg
dG8gdXNlIHR3byB1bmRlcnNjb3JlcyBmb3IgaW50ZXJuYWwgbmFtZXMuDQoNCj4gKwkJCQkJ
ICAgIHVpbnQzMl90IG1heFgsIHVpbnQzMl90IG1heFksDQo+ICsJCQkJCSAgICBzdHJ1Y3Qg
ZHJtX21vZGVzZXRfYWNxdWlyZV9jdHggKmN0eCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2ID0gY29ubmVjdG9yLT5kZXY7DQo+ICsJc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgKm1vZGU7DQo+ICsJaW50IG1vZGVfZmxhZ3MgPSAwOw0KPiArCWludCByZXQ7DQo+ICsN
Cj4gKwlkcm1fY29ubmVjdG9yX2xpc3RfdXBkYXRlKGNvbm5lY3Rvcik7DQo+ICsNCj4gKwlp
ZiAoY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCkNCj4gKwkJbW9kZV9mbGFncyB8PSBE
Uk1fTU9ERV9GTEFHX0lOVEVSTEFDRTsNCj4gKwlpZiAoY29ubmVjdG9yLT5kb3VibGVzY2Fu
X2FsbG93ZWQpDQo+ICsJCW1vZGVfZmxhZ3MgfD0gRFJNX01PREVfRkxBR19EQkxTQ0FOOw0K
PiArCWlmIChjb25uZWN0b3ItPnN0ZXJlb19hbGxvd2VkKQ0KPiArCQltb2RlX2ZsYWdzIHw9
IERSTV9NT0RFX0ZMQUdfM0RfTUFTSzsNCj4gKw0KPiArCWxpc3RfZm9yX2VhY2hfZW50cnko
bW9kZSwgJmNvbm5lY3Rvci0+bW9kZXMsIGhlYWQpIHsNCj4gKwkJaWYgKG1vZGUtPnN0YXR1
cyAhPSBNT0RFX09LKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJbW9kZS0+c3RhdHVz
ID0gZHJtX21vZGVfdmFsaWRhdGVfZHJpdmVyKGRldiwgbW9kZSk7DQo+ICsJCWlmIChtb2Rl
LT5zdGF0dXMgIT0gTU9ERV9PSykNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCW1vZGUt
PnN0YXR1cyA9IGRybV9tb2RlX3ZhbGlkYXRlX3NpemUobW9kZSwgbWF4WCwgbWF4WSk7DQo+
ICsJCWlmIChtb2RlLT5zdGF0dXMgIT0gTU9ERV9PSykNCj4gKwkJCWNvbnRpbnVlOw0KPiAr
DQo+ICsJCW1vZGUtPnN0YXR1cyA9IGRybV9tb2RlX3ZhbGlkYXRlX2ZsYWcobW9kZSwgbW9k
ZV9mbGFncyk7DQo+ICsJCWlmIChtb2RlLT5zdGF0dXMgIT0gTU9ERV9PSykNCj4gKwkJCWNv
bnRpbnVlOw0KPiArDQo+ICsJCXJldCA9IGRybV9tb2RlX3ZhbGlkYXRlX3BpcGVsaW5lKG1v
ZGUsIGNvbm5lY3RvciwgY3R4LA0KPiArCQkJCQkJICZtb2RlLT5zdGF0dXMpOw0KPiArCQlp
ZiAocmV0KSB7DQo+ICsJCQlkcm1fZGJnX2ttcyhkZXYsDQo+ICsJCQkJICAgICJkcm1fbW9k
ZV92YWxpZGF0ZV9waXBlbGluZSBmYWlsZWQ6ICVkXG4iLA0KPiArCQkJCSAgICByZXQpOw0K
PiArDQo+ICsJCQlpZiAoZHJtX1dBUk5fT05fT05DRShkZXYsIHJldCAhPSAtRURFQURMSykp
DQo+ICsJCQkJbW9kZS0+c3RhdHVzID0gTU9ERV9FUlJPUjsNCj4gKwkJCWVsc2UNCj4gKwkJ
CQlyZXR1cm4gdHJ1ZTsNCg0KUmV0dXJuaW5nIHRydWUgaXMgbm9uLWludHVpdGl2ZS4gSXQg
bG9va3MgYXMgaWYgd2UgcmVwb3J0IHN1Y2Nlc3Mgd2hlbiANCml0IGFjdHVhbGx5IHNpZ25h
bHMgYSByZXRyeS4NCg0KSSBzdWdnZXN0IHRvIHJldHVybiAncmV0JyBoZXJlIGFuZCBsZXQg
dGhlIGNhbGxlciBkZWNpZGUuIE9uIHN1Y2Nlc3MgYXQgDQp0aGUgZW5kIG9mIHRoZSBmdW5j
dGlvbiwgaXQgd291bGQgcmV0dXJuIDAgYXMgdXN1YWwuDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gKwkJfQ0KPiArDQo+ICsJCWlmIChtb2RlLT5zdGF0dXMgIT0gTU9ERV9PSykN
Cj4gKwkJCWNvbnRpbnVlOw0KPiArCQltb2RlLT5zdGF0dXMgPSBkcm1fbW9kZV92YWxpZGF0
ZV95Y2JjcjQyMChtb2RlLCBjb25uZWN0b3IpOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiBm
YWxzZTsNCj4gK30NCj4gKw0KPiAgIC8qKg0KPiAgICAqIGRybV9oZWxwZXJfcHJvYmVfc2lu
Z2xlX2Nvbm5lY3Rvcl9tb2RlcyAtIGdldCBjb21wbGV0ZSBzZXQgb2YgZGlzcGxheSBtb2Rl
cw0KPiAgICAqIEBjb25uZWN0b3I6IGNvbm5lY3RvciB0byBwcm9iZQ0KPiBAQCAtNDIxLDcg
KzQ3Niw2IEBAIGludCBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gICAJY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzICpjb25uZWN0b3JfZnVuY3MgPQ0KPiAgIAkJY29u
bmVjdG9yLT5oZWxwZXJfcHJpdmF0ZTsNCj4gICAJaW50IGNvdW50ID0gMCwgcmV0Ow0KPiAt
CWludCBtb2RlX2ZsYWdzID0gMDsNCj4gICAJYm9vbCB2ZXJib3NlX3BydW5lID0gdHJ1ZTsN
Cj4gICAJZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBvbGRfc3RhdHVzOw0KPiAgIAlzdHJ1
Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9jdHggY3R4Ow0KPiBAQCAtNTE5LDUyICs1NzMsMTEg
QEAgaW50IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgIAkJCSAgIGNvbm5lY3Rvci0+c3RhdHVz
ID09IGNvbm5lY3Rvcl9zdGF0dXNfdW5rbm93bikpDQo+ICAgCQljb3VudCA9IGRybV9hZGRf
bW9kZXNfbm9lZGlkKGNvbm5lY3RvciwgMTAyNCwgNzY4KTsNCj4gICAJY291bnQgKz0gZHJt
X2hlbHBlcl9wcm9iZV9hZGRfY21kbGluZV9tb2RlKGNvbm5lY3Rvcik7DQo+IC0JaWYgKGNv
dW50ID09IDApDQo+IC0JCWdvdG8gcHJ1bmU7DQo+IC0NCj4gLQlkcm1fY29ubmVjdG9yX2xp
c3RfdXBkYXRlKGNvbm5lY3Rvcik7DQo+IC0NCj4gLQlpZiAoY29ubmVjdG9yLT5pbnRlcmxh
Y2VfYWxsb3dlZCkNCj4gLQkJbW9kZV9mbGFncyB8PSBEUk1fTU9ERV9GTEFHX0lOVEVSTEFD
RTsNCj4gLQlpZiAoY29ubmVjdG9yLT5kb3VibGVzY2FuX2FsbG93ZWQpDQo+IC0JCW1vZGVf
ZmxhZ3MgfD0gRFJNX01PREVfRkxBR19EQkxTQ0FOOw0KPiAtCWlmIChjb25uZWN0b3ItPnN0
ZXJlb19hbGxvd2VkKQ0KPiAtCQltb2RlX2ZsYWdzIHw9IERSTV9NT0RFX0ZMQUdfM0RfTUFT
SzsNCj4gLQ0KPiAtCWxpc3RfZm9yX2VhY2hfZW50cnkobW9kZSwgJmNvbm5lY3Rvci0+bW9k
ZXMsIGhlYWQpIHsNCj4gLQkJaWYgKG1vZGUtPnN0YXR1cyAhPSBNT0RFX09LKQ0KPiAtCQkJ
Y29udGludWU7DQo+IC0NCj4gLQkJbW9kZS0+c3RhdHVzID0gZHJtX21vZGVfdmFsaWRhdGVf
ZHJpdmVyKGRldiwgbW9kZSk7DQo+IC0JCWlmIChtb2RlLT5zdGF0dXMgIT0gTU9ERV9PSykN
Cj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCW1vZGUtPnN0YXR1cyA9IGRybV9tb2RlX3Zh
bGlkYXRlX3NpemUobW9kZSwgbWF4WCwgbWF4WSk7DQo+IC0JCWlmIChtb2RlLT5zdGF0dXMg
IT0gTU9ERV9PSykNCj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCW1vZGUtPnN0YXR1cyA9
IGRybV9tb2RlX3ZhbGlkYXRlX2ZsYWcobW9kZSwgbW9kZV9mbGFncyk7DQo+IC0JCWlmICht
b2RlLT5zdGF0dXMgIT0gTU9ERV9PSykNCj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCXJl
dCA9IGRybV9tb2RlX3ZhbGlkYXRlX3BpcGVsaW5lKG1vZGUsIGNvbm5lY3RvciwgJmN0eCwN
Cj4gLQkJCQkJCSAmbW9kZS0+c3RhdHVzKTsNCj4gLQkJaWYgKHJldCkgew0KPiAtCQkJZHJt
X2RiZ19rbXMoZGV2LA0KPiAtCQkJCSAgICAiZHJtX21vZGVfdmFsaWRhdGVfcGlwZWxpbmUg
ZmFpbGVkOiAlZFxuIiwNCj4gLQkJCQkgICAgcmV0KTsNCj4gLQ0KPiAtCQkJaWYgKGRybV9X
QVJOX09OX09OQ0UoZGV2LCByZXQgIT0gLUVERUFETEspKSB7DQo+IC0JCQkJbW9kZS0+c3Rh
dHVzID0gTU9ERV9FUlJPUjsNCj4gLQkJCX0gZWxzZSB7DQo+IC0JCQkJZHJtX21vZGVzZXRf
YmFja29mZigmY3R4KTsNCj4gLQkJCQlnb3RvIHJldHJ5Ow0KPiAtCQkJfQ0KPiArCWlmIChj
b3VudCAhPSAwKSB7DQo+ICsJCWlmIChfZHJtX2hlbHBlcl91cGRhdGVfYW5kX3ZhbGlkYXRl
KGNvbm5lY3RvciwgbWF4WCwgbWF4WSwgJmN0eCkpIHsNCj4gKwkJCWRybV9tb2Rlc2V0X2Jh
Y2tvZmYoJmN0eCk7DQo+ICsJCQlnb3RvIHJldHJ5Ow0KPiAgIAkJfQ0KPiAtDQo+IC0JCWlm
IChtb2RlLT5zdGF0dXMgIT0gTU9ERV9PSykNCj4gLQkJCWNvbnRpbnVlOw0KPiAtCQltb2Rl
LT5zdGF0dXMgPSBkcm1fbW9kZV92YWxpZGF0ZV95Y2JjcjQyMChtb2RlLCBjb25uZWN0b3Ip
Ow0KPiAgIAl9DQo+ICAgDQo+ICAgcHJ1bmU6DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------z9oIwSGpdljbtuDoAMPor8oJ--

--------------uvArjD8BBk0l8XSeSfNnFgOh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ0GLQFAwAAAAAACgkQlh/E3EQov+Dm
Xw//ekn/CghDX1nF3tDJlSHHynP85U/OAl8Cd8yTePQ+JhcG6WKo44OFkcFTZxX1E/QolpVxrKGJ
2SQ1H0mTWoJIN5lPiCvXzWOJmzRF12EFdJ+WDszSw7NC7j7FeiQZJfWKyUSRWZ+ccjG3rlWv5FMx
BwBOBcVysIO9mqKrqEYf2pFRIuYJ3/hDgVNF/g7MWNFIbRdp+RKZe4hM3YeviP724GvZaOQRBpNe
9/sZGs5yL4MQJ9lNb+oUfZKgeLjRdGXStHdrucgUhBWrBBVahVQfkG/NyEPMfekv5SRSL2Rf0F5Z
ROfS6cStzTIVXS+hNt/7n7Eg3rgiUtvRWrB9+W1z1YbqPonZFd42zbNBiSO0vNAzkiqLjPv8jCTk
4X+fOg/pbrqc2v2aJYUia2CGw7AvuLGyTZeTe8KCwA4ZB83B8nx1VmWfHIiu8XqPfPHS1Rqty8/r
syP+n9wqrTm9HlcHoPm8R55SXsLJ0kO03DPXl+qqV76mC+2XC7N2oVEn8eGROEKY7oyf7AxDXX8Y
uRKEUzqsYxTdI58Ng1Nhe2+77SEvcncegaoNvqDx5+Hfc746e1wjdEmY0VQLvTcWVQNgY9JTyOG1
xiblvPlJ0llOhviy04n7oYPYIZZE8hKjBF8EwB59ArQNgx+RJU5xJTN43mVy9YBlBMPijEiqfwRG
bDo=
=h727
-----END PGP SIGNATURE-----

--------------uvArjD8BBk0l8XSeSfNnFgOh--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078AC587E04
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 16:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967B72B6A9;
	Tue,  2 Aug 2022 14:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778812B4B4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 14:16:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C68620745;
 Tue,  2 Aug 2022 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659449790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hqIXXIjkzKIiChD1vib17RT/i1XXchs1//B4KS7QkY=;
 b=Mwuz5FoSyqSTQwHu2+PwQOkK+FJcyvPSlXYzDn6Jq2QVY0+GsB3bFjzOK2weVuLao3zdo/
 7z+nl0ZoJihowvIx3tFUsuztWW+uiBTrXqta9gCXw35HWiiNl4peJFiEmYXXtPTBc41N+7
 bDy/SuLNwTLgI2fBfZRmyVa5AATcVAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659449790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hqIXXIjkzKIiChD1vib17RT/i1XXchs1//B4KS7QkY=;
 b=J2BKW+RATkdWfndCmDHavB5dNB+jhFEZp3bi31waUMzdTjU1JsL5qGFOpIUuJ0ilFNMo9A
 IxnHq/bDOuUNBYCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF80C13A8E;
 Tue,  2 Aug 2022 14:16:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dpaUNb0x6WK/bwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Aug 2022 14:16:29 +0000
Message-ID: <46871a84-3b17-5474-9608-cfbe7e6f4c7f@suse.de>
Date: Tue, 2 Aug 2022 16:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <8735eeg31e.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8735eeg31e.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VnrWjhcWS3G28LQKelmyUyjm"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VnrWjhcWS3G28LQKelmyUyjm
Content-Type: multipart/mixed; boundary="------------m8yNS0SvmcSq6ivZZieDfWac";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <46871a84-3b17-5474-9608-cfbe7e6f4c7f@suse.de>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <8735eeg31e.fsf@intel.com>
In-Reply-To: <8735eeg31e.fsf@intel.com>

--------------m8yNS0SvmcSq6ivZZieDfWac
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDguMjIgdW0gMTU6NTggc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
RnJpLCAyOSBKdWwgMjAyMiwgTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdy
b3RlOg0KPj4gTXVsdGlwbGUgZHJpdmVycyAobWVzb24sIHZjNCkgZGVmaW5lIHRoZSBhbmFs
b2cgVFYgNTI1LWxpbmVzIGFuZCA2MjUtbGluZXMNCj4+IG1vZGVzIGluIHRoZSBkcml2ZXJz
Lg0KPj4NCj4+IFNpbmNlIHRob3NlIG1vZGVzIGFyZSBmYWlybHkgc3RhbmRhcmRzLCBhbmQg
dGhhdCB3ZSdsbCBuZWVkIHRvIHVzZSB0aGVtIGluDQo+PiBtb3JlIHBsYWNlcyBpbiB0aGUg
ZnV0dXJlLCBsZXQncyBtb3ZlIHRoZSBtZXNvbiBkZWZpbml0aW9uIGludG8gdGhlDQo+PiBm
cmFtZXdvcmsuDQo+IA0KPiBJIHRoaW5rIHlvdSBzaG91bGQgYWx3YXlzIGV4cG9zZSBpbnRl
cmZhY2VzLCBub3QgZGF0YS4gRGF0YSBpcyBub3QgYW4NCj4gaW50ZXJmYWNlLCBhbmQgSSB0
aGluayB0aGlzIHNldHMgYSBiYWQgZXhhbXBsZSB0aGF0IHdpbGwgYmUgY2FyZ28NCj4gY3Vs
dGVkLg0KDQpBbHRob3VnaCBJIHdyb3RlIHRoZSBvcHBvc2l0ZSB3cnQgcGF0Y2ggOCwgSSBh
Z3JlZSB3aXRoIEphbmkgaGVyZSB3aGVuIA0KaXQgY29tZXMgdG8gJ29mZmljaWFsJyBpbnRl
cmZhY2VzLiBUaGUgY2FzZXMgSSd2ZSBzZWVuIG9mIGV4cG9ydGVkIGRhdGEgDQpzdHJ1Y3R1
cmVzIG9mdGVuIGxlYWQgdG8gaW50cmFuc3BhcmVudCBjb2RlLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiANCj4gQlIsDQo+IEphbmkuDQo+IA0KPj4NCj4+IFRoZSBtZXNv
biBvbmUgd2FzIGNob3NlbiBiZWNhdXNlIHZjNCdzIGlzbid0IGFjY3VyYXRlIGFuZCBkb2Vz
bid0IGFtb3VudCB0bw0KPj4gNTI1IGFuZCA2MjUgbGluZXMuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+DQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZXMuYw0KPj4gaW5kZXggMzA0MDA0ZmI4MGFhLi5hNGMxYmQ2ODgzMzggMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMNCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbW9kZXMuYw0KPj4gQEAgLTQ4LDYgKzQ4LDI0IEBADQo+PiAgIA0K
Pj4gICAjaW5jbHVkZSAiZHJtX2NydGNfaW50ZXJuYWwuaCINCj4+ICAgDQo+PiArY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgZHJtX21vZGVfNDgwaSA9IHsNCj4+ICsJRFJNX01P
REUoIjcyMHg0ODBpIiwgRFJNX01PREVfVFlQRV9EUklWRVIsIDEzNTAwLA0KPj4gKwkJIDcy
MCwgNzM5LCA4MDEsIDg1OCwgMCwNCj4+ICsJCSA0ODAsIDQ4OCwgNDk0LCA1MjUsIDAsDQo+
PiArCQkgRFJNX01PREVfRkxBR19JTlRFUkxBQ0UpLA0KPj4gKwkucGljdHVyZV9hc3BlY3Rf
cmF0aW8gPSBIRE1JX1BJQ1RVUkVfQVNQRUNUXzRfMywNCj4+ICt9Ow0KPj4gK0VYUE9SVF9T
WU1CT0xfR1BMKGRybV9tb2RlXzQ4MGkpOw0KPj4gKw0KPj4gK2NvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIGRybV9tb2RlXzU3NmkgPSB7DQo+PiArCURSTV9NT0RFKCI3MjB4NTc2
aSIsIERSTV9NT0RFX1RZUEVfRFJJVkVSLCAxMzUwMCwNCj4+ICsJCSA3MjAsIDczMiwgNzk1
LCA4NjQsIDAsDQo+PiArCQkgNTc2LCA1ODAsIDU4NiwgNjI1LCAwLA0KPj4gKwkJIERSTV9N
T0RFX0ZMQUdfSU5URVJMQUNFKSwNCj4+ICsJLnBpY3R1cmVfYXNwZWN0X3JhdGlvID0gSERN
SV9QSUNUVVJFX0FTUEVDVF80XzMsDQo+PiArfTsNCj4+ICtFWFBPUlRfU1lNQk9MX0dQTChk
cm1fbW9kZV81NzZpKTsNCj4+ICsNCj4+ICAgLyoqDQo+PiAgICAqIGRybV9tb2RlX2RlYnVn
X3ByaW50bW9kZWxpbmUgLSBwcmludCBhIG1vZGUgdG8gZG1lc2cNCj4+ICAgICogQG1vZGU6
IG1vZGUgdG8gcHJpbnQNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fZW5jb2Rlcl9jdmJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5j
b2Rlcl9jdmJzLmMNCj4+IGluZGV4IDgxMTBhNmUzOTMyMC4uOThlYzNlNTYzMTU1IDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfY3Zicy5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9jdmJzLmMN
Cj4+IEBAIC00NSwyMSArNDUsMTEgQEAgc3RydWN0IG1lc29uX2VuY29kZXJfY3ZicyB7DQo+
PiAgIHN0cnVjdCBtZXNvbl9jdmJzX21vZGUgbWVzb25fY3Zic19tb2Rlc1tNRVNPTl9DVkJT
X01PREVTX0NPVU5UXSA9IHsNCj4+ICAgCXsgLyogUEFMICovDQo+PiAgIAkJLmVuY2kgPSAm
bWVzb25fY3Zic19lbmNpX3BhbCwNCj4+IC0JCS5tb2RlID0gew0KPj4gLQkJCURSTV9NT0RF
KCI3MjB4NTc2aSIsIERSTV9NT0RFX1RZUEVfRFJJVkVSLCAxMzUwMCwNCj4+IC0JCQkJIDcy
MCwgNzMyLCA3OTUsIDg2NCwgMCwgNTc2LCA1ODAsIDU4NiwgNjI1LCAwLA0KPj4gLQkJCQkg
RFJNX01PREVfRkxBR19JTlRFUkxBQ0UpLA0KPj4gLQkJCS5waWN0dXJlX2FzcGVjdF9yYXRp
byA9IEhETUlfUElDVFVSRV9BU1BFQ1RfNF8zLA0KPj4gLQkJfSwNCj4+ICsJCS5tb2RlID0g
JmRybV9tb2RlXzU3NmksDQo+PiAgIAl9LA0KPj4gICAJeyAvKiBOVFNDICovDQo+PiAgIAkJ
LmVuY2kgPSAmbWVzb25fY3Zic19lbmNpX250c2MsDQo+PiAtCQkubW9kZSA9IHsNCj4+IC0J
CQlEUk1fTU9ERSgiNzIweDQ4MGkiLCBEUk1fTU9ERV9UWVBFX0RSSVZFUiwgMTM1MDAsDQo+
PiAtCQkJCTcyMCwgNzM5LCA4MDEsIDg1OCwgMCwgNDgwLCA0ODgsIDQ5NCwgNTI1LCAwLA0K
Pj4gLQkJCQlEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSksDQo+PiAtCQkJLnBpY3R1cmVfYXNw
ZWN0X3JhdGlvID0gSERNSV9QSUNUVVJFX0FTUEVDVF80XzMsDQo+PiAtCQl9LA0KPj4gKwkJ
Lm1vZGUgPSAmZHJtX21vZGVfNDgwaSwNCj4+ICAgCX0sDQo+PiAgIH07DQo+PiAgIA0KPj4g
QEAgLTcxLDcgKzYxLDcgQEAgbWVzb25fY3Zic19nZXRfbW9kZShjb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqcmVxX21vZGUpDQo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgTUVTT05f
Q1ZCU19NT0RFU19DT1VOVDsgKytpKSB7DQo+PiAgIAkJc3RydWN0IG1lc29uX2N2YnNfbW9k
ZSAqbWVzb25fbW9kZSA9ICZtZXNvbl9jdmJzX21vZGVzW2ldOw0KPj4gICANCj4+IC0JCWlm
IChkcm1fbW9kZV9tYXRjaChyZXFfbW9kZSwgJm1lc29uX21vZGUtPm1vZGUsDQo+PiArCQlp
ZiAoZHJtX21vZGVfbWF0Y2gocmVxX21vZGUsIG1lc29uX21vZGUtPm1vZGUsDQo+PiAgIAkJ
CQkgICBEUk1fTU9ERV9NQVRDSF9USU1JTkdTIHwNCj4+ICAgCQkJCSAgIERSTV9NT0RFX01B
VENIX0NMT0NLIHwNCj4+ICAgCQkJCSAgIERSTV9NT0RFX01BVENIX0ZMQUdTIHwNCj4+IEBA
IC0xMDQsNyArOTQsNyBAQCBzdGF0aWMgaW50IG1lc29uX2VuY29kZXJfY3Zic19nZXRfbW9k
ZXMoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4+ICAgCWZvciAoaSA9IDA7IGkgPCBN
RVNPTl9DVkJTX01PREVTX0NPVU5UOyArK2kpIHsNCj4+ICAgCQlzdHJ1Y3QgbWVzb25fY3Zi
c19tb2RlICptZXNvbl9tb2RlID0gJm1lc29uX2N2YnNfbW9kZXNbaV07DQo+PiAgIA0KPj4g
LQkJbW9kZSA9IGRybV9tb2RlX2R1cGxpY2F0ZShwcml2LT5kcm0sICZtZXNvbl9tb2RlLT5t
b2RlKTsNCj4+ICsJCW1vZGUgPSBkcm1fbW9kZV9kdXBsaWNhdGUocHJpdi0+ZHJtLCBtZXNv
bl9tb2RlLT5tb2RlKTsNCj4+ICAgCQlpZiAoIW1vZGUpIHsNCj4+ICAgCQkJZGV2X2Vycihw
cml2LT5kZXYsICJGYWlsZWQgdG8gY3JlYXRlIGEgbmV3IGRpc3BsYXkgbW9kZVxuIik7DQo+
PiAgIAkJCXJldHVybiAwOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl9lbmNvZGVyX2N2YnMuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9l
bmNvZGVyX2N2YnMuaA0KPj4gaW5kZXggNjFkOWQxODNjZTdmLi4yNmNlZmIyMDI5MjQgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9jdmJz
LmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMu
aA0KPj4gQEAgLTE2LDcgKzE2LDcgQEANCj4+ICAgDQo+PiAgIHN0cnVjdCBtZXNvbl9jdmJz
X21vZGUgew0KPj4gICAJc3RydWN0IG1lc29uX2N2YnNfZW5jaV9tb2RlICplbmNpOw0KPj4g
LQlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtb2RlOw0KPj4gKwljb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqbW9kZTsNCj4+ICAgfTsNCj4+ICAgDQo+PiAgICNkZWZpbmUgTUVT
T05fQ1ZCU19NT0RFU19DT1VOVAkyDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X21vZGVzLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaA0KPj4gaW5kZXggYTgwYWU5NjM5
ZTk2Li5iNGE0NDBlMjY4OGMgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9k
ZXMuaA0KPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgNCj4+IEBAIC0zOTQsNiAr
Mzk0LDkgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgew0KPj4gICANCj4+ICAgfTsNCj4+
ICAgDQo+PiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGRybV9tb2Rl
XzQ4MGk7DQo+PiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGRybV9t
b2RlXzU3Nmk7DQo+PiArDQo+PiAgIC8qKg0KPj4gICAgKiBEUk1fTU9ERV9GTVQgLSBwcmlu
dGYgc3RyaW5nIGZvciAmc3RydWN0IGRybV9kaXNwbGF5X21vZGUNCj4+ICAgICovDQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------m8yNS0SvmcSq6ivZZieDfWac--

--------------VnrWjhcWS3G28LQKelmyUyjm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLpMb0FAwAAAAAACgkQlh/E3EQov+A7
RQ//evmPodG5l98UrQGfsW48jNwzYmL+4t4RwbRFnqptpQ0NaCGR55IU9gh4FmUT/oizL9kYp/mn
BJ5EBQfV/ZzCnu0z9NowF2NMCbMbbZpWOkg1zNX6miVIca4s2T1Gz65Jbeu9/XNSeNUp+ITbEaRK
qF4jFyRoZ7z5oXLvziZXWzaJRThN/swMOhQOmK5uo18B4/ZnR3XXtOYbyONOTw1+xf8TIefskpse
x3zCW/W5Ko7AHK6TrBUcHoWLN5B81yFPgLYdvrkuxJRFlixWtZBXQXZmRxLcZRgSzsg8Ah0gWYsp
MRM6XS6luDucRE0PG6wVgbQnOz4enBHk1n3X2EhgprxHBrcr8AdwyCPCssSDyqvpbxWXTws0tkdN
TUKY0dn5yTlJZRY+A3/WtfNhoEgLBPFRch1zUY1RMkMcV8/AsDVWFkaxBIbMVzHG4AP/O6U//V/S
Tx2V3S++lmbCoXmD9sSVW4cTr4drwwjzGCLwDs2skwOylXCOUFO5CXk8thF2bcanRNVE8mwseIbz
aUS5qBS/YF8kHjUPKIvhF1V21gLj3xXxmNrJlAli+8kthB2JxqPUCJjFyJ7AW+Kj7MqMwnsbF17t
HbPQZblhpVlcLoDkCZJm3e1YVO1354LiJPpNhmvA9i8P5bG6xQKLn5+kUAtA4114SXmcckaQP7S/
wak=
=kvU4
-----END PGP SIGNATURE-----

--------------VnrWjhcWS3G28LQKelmyUyjm--

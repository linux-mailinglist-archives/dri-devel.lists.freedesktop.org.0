Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9C67EF218
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 12:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988A810E74A;
	Fri, 17 Nov 2023 11:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0D110E74A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:48:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8242A2050E;
 Fri, 17 Nov 2023 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700221679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zyGLwxgBsOJpwRJp0a5ctFaAMjw9Mcs+nhVUk/wv8tI=;
 b=mtB6LuqjzcPNyvJ1cWZ9ewOckmuXXpcSqbq9l9QuLSts4/KIgrqs2iSMceoHcGdaH1/vuw
 RJoP9haPvEeulSGfHUky/+9HFm8jRcAak7kWQhATWRInLCDkknU/pm3jgh6uOLiFRfP66H
 JztaU8pinLZ7ZWvUIpqMMD7m9Tv2VY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700221679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zyGLwxgBsOJpwRJp0a5ctFaAMjw9Mcs+nhVUk/wv8tI=;
 b=paiYgmlaFtvPsr9Xd9YuMttZAvX35ICntiobRzFJxLczb+R1QEn/R48t0PJ7mYITRllAJK
 bKrCMk6uGEEY+0BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5CCDF1341F;
 Fri, 17 Nov 2023 11:47:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6vmbFe9SV2UwIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Nov 2023 11:47:59 +0000
Message-ID: <82aea98e-2470-4be5-95b2-a3ad7d9bfc90@suse.de>
Date: Fri, 17 Nov 2023 12:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
 <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
 <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>
 <3b799dee-c366-4c0b-9efe-c75d189fc24b@suse.de>
 <20231116172451.00a7ec9e.pekka.paalanen@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20231116172451.00a7ec9e.pekka.paalanen@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------khqNuBq3MzQI9YOVTLWKmYRW"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.79
X-Spamd-Result: default: False [-7.79 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[redhat.com, vger.kernel.org, lists.freedesktop.org,
 kernel.org, ffwll.ch, gmail.com]
X-Spam-Flag: NO
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
Cc: Sima Vetter <daniel.vetter@ffwll.ch>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------khqNuBq3MzQI9YOVTLWKmYRW
Content-Type: multipart/mixed; boundary="------------w8bMRr8KFTjNrxOt4W7wEFY2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Bilal Elmoussaoui <belmouss@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Message-ID: <82aea98e-2470-4be5-95b2-a3ad7d9bfc90@suse.de>
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
 <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
 <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>
 <3b799dee-c366-4c0b-9efe-c75d189fc24b@suse.de>
 <20231116172451.00a7ec9e.pekka.paalanen@collabora.com>
In-Reply-To: <20231116172451.00a7ec9e.pekka.paalanen@collabora.com>

--------------w8bMRr8KFTjNrxOt4W7wEFY2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMTEuMjMgdW0gMTY6MjQgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoNCj4g
T24gVGh1LCAxNiBOb3YgMjAyMyAxMzozNDowNyArMDEwMA0KPiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4gSGkNCj4+DQo+PiBBbSAx
Ni4xMS4yMyB1bSAxMzoxNCBzY2hyaWViIFNpbW9uIFNlcjoNCj4+PiBPbiBUaHVyc2RheSwg
Tm92ZW1iZXIgMTZ0aCwgMjAyMyBhdCAxMzowNiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+ICAgIA0KPj4+Pj4gKyAqIE5vdGUgdGhhdCB0
aGVyZSBhcmUgdHdvIHR5cGVzIG9mIGRhbWFnZSBoYW5kbGluZzogZnJhbWUgZGFtYWdlIGFu
ZCBidWZmZXINCj4+Pj4+ICsgKiBkYW1hZ2UuIFRoZSB0eXBlIG9mIGRhbWFnZSBoYW5kbGlu
ZyBpbXBsZW1lbnRlZCBkZXBlbmRzIG9uIGEgZHJpdmVyJ3MgdXBsb2FkDQo+Pj4+PiArICog
dGFyZ2V0LiBEcml2ZXJzIGltcGxlbWVudGluZyBhIHBlci1wbGFuZSBvciBwZXItQ1JUQyB1
cGxvYWQgdGFyZ2V0IG5lZWQgdG8NCj4+Pj4+ICsgKiBoYW5kbGUgZnJhbWUgZGFtYWdlIHdo
aWxlIGRyaXZlcnMgaW1wbGVtZW50aW5nIGEgcGVyLWJ1ZmZlciB1cGxvYWQgdGFyZ2V0DQo+
Pj4+PiArICogbmVlZCB0byBoYW5kbGUgYnVmZmVyIGRhbWFnZS4NCj4+Pj4+ICsgKg0KPj4+
Pj4gKyAqIFRoZSBleGlzdGluZyBkYW1hZ2UgaGVscGVycyBvbmx5IHN1cHBvcnQgdGhlIGZy
YW1lIGRhbWFnZSB0eXBlLCB0aGVyZSBpcyBubw0KPj4+Pj4gKyAqIGJ1ZmZlciBhZ2Ugc3Vw
cG9ydCBvciBzaW1pbGFyIGRhbWFnZSBhY2N1bXVsYXRpb24gYWxnb3JpdGhtIGltcGxlbWVu
dGVkIHlldC4NCj4+Pj4+ICsgKg0KPj4+Pj4gKyAqIE9ubHkgZHJpdmVycyBoYW5kbGluZyBm
cmFtZSBkYW1hZ2UgY2FuIHVzZSB0aGUgbWVudGlvcmVkIGRhbWFnZSBoZWxwZXJzIHRvDQo+
Pj4NCj4+PiBUeXBvOiBtZW50aW9uZWQNCj4+PiAgICANCj4+Pj4+ICsgKiBpdGVyYXRlIG92
ZXIgdGhlIGRhbWFnZWQgcmVnaW9ucy4gRHJpdmVycyB0aGF0IGhhbmRsZSBidWZmZXIgZGFt
YWdlLCBuZWVkIHRvDQo+Pj4+PiArICogc2V0ICZzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlLmln
bm9yZV9kYW1hZ2VfY2xpcHMgYXMgYW4gaW5kaWNhdGlvbiB0bw0KPj4+Pj4gKyAqIGRybV9h
dG9taWNfaGVscGVyX2RhbWFnZV9pdGVyX2luaXQoKSB0aGF0IHRoZSBkYW1hZ2UgY2xpcHMg
c2hvdWxkIGJlIGlnbm9yZWQuDQo+Pj4+PiArICogSW4gdGhhdCBjYXNlLCB0aGUgcmV0dXJu
ZWQgZGFtYWdlIHJlY3RhbmdsZSBpcyB0aGUgJmRybV9wbGFuZV9zdGF0ZS5zcmMgc2luY2UN
Cj4+Pj4+ICsgKiBhIGZ1bGwgcGxhbmUgdXBkYXRlIHNob3VsZCBoYXBwZW4uDQo+Pj4+PiAr
ICoNCj4+Pj4+ICsgKiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgdHdvIHR5cGUg
b2YgZGFtYWdlLCBzZWU6DQo+Pj4+PiArICogaHR0cHM6Ly9yZWdpc3RyeS5raHJvbm9zLm9y
Zy9FR0wvZXh0ZW5zaW9ucy9LSFIvRUdMX0tIUl9zd2FwX2J1ZmZlcnNfd2l0aF9kYW1hZ2Uu
dHh0DQo+Pj4+PiArICogaHR0cHM6Ly9lbWVyc2lvbi5mci9ibG9nLzIwMTkvaW50cm8tdG8t
ZGFtYWdlLXRyYWNraW5nLw0KPj4+Pg0KPj4+PiBPbmUgdGhvdWdodCB5b3UgbWlnaHQgd2Fu
dCB0byBjb25zaWRlci4NCj4+Pj4NCj4+Pj4gVGhlc2UgVVJMcyBhcmUgaGVscGZ1bC4gVGhl
IG9ubHkgaXNzdWUgSSBoYXZlIGlzIHRoYXQgZnJhbWUgZGFtYWdlIGFuZA0KPj4+PiBidWZm
ZXIgZGFtYWdlIGFyZSB1c2VyLXNwYWNlIGNvbmNlcHRzLiBUaGUga2VybmVsIGJ1ZyBpcyB0
aGF0IGRhbWFnZQ0KPj4+PiBoYW5kbGluZyBleHBlY3RzIHRoZSBiYWNraW5nIHN0b3JhZ2Uv
dXBsb2FkIGJ1ZmZlciBub3QgdG8gY2hhbmdlIGZvciBhDQo+Pj4+IGdpdmVuIHBsYW5lLiBJ
ZiB0aGUgdXBsb2FkIGJ1ZmZlciBjaGFuZ2VzIGJldHdlZW4gcGFnZSBmbGlwcywgdGhlIG5l
dw0KPj4+PiB1cGxvYWQgYnVmZmVyIGhhcyB0byBiZSB1cGRhdGVkIGFzIGEgd2hvbGUuIEhl
bmNlIG5vIGRhbWFnZSBoYW5kbGluZyB0aGVuLg0KPj4+DQo+Pj4gV2h5IHdvdWxkIHRoZXNl
IGNvbmNlcHRzIGJlIHNwZWNpZmljIHRvIHVzZXItc3BhY2U/IFRoZSBrZXJuZWwgY291bGQN
Cj4+PiBiZXR0ZXIgaGFuZGxlIGJ1ZmZlciBkYW1hZ2UgaW5zdGVhZCBvZiBmb3JjaW5nIGZ1
bGwgZGFtYWdlLCBieSBkb2luZw0KPj4+IHNvbWV0aGluZyBzaW1pbGFyIHRvIHdoYXQgdXNl
ci1zcGFjZSBkb2VzLg0KPj4NCj4+IFRoZSB0ZXJtcyAnZnJhbWUgZGFtYWdlJyBhbmQgJ2J1
ZmZlciBkYW1hZ2UnIGRvIG5vdCBleGlzdCBpbiB0aGUga2VybmVsLg0KPj4gVGhlIHByb2Js
ZW0gY2FuIGJlIGJldHRlciBkZXNjcmliZWQgaW4gd29yZGluZyB0aGF0IGlzIGNvbW1vbiB3
aXRoaW4gdGhlDQo+PiBjb250ZXh0IG9mIHRoZSBrZXJuZWwgZHJpdmVycy4NCj4gDQo+IFdo
YXQgdGVybXMgZG9lcyB0aGUga2VybmVsIHVzZSBmb3IgdGhlc2UgdHdvIGRpZmZlcmVudCBj
b25jZXB0cyBvZg0KPiBkYW1hZ2U/DQoNCk5vbmUgQUZBSUsuIERhbWFnZSBpcyByZWxhdGl2
ZSB0byB0aGUgcGxhbmUncyBiYWNraW5nIHN0b3JhZ2UvdXBsb2FkIA0KYnVmZmVyLiBUaGF0
J3MgZnJhbWUgZGFtYWdlLiBXZSBuZXZlciBuZWVkZWQgYSBuYW1lIGZvciBidWZmZXIgZGFt
YWdlIGFzIA0Kd2UgZG9uJ3Qgc3VwcG9ydCBpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gDQo+IFRoYW5rcywNCj4gcHENCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFu
eQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRp
ZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------w8bMRr8KFTjNrxOt4W7wEFY2--

--------------khqNuBq3MzQI9YOVTLWKmYRW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVXUu4FAwAAAAAACgkQlh/E3EQov+CJ
vBAAi3nmPtxdOp3s03DovT8R0S/71yHzvCndKrkGnlXkZ7SuF2x2Hon8omiQivnqQ0y2nbEYRaq+
lJW1Tf/KnqgA2hG1JvQcxcqjxRBxtZzzW0ETOEO0iFS5w5NUnQcggMIitjyw/2YJNViRzdF4Bbpd
S/xeZBgNUAn2awHJ086IYd0RsTC3jqR31Bx5epn3x3fanWN6WEtGSPmo+BRoXUaZXbDCAlthsZua
fBcRCuW9DhtcigOngQDcmsMeGXQBsbS7IXKMP9lmND7lddBF+phu6z48Zqt4CFafMGaoAMxMOAz4
gqjbhnjY7h9W1gmKDQaD3J51GmosaBWWzKRvSDPbhJVLxG7dWaWoW70oQtBoAXK76G7surbVbea9
Qn8sqnhJLKDPUxO6FTqgaVdYF1LnbBZw8vw6J6bv+ARuPiMzGks6+wlhUUfA0FbGBYMv9wGH6aq3
sMFy+tqO5Ekrr/o02WK8KpvsFqQCmYieJDwhrwvPUcMk5Q9KPId4Fx0B7dOWA08YyaNR4Wy7QGJN
r6M4NOLMP0k7Un6AFA6IbQHoAEEHufAheOSj/RbgBflszLlguOslj5r4AQ4jSAZmGsXyjiY6SdTC
xv+05pQBSGtgY7z7GzzDaDzx3KYiTpRlNVzZicboL62MkzxrrUerNjE5NBlXqrfVemzFarqO8s+J
r8A=
=w8Eh
-----END PGP SIGNATURE-----

--------------khqNuBq3MzQI9YOVTLWKmYRW--

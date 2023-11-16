Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D837EE05A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB90110E5CD;
	Thu, 16 Nov 2023 12:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E489E10E5CD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:06:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56B4A22946;
 Thu, 16 Nov 2023 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700136390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HXJM7L7WApq8NXwfxIO8FHjJkCBgPa4lmXUpNVv8q7E=;
 b=DYliU9R7MtoRJJmK0Uw6NxzXz48SV8hur2ZKQfc19/vVjQDaQNfURvdGYlUQIRFj+8msCh
 x5y7oR5ZGm13FYQPo5pRQ7ZaGoj1kEyGcagmZ6pVJPM4/JK5YtL6qt/KXa4ZbtoK3kz6jE
 YdlpW5G2qB91HChZ4FRfBFXUiwHduYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700136390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HXJM7L7WApq8NXwfxIO8FHjJkCBgPa4lmXUpNVv8q7E=;
 b=dVy101AKoV2pQEjAiHeNA4jryBmtLAKqqQwuVP1O7DOMOGLYFSpkY6qEhxI6BPhKA4v6bt
 UDvrkOiRouq8azAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E1D01377E;
 Thu, 16 Nov 2023 12:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5r17CsYFVmXCYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 12:06:30 +0000
Message-ID: <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
Date: Thu, 16 Nov 2023 13:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
Content-Language: en-US
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
In-Reply-To: <20231115131549.2191589-5-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4t0ZO8HByXPKMHtQ0462fyDm"
Authentication-Results: smtp-out1.suse.de;
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
 FREEMAIL_CC(0.00)[collabora.com, redhat.com, kernel.org, lists.freedesktop.org,
 ffwll.ch, gmail.com]
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4t0ZO8HByXPKMHtQ0462fyDm
Content-Type: multipart/mixed; boundary="------------aKm86F1r0YD2Q0OABxtNz7pK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Message-ID: <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
In-Reply-To: <20231115131549.2191589-5-javierm@redhat.com>

--------------aKm86F1r0YD2Q0OABxtNz7pK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTEuMjMgdW0gMTQ6MTUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSAiRGFtYWdlIFRyYWNraW5nIFByb3BlcnRpZXMiIHNlY3Rpb24gaW4g
dGhlIGRvY3VtZW50YXRpb24gZG9lc24ndCBoYXZlDQo+IGluZm8gYWJvdXQgdGhlIHR3byB0
eXBlIG9mIGRhbWFnZSBoYW5kbGluZzogZnJhbWUgZGFtYWdlIHZzIGJ1ZmZlciBkYW1hZ2Uu
DQo+IA0KPiBBZGQgaXQgdG8gdGhlIHNlY3Rpb24gYW5kIG1lbnRpb24gdGhhdCBoZWxwZXJz
IG9ubHkgc3VwcG9ydCBmcmFtZSBkYW1hZ2UsDQo+IGFuZCBob3cgZHJpdmVycyBoYW5kbGlu
ZyBidWZmZXIgZGFtYWdlIGNhbiBpbmRpY2F0ZSB0aGF0IHRoZSBkYW1hZ2UgY2xpcHMNCj4g
c2hvdWxkIGJlIGlnbm9yZWQuDQo+IA0KPiBBbHNvIGFkZCByZWZlcmVuY2VzIHRvIGZ1cnRo
ZXIgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgdHdvIGRhbWFnZSB0eXBlcy4NCj4gDQo+IFN1
Z2dlc3RlZC1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPg0KPiBTaWduZWQt
b2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4N
Cj4gLS0tDQo+IC0gRHJvcHBlZCBTaW1vbiBTZXIncyBSZXZpd2VkLWJ5IHRhZyBiZWNhdXNl
IHRoZSB0ZXh0IGNoYW5nZWQgdG8gYWRhcHQNCj4gICAgdG8gdGhlIGFwcHJvYWNoIFRob21h
cyBaaW1tZXJtYW5uIHN1Z2dlc3RlZCBmb3IgdjIuDQo+IA0KPiAobm8gY2hhbmdlcyBzaW5j
ZSB2MSkNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgMjAgKysrKysr
KysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiBpbmRleCAyNGU3OTk4ZDE3MzEuLjNiMWI4YmNh
MzA2NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiBAQCAtMTQ0Miw2ICsxNDQyLDI2
IEBAIGludCBkcm1fbW9kZV9wYWdlX2ZsaXBfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwNCj4gICAgKiBEcml2ZXJzIGltcGxlbWVudGluZyBkYW1hZ2UgY2FuIHVzZSBkcm1fYXRv
bWljX2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0KCkgYW5kDQo+ICAgICogZHJtX2F0b21pY19o
ZWxwZXJfZGFtYWdlX2l0ZXJfbmV4dCgpIGhlbHBlciBpdGVyYXRvciBmdW5jdGlvbiB0byBn
ZXQgZGFtYWdlDQo+ICAgICogcmVjdGFuZ2xlcyBjbGlwcGVkIHRvICZkcm1fcGxhbmVfc3Rh
dGUuc3JjLg0KPiArICoNCj4gKyAqIE5vdGUgdGhhdCB0aGVyZSBhcmUgdHdvIHR5cGVzIG9m
IGRhbWFnZSBoYW5kbGluZzogZnJhbWUgZGFtYWdlIGFuZCBidWZmZXINCj4gKyAqIGRhbWFn
ZS4gVGhlIHR5cGUgb2YgZGFtYWdlIGhhbmRsaW5nIGltcGxlbWVudGVkIGRlcGVuZHMgb24g
YSBkcml2ZXIncyB1cGxvYWQNCj4gKyAqIHRhcmdldC4gRHJpdmVycyBpbXBsZW1lbnRpbmcg
YSBwZXItcGxhbmUgb3IgcGVyLUNSVEMgdXBsb2FkIHRhcmdldCBuZWVkIHRvDQo+ICsgKiBo
YW5kbGUgZnJhbWUgZGFtYWdlIHdoaWxlIGRyaXZlcnMgaW1wbGVtZW50aW5nIGEgcGVyLWJ1
ZmZlciB1cGxvYWQgdGFyZ2V0DQo+ICsgKiBuZWVkIHRvIGhhbmRsZSBidWZmZXIgZGFtYWdl
Lg0KPiArICoNCj4gKyAqIFRoZSBleGlzdGluZyBkYW1hZ2UgaGVscGVycyBvbmx5IHN1cHBv
cnQgdGhlIGZyYW1lIGRhbWFnZSB0eXBlLCB0aGVyZSBpcyBubw0KPiArICogYnVmZmVyIGFn
ZSBzdXBwb3J0IG9yIHNpbWlsYXIgZGFtYWdlIGFjY3VtdWxhdGlvbiBhbGdvcml0aG0gaW1w
bGVtZW50ZWQgeWV0Lg0KPiArICoNCj4gKyAqIE9ubHkgZHJpdmVycyBoYW5kbGluZyBmcmFt
ZSBkYW1hZ2UgY2FuIHVzZSB0aGUgbWVudGlvcmVkIGRhbWFnZSBoZWxwZXJzIHRvDQo+ICsg
KiBpdGVyYXRlIG92ZXIgdGhlIGRhbWFnZWQgcmVnaW9ucy4gRHJpdmVycyB0aGF0IGhhbmRs
ZSBidWZmZXIgZGFtYWdlLCBuZWVkIHRvDQo+ICsgKiBzZXQgJnN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUuaWdub3JlX2RhbWFnZV9jbGlwcyBhcyBhbiBpbmRpY2F0aW9uIHRvDQo+ICsgKiBk
cm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0KCkgdGhhdCB0aGUgZGFtYWdlIGNs
aXBzIHNob3VsZCBiZSBpZ25vcmVkLg0KPiArICogSW4gdGhhdCBjYXNlLCB0aGUgcmV0dXJu
ZWQgZGFtYWdlIHJlY3RhbmdsZSBpcyB0aGUgJmRybV9wbGFuZV9zdGF0ZS5zcmMgc2luY2UN
Cj4gKyAqIGEgZnVsbCBwbGFuZSB1cGRhdGUgc2hvdWxkIGhhcHBlbi4NCj4gKyAqDQo+ICsg
KiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgdHdvIHR5cGUgb2YgZGFtYWdlLCBz
ZWU6DQo+ICsgKiAgICAgaHR0cHM6Ly9yZWdpc3RyeS5raHJvbm9zLm9yZy9FR0wvZXh0ZW5z
aW9ucy9LSFIvRUdMX0tIUl9zd2FwX2J1ZmZlcnNfd2l0aF9kYW1hZ2UudHh0DQo+ICsgKiAg
ICAgaHR0cHM6Ly9lbWVyc2lvbi5mci9ibG9nLzIwMTkvaW50cm8tdG8tZGFtYWdlLXRyYWNr
aW5nLw0KDQpPbmUgdGhvdWdodCB5b3UgbWlnaHQgd2FudCB0byBjb25zaWRlci4NCg0KVGhl
c2UgVVJMcyBhcmUgaGVscGZ1bC4gVGhlIG9ubHkgaXNzdWUgSSBoYXZlIGlzIHRoYXQgZnJh
bWUgZGFtYWdlIGFuZCANCmJ1ZmZlciBkYW1hZ2UgYXJlIHVzZXItc3BhY2UgY29uY2VwdHMu
IFRoZSBrZXJuZWwgYnVnIGlzIHRoYXQgZGFtYWdlIA0KaGFuZGxpbmcgZXhwZWN0cyB0aGUg
YmFja2luZyBzdG9yYWdlL3VwbG9hZCBidWZmZXIgbm90IHRvIGNoYW5nZSBmb3IgYSANCmdp
dmVuIHBsYW5lLiBJZiB0aGUgdXBsb2FkIGJ1ZmZlciBjaGFuZ2VzIGJldHdlZW4gcGFnZSBm
bGlwcywgdGhlIG5ldyANCnVwbG9hZCBidWZmZXIgaGFzIHRvIGJlIHVwZGF0ZWQgYXMgYSB3
aG9sZS4gSGVuY2Ugbm8gZGFtYWdlIGhhbmRsaW5nIHRoZW4uDQoNCkFuZCB0aGVuIG1heWJl
IHNheSB0aGF0IHRoZSBlZmZlY3RzIG9mIGZyYW1lIGRhbWFnZSBhbmQgYnVmZmVyIGRhbWFn
ZSBpbiANCnVzZXJzcGFjZSBpbGx1c3RyYXRlIHRoaXMgcHJvYmxlbSBhbmQgZ2l2ZSB0aGUg
VVJMcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgICAqLw0KPiAgIA0KPiAgIC8q
Kg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------aKm86F1r0YD2Q0OABxtNz7pK--

--------------4t0ZO8HByXPKMHtQ0462fyDm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVWBcUFAwAAAAAACgkQlh/E3EQov+AF
dQ//SVh/MY5xBHy36e1IuBHjV7Bkh0DPVIMKt7fvJ/cvquYNbOVSH2DKVuB+Q19la7EIhHxL7c9c
aXhO7s8OEDy5akn3XBxCauWiYT1Zd5F5TY+sgaLHnsUlxVRoGEERpecyeWm5tGdF393sWzEF0Tm4
dyLkOvMbWlcOlEX8Ssx22aUWFmH852Zy7RJwXf605PuPIfxliWjgbmLhYqRjA2DfmM0ThWoEzfL7
P7WnfdKlrSZofFt3VQyw849B2RJ0JrWDV9xVDGpFLm2VNfO+a5/cKOfRs71UVNMs7sSYpPyhpAUh
NzqIorBWl1wQguqbb9FwIHsZMcZI41SgjmgLtq6+kj1wvwFOdKqSfHgvtI5mKs3xwBUyLlcpqroo
D7Bcho4GTsZYc+3ZZQhZTKYuX+zllV/CvNtM81izvNrI200diDEubj7tXLg+KlDTsGtR/yk5O8Ze
1mV6K36S6woaX3t8fpXLPw3AJhOkYWaCv2RNHhhqsYonR5XIE5CSTDYO1vEPdFbf12HupHskPJIC
D48OQyPZr8HnXsUrDlcwcaWz3BecM3BJzHENAe21FVFfZxN1LaJgIDPwg5KFkrEhB6kec2fE8cIV
wWp1xCKpVWqvKsCwRpFOgF2kcylCloWKocRiYSFKih8nFhZK17TJ+dAAvsgDNP8HcMdLePODo0sy
2hI=
=8vM0
-----END PGP SIGNATURE-----

--------------4t0ZO8HByXPKMHtQ0462fyDm--

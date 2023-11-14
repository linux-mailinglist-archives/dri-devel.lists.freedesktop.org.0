Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A427EB08E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 14:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7C10E0E5;
	Tue, 14 Nov 2023 13:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FA110E0E5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 13:06:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9359D218D6;
 Tue, 14 Nov 2023 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699967207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jUbysOieMo2COr4JhZ86c7ay0tKYT8AGJuGHkiJUhKs=;
 b=lw2i4iDGwHd6M1PHuz6wg4jJQKEQkJEgkbInmpcj4omEr/ezjzuprm+qgcZMng2zll9XAP
 zQocZR52cL2v19M/kuvhNqBFZmCGcaUE8XgQ6IMoboTh9FfmWPfLKD/rPxQkuIWQS1XgGh
 qIt5GmXTnFRHJYCKxCiRUobG59RsGFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699967207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jUbysOieMo2COr4JhZ86c7ay0tKYT8AGJuGHkiJUhKs=;
 b=Ekyt8ldQagr2R779vmGvsxd/WrhesV3KBhTD9ogX+jV0qoPwIntBjNEly/ZOZTEkFmQzkS
 0qBEitLINTw7W5DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8036613460;
 Tue, 14 Nov 2023 13:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dgR1HudwU2W0AQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Nov 2023 13:06:47 +0000
Message-ID: <54a3c4bc-b013-4096-ab59-b163c4984618@suse.de>
Date: Tue, 14 Nov 2023 14:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/probe-helper: convert
 drm_connector_helper_get_modes_from_ddc() to struct drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20231114105815.4188901-1-jani.nikula@intel.com>
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
In-Reply-To: <20231114105815.4188901-1-jani.nikula@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------326P8Oleb1LFlHXKrcyJ111n"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -12.09
X-Spamd-Result: default: False [-12.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_TWO(0.00)[2]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------326P8Oleb1LFlHXKrcyJ111n
Content-Type: multipart/mixed; boundary="------------RZ0IGgEy0oVBuFybhV6qNRac";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Message-ID: <54a3c4bc-b013-4096-ab59-b163c4984618@suse.de>
Subject: Re: [PATCH] drm/probe-helper: convert
 drm_connector_helper_get_modes_from_ddc() to struct drm_edid
References: <20231114105815.4188901-1-jani.nikula@intel.com>
In-Reply-To: <20231114105815.4188901-1-jani.nikula@intel.com>

--------------RZ0IGgEy0oVBuFybhV6qNRac
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTEuMjMgdW0gMTE6NTggc2NocmllYiBKYW5pIE5pa3VsYToNCj4gR29p
bmcgZm9yd2FyZCwgdGhlIHN0cnVjdCBkcm1fZWRpZCBiYXNlZCBmdW5jdGlvbnMgZHJtX2Vk
aWRfcmVhZCgpLA0KPiBkcm1fZWRpZF9jb25uZWN0b3JfdXBkYXRlKCkgYW5kIGRybV9lZGlk
X2Nvbm5lY3Rvcl9hZGRfbW9kZXMoKSBhcmUgdGhlDQo+IHByZWZlcnJlZCB3YXlzIG9mIHJl
dHJpZXZpbmcgdGhlIEVESUQgYW5kIHVwZGF0aW5nIHRoZSBjb25uZWN0b3IuDQo+IA0KPiBD
YzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNpZ25lZC1v
ZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQoNClJldmlld2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KSWYgSSdt
IG5vdCBtaXN0YWtlbiwgdGhlIGNvcnJlY3QgcGF0dGVybiBpcyB0byByZWFkIHRoZSBFRElE
IGJsb2NrIGluIA0KdGhlIGRldGVjdCBjYWxsYmFjayBhbmQgb25seSBwYXJzZSBpdCBmb3Ig
bW9kZXMgaW4gZ2V0X21vZGVzLiBJZiBzbywgeW91IA0KbWlnaHQgYWxzbyBpbmxpbmUgdGhp
cyBoZWxwZXIgaW50byBpdHMgb25seSBjYWxsZXIgaW4gbWdhZzIwMC4gSSdsbCANCmxhdGVy
IHNwbGl0IGl0IHVwIGludG8gZGV0ZWN0IGFuZCBnZXRfbW9kZXMuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxw
ZXIuYyB8IDE3ICsrKysrKysrLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9i
ZV9oZWxwZXIuYw0KPiBpbmRleCAzZjQ3OTQ4M2Q3ZDguLjMwOWQ4OGYxMzY0OCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxwZXIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jDQo+IEBAIC0xMTE2LDIxICsxMTE2
LDIwIEBAIEVYUE9SVF9TWU1CT0woZHJtX2NydGNfaGVscGVyX21vZGVfdmFsaWRfZml4ZWQp
Ow0KPiAgICAqLw0KPiAgIGludCBkcm1fY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXNfZnJv
bV9kZGMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gICB7DQo+IC0Jc3Ry
dWN0IGVkaWQgKmVkaWQ7DQo+IC0JaW50IGNvdW50ID0gMDsNCj4gKwljb25zdCBzdHJ1Y3Qg
ZHJtX2VkaWQgKmRybV9lZGlkOw0KPiArCWludCBjb3VudDsNCj4gICANCj4gICAJaWYgKCFj
b25uZWN0b3ItPmRkYykNCj4gICAJCXJldHVybiAwOw0KPiAgIA0KPiAtCWVkaWQgPSBkcm1f
Z2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRkYyk7DQo+ICsJZHJtX2VkaWQgPSBk
cm1fZWRpZF9yZWFkKGNvbm5lY3Rvcik7DQo+ICsNCj4gKwkvKiBjbGVhcnMgcHJvcGVydHkg
aWYgRURJRCBpcyBOVUxMICovDQo+ICsJZHJtX2VkaWRfY29ubmVjdG9yX3VwZGF0ZShjb25u
ZWN0b3IsIGRybV9lZGlkKTsNCj4gICANCj4gLQkvLyBjbGVhcnMgcHJvcGVydHkgaWYgRURJ
RCBpcyBOVUxMDQo+IC0JZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25u
ZWN0b3IsIGVkaWQpOw0KPiArCWNvdW50ID0gZHJtX2VkaWRfY29ubmVjdG9yX2FkZF9tb2Rl
cyhjb25uZWN0b3IpOw0KPiAgIA0KPiAtCWlmIChlZGlkKSB7DQo+IC0JCWNvdW50ID0gZHJt
X2FkZF9lZGlkX21vZGVzKGNvbm5lY3RvciwgZWRpZCk7DQo+IC0JCWtmcmVlKGVkaWQpOw0K
PiAtCX0NCj4gKwlkcm1fZWRpZF9mcmVlKGRybV9lZGlkKTsNCj4gICANCj4gICAJcmV0dXJu
IGNvdW50Ow0KPiAgIH0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpG
cmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBU
b3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0K
SFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------RZ0IGgEy0oVBuFybhV6qNRac--

--------------326P8Oleb1LFlHXKrcyJ111n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVTcOcFAwAAAAAACgkQlh/E3EQov+Di
RhAAoeGhHN1Z9fgIAYNZAC2/MTZuKELPjgeqICANkVxkPADut5qKNA8Bi+nSYCBiNdAdNY63eCCD
+eJhdhRGN/UYzxmzHlxrYU9wah6YcP2sqsUzkzEwW8NC4MkWOQiWULIbg3J4sHbwH5RPurbczfgh
LFVjuF5mPkz7EdC1GLnQGkS2nQnPveiUX4avxwIAeWX6MbmQU0DX5K/EbVWam60xb7sUlvIwkNXi
5+KgsUwnC2iSFbNEymXl7mRYPmsTlzuc+cjgL20S5oFY1tNgkuubkkhpivDYOLB6pt4kZZThd1ra
mwHMUjIYGrnBenr/ASMqR9Y8GIc7ghkghZF8P0mAuVPRDOn8QIaJic7F3I5gbfpO66ztAIzIySRD
tv0uKu+ncVkBK5qmg3bdq0s+Ycuv4Absi0WVOjQHLp6BMnANbgVhV2kJLjiSDiM/NFaHQ4qE7FnD
ryNNH25x4o8YLPsggT+auZS1de2YzUlu5TPzzTJK6QGGLldkCHZHGYYYivgG1Y4mSLHn73K7JBog
SSAZkuVA8tlKrHIEZL/dKQ3Lj3Reol/i5olBnuKPAiWCXXGdV3KY9/9xUH+dQLoV/Xn4aJ6p/QHX
pjUi7l5L/8EFFEawX5hTOeygQCY+tDYSrjm33vvWp8Kdj+P6aCnS6DljYRlWTWR9sZ2FNBTq2O1L
+VU=
=GI1i
-----END PGP SIGNATURE-----

--------------326P8Oleb1LFlHXKrcyJ111n--

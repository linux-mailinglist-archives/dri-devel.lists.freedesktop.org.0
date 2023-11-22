Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2B7F4115
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 10:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C99510E2EF;
	Wed, 22 Nov 2023 09:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C31310E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 09:03:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21AEA1F8D7;
 Wed, 22 Nov 2023 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700643791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bu/xFHKOhmXOVvaSKH1V4mzwUoCc4YzAQ8Eec3NXTHY=;
 b=ouPCElbQdU1K08T5Vm6kceiHqBzA55CCTRPLGDV2wVIrhSFGpubqLzDYHCCvGa4PW94OHp
 a9cbj3K1dWWwOqJ3DbXV+lWkWPeXGhQlIPK/sC+jwAfeMJrt4LIJQSZfF7U91gDwoogQBa
 jDRQi4RCOjvg0XBDZ4CVDmSdeawf0A0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700643791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bu/xFHKOhmXOVvaSKH1V4mzwUoCc4YzAQ8Eec3NXTHY=;
 b=IeUbDmc46il1zFcn7K1hpw9eDenY4foXXmDUyR3t0krb24uFDwzvhWE3wJ6Z3cv7PMv3eQ
 FPcp4S2Z5wTbz7Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00E6B139FD;
 Wed, 22 Nov 2023 09:03:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5C3WOs7DXWWWaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 09:03:10 +0000
Message-ID: <50dc2f5d-3065-4923-b2ef-789ac9c77676@suse.de>
Date: Wed, 22 Nov 2023 10:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/32] auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-10-tzimmermann@suse.de>
 <CANiq72m8=KMin6Hck1XouqC3bV3oBgBxj0Qb4HCXsOjgFdgKjA@mail.gmail.com>
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
In-Reply-To: <CANiq72m8=KMin6Hck1XouqC3bV3oBgBxj0Qb4HCXsOjgFdgKjA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ychpN35UL0xdWfVZfaOaIyyX"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.72
X-Spamd-Result: default: False [-4.72 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[7];
 SIGNED_PGP(-2.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-2.93)[99.69%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[vger.kernel.org, protonic.nl, gmx.de, redhat.com,
 lists.freedesktop.org, kernel.org]
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
Cc: linux-fbdev@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
 deller@gmx.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ychpN35UL0xdWfVZfaOaIyyX
Content-Type: multipart/mixed; boundary="------------mpD7t1yPfxCPHb3X6bbvSvOt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-fbdev@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
 deller@gmx.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>
Message-ID: <50dc2f5d-3065-4923-b2ef-789ac9c77676@suse.de>
Subject: Re: [PATCH 09/32] auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-10-tzimmermann@suse.de>
 <CANiq72m8=KMin6Hck1XouqC3bV3oBgBxj0Qb4HCXsOjgFdgKjA@mail.gmail.com>
In-Reply-To: <CANiq72m8=KMin6Hck1XouqC3bV3oBgBxj0Qb4HCXsOjgFdgKjA@mail.gmail.com>

--------------mpD7t1yPfxCPHb3X6bbvSvOt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMTEuMjMgdW0gMDA6NTAgc2NocmllYiBNaWd1ZWwgT2plZGE6DQo+IE9u
IFdlZCwgTm92IDE1LCAyMDIzIGF0IDExOjMw4oCvQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+ICsgICAgICAgZmJkZXYtPmluZm8t
PmZsYWdzIHw9IEZCSU5GT19WSVJURkI7DQo+IA0KPiBJcyB0aGUgYHw9YCAoaW5zdGVhZCBv
ZiBqdXN0IGA9YCkgdXNlZCBpbiBjYXNlIHNvbWVvbmUgYWRkcyBzb21ldGhpbmcNCj4gdG8g
dGhlIGZsYWdzIGJlZm9yZSAoZS5nLiBgZmJfYmxfZGVmYXVsdF9jdXJ2ZWApIG9yIGR1ZSB0
byBzb21lIG90aGVyDQo+IHJlYXNvbj8gKE9uZSBvZiB0aGUgb3RoZXIgcGF0Y2hlcyB1c2Vz
IGA9YCkuDQoNClllcywgaXQncyBpbnRlbnRpb25hbGx5Lg0KDQo+IA0KPiBJbiBhbnkgY2Fz
ZSwgaWYgdGhhdCBpcyBpbnRlbmRlZDoNCj4gDQo+IEFja2VkLWJ5OiBNaWd1ZWwgT2plZGEg
PG9qZWRhQGtlcm5lbC5vcmc+DQoNClRoYW5rcy4NCg0KPiANCj4gQ2hlZXJzLA0KPiBNaWd1
ZWwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNz
ZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3
IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChB
RyBOdWVybmJlcmcpDQo=

--------------mpD7t1yPfxCPHb3X6bbvSvOt--

--------------ychpN35UL0xdWfVZfaOaIyyX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVdw84FAwAAAAAACgkQlh/E3EQov+Av
FQ//TqxfT5ZJnIXrhwqEKchKULvEqvosyvf6TN+vLKY/0YHt2C+8RRYtWcE/MuvJ7TMBEJ8niZ37
zjsuB8XF5EN6FURmQYcjWduJIgLoiOPO4XXUMfr+oY1tdWgc+hSUsVLvXx51Ce5kwXcWIExsiINK
wBVlZ/lwWFDSsZhR4V/oJ9vevRST3sUWtCRG9V9fkuLB/cuzuthNT4zkr3g7+YENff9yVYy9gdGv
bkMW1WyAmKtbqnjWZd8tDbmVXUr4SjLAMrJiiqIrBre6JF42YZioXXJ4yYZqwoTSf02cfOo0khxZ
7c2eNkgUarI7x5Nw7asKfUALlRf2lMRa6jYrSUYPHPoNGb3nRN4poXCAweIAtzixpwG6nUf1/QVK
7x4LYNTdY2GLO0O8tUvMsOI+I/R3cFU6Jq4MNwCJO4g40JAUNAaqOAmHl50hRm/+dL9a/VzCqZQM
DYIL30799AUuOoy7ve/pbRCvxHlP5LC5oqKKq+JJg1d36ywPCjRSn9dxlVT5WMUI5VuKoQZK6Rgm
EvDCtlze94lzRyimCHFx3uHsBZ3KQjFUtItiSudq7MVVYZ+b6FYcArQpNllevN0NmMFfQS6ljzVJ
tjOzGkIE+zIs9ypzhV8SVwwZk7BxC7D6jmgDeBxC/4FCWn1HCtLtRlFbydWvikmLHSvpTQt5hehp
w+s=
=KuOn
-----END PGP SIGNATURE-----

--------------ychpN35UL0xdWfVZfaOaIyyX--

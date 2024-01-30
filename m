Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10184256E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 13:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B20112F6A;
	Tue, 30 Jan 2024 12:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B09C112F6A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 12:53:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE3601F848;
 Tue, 30 Jan 2024 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706619179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f4HTT8ZIZw8i+CYfnG8FA/oSSbAoj2Aii27t/UWNh5U=;
 b=uTXEyLqLLicUTnCxQ4UV4BZsoq313CY8if53PSNQa2qvJKDikHqe41RMPxHTM6XKWQWA8D
 rwRYj6bpDnJ2Q6wWu8oM6vn/Dll1HsBS1BPC5JWRuFatpU/NiUm1dqmriJoJtjRkJYbHQE
 k9g+uRSUQ0cm87K/6LSdKkZzZ+fgaOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706619179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f4HTT8ZIZw8i+CYfnG8FA/oSSbAoj2Aii27t/UWNh5U=;
 b=xPBQPEzFyRvYYfdBze4j6jtYlOPuh2oYBz0lcpd5nIkfCm73sc9bJxqrf1CdjJSXx72wom
 djaHiNDcddyDdiDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706619178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f4HTT8ZIZw8i+CYfnG8FA/oSSbAoj2Aii27t/UWNh5U=;
 b=XzoEr9/wlY90dD1Znn8G0+nF/XIMuWD1spMujWDeeXl3OXNHrsx3FTwlLqDH4kgS4Z01p9
 sEIxDsybRyo3C77JUGOSdnD05jZ7P874elYbHlrxU/3hHYBz4Xp68fqXNUodPeRTwmSdEl
 orlLz7OwVrEX3XykW/U3a5ZCjH8sFMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706619178;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f4HTT8ZIZw8i+CYfnG8FA/oSSbAoj2Aii27t/UWNh5U=;
 b=US2BNGOzIst87pnsdfbT6ShEx1vJsaJasM4WGJwMyalbXeeFa8qPbVHNVSjqSFSxdZoJuV
 SR6GCjzrNa6+UNCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A989513212;
 Tue, 30 Jan 2024 12:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id bw9cKCrxuGWoIgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 12:52:58 +0000
Message-ID: <95ae7e7a-de13-4702-a0dc-ed1806b96135@suse.de>
Date: Tue, 30 Jan 2024 13:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] firmware/sysfb: Create firmware device only for
 enabled PCI devices
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-6-tzimmermann@suse.de>
 <87le88v0bg.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87le88v0bg.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hh2zBxLNMvpUf3Ch3xlWqru0"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.29
X-Spamd-Result: default: False [-5.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hh2zBxLNMvpUf3Ch3xlWqru0
Content-Type: multipart/mixed; boundary="------------dYFrNSjbZMMGzUq9VVJNFlLr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <95ae7e7a-de13-4702-a0dc-ed1806b96135@suse.de>
Subject: Re: [PATCH 5/8] firmware/sysfb: Create firmware device only for
 enabled PCI devices
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-6-tzimmermann@suse.de>
 <87le88v0bg.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87le88v0bg.fsf@minerva.mail-host-address-is-not-set>

--------------dYFrNSjbZMMGzUq9VVJNFlLr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDEuMjQgdW0gMTI6MzYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gVGVzdCBpZiB0aGUgZmlybXdhcmUgZnJhbWVidWZmZXIncyBwYXJlbnQg
UENJIGRldmljZSwgaWYgYW55LCBoYXMNCj4+IGJlZW4gZW5hYmxlZC4gSWYgbm90LCB0aGUg
ZmlybXdhcmUgZnJhbWVidWZmZXIgaXMgbW9zdCBsaWtlbHkgbm90DQo+PiB3b3JraW5nLiBI
ZW5jZSwgZG8gbm90IGNyZWF0ZSBhIGRldmljZSBmb3IgdGhlIGZpcm13YXJlIGZyYW1lYnVm
ZmVyDQo+PiBvbiBkaXNhYmxlZCBQQ0kgZGV2aWNlcy4NCj4+DQo+PiBTbyBmYXIsIGVmaWZi
IHRyYWNrZWQgdGhlIHN0YXR1cyBvZiB0aGUgUENJIHBhcmVudCBkZXZpY2UgaW50ZXJuYWxs
eQ0KPj4gYW5kIGRpZCBub3QgYmluZCBpZiBpdCB3YXMgZGlzYWJsZWQuIFRoaXMgcGF0Y2gg
aW1wbGVtZW50cyB0aGUNCj4+IGZ1bmN0aW9uYWxpdHkgZm9yIGFsbCBmaXJtd2FyZSBmcmFt
ZWJ1ZmZlcnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4gDQo+IFsuLi5dDQo+IA0KPj4gICANCj4+
ICtzdGF0aWMgX19pbml0IGJvb2wgc3lzZmJfcGNpX2Rldl9pc19lbmFibGVkKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfUENJKQ0KPj4g
KwkvKg0KPj4gKwkgKiBUT0RPOiBUcnkgdG8gaW50ZWdyYXRlIHRoaXMgY29kZSBpbnRvIHRo
ZSBQQ0kgc3Vic3lzdGVtDQo+PiArCSAqLw0KPj4gKwlpbnQgcmV0Ow0KPj4gKwl1MTYgY29t
bWFuZDsNCj4+ICsNCj4+ICsJcmV0ID0gcGNpX3JlYWRfY29uZmlnX3dvcmQocGRldiwgUENJ
X0NPTU1BTkQsICZjb21tYW5kKTsNCj4+ICsJaWYgKHJldCAhPSBQQ0lCSU9TX1NVQ0NFU1NG
VUwpDQo+PiArCQlyZXR1cm4gZmFsc2U7DQo+PiArCWlmICghKGNvbW1hbmQgJiBQQ0lfQ09N
TUFORF9NRU1PUlkpKQ0KPj4gKwkJcmV0dXJuIGZhbHNlOw0KPj4gKwlyZXR1cm4gdHJ1ZTsN
Cj4+ICsjZWxzZQ0KPj4gKwkvLyBHZXR0aW5nIGhlcmUgd2l0aG91dCBQQ0kgc3VwcG9ydCBp
cyBwcm9iYWJseSBhIGJ1Zy4NCj4+ICsJcmV0dXJuIGZhbHNlOw0KPiANCj4gU2hvdWxkIHdl
IHdhcm4gYmVmb3JlIHJldHVybiBpbiB0aGlzIGNhc2UgPw0KDQpJIHdvdWxkIG5vdCBkbyBz
byBhcyB0aGUgYnVnIGlzIG5vdCBoZXJlLCBidXQgaW4gc2NyZWVuX2luZm9fcGNpX2Rldigp
LiANCkknbSBnb2luZyB0byB1cGRhdGUgdGhpcyBjaHVuayBzdWNoIHRoYXQgdGhlIG5vbi1Q
Q0kgY2FzZSBpcyBhIHNlcGFyYXRlIA0KZnVuY3Rpb24uDQoNCj4gDQo+IFJldmlld2VkLWJ5
OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------dYFrNSjbZMMGzUq9VVJNFlLr--

--------------hh2zBxLNMvpUf3Ch3xlWqru0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmW48SoFAwAAAAAACgkQlh/E3EQov+Ad
TA/6A5NVY6ClyYBY/DSbwTXzWecCig3x4iOwsDgEAZ5k8issqL1w+nsxu6wBkd+MT0IfdX/SIOi2
t3aFZuOpwKgo8NgWy/vZ+ZlSTDMYFvRsIyW+/mj4P9t8rLbMuBOtymmDB0FMrvT6v5io8+JyJjb7
4axazeLX4UNhxZ09f7YL6czBvtgkUDqLC4viUqtD3w2eDgDnTz18pwJdoKx1tivZGcCy/+Pb+pyI
OEwsxaex0w4nmash91VMhPFT65AwErtP7+OX/gaqub+LMxrmgb3Gmbz2KR3aRRPV/6ycFitM/mvp
wKHNldiZpW8u/pfqjrnwe5y0mfG+oa2439YQcTR4iGhWgn4gQkvB3LdKlFo/k/UMm7KmZKjYcDfT
9Kia7KCUrH3HqEoloZcwkYjemyAq7qdMCqDiHocRg5sNqfRW7X0qtpeHNtdRoFFoXX2tYjb2Ou+K
VhzeLKM+a6bJzVEStoBE9Iza7wrxFCK/YtqceYfV0O9vmHnuqPKQfjQVYjBiyHpIM/QENto4J4in
9Ay7I3CoH8yX8bpu+9WekTRG0FVLp4MlAaZ6PZyMil7bT99lbzW9h0mr8yWJNXj6dmr5fJ0+j+gK
0bw+Se8kk+kmKATpNP+Yy+fLZFhJBWB0Ubd2U0kBqLRsm5qvRTOINrYe6a4mUJcFOTkbB59jnsea
MA8=
=oCK6
-----END PGP SIGNATURE-----

--------------hh2zBxLNMvpUf3Ch3xlWqru0--

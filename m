Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203447F282C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFA110E2A5;
	Tue, 21 Nov 2023 08:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC8710E2A5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:56:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 23F411F8B4;
 Tue, 21 Nov 2023 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700556995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DuPJu93mgheSLNH9ndHuecTOXlSKZD3FjsakZM/Qfuo=;
 b=YWWH4tFbsS7bpQuSxX0aGnIffCKrlCcLYr+kSYnsMApJHkmy0UEM08V43M0RVFGn5RFzJn
 7XuiHtkBadKXvD5En7ZzRBk0KtLBnPKWmVL0DBn1O78pYv9d+DneTMjq+GMTaOb5e8HkG5
 HMSSdq22utxFveOaldS+XmDsyLE1Ob4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700556995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DuPJu93mgheSLNH9ndHuecTOXlSKZD3FjsakZM/Qfuo=;
 b=hBZJWKPHIVKF8iZZsurUScPkD0k3RZmBlfvc+cvUcxFuSqfN7THBvWLN4XFHZP0yVsqMqC
 RDb6dH2fpFterkCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C91E5139FD;
 Tue, 21 Nov 2023 08:56:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UCjUHMJwXGV+GAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Nov 2023 08:56:34 +0000
Message-ID: <c24ff645-a160-4ac8-a7b6-7e94e657af0c@suse.de>
Date: Tue, 21 Nov 2023 09:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-12-tzimmermann@suse.de>
 <nycvar.YFH.7.76.2311210942200.29220@cbobk.fhfr.pm>
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
In-Reply-To: <nycvar.YFH.7.76.2311210942200.29220@cbobk.fhfr.pm>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gIFdOBbi4JbF0AqBDZb0biuj"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -10.04
X-Spamd-Result: default: False [-10.04 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; BAYES_HAM(-2.75)[98.90%];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 FREEMAIL_CC(0.00)[gmx.de,redhat.com,vger.kernel.org,lists.freedesktop.org,linux-vserver.org];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gIFdOBbi4JbF0AqBDZb0biuj
Content-Type: multipart/mixed; boundary="------------KkxOZwBlmkh8nGhHWYz63qGD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jiri Kosina <jikos@kernel.org>
Cc: deller@gmx.de, javierm@redhat.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Bruno_Pr=C3=A9mont?=
 <bonbons@linux-vserver.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Message-ID: <c24ff645-a160-4ac8-a7b6-7e94e657af0c@suse.de>
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-12-tzimmermann@suse.de>
 <nycvar.YFH.7.76.2311210942200.29220@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2311210942200.29220@cbobk.fhfr.pm>

--------------KkxOZwBlmkh8nGhHWYz63qGD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTEuMjMgdW0gMDk6NDIgc2NocmllYiBKaXJpIEtvc2luYToNCj4gT24g
V2VkLCAxNSBOb3YgMjAyMywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+IA0KPj4gVGhl
IHBpY29sY2RfZmIgZHJpdmVyIG9wZXJhdGVzIG9uIHN5c3RlbSBtZW1vcnkuIE1hcmsgdGhl
IGZyYW1lYnVmZmVyDQo+PiBhY2NvcmRpbmdseS4gSGVscGVycyBvcGVyYXRpbmcgb24gdGhl
IGZyYW1lYnVmZmVyIG1lbW9yeSB3aWxsIHRlc3QNCj4+IGZvciB0aGUgcHJlc2VuY2Ugb2Yg
dGhpcyBmbGFnLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4gQ2M6ICJCcnVubyBQcsOpbW9udCIgPGJvbmJvbnNA
bGludXgtdnNlcnZlci5vcmc+DQo+PiBDYzogSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5v
cmc+DQo+PiBDYzogQmVuamFtaW4gVGlzc29pcmVzIDxiZW5qYW1pbi50aXNzb2lyZXNAcmVk
aGF0LmNvbT4NCj4+IENjOiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcNCj4gDQo+IEFj
a2VkLWJ5OiBKaXJpIEtvc2luYSA8amtvc2luYUBzdXNlLmN6Pg0KPiANCj4gSSBndWVzcyB0
aGlzIHdpbGwgZ28gaW4gYXMgb25lIHNlcmllcyB0b2dldGhlciwgcmlnaHQ/DQoNClllcy4g
SSBpbnRlbmQgdG8gbW92ZSBhbGwgdGhpcyB0aHJvdWdoIHRoZSBEUk0gdHJlZXMuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkN
CkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVu
IE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------KkxOZwBlmkh8nGhHWYz63qGD--

--------------gIFdOBbi4JbF0AqBDZb0biuj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVccMEFAwAAAAAACgkQlh/E3EQov+BQ
ShAAs9V17y1wTozgqL3e9IODe3yCmT2qpqTmMFmdprH/4JytmSLztP6o7ekphY+MB60rrU55RmjJ
iiLNS1fdmHEP/yX7+R/kX94EXmY+D8WaceG+lVjgI4vKuWqqAQhZNcd+EHBgz7t1b8ToY0gUZSQH
SeHUhSAyDXsDESmD+xE1jUEAbtC3zrQj+z+8ve3Smi2hXG7NduqHigQJaHR1dzzj6ZSPJtBexqYk
Hw5z+p1+ujzS0HJ8P9hF8Iqit1bcjDG7aroP1SZdD3sxLw7l7GSsWuWSOzvYOs+kpUR8TDDivyk7
fi86ky3+bWwaI42EbEQZ5HDKKtw9Uk1ANmKf3XCk8Axz0exLY5L+UApmHfed/7QNngFXRiMWgZnR
RDF8Zq5lJWeXdtSY4xTyWrKikkW9vOkQs1j+fxfbz1vmyoRo6/u2nb1Xjixue8fKdZPKq6VyYPJf
HHOHQtELHGnBVdndf3gVQKOsr0x78FxcndTzA4FLHlWbS+czlxBbkfLYzi9g4uipiud/l+CQgNo0
cjpQlss5JqRI++xizrDXBnWVGWSyT19r9yk8dCqkI5dgrbEzvOW+wMrfMyJuospZXEfkzwrg7YeB
4jCoh9A4YGUUSgjlWXJ1pHMTM/4KDpuo6vSnYNGka7Ar2H48n2GpVFZxwwb9LCrEco8JvtqXrOik
ov4=
=TD8O
-----END PGP SIGNATURE-----

--------------gIFdOBbi4JbF0AqBDZb0biuj--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6497CA53F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0475B10E0A5;
	Mon, 16 Oct 2023 10:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270110E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 10:24:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8520221C45;
 Mon, 16 Oct 2023 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697451887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/ORFMWix3MYDfjHMaKHh2Jgtl1f9CIiztOA5RJHgAt0=;
 b=oDcxjpT0Hw/6D46Rz7dGElEAarnBz1C5ilVXpNmzVKts1NSjrGmio0J7D0Z8men/sRW/iH
 aLKP6F0u8OwdjwxaLJApvKY863txr2p/ghnWhtRgaWBIclhlkbmdv4EhD+7LagatzwHqXC
 ag2PsvdoFyMPOcauo7iqTxLEBdHJKA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697451887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/ORFMWix3MYDfjHMaKHh2Jgtl1f9CIiztOA5RJHgAt0=;
 b=9AnD8zAfbz/2QFLWqFLgfEJ+uWC/LCgWZlqyjeKjfvxWkTv8YNAI8XdLFI1aaH3rRAmrkD
 nq7Zm09pj9QNgUAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A10E133B7;
 Mon, 16 Oct 2023 10:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CSS3C28PLWWMUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Oct 2023 10:24:47 +0000
Message-ID: <4fe078c9-e037-4dca-bb23-dc38763bc2b3@suse.de>
Date: Mon, 16 Oct 2023 12:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] drm/ssd130x: Fix atomic_check for disabled planes
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <20231009141018.11291-7-tzimmermann@suse.de>
 <87wmvq30kc.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87wmvq30kc.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lRYW2R0uY0WB7PsjFc9Pm6Ef"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.53
X-Spamd-Result: default: False [-0.53 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 BAYES_HAM(-2.94)[99.76%]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_TWELVE(0.00)[12]; NEURAL_SPAM_LONG(3.00)[1.000];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,riseup.net,linux.intel.com,kernel.org,ffwll.ch,tronnes.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lRYW2R0uY0WB7PsjFc9Pm6Ef
Content-Type: multipart/mixed; boundary="------------ZQ7jOmRJOtXWqriw0J77xsSt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <4fe078c9-e037-4dca-bb23-dc38763bc2b3@suse.de>
Subject: Re: [PATCH v5 6/7] drm/ssd130x: Fix atomic_check for disabled planes
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <20231009141018.11291-7-tzimmermann@suse.de>
 <87wmvq30kc.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87wmvq30kc.fsf@minerva.mail-host-address-is-not-set>

--------------ZQ7jOmRJOtXWqriw0J77xsSt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMTAuMjMgdW0gMTk6MTYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPj4gVGhlIHBsYW5lJ3MgYXRvbWljX2No
ZWNrIHJldHVybnMgLUVJTlZBTCBpZiB0aGUgQ1JUQyBoYXMgbm90IGJlZW4NCj4+IHNldC4g
VGhpcyBpcyB0aGUgY2FzZSBmb3IgZGlzYWJsZWQgcGxhbmVzLCBmb3Igd2hpY2ggYXRvbWlj
X2NoZWNrDQo+PiBzaG91bGQgcmV0dXJuIDAuIEZvciBkaXNhYmxlZCBwbGFuZXMsIGl0IGFs
c28gb21pdHMgdGhlIG1hbmRhdG9yeQ0KPj4gY2FsbCB0byBkcm1fYXRvbWljX2hlbHBlcl9j
aGVja19wbGFuZV9zdGF0ZSgpLg0KPj4NCj4+IFJlcGxhY2UgdGhlIHRlc3Qgd2l0aCB0aGUg
Ym9pbGVyLXBsYXRlIGNvZGUgdGhhdCBmaXJzdCBpbnZva2VzDQo+PiBkcm1fYXRvbWljX2hl
bHBlcl9jaGVja19wbGFuZV9zdGF0ZSgpIGFuZCB0aGVuIHRlc3RzIGZvciB0aGUgcGxhbmUN
Cj4+IHRvIGJlIHZpc2libGUuIFJldHVybiBlYXJseSBmb3Igbm9uLXZpc2libGUgcGxhbmVz
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPj4gRml4ZXM6IGQ1MWY5ZmJkOThiNiAoImRybS9zc2QxMzB4OiBTdG9y
ZSB0aGUgSFcgYnVmZmVyIGluIHRoZSBkcml2ZXItcHJpdmF0ZSBDUlRDIHN0YXRlIikNCj4+
IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0
LmNvbT4NCj4+IFRlc3RlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJt
QHJlZGhhdC5jb20+DQo+PiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVk
aGF0LmNvbT4NCj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+
PiAtLS0NCj4gDQo+IEkndmUgcGlja2VkIHRoaXMgc2luY2UgaXQncyBhbiB1bnJlbGF0ZWQg
Zml4IHRvIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMuDQo+IA0KPiBQdXNoZWQgdG8gZHJtLW1p
c2MgKGRybS1taXNjLW5leHQpIGJlY2F1c2UgdGhlIG9mZmVuZGluZyBjb21taXQgaXMgbm90
DQo+IGluIG1haW5saW5lIHlldC4gVGhhbmtzIQ0KDQpNYWtlcyBzZW5zZSwgdGhhbmtzIGEg
bG90Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------ZQ7jOmRJOtXWqriw0J77xsSt--

--------------lRYW2R0uY0WB7PsjFc9Pm6Ef
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUtD24FAwAAAAAACgkQlh/E3EQov+DD
nA/9GytwOvpfmchjU1jslbnX/dnxSqLV0g8jrwgSR6GPPCoZ5GoEVLDXhgcRKZOIcmDr0YmSWmUq
2pE1ITFcFFtxCBQfcvi9UDSqc23oA3ONlGhnp8KFoLdhrmiCtXa5W3dO5KMI6ML26qSspVhrNKdx
CX5Oc5OyxziNzQKOQ83I4WKlCud3GxpXgdH/fID79Il843J+TsnO1bCO1oJa9O+k+CiFudFWrSz8
8eJBN36F4Ni0uShO5TosZZqambpXJ/V3xBYkfIc5oZUP+tkHnJRuqlOPeJgEtDGIp8zIm4DtoGs3
qDKwDoQcdtzh+UrO9Z4B/pCFlOIl7D8XkndL0Sto4vXoIH/IbKb6KHeuLFGwqso9rPZTmg3+PwOr
IqUEHih5SMhbv1J9mtpY1cdgcuj8nUe5Ej4a27eUcxVhxjNztNJi8XbHa4nSf2Lb8XF9bHmP/TTZ
GyFx/C7bmgXJbLRgsERZhPUKOeELJnPk5QzG3rwuvg51qMQUDM51uL4jGV8M2eYyjq73WQpmpu09
ypGWL1EcH/bDxZdZVJIMMMZKGG4tWgmMgLHtrgz9I6E0orpe93Ar9knrO1P3ZWV+IcKYicqu1TTy
vIZ403QJIQKATpQFC0y48bmO/kdDH/wtx3a2/RpnXDP8d2brMBamNHZ4pLaCxUNHxDr7OoaDjOvG
ffU=
=TbI/
-----END PGP SIGNATURE-----

--------------lRYW2R0uY0WB7PsjFc9Pm6Ef--

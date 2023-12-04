Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645A802E40
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F8F10E30B;
	Mon,  4 Dec 2023 09:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5543510E30B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:14:35 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D76AE1FE5A;
 Mon,  4 Dec 2023 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701681273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VIFPHk0H0R086+3Ov4xbWcqrlYrl2RANjIltBGKNLtk=;
 b=beyBhsRDmA5o04+49m32smJ/OjhF3ZymQ/k8C0S7ffjaTcCOQtOZCT2wziC3InJ/ZGo3jy
 E8MinH1AdcLvdDUV7lR/VaTLV7qV4Uefs9QscMpvZXd4fxzrtP8Q1J2IuYiwc1sKQn6uzj
 hFIW5UELRpFFArcS5kljd7GVnIjIhPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701681273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VIFPHk0H0R086+3Ov4xbWcqrlYrl2RANjIltBGKNLtk=;
 b=xaRpwK7GD6C4U6cbCBRdGpF/y7ov+Up43adaObBTjkRsQEaEBbXINrTDm6E1bwrZlIe3I/
 A1ZOlwpu5jM5MBDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BDE8913588;
 Mon,  4 Dec 2023 09:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id BiijLHmYbWVAKgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Dec 2023 09:14:33 +0000
Message-ID: <acff5364-b0d4-40f0-a67a-d3c57c32ff6e@suse.de>
Date: Mon, 4 Dec 2023 10:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH 3/4] fbdev/vesafb: Replace references to global
 screen_info by local pointer
References: <87sf4ml2uc.fsf@minerva.mail-host-address-is-not-set>
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
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
In-Reply-To: <87sf4ml2uc.fsf@minerva.mail-host-address-is-not-set>
X-Forwarded-Message-Id: <87sf4ml2uc.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZllvkmLRz4rEXJg4JNUIWzYT"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.41
X-Spamd-Result: default: False [-3.41 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BAYES_HAM(-1.32)[90.24%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 MIME_BASE64_TEXT(0.10)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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
--------------ZllvkmLRz4rEXJg4JNUIWzYT
Content-Type: multipart/mixed; boundary="------------O4KzQFhEetPSYwgAptLcXWFE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Message-ID: <acff5364-b0d4-40f0-a67a-d3c57c32ff6e@suse.de>
Subject: Fwd: [PATCH 3/4] fbdev/vesafb: Replace references to global
 screen_info by local pointer
References: <87sf4ml2uc.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87sf4ml2uc.fsf@minerva.mail-host-address-is-not-set>

--------------O4KzQFhEetPSYwgAptLcXWFE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

Y2MnaW5nIG1haWxpbmcgbGlzdHMNCg0KDQotLS0tLS0tLSBXZWl0ZXJnZWxlaXRldGUgTmFj
aHJpY2h0IC0tLS0tLS0tDQpCZXRyZWZmOiBSZTogW1BBVENIIDMvNF0gZmJkZXYvdmVzYWZi
OiBSZXBsYWNlIHJlZmVyZW5jZXMgdG8gZ2xvYmFsIA0Kc2NyZWVuX2luZm8gYnkgbG9jYWwg
cG9pbnRlcg0KRGF0dW06IEZyaSwgMDEgRGVjIDIwMjMgMDk6NTQ6NTEgKzAxMDANClZvbjog
SmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQpBbjogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNClRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0ZXM6DQoNCj4gR2V0IHRoZSBnbG9iYWwg
c2NyZWVuX2luZm8ncyBhZGRyZXNzIG9uY2UgYW5kIGFjY2VzcyB0aGUgZGF0YSB2aWENCj4g
dGhpcyBwb2ludGVyLiBMaW1pdHMgdGhlIHVzZSBvZiBnbG9iYWwgc3RhdGUuDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
PiAtLS0NCg0KUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVy
bUByZWRoYXQuY29tPg0KDQotLSANCkJlc3QgcmVnYXJkcywNCg0KSmF2aWVyIE1hcnRpbmV6
IENhbmlsbGFzDQpDb3JlIFBsYXRmb3Jtcw0KUmVkIEhhdA0KDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJl
cmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9u
YWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------O4KzQFhEetPSYwgAptLcXWFE--

--------------ZllvkmLRz4rEXJg4JNUIWzYT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVtmHkFAwAAAAAACgkQlh/E3EQov+BY
Og//cIWArdwIkRc/7X24yi0wiU6b+mq+oiVRT2fOWS+NS2vlnv9qHSdh2ofTH3BGveEN/76JqpTw
au95k5uHKYwlIYgx6qSP/HJ5e+GO4skTOzdeeIxpFE6vrUALcwa2Bs5XRrmapSCRQn8FiwEiGUIc
O/ApHu/EH25cf0kRS76cMTyaobtsUWDZPzxPpppWz5HszQke2ilJhVq//2Bhyv/N0i6raIsprCHB
NmSG8TU/1Lql/TU615ecHUyzhZT43D/qA6WdBskatjQAJz5epG14zSEpcxjdTPifVA3f2eysIGKD
fY3yopo36iMSK/2pXF2D4C7XtCXyz5XmSzjnl/GjAmCMb+SejHf5j9FHpVyTo8fQ5EqfYbsjP7sJ
LY+Z1bszpZPYPRNTLvWwhmh5u5cy7EhBCEf2yaXD3AHV2OMMQnh2BavruSPmnnmm6TyzIM2TZE+8
s8ePen2jUmKd6111m9R8liRRATfYsP++y4z01c6nu84QD7cv3/qDvQppg29tIhaAmsHBiQRaS68+
xhgMmItsxXf/O1iXMllRXXY9lfO6Uk5Ywk9C4xqI7pIeibs6rrBG2kq+JLb+OzKbk5tik67oKN39
obj7OZVEwV/hdF+zCa/XMu67P9whPoFnhlIZjsPM7eJtqDKK75nswznG+IHv6/eBlwXJlkFh1eED
Kbk=
=2a5B
-----END PGP SIGNATURE-----

--------------ZllvkmLRz4rEXJg4JNUIWzYT--

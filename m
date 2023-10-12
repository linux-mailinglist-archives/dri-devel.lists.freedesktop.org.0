Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A437C66CD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 09:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8F110E426;
	Thu, 12 Oct 2023 07:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289A310E426
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 07:56:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3DD0C21833;
 Thu, 12 Oct 2023 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697097404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hrj0obP3S6cAjgl0VbNnEW+KQ9Hbu28sU99NH9hQKSs=;
 b=Mzf+jAnn3ctoiY6sqRcokbGye8wq22krifI1uB5Qz1anRBaYaPQnT7ggHsHv8KMQu8B4VU
 vdEzKM6k0bOr1+MXFd5vDbb9+lq/oTr5vto2GdJ+AiLvbPQfkEp+HoBcH0YXlBRfpiPI4G
 rxlqZBv55XydXe29wme6kW0XDVlLZ4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697097404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hrj0obP3S6cAjgl0VbNnEW+KQ9Hbu28sU99NH9hQKSs=;
 b=ou1tQozk4bcpUcNu073sqDWvrPvFNv5SxY/aP5zoxuWs8cp4hjUyfMo1jFUCrDu0Yd20wB
 Zs4o1duNGbEgO7CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28331139F9;
 Thu, 12 Oct 2023 07:56:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mWwBCbymJ2WZOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Oct 2023 07:56:44 +0000
Message-ID: <00b60389-90e5-48b9-b8db-f8de0a373859@suse.de>
Date: Thu, 12 Oct 2023 09:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iosys-map: fix kernel-doc typos
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20230930221428.18463-1-rdunlap@infradead.org>
 <20230930221428.18463-2-rdunlap@infradead.org>
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
In-Reply-To: <20230930221428.18463-2-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S80Jn3n04PSKdefh50JtKNM9"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.09
X-Spamd-Result: default: False [-5.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-0.00)[12.57%];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_COUNT_TWO(0.00)[2];
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S80Jn3n04PSKdefh50JtKNM9
Content-Type: multipart/mixed; boundary="------------LZMvJG0ZDocDviLEJzyZ366F";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <00b60389-90e5-48b9-b8db-f8de0a373859@suse.de>
Subject: Re: [PATCH] iosys-map: fix kernel-doc typos
References: <20230930221428.18463-1-rdunlap@infradead.org>
 <20230930221428.18463-2-rdunlap@infradead.org>
In-Reply-To: <20230930221428.18463-2-rdunlap@infradead.org>

--------------LZMvJG0ZDocDviLEJzyZ366F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnNvcnJ5LCBJIG1pc3NlZCB0aGlzIHBhdGNoIGF0IGZpcnN0Lg0KDQpBbSAwMS4x
MC4yMyB1bSAwMDoxNCBzY2hyaWViIFJhbmR5IER1bmxhcDoNCj4gQ29ycmVjdCBzcGVsbGlu
ZyBvZiAiYmVnaW5uaW5nIi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oIHwgICAgNCArKy0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS0gYS9pbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oIGIvaW5jbHVkZS9s
aW51eC9pb3N5cy1tYXAuaA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oDQo+
ICsrKyBiL2luY2x1ZGUvbGludXgvaW9zeXMtbWFwLmgNCj4gQEAgLTQyNiw3ICs0MjYsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgaW9zeXNfbWFwX21lbXNldChzdHJ1DQo+ICAgICogaW9z
eXNfbWFwX3JkX2ZpZWxkIC0gUmVhZCBhIG1lbWJlciBmcm9tIGEgc3RydWN0IGluIHRoZSBp
b3N5c19tYXANCj4gICAgKg0KPiAgICAqIEBtYXBfXzoJCVRoZSBpb3N5c19tYXAgc3RydWN0
dXJlDQo+IC0gKiBAc3RydWN0X29mZnNldF9fOglPZmZzZXQgZnJvbSB0aGUgYmVnZ2luaW5n
IG9mIHRoZSBtYXAsIHdoZXJlIHRoZSBzdHJ1Y3QNCj4gKyAqIEBzdHJ1Y3Rfb2Zmc2V0X186
CU9mZnNldCBmcm9tIHRoZSBiZWdpbm5pbmcgb2YgdGhlIG1hcCwgd2hlcmUgdGhlIHN0cnVj
dA0KPiAgICAqCQkJaXMgbG9jYXRlZA0KPiAgICAqIEBzdHJ1Y3RfdHlwZV9fOglUaGUgc3Ry
dWN0IGRlc2NyaWJpbmcgdGhlIGxheW91dCBvZiB0aGUgbWFwcGluZw0KPiAgICAqIEBmaWVs
ZF9fOgkJTWVtYmVyIG9mIHRoZSBzdHJ1Y3QgdG8gcmVhZA0KPiBAQCAtNDk0LDcgKzQ5NCw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpb3N5c19tYXBfbWVtc2V0KHN0cnUNCj4gICAgKiBp
b3N5c19tYXBfd3JfZmllbGQgLSBXcml0ZSB0byBhIG1lbWJlciBvZiBhIHN0cnVjdCBpbiB0
aGUgaW9zeXNfbWFwDQo+ICAgICoNCj4gICAgKiBAbWFwX186CQlUaGUgaW9zeXNfbWFwIHN0
cnVjdHVyZQ0KPiAtICogQHN0cnVjdF9vZmZzZXRfXzoJT2Zmc2V0IGZyb20gdGhlIGJlZ2dp
bmluZyBvZiB0aGUgbWFwLCB3aGVyZSB0aGUgc3RydWN0DQo+ICsgKiBAc3RydWN0X29mZnNl
dF9fOglPZmZzZXQgZnJvbSB0aGUgYmVnaW5uaW5nIG9mIHRoZSBtYXAsIHdoZXJlIHRoZSBz
dHJ1Y3QNCj4gICAgKgkJCWlzIGxvY2F0ZWQNCj4gICAgKiBAc3RydWN0X3R5cGVfXzoJVGhl
IHN0cnVjdCBkZXNjcmliaW5nIHRoZSBsYXlvdXQgb2YgdGhlIG1hcHBpbmcNCj4gICAgKiBA
ZmllbGRfXzoJCU1lbWJlciBvZiB0aGUgc3RydWN0IHRvIHJlYWQNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------LZMvJG0ZDocDviLEJzyZ366F--

--------------S80Jn3n04PSKdefh50JtKNM9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUnprsFAwAAAAAACgkQlh/E3EQov+DR
kQ//aV72b+OihC1iiwLm0rHg2OG7Io5N1qwGuqJzFJj2yAMByPv3Gv4XmC5McopOWA6iaOK6+U9q
ZX8d7olvHNyFUN33LXFBafVz/51iZn+4AtFB1aY0lH11g/034h70CswtM1TgRrTHVuC9+goceemU
yLXwYj3stD8x/YBunsU4N0J+N3AO3XRZIhKqw0Rf2NnPULdTNw/folNFnU9JMwmvHtgyMHpvhdC3
4ZcoCkWwVD+7oS9qT9qaGGKlW6ah6QRWfvKxxACHGU3lhcCWDaBcwGRRLTKFDD6MqX3lpzHZYNRJ
FGLim1vAUzJqtRlsSGWR/wtu40CUx/2cdaV0O+MABb5eI/I2YhX6xhmmcJMf+vAJBuv+P2HCeWvg
z5gzKwlhVwHEVqhk0ovN1cczKQiLlUNFlP9aBgokBQqmZe1bAwT3R4g1kCh8S+M8FXna0bwEV6vo
1d07wHxuUBCnNMAu/NSf4x+GDmRXqWmh7yPjYYerWEs8nT6uV/IglYPwFqiiCxillSnoQYuWqmhy
8esQyg4iZcRbqF0LID5LKkaIoSET0o0hOq0tT0dHFlxe9+cycWQOZ8DqVKtvJVODGyC5H74j4NME
p1UqKepWMtGP38OB6+b6dcHzBTl6bjhxCUcOu9B60Pd9JIUmE6TOn1S6bRrqyocUisv+UBP2SGEl
NDM=
=jxKG
-----END PGP SIGNATURE-----

--------------S80Jn3n04PSKdefh50JtKNM9--

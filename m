Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500179A618
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97710E199;
	Mon, 11 Sep 2023 08:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94210E199
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:40:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BF5A1F460
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694421612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=rQYkBtUdF+AAiy7eIMRfQ3wlMv/BV7PYJnFktEVL6aQ=;
 b=UWWlbK/bA0RTEXyKyCm/EcsItrU7yDCbByOtCLEG01AQ8qJ4aB4bAMT6EOpC4SiWPZ6ZjF
 hOt/8DvPRRw/yeBe7kjmUFGJ3GaO9YvPWGBw3/0GyN3+Qp0FUNltRrjpUfcYgtkB3N0ga1
 doUWqW6DTgozxcqduWe+CfOq3O3carE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694421612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=rQYkBtUdF+AAiy7eIMRfQ3wlMv/BV7PYJnFktEVL6aQ=;
 b=k/nVGdi4EuhtePIT0UfgAYN0OX19Qk6d4Zp2CDZjqoBxpxndFkMcXcXVNd8lDGMX3xbMF8
 5bBxvNzwFcTK52Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E9B613780
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:40:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JE1PDmzS/mS0DgAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:40:12 +0000
Message-ID: <f7678932-184f-4c07-84f1-c0fa1b11610b@suse.de>
Date: Mon, 11 Sep 2023 10:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is closed
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Language: en-US
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
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zX4P7dQsQsmEo4ajii4tzsDV"
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
--------------zX4P7dQsQsmEo4ajii4tzsDV
Content-Type: multipart/mixed; boundary="------------iFMJq0pWmyGHUQBwAu9Wm4qn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <f7678932-184f-4c07-84f1-c0fa1b11610b@suse.de>
Subject: PSA: drm-misc-next-fixes is closed

--------------iFMJq0pWmyGHUQBwAu9Wm4qn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkknbSBqdXN0IGxldHRpbmcgeW91IGtub3cgdGhhdCBkcm0tbWlzYy1uZXh0LWZp
eGVzIGlzIGNsb3NlZCBhcyB2Ni42LXJjMSANCmhhcyBiZWVuIHRhZ2dlZCBvbiBTdW5kYXku
IERSTSdzIGRybS1uZXh0IHRyZWUgd2lsbCBiZSBvcGVuIGZvciBmZWF0dXJlcyANCmFuZCBi
dWdmaXhlcyB1bnRpbCAtcmM2IGNvbWVzIG91dC4NCg0KVGhlIHRyYW5zaXRpb24gZnJvbS90
byBkcm0tbWlzYy1maXhlcy1uZXh0IHNvbWV0aW1lcyByZXN1bHRzIGluIHBhdGNoZXMgDQpn
ZXR0aW5nIGFwcGxpZWQgdG8gdGhlIHdyb25nIHRyZWUgYW5kL29yIGdldHRpbmcgc3R1Y2sg
Zm9yIGEgbG9uZyB0aW1lLiANClNvbWUgcnVsZXMgb2YgdGh1bWIgYXJlOg0KDQogICAqIGlm
IHlvdXIgcGF0Y2ggZml4ZXMgYSBidWcgaW4gdXBzdHJlYW0sIHBsZWFzZSBwdXQgaXQgaW50
byANCmRybS1taXNjLWZpeGVzLA0KDQogICAqIGFueXRoaW5nIGVsc2Ugc2hvdWxkIGdvIGlu
dG8gZHJtLW1pc2MtbmV4dC4NCg0KVGhlIGZsb3cgY2hhcnQgaXMgYXQgWzFdLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3Rv
cC5vcmcvbWFpbnRhaW5lci10b29scy9jb21taXR0ZXItZHJtLW1pc2MuaHRtbCN3aGVyZS1k
by1pLWFwcGx5LW15LXBhdGNoDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------iFMJq0pWmyGHUQBwAu9Wm4qn--

--------------zX4P7dQsQsmEo4ajii4tzsDV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT+0msFAwAAAAAACgkQlh/E3EQov+Dc
5g/+PB7MD6sDfopAiunHCUFGsg5+uMEyxeVOlIHvsiLU5KSNXqJJdoQpVFa458fA5+2le9fV8QeT
v1tppMHmL485IcKZojmpXLFg45/EHrwFY+PMjJdbY2CCOTD7bH5rXh1vUZ+jkzXxxoMXwSJYWQ+w
8JWTICuIEP1WbsT8zhUAhoA7Te3XMMuJNMTWNuJsYqSBzf+E83dBsJixfuyuLW0dZ2CubRqS69B9
owGf6aYQsBVK5sA59CjZ7TtbMhOHOdgLhPmFjCFASCJcvvLPBqfnro3qiypnxhePatRZguXnNd7c
0ZV8dRS2q5/3R+srM4G908VWXSaPj8Nxs7AF6ThZ8PhyhL9F3KhA+OnKzErCMYqNhhjvtaqLOW13
bQngEbdKi5LCTNZu7+N6s5L2Md0BCXwSqX3u1XTIBThScmtldgRdSsPPWcNa/4Ht9P5hPgC6kwZB
bnfKNirNBkAsGddD2d/UPw8sitgV6csFcooXmssDVjwqSByV4x3YyIk1m5DjblAacw79NkW0pZaO
8CXQbuABl11POu6fmiEu4wa1oAaLR0WQxgAoVEBfW2+oXZH9FjzI8GtlGFn7ZXarJxud/hlNe6cT
IjspIpYE8WoAShEPIeSpGHidnxD5yi+KWNeBH+G/020vDmy/VDjocnPSwOZ+xo1KCx/eyh8RmwPZ
0gg=
=Ax2S
-----END PGP SIGNATURE-----

--------------zX4P7dQsQsmEo4ajii4tzsDV--

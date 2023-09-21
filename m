Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DA7A92DC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A583510E58D;
	Thu, 21 Sep 2023 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19FE10E58D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:55:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5EC11338A1;
 Thu, 21 Sep 2023 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695286505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2opG4Jd738z1u4yL12DErFg1NgQFBk92ekhEYQherNE=;
 b=YgqlQmvXig7QKQMZ1Gjl2UzqcVHlCVZLl14VlQkwvj9kguHfzf7S9k+pG94ylPS1AKwQrG
 iY217u8QjwIg9dh6XMkpoHrfVXyynWyL0WF7Td7a519TIRn7vTg9LhkvroUdqTrqDujC18
 7mcWbFJJjbT+Z3NZsiEkd4YZUSePo74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695286505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2opG4Jd738z1u4yL12DErFg1NgQFBk92ekhEYQherNE=;
 b=9cMbFEJ8FqpE7vvPC49OX3udiZqd/vo3gicg4MnrjbTdXxTQxPxzehjq+KGeeSEAPQAddO
 Ul92pF+nOdMIpODQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C7A3134B0;
 Thu, 21 Sep 2023 08:55:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8oKoDekEDGUIJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Sep 2023 08:55:05 +0000
Message-ID: <bee087f0-878c-480a-b72b-6b3dd69b84a6@suse.de>
Date: Thu, 21 Sep 2023 10:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
 <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
 <CAMuHMdV9Q=F6D=FgBYazjxGL8HY1cRLJUxdfdvr8=6fwgn+EHQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdV9Q=F6D=FgBYazjxGL8HY1cRLJUxdfdvr8=6fwgn+EHQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------URSyQjLCn3tx06YR40iVAL8Q"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------URSyQjLCn3tx06YR40iVAL8Q
Content-Type: multipart/mixed; boundary="------------80bgPEWtLxdILzGnP5ci1a0a";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Message-ID: <bee087f0-878c-480a-b72b-6b3dd69b84a6@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
 <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
 <CAMuHMdV9Q=F6D=FgBYazjxGL8HY1cRLJUxdfdvr8=6fwgn+EHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV9Q=F6D=FgBYazjxGL8HY1cRLJUxdfdvr8=6fwgn+EHQ@mail.gmail.com>

--------------80bgPEWtLxdILzGnP5ci1a0a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDkuMjMgdW0gMTA6NDYgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQpbLi4uXQ0KPiANCj4+PiBBbnl0aGluZyBlbHNlIGNvbmZ1c2VzIHRoZSBjYXN1YWwgcmVh
ZGVyLiBQZXJoYXBzIHRoZSByZWFsIHF1ZXN0aW9uIGlzIHdoZXRoZXINCj4+PiB0aGUgc3Ry
dWN0dXJlcyBzaG91bGQgaGF2ZSAiaGVscGVyIiBpbiB0aGVpciBuYW1lIGluIHRoZSBmaXJz
dCBwbGFjZT8NCj4+DQo+PiBUaG9zZSBzdHJ1Y3R1cmVzIGFyZSBtZWFudCBmb3IgZnVuY3Rp
b25zIHVzZWQgYnkgdGhlIGhlbHBlcnMsIHRoZXkgYXJlIG5vdA0KPj4gaGVscGVyIGZ1bmN0
aW9ucy4NCj4gDQo+IFRoYXQgbWlnaHQgYmUgaG93IHRoZXkgc3RhcnRlZCwgYnV0IHRvIG1l
IGl0IGxvb2tzIGxpa2UgYWxsIHRoZXNlIGhlbHBlcnMNCj4gYXJlIG5vIGxvbmdlciBoZWxw
ZXJzLCBidXQgcGFydCBvZiB0aGUgY29yZS4uLg0KDQpUaGV5IGFyZSBpbiBsaWJyYXJ5IG1v
ZHVsZXMuIFlvdSBjYW4gd3JpdGUgYSBEUk0gZHJpdmVyIHdpdGhvdXQgDQpfaGVscGVyX2Z1
bmNzLCBzZWUgaTkxNS4gSXQncyBqdXN0IGEgcmVhbGx5IGhhcmQgc2VsbCB0byB1cHN0cmVh
bSBub3dhZGF5cy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gR3J7b2V0amUs
ZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------80bgPEWtLxdILzGnP5ci1a0a--

--------------URSyQjLCn3tx06YR40iVAL8Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUMBOgFAwAAAAAACgkQlh/E3EQov+Aw
+xAAkfKv53b/mDnrqxidripJBwicaf/LxCVrmq1B1TpVtAPjtaicPJLSmm3s7P+dO3twpbGUkn6b
sRDnm29+xwcjCxDkT+qoKNVOG5nvQXE+6oPqTnczpeB5XwznVdjeLO3zYZfL6O1jA1UDTftDjkls
g4E5XXWRch/40WTJIUhu75nOQtDN6ry8r0pfN2PEXkmcUO2iODHHf13Bow7f2pl9AS4OUE5oYtgT
5wmYO/2nYbMxsLCOQUZzt0cIoQBYNK6s6ymuYL7T5XciGBZlh59/XUYJD0kw0k0qYZ/61FAd9Qwm
qmR8OBSRfTXausEoyFw5EKzBBB5OuE0/z5M65JlY8vAVDQZZAY15px1oPmhK1claScbd8gNMKANI
UGly0emLWHk7eY6g9bfFmV6/k+UINObw4tT6GT9py3nI0WRdThyTUcSEoJi9Ar803H30J0f99cN9
RaP2BoJZa4hHoHpHpWhsZhY86DNCuZInEbT7h8JMmte64927rcYK09alITFaV597YV408SC0asm2
fxzFBpYuyL6J56iSW7sGj+UuJYmaB4IfBYTqB8BoaXv+vKdLcXMoRDNbapcRqxsiL3Jf+XRyjVPH
MG1ykW9Wq0SDNcXeB14G6R793wwj+M3UqzqauQcJO/LQMd6dhsDGJPzX6T0Gw33KP9VJrwutjJWG
EKk=
=khKg
-----END PGP SIGNATURE-----

--------------URSyQjLCn3tx06YR40iVAL8Q--

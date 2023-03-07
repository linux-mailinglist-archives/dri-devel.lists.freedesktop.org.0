Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7226AD93D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 09:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1D810E419;
	Tue,  7 Mar 2023 08:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDFD10E38B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 08:28:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 076391FE0D;
 Tue,  7 Mar 2023 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678177731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Jprg/2ZqJi+stBjtNyDei0I2AvyTotMBFOlHXefoak=;
 b=mDhNbSF3aMAB7XRlRiZ4n6d/uGH6PpdRAHQwZYnF0g2yVyR0wtVroI9S6UH5CkPmlbJVxo
 hRXutdNSy6pBQBbIaCU7f+3y07NoMqQef2+Gf344Lu9H6L8RL5I0Wvjt8gIuh3eWuxNhfL
 G5OfCtfSC1/Fw/tO3COWKT9H/hPUEhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678177731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Jprg/2ZqJi+stBjtNyDei0I2AvyTotMBFOlHXefoak=;
 b=obwmSsSpbhgOChtbZCQfhk67GaaGjE64Q4+ai6Ij3YRP1j9+rsIBYFu4RfDEVWCxQ6BieV
 rSCZs9BoiXulsOCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8F461341F;
 Tue,  7 Mar 2023 08:28:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UVqCKML1BmT6GAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Mar 2023 08:28:50 +0000
Message-ID: <aac88d8e-52e8-e2d5-2f41-bed7886bb3dc@suse.de>
Date: Tue, 7 Mar 2023 09:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 22/99] fbdev/fsl-diu-fb: Duplicate video-mode option string
Content-Language: en-US
To: Timur Tabi <timur@kernel.org>
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-23-tzimmermann@suse.de>
 <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HaGQXWqccYcLXaK3gmshET1b"
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com,
 adaplas@gmail.com, corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net,
 mbroemme@libmpq.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, pjones@redhat.com, paulus@samba.org, geert+renesas@glider.be,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HaGQXWqccYcLXaK3gmshET1b
Content-Type: multipart/mixed; boundary="------------HjiVpQ5oRcoXvwcuMEctHP94";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Timur Tabi <timur@kernel.org>
Cc: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <aac88d8e-52e8-e2d5-2f41-bed7886bb3dc@suse.de>
Subject: Re: [PATCH 22/99] fbdev/fsl-diu-fb: Duplicate video-mode option
 string
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-23-tzimmermann@suse.de>
 <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
In-Reply-To: <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>

--------------HjiVpQ5oRcoXvwcuMEctHP94
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDMuMjMgdW0gMjE6MDQgc2NocmllYiBUaW11ciBUYWJpOg0KPiBPbiBN
b24sIE1hciA2LCAyMDIzIGF0IDEwOjAxIEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiBBc3N1bWUgdGhhdCB0aGUgZHJpdmVyIGRv
ZXMgbm90IG93biB0aGUgb3B0aW9uIHN0cmluZyBvciBpdHMgc3Vic3RyaW5ncw0KPj4gYW5k
IGhlbmNlIGR1cGxpY2F0ZSB0aGUgb3B0aW9uIHN0cmluZyBmb3IgdGhlIHZpZGVvIG1vZGUu
IFRoZSBkcml2ZXIgb25seQ0KPj4gcGFyc2VzIHRoZSBvcHRpb24gc3RyaW5nIG9uY2UgYXMg
cGFydCBvZiBtb2R1bGUgaW5pdGlhbGl6YXRpb24sIHNvIHVzZQ0KPj4gYSBzdGF0aWMgYnVm
ZmVyIHRvIHN0b3JlIHRoZSBkdXBsaWNhdGVkIG1vZGUgb3B0aW9uLiBMaW51eCBhdXRvbWF0
aWNhbGx5DQo+PiBmcmVlcyB0aGUgbWVtb3J5IHVwb24gcmVsZWFzaW5nIHRoZSBtb2R1bGUu
DQo+IA0KPiBTbyBhZnRlciBtb2R1bGVfaW5pdCBpcyBmaW5pc2hlZCwgbW9kZV9vcHRpb25f
YnVmW10gbm8gbG9uZ2VyIGV4aXN0cz8NCg0KRG9lcyB0aGUgX19pbml0IGF0dHJpYnV0ZSBv
biBhIGZ1bmN0aW9uIGFmZmVjdCB0aGUgc3RhdGljIHZhcmlhYmxlcyBpbiANCnRoYXQgZnVu
Y3Rpb24/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBzdGF0aWMgY2hhciBtb2RlX29wdGlvbl9idWZbMjU2XTsNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSBzbnByaW50Zihtb2RlX29wdGlvbl9idWYsIHNpemVvZihtb2RlX29w
dGlvbl9idWYpLCAiJXMiLCBvcHQpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KFdBUk4ocmV0IDwgMCwgImZzbC1kaXUtZmI6IGlnbm9yaW5nIGludmFsaWQgb3B0aW9uLCBy
ZXQ9JWRcbiIsIHJldCkpDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKFdBUk4ocmV0ID49IHNp
emVvZihtb2RlX29wdGlvbl9idWYpLCAiZnNsLWRpdS1mYjogb3B0aW9uIHRvbyBsb25nXG4i
KSkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBmYl9tb2RlID0gbW9kZV9vcHRpb25fYnVmOw0KPiAN
Cj4gSWYgc28sIHRoZW4gSSdtIG5vdCBzdXJlIHRoYXQncyBnb2luZyB0byB3b3JrLiAgZmJf
bW9kZSBpcyB1c2VkIGFmdGVyDQo+IG1vZHVsZV9pbml0LCBpbiBpbnN0YWxsX2ZiKCksIHdo
aWNoIGlzIGNhbGxlZCBieSBmc2xfZGl1X3Byb2JlKCkuDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------HjiVpQ5oRcoXvwcuMEctHP94--

--------------HaGQXWqccYcLXaK3gmshET1b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQG9cIFAwAAAAAACgkQlh/E3EQov+CX
DBAAzA5zJ1daPXNTHtkyRtgnqQ+DGMVeZclf0JYVjU5m0JDuVrDmWm3QmKChA8yb8Gh8gFpwUVqV
BGof9gAWcIs+3RAj3N4vQ1x9d50LTN5AnKAqQeTCGO/MKyzjR2nW39aBjC0AqFDM5Jqa22NYG8MR
P46PJtaf2UeArjkfSe+wXjZ9lfilPwG+xJHc7sBR1dVpbXnh3lve4STxPR+dWMBYF1D3eHDIrNSV
l5CSJFJL4MW+mY7zsixMyF8gT/bQ7U5tDQi8BfwD9a8niSgqO3nUzzkrc0MVwQbZiqQxRp6tqRV/
tWmLz89VNOhdDqQ4UtOnKW8TvBa65ihGQHDbS+ZgMBHFj6Cy4enC/TsKUH9IKXw3Zq+z9c58VR1R
hs9JRaaIlcud0G95PDQ/lM3Nmi53+EhXO17IZXoLCLJmjhMZxaluTE2jIrV2Jm8zJAtC2urJGYk0
vMR3TOJOoNk1ENKcnaCNOnEUumHgrus4hVKcfrF6jpgI/qex/wKrTyQwDD4oZs4lxqLZchucFaPN
HTSXIIx1ktIR4ol7aXRlWf33lNDT4tSy+k0A+EBB2RQcNVO65PpBs4GMhDZJyHyOcgh0feOTkcJX
Svv8Oz8dGkUGBMMHdLwxxEJJV4nsOWRUIywz8hiQ26sw3sIFbS7lsu7850wU3KDpHf89BsKMhJ18
Lvo=
=bzlz
-----END PGP SIGNATURE-----

--------------HaGQXWqccYcLXaK3gmshET1b--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13A43DAE7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 07:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5826E047;
	Thu, 28 Oct 2021 05:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83B6E047
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 05:54:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F8591FD4B;
 Thu, 28 Oct 2021 05:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635400454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=anzenXp2JEcAaI3gg/gJ5h4QSczHFpMHkPJRZQwiCsA=;
 b=t0Mf+KYhmnRDkG9YgkMsaErd2RaZUIh49EV5gkE5RneveWL2WxjjSH93D7bgxlKVSPhK+b
 ORFQr44sD95Yf3jDBFQN3W8hfnFEk+dfYxmru5uKoa+wKrWQaWIa/W/9c7Eyoe3/Ui04bs
 K3mtzpFsMVfNjYnRUy/wVtBMJxr3VHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635400454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=anzenXp2JEcAaI3gg/gJ5h4QSczHFpMHkPJRZQwiCsA=;
 b=lBx2ZINK1zDwG7v9y3MgbNT7C3Wt6PzovimRXMDRl9LoFPjyZ2JqY5P5pVGiCqnLn83xWd
 jMzlONo4ZJlRg4CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59A4B13E3C;
 Thu, 28 Oct 2021 05:54:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6SfNFAY7emHldgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Oct 2021 05:54:14 +0000
Message-ID: <0b71c085-c6de-a109-094e-a1d1d887ebe3@suse.de>
Date: Thu, 28 Oct 2021 07:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: Link CMA framebuffer helpers into KMS helper library
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, naresh.kamboju@linaro.org, dri-devel@lists.freedesktop.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20211026175700.27664-1-tzimmermann@suse.de>
 <YXhM7H156xxAUV3n@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YXhM7H156xxAUV3n@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qgZAVATssR2uP2qkC0crL1ua"
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
--------------qgZAVATssR2uP2qkC0crL1ua
Content-Type: multipart/mixed; boundary="------------0cTnczW54CFVpNYFCo0VdH6I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, naresh.kamboju@linaro.org, dri-devel@lists.freedesktop.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <0b71c085-c6de-a109-094e-a1d1d887ebe3@suse.de>
Subject: Re: [PATCH] drm: Link CMA framebuffer helpers into KMS helper library
References: <20211026175700.27664-1-tzimmermann@suse.de>
 <YXhM7H156xxAUV3n@ravnborg.org>
In-Reply-To: <YXhM7H156xxAUV3n@ravnborg.org>

--------------0cTnczW54CFVpNYFCo0VdH6I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhhbmtzIFNhbSwgSSd2ZSBtZWFud2hpbGUgbWVyZ2VkIHRoZSBwYXRjaCB3aXRoIG91ciBS
LWIuDQoNCkFtIDI2LjEwLjIxIHVtIDIwOjQ2IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBPbiBUdWUsIE9jdCAyNiwgMjAyMSBhdCAwNzo1NzowMFBNICsw
MjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IExpbmtpbmcgdGhlIENNQSBmcmFt
YnVmZmVyIGhlbHBlcnMgaW50byBhIENNQSBoZWxwZXIgbGlicmFyeSBpbg0KPj4gY29tbWl0
IDRiMmI1ZTE0MmZmNCAoImRybTogTW92ZSBHRU0gbWVtb3J5IG1hbmFnZXJzIGludG8gbW9k
dWxlcyIpDQo+PiByZXN1bHRzIGluIGxpbmtlciBlcnJvcnM6DQo+Pg0KPj4gICAgYXJtLWxp
bnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLm86
IFwNCj4+IAkgIGluIGZ1bmN0aW9uIGBkcm1fZmJfY21hX2dldF9nZW1fb2JqJzogXA0KPj4g
CSAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmM6NDY6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgXA0KPj4gCSAgdG8gYGRybV9nZW1fZmJfZ2V0X29iaicNCj4+ICAgIGFybS1s
aW51eC1nbnVlYWJpaGYtbGQ6IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5j
OjQ2OiBcDQo+PiAJICB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1fZ2VtX2ZiX2dldF9v
YmonDQo+PiAgICBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2NtYV9oZWxwZXIuYzo0NjogXA0KPj4gCSAgdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
ZHJtX2dlbV9mYl9nZXRfb2JqJw0KPj4gICAgYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLm86IGluIFwNCj4+IAkgIGZ1bmN0aW9u
IGBkcm1fZmJfY21hX3N5bmNfbm9uX2NvaGVyZW50JzogXA0KPj4gCSAgZHJpdmVycy9ncHUv
ZHJtL2RybV9mYl9jbWFfaGVscGVyLmM6MTMzOiB1bmRlZmluZWQgcmVmZXJlbmNlIFwNCj4+
IAkgIHRvIGBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0Jw0KPj4gICAgYXJt
LWxpbnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVy
LmM6MTM1OiBcDQo+PiAJICB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1fYXRvbWljX2hl
bHBlcl9kYW1hZ2VfaXRlcl9uZXh0Jw0KPj4NCj4+IExpbmsgdGhlIENNQSBmcmFtZWJ1ZmZl
ciBoZWxwZXJzIGludG8gdGhlIEtNUyBoZWxwZXIgbGlicmFyeSB0bw0KPj4gZml4IHRoZSBw
cm9ibGVtLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KPj4gRml4ZXM6IDRiMmI1ZTE0MmZmNCAoImRybTogTW92ZSBH
RU0gbWVtb3J5IG1hbmFnZXJzIGludG8gbW9kdWxlcyIpDQo+PiBSZXBvcnRlZC1ieTogTmFy
ZXNoIEthbWJvanUgPG5hcmVzaC5rYW1ib2p1QGxpbmFyby5vcmc+DQo+PiBSZXBvcnRlZC1i
eTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPg0K
Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+PiBDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4N
Cj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+PiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4NCj4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IA0KPiBQYXRjaCBsb29rcyBmaW5lLA0KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPg0KPiANCj4gCVNhbQ0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------0cTnczW54CFVpNYFCo0VdH6I--

--------------qgZAVATssR2uP2qkC0crL1ua
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF6OwUFAwAAAAAACgkQlh/E3EQov+DA
shAAxK6JtxovjlSrmhSsRN+pVo2kdO0xPinE1D4macMaP2KNArR4Gc7Oo2BZdZARHXa29EUcKvmT
v5AmdENfvvU1TYSfJgBwAhmbh7FQR/fgPbf9vFjgHz/RL9piyRr8qblWzh5X3hXuBriQjAGaniKo
3RJhR6eQPc1VIMDIW8dLxp3DR2iFlgIP157PUKyHojFRTOwCvrN79IGy6q+bOGdeUEH7z3uu+z+K
A51BIY8qeDnNitUDX3vQRjhxF5ee4q2VhX0PayGitPZke7JAqIeaT1QLnMIzZdqhvBb2PD7jfqrz
2gqVUEf6qQDxmDuY57nuLdYju0AFcbvO9k4LEbV7+FW78bAywm+vrnWLp6+JUYqYjo8ozJOMVEOk
6VPDOao0WwJgfKZwexeP/j5wdL6IDrC+xT3ci+5IFuSpSV/30B49XUHXK7wMkYsQKO8ca/Be3ZU6
ZSlf/wYSs+JfHzgSr/+BqDBEaW+xHu12V2iu5FyHZMufk/v4uRN9jXQXU0psS1n0TX3UYX/Ab6xa
AEQh9wJjtbqkbTSnR1HGIOgUFNyZZVl2xFeSzKP3QB1gu5h7ZcrZ1HTTgSz5lbARYeMocpaiz1up
SK42ZpCSlVcFJYTeFLpBrC4crAOwvU5UvNwcbV81rnkKMcm79SMcNKhOU0FmyYgH+f0rUPB21IEi
TW0=
=OYkb
-----END PGP SIGNATURE-----

--------------qgZAVATssR2uP2qkC0crL1ua--

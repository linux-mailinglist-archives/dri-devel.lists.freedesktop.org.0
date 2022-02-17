Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF04B9FC6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 13:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5121E10EB39;
	Thu, 17 Feb 2022 12:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560ED10EC4B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 12:08:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1FED2198B;
 Thu, 17 Feb 2022 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645099735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OOUz7BKsEMjvDLq7arceo7rSscY0B+3BqYIhJjvxB/A=;
 b=DmETP5ucsSYgDh70dDMj5emcsDNr2qhYPyKdeQIKY7TH90TK5gcSsCJF4gSax+TiYMnTJU
 it3Zn27pPJ9n9wCxoIebMN6NLjy5Qz8aBsJPWbsvkh2dGDqDd95NkYSN7kiboqZn0nf/zB
 67It+riW5VB9z9+mPCiAXFwaXjFsZII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645099736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OOUz7BKsEMjvDLq7arceo7rSscY0B+3BqYIhJjvxB/A=;
 b=cU6i1Shlc0rZWFT2L+ji+IKNtM42R8n3lmzQ+/fIaR80CK1781cL8A33DRJ9RH8xrAWjCt
 +5DmMtgD8mieNaDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C73FC13BE2;
 Thu, 17 Feb 2022 12:08:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KbWTL9c6DmK3cAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Feb 2022 12:08:55 +0000
Message-ID: <0fcec169-b0d4-676d-7d3f-e94adccf7c22@suse.de>
Date: Thu, 17 Feb 2022 13:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fbdev: Improve performance of sys_imageblit()
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-3-tzimmermann@suse.de>
 <20220217110519.ql5baa46sbsfb5cy@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220217110519.ql5baa46sbsfb5cy@sirius.home.kraxel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------20g4nOASpwIU8TVqZaBsCmnP"
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
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------20g4nOASpwIU8TVqZaBsCmnP
Content-Type: multipart/mixed; boundary="------------5zMtKdTFg0JVg1wdQx0qCdH2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <0fcec169-b0d4-676d-7d3f-e94adccf7c22@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Improve performance of sys_imageblit()
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-3-tzimmermann@suse.de>
 <20220217110519.ql5baa46sbsfb5cy@sirius.home.kraxel.org>
In-Reply-To: <20220217110519.ql5baa46sbsfb5cy@sirius.home.kraxel.org>

--------------5zMtKdTFg0JVg1wdQx0qCdH2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDIuMjIgdW0gMTI6MDUgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPj4g
LQkJZm9yIChqID0gazsgai0tOyApIHsNCj4+IC0JCQlzaGlmdCAtPSBwcHc7DQo+PiAtCQkJ
ZW5kX21hc2sgPSB0YWJbKCpzcmMgPj4gc2hpZnQpICYgYml0X21hc2tdOw0KPj4gLQkJCSpk
c3QrKyA9IChlbmRfbWFzayAmIGVvcngpIF4gYmd4Ow0KPj4gLQkJCWlmICghc2hpZnQpIHsN
Cj4+IC0JCQkJc2hpZnQgPSA4Ow0KPj4gLQkJCQlzcmMrKzsNCj4+ICsJCWZvciAoaiA9IGs7
IGo7IGogLT0gamRlY3IsICsrc3JjKSB7DQo+PiArCQkJc3dpdGNoIChwcHcpIHsNCj4+ICsJ
CQljYXNlIDQ6IC8qIDggYnBwICovDQo+PiArCQkJCSpkc3QrKyA9IGNvbG9ydGFiWygqc3Jj
ID4+IDQpICYgYml0X21hc2tdOw0KPj4gKwkJCQkqZHN0KysgPSBjb2xvcnRhYlsoKnNyYyA+
PiAwKSAmIGJpdF9tYXNrXTsNCj4+ICsJCQkJYnJlYWs7DQo+PiArCQkJY2FzZSAyOiAvKiAx
NiBicHAgKi8NCj4+ICsJCQkJKmRzdCsrID0gY29sb3J0YWJbKCpzcmMgPj4gNikgJiBiaXRf
bWFza107DQo+PiArCQkJCSpkc3QrKyA9IGNvbG9ydGFiWygqc3JjID4+IDQpICYgYml0X21h
c2tdOw0KPj4gKwkJCQkqZHN0KysgPSBjb2xvcnRhYlsoKnNyYyA+PiAyKSAmIGJpdF9tYXNr
XTsNCj4+ICsJCQkJKmRzdCsrID0gY29sb3J0YWJbKCpzcmMgPj4gMCkgJiBiaXRfbWFza107
DQo+PiArCQkJCWJyZWFrOw0KPj4gKwkJCWNhc2UgMTogLyogMzIgYnBwICovDQo+PiArCQkJ
CSpkc3QrKyA9IGNvbG9ydGFiWygqc3JjID4+IDcpICYgYml0X21hc2tdOw0KPj4gKwkJCQkq
ZHN0KysgPSBjb2xvcnRhYlsoKnNyYyA+PiA2KSAmIGJpdF9tYXNrXTsNCj4+ICsJCQkJKmRz
dCsrID0gY29sb3J0YWJbKCpzcmMgPj4gNSkgJiBiaXRfbWFza107DQo+PiArCQkJCSpkc3Qr
KyA9IGNvbG9ydGFiWygqc3JjID4+IDQpICYgYml0X21hc2tdOw0KPj4gKwkJCQkqZHN0Kysg
PSBjb2xvcnRhYlsoKnNyYyA+PiAzKSAmIGJpdF9tYXNrXTsNCj4+ICsJCQkJKmRzdCsrID0g
Y29sb3J0YWJbKCpzcmMgPj4gMikgJiBiaXRfbWFza107DQo+PiArCQkJCSpkc3QrKyA9IGNv
bG9ydGFiWygqc3JjID4+IDEpICYgYml0X21hc2tdOw0KPj4gKwkJCQkqZHN0KysgPSBjb2xv
cnRhYlsoKnNyYyA+PiAwKSAmIGJpdF9tYXNrXTsNCj4+ICsJCQkJYnJlYWs7DQo+PiAgIAkJ
CX0NCj4gDQo+IEhvdyBhYm91dCBtb3ZpbmcgdGhlIHN3aXRjaCBvdXQgb2YgdGhlIGxvb3As
IGkuZS4NCj4gDQo+IHN3aXRjaCAocHB3KSB7DQo+IGNhc2UgNDoNCj4gICAgICBmb3IgKGog
PSAuLi4pIHsNCj4gICAgICAgICAgKmRzdCsrID0gY29sb3J0YWJbKCpzcmMgPj4gNCkgJiBi
aXRfbWFza107DQo+ICAgICAgICAgICpkc3QrKyA9IGNvbG9ydGFiWygqc3JjID4+IDApICYg
Yml0X21hc2tdOw0KPiAgICAgIH0NCj4gWyAuLi4gXQ0KPiB9DQo+IA0KPiA/DQoNCk5vIGRp
ZmZlcmVuY2UuIFZhbHVlcyBmb3IgdGhlIG1pY3JvYmVuY2htYXJrIChyZHRzYyBhcm91bmQg
DQpzeXNfaW1hZ2VibGl0KCkpIGFuZCB0aGUgZGlyZWN0b3J5IGxpc3Rpbmcgc3RhYmlsaXpl
IGF0IHRoZSBzYW1lIA0KbnVtYmVycy4gIEknbGwgc3RpbGwgZ28gd2l0aCB5b3Ugc3VnZ2Vz
dGlvbiwgYmVjYXVzZSB0aGUgY29kZSBpcyBtb3JlIA0KcmVhZGFibGUuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+IHRha2UgY2FyZSwNCj4gICAgR2VyZA0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------5zMtKdTFg0JVg1wdQx0qCdH2--

--------------20g4nOASpwIU8TVqZaBsCmnP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIOOtcFAwAAAAAACgkQlh/E3EQov+D0
KBAAzEtPpE6yJ968npwTp8/csWNKj0zbSDKicnQgoRx14tmwemJrFeCHrEktjB/NBTzdnjPDXccg
DeJuK8yTWFhCkjNVCtudJiZWI7U4wh+FALl/yKBtpUx3zOsB1hwiynYazewNzW8fRIXaG0x1Vibq
i1QolP8XPnQ6viAgkbEtV13GRqjjaLfLENBZ2zJmInW7R7X2OBcndwRchoEelwPAScygG/fGnI7x
IqOmQeaRGHLjVCPnn9AER48FtfrYnPQQuu3d72Xz2B9O2hu5H/QuyfxyfRPlxRF/yFIOEhOCT68H
Vn7TtVxq16oUzb1Zou+ksvmVHUuZcBlnppknN7NTgSzVrC3nbS9q3aEyCbZoBx/dOx4r3DZ8lma1
veneBie+wC7yYvx61zbi6dA3JsUydsO3cnepic6GyUc0Zf29Z5NideWZI3Q8XeuieDMdQbFd5PHx
H0CD3wdpA8I517WrIvOsKADi/PsSq0IlgzTMj1O2VASu5CAA56vCRVyjSpQQBx8m/3hhJtjrqCv6
vsXd3nQCC/Cfj2vQixc16cdodJmQCf+ydmnCY/x/CAKU6w+qlkQU3C6GDnzVSWaRyheNEYvJB6pc
lxmhjlXRXhyw+T5Rt3bUB6oEHa1zwVdk1rWvb/RcVDfFOtOMD3pAiYKeCWgD4gEUKRaeKZda0E7p
qWA=
=PuzU
-----END PGP SIGNATURE-----

--------------20g4nOASpwIU8TVqZaBsCmnP--

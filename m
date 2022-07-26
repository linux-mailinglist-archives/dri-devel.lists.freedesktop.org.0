Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D37580DA4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E46D14BD79;
	Tue, 26 Jul 2022 07:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096A314BD79
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 07:29:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B2A851FA1B;
 Tue, 26 Jul 2022 07:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658820590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Fq9ibFPNubBqRi0eiqVEnHBWn8e3UBGhlYeu9jWyfY=;
 b=taxfiTfSAx276FHR5qvWYtYHkL6sPZQ5RI09C/ux39a7wajaKtOuLenhcjfbiMyTjTAhoi
 Y0NH6cdtjGLIz1n7i3QsGzDD3JTJ//Rm0LsSuNqBE+ru6dSD0G47nhJeHYtFU120ScUN14
 5suCpZGpytNqJHCaot6rsTtS1yQ5CS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658820590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Fq9ibFPNubBqRi0eiqVEnHBWn8e3UBGhlYeu9jWyfY=;
 b=JtpXLLHPnVWtIN6jcq0E/5/xbAm955C1TNpNxoT2D/Tx8k3TtAZh6Y8GHIBAsdP5CeHzmQ
 wOLouH9JwQraIkDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E03613322;
 Tue, 26 Jul 2022 07:29:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oUGiJe6X32J/agAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Jul 2022 07:29:50 +0000
Message-ID: <01d9f4a3-0c92-f5e2-c8f2-e6dded0b6ae8@suse.de>
Date: Tue, 26 Jul 2022 09:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 31/32] drm/via: Add Makefile
Content-Language: en-US
To: Kevin Brace <kevinbrace@gmx.com>, dri-devel@lists.freedesktop.org
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-12-kevinbrace@gmx.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220725235359.20516-12-kevinbrace@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HfKc0w9n7VmDjtUGxJPCkL4W"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HfKc0w9n7VmDjtUGxJPCkL4W
Content-Type: multipart/mixed; boundary="------------devkOV1LOOdPByYoXuHcJA2y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Brace <kevinbrace@gmx.com>, dri-devel@lists.freedesktop.org
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Message-ID: <01d9f4a3-0c92-f5e2-c8f2-e6dded0b6ae8@suse.de>
Subject: Re: [PATCH v3 31/32] drm/via: Add Makefile
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-12-kevinbrace@gmx.com>
In-Reply-To: <20220725235359.20516-12-kevinbrace@gmx.com>

--------------devkOV1LOOdPByYoXuHcJA2y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMDE6NTMgc2NocmllYiBLZXZpbiBCcmFjZToNCj4gRnJv
bTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+DQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBCcmFjZSA8a2V2aW5icmFjZUBicmFjZWNvbXB1dGVy
bGFiLmNvbT4NCg0KSSBzdWdnZXN0IHRvIG1lcmdlIHBhdGNoZXMgMzAsIDMxIGFuZCAzMiBp
bnRvIG9uZSB0byBtYWtlIGl0IGVhc2llciB0byANCnJldmlldy4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlhL01ha2VmaWxlIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMjYg
aW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
dmlhL01ha2VmaWxlDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpYS9N
YWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS92aWEvTWFrZWZpbGUNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi43M2NjYWNiNGNkMTENCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL01ha2VmaWxlDQo+IEBAIC0w
LDAgKzEsMjYgQEANCj4gKyMNCj4gKyMgTWFrZWZpbGUgZm9yIHRoZSBkcm0gZGV2aWNlIGRy
aXZlci4gIFRoaXMgZHJpdmVyIHByb3ZpZGVzIHN1cHBvcnQgZm9yIHRoZQ0KPiArIyBEaXJl
Y3QgUmVuZGVyaW5nIEluZnJhc3RydWN0dXJlIChEUkkpIGluIFhGcmVlODYgNC4xLjAgYW5k
IGhpZ2hlci4NCj4gKw0KPiArY2NmbGFncy15IDo9IC1JaW5jbHVkZS9kcm0NCj4gK3ZpYS15
IDo9IHZpYV9jcnRjLm8gXA0KPiArCQl2aWFfY3J0Y19ody5vIFwNCj4gKwkJdmlhX2N1cnNv
ci5vIFwNCj4gKwkJdmlhX2RhYy5vIFwNCj4gKwkJdmlhX2Rpc3BsYXkubyBcDQo+ICsJCXZp
YV9kcnYubyBcDQo+ICsJCXZpYV9lbmNvZGVyLm8gXA0KPiArCQl2aWFfaGRtaS5vIFwNCj4g
KwkJdmlhX2kyYy5vIFwNCj4gKwkJdmlhX2luaXQubyBcDQo+ICsJCXZpYV9pb2N0bC5vIFwN
Cj4gKwkJdmlhX2x2ZHMubyBcDQo+ICsJCXZpYV9vYmplY3QubyBcDQo+ICsJCXZpYV9wbGwu
byBcDQo+ICsJCXZpYV9wbS5vIFwNCj4gKwkJdmlhX3NpaTE2NC5vIFwNCj4gKwkJdmlhX3Rt
ZHMubyBcDQo+ICsJCXZpYV90dG0ubyBcDQo+ICsJCXZpYV92dDE2MzIubw0KPiArDQo+ICtv
YmotJChDT05GSUdfRFJNX09QRU5DSFJPTUUpCSs9IHZpYS5vDQo+IC0tDQo+IDIuMzUuMQ0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------devkOV1LOOdPByYoXuHcJA2y--

--------------HfKc0w9n7VmDjtUGxJPCkL4W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLfl+4FAwAAAAAACgkQlh/E3EQov+A4
TA/+IvmYfUy3WdxhxqBtdm13i6wp/FxVIURw1wF1L+kN0a8UBxEyA+EvE8SOrUAKXrrS2/KYtKj3
d7pP5tjCubAD9jL0VFK+RBGnlns+sfyQTN+AbjXsIvIqWl/AtDyTLJIXTUW91QXUSveC/GQNEPc0
xbwNSlnSRUsQcZYHC97jn0YB0zSuFiszjD7Q3UZrsFay9SI7KxkO0GPPhWX13XSytH2OzIUORts0
s1PnMPxbgNHy+aO4vVMwk69qp4t0T6MVDOJCuqQAHFWW2xepka96H4j+e6u6ADNLKVuXvDvq0NkC
s2nl6h2dftcyNDFa8tpb9yfkdh0mBsNCYN3ESpeZIiA2Fn38aAS2M9RV0npIcG0ScE60xAQNG4JB
wGJm62eULXNV/KISLaK+HXxnVvy9tfxLhcvtcObL2KDI3aLCzd7IM6kJ1TAhqnLz0Pt0RI8TogMR
FDy9CkDLCr548rSisDM/DW55q3Z6M6kWOdByxo5kCBOI9J5HBNV0HufdQNOXQGbI+oJBbAJGWGKl
ooLjMhKWa5QIbKOgYTzkyCf+QQaBEVvn5DIc+J6F1i4k/9x8dxcdaDvxFXJQrsqcHT3MLqe48akT
3uMHVbuojDNA6bqY4x/XrwvxK7I2+4dGEBB1LamnyGMZtXbjPJ8M15ZzmudopvVNe1sLj+s+bV6J
diI=
=v3lH
-----END PGP SIGNATURE-----

--------------HfKc0w9n7VmDjtUGxJPCkL4W--

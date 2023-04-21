Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CC6EAA6E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 14:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E63010E0B0;
	Fri, 21 Apr 2023 12:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E18F10E0B0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 12:37:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 28CBB1FDDF;
 Fri, 21 Apr 2023 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682080642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EvoK1WWFPG2xWQZWGarP7RltMsW/Mnk7TCbhJIkBmME=;
 b=HiL3hQLbhf6lbkrFxxq7moWP8BupRXMLUP+4CjwWUAquwFILKxrg9DWkrJHK7gwgu0fQcI
 IQkdGv8NT1wgib8U6Ny5uKu5uTQ5U1/0zZs6yIRADh4nbzvMhI/h2hyIy6d5Ao0FLihG9S
 1PktsPuDo61oeoioEnkmcnHQfDjjm2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682080642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EvoK1WWFPG2xWQZWGarP7RltMsW/Mnk7TCbhJIkBmME=;
 b=vns+Gyh/CJ9jWO3QwOWVDg7blkrdbp193jMejPw7hJzMwNEJmRJsCfXLfmHwfycUV/Dkai
 1Z/UWM4aKPx2i/AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0039D1390E;
 Fri, 21 Apr 2023 12:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pR7wOYGDQmQ4PAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Apr 2023 12:37:21 +0000
Message-ID: <2f4370b6-8426-400a-8be1-36a48dadccad@suse.de>
Date: Fri, 21 Apr 2023 14:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] firmware/sysfb: Fix VESA format selection
Content-Language: en-US
To: Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
References: <20230420155705.21463-1-pa@panix.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230420155705.21463-1-pa@panix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XmeV6f1nal7YKKa0YL1hO1eL"
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
Cc: Ard Biesheuvel <ardb@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XmeV6f1nal7YKKa0YL1hO1eL
Content-Type: multipart/mixed; boundary="------------9wE9hytJvpmKl0IeMkzBdihm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <2f4370b6-8426-400a-8be1-36a48dadccad@suse.de>
Subject: Re: [PATCH v3] firmware/sysfb: Fix VESA format selection
References: <20230420155705.21463-1-pa@panix.com>
In-Reply-To: <20230420155705.21463-1-pa@panix.com>

--------------9wE9hytJvpmKl0IeMkzBdihm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjMgdW0gMTc6NTcgc2NocmllYiBQaWVycmUgQXNzZWxpbjoNCj4g
U29tZSBsZWdhY3kgQklPU2VzIHJlcG9ydCBubyByZXNlcnZlZCBiaXRzIGluIHRoZWlyIDMy
LWJpdCByZ2IgbW9kZSwNCj4gYnJlYWtpbmcgdGhlIGNhbGN1bGF0aW9uIG9mIGJpdHNfcGVy
X3BpeGVsIGluIGNvbW1pdCBmMzVjZDNmYTc3MjkNCj4gKCJmaXJtd2FyZS9zeXNmYjogRml4
IEVGSS9WRVNBIGZvcm1hdCBzZWxlY3Rpb24iKS4gIEhvd2V2ZXIgdGhleSByZXBvcnQNCj4g
bGZiX2RlcHRoIGNvcnJlY3RseSBmb3IgdGhvc2UgbW9kZXMuICBLZWVwIHRoZSBjb21wdXRh
dGlvbiBidXQNCj4gc2V0IGJpdHNfcGVyX3BpeGVsIHRvIGxmYl9kZXB0aCBpZiB0aGUgbGF0
dGVyIGlzIGxhcmdlci4NCj4gDQo+IHYyIGZpeGVzIHRoZSB3YXJuaW5ncyBmcm9tIGEgbWF4
MygpIG1hY3JvIHdpdGggYXJndW1lbnRzIG9mIGRpZmZlcmVudA0KPiB0eXBlczsgIHNwbGl0
IHRoZSBiaXRzX3Blcl9waXhlbCBhc3NpZ25tZW50IHRvIGF2b2lkIHVnbHlmaW5nIHRoZSBj
b2RlDQo+IHdpdGggdG9vIG1hbnkgY2FzdHMuDQo+IA0KPiB2MyBmaXhlcyBzcGFjZSBhbmQg
Zm9ybWF0dGluZyBibGlwcyBwb2ludGVkIG91dCBieSBKYXZpZXIsIGFuZCBjaGFuZ2UNCj4g
dGhlIGJpdF9wZXJfcGl4ZWwgYXNzaWdubWVudCBiYWNrIHRvIGEgc2luZ2xlIHN0YXRlbWVu
dCB1c2luZyB0d28gY2FzdHMuDQo+IA0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzRQc202QjZMcWt6MVFYTUBwYW5peDMucGFuaXguY29tDQo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyMzA0MTIxNTAyMjUuMzc1NzIyMy0xLWphdmllcm1AcmVk
aGF0LmNvbQ0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAy
MzA0MTgxODMzMjUuMjMyNy0xLXBhQHBhbml4LmNvbS9ULyN1DQo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIzMDQxOTA0NDgzNC4xMDgxNi0xLXBhQHBh
bml4LmNvbS9ULyN1DQo+IEZpeGVzOiBmMzVjZDNmYTc3MjkgKCJmaXJtd2FyZS9zeXNmYjog
Rml4IEVGSS9WRVNBIGZvcm1hdCBzZWxlY3Rpb24iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBQaWVy
cmUgQXNzZWxpbiA8cGFAcGFuaXguY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2Zpcm13YXJl
L3N5c2ZiX3NpbXBsZWZiLmMgfCAxMyArKysrKysrKy0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMgYi9kcml2ZXJzL2Zpcm13YXJl
L3N5c2ZiX3NpbXBsZWZiLmMNCj4gaW5kZXggODJjNjRjYjlmNTMxLi42ZjdjNWQwYzUwOTAg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYw0KPiAr
KysgYi9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMNCj4gQEAgLTUxLDE1ICs1
MSwxOCBAQCBfX2luaXQgYm9vbCBzeXNmYl9wYXJzZV9tb2RlKGNvbnN0IHN0cnVjdCBzY3Jl
ZW5faW5mbyAqc2ksDQo+ICAgCSAqDQo+ICAgCSAqIEl0J3Mgbm90IGVhc2lseSBwb3NzaWJs
ZSB0byBmaXggdGhpcyBpbiBzdHJ1Y3Qgc2NyZWVuX2luZm8sDQo+ICAgCSAqIGFzIHRoaXMg
Y291bGQgYnJlYWsgVUFQSS4gVGhlIGJlc3Qgc29sdXRpb24gaXMgdG8gY29tcHV0ZQ0KPiAt
CSAqIGJpdHNfcGVyX3BpeGVsIGhlcmUgYW5kIGlnbm9yZSBsZmJfZGVwdGguIEluIHRoZSBs
b29wIGJlbG93LA0KPiArCSAqIGJpdHNfcGVyX3BpeGVsIGZyb20gdGhlIGNvbG9yIGJpdHMs
IHJlc2VydmVkIGJpdHMgYW5kDQo+ICsJICogcmVwb3J0ZWQgbGZiX2RlcHRoLCB3aGljaGV2
ZXIgaXMgaGlnaGVzdC4gIEluIHRoZSBsb29wIGJlbG93LA0KPiAgIAkgKiBpZ25vcmUgc2lt
cGxlZmIgZm9ybWF0cyB3aXRoIGFscGhhIGJpdHMsIGFzIEVGSSBhbmQgVkVTQQ0KPiAgIAkg
KiBkb24ndCBzcGVjaWZ5IGFscGhhIGNoYW5uZWxzLg0KPiAgIAkgKi8NCj4gICAJaWYgKHNp
LT5sZmJfZGVwdGggPiA4KSB7DQo+IC0JCWJpdHNfcGVyX3BpeGVsID0gbWF4KG1heDMoc2kt
PnJlZF9zaXplICsgc2ktPnJlZF9wb3MsDQo+IC0JCQkJCSAgc2ktPmdyZWVuX3NpemUgKyBz
aS0+Z3JlZW5fcG9zLA0KPiAtCQkJCQkgIHNpLT5ibHVlX3NpemUgKyBzaS0+Ymx1ZV9wb3Mp
LA0KPiAtCQkJCSAgICAgc2ktPnJzdmRfc2l6ZSArIHNpLT5yc3ZkX3Bvcyk7DQo+ICsJCS8q
IG1heCgpIG1hY3JvcyBhcmdzIHNob3VsZCBiZSBvZiB0aGUgc2FtZSB0eXBlICovDQo+ICsJ
CWJpdHNfcGVyX3BpeGVsID0gbWF4MygodTE2KW1heDMoc2ktPnJlZF9zaXplICsgc2ktPnJl
ZF9wb3MsDQo+ICsJCQkJCXNpLT5ncmVlbl9zaXplICsgc2ktPmdyZWVuX3BvcywNCj4gKwkJ
CQkJc2ktPmJsdWVfc2l6ZSArIHNpLT5ibHVlX3BvcyksDQo+ICsJCQkJKHUxNikoc2ktPnJz
dmRfc2l6ZSArIHNpLT5yc3ZkX3BvcyksDQo+ICsJCQkJc2ktPmxmYl9kZXB0aCk7DQoNCkkg
Zm91bmQgdGhpcyBjYXN0aW5nIG1lc3MgZXZlbiBtb3JlIHVucmVhZGFibGUuIEkgd2VudCBi
YWNrIHRvIHYyLCBmaXhlZCANCnRoZSBzdHlsZSBpc3N1ZXMgYW5kIGNvbW1pdHRlZCB0aGUg
cGF0Y2ggYXMgdjQgKHN0aWxsIHVuZGVyIHlvdXIgbmFtZSkuDQoNCiANCmh0dHBzOi8vY2dp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvY29tbWl0Lz9pZD0xYjYxN2JjOTMxNzg5
MTJmYTM2Zjg3YTk1N2MxNWQxZjE3MDhjMjk5DQoNClRoYW5rcyBhIGxvdCBmb3IgdGhlIGJ1
Z2ZpeC4NCg0KQmVzdCByZWdhcmQNClRob21hcw0KDQo+ICAgCX0gZWxzZSB7DQo+ICAgCQli
aXRzX3Blcl9waXhlbCA9IHNpLT5sZmJfZGVwdGg7DQo+ICAgCX0NCj4gDQo+IGJhc2UtY29t
bWl0OiA2YThmNTdhZTJlYjA3YWIzOWE2ZjBjY2FkNjBjNzYwNzQzMDUxMDI2DQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------9wE9hytJvpmKl0IeMkzBdihm--

--------------XmeV6f1nal7YKKa0YL1hO1eL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRCg4EFAwAAAAAACgkQlh/E3EQov+CM
iw//STbJrpmNJBVRLkuKoNjkUuwQLZJ+/lt2SFTyAMeRde64udOgpRnlnhXurFowBwOSrqKyPKGb
quk/AY3F4YGt7ZU364woIjrmUGivJWLPwnWhH73fImTMFcwGR3un6K82igE/l232cugo5LOMv4b3
GaxsE1E6HnaA0+z+hirpMVUvEnE4OwM5MRdiy/X5N/WPTwCDjOvwZdDNsDSKmLJt1u2T4aOs7+vm
gsKd8ErEZR/+mp4qVQpy6rmQI10j7O2WrrQlw0eVg6NW7LIqhZwF6+EJXNrN+uuDeGRTxQXW+WUS
DOM32as11pVruNhOUaBKDWhDmvbglW0GjhauiUfCbICobMiWR9PNdRu7Eszs8Qtke2F6opq78UjM
WMWUwHFSfQDLJvZoSihWaaa0gUwNz/+fX7S0FrL2fPit5QsqH7MJ5Gmc86fLbOcIbMJI6kvIicrD
Z7zHzOkcGWyUt9WEFAEOuaO+HQpE0CxzE/804uosWJS4SbjXvwcIATri/Bj9QwYTCBhehkgYz9Vi
ks/sMnbvIO0Enksu7fVKYo2WzRdCnwM6nVjIyRU6pRnwgOEzG5SqTH99SlHAyRBQBtGJARhohLSz
4qD4+2qsb54vwlXPOqYmtJTmwPcWExZ+0ER+MzxxvvWyVxfRUJOUrd7tF/BT/s1lynqgdC9rZFec
86Q=
=Df9s
-----END PGP SIGNATURE-----

--------------XmeV6f1nal7YKKa0YL1hO1eL--

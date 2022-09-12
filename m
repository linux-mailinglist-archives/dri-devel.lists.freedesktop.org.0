Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D692E5B5503
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 09:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087F410E234;
	Mon, 12 Sep 2022 07:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B3E10E234
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 07:06:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DBE722780;
 Mon, 12 Sep 2022 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662966408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxgjXK5zr1ASV+usLHBgaOTW2nqjBh4xLZSbcxc/vsc=;
 b=EHFrmDpbihj70SHfUx9GdmNtdLH0Z4QMWpuzdOSVVv2JsrogagB+HF9MM/umma9WWM5UZP
 3kNGQrYpjxiob3xKZDvP9S+5qu6hNAo0Kc3AzL85nYrvFUTP08poQllsGQUaVCUzukwlYu
 UbxC/BjnTP7YxOTrTITJ1D9jKiCtGfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662966408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxgjXK5zr1ASV+usLHBgaOTW2nqjBh4xLZSbcxc/vsc=;
 b=L5uXJIUmA+0P0XSzlEnlhlDKpmImCD/bbaTeneEU0EwGt18KABXuU1+ebtYJotvYtHDfVf
 DgnUydRJEykNw6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E795E139C8;
 Mon, 12 Sep 2022 07:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aASjN4faHmOnBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Sep 2022 07:06:47 +0000
Message-ID: <5cd5b62f-a292-6e54-278d-b5cead65f49c@suse.de>
Date: Mon, 12 Sep 2022 09:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 00/12] drm/udl: More fixes
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220908095115.23396-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220908095115.23396-1-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EqXW0yCqWkDY0Pl661C3oMZx"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EqXW0yCqWkDY0Pl661C3oMZx
Content-Type: multipart/mixed; boundary="------------0e3P04GacN7TjmKiBOVVT9H6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <5cd5b62f-a292-6e54-278d-b5cead65f49c@suse.de>
Subject: Re: [PATCH v3 00/12] drm/udl: More fixes
References: <20220908095115.23396-1-tiwai@suse.de>
In-Reply-To: <20220908095115.23396-1-tiwai@suse.de>

--------------0e3P04GacN7TjmKiBOVVT9H6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkndmUgbWVhbndoaWxlIG1lcmdlZCB0aGUgcGF0Y2hzZXQsIGluY2x1ZGluZyB0
aGUgb25lIHVwZGF0ZWQgcGF0Y2ggYW5kIA0KdGhlIG1pc3Npbmcgci1iLg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQoNCkFtIDA4LjA5LjIyIHVtIDExOjUxIHNjaHJpZWIgVGFrYXNo
aSBJd2FpOg0KPiBIaSwNCj4gDQo+IHRoaXMgaXMgYW5vdGhlciByZXNwaW4gb2YgcGF0Y2gg
c2V0IGZvciBjbGVhbmluZyB1cCBhbmQgZml4ZXMgZm9yIFVETA0KPiBkcml2ZXIgWypdLiAg
SXQgY292ZXJzIHRoZSBQTSBwcm9ibGVtcywgcmVncmVzc2lvbnMgaW4gdGhlIHByZXZpb3Vz
DQo+IHBhdGNoIHNldCwgZml4ZXMgZm9yIHRoZSBzdGFsbHMgb24gc29tZSBzeXN0ZW1zLCBh
cyB3ZWxsIGFzIG1vcmUNCj4gaGFyZGVuaW5nLg0KPiANCj4gDQo+IHRoYW5rcywNCj4gDQo+
IFRha2FzaGkNCj4gDQo+IFsqXSB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIy
MDkwNjA3Mzk1MS4yMDg1LTEtdGl3YWlAc3VzZS5kZQ0KPiANCj4gPT09DQo+IA0KPiB2Mi0+
djM6DQo+IC0gTW9yZSBmaXggb24gUmVzdG9yZS1vbi1kaXNwbGF5LW1vZGUgcGF0Y2gsIHN1
Z2dlc3RlZCBieSBEYW5pZWwNCj4gLSBZZXQgbW9yZSBmaXggZm9yIHVicy5jb3VudCBjaGVj
ayBwYXRjaCwgc3VnZ2VzdGVkIGJ5IFRob21hcw0KPiAtIEFub3RoZXIgcGF0Y2ggZm9yIHBh
c3NpbmcgcmVjdGFuZ2xlIGRpcmVjdGx5LCBzdWdnZXN0ZWQgYnkgVGhvbWFzDQo+IC0gUHV0
IG1vcmUgQWNrcyBmcm9tIERhbmllbCBhbmQgVGhvbWFzDQo+IA0KPiB2MS0+djI6IGNsZWFu
dXBzIGFzIHN1Z2dlc3RlZCBieSBUaG9tYXMNCj4gLSBEcm9wIG51bXVyYnMgcGFyYW1ldGVy
IHBhdGNoDQo+IC0gQ2xlYW4gdXAgLyBzaW1wbGlmeSBjbGlwcGluZyBwYXRjaA0KPiAtIENv
ZGUgY2xlYW51cCBhbmQgY2hhbmdlcyBmb3IgdXJiIG1hbmFnZW1lbnQgcGF0Y2gNCj4gLSBQ
dXQgQWNrcyBvbiBzb21lIGdpdmVuIHBhdGNoZXMNCj4gDQo+ID09PQ0KPiANCj4gVGFrYXNo
aSBJd2FpICgxMCk6DQo+ICAgIGRybS91ZGw6IFJlc3RvcmUgZGlzcGxheSBtb2RlIG9uIHJl
c3VtZQ0KPiAgICBSZXZlcnQgImRybS91ZGw6IEtpbGwgcGVuZGluZyBVUkJzIGF0IHN1c3Bl
bmQgYW5kIGRpc2Nvbm5lY3QiDQo+ICAgIGRybS91ZGw6IFN1cHByZXNzIGVycm9yIHByaW50
IGZvciAtRVBST1RPIGF0IFVSQiBjb21wbGV0aW9uDQo+ICAgIGRybS91ZGw6IEluY3JlYXNl
IHRoZSBkZWZhdWx0IFVSQiBsaXN0IHNpemUgdG8gMjANCj4gICAgZHJtL3VkbDogRHJvcCB1
bm5lZWRlZCBhbGlnbm1lbnQNCj4gICAgZHJtL3VkbDogUGFzcyByZWN0YW5nbGUgZGlyZWN0
bHkgdG8gdWRsX2hhbmRsZV9kYW1hZ2UoKQ0KPiAgICBkcm0vdWRsOiBGaXggcG90ZW50aWFs
IFVSQiBsZWFrcw0KPiAgICBkcm0vdWRsOiBGaXggaW5jb25zaXN0ZW50IHVyYnMuY291bnQg
dmFsdWUgZHVyaW5nIHVkbF9mcmVlX3VyYl9saXN0KCkNCj4gICAgZHJtL3VkbDogRG9uJ3Qg
cmUtaW5pdGlhbGl6ZSBzdHVmZiBhdCByZXRyeWluZyB0aGUgVVJCIGxpc3QgYWxsb2NhdGlv
bg0KPiAgICBkcm0vdWRsOiBTeW5jIHBlbmRpbmcgVVJCcyBhdCB0aGUgZW5kIG9mIHN1c3Bl
bmQNCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICgyKToNCj4gICAgZHJtL3VkbDogQWRkIHJl
c2V0X3Jlc3VtZQ0KPiAgICBkcm0vdWRsOiBFbmFibGUgZGFtYWdlIGNsaXBwaW5nDQo+IA0K
PiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jICAgICAgfCAxOSArKysrKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAgICAgIHwgMTMgKy0tLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgICAgIHwgOTMgKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5j
ICB8IDU0ICsrKystLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
dHJhbnNmZXIuYyB8IDQ1ICsrLS0tLS0tLS0tLS0tLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwg
ODAgaW5zZXJ0aW9ucygrKSwgMTQ0IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------0e3P04GacN7TjmKiBOVVT9H6--

--------------EqXW0yCqWkDY0Pl661C3oMZx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMe2ocFAwAAAAAACgkQlh/E3EQov+Al
cA/+PVxI4UoBrztAwpXaTMdwOgHlr0+EZVHHHvCDtuR6egUdVbnB8PULUOtAq//nudMRZTPIyFv9
ZFaoyYcbVLBO8TzNFZkXzP7f4SKlWPI50z0PA7vlWaTGT7ciZhmhbqBTrpm4WRuPOCzLF4qFPWdY
lKv2WYI1NbwQVKsjwTPfiyxoE/FD9yfo5TPGa7QXLu0xBCL35kNo4mXJg1zu0vIaTeKVEuhJPNpu
uGP1jArGdlHwuF/QL1gkOmQqx15hGBoTdXVXy0/MAXxc/7Tyc0VFyUTQxwdxeKnPZuGRftXZtMjh
e5x+bg0nirfuOPRM2lJxAgvxEigsNGJ/yLRGvTPeQn2yDK/S8criKENWWpb7CmDj3j5mfxEGPXI4
W6E30RtypEEfDljuaHl5gwwtDBzyRovejljUjpsk+izBWkLOibV2b9ZQRjooWARfTSTqdKYGOO4w
6J0pvzNkfLAt1f/iukpnQnMO+BTGGgsle4ONxVIDQO0X5ucB/W0zcTm9jx6BvV18aOgEhNFstZRj
CylTeDRe7SE97eKAfsItyyLlqDNzK6Lkdv875P7yf+6J2a2Zf2+m9FiZnOD3Vofo7vBu/U7u4wix
tTaZSvopJw60Qf6Kac8qm/+ngy2SHofFrSNHzHpa//JMHswNTraWoajmX8Lft+KtybAuoQJqZTvQ
Vuo=
=xjls
-----END PGP SIGNATURE-----

--------------EqXW0yCqWkDY0Pl661C3oMZx--

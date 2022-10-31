Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE476132FD
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 10:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D616410E160;
	Mon, 31 Oct 2022 09:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3473310E160
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 09:47:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBF071F91D;
 Mon, 31 Oct 2022 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667209618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nkA3RyshyXYG11npyJNZIjbQZE0tQh7GWdyacBvP/xI=;
 b=GG9hHfPzWsYfao0gvNpOETSnvJhnf/DcFxKnrBELCcuVShmhmNWMiZpKdSWwbuEEnImjfd
 bxJDaIN9unpeKBqgiXtwWhgkMiQHTMs6CfnDmEUh6INxsS6l/UyDVzQy0MXT1JCsb6sYDY
 OUcjZzrh5SggXBg2YseiPqgJ8ot2Z5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667209618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nkA3RyshyXYG11npyJNZIjbQZE0tQh7GWdyacBvP/xI=;
 b=30WvH/17is0oDdHsP214T9DVlfYkFbG2O65ryMVJieLAhsL3E0mUffV9j7O7qCtVPxEMld
 64dF0AvmJS3DCVAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCFC513451;
 Mon, 31 Oct 2022 09:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MWPfLJKZX2NXZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Oct 2022 09:46:58 +0000
Message-ID: <4b6a171b-969c-3c44-adc3-50d84dfaf357@suse.de>
Date: Mon, 31 Oct 2022 10:46:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 0/2] drm: Add new plane helpers to begin/end FB access
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com
References: <20221025101737.8874-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221025101737.8874-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZQpll4LdUXex5mTFCecS0nfY"
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
--------------ZQpll4LdUXex5mTFCecS0nfY
Content-Type: multipart/mixed; boundary="------------KnpTS1knLxxKAc07taAJztd9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <4b6a171b-969c-3c44-adc3-50d84dfaf357@suse.de>
Subject: Re: [PATCH v2 0/2] drm: Add new plane helpers to begin/end FB access
References: <20221025101737.8874-1-tzimmermann@suse.de>
In-Reply-To: <20221025101737.8874-1-tzimmermann@suse.de>

--------------KnpTS1knLxxKAc07taAJztd9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

cGluZy4gQW55IGNvbW1lbnRzPw0KDQpBbSAyNS4xMC4yMiB1bSAxMjoxNyBzY2hyaWViIFRo
b21hcyBaaW1tZXJtYW5uOg0KPiBUaGlzIHBhdGNoc2V0IGFkZHMgdGhlIGNhbGxiYWNrcyBi
ZWdpbl9mYl9hY2Nlc3MgYW5kIGVuZF9mYl9hY2Nlc3MNCj4gdG8gc3RydWN0IGRybV9wbGFu
ZV9oZWxwZXJfZnVuY3MuIFRoZXkgcHJvdmlkZSBob29rcyB0byBhY3F1aXJlIGFuZA0KPiBy
ZWxlYXNlIHJlc291cmNlcyB0aGF0IGFyZSBvbmx5IGhlbGQgZHVyaW5nIHRoZSBjb21taXQu
IEl0IGFkZHMNCj4gcmVsYXRlZCBzaW1wbGUtS01TIGhlbHBlcnMgYW5kIGNvbnZlcnRzIHNo
YWRvdy1wbGFuZSBoZWxwZXJzLg0KPiANCj4gQXMgcmVzb3VyY2UgYWxsb2NhdGlvbiBvZnRl
biBjYW4gZmFpbCwgd2UgaGF2ZSB0byBkbyB0aGlzIGJlZm9yZSBhbg0KPiBhdG9taWMgY29t
bWl0IHN0YXJ0cyB0aGUgdXBkYXRlIGluIG9yZGVyIHRvIGhhbmRsZSB0aGUgZXJyb3IuIEJ1
dA0KPiBwcmVwYXJlX2ZiIGlzIG9ubHkgcmV2ZXJ0ZWQgYWZ0ZXIgdGhlIG5leHQgcGFnZWZs
aXAuIFdlIHdhbnQgdG8NCj4gcmVkdWNlIHRoZSB0aW1lIHJlc291cmNlcyBhcmUgaGVsZCBm
b3IgYSBjb21taXQsIHdoaWNoIHJlcXVpcmVzIHRoZQ0KPiBuZXcgaG9va3MuDQo+IA0KPiBX
aXRoIHRoaXMgaW4gcGxhY2UsIG1vdmUgc2hhZG93LXBsYW5lIGhlbHBlcnMnIGF1dG9tYXRp
YyB2bWFwL3Z1bm1hcA0KPiBiZWhpbmQgdGhlIG5ldyBjYWxsYmFja3MuIFRoZSBzaGFkb3ct
cGxhbmUgbWFwcGluZyBpcyBvbmx5IHJlcXVpcmVkDQo+IGR1cmluZyB0aGUgYXRvbWljIGNv
bW1pdC4NCj4gDQo+IFRlc3RlZCB3aXRoIGNvbWJpbmF0aW9ucyBvZiByYWRlb24sIHVkbCBh
bmQgc2ltcGxlZHJtIHVuZGVyIFgxMSwgV2VzdG9uDQo+IGFuZCBXYXlsYW5kLUdub21lLg0K
PiANCj4gVGhvbWFzIFppbW1lcm1hbm4gKDIpOg0KPiAgICBkcm0vYXRvbWljLWhlbHBlcjog
QWRkIHtiZWdpbixlbmR9X2ZiX2FjY2VzcyB0byBwbGFuZSBoZWxwZXJzDQo+ICAgIGRybS9n
ZW06IEltcGxlbWVudCBzaGFkb3ctcGxhbmUge2JlZ2luLGVuZH1fZmJfYWNjZXNzIHdpdGgg
dm1hcA0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyAgICAg
IHwgMzQgKysrKysrKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fYXRvbWlj
X2hlbHBlci5jICB8IDY2ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuYyAgfCAyNiArKysrKysrKysrDQo+ICAg
aW5jbHVkZS9kcm0vZHJtX2dlbV9hdG9taWNfaGVscGVyLmggICAgICB8IDIwICsrKy0tLS0N
Cj4gICBpbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oIHwgNDEgKysr
KysrKysrKysrKystDQo+ICAgaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmgg
ICAgICB8IDIwICsrKysrKysNCj4gICA2IGZpbGVzIGNoYW5nZWQsIDE1NyBpbnNlcnRpb25z
KCspLCA1MCBkZWxldGlvbnMoLSkNCj4gDQo+IA0KPiBiYXNlLWNvbW1pdDogNzQ2NTU5NzM4
ZjEzMzUyNDFlYTY4NjU2NmNiNjU0ODQ3YzIwZDdhNA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------KnpTS1knLxxKAc07taAJztd9--

--------------ZQpll4LdUXex5mTFCecS0nfY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNfmZEFAwAAAAAACgkQlh/E3EQov+BW
9w//RKSooL0n6hz4NqPtPj6ifqf74X8gcQjKE1lg937yQoLqYUjrO6AllAQ/RRdxUGrd9H85XDp5
VEwt1xdNX/MwzSMO4vcP8SOzUURSMS243SKJcSF9qzbu3e9X/mXXAKyW3tVrA8ci79CqQ3376ImD
sCIWUbe8gpc2zVx1KWTDipIWIRGQdCTd9bCAxzGWDmaqIAKoQV8yZ5tpzECzLO6O323pwFXma7K+
SXnXDQDMwasiRMzoKyVvPUBPtt4B6M4bUI7Jcskg1/3AgGJqeco7Md9ch5ujaLQlvpAZ36iK6F2n
QWs+jd3OkYU5UBUpZ0oPvSPZ2XjoSOdZhepazesk3W45QkFl/0OIq+b6RltJfcbpI3VwkSy6X5Js
Ws5RI5iP/K76CyNpc4IPb+X0q+C50VycV4/3Q/8pii5zFIqDzfJhorlcnt1ZyMx2Haz9VGKtHXeA
0GAQhR8aRs9TyhX+5Uk/D2wZGPrAgu+n6MtFBcBdjtQbK6Y/Ux3QmgGaFDGyaWPtXvcFVlt9VPFR
QP6XlAlKeiP1irGM3QnAMLNekvCADxKWdC1Mer/z5gcSmPLeBnbrLsMnr19WdjYYNEn8sZBzbjlp
EdNX6IDNh5fPVhN8+4MADC24At8/YKzIGvfmwJrcPIHcIzYw6VQRxJUNUned585Ov8u1+j0VTJsn
7js=
=Sh08
-----END PGP SIGNATURE-----

--------------ZQpll4LdUXex5mTFCecS0nfY--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3195F7468
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 08:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B776A10E110;
	Fri,  7 Oct 2022 06:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424E910E110
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 06:55:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAC9A1F88D;
 Fri,  7 Oct 2022 06:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665125723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+PbgSWSvuabOWac6/bFKZsx0FI5ldwVwm2rRzj1nuqU=;
 b=xIJ9bninSws8IwBzrKZVeviJn/oLvaA/wizjEzMW3xSDdToA4te7Wir3u3P9nYe1BMu1Mu
 e4AX3nXCqV2DOFR9dFSoR0/k0tM3nHK0NpndgikiKNmEZ6d/SYbAAnjaiySDz4ade2rb+E
 D5hdwh5Hj3Cacz2dKJMHpgGeEFcgSVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665125723;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+PbgSWSvuabOWac6/bFKZsx0FI5ldwVwm2rRzj1nuqU=;
 b=LJD9bKPIFcykQ9KJHELFDmJI9PbTvAWC3tW8hKId9IPeHTbBUr1a/6NIbzbij2DoZvZ+88
 SmOnUiKGElMoCKBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FE1813A3D;
 Fri,  7 Oct 2022 06:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CrMKGlvNP2NWTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Oct 2022 06:55:23 +0000
Message-ID: <91dea8a0-a49b-fdaa-0a26-61b09e0901a7@suse.de>
Date: Fri, 7 Oct 2022 08:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/2] drm/atomic-helper: Don't allocated plane state in
 CRTC check
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, ville.syrjala@linux.intel.com,
 daniel@fooishbar.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-2-tzimmermann@suse.de>
 <24dfef10-da19-1dc2-4dec-7d0231a920c2@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <24dfef10-da19-1dc2-4dec-7d0231a920c2@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MTDCppisgw3JCYNLM7lcP3Hi"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MTDCppisgw3JCYNLM7lcP3Hi
Content-Type: multipart/mixed; boundary="------------6Zi4Bqn5TCanguR4xSgCGyEV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, ville.syrjala@linux.intel.com,
 daniel@fooishbar.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <91dea8a0-a49b-fdaa-0a26-61b09e0901a7@suse.de>
Subject: Re: [PATCH v4 1/2] drm/atomic-helper: Don't allocated plane state in
 CRTC check
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-2-tzimmermann@suse.de>
 <24dfef10-da19-1dc2-4dec-7d0231a920c2@redhat.com>
In-Reply-To: <24dfef10-da19-1dc2-4dec-7d0231a920c2@redhat.com>

--------------6Zi4Bqn5TCanguR4xSgCGyEV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTAuMjIgdW0gMjI6MTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDEwLzUvMjIgMTM6NDAsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSW4gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfY3J0
Y19zdGF0ZSgpLCBkbyBub3QgYWRkIGEgbmV3IHBsYW5lIHN0YXRlDQo+PiB0byB0aGUgZ2xv
YmFsIHN0YXRlIGlmIGl0IGRvZXMgbm90IGV4aXN0IGFscmVhZHkuIEFkZGluZyBhIG5ldyBw
bGFuZQ0KPj4gc3RhdGUgd2lsbCByZXN1bHQgaW4gb3ZlcmhlYWQgZm9yIHRoZSBwbGFuZSBk
dXJpbmcgdGhlIGF0b21pYy1jb21taXQNCj4+IHN0ZXAuDQo+Pg0KPj4gRm9yIHRoZSB0ZXN0
IGluIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX2NydGNfc3RhdGUoKSB0byBzdWNjZWVkLCBp
dA0KPj4gaXMgaW1wb3J0YW50IHRoYXQgdGhlIENSVEMgaGFzIGFuIGVuYWJsZWQgcHJpbWFy
eSBwbGFuZSBhZnRlciB0aGUNCj4+IGNvbW1pdC4gU2ltcGx5IHRlc3RpbmcgdGhlIENSVEMg
c3RhdGUncyBwbGFuZV9tYXNrIGZvciBhIHByaW1hcnkgcGxhbmUNCj4+IGlzIHN1ZmZpY2ll
bnQuDQo+Pg0KPj4gTm90ZSB0aGF0IHRoZSBoZWxwZXIgc3RpbGwgb25seSB0ZXN0cyBmb3Ig
YW4gYXR0YWNoZWQgcHJpbWFyeSBwbGFuZS4NCj4+IERyaXZlcnMgaGF2ZSB0byBlbnN1cmUg
dGhhdCB0aGUgcGxhbmUgY29udGFpbnMgdmFsaWQgcGl4ZWwgaW5mb3JtYXRpb24uDQo+Pg0K
Pj4gdjM6DQo+PiAJKiB0ZXN0IGZvciBhIHByaW1hcnkgcGxhbmUgaW4gcGxhbmVfbWFzayAo
VmlsbGUpDQo+PiB2MjoNCj4+IAkqIHJlbW92ZSB1bm5lY2Vzc2FyeSB0ZXN0IGZvciBwbGFu
ZS0+Y3J0YyAoVmlsbGUpDQo+PiAJKiBpbmxpbmUgZHJtX2F0b21pY19nZXRfbmV4dF9wbGFu
ZV9zdGF0ZSgpIChWaWxsZSkNCj4+IAkqIGFjcXVpcmUgcGxhbmUgbG9jayBiZWZvcmUgYWNj
ZXNzaW5nIHBsYW5lLT5zdGF0ZSAoVmlsbGUpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBGaXhlczogZDZiOWFm
MTA5N2ZlICgiZHJtL2F0b21pYy1oZWxwZXI6IEFkZCBoZWxwZXIgZHJtX2F0b21pY19oZWxw
ZXJfY2hlY2tfY3J0Y19zdGF0ZSgpIikNCj4gDQo+IFRoaXMgcGF0Y2ggbWFrZXMgc2Vuc2Ug
dG8gbWUuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxq
YXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KPiBidXQgSSd2ZSBhIGhhcmQgdGltZSBwYXJzaW5n
IHRoZSBzdWJqZWN0IGxpbmUuIERpZCB5b3UgbWVhbiBpbnN0ZWFkOg0KPiANCj4gImRybS9h
dG9taWMtaGVscGVyOiBEb24ndCBhbGxvY2F0ZSBuZXcgcGxhbmUgc3RhdGUgaW4gQ1JUQyBj
aGVjayIgPw0KDQpPaywgSSdsbCBkbyB0aGF0Lg0KDQpCZXN0IHJlZ2FyZA0KVGhvbWFzDQoN
Cj4gDQo+IG9yICJkcm0vYXRvbWljLWhlbHBlcjogRG9uJ3QgYWRkIGEgbmV3IHBsYW5lIHN0
YXRlIGluIENSVEMgY2hlY2siID8NCj4gDQo+IEluIGFueSBjYXNlIHlvdSBjYW4gZml4IHRo
YXQgd2hpbGUgYXBwbHlpbmcgc28gbm8gbmVlZCB0byByZXNlbmQgSU1PLg0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------6Zi4Bqn5TCanguR4xSgCGyEV--

--------------MTDCppisgw3JCYNLM7lcP3Hi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM/zVoFAwAAAAAACgkQlh/E3EQov+Ac
gw//a+nRnEDyH5He5DG6kwOXwWoYyljP6VcHistSSmc0Hsv5HQTtjg1YJwZ/K8LeKTz7wy156q22
wSac+XGbD01FsSvvZjqa6q/aF42RRZRNIxUj7JHYCzhnIbBYc4G6tPT1q5V+Pv5C+DwZN3nhLieH
522quBuAQ9t0RahSEi7Z9xUyqkMuuWG07VPBMbvrHVhKeAQmTpxv94SdktCzB44pCtNM0uYZxj2Y
Tx7Q/DUdjZMsGxTiyxkB6EaHhl8jludYbSFd/AZ63Ykfnh9Am3ypQxXM8UN5gnVyHmiguF2aEB3s
oYdxmKNeDIDKzb/rXQS3ZoWs6mN9q0laAhCNo63nTxAG1nfBYkTu/38xoBKl9QQGzzD/WhJ7Qtmy
h0oJrE1uP1M6cJELa0nQDY8Jf/pFVxXjLaI7LbAoa+9TEiDZay5XqhzE1G2COiS/u4UVqEtQI+/K
SV+c6RUNSVSjbF6KSx5mf1xtaU+8Vu5HeMFOUF8QKgP46IgstljWgRyCJvHibshOzMXixoNLkkli
8COxDgHabRe8wIPe5zZg51oB4UyjN/pbR0s3n1NgyWAou8G+mXeao6MZCFjI2oBWWkRLpJobUUqT
thnY7wQZvxRkXCx7c+WH9J/VlV5Z+0qmkzPS5jGU8IyiRukF7nl/TuiOTJtXNmWpfPt+4f5ETTxV
Ha0=
=77ID
-----END PGP SIGNATURE-----

--------------MTDCppisgw3JCYNLM7lcP3Hi--

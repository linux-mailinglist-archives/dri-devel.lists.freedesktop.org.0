Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EC0736EE6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 16:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C1210E188;
	Tue, 20 Jun 2023 14:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77A910E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 14:40:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B1DCE218B5;
 Tue, 20 Jun 2023 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687272031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pwO5liwYTqMSyQXOoPthNHYqRO4IgUKYysAQxUSQScE=;
 b=1ZwNUJNAZ3jxwWIDCoG9LK3spHqsLG9MDlz0FBrSqXJS98zOzlqI7qTF7uj8NmXuhD1shQ
 T1VeMaRfpO29Y4B3u7rEcK0lGrreqU5jqmtZ0adFdAXwdHjYjJsk+dJ+uaG2tmBnaZq7Hb
 MF0Y4zOV73frs4iO/9CXIj46QI490yI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687272031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pwO5liwYTqMSyQXOoPthNHYqRO4IgUKYysAQxUSQScE=;
 b=PXgLLTi7HIUzyQBqwNMSFZYvl1hFMcr5FcsYFSLqlMup6hCYHZfU64YKvjRLpJ/N5dT/lw
 bpBSZ77aSxSJrsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69F21133A9;
 Tue, 20 Jun 2023 14:40:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6zfWGF+6kWT0WwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 14:40:31 +0000
Message-ID: <93b72df1-77c3-8d88-cfca-7b1acd6066e4@suse.de>
Date: Tue, 20 Jun 2023 16:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] drm/rockchip: Resolve dependency in GEM DMA helpers
Content-Language: en-US
To: Jonas Karlman <jonas@kwiboo.se>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 hjc@rock-chips.com, heiko@sntech.de
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-3-tzimmermann@suse.de>
 <34c08fc9-eb9b-376d-57fb-d47a68c2fc4d@kwiboo.se>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <34c08fc9-eb9b-376d-57fb-d47a68c2fc4d@kwiboo.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OfTinYNHZ5UuuwykzqfTdN6g"
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
Cc: linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OfTinYNHZ5UuuwykzqfTdN6g
Content-Type: multipart/mixed; boundary="------------VbfdzPY5HHfqMFG9evx6eP0f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jonas Karlman <jonas@kwiboo.se>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 hjc@rock-chips.com, heiko@sntech.de
Cc: linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Message-ID: <93b72df1-77c3-8d88-cfca-7b1acd6066e4@suse.de>
Subject: Re: [PATCH 2/3] drm/rockchip: Resolve dependency in GEM DMA helpers
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-3-tzimmermann@suse.de>
 <34c08fc9-eb9b-376d-57fb-d47a68c2fc4d@kwiboo.se>
In-Reply-To: <34c08fc9-eb9b-376d-57fb-d47a68c2fc4d@kwiboo.se>

--------------VbfdzPY5HHfqMFG9evx6eP0f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjMgdW0gMTU6NTYgc2NocmllYiBKb25hcyBLYXJsbWFuOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBPbiAyMDIzLTA2LTIwIDE0OjAzLCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToNCj4+IFJlbW92ZSB0aGUgZGVwZW5kZW5jeSBvbiB0aGUgR0VNIERNQSBoZWxw
ZXIgbGlicmFyeS4gUm9ja2NoaXAgY29tZXMNCj4+IHdpdGggaXRzIG93biBpbXBsZW1lbnRh
dGlvbiBvZiB0aGUgR0VNIGludGVyZmFjZS4gSXQgb25seSB1c2VzIHRoZSBWTQ0KPj4gY2Fs
bGJhY2tzIGluIGRybV9nZW1fZG1hX3ZtX29wcyBmcm9tIHRoZSBHRU0gRE1BIGhlbHBlcnMu
IFRoZXNlIGFyZQ0KPj4gbm90IERNQSBzcGVjaWZpYy4NCj4+DQo+PiBEdXBsaWNhdGUgZHJt
X2dlbV9kbWFfdm1fb3BzIGluIHJvY2tjaGlwIGFuZCByZW1vdmUgYWxsIGRlcGVuZGVuY2ll
cyBvbg0KPj4gdGhlIEdFTSBETUEgaGVscGVyIGxpYnJhcnkuDQo+IA0KPiBJIGhhdmUgaW50
ZW50aW9ucyB0byByZW1vdmUgdGhlIGVudGlyZSBjdXN0b20gaW1wbGVtZW50YXRpb24gb2Yg
dGhlIEdFTQ0KPiBpbnRlcmZhY2UgYW5kIHJlcGxhY2UgaXQgd2l0aCB1c2Ugb2YgR0VNIERN
QSBoZWxwZXJzIGluIGEgZnV0dXJlIHNlcmllcy4NCj4gDQo+IEN1cnJlbnQgY3VzdG9tIGlt
cGxlbWVudGF0aW9uIGJyZWFrIGltcG9ydCBvZiB2aWRlbyBmcmFtZWJ1ZmZlcnMgbG9jYXRl
ZA0KPiBpbiBtZW1vcnkgYmV5b25kIDRHQi4gU3dpdGNoaW5nIHRvIHVzZSBwdXJlIEdFTSBE
TUEgaGVscGVycyBzb2x2ZWQgdGhhdA0KPiBpc3N1ZSBidXQgcmVxdWlyZXMgcmV3b3JraW5n
IElPTU1VIGludGVncmF0aW9uIGZvciBmdWxsIHN1cHBvcnQgb2YNCj4gbXVsdGlwbGUgVk9Q
cyBvbiBlLmcuLCBSSzMyODggYW5kIFJLMzM5OS4NCj4gDQo+IEkgaGF2ZSBubyBFVEEgb24g
d2hlbiBzdWNoIHNlcmllcyBjYW4gYmUgcmVhZHkgc28gdGhpcyBpcyBtb3JlIG9mIGENCj4g
aGVhZHMgdXAgdGhhdCBJIHdpbGwgcmV2ZXJ0IHRoaXMgcmVtb3ZhbCBvZiBkZXBlbmRlbmN5
IG9uIEdFTSBETUEgaGVscGVyDQo+IGxpYnJhcnkgaW4gYSBmdXR1cmUgc2VyaWVzLg0KDQpO
byBwcm9ibGVtLiBJJ20gb25seSBpbnRlcmVzdGVkIGluIGNsZWFuaW5nIHVwIHRoZSBjdXJy
ZW50IGludGVyZmFjZXMuIA0KUm9ja2NoaXAgY2FuIGVhc2lseSBzd2l0Y2ggdG8gcmVhbCBH
RU0gRE1BIGNvZGUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFJlZ2FyZHMs
DQo+IEpvbmFzDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9LY29uZmlnICAgICAgICAgICAgfCAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYyB8IDIgKy0NCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyB8IDggKysrKysrLS0NCj4+ICAgMyBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPiBb
c25pcF0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------VbfdzPY5HHfqMFG9evx6eP0f--

--------------OfTinYNHZ5UuuwykzqfTdN6g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSRul4FAwAAAAAACgkQlh/E3EQov+Cw
WA/+OyPL01W5b95WE7W8w0mhA/+w7TDUeQ3jgf4xmI6vH5KL/xxxldRTaf6nqphy1nRAhgz/RZIk
ZBNOskQskRwI+Cc0wD1IUJ/pKcH6+HFiL17KC29z0dhzAGtWLGC2vdudtapZw8+lFQkJqByq7MZC
k5JJnJDIirnSX1Iw00m2UmH9/KoIXLZWOAUSqeRw6z7ccUZuxwPvNxpd5QnBNhlLKZfcE1pOi1jy
xEwzKsabsGLJRbt3/HFnlWvvhCnEaTWYqqkhcGWKTyVzrZv98IB6nD+Ze3wDC1CHm0am+w8DOatg
pH2w7eQXy6sKNP5XEuUiSxUNrZ4EMG4s+Ady+gfeszNRBtvCHBI08QkFrk940YzpqAZXehkhLvKm
TcAF1cY929Nq0IZZ8g2QGglGjWdHS16vP9u+f0SCM3M9sOgYTKkn5dAiuyagqKOBxgRbuCBFk6hH
nobwZEt6dxLZp9EAz1D1JP/urb7km6MEQP5ch0VEGFr7H4AxTzAKDPgXyNvYV2GvsSxYY2WawXuX
Ma+KlzQvZdhfyx2doyOLVX/6+Iu6jxT7g34517CcM4Vacwv8laMX7zub3Oa4T4vFuZevDfazXhen
5bw5cYsume6uUjiwSFw5LDoOnHsqPJqLuQspPm35T9NsfeLBqJj9FhM03NdbTJNkRgAtZAkxRlXA
wiE=
=IKbW
-----END PGP SIGNATURE-----

--------------OfTinYNHZ5UuuwykzqfTdN6g--

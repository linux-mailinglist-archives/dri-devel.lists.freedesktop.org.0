Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C0731BEA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8577010E190;
	Thu, 15 Jun 2023 14:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDDD10E190
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:56:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CC871FE35;
 Thu, 15 Jun 2023 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686841004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S/r9F0pVJ7WI3Eonl8IpuKk53HYXo/ZHSrzYItIdWKU=;
 b=n/h9EJH391teEdmHNTCiOOCFsp5EEv+IyTkIhJHrwc36KMwqDG3TsHCos0zAK7HdUgOtA7
 RgXbDvqJy3zgU7VkMPevshIEKBkDmUZAXBwWpXQcNj1Ybzu6fHajw4CrDWOooOvIqlFPEH
 EHyHOsj8nT008Fp1qE2zUw8ruZF+ql8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686841004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S/r9F0pVJ7WI3Eonl8IpuKk53HYXo/ZHSrzYItIdWKU=;
 b=TFoOY/G6RGdqpDJfQXC6nEa14Vv/CPG1PJtPv0gxmo8EZ0D6FaBLZ0grAocqRrPsXmaXhp
 NJMrxraNzTXWPYDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AEE913A32;
 Thu, 15 Jun 2023 14:56:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RdlRCawmi2Q6BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jun 2023 14:56:44 +0000
Message-ID: <eddaa39b-4688-4035-b8cc-4eb5ef59de46@suse.de>
Date: Thu, 15 Jun 2023 16:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230615094206.4424-1-tzimmermann@suse.de>
 <O78vhvv6qtN2Fjh9tljnBnBeNwr-eASqyXaUG3e8cWPZ2MqoOSWR_D8S_ce2gqSvbLkJwX72tmc6ReUry0OTqJQWwhDcyrZrQP4hgg7iH30=@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <O78vhvv6qtN2Fjh9tljnBnBeNwr-eASqyXaUG3e8cWPZ2MqoOSWR_D8S_ce2gqSvbLkJwX72tmc6ReUry0OTqJQWwhDcyrZrQP4hgg7iH30=@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VCk7rhYgQxQf2uLSml0v3BuM"
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
Cc: mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VCk7rhYgQxQf2uLSml0v3BuM
Content-Type: multipart/mixed; boundary="------------m0V2cr84y4wjviVc4lIZ5yUg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>
Cc: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Message-ID: <eddaa39b-4688-4035-b8cc-4eb5ef59de46@suse.de>
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
References: <20230615094206.4424-1-tzimmermann@suse.de>
 <O78vhvv6qtN2Fjh9tljnBnBeNwr-eASqyXaUG3e8cWPZ2MqoOSWR_D8S_ce2gqSvbLkJwX72tmc6ReUry0OTqJQWwhDcyrZrQP4hgg7iH30=@emersion.fr>
In-Reply-To: <O78vhvv6qtN2Fjh9tljnBnBeNwr-eASqyXaUG3e8cWPZ2MqoOSWR_D8S_ce2gqSvbLkJwX72tmc6ReUry0OTqJQWwhDcyrZrQP4hgg7iH30=@emersion.fr>

--------------m0V2cr84y4wjviVc4lIZ5yUg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDYuMjMgdW0gMTY6NTAgc2NocmllYiBTaW1vbiBTZXI6DQo+IE9uIFRo
dXJzZGF5LCBKdW5lIDE1dGgsIDIwMjMgYXQgMTE6MzEsIFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4gDQo+PiBTZXQgZHJtX2dlbV9wcmltZV9o
YW5kbGVfdG9fZmQoKSBhbmQgZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoKQ0KPj4gZm9y
IGFsbCBEUk0gZHJpdmVycy4gRXZlbiBkcml2ZXJzIHRoYXQgZG8gbm90IHN1cHBvcnQgUFJJ
TUUgaW1wb3J0DQo+PiBvciBleHBvcnQgb2YgZG1hLWJ1ZnMgY2FuIG5vdyBpbXBvcnQgdGhl
aXIgb3duIGJ1ZmZlciBvYmplY3RzLiBUaGlzDQo+PiBpcyByZXF1aXJlZCBieSBzb21lIHVz
ZXJzcGFjZSwgc3VjaCBhcyB3bHJvb3RzLWJhc2VkIGNvbXBvc2l0b3JzLCB0bw0KPj4gc2hh
cmUgYnVmZmVycyBhbW9uZyBwcm9jZXNzZXMuDQo+Pg0KPj4gVGhlIG9ubHkgZHJpdmVyIHRo
YXQgZG9lcyBub3QgdXNlIHRoZSBkcm1fZ2VtX3ByaW1lXyooKSBoZWxwZXJzIGlzDQo+PiB2
bXdnZnguIE9uY2UgaXQgaGFzIGJlZW4gY29udmVydGVkLCB0aGUgY2FsbGJhY2tzIGluIHN0
cnVjdCBkcm1fZHJpdmVyDQo+PiBjYW4gYmUgcmVtb3ZlZC4NCj4+DQo+PiBTaW1vbiBTZXIg
aW1wbGVtZW50ZWQgdGhlIGZlYXR1cmUgZm9yIGRyaXZlcnMgYmFzZWQgb24gR0VNIFZSQU0g
aGVscGVycw0KPj4gaW4gWzFdLiBUaGlzIHBhdGNoc2V0IGdlbmVyYWxpemVzIHRoZSBjb2Rl
IGZvciBhbGwgZHJpdmVycyB0aGF0IGRvIG5vdA0KPj4gb3RoZXJ3aXNlIHN1cHBvcnQgUFJJ
TUUuIFRlc3RlZCBieSBydW5uaW5nIHN3YXkgd2l0aCBnbWE1MDAgaGFyZHdhcmUuDQo+IA0K
PiBWZXJ5IG5pY2UhIFRoYW5rcyBhIGxvdCBmb3IgZG9pbmcgdGhpcyENCj4gDQo+IEp1c3Qg
b25lIG1pbm9yIGNvbW1lbnQgYWJvdXQgZG9jcy4gSSB0aGluayB0aGVyZSBhcmUgYWxzbyBz
b21lIHJlbWFpbmluZw0KPiByZWZlcmVuY2VzIHRvIGRybV9nZW1fcHJpbWVfaGFuZGxlX3Rv
X2ZkKCkgYW5kIGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlKCkNCj4gaW4gdGhlIGRybV9w
cmltZS5jIG92ZXJ2aWV3LiBUaGVzZSBiZWNvbWUgc3RhbGUgc2luY2UgdGhpcyBzZXJpZXMg
dW5leHBvcnRzDQo+IHRoZXNlIGZ1bmN0aW9ucy4NCg0KSSdsbCBhZGRyZXNzIHRoZSBkb2N1
bWVudGF0aW9uIGlzc3VlLg0KDQo+IA0KPiBXaXRoIHRoYXQgZml4ZWQ6DQo+IA0KPiBSZXZp
ZXdlZC1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPg0KDQpUaGFua3MgYSBs
b3QuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------m0V2cr84y4wjviVc4lIZ5yUg--

--------------VCk7rhYgQxQf2uLSml0v3BuM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSLJqsFAwAAAAAACgkQlh/E3EQov+C4
whAAxjoxvTHKDHXNoAYxMvobSzcMhCdmfI0XjJ9eUxrcZ48at3aRUi/Bx71oh6BGnYKspBBiu201
blfxpU+sI6Ds2yz9o+LfRX59u66dSFPYduztuFMpINW2WxrwPJ7ReC0LWLp0xs2lb7hSINAyvHzj
Qg6UnEUq2IX68xbuhs1XLPK+sMjmDp2Z9Q9vnZPYbxxHucjUMGtgPh7R6SLsxR489ldR7NkjoJz4
CNStvYQAnKx6fGYXMEHvaEWwc/pEH/L3hJ/tz2KjGdtMQK/irbCWUi8um2JhXglw1kCCpFEo0i3x
LgpTEZkJYflhGe0hU019IHh7bNeS8PVhtz8TODG4Kj9/xetE/RskRoXvRlOvdnH7gMovWxSgI26t
g9PQGxSGRReYkwvi7gfVP91XAzXVCBr9bqeK33geg5kx64B9fyh7SfH+jO30fCY83BP2/B7IG4yf
7uM+1FG5Ja1EaRdipZyf37vJW24aQUMgnzvMT8oPwVQsQah1K5jxxOiQEXM6xanxV70KqXoi1kny
33SQ0ARr/GxBbUGm0IBir++yavsmDp0POa+BlL8iS8TP6Sk2P5ZLGC5wYJc1l0gqyl2l+R5hVs8v
+5LfiWtbWkNYk5mDP5blsfkaPspvdUOztRUPxblkRtUD+WFYzDGYbaVKANhw2qZuF7PBtPGeLQDv
WVs=
=9/Uf
-----END PGP SIGNATURE-----

--------------VCk7rhYgQxQf2uLSml0v3BuM--

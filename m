Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F077F757
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C32410E023;
	Thu, 17 Aug 2023 13:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A2510E023
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 13:11:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 078F32186B;
 Thu, 17 Aug 2023 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692277871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gd8cWLdyx5VFHJUnkLhhuqLzODL61DNhTi7avg9x0ac=;
 b=aQXhIAXr9CzqTIlNDNn8iVwBPHlF6BULf86KKniaJta8HJCyY2Kf1n8MKrLQKbgRiPRrD2
 qHsKHh8mpPXW5T+HmMtcR4N4PnBzwGbuhfrMl1Q3qOlSVK/2e8Efjh00x7652716hS1J3m
 uHFBE/QEk0rC17k322CzIl7YzBsbxIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692277871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gd8cWLdyx5VFHJUnkLhhuqLzODL61DNhTi7avg9x0ac=;
 b=4GytIyS1eA2OnQey9glmZg5anWedL+UN8Y+/VZRU4IXdR+eZJ/dL8o3yF3CmC1eB+94gXI
 3M39xqqQBpdZx4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC0D01392B;
 Thu, 17 Aug 2023 13:11:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gFOXMG4c3mSDdgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Aug 2023 13:11:10 +0000
Message-ID: <c5506f08-f9a1-aa58-58b8-1c5969f85c2e@suse.de>
Date: Thu, 17 Aug 2023 15:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH drm-misc-next] drm/ttm/tests: Require MMU when testing
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230811113649.697886-1-karolina.stolarek@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230811113649.697886-1-karolina.stolarek@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sru0nvCG5GDPvDdRRdm9Lzg0"
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sru0nvCG5GDPvDdRRdm9Lzg0
Content-Type: multipart/mixed; boundary="------------2jBMrWnxCuGdwjQpgkn401Bt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 kernel test robot <lkp@intel.com>
Message-ID: <c5506f08-f9a1-aa58-58b8-1c5969f85c2e@suse.de>
Subject: Re: [PATCH drm-misc-next] drm/ttm/tests: Require MMU when testing
References: <20230811113649.697886-1-karolina.stolarek@intel.com>
In-Reply-To: <20230811113649.697886-1-karolina.stolarek@intel.com>

--------------2jBMrWnxCuGdwjQpgkn401Bt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KSSd2ZSBjaGVycnktcGlja2VkIHRoZSBwYXRjaCBpbnRvIGRybS1taXNjLW5leHQt
Zml4ZXMsIHNvIGl0IHdpbGwgc2hvdyANCnVwIGluIHVwc3RyZWFtIHNvb24uDQoNCkFtIDEx
LjA4LjIzIHVtIDEzOjM2IHNjaHJpZWIgS2Fyb2xpbmEgU3RvbGFyZWs6DQo+IFNhdGlzZnkg
TU1VIGRlcGVuZGVuY3kgd2hlbiB0ZXN0aW5nIFRUTSB3aXRoIEtVbml0LiBUaGlzIGZpeGVz
DQo+IGNvbXBpbGF0aW9uIGVycm9ycyBvbiBwbGF0Zm9ybXMgdGhhdCBkb24ndCBzZWxlY3Qg
dGhpcyBvcHRpb24NCj4gYnkgZGVmYXVsdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthcm9s
aW5hIFN0b2xhcmVrIDxrYXJvbGluYS5zdG9sYXJla0BpbnRlbC5jb20+DQo+IENjOiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gQ2xvc2VzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwODExMDEzMy5mMGxoRndNVi1s
a3BAaW50ZWwuY29tLw0KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWti
dWlsZC1hbGwvMjAyMzA4MTExMDMyLmVuVThJaXNSLWxrcEBpbnRlbC5jb20vDQoNClRoaXMg
c2hvdWxkIGhhdmUgYWxzbyBtZW50aW9uZWQNCg0KRml4ZXM6IGUzOTEyZDA5YmY4ZCAoImRy
bS90dG06IEludHJvZHVjZSBLVW5pdCB0ZXN0IikNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyB8IDIgKy0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29u
ZmlnDQo+IGluZGV4IDlkMWYwZTA0ZmQ1Ni4uYWI5ZWYxYzIwMzQ5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZw0KPiBAQCAtMTk4LDcgKzE5OCw3IEBAIGNvbmZpZyBEUk1fVFRNDQo+ICAgY29uZmln
IERSTV9UVE1fS1VOSVRfVEVTVA0KPiAgICAgICAgICAgdHJpc3RhdGUgIktVbml0IHRlc3Rz
IGZvciBUVE0iIGlmICFLVU5JVF9BTExfVEVTVFMNCj4gICAgICAgICAgIGRlZmF1bHQgbg0K
PiAtICAgICAgICBkZXBlbmRzIG9uIERSTSAmJiBLVU5JVA0KPiArICAgICAgICBkZXBlbmRz
IG9uIERSTSAmJiBLVU5JVCAmJiBNTVUNCj4gICAgICAgICAgIHNlbGVjdCBEUk1fVFRNDQo+
ICAgICAgICAgICBzZWxlY3QgRFJNX0VYUE9SVF9GT1JfVEVTVFMgaWYgbQ0KPiAgICAgICAg
ICAgc2VsZWN0IERSTV9LVU5JVF9URVNUX0hFTFBFUlMNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywg
R2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQs
IEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------2jBMrWnxCuGdwjQpgkn401Bt--

--------------sru0nvCG5GDPvDdRRdm9Lzg0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTeHG0FAwAAAAAACgkQlh/E3EQov+DO
KBAArVDOHywDGwac040n3rRTCwhog4dfl2FylEgJhxfy6O4IaxPaB6lxXMaPLyaaxOLXtDB+DzPH
B5fPY+AAftYsNU/NvJQimeJqLPLiACf3WHIbOihQGJfeve6pXMJRH6d/GBXcf5GR/geGr7dzbZoR
+tm+VCIbvH3Fv5S3B0UfMfUuQ9Ikag97L8CEcIHytkrTWbCFlK0D7qPOB7QLaGfzjnlkjznfZ0lI
lMUJYEmtd01w0DM1TBbyXaPym+u74FB5FiN+shFrQ9FtaeDjezQ5CDRJx/llsURF7sZnxu8RZ5sy
6BuiNK+pRnYEG1BQH+U/7/uIj4CiGAVvcZdVxZW8joW5hXnHv53qix5kYlk9pogO2P8XaVYl+pzt
s8hvZ1EUbnXhGnxvf1SV6oXXEFHhRQbB94lbmHINa4Clwb61Bg/duCdAu1jN2YWQ/ADnvKq/H7xt
9VEuAerIJtHO7T2RUgiBYj5w17bdhnwSPNxwrME+7enTkz7jD4Ez8E2cqX/bOu9O87qNxym0VXAU
h42dAsFw2VV14wFgnkEc9iZYQIiFZ3jMeBYq6dF3GLv5mfF+3jF8ROU0OFVio8/KkZbjZDjRNblv
0FTqwvzUpaxhNWc+2pnFj5E/EnF2hi4lHLOl8KDnih2270YhVK7Hz4FKjQ79nhzOOIjxH6pdmtnv
mrY=
=wXOb
-----END PGP SIGNATURE-----

--------------sru0nvCG5GDPvDdRRdm9Lzg0--

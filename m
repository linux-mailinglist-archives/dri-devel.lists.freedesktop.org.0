Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB370F585
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 13:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAC810E0AD;
	Wed, 24 May 2023 11:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98A010E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 11:42:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 887981FDD9;
 Wed, 24 May 2023 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684928552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZcG3/sY0hqspCvL/Ggpi0+yPeSrXMsCkKspAReyPqA=;
 b=iWdBHDy6pZ0JRRhxDAFTM5bmIBs0Ff7siXP9tZ0dS37NhE8/pN/4J4Ms+h2D+RJTpOg6o0
 efTBbuzBKBGVfhNWqbDay01hV2Cm805qJqaxmvG32VYC/gNsA42D0b/id/hjsH3PeQZsha
 oRQE+/u2dQ3BkE3E4Cay0Z2Xw8gpq5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684928552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZcG3/sY0hqspCvL/Ggpi0+yPeSrXMsCkKspAReyPqA=;
 b=LGAU2gQ14sgZ7AbokWVtFsP6ddIn7/qJRDGzF+uHmVPqXeSmrA3RO75UcvOW7n4+uKgVh9
 v9tnEPXN5+ojIRBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54EE813425;
 Wed, 24 May 2023 11:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KWDnEyj4bWQVTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 11:42:32 +0000
Message-ID: <d800a238-83e0-0ec2-cf3a-67d07d749b5b@suse.de>
Date: Wed, 24 May 2023 13:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/5] drm: shmobile: Fixes and enhancements
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1684854992.git.geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cover.1684854992.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fT0qsip7f03Hrjj1dWC9P2RD"
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fT0qsip7f03Hrjj1dWC9P2RD
Content-Type: multipart/mixed; boundary="------------4efzk58w7wZDCSWxVN45oyVH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <d800a238-83e0-0ec2-cf3a-67d07d749b5b@suse.de>
Subject: Re: [PATCH v3 0/5] drm: shmobile: Fixes and enhancements
References: <cover.1684854992.git.geert+renesas@glider.be>
In-Reply-To: <cover.1684854992.git.geert+renesas@glider.be>

--------------4efzk58w7wZDCSWxVN45oyVH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDUuMjMgdW0gMTc6MzEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IAlIaSBhbGwsDQo+IA0KPiBDdXJyZW50bHksIHRoZXJlIGFyZSB0d28gZHJpdmVycyBm
b3IgdGhlIExDRCBjb250cm9sbGVyIG9uIFJlbmVzYXMNCj4gU3VwZXJILWJhc2VkIGFuZCBB
Uk0tYmFzZWQgU0gtTW9iaWxlIGFuZCBSLU1vYmlsZSBTb0NzOg0KPiAgICAxLiBzaF9tb2Jp
bGVfbGNkY2ZiLCB1c2luZyB0aGUgZmJkZXYgZnJhbWV3b3JrLA0KPiAgICAyLiBzaG1vYl9k
cm0sIHVzaW5nIHRoZSBEUk0gZnJhbWV3b3JrLg0KPiBIb3dldmVyLCBvbmx5IHRoZSBmb3Jt
ZXIgZHJpdmVyIGNhbiBiZSB1c2VkLCBhcyBhbGwgcGxhdGZvcm0gc3VwcG9ydA0KPiBpbnRl
Z3JhdGVzIHRoZSBmb3JtZXIuICBOb25lIG9mIHRoZXNlIGRyaXZlcnMgc3VwcG9ydCBEVC1i
YXNlZCBzeXN0ZW1zLg0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYSBmaXJzdCBzdGVw
IHRvIGVuYWJsZSB0aGUgU0gtTW9iaWxlIERSTSBkcml2ZXIgZm9yDQo+IFJlbmVzYXMgQVJN
LWJhc2VkIFNILU1vYmlsZSBhbmQgUi1Nb2JpbGUgU29Dcy4gIFRoZSBuZXh0IHN0ZXBzIHBs
YW5uZWQgYXJlDQo+IHRvICgxKSBhZGQgRFQgc3VwcG9ydCAod29ya3MsIGJ1dCBuZWVkcyBh
IGhhY2sgZHVlIHRvIGxhY2sgb2YgKDIpKSwgYW5kICgyKQ0KPiBjb252ZXJ0IHRoZSBkcml2
ZXIgdG8gYXRvbWljIG1vZGVzZXR0aW5nLg0KPiANCj4gQ2hhbmdlcyBjb21wYXJlZCB0byB2
MlsxXToNCj4gICAgLSBBZGQgUmV2aWV3ZWQtYnkuDQo+IA0KPiBDaGFuZ2VzIGNvbXBhcmVk
IHRvIHYxWzJdOg0KPiAgICAtIEFkZCBSZXZpZXdlZC1ieSwNCj4gICAgLSBEcm9wIGRlcGVu
ZGVuY3kgb24gQVJNLg0KPiANCj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24gdGhlIFItTW9i
aWxlIEExLWJhc2VkIEF0bWFyayBUZWNobm8NCj4gQXJtYWRpbGxvLTgwMC1FVkEgZGV2ZWxv
cG1lbnQgYm9hcmQsIHVzaW5nIGEgdGVtcG9yYXJ5DQo+IHBsYXRmb3JtLWVuYWJsZW1lbnQg
cGF0Y2hbM10uDQo+IA0KPiBUaGFua3MgZm9yIGFwcGx5aW5nIHRvIGRybS1taXNjIQ0KDQpJ
dCdzIGFsbCBiZWVuIHJldmlld2VkLiBEbyB5b3Ugd2FudCBtZSB0byBtZXJnZSB0aGUgcGF0
Y2hzZXQ/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yL2NvdmVyLjE2ODAyNzMwMzkuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlLw0KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9jb3Zlci4xNjgxNzM0
ODIxLmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZS8NCj4gWzNdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvYzAzZDRlZGJkNjUwODM2YmY2YTk2NTA0ZGY4MjMzOGVjNmQ4MDBmZi4x
NjgwMjcyOTgwLmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZQ0KPiANCj4gR2VlcnQgVXl0
dGVyaG9ldmVuICg1KToNCj4gICAgZHJtOiBzaG1vYmlsZTogVXNlICVwNGNjIHRvIHByaW50
IGZvdXJjYyBjb2Rlcw0KPiAgICBkcm06IHNobW9iaWxlOiBBZGQgc3VwcG9ydCBmb3IgRFJN
X0ZPUk1BVF9YUkdCODg4OA0KPiAgICBkcm06IHNobW9iaWxlOiBTd2l0Y2ggdG8gZHJtX2Ny
dGNfaW5pdF93aXRoX3BsYW5lcygpDQo+ICAgIGRybTogc2htb2JpbGU6IEFkZCBtaXNzaW5n
IGNhbGwgdG8gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKQ0KPiAgICBkcm06IHNobW9iaWxl
OiBNYWtlIERSTV9TSE1PQklMRSB2aXNpYmxlIG9uIFJlbmVzYXMgU29DIHBsYXRmb3Jtcw0K
PiANCj4gICBkcml2ZXJzL2dwdS9kcm0vc2htb2JpbGUvS2NvbmZpZyAgICAgICAgICAgfCAg
NCArLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc2htb2JpbGUvc2htb2JfZHJtX2NydGMuYyAg
fCAzNSArKysrKysrKysrKysrKysrKysrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NobW9i
aWxlL3NobW9iX2RybV9kcnYuYyAgIHwgIDMgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vc2ht
b2JpbGUvc2htb2JfZHJtX2ttcy5jICAgfCAgOSArKysrLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vc2htb2JpbGUvc2htb2JfZHJtX3BsYW5lLmMgfCAgNSArKysrDQo+ICAgNSBmaWxlcyBj
aGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------4efzk58w7wZDCSWxVN45oyVH--

--------------fT0qsip7f03Hrjj1dWC9P2RD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRt+CcFAwAAAAAACgkQlh/E3EQov+Cv
jw/+OrIl2bgj+gZHbcMAx6aPAQLd6y2A0AN6XoVXl13zRjEczDQFt8Jpg7a1ZDg9LBwsauJl+PCd
KP/WcKNT68/oEeE8rGK4aGFBMwgLcwL/1vgg3aXzoYRlhhpmD0zQyTCz9nJl4aLE/0E+NAA8gQ75
WF/9fihS4oyJQ5dF2j9KPum44+Qojl51lrHh/xcV3fAusVRxSedey3DmY8AZ7DGTpSHNpz0yI6S6
7kbKQpfls9s0jUDWb+Tz1FcT7auVacJ9Ppof1jvmZuv6fJtvMWplvVKoQeaOSCgHY30zwdRePILW
PH7sRbnUZs0QxlvPivuOSi2+dvN4SqPN7yaSCpws5E/ebrsnIzDn1yHSwU8087xgmHKU8csf6bqp
OjGtYgVdf2UuG2xHrQAva20vT44C+LjLA0jJPbBgSIgtoT1dYVCeldQa0CU8NtiXZD5Wh7XZZWfH
xJb54EJmlmiBgNLw0FyH2BL6KxzUkEUQ6Z2QbTWtuwCmKwM29XhXS67Tr7O7Z81f42rudPhj0Quo
ir8KJcy/lFKmpgat3FkPSI/iRqy3HqPSaCMRBt52btBLnwjx/SzrO1TiekjEXeFC66xo90LYZGeX
S+2hkhxrn4Djy1o7+gjT+/FH/uj/k9jqcQCN9Ovs25WKtB0r/IiDxPzm/etFiylYs9bQd41kFhWG
J+k=
=9um9
-----END PGP SIGNATURE-----

--------------fT0qsip7f03Hrjj1dWC9P2RD--

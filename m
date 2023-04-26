Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BB6EF77A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD24210E9FF;
	Wed, 26 Apr 2023 15:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEF210E9ED
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 15:07:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4752E1FDD2;
 Wed, 26 Apr 2023 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682521662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RskZR27fL7g2deBySUKolJ+2Wqe9anTQ6F5iNQ+NK3I=;
 b=FBaYb/JVUCDCPh0OC6vjbBr/1huMkLLEsjDHeMqbLtE5BcIrgxtT0xRF0fNZNVKwp6Ttbw
 b7QkUE/HK1Aan7XUTBrf8NWzU5aOjUVwlla1WqfiDQ4K3SAnN8LWzYvZhnHAYMn+yKzznL
 ghxXvGiQbX1BXYA/nnbxQp7al/bCRqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682521662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RskZR27fL7g2deBySUKolJ+2Wqe9anTQ6F5iNQ+NK3I=;
 b=8h838OfLN1ctS7SAWc5uq1NurozNyI80UmONycrHVZLnEC1tLAVwtf4x3jTHe2LI47hIt0
 O9/GmO5JYt5qe8Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BD6F13421;
 Wed, 26 Apr 2023 15:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fGTmAT4+SWTQdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 15:07:42 +0000
Message-ID: <650efbed-fcc6-5e52-1133-bfbb3143d8cb@suse.de>
Date: Wed, 26 Apr 2023 17:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] fbdev: Don't re-validate info->state in fb_ops
 implementations
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-4-tzimmermann@suse.de>
 <CAMuHMdWmPHge3jXxx4_OMAjfvnk70C=TZzxOUGceFOimj7fG=A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWmPHge3jXxx4_OMAjfvnk70C=TZzxOUGceFOimj7fG=A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XAno0LarHjx3wN4muoCWH0a0"
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XAno0LarHjx3wN4muoCWH0a0
Content-Type: multipart/mixed; boundary="------------LAg1WAn94O6CxSBVC60EoUxz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <650efbed-fcc6-5e52-1133-bfbb3143d8cb@suse.de>
Subject: Re: [PATCH 3/6] fbdev: Don't re-validate info->state in fb_ops
 implementations
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-4-tzimmermann@suse.de>
 <CAMuHMdWmPHge3jXxx4_OMAjfvnk70C=TZzxOUGceFOimj7fG=A@mail.gmail.com>
In-Reply-To: <CAMuHMdWmPHge3jXxx4_OMAjfvnk70C=TZzxOUGceFOimj7fG=A@mail.gmail.com>

--------------LAg1WAn94O6CxSBVC60EoUxz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMTY6NDkgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDQ6MjjigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBU
aGUgZmlsZS1vcCBlbnRyeSBwb2ludHMgZmJfcmVhZCgpIGFuZCBmYl93cml0ZSgpIHZlcmlm
eSB0aGF0DQo+PiBpbmZvLT5zdGF0ZSBoYXMgYmVlbiBzZXQgdG8gRkJJTkZPX1NUQVRFX1JV
Tk5JTkcuIFJlbW92ZSB0aGUgc2FtZQ0KPj4gdGVzdCBmcm9tIHRoZSBpbXBsZW1lbnRhdGlv
bnMgb2Ygc3RydWN0IGZiX29wcy57ZmJfcmVhZCxmYl93cml0ZX0uDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJfc3lzX2ZvcHMuYyB8IDYgLS0tLS0tDQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvc203MTJmYi5jICAgICAgICAgIHwgNiAtLS0tLS0NCj4gDQo+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gQnV0
IHRoZXJlIGFyZSBzZXZlcmFsIG90aGVyIGZiZGV2IGRyaXZlcnMgdG8gZml4Og0KPiBkcml2
ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jDQo+IGRyaXZlcnMvdmlkZW8vZmJkZXYvYnJv
YWRzaGVldGZiLmMNCj4gZHJpdmVycy92aWRlby9mYmRldi9oZWN1YmFmYi5jDQo+IGRyaXZl
cnMvdmlkZW8vZmJkZXYvbWV0cm9ub21lZmIuYw0KDQpPaywgSSdsbCBnbyB0aHJvdWdoIHRo
ZSB2YXJpb3VzIHBhdGNoZXMgaW4gdGhpcyBwYXRjaHNldCBhbmQgY2hlY2sgaWYgDQp0aGV5
IG5lZWQgdG8gYmUgZG9uZSBlbHNld2hlcmUgYXMgd2VsbC4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------LAg1WAn94O6CxSBVC60EoUxz--

--------------XAno0LarHjx3wN4muoCWH0a0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRJPj0FAwAAAAAACgkQlh/E3EQov+AX
iRAAqFhHOxIUaa80pfdoraeANmmCddzdkJ71Vqgu9Maz32gMFn0h+FWYggF6hildedCydnGohR9U
WGgoiiEC6QFJgJXncyoEWOIhGUDLe3J/7ioxlSgrD7W6sO76imowJZvRBBQR1qWKI/PnQrRVIw/p
JiC6Fc3sHlzDiDmqNcnXYOKtlYXXHUB8K47KnQUz40+C1jGfWGzz3DmTeS6yz+KTiwbqiOsTccAp
XlO7uivwuUlFp3qoyUrYA2U4xX/lQP6/O/GFiyl5Tm3NmQAoGOUA7Jp8Ll/TaFSlQZh8PPVYHAof
gindDmZSnlaUs/bVtV+eDFYnOuL72T4zzuoVQM7zYzapeWlpDSCnIil3b8+DaidiaE9VJFavlINp
fd/CE6wHDTiczGbHxPij0XxaW498Sepnh1ChsCsRB7T8p83xfzwuq/zvrWuU5VS/T0UPsGCXc+tx
BUEuFCCJ/Rsfn0vmHUn3h05948wAdn2aP0pLmA3Ppkke4mhpMXGCSPk4FgglF3dwkk3GXoiV5lMQ
SrZTrp+eMB1oFbtqATx+/SRSxrOxD93RFOtSzrSX6LhjpDHVKfUG/SpWwCWS3Cn9WMipOsWsmVNm
+BYnqWevwn2UADCKhkkCQFVm3s3JmRN03q/840VU3FAhDPu1xL9y56h8xxEYWiw5lECX/kEVUKqN
i3I=
=yrW8
-----END PGP SIGNATURE-----

--------------XAno0LarHjx3wN4muoCWH0a0--

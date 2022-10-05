Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4625F56D8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 16:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325FF10E68F;
	Wed,  5 Oct 2022 14:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AC610E6AB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 14:56:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3DC61F38D;
 Wed,  5 Oct 2022 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664981802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hUAUaXt9Z+HEX/qk3xBlxDgXYCQzHplsBR6fjBIh9CY=;
 b=E3wFhRjuE5HiAruI/jvVDJNCqxBnFY7aCrMnK7L3HvLTd87JCUbKUFYBFBMLoy6fqd3AN0
 Lg4r1a5Sazrv9WsZXixpA9G6T3o2SlavfwHwHRoKRtU2Ml3AWCdsSvSXrZ4B+g4/yg3DZz
 KDsdtX6yhuwllGliKqX9bWCxWL9HFws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664981802;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hUAUaXt9Z+HEX/qk3xBlxDgXYCQzHplsBR6fjBIh9CY=;
 b=VcnY9VTly4E79o8ctbVTBdinfqBahp6H96cO2M0P14S0cgNXkSGGy1HsdvrK8fvGvH1RL7
 WI5vODAUgU61wwBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 872D413ABD;
 Wed,  5 Oct 2022 14:56:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sN00ICqbPWMJMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Oct 2022 14:56:42 +0000
Message-ID: <50a78327-31a6-f7c9-9ba6-6e1e31cf001f@suse.de>
Date: Wed, 5 Oct 2022 16:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 15/16] drm/udl: Add register constants for framebuffer
 scanout addresses
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-16-tzimmermann@suse.de>
 <994ea685-be4f-ae0a-a8c6-3c664d9eff54@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <994ea685-be4f-ae0a-a8c6-3c664d9eff54@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JQVtf6LOZoZQwqUnDIV5sb69"
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
--------------JQVtf6LOZoZQwqUnDIV5sb69
Content-Type: multipart/mixed; boundary="------------TFYQTY0LTAuh1POs306z0Yvl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <50a78327-31a6-f7c9-9ba6-6e1e31cf001f@suse.de>
Subject: Re: [PATCH 15/16] drm/udl: Add register constants for framebuffer
 scanout addresses
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-16-tzimmermann@suse.de>
 <994ea685-be4f-ae0a-a8c6-3c664d9eff54@redhat.com>
In-Reply-To: <994ea685-be4f-ae0a-a8c6-3c664d9eff54@redhat.com>

--------------TFYQTY0LTAuh1POs306z0Yvl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjIgdW0gMDA6NTkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvMTkvMjIgMTU6MDQsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gQWRkIHJlZ2lzdGVyIGNvbnN0YW50cyBmb3IgdGhlIGZyYW1lYnVmZmVyIHNjYW5vdXQg
YWRkcmVzc2VzIGFuZA0KPj4gdXBkYXRlIHRoZSByZWxhdGVkIGhlbHBlciBmdW5jdGlvbnMu
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPiANCj4gUmV2aWV3
ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0K
PiANCj4gWy4uLl0NCj4gDQo+PiArCXU4IHJlZzIwID0gKGJhc2UgJiAweGZmMDAwMCkgPj4g
MTY7DQo+PiArCXU4IHJlZzIxID0gKGJhc2UgJiAweDAwZmYwMCkgPj4gODsNCj4+ICsJdTgg
cmVnMjIgPSAoYmFzZSAmIDB4MDAwMGZmKTsNCj4+ICsNCj4gDQo+IE1heWJlIHdvdWxkIGJl
IGNsZWFuZXIgdG8gdXNlIHRoZSBGSUVMRF9QUkVQKCkgYW5kIEdFTk1BU0soKSBtYWNyb3Mg
aW5zdGVhZCA/DQo+IA0KDQpUaGFuayB5b3UgZm9yIHJldmlld2luZyBteSBwYXRjaHNldC4g
SSdsbCB1cGRhdGUgdGhlIHBhdGNoIHdpdGggdGhlc2UgDQptYWNyb3MuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------TFYQTY0LTAuh1POs306z0Yvl--

--------------JQVtf6LOZoZQwqUnDIV5sb69
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM9myoFAwAAAAAACgkQlh/E3EQov+AA
ShAAs6VZNH03Ps7whGsIY0QFEFY16McxDQ9jxwY/z72lvHfw7bL2fHCB+eyFrtY3okOA6yY0mBwY
2TieVQrCUwJjU18GAolGRRveSYwsS9qQvBxUthGegPzCXrCv3udNWBhuSKKbXQHZowB7md2CyMq4
ilWROv5OGiso1Ba/93BR10DrlU/CQFu6bPBuBBauPdFsj5XO1v27jFtgiY2GuI/mwiDbLF/3pL6E
RXvgouXfBrKvq2hs13QA3qKiz5WkJIBz3vm8uVn9Xg/3XbmTLBifd0lguyf3K2Os5SWdkPsCjPl/
Q5R+A9iXDKZ4a/fBSi9DODPdwmRjh6xwefUQXVUvE/DsnpsQLDguWaoLnKOcUu/MVKuYK3LKFaql
NT3SmJZ8wcWpGRc0ngZt0oiA3fdz6NgLUbtxBDGG8neOJG25XFsHX7o7QHtptZT2QeSDsWbz7XRi
wnZEesqmOYh64GQ3EQde2LEdd0pJlV9kim0+fW6qI/2Oj2boybcTeje3BgAlYGjf+tZuQItCskNW
dVBxjdcmZzXIl+rU1yxjaOh0dY4rdpokxjZyOq9euqOT0dzv1+SRjPFhVuP6dQSi7x5rbC4evsaO
OJBOAVWXr72wLBAmDHlYRcQ++X9f5nEue1zV9DAhr3PB+c3lOHK1cxH/EbtCinlmpmanaV1y6gaE
8E0=
=XIP6
-----END PGP SIGNATURE-----

--------------JQVtf6LOZoZQwqUnDIV5sb69--

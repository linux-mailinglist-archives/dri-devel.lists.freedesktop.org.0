Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CC66D9209
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1993810EB39;
	Thu,  6 Apr 2023 08:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C2810EB39
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:53:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9078B1FDF6;
 Thu,  6 Apr 2023 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680771235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ampb5Xl8onPbiWf60Y+tVs0ZXEnbJv32G3DqAV3PP98=;
 b=qDNmivekbNFDzY2olQ9HO+h/ifXpD7PAVFu+uyy35THCmlQPL1rvoJpZyLmktWcqiN0eQv
 qxFotMtrMmQtVWFSBkIwrcBGo91OA5sGzHmqTtmL9rMlP6yUmd7GZ4ERLtVzO4s18gBbix
 3FMg347PFcduzcYq754h9cWnmRUMVUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680771235;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ampb5Xl8onPbiWf60Y+tVs0ZXEnbJv32G3DqAV3PP98=;
 b=QoIf+ejqMWhvd2K4m35X1RKSxdnGeB6+xcZlzvRzKD8oCJzCJgE3pMzOZCKf0usI8Ze9F6
 +BcR/TvcZc2sVYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7344A133E5;
 Thu,  6 Apr 2023 08:53:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SLBYG6OILmRVcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 08:53:55 +0000
Message-ID: <520414ed-46b7-ae0d-a567-bc2a7c898487@suse.de>
Date: Thu, 6 Apr 2023 10:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/9] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel.vetter@ffwll.ch,
 patrik.r.jakobsson@gmail.com
References: <20230406083240.14031-1-tzimmermann@suse.de>
 <20230406083240.14031-2-tzimmermann@suse.de>
 <87r0sx8kso.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87r0sx8kso.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4KvPVgGAdbuLqUVgvitAVS0M"
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
--------------4KvPVgGAdbuLqUVgvitAVS0M
Content-Type: multipart/mixed; boundary="------------VDmSJidSqUK0G8kUr0CbbeQw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel.vetter@ffwll.ch,
 patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <520414ed-46b7-ae0d-a567-bc2a7c898487@suse.de>
Subject: Re: [PATCH v4 1/9] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230406083240.14031-1-tzimmermann@suse.de>
 <20230406083240.14031-2-tzimmermann@suse.de>
 <87r0sx8kso.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87r0sx8kso.fsf@minerva.mail-host-address-is-not-set>

--------------VDmSJidSqUK0G8kUr0CbbeQw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDQuMjMgdW0gMTA6NDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gRnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4NCj4+DQo+PiBUaGlzIG9uZSBudWtlcyBhbGwgZnJhbWVidWZmZXJzLCB3aGljaCBpcyBh
IGJpdCBtdWNoLiBJbiByZWFsaXR5DQo+PiBnbWE1MDAgaXMgaWdwdSBhbmQgbmV2ZXIgc2hp
cHBlZCB3aXRoIGFueXRoaW5nIGRpc2NyZXRlLCBzbyB0aGVyZSBzaG91bGQNCj4+IG5vdCBi
ZSBhbnkgZGlmZmVyZW5jZS4NCj4+DQo+PiB2MjogVW5mb3J0dW5hdGVseSB0aGUgZnJhbWVi
dWZmZXIgc2l0cyBvdXRzaWRlIG9mIHRoZSBwY2kgYmFycyBmb3INCj4+IGdtYTUwMCwgYW5k
IHNvIG9ubHkgdXNpbmcgdGhlIHBjaSBoZWxwZXJzIHdvbid0IGJlIGVub3VnaC4gT3RvaCBp
ZiB3ZQ0KPj4gb25seSB1c2Ugbm9uLXBjaSBoZWxwZXIsIHRoZW4gd2UgZG9uJ3QgZ2V0IHRo
ZSB2Z2EgaGFuZGxpbmcsIGFuZA0KPj4gc3Vic2VxdWVudCByZWZhY3RvcmluZyB0byB1bnRh
bmdsZSB0aGVzZSBzcGVjaWFsIGNhc2VzIHdvbid0IHdvcmsuDQo+Pg0KPj4gSXQncyBub3Qg
cHJldHR5LCBidXQgdGhlIHNpbXBsZXN0IGZpeCAoc2luY2UgZ21hNTAwIHJlYWxseSBpcyB0
aGUgb25seQ0KPj4gcXVpcmt5IHBjaSBkcml2ZXIgbGlrZSB0aGlzIHdlIGhhdmUpIGlzIHRv
IGp1c3QgaGF2ZSBib3RoIGNhbGxzLg0KPj4NCj4+IHY0Og0KPj4gLSBmaXggRGFuaWVsJ3Mg
Uy1vLWIgYWRkcmVzcw0KPj4NCj4gDQo+IEkgYmVsaWV2ZSB0aGV5IHdhbnQgdG8gaGF2ZSB0
aGVpciBJbnRlbCBTLW8tQiBhcyB3ZWxsLiBJIGtub3cgdGhhdCBkaW0NCj4gY29tcGxhaW5z
IGJ1dCB0aGF0J3Mgd2hhdCB1c3VhbGx5IGhhcHBlbnMgd2l0aCBkYW52ZXQncyBwYXRjaGVz
IEFGQUlLLg0KDQpJJ2xsIGRvIGFzIHlvdSBzdWdnZXN0IGFuZCBhZGQgYm90aC4NCg0KPiAN
Cj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+DQo+PiBDYzogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWls
LmNvbT4NCj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4N
Cj4+IC0tLQ0KPiANCj4gUGF0Y2ggbG9va3MgZ29vZCB0byBtZS4gQWx0aG91Z2ggSSB3b25k
ZXIgaWYgc2hvdWxkIGp1c3QgYmUgZHJvcHBlZCBpbg0KPiBmYXZvdXIgb2YgeW91cnMgcGF0
Y2ggc2luY2UgYXJlIG5vdyBwYXJ0IG9mIHRoZSBzYW1lIHNlcmllcz8NCg0KVGhhdCBtaWdo
dCByZXF1aXJlIGEgcmV3b3JrIG9mIHNvbWUgb3RoZXIgcGF0Y2hlcyBpbiB0aGlzIHNlcmll
cy4gU28gDQpsZXQncyBqdXN0IG1lcmdlIGJvdGggb2YgdGhlbS4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxh
cyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------VDmSJidSqUK0G8kUr0CbbeQw--

--------------4KvPVgGAdbuLqUVgvitAVS0M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQuiKIFAwAAAAAACgkQlh/E3EQov+CS
9Q/+JX8HBfDOqHdgokj1CWFPbVNM8y5yh5cxATnw14Y3+a/PsWwqSN8N3Q1JiBe9SsbqaTKULnl5
gMXbhtfZwZoDeev2XzTFt8N36CUACKS+kgYB2OBSytTZsFvINiFffXJv2LjygS4/s9eRpq32dboo
+gklU9d0R0fMyRqLIh8WuUQgWiO24qP4iU+ddZfWizT9bfVn2z/InKNyqpRqLLgd7OhHclb3j1zN
6oxnrKAoOiLrTiyIB5LPzQhtCYLnaPRLumLb6N7OOeJAXG/07Xo7YY74tqsWLqMfvbqU0Q3xbOCt
bYEmWx4Q+Pf0WwYg72HoiGlncdtQz6Cq7QC+0iO57ZpsgRNETdQJsSqECZGlML5S1HBsdxNTM+57
MdEeYJWrLHW+LLG4T0OvyXlFOYcI5HtvQNm6/uTtckO2Ada+IK1GElf8Gqk4LiVE+CTTpsxzt4KU
12YVOoZYUcwVnZNYrrZVWbHDEmz36sF8TjDj07hCg+05mozWoRITES5GT/uIuN4SuOXpXb8vMI02
3pEcSJhmBQqNcYvDU8Bci9E6pNcMVQnWQZqcwFQ5+voAroWNDwumce+Bqa6JtYwVbEAeMfyjoXY+
CuGqnmZkVE79PLSNLXcSum302MdZ1iqkm7Qb9dkOUUq3zi9BPIZf9PmvenikX4mMWj+1oAPjF0TW
emo=
=WBUf
-----END PGP SIGNATURE-----

--------------4KvPVgGAdbuLqUVgvitAVS0M--

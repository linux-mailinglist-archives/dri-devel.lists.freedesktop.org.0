Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7116797061
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 08:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B9410E76F;
	Thu,  7 Sep 2023 06:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B756510E76F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 06:56:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7026C2185E;
 Thu,  7 Sep 2023 06:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694069784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZdpALMS9MEckS/XjTWoYzgCz9B+N4NdUqPbDlpcyLaw=;
 b=vs+USKGGhjZpaHawDKSjdiCoweo3k5Fr8f/c9qrEV234o+z7MpRp90yBxPKv+f2URc6umO
 xv7IEco3fTupmftaGfIsNeXb1+/vuuU9GztmW3SAE/GGxOj3LtY5K66Tkw90KYJFDYX132
 Wxek0f2YzilVEceUUBowKvGaYlAJQdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694069784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZdpALMS9MEckS/XjTWoYzgCz9B+N4NdUqPbDlpcyLaw=;
 b=0aay+d2s3fSsFLhpn6ZTQWzYs+wj525vROsjIkx+Ndzf3eKOCc/BUsVfWDHvkoeHUTXcDQ
 nDl+0F6ZEaNzmfAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AC7D1358B;
 Thu,  7 Sep 2023 06:56:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I4VDERh0+WTFfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 06:56:24 +0000
Message-ID: <1d001e59-be78-3de8-25a3-087dcd19d58a@suse.de>
Date: Thu, 7 Sep 2023 08:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/7] fbdev/mmp/mmpfb: Do not display boot-up logo
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-3-tzimmermann@suse.de>
 <87ledj4og7.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87ledj4og7.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZGdlOT3gOMcfm9RyxxfPW8an"
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZGdlOT3gOMcfm9RyxxfPW8an
Content-Type: multipart/mixed; boundary="------------QgVRd7mUO2Fg82aUFcKk3qNQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <1d001e59-be78-3de8-25a3-087dcd19d58a@suse.de>
Subject: Re: [PATCH 2/7] fbdev/mmp/mmpfb: Do not display boot-up logo
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-3-tzimmermann@suse.de>
 <87ledj4og7.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ledj4og7.fsf@minerva.mail-host-address-is-not-set>

--------------QgVRd7mUO2Fg82aUFcKk3qNQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA2LjA5LjIzIHVtIDExOjU0IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IFRoZSBmYmNvbiBtb2R1bGUgdGFrZXMgY2FyZSBvZiBkaXNw
bGF5aW5nIHRoZSBsb2dvLCBpZiBhbnkuIFJlbW92ZQ0KPj4gdGhlIGNvZGUgZm9ybSBtbXBm
Yi4gSWYgd2Ugd2FudCB0byBkaXNwbGF5IHRoZSBsb2dvIHdpdGhvdXQgZmJjb24sDQo+IA0K
PiBzL2Zvcm0vZnJvbQ0KPiANCj4+IHdlIHNob3VsZCBpbXBsZW1lbnQgdGhpcyBpbiB0aGUg
ZmJkZXYgY29yZSBjb2RlLg0KPj4NCj4gDQo+IFRoZSBjb21taXQgbWVzc2FnZSBzYXlzIHRo
ZSBzYW1lIHRoYW4gcGF0Y2ggIzEgYnV0IHRoZSBkcml2ZXIgd2lsbCBiZWhhdmUNCj4gZGlm
ZmVyZW50bHkgcmlnaHQ/IFRoYXQgaXMsIHdvbid0IG9ubHkgc2hvdyB0aGUgbG9nbyB3aGVu
IGZiY29uIGlzIG5vdA0KPiBlbmFibGVkIGJ1dCB1bmNvbmRpdGlvbmFsbHk/IFNvIHRoZSBs
b2dvIHdpbGwgYmUgZHVwbGljYXRlZCB3aGVuIGZiY29uIGlzDQo+IGVuYWJsZWQ/DQo+IA0K
PiBJZiBJIHVuZGVyc3Rvb2QgdGhhdCBjb3JyZWN0bHksIHByb2JhYmx5IHlvdSBzaG91bGQg
bWVudGlvbiB0aGF0IGluIHRoZQ0KPiBjb21taXQgbWVzc2FnZSBzaW5jZSByZW1vdmluZyB0
aGUgZmJfc2hvd19sb2dvKCkgd2lsbCBtYWtlIHRoZSBkcml2ZXIgdG8NCj4gYmVoYXZlIGNv
cnJlY3RseS4NCg0KVEJIIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IGhhcHBlbnMgaGVyZSBp
ZiB0aGUgY29uc29sZSBhbmQgdGhlIGxvZ28gaGFzIA0KYmVlbiBlbmFibGVkIGF0IHRoZSBz
YW1lIHRpbWUuIEFGQUlLIGZiY29uIHJlc3BlY3RzIGRpc3BsYXkgcm90YXRpb24sIA0KYnV0
IHRoaXMgZHJpdmVyIGRvZXNuJ3QuIFNvIHRoZSBsb2dvIHNob3dzIHVwIGluIHRoZSB3cm9u
ZyBwbGFjZSB0aGVuPw0KDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4gDQo+IEFja2VkLWJ5OiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------QgVRd7mUO2Fg82aUFcKk3qNQ--

--------------ZGdlOT3gOMcfm9RyxxfPW8an
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT5dBcFAwAAAAAACgkQlh/E3EQov+B3
1A/5AXno2YctCIpTMTjW7SZmyyM/Mkcz4CqcYnZt0+IqrRan8O2Pp/7rPqXVrVtTkuHV2M4f3u27
E9Ps05pN4hjnIP9XUA6eMRaeKYN1tZ5OMS5YIqLDofbNw5gfrD7H0BKUSkj8Ovfq+C2NuN5eDVxh
MTWd9maFZdQan1936sRqrnM1cBAPaAfhm4Rumi6xM4X6YHo2swAig8Swz4C1DR4e3ZymaHPrS2QN
XZOD5MI4CsOBpXcDIMC+xF/dOuFobtsi7uHlX/lpuw8LdKG7TID5Q7i3bpAChP7GGFHSjSii2lhY
c7OaMi0PvqX74Vs6fQyKoE+ihkfzRoj11yGmaQXpdxk/+SYROC68ZYYxwk1bveK0IiPclJn/F11d
ynzuAFVXdWB3a4/dZe2rEF1S5kXdqQI1YKA1xoaSncH8jLcn8HFWMph0/K3KgDLihJ3L3API2YqH
oo+zDtY1pYNDaP2zxp73W0tsdk+lMP4cT1xOAvvrknv7Kgn6IdhHeJagt2P0nc64PjSfDPltdmQ4
bwuakOmUhvxL6IHrqX5OBgMXZV1qJc/dzRThGSNz1kE03F34FxQFgM6vFqFGK8fb2Ig97e0dx6ZP
CCDP6yU8NxKSnEBr4omSguJcJ4YIdV0fbp4NYuTpjRyMwlFKW/+p3esYT/i7QiU/UPTJYe01fSOv
dH0=
=Kpnr
-----END PGP SIGNATURE-----

--------------ZGdlOT3gOMcfm9RyxxfPW8an--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5554B8293
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E65D10E835;
	Wed, 16 Feb 2022 08:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B166C10E818
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 08:10:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2782A212BD;
 Wed, 16 Feb 2022 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644999030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QurIHtBhhxmg1mjCzvXV7QkVSTQDkiRDYufhRd9DHNo=;
 b=1y08vLht/Zhp3uam1WCwEnKida6HBsxRYIDf9C8T7JS09TokvopDtD1JD/2KcNzcOfcSEy
 LMo4ktQnmaYrOD7Va+OHVFRC1MrHKSRjKTJ2Ig+9ZcFVms111nBl3lADlVSpJJo3dib+Gs
 YpC/kbD+vrwW14cYQNfXd92qYdprTNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644999030;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QurIHtBhhxmg1mjCzvXV7QkVSTQDkiRDYufhRd9DHNo=;
 b=M+wA9HXFIgtbWyJy1u1pR8V3BInARrDnOyA+bc5dge5pGSyhSspu/vOYAmbHp5mLpLY4Ra
 mssD7WLjv57POhDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7B1613A7C;
 Wed, 16 Feb 2022 08:10:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CkZqN3WxDGLJRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Feb 2022 08:10:29 +0000
Message-ID: <801579a4-4563-6ea9-1351-90ef36a0d248@suse.de>
Date: Wed, 16 Feb 2022 09:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
Content-Language: en-US
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tomba@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2Up8X4DZnq5QKzKgPlNDDGt0"
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2Up8X4DZnq5QKzKgPlNDDGt0
Content-Type: multipart/mixed; boundary="------------Xap167iYvpqQG5Ga0GrBLDmT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tomba@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
Cc: tony@atomide.com, merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Message-ID: <801579a4-4563-6ea9-1351-90ef36a0d248@suse.de>
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>

--------------Xap167iYvpqQG5Ga0GrBLDmT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDEuMjIgdW0gMTE6MjMgc2NocmllYiBJdmF5bG8gRGltaXRyb3Y6DQo+
IFRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIGV4Y2Vzc2l2ZSBETU0gb3IgQ01BIHVzYWdlIG9m
IEdFTSBidWZmZXJzIGxlYWRpbmcgdG8NCj4gdmFyaW91cyBydW50aW1lIGFsbG9jYXRpb24g
ZmFpbHVyZXMuIFRoZSBzZXJpZXMgZW5hYmxlcyBkYWlseSB1c2FnZSBvZiBkZXZpY2VzDQo+
IHdpdGhvdXQgZXhhdXN0aW5nIGxpbWl0ZWQgcmVzb3VyY2VzIGxpa2UgQ01BIG9yIERNTSBz
cGFjZSBpZiBHUFUgcmVuZGVyaW5nIGlzDQo+IG5lZWRlZC4NCj4gDQo+IFRoZSBmaXJzdCBw
YXRjaCBkb2Vzbid0IGJyaW5nIGFueSBmdW5jdGlvbmFsIGNoYW5nZXMsIGl0IGp1c3QgbW92
ZXMgc29tZQ0KPiBUSUxFUi9ETU0gcmVsYXRlZCBjb2RlIHRvIGEgc2VwYXJhdGUgZnVuY3Rp
b24sIHRvIHNpbXBsaWZ5IHRoZSByZXZpZXcgb2YgdGhlDQo+IG5leHQgdHdvIHBhdGNoZXMu
DQo+IA0KPiBUaGUgc2Vjb25kIHBhdGNoIGFsbG93cyBvZmYtQ1BVIHJlbmRlcmluZyB0byBu
b24tc2Nhbm91dCBidWZmZXJzLiBXaXRob3V0IHRoYXQNCj4gcGF0Y2gsIGl0IGlzIGJhc2lj
YWxseSBpbXBvc3NpYmxlIHRvIHVzZSB0aGUgZHJpdmVyIGFsbG9jYXRlZCBHRU0gYnVmZmVy
cyBvbg0KPiBPTUFQMyBmb3IgYW55dGhpbmcgZWxzZSBidXQgYSBiYXNpYyBDUFUgcmVuZGVy
ZWQgZXhhbXBsZXMgYXMgaWYgd2Ugd2FudCBHUFUNCj4gcmVuZGVyaW5nLCB3ZSBtdXN0IGFs
bG9jYXRlIGJ1ZmZlcnMgYXMgc2Nhbm91dCBidWZmZXJzLCB3aGljaCBhcmUgQ01BIGFsbG9j
YXRlZC4NCj4gQ01BIHNvb24gZ2V0cyBmcmFnbWVudGVkIGFuZCB3ZSBzdGFydCBzZWVpbmcg
YWxsb2NhdGlvbiBmYWlsdXJlcy4gU3VjaCBmYWlscmVzDQo+IGluIFhvcmcgY2Fubm90IGJl
IGhhbmRlbGVkIGdyYWNlZnVsbHksIHNvIHRoZSBzeXN0ZW0gaXMgYmFzaWNhbGx5IHVudXNh
YmxlLg0KPiANCj4gVGhpcmQgcGF0Y2ggZml4ZXMgc2ltaWxhciBpc3N1ZSBvbiBPTUFQNC81
LCB3aGVyZSBETU0vVElMRVIgc3BhY2VzIGdldA0KPiBmcmFnbWVudGVkIHdpdGggdGltZSwg
bGVhZGluZyB0byBhbGxvY2F0aW9uIGZhaWx1cmVzLg0KPiANCj4gU2VyaWVzIHdlcmUgdGVz
dGVkIG9uIE1vdG9sb2xhIERyb2lkNCBhbmQgTm9raWEgTjkwMCwgd2l0aCBPTUFQIEREWCBh
bmQNCj4gUFZSIEVYQSBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9tYWVtby1sZXN0ZS94Zjg2
LXZpZGVvLW9tYXANCj4gDQo+IEl2YXlsbyBEaW1pdHJvdiAoMyk6DQo+ICAgIGRybTogb21h
cGRybTogc2ltcGxpZnkgb21hcF9nZW1fcGluDQo+ICAgIGRybTogb21hcGRybTogU3VwcG9y
dCBleHBvcnRpbmcgb2Ygbm9uLWNvbnRpZ3VvdXMgR0VNIEJPcw0KPiAgICBkcm06IG9tYXBk
cm06IERvIG5vIGFsbG9jYXRlIG5vbi1zY2Fub3V0IEdFTXMgdGhyb3VnaCBETU0vVElMRVIN
Cg0KV2l0aCB0aGUgbGl0dGxlIGV4cGVydGlzZSBJIGhhdmUgd2l0aCBvbWFwZHJtOg0KDQpB
Y2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4g
DQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyAgICAgICAgfCAxOTgg
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9nZW0uaCAgICAgICAgfCAgIDMgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2dlbV9kbWFidWYuYyB8ICAgNSArLQ0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMTE2IGluc2VydGlvbnMoKyksIDkwIGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------Xap167iYvpqQG5Ga0GrBLDmT--

--------------2Up8X4DZnq5QKzKgPlNDDGt0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIMsXUFAwAAAAAACgkQlh/E3EQov+DM
5g//aMZv1ir98w2szom1Ic681tGNmQJEJ0ebFbPlh97lgZBq98Z+U8lkehzNNrU7KWscb8668xvV
j+DIhttI8SiLVvnaKg1sKrzq4OrFtvSu6sebWzJzyuHSCEhL+zobdT+c+QZCOUENN4KZCYP7ynhZ
fYKx2ImiqlGPNIaGbc4ItFB0GWvhDxO2RB8pmPJjjw+dneoqfF/zmWoyoy/6Uu6gZQZRj++OYeJO
dK3uqb06IX+M7Kg3q4I+NhTzp4GLjCxJ9avvv8sM6OuIXUVN/qeXfZUAUGbXXDaU2xS/P/I6N1Ys
Rge7JQw9xynzPZuxmahM91asGbPcurnBXQvSLM/XM4z/VEqmzqW223m0nZ5aX6Lwvain7uC+mlwY
2MZZX28HPcTCZPxxUsB/6xsBQDWEdxuf9wQubvhpTwoJmpynpmWKLSh2uMauowuW1LAHPQImeQYN
hqacNpYeJOlT6bEDM8IFN3GUW4barXX2553PxYKkW3HunwxuoOS5fKhWrjt4NsPaA4lqQ0puQY4A
qJDAC43I3iTY26+h60ae6MN33O5hknpDJ+zIuap224Oe1jB1qL9kJvLlXIheUcEP0Zot4+7UO/hW
PbNaD+igbO4KBZ+tof4e6ALTrDsKt2WpYFu025WRok0JaNmSEcH9qLClCEIt2Zb0Hzia6JtL2mVn
6zA=
=Dxvb
-----END PGP SIGNATURE-----

--------------2Up8X4DZnq5QKzKgPlNDDGt0--

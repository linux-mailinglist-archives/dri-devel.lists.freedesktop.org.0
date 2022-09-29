Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EB5EF6F3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2DE10EA97;
	Thu, 29 Sep 2022 13:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE4B10E5E4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:53:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B99511F8C3;
 Thu, 29 Sep 2022 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664459629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGjzB6l5TdhXNhswbQz8pTZ2zPsawcDzTNcY61F1gNw=;
 b=W6SwQlljModoe8hRkijvNsbc5KvAJyLEvOcafobVheS3ijFsCL6H5Uq8WaDL0gsGvGP1zq
 6eAzQCqdyVcobzYozSwd+7OwRTe1tSvzty7CEqhmmWFE3Y9eJVcw1kIMS4DpB62lW/oLGN
 Dd76uzfpRz+8Rp03jpfsapE0FIqfd24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664459629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGjzB6l5TdhXNhswbQz8pTZ2zPsawcDzTNcY61F1gNw=;
 b=y/nCI84rsNdzz+f3iU/7aj1AKzBPvLPvUiZxKtquloDdJzoQdpvM4sECuDpc82wtp5jPXC
 ZZuesRG+sKjlsuBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96D941348E;
 Thu, 29 Sep 2022 13:53:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S4P0I22jNWNrMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Sep 2022 13:53:49 +0000
Message-ID: <c7bbec52-6557-1a69-eff9-5994c75890d7@suse.de>
Date: Thu, 29 Sep 2022 15:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 02/16] drm/udl: Test pixel limit in mode-config's
 mode-valid function
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-3-tzimmermann@suse.de>
 <562ca68d-a241-90e9-975b-c1274db329f6@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <562ca68d-a241-90e9-975b-c1274db329f6@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kDXOvC00mJj2Bun6mb2ajhLc"
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
--------------kDXOvC00mJj2Bun6mb2ajhLc
Content-Type: multipart/mixed; boundary="------------59o4nwku17DGZb1OXEyxlmP3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <c7bbec52-6557-1a69-eff9-5994c75890d7@suse.de>
Subject: Re: [PATCH 02/16] drm/udl: Test pixel limit in mode-config's
 mode-valid function
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-3-tzimmermann@suse.de>
 <562ca68d-a241-90e9-975b-c1274db329f6@redhat.com>
In-Reply-To: <562ca68d-a241-90e9-975b-c1274db329f6@redhat.com>

--------------59o4nwku17DGZb1OXEyxlmP3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDkuMjIgdW0gMTU6MjAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvMTkvMjIgMTU6MDMsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gVGhlIHNrdV9waXhlbF9saW1pdCBpcyBhIHBlci1kZXZpY2UgcHJvcGVydHksIHNpbWls
YXIgdG8gdGhlIGFtb3VudA0KPj4gb2YgYXZhaWxhYmxlIHZpZGVvIG1lbW9yeS4gTW92ZSB0
aGUgcmVzcGVjdGl2ZSBtb2RlLXZhbGlkIHRlc3QgZnJvbQ0KPj4gdGhlIGNvbm5lY3RvciB0
byB0aGUgbW9kZS1jb25maWcgc3RydWN0dXJlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+IA0KPiBb
Li4uXQ0KPiANCj4+ICtzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgdWRsX21vZGVfY29u
ZmlnX21vZGVfdmFsaWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+ICsJCQkJCQkgICAg
ICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpDQo+PiArew0KPj4gKwlz
dHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7DQo+PiArDQo+PiArCWlmICh1
ZGwtPnNrdV9waXhlbF9saW1pdCkgew0KPj4gKwkJaWYgKG1vZGUtPnZkaXNwbGF5ICogbW9k
ZS0+aGRpc3BsYXkgPiB1ZGwtPnNrdV9waXhlbF9saW1pdCkNCj4+ICsJCQlyZXR1cm4gTU9E
RV9NRU07DQo+PiArCX0NCj4+ICsNCj4+ICsJcmV0dXJuIE1PREVfT0s7DQo+PiArfQ0KPj4g
Kw0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyB1ZGxf
bW9kZV9mdW5jcyA9IHsNCj4+ICAgCS5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZV93
aXRoX2RpcnR5LA0KPj4gKwkubW9kZV92YWxpZCA9IHVkbF9tb2RlX2NvbmZpZ19tb2RlX3Zh
bGlkLA0KPj4gICAJLmF0b21pY19jaGVjayAgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjaywN
Cj4+ICAgCS5hdG9taWNfY29tbWl0ID0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0LA0KPj4g
ICB9Ow0KPiANCj4gSXQncyBhbHdheXMgY29uZnVzaW5nIHRvIG1lIHdoZXRoZXIgc29tZXRo
aW5nIGhhcyB0byBiZSBpbiB0aGUgLm1vZGVfdmFsaWQNCj4gZm9yIGRybV9tb2RlX2NvbmZp
ZyBoZWxwZXIgZnVuY3Rpb24gb3IgZm9yIHRoZSBkcm1fY3J0Y19oZWxwZXJfZnVuY3MuIFRo
aXMNCj4gZHJpdmVyIGlzIHN0aWxsIHVzaW5nIHRoZSBzaW1wbGUtS01TIGF0IHRoaXMgcG9p
bnQgc28gdGhhdCB3aWxsIGJlIGluIHRoZQ0KPiB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9t
b2RlX3ZhbGlkKCkgaWYgc2hvdWxkIGJlIHRoZSBsYXR0ZXIuDQo+IA0KPiBJbiB0aGlzIGNh
c2Ugc2luY2UgaXQgc2VlbXMgdG8gYmUgYWJvdXQgYSBwaXhlbCBsaW1pdCwgaXQgbWlnaHQg
bWFrZSBzZW5zZQ0KPiB0byBoYXZlIHRoaXMgY29uc3RyYWludCBmb3IgdGhlIERSTSBtb2Rl
IGNvbmZpZy4gQnV0IHNpbmNlIGl0IGRlcGVuZHMgb24gdGhlDQo+IHtoLHZ9ZGlzcGxheSwg
SSB0aG91Z2h0IHRoYXQgbmVlZGVkIHRvIGFzayBpZiBpbnN0ZWFkIHNob3VsZCBiZSBmb3Ig
dGhlIENSVEMuDQoNCldlJ3JlIHRlc3RpbmcgbW9kZXMgYWdhaW5zdCBsaW1pdGF0aW9ucyBv
ZiB0aGUgZHJpdmVyIG9yIGhhcmR3YXJlLiBUaGUgDQpydWxlIG9mIHRodW1iIGlzIHRvIHVz
ZSB0aGUgbW9kZV92YWxpZCBmdW5jdGlvbiBvZiB0aGUgY29tcG9uZW50IHRoYXQgDQppbXBv
c2VzIHRoZSBsaW1pdGF0aW9uLiAgSW4gdGhlIGNhc2UgYXQgaGFuZCwgdGhlIGxpbWl0IGlz
IHRoZSBtYXhpbXVtIA0KbnVtYmVyIG9mIHBpeGVscyB0aGF0IHRoZSBhZGFwdGVyIGNhbiBz
dG9yZS4gU28gaXQgZ29lcyBpbnRvIHRoZSANCmRldmljZS13aWRlIG1vZGVfdmFsaWQuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEFueSBpbiBjYXNlLA0KPiANCj4gUmV2
aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29t
Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------59o4nwku17DGZb1OXEyxlmP3--

--------------kDXOvC00mJj2Bun6mb2ajhLc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM1o2wFAwAAAAAACgkQlh/E3EQov+AU
fQ//fXs69oDO039ExGFOEj5sAvVNxEIWYqD378VcolTopFvdp519OSSLvxSFHmrD0FLcD9TLmSal
/F8kcY0Y7yfor3c8LbfUjWHLi4TnftuqwKHPHiNP6XvPrQiv3okSsjzhONAVeOSyD+Z6yI39nAcF
gxAiuRLLepFz9OBeyz7C2ZmuwbSdXxPOz2Ep2keeK9WUEdIfQ4RsQn/e8zFtUwZKkOKmrNP5zNiq
+NC5NelFrTLymJETY/J5k4RYeACpDo7ZoX79yOenadxiXcQOwM5OiYktpnKY7e7TcHn4Nfnuwr5F
Hyszgyudo5FY5uU3vfgTdcODPFhpzKIPN9ad2lWBstG9W6pqbjQ+QDiVVYVUeAMKCzgXsuXcaila
bx0dQ53GA1lx54d4o1DWU9p+TpxXcVtJXXA4scMidDeQOvAAGbnA7VBDPofG6g8niaw2T8lUlcsx
GgZrjgY96fgQxSx0HDRqyBImqjGwyviVqIPhiMb0teLhDx39kOumj+LpDmI+qTijKsENvneA9REn
F7+aC7jhB2u95D+CQdqRiaolXOPNkLQHLA+LLf8Oqwe42f2+UhZ7accwX8lhih99EecxL879xmaJ
a41clZoi6rtYAR3lnwriE1SmTXDKiydl0wsrS2iNXxhWx1jPsjPUZ8OraltgRTntPO9Mx3TNULDL
N4U=
=kve+
-----END PGP SIGNATURE-----

--------------kDXOvC00mJj2Bun6mb2ajhLc--

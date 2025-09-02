Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10FB47825
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8286D10E420;
	Sat,  6 Sep 2025 22:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Cn0gZ3/Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nyGOW7Xl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kILnvtb4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zwREV73P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D210E766
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:32:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EABF31F38E;
 Tue,  2 Sep 2025 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756823535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egSQoe0Y8MiiebL3PVEZogPiEWz9S60jT3nxLgtHtlM=;
 b=Cn0gZ3/QxHP6pHoko/3etqdMPR1T70iqbcWTJ+1lARvnVu6tOWJYhqY/sEnub9VnFASUP4
 5KYY/UWYXQhI6RTO2CHu/s23FZVyDwSqws81yNP6bHI8IFneAiLOCEWrj6MxTrQ/W8chPq
 fqhcW+6FZqVYb2u+lnnP0DqqPzA8Pyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756823535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egSQoe0Y8MiiebL3PVEZogPiEWz9S60jT3nxLgtHtlM=;
 b=nyGOW7XlmeXwboiSFnGkkduT625cWoxAPMLfEnIlVTV0eiQzXBfrbiv88hJCTuXwm/EX+O
 dkXpDvEok7f5NrBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756823534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egSQoe0Y8MiiebL3PVEZogPiEWz9S60jT3nxLgtHtlM=;
 b=kILnvtb4/VRYuBdkEd5+03fRpV9dnbd3ZWrg8x5tgqcc3ste1TCQt5OYC8MC6nQ5izUNkv
 fOO3S0KpZrPEt3SPacI/IehOx69NOhjiT/rFipa4lXHezrZvOYosaU+mQ3emhwkwfY8ZtS
 clu4Y1epdCPvY4M0lUegen9R7bvtbvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756823534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egSQoe0Y8MiiebL3PVEZogPiEWz9S60jT3nxLgtHtlM=;
 b=zwREV73PD9Z0uOkanGtfTBp5yH2RSBkS2E+Lqhulr6rzQYwCivVXpYrT35Fd7KqSN13wbd
 JdYPB/zy+lESv+AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D48A613888;
 Tue,  2 Sep 2025 14:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id v+pKM+7/tmhudwAAD6G6ig
 (envelope-from <wfrisch@suse.de>); Tue, 02 Sep 2025 14:32:14 +0000
Message-ID: <c9355591-0664-4c28-83c6-97eb2aa32982@suse.de>
Date: Tue, 2 Sep 2025 16:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.16.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
References: <20250828174932.414566-1-imre.deak@intel.com>
 <20250828174932.414566-7-imre.deak@intel.com>
Content-Language: en-US
From: Wolfgang Frisch <wfrisch@suse.de>
Autocrypt: addr=wfrisch@suse.de; keydata=
 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
 yaSeuQSO99ZZudEjkOCl72o0IbwtpYI=
In-Reply-To: <20250828174932.414566-7-imre.deak@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hwpXp0H1PLxI0VsbXjMLPJeJ"
X-Spam-Level: 
X-Spamd-Result: default: False [-6.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SIGNED_PGP(-2.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_SHORT(-0.20)[-0.994]; MIME_BASE64_TEXT(0.10)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
 HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.30
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:10 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hwpXp0H1PLxI0VsbXjMLPJeJ
Content-Type: multipart/mixed; boundary="------------Rbfh7tdkLlX7SmDJYRaDNEVH";
 protected-headers="v1"
From: Wolfgang Frisch <wfrisch@suse.de>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Message-ID: <c9355591-0664-4c28-83c6-97eb2aa32982@suse.de>
Subject: Re: [PATCH 6.16.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
References: <20250828174932.414566-1-imre.deak@intel.com>
 <20250828174932.414566-7-imre.deak@intel.com>
In-Reply-To: <20250828174932.414566-7-imre.deak@intel.com>

--------------Rbfh7tdkLlX7SmDJYRaDNEVH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDgvMjgvMjUgNzo0OSBQTSwgSW1yZSBEZWFrIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+IC0JCXJldCA9IGRybV9kcF9k
cGNkX3Byb2JlKGF1eCwgRFBfTEFORTBfMV9TVEFUVVMpOw0KPiArCQlyZXQgPSBkcm1fZHBf
ZHBjZF9wcm9iZShhdXgsIERQX1RSQUlOSU5HX1BBVFRFUk5fU0VUKTsNClRoZSBvcmlnaW5h
bCBjb21taXQgZDM0ZDZmZWFmNGE3NjgzM2VmZmNlYzBiMTQ4YjY1OTQ2YjA0Y2RlOCBicm9r
ZSBteSANCnNldHVwLCB3aXRoIGEgbW9uaXRvciBjb25uZWN0ZWQgdmlhIFRodW5kZXJib2x0
LiBMaW51eCA2LjE2LjQgDQp0ZW1wb3JhcmlseSBmaXhlZCB0aGUgaXNzdWUgYnkgcmV2ZXJ0
aW5nIHRvIERQX0xBTkUwXzFfU1RBVFVTLiBNeSANCm1vbml0b3IgaXMgYSBTYW1zdW5nIEMz
NEo3OXggY29ubmVjdGVkIHZpYSBUaHVuZGVyYm9sdCAzLg0KDQpUbyBiZSBjbGVhcjoNCi0g
d29ya2luZzogRFBfTEFORTBfMV9TVEFUVVMNCi0gbm90IHdvcmtpbmc6IERQX1RSQUlOSU5H
X1BBVFRFUk5fU0VUDQoNCldpdGggdGhlIGxhdHRlciBJIGdldDoNCj4gK3RodW5kZXJib2x0
IDAwMDA6YzU6MDAuNjogMjogdGltZW91dCByZWFkaW5nIGNvbmZpZyBzcGFjZSAyIGZyb20g
MHgyMA0KPiArdGh1bmRlcmJvbHQgMDAwMDpjNTowMC42OiAyOiB0aW1lb3V0IHJlYWRpbmcg
Y29uZmlnIHNwYWNlIDIgZnJvbSAweDUNCj4gK3RodW5kZXJib2x0IDAwMDA6YzU6MDAuNjog
MjogY2Fubm90IGZpbmQgVEJfVlNFX0NBUF9QTFVHX0VWRU5UUyBhYm9ydGluZw0KPiAgdGh1
bmRlcmJvbHQgMS0yOiBuZXcgZGV2aWNlIGZvdW5kLCB2ZW5kb3I9MHgxNzUgZGV2aWNlPTB4
MjBhYg0KPiAgdGh1bmRlcmJvbHQgMS0yOiBTQU1TVU5HIEVMRUNUUk9OSUNTIENPLixMVEQg
QzM0Sjc5eA0KPiAgdGh1bmRlcmJvbHQgMS0wOjIuMTogbmV3IHJldGltZXIgZm91bmQsIHZl
bmRvcj0weDFkYTAgZGV2aWNlPTB4ODgzMA0KPiArdGh1bmRlcmJvbHQgMDAwMDpjNTowMC42
OiAwOjYgPC0+IDI6MTAgKERQKTogbm90IGFjdGl2ZSwgdGVhcmluZyBkb3duDQo+ICt0aHVu
ZGVyYm9sdCAwMDAwOmM1OjAwLjY6IDA6NyA8LT4gMjoxMCAoRFApOiBub3QgYWN0aXZlLCB0
ZWFyaW5nIGRvd24NCg0KQmVzdCByZWdhcmRzDQoNCi0tIA0KV29sZmdhbmcgRnJpc2NoIDx3
b2xmZ2FuZy5mcmlzY2hAc3VzZS5jb20+DQpTZWN1cml0eSBFbmdpbmVlcg0KT3BlblBHUCBm
aW5nZXJwcmludDogQTJFNiBCN0Q0IDUzRTkgNTQ0RiBCQzEzICBEMjZCIEQ5QjMgNTZCRCA0
RDRBIDJEMTUNClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSCwgRnJhbmtl
bnN0cmHDn2UgMTQ2LCA5MDQ2MSBOw7xybmJlcmcNCg0K

--------------Rbfh7tdkLlX7SmDJYRaDNEVH--

--------------hwpXp0H1PLxI0VsbXjMLPJeJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEYqBDpiSp/H/7pxro7t22gcnlyyMFAmi2/+oFAwAAAAAACgkQ7t22gcnlyyMF
ERAAiqI2gQkUjW5t2pkLQWe9sNMe2N9pEhJxsGcn2gETSt14HgbThlW9fjepJ1oArPlXxLxoRGJP
PLVWyMqFOrG5EnOPT+3izwQ/zCex8SBmyAW9GVd3q9+eImBdZm1WM+QGu+kA+ty5+HIrFxUnh2Hj
QM/FGniSti9t6t0w8Vib3YoJ+KPG4KSOOjRdc2aA+NmUdAT2lhXg9zDtL1lsjqxIpgkT8D3h7bUq
x5ciCaljYn3uAq7Y9ILqgn6Zz786f20em32dxSn4aWNm860bm4titnvijNpgY0H8Z5GjLma27snr
63SoDuDhD7plvPrsaIpz7bSAH8iBnbr7ypUv6L4crm5xtqkUAgXSiykeuvczypmDlmE/EESzbpfI
UkHHwYwy9dFkHqBaY2+nOyxLZn1N6v5oKMaaGPRl56uM+38fDFV/Ycua25yHbcF10MlbdAWqWWkI
1jHW1yIq4rnfQYaUXOKak2OyyIQMtWROwEbYqOH+rKAI2BW7kMIRA3+T6NbuIScHz1v4BTXKGXmP
eg4HgAfBj0tMuwm0xXwU8wCaakyd7y1i45ciYhA0MuFPeP7fAujbgmg8l/lPJP1a8iLqvWJm3oqS
JBBInoyeyszrNAMT/s73k+oMaTbeBa34jdFFIbLFX0dE/joXcART03Yetd4PYXIr3lZBk7gzqJlj
AWE=
=mnJp
-----END PGP SIGNATURE-----

--------------hwpXp0H1PLxI0VsbXjMLPJeJ--

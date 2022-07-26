Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6F580DA2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404714BC0D;
	Tue, 26 Jul 2022 07:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F34A14B41B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 07:28:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FA7C1FA1B;
 Tue, 26 Jul 2022 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658820520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z0QvVcmsK/mbIhufbWifkOi0bLt+pzMmzd/HPA+FcVU=;
 b=S8pDag1ek5NipxXB1OHi28lIdFtudvpFe4Ub1cs/NhbVq0NUmvMDdFNYg2Mliy/DfKXI2I
 Kz6ZIp9YI6519fzcqBXWCwDMkkEopwRUDFUN5OwVv1YOWEApbeFDMrZ5NIPxsUc/eu3o7m
 sSYVtpZNOpPSJqkT/lNjL/YOZFoShWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658820520;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z0QvVcmsK/mbIhufbWifkOi0bLt+pzMmzd/HPA+FcVU=;
 b=tkYfyvzh3ETpFdIqCNhe2ZuZt7fDHn5eOXO+KufwHQsQ6vKTT6B5xxvsdUL9jrskwSRLUW
 xrbW7SnPErgDi9Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 279F313322;
 Tue, 26 Jul 2022 07:28:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1Wi9CKiX32L8aQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Jul 2022 07:28:40 +0000
Message-ID: <af72d22c-323d-abb9-dd77-b8b5eda4d7df@suse.de>
Date: Tue, 26 Jul 2022 09:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 30/32] drm/via: Add Kconfig
Content-Language: en-US
To: Kevin Brace <kevinbrace@gmx.com>, dri-devel@lists.freedesktop.org
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-11-kevinbrace@gmx.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220725235359.20516-11-kevinbrace@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hGNvfYRYybgVh3Rk0Tjwmw0r"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hGNvfYRYybgVh3Rk0Tjwmw0r
Content-Type: multipart/mixed; boundary="------------emcaunHwxJnkv4vz0DWxa3hV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Brace <kevinbrace@gmx.com>, dri-devel@lists.freedesktop.org
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Message-ID: <af72d22c-323d-abb9-dd77-b8b5eda4d7df@suse.de>
Subject: Re: [PATCH v3 30/32] drm/via: Add Kconfig
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-11-kevinbrace@gmx.com>
In-Reply-To: <20220725235359.20516-11-kevinbrace@gmx.com>

--------------emcaunHwxJnkv4vz0DWxa3hV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMDE6NTMgc2NocmllYiBLZXZpbiBCcmFjZToNCj4gRnJv
bTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+DQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBCcmFjZSA8a2V2aW5icmFjZUBicmFjZWNvbXB1dGVy
bGFiLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpYS9LY29uZmlnIHwgOSAr
KysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92aWEvS2NvbmZpZw0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aWEvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aWEvS2NvbmZpZw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjdjNDY1NmExZDQ3Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS92aWEvS2NvbmZpZw0KPiBAQCAtMCwwICsxLDkgQEANCj4gK2NvbmZpZyBEUk1f
T1BFTkNIUk9NRQ0KDQpJIHdvdWxkIGtlZXAgdGhlIGRyaXZlciBvcHRpb24gbmFtZWQgRFJN
X1ZJQSwgYXMgaXQgaGFzIGJlZW4gc28gZmFyLiBUbyANCmJ1aWxkIHRoZSBleGlzdGluZyBE
UkkxIGRyaXZlciwgcmF0aGVyIGludHJvZHVjZSBhIG5ldyBjb25maWcgc3ltYm9sIA0KdGhh
dCBlbmFibGVzIGl0LiBUaGUgcnVsZSBsb29rcyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQog
ICBjb25maWcgRFJNX1ZJQV9EUkkxDQogICBib29sZWFuICJEUkkxIHN1cHBvcnQiDQogICAg
IGRlcGVuZHMgb24gRFJNX1ZJQSAmJiBEUk1fTEVHQUNZDQogICAgIGhlbHANCiAgICAgICBC
dWlsZCBmb3IgRFJJMS1iYXNlZCB1c2Vyc3BhY2UgZHJpdmVycy4NCg0KSXQgd2lsbCBzaG93
IHVwIGFzIGFuIG9wdGlvbiBpZiB0aGUgdXNlciBzZWxlY3RzIGJvdGggRFJNX1ZJQSBhbmQg
DQpEUk1fTEVHQUNZLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCj4gKwl0cmlzdGF0
ZSAiT3BlbkNocm9tZSAoVklBIFRlY2hub2xvZ2llcyBDaHJvbWUpIg0KPiArCWRlcGVuZHMg
b24gRFJNICYmIFBDSSAmJiBYODYNCj4gKwlzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4gKwlz
ZWxlY3QgRFJNX1RUTQ0KPiArCWhlbHANCj4gKwkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5
b3UgaGF2ZSBWSUEgVGVjaG5vbG9naWVzIFVuaUNocm9tZSBvcg0KPiArCSAgQ2hyb21lOSBp
bnRlZ3JhdGVkIGdyYXBoaWNzLiBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbA0K
PiArCSAgYmUgY2FsbGVkIHZpYS4NCj4gLS0NCj4gMi4zNS4xDQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------emcaunHwxJnkv4vz0DWxa3hV--

--------------hGNvfYRYybgVh3Rk0Tjwmw0r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLfl6cFAwAAAAAACgkQlh/E3EQov+BW
dRAAjTDvZdIt0IeRYjApq8X6u+CLBM3/s8h+zeCP8DgqEWid3GCNgZHjLMylCgnT+xnXUk1N7Mgr
FP/JXxRCtK29REY6kmp+3NWwjd9KTQbAdwIljKslB0eFr2GvZiO7EAFrllhJJ9IGOwpfPeVzI1+8
HwCeso5hmLMSRyNDSIVEIIq1yBW60zGi5VUBl8Gl0aefHdbSm6pModVA9hNPlgjDsYBVo4K5xa72
Rdp4HN8FlOp+C7IY8ypqMtkw0RncpENSd9NAQA0luY/QeTM7OxHLKi9RE+jBCd9ZbVMC2aEMuaec
WJmNPtsH0+T/IWbAdLzX+PF4cqm6bHKBhYl79m33IWuqOKPPTyO1gzuRNuKscAQ7iCRFZu3yjiIN
K9Wq6tigVZ2gCNWWbNBjsZZfvAVNd4W3DTcKjSYs4a/FojLP3n+WXWUSjaxGt5m2Wxky0VCpnPqz
qaSDQkPosq4WadM9r8mwME2a0Qy2xZ3DTH5TgI51KUFI2/HiTr1d+Fh8Tu3y7LfHHYCuY6wVKUZB
WR1wC37+VrccwSZXNDYCj3c1KLxDUp0A6fr1eJdBGIzxfECF9EGPYdK10hoauKIc0j8TgK1ivF6Z
HHea6N5HApm1sW4aLTNsLS7dwKzNbSwMQg1hNTfS5/bPYzN0DAxEg2c6ehSxba2170rExIJ0G/GM
RkE=
=W5BD
-----END PGP SIGNATURE-----

--------------hGNvfYRYybgVh3Rk0Tjwmw0r--

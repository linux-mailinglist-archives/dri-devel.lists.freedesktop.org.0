Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48C54B27D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86F81122C9;
	Tue, 14 Jun 2022 13:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4907A1122C9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:48:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC2761F959;
 Tue, 14 Jun 2022 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655214530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mkgkdzos4C543Q0JPho7kcYn5hoegCDHPUsUlV+dpLw=;
 b=tB2GVb9r8+CdLN78LP4FF3rLLFU0NfePcRtlTaLEga5kJklxmLVVTfKqAHxsaYc31LAxup
 u9lMaG4TDAPbYvVGRp8SqTEgib/j9iveCVeQQoFI1NZD45rLcWFV+ME6UMjGv66+YLh8e0
 nMfPchaSZ8PHTpNFbq8gxRQR5BuIqTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655214530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mkgkdzos4C543Q0JPho7kcYn5hoegCDHPUsUlV+dpLw=;
 b=oltVDL7XHCfPuHL7Nt4wBWWpEpsOmyS5oLV/Hox8dCkpMp9JMen+ogFzkXbWkKXhErSUdt
 O5MI6LAhywzdDGCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF59E139EC;
 Tue, 14 Jun 2022 13:48:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LGe5McKRqGLLMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jun 2022 13:48:50 +0000
Message-ID: <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
Date: Tue, 14 Jun 2022 15:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hsUWOBibIkBO2iaUIRmwlzUR"
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hsUWOBibIkBO2iaUIRmwlzUR
Content-Type: multipart/mixed; boundary="------------NP7QhKiptNa25WrYzVM0GiEx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Message-ID: <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
In-Reply-To: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>

--------------NP7QhKiptNa25WrYzVM0GiEx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDYuMjIgdW0gMTU6MDQgc2NocmllYiBSb2JpbiBNdXJwaHk6DQo+IFRo
ZSBBcm0gSnVubyBib2FyZCBFREsyIHBvcnQgaGFzIHByb3ZpZGVkIGFuIEVGSSBHT1AgZGlz
cGxheSB2aWEgSERMQ0QwDQo+IGZvciBzb21lIHRpbWUgbm93LCB3aGljaCB3b3JrcyBuaWNl
bHkgYXMgYW4gZWFybHkgZnJhbWVidWZmZXIuIEhvd2V2ZXIsDQo+IG9uY2UgdGhlIEhETENE
IGRyaXZlciBwcm9iZXMgYW5kIHRha2VzIG92ZXIgdGhlIGhhcmR3YXJlLCBpdCBzaG91bGQN
Cj4gdGFrZSBvdmVyIHRoZSBsb2dpY2FsIGZyYW1lYnVmZmVyIGFzIHdlbGwsIG90aGVyd2lz
ZSB0aGUgbm93LWRlZnVuY3QgR09QDQo+IGRldmljZSBoYW5ncyBhYm91dCBhbmQgdmlydHVh
bCBjb25zb2xlIG91dHB1dCBpbmV2aXRhYmx5IGRpc2FwcGVhcnMgaW50bw0KPiB0aGUgd3Jv
bmcgcGxhY2UgbW9zdCBvZiB0aGUgdGltZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvYmlu
IE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hcm0vaGRsY2RfZHJ2LmMgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRs
Y2RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jDQo+IGluZGV4IGFm
NTkwNzdhNTQ4MS4uYTVkMDQ4ODQ2NThiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2hkbGNkX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2Rf
ZHJ2LmMNCj4gQEAgLTMzMSw2ICszMzEsOCBAQCBzdGF0aWMgaW50IGhkbGNkX2RybV9iaW5k
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAJCWdvdG8gZXJyX3ZibGFuazsNCj4gICAJfQ0K
PiAgIA0KPiArCWRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVy
cyhOVUxMLCAiaGRsY2QiLCBmYWxzZSk7DQo+ICsNCg0KSW4gYWRkaXRpb24gdG8gd2hhdCBK
YXZpZXIgc2FpZCwgaXQgYXBwZWFycyB0byBiZSB0b28gbGF0ZSB0byBjYWxsIHRoaXMgDQpm
dW5jdGlvbi4gSWYgYW55dGhpbmcgaGVyIGV0b3VjaGVzIGhhcmR3YXJlLCB5b3UgbWlnaHQg
YWNjaWRlbnRhbGx5IA0KaW50ZXJmZXJlIHdpdGggdGhlIEVGSS1yZWxhdGVkIGRyaXZlci4g
UmF0aGVyIGNhbGwgaXQgYXQgdGhlIHRvcCBvZiANCmxkbGNkX2RybV9iaW5kKCkuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICAJZHJtX21vZGVfY29uZmlnX3Jlc2V0KGRybSk7
DQo+ICAgCWRybV9rbXNfaGVscGVyX3BvbGxfaW5pdChkcm0pOw0KPiAgIA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------NP7QhKiptNa25WrYzVM0GiEx--

--------------hsUWOBibIkBO2iaUIRmwlzUR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKokcIFAwAAAAAACgkQlh/E3EQov+Ck
kg//TQYTYg3Ci1cu3JN9o+A69K9AEvFP+3qdCsWsbk0O8AJmfJxqeShAfQh/l6dfG7CMjbpq166c
F8VQ9m4t/dwyl/qxe9ZbDgDb+0bdUMzLMQn5vCJw2b16D2QVAwA5d8NIgskQzNSDEnW4PBft4cyY
SR1vZNbz86VCtVGVj7+HpClRD1DbREnURz4PhhmcOqa8tQaRsbO8Z+AgB62EDw/VBvZvXLF/xUSk
xl5SwcEjG+VfabbBJyhB3hqf/MTlpUAxbr9puZUOlSi6mBl4/88LdsoQA53c/qNRXOHx3kV0rBZh
hjhG97yQjRkxKM2G4HDfPnOoYN1WyfnMujIrg3ZwEgf4FP4YteOY1P0HcnUELmC0Cao4jsqULkGv
ulQPER1XaO7za9VzqhwixKF33ARp+aSGfqOi9dFQG+UN9K9tvaEPdMG7Pk4iyTMRybJDtSCSyP7k
2fu3D+S7a1qZZX4ggqfB4Q0InwnZIIsobjv0Y0uVJHlzROSf0zz2gZse+aS8CKNhq2LlpOjxlHtm
+dNFtPMMztbYzE6no6HdMi1LFUD/gqA0qTdYUsoXOBPHBRu6eHzA7mHHOVeEaH4Yu3dNoR6Jzrdx
BSfVizrFZiGzrGb75OXHXAywLaqd3QqOE+1G5uaXg6boTMa4v3b07LUPGEmaih8YNVG3xlA9Rhvm
JJU=
=Gmga
-----END PGP SIGNATURE-----

--------------hsUWOBibIkBO2iaUIRmwlzUR--

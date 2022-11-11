Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBDF625AF1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 14:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F2D10E80E;
	Fri, 11 Nov 2022 13:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E54A10E813
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 13:06:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8991D224D2;
 Fri, 11 Nov 2022 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668171991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+JlNlyePVLnz2jqYT6WGFk3AcCxTZOe+857oL6M14A=;
 b=xKEMmRpQ2YJtsJ1zUlgG2YhnCOMxVu+HHDeNU5t+RDWiH5fK2bN0T63yJ4TNS2v+1EYf5U
 s0TafClxvnI8J7aPmUIu+dBB5qO/teFERLTkVUwrPx9rcU/1NK2H6Jv/7OixguhEZScgFY
 /CHYO+t9cl3BF0xMZuAyz6jiLxGpTtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668171991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+JlNlyePVLnz2jqYT6WGFk3AcCxTZOe+857oL6M14A=;
 b=J5pUloGfFECMFWA90pksoJ7kLkaAM6CjkoYPzXI9mhOI+j2tRYZe7gwlJ6LNPohaYJa4+B
 iXL1xiWsKGBIwLAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6790813357;
 Fri, 11 Nov 2022 13:06:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yJ9CGNdIbmOyXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Nov 2022 13:06:31 +0000
Message-ID: <a0cf08f7-d60c-f438-dc26-fb8af0e49f80@suse.de>
Date: Fri, 11 Nov 2022 14:06:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] drm: Move nomodeset kernel parameter to drivers/video
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-2-tzimmermann@suse.de>
 <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H9T48zxYPd7vCLT9XDBDGccg"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------H9T48zxYPd7vCLT9XDBDGccg
Content-Type: multipart/mixed; boundary="------------maZk3gYgbEZguHtxIIVGQnvj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <a0cf08f7-d60c-f438-dc26-fb8af0e49f80@suse.de>
Subject: Re: [PATCH 1/2] drm: Move nomodeset kernel parameter to drivers/video
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-2-tzimmermann@suse.de>
 <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>
In-Reply-To: <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>

--------------maZk3gYgbEZguHtxIIVGQnvj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTEuMjIgdW0gMTA6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDExLzcvMjIgMTE6NDksIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPiANCj4gWy4uLl0NCj4gDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4+IGlu
ZGV4IGE0NjVkNTI0Mjc3NGEuLjcwMTc4YzVmNTM5NTYgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4+IEBA
IC0zNzc3LDcgKzM3NzcsNyBAQA0KPj4gICAJCQlzaHV0ZG93biB0aGUgb3RoZXIgY3B1cy4g
IEluc3RlYWQgdXNlIHRoZSBSRUJPT1RfVkVDVE9SDQo+PiAgIAkJCWlycS4NCj4+ICAgDQo+
PiAtCW5vbW9kZXNldAlEaXNhYmxlIGtlcm5lbCBtb2Rlc2V0dGluZy4gRFJNIGRyaXZlcnMg
d2lsbCBub3QgcGVyZm9ybQ0KPj4gKwlub21vZGVzZXQJRGlzYWJsZSBrZXJuZWwgbW9kZXNl
dHRpbmcuIEdyYXBoaWNzIGRyaXZlcnMgd2lsbCBub3QgcGVyZm9ybQ0KPj4gICAJCQlkaXNw
bGF5LW1vZGUgY2hhbmdlcyBvciBhY2NlbGVyYXRlZCByZW5kZXJpbmcuIE9ubHkgdGhlDQo+
PiAgIAkJCXN5c3RlbSBmcmFtZWJ1ZmZlciB3aWxsIGJlIGF2YWlsYWJsZSBmb3IgdXNlIGlm
IHRoaXMgd2FzDQo+PiAgIAkJCXNldC11cCBieSB0aGUgZmlybXdhcmUgb3IgYm9vdCBsb2Fk
ZXIuDQo+IA0KPiBOb3QgcmVhbGx5IHBhcnQgb2YgeW91ciBwYXRjaCBidXQgcHJvYmFibHkg
d2Ugc2hvdWxkIHJld29yZCB0aGlzIGEgbGl0dGxlIGJpdC4NCj4gDQo+IEJlY2F1c2UgYXMg
dGhpcyBpcyB3cml0dGVuLCBpdCBpbXBsaWVzIHRoYXQgbm90IG9ubHkgRFJNIGRyaXZlcnMg
d2l0aCBmZWF0dXJlDQo+IERSSVZFUl9NT0RFU0VUIHdpbGwgbm90IGJlIGF2YWlsYWJsZSBi
dXQgYWxzbyBkcml2ZXJzIHdpdGggRFJJVkVSX1JFTkRFUi4gQnV0DQo+IHRoYXQncyBub3Qg
dGhlIGNhc2UsIHJlbmRlci1vbmx5IGRyaXZlcnMgdXN1YWxseSBqdXN0IGlnbm9yZSB0aGlz
IHBhcmFtZXRlcg0KPiAoYnV0IG5vdCBhbGwgSUlSQyksIHNvIEkgd29uZGVyIGhvdyB3ZSBj
b3VsZCBtYWtlIHRoaXMgY29tbWVudCBtb3JlIGFjY3VyYXRlLg0KDQpJIHNlZSB3aGF0IHlv
dSBtZWFuLCBidXQgaXQncyBoYXJkIHRvIGRlc2NyaWJlIGluIHNpbXBsZSB3b3Jkcy4gVGhl
IA0Kb3B0aW9uIGlzIGEgYml0IGZ1enp5LiBJdCBtZWFucyB0aGF0IGEgZHJpdmVyIHdpbGwg
bm90IHJlcGxhY2UgYSANCmZpcm13YXJlIGJ1ZmZlcjsgZXZlbiBpZiB0aGF0IG1lYW5zIGl0
IHdvbid0IGluaXRpYWxpemUgYXQgYWxsLiBJIGd1ZXNzIA0Kd2Ugc2hvdWxkIHNwZWxsIHRo
YXQgb3V0Lg0KDQo+IA0KPiBBbHNvIG1heWJlIHdlIGNhbiBtZW50aW9uIGluIHRoZSBjb21t
ZW50IGZiZGV2IGFuZCBEUk0/IEp1c3QgdG8gbWFrZSBpdCBjbGVhcg0KPiB0aGF0IHRoaXMg
d2lsbCBhZmZlY3QgdG8gYm90aCBzdWJzeXN0ZW1zPyBXaGVuIEkgZmlyc3Qgd29ya2VkIG9u
IHRoaXMsIHRoZXJlDQo+IHdlcmUgYSBsb3Qgb2YgYXNzdW1wdGlvbnMgaW4gdGhlIHN0YWNr
IChnZG0sIG11dHRlciwgcGx5bW91dGgpIHRoYXQgbm9tb2Rlc2V0DQo+IGJhc2ljYWxseSBt
ZWFudCAibm8gRFJNIGJ1dCBmYmRldiIuDQoNCkkgY2FuIGNoYW5nZSB0aGUgdGV4dCB0byBz
YXkgJ0RSTSBhbmQgZmJkZXYgZHJpdmVycycuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IFsuLi5dDQo+IA0KPj4gICANCj4+ICAgaW50IGRybV9kZXZfc2V0X3VuaXF1ZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lKTsNCj4+ICAgDQo+PiAt
ZXh0ZXJuIGJvb2wgZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSh2b2lkKTsNCj4+ICsvKiBU
T0RPOiBJbmxpbmUgZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSgpIGluIGFsbCBpdHMgY2Fs
bGVycy4gKi8NCj4gDQo+IEkgZ3Vlc3MgeW91IHBsYW4gdG8gZG8gdGhhdCBhcyBmb2xsb3ct
dXAgcGF0Y2hlcyBvbmNlIHRoaXMgc2VyaWVzIGxhbmQ/IEp1c3QNCj4gdG8gYXZvaWQgdGhl
IGNodXJuIHRvIHJlcXVpcmUgYWNrcyBmb3IgYWxsIHRoZSBkcml2ZXJzIHRvIG1lcmdlIHRo
aXMgc2VyaWVzPw0KPiANCj4gVGhlIGNoYW5nZXMgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+
IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0
LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------maZk3gYgbEZguHtxIIVGQnvj--

--------------H9T48zxYPd7vCLT9XDBDGccg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNuSNYFAwAAAAAACgkQlh/E3EQov+Bj
Eg/7BeY77VnD8YzPYPOOEuTw6eXjY6zjCNPWlReP0/GJVGFwPdeihUohbQYuzQzis9SVEC3oEeH1
EYx+fxBVkLZa8i/H0prrO3WZVefrgnRyT0pDQTpKgf6XVeS7GHHdn04txaPahMbhvWUo0UYTmb27
dQwzgn5UWzTFTyM/FXM5BWkgoHzCh5LOBZ2L3E1MRl/SOvif7/5hbww9H/kN8UD0LdrDKGXw2lcq
k3mc/OIQ2qMzLZBh+4DO5A/whgJqNIH5R00NNi1ixBjv/cn4MJvDeW2nlDLW3EY5DaMu06mfuh7U
sDjC7Pue8JBr/KMwH62spY9WrfaGh8/8Dten9Ts85/76In16FDNeGwnULNGCnqD90BW49glZ9vg8
6PK+87E2yO/kQ1qgJu0r4uLc5VrIcEl0Jv6NgH0rYjmiqSao2D0r+nzsfk69kHSoKxJ2Q8MjMMH+
nRHY+nCoj8py13j4PN/p6OJBzSxQE0Y3kmuxZdzJbVCLTdhwuXWQV78xdMLu0WvLhZCcZSWmY/iN
Bp9PNEqgeqCT81u4v6AqcY50xptjh0TXkDrUyfX1Tj/z8YeQmceBzuWZdpBU0Ziln2Pd1/SuIu6+
q1+fGvEaV+5L2UTGxX4g9DHiGeeADf43vWXTju/0sQa2LZ6rKmhAxBHFAX8XtCWxM8F3jRTvRKAi
gjA=
=IdF2
-----END PGP SIGNATURE-----

--------------H9T48zxYPd7vCLT9XDBDGccg--

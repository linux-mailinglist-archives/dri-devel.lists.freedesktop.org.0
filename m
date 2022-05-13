Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD775526109
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 13:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEC810E9A9;
	Fri, 13 May 2022 11:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE7D10E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 11:32:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B6781F938;
 Fri, 13 May 2022 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652441577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MiDmOs1/H6dqhYoSsVl9AlYWy58YcyCRs35aUMxOAmk=;
 b=iyQpKgT6MMw5KR0+jUn8wy2p2zhml+IT3FWNBgzqrnI+bTe7jjvfmhFmjvdVzwSbMAkyNr
 qiTx70JKfRIEF+dPJAKdKa8+FHqZH//GU0KiinAFGrT9++z/7dGmZxRogoI4PMlZL1T2lE
 l0T8JiBr/iIt1rL0etW1TeiS0RAMdfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652441577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MiDmOs1/H6dqhYoSsVl9AlYWy58YcyCRs35aUMxOAmk=;
 b=dUuReiObJGHJyunjgGcV3jKOLA10P5dDxluAqyqHphNI3qjbgp/tzpkMqsGQaH3uIb+lsk
 /h3E33yI2aHg8vCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4474813A84;
 Fri, 13 May 2022 11:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dxe7D+lBfmKROgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 13 May 2022 11:32:57 +0000
Message-ID: <026b1c6d-c258-fa88-ed08-d1b5784c95b0@suse.de>
Date: Fri, 13 May 2022 13:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 0/7] Fix some races between sysfb device registration
 and drivers probe
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <f726c96b-1924-841f-0125-9f7ed37de20a@suse.de>
 <cc0d6635-c739-490d-9c8d-7f53da48e61a@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cc0d6635-c739-490d-9c8d-7f53da48e61a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------740qThg0O9gjX6BQllYOYoVE"
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
Cc: linux-fbdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------740qThg0O9gjX6BQllYOYoVE
Content-Type: multipart/mixed; boundary="------------RZpES3ql0GSOSsXG7T1LU8ih";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Peter Jones <pjones@redhat.com>,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org
Message-ID: <026b1c6d-c258-fa88-ed08-d1b5784c95b0@suse.de>
Subject: Re: [PATCH v5 0/7] Fix some races between sysfb device registration
 and drivers probe
References: <20220511112438.1251024-1-javierm@redhat.com>
 <f726c96b-1924-841f-0125-9f7ed37de20a@suse.de>
 <cc0d6635-c739-490d-9c8d-7f53da48e61a@redhat.com>
In-Reply-To: <cc0d6635-c739-490d-9c8d-7f53da48e61a@redhat.com>

--------------RZpES3ql0GSOSsXG7T1LU8ih
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDEzLjA1LjIyIHVtIDEzOjEwIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KLi4uDQo+PiBXZSBhbHJlYWR5IHRyYWNrIHRoZSBtZW1vcnkgcmFu
Z2VzIGluIGRybSBhcGVydHVyZSBoZWxwZXJzLiBXZSdkIG5lZWQgdG8NCj4+IG1vdmUgdGhl
IGNvZGUgdG8gYSBtb3JlIHByb21pbmVudCBsb2NhdGlvbiAoZS5nLiwgPGxpbnV4L2FwZXJ0
dXJlLmg+KQ0KPj4gYW5kIGNoYW5nZSBmYmRldiB0byB1c2UgaXQuIFN5c2ZiIGFuZCBEVCBj
b2RlIG5lZWRzIHRvIGluc2VydCBwbGF0Zm9ybQ0KPj4gZGV2aWNlcyB1cG9uIGNyZWF0aW9u
LiBXZSBjYW4gdGhlbiBpbXBsZW1lbnQgdGhlIG1vcmUgZmFuY3kgc3R1ZmYsIHN1Y2gNCj4+
IGFzIHRyYWNraW5nIG5hdGl2ZS1kZXZpY2UgbWVtb3J5LiAgKEFuZCBpZiB3ZSBldmVyIGdl
dCB0byBmaXggYWxsIHVzYWdlDQo+PiBvZiBMaW51eCcgcmVxdWVzdC1tZW0tcmVnaW9uLCB3
ZSBjYW4gZXZlbiBtb3ZlIGFsbCB0aGUgZnVuY3Rpb25hbGl0eSB0aGVyZSkuDQo+Pg0KPiAN
Cj4gQWdyZWVkLiBBbmQgYXMgbWVudGlvbmVkLCB0aGUgcmFjZSB0aGF0IHRoZXNlIHBhdGNo
ZXMgYXR0ZW1wdCB0byBmaXggYXJlIGZvcg0KPiB0aGUgbGVzcyBjb21tb24gY2FzZSB3aGVu
IGEgbmF0aXZlIGRyaXZlciBwcm9iZXMgYnV0IGVpdGhlciBubyBnZW5lcmljIGRyaXZlcg0K
PiByZWdpc3RlcmVkIGEgZnJhbWVidWZmZXIgeWV0IG9yIHRoZSBwbGF0Zm9ybSBkZXZpY2Ug
d2Fzbid0IHJlZ2lzdGVyZWQgeWV0Lg0KPiANCj4gQnV0IHRoaXMgY2FuIG9ubHkgaGFwcGVu
IGlmIGZvciBleGFtcGxlIGEgbmF0aXZlIGRyaXZlciBpcyBidWlsdC1pbiBidXQgdGhlDQo+
IGdlbmVyaWMgZHJpdmVyIGlzIGJ1aWxkIGFzIGEgbW9kdWxlLCB3aGljaCBpcyBub3QgdGhl
IGNvbW1vbiBjb25maWd1cmF0aW9uLg0KPiANCj4gV2hhdCBtb3N0IGRpc3Ryb3MgZG8gaXMg
dGhlIG9wcG9zaXRlLCB0byBoYXZlIHtzaW1wbGUsb2YsZWZpLHZlc2F9ZmIgb3INCj4gc2lt
cGxlZHJtIGJ1aWx0LWluIGFuZCB0aGUgbmF0aXZlIGRyaXZlcnMgYnVpbHQgYXMgbW9kdWxl
cy4NCj4gDQo+IFNvIHRoZXJlJ3Mgbm8gcnVzaCB0byBmaXggdGhpcyBieSBwaWxpbmcgbW9y
ZSBoYWNrcyBvbiB0b3Agb2YgdGhlIG9uZXMgd2UNCj4gYWxyZWFkeSBoYXZlIGFuZCBpbnN0
ZWFkIHRyeSB0byBmaXggaXQgbW9yZSBwcm9wZXJseSBhcyB5b3Ugc3VnZ2VzdGVkLg0KPiAg
IA0KDQpBIGZpcnN0IHN0ZXAgd291bGQgYmUgdG8gdXNlIERSTSdzIGFwZXJ0dXJlIGhlbHBl
cnMgaW4gZmJkZXYuIFRoYXQgd291bGQgDQpiZSBhIGdvb2QgaWRlYSBhbnl3YXksIGFzIGl0
IHdvdWxkIHNpbXBsaWZ5IGJvdGguIFlvdSBhbHJlYWR5IG1lbnRpb25lZCANCnNvbWUgQVBJ
IGNoYW5nZXMgdG8gbWFrZSBhcGVydHVyZSBoZWxwZXJzIERSTS1pbmRlcGVuZGVudC4NCg0K
VGhlIGFmZmVjdGVkIGZiZGV2IGRyaXZlcnMgdXNlIHBsYXRmb3JtIGRldmljZXMsIHNvIHRo
aXMgc2hvdWxkIGJlIGVhc3kuDQoNCkFwZXJ0dXJlIGhlbHBlcnMgaGF2ZSBzb21ldGhpbmcg
bGlrZSB0aGUgcmVnaXN0cmF0aW9uX2xvY2suIFsxXSBJIGRvbid0IA0Ka25vdyBpZiB3ZSBu
ZWVkIHRvIHJlY3JlYXRlIHBhdGNoIDMgZm9yIHRoaXMgYXMgd2VsbC4NCg0KSWYgd2UgYWJz
b2x1dGVseSBuZWVkIHNvbWUgc3BlY2lhbCBkZXRhY2htZW50IGhhbmRsaW5nIGZvciBmYmRl
diwgd2UgY2FuIA0KbWFrZSBkZXZtX2FwZXJ0dXJlX2FxdWlyZSgpIGEgcHVibGljIGludGVy
ZmFjZS4gVGhlIGRldGFjaCBoZWxwZXIgaXMgDQpwcm92aWRlZCBieSB0aGUgY2FsbGVyLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y1LjE3LjYvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXBlcnR1
cmUuYyNMMjU0DQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4x
Ny42L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2FwZXJ0dXJlLmMjTDE1OQ0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------RZpES3ql0GSOSsXG7T1LU8ih--

--------------740qThg0O9gjX6BQllYOYoVE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ+QegFAwAAAAAACgkQlh/E3EQov+A2
sQ/8D7aYwDIgk8L3+1bF/YeMSNhqsgkRqp2BLg+P6/S1AVKfDJVfmx0u3sofTWUL4A1IZgQrhY9G
A8TeLgAete6GUD3w0Zx7cRNGwznM6lTLkUrIumH53UcEnbSCdMtC301wA3RnKbLOw0Q7EGn6CpMo
lZw/ufb0z9VR7RjRCa+dcWKt8kVyUr0ijdLC0Xhvv1PWe5IHklz/+HAyOV7ms1NKsVWu5mWuD0Te
MTjlbq2WzQeiL+XL3j1ZizUzkm8Cnb3yxk4NDqm1Z9BfuUpVk7TppZpj6AyhZNkarRXQB2T+fIbD
f54mH5Z7gcb4B8kzNgrGPmlsQJbiHgkwZnSgcKmnDaDRx8VEoMLPSc+aeBUbeD/cH84MRl6HPCK/
f7U8DGqbipB8XfaZWyko7S2cW21ZevZjXETQrME2nmw7LzvUz2RnYuQaOAbvX20QZ8PKgrcTNUli
bW9ocCXXTBExjFojM+Mn3Xnnlmrb/t7soiQ4lW2wcf7qiYkCx39CeJ14zz3BHA2PKeFB2Zbo43/N
4L7BF+xCwQFAk6aWJ6bBIhh3SLO16tr0Q7CmFxaxRsEQmo6lQr9puQ6JYuQ57ylxufWJ5HTyzXsQ
xgMnM8X6qU29lb9qtuug6os2MxNsfMKwolYMISIzWkaDhjl7W+AdEkQ8kxxSySCgH2GU29X7vN3Q
ov0=
=0rOq
-----END PGP SIGNATURE-----

--------------740qThg0O9gjX6BQllYOYoVE--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033E5087FA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B304A10E5FF;
	Wed, 20 Apr 2022 12:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9C510E5FF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:21:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28A40210F4;
 Wed, 20 Apr 2022 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650457300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wm05q0mKUewBO1Mqwwd1XxcUsCNwhGiEnBk12DLNoaU=;
 b=OVqNhNcgScNJjXxVPh9PaZPvZTlDpH66DOKD1RDuOxtVumvEyolevk+bICgogXibmCARak
 zidET45zOfMLgWzKy9KcDjRpPY8CUQHq8XnKt2DEkufYLUoQ170RgLYmKsJURfE1tu7+9Q
 W5TUPUF6xNXv64qwqOyJDqbBjh1dUVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650457300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wm05q0mKUewBO1Mqwwd1XxcUsCNwhGiEnBk12DLNoaU=;
 b=iM5eVsbReIXL5ft5xhLKakvC1WNzHN7ekUvOWBCCMn4cnmgGWQ4iGDi0v3zGR4FykAVIUP
 nbn4PT9Wb0Tmj6Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0FC013A30;
 Wed, 20 Apr 2022 12:21:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0s6dOdP6X2JSYQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Apr 2022 12:21:39 +0000
Message-ID: <3e380d00-f3b3-8c24-e0d8-cb1935278aa4@suse.de>
Date: Wed, 20 Apr 2022 14:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 7/8] drm/display: Move HDMI helpers into display-helper
 module
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220420110900.8707-1-tzimmermann@suse.de>
 <20220420110900.8707-8-tzimmermann@suse.de>
 <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lHclsNCkBZC0E5b0zp29Eehv"
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
--------------lHclsNCkBZC0E5b0zp29Eehv
Content-Type: multipart/mixed; boundary="------------OgBDBybaQSwQFGeN8i3FwxGc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <3e380d00-f3b3-8c24-e0d8-cb1935278aa4@suse.de>
Subject: Re: [PATCH v2 7/8] drm/display: Move HDMI helpers into display-helper
 module
References: <20220420110900.8707-1-tzimmermann@suse.de>
 <20220420110900.8707-8-tzimmermann@suse.de>
 <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>
In-Reply-To: <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>

--------------OgBDBybaQSwQFGeN8i3FwxGc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjIgdW0gMTQ6MDIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDQvMjAvMjIgMTM6MDgsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPiANCj4gW3NuaXBdDQo+IA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9LY29uZmlnDQo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL0tjb25maWcNCj4+IEBAIC0xLDYgKzEsOCBAQA0KPj4g
ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4+ICAgY29uZmln
IERSTV9EV19IRE1JDQo+PiAgIAl0cmlzdGF0ZQ0KPj4gKwlzZWxlY3QgRFJNX0RJU1BMQVlf
SERNSV9IRUxQRVINCj4+ICsJc2VsZWN0IERSTV9ESVNQTEFZX0hFTFBFUg0KPj4gICAJc2Vs
ZWN0IERSTV9LTVNfSEVMUEVSDQo+PiAgIAlzZWxlY3QgUkVHTUFQX01NSU8NCj4+ICAgCXNl
bGVjdCBDRUNfQ09SRSBpZiBDRUNfTk9USUZJRVINCj4gDQo+IFtzbmlwXQ0KPiANCj4+ICtj
b25maWcgRFJNX0RJU1BMQVlfSERNSV9IRUxQRVINCj4+ICsJYm9vbA0KPj4gKwlzZWxlY3Qg
RFJNX0RJU1BMQVlfSEVMUEVSDQo+PiArCWhlbHANCj4+ICsJICBEUk0gZGlzcGxheSBoZWxw
ZXJzIGZvciBIRE1JLg0KPj4gKw0KPiANCj4gTWF5YmUgeW91IG1lbnRpb25lZCBhbHJlYWR5
IHdoZW4gd2UgZGlzY3Vzc2VkIGl0IGluIHYxLCBidXQgY291bGQNCj4geW91IHBsZWFzZSBy
ZW1lbWJlciBtZSB3aHkgd2UgbmVlZCB0byBzZWxlY3QgYm90aCBzeW1ib2xzIGZvciB0aGUN
Cj4gZHJpdmVycywgZXZlbiB3aGVuIERSTV9ESVNQTEFZX0hFTFBFUiBpcyBhbHJlYWR5IHNl
bGVjdGVkIGhlcmUgPw0KPiANCj4gT3IgYXJlIHNlbGVjdCBvcGVyYXRpb25zIG5vdCB0cmFu
c2l0aXZlID8NCg0KRFJNX0RJU1BMQVlfSEVMUEVSIGVuYWJsZXMgdGhlIG1vZHVsZSBpdHNl
bGYuIEl0J3MgdHJpc3RhdGUuIA0KRFJNX0RJU1BMQVlfSERNSV9IRUxQRVIsIERSTV9ESVNQ
TEFZX0RQX0hFTFBFUiwgZXRjIGFyZSB0aGUgaW5kaXZpZHVhbCANCmZlYXR1cmVzIG9mIHRo
ZSBoZWxwZXIgbW9kdWxlLiBFYWNoIGlzIGEgYm9vbGVhbi4gIERyaXZlcnMgY2FuIGVuYWJs
ZSANCnRoZW0gYWNjb3JkaW5nIHRvIHRoZWlyIG5lZWRzLiAgVGhpcyBzcGxpdCBhbGxvd3Mg
bGlua2luZyBjb3JyZWN0bHkgaW4gDQphbGwgY2FzZXMsIGV2ZW4gaWYgc29tZSBkcml2ZXJz
IGFyZSBidWlsdC1pbiBhbmQgb3RoZXJzIGFyZSBtb2R1bGVzLiANClRoaXMgZGlkbid0IGFs
d2F5cyB3b3JrIHdpdGggdGhlIG9yaWdpbmFsIHBhdGNoZXMuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------OgBDBybaQSwQFGeN8i3FwxGc--

--------------lHclsNCkBZC0E5b0zp29Eehv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJf+tMFAwAAAAAACgkQlh/E3EQov+Al
8A/+PD0GOvQu/KIO8TjKaTGSYu1aicoPXpPZldhZCui+CgZHBzElSQ9TWZe/9sqsroHtwE1h9K8Y
XVgU06HX8yNoh3wJcabhR+gTfn31J82yaFsPgp5H35+BlIeeQlGVBBqwQg84LduxjlwrhrGLq5ww
BcB0E7FFsSGNfE2N1yChTeD8ubCS3rK7bVTxLceNsxxC5VyKc9R2sYT2TsR1OVgmwUQH40e32yyx
GBfLa/txiIZrrSQOldlwYHNuB027HPry/HDDcyGPk1hp3le9wWW7H7LTBrWPd3PQGPdB9EGcETQy
3Yymj55ZVc8w3ClEzz/M4l3PPCCAQO0lpuqZQSOvST1IdNzxsFZE6PcbJDRX8siSURsLGzxE45rP
NNRzh0irMe94FZc/hdZFrddUWHn9QRv6sDLdDMfqiGGhjOty5liXN+9DsvfnPkO/3tWR83m3N9Ef
v35Ag9v0FDxw1Eg2Im9RPrTVbcHRKyoVNfyUn1sCdQXgl5YCzQAc5/2s1ls6yrtZKMpOBxZN3xrv
AXtbOt3/oefoutqFf5WFjc4c3Q9q9QNhL76vH7q9iWVvekqnCiFY0EuQf6D7ZpdSnCWnwLwHBKrJ
LZYVr9oHYGpjVtq7vleJCmz/Ljkcp6SwAygkDCGxMzueBsOlILXL0VhVkGwLbrdNhWayHn7sAqeq
HaI=
=niq5
-----END PGP SIGNATURE-----

--------------lHclsNCkBZC0E5b0zp29Eehv--

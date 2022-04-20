Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117E5088FA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B5F10EAA8;
	Wed, 20 Apr 2022 13:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7924D10EAA8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:12:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CAFC210FC;
 Wed, 20 Apr 2022 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650460366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnEBkyV5aI24J7nBgMECW4yIJ0TtaBs7OzqMQNIl17Q=;
 b=zNxScNJXMJWqiLZyCt3NSGJkUqilA77rNT7VA8R3R4wafXjrFMC8oOzml0+uASnfnLEc3b
 iphGXw0pw6xhIhvrQyY9QU9X0uJwi6bzvWwsgEVTiMqxu3bLdvoeJhlk5DMGMYqLOTKhUi
 nQVJQfTHRhdmBb8WpO6JEMOFkE+E60E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650460366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnEBkyV5aI24J7nBgMECW4yIJ0TtaBs7OzqMQNIl17Q=;
 b=6DlpSg9dtRbtySBFcko07mjsoooEupPBdUKqClFmPQpuVV9CT15GKbh70w1w09VoG98kVj
 hWe45nGGm8mr7gDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4F9513AD5;
 Wed, 20 Apr 2022 13:12:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GbQBN80GYGLPeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Apr 2022 13:12:45 +0000
Message-ID: <e0b7e721-9798-b9e6-d5f4-7fd0164a4e8f@suse.de>
Date: Wed, 20 Apr 2022 15:12:45 +0200
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
 <3e380d00-f3b3-8c24-e0d8-cb1935278aa4@suse.de>
 <958ddd41-06eb-40b4-a88b-1ac712345fbf@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <958ddd41-06eb-40b4-a88b-1ac712345fbf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9Z87IEP5FWvztfcPNKQjb02L"
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
--------------9Z87IEP5FWvztfcPNKQjb02L
Content-Type: multipart/mixed; boundary="------------0ZNucB70EghU3etL3EMb8uCE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <e0b7e721-9798-b9e6-d5f4-7fd0164a4e8f@suse.de>
Subject: Re: [PATCH v2 7/8] drm/display: Move HDMI helpers into display-helper
 module
References: <20220420110900.8707-1-tzimmermann@suse.de>
 <20220420110900.8707-8-tzimmermann@suse.de>
 <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>
 <3e380d00-f3b3-8c24-e0d8-cb1935278aa4@suse.de>
 <958ddd41-06eb-40b4-a88b-1ac712345fbf@redhat.com>
In-Reply-To: <958ddd41-06eb-40b4-a88b-1ac712345fbf@redhat.com>

--------------0ZNucB70EghU3etL3EMb8uCE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjIgdW0gMTQ6MjYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDQvMjAvMjIgMTQ6MjEsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gSGkNCj4+DQo+PiBBbSAyMC4wNC4yMiB1bSAxNDowMiBzY2hyaWViIEphdmllciBNYXJ0
aW5leiBDYW5pbGxhczoNCj4+PiBIZWxsbyBUaG9tYXMsDQo+Pj4NCj4+PiBPbiA0LzIwLzIy
IDEzOjA4LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pg0KPj4+IFtzbmlwXQ0KPj4+
DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvS2NvbmZpZw0K
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL0tjb25maWcNCj4+
Pj4gQEAgLTEsNiArMSw4IEBADQo+Pj4+ICAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQ0KPj4+PiAgICBjb25maWcgRFJNX0RXX0hETUkNCj4+Pj4gICAgCXRy
aXN0YXRlDQo+Pj4+ICsJc2VsZWN0IERSTV9ESVNQTEFZX0hETUlfSEVMUEVSDQo+Pj4+ICsJ
c2VsZWN0IERSTV9ESVNQTEFZX0hFTFBFUg0KPj4+PiAgICAJc2VsZWN0IERSTV9LTVNfSEVM
UEVSDQo+Pj4+ICAgIAlzZWxlY3QgUkVHTUFQX01NSU8NCj4+Pj4gICAgCXNlbGVjdCBDRUNf
Q09SRSBpZiBDRUNfTk9USUZJRVINCj4+Pg0KPj4+IFtzbmlwXQ0KPj4+DQo+Pj4+ICtjb25m
aWcgRFJNX0RJU1BMQVlfSERNSV9IRUxQRVINCj4+Pj4gKwlib29sDQo+Pj4+ICsJc2VsZWN0
IERSTV9ESVNQTEFZX0hFTFBFUg0KPj4+PiArCWhlbHANCj4+Pj4gKwkgIERSTSBkaXNwbGF5
IGhlbHBlcnMgZm9yIEhETUkuDQo+Pj4+ICsNCj4+Pg0KPj4+IE1heWJlIHlvdSBtZW50aW9u
ZWQgYWxyZWFkeSB3aGVuIHdlIGRpc2N1c3NlZCBpdCBpbiB2MSwgYnV0IGNvdWxkDQo+Pj4g
eW91IHBsZWFzZSByZW1lbWJlciBtZSB3aHkgd2UgbmVlZCB0byBzZWxlY3QgYm90aCBzeW1i
b2xzIGZvciB0aGUNCj4+PiBkcml2ZXJzLCBldmVuIHdoZW4gRFJNX0RJU1BMQVlfSEVMUEVS
IGlzIGFscmVhZHkgc2VsZWN0ZWQgaGVyZSA/DQo+Pj4NCj4+PiBPciBhcmUgc2VsZWN0IG9w
ZXJhdGlvbnMgbm90IHRyYW5zaXRpdmUgPw0KPj4NCj4+IERSTV9ESVNQTEFZX0hFTFBFUiBl
bmFibGVzIHRoZSBtb2R1bGUgaXRzZWxmLiBJdCdzIHRyaXN0YXRlLg0KPj4gRFJNX0RJU1BM
QVlfSERNSV9IRUxQRVIsIERSTV9ESVNQTEFZX0RQX0hFTFBFUiwgZXRjIGFyZSB0aGUgaW5k
aXZpZHVhbA0KPj4gZmVhdHVyZXMgb2YgdGhlIGhlbHBlciBtb2R1bGUuIEVhY2ggaXMgYSBi
b29sZWFuLiAgRHJpdmVycyBjYW4gZW5hYmxlDQo+PiB0aGVtIGFjY29yZGluZyB0byB0aGVp
ciBuZWVkcy4gIFRoaXMgc3BsaXQgYWxsb3dzIGxpbmtpbmcgY29ycmVjdGx5IGluDQo+PiBh
bGwgY2FzZXMsIGV2ZW4gaWYgc29tZSBkcml2ZXJzIGFyZSBidWlsdC1pbiBhbmQgb3RoZXJz
IGFyZSBtb2R1bGVzLg0KPj4gVGhpcyBkaWRuJ3QgYWx3YXlzIHdvcmsgd2l0aCB0aGUgb3Jp
Z2luYWwgcGF0Y2hlcy4NCj4+DQo+IFJpZ2h0LCBidXQgdGhhdCB3YXNuJ3QgbXkgcXVlc3Rp
b24uIEkgd29uZGVyZWQgd2h5IGZvciBleGFtcGxlIERSTV9EV19IRE1JDQo+IEtjb25maWcg
bmVlZHMgdG8gc2VsZWN0IGJvdGggRFJNX0RJU1BMQVlfSERNSV9IRUxQRVIgYW5kIERSTV9E
SVNQTEFZX0hFTFBFUg0KPiBzaW5jZSBEUk1fRElTUExBWV9IRE1JX0hFTFBFUiBhbHJlYWR5
IHNlbGVjdHMgRFJNX0RJU1BMQVlfSEVMUEVSLg0KPiANCg0KT2gsIHdlbGwuIFlvdSBmb3Vu
ZCBhIGJ1Zy4gSXQgc2hvdWxkIGJlICdkZXBlbmRzIG9uJyBpbnN0ZWFkIG9mICdzZWxlY3Qn
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------0ZNucB70EghU3etL3EMb8uCE--

--------------9Z87IEP5FWvztfcPNKQjb02L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJgBs0FAwAAAAAACgkQlh/E3EQov+BL
TQ/+KOUcFtvX7WFARIjrerdH9kBuJvbSfrtrlImKy5hKJje+XdI9ojTQmEv3NRlKvSjCYkdaCy/i
nasZQT725YD9WEJIWC2N4yNkxmHRluTjo/M1P5DfpU88sdX/19sa4DuDyyKJoR/vs3wZ/UtSiBuy
dYEgOPbseJqLgXYpZ1ckKsppTqEuQZvahphkdJaZab+K3w132k4WIXGw4wJT7GzgW9UdWyrHSx1t
XJ3YT0Gw23QbL4r3B45cyY8GAZZMLnVkMb4JMV5LceRD7Im/vfLqREyBO4niZ/V71cm2wbXVsefP
D8oYtOAvRmz9UK0eiz8ubxnKxYuG3KEK3j2O/DMfsKNf1R4Yb4YdWghlTSjO3R1mMfcqtpp9lng7
xhDvsY4IQatyKcNLB80HaTkHVH8vStOcc+fM24HTsBQrOa6V46EewQAv2VUKzVUPm22lMWqKNSDA
zZ+f7BQifSmvvShk1rXmOH0mmJvBa3tinsYWU9fa8qUAztgIAltj4HpGhnIgvj68u5mqpE0ECV+4
xnJoTOUJZUkJvCyzTHdekGVlP5uZsyy3IpZKBa1OggBFe90LCWeK4tw1k9WQt3oTnSc5fYYjxzf/
ZfIes+9+G0b1+VliTQpNPiXUoqwHlFrfhmwSoLhFSwYbWI8tXUs5uADFEjg/d3y7i5dJ9nxNcjeu
SQA=
=BPh+
-----END PGP SIGNATURE-----

--------------9Z87IEP5FWvztfcPNKQjb02L--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEDE6C0DA9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 10:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2051910E2BE;
	Mon, 20 Mar 2023 09:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A085210E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:46:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 615371F45F;
 Mon, 20 Mar 2023 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679305618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ryJN6nyMsBI4dTDnpcnuwnm2LidX60A3gO/ACot2SjQ=;
 b=k63Xc4Hx9xOYVz5gvZvRBqRnJv63FVvqaiW30YjFOr4XjNS8ic7bPGlqopdPKFVZN1lVZ6
 v22yWFcSIOFypEAWV1gzyizUf9W+KkEe4mAW4J/5YxIwmIOTIPN00eZOpoLeYpDkkdGfut
 JX1z9oghFP9u1CN3qKCMv0MqS1CIk7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679305618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ryJN6nyMsBI4dTDnpcnuwnm2LidX60A3gO/ACot2SjQ=;
 b=qBjzm9ZRdsqPTtcsIZA8eyakwXRTxC3q3upW9s0YeWgC62Bb/+OtEacEvNkPiSCLbCVLEu
 NbxylEMfiWA7QwBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A11A13A00;
 Mon, 20 Mar 2023 09:46:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CUgdL5ErGGTtegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 09:46:57 +0000
Message-ID: <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
Date: Mon, 20 Mar 2023 10:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
To: =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xnpeKByV8t1F9ODVmz7UUn99"
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 maxime@cerno.tech, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xnpeKByV8t1F9ODVmz7UUn99
Content-Type: multipart/mixed; boundary="------------9G0JSQJfuGFGMVTgqrADj50t";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>
Cc: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Zack Rusin <zackr@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
In-Reply-To: <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>

--------------9G0JSQJfuGFGMVTgqrADj50t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDMuMjMgdW0gMDI6NDcgc2NocmllYiBTYW11ZWwgxIxhdm9qOg0KPiBI
aSwNCj4gDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9hcGVydHVyZS5jIGIvZHJp
dmVycy92aWRlby9hcGVydHVyZS5jDQo+PiBpbmRleCBmNDJhMGQ4YmMyMTEuLjEwMWUxM2My
Y2Y0MSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYXBlcnR1cmUuYw0KPj4gKysr
IGIvZHJpdmVycy92aWRlby9hcGVydHVyZS5jDQo+PiBAQCAtOCw2ICs4LDcgQEANCj4+IMKg
I2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPj4gwqAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+DQo+PiDCoCNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+PiArI2luY2x1ZGUg
PGxpbnV4L3N5c2ZiLmg+DQo+PiDCoCNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPj4gwqAj
aW5jbHVkZSA8bGludXgvdmdhYXJiLmg+DQo+Pg0KPj4gQEAgLTI4Niw3ICsyODcsMjAgQEAg
aW50IA0KPj4gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMocmVzb3VyY2Vf
c2l6ZV90IGJhc2UsIA0KPj4gcmVzb3VyY2Vfc2l6ZV90IHNpDQo+PiDCoCNpZiBJU19SRUFD
SEFCTEUoQ09ORklHX0ZCKQ0KPj4gwqDCoMKgwqAgc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3Qg
KmE7DQo+PiDCoMKgwqDCoCBpbnQgcmV0Ow0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gK8KgwqDC
oCAvKg0KPj4gK8KgwqDCoMKgICogSWYgYSBkcml2ZXIgYXNrZWQgdG8gdW5yZWdpc3RlciBh
IHBsYXRmb3JtIGRldmljZSByZWdpc3RlcmVkIGJ5DQo+PiArwqDCoMKgwqAgKiBzeXNmYiwg
dGhlbiBjYW4gYmUgYXNzdW1lZCB0aGF0IHRoaXMgaXMgYSBkcml2ZXIgZm9yIGEgZGlzcGxh
eQ0KPj4gK8KgwqDCoMKgICogdGhhdCBpcyBzZXQgdXAgYnkgdGhlIHN5c3RlbSBmaXJtd2Fy
ZSBhbmQgaGFzIGEgZ2VuZXJpYyBkcml2ZXIuDQo+PiArwqDCoMKgwqAgKg0KPj4gK8KgwqDC
oMKgICogRHJpdmVycyBmb3IgZGV2aWNlcyB0aGF0IGRvbid0IGhhdmUgYSBnZW5lcmljIGRy
aXZlciB3aWxsIG5ldmVyDQo+PiArwqDCoMKgwqAgKiBhc2sgZm9yIHRoaXMsIHNvIGxldCdz
IGFzc3VtZSB0aGF0IGEgcmVhbCBkcml2ZXIgZm9yIHRoZSBkaXNwbGF5DQo+PiArwqDCoMKg
wqAgKiB3YXMgYWxyZWFkeSBwcm9iZWQgYW5kIHByZXZlbnQgc3lzZmIgdG8gcmVnaXN0ZXIg
ZGV2aWNlcyBsYXRlci4NCj4+ICvCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoCBzeXNmYl9kaXNh
YmxlKCk7DQo+IA0KPiBUaGlzIGNhbGwgdG8gc3lzZmJfZGlzYWJsZSgpIGhhcyBiZWVuIGNh
dXNpbmcgdHJvdWJsZSB3aXRoIHJlZ2FyZCB0bw0KPiBWRklPLiBWRklPIGhhcyBiZWVuIGNh
bGxpbmcgYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzIHRvDQo+IGdl
dCByaWQgb2YgYW55IGNvbnNvbGUgZHJpdmVycyAoZDE3Mzc4MDYyMDc5MmMpIHVzaW5nIHRo
ZSBkZXZpY2UgaW4NCj4gcXVlc3Rpb24sIGJ1dCBub3cgZXZlbiB1bnJlbGF0ZWQgZHJpdmVy
cyBhcmUgZ2V0dGluZyBraWxsZWQuIEV4YW1wbGUNCj4gc2l0dWF0aW9uOg0KDQpXaGljaCBk
cml2ZXJzIGRvIHlvdSB1c2U/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE1h
Y2hpbmUgaGFzIHR3byBHUFVzIGFuZCB1c2VzIGVmaWZiIGZvciB0aGUgY29uc29sZS4gRWZp
ZmIgcmVnaXN0ZXJzDQo+IHdpdGggdGhlIGFwZXJ0dXJlIHN5c3RlbSB0aGUgZWZpIGZyYW1l
YnVmZmVyIHJlZ2lvbiwgd2hpY2ggaXMgY292ZXJlZA0KPiBieSBhIEJBUiByZXNvdXJjZSBv
ZiBHUFUgMS4gVkZJTyBncmFicyBHUFUgMiBhbmQgY2FsbHMNCj4gYXBlcnR1cmVfcmVtb3Zl
X2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzKEdQVSAyKS4gR1BVIDIgaGFzIG5vIG92ZXJsYXAN
Cj4gd2l0aCB0aGUgZWZpZmIgb24gR1BVMSBidXQgdGhlIGVmaWZiIGlzIGtpbGxlZCByZWdh
cmRsZXNzIGR1ZSB0bw0KPiB0aGUgdW5jb25kaXRpb25hbCBjYWxsIHRvIHN5c2ZiX2Rpc2Fi
bGUoKS4gVGhlIGNvbnNvbGUgc3dpdGNoZXMNCj4gdG8gZHVtbXkgYW5kIGxvY2tzIHVwIGZy
b20gdGhlIHVzZXIgcGVyc3BlY3RpdmUuDQo+IFRoaXMgc2VlbXMgdW5uZWNlc3NhcnksIGFz
IHRoZSBkZXZpY2UgaXMgdW5yZWxhdGVkLg0KPiANCj4gSSBkbyBub3QgcXVpdGUgdW5kZXJz
dGFuZCB0aGUgY29tbWVudCBqdXN0aWZ5aW5nIHRoZSBjYWxsLg0KPiANCj4gU29tZSBkaXNj
dXNzaW9ucyB3aXRoIHdvcmthcm91bmRzOg0KPiBodHRwczovL29sZC5yZWRkaXQuY29tL3Iv
VkZJTy9jb21tZW50cy8xMXFlaTR0L2ZyYW1lYnVmZmVyX2RvZXNudF93b3JrX2FueW1vcmVf
YWZ0ZXJfcGFzc3Rocm91Z2gvDQo+IGh0dHBzOi8vYmJzLmFyY2hsaW51eC5vcmcvdmlld3Rv
cGljLnBocD9pZD0yODA1MTINCj4gDQo+IA0KPiBUaGFua3MsDQo+IFNhbXVlbA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------9G0JSQJfuGFGMVTgqrADj50t--

--------------xnpeKByV8t1F9ODVmz7UUn99
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQYK5AFAwAAAAAACgkQlh/E3EQov+Dv
qBAA0BnqOu5qzZgy3VMJzoT18J6zhO54Lv9mrJExurzfsW14ZlSJFnBTz3uDs51CGvnuiAdoPfwY
VTtvLkII3LguqIlXEZ9eiCEGHzrvO5lKKlnnG0B5KYH3Z+AQK+I5Yf0X2fUPzNugwEHj5rBa1uH0
CuJShCC/HJ6gvET11NjqvykHZuSgSqCtewk3rwims3xHeHjFgMIqNIKSQnuNNBrCg0RW1LzHosan
SHCqSjf1GwYOO0sQYgsarBnxZy7Yd19tXQ28oteBh3TNCayr4fSYF/5jg9IqU8203uap4KMi29oz
vPRnydDTr3p+7knjeEHg7FSAyCMBFNyveAD7fGXihdWknJBE54iy07JXOMVEAuV3vJgh9jc3RbxC
6SxIsNHgp3zTUsmsvR+kCLQln/QHMq7mNLdsBKRV0IcNnNadHs3EBwtO5mjotJA25dJODDeXpr4j
rJTc/SP1CUq57JgJUJh5YbuU+Ay+Csz9o5jgNUJVCL/IXBreCgd/MjKD+ou/hA8Y97EKHzXhc8So
Fn2qS5LrvbeI5qZeFVAeQIHG3rij5zGG8Yec+6PHQsIYCcZxNixGOzmLwqQcdVHvbp7e4/mFvQ4B
tbljPK5OBHPR8QgnAL4yEyzTljb5fjmoHfRg08ztdqIvf8BtWPKq7NlEDgZ1wxa9Iwt09LMTqy1c
lBM=
=FLCc
-----END PGP SIGNATURE-----

--------------xnpeKByV8t1F9ODVmz7UUn99--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F060E040
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 14:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E38F10E4C6;
	Wed, 26 Oct 2022 12:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEBD10E4B1;
 Wed, 26 Oct 2022 12:06:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEA5221FCD;
 Wed, 26 Oct 2022 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666786013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3rjfVpVR/QLmhBP670BJ0cZ8//A6eQCyWRJB5EgZ5jY=;
 b=UyqfENs4ss3QO6o3dYP07YZ8izFMUXM1FDIlSyn3+zUTbSKIartQi/iAzTtu4Rwjbbs72R
 z/NCxELwJ2U1QNY/wLY2Nr3yjEf4NSwK61WbtpTVbn/02dQWpyxihtVnaeaBCTWkLyvKsG
 8MZeS8wCfyXjNJ2Dzljj0sldHsDD60A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666786013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3rjfVpVR/QLmhBP670BJ0cZ8//A6eQCyWRJB5EgZ5jY=;
 b=wCiS1FzG9fCFFNCZPIIptGEUxu9W+J60G9OU7n7X07yTc1gjsYNJNMem3PEcIp0ObjIgG8
 EqqB3JbFrhe6WeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E83213A6E;
 Wed, 26 Oct 2022 12:06:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ps+AId0iWWOINgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Oct 2022 12:06:53 +0000
Message-ID: <630fde93-a95d-3b05-30eb-6e0a1a38895e@suse.de>
Date: Wed, 26 Oct 2022 14:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 3/7] drm/ivpu: Add GEM buffer object management
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 "thellstrom@vmware.com" <thellstrom@vmware.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-4-jacek.lawrynowicz@linux.intel.com>
 <c2ca1915-a4e7-d72f-c753-a6a63180f560@suse.de>
 <9a7d0dc3-67ce-e947-81c0-78c7ae40ded1@linux.intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9a7d0dc3-67ce-e947-81c0-78c7ae40ded1@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wTWo4UjNE7CQMMd2ucl80fWz"
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
Cc: andrzej.kacprowski@linux.intel.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wTWo4UjNE7CQMMd2ucl80fWz
Content-Type: multipart/mixed; boundary="------------iY1QqESEkp8SnexbGNVIvYri";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 "thellstrom@vmware.com" <thellstrom@vmware.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Message-ID: <630fde93-a95d-3b05-30eb-6e0a1a38895e@suse.de>
Subject: Re: [PATCH v3 3/7] drm/ivpu: Add GEM buffer object management
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-4-jacek.lawrynowicz@linux.intel.com>
 <c2ca1915-a4e7-d72f-c753-a6a63180f560@suse.de>
 <9a7d0dc3-67ce-e947-81c0-78c7ae40ded1@linux.intel.com>
In-Reply-To: <9a7d0dc3-67ce-e947-81c0-78c7ae40ded1@linux.intel.com>

--------------iY1QqESEkp8SnexbGNVIvYri
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjOiBUaG9tYXMsIENocmlzdGlhbiwgaW50ZWwtZ2Z4KQ0KSGkNCg0KQW0gMjYuMTAuMjIg
dW0gMTM6MjYgc2NocmllYiBKYWNlayBMYXdyeW5vd2ljejoNCj4gSGksDQo+IA0KPiBPbiAx
MC8yNS8yMDIyIDI6NDEgUE0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+
DQo+PiBBbSAyNC4wOS4yMiB1bSAxNzoxMSBzY2hyaWViIEphY2VrIExhd3J5bm93aWN6Og0K
Pj4+IEFkZHMgZm91ciB0eXBlcyBvZiBHRU0tYmFzZWQgQk9zIGZvciB0aGUgVlBVOg0KPj4+
ICDCoMKgIC0gc2htZW0NCj4+PiAgwqDCoCAtIHVzZXJwdHINCj4+PiAgwqDCoCAtIGludGVy
bmFsDQo+Pj4gIMKgwqAgLSBwcmltZQ0KPj4+DQo+Pj4gQWxsIHR5cGVzIGFyZSBpbXBsZW1l
bnRlZCBhcyBzdHJ1Y3QgaXZwdV9ibywgYmFzZWQgb24NCj4+PiBzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QuIFZQVSBhZGRyZXNzIGlzIGFsbG9jYXRlZCB3aGVuIGJ1ZmZlciBpcyBjcmVhdGVk
DQo+Pj4gZXhjZXB0IGZvciBpbXBvcnRlZCBwcmltZSBidWZmZXJzIHRoYXQgYWxsb2NhdGUg
aXQgaW4gQk9fSU5GTyBJT0NUTCBkdWUNCj4+PiB0byBtaXNzaW5nIGZpbGVfcHJpdiBhcmcg
aW4gZ2VtX3ByaW1lX2ltcG9ydCBjYWxsYmFjay4NCj4+PiBJbnRlcm5hbCBidWZmZXJzIGFy
ZSBwaW5uZWQgb24gY3JlYXRpb24sIHRoZSByZXN0IG9mIGJ1ZmZlcnMgdHlwZXMNCj4+PiBj
YW4gYmUgcGlubmVkIG9uIGRlbWFuZCAoaW4gU1VCTUlUIElPQ1RMKS4NCj4+PiBCdWZmZXIg
VlBVIGFkZHJlc3MsIGFsbG9jYXRlZCBwYWdlcyBhbmQgbWFwcGluZ3MgYXJlIHJlbGFzZWQg
d2hlbiB0aGUNCj4+PiBidWZmZXIgaXMgZGVzdHJveWVkLg0KPj4+IEV2aWN0aW9uIG1lY2hp
c20gaXMgcGxhbm5lZCBmb3IgZnV0dXJlIHZlcnNpb25zLg0KPj4+DQo+Pj4gQWRkIHRocmVl
IG5ldyBJT0NUTHM6IEJPX0NSRUFURSwgQk9fSU5GTywgQk9fVVNFUlBUUg0KPj4NCj4+IEkg
ZmVlbHMgbGlrZSBUVE0gYWxyZWFkeSBkb2VzIGFsbCB5b3UgbmVlZC4gKD8pIFdoeSBub3Qg
YnVpbGQgdXBvbiBUVE0/DQo+IA0KPiBXb3VsZCBUVE0gbWFrZSBzZW5zZSBmb3IgYSBkZXZp
Y2Ugd2l0aG91dCBkZWRpY2F0ZWQgbWVtb3J5Pw0KDQpJdCBpcyBhdCBsZWFzdCBwb3NzaWJs
ZS4gaTkxNSBoYXMgVFRNIGNvZGUgZm9yIGRpc2NyZXRlIGRldmljZXMgYW5kIA0KbWF5YmUg
dXNlcyBzb21lIG9mIGl0IGZvciBpbnRlZ3JhdGVkIGNoaXBzIGEgd2VsbC4gIEkndmUgY2Mn
ZWQgYSBudW1iZXIgDQpvZiBwZW9wbGUgd2l0aCBleHBlcnRpc2UuDQoNCj4gSXQgbG9va3Mg
bGlrZSBzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgY291bGQgYmUgYSBiZXR0ZXIgZml0
IGZvciB1cyBidXQgaXQgZG9lc24ndCBzdXBwb3J0IHVzZXJwdHIgb3IgaW50ZXJuYWwgYnVm
ZmVycy4NCg0KSSBkb24ndCBmaW5kIGRybV9nZW1fc2htZW1fb2JqZWN0IGluIHlvdXIgY3Vy
cmVudCBwYXRjaC4gKD8pIEdFTSBTSE1FTSANCmlzIGEgc2ltcGxlIGFsbG9jYXRvciBmb3Ig
c2ltcGxlIGRldmljZXMuIEl0J3MgYmVzdCB0byBrZWVwIGl0IHRoaXMgd2F5Lg0KU3R1ZmYg
bGlrZSBldmljdGlvbiBhbmQgdXNlcnB0ciBzb3VuZHMgbGlrZSBpdCdzIG5vdCBmb3IgdGhl
IHNobWVtIGhlbHBlcnMuDQoNClRoZSBuZXh0IGJlc3QgdGhpbmcgd291bGQgYmUgdG8gd3Jp
dGUgeW91ciBvd24gR0VNIGFsbG9jYXRvciwgd2hpY2ggeW91IA0KZGlkIEFGQUlDVC4gQW5k
IHRoYXQncyBhYnNvbHV0ZWx5IG9rLiBCdXQgVFRNIGF0IGxlYXN0IHNlZW1zIGxpa2UgYSAN
CnBsYXVzaWJsZSBmcmFtZXdvcmsuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+
IFJlZ2FyZHMsDQo+IEphY2VrDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------iY1QqESEkp8SnexbGNVIvYri--

--------------wTWo4UjNE7CQMMd2ucl80fWz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNZItwFAwAAAAAACgkQlh/E3EQov+BP
5Q/+PYUcrOPHD5u7I2xzPEGibqxjryzW3Vrpiy2WW+P7xjsnDJJbIjrSQbTuie7O88gFHRw2uM8B
l8fKV+qx8r0AQI6wuWVIjwWEvA1l466BItzYpZRQMC8eCc8wJDgxbrTzB18ilxKVF9naPsdtU1eM
8MXNjsll2LYp8KPgZa3CCvtSOg85IKIrAyBDEU3TmJVJY9GNKjP0GB1ROj7wvMCy/vIjhR+A52jA
YRT2ynjqY7xSjNRdQlaGh5149FpbKaaK37cVFlzhzNgrs7uKVixHPPnKXHilU4Q1wgL6uy36kSpF
iPM9COPj4w2E9y0Sa3W36Wt0LojG0viMz5RPLhs9ds6OB7fLU+NCwNSfbcBbNlxU7+CawEV7liXU
nWCIJZa4tLVqdqQldXoN9jbdOR+FU/LV0+g5Cji3772GG+Lxz+8khgfMsI9lTri04oPHaA4cpTEh
Em0UnTZiZgYtdfqkWiQv7KOvMtiwbQ3TPKHEkPk0edy9M/+KXq8QHYGbYfPrleTt2Qez2y7ef/vx
NRnSXdvUf3y+4lujNuMci9HCswzWMk5Wg+JB+6LhRblZxFu+wkSzRjN10AWy1QstfDzUY26wkpD+
548bPnF0l3iBNJg/4MxX4T7fzWu3XKc/IWvf240f2CFcVoiZHrjSdOa8jIMEC9LEtUjHgh/XVoz2
MPU=
=XEHz
-----END PGP SIGNATURE-----

--------------wTWo4UjNE7CQMMd2ucl80fWz--

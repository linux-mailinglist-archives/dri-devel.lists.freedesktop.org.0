Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1583C509B61
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 11:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FD210FB31;
	Thu, 21 Apr 2022 09:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373DB10FB33
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 09:07:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBC07210DC;
 Thu, 21 Apr 2022 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650532021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OS/VR6GfiJTG1H0XoC9LyXhebkbunusT7zHO9RtN9+I=;
 b=rLh0CVu1uCteslNToqZszYYDKk+ShASvH6rvGUUHGR7Id2C4xyuOcX/Fy/5489qC3I10HZ
 4gqZkWcAXoLgqZx6lG9inHgidJAZZLbLz33QdOJxA8SpzQGh+JCsuTP3Lc9W+2B4CpIkqn
 vxntCvTajZ+AB0BwKheP46IPwCpqU0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650532021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OS/VR6GfiJTG1H0XoC9LyXhebkbunusT7zHO9RtN9+I=;
 b=WSTVJK4hXe0Ok1qNJO3hGZ2dZ6AeFTe85w9kOm21TMs6SJJEQvY1kDqDgvdRrgu6Dqnlxz
 PCcC6LYmCCQfJOBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93E6113446;
 Thu, 21 Apr 2022 09:07:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JNIfI7UeYWKFOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 09:07:01 +0000
Message-ID: <ab2d7181-b125-e6fc-fc48-427c0d94ade9@suse.de>
Date: Thu, 21 Apr 2022 11:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
 <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N2T6yIUS8Dcm4LrvKJgazcgZ"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N2T6yIUS8Dcm4LrvKJgazcgZ
Content-Type: multipart/mixed; boundary="------------MW6Apu97NdqqZiSyxMK7yKiV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-ID: <ab2d7181-b125-e6fc-fc48-427c0d94ade9@suse.de>
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
 <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
In-Reply-To: <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>

--------------MW6Apu97NdqqZiSyxMK7yKiV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIxLjA0LjIyIHVtIDEwOjM0IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoNCj4g
QW0gMjEuMDQuMjIgdW0gMTA6MzAgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+IChS
ZXNlbmRpbmcsIGFzIHNvbWUgTUxzIGRpZG4ndCBsaWtlIHRoZSBzaXplIG9mIHRoZSBvcmln
bmluYWwgbWFpbC4pDQo+Pg0KPj4gSGksDQo+Pg0KPj4gdGhhbmtzIGZvciB5b3VyIHN1Ym1p
c3Npb24uIFNvbWUgZ2VuZXJhbCBjb21tZW50czoNCj4+DQo+PiDCoCAqIHNvbWUgZnVuY3Rp
b25zIGFyZSBwcmVmaXhlZCB3aXRoIGRsYV8sIG90aGVycyB1c2UgbnZkbGFfLiBJdCBzZWVt
cyANCj4+IGFyYml0cmFyeSB0byBtZS4gUGxlYXNlIHVzZSBudmRsYV8gY29uc2lzdGVudGx5
IHRocm91Z2hvdXQgdGhlIHNvdXJjZSANCj4+IGNvZGUuDQo+Pg0KPj4gwqAgKiBGb3IgcmVw
b3J0aW5nIGVycm9ycywgcGxlYXNlIHVzZSBkcm1fZXJyKCksIGRybV93YXJuKCksIGV0Yy4g
SSANCj4+IHN1Z2dlc3QgdG8gcmVhcnJhbmdlIHRoZSBlcnJvciBtZXNzYWdlcyB0byBub3Qg
YmUgbG9jYXRlZCBpbiB0aGUgDQo+PiBpbm5lcm1vc3QgZnVuY3Rpb25zLg0KPiANCj4gSWYg
eW91IHBsYW4gdG8gaGF2ZSBtdWx0aXBsZSBpbnN0YW5jZXMgb2YgdGhlIGRyaXZlciBsb2Fk
ZWQgYXQgdGhlIHNhbWUgDQo+IHRpbWUsIHVzaW5nIGRybV9kZXZfZXJyKCksIGRybV9kZXZf
d2FybigpIGV0Yy4uIHdvdWxkIGJlIGV2ZW4gYmV0dGVyLg0KPiANCj4gQlRXOiBJJ20gc3Rp
bGwgYWJzb2x1dGVseSBub3Qga2VlbiB0byBlbmZvcmNpbmcgZHJtXyogbG9nIGZ1bmN0aW9u
cy4gU28gDQo+IGlmIHlvdSBwcmVmZXIgdG8gc3RpY2sgd2l0aCBwcl9lcnIoKSBhbmQgZGV2
X2VycigpIHdlIGNvdWxkIGRpc2N1c3MgdGhhdCANCj4gb25jZSBtb3JlLg0KDQpJIG9mdGVu
IGRvICdkbWVzZyB8IGdyZXAgZHJtJyB0byBxdWlja2x5IGxvb2sgZm9yIGVycm9ycy4gTm90
IHVzaW5nIGRybSANCmxvZ2dpbmcgaGVscGVycyBtYWtlcyB0aGlzIGxlc3MgdXNlZnVsLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4u
DQo+IA0KPj4NCj4+IMKgICogQ291bGQgeW91IHBsZWFzZSBzcGxpdCB0aGlzIHBhdGNoIGlu
dG8gc21hbGxlciBwaWVjZXM/IEl0IA0KPj4gY3VycmVudGx5IGhpdHMgc2l6ZSBsaW1pdHMg
b2Ygc29tZSBtYWlsaW5nIGxpc3RzLiBNYXliZSBhZGQgdGhlIA0KPj4gcmVnaXN0ZXIgY29u
c3RhbnRzIHNlcGFyYXRlbHkuDQo+Pg0KPj4gUGxlYXNlIGZpbmQgbW9yZSByZXZpZXcgY29t
bWVudHMgYmVsb3cuIEl0J3Mgbm90IGEgZnVsbCByZXZpZXcsIGJ1dCBhdCANCj4+IGxlYXN0
IHNvbWV0aGluZyB0byBzdGFydCB3aXRoLg0KPj4NCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhv
bWFzDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------MW6Apu97NdqqZiSyxMK7yKiV--

--------------N2T6yIUS8Dcm4LrvKJgazcgZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJhHrUFAwAAAAAACgkQlh/E3EQov+A9
EA/+M1CDH5IqOym52dk60W3n2FvRPzLvtn0OR5TOR8WauG2VLkPvFiZnPBKSXdGaQOzGiO0sO13/
OZTb+AWD7o3o1ZMHYxUVO4XC//41efhqkB5NIa2nKV9hePmLRLdjeqDHUSPjXVoafD/vrn++gCaV
hbaLk+wmWQb6GFoBde1p8n+vcqg5YNNLRs8gftSWq4dmTUD7XnCfQ2KOuIlmBynJ9RNd9NOrRTBz
O1FxSwSQ38pT1D4dtpytjqm3txc0mS5VbYMZvp9laams/rsDEcCCmk8evCX3nq4HGCFUOHYA35w0
xHws+GTN9ImvKKbApdhyvYYKSmqQRcEfGPHxDQsvn2yyKE/aVjyPeDgz589XbaH9RfvfHL8NumUy
s4Hia6oW1xf+pR8z1NLy1t/Bl0xn5iydAPhm/9VFfD7MqTokiwhZaFriMcpp5l9r5EUGlW2gxpzR
HeSibmwWzbdh4/YB3Xv8MZhVXbURU/YHw+XwHIXyJsMjQnPP43QCvtxtrhrnOSTSYMDFlCPsbFM8
f8B+tQdjTbON9Cev0dA07I5dKIkRWKWuh3N04C+THNTAL8zesnWDq8Sz2zeVJYSO4UXoM+s51CLX
CYwwnFpnYq+ayYetpSIkbDy2gT5yfm6kqJgpXFH+GWCofwWn7f5y9BGXD/dx/DNAq6nHH3QelsPi
kUM=
=jsEe
-----END PGP SIGNATURE-----

--------------N2T6yIUS8Dcm4LrvKJgazcgZ--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF76609B5A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE9C10E2B1;
	Mon, 24 Oct 2022 07:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3EE10E2B1;
 Mon, 24 Oct 2022 07:32:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A1E41F85D;
 Mon, 24 Oct 2022 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666596778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNbUBSCX4rk2H5cwr4FfXQXC9SGGZVu1vcelLwGJsE0=;
 b=iurxrLgRkf+trXrOpuexDspZ/gH9dse8AKszLDNfnd8PIRYliRUSMV/Tbax62HfXc32Qu7
 Jm2/ToWOKC/gdVyiDUH0i45klmRSN0QABSxJM74mPHB6WrL9PwsNkoXyDGrBEiZ5IH5aes
 55GP5/09R72uqng5sYiDsKjgu77FPU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666596778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNbUBSCX4rk2H5cwr4FfXQXC9SGGZVu1vcelLwGJsE0=;
 b=v08iQFEvrrbncYy5/y4OxGmw5KKYlnJ9Xpu03DTAQLtm4KvMYuccQrag7PeJNgk2htCuYO
 X8OULeOssEhMfLAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2058413A79;
 Mon, 24 Oct 2022 07:32:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 98X5Bqo/VmMgMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 07:32:58 +0000
Message-ID: <e494d819-f960-f2bd-913e-83ee820ac399@suse.de>
Date: Mon, 24 Oct 2022 09:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
To: "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20221020143603.563929-1-alexander.deucher@amd.com>
 <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sT6EtzUC0gcP6otwZxFnKkDK"
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
--------------sT6EtzUC0gcP6otwZxFnKkDK
Content-Type: multipart/mixed; boundary="------------04DFWe79XCZNx3x3Udd5bTu0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <e494d819-f960-f2bd-913e-83ee820ac399@suse.de>
Subject: Re: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
References: <20221020143603.563929-1-alexander.deucher@amd.com>
 <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>

--------------04DFWe79XCZNx3x3Udd5bTu0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMTAuMjIgdW0gMDg6MjAgc2NocmllYiBRdWFuLCBFdmFuOg0KPiBbQU1E
IE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4gDQo+IFJldmlld2VkLWJ5OiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiANCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleA0KPj4gRGV1Y2hlcg0KPj4gU2VudDogVGh1
cnNkYXksIE9jdG9iZXIgMjAsIDIwMjIgMTA6MzYgUE0NCj4+IFRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4g
Q2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFRo
b21hcw0KPj4gWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFN1YmplY3Q6
IFtQQVRDSF0gZHJtL2FtZGdwdTogZG9uJ3QgY2FsbCBkcm1fZmJfaGVscGVyX2xhc3RjbG9z
ZSBpbg0KPj4gbGFzdGNsb3NlKCkNCj4+DQo+PiBJdCdzIHVzZWQgdG8gcmVzdG9yZSB0aGUg
ZmJkZXYgY29uc29sZSwgYnV0IGFzIGFtZGdwdSB1c2VzDQo+PiBnZW5lcmljIGZiZGV2IGVt
dWxhdGlvbiwgdGhlIGNvbnNvbGUgaXMgYmVpbmcgcmVzdG9yZWQgYnkgdGhlDQo+PiBEUk0g
Y2xpZW50IGhlbHBlcnMgYWxyZWFkeS4gU2VlIHRoZSBjYWxsIHRvIGRybV9jbGllbnRfZGV2
X3Jlc3RvcmUoKQ0KPj4gaW4gZHJtX2xhc3RjbG9zZSgpLg0KPj4NCj4+IEZpeGVzOiAwODc0
NTFmMzcyYmY3NiAoImRybS9hbWRncHU6IHVzZSBnZW5lcmljIGZiIGhlbHBlcnMgaW5zdGVh
ZCBvZg0KPj4gc2V0dGluZyB1cCBBTUQgb3duJ3MuIikNCj4+IENjOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgfCAxIC0NCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9rbXMuYw0KPj4gaW5kZXggZmUyM2UwOWVlYzk4Li40NzRiOWY0MGY3
OTIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
a21zLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMu
Yw0KPj4gQEAgLTExMDYsNyArMTEwNiw2IEBAIGludCBhbWRncHVfaW5mb19pb2N0bChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LA0KPj4gdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpm
aWxwKQ0KPj4gICAgKi8NCj4+ICAgdm9pZCBhbWRncHVfZHJpdmVyX2xhc3RjbG9zZV9rbXMo
c3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+ICAgew0KPj4gLQlkcm1fZmJfaGVscGVyX2xh
c3RjbG9zZShkZXYpOw0KPj4gICAJdmdhX3N3aXRjaGVyb29fcHJvY2Vzc19kZWxheWVkX3N3
aXRjaCgpOw0KPj4gICB9DQoNCldpdGhvdXQgdGhlIGNhbGwgdG8gZHJtX2ZiX2hlbHBlcl9s
YXN0Y2xvc2UoKSwgdGhlIGNvbnNvbGUgZW11bGF0aW9uIA0Kd2lsbCBiZSByZXN0b3JlZCBi
eSBkcm1fY2xpZW50X2Rldl9yZXN0b3JlKCkgZnJvbSBkcm1fbGFzdGNsb3NlKCkuIFsxXSAN
Ckl0IG1lYW5zIHRoYXQgaXQncyBub3cgY2hhbmdpbmcgb3JkZXIgd2l0aCB0aGUgY2FsbCB0
byANCnZnYV9zd2l0Y2hlcm9vX3Byb2Nlc3NfZGVsYXlfc3dpdGNoKCkuIENhbiB0aGlzIGJl
Y29tZSBhIHByb2JsZW0/DQoNCkkgbG9va2VkIGF0IHRoZSBvdGhlciBjYWxsZXJzIG9mIHRo
YXQgZnVuY3Rpb24uIE1vc3QgcmVzdG9yZSB0aGUgY29uc29sZSANCmJlZm9yZSBkb2luZyB0
aGUgc3dpdGNoZXJvby4gTm91dmVhdSBkb2Vzbid0IHNlZW0gdG8gY2FyZSBhYm91dCB0aGUg
DQpjb25zb2xlIGF0IGFsbC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMC4zL3NvdXJjZS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZpbGUuYyNMNDY3DQoNCj4+DQo+PiAtLQ0KPj4gMi4zNy4zDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------04DFWe79XCZNx3x3Udd5bTu0--

--------------sT6EtzUC0gcP6otwZxFnKkDK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNWP6kFAwAAAAAACgkQlh/E3EQov+Bq
9g/6Ajk7FJLBgRAw2CLfrPtSkR0WoUPCJPXLi9Apxt5iURurX+tx96wr2yprV/QEUa7x9ND74JuH
bEv9y5uZ874lkAkHAX36vtgCxxuiJaLiTHFDVy0wzP960UeJGh5rOM/ATk+1HoGFS5Cj/uEWVOUk
Tm4qMy1oBRvLxbVUU3jbeGo4Kn/vGvO4x0DWIpkTd41cv4ClQdfCvrd/DwRaC4rk8pjEVirGsiy5
U6BeUQKQxsY2Rbqk/qHC7K4IYeewfHICfuH0m6vbLtW2d9cpfvmdvgjicRKp23HaYkmJVzpFZW9y
RnQRpD6L1nMc37qnKcXTH3JmArRvoAhfrVdf3GZ8x5ShF/gIB4izQpITGyP6rSoVCIBbpeLTZsR/
5YwpaqGQHDFvGx4eoA2FlBt1vECwb2a3bDgsgHroIrtoYRGeGcQfwi6euD31PcxGGmqu/uu2gQMH
QRCDkZ6sSdWoXmdE6AwEtjXaJ/1DTMFIRUtrLSBPnb1k/0aAeyNhg4dqI8g8jFswzU7AF0fNHQiJ
r9hI+1ZJ53yVCYK7b3v1S3FVQJ0Rix5OO4PuCphv1ogwcKVwmW1gAL01EDmLSa4RVWw3z7HfBjRS
+sTle8KYt0tET2PqTN3LBl7igKtxzrfXMAsyTngGamUC5xkQ5mMu4n76vHEgtAZLdKlfN8lUY7wY
7/g=
=IrX6
-----END PGP SIGNATURE-----

--------------sT6EtzUC0gcP6otwZxFnKkDK--

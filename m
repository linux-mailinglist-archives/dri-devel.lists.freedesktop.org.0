Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1F62F8A4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD55A10E766;
	Fri, 18 Nov 2022 15:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A314C10E75F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 15:00:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CF6622644;
 Fri, 18 Nov 2022 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668783651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ayF7lGD5CYRDs0U8h4YPg/eQ1GVUBxSqD/Tb2Es/Fp8=;
 b=XX2bk3+qJtT8LTPlkR25c9hHZB+c6PcZUQuoDzT3yF6vvUmetZChcseg9Txcrj0JEJx2/7
 7FDAk9methu19owceUiqYr4SbZXCgayegqA8mAzr+Ia2mIN+GR10PzTtafs6L6L3zKgGrh
 TQXUjQYG5F41FRyMncx6lbbXL1dlUNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668783651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ayF7lGD5CYRDs0U8h4YPg/eQ1GVUBxSqD/Tb2Es/Fp8=;
 b=pQ55IBs8zFLSCmISs5nAbHkAhlaU53m93iJ2oFCSX2YQ2sI5ndEePNEv39HG5k58s1OW5i
 8Al8DwUOw9pFINCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 099EE1345B;
 Fri, 18 Nov 2022 15:00:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N2zFACOed2NPWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 15:00:51 +0000
Message-ID: <7a2e37bb-e6f1-24e0-1a2b-a9893e591176@suse.de>
Date: Fri, 18 Nov 2022 16:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/8] drm/format-helper: Support the XB24 format
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-7-thierry.reding@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221117184039.2291937-7-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0IKCjsNrPNWW0Wr6UPDmL9HP"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0IKCjsNrPNWW0Wr6UPDmL9HP
Content-Type: multipart/mixed; boundary="------------Mgw0kWtz98o006zvnTarGf0j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7a2e37bb-e6f1-24e0-1a2b-a9893e591176@suse.de>
Subject: Re: [PATCH v3 6/8] drm/format-helper: Support the XB24 format
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-7-thierry.reding@gmail.com>
In-Reply-To: <20221117184039.2291937-7-thierry.reding@gmail.com>

--------------Mgw0kWtz98o006zvnTarGf0j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE3LjExLjIyIHVtIDE5OjQwIHNjaHJpZWIgVGhpZXJyeSBSZWRpbmc6DQo+IEZy
b206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+DQo+IA0KPiBBZGQgYSBj
b252ZXJzaW9uIGhlbHBlciBmb3IgdGhlIFhCMjQgZm9ybWF0IHRvIHVzZSBpbiBkcm1fZmJf
YmxpdCgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdA
bnZpZGlhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIHJlYmFzZSBv
bnRvIGxhdGVzdCBkcm0tbmV4dA0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBzdXBwb3J0
IFhCMjQgZm9ybWF0IGluc3RlYWQgb2YgQUIyNA0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2Zvcm1hdF9oZWxwZXIuYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+IGluZGV4IDc0ZmYzM2MyZGRhYS4uYzg3NjRj
YzYxZTg3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxw
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBA
QCAtNTAzLDYgKzUwMywzNiBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfcmdiODg4X3RvX3hyZ2I4
ODg4KHN0cnVjdCBpb3N5c19tYXAgKmRzdCwgY29uc3QgdW5zaWduZWQgaW50DQo+ICAgCQkg
ICAgZHJtX2ZiX3JnYjg4OF90b194cmdiODg4OF9saW5lKTsNCj4gICB9DQo+ICAgDQo+ICtz
dGF0aWMgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9feGJncjg4ODhfbGluZSh2b2lkICpkYnVm
LCBjb25zdCB2b2lkICpzYnVmLCB1bnNpZ25lZCBpbnQgcGl4ZWxzKQ0KPiArew0KPiArCV9f
bGUzMiAqZGJ1ZjMyID0gZGJ1ZjsNCj4gKwljb25zdCBfX2xlMzIgKnNidWYzMiA9IHNidWY7
DQo+ICsJdW5zaWduZWQgaW50IHg7DQo+ICsJdTMyIHBpeDsNCj4gKw0KPiArCWZvciAoeCA9
IDA7IHggPCBwaXhlbHM7IHgrKykgew0KPiArCQlwaXggPSBsZTMyX3RvX2NwdShzYnVmMzJb
eF0pOw0KPiArCQlwaXggPSAoKHBpeCAmIDB4MDBmZjAwMDApID4+IDE2KSA8PCAgMCB8DQo+
ICsJCSAgICAgICgocGl4ICYgMHgwMDAwZmYwMCkgPj4gIDgpIDw8ICA4IHwNCj4gKwkJICAg
ICAgKChwaXggJiAweDAwMDAwMGZmKSA+PiAgMCkgPDwgMTYgfA0KPiArCQkgICAgICAweGZm
IDw8IDI0Ow0KPiArCQkqZGJ1ZjMyKysgPSBjcHVfdG9fbGUzMihwaXgpOw0KPiArCX0NCj4g
K30NCj4gKw0KPiArc3RhdGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3hiZ3I4ODg4KHN0
cnVjdCBpb3N5c19tYXAgKmRzdCwgY29uc3QgdW5zaWduZWQgaW50ICpkc3RfcGl0Y2gsDQo+
ICsJCQkJCWNvbnN0IHN0cnVjdCBpb3N5c19tYXAgKnNyYywNCj4gKwkJCQkJY29uc3Qgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+ICsJCQkJCWNvbnN0IHN0cnVjdCBkcm1fcmVj
dCAqY2xpcCkNCj4gK3sNCj4gKwlzdGF0aWMgY29uc3QgdTggZHN0X3BpeHNpemVbRFJNX0ZP
Uk1BVF9NQVhfUExBTkVTXSA9IHsNCj4gKwkJNCwNCj4gKwl9Ow0KPiArDQo+ICsJZHJtX2Zi
X3hmcm0oZHN0LCBkc3RfcGl0Y2gsIGRzdF9waXhzaXplLCBzcmMsIGZiLCBjbGlwLCBmYWxz
ZSwNCj4gKwkJICAgIGRybV9mYl94cmdiODg4OF90b194YmdyODg4OF9saW5lKTsNCj4gK30N
Cj4gKw0KPiAgIHN0YXRpYyB2b2lkIGRybV9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMF9s
aW5lKHZvaWQgKmRidWYsIGNvbnN0IHZvaWQgKnNidWYsIHVuc2lnbmVkIGludCBwaXhlbHMp
DQo+ICAgew0KPiAgIAlfX2xlMzIgKmRidWYzMiA9IGRidWY7DQo+IEBAIC02NDYsNiArNjc2
LDggQEAgaW50IGRybV9mYl9ibGl0KHN0cnVjdCBpb3N5c19tYXAgKmRzdCwgY29uc3QgdW5z
aWduZWQgaW50ICpkc3RfcGl0Y2gsIHVpbnQzMl90IGQNCj4gICAJCWZiX2Zvcm1hdCA9IERS
TV9GT1JNQVRfWFJHQjg4ODg7DQo+ICAgCWlmIChkc3RfZm9ybWF0ID09IERSTV9GT1JNQVRf
QVJHQjg4ODgpDQo+ICAgCQlkc3RfZm9ybWF0ID0gRFJNX0ZPUk1BVF9YUkdCODg4ODsNCj4g
KwlpZiAoZHN0X2Zvcm1hdCA9PSBEUk1fRk9STUFUX0FCR1I4ODg4KQ0KPiArCQlkc3RfZm9y
bWF0ID0gRFJNX0ZPUk1BVF9YQkdSODg4ODsNCj4gICAJaWYgKGZiX2Zvcm1hdCA9PSBEUk1f
Rk9STUFUX0FSR0IyMTAxMDEwKQ0KPiAgIAkJZmJfZm9ybWF0ID0gRFJNX0ZPUk1BVF9YUkdC
MjEwMTAxMDsNCj4gICAJaWYgKGRzdF9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9BUkdCMjEwMTAx
MCkNCj4gQEAgLTY3OCw2ICs3MTAsMTEgQEAgaW50IGRybV9mYl9ibGl0KHN0cnVjdCBpb3N5
c19tYXAgKmRzdCwgY29uc3QgdW5zaWduZWQgaW50ICpkc3RfcGl0Y2gsIHVpbnQzMl90IGQN
Cj4gICAJCQlkcm1fZmJfcmdiNTY1X3RvX3hyZ2I4ODg4KGRzdCwgZHN0X3BpdGNoLCBzcmMs
IGZiLCBjbGlwKTsNCj4gICAJCQlyZXR1cm4gMDsNCj4gICAJCX0NCj4gKwl9IGVsc2UgaWYg
KGRzdF9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YQkdSODg4OCkgew0KPiArCQlpZiAoZmJfZm9y
bWF0ID09IERSTV9GT1JNQVRfWFJHQjg4ODgpIHsNCj4gKwkJCWRybV9mYl94cmdiODg4OF90
b194YmdyODg4OChkc3QsIGRzdF9waXRjaCwgc3JjLCBmYiwgY2xpcCk7DQo+ICsJCQlyZXR1
cm4gMDsNCj4gKwkJfQ0KPiAgIAl9IGVsc2UgaWYgKGRzdF9mb3JtYXQgPT0gRFJNX0ZPUk1B
VF9YUkdCMjEwMTAxMCkgew0KPiAgIAkJaWYgKGZiX2Zvcm1hdCA9PSBEUk1fRk9STUFUX1hS
R0I4ODg4KSB7DQo+ICAgCQkJZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwKGRzdCwg
ZHN0X3BpdGNoLCBzcmMsIGZiLCBjbGlwKTsNCj4gQEAgLTgyMCw2ICs4NTcsOCBAQCBzdGF0
aWMgYm9vbCBpc19saXN0ZWRfZm91cmNjKGNvbnN0IHVpbnQzMl90ICpmb3VyY2NzLCBzaXpl
X3QgbmZvdXJjY3MsIHVpbnQzMl90DQo+ICAgc3RhdGljIGNvbnN0IHVpbnQzMl90IGNvbnZf
ZnJvbV94cmdiODg4OFtdID0gew0KPiAgIAlEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiAgIAlE
Uk1fRk9STUFUX0FSR0I4ODg4LA0KPiArCURSTV9GT1JNQVRfQUJHUjg4ODgsDQo+ICsJRFJN
X0ZPUk1BVF9YQkdSODg4OCwNCj4gICAJRFJNX0ZPUk1BVF9YUkdCMjEwMTAxMCwNCj4gICAJ
RFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCwNCj4gICAJRFJNX0ZPUk1BVF9SR0I1NjUsDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Mgw0kWtz98o006zvnTarGf0j--

--------------0IKCjsNrPNWW0Wr6UPDmL9HP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3niIFAwAAAAAACgkQlh/E3EQov+Bo
NBAAja8YS9Q46PAcc4idkBBP8xR9GiDggeyQJ8K2IBBp2K87adRNDhFcnrItLSRhzHJ0m37zV/uy
uIvMoCz20zcndWWySCHcqOi9MakLtWlVBtapUi/372gXgaFOKWdHvZfFJYpIPhvGOKN9LhdTJNFm
CPD/KfWuGVrpPvBRAwqjBNmKr1hmn4zdldsdiQ+Npg/VQrmBuNpNrBqILMeWWy5aAjMb97LN8hS3
63Qi8g7IUiT6I/5KQVKFMHh8HiozitUbYe6/RqMcX5boXy9fM+hlwi3YSGVdJ9j2qAUA73UWkBcH
iQG8BQGfVnyu5WQuoammqcMjxtxygodO6buNLSzO2zMq39lw0JZjS+CQhcGnXo6u1PnM9rWHak9S
pyAVYgzFjvzT8HWmgkpXdum7dkUiL2fOQPkGjzhz0YwTxoQkM8mobCuYble+qtGTVrPKOb4OgDE1
rX/PR1Vv4oCbwBNjTEfBAZH6N/IJKI8bKdSjdbVlCuWdg93SZ7wc549wkTG+QNcXg/HnIK5Ec7NB
Wt4ce8MU2u7aFNkbiUO+x4LXoxybKCLjXJ7WXGiG8J8alY9bnx9zqa8LZnsowX7RZYJH38X/as9i
cgWMEpEMp4D/RDmS+46zyOJiL/IHy2v8vxMym4FxmCc0IM+pHwf5GiQQMqqVglLRv30PSKLkQWbb
Dhw=
=UmkX
-----END PGP SIGNATURE-----

--------------0IKCjsNrPNWW0Wr6UPDmL9HP--

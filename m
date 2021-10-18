Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCD4315B0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 12:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031696E860;
	Mon, 18 Oct 2021 10:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6573D6E860
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 10:14:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5C921FD6D;
 Mon, 18 Oct 2021 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634552092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wZItZ6/4LqmOsaf1zl+IRk+CQv7Jy41ALPA0U4WwRco=;
 b=JRxiQePUMafbBtNceaJkxKnT/cgCWIviLmXkDaFjBx2KVQPfRjhRDR6c6QJ9W2NStx2cDP
 BR3shNYRHWQiBKRBV1kWH+hBOCUpTN1QcOY37ywMI3UNKXOSDPI6dKbBKtKRVeoIVoP8ns
 sK+Bjc+DH+sws/XfgiGUuyspEer982I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634552092;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wZItZ6/4LqmOsaf1zl+IRk+CQv7Jy41ALPA0U4WwRco=;
 b=7DlEYFBu4PYvkw9tYamYM/3r5gfmfh/bMTzgaGqfo3i74l3jEqqJXxN/D1quWDFy0S7/aN
 IrU+jk0+cAKiU/Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACA4413CC9;
 Mon, 18 Oct 2021 10:14:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QFkEKRxJbWGobAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Oct 2021 10:14:52 +0000
Message-ID: <5507450a-eb69-b24c-9f43-a1780dafbfa9@suse.de>
Date: Mon, 18 Oct 2021 12:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/6] drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to
 accept multiple formats
Content-Language: en-US
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-6-igormtorrente@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211005201637.58563-6-igormtorrente@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BeE4Z8perMNS2U3q0azovsqE"
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
--------------BeE4Z8perMNS2U3q0azovsqE
Content-Type: multipart/mixed; boundary="------------FTy0l00Mw0qs0WF6y3A6ABza";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Message-ID: <5507450a-eb69-b24c-9f43-a1780dafbfa9@suse.de>
Subject: Re: [PATCH 5/6] drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to
 accept multiple formats
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-6-igormtorrente@gmail.com>
In-Reply-To: <20211005201637.58563-6-igormtorrente@gmail.com>

--------------FTy0l00Mw0qs0WF6y3A6ABza
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjEgdW0gMjI6MTYgc2NocmllYiBJZ29yIE1hdGhldXMgQW5kcmFk
ZSBUb3JyZW50ZToNCj4gQ3VycmVudGx5LCB0aGUgdmttcyBhdG9taWMgY2hlY2sgb25seSBn
b2VzIHRocm91Z2ggdGhlIGZpcnN0IHBvc2l0aW9uIG9mDQo+IHRoZSBgdmttc193Yl9mb3Jt
YXRzYCB2ZWN0b3IuDQo+IA0KPiBUaGlzIGNoYW5nZSBwcmVwYXJlcyB0aGUgYXRvbWljX2No
ZWNrIHRvIGNoZWNrIHRoZSBlbnRpcmUgdmVjdG9yLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
SWdvciBNYXRoZXVzIEFuZHJhZGUgVG9ycmVudGUgPGlnb3JtdG9ycmVudGVAZ21haWwuY29t
Pg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFjay5jIHwg
MTEgKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfd3JpdGViYWNrLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFj
ay5jDQo+IGluZGV4IDVhM2UxMmYxMDVkYy4uNTY5NzhmNDk5MjAzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFjay5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMNCj4gQEAgLTMwLDYgKzMwLDggQEAg
c3RhdGljIGludCB2a21zX3diX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlciwNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZi
Ow0KPiAgIAljb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSA9ICZjcnRjX3N0
YXRlLT5tb2RlOw0KPiArCWJvb2wgZm9ybWF0X3N1cHBvcnRlZCA9IGZhbHNlOw0KPiArCWlu
dCBpOw0KPiAgIA0KPiAgIAlpZiAoIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2IgfHwgIWNv
bm5fc3RhdGUtPndyaXRlYmFja19qb2ItPmZiKQ0KPiAgIAkJcmV0dXJuIDA7DQo+IEBAIC00
MSw3ICs0MywxNCBAQCBzdGF0aWMgaW50IHZrbXNfd2JfZW5jb2Rlcl9hdG9taWNfY2hlY2so
c3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLA0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+
ICAgCX0NCj4gICANCj4gLQlpZiAoZmItPmZvcm1hdC0+Zm9ybWF0ICE9IHZrbXNfd2JfZm9y
bWF0c1swXSkgew0KPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZrbXNfd2JfZm9y
bWF0cyk7IGkrKykgew0KPiArCQlpZiAoZmItPmZvcm1hdC0+Zm9ybWF0ID09IHZrbXNfd2Jf
Zm9ybWF0c1tpXSkgew0KPiArCQkJZm9ybWF0X3N1cHBvcnRlZCA9IHRydWU7DQo+ICsJCQli
cmVhazsNCj4gKwkJfQ0KPiArCX0NCg0KQXQgYSBtaW5pbXVtLCB0aGlzIGxvb3Agc2hvdWxk
IGJlIGluIGEgaGVscGVyIGZ1bmN0aW9uLiBCdXQgbW9yZSANCmdlbmVyYWxseSwgSSdtIHN1
cnByaXNlZCB0aGF0IHRoaXMgaXNuJ3QgYWxyZWFkeSBjb3ZlcmVkIGJ5IHRoZSBEUk0ncyAN
CmF0b21pYyBoZWxwZXJzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsNCj4gKwlp
ZiAoIWZvcm1hdF9zdXBwb3J0ZWQpIHsNCj4gICAJCURSTV9ERUJVR19LTVMoIkludmFsaWQg
cGl4ZWwgZm9ybWF0ICVwNGNjXG4iLA0KPiAgIAkJCSAgICAgICZmYi0+Zm9ybWF0LT5mb3Jt
YXQpOw0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4
IEltZW5kw7ZyZmZlcg0K

--------------FTy0l00Mw0qs0WF6y3A6ABza--

--------------BeE4Z8perMNS2U3q0azovsqE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFtSRwFAwAAAAAACgkQlh/E3EQov+Ao
wA/2LBJjjKhS1Bv+A3OmYgLbVDE7WU4/a8jeySLCXsBY8y4aDqhbW7pX4PenXHWGtsz7i0GLq/vH
UN1c/6vg0YdLiwvXv/zeSraLs84d+9khk9KK/7xJ2hXN7BbwecPHivfz1gsZyzCnw6TsJS1Fv1th
MxOu3va9FSGpKQrSMZrlxgFKBQhCgpqIF4UgFayjHf1hAPmrK+sA3IaPcAV8KWv/kPq/jSAWWYdg
Cq1kKUHdYJo6BghPivQTLTuDVpTWcG0W6x/O6mKno6KbZCnuqTrA9Obmeyjc/tddJN37e2k0es3y
pkPvEhBYQJF3GmqqVmeMagwnwOugMBOrIV+ylPeAEBomJ3BOayChOkvTKmA4+rkUULYYN6ETYj00
kXgMZmwLd0ZDScM9epS+01jLkgpjLZ5NCAXj09RdcXPph/H1+i6KHsy5HTuLJ5NuaKcD6PTqquB3
7ZGwZ1TY/eAOQtXk8rymEg60om0dUc0CL3UtTlKxLPi2+DqUtlJ19oO4GkyRWzfz6l8FD6Kxs0Du
HfGABaFJNVejnEbEdmcFZQd4I9C9LYHCZP6aFGKSz3U3AV4aHVsZcgUqtdSM8b0AlI645uGb2qSX
vqDx3VaLmpmIUiOkjq0xvD3zgfeeDEfvWYU0nWGbbRiFyHCr0RH/jyATYnBNyMEg+wFbYXfE9pnf
XQ==
=8P/L
-----END PGP SIGNATURE-----

--------------BeE4Z8perMNS2U3q0azovsqE--

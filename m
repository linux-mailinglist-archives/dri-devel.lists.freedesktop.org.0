Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C6249F52A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275D011232B;
	Fri, 28 Jan 2022 08:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A42112330;
 Fri, 28 Jan 2022 08:34:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2ADF821100;
 Fri, 28 Jan 2022 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643358846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mqq6/1K5Z07dZlfumrnft39HapgqP5bCcIjcLq2oulU=;
 b=SWETHrW/LxhkzVFKP3689p6y9pCGa34HBldSN45JYS4l/YRhAbXV/qLVm8H4/XLEDJx7Nc
 q+EGZZcMMluzQcSezBVsvF4F6Ql9pfwW43RbLbS2FhkQ8seW4HzWJZkgLfrr25ZdTQb0zC
 pmj+qhYlkodQG5AaJevt6rUUM48Ynpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643358846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mqq6/1K5Z07dZlfumrnft39HapgqP5bCcIjcLq2oulU=;
 b=BI3ihQORjCMHjmpcGopsCZtaH7e7JTg7g31qKovAjVMGgO9vI+5ioFJpJyHuJMap8ZiGhS
 bczXn03Ko3nfkEBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC40813AF2;
 Fri, 28 Jan 2022 08:34:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c3k3OH2q82HOXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jan 2022 08:34:05 +0000
Message-ID: <5cb9453b-c507-4afa-9d48-1efcfb60be46@suse.de>
Date: Fri, 28 Jan 2022 09:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
 <20220127155913.vt7a74zmsglghzom@ldmartin-desk2>
 <f033228e-c914-efb0-534c-41fc3344f272@suse.de>
In-Reply-To: <f033228e-c914-efb0-534c-41fc3344f272@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wrkStvEPag0Mu6brdyvA0nI1"
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wrkStvEPag0Mu6brdyvA0nI1
Content-Type: multipart/mixed; boundary="------------Rw0on2vsWNVSOyjdXQvrHDck";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Message-ID: <5cb9453b-c507-4afa-9d48-1efcfb60be46@suse.de>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
 <20220127155913.vt7a74zmsglghzom@ldmartin-desk2>
 <f033228e-c914-efb0-534c-41fc3344f272@suse.de>
In-Reply-To: <f033228e-c914-efb0-534c-41fc3344f272@suse.de>

--------------Rw0on2vsWNVSOyjdXQvrHDck
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDEuMjIgdW0gMDk6MTUgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Ci4uLg0KPiANCj4+DQo+PiBXaGlsZSB3aXRoIHRoZSBjb25zdHJ1Y3QgYmVsb3cNCj4+DQo+
PiDCoMKgwqDCoMKgwqDCoMKgIG90aGVyX21hcDsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgLi4u
DQo+PiDCoMKgwqDCoMKgwqDCoMKgIG90aGVyX21hcCA9IElOSVRJQUxJWkVSKCkNCj4+DQo+
PiBJIGNhbiByZWx5IG9uIHRoZSBjb21waWxlciBjb21wbGFpbmluZyBhYm91dCB1bmluaXRp
YWxpemVkIHZhci4gQW5kDQo+PiBpbiBtb3N0IG9mIHRoZSBjYXNlcyBJIGNhbiBqdXN0IGhh
dmUgdGhpcyBzaW5nbGUgbGluZSBpbiB0aGUgYmVnZ2luaW5nIA0KPj4gb2YgdGhlDQo+PiBm
dW5jdGlvbiB3aGVuIHRoZSBvZmZzZXQgaXMgY29uc3RhbnQ6DQo+Pg0KPj4gwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgb3RoZXJfbWFwID0gSU5JVElBTElaRVIoYmxh
X21hcCwgDQo+PiBvZmZzZXRvZiguLikpOw0KPj4NCj4+DQo+PiBUaGlzIGlzIHVzZWZ1bCB3
aGVuIHlvdSBoYXZlIHNldmVyYWwgc21hbGwgZnVuY3Rpb25zIGluIGNoYXJnZSBvZg0KPj4g
dXBkYXRpbmcvcmVhZGluZyBpbm5lciBzdHJ1Y3QgbWVtYmVycy4NCj4gDQo+IFlvdSB3b24n
dCBuZWVkIGFuIGV4dHJhIHZhcmlhYmxlIG9yIHRoZSBpbml0aWFsaXplciBtYWNybyBpZiB5
b3UgYWRkIGFuIA0KPiBvZmZzZXQgcGFyYW1ldGVyIHRvIGRtYV9idWZfbWVtY3B5X3tmcm9t
LHRvfS7CoCBTaW1wbGUgcGFzcyBvZmZzZXRvZiguLikgDQo+IHRvIHRoYXQgcGFyYW1ldGVy
IGFuZCBpdCB3aWxsIGRvIHRoZSByaWdodCB0aGluZy4NCj4gDQo+IEl0IGF2b2lkcyB0aGUg
cHJvYmxlbXMgb2YgdGhlIGN1cnJlbnQgbWFjcm8gYW5kIGlzIGV2ZW4gbW9yZSBmbGV4aWJs
ZS4gDQo+IE9uIHRvcCBvZiB0aGF0LCB5b3UgY2FuIGJ1aWxkIHdoYXRldmVyIGNvbnZlbmll
bmNlIG1hY3JvcyB5b3UgbmVlZCBmb3IgDQo+IGk5MTUuDQoNCkFuZCBtYXliZSBwdXQgYWxs
IGNoYW5nZXMgdG8gdGhlIGRtYV9idWZfbWFwIGludGVyZmFjZSBpbnRvIGEgc2luZ2xlIA0K
cGF0Y2guIEl0IG1ha2VzIGl0IGVhc2llciB0byByZXZpZXcgYW5kIGRpc2N1c3MuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4g
DQo+Pg0KPj4+DQo+Pj4gSSd2ZSBhbHNvIGJlZW4gdmVyeSBjYXJlZnVsIHRvIGRpc3Rpbmd1
aXNoIGJldHdlZW4gLnZhZGRyIGFuZCANCj4+PiAudmFkZHJfaW9tZW0sIGV2ZW4gaW4gcGxh
Y2VzIHdoZXJlIEkgd291bGRuJ3QgaGF2ZSB0by4gVGhpcyBtYWNybyANCj4+PiBicmVha3Mg
dGhlIGFzc3VtcHRpb24uDQo+Pg0KPj4gVGhhdCdzIG9uZSByZWFzb24gSSB0aGluayBpZiB3
ZSBoYXZlIHRoaXMgbWFjcm8sIGl0IHNob3VsZCBiZSBpbiB0aGUNCj4+IGRtYV9idWZfbWFw
LmggaGVhZGVyIChvciB3aGF0ZXZlciB3ZSByZW5hbWUgdGhlc2UgQVBJcyB0bykuIEl0J3Mg
dGhlDQo+PiBvbmx5IHBsYWNlIHdoZXJlIHdlIGNhbiBzYWZlbHkgYWRkIGNvZGUgdGhhdCBy
ZWxpZXMgb24gdGhlIGltcGxlbWVudGF0aW9uDQo+PiBvZiB0aGUgInByaXZhdGUiIGZpZWxk
cyBpbiBzdHJ1Y3QgZG1hX2J1Zl9tYXAuDQo+Pg0KPj4gTHVjYXMgRGUgTWFyY2hpDQo+Pg0K
Pj4+DQo+Pj4gQmVzdCByZWdhcmRzDQo+Pj4gVGhvbWFzDQo+Pj4NCj4+Pj4gwqAvKioNCj4+
Pj4gwqAgKiBkbWFfYnVmX21hcF9zZXRfdmFkZHIgLSBTZXRzIGEgZG1hLWJ1ZiBtYXBwaW5n
IHN0cnVjdHVyZSB0byBhbiANCj4+Pj4gYWRkcmVzcyBpbiBzeXN0ZW0gbWVtb3J5DQo+Pj4+
IMKgICogQG1hcDrCoMKgwqAgVGhlIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUNCj4+Pg0K
Pj4+IC0tIA0KPj4+IFRob21hcyBaaW1tZXJtYW5uDQo+Pj4gR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KPj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4+
IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4+IChIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCj4+PiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+
Pg0KPj4NCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Rw0on2vsWNVSOyjdXQvrHDck--

--------------wrkStvEPag0Mu6brdyvA0nI1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHzqn0FAwAAAAAACgkQlh/E3EQov+Ba
UQ//Y9rvX2ubfy6HXJP+dB719uVMRVzF68mbf9tty43qVNVHMvfMfSgKMDMYJHXyHpD9tm4bgsIg
gP7fA7gyP+MLgG9qdUtuSizHcE+NNDept6NV4AVYUXTHXWKMtPANhVsW+8UMiyLfGWg2Vg0dOiNN
ShebkBRlDGRs3I+m3FYGpyIi6LpnVsmLAHMcN3p2/Dg1NALX6xmM8K9kaS2LQwIEGNFponRQ0z5R
BXd7ZttJHpBk5NJ2KC2WcMygQcE/s3F8WWi41zYq0sH2neRTUDmEjWdpkRL4iHoi342mKB3LM2Uc
47Bh+I1Fdgdto2k/tVgOtrfiN9Bo05H2GuHKhSPbkBPcZJf6RVzAnqsauHRIsEoeTcCEEHj7JS2L
6etQ0oBcycIyXpAzhqE49h7IK4bvhj46X4QJMYlsNQ2pcWP/DW4SWfCwIg1uM4jpgUW/VYSQLcah
/KSHyAjOVGM6VQUn2JvFr2GRMASM/i7ZX0MsvawPz0+jbZRkgRRO/ClDAlUSYJSOESWZX/+VrsED
tLpuZWgFxFCUzoep5HNcs2KlS6RxpB4wZsywAQfUUKeOBjOkRglmoe7MN/Wped0xOkG8LCV4RKrg
SRlEJCsUDWyLQYzqxdFVKDCERDjB087q4rTUOXUd4tC2WcdD+OnkAPumNYip+h56aWsZVK4K+MP3
Cs8=
=RPZb
-----END PGP SIGNATURE-----

--------------wrkStvEPag0Mu6brdyvA0nI1--

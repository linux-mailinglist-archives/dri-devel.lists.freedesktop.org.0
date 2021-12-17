Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2519478DD2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4184F10F4CF;
	Fri, 17 Dec 2021 14:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77CF10F4CF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 14:31:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 491CB1F389;
 Fri, 17 Dec 2021 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639751512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45lJW6QILgvVSzMr1foE0vB82no+Td5KuU3319yTv7M=;
 b=1rQbtTxnhFzhV6wTBiixVndYmfPpBeOhf6Onvz1/l/fJ8C/OJ6rDrIZWd+dA5yI4BewJPe
 W7Lb4nnNkZh+4i4pZyojnknFo7I5Zp1bjZUgXybwk4xfxnvKtmZWwD5avfhH7omprfRDyK
 Dh331NwH6+fSbEdjnS3N6oBAq6NWCRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639751512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45lJW6QILgvVSzMr1foE0vB82no+Td5KuU3319yTv7M=;
 b=QrNTPisCaxhp5Qf3QwnCJmtnYzby45xji+KaUKjs4OdUoFqzIfljr0q633681DcwbjgUnA
 jO63mCwaOSsqO5Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FFEE13E1C;
 Fri, 17 Dec 2021 14:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pKCwClifvGGeJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Dec 2021 14:31:52 +0000
Message-ID: <90a43cac-7029-d439-3735-86b4bf2607b7@suse.de>
Date: Fri, 17 Dec 2021 15:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 01/37] drm: Add drm_module_{pci,platform}_driver()
 helper macros
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211217003752.3946210-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TuP4NiKc1M9lQ1tXRHv24yZP"
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
--------------TuP4NiKc1M9lQ1tXRHv24yZP
Content-Type: multipart/mixed; boundary="------------aH9swzG0xgYiMw598HFrIVFd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <90a43cac-7029-d439-3735-86b4bf2607b7@suse.de>
Subject: Re: [PATCH v2 01/37] drm: Add drm_module_{pci,platform}_driver()
 helper macros
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-2-javierm@redhat.com>
In-Reply-To: <20211217003752.3946210-2-javierm@redhat.com>

--------------aH9swzG0xgYiMw598HFrIVFd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyLA0KDQpsb29rcyBnb29kIGFscmVhZHkuIFNvbWUgY29tbWVudHMgYXJlIGJl
bG93Lg0KDQpBbSAxNy4xMi4yMSB1bSAwMTozNyBzY2hyaWViIEphdmllciBNYXJ0aW5leiBD
YW5pbGxhczoNCj4gQWNjb3JkaW5nIHRvIGRpc2FibGUgRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQsIHRoZQ0KPiBub21vZGVzZXQgcGFyYW1ldGVy
IGNhbiBiZSB1c2VkIHRvIGRpc2FibGUga2VybmVsIG1vZGVzZXR0aW5nLg0KPiANCj4gRFJN
IGRyaXZlcnMgd2lsbCBub3QgcGVyZm9ybSBkaXNwbGF5LW1vZGUgY2hhbmdlcyBvciBhY2Nl
bGVyYXRlZCByZW5kZXJpbmcNCj4gYW5kIG9ubHkgdGhlIHN5c3RlbSBmcmFtZWJ1ZmZlciB3
aWxsIGJlIGF2YWlsYWJsZSBpZiBpdCB3YXMgc2V0LXVwLg0KPiANCj4gQnV0IG9ubHkgYSBm
ZXcgRFJNIGRyaXZlcnMgY3VycmVudGx5IGNoZWNrIGZvciBub21vZGVzZXQsIHNvIGxldCdz
IGFkZCB0d28NCj4gaGVscGVyIG1hY3JvcyB0aGF0IGNhbiBiZSB1c2VkIGJ5IERSTSBkcml2
ZXJzIGZvciBQQ0kgYW5kIHBsYXRmb3JtIGRldmljZXMNCj4gdG8gaGF2ZSBtb2R1bGUgaW5p
dCBmdW5jdGlvbnMgdGhhdCBjaGVja3MgaWYgdGhlIGRyaXZlcnMgY291bGQgYmUgbG9hZGVk
Lg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxq
YXZpZXJtQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiANCj4gKG5vIGNoYW5nZXMgc2luY2UgdjEp
DQo+IA0KPiAgIGluY2x1ZGUvZHJtL2RybV9kcnYuaCB8IDUwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaCBi
L2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KDQpJIHdvcmtlZCBvbiBhIHNpbWlsYXIgcGF0Y2gg
dG9kYXkgYW5kIGZvdW5kIHRoYXQgZHJtX2Rydi5oIGlzIGFjdHVhbGx5IA0Kbm90IGEgZ29v
ZCBwbGFjZS4gSGFsZiBvZiBEUk0gaW5jbHVkZXMgdGhpcyBmaWxlIGFuZCBub3cgaXQgYWxs
IGRlcGVuZHMgDQpvbiBsaW51eC9wY2kuaCBhbmQgbGludXgvcGxhdGZvcm0uaCAoYW5kIHBy
b2JhYmx5IG90aGVyIGxhdGVyKS4NCg0KSSBwcm9wb3NlIHRvIHB1dCB0aGUgbW9kdWxlIGhl
bHBlcnMgaW50byA8ZHJtL2RybV9tb2R1bGUuaD4gYW5kIGluY2x1ZGUgDQppdCB3aGVyZSBu
ZWNlc3NhcnkuDQoNCj4gaW5kZXggZjYxNTlhY2I4ODU2Li40MDAxZDczNDI4YzUgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPiArKysgYi9pbmNsdWRlL2RybS9k
cm1fZHJ2LmgNCj4gQEAgLTI5LDYgKzI5LDggQEANCj4gICANCj4gICAjaW5jbHVkZSA8bGlu
dXgvbGlzdC5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9pcnFyZXR1cm4uaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC9wY2kuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4NCj4gICANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4NCj4gICANCj4gQEAg
LTYwNCw0ICs2MDYsNTIgQEAgaW50IGRybV9kZXZfc2V0X3VuaXF1ZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lKTsNCj4gICANCj4gICBleHRlcm4gYm9vbCBk
cm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KHZvaWQpOw0KPiAgIA0KPiArLyoqDQo+ICsgKiBk
cm1fcGNpX3JlZ2lzdGVyX2RyaXZlcigpIC0gcmVnaXN0ZXIgYSBEUk0gZHJpdmVyIGZvciBQ
Q0kgZGV2aWNlcw0KPiArICogQGRydjogUENJIGRyaXZlciBzdHJ1Y3R1cmUNCj4gKyAqDQo+
ICsgKiBSZXR1cm5zIHplcm8gb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm5vIGNvZGUg
b24gZmFpbHVyZS4NCj4gKyAqLw0KPiArc3RhdGljIGlubGluZSBpbnQgZHJtX3BjaV9yZWdp
c3Rlcl9kcml2ZXIoc3RydWN0IHBjaV9kcml2ZXIgKmRydikNCg0KVGhpcyBzaG91bGQgYmUg
ZGVjbGFyZWQgYXMgX19pbml0LCBzbyBpdCBnb2VzIGludG8gYSBzZXBhcmF0ZSBzZWN0aW9u
IG9mIA0KdGhlIG1vZHVsZS4gSUlSQyB0aGUgcGFnZSBpbiB0aGUgaW5pdCBzZWN0aW9uIGFy
ZSByZWxlYXNlZCBhZnRlciB0aGUgDQptb2R1bGUgaGFzIGJlZW4gbG9hZGVkLg0KDQpJJ2Qg
ZWl0aGVyIG5vdCBkb2N1bWVudCB0aGUgcmVnaXN0ZXIgZnVuY3Rpb25zLCBvciBleHBsaWNp
dGx5IHNheSB0aGF0IA0KdGhlIG1vZHVsZSBtYWNyb3MgYXJlIHRoZSBwcmVmZXJyZWQgd2F5
IG9mIHVzaW5nIHRoZW0uDQoNCj4gK3sNCj4gKwlpZiAoZHJtX2Zpcm13YXJlX2RyaXZlcnNf
b25seSgpKQ0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKw0KPiArCXJldHVybiBwY2lfcmVn
aXN0ZXJfZHJpdmVyKGRydik7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogZHJtX21vZHVs
ZV9wY2lfZHJpdmVyKCkgLSBoZWxwZXIgbWFjcm8gZm9yIHJlZ2lzdGVyaW5nIGEgRFJNIFBD
SSBkcml2ZXINCg0KRG9jcyBmb3IgdGhlIF9fcGNpX2RyaXZlciBhcmd1bWVudA0KDQo+ICsg
Kg0KPiArICogSGVscGVyIG1hY3JvIGZvciBEUk0gUENJIGRyaXZlcnMgd2hpY2ggZG8gbm90
IGRvIGFueXRoaW5nIHNwZWNpYWwgaW4gdGhlaXINCj4gKyAqIG1vZHVsZSBpbml0L2V4aXQg
YW5kIGp1c3QgbmVlZCB0aGUgRFJNIHNwZWNpZmljIG1vZHVsZSBpbml0Lg0KPiArICovDQo+
ICsjZGVmaW5lIGRybV9tb2R1bGVfcGNpX2RyaXZlcihfX3BjaV9kcml2ZXIpIFwNCj4gKwlt
b2R1bGVfZHJpdmVyKF9fcGNpX2RyaXZlciwgZHJtX3BjaV9yZWdpc3Rlcl9kcml2ZXIsIFwN
Cj4gKwkJICAgICAgcGNpX3VucmVnaXN0ZXJfZHJpdmVyKQ0KPiArDQo+ICsvKioNCj4gKyAq
IGRybV9wbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIgLSByZWdpc3RlciBhIERSTSBkcml2ZXIg
Zm9yIHBsYXRmb3JtIGRldmljZXMNCj4gKyAqIEBkcnY6IHBsYXRmb3JtIGRyaXZlciBzdHJ1
Y3R1cmUNCj4gKyAqDQo+ICsgKiBSZXR1cm5zIHplcm8gb24gc3VjY2VzcyBvciBhIG5lZ2F0
aXZlIGVycm5vIGNvZGUgb24gZmFpbHVyZS4NCj4gKyAqLw0KPiArc3RhdGljIGlubGluZSBp
bnQgZHJtX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcihzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
ICpkcnYpDQoNCg0KPiArew0KPiArCWlmIChkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkp
DQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiArDQo+ICsJcmV0dXJuIHBsYXRmb3JtX2RyaXZl
cl9yZWdpc3RlcihkcnYpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGRybV9tb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKCkgLSBoZWxwZXIgbWFjcm8gZm9yIHJlZ2lzdGVyaW5nIGEgRFJN
IHBsYXRmb3JtIGRyaXZlcg0KDQpEb2NzIGZvciB0aGUgX19wbGF0Zm9ybV9kcml2ZXIgYXJn
dW1lbnQNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiArICoNCj4gKyAqIEhlbHBlciBt
YWNybyBmb3IgRFJNIHBsYXRmb3JtIGRyaXZlcnMgd2hpY2ggZG8gbm90IGRvIGFueXRoaW5n
IHNwZWNpYWwgaW4gdGhlaXINCj4gKyAqIG1vZHVsZSBpbml0L2V4aXQgYW5kIGp1c3QgbmVl
ZCB0aGUgRFJNIHNwZWNpZmljIG1vZHVsZSBpbml0Lg0KPiArICovDQo+ICsjZGVmaW5lIGRy
bV9tb2R1bGVfcGxhdGZvcm1fZHJpdmVyKF9fcGxhdGZvcm1fZHJpdmVyKSBcDQo+ICsJbW9k
dWxlX2RyaXZlcihfX3BsYXRmb3JtX2RyaXZlciwgZHJtX3BsYXRmb3JtX2RyaXZlcl9yZWdp
c3RlciwgXA0KPiArCQkgICAgICBwbGF0Zm9ybV9kcml2ZXJfdW5yZWdpc3RlcikNCj4gKw0K
PiAgICNlbmRpZg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------aH9swzG0xgYiMw598HFrIVFd--

--------------TuP4NiKc1M9lQ1tXRHv24yZP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG8n1cFAwAAAAAACgkQlh/E3EQov+Au
0xAAynY3FgbhNNvCZXAJf7MY+FdQAlLNhYfhWwBn1NfVOU+JOaDG2nzESIsVWk1GTdCdtQZCjOmZ
20KSh0KJXsCR8fC8GhiJimA71UUJrLueUWu3Vn4tHksNjmYIFLcdZWyXRcgHJg/3Tqxy9E4Q200M
x0uYyCWtsPX1TVJxwzse3maHCYZ2B5BaAyvDL3YQtBSgwoq3RY7Zr2T8VJ55UDFQPBvwXObvrh+4
CAlDDQOygiUxM+gpsWse0ojpSmz1BWcgE3y/VQDgspnsPANeOVZstmclLZS0oMJXRDdm0gK4AZd9
mimJ+Q/0FkP6QPUFNblW0K441GzQvvDpBG65pTB8Yv1XR7Uo2QM2RMF7rlkoxrZVcu1K/NVSj9DT
MMqcNC60H4mHgNOJkJs8pBD1TvZkHkY5txadtYE85UY2dMbfwwI+8HAgOimr+GY5tnIn0gfY4lqR
z/X5gwH+FF5w0yi7ZFRNs0E5meI0Cfgk7QdfNKzvHYEc46Kx9tJUpbCoxFELQyNzlHeHDXHT/8YY
cj12FAYfgg8Ejl1O+0a9cn1s2Y75N6lmHuzk0b0EZU6rwOhyYmGDnIDcCXf5+VN0JdWx92KWCP+/
ivKEV7xbiHSNqVEYVEMpnca3QrerBDQXotfvq57UIxm7w4zD7WB8kIYnwcYD1WqNtdcBLFpxKyiX
O50=
=cZEP
-----END PGP SIGNATURE-----

--------------TuP4NiKc1M9lQ1tXRHv24yZP--

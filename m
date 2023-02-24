Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C86A1799
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 08:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DE810E598;
	Fri, 24 Feb 2023 07:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE310E762
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 07:58:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D43C600CA;
 Fri, 24 Feb 2023 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677225518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+XL6FLxQtkjJ1WBSr5UPWBVPoTKqCX8KTzWgDTiV2As=;
 b=WQvvkp4/JB+hsVbJg5HjleSVKb/ljvVsGKAzy8+HKrn7lersRHNh2PfZQpQu6gp53W3XEl
 X6gEpoc5gQUfjRoo3KN4YbWhf760Gin1oSfLZ6025c0qBDMdXG34aB1oWMZk7KAu/+Q93C
 FWF8RILtJ7ee+AZHh8H5H1XvBvdDK2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677225518;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+XL6FLxQtkjJ1WBSr5UPWBVPoTKqCX8KTzWgDTiV2As=;
 b=t9oUQ9WUwxu8SstDSxDF1rW609dMKmJpslhZ0aFgnSYSbD0vcTQr/5exC9iQ9ZMp/8jdGD
 nkWR8kmqWfa3rmCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3A8F13246;
 Fri, 24 Feb 2023 07:58:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /MpyOi1u+GNdCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Feb 2023 07:58:37 +0000
Message-ID: <564018a1-fb6d-3d7f-c326-167e772530a5@suse.de>
Date: Fri, 24 Feb 2023 08:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
To: kernel test robot <lkp@intel.com>, patrik.r.jakobsson@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230223121733.12549-7-tzimmermann@suse.de>
 <202302240250.JspOgN9W-lkp@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <202302240250.JspOgN9W-lkp@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------23QHS5JG59GSK0UjNwPUQoNx"
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------23QHS5JG59GSK0UjNwPUQoNx
Content-Type: multipart/mixed; boundary="------------9cRGW00rJ23zeQQiBpW1wqu1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <lkp@intel.com>, patrik.r.jakobsson@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Message-ID: <564018a1-fb6d-3d7f-c326-167e772530a5@suse.de>
Subject: Re: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
References: <20230223121733.12549-7-tzimmermann@suse.de>
 <202302240250.JspOgN9W-lkp@intel.com>
In-Reply-To: <202302240250.JspOgN9W-lkp@intel.com>

--------------9cRGW00rJ23zeQQiBpW1wqu1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TWlzc2luZyAnc3RhdGljIGlubGluZScuIFdpbGwgYmUgZml4ZWQgaW4gbmV4dCByZXYuDQoN
CkFtIDIzLjAyLjIzIHVtIDIwOjAxIHNjaHJpZWIga2VybmVsIHRlc3Qgcm9ib3Q6DQo+IEhp
IFRob21hcywNCj4gDQo+IEkgbG92ZSB5b3VyIHBhdGNoISBQZXJoYXBzIHNvbWV0aGluZyB0
byBpbXByb3ZlOg0KPiANCj4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIGxpbnVzL21h
c3Rlcl0NCj4gW2Nhbm5vdCBhcHBseSB0byBkcm0tbWlzYy9kcm0tbWlzYy1uZXh0IHY2LjIg
djYuMi1yYzggdjYuMi1yYzcgbmV4dC0yMDIzMDIyMyB2Ni4yIG5leHQtMjAyMzAyMjNdDQo+
IFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5k
bHkgZHJvcCB1cyBhIG5vdGUuDQo+IEFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1
Z2dlc3QgdG8gdXNlICctLWJhc2UnIGFzIGRvY3VtZW50ZWQgaW4NCj4gaHR0cHM6Ly9naXQt
c2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0N
Cj4gDQo+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgv
Y29tbWl0cy9UaG9tYXMtWmltbWVybWFubi9kcm0tZ21hNTAwLVJlbW92ZS11bm5lY2Vzc2Fy
eS1pbmNsdWRlLXN0YXRlbWVudHMvMjAyMzAyMjMtMjAyMjA1DQo+IHBhdGNoIGxpbms6ICAg
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzAyMjMxMjE3MzMuMTI1NDktNy10emlt
bWVybWFubiU0MHN1c2UuZGUNCj4gcGF0Y2ggc3ViamVjdDogW1BBVENIIDYvN10gZHJtL2dt
YTUwMDogSW1wbGVtZW50IGNsaWVudC1iYXNlZCBmYmRldiBlbXVsYXRpb24NCj4gY29uZmln
OiBpMzg2LXJhbmRjb25maWctYTAwNCAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1j
aS9hcmNoaXZlLzIwMjMwMjI0LzIwMjMwMjI0MDI1MC5Kc3BPZ045Vy1sa3BAaW50ZWwuY29t
L2NvbmZpZykNCj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMTQuMC42IChodHRwczovL2dp
dGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgZjI4YzAwNmE1ODk1ZmMwZTMyOWZlMTVmZWFk
ODFlMzc0NTdjYjFkMSkNCj4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKToNCj4g
ICAgICAgICAgd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwv
bGtwLXRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcw0K
PiAgICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzDQo+ICAgICAgICAgICMgaHR0
cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0L2QxYzk4NGFmMjll
MGM1MjE5ZDM1M2E0NzcyNTI3ZDIzM2QxYzFiY2MNCj4gICAgICAgICAgZ2l0IHJlbW90ZSBh
ZGQgbGludXgtcmV2aWV3IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4
DQo+ICAgICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXgtcmV2aWV3IFRob21hcy1a
aW1tZXJtYW5uL2RybS1nbWE1MDAtUmVtb3ZlLXVubmVjZXNzYXJ5LWluY2x1ZGUtc3RhdGVt
ZW50cy8yMDIzMDIyMy0yMDIyMDUNCj4gICAgICAgICAgZ2l0IGNoZWNrb3V0IGQxYzk4NGFm
MjllMGM1MjE5ZDM1M2E0NzcyNTI3ZDIzM2QxYzFiY2MNCj4gICAgICAgICAgIyBzYXZlIHRo
ZSBjb25maWcgZmlsZQ0KPiAgICAgICAgICBta2RpciBidWlsZF9kaXIgJiYgY3AgY29uZmln
IGJ1aWxkX2Rpci8uY29uZmlnDQo+ICAgICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0k
SE9NRS8wZGF5IENPTVBJTEVSPWNsYW5nIG1ha2UuY3Jvc3MgVz0xIE89YnVpbGRfZGlyIEFS
Q0g9aTM4NiBvbGRkZWZjb25maWcNCj4gICAgICAgICAgQ09NUElMRVJfSU5TVEFMTF9QQVRI
PSRIT01FLzBkYXkgQ09NUElMRVI9Y2xhbmcgbWFrZS5jcm9zcyBXPTEgTz1idWlsZF9kaXIg
QVJDSD1pMzg2IFNIRUxMPS9iaW4vYmFzaCBkcml2ZXJzL2dwdS8NCj4gDQo+IElmIHlvdSBm
aXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgd2hlcmUgYXBwbGljYWJs
ZQ0KPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4N
Cj4gfCBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMw
MjI0MDI1MC5Kc3BPZ045Vy1sa3BAaW50ZWwuY29tLw0KPiANCj4gQWxsIHdhcm5pbmdzIChu
ZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiAgICAgSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvYmFja2xpZ2h0LmM6MTQ6DQo+Pj4gZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2Lmg6NjIwOjY6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3IgZnVuY3Rpb24gJ3BzYl9mYmRldl9zZXR1cCcgWy1XbWlzc2luZy1w
cm90b3R5cGVzXQ0KPiAgICAgdm9pZCBwc2JfZmJkZXZfc2V0dXAoc3RydWN0IGRybV9wc2Jf
cHJpdmF0ZSAqZGV2X3ByaXYpDQo+ICAgICAgICAgIF4NCj4gICAgIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2Rydi5oOjYyMDoxOiBub3RlOiBkZWNsYXJlICdzdGF0aWMnIGlmIHRo
ZSBmdW5jdGlvbiBpcyBub3QgaW50ZW5kZWQgdG8gYmUgdXNlZCBvdXRzaWRlIG9mIHRoaXMg
dHJhbnNsYXRpb24gdW5pdA0KPiAgICAgdm9pZCBwc2JfZmJkZXZfc2V0dXAoc3RydWN0IGRy
bV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYpDQo+ICAgICBeDQo+ICAgICBzdGF0aWMNCj4gICAg
IDEgd2FybmluZyBnZW5lcmF0ZWQuDQo+IC0tDQo+ICAgICBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfaXJxLmM6MTU6DQo+Pj4gZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9wc2JfZHJ2Lmg6NjIwOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3IgZnVuY3Rpb24gJ3BzYl9mYmRldl9zZXR1cCcgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQ0KPiAgICAgdm9pZCBwc2JfZmJkZXZfc2V0dXAoc3RydWN0IGRybV9wc2JfcHJp
dmF0ZSAqZGV2X3ByaXYpDQo+ICAgICAgICAgIF4NCj4gICAgIGRyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvcHNiX2Rydi5oOjYyMDoxOiBub3RlOiBkZWNsYXJlICdzdGF0aWMnIGlmIHRoZSBm
dW5jdGlvbiBpcyBub3QgaW50ZW5kZWQgdG8gYmUgdXNlZCBvdXRzaWRlIG9mIHRoaXMgdHJh
bnNsYXRpb24gdW5pdA0KPiAgICAgdm9pZCBwc2JfZmJkZXZfc2V0dXAoc3RydWN0IGRybV9w
c2JfcHJpdmF0ZSAqZGV2X3ByaXYpDQo+ICAgICBeDQo+ICAgICBzdGF0aWMNCj4gICAgIGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2lycS5jOjM1OjE5OiB3YXJuaW5nOiB1bnVzZWQg
ZnVuY3Rpb24gJ2dtYV9waXBlX2V2ZW50JyBbLVd1bnVzZWQtZnVuY3Rpb25dDQo+ICAgICBz
dGF0aWMgaW5saW5lIHUzMiBnbWFfcGlwZV9ldmVudChpbnQgcGlwZSkNCj4gICAgICAgICAg
ICAgICAgICAgICAgIF4NCj4gICAgIDIgd2FybmluZ3MgZ2VuZXJhdGVkLg0KPiANCj4gDQo+
IHZpbSArL3BzYl9mYmRldl9zZXR1cCArNjIwIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNi
X2Rydi5oDQo+IA0KPiAgICAgNjEwCQ0KPiAgICAgNjExCS8qIGZyYW1lYnVmZmVyICovDQo+
ICAgICA2MTIJZXh0ZXJuIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKnBzYl9mcmFtZWJ1ZmZl
cl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAgIDYxMwkJCQkJCQkgICAg
ICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQsDQo+ICAgICA2MTQJ
CQkJCQkJICAgICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPiAgICAgNjE1CQ0K
PiAgICAgNjE2CS8qIGZiZGV2ICovDQo+ICAgICA2MTcJI2lmIGRlZmluZWQoQ09ORklHX0RS
TV9GQkRFVl9FTVVMQVRJT04pDQo+ICAgICA2MTgJdm9pZCBwc2JfZmJkZXZfc2V0dXAoc3Ry
dWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYpOw0KPiAgICAgNjE5CSNlbHNlDQo+ICAg
PiA2MjAJdm9pZCBwc2JfZmJkZXZfc2V0dXAoc3RydWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2
X3ByaXYpDQo+ICAgICA2MjEJeyB9DQo+ICAgICA2MjIJI2VuZGlmDQo+ICAgICA2MjMJDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------9cRGW00rJ23zeQQiBpW1wqu1--

--------------23QHS5JG59GSK0UjNwPUQoNx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP4bi0FAwAAAAAACgkQlh/E3EQov+DB
Vw/8Cx7s8AmWX0IVrpbXRCfZliZDtk4/gs3lObgjuFMpRnWoAsSCR8DVh5mWgFVbi+RuxZh3GMgk
JTKrVRRpDwdZNMzUA/wK1YdLOFqRV64XZN5+O1q5XWU+hlhJEcu5jUNJmPy8Ren2QRe63/DX1ZwB
uT7sr64nWBaz3VI2HUhu4N0qFCdYnTzC5aH4eYEkSKqQCZKnmkQASgO2YCkS5wy0To+tvHsPlt2B
zon/TRmp/ZSd/nshiw5tiM/ts/G9CWrSfBulcChZNUPfQEiNIFCNHdsgw+vfJ1OFiUvhvcHq9qZX
sUPPAg1NKKT71g3xl7HlK1llJDPwerMzdErMB4serUMbLTB+gfQqA3JFJuYnx37nf8sc3UuaaLk7
q4kt3ahPMM5ovosZ1aTUWZItI+1E1YF7aKWOGpzMY7CNxP2A1TtDcLOsg1rG4ImIHhCNj6ueWCAq
VpX9BDmk0amwESi9LnxMwZhLRdAYjIorQm7w9/yzESX6WFGUhndiHq1Vq9O6jFHXz3ABXoXdb6AK
bwTs3Tz2uXiIVoXxic+NkCRkhMZOOFb4GnJ4YOfayevhZgErpH7KyAar1DVmf03Jug1+IFDMQnDz
yaeBJyWS7UpZzU4PJjdWuX8oYoFaEobM8Q9MJe0eSvUF281D0R964gPZSo5qgi+SjxNOZNkn9PAA
Ykk=
=1nVO
-----END PGP SIGNATURE-----

--------------23QHS5JG59GSK0UjNwPUQoNx--

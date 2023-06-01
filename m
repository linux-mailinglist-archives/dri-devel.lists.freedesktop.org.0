Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D9B7195F4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 10:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CB210E23A;
	Thu,  1 Jun 2023 08:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC22310E23A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 08:47:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F4C41FD99;
 Thu,  1 Jun 2023 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685609260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BDeq38RUOMin/PkjVsrhZ8uiTdQv2mMlWrOcabynyVk=;
 b=trI/aEoHE2kLsgj5l7lkDDFHSBcBFpFTNGGl+rGENQgC3q+XA0qp8TPTD7BjYo7yVMsqYv
 QYlYtOA99mH8RjD+xKlWhSsy8YE+ZZglaQgPMZzVKP2R4v2kv4HMK8LJkZltdwJ6FZRk6n
 RULz5UvymWOIpxJK/CfqRCPL6Umew0E=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91D8B13441;
 Thu,  1 Jun 2023 08:47:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7vf9IStbeGSGDwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 01 Jun 2023 08:47:39 +0000
Message-ID: <cfd19da7-4148-f277-0cf8-507b94d214a3@suse.com>
Date: Thu, 1 Jun 2023 10:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
 <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
In-Reply-To: <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QcBtiFiqJ0i63ixS6jXHetfJ"
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
Cc: x86@kernel.org, Yu Zhao <yuzhao@google.com>,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, drm-intel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Ingo Molnar <mingo@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QcBtiFiqJ0i63ixS6jXHetfJ
Content-Type: multipart/mixed; boundary="------------Ls1P0J0XwN0b7SxPhQt0DXJs";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 drm-intel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <cfd19da7-4148-f277-0cf8-507b94d214a3@suse.com>
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
 <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>
In-Reply-To: <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>

--------------Ls1P0J0XwN0b7SxPhQt0DXJs
Content-Type: multipart/mixed; boundary="------------P1mVkZbvlERsJpfmP9qOuaTS"

--------------P1mVkZbvlERsJpfmP9qOuaTS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDUuMjMgMjA6MTQsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gRnJpLCBN
YXkgMTksIDIwMjMgYXQgMDg6MzY6MzRQTSArMDIwMCwgSmFudXN6IEtyenlzenRvZmlrIHdy
b3RlOg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPj4gaW5kZXggMTVhZTRkNmJhNDc2
OC4uNTY0NjZhZmQwNDMwNyAxMDA2NDQNCj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BndGFibGUuaA0KPj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+
PiBAQCAtNjU0LDggKzY1NCwxMCBAQCBzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9tb2RpZnko
cG1kX3QgcG1kLCBwZ3Byb3RfdCBuZXdwcm90KQ0KPj4gICAjZGVmaW5lIHBncHJvdF9tb2Rp
ZnkgcGdwcm90X21vZGlmeQ0KPj4gICBzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJvdF9t
b2RpZnkocGdwcm90X3Qgb2xkcHJvdCwgcGdwcm90X3QgbmV3cHJvdCkNCj4+ICAgew0KPj4g
LQlwZ3Byb3R2YWxfdCBwcmVzZXJ2ZWJpdHMgPSBwZ3Byb3RfdmFsKG9sZHByb3QpICYgX1BB
R0VfQ0hHX01BU0s7DQo+PiAtCXBncHJvdHZhbF90IGFkZGJpdHMgPSBwZ3Byb3RfdmFsKG5l
d3Byb3QpICYgfl9QQUdFX0NIR19NQVNLOw0KPj4gKwl1bnNpZ25lZCBsb25nIG1hc2sgPSBf
UEFHRV9DSEdfTUFTSyB8IF9QQUdFX0NBQ0hFX01BU0s7DQo+PiArDQo+PiArCXBncHJvdHZh
bF90IHByZXNlcnZlYml0cyA9IHBncHJvdF92YWwob2xkcHJvdCkgJiBtYXNrOw0KPj4gKwlw
Z3Byb3R2YWxfdCBhZGRiaXRzID0gcGdwcm90X3ZhbChuZXdwcm90KSAmIH5tYXNrOw0KPj4g
ICAJcmV0dXJuIF9fcGdwcm90KHByZXNlcnZlYml0cyB8IGFkZGJpdHMpOw0KPj4gICB9DQo+
PiAgIA0KPj4gLS0gDQo+IA0KPiBUaGlzIGNlcnRhaW5seSBuZWVkcyBKw7xyZ2VuIGFuZCBo
ZSdzIG9uIENDIGFscmVhZHksIG1vdmluZyBoaW0gdG8gVG86Lg0KPiANCj4gQWxzbywgd2h5
IGlzbid0IHRoaXMgYSBYZW4tc3BlY2lmaWMgZml4IGJ1dCB5b3UncmUga2VlcGluZyBfUEFH
RV9QQVQgZm9yDQo+IGJhcmVtZXRhbCB0b28sIGkuZS4sIG1vZGlmeWluZyB0aGUgZ2VuZXJp
YyBmdW5jdGlvbj8NCj4gDQoNCkFzIGRlc2NyaWJlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Us
IHRoaXMgb25seSB3b3JrcyBvbiBiYXJlIG1ldGFsIGR1ZSB0byB0aGUNClBBVCBiaXQgbm90
IGJlaW5nIG5lZWRlZCBmb3IgV0MgbWFwcGluZ3MuDQoNCk1ha2luZyB0aGlzIHBhdGNoIFhl
biBzcGVjaWZpYyB3b3VsZCB0cnkgdG8gY3VyZSB0aGUgc3ltcHRvbXMgd2l0aG91dCBmaXhp
bmcNCnRoZSB1bmRlcmx5aW5nIHByb2JsZW06IF9QQUdFX1BBVCBzaG91bGQgYmUgcmVnYXJk
ZWQgdGhlIHNhbWUgd2F5IGFzIHRoZSBiaXRzDQpmb3IgY2FjaGluZyBtb2RlIChfUEFHRV9D
SEdfTUFTSykuDQoNCkluIGNhc2UgYSBXUCBvciBXVCBtYXBwZWQgbWVtb3J5IGFyZWEgd291
bGQgYmUgbW1hcCgpLWVkIG9uIGJhcmUgbWV0YWwsIHRoZQ0KcmVzdWx0IHdvdWxkIGJlIGEg
V0Mgb3IgVUMgbWFwcGVkIG1lbW9yeSBhcmVhIGluIHVzZXJsYW5kLiBUaGlzIGlzbid0IGFz
DQpwcm9ibGVtYXRpYyBhcyB0aGUgY2FzZSB1bmRlciBYZW4sIGJ1dCBpdCBzdGlsbCByZXN1
bHRzIGluIHdvcnNlIHBlcmZvcm1hbmNlDQp0aGFuIG5lY2Vzc2FyeS4NCg0KSU9XOg0KDQpB
Y2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4N
Cg==
--------------P1mVkZbvlERsJpfmP9qOuaTS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------P1mVkZbvlERsJpfmP9qOuaTS--

--------------Ls1P0J0XwN0b7SxPhQt0DXJs--

--------------QcBtiFiqJ0i63ixS6jXHetfJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmR4WysFAwAAAAAACgkQsN6d1ii/Ey/6
kQf/WdC8lFPRqusUZY+x7CjdFNyC/amAKRAyH7uofa2wcRq3Tb2XCNXvdr9r4rvnds2rU/traKab
LZ9jbBqYOs16XiOqfbkOvpDZ+XBfV4vFFU+aQSr4OibB041z6ZPw0f/1Y3oFD2dafiiAvx4vQWm3
iebN0VPEV4FFmlCxRmdPyapgOukJho+sf9TQ5L0HR9bJyRM6VocNE6PnsIa2h0tcqRCzjbQVQNI9
NpyJ3a1IpKXOwpsP8XDNcx6pyL/Jo/UzqoXPTKDRWf8hewH2tUeuiJDAFE28S3dngLdrkAxX2MgM
IVuWYhLvJkPWRVszr7jJ8Gd94qQCFKjuDjwcT+G4WQ==
=ezXv
-----END PGP SIGNATURE-----

--------------QcBtiFiqJ0i63ixS6jXHetfJ--

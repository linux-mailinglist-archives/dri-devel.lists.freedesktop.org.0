Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFAF67BAFB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A0B10E0FB;
	Wed, 25 Jan 2023 19:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0EF10E0FB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 19:47:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6016321CD3;
 Wed, 25 Jan 2023 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674676078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bA9V/wSpYBYcY1VAPKSg9VbVizfkWm43W+AxSJ9B8tk=;
 b=BoPq+UxELHLVyFF2vEHHDZteiRSYuYAZXakrrxl5i7QFBTnZsKhGRu1m6UvzP/v67OZdSP
 Tj7De3UMC6NtoRxW9N+0lhbsU2IMLr+dfzMfRWgQPjYw+qe96zsE71B0FrWHlx0zfB8Nsy
 DLeeKdtsfXDgCxBBlU64hUKO/meAc9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674676078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bA9V/wSpYBYcY1VAPKSg9VbVizfkWm43W+AxSJ9B8tk=;
 b=u7jPaMlYJkFar3/UKqR6mEnu6L9BsJxy22sdyly34R/Bpp6RfAoQrvywMjhGfGAdzfxOmK
 Ir3sK/wcTTJKHGDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D6261339E;
 Wed, 25 Jan 2023 19:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R4F3CW6H0WOwcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 19:47:58 +0000
Message-ID: <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
Date: Wed, 25 Jan 2023 20:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G6nGRDtFoBwFvdnXTsRyW3gi"
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, "Slivka,
 Danijel" <Danijel.Slivka@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G6nGRDtFoBwFvdnXTsRyW3gi
Content-Type: multipart/mixed; boundary="------------T6xMw9lyN0UwYH15JHgKz87f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
Subject: Re: Amdgpu module is references even after unbinding the vtcon
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
In-Reply-To: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>

--------------T6xMw9lyN0UwYH15JHgKz87f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuDQoNCkFtIDI0LjAxLjIzIHVtIDE1OjEyIHNjaHJpZWIgQ2hyaXN0aWFu
IEvDtm5pZzoNCj4gSGkgVGhvbWFzLA0KPiANCj4gd2UgcmFuIGludG8gYSBwcm9ibGVtIHdp
dGggdGhlIGdlbmVyYWwgZmJjb24vZmJkZXYgaW1wbGVtZW50YXRpb24gYW5kIA0KPiB0aG91
Z2ggdGhhdCB5b3UgbWlnaHQgaGF2ZSBzb21lIGlkZWEuDQo+IA0KPiBXaGF0IGhhcHBlbnMg
aXMgdGhlIGZvbGxvd2luZzoNCj4gMS4gV2UgbG9hZCBhbWRncHUgYW5kIGdldCBvdXIgbm9y
bWFsIGZiY29uLg0KPiAyLiBmYmNvbiBhbGxvY2F0ZXMgYSBkdW1wIEJPIGFzIGJhY2tpbmcg
c3RvcmUgZm9yIHRoZSBjb25zb2xlLg0KPiAzLiBHRE0vWC9BcHBsaWNhdGlvbnMgc3RhcnQs
IG5ldyBmcmFtZWJ1ZmZlcnMgYXJlIGNyZWF0ZWQgQk9zIGltcG9ydGVkLCANCj4gZXhwb3J0
ZWQgZXRjLi4uDQo+IDQuIFNvbWVob3cgWCBvciBHRE0gaXRlcmF0ZWQgb3ZlciBhbGwgdGhl
IGZyYW1lYnVmZmVyIG9iamVjdHMgdGhlIA0KPiBrZXJuZWxzIGtub3dzIGFib3V0IGFuZCBl
eHBvcnQgdGhlbSBhcyBETUEtYnVmLg0KPiA1LiBBcHBsaWNhdGlvbi9YL0dETSBhcmUgc3Rv
cHBlZCwgaGFuZGxlcyBjbG9zZWQsIGZyYW1lYnVmZmVycyByZWxlYXNlZCANCj4gZXRjLi4u
DQo+IDYuIFdlIHVuYmluZCB2dGNvbi4NCj4gDQo+IEF0IHRoaXMgcG9pbnQgdGhlIGFtZGdw
dSBtb2R1bGUgdXN1YWxseSBoYXMgYSByZWZlcmVuY2UgY291bnQgb2YgMCBhbmQgDQo+IGNh
biBiZSB1bmxvYWRlZCwgYnV0IHNpbmNlIEdETS9YL1dob2V2ZXIgaXRlcmF0ZWQgb3ZlciBh
bGwgdGhlIGtub3duIA0KPiBmcmFtZWJ1ZmZlcnMgYW5kIGV4cG9ydGVkIHRoZW0gYXMgRE1B
LWJ1ZiAoZm9yIHdoYXRldmVyIHJlYXNvbiBpZGspIHdlIA0KPiBub3cgc3RpbGwgaGF2ZSBh
biBleHBvcnRlZCBETUEtYnVmIGFuZCB3aXRoIGl0IGEgcmVmZXJlbmNlIHRvIHRoZSBtb2R1
bGUuDQo+IA0KPiBBbnkgaWRlYSBob3cgd2UgY291bGQgcHJldmVudCB0aGF0Pw0KDQpIZXJl
J3MgYW5vdGhlciBzdGFiIGluIHRoZSBkYXJrLg0KDQpUaGUgYmlnIGRpZmZlcmVuY2UgYmV0
d2VlbiBvbGQtc3R5bGUgZmJkZXYgYW5kIHRoZSBuZXcgb25lIGlzIHRoYXQgdGhlIA0Kb2xk
IGZiZGV2IHNldHVwIChlLmcuLCByYWRlb24pIGFsbG9jYXRlcyBhIEdFTSBvYmplY3QgYW5k
IHB1dHMgdG9nZXRoZXIgDQp0aGUgZmJkZXYgZGF0YSBzdHJ1Y3R1cmVzIGZyb20gdGhlIEJP
IGluIGEgZmFpcmx5IGhhY2tpc2ggd2F5LiBUaGUgbmV3IA0Kc3R5bGUgdXNlcyBhbiBpbi1r
ZXJuZWwgY2xpZW50IHdpdGggYSBmaWxlIHRvIGFsbG9jYXRlIHRoZSBCTyB2aWEgZHVtYiAN
CmJ1ZmZlcnM7IGFuZCBob2xkcyBhIHJlZmVyZW5jZSB0byB0aGUgRFJNIG1vZHVsZS4NCg0K
TWF5YmUgdGhlIHJlZmVyZW5jZSBjb21lcyBmcm9tIHRoZSBpbi1rZXJuZWwgRFJNIGNsaWVu
dCBpdHNlbGYuIFsxXSANCkNoZWNrIGlmIHRoZSBjbGllbnQgcmVzb3VyY2VzIGdldCByZWxl
YXNlZCBbMl0gd2hlbiB5b3UgdW5iaW5kIHZ0Y29uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291
cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMjTDg3DQpbMl0gDQpodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9k
cm1fY2xpZW50LmMjTDE2MA0KDQo+IA0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4NCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------T6xMw9lyN0UwYH15JHgKz87f--

--------------G6nGRDtFoBwFvdnXTsRyW3gi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPRh20FAwAAAAAACgkQlh/E3EQov+Be
1g/+K/qXB0YpA6DZfoZbZDTXXPAaqRwOaf9WvA27FohMx/vgsaWjfyYZdCBn0Ojq+q+bRuI3WPoC
aTPGbMLtWnZ1ErhBmOx1g0pBEEnLvWYDbGv5FakW0+9OUPsvKOZ8khkWYWbyeEgRYd5615u2eQ6J
F57F5lBN8QUS7IT15mkjFVDJhEVlnicba1SB6ESn1Ner7LXTq4diZKqvurCE1xKyIUVocVUN2QqI
HmdSenKPc9M8jwYs5WW/luoCSQjA6dpMjdO9V8U+AjcltjO+pGwgTc+k+C3uLcOsHD4rH6KYmD1N
nrPuFeMtjefu0MF5r8a5Fj7vM0CyTrGjY8a0K0hhP0Ylf1+o5yCa68eU/1bKh765653jOXScM9Vz
F2LC43gACcAiGwWEOJoiSMAb7U0vqQGsrFI8QUK/WZIzHy91BoNlJw1s5LzUUXeuF3NCe2TGzhCZ
USpp+YEaZzpv3W6HFVaNjWdDN5SA8lhWehlPfUc5TlolFeoFwdYjcw+kAlXnK8QCuwm3vYu965bZ
5pZ5RYK1XhcGMFExpIXetbzgLzaYgQPW5SnahwOkC4O7TqrxdwI88I2MDYPT3v1Pluc6Kpjz8gnm
7i6D+nMchVaH7CEmBljSNKdSWRRsVzwtH1KsYjwZ/FtOgB2dHQoe4+KxOUAxty0EorzCf2HXLbs8
NNU=
=R6Yh
-----END PGP SIGNATURE-----

--------------G6nGRDtFoBwFvdnXTsRyW3gi--

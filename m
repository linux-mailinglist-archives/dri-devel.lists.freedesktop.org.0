Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B792551503
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEDA10E6E6;
	Mon, 20 Jun 2022 09:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1FA10E6E6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:57:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 61A3621B88;
 Mon, 20 Jun 2022 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655719053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YC2JVBdJAjfx3gHaZNlOufsJUq3L01oecLEhj3AZKzM=;
 b=GsrQOLHZOxfE1DfYRYf8A+VRCc+8yCsP2UXkSC92SSl4owEs/cRU+qbNQY5XHD1M0RqrVh
 CIhLe9XFQALL89WpweWVNoRghADZ4WZxEuUvUcu9nuutsKewodVUva0860TAzTKcVif1fn
 HsL3tixx08Ap9KXJ3oNykneZmBEuAeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655719053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YC2JVBdJAjfx3gHaZNlOufsJUq3L01oecLEhj3AZKzM=;
 b=/VBA3grENnhucqQ0KnA0XcV2h+ktYvtSAvhmJr94+oCvyHvhkYuWEcwhMXY9mQndjVaH28
 fhKDr0swKSa8eNDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E44B134CA;
 Mon, 20 Jun 2022 09:57:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fUQZEo1EsGICUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 09:57:33 +0000
Message-ID: <51f23c0b-8f90-129f-7ef4-e5b8f1e5484b@suse.de>
Date: Mon, 20 Jun 2022 11:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: DRM FB interface does not sanitize len when mmap'ed
Content-Language: en-US
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>
References: <CAEXMXLS9jD_gvPzZ4xBJ9wOY9sbJLDdLLpYOFk0Wt2s1RStv5w@mail.gmail.com>
 <9096beed-91e2-05d3-c5a0-fee9f65d972f@suse.de>
 <CAEXMXLRGFuQE=2SNaO8HUtc93RG__AbJ+i7RzgNER9wc1zcb7Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAEXMXLRGFuQE=2SNaO8HUtc93RG__AbJ+i7RzgNER9wc1zcb7Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VXD0zISd2Kl8M9PJgADYFdNy"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VXD0zISd2Kl8M9PJgADYFdNy
Content-Type: multipart/mixed; boundary="------------uAV5ghw0HtYZAAt26V4QP05t";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <51f23c0b-8f90-129f-7ef4-e5b8f1e5484b@suse.de>
Subject: Re: DRM FB interface does not sanitize len when mmap'ed
References: <CAEXMXLS9jD_gvPzZ4xBJ9wOY9sbJLDdLLpYOFk0Wt2s1RStv5w@mail.gmail.com>
 <9096beed-91e2-05d3-c5a0-fee9f65d972f@suse.de>
 <CAEXMXLRGFuQE=2SNaO8HUtc93RG__AbJ+i7RzgNER9wc1zcb7Q@mail.gmail.com>
In-Reply-To: <CAEXMXLRGFuQE=2SNaO8HUtc93RG__AbJ+i7RzgNER9wc1zcb7Q@mail.gmail.com>

--------------uAV5ghw0HtYZAAt26V4QP05t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjIgdW0gMDE6MDEgc2NocmllYiBOdW5vIEdvbsOnYWx2ZXM6DQo+
IE9uIEZyaSwgSnVuIDE3LCAyMDIyIGF0IDEwOjI3IEFNIFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IENvdWxkIHlvdSBwbGVhc2UgdHJ5IHRo
ZSBhdHRhY2hlZCBwYXRjaD8gSXQncyBzaW1pbGFyIHRvIHlvdXIgc29sdXRpb24sDQo+PiBi
dXQgY2xvc2VyIHRvIHRoZSBvcmlnaW5hbCBpbnRlbnRpb24gb2YgdGhlIGNvZGUuDQo+IA0K
PiBXb3JrcyBmaW5lLg0KPiANCj4gVGVzdGVkLWJ5OiBOdW5vIEdvbsOnYWx2ZXMgPG51bm9q
cGdAZ21haWwuY29tPg0KDQpUaGFua3MsIEknbGwgcG9zdCB0aGUgcGF0Y2ggdG8gdGhlIGxp
c3QuDQoNCj4gDQo+IFRoYW5rcywNCj4gTnVubw0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------uAV5ghw0HtYZAAt26V4QP05t--

--------------VXD0zISd2Kl8M9PJgADYFdNy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwRIwFAwAAAAAACgkQlh/E3EQov+B6
QA//YCH1eXUZY+eGepgYKFgtqd1n3EZDJUVFpNapC57OIiZFzVPzECfsdDTLtx3agE+sYPnCo2hf
3LlF8iOZZzbyjdZipuu5IfA2X3HkFCeMK3fYEK48kbiSX7So82DtX7CrA9y7AD5ziaDzi4M/rs7w
rHydSR71Kl6XWt1ckzVEbSsmpoqjBmfLhG3FKHsq9hZqV/VtPW7EtbGu25+qakKHHpdRBwm66qRM
1eB81dET/RV6LuY7ynpCNyT4rDRmKz87TF908RQMOg6V+KsyqiZ6DynNjsD2zF9SFhDGqMsq3Lbu
9OWdY3I0BhMTTmOx6D9apI53AQWTNIfQoSqKV5ZDRnxOUhpswGqzNtyKJIkaFnjfKbJ+QjJngOA0
OYs7pmbR+cRDBJCDJqnea3qV2nejprmLhCxsI8FrH6w6U3hdch3P0vHIUbI1IkcwCLwynSMetiKZ
CFL5ApQx7jep0sG5vLN4GvCE92sLpenPYXB18kQAX37nzi9zJ8B+nSCGeN7z2TSG6uA1TW5IHXur
2WoZPHHrvYY+qQj7dvZqI/bA6TP6ibeZ2acVzwXXVbB0NpvxPS8AK0Z0Nehlx+N3UevHHwstUdeQ
xyG+/eRjC+0Xc4HtWgnJ9hZQ/U6NYHR5SncbzzsENKVMKNFpPjubuHiepp8mNpkYs96iX5OniRZY
nRQ=
=bavd
-----END PGP SIGNATURE-----

--------------VXD0zISd2Kl8M9PJgADYFdNy--

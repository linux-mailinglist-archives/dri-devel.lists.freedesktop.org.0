Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B105BDEED
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D98F10E250;
	Tue, 20 Sep 2022 07:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C05910E250
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:57:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D1E6421DAC;
 Tue, 20 Sep 2022 07:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663660655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzYmtefxGVuhLa8lSj3bJewhlKMpbQTikiyWdPvZpuw=;
 b=jO3dUHr1WkHnYK27gcfHOhxEAOPjXD1DUHhcHA8zD4dhuPYogRUwUxpPXyvsH+ByDHk33G
 bGsSpeGZF09I6bMzbbustmJzsXcu2VWujDfXJO9lHZFoWA9JlgyE5MV69H2nJUvyfuQmNf
 aNgXplTwDmW9kKMpH/kAt34wtO2nmPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663660655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzYmtefxGVuhLa8lSj3bJewhlKMpbQTikiyWdPvZpuw=;
 b=bwKfG1gnccr3YsmeeMHBFzvclM8i9PDbbtvvmZn1LuVaLg2Ardfhpxnwa+KaWKqRkFBUHP
 bKjIKhd1KApG4oAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA1B113ABB;
 Tue, 20 Sep 2022 07:57:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uN2jLG9yKWP6WgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 07:57:35 +0000
Message-ID: <16995c0f-c698-b1b0-0311-73882aef5f75@suse.de>
Date: Tue, 20 Sep 2022 09:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220914225809.763F.409509F4@e16-tech.com>
 <0bb98321-dc3d-8bb3-f7b1-eb09c617a1de@suse.de>
 <20220915224058.B32A.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220915224058.B32A.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zMnLnj0tZM3WSA9kqfx0nYxA"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zMnLnj0tZM3WSA9kqfx0nYxA
Content-Type: multipart/mixed; boundary="------------VkBrIsKFJCcjg3J0qXlKIAAD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <16995c0f-c698-b1b0-0311-73882aef5f75@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220914225809.763F.409509F4@e16-tech.com>
 <0bb98321-dc3d-8bb3-f7b1-eb09c617a1de@suse.de>
 <20220915224058.B32A.409509F4@e16-tech.com>
In-Reply-To: <20220915224058.B32A.409509F4@e16-tech.com>

--------------VkBrIsKFJCcjg3J0qXlKIAAD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDkuMjIgdW0gMTY6NDEgc2NocmllYiBXYW5nIFl1Z3VpOg0KPiBIaSwN
Cj4gDQo+PiBIaQ0KPj4NCj4+IEFtIDE0LjA5LjIyIHVtIDE2OjU4IHNjaHJpZWIgV2FuZyBZ
dWd1aToNCj4+IFsuLi5dDQo+Pj4+IDI0LWJpdCB3b3JrcyBvbiBteSBHMjAwSEUgYW5kIEcy
MDAgdGVzdCBtYWNoaW5lcy4gTWF5YmUgdGhlIEcyMDBFUiBoYXMgYSBidWcuDQo+Pj4+DQo+
Pj4+IFdoZW4gSSB0cnkgMTYtYml0IGRlcHRoLCB0aGUgZGlzcGxheSB3b3JrcywgYnV0IGlz
IHdheSB0b28gZGFyay4gTm8gZmlkZGxpbmcgd2l0aCB0aGUgTFVUIHRhYmxlcyBmaXhlcyB0
aGlzLiBJdCdzIDkwcyBoYXJkd2FyZSwgc28gaXQgc2hvdWxkIHN1cHBvcnQgMTYtYml0IGZy
YW1lYnVmZmVycyB3ZWxsLCBidXQgdGhlcmUncyBubyBvYnZpb3VzIGJ1ZyB0byBiZSBzZWVu
Lg0KPj4+Pg0KPj4+PiBJIGd1ZXNzLCB3ZSBjb3VsZCByZW1vdmUgMTYgYW5kIDI0IGJpdCBz
dXBwb3J0IGZvciBub3cgaWYgbm90aGluZyBlbHNlIGhlbHBzLg0KPj4+DQo+Pj4NCj4+PiBt
YXliZSBiZXR0ZXIgaWYgd2UgcmV2ZXJ0IDczZjU0ZDVkOTY4MiAoZHJtL21nYWcyMDA6IFJl
bW92ZSBzcGVjaWFsIGNhc2UNCj4+PiBmb3IgRzIwMFNFIHdpdGggPDIgTWlCKQ0KPj4NCj4+
IENvdWxkIHlvdSBwbGVhc2UgdGVzdCB0aGUgYXR0YWNoZWQgcGF0Y2ggb24gdGhlIDYuMC1y
YzMga2VybmVsPyBJdCBzaG91bGQgZm9yY2UgdGhlIGRyaXZlciB0byBhIGNvcnJlY3QgY29s
b3IgZm9ybWF0IGlmIG5vIGtlcm5lbCBwYXJhbWV0ZXJzIGFyZSBnaXZlbi4NCj4+DQo+IA0K
PiBUaGlzIHBhdGNoIHdvcmtzIHdlbGwuDQoNCkkgaGF2ZSBtZWFud2hpbGUgYWRkZWQgdGhl
IHBhdGNoIHRvIGRybS1taXNjLWZpeGVzLiBXZSB3YW50IHRvIGFkZCBhIA0Kd29ya2Fyb3Vu
ZCBmb3IgeW91ciBtYWNoaW5lIHRvIHRoZSBkcml2ZXIuIENhbiB5b3UgcGxlYXNlIHNlbmQg
bWUgdGhlIA0Kb3V0cHV0IG9mDQoNCiAgIHN1ZG8gZG1pZGVjb2RlIC1zIHN5c3RlbS1tYW51
ZmFjdHVyZXINCg0KYW5kDQoNCiAgIHN1ZG8gZG1pZGVjb2RlIC1zIHN5c3RlbS1wcm9kdWN0
LW5hbWUNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gdGVzdCBjYXNlIGRldGFp
bDoNCj4gICAga2VybmVsIHBhcm0gdmlkZW8gaXMgbm90IGdpdmVuDQo+ICAgIHNlcnZlciBE
RUxML1Q2MjANCj4gICAga2VybmVsIGlzIDYuMC1yYzUNCj4gDQo+IEJlc3QgUmVnYXJkcw0K
PiBXYW5nIFl1Z3VpICh3YW5neXVndWlAZTE2LXRlY2guY29tKQ0KPiAyMDIyLzA5LzE1DQo+
IA0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4+DQo+Pj4gYmVjYXVz
ZSB0aGVyZSBpcyBubyB0ZXN0IHJlc3VsdCBvbiBkZXZpY2UgRzIwMF9TRQ0KPj4+DQo+Pj4g
c3RhdGljIHVuc2lnbmVkIGludCBtZ2FnMjAwX3ByZWZlcnJlZF9kZXB0aChzdHJ1Y3QgbWdh
X2RldmljZSAqbWRldikNCj4+PiB7DQo+Pj4gICAgICAgICAgaWYgKElTX0cyMDBfU0UobWRl
dikgJiYgbWRldi0+dnJhbV9mYl9hdmFpbGFibGUgPCAoMjA0OCoxMDI0KSkNCj4+PiAgICAg
ICAgICAgICAgICAgIHJldHVybiAxNjsNCj4+PiAgICAgICAgICBlbHNlDQo+Pj4gICAgICAg
ICAgICAgICAgICByZXR1cm4gMzI7DQo+Pj4gfQ0KPj4+DQo+Pj4gQmVzdCBSZWdhcmRzDQo+
Pj4gV2FuZyBZdWd1aSAod2FuZ3l1Z3VpQGUxNi10ZWNoLmNvbSkNCj4+PiAyMDIyLzA5LzE0
DQo+Pj4NCj4+IC0tIFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2g/ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+IA0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------VkBrIsKFJCcjg3J0qXlKIAAD--

--------------zMnLnj0tZM3WSA9kqfx0nYxA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMpcm8FAwAAAAAACgkQlh/E3EQov+BE
6BAApQN56qjThSiyM7BdXdZK3bjDlCHzGhPik9tWJvAp4IPmUSUxO3hTR5jgzr9PRG7bBFyz1cKY
J+mCSarEGc+D0M1EzH7N+wKOcVZtIcz2qQeYb/NAE1dmeWZnWNsmC9XRuQLeJEBYcTSZ7SFCP+mA
pnEBOD4Bp5YzNKi9C+mWOILhz4YoBSIDoYe5sjcum1LGl0RRTiB7hS72+EzjGy6ph4EHxudgwJ8w
r9kZZ0rxbG4uruo8mtfhoYnttfMIGYOf6fQ5FDDVLbB/rBKoONvmG57FCy8Uc0nAcXtIGAes8eB5
RqrRqZbE5B8exiu1IVCLqnfkBRDovRKd/S0anFMuGqPVeY1SrxwuIipwAZFicL20p60A+Q/Mpq7R
t+Cx3BUj8cmwjydPPQDRlTZzeuFdo9KwEmtU3Udygzm7DwxXC44FCKq6JCjL3n2j/kL3HbwgC8by
Wvuab/Env/uogu3YDVSHo92nRWymTiJ1YdmRyGUxOU942VS80pt3WeBn4Yidh2WhtbyE9ShXzZVT
RMK6TfGThzBN1Snenw18vcYYcyMQ1yCIrUtKzkpnTHJQbtb0WsAKnaeQQtZCk5NbsriuQoN4yV6B
6U9VbWDrIdjjrU10K+cAZbxAHoy9mCocYifK5Ai66hSizfUz1Gb1nYnCKGOu1OYUeCmjJO0EEH1A
CBE=
=mAmc
-----END PGP SIGNATURE-----

--------------zMnLnj0tZM3WSA9kqfx0nYxA--

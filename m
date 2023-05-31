Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EEF71778B
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858E410E1B5;
	Wed, 31 May 2023 07:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F2C10E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 07:08:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 86C1D1FD6E;
 Wed, 31 May 2023 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685516897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9uhJkCmSCgsHGm+9OA6HvSfSv/eoseICOqrJL2P7K28=;
 b=W8+++YxcVwC7lCWbV+GRWyW/dGfgeTQI5kMBL/8MyN5Zlg5rfLD/kEy43wvcAFovXBuM2u
 S+0hesXrNYYEseHxsJlg8WUviKNB/6/4yUxurON9oSuOxW2SrzELThdTRmYQSknY4YKv2E
 452PZeBDLUxJ7uJUQgG6RoaAY9ReOUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685516897;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9uhJkCmSCgsHGm+9OA6HvSfSv/eoseICOqrJL2P7K28=;
 b=YPN1UQP+75BfJcNGK8OJYlMzVmOq3T+g/nijehUSzH8ZmiQulpTB/Dx1l0hrCA+xtjn3yZ
 4FivOcSE3wwaZgBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FEF6138E8;
 Wed, 31 May 2023 07:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E4lzFmHydmRYMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 31 May 2023 07:08:17 +0000
Message-ID: <9fdd63d2-12c6-d589-8b24-3c9333ed98da@suse.de>
Date: Wed, 31 May 2023 09:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer for mgag200 and ast
 drivers
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
References: <20230530142615.57014-1-jfalempe@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230530142615.57014-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gotwn2nyjGaaYRGVHGv6fjTq"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gotwn2nyjGaaYRGVHGv6fjTq
Content-Type: multipart/mixed; boundary="------------ek50bBan5v2X65Y3Lhuh4YPf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <9fdd63d2-12c6-d589-8b24-3c9333ed98da@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer for mgag200 and ast
 drivers
References: <20230530142615.57014-1-jfalempe@redhat.com>
In-Reply-To: <20230530142615.57014-1-jfalempe@redhat.com>

--------------ek50bBan5v2X65Y3Lhuh4YPf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDUuMjMgdW0gMTY6MjYgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IEkndmUgY29udHJpYnV0ZWQgdG8gdGhlc2UgdHdvIGRyaXZlcnMsIGZpeGluZyBidWdzIGFu
ZCBwZXJmb3JtYW5jZQ0KPiBpc3N1ZXMuDQoNClRoYW5rcyBmb3IgdGhlIHdvcmsgeW91J3Jl
IGRvaW5nLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxl
bXBlQHJlZGhhdC5jb20+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBNQUlOVEFJTkVSUyB8IDIgKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJ
TlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCAyNTA1MThmYzcwZmYuLjkyYTk5MTY0
M2IzNiAxMDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMN
Cj4gQEAgLTYzOTgsNiArNjM5OCw3IEBAIEY6CWRyaXZlcnMvZ3B1L2RybS9hc3BlZWQvDQo+
ICAgRFJNIERSSVZFUiBGT1IgQVNUIFNFUlZFUiBHUkFQSElDUyBDSElQUw0KPiAgIE06CURh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+DQo+ICAgUjoJVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ICtSOglKb2NlbHluIEZhbGVtcGUgPGpmYWxl
bXBlQHJlZGhhdC5jb20+DQo+ICAgTDoJZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiAgIFM6CVN1cHBvcnRlZA0KPiAgIFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9kcm0vZHJtLW1pc2MNCj4gQEAgLTY1NDksNiArNjU1MCw3IEBAIEY6CWRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEuYw0KPiAgIERSTSBE
UklWRVIgRk9SIE1HQSBHMjAwIEdSQVBISUNTIENISVBTDQo+ICAgTToJRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gICBSOglUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCj4gK1I6CUpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0
LmNvbT4NCj4gICBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ICAgUzoJ
U3VwcG9ydGVkDQo+ICAgVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9kcm0tbWlzYw0KPiANCj4gYmFzZS1jb21taXQ6IDhiODE3ZmRlZDQyZDhmZTNhMGViNDdi
MTE0OWQ5MDc4NTFhM2M5NDINCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------ek50bBan5v2X65Y3Lhuh4YPf--

--------------gotwn2nyjGaaYRGVHGv6fjTq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR28mAFAwAAAAAACgkQlh/E3EQov+A5
sxAAtRO9eTp9AIu1IV+WjXxOpPMi/SrgiU9HRdzbD37cq2de3bdahqbFu3O5mKOD18n+z9Cj6L6v
f6YAvGaLtIHqQqBHJuEEkXrI2ZjTLtGCBDDSWGS0TzSCdzaM3vuRh+SHrb2o9EZowd1qQO9895Ku
dBs/0y++ICOhtxRIAUgTqU4DMXgQgVaFEj4/Q4EHOMLMHskYhJQigu/cY7wJGJzhMTvgnE4ZTRgH
Bnhms/ijpfSo41oCHPn0U6mDjOFjTEIDe/LX+TtM6n++7c2aYf+R8dLIqryQf58WpY9XabSWC2dl
sGTC9UBXssJG71Wdi4xVL8x55ldcLJUXk3SLmSkD3V0FSrkr20ubYSX8Gw8jNCLHAA/u3LWQKgAu
q869B3L3K0TIsqwmQw/tFah/tTUfk8po/DV7sux5dCOSySKDtl92F4xcZUrqwf6u2UGPA3w0wrhe
S41q/CKMEn7UkSG8SxIAZhOMXlXMiTHJutzpXbEEbVW/si4HdIAcZFJF/45JNbwMFa53bJ6haZxl
myTVIXn9SCwnrPVwvFyvsAF6i3ZxzKAgFnCIcLjIi3fdyhRJCPd0U1cOv7Lme1Vpfdskze+iWVgm
kHLNHjZO1E20BGybgvKVAugG+b97NtBhMZJhCaNgUKTzS10Z3OrdFwhQCtm9dnon2nb5PWRHKlEm
oLI=
=sHB/
-----END PGP SIGNATURE-----

--------------gotwn2nyjGaaYRGVHGv6fjTq--

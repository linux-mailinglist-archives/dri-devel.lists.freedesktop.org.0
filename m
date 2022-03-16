Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2694DB86C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 20:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EE410E9C8;
	Wed, 16 Mar 2022 19:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E6110E9C8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 19:13:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3B3021111;
 Wed, 16 Mar 2022 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647458030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKcJPGOX92XcxlVSnlv0eiPOpoutLniwxkVoCU2Hd6I=;
 b=Ppo6iRGMNA3hW2+Z9WvGdEYIh9d7mnjWBpnzzT/mQIuM4IpXuR1N/MQAwd9METQ00dZLAv
 lexx28MmVHYV08N8B1tLbucSIuNjT8S/ElYUXxUyWjndre9DYgJUM5Alx6Lck0nBdSmbE/
 WtDo6dFdMPUWf5tkPX9Dq7tq+rS1XnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647458030;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKcJPGOX92XcxlVSnlv0eiPOpoutLniwxkVoCU2Hd6I=;
 b=Pqy641VOJ9zG366/Dn4srIO+ukMG33kgJtf+s3Hdn+CHBRELlmsS4R755WnLW3eZjdWWDg
 8Smf5iB1rYT9dGBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 870F913B5E;
 Wed, 16 Mar 2022 19:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0ai9H+42MmL3fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Mar 2022 19:13:50 +0000
Message-ID: <6f42b549-85c3-1dcd-7747-35f0d0a6c0fb@suse.de>
Date: Wed, 16 Mar 2022 20:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/12] drm/gma500: Various cleanups to GEM code
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220308195222.13471-1-tzimmermann@suse.de>
 <CAMeQTsY0sYP6wXCGrw+ruqKAEB1U82r6gwNfY1ebp9a1ejbe=Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMeQTsY0sYP6wXCGrw+ruqKAEB1U82r6gwNfY1ebp9a1ejbe=Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R3G9VNRYhyRjfpvfeZWx54j7"
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R3G9VNRYhyRjfpvfeZWx54j7
Content-Type: multipart/mixed; boundary="------------fiIyQZ8rTTViJrar7cqTiQqe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <6f42b549-85c3-1dcd-7747-35f0d0a6c0fb@suse.de>
Subject: Re: [PATCH v2 00/12] drm/gma500: Various cleanups to GEM code
References: <20220308195222.13471-1-tzimmermann@suse.de>
 <CAMeQTsY0sYP6wXCGrw+ruqKAEB1U82r6gwNfY1ebp9a1ejbe=Q@mail.gmail.com>
In-Reply-To: <CAMeQTsY0sYP6wXCGrw+ruqKAEB1U82r6gwNfY1ebp9a1ejbe=Q@mail.gmail.com>

--------------fiIyQZ8rTTViJrar7cqTiQqe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDMuMjIgdW0gMTc6NDUgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBPbiBUdWUsIE1hciA4LCAyMDIyIGF0IDg6NTIgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IFJlZmFjdG9yIGFuZCBzaW1wbGlm
eSB2YXJpb3VzIHBhcnRzIG9mIHRoZSBtZW1vcnkgbWFuYWdlbWVudC4gVGhpcw0KPj4gaW5j
bHVkZXMgbG9ja2luZywgaW5pdGlhbGl6YXRpb24gYW5kIGZpbmFsaXplciBmdW5jdGlvbnMs
IGFuZCBjb2RlDQo+PiBvcmdhbml6YXRpb24uDQo+Pg0KPj4gVGVzdGVkIG9uIEF0b20gTjI4
MDAgaGFyZHdhcmUuDQo+Pg0KPj4gdjI6DQo+PiAgICAgICAgICAqIHB1dCBjb21tb24gY29k
ZSBpbiBwc2JfZ3R0X3tpbml0LGZpbmkscmVzdW1lfSgpIGludG8NCj4+ICAgICAgICAgICAg
aGVscGVycyAoU2FtLCBQYXRyaWspDQo+Pg0KPiANCj4gVGhlIHNlcmllcyBpcyBwdXNoZWQg
dG8gZHJtLW1pc2MtbmV4dA0KDQpUaGFua3MgYSBsb3QsIFBhdHJpayENCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gVGhhbmtzDQo+IFBhdHJpaw0KPiANCj4+IFRob21hcyBa
aW1tZXJtYW5uICgxMik6DQo+PiAgICBkcm0vZ21hNTAwOiBSZW1vdmUgc3RydWN0IHBzYl9n
ZW1fb2JqZWN0Lm5wYWdlDQo+PiAgICBkcm0vZ21hNTAwOiBBY3F1aXJlIHJlc2VydmF0aW9u
IGxvY2sgZm9yIEdFTSBvYmplY3RzDQo+PiAgICBkcm0vZ21hNTAwOiBNb3ZlIEdUVCBsb2Nr
aW5nIGludG8gR1RUIGhlbHBlcnMNCj4+ICAgIGRybS9nbWE1MDA6IFJlbW92ZSBzdHJ1Y3Qg
cHNiX2d0dC5zZW0gc2VtcGFob3JlDQo+PiAgICBkcm0vZ21hNTAwOiBNb3ZlIEdUVCBzZXR1
cCBhbmQgcmVzdG9yYXRpb24gaW50byBoZWxwZXIgZnVudGlvbnMNCj4+ICAgIGRybS9nbWE1
MDA6IE1vdmUgR1RUIHJlc3VtZSBsb2dpYyBvdXQgb2YgcHNiX2d0dF9pbml0KCkNCj4+ICAg
IGRybS9nbWE1MDA6IENsZWFudXAgR1RUIHVuaW5pdCBhbmQgZXJyb3IgaGFuZGxpbmcNCj4+
ICAgIGRybS9nbWE1MDA6IFNwbGl0IEdUVCBpbml0L3Jlc3VtZS9maW5pIGludG8gR1RUIGFu
ZCBHRU0gZnVuY3Rpb25zDQo+PiAgICBkcm0vZ21hNTAwOiBJbmxpbmUgcHNiX2d0dF9yZXN0
b3JlKCkNCj4+ICAgIGRybS9nbWE1MDA6IE1vdmUgR0VNIG1lbW9yeSBtYW5hZ2VtZW50IGZ1
bmN0aW9ucyB0byBnZW0uYw0KPj4gICAgZHJtL2dtYTUwMDogTW92ZSBHVFQgZW5hYmxlIGFu
ZCBkaXNhYmxlIGNvZGUgaW50byBoZWxwZXJzDQo+PiAgICBkcm0vZ21hNTAwOiBNb3ZlIEdU
VCBtZW1vcnktcmFuZ2Ugc2V0dXAgaW50byBoZWxwZXINCj4+DQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvZ2VtLmMgICAgICAgICB8IDE2MSArKysrKysrKysrKysrKy0NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nZW0uaCAgICAgICAgIHwgIDEzICstDQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21hX2Rpc3BsYXkuYyB8ICAgOCArLQ0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL2d0dC5jICAgICAgICAgfCAyOTUgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ3R0LmggICAgICAg
ICB8ICAgOCArLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3Bvd2VyLmMgICAgICAg
fCAgIDUgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmMgICAgIHwg
IDEzICstDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5oICAgICB8ICAg
MSAtDQo+PiAgIDggZmlsZXMgY2hhbmdlZCwgMzE3IGluc2VydGlvbnMoKyksIDE4NyBkZWxl
dGlvbnMoLSkNCj4+DQo+Pg0KPj4gYmFzZS1jb21taXQ6IDcxMGEwMTlhZDg1ZTk2ZTY2Zjdk
NzVlZTdmNDczM2NkZDhhMmIwZDANCj4+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogYzJiMmYw
OGYwZWNjYzlmNWRmMGMwZGE0OWZhMWQzNjI2N2RlYjExZA0KPj4gcHJlcmVxdWlzaXRlLXBh
dGNoLWlkOiBjNjdlNWQ4ODZhNDdiN2QwMjY2ZDgxMTAwODM3NTU3ZmRhMzRjYjI0DQo+PiBw
cmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDZlMTAzMmM2MzAyNDYxNjI0ZjMzMTk0YzhiOGYzNzEw
M2EzZmE2ZWYNCj4+IC0tDQo+PiAyLjM1LjENCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------fiIyQZ8rTTViJrar7cqTiQqe--

--------------R3G9VNRYhyRjfpvfeZWx54j7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIyNu4FAwAAAAAACgkQlh/E3EQov+B5
NRAAiYtfW0hZpR3lzK/tX53op8dAUkcDtTTmdJzIxToC6Uyr5hZ8nKJesvZHJoqR9vQ6XXRc7lwL
HoQwk/k1tM6zL19XkfFLqMVNDdnvfZYwRXKpt1keiCniNvX1q3dEsYdy1khuMJbrtMWz7xHFP2ux
ijvXgbsauXfDcMr+nSV1ZFH0PXTCiTA8Jr9kkdrrzFUfMmqPLBXwdYwl7txUo8W/EerBt9ZZ0pCL
wGze8OHJcpOme2pSkXu4X2WkxheVVWWB1SqGokFM3l8/0Zy3FmDFrDEZKuayIUROkHeuRlKj2lA8
I/BoN0Q58rKZU+//vjU1GDnYZhLBRvx31/IR9LofaDAf+RVmuvxm0y0ReHH0Wu+FguqbYFoCsrGy
KoVqRmAmb4YdxJjDFN/wtj1LhQLAMxai8FkrOxyfOz/Ftabl5k65gkZCyEyCmruzDaBVSJ8ynhXk
4VJQGE/LZ9nKG+yUUSk+fTwzfoVfAZfx8RlqirnXa81qTfOz2ukTmxD1WJ5Emu3Nkd3HiXvnSDLW
flmS9cOIbv4vnUEG3/02NjZcxNMw7z4H+0+VoeNf9TuFRxxyKWm786MfYXe5kTmtVrIDM5z/f04E
t4+RLssDdNqoH3m/jVD9yvcMRor5l0qEnrFdtzwuBe3gGcdKmll+a5n8oAvnlJVYbA3lORYroRC1
igg=
=6JCt
-----END PGP SIGNATURE-----

--------------R3G9VNRYhyRjfpvfeZWx54j7--

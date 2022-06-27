Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85EA55B848
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8231010F239;
	Mon, 27 Jun 2022 07:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A15F10F2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:39:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29EFE21CE2;
 Mon, 27 Jun 2022 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656315568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3aWGuFivXPnlQDlWetDbbx5/PVJTbq8ufU6s7SiJzAo=;
 b=jrcVnoQgxabJ5OIyfwWfKxP8pwSpsVC+shQaZWzLXNZZSu9tgee/YCDpwPT3r2SBvQF6/q
 YjMLH6Z5YkbmkQcErjauX917DMV1iRUbbwgPNyxLA6eVa2SqSkbYyIJas7cCabXgEtgcle
 JsfX/9Fr5OS3uYtRmJgFe1nO5jrVxCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656315568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3aWGuFivXPnlQDlWetDbbx5/PVJTbq8ufU6s7SiJzAo=;
 b=8gFx0M3DQ0uCLDXSP1qN8MtXVagJfzDZPgVGSGwxgL/EAPz2/LQDfa9H6wU9wf8p3An8Hy
 u4NMewR1lDUICpDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F018513456;
 Mon, 27 Jun 2022 07:39:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uQqtOa9euWKbdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Jun 2022 07:39:27 +0000
Message-ID: <cf8697fb-c979-baae-e194-ec5b6b2bc3c7@suse.de>
Date: Mon, 27 Jun 2022 09:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, kuohsiang_chou@aspeedtech.com
References: <20220622124815.356035-1-jfalempe@redhat.com>
 <8a6048576c440f1653121bb7be8583e9fee0c79a.camel@redhat.com>
 <9db1d8fd-1778-0811-ec70-ad5bb8de00a6@redhat.com>
 <1c6517d8-396d-3a63-f4ed-f7dcd2159a2f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1c6517d8-396d-3a63-f4ed-f7dcd2159a2f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Xps1Z80dvaQXZju1Tpba7Tay"
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
Cc: charles_kuan@aspeedtech.com, michel@daenzer.net, luke_chen@aspeedtech.com,
 Venkat Tadikonda <venkateswara.rao@intel.com>, hungju_huang@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Xps1Z80dvaQXZju1Tpba7Tay
Content-Type: multipart/mixed; boundary="------------wDONqYUYpz5fQTpvSUhdS2kz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, kuohsiang_chou@aspeedtech.com
Cc: michel@daenzer.net, hungju_huang@aspeedtech.com,
 Venkat Tadikonda <venkateswara.rao@intel.com>, charles_kuan@aspeedtech.com,
 luke_chen@aspeedtech.com
Message-ID: <cf8697fb-c979-baae-e194-ec5b6b2bc3c7@suse.de>
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
References: <20220622124815.356035-1-jfalempe@redhat.com>
 <8a6048576c440f1653121bb7be8583e9fee0c79a.camel@redhat.com>
 <9db1d8fd-1778-0811-ec70-ad5bb8de00a6@redhat.com>
 <1c6517d8-396d-3a63-f4ed-f7dcd2159a2f@redhat.com>
In-Reply-To: <1c6517d8-396d-3a63-f4ed-f7dcd2159a2f@redhat.com>

--------------wDONqYUYpz5fQTpvSUhdS2kz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjA2LjIyIHVtIDA5OjMxIHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPiBP
biAyMy8wNi8yMDIyIDEwOjIxLCBKb2NlbHluIEZhbGVtcGUgd3JvdGU6DQo+PiBPbiAyMi8w
Ni8yMDIyIDIwOjM0LCBMeXVkZSBQYXVsIHdyb3RlOg0KPj4+IFNvbWUgc21hbGwgbml0cGlj
a3M6DQo+Pj4NCj4+PiBPbiBXZWQsIDIwMjItMDYtMjIgYXQgMTQ6NDggKzAyMDAsIEpvY2Vs
eW4gRmFsZW1wZSB3cm90ZToNCj4+Pj4gV2l0aCBhbiBBU1QyNjAwLCB0aGUgc2NyZWVuIGlz
IGdhcmJhZ2Ugd2hlbiBnb2luZyBvdXQgb2Ygc3VzcGVuZC4NCj4+Pj4gVGhpcyBpcyBiZWNh
dXNlIGNvbG9yIHNldHRpbmdzIGFyZSBsb3N0LCBhbmQgbm90IHJlc3RvcmVkIG9uIHJlc3Vt
ZS4NCj4+Pj4gRm9yY2UgdGhlIGNvbG9yIHNldHRpbmdzIG9uIERQTVNfT04sIHRvIG1ha2Ug
c3VyZSB0aGUgc2V0dGluZ3MgYXJlIA0KPj4+PiBjb3JyZWN0Lg0KPj4+Pg0KPj4+PiBJIGRp
ZG4ndCB3cml0ZSB0aGlzIGNvZGUsIGl0IGNvbWVzIGZyb20gdGhlIG91dC1vZi10cmVlIGFz
cGVlZCANCj4+Pj4gZHJpdmVyIHYxLjEzDQo+Pj4+IGh0dHBzOi8vd3d3LmFzcGVlZHRlY2gu
Y29tL3N1cHBvcnRfZHJpdmVyLw0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2NlbHlu
IEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+Pj4+IFRlc3RlZC1ieTogVmVua2F0
IFRhZGlrb25kYSA8dmVua2F0ZXN3YXJhLnJhb0BpbnRlbC5jb20+DQo+Pj4NCj4+PiBTaG91
bGQgaGF2ZSBhIENjOiB0byBzdGFibGUgaW1obywgYGRpbWAgY2FuIGRvIHRoaXMgZm9yIHlv
dToNCj4+Pg0KPj4+IGh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFp
bmVyLXRvb2xzL2RpbS5odG1sDQo+Pg0KPj4gU3VyZSBJIHdpbGwgYWRkIGNjIHRvIHN0YWJs
ZSBmb3IgdGhlIHYyDQo+IA0KPiBJbiBmYWN0IGl0IGRvZXNuJ3QgYXBwbHkgdG8gb2xkZXIg
a2VybmVsIHZlcnNpb24sIChpdCBkZXBlbmRzIG9uIA0KPiA1OTRlOWMwNGI1ODYgQ3JlYXRl
IHRoZSBkcml2ZXIgZm9yIEFTUEVFRCBwcm9wcmlldG9yeSBEaXNwbGF5LVBvcnQpLg0KPiAN
Cj4gU28gSSB0aGluayBJIHdpbGwganVzdCBwdXNoIGl0IHRvIGRybS1taXNjLW5leHQsIHdp
dGggdGhlIGluZGVudGF0aW9uIA0KPiBmaXhlZC4NCg0KU3VyZSwgZ28gYWhlYWQuDQoNCj4g
DQo+Pj4NCj4+Pj4gLS0tDQo+Pj4+IMKgwqBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMgfCAxMyArKysrKysrKysrKysrDQo+Pj4+IMKgwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbW9kZS5jIA0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0K
Pj4+PiBpbmRleCAzZWI5YWZlY2Q5ZDQuLmNkZGRjYjVjNDQzOSAxMDA2NDQNCj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPj4+PiBAQCAtOTkwLDYgKzk5MCw5IEBAIHN0YXRp
YyB2b2lkIGFzdF9jcnRjX2RwbXMoc3RydWN0IGRybV9jcnRjICpjcnRjLCANCj4+Pj4gaW50
DQo+Pj4+IG1vZGUpDQo+Pj4+IMKgwqB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCBhc3RfcHJpdmF0ZSAqYXN0ID0gdG9fYXN0X3ByaXZhdGUoY3J0Yy0+ZGV2KTsNCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgdTggY2ggPSBBU1RfRFBNU19WU1lOQ19PRkYgfCBBU1RfRFBN
U19IU1lOQ19PRkY7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBhc3RfY3J0Y19zdGF0
ZSAqYXN0X3N0YXRlOw0KPj4+PiArwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgZHJtX2Zv
cm1hdF9pbmZvICpmb3JtYXQ7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBhc3RfdmJp
b3NfbW9kZV9pbmZvICp2Ymlvc19tb2RlX2luZm87DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oC8qIFRPRE86IE1heWJlIGNvbnRyb2wgZGlzcGxheSBzaWduYWwgZ2VuZXJhdGlvbiB3aXRo
DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqwqDCoMKgwqDCoMKgIFN5bmMgRW5hYmxlIChi
aXQgQ1IxNy43KS4NCj4+Pj4gQEAgLTEwMDcsNiArMTAxMCwxNiBAQCBzdGF0aWMgdm9pZCBh
c3RfY3J0Y19kcG1zKHN0cnVjdCBkcm1fY3J0YyANCj4+Pj4gKmNydGMsIGludA0KPj4+PiBt
b2RlKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGFzdF9kcF9zZXRfb25fb2ZmKGNydGMtPmRldiwgMSk7DQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBhc3Rfc3RhdGUgPSB0b19hc3RfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3JtYXQgPSBhc3Rfc3Rh
dGUtPmZvcm1hdDsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKGZvcm1hdCl7DQo+Pj4NCj4+PiBTaG91bGQgYmUgYSBzcGFjZSBiZXR3ZWVuICcp
JyBhbmQgJ3snLg0KPj4NCj4+IGxvb2tzIGxpa2UgSSBmb3JnZXQgdG8gcnVuIGNoZWNrcGF0
Y2gucGwgb24gaXQgYmVmb3JlIHNlbmRpbmcgOigNCj4+DQo+PiBJJ2xsIHdhaXQgYSBiaXQg
Zm9yIG90aGVyIGNvbW1lbnRzLCBhbmQgc2VudCBhIHYyIHdpdGggY2MgZm9yIHN0YWJsZS4N
Cj4+Pg0KPj4+IFdpdGggdGhhdCBmaXhlZCwgdGhpcyBpczogUmV2aWV3ZWQtYnk6IEx5dWRl
IFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQo+Pj4NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2Ymlvc19tb2RlX2luZm8gPSAmYXN0X3N0
YXRlLT52Ymlvc19tb2RlX2luZm87DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhc3Rfc2V0X2NvbG9yX3JlZyhhc3QsIGZv
cm1hdCk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYXN0X3NldF92Ymlvc19jb2xvcl9yZWcoYXN0LCBmb3JtYXQsDQo+Pj4+IHZiaW9z
X21vZGVfaW5mbyk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+
Pj4+ICsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFzdF9jcnRj
X2xvYWRfbHV0KGFzdCwgY3J0Yyk7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBicmVhazsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSBEUk1fTU9ERV9E
UE1TX1NUQU5EQlk6DQo+Pj4NCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------wDONqYUYpz5fQTpvSUhdS2kz--

--------------Xps1Z80dvaQXZju1Tpba7Tay
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK5Xq8FAwAAAAAACgkQlh/E3EQov+Az
RA/+JDiabdzSmSKy2yzGreiNIBamkxUu51P33M9XDT902D5fMs+KNHn5ZQsHRzN5ZwPdd6dWOlP1
cGmqE43j0gX0s58YfgeP86DEFjmr9utMRtoV7CkGQiq1tQiuNvqRc2Du0wlm8n8fuYGdEtX0+Uv1
aO1zsGTaZ1Yc1Lv/iSL+bVNPlW2LwNGEStT/6dDZ3VHethONCkz0TZK0bX0vKPTj0PLfQmwewG6Q
yOOW/XGceqSrVqqKi0GZoQlZmgsSEMU53EyrVCeDc9BuuMLqyCIoapnTTXm1eRacdjGkxtp2vWhK
RVe9lAi4qu2/ZdFk3tCyPEb5MZAboFTAV8AK8yhMUUKsiay+k7PGEQHcVNaMnUELjyX8qxfPNxsh
3o1uAKbZ+3Po6zzJ4YLg6dRu+EZMjSygU9/NC4Fr+SN/0J5s3iGdoNBWoUIHLO2bI5zXaBAE4gJq
KzVLK4PSnjWzyeLSIF4seiE747nzolo1k9LGS2+JuJLmuIkTWI/UqbY+iRjklce6ClwhTkN59KgS
doNgoMG8vS8yn9oJgE7z8ijydcFzLHkDSP3xvlqvjFTyH23nj735mXcahuATdA8bx6TsOKulK/gt
AihT/+8MUOwumxbfdfmpibEvMJk7ZGlUxtSsWBWJ+wqv/30oMqibbLGOgZUbCA+nmku5Plx0AP1v
5Ho=
=banI
-----END PGP SIGNATURE-----

--------------Xps1Z80dvaQXZju1Tpba7Tay--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE06640F6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 13:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC53B10E5B8;
	Tue, 10 Jan 2023 12:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB2510E5B7;
 Tue, 10 Jan 2023 12:53:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E21D4EAB5;
 Tue, 10 Jan 2023 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673355229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MeiI1zB4cNnVBqeqlVE+I6kGcZQIkeuPjHJaBc5Mnwg=;
 b=CDz9aTb82F/r3+fZt02BbcpVonHxlDBWFfyOMjQko4HRiJEkF9ujPzd6QW1X0CSuSTVpMQ
 VVAnbovZCrfnKrSoH1TPrpU/1OyvlGSLU3ahFvo0Z9J3Oos4sEI//tWOx/22Sd9FR6XEa2
 zgoDhjM6uIUT+QtM8dBK+X+IHh4eNCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673355229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MeiI1zB4cNnVBqeqlVE+I6kGcZQIkeuPjHJaBc5Mnwg=;
 b=voAWi7cZFFsWE2NnrMAd2AjLVnsTef3TZDwVEzN6VleKbjsu7TDgGshrmz1Sfjx30ZIB0Y
 5iAvz8THrWEU79Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 485321358A;
 Tue, 10 Jan 2023 12:53:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jsXbEN1fvWPHKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jan 2023 12:53:49 +0000
Message-ID: <8197553c-19cc-5ece-a6d2-f7c97d8760fe@suse.de>
Date: Tue, 10 Jan 2023 13:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/nouveau: Remove file nouveau_fbcon.c
To: Javier Martinez Canillas <javierm@redhat.com>, bskeggs@redhat.com,
 kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230110123526.28770-1-tzimmermann@suse.de>
 <da2e0a51-9f75-cf74-9244-fd7b82dda7c5@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <da2e0a51-9f75-cf74-9244-fd7b82dda7c5@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i72dTLi036UwClSyoem7znLn"
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
Cc: Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i72dTLi036UwClSyoem7znLn
Content-Type: multipart/mixed; boundary="------------bLFrj1RrxfWfzDvvm90GRdxb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, bskeggs@redhat.com,
 kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <8197553c-19cc-5ece-a6d2-f7c97d8760fe@suse.de>
Subject: Re: [PATCH v2] drm/nouveau: Remove file nouveau_fbcon.c
References: <20230110123526.28770-1-tzimmermann@suse.de>
 <da2e0a51-9f75-cf74-9244-fd7b82dda7c5@redhat.com>
In-Reply-To: <da2e0a51-9f75-cf74-9244-fd7b82dda7c5@redhat.com>

--------------bLFrj1RrxfWfzDvvm90GRdxb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjAxLjIzIHVtIDEzOjQ5IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiAxLzEwLzIzIDEzOjM1LCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4+IENvbW1pdCA0YTE2ZGQ5ZDE4YTAgKCJkcm0vbm91dmVh
dS9rbXM6IHN3aXRjaCB0byBkcm0gZmJkZXYgaGVscGVycyIpDQo+PiBjb252ZXJ0ZWQgbm91
dmVhdSB0byBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4gVGhlIGRyaXZlcidzIGludGVybmFs
DQo+PiBpbXBsZW1lbnRhdGlvbiBsYXRlciBnb3QgYWNjaWRlbnRhbGx5IHJlc3RvcmVkIGR1
cmluZyBhIG1lcmdlIGNvbW1pdC4NCj4+IFJlbW92ZSB0aGUgZmlsZSBmcm9tIHRoZSBkcml2
ZXIuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+DQo+PiB2MjoNCj4+IAkqIHBvaW50IEZp
eGVzIHRhZyB0byBtZXJnZSBjb21taXQgKEFsZXgpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZpZXdlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4gRml4ZXM6
IDRlMjkxZjJmNTg1MyAoIk1lcmdlIHRhZyAnZHJtLW1pc2MtbmV4dC0yMDIyLTExLTEwLTEn
IG9mIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyBpbnRvIGRy
bS1uZXh0IikNCj4gDQo+IEkgYmVsaWV2ZSB0aGUgZml4ZXMgdGFnIHNob3VsZCBiZSBiZWZv
cmUgdGhlIFMtby1CID8gQXQgbGVhc3QgdGhhdCBpcw0KPiB0aGUgY2FzZSBpbiBtb3N0IGNv
bW1pdHMgYW5kIERvY3VtZW50YXRpb24vcHJvY2Vzcy9tYWludGFpbmVyLXRpcC5yc3QNCj4g
ZXhhbXBsZS4gQnV0IHlvdSBjb3VsZCBmaXggaXQganVzdCBiZWZvcmUgYXBwbHlpbmcuDQoN
CkknbGwgZG8uDQoNCj4gDQo+IFRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1lLg0KPiANCj4g
UmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQu
Y29tPg0KPiANCg0KVGhhbmtzLg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------bLFrj1RrxfWfzDvvm90GRdxb--

--------------i72dTLi036UwClSyoem7znLn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO9X9wFAwAAAAAACgkQlh/E3EQov+BN
uQ//d9Bueh8SmP1ogYwL1ooS4/Wx6sNkLzDpcBK/yWQlLW6ygFpikb7oEdhMflY6eH0uyKuQLacR
bCYBh7/k4G1qdqe/Fq/B3qzANRlzhmwsOYZJO6LMJF8lD/23HA3l75tBfc6LpMSzMEoeFMWwveSa
mDN7nONSr01M4GIX8nd1GrL7u9HmOMoS6aadi4r4HotVwLL3/7jzB1UXQDX+2Jqob3UWjEosDhvX
RZJXOfJ/MMfpvY3uKqvRoqnCa/3VKKDaAZkWaVpFf0xxZOVItCLW67fYNB3J7fpSaXZda7A3xXhr
uG0lCv7gCCkiR+7ohWqwrM2hlWDVlcEcU0lVLd2gV9saT0P6l7meRDOELmkLoBjEd2PJ5MxoMHmu
5CT1mQHPVB5NePQveoeF6uCork/Yu9qHN1TlJP6vw4faSVOnB+8EwLq3P4lfeG+VzlbIiCN0qGBA
JZ/fPDCIz4DT8dCkpNrlpBavsh01DER+Wq/QqPP28oGJi7frcipjw43+2x6J1I7MnvqwQG5J75z9
rAp+G2wNaXZk9JhaalxSNDN7YufPYsiJt9S5FqJTSwaKefM9JUpxggH/clNbvPS/t6pY8w1kFlEA
3JoczqCyw8vUh01eeBruvHWSevl7xVpm09vIcMAuFI+Wd9dGqZ7+SVYpcQS2jsiGZSp6ELYtKf3Z
oXk=
=mFfK
-----END PGP SIGNATURE-----

--------------i72dTLi036UwClSyoem7znLn--

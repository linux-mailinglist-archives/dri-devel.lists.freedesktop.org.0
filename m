Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D37987B9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 15:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356A710E8AA;
	Fri,  8 Sep 2023 13:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5376410E8AA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 13:22:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB3561FE79;
 Fri,  8 Sep 2023 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694179329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ifE+PrutkyuIk2waqgX98GbYBVFwls77z1aT0j/McE=;
 b=XgUexfSh0WAxQUQ8AGpFxmIdghLkJgMm7h2ePkSllLFNHz3xgnL3QKt2hU7Z+hQ0MZbKFp
 wTDB2+j3e0+xUAPXuwYx/Dl2rMZwefxKOc7kCeAGT3xQD1ktoeXgWfa4807UFSdu6xApjN
 9RiGMX6L2miMLPPXoZ0elUyXk0niYCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694179329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ifE+PrutkyuIk2waqgX98GbYBVFwls77z1aT0j/McE=;
 b=21DRZw1j3i7shmlrGnSqXMwSQJl9jC/op/wRPiCBhflXV2C4AXl8yPx77Ne+2/FQl9MhHM
 MgN4kFzFZbbdj3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE1DF131FD;
 Fri,  8 Sep 2023 13:22:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xIB5LQEg+2ScVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Sep 2023 13:22:09 +0000
Message-ID: <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
Date: Fri, 8 Sep 2023 15:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HeEB4Ce0vaTxAEBMiibv0LhZ"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, ppaalanen@gmail.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HeEB4Ce0vaTxAEBMiibv0LhZ
Content-Type: multipart/mixed; boundary="------------RjfH0wDi8WPzp6uZtGkEU4eH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, ppaalanen@gmail.com,
 javierm@redhat.com, contact@emersion.fr, dri-devel@lists.freedesktop.org
Message-ID: <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
In-Reply-To: <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>

--------------RjfH0wDi8WPzp6uZtGkEU4eH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDA4LjA5LjIzIHVtIDEyOjU4IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gSGksDQo+IA0KPiBPbiBGcmksIFNlcCAwOCwgMjAyMyBhdCAxMToyMTo1MUFNICsw
MjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDI1LjA4LjIzIHVtIDE2OjA0
IHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPj4gWy4uLl0NCj4+PiArICoNCj4+PiArICog
ICAgIEJ1dCB0aGVyZSBhcmUgdHdvIGV4Y2VwdGlvbnMgb25seSBmb3IgZHVtYiBidWZmZXJz
Og0KPj4+ICsgKiAgICAgKiBUbyBzdXBwb3J0IFhSR0I4ODg4IGlmIGl0J3Mgbm90IHN1cHBv
cnRlZCBieSB0aGUgaGFyZHdhcmUuDQo+Pg0KPj4NCj4+PiArICogICAgICogQW55IGRyaXZl
ciBpcyBmcmVlIHRvIG1vZGlmeSBpdHMgaW50ZXJuYWwgcmVwcmVzZW50YXRpb24gb2YgdGhl
IGZvcm1hdCwNCj4+PiArICogICAgICAgYXMgbG9uZyBhcyBpdCBkb2Vzbid0IGFsdGVyIHRo
ZSB2aXNpYmxlIGNvbnRlbnQgaW4gYW55IHdheSwgYW5kIGRvZXNuJ3QNCj4+PiArICogICAg
ICAgbW9kaWZ5IHRoZSB1c2VyLXByb3ZpZGVkIGJ1ZmZlci4gQW4gZXhhbXBsZSB3b3VsZCBi
ZSB0byBkcm9wIHRoZQ0KPj4+ICsgKiAgICAgICBwYWRkaW5nIGNvbXBvbmVudCBmcm9tIGEg
Zm9ybWF0IHRvIHNhdmUgc29tZSBtZW1vcnkgYmFuZHdpZHRoLg0KPj4NCj4+IEkgaGF2ZSBz
dHJvbmcgb2JqZWN0aW9ucyB0byB0aGlzIHBvaW50LCBfZXNwZWNpYWxseV8gYXMgeW91J3Jl
IGFwcGFyZW50bHkNCj4+IHRyeWluZyB0byBzbmVhayB0aGlzIGluIGFmdGVyIG91ciBkaXNj
dXNzaW9uLg0KPiANCj4gSSB0aGluayBpdCdzIGFuIHVuZmFpciBjaGFyYWN0ZXJpemF0aW9u
LiBUaGlzIHdhcyBkaXNjdXNzZWQgb24NCj4gI2RyaS1kZXZlbCwgYW5kIHdlbnQgdGhyb3Vn
aCBzZXZlcmFsIHJvdW5kcyBvdmVyIHRoZSBtYWlsaW5nIGxpc3RzLCB3aXRoDQo+IHlvdSBp
biBDYyBmb3IgZWFjaC4gSG93IGlzIHRoYXQgc25lYWtpbmcgc29tZXRoaW5nIGluPw0KDQpB
IGZldyBtb250aHMgYWdvLCB3ZSBoYWQgYSBmbGFtZXdhcidpc2ggSVJDIGRpc2N1c3Npb24g
b24gZm9ybWF0IA0KY29udmVyc2lvbiB3aXRoaW4gdGhlIGtlcm5lbC4gVGhlIGdlbmVyYWwg
c2VudGltZW50IHdhcyB0aGF0IHRoZSBrZXJuZWwgDQpkcml2ZXJzIHNob3VsZCB1c2Ugd2hh
dCBldmVyIGlzIHByb3ZpZGVkIGJ5IHVzZXJzcGFjZSB3aXRob3V0IGZ1cnRoZXIgDQpwcm9j
ZXNzaW5nLiBUaGUgc2hvcnQgYXJndW1lbnQgd2FzICd1c2Vyc3BhY2Uga25vd3MgYmV0dGVy
Jy4gVGhlIG9ubHkgDQpleGNlcHRpb24gaXMgZm9yIHN1cHBvcnRpbmcgWFJHQjg4ODggb24g
aGFyZHdhcmUgdGhhdCB3b3VsZCBvdGhlcndpc2UgDQpub3Qgc3VwcG9ydCBpdC4gQWZ0ZXIg
c29tZSBjb25zaWRlcmF0aW9uLCBJIGFncmVlIHdpdGggYWxsIHRoYXQuIChCYWNrIA0KdGhl
biBJIGRpZG4ndC4pDQoNCkEgZmV3IHdlZWtzIGFnbyBJIHJlY2VpdmVkIGEgcGF0Y2ggdG8g
ZG8gYW4gaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIA0KWFJHQjg4ODggdG8gUkdCODg4IHdp
dGhpbiBtZ2FnMjAwLiBbMV0gSSBkb24ndCBoYXZlIGEgbGluayB0byB0aGUgDQpkaXNjdXNz
aW9uLCBidXQgSSBOQUsnZWQgdGhhdCBwYXRjaCBwcmV0dHkgaGFyZCBvbiBJUkMgYnkgZm9s
bG93aW5nIHRoYXQgDQpvdGhlciBkaXNjdXNzaW9uLg0KDQpBbmQga25vdyBJIGZpbmQgdGhh
dCB0aGlzIHBhdGNoIChldmVuIGluIGl0cyB2MSkgY29udGFpbnMgbGFuZ3VhZ2UgdGhhdCAN
CnJldHJvYWN0aXZlbHkgbGVnaXRpbWl6ZXMgdGhlIG1nYWcyMDAgcGF0Y2guIEkgd3JvdGUg
J2FwcGFyZW50bHknIEkgbXkgDQpyZXBseSwgYXMgSSBhc3N1bWUgdGhhdCB0aGVyZSdzIG1v
cmUgdG8gaXQsIGJ1dCBob3cgZG9lcyBpdCBub3QgbG9vayANCmxpa2UgYW4gYXR0ZW1wdCB0
byBzbmVhayBpbiBzb21ldGhpbmcgdGhhdCBpcyBrbm93biB0byBiZSBjb250cm92ZXJzaWFs
Pw0KDQpJdCBtaWdodCBoYXZlIGJlZW4gYmV0dGVyIHRvIGRpc2N1c3MgdGhlIHF1ZXN0aW9u
IHNlcGFyYXRlbHkgb24gdGhlIA0KZHJpLWRldmVsIE1MLiBNYXliZSB3ZSBjYW4gZG8gdGhp
cyBoZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzUzMTg3OS8/c2VyaWVzPTExNjM4MSZyZXY9MQ0K
DQo+IA0KPj4gTkFLIG9uIHRoaXMgcGFydCBmcm9tIG15IHNpZGUuDQo+Pg0KPj4gSWYgeW91
IHdhbnQgdXNlcnNwYWNlIHRvIGJlIGFibGUgdG8gdXNlIGEgY2VydGFpbiBmb3JtYXQsIHRo
ZW4gZXhwb3J0IHRoZQ0KPj4gY29ycmVzcG9uZGluZyA0Y2MgY29kZS4gVGhlbiBsZXQgdXNl
cnNwYWNlIGRlY2lkZSB3aGF0IHRvIGRvIGFib3V0IGl0LiBJZg0KPj4gdXNlcnNwYWNlIHBp
Y2sgYSBjZXJ0YWluIGZvcm1hdCwgZ28gd2l0aCBpdC4NCj4+DQo+PiBIZW5jZSwgbm8gaW1w
bGljaXQgY29udmVyc2lvbiBmcm9tIFhSR0I4ODggdG8gUkdCODg4LCBqdXN0IGJlY2F1c2Ug
aXQncw0KPj4gcG9zc2libGUuDQo+IA0KPiBJJ20gbm90IHN1cmUgd2hhdCdzIHlvdXIgYXJn
dW1lbnQgaXMsIHJlYWxseS4gTGFzdCB0aW1lIHdlIGRpc2N1c3NlZA0KPiB0aGlzLCB5b3Ug
d2VyZSBzYXlpbmcgdGhhdCB5b3Ugd2VyZSBlbmZvcmNpbmcgdGhhdCBydWxlIGJlY2F1c2Ug
dGhhdCB3YXMNCj4gdGhlIG91dGNvbWUgb2YgdGhhdCAocGFpbmZ1bCkgZGlzY3Vzc2lvbiB3
aXRoIFBla2thIGFuZCBKYXZpZXIuIEl0IHR1cm5zDQo+IG91dCB0aGF0IGJvdGggUGVra2Eg
YW5kIEphdmllciBhcmUgb2sgd2l0aCB0aGUgcGF0Y2gsIHNvIGl0J3Mgbm90IGNsZWFyDQo+
IHRvIG1lIHdoYXQgeW91ciBvYmplY3Rpb25zIGFyZSBhdCB0aGlzIHBvaW50Lg0KPiANCj4g
QXJlIHlvdSByZWFsbHkgYXJndWluZyB0aGF0IHdlIHNob3VsZG4ndCBhbGxvdyBhIGRyaXZl
ciB0byBjb25zdW1lIGxlc3MNCj4gcmVzb3VyY2VzIHdoaWxlIG5vdCBhZmZlY3RpbmcgYW55
IG90aGVyIGNvbXBvbmVudCBpbiB0aGUgc3lzdGVtIGluIGFueQ0KPiB3YXk/DQo+IA0KPiBN
YXhpbWUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------RjfH0wDi8WPzp6uZtGkEU4eH--

--------------HeEB4Ce0vaTxAEBMiibv0LhZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT7IAEFAwAAAAAACgkQlh/E3EQov+Ae
zA/+MIarFWhnnwffFktkKvY6NL7R9kXdQNlXYRaB3jEzot6/Bvu/0IyRsP3MRXmM83O59K3pOGeo
h/EH9eOILWAjkRfKLBVpTzOwFvRwAfwzDI5XJ7/00OnxaHiTAVNfdVKM2DVdei/SQxOO5pYRL8e7
Si/5fU/MHIMX3bJuTREO1TYNjU2gUQLkv1sIruogwVwpkqztM4qZxtueCdWy3RYc+TyvTzbY0V7T
Cz2b3XgF4QCA3KhNXP8Jt3TtaSQ5IVodhlljLjxMTRPiu7V1jX4LEq4bpbnhe23krXe7k42zYTwi
aNBk/sWikpLEXoxW0jmaSsobuk9ya3l0F9IFQFP8FCUe2sADYCOmCNBotFFc/l1+D7hJfb4ODzmw
a0v0i4FIVWtlauDquTpM1fC091VgeasCaQ6d4JIx4d59OGieE9ED9m9jpidlQrENLDYjiA7jH42e
G7jOYpPa/UwEdLjsGaAX2lVKtc+OnvR54yDON/Addv+GrNcdqSC0TZKCpSr0OSX7mDNvHVCq9QO9
vdG2DlBD1kW0156tMDf+p0gOVqSO/JKf5jxDiScT8WcJoPUz8TkxVTz1xrbzck51WKWYUbvzC/dd
5+cIHZCGafyxLAsgDI93eyv4zYMajiFJIPullUWnycSUlkZfl3DVMVIA3clvESc6D4BsUMTmxaTm
r8M=
=Zub+
-----END PGP SIGNATURE-----

--------------HeEB4Ce0vaTxAEBMiibv0LhZ--

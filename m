Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C74B4FC4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156E910E138;
	Mon, 14 Feb 2022 12:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C1D10E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:12:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C887210F5;
 Mon, 14 Feb 2022 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644840769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0N8Pd2rRpN6k5MDOssRV7i1L90wiC9I7WRVnUWCy7Q=;
 b=goRCyBSfrUfjyUkWB/2mCwkuVSdVrUzcq1A1KE1AAY3t2F9fRxIxeVOkTCY052AsJi1if/
 +A6PVzn7KNBxzYeKJrGUPeI3qNaV/h8FZh+ie5zDsiyWD99N+r6kwZLa86iNbeaSPEGyco
 LQPXUVFVTeRRe57NC/+JYuImo/9EV2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644840769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0N8Pd2rRpN6k5MDOssRV7i1L90wiC9I7WRVnUWCy7Q=;
 b=MKteQnr0rFBiv0DJ9u272iVeXkGY8ph2zltuqZij/fkumwZ7VaNn+Olq9qwI3iai7QpAYF
 babkCn5RhjAMmiAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31C0B13AF2;
 Mon, 14 Feb 2022 12:12:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2H00C0FHCmLLfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Feb 2022 12:12:49 +0000
Message-ID: <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de>
Date: Mon, 14 Feb 2022 13:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YgoxFBGNsrezVxmi@smile.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wzw214BQ5G1QGXbdavDQU2NV"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wzw214BQ5G1QGXbdavDQU2NV
Content-Type: multipart/mixed; boundary="------------5AmddLGv5nbVnhIdqMfCesQr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
In-Reply-To: <YgoxFBGNsrezVxmi@smile.fi.intel.com>

--------------5AmddLGv5nbVnhIdqMfCesQr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDIuMjIgdW0gMTE6Mzggc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+
IE9uIE1vbiwgRmViIDE0LCAyMDIyIGF0IDEwOjAzOjUzQU0gKzAxMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gQW0gMTEuMDIuMjIgdW0gMTY6NDEgc2NocmllYiBBbmR5IFNo
ZXZjaGVua286DQo+IA0KPiAuLi4NCj4gDQo+Pj4+IElNTyAqYWx3YXlzKiBwcmVmZXIgYSBm
b3IgbG9vcCBvdmVyIHdoaWxlIG9yIGRvLXdoaWxlLg0KPj4+Pg0KPj4+PiBUaGUgZm9yIChp
ID0gMDsgaSA8IE47IGkrKykgaXMgc3VjaCBhIHN0cm9uZyBwYXJhZGlnbSBpbiBDLiBZb3UN
Cj4+Pj4gaW5zdGFudGx5IGtub3cgaG93IG1hbnkgdGltZXMgeW91J3JlIGdvaW5nIHRvIGxv
b3AsIGF0IGEgZ2xhbmNlLiBOb3Qgc28NCj4+Pj4gd2l0aCB3aXRoIHRoZSBhbHRlcm5hdGl2
ZXMsIHdoaWNoIHNob3VsZCBiZSB1c2VkIHNwYXJpbmdseS4NCj4+Pg0KPj4+IHdoaWxlICgp
IHt9ICBfaXNfIGEgcGFyYWRpZ20sIGZvci1sb29wIGlzIHN5bnRheCBzdWdhciBvbiB0b3Ag
b2YgaXQuDQo+Pg0KPj4gTmF3LCB0aGF0J3Mgbm90IHRydWUuDQo+IA0KPiBJbiB0aGUgc2Vj
dGlvbiAzLjUgIkxvb3BzIC0gV2hpbGUgYW5kIEZvciIgaW4gIlRoZSBDIFByb2dyYW1taW5n
DQo+IExhbmd1YWdlIiAybmQgYnkgSyZSLCB0aGUgYXV0aG9ycyBzYWlkOg0KDQpZZWFyIG9m
IHB1YmxpY2F0aW9uOiAxOTg4IC4gSXQncyBub3QgdGhlIG1vc3QgdXAtdG8tZGF0ZSByZWZl
cmVuY2UgZm9yIEMgDQpwcm9ncmFtbWluZy4NCg0KPiANCj4gCVRoZSBmb3Igc3RhdGVtZW50
IC4uLiBpcyBlcXVpdmFsZW50IHRvIC4uLiB3aGlsZS4uLiINCj4gDQo+IFRoZXkgc2FpZCB0
aGF0IGZvciBpcyBlcXVpdmFsZW50IHRvIHdoaWxlLCBhbmQgbm90IG90aGVyd2lzZS4NCg0K
RXZlbiBsZWF2aW5nIHJlYWRhYmlsaXR5IGFzaWRlLCBpdCdzIG5vdCBlcXVpdmFsZW50LiBZ
b3UgY2FuIGRlY2xhcmUgDQp2YXJpYWJsZXMgYXMgcGFydCBvZiB0aGUgZm9yIHN0YXRlbWVu
dC4gKEkga25vdyBpdCdzIG5vdCB0aGUga2VybmVsJ3MgDQpzdHlsZS4pIEFsc28sICdjb250
aW51ZScgc3RhdGVtZW50cyBhcmUgbm90IHdlbGwtc3VpdGVkIGluIGZvciBsb29wcywgDQpi
ZWNhdXNlIGl0J3Mgbm9uLW9idmlvdXMgaWYgdGhlIGxvb3AncyB1cGRhdGUgc3RhdGVtZW50
IGlzIGJlaW5nIA0KZXhlY3V0ZWQuIChJdCBpc24ndC4pDQoNCj4gDQo+IEFsc28sIHN5bnRh
eCBzdWdhciBieSBkZWZpbml0aW9uIGRlY2xhcmVzIHNvbWV0aGluZyB0aGF0IGNhbiBiZSB3
cml0dGVuIGFzDQo+IGEgc2luZ2xlIGxpbmUgb2YgY29kZSwgd2hpY2ggdXN1YWxseSBpcyBk
b25lIHVzaW5nIG1vcmUgKG5vdCBhbHdheXMpLg0KDQpUaGUgZGlzY3Vzc2lvbiBoYXMgZW50
ZXJlZCB0aGUgcGhhc2Ugb2YgaGFpciBzcGxpdHRpbmcuIEdvb2QuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gDQo+PiBBbiBpZGlvbWF0aWMgZm9yIGxvb3AsIHN1Y2ggYXMgZm9y
IChpID0gLi4uOyBpIDwgTjsNCj4+ICsraSksIGlzIHN1Y2ggYSBzdHJvbmcgcGF0dGVybiB0
aGF0IGl0J3Mgd2F5IGJldHRlciB0aGFuIHRoZSBjb3JyZXNwb25kaW5nDQo+PiB3aGlsZSBs
b29wLg0KPiANCj4+Pj4gQW5kIHllcywgdGhlIGRvLXdoaWxlIHN1Z2dlc3RlZCBhYm92ZSBp
cyBidWdneSwgYW5kIHlvdSBhY3R1YWxseSBuZWVkIHRvDQo+Pj4+IHN0b3AgYW5kIHRoaW5r
IHRvIHNlZSB3aHkuDQo+Pj4NCj4+PiBJdCBkZXBlbmRzIGlmIHBpeGVscyBjYW4gYmUgMCBv
ciBub3QgYW5kIGlmIGl0J3Mgbm90LCB0aGVuIGRvZXMgaXQgY29udGFpbiBsYXN0DQo+Pj4g
b3IgbnVtYmVyLg0KPj4+DQo+Pj4gVGhlIGRvIHt9IHdoaWxlICgtLXBpeGVscyk7IG1pZ2h0
IGJlIGJ1Z2d5IGlmZiBwaXhlbHMgbWF5IGJlIDAuDQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------5AmddLGv5nbVnhIdqMfCesQr--

--------------wzw214BQ5G1QGXbdavDQU2NV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIKR0AFAwAAAAAACgkQlh/E3EQov+Ac
ow//Z+EROskBIHEmVQM20sjUtJUUrIAVs9fdSV4FK1Evvh0BG2a69JtRWb33VnSBkO2vgOzqf/5H
R9svrLtMuH0T4CsNqAHhbo+OpcEkcAVmmQQLPS5WCSQOTgcvZM3TB73MAIvMYvcv37U5/jWLmr2I
7P0JQlQ2idMvPRXuYJfHFl6YS3efbugnZZiYGIvzIATlOHuP7gP9qK9Z+fJBNISzb7ccd6P4L0Q8
OkzmMyFkVlkbTlDjlfrLGH2mJcgc5nCaHHrDYg25EvT0AHJ7KfksEyQvvzy95T0kOqFStCs0Mqxj
6WzT+sEOvP4dlDRIMbCT7lrkui7f91WXOiPbODkK38MKP1qGlwsYvT6KB+sgLhxWSWjramxw67QF
JzICpDRGZWg11l3KF+P18WoF63XsIk7rIZzrhvoi5002LD+9F07WO6D/HKtuzs3CkTo0TtX2Xyn0
6YT7jwZUq12hNjuIVaod4QrP5vUaEYBL/GbxcXpQlJyK9SoTiNt82F0ilcupe3N8LGdkQwDqXnyu
ebESiJHxhtI/mtbBuuWquA/9+KQxnRXT80g6nlF3m8yfx4y6ThhgYQxiVYEa0PrS/3askZiV1k5s
NxK61yFRqwRMg2fxUM6vWLZhNJWHxyAlcI8HJBN//vckzgBUwtHzjtyxKZklDSX/42gSfigtyTld
agc=
=TV7o
-----END PGP SIGNATURE-----

--------------wzw214BQ5G1QGXbdavDQU2NV--

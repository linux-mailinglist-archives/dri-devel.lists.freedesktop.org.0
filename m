Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B26E419B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1419E10E3B6;
	Mon, 17 Apr 2023 07:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE4E10E3B1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:49:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6907D1F38D;
 Mon, 17 Apr 2023 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681717764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4GxL10Fw5U6Pa/Eu8GxfNi+rfmTCX56i2zqdxwFEeXM=;
 b=yXPZUzwEvlamb/CLUvK5FAnlSQwcAcCATFV+OFFJcYqLT0ecv0aeZymeKAhNXZH8ZDLyVU
 xrwRv6SmpH/phJvIUeWDAfCav6pJ1akZxyP11WNguVfhph3hi5XUY2s1mTIsAs7eXLen7S
 yErPbrKI2N9Tge07gEAIbJFtFVLvUXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681717764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4GxL10Fw5U6Pa/Eu8GxfNi+rfmTCX56i2zqdxwFEeXM=;
 b=6ar1PIpmNTqrZkvmeAtdGLUOGHDPdZDmG5uIC6Vwmx5vRwN04vJkJd5cehmLqUshx4F5Oa
 /xtwznTredJAd3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 498011390E;
 Mon, 17 Apr 2023 07:49:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hj7YEAT6PGS3KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 07:49:24 +0000
Message-ID: <c0804aa9-5815-0dd2-61cc-3131fe22a185@suse.de>
Date: Mon, 17 Apr 2023 09:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/2] drm/mgag200: Use 24bit format in VRAM
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230412133912.610294-1-jfalempe@redhat.com>
 <3f060f42-3b8e-2296-eeb9-0f774b5ae3b6@suse.de>
 <c808889e-43e9-3e41-134d-5ce673492047@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c808889e-43e9-3e41-134d-5ce673492047@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TUnsJsG85pnTM4HSWinkd6a4"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TUnsJsG85pnTM4HSWinkd6a4
Content-Type: multipart/mixed; boundary="------------MAoqZvuiQ6NghaHJMWq9ch2n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
Message-ID: <c0804aa9-5815-0dd2-61cc-3131fe22a185@suse.de>
Subject: Re: [RFC PATCH 0/2] drm/mgag200: Use 24bit format in VRAM
References: <20230412133912.610294-1-jfalempe@redhat.com>
 <3f060f42-3b8e-2296-eeb9-0f774b5ae3b6@suse.de>
 <c808889e-43e9-3e41-134d-5ce673492047@redhat.com>
In-Reply-To: <c808889e-43e9-3e41-134d-5ce673492047@redhat.com>

--------------MAoqZvuiQ6NghaHJMWq9ch2n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDQuMjMgdW0gMDk6NTkgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDEzLzA0LzIwMjMgMjE6MjksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkN
Cj4+DQo+PiBBbSAxMi4wNC4yMyB1bSAxNTozOSBzY2hyaWViIEpvY2VseW4gRmFsZW1wZToN
Cj4+PiBUaGUgYmFuZHdpZHRoIGJldHdlZW4gc3lzdGVtIG1lbW9yeSBhbmQgVlJBTSBpcyB2
ZXJ5IGxpbWl0ZWQNCj4+PiBvbiBHMjAwLg0KPj4+IFNvIHdoZW4gdXNpbmcgYSAzMmJpdCBm
cmFtZWJ1ZmZlciBvbiBzeXN0ZW0gbWVtb3J5LCBjb252ZXJ0IGl0IHRvIDI0Yml0DQo+Pj4g
d2hlbiBjb3B5aW5nIHRoZSBmcmFtZSB0byB0aGUgVlJBTSwgdGhpcyBhbGxvd3MgdG8gZ28g
MzMlIGZhc3Rlci4NCj4+PiBDb252ZXJ0aW5nIHRoZSBmb3JtYXQgb24gdGhlIGZseSBpcyBu
ZWdsaWdpYmxlLCBldmVuIG9uIGxvdyBlbmQgQ1BVLg0KPj4NCj4+IEknbSBza2VwdGljYWwg
YWJvdXQgdGhpcyBpZGVhLiBXZSBlbXVsYXRlZCBhIG51bWJlciBvZiBmb3JtYXRzIGluIA0K
Pj4gc2ltcGxlZHJtIGFuZCBnb3QgYSBsb3Qgb2YgZmxhbWVzIGFuZCBwdXNoYmFjay4gVGhl
IGFyZ3VtZW50IHdhcyB0aGF0IA0KPj4gd2Ugc2hvdWxkIGV4cG9ydCB0aGUgZm9ybWF0cyB0
aGF0IGhhcmR3YXJlIHN1cHBvcnRzIGFuZCBub3QgcHJldGVuZCB0byANCj4+IHN1cHBvcnQg
YW55dGhpbmcgZWxzZS4gVGhlIG9ubHkgZXhjZXB0aW9uIGFsbG93ZWQgd2FzIGVtdWxhdGlu
ZyANCj4+IFhSR0I4ODg4LCBiZWNhdXNlIGl0J3MgdGhlIGNvbW1vbiBncm91bmQgaGF0IGV2
ZXJ5dGhpbmcgaW4gdXNlcnNwYWNlIA0KPj4gc3VwcG9ydHMuDQo+Pg0KPj4gSSBzZWUgdGhh
dCB0aGlzIGlzIGEgYml0IGRpZmZlcmVudCBmcm9tIHlvdXIgcGF0Y2hlcywgYnV0IG5vdCBz
byBtdWNoLiANCj4+IFdoZW4gdXNlcnNwYWNlIHdhbnRzIDMyLWJpdCBYUkdCLCBpdCBzaG91
bGQgZ2V0IGl0IGlmIHBvc3NpYmxlLg0KPiANCj4gVGhlIGhhcmR3YXJlIHdpbGwgZHJvcCB0
aGUgOGJpdCBhbHBoYSBhbnl3YXksIHRoZXJlIGlzIG5vIGltYWdlIHF1YWxpdHkgDQo+IGxv
c3MuIFNvIEkgZmluZCBpdCBiZXR0ZXIgdG8gZHJvcCBpdCBiZWZvcmUgc2VuZGluZyBpdCB0
byB0aGUgaGFyZHdhcmUgDQo+IHRvIHNhdmUgYmFuZHdpZHRoLiBBcyB0aGUgbWdhZzIwMCBk
b2Vzbid0IGV4cG9zZSBhbnkgb3RoZXIgDQo+IGZ1bmN0aW9uYWxpdHksIHRoZSB1c2Vyc3Bh
Y2UgY2FuJ3QgZXZlbiByZWFkIHRoZSBWUkFNIGJhY2ssIHNvIGl0J3MgDQo+IHVubGlrZWx5
IHRvIGNhdXNlIGlzc3VlLg0KDQpCZWxpZXZlIG1lLCBJIGtub3cgdGhhdC4gOikgV2UgYWxz
byBtYWRlIHN1Y2ggYXJndW1lbnRzIGluIHRoYXQgDQpkaXNjdXNzaW9uIGFyb3VuZCBzaW1w
bGVkcm0gYW5kIHRoZSBhbnN3ZXIgd2FzIGEgYmlnIE5PLiBUaGlzIGlzIA0KY29uc2lkZXJl
ZCBhICJyZW5kZXJpbmcgcHJvYmxlbSwiIHdoaWNoIGFyZSBiZXR0ZXIgc29sdmVkIGluIHVz
ZXJzcGFjZS4gDQpJZiB5b3UgZ2V0IG92ZXJhbGwgY29uc2VudCBmcm9tIERSTSBkZXZzIHRo
YXQgdGhpcyBvcHRpbWl6YXRpb24gaXMgT0ssIA0KSSdtIG5vdCBnb2luZyB0byBibG9jayBp
dC4gQnV0IEknbSBub3QgZ29pbmcgdG8gZmlnaHQgZm9yIGl0IGVpdGhlci4NCg0KPiANCj4+
DQo+PiBJJ2QgcmF0aGVyIHN1Z2dlc3QgdG8gc2V0IHRoZSBjb25zb2xlIHRvIDE2IGJpdCBh
bmQgYWxzbyByZXNvcnQgdGhlIA0KPj4gZm9ybWF0cyBhcnJheS4gSXQgaXMgc3VwcG9zZWQg
dG8gYmUgc29ydGVkIGJ5IHByZWZlcmVuY2UuIFJHQjU2NSANCj4+IHNob3VsZCBtYXliZSBi
ZSB0aGUgdG9wIG1vc3QgZW50cnksIGZvbGxvd2VkIGJ5IFJHQjg4OC4gVGhlbiB5b3UnZCAN
Cj4+IGhhdmUgdG8gdGVhY2ggdXNlcnNwYWNlIHRvIHJlc3BlY3QgdGhlc2Ugc2V0dGluZ3Mu
IEknbSBub3Qgc3VyZSBpZiBhbGwgDQo+PiBjb21wb3NpdG9ycyBkby4NCj4+DQo+IA0KPiBJ
IGRvbid0IHRoaW5rIHVzZXJzcGFjZSBjYXJlcyBtdWNoIGFib3V0IHZlcnkgb2xkIGhhcmR3
YXJlIGxpa2UgdGhpcyANCj4gb25lLiBJIHdvdWxkIHJhdGhlciBtYWtlIGl0IHdvcmsgYXMg
Z29vZCBhcyBwb3NzaWJsZSB3aXRoIGN1cnJlbnQgDQo+IHVzZXJzcGFjZS4NCj4gRm9yIGV4
YW1wbGUgR25vbWUvV2F5bGFuZCB3b24ndCB3b3JrIGluIDE2Yml0IG9yIDI0Yml0IHBpeGVs
IGRlcHRoLCBhbmQgDQo+IGl0IHdvdWxkIGJlIG11Y2ggaGFyZGVyIHRvIGFkZCBzdXBwb3J0
IGluIHRoZSBjb21wb3NpdG9yIHRoYW4gdGhpcyB+MzYgDQo+IGxpbmVzIHBhdGNoLiBPdGhl
ciBjb21wb3NpdG9ycyBhcmUgcHJvYmFibHkgZXhwZWN0aW5nIDMyYml0IGhhcmR3YXJlIHRv
by4NCj4gbWdhZzIwMCBpcyBhbHNvIGxpa2VseSB0aGUgbGFzdCBoYXJkd2FyZSBmcm9tIHRo
aXMgZXJhIHRoYXQncyBzdGlsbCANCj4gYWxpdmUsIHNvIHdlIGNhbid0IGV4cGVjdCB1c2Vy
c3BhY2UgdG8gYWRkIHNwZWNpZmljIHN1cHBvcnQgZm9yIGl0Lg0KPiANCj4gDQo+IFdlIGNh
biBzdGlsbCBjaGFuZ2UgdGhlIGZvcm1hdCBhcnJheSBvcmRlciwgYnV0IEkgd291bGQgcHV0
IDI0Yml0IGZpcnN0LCANCj4gYXMgMTYgYml0IGlzIGEgYml0IHVnbHkgbm93YWRheXMuDQoN
CjI0LWJpdCBpcyBkZWFkLiBNb3N0IHVzZXJzcGFjZSBkb2Vzbid0IHN1cHBvcnQgaXQgb3Ig
aXQncyBicm9rZW4gb3IgDQpsb29rcyBnYXJibGVkLiBFdmVuIGEgZGVjYWRlIGFnbywgb25s
eSBwaXhtYW4gZ290IGl0IHJpZ2h0LiBUaGF0IA0KcHJvYmFibHkgZGlkbid0IGltcHJvdmUg
c2luY2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiBCZXN0IHJlZ2FyZHMN
Cj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+IFtQQVRDSCAxLzJdIGRybS9tZ2FnMjAwOiBzaW1w
bGlmeSBvZmZzZXQgYW5kIHNjYWxlIGNvbXB1dGF0aW9uLg0KPj4+IFtQQVRDSCAyLzJdIGRy
bS9tZ2FnMjAwOiBVc2UgMjRiaXQgZm9ybWF0IGluIFZSQU0NCj4+Pg0KPj4+IGRyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIHwgODcgDQo+Pj4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4NCj4+Pg0KPj4NCj4gDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------MAoqZvuiQ6NghaHJMWq9ch2n--

--------------TUnsJsG85pnTM4HSWinkd6a4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ8+gMFAwAAAAAACgkQlh/E3EQov+Cg
iQ/9F6tJkv1HmzifP6UMMu72Y5mtepgJwmtRf0G/nhYKLasfBpwtpQ9/u48rZMNINIE+1tbD5nXR
d/W8G8o/4l+pOSX5QymeQSx/5+6uNdIFSdBFHDXfeyQAKlA2UThWd47VIhE1jwg6HDkDrJu6y/Ae
1PiZodJQW5J8BfUxyq7xKb8+tAk9Z9/mK68Vwb6x75vZ9eUhe5329b2c4rkF0iwFXJqKJQCTnTzw
WuHEJdVG39SfmHO63POp7uFZXmSAhreSfizVTxFnD5moWQQttW8HTzvChXoxneXHkCwL2dXcjhd1
LyVVA+DaQHeNMYvXkCy8dpkrAuT76rTQKCf2CSaND98wdGW5It3jnJzUgiRAKTuMUZwwDoIVgl3P
vO5nX4CTFCFIapAXpsX4LzGoA90ko6vF7qYNfyN0SFsO+i4npYhSfzm9TqNOM1W7lapnqhaYorQl
fFVGCXLexhT1ypo57xxkHz7rYxsl5pgdi6Rv83zxJs3xu/pQxFxbXqliOFVsXISkTU0PHEqrv2On
upWPMLz67jmlXoi1kvk7CfoqSXKwfBD0CkWamPNgCuN0RGAMURvQur77N1f4sr2MU9Dd8UgqjeAc
Jk7XSbr9XDr88v3pxFlb8HIvcOrGTedDmdY2dY1NMvUg8BoZtZcUQI2BbWjosR3RDr9E+MUNM7MZ
mwE=
=+fqL
-----END PGP SIGNATURE-----

--------------TUnsJsG85pnTM4HSWinkd6a4--

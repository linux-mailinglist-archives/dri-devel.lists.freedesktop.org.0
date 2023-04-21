Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A736EA93E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7C910EE07;
	Fri, 21 Apr 2023 11:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F9310EE00
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:35:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52B0A219BB;
 Fri, 21 Apr 2023 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682076936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVGdVu420a3TS41SJqRbrZn72Qum9ITPdCfb8Uoghas=;
 b=w1cLP3eOBWwEefXgEfYr927TtJuWxjQ1QWMxGDBL7pJMT/GwB651LRnpEFyCy9mJzkdJ1g
 2RSp3OzIg2bBDeC9Rzbxjie7k+sd/cA5fZLXs72sVAbvfEkMU1YR3YY+xctrCSsZAVVrSK
 nHPgnZHUMk/4FMY+NpvXSFPSDiIAalA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682076936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVGdVu420a3TS41SJqRbrZn72Qum9ITPdCfb8Uoghas=;
 b=WF7P4a02TdpV1pq4O+EiDRAdDHhI235poiEVRKJB1JtmFttuPP8AnCOaaN5gLorNex2xrG
 QQR/WPVAbOnrWzCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23A8B13456;
 Fri, 21 Apr 2023 11:35:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UR3HBwh1QmRUGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Apr 2023 11:35:36 +0000
Message-ID: <d8d22c77-1bde-774f-aa6e-41234ffa6e8d@suse.de>
Date: Fri, 21 Apr 2023 13:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] firmware/sysfb: Fix VESA format selection
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
References: <20230420155705.21463-1-pa@panix.com>
 <c4c09a67-6897-751c-c091-6e33f48542cc@leemhuis.info>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c4c09a67-6897-751c-c091-6e33f48542cc@leemhuis.info>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D3QSux1f8bYK9aNStya37xMH"
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
Cc: Ard Biesheuvel <ardb@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------D3QSux1f8bYK9aNStya37xMH
Content-Type: multipart/mixed; boundary="------------7lUGiFKn1azxFZlP2XRHGD3S";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <d8d22c77-1bde-774f-aa6e-41234ffa6e8d@suse.de>
Subject: Re: [PATCH v3] firmware/sysfb: Fix VESA format selection
References: <20230420155705.21463-1-pa@panix.com>
 <c4c09a67-6897-751c-c091-6e33f48542cc@leemhuis.info>
In-Reply-To: <c4c09a67-6897-751c-c091-6e33f48542cc@leemhuis.info>

--------------7lUGiFKn1azxFZlP2XRHGD3S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjMgdW0gMTM6MzIgc2NocmllYiBMaW51eCByZWdyZXNzaW9uIHRy
YWNraW5nIChUaG9yc3RlbiBMZWVtaHVpcyk6DQo+IE9uIDIwLjA0LjIzIDE3OjU3LCBQaWVy
cmUgQXNzZWxpbiB3cm90ZToNCj4+IFNvbWUgbGVnYWN5IEJJT1NlcyByZXBvcnQgbm8gcmVz
ZXJ2ZWQgYml0cyBpbiB0aGVpciAzMi1iaXQgcmdiIG1vZGUsDQo+PiBicmVha2luZyB0aGUg
Y2FsY3VsYXRpb24gb2YgYml0c19wZXJfcGl4ZWwgaW4gY29tbWl0IGYzNWNkM2ZhNzcyOQ0K
Pj4gKCJmaXJtd2FyZS9zeXNmYjogRml4IEVGSS9WRVNBIGZvcm1hdCBzZWxlY3Rpb24iKS4g
IEhvd2V2ZXIgdGhleSByZXBvcnQNCj4+IGxmYl9kZXB0aCBjb3JyZWN0bHkgZm9yIHRob3Nl
IG1vZGVzLiAgS2VlcCB0aGUgY29tcHV0YXRpb24gYnV0DQo+PiBzZXQgYml0c19wZXJfcGl4
ZWwgdG8gbGZiX2RlcHRoIGlmIHRoZSBsYXR0ZXIgaXMgbGFyZ2VyLg0KPj4NCj4+IHYyIGZp
eGVzIHRoZSB3YXJuaW5ncyBmcm9tIGEgbWF4MygpIG1hY3JvIHdpdGggYXJndW1lbnRzIG9m
IGRpZmZlcmVudA0KPj4gdHlwZXM7ICBzcGxpdCB0aGUgYml0c19wZXJfcGl4ZWwgYXNzaWdu
bWVudCB0byBhdm9pZCB1Z2x5ZmluZyB0aGUgY29kZQ0KPj4gd2l0aCB0b28gbWFueSBjYXN0
cy4NCj4+DQo+PiB2MyBmaXhlcyBzcGFjZSBhbmQgZm9ybWF0dGluZyBibGlwcyBwb2ludGVk
IG91dCBieSBKYXZpZXIsIGFuZCBjaGFuZ2UNCj4+IHRoZSBiaXRfcGVyX3BpeGVsIGFzc2ln
bm1lbnQgYmFjayB0byBhIHNpbmdsZSBzdGF0ZW1lbnQgdXNpbmcgdHdvIGNhc3RzLg0KPj4N
Cj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvNFBzbTZCNkxxa3oxUVhNQHBh
bml4My5wYW5peC5jb20NCj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
MzA0MTIxNTAyMjUuMzc1NzIyMy0xLWphdmllcm1AcmVkaGF0LmNvbQ0KPj4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjMwNDE4MTgzMzI1LjIzMjctMS1w
YUBwYW5peC5jb20vVC8jdQ0KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJp
LWRldmVsLzIwMjMwNDE5MDQ0ODM0LjEwODE2LTEtcGFAcGFuaXguY29tL1QvI3UNCj4+IEZp
eGVzOiBmMzVjZDNmYTc3MjkgKCJmaXJtd2FyZS9zeXNmYjogRml4IEVGSS9WRVNBIGZvcm1h
dCBzZWxlY3Rpb24iKQ0KPj4gU2lnbmVkLW9mZi1ieTogUGllcnJlIEFzc2VsaW4gPHBhQHBh
bml4LmNvbT4NCj4gDQo+IExpbnVzIG1pZ2h0IHJlbGVhc2UgdGhlIGZpbmFsIHRoaXMgd2Vl
a2VuZCBhbmQgdGhpcyBpcyBhbW9uZyB0aGUgbGFzdA0KPiBmZXcgNi4zIHJlZ3Jlc3Npb25z
IEkgdHJhY2suIEhlbmNlIHBsZWFzZSBhbGxvdyBtZSB0byBhc2s6DQo+IA0KPiBQaWVycmUs
IFRvbWFzLCBKYXZpZXIsIGV0LiBhbDogaG93IG1hbnkgImxlZ2FjeSBCSU9TZXMiIGRvIHdl
IHN1c3BlY3QNCj4gYXJlIGFmZmVjdGVkIGJ5IHRoaXM/IFNvIG1hbnkgdGhhdCBpdCBtaWdo
dCBiZSB3b3J0aCBkZWxheWluZyB0aGUNCj4gcmVsZWFzZSBieSBvbmUgd2Vlaz8gQW5kIGlu
IGNhc2UgZXZlcnlib2R5IGludm9sdmVkIG1pZ2h0IGFncmVlIHRoYXQNCj4gdGhpcyBwYXRj
aCBpcyByZWFkeSBieSB0b2RheSBvciB0b21vcnJvdzogbWlnaHQgaXQgYmUgd29ydGggYXNr
aW5nIExpbnVzDQo+IHRvIG1lcmdlIHRoaXMgcGF0Y2ggZGlyZWN0bHlbMV0/DQo+IA0KPiBb
RldJVywgSSBoaWdobHkgc3VzcGVjdCB0aGUgYW5zd2VyIHRvIHRoZSBsYXN0IHR3byBxdWVz
dGlvbnMgaXMgIm5vLA0KPiB0aGF0J3MgZGVmaW5pdGVseSBub3Qgd29ydGggaXMiLCBqdXN0
IHdhbnRlZCB0byBjb25maXJtXQ0KDQpJTUhPIGl0J3MgYSBmYWlybHkgb2JzY3VyZSBidWcg
YW5kIGNlcnRhaW5seSBub3QgYSByZWxlYXNlIGJsb2NrZXIuIEknbGwgDQpzZW5kIGl0IHRo
cm91Z2ggdGhlIHJlZ3VsYXIgY2hhbm5lbHMgb2YgdGhlIERSTSBzdWJzeXN0ZW0uDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IENpYW8sIFRob3JzdGVuICh3ZWFyaW5nIGhp
cyAndGhlIExpbnV4IGtlcm5lbCdzIHJlZ3Jlc3Npb24gdHJhY2tlcicgaGF0KQ0KPiAtLQ0K
PiBFdmVyeXRoaW5nIHlvdSB3YW5uYSBrbm93IGFib3V0IExpbnV4IGtlcm5lbCByZWdyZXNz
aW9uIHRyYWNraW5nOg0KPiBodHRwczovL2xpbnV4LXJlZ3RyYWNraW5nLmxlZW1odWlzLmlu
Zm8vYWJvdXQvI3RsZHINCj4gSWYgSSBkaWQgc29tZXRoaW5nIHN0dXBpZCwgcGxlYXNlIHRl
bGwgbWUsIGFzIGV4cGxhaW5lZCBvbiB0aGF0IHBhZ2UuDQo+IA0KPiBbMV0geWVzLCB0aGF0
J3MgYSB0aGluZyB3ZSBkbzoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBSGst
PXdpc19xUXk0b0ROeW5OS2k1YjdRaG9zbXh0b2oxanhvNXdtQjZTUlV3UVVCUUBtYWlsLmdt
YWlsLmNvbS8NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------7lUGiFKn1azxFZlP2XRHGD3S--

--------------D3QSux1f8bYK9aNStya37xMH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRCdQcFAwAAAAAACgkQlh/E3EQov+Aj
AA//aJVtYDQx6U4bn0pAuyHbSPfNL+kICdSb3aJwe75gPRuDGelSjpCqKGcfWPwTH6QhtMhFZEGM
PtNOdCLfEjnrSYyOiJLS9/3ELBdHDnNkrDkPMK/j/Mq7I9gO79+97O61hVSwK/262Kn9aFSnPia1
muRwO789TvNVwnwD0106von+MM0nTzccqrK00+85fksC3NNN2g9PcN5Hz0URhcoEjoNt/BmJkfSs
lxeOBtlaKlRyUyCMOBJBaod3dBhACJHDFdyosJ0b2U2O8Y/7t2wKV4R/zxr3EEQvSwyawTf0kmEe
Fj3MKiKRPFqbePWdOlMURKB3j7RjdMJC41YUfGmpLsTDYL8cVGRZW7lOoHXTgTFNmLfe62nWqpYW
QvX7rWbNTgrhzRJFXvIIieBJ4h40Vupa2QgYktylceBdksYXqEhj+chdSIvj0PfREcjdFDo/yPZZ
9YVDhA5aVLg7OrVZBmABJyTHp8Ecy3qrbT8GaAY5X4+MKe7rJm00n6tZQciar21JLlf0wy91Kp4y
mP5oMBOSYESStl6dhdmHz7asNyM11iQvd1bNt8CvM1bZZJtFo6TTt3iP1sUfDSZU12BbyUCFy1+m
hDE8uDErpFxsdnul9sUhRnNLdKMrzucE+1iBB4+6lWmHyhvWVfGbNZ33252YjNJuh7kR9S4ueeGi
EWk=
=2DIT
-----END PGP SIGNATURE-----

--------------D3QSux1f8bYK9aNStya37xMH--

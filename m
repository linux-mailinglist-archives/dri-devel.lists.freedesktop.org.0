Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE756148D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 10:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169C210F963;
	Thu, 30 Jun 2022 08:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88110F675
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:19:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 410C81F9D6;
 Thu, 30 Jun 2022 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656577154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKYkM13s042QKLtL51gMrCd5fWh96BXvIf/BAinukYE=;
 b=hT4tlDRHqz4Co8/CK0kvWZTWuMUESA5PRjuldoCgpzWUMYR8g5OKoIz14d382xGxu/gsjF
 fUnB52KE560ytXkCFS2oJs8P7Xrt4HWoR7JUUb8pTG2FvJVjmHSk6iCIV75mxWdgiKgo6q
 9CuLAOIPcdjMGZp/ME2ksd6iY51Trtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656577154;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKYkM13s042QKLtL51gMrCd5fWh96BXvIf/BAinukYE=;
 b=shqRMgh+FubZtXX6U+FtyerrbQbcJTph1bBb8Oio9/dvcSJPKlKEpyhIoFfVxEESJ32aZp
 fCLLwK6qAR1NesDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21252139E9;
 Thu, 30 Jun 2022 08:19:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eVD0BoJcvWLARAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Jun 2022 08:19:14 +0000
Message-ID: <dae59187-a055-2699-bee1-c066b69627b0@suse.de>
Date: Thu, 30 Jun 2022 10:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
 <Yroh0fe4Fzqgam3W@ravnborg.org>
 <58475858-cc98-0aab-d248-f3473b179fab@suse.de>
 <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r8x50YysIOY5r0LWhQNLqNSk"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r8x50YysIOY5r0LWhQNLqNSk
Content-Type: multipart/mixed; boundary="------------iGZ2vJsNoAVelivJmcAiNNiS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Message-ID: <dae59187-a055-2699-bee1-c066b69627b0@suse.de>
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
 <Yroh0fe4Fzqgam3W@ravnborg.org>
 <58475858-cc98-0aab-d248-f3473b179fab@suse.de>
 <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>
In-Reply-To: <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>

--------------iGZ2vJsNoAVelivJmcAiNNiS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDYuMjIgdW0gMTA6MDcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvLA0KPiANCj4gT24gNi8yOC8yMiAxNDoyMSwgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDI3LjA2LjIyIHVtIDIzOjMyIHNjaHJp
ZWIgU2FtIFJhdm5ib3JnOg0KPj4+IEhpIEtldmluL1Rob21hcywNCj4+Pg0KPj4+Pg0KPj4+
PiBJIGhhZCBhIGJyaWVmIGxvb2sgb3ZlciB0aGUgcGF0Y2hlcy4gRXZlbiB0aG91Z2ggdGhl
IGNvZGUgbG9va3MgZmFpcmx5IHJvdWdoDQo+Pj4+IGluIHBsYWNlcywgSSB0aGluayB3ZSBz
aG91bGQgZ2V0IHRoaXMgZHJpdmVyIG1lcmdlZCBBU0FQLg0KPj4+DQo+Pj4gQWdyZWVkLCB3
ZSBoYXZlIGEgaGFkIGEgZmV3IGNhc2VzIHdoZXJlIHdlIGRyYWdnZWQgb3V0IGNvbW1pdHRp
bmcgbXVjaA0KPj4+IHRvbyBsb25nIHRpbWUuDQo+Pj4NCj4+PiBUaW1pbmcgd2lzZSwgaXQg
d291bGQgYmUgZ29vZCBpZiB3ZSBjYW4gYWxyZWFkeSBoaXQgZHJtLW1pc2MtbmV4dCByaWdo
dA0KPj4+IF9hZnRlcl8gdGhlIHB1bGwgLXNvIHdlIGhhdmUgYSBmdWxsIGN5Y2xlIHRvIGZp
eCBhbnl0aGluZyBiZWZvcmUgaXQgaGl0cw0KPj4+IG1haW5saW5lLg0KPj4+DQo+Pj4+IEZv
ciB0aGUgb2xkIHZpYSBkcml2ZXIsIEkgdGhpbmsgd2UgbmVlZCBhIGJldHRlciBhcHByYWNo
LiBJTUhPIGl0IHdvdWxkIGJlDQo+Pj4+IHByZWZlcmFibGUgdG8gcHV0IHRoZSBuZXcgZHJp
dmVyIGludG8gdmlhLyBidXQga2VlcCB0aGUgb2xkIGRyaXZlciB0aGVyZSBhcw0KPj4+PiB3
ZWxsLiAgQSBidWlsZCBvcHRpb24gd291bGQgY29udHJvbCB3aGljaCBpcyBiZWluZyB1c2Vk
Lg0KPj4+DQo+Pj4gSSBhc3N1bWUgdGhlIHVzZXIgYmFzZSBmb3IgdmlhIGRyaXZlcnMgYXJl
IHZlcnkgc21hbGwgYW5kIHRoZXkgaGF2ZSB0aGUNCj4+PiBmYmRldiBkcml2ZXIgYWxyZWFk
eS4NCj4+PiBTbyBJIHN1cHBvcnQgcmVwbGFjaW5nIHRoZSBjdXJyZW50IHZpYSBkcm0gZHJp
dmVyIGFzIEtldmluIHRyaWVzIHRvIGRvLg0KPj4NCj4+IEkgZG9uJ3Qga25vdyBpZiB0aGVy
ZSBhcmUgc3RpbGwgdXNlcnMgb2YgdGhlIG9sZCB1c2Vyc3BhY2UsIGJ1dCBpZiBzbyBJDQo+
PiB3b3VsZCBjb25zaWRlciB0aGlzIHJlbW92YWwgYSByZWdyZXNzaW9uLiBJIHRoaW5rIHRo
ZSBvbGQgY29kZSBzdXBwb3J0cw0KPj4gM2QgYW5kIHZpZGVvIGRlY29kaW5nLiBEZXBlbmRp
bmcgb24gdGhlIGZlYXR1cmUgc2V0LCAzZCBzdXBwb3J0IG1pZ2h0DQo+PiBub3QgYmUgdXNl
ZnVsIGFueSBsb25nZXIsIGJ1dCB2aWRlbyBkZWNvZGluZyBwcm9iYWJseSBpcy4gIChJIG1p
Z2h0IGJlDQo+PiB3cm9uZyBhYm91dCBhbGwgdGhpcy4pIElNSE8gd2Ugc2hvdWxkIG5vdCBz
aW1wbHkgcmVtb3ZlIHRoaXMgYXQgbGVhc3QNCj4+IHVudGlsIHdlIGNhbiB2ZXJpZnkgdGhh
dCBpdCdzIG5vIGxvbmdlciB1c2VmdWwgdG8gYW55b25lLg0KPj4NCj4gDQo+IEkgc3Ryb25n
bHkgYWdyZWUgd2l0aCBUaG9tYXMgb24gdGhpcy4NCj4gICANCj4+IEhvd2V2ZXIsIGxlZ2Fj
eSBzdXBwb3J0IGlzIHRyaXZpYWwuIEtldmluLCBwbGVhc2Ugc2VlIHRoZSBhdHRhY2hlZCBm
aWxlcw0KPj4gZm9yIHR3byBjbGVhbnVwIHBhdGNoZXMuIFlvdSdyZSB3ZWxjb21lIHRvIGFk
ZCB0aGVtIHRvIHRoZSBzdGFydCBvZiB5b3VyDQo+PiBwYXRjaHNldCB0byBnZXQgdGhlIGxl
Z2FjeSBjb2RlIG91dCBvZiB0aGUgd2F5Lg0KPj4NCj4gDQo+IEknbSBub3Qgc3VyZSBhYm91
dCB0aGlzIGFwcHJvYWNoLCBJIHRoaW5rIHRoYXQgaGF2aW5nIGNvbXBsZXRlbHkgc2VwYXJh
dGVkDQo+IGRyaXZlcnMgd291bGQgYmUgYmV0dGVyIHRvIG1haW50YWluIGluIHRoZSBsb25n
IHJ1biBzaW5jZSBpdCdzIGxpa2VseSB0aGF0DQo+IHRoZSBsZWdhY3kgVklBIGRyaXZlciB3
aWxsIG9ubHkgZ2V0IGJ1ZyBmaXhlcyAoaWYgYW55KSBhbmQgY291bGQgYmUgcmVtb3ZlZA0K
PiBvbmNlIHRoZSBuZXcgbW9kc2V0dGluZyBkcml2ZXIgaGFzIGZlYXR1cmUgcGFyaXR5LCB0
aGUgbGVnYWN5IGNhbiBiZSBkcm9wcGVkLg0KPiAgIA0KPiBNYXliZSBhbiBhbHRlcm5hdGl2
ZSBjb3VsZCBiZSB0byBhZGQgYSBkcml2ZXJzL2dwdS9kcm0vbGVnYWN5IGRpcmVjdG9yeSBh
bmQNCj4gbW92ZSBhbGwgdGhlIGxlZ2FjeSBEUk0gZHJpdmVycyB0aGVyZSA/IEFuZCB0aGUg
S2NvbmZpZyBzeW1ib2wgY291bGQgYmUgaS5lOg0KPiBDT05GSUdfRFJNX0xFR0FDWV9WSUEg
YW5kIHNhbWUgZm9yIHRoZSBvdGhlcnMgbGVnYWN5IERSTSBkcml2ZXJzLg0KPiANCj4gQW5k
IHRoZSBkaXJlY3RvcnkgY291bGQgb25seSBiZSBzb3VyY2VkIGZyb20gS2NvbmZpZyB3aGVu
IENPTkZJR19EUk1fTEVHQUNZDQo+IGlzIGVuYWJsZWQgYW5kIG1ha2UgaXQgZGVmYXVsdCB0
byBuLiBJZiBpbiBhIGZldyBvZiByZWxlYXNlcyBub2JvZHkgY29tcGxhaW5zDQo+IHRoZW4g
dGhlIHdob2xlIGRpcmVjdG9yeSBjb3VsZCBiZSByZW1vdmVkLg0KPiANCg0KVGhhdCBzZWVt
cyBhIGxvdCBvZiB3b3JrIGZvciBzaW1wbHkgcmVtb3Zpbmcgc29tZXRoaW5nLiBBbmQgSSdt
IHN1cmUgDQp0aGF0IHBlb3BsZSB3aWxsIG9ubHkgY29tcGxhaW4gYWZ0ZXIgbGVnYWN5L3Zp
YSBnb3QgcmVtb3ZlZC4NCg0KSWYgd2Ugd2FudCB0byBzZXBhcmF0ZSBjb2RlIGZvciB0aGUg
b2xkIGFuZCBuZXcgVklBIGRyaXZlciwgbGV0J3MgcHV0IA0KdGhlIG5ldyBjb2RlIGludG8g
IHVuaWNocm9tZS8gYW5kIGJlIGRvbmUgd2l0aCBpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------iGZ2vJsNoAVelivJmcAiNNiS--

--------------r8x50YysIOY5r0LWhQNLqNSk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK9XIEFAwAAAAAACgkQlh/E3EQov+CQ
gxAAkZ7VJKVLjmTgRO8PKGXEx5QNcwbRnIGHrS3vI6RsiHSm+6MdDdEnH4SDzAC5IzgissAudZHd
jY4ibo28DYUYM7jNatagUkskbTvpof39ADVNPRTQ4UHg4yrnb0H/ojNto0uyGPU3jxdapW1GkQM8
IQgmF+3A6CVsP3fTbiIVf+kigAS8WWgEkn06AAUAyBq0FMcITpFjMXuRKNs2uYFfDuckj45A9EUZ
TA025dI7Lv/4BdDEy7yOLQz25rXi/9lpuIWvQQrpuNcYznqRNQwSxmKsCVsyD2bb7kHHCotGg5+P
gg1H/4AA9krnJuq8W5sxYM0HU4In4KuY4TegzkpQfJoyMLR/fEjU4O2t9jMWaTV1DMORL+WQFh0B
ucssauEg6W/6/NpL0S03geOfOk94BI8Yjufspwb4hMMcUTU7CWWPT1t18ZpsEFBd3hq4GbP7NL0S
soiK9V9yTVBQ3rQc+8wNGjy2hl1K8hhQHDLijnFqRTDL/rWzNgvl8hd3NcCWtnErX0khCNNeX5Xn
6fDsvVNjh//mrNyIidSy6WJ0Gg/7jncjwdAMowRRevn3UZ0+vipBrKW2mQ9NcOZ5vSAxJKiU+LJ3
JaakUlAOBUGoacifHOEtpgKCMW1Go850t7STssWLCHFY1ytZMVrs5CnoaKc08CJHr3AUvuQOWy3z
DcU=
=2x2E
-----END PGP SIGNATURE-----

--------------r8x50YysIOY5r0LWhQNLqNSk--

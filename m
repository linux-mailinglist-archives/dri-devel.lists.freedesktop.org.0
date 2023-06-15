Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A40E731990
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 15:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2099110E4E6;
	Thu, 15 Jun 2023 13:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134EB10E4F5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:06:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0721223ED;
 Thu, 15 Jun 2023 13:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686834389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YPwlg25jLGaHT3oj2DubbGYtU0RJM6ImkkU7cEnCagg=;
 b=THle+G0AQvH4k9UPtgierHCbRY7nXJDDCl4OFDcuMVKru5VFjhIrIDBHQdH+Z0O4YfrIou
 vcMvavvY/ib/0o4hnZgPxE/oQE1GHrSD6gcKuojcferz/KPcHDMFMDUzJjX2aOoKmbGwtz
 cT90VGcEzSEmSjwH3L4YhjFWoz8wFbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686834389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YPwlg25jLGaHT3oj2DubbGYtU0RJM6ImkkU7cEnCagg=;
 b=Ot2Hg7P/MPe+PboV3rKSt/pFxiHOzjFNo139/UwcXQssONiu/NZqgBjx3xARILGrxa4T9N
 6SKsJOrOxDp/XgCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FD4913467;
 Thu, 15 Jun 2023 13:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ck3ZIdUMi2T1SAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jun 2023 13:06:29 +0000
Message-ID: <fe3b90b0-b52f-9677-0245-a201975c3e0c@suse.de>
Date: Thu, 15 Jun 2023 15:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Salvatore Bonaccorso <carnil@debian.org>, Cyril Brulebois <cyril@debamax.com>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com> <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MIFWyohkbRqZtPZHrrSmrfsA"
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
Cc: stable@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MIFWyohkbRqZtPZHrrSmrfsA
Content-Type: multipart/mixed; boundary="------------5nyOBEXATYgsVY80Vv7FLhml";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Salvatore Bonaccorso <carnil@debian.org>, Cyril Brulebois <cyril@debamax.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Michal Suchanek <msuchanek@suse.de>
Message-ID: <fe3b90b0-b52f-9677-0245-a201975c3e0c@suse.de>
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com> <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
In-Reply-To: <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>

--------------5nyOBEXATYgsVY80Vv7FLhml
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDYuMjMgdW0gMTU6MDMgc2NocmllYiBMaW51eCByZWdyZXNzaW9uIHRy
YWNraW5nIChUaG9yc3RlbiBMZWVtaHVpcyk6DQo+IE9uIDE2LjA0LjIzIDE0OjM0LCBTYWx2
YXRvcmUgQm9uYWNjb3JzbyB3cm90ZToNCj4+DQo+PiBPbiBXZWQsIEFwciAxMiwgMjAyMyBh
dCAxMTo1NTowOEFNICswMjAwLCBDeXJpbCBCcnVsZWJvaXMgd3JvdGU6DQo+Pj4gU2luY2Ug
Y29tbWl0IDI0MWQyZmI1NmExOCAoIm9mOiBNYWtlIE9GIGZyYW1lYnVmZmVyIGRldmljZSBu
YW1lcyB1bmlxdWUiKSwNCj4+PiBhcyBzcG90dGVkIGJ5IEZyw6lkw6lyaWMgQm9ubmFyZCwg
dGhlIGhpc3RvcmljYWwgIm9mLWRpc3BsYXkiIGRldmljZSBpcw0KPj4+IGdvbmU6IHRoZSB1
cGRhdGVkIGxvZ2ljIGNyZWF0ZXMgIm9mLWRpc3BsYXkuMCIgaW5zdGVhZCwgdGhlbiBhcyBt
YW55DQo+Pj4gIm9mLWRpc3BsYXkuTiIgYXMgcmVxdWlyZWQuDQo+Pj4NCj4+PiBUaGlzIG1l
YW5zIHRoYXQgb2ZmYiBubyBsb25nZXIgZmluZHMgdGhlIGV4cGVjdGVkIGRldmljZSwgd2hp
Y2ggcHJldmVudHMNCj4+PiB0aGUgRGViaWFuIEluc3RhbGxlciBmcm9tIHNldHRpbmcgdXAg
aXRzIGludGVyZmFjZSwgYXQgbGVhc3Qgb24gcHBjNjRlbC4NCj4+Pg0KPj4+IEl0IG1pZ2h0
IGJlIGJldHRlciB0byBpdGVyYXRlIG9uIGFsbCBwb3NzaWJsZSBub2RlcywgYnV0IHVwZGF0
aW5nIHRoZQ0KPj4+IGhhcmRjb2RlZCBkZXZpY2UgZnJvbSAib2YtZGlzcGxheSIgdG8gIm9m
LWRpc3BsYXkuMCIgaXMgY29uZmlybWVkIHRvIGZpeA0KPj4+IHRoZSBEZWJpYW4gSW5zdGFs
bGVyIGF0IHRoZSB2ZXJ5IGxlYXN0Lg0KPj4gWy4uLl0NCj4+ICNyZWd6Ym90IF5pbnRyb2R1
Y2VkIDI0MWQyZmI1NmExOA0KPj4gI3JlZ3pib3QgdGl0bGU6IE9wZW4gRmlybXdhcmUgZnJh
bWVidWZmZXIgY2Fubm90IGZpbmQgb2YtZGlzcGxheQ0KPj4gI3JlZ3pib3QgbGluazogaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTczMjgNCj4+ICNy
ZWd6Ym90IGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQxMjA5NTUw
OS4yMTk2MTYyLTEtY3lyaWxAZGViYW1heC5jb20vVC8jbTM0NDkzNDgwMjQzYTJjYWQyYWUz
NTlhYmZkOWRiNWU3NTVmNDFhZGQNCj4+ICNyZWd6Ym90IGxpbms6IGh0dHBzOi8vYnVncy5k
ZWJpYW4ub3JnLzEwMzMwNTgNCj4gDQo+IE5vIHJlcGx5IHRvIG15IHN0YXR1cyBpbnF1aXJ5
WzFdIGEgZmV3IHdlZWtzIGFnbywgc28gSSBoYXZlIHRvIGFzc3VtZQ0KPiBub2JvZHkgY2Fy
ZXMgYW55bW9yZS4gSWYgc29tZWJvZHkgc3RpbGwgY2FyZXMsIGhvbGxlciENCg0KSSdkIHRh
a2UgYSBsb29rIGlmIGFueW9uZSBjYW4gcG9pbnQgbWUgdG8gYW4gZXhhbXBsZSBvZiBHZWVy
dCdzIHByb3Bvc2FsLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAjcmVnemJv
dCBpbmNvbmNsdXNpdmU6IG5vIGFuc3dlciB0byBhIHN0YXR1cyBpbnF1aXJ5DQo+ICNyZWd6
Ym90IGlnbm9yZS1hY3Rpdml0eQ0KPiANCj4gWzFdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvZDFhZWU3ZDMtMDVmNi0wOTIwLWI4ZTEtNGVkNWNmM2Y5ZjcwQGxlZW1odWlz
LmluZm8vDQo+IA0KPiBDaWFvLCBUaG9yc3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBr
ZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXInIGhhdCkNCj4gLS0NCj4gRXZlcnl0aGluZyB5
b3Ugd2FubmEga25vdyBhYm91dCBMaW51eCBrZXJuZWwgcmVncmVzc2lvbiB0cmFja2luZzoN
Cj4gaHR0cHM6Ly9saW51eC1yZWd0cmFja2luZy5sZWVtaHVpcy5pbmZvL2Fib3V0LyN0bGRy
DQo+IElmIEkgZGlkIHNvbWV0aGluZyBzdHVwaWQsIHBsZWFzZSB0ZWxsIG1lLCBhcyBleHBs
YWluZWQgb24gdGhhdCBwYWdlLg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjog
SXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------5nyOBEXATYgsVY80Vv7FLhml--

--------------MIFWyohkbRqZtPZHrrSmrfsA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSLDNQFAwAAAAAACgkQlh/E3EQov+Db
kQ/+KGqbOla/cqP49fzHPrd8Zbcp2WJaa6P1g8Ygr6U92wVzKB5XaGdUSBaD9tJsOC4LQKwRDoGW
mLeM4ubyCw7mZyTkg/Uy7J9PctsQlxOuolsW6hkQ0Ubl0SaFyQ2sPUMJINz7lTFmP4KzqRM1/AdE
O/q67Jh5QbA9Dmr1nxOxkOZbhz8k/KsuQMcrc7FmyXqfr60OPBhwumx7chWfxeKZYIh/9RSQEQEs
mGnbmxC4tTxOHspJpP0yBy4GN/ebQhS+53r4KH9B561FBsXMEEnZLBEbdrB0J0MQ7szIsqHyzuEa
uSZgjVvp8Jr2IdD6kHjL1TfikTVRGwNzgiiWvwew8nAEPuQ7KNUuuxDzF2H5jRdjlHLoY0b4nakL
s5ESzr8BOCcAqIqdlmupyXgQslxSwkcRHXWGYh99Nl45ONStGqjOv6s6LKJO6gIOLNjKdwK38e87
mO4WeCl23Wx6P/M5//6g20lS0yV5RwhQoXgCUvJhsvFYjt7gXLo/0qDLbGz9zKK6MeR19j0w3sGK
+apq/u/K4VqUNX806CHnNY4xejQ9713vlvmOHXay2yAtaRJ57avpx9XAdNfOT4p6HKicdsvpn3Db
palLXstjkp/G06TbjLqaV+lqmAgSOsrMB1Js2C9k5tcCh/fKF1XIf7f9sXFAs8x9AWKs75eQcjuD
HGk=
=iH2J
-----END PGP SIGNATURE-----

--------------MIFWyohkbRqZtPZHrrSmrfsA--

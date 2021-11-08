Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1FF447BFB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 09:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5282E6E44E;
	Mon,  8 Nov 2021 08:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B116E44E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 08:37:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F14361FD6D;
 Mon,  8 Nov 2021 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636360621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m47UAY2ZcyR+FhtsO4aVyPTcYB/9rHV9T+gQ8c/5pAk=;
 b=Minh2m7rxvc2DMoW2LH2qYO5gOW8gSGAozwRYB+8B9kXCTsrC0Miapuo/aA5erTLxKXKSh
 2mU2pl2sVD3/3MkJ8Zo0noDflkpKrie3hsR/SUR3pmgOWP/1/iFmO0dn7D3eLzKL4aqMPQ
 WDZU10opHeLjOri0PsD/mR75lJbI5r8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636360621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m47UAY2ZcyR+FhtsO4aVyPTcYB/9rHV9T+gQ8c/5pAk=;
 b=zxMYzuYR8k8tv1u7IyuPNqP9W/yVx0pwwR0sgi6Y7WDU2lNWog4FyUqLChzcaH3SiHZHxH
 y3UM/b2PNn/DDRCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C559A139CF;
 Mon,  8 Nov 2021 08:37:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VSr1Lq3hiGGzXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 08:37:01 +0000
Message-ID: <312d6427-67ff-67c5-b662-23127bb76d12@suse.de>
Date: Mon, 8 Nov 2021 09:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
Content-Language: en-US
To: Sven Schnelle <svens@stackframe.org>
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
 <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
 <87o86x80am.fsf@x1.stackframe.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87o86x80am.fsf@x1.stackframe.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ua3NsWBcmIn5JzZRJKhoK9GM"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ua3NsWBcmIn5JzZRJKhoK9GM
Content-Type: multipart/mixed; boundary="------------ECTrUU3oVoAPEqx5K8r4DiqJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Helge Deller <deller@gmx.de>
Message-ID: <312d6427-67ff-67c5-b662-23127bb76d12@suse.de>
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
 <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
 <87o86x80am.fsf@x1.stackframe.org>
In-Reply-To: <87o86x80am.fsf@x1.stackframe.org>

--------------ECTrUU3oVoAPEqx5K8r4DiqJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTEuMjEgdW0gMjI6MDIgc2NocmllYiBTdmVuIFNjaG5lbGxlOg0KPiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JpdGVzOg0KPiANCj4+
IEhpDQo+Pg0KPj4gQW0gMDEuMTEuMjEgdW0gMDk6NTQgc2NocmllYiBTdmVuIFNjaG5lbGxl
Og0KPj4+IEhpIFRob21hcywNCj4+PiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4gd3JpdGVzOg0KPj4+IFRoYW5rcywgaSB3YXNuJ3QgYXdhcmUgYXMgaSBub3Jt
YWxseSBkb24ndCBkbyBhbnkgZ3JhcGhpY3MgcmVsYXRlZA0KPj4+IGRldmVsb3BtZW50LiBJ
IHRha2UgYSBsb29rIGF0IGRyaSBhbmQgcG9ydCB0aGUgZHJpdmVyLCB3aGljaCBpcw0KPj4+
IGhvcGVmdWxseSBub3QgdG9vIGhhcmQuDQo+Pg0KPj4gU291bmRzIGdvb2QuDQo+Pg0KPj4g
VGhlIG9uZSBiaWcgZGlmZmVyZW5jZSB3aGVuIGNvbnZlcnRpbmcgaXMgdGhhdCBEUk0gcmVh
bGx5IHdhbnRzDQo+PiBkcml2ZXJzIHRvIHN1cHBvcnQgMzItYml0IFhSR0IgY29sb3JzLiBJ
dCdzIG5vdCBhIERSTSBsaW1pdGF0aW9uIHBlcg0KPj4gc2UsIGJ1dCBhIHJlcXVpcmVtZW50
IG9mIHRvZGF5J3MgdXNlcnNwYWNlIHByb2dyYW1zLiBBRkFJQ1MgeW91ciBmYmRldg0KPj4g
ZHJpdmVyIHVzZXMgYSAyNTYtY29sb3IgcGFsZXR0ZSBmb3JtYXQuIFNvIHRoZSBEUk0gZHJp
dmVyIHdvdWxkIGhhdmUNCj4+IHRvIGNvbnZlcnQNCj4+IFhSR0I4ODg4IHRvIDgtYml0IFJH
QjMzMiBhbmQgaW5zdGFsbCBhIGNvcnJlc3BvbmRpbmcgcGFsZXR0ZS4gRG9uJ3QNCj4+IHdv
cnJ5LCBpdCdzIGVhc3kuIFRha2UgYSBsb29rIGF0IHRoZSBjaXJydXMgZHJpdmVyIGZvciBh
IHNpbXBsZSBEUk0NCj4+IGRyaXZlci4gWzFdDQo+IA0KPiBJIGhhdmUgY29udmVydGVkIHRo
ZSBkcml2ZXIsIA0KDQpDb29sIQ0KDQo+IGJ1dCBhbSB1c2luZyBGT1JNQVRfQzggYmVjYXVz
ZSBpIGhhdmVuJ3QNCj4gZmlndXJlZCBvdXQgeWV0IGhvdyB0byBzd2l0Y2ggdGhlIGNhcmQg
dG8gWFJHQjg4ODguIFRoYXQncyBzdGlsbCBvbiB0aGUNCj4gVE9ETyBsaXN0Lg0KDQpEb24n
dCB3b3JyeS4gQXMgSSBvdXRsaW5lZCAsIHlvdSBjYW4gc3RpbGwgY29udmVydCBhbnkgaW1h
Z2UgZnJvbSANClhSR0I4ODggdG8gUkdCMzMyIGFuZCBkaXNwbGF5IHRoaXMgaW5zdGVhZC4N
Cg0KPiANCj4gT25lIHF1ZXN0aW9uIGFib3V0IGh3IGJsaXR0aW5nOiB3aXRoIHRoZSBvbGQg
ZmJkZXYgZnJhbWV3b3JrIG9uZSBjb3VsZA0KPiByZXBsYWNlIHRoZSBmYl9pbWFnZWJsaXQg
ZnVuY3Rpb24uIEZvciBub3JtYWwgY29uc29sZSB0ZXh0LCB0aGlzDQo+IGZ1bmN0aW9uIGdl
dHMgY2FsbGVkIHdpdGggYSBtb25vY2hyb21lIGJpdG1hcCwgYW5kIGFuIGZnL2JnIGNvbG9y
IHZhbHVlLg0KPiBUaGlzIG1ha2VzIGl0IGVhc3kgdG8gdXNlIEhXIGFjY2VsZXJhdGVkIGJs
aXR0aW5nIGZvciB0ZXh0LiBJbiB0aGUNCj4gZ3B1L2RybSBkcml2ZXJzIGkgdGhpbmsgaSBm
b3VuZCBvbmx5IG9uZSBkcml2ZXIgKG5vdXZlYXUpIGRvaW5nIHRoaXMgYW5kDQo+IHRoYXQg
d2FzIHZpYSB0aGUgZHJtIGZiZGV2IGxheWVyLg0KPiANCj4gSXMgdGhhdCBzdGlsbCB0aGUg
d2F5IHRvIGdvLCBvciBpcyB0aGVyZSBhIGJldHRlciB3YXkgdG8gZG8gSFcgYWNjZWxlcmF0
ZWQNCj4gdGV4dCBibGl0dGluZz8NCg0KU2ltcGx5IGNhbGwgZHJtX2ZiZGV2X2dlbmVyaWNf
c2V0dXAoKSBhZnRlciByZWdpc3RlcmluZyB0aGUgZGV2aWNlLiBUaGlzIA0Kc2hvdWxkIGdp
dmUgeW91IGEgY29uc29sZS4NCg0KRG9uJ3QgYm90aGVyIGFib3V0IEhXLWFjY2VsZXJhdGVk
IGJsaXR0aW5nLiBGcm9tIHdoYXQgSSd2ZSBoZWFyZCwgaXQgDQpiYXJlbHkgbWFrZXMgYSBk
aWZmZXJlbmNlIG5vd2FkYXlzLiBBbmQgb3VyIGdlbmVyaWMgaGVscGVycyBoYXZlIHBsZW50
eSANCm9mIGZlYXR1cmVzLiBOb3QgdXNpbmcgdGhlbSB0byBnZXQgYSBzbWFsbCBiZW5lZml0
IGZyb20gSFcgYmxpdHRpbmcgDQppc24ndCB3b3J0aCBpdC4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gVGhhbmtzDQo+IFN2ZW4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------ECTrUU3oVoAPEqx5K8r4DiqJ--

--------------Ua3NsWBcmIn5JzZRJKhoK9GM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGI4a0FAwAAAAAACgkQlh/E3EQov+As
UA//YRuNTmiRQXom7SSQzZ3yOLLxko9XIy1O/rHT3EkobAlu7juFnpc05SFas3IOGhQQo2oVJ6OT
DC9Fe1wdDyO8913hroZ34kqw60VnWY8ifcfp58EMJaJ+OVb+7t9mU3/8l+HHy79YtFN6hglJ/pJj
43ETrryJZDJPVoOJX2tKvVHEI83DS4NHKZBEHjMiS8/O8V5+UnzZhRdwC1KR9+4QkXD8i6YEzTku
hCDWjrHF+k4ZPgP85AYgzxV7VrTsMg1AHjTESU+LrY/aE9HH7azFznLLU3hmMrsiUIui7c8On+Tf
OzAWpdFntmEe2CDkp6HjgWPibZB6kcyw20CkQq/TK5VoY5ZooAeCvrluHz0Em9k/o/9W44jfFViX
msd+quuitzCRWOgP4GykiqqwIbaUEVAvy8vgU6vCN2y5drHV80FKP2FYMhf7L/8J7GuAOMTe9v5g
hkYxp+Lxye01CpQCooiiBbDXUjp9mQkCsOOrL0SC+ElJks3qSSQM5NHd8En/CoWibwaZxbwIHN2P
PuA283K/XVhm7cH4YXgv2o4zPLFe2bpaJwvmBlM3BCJ6flY/qQaK31Q4LfGqTX8Bqs/c94Ew8xDB
1PwAH67fvIZ7PB5OH3UMrrCRPdGsJOWk2SE+6dNgOPHuHcWqIamAeY9mWR0czhEGu7Lp4Jk/4DoY
oGs=
=bT6n
-----END PGP SIGNATURE-----

--------------Ua3NsWBcmIn5JzZRJKhoK9GM--

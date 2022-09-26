Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C77D5EA306
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 13:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061EE10E043;
	Mon, 26 Sep 2022 11:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D7F10E043;
 Mon, 26 Sep 2022 11:17:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA736218EF;
 Mon, 26 Sep 2022 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664191073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRZ2THjGw43K91frVQ0cavLJnfTwAj7TQu8exTP2YGQ=;
 b=RWkpCHTHCIzWIBxoSgaw6qYqGGcxZ+hmp1mWx6qO0BI90JK5pm01vMJ3XVX2VjFeL0gMjN
 8w1puqwBcCstmcEqtZNG8EnxDX8ZNBufuDq9UdsjPmj6EMZ9HxDdy2CfR/4cpaA6zcPojd
 X0NX00sizPKxJso+ziqll+02QMwdZTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664191073;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRZ2THjGw43K91frVQ0cavLJnfTwAj7TQu8exTP2YGQ=;
 b=eXPjOygx/KWE7XUjMCwk7MrNGcJLOBKZxPlXQ/Jvo5S+/38MBAL3J3Yy/+kF548YhBlIhk
 JJh0es3dPtW7TIDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F81313486;
 Mon, 26 Sep 2022 11:17:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M7jUEWGKMWO+LQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 11:17:53 +0000
Message-ID: <c714b53d-8e18-9105-9e27-8b783f246082@suse.de>
Date: Mon, 26 Sep 2022 13:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
 <20220926101716.urehomr2lzv5pqln@houat>
 <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ugjNnt50fIMLVu6urhLXoAKy"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Dom Cobley <dom@raspberrypi.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ugjNnt50fIMLVu6urhLXoAKy
Content-Type: multipart/mixed; boundary="------------3WYvgZonJe2p1UqhQXWVMRE6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c714b53d-8e18-9105-9e27-8b783f246082@suse.de>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
 <20220926101716.urehomr2lzv5pqln@houat>
 <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
In-Reply-To: <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>

--------------3WYvgZonJe2p1UqhQXWVMRE6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDkuMjIgdW0gMTI6MzQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIE1heGltZSwNCj4gDQo+IE9uIE1vbiwgU2VwIDI2LCAyMDIyIGF0IDEyOjE3IFBN
IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPiB3cm90ZToNCj4+IE9uIEZyaSwg
U2VwIDIzLCAyMDIyIGF0IDExOjA1OjQ4QU0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4+PiArICAgLyogNjMuNTU2dXMgKiAxMy41TUh6ID0gODU4IHBpeGVscyAqLw0K
Pj4+DQo+Pj4gSSBraW5kIG9mIGdldCB3aGF0IHRoZSBjb21tZW50IHdhbnRzIHRvIHRlbGwg
bWUsIGJ1dCB0aGUgdW5pdHMgZG9uJ3QgYWRkIHVwLg0KPj4NCj4+IEknbSBub3Qgc3VyZSBo
b3cgaXQgZG9lc24ndCBhZGQgdXA/DQo+Pg0KPj4gV2UgaGF2ZSBhIGZyZXF1ZW5jeSBpbiBI
eiAoZXF1aXZhbGVudCB0byBzXi0xKSBhbmQgYSBkdXJhdGlvbiBpbiBzLCBzbw0KPj4gdGhl
IHJlc3VsdCBlbmRzIHVwIHdpdGggbm8gZGltZW5zaW9uLCB3aGljaCBpcyB0byBiZSBleHBl
Y3RlZCBmb3IgYQ0KPj4gbnVtYmVyIG9mIHBlcmlvZHM/DQo+IA0KPiBUbyBtYWtlIHRoZSB1
bml0cyBhZGQgdXAsIGl0IHNob3VsZCBiZSAxMy41IE1waXhlbC9zDQo+ICh3aGljaCBpcyB3
aGF0IGEgcGl4ZWwgY2xvY2sgb2YgMTMuNSBNSHogcmVhbGx5IG1lYW5zIDstKQ0KDQpTb3J0
IG9mLiBJdCBsZWF2ZXMgdGhlIHRpbWUgdmFsdWUgYXMgYSBtYWdpYyBudW1iZXIsIHdoaWNo
IG9iZnVzY2F0ZXMgDQp3aGF0J3MgaGFwcGVuaW5nLg0KDQpUaGUgdW5pdCBmb3IgaHRvdGFs
IGlzIHBpeGVscy9zY2FubGluZSBiZWNhdXNlIGlmIHlvdSBtdWx0aXBseSBpdCB3aXRoIA0K
dGhlIG51bWJlciBvZiBzY2FubGluZXMgcGVyIGZyYW1lICh3aGljaCBpcyBpbiB2dG90YWwp
LCB5b3UgZ2V0IA0KcGl4ZWxzL2ZyYW1lLiBNdWx0aXBseWluZyB3aXRoIHRoZSBmcmFtZXMg
cGVyIHNlY29uZCByZXN1bHRzIGluIHRoZSANCnBpeGVsIGNsb2NrIGluIHBpeGVscy9zZWNv
bmQuDQoNClRoYXQncyBhIGJpdCBtdWNoIGZvciB0aGlzIGNvbW1lbnQuIEhlbmNlLCBJIHN1
Z2dlc3RlZCB0byByZW1vdmUgdGhlc2UgDQpjb21tZW50cyBlbnRpcmVseSBhbmQgZG9jdW1l
bnQgdGhlIHJlbGF0aW9uIGFtb25nIHRoZSBudW1iZXJzIGluIGEgbW9yZSANCnByb21pbmVu
dCBsb2NhdGlvbi4gVGhlIGRvY3VtZW50YXRpb24gZm9yIGRybV9kaXNwbGF5X21vZGUgd291
bGQgYmUgYSANCmdvb2QgcGxhY2UsIEkgZ3Vlc3MuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------3WYvgZonJe2p1UqhQXWVMRE6--

--------------ugjNnt50fIMLVu6urhLXoAKy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMximAFAwAAAAAACgkQlh/E3EQov+DJ
1g//RygY42C2g9i/xd+0ILDL66FTDjnaa8D93msjwX0RgMc50KzIbRpbsiRLSPZNLMpkrIcA3uSR
N0x4eWgJrZSQWWZycl0SoM3hDsueWGj7o27kJ6dP9K8km0/CQKlF9Bz5TzQkvnihiU4tVEJ1975m
N+OU1qG+gGOf3Slcjobwou/k8aeXOBtisOaIvtx13xhp99eTp5HLoYN2q2szoF+PIdBGFJDQFugU
sxGCQlMaTTFl67ajM1oZg8tpQU7mfmL86cAzqp4azLGYVsDBMvA6Rf6hmJHTa9v6w1oRdA8wu1xQ
Z/T5rXPuWQDx65f79HtkQ7UJ06sTSlNFbrjbuuuo5/DMW9bXg0Amlz6tCra3bdg0xcPZauA26rAS
/QTU3gBYzzjo0m/Uu+xe0hrK/mfHRBgNtbVeKYKWEI5OSSl6oUzonl/QVCOTf1IxUDx1yBu/aCzV
jzDoAzHpN91aIIjaiUuKdFbJqz1baeo0SZpqSW0hIhEFEGNSgWDGtSlkDdrBEpvVdLElo9hXn3Ue
EIShw8OUahXUdnh21r6NKPpv1/qjYZCn1H3AvHDNZDMnX+ALFx9pDOixXd1NUW9y3LMzj0/cLaPI
usAR4M1Q0dVG4JunLeNnzR7HrFaH6cT194xjmHpiNZEvdkXmc6V6dEkUmB+TFER1utnMweRJtLs+
YSA=
=1G2G
-----END PGP SIGNATURE-----

--------------ugjNnt50fIMLVu6urhLXoAKy--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF10527DC6
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 08:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08235112B11;
	Mon, 16 May 2022 06:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A523112B0A;
 Mon, 16 May 2022 06:48:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2CA6D1F8FE;
 Mon, 16 May 2022 06:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652683698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/VxwhfMGZJ/R43Jur0qAAkcbyv2KGM6CayzfM3eb9a8=;
 b=RcnRSwyIGPt8PoOuYWjSpDBz2UdEitRp5Aw2hFzHEIBgAmZlt+AcinzUsD55eyGVw3zftf
 EMJGT5arOKRs2/lEVOZDk6XYviFicQOusz+6bewbpQUCbo+0cmabdfTTtaiJCvjRusH2Xf
 AM6lbbp1htGMA2UJjys8sUxR7RQDI98=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B64FA13ADC;
 Mon, 16 May 2022 06:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eNy9KrHzgWK3PAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 May 2022 06:48:17 +0000
Message-ID: <55436ae1-8255-1898-00df-51261080cd41@suse.com>
Date: Mon, 16 May 2022 08:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <Yn/Tgj1Ehs/BdpHp@itl-email>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Hang in 5.17.4+ that appears to be due to Xen
In-Reply-To: <Yn/Tgj1Ehs/BdpHp@itl-email>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------E3p00huEUrrTJ9brwKFwwior"
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
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Ostrovski <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------E3p00huEUrrTJ9brwKFwwior
Content-Type: multipart/mixed; boundary="------------oH2iaJ0jTX0y0uRnsowBQVfz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovski <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <55436ae1-8255-1898-00df-51261080cd41@suse.com>
Subject: Re: Hang in 5.17.4+ that appears to be due to Xen
References: <Yn/Tgj1Ehs/BdpHp@itl-email>
In-Reply-To: <Yn/Tgj1Ehs/BdpHp@itl-email>

--------------oH2iaJ0jTX0y0uRnsowBQVfz
Content-Type: multipart/mixed; boundary="------------WKi2f0oZMCLjThKhlF63EhgJ"

--------------WKi2f0oZMCLjThKhlF63EhgJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDUuMjIgMTc6NTUsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gSW4gaHR0
cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtaXNzdWVzL2lzc3Vlcy83NDgxLCBhIHVz
ZXIgcmVwb3J0ZWQNCj4gdGhhdCBYb3JnIGxvY2tlZCB1cCB3aGVuIHJlc2l6aW5nIGEgVk0g
d2luZG93LiAgV2hpbGUgSSBkbyBub3QgaGF2ZSB0aGUNCj4gc2FtZSBoYXJkd2FyZSB0aGUg
dXNlciBkb2VzIGFuZCB0aHVzIGNhbm5vdCByZXByb2R1Y2UgdGhlIGJ1ZywgdGhlIHN0YWNr
DQo+IHRyYWNlIHNlZW1zIHRvIGluZGljYXRlIGEgZGVhZGxvY2sgYmV0d2VlbiB4ZW5fZ250
ZGV2IGFuZCBpOTE1LiAgSXQNCj4gYXBwZWFycyB0aGF0IGdudHRhYl91bm1hcF9yZWZzX3N5
bmMoKSBpcyB3YWl0aW5nIGZvciBpOTE1IHRvIGZyZWUgdGhlDQo+IHBhZ2VzLCB3aGlsZSBp
OTE1IGlzIHdhaXRpbmcgZm9yIHRoZSBNTVUgbm90aWZpZXIgdGhhdCBjYWxsZWQNCj4gZ250
dGFiX3VubWFwX3JlZnNfc3luYygpIHRvIHJldHVybi4gIFJlc3VsdDogZGVhZGxvY2suDQo+
IA0KPiBUaGUgcHJvYmxlbSBhcHBlYXJzIHRvIGJlIHRoYXQgYSBtYXBwZWQgZ3JhbnQgaW4g
UFYgbW9kZSB3aWxsIHN0YXkgaW4NCj4gdGhlIOKAnGludmFsaWRhdGluZ+KAnSBzdGF0ZSB1
bnRpbCBpdCBpcyBmcmVlZC4gIFdoaWxlIE1NVSBub3RpZmllcnMgYXJlDQo+IGFsbG93ZWQg
dG8gc2xlZXAsIGl0IGFwcGVhcnMgdGhhdCB0aGV5IGNhbm5vdCB3YWl0IGZvciB0aGUgcGFn
ZSB0byBiZQ0KPiBmcmVlZCwgYXMgaXMgaGFwcGVuaW5nIGhlcmUuICBUaGF0IHNhaWQsIEkg
YW0gbm90IHZlcnkgZmFtaWxpYXIgd2l0aA0KPiB0aGlzIGNvZGUsIHNvIG15IGRpYWdub3Np
cyBtaWdodCBiZSBpbmNvcnJlY3QuDQoNCkFsbCBJIGNhbiBzYXkgZm9yIG5vdyBpcyB0aGF0
IHlvdXIgcGF0Y2ggc2VlbXMgdG8gYmUgaW50cm9kdWNpbmcgYSB1c2UgYWZ0ZXINCmZyZWUg
aXNzdWUsIGFzIHRoZSBwYXJhbWV0ZXJzIG9mIHRoZSBkZWxheWVkIHdvcmsgbWlnaHQgZ2V0
IGZyZWVkIG5vdyBiZWZvcmUNCnRoZSBkZWxheWVkIHdvcmsgaXMgYmVpbmcgZXhlY3V0ZWQu
DQoNCkkgZG9uJ3Qga25vdyB3aHkgdGhpcyBpcyBoYXBwZW5pbmcgb25seSB3aXRoIHJhdGhl
ciByZWNlbnQga2VybmVscywgYXMgdGhlDQpsYXN0IGdudGRldiBjaGFuZ2VzIGluIHRoaXMg
YXJlYSBoYXZlIGJlZW4gbWFkZSBpbiBrZXJuZWwgNC4xMy4NCg0KSSdkIHN1Z2dlc3QgdG8g
bG9vayBhdCBpOTE1LCBhcyBxdWl0ZSBzb21lIHdvcmsgaGFzIGhhcHBlbmVkIGluIHRoZSBj
b2RlDQp2aXNpYmxlIGluIHlvdXIgc3RhY2sgYmFja3RyYWNlcyByYXRoZXIgcmVjZW50bHku
IE1heWJlIGl0IHdvdWxkIGJlIHBvc3NpYmxlDQp0byBmcmVlIHRoZSBwYWdlcyBpbiBpOTE1
IGJlZm9yZSBjYWxsaW5nIHRoZSBNTVUgbm90aWZpZXI/DQoNCkFkZGluZyB0aGUgaTkxNSBt
YWludGFpbmVycy4NCg0KDQpKdWVyZ2VuDQo=
--------------WKi2f0oZMCLjThKhlF63EhgJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WKi2f0oZMCLjThKhlF63EhgJ--

--------------oH2iaJ0jTX0y0uRnsowBQVfz--

--------------E3p00huEUrrTJ9brwKFwwior
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKB87EFAwAAAAAACgkQsN6d1ii/Ey+C
tQf/SGMmi/nRrYjUWG8qfocSmDp74/8ZPIwH5Mm3EjGlPbv7Rclq+7DwpgDWkFfXp2XDVqP1liWC
jkC1jfmAWXVyREfrgLwM2FpuS3Lr+tnpXhds3f9oBthWrW92gbVFNzyZ2tQBmWFw99DJDcJ+gXtq
3XVcspqAIwCz3RWF2v65HnPbQd3fHA9vHp7wtJP1syO25ZyNiAj7HZmWdISZ6EgAhYOtVeZN2Ux8
mUMlalT18ACunsolrLIa6UV0JqYVrkvTAy0Tqas31mnMEBIMPrFmkmxL/iHNwnVR3ooVelddSsn5
xcRc6SUsZ22X9Fdqh+n2a2USnJdh7BAWWchlymJmDg==
=kaAe
-----END PGP SIGNATURE-----

--------------E3p00huEUrrTJ9brwKFwwior--

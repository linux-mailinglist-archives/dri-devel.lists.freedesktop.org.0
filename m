Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F93752512
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F88310E03A;
	Thu, 13 Jul 2023 14:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B4510E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:24:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C1E21F45E;
 Thu, 13 Jul 2023 14:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689258290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PrMv+D7uM1KKouO2juNhipW/xp1fm+KvomaxtvvD4u4=;
 b=WKnPBifaqDBJ69Tyg1xEFVZEtpPbP1fpbckZVhAQrA6OQVc1JMMIZv4AyF1ysjQWre+bGN
 gjkbJJ00EFBlm69mAMRWePWfv9eV+61lLyWa8vw+5GneJnA07TReyLrrIXVClZFsAXkncw
 4s0B/vrnP/j2DKPs+HwaFiGa48e2r1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689258290;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PrMv+D7uM1KKouO2juNhipW/xp1fm+KvomaxtvvD4u4=;
 b=yhMx9UABi3n6aco+zu72rLdGI6OmetCqGgS3A+ILnzy2OrKXoeefDHwUp2rq+wCXV4Zg7E
 Ch3tFUzh56ShHQDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFBEA133D6;
 Thu, 13 Jul 2023 14:24:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yLqAOTEJsGSNawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 14:24:49 +0000
Message-ID: <cfdccef7-4c17-426b-7a00-137ce1d7c7c3@suse.de>
Date: Thu, 13 Jul 2023 16:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com> <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230713141023.52dkz5ezicwev74w@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7q7qlLhXJHUlcnKAFSyN3Y7i"
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7q7qlLhXJHUlcnKAFSyN3Y7i
Content-Type: multipart/mixed; boundary="------------E0pJrpxUiAbBXShm37rfza95";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cfdccef7-4c17-426b-7a00-137ce1d7c7c3@suse.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com> <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
In-Reply-To: <20230713141023.52dkz5ezicwev74w@pengutronix.de>

--------------E0pJrpxUiAbBXShm37rfza95
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTY6MTAgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoN
ClsuLi5dDQo+ICAgLSBUaG9tYXMgWmltbWVybWFubg0KPiAgICAgQWxsIGRhdGEgc3RydWN0
dXJlcyBzaG91bGQgYmUgY29udmVydGVkDQo+ICAgICBuYW1pbmc6IGRybSA+ICoNClsuLi5d
PiBJIGFkbWl0IEknbSBub3QgYXdhcmUgYWJvdXQgdGhlIHJvbGVzIGhlcmUsIGJ1dCB1cCB0
byB0aGVuIG9ubHkgU2Vhbg0KPiBQYXVsIHdyb3RlIGEgY2xlYXIgbm8gYW5kIG1heWJlIEph
bmkgTmlrdWxhIGEgc21hbGwgb25lLiBJIGludGVycHJldGVkDQo+IFBhdWwgS29jaWFsa293
c2tpJ3MgcmVwbGF5IGFzIGluZGlmZmVyZW50IHRvIHRoZSByZW5hbWluZy4gQWxsIG90aGVy
cw0KPiB3ZXJlIGluIGZhdm91ciBvciBvbmx5IGNyaXRpY2lzZWQgZGV0YWlscyBhbmQgbmFt
aW5nLg0KPiANClsuLi5dDQo+ICAgLSBUaG9tYXMgWmltbWVybWFubg0KPiAgICAgQWdyZWVk
IHRvIFNlYW4gUGF1bCBhYm91dCB0aGUgdG9vIGhpZ2ggZG93bnNpZGVzDQoNCkknZCBsaWtl
IHRvIGNoYW5nZSBteSB2b3RlIHRvDQoNCiAgLSBObywgYnV0IGlmIHRoZSBvdGhlcnMgd2Fu
dCB0aGlzLCBJJ20gaW4gZmF2b3Igb2YgY2FsbGluZyBpdCAnZHJtJy4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KDQo+ICAgLSBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gICAgIEluIGZh
dm91ciAoYWxzbyBiZWZvcmUgdmlhIGlyYykNCj4gKT8NCj4gDQo+PiBJZ25vcmluZyB0aG9z
ZSBjb25jZXJucw0KPiANCj4gSSdtIHJlYWxseSBzdXJwcmlzZWQgYnkgdGhpcyBzdWdnZXN0
aW9uLiBFaXRoZXIgSSByZWFsbHkgbWlzc2VkDQo+IHNvbWV0aGluZywgb3IgSSdkIGxpa2Ug
dG8gYXNrIHRoZXNlIG1haW50YWluZXJzIHRvIGNvbW11bmljYXRlIGluIGEgbW9yZQ0KPiBv
YnZpb3VzIHdheS4gSWYgSSBzZW5kIGEgc2VyaWVzIGFuZCBJIGdldCBmZWVkYmFjayBsaWtl
ICJJZiB5b3UgcmVuYW1lDQo+IGRybV9jcnRjLmRldiwgeW91IHNob3VsZCBhbHNvIGFkZHJl
c3MgKmFsbCogb3RoZXIgZGF0YSBzdHJ1Y3R1cmVzLiIgKGJ5DQo+IFRob21hcyBaaW1tZXJt
YW5uKSBvciAiV2hlbiB5b3UgYXV0b21hdGljYWxseSBnZW5lcmF0ZSB0aGUgcGF0Y2ggKHdp
dGgNCj4gY29jY2kgZm9yIGV4YW1wbGUpIEkgdXN1YWxseSBwcmVmZXIgYSBzaW5nbGUgcGF0
Y2ggaW5zdGVhZC4iIChieQ0KPiBDaHJpc3RhbiBLw7ZuaWcpIHRoZW4gSSB3b3VsZCBleHBl
Y3QgdGhhdCBpZiB0aGV5IG9wcG9zZSB0aGUgdW5kZXJseWluZw0KPiBpZGVhIG9mIHRoZSBz
ZXJpZXMgdGhleSB3b3VsZCBzYXkgc28sIHRvby4gSSdtIHNvcnJ5LCBJIGNhbm5vdCByZWFk
IGENCj4gY29uY2VybiAodG8gdGhlIHVuZGVybHlpbmcgaWRlYSkgZnJvbSB0aGVzZSByZXBs
aWVzLiBBbmQgc28gSSBhZGRyZXNzZWQNCj4gdGhlIGZlZWRiYWNrIGFib3V0IHRoZSBkZXRh
aWxzIHdpdGggYSBuZXcgc2VyaWVzIHRvIGhhdmUgYW4gdXBkYXRlZCBiYXNlDQo+IGZvciB0
aGUgZGlzY3Vzc2lvbi4NCj4gDQo+PiBhbmQgdGhlbiBzZW5kaW5nIGEgbmV3IHZlcnNpb24g
cmlnaHQgYXdheSBpcywgaWYgbm90IG9ibm94aW91cywNCj4+IGRlZmluaXRlbHkgYWdncmVz
c2l2ZS4NCj4gDQo+IElmIHRoaXMgaXMgaG93IHlvdSBleHBlcmllbmNlIG15IHN1Ym1pc3Np
b24gZXZlbiBhZnRlciBJIHRyaWVkIHRvDQo+IGV4cGxhaW4gbXkgcmVhbCBpbnRlbnRpb25z
LCBJJ20gc29ycnkuIEFuZCBJJ20gc3VyZSB0aGVyZSBpcyBhIGRlZXANCj4gbWlzdW5kZXJz
dGFuZGluZyBzb21ld2hlcmUuDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVXdlDQo+IA0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0Niwg
OTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMs
IEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJu
YmVyZykNCg==

--------------E0pJrpxUiAbBXShm37rfza95--

--------------7q7qlLhXJHUlcnKAFSyN3Y7i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSwCTEFAwAAAAAACgkQlh/E3EQov+Ca
3Q//UyW8zpNV9JgWzZW5IVBIGfz+O41DoB/3O9nvk8nzfeyqRE2U6BF9B8EefeOQJXbh/V8xNObg
qQSHhOAKbJO3HqDgJnz8EXkZHzRHxWNX/r/pW2TbwgrK0ql54hty+BrcAcGFShpLZpbRKI3sbsGD
ildEGEoBDGPwj4iscw03E+GdWxh7pZ7FtGXajhkGVzf3Cxb76ZLN7ROBPon42byt45B9PrtqcNJX
CDbUuld1c7txtJC2uiKsyuRbXzIqmgKnp8AspHcRKbUAyTliO/ibUG6uLRP4iE1W2MBwbuxxwdxc
aexFLJJaAUidWZpgtnZ6LbDwhgplY+rg54QXOJvyUUMjtljqkAzY4cgQ1p8+VyyKicl31jwP5i7c
RKGn6V4dN9S4jLqAT+BgYCh1vbif5hQ6TEN+PQw4k4bG+drffwufUNoyW5SgDpPzcnWCMNWYY0hg
qJYf2ZluLQFXrG201BHGwYmgHrwnBHwmtVd/1/KapvvsSh4mjJ2O2D6lh5uGhrUobL1Ok4/6w5J0
aNGD1HK0OvHgRpA5GIjxlQGeirpcrnTvcxbB2PBlZOqQ8DoB4ulydLZDuTTLbOUOKlSvOnSPiufH
uk6NgJgfAa0uvr1SEdHNz/yT5KU3/LqZz4d+TKVL1yRAaPkoZWw5NJbmeRv16y3ajosAy76F+3N4
Hj8=
=ceq5
-----END PGP SIGNATURE-----

--------------7q7qlLhXJHUlcnKAFSyN3Y7i--

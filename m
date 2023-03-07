Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319016AD938
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 09:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBA510E386;
	Tue,  7 Mar 2023 08:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE2010E386
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 08:24:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 09E8F21A3A;
 Tue,  7 Mar 2023 08:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678177498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJjCMR/7W7W6fsxhbPmeCPoCzzj8LVhiJpZUXqYpJHg=;
 b=jxNaHdRIuxKgQUO69Tn/RhntQcsEEvE8OdmsJmCL4SbQF7hSm0czRn+bJ7QMM3V54uVeUe
 5Kd+He9KwFanfdzrMKqX862RG8riZ/EkwQwuC+LHiSruevZSNQ/N02AZa900ji32NZNWBJ
 FqUtseevIc6KWMVnbnHarWa3ydCjXrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678177498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJjCMR/7W7W6fsxhbPmeCPoCzzj8LVhiJpZUXqYpJHg=;
 b=S/6yXrAGSF+9++abVia5koz3DUC4779UWgL4gVHGJu1LfbfAKNIxPtUu59d54BVX9G/bjP
 DXyUCyFaJkkOMWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA3161341F;
 Tue,  7 Mar 2023 08:24:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i1RNKNn0BmRZFgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Mar 2023 08:24:57 +0000
Message-ID: <c6d2e7db-f728-c867-2f14-528895e99927@suse.de>
Date: Tue, 7 Mar 2023 09:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/99] fbdev/aty: Duplicate video-mode option string
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-12-tzimmermann@suse.de>
 <CAMuHMdVDr19p3GtR4n_hJAtc_RX+VJwVfU1Mzvtka9er+WS8bg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdVDr19p3GtR4n_hJAtc_RX+VJwVfU1Mzvtka9er+WS8bg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fVN03Z44mY6detn63Uep34gh"
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, timur@kernel.org,
 corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net, mbroemme@libmpq.org,
 linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, pjones@redhat.com, paulus@samba.org, geert+renesas@glider.be,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fVN03Z44mY6detn63Uep34gh
Content-Type: multipart/mixed; boundary="------------njgFiRo1LRq96NsWAc32i50R";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@hansenpartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <c6d2e7db-f728-c867-2f14-528895e99927@suse.de>
Subject: Re: [PATCH 11/99] fbdev/aty: Duplicate video-mode option string
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-12-tzimmermann@suse.de>
 <CAMuHMdVDr19p3GtR4n_hJAtc_RX+VJwVfU1Mzvtka9er+WS8bg@mail.gmail.com>
In-Reply-To: <CAMuHMdVDr19p3GtR4n_hJAtc_RX+VJwVfU1Mzvtka9er+WS8bg@mail.gmail.com>

--------------njgFiRo1LRq96NsWAc32i50R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDMuMjMgdW0gMTc6MTMgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9u
IE1vbiwgTWFyIDYsIDIwMjMgYXQgNTowMOKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IEFzc3VtZSB0aGF0IHRoZSBkcml2ZXIgZG9l
cyBub3Qgb3duIHRoZSBvcHRpb24gc3RyaW5nIG9yIGl0cyBzdWJzdHJpbmdzDQo+PiBhbmQg
aGVuY2UgZHVwbGljYXRlIHRoZSBvcHRpb24gc3RyaW5nIGZvciB0aGUgdmlkZW8gbW9kZS4g
VGhlIGRyaXZlciBvbmx5DQo+PiBwYXJzZXMgdGhlIG9wdGlvbiBzdHJpbmcgb25jZSBhcyBw
YXJ0IG9mIG1vZHVsZSBpbml0aWFsaXphdGlvbiwgc28gdXNlDQo+PiBhIHN0YXRpYyBidWZm
ZXIgdG8gc3RvcmUgdGhlIGR1cGxpY2F0ZWQgbW9kZSBvcHRpb24uIExpbnV4IGF1dG9tYXRp
Y2FsbHkNCj4+IGZyZWVzIHRoZSBtZW1vcnkgdXBvbiByZWxlYXNpbmcgdGhlIG1vZHVsZS4N
Cj4gDQo+IEFyZSB5b3Ugc3VyZSBhYm91dCB0aGF0Pw0KPiBBbGwgb2YgdGhpcyBjb2RlIGlz
IGluc2lkZSAiI2lmbmRlZiBNT0RVTEUiLg0KPiBJbiB0aGUgYXR5MTI4ZmIgY2FzZSwgdGhl
IGZ1bmN0aW9uIGlzIG5vdCBtYXJrZWQgX19pbml0Lg0KPiBFbmFibGluZyB0aGVzZSAzIGRy
aXZlcnMgYWRkcyAzeDI1NiBieXRlcyBvZiBzdGF0aWMgYnVmZmVyLCBtb3JlDQo+IGlmIHlv
dSBlbmFibGUgbW9yZSBmYmRldiBkcml2ZXJzLg0KDQpSaWdodC4gUGxlYXNlIHNlZSBteSBy
ZXBseSB0byBbMDAvOTldLg0KDQo+IA0KPj4gRG9uZSBpbiBwcmVwYXJhdGlvbiBvZiBzd2l0
Y2hpbmcgdGhlIGRyaXZlciB0byBzdHJ1Y3Qgb3B0aW9uX2l0ZXIgYW5kDQo+PiBjb25zdGlm
eWluZyB0aGUgb3B0aW9uIHN0cmluZy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gDQo+PiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5jDQo+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2F0eS9hdHkxMjhmYi5jDQo+PiBAQCAtMTcyMyw3ICsxNzIzLDE3IEBAIHN0YXRpYyBp
bnQgYXR5MTI4ZmJfc2V0dXAoY2hhciAqb3B0aW9ucykNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsNCj4+ICAgICAgICAgICAgICAgICAgfQ0KPj4gICAjZW5kaWYg
LyogQ09ORklHX1BQQ19QTUFDICovDQo+PiAtICAgICAgICAgICAgICAgbW9kZV9vcHRpb24g
PSB0aGlzX29wdDsNCj4+ICsgICAgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0aWMgY2hhciBtb2RlX29wdGlvbl9idWZbMjU2XTsNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSBzbnByaW50Zihtb2RlX29wdGlvbl9idWYsIHNpemVvZihtb2RlX29wdGlv
bl9idWYpLCAiJXMiLCB0aGlzX29wdCk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoV0FSTihyZXQgPCAwLCAiYXR5MTI4OiBpZ25vcmluZyBpbnZhbGlkIG9wdGlvbiwgcmV0
PSVkXG4iLCByZXQpKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChXQVJOKHJldCA+PSBzaXpl
b2YobW9kZV9vcHRpb25fYnVmKSwgImF0eTEyOGZiOiBvcHRpb24gdG9vIGxvbmdcbiIpKQ0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIG1vZGVfb3B0aW9uID0gbW9kZV9vcHRpb25fYnVmOw0KPj4g
KyAgICAgICAgICAgICAgIH0NCj4+ICAgICAgICAgIH0NCj4+ICAgICAgICAgIHJldHVybiAw
Ow0KPj4gICB9DQo+IGV0dXJuIDA7DQo+PiAgIH0NCj4gDQo+IEdye29ldGplLGVldGluZ31z
LA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------njgFiRo1LRq96NsWAc32i50R--

--------------fVN03Z44mY6detn63Uep34gh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQG9NkFAwAAAAAACgkQlh/E3EQov+A1
rxAAwDtvCmNWSogCnBKo7P+vbnHZdaKaHvcKpdY0yNu5N8m3s/KJqXNKv4T5vUeQxSHdMgcTLr7Y
//6angohv9ejGjcbiF/pk55ryZIoJZ9qU1VHg/jiUS4mMyzyHDR9W5xY+27UhBC9Se3BwlN9Swcs
c+Q/oR3TL3e7dHagZDcgbf4INDlYYoQUj8yFu9AVw7yIRtUgYliMVU5sC9b2eBEIkH/fbVMvgE9o
MQYvyI46ZlzUxF6ZrtvuLyYHQL85hkl84HZKE5eldrjPv/rXdZcYKWuPDJRBYdzUdjWFBoJbuIPB
fDx9EMduOvm7WYeIscA/4tbgGcPtDLlAmQwFx4gn9wJ61oJeqsqn2U9gY2zxr9/FHX0iyBabXWxG
OoeCo6E0q+7hXb4HGUAaL5gMpf3vkYzta308HTQOfUI3idlmdiFwOp4WjEjPzHOYsr6GHUhtximI
dZP5Dho2R3WMJADi7viz8QmHJWVrtEgXFwDMhxlHQwU7xvnsXTFrA8HI0fHJ4sYcyLE/Hme/RH4s
Iv07Ja9OIM4yaIgpwzJsy/EEva/ySNdPgiADmGMlEp7kNDLOyMS1K/Y9zIzbCblZbTvetexSc3l4
DftnC5XQ+rPYa25KHWjBcIg0DsSe4yZQMxfZySLHqfY8M2fzOuJZHDDOC999Qt714ehCKlUuPSBj
7Qo=
=gUgK
-----END PGP SIGNATURE-----

--------------fVN03Z44mY6detn63Uep34gh--

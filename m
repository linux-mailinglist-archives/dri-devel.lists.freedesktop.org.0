Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E75AFD84
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B015F10E3C7;
	Wed,  7 Sep 2022 07:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6B410E3C7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:29:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFCF6200DC;
 Wed,  7 Sep 2022 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662535777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=intNPrIbiMN1+1I6Nkydtdj6TxmoLCaG9bLoSORsNmA=;
 b=FDeQ2STvbCfcCcK926Lrxd1v0u/OALEy3JxAGv8MhMaoqeBiu0vHc9kb1IUgFf23d8H754
 2Rz3jnqNchXpXguD6/bjjOphg47X7rHgLgXW9Gydal40Apb4qavta6f+X6d39uWaWdl6CC
 rSCBDLOIGSwr++/uyftLBuMMxMmxc1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662535777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=intNPrIbiMN1+1I6Nkydtdj6TxmoLCaG9bLoSORsNmA=;
 b=bz09QVXJbogWB6057CcMavw46HEkbhltTQl2sQA9yUyNR/37scpU2cWBMYlLDknX14K6l9
 bDNFs/SZuVt1muCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A7DF313A66;
 Wed,  7 Sep 2022 07:29:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k7sVKGFIGGPwegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:29:37 +0000
Message-ID: <8291de03-c5b5-e744-62f0-8755c6eada4a@suse.de>
Date: Wed, 7 Sep 2022 09:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 07/11] drm/udl: Drop unneeded alignment
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220906073951.2085-1-tiwai@suse.de>
 <20220906073951.2085-8-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220906073951.2085-8-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r077VbBHMhyyEpnYuH0rC6HF"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r077VbBHMhyyEpnYuH0rC6HF
Content-Type: multipart/mixed; boundary="------------vFg8aX2UENEnrbnIinY0bicW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <8291de03-c5b5-e744-62f0-8755c6eada4a@suse.de>
Subject: Re: [PATCH v2 07/11] drm/udl: Drop unneeded alignment
References: <20220906073951.2085-1-tiwai@suse.de>
 <20220906073951.2085-8-tiwai@suse.de>
In-Reply-To: <20220906073951.2085-8-tiwai@suse.de>

--------------vFg8aX2UENEnrbnIinY0bicW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjIgdW0gMDk6Mzkgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IFRo
ZSBhbGlnbm1lbnQgb2YgZGFtYWdlZCBhcmVhIHdhcyBuZWVkZWQgZm9yIHRoZSBvcmlnaW5h
bCB1ZGxmYiBkcml2ZXINCj4gdGhhdCB0cmllZCB0byB0cmltIHRoZSBzdXBlcmZsdW91cyBj
b3BpZXMgYmV0d2VlbiBmcm9udCBhbmQgYmFja2VuZA0KPiBidWZmZXJzIGFuZCBoYW5kbGUg
ZGF0YSBpbiBsb25nIGludC4gIEl0J3Mgbm90IHRoZSBjYXNlIGZvciB1ZGwgRFJNDQo+IGRy
aXZlciwgaGVuY2Ugd2UgY2FuIG9taXQgdGhlIHdob2xlIHVubmVlZGVkIGFsaWdubWVudCwg
YXMgd2VsbCBhcyB0aGUNCj4gZGVhZCBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFr
YXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCndpdGggYW4gZW50aXJlbHkgb3B0aW9uYWwg
Y29tbWVudCBiZWxvdy4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9t
b2Rlc2V0LmMgIHwgMjggKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfdHJhbnNmZXIuYyB8IDQwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDY3IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVz
ZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYw0KPiBpbmRleCBjMzRk
NTY0NzczYTMuLjk4OTZjMTZjNzRmNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfbW9kZXNldC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21v
ZGVzZXQuYw0KPiBAQCAtMjQzLDI4ICsyNDMsNiBAQCBzdGF0aWMgbG9uZyB1ZGxfbG9nX2Nw
cCh1bnNpZ25lZCBpbnQgY3BwKQ0KPiAgIAlyZXR1cm4gX19mZnMoY3BwKTsNCj4gICB9DQo+
ICAgDQo+IC1zdGF0aWMgaW50IHVkbF9hbGlnbmVkX2RhbWFnZV9jbGlwKHN0cnVjdCBkcm1f
cmVjdCAqY2xpcCwgaW50IHgsIGludCB5LA0KPiAtCQkJCSAgIGludCB3aWR0aCwgaW50IGhl
aWdodCkNCj4gLXsNCj4gLQlpbnQgeDEsIHgyOw0KPiAtDQo+IC0JaWYgKFdBUk5fT05fT05D
RSh4IDwgMCkgfHwNCj4gLQkgICAgV0FSTl9PTl9PTkNFKHkgPCAwKSB8fA0KPiAtCSAgICBX
QVJOX09OX09OQ0Uod2lkdGggPCAwKSB8fA0KPiAtCSAgICBXQVJOX09OX09OQ0UoaGVpZ2h0
IDwgMCkpDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAtDQo+IC0JeDEgPSBBTElHTl9ET1dO
KHgsIHNpemVvZih1bnNpZ25lZCBsb25nKSk7DQo+IC0JeDIgPSBBTElHTih3aWR0aCArICh4
IC0geDEpLCBzaXplb2YodW5zaWduZWQgbG9uZykpICsgeDE7DQo+IC0NCj4gLQljbGlwLT54
MSA9IHgxOw0KPiAtCWNsaXAtPnkxID0geTsNCj4gLQljbGlwLT54MiA9IHgyOw0KPiAtCWNs
aXAtPnkyID0geSArIGhlaWdodDsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+
ICAgc3RhdGljIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiwNCj4gICAJCQkgICAgIGNvbnN0IHN0cnVjdCBpb3N5c19tYXAgKm1hcCwNCj4gICAJ
CQkgICAgIGludCB4LCBpbnQgeSwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0KQ0KPiBAQCAtMjgy
LDExICsyNjAsNyBAQCBzdGF0aWMgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiLA0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICAJbG9nX2JwcCA9IHJl
dDsNCj4gICANCj4gLQlyZXQgPSB1ZGxfYWxpZ25lZF9kYW1hZ2VfY2xpcCgmY2xpcCwgeCwg
eSwgd2lkdGgsIGhlaWdodCk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4g
LQllbHNlIGlmICgoY2xpcC54MiA+IGZiLT53aWR0aCkgfHwgKGNsaXAueTIgPiBmYi0+aGVp
Z2h0KSkNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJZHJtX3JlY3RfaW5pdCgmY2xpcCwg
eCwgeSwgd2lkdGgsIGhlaWdodCk7DQoNClRoZSBjbGlwIHJlY3RhbmdsZSBjb3VsZCBiZSBw
YXNzZWQgZGlyZWN0bHkgYnkgdGhlIGNhbGxlciwgd2hpY2ggd291bGQgDQpzaW1wbGlmeSB0
aGUgdXBkYXRlIGZ1bmN0aW9uLiBCdXQgdGhhdCdzIHJlYWxseSBqdXN0IG5pdHBpY2tpbmcu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICANCj4gICAJcmV0ID0gZHJtX2dlbV9m
Yl9iZWdpbl9jcHVfYWNjZXNzKGZiLCBETUFfRlJPTV9ERVZJQ0UpOw0KPiAgIAlpZiAocmV0
KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJhbnNmZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX3RyYW5zZmVyLmMNCj4gaW5kZXggMTc2ZWYyYTZh
NzMxLi5hNDMxMjA4ZGRhODUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX3RyYW5zZmVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJhbnNm
ZXIuYw0KPiBAQCAtMjUsNDYgKzI1LDYgQEANCj4gICAjZGVmaW5lIE1JTl9SQVdfUElYX0JZ
VEVTCTINCj4gICAjZGVmaW5lIE1JTl9SQVdfQ01EX0JZVEVTCShSQVdfSEVBREVSX0JZVEVT
ICsgTUlOX1JBV19QSVhfQllURVMpDQo+ICAgDQo+IC0vKg0KPiAtICogVHJpbXMgaWRlbnRp
Y2FsIGRhdGEgZnJvbSBmcm9udCBhbmQgYmFjayBvZiBsaW5lDQo+IC0gKiBTZXRzIG5ldyBm
cm9udCBidWZmZXIgYWRkcmVzcyBhbmQgd2lkdGgNCj4gLSAqIEFuZCByZXR1cm5zIGJ5dGUg
Y291bnQgb2YgaWRlbnRpY2FsIHBpeGVscw0KPiAtICogQXNzdW1lcyBDUFUgbmF0dXJhbCBh
bGlnbm1lbnQgKHVuc2lnbmVkIGxvbmcpDQo+IC0gKiBmb3IgYmFjayBhbmQgZnJvbnQgYnVm
ZmVyIHB0cnMgYW5kIHdpZHRoDQo+IC0gKi8NCj4gLSNpZiAwDQo+IC1zdGF0aWMgaW50IHVk
bF90cmltX2hsaW5lKGNvbnN0IHU4ICpiYmFjaywgY29uc3QgdTggKipiZnJvbnQsIGludCAq
d2lkdGhfYnl0ZXMpDQo+IC17DQo+IC0JaW50IGosIGs7DQo+IC0JY29uc3QgdW5zaWduZWQg
bG9uZyAqYmFjayA9IChjb25zdCB1bnNpZ25lZCBsb25nICopIGJiYWNrOw0KPiAtCWNvbnN0
IHVuc2lnbmVkIGxvbmcgKmZyb250ID0gKGNvbnN0IHVuc2lnbmVkIGxvbmcgKikgKmJmcm9u
dDsNCj4gLQljb25zdCBpbnQgd2lkdGggPSAqd2lkdGhfYnl0ZXMgLyBzaXplb2YodW5zaWdu
ZWQgbG9uZyk7DQo+IC0JaW50IGlkZW50aWNhbCA9IHdpZHRoOw0KPiAtCWludCBzdGFydCA9
IHdpZHRoOw0KPiAtCWludCBlbmQgPSB3aWR0aDsNCj4gLQ0KPiAtCWZvciAoaiA9IDA7IGog
PCB3aWR0aDsgaisrKSB7DQo+IC0JCWlmIChiYWNrW2pdICE9IGZyb250W2pdKSB7DQo+IC0J
CQlzdGFydCA9IGo7DQo+IC0JCQlicmVhazsNCj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAtCWZv
ciAoayA9IHdpZHRoIC0gMTsgayA+IGo7IGstLSkgew0KPiAtCQlpZiAoYmFja1trXSAhPSBm
cm9udFtrXSkgew0KPiAtCQkJZW5kID0gaysxOw0KPiAtCQkJYnJlYWs7DQo+IC0JCX0NCj4g
LQl9DQo+IC0NCj4gLQlpZGVudGljYWwgPSBzdGFydCArICh3aWR0aCAtIGVuZCk7DQo+IC0J
KmJmcm9udCA9ICh1OCAqKSAmZnJvbnRbc3RhcnRdOw0KPiAtCSp3aWR0aF9ieXRlcyA9IChl
bmQgLSBzdGFydCkgKiBzaXplb2YodW5zaWduZWQgbG9uZyk7DQo+IC0NCj4gLQlyZXR1cm4g
aWRlbnRpY2FsICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpOw0KPiAtfQ0KPiAtI2VuZGlmDQo+
IC0NCj4gICBzdGF0aWMgaW5saW5lIHUxNiBwaXhlbDMyX3RvX2JlMTYoY29uc3QgdWludDMy
X3QgcGl4ZWwpDQo+ICAgew0KPiAgIAlyZXR1cm4gKCgocGl4ZWwgPj4gMykgJiAweDAwMWYp
IHwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------vFg8aX2UENEnrbnIinY0bicW--

--------------r077VbBHMhyyEpnYuH0rC6HF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYSGEFAwAAAAAACgkQlh/E3EQov+DD
4Q//WZyqLD5yCAKH0fn/Fa+P30wSORAGqbT2gIjD9rQLWMLzPS8O9UEnV3lm/PvxvpaGjEuLcP9R
/quZJWxUCvAuKGNePFY3BYkhNvNLFSUI+GR6yJJx52lpO1vTSgolDpf0UA84mAhX6gOUJHKFWLlj
yX2tIjevev/FSM85GNa99I448nHZjyMsF67kcx1zhR2lPDFWx2znzLZu+VIXlgzOp5t+ql36dm4t
dhK4nZkMP7PDMH51Sij3XXScT3lV2UBDD4MLEZprvB7C+OUg6akPPK3WOalS0s2No5nrzKsIXuti
esPMnPqLQzbBzV8LC9OBUHk06P9M8fbLHp/6Pn1+6EfcyoMKlz+sKQwGAoFUcCQw9QhRsi9L3hgc
nk7Rfn7mrM6W6hEMUdBS30X/dO91UX12b43AwbccQsiN6xpavcfuFKWg1vM4QFXrEPGXwYU/wwTB
1MP+d4QLU3K4U4M3mae5tYkiUJasusSqr6nTW/BkJEEin3v0VF72dYmVTU/vsOy8HoOSHeHXl4hA
iFjOsyyUUzm0Aiju9PDaHmkB0or23bsw4bDotFlFJ2X2UEPAMz1iwE8rWiLu7eiKrzMJu5fFbXko
R2fdhfWOqHX6vB6rdJNJfNITL3AdvA4RTbXu4dMW11swej0Nm/tOc6aN3viUNkwIuaA5FdeKVIep
YZI=
=EK0a
-----END PGP SIGNATURE-----

--------------r077VbBHMhyyEpnYuH0rC6HF--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1405ACDEB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8452510E21C;
	Mon,  5 Sep 2022 08:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D1210E21C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:41:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64B82387C3;
 Mon,  5 Sep 2022 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662367259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KYgwnDxq6b/e8pH8dJnwoiVXF+lkwFZiUAZXikt7luM=;
 b=T7g/IQheLj45xTIv1/5zSL9Y/bR4ro6Mop11A86kfad81ZSNkMLkvz3jm/NbHlK7kVUOUz
 vjAJ/JdSryyrPbBgPB8oAV3lN93FyjWVPIzjQFV08fRw6pXcPcIHsy3271C7t2/IZFS16j
 M8wXHbs2N8SKnJsJjzdWVg/9yixYoZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662367259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KYgwnDxq6b/e8pH8dJnwoiVXF+lkwFZiUAZXikt7luM=;
 b=MB6RjofvQhJ3G+kM4TYW726o4VZUmYVL9R++d5zhRV9Qi+Pmdl8p+CWxlB9xytvqEEP/Bo
 LptkEX5DDjguOEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C9C5139C7;
 Mon,  5 Sep 2022 08:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E6DAERu2FWP/EgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 08:40:59 +0000
Message-ID: <05f4a358-70df-18f4-1672-f02c9eebe98f@suse.de>
Date: Mon, 5 Sep 2022 10:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/12] drm/udl: Drop unneeded alignment
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-9-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220816153655.27526-9-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YWgeRxXPD07LCwOAip6otCvo"
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
--------------YWgeRxXPD07LCwOAip6otCvo
Content-Type: multipart/mixed; boundary="------------LcV5naX6lWXl0AjrNmLmgNdo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <05f4a358-70df-18f4-1672-f02c9eebe98f@suse.de>
Subject: Re: [PATCH 08/12] drm/udl: Drop unneeded alignment
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-9-tiwai@suse.de>
In-Reply-To: <20220816153655.27526-9-tiwai@suse.de>

--------------LcV5naX6lWXl0AjrNmLmgNdo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDguMjIgdW0gMTc6MzYgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IFRo
ZSBhbGlnbm1lbnQgb2YgZGFtYWdlZCBhcmVhIHdhcyBuZWVkZWQgZm9yIHRoZSBvcmlnaW5h
bCB1ZGxmYiBkcml2ZXINCj4gdGhhdCB0cmllZCB0byB0cmltIHRoZSBzdXBlcmZsdW91cyBj
b3BpZXMgYmV0d2VlbiBmcm9udCBhbmQgYmFja2VuZA0KPiBidWZmZXJzIGFuZCBoYW5kbGUg
ZGF0YSBpbiBsb25nIGludC4gIEl0J3Mgbm90IHRoZSBjYXNlIGZvciB1ZGwgRFJNDQo+IGRy
aXZlciwgaGVuY2Ugd2UgY2FuIG9taXQgdGhlIHdob2xlIHVubmVlZGVkIGFsaWdubWVudCwg
YXMgd2VsbCBhcyB0aGUNCj4gZGVhZCBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFr
YXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9tb2Rlc2V0LmMgIHwgMzQgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX3RyYW5zZmVyLmMgfCA0MCAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNjYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5j
DQo+IGluZGV4IGMzNGQ1NjQ3NzNhMy4uYmNhMzFjODkwMTA4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+IEBAIC0yNDMsMjggKzI0Myw2IEBAIHN0YXRpYyBs
b25nIHVkbF9sb2dfY3BwKHVuc2lnbmVkIGludCBjcHApDQo+ICAgCXJldHVybiBfX2Zmcyhj
cHApOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgdWRsX2FsaWduZWRfZGFtYWdlX2Ns
aXAoc3RydWN0IGRybV9yZWN0ICpjbGlwLCBpbnQgeCwgaW50IHksDQo+IC0JCQkJICAgaW50
IHdpZHRoLCBpbnQgaGVpZ2h0KQ0KPiAtew0KPiAtCWludCB4MSwgeDI7DQo+IC0NCj4gLQlp
ZiAoV0FSTl9PTl9PTkNFKHggPCAwKSB8fA0KPiAtCSAgICBXQVJOX09OX09OQ0UoeSA8IDAp
IHx8DQo+IC0JICAgIFdBUk5fT05fT05DRSh3aWR0aCA8IDApIHx8DQo+IC0JICAgIFdBUk5f
T05fT05DRShoZWlnaHQgPCAwKSkNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0NCj4gLQl4
MSA9IEFMSUdOX0RPV04oeCwgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKTsNCj4gLQl4MiA9IEFM
SUdOKHdpZHRoICsgKHggLSB4MSksIHNpemVvZih1bnNpZ25lZCBsb25nKSkgKyB4MTsNCj4g
LQ0KPiAtCWNsaXAtPngxID0geDE7DQo+IC0JY2xpcC0+eTEgPSB5Ow0KPiAtCWNsaXAtPngy
ID0geDI7DQo+IC0JY2xpcC0+eTIgPSB5ICsgaGVpZ2h0Ow0KPiAtDQo+IC0JcmV0dXJuIDA7
DQo+IC19DQo+IC0NCj4gICBzdGF0aWMgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiLA0KPiAgIAkJCSAgICAgY29uc3Qgc3RydWN0IGlvc3lzX21h
cCAqbWFwLA0KPiAgIAkJCSAgICAgaW50IHgsIGludCB5LCBpbnQgd2lkdGgsIGludCBoZWln
aHQpDQo+IEBAIC0yNzcsMTUgKzI1NSwxOSBAQCBzdGF0aWMgaW50IHVkbF9oYW5kbGVfZGFt
YWdlKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiAgIAlzdHJ1Y3QgZHJtX3JlY3Qg
Y2xpcDsNCj4gICAJaW50IGxvZ19icHA7DQo+ICAgDQo+ICsJaWYgKHdpZHRoIDw9IDAgfHwg
aGVpZ2h0IDw9IDApDQo+ICsJCXJldHVybiAwOw0KPiArDQoNClRoYXQgc2hvdWxkbid0IGhh
cHBlbi4NCg0KPiAgIAlyZXQgPSB1ZGxfbG9nX2NwcChmYi0+Zm9ybWF0LT5jcHBbMF0pOw0K
PiAgIAlpZiAocmV0IDwgMCkNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgCWxvZ19icHAgPSBy
ZXQ7DQo+ICAgDQo+IC0JcmV0ID0gdWRsX2FsaWduZWRfZGFtYWdlX2NsaXAoJmNsaXAsIHgs
IHksIHdpZHRoLCBoZWlnaHQpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+
IC0JZWxzZSBpZiAoKGNsaXAueDIgPiBmYi0+d2lkdGgpIHx8IChjbGlwLnkyID4gZmItPmhl
aWdodCkpDQo+ICsJY2xpcC54MSA9IHg7DQo+ICsJY2xpcC55MSA9IHk7DQo+ICsJY2xpcC54
MiA9IHggKyB3aWR0aDsNCj4gKwljbGlwLnkyID0geSArIGhlaWdodDsNCg0KZHJtX3JlY3Rf
aW5pdCgpIHBsZWFzZS4NCg0KPiArCWlmIChjbGlwLngyID4gZmItPndpZHRoIHx8IGNsaXAu
eTIgPiBmYi0+aGVpZ2h0KQ0KDQpUaGF0J3MgYW5vdGhlciB0aGluZyB0aGF0IHNob3VsZCBu
b3QgaGFwcGVuLiBUaGUgZGFtYWdlIGNsaXBzIGluIHRoZSANCnBsYW5lIHN0YXRlIGlzIHdo
YXQgeW91IHdoYXQgdG8gY29weS4gVGhlIERSTSBoZWxwZXJzIGVuc3VyZSB0aGF0IHRoZXNl
IA0KdmFyaW91cyBwbGFuZSwgZmIgYW5kIGNsaXAgY29vcmRpbmF0ZXMgYWRkIHVwLg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4g
ICAJcmV0ID0gZHJtX2dlbV9mYl9iZWdpbl9jcHVfYWNjZXNzKGZiLCBETUFfRlJPTV9ERVZJ
Q0UpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJhbnNmZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX3RyYW5zZmVyLmMNCj4gaW5kZXggMTc2ZWYy
YTZhNzMxLi5hNDMxMjA4ZGRhODUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX3RyYW5zZmVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJh
bnNmZXIuYw0KPiBAQCAtMjUsNDYgKzI1LDYgQEANCj4gICAjZGVmaW5lIE1JTl9SQVdfUElY
X0JZVEVTCTINCj4gICAjZGVmaW5lIE1JTl9SQVdfQ01EX0JZVEVTCShSQVdfSEVBREVSX0JZ
VEVTICsgTUlOX1JBV19QSVhfQllURVMpDQo+ICAgDQo+IC0vKg0KPiAtICogVHJpbXMgaWRl
bnRpY2FsIGRhdGEgZnJvbSBmcm9udCBhbmQgYmFjayBvZiBsaW5lDQo+IC0gKiBTZXRzIG5l
dyBmcm9udCBidWZmZXIgYWRkcmVzcyBhbmQgd2lkdGgNCj4gLSAqIEFuZCByZXR1cm5zIGJ5
dGUgY291bnQgb2YgaWRlbnRpY2FsIHBpeGVscw0KPiAtICogQXNzdW1lcyBDUFUgbmF0dXJh
bCBhbGlnbm1lbnQgKHVuc2lnbmVkIGxvbmcpDQo+IC0gKiBmb3IgYmFjayBhbmQgZnJvbnQg
YnVmZmVyIHB0cnMgYW5kIHdpZHRoDQo+IC0gKi8NCj4gLSNpZiAwDQo+IC1zdGF0aWMgaW50
IHVkbF90cmltX2hsaW5lKGNvbnN0IHU4ICpiYmFjaywgY29uc3QgdTggKipiZnJvbnQsIGlu
dCAqd2lkdGhfYnl0ZXMpDQo+IC17DQo+IC0JaW50IGosIGs7DQo+IC0JY29uc3QgdW5zaWdu
ZWQgbG9uZyAqYmFjayA9IChjb25zdCB1bnNpZ25lZCBsb25nICopIGJiYWNrOw0KPiAtCWNv
bnN0IHVuc2lnbmVkIGxvbmcgKmZyb250ID0gKGNvbnN0IHVuc2lnbmVkIGxvbmcgKikgKmJm
cm9udDsNCj4gLQljb25zdCBpbnQgd2lkdGggPSAqd2lkdGhfYnl0ZXMgLyBzaXplb2YodW5z
aWduZWQgbG9uZyk7DQo+IC0JaW50IGlkZW50aWNhbCA9IHdpZHRoOw0KPiAtCWludCBzdGFy
dCA9IHdpZHRoOw0KPiAtCWludCBlbmQgPSB3aWR0aDsNCj4gLQ0KPiAtCWZvciAoaiA9IDA7
IGogPCB3aWR0aDsgaisrKSB7DQo+IC0JCWlmIChiYWNrW2pdICE9IGZyb250W2pdKSB7DQo+
IC0JCQlzdGFydCA9IGo7DQo+IC0JCQlicmVhazsNCj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAt
CWZvciAoayA9IHdpZHRoIC0gMTsgayA+IGo7IGstLSkgew0KPiAtCQlpZiAoYmFja1trXSAh
PSBmcm9udFtrXSkgew0KPiAtCQkJZW5kID0gaysxOw0KPiAtCQkJYnJlYWs7DQo+IC0JCX0N
Cj4gLQl9DQo+IC0NCj4gLQlpZGVudGljYWwgPSBzdGFydCArICh3aWR0aCAtIGVuZCk7DQo+
IC0JKmJmcm9udCA9ICh1OCAqKSAmZnJvbnRbc3RhcnRdOw0KPiAtCSp3aWR0aF9ieXRlcyA9
IChlbmQgLSBzdGFydCkgKiBzaXplb2YodW5zaWduZWQgbG9uZyk7DQo+IC0NCj4gLQlyZXR1
cm4gaWRlbnRpY2FsICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpOw0KPiAtfQ0KPiAtI2VuZGlm
DQo+IC0NCj4gICBzdGF0aWMgaW5saW5lIHUxNiBwaXhlbDMyX3RvX2JlMTYoY29uc3QgdWlu
dDMyX3QgcGl4ZWwpDQo+ICAgew0KPiAgIAlyZXR1cm4gKCgocGl4ZWwgPj4gMykgJiAweDAw
MWYpIHwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------LcV5naX6lWXl0AjrNmLmgNdo--

--------------YWgeRxXPD07LCwOAip6otCvo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVthoFAwAAAAAACgkQlh/E3EQov+D7
mw/9EjvsJv7pTgo13jBJ7pvld3N0D3q4FOTiJbpf7eXeHgJHoyDOuaVe6ZAd870OF1N0qtp7JhHi
OBxmIL99BopFKLALC6+DG3RKXAAFGi6t4jZvENqObzCtVKx0+RrTts5jnzzuq7vt+NpFOkYVVjtP
VPQK7TDQUSV/OkGPMcSvFf0IzlC585PfE9CtxHUAIbZ4+iI+rumVQkYuYS9t2efL8iccxn0l2wQh
gz6Tc8AuL04QjZI+BBufvFcq01T7snmJGsiFVc+QJfBlXonVfxwff0TaOaUiBW2YuOT1EIQtOzAL
M2EitmisBAzAJ2gPbn7I6Lj1g3tmHIxtLhCLUDIdcS6IoeAFNazOJo20PXQW9QIV3K/jBXa3F8fD
7p1fMXKQQFQAiJlu5MRc4JLqg0HgyAWYKrTXKWi9ARRdAVjVhzv4AXfIF9Fs1Er+ZfXML9V5hhTP
SQAs4IfFapNggl2pl8RVigv//ol02KRsgGr1nRO3fda467Djb/5vYViZeqlfuexnkIeUSCPHX5xh
HjidQfwjVZOKZfYhf5kky4z8w8C88SizyqHK1vDUfMzZJI13lk35eqSnbM3MV6sy4TlUT8Vcq3cK
I3+ndvdGCDGDDIvRZnr/kN9f1dBfIrbfBpHAeKBoCP295maj0siPjN95cYSb8VEDvi/8LTODPA5V
1fM=
=3rk1
-----END PGP SIGNATURE-----

--------------YWgeRxXPD07LCwOAip6otCvo--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9B72DFE4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049CF10E35F;
	Tue, 13 Jun 2023 10:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6094A10E35F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:41:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52F1C1FD83;
 Tue, 13 Jun 2023 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686652909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qDv5KLhuAS2RVAdszQRavDCxk++YH+RdELMiClmSWwQ=;
 b=XJU6y3LK6RYzA1O/Ikz8g+1B77SG87X809ArumPGZjtIcKRN9pkGnf/8twxCJBjPa1YY+8
 8XvE1G1CghoSirBh2p8gJ2aSAYeg9wZE/5sHJa45n/649VlpkTWJlhdye4vI5XjKHAtCmq
 PIa9+MRu4k7RHxKPXRUh6BlbN4q0qa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686652909;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qDv5KLhuAS2RVAdszQRavDCxk++YH+RdELMiClmSWwQ=;
 b=miINJ499S39p9ehG22i/Bd7NDQ3enYwx9z22Hczi8ohST/GCWCJlgUnPl1gsw+e63BFnYw
 bTIbFCWghP582SCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0526E13483;
 Tue, 13 Jun 2023 10:41:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U74GAO1HiGSkeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 10:41:48 +0000
Message-ID: <c8a02cb7-3824-3bee-cf26-1b14052df4cb@suse.de>
Date: Tue, 13 Jun 2023 12:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 00/38] fbdev: Make userspace interfaces optional
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612155601.GC1243864@ravnborg.org>
 <87jzw83bwe.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87jzw83bwe.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i0WO9JVb8zihevgDKbzAtoJ9"
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 michael.j.ruhl@intel.com, linux-omap@vger.kernel.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i0WO9JVb8zihevgDKbzAtoJ9
Content-Type: multipart/mixed; boundary="------------dSfZ0dhr8Th5P1cdqrURkGJQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, dan.carpenter@linaro.org,
 michael.j.ruhl@intel.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-ID: <c8a02cb7-3824-3bee-cf26-1b14052df4cb@suse.de>
Subject: Re: [PATCH v2 00/38] fbdev: Make userspace interfaces optional
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612155601.GC1243864@ravnborg.org>
 <87jzw83bwe.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87jzw83bwe.fsf@minerva.mail-host-address-is-not-set>

--------------dSfZ0dhr8Th5P1cdqrURkGJQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtIGFuZCBKYXZpZXINCg0KQW0gMTIuMDYuMjMgdW0gMTg6MDQgc2NocmllYiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4gd3JpdGVzOg0KPiANCj4gSGVsbG8gU2FtLA0KPiANCj4+IEhpIFRob21hcywNCj4+DQo+
PiBOaWNlIHNlcmllcywgcXVpdGUgc29tZSBwcmVwYXJhdGlvbnMuDQo+Pg0KPj4gT24gTW9u
LCBKdW4gMTIsIDIwMjMgYXQgMDQ6MDc6MzhQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4g
d3JvdGU6DQo+IA0KPiBbLi4uXQ0KPiANCj4+PiAgICBmYmRldi9zbXNjdWZ4OiBEZXRlY3Qg
cmVnaXN0ZXJlZCBmYl9pbmZvIGZyb20gcmVmY291bnQNCj4+IEkgZGlkIG5vdCB0cnkgdG8g
dW5kZXJzdGFuZCB0aGUgY29kZSwgc28gb3RoZXJzIG11c3QgcmV2aWV3Lg0KPj4NCj4gDQo+
IE5vIHdvcnJpZXMsIEkgYWxyZWFkeSByZXZpZXdlZCB0aGF0IG9uZS4NCj4gDQo+Pj4gICAg
ZmJkZXYvZXA5M3h4LWZiOiBBbGxvYyBETUEgbWVtb3J5IGZyb20gaGFyZHdhcmUgZGV2aWNl
DQo+Pj4gICAgZmJkZXYvc2g3NzYwZmI6IEFsbG9jIERNQSBtZW1vcnkgZnJvbSBoYXJkd2Fy
ZSBkZXZpY2UNCj4+IFRoaXMgc21lbGxzIGxpa2UgYnVnLWZpeGVzLCBhbmQgSSBkbyBub3Qg
c2VlIHdoYXQgaW1wYWN0IHRoZSBjaGFuZ2UgaGFzLg0KPj4gU28gYWdhaW4sIHNvbWVvbmUg
ZWxzZSBuZWVkcyB0byBwcm92aWRlIHJldmlldyBoZXJlLg0KPj4NCj4gDQo+IEFuZCBzYW1l
IGZvciB0aGVzZS4NCj4gDQoNClRoYW5rcyB0byBib3RoIG9mIHlvdSBmb3IgcmV2aWV3aW5n
IHRoZSBwYXRjaGVzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5i
ZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0Rv
bmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------dSfZ0dhr8Th5P1cdqrURkGJQ--

--------------i0WO9JVb8zihevgDKbzAtoJ9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSIR+sFAwAAAAAACgkQlh/E3EQov+DN
qA//VwPgcM9Z5eZjfzwDmSeNH73KFZKMPLKRaNviUeyysvUw+QaSebUvO40W4YhPKYCYDjtBSYYR
WfPN7jCYXudLHGZsCtmu1jCaW7zVEEF2TAopa2zgIZC/MNwzNItIzHCl7cLcyalIUnMJauQkHXkS
ip1Cwx/xu0yLqGtnMUuLGHuuItNScMqSEdPJG1Ej3fK4fhWiEF2oAywEptj/e8D37PBEeH4vxVaP
w85riFiuXbbq1KmsYoVmn2hMwCyqvNSpKWlCPwdEzIf5rlA78Bn5cl9eYx2Y9fpjpJlRUcjaxDbF
XUhyMUyS5mMK5zm6tgohfMUrLU2aOZn6DuPNVU0YNo0+0YfOQPWvTRuGinjoZjkDxskGa9PWbQnx
7GTCPGaMHFGCeqS0aT3ZBFb2cdDRBBQm2+QKhNA9MflsashkRlVr8T1zyr06wIBognt0unfsFiUZ
jdwOCQgMXtVq1dmvuVDW7OEF1CRCPTvQZqS7jCpZBmatLNb+s2pBbQT0ieMR9foxeeNLWduw2yxm
U590bLPVQjO/DPlCZT4l2YLiEBiWjif1JDdYZUR2nEB8bzLAyXVtdAMBW1TMlKjsIkBZq0UbdmBJ
vIHBojHp/G7ez4/1J6qYeyTEjnyxheFLZQPjnvLA7YAsv9cUZEjroWow/686Hy7uMgFUm8iP4GEX
wFE=
=QAcd
-----END PGP SIGNATURE-----

--------------i0WO9JVb8zihevgDKbzAtoJ9--

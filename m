Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20879492819
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 15:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E25910E504;
	Tue, 18 Jan 2022 14:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D110E504
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 14:14:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CFF7A1F3B5;
 Tue, 18 Jan 2022 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642515283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATBnUEU9lIqKXhdj6B47cBmL/9xBONGUqasfytnV4S4=;
 b=tyGBJA22rT9NejaOUvehSKgB7/oB+z+ZXM95GXJbQTShSKPTfn0hj1WWqlcBaCP6NKE9Hd
 sG98aTzHGb38JD6i4GKpo31w1NHWyu0Up6v8IFGtkdvXrEAVRH6wts6kMTKDo9pE3DqkuV
 QUlcwV98K49EYCAHkUKu8tugmiNrtdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642515283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATBnUEU9lIqKXhdj6B47cBmL/9xBONGUqasfytnV4S4=;
 b=VZVmU56vAMytlSoK1rG9eqeqjSrwFpsyvAheDVN2btyzYbCPv0cXzh3vAU6wSvBYaP4HGa
 xgcQ1HQ9+uln0jCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B7A113AAD;
 Tue, 18 Jan 2022 14:14:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YkTzJFPL5mGMNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Jan 2022 14:14:43 +0000
Message-ID: <c4b9ba30-3da1-56cf-7237-8587d80daaf4@suse.de>
Date: Tue, 18 Jan 2022 15:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xTg5242G1YwO0JkRNignGb3v"
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xTg5242G1YwO0JkRNignGb3v
Content-Type: multipart/mixed; boundary="------------8At9tZ4ufV00PpBi4v1EPAv7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <c4b9ba30-3da1-56cf-7237-8587d80daaf4@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
In-Reply-To: <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>

--------------8At9tZ4ufV00PpBi4v1EPAv7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMTc6MjEgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDEvMTcvMjIgMTY6NTgsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+
PiBBbSAxNy4wMS4yMiB1bSAxNjo0MiBzY2hyaWViIEhlbGdlIERlbGxlcjoNCj4+PiBbLi4u
XQ0KPj4+Pj4gYykgcmVpbnRyb2R1Y2UgdGhlIHN0YXRlIHdoZXJlIGZiY29uIGlzIGZhc3Qg
b24gZmJkZXYuIFRoaXMgaXMgaW1wb3J0YW50IGZvciBub24tRFJNIG1hY2hpbmVzLA0KPj4+
Pj4gIMKgwqDCoCBlaXRoZXIgd2hlbiBydW4gb24gbmF0aXZlIGhhcmR3YXJlIG9yIGluIGFu
IGVtdWxhdG9yLg0KPj4+Pj4gZCkgbm90IGJyZWFrIERSTSBkZXZlbG9wbWVudA0KPj4+Pj4N
Cj4+Pj4+IEVzcGVjaWFsbHkgcmVnYXJkaW5nIGMpIEkgY29tcGxhaW5lZCBpbiBbMV0gYW5k
IGdvdCBubyBmZWVkYmFjay4gSSByZWFsbHkgd291bGQgbGlrZSB0bw0KPj4+Pj4gdW5kZXJz
dGFuZCB3aGVyZSB0aGUgYWN0dWFsIHByb2JsZW1zIHdlcmUgYW5kIHdoYXQncyBuZWNlc3Nh
cnkgdG8gZml4IHRoZW0uDQo+Pj4+Pg0KPj4+Pj4gSGVsZ2UNCj4+Pj4+DQo+Pj4+PiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9mZWVhODMwMy0yYjgzLWZjMzYtOTcyYy00ZmM4
YWQ3MjNiZGVAZ214LmRlDQo+Pg0KPj4gU2VlbXMgbGlrZSBmZXcgcGVvcGxlIHJlYWQgbGlu
dXgtZmJkZXYgdGhlc2UgZGF5cy4NCj4+IEkgc3VnZ2VzdCB0byBwYXJ0bHkgcmV2ZXJ0IHRo
ZSBwYXRjaCB0byB0aGUgcG9pbnQgd2VyZSBwZXJmb3JtYW5jZQ0KPj4gZ2V0cyBiZXR0ZXIg
YWdhaW4uDQoNCklmIHlvdSB3YW50IHRoYXQsIHlvdSBzaG91bGQgc2VuZCBhIHBhdGNoLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IFllcywgKnBsZWFzZSohDQo+IFRoYXQgd291
bGQgc29sdmUgbXkgYmlnZ2VzdCBjb25jZXJuLg0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNl
ZSB0aGF0J3Mgb25seSAyIGNvbW1pdHMgdG8gYmUgcmV2ZXJ0ZWQ6DQo+IGIzZWM4Y2RmNDU3
ZSAtICJmYmRldjogR2FyYmFnZSBjb2xsZWN0IGZiZGV2IHNjcm9sbGluZyBhY2NlbGVyYXRp
b24sIHBhcnQgMSAoZnJvbSBUT0RPIGxpc3QpIg0KPiAzOWFlYWQ4MzczYjMgLSAiZmJjb246
IERpc2FibGUgYWNjZWxlcmF0ZWQgc2Nyb2xsaW5nImZvci1uZXh0LW5leHQNCj4gDQo+IEkg
dGhpbmsgYm90aCB3ZXJlIG5vdCByZWxhdGVkIHRvIGFueSAwLWRheSBidWcgcmVwb3J0cyAo
YnV0IGFnYWluLCBJIG1pZ2h0IGJlIHdyb25nKS4NCj4gDQo+IEhlbGdlDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------8At9tZ4ufV00PpBi4v1EPAv7--

--------------xTg5242G1YwO0JkRNignGb3v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHmy1MFAwAAAAAACgkQlh/E3EQov+BH
pA//XDmi3wDb7AFQSHvihxfXd5tVw12MkQMl/xN3Xr5g0oNsvr/A5NNvzC4gGiqodv4hNkbs9gj6
8ZeA8jRlicynQ0C7XyOteT27F/dgKQ8wmBu0tdOKg0tX3YAEb9VyYlQSr40pDGRyvkTZmYL4WYiL
dKLuhmq1bJwIJBdBICXuFeBJoCE/BhJQFnr/+S6vC3vFs/verysUh2+9cYWd8DCKcnc8fl74KJJr
L/PBiXyukfJgHvnbNZSaAP4x4w7EcXKd4v6ah7V1ajUqErckkG6gQmvjTP/BTz2N48Ag34/N6qE6
EoEv2MJj8A5hjRtzmuARh/54jMzBYLL8IU627nZBs9Tx3v6+DORzT9nNo06lWcyWWyVWkFtt9F9b
SoQYDbkJs7blndnmCdyN92JabQ2I+TLkKoA7IbyWC4ubEW3znhrQyTN5WLtHuJbNTOOsoiZwC4He
c/AqliSeolRseYhQpdaUiSO6r7ocEt4roC9FuHWenbbX/3s+zq+0nd9cdp2rAJVXgSSkS552I+ll
Pflbo6fYH+bSfdzJdevsqKfezONpsMpmCsHPI0L3LfaSwtqmRjzWPg0MvEhG6PKzUVr++ZNilKIJ
8XXA+/4Y5yP5JuvgxMk8TBf6QnoraRj8lgbXqtF4gFJtUFuhX/Oc2gGhy20+t7lh9FeuYAmkh7mb
+JU=
=F3zH
-----END PGP SIGNATURE-----

--------------xTg5242G1YwO0JkRNignGb3v--

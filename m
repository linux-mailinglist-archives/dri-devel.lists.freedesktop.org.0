Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C86EE460
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 17:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257D410E0BD;
	Tue, 25 Apr 2023 15:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E8310E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 15:03:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF1BA1FD82;
 Tue, 25 Apr 2023 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682435020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P5MIS4IDz3rCcgWVjMoxhXddZz/8YdrBAfZ/1saWTJU=;
 b=suFjCtjVUoZMxcYfqHf6H5dJ3dKza/8x44fbwOy692QRSwkbm0gf0pRnrGhtEH9XaAM9YT
 7y3LEQx3nNRchgMhmDhQUaw6JGUmUOJLu8pGeZrT1lYQN2caS3sdyo+ntJM+FE2EgICqXS
 lMaiMNDKi07tL34X4WolaaBbmp4w7pM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682435020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P5MIS4IDz3rCcgWVjMoxhXddZz/8YdrBAfZ/1saWTJU=;
 b=YG72GDkfgZpQwcQKQw8/PvWdgICMzhMiCUGb7X0G5cNYskTbP/FKlnMt+bs/C/FjwrLvXS
 9GIVjNKc/HNYIrAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FC18138E3;
 Tue, 25 Apr 2023 15:03:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qS0nAczrR2QLTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Apr 2023 15:03:40 +0000
Message-ID: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
Date: Tue, 25 Apr 2023 17:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
Content-Language: en-US
To: kernel@linuxace.com
References: <20220708093929.4446-8-tzimmermann@suse.de>
 <20230425142519.13201-1-kernel@linuxace.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230425142519.13201-1-kernel@linuxace.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8S0EWQhcnNeECAgNKZjk5C46"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8S0EWQhcnNeECAgNKZjk5C46
Content-Type: multipart/mixed; boundary="------------ZkgYOpaAFGmQjSMp2JXzgeCs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel@linuxace.com
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
Subject: Re: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
References: <20220708093929.4446-8-tzimmermann@suse.de>
 <20230425142519.13201-1-kernel@linuxace.com>
In-Reply-To: <20230425142519.13201-1-kernel@linuxace.com>

--------------ZkgYOpaAFGmQjSMp2JXzgeCs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjJ2luZyBkcmktZGV2ZWwsIEpvY2VseW4gYW5kIFNhbSkNCg0KSGkgUGhpbCwNCg0KSSd2
ZSBwdXQgZHJpLWRldmVsIGludG8gY2MsIHdoaWNoIGlzIHRoZSBkZXZlbG9wZXIncyBtYWls
aW5nIGxpc3QuIEl0J3MgDQp0aGUgZmlyc3QgdGltZSBJIGhlYXIgYWJvdXQgdGhpcyBidWcu
DQoNCkFtIDI1LjA0LjIzIHVtIDE2OjI1IHNjaHJpZWIga2VybmVsQGxpbnV4YWNlLmNvbToN
Cj4gSGkgVGhvbWFzLA0KPiANCj4gSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIHRyYWNrIGRvd24g
d2h5IHdlIGxvc3QgY29uc29sZSBvbiBvdXIgRGVsbCBzZXJ2ZXJzIHNpbmNlDQo+IHN3aXRj
aGluZyB0byBrZXJuZWwgNi4xLCBhbmQgZmluYWxseSBuYXJyb3dlZCBpdCBkb3duIHRvIHRo
ZSBjb21taXQgcmVmZXJlbmNlZA0KPiBpbiB0aGUgc3ViamVjdCAoMWJhZjkxMjdjNDgyKS4g
IElmIEkgYm9vdCBrZXJuZWwgMWJhZjkxMjdjNDgyLCBJIHdpbGwgaGF2ZQ0KPiBubyBjb25z
b2xlIGF0IGFsbCBvbiBteSBzZXJ2ZXJzLiAgQm9vdGluZyB0aGUgcHJpb3Iga2VybmVsICg0
ZjRkYzM3ZTM3NGMpIHJlc3RvcmVzDQo+IGNvbnNvbGUuICBUaGUgc2VydmVyIEkgYW0gdGVz
dGluZyBvbiBoYXMgYSBHMjAwRUggY2FyZC4NCj4gDQo+IFRoZXJlIGlzIGEgYnVnIHJlcG9y
dCBhYm91dCB0aGlzIChub3Qgb3BlbmVkIGJ5IG1lKSBoZXJlOg0KPiANCj4gaHR0cHM6Ly9i
dWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0yMTcxMTU1DQo+IA0KPiBidXQg
SSdtIG5vdCBzdXJlIGlmIFJlZEhhdCBidWd6aWxsYSBpcyB0aGUgYmVzdCBwbGFjZSB0byBy
ZXBvcnQgdGhpcy4gIEFueQ0KPiBzdWdnZXN0aW9ucyBmb3IgYSBiZXR0ZXIgcGxhY2U/ICBJ
J20gYXZhaWxhYmxlIGZvciBhbnkgdGVzdGluZy4gIEkndmUgYWxyZWFkeQ0KPiB0cmllZCBz
aW1wbHkgcmV2ZXJ0aW5nIHRoaXMgY29tbWl0IGZyb20gNi4xIGJ1dCBpdCBkb2VzIG5vdCBy
ZXZlcnNlIGNsZWFubHkNCj4gZ2l2ZW4gYWxsIHRoZSBvdGhlciBNR0EgY2hhbmdlcyBtYWRl
IGFmdGVyIHRoaXMgc3BlY2lmaWMgY29tbWl0LiAgQW55DQo+IGd1aWRhbmNlIHlvdSBjb3Vs
ZCBwcm92aWRlIGlzIGFwcHJlY2lhdGVkLg0KDQpZb3UgY2Fubm90IHJlYWxseSByZXZlcnQg
aXQsIGFzIGl0J3MgdG9vIG9sZCBhbHJlYWR5LiBCdXQgY291bGQgeW91IA0KcGxlYXNlIHRy
eSB0aGUgbGF0ZXN0IGRldmVsb3BlciB0cmVlIGZyb20NCg0KICAgZ2l0Oi8vYW5vbmdpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXANCg0KVGhlIGJyYW5jaCBpcyBkcm0tdGlwLiBN
YXliZSB0aGUgYnVnIGhhcyBiZWVuIGZpeGVkIG1lYW53aGlsZS4gSWYgdGhpcyANCmFsc28g
ZG9lc24ndCB3b3JrLCB3ZSBjYW4gdGFrZSBhIGNsb3NlciBsb29rIGF0IHRoZSBjaGFuZ2Vz
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGFua3MsDQo+IFBoaWwNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------ZkgYOpaAFGmQjSMp2JXzgeCs--

--------------8S0EWQhcnNeECAgNKZjk5C46
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRH68oFAwAAAAAACgkQlh/E3EQov+Dv
7Q//RN2GOSl/mvAPWpT686IohPS4bQJD+jnQ93BrCdiaj27qgTkA0kX41zB64LkvdlHfu7/l2yPP
jKgezggHvISra+9kx+h+dM6VUHfuf+WjbNTzVZDMjF0wuM7d3CpahwloAEOguOq6mkiso0ZiW1y+
v7eAuEPPpTGaocOl3wO+LzCXdkIWCRtYQoJUHXC7S6R2CI24Kvb/cNPeRIYRhtNtqjz5D3HkAf5Z
mEK7lIOF5IAA/Hu8/4R7LI6TbfnfWJl/lSxHVSk+GYXY9hiBaa+fxbWZwtl404Qb7FVRxHx/m2TY
MVx6tKup2Db2PJgG2L9V/L4RUjztKIh/3eH1hUMzs+thumNbvc3c8YolqaOa0UtBXEfHPwU/jxOh
eSMOViLMtERENoY3s8Zz53P8WMeaz26WqIchOjrjdtFn5ZbIS7dxmLNKm4oDzR2fid4KUNkXGsAI
99lGC73MZTNFMBEkxDhbAYbhXY3hA7sI1YlbUPeNSGCXZJ44cigTCQPuHBppLWCBMemWbKTaOdvN
cuW+zo0EVTMQUwdAFlQHbVE4GiS74c952bjLYrQ0sZoe+pT697i8Jl564JLKxt/6GmQPlg68BXf3
1RGUolXfL8/JeBh18xxAG5qdw1qvLR0cic6dXAYezhc0Gu+Wgog2oNA6wRsk4hLkVGLFheiolNZJ
H8Y=
=e1LY
-----END PGP SIGNATURE-----

--------------8S0EWQhcnNeECAgNKZjk5C46--

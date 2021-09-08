Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436D1403EA0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 19:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D816E223;
	Wed,  8 Sep 2021 17:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B486E223
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 17:50:45 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F498220B3;
 Wed,  8 Sep 2021 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631123443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lWoSuFDKULCQ5rcWthSgmLilmCXcf3SGKfzEQ7gY8ZQ=;
 b=teV5hRbRbrUhPytGJ0Lqv5mDPlzUG7QsN+Gh95qtd/JZr52TkTSAR8mcm2zYg1vbRwFGes
 6Rac4Q2qG2DpFnAAWNu8jM1btaVtqy8qVS9MfgrnVQJmwJdsIPWIi2UEkiBPyjVrqo+GYW
 /OVhhrplyfh2DcmcE12uLifw4oB3598=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631123443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lWoSuFDKULCQ5rcWthSgmLilmCXcf3SGKfzEQ7gY8ZQ=;
 b=Gjr78VO/h1nf4gAwjWUnZcZAYy93aoc/Tp4pi9VU5n45xI1K1OP//6jz5Sxi3mBOSh2wXg
 bzkugwZHQo92VyBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7C4D613A9F;
 Wed,  8 Sep 2021 17:50:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id JMHYHPP3OGHtXQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Sep 2021 17:50:43 +0000
Message-ID: <82bffd36-130a-48b3-69c2-20479daa35f5@suse.de>
Date: Wed, 8 Sep 2021 19:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>,
 "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
 <YQEHQ56Qwl0GzvKg@ravnborg.org>
 <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
 <YQjP1e+XrYrrsggB@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YQjP1e+XrYrrsggB@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h4Yf1wgGnYfdVujbEGFSPI8x"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h4Yf1wgGnYfdVujbEGFSPI8x
Content-Type: multipart/mixed; boundary="------------07g4arbTQh0j7boR9ex5MJcq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>,
 "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>
Message-ID: <82bffd36-130a-48b3-69c2-20479daa35f5@suse.de>
Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
 <YQEHQ56Qwl0GzvKg@ravnborg.org>
 <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
 <YQjP1e+XrYrrsggB@ravnborg.org>
In-Reply-To: <YQjP1e+XrYrrsggB@ravnborg.org>

--------------07g4arbTQh0j7boR9ex5MJcq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDguMjEgdW0gMDc6MTAgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IEFuaXRoYSwNCj4gDQo+IE9uIE1vbiwgQXVnIDAyLCAyMDIxIGF0IDA4OjQ0OjI2UE0gKzAw
MDAsIENocmlzYW50aHVzLCBBbml0aGEgd3JvdGU6DQo+PiBIaSBTYW0sDQo+PiBUaGFua3Mu
IFdoZXJlIHNob3VsZCB0aGlzIGdvLCBkcm0tbWlzYy1maXhlcyBvciBkcm0tbWlzYy1uZXh0
Pw0KPiANCj4gTG9va3MgbGlrZSBhIGRybS1taXNjLW5leHQgY2FuZGlkYXRlIHRvIG1lLg0K
PiBJIG1heSBpbXByb3ZlIHNvbWV0aGluZyBmb3IgZXhpc3RpbmcgdXNlcnMsIGJ1dCBpdCBk
b2VzIG5vdCBsb29rIGxpa2UgaXQNCj4gZml4ZXMgYW4gZXhpc3RpbmcgYnVnLg0KDQpJIGZv
dW5kIHRoaXMgcGF0Y2ggaW4gZHJtLW1pc2MtZml4ZXMsIGFsdGhvdWdoIGl0IGRvZXNuJ3Qg
bG9vayBsaWtlIGEgDQpidWdmaXguIEl0IHNob3VsZCBoYXZlIGdvbmUgaW50byBkcm0tbWlz
Yy1uZXh0LiBTZWUgWzFdLiBJZiBpdCBpbmRlZWQgDQpiZWxvbmdzIGludG8gZHJtLW1pc2Mt
Zml4ZXMsIGl0IGNlcnRhaW5seSBzaG91bGQgaGF2ZSBjb250YWluZWQgYSBGaXhlcyB0YWcu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZHJtLnBhZ2VzLmZy
ZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRlci1kcm0tbWlzYy5odG1s
I3doZXJlLWRvLWktYXBwbHktbXktcGF0Y2gNCg0KPiANCj4gCVNhbQ0KPiANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------07g4arbTQh0j7boR9ex5MJcq--

--------------h4Yf1wgGnYfdVujbEGFSPI8x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmE49/IFAwAAAAAACgkQlh/E3EQov+DA
iw//aUoyX2uydEAa/P4s2OxTdN7/4tLr5Cjwe5L/IWmKkmKl2wdyn5cHzwE3f7c+V5VHNH/xdiuk
y0h7bkyhvl7Bm1cbhT2+WIS0GMlfR7Zv5KU0qt3KDg81SpZFrDIGMOdciioznm142NDgIp5mZBxA
Gy80EG1jGAQCCIUXy2XzZeQa1WI+4I08iNJHlJCILjZDlFkY5Kh9dbwXJ3WJXAcaNXZO9/Zwctjl
Rx6UUkxvWvrXb8DcFmObCl/T20gVNbhiwtcXSWRLFqC724IKAxbWkEQxVVDVIXYK88Z+zHq7jWyi
++o6eZvEGnSFoFvfI2Wj7/Cy9H2srZiWEOZQaoU25vYhvdTCUnVk8rhfKMNYRgHmSbMTvF7eKCwL
oa5r/g1xkdKqSH6sFdI8f6d1YRT15y/JEaCUTizamU3zfMZ61RKHzbxhizBYUsY2Se1ZO9bj51Fk
iQh4awA+bRvNFf5c2WPXxxQzANEkV6o9wLS85P/zhSOgkWknNLEy448bOJSQ7QY3K39psWkZy79O
KKLglfy3sAhwSTquLPxAKrzIoYO12nnuoL5vO39nXYuf5ofB9B3JtXmbkIpMbEVWskyMPi1NmZcA
KyuQuU0bvlDfm6hPEc0LzRqy57eenEmRVI3XxmnWK6ys4efXJv0fthB4MaiXGQU6BobITIpjD3xf
X1k=
=lhRu
-----END PGP SIGNATURE-----

--------------h4Yf1wgGnYfdVujbEGFSPI8x--

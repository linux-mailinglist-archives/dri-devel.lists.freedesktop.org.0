Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7BB69CB3D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 13:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB4210E107;
	Mon, 20 Feb 2023 12:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6732310E107
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 12:43:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27D5C201EE;
 Mon, 20 Feb 2023 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676897003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JK8bSpPrj8+43nAZuNF/wzFXnug6756mX97bM+ecb2o=;
 b=QhYFM4xgQwIxFG63m048Gj21crfiS0d6x+QBp4iU+R6Xh42/CO9nzVfdascTesOpaLuMEP
 tLgKR870LUB5wYhufNUy0aFmcX9xkQTxGPdTqpHl+CyD1J9SIyvFfq7MYVXJ5kiGDK5NGp
 Bcq4/0NyTdgxLmuZC42hWS/90ADKWKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676897003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JK8bSpPrj8+43nAZuNF/wzFXnug6756mX97bM+ecb2o=;
 b=LrxA1DkkjLFw4p+ybfRFdGiZBDw14YKS7vYbbmthI5nM68aALPgRRpVgoDnK4cF62hld8q
 Z9mIH4MGodvGBkBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEC58134BA;
 Mon, 20 Feb 2023 12:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +GhxOepq82MqdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Feb 2023 12:43:22 +0000
Message-ID: <3e66b990-b5b3-bf6e-8c9a-021863360a10@suse.de>
Date: Mon, 20 Feb 2023 13:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/fb-helper: Try to protect cleanup against delayed
 setup
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230217194757.5991-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230217194757.5991-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FcAs08CLbTrd1fxhIFRF4sjA"
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
Cc: David Airlie <airlied@linux.ie>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FcAs08CLbTrd1fxhIFRF4sjA
Content-Type: multipart/mixed; boundary="------------Yu7xs05zCBmYXfLWRt35oza7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <3e66b990-b5b3-bf6e-8c9a-021863360a10@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Try to protect cleanup against delayed
 setup
References: <20230217194757.5991-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230217194757.5991-1-daniel.vetter@ffwll.ch>

--------------Yu7xs05zCBmYXfLWRt35oza7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDIuMjMgdW0gMjA6NDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBT
b21lIHZhZ3VlIGV2aWRlbmNlcyBzdWdnZXN0cyB0aGlzIGNhbiBnbyB3cm9uZy4gVHJ5IHRv
IHByZXZlbnQgaXQgYnkNCj4gaG9sZGluZyB0aGUgcmlnaHQgbXV0ZXggYW5kIGNsZWFyaW5n
IC0+ZGVmZXJyZWRfc2V0dXAgdG8gbWFrZSBzdXJlIHdlDQo+IGxhdGVyIG9uIGRvbid0IGFj
Y2lkZW50YWxseSB0cnkgdG8gcmUtcmVnaXN0ZXIgdGhlIGZiZGV2IHdoZW4gdGhlDQo+IGRy
aXZlciB0aG91Z2h0IGl0IGhhZCBpdCBhbGwgY2xlYW5lZCB1cCBhbHJlYWR5Lg0KPiANCj4g
djI6IEkgcmVhbGl6ZWQgdGhhdCB0aGlzIGlzIGZ1bmRhbWVudGFsbHkgYnV0Y2hlcmVkLCBh
bmQgQ0kgY29tcGxhaW5lZA0KPiBhYm91dCBsb2NrZGVwIHNwbGF0cy4gU28gbGltaXQgdGhl
IGNyaXRpY2FsIHNlY3Rpb24gYWdhaW4gYW5kIGp1c3QgYWRkDQo+IGEgZmV3IG5vdGVzIHdo
YXQgdGhlIHByb3BlciBmaXggaXMuDQo+IA0KPiBSZWZlcmVuY2VzOiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9saW51eC1uZXh0L25leHQtMjAyMDEyMTUvZmktYnl0LWox
OTAwL2lndEBpOTE1X3BtX3JwbUBtb2R1bGUtcmVsb2FkLmh0bWwNCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IENjOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPiBDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+DQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgICAgIHwgNiArKysrKysN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyB8IDUgKysrKysNCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYw0KPiBpbmRleCAzZTE3MjYxYTEyYjYuLjI0MTVhMmM3Y2E0NCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IEBAIC01NDUsNiArNTQ1LDkgQEAg
RVhQT1JUX1NZTUJPTChkcm1fZmJfaGVscGVyX2FsbG9jX2luZm8pOw0KPiAgICAqIEEgd3Jh
cHBlciBhcm91bmQgdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlciwgdG8gcmVsZWFzZSB0aGUgZmJf
aW5mbw0KPiAgICAqIGZyYW1lYnVmZmVyIGRldmljZS4gVGhpcyBtdXN0IGJlIGNhbGxlZCBi
ZWZvcmUgcmVsZWFzaW5nIGFsbCByZXNvdXJjZXMgZm9yDQo+ICAgICogQGZiX2hlbHBlciBi
eSBjYWxsaW5nIGRybV9mYl9oZWxwZXJfZmluaSgpLg0KPiArICoNCj4gKyAqIE5vdGUgdGhh
dCB0aGlzIGlzIGZ1bmRhbWVudGFsbHkgcmFjeSBvbiBob3R1bmxvYWQgYmVjYXVzZSBpdCBk
b2VuJ3QgaGFuZGxlDQo+ICsgKiBvcGVuIGZiZGV2IGZpbGUgZGVzY3JpcHRvcnMgYXQgYWxs
LiBVc2UgZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSBpbnN0ZWFkLg0KPiAgICAqLw0KPiAg
IHZvaWQgZHJtX2ZiX2hlbHBlcl91bnJlZ2lzdGVyX2luZm8oc3RydWN0IGRybV9mYl9oZWxw
ZXIgKmZiX2hlbHBlcikNCj4gICB7DQo+IEBAIC01NTgsNiArNTYxLDkgQEAgRVhQT1JUX1NZ
TUJPTChkcm1fZmJfaGVscGVyX3VucmVnaXN0ZXJfaW5mbyk7DQo+ICAgICogQGZiX2hlbHBl
cjogZHJpdmVyLWFsbG9jYXRlZCBmYmRldiBoZWxwZXIsIGNhbiBiZSBOVUxMDQo+ICAgICoN
Cj4gICAgKiBUaGlzIGNsZWFucyB1cCBhbGwgcmVtYWluaW5nIHJlc291cmNlcyBhc3NvY2lh
dGVkIHdpdGggQGZiX2hlbHBlci4NCj4gKyAqDQo+ICsgKiBOb3RlIHRoYXQgdGhpcyBpcyBm
dW5kYW1lbnRhbGx5IHJhY3kgb24gaG90dW5sb2FkIGJlY2F1c2UgaXQgZG9lbid0IGhhbmRs
ZQ0KPiArICogb3BlbiBmYmRldiBmaWxlIGRlc2NyaXB0b3JzIGF0IGFsbC4gVXNlIGRybV9m
YmRldl9nZW5lcmljX3NldHVwKCkgaW5zdGVhZC4NCj4gICAgKi8NCj4gICB2b2lkIGRybV9m
Yl9oZWxwZXJfZmluaShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyKQ0KPiAgIHsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4gaW5kZXggMzY1ZjgwNzE3
ZmExLi4xNjE4MTA5NTkyY2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJkZXZfZ2VuZXJpYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2Vu
ZXJpYy5jDQo+IEBAIC0zNDcsNyArMzQ3LDEyIEBAIHN0YXRpYyB2b2lkIGRybV9mYmRldl9j
bGllbnRfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCkNCj4gICB7
DQo+ICAgCXN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIgPSBkcm1fZmJfaGVscGVy
X2Zyb21fY2xpZW50KGNsaWVudCk7DQo+ICAgDQo+ICsJbXV0ZXhfbG9jaygmZmJfaGVscGVy
LT5sb2NrKTsNCj4gKwlmYl9oZWxwZXItPmRlZmVycmVkX3NldHVwID0gZmFsc2U7DQo+ICsJ
bXV0ZXhfdW5sb2NrKCZmYl9oZWxwZXItPmxvY2spOw0KDQpUaGUgdW5yZWdpc3RlciBjb2Rl
IHJ1bnMgYXMgcGFydCBvZiB0aGUgY2xpZW50IGNsZWFudXAuICBBbmQgdGhlIGNsaWVudCAN
CmFsc28gZ29lcyB0aHJvdWdoIGEgbnVtYmVyIG9mIGhlbHBlcnMgdGhhdCBoYW5kbGUgZGlz
cGxheSBob3RwbHVnIGFuZC9vciANCnJlc3RvcmUsIHdoaWNoIGFyZSBhZmZlY3RlZCBieSAt
PmRlZmVycmVkX3NldHVwLiAgQnV0IGl0J3MgYWxsIG11dHVhbGx5IA0KZXhjbHVzaXZlLiBB
RkFJQ1Qgbm90aGluZyBydW5zIHBhcmFsbGVsIHRvIHRoZSB1bnJlZ2lzdGVyIGNvZGUuICBT
ZWUgdGhlIA0KdXNlIG9mIGRldi0+Y2xpZW50bGlzdF9tdXRleCBpbiBkcm1fY2xpZW50LmMu
ICBUaGUgcGF0Y2ggaXMgbm90IA0KbmVjZXNzYXJ5IElNSE8uDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gKw0KPiAgIAlpZiAoZmJfaGVscGVyLT5pbmZvKSB7DQo+ICsJCS8qIGRy
bV9mYmRldl9mYl9kZXN0cm95KCkgdGFrZXMgY2FyZSBvZiBjbGVhbnVwICovDQo+ICAgCQlk
cm1fZmJfaGVscGVyX3VucmVnaXN0ZXJfaW5mbyhmYl9oZWxwZXIpOw0KPiAgIAl9IGVsc2Ug
ew0KPiAgIAkJZHJtX2NsaWVudF9yZWxlYXNlKCZmYl9oZWxwZXItPmNsaWVudCk7DQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Yu7xs05zCBmYXfLWRt35oza7--

--------------FcAs08CLbTrd1fxhIFRF4sjA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPzauoFAwAAAAAACgkQlh/E3EQov+Bx
CBAAx0WPoMGlh10H4jxUzuy7yJzNmV1BgLtx9/DuqRhnX1f/3IjPqTfz2eLnnU5z+WEbX/JkDu8z
HmLV/1oO6/fP7+DNqOjJ2x5yiARRWsznV2X6UmaWk13CqKUmwcuZQUq8CZHLd93j4dxFwr5+tZnB
redAeAbMPAHHdExtOGDQbULOno9LK9Ll7x3RKgUZVOsa61DnJUToWdSWReFBJvUQrheZr9Xe0VmK
BDx6E1tx4ivBq4i0rVjefvZGoMjp51Wqe8x/S5LaifzXZXHbJkGwV8lSAr+WMhhX2AeWeoRnF2Im
myO80MSq5kgbRNofaaD3R0RyjB5wdhw17/Y979xdTrPJrfnIYvA3HED8UcXc5rBkYwEBwbg30Y2v
jGVRGvk+yxFMaxyMWa7dzl11WgJ+VgEhYtcPAXHYang8dxNAA8Ae8RX4BDwmSlVBdYSJDK3z1tYJ
thN/6SBSrmOmy3ltAhKWXgIzg0S13vZIC2Eq0Pt4qEZK10xK8xRMfE/chrLKY/KPDmwnCQ6NDX87
ZrNonIJew1J5g7VKaDLlJRvn+52xbwELQzN7W0r/J8BHtbKo63DzuRXr+wBBsvWY6k517gPlAk5e
81rXwfVlMmplUe4yNDCDTHVdx6neenDDyrdEzYV8IQOmwGOt2eQfBKLNXiYLvABgY0Ywwl+Y8f8F
P+w=
=nVyO
-----END PGP SIGNATURE-----

--------------FcAs08CLbTrd1fxhIFRF4sjA--

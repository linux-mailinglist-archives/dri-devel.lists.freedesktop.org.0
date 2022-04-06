Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4265F4F5BBF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506C810E23A;
	Wed,  6 Apr 2022 10:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5C110E23A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:44:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0A231F7AD;
 Wed,  6 Apr 2022 10:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649241863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BtjjMVrhvkSWvSMCc5G5QsIGVB7cYRt7jmbiOytUR8Y=;
 b=Rj+wCXVb1kDOYv2HooYFGh7j0vNJb/Gsdh7aoPUxrF0pXsBc1EdtwLiZ5haq3i0i512skq
 Hm43IelmTWjklQd7Yf1joK2pLUP9QFQzQpsxgNVCpGvVk6BDXMwnEBmHNmFfH3Z5//lRL7
 PL882dYEnFeXzAbuV8yhQ8mfsHWICrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649241863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BtjjMVrhvkSWvSMCc5G5QsIGVB7cYRt7jmbiOytUR8Y=;
 b=v6REpgRwHB4pWaV0rDBPejeJzy6jGdtL4nIv6yc5LGwbh/r6C8bDnbv6I3oaDR7QL7og9M
 MxiEU3mL1/ij8ZBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC87913A8E;
 Wed,  6 Apr 2022 10:44:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Cjb+KAdvTWJpLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 10:44:23 +0000
Message-ID: <5ffa57d1-f3ad-3dfc-d7f6-f7ddd9138572@suse.de>
Date: Wed, 6 Apr 2022 12:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/7] drm/vc4: hvs: Various improvements
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20220331143744.777652-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8vDe1fiAn1iHs9OPhWokErCl"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8vDe1fiAn1iHs9OPhWokErCl
Content-Type: multipart/mixed; boundary="------------evwRb344SZf691XiMVPS2aRX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <5ffa57d1-f3ad-3dfc-d7f6-f7ddd9138572@suse.de>
Subject: Re: [PATCH v2 0/7] drm/vc4: hvs: Various improvements
References: <20220331143744.777652-1-maxime@cerno.tech>
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>

--------------evwRb344SZf691XiMVPS2aRX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lLA0KDQpmb3IgdGhlIHdob2xlIHBhdGNoc2V0DQoNCkFja2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KQW0gMzEuMDMuMjIgdW0gMTY6Mzcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0K
PiBIaSwNCj4gDQo+IFRoZXNlIHBhdGNoZXMgdXNlZCB0byBiZSBwYXJ0IG9mIHRoZSBzZXJp
ZXM6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDIyMTEzNDE1NS4xMjU0
NDctMS1tYXhpbWVAY2Vybm8udGVjaC8NCj4gDQo+IGJ1dCBzaW5jZSB0aGUgbWFpbiBwYXRj
aCBnb3Qgc3VwZXJzZWRlZCBieSBhbm90aGVyIGNvcmUgcGF0Y2gsIEkndmUgc3BsaXQgdGhl
DQo+IGNsZWFudXAgcGF0Y2hlcyBvdXQgaW50byB0aGVpciBvd24gc2VyaWVzLg0KPiANCj4g
TGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmssDQo+IE1heGltZQ0KPiANCj4gQ2hhbmdlcyBm
cm9tIHYxOg0KPiAgICAtIFVzZWQgRFJNX1BMQU5FX0NPTU1JVF9BQ1RJVkVfT05MWSB0byBz
a2lwIGF0b21pY19mbHVzaA0KPiANCj4gTWF4aW1lIFJpcGFyZCAoNyk6DQo+ICAgIGRybS92
YzQ6IGttczogVGFrZSBvbGQgc3RhdGUgY29yZSBjbG9jayByYXRlIGludG8gYWNjb3VudA0K
PiAgICBkcm0vdmM0OiBodnM6IEZpeCBmcmFtZSBjb3VudCByZWdpc3RlciByZWFkb3V0DQo+
ICAgIGRybS92YzQ6IGh2czogU3RvcmUgY2hhbm5lbCBpbiB2YXJpYWJsZQ0KPiAgICBkcm0v
dmM0OiBodnM6IFJlbW92ZSBkbGlzdCBzZXR1cCBkdXBsaWNhdGlvbg0KPiAgICBkcm0vdmM0
OiBodnM6IE1vdmUgdGhlIGRsaXN0IHNldHVwIHRvIGl0cyBvd24gZnVuY3Rpb24NCj4gICAg
ZHJtL3ZjNDoga21zOiBJZ25vcmUgYXRvbWljX2ZsdXNoIGlmIHdlJ3JlIGRpc2FibGVkDQo+
ICAgIGRybS92YzQ6IGh2czogVXNlIHBvaW50ZXIgdG8gSFZTIGluIEhWU19SRUFEIGFuZCBI
VlNfV1JJVEUgbWFjcm9zDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2NydGMu
YyB8ICAxNCArKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmggIHwgIDE1
ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9odnMuYyAgfCAxMjcgKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfa21zLmMgIHwgIDEzICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9yZWdz
LmggfCAgMTIgKysrLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTE1IGluc2VydGlvbnMoKyks
IDY2IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------evwRb344SZf691XiMVPS2aRX--

--------------8vDe1fiAn1iHs9OPhWokErCl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJNbwcFAwAAAAAACgkQlh/E3EQov+Ah
Gg/9HjXstwZ+TUY3+NPHqbKyBrJPvURaLUGwJm6HHGKatAAYp7Kf7WUlkiucQ3dBjqaI8J22MZsK
B/WBmwfXvWd9D2DhaSJzijcBM0CsHkicycTAyNqTO2jAgSHngo2LcuAxDnp0CKYJ9LIrdRFZUXQ/
lHYtz15h03eQbCFRyd459yPbDKmcMDCaKBaq/uwWAwN85J8CHJecLstT8uw5hPxni3jcxSIzW56z
LQXxFSD1IqAvFmSWr2/Ltc0oCEGyc4L4sdJW6plPtVHwianYCbq9BOoHKK+xt3g8jVHjWarfyNJM
+z8VoMGmD0VofREODy/x2hg/uN3JgFpOcM4j2GOlFpEsQuK7XVbUp8Mxd++pD4XKrOaRLnk2lmLK
Evqoz5L7ta4NPqVE3duxXSGqEE8BvvNjxukSa8FISGb6MeBQ8vLBmRP9zQPtTn3AnQZKw+GXZexI
QiNYF3HBAY/SwlzbiIIUI885kOJxdMdSipeRrJBElTVSI4R/OatdlbeeI5UcaWE+d2jrNG8dJrYL
AOdfBfZEXqAkSuhGoaNkVvEvfYhg9DACbTlDncIi57p+s+feDtV0PLoEmeKZYvfD//xVxkhj4NKh
i7QATNqJMP9dZsr2xOkWmZ9DuKDpkweOjfigj2l2G/YkeIq0ceMD3UbijEOaO4AncodyOsqafKFX
TcA=
=Xw6N
-----END PGP SIGNATURE-----

--------------8vDe1fiAn1iHs9OPhWokErCl--

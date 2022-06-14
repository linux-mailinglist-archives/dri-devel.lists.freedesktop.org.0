Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60C54AA0D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1BE10E835;
	Tue, 14 Jun 2022 07:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3F10E835
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:08:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7DAB61F383;
 Tue, 14 Jun 2022 07:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655190522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CsU3F1FV0VK5yNn5xxw+vgNY6PidYLtiVeQQK0Ca7R0=;
 b=pOMaj+Kw5A51nP5+FiPtqTyIWXOa/mAwgtCYBFTM1piG3/gZwhEBVsmULNVJ57IxRuvLTy
 nhwY8/aWWDWrhOQbwIGIm9Pzqehufjt2BBwAXz31OfPRIYL3e5k8advGzedsbYHkqngie4
 NJw0TwES3G553lcJSPrp5XfWQOdanpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655190522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CsU3F1FV0VK5yNn5xxw+vgNY6PidYLtiVeQQK0Ca7R0=;
 b=0J8LYTLJnQm4epZv9zFdjTfj6SjCvVpI61QbWAi9fVixEqEIuaogdgf5fTkbqC8mm4XJCW
 rgEw27LKFGZqiFBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48863139EC;
 Tue, 14 Jun 2022 07:08:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gyuiEPozqGIFeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jun 2022 07:08:42 +0000
Message-ID: <6b5172b5-ad81-36f9-9288-fd1db2fe0e17@suse.de>
Date: Tue, 14 Jun 2022 09:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/3] KUnit tests for drm_format_helper
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220613171738.111013-1-jose.exposito89@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2tAANik0McvXpimbejM7IiTc"
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com, airlied@linux.ie,
 dlatypov@google.com, linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2tAANik0McvXpimbejM7IiTc
Content-Type: multipart/mixed; boundary="------------779Lw54ur8NxClLw2PlvBHfC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
Cc: davidgow@google.com, dlatypov@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Message-ID: <6b5172b5-ad81-36f9-9288-fd1db2fe0e17@suse.de>
Subject: Re: [PATCH v3 0/3] KUnit tests for drm_format_helper
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
In-Reply-To: <20220613171738.111013-1-jose.exposito89@gmail.com>

--------------779Lw54ur8NxClLw2PlvBHfC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9zZSwNCg0KZm9yIHRoZSB3aG9sZSBwYXRjaHNldDoNCg0KQWNrZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpPbmUgc21hbGwgZGV0YWls
IG9uIGxpY2Vuc2luZzogZHJtX2Zvcm1hdF9oZWxwZXIuYyBpcyBsaWNlbnNlZCB1bmRlciAN
CkdQTDIgb3IgTUlULiBNYXliZSBjb25zaWRlciBhZGRpbmcgJ29yIE1JVCcgdG8gZHJtX2Zv
cm1hdF9oZWxwZXJfdGVzdC5jIA0KYXMgd2VsbC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KQW0gMTMuMDYuMjIgdW0gMTk6MTcgc2NocmllYiBKb3PDqSBFeHDDs3NpdG86DQo+IEhl
bGxvIGV2ZXJ5b25lLA0KPiANCj4gSGVyZSBpcyB0aGUgdjMgb2YgdGhlIHNlcmllcywgaW5j
bHVkaW5nIHRoZSBkb2N1bWVudGF0aW9uLCBwcmV2aW91c2x5DQo+IHNlbnQgYXMgYSBzdGFu
ZGFsb25lIHBhdGNoIFsxXSwgYW5kIGNoYW5nZXMgc3VnZ2VzdGVkIGR1cmluZyByZXZpZXcu
DQo+IA0KPiBUaGFua3MgYSBsb3QsDQo+IEpvc8OpIEV4cMOzc2l0bw0KPiANCj4gUkZDIC0+
IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMjA1MzAxMDIwMTcu
NDcxODY1LTEtam9zZS5leHBvc2l0bzg5QGdtYWlsLmNvbS9ULw0KPiANCj4gICAtIEFkZCAu
a3VuaXRjb25maWcgKE1heGltZSBSaXBhcmQpDQo+ICAgLSBGaXggbWVtb3J5IGxlYWsgKERh
bmllbCBMYXR5cG92KQ0KPiAgIC0gTWFrZSBjb25maWcgb3B0aW9uIGdlbmVyaWMgKEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyk6DQo+ICAgICBEUk1fRk9STUFSX0hFTFBFUl9URVNUIC0+
IERSTV9LVU5JVF9URVNUDQo+ICAgLSBSZW1vdmUgRElTQUJMRV9TVFJVQ1RMRUFLX1BMVUdJ
TiAoRGFuaWVsIExhdHlwb3YpDQo+IA0KPiB2MSAtPiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvZHJpLWRldmVsLzIwMjIwNjA2MDk1NTE2LjkzODkzNC0xLWpvc2UuZXhwb3NpdG84
OUBnbWFpbC5jb20vVC8NCj4gDQo+ICAgVGhvbWFzIFppbW1lcm1hbm46DQo+ICAgLSBBZGQg
RFJNX1JFQ1RfSU5JVCgpIG1hY3JvDQo+ICAgLSBNb3ZlIHRlc3RzIHRvIGRyaXZlcnMvZ3B1
L2RybS9rdW5pdA0KPiAgIC0gSW1wcm92ZSB0ZXN0IGRvY3VtZW50YXRpb24NCj4gDQo+IHYy
IC0+IHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMjA2MTIxNjEy
NDguMjcxNTkwLTEtam9zZS5leHBvc2l0bzg5QGdtYWlsLmNvbS9ULw0KPiANCj4gICAtIFVz
ZSBkZXNpZ25hdGVkIGluaXRpYWxpemVyIGluIERSTV9SRUNUX0lOSVQgKEphbmkgTmlrdWxh
KQ0KPiAgIC0gU2ltcGxpZnkgdGhlICJjb252ZXJzaW9uX2J1Zl9zaXplIiBoZWxwZXINCj4g
DQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMjA2MDYxODA5
NDAuNDMzNzEtMS1qb3NlLmV4cG9zaXRvODlAZ21haWwuY29tL1QvDQo+IA0KPiBKb3PDqSBF
eHDDs3NpdG8gKDMpOg0KPiAgICBkcm0vcmVjdDogQWRkIERSTV9SRUNUX0lOSVQoKSBtYWNy
bw0KPiAgICBkcm0vZm9ybWF0LWhlbHBlcjogQWRkIEtVbml0IHRlc3RzIGZvciBkcm1fZmJf
eHJnYjg4ODhfdG9fcmdiMzMyKCkNCj4gICAgZHJtL2RvYzogQWRkIEtVbml0IGRvY3VtZW50
YXRpb24NCj4gDQo+ICAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWludGVybmFscy5yc3QgICAg
ICAgICAgIHwgIDMyICsrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTYgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9rdW5p
dC8ua3VuaXRjb25maWcgICAgICAgICAgICB8ICAgMyArDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2t1bml0L01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAzICsNCj4gICAuLi4vZ3B1L2Ry
bS9rdW5pdC9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMgICAgfCAxNjAgKysrKysrKysrKysr
KysrKysrDQo+ICAgaW5jbHVkZS9kcm0vZHJtX3JlY3QuaCAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDE2ICsrDQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAyMzEgaW5zZXJ0aW9ucygrKQ0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0va3VuaXQvLmt1bml0Y29u
ZmlnDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9rdW5pdC9NYWtl
ZmlsZQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0va3VuaXQvZHJt
X2Zvcm1hdF9oZWxwZXJfdGVzdC5jDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------779Lw54ur8NxClLw2PlvBHfC--

--------------2tAANik0McvXpimbejM7IiTc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKoM/kFAwAAAAAACgkQlh/E3EQov+De
nA/+I5D0b3wcrfcCumVecCs+PyKrEjHypaGBWAsUqtYfkD7wqBrPF+CRd2lbc/8hW+OUiypBDMYF
3melrKUQYvRO2GXc4zbNhbBblJDkuJIoSDtyOhqd8l1HO2W6RmaZXHczsacYxJAaoTjYk+ucUflD
IMdXaiiSSmkWjhpxl5xt9zwvcDLNZmaBhYDYcoDpsRjgb+tUDb096KbhLvvJ1texF3VNFWW3iJFI
jzOlBea1kYXpCRCuH3IE/MR1JSIqgLzXpvavGZYlsFvvXSCxCPkUUZV7mvJcJX/Ed6VKpPNzENFh
4xU+yzlxi2FjVSQ/pUyH7iODyCEzeAs2VWtiou0hfyHaEjC+iAq91b0avls3Y5sV4e5RG5Kfg/sk
N5arCYe4FZFWqazpH8Aq+nF81/5hcbFDGkV7Bn2qhLAyO2RNMGCEjUjcgYBWycmek6xXgOGmVh6b
JlHExM13/zxIzIZTsa/4/7wOwCcuxNm+cjvAF8ahz+bPRYBHTxAfsYmjmt2dVIS0jvrQdz/485WW
JzPtiDFMyh6ErJusvXWQ/w4YSTE4Qq7d32ellRjTLh0qQeJWauMDF6JZccJ4NH7trpUNcoTH+0uW
St48KEaMbob1u7uruBjJAp9oGhC+S6QqRephsrrajSlQM2FPhznGBxYGReOfL23CH60X5k0JpYWh
mL4=
=TR4G
-----END PGP SIGNATURE-----

--------------2tAANik0McvXpimbejM7IiTc--

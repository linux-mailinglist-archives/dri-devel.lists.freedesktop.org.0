Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43566D869
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 09:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0D910E51C;
	Tue, 17 Jan 2023 08:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9626E10E519;
 Tue, 17 Jan 2023 08:41:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 389096834E;
 Tue, 17 Jan 2023 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673944896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rg3+qKkwwxy1PyfGEgfsERCs9EspIVLV9IOlw7clUwc=;
 b=cX3lTal0KQAYsRZMF9DQ+eMErCnOWxeo2gynfs10W9/H4iCoCFR7zgCqFJTZOizWm7VIwZ
 ZmJGrcUQrPfE5w0M02dM9jLLMXFfoDYA1bxvPWPl7M/maov6xVTeh3O/OhNtv1rYSuvA64
 t17ZNy0xFk3BW6nhAVMJ56ZYPKI6YXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673944896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rg3+qKkwwxy1PyfGEgfsERCs9EspIVLV9IOlw7clUwc=;
 b=AxodzgBL94uIf+5wnZzzRB6mLCh0ReLOrIGCeXPVUVxG1UZhYLe+jPXJejK3aaDbhkNwc0
 jGCKSb7cEzvvV/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E85351390C;
 Tue, 17 Jan 2023 08:41:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NOR0Nz9fxmNJXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jan 2023 08:41:35 +0000
Message-ID: <40c778d6-1348-2c6c-2e37-c3602cc66b7b@suse.de>
Date: Tue, 17 Jan 2023 09:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <87k01me9jn.fsf@intel.com>
 <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HZoXM0yd7tEI0Xb9vAUNJ06z"
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HZoXM0yd7tEI0Xb9vAUNJ06z
Content-Type: multipart/mixed; boundary="------------M0Q2evvYu05hQ9r0mpgHSfn3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-aspeed@lists.ozlabs.org, sam@ravnborg.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-ID: <40c778d6-1348-2c6c-2e37-c3602cc66b7b@suse.de>
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <87k01me9jn.fsf@intel.com>
 <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>
In-Reply-To: <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>

--------------M0Q2evvYu05hQ9r0mpgHSfn3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDEuMjMgdW0gMTk6Mzcgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9u
IE1vbiwgSmFuIDE2LCAyMDIzIGF0IDExOjIwIEFNIEphbmkgTmlrdWxhDQo+IDxqYW5pLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIE1vbiwgMTYgSmFuIDIw
MjMsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+
PiBBIGxvdCBvZiBzb3VyY2UgZmlsZXMgaW5jbHVkZSBkcm1fY3J0Y19oZWxwZXIuaCBmb3Ig
aXRzIGNvbnRhaW5lZA0KPj4+IGluY2x1ZGUgc3RhdGVtZW50cy4gVGhpcyBsZWFkcyB0byBl
eGNlc3NpdmUgY29tcGlsZS10aW1lIGRlcGVuZGVuY2llcy4NCj4+Pg0KPj4+IFdoZXJlIHBv
c3NpYmxlLCByZW1vdmUgdGhlIGluY2x1ZGUgc3RhdGVtZW50cyBmb3IgZHJtX2NydGNfaGVs
cGVyLmgNCj4+PiBhbmQgaW5jbHVkZSB0aGUgcmVxdWlyZWQgc291cmNlIGZpbGVzIGRpcmVj
dGx5LiBBbHNvIHJlbW92ZSB0aGUNCj4+PiBpbmNsdWRlIHN0YXRlbWVudHMgZnJvbSBkcm1f
Y3J0Y19oZWxwZXIuaCBpdHNlbGYsIHdoaWNoIGRvZXNuJ3QgbmVlZA0KPj4+IG1vc3Qgb2Yg
dGhlbS4NCj4+Pg0KPj4+IEkgYnVpbHQgdGhpcyBwYXRjaHNldCBvbiB4ODYtNjQsIGFhcmNo
NjQgYW5kIGFybS4gSG9wZWZ1bGx5IEkgZm91bmQNCj4+PiBhbGwgaW5jbHVkZSBkZXBlbmRl
bmNpZXMuDQo+Pg0KPj4gSSB0aGluayB0aGlzIGlzIHRoZSByaWdodCBkaXJlY3Rpb24gYW5k
IEkgc3VwcG9ydCB0aGlzLiBQZXJzb25hbGx5IEkNCj4+IHRoaW5rIGl0J3MgZW5vdWdoIHRv
IGJ1aWxkIHRlc3QgYW5kIGZpeCBhbnkgZmFsbG91dCBhZnRlcndhcmRzLg0KPj4NCj4+IFRv
IHRoYXQgZW5kLCBJIGRpZCBidWlsZCB0ZXN0IHRoaXMgbXlzZWxmIHdpdGggbXkgY29uZmln
LCBhbmQgaXQgd2FzDQo+PiBmaW5lLCB0aG91Z2ggdGhhdCBwcm9iYWJseSBkb2Vzbid0IGFk
ZCBtdWNoIGNvdmVyYWdlLg0KPj4NCj4+IEZXSVcsDQo+Pg0KPj4gQWNrZWQtYnk6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IA0KPiBBZ3JlZWQuICBJIGFwcGxp
ZWQgMS8yMiBzaW5jZSBpdCB3YXMgYW4gdW5yZWxhdGVkIGNsZWFudXAsIGJ1dCB0aGUNCj4g
cmVzdCBvZiB0aGUgc2VyaWVzIGlzOg0KPiBBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQpUaGFua3MgdG8gYm90aCBvZiB5b3UuIEknbGwg
bGVhdmUgb3V0IHRoZSBmaXJzdCBwYXRjaCB3aGVuIG1lcmdpbmcgdGhlIA0Kc2VyaWVzLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4NCj4+DQo+PiAtLQ0KPj4gSmFuaSBO
aWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcg0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------M0Q2evvYu05hQ9r0mpgHSfn3--

--------------HZoXM0yd7tEI0Xb9vAUNJ06z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPGXz8FAwAAAAAACgkQlh/E3EQov+CD
Jw/+MTb+BPZzh8/QUyb31NxfXoxbq8jtzMJYljSz0DCcnbcyJi/VodlwaLvUrUMdrGCbwnbEQi3/
tbnWP/LyqMUoi/wipxPzIS3kdeJka/6y5ytVh1xIXqGiGr4vrTPGfUvsl/5WKBvUDeLEhXRCjww6
255YDfk6ypXLcbYIZMBw6JacQG6AjrFY0Nkd0GJjryMNRYigv+T06RauL4BdPshf7YWSz3FLU5QB
UiueCCbkoGZZItQp0F6NwuNTOaIYcGaih1ZjYoM5sdF7PRWuUj2lgm5CKrYOL5USSWnMtrG+gV4c
vrJXvdT4VlEcAIqhMcB+XprmbpjUEIkEwMpWgZncSFwJqYSPc3e9WNqVG8L3Yc2o0RXavaR+jgV4
8TfMO42iMGxzIRRewW7nd4EswNn+4FQycCRIjBxsMR/yVSL29x6HMBDEm2FjpMX5NKMpRBwvrCcJ
uH7yzcltwZDKq0UFEjNr4jNUedc1KU5My/OqSp4Vo8MTMXM3MwFQlQ+w4TjaHQOB/TxO2jb2bytv
h7q4OPXnwAEJd3FRKgdgshzpM4oj7K6xuhgyeBZRjM0Js7QOSmXrWIB2W2oLBkOgnxlfTmvrvk/A
3yb/toR+az7Zvh7nxy+dNvjbc+ivcWFEXirk0i4+3Sxx+VcvwdmF9WlOH7tEfG/EY15VzrC56LpJ
X3E=
=5Kpg
-----END PGP SIGNATURE-----

--------------HZoXM0yd7tEI0Xb9vAUNJ06z--

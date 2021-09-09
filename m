Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FE405C55
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 19:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677C26E8D7;
	Thu,  9 Sep 2021 17:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4413F6E8D7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 17:47:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 93113223A2;
 Thu,  9 Sep 2021 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631209618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CPxlEc+ISc2xmd2mi1OLcRKWH7kQd4f1OJgFfYTAjOc=;
 b=FF567ow14jEsB9ypdXIHrM2GtaLnWtdesx4nJMdYaygOM3fxUcWVPsUpY5EIYywInexlJG
 N85ngmySsmi4nbOOQeNOzHa0tMmAk4vafiEqHAGKc9JZ3XA4XI4Hyr56tX7uqnR61qzIJR
 dQrxtLXtzFoyEYQnZQckhBlgd8g9ujM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631209618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CPxlEc+ISc2xmd2mi1OLcRKWH7kQd4f1OJgFfYTAjOc=;
 b=GGubFbS9xsYJGYDgBAgUpPbL6zOXu+an9eGjGCLCbV7N7xGirhePXciZgxIvk7s77E/KfH
 xs23Y98cRodpnTBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 746DF13CC8;
 Thu,  9 Sep 2021 17:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DghUG5JIOmHIEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Sep 2021 17:46:58 +0000
Message-ID: <8dad829b-d603-d2ea-2ea9-2dd248b7f561@suse.de>
Date: Thu, 9 Sep 2021 19:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
Cc: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>, David Airlie <airlied@redhat.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
 <YQEHQ56Qwl0GzvKg@ravnborg.org>
 <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
 <YQjP1e+XrYrrsggB@ravnborg.org>
 <82bffd36-130a-48b3-69c2-20479daa35f5@suse.de>
 <YTkPguPS+DR/uHXP@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YTkPguPS+DR/uHXP@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------naTK992loUTV8IuJY2sCBjZr"
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
--------------naTK992loUTV8IuJY2sCBjZr
Content-Type: multipart/mixed; boundary="------------sdTGG00BY027bQAYZOYLzD5Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>, David Airlie <airlied@redhat.com>
Message-ID: <8dad829b-d603-d2ea-2ea9-2dd248b7f561@suse.de>
Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
 <YQEHQ56Qwl0GzvKg@ravnborg.org>
 <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
 <YQjP1e+XrYrrsggB@ravnborg.org>
 <82bffd36-130a-48b3-69c2-20479daa35f5@suse.de>
 <YTkPguPS+DR/uHXP@ravnborg.org>
In-Reply-To: <YTkPguPS+DR/uHXP@ravnborg.org>

--------------sdTGG00BY027bQAYZOYLzD5Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDkuMjEgdW0gMjE6MzEgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIFdlZCwgU2VwIDA4LCAyMDIxIGF0IDA3OjUwOjQyUE0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAwMy4wOC4y
MSB1bSAwNzoxMCBzY2hyaWViIFNhbSBSYXZuYm9yZzoNCj4+PiBIaSBBbml0aGEsDQo+Pj4N
Cj4+PiBPbiBNb24sIEF1ZyAwMiwgMjAyMSBhdCAwODo0NDoyNlBNICswMDAwLCBDaHJpc2Fu
dGh1cywgQW5pdGhhIHdyb3RlOg0KPj4+PiBIaSBTYW0sDQo+Pj4+IFRoYW5rcy4gV2hlcmUg
c2hvdWxkIHRoaXMgZ28sIGRybS1taXNjLWZpeGVzIG9yIGRybS1taXNjLW5leHQ/DQo+Pj4N
Cj4+PiBMb29rcyBsaWtlIGEgZHJtLW1pc2MtbmV4dCBjYW5kaWRhdGUgdG8gbWUuDQo+Pj4g
SSBtYXkgaW1wcm92ZSBzb21ldGhpbmcgZm9yIGV4aXN0aW5nIHVzZXJzLCBidXQgaXQgZG9l
cyBub3QgbG9vayBsaWtlIGl0DQo+Pj4gZml4ZXMgYW4gZXhpc3RpbmcgYnVnLg0KPj4NCj4+
IEkgZm91bmQgdGhpcyBwYXRjaCBpbiBkcm0tbWlzYy1maXhlcywgYWx0aG91Z2ggaXQgZG9l
c24ndCBsb29rIGxpa2UgYQ0KPj4gYnVnZml4LiBJdCBzaG91bGQgaGF2ZSBnb25lIGludG8g
ZHJtLW1pc2MtbmV4dC4gU2VlIFsxXS4gSWYgaXQgaW5kZWVkDQo+PiBiZWxvbmdzIGludG8g
ZHJtLW1pc2MtZml4ZXMsIGl0IGNlcnRhaW5seSBzaG91bGQgaGF2ZSBjb250YWluZWQgYSBG
aXhlcyB0YWcuDQo+IA0KPiBUaGUgcGF0Y2ggZml4ZXMgc29tZSB3YXJuaW5ncyB0aGF0IGhh
cyBiZWNvbWUgZXJyb3JzIHRoZSBsYXN0IHdlZWsuDQo+IEFuaXRoYSBwaW5nZWQgbWUgYWJv
dXQgaXQsIGJ1dCBJIGZhaWxlZCB0byBmb2xsb3d1cC4gU28gaW4gdGhlIGVuZCBpdA0KPiB3
YXMgYXBwbGllZCB0byBzaHV0IHVwIHRoZSB3YXJuaW5nID0+IGVycm9ycy4NCg0KVGhhbmtz
IGZvciByZXBseS4gSSBjYydkIERhdmUsIGFzIGhlIGludGVuZGVkIHRvIG5vdCBtZXJnZSB0
aGUgcnNwIFBSIA0KdGhpcyB3ZWVrLiBNYXliZSB0aGUgcGF0Y2ggaXMgaW1wb3J0YW50IGVu
b3VnaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gCVNhbQ0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------sdTGG00BY027bQAYZOYLzD5Y--

--------------naTK992loUTV8IuJY2sCBjZr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmE6SJEFAwAAAAAACgkQlh/E3EQov+DY
0BAAwixkpe7UN0n7yX4Pdr6WULU4C1pLyVdD/9NJ1B0Jz7funrOzm+tVB9kb7s7ZCcLg+MELCnS5
CJ0uT7PJiP6Quhn+u97l6Tzx8PaE/RXvNLEpyfx6ZbGltYTnl7FolzIPconPENtgiRHQJoGKZlz+
Jl3jO3Wk9PxgOF3cScmI82fOJwqd9ha2Uk/wHNITw10+ZNJvkYgmRII7MoEfYrH0WAFbNpaCou2l
3WbPIcWPeMj+yoZYZzuCq3UgE0VNtGJjizW9n1Mimr4ycwQK+gOU7drjsG9HjqxeIx/Hp21N4Z5n
WVXOZ+/EPFb+44jucU0ja2RszUEjK5ry1WxFjHtdNVyS2b/28LEeoaOzYa9RZjewWICzJytPWNs4
r1yA21GCHnIELlg2vvVpFUIlUWQYckbtNV6PnUdgRLk1PHRpamp7kK4ilItoo7t+Ye3zLP09LZuE
iF9UAC11/T0w8tujAtPS+mTd0RtT7+/iUNBe+PU4QLChtumOuJEOTWWNMB+gVELko/QdtEmy9zgy
9Kll0u982t3zGT/pLbj0XNhRIOaDuV8FxXXR5Q58Uo/sI7hW15cPdCZzvrSe0kvKabLnfy3OKWp9
0Nx/gwiRJPnjkiXyRgpJyUIHLKkuqeYjHnbOVDmLzLvHXCfvFWTDMjxJddfqsp4f2qe7s0GV652i
HLU=
=tKYc
-----END PGP SIGNATURE-----

--------------naTK992loUTV8IuJY2sCBjZr--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C409C72E00A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FF010E367;
	Tue, 13 Jun 2023 10:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502E310E367
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:47:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48AA72213E;
 Tue, 13 Jun 2023 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686653269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3fhYdVUr0tRLaaukczpen+StPe7TUnaAnjtsiCIZ2s=;
 b=tdqBaQl0pM7QXRNqnNkkV7fRdFCZ3I4rbdThW7TEZZdnmPFQb1oVlDr7EHK3gWtsdfD4e2
 MtKY75Qm/uLPgIZOgYTkJ2OlaQKhj4BNTdGA2Knvvgd72iKiazhq/IF1jKwgyk8PIRb7OB
 /3jSZLCvym/lzkd/r32KuLer7mbzDds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686653269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3fhYdVUr0tRLaaukczpen+StPe7TUnaAnjtsiCIZ2s=;
 b=yyjG8vmaT01YVpsvIlIprlvIsyvd8WnCZbFEY0qVJByyZzlM558Aj+/peI35jk6oYhyrgf
 s4FlWVWmtCGS1kDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0CE313483;
 Tue, 13 Jun 2023 10:47:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7M8HOlRJiGTGfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 10:47:48 +0000
Message-ID: <9a390f13-4ad3-cddc-64f7-8a1737965242@suse.de>
Date: Tue, 13 Jun 2023 12:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Content-Language: en-US
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
 <20230613103730.GA169438@aspen.lan>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230613103730.GA169438@aspen.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bih0PagUpBHQXHTR42b2H5ZP"
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 michael.j.ruhl@intel.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 stable@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bih0PagUpBHQXHTR42b2H5ZP
Content-Type: multipart/mixed; boundary="------------kN8YWHBXTOAX040efj8X6bTV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, jingoohan1@gmail.com,
 dan.carpenter@linaro.org, michael.j.ruhl@intel.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 stable@vger.kernel.org
Message-ID: <9a390f13-4ad3-cddc-64f7-8a1737965242@suse.de>
Subject: Re: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
 <20230613103730.GA169438@aspen.lan>
In-Reply-To: <20230613103730.GA169438@aspen.lan>

--------------kN8YWHBXTOAX040efj8X6bTV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDYuMjMgdW0gMTI6Mzcgc2NocmllYiBEYW5pZWwgVGhvbXBzb246DQo+
IE9uIE1vbiwgSnVuIDEyLCAyMDIzIGF0IDA0OjA3OjM5UE0gKzAyMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gU3RydWN0IGJkNjEwN19wbGF0Zm9ybV9kYXRhIHJlZmVycyB0
byBhIHBsYXRmb3JtIGRldmljZSB3aXRoaW4NCj4+IHRoZSBMaW51eCBkZXZpY2UgaGllcmFy
Y2h5LiBUaGUgdGVzdCBpbiBiZDYxMDdfYmFja2xpZ2h0X2NoZWNrX2ZiKCkNCj4+IGNvbXBh
cmVzIGl0IGFnYWluc3QgdGhlIGZiZGV2IGRldmljZSBpbiBzdHJ1Y3QgZmJfaW5mby5kZXYs
IHdoaWNoDQo+PiBpcyBkaWZmZXJlbnQuIEZpeCB0aGUgdGVzdCBieSBjb21wYXJpbmcgdG8g
c3RydWN0IGZiX2luZm8uZGV2aWNlLg0KPj4NCj4+IEZpeGVzIGEgYnVnIGluIHRoZSBiYWNr
bGlnaHQgZHJpdmVyIGFuZCBwcmVwYXJlcyBmYmRldiBmb3IgbWFraW5nDQo+PiBzdHJ1Y3Qg
ZmJfaW5mby5kZXYgb3B0aW9uYWwuDQo+Pg0KPj4gdjI6DQo+PiAJKiBtb3ZlIHJlbmFtZXMg
aW50byBzZXBhcmF0ZSBwYXRjaCAoSmF2aWVyLCBTYW0sIE1pY2hhZWwpDQo+Pg0KPj4gRml4
ZXM6IDY3YjQzZTU5MDQxNSAoImJhY2tsaWdodDogQWRkIFJPSE0gQkQ2MTA3IGJhY2tsaWdo
dCBkcml2ZXIiKQ0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+PiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+PiBDYzogTGVlIEpvbmVzIDxsZWVA
a2VybmVsLm9yZz4NCj4+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBs
aW5hcm8ub3JnPg0KPj4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPg0K
Pj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IENjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyB2My4xMisNCj4+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFy
dGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5
OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPg0KDQpUaGFu
a3MgZm9yIGdvaW5nIHRocm91Z2ggdGhlIGJhY2tsaWdodCBwYXRjaGVzLg0KDQo+IA0KPiAN
Cj4gRGFuaWVsLg0KPiANCj4gUFMgUGxlYXNlIGRvbid0IHRyZWF0IHRoaXMgYXMgYW4gQWNr
ZWQtYnksIGlmIHlvdSB3YW50IHRvIGxhbmQgdGhpcw0KPiAgICAgcGF0Y2hzZXQgdmlhIGEg
c2luZ2xlIHRyZWUgcGxlYXNlIGNvb3JkaW5hdGUgd2l0aCBMZWUgSm9uZXMhDQoNCkknZCBs
aWtlIHRvIG1lcmdlIHRoZW0gdmlhIGRybS1taXNjLW5leHQgdG9nZXRoZXIgd2l0aCB0aGUg
cmVzdCBvZiB0aGUgDQpwYXRjaHNldC4gSXQncyBub3QgRFJNLCBidXQgZmJkZXYgcGF0Y2hl
cyBvZnRlbiBnbyB0aHJvdWdoIHRoYXQgdHJlZSANCnF1aXRlIG9mdGVuLg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------kN8YWHBXTOAX040efj8X6bTV--

--------------Bih0PagUpBHQXHTR42b2H5ZP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSISVQFAwAAAAAACgkQlh/E3EQov+DI
iQ/7BKHWYUoMmnyorQ8yHtBI1XVxUNzbBJ0OGTBT4b82riNpqOq9KfyBGnmOJcEey66W74EmBU5V
L4vlnw9VTD4BVQsw/iwIArnUrpazJ+GmYABhFM6I3BR8ZUwY61HH8PX8NeMje/nG4Md9n7ugOyzt
mQerA5bh9exoD7hytk3CuDeEwpVfk+AvMOovuUwuUsKXOcK+s6oQiRfGSd4q+DrKQbD04JGy1IBf
3ZR9s0dSIuBzZFwhqr+fUcAuuhZSxq6Fpd5okO6mhDlX+G6eeKuFaeL4hg51TJQe2wPokqZjatnG
8qG9wA5+0uBdaDW620DSVpyUdAZZAKs5DLmKsM80SyBseZSXddy7Zo3958kbbl7pfcP3j3hlJiUI
fMXMUY6y9syT/DVUXRVjiYb5qX7tO4W+gi8gBSNkdC99c4JwvhWFiobs4Lru0iM4ePC3LNCnt7Ma
QZ9jbQlvu16Ke+9EIoA0bIxL0181S+19JHBftQzBAgbmXnB7pGZa9UIng8t0tGaLXMClLxmXC+lD
+ryZgyLhc76mKMxQWy2CbJyM6Aynyq0U0P5DLsMkOBGDmqpLg5nQw6VC0INkEKnzIBq0cRTFEwry
UwPWiBj1XzooWK/LiDPxdXqHFeibjHLzSCyxrdASPCFlhiw1A7SZWwYwsaP8+pS3KeM80gZPBcKq
cwE=
=cAD4
-----END PGP SIGNATURE-----

--------------Bih0PagUpBHQXHTR42b2H5ZP--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57470072E
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C447810E69B;
	Fri, 12 May 2023 11:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197CA10E690;
 Fri, 12 May 2023 11:49:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0FBE02052E;
 Fri, 12 May 2023 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683892187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/qjxxqezfgXUGLOYp7Mydq603USieptxjfTCdMGFbg=;
 b=WStwQhLslW5E911nJ2/DDFk3G6CV2n+P28CiS9TX7lQQsRQRNwDow02bjhWFuEHX66tBwD
 baiYXflLWg2+5f7IFE/n9c1qa1U6XJqvNsPsiU1Fagn1sC6yU4hNMy+VelgX09ShJDrgqG
 tddyYOph0kF+JsMSIXCPA5ho772+l/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683892187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/qjxxqezfgXUGLOYp7Mydq603USieptxjfTCdMGFbg=;
 b=/iHuBvOIw+eA51YBCI8nH/IpHebop/bVNY1oN1GIJ4GLbmctLn2WQ4FGa4YDaRYKqA1H18
 nXOGv6ZwGn5Bk9BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9A0813499;
 Fri, 12 May 2023 11:49:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wi1LLNonXmS4CwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 11:49:46 +0000
Message-ID: <4cc261d7-ddcd-e1a2-1067-7b8c44e7769d@suse.de>
Date: Fri, 12 May 2023 13:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 00/11] drm/fbdev: Remove DRM's helpers for fbdev I/O
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230512084152.31233-1-tzimmermann@suse.de>
 <20230512102954.GA1373384@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230512102954.GA1373384@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1UA0xSaoSStkZ1CeyYq2sYjp"
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1UA0xSaoSStkZ1CeyYq2sYjp
Content-Type: multipart/mixed; boundary="------------ARZi9GeO0bDDDztD0SBKwei9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <4cc261d7-ddcd-e1a2-1067-7b8c44e7769d@suse.de>
Subject: Re: [PATCH 00/11] drm/fbdev: Remove DRM's helpers for fbdev I/O
References: <20230512084152.31233-1-tzimmermann@suse.de>
 <20230512102954.GA1373384@ravnborg.org>
In-Reply-To: <20230512102954.GA1373384@ravnborg.org>

--------------ARZi9GeO0bDDDztD0SBKwei9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDEyLjA1LjIzIHVtIDEyOjI5IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAxMDo0MTo0MUFN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IERSTSBwcm92aWRlcyBhIG51
bWJlciBvZiB3cmFwcGVycyBhcm91bmQgZmJkZXYgY2ZiXygpIHN5c18oKSwgZmJfaW9fKCkN
Cj4+IGFuZCBmYl9zeXNfKCkgaGVscGVycy4gVGhlIERSTSBmdW5jdGlvbnMgZG9uJ3QgcHJv
dmlkZSBhbnkgYWRkaXRpb25hbA0KPj4gZnVuY3Rpb25hbGl0eSBmb3IgbW9zdCBEUk0gZHJp
dmVycy4gU28gcmVtb3ZlIHRoZW0gYW5kIGNhbGwgdGhlIGZiZGV2DQo+PiBJL08gaGVscGVy
cyBkaXJlY3RseS4NCj4+DQo+PiBUaGUgRFJNIGZiZGV2IEkvTyB3cmFwcGVycyB3ZXJlIG9y
aWdpbmFsbHkgYWRkZWQgYmVjYXVzZSA8bGludXgvZmIuaD4NCj4+IGRvZXMgbm90IHByb3Rl
Y3QgaXRzIGNvbnRlbnQgd2l0aCBDT05GSUdfRkIuIERSTSBmYmRldiBlbXVsYXRpb24gZGlk
DQo+PiBub3QgYnVpbGQgaWYgdGhlIHRoZSBjb25maWcgb3B0aW9uIGhhZCBiZWVuIGRpc2Fi
bGVkLiBUaGlzIGhhcyBiZWVuDQo+PiBmaXhlZC4gRm9yIGZiZGV2LWdlbmVyaWMgYW5kIGk5
MTUsIHRoZSB3cmFwcGVycyBhZGRlZCBzdXBwb3J0IGZvciBkYW1hZ2UNCj4+IGhhbmRsaW5n
LiBCdXQgdGhpcyBpcyBiZXR0ZXIgaGFuZGxlZCB3aXRoaW4gdGhlIHR3byBjYWxsZXJzLCBh
cyBlYWNoDQo+PiBpcyBzcGVjaWFsIGluIGl0cyBkYW1hZ2UgaGFuZGxpbmcuDQo+Pg0KPj4g
UGF0Y2hlcyAxIHRvIDggcmVwbGFjZSB0aGUgRFJNIHdyYXBwZXJzIGluIGEgbnVtYmVyIG9m
IGZiZGV2IGVtdWxhdGlvbnMuDQo+PiBQYXRjaCA5IGV4cG9ydHMgdHdvIGhlbHBlcnMgZm9y
IGRhbWFnZSBoYW5kbGluZy4gUGF0Y2hlcyAxMCBhbmQgMTENCj4+IHVwZGF0ZSBmYmRldi1n
ZW5lcmljIGFuZCBpOTE1IHdpdGggdGhlIGhlbHAgb2YgdGhlIGV4cG9ydGVkIGZ1bmN0aW9u
cy4NCj4+IFRoZSBwYXRjaGVzIGFsc28gcmVtb3ZlIERSTSdzIGZiZGV2IEkvTyBoZWxwZXJz
LCB3aGljaCBhcmUgbm93IHVudXNlZC4NCj4+DQo+PiBEUk0ncyBmYmRldiBoZWxwZXJzIGhh
ZCB0byBzZWxlY3QgZmJkZXYgSS9PIGhlbHBlcnMgZm9yIEkvTyBhbmQgZm9yDQo+PiBzeXN0
ZW0gbWVtb3J5LiBFYWNoIGZiZGV2IGVtdWxhdGlvbiBub3cgc2VsZWN0cyB0aGUgY29ycmVj
dCBoZWxwZXJzDQo+PiBmb3IgaXRzZWxmLiBEZXBlbmRpbmcgb24gdGhlIHNlbGVjdGVkIERS
TSBkcml2ZXJzLCBrZXJuZWwgYnVpbGRzIHdpbGwNCj4+IG5vdyBvbmx5IGNvbnRhaW4gdGhl
IG5lY2Vzc2FyeSBmYmRldiBJL08gaGVscGVycyBhbmQgbWlnaHQgYmUgc2xpZ2h0bHkNCj4+
IHNtYWxsZXIgaW4gc2l6ZS4NCj4gDQo+IE5pY2UgY2xlYW51cC4NCj4gDQo+ICBGcm9tIG9u
ZSBvZiB0aGUgcGF0Y2hlczoNCj4gDQo+PiArY29uZmlnIERSTV9BUk1BREFfRkJERVZfRU1V
TEFUSU9ODQo+PiArICAgICBib29sDQo+PiArICAgICBkZXBlbmRzIG9uIERSTV9BUk1BREEN
Cj4+ICsgICAgIHNlbGVjdCBGQl9DRkJfQ09QWUFSRUENCj4+ICsgICAgIHNlbGVjdCBGQl9D
RkJfRklMTFJFQ1QNCj4+ICsgICAgIHNlbGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+IA0KPiBU
aGlzIHNlZW1zIGxpa2UgYSBoYXJkIHRvIG1haW50YWluIHdheSB0byBzZWxlY3QgYSBmZXcg
aGVscGVyIGZ1bmN0aW9ucy4NCj4gVG9kYXkgd2UgaGF2ZSBMRF9ERUFEX0NPREVfREFUQV9F
TElNSU5BVElPTiBmb3IgdGhlIGNvbmZpZ3MgdGhhdCBjYXJlDQo+IGFib3V0IHNpemUgLSBh
bmQgdGhhdCBzaG91bGQgd29yayBoZXJlIGFzIHdlbGwuDQoNCkkgd2Fzbid0IHRvbyBoYXBw
eSBhYm91dCB0aGlzIHNvbHV0aW9uIGVpdGhlciBhcyBpdCBpcyBxdWl0ZSB2ZXJib3NlLiAN
CkJ1dCBJIGRvbid0IHdhbnQgdG8gcmVseSBvbiB0aGUgbGlua2VyIGVpdGhlci4gSXQgY2Vy
dGFpbmx5IGNhbm5vdCANCnJlbW92ZSBleHBvcnRlZCBzeW1ib2xzLg0KDQpCdXQgdGhlIHBh
dHRlcm4gaXMgdmVyeSBjb21tb24gYW1vbmcgdGhlIGZiZGV2IGRyaXZlcnMuIFdlIGNvdWxk
IA0KaW50cm9kdWNlIGNvbW1vbiBLY29uZmlnIG9wdGlvbnMgaW4gZmJkZXYgYW5kIHNlbGNl
dCB0aG9zZSBpbnN0ZWFkLiBMaWtlIA0KdGhpczoNCg0KY29uc3QgRkJfSU9fSEVMUEVSUw0K
CWJvb2wNCglkZXBlbmRzIG9uIEZCDQoJc2VsZWN0IEZCX0NGQl9DT1BZQVJFQQ0KCXNlbGVj
dCBGQl9DRkJfRklMTFJFQ1QNCglzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVA0KDQpjb25zdCBG
Ql9TWVNfSEVMUEVSUw0KCWJvb2wNCglkZXBlbmRzIG9uIEZCDQoJc2VsZWN0IEZCX1NZU19D
T1BZQVJFQQ0KCXNlbGVjdCBGQl9TWVNfRklMTFJFQ1QNCglzZWxlY3QgRkJfU1lTX0ZPUFMN
CglzZWxlY3QgRkJfU1lTX0lNQUdFQkxJVA0KDQpBcGFydCBmcm9tIERSTSwgbW9zdCBvZiB0
aGUgZmJkZXYgZHJpdmVycyBjb3VsZCB1c2UgdGhlc2UgYXMgd2VsbC4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gSSB1bmRlcnN0YW5kIHdoZXJlIHRoaXMgY29tZXMgZnJv
bSBhbmQgSSBhbSBub3QgYWdhaW5zdCB0aGUNCj4gc29sdXRpb24sIGJ1dCB3YW50ZWQgdG8g
cG9pbnQgYXQgYSBtb3JlIG1vZGVybiBhcHByb2FjaCB0byBkZWFsIHdpdGggdGhlDQo+IGJs
b2F0Lg0KPiANCj4gTWF5YmUgc29tZSBvZiB0aGUgZW1iYmVkZGVkIGZvbGtzIGNhbiB0ZWxs
IGlmIExEX0RFQURfQ09ERV9EQVRBX0VMSU1JTkFUSU9ODQo+IGNhbiBiZSB0cnVzdGVkIHll
dCBvciB0aGF0IGlzIHNvbWV0aGluZyBmb3IgdGhlIGZ1dHVyZS4NCj4gDQo+IEluIGJhcmVi
b3ggLWZmdW5jdGlvbi1zZWN0aW9uICh3aGF0IExEX0RFQURfQ09ERV9EQVRBX0VMSU1JTkFU
SU9ODQo+IGVuYWJsZXMpIGlzIHVzZWQgd2l0aCBzdWNjZXNzIC0gdGhlcmUgaXQgcmVhbGx5
IGhlbHBzIHdoZW4gZ2VuZXJhdGluZw0KPiBkaWZmZXJlbnQgYmFyZWJveCBpbWFnZXMgd2hl
cmUgc2l6ZSBtYXR0ZXJzIGEgbG90Lg0KPiANCj4gCVNhbQ0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------ARZi9GeO0bDDDztD0SBKwei9--

--------------1UA0xSaoSStkZ1CeyYq2sYjp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmReJ9oFAwAAAAAACgkQlh/E3EQov+B6
4Q/+KaQ451ugyJ5HY+cnNaNBVMAhqGymxpaGyP/3H+/H1zPX2qOqsOAcAd8phq+Darn1t3vruN6I
jnWQDimkUbkrkLS9XNNly7vuUJZBtWgcEDSqN8tzCTiWhdD891BfHm2wlQPqpACWvuzgtw+6KeRF
ub+2k6l/ImOEFMDjEpvL5FcO0e3vDFUN8f+AWlAZ9ejTUXq3ruZe4gqzW/chyBCDyiZh76q/RStP
cHmRMob6PUqyGu4FnphIkToaHAK6QN7MRH6gjFOK5lSeH/x4FMs4ZP30kNm+e2KZMNlqv3MTbZQ/
66lGvT2oY28cs4VtKE7q2gIv68Bge8FDCRnj1eQJNiWZ+H2DbGnAh40I9WQKj6mCrthH54JWFuTI
j5pYeREJ2YhSbF760xU/pIt02Bam1WN7D1HCdADZZGG2mQQoCCX0rt8ntAJhkSDgIDZxUHz3jiKj
PZXLKCK4iYFeWJC4vvLJ+8ASdolunaytfgYpaCtV0NFouvkCgjIfUomVhinpqr0NdUBC3EliN/hg
98wAPpysyNOXXazaFPEPKGhd0ney1tJyhqJ2Qat6uynOq5rOPvWK5wOieiS4DPSo8T+HbCXAOKVE
fQnTGdkW7qTnA8kpxWZYV14v9ULrtxMsCzV5HzjQfWebDaobJYsD+ImyAVZJtJMtRsVHlPld/XUG
Ml8=
=chXz
-----END PGP SIGNATURE-----

--------------1UA0xSaoSStkZ1CeyYq2sYjp--

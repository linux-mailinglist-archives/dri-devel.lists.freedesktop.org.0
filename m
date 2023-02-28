Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D806A5544
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E56910E041;
	Tue, 28 Feb 2023 09:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BED10E041
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 09:14:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C724921A4B;
 Tue, 28 Feb 2023 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677575662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L+WXaR+5eyD3SgnEUW2jbzu4G0EEJxEV/thZNIYGSNM=;
 b=Bw419Sm4w+33lRx7yoKfEdxwlbNEdrUBgIJLRE3zlPgkwj2fGC7OgtX+NOAoS/oKGXTuoj
 Le3kTf9+xfDBBCYyz05qVz8ob1+xG6I6X7tbI6Z9PpuvA/FtpBtxDNc64ocBqViVlfQylW
 wpozC0MjvwPIcii2ZY/N2z+ImjHJRm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677575662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L+WXaR+5eyD3SgnEUW2jbzu4G0EEJxEV/thZNIYGSNM=;
 b=6+ad0VPicC+f26+tj+7Hpcz6fZWR9kmW9Wbd+v9+EUnqIMuuWRi+wwKJld/6Yc07S25Crm
 h+sKmPIo3VQGFqBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C38613440;
 Tue, 28 Feb 2023 09:14:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id THNMIe7F/WM9LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 09:14:22 +0000
Message-ID: <9c8401c1-8a32-2b3a-5323-3c0f9dad0457@suse.de>
Date: Tue, 28 Feb 2023 10:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm: omapdrm: Do not use helper unininitialized in
 omap_fbdev_init()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, tomba@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
References: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w0z6qTToscvskSOlLJqX5NRQ"
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
Cc: kernel test robot <lkp@intel.com>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w0z6qTToscvskSOlLJqX5NRQ
Content-Type: multipart/mixed; boundary="------------PyeezaLySjTJbky6LHg1ebue";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nathan Chancellor <nathan@kernel.org>, tomba@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Cc: kernel test robot <lkp@intel.com>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Message-ID: <9c8401c1-8a32-2b3a-5323-3c0f9dad0457@suse.de>
Subject: Re: [PATCH] drm: omapdrm: Do not use helper unininitialized in
 omap_fbdev_init()
References: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>
In-Reply-To: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>

--------------PyeezaLySjTJbky6LHg1ebue
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QWRkZWQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4NCg0KQW0gMjQuMDIuMjMgdW0gMTg6MjUg
c2NocmllYiBOYXRoYW4gQ2hhbmNlbGxvcjoNCj4gQ2xhbmcgd2FybnMgKG9yIGVycm9ycyB3
aXRoIENPTkZJR19XRVJST1IpOg0KPiANCj4gICAgLi4vZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9mYmRldi5jOjIzNTo2OiBlcnJvcjogdmFyaWFibGUgJ2hlbHBlcicgaXMgdXNl
ZCB1bmluaXRpYWxpemVkIHdoZW5ldmVyICdpZicgY29uZGl0aW9uIGlzIHRydWUgWy1XZXJy
b3IsLVdzb21ldGltZXMtdW5pbml0aWFsaXplZF0NCj4gICAgICAgICAgICBpZiAoIWZiZGV2
KQ0KPiAgICAgICAgICAgICAgICBefn5+fn4NCj4gICAgLi4vZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9mYmRldi5jOjI1OToyNjogbm90ZTogdW5pbml0aWFsaXplZCB1c2Ugb2Nj
dXJzIGhlcmUNCj4gICAgICAgICAgICBkcm1fZmJfaGVscGVyX3VucHJlcGFyZShoZWxwZXIp
Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fg0KPiAgICAu
Li9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2LmM6MjM1OjI6IG5vdGU6IHJl
bW92ZSB0aGUgJ2lmJyBpZiBpdHMgY29uZGl0aW9uIGlzIGFsd2F5cyBmYWxzZQ0KPiAgICAg
ICAgICAgIGlmICghZmJkZXYpDQo+ICAgICAgICAgICAgXn5+fn5+fn5+fn4NCj4gICAgLi4v
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYmRldi5jOjIyODozMDogbm90ZTogaW5p
dGlhbGl6ZSB0aGUgdmFyaWFibGUgJ2hlbHBlcicgdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcN
Cj4gICAgICAgICAgICBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyOw0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA9IE5VTEwNCj4gICAgMSBlcnJvciBnZW5lcmF0ZWQu
DQo+IA0KPiBSZXR1cm4gZWFybHksIGFzIHRoZXJlIGlzIG5vdGhpbmcgZm9yIHRoZSBmdW5j
dGlvbiB0byBkbyBpZiBtZW1vcnkNCj4gY2Fubm90IGJlIGFsbG9jYXRlZC4gVGhlcmUgaXMg
bm8gcG9pbnQgaW4gYWRkaW5nIGFub3RoZXIgbGFiZWwgdG8ganVzdA0KPiBlbWl0IHRoZSB3
YXJuaW5nIGF0IHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uIGluIHRoaXMgY2FzZSwgYXMgbWVt
b3J5DQo+IGFsbG9jYXRpb24gZmFpbHVyZXMgYXJlIGFscmVhZHkgbG9nZ2VkLg0KPiANCj4g
Rml4ZXM6IDNmYjFmNjJmODBhMSAoImRybS9mYi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVs
cGVyX3VucHJlcGFyZSgpIGZyb20gZHJtX2ZiX2hlbHBlcl9maW5pKCkiKQ0KPiBMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xODA5DQo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzAyMjUw
MDU4LmZZVGU5YVRQLWxrcEBpbnRlbC5jb20vDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5j
ZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPg0KPiAtLS0NCj4gVGhpcyBpcyBjdXJyZW50bHkg
c2hvd2luZyBpbiBtYWlubGluZSBzbyBJIGJlbGlldmUgdGhpcyBzaG91bGQgZ28gdG8NCj4g
ZHJtLW1pc2MtbmV4dC1maXhlcy4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9mYmRldi5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBf
ZmJkZXYuYw0KPiBpbmRleCA4NDQyOTcyODM0N2YuLmE2Yzg1NDIwODdlYyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYmRldi5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYw0KPiBAQCAtMjMzLDcgKzIzMyw3
IEBAIHZvaWQgb21hcF9mYmRldl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAg
DQo+ICAgCWZiZGV2ID0ga3phbGxvYyhzaXplb2YoKmZiZGV2KSwgR0ZQX0tFUk5FTCk7DQo+
ICAgCWlmICghZmJkZXYpDQo+IC0JCWdvdG8gZmFpbDsNCj4gKwkJcmV0dXJuOw0KPiAgIA0K
PiAgIAlJTklUX1dPUksoJmZiZGV2LT53b3JrLCBwYW5fd29ya2VyKTsNCj4gICANCj4gDQo+
IC0tLQ0KPiBiYXNlLWNvbW1pdDogZTAzNGI4YTE4ZDRiYWRjZWVjYjY3MmM1OGI0ODhiYWQx
ZTkwMWQ5NQ0KPiBjaGFuZ2UtaWQ6IDIwMjMwMjI0LW9tYXBkcm0td3NvbWV0aW1lcy11bmlu
aXRpYWxpemVkLTAxMjVmNzY5MmZiYg0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------PyeezaLySjTJbky6LHg1ebue--

--------------w0z6qTToscvskSOlLJqX5NRQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP9xe4FAwAAAAAACgkQlh/E3EQov+D/
txAAjH/d4APMhjDTQWU+GhtyJgMQ5W8iYv4ZQNYL7O/wZKvi0GsY6gM+RVIzy0/OHGFVJI1hfQHl
yvwjFrC2Uu161wJL1bMDifbSqfh5KZsR3NkXuODxcKtG+xXelw/McIXK9viAJvjDqDgcRRi88rIa
VM0qfxCfsqW88p/EvbWQVfBljuMo7ON6v89S6q5IWb1QvvxvtGKJahUtUGc3/K7LxHgtotH7LJU6
sz8EyRwudFZC7vko+zgwezVpgVNbbm7AzUGzNjq0CT5qtKWMUku5AtkPd3a8wEarvVGOjViC6Ez7
S04sSutPWcy0J3TZ+rLRPhtCRiEr5pFc0mb5qSJasppL5/4SCzbPkTvg/06oUgSWAmRnm0A7cqt8
DXwXsh2NU+oI58qPY33IWDLrwoemJod0cO7zYIXojoXccJZrLQPHcunqkrYqaBSm2FUSksAT8o0O
M5WrEqFz7wsGvmAt0Y8OnHGBwRh+weyZz/7aFv2e8589RMwm/HnVjp9fgIrVedKLwQilGUj6MlQO
RHotcxzWPkRtPQ4AdU0kiNM7L6Jgmc2zgc+mmxbMwaiOWWNOWymavynsdhSenqSicROHk1HJl3dP
axUGVsdhYAyZDhaEwwpq+XmMYg4GnMjAF+8782rIy0T/wnq5DKjx323tCRRve+uOgAHou++uM9Xk
jqE=
=ZQmY
-----END PGP SIGNATURE-----

--------------w0z6qTToscvskSOlLJqX5NRQ--

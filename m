Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ADB702867
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 11:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533A10E178;
	Mon, 15 May 2023 09:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A310E178
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:26:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54F3121D27;
 Mon, 15 May 2023 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684142800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUxYYoXO6aEsBUHTHLoERG9b7wWxb4y9COLcbOp/5Ks=;
 b=ReOUQ66vrM8aVnN/PNx6FHLKg29NKVh0b7Y92P5dJOm27Cqx672/p61QXTz6wy8iazSEwx
 t9Wy9EMiFankJFtokCEDb0KToTgZTRv6soukKMu/UAQjwROONEJEtPe1EXE+sxn+L8a3jT
 MkXFtqNQxgrmtj7G+/vTPvoo4n3EqLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684142800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUxYYoXO6aEsBUHTHLoERG9b7wWxb4y9COLcbOp/5Ks=;
 b=vqbndfO52m+tqyF/gG6m+pG5PXfji3O/Ud/CmsOQabEDSD0hWZwA3v1yNNq5vuaK58EVJO
 bYDVRPz0MgV1DZCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF2F513466;
 Mon, 15 May 2023 09:26:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AoZmNc/6YWR4SAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 May 2023 09:26:39 +0000
Message-ID: <61a08812-c452-b146-bb24-71aeaea26e33@suse.de>
Date: Mon, 15 May 2023 11:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
 <27ba33a6-2949-a303-14b0-9985b4514e3b@suse.de>
 <CACRpkdbSAc174ejXT9V+kZfRQeiq48J1=kDQvoLvH_tF+qXKtA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CACRpkdbSAc174ejXT9V+kZfRQeiq48J1=kDQvoLvH_tF+qXKtA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SaSDJpgtexyvDuTJULeTxuxU"
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SaSDJpgtexyvDuTJULeTxuxU
Content-Type: multipart/mixed; boundary="------------6IwX2cCEsWXWQlDWyfFWeUzX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: mairacanal@riseup.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, jose.exposito89@gmail.com
Message-ID: <61a08812-c452-b146-bb24-71aeaea26e33@suse.de>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
 <27ba33a6-2949-a303-14b0-9985b4514e3b@suse.de>
 <CACRpkdbSAc174ejXT9V+kZfRQeiq48J1=kDQvoLvH_tF+qXKtA@mail.gmail.com>
In-Reply-To: <CACRpkdbSAc174ejXT9V+kZfRQeiq48J1=kDQvoLvH_tF+qXKtA@mail.gmail.com>

--------------6IwX2cCEsWXWQlDWyfFWeUzX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDUuMjMgdW0gMTA6NTkgc2NocmllYiBMaW51cyBXYWxsZWlqOg0KPiBP
biBNb24sIE1heSAxNSwgMjAyMyBhdCAxMDoxN+KAr0FNIFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IEFtIDE1LjA1LjIzIHVtIDEwOjAxIHNj
aHJpZWIgTGludXMgV2FsbGVpajoNCj4gDQo+Pj4gQnV0IHRoZSBkaXNwbGF5IGlzIGZsaWNr
ZXJpbmcgbGlrZSBjcmF6eSBzbyB0aGUgdXBkYXRpbmcgZnJlcXVlbmN5IGlzDQo+Pj4gdG90
YWxseSBvZmYsIHdoaWNoIGlzIGJlY2F1c2UgaXQgZG9lcyBub3Qgc2NhbGUgZG93biB0aGUg
cmVzb2x1dGlvbiwNCj4+PiB0aGUgcHJpbnQgdXNlZCB0byBiZToNCj4+Pg0KPj4+IENvbnNv
bGU6IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVyIGRldmljZSA4MHgzMA0KPj4+
IGRybS1jbGNkLXBsMTExIGMxMDAwMDAwLmRpc3BsYXk6IFtkcm1dIGZiMDogcGwxMTFkcm1m
YiBmcmFtZSBidWZmZXIgZGV2aWNlDQo+Pj4NCj4+PiBJdCBpcyBub3c6DQo+Pj4NCj4+PiBD
b25zb2xlOiBzd2l0Y2hpbmcgdG8gY29sb3VyIGZyYW1lIGJ1ZmZlciBkZXZpY2UgMTAweDM3
DQo+Pj4gZHJtLWNsY2QtcGwxMTEgYzEwMDAwMDAuZGlzcGxheTogW2RybV0gZmIwOiBwbDEx
MWRybWZiIGZyYW1lIGJ1ZmZlciBkZXZpY2UNCj4+Pg0KPj4+IDEwMHgzNyEgKGkuZS4gODAw
eDI5NiksIHRoaXMgZGlzcGxheSBjYW4gb25seSBkbyA2NDB4MjQwLg0KPj4+IEFueSBpZGVh
IHdoYXQgZWxzZSBpcyBnb2luZyB3cm9uZyBoZXJlPyBPciBpcyB0aGlzIGFub3RoZXIgcmVn
cmVzc2lvbg0KPj4+IG9uIHRvcCBvZiB0aGUgZmlyc3QgcmVncmVzc2lvbiAuLi4gSSB3YXMg
dW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdA0KPj4+IHlvdXIgY2hhbmdlIHdhcyBvbmx5IGFi
b3V0IGZvcm1hdHMgbm90IHJlc29sdXRpb25zLg0KPj4NCj4+IElmIHlvdXIgZGlzcGxheSBv
bmx5IHN1cHBvcnRzIDY0MHgyNDAsIHlvdSBzaG91bGQgZmlsdGVyIG91dCBhbGwgdGhlDQo+
PiBvdGhlciBtb2RlcyBpbiB0aGUgZHJpdmVyLCBpZiBuZWNlc3NhcnkuIFRvIG1lLCB0aGF0
IHNlZW1zIGZpeC13b3J0aHkgaW4NCj4+IGFueSBjYXNlLg0KPiANCj4gSSB0aGluayBJIGZv
dW5kIHRoaXMsIHRoZSBiYW5kd2lkdGggbGltaXQgY2FsY3VsYXRpb24gaW4NCj4gZHJpdmVy
cy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYyB3YXMgdXNpbmcgdGhlIGJwcCBmcm9t
DQo+IHRoZSBjb25maWcgYW5kIHRoaXMgd2FzIGRlY3JlYXNlZCBmcm9tIDE2IHRvIDE1IGFu
ZCBhcyBpdCBkZXRlcm1pbmVkDQo+IGNwcCBieSBkaXZpZGluZyBicHAvOCB0aGlzIGRlY3Jl
YXNlZCBmcm9tIDIgYnl0ZXMgdG8gMSBieXRlLg0KPiANCj4gVGVzdGluZyB3aXRoIERJVl9S
T1VORF9VUCgpIGluIGNvbWJpbmF0aW9uIHdpdGggdGhlIHByZXZpb3VzDQo+IGZpeCENCg0K
R3JlYXQuIEl0J3MgdGhlIGNvZGUgaW4gbW9kZV92YWxpZCwgcmlnaHQ/IFRoYXQgZml4IHNo
b3VsZCBiZSBnb29kIA0KZW5vdWdoIGZvciBub3cuIEluIHRoZSBsb25nIHRlcm0sIHdlIGNv
dWxkIG1ha2Ugc29tZSBvZiB0aGUgaW50ZXJuYWwgDQpmYi1oZWxwZXIgY29kZSBhdmFpbGFi
bGUgdG8gZHJpdmVycy4gWW91J2QgdGhlbiBiZSBhYmxlIHRvIHVzZSBpdCB0byBnZXQgDQp0
aGUgZGVwdGgvYnBwIHZhbHVlcyBmb3IgdGhlIGNvbG9yIG1vZGUuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------6IwX2cCEsWXWQlDWyfFWeUzX--

--------------SaSDJpgtexyvDuTJULeTxuxU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRh+s4FAwAAAAAACgkQlh/E3EQov+Bu
7RAAw5GTVJFquC/bwxdHuPaqDiFf8F1hxvENwOD2Isjy0mzylqcSW/szLF3utI5BT9H4q/iPAQA0
B9HbcXSKLw/M/T0QmEOEAVlhPbXxn86xtDMtcjC+nOKoZU6PHsJI2HjoYtHMeDPHdGjw7PrH2o9/
QwaykU667uF428aocj50smSCIlK09NaVLrxA5lK6bidSvnsfP9hNxW+5a021d/ODXO0RsB9jNcdj
oBH4zXC0NLznHjtL1Qlo554tzE+xi+3TxqPKOuzGyWPz73LQm/0BpxO2nZWvroRU4k8OZrwkon7w
dB+hOlPG5cyjlxlDRH5K4vYEQmkA/NGRSG61yUoUlyPM+QZhnCjTSeegNGj0IIZsJF+NZD/d2v9f
Kp8dvJxG848TsIW9pqdoaC8ay0AhGutakN5s4qASPOfp+UVxZp0mkWsYnCEdZ4Fnj21irog5jryr
8d8eJFMh6MlqU6iFEJmoQUH7WTsvNiYsJj2SBOw5+6Z44b7yEbfK/BOmxZaOlOLaGNTB1NoYHqC1
veYco0W/mprZhOInAho82EQb43t2c/IZqLDD6PFDQSYk2IgnC3wmV5nDs8xeSES/g4e/r0/WttfV
13h2xXnDgItDRmYFEL4VWNYhPU1wEXMCHKrBJOBoaKr+8kxkDk7N9BGwFz5n86axfD4MFWwl6+vU
s94=
=FwDZ
-----END PGP SIGNATURE-----

--------------SaSDJpgtexyvDuTJULeTxuxU--

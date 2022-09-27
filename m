Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C91D5EC0E5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05B10E8E0;
	Tue, 27 Sep 2022 11:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988010E8E0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 11:18:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D6561FD03;
 Tue, 27 Sep 2022 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664277483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vS+2Z0w98N21eSUSqoUOHnDYdgH8k2LY+nOe6UayVhY=;
 b=liXtDfUMlNlHISSlkwUKA0zuVAP7F70N56DLpitXLhB/oy7xdIzr24ang2uW65Q/GJhfA4
 dBf/RJdKzbx338Z+3Nl+RAztQ+yhsCBuoRTxaF+TJMzWIgjrGIBhDi9bGjM9HRsP6f246L
 jPwAEghiQrlyAORdL1ai9deL5W3q52Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664277483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vS+2Z0w98N21eSUSqoUOHnDYdgH8k2LY+nOe6UayVhY=;
 b=JeRP8O80N0y98ro4AZXy0AY2ozgWlcHDpkRNNteRYjISbFW0QlUTOdqeNbyabfhBW3Yj2Z
 5mUeQ0w35zpH0rCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00E48139BE;
 Tue, 27 Sep 2022 11:18:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PzbfOurbMmPNZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Sep 2022 11:18:02 +0000
Message-ID: <bd64206e-4d67-6932-30c2-740237a05bd0@suse.de>
Date: Tue, 27 Sep 2022 13:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ssd130x: Synchronize access to dma-buf imported GEM
 BOs
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220927095249.1919385-1-javierm@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220927095249.1919385-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------chZAy4n5uKEh8OIqyb80reWc"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------chZAy4n5uKEh8OIqyb80reWc
Content-Type: multipart/mixed; boundary="------------G0ypG6Hm7GGFzDdHaNRPCwiG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <bd64206e-4d67-6932-30c2-740237a05bd0@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Synchronize access to dma-buf imported GEM
 BOs
References: <20220927095249.1919385-1-javierm@redhat.com>
In-Reply-To: <20220927095249.1919385-1-javierm@redhat.com>

--------------G0ypG6Hm7GGFzDdHaNRPCwiG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDkuMjIgdW0gMTE6NTIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFN5bmNocm9uaXplIENQVSBhY2Nlc3MgdG8gR0VNIEJPcyB3aXRoIG90aGVy
IGRyaXZlcnMgd2hlbiB1cGRhdGluZyB0aGUNCj4gc2NyZWVuIGJ1ZmZlci4gSW1wb3J0ZWQg
RE1BIGJ1ZmZlcnMgbWlnaHQgb3RoZXJ3aXNlIGNvbnRhaW4gc3RhbGUgZGF0YS4NCj4gDQo+
IFN1Z2dlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUBy
ZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zb2xvbW9u
L3NzZDEzMHguYyB8IDcgKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2Qx
MzB4LmMgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4gaW5kZXggYTUz
NzY5MjEwMGQxLi5iYzQxYTVhZTgxMGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zb2xvbW9uL3NzZDEzMHguYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9z
c2QxMzB4LmMNCj4gQEAgLTU1NSwxMSArNTU1LDE4IEBAIHN0YXRpYyBpbnQgc3NkMTMweF9m
Yl9ibGl0X3JlY3Qoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGNvbnN0IHN0cnVjdCBp
b3N5c19tDQo+ICAgCWlmICghYnVmKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgDQo+
ICsJcmV0ID0gZHJtX2dlbV9mYl9iZWdpbl9jcHVfYWNjZXNzKGZiLCBETUFfRlJPTV9ERVZJ
Q0UpOw0KPiArCWlmIChyZXQpDQo+ICsJCWdvdG8gb3V0X2ZyZWU7DQo+ICsNCj4gICAJaW9z
eXNfbWFwX3NldF92YWRkcigmZHN0LCBidWYpOw0KPiAgIAlkcm1fZmJfeHJnYjg4ODhfdG9f
bW9ubygmZHN0LCAmZHN0X3BpdGNoLCB2bWFwLCBmYiwgcmVjdCk7DQo+ICAgDQo+ICsJZHJt
X2dlbV9mYl9lbmRfY3B1X2FjY2VzcyhmYiwgRE1BX0ZST01fREVWSUNFKTsNCj4gKw0KPiAg
IAlzc2QxMzB4X3VwZGF0ZV9yZWN0KHNzZDEzMHgsIGJ1ZiwgcmVjdCk7DQo+ICAgDQo+ICtv
dXRfZnJlZToNCj4gICAJa2ZyZWUoYnVmKTsNCj4gICANCj4gICAJcmV0dXJuIHJldDsNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------G0ypG6Hm7GGFzDdHaNRPCwiG--

--------------chZAy4n5uKEh8OIqyb80reWc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMy2+oFAwAAAAAACgkQlh/E3EQov+Ao
YxAAkuijTvBW5TUnz7ZmG6jKhxbr3jrKIA83T7TXfKxbiqPXiFV/IDe3CSlF7axljH+a1rv4JjJc
5lhVPBHsoYZ7Ax/CW3IAtfyzchPvyf88yy0+YV6nj5ffI4Wp9UL2kXot0X0BFpL8O8P20LRp53um
/wAHZNBtLID45cWGtItRm6xbpKQ4bhRGhdE51ATModyB8f+7gWQL/ziWQstPLNUN6y5FD7OGA2B2
uOokVPLc6ZVAbtrYC9Jc1dcsIOLyOSrKEu0nHOHxJIKvVJXUE1jDPWIQUAshEskYrwvU4A1PRVgq
5GEgjpNiCyTlPOHbXqJIEc+TGRG3bzF0WhdUhtF1Gmh6fcSruJRizAMt3oxg6N/P801MZREmjX7j
i6zf9rQU1BmncB2J3DZ90fmqJJIX0nKbyiYo64dPOfIbJICfYV9Azzoa3GDX0eyZGmpvKHu7D5Z7
lztCL4DB+xGM5zJNYcqxc8uJmiVeDQPDgMAtJPOV0hDjCbaPzz/jneH5YQ3YSbYvPMjTKB5YJSS5
9bKBoBvxUwAGDvvi194GzKRNasEcKWdzLw7HxV/TcN8V4kprLxjY6RaOHhR+sKsu0czo/Z3tCR4q
eC8wdKSbC/8DHchksr/PiCELd0SCj5465pI8u3/CcyfcTtGzCbIJOZKqalKhWAcmYO1lTM16foJ8
yAc=
=/mg8
-----END PGP SIGNATURE-----

--------------chZAy4n5uKEh8OIqyb80reWc--

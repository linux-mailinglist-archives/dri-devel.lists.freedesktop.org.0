Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD65B0028
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 11:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1778710E49D;
	Wed,  7 Sep 2022 09:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4896D10E490
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 09:18:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A96C33BE2;
 Wed,  7 Sep 2022 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662542282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pNFeH0aTtqiwvoaDUHgrBm2giae3XwwjNhPbl/t9kJo=;
 b=r/Mjvhi5wz2Gnb93Lcd3Emw1w+VsAjbTxOgy3/oqrFg3/njA+F9IBB5KzWWeDXArStlaLC
 OTn+dqYu09pa7apWK5hpfdfJyW561L33FHLwXnfLiUQJiIWEWln5thFTMDq25kM/gVbCMT
 iEQ4UNl4QmMZk8XH3kp5BY7abFsf4qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662542282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pNFeH0aTtqiwvoaDUHgrBm2giae3XwwjNhPbl/t9kJo=;
 b=jNiZMDUoTWEJAfB7pRvO0aNoSnp9OxDaO28IeJxh7uM4LXhYZawFGiShqUt2kTleS4203k
 glIGfxQXh87qoYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBE5913486;
 Wed,  7 Sep 2022 09:18:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Jq2eOMlhGGNlKwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 09:18:01 +0000
Message-ID: <149574f2-6dcf-f1bb-c7dc-3d6edaf52ef0@suse.de>
Date: Wed, 7 Sep 2022 11:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220907153847.E7FC.409509F4@e16-tech.com>
 <5a00d713-5fb9-3c78-8785-5721f31b9e06@suse.de>
 <20220907164723.CD41.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220907164723.CD41.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0cbiIiYmdOYbUvJMdSdI5LUc"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0cbiIiYmdOYbUvJMdSdI5LUc
Content-Type: multipart/mixed; boundary="------------ufMp1SbAS5UKq2mKDwLlDbvb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <149574f2-6dcf-f1bb-c7dc-3d6edaf52ef0@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220907153847.E7FC.409509F4@e16-tech.com>
 <5a00d713-5fb9-3c78-8785-5721f31b9e06@suse.de>
 <20220907164723.CD41.409509F4@e16-tech.com>
In-Reply-To: <20220907164723.CD41.409509F4@e16-tech.com>

--------------ufMp1SbAS5UKq2mKDwLlDbvb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDkuMjIgdW0gMTA6NDcgc2NocmllYiBXYW5nIFl1Z3VpOg0KPiBIaSwN
Cj4gDQo+PiBBbSAwNy4wOS4yMiB1bSAwOTozOCBzY2hyaWViIFdhbmcgWXVndWk6DQo+Pj4g
SGksDQo+Pj4NCj4+Pg0KPj4+PiBIaQ0KPj4+Pg0KPj4+PiBBbSAwNy4wOS4yMiB1bSAwNjox
NiBzY2hyaWViIFdhbmcgWXVndWk6DQo+Pj4+PiBIaSwNCj4+Pj4+DQo+Pj4+Pj4gQW0gMDIu
MDkuMjIgdW0gMDc6NTIgc2NocmllYiBXYW5nIFl1Z3VpOg0KPj4+Pj4+PiBIaSwNCj4+Pj4+
Pj4NCj4+Pj4+Pj4gbWdhZzIwMCBicm9rZW4gb24ga2VybmVsLTYuMC1yYzMgb24gREVMTC9U
NjIwLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBTZWUgdGhlIGF0dGFjaGVtZW50bWVudCBmaWxlIGZv
ciB0aGUgZ3JhcGggb3V0cHV0Lg0KPj4+Pj4+DQo+Pj4+Pj4gVGhhbmtzIGZvciByZXBvcnRp
bmcgdGhlIGJ1Zy4gV2UgcmVjZW50bHkgcmVmYWN0b3JlZCBzb21lIGNvZGUgb2YgdGhlIGRy
aXZlci4gQ2FuIHlvdSBiaXNlY3QgdG8gdGhlIGNoYW5nZSB0aGF0IGludHJvZHVjZWQgdGhl
IHByb2JsZW0/DQo+Pj4+Pg0KPj4+Pj4gNS4xOS4zIHdvcmtzIHdlbGwgb24gdGhpcyBERUxM
L1Q2MjAuDQo+Pj4+Pg0KPj4+Pj4gc28gdGhpcyBwcm9ibGVtIHNob3VsZCBiZSBhIHJlZ3Jl
c3Npb24gb2YgNi4wLg0KPj4+Pj4NCj4+Pj4+IG90aGVyIGJpc2VjdCBzZWVtIGRpZmZpY3Vs
dCBmb3IgbWUuDQo+Pj4+DQo+Pj4+IE9LLCB0aGFuayB5b3UuIENhbiB5b3UgcHJvdmlkZSB0
aGUgZG1lc2cgbG9nIG9mIHRoZSBicm9rZW4gbWFjaGluZSBhbmQgdGhlIG91dHB1dCBvZiAn
c3VkbyBsc3BjaSAtdm4nIHBsZWFzZT8NCj4+Pg0KPj4+IHBsZWFzZSBzZWUgdGhlIGF0dGFj
aG1lbnQgZmlsZSBmb3IgdGhlIG91dHB1dCBvZiAnbHNwY2kgLXZuJy4NCj4+DQo+PiAgICAw
YTowMC4wIDAzMDA6IDEwMmI6MDUzNCAocHJvZy1pZiAwMCBbVkdBIGNvbnRyb2xsZXJdKQ0K
Pj4NCj4+IEl0J3MgdGhlIEcyMDBFUi4gSSdsbCB0cnkgdG8gZmluZCByZWxhdGVkIGNvZGUg
dGhhdCB3ZSByZWNlbnRseSBjaGFuZ2VkLiBJIG1pZ2h0IGdldCBiYWNrIHRvIHlvdSBmb3Ig
dGVzdGluZyBhIHBhdGNoLiBUaGFua3Mgc28gZmFyLg0KPiANCj4gdGhlIHBhdGNoIGJhc2Vk
IG9uIGtlcm5lbCA2LjAocmM0KSB3aWxsIGJlIGVhc3kgdG8gYnVpbGQgYW5kIHRlc3QgaGVy
ZS4NCj4gDQo+IEJ5IHRoZSB3YXksIHRoaXMgcHJvYmxlbSBoYXBwZW4gb24gREVMTC9UNjMw
IHRvby4NCj4gYnV0IGl0IGRvZXMgbm90IGhhcHBlbiBvbiBERUxML1Q2NDAuDQo+IA0KPiBw
bGVhc2Ugc2VlIHRoZSBhdHRhY2htZW50IGZpbGUgZm9yIHRoZSBvdXRwdXQgb2YgJ2xzcGNp
IC12bicgb24NCj4gREVMTC9UNjMwIGFuZCBERUxML1Q2NDAuDQoNClRoYW5rcyBhIGxvdCwg
YWdhaW4uIEFjY29yZGluZyB0byB0aGVzZSBmaWxlcywgdGhlIFQ2MzAgYWxzbyBoYXMgYSAN
CkcyMDBFUiwgYnV0IHRoZSBUNjQwIGhhcyBhIEcyMDBFVzMuIEFzIEkgc2FpZCwgd2UgcmVj
ZW50bHkgcmVmYWN0b3JlZCANCnRoZSBkcml2ZXIuIFRoZSBHMjAwRVIgaXMgc29tZWhvdyBk
aWZmZXJlbnQgbm93LiBJJ2xsIGdldCBiYWNrIHRvIHlvdSBhcyANCnNvb24gYXMgSSBmaW5k
IHNvbWV0aGluZy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQmVzdCBSZWdh
cmRzDQo+IFdhbmcgWXVndWkgKHdhbmd5dWd1aUBlMTYtdGVjaC5jb20pDQo+IDIwMjIvMDkv
MDcNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------ufMp1SbAS5UKq2mKDwLlDbvb--

--------------0cbiIiYmdOYbUvJMdSdI5LUc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYYckFAwAAAAAACgkQlh/E3EQov+BY
iRAArRRxb/GvTpDGIJR+jOiR2MtAl7BGa2gbk7Mo8NxKgs5iXe0N436IK3zpiVMyETb6TPU7ej5h
6PYzOFoWVtrKiPPnQLyrAWpAv5iHmfT5jgnv/hxld7Cw3o3CePAXr0moq2zMdfHwTPdV/SiVoAnp
mjxDMsmPje4/hMQN797DmHJI8AEz/xZ8Sc3yDaM0t7mATkJ4bstsT0s4yUILUZ2+DbBFLkpQjNJi
+MkwHp/oXaVAYxS8cB5WOvdOp0/S1kFQsKG7xjOV9bbNZpu5mZc+5Lo4jLRshfOSwk1QYFGT2dJi
+n+WEOabloq0vXTSNnKrTXgp1iua2eMLrKG/se1FeReVQNq5v4y/nSBxMtmYetYYkr+tzmW3AMMH
cyeFK3lC7JOaKgflLOG5kwToMVvEBboT5CKV9kV1tpvgxtT8XHBrqxSiQ1FJSiDcp67VzuDAQUOk
Pa273yisWgq479qqIonxW9CVSuuVNFrgsrcvtkykX4uFgXU+1M1yxhUHSL3gwvgUXhNrv83SeNgk
4KD2h7vlP/PHaqkLo2he8dbKslgsODg1ykoVNjltGAAINrE47JUQqXZ3INEZxZB7gqZ/vgV/Nce/
iVTZl15HyDTG517QSNzrojwKjxVQsHuVCP7NeBYyK1HYGGYHiuCZBQeqzvNCtUZLHWkMIEE33Wvr
9v4=
=XOvY
-----END PGP SIGNATURE-----

--------------0cbiIiYmdOYbUvJMdSdI5LUc--

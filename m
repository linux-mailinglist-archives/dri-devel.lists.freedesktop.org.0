Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499EC4D3A55
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 20:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9F310E3DA;
	Wed,  9 Mar 2022 19:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A59910E39D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 19:28:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4C8321117;
 Wed,  9 Mar 2022 19:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646854082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBgd/kQM55+aKZyAxeZX48FkKVfo/mz5CTR5lRw9eKc=;
 b=b3Z3M399AMh+GTSPcGUbXFhjUT60ZcnZGXo3ZwidAB2Na7GV2lWe7y6CQnjqN9QCUraFtC
 kmMIH2GqDsK/+M4d77UvYJMdMic1Ds/bAscRHv+OmappmAs096Qlr09Exv3pt+gfeVfNL8
 upzReRQE7qX0ExI5JafnRK6j3g2Qwbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646854082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBgd/kQM55+aKZyAxeZX48FkKVfo/mz5CTR5lRw9eKc=;
 b=nOFXmqBfiMmnupNjUk7t+uMDGgMsx/dslFxiJeSG1xw9ddpJVnlNHSzDrlfBRb0b6wL5Sh
 Xia5h41juXNdSRCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AD0913D7C;
 Wed,  9 Mar 2022 19:28:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bdAuIML/KGINRQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Mar 2022 19:28:02 +0000
Message-ID: <d1169f34-ccd8-299d-af1f-f45da37556db@suse.de>
Date: Wed, 9 Mar 2022 20:28:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <4ce1e172-799c-cba3-0a72-4a6fdf2c6d2f@suse.de>
 <caa9a2ea-d1b4-fa96-0e90-37a89aa0c000@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <caa9a2ea-d1b4-fa96-0e90-37a89aa0c000@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0fZuqDyqCnXB5WEZyY7uvbDk"
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0fZuqDyqCnXB5WEZyY7uvbDk
Content-Type: multipart/mixed; boundary="------------oCd2skkQJSv6EnHzuN8xFK1Z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1169f34-ccd8-299d-af1f-f45da37556db@suse.de>
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <4ce1e172-799c-cba3-0a72-4a6fdf2c6d2f@suse.de>
 <caa9a2ea-d1b4-fa96-0e90-37a89aa0c000@collabora.com>
In-Reply-To: <caa9a2ea-d1b4-fa96-0e90-37a89aa0c000@collabora.com>

--------------oCd2skkQJSv6EnHzuN8xFK1Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDMuMjIgdW0gMTI6NTUgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IEhlbGxvLA0KPiANCj4gT24gMy85LzIyIDExOjU5LCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMDguMDMuMjIgdW0gMTQ6MTcgc2NocmllYiBEbWl0cnkg
T3NpcGVua286DQo+Pj4gSGVsbG8sDQo+Pj4NCj4+PiBUaGlzIHBhdGNoc2V0IGludHJvZHVj
ZXMgbWVtb3J5IHNocmlua2VyIGZvciB0aGUgVmlydElPLUdQVSBEUk0gZHJpdmVyLg0KPj4+
IER1cmluZyBPT00sIHRoZSBzaHJpbmtlciB3aWxsIHJlbGVhc2UgQk9zIHRoYXQgYXJlIG1h
cmtlZCBhcyAibm90IG5lZWRlZCINCj4+PiBieSB1c2Vyc3BhY2UgdXNpbmcgdGhlIG5ldyBt
YWR2aXNlIElPQ1RMLiBUaGUgdXNlcnNwYWNlIGluIHRoaXMgY2FzZSBpcw0KPj4+IHRoZSBN
ZXNhIFZpckdMIGRyaXZlciwgaXQgd2lsbCBtYXJrIHRoZSBjYWNoZWQgQk9zIGFzICJub3Qg
bmVlZGVkIiwNCj4+PiBhbGxvd2luZyBrZXJuZWwgZHJpdmVyIHRvIHJlbGVhc2UgbWVtb3J5
IG9mIHRoZSBjYWNoZWQgc2htZW0gQk9zIG9uDQo+Pj4gbG93bWVtDQo+Pj4gc2l0dWF0aW9u
cywgcHJldmVudGluZyBPT00ga2lsbHMuDQo+Pg0KPj4gVmlydGlvLWdwdSBpcyBidWlsZCBv
biB0b3Agb2YgR0VNIHNobWVtIGhlbHBlcnMuIEkgaGF2ZSBhIHByb3RvdHlwZQ0KPj4gcGF0
Y2hzZXQgdGhhdCBhZGRzIGEgc2hyaW5rZXIgdG8gdGhlc2UgaGVscGVycy4gSWYgeW91IHdh
bnQgdG8gZ28NCj4+IGZ1cnRoZXIsIHlvdSBjb3VsZCBpbXBsZW1lbnQgc29tZXRoaW5nIGxp
a2UgdGhhdCBpbnN0ZWFkLiBQYW5mcm9zdCBhbmQNCj4+IGxpbWEgYWxzbyBoYXZlIHRoZWly
IG93biBzaHJpbmtlciBhbmQgY291bGQgY2VydGFpbmx5IGJlIGNvbnZlcnRlZCB0bw0KPj4g
dGhlIGdlbS1zaG1lbSBzaHJpbmtlci4NCj4gDQo+IEkgaGFkIGEgdGhvdWdodCB0aGF0IGl0
IGNvdWxkIGJlIHBvc3NpYmxlIHRvIHVuaWZ5IHNocmlua2VycyBpbnRvIGENCj4gY29tbW9u
IERSTSBmcmFtZXdvcmsuIENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhIGxpbmsgdG8geW91
cnMgcHJvdG90eXBlDQo+IHBhdGNoc2V0Pw0KDQpJIHVwbG9hZGVkIHRoZSBwYXRjaGVzIHRv
DQoNCiANCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy90emltbWVybWFubi9saW51
eC8tL2NvbW1pdHMvZ2VtLXNobWVtLWNhY2hlZC1tYXBwaW5ncw0KDQppdCdzIGluY29tcGxl
dGUgYW5kIHVuLWRlYnVnZ2VkLCBidXQgaXQgc2hvd3Mgd2hhdCBuZWVkcyB0byBiZSBkb25l
LiBJdCANCmhhcyB0aGUgaW5mcmFzdHJ1Y3R1cmUsIGJ1dCBsYWNrcyB0aGUgY2hhbmdlcyB0
byB0aGUgR0VNIHNobWVtIGNvZGUuDQoNClRoZSByZWFzb24gZm9yIHRoaXMgd29yayBpcyB0
byBrZWVwIEdFTSBzaG1lbSBwYWdlcyBtYXBwZWQgYW5kIGFsbG9jYXRlZCANCmV2ZW4gd2hp
bGUgdGhlIEJPIGlzIG5laXRoZXIgbWFwcGVkIG5vciBwaW5uZWQuICBBcyBpdCBpcyBub3cs
IEdFTSBTSE1FTSANCmNyZWF0ZXMgYW5kIHJlbGVhc2VzIHBhZ2VzIG9uIGVhY2ggcGluIGFu
ZCB1bnBpbiwgYW5kIG1hcHMgYW5kIHVubWFwcyANCm1lbW9yeSByYW5nZXMgb24gZWFjaCB2
bWFwIGFuZCB2dW5tYXAuICBJdCdzIGFsbCB3YXN0ZWZ1bC4gT25seSB0aGUgDQpmaXJzdCBw
aW4gYW5kIHZtYXAgY2FsbHMgc2hvdWxkIGVzdGFibGlzaCBwYWdlcyBhbmQgbWFwcGluZ3Mg
YW5kIG9ubHkgDQp0aGUgcHVyZ2UgYW5kIGZyZWUgZnVuY3Rpb25zIHNob3VsZCByZWxlYXNl
IHRoZW0uDQoNClRoZSBwYXRjaHNldCBhZGRzIG5ldyBoZWxwZXJzIGZvciBCTyBwdXJnaW5n
IHRvIHN0cnVjdCANCmRybV9nZW1fb2JqZWN0X2Z1bmNzLiBXaXRoIHRoaXMsIEkgdGhpbmsg
aXQgbWlnaHQgYmUgcG9zc2libGUgdG8gaGF2ZSANCm9uZSBnbG9iYWwgRFJNIHNocmlua2Vy
IGFuZCBsZXQgaXQgaGFuZGxlIGFsbCBCT3M7IGluZGVwZW5kZW50IG9mIGVhY2ggDQpCTydz
IG1lbW9yeSBtYW5hZ2VyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------oCd2skkQJSv6EnHzuN8xFK1Z--

--------------0fZuqDyqCnXB5WEZyY7uvbDk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIo/8EFAwAAAAAACgkQlh/E3EQov+B5
Cg/8D7p/w31jtMqJdXvTfREicil4d2w52/vvgXkFNV6+5IoG0WCNVZ4aiTiws28X/ATH31KjS388
3stbqkYxb1+Zui9tiXi2ciKBNc9ofNxeht/fpuP0vz0Xqigh0bYXPZmzLiDmwns7sXauMNML4cM1
CqDnnwL+gjV/ZaowppqMgJqcB47k+SPURriV7ryLVb5Wc34MP3Qa3rbbOPm954y6bv1/W6zwIOAJ
4Kpu5q6n0m4XWYV8rMVloIODbjm5yUcY0v/RolNfNEZICqDa82stzim8Co9JleplaUixuT7S3xX0
enWNLyjzuzNz1m1AI64qTNXOwj8oa+Uu5H+rTXxA0+sT9kvZNad8NevS+buLiUEeF2pQullvY2Hh
TVGmElsblRlDHKA6EpZKnCvjfxtXul1WuQHXAa3E+SX5MQAmWD08MaswNqMqSbzL/vE5lt7nR5yY
ijCJoAylYpJ9esEkYc22++vvdDm5DMJP6Sto4/uCNIotmZmCOUWdDXb501ypJct8pJsgrMma0pKJ
wAv8W3sCMHpUgpnB/of52Of7U7CPSe2CJrQ/7QUNRrCNSTp9lH8Ef1j9WxafqNlYJS+K850jOK4Y
OVZWpm8L8iNpkv9mHd5O1qx6Hk2cjWop7BeSgs0o1u8qCi0KBZKfemMiacLpI8yiBaP60JyVFAsa
rE8=
=Wf5r
-----END PGP SIGNATURE-----

--------------0fZuqDyqCnXB5WEZyY7uvbDk--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361876B92D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 17:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0931410E40F;
	Tue,  1 Aug 2023 15:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AEB10E40F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 15:55:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CACAD1F37F;
 Tue,  1 Aug 2023 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690905314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y5v/XAXxfQ1BbcCfGA4UgYyOWlhmRmH02ufAFa/d5Uk=;
 b=Nn8+OEUPxqTaJtj5cW90XCujq2BtqqicbUoUjOv2LyBalHU+TxHLWDS8H1ueQ7TW7dPIYd
 RcozAFGV3swEUpZG8inhG1AKtxsgDzH9O9bdFYv9sFBrBj9RogmVlqd1tekf9IRsq0AaM0
 o3DTF0f+6AmE/GEFeqDVHfMmsVHnmfw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690905314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y5v/XAXxfQ1BbcCfGA4UgYyOWlhmRmH02ufAFa/d5Uk=;
 b=3KRZrkRATMszVVqvuilheJprgjBZgKfE3WXM89oSvq/stW+n3BRa4ALR638RMSGdwGGROx
 ISmoOnwUDSVE/rBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A47D513919;
 Tue,  1 Aug 2023 15:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1zo7J+IqyWQUFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 15:55:14 +0000
Message-ID: <51526559-24e0-344a-4455-62b4eb479185@suse.de>
Date: Tue, 1 Aug 2023 17:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
To: Roger Sewell <roger.sewell@cantab.net>,
 Jocelyn Falempe <jfalempe@redhat.com>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
 <20230801132128.4379@revelation.broadband>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230801132128.4379@revelation.broadband>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fO0ZJY012bzaP5LIhP2gmCdR"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fO0ZJY012bzaP5LIhP2gmCdR
Content-Type: multipart/mixed; boundary="------------El0a6lDfUyz9S2kZ9YAtVfP0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Roger Sewell <roger.sewell@cantab.net>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <51526559-24e0-344a-4455-62b4eb479185@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
 <20230801132128.4379@revelation.broadband>
In-Reply-To: <20230801132128.4379@revelation.broadband>

--------------El0a6lDfUyz9S2kZ9YAtVfP0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDguMjMgdW0gMTQ6MjEgc2NocmllYiBSb2dlciBTZXdlbGw6DQo+IEpv
Y2VseW4sIFRob21hcywNCj4gDQo+IEpvY2VseW4sIHlvdXIgcGF0Y2ggd29ya3MgcGVyZmVj
dGx5IC0gdGhhbmsgeW91Lg0KDQpUaGF0J3MgYW4gaW50ZXJlc3RpbmcgZmluZC4gSSBicmll
Zmx5IGxvb2tlZCB0aHJvdWdoIHRoZSBjb2RlIHRoYXQgDQp2YWxpZGF0ZXMgdGhlIG1vZGVz
LCBidXQgdGhlcmUncyBubyBvYnZpb3VzIHJlYXNvbiB3aHkgaXQgd291bGQgbm93IHdvcmsu
DQoNCj4gDQo+IE1heSBJIGxlYXZlIGl0IHRvIHRoZSB0d28gb2YgeW91IHRvIGRlY2lkZSB3
aGF0IHNob3VsZCBoYXBwZW4gYWJvdXQNCj4gcHJvcGFnYXRpbmcgdGhpcyBwYXRjaCA/IChJ
IGhhdmUgc2V0IG91dCBteSB1c2VyJ3MgcG9pbnQgb2YgdmlldyBhYm91dA0KPiBpdCBpbiBt
eSBlbWFpbCBvZiBGcmksIDI4IEp1bCAyMDIzIDEwOjExOjAwICswMTAwLCBidXQgb2J2aW91
c2x5IG15DQo+IG9waW5pb24gaXMgbm90IGJpbmRpbmcgb24gZWl0aGVyIG9mIHlvdS4pDQoN
CllvdXIgcHJvcG9zYWwgb2YgZ2l2aW5nIHVzZXJzcGFjZSB0aGUgb3Bwb3J0dW5pdHkgdG8g
b3ZlcnJpZGUga2VybmVsIA0KdmFsaWRhdGlvbiBhbmQgcHJvZ3JhbSBhbnl0aGluZyBpcyBu
b3QgZmVhc2libGUgaW4gcHJhY3RpY2UuIEl0IHdvdWxkIA0Kb3BlbiBob2xlcyB0byB0aGUg
c2VjdXJpdHkgYW5kIHNhZmV0eSBvZiB0aGUgc3lzdGVtLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiBJIHdvdWxkIGJlIGdsYWQgdG8gaGVhciB3aGF0IHlvdSBldmVudHVh
bGx5IGRlY2lkZSBiZXR3ZWVuIHlvdS4NCj4gDQo+IE1hbnkgdGhhbmtzIGluZGVlZCBmb3Ig
eW91ciBoZWxwICENCj4gUm9nZXIuDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------El0a6lDfUyz9S2kZ9YAtVfP0--

--------------fO0ZJY012bzaP5LIhP2gmCdR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTJKuEFAwAAAAAACgkQlh/E3EQov+D2
KBAAqMptMQ/icR2H5oZ0CQwm1JFB8HEjP6Usmfa20mzbr2Hl1td17lrDQuxJQ4ZU1mO+hyrta/lD
dseddRnv0a6ySMVla4dj8QjZCG8f+Td1zLN7ge581WnTK3Aeky+VBWYOTEUMmcmWjv08b/rtjflr
gu3dUdn5TAdGhzUTR76176TzBzd9vddnBJaA6Spu2e35qpx0WNS/yxg9BIPUJt0Spq5OckIQ/2sp
GMXe8hCWurkFHsRHCYfboYZJKu2UQqZPyxVADiGB+Iyd5KKql4ImnHhF6CN6SceIW8i8VqXJC7c1
WEVNrGhs3/zTugm9RFLr9FZkWAZ+meku0RIbLNIxFxC5sGR1/4rMz9ATGlccG9C7uIXAKbpJnzbP
83Q5lRbXUaQgUMhLJABp9cZC/qjMpRyLvPzObXaa+6pnplen4pTnWzO0w6uF7eGaKjA6sWBejkNL
n7F3QqXi8u4BJEfWcMdUCt1NRQBaQCyiG0LI69TvAfxg8tawfqkeYHqqVDH/FNJzK082t/eRCC2B
xWT9KJXnfWpNA+rlhjCCo6iUqJ9u9TyvxLO2FYwD4lvELzzvSWh4PNl7c5SJM9FjHdwtjK7i7edx
UUzZeI12vbIxDpS+K0FP2hbt3HAwLa41s5Czxh8uJrwfXFZQHQEeEsKKktbX0CGZRHT4F/2n8fLG
OI8=
=0hac
-----END PGP SIGNATURE-----

--------------fO0ZJY012bzaP5LIhP2gmCdR--

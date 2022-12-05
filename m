Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6DB6423D0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 08:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971BC10E0FB;
	Mon,  5 Dec 2022 07:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B410E0FB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 07:46:48 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A4D721B90;
 Mon,  5 Dec 2022 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670226406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yh/etttrnYKSneGRoYKFLOK8285TF5WlvKRINX1H354=;
 b=JKfvjw0Ab9tpDSWbhEAEJIJIjabLfwOFKSYY7zerQ02id/i6asZtGetbYWn8jkdtw0Pvlx
 FpDWLOHoo4wX9wQkOujWktgj/uv82ywkiVXdgrp2t4iTJzjG9+tua6CWMC0+8PgWMJXmiC
 hC6kk3d5h41MDTtt2+xJ0NYKY71aO/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670226406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yh/etttrnYKSneGRoYKFLOK8285TF5WlvKRINX1H354=;
 b=txrNFvtL4E6o1iZ10P5pGv7f5/++ceGFSpiNwUGXX2c+58hUw4Ey5Kimf8EFhTJoOrDTzb
 xJvwY9UJDdRIq3Dw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 49A721348F;
 Mon,  5 Dec 2022 07:46:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id o7bqEOahjWOMKwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Dec 2022 07:46:46 +0000
Message-ID: <357fc5ee-b15a-e5be-0dff-0c33b312b43b@suse.de>
Date: Mon, 5 Dec 2022 08:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 6/8] drm/mipi-dbi: Support shadow-plane state
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221202125644.7917-1-tzimmermann@suse.de>
 <20221202125644.7917-7-tzimmermann@suse.de>
 <506706ad-204d-f0a0-c8ce-92bb8805402e@tronnes.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <506706ad-204d-f0a0-c8ce-92bb8805402e@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------70rQFzK0rHLkzYcmaVd5v1F3"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------70rQFzK0rHLkzYcmaVd5v1F3
Content-Type: multipart/mixed; boundary="------------wTkc2OcVceEcuShaoqfjv5b6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <357fc5ee-b15a-e5be-0dff-0c33b312b43b@suse.de>
Subject: Re: [PATCH v2 6/8] drm/mipi-dbi: Support shadow-plane state
References: <20221202125644.7917-1-tzimmermann@suse.de>
 <20221202125644.7917-7-tzimmermann@suse.de>
 <506706ad-204d-f0a0-c8ce-92bb8805402e@tronnes.org>
In-Reply-To: <506706ad-204d-f0a0-c8ce-92bb8805402e@tronnes.org>

--------------wTkc2OcVceEcuShaoqfjv5b6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDAzLjEyLjIyIHVtIDE3OjExIHNjaHJpZWIgTm9yYWxmIFRyw7hubmVzOg0KPiAN
Cj4gDQo+IERlbiAwMi4xMi4yMDIyIDEzLjU2LCBza3JldiBUaG9tYXMgWmltbWVybWFubjoN
Cj4+IEltcGxlbWVudCBNSVBJIERCSSBwbGFuZXMgd2l0aCBzdHJ1Y3QgZHJtX3NoYWRvd19w
bGFuZV9zdGF0ZSwgc28gdGhhdCB0aGUNCj4+IHJlc3BlY3RpdmUgZHJpdmVycyBjYW4gdXNl
IHRoZSB2bWFwJ2VkIEdFTS1idWZmZXIgbWVtb3J5LiBJbXBsZW1lbnQgc3RhdGUNCj4+IGhl
bHBlcnMsIHRoZSB7YmVnaW4sZW5kfV9mYl9hY2Nlc3MgaGVscGVycyBhbmQgd2lyZSB1cCBl
dmVyeXRoaW5nLg0KPj4NCj4+IFdpdGggdGhpcyBjb21taXQsIE1JUEkgREJJIGRyaXZlcnMg
Y2FuIGFjY2VzcyB0aGUgR0VNIG9iamVjdCdzIG1lbW9yeQ0KPj4gdGhhdCBpcyBwcm92aWRl
ZCBieSBzaGFkb3ctcGxhbmUgc3RhdGUuIFRoZSBhY3R1YWwgY2hhbmdlcyB0byBkcml2ZXJz
DQo+PiBhcmUgaW1wbGVtZW50ZWQgc2VwYXJhdGVseS4NCj4+DQo+PiB2MjoNCj4+IAkqIHVz
ZSBzaGFkb3ctcGxhbmUgc3RhdGUgZGlyZWN0bHkgKE5vcmFsZikNCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFRl
c3RlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+PiBUZXN0ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiAj
IGRybS90aW55L21pMDI4M3F0DQo+PiAtLS0NCj4gDQo+IFJldmlld2VkLWJ5OiBOb3JhbGYg
VHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4NCg0KVGhhbmtzIGEgbG90Lg0KDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------wTkc2OcVceEcuShaoqfjv5b6--

--------------70rQFzK0rHLkzYcmaVd5v1F3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmONoeUFAwAAAAAACgkQlh/E3EQov+Cs
fBAAll12LG+2fnnqUKaqZXNlWz9lbVSz3Q40wjW8Ns7JyHvMaSa4REvdDnnm3kpb9qL7GvRRbXaS
mHoUPH7v9adP4ismGrFNWrjV4OzHdSwu3vIukUPQf0cYr3SZnS1D8gtDqLisQlURsUgoQAjcElP3
Bf70SSk0FMGrrMUMufgyVGVFCm/blBduAJ/MUK2qGjGJn3qt93Yb+1BtxdbQWAQLIzShS2hWQDm9
lSKGMk7tM78b4FUS0emwgl3PaAgX+NRMTWpS/c1WMeAQVJ8MB8OV0XWUfT1SwGohiD4EjTDjFUYr
SSoVUf0DGAa1G5hzYtvoZKSe7y8LUfSPoGFQng9TqkQGr8AmOCmAUU8U8WHzzq1FMe6opVg6eVwR
0zWg/wj8coaLKAoIH5lrIsyyCKut6TE/gZI7EHLsrN7yYPsh9cuYM3A68ikPNYM6OncOb142cGMF
dHI6UqL83EDEsuk/G9yiE102EBq0Je1Fbs4sbwDCcM0MI+b1rfaDCrTOjTut8vRUXZRaevaAf8Do
9JQXIEJXr7jUn+X7dt/tfiaUigIVYsvgxGclD7OpwrcTv3fWHgaNPxWgxqD8BgtJVKquAhU6oCBm
qbtJZUEHR9SdBBYctegphPi+8rm81CNblJCNV4GNNNfWa9pfqCYZ7hMTOvdFwtTrljl/cBtfoINw
A+A=
=GEXS
-----END PGP SIGNATURE-----

--------------70rQFzK0rHLkzYcmaVd5v1F3--

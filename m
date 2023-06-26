Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC43E73D920
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 10:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3510E1A1;
	Mon, 26 Jun 2023 08:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA710E1A1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 08:07:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 40B931F8A4;
 Mon, 26 Jun 2023 08:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687766861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDyM1flrXkR51Vf/TmGF98r9fylMMFk3WQKH8XYc9r4=;
 b=KXamEoU7I9i23kOa1N5cIdVH6OQuFLr2rtxxqL2Lxb3NLyyG+BaseHRT2gN9s20ESHodwL
 Xpx/uft/VH8mGIRg0X4rNsnnEaDmtH28VIRgzH1tNPf6tJudhd7BSyJnmdmX4xr6046IoS
 q5QWiO/SrDtDRHVy8A7BGNi6IraztQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687766861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDyM1flrXkR51Vf/TmGF98r9fylMMFk3WQKH8XYc9r4=;
 b=4NDDiZFgnLKQiKPMvA7l91NQaWAhk9miAHsV14JoAOGkWPh1tByOZEURnzyqqVjdJwJffI
 v1NvUYvD24iOpJDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1723D1391D;
 Mon, 26 Jun 2023 08:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FNd8BE1HmWRmSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Jun 2023 08:07:41 +0000
Message-ID: <e6c10829-3a2d-7d7c-46ff-a38862728bc4@suse.de>
Date: Mon, 26 Jun 2023 10:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/drm_gem.c: Remove surplus else after return
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230622101857.2298773-1-suijingfeng@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230622101857.2298773-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VSl75uvMDD0JaE9aR05gX2wK"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VSl75uvMDD0JaE9aR05gX2wK
Content-Type: multipart/mixed; boundary="------------lc9r9tlk1xzg5xXWFKQWd31n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <e6c10829-3a2d-7d7c-46ff-a38862728bc4@suse.de>
Subject: Re: [PATCH] drm/drm_gem.c: Remove surplus else after return
References: <20230622101857.2298773-1-suijingfeng@loongson.cn>
In-Reply-To: <20230622101857.2298773-1-suijingfeng@loongson.cn>

--------------lc9r9tlk1xzg5xXWFKQWd31n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjA2LjIzIHVtIDEyOjE4IHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPiBlbHNl
IGlzIG5vdCBnZW5lcmFsbHkgdXNlZnVsIGFmdGVyIHJldHVybg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCg0KUmV2aWV3
ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgfCA0ICsrLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jDQo+IGluZGV4IDFhNWEyY2QwZDRlYy4uYzE4Njg2ZjQzNGQ0IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtLmMNCj4gQEAgLTExNTAsOCArMTE1MCw4IEBAIGludCBkcm1fZ2VtX3Bpbihz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikNCj4gICB7DQo+ICAgCWlmIChvYmotPmZ1bmNz
LT5waW4pDQo+ICAgCQlyZXR1cm4gb2JqLT5mdW5jcy0+cGluKG9iaik7DQo+IC0JZWxzZQ0K
PiAtCQlyZXR1cm4gMDsNCj4gKw0KPiArCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gICB2
b2lkIGRybV9nZW1fdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------lc9r9tlk1xzg5xXWFKQWd31n--

--------------VSl75uvMDD0JaE9aR05gX2wK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSZR0wFAwAAAAAACgkQlh/E3EQov+Aa
OQ/5AXIaZkyAEx5lshNmfYGURMDQy2M1hxmokotbKX1a4LNxePhdDTeSNMIizJN8EzEP98mezcHg
JOP6wEeG6UJ1/P0nndjc6G++PzTLVGpImZHUQuXWrYdrr7zU84Tupsl/xeEXJT1Xz1i/QuRP22rz
GWAZheboqgH4R+h9Hqj/NrqVK0vlUKDWA76RDNN2/0mjU7phO748t1AxBDf8SmG1ysAA6TtJdJLr
Cs4yDUZqLU9DETkV36RGlMjdTLK8ra2O6P5HnJNXPI5w9m2u1WfsWrCZJEWjod32R5zFqXElL7MG
fP6Qky8Pu7LrGQgoyTXs9HvVUO54T5XMAC6hGCbliSr2uctD9hdhzxvIuFtA8nAubSjayarhaQB/
00THDFPsukEh0BxGpNhbt+HahDJGtP7XsT9lEssTfggXjqlIBgD17fkC89tgoljhthvSCP8nLUd1
+2hs7lC/MAzOC6zCWq46v0KL7YKxbn2nwvV91rnLeUdUgC87Ia40EQ952C2fyMrcFYJ+V5UPq7If
bZUdnQtDCvJP7093a5x+YLEu9LiLXzfZkDclmvGGAjpaSYmL1GQpPmfSQWRScCTeml/0dNO8QcTW
QWdfDsHSEme1ZBMX807EOUm3HhIy+FsfzuYFfAUP25YmgYf3rUSGmObuJwy68tcrtNvu0INhKmW4
+dY=
=6dZ1
-----END PGP SIGNATURE-----

--------------VSl75uvMDD0JaE9aR05gX2wK--

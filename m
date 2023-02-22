Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2ED69F8A5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 17:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6902E10E1CD;
	Wed, 22 Feb 2023 16:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2D010E1C4;
 Wed, 22 Feb 2023 16:09:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 622E42070D;
 Wed, 22 Feb 2023 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677082181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UnlWzOjsvHFym+8/oV1/3UC3iLCVK7y0jY+xZK0uwO0=;
 b=Ys/Ee8nKKA06ngkS/Telib9jsbgI9efxI212/NPfanNR2rIRzSvZ5qvBzrbrIJ0iGlTH5z
 KSjT0NutywlA5tXWWwt/KuGKX1usoqqoCalV7KeCNRoGs8Ii7El8GueHjVYF5CYaEmmB7w
 vUjMoYU28yZwIG8ziGAZleFY5KUFlwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677082181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UnlWzOjsvHFym+8/oV1/3UC3iLCVK7y0jY+xZK0uwO0=;
 b=+iYq3uqqsPd6GGVnlW3dwzsJ+xE5eY5Ubovd2BmP6REYw8zT3dRyOH4vyI9w1IdquIHr8/
 p1q4c3hLV0VTtPBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AFBC139DB;
 Wed, 22 Feb 2023 16:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xIOnBUU+9mNKRQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Feb 2023 16:09:41 +0000
Message-ID: <8f4a18d7-3477-5af0-605d-27098cc7e02c@suse.de>
Date: Wed, 22 Feb 2023 17:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/msm: return early when allocating fbdev fails
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, javierm@redhat.com
References: <20230222155649.2001467-1-trix@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230222155649.2001467-1-trix@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SQ90Z4oS8ujHiGUv24PFSrcn"
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SQ90Z4oS8ujHiGUv24PFSrcn
Content-Type: multipart/mixed; boundary="------------F5IVgm3PBZcllElL50P0fLmj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tom Rix <trix@redhat.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, javierm@redhat.com
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Message-ID: <8f4a18d7-3477-5af0-605d-27098cc7e02c@suse.de>
Subject: Re: [PATCH] drm/msm: return early when allocating fbdev fails
References: <20230222155649.2001467-1-trix@redhat.com>
In-Reply-To: <20230222155649.2001467-1-trix@redhat.com>

--------------F5IVgm3PBZcllElL50P0fLmj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDIuMjMgdW0gMTY6NTYgc2NocmllYiBUb20gUml4Og0KPiBidWlsZGlu
ZyB3aXRoIGNsYW5nIGFuZCBXPTEgcmVwb3J0cw0KPiBkcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9mYmRldi5jOjE0NDo2OiBlcnJvcjogdmFyaWFibGUgJ2hlbHBlcicgaXMgdXNlZA0KPiAg
ICB1bmluaXRpYWxpemVkIHdoZW5ldmVyICdpZicgY29uZGl0aW9uIGlzIHRydWUgWy1XZXJy
b3IsLVdzb21ldGltZXMtdW5pbml0aWFsaXplZF0NCj4gICAgaWYgKCFmYmRldikNCj4gICAg
ICAgIF5+fn5+fg0KPiANCj4gaGVscGVyIGlzIG9ubHkgaW5pdGlhbGl6ZWQgYWZ0ZXIgZmJk
ZXYgc3VjY2VlZHMsIHNvIGlzIGluIGEgZ2FyYmFnZSBzdGF0ZSBhdA0KPiB0aGUgZmFpbDog
bGFiZWwuICBUaGVyZSBpcyBub3RoaW5nIHRvIHVud2luZGVkIGlmIGZiZGV2IGFsbG9hY3Rp
b24gZmFpbHMsDQo+IHJldHVybiBOVUxMLg0KPiANCj4gRml4ZXM6IDNmYjFmNjJmODBhMSAo
ImRybS9mYi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgpIGZyb20g
ZHJtX2ZiX2hlbHBlcl9maW5pKCkiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBUb20gUml4IDx0cml4
QHJlZGhhdC5jb20+DQoNCkFscmVhZHkgZml4ZWQgaGVyZTogDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9kcmktZGV2ZWwvMDhlMzM0MGUtYjQ1OS0wZTYwLTRiYmEtMzA3MTZiNjc1ZTA1
QHN1c2UuZGUvVC8jdA0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2ZiZGV2LmMNCj4gaW5kZXggYzgwNGU1YmE2ODJhLi5jMTM1NmFmZjg3ZGEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYw0KPiBAQCAtMTQyLDcgKzE0Miw3IEBAIHN0
cnVjdCBkcm1fZmJfaGVscGVyICptc21fZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQ0KPiAgIA0KPiAgIAlmYmRldiA9IGt6YWxsb2Moc2l6ZW9mKCpmYmRldiksIEdGUF9L
RVJORUwpOw0KPiAgIAlpZiAoIWZiZGV2KQ0KPiAtCQlnb3RvIGZhaWw7DQo+ICsJCXJldHVy
biBOVUxMOw0KPiAgIA0KPiAgIAloZWxwZXIgPSAmZmJkZXYtPmJhc2U7DQo+ICAgDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------F5IVgm3PBZcllElL50P0fLmj--

--------------SQ90Z4oS8ujHiGUv24PFSrcn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP2PkQFAwAAAAAACgkQlh/E3EQov+D+
MxAAzTy/dxFBP/tdwP5qdKJiLkKg2qI9ibBnpvteu2RH+tvtKysCWjqiuD2tl14FL28VWIEUBeJg
d/LXLgRJpur5Ea+ZlKxpx33PRzQxGVOUzSatngJqv1SPQ5N0zBNRqz7gyJV717c01jh1RnfpnYSa
osUP9kTsuR+dSqwWBZM7iCeUuA/3NCFS7o2eQhVkTh1BaaRV4lUNLnfYTClRwuseL1Uazu6SY9L1
rD/GUJuU/yOyAzChBCf8ebC/9NlOon+nsaciVZifrl3NqgPYVLmKZSErCvK206bjefhlZrvSfho+
WgPbDS63kTY82Tft9wgDyvDILzYUhNOgaCj57W2PcJlzxyHXWXycJkC8KZMyLY13PHxFG6gnOS/6
wqf7LThkQRjhNbYMch6c0PSm9uVomgU2jwCwgG4+CBESj3/K8dsG0/Ne0Y5g77k048/EZKezvZSw
l2jLjZSWrXuGKfWyjKvFqz/fs2oPPsBASbKqgO2buNpD8LBJWdfksflz/9xCdSODRM8SNyZW3Q5d
eNhJq6kpBEsFywfkNnDxAiLYfp1npn2zV0cUVxNf9XsKBoNyCUx+52eEme88o4I2/XlVOV94nErW
8yEja6NsWMw7dy4JjlqYuSELN+rFToy2qJkomeKal6esXCHjKkTqYMuW/GGpNL2ajsUgJ2XuEoQM
8+8=
=Gind
-----END PGP SIGNATURE-----

--------------SQ90Z4oS8ujHiGUv24PFSrcn--

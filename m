Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B37505DF5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 20:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945E810E119;
	Mon, 18 Apr 2022 18:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0981810E119
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 18:25:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E1271F37C;
 Mon, 18 Apr 2022 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650306337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4EwY29FNQNA6aBvOHivkDZQn0CsW++lPET3NmVjoro=;
 b=BMLITiTV73pS00hiFGRnxXcsRP+PpG9qqrxXKt1ipaGM4ZC9gWBEzMMfGuDFCGB5A3yvNE
 82TynsA4kr4VXLM/nUiNSnjqXtAi4AWbAxTz/ZRvM4pbGbUe7BytiYycA99PqZnQmzZa3T
 P0Etn+tkxmqlQ4rVuvfMAt6+CprhdlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650306337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4EwY29FNQNA6aBvOHivkDZQn0CsW++lPET3NmVjoro=;
 b=TvTpNdTSWSgjWQM0G4P4gRnni7WKoPOUVE+RQdtjt9cRpeQQi0fYIe0V7k5BXsMtAIuatz
 fVoCKWmxfabAwKCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BB2F13A9B;
 Mon, 18 Apr 2022 18:25:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6PsWASGtXWINfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Apr 2022 18:25:37 +0000
Message-ID: <eefe5120-638a-40bc-5ed8-e26defe178ca@suse.de>
Date: Mon, 18 Apr 2022 20:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 09/15] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-10-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220417223707.157113-10-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------07hn0Cfk6pNM1eBTgzCdqQwC"
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------07hn0Cfk6pNM1eBTgzCdqQwC
Content-Type: multipart/mixed; boundary="------------NpYd0XFriQtT3lTaA0437n4Q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eefe5120-638a-40bc-5ed8-e26defe178ca@suse.de>
Subject: Re: [PATCH v4 09/15] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-10-dmitry.osipenko@collabora.com>
In-Reply-To: <20220417223707.157113-10-dmitry.osipenko@collabora.com>

--------------NpYd0XFriQtT3lTaA0437n4Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDQuMjIgdW0gMDA6Mzcgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IGRybV9nZW1fc2htZW1fZ2V0X3NnX3RhYmxlKCkgbmV2ZXIgcmV0dXJucyBOVUxMIG9uIGVy
cm9yLCBidXQgYSBFUlJfUFRSLg0KPiBDb3JyZWN0IHRoZSBkb2MgY29tbWVudCB3aGljaCBz
YXlzIHRoYXQgaXQgcmV0dXJucyBOVUxMIG9uIGVycm9yLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCg0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwg
NSArKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0K
PiBpbmRleCA4YWQwZTAyOTkxY2EuLjMwZWU0NjM0OGE5OSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4gQEAgLTY2Miw3ICs2NjIsNyBAQCBF
WFBPUlRfU1lNQk9MKGRybV9nZW1fc2htZW1fcHJpbnRfaW5mbyk7DQo+ICAgICogZHJtX2dl
bV9zaG1lbV9nZXRfcGFnZXNfc2d0KCkgaW5zdGVhZC4NCj4gICAgKg0KPiAgICAqIFJldHVy
bnM6DQo+IC0gKiBBIHBvaW50ZXIgdG8gdGhlIHNjYXR0ZXIvZ2F0aGVyIHRhYmxlIG9mIHBp
bm5lZCBwYWdlcyBvciBOVUxMIG9uIGZhaWx1cmUuDQo+ICsgKiBBIHBvaW50ZXIgdG8gdGhl
IHNjYXR0ZXIvZ2F0aGVyIHRhYmxlIG9mIHBpbm5lZCBwYWdlcyBvciBlcnJubyBvbiBmYWls
dXJlLg0KDQonLCBvciBhbiBFUlJfUFRSKCktZW5jb2RlZCBlcnJubyBjb2RlIG9uIGZhaWx1
cmUnDQoNCj4gICAgKi8NCj4gICBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1fc2htZW1fZ2V0
X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0pDQo+ICAgew0K
PiBAQCAtNjg4LDcgKzY4OCw4IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGRybV9nZW1fc2htZW1f
Z2V0X3NnX3RhYmxlKTsNCj4gICAgKiBkcm1fZ2VtX3NobWVtX2dldF9zZ190YWJsZSgpIHNo
b3VsZCBub3QgYmUgZGlyZWN0bHkgY2FsbGVkIGJ5IGRyaXZlcnMuDQo+ICAgICoNCj4gICAg
KiBSZXR1cm5zOg0KPiAtICogQSBwb2ludGVyIHRvIHRoZSBzY2F0dGVyL2dhdGhlciB0YWJs
ZSBvZiBwaW5uZWQgcGFnZXMgb3IgZXJybm8gb24gZmFpbHVyZS4NCj4gKyAqIEEgcG9pbnRl
ciB0byB0aGUgc2NhdHRlci9nYXRoZXIgdGFibGUgb2YgcGlubmVkIHBhZ2VzIEVSUl9QVFIo
KS1lbmNvZGVkDQoNCicsIG9yIGFuJyBiZWZvcmUgRVJSX1BUUg0KDQpXaXRoIHRoZSBpbXBy
b3ZlZCBncmFtbWFyOg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQoNCg0KPiArICogZXJyb3IgY29kZSBvbiBmYWlsdXJlLg0KPiAgICAq
Lw0KPiAgIHN0cnVjdCBzZ190YWJsZSAqZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KHN0
cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0pDQo+ICAgew0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------NpYd0XFriQtT3lTaA0437n4Q--

--------------07hn0Cfk6pNM1eBTgzCdqQwC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJdrR8FAwAAAAAACgkQlh/E3EQov+C7
NQ//QTm5cEWnSqUqF8Mf7LCZiWyR0eyj2qiqi7ZZfWSSu5i9ILLUL+Eq0aSGB5ubhTi95GxyDdt+
x0/ibBkBWgPE79kTHAd/nFQ8I4paRzZAsmuyq0Arudfib8lWszoQrN3TtVSmMcXOI7F+pduj+tyt
zI+wz687GKx0J7/7gvGWNx8O7lrYnNfsGhJxJ4PAiqab0Mc2uqZXqP2s4LvDWKCldIM6Nnaj79bJ
1tTWrto7Kayok8uXXWQ7b5KdTaClQKnb5/x1zH/l0a2v6SQFPIL3M6rLG7ImYjP64abNh9QBvNyp
31pFE2JWt0ff6TX2kabe9FoTRZza5lumxXioag4Un92IzPUXO6KrWB7+Jc6wbfCgzmwD49ax8Aj5
rMkFWG+LOgZ425j0WFo/sZOF4AKoY/vkPh+pXXJeoPzhVRPcfdRAVniGajCOaj8zS4dX0sg9PQ8N
TkIuv1c7PzpUZELnhbzhsF3pCz83fzcaKH58cAOCYqfSVAblFUQVFoMkjJsMkFXxTAHFarQtJlHT
gFsrAAqz9eJ3k8YLGpL5FNwXAS9NfPSs/yxZmW2ujIft8iUKjO+8k11BZbY3EQMD2HufsCSnNedf
JTCfqI8YNd3DugfASbp9PKd4SoOAHUIwMruT6aAqFF2lsaH/SkVsJJecBi2bQJGAkOeKLR++kPwi
5zI=
=W7Nd
-----END PGP SIGNATURE-----

--------------07hn0Cfk6pNM1eBTgzCdqQwC--

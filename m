Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B894E5ACDF0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C2210E231;
	Mon,  5 Sep 2022 08:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270AF10E223
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:44:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C70F1387C5;
 Mon,  5 Sep 2022 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662367465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j7usgTfA1btXrq89Yj/ii8Ydn7Gr0Xo1K2e0veaoIw0=;
 b=brbVRbGvLtio6HMA3cCeYwmmJBRKmEAkoEZuIFZbBI9iVnWS4RLo6TRdJ5lc/5WK8wRyT0
 s7KP0XVVhIqTkSJHDc/KJpg9wW/fXXjlrXBAeObcYNzf+qGsxrXHF3E+R6+GFXR58vfdz+
 vlLYizg+7+rUFC4uclAQIDXVHNvu+yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662367465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j7usgTfA1btXrq89Yj/ii8Ydn7Gr0Xo1K2e0veaoIw0=;
 b=RMuC/3jY0JLVueuy3a+/T8VCEYK6oNi5sXANoh8SwA+6RzMX2thKiq8DCUrbb1KpBPlzN2
 gC+L++Ml3ywcfvDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADF8A139C7;
 Mon,  5 Sep 2022 08:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uZNhKem2FWN4FAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 08:44:25 +0000
Message-ID: <d3a0faf3-14ae-04a7-affe-4cd64570855f@suse.de>
Date: Mon, 5 Sep 2022 10:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 12/12] drm/udl: Sync pending URBs at the end of suspend
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-13-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220816153655.27526-13-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GOSHhmf3TQiCYjOpO0DqF5dI"
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
--------------GOSHhmf3TQiCYjOpO0DqF5dI
Content-Type: multipart/mixed; boundary="------------9IvtvQQ09kJK3IC5cW1xfClR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <d3a0faf3-14ae-04a7-affe-4cd64570855f@suse.de>
Subject: Re: [PATCH 12/12] drm/udl: Sync pending URBs at the end of suspend
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-13-tiwai@suse.de>
In-Reply-To: <20220816153655.27526-13-tiwai@suse.de>

--------------9IvtvQQ09kJK3IC5cW1xfClR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDguMjIgdW0gMTc6MzYgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEl0
J3MgYmV0dGVyIHRvIHBlcmZvcm0gdGhlIHN5bmMgYXQgdGhlIHZlcnkgbGFzdCBvZiB0aGUg
c3VzcGVuZA0KPiBpbnN0ZWFkIG9mIHRoZSBwaXBlLWRpc2FibGUgZnVuY3Rpb24sIHNvIHRo
YXQgd2UgY2FuIGNhdGNoIGFsbCBwZW5kaW5nDQo+IFVSQnMgKGlmIGFueSkuDQo+IA0KPiBX
aGlsZSB3ZSdyZSBhdCBpdCwgZHJvcCB0aGUgZXJyb3IgY29kZSBmcm9tIHVkbF9zeW5jX3Bl
bmRpbmdfdXJiKCkNCj4gc2luY2Ugd2UgYmFzaWNhbGx5IGlnbm9yZSBpdDsgaW5zdGVhZCwg
Z2l2ZSBhIGNsZWFyIGVycm9yIG1lc3NhZ2UNCj4gaW5kaWNhdGluZyBhIHByb2JsZW0uDQoN
CkJ1dCBpZiB3ZSBmYWlsLCBzaG91bGRuJ3Qgd2UgcmVwb3J0IHRoYXQgZXJyb3IgdG8gdGhl
IGNhbGxlciBvZiB0aGUgDQpzdXNwZW5kIGZ1bmN0aW9uPw0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2Uu
ZGU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jICAgICB8IDgg
KysrKysrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAgICAgfCAyICst
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jICAgIHwgNiArKy0tLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAyIC0tDQo+ICAgNCBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZHJ2LmMNCj4gaW5kZXggMGJhODhlNTQ3MmE5Li45MWVmZmRjZWZiNmQg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jDQo+IEBAIC0yMSw4ICsyMSwxNCBAQCBz
dGF0aWMgaW50IHVkbF91c2Jfc3VzcGVuZChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJm
YWNlLA0KPiAgIAkJCSAgIHBtX21lc3NhZ2VfdCBtZXNzYWdlKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiA9IHVzYl9nZXRfaW50ZmRhdGEoaW50ZXJmYWNlKTsNCj4g
KwlpbnQgcmV0Ow0KPiAgIA0KPiAtCXJldHVybiBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1
c3BlbmQoZGV2KTsNCj4gKwlyZXQgPSBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1c3BlbmQo
ZGV2KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJdWRsX3N5
bmNfcGVuZGluZ191cmJzKGRldik7DQo+ICsJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAg
IHN0YXRpYyBpbnQgdWRsX3VzYl9yZXN1bWUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVy
ZmFjZSkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgNCj4gaW5kZXggZDk0MzY4NGI1YmJiLi5i
NGNjN2NjNTY4YzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Ry
di5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oDQo+IEBAIC03Nyw3
ICs3Nyw3IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yICp1ZGxfY29ubmVjdG9yX2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgc3RydWN0IHVyYiAqdWRsX2dldF91cmIoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgDQo+ICAgaW50IHVkbF9zdWJtaXRfdXJiKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCB1cmIgKnVyYiwgc2l6ZV90IGxlbik7DQo+
IC1pbnQgdWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0K
PiArdm9pZCB1ZGxfc3luY19wZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldik7
DQo+ICAgdm9pZCB1ZGxfdXJiX2NvbXBsZXRpb24oc3RydWN0IHVyYiAqdXJiKTsNCj4gICAN
Cj4gICBpbnQgdWRsX2luaXQoc3RydWN0IHVkbF9kZXZpY2UgKnVkbCk7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9tYWluLmMNCj4gaW5kZXggYzFmNGI2MTk5OTQ5Li5kZjkyZjY1MThlMWMgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gQEAgLTI5NCwxMCArMjk0LDkgQEAg
aW50IHVkbF9zdWJtaXRfdXJiKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCB1cmIg
KnVyYiwgc2l6ZV90IGxlbikNCj4gICB9DQo+ICAgDQo+ICAgLyogd2FpdCB1bnRpbCBhbGwg
cGVuZGluZyBVUkJzIGhhdmUgYmVlbiBwcm9jZXNzZWQgKi8NCj4gLWludCB1ZGxfc3luY19w
ZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gK3ZvaWQgdWRsX3N5bmNf
cGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAgew0KPiAgIAlzdHJ1
Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7DQo+IC0JaW50IHJldCA9IDA7DQo+
ICAgDQo+ICAgCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4gICAJLyogMiBz
ZWNvbmRzIGFzIGEgc2FuZSB0aW1lb3V0ICovDQo+IEBAIC0zMDUsOSArMzA0LDggQEAgaW50
IHVkbF9zeW5jX3BlbmRpbmdfdXJicyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAkJ
CQkJIHVkbC0+dXJicy5hdmFpbGFibGUgPT0gdWRsLT51cmJzLmNvdW50LA0KPiAgIAkJCQkJ
IHVkbC0+dXJicy5sb2NrLA0KPiAgIAkJCQkJIG1zZWNzX3RvX2ppZmZpZXMoMjAwMCkpKQ0K
PiAtCQlyZXQgPSAtRVRJTUVET1VUOw0KPiArCQlkcm1fZXJyKGRldiwgIlRpbWVvdXQgZm9y
IHN5bmNpbmcgcGVuZGluZyBVUkJzXG4iKTsNCj4gICAJc3Bpbl91bmxvY2tfaXJxKCZ1ZGwt
PnVyYnMubG9jayk7DQo+IC0JcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+ICAgaW50IHVk
bF9pbml0KHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9t
b2Rlc2V0LmMNCj4gaW5kZXggYmNhMzFjODkwMTA4Li45ZDcyMjg4ZDk5NjcgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4gQEAgLTM5MSw4ICszOTEsNiBAQCB1
ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9kaXNhYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3Bs
YXlfcGlwZSAqcGlwZSkNCj4gICAJYnVmID0gdWRsX2R1bW15X3JlbmRlcihidWYpOw0KPiAg
IA0KPiAgIAl1ZGxfc3VibWl0X3VyYihkZXYsIHVyYiwgYnVmIC0gKGNoYXIgKil1cmItPnRy
YW5zZmVyX2J1ZmZlcik7DQo+IC0NCj4gLQl1ZGxfc3luY19wZW5kaW5nX3VyYnMoZGV2KTsN
Cj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------9IvtvQQ09kJK3IC5cW1xfClR--

--------------GOSHhmf3TQiCYjOpO0DqF5dI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVtukFAwAAAAAACgkQlh/E3EQov+B5
CRAAje/yTmXwT0sEzGSTv+RbVrlDmRiDX3YmKkxjt9lCNBDs1kousCHVolWAI4UyWq1xpwEQguNL
6EUFJ+5r+zYv+lep4y0bkNcoyk2iKqgm5KelX9tVj2hnpb5dz7f43UDTj49LrkAgFZMzn5Ly9R+B
vtRpmieGYuErzkj5znaKpEKuQ35TWMb7UchbmYgUgQmqGVEFD23UB32aLSXaZxjPkhSDkN5IqrCL
qOqhn6vG8wVWxA2Kb/c4DLmJOTZUhK8nUJIIrfkI+AmkZNOgPxgS6liliqKA2QUvrWB4IXDjrWjf
LuCBtaB5he26lIYh+rf3CeuXkQkQoMQXP4pRpgIbcngawWCtbNdEGVH1F3jwnGTjHFTQsDsibE2p
+2YYkFIHd/0HCC5W8Qn4/h1uz24tSXDjvAAL41aDeXeRYCClv38jlftYxCAE215zSjGsIwD7TEfz
64gpLGiBbEm9Qmd55cwcEDU96W7WJsdLizojo8RJf6Ds5c1IF5+NVHv08y+lpgWDaIKKH2R9XIuH
9ceRWTKsg8aiH9lB5FHhWoU+ZmWnm48k235XvUdFKIZ2ep36YsUtHOanzdPj6xq06xcpwVE3xpjk
ZNpLs/7FHAt2UJPq3eWoII7DLhjWVzfxtA6MHIDbggsIayUbijZpVcdCeTkorPEDzqQPJNYQYEBn
nOk=
=XfFn
-----END PGP SIGNATURE-----

--------------GOSHhmf3TQiCYjOpO0DqF5dI--

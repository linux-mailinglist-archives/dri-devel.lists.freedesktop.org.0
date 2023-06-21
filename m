Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFE737FAC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 12:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3281510E151;
	Wed, 21 Jun 2023 10:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1410E151
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 10:44:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D7BC1FDAD;
 Wed, 21 Jun 2023 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687344269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uKfVaC6JkeFcL/06eIzho6xSCCes9hNDXUsaPx8dW6k=;
 b=ojRLit9kPFy1zm5wZ/Jh0wxoR+XNjhCPsbX77o6gAfw5wL4WBB2xBH4bCRO31XNHReqqVb
 uaYC7UGMLTYlOVPhRvYM2gacvPib1bliuQPfgclqdunjhGG4BYerwhuFliljLM9SkuHOgk
 960FqrOR7kGKL8Wp5gbYvSL3sQ/A+Ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687344269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uKfVaC6JkeFcL/06eIzho6xSCCes9hNDXUsaPx8dW6k=;
 b=xff3U+YrR7TIGuaHffuc4XBvk1VA2WLAVoNHMNpE9xHS6NJkGtwAL28gnfkawrTsw9IN2/
 lZ4eGDxRqPkWO4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 050B8134B1;
 Wed, 21 Jun 2023 10:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R05fAI3UkmQXFgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 10:44:29 +0000
Message-ID: <5b87fb5c-2f23-47c9-b6a8-623472115876@suse.de>
Date: Wed, 21 Jun 2023 12:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/9] drm/verisilicon: Add gem driver for JH7110 SoC
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-5-keith.zhao@starfivetech.com>
 <f7ded369-e384-db01-dc8c-6a5183f20409@suse.de>
In-Reply-To: <f7ded369-e384-db01-dc8c-6a5183f20409@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------E3lpJV3O3OclE0b68k1BcyGT"
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Jagan Teki <jagan@edgeble.ai>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------E3lpJV3O3OclE0b68k1BcyGT
Content-Type: multipart/mixed; boundary="------------0TLCl8mGu0c1FRx96iB0uY6u";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jagan Teki <jagan@edgeble.ai>, Jack Zhu <jack.zhu@starfivetech.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Message-ID: <5b87fb5c-2f23-47c9-b6a8-623472115876@suse.de>
Subject: Re: [PATCH 4/9] drm/verisilicon: Add gem driver for JH7110 SoC
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-5-keith.zhao@starfivetech.com>
 <f7ded369-e384-db01-dc8c-6a5183f20409@suse.de>
In-Reply-To: <f7ded369-e384-db01-dc8c-6a5183f20409@suse.de>

--------------0TLCl8mGu0c1FRx96iB0uY6u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDYuMjMgdW0gMTY6MjIgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDAyLjA2LjIzIHVtIDA5OjQwIHNjaHJpZWIgS2VpdGggWmhhbzoN
Cj4+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBnZW0gcmVsYXRlZCBBUElzIGZvciBKSDcxMDAg
U29DLg0KPiANCj4gcGxlYXNlIGFsc28gc2VlIG15IG90aGVyIHJlcGx5IHRvIHRoaXMgcGF0
Y2guIE15IG1haWwgY2xpZW50IGhhZCBhIGJ1ZyANCj4gYmVmb3JlIEkgY291bGQgZmluaXNo
IGl0LiBCZWxvdyBhcmUgc29tZSBtb3JlIGNvbW1lbnRzLg0KPiANCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBLZWl0aCBaaGFvIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+DQo+PiAt
LS0NCj4gWy4uLl0NCj4+ICsjaWZuZGVmIF9fVlNfR0VNX0hfXw0KPj4gKyNkZWZpbmUgX19W
U19HRU1fSF9fDQo+PiArDQo+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4NCj4+ICsN
Cj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4NCj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9w
cmltZS5oPg0KPj4gKw0KPj4gKyNpbmNsdWRlICJ2c19kcnYuaCINCj4+ICsvKg0KPj4gKyAq
DQo+PiArICogQGJhc2U6IGRybSBnZW0gb2JqZWN0Lg0KPj4gKyAqIEBzaXplOiBzaXplIHJl
cXVlc3RlZCBmcm9tIHVzZXINCj4+ICsgKiBAY29va2llOiBjb29raWUgcmV0dXJuZWQgYnkg
ZG1hX2FsbG9jX2F0dHJzDQo+PiArICrCoMKgwqAgLSBub3Qga2VybmVsIHZpcnR1YWwgYWRk
cmVzcyB3aXRoIERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HDQo+PiArICogQGRtYV9hZGRy
OiBidXMgYWRkcmVzcyhhY2Nlc3NlZCBieSBkbWEpIHRvIGFsbG9jYXRlZCBtZW1vcnkgcmVn
aW9uLg0KPj4gKyAqwqDCoMKgIC0gdGhpcyBhZGRyZXNzIGNvdWxkIGJlIHBoeXNpY2FsIGFk
ZHJlc3Mgd2l0aG91dCBJT01NVSBhbmQNCj4+ICsgKsKgwqDCoCBkZXZpY2UgYWRkcmVzcyB3
aXRoIElPTU1VLg0KPj4gKyAqIEBkbWFfYXR0cnM6IGF0dHJpYnV0ZSBmb3IgRE1BIEFQSQ0K
Pj4gKyAqIEBnZXRfcGFnZXM6IGZsYWcgZm9yIG1hbnVhbGx5IGFwcGx5aW5nIGZvciBub24t
Y29udGlndW91cyBtZW1vcnkuDQo+PiArICogQHBhZ2VzOiBBcnJheSBvZiBiYWNraW5nIHBh
Z2VzLg0KPj4gKyAqIEBzZ3Q6IEltcG9ydGVkIHNnX3RhYmxlLg0KPj4gKyAqDQo+PiArICov
DQo+PiArc3RydWN0IHZzX2dlbV9vYmplY3Qgew0KPj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2dl
bV9vYmplY3TCoMKgwqAgYmFzZTsNCj4+ICvCoMKgwqAgc2l6ZV90wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzaXplOw0KPj4gK8KgwqDCoCB2b2lkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
Y29va2llOw0KPj4gK8KgwqDCoCBkbWFfYWRkcl90wqDCoMKgwqDCoMKgwqAgZG1hX2FkZHI7
DQo+PiArwqDCoMKgIHUzMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpb3ZhOw0K
Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nwqDCoMKgIGRtYV9hdHRyczsNCj4+ICvCoMKgwqAg
Ym9vbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2V0X3BhZ2VzOw0KPj4gK8KgwqDCoCBzdHJ1
Y3QgcGFnZcKgwqDCoMKgwqDCoMKgICoqcGFnZXM7DQo+PiArwqDCoMKgIHN0cnVjdCBzZ190
YWJsZSAqc2d0Ow0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGlubGluZQ0KPj4gK3N0cnVj
dCB2c19nZW1fb2JqZWN0ICp0b192c19nZW1fb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqKQ0KPj4gK3sNCj4+ICvCoMKgwqAgcmV0dXJuIGNvbnRhaW5lcl9vZihvYmosIHN0
cnVjdCB2c19nZW1fb2JqZWN0LCBiYXNlKTsNCj4+ICt9DQo+PiArDQo+PiArc3RydWN0IHZz
X2dlbV9vYmplY3QgKnZzX2dlbV9jcmVhdGVfb2JqZWN0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2l6ZV90IHNpemUpOw0KPj4gKw0KPj4gK2ludCB2c19nZW1fcHJpbWVfdm1hcChzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGlvc3lzX21hcCANCj4+ICptYXApOw0KPj4g
K3ZvaWQgdnNfZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwg
c3RydWN0IGlvc3lzX21hcCANCj4+ICptYXApOw0KPiANCj4gSSdkIGNvbnNpZGVyIHRoaXMg
YmFkIHN0eWxlLiBZb3VyIGZ1bmN0aW9ucyBhcmUgaW4gdGhlIHZzXyBuYW1lc3BhY2UsIHNv
IA0KPiB0aGV5IHNob3VsZCB0YWtlIGEgdnNfZ2VtX29iamVjdCBhcyBmaXJzdCBhcmd1bWVu
dC4gUmF0aGVyIGltcGxlbWVudCANCj4gdnNfZ2VtX3ByaW1lX3ZtYXAoc3RydWN0IHZzX2dl
bV9vYmplY3QgKnZzX29iaiwgc3RydWN0IGlvc3lzX21hcCAqbWFwKQ0KPiBhbmQgX3Z1bm1h
cCgpIGFuZCBfbW1hcCgpLg0KPiANCj4gRm9yIHRoZSBjYWxsYmFja3MgaW4gc3RydWN0IGRy
bV9nZW1vYmplY3RfZnVuY3MsIHlvdSBjYW4gd3JpdGUgc21hbGwgDQo+IHdyYXBwZXJzIGFy
b3VuZCB0aGUgaGVscGVycyB0byBkbyB0aGUgdHlwZSBjYXN0aW5nLiBTZWUgDQo+IGRybV9n
ZW1fc2htZW1fb2JqZWN0X21tYXAoKSBhbmQgZHJtX2dlbV9zaG1lbV9tbWFwKCkgZm9yIGFu
IGV4YW1wbGUuDQo+IA0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2luY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgjTDIzMw0KDQpJ
IHdhcyB0aGlua2luZyBhYm91dCBteSBhZHZpc2Ugd2l0aCB0aGUgd3JhcHBlcnMsIGJ1dCBp
dCBkb2Vzbid0IHNlZW0gc28gDQpnb29kIGFmdGVyIGFsbC4gTWF5YmUganVzdCBpZ25vcmUg
aXQuIEkgdGhpbmsgeW91IHNob3VsZCBzdGlsbCByZW5hbWUgDQp0aGUgZnVuY3Rpb24gdG8g
c29tZXRoaW5nIGxpa2UgdnNfZ2VtX29iamVjdF92bWFwKCksIGV0Yy4gIFNvIHRoZXkgbmFt
ZSANCnJlZmxlY3RzIHRoYXQgdGhleSBvcGVyYXRlIG9uIGEgc3RydWN0IGRybV9nZW1fb2Jq
ZWN0Lg0KDQpCdXQgbWFueSBvZiB0aGUgaGVscGVycyBpbiB0aGlzIGZpbGUgYXJlIG9ubHkg
ZXZlciB1c2VkIGluIHZzX2dlbS5jLiANCllvdSBzaG91bGQgZGVjbGFyZSB0aGVtIHN0YXRp
YyBpbiB0aGUgQyBmaWxlIGFuZCByZW1vdmUgdGhlbSBmcm9tIHRoaXMgDQpoZWFkZXIuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KPiANCj4+ICsNCj4+ICtpbnQgdnNf
Z2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOw0KPj4g
Kw0KPj4gK2ludCB2c19nZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3By
aXYsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9t
b2RlX2NyZWF0ZV9kdW1iICphcmdzKTsNCj4+ICsNCj4+ICtpbnQgdnNfZ2VtX21tYXAoc3Ry
dWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsNCj4+ICsNCj4+
ICtzdHJ1Y3Qgc2dfdGFibGUgKnZzX2dlbV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmopOw0KPj4gKw0KPj4gK3N0cnVjdCBkcm1fZ2VtX29iamVjdCAq
dnNfZ2VtX3ByaW1lX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfYnVm
ICpkbWFfYnVmKTsNCj4+ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKg0KPj4gK3ZzX2dlbV9w
cmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50
ICphdHRhY2gsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHNnX3RhYmxlICpzZ3QpOw0KPj4gKw0KPj4gKyNlbmRpZiAvKiBfX1ZTX0dFTV9IX18gKi8N
Cj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFz
c2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJl
dyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAo
QUcgTnVlcm5iZXJnKQ0K

--------------0TLCl8mGu0c1FRx96iB0uY6u--

--------------E3lpJV3O3OclE0b68k1BcyGT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSS1IwFAwAAAAAACgkQlh/E3EQov+BU
DxAAvNFbqmuRl+8x0Gbhtssj4+R3z3D+Ai8rXjZ2JPfd6/4LSoy5YyM5WX3HLD1U5nLAenDka2ke
drQRj6kzf3pJHD8ZsJhUKVgQSe5V3PDq4sB6YdIIpcEqpwZy8HABwOXhALnpbm25uypskQQ2hR7P
OPZnIdLGoRJcgipBpja7AXhylhBvz9A7o8DlLUeUOlF3Ymd2F0uAiSCcoXxbq5cE11EV8ml3Aejc
gmatc/K/6AKhDw/+SST0b8Gj28WGUov+uYVziNH9UKm35uM29zPWbLc2SdApRy073D7K82k5sLDM
LxKecNWwPl1wUBZtcgdqnPOP7W3ZDrpv49GVmRNZWSCRicf+r+58iPYZSIBotqsmV7Z4zfRvYBeg
dAIv7kYxQtd/8EnhXLeYs2aT5d3WSo0hXMMVTHGX+z24y8f2zgsL92sgSHhEVzfP2D6OVbG/iwJq
lGbvzfRYtdsKBG8s3LwALdCNST/Guxvy8K1s0rxH7VVlwYQ+THD0eRbRmtBwZVIzznLkbM5YQ9Me
nURdvkIoaD2zz7xtuu7WrifXr5dBlNlp8KBgV0vn+PqVx5zlH5094pHij9AByCIlVre4PLgjxyFl
GU97AGB+0t5r5doJ1btnsVDBe+j963TvrekRTDZNfTZGBUTSuVWq1ToeWEfIR7oYiADutizlo5de
M9o=
=Dna4
-----END PGP SIGNATURE-----

--------------E3lpJV3O3OclE0b68k1BcyGT--

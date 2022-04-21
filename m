Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EFD509BDE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 11:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5D110F4E8;
	Thu, 21 Apr 2022 09:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928E689144
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 09:13:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C88C1F753;
 Thu, 21 Apr 2022 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650532399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HAfPGJ8FGW+PIQe19iW2k1VoU2XisqwLSHRwJUfxQw=;
 b=VrHESd1gFH6ddp4+PdS53IFB2GUri2YmtgnBtEh05mWni5l8NVdovhs1WDGRBoQlXwWcoN
 goliUpTYV0GxD/H1cGFftI6YjUUJKWNLAot7Jx1oSx/B8Jx2/EsTnLp++pwkT7QwnHsoXh
 QQaMEtVc7TxHHQgkjL9ncoNrZtHs170=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650532399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HAfPGJ8FGW+PIQe19iW2k1VoU2XisqwLSHRwJUfxQw=;
 b=IOAdiIk7idHZEJN8wB5+9GmKgL2SgAvaJuiGmWLNcykw0mjOtqjNYlV6LrnL7HCJt9KUUn
 xriDel3JZkjAbpCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0290613446;
 Thu, 21 Apr 2022 09:13:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9cMrOy4gYWIyPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 09:13:18 +0000
Message-ID: <dec16771-03da-2c49-ae53-9cb49d64c761@suse.de>
Date: Thu, 21 Apr 2022 11:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
 <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------em5EsxMlkAyKG1ppeutUVrsD"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------em5EsxMlkAyKG1ppeutUVrsD
Content-Type: multipart/mixed; boundary="------------2Q0oj1gwr0coM6wk00Pm9YF0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-ID: <dec16771-03da-2c49-ae53-9cb49d64c761@suse.de>
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
 <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
In-Reply-To: <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>

--------------2Q0oj1gwr0coM6wk00Pm9YF0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjIgdW0gMTA6MzQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyMS4wNC4yMiB1bSAxMDozMCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
KFJlc2VuZGluZywgYXMgc29tZSBNTHMgZGlkbid0IGxpa2UgdGhlIHNpemUgb2YgdGhlIG9y
aWduaW5hbCBtYWlsLikNCj4+DQo+PiBIaSwNCj4+DQo+PiB0aGFua3MgZm9yIHlvdXIgc3Vi
bWlzc2lvbi4gU29tZSBnZW5lcmFsIGNvbW1lbnRzOg0KPj4NCj4+IMKgICogc29tZSBmdW5j
dGlvbnMgYXJlIHByZWZpeGVkIHdpdGggZGxhXywgb3RoZXJzIHVzZSBudmRsYV8uIEl0IHNl
ZW1zIA0KPj4gYXJiaXRyYXJ5IHRvIG1lLiBQbGVhc2UgdXNlIG52ZGxhXyBjb25zaXN0ZW50
bHkgdGhyb3VnaG91dCB0aGUgc291cmNlIA0KPj4gY29kZS4NCj4+DQo+PiDCoCAqIEZvciBy
ZXBvcnRpbmcgZXJyb3JzLCBwbGVhc2UgdXNlIGRybV9lcnIoKSwgZHJtX3dhcm4oKSwgZXRj
LiBJIA0KPj4gc3VnZ2VzdCB0byByZWFycmFuZ2UgdGhlIGVycm9yIG1lc3NhZ2VzIHRvIG5v
dCBiZSBsb2NhdGVkIGluIHRoZSANCj4+IGlubmVybW9zdCBmdW5jdGlvbnMuDQo+IA0KPiBJ
ZiB5b3UgcGxhbiB0byBoYXZlIG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGUgZHJpdmVyIGxv
YWRlZCBhdCB0aGUgc2FtZSANCj4gdGltZSwgdXNpbmcgZHJtX2Rldl9lcnIoKSwgZHJtX2Rl
dl93YXJuKCkgZXRjLi4gd291bGQgYmUgZXZlbiBiZXR0ZXIuDQoNCkkgdGhvdWdodCB0aGF0
IHRoZXNlIGZ1bmN0aW9ucyBleGlzdCwgYnV0IGxvb2tpbmcgZm9yIHRoZW0gbm93IEkgY2Fu
bm90IA0KZmluZCB0aGVtLiBUaGUgbWFjcm9zIERSTV9ERVZfRVJSKCksIGV0YyBhcmUgZGVw
cmVjYXRlZC4NCg0KPiANCj4gQlRXOiBJJ20gc3RpbGwgYWJzb2x1dGVseSBub3Qga2VlbiB0
byBlbmZvcmNpbmcgZHJtXyogbG9nIGZ1bmN0aW9ucy4gU28gDQo+IGlmIHlvdSBwcmVmZXIg
dG8gc3RpY2sgd2l0aCBwcl9lcnIoKSBhbmQgZGV2X2VycigpIHdlIGNvdWxkIGRpc2N1c3Mg
dGhhdCANCj4gb25jZSBtb3JlLg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPiAN
Cj4+DQo+PiDCoCAqIENvdWxkIHlvdSBwbGVhc2Ugc3BsaXQgdGhpcyBwYXRjaCBpbnRvIHNt
YWxsZXIgcGllY2VzPyBJdCANCj4+IGN1cnJlbnRseSBoaXRzIHNpemUgbGltaXRzIG9mIHNv
bWUgbWFpbGluZyBsaXN0cy4gTWF5YmUgYWRkIHRoZSANCj4+IHJlZ2lzdGVyIGNvbnN0YW50
cyBzZXBhcmF0ZWx5Lg0KPj4NCj4+IFBsZWFzZSBmaW5kIG1vcmUgcmV2aWV3IGNvbW1lbnRz
IGJlbG93LiBJdCdzIG5vdCBhIGZ1bGwgcmV2aWV3LCBidXQgYXQgDQo+PiBsZWFzdCBzb21l
dGhpbmcgdG8gc3RhcnQgd2l0aC4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------2Q0oj1gwr0coM6wk00Pm9YF0--

--------------em5EsxMlkAyKG1ppeutUVrsD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJhIC4FAwAAAAAACgkQlh/E3EQov+Dr
6Q/+PSFd8QFsLqjfmSsjy/518keTcjlAeHgL0M3HiDB7W4rEYKTwcWRqcSSddOgVJXI42aVvnL8z
lCeQoB7FR0e/hOscAuBoOJa3WiKe9bBuB5f+r+OQITe0NGQiQd4twjDrwDtiSJMOQMN83YzkXMBN
Q4uZfUIMU5/0H/wLV+jc6bLhCe3lfnXl/aReisOoRZLNqJwC9xL3uG4V1nKOIsZM+z2VI37lqCs0
rHSO9MWGB7mlk8CklJt+ArRRgaRkXREkHSMbR/mQHEA1MyTC8HlKb1uLJamclMgiYJhysttqSduv
7xPR3aSCe3TFJDImvK5sgAM/8rAlt/CoeumusjA51Ukhaj6MkukQoPRBLT/in7HqiPvKR5tUrjgD
jgvICOSzmocQ8MCnQ4cH6Dofs6wMEwGyxnA5fZ7/ZmtfeN9hHe9nm+CM+x+vIdG8A2SLbFUy1+S2
OtZOVjfKt7znDOciEbzeozU5SyqLCINPKbTJwqwCn/k3vsDF1dVNB21jyU4RCXhpMMnPBjmgw6d1
UyV/2pcnQEFoZy8quF3gvNEDlZZ9xyIL0KyO88ZcNUtJj9U3TOc/N5Lj9vHFtfvttcB6M/+XAyV9
LLU6DUEX2e5SsT8aLsLSaUlE8Ew1DYAQPuqAwGx6foH6tnIqZB8yCdA7CgzEXSi5TLaDIogoaYR0
Fww=
=Xvmf
-----END PGP SIGNATURE-----

--------------em5EsxMlkAyKG1ppeutUVrsD--

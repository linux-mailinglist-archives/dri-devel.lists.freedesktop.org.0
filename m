Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ADC57F65B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 20:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4AC95BE1;
	Sun, 24 Jul 2022 18:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6488095BDA
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 18:24:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E8A12201A5;
 Sun, 24 Jul 2022 18:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658687081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZg4O0zSXDNk/Ab3duwIptAuaTz2a3wJBWoDlN7lMOA=;
 b=WK2z31eAB+HZgmtlRzmjojawu+749PwZq6Nq2S7NHVjFg/qptaex/vn7Uk0qvWast29UkA
 yGV6shZU10raUNTnD4BRTDFLX3xL9cRLn6YIYQX3aE5ZKo7BSWU0W9f/lF8xsUDJ70UoNi
 +6yma9KN6UqdlqtkXr+QZdnqvvgq42s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658687081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZg4O0zSXDNk/Ab3duwIptAuaTz2a3wJBWoDlN7lMOA=;
 b=TmTHwHbYkMUECuv4g6pxudqU9cXyp1/vq65s1U6yTpkiPkH/URLELvCnrPnCvGhq7L8eFb
 XV8TYFeN2BpzEhAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C602413A91;
 Sun, 24 Jul 2022 18:24:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cJRDL2mO3WKgaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 24 Jul 2022 18:24:41 +0000
Message-ID: <e6ed25b0-49d2-7e3b-91e5-72e431310610@suse.de>
Date: Sun, 24 Jul 2022 20:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Prevent modeset helpers to access an uninitialized
 drm_mode_config
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220724123741.1268536-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220724123741.1268536-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D77JiePcBSv49U8zqVMSt374"
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
Cc: David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------D77JiePcBSv49U8zqVMSt374
Content-Type: multipart/mixed; boundary="------------9lpK2U77BUAvJqpPkkLLD0fD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e6ed25b0-49d2-7e3b-91e5-72e431310610@suse.de>
Subject: Re: [PATCH] drm: Prevent modeset helpers to access an uninitialized
 drm_mode_config
References: <20220724123741.1268536-1-javierm@redhat.com>
In-Reply-To: <20220724123741.1268536-1-javierm@redhat.com>

--------------9lpK2U77BUAvJqpPkkLLD0fD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDI0LjA3LjIyIHVtIDE0OjM3IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBEUk0gZHJpdmVycyBpbml0aWFsaXplIHRoZSBtb2RlIGNvbmZp
Z3VyYXRpb24gd2l0aCBkcm1tX21vZGVfY29uZmlnX2luaXQoKQ0KPiBhbmQgdGhhdCBmdW5j
dGlvbiAoYW1vbmcgb3RoZXIgdGhpbmdzKSBpbml0aWFsaXplcyBtdXRleGVzIHRoYXQgYXJl
IGxhdGVyDQo+IHVzZWQgYnkgbW9kZXNldCBoZWxwZXJzLg0KPiANCj4gQnV0IHRoZSBoZWxw
ZXJzIHNob3VsZCBvbmx5IGF0dGVtcHQgdG8gZ3JhYiB0aG9zZSBsb2NrcyBpZiB0aGUgbW9k
ZSBjb25maWcNCj4gd2FzIHByb3Blcmx5IGluaXRpYWxpemVkLiBPdGhlcndpc2UgaXQgY2Fu
IGxlYWQgdG8ga2VybmVsIG9vcHMuIEFuIGV4YW1wbGUNCj4gaXMgd2hlbiBhIERSTSBkcml2
ZXIgdXNpbmcgdGhlIGNvbXBvbmVudCBmcmFtZXdvcmsgZG9lcyBub3QgaW5pdGlhbGl6ZSB0
aGUNCj4gZHJtX21vZGVfY29uZmlnLCBiZWNhdXNlIGl0cyAuYmluZCBjYWxsYmFjayB3YXMg
bm90IGJlaW5nIGV4ZWN1dGVkIGR1ZSBvbmUNCj4gb2YgaXRzIGV4cGVjdGVkIHN1Yi1kZXZp
Y2VzJyBkcml2ZXIgZmFpbGluZyB0byBwcm9iZS4NCj4gDQo+IFNvbWUgZHJpdmVycyBjaGVj
ayB0aGUgc3RydWN0IGRybV9kcml2ZXIucmVnaXN0ZXJlZCBmaWVsZCBhcyBhbiBpbmRpY2F0
aW9uDQo+IG9uIHdoZXRoZXIgdGhlaXIgLnNodXRkb3duIGNhbGxiYWNrIHNob3VsZCBjYWxs
IGhlbHBlcnMgdG8gdGVhcm4gZG93biB0aGUNCj4gbW9kZSBjb25maWd1cmF0aW9uIG9yIG5v
dCwgYnV0IG1vc3QgZHJpdmVycyBqdXN0IGFzc3VtZSB0aGF0IGl0IGlzIGFsd2F5cw0KPiBz
YWZlIHRvIGNhbGwgaGVscGVycyBzdWNoIGFzIGRybV9hdG9taWNfaGVscGVyX3NodXRkb3du
KCkgZHVyaW5nIHNodXRkb3duLg0KPiANCj4gTGV0IG1ha2UgdGhlIERSTSBjb3JlIG1vcmUg
cm9idXN0IGFuZCBwcmV2ZW50IHRoaXMgdG8gaGFwcGVuLCBieSBtYXJraW5nIGENCj4gc3Ry
dWN0IGRybV9tb2RlX2NvbmZpZyBhcyBpbml0aWFsaXplZCBkdXJpbmcgZHJtbV9tb2RlX2Nv
bmZpZ19pbml0KCkuIHRoYXQNCj4gd2F5IGhlbHBlcnMgY2FuIGNoZWNrIGZvciBpdCBhbmQg
bm90IGF0dGVtcHQgdG8gZ3JhYiB1bmluaXRpYWxpemVkIG11dGV4ZXMuDQoNCkkgZGlzYWdy
ZWUuIFRoaXMgcGF0Y2ggbG9va3MgbGlrZSBjYXJnby1jdWx0IHByb2dyYW1taW5nIGFuZCBl
bnRpcmVseSANCmFyYml0cmFyeS4gIFRoZSBzb2x1dGlvbiBoZXJlIGlzIHRvIGZpeCBkcml2
ZXJzLiAgVGhlIGFjdHVhbCB0ZXN0IHRvIA0KcGVyZm9ybSBpcyB0byBpbnN0cnVtZW50IHRo
ZSBtdXRleCBpbXBsZW1lbnRhdGlvbiB0byBkZXRlY3QgDQp1bmluaXRpYWxpemVkIG11dGV4
ZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAtLS0NCj4g
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jICB8IDQgKysrKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXNldF9sb2NrLmMgfCA2ICsrKysrKw0KPiAgIGlu
Y2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICAgfCA4ICsrKysrKysrDQo+ICAgMyBm
aWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2RlX2NvbmZpZy5jDQo+IGluZGV4IDU5YjM0ZjA3Y2ZjZS4uZGI2NDlmOTcxMjBiIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+IEBAIC00NTYsNiArNDU2LDgg
QEAgaW50IGRybW1fbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0K
PiAgIAkJZG1hX3Jlc3ZfZmluaSgmcmVzdik7DQo+ICAgCX0NCj4gICANCj4gKwlkZXYtPm1v
ZGVfY29uZmlnLmluaXRpYWxpemVkID0gdHJ1ZTsNCj4gKw0KPiAgIAlyZXR1cm4gZHJtbV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZHJtX21vZGVfY29uZmlnX2luaXRfcmVsZWFzZSwN
Cj4gICAJCQkJCU5VTEwpOw0KPiAgIH0NCj4gQEAgLTU0OSw2ICs1NTEsOCBAQCB2b2lkIGRy
bV9tb2RlX2NvbmZpZ19jbGVhbnVwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAgCWlk
cl9kZXN0cm95KCZkZXYtPm1vZGVfY29uZmlnLnRpbGVfaWRyKTsNCj4gICAJaWRyX2Rlc3Ry
b3koJmRldi0+bW9kZV9jb25maWcub2JqZWN0X2lkcik7DQo+ICAgCWRybV9tb2Rlc2V0X2xv
Y2tfZmluaSgmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KTsNCj4gKw0KPiAr
CWRldi0+bW9kZV9jb25maWcuaW5pdGlhbGl6ZWQgPSBmYWxzZTsNCj4gICB9DQo+ICAgRVhQ
T1JUX1NZTUJPTChkcm1fbW9kZV9jb25maWdfY2xlYW51cCk7DQo+ICAgDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzZXRfbG9jay5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2Rlc2V0X2xvY2suYw0KPiBpbmRleCA5MTgwNjU5ODJkYjQuLmQ2YTgxY2I4
ODEyMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlc2V0X2xvY2su
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzZXRfbG9jay5jDQo+IEBAIC00
NDQsNiArNDQ0LDkgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZXNldF91bmxvY2spOw0KPiAg
ICAqDQo+ICAgICogU2VlIGFsc286IERSTV9NT0RFU0VUX0xPQ0tfQUxMX0JFR0lOKCkgYW5k
IERSTV9NT0RFU0VUX0xPQ0tfQUxMX0VORCgpDQo+ICAgICoNCj4gKyAqIFRoaXMgZnVuY3Rp
b24gbXVzdCBvbmx5IGJlIGNhbGxlZCBhZnRlciBkcm1tX21vZGVfY29uZmlnX2luaXQoKSwg
c2luY2UgaXQNCj4gKyAqIHRha2VzIGxvY2tzIHRoYXQgYXJlIGluaXRpYWxpemVkIGFzIHBh
cnQgb2YgdGhlIGluaXRpYWwgbW9kZSBjb25maWd1cmF0aW9uLg0KPiArICoNCj4gICAgKiBS
ZXR1cm5zOiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvci1jb2RlIG9uIGZhaWx1
cmUuDQo+ICAgICovDQo+ICAgaW50IGRybV9tb2Rlc2V0X2xvY2tfYWxsX2N0eChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LA0KPiBAQCAtNDU0LDYgKzQ1Nyw5IEBAIGludCBkcm1fbW9kZXNl
dF9sb2NrX2FsbF9jdHgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmU7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICsJaWYgKFdBUk5fT04o
IWRldi0+bW9kZV9jb25maWcuaW5pdGlhbGl6ZWQpKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gKw0KPiAgIAlyZXQgPSBkcm1fbW9kZXNldF9sb2NrKCZkZXYtPm1vZGVfY29uZmlnLmNv
bm5lY3Rpb25fbXV0ZXgsIGN0eCk7DQo+ICAgCWlmIChyZXQpDQo+ICAgCQlyZXR1cm4gcmV0
Ow0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggYi9pbmNs
dWRlL2RybS9kcm1fbW9kZV9jb25maWcuaA0KPiBpbmRleCA2YjVlMDEyOTUzNDguLmQyZTFh
NmQ3ZGNjMiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgN
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4gQEAgLTk1NCw2ICs5
NTQsMTQgQEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyB7DQo+ICAgCXN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdXNwZW5kX3N0YXRlOw0KPiAgIA0KPiAgIAljb25zdCBzdHJ1Y3QgZHJt
X21vZGVfY29uZmlnX2hlbHBlcl9mdW5jcyAqaGVscGVyX3ByaXZhdGU7DQo+ICsNCj4gKwkv
KioNCj4gKwkgKiBAaW5pdGlhbGl6ZWQ6DQo+ICsJICoNCj4gKwkgKiBJbnRlcm5hbGx5IHVz
ZWQgYnkgbW9kZXNldCBoZWxwZXJzIHN1Y2ggYXMgZHJtX21vZGVzZXRfbG9ja19hbGxfY3R4
KCkNCj4gKwkgKiB0byBkZXRlcm1pbmUgaWYgdGhlIG1vZGUgY29uZmlndXJhdGlvbiBoYXMg
YmVlbiBwcm9wZXJseSBpbml0aWFsaXplZC4NCj4gKwkgKi8NCj4gKwlib29sIGluaXRpYWxp
emVkOw0KPiAgIH07DQo+ICAgDQo+ICAgaW50IF9fbXVzdF9jaGVjayBkcm1tX21vZGVfY29u
ZmlnX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------9lpK2U77BUAvJqpPkkLLD0fD--

--------------D77JiePcBSv49U8zqVMSt374
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLdjmkFAwAAAAAACgkQlh/E3EQov+CQ
Rg/+Nl1yvZOhSU5TvkOZIW6QYboadZl3uL5V4uO+nLfX1tGe1OpXAuzHoheCbO585VezcM1lt9AK
Z7MWGdTLkXcbHGtGI8NEVTsvslUHW+zuOA2Xzzf7R/PoXJZ8fHgwNbeTTHrzg92H28MrVmONe6HF
53LlTJjdy3d1SIi5A4dDrVTjzES5vr2G4zfN6FxV3GaBYi37epkccOCCWY46+VejsjT9v9PYmOvk
n/4mXdO2BsmvGRTzuGCuXKTllL7ej0JUb8eUTXZg+TIF6HQyQeGq5Y4LAq1dfEbqVq/yDgtX7JWb
RkLSZ8+sUS9mETiPHPW9X3TNtqlwzPLHBucUWquN60qJMrBJLyjC5O5jqkeaLlYXzP8G9oi5RMCa
Ek7mbjVK64k8uzKn4s/tlPEca4Skhu3C6z45ERcADdzYi3tFfrkYuHgaDOmE5Hu9ec4W5cffWYVD
N1VejvK3sQjq9k423tdGCOpNsuaoFnwKzu0WIDIgaeYM+Z4VbeydB6YaQlaS64FR8vAr0rc59T7p
cvpNzcJf3G0IG3PonUNS8BKID63dfocj7yik0+3WjXAk3qjX46yoDYG4KAqZETmxBdxqvopohdAc
/PKWpXX3pig2f8x6x3XSQqgcHy6CRoUxW6RgrY9s9fPfBFz+A15B1fbjTZF7Y4OA/p0NqAkekloK
hiI=
=Tj2v
-----END PGP SIGNATURE-----

--------------D77JiePcBSv49U8zqVMSt374--

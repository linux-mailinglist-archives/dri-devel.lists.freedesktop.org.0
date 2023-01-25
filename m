Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E067B3F8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389310E7B9;
	Wed, 25 Jan 2023 14:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDCD10E7B9;
 Wed, 25 Jan 2023 14:11:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 883AC219F8;
 Wed, 25 Jan 2023 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674655904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yz5VDm1k5I1ztdBG/BHIBO00HvHLkqpo6yWiKf4vCQA=;
 b=bKIYw6zNUJM2ld5PHempeAxhOhFzotW5y1OJAO4xhfZfcwzST4FMbQqCkCoTbhjzuRuMTx
 v5rOtGQvFGAPaqVQ6Si99fJSBJixgKp4MHbl+xHiW+7F1PHQLHtHNwezaU4hso/diIcEVq
 6Nvv89lmlGabwOXirigD2MNqUI4Ds6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674655904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yz5VDm1k5I1ztdBG/BHIBO00HvHLkqpo6yWiKf4vCQA=;
 b=BjicCOzmJO6BeVd/DxXc3eJUAmSZ6QkNzrzWehhRaBtk1KcZ8W8P0Z5j9FnAI1WXpwTwyt
 jS1mbURNCbnC+WCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4323A1358F;
 Wed, 25 Jan 2023 14:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3LFjD6A40WNwQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 14:11:44 +0000
Message-ID: <511111fe-f228-b902-927e-271977b05201@suse.de>
Date: Wed, 25 Jan 2023 15:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/10] drm/fb-helper: Introduce
 drm_fb_helper_unprepare()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-4-tzimmermann@suse.de>
 <2a007c84-1dd6-ed8a-39ac-8c7c070513f3@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2a007c84-1dd6-ed8a-39ac-8c7c070513f3@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uhOt4lte6SCpXJgrHcNZJ5Kc"
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uhOt4lte6SCpXJgrHcNZJ5Kc
Content-Type: multipart/mixed; boundary="------------1xFZhqx0BfEL0gHwPWLPEDpU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <511111fe-f228-b902-927e-271977b05201@suse.de>
Subject: Re: [PATCH v2 03/10] drm/fb-helper: Introduce
 drm_fb_helper_unprepare()
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-4-tzimmermann@suse.de>
 <2a007c84-1dd6-ed8a-39ac-8c7c070513f3@redhat.com>
In-Reply-To: <2a007c84-1dd6-ed8a-39ac-8c7c070513f3@redhat.com>

--------------1xFZhqx0BfEL0gHwPWLPEDpU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDEuMjMgdW0gMTA6MTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDEvMjQvMjMgMTQ6NDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gTW92ZSB0aGUgZmItaGVscGVyIGNsZWFuLXVwIGNvZGUgaW50byBkcm1fZmJfaGVscGVy
X3VucHJlcGFyZSgpLiBObw0KPj4gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4NCj4+IHYyOg0K
Pj4gCSogZGVjbGFyZSBhcyBzdGF0aWMgaW5saW5lIChrZXJuZWwgdGVzdCByb2JvdCkNCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwg
MTQgKysrKysrKysrKysrKy0NCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oICAg
ICB8ICA1ICsrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4gaW5k
ZXggYzVjMTNlMTkyYjY0Li40Mzc5YmNkNzcxOGIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jDQo+PiBAQCAtNDM1LDYgKzQzNSwxOCBAQCB2b2lkIGRybV9mYl9oZWxw
ZXJfcHJlcGFyZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZiX2hlbHBl
ciAqaGVscGVyLA0KPj4gICB9DQo+PiAgIEVYUE9SVF9TWU1CT0woZHJtX2ZiX2hlbHBlcl9w
cmVwYXJlKTsNCj4+ICAgDQo+PiArLyoqDQo+PiArICogZHJtX2ZiX2hlbHBlcl91bnByZXBh
cmUgLSBjbGVhbiB1cCBhIGRybV9mYl9oZWxwZXIgc3RydWN0dXJlDQo+PiArICogQGZiX2hl
bHBlcjogZHJpdmVyLWFsbG9jYXRlZCBmYmRldiBoZWxwZXIgc3RydWN0dXJlIHRvIHNldCB1
cA0KPj4gKyAqDQo+PiArICogQ2xlYW5zIHVwIHRoZSBmcmFtZWJ1ZmZlciBoZWxwZXIuIElu
dmVyc2Ugb2YgZHJtX2ZiX2hlbHBlcl9wcmVwYXJlKCkuDQo+PiArICovDQo+PiArdm9pZCBk
cm1fZmJfaGVscGVyX3VucHJlcGFyZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVy
KQ0KPj4gK3sNCj4+ICsJbXV0ZXhfZGVzdHJveSgmZmJfaGVscGVyLT5sb2NrKTsNCj4+ICt9
DQo+IA0KPiBJIGxpa2UgdGhhdCB3ZSBoYXZlIGFuIF91bnByZXBhcmUgdGhhdCBpcyB0aGUg
aW52ZXJzZSBvZiB0aGUgX3ByZXBhcmUsIGJ1dA0KPiBzaW5jZSBpcyBvbmx5IGRlc3Ryb3lp
bmcgdGhlIG11dGV4LCBtYXliZSBpcyBhbiB1bm5lZWRlZCBpbmRpcmVjdGlvbiBsZXZlbD8N
Cj4gDQo+IE9yIGRvIHlvdSBwbGFuIHRvIGFkZCBtb3JlIGNsZWFudXAgdG8gdGhhdCBfdW5w
cmVwYXJlIGZ1bmN0aW9uPyBPdGhlcndpc2UgSQ0KPiB3b3VsZCBqdXN0IG1ha2UgaXQgYW4g
aW5saW5lIGZ1bmN0aW9uLg0KDQpUaGVyZSBjb3VsZCBwb3NzaWJseSBiZSBtb3JlOyBub3Qg
c3VyZSB5ZXQuIFdpdGggcGF0Y2ggMDQsIHRoZSBjYWxsIGlzIA0KYmVpbmcgaW52b2tlZCBm
cm9tIGRybV9mYmRldl9nZW5lcmljLmMuIEFuZCBJIGhhdmUgcHJvdG90eXBlIHBhdGNoZXMg
DQp0aGF0IGNvbnZlcnQgYSBudW1iZXIgb2YgZHJpdmVyLWludGVybmFsIGZiZGV2cyB0byB1
c2Ugc3RydWN0IA0KZHJtX2NsaWVudC4gVGhleSBhbGwgZm9sbG93IHRoZSBzYW1lIGRlc2ln
bi9zdHJ1Y3R1cmUvcGF0dGVybiB0aGF0IGlzIA0KYmVpbmcgbGF5ZWQgb3V0IGluIGdlbmVy
aWMtZmJkZXYgaW4gdGhpcyBwYXRjaHNldC4gSW4gdGhlIGVuZCANCmRybV9mYl9oZWxwZXJf
dW5wcmVwYXJlIHdpbGwgZGVmaW5pdGVseSBiZSBhIHB1YmxpYyBpbnRlcmZhY2Ugb2YgdGhl
IA0KZmJkZXYgaGVscGVycy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+ICtF
WFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKTsNCj4+ICsNCj4gDQo+IERv
ZXMgaXQgaGF2ZSB0byBiZSBhbiBleHBvcnRlZCBzeW1ib2w/IEFGQUlDVCB0aGUgb25seSB1
c2VyIGZvciBub3cgaXMgdGhlDQo+IGRybV9mYl9oZWxwZXJfZmluaSgpIGZ1bmN0aW9uLCBz
byB0aGUgZnVuY3Rpb24gY291bGQgYmUgYSBzdGF0aWMgaW5saW5lLg0KPiANCj4gWy4uLl0N
Cj4gDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oIGIvaW5j
bHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oDQo+PiBpbmRleCBmNDQzZTFmMTE2NTQuLjM5NzEw
YzU3MGEwNCAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0K
Pj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oDQo+PiBAQCAtMjMwLDYgKzIz
MCw3IEBAIGRybV9mYl9oZWxwZXJfZnJvbV9jbGllbnQoc3RydWN0IGRybV9jbGllbnRfZGV2
ICpjbGllbnQpDQo+PiAgICNpZmRlZiBDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTg0KPj4g
ICB2b2lkIGRybV9mYl9oZWxwZXJfcHJlcGFyZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBz
dHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLA0KPj4gICAJCQkgICBjb25zdCBzdHJ1Y3Qg
ZHJtX2ZiX2hlbHBlcl9mdW5jcyAqZnVuY3MpOw0KPj4gK3ZvaWQgZHJtX2ZiX2hlbHBlcl91
bnByZXBhcmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcik7DQo+PiAgIGludCBk
cm1fZmJfaGVscGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9m
Yl9oZWxwZXIgKmhlbHBlcik7DQo+PiAgIHZvaWQgZHJtX2ZiX2hlbHBlcl9maW5pKHN0cnVj
dCBkcm1fZmJfaGVscGVyICpoZWxwZXIpOw0KPj4gICBpbnQgZHJtX2ZiX2hlbHBlcl9ibGFu
ayhpbnQgYmxhbmssIHN0cnVjdCBmYl9pbmZvICppbmZvKTsNCj4+IEBAIC0yOTYsNiArMjk3
LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1fZmJfaGVscGVyX3ByZXBhcmUoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwNCj4+ICAgew0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBkcm1fZmJfaGVscGVyX3VucHJlcGFyZShzdHJ1Y3QgZHJtX2ZiX2hlbHBl
ciAqZmJfaGVscGVyKQ0KPj4gK3sNCj4+ICt9DQo+PiArDQo+IA0KPiBBbmQgeW91IHNob3Vs
ZCBiZSBhYmxlIHRvIHJlbW92ZSB0aGlzIHN0dWIgaWYgeW91IGxpbWl0IHRoZSBzY29wZSBv
ZiB0aGUgaGVscGVyLg0KPiANCj4gTm8gc3Ryb25nIG9waW5pb24gdGhvdWdoLiBTbyBpZiB5
b3UgcHJlZmVyIHRvIGtlZXAgaXQgYXMgaXMsIGZlZWwgZnJlZSB0byBhZGQ6DQo+IA0KPiBS
ZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5j
b20+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------1xFZhqx0BfEL0gHwPWLPEDpU--

--------------uhOt4lte6SCpXJgrHcNZJ5Kc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPROJ8FAwAAAAAACgkQlh/E3EQov+DU
gQ//VRXnT2/Muz4aNAJWKoqp2XtuHqq88l8DpoLVW70D9Hv+tAAhLBPmxf0l06H0timMiKd0hW6e
E37h1/oz5jaaWFTyfW6biLp8GRJOlse5nutdh6KzH4cgWyQLQIJIFyN3kwtUd7ei9n8bAWMUo1RM
td1NBOa+shzcHZlJvkWH5aiczHzTTlHEZNY9QpTKutnXK38ttSFHsy4n5D+n9p5FpfIIjp6vpv/3
w/hJwtrrVdBb8aobCgwNwFa2f+A5M4pJe37IXacyQFfgH31jEEBL9Cx0sFFXLQ9Q6Qto2ZbDFbXN
NArJqFuY8PyIWq/Dy6wGewEbEeWgOQGu6g44fYZd/+YB44RDpUlQsL6Tjx63i+0lRUuGt96FkVr7
5AwKkQeaIqUK6eW7pbMUjpJHW1OKniHu2rzzy28O+E2Uqyy62TBzmvkjfYMyL6QNhrwQTBgT7Kfw
TWJGMUmdsNwu14VVUnexT/Fc8pVNe3hIHKjdxSSNs2hObHJ0n+QbLpXJr4Xo+ujLvtNDa21sUQ1W
7AJFcBWQSBmSjjRxB2CrsST57yaoHUA5wftA2tA6T+Elx2FqPpQPJbHL4sWjZPiG/UGN/Pl696VL
aIG2ZwGUOIbiWO75NzoJOxv9xStlWzFJIVm/HLjZpDQoMT1XXOUXP/pv4WRyGuPaQHGcGrCK163u
3fA=
=kMJL
-----END PGP SIGNATURE-----

--------------uhOt4lte6SCpXJgrHcNZJ5Kc--

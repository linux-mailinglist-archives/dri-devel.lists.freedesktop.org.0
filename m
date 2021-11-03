Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0614442B8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 14:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AA96EA30;
	Wed,  3 Nov 2021 13:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC86E6EA30
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 13:53:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F9CD1FD39;
 Wed,  3 Nov 2021 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635947599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gM4dLBPOTeQI1BB/n11hAh/2S8YpTXPBOvo61fjPeEg=;
 b=t25td5EGa947F7lnRYCLGnhBZy8VdQUPZHJbrstIo2PFmhbIEAHTQysMmyBsQeYRAW1t8E
 jy6vbB8WNKTobtz/0YsQInqN0JjBwZpVusUu6on8WnDJeLd5Ltc+DzpsNvHPcub7ngrS4s
 ZHja9rQR6QzqDbWoo6UEZYKnQiGKXhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635947599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gM4dLBPOTeQI1BB/n11hAh/2S8YpTXPBOvo61fjPeEg=;
 b=t266EDuUB++mxHWrsAHY+LROHqQbgA00CrJSrWU+IeFcY4H1gZL0RItjM3aqxQjT88xVuc
 IB4ZMkbRFkEYEpCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BD8E13CA2;
 Wed,  3 Nov 2021 13:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v36+BU+UgmEBAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Nov 2021 13:53:19 +0000
Message-ID: <54aedf5a-34b1-15f6-47f1-39815b3832ae@suse.de>
Date: Wed, 3 Nov 2021 14:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RESEND PATCH 4/5] drm: Add a drm_drv_enabled() helper function
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20211103123206.1041442-1-javierm@redhat.com>
 <87o871bbmb.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87o871bbmb.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yhuKbyI95NPlaLrFk1VmGRle"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yhuKbyI95NPlaLrFk1VmGRle
Content-Type: multipart/mixed; boundary="------------cAMtqEYiWQ8Qa0oDgyZavXR8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>
Message-ID: <54aedf5a-34b1-15f6-47f1-39815b3832ae@suse.de>
Subject: Re: [RESEND PATCH 4/5] drm: Add a drm_drv_enabled() helper function
References: <20211103123206.1041442-1-javierm@redhat.com>
 <87o871bbmb.fsf@intel.com>
In-Reply-To: <87o871bbmb.fsf@intel.com>

--------------cAMtqEYiWQ8Qa0oDgyZavXR8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTEuMjEgdW0gMTQ6NDEgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
V2VkLCAwMyBOb3YgMjAyMSwgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJl
ZGhhdC5jb20+IHdyb3RlOg0KPj4gRFJNIGRyaXZlcnMgY2FuIHVzZSB0aGlzIHRvIGRldGVy
bWluZSB3aGV0aGVyIHRoZXkgY2FuIGJlIGVuYWJsZWQgb3Igbm90Lg0KPj4NCj4+IEZvciBu
b3cgaXQncyBqdXN0IGEgd3JhcHBlciBhcm91bmQgZHJtX21vZGVzZXRfZGlzYWJsZWQoKSBi
dXQgaGF2aW5nIHRoZQ0KPj4gaW5kaXJlY3Rpb24gbGV2ZWwgd2lsbCBhbGxvdyB0byBhZGQg
b3RoZXIgY29uZGl0aW9ucyBiZXNpZGVzICJub21vZGVzZXQiLg0KPj4NCj4+IFN1Z2dlc3Rl
ZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNv
bT4NCj4gDQo+IENhbid0IHNlZSBpOTE1IHRyaXZpYWxseSB1c2luZyB0aGlzIGR1ZSB0byB0
aGUgZHJtX2RyaXZlcg0KPiBwYXJhbWV0ZXIuIFBsZWFzZSBsZXQncyBub3QgbWVyZ2UgaGVs
cGVycyBsaWtlIHRoaXMgd2l0aG91dCBhY3R1YWwNCj4gdXNlcnMuDQoNCkNhbiB5b3UgZXhw
bGFpbj8NCg0KVGhpcyB3b3VsZCBiZSBjYWxsZWQgb24gdGhlIHRvcCBvZiB0aGUgUENJIHBy
b2JlIGZ1bmN0aW9uLiBUaGUgcGFyYW1ldGVyIA0Kd291bGQgYWxsb3cgdG8gZGVjaWRlIG9u
IGEgcGVyLWRyaXZlciBiYXNlIChlLmcuLCB0byBpZ25vcmUgZ2VuZXJpYyANCmRyaXZlcnMp
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+
IA0KPj4gLS0tDQo+Pg0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIHwgMjEgKysr
KysrKysrKysrKysrKysrKysrDQo+PiAgIGluY2x1ZGUvZHJtL2RybV9kcnYuaCAgICAgfCAg
MSArDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcnYuYw0KPj4gaW5kZXggODIxNGEwYjFhYjdmLi43MGVmMDg5NDFlMDYgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Rydi5jDQo+PiBAQCAtOTc1LDYgKzk3NSwyNyBAQCBpbnQgZHJtX2Rl
dl9zZXRfdW5pcXVlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm5hbWUp
DQo+PiAgIH0NCj4+ICAgRVhQT1JUX1NZTUJPTChkcm1fZGV2X3NldF91bmlxdWUpOw0KPj4g
ICANCj4+ICsvKioNCj4+ICsgKiBkcm1fZHJ2X2VuYWJsZWQgLSBDaGVja3MgaWYgYSBEUk0g
ZHJpdmVyIGNhbiBiZSBlbmFibGVkDQo+PiArICogQGRyaXZlcjogRFJNIGRyaXZlciB0byBj
aGVjaw0KPj4gKyAqDQo+PiArICogQ2hlY2tzIHdoZXRoZXIgYSBEUk0gZHJpdmVyIGNhbiBi
ZSBlbmFibGVkIG9yIG5vdC4gVGhpcyBtYXkgYmUgdGhlIGNhc2UNCj4+ICsgKiBpZiB0aGUg
Im5vbW9kZXNldCIga2VybmVsIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIgaXMgdXNlZC4NCj4+
ICsgKg0KPj4gKyAqIFJldHVybnM6DQo+PiArICogVHJ1ZSBpZiB0aGUgRFJNIGRyaXZlciBp
cyBlbmFibGVkIGFuZCBmYWxzZSBvdGhlcndpc2UuDQo+PiArICovDQo+PiArYm9vbCBkcm1f
ZHJ2X2VuYWJsZWQoY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgKmRyaXZlcikNCj4+ICt7DQo+
PiArCWlmIChkcm1fbW9kZXNldF9kaXNhYmxlZCgpKSB7DQo+PiArCQlEUk1fSU5GTygiJXMg
ZHJpdmVyIGlzIGRpc2FibGVkXG4iLCBkcml2ZXItPm5hbWUpOw0KPj4gKwkJcmV0dXJuIGZh
bHNlOw0KPj4gKwl9DQo+PiArDQo+PiArCXJldHVybiB0cnVlOw0KPj4gK30NCj4+ICtFWFBP
UlRfU1lNQk9MKGRybV9kcnZfZW5hYmxlZCk7DQo+PiArDQo+PiAgIC8qDQo+PiAgICAqIERS
TSBDb3JlDQo+PiAgICAqIFRoZSBEUk0gY29yZSBtb2R1bGUgaW5pdGlhbGl6ZXMgYWxsIGds
b2JhbCBEUk0gb2JqZWN0cyBhbmQgbWFrZXMgdGhlbQ0KPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9kcnYuaCBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPj4gaW5kZXggMGNk
OTU5NTNjZGY1Li40OGYyYjZlZWMwMTIgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fZHJ2LmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPj4gQEAgLTU5OCw1
ICs1OTgsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZHJtX2Rydl91c2VzX2F0b21pY19tb2Rl
c2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIA0KPj4gICBpbnQgZHJtX2Rldl9z
ZXRfdW5pcXVlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm5hbWUpOw0K
Pj4gICANCj4+ICtib29sIGRybV9kcnZfZW5hYmxlZChjb25zdCBzdHJ1Y3QgZHJtX2RyaXZl
ciAqZHJpdmVyKTsNCj4+ICAgDQo+PiAgICNlbmRpZg0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------cAMtqEYiWQ8Qa0oDgyZavXR8--

--------------yhuKbyI95NPlaLrFk1VmGRle
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGClE4FAwAAAAAACgkQlh/E3EQov+Cl
vw//VClaxzh5jDAfegfM48i5xAcS9i++pZJXl1lcyWB5qNR7obyvwjxCrAlE/fjaZa6jxID8+VP/
bL939ThyT8c9Nx2FXNzY4ghPf4aUgwhRvco2vbjVnn9rwuUSpDI85GWDqQMNsQ7IWYAnHAxzNnPv
jLXuyG8IL7rFVt/JNdjQWuV4CE24WyhKN0xejkpckNCwcNZvuFeoLhRYOoWVxfoIto5Lg1nTPJGy
ACFy8Grx8VJYYr0sRKYbXy7H2PChm6BkJqkG9TpAjjBznYC85B6i+KNEYOh2bdXS2rQXqHJq8BQq
c9m0SCPuI3wogM1GA63x4f0DHd/sEa47DUtOUqlapZqX3P2gatp3qYPSI1aXNPZbyMIoySzCwvuL
MeGLNKYkvZ85nTg+3LKUW6qBLGTN4ALOE2L2zr/07YN4PfwjPURZq1ZO7gBx5/Ttfg6TPKI0JIj/
AsI1RyNvsHFn8BrpIbNyh9LJe8uC2nrQj9vIQLEg+siTAeNpmB+Uo3WTxUZtmcq94gCTBrzvCvM1
8Pm7xfJLLrmlnPWQgIevBTLVz5UPhMKJ2Y6ZZhKuGqwH6h3ZdeFBP5/JeV6K7UrThx5xNW3O6kYy
gS93NhXAWrgvzyHxSva7DTU9QK5evfnlJkneO7LLdkRQlu1D8kCT7/NYNGMeVm0iv1FhP05d3pJM
Nyg=
=qXdO
-----END PGP SIGNATURE-----

--------------yhuKbyI95NPlaLrFk1VmGRle--

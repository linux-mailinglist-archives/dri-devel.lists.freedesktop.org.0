Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62895E9A64
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 09:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45FB10E58B;
	Mon, 26 Sep 2022 07:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6F110E58B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:24:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F9FB22074;
 Mon, 26 Sep 2022 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664177067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RGUC7pfUkCqmyz+z/f44Cmmv/jV1D6wIM8yzmShaiXg=;
 b=0x9ETCbggBXBSY950xyTpVnALjJ0LpudiLj0RsYQ7pX4hH9HLguVnv1nNPPVaJTnKtAqEe
 Y34n5JAf+l8EdSk1EYXYRVdC9crFKHKAL4WKvk8nZk/TkEJR7acwQnBGlrs7b0p0+t5WKf
 ZwMD164VB4caKx9PXgfJl4j7npbzmhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664177067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RGUC7pfUkCqmyz+z/f44Cmmv/jV1D6wIM8yzmShaiXg=;
 b=Zn79lRl/sLY+IEnm43amNTnMXQoNC/tq1Ggex/26wfuEDi3HRuIo+e9DK+dF292qFt7Ghe
 jjntezo0TkOfbyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06562139BD;
 Mon, 26 Sep 2022 07:24:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dRS8AKtTMWPANgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 07:24:27 +0000
Message-ID: <8a974e5a-949a-5eb8-4f01-64e6114dafa7@suse.de>
Date: Mon, 26 Sep 2022 09:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ssd130x: Use drm_atomic_get_new_plane_state()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220923083447.1679780-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220923083447.1679780-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U8QkojnKz6JHsFlvXDJVqlbS"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U8QkojnKz6JHsFlvXDJVqlbS
Content-Type: multipart/mixed; boundary="------------10FNfTQ1XwAI5W22XU7N5QaD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <8a974e5a-949a-5eb8-4f01-64e6114dafa7@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Use drm_atomic_get_new_plane_state()
References: <20220923083447.1679780-1-javierm@redhat.com>
In-Reply-To: <20220923083447.1679780-1-javierm@redhat.com>

--------------10FNfTQ1XwAI5W22XU7N5QaD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIzLjA5LjIyIHVtIDEwOjM0IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGUgc3RydWN0IGRybV9wbGFuZSAuc3RhdGUgc2hvdWxkbid0IGJlIGFjY2Vz
c2VkIGRpcmVjdGx5IGJ1dCBpbnN0ZWFkIHRoZQ0KPiBkcm1fYXRvbWljX2dldF9uZXdfcGxh
bmVfc3RhdGUoKSBoZWxwZXIgZnVuY3Rpb24gc2hvdWxkIGJlIHVzZWQuDQo+IA0KPiBUaGlz
IGlzIGJhc2VkIG9uIGEgc2ltaWxhciBwYXRjaCBmcm9tIFRob21hcyBaaW1tZXJtYW5uIGZv
ciB0aGUgc2ltcGxlZHJtDQo+IGRyaXZlci4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiAN
Cj4gU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMg
PGphdmllcm1AcmVkaGF0LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiANCj4gICBkcml2ZXJzL2dwdS9k
cm0vc29sb21vbi9zc2QxMzB4LmMgfCA4ICsrKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMgYi9kcml2ZXJzL2dwdS9kcm0vc29s
b21vbi9zc2QxMzB4LmMNCj4gaW5kZXggN2ZhZTk0ODBhYTExLi5hNTM3NjkyMTAwZDEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zb2xvbW9uL3NzZDEzMHguYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4gQEAgLTU2NiwxMCArNTY2
LDEwIEBAIHN0YXRpYyBpbnQgc3NkMTMweF9mYl9ibGl0X3JlY3Qoc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIsIGNvbnN0IHN0cnVjdCBpb3N5c19tDQo+ICAgfQ0KPiAgIA0KPiAgIHN0
YXRpYyB2b2lkIHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX3VwZGF0ZShz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gLQkJCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2F0
b21pY19zdGF0ZSAqb2xkX3N0YXRlKQ0KPiArCQkJCQkJICAgICAgIHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSkNCj4gICB7DQo+IC0Jc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAq
cGxhbmVfc3RhdGUgPSBwbGFuZS0+c3RhdGU7DQo+IC0Jc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqb2xkX3BsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKG9s
ZF9zdGF0ZSwgcGxhbmUpOw0KPiArCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0
YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+
ICsJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRlID0gZHJtX2F0b21p
Y19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+ICAgCXN0cnVjdCBkcm1f
c2hhZG93X3BsYW5lX3N0YXRlICpzaGFkb3dfcGxhbmVfc3RhdGUgPSB0b19kcm1fc2hhZG93
X3BsYW5lX3N0YXRlKHBsYW5lX3N0YXRlKTsNCj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRy
bSA9IHBsYW5lLT5kZXY7DQo+ICAgCXN0cnVjdCBkcm1fcmVjdCBzcmNfY2xpcCwgZHN0X2Ns
aXA7DQo+IEBAIC01OTEsNyArNTkxLDcgQEAgc3RhdGljIHZvaWQgc3NkMTMweF9wcmltYXJ5
X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0K
PiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBzc2QxMzB4X3ByaW1hcnlfcGxhbmVfaGVs
cGVyX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAtCQkJCQkJ
CXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUpDQo+ICsJCQkJCQkJc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9kZXZp
Y2UgKmRybSA9IHBsYW5lLT5kZXY7DQo+ICAgCXN0cnVjdCBzc2QxMzB4X2RldmljZSAqc3Nk
MTMweCA9IGRybV90b19zc2QxMzB4KGRybSk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------10FNfTQ1XwAI5W22XU7N5QaD--

--------------U8QkojnKz6JHsFlvXDJVqlbS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMxU6oFAwAAAAAACgkQlh/E3EQov+CC
wBAAgrG6v5i4MK9srv2h5xsgNWBtYsYI6p/XJgCb4HnYAnlQXhMEf/DM+g0ZVaLWwQt3+qMVG2nT
d8S+RmX2PZ4by3Rc13jIyyzUxCFaeZU0kw3lPO6qX+uRDs7UM3NzHdd62JqXxbxmQmkxRrCjM/Fq
u6L2hzBj8rpZi5zAZte3BHjJjmqK9SrTKu68+esBqHmNvKM2e8Foj9H45Gde2op8KM1s359af369
PFusQn2/85pkV751yVQzpo1QQhuPEZqy/G5Kyfjv8SmE0fDUuHEnE6A2ThQak5oQeKmgqVFkzaMF
hAyqesRh2IDW9UJS1iMazPMYUuk+DUylajLkrXnLUEPnkdEv+nT1CK/T7vIyMpUGxBDSGWdgB/Ln
VscMTHkJeK2ccow2Quo+1d8pbjZi/k9ized0EKlOGyinS0Bqe0ocLtORr0juJoWXA7sBKLhM5rvt
W0tbDpXu0wxYAJn88e7ljl4+RjSHoZdC4juNc4vf9AWot06Q7cyij1OO1mn2RBD+ugSOgz/UXeBp
h5kOodRioKxq2YOJ+fX+flWWZmjh8pZs5WlJSCvvwAvkCMaO8CAuMfSUYReuyjEaQkIPzRm1o1A7
5984iT4NxOTfZjXj90yZUHE+/fS8L66s5MCVSskQPjGcusBuXnI2StmbQULzbyuxLb51NctH0/NL
3O8=
=q/kS
-----END PGP SIGNATURE-----

--------------U8QkojnKz6JHsFlvXDJVqlbS--

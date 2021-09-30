Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9DC41D46F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 09:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5BD6E328;
	Thu, 30 Sep 2021 07:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A927B6E328
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:21:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38D042254D;
 Thu, 30 Sep 2021 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632986463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ohtw71D/SZFC/rCiPJIhBg3kcraaLwFE1Ziv/+j83O0=;
 b=t/7YpZRKNI4UEF4yalDPK5UC1ijQH9j9U5eZmWO96OIZGhx9TJabmrkyt0psZbTlw3O4rP
 a7AF9Y1qT6dt14FNf/tFDsh6SliQp9pyKv3BO+wAE1A/Z05XFQg1VE1oIzim78sqide9Xh
 r3k0f2U697Gsy2/mlRFeYhyd33Iv3Uw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632986463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ohtw71D/SZFC/rCiPJIhBg3kcraaLwFE1Ziv/+j83O0=;
 b=KkhFuzjpX84RHAddboBqYwJOGZ5a+F4HZovh1cWCGKSsMiqf2FC7USvyWnEcu8OrydjBRZ
 h4nkToBg0PNP94Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CCB213B05;
 Thu, 30 Sep 2021 07:21:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fljwAV9lVWFICgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Sep 2021 07:21:03 +0000
Message-ID: <17d63b06-d1bd-85ab-92d3-71fa236b9493@suse.de>
Date: Thu, 30 Sep 2021 09:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/prime: Fix use after free in mmap with
 drm_gem_ttm_mmap
Content-Language: en-US
To: Anand K Mistry <amistry@google.com>, dri-devel@lists.freedesktop.org
Cc: nartemiev@google.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
References: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0utDXCvW7w9ymaxy0zW0SDtJ"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0utDXCvW7w9ymaxy0zW0SDtJ
Content-Type: multipart/mixed; boundary="------------Krt3fYeAV1ojHjyEd0FV0P3B";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Anand K Mistry <amistry@google.com>, dri-devel@lists.freedesktop.org
Cc: nartemiev@google.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <17d63b06-d1bd-85ab-92d3-71fa236b9493@suse.de>
Subject: Re: [PATCH] drm/prime: Fix use after free in mmap with
 drm_gem_ttm_mmap
References: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>
In-Reply-To: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>

--------------Krt3fYeAV1ojHjyEd0FV0P3B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDkuMjEgdW0gMDE6MDAgc2NocmllYiBBbmFuZCBLIE1pc3RyeToNCj4g
ZHJtX2dlbV90dG1fbW1hcCgpIGRyb3BzIGEgcmVmZXJlbmNlIHRvIHRoZSBnZW0gb2JqZWN0
IG9uIHN1Y2Nlc3MuIElmDQo+IHRoZSBnZW0gb2JqZWN0J3MgcmVmY291bnQgPT0gMSBvbiBl
bnRyeSB0byBkcm1fZ2VtX3ByaW1lX21tYXAoKSwgdGhhdA0KPiBkcm9wIHdpbGwgZnJlZSB0
aGUgZ2VtIG9iamVjdCwgYW5kIHRoZSBzdWJzZXF1ZW50IGRybV9nZW1fb2JqZWN0X2dldCgp
DQo+IHdpbGwgYmUgYSBVQUYuIEZpeCBieSBncmFiYmluZyBhIHJlZmVyZW5jZSBiZWZvcmUg
Y2FsbGluZyB0aGUgbW1hcA0KPiBoZWxwZXIuDQo+IA0KPiBUaGlzIGlzc3VlIHdhcyBmb3Jz
ZWVuIHdoZW4gdGhlIHJlZmVyZW5jZSBkcm9wcGluZyB3YXMgYWRkaW5nIGluDQo+IGNvbW1p
dCA5Nzg2YjY1YmM2MWFjICgiZHJtL3R0bTogZml4IG1tYXAgcmVmY291bnRpbmciKToNCj4g
ICAgIkZvciB0aGF0IHRvIHdvcmsgcHJvcGVybHkgdGhlIGRybV9nZW1fb2JqZWN0X2dldCgp
IGNhbGwgaW4NCj4gICAgZHJtX2dlbV90dG1fbW1hcCgpIG11c3QgYmUgbW92ZWQgc28gaXQg
aGFwcGVucyBiZWZvcmUgY2FsbGluZw0KPiAgICBvYmotPmZ1bmNzLT5tbWFwKCksIG90aGVy
d2lzZSB0aGUgZ2VtIHJlZmNvdW50IHdvdWxkIGdvIGRvd24NCj4gICAgdG8gemVyby4iDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBLIE1pc3RyeSA8YW1pc3RyeUBnb29nbGUuY29t
Pg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQoNClRoaXMgbG9va3MgZmluZSB0byBtZSwgYnV0IGl0IGFmZmVjdHMgbWFueSBkcml2ZXJz
LiBMZXQncyBtYXliZSB3YWl0IGEgDQpiaXQgaWYgbW9yZSByZXZpZXdzIGNvbWUgaXQuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJpbWUuYyB8IDYgKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4gaW5k
ZXggMmE1NGY4Njg1NmFmLi5lMTg1NGZkMjRiYjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbWUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMNCj4gQEAgLTcxOSwxMSArNzE5LDEzIEBAIGludCBkcm1fZ2VtX3ByaW1lX21tYXAoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0K
PiAgIAlpZiAob2JqLT5mdW5jcyAmJiBvYmotPmZ1bmNzLT5tbWFwKSB7DQo+ICAgCQl2bWEt
PnZtX29wcyA9IG9iai0+ZnVuY3MtPnZtX29wczsNCj4gICANCj4gKwkJZHJtX2dlbV9vYmpl
Y3RfZ2V0KG9iaik7DQo+ICAgCQlyZXQgPSBvYmotPmZ1bmNzLT5tbWFwKG9iaiwgdm1hKTsN
Cj4gLQkJaWYgKHJldCkNCj4gKwkJaWYgKHJldCkgew0KPiArCQkJZHJtX2dlbV9vYmplY3Rf
cHV0KG9iaik7DQo+ICAgCQkJcmV0dXJuIHJldDsNCj4gKwkJfQ0KPiAgIAkJdm1hLT52bV9w
cml2YXRlX2RhdGEgPSBvYmo7DQo+IC0JCWRybV9nZW1fb2JqZWN0X2dldChvYmopOw0KPiAg
IAkJcmV0dXJuIDA7DQo+ICAgCX0NCj4gICANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXgg
SW1lbmTDtnJmZmVyDQo=

--------------Krt3fYeAV1ojHjyEd0FV0P3B--

--------------0utDXCvW7w9ymaxy0zW0SDtJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFVZV4FAwAAAAAACgkQlh/E3EQov+B5
sA/9EcKCov8QvBVWpbDdG9FI2VbIBTcj8UGmHJB73mJ/uJqHdZ4QsXuMDdXleGNS0oiP+vfjUHuX
oVNQBy4h4mYRjc0bmmVVg7Yo6OnzNOZhdb8ep3gUa6SvAncNB/WSnW0wO35VGEtGBop56X/M+4ba
VE0nMSoAukqdAVA2KNrNNny5QNYmsaDMMYCVUju6i+OgPxvUUQoiPx5hH92v+exsqzzOmLioQFRY
LKQLB4qAnw6NWAcg2DHYqFZOvNdOvfWrkUUH1FrbBXdzZMPA147j/lGaQ7A0ShMN4l7AI4RrMseQ
3YTnoeJF2bGbEhahMwTFFhxkty8CnreEqbGY77Hx1Z8RYmXi0QWzzRdb8YD4H36yusT7Yz8mo11J
ERpXktFIM8YBcbJyOBm/eo5KSsuXG5x+XqKqLUKjWnSNNjUCnZhcM3m6jU/6xsfpFMpR08FjDknT
6oCF3ys9gPF6OTr7/BwcY1+oABqXxU2+OBTysd6VPfACMN6rDTWEY2NFNtt+2l4e0MNenzwJOG/2
k6OK3Ttj0yRKA/ZcsMz68RWFi12iOj7Nz/rVRNrRJuQguPfB6ZY/87A0qHiRVk82hvGWQSSs0V07
9GDdU8tG7WjM+tbYAgRwz9SFNaA8kNEhmiW1lA2nSx/JbXW1BUF2XpeNTikPgzhEzd3kdviDFinx
M9E=
=bCeJ
-----END PGP SIGNATURE-----

--------------0utDXCvW7w9ymaxy0zW0SDtJ--

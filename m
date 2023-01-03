Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797865C145
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 14:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C8210E3CE;
	Tue,  3 Jan 2023 13:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E26D10E3CF;
 Tue,  3 Jan 2023 13:54:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD6DF3E904;
 Tue,  3 Jan 2023 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672754091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lPjJ65LXLSP5211IEL4Pol3CqU430+xRcc/7OVK2aG8=;
 b=zOUbHmOJlDlsryeOjHKtFYQM9HIWsmYVu0mAWhci9ERLDdF3OeUiSCru0JdO4z32SCL4oJ
 z/BbTh7J20YuzT1D/rh8GIl06dOQybJbthpt6mVgKFtmtuxYBkmDL6zXOCoqqgSjdQnqZ3
 WZWD+ej78TLbiMh9JLLxIdjilR7skds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672754091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lPjJ65LXLSP5211IEL4Pol3CqU430+xRcc/7OVK2aG8=;
 b=PsVNrqGLsyiKHDBNQfPQUxbfu85wANuMx69vJSS1n36XOKgiUoIhrc+1zD1Y4lhZDsBmTa
 tazSzMFNHS8RzwAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E3181390C;
 Tue,  3 Jan 2023 13:54:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e8tCGasztGPjNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jan 2023 13:54:51 +0000
Message-ID: <e92e498a-2da3-7bb8-5d79-f78c650e3a02@suse.de>
Date: Tue, 3 Jan 2023 14:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 09/18] vfio-mdev/mdpy-fb: Do not set struct
 fb_info.apertures
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-10-tzimmermann@suse.de>
 <12990f75-6b72-7ed7-0593-1c542d71f0f0@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <12990f75-6b72-7ed7-0593-1c542d71f0f0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x40lYiYs0eNp1acnmwtMEKvD"
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x40lYiYs0eNp1acnmwtMEKvD
Content-Type: multipart/mixed; boundary="------------UdOWonX0FCjJ3gZ430ygyHXY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <e92e498a-2da3-7bb8-5d79-f78c650e3a02@suse.de>
Subject: Re: [PATCH 09/18] vfio-mdev/mdpy-fb: Do not set struct
 fb_info.apertures
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-10-tzimmermann@suse.de>
 <12990f75-6b72-7ed7-0593-1c542d71f0f0@redhat.com>
In-Reply-To: <12990f75-6b72-7ed7-0593-1c542d71f0f0@redhat.com>

--------------UdOWonX0FCjJ3gZ430ygyHXY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjEyLjIyIHVtIDEwOjMyIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBbYWRkaW5nIEtpcnRpIFdhbmtoZWRlIGFuZCBrdm1Admdlci5rZXJuZWwub3Jn
IHRvIENjIGxpc3RdDQo+IA0KPiBPbiAxMi8xOS8yMiAxNzowNSwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6DQo+PiBHZW5lcmljIGZiZGV2IGRyaXZlcnMgdXNlIHRoZSBhcGVydHVyZXMg
ZmllbGQgaW4gc3RydWN0IGZiX2luZm8gdG8NCj4+IGNvbnRyb2wgb3duZXJzaGlwIG9mIHRo
ZSBmcmFtZWJ1ZmZlciBtZW1vcnkgYW5kIGdyYXBoaWNzIGRldmljZS4gRG8NCj4+IG5vdCBz
ZXQgdGhlIHZhbHVlcyBpbiBtZHB5LWZiLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgIHNhbXBs
ZXMvdmZpby1tZGV2L21kcHktZmIuYyB8IDggLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1t
ZGV2L21kcHktZmIuYyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHktZmIuYw0KPj4gaW5kZXgg
OWVjOTNkOTBlOGE1Li4xZGU1ODAxY2QyZTggMTAwNjQ0DQo+PiAtLS0gYS9zYW1wbGVzL3Zm
aW8tbWRldi9tZHB5LWZiLmMNCj4+ICsrKyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHktZmIu
Yw0KPj4gQEAgLTE2MSwxNCArMTYxLDYgQEAgc3RhdGljIGludCBtZHB5X2ZiX3Byb2JlKHN0
cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICAJCWdvdG8gZXJyX3JlbGVhc2VfZmI7DQo+PiAg
IAl9DQo+PiAgIA0KPj4gLQlpbmZvLT5hcGVydHVyZXMgPSBhbGxvY19hcGVydHVyZXMoMSk7
DQo+PiAtCWlmICghaW5mby0+YXBlcnR1cmVzKSB7DQo+PiAtCQlyZXQgPSAtRU5PTUVNOw0K
Pj4gLQkJZ290byBlcnJfdW5tYXA7DQo+PiAtCX0NCj4+IC0JaW5mby0+YXBlcnR1cmVzLT5y
YW5nZXNbMF0uYmFzZSA9IGluZm8tPmZpeC5zbWVtX3N0YXJ0Ow0KPj4gLQlpbmZvLT5hcGVy
dHVyZXMtPnJhbmdlc1swXS5zaXplID0gaW5mby0+Zml4LnNtZW1fbGVuOw0KPj4gLQ0KPj4g
ICAJaW5mby0+ZmJvcHMgPSAmbWRweV9mYl9vcHM7DQo+PiAgIAlpbmZvLT5mbGFncyA9IEZC
SU5GT19ERUZBVUxUOw0KPj4gICAJaW5mby0+cHNldWRvX3BhbGV0dGUgPSBwYXItPnBhbGV0
dGU7DQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1A
cmVkaGF0LmNvbT4NCj4gDQo+IEJ1dCBJIHRoaW5rIGFuIGFjayBmcm9tIEtpcnRpIFdhbmto
ZWRlIG9yIG90aGVyIHZpcnQgZm9sayBpcyBuZWVkZWQgaWYgeW91DQo+IHdhbnQgdG8gbWVy
Z2UgdGhpcyB0aHJvdWdoIGRybS1taXNjLW5leHQuDQoNCnBpbmcuIENvdWxkIEkgaGF2ZSBh
IHJldmlldyBmcm9tIHRoZSB2ZmlvIGRldnMsIHBsZWFzZS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------UdOWonX0FCjJ3gZ430ygyHXY--

--------------x40lYiYs0eNp1acnmwtMEKvD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO0M6oFAwAAAAAACgkQlh/E3EQov+Cn
FBAAj4qcPw5/JJZ1bFRUtXXnzawgXo97xQ5NWU07BD1q6MhOlEmGgSI0e0ruEuFs1afzHgUd/pfk
TuBd1ZDPKC0EsW/zxI+Gjys7VgkUvk7cx28VNrryz7UAiRNWrhx9ndqBsjTxqIb9qj/wIH6BOq7D
NOvElo4VriWEdNV6fMiyfK4bvOB3B//xIbRk1IqFtm0z3HzRfeorUPVLKGR68cyB2Ftae6vjjhqS
XA2t3yGlgXPTn/uH/kfwLw7yCYFij9ncffE9fofWlGNAlB46j58y51sQb4nPbYs1KCyqvl9Iy80n
nyQJ76JAli1LQhfgPpdZIb3YoE0UrIARKt2BZpfqjYUG2nH20Kd3Pz2Flp6DyfS8+Kg3nmt6z+yo
ESsU4M+4GkwsuLNbe9cILXWfWegOk/gMEelue0CZSzMd10+WG3oZQn10/NcJ4QiBNQf55OYw+MmW
J2SwrIBPguWsiz6QvN4Qgr8Vt9sjwWnp1LwHwDRr7O4LzwpPpUgD2vAn4jzpZoYxrf32EDC+VdJU
Im8aCy8b9ywxm+TafzQ5fOA0raPTisgmqGEvvXWCKMSstSDqkPi+e8fgFcZipe0MNLoqWEfq7wYU
zrx52evfoWuzqEYLyb8o+cwfqqepskD5TSjomZt2UKp87500MlSqmmuRbLazopKIG6TT0WTEc6fb
w+k=
=tbnT
-----END PGP SIGNATURE-----

--------------x40lYiYs0eNp1acnmwtMEKvD--

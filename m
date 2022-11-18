Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0937A62F6A5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0215B10E20A;
	Fri, 18 Nov 2022 13:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA1410E20A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:56:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB700228BE;
 Fri, 18 Nov 2022 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668779805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGu7VgiVqgDwS1gTB7PyLyT7BzHaPvHOGnF/WFZfVO8=;
 b=aUo+8WpSlLbSIb2pvTThfCPlyq4EV4cv3g1c0hwbqCj7juI5TTTP2NKoKGo8mJ3jAJrhg3
 FlELSUJ9Ir45/+a2f8B4OZvjDLjhum5nfKzWSv5BPlwdKOe8FSvR0c6ALzuUINy6k2JB8N
 ROJGTgr8ymQGqAJffry9FCseGOWQclU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668779805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGu7VgiVqgDwS1gTB7PyLyT7BzHaPvHOGnF/WFZfVO8=;
 b=QAumkyPyIoxwttI8pTgddaBW6W+yCHRIfklDP416CYSZO7axXbvdRiFhLqjWTH5eGSMf+n
 OWPQ31lY5hopzlAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A31201345B;
 Fri, 18 Nov 2022 13:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DhoFJx2Pd2MnOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 13:56:45 +0000
Message-ID: <4154c060-872d-b3e6-4e99-8b810f7f47bf@suse.de>
Date: Fri, 18 Nov 2022 14:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 4/8] drm/simpledrm: Use struct iosys_map consistently
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-5-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221117184039.2291937-5-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------spmmF4ZsdGLhAtEN58jDgQ4O"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------spmmF4ZsdGLhAtEN58jDgQ4O
Content-Type: multipart/mixed; boundary="------------BQmT0HLWnqOZCb4WCyv0nbN6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4154c060-872d-b3e6-4e99-8b810f7f47bf@suse.de>
Subject: Re: [PATCH v3 4/8] drm/simpledrm: Use struct iosys_map consistently
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-5-thierry.reding@gmail.com>
In-Reply-To: <20221117184039.2291937-5-thierry.reding@gmail.com>

--------------BQmT0HLWnqOZCb4WCyv0nbN6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjIgdW0gMTk6NDAgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IFRoZSBt
YWpvcml0eSBvZiB0aGUgZHJpdmVyIGFscmVhZHkgdXNlcyBzdHJ1Y3QgaW9zeXNfbWFwIHRv
IGVuY2Fwc3VsYXRlDQo+IGFjY2Vzc2VzIHRvIEkvTyByZW1hcHBlZCB2cy4gc3lzdGVtIG1l
bW9yeS4gQWNjZXNzZXMgdmlhIHRoZSBzY3JlZW4gYmFzZQ0KPiBwb2ludGVyIHN0aWxsIHVz
ZSBfX2lvbWVtIGFubm90YXRpb25zLCB3aGljaCBjYW4gbGVhZCB0byBpbmNvbnNpc3RlbmNp
ZXMNCj4gYW5kIGNvbmZsaWN0cyB3aXRoIHN1YnNlcXVlbnQgcGF0Y2hlcy4NCj4gDQo+IENv
bnZlcnQgdGhlIHNjcmVlbiBiYXNlIHRvIGEgc3RydWN0IGlvc3lzX21hcCBhcyB3ZWxsIGZv
ciBjb25zaXN0ZW5jeQ0KPiBhbmQgdG8gYXZvaWQgdGhlc2UgaXNzdWVzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gLS0t
DQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gcHJvcGVybHkgcmVpbml0aWFsaXplIHN0cnVjdCBp
b3N5c19tYXAgdG8gYXZvaWQgYm9ndXMgaW5jcmVtZW50cw0KPiANCj4gICBkcml2ZXJzL2dw
dS9kcm0vdGlueS9zaW1wbGVkcm0uYyB8IDE1ICsrKysrKysrLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBpbmRleCAxNjJlYjQ0ZGNiYTguLjM2NzNhNDJl
NGJmNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAgLTIwOCw3
ICsyMDgsNyBAQCBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSB7DQo+ICAgCXVuc2lnbmVkIGlu
dCBwaXRjaDsNCj4gICANCj4gICAJLyogbWVtb3J5IG1hbmFnZW1lbnQgKi8NCj4gLQl2b2lk
IF9faW9tZW0gKnNjcmVlbl9iYXNlOw0KPiArCXN0cnVjdCBpb3N5c19tYXAgc2NyZWVuX2Jh
c2U7DQo+ICAgDQo+ICAgCS8qIG1vZGVzZXR0aW5nICovDQo+ICAgCXVpbnQzMl90IGZvcm1h
dHNbOF07DQo+IEBAIC00OTIsMTUgKzQ5MiwxNSBAQCBzdGF0aWMgdm9pZCBzaW1wbGVkcm1f
cHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZQ0KPiAgIA0KPiAgIAlkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0KCZp
dGVyLCBvbGRfcGxhbmVfc3RhdGUsIHBsYW5lX3N0YXRlKTsNCj4gICAJZHJtX2F0b21pY19m
b3JfZWFjaF9wbGFuZV9kYW1hZ2UoJml0ZXIsICZkYW1hZ2UpIHsNCj4gLQkJc3RydWN0IGlv
c3lzX21hcCBkc3QgPSBJT1NZU19NQVBfSU5JVF9WQUREUihzZGV2LT5zY3JlZW5fYmFzZSk7
DQoNCldlIHVzZSBkc3QgdGhyb3VnaG91dCB0aGUgY29kZSBmb3Igc3VjaCBkZXN0aW5hdGlv
biBidWZmZXJzLiBQbGVhc2Uga2VlcCANCnRoZSBuYW1lLiBXaXRoIHRoaXMgZml4ZWQsIHlv
dSBjYW4gYWRkDQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCg0KdG8gdGhlIHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+ICAgCQlzdHJ1Y3QgZHJtX3JlY3QgZHN0X2NsaXAgPSBwbGFuZV9zdGF0ZS0+ZHN0Ow0K
PiArCQlzdHJ1Y3QgaW9zeXNfbWFwIHNjcmVlbiA9IHNkZXYtPnNjcmVlbl9iYXNlOw0KPiAg
IA0KPiAgIAkJaWYgKCFkcm1fcmVjdF9pbnRlcnNlY3QoJmRzdF9jbGlwLCAmZGFtYWdlKSkN
Cj4gICAJCQljb250aW51ZTsNCj4gICANCj4gLQkJaW9zeXNfbWFwX2luY3IoJmRzdCwgZHJt
X2ZiX2NsaXBfb2Zmc2V0KHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQsICZkc3RfY2xpcCkp
Ow0KPiAtCQlkcm1fZmJfYmxpdCgmZHN0LCAmc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdC0+
Zm9ybWF0LCBzaGFkb3dfcGxhbmVfc3RhdGUtPmRhdGEsIGZiLA0KPiAtCQkJICAgICZkYW1h
Z2UpOw0KPiArCQlpb3N5c19tYXBfaW5jcigmc2NyZWVuLCBkcm1fZmJfY2xpcF9vZmZzZXQo
c2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdCwgJmRzdF9jbGlwKSk7DQo+ICsJCWRybV9mYl9i
bGl0KCZzY3JlZW4sICZzZGV2LT5waXRjaCwgc2Rldi0+Zm9ybWF0LT5mb3JtYXQsIHNoYWRv
d19wbGFuZV9zdGF0ZS0+ZGF0YSwNCj4gKwkJCSAgICBmYiwgJmRhbWFnZSk7DQo+ICAgCX0N
Cj4gICANCj4gICAJZHJtX2Rldl9leGl0KGlkeCk7DQo+IEBAIC01MTksNyArNTE5LDcgQEAg
c3RhdGljIHZvaWQgc2ltcGxlZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY19kaXNh
YmxlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW4NCj4gICAJCXJldHVybjsNCj4gICANCj4gICAJ
LyogQ2xlYXIgc2NyZWVuIHRvIGJsYWNrIGlmIGRpc2FibGVkICovDQo+IC0JbWVtc2V0X2lv
KHNkZXYtPnNjcmVlbl9iYXNlLCAwLCBzZGV2LT5waXRjaCAqIHNkZXYtPm1vZGUudmRpc3Bs
YXkpOw0KPiArCWlvc3lzX21hcF9tZW1zZXQoJnNkZXYtPnNjcmVlbl9iYXNlLCAwLCAwLCBz
ZGV2LT5waXRjaCAqIHNkZXYtPm1vZGUudmRpc3BsYXkpOw0KPiAgIA0KPiAgIAlkcm1fZGV2
X2V4aXQoaWR4KTsNCj4gICB9DQo+IEBAIC03MjIsNyArNzIyLDggQEAgc3RhdGljIHN0cnVj
dCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJt
X2RyaXZlciAqZHJ2LA0KPiAgIAlzY3JlZW5fYmFzZSA9IGRldm1faW9yZW1hcF93YygmcGRl
di0+ZGV2LCBtZW0tPnN0YXJ0LCByZXNvdXJjZV9zaXplKG1lbSkpOw0KPiAgIAlpZiAoIXNj
cmVlbl9iYXNlKQ0KPiAgIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+IC0Jc2Rldi0+
c2NyZWVuX2Jhc2UgPSBzY3JlZW5fYmFzZTsNCj4gKw0KPiArCWlvc3lzX21hcF9zZXRfdmFk
ZHJfaW9tZW0oJnNkZXYtPnNjcmVlbl9iYXNlLCBzY3JlZW5fYmFzZSk7DQo+ICAgDQo+ICAg
CS8qDQo+ICAgCSAqIE1vZGVzZXR0aW5nDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------BQmT0HLWnqOZCb4WCyv0nbN6--

--------------spmmF4ZsdGLhAtEN58jDgQ4O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3jx0FAwAAAAAACgkQlh/E3EQov+AN
DhAAteEEaEN08+FgHDkWRBQuYUyR0nS95AcQCp6scbB+750isfEL80EnO5vXjdwXx1ocoOPnHAVZ
C8BRgGh88wE4ZF8hrrU9I8yWhxzFm4lPgedrb58Bh9bbwCZW6MC+yO/J1qZ4DB62HUoEjcrCmj7x
iikKvBmyzRyFh5GDXrUjHOsdNUcr+Sp0yPkUq4Y653XkrnCYt1ACOCSabxjnjMhn9fIN8p0TNLYH
wAu05qD6EayirRWX0GU0K0pED8dTh6DxN/yHVnX8F/CeTuHL1VIHK6pIz/ynxDeHjHRJpuMni2vb
QwZAdXmTOwruaETcsrmUT/HzScb7RxJy5v42LyMtl5g803BVcDvIMutwmqVGzjG0aVmqaxZCNp85
mKyLOGlkVpDo7CP41RJV6lTEeYQOPzofHukW6Qu1HlIL5uoMau4/XHjNV+1wN3CeFAsFy+aYa7gn
n90RjVoQes9BucL/wsyPLc/LOIkxVwdm+QhF4nWHg5b5KorPUIZ6e9/Y2QDb3yE+wzCk/do7wvAr
ZUWOFnxqLdmTOONxbwbgSAxLSFFRRKlWysYc7kDvLYJuIB8ZpoXA5e3LPquqpslTsnS1yKqNb2pv
Ojue1Y14lDtBv+yQhvvLEdIziTSTLl7woHa8CUmjkPMG8A5/mtsOKsxhgUqN02qCMVh4TG1hUtbB
XKg=
=fVBr
-----END PGP SIGNATURE-----

--------------spmmF4ZsdGLhAtEN58jDgQ4O--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A25B1D93
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 14:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2339C10E8E4;
	Thu,  8 Sep 2022 12:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A31B10E8E4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 12:47:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9DE733682;
 Thu,  8 Sep 2022 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662641272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BUaLgLriV1f3G3qrsYI2xnq3f8mTAun/YCp7dv2+kw=;
 b=zZf08ZONkEitQuOmnwZ50oKeNWGC1GUKTOUfpZyud7ez1rZimdqH4IYZa4GXMrb8vZt4t3
 i3kov8TaR79QgSVIdgQuCwOMUKu/1wLQHoQDNFU9Xh/ur51tAcbvY06t1QZoQf3WK91MgO
 WnBgkVNh92ixVNqLXBSYWUuaxg1LNKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662641272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BUaLgLriV1f3G3qrsYI2xnq3f8mTAun/YCp7dv2+kw=;
 b=Y9wUCiFhAzjHt4UOP1MOZm7DnAcwsPrH/OiUBfhvW2GRY/9x5U7Dqv9MHkjpxEyHD6x9Fe
 9pI4FDJwidjsf2CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE16D1322C;
 Thu,  8 Sep 2022 12:47:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mvRWLXjkGWN5KgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Sep 2022 12:47:52 +0000
Message-ID: <f9fb7d5d-6858-e221-098a-a8729e8a1857@suse.de>
Date: Thu, 8 Sep 2022 14:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 08/12] drm/udl: Pass rectangle directly to
 udl_handle_damage()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220908095115.23396-1-tiwai@suse.de>
 <20220908095115.23396-9-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220908095115.23396-9-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FyWq7L31mS9CpipZGqrGOwTF"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FyWq7L31mS9CpipZGqrGOwTF
Content-Type: multipart/mixed; boundary="------------Y2u0202x3jC0c64XPMbSY1Eu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <f9fb7d5d-6858-e221-098a-a8729e8a1857@suse.de>
Subject: Re: [PATCH v3 08/12] drm/udl: Pass rectangle directly to
 udl_handle_damage()
References: <20220908095115.23396-1-tiwai@suse.de>
 <20220908095115.23396-9-tiwai@suse.de>
In-Reply-To: <20220908095115.23396-9-tiwai@suse.de>

--------------Y2u0202x3jC0c64XPMbSY1Eu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDkuMjIgdW0gMTE6NTEgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEp1
c3QgZm9yIHNvbWUgY29kZSBzaW1wbGlmaWNhdGlvbi4NCj4gDQo+IFN1Z2dlc3RlZC1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNpZ25lZC1vZmYt
Ynk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCg0KV2l0aCBteSBjb21tZW50cyBm
aXhlZCwgeW91IGNhbiBhZGQNCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X21vZGVzZXQuYyB8IDIwICsrKysrKysrKy0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfbW9kZXNldC5jDQo+IGluZGV4IGM5YjgzN2FjMjZhNy4uMDE0MmZjNmE0Nzhh
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+IEBAIC0yNDQsMTQg
KzI0NCwxMyBAQCBzdGF0aWMgbG9uZyB1ZGxfbG9nX2NwcCh1bnNpZ25lZCBpbnQgY3BwKQ0K
PiAgIA0KPiAgIHN0YXRpYyBpbnQgdWRsX2hhbmRsZV9kYW1hZ2Uoc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIsDQo+ICAgCQkJICAgICBjb25zdCBzdHJ1Y3QgaW9zeXNfbWFwICptYXAs
DQo+IC0JCQkgICAgIGludCB4LCBpbnQgeSwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0KQ0KPiAr
CQkJICAgICBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApDQoNClNob3VsZCBwcm9iYWJseSBiZSBk
ZWNsYXJlZCBjb25zdC4NCg0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9
IGZiLT5kZXY7DQo+ICAgCXZvaWQgKnZhZGRyID0gbWFwLT52YWRkcjsgLyogVE9ETzogVXNl
IG1hcHBpbmcgYWJzdHJhY3Rpb24gcHJvcGVybHkgKi8NCj4gICAJaW50IGksIHJldDsNCj4g
ICAJY2hhciAqY21kOw0KPiAgIAlzdHJ1Y3QgdXJiICp1cmI7DQo+IC0Jc3RydWN0IGRybV9y
ZWN0IGNsaXA7DQo+ICAgCWludCBsb2dfYnBwOw0KPiAgIA0KPiAgIAlyZXQgPSB1ZGxfbG9n
X2NwcChmYi0+Zm9ybWF0LT5jcHBbMF0pOw0KPiBAQCAtMjU5LDggKzI1OCw2IEBAIHN0YXRp
YyBpbnQgdWRsX2hhbmRsZV9kYW1hZ2Uoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+
ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIAlsb2dfYnBwID0gcmV0Ow0KPiAgIA0KPiAtCWRybV9y
ZWN0X2luaXQoJmNsaXAsIHgsIHksIHdpZHRoLCBoZWlnaHQpOw0KPiAtDQo+ICAgCXJldCA9
IGRybV9nZW1fZmJfYmVnaW5fY3B1X2FjY2VzcyhmYiwgRE1BX0ZST01fREVWSUNFKTsNCj4g
ICAJaWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+IEBAIC0yNzIsMTEgKzI2OSwxMSBA
QCBzdGF0aWMgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIg
KmZiLA0KPiAgIAl9DQo+ICAgCWNtZCA9IHVyYi0+dHJhbnNmZXJfYnVmZmVyOw0KPiAgIA0K
PiAtCWZvciAoaSA9IGNsaXAueTE7IGkgPCBjbGlwLnkyOyBpKyspIHsNCj4gKwlmb3IgKGkg
PSBjbGlwLT55MTsgaSA8IGNsaXAtPnkyOyBpKyspIHsNCj4gICAJCWNvbnN0IGludCBsaW5l
X29mZnNldCA9IGZiLT5waXRjaGVzWzBdICogaTsNCj4gLQkJY29uc3QgaW50IGJ5dGVfb2Zm
c2V0ID0gbGluZV9vZmZzZXQgKyAoY2xpcC54MSA8PCBsb2dfYnBwKTsNCj4gLQkJY29uc3Qg
aW50IGRldl9ieXRlX29mZnNldCA9IChmYi0+d2lkdGggKiBpICsgY2xpcC54MSkgPDwgbG9n
X2JwcDsNCj4gLQkJY29uc3QgaW50IGJ5dGVfd2lkdGggPSAoY2xpcC54MiAtIGNsaXAueDEp
IDw8IGxvZ19icHA7DQo+ICsJCWNvbnN0IGludCBieXRlX29mZnNldCA9IGxpbmVfb2Zmc2V0
ICsgKGNsaXAtPngxIDw8IGxvZ19icHApOw0KPiArCQljb25zdCBpbnQgZGV2X2J5dGVfb2Zm
c2V0ID0gKGZiLT53aWR0aCAqIGkgKyBjbGlwLT54MSkgPDwgbG9nX2JwcDsNCj4gKwkJY29u
c3QgaW50IGJ5dGVfd2lkdGggPSAoY2xpcC0+eDIgLSBjbGlwLT54MSkgPDwgbG9nX2JwcDsN
Cg0KUGxlYXNlIHVzZSBkcm1fcmVjdF93aWR0aChjbGlwKSBpbnN0ZWFkLiBTb21laG93IHRo
ZXJlJ3MgYWxyZWFkeSB0b28gDQptdWNoIGNvZGUgdGhhdCBvcGVuLWNvZGVzIHRoaXMuDQoN
Cj4gICAJCXJldCA9IHVkbF9yZW5kZXJfaGxpbmUoZGV2LCBsb2dfYnBwLCAmdXJiLCAoY2hh
ciAqKXZhZGRyLA0KPiAgIAkJCQkgICAgICAgJmNtZCwgYnl0ZV9vZmZzZXQsIGRldl9ieXRl
X29mZnNldCwNCj4gICAJCQkJICAgICAgIGJ5dGVfd2lkdGgpOw0KPiBAQCAtMzI5LDYgKzMy
Niw3IEBAIHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2VuYWJsZShzdHJ1Y3QgZHJtX3NpbXBs
ZV9kaXNwbGF5X3BpcGUgKnBpcGUsDQo+ICAgCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0
b191ZGwoZGV2KTsNCj4gICAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUgPSAmY3J0
Y19zdGF0ZS0+bW9kZTsNCj4gICAJc3RydWN0IGRybV9zaGFkb3dfcGxhbmVfc3RhdGUgKnNo
YWRvd19wbGFuZV9zdGF0ZSA9IHRvX2RybV9zaGFkb3dfcGxhbmVfc3RhdGUocGxhbmVfc3Rh
dGUpOw0KPiArCXN0cnVjdCBkcm1fcmVjdCBjbGlwOw0KDQpCZXR0ZXIgZG8gYSBzdGF0aWMg
aW5pdCB3aXRoIERSTV9SRUNUX0lOSVQoMCwgMCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0KSAN
CmFuZCByZW1vdmUgdGhlIG90aGVyIGluaXQgY2FsbCBiZWxvdy4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPiAgIAljaGFyICpidWY7DQo+ICAgCWNoYXIgKndycHRyOw0KPiAgIAlp
bnQgY29sb3JfZGVwdGggPSBVRExfQ09MT1JfREVQVEhfMTZCUFA7DQo+IEBAIC0zNTQsNyAr
MzUyLDggQEAgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2lt
cGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4gICANCj4gICAJdWRsLT5tb2RlX2J1Zl9sZW4g
PSB3cnB0ciAtIGJ1ZjsNCj4gICANCj4gLQl1ZGxfaGFuZGxlX2RhbWFnZShmYiwgJnNoYWRv
d19wbGFuZV9zdGF0ZS0+ZGF0YVswXSwgMCwgMCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0KTsN
Cj4gKwlkcm1fcmVjdF9pbml0KCZjbGlwLCAwLCAwLCBmYi0+d2lkdGgsIGZiLT5oZWlnaHQp
Ow0KPiArCXVkbF9oYW5kbGVfZGFtYWdlKGZiLCAmc2hhZG93X3BsYW5lX3N0YXRlLT5kYXRh
WzBdLCAmY2xpcCk7DQo+ICAgDQo+ICAgCS8qIGVuYWJsZSBkaXNwbGF5ICovDQo+ICAgCXVk
bF9jcnRjX3dyaXRlX21vZGVfdG9faHcoY3J0Yyk7DQo+IEBAIC0zOTYsOCArMzk1LDcgQEAg
dWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfdXBkYXRlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3Bs
YXlfcGlwZSAqcGlwZSwNCj4gICAJCXJldHVybjsNCj4gICANCj4gICAJaWYgKGRybV9hdG9t
aWNfaGVscGVyX2RhbWFnZV9tZXJnZWQob2xkX3BsYW5lX3N0YXRlLCBzdGF0ZSwgJnJlY3Qp
KQ0KPiAtCQl1ZGxfaGFuZGxlX2RhbWFnZShmYiwgJnNoYWRvd19wbGFuZV9zdGF0ZS0+ZGF0
YVswXSwgcmVjdC54MSwgcmVjdC55MSwNCj4gLQkJCQkgIHJlY3QueDIgLSByZWN0LngxLCBy
ZWN0LnkyIC0gcmVjdC55MSk7DQo+ICsJCXVkbF9oYW5kbGVfZGFtYWdlKGZiLCAmc2hhZG93
X3BsYW5lX3N0YXRlLT5kYXRhWzBdLCAmcmVjdCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgdWRsX3NpbXBs
ZV9kaXNwbGF5X3BpcGVfZnVuY3MgPSB7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------Y2u0202x3jC0c64XPMbSY1Eu--

--------------FyWq7L31mS9CpipZGqrGOwTF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMZ5HgFAwAAAAAACgkQlh/E3EQov+AT
vg//YXF+3AJNlhpYYGiLF5+1c5bsYIbFgviUrQ3QYTkycFC0osVEdCDXYh7RsogFCWxHgWsVZv5f
KDzFQVfwttLZcNUS4RqJuuLS4y5V3NtvBKsY+2uhCoIrYB6K1IB0DysOpOJDYoINyindLPvHBUWw
4ZIY6rT5cw6HRZcZr+pK2n0zODo7EJK8t5RYD1wfEocjk6QkLLy2wsCsE97vJ8VthU0rSUniIhTf
Yt0jLHmC6sH+q7/yEFMj7b3P4mbJAyWPx05BKPZ5lxX5WVskmJh7k+CVbBBWv2aAfiUxEOTLw++n
/ozNgBx2leJPluKDBkTr3iiY1a9A+aYt9ksqFkPfZUQJF5M9L9neF5BlMBNY7S3K9kd6dzp7h/Et
VYfB5t48LxWD/ttvYzsMPnLOI9VWXAcnIsR6uoqOl0sKd8QQ7qdLwg5nzlFmgVTM27/RIVNDoLE/
5TAiYWGvRxOyTgFYv638jTdSngymxCS/NhdDxt2CBVd35YqEfy2Otws1pLPcxPsw7S9JqV87YqOl
2ZJm0Aps8JzhFhMXT6zIZlSpMSEe/Ob0tai7faFAniRXF7jX1EelMRqCEKXhRi35bedfbSXFPeWM
8KcG374hFnBAwN8eC31xSMyX9a7DOsxL6scqkmvW/u1bfkj9uAF6lKDFnRiQZFz4tAlfk54+7WM9
FeU=
=i/NJ
-----END PGP SIGNATURE-----

--------------FyWq7L31mS9CpipZGqrGOwTF--

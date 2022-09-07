Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21505AFCF5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C37F10E386;
	Wed,  7 Sep 2022 06:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283A110E386
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:59:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B71722239D;
 Wed,  7 Sep 2022 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662533958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oiS1rwZIBzitKuZA5LjmyNlmvG7hjm1vVeLhMtULfAg=;
 b=HvvuTj4Zbvvv9X/nHdpUEWFKmCdOWhpIbaE4PCRC1wxo9sU/Wyl6M5dWb5WLoSbQlrU/gk
 52+NPjpbaL1fdEbR/DrqOdBWnWTG6AQYyw5BYJpIkx0MaeG0DjoDjYpHHChWps9t9MSIcf
 Pdewolr55PH6Is1RG/2vOu+MlMKqOxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662533958;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oiS1rwZIBzitKuZA5LjmyNlmvG7hjm1vVeLhMtULfAg=;
 b=nHxVSTefttcwRyLOO87QclJCKnoS3Y152tzpSL6KOlhVI4ncTHkw2OHnUw88dNciswJ6oS
 AVUm+TOI+4/ciSAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 998B713486;
 Wed,  7 Sep 2022 06:59:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hW2EJEZBGGNNbQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 06:59:18 +0000
Message-ID: <a659a499-1afd-aec2-01da-bb79c11d0ba2@suse.de>
Date: Wed, 7 Sep 2022 08:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/udl: Enable damage clipping
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220728074756.6108-1-tzimmermann@suse.de>
 <Yxeg/X7RNOpa58gg@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yxeg/X7RNOpa58gg@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G6LZG4JBs2TnAdEs5tujCJR4"
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
Cc: airlied@linux.ie, airlied@redhat.com, sean@poorly.run,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G6LZG4JBs2TnAdEs5tujCJR4
Content-Type: multipart/mixed; boundary="------------ED7RIi0KuLvFh2lGLrRC5VvZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, airlied@redhat.com, sean@poorly.run,
 dri-devel@lists.freedesktop.org
Message-ID: <a659a499-1afd-aec2-01da-bb79c11d0ba2@suse.de>
Subject: Re: [PATCH] drm/udl: Enable damage clipping
References: <20220728074756.6108-1-tzimmermann@suse.de>
 <Yxeg/X7RNOpa58gg@phenom.ffwll.local>
In-Reply-To: <Yxeg/X7RNOpa58gg@phenom.ffwll.local>

--------------ED7RIi0KuLvFh2lGLrRC5VvZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjIgdW0gMjE6MzUgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEp1bCAyOCwgMjAyMiBhdCAwOTo0Nzo1NkFNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IENhbGwgZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMo
KSBhbmQgZ2l2ZSB1c2Vyc3BhY2UgYSBjaGFuY2UNCj4+IG9mIG1pbmltaXppbmcgdGhlIHVw
ZGF0ZWQgZGlzcGxheSBhcmVhLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX21vZGVzZXQuYyB8IDEgKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+PiBp
bmRleCBlNjdjNDBhNDhmYjQuLmNlNDI3MTI4ZjAzNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfbW9kZXNldC5jDQo+PiBAQCAtNDc5LDYgKzQ3OSw3IEBAIGludCB1ZGxfbW9k
ZXNldF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIAkJCQkJICAgZm9ybWF0
X2NvdW50LCBOVUxMLCBjb25uZWN0b3IpOw0KPj4gICAJaWYgKHJldCkNCj4+ICAgCQlyZXR1
cm4gcmV0Ow0KPj4gKwlkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygmdWRsLT5k
aXNwbGF5X3BpcGUucGxhbmUpOw0KPiANCj4gSSdtIGFzc3VtaW5nIHRoaXMgcGFzc2VzIHdp
dGggYWxsIHRoZSBpZ3RzIHdlIGhhdmUgKEkgaG9wZSB0aG9zZSBmaW5hbGx5DQo+IGxhbmRl
ZCkgYW5kIGEgZGFtYWdlLWNhcGFibGUgY29tcG9zaXRvciBkb2Vzbid0IGdvIGJvb20gZWl0
aGVyPw0KPiANCj4gRWl0aGVyIHdheSBwYXRjaCBsZ3RtLiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4gDQo+IEFsc28gSSB3b25kZXIg
d2hldGhlciB3ZSBzaG91bGQgaGF2ZSBhIGNoZWNrIGluIHRoZSBkYW1hZ2UgaGVscGVycyB0
byBtYWtlDQo+IHN1cmUgZHJpdmVycyBkb24ndCBmb3JnZXQgdG8gY2FsbCB0aGlzIGZ1bmN0
aW9uIHRvIHNldCB1cCB0aGUgdWFwaSAuLi4NCg0KSXQgd2FybnMsIGJ1dCB5b3UgY2FuIGln
bm9yZSB0aGF0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBDaGVlcnMsIERh
bmllbA0KPiANCj4+ICAgDQo+PiAgIAlkcm1fbW9kZV9jb25maWdfcmVzZXQoZGV2KTsNCj4+
ICAgDQo+PiAtLSANCj4+IDIuMzcuMQ0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------ED7RIi0KuLvFh2lGLrRC5VvZ--

--------------G6LZG4JBs2TnAdEs5tujCJR4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYQUUFAwAAAAAACgkQlh/E3EQov+CA
lg//SHNT1fJS7Ns8DE8GSqZxoMeXM19GaJPvLWFl1sTlgkSjh2Z9zNSrkRmIEIgmardYMkpexgIq
eagN2fLaApOs9xLBEZG1hCt9PB2YMDYNR+HnNEaO8NgIBz7uvvJ2+vbwwHUrR00VgInmdInQewoI
bNwlPNv77od6KcekxmFR1bEzsB5KzpjYwzAplpYIx+/7uZ2eIw0y7BNDwipiwYrcu7PB9W7GRRgk
UtnSGVSokpdUW2mkyV9JGK2akPlBBgGhrCKQrQIvG/ehfDvYEbQtss9wkk0Uib4rw9k9ODoNH+AU
uOBShHhem+B0Zq125l8RSMLeK/aAq4MMUeP9ZPe2e2xdsOieGqkE+vIB0DOkUyj/y6gwqrqaHCBM
OZxRUnJ87JNrguROPJcyO06zSfYY6gOKgqmp7oeRVE9mWxRGPA5kFYrMuoZNS6tQ0DfrMYO1TMFf
61VqK9LqfV7LPphLEY7bUgosaZnEJ/GPfynzu7GkR5sJuHILkbUIPWRYLWXuEaxjSoa0IAkO5LLg
ukIOYLhPsw0Kc+IJQE24J1qbBYF1Jmvcdai2O9SGBGqfRinakUtgwZiEooZgz+AQe9bUHg6XWPJJ
/WBSy6873K/+oGGcNLIS96mr73eWcfmRLWHBjXDS1nsHGOnnL94KVMdKvFDkkOgpLTpdM6YuPEOG
rgo=
=oz5X
-----END PGP SIGNATURE-----

--------------G6LZG4JBs2TnAdEs5tujCJR4--

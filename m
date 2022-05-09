Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F5520439
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 20:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1343310F1AF;
	Mon,  9 May 2022 18:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE4F10F1AF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 18:12:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0A7021C78;
 Mon,  9 May 2022 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652119949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVJNDHCPrYhpEGCKd4JONsO07ZViNqzGwhPYmef++R4=;
 b=uWjotg7DlK2IwQ44cWHWT50Mi/jim+8nrl7L4a7tT5jUzDfRkhN4OWHmHtpqrLvSkb23gv
 WQcN8EhrfYp0HjxfF7GcOTiZt/RK/5CSDd4hIDjLQPBa0gKoEE9qBT3CJVxSGOyUg5/P5c
 MGk/1xIzVXDnztT6B/p7bPNbPzoqbvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652119949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVJNDHCPrYhpEGCKd4JONsO07ZViNqzGwhPYmef++R4=;
 b=A5itkYGR9XpFHdq8IcUWHentxTaXeKhi2HSeLtKxoXjheR3u2JVX7N5PIqN9O3HNm7YKnU
 pNY/iHPEFhcVGcDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9497013AA5;
 Mon,  9 May 2022 18:12:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TUrdIo1ZeWLhYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 18:12:29 +0000
Message-ID: <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
Date: Mon, 9 May 2022 20:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y4cdGtjzag3yXAAgKVCxRy2T"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Y4cdGtjzag3yXAAgKVCxRy2T
Content-Type: multipart/mixed; boundary="------------0FWf6gk9D6ci0RGqpyJQqk10";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
In-Reply-To: <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>

--------------0FWf6gk9D6ci0RGqpyJQqk10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA5LjA1LjIyIHVtIDE4OjMzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBPbiA1LzkvMjIgMTc6NTEsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6
DQo+IA0KPiBbc25pcF0NCj4gDQo+Pj4+PiArDQo+Pj4+IFJlZ2FyZGluZyBkcm06DQo+Pj4+
IFdoYXQgYWJvdXQgZHJtX2ZiX2hlbHBlcl9maW5pPyBJdCBjYWxscyBhbHNvIGZyYW1lYnVm
ZmVyX3JlbGVhc2UgYW5kIGlzDQo+Pj4+IGNhbGxlZCBvZnRlbiBmcm9tIF9yZW1vdmUgcGF0
aHMgKGNoZWNrZWQgaW50ZWwvcmFkZW9uL25vdXZlYXUpLiBJIGd1ZXNzDQo+Pj4+IGl0IHNo
b3VsZCBiZSBmaXhlZCBhcyB3ZWxsLiBEbyB5b3UgcGxhbiB0byBmaXggaXQ/DQo+Pj4+DQo+
Pj4gSSB0aGluayB5b3UgYXJlIGNvcnJlY3QuIE1heWJlIHdlIG5lZWQgc29tZXRoaW5nIGxp
a2UgdGhlIGZvbGxvd2luZz8NCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0K
Pj4+IGluZGV4IGQyNjVhNzMzMTNjOS4uYjA5NTk4ZjdhZjI4IDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4gQEAgLTYzMSw3ICs2MzEsNiBAQCB2b2lkIGRy
bV9mYl9oZWxwZXJfZmluaShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyKQ0KPj4+
ICAgICAgICAgICBpZiAoaW5mbykgew0KPj4+ICAgICAgICAgICAgICAgICAgIGlmIChpbmZv
LT5jbWFwLmxlbikNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGZiX2RlYWxsb2Nf
Y21hcCgmaW5mby0+Y21hcCk7DQo+Pj4gLSAgICAgICAgICAgICAgIGZyYW1lYnVmZmVyX3Jl
bGVhc2UoaW5mbyk7DQo+Pg0KPj4gV2hhdCBhYm91dCBjbWFwPyBJIGFtIG5vdCBhbiBmYiBl
eHBlcnQsIGJ1dCBJTU8gY21hcCBjYW4gYmUgYWNjZXNzZWQNCj4+IGZyb20gdXNlcnNwYWNl
IGFzIHdlbGwuDQo+Pg0KPiANCj4gSSBhY3R1YWxseSB0aG91Z2h0IGFib3V0IHRoZSBzYW1l
IGJ1dCB0aGVuIHJlbWVtYmVyZWQgd2hhdCBEYW5pZWwgc2FpZCBpbiBbMF0NCj4gKEFGQUlV
IGF0IGxlYXN0KSB0aGF0IHRoZXNlIHNob3VsZCBiZSBkb25lIGluIC5yZW1vdmUoKSBzbyB0
aGUgY3VycmVudCBjb2RlDQo+IGxvb2tzIGxpa2UgbWF0Y2hlcyB0aGF0IGFuZCBvbmx5IGZy
YW1lYnVmZmVyX3JlbGVhc2UoKSBzaG91bGQgYmUgbW92ZWQuDQo+IA0KPiBGb3IgdmVzYWZi
IGEgcHJldmlvdXMgcGF0Y2ggcHJvcG9zZWQgdG8gYWxzbyBtb3ZlIGEgcmVsZWFzZV9yZWdp
b24oKSBjYWxsIHRvDQo+IC5mYl9kZXN0cm95KCkgYW5kIERhbmllbCBhbHNvIHNhaWQgdGhh
dCBpdCB3YXMgaWZmeSBhbmQgc2hvdWxkbid0IGJlIGRvbmUgWzFdLg0KPiANCj4gQnV0IEkn
bSBhbHNvIG5vdCBmYiBleHBlcnQgc28gaGFwcHkgdG8gbW92ZSBmYl9kZWFsbG9jX2NtYXAo
KSBhcyB3ZWxsIGlmIHRoYXQNCj4gaXMgdGhlIGNvcnJlY3QgdGhpbmcgdG8gZG8uDQoNClRo
ZSBjbWFwIGRhdGEgc3RydWN0dXJlIGlzIHNvZnR3YXJlIHN0YXRlIHRoYXQgY2FuIGJlIGFj
Y2Vzc2VkIHZpYSBpY290bCANCmFzIGxvbmcgYXMgdGhlIGRldmZpbGUgaXMgb3Blbi4gRHJp
dmVycyB1cGRhdGUgdGhlIGhhcmR3YXJlIGZyb20gaXQuIFNlZSANClsxXS4gIE1vdmluZyB0
aGF0IGNsZWFudXAgaW50byBmYl9kZXN0cm95IHNlZW1zIGFwcHJvcHJpYXRlIHRvIG1lLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS4xNy42L3NvdXJjZS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
bWFwLmMjTDIzMQ0KDQo+IA0KPiBbMF06IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3Rz
L2RyaS1kZXZlbC9tc2czNDYyNTcuaHRtbA0KPiBbMV06IGh0dHBzOi8vd3d3LnNwaW5pY3Mu
bmV0L2xpc3RzL2RyaS1kZXZlbC9tc2czNDYyNjEuaHRtbA0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------0FWf6gk9D6ci0RGqpyJQqk10--

--------------Y4cdGtjzag3yXAAgKVCxRy2T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ5WYwFAwAAAAAACgkQlh/E3EQov+D3
oRAAwhcWj+xF2+5wjrKlJ+fOT7Ya14ZtuAsZGX3eGUPFbPJgVrwBuLARp6cxL16bgX91/oRodc24
6Oxua0woQBDG9Y5P3rw6Z2Xx1Z7TgubZ/1RNYvg/VKuIkYOETnYX3nu/zjOzxlPuI4f3KHM3NB0A
WSZnIQ3P8UNndkJC+Q40khcaalFhYQtcGm65ROrqF80I6seXrs5St9az3df1Ea8caLhebMkAALVY
jwx2fQMh3aaXuEVWs/QwtfXTSf9pXZKESlMJA7wsJMKSlFE1No5vryPd57CrbLQlbNieFElX0W3e
apvf37cCjE3M+nWPGlFq59SAVWY2MXLS7So9/GAlzeuSpaZyTZ05joIX1yOadIonwlZsa7lGrjH7
1xUW6CJvxRUSauw6HmcYa2eEK3jv1Mt2yitGhBm87E8dALIAVvmmTLiudakJ24SQ2I4y8V0R5jFI
UmTaR5QsNHT3MHKemojaA23CdnAu1EBWoOFa0qGuvdzFbsib3LNXfT2/rMtVf1MCGXv5Qqda8gx5
9TLUiXpQSD2ALqhpmqLSBAh/CJ0VEfSHGP9C6eNurwiOrOq+VTmQ5pv8fzTbJmFN8HjmT9tWnexp
WJKChQ7ZxhcnI0ETqKQR05j5PiXtZ96kTV1D9z0y8UFvhAnVzbW0yjKtTsdbsbmpjUGYIMmu8Zx7
4J8=
=xG2O
-----END PGP SIGNATURE-----

--------------Y4cdGtjzag3yXAAgKVCxRy2T--

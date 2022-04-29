Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227A514694
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D5910FC46;
	Fri, 29 Apr 2022 10:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9BA10FC45
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 10:20:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F834210F3;
 Fri, 29 Apr 2022 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651227612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeylsrOmZMQuOB0uTIqsZXkrZHaf0IuYQAdi9ntjrcw=;
 b=JvMvOWZ1gK1UlG+HljbtsB3gCsptkVUsSoK0ewAJn+ZG+5tRvwexq99BJoyE1J5Bm1zShi
 vzTFgOQN1hXTrxISYaTOyXGn4FJGzpycj0fh6vhH6hwZgZMrwa3SpGM7jf8wUwFlHDxjPn
 zYfBCC93lg+nV7T57ovacWJ+hkCJEuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651227612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeylsrOmZMQuOB0uTIqsZXkrZHaf0IuYQAdi9ntjrcw=;
 b=znZOPtmmvPwiWYEij1KNexOok/dzSfQCnit8eGle2Klub1KfRnquaMRhpOlPK00pSSvdcr
 FtiXKYr9DTttwRDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D09A13AE0;
 Fri, 29 Apr 2022 10:20:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bBElBty7a2I6HQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Apr 2022 10:20:12 +0000
Message-ID: <82dc11b4-d8da-e9e9-8181-5695fbd806de@suse.de>
Date: Fri, 29 Apr 2022 12:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v4 02/11] drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag
 for DRIVER_FIRMWARE fb
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220429084253.1085911-1-javierm@redhat.com>
 <20220429084253.1085911-3-javierm@redhat.com>
 <7ce2f8e1-9cf2-4d89-99c2-b4280e4758ba@suse.de>
 <476d57e5-69dd-94b5-779f-230e091ae62f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <476d57e5-69dd-94b5-779f-230e091ae62f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SXDCMRwBqqpO7jtXdI3GD3WU"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SXDCMRwBqqpO7jtXdI3GD3WU
Content-Type: multipart/mixed; boundary="------------gKJ30Z0BL3eTmHZCzGyAn803";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <82dc11b4-d8da-e9e9-8181-5695fbd806de@suse.de>
Subject: Re: [RFC PATCH v4 02/11] drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag
 for DRIVER_FIRMWARE fb
References: <20220429084253.1085911-1-javierm@redhat.com>
 <20220429084253.1085911-3-javierm@redhat.com>
 <7ce2f8e1-9cf2-4d89-99c2-b4280e4758ba@suse.de>
 <476d57e5-69dd-94b5-779f-230e091ae62f@redhat.com>
In-Reply-To: <476d57e5-69dd-94b5-779f-230e091ae62f@redhat.com>

--------------gKJ30Z0BL3eTmHZCzGyAn803
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDI5LjA0LjIyIHVtIDExOjIzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiA0LzI5LzIyIDExOjE0
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjkuMDQuMjIg
dW0gMTA6NDIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+Pj4gVGhlIERS
SVZFUl9GSVJNV0FSRSBmbGFnIGRlbm90ZXMgdGhhdCBhIERSTSBkcml2ZXIgdXNlcyBhIGZy
YW1lYnVmZmVyDQo+Pj4gdGhhdCB3YXMgaW5pdGlhbGl6ZWQgYW5kIHByb3ZpZGVkIGJ5IHRo
ZSBzeXN0ZW0gZmlybXdhcmUgZm9yIHNjYW5vdXQuDQo+Pj4NCj4+PiBJbmRpY2F0ZSB0byB0
aGUgZmJkZXYgc3Vic3lzdGVtIHRoYXQgdGhlIHJlZ2lzdGVyZWQgZnJhbWVidWZmZXIgaXMg
YQ0KPj4+IEZCSU5GT19NSVNDX0ZJUk1XQVJFLCBzbyB0aGF0IGl0IGNhbiBoYW5kbGUgYWNj
b3JkaW5nbHkuIEZvciBleGFtcGxlLA0KPj4+IHdvbGQgaG90LXVucGx1ZyB0aGUgYXNzb2Np
YXRlZCBkZXZpY2UgaWYgYXNrZWQgdG8gcmVtb3ZlIGNvbmZsaWN0aW5nDQo+Pj4gZnJhbWVi
dWZmZXJzLg0KPj4+DQo+Pj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+PiAtLS0NCj4+Pg0KPj4+IChubyBj
aGFuZ2VzIHNpbmNlIHYxKQ0KPj4+DQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYyB8IDQgKysrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4+IGluZGV4IGQyNjVh
NzMzMTNjOS4uNzZkZDExODg4NjIxIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJfaGVscGVyLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jDQo+Pj4gQEAgLTE4OTEsNiArMTg5MSwxMCBAQCBfX2RybV9mYl9oZWxwZXJfaW5p
dGlhbF9jb25maWdfYW5kX3VubG9jayhzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVy
LA0KPj4+ICAgIAkJLyogZG9uJ3QgbGVhayBhbnkgcGh5c2ljYWwgYWRkcmVzc2VzIHRvIHVz
ZXJzcGFjZSAqLw0KPj4+ICAgIAkJaW5mby0+ZmxhZ3MgfD0gRkJJTkZPX0hJREVfU01FTV9T
VEFSVDsNCj4+PiAgICANCj4+PiArCS8qIEluZGljYXRlIHRoYXQgdGhlIGZyYW1lYnVmZmVy
IGlzIHByb3ZpZGVkIGJ5IHRoZSBmaXJtd2FyZSAqLw0KPj4+ICsJaWYgKGRybV9jb3JlX2No
ZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfRklSTVdBUkUpKQ0KPj4+ICsJCWluZm8tPmZsYWdz
IHw9IEZCSU5GT19NSVNDX0ZJUk1XQVJFOw0KPj4+ICsNCj4+DQo+PiBQYXRjaGVzIDEgdG8g
MyBzaG91bGQgYmUgc3F1YXNoZWQgaW50byBvbmUgYmVmb3JlIGxhbmRpbmcuDQo+Pg0KPiAN
Cj4gSSBhY3R1YWxseSBjb25zaWRlcmVkIHRoaXMgYnV0IHRoZW4gZGVjaWRlZCB0byBnbyB3
aXRoIHRoZSBlYWNoIGNoYW5nZQ0KPiBnb2VzIGludG8gaXRzIG93biBwYXRjaCBhcHByb2Fj
aC4gQnV0IEknbGwgc3F1YXNoIGl0IGluIG5leHQgcmV2aXNpb25zLg0KPiAgIA0KPj4gV2Ug
Y2FuIGRvIHRoaXMgd2l0aCBEUklWRVJfRklSTVdBUkUuIEFsdGVybmF0aXZlbHksIEknZCBz
dWdnZXN0IHRvIHdlDQo+PiBjb3VsZCBhbHNvIHVzZWQgdGhlIGV4aXN0aW5nIGZpbmFsIHBh
cmFtZXRlciBvZg0KPj4gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSB0byBwYXNzIGEgZmxh
ZyB0aGF0IGRlc2lnbmF0ZXMgYSBmaXJtd2FyZSBkZXZpY2UuDQo+Pg0KPiANCj4gQnkgZXhp
c3RpbmcgZmluYWwgcGFyYW1ldGVyIHlvdSBtZWFuIEBwcmVmZXJyZWRfYnBwID8gVGhhdCBk
b2Vzbid0IHNlZW0NCj4gY29ycmVjdC4gSSBhbHNvIGxpa2UgdGhhdCBieSB1c2luZyBEUklW
RVJfRklSTVdBUkUgaXQgaXMgY29tcGxldGVseSBkYXRhDQo+IGRyaXZlbiBhbmQgdHJhbnNw
YXJlbnQgdG8gdGhlIERSTSBkcml2ZXIuDQoNCkRSSVZFUl9GSVJNV0FSRSBpcyBhbiBpbmRp
cmVjdGlvbiBhbmQgb25seSB1c2VkIGhlcmUuIChKdXN0IGxpa2UgDQpGQklORk9fTUlTQ19G
SVJNV0FSRSBpcyBhIGJhZCBpbnRlcmZhY2UgZm9yIG1hcmtpbmcgZnJhbWVidWZmZXJzIHRo
YXQgDQpjYW4gYmUgdW5wbHVnZ2VkLikgSWYgYSBkcml2ZXIgc3VwcG9ydHMgaG90LXVucGx1
Z2dpbmcsIGl0IHNob3VsZCBzaW1wbHkgDQpyZWdpc3RlciBpdHNlbGYgd2l0aCBhcGVydHVy
ZSBoZWxwZXJzLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgaXQncyBhIA0KZmlybXdhcmUgZnJh
bWVidWZmZXIgb3Igbm90Lg0KDQpPZiBwcmVmZXJyZWRfYnBwLCB3ZSByZWFsbHkgb25seSB1
c2UgdGhlIGxvd2VzdCBieXRlLiBBbGwgb3RoZXIgYml0cyBhcmUgDQp1cCBmb3IgZ3JhYmJp
bmcuICBUaGUgYXJndW1lbnQgaXMgYSB3b3JrYXJvdW5kIGZvciBoYW5kbGluZyANCm1vZGVf
Y29uZmlnLnByZWZlcmVkX2RlcHRoIGNvcnJlY3RseS4NCg0KRXZlbnR1YWxseSwgcHJlZmVy
cmVkX2RlcHRoIHNob3VsZCBiZSByZXBsYWNlZCBieSBzb21ldGhpbmcgbGlrZSANCidwcmVm
ZXJyZWRfZm9ybWF0Jywgd2hpY2ggd2lsbCBob2xkIHRoZSBkcml2ZXIncyBwcmVmZXJyZWQg
Zm9ybWF0IGluIA0KNENDLiAgV2Ugd29uJ3QgbmVlZCBwcmVmZXJyZWRfYnBwIHRoZW4uIFNv
IHdlIGNvdWxkIHR1cm4gcHJlZmVycmVkX2JwcCANCmludG8gYSBmbGFncyBhcmd1bWVudC4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gT3IgZG8geW91IGVudmlzaW9uIGEg
Y2FzZSB3aGVyZSBhIGRyaXZlciB3b3VsZCBiZSBEUklWRVJfRklSTVdBUkUgYnV0IHdlDQo+
IHdvdWxkbid0IHdhbnQgdGhlIGVtdWxhdGVkIGZiZGV2IHRvIGFsc28gYmUgRkJJTkZPX01J
U0NfRklSTVdBUkUgPw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------gKJ30Z0BL3eTmHZCzGyAn803--

--------------SXDCMRwBqqpO7jtXdI3GD3WU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJru9sFAwAAAAAACgkQlh/E3EQov+AW
xw/+PmJ9LsMuoH+9GUcEHArQCkX7beYKYgXVo3lCd/OGSbxMCJKnjNskOUFPGu4k6U8CyB9DORKd
SSB/DR3/Ys8m6MsNqsykOIHKBr60vCEGEhax3CoSTB5ZLtJ8gox5iSewdG3pJ9CXVT5q7f0zJA25
0Fvwd+RQN8f/cQ+pQrg0bqCntG6Ik3XLlOCPE9qayu4Ctc0cJgZi5tIOR/G2FOG3U0cqtHcoAoGz
6UgcBaYdzw6uB0yLuqFd4HGVHibSldJFwMeelfWT2qyISEgbF57bbdZqKIM4KO2fVsoLC/sFLZ9d
hxZugLvm6GCxEzng6cAV9u5rxpFLmn3hQ4vNvwia6jkwsRA85HmFDCzYdSJ/WpWEeg7zZWwTeg8E
A4DdFTjxQYwOo4AMaWULjh4Q2Nuytqk65Hz8sy/KvtMcahMyM74mRlu8A2IFGkE7nslM09qyHDGC
nXVumYGgP2kGidIz8sdqQGHnbq/OgJiEM1S3krt+Dkr/1NnKgRitF+WoNwj4sXrdWE5bTw8z/kEI
Zf3yZzaX3HXtx1v1zQkGEivt4vQYRR1HtV8QUgln3dhhUlrCT/IoTIF0/lRcrBT88jEN7rr5Qn0P
u693j3lvR4BEAfVxtyojCkz8xUVKlXtDWQAKeNO4l8yV1u48/R36Rvr+GB7mR8chMcFnpLW0qRU6
5W8=
=UOB1
-----END PGP SIGNATURE-----

--------------SXDCMRwBqqpO7jtXdI3GD3WU--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC46A5921
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B622310E68F;
	Tue, 28 Feb 2023 12:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA4010E4CA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:34:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3017F21A4D;
 Tue, 28 Feb 2023 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677587693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QeeXlra3VuU6LyC91LsHvOXdehf+ph2YN1KKB1StGM0=;
 b=DP/MAMEsNUcW3z6h43PYUe9qldRXRFYbC8Y2SyPBAD6pxoW9VxwYhZbdz4KyudAWP2gFof
 cBKbXU6Fu2SoJhsjXHXPUttBehbs5J2tIKiS7xSJ2xP1jm4RdP19d3eVhErcxV8wE0sj5J
 f9Lw7no5m8ZdRKBI88GgymRxFFbizzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677587693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QeeXlra3VuU6LyC91LsHvOXdehf+ph2YN1KKB1StGM0=;
 b=9Azfkn2YB6UkHvWoTx2jSmQ/F6Tgo9NGRacekgcA3rZ4sZQMT717bQFRFwt0hmc+8Vn7KH
 8iYLHfOTkeDpRFCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC4401333C;
 Tue, 28 Feb 2023 12:34:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S2XWN+z0/WO0EgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 12:34:52 +0000
Message-ID: <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>
Date: Tue, 28 Feb 2023 13:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20230227173800.2809727-1-robdclark@gmail.com>
 <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
 <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kib98pZnBxR2VOueRxXAADTt"
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kib98pZnBxR2VOueRxXAADTt
Content-Type: multipart/mixed; boundary="------------czIRFMXLxzNN8JXBsG00EhqZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Message-ID: <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
References: <20230227173800.2809727-1-robdclark@gmail.com>
 <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
 <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>

--------------czIRFMXLxzNN8JXBsG00EhqZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDIuMjMgdW0gMTk6MTUgc2NocmllYiBSb2IgQ2xhcms6DQo+IE9uIE1v
biwgRmViIDI3LCAyMDIzIGF0IDk6NTcgQU0gRG1pdHJ5IE9zaXBlbmtvDQo+IDxkbWl0cnku
b3NpcGVua29AY29sbGFib3JhLmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gMi8yNy8yMyAyMDoz
OCwgUm9iIENsYXJrIHdyb3RlOg0KPj4gLi4uDQo+Pj4gKyAgICAgaWYgKElTX0VOQUJMRUQo
Q09ORklHX0RSTV9WSVJUSU9fR1BVX0tNUykpIHsNCj4+PiArICAgICAgICAgICAgIC8qIGdl
dCBkaXNwbGF5IGluZm8gKi8NCj4+PiArICAgICAgICAgICAgIHZpcnRpb19jcmVhZF9sZSh2
Z2Rldi0+dmRldiwgc3RydWN0IHZpcnRpb19ncHVfY29uZmlnLA0KPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG51bV9zY2Fub3V0cywgJm51bV9zY2Fub3V0cyk7DQo+Pj4g
KyAgICAgICAgICAgICB2Z2Rldi0+bnVtX3NjYW5vdXRzID0gbWluX3QodWludDMyX3QsIG51
bV9zY2Fub3V0cywNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBWSVJUSU9fR1BVX01BWF9TQ0FOT1VUUyk7DQo+Pj4gKyAgICAgICAgICAgICBpZiAo
IXZnZGV2LT5udW1fc2Nhbm91dHMpIHsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgLyoN
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICogSGF2aW5nIGFuIEVESUQgYnV0IG5vIHNj
YW5vdXRzIGlzIG5vbi1zZW5zaWNhbCwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICog
YnV0IGl0IGlzIHBlcm1pdHRlZCB0byBoYXZlIG5vIHNjYW5vdXRzIGFuZCBubw0KPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgKiBFRElEIChpbiB3aGljaCBjYXNlIERSSVZFUl9NT0RF
U0VUIGFuZA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgKiBEUklWRVJfQVRPTUlDIGFy
ZSBub3QgYWR2ZXJ0aXNlZCkNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICovDQo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIGlmICh2Z2Rldi0+aGFzX2VkaWQpIHsNCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIm51bV9zY2Fub3V0cyBpcyB6
ZXJvXG4iKTsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlO
VkFMOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3NjYW5v
dXRzOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgICB9DQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIGRldi0+ZHJpdmVyX2ZlYXR1cmVzICY9IH4oRFJJVkVSX01PREVTRVQgfCBEUklW
RVJfQVRPTUlDKTsNCj4+DQo+PiBJZiBpdCdzIG5vdyBjb25maWd1cmFibGUgYnkgaG9zdCwg
d2h5IGRvIHdlIG5lZWQgdGhlDQo+PiBDT05GSUdfRFJNX1ZJUlRJT19HUFVfS01TPw0KPiAN
Cj4gQmVjYXVzZSBhIGtlcm5lbCBjb25maWcgb3B0aW9uIG1ha2VzIGl0IG1vcmUgb2J2aW91
cyB0aGF0DQo+IG1vZGVzZXQvYXRvbWljIGlvY3RscyBhcmUgYmxvY2tlZC4gIFdoaWNoIG1h
a2VzIGl0IG1vcmUgb2J2aW91cyBhYm91dA0KPiB3aGVyZSBhbnkgcG90ZW50aWFsIHNlY3Vy
aXR5IGlzc3VlcyBhcHBseSBhbmQgd2hlcmUgZml4ZXMgbmVlZCB0byBnZXQNCj4gYmFja3Bv
cnRlZCB0by4gIFRoZSBjb25maWcgb3B0aW9uIGlzIHRoZSBvbmx5IHRoaW5nIF9JXyB3YW50
LA0KPiBldmVyeXRoaW5nIGVsc2UgaXMganVzdCBhIGJvbnVzIHRvIGhlbHAgb3RoZXIgcGVv
cGxlJ3MgdXNlLWNhc2VzLg0KDQpJIGZpbmQgdGhpcyB2ZXJ5IHZhZ3VlLiBXaGF0J3MgdGhl
IHNlY3VyaXR5IHRocmVhZD8NCg0KQW5kIGlmIHRoZSBjb25maWcgb3B0aW9uIGlzIHVzZWZ1
bCwgc2hvdWxkbid0IGl0IGJlIERSTS13aWRlPyBUaGUgDQptb2Rlc2V0dGluZyBpb2N0bCBj
YWxscyBhcmUgc2hhcmVkIGFtb25nIGFsbCBkcml2ZXJzLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiBCUiwNCj4gLVINCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------czIRFMXLxzNN8JXBsG00EhqZ--

--------------kib98pZnBxR2VOueRxXAADTt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP99OwFAwAAAAAACgkQlh/E3EQov+Di
BA//Z1MgDU0ETg5Iwn0/l0njsy1mNJ4yWhHTXumJfUH/jzwV/4jUUFsd+itsCWy7ZuHvdfA7OXyr
c5mNF0hp/4y2g3sDfHRqyeINah8iRECwjC9usv3bOZDUwfjEa3AJ4PvB7QdIsi6Wi+8urXd49DyI
PHF9eODDhtf8uRRoneiVWlefR4WjjKR93jvpfWZtEPz8/TK8OpDofswBr7pseB0eXjYPqIKmwrLS
Wzf/tSPmbE6k6lq/BZOQOErkRawqpTH/5V9Q+RZOOUkcsBUpf8yiLrPEj6OGzrDWfAFvxPAvgTd4
S6FKH2tLETcmHEJBzVOTN07UL7PrcGFnFJ0x+3SmdIYH9afbmzEN2+YCgCnlzzN9RFLqpvTdqX3a
Wp5g/OpNBGIwPBvkMz3qHCTJdkCRaEY/jBFEZkzxZL7iLU8MMf036nfX6n4ByC0tMAxhCd3YEMbx
yxxR0rq74XBP0ji1Uzr65EKmwKWENNLHsrdz5QqxItCzPsvWSc/D+0FMAMD6ZC/V47SUFO+CGBsQ
eFv/hh4b137twQ6CnUfje4/QX8jkdIkks4aJ2qwlldktRiO0EpBeDOeWqsK+S2t8r/87fETomNEe
ldB1OCLCpjjz7Cv6ekuNPrFw3P92X1941cYOh8KiQMy2gGzuC2oIx6GzrSC5wlxTMl0M4X4Rt0hS
Vxs=
=mCC7
-----END PGP SIGNATURE-----

--------------kib98pZnBxR2VOueRxXAADTt--

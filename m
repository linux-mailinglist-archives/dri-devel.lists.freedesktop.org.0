Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEFB6D4AD9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 16:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B42C10E4A7;
	Mon,  3 Apr 2023 14:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0467610E4A7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 14:50:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57A1821BC3;
 Mon,  3 Apr 2023 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680533439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vi8FSkkas3VVtze3kv2KJafq+GEldjkr8rP+gu4hARU=;
 b=OYd6TV7ntW7HKbY7LNZfbRk9k1udrSMcRel+ouvL3xuwCD/YGXfSgadp0eyfdWyctmx5IB
 kAje0QhLISO5683IdAhDAxfH2QdyY8+rI8nDQdzEeOowv3WibebwyMNB6Rxgy+x8dfGZpc
 YOyW9VwGUaHP8WwkbkhA9foarsfpKpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680533439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vi8FSkkas3VVtze3kv2KJafq+GEldjkr8rP+gu4hARU=;
 b=8VKWUYKpKlblepIdYa2tMwO6tAPe3j+UwFCE/IT1eCCnhlEL8kLt19559dlhlETSYxBMvc
 Jq+N/m3pQd/KJWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BAD11331A;
 Mon,  3 Apr 2023 14:50:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wv+nCb/nKmQ0JgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 14:50:39 +0000
Message-ID: <4818e04e-2209-a4fb-7caa-48ed2bcd809d@suse.de>
Date: Mon, 3 Apr 2023 16:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 5/5] drm/omapdrm: Implement fbdev emulation as
 in-kernel client
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230403104035.15288-1-tzimmermann@suse.de>
 <20230403104035.15288-6-tzimmermann@suse.de>
 <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hq8d3DaXgKe8FCbQHP07kYtS"
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
Cc: tomba@kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hq8d3DaXgKe8FCbQHP07kYtS
Content-Type: multipart/mixed; boundary="------------DpLoEBHqS6ZT00tBZxwSAZfs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <4818e04e-2209-a4fb-7caa-48ed2bcd809d@suse.de>
Subject: Re: [PATCH v2 5/5] drm/omapdrm: Implement fbdev emulation as
 in-kernel client
References: <20230403104035.15288-1-tzimmermann@suse.de>
 <20230403104035.15288-6-tzimmermann@suse.de>
 <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>
In-Reply-To: <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>

--------------DpLoEBHqS6ZT00tBZxwSAZfs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDQuMjMgdW0gMTY6Mjcgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9u
IE1vbiwgMyBBcHIgMjAyMyBhdCAxMTo0MSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IE1vdmUgY29kZSBmcm9tIGFkLWhvYyBmYmRl
diBjYWxsYmFja3MgaW50byBEUk0gY2xpZW50IGZ1bmN0aW9ucw0KPj4gYW5kIHJlbW92ZSB0
aGUgb2xkIGNhbGxiYWNrcy4gVGhlIGZ1bmN0aW9ucyBpbnN0cnVjdCB0aGUgY2xpZW50DQo+
PiB0byBwb2xsIGZvciBjaGFuZ2VkIG91dHB1dCBvciByZXN0b3JlIHRoZSBkaXNwbGF5LiBU
aGUgRFJNIGNvcmUNCj4+IGNhbGxzIGJvdGgsIHRoZSBvbGQgY2FsbGJhY2tzIGFuZCB0aGUg
bmV3IGNsaWVudCBoZWxwZXJzLCBmcm9tDQo+PiB0aGUgc2FtZSBwbGFjZXMuIFRoZSBuZXcg
ZnVuY3Rpb25zIHBlcmZvcm0gdGhlIHNhbWUgb3BlcmF0aW9uIGFzDQo+PiBiZWZvcmUsIHNv
IHRoZXJlJ3Mgbm8gY2hhbmdlIGluIGZ1bmN0aW9uYWxpdHkuDQo+Pg0KPj4gUmVwbGFjZSBh
bGwgY29kZSB0aGF0IGluaXRpYWxpemVzIG9yIHJlbGVhc2VzIGZiZGV2IGVtdWxhdGlvbg0K
Pj4gdGhyb3VnaG91dCB0aGUgZHJpdmVyLiBJbnN0ZWFkIGluaXRpYWxpemUgdGhlIGZiZGV2
IGNsaWVudCBieSBhDQo+PiBzaW5nbGUgY2FsbCB0byBvbWFwZHJtX2ZiZGV2X3NldHVwKCkg
YWZ0ZXIgb21hcGRybSBoYXMgcmVnaXN0ZXJlZA0KPj4gaXRzIERSTSBkZXZpY2UuIEFzIGlu
IG1vc3QgZHJpdmVycywgb21hcGRybSdzIGZiZGV2IGVtdWxhdGlvbiBub3cNCj4+IGFjdHMg
bGlrZSBhIHJlZ3VsYXIgRFJNIGNsaWVudC4NCj4+DQo+PiBUaGUgZmJkZXYgY2xpZW50IHNl
dHVwIGNvbnNpc3RzIG9mIHRoZSBpbml0aWFsIHByZXBhcmF0aW9uIGFuZCB0aGUNCj4+IGhv
dC1wbHVnZ2luZyBvZiB0aGUgZGlzcGxheS4gVGhlIGxhdHRlciBjcmVhdGVzIHRoZSBmYmRl
diBkZXZpY2UNCj4+IGFuZCBzZXRzIHVwIHRoZSBmYmRldiBmcmFtZWJ1ZmZlci4gVGhlIHNl
dHVwIHBlcmZvcm1zIGRpc3BsYXkNCj4+IGhvdC1wbHVnZ2luZyBvbmNlLiBJZiBubyBkaXNw
bGF5IGNhbiBiZSBkZXRlY3RlZCwgRFJNIHByb2JlIGhlbHBlcnMNCj4+IHJlLXJ1biB0aGUg
ZGV0ZWN0aW9uIG9uIGVhY2ggaG90cGx1ZyBldmVudC4NCj4+DQo+PiBBIGNhbGwgdG8gZHJt
X2Rldl91bnJlZ2lzdGVyKCkgcmVsZWFzZXMgdGhlIGNsaWVudCBhdXRvbWF0aWNhbGx5Lg0K
Pj4gTm8gZnVydGhlciBhY3Rpb24gaXMgcmVxdWlyZWQgd2l0aGluIG9tYXBkcm0uIElmIHRo
ZSBmYmRldg0KPj4gZnJhbWVidWZmZXIgaGFzIGJlZW4gZnVsbHkgc2V0IHVwLCBzdHJ1Y3Qg
ZmJfb3BzLmZiX2Rlc3Ryb3kNCj4+IGltcGxlbWVudHMgdGhlIHJlbGVhc2UuIEZvciBwYXJ0
aWFsbHkgaW5pdGlhbGl6ZWQgZW11bGF0aW9uLCB0aGUNCj4+IGZiZGV2IGNsaWVudCByZXZl
cnRzIHRoZSBpbml0aWFsIHNldHVwLg0KPj4NCj4+IHYyOg0KPj4gICAgICAgICAgKiBpbml0
IGRybV9jbGllbnQgaW4gdGhpcyBwYXRjaCAoVG9taSkNCj4+ICAgICAgICAgICogZG9uJ3Qg
aGFuZGxlIG5vbi1hdG9taWMgbW9kZXNldHRpbmcgKFRvbWkpDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZp
ZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5j
b20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyAg
IHwgIDExICstLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2LmMg
fCAxMzIgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZmJkZXYuaCB8ICAgOSArLQ0KPj4gICAzIGZpbGVzIGNoYW5nZWQs
IDkwIGluc2VydGlvbnMoKyksIDYyIGRlbGV0aW9ucygtKQ0KPj4NCj4gDQo+PiArc3RhdGlj
IHZvaWQgb21hcF9mYmRldl9mYl9kZXN0cm95KHN0cnVjdCBmYl9pbmZvICppbmZvKQ0KPj4g
K3sNCj4+ICsgICAgICAgc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciA9IGluZm8tPnBh
cjsNCj4+ICsgICAgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBoZWxwZXItPmZi
Ow0KPj4gKyAgICAgICBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmJvID0gZHJtX2dlbV9mYl9n
ZXRfb2JqKGZiLCAwKTsNCj4+ICsgICAgICAgc3RydWN0IG9tYXBfZmJkZXYgKmZiZGV2ID0g
dG9fb21hcF9mYmRldihoZWxwZXIpOw0KPj4gKw0KPj4gKyAgICAgICBEQkcoKTsNCj4+ICsN
Cj4gDQo+IFdoYXQgYSBsb3ZlbHkgbGl0dGxlIHN1cnByaXNlLiBJdCdzIGEgcHJlLWV4aXN0
aW5nICJmZWF0dXJlIiwgc28gbGV0J3MNCj4gaWdub3JlIHRoYXQgZm9yIG5vdyA7LSkNCg0K
SSBoYXZlIG5vIGlkZWEgd2hhdCB5b3UncmUgdGFsa2luZyBhYm91dC4gVGhpcyBjb2RlIHdh
cyBpbiB0aGUgb3JpZ2luYWwgDQpjbGVhbi11cCBmdW5jdGlvbi4gSWYgaXQgaXMgbm90IHN1
cHBvc2VkIHRvIGJlIGhlcmUsIEkgY2FuIHJlbW92ZSBpdC4NCg0KPiANCj4+ICsgICAgICAg
ZHJtX2ZiX2hlbHBlcl9maW5pKGhlbHBlcik7DQo+PiArDQo+PiArICAgICAgIG9tYXBfZ2Vt
X3VucGluKGJvKTsNCj4+ICsgICAgICAgZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZShmYik7DQo+
PiArDQo+PiArICAgICAgIGRybV9jbGllbnRfcmVsZWFzZSgmaGVscGVyLT5jbGllbnQpOw0K
Pj4gKyAgICAgICBkcm1fZmJfaGVscGVyX3VucHJlcGFyZShoZWxwZXIpOw0KPj4gKyAgICAg
ICBrZnJlZShmYmRldik7DQo+PiArfQ0KPiANCj4gDQo+PiAtdm9pZCBvbWFwX2ZiZGV2X2Zp
bmkoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9jbGllbnRfZnVuY3Mgb21hcF9mYmRldl9jbGllbnRfZnVuY3MgPSB7DQo+PiArICAgICAg
IC5vd25lciAgICAgICAgICA9IFRISVNfTU9EVUxFLA0KPj4gKyAgICAgICAudW5yZWdpc3Rl
ciAgICAgPSBvbWFwX2ZiZGV2X2NsaWVudF91bnJlZ2lzdGVyLA0KPj4gKyAgICAgICAucmVz
dG9yZSAgICAgICAgPSBvbWFwX2ZiZGV2X2NsaWVudF9yZXN0b3JlLA0KPj4gKyAgICAgICAu
aG90cGx1ZyAgICAgICAgPSBvbWFwX2ZiZGV2X2NsaWVudF9ob3RwbHVnLA0KPiANCj4gQUZB
SUNUIHRoZSBmYmRldiBjbGllbnQgaGVscGVycyBhYm92ZSBhcmUgaWRlbnRpY2FsIHRvIHRo
ZSBnZW5lcmljDQo+IG9uZXMgaW4gZHJtX2ZiZGV2X2dlbmVyaWMuYy4gV2h5IGFyZW4ndCB3
ZSByZXVzaW5nIHRob3NlIGJ1dA0KPiBjb3B5L3Bhc3RpbmcgdGhlbSBpbiB0aGUgZHJpdmVy
Pw0KDQpUaGUgY29kZSBpbiBkcm1fZmJkZXZfZ2VuZXJpYy5jIChhbmQgb3RoZXIgZmJkZXYg
ZmlsZXMpIG1pZ2h0IGJlIA0Kc2hhcmVhYmxlIGF0IHNvbWUgcG9pbnQgd2hlbiBJIGtub3cg
d2hhdCBleGFjdGx5IEkgbmVlZC4gIEkgYWxyZWFkeSBwbGFuIA0KdG8gbW92ZSBzb21lIG9m
IHRoZSBkYW1hZ2UgaGFuZGxpbmcgZnJvbSBkcm1fZmJfaGVscGVyLmMgdG8gDQpkcm1fZmJk
ZXZfZ2VuZXJpYy5jIGFuZCB0aGF0IHdpbGwgYWZmZWN0IHRoZSBoZWxwZXJzIHRoYXQgYXJl
IGN1cnJlbnRseSANCmlkZW50aWNhbC4gVGhlcmUncyBsaXR0bGUgcG9pbnQgaW4gY29kZSBz
aGFyaW5nIHJpZ2h0IG5vdy4NCg0KSSBrbm93IHRoYXQgdGhlIGZiZGV2IGVtdWxhdGlvbiBp
cyBjb252b2x1dGVkIGFuZCBjb25mdXNpbmcgYXQgdGltZXMuIA0KSXQncyB0aGUgcmVzdWx0
IG9mIHZhcmlvdXMgcmVkZXNpZ25zIGFuZCBmYWxzZSBzdGFydHMuIFRoaW5ncyBhcmUgDQpn
ZXR0aW5nIGJldHRlciwgdGhvdWdoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBUaGFua3MNCj4gRW1pbA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------DpLoEBHqS6ZT00tBZxwSAZfs--

--------------hq8d3DaXgKe8FCbQHP07kYtS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQq574FAwAAAAAACgkQlh/E3EQov+AA
zhAAwqjMxU1hsOKGPkWujylzEEKKsl/1FW0c1knKF7ECUu32HSizidW6nAJRDmYoSWwGykkXCBJe
B3rwuJPgmlCzCDLxtA8L6uuy2PuDczm3X6Bs76F+II8yUINwjYZjFBE44jVHP+BRSl9SZiq6B3VQ
GmF/LXftls/5+eJdyV+XERC+SPFPkVgcy558y6gzB1+bQuVJehAMmlXbXXqG3FR9e7m3ipMmrn73
xG8QVJZZbsJaRy2mwiGOCP4q9SnkcLPZ/FhsnMiWRrmLKUYpeCoaMoX2lUGpVrhIApOBWP/M3MiE
P1PaVvQ6XJn3KsfIaKaSa2BpW037vDpSdJgFXBiFhnREcVtt9K3KQfFHIadeWj1TdK7cDJpHgUj5
RL5nPJOQi7c9uTWhi1DLowEdSxPXDOdMIBN7DLiG3W7DgxHCwq0AiQ30EpDdXwTRakIorw3hzIRv
5kt6b5+7SsS0+lcpyHpHtDFKv2dDNsJR2IvXrcSEKPzunCX9rcV7TSMED1yAcGyCKIgIPf/rUBiI
r68sCk+ev/W0xb9KP+RgZ6RHSOQTGAphQbnXvOcFIMELNAEtEf9bC3t0vPjSpb89sY1hmFQ5MqJX
Z5ynX50tUpzFHhVGQIcCh1jwGQHblCG7KtOu1bZIpyjorbo3vmnmv8CpGIU47NjNFOpzbfiPq1ed
Ltg=
=SEvt
-----END PGP SIGNATURE-----

--------------hq8d3DaXgKe8FCbQHP07kYtS--

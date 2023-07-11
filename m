Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C574EFE2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FD410E050;
	Tue, 11 Jul 2023 13:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5410E050;
 Tue, 11 Jul 2023 13:09:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48587222B7;
 Tue, 11 Jul 2023 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689080956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0llbndeHku9cb519jiMirphXWcK5jHEIZA/iZ71Lhk=;
 b=sfFg5wOmwofyNx9AJTQ0S/QkYO2UjgvauKkglyuDoem7ST8NOW3jQ5tQe9OzXKn3Wvdhc7
 QKzR4ue8VCoH6Ja3ivYulNJUQc4tkNXr0NwCMcu0R6FB5TKv/f7gvqg/gSqwPMHA3aOhEr
 Jopv8Na7X2E3jPt9HTjyrBsqtykP0l8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689080956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0llbndeHku9cb519jiMirphXWcK5jHEIZA/iZ71Lhk=;
 b=29xN6I/wif3z4wYnEL8AWoZlIlv5h+dwERx1NvBGPRD8xAT42dLwfMhzkwEuYiPB/8OnUb
 5BI0yDW/fg7vZpDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 056BC1390F;
 Tue, 11 Jul 2023 13:09:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gmliAHxUrWSdTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jul 2023 13:09:16 +0000
Message-ID: <6691237c-fbb1-0643-fed7-969e83d953fb@suse.de>
Date: Tue, 11 Jul 2023 15:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/4] drm/i915: Implement fbdev emulation as in-kernel
 client
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
References: <20230328111422.23986-1-tzimmermann@suse.de>
 <20230328111422.23986-5-tzimmermann@suse.de> <87355o6gf0.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87355o6gf0.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------70uHHZsBuyHAW9Fmn9r7SB7I"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------70uHHZsBuyHAW9Fmn9r7SB7I
Content-Type: multipart/mixed; boundary="------------cGUT5OgyaCJw2PJuHXl25Moa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <6691237c-fbb1-0643-fed7-969e83d953fb@suse.de>
Subject: Re: [PATCH 4/4] drm/i915: Implement fbdev emulation as in-kernel
 client
References: <20230328111422.23986-1-tzimmermann@suse.de>
 <20230328111422.23986-5-tzimmermann@suse.de> <87355o6gf0.fsf@intel.com>
In-Reply-To: <87355o6gf0.fsf@intel.com>

--------------cGUT5OgyaCJw2PJuHXl25Moa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDMuMjMgdW0gMTc6MzEgc2NocmllYiBKYW5pIE5pa3VsYToNClsuLi5d
DQo+PiArDQo+PiArZXJyX2RybV9mYl9oZWxwZXJfZmluaToNCj4+ICsJZHJtX2ZiX2hlbHBl
cl9maW5pKGZiX2hlbHBlcik7DQo+PiArZXJyX2RybV9lcnI6DQo+PiArCWRybV9lcnIoZGV2
LCAiRmFpbGVkIHRvIHNldHVwIHJhZGVvbiBmYmRldiBlbXVsYXRpb24gKHJldD0lZClcbiIs
IHJldCk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5e
Xg0KPiANCj4gSHJybW1oLiA7KQ0KDQpPOikNCg0KPiANCj4+ICsJcmV0dXJuIHJldDsNCj4+
ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY2xpZW50X2Z1bmNz
IGludGVsX2ZiZGV2X2NsaWVudF9mdW5jcyA9IHsNCj4+IEBAIC02ODgsMjIgKzcxNCwyMyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jbGllbnRfZnVuY3MgaW50ZWxfZmJkZXZfY2xp
ZW50X2Z1bmNzID0gew0KPj4gICAJLmhvdHBsdWcJPSBpbnRlbF9mYmRldl9jbGllbnRfaG90
cGx1ZywNCj4+ICAgfTsNCj4+ICAgDQoNClsuLi5dDQoNCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9kcml2ZXIuYw0KPj4gaW5kZXggYmU4MDRmZDRmNzlmLi4wYjY3MjJiY2ZiYjIgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jDQo+PiBAQCAtODIwLDYg
KzgyMCw4IEBAIGludCBpOTE1X2RyaXZlcl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
Y29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkNCj4+ICAgDQo+PiAgIAlpOTE1LT5k
b19yZWxlYXNlID0gdHJ1ZTsNCj4+ICAgDQo+PiArCWludGVsX2ZiZGV2X3NldHVwKGk5MTUp
Ow0KPj4gKw0KPiANCj4gTWF5YmUgd2UgY291bGQgY2FsbCB0aGlzIGZyb20gaW50ZWxfZGlz
cGxheV9kcml2ZXJfcmVnaXN0ZXIoKT8NCg0KRmJkZXYgaW50ZXJhY3Qgd2l0aCB2Z2Etc3dp
dGNoZXJvby4gSSdkIGFzc3VtZSB0aGF0IHRoZSBmYmRldiBjbGllbnQgDQpzZXR1cCBuZWVk
cyB0byBydW4gYWZ0ZXIgaTkxNV9zd2l0Y2hlcm9vX3JlZ2lzdGVyKCkuIElmIA0KaW50ZWxf
ZmJkZXZfc2V0dXAoKSBjYW5ub3QgZ28gaW50byB0aGUgcHJvYmUgY2FsbGJhY2ssIGl0IGNv
dWxkIGJlIA0KbG9jYXRlZCBhdCB0aGUgZW5kIG9mIGk5MTVfZHJpdmVyX3JlZ2lzdGVyKCku
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFdlJ3JlIHRyeWluZyB0byBzZXBh
cmF0ZSBkaXNwbGF5IHJlbGF0ZWQgc3R1ZmYgZnJvbSB0aGUgcmVzdCwgYW5kIGNhbGwNCj4g
YXMgZmV3IGRpc3BsYXkgZnVuY3Rpb25zIGZyb20gdG9wIGxldmVsIGRyaXZlciBjb2RlIGFz
DQo+IHBvc3NpYmxlLiAoQ2xlYXJseSwgd2UncmUgbm93aGVyZSBuZWFyIHRoaXMgZ29hbCB5
ZXQuKQ0KPiANCj4gDQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgDQo+PiAgIG91dF9jbGVhbnVw
X2dlbToNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------cGUT5OgyaCJw2PJuHXl25Moa--

--------------70uHHZsBuyHAW9Fmn9r7SB7I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmStVHsFAwAAAAAACgkQlh/E3EQov+Co
LA/+KPkyvN3Hl5Po6mq0DdSFRyVEOdsrRWAddcgiNlnrE1Xj6n7cHT7QPwkKZcOmU2KgSoS046Hm
z5WauXgh4R0RLK9hjOpKPokCkmCuxVGFFcOzCVB8b0RgWn6wt8ARo7ba8YotwX9tuLtCd2Xq+s7/
P8kEbLVdbeA4mud7QpxD2n7U4ljtxet8H3e+h8ZM9KPBt9Dc2a594VXZZxewevt35GVy+VCfrPPL
+vuLsXeqGXuzL8qs7Lyer/BA/1S4L7Kk/pcbUTV0DDeOxv139CbGbtjOG4rAxIkhBqrIenEsUyc2
eodxDOGqVlJSP+ycXqk3gtdmKmyuGAUhL9r2wRqlYQQR5UXey39XRpoBZNM5tGMUPleNKBArA1xf
ub2eeNd6Hda1je/+wC04QOo12TNevtKj5BPlz9nDORiIpx54bDjYvgFQ4/FLeIZyl8v0L+cC/E7F
urb/tY8STMgQAASpNWVxrsZuW4YOlaehWed5JP0gNZ2fp117Ru6i1RtxSQTtZKfT6fVSu5z9slFG
P9tDRbXA71rv/KjTfbZksl5XaK5k/6SCy/ggvtOfyVMIWqAJHDlZQZ1BRsr3lr14LUxr3qllecZd
XCVodgd15EbH6/nojrNeJCNGfOryDmjjbTHROrKQRrH/RXeo8ZO2phpztV8jeS4ARSe7q9GkooWb
g/M=
=9ysK
-----END PGP SIGNATURE-----

--------------70uHHZsBuyHAW9Fmn9r7SB7I--

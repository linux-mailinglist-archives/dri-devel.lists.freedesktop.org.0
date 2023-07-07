Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18E874AC1B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8424E10E520;
	Fri,  7 Jul 2023 07:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FC010E520
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:44:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92F951FDC8;
 Fri,  7 Jul 2023 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688715865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WUox90kNbHGDz0cSQfHjWRs53Yp892D2brDRNpzZUVg=;
 b=osr2LlfxpS1y5w1uTxpMZExb/1Mo/XHJjybtkXJatTNRQS7NUEdxkgJlkzC6auvrsxLBWq
 1SiE6Zx4KM7/JTS++DIiPZyU6tpltf0vHpX9vwu8Tea0chFq12PkaaTc4uOXIaFgRRd5YW
 jev7Kv+ip0IuoUBSS5NJCOUHsYnZ4Ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688715865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WUox90kNbHGDz0cSQfHjWRs53Yp892D2brDRNpzZUVg=;
 b=DE4EZSmQzAXIOO1Tyvpno7Vp59tlJ8+D6vqWmCGYp4A0NHseRqjvHpXYdMeYC7NS/993QL
 AH/zmQGQ24WyOYBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6660A139E0;
 Fri,  7 Jul 2023 07:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IWX/F1nCp2QZJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 07:44:25 +0000
Message-ID: <15b9cfd1-c0ae-3fcf-0108-0f617505903c@suse.de>
Date: Fri, 7 Jul 2023 09:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/fbdev-dma: Fix documented default preferred_bpp value
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <91f093ffe436a9f94d58fb2bfbc1407f1ebe8bb0.1688656591.git.geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <91f093ffe436a9f94d58fb2bfbc1407f1ebe8bb0.1688656591.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3wgPayiDQJR3n92656d8p0uL"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3wgPayiDQJR3n92656d8p0uL
Content-Type: multipart/mixed; boundary="------------YLMrCrwKsYbM2J6JK3E5O45r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <15b9cfd1-c0ae-3fcf-0108-0f617505903c@suse.de>
Subject: Re: [PATCH] drm/fbdev-dma: Fix documented default preferred_bpp value
References: <91f093ffe436a9f94d58fb2bfbc1407f1ebe8bb0.1688656591.git.geert+renesas@glider.be>
In-Reply-To: <91f093ffe436a9f94d58fb2bfbc1407f1ebe8bb0.1688656591.git.geert+renesas@glider.be>

--------------YLMrCrwKsYbM2J6JK3E5O45r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDcuMjMgdW0gMTc6MzAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEFzIG9mIGNvbW1pdCA2YzgwYTkzYmU2MmQzOThlICgiZHJtL2ZiLWhlbHBlcjogSW5p
dGlhbGl6ZSBmYi1oZWxwZXIncw0KPiBwcmVmZXJyZWQgQlBQIGluIHByZXBhcmUgZnVuY3Rp
b24iKSwgdGhlIHByZWZlcnJlZF9icHAgcGFyYW1ldGVyIG9mDQo+IGRybV9mYl9oZWxwZXJf
cHJlcGFyZSgpIGRlZmF1bHRzIHRvIDMyIGluc3RlYWQgb2YNCj4gZHJtX21vZGVfY29uZmln
LnByZWZlcnJlZF9kZXB0aC4gIEhlbmNlIHRoaXMgYWxzbyBhcHBsaWVzIHRvDQo+IGRybV9m
YmRldl9kbWFfc2V0dXAoKSwgd2hpY2gganVzdCBwYXNzZXMgaXRzIG93biBwcmVmZXJyZWRf
YnBwDQo+IHBhcmFtZXRlci4NCj4gDQo+IEZpeGVzOiBiNzlmZTlhYmQ1OGJhYjczICgiZHJt
L2ZiZGV2LWRtYTogSW1wbGVtZW50IGZiZGV2IGVtdWxhdGlvbiBmb3IgR0VNIERNQSBoZWxw
ZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KDQpUaGFua3MgYSBsb3QuIEknbGwgYWRkIGl0IHRvIC1taXNj
LW5leHQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV9mYmRldl9kbWEuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiZGV2X2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9k
bWEuYw0KPiBpbmRleCBkODY3NzNmYThhYjAwZjQ5Li43NmFhNTJiMzhhMTNlZDYzIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2RtYS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZG1hLmMNCj4gQEAgLTIxNyw3ICsyMTcsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9jbGllbnRfZnVuY3MgZHJtX2ZiZGV2X2RtYV9jbGll
bnRfZnVuY3MgPSB7DQo+ICAgICogZHJtX2ZiZGV2X2RtYV9zZXR1cCgpIC0gU2V0dXAgZmJk
ZXYgZW11bGF0aW9uIGZvciBHRU0gRE1BIGhlbHBlcnMNCj4gICAgKiBAZGV2OiBEUk0gZGV2
aWNlDQo+ICAgICogQHByZWZlcnJlZF9icHA6IFByZWZlcnJlZCBiaXRzIHBlciBwaXhlbCBm
b3IgdGhlIGRldmljZS4NCj4gLSAqICAgICAgICAgICAgICAgICBAZGV2LT5tb2RlX2NvbmZp
Zy5wcmVmZXJyZWRfZGVwdGggaXMgdXNlZCBpZiB0aGlzIGlzIHplcm8uDQo+ICsgKiAgICAg
ICAgICAgICAgICAgMzIgaXMgdXNlZCBpZiB0aGlzIGlzIHplcm8uDQo+ICAgICoNCj4gICAg
KiBUaGlzIGZ1bmN0aW9uIHNldHMgdXAgZmJkZXYgZW11bGF0aW9uIGZvciBHRU0gRE1BIGRy
aXZlcnMgdGhhdCBzdXBwb3J0DQo+ICAgICogZHVtYiBidWZmZXJzIHdpdGggYSB2aXJ0dWFs
IGFkZHJlc3MgYW5kIHRoYXQgY2FuIGJlIG1tYXAnZWQuDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcs
IEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxk
LCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------YLMrCrwKsYbM2J6JK3E5O45r--

--------------3wgPayiDQJR3n92656d8p0uL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSnwlgFAwAAAAAACgkQlh/E3EQov+DT
xA/7Blngxp2foeiqsys5x8PdAHlvIlNUlVJZ56WP6B9wSxjLa7NU1XFTDDqQd5BMML9/Hylp1vtC
FykcLSuXnpuxYkMPYEMY7aQ3HItIj+BPcg9r6YpZ7/TLX7toKIh/fCCs30bCJE5OEwvTMI6sBteJ
xrVHJgWTLl3tFy8Ec2kgNrJicmvfKo6mRkl2TzG5W5fT+2AUGsjS33Rc3GBwMUZKqGH3tuMHLkUi
HpK+JrrrM8G4U0Hkiw7vYA74xEvDCj29952cT/bLFXN+sZhJFreT2CNhbUQrpql8dFfWPvzQ4KQz
zo0wUXdhb/dCVoaATDVyIwcRBDroIIL7HrlH06UA+V2SMZOmXI+oX5itOE1Pa53Ydq8PwqtoyYae
grWRGnOPX3C6rqytF2Ya2xoP0IVqYZ8oqOUD/Mj03F4gU2bR87tX3MYdsxpqqU5x62ORaC31nBSe
qK6CCrgdXfC5eOIyVXksBQAMh6HN0AY9VYO6zVrhqsiLBchF1m8PQHfPE81Jc66+VkZs8XXahUTn
BO0c7mtTN3v3Ho6IcKq8RS1AUz6ODgQ+nzRAAqTHBxTflCLmyAc2cvbBGQ2tcGGGI/htQo73QGLK
G8N0W2CLJV9WIlciC4ZT/vDdQ+svrEyO3VeE/Tq+X7/exgfvjAIIWELiIs8UWKJ1KnmyOZmO1iR6
R40=
=eu8E
-----END PGP SIGNATURE-----

--------------3wgPayiDQJR3n92656d8p0uL--

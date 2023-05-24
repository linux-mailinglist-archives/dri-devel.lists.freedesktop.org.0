Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6F70F57F
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 13:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55C189083;
	Wed, 24 May 2023 11:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10DA89083
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 11:41:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 67AF51FDFA;
 Wed, 24 May 2023 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684928491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lOytZH2Unt5hMzd8MASLgQWge2G6ZUykEA3LZlvUS+E=;
 b=O/VIMkq3XE3u/MF7j3xq+kJkiM0GxirN2w3WmOT20Zv7X2+F34RgtgfTJ9X1c+JpZfA2m8
 yaLrFLWRfYQ+gS8P4I5S7JY7S5GME3g07oLmxeYQFj1LES/90gwnHnm/KWzivvY+laOY+S
 MTnkL+pshFT3FVQG+wAhuROP8vySH00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684928491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lOytZH2Unt5hMzd8MASLgQWge2G6ZUykEA3LZlvUS+E=;
 b=S7BrHgkopsLsGfTLNKMvKIE3OBTahefNbpjOMewt9x+wrhLnPwGSAqAwGikTR/XpPFM7vM
 x4euleZyZgDQRqCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2101C13425;
 Wed, 24 May 2023 11:41:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zRFSBuv3bWSKTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 11:41:31 +0000
Message-ID: <89584a0a-55ec-952e-372a-694b450b0c13@suse.de>
Date: Wed, 24 May 2023 13:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/fb-helper: Fix height, width, and accel_flags in
 fb_var
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <57e6b334dae8148b1b8ae6ef308ce9a83810a850.1684854344.git.geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <57e6b334dae8148b1b8ae6ef308ce9a83810a850.1684854344.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PEwPdIYHurLfL9z1rCG0mPst"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PEwPdIYHurLfL9z1rCG0mPst
Content-Type: multipart/mixed; boundary="------------D0dOy3UFBiT1cIwTyPYm2FxF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>
Message-ID: <89584a0a-55ec-952e-372a-694b450b0c13@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: Fix height, width, and accel_flags in
 fb_var
References: <57e6b334dae8148b1b8ae6ef308ce9a83810a850.1684854344.git.geert+renesas@glider.be>
In-Reply-To: <57e6b334dae8148b1b8ae6ef308ce9a83810a850.1684854344.git.geert+renesas@glider.be>

--------------D0dOy3UFBiT1cIwTyPYm2FxF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhhbmtzIGEgbG90LiBQdXNoZWQgdG8gZHJtLW1pc2MtZml4ZXMuDQoNCkFtIDIzLjA1LjIz
IHVtIDE3OjA2IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0KPiBGYnRlc3QgY29udGFp
bnMgc29tZSB2ZXJ5IHNpbXBsZSB2YWxpZGF0aW9uIG9mIHRoZSBmYmRldiB1c2Vyc3BhY2Ug
QVBJDQo+IGNvbnRyYWN0LiAgV2hlbiB1c2VkIHdpdGggc2htb2ItZHJtLCBpdCByZXBvcnRz
IHRoZSBmb2xsb3dpbmcgd2FybmluZ3MNCj4gYW5kIGVycm9yczoNCj4gDQo+ICAgICAgaGVp
Z2h0IGNoYW5nZWQgZnJvbSA2OCB0byAwDQo+ICAgICAgaGVpZ2h0IHdhcyByb3VuZGVkIGRv
d24NCj4gICAgICB3aWR0aCBjaGFuZ2VkIGZyb20gMTExIHRvIDANCj4gICAgICB3aWR0aCB3
YXMgcm91bmRlZCBkb3duDQo+ICAgICAgYWNjZWxfZmxhZ3MgY2hhbmdlZCBmcm9tIDAgdG8g
MQ0KPiANCj4gVGhlIGZpcnN0IHBhcnQgaGFwcGVucyBiZWNhdXNlIF9fZmlsbF92YXIoKSBy
ZXNldHMgdGhlIHBoeXNpY2FsDQo+IGRpbWVuc2lvbnMgb2YgdGhlIGZpcnN0IGNvbm5lY3Rv
ciwgYXMgZmlsbGVkIGluIGJ5IGRybV9zZXR1cF9jcnRjc19mYigpLg0KPiBGaXggdGhpcyBi
eSByZXRhaW5pbmcgdGhlIG9yaWdpbmFsIHZhbHVlcy4NCj4gDQo+IFRoZSBsYXN0IHBhcnQg
aGFwcGVucyBiZWNhdXNlIF9fZmlsbF92YXIoKSBmb3JjZXMgdGhlIEZCX0FDQ0VMRl9URVhU
DQo+IGZsYWcgb24sIHdoaWxlIGZidGVzdCBkaXNhYmxlcyBhbGwgYWNjZWxlcmF0aW9uIG9u
IHB1cnBvc2UsIHNvIGl0IGNhbg0KPiBkcmF3IHNhZmVseSB0byB0aGUgZnJhbWUgYnVmZmVy
LiAgRml4IHRoaXMgYnkgc2V0dGluZyBhY2NlbF9mbGFncyB0bw0KPiB6ZXJvLCBhcyBEUk0g
ZG9lcyBub3QgaW1wbGVtZW50IGFueSB0ZXh0IGNvbnNvbGUgYWNjZWxlcmF0aW9uLg0KPiBO
b3RlIHRoYXQgdGhpcyBpc3N1ZSBjYW4gYWxzbyBiZSBzZWVuIGluIHRoZSBvdXRwdXQgb2Yg
ZmJzZXQsIHdoaWNoDQo+IHJlcG9ydHMgImFjY2VsIHRydWUiLg0KPiANCj4gRml4ZXM6IGVl
NGNjZTBhOGYwM2EzMzMgKCJkcm0vZmItaGVscGVyOiBmaXggaW5wdXQgdmFsaWRhdGlvbiBn
YXBzIGluIGNoZWNrX3ZhciIpDQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBUZXN0ZWQtYnk6IFN1aSBKaW5nZmVu
ZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiB2MjoNCj4gICAgLSBBZGQg
UmV2aWV3ZWQtYnksIFRlc3RlZC1ieS4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYyB8IDEyICsrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMNCj4gaW5kZXggZjBlOTU0OWI2YmQ3NTFkZS4uOGRjMzc2Yjc3MWQyY2YyMiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IEBAIC0xMzc5LDE3ICsxMzc5
LDE5IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZmlsbF9waXhlbF9mbXQoc3RydWN0
IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXIsDQo+ICAgCX0NCj4gICB9DQo+ICAgDQo+IC1zdGF0
aWMgdm9pZCBfX2ZpbGxfdmFyKHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLA0KPiAr
c3RhdGljIHZvaWQgX19maWxsX3ZhcihzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwg
c3RydWN0IGZiX2luZm8gKmluZm8sDQo+ICAgCQkgICAgICAgc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIpDQo+ICAgew0KPiAgIAlpbnQgaTsNCj4gICANCj4gICAJdmFyLT54cmVzX3Zp
cnR1YWwgPSBmYi0+d2lkdGg7DQo+ICAgCXZhci0+eXJlc192aXJ0dWFsID0gZmItPmhlaWdo
dDsNCj4gLQl2YXItPmFjY2VsX2ZsYWdzID0gRkJfQUNDRUxGX1RFWFQ7DQo+ICsJdmFyLT5h
Y2NlbF9mbGFncyA9IDA7DQo+ICAgCXZhci0+Yml0c19wZXJfcGl4ZWwgPSBkcm1fZm9ybWF0
X2luZm9fYnBwKGZiLT5mb3JtYXQsIDApOw0KPiAgIA0KPiAtCXZhci0+aGVpZ2h0ID0gdmFy
LT53aWR0aCA9IDA7DQo+ICsJdmFyLT5oZWlnaHQgPSBpbmZvLT52YXIuaGVpZ2h0Ow0KPiAr
CXZhci0+d2lkdGggPSBpbmZvLT52YXIud2lkdGg7DQo+ICsNCj4gICAJdmFyLT5sZWZ0X21h
cmdpbiA9IHZhci0+cmlnaHRfbWFyZ2luID0gMDsNCj4gICAJdmFyLT51cHBlcl9tYXJnaW4g
PSB2YXItPmxvd2VyX21hcmdpbiA9IDA7DQo+ICAgCXZhci0+aHN5bmNfbGVuID0gdmFyLT52
c3luY19sZW4gPSAwOw0KPiBAQCAtMTQ1Miw3ICsxNDU0LDcgQEAgaW50IGRybV9mYl9oZWxw
ZXJfY2hlY2tfdmFyKHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLA0KPiAgIAkJcmV0
dXJuIC1FSU5WQUw7DQo+ICAgCX0NCj4gICANCj4gLQlfX2ZpbGxfdmFyKHZhciwgZmIpOw0K
PiArCV9fZmlsbF92YXIodmFyLCBpbmZvLCBmYik7DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAq
IGZiX3Bhbl9kaXNwbGF5KCkgdmFsaWRhdGVzIHRoaXMsIGJ1dCBmYl9zZXRfcGFyKCkgZG9l
c24ndCBhbmQganVzdA0KPiBAQCAtMTkwOCw3ICsxOTEwLDcgQEAgc3RhdGljIHZvaWQgZHJt
X2ZiX2hlbHBlcl9maWxsX3ZhcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbywNCj4gICAJaW5mby0+
cHNldWRvX3BhbGV0dGUgPSBmYl9oZWxwZXItPnBzZXVkb19wYWxldHRlOw0KPiAgIAlpbmZv
LT52YXIueG9mZnNldCA9IDA7DQo+ICAgCWluZm8tPnZhci55b2Zmc2V0ID0gMDsNCj4gLQlf
X2ZpbGxfdmFyKCZpbmZvLT52YXIsIGZiKTsNCj4gKwlfX2ZpbGxfdmFyKCZpbmZvLT52YXIs
IGluZm8sIGZiKTsNCj4gICAJaW5mby0+dmFyLmFjdGl2YXRlID0gRkJfQUNUSVZBVEVfTk9X
Ow0KPiAgIA0KPiAgIAlkcm1fZmJfaGVscGVyX2ZpbGxfcGl4ZWxfZm10KCZpbmZvLT52YXIs
IGZvcm1hdCk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------D0dOy3UFBiT1cIwTyPYm2FxF--

--------------PEwPdIYHurLfL9z1rCG0mPst
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRt9+oFAwAAAAAACgkQlh/E3EQov+Bj
hhAAswOUyLNlNoPlGI2g3UgLCrVk1fKblXAkIUHgtYNcazlofskhGCraFukAMYJi4b4zHZaDRB+3
cBtcfcfQICs6cdn5A2xcl/MSHWcaxVJw5jfhaeFMs7qv6/Z8ejod1y7LVnJdlSQo1P/0auboLRfi
eAcLQ39JmhsmZY8lwkBubVTpoGh+zwo/URySRO73M6/3JubEq8Dovyz7qBTeAkqN/WIZJEre7BLE
TBimgUmhGeWiCxaDe8y3BQaDXpJcCwurKpbUbNAyr8bVhSGsVl8PXeikBDVtmDl8anVayQqIltu+
Sj+DiLK64Xem+s6gwbGA5axhcjBKRimUuFvYXUnSFxFBkg09ylg3oFyOqFlbmcdUKlDQgP2RnR8J
hZtmV9MVzG0/0r+VLTt0p/syyw8xjF3XVQ4eiHSwINZ2o5vQegmYf8RM/Pi7zAdF6ijLS/twM3MD
REHkMMZ1TrEU+NECkVCOIrbvCH/AcTrRCNnNYjBDuCALgb+7/bQNaFZYJGS0nmfx40xVZLJEwKnz
lXoyfe6lPq6Synoio9QPkl1XVGbYOPeLA3amgsLQngOWX333uXk1lm+zJEoYlEmc1ZNFIgsS/5sm
bxFkD0p4DmxcqxccU99VFg0RoPPHJDJdSLcc7eW64cCzY4XneJxXp6BybqF6+lhUJIit0SoJnW5P
ij8=
=415t
-----END PGP SIGNATURE-----

--------------PEwPdIYHurLfL9z1rCG0mPst--

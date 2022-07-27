Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2B582282
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 10:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BDCC31E9;
	Wed, 27 Jul 2022 08:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965EFC31E0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 08:53:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 132AA346A1;
 Wed, 27 Jul 2022 08:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658912034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pkj+iaXBDWhYhZMsOQ9o7A4F4tBbVxNJBggSYy8xuiM=;
 b=HergpkkThJ1UDT5GgsB44Oxzj5TV6yZQKgwzCCijhvfHf09DN8yA+KXynEbtYqPSok6K12
 EMezf38fs0gYWfJnyd9h6Evzi/JLN50+Xy9AG2h9tY8RxwoTM+UAJRTW0HGN0ZhE7pfHuA
 RT+crnP16QIdweVQfoaX/BpwOW67rp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658912034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pkj+iaXBDWhYhZMsOQ9o7A4F4tBbVxNJBggSYy8xuiM=;
 b=wTLzidTzYeBgRn12Zh+rw6DLqm23KFOLO6pHDR4s3+/CSvTUbiwjGLxH8n210ZQjryIXtG
 B6FYR7jVRogke/Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB14413A8E;
 Wed, 27 Jul 2022 08:53:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3MGaMCH94GIAOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 08:53:53 +0000
Message-ID: <393c2298-4a84-09c3-4fb0-cb4f0d4ee7bf@suse.de>
Date: Wed, 27 Jul 2022 10:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fbdev: Make registered_fb[] private to fbmem.c
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220725075400.68478-1-javierm@redhat.com>
 <4b3e4d1b-e219-1ecc-5dd3-d693c69f6124@gmx.de>
 <99055c9c-82bc-8d65-f2c4-33530298db0f@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <99055c9c-82bc-8d65-f2c4-33530298db0f@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2qq97eEz5F4B6Y1LNzi01B70"
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2qq97eEz5F4B6Y1LNzi01B70
Content-Type: multipart/mixed; boundary="------------yopy0awbeO5TYQLqy8sdUIzR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-staging@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org
Message-ID: <393c2298-4a84-09c3-4fb0-cb4f0d4ee7bf@suse.de>
Subject: Re: [PATCH] fbdev: Make registered_fb[] private to fbmem.c
References: <20220725075400.68478-1-javierm@redhat.com>
 <4b3e4d1b-e219-1ecc-5dd3-d693c69f6124@gmx.de>
 <99055c9c-82bc-8d65-f2c4-33530298db0f@gmx.de>
In-Reply-To: <99055c9c-82bc-8d65-f2c4-33530298db0f@gmx.de>

--------------yopy0awbeO5TYQLqy8sdUIzR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDcuMjIgdW0gMDY6MDggc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDcvMjYvMjIgMDk6MjIsIEhlbGdlIERlbGxlciB3cm90ZToNCj4+IE9uIDcvMjUvMjIgMDk6
NTQsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+PiBGcm9tOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPj4+DQo+Pj4gTm8gZHJpdmVyIGFj
Y2VzcyB0aGlzIGFueW1vcmUsIGV4Y2VwdCBmb3IgdGhlIG9scGMgZGNvbiBmYmRldiBkcml2
ZXIgYnV0DQo+Pj4gdGhhdCBoYXMgYmVlbiBtYXJrZWQgYXMgYnJva2VuIGFueXdheXMgYnkg
Y29tbWl0IGRlMDk1MmYyNjdmZiAoInN0YWdpbmc6DQo+Pj4gb2xwY19kY29uOiBtYXJrIGRy
aXZlciBhcyBicm9rZW4iKS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+Pj4gUmV2aWV3ZWQtYnk6IEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29t
Pg0KPj4NCj4+IEkndmUgYXBwbGllZCBpdCB0byB0aGUgZmJkZXYgZ2l0IHRyZWUuDQo+IA0K
PiBJJ3ZlIGRyb3BwZWQgdGhhdCBwYXRjaCBmb3Igbm93IGZyb20gdGhlIGZiZGV2IGdpdCB0
cmVlLCBzaW5jZQ0KPiBpdCBnYXZlIGJ1aWxkIGVycm9ycyBbMV0gaW4gZm9yLW5leHQ6DQo+
IA0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvc2ltcGxlZmIuYzo0MjY6NjogZXJyb3I6IHVz
ZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ251bV9yZWdpc3RlcmVkX2ZiJzsgZGlkIHlv
dSBtZWFuICdXQl9yZWdpc3RlcmVkJz8NCj4gICAgICAgICAgICAgaWYgKG51bV9yZWdpc3Rl
cmVkX2ZiID4gMCkgew0KPiAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4NCg0K
SSd2ZSBhZGRlZCB0aGUgcGF0Y2ggdG8gZHJtLW1pc2MtbmV4dC4gVGhlIGlzc3VlIGhhcyBi
ZWVuIGZpeGVkIHRoZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBIZWxn
ZQ0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDcyNzA4NTcu
bW85b1JjUkUtbGtwQGludGVsLmNvbS8NCj4gDQo+IA0KPj4+DQo+Pj4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDYgKysrLS0tDQo+Pj4gICBpbmNsdWRlL2xpbnV4
L2ZiLmggICAgICAgICAgICAgICB8IDYgLS0tLS0tDQo+Pj4gICAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jDQo+Pj4gaW5kZXggNmFlMWM1ZmExOWY5Li4xZTcwZDhjNjc2NTMg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4+
PiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPj4+IEBAIC01MSwx
MCArNTEsMTAgQEANCj4+PiAgIHN0YXRpYyBERUZJTkVfTVVURVgocmVnaXN0cmF0aW9uX2xv
Y2spOw0KPj4+DQo+Pj4gICBzdHJ1Y3QgZmJfaW5mbyAqcmVnaXN0ZXJlZF9mYltGQl9NQVhd
IF9fcmVhZF9tb3N0bHk7DQo+Pj4gLUVYUE9SVF9TWU1CT0wocmVnaXN0ZXJlZF9mYik7DQo+
Pj4gLQ0KPj4+ICAgaW50IG51bV9yZWdpc3RlcmVkX2ZiIF9fcmVhZF9tb3N0bHk7DQo+Pj4g
LUVYUE9SVF9TWU1CT0wobnVtX3JlZ2lzdGVyZWRfZmIpOw0KPj4+ICsjZGVmaW5lIGZvcl9l
YWNoX3JlZ2lzdGVyZWRfZmIoaSkJCVwNCj4+PiArCWZvciAoaSA9IDA7IGkgPCBGQl9NQVg7
IGkrKykJCVwNCj4+PiArCQlpZiAoIXJlZ2lzdGVyZWRfZmJbaV0pIHt9IGVsc2UNCj4+Pg0K
Pj4+ICAgYm9vbCBmYl9jZW50ZXJfbG9nbyBfX3JlYWRfbW9zdGx5Ow0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaA0KPj4+
IGluZGV4IDQ1M2MzYjJiNmI4ZS4uMGFmZjc2YmNiYjAwIDEwMDY0NA0KPj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvZmIuaA0KPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaA0KPj4+IEBA
IC02MjcsMTYgKzYyNywxMCBAQCBleHRlcm4gaW50IGZiX2dldF9jb2xvcl9kZXB0aChzdHJ1
Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwNCj4+PiAgIGV4dGVybiBpbnQgZmJfZ2V0X29w
dGlvbnMoY29uc3QgY2hhciAqbmFtZSwgY2hhciAqKm9wdGlvbik7DQo+Pj4gICBleHRlcm4g
aW50IGZiX25ld19tb2RlbGlzdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7DQo+Pj4NCj4+PiAt
ZXh0ZXJuIHN0cnVjdCBmYl9pbmZvICpyZWdpc3RlcmVkX2ZiW0ZCX01BWF07DQo+Pj4gLWV4
dGVybiBpbnQgbnVtX3JlZ2lzdGVyZWRfZmI7DQo+Pj4gICBleHRlcm4gYm9vbCBmYl9jZW50
ZXJfbG9nbzsNCj4+PiAgIGV4dGVybiBpbnQgZmJfbG9nb19jb3VudDsNCj4+PiAgIGV4dGVy
biBzdHJ1Y3QgY2xhc3MgKmZiX2NsYXNzOw0KPj4+DQo+Pj4gLSNkZWZpbmUgZm9yX2VhY2hf
cmVnaXN0ZXJlZF9mYihpKQkJXA0KPj4+IC0JZm9yIChpID0gMDsgaSA8IEZCX01BWDsgaSsr
KQkJXA0KPj4+IC0JCWlmICghcmVnaXN0ZXJlZF9mYltpXSkge30gZWxzZQ0KPj4+IC0NCj4+
PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NrX2ZiX2luZm8oc3RydWN0IGZiX2luZm8gKmlu
Zm8pDQo+Pj4gICB7DQo+Pj4gICAJbXV0ZXhfbG9jaygmaW5mby0+bG9jayk7DQo+Pg0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------yopy0awbeO5TYQLqy8sdUIzR--

--------------2qq97eEz5F4B6Y1LNzi01B70
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg/SEFAwAAAAAACgkQlh/E3EQov+BE
WhAAi2urxJdexO+zWIzDWTUJ92jKlV1hbGHXj6FskwxXiORqhucUpAwQ+XSTTKUvjSc2ewwQ/td0
qcngfOH43Ijk/13PDnZW8jI2qmiPd+wfO/Lb0sPQcUSdKR7+oTkXrVDAhYqcS/402ZFvA0YvARnD
daXYkzOMYx79nIoBg0sfWDnszbW2X15pWObH/qAgSGap67kBNcvwL+ocBHryNmYUquycVpga3KJ1
wQuVnV8wAEKpUkvzjtynxhDsUChqFYi8vim9FRRf9lFbGB0/xAkkuZcFXyW25MaapDBa5hKCrZsY
AZGkEAAp3aCY8PGrwFUclS7HD+xa82nnr9K2/ZoaNZioOqhnI7FeUU5oYzhkTRtUIuuzVfe81pR/
/ponJ+B1S1MP11dCRP0eE02s6Pq9scjkOM0jMwLOorXP1ZaTrOtNQ2g0ZHQWm+lgHJUhJns2Rv5x
fTU7B8LPb6FBLCMlABMmcEFXFIzvZrVyUYi8opOhw/38ohuZ6p4TDsHIdTkmt/QiiWn9wyW0Zy72
XZSxeBL3eZo/ryQ3rhilDLUYCD1YFKr/FIY0W+U2ftum49fZC9GmCBxc1yABh1diYoUE5xE9ecBO
te2rkMxYKkz4Gn7rmoGDaAaR7005uXgYvJ5TQr/3nLZTLUTG3VWTLklFSHNCZ6mP0NaJ6rR+s8jY
U7o=
=EMrZ
-----END PGP SIGNATURE-----

--------------2qq97eEz5F4B6Y1LNzi01B70--

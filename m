Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B17745892
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DA210E1ED;
	Mon,  3 Jul 2023 09:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCAA10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:39:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4BA91F8B4;
 Mon,  3 Jul 2023 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688377142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V2pVxeMDN7LtO6/X6UWk1mdFAXw0ByEBF8VdgFGo7Do=;
 b=mhTSMZln8/4KTfOqBpyPB1irL0uie1Hwt6+QQRzeUq+oRckdKuRM7XoNl1a6AZZ49vXmib
 Xbska/aMITyhrHDMuIkomvs4ir0vdlEzik893EMNZARf2seMNCoL7mxq23Xa9AFEOw/r2o
 KvytKXlaC9d/4b18sh1NrRy+s6yV39Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688377142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V2pVxeMDN7LtO6/X6UWk1mdFAXw0ByEBF8VdgFGo7Do=;
 b=C/2tBVDAEdh7Vh3VaY+K+w5zcmemp83J+Nuom0XXI3XTZNINeQkRMrl0QpV8o9QdAzpEOq
 zSNCWsGQn1LajJCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DE0113276;
 Mon,  3 Jul 2023 09:39:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nGODITaXomTcGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Jul 2023 09:39:02 +0000
Message-ID: <96d91373-f955-2209-5cd7-7e1ecacf73f9@suse.de>
Date: Mon, 3 Jul 2023 11:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] drm: Improve Kconfig symbol prompt and help texts
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230702191529.768248-1-javierm@redhat.com>
 <20230702191529.768248-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230702191529.768248-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lTiTWmh0EnGrt3bdrR0y3V3M"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lTiTWmh0EnGrt3bdrR0y3V3M
Content-Type: multipart/mixed; boundary="------------NdeW7CQxhq1Ohtu7DgDZeWcS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Message-ID: <96d91373-f955-2209-5cd7-7e1ecacf73f9@suse.de>
Subject: Re: [PATCH v3 1/3] drm: Improve Kconfig symbol prompt and help texts
References: <20230702191529.768248-1-javierm@redhat.com>
 <20230702191529.768248-2-javierm@redhat.com>
In-Reply-To: <20230702191529.768248-2-javierm@redhat.com>

--------------NdeW7CQxhq1Ohtu7DgDZeWcS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDAyLjA3LjIzIHVtIDIxOjE1IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaGUgY3VycmVudCB0ZXh0IHdlcmUgbm90IGNoYW5nZWQgc2lu
Y2UgdGhlIG9yaWdpbmFsIExpbnV4LTIuNi4xMi1yYzIgZ2l0DQo+IGltcG9ydC4gTGV0J3Mg
aW1wcm92ZSBpdCBhbmQgbWFrZSB0aGF0IG1vcmUgYWxpZ25lZCB3aXRoIHRoZSBEUk0vS01T
IGRvY3MuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAtLS0NCj4gDQo+IChubyBjaGFuZ2VzIHNp
bmNlIHYxKQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyB8IDIyICsrKysrKysr
KysrKystLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+IGluZGV4IGFmYjNiMmY1ZjQyNS4u
MzczZjg1ZTE3NGMyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiBAQCAtMywxMCArMywxMSBAQA0K
PiAgICMgRHJtIGRldmljZSBjb25maWd1cmF0aW9uDQo+ICAgIw0KPiAgICMgVGhpcyBkcml2
ZXIgcHJvdmlkZXMgc3VwcG9ydCBmb3IgdGhlDQo+IC0jIERpcmVjdCBSZW5kZXJpbmcgSW5m
cmFzdHJ1Y3R1cmUgKERSSSkgaW4gWEZyZWU4NiA0LjEuMCBhbmQgaGlnaGVyLg0KPiArIyBE
aXJlY3QgUmVuZGVyaW5nIEluZnJhc3RydWN0dXJlIChEUkkpIHRoYXQgaXMgY29tcG9zZWQg
b2YgdGhlIERpcmVjdA0KPiArIyBSZW5kZXJpbmcgTWFuYWdlciAoRFJNKSBhbmQgS2VybmVs
IE1vZGUgU2V0dGluZ3MgKEtNUykgc3Vic3lzdGVtcy4NCj4gICAjDQo+ICAgbWVudWNvbmZp
ZyBEUk0NCj4gLQl0cmlzdGF0ZSAiRGlyZWN0IFJlbmRlcmluZyBNYW5hZ2VyIChYRnJlZTg2
IDQuMS4wIGFuZCBoaWdoZXIgRFJJIHN1cHBvcnQpIg0KPiArCXRyaXN0YXRlICJEaXJlY3Qg
UmVuZGVyaW5nIE1hbmFnZXIgKERSTSkgYW5kIEtlcm5lbCBNb2RlIFNldHRpbmdzIChLTVMp
Ig0KPiAgIAlkZXBlbmRzIG9uIChBR1AgfHwgQUdQPW4pICYmICFFTVVMQVRFRF9DTVBYQ0hH
ICYmIEhBU19ETUENCj4gICAJc2VsZWN0IERSTV9QQU5FTF9PUklFTlRBVElPTl9RVUlSS1MN
Cj4gICAJc2VsZWN0IEhETUkNCj4gQEAgLTE5LDEzICsyMCwxNiBAQCBtZW51Y29uZmlnIERS
TQ0KPiAgIAlzZWxlY3QgVklERU9fQ01ETElORQ0KPiAgIAlzZWxlY3QgVklERU9fTk9NT0RF
U0VUDQo+ICAgCWhlbHANCj4gLQkgIEtlcm5lbC1sZXZlbCBzdXBwb3J0IGZvciB0aGUgRGly
ZWN0IFJlbmRlcmluZyBJbmZyYXN0cnVjdHVyZSAoRFJJKQ0KPiAtCSAgaW50cm9kdWNlZCBp
biBYRnJlZTg2IDQuMC4gSWYgeW91IHNheSBZIGhlcmUsIHlvdSBuZWVkIHRvIHNlbGVjdA0K
PiAtCSAgdGhlIG1vZHVsZSB0aGF0J3MgcmlnaHQgZm9yIHlvdXIgZ3JhcGhpY3MgY2FyZCBm
cm9tIHRoZSBsaXN0IGJlbG93Lg0KPiAtCSAgVGhlc2UgbW9kdWxlcyBwcm92aWRlIHN1cHBv
cnQgZm9yIHN5bmNocm9uaXphdGlvbiwgc2VjdXJpdHksIGFuZA0KPiAtCSAgRE1BIHRyYW5z
ZmVycy4gUGxlYXNlIHNlZSA8aHR0cDovL2RyaS5zb3VyY2Vmb3JnZS5uZXQvPiBmb3IgbW9y
ZQ0KPiAtCSAgZGV0YWlscy4gIFlvdSBzaG91bGQgYWxzbyBzZWxlY3QgYW5kIGNvbmZpZ3Vy
ZSBBR1ANCj4gLQkgICgvZGV2L2FncGdhcnQpIHN1cHBvcnQgaWYgaXQgaXMgYXZhaWxhYmxl
IGZvciB5b3VyIHBsYXRmb3JtLg0KPiArCSAgS2VybmVsLWxldmVsIHN1cHBvcnQgZm9yIHRo
ZSBEaXJlY3QgUmVuZGVyaW5nIEluZnJhc3RydWN0dXJlIChEUkkpLA0KPiArCSAgdGhhdCBp
cyBjb21wb3NlZCBvZiB0aGUgRGlyZWN0IFJlbmRlcmluZyBNYW5hZ2VyIChEUk0pIGFuZCBL
ZXJuZWwNCj4gKwkgIE1vZGUgU2V0dGluZ3MgKEtNUykgc3Vic3lzdGVtcy4NCg0KSXQncyBz
bGlnaHRseSBvZmYsIGFzIEtNUyBpcyBwYXJ0IG9mIERSTS4gSSdkIGp1c3QgZHJvcCBhbnkg
bWVudGlvbiBvZiBLTVMuDQoNCkJ1dCBUQkggaW5zdGVhZCBvZiB0aGVzZSBzbWFsbCBmaXhl
cywgd2Ugc2hvdWxkIGZpcnN0IGRpc2N1c3MgaG93IHdlIA0Kb3JnYW5pemUgdGhlIG1lbnUg
c3RydWN0dXJlcy4gRm9yIGV4YW1wbGUsIHRoZSBEUk0gZHJpdmVycyBhcmUgYWxsIA0KbGlz
dGVkIGluIHRoZSBncmFwaGljcyBtZW51LiBUaGV5IG1pZ2h0IGFzIHdlbGwgZ28gaW50byBh
IERSTSBtZW51Lg0KDQpUaGUgZnJhbWVidWZmZXIgd2lsbCBiZSBzcGxpdCBpbnRvIGRyaXZl
cnMgYW5kICdjb3JlJy4gVGhlIGNvcmUgb3B0aW9ucyANCihGQl9ERVZJQ0UsIEZJUk1XQVJF
X0VESUQsIEZCXypfRU5ESUFOKSBwcm9iYWJseSBkZXNlcnZlIGEgc2VwYXJhdGUgbWVudS4N
Cg0KQW5kIHRoZXJlJ3MgdGhlIGZyYW1lYnVmZmVyIGNvbnNvbGUsIHdoaWNoIGhhcyBpdHMg
b3duIG1lbnUuIFdlIG5lZWQgdG8gDQpzaG93IGl0IGV2ZW4gaWYgb25seSBEUk0gaXMgc3Vw
cG9ydGVkLiBQbHVzIHRoZSBvdGhlciBjb25zb2xlcy4NCg0KSSdtIG5vdCBzdXJlIHdoYXQg
ZHJpdmVycy9hdXhkaXNwbGF5IGlzLCBpdCBtaWdodCBmaXQgaGVyZSBhcyB3ZWxsLg0KDQpJ
dCB3b3VsZCBiZSBuaWNlIHRvIHJldGhpbmsgdGhlIG92ZXJhbGwgbWVudS4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiArDQo+ICsJICBJZiB5b3Ugc2F5IFkgaGVyZSwgeW91IG5l
ZWQgdG8gc2VsZWN0IHRoZSBtb2R1bGUgdGhhdCdzIHJpZ2h0IGZvcg0KPiArCSAgeW91ciBn
cmFwaGljcyBjYXJkIGZyb20gdGhlIGxpc3QgYmVsb3cuIFRoZXNlIG1vZHVsZXMgcHJvdmlk
ZSBzdXBwb3J0DQo+ICsJICBmb3Igc3luY2hyb25pemF0aW9uLCBzZWN1cml0eSwgYW5kIERN
QSB0cmFuc2ZlcnMuDQo+ICsNCj4gKwkgIFBsZWFzZSBzZWUgPGh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2dwdS9pbmRleC5odG1sPg0KPiArCSAgZm9yIG1vcmUg
ZGV0YWlscyBhYm91dCB0aGUgTGludXggRFJNIGFuZCBLTVMgc3Vic3lzdGVtcy4NCj4gICAN
Cj4gICBjb25maWcgRFJNX01JUElfREJJDQo+ICAgCXRyaXN0YXRlDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------NdeW7CQxhq1Ohtu7DgDZeWcS--

--------------lTiTWmh0EnGrt3bdrR0y3V3M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSilzUFAwAAAAAACgkQlh/E3EQov+C+
QRAApma/XWmHjEFI8+4C4tvo8HpiFXcxdIIPr6CqBasAShmA8ZV5N33nKfb1XVhC/Tj4lpwbFgDD
jKQiAId5vfP9ubxldcyXz6Yo/uhO5MkO+RSsU45uY0F2+mRZ3O+Vui8oOUwlKK2NEoMZ4nNxzNbO
BI4fQVihJWS8ZCbrATzrhBGqQPCHf+OtpAGBkcXLQPUVLhJSX2cBIqTU7qzWliHLAPoyXqkWsviI
MTUuTp6RIIrA/aVfAm9PVIeBOISUWlqKXFJdo1BYr9a6R2EH9N+SPqBqp0Ds9jmuMU559C5igTv4
ZtH3gAQ6praOh7KhSJydYa3cOyYkYiM7K2TMqF4sbhYqh1L72b2mFYR1DJPlUQ5wouQ4JoK3VQng
f/ZND0HVjJHR5i9ZZFMxdwfaQQP7lNkThYOLWPoh42lpzA5f4u51Nr9ueEcr5AhLCR/z2Zf4IKAw
WXiOXCX8u8Vh667ok0CwtYzTsZJQlQS20VmUTT166JGMKmgJfkYxBzetbePs83jgyUBM3KnXRNiU
Q/obLlnzupTKHAscPMRaMcwbz7pKAvBlfF5T1lTQDnzcCqS5dQere/oushlZxVXk3o+R9fx/Kvc5
lFMb+iY5/lK6SgV8cfRYv6bHJL5Unc5DpeIQ76toBCkP+9bD9Dy11MmcCPeFs1gQ/1mJpY1qRc4R
E3c=
=8ejt
-----END PGP SIGNATURE-----

--------------lTiTWmh0EnGrt3bdrR0y3V3M--

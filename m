Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B84ABE9F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 13:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372B910E1A0;
	Mon,  7 Feb 2022 12:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3567510E1A0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 12:44:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8A6C210FA;
 Mon,  7 Feb 2022 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644237872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fm3Hca/uzXhbYie979FgZfnFphMe3Z7RRg4zd6rl6XA=;
 b=fZVCs+CMytbezBVuxQehYFx4LZrjEXf2Vcpr7JlQW/9jUJbBYX5Y7zlL+D3XW9WcU9naGp
 OA66/Xo0GbPlqvY9+buTsXIa1/DJay1EK+DHrPkCkOASTC0iIGC5y4oLqRCQ+sLO2Lh39A
 XUyP8msmynKa0nRxQav8fPjk7ejhwcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644237872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fm3Hca/uzXhbYie979FgZfnFphMe3Z7RRg4zd6rl6XA=;
 b=UvY0vJmR3xSPxee9tQ9XceFUY5Dv1cs4AwxnMCImFrerWtJLkHzLbJ/ZQU3S2y8lePP7R3
 HzH2+lRzuwMx87Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E21013BF5;
 Mon,  7 Feb 2022 12:44:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +0SOHTAUAWLZCgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 12:44:32 +0000
Message-ID: <11d3b6d4-3e31-05cc-c021-22e1497f02d1@suse.de>
Date: Mon, 7 Feb 2022 13:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
Content-Language: en-US
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
 <CAKb7UvgxhLFT4aqYSE+=dpqfuTkvr62tsGmQP5H46mAytaQBRg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKb7UvgxhLFT4aqYSE+=dpqfuTkvr62tsGmQP5H46mAytaQBRg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tfQqrAesgLp1qKiU02HjQVFV"
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tfQqrAesgLp1qKiU02HjQVFV
Content-Type: multipart/mixed; boundary="------------DQMouTCacmkGVTRyTTuQE7rM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <11d3b6d4-3e31-05cc-c021-22e1497f02d1@suse.de>
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
 <CAKb7UvgxhLFT4aqYSE+=dpqfuTkvr62tsGmQP5H46mAytaQBRg@mail.gmail.com>
In-Reply-To: <CAKb7UvgxhLFT4aqYSE+=dpqfuTkvr62tsGmQP5H46mAytaQBRg@mail.gmail.com>

--------------DQMouTCacmkGVTRyTTuQE7rM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMjI6MDIgc2NocmllYiBJbGlhIE1pcmtpbjoNCj4gT24g
RnJpLCBGZWIgNCwgMjAyMiBhdCAxMDo1MyBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gSGkNCj4+DQo+PiBBbSAwNC4wMi4yMiB1
bSAxNDo0MyBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+PiBBZGQgc3Vw
cG9ydCB0byBjb252ZXJ0IFhSMjQgYW5kIDgtYml0IGdyYXlzY2FsZSB0byByZXZlcnNlZCBt
b25vY2hyb21lIGZvcg0KPj4+IGRyaXZlcnMgdGhhdCBjb250cm9sIG1vbm9jaHJvbWF0aWMg
cGFuZWxzLCB0aGF0IG9ubHkgaGF2ZSAxIGJpdCBwZXIgcGl4ZWwuDQo+Pj4NCj4+PiBUaGUg
ZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWQoKSBoZWxwZXIgd2FzIGJhc2VkIG9uIHRo
ZSBmdW5jdGlvbiB0aGF0DQo+Pj4gZG9lcyB0aGUgc2FtZSBpbiB0aGUgZHJpdmVycy9ncHUv
ZHJtL3RpbnkvcmVwYXBlci5jIGRyaXZlci4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4+IC0tLQ0K
Pj4+DQo+Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+Pj4NCj4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyB8IDgwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+Pj4gICAgaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCAgICAgfCAg
NyArKysNCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKykNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+Pj4gaW5kZXggMGYyOGRk
MmJkZDcyLi5jZGNlNGI3YzI1ZDkgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9mb3JtYXRfaGVscGVyLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zv
cm1hdF9oZWxwZXIuYw0KPj4+IEBAIC01ODQsMyArNTg0LDgzIEBAIGludCBkcm1fZmJfYmxp
dF90b2lvKHZvaWQgX19pb21lbSAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCB1aW50
MzJfdCBkc3RfZm9yDQo+Pj4gICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+ICAgIH0NCj4+
PiAgICBFWFBPUlRfU1lNQk9MKGRybV9mYl9ibGl0X3RvaW8pOw0KPj4+ICsNCj4+PiArc3Rh
dGljIHZvaWQgZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWRfbGluZSh1OCAqZHN0LCBj
b25zdCB1OCAqc3JjLCBzaXplX3QgcGl4ZWxzKQ0KPj4+ICt7DQo+Pj4gKyAgICAgdW5zaWdu
ZWQgaW50IHhiLCBpOw0KPj4+ICsNCj4+PiArICAgICBmb3IgKHhiID0gMDsgeGIgPCBwaXhl
bHMgLyA4OyB4YisrKSB7DQo+Pg0KPj4gSW4gcHJhY3RpY2UsIGFsbCBtb2RlIHdpZHRocyBh
cmUgbXVsdGlwbGVzIG9mIDggYmVjYXVzZSBWR0EgbWFuZGF0ZWQgaXQuDQo+PiBTbyBpdCdz
IG9rLWlzaCB0byBhc3N1bWUgdGhpcyBoZXJlLiBZb3Ugc2hvdWxkIHByb2JhYmx5IGF0IGxl
YXN0IHByaW50IGENCj4+IHdhcm5pbmcgc29tZXdoZXJlIGlmIChwaXhlbHMgJSA4ICE9IDAp
DQo+IA0KPiBOb3Qgc3VyZSBpZiBpdCdzIHJlbGV2YW50LCBidXQgMTM2Nng3Njggd2FzIGEg
ZmFpcmx5IHBvcHVsYXIgbGFwdG9wDQo+IHJlc29sdXRpb24uIFRoZXJlJ3MgZXZlbiBhIGRl
ZGljYXRlZCBkcm1fbW9kZV9maXh1cF8xMzY2eDc2OCBpbg0KPiBkcm1fZWRpZC5jLiAoV291
bGQgaXQgaGF2ZSBraWxsZWQgdGhlbSB0byBhZGQgMiBtb3JlIGhvcml6b250YWwNCj4gcGl4
ZWxzPyBBcHBhcmVudGx5LikNCg0KRCdvaCENCg0KRG8geW91IGtub3cgaG93IHRoZSB0ZXh0
IGNvbnNvbGUgbG9va3MgaW4gdGhpcyBtb2RlPyBGb250cyBzdGlsbCBleHBlY3QgDQphIG11
bHRpcGxlIG9mIDguDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IENoZWVycywN
Cj4gDQo+ICAgIC1pbGlhDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------DQMouTCacmkGVTRyTTuQE7rM--

--------------tfQqrAesgLp1qKiU02HjQVFV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIBFC8FAwAAAAAACgkQlh/E3EQov+B+
0BAAw+HwjL96CAPp6PCfz73k3/HGoFK8bVBoBvx6P8FLvNiqC46JHBXy00kTJ6kA2UZGFkwilhdH
tTuUXWgKrRlU3xpSV6CZkkaxsoSBozAOIiVCTNXs8OLLErtHJ5WEvEiYsqqaG46agM0ij67KC8t7
E1uNtdi3CacDAUr/255+vq8Sk7B3z+5GTgIKJ9wH3AaZn0un41HzncQ3ouEFY0p5S4hCDINt6O+u
OmTtqO5NXZePZP33vhsLOq0F3uu3QLfk4NjB28Xq2xBzW9gEhKsnIHz4wr8ReYOveQK5u8+NehXR
BulND7Bura3Lia+wTk6Xk8h0NGhP8YxCD/kEznskX4dsVNgdga9Auxwtm9uk5F73bCTlciSAOihW
YwsV1rX0VSk5iRUOll9ROwmxJpZYbwjQf3jv0DP3Mql3IC9KUipzTIML7Evhe67+gZ04y77uJo5i
Bv8PsFAp6Qn+T+eUK2wCryJTcg5NZec8AGBwe46KAp8pjm0oAEc98WPinnZn7DZQiCXGZYEU5/ZE
cMDsRNmbLnvCh70FkRg8cr61PX4/IzKVF54oOldLhd/490a28ISosBWNH9+L/pRxuDerc9Tkr0JM
w2N8VTlri5V16mQeTI3A/OgnY7gCuS5FKakCirKHqxzTxHHjgs2/DH4cfeHBmgLhX4UONDWrtltZ
BcY=
=w1Rr
-----END PGP SIGNATURE-----

--------------tfQqrAesgLp1qKiU02HjQVFV--

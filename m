Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795834B4523
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9217410E1FC;
	Mon, 14 Feb 2022 09:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60D910E249
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:03:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8502021102;
 Mon, 14 Feb 2022 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644829434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W3lMPiTg57Iko6QmDb0Lnn87uO6or+yWRk31NJauq84=;
 b=0ieHyXIAKW2yHHxjqXfbljyCAnHRnXYTitEbxfEPkFbob1DdWgu5RdjJh/gc8h2RyYB4Zw
 k3CEJNqS9FH+mReJXEc2Kqrh3j1S8o+LOPlgY4ihtxL1sFQMzY5cRtmzb5Jnk3sBnjqhbO
 +Fn46meiQRUZ5Tx0owCpauiPOGew2q0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644829434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W3lMPiTg57Iko6QmDb0Lnn87uO6or+yWRk31NJauq84=;
 b=m1IJPTAHqiI4DsoaH/y8pmiur/j9G2cpZpciP37DP1HoNg0bDM87tmAT+eFRCkDJF9dWBQ
 PSVavyzuKCSy80Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F9FC139F7;
 Mon, 14 Feb 2022 09:03:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZHcTDvoaCmJbFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Feb 2022 09:03:54 +0000
Message-ID: <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
Date: Mon, 14 Feb 2022 10:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9r9vdwQSlsgyB0a0sZnBMljM"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9r9vdwQSlsgyB0a0sZnBMljM
Content-Type: multipart/mixed; boundary="------------TOhClv0puf9niKOCohE7Cq0Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
In-Reply-To: <YgaDj6Wld4b7S6DF@smile.fi.intel.com>

--------------TOhClv0puf9niKOCohE7Cq0Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDIuMjIgdW0gMTY6NDEgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQpb
Li4uXQ0KPj4gSU1PICphbHdheXMqIHByZWZlciBhIGZvciBsb29wIG92ZXIgd2hpbGUgb3Ig
ZG8td2hpbGUuDQo+Pg0KPj4gVGhlIGZvciAoaSA9IDA7IGkgPCBOOyBpKyspIGlzIHN1Y2gg
YSBzdHJvbmcgcGFyYWRpZ20gaW4gQy4gWW91DQo+PiBpbnN0YW50bHkga25vdyBob3cgbWFu
eSB0aW1lcyB5b3UncmUgZ29pbmcgdG8gbG9vcCwgYXQgYSBnbGFuY2UuIE5vdCBzbw0KPj4g
d2l0aCB3aXRoIHRoZSBhbHRlcm5hdGl2ZXMsIHdoaWNoIHNob3VsZCBiZSB1c2VkIHNwYXJp
bmdseS4NCj4gDQo+IHdoaWxlICgpIHt9ICBfaXNfIGEgcGFyYWRpZ20sIGZvci1sb29wIGlz
IHN5bnRheCBzdWdhciBvbiB0b3Agb2YgaXQuDQoNCk5hdywgdGhhdCdzIG5vdCB0cnVlLiBB
biBpZGlvbWF0aWMgZm9yIGxvb3AsIHN1Y2ggYXMgZm9yIChpID0gLi4uOyBpIDwgDQpOOyAr
K2kpLCBpcyBzdWNoIGEgc3Ryb25nIHBhdHRlcm4gdGhhdCBpdCdzIHdheSBiZXR0ZXIgdGhh
biB0aGUgDQpjb3JyZXNwb25kaW5nIHdoaWxlIGxvb3AuDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+PiBBbmQgeWVzLCB0aGUgZG8td2hpbGUgc3VnZ2VzdGVkIGFib3ZlIGlz
IGJ1Z2d5LCBhbmQgeW91IGFjdHVhbGx5IG5lZWQgdG8NCj4+IHN0b3AgYW5kIHRoaW5rIHRv
IHNlZSB3aHkuDQo+IA0KPiBJdCBkZXBlbmRzIGlmIHBpeGVscyBjYW4gYmUgMCBvciBub3Qg
YW5kIGlmIGl0J3Mgbm90LCB0aGVuIGRvZXMgaXQgY29udGFpbiBsYXN0DQo+IG9yIG51bWJl
ci4NCj4gDQo+IFRoZSBkbyB7fSB3aGlsZSAoLS1waXhlbHMpOyBtaWdodCBiZSBidWdneSBp
ZmYgcGl4ZWxzIG1heSBiZSAwLg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------TOhClv0puf9niKOCohE7Cq0Y--

--------------9r9vdwQSlsgyB0a0sZnBMljM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIKGvkFAwAAAAAACgkQlh/E3EQov+D1
NRAAl0Tkel7hQbmEBYFBk33mWf2ADjIJdNKtcScF65RHWVgK8fsiKWL9EVPJCuWCMaoPpfCBSMko
H4VQEK2ewznQEWCDiWT2dySckU5ThAbj2PemHophTeOE1AhMEsDQc+NmobiLU9uZNN8xLaLIg65d
CtHxdV/wbfLL0n4kR4azCP6fOuaSlT+Bq6qFd9FioGPxpDGlAPB0ogID82N2iNz50X/nD/c8X/Ka
Pbi1wi9vlS7ZKs2VcPTjEto6o1gGe24TngiOazAH0cFgSoWNEgg2d9E38KEfEkpOCSoz54h8zahU
8i9d6UNiRE+Vjvi5JvZ6NYvNZ2iy1l678hudsR/Qxh2v7/1ybluL4Ve1EITFwip1F1Wa+g9HSi8z
YrUqwSmYKmeoc7/hnRVbTPFehGiUSP0Ipf5uYQfsU7fNwpTDQ6/zT5f1OtLVApYJDzZvWrTXsayz
45hNk/Tna5iRAYRgccftRHsHfNadThv94RkNZz/flTSNwU7U5B1b1Jm9rCoWPt0zgUjc/nr3JOqw
fKANq6/yrd476g+1kwZSVq+DI0Zcc/ApvJZSlei7iFtHZc55kMJFTIFaYAZs25QXjewF/qNTl6rU
V6kOzkXfrBWgynNJlVCb6qn5uuKdqrX44/t75wExhqvxPIY52AwX+Cbav7hXUhpLYmi2cQhjU4dY
hzg=
=2OAQ
-----END PGP SIGNATURE-----

--------------9r9vdwQSlsgyB0a0sZnBMljM--

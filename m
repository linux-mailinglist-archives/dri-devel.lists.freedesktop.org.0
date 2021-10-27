Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655043C4AE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD3F6E1A8;
	Wed, 27 Oct 2021 08:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6433F6E1A8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 08:08:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEF3821960;
 Wed, 27 Oct 2021 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635322084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HYRTO7SiYiDRR4OmHP9Dvsu9mAgR87HDVXZkLpnAbPU=;
 b=N0LfwUuXRj0rCv6r0hp30+Sg/UEMj/HLyp/XetndR3u/6CAg4BoGxqMPO1J8O5CSWDn8tg
 VsZfvCE+RG25zuSCxgSKTON9oy9Ppc5e0eLC7G9tSdSuT6RDtAaMdxYnYXjik8z3lvAbI+
 nI8VLekGQ+M176FTFIa/Wn10AdjBod8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635322084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HYRTO7SiYiDRR4OmHP9Dvsu9mAgR87HDVXZkLpnAbPU=;
 b=U5wwmVMho/GzzvGeJdFHyXIDbz8VpvSGmGJX5FY+KwGQz7eljiKH2gvBUD7Z6NVcVMICxR
 xzYoJcuuZ6CeGIDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 628C813FF0;
 Wed, 27 Oct 2021 08:08:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zXwGF+QIeWGmBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Oct 2021 08:08:04 +0000
Message-ID: <109f764d-60fe-0ae5-ddd4-760210e4992a@suse.de>
Date: Wed, 27 Oct 2021 10:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
 <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
 <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
 <61f14f2b-b1cd-b9df-86fd-8fcc4b9eb738@infradead.org>
 <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GVlbCROwYOR5BML01ZhCGFoi"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GVlbCROwYOR5BML01ZhCGFoi
Content-Type: multipart/mixed; boundary="------------QrcDRKDH0lpKTS4slmMoFCDN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>
Message-ID: <109f764d-60fe-0ae5-ddd4-760210e4992a@suse.de>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
 <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
 <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
 <61f14f2b-b1cd-b9df-86fd-8fcc4b9eb738@infradead.org>
 <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>
In-Reply-To: <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>

--------------QrcDRKDH0lpKTS4slmMoFCDN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCkFtIDI3LjEwLjIxIHVtIDA4OjUwIHNjaHJpZWIgQXJuZCBCZXJnbWFubjoNCj4g
T24gV2VkLCBPY3QgMjcsIDIwMjEgYXQgODoyNiBBTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6DQo+PiBPbiAxMC8yNi8yMSAxMToxOSBQTSwgQXJuZCBC
ZXJnbWFubiB3cm90ZToNCj4+PiBPbiBXZWQsIE9jdCAyNywgMjAyMSBhdCAyOjU4IEFNIFJh
bmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToNCj4gDQo+Pj4gVGhp
cyB0cml2aWFsIGNoYW5nZSBtYWtlcyBpdCBhbGwgYnVpbGQ6DQo+Pj4NCj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZp
Zw0KPj4+IGluZGV4IGMwODg2MGRiMjUyMC4uNjk5ZjQzNGNlODEzIDEwMDY0NA0KPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L0tjb25maWcNCj4+PiBAQCAtMjE4LDcgKzIxOCw3IEBAIGNvbmZpZyBEUk1fR0VNX0NNQV9I
RUxQRVINCj4+PiAgICAgICAgICAgICBDaG9vc2UgdGhpcyBpZiB5b3UgbmVlZCB0aGUgR0VN
IENNQSBoZWxwZXIgZnVuY3Rpb25zDQo+Pj4NCj4+PiAgICBjb25maWcNCj4gDQo+Pj4gLSAg
ICAgICBib29sDQo+Pj4gKyAgICAgICB0cmlzdGF0ZQ0KPj4+ICAgICAgICAgICBkZXBlbmRz
IG9uIERSTQ0KPj4+ICAgICAgICAgICBzZWxlY3QgRFJNX0dFTV9DTUFfSEVMUEVSDQo+Pj4g
ICAgICAgICAgIGhlbHANCj4+Pg0KPj4+IGJ1dCB0aGlzIG5lZWRzIHNvbWUgbW9yZSB0ZXN0
aW5nIHRvIG1ha2Ugc3VyZSBpdCBkb2Vzbid0IGFkZA0KPj4+IGFueSBvdGhlciByZWdyZXNz
aW9ucy4NCj4+Pg0KPj4+IEludGVyZXN0aW5nbHksIEkgbmV2ZXIgaGl0IHRoZSBwcm9ibGVt
IGluIHJhbmRjb25maWcgdGVzdGluZyBzaW5jZQ0KPj4+IHRoZXJlIGlzIGFsd2F5cyBzb21l
ICc9eScgZHJpdmVyIHRoYXQgc2VsZWN0cyBEUk1fS01TX0hFTFBFUi4NCj4+DQo+PiBUaG9t
YXMgaGFkIHBvc3RlZCBhIHBhdGNoIHRoYXQgYWxzbyBmaXhlcyB0aGUgcHJvYmxlbS4NCj4+
IFNvbWVob3cgSSBtaXNzZWQgc2VlaW5nIHRoYXQgdGhlIGZpcnN0IHRpbWUgYXJvdW5kLg0K
PiANCj4gQWggcmlnaHQsIEkgbWlzc2VkIHRoYXQgYXMgd2VsbC4gVGhhdCBwYXRjaCBzZWVt
cyByZWFzb25hYmxlDQo+IHRvIG1lLCBidXQgSSB0aGluayB3ZSBtYXkgd2FudCBib3RoIG9m
IHRoZW0gaW4gdGhpcyBjYXNlLCBhcw0KPiBpdCBkb2VzIG5vdCBhZGRyZXNzIERSTV9HRU1f
Q01BX0hFTFBFUiBiZWluZyBzZXQgdG8gPXkNCj4gd2hlbiBpdCBpcyBvbmx5IHVzZWQgZnJv
bSBtb2R1bGVzLg0KDQpZZXMsIHRoZSBib29sIHN0YXRlIHdhcyBpbmRlZWQgdGhlIHByb2Js
ZW0uIFRoZSBwYXRjaCBJIHBvc3RlZCByZXNvbHZlcyANCnRoZSBpc3N1ZSBmb3Igbm93LiBG
b3IgbGF0ZXIsIEkgaGF2ZSBhIHBhdGNoc2V0IHRoYXQgaW1wcm92ZXMgQ01BIGhlbHBlciAN
CnVzYWdlIGEgYml0IGFuZCByZXNvbHZlcyB0aGUgS2NvbmZpZyBwcm9ibGVtLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAgICAgICAgIEFybmQNCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------QrcDRKDH0lpKTS4slmMoFCDN--

--------------GVlbCROwYOR5BML01ZhCGFoi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF5COMFAwAAAAAACgkQlh/E3EQov+Cu
+RAAwbx6XbFt3hi4Y99OS23g/45RL6yz9bx2FgTDul1YaKZ16/JsPbP4REl+Vu0TpGDb62t/BccA
bd1jML7lqVyhdahGAuPMvJleU0uMZg62W19i+S1hbJVCx8l2wAy+q4ubd3LIybMySAsxy2KAi7+w
4r9sXTGjN8YhBuajlUhZVlR21lYeKsh78tUbQdKDJKM9Kd7LErv+MLq/KmJqoRkFJAxPj3iTE9JV
NzIhKCgz+1hkRBXWlBlIIB+bWv00XqE5Gp7E3T+CzADVZDqmqbjB8SymZJQ0YkIcpxlmh+BMRC/f
gLjWoq+vsskSp2nppZdg2sw0UzstTHBLY36zqXOe7mIo5U8uVjUmvpObzCkUlNK5cS2xqbhdvW9+
iybzf45iHrF6JNw6LOwgJQ/xKYZ2q5hIc9L4jy2qd21HFJqcwUQ7XiSHJWzEnq329pINg4WRCcKH
+ImF8ejaogohLeQp03Z40BaDR1whQIrpP5OodXC2FNKM2OXYxoIZNKWguG9cWigLi2ZIIEamBzX/
LQTsDgPrYgdULEa9wd8I2mMwwQjkhXgFjjgjnkI/3wy1feA/QztPzDsmnRMylpofMtFSlROpI7dt
jeISsSKXyWL5GkWhRL5J/y8t5TP/LD6wiLiLeK4faAwf0nnI0Tghzi70yukgvMs1dWzFla3dELgA
U0o=
=mL4e
-----END PGP SIGNATURE-----

--------------GVlbCROwYOR5BML01ZhCGFoi--

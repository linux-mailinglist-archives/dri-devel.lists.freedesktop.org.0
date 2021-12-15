Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7034754DF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CD310E2F0;
	Wed, 15 Dec 2021 09:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271110E2F0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:10:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 763BE212C2;
 Wed, 15 Dec 2021 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639559421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yaOtXoXAxLmS3EoYLymWISdTN/mex+bCq/Gcj1u/AAc=;
 b=vaSwDzF0Xv2ln3MhOmTYXF5PCcpBpYuNGd6krKZ4BXD2ZVkKrOmQb/PmFfwIzI8J56tuky
 rlQhrcjleonZ6FSh7N5niHbyH3BLuuqEbIEzHtJnXRMVEV6eMnDp1gj8ZG3Ukf7N7pdM0B
 PfzcUD9VaY9tZvoaoDHJJ3lnrWyTml8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639559421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yaOtXoXAxLmS3EoYLymWISdTN/mex+bCq/Gcj1u/AAc=;
 b=4i8Tkp+RcyOc2eht3bBhFsB2zcqp4ofSzhQ+HQCcWyD/UfyPfwYibHoXzGWozLz7jeI0Wx
 SSmGUbz0mqJbiGCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99A9613AC7;
 Wed, 15 Dec 2021 09:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cmaCJPywuWHJSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 09:10:20 +0000
Message-ID: <be79a619-491b-da9f-9db4-de3919e08fff@suse.de>
Date: Wed, 15 Dec 2021 10:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <58d00cac-dbf1-9704-3c0b-16fd837a5b6b@suse.de>
 <1c1aeb13-6e90-ed2b-08db-11ceaa8d0de0@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1c1aeb13-6e90-ed2b-08db-11ceaa8d0de0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FUBRZuT557ZUV0zq60QTkWTk"
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Lechner <david@lechnology.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Tomi Valkeinen <tomba@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Sandy Huang <hjc@rock-chips.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Qiang Yu <yuq825@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FUBRZuT557ZUV0zq60QTkWTk
Content-Type: multipart/mixed; boundary="------------KSFt5G0iXD2T5MGhgvb3pt74";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King
 <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James (Qian) Wang" <james.qian.wang@arm.com>, Joel Stanley
 <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Qiang Yu <yuq825@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Lechner <david@lechnology.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Alison Wang <alison.wang@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sean Paul <sean@poorly.run>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Sandy Huang
 <hjc@rock-chips.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Erico Nunes <nunes.erico@gmail.com>
Message-ID: <be79a619-491b-da9f-9db4-de3919e08fff@suse.de>
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
References: <20211215010008.2545520-1-javierm@redhat.com>
 <58d00cac-dbf1-9704-3c0b-16fd837a5b6b@suse.de>
 <1c1aeb13-6e90-ed2b-08db-11ceaa8d0de0@redhat.com>
In-Reply-To: <1c1aeb13-6e90-ed2b-08db-11ceaa8d0de0@redhat.com>

--------------KSFt5G0iXD2T5MGhgvb3pt74
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjEgdW0gMDk6NTAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDEyLzE1LzIxIDA5OjMxLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpIEphdmllciwNCj4+DQo+PiBub3RoaW5nIHdy
b25nIHdpdGggeW91ciBwYXRjaGVzLCBidXQgSSdkIGxpa2UgdG8gcHJvcG9zZSBzbGlnaHRs
eQ0KPj4gZGlmZmVybnQgc29sdXRpb24uDQo+Pg0KPj4gRm9yIG1hbnkgVVNCIGRyaXZlcnMs
IHlvdSBwdXQgdGhlIGRybV9maXJtd2FyZV9kcml2ZXJzX29ubHkoKSBjYWxsIGludG8NCj4+
IHRoZSBwcm9iZSBmdW5jdGlvbi4gRm9yIHJlZ2lzdGVyaW5nLCB0aGVzZSBkcml2ZXJzIHVz
ZQ0KPj4gbW9kdWxlX3VzYl9kcml2ZXIoKSwgd2hpY2ggZXhwYW5kcyB0byBnZW5lcmljIGRl
dmljZS1yZWdpc3RlciBmdW5jdGlvbnMuDQo+Pg0KPj4gSSdkIGxpa2UgdG8gcHJvcG9zZSBh
IHNpbWlsYXIgbWFjcm8gZm9yIERSTSBkcml2ZXJzIHRoYXQgaW5jbHVkZXMgdGhlDQo+PiB0
ZXN0IGZvciBkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkuDQo+Pg0KPj4gSW4gZHJtX2Ry
di5oIDoNCj4+DQo+PiAgICAgI2lmIGRlZmluZWQoVVNCKQ0KPj4gICAgIHN0YXRpYyBpbnQg
ZHJtX3VzYl9yZWdpc3RlcihzdHJ1Y3QgdXNiX2RyaXZlciAqdXNiKQ0KPj4gICAgIHsNCj4+
IAlpZiAoZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSgpKQ0KPj4gCQlyZXR1cm4gLUVOT0RF
VjsNCj4+IAlyZXR1cm4gdXNiX3JlZ2lzdGVyX2RyaXZlcih1c2IpOw0KPj4gICAgIH0NCj4+
ICAgICAjZGVmaW5lIGRybV9tb2R1bGVfdXNiX2RyaXZlcihfX3VzYikNCj4+IAltb2R1bGVf
ZHJpdmVyKGRybV91c2JfcmVnaXN0ZXIsIHVzYl9kZXJlZ2lzdGVyKQ0KPj4gICAgICNlbmRp
Zg0KPj4NCj4+IEluIGVhY2ggb2YgdGhlIFVTQi1iYXNlZCBEUk0gZHJpdmVycywgcmVwbGFj
ZSBtb2R1bGVfdXNiX2RyaXZlciB3aXRoDQo+PiBkcm1fbW9kdWxlX3VzYl9kcml2ZXIuDQo+
Pg0KPj4gQW5kIHRoZW4gdGhlcmUncyBQQ0kgWzNdIGFuZCBwbGF0Zm9ybSBkcml2ZXJzLCBb
NF0gd2hpY2ggY2FuIGJlIGhhbmRsZWQNCj4+IHNpbWlsYXJseS4gTWFueSBQQ0kgZHJpdmVy
cyBvcGVuLWNvZGUgdGhlIG1vZHVsZSBpbml0IGFuZCBkZXZpY2UNCj4gDQo+IFRoYW5rcyBm
b3IgdGhlIHN1Z2dlc3Rpb24uIEkgYWN0dWFsbHkgdGhvdWdodCBhYm91dCB0aGlzIGFwcHJv
YWNoIGFzIHdlbGwsDQo+IHNpbmNlIHNlZW1zIHVubmVjZXNzYXJ5IHRvIGhhdmUgYWxsIHRo
YXQgZHVwbGljYXRlZCBsb2dpYyBpbiBldmVyeSBkcml2ZXIuDQo+IA0KPiBCdXQgYXQgdGhl
IGVuZCBkZWNpZGVkIHRvIGp1c3QgZG8gdGhlIGxlc3MgaW50cnVzaXZlIGNoYW5nZSwgYmVj
YXVzZSBjYW4ndA0KPiBkbyBhbnkgdGVzdGluZyBmb3IgbW9zdCBvZiB0aGUgZHJpdmVycy4N
Cj4gDQo+PiByZWdpc3RlcmluZyB3aXRoIHRoZSBkcml2ZXItc3BlY2lmaWMgZW5hYmxlIHBh
cmFtZXRlci4gTWF5YmUgYWRkaW5nIGENCj4+IGRyaXZlci1zcGVjaWZpYyByZWdpc3RlciBm
dW5jdGlvbiB3b3VsZCBtYWtlIHNlbnNlLg0KPj4NCj4gDQo+IElmIEkgdW5kZXJzdG9vZCB5
b3UgY29ycmVjdGx5LCBzdWdnZXN0ZWQgc29tZXRoaW5nIHNpbWlsYXIgaW4gI2RyaS1kZXZl
bCBidXQNCj4gZGFudmV0J3Mgc3VnZ2VzdGlvbiBbMF0gd2FzIHRvIGtlZXAgaXQgc2ltcGxl
Og0KPiANCj4gMTY6MzIgamF2aWVybTogZGFudmV0OiB5ZXMsIEkgZG9uJ3QgdGhpbmsgd2Ug
d291bGQgYmUgYWJsZSB0byBkbyBpdCBhdCB0aGlzIHBvaW50LiBJJ2xsIGFkZCBhIGZ1bmN0
aW9uIHBvaW50ZXINCj4gICAgICAgICAgICAgICAgICAgICAgICAgcGFyYW0gdG8gdGhlIGNo
ZWNrIGZ1bmN0aW9uIHNvIGRyaXZlcnMgY2FuIGFsc28gZGVmaW5lIHRoZWlyIG93biBjaGVj
ayBiZXNpZGVzIG5vbW9kZXNldA0KPiAxNjozMyBkYW52ZXQ6IGphdmllcm0sIHVoIHRoYXQg
c291bmRzIGEgYml0IGxpa2Ugb3ZlcmtpbGw/IGp1c3Qga2VlcCB0aGF0IHBhcnQgb2YgdGhl
IGNoZWNrIGluIGRyaXZlcnM/DQo+IDE2OjMzIGphdmllcm06IGRhbnZldDogT2suIFdhbnRl
ZCB0byBnZXQgcmlkIG9mIHRoZSBkdXBsaWNhdGVkIGNvZGUgYnV0IEknbSBpbmRlZWQgb3Zl
ciBlbmdpbmVlcmluZyB0aGlzIDopDQoNCkFuIGV4dHJhIHBvaW50ZXIgc291bmRzIGluZGVl
ZCBsaWtlIG92ZXItZW5naW5lZXJpbmcuIElmIHdlIHRha2UgYXN0IGZvciANCmV4YW1wbGUs
IEknZCBqdXN0IGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoNCiAgIHN0YXRpYyBhc3RfcGNp
X3JlZ2lzdGVyX2RyaXZlcihzdHJ1Y3QgcGNpX2RyaXZlciAqcGNpKQ0KICAgew0KCWlmIChk
cm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkgJiYgYXN0X21vZGVzZXQgPT0gLTEpDQoJCXJl
dHVybiAtRU5PREVWOw0KCWlmIChhc3RfbW9kZXNldCA9PSAwKQ0KCQlyZXR1cm4gLUVOT0RF
VjsNCg0KCXJldHVybiBwY2lfcmVnaXN0ZXJfZHJpdmVyKHBjaSk7DQogICB9DQoNCiAgIG1v
ZHVsZV9kcml2ZXIoJmFzdF9wY2lfZHJpdmVyLCBhc3RfcGNpX3JlZ2lzdGVyX2RyaXZlciwN
CgkJcGNpX3VucmVnaXN0ZXJfZHJpdmVyKQ0KDQpUaGF0IHJlbW92ZXMgc29tZSBvZiB0aGUg
Ym9pbGVyLXBsYXRlIG1vZHVsZSBjb2RlIHdpdGhvdXQgY2hhbmdpbmcgdGhlIA0KZHJpdmVy
J3MgYmVoYXZpb3IuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFswXTogaHR0
cHM6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35jYnJpbGwvZHJpLWxvZy8/Y2hhbm5lbD1k
cmktZGV2ZWwmZGF0ZT0yMDIxLTExLTAyDQo+IA0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9t
YXMNCj4+DQo+IEJlc3QgcmVnYXJkcywNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------KSFt5G0iXD2T5MGhgvb3pt74--

--------------FUBRZuT557ZUV0zq60QTkWTk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG5sPwFAwAAAAAACgkQlh/E3EQov+A6
4w//RTaGdTp2JblvCPaxRFp2XN7pZ3by30jZPRpL/KURJ68Tctb7qmYq9YpC5VBz4oOh0DgaSXzR
ZemGHH9nawpMlWqEA9I5j6M50SFtTmCeZQuMzoibt6XdL2RW+xk8e7p6BlOGTVfrQ5H7rT2/il8x
eyl9q8M+P9L/+Fv5KYEnFw1b/9lHTqQQ6H4LwBEPqe3B1d6I8FhysoByBbusan2rBOUi4q450liX
4mrVbzWPYRtmDKIuHaEY2PhCUzP7kBk5uy0KbbLXqoo06R4fHZ8A54RrorSCQZo4YRPFVqDhMpGM
AZtzAKeYDeJ86rb5MZmYcW7Q4EqyR1tBngLW8ZGIc2DweVuqLsAYsUmJVQ4E4MZbW8SHY/2xChp1
JpariUEtSMa83UKVkBiLRKY7JIP1MWdZVmJ2P/GWuhzjHERCm5/X+DnUHIRDqTVI8weksY9pgBo/
rC3XMS1FQ4Jyb0XMU+l46lL3t1hwFpQRxIgksPv1XclSmAxGZetNtYCXFJgp3uOdCr2+8ezClEDJ
uhJZE5IML13DQmQ/cP7ScH/kUaa4Gqki2Ix+3zxbI/+P3LK9TD6Y1ft07iYfUrjQHX8nfaDbrVrn
4zNX377kl/Wxr/oPddkzFDrFNu2BSnzJ9awrjNjJrIttziI2fhLuguQ9iFd15LF41R4GH37VVu5w
kg8=
=/Tmz
-----END PGP SIGNATURE-----

--------------FUBRZuT557ZUV0zq60QTkWTk--

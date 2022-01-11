Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C3C48A9E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 09:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3A0113DB2;
	Tue, 11 Jan 2022 08:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10430113DB2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 08:52:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 98259212BC;
 Tue, 11 Jan 2022 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641891145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YdaLao7sQ3hp1ENT2rZBs8PXqqa7MrZLMaEIV3+L2Xg=;
 b=BDstn9Ow4SqDmeTH8JIYqALqmOJbrqtstIvb5BcMVNSs/2RXNdBHphZ5UeWEuf2PxEjxSw
 yI4C1kfimD9nSiitIzkvKBoDp+5XsIjRl/EUpIroQRCgUEp5aLROrIzS4JzgrXwtauPygS
 WjieWG9nI0JugOk27OovFfBdq30UPas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641891145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YdaLao7sQ3hp1ENT2rZBs8PXqqa7MrZLMaEIV3+L2Xg=;
 b=sIkNVIWkxtPOYsf7ynPgvm0ueGFZomFUft1rVquFSLcjVkJfPM2dsJxScR2jJxc10OWY1b
 03kmNKOxM1hlIbAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F066313AC9;
 Tue, 11 Jan 2022 08:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tkCNOUhF3WGCIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 08:52:24 +0000
Message-ID: <1a5bd538-063b-c2cf-bb3e-96a6fdb0da0f@suse.de>
Date: Tue, 11 Jan 2022 09:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 00/10] drm: Make drivers to honour the nomodeset
 parameter
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211222082831.196562-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S57LvTDmYkVbG2Rpo7NPhccF"
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S57LvTDmYkVbG2Rpo7NPhccF
Content-Type: multipart/mixed; boundary="------------iunzZnus0OOvar6uRVQ63mo9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Brian Starkey <brian.starkey@arm.com>, Chen Feng
 <puck.chen@hisilicon.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Fabio Estevam <festevam@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "James (Qian) Wang" <james.qian.wang@arm.com>,
 John Stultz <john.stultz@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Tian Tao <tiantao6@hisilicon.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <1a5bd538-063b-c2cf-bb3e-96a6fdb0da0f@suse.de>
Subject: Re: [PATCH v3 00/10] drm: Make drivers to honour the nomodeset
 parameter
References: <20211222082831.196562-1-javierm@redhat.com>
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>

--------------iunzZnus0OOvar6uRVQ63mo9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KcGF0Y2hlcyA2IHRvIDEwIGFyZQ0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFt
IDIyLjEyLjIxIHVtIDA5OjI4IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0K
PiBUaGUgbm9tb2Rlc2V0IGtlcm5lbCBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIGlzIHVzZWQg
dG8gcHJldmVudCB0aGUgS01TL0RSTQ0KPiBkcml2ZXJzIHRvIGJlIHJlZ2lzdGVyZWQvcHJv
YmVkLiBCdXQgb25seSBhIGZldyBkcml2ZXJzIGltcGxlbWVudCBzdXBwb3J0DQo+IGZvciB0
aGlzIGFuZCBtb3N0IERSTSBkcml2ZXJzIGp1c3QgaWdub3JlIGl0Lg0KPiANCj4gVGhpcyBw
YXRjaCBzZXJpZXMgaXMgYSB2MyB0byBtYWtlIERSTSBkcml2ZXJzIHRvIGhvbm91ciBub21v
ZGVzZXQuIEl0IGlzDQo+IHBvc3RlZCBhcyBzZXBhcmF0ZSBwYXRjaGVzIHRvIG1ha2UgZWFz
aWVyIGZvciBkcml2ZXJzIG1haW50YWluZXJzIHRvIGFjaw0KPiBvciBwaWNrIHRoZW0gaW5k
ZXBlbmRlbnRseSBhdCB0aGVpciBvd24gcGFjZS4NCj4gDQo+IFRoZSBkcm1fbW9kdWxlX3tw
Y2kscGxhdGZvcm19X2RyaXZlcigpIGhlbHBlciBtYWNyb3MgYXJlIGFkZGVkLCB3aGljaCBh
cmUNCj4ganVzdCB3cmFwcGVycyBhcm91bmQgbW9kdWxlX3twY2kscGxhdGZvcm19X2RyaXZl
cigpIGJ1dCBhZGRpbmcgYSBjaGVjayBmb3INCj4gZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25s
eSgpIGFuZCByZXR1cm5pbmcgLUVOT0RFViBpZiB0aGF0IGlzIHRydWUuDQo+IA0KPiBQQ0kg
YW5kIHBsYXRmb3JtIERSTSBkcml2ZXJzIGFyZSB0aGVuIG1vZGlmaWVkIGluIHRoZSBmb2xs
b3dpbmcgcGF0Y2hlcyB0bw0KPiBtYWtlIHVzZSBvZiB0aG9zZSBtYWNyb3MuDQo+IA0KPiBP
bmx5IEtNUyBkcml2ZXJzIHdpbGwgYmUgcG9ydGVkIHRvIHVzZSB0aGVzZSBuZXcgbWFjcm9z
LCBhbmQgb25seSBmb3IgUENJDQo+IGFuZCBwbGF0Zm9ybSBEUk0gZHJpdmVycy4gQSBmb2xs
b3ctdXAgc2VyaWVzIG1pZ2h0IGRvIHRoZSBzYW1lIGZvciBkcml2ZXJzDQo+IHRoYXQgYXJl
IHJlbmRlcmluZy1vbmx5IGFuZCBmb3IgVVNCL1NQSS9JMkMgZGV2aWNlcywgYnV0IGl0IHdp
bGwgbmVlZCBtb3JlDQo+IGRpc2N1c3Npb24gdG8gYWdyZWUgd2hldGhlciB0aGF0J3MgZGVz
aXJhYmxlIG9yIG5vdC4NCj4gDQo+IE5vdCBhbGwgZHJpdmVycyB3ZXJlIHBvc3RlZCBpbiB2
MyB0byBhdm9pZCBmbG9vZGluZyB0aGUgbGlzdCB3aXRoIHRvbyBtYW55DQo+IHBhdGNoZXMu
IEknbSBvbmx5IGluY2x1ZGluZyB0aGUgcGF0Y2hlcyBhZGRpbmcgdGhlIG1hY3JvcyBhbmQg
c29tZSBwYXRjaGVzDQo+IGFzIGFuIGV4YW1wbGUgb2YgdGhlaXIgdXNhZ2UuDQo+IA0KPiBJ
J3ZlIGJ1aWx0IHRlc3RlZCB3aXRoICdtYWtlIGFsbG1vZGNvbmZpZyAmJiBtYWtlIE09ZHJp
dmVycy9ncHUvZHJtJyBidXQgSQ0KPiBkb24ndCBoYXZlIGhhcmR3YXJlIHRvIHRlc3QgdGhl
IGRyaXZlcnMsIHNvIHJldmlldy90ZXN0aW5nIGlzIGFwcHJlY2lhdGVkLg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBKYXZpZXINCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gSW5jbHVk
ZSBUaG9tYXMgWmltbWVybWFubidzIHBhdGNoZXMgaW4gdGhlIHNlcmllcyBhbmQgcmViYXNl
IG9uIHRvcC4NCj4gLSBBZGQgY29sbGVjdGVkIEFja2VkLWJ5IHRhZ3MgZnJvbSB2Mi4NCj4g
DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gQWRkIGRybV9tb2R1bGVfe3BjaSxwbGF0Zm9ybX1f
ZHJpdmVyKCkgbWFjcm9zIGFuZCBwdXQgdGhlIGNoZWNrIHRoZXJlDQo+ICAgIChUaG9tYXMg
WmltbWVybWFubikuDQo+IC0gVXNlIHRoZSBkcm1fbW9kdWxlXypfZHJpdmVyKCkgbWFjcm9z
IGlmIHBvc3NpYmxlIChUaG9tYXMgWmltbWVybWFubikuDQo+IC0gTGVhdmUgdGhlIERSTSBk
cml2ZXJzIHRoYXQgZG9uJ3Qgc2V0IHRoZSBEUklWRVJfTU9ERVNFVCBkcml2ZXIgZmVhdHVy
ZQ0KPiAgICAoTHVjYXMgU3RhY2gpLg0KPiAtIExlYXZlIFVTQi9TUEkvSTJDIGRyaXZlcnMg
YW5kIG9ubHkgaW5jbHVkZSBQQ0kgYW5kIHBsYXRmb3JtIG9uZXMNCj4gICAgKE5vcmFsZiBU
csO4bm5lcykuDQo+IC0gQWRkIGNvbGxlY3RlZCBSZXZpZXdlZC1ieSB0YWdzDQo+IA0KPiBK
YXZpZXIgTWFydGluZXogQ2FuaWxsYXMgKDUpOg0KPiAgICBkcm06IFByb3ZpZGUgcGxhdGZv
cm0gbW9kdWxlLWluaXQgbWFjcm8NCj4gICAgZHJtL2lteC9kY3NzOiBSZXBsYWNlIG1vZHVs
ZSBpbml0aWFsaXphdGlvbiB3aXRoIERSTSBoZWxwZXJzDQo+ICAgIGRybS9rb21lZGE6IFJl
cGxhY2UgbW9kdWxlIGluaXRpYWxpemF0aW9uIHdpdGggRFJNIGhlbHBlcnMNCj4gICAgZHJt
L2FybS9oZGxjZDogUmVwbGFjZSBtb2R1bGUgaW5pdGlhbGl6YXRpb24gd2l0aCBEUk0gaGVs
cGVycw0KPiAgICBkcm0vbWFsaWRwOiBSZXBsYWNlIG1vZHVsZSBpbml0aWFsaXphdGlvbiB3
aXRoIERSTSBoZWxwZXJzDQo+IA0KPiBUaG9tYXMgWmltbWVybWFubiAoNSk6DQo+ICAgIGRy
bTogUHJvdmlkZSBQQ0kgbW9kdWxlLWluaXQgbWFjcm9zDQo+ICAgIGRybS9hc3Q6IFJlcGxh
Y2UgbW9kdWxlLWluaXQgYm9pbGVyLXBsYXRlIGNvZGUgd2l0aCBEUk0gaGVscGVycw0KPiAg
ICBkcm0vYm9jaHM6IFJlcGxhY2UgbW9kdWxlLWluaXQgYm9pbGVyLXBsYXRlIGNvZGUgd2l0
aCBEUk0gaGVscGVycw0KPiAgICBkcm0vY2lycnVzOiBSZXBsYWNlIG1vZHVsZS1pbml0IGJv
aWxlci1wbGF0ZSBjb2RlIHdpdGggRFJNIGhlbHBlcnMNCj4gICAgZHJtL2hpc2lsaWNvbi9o
aWJtYzogUmVwbGFjZSBtb2R1bGUgaW5pdGlhbGl6YXRpb24gd2l0aCBEUk0gaGVscGVycw0K
PiANCj4gICBEb2N1bWVudGF0aW9uL2dwdS9kcm0taW50ZXJuYWxzLnJzdCAgICAgICAgICAg
fCAgIDYgKw0KPiAgIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2
LmMgICB8ICAgMyArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMgICAg
ICAgICAgICAgICB8ICAgMyArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Ry
di5jICAgICAgICAgICAgICB8ICAgMyArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X2Rydi5jICAgICAgICAgICAgICAgICB8ICAxOCArLS0NCj4gICAuLi4vZ3B1L2RybS9oaXNp
bGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jICAgfCAgIDMgKy0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vaW14L2Rjc3MvZGNzcy1kcnYuYyAgICAgICAgICAgfCAgIDMgKy0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vdGlueS9ib2Nocy5jICAgICAgICAgICAgICAgICAgfCAgMjAgKy0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvY2lycnVzLmMgICAgICAgICAgICAgICAgIHwgIDE3
ICstLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9tb2R1bGUuaCAgICAgICAgICAgICAgICAgICAg
ICB8IDEyNSArKysrKysrKysrKysrKysrKysNCj4gICAxMCBmaWxlcyBjaGFuZ2VkLCAxNDcg
aW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvZHJtL2RybV9tb2R1bGUuaA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------iunzZnus0OOvar6uRVQ63mo9--

--------------S57LvTDmYkVbG2Rpo7NPhccF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHdRUgFAwAAAAAACgkQlh/E3EQov+An
yw/+PqLQFIu9LBnng6lhUGfNB5ZqConOgdctjJWhLNtpFI/AHcnly8Qnqqjoo2va2Z7LwDPhOTxZ
avQYDTjyJGTTvMTuTq7PCx+mJdgHIv/xRFN46VX/bmHQBKPgUlz9zW99HZUrIJeliSE5AWmIto15
tfP7yj/1/ABelQGCofNYJIqPqNkxLJ2GedY8SVY0hPQfpR+ZijWEgo65PxkhW82N3qyUJI74+00w
q4UWcP3/jnTo7Ag9jXfjZZRutE5Pl69lcvKAgBZJx8ehXFU9Hpc9DpCoSXpIK/yoKrxECQ8x9e6H
3DNR1ey/wHxRGCPNR+d/OI9ugH2ZtZuW3oXCx4WzEBp8oLSFHLIifreH1y/Fu181cghfnjn+FYHn
PMYhCGZjpOefYEdVCN8FQzbzO4Cgidit5dQYLKkx/YExe8q+d36sA7GODaKCvyg/zEVqrnVf2WjQ
wIxtelo4lyYZQdpX662RB+Fm5qpOBn9G7S4uIOwCBMw7RS3WDmCtFJ3zGe+qlwJzl2Rez1N8VuIU
wbejrZO5lC6VPPOrozFyLHJL2hJJc4q5fODYLnmHpyF3gMNH0rEpR6//DY62y1wY+C2+2NU0P5Bt
ghPKFt/AdTyKdfZXWrxxYeTP3CUUG2/D3hpG7LuVf1HbfrI6on4rL6kqv2fPu/6c0RmMU6HLuR2J
I0I=
=dCKg
-----END PGP SIGNATURE-----

--------------S57LvTDmYkVbG2Rpo7NPhccF--

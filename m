Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68DA666F74
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1C10E8C3;
	Thu, 12 Jan 2023 10:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B6D10E18D;
 Thu, 12 Jan 2023 10:24:16 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 132F437EE5;
 Thu, 12 Jan 2023 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673519054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f1K7S+Dbef2e7Z1LDtP00y2aYmviXeaCNz28skMxcd0=;
 b=Rt4ReSjNAZ2kIhuT2FpCMchcAKd/Ks3eF4fNH91l20U4B3u+4ZzbLIGKWa0LiKwvnvHsma
 pJZzn+vPNFwiSv/ypAjW1m0vwbMeU/3iVXLjKl1LCma4jNLRBTLpGoecP+BNGhA0Y3QL05
 1dmiH5RX42NDq40+xQDlGKpx0J2tCL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673519054;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f1K7S+Dbef2e7Z1LDtP00y2aYmviXeaCNz28skMxcd0=;
 b=MUOnY49z2Xw+4H9qNdyStJflUh9pj2IPxm4Vrpye3I4fiAHhzXZz6rOK888u/oySVzkCau
 q6vr7ti/JgCphzAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EB9A6136AE;
 Thu, 12 Jan 2023 10:24:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +e2SOM3fv2MyMgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 10:24:13 +0000
Message-ID: <8a154783-b433-c9b8-bfe5-286dde1258e9@suse.de>
Date: Thu, 12 Jan 2023 11:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
 <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
 <Y7/Z5dvADG6AspV3@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y7/Z5dvADG6AspV3@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5MxemaYPsZ0zHzCVm084PrOY"
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
--------------5MxemaYPsZ0zHzCVm084PrOY
Content-Type: multipart/mixed; boundary="------------p7AmGwSpjIjIUFsgB9Yy8z0w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <8a154783-b433-c9b8-bfe5-286dde1258e9@suse.de>
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
 <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
 <Y7/Z5dvADG6AspV3@phenom.ffwll.local>
In-Reply-To: <Y7/Z5dvADG6AspV3@phenom.ffwll.local>

--------------p7AmGwSpjIjIUFsgB9Yy8z0w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDEuMjMgdW0gMTA6NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEphbiAxMiwgMjAyMyBhdCAxMDowNDo0OEFNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTEuMDEuMjMgdW0gMTY6NDEgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOg0KPj4+IFRoaXMgb25lIG51a2VzIGFsbCBmcmFtZWJ1ZmZlcnMs
IHdoaWNoIGlzIGEgYml0IG11Y2guIEluIHJlYWxpdHkNCj4+PiBnbWE1MDAgaXMgaWdwdSBh
bmQgbmV2ZXIgc2hpcHBlZCB3aXRoIGFueXRoaW5nIGRpc2NyZXRlLCBzbyB0aGVyZSBzaG91
bGQNCj4+PiBub3QgYmUgYW55IGRpZmZlcmVuY2UuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCj4+PiAtLS0NCj4+
PiAgICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYyB8IDIgKy0NCj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jDQo+Pj4gaW5kZXggY2Q5YzczZjVhNjRhLi45
YjBkYWY5MGRjNTAgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9w
c2JfZHJ2LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYw0K
Pj4+IEBAIC00MjksNyArNDI5LDcgQEAgc3RhdGljIGludCBwc2JfcGNpX3Byb2JlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPj4+
ICAgIAkgKiBUT0RPOiBSZWZhY3RvciBwc2JfZHJpdmVyX2xvYWQoKSB0byBtYXAgdmRjX3Jl
ZyBlYXJsaWVyLiBUaGVuIHdlDQo+Pj4gICAgCSAqICAgICAgIG1pZ2h0IGJlIGFibGUgdG8g
cmVhZCB0aGUgZnJhbWVidWZmZXIgcmFuZ2UgZnJvbSB0aGUgZGV2aWNlLg0KPj4+ICAgIAkg
Ki8NCj4+PiAtCXJldCA9IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKHRydWUs
ICZkcml2ZXIpOw0KPj4+ICsJcmV0ID0gZHJtX2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGlu
Z19wY2lfZnJhbWVidWZmZXJzKHBkZXYsICZkcml2ZXIpOw0KPj4NCj4+IFRoaXMgZG9lcyBu
b3Qgd29yay4gVGhlIGNvbW1lbnQganVzdCBhYm92ZSB0aGUgY2hhbmdlZCBsaW5lIGV4cGxh
aW5zIHdoeS4NCj4+IFRoZSBkZXZpY2UgdXNlcyBzaGFyZWQgbWVtb3J5IHNpbWlsYXIgdG8g
b3RoZXIgaW50ZWdyYXRlZCBJbnRlbCBjaGlwcy4gVGhlDQo+PiBjb25zb2xlIGlzIHNvbWV3
aGVyZSBpbiBhIDE2IE1pQiByYW5nZSwgd2hpY2ggaGFzIGJlZW4gc3RvbGVuIGJ5IHRoZSBC
SU9TDQo+PiBmcm9tIG1haW4gbWVtb3J5LiBUaGVyZSdzIG9ubHkgYSAxIE1pQiBtZW1vcnkg
cmFuZ2Ugb24gdGhlIGRldmljZSB0byBwcm9ncmFtDQo+PiB0aGUgZGV2aWNlLiBVbmxlc3Mg
eW91IHdhbnQgdG8gcmVmYWN0b3IgYXMgZGVzY3JpYmVkLCB0aGlzIGNhbGwgaGFzIHRvIGNv
dmVyDQo+PiB0aGUgd2hvbGUgbWVtb3J5IGZvciBub3cuDQo+IA0KPiBVaC4gU28gaXQncyBt
YXliZSBub3Qgc28gcHJldHR5LCBidXQgd2hhdCBpZiBJIGp1c3QgY2FsbCBib3RoIGZ1bmN0
aW9ucz8NCg0KVGhhdCdzIHdheXMgbW9yZSB1Z2x5IElNSE8uDQoNCj4gVGhhdCB3YXkgd2Ug
Z2V0IHRoZSB2Z2EgaGFuZGxpbmcgdGhyb3VnaCB0aGUgcGNpIG9uZSwgYW5kIHRoZSAibWFr
ZSBzdXJlDQo+IHRoZXJlJ3Mgbm8gZmIgbGVmdCIgdGhyb3VnaCB0aGUgb3RoZXIgb25lLiBQ
bHVzIGNvbW1lbnQgb2YgY291cnNlLg0KPiANCj4gT3RoZXJ3aXNlIHdlJ2QgbmVlZCB0byBz
b21laG93IGtlZXAgdGhlIHZnYSBzdHVmZiBpbiB0aGUgbm9uLXBjaSBwYXRocywNCj4gYW5k
IHRoYXQganVzdCBmZWVscyBhbGwga2luZHMgb2Ygd3JvbmcgdG8gbWUuDQoNCldpdGggeW91
ciBwYXRjaCBhcHBsaWVkLCBhcGVydHVyZV9kZXRhY2hfZGV2aWNlcygpIGRvZXMgYWxsIHRo
ZSB3b3JrIG9mIA0KcmVtb3ZpbmcuIEknZCBhZGQgdGhlIGZvbGxvd2luZyBpbnRlcm5hbCBm
dW5jdGlvbnM6DQoNCnN0YXRpYyB2b2lkIGFwZXJ0dXJlX2RldGFjaF9oZWFkKGJvb2wgaXNf
cHJpbWFyeSkNCnsNCgkvKg0KCSAqIGxlbmd0aHkgY29tbWVudCBoZXJlDQoJICovDQoJaWYg
KGlzX3ByaW1hcnkpDQoJCXN5c2ZiX2Rpc2FibGUoKQ0KfQ0KDQpzdGF0aWMgdm9pZCBhcGVy
dHVyZV9kZXRhY2hfdGFpbChib29sIHJlbW92ZV92Z2EpDQp7DQoJaWYgKHJlbW92ZV92Z2Ep
IHsNCgkJYXBlcnR1cmVfZGV0YWNoX2RldmljZXMoVkdBX1BIWVNfKQ0KCQl2Z2FfcmVtb3Zl
X3ZnYWNvbigpDQoJfQ0KfQ0KDQpBbmQgY2FsbCBib3RoIG9mIHRoZW0gYXQgdGhlIGJlZ2lu
bmluZy9lbmQgb2YgDQphcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNlcygpIGFu
ZCANCmFwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcygpLg0KDQpZb3Un
ZCBzdGlsbCBuZWVkIHRvIHByaW1hcnkgYXJndW1lbnQgdG8gDQphcGVydHVyZV9yZW1vdmVf
Y29uZmxpY3RpbmdfZGV2aWNlcygpLCBidXQgdGhlcmUgd2lsbCBiZSBubyBjb2RlIA0KZHVw
bGljYXRpb24gd2l0aCB0aGUgYXBlcnR1cmUgaGVscGVycyBhbmQgdGhlIHB1cnBvc2Ugb2Yg
ZWFjaCBjb2RlIA0KZnJhZ21lbnQgd2lsbCBiZSBjbGVhcmVyLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IC1EYW5pZWwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------p7AmGwSpjIjIUFsgB9Yy8z0w--

--------------5MxemaYPsZ0zHzCVm084PrOY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO/380FAwAAAAAACgkQlh/E3EQov+Cj
iw/9FxhqllgjdEiRBeEtQe3EhqBrwDvigdMou3soOuZRFCN2cDxAQxarBqxawulW8SigwmeRe6Fs
MQzOhwghtWFYHH6w+Lz573MI97e+i+3uRWmV3/rHDaOzW7uAUz3bxBF4SrXm5eQ87t9SI76DXU0K
2FHZ4QPNlaKlqLGXQ+Dbb2sc71Om04FZKjp48/Gat7PTMSLKwieKRMJh5qS0BOaRoT9JVKqHV59l
ufRk2bHLR4Hv6yErDdgVKcxrjW9/dAIJ+47DuqXQchUzJCxOTMXbhtoOoLkwbwQ7Kjaa+sB8ruyk
5CB/6PccioaNHEtMtTNNJcTSjMo6ow38gTzsKbTiHin/LDBU1WUM8SkjG+rzceiU3jF4nI2prD8B
NTfiYL1FBmpL30LSPBVNFuRyVev21E7QYHHdENRrprsmGQ+oZ5XXmDNM/DE01JAbH27o2RpBlaru
121azvtF072Q2rGtVu9otjmpYAhDRBCblBxJf9SBRl1xXxuSVqs2cKP5CIPzZDf3q/u4o2vA3bZP
qYpLDfp2jZ9FyWhXxkXSDnHa6ic7wZN3lHlWjYdqX6NUMiUfFAVQK67UVFv0LUj/LQxbjEU8MrZ4
pef2+44LScL3lR+OMNCF68Qh6JKdouHef8NWIsmQK7re/u9+aobzE3/RW3b8dpSi+Bihel5rONNQ
PgI=
=r/TG
-----END PGP SIGNATURE-----

--------------5MxemaYPsZ0zHzCVm084PrOY--

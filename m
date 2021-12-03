Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE091467427
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 10:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB84C73C09;
	Fri,  3 Dec 2021 09:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBB073C08
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 09:35:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 39311212CA;
 Fri,  3 Dec 2021 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638524105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zSNfU4icadvzlJZjRyXS0VEcChBgb89lhRgthpyYGgY=;
 b=dM5+f3wlSvrdMD+GpAxow3dRuc4Zl8WeliQrEIXA1KlDYipjZyS8ej+wjmgYiL1kGI3Ca3
 tfnW0cdf/iYt8lTDgFxsRs3pY1k7ceHUhKRjvO+MaeKgWIt5ptBjM7Be4UlSSlrNSKDbza
 +0DwPMbx9zYC3enOI+tpU82DG0PS+Ps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638524105;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zSNfU4icadvzlJZjRyXS0VEcChBgb89lhRgthpyYGgY=;
 b=hpukj8e0tA3G99BFC9+LNoGYrI5b9LMUE8dDeHm5v2hsDDBlhIkrSUNEaOv62AmnJ0Hprq
 +evZ2nqCnQsin6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F294713D9E;
 Fri,  3 Dec 2021 09:35:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OvFPOsjkqWHtdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 03 Dec 2021 09:35:04 +0000
Message-ID: <7469e918-b2bf-00a9-1bbc-2f3514ec0816@suse.de>
Date: Fri, 3 Dec 2021 10:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/stm: remove conflicting framebuffers
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211203085512.11127-1-yannick.fertre@foss.st.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211203085512.11127-1-yannick.fertre@foss.st.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DFU8K9UBXjQ1FZY83MRcWDwj"
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
--------------DFU8K9UBXjQ1FZY83MRcWDwj
Content-Type: multipart/mixed; boundary="------------pJVY4Pdtym1G0TkQl2dh1mDd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <7469e918-b2bf-00a9-1bbc-2f3514ec0816@suse.de>
Subject: Re: [PATCH] drm/stm: remove conflicting framebuffers
References: <20211203085512.11127-1-yannick.fertre@foss.st.com>
In-Reply-To: <20211203085512.11127-1-yannick.fertre@foss.st.com>

--------------pJVY4Pdtym1G0TkQl2dh1mDd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTIuMjEgdW0gMDk6NTUgc2NocmllYiBZYW5uaWNrIEZlcnRyZToNCj4g
SW4gY2FzZSBvZiB1c2luZyBzaW1wbGVmYiBvciBhbm90aGVyIGNvbmZsaWN0aW5nIGZyYW1l
YnVmZmVyLA0KPiBjYWxsIGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKCkgdG8g
cmVtb3ZlIG1lbW9yeSBhbGxvY2F0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNr
IEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9zdG0vZHJ2LmMgfCA1ICsrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0v
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jDQo+IGluZGV4IDIyMjg2OWIyMzJh
ZS4uNWJhNDZmNzBmMDgxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Ry
di5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMNCj4gQEAgLTE0LDYgKzE0
LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiAgIA0KPiArI2luY2x1ZGUgPGRybS9kcm1fYXBl
cnR1cmUuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4NCj4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2
Lmg+DQo+IEBAIC0xOTMsNiArMTk0LDEwIEBAIHN0YXRpYyBpbnQgc3RtX2RybV9wbGF0Zm9y
bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIAlpZiAocmV0KQ0K
PiAgIAkJZ290byBlcnJfcHV0Ow0KPiAgIA0KPiArCXJldCA9IGRybV9hcGVydHVyZV9yZW1v
dmVfZnJhbWVidWZmZXJzKGZhbHNlLCAmZHJ2X2RyaXZlcik7DQo+ICsJaWYgKHJldCkNCj4g
KwkJZ290byBlcnJfcHV0Ow0KPiArDQoNClRoaXMgaGFzIHRvIGJlIGRvbmUgYXQgdGhlIHZl
cnkgdG9wIG9mIHRoZSBwcm9iZSBmdW5jdGlvbiwgYmVmb3JlIA0KYW55dGhpbmcgdGhhdCB0
b3VjaGVzIHRoZSBkZXZpY2UuIE90aGVyd2lzZSBib3RoIGRyaXZlcnMgaW50ZXJmZXJlIHdp
dGggDQplYWNoIG90aGVyIHdoaWxlIHByb2JpbmcgYW5kIHNldHVwJ3MgZ29pbmcgb24uDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICAJcmV0ID0gZHJtX2Rldl9yZWdpc3Rlcihk
ZGV2LCAwKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCWdvdG8gZXJyX3B1dDsNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------pJVY4Pdtym1G0TkQl2dh1mDd--

--------------DFU8K9UBXjQ1FZY83MRcWDwj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGp5MgFAwAAAAAACgkQlh/E3EQov+CH
hRAAkBBbTnUmmdwnR9pxdbyvR9gSBtupKiVfslYcPCmUGEexHF/W1mzBhWu9BrnlXr9fV0F4xgW3
QKpNXnYyj5aXCOxS9XOduXKVgcjswwQ69/CbxzBfHYBmxUJuq4xgOvYksHRJgeXo/KP/vUB6htOx
ogdsxOQSPMKn/z8VRPpAjCMPUIpD2QX/x/Q4DtaiKEUtb9F4pYsNg/gJrrNPnojauMByTPbl+avJ
qR/Fov+BVBf785qEkaLWpqkcjD24x7uVMEsiQ8km9rTMObXiFG9rcZSMjiVhP3Y2tupxPIyrU6zZ
VbVC3Pj5l9MlqifTiwm5E6RBLkzL/N2RTVxuZ/CA+p5Llt3mZReeMFosoZlBjcaJa+l8DILhlYyZ
iPyyY4FC0Ta4rWWPaheQxIhwKogL0CqgKOyWmba0inH7dIpBXTvczi9TBhugp3G7bt3BpiI5q1qu
QXqpFBJ1j0qdpi8re5u4jTmyjjUCUNcxTskCUkZykmioyIcfgaqyZ8L0tUd3mFg3MsQVHe4dmEwq
GN7Q6IC59Xeqi4WZdlnPnEaoTXopZaTDOVusKxjca8AmLTY962fOPUZHSdgP3BvdGML39/0wbapd
MOUCg4sZXlICLp2tjtLuD4ZncksM80aRP/UagdZtZz8jGn35X2sauQvUWy+zvDTukO7B+cGW9TQQ
G2k=
=rwiW
-----END PGP SIGNATURE-----

--------------DFU8K9UBXjQ1FZY83MRcWDwj--

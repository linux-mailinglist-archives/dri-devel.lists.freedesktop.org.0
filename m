Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3BB62F5D9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1412510E737;
	Fri, 18 Nov 2022 13:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ADF10E737
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:22:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17D6C1FA4A;
 Fri, 18 Nov 2022 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668777742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KSFeZZcQcmOphqHP4wAHfaw5Qgs+WGe8vO8FoC897Q=;
 b=W9igDoPojmJMnHeEcFHVuJyFpEXL9nn+6yPXKk/IgQQBwlvRBqBOPe2KmhTa6Hz3LD2ynq
 fuCng2+Or5hnd5BimnXn7rPN8vAWI3omPmz3Df+oA6l6VQtNGdf87cYS7uQvXAp9eS+0g4
 MzUzGmoJFOUTyw6y+O3b69EiHZejB5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668777742;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KSFeZZcQcmOphqHP4wAHfaw5Qgs+WGe8vO8FoC897Q=;
 b=TbL3mM/OR3uzZJnetBuemXorykqfNODCyWS4crjA7H9LcSpTUcfyhhnDCYr+BNovWcmX0B
 Zy3omPfov2NLToCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C94FB13A66;
 Fri, 18 Nov 2022 13:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f1BMMA2Hd2OnJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 13:22:21 +0000
Message-ID: <10c809cb-2ea9-273c-bfd2-a267e6219f22@suse.de>
Date: Fri, 18 Nov 2022 14:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-3-tzimmermann@suse.de>
 <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pC07C59nTw9ATfbYYbKgTzXm"
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pC07C59nTw9ATfbYYbKgTzXm
Content-Type: multipart/mixed; boundary="------------wgxeQ0Y9p012UoklBJ4bWcxk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <10c809cb-2ea9-273c-bfd2-a267e6219f22@suse.de>
Subject: Re: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-3-tzimmermann@suse.de>
 <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
In-Reply-To: <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>

--------------wgxeQ0Y9p012UoklBJ4bWcxk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTEuMjIgdW0gMTQ6MDggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDExLzE2LzIyIDE3OjA5LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IExvZ2ljdmMgY2FuIGhhdmUgZGlmZmVyZW50IHZhbHVlcyBmb3IgdGhlIHByZWZlcnJl
ZCBjb2xvciBkZXB0aC4gU2V0DQo+PiB0aGUgZmJkZXYgYnBwIHZhbHVlIGRlcGVuZGluZyBv
biB0aGUgcnVudGltZSB2YWx1ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vbG9naWN2Yy9sb2dpY3ZjX2RybS5jIHwgMTQgKysrKysrKysrKysrKy0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19kcm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2ljdmNfZHJtLmMNCj4+IGluZGV4IDlkZTI0
ZDlmMGM5NjMuLmQ5Y2Q1ZDk2N2UzMWYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbG9naWN2Yy9sb2dpY3ZjX2RybS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbG9n
aWN2Yy9sb2dpY3ZjX2RybS5jDQo+PiBAQCAtMzAxLDYgKzMwMSw3IEBAIHN0YXRpYyBpbnQg
bG9naWN2Y19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAg
CXN0cnVjdCByZWdtYXAgKnJlZ21hcCA9IE5VTEw7DQo+PiAgIAlzdHJ1Y3QgcmVzb3VyY2Ug
cmVzOw0KPj4gICAJdm9pZCBfX2lvbWVtICpiYXNlOw0KPj4gKwl1bnNpZ25lZCBpbnQgcHJl
ZmVycmVkX2JwcDsNCj4+ICAgCWludCBpcnE7DQo+PiAgIAlpbnQgcmV0Ow0KPj4gICANCj4+
IEBAIC00MzgsNyArNDM5LDE4IEBAIHN0YXRpYyBpbnQgbG9naWN2Y19kcm1fcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgCQlnb3RvIGVycm9yX21vZGU7DQo+
PiAgIAl9DQo+PiAgIA0KPj4gLQlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkcm1fZGV2LCBk
cm1fZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGgpOw0KPj4gKwlzd2l0Y2ggKGRy
bV9kZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCkgew0KPj4gKwljYXNlIDE1Og0K
PiANCj4gV2h5IGNvdWxkIGhhdmUgMTU/IElJVUMgdGhlIGZvcm1hdHMgc3VwcG9ydGVkIGJ5
IHRoaXMgZHJpdmVyIGFyZToNCj4gDQo+IHN0YXRpYyB1aW50MzJfdCBsb2dpY3ZjX2xheWVy
X2Zvcm1hdHNfcmdiMTZbXSA9IHsNCj4gCURSTV9GT1JNQVRfUkdCNTY1LA0KPiAJRFJNX0ZP
Uk1BVF9CR1I1NjUsDQo+IAlEUk1fRk9STUFUX0lOVkFMSUQsDQo+IH07DQo+IA0KPiBzdGF0
aWMgdWludDMyX3QgbG9naWN2Y19sYXllcl9mb3JtYXRzX3JnYjI0W10gPSB7DQo+IAlEUk1f
Rk9STUFUX1hSR0I4ODg4LA0KPiAJRFJNX0ZPUk1BVF9YQkdSODg4OCwNCj4gCURSTV9GT1JN
QVRfSU5WQUxJRCwNCj4gfTsNCj4gDQo+IC8qDQo+ICAgKiBXaGF0IHdlIGNhbGwgZGVwdGgg
aW4gdGhpcyBkcml2ZXIgb25seSBjb3VudHMgY29sb3IgY29tcG9uZW50cywgbm90IGFscGhh
Lg0KPiAgICogVGhpcyBhbGxvd3MgdXMgdG8gc3RheSBjb21wYXRpYmxlIHdpdGggdGhlIExv
Z2lDVkMgYmlzdHJlYW0gZGVmaW5pdGlvbnMuDQo+ICAgKi8NCj4gc3RhdGljIHVpbnQzMl90
IGxvZ2ljdmNfbGF5ZXJfZm9ybWF0c19yZ2IyNF9hbHBoYVtdID0gew0KPiAJRFJNX0ZPUk1B
VF9BUkdCODg4OCwNCj4gCURSTV9GT1JNQVRfQUJHUjg4ODgsDQo+IAlEUk1fRk9STUFUX0lO
VkFMSUQsDQo+IH07DQo+IA0KPiBTbyBzaG91bGRuJ3QgYmUganVzdCAxNiwgMjQgYW5kIDMy
ID8NCg0KVGhhdCBtYWtlcyBzZW5zZS4NCg0KPiANCj4+ICsJY2FzZSAxNjoNCj4+ICsJCXBy
ZWZlcnJlZF9icHAgPSAxNjsNCj4+ICsJCWJyZWFrOw0KPj4gKwljYXNlIDI0Og0KPj4gKwlj
YXNlIDMyOg0KPj4gKwlkZWZhdWx0Og0KPj4gKwkJcHJlZmVycmVkX2JwcCA9IDMyOw0KPj4g
KwkJYnJlYWs7DQo+IA0KPiBJJ20gYWxzbyBub3Qgc3VyZSBpZiB0aGlzIGlzIG5lZWRlZC4g
U2luY2UgSUlVQyBpbiBsb2dpY3ZjX21vZGVfaW5pdCgpIHRoZQ0KPiBkcml2ZXIgZG9lczoN
Cj4gDQo+IAlwcmVmZXJyZWRfZGVwdGggPSBsYXllcl9wcmltYXJ5LT5mb3JtYXRzLT5kZXB0
aDsNCj4gDQo+IAkvKiBEUk0gY291bnRzIGFscGhhIGluIGRlcHRoLCBvdXIgZHJpdmVyIGRv
ZXNuJ3QuICovDQo+IAlpZiAobGF5ZXJfcHJpbWFyeS0+Zm9ybWF0cy0+YWxwaGEpDQo+IAkJ
cHJlZmVycmVkX2RlcHRoICs9IDg7DQo+IA0KPiAJLi4uDQo+IAltb2RlX2NvbmZpZy0+cHJl
ZmVycmVkX2RlcHRoID0gcHJlZmVycmVkX2RlcHRoOw0KPiANCj4gU28gaXQgc2VlbXMgdGhp
cyBwYXRjaCBpcyBub3QgbmVlZGVkPyBVbmxlc3MgSSdtIG1pc3VuZGVyc3RhbmRpbmcgdGhl
IGNvZGUuDQoNClRoZSBkcml2ZXIgdXNlcyBYUkdCODg4OCwgc28gdGhlIDI0LWJpdCBjb2xv
ciBkZXB0aCBoYXMgYSAzMi1iaXQgYnBwIA0KdmFsdWUuIEhlbmNlIHRoZSBzd2l0Y2guDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------wgxeQ0Y9p012UoklBJ4bWcxk--

--------------pC07C59nTw9ATfbYYbKgTzXm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3hw0FAwAAAAAACgkQlh/E3EQov+CJ
SA//c2J0S0au0WQJ+0NrtSwe0Ro6Rrgxegju5qqvLVlzXMZ3lbHq5KlQDBn3ObHrEyu7IDcxZFpj
WfSayjS/Uso8HXQKmrz+QDe+qhk3SyeiG8WAOK50T8xh93a7QeiXaWM0XYkXtGRLJkI+AJh8pMFJ
fZnsLG104pW7s5adaEnimmu6pvYs2BhUQFsazTN4d/dISSWyNEl+BkFdbEiotB+YYMAMocI5Zkdy
j207IVGEDX/GFO2HYOmHmZ3qB0hX6c3Rr3eXot9fdmah5JO9Dv+L9tPCZKsH/IVDAquGETWGDFa7
VI+B1i8L7F7ZqtYKGK8upmUsxZ+vsmIsMJxnmXoBYECp/hSXzmPYRMSh01+3e6JgfXrE4F/OMpAE
BYMt4ZTzmTEy2ua0d5jbXFuw0hPQeAmCK4Z4ZVYM+FI58dC0fwDKO0CqgwCKCbjgQMwnmRrOO4H+
hj0z7jFa+TqupUvW85Hl8EBSj3AupjZBsH9EULUn0/A2A/Eo9pvFeAHTq7JzaRTgcKaIwwhteFWv
JxtoZeMIZZRJxXtC2YzeXrOjzhEml1TnU8p5kvhGJtlLj3Pq1h03kLwfm4h2bpczHj+uNkwJtEEE
fV54dcMV7KsgkC1vnmcsY5rWbKfVrNDTQuBx+KkAxyAa4n96TNnUxRiis/3uXF9+CA5Orjgas5Pa
HXI=
=I4A7
-----END PGP SIGNATURE-----

--------------pC07C59nTw9ATfbYYbKgTzXm--

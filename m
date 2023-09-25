Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855227AD6F9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 13:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB2710E176;
	Mon, 25 Sep 2023 11:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9816210E176
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 11:28:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D6E421853;
 Mon, 25 Sep 2023 11:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695641329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qu940DjXqKMZcoGUA4iGNheXJEiCeKPz/Uc1UaaJNmU=;
 b=OaXupLG5WuKcUz1XaZFhW9aBaSG276Pe8U6/W63ga2kbgPXpvN5EDy3p9laRezgBqMXsQX
 dqFZ8VgFSX8HM/7P5JpSWLLHdoeOwHcryPortdYWqA400GXw/4QXHMZSjtyBTjssvzxqHM
 XwpeowVE8zMsMoWNl/wd7IVLQ+JYS3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695641329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qu940DjXqKMZcoGUA4iGNheXJEiCeKPz/Uc1UaaJNmU=;
 b=pOJ+A8+uZTuc2NnSPPFSY6hKOiy6OAzoNpIk41WF3tMCEwVtU2vqk9n5OaTeGF9W3w6yfC
 36ewYTAWpdXSmfCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEF151358F;
 Mon, 25 Sep 2023 11:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id itnrOPBuEWV9SQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Sep 2023 11:28:48 +0000
Message-ID: <e81bfc6a-7d14-429a-88bc-3f53ac6a2858@suse.de>
Date: Mon, 25 Sep 2023 13:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sh: ecovec24: Rename missed backlight field from fbdev to
 dev
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Thompson <daniel.thompson@linaro.org>
References: <20230925111022.3626362-1-geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20230925111022.3626362-1-geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rtnW0y2YctxiLg3D48klbWpd"
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
Cc: kernel test robot <lkp@intel.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rtnW0y2YctxiLg3D48klbWpd
Content-Type: multipart/mixed; boundary="------------794h0679uA5ATzYq0AM5oz9Q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Thompson <daniel.thompson@linaro.org>
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Message-ID: <e81bfc6a-7d14-429a-88bc-3f53ac6a2858@suse.de>
Subject: Re: [PATCH] sh: ecovec24: Rename missed backlight field from fbdev to
 dev
References: <20230925111022.3626362-1-geert+renesas@glider.be>
In-Reply-To: <20230925111022.3626362-1-geert+renesas@glider.be>

--------------794h0679uA5ATzYq0AM5oz9Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDkuMjMgdW0gMTM6MTAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IE9uZSBpbnN0YW5jZSBvZiBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhLmZiZGV2
IHdhcyByZW5hbWVkLCBidXQgdGhlDQo+IHNlY29uZCBpbnN0YW5jZSB3YXMgZm9yZ290dGVu
LCBjYXVzaW5nIGEgYnVpbGQgZmFpbHVyZToNCj4gDQo+ICAgICAgYXJjaC9zaC9ib2FyZHMv
bWFjaC1lY292ZWMyNC9zZXR1cC5jOiBJbiBmdW5jdGlvbiDigJhhcmNoX3NldHVw4oCZOg0K
PiAgICAgIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYzoxMjIzOjM3OiBl
cnJvcjog4oCYc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGHigJkgaGFzIG5v
IG1lbWJlciBuYW1lZCDigJhmYmRlduKAmTsgZGlkIHlvdSBtZWFuIOKAmGRlduKAmT8NCj4g
ICAgICAgMTIyMyB8ICAgICAgICAgICAgICAgICBncGlvX2JhY2tsaWdodF9kYXRhLmZiZGV2
ID0gTlVMTDsNCj4gCSAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fg0KPiAJICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldg0K
PiANCj4gRml4IHRoaXMgYnkgdXBkYXRpbmcgdGhlIHNlY29uZCBpbnN0YW5jZS4NCj4gDQo+
IEZpeGVzOiBlZDM2OWRlZjkxYzE1NzlhICgiYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0OiBS
ZW5hbWUgZmllbGQgJ2ZiZGV2JyB0byAnZGV2JyIpDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwOTIzMTYwMS5VdTZxY1JuVS1sa3BAaW50ZWwu
Y29tLw0KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQoNClNvcnJ5IGZvciBtaXNzaW5nIHRoaXMgZHJpdmVyIGluIHRoZSBv
cmlnaW5hbCBwYXRjaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4gICBh
cmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMgfCAyICstDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jIGIvYXJjaC9zaC9i
b2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jDQo+IGluZGV4IDNiZTI5MzMzNWRlNTQ1MTIu
LjdhNzg4ZDQ0Y2M3MzQ5NmMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvc2gvYm9hcmRzL21hY2gt
ZWNvdmVjMjQvc2V0dXAuYw0KPiArKysgYi9hcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0
L3NldHVwLmMNCj4gQEAgLTEyMjAsNyArMTIyMCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFy
Y2hfc2V0dXAodm9pZCkNCj4gICAJCWxjZGNfaW5mby5jaFswXS5udW1fbW9kZXMJCT0gQVJS
QVlfU0laRShlY292ZWNfZHZpX21vZGVzKTsNCj4gICANCj4gICAJCS8qIE5vIGJhY2tsaWdo
dCAqLw0KPiAtCQlncGlvX2JhY2tsaWdodF9kYXRhLmZiZGV2ID0gTlVMTDsNCj4gKwkJZ3Bp
b19iYWNrbGlnaHRfZGF0YS5kZXYgPSBOVUxMOw0KPiAgIA0KPiAgIAkJZ3Bpb19zZXRfdmFs
dWUoR1BJT19QVEEyLCAxKTsNCj4gICAJCWdwaW9fc2V0X3ZhbHVlKEdQSU9fUFRVMSwgMSk7
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2Ug
MTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBN
eWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcg
TnVlcm5iZXJnKQ0K

--------------794h0679uA5ATzYq0AM5oz9Q--

--------------rtnW0y2YctxiLg3D48klbWpd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmURbvAFAwAAAAAACgkQlh/E3EQov+BU
+w//UJCGLDzhsQtidhuNeeelP2BPDsVyROWV87SiW69cXKWAiSFeEBdoHsorvyVusPGoyXdL6+xt
X6bgSHHhTyAhgrlGpXYT2Qh189eSDgMQNqSw5xDOU2YYaUFIUbA0jBaWy5PLZLYmMbkUP4yGRR8c
8qHrZYNzDFhSi9O88uGC4S3suWblE7EHP6AO/ZdSEvFv1ppbu8/GeN8Bbq9vvLd7zVLNlSUCszN6
tn5gaPN+l/Qp81YHh/SLLxos2B7D3YcEGB/4omCWuU3fxvQGP7TxS9lc8SJjBuTmzoL6mGtqsfIN
H7XaGhTBuKGGrPbbeXaGMyE8pSfKZHPhgdl7TrmjdBDgNO9y0f0ho8Z/jzR2S02Bhm8KWp9EzxAc
BqJ+CuHCBNxlAV2XOG0D9oen4khFVX9cZRA0ptfswH7RIyWtNQ5iYr+3BlJn0St/ppsaEC/SoUP0
f+a92zj8Zti9cX3lzJsaTHcaNtQlxwnz13gv6mfNNkgSHHEf/siBM/dx048oR63hOetSKoytRKcc
bfS8Ddv4pcbfeCO/c35RTEbbLrc+KjbmiESSqOl7R/cbLjKu0IzvjLJGd8v12HuUlwasOiSF4ugK
2YPao5G12RshvUF5lwsQMqmQ/49otXdskDQlAC7CvXpctTAet29OkIMs3rMUphHrsI/tphPs+sau
T6E=
=C/7O
-----END PGP SIGNATURE-----

--------------rtnW0y2YctxiLg3D48klbWpd--

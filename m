Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A47F9C58
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 10:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C1710E1F1;
	Mon, 27 Nov 2023 09:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D78A10E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:05:56 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BBC02028A;
 Mon, 27 Nov 2023 09:05:54 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F048132A6;
 Mon, 27 Nov 2023 09:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id f38ECvJbZGXEZQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 09:05:54 +0000
Message-ID: <31000e40-61a2-46df-b3cc-b6e08a5c63b8@suse.de>
Date: Mon, 27 Nov 2023 10:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mxsfb: Switch to drmm_mode_config_init
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20231125222536.97769-1-marex@denx.de>
Content-Language: en-US
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
In-Reply-To: <20231125222536.97769-1-marex@denx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aUB8G0f35ZGBfDKyXK7wKd3u"
X-Spamd-Bar: +++++
X-Spam-Score: 5.11
X-Rspamd-Server: rspamd1
X-Spam-Level: *****
X-Rspamd-Queue-Id: 6BBC02028A
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de; dkim=none;
 dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de
 (policy=none); 
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de
X-Spamd-Result: default: False [5.11 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-0.16)[-0.158];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_SPAM_SHORT(2.97)[0.989];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aUB8G0f35ZGBfDKyXK7wKd3u
Content-Type: multipart/mixed; boundary="------------pwEQBhnFtkrQqhiROqD0m4qp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <31000e40-61a2-46df-b3cc-b6e08a5c63b8@suse.de>
Subject: Re: [PATCH] drm/mxsfb: Switch to drmm_mode_config_init
References: <20231125222536.97769-1-marex@denx.de>
In-Reply-To: <20231125222536.97769-1-marex@denx.de>

--------------pwEQBhnFtkrQqhiROqD0m4qp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMTEuMjMgdW0gMjM6MjUgc2NocmllYiBNYXJlayBWYXN1dDoNCj4gU3dp
dGNoIGZyb20gZGVwcmVjYXRlZCB1bm1hbmFnZWQgZHJtX21vZGVfY29uZmlnX2luaXQoKSB0
bw0KPiBtYW5hZ2VkIGRybW1fbW9kZV9jb25maWdfaW5pdCgpLiBObyBmdW5jdGlvbmFsIGNo
YW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRl
Pg0KPiAtLS0NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+IENjOiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJp
cGFyZEBrZXJuZWwub3JnPg0KPiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAu
Y29tPg0KPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25p
eC5kZT4NCj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4g
Q2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4gQ2M6IFN0ZWZhbiBBZ25l
ciA8c3RlZmFuQGFnbmVyLmNoPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgNiArKysrKy0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL214c2ZiL214c2ZiX2Rydi5jDQo+IGluZGV4IDNiZmEzNjliMjUwN2UuLjlmNzQ2
ODUyYjhmZjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9k
cnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMNCj4gQEAg
LTI0OCw3ICsyNDgsMTEgQEAgc3RhdGljIGludCBteHNmYl9sb2FkKHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0sDQo+ICAgCXBtX3J1bnRpbWVfZW5hYmxlKGRybS0+ZGV2KTsNCj4gICANCj4g
ICAJLyogTW9kZXNldCBpbml0ICovDQo+IC0JZHJtX21vZGVfY29uZmlnX2luaXQoZHJtKTsN
Cg0KVGhlIGNvcnJlc3BvbmRpbmcgY2FsbCB0byBkcm1fbW9kZV9jb25maWdfY2xlYW51cCgp
IG5lZWRzIHRvIGJlIHJlbW92ZWQgDQphcyB3ZWxsLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+ICsJcmV0ID0gZHJtbV9tb2RlX2NvbmZpZ19pbml0KGRybSk7DQo+ICsJaWYgKHJl
dCkgew0KPiArCQlkZXZfZXJyKGRybS0+ZGV2LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgbW9k
ZSBjb25maWdcbiIpOw0KPiArCQlnb3RvIGVycl92Ymxhbms7DQo+ICsJfQ0KPiAgIA0KPiAg
IAlyZXQgPSBteHNmYl9rbXNfaW5pdChteHNmYik7DQo+ICAgCWlmIChyZXQgPCAwKSB7DQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------pwEQBhnFtkrQqhiROqD0m4qp--

--------------aUB8G0f35ZGBfDKyXK7wKd3u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVkW/EFAwAAAAAACgkQlh/E3EQov+A9
zg//QUPYMb7ZzW07Bj6bGXrFBlskFFywHK1m9gvn8leiN7W88h9ITtT5274G/BVOHH43pVRndADq
DhyYf2yrbTrQMgu1uEfUTWSCVbTJ6S5rqBVNs/F2zmTEWIgLucLz3JaNoDLK+G10qeKslHbiQqsC
33NaIJsWg9zUPigXbuavD71qqRXl/nPM75vLT4EKoqJ2yxtgLGSbP9P1TpCUdsFirtTfvx0/faby
fcgHQfs4AIkPOk44skGhbmZzcp06XdCcHSdDkT+4ZsYiW5tqXpPdx6BNFarKsHIHLG+i6xsF9MbS
9T0v/614yTA6w2XPDAdKiIm8PyyBETioA2BgAHygalsjImZNxyYGtZepyLhvrOrVJHa2m/eNPBbW
n1wJU+rLsnKsVpdk0sU3E5AJTdM/EjzaYiy9ohT3euZ/patMo7q3eOFq0lS2PymSKvIllRo1OSbs
fSL3DsiKzbH5CvSB2GeNC9enfGGfIcI+eTl/xAWFBYb/cScTQA93x8DklPxeckas05QAyDqQmkq5
jfUpFMTIRXg7j5rRiN1mMWvMCQbH80Tv5QAobjvw5ztChFckziXS1EJ8Jx/RG7kD3sFYNm8NoT24
X3H0GDvrdeanweP8DIthC8gNOmkrxbNwG//4FEKjqDnXaoewLmPQtmjz9m83kBwacZOVGtd/nkT/
2dw=
=xqrI
-----END PGP SIGNATURE-----

--------------aUB8G0f35ZGBfDKyXK7wKd3u--

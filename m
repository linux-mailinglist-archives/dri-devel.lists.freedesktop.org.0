Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E97009FD
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 16:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF5F10E6CD;
	Fri, 12 May 2023 14:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0242510E6CD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 14:11:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B7A722A39;
 Fri, 12 May 2023 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683900709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydLEuMH6Q4HTzouXEzh3ffWo7WbVbxJ/YWBzl41PxpY=;
 b=w0yt1+s3s/8FUJlxXYilfrMNocOVsIoI/0vp2q6a6YFw69wiSJDzOReE5/CFHsRfqdsFjK
 Xo4bqi9kZj4Lt774pCSsebcb/jZjfPQfdrtrUUf94Sa4apCKtZEDb4tFEJUr1RddG14GJ+
 EwK90S540DVO28dym+ui2g8i049rvdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683900709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydLEuMH6Q4HTzouXEzh3ffWo7WbVbxJ/YWBzl41PxpY=;
 b=bRa2+Zxf3m/XXho/ps4Z/o1itfzhkggmBCME325erSATMq38914nCiNwKqLbcI19nh08dy
 mLGSNLTgcTTpBVCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C68413499;
 Fri, 12 May 2023 14:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gaGLGSVJXmSlVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 14:11:49 +0000
Message-ID: <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
Date: Fri, 12 May 2023 16:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aQPYGfBsLpt0kHaesI84l3Ql"
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aQPYGfBsLpt0kHaesI84l3Ql
Content-Type: multipart/mixed; boundary="------------SEPFe70FiBqnC203fUCrFPq1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: javierm@redhat.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, jose.exposito89@gmail.com
Message-ID: <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
In-Reply-To: <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>

--------------SEPFe70FiBqnC203fUCrFPq1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDUuMjMgdW0gMTU6MjAgc2NocmllYiBMaW51cyBXYWxsZWlqOg0KPiBT
b3JyeSBmb3IgbGF0ZSByZWdyZXNzaW9uIGRldGVjdGlvbiBidXQgdGhpcyBwYXRjaCByZWdy
ZXNzZXMNCj4gdGhlIEludGVncmF0b3IgQUIgSU1QRC0xIGdyYXBoaWNzLCBJIGJpc2VjdGVk
IGRvd24gdG8gdGhpcw0KPiBwYXRjaC4NClsuLi5dDQo+IFRoaXMgaXMgdGhlIGRyaXZlcjoN
Cj4gZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX3ZlcnNhdGlsZS5jDQo+IHdpdGggdGhl
IHBsMTEwX2ltcGQxIHZhcmlhbnQsIHNvIHRoZXNlIGFyZSB0aGUgc3VwcG9ydGVkIG1vZGVz
Og0KPiANCj4gLyogUEwxMTAgcGl4ZWwgZm9ybWF0cyBmb3IgSW50ZWdyYXRvciwgdmFuaWxs
YSBQTDExMCAqLw0KPiBzdGF0aWMgY29uc3QgdTMyIHBsMTEwX2ludGVncmF0b3JfcGl4ZWxf
Zm9ybWF0c1tdID0gew0KPiAgICAgICAgICBEUk1fRk9STUFUX0FCR1I4ODg4LA0KPiAgICAg
ICAgICBEUk1fRk9STUFUX1hCR1I4ODg4LA0KPiAgICAgICAgICBEUk1fRk9STUFUX0FSR0I4
ODg4LA0KPiAgICAgICAgICBEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiAgICAgICAgICBEUk1f
Rk9STUFUX0FCR1IxNTU1LA0KPiAgICAgICAgICBEUk1fRk9STUFUX1hCR1IxNTU1LA0KPiAg
ICAgICAgICBEUk1fRk9STUFUX0FSR0IxNTU1LA0KPiAgICAgICAgICBEUk1fRk9STUFUX1hS
R0IxNTU1LA0KPiB9Ow0KPiAoLi4uKQ0KPiAvKg0KPiAgICogVGhlIElNLVBEMSB2YXJpYW50
IGlzIGEgUEwxMTAgd2l0aCBhIGJ1bmNoIG9mIGJyb2tlbiwgb3Igbm90DQo+ICAgKiB5ZXQg
aW1wbGVtZW50ZWQgZmVhdHVyZXMNCj4gICAqLw0KPiBzdGF0aWMgY29uc3Qgc3RydWN0IHBs
MTExX3ZhcmlhbnRfZGF0YSBwbDExMF9pbXBkMSA9IHsNCj4gICAgICAgICAgLm5hbWUgPSAi
UEwxMTAgSU0tUEQxIiwNCj4gICAgICAgICAgLmlzX3BsMTEwID0gdHJ1ZSwNCj4gICAgICAg
ICAgLmJyb2tlbl9jbG9ja2RpdmlkZXIgPSB0cnVlLA0KPiAgICAgICAgICAuYnJva2VuX3Zi
bGFuayA9IHRydWUsDQo+ICAgICAgICAgIC5mb3JtYXRzID0gcGwxMTBfaW50ZWdyYXRvcl9w
aXhlbF9mb3JtYXRzLA0KPiAgICAgICAgICAubmZvcm1hdHMgPSBBUlJBWV9TSVpFKHBsMTEw
X2ludGVncmF0b3JfcGl4ZWxfZm9ybWF0cyksDQo+ICAgICAgICAgIC5mYl9icHAgPSAxNiwN
Cj4gfTsNCj4gDQo+IE5vdGljZSB0aGUgYWJzZW5jZSBvZiBSR0I1NjUhDQo+IFRoZW4gd2Ug
aW5pdGlhbGl6ZWQgdGhlIGZyYW1idWZmZXIgbGlrZSB0aGlzOg0KPiANCj4gICAgICAgICAg
ZHJtX2ZiZGV2X2RtYV9zZXR1cChkcm0sIHByaXYtPnZhcmlhbnQtPmZiX2JwcCk7DQo+IA0K
PiBBbmQgYXMgeW91IHNlZSBwcml2LT52YXJpYW50LT5mYl9icHAgd2lsbCBiZSAxNiwgc28g
d2Ugd2FudCBzb21lDQo+IDE2YnBwIG1vZGUgaG93ZXZlciB0aGUgb25seSBzdXBwb3J0ZWQg
ZGVwdGggaXMgMTUgKHRoZSAxNTU1IG1vZGVzKQ0KPiBzbyBpdCB3b3VsZCB1c2UgdGhhdCBi
eSBzY2FsaW5nIGJhY2sgZGVwdGggdG8gMTUuDQo+IA0KPiBIb3dldmVyIGFmdGVyIHRoaXMg
cGF0Y2ggdGhhdCBkb2Vzbid0IHdvcmsgYW55bW9yZS4NCj4gDQo+IEFueSBoaW50cyBvbiBo
b3cgd2UgY2FuIGZpeCB0aGlzPw0KDQpBY2NvcmRpbmcgdG8gYSBxdWljayBncmVwIGZvciBm
Yl9icHAsIGl0J3Mgb25seSB1c2VkIGZvciB0aGUgY2FsbCB0byANCmRybV9mYmRldl9kbWFf
c2V0dXAoKSwgcmlnaHQ/IEluIHRoaXMgY2FzZSwgeW91IHNob3VsZCBzZXQgaXQgdG8gMTUg
Zm9yIA0KdGhlIG1vZGVscyB3aXRob3V0IHJnYjU2NS4gVGhlIHN3aXRjaCBhdCBbMV0gc2hv
dWxkIHRoZW4gcGljayB0aGUgDQpjb3JyZWN0IHZhbHVlcy4NCg0KVGhlIHByZWZlcnJlZF9i
cHAgcGFyYW1ldGVyIGhhZCBhIGNoYW5nZSBpbiBzZW1hbnRpY3MuIEl0IHVzZWQgdG8gYmUg
dGhlIA0KbnVtYmVyIG9mIGJpdHMgcGVyIHBpeGVsLiBCdXQgdGhhdCBtYWtlcyBpdCBoYXJk
IHRvIHNlbGVjdCBiZXR3ZWVuIA0KUkdCMTU1NSBhbmQgUkdCNTY1LiAgU28gaXQncyBub3cg
YSBzcGVjaWFsIGNvbG9yLW1vZGUgdmFsdWUgdGhhdCB3b3JrcyANCmxpa2UgdGhlIGtlcm5l
bCdzIHZpZGVvPSBwYXJhbWV0ZXIuIFZhbHVlcyBvZiAxNSBhbmQgMzIgYXJlIGRpZmZlcmVu
dCANCmZyb20gdGhlIHJlc3QuIFRoYXQgc3dpdGNoIGF0IFsxXSBleHBsYWlucyBpdC4gTWF5
YmUgeW91IHNob3VsZCByZW5hbWUgDQpmYl9icHAgdG8gY29sb3JfbW9kZSBmb3IgY2xhcml0
eS4NCg0KTGV0IG1lIGtub3cgaWYgdGhpcyBoZWxwcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNC1yYzEv
c291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMjTDE4MjcNCg0KPiANCj4g
WW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------SEPFe70FiBqnC203fUCrFPq1--

--------------aQPYGfBsLpt0kHaesI84l3Ql
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmReSSQFAwAAAAAACgkQlh/E3EQov+BG
PxAAh+4VYzZYon+52voV6lC8a8wt2D6QAP4+hsJ5N6CoS/F2pGYkVa73njRwUGbcRl524ShYDPdW
iQaGov3vKGzB33y5xhyuTOU/44rXR4a4GBwMssPwp86jzrXPpDLYjUKUC/sFv8jJuDosBsu3Rq9t
zWkyasiHrgzmLaqq6yS4jgWtwgW/55va5XN5u90Py8pUQ89bXaXHSSW1JO7xXq7Orx8w+pSIji2v
xKOU/ZUhlWvdF1n8BSz0wEgLRf68FHGLMzDlYYwL5+1rTEHSaB4+tv1nrdRdTF38x1iPWdycxttp
PCVc5PYWluRNQhLka2CGs+/NXUzrYPnLzUNOsXR4q1QZXJoDBitBYmm6WVokiDO/EyXzsArc8TLd
mfZXI2Or9TDQ04vNWrR7m2L9kKs0fHmlnBc9wpxVJwbeVQtbFnOOds2ZReSBA5pbuwFmP+kHIh99
3bZritIfOTAwo2MO0xicmg2s0RxgaZ+gZd1VsHY3IKsi5/wLiqZ8iuNmEEt2lrrnlj4yHhZjzhkP
QHsRjthrPUedlBgAq7VbCJ8XN/3NIkmCbKkaikTg/d0RkZuvFc0MczVkDolrtY4lBwckIoiEtk4v
OICb+Mz1PN9JgK/V3zo9qveRVBsL9rkE1PIkTUO2FbkK8fXEZiJUJQry17GqDOnmLIkNHnej7t+6
qLc=
=cVkr
-----END PGP SIGNATURE-----

--------------aQPYGfBsLpt0kHaesI84l3Ql--

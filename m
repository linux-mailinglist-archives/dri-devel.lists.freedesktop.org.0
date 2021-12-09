Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD62046EE72
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E27010E796;
	Thu,  9 Dec 2021 16:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE3010E118
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 10:17:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E57D81F37B;
 Thu,  9 Dec 2021 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639045022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cGDbsYISJh7h/2Ta+ndn57DC4dVJs1oqn6ICJc3IZw4=;
 b=CAQvlYwWKyPwk36NhGY+4+gffauG+BPi2yv+buLVo0SVmbsFtfhJpypL0pD71vwq2fnOSP
 GP7yGRNYQ0v/viEmvUNSczVm7J2cNjQvUEy2BD0hGBFuS6BBUnu7OmfbmOh2TOaT8e4uis
 CcEQzaP7NHpbpI12zVi20Rs4vRo/HL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639045022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cGDbsYISJh7h/2Ta+ndn57DC4dVJs1oqn6ICJc3IZw4=;
 b=0nFYhy/dNkAyduMnjUKGMrYjx+dXy7JUvDOklkfQudPTMEylFYZiy2bUwMfnU7mLeIbvA5
 Bez1vatrdVOU46Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC4D013B2D;
 Thu,  9 Dec 2021 10:17:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hi8JKZ7XsWHSJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Dec 2021 10:17:02 +0000
Message-ID: <747be2bc-e0a4-81fc-4f28-607d44525c52@suse.de>
Date: Thu, 9 Dec 2021 11:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Hector Martin <marcan@marcan.st>
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-2-marcan@marcan.st>
 <CAL_Jsq+G4mv9Xuy1B--TvJNcNv0z3pRZAQPkA-T+aF8rZMrjkA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAL_Jsq+G4mv9Xuy1B--TvJNcNv0z3pRZAQPkA-T+aF8rZMrjkA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c7IHT9aEvAIVFTQ02gTZrBtu"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c7IHT9aEvAIVFTQ02gTZrBtu
Content-Type: multipart/mixed; boundary="------------kWj606jlJ7pD7bie8TPb6ZkY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Message-ID: <747be2bc-e0a4-81fc-4f28-607d44525c52@suse.de>
Subject: Re: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-2-marcan@marcan.st>
 <CAL_Jsq+G4mv9Xuy1B--TvJNcNv0z3pRZAQPkA-T+aF8rZMrjkA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+G4mv9Xuy1B--TvJNcNv0z3pRZAQPkA-T+aF8rZMrjkA@mail.gmail.com>

--------------kWj606jlJ7pD7bie8TPb6ZkY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTIuMjEgdW0gMTg6NDkgc2NocmllYiBSb2IgSGVycmluZzoNCj4gT24g
VHVlLCBEZWMgNywgMjAyMSBhdCAxOjMxIEFNIEhlY3RvciBNYXJ0aW4gPG1hcmNhbkBtYXJj
YW4uc3Q+IHdyb3RlOg0KPj4NCj4+IFRoaXMgY29kZSBpcyByZXF1aXJlZCBmb3IgYm90aCBz
aW1wbGVmYiBhbmQgc2ltcGxlZHJtLCBzbyBsZXQncyBtb3ZlIGl0DQo+PiBpbnRvIHRoZSBP
RiBjb3JlIGluc3RlYWQgb2YgaGF2aW5nIGl0IGFzIGFuIGFkLWhvYyBpbml0Y2FsbCBpbiB0
aGUNCj4+IGRyaXZlcnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSGVjdG9yIE1hcnRpbiA8
bWFyY2FuQG1hcmNhbi5zdD4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL29mL3BsYXRmb3JtLmMg
ICAgICAgICAgfCAgNSArKysrKw0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZi
LmMgfCAyMSArLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL29mL3BsYXRmb3JtLmMgYi9kcml2ZXJzL29mL3BsYXRmb3JtLmMNCj4+IGluZGV4
IGIzZmFmODk3NDRhYS4uZTA5N2Y0MGIwM2MwIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9v
Zi9wbGF0Zm9ybS5jDQo+PiArKysgYi9kcml2ZXJzL29mL3BsYXRmb3JtLmMNCj4+IEBAIC01
NDAsNiArNTQwLDExIEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX2RlZmF1bHRf
cG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4gICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChu
b2RlKTsNCj4+ICAgICAgICAgIH0NCj4+DQo+PiArICAgICAgIGZvcl9lYWNoX2NoaWxkX29m
X25vZGUob2ZfY2hvc2VuLCBub2RlKSB7DQo+PiArICAgICAgICAgICAgICAgaWYgKG9mX2Rl
dmljZV9pc19jb21wYXRpYmxlKG5vZGUsICJzaW1wbGUtZnJhbWVidWZmZXIiKSkNCj4gDQo+
IG5vZGUgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChvZl9jaG9zZW4sICJzaW1wbGUtZnJh
bWVidWZmZXIiKTsNCj4gb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZShub2RlLCBOVUxMLCBO
VUxMKTsNCj4gb2Zfbm9kZV9wdXQobm9kZSk7DQo+IA0KPiBQbGVhc2UgQ2MgdGhlIERUIGxp
c3QuIExvb2tzIGxpa2UgdGhpcyBwYXRjaCBjYW4gYmUgYXBwbGllZA0KPiBpbmRlcGVuZGVu
dGx5LiAoQmV0dGVyIGdldCB0aGUgb3RoZXIgMiBpbnRvIGRybS1taXNjIHNvb24gb3IgaXQg
d2lsbA0KPiBtaXNzIDUuMTcpLg0KDQpDYW4gd2UgbWVyZ2UgdGhlIHdob2xlIHBhdGNoc2V0
IHRocm91Z2ggZHJtLW1pc2M/IFBhdGNoZXMgMiBhbmQgMyBhcmUgDQp1c2VsZXNzIHdpdGhv
dXQgdGhlIGZpcnN0IG9uZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUm9i
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------kWj606jlJ7pD7bie8TPb6ZkY--

--------------c7IHT9aEvAIVFTQ02gTZrBtu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGx154FAwAAAAAACgkQlh/E3EQov+CE
tg/+P0rnIqemk1osoaMFBeCnCR5EqRWUX5DVmrLD1A8fuFhIYxQYecNmQwd4WXCFqqHEye8shCIs
rCTlVtNjlp8qodAaCIJ2g9ezu4bQNa7z/sYCtuH/qgn0Zx+oKZI84RVrmAAfJYpgzf5+Q0la4yjs
0D6kPR72NeuiOQM+9zp2Y9usF3y4vc0UiXD3QtfGmNJs5/V+d5tVBTF0ZQ7qUp+3Iqtw/Vi8v4B5
xObmUIcrAtJUtEMIHgyU6x/dHDXldWnE5DoUk2Os8LpCCVn2lYKks/f0MlvxR5ueKL5VEAnGYShX
f+EiXRUv6Lu4zTfetvmLOhZ94SERtdzXbA0bsOckl1JsIzq+OQDTXhxWuBAkgGe/wSvVg3mzBRAB
EoXAdbL65B+a+5euSRob8Qu3LNEaot/bDAEIddwCCTn913tmj0ivXuw27jAHohTLQ4P5zlWSzRMS
rO8x6nymwj/e3uE4DudizuFsrx/zJyesI8qJiWJC0fnBVtBDtiB/CPG1PAujSu1SX9oVuedWrI+Q
wAxNblABElDTOgt6CzlWyHbKztNs9TCj0DZqTlkihGCYXIAE9bP8f+m6gLcSB75zAt0275iMgj68
cl5sk8V1T6+LQwxiaiSekpnYSfqvahzoorQ7vW210tZ10BpaGwZvSO8o1CXu5vw6qdtrOoYIn1FN
sNA=
=1bk9
-----END PGP SIGNATURE-----

--------------c7IHT9aEvAIVFTQ02gTZrBtu--

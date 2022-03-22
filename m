Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB04E46B0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9005A10E2A5;
	Tue, 22 Mar 2022 19:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF88710E29C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:30:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8EEE91F387;
 Tue, 22 Mar 2022 19:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647977431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xi014/Obdhb6vt51ZFmU/LykmbDAx81t7crdlxng+rY=;
 b=oeWZIBmNVt8Bu1DZWBi74JiqEIsYjjqA7kUtY1LJTQTPnR9GvmTNy9uDct/m0LNEalFnJG
 VEO58+hYbddOP76xPDtQsRS7dscWcEhpBBbXpkJtor4ukbPOCo/3/YeccrXaqpXdZn1tq9
 Yt/WrCBM7u9BJNSMcPhPhJZSZZdINio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647977431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xi014/Obdhb6vt51ZFmU/LykmbDAx81t7crdlxng+rY=;
 b=I6yBKkmXkJI6SuRt9xUgKm1vFuNgMQ3c72puwpU1hLN7UHMoxFhEN0iqdohFs7p2HSZ6Bt
 xkTdM76r/5j9YRBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E9F313419;
 Tue, 22 Mar 2022 19:30:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XKRHFdcjOmIGMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Mar 2022 19:30:31 +0000
Message-ID: <3186b184-fa62-9bc4-7531-8ad4eac139ef@suse.de>
Date: Tue, 22 Mar 2022 20:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/7] drm/gma500: Use managed drmm_mode_config_init()
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g2ToksLjjGK3Gpk2wzweWHOJ"
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g2ToksLjjGK3Gpk2wzweWHOJ
Content-Type: multipart/mixed; boundary="------------a7Bsth9zGBwHq4JS7SH6OwKI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, daniel.vetter@ffwll.ch
Message-ID: <3186b184-fa62-9bc4-7531-8ad4eac139ef@suse.de>
Subject: Re: [PATCH 1/7] drm/gma500: Use managed drmm_mode_config_init()
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>

--------------a7Bsth9zGBwHq4JS7SH6OwKI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF0cmlrDQoNCkFtIDIyLjAzLjIyIHVtIDE0OjE3IHNjaHJpZWIgUGF0cmlrIEpha29i
c3NvbjoNCj4gU2lnbmVkLW9mZi1ieTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFr
b2Jzc29uQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9m
cmFtZWJ1ZmZlci5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1l
YnVmZmVyLmMNCj4gaW5kZXggNDVkZjlkZTIyMDA3Li4yYjk5Yzk5NmZkYzIgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMNCj4gQEAgLTUxNCw3ICs1MTQs
OCBAQCB2b2lkIHBzYl9tb2Rlc2V0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4g
ICAJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldi0+ZGV2KTsNCj4gICAJ
aW50IGk7DQo+ICAgDQo+IC0JZHJtX21vZGVfY29uZmlnX2luaXQoZGV2KTsNCj4gKwlpZiAo
ZHJtbV9tb2RlX2NvbmZpZ19pbml0KGRldikpDQo+ICsJCXJldHVybjsNCg0KVGhpcyB3aWxs
IGZhaWwgd2l0aG91dCBhbnkgbm90aWNlLiBJIHN1Z2dlc3QgdG8gcmV0dXJuIGFuIGVycm9y
IGhlcmUgb3IgDQphdCBsZXQgcHNiX2RyaXZlcl9sb2FkKCkgZmFpbC4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiAgIA0KPiAgIAlkZXYtPm1vZGVfY29uZmlnLm1pbl93aWR0aCA9
IDA7DQo+ICAgCWRldi0+bW9kZV9jb25maWcubWluX2hlaWdodCA9IDA7DQo+IEBAIC01NDYs
NiArNTQ3LDUgQEAgdm9pZCBwc2JfbW9kZXNldF9jbGVhbnVwKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpDQo+ICAgCWlmIChkZXZfcHJpdi0+bW9kZXNldCkgew0KPiAgIAkJZHJtX2ttc19o
ZWxwZXJfcG9sbF9maW5pKGRldik7DQo+ICAgCQlwc2JfZmJkZXZfZmluaShkZXYpOw0KPiAt
CQlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkZXYpOw0KPiAgIAl9DQo+ICAgfQ0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------a7Bsth9zGBwHq4JS7SH6OwKI--

--------------g2ToksLjjGK3Gpk2wzweWHOJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmI6I9YFAwAAAAAACgkQlh/E3EQov+D0
EQ/7B3xefpidHAtO6ngNoGQfAa3x8BP6zQ41olqUqcbKiZW9aLiIT7Pjnwvu7D2dvG0K73ZLgnPV
Xc7GSJKXCRKuXGM0uqCfyaldTaJ0HlA+g9qm3nx/WBXTkKj2FYj6w+ax673UKmspYUJtRJKGwHbp
R+PnvMej3ebmC6+aKOeC0gxI+tHzOMjTCbisSbKW4rr1yDMnX7V2Fi5W/7tvjVhILfvMGwXKBgXj
1KfYrxM/RjXRT7baOwcj03CCMsOAYSikJGHXXYIM3W9pdfzSdrm4XoUfrCT7HJ8SEWQOQqEbZH7t
aN3OAuaNUhLWDzoEColQZ++A+FxYrtMZgYZbWluaWQKOPvIdD9LlVyptUy4yKDV4N3vSqbrdKvNa
Rnv83ar3bVBXd+AvMp7Mr0KnABZfjUknYnNXqfwt15v20858IPi0csNfAxzWzIXIRYKvOJk7upMY
VTp1ZVhU+5Hyb1Vjuu9TOuF9IAKspVAAgr4cpe1s7qk3oOZ2OobH859J67iHr4w5ch0P2DRFQ80R
urfwQ6ApgdMTc5cwZtK0ufNj8VwzNkF/cBbVWxfU7I/8iJFY91+x+GwLM2XFS2B+ReVc4Pl6pP9p
XFRJpuGnnX5/4HVzsMaY8gu2gJIS4MRFMK6ZrEuown9JU9aXagHyETNRNfZtYsxyoQiQzAjHlaXa
esI=
=VhJw
-----END PGP SIGNATURE-----

--------------g2ToksLjjGK3Gpk2wzweWHOJ--

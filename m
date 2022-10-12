Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC7B5FC144
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A27710E1F7;
	Wed, 12 Oct 2022 07:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB30F10E1F7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 07:28:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A1B81F8AC;
 Wed, 12 Oct 2022 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665559712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yhkz+vC1osE7CDWPxUtmihbluXSrxTfokq3FTnRU+GE=;
 b=FBSy/1736auVkQUhMnA5sPjg43U7GF9Blxdjlz3jdOt7axvl/uADJMKe8WJHjii3h0BIkQ
 PkRfCpFavCDhgI17tdQL7Wr5cRW2jEa2Rz8imnjQUQkpXlM6EniI1n0Zn+mIQ7XUCHBith
 VDzWj2wyrnl22F5eGh5OD3ptYL20Wwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665559712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yhkz+vC1osE7CDWPxUtmihbluXSrxTfokq3FTnRU+GE=;
 b=XnXWIqjtLtccZ48zAF7WRfwNKShLtFJXLtkB+rzFMgG2EsQ4cesh9eUVP1fH1ZfGO8li7K
 cI5fFImRPDLOkdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04BC613A5C;
 Wed, 12 Oct 2022 07:28:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id omEgAKBsRmNkPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Oct 2022 07:28:32 +0000
Message-ID: <ef380e11-981a-9bdc-b6f0-4c392cb6acb1@suse.de>
Date: Wed, 12 Oct 2022 09:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/4] drm/mgag200: Do not call
 drm_atomic_add_affected_planes()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20221011165136.469750-1-javierm@redhat.com>
 <20221011165136.469750-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221011165136.469750-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6ICbkyX0ltADwlsuXipA07sa"
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6ICbkyX0ltADwlsuXipA07sa
Content-Type: multipart/mixed; boundary="------------l4ubzyQn3del5xhBJ6Ag0kl0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <ef380e11-981a-9bdc-b6f0-4c392cb6acb1@suse.de>
Subject: Re: [PATCH v2 1/4] drm/mgag200: Do not call
 drm_atomic_add_affected_planes()
References: <20221011165136.469750-1-javierm@redhat.com>
 <20221011165136.469750-2-javierm@redhat.com>
In-Reply-To: <20221011165136.469750-2-javierm@redhat.com>

--------------l4ubzyQn3del5xhBJ6Ag0kl0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjEwLjIyIHVtIDE4OjUxIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGVyZSdzIG5vIG5lZWQgdG8gYWRkIHBsYW5lcyB0byB0aGUgYXRvbWljIHN0
YXRlLiBSZW1vdmUgdGhlIGNhbGwNCj4gdG8gZHJtX2F0b21pY19hZGRfYWZmZWN0ZWRfcGxh
bmVzKCkgZnJvbSBtZ2FnMjAwLg0KPiANCj4gT24gZnVsbCBtb2Rlc2V0cywgdGhlIERSTSBo
ZWxwZXJzIGFscmVhZHkgYWRkIGEgQ1JUQydzIHBsYW5lcyB0byB0aGUNCj4gYXRvbWljIHN0
YXRlOyBzZWUgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfbW9kZXNldCgpLiBUaGVyZSdzIG5v
IHJlYXNvbg0KPiB0byBjYWxsIGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcygpIHVu
Y29uZGl0aW9uYWxseSBpbiB0aGUgQ1JUQydzDQo+IGF0b21pY19jaGVjaygpIGluIG1nYWcy
MDAuIEl0J3MgYWxzbyB0b28gbGF0ZSwgYXMgdGhlIGF0b21pY19jaGVjaygpDQo+IG9mIHRo
ZSBhZGRlZCBwbGFuZXMgd2lsbCBub3QgYmUgY2FsbGVkIGJlZm9yZSB0aGUgY29tbWl0Lg0K
PiANCj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZp
ZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+IChubyBjaGFuZ2VzIHNpbmNlIHYx
KQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDIg
Ky0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21v
ZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+IGluZGV4
IDVmN2ViNjQyZjBjNi4uNzU4NjI5ZGE5NWQ5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiBAQCAtNjAxLDcgKzYwMSw3IEBAIGludCBtZ2Fn
MjAwX2NydGNfaGVscGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0
cnVjdCBkcm1fYXRvbWljX3N0DQo+ICAgCQl9DQo+ICAgCX0NCj4gICANCj4gLQlyZXR1cm4g
ZHJtX2F0b21pY19hZGRfYWZmZWN0ZWRfcGxhbmVzKG5ld19zdGF0ZSwgY3J0Yyk7DQo+ICsJ
cmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAgIHZvaWQgbWdhZzIwMF9jcnRjX2hlbHBlcl9h
dG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqb2xkX3N0YXRlKQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------l4ubzyQn3del5xhBJ6Ag0kl0--

--------------6ICbkyX0ltADwlsuXipA07sa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNGbJ8FAwAAAAAACgkQlh/E3EQov+D3
WRAAo0PE1gwXEuGb7Zrs1qX/JjDqll0fLBaxphAdNfTsF5RVqLkWgDxNRN+d/MgU163JVTBbmcnh
NisKZ6shG4Lx8o+ZofA0noghWu330l4Obt4IHKCouegR/M2Vv4AWYH9YN9q2MT2RIObdzYc5YM/7
WwpIVKbvarOuwoOPCmP4GPo8pOjDaFwh3cbXG1KQ7e64nYkw8tC3jh0bnCRxCQ9aaBckJ1FYmNFC
dRBHVqSXDrDZ6W+FI3EY1sbvGblaLCC2kFIgzVxSjK7DedQBxoO5eGnFVI0QWtnigmyRdXQZmSp0
ar8zRdifo/u1Id+3fBIHxaXDdr0dkwYhJOsVX+Ep5EtnORxolIYTe+y8nJ2LBLsttFGqkMVBoMSE
gtTC9OvekDopo8C4dArMlexUX6Uf4Ri2tW3RTKccAqhnUFE3CCHJDh75M8MgIhxvoUQuKsnGzhRg
AXIikSVAhSAY/oD35ufBdclPsf6spzlmJ/RV9hF9eMmL4C9OCdLD/15s9K43/41OV6uy2bzXfsER
cHl7mdHJFNSsNQTw6XxN8nHSYBIOkbc0n9GahQw8t+5bluNagJiszjxRs+F/abmlNkcFOliBA/6F
/rUJvMZuWN6+Aja1QM9CKVpKmjN4CC4mc0/cXx8+cM2rpArsuG5R1JrN2sqicCZCZ32vveMwCxcp
9D8=
=oEOw
-----END PGP SIGNATURE-----

--------------6ICbkyX0ltADwlsuXipA07sa--

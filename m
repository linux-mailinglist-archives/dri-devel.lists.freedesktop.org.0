Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC336775DE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 08:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A33110E24A;
	Mon, 23 Jan 2023 07:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9B110E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:57:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5475F3369B;
 Mon, 23 Jan 2023 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674460645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzSsr1XN35HEb93/46fFjYB7VM6WJYfMudGBlrSGePQ=;
 b=0YXkQeGe9/Z7ukb7snfC81qceNT4DNfVkBwKqZcOpaaA/FOW7VnF7nbP9n8X1WLaUxpI13
 SH6CACyw1JMdTGilo9iYS5B92aACwdYgVYEh0IEe9PrszXLzhmq6rTLbLA0aU0HxuD8W78
 mdYa5SSoG2jIIu2cJp3V0+Q5TP0pNW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674460645;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzSsr1XN35HEb93/46fFjYB7VM6WJYfMudGBlrSGePQ=;
 b=YOF6K4c+p+2y74oL26iNv8yy3+cU9T/Z/U2QQIYVco1y26sUNiK6UvYRUU2kNHNGA0o5ld
 lWTEitAs6GC2chAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40D08134F5;
 Mon, 23 Jan 2023 07:57:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id l9naDuU9zmNtQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 07:57:25 +0000
Message-ID: <2d2cd648-79f5-d300-3054-ee7c863edec2@suse.de>
Date: Mon, 23 Jan 2023 08:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/86] drm/komeda: Direct include headers from drm_print
To: sam@ravnborg.org, dri-devel@lists.freedesktop.org
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-1-c5cf72d8a5a2@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230113-drm-include-v1-v1-1-c5cf72d8a5a2@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------57PkyiiV4gDho9e2WAf22SiP"
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
--------------57PkyiiV4gDho9e2WAf22SiP
Content-Type: multipart/mixed; boundary="------------kIpHhnrFuAAnT0I0XJv2Q0nn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, dri-devel@lists.freedesktop.org
Message-ID: <2d2cd648-79f5-d300-3054-ee7c863edec2@suse.de>
Subject: Re: [PATCH 01/86] drm/komeda: Direct include headers from drm_print
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-1-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-1-c5cf72d8a5a2@ravnborg.org>

--------------kIpHhnrFuAAnT0I0XJv2Q0nn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDIxLjAxLjIzIHVtIDIxOjA3IHNjaHJpZWIgU2FtIFJhdm5ib3JnIHZp
YSBCNCBTdWJtaXNzaW9uIEVuZHBvaW50Og0KPiBGcm9tOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+DQo+IA0KPiBEaXJlY3QgaW5jbHVkZSB0aGUgaGVhZGVycyB0aGF0IG90
aGVyd2lzZSBjb21lcyBpbmRpcmVjdCBmcm9tDQoNClRoZSBncmFtbWFyIGluIHRoaXMgc2Vu
dGVuY2UgaXMgc2xpZ2h0bHkgb2ZmIGF0ICdkaXJlY3QgaW5jbHVkZScgYW5kIA0KJ2hlYWRl
cnMgdGhhdCBbLi4uXSBjb21lcycuICBJJ2Qgd3JpdGUgJ0RpcmVjdGx5IGluY2x1ZGUgaGVh
ZGVyIGZpbGVzIA0KdGhhdCBjdXJyZW50bHkgY29tZSBmcm9tIGRybV9wcmludC5oLicgIEZp
eGVzIHRoZSBhZHZlcmIvYWRqZWN0aXZlIGlzc3VlIA0KYW5kIGlzIGZhaXJseSBuZXV0cmFs
IHdoZXRoZXIgJ2hlYWRlcnMnIHJlZmVycyB0byBzaW5ndWxhciBvciBwbHVyYWwuDQoNClVu
Zm9ydHVuYXRlbHkgdGhhdCBpc3N1ZSBpcyBpbiB0aGUgZmlyc3QgODMgcGF0Y2hlcy4gOigN
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiBkcm1fcHJpbnQuaCwgYmVjYXVzZSBkcm1f
cHJpbnQuaCB3aWxsIGJlIHJlZHVjZWQgdG8NCj4gaW5jbHVkZSBvbmx5IHRoZSBtaW5pbWFs
IHNldCBvZiBoZWFkZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgfCAyICsrDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyAgIHwgMSArDQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50
LmMNCj4gaW5kZXggNDI1MTBmZGVhMjdlLi44NzU3MzFhOGFlOTAgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
Y29tcG9uZW50LmMNCj4gQEAgLTQsNiArNCw4IEBADQo+ICAgICogQXV0aG9yOiBKYW1lcy5R
aWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPg0KPiAgICAqDQo+ICAgICovDQo+
ICsjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4NCj4gKw0KPiAgICNpbmNsdWRlICJkNzFf
ZGV2LmgiDQo+ICAgI2luY2x1ZGUgImtvbWVkYV9rbXMuaCINCj4gICAjaW5jbHVkZSAibWFs
aWRwX2lvLmgiDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYw0KPiBpbmRleCA0YjdkOTQ5NjE1MjcuLjAwZjU4
NjRhMDQ5NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfcGlwZWxpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jDQo+IEBAIC01LDYgKzUsNyBAQA0KPiAg
ICAqDQo+ICAgICovDQo+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ICsjaW5jbHVkZSA8
bGludXgvc2VxX2ZpbGUuaD4NCj4gICANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5o
Pg0KPiAgIA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------kIpHhnrFuAAnT0I0XJv2Q0nn--

--------------57PkyiiV4gDho9e2WAf22SiP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPOPeQFAwAAAAAACgkQlh/E3EQov+CT
/Q/+N2hu2Gi+54GUp55hd8ktUho2IwI+pEtJcfd7PsWDudHvKb/VNv2CblzmXluGrD3TL3JfvZz6
fTS5yS6ShCwfreDakj8UMJgjTDdOj4UGF9USe9V10TqijJtKYb93KiVwpfXywDKSKnYrFLvbPnML
3MDA/Lg0AkOWhUGVQ7mR2Vj+E20lYHH3VqszaOdsXZQKl/4wWxCxXNn2g6HyMsysEowhbj5HGWxc
YpiD3fy59JYBpcLVvfh+/r6DiL2V32fMI2MJ8hnJ/9/YBpMrR/+iwF83Vrlx/+PIgLH8c0GMEp4+
RXI2nO7pj1LD6U+uVz0B9HGHGalBCNYews9GUfIaU9Zoa8IAMQC0sgm573KbzKwo95g+zN62H2/g
/v8+ChWNMqfo94IuHc6snVSgCYc9Zr6MWZKzr147yu8Vn67HW2lDX1CrzwdU8LE4QwZWt0JrMi4q
YVPGH2+BFVKtPjVBlUuxRi1wQV7kZYxTtWILAiSZ2VHTJMFpxkvqI+1/tsFbVeKJCN7Ty/qK4VGP
C0JY6Ey/m3HHNhTISjbTovFG57Lb4hkJyHfChw3UUtC5P6wvw0ZjCqDxdWDxqPF4i3RKDUqzQHdD
y8RNMZ/poZ+C3Aol8u4DURx8YVl9ZkPAghSKpyARnQLmm0eBpkjj/O2bhlotFwIwngS0M1GkoW3T
9Qk=
=yWXN
-----END PGP SIGNATURE-----

--------------57PkyiiV4gDho9e2WAf22SiP--

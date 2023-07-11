Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53674EB09
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878BC10E355;
	Tue, 11 Jul 2023 09:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D8A10E354
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:44:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F560204EA;
 Tue, 11 Jul 2023 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689068677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q3srOL8c0xgfXwAjIh0L5V7tvBfvpORU+gsZDHm4Rb0=;
 b=FIMdvW+9/UR3dSmFxG3y4ddte3TwIp5b6dAqtrO58V9/Ek7giPwjUkyjlIRWK8OscWsPRX
 KUJvcJNxB5X886xIN9z3yobhH9XKMAovbv/xVH7Zrhv1/3MAs6ZjHcihTzs+PllWQg9s8I
 OOoImnRhZBq9L6Bh9YOtNo4EFZ4xGvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689068677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q3srOL8c0xgfXwAjIh0L5V7tvBfvpORU+gsZDHm4Rb0=;
 b=f7xosZUOS9r1ERWcHze61pEHwOJjxBMtuWN22CXVaI/gi0qETZvQd7LK4TAaB9kV7yIUE7
 Il5E8OzK1XqIUDBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 191C01391C;
 Tue, 11 Jul 2023 09:44:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /kAnBYUkrWQcYgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jul 2023 09:44:37 +0000
Message-ID: <776910e1-2df5-3b1b-3897-66fc3e556f78@suse.de>
Date: Tue, 11 Jul 2023 11:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] drm/client: Fix memory leak in
 drm_client_target_cloned
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 javierm@redhat.com, yizhan@redhat.com
References: <20230711092203.68157-1-jfalempe@redhat.com>
 <20230711092203.68157-2-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230711092203.68157-2-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QrWCnbDDziUYLmQuc1PlYLSH"
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QrWCnbDDziUYLmQuc1PlYLSH
Content-Type: multipart/mixed; boundary="------------F589j74qX20vbsCSGCGQU87y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 javierm@redhat.com, yizhan@redhat.com
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Message-ID: <776910e1-2df5-3b1b-3897-66fc3e556f78@suse.de>
Subject: Re: [PATCH 1/2] drm/client: Fix memory leak in
 drm_client_target_cloned
References: <20230711092203.68157-1-jfalempe@redhat.com>
 <20230711092203.68157-2-jfalempe@redhat.com>
In-Reply-To: <20230711092203.68157-2-jfalempe@redhat.com>

--------------F589j74qX20vbsCSGCGQU87y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjA3LjIzIHVtIDExOjIwIHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPiBk
bXRfbW9kZSBpcyBhbGxvY2F0ZWQgYW5kIG5ldmVyIGZyZWVkIGluIHRoaXMgZnVuY3Rpb24u
DQo+IEl0IHdhcyBmb3VuZCB3aXRoIHRoZSBhc3QgZHJpdmVyLCBidXQgbW9zdCBkcml2ZXJz
IHVzaW5nIGdlbmVyaWMgZmJkZXYNCj4gc2V0dXAgYXJlIHByb2JhYmx5IGFmZmVjdGVkLg0K
PiANCj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGttZW1sZWFrIHJlcG9ydDoNCj4gICAg
YmFja3RyYWNlOg0KPiAgICAgIFs8MDAwMDAwMDBiMzkxMjk2ZD5dIGRybV9tb2RlX2R1cGxp
Y2F0ZSsweDQ1LzB4MjIwIFtkcm1dDQo+ICAgICAgWzwwMDAwMDAwMGU0NWJiNWIzPl0gZHJt
X2NsaWVudF90YXJnZXRfY2xvbmVkLmNvbnN0cHJvcC4wKzB4MjdiLzB4NDgwIFtkcm1dDQo+
ICAgICAgWzwwMDAwMDAwMGVkMmQzYTM3Pl0gZHJtX2NsaWVudF9tb2Rlc2V0X3Byb2JlKzB4
NmJkLzB4ZjUwIFtkcm1dDQo+ICAgICAgWzwwMDAwMDAwMDEwZTVjYzlkPl0gX19kcm1fZmJf
aGVscGVyX2luaXRpYWxfY29uZmlnX2FuZF91bmxvY2srMHhiNC8weDJjMCBbZHJtX2ttc19o
ZWxwZXJdDQo+ICAgICAgWzwwMDAwMDAwMDkwOWY4MmNhPl0gZHJtX2ZiZGV2X2NsaWVudF9o
b3RwbHVnKzB4MmJjLzB4NGQwIFtkcm1fa21zX2hlbHBlcl0NCj4gICAgICBbPDAwMDAwMDAw
MDYzYTY5YWE+XSBkcm1fY2xpZW50X3JlZ2lzdGVyKzB4MTY5LzB4MjQwIFtkcm1dDQo+ICAg
ICAgWzwwMDAwMDAwMGE4YzYxNTI1Pl0gYXN0X3BjaV9wcm9iZSsweDE0Mi8weDE5MCBbYXN0
XQ0KPiAgICAgIFs8MDAwMDAwMDA5ODdmMTliYj5dIGxvY2FsX3BjaV9wcm9iZSsweGRjLzB4
MTgwDQo+ICAgICAgWzwwMDAwMDAwMDRmY2EyMzFiPl0gd29ya19mb3JfY3B1X2ZuKzB4NGUv
MHhhMA0KPiAgICAgIFs8MDAwMDAwMDAwMGI4NTMwMT5dIHByb2Nlc3Nfb25lX3dvcmsrMHg4
YjcvMHgxNTQwDQo+ICAgICAgWzwwMDAwMDAwMDMzNzViMTdjPl0gd29ya2VyX3RocmVhZCsw
eDcwYS8weGVkMA0KPiAgICAgIFs8MDAwMDAwMDBiMGQ0M2NkOT5dIGt0aHJlYWQrMHgyOWYv
MHgzNDANCj4gICAgICBbPDAwMDAwMDAwOGQ3NzA4MzM+XSByZXRfZnJvbV9mb3JrKzB4MWYv
MHgzMA0KPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmYxMTAwMDMzMzA4OWEwMCAoc2l6ZSAx
MjgpOg0KPiANCj4gY2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiBGaXhlczogMWQ0
MmJiYzhmN2Y5ICgiZHJtL2ZiZGV2OiBmaXggY2xvbmluZyBvbiBmYmNvbiIpDQo+IFJlcG9y
dGVkLWJ5OiBaaGFuZyBZaSA8eWl6aGFuQHJlZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyB8IDUgKysrKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jbGllbnRfbW9kZXNldC5jDQo+IGluZGV4IDFiMTJhM2MyMDFhMy4uYTRhNjJhYTk5OTg0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jDQo+IEBAIC0z
MTEsNiArMzExLDkgQEAgc3RhdGljIGJvb2wgZHJtX2NsaWVudF90YXJnZXRfY2xvbmVkKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgCWNhbl9jbG9uZSA9IHRydWU7DQo+ICAgCWRt
dF9tb2RlID0gZHJtX21vZGVfZmluZF9kbXQoZGV2LCAxMDI0LCA3NjgsIDYwLCBmYWxzZSk7
DQo+ICAgDQo+ICsJaWYgKCFkbXRfbW9kZSkNCj4gKwkJZ290byBmYWlsOw0KPiArDQo+ICAg
CWZvciAoaSA9IDA7IGkgPCBjb25uZWN0b3JfY291bnQ7IGkrKykgew0KPiAgIAkJaWYgKCFl
bmFibGVkW2ldKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiBAQCAtMzI2LDExICszMjksMTMgQEAg
c3RhdGljIGJvb2wgZHJtX2NsaWVudF90YXJnZXRfY2xvbmVkKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsDQo+ICAgCQlpZiAoIW1vZGVzW2ldKQ0KPiAgIAkJCWNhbl9jbG9uZSA9IGZhbHNl
Ow0KPiAgIAl9DQo+ICsJa2ZyZWUoZG10X21vZGUpOw0KPiAgIA0KPiAgIAlpZiAoY2FuX2Ns
b25lKSB7DQo+ICAgCQlEUk1fREVCVUdfS01TKCJjYW4gY2xvbmUgdXNpbmcgMTAyNHg3Njhc
biIpOw0KPiAgIAkJcmV0dXJuIHRydWU7DQo+ICAgCX0NCj4gK2ZhaWw6DQo+ICAgCURSTV9J
TkZPKCJrbXM6IGNhbid0IGVuYWJsZSBjbG9uaW5nIHdoZW4gd2UgcHJvYmFibHkgd2FudGVk
IHRvLlxuIik7DQo+ICAgCXJldHVybiBmYWxzZTsNCj4gICB9DQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJl
cmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9u
YWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------F589j74qX20vbsCSGCGQU87y--

--------------QrWCnbDDziUYLmQuc1PlYLSH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmStJIQFAwAAAAAACgkQlh/E3EQov+AM
uA//R8qUCbL51/eXatLnNj0FkiiHOVTUHaSFbSXDNH0Xkkf6OESdIn0SXNRfcz2qGieCQbEUw5NP
axH8Ozafmu8ihZbkzv1+vMWHBLj/0pcxf8AuCjoM5aOfyS5M0XcvUtp0Imi/BI21mZKwywLDdF/H
7bNJ7UGCM86VLje5kKpLiSo6thpQ/y/SyFeCH0Bnu/31laMNvZlWjz2GH4AmSZkHYcpoObAEdh6t
SvsrNXhu72R96cTxea+ciQ5R0Ce/b99mav6EoDCk8oJERjzrwl1N0eznT9Wn54J3kfPPztuGp43+
HOxbGlRFUdv7PCj2SthcYgUIEzCnjiGTJuCuf5EZjLRp7AqiUTHd40RnQF76vMyYrjXljjThsYOv
BSqg+yTKtNc5IV24lY99cyuZ3j5aVSJqYtB1A4A3LxVh05Rnuv8DqUom+1knKLnerQEj3f/6zNwi
jKp2Xw+Ye2CmAGBzhNQqHyRAjN8LwmX84aWH1LuYr3H2U93JtwSgOxiET3LFJK+vxOsMrN4dW3bc
m1Y1R/Nk6q7KbVyzP8xMK9uD3a875n5z3FKa6B3UNqQqhY0Muo0ljYr2bO4R8ve95tip90Bg30Ff
oAOSnGqy/z7EXi+5Hw+dbSVqbCSuZH7glqjxVdp43vd1KC6inppJ+mpsAcJ3E35JtvyyHZ86QyAb
wr0=
=ZtVd
-----END PGP SIGNATURE-----

--------------QrWCnbDDziUYLmQuc1PlYLSH--
